@interface DVTDeviceGlobalStatusIndicatorConfiguration
- (DVTDeviceGlobalStatusIndicatorConfiguration)initWithTitle:(id)a3 informationText:(id)a4;
- (NSString)informationText;
- (NSString)title;
@end

@implementation DVTDeviceGlobalStatusIndicatorConfiguration

- (DVTDeviceGlobalStatusIndicatorConfiguration)initWithTitle:(id)a3 informationText:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DVTDeviceGlobalStatusIndicatorConfiguration;
  v9 = [(DVTDeviceGlobalStatusIndicatorConfiguration *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_informationText, a4);
  }

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)informationText
{
  return self->_informationText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_informationText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end