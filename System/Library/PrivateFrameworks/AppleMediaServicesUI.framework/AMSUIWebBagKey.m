@interface AMSUIWebBagKey
- (NSString)key;
- (unint64_t)valueType;
- (void)setKey:(id)a3;
- (void)setValueType:(unint64_t)a3;
@end

@implementation AMSUIWebBagKey

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (void)setValueType:(unint64_t)a3
{
  self->_valueType = a3;
}

- (void).cxx_destruct
{
}

@end