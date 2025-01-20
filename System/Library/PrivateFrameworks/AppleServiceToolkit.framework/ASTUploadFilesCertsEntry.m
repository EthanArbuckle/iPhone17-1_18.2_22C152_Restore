@interface ASTUploadFilesCertsEntry
+ (BOOL)supportsSecureCoding;
- (ASTUploadFilesCertsEntry)initWithCert:(id)a3 andPubKeyDigest:(id)a4 andSigAlgo:(id)a5;
- (ASTUploadFilesCertsEntry)initWithCoder:(id)a3;
- (NSString)certString;
- (NSString)pubKeyDigest;
- (NSString)sigAlgo;
- (void)encodeWithCoder:(id)a3;
- (void)setCertString:(id)a3;
- (void)setPubKeyDigest:(id)a3;
- (void)setSigAlgo:(id)a3;
@end

@implementation ASTUploadFilesCertsEntry

- (ASTUploadFilesCertsEntry)initWithCert:(id)a3 andPubKeyDigest:(id)a4 andSigAlgo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ASTUploadFilesCertsEntry;
  v12 = [(ASTUploadFilesCertsEntry *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_certString, a3);
    objc_storeStrong((id *)&v13->_pubKeyDigest, a4);
    objc_storeStrong((id *)&v13->_sigAlgo, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASTUploadFilesCertsEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASTUploadFilesCertsEntry *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"certString"];
    certString = v5->_certString;
    v5->_certString = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pubKeyDigest"];
    pubKeyDigest = v5->_pubKeyDigest;
    v5->_pubKeyDigest = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sigAlgo"];
    sigAlgo = v5->_sigAlgo;
    v5->_sigAlgo = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASTUploadFilesCertsEntry *)self certString];
  [v4 encodeObject:v5 forKey:@"certString"];

  uint64_t v6 = [(ASTUploadFilesCertsEntry *)self pubKeyDigest];
  [v4 encodeObject:v6 forKey:@"pubKeyDigest"];

  id v7 = [(ASTUploadFilesCertsEntry *)self sigAlgo];
  [v4 encodeObject:v7 forKey:@"sigAlgo"];
}

- (NSString)certString
{
  return self->_certString;
}

- (void)setCertString:(id)a3
{
}

- (NSString)pubKeyDigest
{
  return self->_pubKeyDigest;
}

- (void)setPubKeyDigest:(id)a3
{
}

- (NSString)sigAlgo
{
  return self->_sigAlgo;
}

- (void)setSigAlgo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigAlgo, 0);
  objc_storeStrong((id *)&self->_pubKeyDigest, 0);

  objc_storeStrong((id *)&self->_certString, 0);
}

@end