@interface HMCameraClipEncryptedDataContext
- (BOOL)isEqual:(id)a3;
- (HMCameraClipEncryptedDataContext)initWithDataRepresentation:(id)a3;
- (HMCameraClipEncryptedDataContext)initWithInitializationVector:(id)a3 ciphertext:(id)a4 tag:(id)a5;
- (NSData)ciphertext;
- (NSData)dataRepresentation;
- (NSData)initializationVector;
- (NSData)tag;
- (id)description;
- (unint64_t)hash;
@end

@implementation HMCameraClipEncryptedDataContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_ciphertext, 0);

  objc_storeStrong((id *)&self->_initializationVector, 0);
}

- (NSData)tag
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)ciphertext
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)initializationVector
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v3 = [(HMCameraClipEncryptedDataContext *)self initializationVector];
  uint64_t v4 = [v3 hash];

  v5 = [(HMCameraClipEncryptedDataContext *)self ciphertext];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(HMCameraClipEncryptedDataContext *)self tag];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  v7 = v6;
  if (v6)
  {
    unint64_t v8 = [v6 initializationVector];
    v9 = [(HMCameraClipEncryptedDataContext *)self initializationVector];
    if ([v8 isEqualToData:v9])
    {
      v10 = [v7 ciphertext];
      v11 = [(HMCameraClipEncryptedDataContext *)self ciphertext];
      if ([v10 isEqualToData:v11])
      {
        v12 = [v7 tag];
        v13 = [(HMCameraClipEncryptedDataContext *)self tag];
        char v14 = [v12 isEqualToData:v13];
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (NSData)dataRepresentation
{
  v3 = [(HMCameraClipEncryptedDataContext *)self initializationVector];
  uint64_t v4 = [v3 length];
  v5 = [(HMCameraClipEncryptedDataContext *)self ciphertext];
  uint64_t v6 = [v5 length] + v4;
  v7 = [(HMCameraClipEncryptedDataContext *)self tag];
  uint64_t v8 = v6 + [v7 length];

  v9 = [MEMORY[0x1E4F1CA58] dataWithCapacity:v8];
  v10 = [(HMCameraClipEncryptedDataContext *)self initializationVector];
  [v9 appendData:v10];

  v11 = [(HMCameraClipEncryptedDataContext *)self ciphertext];
  [v9 appendData:v11];

  v12 = [(HMCameraClipEncryptedDataContext *)self tag];
  [v9 appendData:v12];

  v13 = (void *)[v9 copy];

  return (NSData *)v13;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  uint64_t v4 = [(HMCameraClipEncryptedDataContext *)self initializationVector];
  objc_msgSend(v3, "appendFormat:", @" IV length: %lu", objc_msgSend(v4, "length"));

  v5 = [(HMCameraClipEncryptedDataContext *)self ciphertext];
  objc_msgSend(v3, "appendFormat:", @" Ciphertext length: %lu", objc_msgSend(v5, "length"));

  uint64_t v6 = [(HMCameraClipEncryptedDataContext *)self tag];
  objc_msgSend(v3, "appendFormat:", @" Tag length: %lu", objc_msgSend(v6, "length"));

  [v3 appendString:@">"];
  v7 = (void *)[v3 copy];

  return v7;
}

- (HMCameraClipEncryptedDataContext)initWithInitializationVector:(id)a3 ciphertext:(id)a4 tag:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  v11 = v10;
  if ([v8 length] != 16)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v9)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v11)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if ([v11 length] != 16)
  {
LABEL_13:
    v20 = (HMCameraClipEncryptedDataContext *)_HMFPreconditionFailure();
    return [(HMCameraClipEncryptedDataContext *)v20 initWithDataRepresentation:v22];
  }
  v23.receiver = self;
  v23.super_class = (Class)HMCameraClipEncryptedDataContext;
  v12 = [(HMCameraClipEncryptedDataContext *)&v23 init];
  if (v12)
  {
    uint64_t v13 = [v8 copy];
    initializationVector = v12->_initializationVector;
    v12->_initializationVector = (NSData *)v13;

    uint64_t v15 = [v9 copy];
    ciphertext = v12->_ciphertext;
    v12->_ciphertext = (NSData *)v15;

    uint64_t v17 = [v11 copy];
    tag = v12->_tag;
    v12->_tag = (NSData *)v17;
  }
  return v12;
}

- (HMCameraClipEncryptedDataContext)initWithDataRepresentation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = objc_msgSend(v4, "subdataWithRange:", 0, 16);
    v7 = objc_msgSend(v5, "subdataWithRange:", objc_msgSend(v5, "length") - 16, 16);
    id v8 = objc_msgSend(v5, "subdataWithRange:", 16, objc_msgSend(v5, "length") - 32);
    id v9 = [(HMCameraClipEncryptedDataContext *)self initWithInitializationVector:v6 ciphertext:v8 tag:v7];

    return v9;
  }
  else
  {
    v11 = (_HMPrivacySettingsProvider *)_HMFPreconditionFailure();
    [(_HMPrivacySettingsProvider *)v11 requestMicrophoneAccessWithQueue:v13 completion:v14];
  }
  return result;
}

@end