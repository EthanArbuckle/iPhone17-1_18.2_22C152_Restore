@interface MADImageSafetyClassificationRequest
+ (BOOL)supportsSecureCoding;
- (MADImageSafetyClassificationRequest)initWithCoder:(id)a3;
- (NSString)conversationIdentifier;
- (NSString)stagedText;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setConversationIdentifier:(id)a3;
- (void)setStagedText:(id)a3;
@end

@implementation MADImageSafetyClassificationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADImageSafetyClassificationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MADImageSafetyClassificationRequest;
  v5 = [(MADRequest *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"StagedText"];
    stagedText = v5->_stagedText;
    v5->_stagedText = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ConversationIdentifier"];
    conversationIdentifier = v5->_conversationIdentifier;
    v5->_conversationIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADImageSafetyClassificationRequest;
  id v4 = a3;
  [(MADRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_stagedText, @"StagedText", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_conversationIdentifier forKey:@"ConversationIdentifier"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"stagedText: %@, ", self->_stagedText];
  [v3 appendFormat:@"conversationIdentifier: %@, ", self->_conversationIdentifier];
  uint64_t v6 = [(MADRequest *)self results];
  [v3 appendFormat:@"results: %@, ", v6];

  v7 = [(MADRequest *)self error];
  [v3 appendFormat:@"error: %@>", v7];

  return v3;
}

- (NSString)stagedText
{
  return self->_stagedText;
}

- (void)setStagedText:(id)a3
{
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (void)setConversationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_stagedText, 0);
}

@end