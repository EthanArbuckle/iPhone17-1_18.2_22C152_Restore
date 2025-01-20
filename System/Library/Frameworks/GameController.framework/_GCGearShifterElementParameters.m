@interface _GCGearShifterElementParameters
+ (Class)viewClass;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPatternShifter;
- (_GCGearShifterElementParameters)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sources;
- (uint64_t)eventShifterValueField;
- (uint64_t)positionRange;
- (uint64_t)setEventShifterValueField:(uint64_t)result;
- (uint64_t)setPatternShifter:(uint64_t)result;
- (uint64_t)setPositionRange:(uint64_t)a3;
- (void)setSources:(void *)a1;
@end

@implementation _GCGearShifterElementParameters

- (BOOL)isPatternShifter
{
  if (result) {
    return *(unsigned char *)(result + 40) != 0;
  }
  return result;
}

- (id)sources
{
  id v1 = a1;
  if (a1)
  {
    v2 = (void *)a1[6];
    if (v2)
    {
      id v1 = v2;
    }
    else
    {
      v3 = -[_GCDevicePhysicalInputElementParameters aliases]((uint64_t)a1);
      v4 = -[_GCDevicePhysicalInputElementParameters localizedName]((uint64_t)v1);
      v5 = -[_GCDevicePhysicalInputElementParameters symbol]((uint64_t)v1);
      v6 = unk_26D2ABF30(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:", v3, v4, v5);
      id v1 = +[NSSet setWithObject:v6];
    }
  }

  return v1;
}

- (uint64_t)positionRange
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (uint64_t)eventShifterValueField
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (_GCGearShifterElementParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)_GCGearShifterElementParameters;
  result = [(_GCGearShifterElementParameters *)&v3 init];
  result->_patternShifter = 0;
  result->_positionRange.location = 0;
  result->_positionRange.length = 0;
  result->_eventShifterValueField = -1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_GCGearShifterElementParameters;
  v4 = [(_GCDevicePhysicalInputElementParameters *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 6, self->_sources);
  *((unsigned char *)v4 + 40) = self->_patternShifter;
  *((_OWORD *)v4 + 4) = self->_positionRange;
  v4[7] = self->_eventShifterValueField;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NSSet **)a3;
  v9.receiver = self;
  v9.super_class = (Class)_GCGearShifterElementParameters;
  BOOL v7 = [(_GCDevicePhysicalInputElementParameters *)&v9 isEqual:v4]
    && ((sources = self->_sources, sources == v4[6]) || -[NSSet isEqual:](sources, "isEqual:"))
    && self->_patternShifter == *((unsigned __int8 *)v4 + 40)
    && ((NSSet *)self->_positionRange.location == v4[8] ? (BOOL v6 = self->_positionRange.length == (void)v4[9]) : (BOOL v6 = 0),
        v6)
    && self->_eventShifterValueField == (void)v4[7];

  return v7;
}

- (void)setSources:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 48);
  }
}

- (uint64_t)setPatternShifter:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)setPositionRange:(uint64_t)a3
{
  if (result)
  {
    *(void *)(result + 64) = a2;
    *(void *)(result + 72) = a3;
  }
  return result;
}

- (uint64_t)setEventShifterValueField:(uint64_t)result
{
  if (result) {
    *(void *)(result + 56) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end