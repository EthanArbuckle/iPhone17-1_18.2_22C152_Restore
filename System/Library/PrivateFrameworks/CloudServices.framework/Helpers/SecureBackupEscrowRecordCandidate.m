@interface SecureBackupEscrowRecordCandidate
- (EscrowPrerecordPasscodeGeneration)passcodeGeneration;
- (NSData)escrowedSPKI;
- (NSData)sosBackupKeybagDigest;
- (NSData)sosBackupKeybagPassword;
- (NSDictionary)recordContents;
- (NSString)bottleID;
- (NSString)sosPeerID;
- (NSString)timestamp;
- (void)setBottleID:(id)a3;
- (void)setEscrowedSPKI:(id)a3;
- (void)setPasscodeGeneration:(id)a3;
- (void)setRecordContents:(id)a3;
- (void)setSosBackupKeybagDigest:(id)a3;
- (void)setSosBackupKeybagPassword:(id)a3;
- (void)setSosPeerID:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation SecureBackupEscrowRecordCandidate

- (NSDictionary)recordContents
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRecordContents:(id)a3
{
}

- (NSString)sosPeerID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSosPeerID:(id)a3
{
}

- (NSData)sosBackupKeybagPassword
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSosBackupKeybagPassword:(id)a3
{
}

- (NSData)sosBackupKeybagDigest
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSosBackupKeybagDigest:(id)a3
{
}

- (NSString)timestamp
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)bottleID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBottleID:(id)a3
{
}

- (NSData)escrowedSPKI
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEscrowedSPKI:(id)a3
{
}

- (EscrowPrerecordPasscodeGeneration)passcodeGeneration
{
  return (EscrowPrerecordPasscodeGeneration *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPasscodeGeneration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeGeneration, 0);
  objc_storeStrong((id *)&self->_escrowedSPKI, 0);
  objc_storeStrong((id *)&self->_bottleID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_sosBackupKeybagDigest, 0);
  objc_storeStrong((id *)&self->_sosBackupKeybagPassword, 0);
  objc_storeStrong((id *)&self->_sosPeerID, 0);

  objc_storeStrong((id *)&self->_recordContents, 0);
}

@end