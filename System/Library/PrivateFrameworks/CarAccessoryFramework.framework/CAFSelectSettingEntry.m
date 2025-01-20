@interface CAFSelectSettingEntry
- (BOOL)disabled;
- (CAFSelectSettingEntry)initWithDictionary:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)symbolName;
- (NSString)userVisibleLabel;
- (id)description;
@end

@implementation CAFSelectSettingEntry

- (CAFSelectSettingEntry)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CAFSelectSettingEntry;
  v5 = [(CAFSelectSettingEntry *)&v15 init];
  if (v5)
  {
    objc_opt_class();
    id v6 = [v4 objectForKey:@"disabled"];
    if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    v5->_disabled = [v7 BOOLValue];
    objc_opt_class();
    id v8 = [v4 objectForKey:@"symbolName"];
    if (v8 && (objc_opt_isKindOfClass() & 1) != 0) {
      v9 = (NSString *)v8;
    }
    else {
      v9 = 0;
    }

    symbolName = v5->_symbolName;
    v5->_symbolName = v9;

    objc_opt_class();
    id v11 = [v4 objectForKey:@"userVisibleLabel"];
    if (v11 && (objc_opt_isKindOfClass() & 1) != 0) {
      v12 = (NSString *)v11;
    }
    else {
      v12 = 0;
    }

    userVisibleLabel = v5->_userVisibleLabel;
    v5->_userVisibleLabel = v12;
  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = @"disabled";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[CAFSelectSettingEntry disabled](self, "disabled"));
  v11[0] = v3;
  v10[1] = @"symbolName";
  id v4 = [(CAFSelectSettingEntry *)self symbolName];
  v5 = v4;
  if (!v4)
  {
    v5 = [MEMORY[0x263EFF9D0] null];
  }
  v11[1] = v5;
  v10[2] = @"userVisibleLabel";
  id v6 = [(CAFSelectSettingEntry *)self userVisibleLabel];
  id v7 = v6;
  if (!v6)
  {
    id v7 = [MEMORY[0x263EFF9D0] null];
  }
  v11[2] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  if (!v6) {

  }
  if (!v4) {
  return (NSDictionary *)v8;
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(CAFSelectSettingEntry *)self disabled];
  id v6 = [(CAFSelectSettingEntry *)self symbolName];
  id v7 = [(CAFSelectSettingEntry *)self userVisibleLabel];
  id v8 = [v3 stringWithFormat:@"<%@: %p { %@: %d, %@: %@, %@: %@ }>", v4, self, @"disabled", v5, @"symbolName", v6, @"userVisibleLabel", v7];

  return v8;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)userVisibleLabel
{
  return self->_userVisibleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userVisibleLabel, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end