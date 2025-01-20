@interface AKFidoContext
+ (BOOL)supportsSecureCoding;
- (AKFidoContext)initWithChallenge:(id)a3 relyingPartyIdentifier:(id)a4 userIdentifier:(id)a5 displayName:(id)a6 credentialName:(id)a7 credentials:(id)a8;
- (AKFidoContext)initWithChallengeString:(id)a3 relyingPartyIdentifier:(id)a4 userIdentifierString:(id)a5 displayName:(id)a6 credentialName:(id)a7 credentials:(id)a8;
- (AKFidoContext)initWithCoder:(id)a3;
- (AKFidoContext)initWithParameters:(id)a3;
- (BOOL)useAlternativeKeysIcon;
- (NSArray)credentials;
- (NSData)challenge;
- (NSData)userIdentifier;
- (NSString)credentialName;
- (NSString)displayName;
- (NSString)incorrectKeyPresentedMessage;
- (NSString)originalChallenge;
- (NSString)promptBody;
- (NSString)promptHeader;
- (NSString)promptTitle;
- (NSString)relyingPartyIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setIncorrectKeyPresentedMessage:(id)a3;
- (void)setPromptBody:(id)a3;
- (void)setPromptHeader:(id)a3;
- (void)setPromptTitle:(id)a3;
- (void)setUseAlternativeKeysIcon:(BOOL)a3;
@end

@implementation AKFidoContext

- (AKFidoContext)initWithParameters:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"challenge"];
  v6 = objc_msgSend(v5, "aaf_base64Padded");

  v7 = [v4 objectForKeyedSubscript:@"rpid"];
  v8 = [v4 objectForKeyedSubscript:@"credentialIds"];

  v9 = [(AKFidoContext *)self initWithChallengeString:v6 relyingPartyIdentifier:v7 userIdentifierString:0 displayName:0 credentialName:0 credentials:v8];
  return v9;
}

- (AKFidoContext)initWithChallengeString:(id)a3 relyingPartyIdentifier:(id)a4 userIdentifierString:(id)a5 displayName:(id)a6 credentialName:(id)a7 credentials:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a4;
  v20 = objc_msgSend(v14, "aaf_base64Padded");
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v20 options:0];
  if (!v21)
  {
    v21 = [v14 dataUsingEncoding:4];
  }
  v22 = [v15 dataUsingEncoding:4];
  v23 = [(AKFidoContext *)self initWithChallenge:v21 relyingPartyIdentifier:v19 userIdentifier:v22 displayName:v18 credentialName:v17 credentials:v16];

  if (v23) {
    objc_storeStrong((id *)&v23->_originalChallenge, a3);
  }

  return v23;
}

- (AKFidoContext)initWithChallenge:(id)a3 relyingPartyIdentifier:(id)a4 userIdentifier:(id)a5 displayName:(id)a6 credentialName:(id)a7 credentials:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)AKFidoContext;
  id v18 = [(AKFidoContext *)&v24 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_challenge, a3);
    objc_storeStrong((id *)&v19->_userIdentifier, a5);
    objc_storeStrong((id *)&v19->_relyingPartyIdentifier, a4);
    objc_storeStrong((id *)&v19->_displayName, a6);
    objc_storeStrong((id *)&v19->_credentialName, a7);
    objc_storeStrong((id *)&v19->_credentials, a8);
  }

  return v19;
}

