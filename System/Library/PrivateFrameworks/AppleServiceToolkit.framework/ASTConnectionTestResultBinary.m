@interface ASTConnectionTestResultBinary
- (ASTConnectionTestResultBinary)initWithSealableFile:(id)a3 fileSequence:(id)a4 totalFiles:(id)a5 testId:(id)a6 dataId:(id)a7;
- (ASTSealableFile)sealableFile;
- (NSNumber)testId;
- (NSString)dataId;
- (NSURL)fileSteamLocationURL;
- (id)contentType;
- (id)endpoint;
- (void)setDataId:(id)a3;
- (void)setSealableFile:(id)a3;
@end

@implementation ASTConnectionTestResultBinary

- (ASTConnectionTestResultBinary)initWithSealableFile:(id)a3 fileSequence:(id)a4 totalFiles:(id)a5 testId:(id)a6 dataId:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v46.receiver = self;
  v46.super_class = (Class)ASTConnectionTestResultBinary;
  v18 = [(ASTMaterializedConnection *)&v46 init];
  v19 = v18;
  if (v18)
  {
    id v42 = v17;
    id v43 = v16;
    objc_storeStrong((id *)&v18->_testId, a6);
    objc_storeStrong((id *)&v19->_sealableFile, a3);
    objc_storeStrong((id *)&v19->_dataId, a7);
    v40 = v13;
    v20 = [v13 fileURL];
    id v45 = 0;
    v21 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:v20 error:&v45];
    id v41 = v45;
    uint64_t v22 = +[ASTEncodingUtilities MD5ForFileHandle:v21];
    [v21 closeFile];
    v23 = [MEMORY[0x263F08850] defaultManager];
    v24 = [v20 path];
    [v23 attributesOfItemAtPath:v24 error:0];
    id v25 = v15;
    v27 = id v26 = v14;
    uint64_t v28 = [v27 fileSize];

    v29 = [(ASTMaterializedConnection *)v19 request];
    v44 = v26;
    id v30 = v26;
    id v15 = v25;
    v31 = (void *)v22;
    [v29 setValue:v30 forHTTPHeaderField:@"AST-file-sequence"];

    v32 = [(ASTMaterializedConnection *)v19 request];
    [v32 setValue:v15 forHTTPHeaderField:@"AST-total-files"];

    v33 = [(ASTMaterializedConnection *)v19 request];
    [v33 setValue:v22 forHTTPHeaderField:@"AST-file-MD5"];

    v34 = [(ASTMaterializedConnection *)v19 request];
    v35 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", v28);
    [v34 setValue:v35 forHTTPHeaderField:@"AST-file-size"];

    if (!+[ASTConnectionUtilities useChunkedTransferEncoding])
    {
      v36 = [(ASTMaterializedConnection *)v19 request];
      v37 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", v28);
      [v36 setValue:v37 forHTTPHeaderField:@"Content-Length"];
    }
    id v13 = v40;
    v38 = [v40 base64Signature];
    [(ASTMaterializedConnection *)v19 setSignature:v38];

    id v16 = v43;
    id v14 = v44;
    id v17 = v42;
  }

  return v19;
}

- (NSURL)fileSteamLocationURL
{
  v2 = [(ASTConnectionTestResultBinary *)self sealableFile];
  v3 = [v2 fileURL];

  return (NSURL *)v3;
}

- (id)endpoint
{
  v3 = NSString;
  v4 = [(ASTConnectionTestResultBinary *)self testId];
  v5 = [(ASTConnectionTestResultBinary *)self dataId];
  v6 = [v3 stringWithFormat:@"results/%@/data/%@", v4, v5];

  return v6;
}

- (id)contentType
{
  return @"application/octet-stream";
}

- (NSNumber)testId
{
  return self->_testId;
}

- (ASTSealableFile)sealableFile
{
  return self->_sealableFile;
}

- (void)setSealableFile:(id)a3
{
}

- (NSString)dataId
{
  return self->_dataId;
}

- (void)setDataId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataId, 0);
  objc_storeStrong((id *)&self->_sealableFile, 0);
  objc_storeStrong((id *)&self->_fileSteamLocationURL, 0);

  objc_storeStrong((id *)&self->_testId, 0);
}

@end