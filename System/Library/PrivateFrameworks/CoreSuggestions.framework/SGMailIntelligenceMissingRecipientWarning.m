@interface SGMailIntelligenceMissingRecipientWarning
+ (BOOL)supportsSecureCoding;
- (NSString)handle;
- (NSString)matchFoundInBCC;
- (SGMailIntelligenceMissingRecipientWarning)initWithCoder:(id)a3;
- (SGMailIntelligenceMissingRecipientWarning)initWithSnippet:(id)a3 core:(id)a4 handle:(id)a5 signature:(id)a6 detectedLanguage:(id)a7 isIncomingMessage:(BOOL)a8 score:(id)a9 matchFoundInBCC:(id)a10;
- (SGMailIntelligenceMissingRecipientWarning)initWithSnippet:(id)a3 core:(id)a4 signature:(id)a5 detectedLanguage:(id)a6 isIncomingMessage:(BOOL)a7 score:(id)a8 matchFoundInBCC:(id)a9;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGMailIntelligenceMissingRecipientWarning

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchFoundInBCC, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

- (NSString)matchFoundInBCC
{
  return self->_matchFoundInBCC;
}

- (NSString)handle
{
  return self->_handle;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(SGMailIntelligenceWarning *)self snippet];
  v5 = [(SGMailIntelligenceWarning *)self signature];
  v6 = [(SGMailIntelligenceWarning *)self core];
  v7 = [(SGMailIntelligenceMissingRecipientWarning *)self handle];
  uint64_t v8 = [(SGMailIntelligenceWarning *)self score];
  v9 = (void *)v8;
  if (self->_matchFoundInBCC)
  {
    v10 = (void *)[[NSString alloc] initWithFormat:@" BCC match:%@", self->_matchFoundInBCC];
    v11 = (void *)[v3 initWithFormat:@"<SGMailIntelligenceMissingRecipientWarning triggered on: %@ (with signature %@) core:%@ handle:%@ score: %@%@>", v4, v5, v6, v7, v9, v10];
  }
  else
  {
    v11 = (void *)[v3 initWithFormat:@"<SGMailIntelligenceMissingRecipientWarning triggered on: %@ (with signature %@) core:%@ handle:%@ score: %@%@>", v4, v5, v6, v7, v8, &stru_1EF915628];
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SGMailIntelligenceMissingRecipientWarning;
  id v4 = a3;
  [(SGMailIntelligenceWarning *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_matchFoundInBCC, @"matchFoundInBCC", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_handle forKey:@"handle"];
}

- (SGMailIntelligenceMissingRecipientWarning)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[SGMailIntelligenceWarning alloc] initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = sgMailIntelligenceLogHandle();
    v9 = [v6 robustDecodeObjectOfClass:v7 forKey:@"matchFoundInBCC" withCoder:v4 expectNonNull:0 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v8];

    v10 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v11 = objc_opt_class();
    v12 = sgMailIntelligenceLogHandle();
    v13 = [v10 robustDecodeObjectOfClass:v11 forKey:@"handle" withCoder:v4 expectNonNull:0 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v12];

    v14 = [v4 error];

    if (v14)
    {
      v15 = 0;
    }
    else
    {
      v23 = [SGMailIntelligenceMissingRecipientWarning alloc];
      [(SGMailIntelligenceWarning *)v5 snippet];
      v16 = v24 = self;
      v17 = [(SGMailIntelligenceWarning *)v5 core];
      v18 = [(SGMailIntelligenceWarning *)v5 signature];
      v19 = [(SGMailIntelligenceWarning *)v5 detectedLanguage];
      uint64_t v20 = [(SGMailIntelligenceWarning *)v5 isIncomingMessage];
      v21 = [(SGMailIntelligenceWarning *)v5 score];
      v15 = [(SGMailIntelligenceMissingRecipientWarning *)v23 initWithSnippet:v16 core:v17 handle:v13 signature:v18 detectedLanguage:v19 isIncomingMessage:v20 score:v21 matchFoundInBCC:v9];

      self = v24;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (SGMailIntelligenceMissingRecipientWarning)initWithSnippet:(id)a3 core:(id)a4 handle:(id)a5 signature:(id)a6 detectedLanguage:(id)a7 isIncomingMessage:(BOOL)a8 score:(id)a9 matchFoundInBCC:(id)a10
{
  BOOL v10 = a8;
  id v21 = a5;
  id v17 = a10;
  v22.receiver = self;
  v22.super_class = (Class)SGMailIntelligenceMissingRecipientWarning;
  v18 = [(SGMailIntelligenceWarning *)&v22 initWithSnippet:a3 core:a4 signature:a6 detectedLanguage:a7 isIncomingMessage:v10 score:a9];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_matchFoundInBCC, a10);
    objc_storeStrong((id *)&v19->_handle, a5);
  }

  return v19;
}

- (SGMailIntelligenceMissingRecipientWarning)initWithSnippet:(id)a3 core:(id)a4 signature:(id)a5 detectedLanguage:(id)a6 isIncomingMessage:(BOOL)a7 score:(id)a8 matchFoundInBCC:(id)a9
{
  BOOL v10 = a7;
  id v16 = a9;
  v21.receiver = self;
  v21.super_class = (Class)SGMailIntelligenceMissingRecipientWarning;
  id v17 = [(SGMailIntelligenceWarning *)&v21 initWithSnippet:a3 core:a4 signature:a5 detectedLanguage:a6 isIncomingMessage:v10 score:a8];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_matchFoundInBCC, a9);
    handle = v18->_handle;
    v18->_handle = 0;
  }
  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end