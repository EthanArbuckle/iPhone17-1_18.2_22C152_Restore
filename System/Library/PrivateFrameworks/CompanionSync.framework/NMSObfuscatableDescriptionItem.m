@interface NMSObfuscatableDescriptionItem
- (BOOL)obfuscated;
- (NMSObfuscatableDescriptionItem)initWithPrefix:(id)a3 value:(id)a4 obfuscated:(BOOL)a5;
- (NSObject)value;
- (NSString)prefix;
- (void)setObfuscated:(BOOL)a3;
- (void)setPrefix:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation NMSObfuscatableDescriptionItem

- (NMSObfuscatableDescriptionItem)initWithPrefix:(id)a3 value:(id)a4 obfuscated:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NMSObfuscatableDescriptionItem;
  v11 = [(NMSObfuscatableDescriptionItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_prefix, a3);
    objc_storeStrong((id *)&v12->_value, a4);
    v12->_obfuscated = a5;
  }

  return v12;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
}

- (NSObject)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (BOOL)obfuscated
{
  return self->_obfuscated;
}

- (void)setObfuscated:(BOOL)a3
{
  self->_obfuscated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
}

@end