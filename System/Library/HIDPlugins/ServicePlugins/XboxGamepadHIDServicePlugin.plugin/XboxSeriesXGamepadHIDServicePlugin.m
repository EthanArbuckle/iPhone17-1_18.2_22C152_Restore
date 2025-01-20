@interface XboxSeriesXGamepadHIDServicePlugin
- (void)handleInputPayload:(int64_t)a3 withData:(id)a4 timestamp:(unint64_t)a5;
@end

@implementation XboxSeriesXGamepadHIDServicePlugin

- (void)handleInputPayload:(int64_t)a3 withData:(id)a4 timestamp:(unint64_t)a5
{
  id v7 = a4;
  v8 = [v7 bytes];
  id v9 = [v7 length];

  if ((unint64_t)v9 <= 0x12)
  {
    v29 = sub_2178();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_9938();
    }
  }
  else
  {
    unsigned int v15 = (unsigned __int16)v8[2];
    LOWORD(v10) = v8[3];
    *(float *)&unsigned int v16 = (float)v10;
    float v17 = *(float *)&v16 / 1023.0;
    LOWORD(v16) = v8[4];
    float v18 = (float)v16;
    float v33 = v17;
    *(float *)&uint64_t v13 = (float)(__int16)v8[5] / 32767.0;
    float v19 = (float)(__int16)v8[6] / 32767.0;
    float v20 = (float)(__int16)v8[8] / 32767.0;
    float v21 = fmaxf(v19, 0.0);
    if (v19 >= 0.0) {
      float v22 = 0.0;
    }
    else {
      float v22 = -v19;
    }
    float v23 = fmaxf(v20, 0.0);
    if (v20 >= 0.0) {
      float v24 = 0.0;
    }
    else {
      float v24 = -v20;
    }
    *(float *)&unsigned int v32 = (float)(__int16)v8[7] / 32767.0;
    float v25 = v18 / 1023.0;
    *(float *)&uint64_t v11 = -*(float *)&v13;
    -[GCGamepadHIDServicePlugin dispatchMenuButtonEventWithValue:timestamp:](self, "dispatchMenuButtonEventWithValue:timestamp:", (v15 >> 2) & 1, a5, v13, v14, v11, v12);
    [(GCGamepadHIDServicePlugin *)self dispatchOptionsButtonEventWithValue:((unsigned __int16)v8[2] >> 3) & 1 timestamp:a5];
    [(GCGamepadHIDServicePlugin *)self dispatchShareButtonEventWithValue:v8[9] & 1 timestamp:a5];
    uint64_t v34 = 0;
    float32x4_t v35 = vcvtq_f32_u32(vmovl_u16((uint16x4_t)(*(void *)&vshl_u16((uint16x4_t)vdup_n_s16(v15), (uint16x4_t)0xFFF5FFF6FFF7FFF8) & 0xFF01FF01FF01FF01)));
    uint32x2_t v26 = (uint32x2_t)vdup_n_s32(v15);
    float32x2_t v36 = vcvt_f32_u32((uint32x2_t)(*(void *)&vshl_u32((uint32x2_t)(*(void *)&v26 & 0xFFFF00FFFFFF00FFLL), (uint32x2_t)0xFFFFFFFBFFFFFFFCLL) & 0xFFFFFFF1FFFFFFF1));
    float v37 = (float)((v15 >> 6) & 1);
    float v38 = (float)((v15 >> 7) & 1);
    float32x2_t v39 = vcvt_f32_u32((uint32x2_t)(*(void *)&vshl_u32(v26, (uint32x2_t)0xFFFFFFF3FFFFFFF4) & 0xFFFFFFF1FFFFFFF1));
    float v40 = v21;
    float v41 = v22;
    v27.i32[0] = 0;
    v27.i32[1] = v30;
    v28.i32[0] = 0;
    int8x8_t v42 = vand_s8((int8x8_t)__PAIR64__(v30, v31), (int8x8_t)vcgt_f32(v27, (float32x2_t)v30));
    v28.i32[1] = v32;
    float v43 = v23;
    float v44 = v24;
    int8x8_t v45 = vand_s8((int8x8_t)__PAIR64__(v32, -*(float *)&v32), (int8x8_t)vcgt_f32(v28, (float32x2_t)v32));
    float v46 = v33;
    float v47 = v25;
    float v48 = (float)((v15 >> 14) & 1);
    float v49 = (float)(v15 >> 15);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v56 = 0;
    [(GCGamepadHIDServicePlugin *)self dispatchGameControllerExtendedEventWithState:&v34 timestamp:a5];
  }
}

@end