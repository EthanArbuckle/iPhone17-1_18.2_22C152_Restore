@interface DTGPURawCounter_GPURawCounter
- (DTGPURawCounter_GPURawCounter)initWithName:(id)a3;
- (DTGPURawCounter_GPURawCounter)initWithName:(id)a3 width:(unsigned int)a4;
- (GPURawCounterSelect)rawCounterSelect;
- (unint64_t)counterIdx;
- (unint64_t)sourceIdx;
- (unint64_t)valueType;
- (unsigned)width;
- (void)setCounterIdx:(unint64_t)a3;
- (void)setRawCounterSelect:(id)a3;
- (void)setSourceIdx:(unint64_t)a3;
- (void)setValueType:(unint64_t)a3;
- (void)setWidth:(unsigned int)a3;
@end

@implementation DTGPURawCounter_GPURawCounter

- (DTGPURawCounter_GPURawCounter)initWithName:(id)a3 width:(unsigned int)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DTGPURawCounter_GPURawCounter;
  v7 = [(DTGPURawCounter *)&v16 initWithName:v6];
  v8 = v7;
  if (v7)
  {
    v7->_width = a4;
    v9 = (void *)MEMORY[0x263F3F8E8];
    v10 = [(DTGPURawCounter *)v7 name];
    v17 = @"Width";
    v11 = [NSNumber numberWithUnsignedInt:v8->_width];
    v18[0] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v13 = [v9 selectWithName:v10 options:v12];
    rawCounterSelect = v8->_rawCounterSelect;
    v8->_rawCounterSelect = (GPURawCounterSelect *)v13;
  }
  return v8;
}

- (DTGPURawCounter_GPURawCounter)initWithName:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DTGPURawCounter_GPURawCounter;
  v5 = [(DTGPURawCounter *)&v14 initWithName:v4];
  id v6 = v5;
  if (v5)
  {
    v5->_width = 32;
    v7 = (void *)MEMORY[0x263F3F8E8];
    v8 = [(DTGPURawCounter *)v5 name];
    v15 = @"Width";
    v9 = [NSNumber numberWithUnsignedInt:v6->_width];
    v16[0] = v9;
    v10 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    uint64_t v11 = [v7 selectWithName:v8 options:v10];
    rawCounterSelect = v6->_rawCounterSelect;
    v6->_rawCounterSelect = (GPURawCounterSelect *)v11;
  }
  return v6;
}

- (unint64_t)sourceIdx
{
  return self->_sourceIdx;
}

- (void)setSourceIdx:(unint64_t)a3
{
  self->_sourceIdx = a3;
}

- (unint64_t)counterIdx
{
  return self->_counterIdx;
}

- (void)setCounterIdx:(unint64_t)a3
{
  self->_counterIdx = a3;
}

- (unsigned)width
{
  return self->_width;
}

- (void)setWidth:(unsigned int)a3
{
  self->_width = a3;
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (void)setValueType:(unint64_t)a3
{
  self->_valueType = a3;
}

- (GPURawCounterSelect)rawCounterSelect
{
  return self->_rawCounterSelect;
}

- (void)setRawCounterSelect:(id)a3
{
}

- (void).cxx_destruct
{
}

@end