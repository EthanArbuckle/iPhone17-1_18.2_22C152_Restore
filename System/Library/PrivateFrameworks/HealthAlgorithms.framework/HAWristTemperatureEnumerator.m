@interface HAWristTemperatureEnumerator
- (HAWristTemperatureEnumerator)initWithData:(id)a3 withSessionStartDate:(id)a4 numWristTemperatures:(unint64_t)a5 firstSampleOffset:(unint64_t)a6;
- (NSData)data;
- (NSDate)sessionStartDate;
- (id)allObjects;
- (id)convertPackedTemperatureSubsample;
- (id)nextObject;
- (unint64_t)enumerationIndex;
- (unint64_t)firstSampleOffset;
- (unint64_t)numWristTemperatures;
- (void)setEnumerationIndex:(unint64_t)a3;
@end

@implementation HAWristTemperatureEnumerator

- (HAWristTemperatureEnumerator)initWithData:(id)a3 withSessionStartDate:(id)a4 numWristTemperatures:(unint64_t)a5 firstSampleOffset:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HAWristTemperatureEnumerator;
  v13 = [(HAWristTemperatureEnumerator *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_data, a3);
    objc_storeStrong((id *)&v14->_sessionStartDate, a4);
    v14->_numWristTemperatures = a5;
    v14->_firstSampleOffset = a6;
    v15 = v14;
  }

  return v14;
}

- (id)convertPackedTemperatureSubsample
{
  v3 = [(HAWristTemperatureEnumerator *)self data];
  objc_msgSend(v3, "getBytes:range:", v26, -[HAWristTemperatureEnumerator firstSampleOffset](self, "firstSampleOffset")+ 21 * -[HAWristTemperatureEnumerator enumerationIndex](self, "enumerationIndex"), 21);

  v4 = [(HAWristTemperatureEnumerator *)self sessionStartDate];
  LODWORD(v5) = v26[0];
  v6 = [v4 dateByAddingTimeInterval:(double)v5 / 1000.0];

  [(HAWristTemperatureEnumerator *)self setEnumerationIndex:[(HAWristTemperatureEnumerator *)self enumerationIndex] + 1];
  id v7 = objc_alloc(MEMORY[0x263F08980]);
  float v8 = *(float *)&v26[1];
  v9 = [MEMORY[0x263F08D20] celsius];
  v10 = (void *)[v7 initWithDoubleValue:v9 unit:v8];

  id v11 = objc_alloc(MEMORY[0x263F08980]);
  float v12 = *(float *)&v26[2];
  v13 = [MEMORY[0x263F08D20] celsius];
  v14 = (void *)[v11 initWithDoubleValue:v13 unit:v12];

  id v15 = objc_alloc(MEMORY[0x263F08980]);
  float v16 = *(float *)&v26[3];
  objc_super v17 = [MEMORY[0x263F08D20] celsius];
  v18 = (void *)[v15 initWithDoubleValue:v17 unit:v16];

  char v19 = v27;
  id v20 = objc_alloc(MEMORY[0x263F08980]);
  float v21 = *(float *)&v26[4];
  v22 = [MEMORY[0x263F08D20] celsius];
  v23 = (void *)[v20 initWithDoubleValue:v22 unit:v21];

  v24 = [[HAWristTemperature alloc] initWithComputedTemperatureErrorEstimate:v23 computedTemperature:v10 sensor1Temperature:v14 sensor2Temperature:v18 dataValidity:v19 & 7 timestamp:v6];
  return v24;
}

- (id)nextObject
{
  unint64_t v3 = [(HAWristTemperatureEnumerator *)self enumerationIndex];
  if (v3 >= [(HAWristTemperatureEnumerator *)self numWristTemperatures])
  {
    v4 = 0;
  }
  else
  {
    v4 = [(HAWristTemperatureEnumerator *)self convertPackedTemperatureSubsample];
  }
  return v4;
}

- (id)allObjects
{
  unint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[HAWristTemperatureEnumerator numWristTemperatures](self, "numWristTemperatures")- -[HAWristTemperatureEnumerator enumerationIndex](self, "enumerationIndex"));
  while (1)
  {
    unint64_t v4 = [(HAWristTemperatureEnumerator *)self enumerationIndex];
    if (v4 >= [(HAWristTemperatureEnumerator *)self numWristTemperatures]) {
      break;
    }
    unint64_t v5 = [(HAWristTemperatureEnumerator *)self convertPackedTemperatureSubsample];
    [v3 addObject:v5];
  }
  return v3;
}

- (NSData)data
{
  return self->_data;
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (unint64_t)enumerationIndex
{
  return self->_enumerationIndex;
}

- (void)setEnumerationIndex:(unint64_t)a3
{
  self->_enumerationIndex = a3;
}

- (unint64_t)numWristTemperatures
{
  return self->_numWristTemperatures;
}

- (unint64_t)firstSampleOffset
{
  return self->_firstSampleOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end