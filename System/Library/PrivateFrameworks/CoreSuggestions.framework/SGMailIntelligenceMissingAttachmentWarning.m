@interface SGMailIntelligenceMissingAttachmentWarning
+ (BOOL)supportsSecureCoding;
- (SGMailIntelligenceMissingAttachmentWarning)initWithCoder:(id)a3;
- (id)description;
@end

@implementation SGMailIntelligenceMissingAttachmentWarning

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(SGMailIntelligenceWarning *)self snippet];
  v5 = [(SGMailIntelligenceWarning *)self signature];
  v6 = [(SGMailIntelligenceWarning *)self score];
  v7 = (void *)[v3 initWithFormat:@"<SGMailIntelligenceMissingAttachmentWarning triggered on: %@ (with signature %@) score: %@>", v4, v5, v6];

  return v7;
}

- (SGMailIntelligenceMissingAttachmentWarning)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [[SGMailIntelligenceWarning alloc] initWithCoder:v4];

  if (v5)
  {
    v6 = [SGMailIntelligenceMissingAttachmentWarning alloc];
    v7 = [(SGMailIntelligenceWarning *)v5 snippet];
    v8 = [(SGMailIntelligenceWarning *)v5 core];
    v9 = [(SGMailIntelligenceWarning *)v5 signature];
    v10 = [(SGMailIntelligenceWarning *)v5 detectedLanguage];
    uint64_t v11 = [(SGMailIntelligenceWarning *)v5 isIncomingMessage];
    v12 = [(SGMailIntelligenceWarning *)v5 score];
    v13 = [(SGMailIntelligenceWarning *)v6 initWithSnippet:v7 core:v8 signature:v9 detectedLanguage:v10 isIncomingMessage:v11 score:v12];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end