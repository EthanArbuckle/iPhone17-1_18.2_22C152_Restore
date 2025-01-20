@interface AKRatchetState
- (AKRatchetState)initWithRawState:(unint64_t)a3 data:(id)a4;
- (AKRatchetStateData)data;
- (id)toString:(unint64_t)a3;
- (unint64_t)rawState;
@end

@implementation AKRatchetState

- (AKRatchetState)initWithRawState:(unint64_t)a3 data:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AKRatchetState;
  v8 = [(AKRatchetState *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_rawState = a3;
    objc_storeStrong((id *)&v8->_data, a4);
  }

  return v9;
}

- (id)toString:(unint64_t)a3
{
  if (a3 > 4) {
    return @"unknown";
  }
  else {
    return *(&off_1E575F528 + a3);
  }
}

- (unint64_t)rawState
{
  return self->_rawState;
}

- (AKRatchetStateData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
}

@end