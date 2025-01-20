@interface HDFitnessMachineCharacteristicField
- (BOOL)flagFieldFlipped;
- (BOOL)isIncludedInFlags:(unsigned int)a3;
- (BOOL)isSet;
- (HDFitnessMachineCharacteristicField)initWithCorrespondingFlagBit:(unsigned __int8)a3 fieldLength:(unsigned __int8)a4 factor:(unsigned __int8)a5;
- (id)valueAsData;
- (unsigned)correspondingFlagBit;
- (unsigned)factor;
- (unsigned)fieldLength;
- (void)setFlagFieldFlipped:(BOOL)a3;
- (void)setIsSet:(BOOL)a3;
- (void)setValueWithBytes:(const char *)a3 before:(const char *)a4;
@end

@implementation HDFitnessMachineCharacteristicField

- (HDFitnessMachineCharacteristicField)initWithCorrespondingFlagBit:(unsigned __int8)a3 fieldLength:(unsigned __int8)a4 factor:(unsigned __int8)a5
{
  if (a5)
  {
    v11.receiver = self;
    v11.super_class = (Class)HDFitnessMachineCharacteristicField;
    v8 = [(HDFitnessMachineCharacteristicField *)&v11 init];
    if (v8)
    {
      v8->_correspondingFlagBit = a3;
      v8->_fieldLength = a4;
      v8->_factor = a5;
      v8->_isSet = 0;
    }
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isIncludedInFlags:(unsigned int)a3
{
  return (self->_flagFieldFlipped ^ (a3 >> [(HDFitnessMachineCharacteristicField *)self correspondingFlagBit])) & 1;
}

- (BOOL)flagFieldFlipped
{
  return self->_flagFieldFlipped;
}

- (void)setFlagFieldFlipped:(BOOL)a3
{
  self->_flagFieldFlipped = a3;
}

- (unsigned)correspondingFlagBit
{
  return self->_correspondingFlagBit;
}

- (unsigned)fieldLength
{
  return self->_fieldLength;
}

- (unsigned)factor
{
  return self->_factor;
}

- (BOOL)isSet
{
  return self->_isSet;
}

- (void)setIsSet:(BOOL)a3
{
  self->_isSet = a3;
}

- (void)setValueWithBytes:(const char *)a3 before:(const char *)a4
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (id)valueAsData
{
  objc_opt_class();
  NSRequestConcreteImplementation();

  return +[NSData data];
}

@end