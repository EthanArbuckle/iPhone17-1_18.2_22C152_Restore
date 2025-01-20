@interface LPVisualMedia
+ (BOOL)supportsSecureCoding;
- (BOOL)_canEncodeWithoutComputation;
- (BOOL)_isSubstitute;
- (BOOL)isEqual:(id)a3;
- (LPVisualMedia)init;
- (LPVisualMedia)initWithCoder:(id)a3 properties:(id)a4;
- (LPVisualMedia)initWithCoderInternal:(id)a3;
- (LPVisualMedia)initWithProperties:(id)a3;
- (LPVisualMediaProperties)properties;
- (NSData)_cachedData;
- (NSData)data;
- (NSString)MIMEType;
- (NSURL)fileURL;
- (id)_initByReferencingFileURL:(id)a3 MIMEType:(id)a4 properties:(id)a5;
- (id)_initWithData:(id)a3 MIMEType:(id)a4 properties:(id)a5;
- (id)_initWithData:(id)a3 fileURL:(id)a4 MIMEType:(id)a5 properties:(id)a6;
- (id)_initWithLPVisualMedia:(id)a3;
- (unint64_t)_encodedSize;
- (void)data;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setFileURL:(id)a3;
@end

@implementation LPVisualMedia

- (LPVisualMedia)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPVisualMedia;
  v2 = [(LPVisualMedia *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)_initWithLPVisualMedia:(id)a3
{
  v4 = (id *)a3;
  v9.receiver = self;
  v9.super_class = (Class)LPVisualMedia;
  v5 = [(LPVisualMedia *)&v9 init];
  p_isa = (id *)&v5->super.isa;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_data, v4[1]);
    objc_storeStrong(p_isa + 2, v4[2]);
    objc_storeStrong(p_isa + 3, v4[3]);
    objc_storeStrong(p_isa + 4, v4[4]);
    v7 = p_isa;
  }

  return p_isa;
}

- (id)_initWithData:(id)a3 fileURL:(id)a4 MIMEType:(id)a5 properties:(id)a6
{
  id v11 = a4;
  v12 = [(LPVisualMedia *)self _initWithData:a3 MIMEType:a5 properties:a6];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(v12 + 3, a4);
    v14 = v13;
  }

  return v13;
}

- (id)_initWithData:(id)a3 MIMEType:(id)a4 properties:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)LPVisualMedia;
  v12 = [(LPVisualMedia *)&v17 init];
  if (v12)
  {
    if (!v9) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Trying to create an LPVisualMedia with nil data."];
    }
    if (!v10) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Trying to create an LPVisualMedia with nil MIME type."];
    }
    objc_storeStrong((id *)&v12->_data, a3);
    objc_storeStrong((id *)&v12->_MIMEType, a4);
    uint64_t v13 = [v11 copy];
    properties = v12->_properties;
    v12->_properties = (LPVisualMediaProperties *)v13;

    v15 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)_encodedSize
{
  fileURL = self->_fileURL;
  if (fileURL) {
    return [(NSURL *)fileURL _lp_fileSize];
  }
  else {
    return [(NSData *)self->_data length];
  }
}

- (void)setFileURL:(id)a3
{
  id v6 = a3;
  if ([v6 isFileURL]) {
    v4 = (NSURL *)v6;
  }
  else {
    v4 = 0;
  }
  fileURL = self->_fileURL;
  self->_fileURL = v4;
}

- (void)setData:(id)a3
{
}

- (id)_initByReferencingFileURL:(id)a3 MIMEType:(id)a4 properties:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)LPVisualMedia;
  v12 = [(LPVisualMedia *)&v17 init];
  if (v12 && [v9 isFileURL])
  {
    objc_storeStrong((id *)&v12->_fileURL, a3);
    objc_storeStrong((id *)&v12->_MIMEType, a4);
    uint64_t v13 = [v11 copy];
    properties = v12->_properties;
    v12->_properties = (LPVisualMediaProperties *)v13;

    v15 = v12;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (LPVisualMedia)initWithProperties:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPVisualMedia;
  v5 = [(LPVisualMedia *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    properties = v5->_properties;
    v5->_properties = (LPVisualMediaProperties *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSData)data
{
  v2 = self;
  objc_sync_enter(v2);
  data = v2->_data;
  if (!data)
  {
    fileURL = v2->_fileURL;
    if (fileURL)
    {
      id v11 = 0;
      uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:fileURL options:1 error:&v11];
      id v6 = v11;
      v7 = v2->_data;
      v2->_data = (NSData *)v5;

      if (v6)
      {
        v8 = LPLogChannelUI();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          [(LPVisualMedia *)(uint64_t)v6 data];
        }
      }

      data = v2->_data;
    }
    else
    {
      data = 0;
    }
  }
  id v9 = data;
  objc_sync_exit(v2);

  return v9;
}

- (NSData)_cachedData
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_data;
  objc_sync_exit(v2);

  return v3;
}

- (LPVisualMediaProperties)properties
{
  v2 = (void *)[(LPVisualMediaProperties *)self->_properties copy];

  return (LPVisualMediaProperties *)v2;
}

- (BOOL)_isSubstitute
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if (![(LPVisualMedia *)self _isSubstitute])
  {
    id v4 = [(LPVisualMedia *)self data];
    objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", v4, @"data");
  }
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", self->_MIMEType, @"MIMEType");
  uint64_t v5 = [(LPVisualMediaProperties *)self->_properties accessibilityText];
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", v5, @"accessibilityText");
}

- (BOOL)_canEncodeWithoutComputation
{
  return self->_data != 0;
}

- (LPVisualMedia)initWithCoderInternal:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPVisualMedia;
  uint64_t v5 = [(LPVisualMedia *)&v12 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "_lp_strictlyDecodeNSDataForKey:", @"data");
    data = v5->_data;
    v5->_data = (NSData *)v6;

    uint64_t v8 = objc_msgSend(v4, "_lp_strictlyDecodeNSStringForKey:", @"MIMEType");
    MIMEType = v5->_MIMEType;
    v5->_MIMEType = (NSString *)v8;

    objc_super v10 = v5;
  }

  return v5;
}

- (LPVisualMedia)initWithCoder:(id)a3 properties:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(LPVisualMedia *)self initWithCoderInternal:a3];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_properties, a4);
    objc_super v10 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPVisualMedia;
  if ([(LPVisualMedia *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if ((objectsAreEqual_3(v6[1], self->_data) & 1) != 0
        && objectsAreEqual_3(v6[2], self->_MIMEType)
        && objectsAreEqual_3(v6[3], self->_fileURL))
      {
        char v5 = objectsAreEqual_3(v6[4], self->_properties);
      }
      else
      {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (void)data
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A35DC000, a2, OS_LOG_TYPE_ERROR, "LPVisualMedia: Failed to load data: %@", (uint8_t *)&v2, 0xCu);
}

@end