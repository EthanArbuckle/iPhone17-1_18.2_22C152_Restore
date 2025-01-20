@interface AFOpportuneSpeakingModelFeedback
+ (BOOL)supportsSecureCoding;
- (AFOpportuneSpeakingModelFeedback)initWithCoder:(id)a3;
- (NSDate)lastNegativeFeedback;
- (NSDictionary)negativeFeedbackByContact;
- (void)encodeWithCoder:(id)a3;
- (void)setLastNegativeFeedback:(id)a3;
- (void)setNegativeFeedbackByContact:(id)a3;
@end

@implementation AFOpportuneSpeakingModelFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeFeedbackByContact, 0);
  objc_storeStrong((id *)&self->_lastNegativeFeedback, 0);
}

- (void)setNegativeFeedbackByContact:(id)a3
{
}

- (NSDictionary)negativeFeedbackByContact
{
  return self->_negativeFeedbackByContact;
}

- (void)setLastNegativeFeedback:(id)a3
{
}

- (NSDate)lastNegativeFeedback
{
  return self->_lastNegativeFeedback;
}

- (void)encodeWithCoder:(id)a3
{
  lastNegativeFeedback = self->_lastNegativeFeedback;
  id v5 = a3;
  [v5 encodeObject:lastNegativeFeedback forKey:@"_lastNegativeFeedback"];
  [v5 encodeObject:self->_negativeFeedbackByContact forKey:@"_negativeFeedbackByContact"];
}

- (AFOpportuneSpeakingModelFeedback)initWithCoder:(id)a3
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AFOpportuneSpeakingModelFeedback;
  id v5 = [(AFOpportuneSpeakingModelFeedback *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lastNegativeFeedback"];
    lastNegativeFeedback = v5->_lastNegativeFeedback;
    v5->_lastNegativeFeedback = (NSDate *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
    v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_negativeFeedbackByContact"];
    negativeFeedbackByContact = v5->_negativeFeedbackByContact;
    v5->_negativeFeedbackByContact = (NSDictionary *)v11;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end