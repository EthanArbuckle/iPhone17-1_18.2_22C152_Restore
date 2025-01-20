@interface CPAccNavParamKey
+ (id)paramKey:(unsigned __int16)a3;
- (BOOL)hasCharacteristics;
- (BOOL)hasVariants;
- (BOOL)isBoolValue;
- (BOOL)isIntegerValue;
- (BOOL)isTimeIntervalValue;
- (CPAccNavParam)param;
- (CPAccNavParamKey)init;
- (NSDimension)dimension;
- (NSSet)characteristics;
- (id)copySettingAccNavType:(int64_t)a3;
- (id)copySettingDimension:(id)a3;
- (id)copySettingEnumType:(unsigned __int8)a3;
- (id)copySettingHasVariants:(BOOL)a3;
- (id)copySettingIsBoolValue:(BOOL)a3;
- (id)copySettingIsIntegerValue:(BOOL)a3;
- (id)copySettingIsTimeIntervalValue:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)unsetValue;
- (int64_t)accNavType;
- (unsigned)enumType;
- (unsigned)key;
- (void)setAccNavType:(int64_t)a3;
- (void)setCharacteristics:(id)a3;
- (void)setDimension:(id)a3;
- (void)setEnumType:(unsigned __int8)a3;
- (void)setHasVariants:(BOOL)a3;
- (void)setIsBoolValue:(BOOL)a3;
- (void)setIsIntegerValue:(BOOL)a3;
- (void)setIsTimeIntervalValue:(BOOL)a3;
- (void)setKey:(unsigned __int16)a3;
- (void)setParam:(id)a3;
@end

@implementation CPAccNavParamKey

+ (id)paramKey:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v4 = objc_opt_new();
  [v4 setKey:v3];

  return v4;
}

- (CPAccNavParamKey)init
{
  v6.receiver = self;
  v6.super_class = (Class)CPAccNavParamKey;
  v2 = [(CPAccNavParamKey *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    characteristics = v2->_characteristics;
    v2->_characteristics = (NSSet *)v3;

    v2->_accNavType = -1;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  objc_msgSend(v4, "setKey:", -[CPAccNavParamKey key](self, "key"));
  v5 = [(CPAccNavParamKey *)self characteristics];
  [v4 setCharacteristics:v5];

  objc_msgSend(v4, "setIsBoolValue:", -[CPAccNavParamKey isBoolValue](self, "isBoolValue"));
  objc_msgSend(v4, "setEnumType:", -[CPAccNavParamKey enumType](self, "enumType"));
  objc_super v6 = [(CPAccNavParamKey *)self dimension];
  [v4 setDimension:v6];

  objc_msgSend(v4, "setIsIntegerValue:", -[CPAccNavParamKey isIntegerValue](self, "isIntegerValue"));
  objc_msgSend(v4, "setIsTimeIntervalValue:", -[CPAccNavParamKey isTimeIntervalValue](self, "isTimeIntervalValue"));
  objc_msgSend(v4, "setHasVariants:", -[CPAccNavParamKey hasVariants](self, "hasVariants"));
  objc_msgSend(v4, "setAccNavType:", -[CPAccNavParamKey accNavType](self, "accNavType"));
  v7 = [(CPAccNavParamKey *)self param];
  [v4 setParam:v7];

  return v4;
}

- (id)description
{
  uint64_t v3 = objc_opt_new();
  if ([(CPAccNavParamKey *)self accNavType] != -1)
  {
    v4 = NSString;
    v5 = NSStringFromCPAccNavType([(CPAccNavParamKey *)self accNavType]);
    objc_super v6 = [v4 stringWithFormat:@" accNavType=%@", v5];
    [v3 addObject:v6];
  }
  if ([(CPAccNavParamKey *)self hasCharacteristics])
  {
    v7 = NSString;
    v8 = [(CPAccNavParamKey *)self characteristics];
    v9 = [v8 allObjects];
    v10 = [v9 componentsJoinedByString:@", "];
    v11 = [v7 stringWithFormat:@" [%@]", v10];
    [v3 addObject:v11];
  }
  v12 = NSString;
  uint64_t v13 = objc_opt_class();
  unsigned int v14 = [(CPAccNavParamKey *)self key];
  v15 = [v3 componentsJoinedByString:&stru_26C93EB30];
  v16 = [v12 stringWithFormat:@"<%@: %p key=%hu%@>", v13, self, v14, v15];

  return v16;
}

- (id)unsetValue
{
  unint64_t v2 = [(CPAccNavParamKey *)self accNavType];
  if (v2 > 7) {
    return 0;
  }
  else {
    return *(&off_26430A788 + v2);
  }
}

- (id)copySettingAccNavType:(int64_t)a3
{
  v4 = (void *)[(CPAccNavParamKey *)self copy];
  [v4 setAccNavType:a3];
  v5 = [v4 characteristics];
  objc_super v6 = v5;
  if (a3 == -1) {
    objc_msgSend(v5, "cp_setByRemovingObject:", @"accNavType");
  }
  else {
  v7 = [v5 setByAddingObject:@"accNavType"];
  }
  [v4 setCharacteristics:v7];

  return v4;
}

- (BOOL)hasCharacteristics
{
  unint64_t v2 = [(CPAccNavParamKey *)self characteristics];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)copySettingIsBoolValue:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (void *)[(CPAccNavParamKey *)self copy];
  [v4 setIsBoolValue:v3];
  v5 = [v4 characteristics];
  objc_super v6 = v5;
  if (v3) {
    [v5 setByAddingObject:@"isBool"];
  }
  else {
  v7 = objc_msgSend(v5, "cp_setByRemovingObject:", @"isBool");
  }
  [v4 setCharacteristics:v7];

  return v4;
}

- (id)copySettingEnumType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v4 = (void *)[(CPAccNavParamKey *)self copy];
  [v4 setEnumType:v3];
  v5 = [v4 characteristics];
  objc_super v6 = v5;
  if (v3) {
    [v5 setByAddingObject:@"enumType"];
  }
  else {
  v7 = objc_msgSend(v5, "cp_setByRemovingObject:", @"enumType");
  }
  [v4 setCharacteristics:v7];

  return v4;
}

