@interface ARFaceAnchor(AVTExtensions)
- (__n128)_avt_rawTransform;
- (float)_avt_rawBlendShapeAtLocation:()AVTExtensions;
@end

@implementation ARFaceAnchor(AVTExtensions)

- (__n128)_avt_rawTransform
{
  v1 = [a1 trackingData];
  uint64_t v2 = [v1 objectForKeyedSubscript:*MEMORY[0x263F26A78]];
  v3 = (void *)v2;
  if (v2) {
    v4 = (void *)v2;
  }
  else {
    v4 = v1;
  }
  id v5 = v4;

  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F26A70]];
  v7 = [v1 objectForKeyedSubscript:*MEMORY[0x263F26950]];
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F26A08]];

  uint64_t v9 = *MEMORY[0x263F26A88];
  v10 = [v6 objectForKeyedSubscript:*MEMORY[0x263F26A88]];
  ARMatrix3x3FromArray();

  uint64_t v11 = *MEMORY[0x263F26AC8];
  v12 = [v6 objectForKeyedSubscript:*MEMORY[0x263F26AC8]];
  ARVector3FromArray();

  ARVector3ScalarMultiplication();
  ARMatrix4x4FromRotationAndTranslation();
  long long v29 = v14;
  long long v30 = v13;
  long long v26 = v16;
  long long v28 = v15;
  v17 = [v8 objectForKeyedSubscript:v9];
  ARMatrix3x3FromArray();

  v18 = [v8 objectForKeyedSubscript:v11];
  ARVector3FromArray();

  ARVector3ScalarMultiplication();
  ARMatrix4x4FromRotationAndTranslation();
  uint64_t v23 = 0;
  long long v31 = v30;
  long long v32 = v29;
  long long v33 = v28;
  long long v34 = v26;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  do
  {
    *(long long *)((char *)&v35 + v23) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, COERCE_FLOAT(*(long long *)((char *)&v31 + v23))), v20, *(float32x2_t *)((char *)&v31 + v23), 1), v21, *(float32x4_t *)((char *)&v31 + v23), 2), v22, *(float32x4_t *)((char *)&v31 + v23), 3);
    v23 += 16;
  }
  while (v23 != 64);
  uint64_t v24 = 0;
  long long v31 = v35;
  long long v32 = v36;
  long long v33 = v37;
  long long v34 = v38;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  do
  {
    *(long long *)((char *)&v35 + v24) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_20B88FE60, COERCE_FLOAT(*(long long *)((char *)&v31 + v24))), (float32x4_t)xmmword_20B88FE10, *(float32x2_t *)((char *)&v31 + v24), 1), (float32x4_t)xmmword_20B88FF60, *(float32x4_t *)((char *)&v31 + v24), 2), (float32x4_t)xmmword_20B88FF70, *(float32x4_t *)((char *)&v31 + v24), 3);
    v24 += 16;
  }
  while (v24 != 64);
  long long v27 = v35;

  return (__n128)v27;
}

- (float)_avt_rawBlendShapeAtLocation:()AVTExtensions
{
  id v4 = a3;
  id v5 = [a1 trackingData];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F26A78]];
  v7 = (void *)v6;
  if (v6) {
    v8 = (void *)v6;
  }
  else {
    v8 = v5;
  }
  id v9 = v8;

  int v10 = [v4 isEqualToString:*MEMORY[0x263EF8EC8]];
  uint64_t v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F26928]];

  if (v10)
  {
    id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F26938]];

    [v12 floatValue];
    if (v13 <= 0.5) {
      float v14 = 0.0;
    }
    else {
      float v14 = 1.0;
    }
  }
  else
  {
    long long v15 = [v11 objectForKeyedSubscript:*MEMORY[0x263F26930]];

    uint64_t v16 = AVTBlendShapeLocationToARIndex(v4);
    id v12 = v15;
    float v14 = *(float *)([v12 bytes] + 4 * v16);
  }

  return v14;
}

@end