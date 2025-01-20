@interface TKSmartCardUserInteraction
+ (BOOL)supportsSecureCoding;
- (BOOL)cancel;
- (NSTimeInterval)initialTimeout;
- (NSTimeInterval)interactionTimeout;
- (TKSmartCardUserInteraction)init;
- (TKSmartCardUserInteraction)initWithCoder:(id)a3;
- (id)delegate;
- (void)encodeWithCoder:(id)a3;
- (void)runWithReply:(void *)reply;
- (void)setDelegate:(id)delegate;
- (void)setInitialTimeout:(NSTimeInterval)initialTimeout;
- (void)setInteractionTimeout:(NSTimeInterval)interactionTimeout;
@end

@implementation TKSmartCardUserInteraction

- (TKSmartCardUserInteraction)init
{
  v3.receiver = self;
  v3.super_class = (Class)TKSmartCardUserInteraction;
  result = [(TKSmartCardUserInteraction *)&v3 init];
  if (result)
  {
    result->_initialTimeout = 0.0;
    result->_interactionTimeout = 0.0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKSmartCardUserInteraction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKSmartCardUserInteraction;
  v5 = [(TKSmartCardUserInteraction *)&v9 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"initialTimeout"];
    v5->_initialTimeout = (double)[v6 integerValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interactionTimeout"];
    v5->_interactionTimeout = (double)[v7 integerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  double initialTimeout = self->_initialTimeout;
  id v6 = a3;
  v7 = [v4 numberWithDouble:initialTimeout];
  [v6 encodeObject:v7 forKey:@"initialTimeout"];

  id v8 = [NSNumber numberWithDouble:self->_interactionTimeout];
  [v6 encodeObject:v8 forKey:@"interactionTimeout"];
}

- (void)runWithReply:(void *)reply
{
}

- (BOOL)cancel
{
  return 0;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (NSTimeInterval)initialTimeout
{
  return self->_initialTimeout;
}

- (void)setInitialTimeout:(NSTimeInterval)initialTimeout
{
  self->_double initialTimeout = initialTimeout;
}

- (NSTimeInterval)interactionTimeout
{
  return self->_interactionTimeout;
}

- (void)setInteractionTimeout:(NSTimeInterval)interactionTimeout
{
  self->_interactionTimeout = interactionTimeout;
}

- (void).cxx_destruct
{
}

@end