- (AKFidoContext)initWithCoder:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_relyingPartyIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_challenge"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userIdentifier"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_displayName"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_credentialName"];
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v12 = [v10 setWithArray:v11];

  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_credentials"];
  id v14 = [(AKFidoContext *)self initWithChallenge:v6 relyingPartyIdentifier:v5 userIdentifier:v7 displayName:v8 credentialName:v9 credentials:v13];
  if (v14)
  {
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_originalChallenge"];
    originalChallenge = v14->_originalChallenge;
    v14->_originalChallenge = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_promptTitle"];
    promptTitle = v14->_promptTitle;
    v14->_promptTitle = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_promptHeader"];
    promptHeader = v14->_promptHeader;
    v14->_promptHeader = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_promptBody"];
    promptBody = v14->_promptBody;
    v14->_promptBody = (NSString *)v21;

    v14->_useAlternativeKeysIcon = [v4 decodeBoolForKey:@"_useAlternativeKeysIcon"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_incorrectKeyPresentedMessage"];
    incorrectKeyPresentedMessage = v14->_incorrectKeyPresentedMessage;
    v14->_incorrectKeyPresentedMessage = (NSString *)v23;
  }
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  id v5 = a3;
  [v5 encodeObject:relyingPartyIdentifier forKey:@"_relyingPartyIdentifier"];
  [v5 encodeObject:self->_challenge forKey:@"_challenge"];
  [v5 encodeObject:self->_originalChallenge forKey:@"_originalChallenge"];
  [v5 encodeObject:self->_userIdentifier forKey:@"_userIdentifier"];
  [v5 encodeObject:self->_displayName forKey:@"_displayName"];
  [v5 encodeObject:self->_credentialName forKey:@"_credentialName"];
  [v5 encodeObject:self->_credentials forKey:@"_credentials"];
  [v5 encodeObject:self->_promptTitle forKey:@"_promptTitle"];
  [v5 encodeObject:self->_promptHeader forKey:@"_promptHeader"];
  [v5 encodeObject:self->_promptBody forKey:@"_promptBody"];
  [v5 encodeBool:self->_useAlternativeKeysIcon forKey:@"_useAlternativeKeysIcon"];
  [v5 encodeObject:self->_incorrectKeyPresentedMessage forKey:@"_incorrectKeyPresentedMessage"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSString *)self->_relyingPartyIdentifier copy];
  v6 = (void *)*((void *)v4 + 4);
  *((void *)v4 + 4) = v5;

  uint64_t v7 = [(NSData *)self->_challenge copy];
  v8 = (void *)*((void *)v4 + 2);
  *((void *)v4 + 2) = v7;

  uint64_t v9 = [(NSString *)self->_originalChallenge copy];
  v10 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v9;

  uint64_t v11 = [(NSData *)self->_userIdentifier copy];
  v12 = (void *)*((void *)v4 + 5);
  *((void *)v4 + 5) = v11;

  uint64_t v13 = [(NSString *)self->_displayName copy];
  id v14 = (void *)*((void *)v4 + 6);
  *((void *)v4 + 6) = v13;

  uint64_t v15 = [(NSString *)self->_credentialName copy];
  id v16 = (void *)*((void *)v4 + 7);
  *((void *)v4 + 7) = v15;

  uint64_t v17 = [(NSArray *)self->_credentials copy];
  id v18 = (void *)*((void *)v4 + 8);
  *((void *)v4 + 8) = v17;

  uint64_t v19 = [(NSString *)self->_promptTitle copy];
  v20 = (void *)*((void *)v4 + 9);
  *((void *)v4 + 9) = v19;

  uint64_t v21 = [(NSString *)self->_promptHeader copy];
  id v22 = (void *)*((void *)v4 + 10);
  *((void *)v4 + 10) = v21;

  uint64_t v23 = [(NSString *)self->_promptBody copy];
  objc_super v24 = (void *)*((void *)v4 + 11);
  *((void *)v4 + 11) = v23;

  *((unsigned char *)v4 + 8) = self->_useAlternativeKeysIcon;
  objc_storeStrong((id *)v4 + 12, self->_incorrectKeyPresentedMessage);
  return v4;
}

- (id)debugDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p {\n\tRelyingPartyIdentifier: %@, \n\tChallenge: %@, \n\tOriginal Challenge: %@, \n\tUserIdentifier: %@, \n\tDisplayName: %@, \n\tCredentialName: %@, \n\tCredentials: %@, \n\tPromptTitle: %@, \n\tPromptHeader: %@, \n\tPromptBody: %@, \n\tIncorrectKeyPresentedMessage: %@, \n}>", v5, self, self->_relyingPartyIdentifier, self->_challenge, self->_originalChallenge, self->_userIdentifier, self->_displayName, self->_credentialName, self->_credentials, self->_promptTitle, self->_promptHeader, self->_promptBody, self->_incorrectKeyPresentedMessage];

  return v6;
}

- (NSData)challenge
{
  return self->_challenge;
}

- (NSString)originalChallenge
{
  return self->_originalChallenge;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (NSData)userIdentifier
{
  return self->_userIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)credentialName
{
  return self->_credentialName;
}

- (NSArray)credentials
{
  return self->_credentials;
}

- (NSString)promptTitle
{
  return self->_promptTitle;
}

- (void)setPromptTitle:(id)a3
{
}

- (NSString)promptHeader
{
  return self->_promptHeader;
}

- (void)setPromptHeader:(id)a3
{
}

- (NSString)promptBody
{
  return self->_promptBody;
}

- (void)setPromptBody:(id)a3
{
}

- (NSString)incorrectKeyPresentedMessage
{
  return self->_incorrectKeyPresentedMessage;
}

- (void)setIncorrectKeyPresentedMessage:(id)a3
{
}

- (BOOL)useAlternativeKeysIcon
{
  return self->_useAlternativeKeysIcon;
}

- (void)setUseAlternativeKeysIcon:(BOOL)a3
{
  self->_useAlternativeKeysIcon = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incorrectKeyPresentedMessage, 0);
  objc_storeStrong((id *)&self->_promptBody, 0);
  objc_storeStrong((id *)&self->_promptHeader, 0);
  objc_storeStrong((id *)&self->_promptTitle, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_credentialName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_originalChallenge, 0);

  objc_storeStrong((id *)&self->_challenge, 0);
}

@end