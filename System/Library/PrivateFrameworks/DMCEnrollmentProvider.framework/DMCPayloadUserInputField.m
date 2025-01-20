@interface DMCPayloadUserInputField
- (BOOL)isDevicePasscodeField;
- (BOOL)isPassword;
- (BOOL)isRequired;
- (BOOL)needsRetype;
- (DMCPayloadUserInputField)initWithFieldDictionary:(id)a3;
- (NSNumber)minimumLength;
- (NSString)defaultValue;
- (NSString)fieldDescription;
- (NSString)finePrint;
- (NSString)mismatchDescription;
- (NSString)placeholderValue;
- (NSString)retypeDescription;
- (NSString)title;
- (id)_uuid;
- (id)description;
- (id)responseDictionary;
- (int)flags;
- (int)type;
- (int64_t)capitalizationType;
- (int64_t)keyboardType;
- (void)setFieldDescription:(id)a3;
- (void)setFinePrint:(id)a3;
- (void)setUserResponse:(id)a3;
@end

@implementation DMCPayloadUserInputField

- (DMCPayloadUserInputField)initWithFieldDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMCPayloadUserInputField;
  v5 = [(DMCPayloadUserInputField *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    fieldDictionary = v5->_fieldDictionary;
    v5->_fieldDictionary = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (void)setUserResponse:(id)a3
{
  self->_response = (id)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)DMCPayloadUserInputField;
  v3 = [(DMCPayloadUserInputField *)&v7 description];
  id v4 = [(NSMutableDictionary *)self->_fieldDictionary description];
  v5 = [v3 stringByAppendingString:v4];

  return v5;
}

- (int)type
{
  v2 = [(NSMutableDictionary *)self->_fieldDictionary objectForKey:*MEMORY[0x263F53D00]];
  int v3 = [v2 intValue];

  return v3;
}

- (int)flags
{
  v2 = [(NSMutableDictionary *)self->_fieldDictionary objectForKey:*MEMORY[0x263F53D10]];
  int v3 = [v2 intValue];

  return v3;
}

- (NSNumber)minimumLength
{
  return (NSNumber *)[(NSMutableDictionary *)self->_fieldDictionary objectForKey:*MEMORY[0x263F53D18]];
}

- (NSString)title
{
  return (NSString *)[(NSMutableDictionary *)self->_fieldDictionary objectForKey:*MEMORY[0x263F53D40]];
}

- (NSString)fieldDescription
{
  return (NSString *)[(NSMutableDictionary *)self->_fieldDictionary objectForKey:*MEMORY[0x263F53CF8]];
}

- (void)setFieldDescription:(id)a3
{
}

- (NSString)retypeDescription
{
  return (NSString *)[(NSMutableDictionary *)self->_fieldDictionary objectForKey:*MEMORY[0x263F53D38]];
}

- (NSString)mismatchDescription
{
  return (NSString *)[(NSMutableDictionary *)self->_fieldDictionary objectForKey:*MEMORY[0x263F53D20]];
}

- (NSString)finePrint
{
  return (NSString *)[(NSMutableDictionary *)self->_fieldDictionary objectForKey:*MEMORY[0x263F53D08]];
}

- (void)setFinePrint:(id)a3
{
}

- (NSString)defaultValue
{
  return (NSString *)[(NSMutableDictionary *)self->_fieldDictionary objectForKey:*MEMORY[0x263F53CF0]];
}

- (NSString)placeholderValue
{
  return (NSString *)[(NSMutableDictionary *)self->_fieldDictionary objectForKey:*MEMORY[0x263F53D28]];
}

- (id)_uuid
{
  return (id)[(NSMutableDictionary *)self->_fieldDictionary objectForKey:*MEMORY[0x263F53D48]];
}

- (id)responseDictionary
{
  int v3 = NSDictionary;
  id v4 = [(DMCPayloadUserInputField *)self _uuid];
  v5 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, *MEMORY[0x263F53D48], self->_response, *MEMORY[0x263F53D30], 0);

  return v5;
}

- (int64_t)keyboardType
{
  int v2 = [(DMCPayloadUserInputField *)self type] - 1;
  if (v2 > 6) {
    return 0;
  }
  else {
    return qword_221D0E970[v2];
  }
}

- (int64_t)capitalizationType
{
  return [(DMCPayloadUserInputField *)self type] == 6;
}

- (BOOL)isRequired
{
  return ([(DMCPayloadUserInputField *)self flags] & 5) == 0;
}

- (BOOL)isPassword
{
  unsigned int v2 = [(DMCPayloadUserInputField *)self type];
  return (v2 < 8) & (0xB8u >> v2);
}

- (BOOL)needsRetype
{
  return ([(DMCPayloadUserInputField *)self flags] >> 1) & 1;
}

- (BOOL)isDevicePasscodeField
{
  return ([(DMCPayloadUserInputField *)self flags] >> 3) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_response, 0);
  objc_storeStrong((id *)&self->_fieldDictionary, 0);
}

@end