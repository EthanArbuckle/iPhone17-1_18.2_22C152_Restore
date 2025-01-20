@interface HAECGSample
- (BOOL)parseRepresentation:(id)a3 withMetadata:(id)a4;
- (HAECGSample)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4;
- (HAECGSample)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (NSArray)ecgData;
- (NSDate)timestamp;
- (NSString)sessionIdentifier;
- (float)frequency;
- (id)decodeHALV1Payload:(id *)a3 withMetadata:(id)a4;
- (id)decodeHALV2Payload:(id *)a3 withMetadata:(id)a4 withPayloadVersion2:(BOOL)a5;
- (unint64_t)flags;
- (void)setTimestampWithRtpTicks:(unint64_t)a3 withMetadata:(id)a4;
@end

@implementation HAECGSample

- (void)setTimestampWithRtpTicks:(unint64_t)a3 withMetadata:(id)a4
{
  id v14 = a4;
  v6 = [v14 objectForKeyedSubscript:@"timestampReference"];
  uint64_t v7 = [v6 unsignedLongLongValue];
  v8 = [v14 objectForKeyedSubscript:@"rtpTicksPerSecond"];
  unsigned int v9 = [v8 unsignedIntValue];
  v10 = [v14 objectForKeyedSubscript:@"wallclockTimeReference"];
  [v10 doubleValue];
  v12 = (NSDate *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceReferenceDate:(double)(a3 - v7) / (double)v9 + v11];
  timestamp = self->_timestamp;
  self->_timestamp = v12;
}

- (id)decodeHALV2Payload:(id *)a3 withMetadata:(id)a4 withPayloadVersion2:(BOOL)a5
{
  BOOL v5 = a5;
  self->_frequency = (float)*(unsigned int *)((char *)&a3->var5 + 1) * 0.000015259;
  [(HAECGSample *)self setTimestampWithRtpTicks:*(void *)((char *)&a3->var4 + 1) withMetadata:a4];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:16];
  if (a3->var2)
  {
    unint64_t v8 = 0;
    unsigned int v9 = (unsigned int *)((char *)&a3->var6.var4 + 3);
    do
    {
      unsigned int v10 = *v9;
      BOOL v11 = (*v9 & 0xFFFFFD7F | *(v9 - 1) & 0x2660) != 0;
      float v12 = CinnAlgs::convertAdcAcVolt((uint64_t)a3, (unsigned __int16)v8, v5);
      v13 = [HAECGData alloc];
      *(float *)&double v14 = v12;
      v15 = [(HAECGData *)v13 initWithFlags:(v10 >> 6) & 2 | v11 value:v14];
      [v7 addObject:v15];
      v9 += 7;

      ++v8;
    }
    while (v8 < a3->var2);
  }
  return v7;
}

- (id)decodeHALV1Payload:(id *)a3 withMetadata:(id)a4
{
  id v6 = a4;
  long long v39 = 0u;
  memset(v40, 0, sizeof(v40));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  *(_OWORD *)&v13[16] = 0u;
  long long v14 = 0u;
  *(_OWORD *)v13 = 0u;
  v13[4] = a3->var2;
  *(void *)&v13[9] = *(void *)((char *)&a3->var4 + 1);
  *(_DWORD *)&v13[17] = *(_DWORD *)((char *)&a3->var5 + 1);
  *(_WORD *)&v13[25] = *(_WORD *)((char *)&a3->var5 + 5);
  if (v13[4])
  {
    uint64_t v7 = 0;
    uint64_t v8 = 28 * v13[4];
    unsigned int v9 = (char *)&a3->var6 + 1;
    do
    {
      unsigned int v10 = &v13[v7];
      *(_WORD *)(v10 + 33) = *(_WORD *)v9;
      *(void *)(v10 + 35) = *(void *)(v9 + 2);
      *(_DWORD *)(v10 + 47) = *((_DWORD *)v9 + 3);
      v7 += 28;
      v9 += 18;
    }
    while (v8 != v7);
  }
  BOOL v11 = [(HAECGSample *)self decodeHALV2Payload:v13 withMetadata:v6 withPayloadVersion2:0];

  return v11;
}

