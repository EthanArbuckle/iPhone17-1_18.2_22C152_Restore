@interface _CHSWidgetHostForConnection
- (CHSWidgetConfiguration)configuration;
- (NSString)identifier;
- (_CHSWidgetHostForConnection)initWithIdentifier:(id)a3 configuration:(id)a4 activationState:(unint64_t)a5;
- (unint64_t)activationState;
@end

@implementation _CHSWidgetHostForConnection

- (_CHSWidgetHostForConnection)initWithIdentifier:(id)a3 configuration:(id)a4 activationState:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_CHSWidgetHostForConnection;
  v10 = [(_CHSWidgetHostForConnection *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    configuration = v10->_configuration;
    v10->_configuration = (CHSWidgetConfiguration *)v13;

    v10->_activationState = a5;
  }

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CHSWidgetConfiguration)configuration
{
  return self->_configuration;
}

- (unint64_t)activationState
{
  return self->_activationState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end