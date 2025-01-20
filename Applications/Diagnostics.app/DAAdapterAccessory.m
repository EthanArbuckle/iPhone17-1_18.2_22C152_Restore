@interface DAAdapterAccessory
+ (id)accessoryWithIdentifier:(id)a3 attributes:(id)a4;
- (DAAdapterAccessory)initWithIdentifier:(id)a3 attributes:(id)a4;
- (NSDictionary)attributes;
- (NSString)identifier;
- (NSString)name;
- (id)modelNumber;
- (id)serialNumber;
- (void)setAttributes:(id)a3;
- (void)setName:(id)a3;
@end

@implementation DAAdapterAccessory

+ (id)accessoryWithIdentifier:(id)a3 attributes:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithIdentifier:v7 attributes:v6];

  return v8;
}

- (DAAdapterAccessory)initWithIdentifier:(id)a3 attributes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DAAdapterAccessory;
  v9 = [(DAAdapterAccessory *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_attributes, a4);
    if ([v7 isEqualToString:@"Accessory.SmartBatteryCase"])
    {
      v11 = [(DAAdapterAccessory *)v10 attributes];
      uint64_t v12 = [v11 objectForKeyedSubscript:@"name"];
      name = v10->_name;
      v10->_name = (NSString *)v12;

      v14 = v10->_name;
      if (!v14)
      {
        CFStringRef v15 = @"Smart Battery Case";
LABEL_9:
        v10->_name = &v15->isa;
      }
    }
    else
    {
      if ([v7 isEqualToString:@"Accessory.SmartKeyboard"])
      {
        v14 = v10->_name;
        CFStringRef v15 = @"Smart Keyboard";
        goto LABEL_9;
      }
      if ([v7 isEqualToString:@"Accessory.ApplePencil"])
      {
        v14 = v10->_name;
        CFStringRef v15 = @"Apple Pencil";
        goto LABEL_9;
      }
    }
  }

  return v10;
}

- (id)serialNumber
{
  v2 = [(DAAdapterAccessory *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"serialNumber"];

  return v3;
}

- (id)modelNumber
{
  v2 = [(DAAdapterAccessory *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"modelNumber"];

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_attributes, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end