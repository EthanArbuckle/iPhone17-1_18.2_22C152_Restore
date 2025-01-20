@interface CSFLPCMTypeConverter
+ (id)convertToFloatLPCMBufFromShortLPCMBuf:(id)a3;
+ (id)convertToShortLPCMBufFromFloatLPCMBuf:(id)a3;
+ (void)apply12dBGainToFloatBuffer:(id)a3;
+ (void)apply12dBGainToShortBuffer:(id)a3;
+ (void)applyGain:(float)a3 toFloatBuffer:(id)a4;
+ (void)applyGain:(float)a3 toShortBuffer:(id)a4;
+ (void)applyNegative20dBGainToFloatBuffer:(id)a3;
+ (void)applyNegative20dBGainToShortBuffer:(id)a3;
+ (void)applyNegative32dBGainToFloatBuffer:(id)a3;
+ (void)applyNegative32dBGainToShortBuffer:(id)a3;
@end

@implementation CSFLPCMTypeConverter

+ (void)applyNegative20dBGainToFloatBuffer:(id)a3
{
  LODWORD(v3) = 1036831949;
  [a1 applyGain:a3 toFloatBuffer:v3];
}

+ (void)applyNegative20dBGainToShortBuffer:(id)a3
{
  LODWORD(v3) = 1036831949;
  [a1 applyGain:a3 toShortBuffer:v3];
}

+ (void)applyNegative32dBGainToFloatBuffer:(id)a3
{
  LODWORD(v3) = 1020054733;
  [a1 applyGain:a3 toFloatBuffer:v3];
}

+ (void)applyNegative32dBGainToShortBuffer:(id)a3
{
  LODWORD(v3) = 1020054733;
  [a1 applyGain:a3 toShortBuffer:v3];
}

+ (void)apply12dBGainToFloatBuffer:(id)a3
{
  LODWORD(v3) = 4.0;
  [a1 applyGain:a3 toFloatBuffer:v3];
}

+ (void)apply12dBGainToShortBuffer:(id)a3
{
  LODWORD(v3) = 4.0;
  [a1 applyGain:a3 toShortBuffer:v3];
}

+ (void)applyGain:(float)a3 toFloatBuffer:(id)a4
{
  id v5 = a4;
  vDSP_Length v6 = (unint64_t)[v5 length] >> 2;
  float __B = a3;
  float __C = 1.0;
  float v15 = -1.0;
  id v7 = v5;
  v8 = (const float *)[v7 bytes];
  id v9 = v7;
  vDSP_vsmul(v8, 1, &__B, (float *)[v9 bytes], 1, v6);
  id v10 = v9;
  v11 = (const float *)[v10 bytes];
  id v12 = v10;
  v13 = (float *)[v12 bytes];

  vDSP_vclip(v11, 1, &v15, &__C, v13, 1, v6);
}

+ (void)applyGain:(float)a3 toShortBuffer:(id)a4
{
  id v5 = a4;
  vDSP_Length v6 = (unint64_t)[v5 length] >> 1;
  float __B = a3;
  float __C = 32767.0;
  float v22 = -32768.0;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:4 * v6];
  id v8 = v5;
  id v9 = (const __int16 *)[v8 bytes];
  id v10 = v7;
  vDSP_vflt16(v9, 1, (float *)[v10 bytes], 1, v6);
  id v11 = v10;
  id v12 = (const float *)[v11 bytes];
  id v13 = v11;
  vDSP_vsmul(v12, 1, &__B, (float *)[v13 bytes], 1, v6);
  id v14 = v13;
  float v15 = (const float *)[v14 bytes];
  id v16 = v14;
  vDSP_vclip(v15, 1, &v22, &__C, (float *)[v16 bytes], 1, v6);
  id v17 = v16;
  v18 = (const float *)[v17 bytes];
  id v19 = v8;
  v20 = (__int16 *)[v19 bytes];

  vDSP_vfix16(v18, 1, v20, 1, v6);
}

+ (id)convertToShortLPCMBufFromFloatLPCMBuf:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  vDSP_Length v5 = v4 >> 2;
  float v20 = 32767.0;
  float __C = 1.0;
  float __B = -1.0;
  vDSP_Length v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v4 & 0xFFFFFFFFFFFFFFFCLL];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:2 * (v4 >> 2)];
  id v8 = v3;
  id v9 = (const float *)[v8 bytes];

  id v10 = v6;
  vDSP_vclip(v9, 1, &__B, &__C, (float *)[v10 bytes], 1, v5);
  id v11 = v10;
  id v12 = (const float *)[v11 bytes];
  id v13 = v11;
  vDSP_vsmul(v12, 1, &v20, (float *)[v13 bytes], 1, v5);
  id v14 = v13;
  float v15 = (const float *)[v14 bytes];
  id v16 = v7;
  vDSP_vfix16(v15, 1, (__int16 *)[v16 bytes], 1, v5);

  return v16;
}

+ (id)convertToFloatLPCMBufFromShortLPCMBuf:(id)a3
{
  id v3 = a3;
  vDSP_Length v4 = (unint64_t)[v3 length] >> 1;
  float __B = 0.000030519;
  float __C = 1.0;
  float v17 = -1.0;
  vDSP_Length v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:4 * v4];
  id v6 = v3;
  id v7 = (const __int16 *)[v6 bytes];

  id v8 = v5;
  vDSP_vflt16(v7, 1, (float *)[v8 bytes], 1, v4);
  id v9 = v8;
  id v10 = (const float *)[v9 bytes];
  id v11 = v9;
  vDSP_vsmul(v10, 1, &__B, (float *)[v11 bytes], 1, v4);
  id v12 = v11;
  id v13 = (const float *)[v12 bytes];
  id v14 = v12;
  vDSP_vclip(v13, 1, &v17, &__C, (float *)[v14 bytes], 1, v4);
  return v14;
}

@end