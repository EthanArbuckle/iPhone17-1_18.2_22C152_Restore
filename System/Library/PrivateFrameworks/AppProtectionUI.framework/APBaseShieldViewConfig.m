@interface APBaseShieldViewConfig
- (APApplication)application;
- (APBaseShieldViewConfig)initWithApplication:(id)a3;
- (APBaseShieldViewDelegate)delegate;
- (APSystemAppOutlet)outlet;
- (NSString)localizedName;
- (void)setApplication:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setOutlet:(id)a3;
@end

@implementation APBaseShieldViewConfig

- (APBaseShieldViewConfig)initWithApplication:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)APBaseShieldViewConfig;
  v5 = [(APBaseShieldViewConfig *)&v8 init];
  v6 = v5;
  if (v5) {
    [(APBaseShieldViewConfig *)v5 setApplication:v4];
  }

  return v6;
}

- (APApplication)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (APSystemAppOutlet)outlet
{
  return self->_outlet;
}

- (void)setOutlet:(id)a3
{
}

- (APBaseShieldViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (APBaseShieldViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outlet, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);

  objc_storeStrong((id *)&self->_application, 0);
}

@end