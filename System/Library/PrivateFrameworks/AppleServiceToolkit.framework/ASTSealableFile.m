@interface ASTSealableFile
+ (BOOL)supportsSecureCoding;
+ (id)sealedFileURL:(id)a3 signature:(id)a4;
- (ASTSealableFile)initWithCoder:(id)a3;
- (ASTSealableFile)initWithFileURL:(id)a3 signature:(id)a4;
- (BOOL)isSealed;
- (BOOL)sealWithFileSigner:(id)a3 error:(id *)a4;
- (NSData)signature;
- (NSString)base64Signature;
- (NSURL)fileURL;
- (void)encodeWithCoder:(id)a3;
- (void)setBase64Signature:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setSealed:(BOOL)a3;
- (void)setSignature:(id)a3;
@end

@implementation ASTSealableFile

- (ASTSealableFile)initWithFileURL:(id)a3 signature:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ASTSealableFile;
  v9 = [(ASTSealableFile *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileURL, a3);
    if (v8)
    {
      objc_storeStrong((id *)&v10->_signature, a4);
      uint64_t v11 = [v8 base64EncodedStringWithOptions:0];
      base64Signature = v10->_base64Signature;
      v10->_base64Signature = (NSString *)v11;

      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __45__ASTSealableFile_initWithFileURL_signature___block_invoke;
      v14[3] = &unk_264E7DBF0;
      id v15 = v8;
      [(ASTSealableFile *)v10 sealWithFileSigner:v14 error:0];
    }
  }

  return v10;
}

id __45__ASTSealableFile_initWithFileURL_signature___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)sealWithFileSigner:(id)a3 error:(id *)a4
{
  v6 = (void (**)(id, void *, id *))a3;
  if ([(ASTSealableFile *)self isSealed])
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = [(ASTSealableFile *)self fileURL];

    if (v8)
    {
      if (v6)
      {
        v9 = [(ASTSealableFile *)self fileURL];
        v10 = v6[2](v6, v9, a4);
        [(ASTSealableFile *)self setSignature:v10];

        uint64_t v11 = [(ASTSealableFile *)self signature];
        v12 = [v11 base64EncodedStringWithOptions:0];
        [(ASTSealableFile *)self setBase64Signature:v12];
      }
      BOOL v7 = 1;
      [(ASTSealableFile *)self setSealed:1];
    }
    else if (a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"ASTErrorDomain" code:-4000 userInfo:0];
      BOOL v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

+ (id)sealedFileURL:(id)a3 signature:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = [[ASTSealableFile alloc] initWithFileURL:v6 signature:v5];

  [(ASTSealableFile *)v7 sealWithFileSigner:0 error:0];

  return v7;
}

- (void)setFileURL:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASTSealableFile)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASTSealableFile *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileURL"];
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;

    v5->_sealed = [v4 decodeBoolForKey:@"sealed"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(ASTSealableFile *)self fileURL];
  [v5 encodeObject:v4 forKey:@"fileURL"];

  objc_msgSend(v5, "encodeBool:forKey:", -[ASTSealableFile isSealed](self, "isSealed"), @"sealed");
}

- (BOOL)isSealed
{
  return self->_sealed;
}

- (void)setSealed:(BOOL)a3
{
  self->_sealed = a3;
}

- (NSString)base64Signature
{
  return self->_base64Signature;
}

- (void)setBase64Signature:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_base64Signature, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end