- (id)copySettingDimension:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(CPAccNavParamKey *)self copy];
  [v5 setDimension:v4];

  objc_super v6 = [v5 characteristics];
  v7 = v6;
  if (v4) {
    [v6 setByAddingObject:@"dimension"];
  }
  else {
  v8 = objc_msgSend(v6, "cp_setByRemovingObject:", @"dimension");
  }
  [v5 setCharacteristics:v8];

  return v5;
}

- (id)copySettingIsIntegerValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)[(CPAccNavParamKey *)self copy];
  [v4 setIsIntegerValue:v3];
  v5 = [v4 characteristics];
  objc_super v6 = v5;
  if (v3) {
    [v5 setByAddingObject:@"integerValue"];
  }
  else {
  v7 = objc_msgSend(v5, "cp_setByRemovingObject:", @"integerValue");
  }
  [v4 setCharacteristics:v7];

  return v4;
}

- (id)copySettingIsTimeIntervalValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)[(CPAccNavParamKey *)self copy];
  [v4 setIsTimeIntervalValue:v3];
  v5 = [v4 characteristics];
  objc_super v6 = v5;
  if (v3) {
    [v5 setByAddingObject:@"timeInterval"];
  }
  else {
  v7 = objc_msgSend(v5, "cp_setByRemovingObject:", @"timeInterval");
  }
  [v4 setCharacteristics:v7];

  return v4;
}

- (id)copySettingHasVariants:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)[(CPAccNavParamKey *)self copy];
  [v4 setHasVariants:v3];
  v5 = [v4 characteristics];
  objc_super v6 = v5;
  if (v3) {
    [v5 setByAddingObject:@"hasVariants"];
  }
  else {
  v7 = objc_msgSend(v5, "cp_setByRemovingObject:", @"hasVariants");
  }
  [v4 setCharacteristics:v7];

  return v4;
}

- (unsigned)key
{
  return self->_key;
}

- (void)setKey:(unsigned __int16)a3
{
  self->_key = a3;
}

- (NSSet)characteristics
{
  return self->_characteristics;
}

- (void)setCharacteristics:(id)a3
{
}

- (BOOL)isBoolValue
{
  return self->_isBoolValue;
}

- (void)setIsBoolValue:(BOOL)a3
{
  self->_isBoolValue = a3;
}

- (unsigned)enumType
{
  return self->_enumType;
}

- (void)setEnumType:(unsigned __int8)a3
{
  self->_enumType = a3;
}

- (NSDimension)dimension
{
  return self->_dimension;
}

- (void)setDimension:(id)a3
{
}

- (BOOL)isIntegerValue
{
  return self->_isIntegerValue;
}

- (void)setIsIntegerValue:(BOOL)a3
{
  self->_isIntegerValue = a3;
}

- (BOOL)isTimeIntervalValue
{
  return self->_isTimeIntervalValue;
}

- (void)setIsTimeIntervalValue:(BOOL)a3
{
  self->_isTimeIntervalValue = a3;
}

- (BOOL)hasVariants
{
  return self->_hasVariants;
}

- (void)setHasVariants:(BOOL)a3
{
  self->_hasVariants = a3;
}

- (int64_t)accNavType
{
  return self->_accNavType;
}

- (void)setAccNavType:(int64_t)a3
{
  self->_accNavType = a3;
}

- (CPAccNavParam)param
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_param);

  return (CPAccNavParam *)WeakRetained;
}

- (void)setParam:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_param);
  objc_storeStrong((id *)&self->_dimension, 0);

  objc_storeStrong((id *)&self->_characteristics, 0);
}

@end