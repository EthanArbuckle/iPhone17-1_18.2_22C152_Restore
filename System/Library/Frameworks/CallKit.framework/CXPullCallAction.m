@interface CXPullCallAction
+ (BOOL)supportsSecureCoding;
+ (double)timeout;
- (CXHandoffContext)handoffContext;
- (CXPullCallAction)initWithCoder:(id)a3;
- (NSDate)dateConnected;
- (id)customDescription;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)fulfill;
- (void)fulfillWithDateConnected:(id)a3;
- (void)setDateConnected:(id)a3;
- (void)setHandoffContext:(id)a3;
- (void)updateAsFulfilledWithDateConnected:(id)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXPullCallAction

- (id)customDescription
{
  v7.receiver = self;
  v7.super_class = (Class)CXPullCallAction;
  v3 = [(CXCallAction *)&v7 customDescription];
  v4 = [(CXPullCallAction *)self handoffContext];
  [v3 appendFormat:@" handoffContext=%@", v4];

  v5 = [(CXPullCallAction *)self dateConnected];
  [v3 appendFormat:@" dateConnected=%@", v5];

  return v3;
}

+ (double)timeout
{
  return 20.0;
}

- (void)fulfill
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(CXPullCallAction *)self fulfillWithDateConnected:v3];
}

- (void)fulfillWithDateConnected:(id)a3
{
  id v6 = a3;
  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXPullCallAction fulfillWithDateConnected:]", @"dateConnected" format];
  }
  v4 = (void *)[(CXPullCallAction *)self copy];
  [v4 updateAsFulfilledWithDateConnected:v6];
  v5 = [v4 delegate];
  [v5 actionCompleted:v4];
}

- (void)updateAsFulfilledWithDateConnected:(id)a3
{
  id v4 = a3;
  [(CXAction *)self updateAsFulfilled];
  [(CXPullCallAction *)self setDateConnected:v4];
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CXPullCallAction;
  id v6 = a3;
  [(CXAction *)&v9 updateCopy:v6 withZone:a4];
  objc_super v7 = [(CXPullCallAction *)self dateConnected];
  [v6 setDateConnected:v7];

  v8 = [(CXPullCallAction *)self handoffContext];
  [v6 setHandoffContext:v8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXPullCallAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CXPullCallAction;
  v5 = [(CXCallAction *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_super v7 = NSStringFromSelector(sel_handoffContext);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    handoffContext = v5->_handoffContext;
    v5->_handoffContext = (CXHandoffContext *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_dateConnected);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    dateConnected = v5->_dateConnected;
    v5->_dateConnected = (NSDate *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CXPullCallAction;
  id v4 = a3;
  [(CXCallAction *)&v9 encodeWithCoder:v4];
  v5 = [(CXPullCallAction *)self handoffContext];
  uint64_t v6 = NSStringFromSelector(sel_handoffContext);
  [v4 encodeObject:v5 forKey:v6];

  objc_super v7 = [(CXPullCallAction *)self dateConnected];
  uint64_t v8 = NSStringFromSelector(sel_dateConnected);
  [v4 encodeObject:v7 forKey:v8];
}

- (CXHandoffContext)handoffContext
{
  return self->_handoffContext;
}

- (void)setHandoffContext:(id)a3
{
}

- (NSDate)dateConnected
{
  return self->_dateConnected;
}

- (void)setDateConnected:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateConnected, 0);

  objc_storeStrong((id *)&self->_handoffContext, 0);
}

@end