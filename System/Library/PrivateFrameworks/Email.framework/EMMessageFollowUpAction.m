@interface EMMessageFollowUpAction
+ (BOOL)supportsSecureCoding;
- (EMFollowUp)followUp;
- (EMMessageFollowUpAction)initWithCoder:(id)a3;
- (EMMessageFollowUpAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 followUp:(id)a6;
- (int64_t)signpostType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMMessageFollowUpAction

- (EMMessageFollowUpAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 followUp:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)EMMessageFollowUpAction;
  v12 = [(EMMessageChangeAction *)&v15 initWithMessageListItems:a3 origin:a4 actor:a5];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_followUp, a6);
  }

  return v13;
}

- (int64_t)signpostType
{
  return 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageFollowUpAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMMessageFollowUpAction;
  v5 = [(EMMessageChangeAction *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_followUp"];
    followUp = v5->_followUp;
    v5->_followUp = (EMFollowUp *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EMMessageFollowUpAction;
  [(EMMessageChangeAction *)&v6 encodeWithCoder:v4];
  v5 = [(EMMessageFollowUpAction *)self followUp];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_followUp"];
}

- (EMFollowUp)followUp
{
  return self->_followUp;
}

- (void).cxx_destruct
{
}

@end