@interface ATXOnboardingStackResult
+ (BOOL)supportsSecureCoding;
- (ATXDefaultWidgetStack)stack1;
- (ATXDefaultWidgetStack)stack2;
- (ATXOnboardingStackResult)initWithCoder:(id)a3;
- (ATXOnboardingStackResult)initWithStack1:(id)a3 stack2:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXOnboardingStackResult

- (ATXOnboardingStackResult)initWithStack1:(id)a3 stack2:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXOnboardingStackResult;
  v9 = [(ATXOnboardingStackResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stack1, a3);
    objc_storeStrong((id *)&v10->_stack2, a4);
  }

  return v10;
}

- (ATXOnboardingStackResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stack1"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stack2"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    id v8 = 0;
  }
  else {
    id v8 = (ATXOnboardingStackResult *)[objc_alloc((Class)objc_opt_class()) initWithStack1:v5 stack2:v6];
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  stack1 = self->_stack1;
  id v5 = a3;
  [v5 encodeObject:stack1 forKey:@"stack1"];
  [v5 encodeObject:self->_stack2 forKey:@"stack2"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  stack1 = self->_stack1;
  stack2 = self->_stack2;

  return (id)[v4 initWithStack1:stack1 stack2:stack2];
}

- (ATXDefaultWidgetStack)stack1
{
  return self->_stack1;
}

- (ATXDefaultWidgetStack)stack2
{
  return self->_stack2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack2, 0);

  objc_storeStrong((id *)&self->_stack1, 0);
}

@end