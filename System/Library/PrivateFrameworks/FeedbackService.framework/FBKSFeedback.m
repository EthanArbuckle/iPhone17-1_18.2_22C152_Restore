@interface FBKSFeedback
- (FBKSFeedback)initWithSwiftObject:(id)a3;
- (FBKSFeedback_FrameworkPrivateName)swiftObject;
- (NSDate)submissionDate;
- (NSString)build;
- (NSString)formIdentifier;
- (id)description;
- (int64_t)ID;
- (void)setID:(int64_t)a3;
- (void)setSwiftObject:(id)a3;
@end

@implementation FBKSFeedback

- (FBKSFeedback)initWithSwiftObject:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)FBKSFeedback;
    v6 = [(FBKSFeedback *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_swiftObject, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)formIdentifier
{
  v2 = [(FBKSFeedback *)self swiftObject];
  v3 = [v2 formIdentifier];

  return (NSString *)v3;
}

- (NSDate)submissionDate
{
  v2 = [(FBKSFeedback *)self swiftObject];
  v3 = [v2 submissionDate];

  return (NSDate *)v3;
}

- (NSString)build
{
  v2 = [(FBKSFeedback *)self swiftObject];
  v3 = [v2 build];

  return (NSString *)v3;
}

- (int64_t)ID
{
  v2 = [(FBKSFeedback *)self swiftObject];
  int64_t v3 = [v2 id];

  return v3;
}

- (id)description
{
  v2 = [(FBKSFeedback *)self swiftObject];
  int64_t v3 = [v2 description];

  return v3;
}

- (void)setID:(int64_t)a3
{
  self->_ID = a3;
}

- (FBKSFeedback_FrameworkPrivateName)swiftObject
{
  return self->_swiftObject;
}

- (void)setSwiftObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end