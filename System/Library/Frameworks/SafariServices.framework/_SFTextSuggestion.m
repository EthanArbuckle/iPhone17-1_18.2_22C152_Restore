@interface _SFTextSuggestion
+ (BOOL)supportsSecureCoding;
+ (_SFTextSuggestion)textSuggestionWithCredentialIdentity:(id)a3 submitForm:(BOOL)a4;
+ (_SFTextSuggestion)textSuggestionWithCreditCardData:(id)a3;
+ (_SFTextSuggestion)textSuggestionWithESimDataType:(int64_t)a3;
+ (_SFTextSuggestion)textSuggestionWithGeneratedPassword:(id)a3;
+ (_SFTextSuggestion)textSuggestionWithHideMyEmailRecord:(id)a3;
+ (_SFTextSuggestion)textSuggestionWithOneTimeCode:(id)a3;
+ (_SFTextSuggestion)textSuggestionWithSavedAccountMatch:(id)a3 submitForm:(BOOL)a4;
+ (_SFTextSuggestion)textSuggestionWithSingleCreditCardDataValue:(id)a3;
+ (_SFTextSuggestion)textSuggestionWithSingleDisplayData:(id)a3;
+ (_SFTextSuggestion)textSuggestionWithUsername:(id)a3;
+ (id)textSuggestionToCustomizeGeneratedPassword;
+ (id)textSuggestionToProvisionHideMyEmailRecord;
- (BOOL)submitForm;
- (NSString)generatedPassword;
- (NSString)username;
- (NSURLCredential)urlCredential;
- (SFAutoFillOneTimeCode)oneTimeCode;
- (SFCredentialIdentity)credentialIdentity;
- (SFSingleCreditCardData)singleCreditCardData;
- (WBSCreditCardData)creditCardData;
- (WBSHideMyEmailRecord)emailRecord;
- (WBSSavedAccountMatch)savedAccountMatch;
- (WBUAutoFillDisplayData)singleDisplayData;
- (_SFTextSuggestion)initWithCoder:(id)a3;
- (_SFTextSuggestion)initWithTextSuggestionType:(int64_t)a3;
- (int64_t)eSimDataType;
- (int64_t)textSuggestionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SFTextSuggestion

- (_SFTextSuggestion)initWithTextSuggestionType:(int64_t)a3
{
  v17.receiver = self;
  v17.super_class = (Class)_SFTextSuggestion;
  v4 = [(UITextSuggestion *)&v17 init];
  v5 = v4;
  if (v4)
  {
    [(UITextSuggestion *)v4 setDisplayStylePlain:1];
    v5->_textSuggestionType = a3;
    generatedPassword = v5->_generatedPassword;
    v5->_generatedPassword = 0;

    username = v5->_username;
    v5->_username = 0;

    urlCredential = v5->_urlCredential;
    v5->_urlCredential = 0;

    savedAccountMatch = v5->_savedAccountMatch;
    v5->_savedAccountMatch = 0;

    v5->_submitForm = 0;
    singleDisplayData = v5->_singleDisplayData;
    v5->_singleDisplayData = 0;

    creditCardData = v5->_creditCardData;
    v5->_creditCardData = 0;

    singleCreditCardData = v5->_singleCreditCardData;
    v5->_singleCreditCardData = 0;

    credentialIdentity = v5->_credentialIdentity;
    v5->_credentialIdentity = 0;

    emailRecord = v5->_emailRecord;
    v5->_emailRecord = 0;

    v15 = v5;
  }

  return v5;
}

+ (_SFTextSuggestion)textSuggestionWithOneTimeCode:(id)a3
{
  v3 = (SFAutoFillOneTimeCode *)a3;
  v4 = [[_SFTextSuggestion alloc] initWithTextSuggestionType:0];
  oneTimeCode = v4->_oneTimeCode;
  v4->_oneTimeCode = v3;

  return v4;
}

