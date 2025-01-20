@interface HKInfographicButtonItem
- (HKInfographicButtonItem)initWithConfiguration:(id)a3 buttonTapHandler:(id)a4;
- (NSString)baseIdentifier;
- (UIButtonConfiguration)configuration;
- (id)buttonTapHandler;
- (void)setBaseIdentifier:(id)a3;
- (void)setButtonTapHandler:(id)a3;
- (void)setConfiguration:(id)a3;
@end

@implementation HKInfographicButtonItem

- (HKInfographicButtonItem)initWithConfiguration:(id)a3 buttonTapHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKInfographicButtonItem;
  v8 = [(HKInfographicButtonItem *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    configuration = v8->_configuration;
    v8->_configuration = (UIButtonConfiguration *)v9;

    uint64_t v11 = [v7 copy];
    id buttonTapHandler = v8->_buttonTapHandler;
    v8->_id buttonTapHandler = (id)v11;
  }
  return v8;
}

- (UIButtonConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (id)buttonTapHandler
{
  return self->_buttonTapHandler;
}

- (void)setButtonTapHandler:(id)a3
{
}

- (NSString)baseIdentifier
{
  return self->_baseIdentifier;
}

- (void)setBaseIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseIdentifier, 0);
  objc_storeStrong(&self->_buttonTapHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end