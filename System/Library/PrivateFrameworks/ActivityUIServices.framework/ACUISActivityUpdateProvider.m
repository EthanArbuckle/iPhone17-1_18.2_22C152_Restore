@interface ACUISActivityUpdateProvider
- (ACActivityDescriptor)descriptor;
- (ACUISActivityUpdateProvider)initWithActivityUpdateProviding:(id)a3;
- (NSString)activityIdentifier;
- (int64_t)_activityState:(int64_t)a3;
- (int64_t)state;
- (void)setState:(int64_t)a3;
@end

@implementation ACUISActivityUpdateProvider

- (ACUISActivityUpdateProvider)initWithActivityUpdateProviding:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ACUISActivityUpdateProvider;
  v6 = [(ACUISActivityUpdateProvider *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_updateProviding, a3);
    uint64_t v8 = [v5 identifier];
    activityIdentifier = v7->_activityIdentifier;
    v7->_activityIdentifier = (NSString *)v8;

    uint64_t v10 = [v5 descriptor];
    descriptor = v7->_descriptor;
    v7->_descriptor = (ACActivityDescriptor *)v10;

    v7->_state = -[ACUISActivityUpdateProvider _activityState:](v7, "_activityState:", [v5 activityState]);
  }

  return v7;
}

- (int64_t)_activityState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (ACActivityDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_updateProviding, 0);
}

@end