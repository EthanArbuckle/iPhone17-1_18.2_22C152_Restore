@interface CTLazuliFileThumbnailInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliFileThumbnailInformation:(id)a3;
- (CTLazuliFileThumbnailInformation)initWithCoder:(id)a3;
- (CTLazuliFileThumbnailInformation)initWithReflection:(const void *)a3;
- (NSNumber)fileSizeInBytes;
- (NSString)untrustedContentType;
- (NSString)validUntil;
- (NSURL)dataUrl;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDataUrl:(id)a3;
- (void)setFileSizeInBytes:(id)a3;
- (void)setUntrustedContentType:(id)a3;
- (void)setValidUntil:(id)a3;
@end

@implementation CTLazuliFileThumbnailInformation

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliFileThumbnailInformation *)self fileSizeInBytes];
  [v3 appendFormat:@", fileSizeInBytes = %@", v4];

  v5 = [(CTLazuliFileThumbnailInformation *)self untrustedContentType];
  [v3 appendFormat:@", untrustedContentType = %@", v5];

  v6 = [(CTLazuliFileThumbnailInformation *)self dataUrl];
  [v3 appendFormat:@", dataUrl = %@", v6];

  v7 = [(CTLazuliFileThumbnailInformation *)self validUntil];
  [v3 appendFormat:@", validUntil = %@", v7];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliFileThumbnailInformation:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliFileThumbnailInformation *)self fileSizeInBytes];
  uint64_t v6 = [v5 longValue];
  v7 = [v4 fileSizeInBytes];
  if (v6 == [v7 longValue])
  {
    v8 = [(CTLazuliFileThumbnailInformation *)self untrustedContentType];
    v9 = [v4 untrustedContentType];
    if ([v8 isEqualToString:v9])
    {
      v10 = [(CTLazuliFileThumbnailInformation *)self dataUrl];
      v11 = [v4 dataUrl];
      if ([v10 isEqual:v11])
      {
        v12 = [(CTLazuliFileThumbnailInformation *)self validUntil];
        v13 = [v4 validUntil];
        char v14 = [v12 isEqualToString:v13];
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliFileThumbnailInformation *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliFileThumbnailInformation *)self isEqualToCTLazuliFileThumbnailInformation:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliFileThumbnailInformation allocWithZone:a3];
  [(CTLazuliFileThumbnailInformation *)v4 setFileSizeInBytes:self->_fileSizeInBytes];
  [(CTLazuliFileThumbnailInformation *)v4 setUntrustedContentType:self->_untrustedContentType];
  [(CTLazuliFileThumbnailInformation *)v4 setDataUrl:self->_dataUrl];
  [(CTLazuliFileThumbnailInformation *)v4 setValidUntil:self->_validUntil];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_fileSizeInBytes forKey:@"kFileSizeInBytesKey"];
  [v4 encodeObject:self->_untrustedContentType forKey:@"kUntrustedContentTypeKey"];
  [v4 encodeObject:self->_dataUrl forKey:@"kDataUrlKey"];
  [v4 encodeObject:self->_validUntil forKey:@"kValidUntilKey"];
}

- (CTLazuliFileThumbnailInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliFileThumbnailInformation;
  v5 = [(CTLazuliFileThumbnailInformation *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFileSizeInBytesKey"];
    fileSizeInBytes = v5->_fileSizeInBytes;
    v5->_fileSizeInBytes = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kUntrustedContentTypeKey"];
    untrustedContentType = v5->_untrustedContentType;
    v5->_untrustedContentType = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDataUrlKey"];
    dataUrl = v5->_dataUrl;
    v5->_dataUrl = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kValidUntilKey"];
    validUntil = v5->_validUntil;
    v5->_validUntil = (NSString *)v12;
  }
  return v5;
}

- (CTLazuliFileThumbnailInformation)initWithReflection:(const void *)a3
{
  v26.receiver = self;
  v26.super_class = (Class)CTLazuliFileThumbnailInformation;
  id v4 = [(CTLazuliFileThumbnailInformation *)&v26 init];
  if (v4)
  {
    uint64_t v5 = [NSNumber numberWithUnsignedLong:*(void *)a3];
    fileSizeInBytes = v4->_fileSizeInBytes;
    v4->_fileSizeInBytes = (NSNumber *)v5;

    if (*((char *)a3 + 31) >= 0) {
      v7 = (char *)a3 + 8;
    }
    else {
      v7 = (char *)*((void *)a3 + 1);
    }
    uint64_t v8 = [NSString stringWithUTF8String:v7];
    untrustedContentType = v4->_untrustedContentType;
    v4->_untrustedContentType = (NSString *)v8;

    uint64_t v10 = (void *)MEMORY[0x1E4F1CB10];
    v11 = NSString;
    uint64_t v12 = (char *)*((void *)a3 + 4);
    int v13 = *((char *)a3 + 55);
    uint64_t v14 = [NSString defaultCStringEncoding];
    if (v13 >= 0) {
      objc_super v15 = (char *)a3 + 32;
    }
    else {
      objc_super v15 = v12;
    }
    v16 = [v11 stringWithCString:v15 encoding:v14];
    uint64_t v17 = [v10 URLWithString:v16];
    dataUrl = v4->_dataUrl;
    v4->_dataUrl = (NSURL *)v17;

    v21 = (char *)*((void *)a3 + 7);
    v20 = (char *)a3 + 56;
    v19 = v21;
    if (v20[23] >= 0) {
      v22 = v20;
    }
    else {
      v22 = v19;
    }
    uint64_t v23 = [NSString stringWithUTF8String:v22];
    validUntil = v4->_validUntil;
    v4->_validUntil = (NSString *)v23;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)fileSizeInBytes
{
  return self->_fileSizeInBytes;
}

- (void)setFileSizeInBytes:(id)a3
{
}

- (NSString)untrustedContentType
{
  return self->_untrustedContentType;
}

- (void)setUntrustedContentType:(id)a3
{
}

- (NSURL)dataUrl
{
  return self->_dataUrl;
}

- (void)setDataUrl:(id)a3
{
}

- (NSString)validUntil
{
  return self->_validUntil;
}

- (void)setValidUntil:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_dataUrl, 0);
  objc_storeStrong((id *)&self->_untrustedContentType, 0);

  objc_storeStrong((id *)&self->_fileSizeInBytes, 0);
}

@end