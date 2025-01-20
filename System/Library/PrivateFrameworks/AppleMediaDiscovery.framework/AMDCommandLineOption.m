@interface AMDCommandLineOption
- (AMDCommandLineOption)initWithName:(id)a3 withDefaultValue:(id)a4 withHelpText:(id)a5 withShortName:(id)a6 andIsBoolFlag:(BOOL)a7;
- (BOOL)isBool;
- (NSString)helpText;
- (NSString)name;
- (NSString)shortName;
- (id)defaultValue;
- (void)setDefaultValue:(id)a3;
- (void)setHelpText:(id)a3;
- (void)setIsBool:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setShortName:(id)a3;
@end

@implementation AMDCommandLineOption

- (AMDCommandLineOption)initWithName:(id)a3 withDefaultValue:(id)a4 withHelpText:(id)a5 withShortName:(id)a6 andIsBoolFlag:(BOOL)a7
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v17 = 0;
  objc_storeStrong(&v17, a5);
  id v16 = 0;
  objc_storeStrong(&v16, a6);
  BOOL v15 = a7;
  v7 = v20;
  v20 = 0;
  v14.receiver = v7;
  v14.super_class = (Class)AMDCommandLineOption;
  v20 = [(AMDCommandLineOption *)&v14 init];
  objc_storeStrong((id *)&v20, v20);
  [(AMDCommandLineOption *)v20 setName:location[0]];
  [(AMDCommandLineOption *)v20 setDefaultValue:v18];
  [(AMDCommandLineOption *)v20 setHelpText:v17];
  [(AMDCommandLineOption *)v20 setIsBool:v15];
  [(AMDCommandLineOption *)v20 setShortName:v16];
  v13 = v20;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v20, 0);
  return v13;
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
}

- (NSString)helpText
{
  return self->_helpText;
}

- (void)setHelpText:(id)a3
{
}

- (BOOL)isBool
{
  return self->_isBool;
}

- (void)setIsBool:(BOOL)a3
{
  self->_isBool = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)shortName
{
  return self->_shortName;
}

- (void)setShortName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end