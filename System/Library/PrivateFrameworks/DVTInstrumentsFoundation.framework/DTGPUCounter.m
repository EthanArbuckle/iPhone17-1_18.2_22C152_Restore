@interface DTGPUCounter
- (BOOL)requiresWeightAccumulation;
- (DTGPUCounter)initWithName:(id)a3 maxValue:(unint64_t)a4;
- (NSArray)rawCounters;
- (NSString)counterDescription;
- (NSString)functionName;
- (NSString)name;
- (NSString)type;
- (id)infoArray;
- (unint64_t)maxValue;
- (unsigned)groupIndex;
- (unsigned)multiplier;
- (void)setCounterDescription:(id)a3;
- (void)setFunctionName:(id)a3;
- (void)setGroupIndex:(unsigned int)a3;
- (void)setMaxValue:(unint64_t)a3;
- (void)setMultiplier:(unsigned int)a3;
- (void)setRawCounters:(id)a3;
- (void)setType:(id)a3;
@end

@implementation DTGPUCounter

- (DTGPUCounter)initWithName:(id)a3 maxValue:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DTGPUCounter;
  v8 = [(DTGPUCounter *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    objc_storeStrong((id *)&v9->_functionName, a3);
    v9->_maxValue = a4;
    v9->_multiplier = 1;
    v9->_requiresWeightAccumulation = ![(NSString *)v9->_name containsString:@"Bandwidth"];
  }

  return v9;
}

- (id)infoArray
{
  v10[6] = *MEMORY[0x263EF8340];
  unint64_t maxValue = self->_maxValue;
  v10[0] = self->_name;
  v4 = [NSNumber numberWithUnsignedLongLong:maxValue];
  v10[1] = v4;
  functionName = self->_functionName;
  v10[2] = self->_counterDescription;
  v10[3] = functionName;
  v6 = [NSNumber numberWithUnsignedInt:self->_multiplier];
  v10[4] = v6;
  id v7 = [NSNumber numberWithUnsignedInt:self->_groupIndex];
  v10[5] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:6];

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(unint64_t)a3
{
  self->_unint64_t maxValue = a3;
}

- (unsigned)groupIndex
{
  return self->_groupIndex;
}

- (void)setGroupIndex:(unsigned int)a3
{
  self->_groupIndex = a3;
}

- (BOOL)requiresWeightAccumulation
{
  return self->_requiresWeightAccumulation;
}

- (NSArray)rawCounters
{
  return self->_rawCounters;
}

- (void)setRawCounters:(id)a3
{
}

- (NSString)counterDescription
{
  return self->_counterDescription;
}

- (void)setCounterDescription:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
}

- (unsigned)multiplier
{
  return self->_multiplier;
}

- (void)setMultiplier:(unsigned int)a3
{
  self->_multiplier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_counterDescription, 0);
  objc_storeStrong((id *)&self->_rawCounters, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end