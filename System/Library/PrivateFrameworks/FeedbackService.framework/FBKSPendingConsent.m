@interface FBKSPendingConsent
- (BOOL)isRequired;
- (FBKSPendingConsent)initWithDictionary:(id)a3;
- (NSNumber)ID;
- (NSString)agreeButtonText;
- (NSString)bodyText;
- (NSString)consentTypeString;
- (NSString)declineButtonText;
- (NSString)symbolImageName;
- (NSString)title;
- (NSURL)learnMoreURL;
- (unint64_t)type;
@end

@implementation FBKSPendingConsent

- (FBKSPendingConsent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)FBKSPendingConsent;
  v5 = [(FBKSPendingConsent *)&v46 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"id"];
    ID = v5->_ID;
    v5->_ID = (NSNumber *)v6;

    v8 = [v4 objectForKeyedSubscript:@"type"];
    v9 = _FBKSNilIfNSNull(v8);
    v10 = v9;
    if (v9 && ([v9 isEqualToString:&stru_270018890] & 1) == 0)
    {
      v12 = [v10 lowercaseString];

      unint64_t v11 = [v12 isEqualToString:@"confidentiality_agreement"];
      v10 = v12;
    }
    else
    {
      unint64_t v11 = 0;
    }

    v5->_type = v11;
    uint64_t v13 = [v4 objectForKeyedSubscript:@"icon"];
    v14 = (void *)v13;
    if (v13) {
      v15 = (__CFString *)v13;
    }
    else {
      v15 = @"person.crop.circle";
    }
    objc_storeStrong((id *)&v5->_symbolImageName, v15);

    v16 = [v4 objectForKeyedSubscript:@"learn_more"];
    v17 = _FBKSNilIfNSNull(v16);

    uint64_t v18 = [NSURL URLWithString:v17];
    learnMoreURL = v5->_learnMoreURL;
    v5->_learnMoreURL = (NSURL *)v18;

    v20 = [v4 objectForKeyedSubscript:@"properties"];
    v5->_isRequired = [v20 containsObject:@"PARTICIPANT_REQUIRED"];

    v21 = [v4 objectForKeyedSubscript:@"title"];
    v22 = v21;
    if (v21)
    {
      v23 = v21;
      title = v5->_title;
      v5->_title = v23;
    }
    else
    {
      title = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v25 = [title localizedStringForKey:@"CONSENT_DEFAULT_TITLE" value:@"Apple and Your Privacy" table:0];
      v26 = v5->_title;
      v5->_title = (NSString *)v25;
    }
    v27 = [v4 objectForKeyedSubscript:@"text"];
    v28 = v27;
    if (v27)
    {
      v29 = v27;
      bodyText = v5->_bodyText;
      v5->_bodyText = v29;
    }
    else
    {
      bodyText = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v31 = [bodyText localizedStringForKey:@"CONSENT_DEFAULT_BODY" value:@"Please read the following terms to continue." table:0];
      v32 = v5->_bodyText;
      v5->_bodyText = (NSString *)v31;
    }
    v33 = [v4 objectForKeyedSubscript:@"agree_text_button"];
    v34 = v33;
    if (v33)
    {
      v35 = v33;
      agreeButtonText = v5->_agreeButtonText;
      v5->_agreeButtonText = v35;
    }
    else
    {
      agreeButtonText = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v37 = [agreeButtonText localizedStringForKey:@"CONSENT_DEFAULT_ACCEPT" value:@"Accept" table:0];
      v38 = v5->_agreeButtonText;
      v5->_agreeButtonText = (NSString *)v37;
    }
    v39 = [v4 objectForKeyedSubscript:@"decline_text_button"];
    v40 = v39;
    if (v39)
    {
      v41 = v39;
      declineButtonText = v5->_declineButtonText;
      v5->_declineButtonText = v41;
    }
    else
    {
      declineButtonText = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v43 = [declineButtonText localizedStringForKey:@"CONSENT_DEFAULT_DECLINE" value:@"Decline" table:0];
      v44 = v5->_declineButtonText;
      v5->_declineButtonText = (NSString *)v43;
    }
  }

  return v5;
}

- (NSString)consentTypeString
{
  if ([(FBKSPendingConsent *)self type] == 1) {
    return (NSString *)@"confidentiality_agreement";
  }
  else {
    return 0;
  }
}

- (NSNumber)ID
{
  return self->_ID;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (NSString)agreeButtonText
{
  return self->_agreeButtonText;
}

- (NSString)declineButtonText
{
  return self->_declineButtonText;
}

- (BOOL)isRequired
{
  return self->_isRequired;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declineButtonText, 0);
  objc_storeStrong((id *)&self->_agreeButtonText, 0);
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_ID, 0);
}

@end