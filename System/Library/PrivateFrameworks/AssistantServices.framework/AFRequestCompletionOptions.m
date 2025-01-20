@interface AFRequestCompletionOptions
+ (BOOL)supportsSecureCoding;
- (AFRequestCompletionOptions)initWithCoder:(id)a3;
- (AFTriggerlessListeningOptions)triggerlessListeningOptions;
- (id)_initWithShowUIDuringListening:(BOOL)a3 playAlertBeforeListening:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setTriggerlessListeningOptions:(id)a3;
@end

@implementation AFRequestCompletionOptions

- (void).cxx_destruct
{
}

- (void)setTriggerlessListeningOptions:(id)a3
{
}

- (AFTriggerlessListeningOptions)triggerlessListeningOptions
{
  return self->_triggerlessListeningOptions;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)AFRequestCompletionOptions;
  v3 = [(AFRequestCompletionOptions *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@"triggerlessListeningOptions: %@", self->_triggerlessListeningOptions];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setTriggerlessListeningOptions:self->_triggerlessListeningOptions];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (AFRequestCompletionOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AFRequestCompletionOptions *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_triggerlessListeningOptions"];
    triggerlessListeningOptions = v5->_triggerlessListeningOptions;
    v5->_triggerlessListeningOptions = (AFTriggerlessListeningOptions *)v6;
  }
  return v5;
}

- (id)_initWithShowUIDuringListening:(BOOL)a3 playAlertBeforeListening:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v6 = [(AFRequestCompletionOptions *)self init];
  if (v6)
  {
    v7 = [[AFTriggerlessListeningOptions alloc] _initWithShowUIDuringListening:v5 playAlertBeforeListening:v4];
    triggerlessListeningOptions = v6->_triggerlessListeningOptions;
    v6->_triggerlessListeningOptions = v7;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end