- (BOOL)parseRepresentation:(id)a3 withMetadata:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unsigned __int16 v34 = 0;
  if ((unint64_t)[v6 length] <= 1)
  {
    uint64_t v8 = ha_get_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[HAECGSample parseRepresentation:withMetadata:](&v35, [v6 length]);
    }

    goto LABEL_28;
  }
  if (!v7)
  {
    long long v19 = ha_get_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[HAECGSample parseRepresentation:withMetadata:](v19);
    }
    goto LABEL_27;
  }
  unsigned int v9 = [v7 objectForKeyedSubscript:@"timestampReference"];
  if (!v9)
  {
LABEL_25:
    long long v19 = ha_get_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[HAECGSample parseRepresentation:withMetadata:](v19);
    }
LABEL_27:

    goto LABEL_28;
  }
  unsigned int v10 = [v7 objectForKeyedSubscript:@"rtpTicksPerSecond"];
  if (!v10)
  {
LABEL_24:

    goto LABEL_25;
  }
  BOOL v11 = [v7 objectForKeyedSubscript:@"wallclockTimeReference"];
  if (!v11)
  {
LABEL_23:

    goto LABEL_24;
  }
  float v12 = [v7 objectForKeyedSubscript:@"sessionIdentifier"];
  if (!v12)
  {
LABEL_22:

    goto LABEL_23;
  }
  v13 = [v7 objectForKeyedSubscript:@"ecgApp"];
  if (!v13)
  {

    goto LABEL_22;
  }
  long long v14 = [v7 objectForKeyedSubscript:@"contactDetected"];

  if (!v14) {
    goto LABEL_25;
  }
  long long v15 = [v7 objectForKeyedSubscript:@"contactDetected"];
  char v16 = [v15 BOOLValue];

  if ((v16 & 1) == 0) {
    goto LABEL_28;
  }
  [v6 getBytes:&v34 length:2];
  if (v34 > 0x105u)
  {
    if (v34 == 262)
    {
      if ([v6 length] != 13)
      {
        long long v33 = ha_get_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
          -[HAECGSample parseRepresentation:withMetadata:].cold.6(&v35, [v6 length]);
        }
        goto LABEL_57;
      }
      [v6 getBytes:&v37 length:13];
      [(HAECGSample *)self setTimestampWithRtpTicks:v39 withMetadata:v7];
      if (!v38) {
        goto LABEL_41;
      }
      unint64_t v22 = self->_flags | 1;
    }
    else
    {
      if (v34 != 265) {
        goto LABEL_28;
      }
      if ([v6 length] != 13)
      {
        long long v33 = ha_get_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
          -[HAECGSample parseRepresentation:withMetadata:].cold.6(&v35, [v6 length]);
        }
        goto LABEL_57;
      }
      [v6 getBytes:&v37 length:13];
      [(HAECGSample *)self setTimestampWithRtpTicks:v39 withMetadata:v7];
      if (!v38) {
        goto LABEL_41;
      }
      unint64_t v22 = self->_flags | 2;
    }
    self->_flags = v22;
    goto LABEL_41;
  }
  if (v34 == 170)
  {
    if ([v6 length] == 315)
    {
      [v6 getBytes:&v35 length:315];
      long long v23 = [(HAECGSample *)self decodeHALV1Payload:v36 withMetadata:v7];
      ecgData = self->_ecgData;
      self->_ecgData = v23;

      goto LABEL_41;
    }
    long long v33 = ha_get_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
      -[HAECGSample parseRepresentation:withMetadata:].cold.4(&v37, [v6 length]);
    }
    goto LABEL_57;
  }
  if (v34 != 216)
  {
LABEL_28:
    BOOL v20 = 0;
    goto LABEL_29;
  }
  if ([v6 length] != 483)
  {
    long long v33 = ha_get_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
      -[HAECGSample parseRepresentation:withMetadata:].cold.5(&v37, [v6 length]);
    }
