@interface ASDTAcousticData
+ (id)createWithSysCfgData:(id)a3 andType:(int)a4;
- (ASDTAcousticData)initWithSysCfgData:(id)a3 andType:(int)a4;
- (NSArray)entries;
- (NSString)name;
- (int)dataType;
- (void)setDataType:(int)a3;
- (void)setEntries:(id)a3;
- (void)setName:(id)a3;
@end

@implementation ASDTAcousticData

+ (id)createWithSysCfgData:(id)a3 andType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  if (v4 == 1298745185 || v4 == 1399867233)
  {
    v6 = [[ASDTTrimGain alloc] initWithSysCfgData:v5 andType:v4];
    goto LABEL_6;
  }
  if (v4 == 1399870547)
  {
    v6 = [[ASDTSpeakerThieleSmall alloc] initWithSysCfgData:v5];
LABEL_6:
    v7 = v6;
    goto LABEL_10;
  }
  v8 = ASDTBaseLogType();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[ASDTAcousticData createWithSysCfgData:andType:](v4, v8);
  }

  v7 = 0;
LABEL_10:

  return v7;
}

- (ASDTAcousticData)initWithSysCfgData:(id)a3 andType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ASDTAcousticData;
  v7 = [(ASDTAcousticData *)&v20 init];
  if (!v7) {
    goto LABEL_5;
  }
  id v8 = v6;
  if ([v8 bytes] && (unint64_t)objc_msgSend(v8, "length") > 6)
  {
    [(ASDTAcousticData *)v7 setDataType:v4];
    char v19 = 0;
    int32x4_t v9 = (int32x4_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v4), (uint32x4_t)xmmword_248A06990);
    int8x8_t v10 = (int8x8_t)vmovn_s32(v9);
    int32x4_t v11 = vshlq_n_s32(v9, 0x18uLL);
    v12.i64[0] = 0x7F0000007F000000;
    v12.i64[1] = 0x7F0000007F000000;
    int16x8_t v13 = (int16x8_t)vorrq_s8((int8x16_t)vcgtq_s32(vdupq_n_s32(0x1F000001u), v11), (int8x16_t)vceqq_s32(v11, v12));
    *(int16x4_t *)v13.i8 = vrev64_s16((int16x4_t)vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)v13), (int8x8_t)0x3F003F003F003FLL, v10));
    unsigned __int32 v18 = vmovn_s16(v13).u32[0];
    v14 = [NSString stringWithUTF8String:&v18];
    [(ASDTAcousticData *)v7 setName:v14];

LABEL_5:
    v15 = v7;
    goto LABEL_9;
  }
  v16 = ASDTBaseLogType();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[ASDTAcousticData initWithSysCfgData:andType:](v16);
  }

  v15 = 0;
LABEL_9:

  return v15;
}

- (NSArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
}

- (int)dataType
{
  return self->_dataType;
}

- (void)setDataType:(int)a3
{
  self->_dataType = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

+ (void)createWithSysCfgData:(unsigned int)a1 andType:(NSObject *)a2 .cold.1(unsigned int a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v2 = HIBYTE(a1);
  if ((a1 - 0x20000000) >> 24 >= 0x5F) {
    int v2 = 32;
  }
  int v3 = BYTE2(a1);
  if (BYTE2(a1) - 32 >= 0x5F) {
    int v3 = 32;
  }
  int v4 = BYTE1(a1);
  if (BYTE1(a1) - 32 >= 0x5F) {
    int v4 = 32;
  }
  v6[0] = 67109888;
  v6[1] = v2;
  __int16 v7 = 1024;
  int v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  if (a1 - 32 >= 0x5F) {
    int v5 = 32;
  }
  else {
    int v5 = a1;
  }
  __int16 v11 = 1024;
  int v12 = v5;
  _os_log_error_impl(&dword_2489BC000, a2, OS_LOG_TYPE_ERROR, "ASDTAcousticData: Unsupported acoustic data type: '%c%c%c%c'", (uint8_t *)v6, 0x1Au);
}

- (void)initWithSysCfgData:(os_log_t)log andType:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "ASDTAcousticData: Bad input data length.", v1, 2u);
}

@end