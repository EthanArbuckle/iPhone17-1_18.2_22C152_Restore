@interface BSPropertyMetadata
- (BOOL)isNumber;
- (id)description;
- (void)setClassType:(uint64_t)a1;
- (void)setDefaultValue:(uint64_t)a1;
@end

@implementation BSPropertyMetadata

- (BOOL)isNumber
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 24);
    return !v1 || v1 == objc_opt_class();
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self)
  {
    v6 = self->_name;
    v7 = self->_defaultKey;
    id defaultValue = self->_defaultValue;
  }
  else
  {
    v7 = 0;
    v6 = 0;
    id defaultValue = 0;
  }
  v9 = [v3 stringWithFormat:@"<%@:%p name=%@, defaultKey=%@, defaultValue=%@>", v5, self, v6, v7, defaultValue];

  return v9;
}

- (void)setClassType:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setDefaultValue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_defaultKey, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_setterName, 0);
  objc_storeStrong((id *)&self->_getterName, 0);
  objc_storeStrong((id *)&self->_classType, 0);
  objc_storeStrong((id *)&self->_typeString, 0);
}

@end