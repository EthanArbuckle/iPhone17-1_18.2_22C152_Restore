@interface CTLazuliFileTransferDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliFileTransferDescriptor:(id)a3;
- (CTLazuliCustomMetaData)metaData;
- (CTLazuliFileDispositionInformation)file;
- (CTLazuliFileThumbnailInformation)thumbnail;
- (CTLazuliFileTransferDescriptor)initWithCoder:(id)a3;
- (CTLazuliFileTransferDescriptor)initWithReflection:(const void *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFile:(id)a3;
- (void)setMetaData:(id)a3;
- (void)setThumbnail:(id)a3;
@end

@implementation CTLazuliFileTransferDescriptor

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliFileTransferDescriptor *)self thumbnail];
  [v3 appendFormat:@", thumbnail = %@", v4];

  v5 = [(CTLazuliFileTransferDescriptor *)self file];
  [v3 appendFormat:@", file = %@", v5];

  v6 = [(CTLazuliFileTransferDescriptor *)self metaData];
  [v3 appendFormat:@", metaData = %@", v6];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliFileTransferDescriptor:(id)a3
{
  id v6 = a3;
  v7 = [(CTLazuliFileTransferDescriptor *)self thumbnail];
  if (v7 || ([v6 thumbnail], (v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [(CTLazuliFileTransferDescriptor *)self thumbnail];
    v4 = [v6 thumbnail];
    if (![v3 isEqualToCTLazuliFileThumbnailInformation:v4])
    {
      char v8 = 0;
LABEL_13:

      goto LABEL_14;
    }
    int v18 = 1;
  }
  else
  {
    v17 = 0;
    int v18 = 0;
  }
  v9 = [(CTLazuliFileTransferDescriptor *)self file];
  v10 = [v6 file];
  if (![v9 isEqualToCTLazuliFileDispositionInformation:v10])
  {

    char v8 = 0;
    if (!v18) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v11 = [(CTLazuliFileTransferDescriptor *)self metaData];
  if (v11 || ([v6 metaData], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = [(CTLazuliFileTransferDescriptor *)self metaData];
    v13 = [v6 metaData];
    char v8 = [v12 isEqualToCTLazuliCustomMetaData:v13];

    if (v11)
    {

      goto LABEL_20;
    }
    v15 = (void *)v16;
  }
  else
  {
    v15 = 0;
    char v8 = 1;
  }

LABEL_20:
  if (v18) {
    goto LABEL_13;
  }
LABEL_14:
  if (!v7) {

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliFileTransferDescriptor *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliFileTransferDescriptor *)self isEqualToCTLazuliFileTransferDescriptor:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliFileTransferDescriptor allocWithZone:a3];
  [(CTLazuliFileTransferDescriptor *)v4 setThumbnail:self->_thumbnail];
  [(CTLazuliFileTransferDescriptor *)v4 setFile:self->_file];
  [(CTLazuliFileTransferDescriptor *)v4 setMetaData:self->_metaData];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_thumbnail forKey:@"kThumbnailKey"];
  [v4 encodeObject:self->_file forKey:@"kFileKey"];
  [v4 encodeObject:self->_metaData forKey:@"kMetaDataKey"];
}

- (CTLazuliFileTransferDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTLazuliFileTransferDescriptor;
  v5 = [(CTLazuliFileTransferDescriptor *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kThumbnailKey"];
    thumbnail = v5->_thumbnail;
    v5->_thumbnail = (CTLazuliFileThumbnailInformation *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFileKey"];
    file = v5->_file;
    v5->_file = (CTLazuliFileDispositionInformation *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMetaDataKey"];
    metaData = v5->_metaData;
    v5->_metaData = (CTLazuliCustomMetaData *)v10;
  }
  return v5;
}

- (CTLazuliFileTransferDescriptor)initWithReflection:(const void *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CTLazuliFileTransferDescriptor;
  id v4 = [(CTLazuliFileTransferDescriptor *)&v15 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  if (*((unsigned char *)a3 + 80))
  {
    uint64_t v6 = [CTLazuliFileThumbnailInformation alloc];
    if (!*((unsigned char *)a3 + 80)) {
      goto LABEL_12;
    }
    uint64_t v7 = [(CTLazuliFileThumbnailInformation *)v6 initWithReflection:a3];
    thumbnail = v5->_thumbnail;
    v5->_thumbnail = (CTLazuliFileThumbnailInformation *)v7;
  }
  else
  {
    thumbnail = v4->_thumbnail;
    v4->_thumbnail = 0;
  }

  v9 = [[CTLazuliFileDispositionInformation alloc] initWithReflection:(char *)a3 + 88];
  file = v5->_file;
  v5->_file = v9;

  if (!*((unsigned char *)a3 + 240))
  {
    metaData = v5->_metaData;
    v5->_metaData = 0;
    goto LABEL_10;
  }
  v11 = [CTLazuliCustomMetaData alloc];
  if (*((unsigned char *)a3 + 240))
  {
    uint64_t v12 = [(CTLazuliCustomMetaData *)v11 initWithReflection:(char *)a3 + 216];
    metaData = v5->_metaData;
    v5->_metaData = (CTLazuliCustomMetaData *)v12;
LABEL_10:

    return v5;
  }
LABEL_12:
  result = (CTLazuliFileTransferDescriptor *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliFileThumbnailInformation)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
}

- (CTLazuliFileDispositionInformation)file
{
  return self->_file;
}

- (void)setFile:(id)a3
{
}

- (CTLazuliCustomMetaData)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_file, 0);

  objc_storeStrong((id *)&self->_thumbnail, 0);
}

@end