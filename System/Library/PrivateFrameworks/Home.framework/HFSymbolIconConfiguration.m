@interface HFSymbolIconConfiguration
- (HFSymbolIconConfiguration)initWithSystemImageName:(id)a3;
- (HFSymbolIconConfiguration)initWithSystemImageName:(id)a3 configuration:(id)a4;
- (NSString)systemImageName;
- (UIImageSymbolConfiguration)configuration;
@end

@implementation HFSymbolIconConfiguration

- (HFSymbolIconConfiguration)initWithSystemImageName:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFSymbolIconConfiguration;
  v9 = [(HFSymbolIconConfiguration *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_systemImageName, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
  }

  return v10;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (UIImageSymbolConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
}

- (HFSymbolIconConfiguration)initWithSystemImageName:(id)a3
{
  v4 = (void *)MEMORY[0x263F1C6C8];
  id v5 = a3;
  v6 = [v4 configurationPreferringMulticolor];
  id v7 = [(HFSymbolIconConfiguration *)self initWithSystemImageName:v5 configuration:v6];

  return v7;
}

@end