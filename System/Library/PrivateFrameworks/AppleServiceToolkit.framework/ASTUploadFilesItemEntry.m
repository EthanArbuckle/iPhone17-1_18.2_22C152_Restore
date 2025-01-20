@interface ASTUploadFilesItemEntry
+ (BOOL)supportsSecureCoding;
- (ASTUploadFilesItemEntry)initWithCoder:(id)a3;
- (ASTUploadFilesItemEntry)initWithId:(id)a3 andName:(id)a4 andSig:(id)a5 andPubKeyDigest:(id)a6 andStatus:(id)a7 andSize:(id)a8 andUploadUrl:(id)a9;
- (NSNumber)size;
- (NSString)name;
- (NSString)pubKeyDigest;
- (NSString)sig;
- (NSString)status;
- (NSString)uploadId;
- (NSString)uploadUrl;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setPubKeyDigest:(id)a3;
- (void)setSig:(id)a3;
- (void)setSize:(id)a3;
- (void)setStatus:(id)a3;
- (void)setUploadId:(id)a3;
- (void)setUploadUrl:(id)a3;
@end

@implementation ASTUploadFilesItemEntry

- (ASTUploadFilesItemEntry)initWithId:(id)a3 andName:(id)a4 andSig:(id)a5 andPubKeyDigest:(id)a6 andStatus:(id)a7 andSize:(id)a8 andUploadUrl:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)ASTUploadFilesItemEntry;
  v18 = [(ASTUploadFilesItemEntry *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_uploadId, a3);
    objc_storeStrong((id *)&v19->_name, a4);
    objc_storeStrong((id *)&v19->_sig, a5);
    objc_storeStrong((id *)&v19->_pubKeyDigest, a6);
    objc_storeStrong((id *)&v19->_status, a7);
    objc_storeStrong((id *)&v19->_size, a8);
    objc_storeStrong((id *)&v19->_uploadUrl, a9);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASTUploadFilesItemEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASTUploadFilesItemEntry *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uploadId"];
    uploadId = v5->_uploadId;
    v5->_uploadId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sig"];
    sig = v5->_sig;
    v5->_sig = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pubKeyDigest"];
    pubKeyDigest = v5->_pubKeyDigest;
    v5->_pubKeyDigest = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
    status = v5->_status;
    v5->_status = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"size"];
    size = v5->_size;
    v5->_size = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uploadUrl"];
    uploadUrl = v5->_uploadUrl;
    v5->_uploadUrl = (NSString *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASTUploadFilesItemEntry *)self uploadId];
  [v4 encodeObject:v5 forKey:@"uploadId"];

  uint64_t v6 = [(ASTUploadFilesItemEntry *)self name];
  [v4 encodeObject:v6 forKey:@"name"];

  v7 = [(ASTUploadFilesItemEntry *)self sig];
  [v4 encodeObject:v7 forKey:@"sig"];

  uint64_t v8 = [(ASTUploadFilesItemEntry *)self pubKeyDigest];
  [v4 encodeObject:v8 forKey:@"pubKeyDigest"];

  v9 = [(ASTUploadFilesItemEntry *)self status];
  [v4 encodeObject:v9 forKey:@"status"];

  uint64_t v10 = [(ASTUploadFilesItemEntry *)self size];
  [v4 encodeObject:v10 forKey:@"size"];

  id v11 = [(ASTUploadFilesItemEntry *)self uploadUrl];
  [v4 encodeObject:v11 forKey:@"uploadUrl"];
}

- (NSString)uploadId
{
  return self->_uploadId;
}

- (void)setUploadId:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)sig
{
  return self->_sig;
}

- (void)setSig:(id)a3
{
}

- (NSString)pubKeyDigest
{
  return self->_pubKeyDigest;
}

- (void)setPubKeyDigest:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSNumber)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
}

- (NSString)uploadUrl
{
  return self->_uploadUrl;
}

- (void)setUploadUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadUrl, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_pubKeyDigest, 0);
  objc_storeStrong((id *)&self->_sig, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_uploadId, 0);
}

@end