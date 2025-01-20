@interface CRKOpenFileRequestItem
+ (BOOL)supportsSecureCoding;
- (CRKOpenFileRequestItem)initWithCoder:(id)a3;
- (NSData)fileData;
- (NSString)fileName;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFileData:(id)a3;
- (void)setFileName:(id)a3;
@end

@implementation CRKOpenFileRequestItem

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CRKOpenFileRequestItem *)self fileName];
  v6 = [(CRKOpenFileRequestItem *)self fileData];
  v7 = [v3 stringWithFormat:@"<%@: %p { fileName = %@, fileData = %ld bytes }>", v4, self, v5, objc_msgSend(v6, "length")];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKOpenFileRequestItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKOpenFileRequestItem;
  v5 = [(CRKOpenFileRequestItem *)&v13 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"fileData"];
    fileData = v5->_fileData;
    v5->_fileData = (NSData *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"fileName"];
    fileName = v5->_fileName;
    v5->_fileName = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CRKOpenFileRequestItem *)self fileData];
  [v4 encodeObject:v5 forKey:@"fileData"];

  id v6 = [(CRKOpenFileRequestItem *)self fileName];
  [v4 encodeObject:v6 forKey:@"fileName"];
}

- (NSData)fileData
{
  return self->_fileData;
}

- (void)setFileData:(id)a3
{
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);

  objc_storeStrong((id *)&self->_fileData, 0);
}

@end