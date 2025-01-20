@interface AAFKeychainItem
- (AAFKeychainItem)initWithAttributes:(id)a3;
- (AAFKeychainItem)initWithDescriptor:(id)a3 value:(id)a4;
- (AAFKeychainItemDescriptor)descriptor;
- (NSData)value;
- (id)itemAttributes;
- (void)setDescriptor:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation AAFKeychainItem

- (AAFKeychainItem)initWithDescriptor:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AAFKeychainItem;
  v9 = [(AAFKeychainItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_descriptor, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

- (AAFKeychainItem)initWithAttributes:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AAFKeychainItem;
  v5 = [(AAFKeychainItem *)&v11 init];
  if (v5)
  {
    v6 = [[AAFKeychainItemDescriptor alloc] initWithAttributes:v4];
    descriptor = v5->_descriptor;
    v5->_descriptor = v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F3BD38]];
    value = v5->_value;
    v5->_value = (NSData *)v8;
  }
  return v5;
}

- (id)itemAttributes
{
  v3 = [(AAFKeychainItem *)self descriptor];
  id v4 = [v3 attributes];
  v5 = (void *)[v4 mutableCopy];

  [v5 setObject:self->_value forKeyedSubscript:*MEMORY[0x1E4F3BD38]];
  v6 = (void *)[v5 copy];

  return v6;
}

- (NSData)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (AAFKeychainItemDescriptor)descriptor
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