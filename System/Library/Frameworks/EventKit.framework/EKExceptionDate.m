@interface EKExceptionDate
+ (Class)frozenClass;
+ (id)knownIdentityKeysForComparison;
- (EKExceptionDate)initWithDate:(id)a3;
- (NSDate)date;
- (id)description;
- (void)setDate:(id)a3;
@end

@implementation EKExceptionDate

- (EKExceptionDate)initWithDate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EKExceptionDate;
  v5 = [(EKObject *)&v8 init];
  v6 = v5;
  if (v5) {
    [(EKExceptionDate *)v5 setDate:v4];
  }

  return v6;
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_6 != -1) {
    dispatch_once(&knownIdentityKeysForComparison_onceToken_6, &__block_literal_global_51);
  }
  v2 = (void *)knownIdentityKeysForComparison_keys_6;

  return v2;
}

void __49__EKExceptionDate_knownIdentityKeysForComparison__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F57048];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)knownIdentityKeysForComparison_keys_6;
  knownIdentityKeysForComparison_keys_6 = v0;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(EKExceptionDate *)self date];
  v6 = [v3 stringWithFormat:@"%@ <%p> Date = %@", v4, self, v5];

  return v6;
}

- (NSDate)date
{
  return (NSDate *)[(EKObject *)self singleChangedValueForKey:*MEMORY[0x1E4F57048]];
}

- (void)setDate:(id)a3
{
}

@end