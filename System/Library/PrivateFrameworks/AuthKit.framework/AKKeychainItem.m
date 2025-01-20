@interface AKKeychainItem
- (AKKeychainItem)initWithAttributes:(id)a3;
- (AKKeychainItem)initWithDescriptor:(id)a3 value:(id)a4;
- (AKKeychainItemDescriptor)descriptor;
- (NSData)value;
- (id)itemAttributes;
- (void)setDescriptor:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation AKKeychainItem

- (AKKeychainItem)initWithDescriptor:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKKeychainItem;
  v9 = [(AKKeychainItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_descriptor, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

- (AKKeychainItem)initWithAttributes:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKKeychainItem;
  v5 = [(AKKeychainItem *)&v11 init];
  if (v5)
  {
    v6 = [[AKKeychainItemDescriptor alloc] initWithAttributes:v4];
    descriptor = v5->_descriptor;
    v5->_descriptor = v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:kSecValueData];
    value = v5->_value;
    v5->_value = (NSData *)v8;
  }
  return v5;
}

- (id)itemAttributes
{
  v3 = [(AKKeychainItem *)self descriptor];
  id v4 = [v3 attributes];
  id v5 = [v4 mutableCopy];

  [v5 setObject:self->_value forKeyedSubscript:kSecValueData];
  id v6 = [v5 copy];

  return v6;
}

- (NSData)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (AKKeychainItemDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end