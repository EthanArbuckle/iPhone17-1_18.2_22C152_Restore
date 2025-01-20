@interface SRPInit
- (AppleIDPasswordMetadata)appleIDPasswordMetadata;
- (BOOL)guitarfish;
- (BOOL)guitarfishToken;
- (NSDictionary)escrowRecord;
- (NSString)dsid;
- (NSString)recordID;
- (NSString)recordLabel;
- (NSString)recoveryPassphrase;
- (SRPInit)initWithSecureBackup:(id)a3;
- (SecureBackup)sb;
- (id)validateInput;
- (void)setEscrowRecord:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setRecordLabel:(id)a3;
@end

@implementation SRPInit

- (SRPInit)initWithSecureBackup:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRPInit;
  v6 = [(SRPInit *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sb, a3);
  }

  return v7;
}

- (id)validateInput
{
  return 0;
}

- (NSString)dsid
{
  v3 = objc_msgSend_sb(self, a2, v2);
  v6 = objc_msgSend_dsid(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)recoveryPassphrase
{
  v3 = objc_msgSend_sb(self, a2, v2);
  v6 = objc_msgSend_passphrase(v3, v4, v5);

  return (NSString *)v6;
}

- (NSString)recordLabel
{
  return self->_recordLabel;
}

- (void)setRecordLabel:(id)a3
{
}

- (NSDictionary)escrowRecord
{
  return self->_escrowRecord;
}

- (void)setEscrowRecord:(id)a3
{
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (SecureBackup)sb
{
  return self->_sb;
}

- (BOOL)guitarfish
{
  return self->_guitarfish;
}

- (BOOL)guitarfishToken
{
  return self->_guitarfishToken;
}

- (AppleIDPasswordMetadata)appleIDPasswordMetadata
{
  return self->_appleIDPasswordMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleIDPasswordMetadata, 0);
  objc_storeStrong((id *)&self->_sb, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_escrowRecord, 0);

  objc_storeStrong((id *)&self->_recordLabel, 0);
}

@end