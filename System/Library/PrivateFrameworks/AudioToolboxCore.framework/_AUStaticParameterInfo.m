@interface _AUStaticParameterInfo
+ (BOOL)supportsSecureCoding;
- (NSArray)valueStrings;
- (NSString)unitName;
- (_AUStaticParameterInfo)initWithCoder:(id)a3;
- (float)defaultValue;
- (float)maxValue;
- (float)minValue;
- (unsigned)clumpID;
- (unsigned)flags;
- (unsigned)originalOrder;
- (unsigned)unit;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setClumpID:(unsigned int)a3;
- (void)setDefaultValue:(float)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setMaxValue:(float)a3;
- (void)setMinValue:(float)a3;
- (void)setOriginalOrder:(unsigned int)a3;
- (void)setUnit:(unsigned int)a3;
- (void)setUnitName:(id)a3;
- (void)setValueStrings:(id)a3;
@end

@implementation _AUStaticParameterInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueStrings, 0);
  objc_storeStrong((id *)&self->_unitName, 0);
}

- (void)setOriginalOrder:(unsigned int)a3
{
  self->_originalOrder = a3;
}

- (unsigned)originalOrder
{
  return self->_originalOrder;
}

- (void)setDefaultValue:(float)a3
{
  self->_defaultValue = a3;
}

- (float)defaultValue
{
  return self->_defaultValue;
}

- (void)setClumpID:(unsigned int)a3
{
  self->_clumpID = a3;
}

- (unsigned)clumpID
{
  return self->_clumpID;
}

- (void)setValueStrings:(id)a3
{
}

- (NSArray)valueStrings
{
  return self->_valueStrings;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setUnitName:(id)a3
{
}

- (NSString)unitName
{
  return self->_unitName;
}

- (void)setUnit:(unsigned int)a3
{
  self->_unit = a3;
}

- (unsigned)unit
{
  return self->_unit;
}

- (void)setMaxValue:(float)a3
{
  self->_maxValue = a3;
}

- (float)maxValue
{
  return self->_maxValue;
}

- (void)setMinValue:(float)a3
{
  self->_minValue = a3;
}

- (float)minValue
{
  return self->_minValue;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_AUStaticParameterInfo;
  [(_AUStaticParameterInfo *)&v2 dealloc];
}

- (_AUStaticParameterInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v14 = self;
    v15 = self;
    -[_AUStaticParameterInfo initWithCoder:]::valueStringClasses = objc_msgSend(v13, "initWithObjects:", v14, v15, 0);
  }
  v16.receiver = self;
  v16.super_class = (Class)_AUStaticParameterInfo;
  v5 = [(_AUStaticParameterInfo *)&v16 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"min"];
    v5->_minValue = v6;
    [v4 decodeFloatForKey:@"max"];
    v5->_maxValue = v7;
    v5->_unit = [v4 decodeInt32ForKey:@"unit"];
    v8 = self;
    v9 = [v4 decodeObjectOfClass:v8 forKey:@"unitName"];
    objc_storeStrong((id *)&v5->_unitName, v9);

    v5->_flags = [v4 decodeInt32ForKey:@"flags"];
    v10 = [v4 decodeObjectOfClasses:-[_AUStaticParameterInfo initWithCoder:]::valueStringClasses forKey:@"values"];
    objc_storeStrong((id *)&v5->_valueStrings, v10);

    v5->_clumpID = [v4 decodeInt32ForKey:@"clump"];
    [v4 decodeFloatForKey:@"default"];
    v5->_defaultValue = v11;
    v5->_originalOrder = [v4 decodeInt32ForKey:@"originalOrder"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  *(float *)&double v5 = self->_minValue;
  id v8 = v4;
  [v4 encodeFloat:@"min" forKey:v5];
  *(float *)&double v6 = self->_maxValue;
  [v8 encodeFloat:@"max" forKey:v6];
  [v8 encodeInt32:self->_unit forKey:@"unit"];
  [v8 encodeObject:self->_unitName forKey:@"unitName"];
  [v8 encodeInt64:self->_flags forKey:@"flags"];
  [v8 encodeObject:self->_valueStrings forKey:@"values"];
  [v8 encodeInt32:self->_clumpID forKey:@"clump"];
  *(float *)&double v7 = self->_defaultValue;
  [v8 encodeFloat:@"default" forKey:v7];
  [v8 encodeInt32:self->_originalOrder forKey:@"originalOrder"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end