LABEL_57:

    goto LABEL_28;
  }
  [v6 getBytes:&v35 length:483];
  long long v17 = [(HAECGSample *)self decodeHALV2Payload:v36 withMetadata:v7 withPayloadVersion2:1];
  long long v18 = self->_ecgData;
  self->_ecgData = v17;

LABEL_41:
  long long v25 = [v7 objectForKeyedSubscript:@"sessionIdentifier"];
  sessionIdentifier = self->_sessionIdentifier;
  self->_sessionIdentifier = v25;

  long long v27 = [v7 objectForKeyedSubscript:@"ecgApp"];
  int v28 = [v27 BOOLValue];
  uint64_t v29 = 4;
  if (!v28) {
    uint64_t v29 = 0;
  }
  self->_flags |= v29;

  long long v30 = [v7 objectForKeyedSubscript:@"rightWrist"];
  int v31 = [v30 BOOLValue];
  uint64_t v32 = 8;
  if (v31) {
    uint64_t v32 = 0;
  }
  self->_flags |= v32;

  BOOL v20 = 1;
LABEL_29:

  return v20;
}

- (HAECGSample)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HAECGSample;
  unsigned int v9 = [(HAECGSample *)&v13 init];
  unsigned int v10 = v9;
  if (v9)
  {
    [(HAECGSample *)v9 parseRepresentation:v7 withMetadata:v8];
    BOOL v11 = v10;
  }

  return v10;
}

- (HAECGSample)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAECGSample;
  id v8 = [(HAECGSample *)&v12 init];
  unsigned int v9 = v8;
  if (v8 && [(HAECGSample *)v8 parseRepresentation:v6 withMetadata:v7]) {
    unsigned int v10 = v9;
  }
  else {
    unsigned int v10 = 0;
  }

  return v10;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (float)frequency
{
  return self->_frequency;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSArray)ecgData
{
  return self->_ecgData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecgData, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (void)parseRepresentation:(_DWORD *)a1 withMetadata:(uint64_t)a2 .cold.1(_DWORD *a1, uint64_t a2)
{
  *a1 = 134218240;
  OUTLINED_FUNCTION_0((uint64_t)a1, a2, 2);
  OUTLINED_FUNCTION_1_0(&dword_22275A000, v2, v3, "invalid packet length: expected >= %zu, received %zu", v4);
}

- (void)parseRepresentation:(os_log_t)log withMetadata:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22275A000, log, OS_LOG_TYPE_ERROR, "Metadata is nil", v1, 2u);
}

- (void)parseRepresentation:(os_log_t)log withMetadata:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22275A000, log, OS_LOG_TYPE_FAULT, "Required metadata key(s) missing", v1, 2u);
}

- (void)parseRepresentation:(_DWORD *)a1 withMetadata:(uint64_t)a2 .cold.4(_DWORD *a1, uint64_t a2)
{
  *a1 = 134218240;
  OUTLINED_FUNCTION_0((uint64_t)a1, a2, 315);
  OUTLINED_FUNCTION_1_0(&dword_22275A000, v2, v3, "invalid packet length: expected = %zu, received %zu", v4);
}

- (void)parseRepresentation:(_DWORD *)a1 withMetadata:(uint64_t)a2 .cold.5(_DWORD *a1, uint64_t a2)
{
  *a1 = 134218240;
  OUTLINED_FUNCTION_0((uint64_t)a1, a2, 483);
  OUTLINED_FUNCTION_1_0(&dword_22275A000, v2, v3, "invalid packet length: expected = %zu, received %zu", v4);
}

- (void)parseRepresentation:(_DWORD *)a1 withMetadata:(uint64_t)a2 .cold.6(_DWORD *a1, uint64_t a2)
{
  *a1 = 134218240;
  OUTLINED_FUNCTION_0((uint64_t)a1, a2, 13);
  OUTLINED_FUNCTION_1_0(&dword_22275A000, v2, v3, "invalid packet length: expected = %zu, received %zu", v4);
}

@end