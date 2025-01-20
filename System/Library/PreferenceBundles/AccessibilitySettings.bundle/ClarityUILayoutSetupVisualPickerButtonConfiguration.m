@interface ClarityUILayoutSetupVisualPickerButtonConfiguration
- (ClarityUILayoutSetupVisualPickerButtonConfiguration)initWithTitle:(id)a3 preferenceValue:(id)a4;
- (NSDictionary)_dictionaryRepresentation;
- (NSString)preferenceValue;
- (NSString)title;
- (void)setPreferenceValue:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ClarityUILayoutSetupVisualPickerButtonConfiguration

- (ClarityUILayoutSetupVisualPickerButtonConfiguration)initWithTitle:(id)a3 preferenceValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ClarityUILayoutSetupVisualPickerButtonConfiguration;
  v8 = [(ClarityUILayoutSetupVisualPickerButtonConfiguration *)&v15 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    title = v8->_title;
    v8->_title = v9;

    v11 = (NSString *)[v7 copy];
    preferenceValue = v8->_preferenceValue;
    v8->_preferenceValue = v11;

    v13 = v8;
  }

  return v8;
}

- (NSDictionary)_dictionaryRepresentation
{
  title = self->_title;
  if (title && (preferenceValue = self->_preferenceValue) != 0)
  {
    v6[0] = @"ClarityUILayoutSetupVisualPickerButtonTitle";
    v6[1] = @"ClarityUILayoutSetupVisualPickerButtonPreferenceValue";
    v7[0] = title;
    v7[1] = preferenceValue;
    v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  }
  else
  {
    v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (NSString)preferenceValue
{
  return self->_preferenceValue;
}

- (void)setPreferenceValue:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_preferenceValue, 0);
}

@end