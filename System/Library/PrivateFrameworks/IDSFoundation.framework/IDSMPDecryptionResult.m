@interface IDSMPDecryptionResult
- (IDSMPDecryptionResult)initWithData:(id)a3 encryptedAttributes:(id)a4 withCommitState:(id)a5 additionalDecryptionResult:(id)a6;
- (NSData)decryptedData;
- (NSDictionary)additionalDecryptionResult;
- (NSDictionary)encryptedAttributes;
- (id)commitBlock;
- (void)setAdditionalDecryptionResult:(id)a3;
- (void)setCommitBlock:(id)a3;
- (void)setDecryptedData:(id)a3;
- (void)setEncryptedAttributes:(id)a3;
@end

@implementation IDSMPDecryptionResult

- (IDSMPDecryptionResult)initWithData:(id)a3 encryptedAttributes:(id)a4 withCommitState:(id)a5 additionalDecryptionResult:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)IDSMPDecryptionResult;
  v15 = [(IDSMPDecryptionResult *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_decryptedData, a3);
    objc_storeStrong((id *)&v16->_encryptedAttributes, a4);
    v17 = _Block_copy(v13);
    id commitBlock = v16->_commitBlock;
    v16->_id commitBlock = v17;

    objc_storeStrong((id *)&v16->_additionalDecryptionResult, a6);
  }

  return v16;
}

- (NSData)decryptedData
{
  return self->_decryptedData;
}

- (void)setDecryptedData:(id)a3
{
}

- (NSDictionary)encryptedAttributes
{
  return self->_encryptedAttributes;
}

- (void)setEncryptedAttributes:(id)a3
{
}

- (id)commitBlock
{
  return self->_commitBlock;
}

- (void)setCommitBlock:(id)a3
{
}

- (NSDictionary)additionalDecryptionResult
{
  return self->_additionalDecryptionResult;
}

- (void)setAdditionalDecryptionResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalDecryptionResult, 0);
  objc_storeStrong(&self->_commitBlock, 0);
  objc_storeStrong((id *)&self->_encryptedAttributes, 0);
  objc_storeStrong((id *)&self->_decryptedData, 0);
}

@end