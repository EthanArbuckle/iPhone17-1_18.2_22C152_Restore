@interface DKSystemEvent
- (DKSystemEvent)initWithType:(unsigned __int8)a3 value:(id)a4;
- (NSNumber)value;
- (unsigned)type;
- (void)setType:(unsigned __int8)a3;
- (void)setValue:(id)a3;
@end

@implementation DKSystemEvent

- (DKSystemEvent)initWithType:(unsigned __int8)a3 value:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)DKSystemEvent;
  v7 = [(DKSystemEvent *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(DKSystemEvent *)v7 setType:v4];
    [(DKSystemEvent *)v8 setValue:v6];
  }

  return v8;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end