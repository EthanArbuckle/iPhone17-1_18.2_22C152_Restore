@interface MEMessageSecurityInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)disallowUsersToLoadRemoteContent;
- (BOOL)isEncrypted;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldBlockRemoteContent;
- (MEMessageSecurityInformation)initWithCoder:(id)a3;
- (MEMessageSecurityInformation)initWithSigners:(NSArray *)signers isEncrypted:(BOOL)isEncrypted signingError:(NSError *)signingError encryptionError:(NSError *)encryptionError;
- (MEMessageSecurityInformation)initWithSigners:(NSArray *)signers isEncrypted:(BOOL)isEncrypted signingError:(NSError *)signingError encryptionError:(NSError *)encryptionError shouldBlockRemoteContent:(BOOL)shouldBlockRemoteContent localizedRemoteContentBlockingReason:(NSString *)localizedRemoteContentBlockingReason;
- (MEMessageSecurityInformation)initWithSigners:(id)a3 isEncrypted:(BOOL)a4 signingError:(id)a5 encryptionError:(id)a6 shouldBlockRemoteContent:(BOOL)a7 disallowUsersToLoadRemoteContent:(BOOL)a8 localizedRemoteContentBlockingReason:(id)a9;
- (NSArray)signers;
- (NSError)encryptionError;
- (NSError)signingError;
- (NSString)decoderID;
- (NSString)localizedRemoteContentBlockingReason;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDecoderID:(id)a3;
@end

@implementation MEMessageSecurityInformation

- (MEMessageSecurityInformation)initWithSigners:(NSArray *)signers isEncrypted:(BOOL)isEncrypted signingError:(NSError *)signingError encryptionError:(NSError *)encryptionError
{
  return [(MEMessageSecurityInformation *)self initWithSigners:signers isEncrypted:isEncrypted signingError:signingError encryptionError:encryptionError shouldBlockRemoteContent:0 localizedRemoteContentBlockingReason:0];
}

- (MEMessageSecurityInformation)initWithSigners:(NSArray *)signers isEncrypted:(BOOL)isEncrypted signingError:(NSError *)signingError encryptionError:(NSError *)encryptionError shouldBlockRemoteContent:(BOOL)shouldBlockRemoteContent localizedRemoteContentBlockingReason:(NSString *)localizedRemoteContentBlockingReason
{
  v21 = signers;
  v15 = signingError;
  v16 = encryptionError;
  v17 = localizedRemoteContentBlockingReason;
  v22.receiver = self;
  v22.super_class = (Class)MEMessageSecurityInformation;
  v18 = [(MEMessageSecurityInformation *)&v22 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_signers, signers);
    v19->_isEncrypted = isEncrypted;
    objc_storeStrong((id *)&v19->_signingError, signingError);
    objc_storeStrong((id *)&v19->_encryptionError, encryptionError);
    v19->_shouldBlockRemoteContent = shouldBlockRemoteContent;
    objc_storeStrong((id *)&v19->_localizedRemoteContentBlockingReason, localizedRemoteContentBlockingReason);
  }

  return v19;
}

