@interface _INDataImage
+ (BOOL)supportsSecureCoding;
- (BOOL)_isEligibleForProxying;
- (BOOL)_requiresRetrieval;
- (BOOL)isEqual:(id)a3;
- (NSData)imageData;
- (_INDataImage)initWithCoder:(id)a3;
- (_INDataImage)initWithImageData:(id)a3;
- (id)_copyWithSubclass:(Class)a3;
- (id)_dictionaryRepresentation;
- (id)_identifier;
- (id)_sha256HashUUID;
- (void)_loadImageDataAndSizeWithHelper:(id)a3 accessSpecifier:(id)a4 completion:(id)a5;
- (void)_retrieveImageDataWithReply:(id)a3;
- (void)_setImageData:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _INDataImage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);

  objc_storeStrong((id *)&self->_sha256HashUUID, 0);
}

- (NSData)imageData
{
  return self->_imageData;
}

- (_INDataImage)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_INDataImage;
  v5 = [(INImage *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageData"];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v6;

    v5->_hashLock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_INDataImage;
  id v4 = a3;
  [(INImage *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageData, @"imageData", v5.receiver, v5.super_class);
}

- (id)_sha256HashUUID
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_hashLock = &self->_hashLock;
  os_unfair_lock_lock(&self->_hashLock);
  sha256HashUUID = self->_sha256HashUUID;
  if (!sha256HashUUID)
  {
    id v5 = [(_INDataImage *)self imageData];
    CC_SHA256((const void *)[v5 bytes], objc_msgSend(v5, "length"), md);
    uint64_t v6 = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:md];
    v7 = self->_sha256HashUUID;
    self->_sha256HashUUID = v6;

    sha256HashUUID = self->_sha256HashUUID;
  }
  v8 = sha256HashUUID;
  os_unfair_lock_unlock(p_hashLock);

  return v8;
}

- (BOOL)_isEligibleForProxying
{
  return 1;
}

- (void)_setImageData:(id)a3
{
  if (self->_imageData != a3)
  {
    objc_storeStrong((id *)&self->_imageData, a3);
    os_unfair_lock_lock(&self->_hashLock);
    sha256HashUUID = self->_sha256HashUUID;
    self->_sha256HashUUID = 0;

    os_unfair_lock_unlock(&self->_hashLock);
  }

  MEMORY[0x1F41817F8]();
}

- (id)_copyWithSubclass:(Class)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_INDataImage;
  id v4 = [(INImage *)&v10 _copyWithSubclass:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(_INDataImage *)self imageData];
    [v5 _setImageData:v6];
  }
  else
  {
    id v5 = 0;
  }
  if (v5) {
    v7 = v5;
  }
  else {
    v7 = v4;
  }
  id v8 = v7;

  return v8;
}

- (id)_dictionaryRepresentation
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([(NSData *)self->_imageData length])
  {
    v3 = objc_msgSend(NSString, "stringWithFormat:", @"data length: %tu", -[NSData length](self->_imageData, "length"));
  }
  else
  {
    v3 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)_INDataImage;
  id v4 = [(INImage *)&v9 _dictionaryRepresentation];
  id v5 = (void *)[v4 mutableCopy];

  objc_super v10 = @"imageData";
  uint64_t v6 = v3;
  if (!v3)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v5 addEntriesFromDictionary:v7];

  if (!v3) {

  }
  return v5;
}

- (id)_identifier
{
  v2 = [(_INDataImage *)self _sha256HashUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)_retrieveImageDataWithReply:(id)a3
{
  if (a3) {
    (*((void (**)(id, _INDataImage *, void))a3 + 2))(a3, self, 0);
  }
}

- (BOOL)_requiresRetrieval
{
  v2 = [(_INDataImage *)self imageData];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_INDataImage;
  if ([(INImage *)&v10 isEqual:v4])
  {
    id v5 = v4;
    imageData = self->_imageData;
    uint64_t v7 = v5[9];
    if (imageData)
    {
      if (v7 && (-[NSData isEqual:](imageData, "isEqual:") & 1) != 0) {
        goto LABEL_5;
      }
    }
    else if (!v7)
    {
LABEL_5:
      BOOL v8 = 1;
LABEL_9:

      goto LABEL_10;
    }
    BOOL v8 = 0;
    goto LABEL_9;
  }
  BOOL v8 = 0;
LABEL_10:

  return v8;
}

- (_INDataImage)initWithImageData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_INDataImage;
  uint64_t v6 = [(INImage *)&v9 _initWithIdentifier:0];
  uint64_t v7 = (_INDataImage *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 9, a3);
    v7->_hashLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_loadImageDataAndSizeWithHelper:(id)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v11 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v17 = "-[_INDataImage(INPortableImageLoader) _loadImageDataAndSizeWithHelper:accessSpecifier:completion:]";
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_INFO, "%s Attempting data image loading strategy with helper: %@", buf, 0x16u);
      }
      v12 = [(_INDataImage *)self imageData];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __98___INDataImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke;
      v14[3] = &unk_1E551BBD8;
      v14[4] = self;
      id v15 = v10;
      [v8 loadImageSizeFromData:v12 completion:v14];
    }
    else
    {
      v13 = [(_INDataImage *)self imageData];
      (*((void (**)(id, void *, void, void, double, double))v10 + 2))(v10, v13, 0, 0, 0.0, 0.0);
    }
  }
}

@end