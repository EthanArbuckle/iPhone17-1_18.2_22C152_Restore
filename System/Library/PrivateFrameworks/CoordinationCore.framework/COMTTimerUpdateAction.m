@interface COMTTimerUpdateAction
+ (BOOL)supportsSecureCoding;
- (COMTTimerUpdateAction)initWithCoder:(id)a3;
- (COMTTimerUpdateAction)initWithTimer:(id)a3;
- (MTTimer)timer;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COMTTimerUpdateAction

- (COMTTimerUpdateAction)initWithTimer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMTTimerUpdateAction;
  v5 = [(COMTAction *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    timer = v5->_timer;
    v5->_timer = (MTTimer *)v6;
  }
  return v5;
}

- (COMTTimerUpdateAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)COMTTimerUpdateAction;
  v5 = [(COMTAction *)&v11 initWithCoder:v4];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UT"];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [(COMTTimerUpdateAction *)v6 copy];
    timer = v5->_timer;
    v5->_timer = (MTTimer *)v8;

LABEL_4:
    v7 = v5;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)COMTTimerUpdateAction;
  id v4 = a3;
  [(COMTAction *)&v6 encodeWithCoder:v4];
  v5 = [(COMTTimerUpdateAction *)self timer];
  [v4 encodeObject:v5 forKey:@"UT"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTTimer)timer
{
  return self->_timer;
}

- (void).cxx_destruct
{
}

@end