- (MEMessageSecurityInformation)initWithSigners:(id)a3 isEncrypted:(BOOL)a4 signingError:(id)a5 encryptionError:(id)a6 shouldBlockRemoteContent:(BOOL)a7 disallowUsersToLoadRemoteContent:(BOOL)a8 localizedRemoteContentBlockingReason:(id)a9
{
  id v22 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)MEMessageSecurityInformation;
  v18 = [(MEMessageSecurityInformation *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_signers, a3);
    v19->_isEncrypted = a4;
    objc_storeStrong((id *)&v19->_signingError, a5);
    objc_storeStrong((id *)&v19->_encryptionError, a6);
    v19->_shouldBlockRemoteContent = a7;
    v19->_disallowUsersToLoadRemoteContent = a8;
    objc_storeStrong((id *)&v19->_localizedRemoteContentBlockingReason, a9);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEMessageSecurityInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"EFPropertyKey_signers"];

  uint64_t v9 = [v4 decodeBoolForKey:@"EFPropertyKey_isEncrypted"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_signingError"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_encryptionError"];
  uint64_t v12 = [v4 decodeBoolForKey:@"EFPropertyKey_shouldBlockRemoteContent"];
  uint64_t v13 = [v4 decodeBoolForKey:@"EFPropertyKey_disallowUsersToLoadRemoteContent"];
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_localizedRemoteContentBlockingReason"];
  id v15 = [(MEMessageSecurityInformation *)self initWithSigners:v8 isEncrypted:v9 signingError:v10 encryptionError:v11 shouldBlockRemoteContent:v12 disallowUsersToLoadRemoteContent:v13 localizedRemoteContentBlockingReason:v14];

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(MEMessageSecurityInformation *)self signers];
  [v8 encodeObject:v4 forKey:@"EFPropertyKey_signers"];

  objc_msgSend(v8, "encodeBool:forKey:", -[MEMessageSecurityInformation isEncrypted](self, "isEncrypted"), @"EFPropertyKey_isEncrypted");
  v5 = [(MEMessageSecurityInformation *)self signingError];
  [v8 encodeObject:v5 forKey:@"EFPropertyKey_signingError"];

  uint64_t v6 = [(MEMessageSecurityInformation *)self encryptionError];
  [v8 encodeObject:v6 forKey:@"EFPropertyKey_encryptionError"];

  objc_msgSend(v8, "encodeBool:forKey:", -[MEMessageSecurityInformation shouldBlockRemoteContent](self, "shouldBlockRemoteContent"), @"EFPropertyKey_shouldBlockRemoteContent");
  objc_msgSend(v8, "encodeBool:forKey:", -[MEMessageSecurityInformation disallowUsersToLoadRemoteContent](self, "disallowUsersToLoadRemoteContent"), @"EFPropertyKey_disallowUsersToLoadRemoteContent");
  v7 = [(MEMessageSecurityInformation *)self localizedRemoteContentBlockingReason];
  [v8 encodeObject:v7 forKey:@"EFPropertyKey_localizedRemoteContentBlockingReason"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  if ([v5 isEqual:objc_opt_class()])
  {
    id v6 = v4;
    v7 = [(MEMessageSecurityInformation *)self signers];
    id v8 = [v6 signers];
    if ([v7 isEqual:v8]
      && (int v9 = [(MEMessageSecurityInformation *)self isEncrypted],
          v9 == [v6 isEncrypted]))
    {
      v11 = [(MEMessageSecurityInformation *)self signingError];
      uint64_t v12 = [v6 signingError];
      if (EFObjectsAreEqual())
      {
        uint64_t v13 = [(MEMessageSecurityInformation *)self encryptionError];
        v14 = [v6 encryptionError];
        if (EFObjectsAreEqual()
          && (int v15 = [(MEMessageSecurityInformation *)self shouldBlockRemoteContent],
              v15 == [v6 shouldBlockRemoteContent])
          && (int v16 = -[MEMessageSecurityInformation disallowUsersToLoadRemoteContent](self, "disallowUsersToLoadRemoteContent"), v16 == [v6 disallowUsersToLoadRemoteContent]))
        {
          v19 = [(MEMessageSecurityInformation *)self localizedRemoteContentBlockingReason];
          v18 = [v6 localizedRemoteContentBlockingReason];
          char v10 = EFObjectsAreEqual();
        }
        else
        {
          char v10 = 0;
        }
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_signers hash];
  BOOL isEncrypted = self->_isEncrypted;
  uint64_t v5 = [(NSError *)self->_signingError hash];
  uint64_t v6 = [(NSError *)self->_encryptionError hash];
  BOOL shouldBlockRemoteContent = self->_shouldBlockRemoteContent;
  return 33 * (33 * (33 * (33 * (33 * v3 + isEncrypted) + v5) + v6) + shouldBlockRemoteContent)
       + [(NSString *)self->_localizedRemoteContentBlockingReason hash]
       + 1291467969;
}

- (NSArray)signers
{
  return self->_signers;
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (NSError)signingError
{
  return self->_signingError;
}

- (NSError)encryptionError
{
  return self->_encryptionError;
}

- (BOOL)shouldBlockRemoteContent
{
  return self->_shouldBlockRemoteContent;
}

- (NSString)localizedRemoteContentBlockingReason
{
  return self->_localizedRemoteContentBlockingReason;
}

- (NSString)decoderID
{
  return self->_decoderID;
}

- (void)setDecoderID:(id)a3
{
}

- (BOOL)disallowUsersToLoadRemoteContent
{
  return self->_disallowUsersToLoadRemoteContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoderID, 0);
  objc_storeStrong((id *)&self->_localizedRemoteContentBlockingReason, 0);
  objc_storeStrong((id *)&self->_encryptionError, 0);
  objc_storeStrong((id *)&self->_signingError, 0);
  objc_storeStrong((id *)&self->_signers, 0);
}

@end