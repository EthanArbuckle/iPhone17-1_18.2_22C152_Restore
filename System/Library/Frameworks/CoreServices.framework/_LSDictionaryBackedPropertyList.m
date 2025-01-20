@interface _LSDictionaryBackedPropertyList
+ (BOOL)supportsSecureCoding;
- (BOOL)_getPropertyList:(id *)a3;
- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4;
- (_LSDictionaryBackedPropertyList)initWithCoder:(id)a3;
- (_LSDictionaryBackedPropertyList)initWithPropertyList:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LSDictionaryBackedPropertyList

- (void).cxx_destruct
{
}

- (_LSDictionaryBackedPropertyList)initWithPropertyList:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_LSDictionaryBackedPropertyList;
  v5 = [(_LSLazyPropertyList *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    plist = v5->_plist;
    v5->_plist = (NSDictionary *)v6;
  }
  return v5;
}

- (BOOL)_getPropertyList:(id *)a3
{
  id v4 = self->_plist;
  *a3 = v4;
  return v4 != 0;
}

- (BOOL)_getValue:(id *)a3 forPropertyListKey:(id)a4
{
  id v5 = [(NSDictionary *)self->_plist objectForKeyedSubscript:a4];
  *a3 = v5;
  return v5 != 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (_LSDictionaryBackedPropertyList)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = XNSGetPropertyListClasses();
  v7 = objc_msgSend(v4, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", v5, v6, @"plist");

  v8 = [(_LSDictionaryBackedPropertyList *)self initWithPropertyList:v7];
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end