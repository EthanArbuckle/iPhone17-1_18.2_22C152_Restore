@interface _NSAttributeDescriptor
+ (id)descriptorForAttributeKey:(id)a3;
+ (void)initialize;
- (NSString)name;
- (_NSAttributeDescriptor)initWithName:(id)a3;
- (id)attributeValueFromValue:(id)a3;
- (void)dealloc;
@end

@implementation _NSAttributeDescriptor

+ (void)initialize
{
  if (_NSAttributeDescriptor == a1)
  {
    objc_opt_class();
    objc_opt_class();
    objc_opt_class();
  }
}

- (_NSAttributeDescriptor)initWithName:(id)a3
{
  v4 = [(_NSAttributeDescriptor *)self init];
  if (v4) {
    v4->_name = (NSString *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSAttributeDescriptor;
  [(_NSAttributeDescriptor *)&v3 dealloc];
}

- (id)attributeValueFromValue:(id)a3
{
  v5 = NSClassFromString((NSString *)@"_NSAttributeDescriptor");
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)name
{
  return self->_name;
}

+ (id)descriptorForAttributeKey:(id)a3
{
  __key[2] = *MEMORY[0x1E4F143B8];
  if ([a3 hasPrefix:@"NS"])
  {
    id v4 = a3;
  }
  else if ([a3 length])
  {
    id v4 = 0;
    if (-[NSCharacterSet characterIsMember:](+[NSCharacterSet lowercaseLetterCharacterSet](NSCharacterSet, "lowercaseLetterCharacterSet"), "characterIsMember:", [a3 characterAtIndex:0]))
    {
      id v4 = (id)[a3 mutableCopy];
      objc_msgSend(v4, "replaceCharactersInRange:withString:", 0, 1, objc_msgSend((id)objc_msgSend(a3, "substringWithRange:", 0, 1), "capitalizedString"));
      [v4 insertString:@"NS" atIndex:0];
      [v4 appendString:@"AttributeName"];
    }
  }
  else
  {
    id v4 = 0;
  }
  id result = (id)[v4 length];
  if (result)
  {
    __key[0] = v4;
    __key[1] = 0;
    id result = bsearch_b(__key, &attributeKeyToDescriptor, 0xCuLL, 0x10uLL, &__block_literal_global_27);
    if (result) {
      return (id)*((void *)result + 1);
    }
  }
  return result;
}

@end