+ (_SFTextSuggestion)textSuggestionWithGeneratedPassword:(id)a3
{
  v3 = (NSString *)a3;
  v4 = [[_SFTextSuggestion alloc] initWithTextSuggestionType:1];
  generatedPassword = v4->_generatedPassword;
  v4->_generatedPassword = v3;

  return v4;
}

+ (id)textSuggestionToCustomizeGeneratedPassword
{
  v2 = [[_SFTextSuggestion alloc] initWithTextSuggestionType:2];

  return v2;
}

+ (_SFTextSuggestion)textSuggestionWithUsername:(id)a3
{
  v3 = (NSString *)a3;
  v4 = [[_SFTextSuggestion alloc] initWithTextSuggestionType:3];
  username = v4->_username;
  v4->_username = v3;

  return v4;
}

+ (_SFTextSuggestion)textSuggestionWithSavedAccountMatch:(id)a3 submitForm:(BOOL)a4
{
  v5 = (WBSSavedAccountMatch *)a3;
  v6 = [[_SFTextSuggestion alloc] initWithTextSuggestionType:4];
  savedAccountMatch = v6->_savedAccountMatch;
  v6->_savedAccountMatch = v5;

  v6->_submitForm = a4;

  return v6;
}

+ (_SFTextSuggestion)textSuggestionWithSingleDisplayData:(id)a3
{
  v3 = (WBUAutoFillDisplayData *)a3;
  v4 = [[_SFTextSuggestion alloc] initWithTextSuggestionType:5];
  singleDisplayData = v4->_singleDisplayData;
  v4->_singleDisplayData = v3;

  return v4;
}

+ (_SFTextSuggestion)textSuggestionWithCredentialIdentity:(id)a3 submitForm:(BOOL)a4
{
  v5 = (SFCredentialIdentity *)a3;
  v6 = [[_SFTextSuggestion alloc] initWithTextSuggestionType:6];
  credentialIdentity = v6->_credentialIdentity;
  v6->_credentialIdentity = v5;

  v6->_submitForm = a4;

  return v6;
}

+ (_SFTextSuggestion)textSuggestionWithCreditCardData:(id)a3
{
  v3 = (WBSCreditCardData *)a3;
  v4 = [[_SFTextSuggestion alloc] initWithTextSuggestionType:7];
  creditCardData = v4->_creditCardData;
  v4->_creditCardData = v3;

  return v4;
}

+ (_SFTextSuggestion)textSuggestionWithSingleCreditCardDataValue:(id)a3
{
  v3 = (SFSingleCreditCardData *)a3;
  v4 = [[_SFTextSuggestion alloc] initWithTextSuggestionType:8];
  singleCreditCardData = v4->_singleCreditCardData;
  v4->_singleCreditCardData = v3;

  return v4;
}

+ (_SFTextSuggestion)textSuggestionWithHideMyEmailRecord:(id)a3
{
  v3 = (WBSHideMyEmailRecord *)a3;
  v4 = [[_SFTextSuggestion alloc] initWithTextSuggestionType:9];
  emailRecord = v4->_emailRecord;
  v4->_emailRecord = v3;

  return v4;
}

+ (id)textSuggestionToProvisionHideMyEmailRecord
{
  v2 = [[_SFTextSuggestion alloc] initWithTextSuggestionType:10];

  return v2;
}

