@interface IDSMMCSUploadResult
- (IDSEncryptedData)encryptedResult;
- (IDSMMCSUploadResult)initWithEncryptedResult:(id)a3 dataLength:(id)a4 fileCleanupBlock:(id)a5;
- (NSNumber)dataLength;
- (id)fileCleanupBlock;
@end

@implementation IDSMMCSUploadResult

- (IDSMMCSUploadResult)initWithEncryptedResult:(id)a3 dataLength:(id)a4 fileCleanupBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IDSMMCSUploadResult;
  v12 = [(IDSMMCSUploadResult *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_encryptedResult, a3);
    objc_storeStrong((id *)&v13->_dataLength, a4);
    id v14 = objc_retainBlock(v11);
    id fileCleanupBlock = v13->_fileCleanupBlock;
    v13->_id fileCleanupBlock = v14;
  }
  return v13;
}

- (IDSEncryptedData)encryptedResult
{
  return self->_encryptedResult;
}

- (NSNumber)dataLength
{
  return self->_dataLength;
}

- (id)fileCleanupBlock
{
  return self->_fileCleanupBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fileCleanupBlock, 0);
  objc_storeStrong((id *)&self->_dataLength, 0);

  objc_storeStrong((id *)&self->_encryptedResult, 0);
}

@end