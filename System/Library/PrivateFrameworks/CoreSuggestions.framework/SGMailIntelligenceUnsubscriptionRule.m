@interface SGMailIntelligenceUnsubscriptionRule
+ (BOOL)supportsSecureCoding;
+ (id)prettyNameForUnsubscriptionRuleField:(int64_t)a3;
- (NSNumber)mailCount;
- (NSNumber)score;
- (NSString)value;
- (SGMailIntelligenceUnsubscriptionRule)initWithCoder:(id)a3;
- (SGMailIntelligenceUnsubscriptionRule)initWithUnsubscriptionRuleField:(int64_t)a3 tokenCounts:(id)a4;
- (SGMailIntelligenceUnsubscriptionRule)initWithUnsubscriptionRuleField:(int64_t)a3 value:(id)a4 mailCount:(id)a5 score:(id)a6;
- (id)description;
- (int64_t)unsubscriptionRuleField;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGMailIntelligenceUnsubscriptionRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_mailCount, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

- (NSNumber)score
{
  return self->_score;
}

- (NSNumber)mailCount
{
  return self->_mailCount;
}

- (NSString)value
{
  return self->_value;
}

- (int64_t)unsubscriptionRuleField
{
  return self->_unsubscriptionRuleField;
}

- (id)description
{
  id v3 = [NSString alloc];
  [(NSNumber *)self->_score floatValue];
  double v5 = (float)(v4 * 100.0);
  mailCount = self->_mailCount;
  v7 = +[SGMailIntelligenceUnsubscriptionRule prettyNameForUnsubscriptionRuleField:self->_unsubscriptionRuleField];
  v8 = (void *)[v3 initWithFormat:@"<SGMailIntelligenceUnsubscriptionRule: %.1f%% of the %@ mails from %@ \"%@\" were ignorable>", *(void *)&v5, mailCount, v7, self->_value];

  return v8;
}

- (SGMailIntelligenceUnsubscriptionRule)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = sgMailIntelligenceLogHandle();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"unsubscriptionRuleField" withCoder:v4 expectNonNull:1 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v7];

  v9 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v10 = objc_opt_class();
  v11 = sgMailIntelligenceLogHandle();
  v12 = [v9 robustDecodeObjectOfClass:v10 forKey:@"value" withCoder:v4 expectNonNull:1 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v11];

  v13 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v14 = objc_opt_class();
  v15 = sgMailIntelligenceLogHandle();
  v16 = [v13 robustDecodeObjectOfClass:v14 forKey:@"mailCount" withCoder:v4 expectNonNull:1 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v15];

  v17 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v18 = objc_opt_class();
  v19 = sgMailIntelligenceLogHandle();
  v20 = [v17 robustDecodeObjectOfClass:v18 forKey:@"score" withCoder:v4 expectNonNull:1 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v19];

  v21 = 0;
  if (v8 && v12 && v16 && v20)
  {
    v22 = [v4 error];

    if (v22) {
      v21 = 0;
    }
    else {
      v21 = -[SGMailIntelligenceUnsubscriptionRule initWithUnsubscriptionRuleField:value:mailCount:score:]([SGMailIntelligenceUnsubscriptionRule alloc], "initWithUnsubscriptionRuleField:value:mailCount:score:", [v8 integerValue], v12, v16, v20);
    }
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  int64_t unsubscriptionRuleField = self->_unsubscriptionRuleField;
  id v7 = a3;
  uint64_t v6 = [v4 numberWithInteger:unsubscriptionRuleField];
  [v7 encodeObject:v6 forKey:@"unsubscriptionRuleField"];

  [v7 encodeObject:self->_value forKey:@"value"];
  [v7 encodeObject:self->_mailCount forKey:@"mailCount"];
  [v7 encodeObject:self->_score forKey:@"score"];
}

- (SGMailIntelligenceUnsubscriptionRule)initWithUnsubscriptionRuleField:(int64_t)a3 tokenCounts:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"SGMailIntelligenceUnsubscriptionRule.m", 41, @"Invalid parameter not satisfying: %@", @"tokenCounts != nil" object file lineNumber description];
  }
  v28.receiver = self;
  v28.super_class = (Class)SGMailIntelligenceUnsubscriptionRule;
  v8 = [(SGMailIntelligenceUnsubscriptionRule *)&v28 init];
  v9 = v8;
  if (v8)
  {
    v8->_int64_t unsubscriptionRuleField = a3;
    uint64_t v10 = [v7 token];
    value = v9->_value;
    v9->_value = (NSString *)v10;

    v12 = [v7 salientCount];
    uint64_t v13 = [v12 unsignedIntegerValue];
    uint64_t v14 = [v7 regularCount];
    uint64_t v15 = [v14 unsignedIntegerValue] + v13;

    v16 = (void *)0x1E4F28000;
    uint64_t v17 = [NSNumber numberWithUnsignedInteger:v15];
    mailCount = v9->_mailCount;
    v9->_mailCount = (NSNumber *)v17;

    v19 = NSNumber;
    if (v15)
    {
      v16 = [v7 regularCount];
      [v16 doubleValue];
      double v21 = v20;
      [(NSNumber *)v9->_mailCount doubleValue];
      double v23 = v21 / v22;
    }
    else
    {
      double v23 = 0.0;
    }
    uint64_t v24 = [v19 numberWithDouble:v23];
    score = v9->_score;
    v9->_score = (NSNumber *)v24;

    if (v15) {
  }
    }

  return v9;
}

- (SGMailIntelligenceUnsubscriptionRule)initWithUnsubscriptionRuleField:(int64_t)a3 value:(id)a4 mailCount:(id)a5 score:(id)a6
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_8:
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SGMailIntelligenceUnsubscriptionRule.m", 27, @"Invalid parameter not satisfying: %@", @"mailCount != nil" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"SGMailIntelligenceUnsubscriptionRule.m", 26, @"Invalid parameter not satisfying: %@", @"value != nil" object file lineNumber description];

  if (!v13) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  double v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"SGMailIntelligenceUnsubscriptionRule.m", 28, @"Invalid parameter not satisfying: %@", @"score != nil" object file lineNumber description];

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)SGMailIntelligenceUnsubscriptionRule;
  uint64_t v15 = [(SGMailIntelligenceUnsubscriptionRule *)&v21 init];
  v16 = v15;
  if (v15)
  {
    v15->_int64_t unsubscriptionRuleField = a3;
    objc_storeStrong((id *)&v15->_value, a4);
    objc_storeStrong((id *)&v16->_mailCount, a5);
    objc_storeStrong((id *)&v16->_score, a6);
  }

  return v16;
}

+ (id)prettyNameForUnsubscriptionRuleField:(int64_t)a3
{
  if (a3) {
    return @"sender's domain";
  }
  else {
    return @"sender";
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end