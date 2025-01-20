@interface _MDLProbeCluster
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCluster:(id)a3;
- (NSMutableSet)probes;
- (double)centroid;
- (unint64_t)hash;
- (void)calculateCentroidNotIncludingSamplesinArray:(id)a3;
- (void)setCentroid:(_MDLProbeCluster *)self;
- (void)setProbes:(id)a3;
@end

@implementation _MDLProbeCluster

- (BOOL)isEmpty
{
  v3 = objc_msgSend_probes(self, a2, v2);
  BOOL v6 = objc_msgSend_count(v3, v4, v5) == 0;

  return v6;
}

- (BOOL)isEqualToCluster:(id)a3
{
  id v6 = a3;
  if (v6
    && (objc_msgSend_centroid(self, v4, v5),
        float32x4_t v25 = v7,
        objc_msgSend_centroid(v6, v8, v9),
        (vmovn_s32(vceqq_f32(v25, v12)).u8[0] & 1) != 0)
    && (objc_msgSend_centroid(self, v10, v11),
        float32x4_t v26 = v13,
        objc_msgSend_centroid(v6, v14, v15),
        (vmovn_s32(vceqq_f32(v26, v18)).i8[2] & 1) != 0))
  {
    objc_msgSend_centroid(self, v16, v17);
    float32x4_t v27 = v19;
    objc_msgSend_centroid(v6, v20, v21);
    __int8 v23 = vmovn_s32(vceqq_f32(v27, v22)).i8[4];
  }
  else
  {
    __int8 v23 = 0;
  }

  return v23 & 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_MDLProbeCluster *)a3;
  if (self == v4)
  {
    char isEqualToCluster = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char isEqualToCluster = objc_msgSend_isEqualToCluster_(self, v5, (uint64_t)v4);
    }
    else {
      char isEqualToCluster = 0;
    }
  }

  return isEqualToCluster;
}

- (unint64_t)hash
{
  objc_msgSend_centroid(self, a2, v2);
  int8x8_t v19 = v4;
  objc_msgSend_centroid(self, v5, v6);
  float32x2_t v8 = (float32x2_t)vext_s8(v7, v19, 4uLL);
  int32x2_t v9 = vceqz_f32(v8);
  v10.i64[0] = v9.i32[0];
  v10.i64[1] = v9.i32[1];
  int8x16_t v11 = v10;
  v10.i64[0] = v8.u32[0];
  v10.i64[1] = v8.u32[1];
  int64x2_t v12 = (int64x2_t)vbicq_s8(v10, v11);
  unint64_t v13 = veorq_s8((int8x16_t)v12, (int8x16_t)vdupq_laneq_s64(v12, 1)).u64[0];
  objc_msgSend_centroid(self, v14, v15);
  uint64_t v17 = LODWORD(v16);
  if (v16 == 0.0) {
    uint64_t v17 = 0;
  }
  return v13 ^ v17;
}

- (void)calculateCentroidNotIncludingSamplesinArray:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = self->_probes;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v23, v27, 16);
  if (!v8)
  {

    float32x4_t v22 = 0u;
LABEL_13:
    float32x4_t v21 = v22;
    goto LABEL_14;
  }
  int v9 = 0;
  uint64_t v10 = *(void *)v24;
  float32x4_t v22 = 0u;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(v5);
      }
      int64x2_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
      if ((objc_msgSend_containsObject_(v4, v7, (uint64_t)v12, *(_OWORD *)&v22, (void)v23) & 1) == 0)
      {
        objc_msgSend_position(v12, v7, v13);
        float32x4_t v22 = vaddq_f32(v14, v22);
        ++v9;
      }
    }
    uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v23, v27, 16);
  }
  while (v8);

  if (v9 < 1) {
    goto LABEL_13;
  }
  *(float *)v15.i32 = (float)v9;
  __asm { FMOV            V1.4S, #1.0 }
  float32x4_t v21 = vmulq_f32(v22, vdivq_f32(_Q1, (float32x4_t)vdupq_lane_s32(v15, 0)));
LABEL_14:
  *(float32x4_t *)self->_centroid = v21;
}

- (double)centroid
{
  objc_copyStruct(&v2, (const void *)(a1 + 16), 16, 1, 0);
  return *(double *)&v2;
}

- (void)setCentroid:(_MDLProbeCluster *)self
{
  long long v3 = v2;
  objc_copyStruct(self->_centroid, &v3, 16, 1, 0);
}

- (NSMutableSet)probes
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProbes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end