@interface CBSDeviceInformationField
+ (id)fieldWithFormat:(unint64_t)a3 value:(id)a4;
- (BOOL)multiLineFormatted;
- (CBSDeviceInformationField)initWithFormat:(unint64_t)a3 value:(id)a4;
- (NSArray)formattedValuesArray;
- (NSString)formattedTitle;
- (NSString)formattedValue;
- (NSString)value;
- (id)_formattedIMEI:(id)a3;
- (unint64_t)format;
- (void)setFormat:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation CBSDeviceInformationField

+ (id)fieldWithFormat:(unint64_t)a3 value:(id)a4
{
  id v5 = a4;
  v6 = [[CBSDeviceInformationField alloc] initWithFormat:a3 value:v5];

  return v6;
}

- (CBSDeviceInformationField)initWithFormat:(unint64_t)a3 value:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CBSDeviceInformationField;
  v8 = [(CBSDeviceInformationField *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_format = a3;
    objc_storeStrong((id *)&v8->_value, a4);
  }

  return v9;
}

- (NSString)formattedTitle
{
  unint64_t v2 = [(CBSDeviceInformationField *)self format];
  if (v2 == 2)
  {
    v4 = @"IMEI";
  }
  else if (v2 == 1)
  {
    v4 = @"MEID";
  }
  else if (v2)
  {
    v4 = @"ID";
  }
  else
  {
    v3 = +[FrameworkBundleHelper getBundle];
    v4 = [v3 localizedStringForKey:@"SERIAL_NUMBER" value:&stru_26F239D58 table:0];
  }
  return (NSString *)v4;
}

- (NSString)formattedValue
{
  unint64_t v3 = [(CBSDeviceInformationField *)self format];
  v4 = [(CBSDeviceInformationField *)self value];
  if (v3 == 2)
  {
    uint64_t v5 = [(CBSDeviceInformationField *)self _formattedIMEI:v4];

    v4 = (void *)v5;
  }
  return (NSString *)v4;
}

- (id)_formattedIMEI:(id)a3
{
  unint64_t v3 = (void *)[a3 mutableCopy];
  if ((unint64_t)[v3 length] >= 3) {
    [v3 insertString:@" " atIndex:2];
  }
  if ((unint64_t)[v3 length] >= 0xA) {
    [v3 insertString:@" " atIndex:9];
  }
  if ((unint64_t)[v3 length] >= 0x11) {
    [v3 insertString:@" " atIndex:16];
  }
  return v3;
}

- (BOOL)multiLineFormatted
{
  return [(CBSDeviceInformationField *)self format] == 2;
}

- (NSArray)formattedValuesArray
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(CBSDeviceInformationField *)self value];
  uint64_t v5 = [v4 componentsSeparatedByString:@";"];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [(CBSDeviceInformationField *)self _formattedIMEI:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v3 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (unint64_t)format
{
  return self->_format;
}

- (void)setFormat:(unint64_t)a3
{
  self->_format = a3;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end