@interface SGMailIntelligenceSaliency
+ (BOOL)supportsSecureCoding;
+ (id)decayScore:(id)a3 creationTime:(id)a4;
- (BOOL)isCounted;
- (BOOL)isSalient;
- (NSDate)creationDate;
- (NSNumber)decayedScore;
- (NSNumber)score;
- (NSString)mailboxId;
- (NSString)messageId;
- (SGMailIntelligenceSaliency)initWithCoder:(id)a3;
- (SGMailIntelligenceSaliency)initWithMessageId:(id)a3 mailboxId:(id)a4 score:(id)a5 isSalient:(BOOL)a6 creationDate:(id)a7;
- (SGMailIntelligenceSaliency)initWithMessageId:(id)a3 mailboxId:(id)a4 score:(id)a5 isSalient:(BOOL)a6 gteSaliency:(int64_t)a7 isCounted:(BOOL)a8 creationDate:(id)a9;
- (id)description;
- (int64_t)gteSaliency;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setGteSaliency:(int64_t)a3;
- (void)setIsCounted:(BOOL)a3;
@end

@implementation SGMailIntelligenceSaliency

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_mailboxId, 0);
  objc_storeStrong((id *)&self->_messageId, 0);

  objc_storeStrong((id *)&self->_score, 0);
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setIsCounted:(BOOL)a3
{
  self->_isCounted = a3;
}

- (BOOL)isCounted
{
  return self->_isCounted;
}

- (void)setGteSaliency:(int64_t)a3
{
  self->_gteSaliency = a3;
}

- (int64_t)gteSaliency
{
  return self->_gteSaliency;
}

- (BOOL)isSalient
{
  return self->_isSalient;
}

- (NSString)mailboxId
{
  return self->_mailboxId;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (NSNumber)score
{
  return self->_score;
}

- (NSNumber)decayedScore
{
  return (NSNumber *)+[SGMailIntelligenceSaliency decayScore:self->_score creationTime:self->_creationDate];
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = @"salient";
  if (!self->_isSalient) {
    v4 = @"regular";
  }
  v5 = (void *)[v3 initWithFormat:@"<SGMailIntelligenceSaliency score: %@ (%@), messageId: %@, mailboxId: %@>", self->_score, v4, self->_messageId, self->_mailboxId];

  return v5;
}

- (SGMailIntelligenceSaliency)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = sgMailIntelligenceLogHandle();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"messageId" withCoder:v4 expectNonNull:1 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v7];

  v9 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v10 = objc_opt_class();
  v11 = sgMailIntelligenceLogHandle();
  v12 = [v9 robustDecodeObjectOfClass:v10 forKey:@"mailboxId" withCoder:v4 expectNonNull:1 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v11];

  v13 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v14 = objc_opt_class();
  v15 = sgMailIntelligenceLogHandle();
  v16 = [v13 robustDecodeObjectOfClass:v14 forKey:@"score" withCoder:v4 expectNonNull:1 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v15];

  uint64_t v17 = [v4 decodeBoolForKey:@"isSalient"];
  v18 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v19 = objc_opt_class();
  v20 = sgMailIntelligenceLogHandle();
  v21 = [v18 robustDecodeObjectOfClass:v19 forKey:@"creationDate" withCoder:v4 expectNonNull:1 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v20];

  v22 = 0;
  if (v16 && v12 && v8 && v21)
  {
    v23 = [v4 error];

    if (v23) {
      v22 = 0;
    }
    else {
      v22 = [[SGMailIntelligenceSaliency alloc] initWithMessageId:v8 mailboxId:v12 score:v16 isSalient:v17 creationDate:v21];
    }
  }

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  messageId = self->_messageId;
  id v5 = a3;
  [v5 encodeObject:messageId forKey:@"messageId"];
  [v5 encodeObject:self->_mailboxId forKey:@"mailboxId"];
  [v5 encodeObject:self->_score forKey:@"score"];
  [v5 encodeBool:self->_isSalient forKey:@"isSalient"];
  [v5 encodeObject:self->_creationDate forKey:@"creationDate"];
}

- (SGMailIntelligenceSaliency)initWithMessageId:(id)a3 mailboxId:(id)a4 score:(id)a5 isSalient:(BOOL)a6 creationDate:(id)a7
{
  return [(SGMailIntelligenceSaliency *)self initWithMessageId:a3 mailboxId:a4 score:a5 isSalient:a6 gteSaliency:2 isCounted:0 creationDate:a7];
}

- (SGMailIntelligenceSaliency)initWithMessageId:(id)a3 mailboxId:(id)a4 score:(id)a5 isSalient:(BOOL)a6 gteSaliency:(int64_t)a7 isCounted:(BOOL)a8 creationDate:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a9;
  if (v16)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SGMailIntelligenceSaliency.m", 33, @"Invalid parameter not satisfying: %@", @"score != nil" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"SGMailIntelligenceSaliency.m", 34, @"Invalid parameter not satisfying: %@", @"messageId != nil" object file lineNumber description];

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)SGMailIntelligenceSaliency;
  v18 = [(SGMailIntelligenceSaliency *)&v26 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_messageId, a3);
    objc_storeStrong((id *)&v19->_mailboxId, a4);
    objc_storeStrong((id *)&v19->_score, a5);
    v19->_isSalient = a6;
    v19->_gteSaliency = a7;
    v19->_isCounted = a8;
    objc_storeStrong((id *)&v19->_creationDate, a9);
  }

  return v19;
}

+ (id)decayScore:(id)a3 creationTime:(id)a4
{
  id v5 = a3;
  [a4 timeIntervalSinceNow];
  double v7 = exp(v6 * -0.693147181 / -259200.0);
  v8 = NSNumber;
  [v5 doubleValue];
  double v10 = v9;

  return (id)[v8 numberWithDouble:v10 * v7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end