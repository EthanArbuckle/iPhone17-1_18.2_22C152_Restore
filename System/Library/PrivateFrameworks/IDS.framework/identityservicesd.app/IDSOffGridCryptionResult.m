@interface IDSOffGridCryptionResult
- (IDSOffGridCryptionResult)initWithDecryptedData:(id)a3 key:(id)a4 originalRecipientURI:(id)a5 error:(id)a6;
- (IDSOffGridCryptionResult)initWithEncryptedData:(id)a3 keyIndex:(unsigned int)a4 key:(id)a5 keyID:(id)a6 authTag:(id)a7 error:(id)a8;
- (IDSURI)originalRecipientURI;
- (NSData)authTag;
- (NSData)decryptedData;
- (NSData)encryptedData;
- (NSData)key;
- (NSData)keyID;
- (NSError)error;
- (unsigned)keyIndex;
- (void)setAuthTag:(id)a3;
- (void)setDecryptedData:(id)a3;
- (void)setEncryptedData:(id)a3;
- (void)setError:(id)a3;
- (void)setKey:(id)a3;
- (void)setKeyID:(id)a3;
- (void)setKeyIndex:(unsigned int)a3;
- (void)setOriginalRecipientURI:(id)a3;
@end

@implementation IDSOffGridCryptionResult

- (IDSOffGridCryptionResult)initWithEncryptedData:(id)a3 keyIndex:(unsigned int)a4 key:(id)a5 keyID:(id)a6 authTag:(id)a7 error:(id)a8
{
  id v22 = a3;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)IDSOffGridCryptionResult;
  v18 = [(IDSOffGridCryptionResult *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_encryptedData, a3);
    v19->_keyIndex = a4;
    objc_storeStrong((id *)&v19->_key, a5);
    objc_storeStrong((id *)&v19->_keyID, a6);
    objc_storeStrong((id *)&v19->_authTag, a7);
    objc_storeStrong((id *)&v19->_error, a8);
  }

  return v19;
}

- (IDSOffGridCryptionResult)initWithDecryptedData:(id)a3 key:(id)a4 originalRecipientURI:(id)a5 error:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSOffGridCryptionResult;
  id v15 = [(IDSOffGridCryptionResult *)&v18 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_decryptedData, a3);
    objc_storeStrong((id *)&v16->_key, a4);
    objc_storeStrong((id *)&v16->_originalRecipientURI, a5);
    objc_storeStrong((id *)&v16->_error, a6);
  }

  return v16;
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (void)setEncryptedData:(id)a3
{
}

- (NSData)decryptedData
{
  return self->_decryptedData;
}

- (void)setDecryptedData:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (unsigned)keyIndex
{
  return self->_keyIndex;
}

- (void)setKeyIndex:(unsigned int)a3
{
  self->_keyIndex = a3;
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSData)keyID
{
  return self->_keyID;
}

- (void)setKeyID:(id)a3
{
}

- (NSData)authTag
{
  return self->_authTag;
}

- (void)setAuthTag:(id)a3
{
}

- (IDSURI)originalRecipientURI
{
  return self->_originalRecipientURI;
}

- (void)setOriginalRecipientURI:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRecipientURI, 0);
  objc_storeStrong((id *)&self->_authTag, 0);
  objc_storeStrong((id *)&self->_keyID, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_decryptedData, 0);

  objc_storeStrong((id *)&self->_encryptedData, 0);
}

@end