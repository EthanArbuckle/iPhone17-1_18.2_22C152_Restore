@interface LACDTOEvent
- (BOOL)isEqual:(id)a3;
- (LACDTOEvent)initWithRawValue:(int64_t)a3;
- (LACDTOEvent)initWithRawValue:(int64_t)a3 optionalValue:(id)a4;
- (id)description;
- (id)value;
- (int64_t)rawValue;
@end

@implementation LACDTOEvent

- (LACDTOEvent)initWithRawValue:(int64_t)a3 optionalValue:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LACDTOEvent;
  v8 = [(LACDTOEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_rawValue = a3;
    objc_storeStrong(&v8->_value, a4);
  }

  return v9;
}

- (LACDTOEvent)initWithRawValue:(int64_t)a3
{
  return [(LACDTOEvent *)self initWithRawValue:a3 optionalValue:0];
}

- (id)description
{
  v16[2] = *MEMORY[0x263EF8340];
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = NSString;
  int64_t v6 = [(LACDTOEvent *)self rawValue];
  if ((unint64_t)(v6 - 1) > 2) {
    id v7 = @"LADTOEventRawValueRatchetStateDidChange";
  }
  else {
    id v7 = off_2653B5DA8[v6 - 1];
  }
  v8 = [v5 stringWithFormat:@"rawValue: %@", v7];
  v16[0] = v8;
  v9 = NSString;
  v10 = [(LACDTOEvent *)self value];
  objc_super v11 = [v9 stringWithFormat:@"value: %@", v10];
  v16[1] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  v13 = [v12 componentsJoinedByString:@"; "];
  v14 = [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v13];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 rawValue];
    if (v6 == [(LACDTOEvent *)self rawValue])
    {
      id v7 = [v5 value];
      v8 = [(LACDTOEvent *)self value];
      char v9 = [v7 isEqual:v8];

      char v10 = v9 ^ 1;
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (int64_t)rawValue
{
  return self->_rawValue;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end