@interface NSStoreMapping
- (BOOL)isEqual:(id)a3;
- (NSStoreMapping)initWithExternalName:(id)a3;
- (id)externalName;
- (unint64_t)hash;
- (void)copyValuesForReadOnlyFetch:(id)a3;
- (void)dealloc;
@end

@implementation NSStoreMapping

- (unint64_t)hash
{
  id v2 = [(NSStoreMapping *)self externalName];

  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    return 0;
  }
  id v7 = [(NSStoreMapping *)self externalName];
  if (v7 == (id)[a3 externalName]) {
    return 1;
  }
  id v8 = [(NSStoreMapping *)self externalName];
  uint64_t v9 = [a3 externalName];

  return [v8 isEqualToString:v9];
}

- (void)dealloc
{
  if (self)
  {
    externalName = self->_externalName;
    if (externalName)
    {

      self->_externalName = (NSString *)[0 copy];
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NSStoreMapping;
  [(NSStoreMapping *)&v4 dealloc];
}

- (NSStoreMapping)initWithExternalName:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NSStoreMapping;
  objc_super v4 = [(NSStoreMapping *)&v8 init];
  uint64_t v5 = v4;
  if (v4)
  {
    externalName = v4->_externalName;
    if (externalName != a3)
    {

      v5->_externalName = (NSString *)[a3 copy];
    }
  }
  return v5;
}

- (id)externalName
{
  return self->_externalName;
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  self->_externalName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "externalName"), "copy");
}

@end