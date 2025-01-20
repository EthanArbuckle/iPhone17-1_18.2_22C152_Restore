@interface HAWristTemperatureSession
- (BOOL)isPublishable;
- (BOOL)parsePacket:()variant<PackedWristTemperatureHeaderV0;
- (HAWristTemperatureEnumerator)wristTemperatureEnumerator;
- (HAWristTemperatureSession)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(id)a5;
- (NSData)representation;
- (NSDateInterval)sessionInterval;
- (NSMeasurement)meanQuiescentPower;
- (NSMeasurement)stdDevQuiescentPower;
- (NSString)algorithmVersion;
- (float)a0CorrectionCoefficient;
- (float)c0CorrectionCoefficient;
- (id)sessionIntervalV0WithStartTime:(double)a3;
- (unint64_t)firstSampleOffset;
- (unint64_t)numWristTemperatures;
- (unsigned)dataVersion;
@end

@implementation HAWristTemperatureSession

- (id)sessionIntervalV0WithStartTime:(double)a3
{
  v5 = [(HAWristTemperatureSession *)self representation];
  objc_msgSend(v5, "getBytes:range:", v12, -[HAWristTemperatureSession firstSampleOffset](self, "firstSampleOffset")+ 21 * -[HAWristTemperatureSession numWristTemperatures](self, "numWristTemperatures")- 21, 21);

  if ([(HAWristTemperatureSession *)self numWristTemperatures])
  {
    LODWORD(v6) = v12[0];
    double v7 = (double)v6 / 1000.0;
  }
  else
  {
    double v7 = 0.0;
  }
  id v8 = objc_alloc(MEMORY[0x263F08798]);
  v9 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceReferenceDate:a3];
  v10 = (void *)[v8 initWithStartDate:v9 duration:v7];

  return v10;
}

- (BOOL)parsePacket:()variant<PackedWristTemperatureHeaderV0
{
  v9 = &v10;
  v10 = self;
  uint64_t var5_low = LODWORD(a3->var0.var0.var1.var0.var5);
  if (var5_low == -1) {
    goto LABEL_6;
  }
  v11 = &v9;
  int v5 = ((uint64_t (*)(HAWristTemperatureSession ****, variant<PackedWristTemperatureHeaderV0, PackedWristTemperatureHeaderV1> *))off_26D4E3F78[var5_low])(&v11, a3);
  if (v5)
  {
    uint64_t v6 = LODWORD(a3->var0.var0.var1.var0.var5);
    if (v6 != -1)
    {
      v11 = &v9;
      char v7 = ((uint64_t (*)(HAWristTemperatureSession ****, variant<PackedWristTemperatureHeaderV0, PackedWristTemperatureHeaderV1> *))off_26D4E3F88[v6])(&v11, a3);
      v10->_isPublishable = v7;
      return v5;
    }
LABEL_6:
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  return v5;
}

- (HAWristTemperatureSession)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if ([v7 length])
  {
    v17.receiver = self;
    v17.super_class = (Class)HAWristTemperatureSession;
    id v8 = [(HAWristTemperatureSession *)&v17 init];
    if (v8)
    {
      [v7 getBytes:&v8->_dataVersion length:1];
      objc_storeStrong((id *)&v8->_representation, a3);
      if (v8->_dataVersion == 1)
      {
        v14[7] = 1;
        BOOL v9 = [(HAWristTemperatureSession *)v8 parsePacket:v14];
      }
      else
      {
        if (v8->_dataVersion)
        {
          v12 = ha_get_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
            -[HAWristTemperatureSession initWithBinarySampleRepresentation:metadata:timestamp:](&v8->_dataVersion, v12);
          }

          goto LABEL_17;
        }
        int v16 = 0;
        BOOL v9 = [(HAWristTemperatureSession *)v8 parsePacket:v15];
      }
      if (v9)
      {
        self = v8;
        v11 = self;
        goto LABEL_18;
      }
LABEL_17:
      v11 = 0;
      self = v8;
      goto LABEL_18;
    }
    self = 0;
  }
  else
  {
    v10 = ha_get_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[HAWristTemperatureSession initWithBinarySampleRepresentation:metadata:timestamp:](v18, [v7 length]);
    }
  }
  v11 = 0;
LABEL_18:

  return v11;
}

- (HAWristTemperatureEnumerator)wristTemperatureEnumerator
{
  v3 = [HAWristTemperatureEnumerator alloc];
  v4 = [(HAWristTemperatureSession *)self representation];
  int v5 = [(HAWristTemperatureSession *)self sessionInterval];
  uint64_t v6 = [v5 startDate];
  id v7 = [(HAWristTemperatureEnumerator *)v3 initWithData:v4 withSessionStartDate:v6 numWristTemperatures:[(HAWristTemperatureSession *)self numWristTemperatures] firstSampleOffset:[(HAWristTemperatureSession *)self firstSampleOffset]];

  return v7;
}

- (NSDateInterval)sessionInterval
{
  return self->_sessionInterval;
}

- (NSString)algorithmVersion
{
  return self->_algorithmVersion;
}

- (float)a0CorrectionCoefficient
{
  return self->_a0CorrectionCoefficient;
}

- (float)c0CorrectionCoefficient
{
  return self->_c0CorrectionCoefficient;
}

- (NSMeasurement)meanQuiescentPower
{
  return self->_meanQuiescentPower;
}

- (NSMeasurement)stdDevQuiescentPower
{
  return self->_stdDevQuiescentPower;
}

- (BOOL)isPublishable
{
  return self->_isPublishable;
}

- (NSData)representation
{
  return self->_representation;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
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
  objc_storeStrong((id *)&self->_representation, 0);
  objc_storeStrong((id *)&self->_stdDevQuiescentPower, 0);
  objc_storeStrong((id *)&self->_meanQuiescentPower, 0);
  objc_storeStrong((id *)&self->_algorithmVersion, 0);
  objc_storeStrong((id *)&self->_sessionInterval, 0);
}

- (void)initWithBinarySampleRepresentation:(_DWORD *)a1 metadata:(uint64_t)a2 timestamp:.cold.1(_DWORD *a1, uint64_t a2)
{
  *a1 = 134218240;
  OUTLINED_FUNCTION_0((uint64_t)a1, a2, 1);
  OUTLINED_FUNCTION_2(&dword_22275A000, v2, (uint64_t)v2, "invalid packet length: expected >= %zu, received %zu", v3);
}

- (void)initWithBinarySampleRepresentation:(unsigned __int8 *)a1 metadata:(NSObject *)a2 timestamp:.cold.2(unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_22275A000, a2, OS_LOG_TYPE_FAULT, "unrecognized wrist temperature reading data version (%uhh)", (uint8_t *)v3, 8u);
}

@end