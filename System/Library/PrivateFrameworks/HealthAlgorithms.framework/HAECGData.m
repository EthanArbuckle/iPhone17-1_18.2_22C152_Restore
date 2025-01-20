@interface HAECGData
- (HAECGData)initWithFlags:(unint64_t)a3 value:(float)a4;
- (float)value;
- (unint64_t)flags;
@end

@implementation HAECGData

- (HAECGData)initWithFlags:(unint64_t)a3 value:(float)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HAECGData;
  v6 = [(HAECGData *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_flags = a3;
    v6->_value = a4;
    v8 = v6;
  }

  return v7;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (float)value
{
  return self->_value;
}

@end