+ (_SFTextSuggestion)textSuggestionWithESimDataType:(int64_t)a3
{
  v4 = [[_SFTextSuggestion alloc] initWithTextSuggestionType:11];
  v4->_eSimDataType = a3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SFTextSuggestion;
  id v4 = a3;
  [(UITextSuggestion *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt:forKey:", LODWORD(self->_textSuggestionType), @"textSuggestionType", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_oneTimeCode forKey:@"oneTimeCode"];
  [v4 encodeObject:self->_generatedPassword forKey:@"generatedPassword"];
  [v4 encodeObject:self->_username forKey:@"username"];
  [v4 encodeObject:self->_urlCredential forKey:@"urlCredential"];
  [v4 encodeBool:self->_submitForm forKey:@"submitForm"];
  [v4 encodeObject:self->_singleDisplayData forKey:@"singleDisplayData"];
  [v4 encodeObject:self->_creditCardData forKey:@"creditCardData"];
  [v4 encodeObject:self->_singleCreditCardData forKey:@"singleCreditCardData"];
  [v4 encodeObject:self->_credentialIdentity forKey:@"credentialIdentity"];
  [v4 encodeObject:self->_emailRecord forKey:@"emailRecord"];
}

- (_SFTextSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_SFTextSuggestion;
  objc_super v5 = [(UITextSuggestion *)&v27 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    [(UITextSuggestion *)v5 setDisplayStylePlain:1];
    v6->_textSuggestionType = [v4 decodeIntegerForKey:@"textSuggestionType"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"oneTimeCode"];
    oneTimeCode = v6->_oneTimeCode;
    v6->_oneTimeCode = (SFAutoFillOneTimeCode *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"generatedPassword"];
    generatedPassword = v6->_generatedPassword;
    v6->_generatedPassword = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"username"];
    username = v6->_username;
    v6->_username = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"urlCredential"];
    urlCredential = v6->_urlCredential;
    v6->_urlCredential = (NSURLCredential *)v13;

    v6->_submitForm = [v4 decodeBoolForKey:@"submitForm"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"singleDisplayData"];
    singleDisplayData = v6->_singleDisplayData;
    v6->_singleDisplayData = (WBUAutoFillDisplayData *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creditCardData"];
    creditCardData = v6->_creditCardData;
    v6->_creditCardData = (WBSCreditCardData *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"singleCreditCardData"];
    singleCreditCardData = v6->_singleCreditCardData;
    v6->_singleCreditCardData = (SFSingleCreditCardData *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialIdentity"];
    credentialIdentity = v6->_credentialIdentity;
    v6->_credentialIdentity = (SFCredentialIdentity *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"emailRecord"];
    emailRecord = v6->_emailRecord;
    v6->_emailRecord = (WBSHideMyEmailRecord *)v23;

    v25 = v6;
  }

  return v6;
}

- (int64_t)textSuggestionType
{
  return self->_textSuggestionType;
}

- (SFAutoFillOneTimeCode)oneTimeCode
{
  return self->_oneTimeCode;
}

- (NSString)generatedPassword
{
  return self->_generatedPassword;
}

- (NSString)username
{
  return self->_username;
}

- (NSURLCredential)urlCredential
{
  return self->_urlCredential;
}

- (WBSSavedAccountMatch)savedAccountMatch
{
  return self->_savedAccountMatch;
}

- (BOOL)submitForm
{
  return self->_submitForm;
}

- (WBUAutoFillDisplayData)singleDisplayData
{
  return self->_singleDisplayData;
}

- (WBSCreditCardData)creditCardData
{
  return self->_creditCardData;
}

- (SFSingleCreditCardData)singleCreditCardData
{
  return self->_singleCreditCardData;
}

- (SFCredentialIdentity)credentialIdentity
{
  return self->_credentialIdentity;
}

- (WBSHideMyEmailRecord)emailRecord
{
  return self->_emailRecord;
}

- (int64_t)eSimDataType
{
  return self->_eSimDataType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailRecord, 0);
  objc_storeStrong((id *)&self->_credentialIdentity, 0);
  objc_storeStrong((id *)&self->_singleCreditCardData, 0);
  objc_storeStrong((id *)&self->_creditCardData, 0);
  objc_storeStrong((id *)&self->_singleDisplayData, 0);
  objc_storeStrong((id *)&self->_savedAccountMatch, 0);
  objc_storeStrong((id *)&self->_urlCredential, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_generatedPassword, 0);

  objc_storeStrong((id *)&self->_oneTimeCode, 0);
}

@end