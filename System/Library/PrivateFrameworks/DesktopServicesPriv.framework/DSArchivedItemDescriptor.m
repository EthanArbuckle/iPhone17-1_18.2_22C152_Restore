@interface DSArchivedItemDescriptor
+ (BOOL)supportsSecureCoding;
- (DSArchivedItemDescriptor)initWithCoder:(id)a3;
- (NSNumber)fileSize;
- (NSString)filePath;
- (NSString)typeIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setFilePath:(id)a3;
- (void)setFileSize:(id)a3;
- (void)setTypeIdentifier:(id)a3;
@end

@implementation DSArchivedItemDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DSArchivedItemDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DSArchivedItemDescriptor;
  v5 = [(DSArchivedItemDescriptor *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filePath"];
    filePath = v5->_filePath;
    v5->_filePath = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileSize"];
    fileSize = v5->_fileSize;
    v5->_fileSize = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"typeIdentifier"];
    typeIdentifier = v5->_typeIdentifier;
    v5->_typeIdentifier = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_filePath forKey:@"filePath"];
  [v4 encodeObject:self->_fileSize forKey:@"fileSize"];
  [v4 encodeObject:self->_typeIdentifier forKey:@"typeIdentifier"];
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (NSNumber)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(id)a3
{
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void)setTypeIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_fileSize, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end