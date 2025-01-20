@interface CDPLocalizedStringBuilder
+ (id)builderForKey:(id)a3;
+ (id)builderForKey:(id)a3 inTable:(id)a4;
- (id)addDeviceClass:(id)a3;
- (id)addSecretType:(unint64_t)a3;
- (id)addUnqualifiedDeviceClass:(id)a3;
- (id)currentKey;
- (id)localizedString;
@end

@implementation CDPLocalizedStringBuilder

+ (id)builderForKey:(id)a3
{
  v3 = (NSString *)a3;
  v4 = objc_alloc_init(CDPLocalizedStringBuilder);
  key = v4->_key;
  v4->_key = v3;

  return v4;
}

+ (id)builderForKey:(id)a3 inTable:(id)a4
{
  id v6 = a4;
  v7 = [a1 builderForKey:a3];
  v8 = (void *)v7[2];
  v7[2] = v6;

  return v7;
}

- (id)addDeviceClass:(id)a3
{
  key = self->_key;
  v5 = _CDPSuffixForDeviceClass(a3);
  id v6 = [(NSString *)key stringByAppendingString:v5];
  v7 = self->_key;
  self->_key = v6;

  return self;
}

- (id)addUnqualifiedDeviceClass:(id)a3
{
  key = self->_key;
  v5 = _CDPSuffixForUnqualifiedDeviceClass(a3);
  id v6 = [(NSString *)key stringByAppendingString:v5];
  v7 = self->_key;
  self->_key = v6;

  return self;
}

- (id)addSecretType:(unint64_t)a3
{
  key = self->_key;
  if (a3 == 2) {
    v5 = @"_PASSWORD";
  }
  else {
    v5 = @"_PASSCODE";
  }
  id v6 = [(NSString *)key stringByAppendingString:v5];
  v7 = self->_key;
  self->_key = v6;

  return self;
}

- (id)localizedString
{
  return CDPLocalizedStringInTable(self->_key, self->_table);
}

- (id)currentKey
{
  v2 = (void *)[(NSString *)self->_key copy];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end