uint64_t sub_22F1EA738()
{
  sub_22F2247E8();
  sub_22F224808();
  return sub_22F224818();
}

uint64_t sub_22F1EA780()
{
  return sub_22F224808();
}

uint64_t sub_22F1EA7AC()
{
  return sub_22F224818();
}

uint64_t sub_22F1EA7F0@<X0>(unsigned __int8 *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s17MeasureFoundation18SegmentationResultC5LabelO8rawValueAESgs5UInt8V_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_22F1EA81C(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_22F1EA828()
{
  return sub_22F223C88();
}

double SegmentationResult.timestamp.getter()
{
  return *(double *)(v0 + 88);
}

CVBufferRef_optional *SegmentationResult.init(_:)(void *a1)
{
  v2 = v1;
  v1[2].value = 0;
  id v4 = objc_msgSend(a1, sel_semanticSegmentationBuffer);
  if (!v4) {
    goto LABEL_16;
  }
  v5 = v4;
  v6.value = CVBufferRef.clone()().value;

  if (!v6.value) {
    goto LABEL_16;
  }
  id v7 = objc_msgSend(a1, sel_semanticSegmentationConfidenceBuffer);
  if (!v7 || (v8 = v7, v9.value = CVBufferRef.clone()().value, v8, !v9.value))
  {
    v9.value = v6.value;
LABEL_15:

LABEL_16:
    swift_deallocPartialClassInstance();
    return 0;
  }
  id v10 = objc_msgSend(a1, sel_normalsBuffer);
  if (!v10 || (v11 = v10, v12.value = CVBufferRef.clone()().value, v11, !v12.value))
  {

    goto LABEL_15;
  }
  v2[3].value = v6.value;
  v2[4].value = v9.value;
  v2[5].value = v12.value;
  v13 = v6.value;
  v14 = v9.value;
  v15 = v12.value;
  objc_msgSend(a1, sel_timestamp);
  v2[11].value = v16;
  CVPixelBufferLockBaseAddress(v13, 0);
  CVPixelBufferLockBaseAddress(v14, 0);
  CVPixelBufferLockBaseAddress(v15, 0);
  v2[6].value = (CVBufferRef)CVPixelBufferGetBaseAddress(v13);
  v2[7].value = (CVBufferRef)CVPixelBufferGetBaseAddress(v14);
  v2[8].value = (CVBufferRef)CVPixelBufferGetBaseAddress(v15);
  size_t Width = CVPixelBufferGetWidth(v13);
  v2[9].value = (CVBufferRef)Width;
  size_t Height = CVPixelBufferGetHeight(v13);
  v2[10].value = (CVBufferRef)Height;
  if (CVPixelBufferGetPixelFormatType(v13) != 1278226488
    || CVPixelBufferGetPixelFormatType(v14) != 1278226534
    || CVPixelBufferGetPixelFormatType(v15) != 1380410945)
  {
    CVPixelBufferUnlockBaseAddress(v13, 0);
    CVPixelBufferUnlockBaseAddress(v14, 0);
    CVPixelBufferUnlockBaseAddress(v15, 0);

LABEL_20:
    swift_release();
    return 0;
  }
  CVPixelBufferUnlockBaseAddress(v13, 0);
  CVPixelBufferUnlockBaseAddress(v14, 0);
  CVPixelBufferUnlockBaseAddress(v15, 0);

  if (Width != 256 || Height != 192) {
    goto LABEL_20;
  }
  return v2;
}

unint64_t SegmentationResult.features(at:)(uint64_t a1, uint64_t a2)
{
  if (a1 < 0) {
    return 33;
  }
  uint64_t v4 = *(void *)(v2 + 72);
  unint64_t result = 33;
  if (v4 > a1 && (a2 & 0x8000000000000000) == 0)
  {
    if (*(void *)(v2 + 80) > a2)
    {
      uint64_t v6 = a2 * v4;
      if ((unsigned __int128)(a2 * (__int128)v4) >> 64 == (a2 * v4) >> 63)
      {
        unint64_t result = v6 + a1;
        if (!__OFADD__(v6, a1)) {
          return sub_22F1EAB98(result);
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      return result;
    }
    return 33;
  }
  return result;
}

unint64_t sub_22F1EAB98(uint64_t a1)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(v1 + 48) + a1);
  if (objc_msgSend(self, sel_jasperAvailable))
  {
    unsigned __int8 v4 = _s17MeasureFoundation18SegmentationResultC5LabelO8rawValueAESgs5UInt8V_tcfC_0(v3);
    if (v4 == 33) {
      unsigned __int8 v5 = 0;
    }
    else {
      unsigned __int8 v5 = v4;
    }
  }
  else
  {
    unsigned __int8 v6 = sub_22F1EB3B8(v3) - 1;
    if (v6 > 0xCu) {
      unsigned __int8 v5 = 0;
    }
    else {
      unsigned __int8 v5 = byte_22F229F09[(char)v6];
    }
  }
  return v5 | ((unint64_t)*(unsigned int *)(*(void *)(v1 + 56) + 4 * a1) << 32);
}

double sub_22F1EAC54(uint64_t a1)
{
  LODWORD(result) = *(_DWORD *)(*(void *)(v1 + 56) + 4 * a1);
  if ((LODWORD(result) & 0x7FFFFFFF) == 0x7F800000)
  {
    if (qword_268694520 != -1) {
      swift_once();
    }
    uint64_t v3 = qword_26869BE48;
    uint64_t v4 = unk_26869BE50;
    sub_22F2246D8();
    sub_22F223B48();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_22F223B48();
    swift_bridgeObjectRelease();
    sub_22F2246D8();
    swift_bridgeObjectRetain();
    sub_22F223B48();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v5 = sub_22F2240B8();
    _s17MeasureFoundation3LogV3log_4type9isPrivateySS_So03os_d1_E2_taSbtF_0(0xD00000000000005ELL, 0x800000022F2315B0, v5, 0, v3, v4);
    swift_bridgeObjectRelease();
    return 0.0;
  }
  return result;
}

float static SegmentationResult.getGravityOffsetAngle(gravity:)(long double a1, long double a2)
{
  float v2 = atan2(a1, a2);
  return v2 + 3.1416;
}

__n64 static SegmentationResult.realign(vector:gravity:)(float32x2_t a1, long double a2, long double a3)
{
  float v3 = atan2(a2, a3);
  __float2 v4 = __sincosf_stret(v3 + 3.1416);
  float32x2_t v5 = vmul_n_f32(a1, v4.__cosval);
  float32x2_t v6 = vmul_n_f32((float32x2_t)vrev64_s32((int32x2_t)a1), v4.__sinval);
  result.n64_u32[0] = vadd_f32(v5, v6).u32[0];
  result.n64_u32[1] = vsub_f32(v5, v6).u32[1];
  return result;
}

id *SegmentationResult.deinit()
{
  return v0;
}

uint64_t SegmentationResult.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_22F1EAF14(char a1)
{
  if ((a1 - 1) > 0xAu) {
    return 0;
  }
  else {
    return byte_22F229F16[(char)(a1 - 1)];
  }
}

void sub_22F1EAF40()
{
  off_268695880 = &unk_26E291A90;
}

unint64_t sub_22F1EAF54(unsigned int a1, uint64_t a2, uint64_t a3)
{
  unint64_t result = sub_22F1EAB98(a3);
  unint64_t v5 = result;
  if (result == 33) {
    goto LABEL_18;
  }
  float v6 = (float)(*((float *)&result + 1) * *((float *)&result + 1)) * 255.0;
  if ((~LODWORD(v6) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (v6 <= -1.0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v6 < 4295000000.0)
  {
    if (qword_2686944C8 == -1) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  __break(1u);
LABEL_16:
  unint64_t result = swift_once();
LABEL_6:
  if (v5 >= *((void *)off_268695880 + 2))
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (a1) {
    unint64_t v7 = a1;
  }
  else {
    unint64_t v7 = 4278190080;
  }
  unsigned int v8 = *((_DWORD *)off_268695880 + v5 + 8) & ((v6 << 24) | 0xFFFFFF);
  return _s17MeasureFoundation8GraphicsC9blendBGRA8srcColor03dstG0s6UInt32VAH_AHtFZ_0(v7, v8);
}

unint64_t (*static SegmentationResult.debugSegRenderer.getter())(unsigned int a1, uint64_t a2, uint64_t a3)
{
  return sub_22F1EAF54;
}

unint64_t sub_22F1EB080(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  sub_22F18032C(a4, (uint64_t)&v53);
  float32x2_t v15 = v53;
  float32x2_t v16 = v54;
  float32x2_t v17 = v55;
  float32x2_t v18 = v56;
  float32x2_t v19 = v57;
  float32x4_t v20 = *(float32x4_t *)(*(void *)(a2 + 64) + 16 * a3);
  if (a1) {
    unint64_t v21 = a1;
  }
  else {
    unint64_t v21 = 4278190080;
  }
  float v22 = v20.f32[1];
  float v23 = v20.f32[2];
  if (qword_2686943C0 != -1)
  {
    float32x2_t v48 = v55;
    float32x2_t v46 = v54;
    float32x4_t v51 = v20;
    swift_once();
    float32x4_t v20 = v51;
    float32x2_t v16 = v46;
    float32x2_t v17 = v48;
  }
  if (v20.f32[0] != *(float *)&static SIMD3<>.zero
    || v22 != *((float *)&static SIMD3<>.zero + 1)
    || v23 != *((float *)&static SIMD3<>.zero + 2))
  {
    float32x2_t v26 = v16;
    float32x2_t v47 = v17;
    if (a8)
    {
      v20.i32[3] = 0;
    }
    else
    {
      float32x4_t v49 = v20;
      float v27 = atan2(*(long double *)&a5, *(long double *)&a6);
      __float2 v28 = __sincosf_stret(v27 + 3.1416);
      float32x2_t v29 = vmul_n_f32(*(float32x2_t *)v49.f32, v28.__cosval);
      float32x2_t v30 = vmul_n_f32((float32x2_t)vrev64_s32(*(int32x2_t *)v49.f32), v28.__sinval);
      v31.i32[0] = vadd_f32(v29, v30).u32[0];
      v31.i32[1] = vsub_f32(v29, v30).i32[1];
      v31.i64[1] = vnegq_f32(v49).u32[2];
      float32x4_t v20 = v31;
    }
    int32x4_t v32 = (int32x4_t)vmulq_f32(v20, v20);
    v32.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v32, 2), vadd_f32(*(float32x2_t *)v32.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v32.i8, 1))).u32[0];
    float32x2_t v33 = vrsqrte_f32((float32x2_t)v32.u32[0]);
    float32x2_t v34 = vmul_f32(v33, vrsqrts_f32((float32x2_t)v32.u32[0], vmul_f32(v33, v33)));
    float32x4_t v50 = vmulq_n_f32(v20, vmul_f32(v34, vrsqrts_f32((float32x2_t)v32.u32[0], vmul_f32(v34, v34))).f32[0]);
    sub_22F18032C(a4, (uint64_t)v58);
    if (v58[64])
    {
      float32x4_t v36 = v50;
    }
    else
    {
      *(float32x2_t *)v37.i8 = simd_float4x4.apply(to:)(v50, v15, v26, v47, v18);
      *(float32x2_t *)v38.f32 = vsub_f32(*(float32x2_t *)v37.i8, v18);
      *(float32x2_t *)&v38.u32[2] = vsub_f32((float32x2_t)*(_OWORD *)&vextq_s8(v37, v37, 8uLL), v19);
      *(float32x2_t *)v37.i8 = vmul_f32(*(float32x2_t *)v38.f32, *(float32x2_t *)v38.f32);
      int8x16_t v35 = (int8x16_t)vdupq_laneq_s32((int32x4_t)vmulq_f32(v38, v38), 2);
      v37.i32[0] = vadd_f32(*(float32x2_t *)v35.i8, vadd_f32(*(float32x2_t *)v37.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v37.i8, 1))).u32[0];
      *(float32x2_t *)v35.i8 = vrsqrte_f32((float32x2_t)v37.u32[0]);
      *(float32x2_t *)v35.i8 = vmul_f32(*(float32x2_t *)v35.i8, vrsqrts_f32((float32x2_t)v37.u32[0], vmul_f32(*(float32x2_t *)v35.i8, *(float32x2_t *)v35.i8)));
      float32x4_t v36 = vmulq_n_f32(v38, vmul_f32(*(float32x2_t *)v35.i8, vrsqrts_f32((float32x2_t)v37.u32[0], vmul_f32(*(float32x2_t *)v35.i8, *(float32x2_t *)v35.i8))).f32[0]);
    }
    if (qword_2686943B8 != -1)
    {
      float32x4_t v52 = v36;
      swift_once();
      float32x4_t v36 = v52;
    }
    *(float32x2_t *)v35.i8 = vmul_f32(vadd_f32(*(float32x2_t *)v36.f32, *(float32x2_t *)&static SIMD3<>.one), (float32x2_t)0x3F0000003F000000);
    __asm { FMOV            V0.4S, #1.0 }
    float32x4_t v43 = (float32x4_t)vextq_s8(vextq_s8(_Q0, _Q0, 4uLL), v35, 0xCuLL);
    v43.f32[3] = (float)(v36.f32[2] + *((float *)&static SIMD3<>.one + 2)) * 0.5;
    unsigned int v44 = _s17MeasureFoundation8GraphicsC8multiply5color6normals6UInt32VAH_s5SIMD4VySfGtFZ_0(0xFFFFFFFF, v43);
    return _s17MeasureFoundation8GraphicsC9blendBGRA8srcColor03dstG0s6UInt32VAH_AHtFZ_0(v21, v44);
  }
  return v21;
}

unint64_t (*static SegmentationResult.debugNormalRenderer.getter())(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  return sub_22F1EB080;
}

uint64_t _s17MeasureFoundation18SegmentationResultC5LabelO8rawValueAESgs5UInt8V_tcfC_0(uint64_t result)
{
  if (result >= 0x21u) {
    return 33;
  }
  else {
    return result;
  }
}

uint64_t sub_22F1EB3B8(uint64_t result)
{
  if (result >= 0xDu) {
    return 13;
  }
  else {
    return result;
  }
}

unint64_t sub_22F1EB3D0()
{
  unint64_t result = qword_268695888;
  if (!qword_268695888)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695888);
  }
  return result;
}

uint64_t type metadata accessor for SegmentationResult()
{
  return self;
}

uint64_t getEnumTagSinglePayload for SegmentationResult.Label(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE0) {
    goto LABEL_17;
  }
  if (a2 + 32 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 32) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 32;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 32;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 32;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x21;
  int v8 = v6 - 33;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for SegmentationResult.Label(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 32 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 32) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xDF)
  {
    unsigned int v6 = ((a2 - 224) >> 8) + 1;
    *unint64_t result = a2 + 32;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22F1EB5A4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 32;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SegmentationResult.Label()
{
  return &type metadata for SegmentationResult.Label;
}

unint64_t sub_22F1EB5DC()
{
  unint64_t result = qword_268695890;
  if (!qword_268695890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695890);
  }
  return result;
}

uint64_t ADProcessor.transformer.getter()
{
  if (*(void *)(v0 + 56))
  {
    uint64_t v1 = *(void *)(v0 + 56);
LABEL_5:
    swift_retain();
    return v1;
  }
  uint64_t v2 = v0;
  uint64_t v3 = *(void *)(v0 + 272);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(ObjectType, v3);
  id v6 = objc_msgSend(v5, sel_currentFrame);

  if (v6)
  {
    id v7 = objc_msgSend(v6, sel_camera);

    uint64_t v8 = *(void *)(v2 + 280);
    uint64_t v9 = ADProcessor.adConfig.getter();
    type metadata accessor for ADTransformer();
    swift_allocObject();
    uint64_t v1 = sub_22F17FB2C(v7, v8, v9);

    swift_release();
    *(void *)(v2 + 56) = v1;
    swift_retain();
    swift_release();
    goto LABEL_5;
  }
  uint64_t result = sub_22F224538();
  __break(1u);
  return result;
}

uint64_t ADProcessor.outputConfidenceTexture.getter()
{
  if (*(void *)(v0 + 104))
  {
    uint64_t v1 = *(void *)(v0 + 104);
LABEL_5:
    swift_unknownObjectRetain();
    return v1;
  }
  uint64_t v2 = *(void **)(v0 + 288);
  ADProcessor.adConfig.getter();
  swift_release();
  ADProcessor.adConfig.getter();
  swift_release();
  uint64_t result = makeIOSurfaceTexture(device:width:height:pixelFormat:usage:)(v2, 256, 192, 13, 0, 1);
  if (result)
  {
    uint64_t v1 = result;
    *(void *)(v0 + 104) = result;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t ADProcessor.outputDepthTexture.getter()
{
  if (*(void *)(v0 + 96))
  {
    uint64_t v1 = *(void *)(v0 + 96);
LABEL_5:
    swift_unknownObjectRetain();
    return v1;
  }
  uint64_t v2 = *(void **)(v0 + 288);
  ADProcessor.adConfig.getter();
  swift_release();
  ADProcessor.adConfig.getter();
  swift_release();
  uint64_t result = makeIOSurfaceTexture(device:width:height:pixelFormat:usage:)(v2, 256, 192, 55, 0, 1);
  if (result)
  {
    uint64_t v1 = result;
    *(void *)(v0 + 96) = result;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t ADProcessor.outputPersonTexture.getter()
{
  if (*(void *)(v0 + 112))
  {
    uint64_t v1 = *(void *)(v0 + 112);
LABEL_5:
    swift_unknownObjectRetain();
    return v1;
  }
  uint64_t v2 = *(void **)(v0 + 288);
  ADProcessor.adConfig.getter();
  swift_release();
  ADProcessor.adConfig.getter();
  swift_release();
  uint64_t result = makeIOSurfaceTexture(device:width:height:pixelFormat:usage:)(v2, 256, 192, 13, 0, 1);
  if (result)
  {
    uint64_t v1 = result;
    *(void *)(v0 + 112) = result;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

void ADProcessor.capturedTexture.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 80);
  if (v2 != 1) {
    goto LABEL_9;
  }
  uint64_t v3 = *(void **)(v0 + 288);
  ADProcessor.transformer.getter();
  double v4 = ADTransformer.cameraCropRect.getter();
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  swift_release();
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  double Width = CGRectGetWidth(v24);
  if ((~*(void *)&Width & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (Width <= -9.22337204e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (Width >= 9.22337204e18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  ADProcessor.transformer.getter();
  double v12 = ADTransformer.cameraCropRect.getter();
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  swift_release();
  v25.origin.x = v12;
  v25.origin.y = v14;
  v25.size.width = v16;
  v25.size.height = v18;
  double Height = CGRectGetHeight(v25);
  if ((~*(void *)&Height & 0x7FF0000000000000) == 0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (Height <= -9.22337204e18)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (Height < 9.22337204e18)
  {
    uint64_t v20 = (uint64_t)Height;
    uint64_t v21 = sub_22F1EC0B0();
    uint64_t v22 = makeIOSurfaceTexture(device:width:height:pixelFormat:usage:)(v3, (uint64_t)Width, v20, v21, 0, 1);
    uint64_t v23 = *(void *)(v1 + 80);
    *(void *)(v1 + 80) = v22;
    swift_unknownObjectRetain();
    sub_22F1AE764(v23);
LABEL_9:
    sub_22F1AE798(v2);
    return;
  }
LABEL_15:
  __break(1u);
}

id ADProcessor.__allocating_init(sceneView:orientation:)(void *a1, uint64_t a2, uint64_t a3)
{
  swift_allocObject();
  id v6 = sub_22F1ECECC(a1, a2, a3);

  return v6;
}

Swift::OpaquePointer_optional __swiftcall ADProcessor.worldPoints(screenPoints:frame:)(Swift::OpaquePointer screenPoints, ARFrame frame)
{
  double v4 = (os_unfair_lock_s *)(v2 + 304);
  swift_beginAccess();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 304));
  swift_endAccess();
  uint64_t v5 = *(void *)(v2 + 144);
  if (v5 && (uint64_t v6 = *(void *)(v2 + 152)) != 0)
  {
    swift_retain();
    uint64_t v7 = sub_22F1ECC98((uint64_t)screenPoints._rawValue, v2, v6, v5);
    uint64_t v8 = swift_release();
    MEMORY[0x270FA5388](v8);
    uint64_t v9 = sub_22F1ED030(v7, (uint64_t (*)(uint64_t, void, void, void))sub_22F1B886C);
    swift_bridgeObjectRelease();
    swift_beginAccess();
    os_unfair_lock_unlock(v4);
    swift_endAccess();
  }
  else
  {
    swift_beginAccess();
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 304));
    swift_endAccess();
    uint64_t v9 = 0;
  }
  v11 = (void *)v9;
  result.value._rawValue = v11;
  result.is_nil = v10;
  return result;
}

Swift::Void __swiftcall ADProcessor.didUpdate(frame:)(ARFrame frame)
{
  kdebug_trace();
  swift_beginAccess();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 304));
  swift_endAccess();
  id v3 = [(objc_class *)frame.super.isa camera];
  objc_msgSend(v3, sel_viewMatrixForOrientation_, *(void *)(ADProcessor.transformer.getter() + 304));
  simd_float4x4 v26 = __invert_f4(v25);
  simd_float4 v23 = v26.columns[1];
  simd_float4 v24 = v26.columns[0];
  simd_float4 v21 = v26.columns[3];
  simd_float4 v22 = v26.columns[2];
  swift_release();
  swift_beginAccess();
  *(simd_float4 *)(v1 + 176) = v24;
  *(simd_float4 *)(v1 + 192) = v23;
  *(simd_float4 *)(v1 + 208) = v22;
  *(simd_float4 *)(v1 + 224) = v21;
  *(unsigned char *)(v1 + 240) = 0;
  swift_beginAccess();
  if (*(unsigned char *)(v1 + 242) == 1) {
    sub_22F1EC6E0(frame.super.isa);
  }
  id v4 = [(objc_class *)frame.super.isa sceneDepth];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = objc_msgSend(v4, sel_depthMap);
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = *(void **)(v1 + 120);
  *(void *)(v1 + 120) = v6;

  id v8 = [(objc_class *)frame.super.isa sceneDepth];
  id v9 = objc_msgSend(v8, sel_confidenceMap);

  Swift::Bool v10 = *(void **)(v1 + 128);
  *(void *)(v1 + 128) = v9;

  id v11 = [(objc_class *)frame.super.isa segmentationBuffer];
  double v12 = *(void **)(v1 + 136);
  *(void *)(v1 + 136) = v11;

  double v13 = *(void **)(v1 + 120);
  if (v13 && (CGFloat v14 = *(void **)(v1 + 128)) != 0)
  {
    double v15 = v13;
    CGFloat v16 = v14;
    CVPixelBufferLockBaseAddress(v15, 1uLL);
    CVPixelBufferLockBaseAddress(v16, 1uLL);
    *(void *)(v1 + 144) = CVPixelBufferGetBaseAddress(v15);
    *(void *)(v1 + 152) = CVPixelBufferGetBaseAddress(v16);
    CVPixelBufferUnlockBaseAddress(v15, 1uLL);
    CVPixelBufferUnlockBaseAddress(v16, 1uLL);
  }
  else
  {
    *(void *)(v1 + 144) = 0;
    *(void *)(v1 + 152) = 0;
  }
  id v17 = objc_msgSend(self, sel_standardUserDefaults);
  unsigned int v18 = objc_msgSend(v17, sel_kADShowPerson);

  if (v18 && (float32x2_t v19 = *(void **)(v1 + 136)) != 0)
  {
    uint64_t v20 = v19;
    CVPixelBufferLockBaseAddress(v20, 1uLL);
    *(void *)(v1 + 160) = CVPixelBufferGetBaseAddress(v20);
    CVPixelBufferUnlockBaseAddress(v20, 1uLL);
  }
  else
  {
    *(void *)(v1 + 160) = 0;
  }
  sub_22F1ED164();

  swift_beginAccess();
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 304));
  swift_endAccess();
  kdebug_trace();
}

uint64_t ADProcessor.adConfig.getter()
{
  if (*(void *)(v0 + 48))
  {
    uint64_t v1 = *(void *)(v0 + 48);
  }
  else
  {
    uint64_t v2 = v0;
    uint64_t v3 = *(void *)(v0 + 272);
    uint64_t ObjectType = swift_getObjectType();
    double v5 = (*(double (**)(uint64_t, uint64_t))(v3 + 8))(ObjectType, v3);
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    type metadata accessor for ARKitADConfiguration();
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_22F229F30;
    *(double *)(v1 + 32) = v5;
    *(void *)(v1 + 40) = v7;
    *(void *)(v1 + 48) = v9;
    *(void *)(v1 + 56) = v11;
    *(_DWORD *)(v1 + 64) = 1065353216;
    *(unsigned char *)(v1 + 68) = 1;
    *(_OWORD *)(v1 + 72) = xmmword_22F229F40;
    *(void *)(v2 + 48) = v1;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v1;
}

uint64_t sub_22F1EC0B0()
{
  if (*(unsigned char *)(v0 + 32) != 1) {
    return *(void *)(v0 + 24);
  }
  uint64_t result = 80;
  *(void *)(v0 + 24) = 80;
  *(unsigned char *)(v0 + 32) = 0;
  return result;
}

uint64_t sub_22F1EC0D4()
{
  if (*(unsigned char *)(v0 + 40) != 1) {
    return *(unsigned int *)(v0 + 36);
  }
  uint64_t result = 1111970369;
  strcpy((char *)(v0 + 36), "ARGB");
  return result;
}

__CVMetalTextureCache *ADProcessor.textureCache.getter()
{
  v7[1] = *(CVMetalTextureCacheRef *)MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(v0 + 64);
  if (v1)
  {
    uint64_t v2 = *(__CVMetalTextureCache **)(v0 + 64);
LABEL_5:
    id v6 = v1;
    return v2;
  }
  v7[0] = 0;
  uint64_t result = (__CVMetalTextureCache *)CVMetalTextureCacheCreate(0, 0, *(id *)(v0 + 288), 0, v7);
  CVMetalTextureCacheRef v4 = v7[0];
  if (v7[0])
  {
    double v5 = *(void **)(v0 + 64);
    *(CVMetalTextureCacheRef *)(v0 + 64) = v7[0];
    uint64_t v2 = v4;

    uint64_t v1 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

id sub_22F1EC1AC()
{
  uint64_t v1 = *(void **)(v0 + 72);
  if (v1)
  {
    id v2 = *(id *)(v0 + 72);
  }
  else
  {
    id v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for KernelYCbCrToRGB()), sel_initWithDevice_, *(void *)(v0 + 288));
    CVMetalTextureCacheRef v4 = *(void **)(v0 + 72);
    *(void *)(v0 + 72) = v3;
    id v2 = v3;

    uint64_t v1 = 0;
  }
  id v5 = v1;
  return v2;
}

void ADProcessor.capturedPixelBuffer.getter()
{
  v10[1] = *(CVPixelBufferRef *)MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(v0 + 88);
  if (v1 != (void *)1) {
    goto LABEL_5;
  }
  ADProcessor.capturedTexture.getter();
  if (v2)
  {
    id v3 = objc_msgSend(v2, sel_width);
    swift_unknownObjectRelease();
    ADProcessor.capturedTexture.getter();
    if (v4)
    {
      id v5 = objc_msgSend(v4, sel_height);
      swift_unknownObjectRelease();
      OSType v6 = sub_22F1EC0D4();
      v10[0] = 0;
      CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (size_t)v3, (size_t)v5, v6, 0, v10);
      CVPixelBufferRef v7 = v10[0];
      uint64_t v8 = *(void **)(v0 + 88);
      *(CVPixelBufferRef *)(v0 + 88) = v10[0];
      uint64_t v9 = v7;
      sub_22F1A5E04(v8);
LABEL_5:
      sub_22F1A5E14(v1);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

__n128 ADProcessor.cameraToWorld.getter@<Q0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  char v3 = *(unsigned char *)(v1 + 240);
  long long v4 = *(_OWORD *)(v1 + 192);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 176);
  *(_OWORD *)(a1 + 16) = v4;
  __n128 result = *(__n128 *)(v1 + 208);
  long long v6 = *(_OWORD *)(v1 + 224);
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v6;
  *(unsigned char *)(a1 + 64) = v3;
  return result;
}

uint64_t ADProcessor.isGuidedFilterEnabled.getter()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 242);
}

uint64_t ADProcessor.isGuidedFilterEnabled.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 242) = a1;
  return result;
}

uint64_t (*ADProcessor.isGuidedFilterEnabled.modify())()
{
  return j__swift_endAccess;
}

uint64_t ADProcessor.isNoiseReductionEnabled.getter()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 243);
}

uint64_t ADProcessor.isNoiseReductionEnabled.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 243) = a1;
  return result;
}

uint64_t (*ADProcessor.isNoiseReductionEnabled.modify())()
{
  return j_j__swift_endAccess;
}

id sub_22F1EC514()
{
  if (*(void *)(v0 + 248))
  {
    id v1 = *(id *)(v0 + 248);
  }
  else
  {
    uint64_t v2 = v0;
    uint64_t v3 = ADProcessor.transformer.getter();
    type metadata accessor for ADGuidedFilter();
    swift_allocObject();
    id v1 = sub_22F1A5E24(v3);
    swift_release();
    *(void *)(v2 + 248) = v1;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v1;
}

uint64_t ADProcessor.guidedDepthTexture.getter()
{
  return swift_unknownObjectRetain();
}

id ADProcessor.init(sceneView:orientation:)(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = sub_22F1ECECC(a1, a2, a3);

  return v4;
}

uint64_t ADProcessor.deinit()
{
  swift_release();
  swift_release();

  sub_22F1AE764(*(void *)(v0 + 80));
  sub_22F1A5E04(*(id *)(v0 + 88));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t ADProcessor.__deallocating_deinit()
{
  ADProcessor.deinit();
  return swift_deallocClassInstance();
}

int64_t sub_22F1EC6E0(void *a1)
{
  if ((sub_22F1EC83C(a1) & 1) == 0) {
    return 0;
  }
  ADProcessor.capturedTexture.getter();
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  ADProcessor.capturedPixelBuffer.getter();
  if (!v4)
  {
    swift_unknownObjectRelease();
    return 0;
  }
  id v5 = v4;
  id v6 = objc_msgSend(v3, sel_iosurface);
  if (!v6)
  {
    swift_unknownObjectRelease();
    goto LABEL_9;
  }
  id v7 = v6;
  if (CVPixelBufferLockBaseAddress((CVPixelBufferRef)v5, 1uLL))
  {
    swift_unknownObjectRelease();

LABEL_9:
    return 0;
  }
  uint64_t BaseAddress = (uint64_t)CVPixelBufferGetBaseAddress((CVPixelBufferRef)v5);
  if (!BaseAddress)
  {
    CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)v5, 1uLL);
    swift_unknownObjectRelease();

    return BaseAddress;
  }
  uint64_t v10 = IOSurfaceGetBaseAddress((IOSurfaceRef)v7);
  int64_t BytesPerRow = IOSurfaceGetBytesPerRow((IOSurfaceRef)v7);
  int64_t result = IOSurfaceGetHeight((IOSurfaceRef)v7);
  if ((unsigned __int128)(BytesPerRow * (__int128)result) >> 64 == (BytesPerRow * result) >> 63)
  {
    memcpy((void *)BaseAddress, v10, BytesPerRow * result);
    uint64_t BaseAddress = 1;
    CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)v5, 1uLL);
    swift_unknownObjectRelease();

    *(unsigned char *)(v1 + 241) = 1;
    return BaseAddress;
  }
  __break(1u);
  return result;
}

uint64_t sub_22F1EC83C(void *a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v2 = (__CVBuffer *)objc_msgSend(a1, sel_capturedImage);
  if ((uint64_t)CVPixelBufferGetPlaneCount(v2) < 2) {
    goto LABEL_2;
  }
  uint64_t v3 = ADProcessor.textureCache.getter();
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(v2, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(v2, 0);
  image[0] = 0;
  uint64_t result = CVMetalTextureCacheCreateTextureFromImage(0, v3, v2, 0, MTLPixelFormatR8Unorm, WidthOfPlane, HeightOfPlane, 0, image);
  CVMetalTextureRef v7 = image[0];
  if (result)
  {

    return 0;
  }
  if (!image[0])
  {
    __break(1u);
    goto LABEL_22;
  }
  id v8 = CVMetalTextureGetTexture(image[0]);

  if (!v8)
  {
LABEL_2:

    return 0;
  }
  uint64_t v9 = ADProcessor.textureCache.getter();
  size_t v10 = CVPixelBufferGetWidthOfPlane(v2, 1uLL);
  size_t v11 = CVPixelBufferGetHeightOfPlane(v2, 1uLL);
  image[0] = 0;
  uint64_t result = CVMetalTextureCacheCreateTextureFromImage(0, v9, v2, 0, MTLPixelFormatRG8Unorm, v10, v11, 1uLL, image);
  CVMetalTextureRef v12 = image[0];
  if (result)
  {
    swift_unknownObjectRelease();

    return 0;
  }
  if (!image[0])
  {
LABEL_22:
    __break(1u);
    return result;
  }
  id v13 = CVMetalTextureGetTexture(image[0]);

  if (!v13) {
    goto LABEL_20;
  }
  id v14 = objc_msgSend(*(id *)(v1 + 296), sel_commandBuffer);
  if (!v14)
  {
    swift_unknownObjectRelease();
LABEL_20:
    swift_unknownObjectRelease();
    goto LABEL_2;
  }
  double v15 = v14;
  ADProcessor.capturedTexture.getter();
  if (!v16)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_20;
  }
  uint64_t v17 = v16;
  id v18 = sub_22F1EC1AC();
  ADProcessor.transformer.getter();
  double v19 = ADTransformer.cameraCropRect.getter();
  float64_t v21 = v20;
  double v23 = v22;
  double v25 = v24;
  swift_release();
  long long v28 = 0u;
  long long v29 = 0u;
  *(_OWORD *)image = 0u;
  char v30 = 1;
  BOOL v26 = sub_22F1F3978(v15, v8, (uint64_t)v13, v17, 0, (uint64_t)image, v19, v21, v23, v25);

  if (v26)
  {
    objc_msgSend(v15, sel_commit);
    objc_msgSend(v15, sel_waitUntilCompleted);
  }
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return 1;
}

uint64_t sub_22F1ECB38(unint64_t a1, int a2, uint64_t a3, char a4, void *a5, uint64_t a6, uint64_t a7)
{
  if (a4) {
    return 0;
  }
  sub_22F1EE604(a5, (uint64_t)v27);
  uint64_t result = ADProcessor.transformer.getter();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)(a7 + 16) > a1)
  {
    uint64_t v11 = a7 + 16 * a1;
    CGFloat v12 = *(double *)(v11 + 32);
    CGFloat v13 = *(double *)(v11 + 40);
    float32x4_t v24 = v29;
    float32x4_t v25 = v28;
    float32x4_t v22 = v31;
    float32x4_t v23 = v30;
    float32x4_t v21 = v33;
    float32x4_t v19 = v32;
    float32x4_t v20 = v34;
    Transformer.viewToCamera.getter(&v35.a);
    CGAffineTransform v26 = v35;
    v36.float x = v12;
    v36.float y = v13;
    CGPoint v14 = CGPointApplyAffineTransform(v36, &v26);
    float x = v14.x;
    float y = v14.y;
    float32x4_t v17 = vaddq_f32(v20, vmlaq_n_f32(vmulq_n_f32(v19, x), v21, y));
    *(float32x2_t *)v18.f32 = vmul_n_f32(*(float32x2_t *)v17.f32, *(float *)&a2);
    v18.i64[1] = COERCE_UNSIGNED_INT(vmuls_lane_f32(*(float *)&a2, v17, 2));
    *(float32x2_t *)v25.f32 = DepthTransformer.worldPoint(localPoint:cameraToWorld:)(v18, v25, v24, v23, v22);
    swift_release();
    return v25.i64[0];
  }
  __break(1u);
  return result;
}

uint64_t sub_22F1ECC98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = MEMORY[0x263F8EE78];
  if (!v4) {
    return v5;
  }
  uint64_t v28 = MEMORY[0x263F8EE78];
  sub_22F18FCE8(0, v4, 0);
  CVMetalTextureRef v7 = (CGFloat *)(a1 + 40);
  uint64_t v5 = v28;
  while (1)
  {
    CGFloat v8 = *(v7 - 1);
    CGFloat v9 = *v7;
    uint64_t v10 = ADProcessor.transformer.getter();
    ADTransformer.viewToAD.getter(&v27);
    CGAffineTransform v26 = v27;
    v29.float x = v8;
    v29.float y = v9;
    CGPoint v11 = CGPointApplyAffineTransform(v29, &v26);
    if (v11.x < 0.0 || (double v12 = *(double *)(v10 + 1056), v11.x >= v12) || v11.y < 0.0)
    {
      swift_release();
LABEL_7:
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      char v15 = 1;
      goto LABEL_8;
    }
    double v19 = *(double *)(v10 + 1064);
    uint64_t result = swift_release();
    if (v11.y >= v19) {
      goto LABEL_7;
    }
    double v21 = round(v11.y) * v12;
    if ((~*(void *)&v21 & 0x7FF0000000000000) == 0) {
      break;
    }
    if (v21 <= -9.22337204e18) {
      goto LABEL_23;
    }
    if (v21 >= 9.22337204e18) {
      goto LABEL_24;
    }
    double v22 = round(v11.x);
    if ((~*(void *)&v22 & 0x7FF0000000000000) == 0) {
      goto LABEL_25;
    }
    if (v22 <= -9.22337204e18) {
      goto LABEL_26;
    }
    if (v22 >= 9.22337204e18) {
      goto LABEL_27;
    }
    uint64_t v23 = (uint64_t)v21 + (uint64_t)v22;
    if (__OFADD__((uint64_t)v21, (uint64_t)v22)) {
      goto LABEL_28;
    }
    uint64_t v14 = *(unsigned __int8 *)(a3 + v23);
    uint64_t v13 = *(unsigned int *)(a4 + 4 * v23);
    ADProcessor.adConfig.getter();
    swift_release();
    char v15 = 0;
LABEL_8:
    uint64_t v28 = v5;
    unint64_t v17 = *(void *)(v5 + 16);
    unint64_t v16 = *(void *)(v5 + 24);
    if (v17 >= v16 >> 1)
    {
      sub_22F18FCE8((char *)(v16 > 1), v17 + 1, 1);
      uint64_t v5 = v28;
    }
    *(void *)(v5 + 16) = v17 + 1;
    uint64_t v18 = v5 + 24 * v17;
    *(void *)(v18 + 32) = v13;
    *(void *)(v18 + 40) = v14;
    *(unsigned char *)(v18 + 48) = v15;
    v7 += 2;
    if (!--v4) {
      return v5;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

id sub_22F1ECECC(void *a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = 0;
  *(unsigned char *)(v3 + 32) = 1;
  *(_DWORD *)(v3 + 36) = 0;
  *(unsigned char *)(v3 + 40) = 1;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(int64x2_t *)(v3 + 80) = vdupq_n_s64(1uLL);
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 112) = 0u;
  *(_OWORD *)(v3 + 128) = 0u;
  *(_OWORD *)(v3 + 144) = 0u;
  *(void *)(v3 + 160) = 0;
  *(_OWORD *)(v3 + 176) = 0u;
  *(_OWORD *)(v3 + 192) = 0u;
  *(_OWORD *)(v3 + 208) = 0u;
  *(_OWORD *)(v3 + 224) = 0u;
  *(_WORD *)(v3 + 240) = 1;
  id v7 = objc_msgSend(self, sel_standardUserDefaults);
  CGFloat v8 = (void *)sub_22F223A98();
  unsigned __int8 v9 = objc_msgSend(v7, sel_BOOLForKey_, v8);

  *(unsigned char *)(v3 + 242) = v9;
  *(unsigned char *)(v3 + 243) = 0;
  *(void *)(v3 + 248) = 0;
  *(void *)(v3 + 256) = 0;
  if (qword_268694378 != -1) {
    swift_once();
  }
  uint64_t v10 = (void *)static MetalBundle.device;
  *(_DWORD *)(v3 + 304) = 0;
  *(void *)(v3 + 264) = a1;
  *(void *)(v3 + 272) = a2;
  *(void *)(v3 + 280) = a3;
  *(void *)(v3 + 288) = v10;
  swift_unknownObjectRetain();
  id v11 = a1;
  id result = objc_msgSend(v10, sel_newCommandQueue);
  if (result)
  {
    *(void *)(v3 + 296) = result;
    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22F1ED030(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void))
{
  uint64_t v19 = MEMORY[0x263F8EE78];
  sub_22F18FD08(0, 0, 0);
  uint64_t v3 = v19;
  uint64_t v4 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    uint64_t v5 = 0;
    id v6 = (unsigned __int8 *)(a1 + 48);
    do
    {
      uint64_t v8 = a2(v5, *((void *)v6 - 2), *((void *)v6 - 1), *v6);
      uint64_t v10 = v9;
      char v12 = v11;
      uint64_t v20 = v3;
      unint64_t v14 = *(void *)(v3 + 16);
      unint64_t v13 = *(void *)(v3 + 24);
      if (v14 >= v13 >> 1)
      {
        uint64_t v16 = v7;
        sub_22F18FD08((char *)(v13 > 1), v14 + 1, 1);
        uint64_t v7 = v16;
        uint64_t v3 = v20;
      }
      ++v5;
      v6 += 24;
      *(void *)(v3 + 16) = v14 + 1;
      uint64_t v15 = v3 + 32 * v14;
      *(void *)(v15 + 32) = v8;
      *(void *)(v15 + 40) = v10;
      *(void *)(v15 + 48) = v7;
      *(unsigned char *)(v15 + 56) = v12 & 1;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  return v3;
}

void sub_22F1ED164()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 120);
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = objc_msgSend((id)ADProcessor.outputDepthTexture.getter(), sel_iosurface);
    swift_unknownObjectRelease();
    if (v4)
    {
      uint64_t v5 = (__IOSurface *)v4;
      if (!CVPixelBufferLockBaseAddress(v3, 1uLL))
      {
        uint64_t BaseAddress = CVPixelBufferGetBaseAddress(v3);
        if (BaseAddress)
        {
          uint64_t v7 = BaseAddress;
          uint64_t v8 = IOSurfaceGetBaseAddress(v5);
          int64_t BytesPerRow = IOSurfaceGetBytesPerRow(v5);
          int64_t Height = IOSurfaceGetHeight(v5);
          if ((unsigned __int128)(BytesPerRow * (__int128)Height) >> 64 != (BytesPerRow * Height) >> 63)
          {
            __break(1u);
            goto LABEL_37;
          }
          memcpy(v8, v7, BytesPerRow * Height);
        }
        CVPixelBufferUnlockBaseAddress(v3, 1uLL);
      }

      swift_beginAccess();
      if (*(unsigned char *)(v1 + 242) == 1)
      {
        ADProcessor.capturedPixelBuffer.getter();
        if (v11)
        {
          char v12 = v11;
          sub_22F1EC514();
          uint64_t v13 = ADProcessor.outputDepthTexture.getter();
          uint64_t v14 = ADProcessor.outputConfidenceTexture.getter();
          swift_beginAccess();
          int64_t v15 = sub_22F1A58D0(v13, v14, v12, *(unsigned char *)(v1 + 243));
          swift_release();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();

          if (v15)
          {
            swift_beginAccess();
            *(void *)(v1 + 256) = v15;

            swift_unknownObjectRelease();
            goto LABEL_14;
          }
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *(void **)(v1 + 128);
  if (v16)
  {
    id v17 = v16;
    id v18 = objc_msgSend((id)ADProcessor.outputConfidenceTexture.getter(), sel_iosurface);
    swift_unknownObjectRelease();
    if (!v18)
    {
      id v19 = v17;
      goto LABEL_23;
    }
    id v19 = v18;
    if (CVPixelBufferLockBaseAddress((CVPixelBufferRef)v17, 1uLL))
    {
LABEL_21:

LABEL_23:
      goto LABEL_24;
    }
    uint64_t v20 = CVPixelBufferGetBaseAddress((CVPixelBufferRef)v17);
    if (!v20)
    {
LABEL_20:
      CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)v17, 1uLL);
      goto LABEL_21;
    }
    double v21 = v20;
    double v22 = IOSurfaceGetBaseAddress((IOSurfaceRef)v19);
    int64_t v23 = IOSurfaceGetBytesPerRow((IOSurfaceRef)v19);
    int64_t v24 = IOSurfaceGetHeight((IOSurfaceRef)v19);
    if ((unsigned __int128)(v23 * (__int128)v24) >> 64 == (v23 * v24) >> 63)
    {
      memcpy(v22, v21, v23 * v24);
      goto LABEL_20;
    }
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
LABEL_24:
  id v25 = objc_msgSend(self, sel_standardUserDefaults);
  unsigned int v26 = objc_msgSend(v25, sel_kADShowPerson);

  if (v26)
  {
    CGAffineTransform v27 = *(void **)(v1 + 136);
    if (v27)
    {
      id v28 = v27;
      id v29 = objc_msgSend((id)ADProcessor.outputPersonTexture.getter(), sel_iosurface);
      swift_unknownObjectRelease();
      if (!v29)
      {
        id v30 = v28;
        goto LABEL_34;
      }
      id v30 = v29;
      if (CVPixelBufferLockBaseAddress((CVPixelBufferRef)v28, 1uLL))
      {
LABEL_32:

LABEL_34:
        return;
      }
      float32x4_t v31 = CVPixelBufferGetBaseAddress((CVPixelBufferRef)v28);
      if (!v31)
      {
LABEL_31:
        CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)v28, 1uLL);
        goto LABEL_32;
      }
      float32x4_t v32 = v31;
      float32x4_t v33 = IOSurfaceGetBaseAddress((IOSurfaceRef)v30);
      int64_t v34 = IOSurfaceGetBytesPerRow((IOSurfaceRef)v30);
      int64_t v35 = IOSurfaceGetHeight((IOSurfaceRef)v30);
      if ((unsigned __int128)(v34 * (__int128)v35) >> 64 == (v34 * v35) >> 63)
      {
        memcpy(v33, v32, v34 * v35);
        goto LABEL_31;
      }
LABEL_38:
      __break(1u);
    }
  }
}

uint64_t sub_22F1ED4FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ADProcessor.adConfig.getter();
  *a1 = result;
  return result;
}

uint64_t sub_22F1ED528(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 48) = *a1;
  swift_retain();
  return swift_release();
}

uint64_t sub_22F1ED56C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ADProcessor.transformer.getter();
  *a1 = result;
  return result;
}

uint64_t sub_22F1ED598(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 56) = *a1;
  swift_retain();
  return swift_release();
}

__CVMetalTextureCache *sub_22F1ED5DC@<X0>(__CVMetalTextureCache **a1@<X8>)
{
  uint64_t result = ADProcessor.textureCache.getter();
  *a1 = result;
  return result;
}

void sub_22F1ED608(void **a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  id v4 = *(id *)(*(void *)a2 + 64);
  *(void *)(*(void *)a2 + 64) = *a1;
  id v3 = v2;
}

void sub_22F1ED650(void *a1@<X8>)
{
  ADProcessor.capturedTexture.getter();
  *a1 = v2;
}

uint64_t sub_22F1ED67C(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)a2 + 80);
  *(void *)(*(void *)a2 + 80) = *a1;
  swift_unknownObjectRetain();
  return sub_22F1AE764(v2);
}

void sub_22F1ED6C0(void *a1@<X8>)
{
  ADProcessor.capturedPixelBuffer.getter();
  *a1 = v2;
}

void sub_22F1ED6EC(void **a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  id v3 = *(void **)(*(void *)a2 + 88);
  *(void *)(*(void *)a2 + 88) = *a1;
  id v4 = v2;
  sub_22F1A5E04(v3);
}

uint64_t sub_22F1ED730@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ADProcessor.outputDepthTexture.getter();
  *a1 = result;
  return result;
}

uint64_t sub_22F1ED75C(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 96) = *a1;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t sub_22F1ED7A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ADProcessor.outputConfidenceTexture.getter();
  *a1 = result;
  return result;
}

uint64_t sub_22F1ED7CC(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 104) = *a1;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t sub_22F1ED810@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ADProcessor.outputPersonTexture.getter();
  *a1 = result;
  return result;
}

uint64_t sub_22F1ED83C(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 112) = *a1;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for ADProcessor()
{
  return self;
}

void *static ComputedCameraProperties.shared(for:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  sub_22F1EE604(a1, (uint64_t)v4);
  return memcpy(a2, v4, 0x1E0uLL);
}

double ComputedCameraProperties.viewportSize.getter()
{
  return *(double *)v0;
}

__n128 ComputedCameraProperties.view.getter()
{
  return v0[1];
}

__n128 ComputedCameraProperties.inverseView.getter()
{
  return v0[5];
}

__n128 ComputedCameraProperties.viewProjection.getter()
{
  return v0[9];
}

__n128 ComputedCameraProperties.viewProjectionInv.getter()
{
  return v0[13];
}

double ComputedCameraProperties.viewRect.getter()
{
  return *(double *)(v0 + 272);
}

__n128 ComputedCameraProperties.transform.getter()
{
  return v0[19];
}

float ComputedCameraProperties.xFov.getter()
{
  return *(float *)(v0 + 368);
}

float ComputedCameraProperties.yFov.getter()
{
  return *(float *)(v0 + 372);
}

__n128 ComputedCameraProperties.cameraIntrinsics.getter@<Q0>(uint64_t a1@<X8>)
{
  __n128 result = *(__n128 *)(v1 + 384);
  long long v3 = *(_OWORD *)(v1 + 400);
  long long v4 = *(_OWORD *)(v1 + 416);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  return result;
}

__n128 ComputedCameraProperties.cameraIntrinsicsInversed.getter@<Q0>(uint64_t a1@<X8>)
{
  __n128 result = *(__n128 *)(v1 + 432);
  long long v3 = *(_OWORD *)(v1 + 448);
  long long v4 = *(_OWORD *)(v1 + 464);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  return result;
}

__n128 ComputedCameraProperties.init()@<Q0>(uint64_t a1@<X8>)
{
  __n128 result = *(__n128 *)MEMORY[0x263EF89A8];
  long long v2 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
  long long v3 = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
  long long v4 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
  long long v5 = *MEMORY[0x263EF89A0];
  long long v6 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
  long long v7 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
  *(void *)a1 = 0;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v2;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 80) = result;
  *(_OWORD *)(a1 + 96) = v2;
  *(_OWORD *)(a1 + 112) = v3;
  *(_OWORD *)(a1 + 128) = v4;
  *(__n128 *)(a1 + 144) = result;
  *(_OWORD *)(a1 + 160) = v2;
  *(_OWORD *)(a1 + 176) = v3;
  *(_OWORD *)(a1 + 192) = v4;
  *(__n128 *)(a1 + 208) = result;
  *(_OWORD *)(a1 + 224) = v2;
  *(_OWORD *)(a1 + 240) = v3;
  *(_OWORD *)(a1 + 256) = v4;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(__n128 *)(a1 + 304) = result;
  *(_OWORD *)(a1 + 320) = v2;
  *(_OWORD *)(a1 + 336) = v3;
  *(_OWORD *)(a1 + 352) = v4;
  *(void *)(a1 + 368) = 0;
  *(_OWORD *)(a1 + 384) = v5;
  *(_OWORD *)(a1 + 400) = v6;
  *(_OWORD *)(a1 + 416) = v7;
  *(_OWORD *)(a1 + 432) = v5;
  *(_OWORD *)(a1 + 448) = v6;
  *(_OWORD *)(a1 + 464) = v7;
  return result;
}

void *ComputedCameraProperties.init(camera:viewportSize:orientation:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>, double a4@<D0>)
{
  sub_22F1EE8B0(a1, a2, (uint64_t)v7, a4);

  return memcpy(a3, v7, 0x1E0uLL);
}

void sub_22F1EDA2C()
{
  off_2686958A0 = (_UNKNOWN *)MEMORY[0x263F8EE80];
}

void sub_22F1EDA40()
{
  qword_2686958A8 = 0;
}

uint64_t static ComputedCameraProperties.shared.getter@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_268695898);
  swift_endAccess();
  if (qword_2686944D0 != -1) {
    swift_once();
  }
  if (qword_2686944D8 != -1) {
    swift_once();
  }
  double v2 = *(double *)&qword_2686958A8;
  swift_beginAccess();
  long long v3 = off_2686958A0;
  if (*((void *)off_2686958A0 + 2) && (unint64_t v4 = sub_22F18DF54(v2), (v5 & 1) != 0))
  {
    long long v6 = (const void *)(v3[7] + 496 * v4);
    memcpy(v40, v6, sizeof(v40));
    memmove(&__dst, v6, 0x1F0uLL);
    nullsub_1(&__dst);
    sub_22F1962CC((uint64_t)v40);
  }
  else
  {
    sub_22F1AD27C(&__dst);
  }
  sub_22F1EEEE0((uint64_t)&__dst, (uint64_t)v74);
  swift_endAccess();
  swift_beginAccess();
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_268695898);
  swift_endAccess();
  sub_22F1EEEE0((uint64_t)v74, (uint64_t)&__dst);
  uint64_t result = sub_22F1AD2C4((uint64_t *)&__dst);
  if (result == 1)
  {
    long long v9 = *MEMORY[0x263EF89A8];
    long long v10 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
    long long v11 = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
    long long v12 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
    uint64_t v13 = MEMORY[0x263EF89A0];
    long long v14 = *MEMORY[0x263EF89A0];
    long long v15 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
    long long v16 = *MEMORY[0x263EF89A8];
    long long v17 = v10;
    long long v18 = v11;
    long long v19 = v12;
    long long v20 = *MEMORY[0x263EF89A8];
    long long v21 = v10;
    long long v22 = v11;
    long long v23 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
    long long v24 = v12;
    long long v25 = *MEMORY[0x263EF89A8];
    long long v26 = v10;
    long long v27 = v11;
    long long v28 = 0uLL;
    uint64_t v29 = 0;
    long long v30 = v12;
    long long v31 = *MEMORY[0x263EF89A8];
    long long v32 = v10;
    long long v33 = v11;
    long long v34 = v12;
    long long v35 = *MEMORY[0x263EF89A0];
    long long v36 = v15;
    long long v37 = v23;
    uint64_t v38 = 0;
    long long v39 = 0uLL;
  }
  else
  {
    uint64_t result = sub_22F1AD2DC((uint64_t)v74);
    uint64_t v29 = v42;
    uint64_t v13 = v43;
    long long v9 = v44;
    long long v10 = v45;
    long long v11 = v46;
    long long v12 = v47;
    long long v16 = v48;
    long long v17 = v49;
    long long v18 = v50;
    long long v19 = v51;
    long long v20 = v52;
    long long v21 = v53;
    long long v22 = v54;
    long long v24 = v55;
    long long v25 = v56;
    long long v26 = v57;
    long long v27 = v58;
    long long v30 = v59;
    long long v28 = v60;
    long long v39 = v61;
    long long v31 = v62;
    long long v32 = v63;
    long long v33 = v64;
    long long v34 = v65;
    uint64_t v38 = v66;
    uint64_t v8 = v67;
    long long v14 = v68;
    long long v15 = v69;
    long long v23 = v70;
    long long v35 = v71;
    long long v36 = v72;
    long long v37 = v73;
  }
  *(void *)a1 = v29;
  *(void *)(a1 + 8) = v13;
  *(_OWORD *)(a1 + 16) = v9;
  *(_OWORD *)(a1 + 32) = v10;
  *(_OWORD *)(a1 + 48) = v11;
  *(_OWORD *)(a1 + 64) = v12;
  *(_OWORD *)(a1 + 80) = v16;
  *(_OWORD *)(a1 + 96) = v17;
  *(_OWORD *)(a1 + 112) = v18;
  *(_OWORD *)(a1 + 128) = v19;
  *(_OWORD *)(a1 + 144) = v20;
  *(_OWORD *)(a1 + 160) = v21;
  *(_OWORD *)(a1 + 176) = v22;
  *(_OWORD *)(a1 + 192) = v24;
  *(_OWORD *)(a1 + 208) = v25;
  *(_OWORD *)(a1 + 224) = v26;
  *(_OWORD *)(a1 + 240) = v27;
  *(_OWORD *)(a1 + 256) = v30;
  *(_OWORD *)(a1 + 272) = v28;
  *(_OWORD *)(a1 + 288) = v39;
  *(_OWORD *)(a1 + 304) = v31;
  *(_OWORD *)(a1 + 320) = v32;
  *(_OWORD *)(a1 + 336) = v33;
  *(_OWORD *)(a1 + 352) = v34;
  *(void *)(a1 + 368) = v38;
  *(void *)(a1 + 376) = v8;
  *(_OWORD *)(a1 + 384) = v14;
  *(_OWORD *)(a1 + 400) = v15;
  *(_OWORD *)(a1 + 416) = v23;
  *(_OWORD *)(a1 + 432) = v35;
  *(_OWORD *)(a1 + 448) = v36;
  *(_OWORD *)(a1 + 464) = v37;
  return result;
}

BOOL sub_22F1EDD1C(void *__src, const void *a2)
{
  memcpy(v4, __src, sizeof(v4));
  memcpy(__dst, a2, sizeof(__dst));
  return _s17MeasureFoundation24ComputedCameraPropertiesV23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v4, (uint64_t)__dst);
}

uint64_t sub_22F1EDD74(uint64_t isStackAllocationSafe)
{
  uint64_t v1 = isStackAllocationSafe;
  uint64_t v38 = *MEMORY[0x263EF8340];
  char v2 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v36 = (unint64_t)((1 << v2) + 63) >> 6;
  size_t v3 = 8 * v36;
  if ((v2 & 0x3Fu) > 0xD)
  {
    isStackAllocationSafe = swift_stdlib_isStackAllocationSafe();
    if ((isStackAllocationSafe & 1) == 0)
    {
      long long v37 = (char *)swift_slowAlloc();
      bzero(v37, v3);
      uint64_t v20 = 0;
      int64_t v21 = 0;
      uint64_t v22 = v1 + 64;
      uint64_t v23 = 1 << *(unsigned char *)(v1 + 32);
      if (v23 < 64) {
        uint64_t v24 = ~(-1 << v23);
      }
      else {
        uint64_t v24 = -1;
      }
      unint64_t v25 = v24 & *(void *)(v1 + 64);
      int64_t v26 = (unint64_t)(v23 + 63) >> 6;
      while (1)
      {
        if (v25)
        {
          unint64_t v27 = __clz(__rbit64(v25));
          v25 &= v25 - 1;
          unint64_t v28 = v27 | (v21 << 6);
        }
        else
        {
          int64_t v31 = v21 + 1;
          if (__OFADD__(v21, 1)) {
            goto LABEL_54;
          }
          if (v31 >= v26) {
            goto LABEL_51;
          }
          unint64_t v32 = *(void *)(v22 + 8 * v31);
          ++v21;
          if (!v32)
          {
            int64_t v21 = v31 + 1;
            if (v31 + 1 >= v26) {
              goto LABEL_51;
            }
            unint64_t v32 = *(void *)(v22 + 8 * v21);
            if (!v32)
            {
              int64_t v21 = v31 + 2;
              if (v31 + 2 >= v26) {
                goto LABEL_51;
              }
              unint64_t v32 = *(void *)(v22 + 8 * v21);
              if (!v32)
              {
                int64_t v33 = v31 + 3;
                if (v33 >= v26) {
                  goto LABEL_51;
                }
                unint64_t v32 = *(void *)(v22 + 8 * v33);
                if (!v32)
                {
                  while (1)
                  {
                    int64_t v21 = v33 + 1;
                    if (__OFADD__(v33, 1)) {
                      goto LABEL_56;
                    }
                    if (v21 >= v26) {
                      break;
                    }
                    unint64_t v32 = *(void *)(v22 + 8 * v21);
                    ++v33;
                    if (v32) {
                      goto LABEL_47;
                    }
                  }
LABEL_51:
                  uint64_t v19 = sub_22F1EE170((unint64_t *)v37, v36, v20, v1);
                  MEMORY[0x230FB40E0](v37, -1, -1);
                  return v19;
                }
                int64_t v21 = v33;
              }
            }
          }
LABEL_47:
          unint64_t v25 = (v32 - 1) & v32;
          unint64_t v28 = __clz(__rbit64(v32)) + (v21 << 6);
        }
        uint64_t v29 = *(void *)(*(void *)(v1 + 56) + 496 * v28) + 16;
        swift_beginAccess();
        long long v30 = (void *)MEMORY[0x230FB41A0](v29);
        if (v30)
        {

          *(void *)&v37[(v28 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v28;
          BOOL v18 = __OFADD__(v20++, 1);
          if (v18)
          {
            __break(1u);
            goto LABEL_51;
          }
        }
      }
    }
  }
  uint64_t v35 = (uint64_t)&v35;
  MEMORY[0x270FA5388](isStackAllocationSafe);
  long long v37 = (char *)&v35 - ((v3 + 15) & 0x3FFFFFFFFFFFFFF0);
  bzero(v37, v3);
  uint64_t v4 = 0;
  int64_t v5 = 0;
  uint64_t v6 = v1 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(v1 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(v1 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v12 = v11 | (v5 << 6);
    }
    else
    {
      int64_t v15 = v5 + 1;
      if (__OFADD__(v5, 1))
      {
        __break(1u);
LABEL_54:
        __break(1u);
        goto LABEL_55;
      }
      if (v15 >= v10) {
        return sub_22F1EE170((unint64_t *)v37, v36, v4, v1);
      }
      unint64_t v16 = *(void *)(v6 + 8 * v15);
      ++v5;
      if (!v16)
      {
        int64_t v5 = v15 + 1;
        if (v15 + 1 >= v10) {
          return sub_22F1EE170((unint64_t *)v37, v36, v4, v1);
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16)
        {
          int64_t v5 = v15 + 2;
          if (v15 + 2 >= v10) {
            return sub_22F1EE170((unint64_t *)v37, v36, v4, v1);
          }
          unint64_t v16 = *(void *)(v6 + 8 * v5);
          if (!v16)
          {
            int64_t v17 = v15 + 3;
            if (v17 >= v10) {
              return sub_22F1EE170((unint64_t *)v37, v36, v4, v1);
            }
            unint64_t v16 = *(void *)(v6 + 8 * v17);
            if (!v16)
            {
              while (1)
              {
                int64_t v5 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  break;
                }
                if (v5 >= v10) {
                  return sub_22F1EE170((unint64_t *)v37, v36, v4, v1);
                }
                unint64_t v16 = *(void *)(v6 + 8 * v5);
                ++v17;
                if (v16) {
                  goto LABEL_22;
                }
              }
LABEL_55:
              __break(1u);
LABEL_56:
              __break(1u);
            }
            int64_t v5 = v17;
          }
        }
      }
LABEL_22:
      unint64_t v9 = (v16 - 1) & v16;
      unint64_t v12 = __clz(__rbit64(v16)) + (v5 << 6);
    }
    uint64_t v13 = *(void *)(*(void *)(v1 + 56) + 496 * v12) + 16;
    swift_beginAccess();
    long long v14 = (void *)MEMORY[0x230FB41A0](v13);
    if (v14)
    {

      *(void *)&v37[(v12 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v12;
      BOOL v18 = __OFADD__(v4++, 1);
      if (v18) {
        break;
      }
    }
  }
  __break(1u);
  return sub_22F1EE170((unint64_t *)v37, v36, v4, v1);
}

uint64_t sub_22F1EE170(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return MEMORY[0x263F8EE80];
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268694C80);
  uint64_t result = sub_22F2245F8();
  uint64_t v9 = result;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
    }
    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_40;
      }
      if (v15 >= a2) {
        return v9;
      }
      unint64_t v16 = a1[v15];
      ++v11;
      if (!v16)
      {
        uint64_t v11 = v15 + 1;
        if (v15 + 1 >= a2) {
          return v9;
        }
        unint64_t v16 = a1[v11];
        if (!v16)
        {
          uint64_t v11 = v15 + 2;
          if (v15 + 2 >= a2) {
            return v9;
          }
          unint64_t v16 = a1[v11];
          if (!v16)
          {
            uint64_t v17 = v15 + 3;
            if (v17 >= a2) {
              return v9;
            }
            unint64_t v16 = a1[v17];
            if (!v16)
            {
              while (1)
              {
                uint64_t v11 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_41;
                }
                if (v11 >= a2) {
                  return v9;
                }
                unint64_t v16 = a1[v11];
                ++v17;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v11 = v17;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    uint64_t v18 = *(void *)(*(void *)(v4 + 48) + 8 * v14);
    memcpy(v28, (const void *)(*(void *)(v4 + 56) + 496 * v14), 0x1F0uLL);
    uint64_t result = sub_22F2247D8();
    uint64_t v19 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(void *)(*(void *)(v9 + 48) + 8 * v22) = v18;
    uint64_t result = (uint64_t)memcpy((void *)(*(void *)(v9 + 56) + 496 * v22), v28, 0x1F0uLL);
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    uint64_t result = sub_22F1962CC((uint64_t)v28);
    if (!v5) {
      return v9;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

BOOL _s17MeasureFoundation24ComputedCameraPropertiesV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int32x2_t v2 = vceq_f32(*(float32x2_t *)a1, *(float32x2_t *)a2);
  if ((v2.i32[0] & v2.i32[1] & 1) == 0
    || (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 32), *(float32x4_t *)(a2 + 32)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 16), *(float32x4_t *)(a2 + 16))), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 48), *(float32x4_t *)(a2 + 48)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 64), *(float32x4_t *)(a2 + 64))))) & 0x80000000) == 0|| (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 96), *(float32x4_t *)(a2 + 96)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 80), *(float32x4_t *)(a2 + 80))), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 112), *(float32x4_t *)(a2 + 112)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 128), *(float32x4_t *)(a2 + 128))))) & 0x80000000) == 0|| (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 160), *(float32x4_t *)(a2 + 160)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 144), *(float32x4_t *)(a2 + 144))), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 176), *(float32x4_t *)(a2 + 176)),
                                   (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 192), *(float32x4_t *)(a2 + 192))))) & 0x80000000) == 0
    || (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 224), *(float32x4_t *)(a2 + 224)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 208), *(float32x4_t *)(a2 + 208))), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 240), *(float32x4_t *)(a2 + 240)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 256), *(float32x4_t *)(a2 + 256))))) & 0x80000000) == 0)
  {
    return 0;
  }
  BOOL result = CGRectEqualToRect(*(CGRect *)(a1 + 272), *(CGRect *)(a2 + 272));
  if (result)
  {
    if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 320), *(float32x4_t *)(a2 + 320)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 304), *(float32x4_t *)(a2 + 304))), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 336), *(float32x4_t *)(a2 + 336)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 352), *(float32x4_t *)(a2 + 352))))) & 0x80000000) != 0&& *(float *)(a1 + 368) == *(float *)(a2 + 368)&& *(float *)(a1 + 372) == *(float *)(a2 + 372))
    {
      uint32x4_t v6 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 400), *(float32x4_t *)(a2 + 400)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 384), *(float32x4_t *)(a2 + 384))), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 416), *(float32x4_t *)(a2 + 416)));
      v6.i32[3] = v6.i32[2];
      if ((vminvq_u32(v6) & 0x80000000) != 0)
      {
        uint32x4_t v7 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 448), *(float32x4_t *)(a2 + 448)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 432), *(float32x4_t *)(a2 + 432))), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 464), *(float32x4_t *)(a2 + 464)));
        v7.i32[3] = v7.i32[2];
        return vminvq_u32(v7) >> 31;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_22F1EE604@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  swift_beginAccess();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_268695898);
  swift_endAccess();
  if (qword_2686944D0 != -1) {
    swift_once();
  }
  objc_msgSend(a1, sel_timestamp);
  double v5 = v4;
  swift_beginAccess();
  uint32x4_t v6 = off_2686958A0;
  if (*((void *)off_2686958A0 + 2) && (unint64_t v7 = sub_22F18DF54(v5), (v8 & 1) != 0))
  {
    uint64_t v9 = (const void *)(v6[7] + 496 * v7);
    memcpy(v43, v9, sizeof(v43));
    memmove(&__dst, v9, 0x1F0uLL);
    nullsub_1(&__dst);
    sub_22F1962CC((uint64_t)v43);
  }
  else
  {
    sub_22F1AD27C(&__dst);
  }
  sub_22F1EEEE0((uint64_t)&__dst, (uint64_t)v77);
  swift_endAccess();
  swift_beginAccess();
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_268695898);
  swift_endAccess();
  sub_22F1EEEE0((uint64_t)v77, (uint64_t)&__dst);
  uint64_t result = sub_22F1AD2C4((uint64_t *)&__dst);
  if (result == 1)
  {
    long long v12 = *MEMORY[0x263EF89A8];
    long long v13 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
    long long v14 = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
    long long v15 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
    uint64_t v16 = MEMORY[0x263EF89A0];
    long long v17 = *MEMORY[0x263EF89A0];
    long long v18 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
    long long v19 = *MEMORY[0x263EF89A8];
    long long v20 = v13;
    long long v21 = v14;
    long long v22 = v15;
    long long v23 = *MEMORY[0x263EF89A8];
    long long v24 = v13;
    long long v25 = v14;
    long long v26 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
    long long v27 = v15;
    long long v28 = *MEMORY[0x263EF89A8];
    long long v29 = v13;
    long long v30 = v14;
    long long v31 = 0uLL;
    uint64_t v32 = 0;
    long long v33 = v15;
    long long v34 = *MEMORY[0x263EF89A8];
    long long v35 = v13;
    long long v36 = v14;
    long long v37 = v15;
    long long v38 = *MEMORY[0x263EF89A0];
    long long v39 = v18;
    long long v40 = v26;
    uint64_t v41 = 0;
    long long v42 = 0uLL;
  }
  else
  {
    uint64_t result = sub_22F1AD2DC((uint64_t)v77);
    uint64_t v32 = v45;
    uint64_t v16 = v46;
    long long v12 = v47;
    long long v13 = v48;
    long long v14 = v49;
    long long v15 = v50;
    long long v19 = v51;
    long long v20 = v52;
    long long v21 = v53;
    long long v22 = v54;
    long long v23 = v55;
    long long v24 = v56;
    long long v25 = v57;
    long long v27 = v58;
    long long v28 = v59;
    long long v29 = v60;
    long long v30 = v61;
    long long v33 = v62;
    long long v31 = v63;
    long long v42 = v64;
    long long v34 = v65;
    long long v35 = v66;
    long long v36 = v67;
    long long v37 = v68;
    uint64_t v41 = v69;
    uint64_t v11 = v70;
    long long v17 = v71;
    long long v18 = v72;
    long long v26 = v73;
    long long v38 = v74;
    long long v39 = v75;
    long long v40 = v76;
  }
  *(void *)a2 = v32;
  *(void *)(a2 + 8) = v16;
  *(_OWORD *)(a2 + 16) = v12;
  *(_OWORD *)(a2 + 32) = v13;
  *(_OWORD *)(a2 + 48) = v14;
  *(_OWORD *)(a2 + 64) = v15;
  *(_OWORD *)(a2 + 80) = v19;
  *(_OWORD *)(a2 + 96) = v20;
  *(_OWORD *)(a2 + 112) = v21;
  *(_OWORD *)(a2 + 128) = v22;
  *(_OWORD *)(a2 + 144) = v23;
  *(_OWORD *)(a2 + 160) = v24;
  *(_OWORD *)(a2 + 176) = v25;
  *(_OWORD *)(a2 + 192) = v27;
  *(_OWORD *)(a2 + 208) = v28;
  *(_OWORD *)(a2 + 224) = v29;
  *(_OWORD *)(a2 + 240) = v30;
  *(_OWORD *)(a2 + 256) = v33;
  *(_OWORD *)(a2 + 272) = v31;
  *(_OWORD *)(a2 + 288) = v42;
  *(_OWORD *)(a2 + 304) = v34;
  *(_OWORD *)(a2 + 320) = v35;
  *(_OWORD *)(a2 + 336) = v36;
  *(_OWORD *)(a2 + 352) = v37;
  *(void *)(a2 + 368) = v41;
  *(void *)(a2 + 376) = v11;
  *(_OWORD *)(a2 + 384) = v17;
  *(_OWORD *)(a2 + 400) = v18;
  *(_OWORD *)(a2 + 416) = v26;
  *(_OWORD *)(a2 + 432) = v38;
  *(_OWORD *)(a2 + 448) = v39;
  *(_OWORD *)(a2 + 464) = v40;
  return result;
}

void sub_22F1EE8B0(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  double v7 = *(float *)&a4;
  float v8 = *((float *)&a4 + 1);
  double v9 = *((float *)&a4 + 1);
  objc_msgSend(a1, sel_projectionMatrixForOrientation_viewportSize_zNear_zFar_, a2, *(float *)&a4, *((float *)&a4 + 1), 0.00100000005, 1000.0);
  float32x4_t v28 = v10;
  float32x4_t v41 = v11;
  float32x4_t v30 = v12;
  float32x4_t v33 = v13;
  objc_msgSend(a1, sel_viewMatrixForOrientation_, a2);
  float32x4_t v45 = (float32x4_t)v50.columns[1];
  float32x4_t v46 = (float32x4_t)v50.columns[0];
  float32x4_t v43 = (float32x4_t)v50.columns[3];
  float32x4_t v44 = (float32x4_t)v50.columns[2];
  simd_float4x4 v51 = __invert_f4(v50);
  simd_float4 v39 = v51.columns[1];
  simd_float4 v40 = v51.columns[0];
  simd_float4 v38 = v51.columns[2];
  simd_float4 v37 = v51.columns[3];
  v51.columns[0] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v28, v46.f32[0]), v41, *(float32x2_t *)v46.f32, 1), v30, v46, 2), v33, v46, 3);
  simd_float4 v36 = v51.columns[0];
  v51.columns[1] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v28, v45.f32[0]), v41, *(float32x2_t *)v45.f32, 1), v30, v45, 2), v33, v45, 3);
  simd_float4 v35 = v51.columns[1];
  v51.columns[2] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v28, v44.f32[0]), v41, *(float32x2_t *)v44.f32, 1), v30, v44, 2), v33, v44, 3);
  simd_float4 v32 = v51.columns[2];
  v51.columns[3] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v28, v43.f32[0]), v41, *(float32x2_t *)v43.f32, 1), v30, v43, 2), v33, v43, 3);
  simd_float4 v34 = v51.columns[3];
  simd_float4x4 v52 = __invert_f4(v51);
  simd_float4 v29 = v52.columns[1];
  simd_float4 v31 = v52.columns[0];
  simd_float4 v26 = v52.columns[3];
  simd_float4 v27 = v52.columns[2];
  objc_msgSend(a1, sel_transform);
  long long v24 = v15;
  long long v25 = v14;
  long long v22 = v17;
  long long v23 = v16;
  float v18 = atanf(1.0 / v41.f32[1]);
  float v19 = (float)(v18 + v18) * 57.296;
  objc_msgSend(a1, sel_intrinsics);
  simd_float3 v42 = v48.columns[0];
  simd_float3 v20 = v48.columns[2];
  simd_float3 v21 = v48.columns[1];
  simd_float3x3 v49 = __invert_f3(v48);
  *(double *)a3 = a4;
  *(float32x4_t *)(a3 + 16) = v46;
  *(float32x4_t *)(a3 + 32) = v45;
  *(float32x4_t *)(a3 + 48) = v44;
  *(float32x4_t *)(a3 + 64) = v43;
  *(simd_float4 *)(a3 + 80) = v40;
  *(simd_float4 *)(a3 + 96) = v39;
  *(simd_float4 *)(a3 + 112) = v38;
  *(simd_float4 *)(a3 + 128) = v37;
  *(simd_float4 *)(a3 + 144) = v36;
  *(simd_float4 *)(a3 + 160) = v35;
  *(simd_float4 *)(a3 + 176) = v32;
  *(simd_float4 *)(a3 + 192) = v34;
  *(simd_float4 *)(a3 + 208) = v31;
  *(simd_float4 *)(a3 + 224) = v29;
  *(simd_float4 *)(a3 + 240) = v27;
  *(simd_float4 *)(a3 + 256) = v26;
  *(void *)(a3 + 272) = 0;
  *(void *)(a3 + 280) = 0;
  *(double *)(a3 + 288) = v7;
  *(double *)(a3 + 296) = v9;
  *(_OWORD *)(a3 + 304) = v25;
  *(_OWORD *)(a3 + 320) = v24;
  *(_OWORD *)(a3 + 336) = v23;
  *(_OWORD *)(a3 + 352) = v22;
  *(float *)(a3 + 368) = (float)(v8 / *(float *)&a4) * v19;
  *(float *)(a3 + 372) = v19;
  *(simd_float3 *)(a3 + 384) = v42;
  *(simd_float3 *)(a3 + 400) = v21;
  *(simd_float3 *)(a3 + 416) = v20;
  *(simd_float3x3 *)(a3 + 432) = v49;
}

uint64_t _s17MeasureFoundation24ComputedCameraPropertiesV12updateShared_12viewportSizeySo7ARFrameC_s5SIMD2VySfGtFZ_0(void *a1, double a2)
{
  id v4 = objc_msgSend(a1, sel_camera);
  sub_22F1EE8B0(v4, 1, (uint64_t)&v80, a2);
  uint64_t v5 = v80;
  long long v45 = v82;
  long long v46 = v81;
  long long v43 = v84;
  long long v44 = v83;
  long long v41 = v86;
  long long v42 = v85;
  long long v39 = v88;
  long long v40 = v87;
  long long v37 = v90;
  long long v38 = v89;
  long long v35 = v92;
  long long v36 = v91;
  long long v33 = v94;
  long long v34 = v93;
  long long v31 = v96;
  long long v32 = v95;
  uint64_t v6 = v97;
  uint64_t v7 = v98;
  uint64_t v8 = v99;
  uint64_t v9 = v100;
  long long v29 = v102;
  long long v30 = v101;
  long long v27 = v104;
  long long v28 = v103;
  uint64_t v10 = v105;
  long long v25 = v107;
  long long v26 = v106;
  long long v23 = v109;
  long long v24 = v108;
  long long v21 = v111;
  long long v22 = v110;

  swift_beginAccess();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_268695898);
  swift_endAccess();
  if (qword_2686944D0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v11 = swift_bridgeObjectRetain();
  float32x4_t v12 = (void *)sub_22F1EDD74(v11);
  swift_bridgeObjectRelease();
  off_2686958A0 = v12;
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_timestamp);
  double v14 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2686958B0);
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  id v16 = a1;
  uint64_t v17 = sub_22F2241D8();

  *(void *)(v15 + 24) = v17;
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v79 = off_2686958A0;
  off_2686958A0 = (_UNKNOWN *)0x8000000000000000;
  v47[0] = v15;
  v47[2] = v5;
  long long v48 = v46;
  long long v49 = v45;
  long long v50 = v44;
  long long v51 = v43;
  long long v52 = v42;
  long long v53 = v41;
  long long v54 = v40;
  long long v55 = v39;
  long long v56 = v38;
  long long v57 = v37;
  long long v58 = v36;
  long long v59 = v35;
  long long v60 = v34;
  long long v61 = v33;
  long long v62 = v32;
  long long v63 = v31;
  uint64_t v64 = v6;
  uint64_t v65 = v7;
  uint64_t v66 = v8;
  uint64_t v67 = v9;
  long long v68 = v30;
  long long v69 = v29;
  long long v70 = v28;
  long long v71 = v27;
  uint64_t v72 = v10;
  long long v73 = v26;
  long long v74 = v25;
  long long v75 = v24;
  long long v76 = v23;
  long long v77 = v22;
  long long v78 = v21;
  sub_22F1E7B00((uint64_t)v47, isUniquelyReferenced_nonNull_native, v14);
  off_2686958A0 = v79;
  swift_bridgeObjectRelease();
  swift_endAccess();
  if (qword_2686944D8 != -1) {
    swift_once();
  }
  objc_msgSend(v16, sel_timestamp, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46);
  qword_2686958A8 = v19;
  swift_beginAccess();
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_268695898);
  return swift_endAccess();
}

uint64_t sub_22F1EEEE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686951E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *__swift_memcpy480_16(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x1E0uLL);
}

uint64_t getEnumTagSinglePayload for ComputedCameraProperties(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 480)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ComputedCameraProperties(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 472) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 480) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ComputedCameraProperties()
{
  return &type metadata for ComputedCameraProperties;
}

double SKNode.worldRotation.getter()
{
  objc_msgSend(v0, sel_zRotation);
  double v2 = v1;
  id v3 = objc_msgSend(v0, sel_parent);
  if (v3)
  {
    uint64_t v4 = v3;
    do
    {
      objc_msgSend(v4, sel_zRotation);
      double v2 = v2 + v5;
      id v6 = objc_msgSend(v4, sel_parent);

      uint64_t v4 = v6;
    }
    while (v6);
  }
  return v2;
}

uint64_t Lerpable.lerped<A>(newValue:t:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v23 = a4;
  uint64_t v24 = a6;
  uint64_t v22 = a2;
  uint64_t v12 = sub_22F2241F8();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  id v16 = (char *)&v21 - v15;
  uint64_t v17 = *(void *)(a3 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v19 = (char *)&v21 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, a1, v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v16, 1, a3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(a7, v7, a3);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v16, a3);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 8))(v19, v22, v23, v24, a3, a5);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, a3);
  }
}

uint64_t Optional<A>.lerped<A>(newValue:t:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v22 = a1;
  uint64_t v23 = a4;
  uint64_t v19 = a6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v10 = *(void *)(a3 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v18 - v14;
  swift_getAssociatedConformanceWitness();
  sub_22F224778();
  sub_22F224708();
  sub_22F224568();
  id v16 = *(void (**)(char *, uint64_t))(v10 + 8);
  v16(v13, a3);
  Lerpable.lerped<A>(newValue:t:)(v21, (uint64_t)v15, *(void *)(v20 + 16), a3, v23, a5, v19);
  return ((uint64_t (*)(char *, uint64_t))v16)(v15, a3);
}

uint64_t Optional<A>.lerped<A>(newValue:t:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v8 = v7;
  uint64_t v79 = a5;
  uint64_t v80 = a6;
  uint64_t v90 = a1;
  uint64_t v91 = a2;
  uint64_t v92 = a7;
  uint64_t v77 = *(void *)(a6 + 8);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  v73[1] = (char *)v73 - v12;
  uint64_t v82 = a4;
  uint64_t v84 = *(void *)(a4 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  long long v74 = (char *)v73 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)v73 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  long long v86 = (char *)v73 - v19;
  uint64_t v20 = *(void *)(a3 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  long long v78 = (char *)v73 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  long long v93 = (char *)v73 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  long long v94 = (char *)v73 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  long long v29 = (char *)v73 - v28;
  MEMORY[0x270FA5388](v27);
  long long v31 = (char *)v73 - v30;
  long long v32 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  uint64_t v83 = v8;
  v32(v29, v8, a3);
  uint64_t v33 = *(void *)(a3 + 16);
  uint64_t v34 = *(void *)(v33 - 8);
  long long v85 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 48);
  int v35 = v85(v29, 1, v33);
  uint64_t v89 = v34;
  uint64_t v87 = v20;
  long long v76 = v17;
  if (v35 == 1)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v29, a3);
    long long v81 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56);
    v81(v31, 1, 1, v33);
    uint64_t v36 = (uint64_t)v31;
    uint64_t v37 = v84;
    uint64_t v38 = v82;
  }
  else
  {
    uint64_t v39 = v82;
    Lerpable.lerped<A>(newValue:t:)(v90, v91, v33, v82, v79, v80, (uint64_t)v31);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v29, v33);
    long long v81 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56);
    v81(v31, 0, 1, v33);
    uint64_t v36 = (uint64_t)v31;
    uint64_t v37 = v84;
    uint64_t v38 = v39;
  }
  uint64_t v40 = v83;
  v32(v94, v90, a3);
  uint64_t v41 = (uint64_t)v93;
  v32(v93, v40, a3);
  long long v42 = v86;
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v86, v91, v38);
  uint64_t v91 = v36;
  uint64_t v43 = v36;
  uint64_t v88 = v33;
  uint64_t v44 = v33;
  uint64_t v45 = v38;
  long long v46 = (void (*)(char *, char *, uint64_t))v32;
  long long v47 = v85;
  if (v85((char *)v43, 1, v44) == 1)
  {
    long long v48 = v78;
    v46(v78, v94, a3);
    uint64_t v49 = v88;
    int v50 = v47(v48, 1, v88);
    uint64_t v51 = v92;
    uint64_t v52 = v49;
    uint64_t v53 = v45;
    if (v50 == 1)
    {
      (*(void (**)(char *, uint64_t))(v37 + 8))(v42, v45);
      long long v54 = *(void (**)(uint64_t, uint64_t))(v87 + 8);
      v54((uint64_t)v93, a3);
      v54((uint64_t)v94, a3);
      v54((uint64_t)v48, a3);
      uint64_t v55 = 1;
    }
    else
    {
      swift_getAssociatedConformanceWitness();
      sub_22F224778();
      long long v60 = v74;
      sub_22F224708();
      uint64_t v61 = v80;
      uint64_t v62 = (uint64_t)v76;
      sub_22F224568();
      uint64_t v63 = v53;
      uint64_t v64 = *(void (**)(char *, uint64_t))(v37 + 8);
      v64(v60, v63);
      uint64_t v65 = v88;
      uint64_t v66 = a3;
      uint64_t v67 = v42;
      uint64_t v68 = (uint64_t)v93;
      uint64_t v69 = v61;
      long long v70 = v78;
      Lerpable.lerped<A>(newValue:t:)((uint64_t)v93, v62, v88, v63, v79, v69, v92);
      v64((char *)v62, v63);
      long long v71 = v67;
      a3 = v66;
      uint64_t v52 = v65;
      uint64_t v51 = v92;
      v64(v71, v63);
      uint64_t v72 = v89;
      long long v54 = *(void (**)(uint64_t, uint64_t))(v87 + 8);
      v54(v68, a3);
      v54((uint64_t)v94, a3);
      (*(void (**)(char *, uint64_t))(v72 + 8))(v70, v52);
      uint64_t v55 = 0;
    }
    v81((char *)v51, v55, 1, v52);
    return ((uint64_t (*)(uint64_t, uint64_t))v54)(v91, a3);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v37 + 8))(v42, v38);
    long long v56 = *(void (**)(uint64_t, uint64_t))(v87 + 8);
    v56(v41, a3);
    v56((uint64_t)v94, a3);
    uint64_t v57 = v88;
    uint64_t v58 = v92;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v89 + 32))(v92, v91, v88);
    return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v81)(v58, 0, 1, v57);
  }
}

uint64_t sub_22F1EFC20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  return Optional<A>.lerped<A>(newValue:t:)(a1, a2, a5, a3, *(void *)(a6 - 8), a4, a7);
}

float SmoothedValue.init<A>(value:alpha:)@<S0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, float *a5@<X8>)
{
  uint64_t v10 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (char *)a5 + *(int *)(type metadata accessor for SmoothedValue() + 36);
  uint64_t v14 = *(void *)(a3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v13, a1, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a2, a4);
  sub_22F184EB8();
  sub_22F223948();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a2, a4);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a1, a3);
  float result = v17;
  *a5 = v17;
  return result;
}

uint64_t type metadata accessor for SmoothedValue()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22F1EFDFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (char *)v2 + *(int *)(v8 + 36);
  int v15 = *v2;
  uint64_t v10 = *(void *)(v8 + 24);
  uint64_t v11 = *(void (**)(uint64_t, int *, void, unint64_t, uint64_t, uint64_t))(v10 + 8);
  unint64_t v12 = sub_22F184EB8();
  v11(a1, &v15, MEMORY[0x263F8D5C8], v12, v4, v10);
  return (*(uint64_t (**)(char *, char *, uint64_t))(v5 + 40))(v9, v7, v4);
}

uint64_t OptionalSmoothedValue.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_22F2241F8();
  v11[1] = *(void *)(a1 + 24);
  swift_getWitnessTable();
  uint64_t v6 = type metadata accessor for SmoothedValue();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v11 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)v11 - v7, v2 + *(int *)(a1 + 36), v6);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v5 - 8) + 32))(a2, &v8[*(int *)(v6 + 36)], v5);
}

uint64_t OptionalSmoothedValue.init<A>(value:alpha:timeout:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, char *a7@<X8>)
{
  uint64_t v33 = a4;
  uint64_t v34 = a6;
  uint64_t v35 = a3;
  long long v32 = a7;
  uint64_t v10 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1);
  unint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_22F2241F8();
  uint64_t v28 = *(void *)(v13 - 8);
  uint64_t v14 = v28;
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v27 - v15;
  uint64_t v36 = a5;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v17 = type metadata accessor for SmoothedValue();
  uint64_t v30 = *(void *)(v17 - 8);
  uint64_t v31 = v17;
  MEMORY[0x270FA5388](v17);
  uint64_t v19 = (float *)((char *)&v27 - v18);
  uint64_t v20 = type metadata accessor for OptionalSmoothedValue();
  uint64_t v21 = v32;
  *(void *)&v32[*(int *)(v20 + 40)] = 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, a1, v13);
  uint64_t v22 = v10;
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v24 = v33;
  v23(v12, a2, v33);
  float v25 = SmoothedValue.init<A>(value:alpha:)((uint64_t)v16, (uint64_t)v12, v13, v24, v19);
  (*(void (**)(uint64_t, uint64_t, float))(v22 + 8))(a2, v24, v25);
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(a1, v13);
  uint64_t result = (*(uint64_t (**)(char *, float *, uint64_t))(v30 + 32))(&v21[*(int *)(v20 + 36)], v19, v31);
  *(void *)uint64_t v21 = v35;
  return result;
}

uint64_t type metadata accessor for OptionalSmoothedValue()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22F1F034C(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = a1;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = sub_22F2241F8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  unint64_t v12 = (char *)&v25 - v11;
  uint64_t v13 = *(void *)(v4 - 8);
  uint64_t result = MEMORY[0x270FA5388](v10);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *(int *)(a2 + 40);
  uint64_t v18 = *(void *)((char *)v2 + v17);
  BOOL v19 = __OFADD__(v18, 1);
  uint64_t v20 = v18 + 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(void *)((char *)v2 + v17) = v20;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v12, v26, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, v4) == 1)
    {
      uint64_t v21 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
      uint64_t result = v21(v12, v5);
      if (*(void *)((char *)v2 + *(int *)(a2 + 40)) >= *v2)
      {
        uint64_t v22 = (char *)v2 + *(int *)(a2 + 36);
        uint64_t v28 = *(void *)(a2 + 24);
        swift_getWitnessTable();
        uint64_t v23 = &v22[*(int *)(type metadata accessor for SmoothedValue() + 36)];
        v21(v23, v5);
        return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v23, 1, 1, v4);
      }
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v16, v12, v4);
      *(void *)((char *)v2 + v17) = 0;
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v9, v16, v4);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v4);
      uint64_t v27 = *(void *)(a2 + 24);
      swift_getWitnessTable();
      uint64_t v24 = type metadata accessor for SmoothedValue();
      sub_22F1EFDFC((uint64_t)v9, v24);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, v4);
    }
  }
  return result;
}

Swift::Bool __swiftcall OptionalSmoothedValue.hasTimedOut()()
{
  return *(void *)((char *)v1 + *(int *)(v0 + 40)) >= *v1;
}

uint64_t OptionalSmoothedValue.updated(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a3, v3, a2);
  return sub_22F1F034C(a1, a2);
}

uint64_t static OptionalSmoothedValue.makeNonSmoothedValue(value:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, char *a3@<X8>)
{
  uint64_t v6 = sub_22F2241F8();
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v12 - v7;
  (*(void (**)(char *, uint64_t))(v9 + 16))((char *)&v12 - v7, a1);
  uint64_t v13 = 0x3FF0000000000000;
  unint64_t v10 = sub_22F1F0824();
  return OptionalSmoothedValue.init<A>(value:alpha:timeout:)((uint64_t)v8, (uint64_t)&v13, 0, MEMORY[0x263F8D538], a2, v10, a3);
}

unint64_t sub_22F1F0824()
{
  unint64_t result = qword_2686958B8[0];
  if (!qword_2686958B8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_2686958B8);
  }
  return result;
}

uint64_t sub_22F1F0878()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_22F1F0918(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if ((v5 | 3uLL) > 7
    || (*(_DWORD *)(v4 + 80) & 0x100000) != 0
    || ((v5 + 4) & (unint64_t)~v5) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) > 0x18)
  {
    uint64_t v8 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v8 + ((v5 + 16) & ~(v5 | 3)));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    (*(void (**)(unint64_t, unint64_t))(v4 + 16))(((unint64_t)a1 + v5 + 4) & ~v5, ((unint64_t)a2 + v5 + 4) & ~v5);
  }
  return v3;
}

uint64_t sub_22F1F0A00(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(unint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 8))((a1 + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80));
}

_DWORD *sub_22F1F0A3C(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 16))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_DWORD *sub_22F1F0AAC(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_DWORD *sub_22F1F0B1C(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_DWORD *sub_22F1F0B8C(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

uint64_t sub_22F1F0BFC(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  uint64_t v8 = ((v6 + 4) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  char v9 = 8 * v8;
  if (v8 <= 3)
  {
    unsigned int v11 = ((v7 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v8);
      if (!v10) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v11 > 0xFF)
    {
      int v10 = *(unsigned __int16 *)((char *)a1 + v8);
      if (!*(unsigned __int16 *)((char *)a1 + v8)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v11 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v6 + 4) & ~v6);
      }
      return 0;
    }
  }
  int v10 = *((unsigned __int8 *)a1 + v8);
  if (!*((unsigned char *)a1 + v8)) {
    goto LABEL_19;
  }
LABEL_11:
  int v12 = (v10 - 1) << v9;
  if (v8 > 3) {
    int v12 = 0;
  }
  if (v8)
  {
    if (v8 > 3) {
      LODWORD(v8) = 4;
    }
    switch((int)v8)
    {
      case 2:
        LODWORD(v8) = *a1;
        break;
      case 3:
        LODWORD(v8) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v8) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v8) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v8 | v12) + 1;
}

void sub_22F1F0D78(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  size_t v9 = ((v8 + 4) & ~v8) + *(void *)(v6 + 64);
  BOOL v10 = a3 >= v7;
  unsigned int v11 = a3 - v7;
  if (v11 != 0 && v10)
  {
    if (v9 <= 3)
    {
      unsigned int v15 = ((v11 + ~(-1 << (8 * v9))) >> (8 * v9)) + 1;
      if (HIWORD(v15))
      {
        int v12 = 4;
      }
      else if (v15 >= 0x100)
      {
        int v12 = 2;
      }
      else
      {
        int v12 = v15 > 1;
      }
    }
    else
    {
      int v12 = 1;
    }
  }
  else
  {
    int v12 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v13 = ~v7 + a2;
    if (v9 < 4)
    {
      int v14 = (v13 >> (8 * v9)) + 1;
      if (v9)
      {
        int v16 = v13 & ~(-1 << (8 * v9));
        bzero(a1, v9);
        if (v9 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if (v9 == 2)
        {
          *(_WORD *)a1 = v16;
        }
        else
        {
          *a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, v9);
      *(_DWORD *)a1 = v13;
      int v14 = 1;
    }
    switch(v12)
    {
      case 1:
        a1[v9] = v14;
        return;
      case 2:
        *(_WORD *)&a1[v9] = v14;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v9] = v14;
        return;
      default:
        return;
    }
  }
  switch(v12)
  {
    case 1:
      a1[v9] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v9] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x22F1F0FACLL);
    case 4:
      *(_DWORD *)&a1[v9] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        unint64_t v17 = (unint64_t)&a1[v8 + 4] & ~v8;
        uint64_t v18 = *(void (**)(unint64_t))(v6 + 56);
        v18(v17);
      }
      return;
  }
}

uint64_t sub_22F1F0FD4()
{
  sub_22F2241F8();
  swift_getWitnessTable();
  uint64_t result = type metadata accessor for SmoothedValue();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_22F1F10B8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5;
  int v7 = *(_DWORD *)(v5 + 80);
  uint64_t v8 = v7;
  uint64_t v9 = v7 | 3;
  uint64_t v10 = v7 + 4;
  if (*(_DWORD *)(v5 + 84)) {
    size_t v11 = *(void *)(v5 + 64);
  }
  else {
    size_t v11 = *(void *)(v5 + 64) + 1;
  }
  unint64_t v12 = ((v7 + 4) & ~(unint64_t)v7) + v11 + 7;
  unint64_t v13 = ((v12 + ((v7 + 8) & ~(v7 | 3))) & 0xFFFFFFFFFFFFFFF8) + 8;
  int v14 = v7 & 0x100000;
  if (v8 > 7 || v14 != 0 || v13 > 0x18)
  {
    uint64_t v17 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v17 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v18 = ~v8;
    *a1 = *a2;
    BOOL v19 = (_DWORD *)(((unint64_t)a1 + v9 + 8) & ~v9);
    uint64_t v20 = (_DWORD *)(((unint64_t)a2 + v9 + 8) & ~v9);
    *BOOL v19 = *v20;
    uint64_t v21 = (void *)(((unint64_t)v19 + v10) & v18);
    uint64_t v22 = (const void *)(((unint64_t)v20 + v10) & v18);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v22, 1, v4))
    {
      memcpy(v21, v22, v11);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v21, v22, v4);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(v21, 0, 1, v4);
    }
    *(void *)(((unint64_t)v19 + v12) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v20 + v12) & 0xFFFFFFFFFFFFFFF8);
  }
  return v3;
}

uint64_t sub_22F1F1284(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v2 - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v6 + 80)
      + ((a1 + (*(unsigned __int8 *)(v6 + 80) | 3) + 8) & ~(*(unsigned __int8 *)(v6 + 80) | 3))
      + 4) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v6 + 48))(v3, 1, v2);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(unint64_t, uint64_t))(v6 + 8);
    return v5(v3, v2);
  }
  return result;
}

void *sub_22F1F136C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5;
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = (v7 | 3) + 8;
  uint64_t v9 = (_DWORD *)(((unint64_t)a1 + v8) & ~(v7 | 3));
  uint64_t v10 = (_DWORD *)(((unint64_t)a2 + v8) & ~(v7 | 3));
  *uint64_t v9 = *v10;
  uint64_t v11 = v7 + 4;
  uint64_t v12 = ~v7;
  unint64_t v13 = (void *)(((unint64_t)v9 + v7 + 4) & ~v7);
  int v14 = (const void *)(((unint64_t)v10 + v7 + 4) & ~v7);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v14, 1, v4))
  {
    int v15 = *(_DWORD *)(v6 + 84);
    size_t v16 = *(void *)(v6 + 64);
    if (v15) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v16 + 1;
    }
    memcpy(v13, v14, v17);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(v13, v14, v4);
    BOOL v19 = *(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56);
    uint64_t v18 = v6 + 56;
    v19(v13, 0, 1, v4);
    int v15 = *(_DWORD *)(v18 + 28);
    size_t v16 = *(void *)(v18 + 8);
  }
  size_t v20 = v16 + (v11 & v12);
  if (!v15) {
    ++v20;
  }
  *(void *)(((unint64_t)v9 + v20 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v10 + v20 + 7) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_22F1F14F4(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v3 = *(void *)(a3 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = (v5 | 3) + 8;
  uint64_t v7 = (_DWORD *)(((unint64_t)a1 + v6) & ~(v5 | 3));
  uint64_t v8 = (_DWORD *)(((unint64_t)a2 + v6) & ~(v5 | 3));
  *uint64_t v7 = *v8;
  uint64_t v9 = v5 + 4;
  uint64_t v20 = ~v5;
  uint64_t v10 = (void *)(((unint64_t)v7 + v5 + 4) & ~v5);
  uint64_t v11 = (void *)(((unint64_t)v8 + v5 + 4) & ~v5);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v4 + 48);
  int v13 = v12(v10, 1, v3);
  int v14 = v12(v11, 1, v3);
  if (v13)
  {
    if (v14)
    {
      int v15 = *(_DWORD *)(v4 + 84);
      size_t v16 = *(void *)(v4 + 64);
LABEL_6:
      if (v15) {
        size_t v17 = v16;
      }
      else {
        size_t v17 = v16 + 1;
      }
      memcpy(v10, v11, v17);
      goto LABEL_12;
    }
    (*(void (**)(void *, void *, uint64_t))(v4 + 16))(v10, v11, v3);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v4 + 56))(v10, 0, 1, v3);
  }
  else
  {
    if (v14)
    {
      (*(void (**)(void *, uint64_t))(v4 + 8))(v10, v3);
      int v15 = *(_DWORD *)(v4 + 84);
      size_t v16 = *(void *)(v4 + 64);
      goto LABEL_6;
    }
    (*(void (**)(void *, void *, uint64_t))(v4 + 24))(v10, v11, v3);
  }
LABEL_12:
  uint64_t result = a1;
  uint64_t v19 = *(void *)(v4 + 64) + (v9 & v20);
  if (!*(_DWORD *)(v4 + 84)) {
    ++v19;
  }
  *(void *)(((unint64_t)v7 + v19 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v8 + v19 + 7) & 0xFFFFFFFFFFFFFFF8);
  return result;
}

void *sub_22F1F16F8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5;
  uint64_t v7 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = (v7 | 3) + 8;
  uint64_t v9 = (_DWORD *)(((unint64_t)a1 + v8) & ~(v7 | 3));
  uint64_t v10 = (_DWORD *)(((unint64_t)a2 + v8) & ~(v7 | 3));
  *uint64_t v9 = *v10;
  uint64_t v11 = v7 + 4;
  uint64_t v12 = ~v7;
  int v13 = (void *)(((unint64_t)v9 + v7 + 4) & ~v7);
  int v14 = (const void *)(((unint64_t)v10 + v7 + 4) & ~v7);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v14, 1, v4))
  {
    int v15 = *(_DWORD *)(v6 + 84);
    size_t v16 = *(void *)(v6 + 64);
    if (v15) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v16 + 1;
    }
    memcpy(v13, v14, v17);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(v13, v14, v4);
    uint64_t v19 = *(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56);
    uint64_t v18 = v6 + 56;
    v19(v13, 0, 1, v4);
    int v15 = *(_DWORD *)(v18 + 28);
    size_t v16 = *(void *)(v18 + 8);
  }
  size_t v20 = v16 + (v11 & v12);
  if (!v15) {
    ++v20;
  }
  *(void *)(((unint64_t)v9 + v20 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v10 + v20 + 7) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

void *sub_22F1F1880(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v3 = *(void *)(a3 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = v4;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = (v6 | 3) + 8;
  uint64_t v8 = (_DWORD *)(((unint64_t)a1 + v7) & ~(v6 | 3));
  uint64_t v9 = (_DWORD *)(((unint64_t)a2 + v7) & ~(v6 | 3));
  _DWORD *v8 = *v9;
  uint64_t v10 = v6 + 4;
  uint64_t v21 = ~v6;
  uint64_t v11 = (void *)(((unint64_t)v8 + v6 + 4) & ~v6);
  uint64_t v12 = (void *)(((unint64_t)v9 + v6 + 4) & ~v6);
  int v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v4 + 48);
  int v14 = v13(v11, 1, v3);
  int v15 = v13(v12, 1, v3);
  if (v14)
  {
    if (v15)
    {
      int v16 = *(_DWORD *)(v5 + 84);
      size_t v17 = *(void *)(v5 + 64);
LABEL_6:
      if (v16) {
        size_t v18 = v17;
      }
      else {
        size_t v18 = v17 + 1;
      }
      memcpy(v11, v12, v18);
      goto LABEL_12;
    }
    (*(void (**)(void *, void *, uint64_t))(v5 + 32))(v11, v12, v3);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(v11, 0, 1, v3);
  }
  else
  {
    if (v15)
    {
      (*(void (**)(void *, uint64_t))(v5 + 8))(v11, v3);
      int v16 = *(_DWORD *)(v5 + 84);
      size_t v17 = *(void *)(v5 + 64);
      goto LABEL_6;
    }
    (*(void (**)(void *, void *, uint64_t))(v5 + 40))(v11, v12, v3);
  }
LABEL_12:
  uint64_t result = a1;
  uint64_t v20 = *(void *)(v5 + 64) + (v10 & v21);
  if (!*(_DWORD *)(v5 + 84)) {
    ++v20;
  }
  *(void *)(((unint64_t)v8 + v20 + 7) & 0xFFFFFFFFFFFFFFF8) = *(void *)(((unint64_t)v9 + v20 + 7) & 0xFFFFFFFFFFFFFFF8);
  return result;
}

uint64_t sub_22F1F1A84(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = v5 - 1;
  if (!v5) {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *(unsigned __int8 *)(v4 + 80);
  if (v5) {
    uint64_t v8 = 7;
  }
  else {
    uint64_t v8 = 8;
  }
  if (!a2) {
    return 0;
  }
  uint64_t v9 = v7 | 3;
  uint64_t v10 = v7 + 4;
  if (v6 < a2)
  {
    unint64_t v11 = ((v8 + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64) + (v10 & ~v7) + ((v7 + 8) & ~v9)) & 0xFFFFFFFFFFFFFFF8)
        + 8;
    unsigned int v12 = a2 - v6;
    uint64_t v13 = v11 & 0xFFFFFFF8;
    if ((v11 & 0xFFFFFFF8) != 0) {
      unsigned int v14 = 2;
    }
    else {
      unsigned int v14 = v12 + 1;
    }
    if (v14 >= 0x10000) {
      LODWORD(v15) = 4;
    }
    else {
      LODWORD(v15) = 2;
    }
    if (v14 < 0x100) {
      LODWORD(v15) = 1;
    }
    if (v14 >= 2) {
      uint64_t v15 = v15;
    }
    else {
      uint64_t v15 = 0;
    }
    switch(v15)
    {
      case 1:
        int v16 = *((unsigned __int8 *)a1 + v11);
        if (!v16) {
          break;
        }
        goto LABEL_23;
      case 2:
        int v16 = *(unsigned __int16 *)((char *)a1 + v11);
        if (v16) {
          goto LABEL_23;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x22F1F1C14);
      case 4:
        int v16 = *(_DWORD *)((char *)a1 + v11);
        if (!v16) {
          break;
        }
LABEL_23:
        int v17 = v16 - 1;
        if (v13)
        {
          int v17 = 0;
          LODWORD(v13) = *a1;
        }
        return v6 + (v13 | v17) + 1;
      default:
        break;
    }
  }
  if (v5 < 2) {
    return 0;
  }
  unsigned int v19 = (*(uint64_t (**)(unint64_t))(v4 + 48))((v10 + (((unint64_t)a1 + v9 + 8) & ~v9)) & ~v7);
  if (v19 >= 2) {
    return v19 - 1;
  }
  else {
    return 0;
  }
}

void sub_22F1F1C28(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  if (v8) {
    unsigned int v9 = v8 - 1;
  }
  else {
    unsigned int v9 = 0;
  }
  uint64_t v10 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = 7;
  if (!v8) {
    uint64_t v11 = 8;
  }
  size_t v12 = ((v11
        + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64)
        + ((v10 + 4) & ~v10)
        + ((v10 + 8) & ~(v10 | 3))) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v9 < a3)
  {
    unsigned int v13 = a3 - v9;
    if (((v11
         + *(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64)
         + ((v10 + 4) & ~v10)
         + ((v10 + 8) & ~(v10 | 3))) & 0xFFFFFFF8) == 0xFFFFFFF8)
      unsigned int v14 = v13 + 1;
    else {
      unsigned int v14 = 2;
    }
    if (v14 >= 0x10000) {
      int v15 = 4;
    }
    else {
      int v15 = 2;
    }
    if (v14 < 0x100) {
      int v15 = 1;
    }
    if (v14 >= 2) {
      int v6 = v15;
    }
    else {
      int v6 = 0;
    }
  }
  if (a2 > v9)
  {
    if (((v11
         + *(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64)
         + ((v10 + 4) & ~v10)
         + ((v10 + 8) & ~(v10 | 3))) & 0xFFFFFFF8) == 0xFFFFFFF8)
      int v16 = a2 - v9;
    else {
      int v16 = 1;
    }
    if (((v11
         + *(_DWORD *)(*(void *)(*(void *)(a4 + 16) - 8) + 64)
         + ((v10 + 4) & ~v10)
         + ((v10 + 8) & ~(v10 | 3))) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      int v17 = ~v9 + a2;
      bzero(a1, v12);
      *(_DWORD *)a1 = v17;
    }
    switch(v6)
    {
      case 1:
        a1[v12] = v16;
        return;
      case 2:
        *(_WORD *)&a1[v12] = v16;
        return;
      case 3:
        goto LABEL_39;
      case 4:
        *(_DWORD *)&a1[v12] = v16;
        return;
      default:
        return;
    }
  }
  switch(v6)
  {
    case 1:
      a1[v12] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v12] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
LABEL_39:
      __break(1u);
      JUMPOUT(0x22F1F1E24);
    case 4:
      *(_DWORD *)&a1[v12] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (a2)
      {
LABEL_33:
        if (v8 >= 2)
        {
          unint64_t v18 = (v10 + 4 + ((unint64_t)&a1[(v10 | 3) + 8] & ~(v10 | 3))) & ~v10;
          uint64_t v19 = a2 + 1;
          uint64_t v20 = *(void (**)(unint64_t, uint64_t))(v7 + 56);
          v20(v18, v19);
        }
      }
      return;
  }
}

uint64_t zip<A, B, C>(_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v56 = a3;
  uint64_t v57 = a9;
  uint64_t v52 = a1;
  uint64_t v47 = a6;
  uint64_t v14 = *(void *)(a6 - 8);
  uint64_t v54 = a2;
  uint64_t v55 = v14;
  uint64_t v60 = a10;
  MEMORY[0x270FA5388](a1);
  uint64_t v53 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v16 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v51 = (char *)&v40 - v17;
  uint64_t v50 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v49 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = a8;
  uint64_t v42 = a5;
  uint64_t v58 = swift_getAssociatedTypeWitness();
  uint64_t v19 = MEMORY[0x270FA5388](v58);
  long long v48 = (char *)&v40 - v20;
  uint64_t v21 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v40 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = a7;
  uint64_t v41 = a4;
  uint64_t v24 = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](v24);
  uint64_t v26 = (char *)&v40 - v25;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v46 = AssociatedConformanceWitness;
  uint64_t v28 = v58;
  uint64_t v29 = swift_getAssociatedConformanceWitness();
  uint64_t v45 = v29;
  uint64_t v30 = AssociatedTypeWitness;
  uint64_t v31 = v47;
  uint64_t v32 = swift_getAssociatedConformanceWitness();
  uint64_t v61 = v24;
  uint64_t v62 = v28;
  uint64_t v63 = v30;
  uint64_t v64 = AssociatedConformanceWitness;
  uint64_t v65 = v29;
  uint64_t v66 = v32;
  uint64_t v33 = type metadata accessor for Zip3Generator();
  MEMORY[0x270FA5388](v33);
  uint64_t v35 = (char *)&v40 - v34;
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v23, v52, v41);
  sub_22F223BE8();
  (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v49, v54, v42);
  uint64_t v36 = (uint64_t)v48;
  sub_22F223BE8();
  (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v53, v56, v31);
  uint64_t v37 = (uint64_t)v51;
  sub_22F223BE8();
  Zip3Generator.init(_:_:_:)((uint64_t)v26, v36, v37, v24, v58, AssociatedTypeWitness, (uint64_t)v35);
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x230FB2F80](v35, v33, WitnessTable);
}

uint64_t type metadata accessor for Zip3Generator()
{
  return swift_getGenericMetadata();
}

uint64_t Zip3Generator.init(_:_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14 = (int *)type metadata accessor for Zip3Generator();
  *(void *)(a7 + v14[19]) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(a7, a1, a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a5 - 8) + 32))(a7 + v14[17], a2, a5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a6 - 8) + 32))(a7 + v14[18], a3, a6);
}

uint64_t Zip3Generator.next()@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v58 = a2;
  uint64_t v3 = a1[7];
  uint64_t v48 = a1[4];
  uint64_t v49 = v3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = sub_22F2241F8();
  uint64_t v43 = *(void *)(v5 - 8);
  uint64_t v44 = v5;
  uint64_t v6 = MEMORY[0x270FA5388](v5);
  uint64_t v51 = (char *)&v42 - v7;
  uint64_t v59 = AssociatedTypeWitness;
  uint64_t v54 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v50 = (char *)&v42 - v8;
  unsigned int v9 = (char *)a1[6];
  uint64_t v52 = a1[3];
  uint64_t v53 = v9;
  uint64_t v10 = swift_getAssociatedTypeWitness();
  uint64_t v11 = sub_22F2241F8();
  uint64_t v45 = *(void *)(v11 - 8);
  uint64_t v46 = v11;
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v56 = v10;
  uint64_t v57 = (char *)&v42 - v13;
  uint64_t v55 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v47 = (char *)&v42 - v14;
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t v16 = sub_22F2241F8();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v42 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v42 - v21;
  uint64_t v24 = v23;
  sub_22F224208();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v20, 1, v15) == 1)
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
  }
  else
  {
    uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
    v42(v22, v20, v15);
    uint64_t v25 = v15;
    uint64_t v26 = v57;
    sub_22F224208();
    uint64_t v27 = v56;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v55 + 48))(v26, 1, v56) == 1)
    {
      (*(void (**)(char *, uint64_t))(v24 + 8))(v22, v25);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v57, v46);
    }
    else
    {
      uint64_t v52 = v25;
      uint64_t v53 = v22;
      uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v55 + 32);
      uint64_t v29 = v47;
      v28(v47, v57, v27);
      uint64_t v30 = v51;
      sub_22F224208();
      uint64_t v31 = v54;
      uint64_t v32 = v59;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v54 + 48))(v30, 1, v59) != 1)
      {
        uint64_t v35 = v30;
        uint64_t v36 = v27;
        uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v31 + 32);
        uint64_t v54 = v31 + 32;
        v37(v50, v35, v32);
        uint64_t v38 = v52;
        TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
        uint64_t v40 = v58;
        uint64_t v41 = &v58[*(int *)(TupleTypeMetadata3 + 48)];
        uint64_t v57 = &v58[*(int *)(TupleTypeMetadata3 + 64)];
        v42(v58, v53, v38);
        v28(v41, v29, v36);
        v37(v57, v50, v59);
        return (*(uint64_t (**)(char *, void, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata3 - 8) + 56))(v40, 0, 1, TupleTypeMetadata3);
      }
      (*(void (**)(char *, uint64_t))(v55 + 8))(v29, v27);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v53, v52);
      (*(void (**)(char *, uint64_t))(v43 + 8))(v30, v44);
    }
  }
  uint64_t v33 = swift_getTupleTypeMetadata3();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v58, 1, 1, v33);
}

uint64_t sub_22F1F2ABC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 64);
}

uint64_t sub_22F1F2AC4()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      uint64_t result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t *sub_22F1F2BE0(uint64_t *a1, uint64_t *a2, void *a3)
{
  unint64_t v3 = a1;
  uint64_t v4 = *(void *)(a3[2] - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = *(void *)(a3[3] - 8);
  uint64_t v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = v5 + v7;
  uint64_t v9 = (v5 + v7) & ~v7;
  uint64_t v10 = *(void *)(v6 + 64);
  uint64_t v11 = a3[4] - 8;
  uint64_t v12 = *(void *)v11;
  uint64_t v13 = *(_DWORD *)(*(void *)v11 + 80);
  uint64_t v14 = v10 + v13;
  uint64_t v15 = *(void *)(*(void *)v11 + 64) + 7;
  unint64_t v16 = ((v15 + ((v10 + v13 + v9) & ~v13)) & 0xFFFFFFFFFFFFFFF8) + 8;
  unsigned int v17 = v13 | *(_DWORD *)(v4 + 80) & 0xF8 | v7;
  if (v17 > 7 || ((*(_DWORD *)(v12 + 80) | *(_DWORD *)(v6 + 80) | *(_DWORD *)(v4 + 80)) & 0x100000) != 0 || v16 > 0x18)
  {
    uint64_t v20 = *a2;
    *unint64_t v3 = *a2;
    unint64_t v3 = (uint64_t *)(v20 + (((v17 | 7) + 16) & ~(unint64_t)(v17 | 7)));
    swift_retain();
  }
  else
  {
    uint64_t v21 = ~v7;
    uint64_t v22 = ~v13;
    uint64_t v28 = a3[3];
    uint64_t v29 = a3[4];
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
    unint64_t v24 = ((unint64_t)v3 + v8) & v21;
    unint64_t v25 = ((unint64_t)a2 + v8) & v21;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16))(v24, v25, v28);
    unint64_t v26 = (v25 + v14) & v22;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v12 + 16))((v24 + v14) & v22, v26, v29);
    *(void *)((v15 + ((v24 + v14) & v22)) & 0xFFFFFFFFFFFFFFF8) = *(void *)((v15 + v26) & 0xFFFFFFFFFFFFFFF8);
  }
  return v3;
}

uint64_t sub_22F1F2E18(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a2[2] - 8) + 8;
  (*(void (**)(void))v4)();
  uint64_t v5 = *(void *)(v4 + 56) + a1;
  uint64_t v6 = *(void *)(a2[3] - 8);
  uint64_t v7 = v6 + 8;
  unint64_t v8 = (v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t))(v6 + 8))(v8);
  uint64_t v9 = *(void *)(a2[4] - 8);
  uint64_t v10 = *(uint64_t (**)(unint64_t))(v9 + 8);
  unint64_t v11 = (v8 + *(void *)(v7 + 56) + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  return v10(v11);
}

uint64_t sub_22F1F2F00(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 16;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 16;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 48) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 48);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 16;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v18, v19);
  *(void *)((*(void *)(v15 + 48) + 7 + v18) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v15 + 48)
                                                                                       + 7
                                                                                       + v19) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_22F1F3028(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 24;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 24;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 40) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 40);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 24;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 24))(v18, v19);
  *(void *)((*(void *)(v15 + 40) + 7 + v18) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v15 + 40)
                                                                                       + 7
                                                                                       + v19) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_22F1F3150(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 32;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 32;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 32) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 32);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 32;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 32))(v18, v19);
  *(void *)((*(void *)(v15 + 32) + 7 + v18) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v15 + 32)
                                                                                       + 7
                                                                                       + v19) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_22F1F3278(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void *)(a3[2] - 8) + 40;
  (*(void (**)(void))v6)();
  uint64_t v7 = *(void *)(a3[3] - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = *(void *)(v6 + 24) + v9;
  uint64_t v11 = (v10 + a1) & ~v9;
  uint64_t v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v11, v12);
  uint64_t v13 = *(void *)(v8 + 24);
  uint64_t v14 = *(void *)(a3[4] - 8);
  uint64_t v15 = v14 + 40;
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = v13 + v16;
  uint64_t v18 = (v17 + v11) & ~v16;
  uint64_t v19 = (v17 + v12) & ~v16;
  (*(void (**)(uint64_t, uint64_t))(v14 + 40))(v18, v19);
  *(void *)((*(void *)(v15 + 24) + 7 + v18) & 0xFFFFFFFFFFFFFFF8) = *(void *)((*(void *)(v15 + 24)
                                                                                       + 7
                                                                                       + v19) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_22F1F33A0(_DWORD *a1, unsigned int a2, void *a3)
{
  uint64_t v5 = *(void *)(a3[2] - 8);
  unsigned int v6 = *(_DWORD *)(v5 + 84);
  uint64_t v7 = *(void *)(a3[3] - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  if (v8 <= v6) {
    unsigned int v9 = *(_DWORD *)(v5 + 84);
  }
  else {
    unsigned int v9 = *(_DWORD *)(v7 + 84);
  }
  uint64_t v10 = a3[4];
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v13 = *(void *)(*(void *)(a3[3] - 8) + 64);
  uint64_t v14 = *(unsigned __int8 *)(v11 + 80);
  if (*(_DWORD *)(v11 + 84) <= v9) {
    unsigned int v15 = v9;
  }
  else {
    unsigned int v15 = *(_DWORD *)(v11 + 84);
  }
  if (!a2) {
    return 0;
  }
  uint64_t v16 = *(void *)(*(void *)(a3[2] - 8) + 64) + v12;
  if (v15 < a2)
  {
    unint64_t v17 = ((*(void *)(*(void *)(v10 - 8) + 64) + ((v13 + v14 + (v16 & ~v12)) & ~v14) + 7) & 0xFFFFFFFFFFFFFFF8)
        + 8;
    if ((v17 & 0xFFFFFFF8) != 0) {
      unsigned int v18 = 2;
    }
    else {
      unsigned int v18 = a2 - v15 + 1;
    }
    if (v18 >= 0x10000) {
      unsigned int v19 = 4;
    }
    else {
      unsigned int v19 = 2;
    }
    if (v18 < 0x100) {
      unsigned int v19 = 1;
    }
    if (v18 >= 2) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 0;
    }
    switch(v20)
    {
      case 1:
        int v21 = *((unsigned __int8 *)a1 + v17);
        if (!*((unsigned char *)a1 + v17)) {
          break;
        }
        goto LABEL_24;
      case 2:
        int v21 = *(unsigned __int16 *)((char *)a1 + v17);
        if (*(_WORD *)((char *)a1 + v17)) {
          goto LABEL_24;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x22F1F362CLL);
      case 4:
        int v21 = *(_DWORD *)((char *)a1 + v17);
        if (!v21) {
          break;
        }
LABEL_24:
        unsigned int v22 = v21 - 1;
        if ((v17 & 0xFFFFFFF8) != 0)
        {
          unsigned int v22 = 0;
          int v23 = *a1;
        }
        else
        {
          int v23 = 0;
        }
        return v15 + (v23 | v22) + 1;
      default:
        break;
    }
  }
  if (!v15) {
    return 0;
  }
  if (v6 == v15)
  {
    unint64_t v24 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v5 + 48);
    uint64_t v25 = *(unsigned int *)(v5 + 84);
    uint64_t v26 = a3[2];
    return v24(a1, v25, v26);
  }
  unint64_t v28 = ((unint64_t)a1 + v16) & ~v12;
  if (v8 != v15)
  {
    a1 = (_DWORD *)((v28 + v13 + v14) & ~v14);
    unint64_t v24 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(v11 + 48);
    uint64_t v25 = *(unsigned int *)(v11 + 84);
    uint64_t v26 = a3[4];
    return v24(a1, v25, v26);
  }
  uint64_t v29 = *(uint64_t (**)(unint64_t))(v7 + 48);
  return v29(v28);
}

void sub_22F1F3640(char *a1, unsigned int a2, unsigned int a3, void *a4)
{
  uint64_t v6 = *(void *)(a4[2] - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = a4[3];
  uint64_t v9 = a4[4];
  uint64_t v10 = *(void *)(v8 - 8);
  unsigned int v11 = *(_DWORD *)(v10 + 84);
  if (v11 <= v7) {
    unsigned int v12 = *(_DWORD *)(v6 + 84);
  }
  else {
    unsigned int v12 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v13 = *(void *)(v9 - 8);
  uint64_t v14 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = *(void *)(*(void *)(v8 - 8) + 64);
  uint64_t v16 = *(unsigned __int8 *)(v13 + 80);
  if (*(_DWORD *)(v13 + 84) <= v12) {
    unsigned int v17 = v12;
  }
  else {
    unsigned int v17 = *(_DWORD *)(v13 + 84);
  }
  uint64_t v18 = *(void *)(*(void *)(a4[2] - 8) + 64) + v14;
  size_t v19 = ((*(void *)(*(void *)(v9 - 8) + 64) + ((v15 + v16 + (v18 & ~v14)) & ~v16) + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v17 >= a3)
  {
    int v23 = 0;
    int v24 = a2 - v17;
    if (a2 <= v17) {
      goto LABEL_20;
    }
LABEL_24:
    if (((*(_DWORD *)(*(void *)(v9 - 8) + 64)
         + ((v15 + v16 + (v18 & ~v14)) & ~v16)
         + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      int v26 = v24;
    else {
      int v26 = 1;
    }
    if (((*(_DWORD *)(*(void *)(v9 - 8) + 64)
         + ((v15 + v16 + (v18 & ~v14)) & ~v16)
         + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      unsigned int v27 = ~v17 + a2;
      bzero(a1, v19);
      *(_DWORD *)a1 = v27;
    }
    switch(v23)
    {
      case 1:
        a1[v19] = v26;
        break;
      case 2:
        *(_WORD *)&a1[v19] = v26;
        break;
      case 3:
LABEL_48:
        __break(1u);
        JUMPOUT(0x22F1F3950);
      case 4:
        *(_DWORD *)&a1[v19] = v26;
        break;
      default:
        return;
    }
    return;
  }
  unsigned int v20 = a3 - v17;
  if (((*(_DWORD *)(*(void *)(v9 - 8) + 64)
       + ((v15 + v16 + (v18 & ~v14)) & ~v16)
       + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
    unsigned int v21 = v20 + 1;
  else {
    unsigned int v21 = 2;
  }
  if (v21 >= 0x10000) {
    int v22 = 4;
  }
  else {
    int v22 = 2;
  }
  if (v21 < 0x100) {
    int v22 = 1;
  }
  if (v21 >= 2) {
    int v23 = v22;
  }
  else {
    int v23 = 0;
  }
  int v24 = a2 - v17;
  if (a2 > v17) {
    goto LABEL_24;
  }
LABEL_20:
  uint64_t v25 = ~v14;
  switch(v23)
  {
    case 1:
      a1[v19] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 2:
      *(_WORD *)&a1[v19] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_33;
    case 3:
      goto LABEL_48;
    case 4:
      *(_DWORD *)&a1[v19] = 0;
      goto LABEL_32;
    default:
LABEL_32:
      if (!a2) {
        return;
      }
LABEL_33:
      if (v7 == v17)
      {
        unint64_t v28 = *(void (**)(char *))(v6 + 56);
        uint64_t v29 = a1;
LABEL_36:
        v28(v29);
        return;
      }
      unint64_t v30 = (unint64_t)&a1[v18] & v25;
      if (v11 != v17)
      {
        uint64_t v29 = (char *)((v30 + v15 + v16) & ~v16);
        unint64_t v28 = *(void (**)(char *))(v13 + 56);
        goto LABEL_36;
      }
      uint64_t v31 = *(void (**)(unint64_t))(v10 + 56);
      v31(v30);
      break;
  }
}

BOOL sub_22F1F3978(void *a1, void *a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, double a7, float64_t a8, double a9, double a10)
{
  sub_22F1A931C(a6, (uint64_t)v61);
  double v19 = *(double *)v61;
  double v20 = *(double *)&v61[1];
  float64x2_t v51 = v62;
  float64x2_t v52 = v63;
  id v21 = objc_msgSend(a1, sel_computeCommandEncoder);
  if (v21)
  {
    uint64_t v22 = (uint64_t)objc_msgSend(a2, sel_width) / 32;
    uint64_t v23 = (uint64_t)objc_msgSend(a2, sel_height) / 32;
    int v24 = &OBJC_IVAR____TtC17MeasureFoundation16KernelYCbCrToRGB_convertAndRotatePipeline;
    int v25 = a5 & 1;
    if (!v25) {
      int v24 = &OBJC_IVAR____TtC17MeasureFoundation16KernelYCbCrToRGB_convertPipeline;
    }
    objc_msgSend(v21, sel_setComputePipelineState_, *(void *)(v10 + *v24));
    objc_msgSend(v21, sel_setTexture_atIndex_, a2, 0);
    objc_msgSend(v21, sel_setTexture_atIndex_, a3, 1);
    objc_msgSend(v21, sel_setTexture_atIndex_, a4, 2);
    int v26 = *(void **)(v10 + OBJC_IVAR____TtC17MeasureFoundation16KernelYCbCrToRGB_roiBuffer);
    swift_unknownObjectRetain();
    unsigned int v27 = (float32x4_t *)objc_msgSend(v26, sel_contents);
    id v28 = v26;
    float64_t v29 = a8;
    v30.f64[0] = a7;
    v30.f64[1] = a8;
    int32x2_t v50 = (int32x2_t)vcvt_f32_f64(v30);
    v30.f64[0] = a7;
    double v31 = a9;
    double v32 = a10;
    *(double *)&long long v33 = CGRectGetWidth(*(CGRect *)(&v29 - 1));
    long long v49 = v33;
    *(double *)&long long v33 = a7;
    float64_t v34 = a8;
    double v35 = a9;
    double v36 = a10;
    CGFloat Height = CGRectGetHeight(*(CGRect *)&v33);
    *(void *)&v38.f64[0] = v49;
    v38.f64[1] = Height;
    *unsigned int v27 = vcvt_hight_f32_f64(v50, v38);
    objc_msgSend(v21, sel_setBuffer_offset_atIndex_, v28, 0, 0);
    if (!v25)
    {
      sub_22F1A931C(a6, (uint64_t)v64);
      float v39 = v19;
      float v40 = v20;
      int8x16_t v41 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v51), v52);
      if (v65) {
        float v40 = 0.0;
      }
      float v57 = v40;
      if (v65) {
        float v39 = 1.0;
      }
      float v55 = v39;
      if (v65) {
        unsigned int v42 = -1;
      }
      else {
        unsigned int v42 = 0;
      }
      int8x16_t v53 = vbslq_s8((int8x16_t)vdupq_n_s32(v42), (int8x16_t)xmmword_22F227590, v41);
      uint64_t v43 = *(void **)(v10 + OBJC_IVAR____TtC17MeasureFoundation16KernelYCbCrToRGB_transformBuffer);
      uint64_t v44 = objc_msgSend((id)swift_unknownObjectRetain(), sel_contents);
      id v45 = v43;
      *(void *)&long long v46 = __PAIR64__(v53.u32[0], LODWORD(v55));
      *((void *)&v46 + 1) = v53.u32[2];
      *(void *)&long long v47 = __PAIR64__(v53.u32[1], LODWORD(v57));
      *((void *)&v47 + 1) = v53.u32[3];
      *uint64_t v44 = v46;
      v44[1] = v47;
      v44[2] = xmmword_22F227080;
      objc_msgSend(v21, sel_setBuffer_offset_atIndex_, v45, 0, 1);
    }
    v60[0] = v22;
    v60[1] = v23;
    v60[2] = 1;
    int64x2_t v58 = vdupq_n_s64(0x20uLL);
    uint64_t v59 = 1;
    objc_msgSend(v21, sel_dispatchThreadgroups_threadsPerThreadgroup_, v60, &v58, v49);
    objc_msgSend(v21, sel_endEncoding);
    swift_unknownObjectRelease();
  }
  return v21 != 0;
}

id KernelYCbCrToRGB.__allocating_init(coder:device:)(void *a1, uint64_t a2)
{
  id v4 = objc_msgSend(objc_allocWithZone(v2), sel_initWithCoder_device_, a1, a2);

  swift_unknownObjectRelease();
  return v4;
}

void KernelYCbCrToRGB.init(coder:device:)()
{
}

id KernelYCbCrToRGB.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for KernelYCbCrToRGB()
{
  return self;
}

id sub_22F1F3ED8(void *a1)
{
  objc_super v2 = v1;
  v23[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = qword_268694380;
  uint64_t v6 = v2;
  if (v5 != -1) {
    swift_once();
  }
  id v7 = (id)static MetalBundle.library;
  uint64_t v8 = (void *)sub_22F223A98();
  id v9 = objc_msgSend(v7, sel_newFunctionWithName_, v8);

  if (!v9)
  {
    __break(1u);
    goto LABEL_11;
  }
  v23[0] = 0;
  id v10 = objc_msgSend(a1, sel_newComputePipelineStateWithFunction_error_, v9, v23);
  swift_unknownObjectRelease();
  id v11 = v23[0];
  if (!v10)
  {
    id v20 = v23[0];
    sub_22F2236F8();

    swift_willThrow();
    swift_unexpectedError();
    __break(1u);
    goto LABEL_15;
  }
  *(void *)&v6[OBJC_IVAR____TtC17MeasureFoundation16KernelYCbCrToRGB_convertPipeline] = v10;
  id v12 = v11;
  uint64_t v13 = (void *)sub_22F223A98();
  id v14 = objc_msgSend(v7, sel_newFunctionWithName_, v13);

  if (!v14)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v23[0] = 0;
  id v15 = objc_msgSend(a1, sel_newComputePipelineStateWithFunction_error_, v14, v23);
  swift_unknownObjectRelease();
  id v7 = v23[0];
  if (v15)
  {
    *(void *)&v6[OBJC_IVAR____TtC17MeasureFoundation16KernelYCbCrToRGB_convertAndRotatePipeline] = v15;
    id v16 = v7;
    id v17 = objc_msgSend(a1, sel_newBufferWithLength_options_, 16, 0);
    if (v17)
    {
      *(void *)&v6[OBJC_IVAR____TtC17MeasureFoundation16KernelYCbCrToRGB_roiBuffer] = v17;
      id v18 = objc_msgSend(a1, sel_newBufferWithLength_options_, 48, 0);
      if (v18)
      {
        *(void *)&v6[OBJC_IVAR____TtC17MeasureFoundation16KernelYCbCrToRGB_transformBuffer] = v18;

        v22.receiver = v6;
        v22.super_class = ObjectType;
        return objc_msgSendSuper2(&v22, sel_initWithDevice_, a1);
      }
LABEL_13:
      __break(1u);
    }
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
LABEL_15:
  id v21 = v7;
  sub_22F2236F8();

  swift_willThrow();
  id result = (id)swift_unexpectedError();
  __break(1u);
  return result;
}

void *SnapType.userPoint.unsafeMutableAddressor()
{
  return &static SnapType.userPoint;
}

uint64_t static SnapType.userPoint.getter()
{
  return 1;
}

void *SnapType.userLine.unsafeMutableAddressor()
{
  return &static SnapType.userLine;
}

uint64_t static SnapType.userLine.getter()
{
  return 2;
}

void *SnapType.guideLine.unsafeMutableAddressor()
{
  return &static SnapType.guideLine;
}

uint64_t static SnapType.guideLine.getter()
{
  return 4;
}

void *SnapType.worldCorner.unsafeMutableAddressor()
{
  return &static SnapType.worldCorner;
}

uint64_t static SnapType.worldCorner.getter()
{
  return 8;
}

void *SnapType.worldEdge.unsafeMutableAddressor()
{
  return &static SnapType.worldEdge;
}

uint64_t static SnapType.worldEdge.getter()
{
  return 16;
}

void *SnapType.all.unsafeMutableAddressor()
{
  return &static SnapType.all;
}

uint64_t static SnapType.all.getter()
{
  return 31;
}

id sub_22F1F4214()
{
  id result = objc_msgSend(self, sel_jasperAvailable);
  uint64_t v1 = 9;
  if (result) {
    uint64_t v1 = 13;
  }
  static SnapType.standard = v1;
  return result;
}

uint64_t *SnapType.standard.unsafeMutableAddressor()
{
  if (qword_2686944E0 != -1) {
    swift_once();
  }
  return &static SnapType.standard;
}

uint64_t static SnapType.standard.getter()
{
  if (qword_2686944E0 != -1) {
    swift_once();
  }
  return static SnapType.standard;
}

unint64_t sub_22F1F42F4()
{
  unint64_t result = qword_268695A60;
  if (!qword_268695A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695A60);
  }
  return result;
}

unint64_t sub_22F1F434C()
{
  unint64_t result = qword_268695A68;
  if (!qword_268695A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695A68);
  }
  return result;
}

unint64_t sub_22F1F43A4()
{
  unint64_t result = qword_268695A70;
  if (!qword_268695A70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695A70);
  }
  return result;
}

unint64_t sub_22F1F43FC()
{
  unint64_t result = qword_268695A78;
  if (!qword_268695A78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695A78);
  }
  return result;
}

ValueMetadata *type metadata accessor for SnapType()
{
  return &type metadata for SnapType;
}

__IOSurface *SurfaceTexture.init(width:height:backgroundColor:)(Swift::Int a1, Swift::Int a2, int a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  *(void *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelFormat] = 80;
  *(void *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bitsPerComponent] = 8;
  *(void *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width] = 0;
  *(void *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height] = 0;
  *(void *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_texture] = 0;
  v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_isLocking] = 0;
  id v7 = &v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_backgroundColor];
  *(_DWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_backgroundColor] = -1;
  *(_DWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_color] = -16776961;
  *(void *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_cursorX] = 0;
  *(void *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_cursorY] = 0;
  *(void *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bytesPerRow] = 0;
  *(void *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsPerRow] = 0;
  *(void *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s] = 0;
  *(void *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelBytes] = 0;
  *(void *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bytesPerPixel] = 4;
  *(void *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsNum] = 0;
  *(void *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_ioSurface] = 0;
  swift_beginAccess();
  *id v7 = a3;
  uint64_t v8 = v3;
  id v9 = MTLCreateSystemDefaultDevice();
  if (!v9) {
    __break(1u);
  }
  *(void *)&v8[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_mtlDevice] = v9;

  v15.receiver = v8;
  v15.super_class = (Class)type metadata accessor for SurfaceTexture();
  id v10 = (char *)objc_msgSendSuper2(&v15, sel_init);
  SurfaceTexture.setSize(width:height:)(a1, a2);
  id v11 = &v10[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_isLocking];
  swift_beginAccess();
  if ((*v11 & 1) == 0)
  {
    uint32_t seed = 0;
    unint64_t result = *(__IOSurface **)&v10[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_ioSurface];
    if (!result)
    {
      __break(1u);
      goto LABEL_11;
    }
    IOSurfaceLock(result, 2u, &seed);
    char *v11 = 1;
  }
  LOBYTE(seed) = 1;
  uint64_t v13 = 0x100000000;
  SurfaceTexture.clear(color:)((Swift::UInt32_optional)v13);
  if (*v11 != 1)
  {
LABEL_8:

    return (__IOSurface *)v10;
  }
  uint32_t seed = 0;
  unint64_t result = *(__IOSurface **)&v10[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_ioSurface];
  if (result)
  {
    IOSurfaceUnlock(result, 2u, &seed);
    char *v11 = 0;
    goto LABEL_8;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t SurfaceTexture.width.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t SurfaceTexture.height.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t SurfaceTexture.texture.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t SurfaceTexture.isLocking.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_isLocking);
  swift_beginAccess();
  return *v1;
}

uint64_t SurfaceTexture.backgroundColor.getter()
{
  uint64_t v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_backgroundColor);
  swift_beginAccess();
  return *v1;
}

uint64_t SurfaceTexture.backgroundColor.setter(int a1)
{
  uint64_t v3 = (_DWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_backgroundColor);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*SurfaceTexture.backgroundColor.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SurfaceTexture.color.getter()
{
  uint64_t v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_color);
  swift_beginAccess();
  return *v1;
}

uint64_t SurfaceTexture.color.setter(int a1)
{
  uint64_t v3 = (_DWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_color);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*SurfaceTexture.color.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SurfaceTexture.cursorX.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_cursorX;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t SurfaceTexture.cursorX.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_cursorX);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*SurfaceTexture.cursorX.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SurfaceTexture.cursorY.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_cursorY;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t SurfaceTexture.cursorY.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_cursorY);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*SurfaceTexture.cursorY.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SurfaceTexture.bytesPerRow.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bytesPerRow;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t SurfaceTexture.bytesPerRow.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bytesPerRow);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*SurfaceTexture.bytesPerRow.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SurfaceTexture.pixelsPerRow.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsPerRow;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t SurfaceTexture.pixelsPerRow.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsPerRow);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*SurfaceTexture.pixelsPerRow.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SurfaceTexture.pixel32s.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t SurfaceTexture.pixel32s.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*SurfaceTexture.pixel32s.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SurfaceTexture.pixelBytes.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelBytes;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t SurfaceTexture.pixelBytes.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelBytes);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*SurfaceTexture.pixelBytes.modify())()
{
  return j__swift_endAccess;
}

uint64_t SurfaceTexture.bytesPerPixel.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bytesPerPixel;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t SurfaceTexture.bytesPerPixel.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bytesPerPixel);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*SurfaceTexture.bytesPerPixel.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t SurfaceTexture.pixelsNum.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsNum;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t SurfaceTexture.pixelsNum.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsNum);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*SurfaceTexture.pixelsNum.modify())()
{
  return j_j__swift_endAccess;
}

Swift::Void __swiftcall SurfaceTexture.setSize(width:height:)(Swift::Int width, Swift::Int height)
{
  uint64_t v5 = (Swift::Int *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width);
  swift_beginAccess();
  Swift::Int *v5 = width;
  uint64_t v6 = (Swift::Int *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height);
  swift_beginAccess();
  *uint64_t v6 = height;
  id v7 = (uint64_t *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bytesPerPixel);
  swift_beginAccess();
  if ((unsigned __int128)(width * (__int128)*v7) >> 64 != (width * *v7) >> 63)
  {
    __break(1u);
    goto LABEL_14;
  }
  Alignedint64_t BytesPerRow = CGBitmapGetAlignedBytesPerRow();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695B10);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22F22A390;
  id v10 = (void *)*MEMORY[0x263F0EF50];
  uint64_t v11 = MEMORY[0x263F8D6C8];
  *(void *)(inited + 32) = *MEMORY[0x263F0EF50];
  *(void *)(inited + 40) = width;
  Swift::Int v53 = width;
  id v12 = (void *)*MEMORY[0x263F0EDF8];
  *(void *)(inited + 64) = v11;
  *(void *)(inited + 72) = v12;
  *(void *)(inited + 80) = height;
  uint64_t v13 = (void *)*MEMORY[0x263F0ED50];
  *(void *)(inited + 104) = v11;
  *(void *)(inited + 112) = v13;
  *(void *)(inited + 120) = AlignedBytesPerRow;
  id v14 = (void *)*MEMORY[0x263F0ED30];
  *(void *)(inited + 144) = v11;
  *(void *)(inited + 152) = v14;
  if ((unsigned __int128)(AlignedBytesPerRow * (__int128)height) >> 64 != (AlignedBytesPerRow * height) >> 63)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v15 = inited;
  *(void *)(inited + 160) = AlignedBytesPerRow * height;
  uint64_t v16 = (void *)*MEMORY[0x263F0ED48];
  *(void *)(inited + 184) = v11;
  *(void *)(inited + 192) = v16;
  float64x2_t v52 = v7;
  *(void *)(inited + 200) = *v7;
  id v17 = (void *)*MEMORY[0x263F0EE48];
  *(void *)(inited + 224) = v11;
  *(void *)(inited + 232) = v17;
  uint64_t v18 = *(void *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelFormat);
  type metadata accessor for MTLPixelFormat(0);
  *(void *)(v15 + 264) = v19;
  *(void *)(v15 + 240) = v18;
  id v20 = v10;
  id v21 = v12;
  id v22 = v13;
  id v23 = v14;
  id v24 = v16;
  id v25 = v17;
  sub_22F185DC0(v15);
  type metadata accessor for CFString(0);
  sub_22F186B80();
  CFDictionaryRef v26 = (const __CFDictionary *)sub_22F223958();
  swift_bridgeObjectRelease();
  IOSurfaceRef v27 = IOSurfaceCreate(v26);
  uint64_t v28 = OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_ioSurface;
  float64_t v29 = *(void **)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_ioSurface);
  *(void *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_ioSurface) = v27;

  id v30 = objc_msgSend(self, sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, v18, v53, height, 0);
  uint64_t v31 = *(void *)(v2 + v28);
  if (!v31)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  double v32 = v30;
  Swift::Int v33 = height;
  id v34 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_mtlDevice), sel_newTextureWithDescriptor_iosurface_plane_, v30, v31, 0);
  double v35 = (void *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_texture);
  swift_beginAccess();
  *double v35 = v34;
  swift_unknownObjectRelease();
  double v36 = *(__IOSurface **)(v2 + v28);
  if (!v36)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t BaseAddress = IOSurfaceGetBaseAddress(v36);
  float64x2_t v38 = (void *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
  swift_beginAccess();
  *float64x2_t v38 = BaseAddress;
  float v39 = *(__IOSurface **)(v2 + v28);
  if (!v39)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  float v40 = IOSurfaceGetBaseAddress(v39);
  int8x16_t v41 = (void *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelBytes);
  swift_beginAccess();
  *int8x16_t v41 = v40;
  unsigned int v42 = *(__IOSurface **)(v2 + v28);
  if (!v42)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  *float64x2_t v52 = IOSurfaceGetBytesPerElement(v42);
  uint64_t v43 = *(void **)(v2 + v28);
  if (v43)
  {
    uint64_t v44 = v43;
    int64_t BytesPerRow = IOSurfaceGetBytesPerRow(v44);

    long long v46 = (int64_t *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bytesPerRow);
    swift_beginAccess();
    *long long v46 = BytesPerRow;
    uint64_t v47 = *v52;
    if (*v52)
    {
      if (BytesPerRow == 0x8000000000000000 && v47 == -1) {
        goto LABEL_17;
      }
      uint64_t v48 = (uint64_t *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsPerRow);
      uint64_t v49 = BytesPerRow / v47;
      swift_beginAccess();
      *uint64_t v48 = v49;
      uint64_t v50 = v49 * v33;
      if ((unsigned __int128)(v49 * (__int128)v33) >> 64 == (v49 * v33) >> 63)
      {
        float64x2_t v51 = (uint64_t *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsNum);
        swift_beginAccess();
        *float64x2_t v51 = v50;
        return;
      }
LABEL_16:
      __break(1u);
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
LABEL_22:
  __break(1u);
}

Swift::UInt32 __swiftcall SurfaceTexture.getPixel(_:_:)(Swift::Int a1, Swift::Int a2)
{
  if (a1 < 0) {
    return 0;
  }
  uint64_t v5 = (Swift::Int *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width);
  swift_beginAccess();
  Swift::UInt32 result = 0;
  if (*v5 <= a1 || a2 < 0) {
    return result;
  }
  id v7 = (Swift::Int *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height);
  swift_beginAccess();
  if (*v7 <= a2) {
    return 0;
  }
  uint64_t v8 = (uint64_t *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
  swift_beginAccess();
  uint64_t v9 = *v8;
  if (!v9) {
    return 0;
  }
  id v10 = (uint64_t *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsPerRow);
  Swift::UInt32 result = swift_beginAccess();
  Swift::Int v11 = a2 * *v10;
  if ((unsigned __int128)(a2 * (__int128)*v10) >> 64 == v11 >> 63)
  {
    BOOL v12 = __OFADD__(v11, a1);
    Swift::Int v13 = v11 + a1;
    if (!v12) {
      return *(_DWORD *)(v9 + 4 * v13);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t SurfaceTexture.getPixel(srcPixels:x:y:invertY:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a2 < 0) {
    return 0;
  }
  uint64_t v9 = (uint64_t *)(v4 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width);
  swift_beginAccess();
  uint64_t result = 0;
  uint64_t v11 = *v9;
  if (v11 <= a2 || a3 < 0) {
    return result;
  }
  BOOL v12 = (void *)(v4 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height);
  uint64_t result = swift_beginAccess();
  if (*v12 <= a3) {
    return 0;
  }
  if (a4) {
    uint64_t v13 = *v12 + ~a3;
  }
  else {
    uint64_t v13 = a3;
  }
  uint64_t v14 = v13 * v11;
  if ((unsigned __int128)(v13 * (__int128)v11) >> 64 == (v13 * v11) >> 63)
  {
    BOOL v15 = __OFADD__(v14, a2);
    uint64_t v16 = v14 + a2;
    if (!v15) {
      return *(unsigned int *)(a1 + 4 * v16);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall SurfaceTexture.setPixel(x:y:color:)(Swift::Int x, Swift::Int y, Swift::UInt32_optional color)
{
  if (x < 0) {
    return;
  }
  unint64_t v4 = *(void *)&color.value;
  id v7 = (Swift::Int *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width);
  swift_beginAccess();
  if (*v7 <= x) {
    return;
  }
  if (y < 0) {
    return;
  }
  uint64_t v8 = (Swift::Int *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height);
  swift_beginAccess();
  if (*v8 <= y) {
    return;
  }
  uint64_t v9 = (uint64_t *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
  swift_beginAccess();
  uint64_t v10 = *v9;
  if (!*v9) {
    return;
  }
  uint64_t v11 = (uint64_t *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsPerRow);
  swift_beginAccess();
  Swift::Int v12 = y * *v11;
  if ((unsigned __int128)(y * (__int128)*v11) >> 64 != v12 >> 63)
  {
    __break(1u);
    goto LABEL_13;
  }
  BOOL v13 = __OFADD__(v12, x);
  Swift::Int v14 = v12 + x;
  if (v13)
  {
LABEL_13:
    __break(1u);
    return;
  }
  if ((v4 & 0x100000000) != 0)
  {
    unint64_t v4 = v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_color;
    swift_beginAccess();
    LODWORD(v4) = *(_DWORD *)v4;
  }
  *(_DWORD *)(v10 + 4 * v14) = v4;
}

Swift::Void __swiftcall SurfaceTexture.drawRect(x:y:width:height:color:)(Swift::Int x, Swift::Int y, Swift::Int width, Swift::Int height, Swift::UInt32_optional color)
{
  Swift::Int v6 = y + height;
  if (__OFADD__(y, height)) {
    goto LABEL_28;
  }
  Swift::Int v7 = y;
  if (v6 < y)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (v6 == y) {
    return;
  }
  Swift::Int v9 = x + width;
  if (__OFADD__(x, width)) {
    goto LABEL_30;
  }
  if (v9 < x)
  {
LABEL_31:
    __break(1u);
    return;
  }
  uint64_t v10 = *(void *)&color.value;
  uint64_t v11 = (Swift::Int *)(v5 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width);
  Swift::Int v12 = (Swift::Int *)(v5 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height);
  BOOL v13 = (void *)(v5 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
  Swift::Int v14 = (uint64_t *)(v5 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsPerRow);
  BOOL v15 = (int *)(v5 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_color);
  swift_beginAccess();
  swift_beginAccess();
  swift_beginAccess();
  swift_beginAccess();
  swift_beginAccess();
  do
  {
    if (v7 >= v6) {
      goto LABEL_26;
    }
    if (v9 != x)
    {
      if (v9 <= x) {
        goto LABEL_27;
      }
      Swift::Int v16 = width;
      Swift::Int v17 = x;
      do
      {
        if ((v17 & 0x8000000000000000) == 0 && (v7 & 0x8000000000000000) == 0 && v17 < *v11 && v7 < *v12 && *v13)
        {
          uint64_t v18 = v7 * *v14;
          if ((unsigned __int128)(v7 * (__int128)*v14) >> 64 != v18 >> 63)
          {
            __break(1u);
LABEL_25:
            __break(1u);
LABEL_26:
            __break(1u);
LABEL_27:
            __break(1u);
LABEL_28:
            __break(1u);
            goto LABEL_29;
          }
          BOOL v19 = __OFADD__(v18, v17);
          uint64_t v20 = v18 + v17;
          if (v19) {
            goto LABEL_25;
          }
          int v21 = v10;
          if ((v10 & 0x100000000) != 0) {
            int v21 = *v15;
          }
          *(_DWORD *)(*v13 + 4 * v20) = v21;
        }
        ++v17;
        --v16;
      }
      while (v16);
    }
    ++v7;
  }
  while (v7 != v6);
}

uint64_t SurfaceTexture.drawRect(x:y:width:height:srcPixels:invertY:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = a2 + a4;
  if (__OFADD__(a2, a4)) {
    goto LABEL_33;
  }
  uint64_t v8 = a2;
  if (v7 < a2)
  {
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (v7 == a2) {
    return result;
  }
  uint64_t v9 = v6;
  uint64_t v10 = result;
  uint64_t v11 = result + a3;
  if (__OFADD__(result, a3)) {
    goto LABEL_35;
  }
  if (v11 < result)
  {
LABEL_36:
    __break(1u);
    return result;
  }
  Swift::Int v14 = (uint64_t *)(v9 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width);
  BOOL v15 = (void *)(v9 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height);
  Swift::Int v16 = (void *)(v9 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
  Swift::Int v17 = (uint64_t *)(v9 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsPerRow);
  swift_beginAccess();
  swift_beginAccess();
  uint64_t result = swift_beginAccess();
  do
  {
    if (v8 >= v7) {
      goto LABEL_31;
    }
    if (v11 != v10)
    {
      if (v11 <= v10) {
        goto LABEL_32;
      }
      uint64_t result = swift_beginAccess();
      uint64_t v18 = a3;
      uint64_t v19 = v10;
      do
      {
        if ((v19 & 0x8000000000000000) == 0 && (v8 & 0x8000000000000000) == 0)
        {
          uint64_t v20 = *v14;
          if (v19 < *v14 && v8 < *v15)
          {
            if (a6) {
              uint64_t v21 = *v15 + ~v8;
            }
            else {
              uint64_t v21 = v8;
            }
            uint64_t v22 = v21 * v20;
            if ((unsigned __int128)(v21 * (__int128)v20) >> 64 != (v21 * v20) >> 63)
            {
              __break(1u);
LABEL_28:
              __break(1u);
LABEL_29:
              __break(1u);
LABEL_30:
              __break(1u);
LABEL_31:
              __break(1u);
LABEL_32:
              __break(1u);
LABEL_33:
              __break(1u);
              goto LABEL_34;
            }
            if (__OFADD__(v22, v19)) {
              goto LABEL_28;
            }
            if (*v16)
            {
              uint64_t v23 = v8 * *v17;
              if ((unsigned __int128)(v8 * (__int128)*v17) >> 64 != v23 >> 63) {
                goto LABEL_29;
              }
              BOOL v24 = __OFADD__(v23, v19);
              uint64_t v25 = v23 + v19;
              if (v24) {
                goto LABEL_30;
              }
              *(_DWORD *)(*v16 + 4 * v25) = *(_DWORD *)(a5 + 4 * (v22 + v19));
            }
          }
        }
        ++v19;
        --v18;
      }
      while (v18);
    }
    ++v8;
  }
  while (v8 != v7);
  return result;
}

Swift::Void __swiftcall SurfaceTexture.blendPixel(x:y:color:)(Swift::Int x, Swift::Int y, Swift::UInt32 color)
{
  if (x < 0)
  {
    _s17MeasureFoundation8GraphicsC9blendBGRA8srcColor03dstG0s6UInt32VAH_AHtFZ_0(0, color);
    return;
  }
  uint64_t v7 = (Swift::Int *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width);
  swift_beginAccess();
  unint64_t v8 = 0;
  if (*v7 > x && (y & 0x8000000000000000) == 0)
  {
    uint64_t v9 = (Swift::Int *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height);
    swift_beginAccess();
    if (*v9 <= y
      || (uint64_t v10 = (uint64_t *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s),
          swift_beginAccess(),
          (uint64_t v11 = *v10) == 0))
    {
      unint64_t v8 = 0;
      goto LABEL_13;
    }
    Swift::Int v12 = (uint64_t *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsPerRow);
    swift_beginAccess();
    Swift::Int v13 = y * *v12;
    if ((unsigned __int128)(y * (__int128)*v12) >> 64 == v13 >> 63)
    {
      BOOL v14 = __OFADD__(v13, x);
      Swift::Int v15 = v13 + x;
      if (!v14)
      {
        unint64_t v8 = *(unsigned int *)(v11 + 4 * v15);
        goto LABEL_13;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_23;
  }
LABEL_13:
  int v16 = _s17MeasureFoundation8GraphicsC9blendBGRA8srcColor03dstG0s6UInt32VAH_AHtFZ_0(v8, color);
  Swift::Int v17 = (Swift::Int *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width);
  swift_beginAccess();
  if (*v17 > x && (y & 0x8000000000000000) == 0)
  {
    uint64_t v18 = (Swift::Int *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height);
    swift_beginAccess();
    if (*v18 > y)
    {
      uint64_t v19 = (uint64_t *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
      swift_beginAccess();
      uint64_t v20 = *v19;
      if (v20)
      {
        uint64_t v21 = (uint64_t *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsPerRow);
        swift_beginAccess();
        Swift::Int v22 = y * *v21;
        if ((unsigned __int128)(y * (__int128)*v21) >> 64 == v22 >> 63)
        {
          BOOL v14 = __OFADD__(v22, x);
          Swift::Int v23 = v22 + x;
          if (!v14)
          {
            *(_DWORD *)(v20 + 4 * v23) = v16;
            return;
          }
LABEL_24:
          __break(1u);
          return;
        }
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
    }
  }
}

Swift::Void __swiftcall SurfaceTexture.blendBrightness(x:y:brightness:)(Swift::Int x, Swift::Int y, Swift::Float brightness)
{
  uint64_t v7 = (_DWORD *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_color);
  swift_beginAccess();
  float v8 = brightness * 255.0;
  if ((~COERCE_INT(brightness * 255.0) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v8 <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v8 < 4295000000.0)
  {
    unsigned int v9 = *v7 & 0xFFFFFF | (v8 << 24);
    unint64_t v10 = SurfaceTexture.getPixel(_:_:)(x, y);
    uint64_t v11 = _s17MeasureFoundation8GraphicsC9blendBGRA8srcColor03dstG0s6UInt32VAH_AHtFZ_0(v10, v9);
    SurfaceTexture.setPixel(x:y:color:)(x, y, (Swift::UInt32_optional)v11);
    return;
  }
LABEL_7:
  __break(1u);
}

Swift::Void __swiftcall SurfaceTexture.setAlpha(_:)(Swift::Float a1)
{
  float v2 = a1 * 255.0;
  if ((~COERCE_INT(a1 * 255.0) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (v2 <= -1.0)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v2 >= 4295000000.0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsNum);
  swift_beginAccess();
  uint64_t v4 = *v3;
  if (*v3 < 0)
  {
LABEL_14:
    __break(1u);
    return;
  }
  if (v4)
  {
    uint64_t v5 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
    swift_beginAccess();
    uint64_t v6 = (_DWORD *)*v5;
    uint64_t v7 = (_DWORD *)*v5;
    do
    {
      if (v6) {
        *v7 &= (v2 << 24) | 0xFFFFFF;
      }
      ++v7;
      --v4;
    }
    while (v4);
  }
}

Swift::Void __swiftcall SurfaceTexture.clear(color:)(Swift::UInt32_optional color)
{
  Swift::UInt32 value = color.value;
  if ((*(void *)&color.value & 0x100000000) != 0)
  {
    uint64_t v3 = (Swift::UInt32 *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_backgroundColor);
    swift_beginAccess();
    Swift::UInt32 value = *v3;
  }
  uint64_t v4 = (Swift::UInt32 *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_backgroundColor);
  swift_beginAccess();
  *uint64_t v4 = value;
  uint64_t v5 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsNum);
  swift_beginAccess();
  uint64_t v6 = *v5;
  if (v6 < 0)
  {
    __break(1u);
  }
  else if (v6)
  {
    uint64_t v7 = (Swift::UInt32 **)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
    swift_beginAccess();
    float v8 = *v7;
    unsigned int v9 = *v7;
    do
    {
      if (v8) {
        *unsigned int v9 = value;
      }
      ++v9;
      --v6;
    }
    while (v6);
  }
}

void *SurfaceTexture.fill(withPointer:)(const void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsNum);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t v7 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bytesPerPixel);
  uint64_t result = (void *)swift_beginAccess();
  int64_t v9 = v6 * *v7;
  if ((unsigned __int128)(v6 * (__int128)*v7) >> 64 == v9 >> 63) {
    return memcpy(v4, a1, v9);
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall SurfaceTexture.fill(withPixelBuffer:)(CVBufferRef withPixelBuffer)
{
  CVPixelBufferLockBaseAddress(withPixelBuffer, 0);
  uint64_t BaseAddress = CVPixelBufferGetBaseAddress(withPixelBuffer);
  uint64_t v4 = (void **)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
  swift_beginAccess();
  uint64_t v5 = *v4;
  uint64_t v6 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsNum);
  swift_beginAccess();
  uint64_t v7 = *v6;
  float v8 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bytesPerPixel);
  swift_beginAccess();
  int64_t v9 = v7 * *v8;
  if ((unsigned __int128)(v7 * (__int128)*v8) >> 64 == v9 >> 63)
  {
    memcpy(v5, BaseAddress, v9);
    CVPixelBufferUnlockBaseAddress(withPixelBuffer, 0);
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall SurfaceTexture.fill(withARBG:)(Swift::OpaquePointer withARBG)
{
  size_t v3 = *((void *)withARBG._rawValue + 2);
  uint64_t v4 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsNum);
  swift_beginAccess();
  if (v3 == *v4)
  {
    uint64_t v5 = (void **)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
    swift_beginAccess();
    memcpy(*v5, (char *)withARBG._rawValue + 32, v3);
  }
  else
  {
    sub_22F2243F8();
    swift_bridgeObjectRelease();
    MEMORY[0x230FB2730](withARBG._rawValue, MEMORY[0x263F8E8F8]);
    sub_22F223B48();
    swift_bridgeObjectRelease();
    sub_22F223B48();
    sub_22F2246D8();
    sub_22F223B48();
    swift_bridgeObjectRelease();
    sub_22F223858();
    swift_bridgeObjectRelease();
  }
}

Swift::Void __swiftcall SurfaceTexture.fill(withBytes:)(Swift::OpaquePointer withBytes)
{
  size_t v3 = (void **)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelBytes);
  swift_beginAccess();
  memcpy(*v3, (char *)withBytes._rawValue + 32, *((void *)withBytes._rawValue + 2));
}

Swift::Void __swiftcall SurfaceTexture.goTo(x:y:)(Swift::Int x, Swift::Int y)
{
  uint64_t v5 = (Swift::Int *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_cursorX);
  swift_beginAccess();
  Swift::Int *v5 = x;
  uint64_t v6 = (Swift::Int *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_cursorY);
  swift_beginAccess();
  *uint64_t v6 = y;
}

Swift::Void __swiftcall SurfaceTexture.begin()()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v1 = (unsigned char *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_isLocking);
  swift_beginAccess();
  if ((*v1 & 1) == 0)
  {
    uint32_t seed = 0;
    uint64_t v2 = *(__IOSurface **)(v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_ioSurface);
    if (v2)
    {
      IOSurfaceLock(v2, 2u, &seed);
      unsigned char *v1 = 1;
    }
    else
    {
      __break(1u);
    }
  }
}

Swift::Void __swiftcall SurfaceTexture.end()()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v1 = (unsigned char *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_isLocking);
  swift_beginAccess();
  if (*v1 == 1)
  {
    uint32_t seed = 0;
    uint64_t v2 = *(__IOSurface **)(v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_ioSurface);
    if (v2)
    {
      IOSurfaceUnlock(v2, 2u, &seed);
      unsigned char *v1 = 0;
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t type metadata accessor for SurfaceTexture()
{
  return self;
}

uint64_t sub_22F1F6664(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  size_t v3 = (void *)(*a2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_texture);
  swift_beginAccess();
  *size_t v3 = v2;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

__IOSurface *SurfaceTexture.__allocating_init(width:height:backgroundColor:)(Swift::Int a1, Swift::Int a2, int a3)
{
  id v7 = objc_allocWithZone(v3);
  return SurfaceTexture.init(width:height:backgroundColor:)(a1, a2, a3);
}

id SurfaceTexture.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void SurfaceTexture.init()()
{
}

id SurfaceTexture.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SurfaceTexture();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22F1F6840@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width, a2);
}

uint64_t sub_22F1F684C(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width);
}

uint64_t sub_22F1F6858@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height, a2);
}

uint64_t keypath_getTm_0@<X0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v4 = (void *)(*a1 + *a2);
  uint64_t result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_22F1F68B4(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height);
}

uint64_t keypath_setTm(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  uint64_t v6 = (void *)(*a2 + *a5);
  uint64_t result = swift_beginAccess();
  *uint64_t v6 = v5;
  return result;
}

uint64_t sub_22F1F690C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  size_t v3 = (void *)(*a1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_texture);
  swift_beginAccess();
  *a2 = *v3;
  return swift_unknownObjectRetain();
}

uint64_t sub_22F1F6968@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  size_t v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_isLocking);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_22F1F69BC(char *a1, void *a2)
{
  char v2 = *a1;
  size_t v3 = (unsigned char *)(*a2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_isLocking);
  uint64_t result = swift_beginAccess();
  *size_t v3 = v2;
  return result;
}

uint64_t ADConfiguration.width.getter()
{
  return 256;
}

uint64_t ADConfiguration.height.getter()
{
  return 192;
}

double ADConfiguration.viewport.getter()
{
  return *(double *)(v0 + 32);
}

float ADConfiguration.depthToMeters.getter()
{
  return 1.0;
}

uint64_t ADConfiguration.shouldCoverEntireView.getter()
{
  return 1;
}

double ADConfiguration.size.getter()
{
  return *(double *)(v0 + 72);
}

uint64_t ADConfiguration.orientation.getter()
{
  return 3;
}

CGFloat _s17MeasureFoundation15ADConfigurationC12viewCropRectSo6CGRectVvg_0()
{
  double v1 = v0[9];
  double v2 = v0[10];
  if (v2 >= v1) {
    double v3 = v0[9];
  }
  else {
    double v3 = v0[10];
  }
  if (v1 <= v2) {
    double v1 = v0[10];
  }
  double v4 = v3 / v1;
  CGFloat v5 = v0[4];
  CGFloat v6 = v0[5];
  CGFloat v7 = v0[6];
  CGFloat v8 = v0[7];
  v17.origin.float x = v5;
  v17.origin.float y = v6;
  v17.size.width = v7;
  v17.size.height = v8;
  double Width = CGRectGetWidth(v17);
  v18.origin.float x = v5;
  v18.origin.float y = v6;
  v18.size.width = v7;
  v18.size.height = v8;
  if (v4 >= Width / CGRectGetHeight(v18))
  {
    v20.origin.float x = v5;
    v20.origin.float y = v6;
    v20.size.width = v7;
    v20.size.height = v8;
    double v11 = CGRectGetWidth(v20);
    double Height = v11 / v4;
  }
  else
  {
    v19.origin.float x = v5;
    v19.origin.float y = v6;
    v19.size.width = v7;
    v19.size.height = v8;
    double Height = CGRectGetHeight(v19);
    double v11 = v4 * Height;
  }
  v21.origin.float x = v5;
  v21.origin.float y = v6;
  v21.size.width = v7;
  v21.size.height = v8;
  double v12 = CGRectGetWidth(v21) / v11;
  v22.origin.float x = v5;
  v22.origin.float y = v6;
  v22.size.width = v7;
  v22.size.height = v8;
  double v13 = CGRectGetHeight(v22) / Height;
  if (v13 <= v12) {
    double v13 = v12;
  }
  if (v13 <= 1.0) {
    double v13 = 1.0;
  }
  double v14 = v11 * v13;
  v23.origin.float x = v5;
  v23.origin.float y = v6;
  v23.size.width = v7;
  v23.size.height = v8;
  CGFloat v15 = (CGRectGetWidth(v23) - v14) * 0.5;
  v24.origin.float x = v5;
  v24.origin.float y = v6;
  v24.size.width = v7;
  v24.size.height = v8;
  CGRectGetHeight(v24);
  return v15;
}

uint64_t ADConfiguration.deinit()
{
  return v0;
}

uint64_t ADConfiguration.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t ARKitADConfiguration.deinit()
{
  return v0;
}

uint64_t QVGAADConfiguration.deinit()
{
  return v0;
}

uint64_t VGAADConfiguration.deinit()
{
  return v0;
}

uint64_t type metadata accessor for ADConfiguration()
{
  return self;
}

uint64_t type metadata accessor for ARKitADConfiguration()
{
  return self;
}

uint64_t type metadata accessor for QVGAADConfiguration()
{
  return self;
}

uint64_t type metadata accessor for VGAADConfiguration()
{
  return self;
}

BOOL sub_22F1F6C74(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  uint64_t v3 = 0;
  uint64_t v4 = a1 + 32;
  do
  {
    uint64_t v5 = 0;
    uint64_t v6 = 16 * v3++;
    long long v7 = *(_OWORD *)(v4 + v6);
    long long v8 = *(_OWORD *)(a2 + 32 + v6);
    while (1)
    {
      long long v13 = v7;
      float v10 = *(float *)((unint64_t)&v13 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3)));
      long long v14 = v8;
      float v11 = *(float *)((unint64_t)&v14 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3)));
      BOOL result = v10 == v11;
      if (v5 == 2) {
        break;
      }
      while (1)
      {
        ++v5;
        if (result) {
          break;
        }
        BOOL result = 0;
        if (v5 == 2) {
          return result;
        }
      }
    }
  }
  while (v10 == v11 && v3 != v2);
  return result;
}

uint64_t BoundingBox.visionCorners.getter()
{
  return swift_bridgeObjectRetain();
}

float32x2_t BoundingBox.centroid.getter(uint64_t a1)
{
  uint64_t v2 = qword_2686943C0;
  swift_bridgeObjectRetain();
  if (v2 != -1) {
    swift_once();
  }
  long long v3 = static SIMD3<>.zero;
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint64_t v5 = (float *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 16);
    do
    {
      *(float32x2_t *)&long long v8 = vadd_f32(*(float32x2_t *)&v3, *(float32x2_t *)(v5 - 2));
      float v7 = *v5;
      v5 += 4;
      *((float *)&v8 + 2) = *((float *)&v3 + 2) + v7;
      HIDWORD(v8) = 0;
      long long v3 = v8;
      --v6;
    }
    while (v6);
  }
  else
  {
    *(void *)&long long v8 = static SIMD3<>.zero;
  }
  float32x2_t v11 = (float32x2_t)v8;
  swift_bridgeObjectRelease();
  *(float *)v9.i32 = (float)v4;
  return vdiv_f32(v11, (float32x2_t)vdup_lane_s32(v9, 0));
}

float32x2_t BoundingBox.visionCentroid.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = qword_2686943C0;
  swift_bridgeObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  long long v5 = static SIMD3<>.zero;
  uint64_t v6 = *(void *)(a2 + 16);
  if (v6)
  {
    float v7 = (float *)(a2 + 40);
    do
    {
      *(float32x2_t *)&long long v9 = vadd_f32(*(float32x2_t *)&v5, *(float32x2_t *)(v7 - 2));
      float v8 = *v7;
      v7 += 4;
      *((float *)&v9 + 2) = *((float *)&v5 + 2) + v8;
      HIDWORD(v9) = 0;
      long long v5 = v9;
      --v6;
    }
    while (v6);
  }
  else
  {
    *(void *)&long long v9 = static SIMD3<>.zero;
  }
  float32x2_t v12 = (float32x2_t)v9;
  swift_bridgeObjectRelease();
  *(float *)v10.i32 = (float)*(uint64_t *)(a1 + 16);
  return vdiv_f32(v12, (float32x2_t)vdup_lane_s32(v10, 0));
}

double BoundingBox.volume.getter(uint64_t a1)
{
  _s17MeasureFoundation11BoundingBoxV10dimensionss5SIMD3VySfGvg_0(a1);
  float32x4_t v6 = v2;
  _s17MeasureFoundation11BoundingBoxV10dimensionss5SIMD3VySfGvg_0(a1);
  float32x4_t v7 = vmulq_laneq_f32(v6, v3, 2);
  _s17MeasureFoundation11BoundingBoxV10dimensionss5SIMD3VySfGvg_0(a1);
  *(void *)&double result = vmulq_lane_f32(v7, v4, 1).u64[0];
  return result;
}

float BoundingBox.init(visionCorners:confidence:visionToRenderTransform:)(float32x4_t *a1, float a2, float32x4_t a3, float32x4_t a4, float32x4_t a5, float32x4_t a6)
{
  int64_t v8 = a1[1].i64[0];
  uint64_t v9 = MEMORY[0x263F8EE78];
  if (v8)
  {
    uint64_t v40 = MEMORY[0x263F8EE78];
    sub_22F18FD88(0, v8, 0);
    float32x4_t v11 = a3;
    float32x4_t v10 = a4;
    float32x4_t v13 = a5;
    float32x4_t v12 = a6;
    uint64_t v14 = v40;
    CGFloat v15 = a1 + 2;
    unint64_t v16 = *(void *)(v40 + 16);
    float32x4_t v17 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a3, COERCE_FLOAT(*MEMORY[0x263EF89A8])), a4, *MEMORY[0x263EF89A8], 1), a5, *MEMORY[0x263EF89A8], 2), a6, *MEMORY[0x263EF89A8], 3);
    float32x4_t v18 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a3, COERCE_FLOAT(*(_OWORD *)(MEMORY[0x263EF89A8] + 16))), a4, *(float32x2_t *)(MEMORY[0x263EF89A8] + 16), 1), a5, *(float32x4_t *)(MEMORY[0x263EF89A8] + 16), 2), a6, *(float32x4_t *)(MEMORY[0x263EF89A8] + 16), 3);
    float32x4_t v19 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a3, COERCE_FLOAT(*(_OWORD *)(MEMORY[0x263EF89A8] + 32))), a4, *(float32x2_t *)(MEMORY[0x263EF89A8] + 32), 1), a5, *(float32x4_t *)(MEMORY[0x263EF89A8] + 32), 2), a6, *(float32x4_t *)(MEMORY[0x263EF89A8] + 32), 3);
    uint64_t v20 = (v16 << 6) | 0x30;
    do
    {
      float32x4_t v21 = *v15;
      unint64_t v22 = *(void *)(v40 + 24);
      if (v16++ >= v22 >> 1)
      {
        float32x4_t v33 = v18;
        float32x4_t v34 = v17;
        float32x4_t v31 = *v15;
        float32x4_t v32 = v19;
        sub_22F18FD88((char *)(v22 > 1), v16, 1);
        float32x4_t v21 = v31;
        float32x4_t v19 = v32;
        float32x4_t v18 = v33;
        float32x4_t v17 = v34;
        float32x4_t v11 = a3;
        float32x4_t v10 = a4;
        float32x4_t v13 = a5;
        float32x4_t v12 = a6;
      }
      *(void *)(v40 + 16) = v16;
      CGRect v24 = (float32x4_t *)(v40 + v20);
      v24[-1] = v17;
      *CGRect v24 = v18;
      v24[1] = v19;
      v24[2] = vaddq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, v21.f32[0]), v10, *(float32x2_t *)v21.f32, 1), v13, v21, 2), v12);
      v20 += 64;
      ++v15;
      --v8;
    }
    while (v8);
  }
  else
  {
    unint64_t v16 = *(void *)(MEMORY[0x263F8EE78] + 16);
    if (!v16) {
      goto LABEL_13;
    }
    uint64_t v14 = MEMORY[0x263F8EE78];
  }
  sub_22F18FD68(0, v16, 0);
  uint64_t v25 = v9;
  unint64_t v26 = *(void *)(v9 + 16);
  uint64_t v27 = 80;
  do
  {
    long long v28 = *(_OWORD *)(v14 + v27);
    unint64_t v29 = *(void *)(v25 + 24);
    if (v26 >= v29 >> 1)
    {
      long long v39 = *(_OWORD *)(v14 + v27);
      sub_22F18FD68((char *)(v29 > 1), v26 + 1, 1);
      long long v28 = v39;
    }
    HIDWORD(v28) = 0;
    *(void *)(v25 + 16) = v26 + 1;
    *(_OWORD *)(v25 + 16 * v26 + 32) = v28;
    v27 += 64;
    ++v26;
    --v16;
  }
  while (v16);
LABEL_13:
  swift_bridgeObjectRelease();
  return a2;
}

BOOL static BoundingBox.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, float a5, float a6)
{
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6 != *(void *)(a3 + 16)) {
    return 0;
  }
  if (v6) {
    BOOL v7 = a1 == a3;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v18 = 0;
    uint64_t v19 = a1 + 32;
    do
    {
      uint64_t v20 = 0;
      uint64_t v21 = 16 * v18++;
      long long v22 = *(_OWORD *)(v19 + v21);
      long long v23 = *(_OWORD *)(a3 + 32 + v21);
      while (1)
      {
        long long v30 = v22;
        float v26 = *(float *)((unint64_t)&v30 & 0xFFFFFFFFFFFFFFF3 | (4 * (v20 & 3)));
        long long v31 = v23;
        float v27 = *(float *)((unint64_t)&v31 & 0xFFFFFFFFFFFFFFF3 | (4 * (v20 & 3)));
        BOOL v24 = v26 == v27;
        if (v20 == 2) {
          break;
        }
        while (1)
        {
          ++v20;
          if (v24) {
            break;
          }
          BOOL v24 = 0;
          BOOL result = 0;
          if (v20 == 2) {
            return result;
          }
        }
      }
      if (v26 != v27) {
        return 0;
      }
    }
    while (v18 != v6);
  }
  uint64_t v8 = *(void *)(a2 + 16);
  if (v8 == *(void *)(a4 + 16))
  {
    if (!v8 || a2 == a4)
    {
      BOOL v14 = 1;
    }
    else
    {
      uint64_t v9 = 0;
      do
      {
        uint64_t v10 = 0;
        uint64_t v11 = 16 * v9++;
        long long v12 = *(_OWORD *)(a2 + 32 + v11);
        long long v13 = *(_OWORD *)(a4 + 32 + v11);
        while (1)
        {
          long long v28 = v12;
          float v15 = *(float *)((unint64_t)&v28 & 0xFFFFFFFFFFFFFFF3 | (4 * (v10 & 3)));
          long long v29 = v13;
          float v16 = *(float *)((unint64_t)&v29 & 0xFFFFFFFFFFFFFFF3 | (4 * (v10 & 3)));
          BOOL v14 = v15 == v16;
          if (v10 == 2) {
            break;
          }
          while (1)
          {
            ++v10;
            if (v14) {
              break;
            }
            BOOL v14 = 0;
            if (v10 == 2) {
              return a5 == a6 && v14;
            }
          }
        }
      }
      while (v15 == v16 && v9 != v8);
    }
  }
  else
  {
    BOOL v14 = 0;
  }
  return a5 == a6 && v14;
}

uint64_t sub_22F1F72E0()
{
  uint64_t v1 = 0x436E6F697369765FLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x6E656469666E6F63;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x7372656E726F63;
  }
}

uint64_t sub_22F1F734C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_22F1F7CC8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22F1F7374()
{
  return 0;
}

void sub_22F1F7380(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_22F1F738C(uint64_t a1)
{
  unint64_t v2 = sub_22F1F7C74();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22F1F73C8(uint64_t a1)
{
  unint64_t v2 = sub_22F1F7C74();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t BoundingBox.encode(to:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268695B18);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_22F1F7C74();
  sub_22F224868();
  uint64_t v13 = a2;
  HIBYTE(v12) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695B28);
  sub_22F1F8B9C(&qword_268695B30, (unint64_t *)&qword_268695B38);
  sub_22F2246A8();
  if (!v3)
  {
    uint64_t v13 = a3;
    HIBYTE(v12) = 1;
    sub_22F2246A8();
    LOBYTE(v13) = 2;
    sub_22F224698();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void BoundingBox.init(from:)(void *a1)
{
}

uint64_t sub_22F1F7634(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  float v3 = *(float *)(a1 + 16);
  uint64_t v4 = *(void *)(a2 + 8);
  float v5 = *(float *)(a2 + 16);
  if (sub_22F1F6C74(*(void *)a1, *(void *)a2)) {
    return sub_22F1F6C74(v2, v4) & (v3 == v5);
  }
  else {
    return 0;
  }
}

void sub_22F1F7698(void *a1@<X0>, uint64_t a2@<X8>)
{
  float v6 = sub_22F1F7E50(a1);
  if (!v2)
  {
    *(void *)a2 = v4;
    *(void *)(a2 + 8) = v5;
    *(float *)(a2 + 16) = v6;
  }
}

uint64_t sub_22F1F76C8(void *a1)
{
  return BoundingBox.encode(to:)(a1, *v1, v1[1]);
}

uint64_t BoundingBox.ResultRepresentation.init(_:)(uint64_t a1)
{
  return a1;
}

uint64_t sub_22F1F7728()
{
  uint64_t result = 0x6F69736E656D6964;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x7372656E726F63;
      break;
    case 2:
      uint64_t result = 0x6F436E6F69736976;
      break;
    case 3:
      uint64_t result = 0x6E656469666E6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22F1F77D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_22F1F89A8(a1, a2);
  *a3 = result;
  return result;
}

void sub_22F1F77F8(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_22F1F7804(uint64_t a1)
{
  unint64_t v2 = sub_22F1F8114();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22F1F7840(uint64_t a1)
{
  unint64_t v2 = sub_22F1F8114();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t BoundingBox.ResultRepresentation.encode(to:)(void *a1, unint64_t a2, unint64_t a3, __n128 a4)
{
  __n128 v13 = a4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268695B40);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_22F1F8114();
  sub_22F224868();
  __n128 v15 = v13;
  char v14 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695428);
  sub_22F1F8C1C((unint64_t *)&qword_268695B38);
  sub_22F2246A8();
  if (!v4)
  {
    v15.n128_u64[0] = a2;
    char v14 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268695B28);
    sub_22F1F8B9C(&qword_268695B30, (unint64_t *)&qword_268695B38);
    sub_22F2246A8();
    v15.n128_u64[0] = a3;
    char v14 = 2;
    sub_22F2246A8();
    v15.n128_u8[0] = 3;
    sub_22F224698();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_22F1F7AF0(void *a1)
{
  return BoundingBox.ResultRepresentation.encode(to:)(a1, v1[1].n128_u64[0], v1[1].n128_u64[1], *v1);
}

uint64_t BoundingBox.resultRepresentation.getter(uint64_t a1)
{
  return a1;
}

uint64_t sub_22F1F7B64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  int v5 = *(_DWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t result = _s17MeasureFoundation11BoundingBoxV10dimensionss5SIMD3VySfGvg_0(v3);
  *(_OWORD *)a1 = v7;
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v4;
  *(_DWORD *)(a1 + 32) = v5;
  return result;
}

uint64_t _s17MeasureFoundation11BoundingBoxV10dimensionss5SIMD3VySfGvg_0(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (!v1)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v1 == 1)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v1 < 3)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v1 < 5) {
LABEL_9:
  }
    __break(1u);
  return result;
}

unint64_t sub_22F1F7C74()
{
  unint64_t result = qword_268695B20;
  if (!qword_268695B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695B20);
  }
  return result;
}

uint64_t sub_22F1F7CC8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7372656E726F63 && a2 == 0xE700000000000000;
  if (v2 || (sub_22F224738() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x436E6F697369765FLL && a2 == 0xEE007372656E726FLL || (sub_22F224738() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E656469666E6F63 && a2 == 0xEA00000000006563)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_22F224738();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

float sub_22F1F7E50(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268695B88);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  long long v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_22F1F7C74();
  sub_22F224858();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268695B28);
    HIBYTE(v10) = 0;
    sub_22F1F8B9C(&qword_268695B90, &qword_268695B98);
    sub_22F224648();
    HIBYTE(v10) = 1;
    swift_bridgeObjectRetain();
    sub_22F224648();
    LOBYTE(v11) = 2;
    swift_bridgeObjectRetain();
    sub_22F224638();
    float v2 = v9;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v2;
}

unint64_t sub_22F1F8114()
{
  unint64_t result = qword_268695B48;
  if (!qword_268695B48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695B48);
  }
  return result;
}

unint64_t sub_22F1F816C()
{
  unint64_t result = qword_268695B50;
  if (!qword_268695B50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695B50);
  }
  return result;
}

uint64_t destroy for BoundingBox()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s17MeasureFoundation11BoundingBoxVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BoundingBox(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy20_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for BoundingBox(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for BoundingBox(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 20)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BoundingBox(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_DWORD *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 20) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 20) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BoundingBox()
{
  return &type metadata for BoundingBox;
}

uint64_t destroy for BoundingBox.ResultRepresentation()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BoundingBox.ResultRepresentation(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BoundingBox.ResultRepresentation(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy36_16(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for BoundingBox.ResultRepresentation(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for BoundingBox.ResultRepresentation(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 36)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BoundingBox.ResultRepresentation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(_DWORD *)(result + 32) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 36) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 36) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BoundingBox.ResultRepresentation()
{
  return &type metadata for BoundingBox.ResultRepresentation;
}

unsigned char *storeEnumTagSinglePayload for BoundingBox.ResultRepresentation.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22F1F865CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BoundingBox.ResultRepresentation.CodingKeys()
{
  return &type metadata for BoundingBox.ResultRepresentation.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for BoundingBox.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *__n128 result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22F1F8760);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BoundingBox.CodingKeys()
{
  return &type metadata for BoundingBox.CodingKeys;
}

unint64_t sub_22F1F879C()
{
  unint64_t result = qword_268695B58;
  if (!qword_268695B58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695B58);
  }
  return result;
}

unint64_t sub_22F1F87F4()
{
  unint64_t result = qword_268695B60;
  if (!qword_268695B60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695B60);
  }
  return result;
}

unint64_t sub_22F1F884C()
{
  unint64_t result = qword_268695B68;
  if (!qword_268695B68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695B68);
  }
  return result;
}

unint64_t sub_22F1F88A4()
{
  unint64_t result = qword_268695B70;
  if (!qword_268695B70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695B70);
  }
  return result;
}

unint64_t sub_22F1F88FC()
{
  unint64_t result = qword_268695B78;
  if (!qword_268695B78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695B78);
  }
  return result;
}

unint64_t sub_22F1F8954()
{
  unint64_t result = qword_268695B80;
  if (!qword_268695B80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695B80);
  }
  return result;
}

uint64_t sub_22F1F89A8(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6F69736E656D6964 && a2 == 0xEA0000000000736ELL || (sub_22F224738() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7372656E726F63 && a2 == 0xE700000000000000 || (sub_22F224738() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F436E6F69736976 && a2 == 0xED00007372656E72 || (sub_22F224738() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E656469666E6F63 && a2 == 0xEA00000000006563)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v5 = sub_22F224738();
    swift_bridgeObjectRelease();
    if (v5) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_22F1F8B9C(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268695B28);
    sub_22F1F8C1C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22F1F8C1C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268695428);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

double UIColor.rgba.getter()
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = 0;
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v2 = 0;
  objc_msgSend(v0, sel_getRed_green_blue_alpha_, v5, &v4, &v3, &v2);
  return *(double *)v5;
}

id UIColor.argb.getter()
{
  v9[1] = *(double *)MEMORY[0x263EF8340];
  v9[0] = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  double v6 = 0.0;
  id result = objc_msgSend(v0, sel_getRed_green_blue_alpha_, v9, &v8, &v7, &v6);
  if (result)
  {
    double v2 = v7 * 255.0;
    if ((~COERCE__INT64(v7 * 255.0) & 0x7FF0000000000000) != 0)
    {
      if (v2 > -1.0)
      {
        if (v2 < 4294967300.0)
        {
          double v3 = v8 * 255.0;
          if ((~COERCE__INT64(v8 * 255.0) & 0x7FF0000000000000) != 0)
          {
            if (v3 > -1.0)
            {
              if (v3 < 4294967300.0)
              {
                double v4 = v9[0] * 255.0;
                if ((~COERCE__INT64(v9[0] * 255.0) & 0x7FF0000000000000) != 0)
                {
                  if (v4 > -1.0)
                  {
                    if (v4 < 4294967300.0)
                    {
                      double v5 = v6 * 255.0;
                      if ((~COERCE__INT64(v6 * 255.0) & 0x7FF0000000000000) != 0)
                      {
                        if (v5 > -1.0)
                        {
                          if (v5 < 4294967300.0) {
                            return (id)(v2 | (v3 << 8) | (v4 << 16) | (v5 << 24));
                          }
LABEL_27:
                          __break(1u);
                        }
LABEL_26:
                        __break(1u);
                        goto LABEL_27;
                      }
LABEL_25:
                      __break(1u);
                      goto LABEL_26;
                    }
LABEL_24:
                    __break(1u);
                    goto LABEL_25;
                  }
LABEL_23:
                  __break(1u);
                  goto LABEL_24;
                }
LABEL_22:
                __break(1u);
                goto LABEL_23;
              }
LABEL_21:
              __break(1u);
              goto LABEL_22;
            }
LABEL_20:
            __break(1u);
            goto LABEL_21;
          }
LABEL_19:
          __break(1u);
          goto LABEL_20;
        }
LABEL_18:
        __break(1u);
        goto LABEL_19;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_18;
  }
  return result;
}

UIColor __swiftcall UIColor.init(argb:)(Swift::UInt32 argb)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return (UIColor)objc_msgSend(v2, sel_initWithRed_green_blue_alpha_, (double)BYTE2(argb) / 255.0, (double)BYTE1(argb) / 255.0, (double)argb / 255.0, (double)HIBYTE(argb) / 255.0);
}

id UIColor.bgra.getter()
{
  v9[1] = *(double *)MEMORY[0x263EF8340];
  v9[0] = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  double v6 = 0.0;
  id result = objc_msgSend(v0, sel_getRed_green_blue_alpha_, v9, &v8, &v7, &v6);
  if (result)
  {
    double v2 = v6 * 255.0;
    if ((~COERCE__INT64(v6 * 255.0) & 0x7FF0000000000000) != 0)
    {
      if (v2 > -1.0)
      {
        if (v2 < 4294967300.0)
        {
          double v3 = v9[0] * 255.0;
          if ((~COERCE__INT64(v9[0] * 255.0) & 0x7FF0000000000000) != 0)
          {
            if (v3 > -1.0)
            {
              if (v3 < 4294967300.0)
              {
                double v4 = v8 * 255.0;
                if ((~COERCE__INT64(v8 * 255.0) & 0x7FF0000000000000) != 0)
                {
                  if (v4 > -1.0)
                  {
                    if (v4 < 4294967300.0)
                    {
                      double v5 = v7 * 255.0;
                      if ((~COERCE__INT64(v7 * 255.0) & 0x7FF0000000000000) != 0)
                      {
                        if (v5 > -1.0)
                        {
                          if (v5 < 4294967300.0) {
                            return (id)(v2 | (v3 << 8) | (v4 << 16) | (v5 << 24));
                          }
LABEL_27:
                          __break(1u);
                        }
LABEL_26:
                        __break(1u);
                        goto LABEL_27;
                      }
LABEL_25:
                      __break(1u);
                      goto LABEL_26;
                    }
LABEL_24:
                    __break(1u);
                    goto LABEL_25;
                  }
LABEL_23:
                  __break(1u);
                  goto LABEL_24;
                }
LABEL_22:
                __break(1u);
                goto LABEL_23;
              }
LABEL_21:
              __break(1u);
              goto LABEL_22;
            }
LABEL_20:
            __break(1u);
            goto LABEL_21;
          }
LABEL_19:
          __break(1u);
          goto LABEL_20;
        }
LABEL_18:
        __break(1u);
        goto LABEL_19;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_18;
  }
  return result;
}

Swift::Bool __swiftcall UIColor.isClear()()
{
  v5[1] = *(double *)MEMORY[0x263EF8340];
  v5[0] = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v2 = 0.0;
  return !objc_msgSend(v0, sel_getRed_green_blue_alpha_, v5, &v4, &v3, &v2) || v5[0] + v4 + v3 + v2 == 0.0;
}

UIColor __swiftcall lerp(start:end:percent:)(UIColor start, UIColor end, Swift::Float percent)
{
  v15[1] = *(double *)MEMORY[0x263EF8340];
  double v14 = 0.0;
  v15[0] = 0.0;
  uint64_t v12 = 0;
  double v13 = 0.0;
  [(objc_class *)start.super.isa getRed:v15 green:&v14 blue:&v13 alpha:&v12];
  double v10 = 0.0;
  double v11 = 0.0;
  uint64_t v8 = 0;
  double v9 = 0.0;
  [(objc_class *)end.super.isa getRed:&v11 green:&v10 blue:&v9 alpha:&v8];
  double v5 = (float)(1.0 - percent);
  double v6 = percent;
  return (UIColor)objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, v15[0] * v5 + v11 * percent, v14 * v5 + v10 * v6, v13 * v5 + v9 * v6, 1.0);
}

uint64_t sub_22F1F929C(char a1, unsigned __int8 a2)
{
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v2 = 1684099177;
    }
    else {
      uint64_t v2 = 1685016681;
    }
    unint64_t v3 = 0xE400000000000000;
    int v4 = a2;
    if (a2)
    {
LABEL_6:
      if (v4 == 1) {
        uint64_t v5 = 1684099177;
      }
      else {
        uint64_t v5 = 1685016681;
      }
      unint64_t v6 = 0xE400000000000000;
      if (v2 != v5) {
        goto LABEL_15;
      }
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v3 = 0xE600000000000000;
    uint64_t v2 = 0x656E6F685069;
    int v4 = a2;
    if (a2) {
      goto LABEL_6;
    }
  }
  unint64_t v6 = 0xE600000000000000;
  if (v2 != 0x656E6F685069)
  {
LABEL_15:
    char v7 = sub_22F224738();
    goto LABEL_16;
  }
LABEL_13:
  if (v3 != v6) {
    goto LABEL_15;
  }
  char v7 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_22F1F9380(char a1, char a2)
{
  unint64_t v3 = 0xE200000000000000;
  unint64_t v4 = 25705;
  switch(a1)
  {
    case 1:
      unint64_t v3 = 0xE500000000000000;
      unint64_t v4 = 0x7472617473;
      break;
    case 2:
      unint64_t v3 = 0xE300000000000000;
      unint64_t v4 = 6581861;
      break;
    case 3:
      unint64_t v3 = 0xE600000000000000;
      unint64_t v4 = 0x6874676E656CLL;
      break;
    case 4:
      unint64_t v4 = 0x6574616D69747365;
      unint64_t v3 = 0xEE00726F72724564;
      break;
    case 5:
      unint64_t v3 = 0x800000022F22D690;
      unint64_t v4 = 0xD000000000000016;
      break;
    default:
      break;
  }
  unint64_t v5 = 0xE200000000000000;
  uint64_t v6 = 25705;
  switch(a2)
  {
    case 1:
      unint64_t v5 = 0xE500000000000000;
      if (v4 == 0x7472617473) {
        goto LABEL_16;
      }
      goto LABEL_19;
    case 2:
      unint64_t v5 = 0xE300000000000000;
      if (v4 != 6581861) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 3:
      unint64_t v5 = 0xE600000000000000;
      if (v4 != 0x6874676E656CLL) {
        goto LABEL_19;
      }
      goto LABEL_16;
    case 4:
      uint64_t v6 = 0x6574616D69747365;
      unint64_t v5 = 0xEE00726F72724564;
      goto LABEL_15;
    case 5:
      unint64_t v5 = 0x800000022F22D690;
      if (v4 != 0xD000000000000016) {
        goto LABEL_19;
      }
      goto LABEL_16;
    default:
LABEL_15:
      if (v4 != v6) {
        goto LABEL_19;
      }
LABEL_16:
      if (v3 == v5) {
        char v7 = 1;
      }
      else {
LABEL_19:
      }
        char v7 = sub_22F224738();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

BOOL static UIDevice.isDeviceQualified(family:minVersion:)(char a1, uint64_t a2, uint64_t a3)
{
  if (qword_2686944E8 != -1) {
    swift_once();
  }
  if (static UIDevice.parsedDeviceIdentifier == 3) {
    return 0;
  }
  uint64_t v6 = 1684099177;
  if (a1)
  {
    if (a1 == 1)
    {
      unint64_t v7 = 0xE400000000000000;
      uint64_t v8 = 1684099177;
    }
    else
    {
      uint64_t v8 = 1685016681;
      unint64_t v7 = 0xE400000000000000;
    }
  }
  else
  {
    unint64_t v7 = 0xE600000000000000;
    uint64_t v8 = 0x656E6F685069;
  }
  uint64_t v10 = qword_26869BDB0;
  uint64_t v9 = qword_26869BDB8;
  if (static UIDevice.parsedDeviceIdentifier != 1) {
    uint64_t v6 = 1685016681;
  }
  if ((_BYTE)static UIDevice.parsedDeviceIdentifier) {
    uint64_t v11 = v6;
  }
  else {
    uint64_t v11 = 0x656E6F685069;
  }
  if ((_BYTE)static UIDevice.parsedDeviceIdentifier) {
    unint64_t v12 = 0xE400000000000000;
  }
  else {
    unint64_t v12 = 0xE600000000000000;
  }
  if (v8 == v11 && v7 == v12)
  {
    swift_bridgeObjectRelease_n();
    if (v10 < a2) {
      return 0;
    }
    return v9 >= a3;
  }
  char v14 = sub_22F224738();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  BOOL result = 0;
  if ((v14 & 1) != 0 && v10 >= a2) {
    return v9 >= a3;
  }
  return result;
}

uint64_t static UIDevice.isIPad()()
{
  if (qword_2686944E8 != -1) {
    swift_once();
  }
  if (static UIDevice.parsedDeviceIdentifier == 3)
  {
    char v0 = 0;
  }
  else
  {
    if (static UIDevice.parsedDeviceIdentifier == 1) {
      char v0 = 1;
    }
    else {
      char v0 = sub_22F224738();
    }
    swift_bridgeObjectRelease();
  }
  return v0 & 1;
}

void *static UIDevice.DeviceFamily.allCases.getter()
{
  return &unk_26E291BC0;
}

uint64_t UIDevice.DeviceFamily.rawValue.getter(char a1)
{
  if (!a1) {
    return 0x656E6F685069;
  }
  if (a1 == 1) {
    return 1684099177;
  }
  return 1685016681;
}

uint64_t sub_22F1F9800(char *a1, unsigned __int8 *a2)
{
  return sub_22F1F929C(*a1, *a2);
}

uint64_t sub_22F1F980C()
{
  return sub_22F224818();
}

uint64_t sub_22F1F98A0()
{
  sub_22F223B28();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22F1F9920()
{
  return sub_22F224818();
}

uint64_t sub_22F1F99B0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = _sSo8UIDeviceC17MeasureFoundationE12DeviceFamilyO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

void sub_22F1F99E0(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE600000000000000;
  uint64_t v4 = 1684099177;
  if (v2 != 1) {
    uint64_t v4 = 1685016681;
  }
  BOOL v5 = v2 == 0;
  if (*v1) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 0x656E6F685069;
  }
  if (!v5) {
    unint64_t v3 = 0xE400000000000000;
  }
  *a1 = v6;
  a1[1] = v3;
}

void sub_22F1F9A30(void *a1@<X8>)
{
  *a1 = &unk_26E291BE8;
}

uint64_t sub_22F1F9A40()
{
  uint64_t result = sub_22F1F9A68();
  static UIDevice.parsedDeviceIdentifier = result;
  qword_26869BDB0 = v1;
  qword_26869BDB8 = v2;
  return result;
}

uint64_t sub_22F1F9A68()
{
  if (qword_2686944F0 != -1) {
    swift_once();
  }
  unsigned int v0 = byte_26E2918E0;
  uint64_t v45 = static UIDevice.identifier;
  unint64_t v46 = *(void *)algn_26869BDC8;
  uint64_t v1 = 1685016681;
  if (byte_26E2918E0 == 1) {
    uint64_t v1 = 1684099177;
  }
  if (byte_26E2918E0) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0x656E6F685069;
  }
  if (byte_26E2918E0) {
    unint64_t v3 = 0xE400000000000000;
  }
  else {
    unint64_t v3 = 0xE600000000000000;
  }
  uint64_t v43 = v2;
  unint64_t v44 = v3;
  unint64_t v4 = sub_22F18B724();
  swift_bridgeObjectRetain();
  uint64_t v5 = MEMORY[0x263F8D310];
  char v6 = sub_22F224248();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v6 & 1) == 0)
  {
    unsigned int v0 = byte_26E2918E1;
    uint64_t v45 = static UIDevice.identifier;
    unint64_t v46 = *(void *)algn_26869BDC8;
    if (byte_26E2918E1)
    {
      if (byte_26E2918E1 == 1)
      {
        unint64_t v7 = 0xE400000000000000;
        uint64_t v8 = 1684099177;
      }
      else
      {
        uint64_t v8 = 1685016681;
        unint64_t v7 = 0xE400000000000000;
      }
    }
    else
    {
      unint64_t v7 = 0xE600000000000000;
      uint64_t v8 = 0x656E6F685069;
    }
    uint64_t v43 = v8;
    unint64_t v44 = v7;
    swift_bridgeObjectRetain();
    char v9 = sub_22F224248();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
      unsigned int v0 = byte_26E2918E2;
      uint64_t v45 = static UIDevice.identifier;
      unint64_t v46 = *(void *)algn_26869BDC8;
      if (byte_26E2918E2)
      {
        if (byte_26E2918E2 == 1)
        {
          unint64_t v10 = 0xE400000000000000;
          uint64_t v11 = 1684099177;
        }
        else
        {
          uint64_t v11 = 1685016681;
          unint64_t v10 = 0xE400000000000000;
        }
      }
      else
      {
        unint64_t v10 = 0xE600000000000000;
        uint64_t v11 = 0x656E6F685069;
      }
      uint64_t v43 = v11;
      unint64_t v44 = v10;
      swift_bridgeObjectRetain();
      char v12 = sub_22F224248();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        if (qword_268694548 != -1) {
          swift_once();
        }
        uint64_t v35 = qword_26869BEC0;
        uint64_t v36 = *(void *)algn_26869BEC8;
        uint64_t v45 = 0;
        unint64_t v46 = 0xE000000000000000;
        sub_22F2243F8();
        swift_bridgeObjectRelease();
        unint64_t v37 = 0xD00000000000002DLL;
        float64x2_t v38 = "Failed to parse device family for identifier ";
        goto LABEL_47;
      }
    }
  }
  uint64_t v45 = static UIDevice.identifier;
  unint64_t v46 = *(void *)algn_26869BDC8;
  uint64_t v13 = 1685016681;
  if (v0 == 1) {
    uint64_t v13 = 1684099177;
  }
  if (v0) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0x656E6F685069;
  }
  if (v0) {
    unint64_t v15 = 0xE400000000000000;
  }
  else {
    unint64_t v15 = 0xE600000000000000;
  }
  uint64_t v43 = v14;
  unint64_t v44 = v15;
  v42[6] = 0;
  v42[7] = 0xE000000000000000;
  swift_bridgeObjectRetain();
  v42[3] = v4;
  v42[0] = v5;
  v42[1] = v4;
  uint64_t v16 = sub_22F224228();
  unint64_t v18 = v17;
  swift_bridgeObjectRelease();
  uint64_t v19 = swift_bridgeObjectRelease();
  uint64_t v45 = 44;
  unint64_t v46 = 0xE100000000000000;
  MEMORY[0x270FA5388](v19);
  v42[2] = &v45;
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_22F1FA7EC(0x7FFFFFFFFFFFFFFFLL, 1, sub_22F1FBDD0, (uint64_t)v42, v16, v18);
  swift_bridgeObjectRelease();
  if (!*((void *)v20 + 2))
  {
    __break(1u);
    goto LABEL_52;
  }
  uint64_t v21 = *((void *)v20 + 4);
  uint64_t v22 = *((void *)v20 + 5);
  if (!((v22 ^ (unint64_t)v21) >> 14)) {
    goto LABEL_44;
  }
  unint64_t v24 = *((void *)v20 + 6);
  unint64_t v23 = *((void *)v20 + 7);
  sub_22F1FB65C(*((void *)v20 + 4), *((void *)v20 + 5), v24, v23, 10);
  if ((v25 & 0x100) != 0)
  {
    swift_bridgeObjectRetain();
    sub_22F1FAC0C(v21, v22, v24, v23, 10);
    char v27 = v26;
    swift_bridgeObjectRelease();
    if (v27) {
      goto LABEL_44;
    }
  }
  else if (v25)
  {
    goto LABEL_44;
  }
  if (*((void *)v20 + 2) < 2uLL)
  {
    __break(1u);
    goto LABEL_44;
  }
  unint64_t v28 = *((void *)v20 + 8);
  unint64_t v29 = *((void *)v20 + 9);
  unint64_t v31 = *((void *)v20 + 10);
  unint64_t v30 = *((void *)v20 + 11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!((v29 ^ v28) >> 14))
  {
LABEL_44:
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  sub_22F1FB65C(v28, v29, v31, v30, 10);
  if ((v32 & 0x100) != 0) {
    sub_22F1FAC0C(v28, v29, v31, v30, 10);
  }
  char v33 = v32;
  swift_bridgeObjectRelease();
  if ((v33 & 1) == 0) {
    return v0;
  }
LABEL_45:
  if (qword_268694548 != -1) {
LABEL_52:
  }
    swift_once();
  uint64_t v35 = qword_26869BEC0;
  uint64_t v36 = *(void *)algn_26869BEC8;
  uint64_t v45 = 0;
  unint64_t v46 = 0xE000000000000000;
  sub_22F2243F8();
  swift_bridgeObjectRelease();
  unint64_t v37 = 0xD000000000000027;
  float64x2_t v38 = "Failed to parse version for identifier ";
LABEL_47:
  uint64_t v45 = v37;
  unint64_t v46 = (unint64_t)(v38 - 32) | 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_22F223B48();
  swift_bridgeObjectRelease();
  uint64_t v39 = v45;
  uint64_t v40 = v46;
  uint64_t v41 = sub_22F2240B8();
  _s17MeasureFoundation3LogV3log_4type9isPrivateySS_So03os_d1_E2_taSbtF_0(v39, v40, v41, 0, v35, v36);
  swift_bridgeObjectRelease();
  return 3;
}

uint64_t *UIDevice.identifier.unsafeMutableAddressor()
{
  if (qword_2686944F0 != -1) {
    swift_once();
  }
  return &static UIDevice.identifier;
}

uint64_t *UIDevice.parsedDeviceIdentifier.unsafeMutableAddressor()
{
  if (qword_2686944E8 != -1) {
    swift_once();
  }
  return &static UIDevice.parsedDeviceIdentifier;
}

uint64_t static UIDevice.parsedDeviceIdentifier.getter()
{
  if (qword_2686944E8 != -1) {
    swift_once();
  }
  return static UIDevice.parsedDeviceIdentifier;
}

uint64_t sub_22F1FA0EC()
{
  uint64_t result = sub_22F1FA110();
  static UIDevice.identifier = result;
  *(void *)algn_26869BDC8 = v1;
  return result;
}

uint64_t sub_22F1FA110()
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v0 = sub_22F224848();
  uint64_t v19 = *(void *)(v0 - 8);
  uint64_t v20 = v0;
  MEMORY[0x270FA5388](v0);
  uint64_t v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(&v32, 0x500uLL);
  uname(&v32);
  long long v23 = *(_OWORD *)&v32.machine[16];
  long long v24 = *(_OWORD *)v32.machine;
  long long v21 = *(_OWORD *)&v32.machine[48];
  long long v22 = *(_OWORD *)&v32.machine[32];
  long long v29 = *(_OWORD *)&v32.machine[80];
  long long v30 = *(_OWORD *)&v32.machine[64];
  long long v27 = *(_OWORD *)&v32.machine[112];
  long long v28 = *(_OWORD *)&v32.machine[96];
  long long v25 = *(_OWORD *)&v32.machine[144];
  long long v26 = *(_OWORD *)&v32.machine[128];
  *((void *)&v38 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_268695BB8);
  unint64_t v3 = (_OWORD *)swift_allocObject();
  *(void *)&long long v37 = v3;
  long long v4 = v23;
  v3[1] = v24;
  v3[2] = v4;
  long long v5 = v21;
  v3[3] = v22;
  v3[4] = v5;
  long long v6 = *(_OWORD *)&v32.machine[160];
  long long v7 = *(_OWORD *)&v32.machine[176];
  long long v8 = *(_OWORD *)&v32.machine[192];
  long long v9 = *(_OWORD *)&v32.machine[208];
  long long v10 = *(_OWORD *)&v32.machine[224];
  long long v11 = *(_OWORD *)&v32.machine[240];
  long long v12 = v29;
  v3[5] = v30;
  v3[6] = v12;
  long long v13 = v27;
  v3[7] = v28;
  v3[8] = v13;
  long long v14 = v25;
  v3[9] = v26;
  v3[10] = v14;
  v3[11] = v6;
  v3[12] = v7;
  v3[13] = v8;
  v3[14] = v9;
  v3[15] = v10;
  v3[16] = v11;
  sub_22F224828();
  *(void *)&long long v30 = v2;
  *(void *)&long long v29 = sub_22F224838();
  sub_22F2244F8();
  sub_22F224608();
  if (*((void *)&v39 + 1))
  {
    uint64_t v15 = 0;
    unint64_t v16 = 0xE000000000000000;
    do
    {
      long long v35 = v37;
      v36[0] = v38;
      v36[1] = v39;
      long long v33 = v37;
      sub_22F195C78((uint64_t)v36, (uint64_t)&v34);
      if (swift_dynamicCast() && v31)
      {
        if ((v31 & 0x80) != 0) {
          __break(1u);
        }
        *(void *)&long long v33 = v31;
        MEMORY[0x230FB2580](&v33, 1);
        *(void *)&long long v33 = v15;
        *((void *)&v33 + 1) = v16;
        swift_bridgeObjectRetain();
        sub_22F223B48();
        swift_bridgeObjectRelease();
        unint64_t v17 = *((void *)&v33 + 1);
        uint64_t v15 = v33;
      }
      else
      {
        swift_bridgeObjectRetain();
        unint64_t v17 = v16;
      }
      sub_22F1FBD70((uint64_t)&v35);
      swift_bridgeObjectRelease();
      sub_22F224608();
      unint64_t v16 = v17;
    }
    while (*((void *)&v39 + 1));
  }
  else
  {
    uint64_t v15 = 0;
  }
  swift_release();
  swift_release();
  (*(void (**)(void, uint64_t))(v19 + 8))(v30, v20);
  return v15;
}

uint64_t static UIDevice.identifier.getter()
{
  if (qword_2686944F0 != -1) {
    swift_once();
  }
  uint64_t v0 = static UIDevice.identifier;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static UIDevice.isIPhone()()
{
  if (qword_2686944E8 != -1) {
    swift_once();
  }
  int v0 = static UIDevice.parsedDeviceIdentifier;
  if (static UIDevice.parsedDeviceIdentifier != 3)
  {
    if ((_BYTE)static UIDevice.parsedDeviceIdentifier)
    {
      char v2 = sub_22F224738();
      swift_bridgeObjectRelease();
      if (v2)
      {
        char v1 = 1;
        return v1 & 1;
      }
      if (v0 == 2) {
        char v1 = 1;
      }
      else {
        char v1 = sub_22F224738();
      }
    }
    else
    {
      char v1 = 1;
    }
    swift_bridgeObjectRelease();
    return v1 & 1;
  }
  char v1 = 0;
  return v1 & 1;
}

BOOL static UIDevice.shouldLockFramerate()()
{
  if (qword_2686944E8 != -1) {
    swift_once();
  }
  if (static UIDevice.parsedDeviceIdentifier != 3)
  {
    if ((_BYTE)static UIDevice.parsedDeviceIdentifier)
    {
      if (static UIDevice.parsedDeviceIdentifier == 1)
      {
        if (qword_26869BDB0 != 6)
        {
          if (qword_26869BDB0 == 7) {
            return (unint64_t)(qword_26869BDB8 - 11) < 2;
          }
          return 0;
        }
        return 1;
      }
    }
    else if (qword_26869BDB0 == 8)
    {
      return 1;
    }
  }
  return 0;
}

BOOL static UIDevice.hasHWAcceleratedFeatureDetection()()
{
  if (qword_2686944E8 != -1) {
    swift_once();
  }
  if (static UIDevice.parsedDeviceIdentifier == 3) {
    return 0;
  }
  uint64_t v1 = qword_26869BDB0;
  uint64_t v0 = qword_26869BDB8;
  if ((_BYTE)static UIDevice.parsedDeviceIdentifier)
  {
    char v2 = sub_22F224738();
    swift_bridgeObjectRelease();
    if ((v2 & 1) != 0 && v1 >= 11 && v0 > 0) {
      return 1;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    if (v1 >= 11 && v0 >= 1) {
      return 1;
    }
  }
  if (static UIDevice.parsedDeviceIdentifier == 3) {
    return 0;
  }
  uint64_t v6 = qword_26869BDB0;
  uint64_t v5 = qword_26869BDB8;
  if (static UIDevice.parsedDeviceIdentifier == 1)
  {
    swift_bridgeObjectRelease();
    if (v6 < 8) {
      return 0;
    }
    return v5 > 0;
  }
  char v7 = sub_22F224738();
  swift_bridgeObjectRelease();
  BOOL result = 0;
  if ((v7 & 1) != 0 && v6 >= 8) {
    return v5 > 0;
  }
  return result;
}

char *sub_22F1FA7EC(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v46[3] = a4;
  if (a1 < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v11 = a5;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = MEMORY[0x263F8EE78];
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = 15;
  uint64_t v15 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v16 = HIBYTE(a6) & 0xF) : (uint64_t v16 = v11 & 0xFFFFFFFFFFFFLL), !v16))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v15 = v11 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((v11 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_22F1FB54C(v30 | (v15 << 16), v43, a2 & 1, v14);
    swift_bridgeObjectRelease();
    long long v10 = *(char **)(v14 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_38;
  }
  uint64_t v38 = a1;
  uint64_t v39 = v14;
  unint64_t v44 = 4 * v16;
  long long v10 = (char *)MEMORY[0x263F8EE78];
  unint64_t v9 = 15;
  unint64_t v8 = 15;
  unint64_t v17 = 15;
  while (1)
  {
    v46[0] = sub_22F223BB8();
    v46[1] = v18;
    uint64_t v19 = a3(v46);
    if (v7)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v10;
    }
    uint64_t v6 = v19;
    swift_bridgeObjectRelease();
    if (v6) {
      break;
    }
    unint64_t v9 = sub_22F223B38();
LABEL_9:
    if (v44 == v9 >> 14) {
      goto LABEL_29;
    }
  }
  if (v8 >> 14 == v9 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v9 = sub_22F223B38();
    *(void *)(v43 + 16) = v9;
    unint64_t v8 = v9;
    unint64_t v17 = v9;
    goto LABEL_9;
  }
  if (v9 >> 14 < v8 >> 14)
  {
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v20 = sub_22F223BD8();
  uint64_t v40 = v21;
  uint64_t v41 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    long long v10 = sub_22F19B970(0, *((void *)v10 + 2) + 1, 1, v10);
  }
  unint64_t v27 = *((void *)v10 + 2);
  unint64_t v26 = *((void *)v10 + 3);
  uint64_t v6 = v27 + 1;
  if (v27 >= v26 >> 1) {
    long long v10 = sub_22F19B970((char *)(v26 > 1), v27 + 1, 1, v10);
  }
  *((void *)v10 + 2) = v6;
  long long v28 = &v10[32 * v27];
  *((void *)v28 + 4) = v41;
  *((void *)v28 + 5) = v23;
  *((void *)v28 + 6) = v25;
  *((void *)v28 + 7) = v40;
  *(void *)(v39 + 16) = v10;
  uint64_t v29 = sub_22F223B38();
  unint64_t v9 = v29;
  *(void *)(v43 + 16) = v29;
  if (*((void *)v10 + 2) != v38)
  {
    unint64_t v8 = v29;
    unint64_t v17 = v29;
    goto LABEL_9;
  }
  unint64_t v17 = v29;
  unint64_t v8 = v29;
LABEL_29:
  if (v44 == v8 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  if (v44 >= v17 >> 14)
  {
    uint64_t v6 = sub_22F223BD8();
    unint64_t v8 = v31;
    unint64_t v9 = v32;
    uint64_t v11 = v33;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_43;
    }
    goto LABEL_34;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  long long v10 = sub_22F19B970(0, *((void *)v10 + 2) + 1, 1, v10);
LABEL_34:
  unint64_t v35 = *((void *)v10 + 2);
  unint64_t v34 = *((void *)v10 + 3);
  if (v35 >= v34 >> 1) {
    long long v10 = sub_22F19B970((char *)(v34 > 1), v35 + 1, 1, v10);
  }
  *((void *)v10 + 2) = v35 + 1;
  uint64_t v36 = &v10[32 * v35];
  *((void *)v36 + 4) = v6;
  *((void *)v36 + 5) = v8;
  *((void *)v36 + 6) = v9;
  *((void *)v36 + 7) = v11;
  *(void *)(v39 + 16) = v10;
LABEL_37:
  swift_bridgeObjectRetain();
  swift_release();
LABEL_38:
  swift_release();
  return v10;
}

unsigned __int8 *sub_22F1FAC0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  sub_22F1FBE28();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_22F223BC8();
  unint64_t v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v10 = HIBYTE(v8) & 0xF;
    uint64_t v15 = v7;
    uint64_t v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    unint64_t v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  uint64_t v7 = sub_22F1FAF7C();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  unint64_t v8 = v12;
  if ((v12 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    unint64_t v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v9 = (unsigned __int8 *)sub_22F224448();
  }
LABEL_7:
  long long v13 = sub_22F1FAD00(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13;
}

unsigned __int8 *sub_22F1FAD00(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  uint64_t v13 = 0;
                  if (v11 < 0x61 || v11 >= v8) {
                    return (unsigned __int8 *)v13;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v14 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v14 - (v11 + v12);
              if (__OFSUB__(v14, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_66;
    }
    if (a2)
    {
      unsigned __int8 v23 = a3 + 48;
      unsigned __int8 v24 = a3 + 55;
      unsigned __int8 v25 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v23 = 58;
      }
      else
      {
        unsigned __int8 v25 = 97;
        unsigned __int8 v24 = 65;
      }
      if (result)
      {
        uint64_t v26 = 0;
        do
        {
          unsigned int v27 = *result;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              uint64_t v13 = 0;
              if (v27 < 0x61 || v27 >= v25) {
                return (unsigned __int8 *)v13;
              }
              char v28 = -87;
            }
            else
            {
              char v28 = -55;
            }
          }
          else
          {
            char v28 = -48;
          }
          uint64_t v29 = v26 * a3;
          if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63) {
            return 0;
          }
          uint64_t v26 = v29 + (v27 + v28);
          if (__OFADD__(v29, (v27 + v28))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v29 + (v27 + v28));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  uint64_t v15 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v16 = a3 + 48;
  unsigned __int8 v17 = a3 + 55;
  unsigned __int8 v18 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v16 = 58;
  }
  else
  {
    unsigned __int8 v18 = 97;
    unsigned __int8 v17 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v19 = result + 1;
  do
  {
    unsigned int v20 = *v19;
    if (v20 < 0x30 || v20 >= v16)
    {
      if (v20 < 0x41 || v20 >= v17)
      {
        uint64_t v13 = 0;
        if (v20 < 0x61 || v20 >= v18) {
          return (unsigned __int8 *)v13;
        }
        char v21 = -87;
      }
      else
      {
        char v21 = -55;
      }
    }
    else
    {
      char v21 = -48;
    }
    uint64_t v22 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v22 + (v20 + v21);
    if (__OFADD__(v22, (v20 + v21))) {
      return 0;
    }
    ++v19;
    --v15;
  }
  while (v15);
  return (unsigned __int8 *)v9;
}

uint64_t sub_22F1FAF7C()
{
  unint64_t v0 = sub_22F223BD8();
  uint64_t v4 = sub_22F1FAFFC(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_22F1FAFFC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    unint64_t v9 = sub_22F1FB154(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_22F1FB254(v9, 0);
      unint64_t v12 = sub_22F1FB2BC((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_22F224448();
LABEL_4:
        JUMPOUT(0x230FB2580);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x230FB2580](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x230FB2580]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_22F1FB154(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    BOOL result = sub_22F1FB4D0(result, a3, a4);
    unint64_t v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    BOOL result = sub_22F1FB4D0(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0) {
      return (a2 >> 16) - (v7 >> 16);
    }
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  unint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    unint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v10 < v7 >> 16)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v10 < a2 >> 16)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  return sub_22F223B78();
}

void *sub_22F1FB254(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695BD0);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_22F1FB2BC(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    double v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    BOOL result = v12;
    if (v17 == v15) {
      BOOL result = sub_22F1FB4D0(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      BOOL result = sub_22F223B88();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        BOOL result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          BOOL result = sub_22F224448();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    BOOL result = sub_22F1FB4D0(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_22F223B58();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_22F1FB4D0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_22F223B98();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x230FB25D0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_22F1FB54C(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v10 = *(void *)(a2 + 16) >> 14;
  int v11 = (v10 == a1 >> 14) & a3;
  if (v11 == 1) {
    return v11 ^ 1u;
  }
  if (a1 >> 14 < v10)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = a4;
  uint64_t v5 = sub_22F223BD8();
  uint64_t v6 = v12;
  uint64_t v7 = v13;
  uint64_t v8 = v14;
  uint64_t v9 = *(char **)(v4 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v4 + 16) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_9:
    uint64_t v9 = sub_22F19B970(0, *((void *)v9 + 2) + 1, 1, v9);
    *(void *)(v4 + 16) = v9;
  }
  unint64_t v17 = *((void *)v9 + 2);
  unint64_t v16 = *((void *)v9 + 3);
  if (v17 >= v16 >> 1)
  {
    uint64_t v9 = sub_22F19B970((char *)(v16 > 1), v17 + 1, 1, v9);
    *(void *)(v4 + 16) = v9;
  }
  *((void *)v9 + 2) = v17 + 1;
  unint64_t v18 = &v9[32 * v17];
  *((void *)v18 + 4) = v5;
  *((void *)v18 + 5) = v6;
  *((void *)v18 + 6) = v7;
  *((void *)v18 + 7) = v8;
  return v11 ^ 1u;
}

uint64_t sub_22F1FB65C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t result = 0;
    goto LABEL_8;
  }
  if ((a4 & 0x2000000000000000) != 0)
  {
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    int v11 = v14;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    int v11 = (void *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    int v11 = (void *)sub_22F224448();
  }
  uint64_t result = sub_22F1FB730((uint64_t)v11, a1, a2, a3, a4, a5);
  if (!v5)
  {
    char v15 = v13 & 1;
LABEL_8:
    LOBYTE(v14[0]) = (a4 & 0x1000000000000000) != 0;
  }
  return result;
}

uint64_t sub_22F1FB730(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v10 = a2;
  uint64_t v11 = result;
  uint64_t v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0) {
    LOBYTE(v12) = 1;
  }
  uint64_t v13 = 4 << v12;
  unint64_t v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    uint64_t result = sub_22F1FB4D0(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      int64_t v15 = a2 >> 16;
      if (v14 != v13) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  unint64_t v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0) {
    unint64_t v16 = HIBYTE(a5) & 0xF;
  }
  if (v16 < a2 >> 16) {
    goto LABEL_95;
  }
  uint64_t result = sub_22F223B78();
  int64_t v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    uint64_t result = sub_22F1FB4D0(v10, a4, a5);
    unint64_t v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    uint64_t result = sub_22F1FB4D0(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0) {
      goto LABEL_8;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    uint64_t result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  unint64_t v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0) {
    unint64_t v17 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (v17 < v10 >> 16) {
    goto LABEL_91;
  }
  if (v17 < a3 >> 16)
  {
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  uint64_t result = sub_22F223B78();
LABEL_21:
  int64_t v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_90;
  }
  if (v18 < v15)
  {
LABEL_90:
    __break(1u);
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  char v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11) {
    char v19 = 0;
  }
  int v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        unsigned __int8 v31 = a6 + 48;
        unsigned __int8 v32 = a6 + 55;
        unsigned __int8 v33 = a6 + 87;
        if (a6 > 10)
        {
          unsigned __int8 v31 = 58;
        }
        else
        {
          unsigned __int8 v33 = 97;
          unsigned __int8 v32 = 65;
        }
        if (v19)
        {
          uint64_t v24 = 0;
          unint64_t v34 = v19 + 1;
          uint64_t v35 = result - 1;
          do
          {
            unsigned int v36 = *v34;
            if (v36 < 0x30 || v36 >= v31)
            {
              if (v36 < 0x41 || v36 >= v32)
              {
                uint64_t v29 = 0;
                if (v36 < 0x61 || v36 >= v33) {
                  return v29;
                }
                char v37 = -87;
              }
              else
              {
                char v37 = -55;
              }
            }
            else
            {
              char v37 = -48;
            }
            uint64_t v38 = v24 * a6;
            if ((unsigned __int128)(v24 * (__int128)a6) >> 64 != (v24 * a6) >> 63) {
              return 0;
            }
            uint64_t v24 = v38 + (v36 + v37);
            if (__OFADD__(v38, (v36 + v37))) {
              return 0;
            }
            ++v34;
            --v35;
          }
          while (v35);
          return v24;
        }
        return 0;
      }
      return 0;
    }
    goto LABEL_94;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      unsigned __int8 v39 = a6 + 48;
      unsigned __int8 v40 = a6 + 55;
      unsigned __int8 v41 = a6 + 87;
      if (a6 > 10)
      {
        unsigned __int8 v39 = 58;
      }
      else
      {
        unsigned __int8 v41 = 97;
        unsigned __int8 v40 = 65;
      }
      if (v19)
      {
        uint64_t v42 = 0;
        do
        {
          unsigned int v43 = *v19;
          if (v43 < 0x30 || v43 >= v39)
          {
            if (v43 < 0x41 || v43 >= v40)
            {
              uint64_t v29 = 0;
              if (v43 < 0x61 || v43 >= v41) {
                return v29;
              }
              char v44 = -87;
            }
            else
            {
              char v44 = -55;
            }
          }
          else
          {
            char v44 = -48;
          }
          uint64_t v45 = v42 * a6;
          if ((unsigned __int128)(v42 * (__int128)a6) >> 64 != (v42 * a6) >> 63) {
            return 0;
          }
          uint64_t v42 = v45 + (v43 + v44);
          if (__OFADD__(v45, (v43 + v44))) {
            return 0;
          }
          ++v19;
          --result;
        }
        while (result);
        return v45 + (v43 + v44);
      }
      return 0;
    }
    return 0;
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      unsigned __int8 v21 = a6 + 48;
      unsigned __int8 v22 = a6 + 55;
      unsigned __int8 v23 = a6 + 87;
      if (a6 > 10)
      {
        unsigned __int8 v21 = 58;
      }
      else
      {
        unsigned __int8 v23 = 97;
        unsigned __int8 v22 = 65;
      }
      if (v19)
      {
        uint64_t v24 = 0;
        unsigned __int8 v25 = v19 + 1;
        uint64_t v26 = result - 1;
        while (1)
        {
          unsigned int v27 = *v25;
          if (v27 < 0x30 || v27 >= v21)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              uint64_t v29 = 0;
              if (v27 < 0x61 || v27 >= v23) {
                return v29;
              }
              char v28 = -87;
            }
            else
            {
              char v28 = -55;
            }
          }
          else
          {
            char v28 = -48;
          }
          uint64_t v30 = v24 * a6;
          if ((unsigned __int128)(v24 * (__int128)a6) >> 64 != (v24 * a6) >> 63) {
            return 0;
          }
          uint64_t v24 = v30 - (v27 + v28);
          if (__OFSUB__(v30, (v27 + v28))) {
            return 0;
          }
          ++v25;
          if (!--v26) {
            return v24;
          }
        }
      }
      return 0;
    }
    return 0;
  }
LABEL_93:
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
  return result;
}

uint64_t _sSo8UIDeviceC17MeasureFoundationE12DeviceFamilyO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0 = sub_22F224628();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

unint64_t sub_22F1FBBA8()
{
  unint64_t result = qword_268695BA0;
  if (!qword_268695BA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695BA0);
  }
  return result;
}

unint64_t sub_22F1FBC00()
{
  unint64_t result = qword_268695BA8;
  if (!qword_268695BA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268695BB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695BA8);
  }
  return result;
}

unsigned char *_s12DeviceFamilyOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22F1FBD28);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UIDevice.DeviceFamily()
{
  return &type metadata for UIDevice.DeviceFamily;
}

uint64_t sub_22F1FBD60()
{
  return MEMORY[0x270FA0238](v0, 272, 7);
}

uint64_t sub_22F1FBD70(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268695BC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22F1FBDD0(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_22F224738() & 1;
  }
}

unint64_t sub_22F1FBE28()
{
  unint64_t result = qword_268695BC8;
  if (!qword_268695BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695BC8);
  }
  return result;
}

uint64_t sub_22F1FBE7C()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22F1FBEB4()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

UIImage_optional __swiftcall UIImage.init(color:size:)(UIColor color, CGSize size)
{
  CGFloat height = size.height;
  CGFloat width = size.width;
  UIGraphicsBeginImageContextWithOptions(size, 0, 0.0);
  [(objc_class *)color.super.isa setFill];
  v12.origin.float x = 0.0;
  v12.origin.float y = 0.0;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  UIRectFill(v12);
  uint64_t v5 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  if (!v5) {
    goto LABEL_5;
  }
  unsigned int v6 = [(UIImage *)v5 CGImage];
  if (!v6)
  {

LABEL_5:
    uint64_t v8 = 0;
    goto LABEL_6;
  }
  uint64_t v7 = v6;
  uint64_t v8 = (objc_class *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCGImage_, v6);

LABEL_6:
  unint64_t v10 = v8;
  result.value.super.isa = v10;
  result.is_nil = v9;
  return result;
}

id sub_22F1FBFA4()
{
  id result = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00628]), sel_init);
  qword_268695BD8 = (uint64_t)result;
  return result;
}

UIImage_optional __swiftcall UIImage.rotated(to:)(UIDeviceOrientation to)
{
  if (to != UIDeviceOrientationPortrait)
  {
    id v5 = objc_msgSend(v1, sel_CGImage);
    if (v5)
    {
      unsigned int v6 = v5;
      if ((unint64_t)(to - 2) > 2) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = dword_22F22A890[to - 2];
      }
      id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00650]), sel_initWithCGImage_, v5);
      id v9 = objc_msgSend(v8, sel_imageByApplyingCGOrientation_, v7);

      if (qword_2686944F8 != -1) {
        swift_once();
      }
      unint64_t v10 = (void *)qword_268695BD8;
      objc_msgSend(v9, sel_extent);
      id v11 = objc_msgSend(v10, sel_createCGImage_fromRect_, v9);
      if (v11)
      {
        CGRect v12 = v11;
        objc_msgSend(v1, sel_scale);
        id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_initWithCGImage_scale_orientation_, v12, 0, v13);

        goto LABEL_13;
      }
    }
    id v1 = 0;
    goto LABEL_13;
  }
  id v2 = v1;
LABEL_13:
  unint64_t v14 = (objc_class *)v1;
  result.value.super.isa = v14;
  result.is_nil = v3;
  return result;
}

uint64_t static NSUserDefaults.observe(observer:keys:)(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (v2)
  {
    uint64_t v4 = result;
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    swift_bridgeObjectRetain();
    uint64_t v6 = a2 + 40;
    do
    {
      swift_bridgeObjectRetain();
      id v7 = objc_msgSend(ObjCClassFromMetadata, sel_standardUserDefaults);
      id v8 = (void *)sub_22F223A98();
      swift_bridgeObjectRelease();
      objc_msgSend(v7, sel_addObserver_forKeyPath_options_context_, v4, v8, 1, 0);

      v6 += 16;
      --v2;
    }
    while (v2);
    return swift_bridgeObjectRelease();
  }
  return result;
}

id static NSUserDefaults.update<A>(_:key:feature:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v28 = a3;
  uint64_t v29 = a4;
  uint64_t v30 = a1;
  uint64_t v31 = *(void *)(a6 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = sub_22F2241F8();
  uint64_t v26 = *(void *)(v8 - 8);
  uint64_t v27 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  unsigned __int8 v25 = (char *)&v24 - v10;
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  unint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v12);
  MEMORY[0x270FA5388](v16);
  int64_t v18 = (char *)&v24 - v17;
  id v19 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_standardUserDefaults);
  int v20 = (void *)sub_22F223A98();
  id v21 = objc_msgSend(v19, sel_BOOLForKey_, v20);

  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v29, a5);
  swift_dynamicCast();
  if (v21)
  {
    sub_22F224288();
  }
  else
  {
    unsigned __int8 v22 = v25;
    sub_22F224298();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v27);
  }
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, AssociatedTypeWitness);
  return v21;
}

uint64_t static NSUserDefaults.createOptionSet<A>(keyForFeature:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *(void *)(a3 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  int64_t v62 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  float64x2_t v51 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v50 = (char *)&v46 - v11;
  uint64_t v12 = *(void *)(a2 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v49 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v46 - v15;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v61 = sub_22F2241F8();
  uint64_t v18 = *(void *)(v61 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v61);
  id v21 = (char *)&v46 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  unsigned __int8 v23 = (char *)&v46 - v22;
  uint64_t v53 = v7;
  swift_getAssociatedTypeWitness();
  sub_22F223D38();
  uint64_t v54 = a4;
  sub_22F2246F8();
  uint64_t v24 = *(void *)(a1 + 64);
  uint64_t v47 = a1 + 64;
  uint64_t v25 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v26 = -1;
  if (v25 < 64) {
    uint64_t v26 = ~(-1 << v25);
  }
  unint64_t v27 = v26 & v24;
  uint64_t v60 = TupleTypeMetadata2 - 8;
  float64x2_t v63 = (void (**)(char *, char *, uint64_t))(v12 + 16);
  uint64_t v28 = (void (**)(char *, char *, uint64_t))(v18 + 32);
  int64_t v55 = (unint64_t)(v25 + 63) >> 6;
  uint64_t v56 = v12;
  int64x2_t v58 = (uint64_t (**)(char *, uint64_t))(v12 + 8);
  uint64_t v59 = (void (**)(char *, char *, uint64_t))(v12 + 32);
  uint64_t v48 = (void (**)(char *, uint64_t))(v62 + 8);
  int64_t v46 = v55 - 1;
  uint64_t v57 = a1;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v62 = 0;
  while (1)
  {
    if (v27)
    {
      unint64_t v30 = __clz(__rbit64(v27));
      v27 &= v27 - 1;
      unint64_t v31 = v30 | (v62 << 6);
      goto LABEL_7;
    }
    int64_t v36 = v62 + 1;
    if (__OFADD__(v62, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v36 < v55)
    {
      unint64_t v37 = *(void *)(v47 + 8 * v36);
      if (v37) {
        goto LABEL_11;
      }
      int64_t v38 = v62 + 2;
      ++v62;
      if (v36 + 1 < v55)
      {
        unint64_t v37 = *(void *)(v47 + 8 * v38);
        if (v37)
        {
          ++v36;
          goto LABEL_11;
        }
        int64_t v39 = v36 + 2;
        int64_t v62 = v36 + 1;
        if (v36 + 2 < v55) {
          break;
        }
      }
    }
LABEL_23:
    uint64_t v35 = *(void *)(TupleTypeMetadata2 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56))(v21, 1, 1, TupleTypeMetadata2);
    unint64_t v27 = 0;
LABEL_24:
    (*v28)(v23, v21, v61);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v23, 1, TupleTypeMetadata2) == 1) {
      return swift_release();
    }
    (*v59)(v16, &v23[*(int *)(TupleTypeMetadata2 + 48)], a2);
    unsigned __int8 v40 = v16;
    id v41 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_standardUserDefaults);
    uint64_t v42 = (void *)sub_22F223A98();
    swift_bridgeObjectRelease();
    unsigned int v43 = objc_msgSend(v41, sel_BOOLForKey_, v42);

    if (v43)
    {
      (*v63)(v49, v40, a2);
      uint64_t v44 = AssociatedTypeWitness;
      swift_dynamicCast();
      uint64_t v45 = v50;
      sub_22F224288();
      (*v48)(v45, v44);
    }
    uint64_t result = (*v58)(v40, a2);
    uint64_t v16 = v40;
  }
  unint64_t v37 = *(void *)(v47 + 8 * v39);
  if (v37)
  {
    v36 += 2;
LABEL_11:
    unint64_t v27 = (v37 - 1) & v37;
    unint64_t v31 = __clz(__rbit64(v37)) + (v36 << 6);
    int64_t v62 = v36;
LABEL_7:
    uint64_t v32 = *(void *)(v57 + 56);
    unsigned __int8 v33 = (void *)(*(void *)(v57 + 48) + 16 * v31);
    uint64_t v34 = v33[1];
    *(void *)id v21 = *v33;
    *((void *)v21 + 1) = v34;
    (*(void (**)(char *, unint64_t, uint64_t))(v56 + 16))(&v21[*(int *)(TupleTypeMetadata2 + 48)], v32 + *(void *)(v56 + 72) * v31, a2);
    uint64_t v35 = *(void *)(TupleTypeMetadata2 - 8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v21, 0, 1, TupleTypeMetadata2);
    swift_bridgeObjectRetain();
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v36 = v39 + 1;
    if (__OFADD__(v39, 1)) {
      break;
    }
    if (v36 >= v55)
    {
      int64_t v62 = v46;
      goto LABEL_23;
    }
    unint64_t v37 = *(void *)(v47 + 8 * v36);
    ++v39;
    if (v37) {
      goto LABEL_11;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

unint64_t sub_22F1FCBD4()
{
  id v0 = objc_msgSend(self, sel_standardUserDefaults);
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_integerForKey_, v1);

  unint64_t result = _s17MeasureFoundation18RecordReplayOptionO8rawValueACSgSi_tcfC_0((unint64_t)v2);
  if (result == 5) {
    __break(1u);
  }
  else {
    static NSUserDefaults.recordReplayOption = result;
  }
  return result;
}

char *NSUserDefaults.recordReplayOption.unsafeMutableAddressor()
{
  if (qword_268694500 != -1) {
    swift_once();
  }
  return &static NSUserDefaults.recordReplayOption;
}

uint64_t static NSUserDefaults.recordReplayOption.getter()
{
  if (qword_268694500 != -1) {
    swift_once();
  }
  return static NSUserDefaults.recordReplayOption;
}

size_t static vImage_Buffer.make(width:height:rowBytes:allocating:)(size_t result, uint64_t a2, int64_t a3, char a4, char a5)
{
  if ((a4 & 1) != 0 && (a3 = result, (result & 0x8000000000000000) != 0))
  {
    __break(1u);
  }
  else
  {
    if ((a5 & 1) == 0) {
      return 0;
    }
    if ((a2 & 0x8000000000000000) == 0)
    {
      unint64_t result = a2 * a3;
      if ((unsigned __int128)(a2 * (__int128)a3) >> 64 == (a2 * a3) >> 63) {
        return (size_t)malloc(result);
      }
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
  return result;
}

{
  if (((a2 | result) & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if (a4) {
      a3 = result;
    }
    if ((a5 & 1) == 0) {
      return 0;
    }
    unint64_t result = a2 * a3;
    if ((unsigned __int128)(a2 * (__int128)a3) >> 64 == (a2 * a3) >> 63) {
      return (size_t)malloc(result);
    }
  }
  __break(1u);
  return result;
}

uint64_t static vImage_Buffer.wrap(pixelBuffer:planeIndex:srcRect:)@<X0>(__CVBuffer *a1@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_22F1FE7D4(a1, a2, a3, (uint64_t)v6);
  return sub_22F1899D0((uint64_t)v6, a4, &qword_268694B90);
}

Swift::Void __swiftcall vImage_Buffer.deallocate()()
{
  if (!*v0) {
    __break(1u);
  }
  JUMPOUT(0x230FB40E0);
}

uint64_t static vImage_Buffer.makeKernel(width:height:value:)(uint64_t result, uint64_t a2, char a3, unsigned int a4)
{
  if (a3) {
    a2 = result;
  }
  unint64_t v5 = result * a2;
  if ((unsigned __int128)(result * (__int128)a2) >> 64 != (result * a2) >> 63)
  {
    __break(1u);
    goto LABEL_17;
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  if (!v5) {
    return MEMORY[0x263F8EE78];
  }
  unint64_t result = sub_22F223D48();
  *(void *)(result + 16) = v5;
  uint64_t v7 = (_WORD *)(result + 32);
  if (v5 < 0x10)
  {
    unint64_t v8 = 0;
LABEL_13:
    unint64_t v12 = v5 - v8;
    do
    {
      *v7++ = a4;
      --v12;
    }
    while (v12);
    return result;
  }
  unint64_t v8 = v5 & 0xFFFFFFFFFFFFFFF0;
  v7 += v5 & 0xFFFFFFFFFFFFFFF0;
  int16x8_t v9 = vdupq_n_s16(a4);
  uint64_t v10 = (int16x8_t *)(result + 48);
  unint64_t v11 = v5 & 0xFFFFFFFFFFFFFFF0;
  do
  {
    v10[-1] = v9;
    *uint64_t v10 = v9;
    v10 += 2;
    v11 -= 16;
  }
  while (v11);
  if (v5 != v8) {
    goto LABEL_13;
  }
  return result;
}

void *static vImage_Buffer.makeTempBufferForConvolvePlanar8(srcImageBuffer:kernel:kernelWidth:kernelHeight:divisor:flags:)(void *a1, vImagePixelCount a2, vImagePixelCount a3, size_t a4, uint64_t a5, uint64_t kernel_width, uint64_t a7, char a8, int32_t divisor, uint64_t a10)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a8) {
    a7 = kernel_width;
  }
  dest.data = a1;
  dest.CGFloat height = a2;
  dest.CGFloat width = a3;
  dest.rowBytes = a4;
  if (a7 > 0xFFFFFFFFLL)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (kernel_width > 0xFFFFFFFFLL)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if ((a10 | kernel_width | a7) < 0)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
  }
  if ((a10 | 0x80) > 0xFFFFFFFFLL) {
    goto LABEL_14;
  }
  vImage_Error v10 = vImageConvolve_Planar8(&dest, &dest, 0, 0, 0, (const int16_t *)(a5 + 32), a7, kernel_width, divisor, 0, a10 | 0x80);
  if (v10 < 1) {
    return 0;
  }
  else {
    return malloc(v10);
  }
}

uint64_t static vImage_Buffer.scalePlanar8(srcImageBuffer:dstImageBuffer:dstRect:flags:tempBuffer:)@<X0>(void *a1@<X0>, vImagePixelCount a2@<X1>, vImagePixelCount a3@<X2>, size_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, size_t a8@<X7>, uint64_t a9@<X8>, CGFloat a10@<D0>, CGFloat a11@<D1>, CGFloat a12@<D2>, CGFloat a13@<D3>, unint64_t flags, void *a15)
{
  sub_22F1FEBF8(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)v17, a10, a11, a12, a13, flags, a15);
  return sub_22F1899D0((uint64_t)v17, a9, &qword_268694B90);
}

uint64_t static vImage_Buffer.scalePlanar8(srcImageBuffer:dstImageBuffer:scaleFactor:flags:tempBuffer:)@<X0>(void *a1@<X0>, vImagePixelCount a2@<X1>, int64_t a3@<X2>, int64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, void *a7@<X6>, uint64_t a8@<X8>, float a9@<S0>)
{
  sub_22F1FEEFC(a1, a2, a3, a4, a5, a6, a7, (uint64_t)v11, a9);
  return sub_22F1899D0((uint64_t)v11, a8, &qword_268694B90);
}

void static vImage_Buffer.wrap(srcImageBuffer:srcRect:srcBytesPerPixel:)(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

CGSize __swiftcall vImage_Buffer.getSize()()
{
  double v2 = (double)v1;
  double v3 = (double)v0;
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

void *vImage_Buffer.fill(value:)(void *__c)
{
  uint64_t v2 = *(void *)(v1 + 8);
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = *(void *)(v1 + 24);
    if ((unsigned __int128)(v3 * (__int128)v2) >> 64 == (v3 * v2) >> 63)
    {
      uint64_t v4 = *(void **)v1;
      memset(*(void **)v1, (int)__c, v3 * v2);
      return v4;
    }
  }
  __break(1u);
  return __c;
}

const void *vImage_Buffer.clone()(const void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    size_t v4 = a2 * a4;
    if ((unsigned __int128)(a2 * (__int128)a4) >> 64 == (a2 * a4) >> 63)
    {
      unint64_t v5 = result;
      uint64_t v6 = malloc(a2 * a4);
      memcpy(v6, v5, v4);
      return v6;
    }
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall vImage_Buffer.printPixels(prefix:offsetValue:)(Swift::String prefix, Swift::Int offsetValue)
{
  uint64_t v20 = v3;
  if (v3)
  {
    unint64_t v6 = v5;
    if ((v5 & 0x8000000000000000) != 0)
    {
LABEL_21:
      __break(1u);
    }
    else
    {
      uint64_t v7 = v4;
      uint64_t v8 = v2;
      uint64_t v21 = 0;
      char v10 = 0;
      unint64_t v11 = 0;
      uint64_t v12 = MEMORY[0x263F8D6C8];
      uint64_t v13 = MEMORY[0x263F8D750];
      uint64_t v18 = v4;
      unint64_t v19 = v5;
      do
      {
        if (!is_mul_ok(v11, v6)) {
          goto LABEL_20;
        }
        if (v10) {
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRetain();
        if (v7)
        {
          uint64_t v14 = v21;
          while ((v14 & 0x8000000000000000) == 0)
          {
            uint64_t v15 = *(unsigned __int8 *)(v8 + v14);
            Swift::Int v16 = v15 + offsetValue;
            if (__OFADD__(v15, offsetValue)) {
              goto LABEL_19;
            }
            __swift_instantiateConcreteTypeFromMangledName(&qword_268694980);
            uint64_t v17 = swift_allocObject();
            *(_OWORD *)(v17 + 16) = xmmword_22F227140;
            *(void *)(v17 + 56) = v12;
            *(void *)(v17 + 64) = v13;
            *(void *)(v17 + 32) = v16;
            sub_22F223AD8();
            sub_22F223B48();
            swift_bridgeObjectRelease();
            ++v14;
            if (!--v7)
            {
              uint64_t v7 = v18;
              unint64_t v6 = v19;
              goto LABEL_4;
            }
          }
          __break(1u);
LABEL_19:
          __break(1u);
LABEL_20:
          __break(1u);
          goto LABEL_21;
        }
LABEL_4:
        ++v11;
        swift_bridgeObjectRetain();
        sub_22F223858();
        swift_bridgeObjectRelease();
        v21 += v6;
        char v10 = 1;
      }
      while (v11 != v20);
      swift_bridgeObjectRelease();
    }
  }
}

char *vImage_Buffer.draw(onto:offsetX:offsetY:bytesPerPixel:)(char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v22 = result;
  if (a9)
  {
    uint64_t v13 = 0;
    BOOL v14 = (unsigned __int128)(a5 * (__int128)a7) >> 64 != (a5 * a7) >> 63;
    uint64_t v15 = &result[a5 * a7];
    size_t v16 = a10 * a7;
    BOOL v17 = (unsigned __int128)(a10 * (__int128)a7) >> 64 != (a10 * a7) >> 63;
    while (v22)
    {
      if (v13 == 0x8000000000000000)
      {
        __break(1u);
LABEL_15:
        __break(1u);
LABEL_16:
        __break(1u);
LABEL_17:
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
        break;
      }
      uint64_t v18 = v13 + a6;
      if (__OFADD__(v13, a6)) {
        goto LABEL_15;
      }
      uint64_t v19 = v18 * a4;
      if ((unsigned __int128)(v18 * (__int128)a4) >> 64 != (v18 * a4) >> 63) {
        goto LABEL_16;
      }
      if (v14) {
        goto LABEL_17;
      }
      if (!a8) {
        goto LABEL_22;
      }
      uint64_t v20 = v13 * a11;
      if ((unsigned __int128)(v13 * (__int128)a11) >> 64 != (v13 * a11) >> 63) {
        goto LABEL_18;
      }
      if (a10 < 0) {
        goto LABEL_19;
      }
      if (v17) {
        goto LABEL_20;
      }
      ++v13;
      CGSize result = (char *)memcpy(&v15[v19], (const void *)(a8 + v20), v16);
      if (a9 == v13) {
        return result;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  return result;
}

void vImage_Buffer.draw(onto:within:bytesPerPixel:)(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (a12 < 0)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  double Width = CGRectGetWidth(*(CGRect *)&a2);
  if ((~*(void *)&Width & 0x7FF0000000000000) == 0)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if (Width <= -9.22337204e18)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  if (Width >= 9.22337204e18)
  {
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  if ((uint64_t)Width >= a12) {
    uint64_t v24 = a12;
  }
  else {
    uint64_t v24 = (uint64_t)Width;
  }
  if (a11 < 0) {
    goto LABEL_50;
  }
  v34.origin.float x = a2;
  v34.origin.float y = a3;
  v34.size.CGFloat width = a4;
  v34.size.CGFloat height = a5;
  double Height = CGRectGetHeight(v34);
  if ((~*(void *)&Height & 0x7FF0000000000000) == 0)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  if (Height <= -9.22337204e18)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  if (Height < 9.22337204e18)
  {
    if ((uint64_t)Height >= a11) {
      uint64_t v26 = a11;
    }
    else {
      uint64_t v26 = (uint64_t)Height;
    }
    if (v26 < 0) {
      goto LABEL_54;
    }
    if (!v26) {
      return;
    }
    uint64_t v27 = 0;
    while (v26 != v27)
    {
      if (!a1) {
        goto LABEL_55;
      }
      v35.origin.float x = a2;
      v35.origin.float y = a3;
      v35.size.CGFloat width = a4;
      v35.size.CGFloat height = a5;
      double MinY = CGRectGetMinY(v35);
      if ((~*(void *)&MinY & 0x7FF0000000000000) == 0) {
        goto LABEL_35;
      }
      if (MinY <= -9.22337204e18) {
        goto LABEL_36;
      }
      if (MinY >= 9.22337204e18) {
        goto LABEL_37;
      }
      uint64_t v29 = v27 + (uint64_t)MinY;
      if (__OFADD__(v27, (uint64_t)MinY)) {
        goto LABEL_38;
      }
      uint64_t v30 = v29 * a8;
      if ((unsigned __int128)(v29 * (__int128)a8) >> 64 != (v29 * a8) >> 63) {
        goto LABEL_39;
      }
      v36.origin.float x = a2;
      v36.origin.float y = a3;
      v36.size.CGFloat width = a4;
      v36.size.CGFloat height = a5;
      double MinX = CGRectGetMinX(v36);
      if ((~*(void *)&MinX & 0x7FF0000000000000) == 0) {
        goto LABEL_40;
      }
      if (MinX <= -9.22337204e18) {
        goto LABEL_41;
      }
      if (MinX >= 9.22337204e18) {
        goto LABEL_42;
      }
      uint64_t v32 = (uint64_t)MinX * a9;
      if ((unsigned __int128)((uint64_t)MinX * (__int128)a9) >> 64 != v32 >> 63) {
        goto LABEL_43;
      }
      if (!a10) {
        goto LABEL_56;
      }
      uint64_t v33 = v27 * a13;
      if ((unsigned __int128)(v27 * (__int128)a13) >> 64 != (v27 * a13) >> 63) {
        goto LABEL_44;
      }
      if ((unsigned __int128)(v24 * (__int128)a9) >> 64 != (v24 * a9) >> 63) {
        goto LABEL_45;
      }
      ++v27;
      memcpy((void *)(a1 + v30 + v32), (const void *)(a10 + v33), v24 * a9);
      if (v26 == v27) {
        return;
      }
    }
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
}

uint64_t static vImage_Buffer.wrap(ioSurface:planeIndex:srcRect:)@<X0>(__IOSurface *a1@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint32_t seed = 0;
  IOSurfaceLock(a1, 2u, &seed);
  BaseAddressOfPlane = (char *)IOSurfaceGetBaseAddressOfPlane(a1, a2);
  int64_t WidthOfPlane = IOSurfaceGetWidthOfPlane(a1, a2);
  int64_t HeightOfPlane = IOSurfaceGetHeightOfPlane(a1, a2);
  int64_t BytesPerRowOfPlane = IOSurfaceGetBytesPerRowOfPlane(a1, a2);
  sub_22F1899D0(a3, (uint64_t)&v27, &qword_268695448);
  if (v28) {
    double Width = (double)WidthOfPlane;
  }
  else {
    double Width = CGRectGetWidth(v27);
  }
  if ((~*(void *)&Width & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (Width <= -1.0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (Width >= 1.84467441e19)
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  sub_22F1899D0(a3, (uint64_t)&v25, &qword_268695448);
  if (v26) {
    double Height = (double)HeightOfPlane;
  }
  else {
    double Height = CGRectGetHeight(v25);
  }
  if ((~*(void *)&Height & 0x7FF0000000000000) == 0) {
    goto LABEL_28;
  }
  if (Height <= -1.0)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (Height >= 1.84467441e19)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  sub_22F1899D0(a3, (uint64_t)v23, &qword_268695448);
  if ((v24 & 1) == 0)
  {
    double v14 = *(double *)v23;
    double v15 = *(double *)&v23[1];
    int64_t BytesPerElementOfPlane = IOSurfaceGetBytesPerElementOfPlane(a1, a2);
    if (v15 > -9.22337204e18)
    {
      if (v15 < 9.22337204e18)
      {
        uint64_t v17 = (uint64_t)v15 * BytesPerRowOfPlane;
        if ((unsigned __int128)((uint64_t)v15 * (__int128)BytesPerRowOfPlane) >> 64 == v17 >> 63)
        {
          if ((~*(void *)&v14 & 0x7FF0000000000000) != 0
            && (*(void *)&v15 & 0x7FF0000000000000) != 0x7FF0000000000000)
          {
            if (v14 > -9.22337204e18)
            {
              if (v14 < 9.22337204e18)
              {
                uint64_t v18 = (uint64_t)v14 * BytesPerElementOfPlane;
                if ((unsigned __int128)((uint64_t)v14 * (__int128)BytesPerElementOfPlane) >> 64 == v18 >> 63)
                {
                  BOOL v19 = __OFADD__(v17, v18);
                  uint64_t v20 = v17 + v18;
                  if (!v19)
                  {
                    BaseAddressOfPlane += v20;
                    goto LABEL_24;
                  }
LABEL_38:
                  __break(1u);
                }
LABEL_37:
                __break(1u);
                goto LABEL_38;
              }
LABEL_36:
              __break(1u);
              goto LABEL_37;
            }
LABEL_35:
            __break(1u);
            goto LABEL_36;
          }
LABEL_34:
          __break(1u);
          goto LABEL_35;
        }
LABEL_33:
        __break(1u);
        goto LABEL_34;
      }
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
LABEL_24:
  uint64_t result = IOSurfaceUnlock(a1, 2u, &seed);
  *(void *)a4 = BaseAddressOfPlane;
  *(void *)(a4 + 8) = (unint64_t)Height;
  *(void *)(a4 + 16) = (unint64_t)Width;
  *(void *)(a4 + 24) = BytesPerRowOfPlane;
  *(unsigned char *)(a4 + 32) = 0;
  return result;
}

void static vImage_Buffer.wrap(mtlTexture:srcRect:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v6 = objc_msgSend(a1, sel_buffer);
  if (!v6)
  {
    unint64_t v11 = 0;
    unint64_t v12 = 0;
    unint64_t v13 = 0;
    uint64_t v9 = 0;
LABEL_30:
    *(void *)a3 = v11;
    *(void *)(a3 + 8) = v12;
    *(void *)(a3 + 16) = v13;
    *(void *)(a3 + 24) = v9;
    *(unsigned char *)(a3 + 32) = v6 == 0;
    return;
  }
  uint64_t v7 = (uint64_t)objc_msgSend(a1, sel_width);
  id v8 = objc_msgSend(a1, sel_height);
  uint64_t v9 = (uint64_t)objc_msgSend(a1, sel_bufferBytesPerRow);
  sub_22F1899D0(a2, (uint64_t)&v27, &qword_268695448);
  if (v28) {
    double Width = (double)v7;
  }
  else {
    double Width = CGRectGetWidth(v27);
  }
  if ((~*(void *)&Width & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_32;
  }
  if (Width <= -1.0)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if (Width >= 1.84467441e19)
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  sub_22F1899D0(a2, (uint64_t)&v25, &qword_268695448);
  if (v26) {
    double Height = (double)(uint64_t)v8;
  }
  else {
    double Height = CGRectGetHeight(v25);
  }
  if ((~*(void *)&Height & 0x7FF0000000000000) == 0) {
    goto LABEL_34;
  }
  if (Height <= -1.0)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (Height >= 1.84467441e19)
  {
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  id v15 = objc_msgSend((id)swift_unknownObjectRetain(), sel_contents);
  id v16 = v6;
  uint64_t v17 = (char *)objc_msgSend(a1, sel_bufferOffset);
  swift_unknownObjectRelease();
  unint64_t v11 = &v17[(void)v15];
  sub_22F1899D0(a2, (uint64_t)&v22, &qword_268695448);
  if (v24)
  {
LABEL_29:
    unint64_t v13 = (unint64_t)Width;
    unint64_t v12 = (unint64_t)Height;
    goto LABEL_30;
  }
  if (!v7) {
    goto LABEL_37;
  }
  if (v9 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_46;
  }
  if (v23 <= -9.22337204e18) {
    goto LABEL_38;
  }
  if (v23 >= 9.22337204e18)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  uint64_t v18 = (uint64_t)v23 * v9;
  if ((unsigned __int128)((uint64_t)v23 * (__int128)v9) >> 64 != v18 >> 63)
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if ((~*(void *)&v22 & 0x7FF0000000000000) == 0
    || (*(void *)&v23 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_41;
  }
  if (v22 <= -9.22337204e18)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (v22 >= 9.22337204e18)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  uint64_t v19 = (uint64_t)v22 * (v9 / v7);
  if ((unsigned __int128)((uint64_t)v22 * (__int128)(v9 / v7)) >> 64 == v19 >> 63)
  {
    BOOL v20 = __OFADD__(v18, v19);
    uint64_t v21 = v18 + v19;
    if (!v20)
    {
      v11 += v21;
      goto LABEL_29;
    }
    goto LABEL_45;
  }
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
}

void *static vImage_Buffer.makeTempBufferForScaleARGB(srcImageBuffer:is128Bit:scaleFactor:flags:)(void *a1, vImagePixelCount a2, int64_t a3, int64_t a4, char a5, uint64_t a6, float a7)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  src.data = a1;
  src.CGFloat height = a2;
  src.CGFloat width = a3;
  src.rowBytes = a4;
  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (!a3)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  dest.data = 0;
  float v7 = roundf((float)(unint64_t)a3 * a7);
  if ((~LODWORD(v7) & 0x7F800000) == 0)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v7 <= -1.0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v7 >= 1.8447e19)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  int64_t v8 = (unint64_t)v7;
  dest.CGFloat width = (unint64_t)v7;
  float v9 = roundf((float)a2 * a7);
  if ((~LODWORD(v9) & 0x7F800000) == 0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v9 <= -1.0)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v9 >= 1.8447e19)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  dest.CGFloat height = (unint64_t)v9;
  if (v8 < 0)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if ((unsigned __int128)(a4 / a3 * (__int128)v8) >> 64 != (a4 / a3 * v8) >> 63)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  dest.rowBytes = a4 / a3 * v8;
  uint64_t v10 = a6 | 0x80;
  if ((a5 & 1) == 0)
  {
    if ((a6 & 0x8000000000000000) == 0)
    {
      if (v10 <= 0xFFFFFFFFLL)
      {
        vImage_Error v11 = vImageScale_ARGB8888(&src, &dest, 0, v10);
        if (v11 < 1) {
          return 0;
        }
        return malloc(v11);
      }
LABEL_34:
      __break(1u);
    }
    goto LABEL_32;
  }
  if (a6 < 0)
  {
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if (v10 > 0xFFFFFFFFLL)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  vImage_Error v11 = vImageScale_ARGBFFFF(&src, &dest, 0, v10);
  if (v11 < 1) {
    return 0;
  }
  return malloc(v11);
}

vImage_Error static vImage_Buffer.scaleARGB(srcImageBuffer:is128Bit:dstImageBuffer:srcRect:dstRect:flags:tempBuffer:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, int64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, unint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, int64_t a10, uint64_t a11, uint64_t a12, unint64_t a13, void *a14)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  src.rowBytes = a4;
  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_66;
  }
  if (!a3)
  {
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  sub_22F1899D0(a11, (uint64_t)&v61, &qword_268695448);
  if (v62) {
    double Width = (double)(unint64_t)a3;
  }
  else {
    double Width = CGRectGetWidth(v61);
  }
  if ((~*(void *)&Width & 0x7FF0000000000000) == 0) {
    goto LABEL_67;
  }
  if (Width <= -1.0)
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  if (Width >= 1.84467441e19)
  {
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  src.CGFloat width = (unint64_t)Width;
  sub_22F1899D0(a11, (uint64_t)&v59, &qword_268695448);
  if (v60) {
    double Height = (double)a2;
  }
  else {
    double Height = CGRectGetHeight(v59);
  }
  if ((~*(void *)&Height & 0x7FF0000000000000) == 0) {
    goto LABEL_70;
  }
  if (Height <= -1.0)
  {
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  if (Height >= 1.84467441e19)
  {
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  src.CGFloat height = (unint64_t)Height;
  sub_22F1899D0(a11, (uint64_t)v56, &qword_268695448);
  double v25 = v57;
  if (v58) {
    double v25 = 0.0;
  }
  if ((~*(void *)&v25 & 0x7FF0000000000000) == 0) {
    goto LABEL_73;
  }
  if (v25 <= -9.22337204e18)
  {
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  if (v25 >= 9.22337204e18)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  uint64_t v26 = (uint64_t)v25 * a4;
  if ((unsigned __int128)((uint64_t)v25 * (__int128)a4) >> 64 != v26 >> 63)
  {
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  sub_22F1899D0(a11, (uint64_t)v54, &qword_268695448);
  double v27 = v54[0];
  if (v55) {
    double v27 = 0.0;
  }
  if ((~*(void *)&v27 & 0x7FF0000000000000) == 0) {
    goto LABEL_77;
  }
  if (v27 <= -9.22337204e18)
  {
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  if (v27 >= 9.22337204e18)
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  uint64_t v28 = a4 / a3;
  uint64_t v29 = (uint64_t)v27 * (a4 / a3);
  if ((unsigned __int128)((uint64_t)v27 * (__int128)(a4 / a3)) >> 64 != v29 >> 63)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  BOOL v30 = __OFADD__(v26, v29);
  uint64_t v31 = v26 + v29;
  if (v30)
  {
LABEL_81:
    __break(1u);
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  if (!a1)
  {
LABEL_101:
    __break(1u);
LABEL_102:
    __break(1u);
  }
  int64_t v32 = a10;
  dest.rowBytes = a10;
  src.data = (void *)(a1 + v31);
  sub_22F1899D0(a12, (uint64_t)&v52, &qword_268695448);
  if (v53) {
    double v33 = (double)a8;
  }
  else {
    double v33 = CGRectGetWidth(v52);
  }
  if ((~*(void *)&v33 & 0x7FF0000000000000) == 0) {
    goto LABEL_82;
  }
  if (v33 <= -1.0)
  {
LABEL_83:
    __break(1u);
    goto LABEL_84;
  }
  if (v33 >= 1.84467441e19)
  {
LABEL_84:
    __break(1u);
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  dest.CGFloat width = (unint64_t)v33;
  sub_22F1899D0(a12, (uint64_t)&v50, &qword_268695448);
  if (v51) {
    double v34 = (double)a7;
  }
  else {
    double v34 = CGRectGetHeight(v50);
  }
  if ((~*(void *)&v34 & 0x7FF0000000000000) == 0) {
    goto LABEL_85;
  }
  if (v34 <= -1.0)
  {
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
  if (v34 >= 1.84467441e19)
  {
LABEL_87:
    __break(1u);
LABEL_88:
    __break(1u);
    goto LABEL_89;
  }
  dest.CGFloat height = (unint64_t)v34;
  sub_22F1899D0(a12, (uint64_t)v47, &qword_268695448);
  double v35 = v48;
  if (v49) {
    double v35 = 0.0;
  }
  if ((~*(void *)&v35 & 0x7FF0000000000000) == 0) {
    goto LABEL_88;
  }
  if (v35 <= -9.22337204e18)
  {
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  if (v35 >= 9.22337204e18)
  {
LABEL_90:
    __break(1u);
    goto LABEL_91;
  }
  uint64_t v36 = (uint64_t)v35 * a10;
  if ((unsigned __int128)((uint64_t)v35 * (__int128)a10) >> 64 != v36 >> 63)
  {
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  sub_22F1899D0(a12, (uint64_t)v45, &qword_268695448);
  double v37 = v45[0];
  if (v46) {
    double v37 = 0.0;
  }
  if ((~*(void *)&v37 & 0x7FF0000000000000) == 0) {
    goto LABEL_92;
  }
  if (v37 <= -9.22337204e18)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  if (v37 >= 9.22337204e18)
  {
LABEL_94:
    __break(1u);
    goto LABEL_95;
  }
  uint64_t v38 = (uint64_t)v37 * v28;
  if ((unsigned __int128)((uint64_t)v37 * (__int128)v28) >> 64 != v38 >> 63)
  {
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  BOOL v30 = __OFADD__(v36, v38);
  uint64_t v39 = v36 + v38;
  if (v30)
  {
LABEL_96:
    __break(1u);
LABEL_97:
    __break(1u);
    goto LABEL_98;
  }
  if (!a6) {
    goto LABEL_102;
  }
  dest.data = (void *)(a6 + v39);
  if (a5)
  {
    if ((a13 & 0x8000000000000000) == 0)
    {
      if (!HIDWORD(a13))
      {
        vImage_Error result = vImageScale_ARGBFFFF(&src, &dest, a14, a13);
        vImage_Error v41 = result;
        if (!result) {
          goto LABEL_64;
        }
        goto LABEL_63;
      }
      goto LABEL_99;
    }
    goto LABEL_97;
  }
  if ((a13 & 0x8000000000000000) != 0)
  {
LABEL_98:
    __break(1u);
LABEL_99:
    __break(1u);
    goto LABEL_100;
  }
  if (HIDWORD(a13))
  {
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  vImage_Error result = vImageScale_ARGB8888(&src, &dest, a14, a13);
  vImage_Error v41 = result;
  if (result)
  {
LABEL_63:
    __swift_instantiateConcreteTypeFromMangledName(&qword_268694B98);
    uint64_t v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_22F227140;
    sub_22F2243F8();
    swift_bridgeObjectRelease();
    sub_22F2246D8();
    sub_22F223B48();
    swift_bridgeObjectRelease();
    *(void *)(v42 + 56) = MEMORY[0x263F8D310];
    *(void *)(v42 + 32) = 0xD00000000000001CLL;
    *(void *)(v42 + 40) = 0x800000022F231D90;
    sub_22F2247C8();
    vImage_Error result = swift_bridgeObjectRelease();
    a6 = 0;
    a7 = 0;
    a8 = 0;
    int64_t v32 = 0;
  }
LABEL_64:
  *(void *)a9 = a6;
  *(void *)(a9 + 8) = a7;
  *(void *)(a9 + 16) = a8;
  *(void *)(a9 + 24) = v32;
  *(unsigned char *)(a9 + 32) = v41 != 0;
  return result;
}

size_t static vImage_Buffer.diff(srcImageBuffer:dstImageBuffer:resultImageBuffer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, size_t a3@<X2>, size_t a4@<X3>, uint64_t a5@<X4>, size_t *a6@<X8>, uint64_t a7)
{
  size_t result = sub_22F1899D0(a7, (uint64_t)v29, &qword_268694B90);
  if (((a3 | a2) & 0x8000000000000000) != 0)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v28 = a6;
  size_t v14 = v29[2];
  size_t v15 = v29[3];
  size_t v17 = v29[0];
  uint64_t v16 = v29[1];
  size_t result = sub_22F1899D0(a7, (uint64_t)v30, &qword_268694B90);
  if (v30[32] != 1)
  {
LABEL_5:
    size_t v18 = 0;
    size_t v19 = 0;
    if (!a2)
    {
LABEL_22:
      *uint64_t v28 = v17;
      v28[1] = v16;
      void v28[2] = v14;
      v28[3] = v15;
      v28[4] = v19;
      v28[5] = v18;
      return result;
    }
    uint64_t v20 = 0;
    while (v20 != (a2 & ~(a2 >> 63)))
    {
      uint64_t v21 = v20 * a4;
      if ((unsigned __int128)(v20 * (__int128)(uint64_t)a4) >> 64 != (uint64_t)(v20 * a4) >> 63) {
        goto LABEL_26;
      }
      if (a3)
      {
        uint64_t v22 = 0;
        while (1)
        {
          uint64_t v23 = v21 + v22;
          if (__OFADD__(v21, v22)) {
            break;
          }
          int v24 = *(unsigned __int8 *)(a5 + v23);
          int v25 = *(unsigned __int8 *)(a1 + v23);
          size_t result = (v24 - v25 + 255) >> 1;
          *(unsigned char *)(v17 + v23) = result;
          if (v24 - v25 >= 0) {
            uint64_t v26 = (v24 - v25);
          }
          else {
            uint64_t v26 = (v25 - v24);
          }
          BOOL v27 = __OFADD__(v19, v26);
          v19 += v26;
          if (v27) {
            goto LABEL_24;
          }
          if (v24 != v25)
          {
            BOOL v27 = __OFADD__(v18++, 1);
            if (v27)
            {
              __break(1u);
              goto LABEL_22;
            }
          }
          if (a3 == ++v22) {
            goto LABEL_7;
          }
        }
        __break(1u);
LABEL_24:
        __break(1u);
        break;
      }
LABEL_7:
      if (++v20 == a2) {
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  size_t result = a2 * a4;
  if ((unsigned __int128)(a2 * (__int128)(uint64_t)a4) >> 64 == (uint64_t)(a2 * a4) >> 63)
  {
    size_t result = (size_t)malloc(result);
    size_t v17 = result;
    uint64_t v16 = a2;
    size_t v14 = a3;
    size_t v15 = a4;
    goto LABEL_5;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t static vImage_Buffer.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5) {
    BOOL v5 = a1 == a5;
  }
  else {
    BOOL v5 = 0;
  }
  unsigned int v6 = v5;
  if (a1) {
    return v6;
  }
  else {
    return a5 == 0;
  }
}

uint64_t vImage_Buffer.hash(into:)(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return sub_22F224808();
  }
  sub_22F224808();
  return sub_22F2247F8();
}

uint64_t vImage_Buffer.hashValue.getter(uint64_t a1)
{
  if (a1) {
    sub_22F2247F8();
  }
  return sub_22F224818();
}

uint64_t sub_22F1FE69C()
{
  uint64_t v1 = *v0;
  sub_22F2247E8();
  sub_22F224808();
  if (v1) {
    sub_22F2247F8();
  }
  return sub_22F224818();
}

uint64_t sub_22F1FE700()
{
  if (!*v0) {
    return sub_22F224808();
  }
  sub_22F224808();
  return sub_22F2247F8();
}

uint64_t sub_22F1FE748()
{
  uint64_t v1 = *v0;
  sub_22F2247E8();
  sub_22F224808();
  if (v1) {
    sub_22F2247F8();
  }
  return sub_22F224818();
}

BOOL sub_22F1FE7A8(void *a1, void *a2)
{
  if (*a1) {
    BOOL v2 = *a2 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    return (*a1 | *a2) == 0;
  }
  else {
    return *a1 == *a2;
  }
}

void sub_22F1FE7D4(__CVBuffer *a1@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a1, a2);
  if (!BaseAddressOfPlane)
  {
    CVPixelBufferUnlockBaseAddress(a1, 1uLL);
    unint64_t v13 = 0;
    unint64_t v14 = 0;
    unint64_t v15 = 0;
    int64_t BytesPerRowOfPlane = 0;
LABEL_30:
    *(void *)a4 = v13;
    *(void *)(a4 + 8) = v14;
    *(void *)(a4 + 16) = v15;
    *(void *)(a4 + 24) = BytesPerRowOfPlane;
    *(unsigned char *)(a4 + 32) = BaseAddressOfPlane == 0;
    return;
  }
  int64_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a1, a2);
  int64_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a1, a2);
  int64_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a1, a2);
  sub_22F1899D0(a3, (uint64_t)&v26, &qword_268695448);
  if (v27) {
    double Width = (double)WidthOfPlane;
  }
  else {
    double Width = CGRectGetWidth(v26);
  }
  if ((~*(void *)&Width & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_32;
  }
  if (Width <= -1.0)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if (Width >= 1.84467441e19)
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  sub_22F1899D0(a3, (uint64_t)&v24, &qword_268695448);
  if (v25) {
    double Height = (double)HeightOfPlane;
  }
  else {
    double Height = CGRectGetHeight(v24);
  }
  if ((~*(void *)&Height & 0x7FF0000000000000) == 0) {
    goto LABEL_34;
  }
  if (Height <= -1.0)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (Height >= 1.84467441e19)
  {
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  sub_22F1899D0(a3, (uint64_t)&v21, &qword_268695448);
  unint64_t v13 = BaseAddressOfPlane;
  if (v23)
  {
LABEL_29:
    unint64_t v15 = (unint64_t)Width;
    unint64_t v14 = (unint64_t)Height;
    CVPixelBufferUnlockBaseAddress(a1, 1uLL);
    goto LABEL_30;
  }
  if (!WidthOfPlane) {
    goto LABEL_37;
  }
  if (BytesPerRowOfPlane == 0x8000000000000000 && WidthOfPlane == -1) {
    goto LABEL_46;
  }
  if (v22 <= -9.22337204e18) {
    goto LABEL_38;
  }
  if (v22 >= 9.22337204e18)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  uint64_t v17 = (uint64_t)v22 * BytesPerRowOfPlane;
  if ((unsigned __int128)((uint64_t)v22 * (__int128)BytesPerRowOfPlane) >> 64 != v17 >> 63)
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if ((~*(void *)&v21 & 0x7FF0000000000000) == 0
    || (*(void *)&v22 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_41;
  }
  if (v21 <= -9.22337204e18)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (v21 >= 9.22337204e18)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  uint64_t v18 = (uint64_t)v21 * (BytesPerRowOfPlane / WidthOfPlane);
  if ((unsigned __int128)((uint64_t)v21 * (__int128)(BytesPerRowOfPlane / WidthOfPlane)) >> 64 == v18 >> 63)
  {
    BOOL v19 = __OFADD__(v17, v18);
    uint64_t v20 = v17 + v18;
    if (!v19)
    {
      unint64_t v13 = &BaseAddressOfPlane[v20];
      goto LABEL_29;
    }
    goto LABEL_45;
  }
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
}

void *_sSo13vImage_BufferV17MeasureFoundationE08makeTempB15ForScalePlanar803srcaB011scaleFactor5flagsSvSgAB_SfSitFZ_0(void *a1, vImagePixelCount a2, int64_t a3, int64_t a4, uint64_t a5, float a6)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  src.data = a1;
  src.CGFloat height = a2;
  src.CGFloat width = a3;
  src.rowBytes = a4;
  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (!a3)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  dest.data = 0;
  float v6 = roundf((float)(unint64_t)a3 * a6);
  if ((~LODWORD(v6) & 0x7F800000) == 0)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v6 <= -1.0)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v6 >= 1.8447e19)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  int64_t v7 = (unint64_t)v6;
  dest.CGFloat width = (unint64_t)v6;
  float v8 = roundf((float)a2 * a6);
  if ((~LODWORD(v8) & 0x7F800000) == 0)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v8 <= -1.0)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v8 >= 1.8447e19)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  dest.CGFloat height = (unint64_t)v8;
  if (v7 < 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if ((unsigned __int128)(a4 / a3 * (__int128)v7) >> 64 != (a4 / a3 * v7) >> 63)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  dest.rowBytes = a4 / a3 * v7;
  if (a5 < 0)
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
  }
  if ((a5 | 0x80) > 0xFFFFFFFFLL) {
    goto LABEL_28;
  }
  vImage_Error v9 = vImageScale_Planar8(&src, &dest, 0, a5 | 0x80);
  if (v9 < 1) {
    return 0;
  }
  else {
    return malloc(v9);
  }
}

vImage_Error sub_22F1FEBF8@<X0>(void *a1@<X0>, vImagePixelCount a2@<X1>, vImagePixelCount a3@<X2>, size_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, size_t a8@<X7>, uint64_t a9@<X8>, CGFloat a10@<D0>, CGFloat a11@<D1>, CGFloat a12@<D2>, CGFloat a13@<D3>, unint64_t flags, void *tempBuffer)
{
  int64_t v15 = a8;
  uint64_t v34 = *MEMORY[0x263EF8340];
  src.data = a1;
  src.CGFloat height = a2;
  src.CGFloat width = a3;
  src.rowBytes = a4;
  dest.rowBytes = a8;
  double Width = CGRectGetWidth(*(CGRect *)&a10);
  if ((~*(void *)&Width & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (Width <= -1.0)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (Width >= 1.84467441e19)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  dest.CGFloat width = (unint64_t)Width;
  v35.origin.float x = a10;
  v35.origin.float y = a11;
  v35.size.CGFloat width = a12;
  v35.size.CGFloat height = a13;
  double Height = CGRectGetHeight(v35);
  if ((~*(void *)&Height & 0x7FF0000000000000) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (Height <= -1.0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (Height >= 1.84467441e19)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  dest.CGFloat height = (unint64_t)Height;
  if (a11 <= -9.22337204e18)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (a11 >= 9.22337204e18)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v26 = (uint64_t)a11 * v15;
  if ((unsigned __int128)((uint64_t)a11 * (__int128)v15) >> 64 != v26 >> 63)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if ((~*(void *)&a10 & 0x7FF0000000000000) == 0
    || (*(void *)&a11 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_30;
  }
  if (a10 <= -9.22337204e18)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (a10 >= 9.22337204e18)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  BOOL v27 = __OFADD__(v26, (uint64_t)a10);
  uint64_t v28 = v26 + (uint64_t)a10;
  if (v27)
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (!a5) {
    goto LABEL_36;
  }
  dest.data = (void *)(a5 + v28);
  if ((flags & 0x8000000000000000) != 0) {
    goto LABEL_34;
  }
  if (HIDWORD(flags))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
  }
  vImage_Error result = vImageScale_Planar8(&src, &dest, tempBuffer, flags);
  vImage_Error v30 = result;
  if (result)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268694B98);
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_22F227140;
    sub_22F2243F8();
    swift_bridgeObjectRelease();
    sub_22F2246D8();
    sub_22F223B48();
    swift_bridgeObjectRelease();
    *(void *)(v31 + 56) = MEMORY[0x263F8D310];
    *(void *)(v31 + 32) = 0xD00000000000001BLL;
    *(void *)(v31 + 40) = 0x800000022F231DB0;
    sub_22F2247C8();
    vImage_Error result = swift_bridgeObjectRelease();
    a5 = 0;
    a6 = 0;
    a7 = 0;
    int64_t v15 = 0;
  }
  *(void *)a9 = a5;
  *(void *)(a9 + 8) = a6;
  *(void *)(a9 + 16) = a7;
  *(void *)(a9 + 24) = v15;
  *(unsigned char *)(a9 + 32) = v30 != 0;
  return result;
}

uint64_t sub_22F1FEEFC@<X0>(void *a1@<X0>, vImagePixelCount a2@<X1>, int64_t a3@<X2>, int64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, void *a7@<X6>, uint64_t a8@<X8>, float a9@<S0>)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  sub_22F1899D0(a5, (uint64_t)v33, &qword_268694B90);
  uint64_t v17 = (void *)v33[0];
  int64_t v16 = v33[1];
  vImagePixelCount v19 = v33[2];
  int64_t v18 = v33[3];
  src.data = a1;
  src.CGFloat height = a2;
  src.CGFloat width = a3;
  src.rowBytes = a4;
  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (!a3)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  float v20 = roundf((float)(unint64_t)a3 * a9);
  if ((~LODWORD(v20) & 0x7F800000) == 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v20 <= -9.2234e18)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v20 >= 9.2234e18)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  float v21 = roundf((float)a2 * a9);
  if ((~LODWORD(v21) & 0x7F800000) == 0)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (v21 <= -9.2234e18)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v21 >= 9.2234e18)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  sub_22F1899D0(a5, (uint64_t)v37, &qword_268694B90);
  if (v37[32] == 1)
  {
    vImagePixelCount v19 = (uint64_t)v20;
    int64_t v18 = a4 / a3 * (uint64_t)v20;
    if ((unsigned __int128)(a4 / a3 * (__int128)(uint64_t)v20) >> 64 != v18 >> 63)
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    int64_t v16 = (uint64_t)v21;
    if (((v19 | (uint64_t)v21) & 0x8000000000000000) != 0)
    {
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
    }
    if ((unsigned __int128)(v16 * (__int128)v18) >> 64 != (v16 * v18) >> 63) {
      goto LABEL_35;
    }
    uint64_t v17 = malloc(v16 * v18);
  }
  dest.data = v17;
  dest.CGFloat height = v16;
  dest.CGFloat width = v19;
  dest.rowBytes = v18;
  if ((a6 & 0x8000000000000000) != 0) {
    goto LABEL_31;
  }
  if (HIDWORD(a6))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  uint64_t result = vImageScale_Planar8(&src, &dest, a7, a6);
  uint64_t v23 = result;
  if (!result)
  {
    long long v27 = *(_OWORD *)&dest.data;
    long long v28 = *(_OWORD *)&dest.width;
    goto LABEL_22;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268694B98);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_22F227140;
  unint64_t v34 = 0;
  unint64_t v35 = 0xE000000000000000;
  sub_22F2243F8();
  swift_bridgeObjectRelease();
  unint64_t v34 = 0xD00000000000001BLL;
  unint64_t v35 = 0x800000022F231DB0;
  sub_22F2246D8();
  sub_22F223B48();
  swift_bridgeObjectRelease();
  unint64_t v25 = v34;
  unint64_t v26 = v35;
  *(void *)(v24 + 56) = MEMORY[0x263F8D310];
  *(void *)(v24 + 32) = v25;
  *(void *)(v24 + 40) = v26;
  sub_22F2247C8();
  swift_bridgeObjectRelease();
  uint64_t result = sub_22F1899D0(a5, (uint64_t)&v34, &qword_268694B90);
  long long v27 = 0uLL;
  if (v36 != 1)
  {
    long long v28 = 0uLL;
    goto LABEL_22;
  }
  uint64_t result = (uint64_t)dest.data;
  if (dest.data)
  {
    uint64_t result = MEMORY[0x230FB40E0](dest.data, -1, -1);
    long long v28 = 0uLL;
    long long v27 = 0uLL;
LABEL_22:
    *(_OWORD *)a8 = v27;
    *(_OWORD *)(a8 + 16) = v28;
    *(unsigned char *)(a8 + 32) = v23 != 0;
    return result;
  }
  __break(1u);
  return result;
}

void sub_22F1FF220(uint64_t a1, uint64_t a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  double Width = CGRectGetWidth(*(CGRect *)&a4);
  if ((~*(void *)&Width & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (Width <= -1.0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (Width >= 1.84467441e19)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v16.origin.float x = a4;
  v16.origin.float y = a5;
  v16.size.CGFloat width = a6;
  v16.size.CGFloat height = a7;
  double Height = CGRectGetHeight(v16);
  if ((~*(void *)&Height & 0x7FF0000000000000) == 0)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (Height <= -1.0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (Height >= 1.84467441e19)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (!a1)
  {
LABEL_30:
    __break(1u);
    return;
  }
  if (a5 <= -9.22337204e18) {
    goto LABEL_23;
  }
  if (a5 >= 9.22337204e18)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if ((unsigned __int128)((uint64_t)a5 * (__int128)a2) >> 64 != ((uint64_t)a5 * a2) >> 63)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if ((~*(void *)&a4 & 0x7FF0000000000000) == 0 || (*(void *)&a5 & 0x7FF0000000000000) == 0x7FF0000000000000) {
    goto LABEL_26;
  }
  if (a4 <= -9.22337204e18)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (a4 >= 9.22337204e18)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if ((unsigned __int128)((uint64_t)a4 * (__int128)a3) >> 64 != ((uint64_t)a4 * a3) >> 63)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
}

unint64_t sub_22F1FF3D0()
{
  unint64_t result = qword_268695BE0[0];
  if (!qword_268695BE0[0])
  {
    type metadata accessor for vImage_Buffer(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268695BE0);
  }
  return result;
}

uint64_t HashableWeakRef.__allocating_init(_:)(uint64_t a1)
{
  return sub_22F1FF4E8(a1, 32, (uint64_t (*)(uint64_t))sub_22F1FFAF0);
}

uint64_t (*WeakRef.value.modify(void *a1))()
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_beginAccess();
  v3[3] = MEMORY[0x230FB41A0](v1 + 16);
  return sub_22F1FF4C8;
}

uint64_t WeakRef.__allocating_init(_:)(uint64_t a1)
{
  return sub_22F1FF4E8(a1, 24, (uint64_t (*)(uint64_t))sub_22F1FFB90);
}

uint64_t sub_22F1FF4E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  swift_allocObject();
  uint64_t v5 = a3(a1);
  swift_unknownObjectRelease();
  return v5;
}

uint64_t WeakRef.init(_:)()
{
  uint64_t v0 = sub_22F1FFB90();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t WeakRef.__deallocating_deinit()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocClassInstance();
}

uint64_t _s17MeasureFoundation7WeakRefC5valuexSgvg_0()
{
  swift_beginAccess();
  return MEMORY[0x230FB41A0](v0 + 16);
}

uint64_t _s17MeasureFoundation7WeakRefC5valuexSgvs_0()
{
  return swift_unknownObjectRelease();
}

uint64_t (*HashableWeakRef.value.modify(void *a1))()
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_beginAccess();
  v3[3] = MEMORY[0x230FB41A0](v1 + 16);
  return sub_22F1FF4C8;
}

void sub_22F1FF6CC(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t HashableWeakRef.hashSeed.getter()
{
  return *(void *)(v0 + 24);
}

uint64_t HashableWeakRef.init(_:)()
{
  uint64_t v0 = sub_22F1FFAF0();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t _s17MeasureFoundation7WeakRefC13dynamicMemberqd__Sgs7KeyPathCyxqd__G_tcluig_0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *a1;
  swift_beginAccess();
  if (!MEMORY[0x230FB41A0](v2 + 16)) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(*MEMORY[0x263F8EA20] + v4 + 8)
  }
                                                                            - 8)
                                                                + 56))(a2, 1, 1);
  swift_getAtKeyPath();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(*(void *)(*MEMORY[0x263F8EA20] + v4 + 8)
                                                                         - 8)
                                                             + 56))(a2, 0, 1);
}

uint64_t HashableWeakRef.deinit()
{
  swift_unknownObjectWeakDestroy();
  return v0;
}

uint64_t HashableWeakRef.__deallocating_deinit()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocClassInstance();
}

uint64_t HashableWeakRef.hash(into:)()
{
  return sub_22F2247F8();
}

uint64_t static HashableWeakRef.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + 16;
  swift_beginAccess();
  if (!MEMORY[0x230FB41A0](v4)) {
    goto LABEL_5;
  }
  swift_beginAccess();
  if (!MEMORY[0x230FB41A0](a2 + 16))
  {
    swift_unknownObjectRelease();
LABEL_5:
    char v5 = *(void *)(a1 + 24) == *(void *)(a2 + 24);
    return v5 & 1;
  }
  char v5 = sub_22F223A68();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v5 & 1;
}

uint64_t HashableWeakRef.hashValue.getter()
{
  return sub_22F224818();
}

uint64_t sub_22F1FFA5C()
{
  return HashableWeakRef.hashValue.getter();
}

uint64_t sub_22F1FFA80()
{
  return HashableWeakRef.hash(into:)();
}

uint64_t sub_22F1FFAA4()
{
  return sub_22F224818();
}

uint64_t sub_22F1FFAE4(uint64_t *a1, uint64_t *a2)
{
  return static HashableWeakRef.== infix(_:_:)(*a1, *a2);
}

uint64_t sub_22F1FFAF0()
{
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  *(void *)(v0 + 24) = sub_22F223A08();
  return v0;
}

uint64_t sub_22F1FFB90()
{
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return v0;
}

uint64_t sub_22F1FFBF0()
{
  return swift_getWitnessTable();
}

uint64_t sub_22F1FFC0C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for WeakRef()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22F1FFC68()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for HashableWeakRef()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t WorldAnchor.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_identifier;
  uint64_t v4 = sub_22F223848();
  char v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);
  return v5(a1, v3, v4);
}

uint64_t WorldAnchor.autoUpdate.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_autoUpdate);
  swift_beginAccess();
  return *v1;
}

uint64_t WorldAnchor.autoUpdate.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_autoUpdate);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*WorldAnchor.autoUpdate.modify())()
{
  return j__swift_endAccess;
}

float WorldAnchor.confidence.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_confidence;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t property wrapper backing initializer of WorldAnchor.plane(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695CF0);
  uint64_t v2 = swift_allocObject();
  swift_retain();
  uint64_t v3 = (_DWORD *)swift_slowAlloc();
  *uint64_t v3 = 0;
  swift_release();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return v2;
}

uint64_t sub_22F1FFEF0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane);
  swift_beginAccess();
  uint64_t v4 = *v3;
  char v5 = *(os_unfair_lock_s **)(v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  uint64_t v6 = *(void *)(v4 + 16);
  swift_retain();
  os_unfair_lock_unlock(v5);
  uint64_t result = swift_release();
  *a2 = v6;
  return result;
}

uint64_t WorldAnchor.plane.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = *(os_unfair_lock_s **)(v2 + 24);
  swift_retain();
  os_unfair_lock_lock(v3);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 + 16);
  swift_retain();
  os_unfair_lock_unlock(v3);
  swift_release();
  return v4;
}

uint64_t sub_22F200028(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane);
  swift_beginAccess();
  uint64_t v4 = *v3;
  char v5 = *(os_unfair_lock_s **)(v4 + 24);
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  *(void *)(v4 + 16) = a1;
  swift_retain();
  swift_release();
  os_unfair_lock_unlock(v5);
  swift_release();
  return swift_release_n();
}

uint64_t property wrapper backing initializer of WorldAnchor.viewAnchor(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695D00);
  uint64_t v2 = swift_allocObject();
  id v3 = a1;
  uint64_t v4 = (_DWORD *)swift_slowAlloc();
  *uint64_t v4 = 0;

  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v4;
  return v2;
}

uint64_t _s17MeasureFoundation11WorldAnchorC05pointD033_5454E724AA4159EF16DA5F66FC4569C8LLSo8ARAnchorCvpfP_0(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695518);
  uint64_t v2 = swift_allocObject();
  id v3 = a1;
  uint64_t v4 = (_DWORD *)swift_slowAlloc();
  *uint64_t v4 = 0;

  *(void *)(v2 + 16) = v3;
  *(void *)(v2 + 24) = v4;
  return v2;
}

uint64_t WorldAnchor.updateHandler.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_updateHandler);
  swift_beginAccess();
  uint64_t v2 = *v1;
  sub_22F1B4AD8(*v1);
  return v2;
}

uint64_t WorldAnchor.updateHandler.setter(uint64_t a1, uint64_t a2)
{
  char v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_updateHandler);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t *v5 = a1;
  v5[1] = a2;
  return sub_22F1B4AC8(v6);
}

void (*WorldAnchor.updateHandler.modify(void *a1))(uint64_t a1, char a2)
{
  id v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_updateHandler;
  v3[5] = v1;
  v3[6] = v4;
  char v5 = (uint64_t *)(v1 + v4);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  v3[3] = *v5;
  v3[4] = v7;
  sub_22F1B4AD8(v6);
  return sub_22F200300;
}

void sub_22F200300(uint64_t a1, char a2)
{
  id v3 = *(void **)a1;
  uint64_t v4 = *(void *)(*(void *)a1 + 24);
  uint64_t v5 = v3[4];
  uint64_t v6 = (uint64_t *)(v3[5] + v3[6]);
  uint64_t v7 = *v6;
  *uint64_t v6 = v4;
  v6[1] = v5;
  if (a2)
  {
    sub_22F1B4AD8(v4);
    sub_22F1B4AC8(v7);
    uint64_t v8 = v3[3];
  }
  else
  {
    uint64_t v8 = v7;
  }
  sub_22F1B4AC8(v8);
  free(v3);
}

void (*sub_22F200384(void *a1))(uint64_t a1, char a2)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  if (qword_268694508 != -1) {
    swift_once();
  }
  id v3 = off_268695CE8;
  v2[4] = off_268695CE8;
  uint64_t v4 = (os_unfair_lock_s *)*((void *)v3 + 3);
  swift_retain();
  os_unfair_lock_lock(v4);
  swift_beginAccess();
  uint64_t v5 = *((void *)v3 + 2);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v4);
  v2[3] = v5;
  return sub_22F200454;
}

void sub_22F200454(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 24);
  uint64_t v4 = *(void *)(*(void *)a1 + 32);
  uint64_t v5 = *(os_unfair_lock_s **)(v4 + 24);
  if (a2)
  {
    swift_bridgeObjectRetain();
    os_unfair_lock_lock(v5);
    *(void *)(v4 + 16) = v3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(v4 + 24));
    *(void *)(v4 + 16) = v3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
    swift_bridgeObjectRelease();
    swift_release();
  }
  free(v2);
}

_DWORD *sub_22F200530()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695D68);
  uint64_t v0 = swift_allocObject();
  uint64_t result = (_DWORD *)swift_slowAlloc();
  *uint64_t result = 0;
  *(void *)(v0 + 16) = MEMORY[0x263F8EE80];
  *(void *)(v0 + 24) = result;
  off_268695CE8 = (_UNKNOWN *)v0;
  return result;
}

uint64_t *WorldAnchor.arSession.unsafeMutableAddressor()
{
  return &static WorldAnchor.arSession;
}

uint64_t static WorldAnchor.arSession.getter()
{
  swift_beginAccess();
  uint64_t v0 = static WorldAnchor.arSession;
  id v1 = (id)static WorldAnchor.arSession;
  return v0;
}

void static WorldAnchor.arSession.setter(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v2 = (void *)static WorldAnchor.arSession;
  static WorldAnchor.arSession = a1;
}

uint64_t (*static WorldAnchor.arSession.modify())()
{
  return j_j__swift_endAccess;
}

double sub_22F20068C()
{
  qword_26869BE00 = 0;
  double result = 0.0;
  static WorldAnchor.delegate = 0u;
  unk_26869BDF0 = 0u;
  return result;
}

long long *WorldAnchor.delegate.unsafeMutableAddressor()
{
  if (qword_268694510 != -1) {
    swift_once();
  }
  return &static WorldAnchor.delegate;
}

uint64_t static WorldAnchor.delegate.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_268694510 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return sub_22F186CEC((uint64_t)&static WorldAnchor.delegate, a1, &qword_268695D08);
}

uint64_t static WorldAnchor.delegate.setter(uint64_t a1)
{
  if (qword_268694510 != -1) {
    swift_once();
  }
  swift_beginAccess();
  sub_22F200810(a1, (uint64_t)&static WorldAnchor.delegate);
  swift_endAccess();
  return sub_22F196338(a1, &qword_268695D08);
}

uint64_t sub_22F200810(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268695D08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t (*static WorldAnchor.delegate.modify())()
{
  if (qword_268694510 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t WorldAnchor.hash(into:)()
{
  return sub_22F2239F8();
}

uint64_t static WorldAnchor.== infix(_:_:)()
{
  return sub_22F223818();
}

__n128 WorldAnchor.transform.getter()
{
  return *(__n128 *)(v0 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
}

unint64_t WorldAnchor.viewDirection.getter()
{
  id v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__viewAnchor);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = *(os_unfair_lock_s **)(*v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v3);
  swift_beginAccess();
  uint64_t v4 = *(void **)(v2 + 16);
  id v5 = v4;
  os_unfair_lock_unlock(v3);
  swift_release();
  if (!v4) {
    return 0;
  }
  uint64_t v6 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__targetAnchor);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t v8 = *(os_unfair_lock_s **)(v7 + 24);
  swift_retain();
  os_unfair_lock_lock(v8);
  swift_beginAccess();
  id v9 = *(id *)(v7 + 16);
  os_unfair_lock_unlock(v8);
  swift_release();
  objc_msgSend(v9, sel_transform);
  float32x4_t v18 = v10;

  objc_msgSend(v5, sel_transform);
  float32x4_t v17 = v11;

  float32x4_t v12 = vsubq_f32(v18, v17);
  int32x4_t v13 = (int32x4_t)vmulq_f32(v12, v12);
  v13.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v13, 2), vadd_f32(*(float32x2_t *)v13.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v13.i8, 1))).u32[0];
  float32x2_t v14 = vrsqrte_f32((float32x2_t)v13.u32[0]);
  float32x2_t v15 = vmul_f32(v14, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v14, v14)));
  return vmulq_n_f32(v12, vmul_f32(v15, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v15, v15))).f32[0]).u64[0];
}

unint64_t WorldAnchor.distanceToViewAnchor.getter()
{
  id v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__viewAnchor);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = *(os_unfair_lock_s **)(*v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v3);
  swift_beginAccess();
  uint64_t v4 = *(void **)(v2 + 16);
  id v5 = v4;
  os_unfair_lock_unlock(v3);
  swift_release();
  if (v4)
  {
    uint64_t v6 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__targetAnchor);
    swift_beginAccess();
    uint64_t v7 = *v6;
    uint64_t v8 = *(os_unfair_lock_s **)(v7 + 24);
    swift_retain();
    os_unfair_lock_lock(v8);
    swift_beginAccess();
    id v9 = *(id *)(v7 + 16);
    os_unfair_lock_unlock(v8);
    swift_release();
    objc_msgSend(v9, sel_transform);
    float32x4_t v17 = v10;

    objc_msgSend(v5, sel_transform);
    float32x4_t v16 = v11;

    float32x4_t v12 = vsubq_f32(v17, v16);
    float32x4_t v13 = vmulq_f32(v12, v12);
    uint64_t v14 = COERCE_UNSIGNED_INT(sqrtf(v13.f32[2] + vaddv_f32(*(float32x2_t *)v13.f32)));
  }
  else
  {
    uint64_t v14 = 0;
  }
  return v14 | ((unint64_t)(v4 == 0) << 32);
}

uint64_t WorldAnchor.__allocating_init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8, float a9)
{
  uint64_t v14 = swift_allocObject();
  WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  return v14;
}

uint64_t WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8, float a9)
{
  uint64_t v10 = v9;
  sub_22F18032C(a4, (uint64_t)v74);
  unint64_t v61 = v74[0];
  unint64_t v62 = v74[2];
  unint64_t v63 = v74[4];
  unint64_t v64 = v74[6];
  sub_22F18032C(a1, (uint64_t)v73);
  double v57 = *(double *)v73;
  double v58 = *(double *)&v73[2];
  double v59 = *(double *)&v73[4];
  double v60 = *(double *)&v73[6];
  _s17MeasureFoundation11WorldAnchorC10identifier0B04UUIDVvpfi_0();
  uint64_t v15 = OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695CF0);
  uint64_t v16 = swift_allocObject();
  float32x4_t v17 = (_DWORD *)swift_slowAlloc();
  *float32x4_t v17 = 0;
  *(void *)(v16 + 16) = 0;
  *(void *)(v16 + 24) = v17;
  *(void *)(v10 + v15) = v16;
  *(_DWORD *)(v10 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_maxTranslationForPlaneUpgrade) = 994352038;
  *(_DWORD *)(v10 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_minDotForPlaneUpgrade) = 1065289295;
  float32x4_t v18 = (uint64_t *)(v10 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__viewAnchor);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695D00);
  uint64_t v19 = swift_allocObject();
  float v20 = (_DWORD *)swift_slowAlloc();
  *float v20 = 0;
  *(void *)(v19 + 16) = 0;
  *(void *)(v19 + 24) = v20;
  *float32x4_t v18 = v19;
  float v21 = (void *)(v10 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_updateHandler);
  *float v21 = 0;
  v21[1] = 0;
  double v22 = (__n128 *)(v10 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
  *double v22 = a5;
  v22[1] = a6;
  v22[2] = a7;
  v22[3] = a8;
  id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F20E38]), sel_initWithTransform_, a5.n128_f64[0], a6.n128_f64[0], a7.n128_f64[0], a8.n128_f64[0]);
  uint64_t v24 = (uint64_t *)(v10 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__pointAnchor);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695518);
  uint64_t v25 = swift_allocObject();
  id v26 = v23;
  long long v27 = (_DWORD *)swift_slowAlloc();
  *long long v27 = 0;
  *(void *)(v25 + 16) = v26;
  *(void *)(v25 + 24) = v27;
  *uint64_t v24 = v25;
  swift_endAccess();

  sub_22F18032C(a1, (uint64_t)v76);
  id v28 = 0;
  if ((v76[64] & 1) == 0)
  {
    double v29 = v60;
    id v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F20E38]), sel_initWithTransform_, v57, v58, v59, v29);
  }
  swift_beginAccess();
  swift_release();
  uint64_t v30 = swift_allocObject();
  id v31 = v28;
  int64_t v32 = (_DWORD *)swift_slowAlloc();
  *int64_t v32 = 0;
  *(void *)(v30 + 16) = v28;
  *(void *)(v30 + 24) = v32;
  *float32x4_t v18 = v30;
  swift_endAccess();

  sub_22F18032C(a4, (uint64_t)v75);
  if ((v75[64] & 1) == 0)
  {
    a5.n128_u64[0] = v61;
    a6.n128_u64[0] = v62;
    a7.n128_u64[0] = v63;
    a8.n128_u64[0] = v64;
  }
  id v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F20E38]), sel_initWithTransform_, a5.n128_f64[0], a6.n128_f64[0], a7.n128_f64[0], a8.n128_f64[0]);
  unint64_t v34 = (uint64_t *)(v10 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__targetAnchor);
  swift_beginAccess();
  uint64_t v35 = swift_allocObject();
  id v36 = v33;
  double v37 = (_DWORD *)swift_slowAlloc();
  *double v37 = 0;
  *(void *)(v35 + 16) = v36;
  *(void *)(v35 + 24) = v37;
  *unint64_t v34 = v35;
  swift_endAccess();

  uint64_t v38 = (uint64_t *)(v10 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane);
  swift_beginAccess();
  swift_retain_n();
  swift_release();
  uint64_t v39 = swift_allocObject();
  unsigned __int8 v40 = (_DWORD *)swift_slowAlloc();
  *unsigned __int8 v40 = 0;
  *(void *)(v39 + 16) = a2;
  *(void *)(v39 + 24) = v40;
  *uint64_t v38 = v39;
  swift_endAccess();
  swift_release();
  *(unsigned char *)(v10 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_autoUpdate) = a3 & 1;
  *(float *)(v10 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_confidence) = a9;
  uint64_t v41 = *v24;
  uint64_t v42 = *(os_unfair_lock_s **)(*v24 + 24);
  swift_retain();
  os_unfair_lock_lock(v42);
  swift_beginAccess();
  id v43 = *(id *)(v41 + 16);
  os_unfair_lock_unlock(v42);
  swift_release();
  sub_22F204290(v43);

  uint64_t v44 = *v34;
  uint64_t v45 = *(os_unfair_lock_s **)(*v34 + 24);
  swift_retain();
  os_unfair_lock_lock(v45);
  swift_beginAccess();
  id v46 = *(id *)(v44 + 16);
  os_unfair_lock_unlock(v45);
  swift_release();
  sub_22F204290(v46);

  uint64_t v47 = *v18;
  double v48 = *(os_unfair_lock_s **)(*v18 + 24);
  swift_retain();
  os_unfair_lock_lock(v48);
  swift_beginAccess();
  char v49 = *(void **)(v47 + 16);
  id v50 = v49;
  os_unfair_lock_unlock(v48);
  swift_release();
  if (v49)
  {
    sub_22F204290(v50);
  }
  if (a2)
  {
    swift_beginAccess();
    uint64_t v51 = *(void *)(a2 + 16);
    CGRect v52 = *(os_unfair_lock_s **)(v51 + 24);
    swift_retain();
    swift_retain();
    os_unfair_lock_lock(v52);
    swift_beginAccess();
    id v53 = *(id *)(v51 + 16);
    os_unfair_lock_unlock(v52);
    swift_release();
    swift_release();
    sub_22F204290(v53);
  }
  if (qword_268694510 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (qword_26869BDF8)
  {
    sub_22F1AD024((uint64_t)&static WorldAnchor.delegate, (uint64_t)v70);
    uint64_t v54 = v71;
    uint64_t v55 = v72;
    __swift_project_boxed_opaque_existential_0(v70, v71);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 8))(v10, v54, v55);
    swift_release();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v70);
  }
  else
  {
    swift_release();
  }
  return v10;
}

uint64_t WorldAnchor.__allocating_init(anchor:shouldAutoUpdate:)(uint64_t a1, unsigned __int8 a2)
{
  uint64_t v2 = sub_22F207054(a1, a2);
  swift_release();
  return v2;
}

uint64_t WorldAnchor.deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__pointAnchor);
  swift_beginAccess();
  uint64_t v3 = *v2;
  uint64_t v4 = *(os_unfair_lock_s **)(*v2 + 24);
  swift_retain();
  os_unfair_lock_lock(v4);
  swift_beginAccess();
  id v5 = *(id *)(v3 + 16);
  os_unfair_lock_unlock(v4);
  swift_release();
  sub_22F204860(v5);

  uint64_t v6 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__targetAnchor);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t v8 = *(os_unfair_lock_s **)(*v6 + 24);
  swift_retain();
  os_unfair_lock_lock(v8);
  swift_beginAccess();
  id v9 = *(id *)(v7 + 16);
  os_unfair_lock_unlock(v8);
  swift_release();
  sub_22F204860(v9);

  uint64_t v10 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__viewAnchor);
  swift_beginAccess();
  uint64_t v11 = *v10;
  float32x4_t v12 = *(os_unfair_lock_s **)(*v10 + 24);
  swift_retain();
  os_unfair_lock_lock(v12);
  swift_beginAccess();
  float32x4_t v13 = *(void **)(v11 + 16);
  id v14 = v13;
  os_unfair_lock_unlock(v12);
  swift_release();
  if (v13)
  {
    sub_22F204860(v14);
  }
  uint64_t v15 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane);
  swift_beginAccess();
  uint64_t v16 = *v15;
  float32x4_t v17 = *(os_unfair_lock_s **)(*v15 + 24);
  swift_retain();
  os_unfair_lock_lock(v17);
  swift_beginAccess();
  uint64_t v18 = *(void *)(v16 + 16);
  swift_retain();
  os_unfair_lock_unlock(v17);
  swift_release();
  if (v18)
  {
    swift_beginAccess();
    uint64_t v19 = *(void *)(v18 + 16);
    float v20 = *(os_unfair_lock_s **)(v19 + 24);
    swift_retain();
    os_unfair_lock_lock(v20);
    swift_beginAccess();
    id v21 = *(id *)(v19 + 16);
    os_unfair_lock_unlock(v20);
    swift_release();
    swift_release();
    sub_22F204860(v21);
  }
  if (qword_268694510 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (qword_26869BDF8)
  {
    sub_22F1AD024((uint64_t)&static WorldAnchor.delegate, (uint64_t)v27);
    uint64_t v22 = v28;
    uint64_t v23 = v29;
    __swift_project_boxed_opaque_existential_0(v27, v28);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 24))(v1, v22, v23);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v27);
  }
  uint64_t v24 = v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_identifier;
  uint64_t v25 = sub_22F223848();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v25 - 8) + 8))(v24, v25);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_22F1B4AC8(*(void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_updateHandler));
  return v1;
}

uint64_t WorldAnchor.__deallocating_deinit()
{
  WorldAnchor.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_22F201870(void *a1)
{
  uint64_t v3 = sub_22F223848();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v3);
  uint64_t v7 = &v26[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  id v9 = &v26[-v8];
  uint64_t v10 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane);
  swift_beginAccess();
  uint64_t v11 = *v10;
  float32x4_t v12 = *(os_unfair_lock_s **)(*v10 + 24);
  swift_retain();
  os_unfair_lock_lock(v12);
  swift_beginAccess();
  uint64_t v13 = *(void *)(v11 + 16);
  swift_retain();
  os_unfair_lock_unlock(v12);
  swift_release();
  uint64_t result = swift_release();
  if (v13)
  {
    uint64_t v15 = *v10;
    uint64_t v16 = *(os_unfair_lock_s **)(*v10 + 24);
    swift_retain();
    os_unfair_lock_lock(v16);
    swift_beginAccess();
    uint64_t v17 = *(void *)(v15 + 16);
    swift_retain();
    os_unfair_lock_unlock(v16);
    uint64_t result = swift_release();
    if (v17)
    {
      swift_beginAccess();
      uint64_t v18 = *(void *)(v17 + 16);
      uint64_t v19 = *(os_unfair_lock_s **)(v18 + 24);
      swift_retain();
      os_unfair_lock_lock(v19);
      swift_beginAccess();
      id v20 = *(id *)(v18 + 16);
      os_unfair_lock_unlock(v19);
      swift_release();
      swift_release();
      id v21 = objc_msgSend(v20, sel_identifier);

      sub_22F223828();
      id v22 = objc_msgSend(a1, sel_identifier);
      sub_22F223828();

      LOBYTE(v22) = sub_22F223818();
      uint64_t v23 = *(void (**)(unsigned char *, uint64_t))(v4 + 8);
      v23(v7, v3);
      uint64_t result = ((uint64_t (*)(unsigned char *, uint64_t))v23)(v9, v3);
      if (v22)
      {
        uint64_t v24 = *v10;
        uint64_t v25 = *(os_unfair_lock_s **)(*v10 + 24);
        swift_retain();
        os_unfair_lock_lock(v25);
        swift_beginAccess();
        *(void *)(v24 + 16) = 0;
        swift_release();
        os_unfair_lock_unlock(v25);
        return swift_release();
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_22F201B54(void *a1, uint64_t a2)
{
  uint64_t v133 = a2;
  uint64_t v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_268695530);
  uint64_t v4 = MEMORY[0x270FA5388](v148);
  v139 = (char *)&v124 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v146 = (char *)&v124 - v6;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(qword_268695538);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v134 = (uint64_t)&v124 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v140 = (uint64_t)&v124 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v138 = (char *)&v124 - v13;
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v141 = (uint64_t)&v124 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v149 = (uint64_t)&v124 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v150 = (uint64_t)&v124 - v18;
  uint64_t v19 = sub_22F223848();
  v154.i64[0] = *(void *)(v19 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](v19);
  v142 = (char *)&v124 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  v145 = (char *)&v124 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  id v26 = (char *)&v124 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v124 - v27;
  uint64_t v29 = &v2[OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane];
  swift_beginAccess();
  v137 = v29;
  uint64_t v30 = *(void *)v29;
  id v31 = *(os_unfair_lock_s **)(*(void *)v29 + 24);
  swift_retain();
  os_unfair_lock_lock(v31);
  swift_beginAccess();
  uint64_t v153 = *(void *)(v30 + 16);
  swift_retain();
  os_unfair_lock_unlock(v31);
  swift_release();
  v152 = a1;
  id v32 = objc_msgSend(a1, sel_identifier);
  sub_22F223828();

  v151 = v2;
  id v33 = &v2[OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__pointAnchor];
  swift_beginAccess();
  uint64_t v34 = *(void *)v33;
  uint64_t v35 = *(os_unfair_lock_s **)(*(void *)v33 + 24);
  swift_retain();
  os_unfair_lock_lock(v35);
  swift_beginAccess();
  id v36 = *(id *)(v34 + 16);
  os_unfair_lock_unlock(v35);
  swift_release();
  id v37 = objc_msgSend(v36, sel_identifier);

  uint64_t v38 = (void *)v154.i64[0];
  sub_22F223828();

  uint64_t v39 = sub_22F208760(&qword_268694C78, MEMORY[0x263F07508]);
  LOBYTE(v37) = sub_22F223A68();
  unsigned __int8 v40 = (void (*)(char *, uint64_t))v38[1];
  v144 = v26;
  v40(v26, v19);
  if (v37)
  {
    v40(v28, v19);
    uint64_t v41 = *(void *)v33;
    uint64_t v42 = *(os_unfair_lock_s **)(*(void *)v33 + 24);
    swift_retain();
    id v43 = v152;
    os_unfair_lock_lock(v42);
LABEL_16:
    swift_beginAccess();
    uint64_t v91 = *(void **)(v41 + 16);
    *(void *)(v41 + 16) = v43;
    id v92 = v43;

    os_unfair_lock_unlock(v42);
    swift_release();
    swift_release();

    char v79 = 1;
    return v79 & 1;
  }
  uint64_t v130 = v39;
  v131 = v28;
  v147 = v40;
  v127 = v33;
  uint64_t v44 = (void (*)(void, void, void))v38[2];
  uint64_t v45 = v145;
  v132 = (void (*)(void, void, void, void))v19;
  v135 = v44;
  v136 = v38 + 2;
  v44(v145, v28, v19);
  id v46 = &v151[OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__viewAnchor];
  swift_beginAccess();
  uint64_t v47 = *(void *)v46;
  double v48 = *(os_unfair_lock_s **)(*(void *)v46 + 24);
  swift_retain();
  os_unfair_lock_lock(v48);
  swift_beginAccess();
  char v49 = *(void **)(v47 + 16);
  id v50 = v49;
  os_unfair_lock_unlock(v48);
  swift_release();
  uint64_t v51 = v45;
  v143 = v38 + 1;
  v129 = v46;
  if (v49)
  {
    id v52 = objc_msgSend(v50, sel_identifier);

    uint64_t v53 = v150;
    sub_22F223828();

    uint64_t v54 = (void (*)(uint64_t, uint64_t, uint64_t, void))v38[7];
    unint64_t v55 = (unint64_t)(v38 + 7) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v56 = v53;
    uint64_t v57 = 0;
  }
  else
  {
    uint64_t v54 = (void (*)(uint64_t, uint64_t, uint64_t, void))v38[7];
    unint64_t v55 = (unint64_t)(v38 + 7) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v53 = v150;
    uint64_t v56 = v150;
    uint64_t v57 = 1;
  }
  double v58 = v132;
  v54(v56, v57, 1, v132);
  double v59 = v38;
  uint64_t v60 = (uint64_t)v146;
  uint64_t v61 = v149;
  v135(v149, v51, v58);
  v132 = v54;
  unint64_t v128 = v55;
  v54(v61, 0, 1, v58);
  uint64_t v62 = v60 + *(int *)(v148 + 48);
  sub_22F186CEC(v53, v60, qword_268695538);
  sub_22F186CEC(v61, v62, qword_268695538);
  unint64_t v63 = v51;
  uint64_t v66 = (unsigned int (*)(void, void, void))v59[6];
  char v65 = v59 + 6;
  unint64_t v64 = v66;
  if (v66(v60, 1, v58) != 1)
  {
    uint64_t v67 = v141;
    sub_22F186CEC(v60, v141, qword_268695538);
    if (v64(v62, 1, v58) != 1)
    {
      v125 = v65;
      v126 = v64;
      uint64_t v69 = v60;
      long long v70 = v144;
      (*(void (**)(char *, uint64_t, void (*)(void, void, void, void)))(v154.i64[0] + 32))(v144, v62, v58);
      uint64_t v71 = v67;
      char v72 = sub_22F223A68();
      long long v73 = v70;
      long long v74 = v147;
      v147(v73, (uint64_t)v58);
      sub_22F196338(v149, qword_268695538);
      sub_22F196338(v150, qword_268695538);
      v74(v63, (uint64_t)v58);
      v74((char *)v71, (uint64_t)v58);
      sub_22F196338(v69, qword_268695538);
      if (v72) {
        goto LABEL_13;
      }
LABEL_14:
      uint64_t v82 = &v151[OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__targetAnchor];
      swift_beginAccess();
      uint64_t v83 = *(void *)v82;
      uint64_t v84 = *(os_unfair_lock_s **)(*(void *)v82 + 24);
      swift_retain();
      os_unfair_lock_lock(v84);
      swift_beginAccess();
      id v85 = *(id *)(v83 + 16);
      os_unfair_lock_unlock(v84);
      swift_release();
      id v86 = objc_msgSend(v85, sel_identifier);

      uint64_t v87 = v144;
      sub_22F223828();

      uint64_t v88 = v131;
      LOBYTE(v86) = sub_22F223A68();
      uint64_t v89 = v87;
      uint64_t v90 = v147;
      v147(v89, (uint64_t)v58);
      if (v86)
      {
        v90(v88, (uint64_t)v58);
        uint64_t v41 = *(void *)v82;
        uint64_t v42 = *(os_unfair_lock_s **)(*(void *)v82 + 24);
        id v43 = v152;
        swift_retain();
        os_unfair_lock_lock(v42);
        goto LABEL_16;
      }
      long long v94 = *(char **)(v154.i64[0] + 32);
      v154.i64[0] += 32;
      v151 = v94;
      ((void (*)(char *, char *, void (*)(void, void, void, void)))v94)(v142, v88, v58);
      uint64_t v95 = *(void *)v137;
      long long v96 = *(os_unfair_lock_s **)(*(void *)v137 + 24);
      swift_retain();
      os_unfair_lock_lock(v96);
      swift_beginAccess();
      uint64_t v97 = *(void *)(v95 + 16);
      swift_retain();
      os_unfair_lock_unlock(v96);
      swift_release();
      if (v97)
      {
        swift_beginAccess();
        uint64_t v98 = *(void *)(v97 + 16);
        uint64_t v99 = *(os_unfair_lock_s **)(v98 + 24);
        swift_retain();
        os_unfair_lock_lock(v99);
        swift_beginAccess();
        id v100 = *(id *)(v98 + 16);
        os_unfair_lock_unlock(v99);
        swift_release();
        swift_release();
        id v101 = objc_msgSend(v100, sel_identifier);

        uint64_t v102 = (uint64_t)v138;
        sub_22F223828();

        uint64_t v103 = 0;
      }
      else
      {
        uint64_t v103 = 1;
        uint64_t v102 = (uint64_t)v138;
      }
      uint64_t v104 = (uint64_t)v139;
      uint64_t v105 = v132;
      v132(v102, v103, 1, v58);
      uint64_t v106 = v140;
      long long v107 = v142;
      v135(v140, v142, v58);
      v105(v106, 0, 1, v58);
      uint64_t v108 = v104 + *(int *)(v148 + 48);
      sub_22F186CEC(v102, v104, qword_268695538);
      sub_22F186CEC(v106, v108, qword_268695538);
      long long v109 = (uint64_t (*)(void, void, void))v126;
      if (v126(v104, 1, v58) == 1)
      {
        sub_22F196338(v106, qword_268695538);
        sub_22F196338(v102, qword_268695538);
        v147(v107, (uint64_t)v58);
        int v110 = v109(v108, 1, v58);
        uint64_t v111 = v153;
        if (v110 == 1)
        {
          sub_22F196338(v104, qword_268695538);
          v112 = v127;
          goto LABEL_28;
        }
      }
      else
      {
        uint64_t v113 = v134;
        sub_22F186CEC(v104, v134, qword_268695538);
        int v114 = v109(v108, 1, v58);
        v112 = v127;
        if (v114 != 1)
        {
          v116 = v144;
          ((void (*)(char *, uint64_t, void (*)(void, void, void, void)))v151)(v144, v108, v58);
          char v117 = sub_22F223A68();
          v118 = v147;
          v147(v116, (uint64_t)v58);
          sub_22F196338(v140, qword_268695538);
          sub_22F196338(v102, qword_268695538);
          v118(v142, (uint64_t)v58);
          v118((char *)v113, (uint64_t)v58);
          sub_22F196338(v104, qword_268695538);
          uint64_t v111 = v153;
          if (v117)
          {
LABEL_28:
            if (v111)
            {
              uint64_t v119 = *(void *)v112;
              v120 = *(os_unfair_lock_s **)(*(void *)v112 + 24);
              swift_retain();
              swift_retain();
              os_unfair_lock_lock(v120);
              swift_beginAccess();
              id v121 = *(id *)(v119 + 16);
              os_unfair_lock_unlock(v120);
              swift_release();
              objc_msgSend(v121, sel_transform);
              float32x4_t v154 = v122;

              float32x4_t v123 = v154;
              v123.i32[3] = 0;
              char v79 = WorldPlane.refresh(anchor:camera:uncertaintyPoint:)(v152, v133, v123);
              swift_release_n();
              return v79 & 1;
            }
LABEL_31:
            char v79 = 0;
            return v79 & 1;
          }
LABEL_30:
          swift_release();
          goto LABEL_31;
        }
        sub_22F196338(v140, qword_268695538);
        sub_22F196338(v102, qword_268695538);
        v115 = v147;
        v147(v142, (uint64_t)v58);
        v115((char *)v113, (uint64_t)v58);
      }
      sub_22F196338(v104, &qword_268695530);
      goto LABEL_30;
    }
    sub_22F196338(v149, qword_268695538);
    sub_22F196338(v150, qword_268695538);
    uint64_t v68 = v147;
    v147(v63, (uint64_t)v58);
    v68((char *)v67, (uint64_t)v58);
    uint64_t v60 = (uint64_t)v146;
LABEL_11:
    v125 = v65;
    v126 = v64;
    sub_22F196338(v60, &qword_268695530);
    goto LABEL_14;
  }
  sub_22F196338(v61, qword_268695538);
  sub_22F196338(v53, qword_268695538);
  v147(v63, (uint64_t)v58);
  if (v64(v62, 1, v58) != 1) {
    goto LABEL_11;
  }
  sub_22F196338(v60, qword_268695538);
LABEL_13:
  v147(v131, (uint64_t)v58);
  uint64_t v75 = *(void *)v129;
  long long v76 = *(os_unfair_lock_s **)(*(void *)v129 + 24);
  uint64_t v77 = v152;
  long long v78 = v152;
  swift_retain();
  os_unfair_lock_lock(v76);
  char v79 = 1;
  swift_beginAccess();
  uint64_t v80 = *(void **)(v75 + 16);
  *(void *)(v75 + 16) = v77;
  id v81 = v78;

  os_unfair_lock_unlock(v76);
  swift_release();
  swift_release();

  return v79 & 1;
}

Swift::Void __swiftcall WorldAnchor.update()()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22F223848();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v199 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22F224198();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v199 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  if (!static WorldAnchor.arSession) {
    return;
  }
  id v9 = objc_msgSend((id)static WorldAnchor.arSession, sel_currentFrame);
  if (!v9) {
    return;
  }
  uint64_t v10 = v9;
  id v11 = objc_msgSend(v9, sel_camera);
  sub_22F2241A8();

  uint64_t v12 = sub_22F224188();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48))(v8, 2, v12) != 2
    || (id v13 = objc_msgSend(v10, sel_worldTrackingState)) == 0
    || (v14 = v13, id v15 = objc_msgSend(v13, sel_vioTrackingState), v14, v15))
  {

    sub_22F207374((uint64_t)v8);
    return;
  }
  v212.i64[0] = v3;
  sub_22F207374((uint64_t)v8);
  uint64_t v16 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__viewAnchor);
  swift_beginAccess();
  uint64_t v17 = *v16;
  uint64_t v18 = *(os_unfair_lock_s **)(*v16 + 24);
  swift_retain();
  os_unfair_lock_lock(v18);
  swift_beginAccess();
  uint64_t v19 = *(void **)(v17 + 16);
  id v20 = v19;
  os_unfair_lock_unlock(v18);
  swift_release();

  if (!v19)
  {
    uint64_t v47 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__pointAnchor);
    swift_beginAccess();
    uint64_t v48 = *v47;
    char v49 = *(os_unfair_lock_s **)(v48 + 24);
    swift_retain();
    os_unfair_lock_lock(v49);
    swift_beginAccess();
    id v50 = *(id *)(v48 + 16);
    os_unfair_lock_unlock(v49);
    swift_release();
    objc_msgSend(v50, sel_transform);
    float32x4_t v213 = v52;
    *(float32x4_t *)v214 = v51;
    float32x4_t v211 = v54;
    float32x4_t v212 = v53;

    unint64_t v55 = (float32x4_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
    float32x4_t v56 = v213;
    *unint64_t v55 = *(float32x4_t *)v214;
    v55[1] = v56;
    float32x4_t v57 = v211;
    v55[2] = v212;
    v55[3] = v57;
    double v58 = (void (**)(uint64_t))(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_updateHandler);
    swift_beginAccess();
    double v59 = *v58;
    if (*v58)
    {
      uint64_t v60 = swift_retain();
      v59(v60);

      sub_22F1B4AC8((uint64_t)v59);
    }
    else
    {
    }
    return;
  }
  uint64_t v21 = *v16;
  uint64_t v22 = *(os_unfair_lock_s **)(*v16 + 24);
  swift_retain();
  os_unfair_lock_lock(v22);
  swift_beginAccess();
  uint64_t v23 = *(void **)(v21 + 16);
  id v24 = v23;
  os_unfair_lock_unlock(v22);
  swift_release();
  if (!v23)
  {
    __break(1u);
    goto LABEL_89;
  }
  uint64_t v25 = (SEL *)&unk_2649FF000;
  objc_msgSend(v24, sel_transform);
  *(float32x4_t *)v214 = v26;

  float32x4_t v27 = *(float32x4_t *)v214;
  v27.i32[3] = 0;
  float32x4_t v213 = v27;
  uint64_t v28 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__targetAnchor);
  swift_beginAccess();
  uint64_t v29 = *v28;
  uint64_t v30 = *(os_unfair_lock_s **)(v29 + 24);
  swift_retain();
  os_unfair_lock_lock(v30);
  swift_beginAccess();
  id v31 = *(id *)(v29 + 16);
  os_unfair_lock_unlock(v30);
  swift_release();
  objc_msgSend(v31, sel_transform);
  float32x4_t v211 = v32;

  float32x4_t v33 = vsubq_f32(v211, *(float32x4_t *)v214);
  int32x4_t v34 = (int32x4_t)vmulq_f32(v33, v33);
  v34.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v34, 2), vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v34.i8, 1))).u32[0];
  float32x2_t v35 = vrsqrte_f32((float32x2_t)v34.u32[0]);
  float32x2_t v36 = vmul_f32(v35, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v35, v35)));
  float32x4_t v211 = vmulq_n_f32(v33, vmul_f32(v36, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v36, v36))).f32[0]);
  id v37 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane);
  swift_beginAccess();
  v209 = v37;
  uint64_t v38 = *v37;
  uint64_t v39 = *(os_unfair_lock_s **)(v38 + 24);
  swift_retain();
  os_unfair_lock_lock(v39);
  swift_beginAccess();
  unsigned __int8 v40 = *(void **)(v38 + 16);
  swift_retain();
  os_unfair_lock_unlock(v39);
  swift_release();
  if (v40)
  {
    swift_beginAccess();
    uint64_t v41 = v40[2];
    uint64_t v42 = *(os_unfair_lock_s **)(v41 + 24);
    swift_retain();
    swift_retain();
    os_unfair_lock_lock(v42);
    swift_beginAccess();
    id v43 = *(id *)(v41 + 16);
    os_unfair_lock_unlock(v42);
    swift_release();
    swift_release();
    self;
    uint64_t v44 = (void *)swift_dynamicCastObjCClass();
    if (v44)
    {
      id v45 = objc_msgSend(v44, sel__hitTestFromOrigin_withDirection_usingExtent_usingGeometry_, 0, 0, *(double *)v213.i64, *(double *)v211.i64);
    }
    else
    {

      id v45 = 0;
    }
    if (!*((unsigned char *)v40 + 48))
    {
      char v65 = 0;
      v46.i64[0] = *(void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);
      float32x4_t v211 = v46;
      v207 = (float32x4_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);
      v208 = (float32x4_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
      v46.i32[0] = *(_DWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 56);
      float32x4_t v210 = v46;
      goto LABEL_43;
    }
  }
  else
  {
    id v45 = 0;
  }
  v214[0] = v45;
  id v61 = objc_msgSend(v10, sel__hitTestFromOrigin_withDirection_types_, 32, *(double *)v213.i64, *(double *)v211.i64);
  sub_22F1A321C(0, &qword_268695500);
  unint64_t v62 = sub_22F223CB8();

  if (v62 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v63 = sub_22F2245C8();
    swift_bridgeObjectRelease();
    if (v63) {
      goto LABEL_20;
    }
LABEL_27:
    swift_bridgeObjectRelease();
    char v65 = 0;
    id v45 = v214[0];
    goto LABEL_28;
  }
  uint64_t v63 = *(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v63) {
    goto LABEL_27;
  }
LABEL_20:
  if ((v62 & 0xC000000000000001) != 0)
  {
    id v64 = (id)MEMORY[0x230FB2E90](0, v62);
  }
  else
  {
    if (!*(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_87;
    }
    id v64 = *(id *)(v62 + 32);
  }
  char v65 = v64;
  id v45 = v214[0];
  swift_bridgeObjectRelease();
LABEL_28:
  uint64_t v67 = v40;
  if (v40) {
    BOOL v68 = v65 == 0;
  }
  else {
    BOOL v68 = 1;
  }
  int v69 = !v68;
  v66.i64[0] = *(void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);
  float32x4_t v211 = v66;
  v207 = (float32x4_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);
  v208 = (float32x4_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
  v66.i32[0] = *(_DWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 56);
  float32x4_t v210 = v66;
  if (!v65) {
    goto LABEL_41;
  }
  if (v45)
  {
    objc_msgSend(v45, sel_worldTransform);
    float32x4_t v206 = v70;
  }
  else
  {
    uint64_t v71 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__pointAnchor);
    swift_beginAccess();
    uint64_t v72 = *v71;
    long long v73 = *(os_unfair_lock_s **)(v72 + 24);
    swift_retain();
    os_unfair_lock_lock(v73);
    swift_beginAccess();
    id v74 = *(id *)(v72 + 16);
    v213.i64[0] = (uint64_t)v65;
    id v75 = v74;
    long long v76 = v73;
    id v45 = v214[0];
    os_unfair_lock_unlock(v76);
    swift_release();
    objc_msgSend(v75, sel_transform);
    float32x4_t v206 = v77;

    char v65 = (void *)v213.i64[0];
  }
  objc_msgSend(v65, sel_worldTransform);
  if (!v69)
  {
LABEL_41:
    unsigned __int8 v40 = v67;
LABEL_42:
    uint64_t v25 = (SEL *)&unk_2649FF000;
    goto LABEL_43;
  }
  float32x4_t v79 = vsubq_f32(v206, v78);
  float32x4_t v80 = vmulq_f32(v79, v79);
  float v81 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v80, 2), vaddq_f32(v80, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v80.f32, 1))).f32[0]);
  if (v45)
  {
    objc_msgSend(v45, sel_worldTransform);
    float32x4_t v213 = v82;
  }
  else
  {
    float32x4_t v213 = v208[1];
  }
  objc_msgSend(v65, sel_worldTransform);
  unsigned __int8 v40 = v67;
  if (v81 >= 0.003) {
    goto LABEL_42;
  }
  float32x4_t v164 = vmulq_f32(v213, v163);
  uint64_t v25 = (SEL *)&unk_2649FF000;
  if ((float)(v164.f32[2] + vaddv_f32(*(float32x2_t *)v164.f32)) > 0.99619)
  {
    v213.i64[0] = (uint64_t)v65;
    if (qword_268694518 != -1) {
      swift_once();
    }
    v206.i64[0] = qword_26869BE30;
    *(void *)&long long v205 = *(void *)algn_26869BE38;
    *(void *)&long long v230 = 0;
    *((void *)&v230 + 1) = 0xE000000000000000;
    sub_22F2243F8();
    sub_22F223B48();
    v165 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__pointAnchor);
    swift_beginAccess();
    v202 = v165;
    uint64_t v166 = *v165;
    v167 = *(os_unfair_lock_s **)(v166 + 24);
    swift_retain();
    os_unfair_lock_lock(v167);
    swift_beginAccess();
    id v168 = *(id *)(v166 + 16);
    os_unfair_lock_unlock(v167);
    swift_release();
    id v169 = objc_msgSend(v168, sel_identifier);

    sub_22F223828();
    sub_22F223808();
    v203 = *(void (**)(char *, uint64_t))(v212.i64[0] + 8);
    uint64_t v204 = v212.i64[0] + 8;
    v203(v5, v2);
    sub_22F223B48();
    swift_bridgeObjectRelease();
    sub_22F223B48();
    sub_22F223E18();
    sub_22F223B48();
    long long v170 = v230;
    uint64_t v171 = sub_22F2240A8();
    _s17MeasureFoundation3LogV3log_4type9isPrivateySS_So03os_d1_E2_taSbtF_0(v170, *((uint64_t *)&v170 + 1), v171, 0, v206.i64[0], v205);
    swift_bridgeObjectRelease();
    uint64_t v172 = *v209;
    v173 = *(os_unfair_lock_s **)(*v209 + 24);
    swift_retain();
    os_unfair_lock_lock(v173);
    swift_beginAccess();
    uint64_t v174 = *(void *)(v172 + 16);
    swift_retain();
    os_unfair_lock_unlock(v173);
    swift_release();
    if (!v174) {
      goto LABEL_91;
    }
    swift_beginAccess();
    uint64_t v175 = *(void *)(v174 + 16);
    v176 = *(os_unfair_lock_s **)(v175 + 24);
    swift_retain();
    os_unfair_lock_lock(v176);
    swift_beginAccess();
    id v177 = *(id *)(v175 + 16);
    os_unfair_lock_unlock(v176);
    swift_release();
    swift_release();
    sub_22F204860(v177);

    swift_release();
    char v65 = (void *)v213.i64[0];
    unsigned __int8 v40 = objc_msgSend((id)v213.i64[0], sel_anchor);
    if (v40)
    {
      self;
      uint64_t v178 = swift_dynamicCastObjCClass();
      if (v178)
      {
        v179 = (void *)v178;
        id v180 = v65;
        id v181 = objc_msgSend(v180, sel_anchor);
        if (!v181)
        {
LABEL_92:
          __break(1u);
          return;
        }
        v182 = v181;
        v209 = v40;
        type metadata accessor for WorldPlane();
        swift_allocObject();
        unsigned __int8 v40 = (void *)sub_22F210A98(v182, 0, 0.0, 1.0);

        objc_msgSend(v180, sel_worldTransform);
        long long v230 = xmmword_22F228C60;
        long long v231 = v183;
        long long v232 = v184;
        long long v233 = v185;
        long long v234 = v186;
        uint64_t v235 = 0;
        uint64_t v236 = 0;
        char v237 = 1;
        v238 = v40;
        int v239 = 0;
        swift_retain();
        sub_22F2105E8();
        int v188 = v187;

        swift_release();
        v189 = (_DWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_confidence);
        swift_beginAccess();
        _DWORD *v189 = v188;
        swift_retain();
        sub_22F204290(v179);
        v206.i64[0] = (uint64_t)v180;
        id v200 = v179;
        if (qword_268694520 != -1) {
          swift_once();
        }
        *(void *)&long long v205 = qword_26869BE48;
        uint64_t v201 = unk_26869BE50;
        *(void *)&long long v220 = 0;
        *((void *)&v220 + 1) = 0xE000000000000000;
        sub_22F2243F8();
        swift_bridgeObjectRelease();
        strcpy((char *)&v220, "World anchor ");
        HIWORD(v220) = -4864;
        uint64_t v190 = *v202;
        v191 = *(os_unfair_lock_s **)(*v202 + 24);
        swift_retain();
        os_unfair_lock_lock(v191);
        swift_beginAccess();
        id v192 = *(id *)(v190 + 16);
        os_unfair_lock_unlock(v191);
        swift_release();
        id v193 = objc_msgSend(v192, sel_identifier);

        sub_22F223828();
        sub_22F223808();
        v194 = v203;
        v203(v5, v2);
        sub_22F223B48();
        swift_bridgeObjectRelease();
        sub_22F223B48();
        id v195 = objc_msgSend(v200, sel_identifier);
        sub_22F223828();

        sub_22F223808();
        v194(v5, v2);
        sub_22F223B48();
        swift_bridgeObjectRelease();
        sub_22F223B48();
        uint64_t v197 = *((void *)&v220 + 1);
        uint64_t v196 = v220;
        uint64_t v198 = sub_22F2240A8();
        _s17MeasureFoundation3LogV3log_4type9isPrivateySS_So03os_d1_E2_taSbtF_0(v196, v197, v198, 0, v205, v201);

        swift_release();
        swift_bridgeObjectRelease();
        id v83 = (id)v206.i64[0];

        char v65 = (void *)v213.i64[0];
        id v45 = (id)v213.i64[0];
        uint64_t v25 = (SEL *)&unk_2649FF000;
        goto LABEL_45;
      }

      unsigned __int8 v40 = 0;
    }
    uint64_t v25 = (SEL *)&unk_2649FF000;
    id v45 = v214[0];
  }
LABEL_43:
  if (!v45)
  {
    v213.i64[0] = (uint64_t)v65;
    v209 = v40;
    v214[0] = 0;
    goto LABEL_58;
  }
  id v83 = v45;
LABEL_45:
  objc_msgSend(v83, sel_worldTransform);
  v85.i32[0] = vextq_s8(v84, v84, 8uLL).u32[0];
  v85.i32[1] = v84.i32[0];
  float32x2_t v86 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v211.f32, 0);
  v86.i32[0] = v210.i32[0];
  float32x2_t v87 = vsub_f32(v85, v86);
  float32x2_t v88 = vmul_f32(v87, v87);
  v209 = v40;
  v213.i64[0] = (uint64_t)v65;
  if (sqrtf(v88.f32[0]+ (float)(v88.f32[1]+ (float)((float)(*(float *)&v84.i32[1] - v211.f32[1]) * (float)(*(float *)&v84.i32[1] - v211.f32[1])))) <= 0.00000011921)
  {
    v214[0] = v45;
LABEL_58:
    uint64_t v63 = v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__pointAnchor;
    swift_beginAccess();
    uint64_t v136 = *(void *)v63;
    v137 = *(os_unfair_lock_s **)(*(void *)v63 + 24);
    swift_retain();
    os_unfair_lock_lock(v137);
    swift_beginAccess();
    id v138 = *(id *)(v136 + 16);
    os_unfair_lock_unlock(v137);
    swift_release();
    [v138 v25[276]];
    float32x4_t v206 = v139;

    float32x2_t v140 = vsub_f32(*(float32x2_t *)v206.f32, *(float32x2_t *)v211.f32);
    if (sqrtf((float)((float)(v206.f32[2] - v210.f32[0]) * (float)(v206.f32[2] - v210.f32[0]))+ vaddv_f32(vmul_f32(v140, v140))) <= 0.00000011921)
    {

LABEL_68:
      swift_release();

      return;
    }
    uint64_t v141 = *(void *)v63;
    v142 = *(os_unfair_lock_s **)(*(void *)v63 + 24);
    swift_retain();
    os_unfair_lock_lock(v142);
    swift_beginAccess();
    id v143 = *(id *)(v141 + 16);
    os_unfair_lock_unlock(v142);
    swift_release();
    [v143 v25[276]];
    float32x4_t v210 = v145;
    float32x4_t v211 = v144;
    long long v205 = v147;
    float32x4_t v206 = v146;

    uint64_t v148 = v208;
    float32x4_t v149 = v210;
    float32x4_t *v208 = v211;
    v148[1] = v149;
    v148[2] = v206;
    float32x4_t *v207 = (float32x4_t)v205;
    uint64_t v150 = (void (**)(uint64_t))(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_updateHandler);
    swift_beginAccess();
    v151 = *v150;
    if (*v150)
    {
      uint64_t v152 = swift_retain();
      v151(v152);
      sub_22F1B4AC8((uint64_t)v151);
    }
    if (qword_268694510 == -1)
    {
LABEL_62:
      swift_beginAccess();
      if (qword_26869BDF8)
      {
        sub_22F1AD024((uint64_t)&static WorldAnchor.delegate, (uint64_t)&v220);
        uint64_t v153 = v221.i64[1];
        uint64_t v154 = v222.i64[0];
        __swift_project_boxed_opaque_existential_0(&v220, v221.i64[1]);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v154 + 16))(v1, v153, v154);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v220);
      }
      if (qword_268694520 != -1) {
        swift_once();
      }
      uint64_t v155 = qword_26869BE48;
      uint64_t v156 = unk_26869BE50;
      *(void *)&long long v220 = 0;
      *((void *)&v220 + 1) = 0xE000000000000000;
      sub_22F2243F8();
      long long v219 = v220;
      sub_22F223B48();
      uint64_t v157 = *(void *)v63;
      v158 = *(os_unfair_lock_s **)(*(void *)v63 + 24);
      swift_retain();
      os_unfair_lock_lock(v158);
      swift_beginAccess();
      id v159 = *(id *)(v157 + 16);
      os_unfair_lock_unlock(v158);
      swift_release();
      id v160 = objc_msgSend(v159, sel_identifier);

      sub_22F223828();
      sub_22F223808();
      (*(void (**)(char *, uint64_t))(v212.i64[0] + 8))(v5, v2);
      sub_22F223B48();
      swift_bridgeObjectRelease();
      sub_22F223B48();
      sub_22F223E18();
      sub_22F223B48();
      long long v161 = v219;
      uint64_t v162 = sub_22F2240C8();
      _s17MeasureFoundation3LogV3log_4type9isPrivateySS_So03os_d1_E2_taSbtF_0(v161, *((uint64_t *)&v161 + 1), v162, 0, v155, v156);

      swift_bridgeObjectRelease();
      goto LABEL_68;
    }
LABEL_87:
    swift_once();
    goto LABEL_62;
  }
  id v89 = v83;
  id v90 = objc_msgSend(v89, sel_anchor);
  if (!v90)
  {
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  uint64_t v91 = v90;
  type metadata accessor for WorldPlane();
  swift_allocObject();
  uint64_t v92 = sub_22F210A98(v91, 0, 0.0, 1.0);

  objc_msgSend(v89, sel_worldTransform);
  *(float32x4_t *)v214 = v93;
  float32x4_t v210 = v95;
  float32x4_t v211 = v94;
  float32x4_t v206 = v96;
  long long v220 = xmmword_22F228C60;
  float32x4_t v221 = v93;
  float32x4_t v222 = v94;
  float32x4_t v223 = v95;
  float32x4_t v224 = v96;
  uint64_t v226 = 0;
  uint64_t v225 = 0;
  char v227 = 1;
  uint64_t v228 = v92;
  int v229 = 0;
  swift_retain();
  sub_22F2105E8();
  int v98 = v97;
  *(void *)&long long v205 = v89;

  uint64_t v204 = v92;
  swift_release();
  uint64_t v99 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__pointAnchor);
  swift_beginAccess();
  uint64_t v100 = *v99;
  id v101 = *(os_unfair_lock_s **)(*v99 + 24);
  swift_retain();
  os_unfair_lock_lock(v101);
  swift_beginAccess();
  id v102 = *(id *)(v100 + 16);
  os_unfair_lock_unlock(v101);
  swift_release();
  id v103 = objc_allocWithZone(MEMORY[0x263F20E38]);
  id v104 = objc_msgSend(v103, sel_initWithTransform_, *(double *)v214, *(double *)v211.i64, *(double *)v210.i64, *(double *)v206.i64);
  uint64_t v105 = sub_22F2065E4(v102, v104);
  id v106 = v105;

  if (!v105)
  {
LABEL_90:
    __break(1u);
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  uint64_t v107 = *v99;
  uint64_t v108 = *(os_unfair_lock_s **)(*v99 + 24);
  id v109 = v106;
  swift_retain();
  os_unfair_lock_lock(v108);
  swift_beginAccess();
  int v110 = *(void **)(v107 + 16);
  *(void *)(v107 + 16) = v109;
  id v111 = v109;

  os_unfair_lock_unlock(v108);
  swift_release();
  v112 = (_DWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_confidence);
  swift_beginAccess();
  _DWORD *v112 = v98;
  if (qword_268694520 != -1) {
    swift_once();
  }
  uint64_t v113 = unk_26869BE50;
  v214[0] = (id)qword_26869BE48;
  uint64_t v215 = 0;
  unint64_t v216 = 0xE000000000000000;
  sub_22F2243F8();
  sub_22F223B48();
  uint64_t v114 = *v99;
  v115 = *(os_unfair_lock_s **)(*v99 + 24);
  swift_retain();
  os_unfair_lock_lock(v115);
  swift_beginAccess();
  id v116 = *(id *)(v114 + 16);
  os_unfair_lock_unlock(v115);
  swift_release();
  id v117 = objc_msgSend(v116, sel_identifier);

  sub_22F223828();
  sub_22F223808();
  (*(void (**)(char *, uint64_t))(v212.i64[0] + 8))(v5, v2);
  sub_22F223B48();
  swift_bridgeObjectRelease();
  sub_22F223B48();
  sub_22F223E18();
  sub_22F223B48();
  uint64_t v118 = v215;
  uint64_t v119 = v216;
  uint64_t v120 = sub_22F2240C8();
  _s17MeasureFoundation3LogV3log_4type9isPrivateySS_So03os_d1_E2_taSbtF_0(v118, v119, v120, 0, (uint64_t)v214[0], v113);
  swift_bridgeObjectRelease();
  uint64_t v121 = *v99;
  float32x4_t v122 = *(os_unfair_lock_s **)(*v99 + 24);
  swift_retain();
  os_unfair_lock_lock(v122);
  swift_beginAccess();
  id v123 = *(id *)(v121 + 16);
  os_unfair_lock_unlock(v122);
  swift_release();
  objc_msgSend(v123, sel_transform);
  *(float32x4_t *)v214 = v124;
  float32x4_t v211 = v126;
  float32x4_t v212 = v125;
  float32x4_t v210 = v127;

  unint64_t v128 = v208;
  float32x4_t v129 = v212;
  float32x4_t *v208 = *(float32x4_t *)v214;
  v128[1] = v129;
  v128[2] = v211;
  float32x4_t *v207 = v210;
  uint64_t v130 = (void (**)(uint64_t))(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_updateHandler);
  swift_beginAccess();
  v131 = *v130;
  if (*v130)
  {
    uint64_t v132 = swift_retain();
    v131(v132);
    sub_22F1B4AC8((uint64_t)v131);
  }
  uint64_t v133 = (void *)v213.i64[0];
  if (qword_268694510 != -1) {
    swift_once();
  }
  swift_beginAccess();
  if (qword_26869BDF8)
  {
    sub_22F1AD024((uint64_t)&static WorldAnchor.delegate, (uint64_t)&v215);
    uint64_t v134 = v217;
    uint64_t v135 = v218;
    __swift_project_boxed_opaque_existential_0(&v215, v217);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v135 + 16))(v1, v134, v135);

    swift_release();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v215);
  }
  else
  {

    swift_release();
  }

  swift_release();
}

uint64_t sub_22F204290(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = sub_22F223848();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  id v11 = (char *)&v39 - v10;
  MEMORY[0x270FA5388](v9);
  id v13 = (char *)&v39 - v12;
  self;
  if (!swift_dynamicCastObjCClass())
  {
    swift_beginAccess();
    uint64_t result = static WorldAnchor.arSession;
    if (!static WorldAnchor.arSession)
    {
      __break(1u);
      return result;
    }
    objc_msgSend((id)static WorldAnchor.arSession, sel_addAnchor_, a1);
  }
  uint64_t v39 = v3;
  unsigned __int8 v40 = v11;
  uint64_t v41 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695498);
  uint64_t v15 = swift_allocObject();
  swift_weakInit();
  swift_beginAccess();
  swift_weakAssign();
  sub_22F2247E8();
  sub_22F208760((unint64_t *)&qword_268694C50, MEMORY[0x263F07508]);
  swift_retain();
  sub_22F2239F8();
  uint64_t v16 = sub_22F224818();
  swift_release();
  *(void *)(v15 + 24) = v16;
  id v17 = objc_msgSend(a1, sel_identifier);
  sub_22F223828();

  if (qword_268694508 != -1) {
    swift_once();
  }
  uint64_t v18 = off_268695CE8;
  uint64_t v19 = (os_unfair_lock_s *)*((void *)off_268695CE8 + 3);
  swift_retain();
  os_unfair_lock_lock(v19);
  swift_beginAccess();
  uint64_t v20 = v18[2];
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v19);
  swift_release();
  if (*(void *)(v20 + 16) && (sub_22F18DD24((uint64_t)v13), (v21 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v22 = *(void (**)(char *, uint64_t))(v41 + 8);
    v22(v13, v4);
    swift_bridgeObjectRelease();
    id v23 = objc_msgSend(a1, sel_identifier);
    id v24 = v40;
    sub_22F223828();

    uint64_t v25 = sub_22F200384(v44);
    float32x4_t v26 = sub_22F1DC904(v42);
    if (*v27)
    {
      swift_retain();
      sub_22F1C52C0(&v43, v15);
      ((void (*)(void *, void))v26)(v42, 0);
      v22(v24, v4);
      v25((uint64_t)v44, 0);
      swift_release();
    }
    else
    {
      ((void (*)(void *, void))v26)(v42, 0);
      v22(v24, v4);
      v25((uint64_t)v44, 0);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v28 = *(void (**)(char *, uint64_t))(v41 + 8);
    v28(v13, v4);
    id v29 = objc_msgSend(a1, sel_identifier);
    sub_22F223828();

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268695250);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_22F228080;
    *(void *)(inited + 32) = v15;
    v44[0] = inited;
    sub_22F223CD8();
    unint64_t v31 = v44[0];
    swift_retain();
    uint64_t v32 = sub_22F206498(v31);
    swift_bridgeObjectRelease();
    float32x4_t v33 = off_268695CE8;
    int32x4_t v34 = (os_unfair_lock_s *)*((void *)off_268695CE8 + 3);
    swift_retain();
    os_unfair_lock_lock(v34);
    swift_beginAccess();
    uint64_t v35 = *((void *)v33 + 2);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v34);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v42[0] = v35;
    sub_22F1E7E8C(v32, (uint64_t)v8, isUniquelyReferenced_nonNull_native);
    uint64_t v37 = v42[0];
    swift_bridgeObjectRelease();
    v28(v8, v4);
    uint64_t v38 = (os_unfair_lock_s *)*((void *)v33 + 3);
    os_unfair_lock_lock(v38);
    *((void *)v33 + 2) = v37;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v38);
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_22F204860(void *a1)
{
  uint64_t v2 = sub_22F223848();
  uint64_t v38 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v8 = (char *)&v35 - v7;
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v35 - v9;
  self;
  if (!swift_dynamicCastObjCClass())
  {
    swift_beginAccess();
    uint64_t result = static WorldAnchor.arSession;
    if (!static WorldAnchor.arSession)
    {
      __break(1u);
      return result;
    }
    objc_msgSend((id)static WorldAnchor.arSession, sel_removeAnchor_, a1);
  }
  float32x2_t v36 = v5;
  id v37 = a1;
  id v12 = objc_msgSend(a1, sel_identifier);
  sub_22F223828();

  id v13 = sub_22F200384(v40);
  uint64_t v14 = sub_22F1DC904(v39);
  if (*v15)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268695498);
    uint64_t v16 = swift_allocObject();
    swift_weakInit();
    swift_beginAccess();
    swift_weakAssign();
    sub_22F2247E8();
    sub_22F208760((unint64_t *)&qword_268694C50, MEMORY[0x263F07508]);
    swift_retain();
    sub_22F2239F8();
    uint64_t v17 = sub_22F224818();
    swift_release();
    *(void *)(v16 + 24) = v17;
    sub_22F1E13C4(v16);
    swift_release();
    ((void (*)(void *, void))v14)(v39, 0);
    uint64_t v18 = *(void (**)(char *, uint64_t))(v38 + 8);
    v18(v10, v2);
    v13((uint64_t)v40, 0);
    swift_release();
  }
  else
  {
    ((void (*)(void *, void))v14)(v39, 0);
    uint64_t v18 = *(void (**)(char *, uint64_t))(v38 + 8);
    v18(v10, v2);
    v13((uint64_t)v40, 0);
  }
  id v19 = v37;
  id v20 = objc_msgSend(v37, sel_identifier);
  sub_22F223828();

  if (qword_268694508 != -1) {
    swift_once();
  }
  char v21 = off_268695CE8;
  uint64_t v22 = (os_unfair_lock_s *)*((void *)off_268695CE8 + 3);
  swift_retain();
  os_unfair_lock_lock(v22);
  swift_beginAccess();
  uint64_t v23 = v21[2];
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v22);
  swift_release();
  if (*(void *)(v23 + 16) && (unint64_t v24 = sub_22F18DD24((uint64_t)v8), (v25 & 1) != 0))
  {
    uint64_t v26 = *(void *)(*(void *)(v23 + 56) + 8 * v24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v18(v8, v2);
    if ((v26 & 0xC000000000000001) != 0) {
      uint64_t v27 = sub_22F224348();
    }
    else {
      uint64_t v27 = *(void *)(v26 + 16);
    }
    uint64_t result = swift_bridgeObjectRelease();
    if (!v27)
    {
      id v28 = objc_msgSend(v19, sel_identifier);
      uint64_t v29 = (uint64_t)v36;
      sub_22F223828();

      uint64_t v30 = off_268695CE8;
      unint64_t v31 = (os_unfair_lock_s *)*((void *)off_268695CE8 + 3);
      swift_retain();
      os_unfair_lock_lock(v31);
      swift_beginAccess();
      uint64_t v32 = *((void *)v30 + 2);
      swift_bridgeObjectRetain();
      os_unfair_lock_unlock(v31);
      v39[0] = v32;
      sub_22F205AF8(v29);
      v18((char *)v29, v2);
      swift_bridgeObjectRelease();
      uint64_t v33 = v39[0];
      int32x4_t v34 = (os_unfair_lock_s *)*((void *)v30 + 3);
      os_unfair_lock_lock(v34);
      *((void *)v30 + 2) = v33;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      os_unfair_lock_unlock(v34);
      swift_bridgeObjectRelease();
      return swift_release();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(char *, uint64_t))v18)(v8, v2);
  }
  return result;
}

uint64_t static WorldAnchor.didUpdate(anchors:camera:forceUpdate:)(unint64_t a1, uint64_t a2, char a3)
{
  LOBYTE(v3) = a3;
  uint64_t v41 = a2;
  uint64_t v47 = sub_22F223848();
  uint64_t v5 = *(void *)(v47 - 8);
  MEMORY[0x270FA5388](v47);
  uint64_t v7 = (uint64_t)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_55;
  }
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v8)
  {
LABEL_3:
    unint64_t v9 = 0;
    uint64_t v48 = 0;
    unint64_t v46 = a1 & 0xC000000000000001;
    uint64_t v39 = a1 & 0xFFFFFFFFFFFFFF8;
    unint64_t v42 = a1;
    unint64_t v38 = a1 + 32;
    id v45 = (void (**)(uint64_t, uint64_t))(v5 + 8);
    a1 = MEMORY[0x263F8EE78];
    uint64_t v51 = MEMORY[0x263F8EE50] + 8;
    int v40 = v3 & 1;
    uint64_t v43 = v8;
    uint64_t v44 = v7;
LABEL_5:
    if (v46)
    {
      id v11 = (id)MEMORY[0x230FB2E90](v9, v42);
    }
    else
    {
      if (v9 >= *(void *)(v39 + 16)) {
        goto LABEL_54;
      }
      id v11 = *(id *)(v38 + 8 * v9);
    }
    id v12 = v11;
    if (__OFADD__(v9++, 1)) {
      goto LABEL_53;
    }
    id v14 = objc_msgSend(v11, sel_identifier);
    sub_22F223828();

    if (qword_268694508 != -1) {
      swift_once();
    }
    uint64_t v15 = off_268695CE8;
    uint64_t v16 = (os_unfair_lock_s *)*((void *)off_268695CE8 + 3);
    swift_retain();
    os_unfair_lock_lock(v16);
    swift_beginAccess();
    uint64_t v17 = v15[2];
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v16);
    swift_release();
    if (*(void *)(v17 + 16) && (unint64_t v18 = sub_22F18DD24(v7), (v19 & 1) != 0))
    {
      uint64_t v20 = *(void *)(*(void *)(v17 + 56) + 8 * v18);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v20 = 0;
    }
    swift_bridgeObjectRelease();
    (*v45)(v7, v47);
    unint64_t v3 = MEMORY[0x263F8EE88];
    if ((a1 & 0xC000000000000000) != 0 && sub_22F2245C8()) {
      unint64_t v3 = sub_22F195F94(a1);
    }
    unint64_t v54 = v3;
    if (v20)
    {
      id v21 = v12;
      uint64_t v22 = v48;
      sub_22F20614C(v20, v21, v41, v40);
      uint64_t v48 = v22;
      swift_bridgeObjectRelease();

      unint64_t v3 = v54;
    }
    id v50 = v12;
    if ((v3 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      sub_22F2242F8();
      type metadata accessor for WorldAnchor();
      sub_22F208760(&qword_268695D40, (void (*)(uint64_t))type metadata accessor for WorldAnchor);
      sub_22F223E78();
      unint64_t v3 = v55;
      unint64_t v23 = v56;
      uint64_t v5 = v57;
      uint64_t v24 = v58;
      unint64_t v25 = v59;
    }
    else
    {
      uint64_t v26 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v23 = v3 + 56;
      uint64_t v5 = ~v26;
      uint64_t v27 = -v26;
      if (v27 < 64) {
        uint64_t v28 = ~(-1 << v27);
      }
      else {
        uint64_t v28 = -1;
      }
      unint64_t v25 = v28 & *(void *)(v3 + 56);
      swift_bridgeObjectRetain();
      uint64_t v24 = 0;
    }
    a1 = v3 & 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v49 = v5;
    int64_t v29 = (unint64_t)(v5 + 64) >> 6;
    if ((v3 & 0x8000000000000000) != 0)
    {
LABEL_28:
      uint64_t v5 = v3 & 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v30 = sub_22F224378();
      if (!v30) {
        goto LABEL_4;
      }
      uint64_t v52 = v30;
      type metadata accessor for WorldAnchor();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v5 = v53;
      swift_unknownObjectRelease();
      uint64_t v7 = v24;
      uint64_t v31 = v25;
      if (!v5) {
        goto LABEL_4;
      }
      goto LABEL_43;
    }
    while (1)
    {
      if (v25)
      {
        uint64_t v31 = (v25 - 1) & v25;
        unint64_t v32 = __clz(__rbit64(v25)) | (v24 << 6);
        uint64_t v7 = v24;
      }
      else
      {
        uint64_t v7 = v24 + 1;
        if (__OFADD__(v24, 1))
        {
          __break(1u);
LABEL_53:
          __break(1u);
LABEL_54:
          __break(1u);
LABEL_55:
          swift_bridgeObjectRetain();
          uint64_t v8 = sub_22F2245C8();
          if (!v8) {
            break;
          }
          goto LABEL_3;
        }
        if (v7 >= v29) {
          goto LABEL_4;
        }
        unint64_t v33 = *(void *)(v23 + 8 * v7);
        if (!v33)
        {
          uint64_t v34 = v24 + 2;
          if (v24 + 2 >= v29) {
            goto LABEL_4;
          }
          unint64_t v33 = *(void *)(v23 + 8 * v34);
          if (v33) {
            goto LABEL_40;
          }
          uint64_t v34 = v24 + 3;
          if (v24 + 3 >= v29) {
            goto LABEL_4;
          }
          unint64_t v33 = *(void *)(v23 + 8 * v34);
          if (v33)
          {
LABEL_40:
            uint64_t v7 = v34;
          }
          else
          {
            uint64_t v7 = v24 + 4;
            if (v24 + 4 >= v29)
            {
LABEL_4:
              uint64_t v10 = v43;
              a1 = MEMORY[0x263F8EE78];
              sub_22F196330();

              swift_bridgeObjectRelease();
              uint64_t v7 = v44;
              if (v9 == v10) {
                break;
              }
              goto LABEL_5;
            }
            unint64_t v33 = *(void *)(v23 + 8 * v7);
            if (!v33)
            {
              uint64_t v35 = v24 + 5;
              while (v29 != v35)
              {
                unint64_t v33 = *(void *)(v23 + 8 * v35++);
                if (v33)
                {
                  uint64_t v7 = v35 - 1;
                  goto LABEL_41;
                }
              }
              goto LABEL_4;
            }
          }
        }
LABEL_41:
        uint64_t v31 = (v33 - 1) & v33;
        unint64_t v32 = __clz(__rbit64(v33)) + (v7 << 6);
      }
      uint64_t v5 = *(void *)(*(void *)(v3 + 48) + 8 * v32);
      swift_retain();
      if (!v5) {
        goto LABEL_4;
      }
LABEL_43:
      WorldAnchor.update()();
      swift_release();
      uint64_t v24 = v7;
      unint64_t v25 = v31;
      if ((v3 & 0x8000000000000000) != 0) {
        goto LABEL_28;
      }
    }
  }
  swift_bridgeObjectRelease();
  return _s17MeasureFoundation11WorldAnchorC6didAdd7anchorsySaySo8ARAnchorCG_tFZ_0();
}

uint64_t static WorldAnchor.didRemove(anchors:)(unint64_t a1)
{
  uint64_t v26 = sub_22F223848();
  uint64_t v2 = *(void *)(v26 - 8);
  MEMORY[0x270FA5388](v26);
  uint64_t v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x263F8EE78];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_22F2245C8();
    uint64_t v5 = result;
    if (!result) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v5) {
      goto LABEL_15;
    }
  }
  if (v5 < 1)
  {
    __break(1u);
    goto LABEL_36;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      MEMORY[0x230FB2E90](i, a1);
      self;
      if (swift_dynamicCastObjCClass())
      {
        sub_22F224468();
        sub_22F2244A8();
        sub_22F2244B8();
        sub_22F224478();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    for (uint64_t j = 0; j != v5; ++j)
    {
      unint64_t v9 = *(void **)(a1 + 8 * j + 32);
      self;
      if (swift_dynamicCastObjCClass())
      {
        id v10 = v9;
        sub_22F224468();
        sub_22F2244A8();
        sub_22F2244B8();
        sub_22F224478();
      }
    }
  }
LABEL_15:
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v11 = v27;
  if ((v27 & 0x8000000000000000) == 0 && (v27 & 0x4000000000000000) == 0)
  {
    uint64_t v12 = *(void *)(v27 + 16);
    if (v12) {
      goto LABEL_18;
    }
LABEL_32:
    return swift_release();
  }
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_22F2245C8();
  uint64_t result = swift_release();
  if (!v12) {
    goto LABEL_32;
  }
LABEL_18:
  if (v12 >= 1)
  {
    uint64_t v13 = 0;
    unint64_t v25 = v11 & 0xC000000000000001;
    id v14 = (void (**)(char *, uint64_t))(v2 + 8);
    do
    {
      if (v25) {
        id v15 = (id)MEMORY[0x230FB2E90](v13, v11);
      }
      else {
        id v15 = *(id *)(v11 + 8 * v13 + 32);
      }
      uint64_t v16 = v15;
      id v17 = objc_msgSend(v15, sel_identifier, v25);
      sub_22F223828();

      if (qword_268694508 != -1) {
        swift_once();
      }
      unint64_t v18 = off_268695CE8;
      char v19 = (os_unfair_lock_s *)*((void *)off_268695CE8 + 3);
      swift_retain();
      os_unfair_lock_lock(v19);
      swift_beginAccess();
      uint64_t v20 = v18[2];
      swift_bridgeObjectRetain();
      os_unfair_lock_unlock(v19);
      swift_release();
      if (*(void *)(v20 + 16) && (unint64_t v21 = sub_22F18DD24((uint64_t)v4), (v22 & 1) != 0))
      {
        uint64_t v23 = *(void *)(*(void *)(v20 + 56) + 8 * v21);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        (*v14)(v4, v26);
        id v24 = v16;
        sub_22F206A60(v23, v24);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        (*v14)(v4, v26);
      }
      ++v13;
    }
    while (v12 != v13);
    return swift_release();
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t static WorldAnchor.resetPlanesConfidence()()
{
  return _s17MeasureFoundation11WorldAnchorC07forEachD0yyyAA15HashableWeakRefCyACGXEFZ_0((void (*)(uint64_t))sub_22F2057C0, 0);
}

uint64_t sub_22F2057C0()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane;
    swift_beginAccess();
    uint64_t v2 = *(void *)v1;
    uint64_t v3 = *(os_unfair_lock_s **)(*(void *)v1 + 24);
    swift_retain();
    os_unfair_lock_lock(v3);
    swift_beginAccess();
    uint64_t v4 = *(void *)(v2 + 16);
    swift_retain();
    os_unfair_lock_unlock(v3);
    swift_release();
    uint64_t result = swift_release();
    if (v4)
    {
      *(_DWORD *)(v4 + 52) = 0;
      return swift_release();
    }
  }
  return result;
}

uint64_t WorldAnchor.hashValue.getter()
{
  return sub_22F224818();
}

uint64_t sub_22F205928()
{
  return sub_22F224818();
}

uint64_t sub_22F2059C0()
{
  return sub_22F2239F8();
}

uint64_t sub_22F205A48()
{
  return sub_22F224818();
}

uint64_t sub_22F205ADC()
{
  return sub_22F223818();
}

uint64_t sub_22F205AF8(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_22F18DD24(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  uint64_t v12 = *v2;
  uint64_t *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_22F193D30();
    uint64_t v7 = v12;
  }
  uint64_t v8 = *(void *)(v7 + 48);
  uint64_t v9 = sub_22F223848();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v4, v9);
  uint64_t v10 = *(void *)(*(void *)(v7 + 56) + 8 * v4);
  sub_22F195010(v4, v7);
  uint64_t *v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

void sub_22F205BF0(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      if (a4 < 0) {
        uint64_t v7 = a4;
      }
      else {
        uint64_t v7 = a4 & 0xFFFFFFFFFFFFFF8;
      }
      MEMORY[0x230FB2DD0](a1, a2, v7);
      sub_22F1A321C(0, (unint64_t *)&qword_2686954A0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
LABEL_27:
    __break(1u);
    return;
  }
  if (a3) {
    goto LABEL_13;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_20;
  }
  __break(1u);
LABEL_13:
  if (sub_22F224328() != *(_DWORD *)(a4 + 36))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  sub_22F224338();
  sub_22F1A321C(0, (unint64_t *)&qword_2686954A0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  unint64_t v4 = v17;
  swift_unknownObjectRelease();
  uint64_t v8 = sub_22F2241B8();
  uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v8 & ~v9;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_26:

    __break(1u);
    goto LABEL_27;
  }
  id v10 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v11 = sub_22F2241C8();

  if ((v11 & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v6 = (v6 + 1) & v12;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_26;
      }
      id v13 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v14 = sub_22F2241C8();
    }
    while ((v14 & 1) == 0);
  }

LABEL_20:
  id v15 = *(void **)(*(void *)(a4 + 48) + 8 * v6);
  id v16 = v15;
}

uint64_t sub_22F205E68(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v5 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      if (a4 < 0) {
        uint64_t v6 = a4;
      }
      else {
        uint64_t v6 = a4 & 0xFFFFFFFFFFFFFF8;
      }
      MEMORY[0x230FB2DD0](a1, a2, v6);
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268695498);
      swift_dynamicCast();
      uint64_t v7 = v16;
      swift_unknownObjectRelease();
      return v7;
    }
    goto LABEL_30;
  }
  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
    {
      __break(1u);
      goto LABEL_27;
    }
    if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0) {
      goto LABEL_28;
    }
    if (*(_DWORD *)(a4 + 36) == a2) {
      goto LABEL_24;
    }
    __break(1u);
  }
  if (sub_22F224328() != *(_DWORD *)(a4 + 36))
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    swift_release();
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  sub_22F224338();
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695498);
  swift_dynamicCast();
  swift_unknownObjectRelease();
  sub_22F2247E8();
  sub_22F2247F8();
  uint64_t v8 = sub_22F224818();
  uint64_t v9 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v5 = v8 & ~v9;
  if (((*(void *)(a4 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
  {
LABEL_31:
    uint64_t result = swift_release();
    __break(1u);
    return result;
  }
  uint64_t v10 = ~v9;
  swift_beginAccess();
  while (1)
  {
    uint64_t v12 = *(void *)(*(void *)(a4 + 48) + 8 * v5);
    swift_beginAccess();
    if (!swift_weakLoadStrong()) {
      break;
    }
    if (!swift_weakLoadStrong())
    {
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_retain();
    char v11 = sub_22F223818();
    swift_release();
    swift_release();
    swift_release();
    if (v11) {
      goto LABEL_23;
    }
LABEL_17:
    unint64_t v5 = (v5 + 1) & v10;
    if (((*(void *)(a4 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) == 0) {
      goto LABEL_29;
    }
  }
  swift_retain();
LABEL_22:
  uint64_t v13 = *(void *)(v12 + 24);
  uint64_t v14 = *(void *)(v16 + 24);
  swift_release();
  if (v13 != v14) {
    goto LABEL_17;
  }
LABEL_23:
  swift_release();
LABEL_24:
  uint64_t v7 = *(void *)(*(void *)(a4 + 48) + 8 * v5);
  swift_retain();
  return v7;
}

uint64_t sub_22F20614C(uint64_t a1, void *a2, uint64_t a3, char a4)
{
  uint64_t v6 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_22F2242F8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268695498);
    sub_22F2087A8();
    uint64_t result = sub_22F223E78();
    uint64_t v6 = v31;
    uint64_t v29 = v32;
    uint64_t v8 = v33;
    uint64_t v9 = v34;
    unint64_t v10 = v35;
  }
  else
  {
    uint64_t v11 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v29 = a1 + 56;
    uint64_t v12 = ~v11;
    uint64_t v13 = -v11;
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    else {
      uint64_t v14 = -1;
    }
    unint64_t v10 = v14 & *(void *)(a1 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v8 = v12;
    uint64_t v9 = 0;
  }
  int64_t v28 = (unint64_t)(v8 + 64) >> 6;
  while (v6 < 0)
  {
    if (!sub_22F224378()) {
      return sub_22F196330();
    }
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268695498);
    swift_dynamicCast();
    uint64_t v18 = v36;
    swift_unknownObjectRelease();
    uint64_t v17 = v9;
    uint64_t v15 = v10;
    if (!v18) {
      return sub_22F196330();
    }
LABEL_32:
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      uint64_t v24 = Strong;
      char v25 = sub_22F201B54(a2, a3);
      if ((a4 & 1) != 0
        || (char v26 = v25,
            uint64_t v27 = (unsigned char *)(v24 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_autoUpdate),
            swift_beginAccess(),
            (*v27 & 1) != 0)
        && (v26 & 1) != 0)
      {
        sub_22F1C55FC(&v36, v24);
      }
      swift_release();
    }
    uint64_t result = swift_release();
    uint64_t v9 = v17;
    unint64_t v10 = v15;
  }
  if (v10)
  {
    uint64_t v15 = (v10 - 1) & v10;
    unint64_t v16 = __clz(__rbit64(v10)) | (v9 << 6);
    uint64_t v17 = v9;
LABEL_31:
    uint64_t v22 = *(void *)(*(void *)(v6 + 48) + 8 * v16);
    swift_retain();
    if (!v22) {
      return sub_22F196330();
    }
    goto LABEL_32;
  }
  int64_t v19 = v9 + 1;
  if (!__OFADD__(v9, 1))
  {
    if (v19 >= v28) {
      return sub_22F196330();
    }
    unint64_t v20 = *(void *)(v29 + 8 * v19);
    uint64_t v17 = v9 + 1;
    if (!v20)
    {
      uint64_t v17 = v9 + 2;
      if (v9 + 2 >= v28) {
        return sub_22F196330();
      }
      unint64_t v20 = *(void *)(v29 + 8 * v17);
      if (!v20)
      {
        uint64_t v17 = v9 + 3;
        if (v9 + 3 >= v28) {
          return sub_22F196330();
        }
        unint64_t v20 = *(void *)(v29 + 8 * v17);
        if (!v20)
        {
          uint64_t v17 = v9 + 4;
          if (v9 + 4 >= v28) {
            return sub_22F196330();
          }
          unint64_t v20 = *(void *)(v29 + 8 * v17);
          if (!v20)
          {
            uint64_t v17 = v9 + 5;
            if (v9 + 5 >= v28) {
              return sub_22F196330();
            }
            unint64_t v20 = *(void *)(v29 + 8 * v17);
            if (!v20)
            {
              uint64_t v21 = v9 + 6;
              while (v28 != v21)
              {
                unint64_t v20 = *(void *)(v29 + 8 * v21++);
                if (v20)
                {
                  uint64_t v17 = v21 - 1;
                  goto LABEL_30;
                }
              }
              return sub_22F196330();
            }
          }
        }
      }
    }
LABEL_30:
    uint64_t v15 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v17 << 6);
    goto LABEL_31;
  }
  __break(1u);
  return result;
}

uint64_t sub_22F206498(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_22F2245C8();
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695498);
  sub_22F2087A8();
  uint64_t result = sub_22F223E38();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_22F2245C8();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = MEMORY[0x230FB2E90](i, a1);
        sub_22F1C52C0(&v9, v6);
        swift_release();
      }
    }
    else
    {
      uint64_t v7 = (uint64_t *)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        swift_retain();
        sub_22F1C52C0(&v9, v8);
        swift_release();
        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_22F2065E4(void *a1, void *a2)
{
  uint64_t v4 = sub_22F223848();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v33 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_268695530);
  MEMORY[0x270FA5388](v35);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(qword_268695538);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  uint64_t v34 = (uint64_t)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v32 - v13;
  MEMORY[0x270FA5388](v12);
  unint64_t v16 = (char *)&v32 - v15;
  uint64_t v36 = a1;
  id v17 = objc_msgSend(a1, sel_identifier);
  sub_22F223828();

  uint64_t v18 = v5;
  int64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  uint64_t v20 = 1;
  v19(v16, 0, 1, v4);
  if (a2)
  {
    id v21 = objc_msgSend(a2, sel_identifier);
    sub_22F223828();

    uint64_t v20 = 0;
  }
  uint64_t v22 = v35;
  v19(v14, v20, 1, v4);
  uint64_t v23 = (uint64_t)&v8[*(int *)(v22 + 48)];
  sub_22F186CEC((uint64_t)v16, (uint64_t)v8, qword_268695538);
  sub_22F186CEC((uint64_t)v14, v23, qword_268695538);
  uint64_t v24 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v24((uint64_t)v8, 1, v4) == 1)
  {
    sub_22F196338((uint64_t)v14, qword_268695538);
    sub_22F196338((uint64_t)v16, qword_268695538);
    if (v24(v23, 1, v4) == 1)
    {
      sub_22F196338((uint64_t)v8, qword_268695538);
      return v36;
    }
    goto LABEL_8;
  }
  uint64_t v25 = v34;
  sub_22F186CEC((uint64_t)v8, v34, qword_268695538);
  if (v24(v23, 1, v4) == 1)
  {
    sub_22F196338((uint64_t)v14, qword_268695538);
    sub_22F196338((uint64_t)v16, qword_268695538);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v25, v4);
LABEL_8:
    sub_22F196338((uint64_t)v8, &qword_268695530);
    goto LABEL_11;
  }
  char v26 = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(v33, v23, v4);
  sub_22F208760(&qword_268694C78, MEMORY[0x263F07508]);
  uint64_t v27 = v25;
  char v28 = sub_22F223A68();
  uint64_t v29 = *(void (**)(char *, uint64_t))(v18 + 8);
  v29(v26, v4);
  sub_22F196338((uint64_t)v14, qword_268695538);
  sub_22F196338((uint64_t)v16, qword_268695538);
  v29((char *)v27, v4);
  sub_22F196338((uint64_t)v8, qword_268695538);
  if (v28) {
    return v36;
  }
LABEL_11:
  sub_22F204860(v36);
  if (a2)
  {
    id v30 = a2;
    sub_22F204290(v30);
  }
  return a2;
}

uint64_t sub_22F206A60(uint64_t a1, void *a2)
{
  uint64_t v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_22F2242F8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268695498);
    sub_22F2087A8();
    uint64_t result = sub_22F223E78();
    uint64_t v3 = v24;
    uint64_t v23 = v25;
    uint64_t v6 = v26;
    uint64_t v5 = v27;
    unint64_t v7 = v28;
  }
  else
  {
    uint64_t v8 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v23 = a1 + 56;
    uint64_t v6 = ~v8;
    uint64_t v9 = -v8;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v7 = v10 & *(void *)(a1 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v5 = 0;
  }
  int64_t v11 = (unint64_t)(v6 + 64) >> 6;
  while (v3 < 0)
  {
    if (!sub_22F224378()) {
      return sub_22F196330();
    }
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268695498);
    swift_dynamicCast();
    swift_unknownObjectRelease();
    uint64_t v14 = v5;
    uint64_t v12 = v7;
    if (!v29) {
      return sub_22F196330();
    }
LABEL_33:
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    if (Strong)
    {
      uint64_t v20 = Strong;
      self;
      id v21 = (void *)swift_dynamicCastObjCClassUnconditional();
      sub_22F201870(v21);
      sub_22F204860(a2);
      uint64_t v22 = (unsigned char *)(v20 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_autoUpdate);
      swift_beginAccess();
      if (*v22) {
        WorldAnchor.update()();
      }
      swift_release();
    }
    uint64_t result = swift_release();
    uint64_t v5 = v14;
    unint64_t v7 = v12;
  }
  if (v7)
  {
    uint64_t v12 = (v7 - 1) & v7;
    unint64_t v13 = __clz(__rbit64(v7)) | (v5 << 6);
    uint64_t v14 = v5;
LABEL_32:
    uint64_t v18 = *(void *)(*(void *)(v3 + 48) + 8 * v13);
    swift_retain();
    if (!v18) {
      return sub_22F196330();
    }
    goto LABEL_33;
  }
  int64_t v15 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v15 >= v11) {
      return sub_22F196330();
    }
    unint64_t v16 = *(void *)(v23 + 8 * v15);
    uint64_t v14 = v5 + 1;
    if (!v16)
    {
      uint64_t v14 = v5 + 2;
      if (v5 + 2 >= v11) {
        return sub_22F196330();
      }
      unint64_t v16 = *(void *)(v23 + 8 * v14);
      if (!v16)
      {
        uint64_t v14 = v5 + 3;
        if (v5 + 3 >= v11) {
          return sub_22F196330();
        }
        unint64_t v16 = *(void *)(v23 + 8 * v14);
        if (!v16)
        {
          uint64_t v14 = v5 + 4;
          if (v5 + 4 >= v11) {
            return sub_22F196330();
          }
          unint64_t v16 = *(void *)(v23 + 8 * v14);
          if (!v16)
          {
            uint64_t v14 = v5 + 5;
            if (v5 + 5 >= v11) {
              return sub_22F196330();
            }
            unint64_t v16 = *(void *)(v23 + 8 * v14);
            if (!v16)
            {
              uint64_t v17 = v5 + 6;
              while (v11 != v17)
              {
                unint64_t v16 = *(void *)(v23 + 8 * v17++);
                if (v16)
                {
                  uint64_t v14 = v17 - 1;
                  goto LABEL_31;
                }
              }
              return sub_22F196330();
            }
          }
        }
      }
    }
LABEL_31:
    uint64_t v12 = (v16 - 1) & v16;
    unint64_t v13 = __clz(__rbit64(v16)) + (v14 << 6);
    goto LABEL_32;
  }
  __break(1u);
  return result;
}

uint64_t sub_22F206D88(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3 = v2;
  uint64_t v5 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_22F2242F8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268695498);
    sub_22F2087A8();
    uint64_t result = sub_22F223E78();
    uint64_t v5 = v22;
    uint64_t v21 = v23;
    uint64_t v7 = v24;
    int64_t v8 = v25;
    unint64_t v9 = v26;
  }
  else
  {
    uint64_t v10 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v21 = a1 + 56;
    uint64_t v7 = ~v10;
    uint64_t v11 = -v10;
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v9 = v12 & *(void *)(a1 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    int64_t v8 = 0;
  }
  int64_t v20 = (unint64_t)(v7 + 64) >> 6;
  while (1)
  {
    int64_t v16 = v8;
    if ((v5 & 0x8000000000000000) == 0) {
      break;
    }
    if (!sub_22F224378()) {
      return sub_22F196330();
    }
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268695498);
    swift_dynamicCast();
    uint64_t v15 = v27;
    swift_unknownObjectRelease();
    if (!v27) {
      return sub_22F196330();
    }
LABEL_10:
    a2(v15);
    uint64_t result = swift_release();
    if (v3) {
      return sub_22F196330();
    }
  }
  if (v9)
  {
    unint64_t v13 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v14 = v13 | (v8 << 6);
LABEL_9:
    uint64_t v15 = *(void *)(*(void *)(v5 + 48) + 8 * v14);
    swift_retain();
    if (!v15) {
      return sub_22F196330();
    }
    goto LABEL_10;
  }
  ++v8;
  if (!__OFADD__(v16, 1))
  {
    if (v8 >= v20) {
      return sub_22F196330();
    }
    unint64_t v17 = *(void *)(v21 + 8 * v8);
    if (!v17)
    {
      int64_t v18 = v16 + 2;
      if (v16 + 2 >= v20) {
        return sub_22F196330();
      }
      unint64_t v17 = *(void *)(v21 + 8 * v18);
      if (v17) {
        goto LABEL_22;
      }
      int64_t v18 = v16 + 3;
      if (v16 + 3 >= v20) {
        return sub_22F196330();
      }
      unint64_t v17 = *(void *)(v21 + 8 * v18);
      if (v17) {
        goto LABEL_22;
      }
      int64_t v18 = v16 + 4;
      if (v16 + 4 >= v20) {
        return sub_22F196330();
      }
      unint64_t v17 = *(void *)(v21 + 8 * v18);
      if (v17)
      {
LABEL_22:
        int64_t v8 = v18;
      }
      else
      {
        int64_t v8 = v16 + 5;
        if (v16 + 5 >= v20) {
          return sub_22F196330();
        }
        unint64_t v17 = *(void *)(v21 + 8 * v8);
        if (!v17)
        {
          int64_t v19 = v16 + 6;
          while (v20 != v19)
          {
            unint64_t v17 = *(void *)(v21 + 8 * v19++);
            if (v17)
            {
              int64_t v8 = v19 - 1;
              goto LABEL_23;
            }
          }
          return sub_22F196330();
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v8 << 6);
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_22F207054(uint64_t a1, unsigned __int8 a2)
{
  int v3 = a2;
  uint64_t v4 = (uint64_t *)(a1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__pointAnchor);
  swift_beginAccess();
  uint64_t v5 = *v4;
  uint64_t v6 = *(os_unfair_lock_s **)(v5 + 24);
  swift_retain();
  os_unfair_lock_lock(v6);
  swift_beginAccess();
  id v7 = *(id *)(v5 + 16);
  os_unfair_lock_unlock(v6);
  swift_release();
  objc_msgSend(v7, sel_transform);
  __n128 v53 = v9;
  __n128 v54 = v8;
  __n128 v51 = v11;
  __n128 v52 = v10;

  uint64_t v12 = (uint64_t *)(a1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__viewAnchor);
  swift_beginAccess();
  uint64_t v13 = *v12;
  unint64_t v14 = *(os_unfair_lock_s **)(*v12 + 24);
  swift_retain();
  os_unfair_lock_lock(v14);
  swift_beginAccess();
  uint64_t v15 = *(void **)(v13 + 16);
  id v16 = v15;
  os_unfair_lock_unlock(v14);
  swift_release();
  if (v15)
  {
    objc_msgSend(v16, sel_transform);
    long long v47 = v18;
    long long v49 = v17;
    long long v43 = v20;
    long long v45 = v19;

    long long v22 = v43;
    long long v21 = v45;
    long long v24 = v47;
    long long v23 = v49;
  }
  else
  {
    long long v23 = 0uLL;
    long long v24 = 0uLL;
    long long v21 = 0uLL;
    long long v22 = 0uLL;
  }
  v55[0] = v23;
  v55[1] = v24;
  v55[2] = v21;
  v55[3] = v22;
  BOOL v56 = v15 == 0;
  int64_t v25 = (uint64_t *)(a1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane);
  swift_beginAccess();
  uint64_t v26 = *v25;
  uint64_t v27 = *(os_unfair_lock_s **)(*v25 + 24);
  swift_retain();
  os_unfair_lock_lock(v27);
  swift_beginAccess();
  uint64_t v28 = *(void *)(v26 + 16);
  swift_retain();
  os_unfair_lock_unlock(v27);
  swift_release();
  uint64_t v29 = (float *)(a1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_confidence);
  swift_beginAccess();
  float v30 = *v29;
  if (v3 == 2)
  {
    uint64_t v31 = (char *)(a1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_autoUpdate);
    swift_beginAccess();
    char v32 = *v31;
  }
  else
  {
    char v32 = v3 & 1;
  }
  uint64_t v33 = (uint64_t *)(a1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__targetAnchor);
  swift_beginAccess();
  uint64_t v34 = *v33;
  uint64_t v35 = *(os_unfair_lock_s **)(v34 + 24);
  swift_retain();
  os_unfair_lock_lock(v35);
  swift_beginAccess();
  id v36 = *(id *)(v34 + 16);
  os_unfair_lock_unlock(v35);
  swift_release();
  objc_msgSend(v36, sel_transform);
  long long v48 = v38;
  long long v50 = v37;
  long long v44 = v40;
  long long v46 = v39;

  v57[0] = v50;
  v57[1] = v48;
  v57[2] = v46;
  v57[3] = v44;
  char v58 = 0;
  type metadata accessor for WorldAnchor();
  uint64_t v41 = swift_allocObject();
  WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)((uint64_t)v55, v28, v32, (uint64_t)v57, v54, v53, v52, v51, v30);
  return v41;
}

uint64_t sub_22F207374(uint64_t a1)
{
  uint64_t v2 = sub_22F224198();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for WorldAnchor()
{
  uint64_t result = qword_268695D50;
  if (!qword_268695D50) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t _s17MeasureFoundation11WorldAnchorC6didAdd7anchorsySaySo8ARAnchorCG_tFZ_0()
{
  uint64_t v0 = sub_22F223848();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  float32x4_t v82 = (char *)v80 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  id v83 = (char *)v80 - v5;
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)v80 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(qword_268695538);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (uint64_t)v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268694508 != -1) {
    goto LABEL_107;
  }
LABEL_2:
  __n128 v11 = off_268695CE8;
  uint64_t v12 = (os_unfair_lock_s *)*((void *)off_268695CE8 + 3);
  swift_retain();
  os_unfair_lock_lock(v12);
  swift_beginAccess();
  uint64_t v13 = v11[2];
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v12);
  swift_release();
  uint64_t v14 = *(void *)(v13 + 64);
  uint64_t v91 = v13 + 64;
  uint64_t v15 = 1 << *(unsigned char *)(v13 + 32);
  if (v15 < 64) {
    uint64_t v16 = ~(-1 << v15);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v14;
  uint64_t v97 = v13;
  uint64_t v98 = v1 + 16;
  uint64_t v95 = v1 + 48;
  float32x4_t v96 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 56);
  int64_t v92 = (unint64_t)(v15 + 63) >> 6;
  float32x4_t v93 = (void (**)(char *, uint64_t, uint64_t))(v1 + 32);
  float32x4_t v94 = (uint64_t (**)(char *, uint64_t))(v1 + 8);
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v19 = 0;
  uint64_t v87 = MEMORY[0x263F8EE50] + 8;
  uint64_t v88 = v10;
  id v89 = v7;
  if (!v17) {
    goto LABEL_10;
  }
LABEL_9:
  unint64_t v20 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  for (unint64_t i = v20 | (v19 << 6); ; unint64_t i = __clz(__rbit64(v23)) + (v19 << 6))
  {
    int64_t v25 = *(void (**)(uint64_t, unint64_t, uint64_t))(v1 + 16);
    v25(v10, *(void *)(v97 + 48) + *(void *)(v1 + 72) * i, v0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v1 + 56))(v10, 0, 1, v0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v10, 1, v0) == 1) {
      goto LABEL_104;
    }
    int64_t v99 = v19;
    (*v93)(v7, v10, v0);
    uint64_t v26 = off_268695CE8;
    uint64_t v27 = (os_unfair_lock_s *)*((void *)off_268695CE8 + 3);
    swift_retain();
    os_unfair_lock_lock(v27);
    swift_beginAccess();
    uint64_t v28 = v26[2];
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v27);
    swift_release();
    if (!*(void *)(v28 + 16) || (unint64_t v29 = sub_22F18DD24((uint64_t)v7), (v30 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    uint64_t v10 = *(void *)(*(void *)(v28 + 56) + 8 * v29);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    unint64_t v90 = v10 & 0xC000000000000001;
    if ((v10 & 0xC000000000000001) != 0)
    {
      uint64_t v31 = sub_22F2242E8();
      uint64_t v33 = v32;
      uint64_t v34 = sub_22F224398();
      char v36 = MEMORY[0x230FB2D80](v31, v33, v34, v35);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      uint64_t v37 = v31;
      if (v36) {
        goto LABEL_101;
      }
    }
    else
    {
      char v38 = *(unsigned char *)(v10 + 32);
      uint64_t v31 = 1 << v38;
      unint64_t v39 = *(void *)(v10 + 56);
      if (v39)
      {
        uint64_t v40 = 0;
      }
      else
      {
        unsigned int v60 = v38 & 0x3F;
        if (v60 < 7) {
          goto LABEL_100;
        }
        unint64_t v39 = *(void *)(v10 + 64);
        if (v39)
        {
          uint64_t v40 = 1;
        }
        else
        {
          if (v60 < 8)
          {
LABEL_100:
            uint64_t v33 = *(unsigned int *)(v10 + 36);
            swift_bridgeObjectRetain();
LABEL_101:
            sub_22F1C66D4(v31, v33, v90 != 0);
            swift_bridgeObjectRelease_n();
            goto LABEL_102;
          }
          unint64_t v39 = *(void *)(v10 + 72);
          if (v39)
          {
            uint64_t v40 = 2;
          }
          else
          {
            unint64_t v39 = *(void *)(v10 + 80);
            if (v39)
            {
              uint64_t v40 = 3;
            }
            else
            {
              uint64_t v77 = 0;
              unint64_t v78 = (unint64_t)(v31 + 63) >> 6;
              if (v78 <= 4) {
                unint64_t v78 = 4;
              }
              unint64_t v79 = v78 - 4;
              do
              {
                if (v79 == v77) {
                  goto LABEL_100;
                }
                unint64_t v39 = *(void *)(v10 + 88 + 8 * v77++);
              }
              while (!v39);
              uint64_t v40 = v77 + 3;
            }
          }
        }
      }
      uint64_t v37 = __clz(__rbit64(v39)) + (v40 << 6);
      uint64_t v33 = *(unsigned int *)(v10 + 36);
      swift_bridgeObjectRetain();
      if (v37 == v31) {
        goto LABEL_101;
      }
    }
    char v41 = v90 != 0;
    sub_22F205E68(v37, v33, v90 != 0, v10);
    sub_22F1C66D4(v37, v33, v41);
    swift_bridgeObjectRelease();
    swift_beginAccess();
    uint64_t Strong = swift_weakLoadStrong();
    swift_release();
    if (!Strong) {
      goto LABEL_43;
    }
    uint64_t v43 = Strong + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane;
    swift_beginAccess();
    uint64_t v44 = *(void *)v43;
    long long v45 = *(os_unfair_lock_s **)(*(void *)v43 + 24);
    swift_retain();
    os_unfair_lock_lock(v45);
    swift_beginAccess();
    uint64_t v46 = *(void *)(v44 + 16);
    swift_retain();
    os_unfair_lock_unlock(v45);
    swift_release();
    swift_release();
    if (!v46)
    {
LABEL_43:
      swift_bridgeObjectRelease();
LABEL_102:
      uint64_t v10 = v88;
      id v7 = v89;
LABEL_8:
      int64_t v19 = v99;
      uint64_t result = (*v94)(v7, v0);
      if (!v17) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    int v47 = *(unsigned __int8 *)(v46 + 48);
    long long v48 = v83;
    id v7 = v89;
    v25((uint64_t)v83, (unint64_t)v89, v0);
    if (v47 != 3)
    {
      swift_bridgeObjectRelease();
      swift_release();
      id v61 = *v94;
      (*v94)(v48, v0);
LABEL_49:
      uint64_t result = v61(v7, v0);
      goto LABEL_90;
    }
    swift_beginAccess();
    uint64_t v49 = *(void *)(v46 + 16);
    long long v50 = v48;
    __n128 v51 = *(os_unfair_lock_s **)(v49 + 24);
    swift_retain();
    os_unfair_lock_lock(v51);
    swift_beginAccess();
    id v52 = *(id *)(v49 + 16);
    os_unfair_lock_unlock(v51);
    swift_release();
    id v53 = objc_msgSend(v52, sel_identifier);

    __n128 v54 = v82;
    sub_22F223828();

    sub_22F208760(&qword_268694C78, MEMORY[0x263F07508]);
    id v7 = v50;
    LOBYTE(v53) = sub_22F223A68();
    swift_release();
    unint64_t v55 = *v94;
    (*v94)(v54, v0);
    float v81 = v55;
    v55(v7, v0);
    if ((v53 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      id v7 = v89;
      id v61 = v81;
      goto LABEL_49;
    }
    if (v90)
    {
      swift_bridgeObjectRetain();
      sub_22F2242F8();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268695498);
      sub_22F2087A8();
      sub_22F223E78();
      unint64_t v56 = v102;
      uint64_t v86 = v103;
      uint64_t v57 = v104;
      uint64_t v58 = v105;
      unint64_t v59 = v106;
    }
    else
    {
      uint64_t v62 = -1 << *(unsigned char *)(v10 + 32);
      uint64_t v63 = *(void *)(v10 + 56);
      uint64_t v86 = v10 + 56;
      uint64_t v64 = ~v62;
      uint64_t v65 = -v62;
      if (v65 < 64) {
        uint64_t v66 = ~(-1 << v65);
      }
      else {
        uint64_t v66 = -1;
      }
      unint64_t v59 = v66 & v63;
      swift_bridgeObjectRetain();
      uint64_t v57 = v64;
      uint64_t v58 = 0;
      unint64_t v56 = v10;
    }
    v80[1] = v57;
    uint64_t v84 = v56 & 0x7FFFFFFFFFFFFFFFLL;
    int64_t v85 = (unint64_t)(v57 + 64) >> 6;
    unint64_t v90 = v56;
    while ((v56 & 0x8000000000000000) != 0)
    {
      uint64_t v68 = v58;
      uint64_t v69 = sub_22F224378();
      if (!v69) {
        goto LABEL_89;
      }
      uint64_t v100 = v69;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_268695498);
      swift_dynamicCast();
      uint64_t v70 = v101;
      swift_unknownObjectRelease();
      id v7 = (char *)v59;
      if (!v70) {
        goto LABEL_89;
      }
LABEL_85:
      swift_beginAccess();
      uint64_t v75 = swift_weakLoadStrong();
      if (v75)
      {
        long long v76 = (unsigned char *)(v75 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_autoUpdate);
        swift_beginAccess();
        if (*v76) {
          WorldAnchor.update()();
        }
        swift_release();
      }
      swift_release();
      uint64_t v58 = v68;
      unint64_t v59 = (unint64_t)v7;
      unint64_t v56 = v90;
    }
    if (v59)
    {
      id v7 = (char *)((v59 - 1) & v59);
      unint64_t v67 = __clz(__rbit64(v59)) | (v58 << 6);
      uint64_t v68 = v58;
      goto LABEL_84;
    }
    int64_t v71 = v58 + 1;
    if (__OFADD__(v58, 1)) {
      goto LABEL_106;
    }
    if (v71 >= v85) {
      goto LABEL_89;
    }
    unint64_t v72 = *(void *)(v86 + 8 * v71);
    uint64_t v68 = v58 + 1;
    if (v72) {
      goto LABEL_83;
    }
    uint64_t v68 = v58 + 2;
    if (v58 + 2 >= v85) {
      goto LABEL_89;
    }
    unint64_t v72 = *(void *)(v86 + 8 * v68);
    if (v72) {
      goto LABEL_83;
    }
    uint64_t v68 = v58 + 3;
    if (v58 + 3 >= v85) {
      goto LABEL_89;
    }
    unint64_t v72 = *(void *)(v86 + 8 * v68);
    if (v72) {
      goto LABEL_83;
    }
    uint64_t v68 = v58 + 4;
    if (v58 + 4 >= v85) {
      goto LABEL_89;
    }
    unint64_t v72 = *(void *)(v86 + 8 * v68);
    if (v72) {
      goto LABEL_83;
    }
    uint64_t v68 = v58 + 5;
    if (v58 + 5 >= v85) {
      goto LABEL_89;
    }
    unint64_t v72 = *(void *)(v86 + 8 * v68);
    if (v72) {
      goto LABEL_83;
    }
    uint64_t v68 = v58 + 6;
    if (v58 + 6 >= v85) {
      goto LABEL_89;
    }
    unint64_t v72 = *(void *)(v86 + 8 * v68);
    if (v72)
    {
LABEL_83:
      id v7 = (char *)((v72 - 1) & v72);
      unint64_t v67 = __clz(__rbit64(v72)) + (v68 << 6);
LABEL_84:
      uint64_t v74 = *(void *)(*(void *)(v56 + 48) + 8 * v67);
      swift_retain();
      if (!v74) {
        goto LABEL_89;
      }
      goto LABEL_85;
    }
    uint64_t v73 = v58 + 7;
    while (v85 != v73)
    {
      unint64_t v72 = *(void *)(v86 + 8 * v73++);
      if (v72)
      {
        uint64_t v68 = v73 - 1;
        unint64_t v56 = v90;
        goto LABEL_83;
      }
    }
LABEL_89:
    sub_22F196330();
    id v7 = v89;
    v81(v89, v0);
    uint64_t result = swift_bridgeObjectRelease();
LABEL_90:
    uint64_t v10 = v88;
    int64_t v19 = v99;
    if (v17) {
      goto LABEL_9;
    }
LABEL_10:
    int64_t v22 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
      __break(1u);
LABEL_106:
      __break(1u);
LABEL_107:
      swift_once();
      goto LABEL_2;
    }
    if (v22 >= v92) {
      break;
    }
    unint64_t v23 = *(void *)(v91 + 8 * v22);
    ++v19;
    if (v23) {
      goto LABEL_27;
    }
    int64_t v19 = v22 + 1;
    if (v22 + 1 >= v92) {
      break;
    }
    unint64_t v23 = *(void *)(v91 + 8 * v19);
    if (v23) {
      goto LABEL_27;
    }
    int64_t v19 = v22 + 2;
    if (v22 + 2 >= v92) {
      break;
    }
    unint64_t v23 = *(void *)(v91 + 8 * v19);
    if (v23) {
      goto LABEL_27;
    }
    int64_t v19 = v22 + 3;
    if (v22 + 3 >= v92) {
      break;
    }
    unint64_t v23 = *(void *)(v91 + 8 * v19);
    if (v23) {
      goto LABEL_27;
    }
    int64_t v19 = v22 + 4;
    if (v22 + 4 >= v92) {
      break;
    }
    unint64_t v23 = *(void *)(v91 + 8 * v19);
    if (v23) {
      goto LABEL_27;
    }
    int64_t v24 = v22 + 5;
    if (v24 >= v92) {
      break;
    }
    unint64_t v23 = *(void *)(v91 + 8 * v24);
    if (!v23)
    {
      while (1)
      {
        int64_t v19 = v24 + 1;
        if (__OFADD__(v24, 1)) {
          break;
        }
        if (v19 >= v92) {
          goto LABEL_103;
        }
        unint64_t v23 = *(void *)(v91 + 8 * v19);
        ++v24;
        if (v23) {
          goto LABEL_27;
        }
      }
      __break(1u);
      return result;
    }
    int64_t v19 = v24;
LABEL_27:
    unint64_t v17 = (v23 - 1) & v23;
  }
LABEL_103:
  (*v96)(v10, 1, 1, v0);
LABEL_104:
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t _s17MeasureFoundation11WorldAnchorC07forEachD0yyyAA15HashableWeakRefCyACGXEFZ_0(void (*a1)(uint64_t), uint64_t a2)
{
  char v38 = a1;
  uint64_t v39 = a2;
  uint64_t v2 = sub_22F223848();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(qword_268695538);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_268694508 == -1) {
    goto LABEL_2;
  }
  while (1)
  {
    swift_once();
LABEL_2:
    uint64_t v9 = off_268695CE8;
    uint64_t v10 = (os_unfair_lock_s *)*((void *)off_268695CE8 + 3);
    swift_retain();
    os_unfair_lock_lock(v10);
    swift_beginAccess();
    uint64_t v11 = v9[2];
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v10);
    uint64_t result = swift_release();
    int64_t v13 = 0;
    uint64_t v14 = *(void *)(v11 + 64);
    uint64_t v41 = v11 + 64;
    uint64_t v15 = 1 << *(unsigned char *)(v11 + 32);
    uint64_t v16 = -1;
    if (v15 < 64) {
      uint64_t v16 = ~(-1 << v15);
    }
    unint64_t v17 = v16 & v14;
    uint64_t v46 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    uint64_t v47 = v11;
    uint64_t v44 = v3 + 48;
    uint64_t v45 = v3 + 16;
    int64_t v42 = (unint64_t)(v15 + 63) >> 6;
    uint64_t v43 = (void (**)(char *, char *, uint64_t))(v3 + 32);
    long long v18 = (void (**)(char *, uint64_t))(v3 + 8);
    uint64_t v40 = (void *)MEMORY[0x263F8EE78];
    if ((v16 & v14) != 0)
    {
      while (1)
      {
        unint64_t v19 = __clz(__rbit64(v17));
        v17 &= v17 - 1;
        unint64_t v20 = v19 | (v13 << 6);
LABEL_26:
        (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v8, *(void *)(v47 + 48) + *(void *)(v3 + 72) * v20, v2);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1) {
          goto LABEL_36;
        }
        (*v43)(v5, v8, v2);
        int64_t v24 = off_268695CE8;
        int64_t v25 = (os_unfair_lock_s *)*((void *)off_268695CE8 + 3);
        swift_retain();
        os_unfair_lock_lock(v25);
        swift_beginAccess();
        uint64_t v26 = v24[2];
        swift_bridgeObjectRetain();
        os_unfair_lock_unlock(v25);
        swift_release();
        if (*(void *)(v26 + 16) && (unint64_t v27 = sub_22F18DD24((uint64_t)v5), (v28 & 1) != 0))
        {
          uint64_t v29 = *(void *)(*(void *)(v26 + 56) + 8 * v27);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          (*v18)(v5, v2);
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_22F19BE94(0, v40[2] + 1, 1, v40);
            uint64_t v40 = (void *)result;
          }
          unint64_t v31 = v40[2];
          unint64_t v30 = v40[3];
          if (v31 >= v30 >> 1)
          {
            uint64_t result = (uint64_t)sub_22F19BE94((void *)(v30 > 1), v31 + 1, 1, v40);
            uint64_t v40 = (void *)result;
          }
          uint64_t v32 = v40;
          v40[2] = v31 + 1;
          v32[v31 + 4] = v29;
          if (!v17) {
            break;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t result = ((uint64_t (*)(char *, uint64_t))*v18)(v5, v2);
          if (!v17) {
            break;
          }
        }
      }
    }
    int64_t v21 = v13 + 1;
    if (!__OFADD__(v13, 1)) {
      break;
    }
    __break(1u);
  }
  if (v21 >= v42) {
    goto LABEL_35;
  }
  unint64_t v22 = *(void *)(v41 + 8 * v21);
  ++v13;
  if (v22)
  {
LABEL_25:
    unint64_t v17 = (v22 - 1) & v22;
    unint64_t v20 = __clz(__rbit64(v22)) + (v13 << 6);
    goto LABEL_26;
  }
  int64_t v13 = v21 + 1;
  if (v21 + 1 >= v42)
  {
LABEL_35:
    (*v46)(v8, 1, 1, v2);
LABEL_36:
    swift_release();
    uint64_t v33 = v40[2];
    uint64_t v34 = v38;
    if (v33)
    {
      swift_bridgeObjectRetain();
      uint64_t v35 = 0;
      do
      {
        ++v35;
        uint64_t v36 = swift_bridgeObjectRetain();
        sub_22F206D88(v36, v34);
        swift_bridgeObjectRelease();
      }
      while (v33 != v35);
      swift_bridgeObjectRelease();
    }
    return swift_bridgeObjectRelease();
  }
  unint64_t v22 = *(void *)(v41 + 8 * v13);
  if (v22) {
    goto LABEL_25;
  }
  int64_t v13 = v21 + 2;
  if (v21 + 2 >= v42) {
    goto LABEL_35;
  }
  unint64_t v22 = *(void *)(v41 + 8 * v13);
  if (v22) {
    goto LABEL_25;
  }
  int64_t v13 = v21 + 3;
  if (v21 + 3 >= v42) {
    goto LABEL_35;
  }
  unint64_t v22 = *(void *)(v41 + 8 * v13);
  if (v22) {
    goto LABEL_25;
  }
  int64_t v13 = v21 + 4;
  if (v21 + 4 >= v42) {
    goto LABEL_35;
  }
  unint64_t v22 = *(void *)(v41 + 8 * v13);
  if (v22) {
    goto LABEL_25;
  }
  int64_t v23 = v21 + 5;
  if (v23 >= v42) {
    goto LABEL_35;
  }
  unint64_t v22 = *(void *)(v41 + 8 * v23);
  if (v22)
  {
    int64_t v13 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v13 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v13 >= v42) {
      goto LABEL_35;
    }
    unint64_t v22 = *(void *)(v41 + 8 * v13);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_22F208560()
{
  return sub_22F208760(&qword_268695D48, (void (*)(uint64_t))type metadata accessor for WorldAnchor);
}

float sub_22F2085A8@<S0>(void *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v3 = (float *)(*a1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_confidence);
  swift_beginAccess();
  float result = *v3;
  *a2 = *(_DWORD *)v3;
  return result;
}

uint64_t sub_22F2085FC(int *a1, void *a2)
{
  int v2 = *a1;
  uint64_t v3 = (_DWORD *)(*a2 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_confidence);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = v2;
  return result;
}

uint64_t sub_22F208658()
{
  uint64_t v0 = swift_retain();
  return sub_22F200028(v0);
}

uint64_t sub_22F208684()
{
  return type metadata accessor for WorldAnchor();
}

uint64_t sub_22F20868C()
{
  uint64_t result = sub_22F223848();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_22F208760(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22F2087A8()
{
  unint64_t result = qword_268695D60;
  if (!qword_268695D60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268695498);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695D60);
  }
  return result;
}

uint64_t sub_22F208804()
{
  return sub_22F224818();
}

uint64_t sub_22F20890C()
{
  sub_22F223B28();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22F208A00()
{
  return sub_22F224818();
}

uint64_t WorldLine.lineType.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_lineType;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t WorldLine.lineType.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_lineType);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*WorldLine.lineType.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t WorldLine.ends.getter()
{
  return sub_22F19D2F4();
}

void sub_22F208C00(void **a1, void *a2)
{
  int v2 = *a1;
  uint64_t v3 = (void **)(*a2 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_center);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *uint64_t v3 = v2;
  id v5 = v2;
}

id WorldLine.center.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_center);
  swift_beginAccess();
  int v2 = *v1;
  return v2;
}

uint64_t sub_22F208CBC(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *a1;
  uint64_t v6 = (void *)(*a2 + *a5);
  swift_beginAccess();
  *uint64_t v6 = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t WorldLine.snappedPoints.getter()
{
  return sub_22F19D2F4();
}

uint64_t WorldLine.isOnVerticalGuide.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_isOnVerticalGuide);
  swift_beginAccess();
  return *v1;
}

uint64_t WorldLine.isOnVerticalGuide.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_isOnVerticalGuide);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*WorldLine.isOnVerticalGuide.modify())()
{
  return j__swift_endAccess;
}

uint64_t WorldLine.identifiersOfObjectsComposedInto.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t (*sub_22F208F68())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_22F208FC4(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)(*a2 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_identifiersOfObjectsComposedInto);
  swift_beginAccess();
  *uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t WorldLine.isALineMeasurement.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_isALineMeasurement);
  swift_beginAccess();
  return *v1;
}

uint64_t WorldLine.isALineMeasurement.setter(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_isALineMeasurement);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*WorldLine.isALineMeasurement.modify())()
{
  return j_j__swift_endAccess;
}

double WorldLine.meanFPSDuringPlacement.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_meanFPSDuringPlacement;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t WorldLine.meanFPSDuringPlacement.setter(double a1)
{
  uint64_t v3 = (double *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_meanFPSDuringPlacement);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*WorldLine.meanFPSDuringPlacement.modify())()
{
  return j_j__swift_endAccess;
}

char *WorldLine.__allocating_init(end1:end2:initialState:)(char *a1, void *a2, uint64_t a3, char a4)
{
  char v8 = a4 & 1;
  id v9 = objc_allocWithZone(v4);
  return WorldLine.init(end1:end2:initialState:)(a1, a2, a3, v8);
}

char *WorldLine.init(end1:end2:initialState:)(char *a1, void *a2, uint64_t a3, char a4)
{
  *(void *)&v4[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_lineType] = 1;
  v4[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_isOnVerticalGuide] = 0;
  *(void *)&v4[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_identifiersOfObjectsComposedInto] = 0;
  v4[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_isALineMeasurement] = 0;
  id v9 = v42;
  *(void *)&v4[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_meanFPSDuringPlacement] = 0xBFF0000000000000;
  uint64_t v10 = v4;
  WorldPoint.type.setter(1);
  WorldPoint.type.setter(1);
  if (a4)
  {
    swift_beginAccess();
    a3 = static MeasureObjectState.default;
  }
  WorldPoint.state.setter(a3);
  WorldPoint.state.setter(a3);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268695250);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_22F227F40;
  *(void *)(v11 + 32) = a1;
  *(void *)(v11 + 40) = a2;
  v42[0] = v11;
  sub_22F223CD8();
  *(void *)&v10[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends] = v42[0];
  uint64_t v12 = &a1[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
  swift_beginAccess();
  uint64_t v13 = *(void *)v12;
  uint64_t v14 = *(os_unfair_lock_s **)(v13 + 24);
  uint64_t v15 = a1;
  id v16 = a2;
  swift_retain();
  os_unfair_lock_lock(v14);
  swift_beginAccess();
  uint64_t v17 = *(void *)(v13 + 16);
  swift_retain();
  os_unfair_lock_unlock(v14);
  swift_release();
  __n128 v39 = *(__n128 *)(v17 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 16);
  __n128 v40 = *(__n128 *)(v17 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
  __n128 v37 = *(__n128 *)(v17 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);
  __n128 v38 = *(__n128 *)(v17 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 32);
  swift_release();
  memset(v42, 0, sizeof(v42));
  char v43 = 1;
  type metadata accessor for WorldAnchor();
  swift_allocObject();
  uint64_t v18 = WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)((uint64_t)v42, 0, 0, (uint64_t)v42, v40, v39, v38, v37, 0.0);
  swift_beginAccess();
  uint64_t v19 = static MeasureObjectState.default;
  id v20 = objc_allocWithZone((Class)type metadata accessor for WorldPoint());
  *(void *)&v10[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_center] = WorldPoint.init(anchor:type:state:)(v18, 2, v19);
  *(void *)&v10[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_snappedPoints] = MEMORY[0x263F8EE78];

  v41.receiver = v10;
  v41.super_class = (Class)type metadata accessor for WorldLine();
  int64_t v21 = (char *)objc_msgSendSuper2(&v41, sel_init);
  uint64_t v22 = *(void *)&v21[OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state];
  int64_t v23 = *(os_unfair_lock_s **)(v22 + 24);
  int64_t v24 = v21;
  swift_retain();
  os_unfair_lock_lock(v23);
  swift_beginAccess();
  *(void *)(v22 + 16) = a3;
  os_unfair_lock_unlock(v23);
  swift_release();
  WorldLine.updateSubPoints()();
  int64_t v25 = &v24[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends];
  swift_beginAccess();
  uint64_t v26 = *(void *)v25;
  if ((*(void *)v25 & 0xC000000000000001) != 0)
  {
    unint64_t v27 = (os_unfair_lock_s *)MEMORY[0x230FB2E90](0);
LABEL_6:
    int64_t v23 = v27;
    swift_endAccess();
    id v9 = &OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_lines;
    char v28 = (void *)((char *)&v23->_os_unfair_lock_opaque + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_lines);
    swift_beginAccess();
    int64_t v24 = v24;
    MEMORY[0x230FB2700]();
    if (*(void *)((*v28 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(void *)((*v28 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
  if (*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    unint64_t v27 = (os_unfair_lock_s *)*(id *)(v26 + 32);
    goto LABEL_6;
  }
  __break(1u);
LABEL_14:
  sub_22F223D18();
LABEL_7:
  sub_22F223D68();
  sub_22F223CD8();
  swift_endAccess();

  swift_beginAccess();
  uint64_t v29 = *(void *)v25;
  if ((*(void *)v25 & 0xC000000000000001) != 0)
  {
    unint64_t v30 = (char *)MEMORY[0x230FB2E90](1);
  }
  else
  {
    if (*(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
    {
      __break(1u);
      goto LABEL_17;
    }
    unint64_t v30 = (char *)*(id *)(v29 + 40);
  }
  int64_t v25 = v30;
  swift_endAccess();
  unint64_t v31 = &v25[*v9];
  swift_beginAccess();
  int64_t v24 = v24;
  MEMORY[0x230FB2700]();
  if (*(void *)((*(void *)v31 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v31 & 0xFFFFFFFFFFFFFF8)
                                                                               + 0x18) >> 1)
LABEL_17:
    sub_22F223D18();
  sub_22F223D68();
  sub_22F223CD8();
  swift_endAccess();

  uint64_t v32 = &v24[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_center];
  swift_beginAccess();
  uint64_t v33 = (void **)(*(void *)v32 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_parentLine);
  swift_beginAccess();
  uint64_t v34 = *v33;
  *uint64_t v33 = v24;
  uint64_t v35 = v24;

  return v35;
}

Swift::Void __swiftcall WorldLine.cleanup()()
{
  uint64_t v2 = (id *)&v0[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends];
  swift_beginAccess();
  id v3 = *v2;
  if (((unint64_t)*v2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v4 = (id)MEMORY[0x230FB2E90](0, v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (!*(void *)(((unint64_t)v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_21:
      swift_bridgeObjectRetain();
      id v10 = (id)MEMORY[0x230FB2E90](1, v2);
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
    id v4 = *((id *)v3 + 4);
  }
  swift_beginAccess();
  uint64_t v1 = v0;
  unint64_t v5 = swift_bridgeObjectRetain();
  unint64_t v6 = sub_22F20C590(v5, (uint64_t)v1);
  char v8 = v7;
  swift_bridgeObjectRelease();

  if ((v8 & 1) == 0)
  {
    swift_beginAccess();
    uint64_t v9 = sub_22F183860(v6);
    swift_endAccess();

    id v4 = (id)v9;
  }

  uint64_t v2 = (id *)*v2;
  if (((unint64_t)v2 & 0xC000000000000001) != 0) {
    goto LABEL_21;
  }
  if (*(void *)(((unint64_t)v2 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
  {
    __break(1u);
    goto LABEL_23;
  }
  id v10 = v2[5];
LABEL_9:
  swift_beginAccess();
  uint64_t v11 = v1;
  unint64_t v12 = swift_bridgeObjectRetain();
  unint64_t v13 = sub_22F20C590(v12, (uint64_t)v11);
  char v15 = v14;
  swift_bridgeObjectRelease();

  if ((v15 & 1) == 0)
  {
    swift_beginAccess();
    uint64_t v16 = sub_22F183860(v13);
    swift_endAccess();

    id v10 = (id)v16;
  }

  uint64_t v17 = &v11[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_center];
  swift_beginAccess();
  uint64_t v18 = (void **)(*(void *)v17 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_parentLine);
  swift_beginAccess();
  uint64_t v19 = *v18;
  *uint64_t v18 = 0;

  id v20 = &v11[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_snappedPoints];
  swift_beginAccess();
  uint64_t v2 = *(id **)v20;
  if (!((unint64_t)v2 >> 62))
  {
    uint64_t v21 = *(void *)(((unint64_t)v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v21) {
      goto LABEL_13;
    }
LABEL_24:
    swift_bridgeObjectRelease();
    return;
  }
LABEL_23:
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_22F2245C8();
  if (!v21) {
    goto LABEL_24;
  }
LABEL_13:
  if (v21 >= 1)
  {
    uint64_t v22 = 0;
    do
    {
      if (((unint64_t)v2 & 0xC000000000000001) != 0) {
        int64_t v23 = (char *)MEMORY[0x230FB2E90](v22, v2);
      }
      else {
        int64_t v23 = (char *)v2[v22 + 4];
      }
      int64_t v24 = v23;
      ++v22;
      int64_t v25 = (void **)&v23[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_snapLine];
      swift_beginAccess();
      uint64_t v26 = *v25;
      *int64_t v25 = 0;
    }
    while (v21 != v22);
    goto LABEL_24;
  }
  __break(1u);
}

Swift::Void __swiftcall WorldLine.updateSubPoints()()
{
  uint64_t v1 = v0;
  uint64_t v2 = (void **)(v0 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_center);
  swift_beginAccess();
  id v3 = *v2;
  id v4 = (uint64_t *)((char *)*v2 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor);
  swift_beginAccess();
  uint64_t v5 = *v4;
  unint64_t v6 = *(os_unfair_lock_s **)(v5 + 24);
  id v7 = v3;
  swift_retain();
  os_unfair_lock_lock(v6);
  swift_beginAccess();
  uint64_t v8 = *(void *)(v5 + 16);
  swift_retain();
  os_unfair_lock_unlock(v6);
  swift_release();
  __n128 v87 = *(__n128 *)(v8 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 16);
  __n128 v89 = *(__n128 *)(v8 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
  __n128 v85 = *(__n128 *)(v8 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 32);

  swift_release();
  uint64_t v9 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends);
  swift_beginAccess();
  uint64_t v10 = *v9;
  if ((*v9 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = (char *)MEMORY[0x230FB2E90](0, v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_15;
    }
    uint64_t v11 = (char *)*(id *)(v10 + 32);
  }
  unint64_t v12 = &v11[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
  swift_beginAccess();
  uint64_t v13 = *(void *)v12;
  char v14 = *(os_unfair_lock_s **)(v13 + 24);
  swift_retain();
  os_unfair_lock_lock(v14);
  swift_beginAccess();
  uint64_t v15 = *(void *)(v13 + 16);
  swift_retain();
  os_unfair_lock_unlock(v14);
  swift_release();
  long long v99 = *(_OWORD *)(v15 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);

  swift_release();
  uint64_t v10 = *v9;
  if ((*v9 & 0xC000000000000001) != 0)
  {
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v16 = (char *)MEMORY[0x230FB2E90](1, v10);
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  if (*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
  {
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v16 = (char *)*(id *)(v10 + 40);
LABEL_7:
  uint64_t v17 = &v16[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
  swift_beginAccess();
  uint64_t v18 = *(void *)v17;
  uint64_t v19 = *(os_unfair_lock_s **)(v18 + 24);
  swift_retain();
  os_unfair_lock_lock(v19);
  swift_beginAccess();
  uint64_t v20 = *(void *)(v18 + 16);
  swift_retain();
  os_unfair_lock_unlock(v19);
  swift_release();
  float32x4_t v94 = *(float32x4_t *)(v20 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);

  swift_release();
  uint64_t v10 = *v9;
  if ((*v9 & 0xC000000000000001) == 0)
  {
    uint64_t v24 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v24)
    {
      __break(1u);
      goto LABEL_19;
    }
    int64_t v25 = (char *)*(id *)(v10 + 32);
    goto LABEL_10;
  }
LABEL_17:
  swift_bridgeObjectRetain();
  int64_t v25 = (char *)MEMORY[0x230FB2E90](0, v10);
  swift_bridgeObjectRelease();
LABEL_10:
  uint64_t v26 = &v25[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
  swift_beginAccess();
  uint64_t v27 = *(void *)v26;
  char v28 = *(os_unfair_lock_s **)(v27 + 24);
  swift_retain();
  os_unfair_lock_lock(v28);
  swift_beginAccess();
  uint64_t v29 = *(void *)(v27 + 16);
  swift_retain();
  os_unfair_lock_unlock(v28);
  swift_release();
  float32x4_t v91 = *(float32x4_t *)(v29 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);

  swift_release();
  float32x4_t v30 = vsubq_f32(v94, v91);
  v31.n128_u64[0] = (unint64_t)vadd_f32(*(float32x2_t *)&v99, vmul_f32(*(float32x2_t *)v30.f32, (float32x2_t)0x3F0000003F000000));
  v31.n128_f32[2] = *((float *)&v99 + 2) + vmuls_lane_f32(0.5, v30, 2);
  v31.n128_u32[3] = 0;
  __n128 v100 = v31;
  uint64_t v32 = *v2;
  uint64_t v33 = (uint64_t *)((char *)*v2 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor);
  swift_beginAccess();
  uint64_t v34 = *v33;
  uint64_t v35 = *(os_unfair_lock_s **)(v34 + 24);
  id v36 = v32;
  swift_retain();
  os_unfair_lock_lock(v35);
  swift_beginAccess();
  uint64_t v37 = *(void *)(v34 + 16);
  swift_retain();
  os_unfair_lock_unlock(v35);

  swift_release();
  long long v95 = *(_OWORD *)(v37 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);
  swift_release();
  long long v23 = v95;
  __n128 v22 = v100;
  uint64_t v24 = 0;
  HIDWORD(v23) = 0;
  while (1)
  {
    __n128 v106 = v22;
    float v38 = *(float *)((unint64_t)&v106 & 0xFFFFFFFFFFFFFFF3 | (4 * (v24 & 3)));
    long long v107 = v23;
    float v39 = *(float *)((unint64_t)&v107 & 0xFFFFFFFFFFFFFFF3 | (4 * (v24 & 3)));
    BOOL v21 = v38 == v39;
    if (v24 == 2) {
      break;
    }
LABEL_19:
    while (1)
    {
      ++v24;
      if (v21) {
        break;
      }
      if (v24 == 2) {
        goto LABEL_22;
      }
      BOOL v21 = 0;
    }
  }
  if (v38 != v39)
  {
LABEL_22:
    v22.n128_u32[3] = 1.0;
    __n128 v101 = v22;
    __n128 v40 = *v2;
    memset(v110, 0, sizeof(v110));
    char v111 = 1;
    type metadata accessor for WorldAnchor();
    swift_allocObject();
    objc_super v41 = v40;
    uint64_t v42 = WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)((uint64_t)v110, 0, 0, (uint64_t)v110, v89, v87, v85, v101, 0.0);
    char v43 = &v41[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
    swift_beginAccess();
    uint64_t v44 = *(void *)v43;
    uint64_t v45 = *(os_unfair_lock_s **)(v44 + 24);
    swift_retain();
    swift_retain();
    os_unfair_lock_lock(v45);
    swift_beginAccess();
    *(void *)(v44 + 16) = v42;
    swift_retain();
    swift_release();
    os_unfair_lock_unlock(v45);
    swift_release();
    swift_release();
    sub_22F213438();

    swift_release();
  }
  uint64_t v46 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_snappedPoints);
  swift_beginAccess();
  uint64_t v47 = *v46;
  if ((unint64_t)*v46 >> 62) {
    goto LABEL_44;
  }
  uint64_t v48 = *(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v48)
  {
LABEL_45:
    swift_bridgeObjectRelease();
    return;
  }
LABEL_25:
  if (v48 >= 1)
  {
    uint64_t v49 = 0;
    float32x4_t v82 = v9;
    while (1)
    {
      if ((v47 & 0xC000000000000001) != 0) {
        id v53 = (char *)MEMORY[0x230FB2E90](v49, v47);
      }
      else {
        id v53 = (char *)*(id *)(v47 + 8 * v49 + 32);
      }
      __n128 v54 = v53;
      uint64_t v55 = *v9;
      if ((*v9 & 0xC000000000000001) != 0)
      {
        swift_bridgeObjectRetain();
        unint64_t v56 = (char *)MEMORY[0x230FB2E90](0, v55);
        swift_bridgeObjectRelease();
      }
      else
      {
        if (!*(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_43:
          __break(1u);
LABEL_44:
          swift_bridgeObjectRetain();
          uint64_t v48 = sub_22F2245C8();
          if (!v48) {
            goto LABEL_45;
          }
          goto LABEL_25;
        }
        unint64_t v56 = (char *)*(id *)(v55 + 32);
      }
      uint64_t v57 = &v56[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
      swift_beginAccess();
      uint64_t v58 = *(void *)v57;
      unint64_t v59 = *(os_unfair_lock_s **)(v58 + 24);
      swift_retain();
      os_unfair_lock_lock(v59);
      swift_beginAccess();
      uint64_t v60 = *(void *)(v58 + 16);
      swift_retain();
      os_unfair_lock_unlock(v59);
      swift_release();
      float32x4_t v102 = *(float32x4_t *)(v60 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);

      swift_release();
      uint64_t v61 = *v9;
      if ((*v9 & 0xC000000000000001) != 0)
      {
        swift_bridgeObjectRetain();
        uint64_t v62 = (char *)MEMORY[0x230FB2E90](1, v61);
        swift_bridgeObjectRelease();
      }
      else
      {
        if (*(void *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL) {
          goto LABEL_43;
        }
        uint64_t v62 = (char *)*(id *)(v61 + 40);
      }
      float32x4_t v63 = v102;
      v63.i32[3] = 0;
      float32x4_t v103 = v63;
      uint64_t v64 = &v62[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
      swift_beginAccess();
      uint64_t v65 = *(void *)v64;
      uint64_t v66 = *(os_unfair_lock_s **)(v65 + 24);
      swift_retain();
      os_unfair_lock_lock(v66);
      swift_beginAccess();
      uint64_t v67 = *(void *)(v65 + 16);
      swift_retain();
      os_unfair_lock_unlock(v66);
      swift_release();
      float32x4_t v96 = *(float32x4_t *)(v67 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);

      swift_release();
      float32x4_t v68 = v96;
      v68.i32[3] = 0;
      float32x4_t v97 = v68;
      uint64_t v69 = &v54[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
      swift_beginAccess();
      uint64_t v70 = *(void *)v69;
      int64_t v71 = *(os_unfair_lock_s **)(*(void *)v69 + 24);
      swift_retain();
      os_unfair_lock_lock(v71);
      swift_beginAccess();
      uint64_t v72 = *(void *)(v70 + 16);
      swift_retain();
      os_unfair_lock_unlock(v71);
      swift_release();
      float32x4_t v92 = *(float32x4_t *)(v72 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);
      swift_release();
      float32x4_t v73 = v92;
      v73.i32[3] = 0;
      v74.n128_f64[0] = closestPointOnLine(lineP1:lineP2:point:)(v103, v97, v73);
      __n128 v104 = v74;
      uint64_t v75 = *(void *)v69;
      long long v76 = *(os_unfair_lock_s **)(*(void *)v69 + 24);
      swift_retain();
      os_unfair_lock_lock(v76);
      swift_beginAccess();
      uint64_t v77 = *(void *)(v75 + 16);
      swift_retain();
      os_unfair_lock_unlock(v76);
      swift_release();
      __n128 v93 = *(__n128 *)(v77 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 16);
      __n128 v98 = *(__n128 *)(v77 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
      __n128 v90 = *(__n128 *)(v77 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 32);
      swift_release();
      __n128 v78 = v104;
      v78.n128_u32[3] = 1.0;
      __n128 v105 = v78;
      uint64_t v79 = *(void *)v69;
      float32x4_t v80 = *(os_unfair_lock_s **)(*(void *)v69 + 24);
      swift_retain();
      os_unfair_lock_lock(v80);
      swift_beginAccess();
      uint64_t v81 = *(void *)(v79 + 16);
      swift_retain();
      os_unfair_lock_unlock(v80);
      swift_release();
      float32x4_t v83 = *(float32x4_t *)(v81 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 16);
      float32x4_t v84 = *(float32x4_t *)(v81 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
      float32x4_t v86 = *(float32x4_t *)(v81 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 32);
      float32x4_t v88 = *(float32x4_t *)(v81 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);
      swift_release();
      if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v83, (float32x4_t)v93), (int8x16_t)vceqq_f32(v84, (float32x4_t)v98)), (int8x16_t)vceqq_f32(v86, (float32x4_t)v90)), (int8x16_t)vceqq_f32(v88, (float32x4_t)v105))) & 0x80000000) != 0)
      {
      }
      else
      {
        memset(v108, 0, sizeof(v108));
        char v109 = 1;
        type metadata accessor for WorldAnchor();
        swift_allocObject();
        uint64_t v50 = WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)((uint64_t)v108, 0, 0, (uint64_t)v108, v98, v93, v90, v105, 0.0);
        uint64_t v51 = *(void *)v69;
        id v52 = *(os_unfair_lock_s **)(*(void *)v69 + 24);
        swift_retain();
        swift_retain();
        os_unfair_lock_lock(v52);
        swift_beginAccess();
        *(void *)(v51 + 16) = v50;
        swift_retain();
        swift_release();
        os_unfair_lock_unlock(v52);
        swift_release();
        swift_release();
        sub_22F213438();

        swift_release();
      }
      ++v49;
      uint64_t v9 = v82;
      if (v48 == v49) {
        goto LABEL_45;
      }
    }
  }
  __break(1u);
}

void WorldLine.replaceEnd1(with:)(void *a1)
{
  id v3 = (unint64_t *)&v1[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends];
  swift_beginAccess();
  unint64_t v4 = *v3;
  if ((*v3 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v5 = (id)MEMORY[0x230FB2E90](0, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
    id v5 = *(id *)(v4 + 32);
  }
  swift_beginAccess();
  unint64_t v6 = v1;
  unint64_t v7 = swift_bridgeObjectRetain();
  unint64_t v8 = sub_22F20C590(v7, (uint64_t)v6);
  char v10 = v9;
  swift_bridgeObjectRelease();

  if ((v10 & 1) == 0)
  {
    swift_beginAccess();
    uint64_t v11 = sub_22F183860(v8);
    swift_endAccess();

    id v5 = (id)v11;
  }

  swift_beginAccess();
  unint64_t v12 = *v3;
  uint64_t v13 = a1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *id v3 = v12;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v12 & 0x8000000000000000) != 0
    || (v12 & 0x4000000000000000) != 0)
  {
    sub_22F20C4E8(v12);
    unint64_t v12 = v15;
    *id v3 = v15;
  }
  if (!*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_15;
  }
  uint64_t v16 = *(void **)((v12 & 0xFFFFFFFFFFFFFF8) + 0x20);
  *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x20) = v13;

  sub_22F223CD8();
  swift_endAccess();
  uint64_t v17 = &v13[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_lines];
  swift_beginAccess();
  v6;
  MEMORY[0x230FB2700]();
  if (*(void *)((*(void *)v17 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v17 & 0xFFFFFFFFFFFFFF8)
                                                                               + 0x18) >> 1)
LABEL_16:
    sub_22F223D18();
  sub_22F223D68();
  sub_22F223CD8();
  swift_endAccess();
  WorldLine.updateSubPoints()();
}

void WorldLine.replaceEnd2(with:)(void *a1)
{
  id v3 = (unint64_t *)&v1[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends];
  swift_beginAccess();
  unint64_t v4 = *v3;
  if ((*v3 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v5 = (id)MEMORY[0x230FB2E90](1, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
    {
      __break(1u);
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
    id v5 = *(id *)(v4 + 40);
  }
  swift_beginAccess();
  unint64_t v6 = v1;
  unint64_t v7 = swift_bridgeObjectRetain();
  unint64_t v8 = sub_22F20C590(v7, (uint64_t)v6);
  char v10 = v9;
  swift_bridgeObjectRelease();

  if ((v10 & 1) == 0)
  {
    swift_beginAccess();
    uint64_t v11 = sub_22F183860(v8);
    swift_endAccess();

    id v5 = (id)v11;
  }

  swift_beginAccess();
  unint64_t v12 = *v3;
  uint64_t v13 = a1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *id v3 = v12;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v12 & 0x8000000000000000) != 0
    || (v12 & 0x4000000000000000) != 0)
  {
    sub_22F20C4E8(v12);
    unint64_t v12 = v15;
    *id v3 = v15;
  }
  if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL) {
    goto LABEL_15;
  }
  uint64_t v16 = *(void **)((v12 & 0xFFFFFFFFFFFFFF8) + 0x28);
  *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x28) = v13;

  sub_22F223CD8();
  swift_endAccess();
  uint64_t v17 = &v13[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_lines];
  swift_beginAccess();
  v6;
  MEMORY[0x230FB2700]();
  if (*(void *)((*(void *)v17 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v17 & 0xFFFFFFFFFFFFFF8)
                                                                               + 0x18) >> 1)
LABEL_16:
    sub_22F223D18();
  sub_22F223D68();
  sub_22F223CD8();
  swift_endAccess();
  WorldLine.updateSubPoints()();
}

void WorldLine.replaceCenter(with:)(void *a1)
{
  id v3 = (void **)&v1[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_center];
  swift_beginAccess();
  unint64_t v4 = (void **)((char *)*v3 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_parentLine);
  swift_beginAccess();
  id v5 = *v4;
  *unint64_t v4 = 0;

  unint64_t v6 = *v3;
  *id v3 = a1;
  id v7 = a1;

  unint64_t v8 = (void **)((char *)*v3 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_parentLine);
  swift_beginAccess();
  char v9 = *v8;
  char *v8 = v1;
  char v10 = v1;

  WorldLine.updateSubPoints()();
}

void WorldLine.addSnappedPoint(with:)(void *a1)
{
  uint64_t v2 = v1;
  unint64_t v4 = &v1[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_snappedPoints];
  swift_beginAccess();
  id v5 = a1;
  MEMORY[0x230FB2700]();
  if (*(void *)((*(void *)v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v4 & 0xFFFFFFFFFFFFFF8)
                                                                              + 0x18) >> 1)
    sub_22F223D18();
  sub_22F223D68();
  sub_22F223CD8();
  swift_endAccess();
  unint64_t v6 = (void **)&v5[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_snapLine];
  swift_beginAccess();
  id v7 = *v6;
  *unint64_t v6 = v2;
  id v8 = v2;
}

void WorldLine.removeSnappedPoint(with:)(void *a1)
{
  swift_beginAccess();
  uint64_t v2 = a1;
  unint64_t v3 = swift_bridgeObjectRetain();
  unint64_t v4 = sub_22F20C590(v3, (uint64_t)v2);
  char v6 = v5;
  swift_bridgeObjectRelease();

  if ((v6 & 1) == 0)
  {
    swift_beginAccess();
    id v7 = (void *)sub_22F183860(v4);
    swift_endAccess();
  }
  id v8 = (void **)&v2[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_snapLine];
  swift_beginAccess();
  char v9 = *v8;
  char *v8 = 0;
}

Swift::Float __swiftcall WorldLine.length()()
{
  unint64_t v3 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends);
  swift_beginAccess();
  uint64_t v4 = *v3;
  if ((*v3 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    char v5 = (char *)MEMORY[0x230FB2E90](0, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_10;
    }
    char v5 = (char *)*(id *)(v4 + 32);
  }
  uint64_t v1 = &qword_268695000;
  char v6 = &v5[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
  swift_beginAccess();
  uint64_t v7 = *(void *)v6;
  id v8 = *(os_unfair_lock_s **)(v7 + 24);
  swift_retain();
  os_unfair_lock_lock(v8);
  swift_beginAccess();
  uint64_t v9 = *(void *)(v7 + 16);
  swift_retain();
  os_unfair_lock_unlock(v8);
  swift_release();
  uint64_t v2 = &qword_268695000;
  float32x4_t v19 = *(float32x4_t *)(v9 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);

  swift_release();
  uint64_t v0 = *v3;
  if ((*v3 & 0xC000000000000001) != 0)
  {
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v11 = (char *)MEMORY[0x230FB2E90](1, v0);
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  if (*(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    uint64_t v11 = (char *)*(id *)(v0 + 40);
LABEL_7:
    unint64_t v12 = &v11[v1[463]];
    swift_beginAccess();
    uint64_t v13 = *(void *)v12;
    char v14 = *(os_unfair_lock_s **)(v13 + 24);
    swift_retain();
    os_unfair_lock_lock(v14);
    swift_beginAccess();
    uint64_t v15 = *(void *)(v13 + 16);
    swift_retain();
    os_unfair_lock_unlock(v14);
    swift_release();
    float32x4_t v18 = *(float32x4_t *)(v15 + v2[418] + 48);

    swift_release();
    float32x4_t v16 = vsubq_f32(v19, v18);
    float32x4_t v17 = vmulq_f32(v16, v16);
    return sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).f32[0]);
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall WorldLine.markAsPartOfComposedObject(withId:)(Swift::String withId)
{
  object = withId._object;
  uint64_t countAndFlagsBits = withId._countAndFlagsBits;
  char v6 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_identifiersOfObjectsComposedInto);
  swift_beginAccess();
  if (!*v6)
  {
    *char v6 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRelease();
  }
  id v8 = sub_22F208F68();
  uint64_t v9 = *v7;
  if (!*v7)
  {
    ((void (*)(unsigned char *, void))v8)(v20, 0);
    goto LABEL_9;
  }
  uint64_t v2 = v7;
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v2 = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    goto LABEL_20;
  }
  while (1)
  {
    unint64_t v3 = *((void *)v9 + 2);
    unint64_t v11 = *((void *)v9 + 3);
    if (v3 >= v11 >> 1)
    {
      uint64_t v9 = sub_22F19BFB8((char *)(v11 > 1), v3 + 1, 1, v9);
      uint64_t *v2 = v9;
    }
    *((void *)v9 + 2) = v3 + 1;
    unint64_t v12 = &v9[16 * v3];
    *((void *)v12 + 4) = countAndFlagsBits;
    *((void *)v12 + 5) = object;
    ((void (*)(unsigned char *, void))v8)(v20, 0);
LABEL_9:
    id v8 = (uint64_t (*)())(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends);
    swift_beginAccess();
    uint64_t v13 = *(char ***)v8;
    if ((*(void *)v8 & 0xC000000000000001) == 0) {
      break;
    }
    swift_bridgeObjectRetain();
    char v14 = (char *)MEMORY[0x230FB2E90](0, v13);
    swift_bridgeObjectRelease();
LABEL_12:
    unint64_t v3 = (unint64_t)&OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_partOfRectangleId;
    uint64_t v9 = &v14[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_partOfRectangleId];
    swift_beginAccess();
    *(void *)uint64_t v9 = countAndFlagsBits;
    *((void *)v9 + 1) = object;
    swift_bridgeObjectRetain();

    swift_bridgeObjectRelease();
    uint64_t v2 = *(char ***)v8;
    if ((*(void *)v8 & 0xC000000000000001) != 0) {
      goto LABEL_18;
    }
    if (*(void *)(((unint64_t)v2 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
    {
      uint64_t v15 = v2[5];
      goto LABEL_15;
    }
    __break(1u);
LABEL_20:
    uint64_t v9 = sub_22F19BFB8(0, *((void *)v9 + 2) + 1, 1, v9);
    uint64_t *v2 = v9;
  }
  if (*(void *)(((unint64_t)v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    char v14 = v13[4];
    goto LABEL_12;
  }
  __break(1u);
LABEL_18:
  swift_bridgeObjectRetain();
  uint64_t v15 = (char *)MEMORY[0x230FB2E90](1, v2);
  swift_bridgeObjectRelease();
LABEL_15:
  float32x4_t v16 = (uint64_t *)&v15[*(void *)v3];
  swift_beginAccess();
  uint64_t *v16 = countAndFlagsBits;
  v16[1] = (uint64_t)object;
  swift_bridgeObjectRetain();

  swift_bridgeObjectRelease();
  float32x4_t v17 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_center);
  swift_beginAccess();
  float32x4_t v18 = (uint64_t *)(*v17 + *(void *)v3);
  swift_beginAccess();
  *float32x4_t v18 = countAndFlagsBits;
  v18[1] = (uint64_t)object;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  float32x4_t v19 = (unsigned char *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_isALineMeasurement);
  swift_beginAccess();
  *float32x4_t v19 = 0;
}

Swift::Bool __swiftcall WorldLine.isPartOfAComposedObject()()
{
  uint64_t v1 = (unsigned char *)(v0 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_isALineMeasurement);
  swift_beginAccess();
  return (*v1 & 1) == 0;
}

Swift::Bool __swiftcall WorldLine.isPartOfComposedObject(withId:)(Swift::String withId)
{
  object = withId._object;
  uint64_t countAndFlagsBits = withId._countAndFlagsBits;
  uint64_t v4 = (unsigned char *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_isALineMeasurement);
  swift_beginAccess();
  if (*v4) {
    return 0;
  }
  char v5 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_identifiersOfObjectsComposedInto);
  Swift::Bool result = swift_beginAccess();
  uint64_t v7 = (void *)*v5;
  if (*v5)
  {
    uint64_t v8 = v7[2];
    if (v8)
    {
      BOOL v9 = v7[4] == countAndFlagsBits && v7[5] == (void)object;
      if (v9 || (sub_22F224738() & 1) != 0) {
        return 1;
      }
      unint64_t v11 = v7 + 7;
      do
      {
        Swift::Bool v10 = --v8 != 0;
        if (!v8) {
          break;
        }
        if (*(v11 - 1) == countAndFlagsBits && *v11 == (void)object) {
          break;
        }
        v11 += 2;
      }
      while ((sub_22F224738() & 1) == 0);
      return v10;
    }
    return 0;
  }
  __break(1u);
  return result;
}

Swift::Float __swiftcall WorldLine.estimatedLengthError()()
{
  unint64_t v7 = v1;
  unint64_t v8 = v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends;
  swift_beginAccess();
  unint64_t v9 = *(void *)v8;
  if ((*(void *)v8 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    Swift::Bool v10 = (char *)MEMORY[0x230FB2E90](0, v9);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_44:
      swift_bridgeObjectRetain();
      float32x4_t v16 = (char *)MEMORY[0x230FB2E90](1, v3);
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    Swift::Bool v10 = (char *)*(id *)(v9 + 32);
  }
  uint64_t v0 = &qword_268695000;
  unint64_t v11 = &v10[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
  swift_beginAccess();
  unint64_t v12 = *(os_unfair_lock_s **)(*(void *)v11 + 24);
  swift_retain();
  os_unfair_lock_lock(v12);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_unlock(v12);

  swift_release();
  unint64_t v9 = WorldAnchor.viewDirection.getter();
  uint64_t v2 = v13;
  char v15 = v14;
  swift_release();
  float v6 = -1.0;
  if (v15) {
    return v6;
  }
  unint64_t v3 = *(void *)v8;
  if ((*(void *)v8 & 0xC000000000000001) != 0) {
    goto LABEL_44;
  }
  if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
  {
    __break(1u);
LABEL_46:
    swift_bridgeObjectRetain();
    long long v23 = (char *)MEMORY[0x230FB2E90](0, v5);
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  float32x4_t v16 = (char *)*(id *)(v3 + 40);
LABEL_8:
  float32x4_t v17 = &v16[v0[463]];
  swift_beginAccess();
  float32x4_t v18 = *(os_unfair_lock_s **)(*(void *)v17 + 24);
  swift_retain();
  os_unfair_lock_lock(v18);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_unlock(v18);

  swift_release();
  float32x4_t v19 = (uint64_t *)WorldAnchor.viewDirection.getter();
  unint64_t v4 = v20;
  char v22 = v21;
  swift_release();
  if (v22) {
    return v6;
  }
  unint64_t v5 = *(void *)v8;
  __n128 v98 = v19;
  unint64_t v96 = v4;
  if ((*(void *)v8 & 0xC000000000000001) != 0) {
    goto LABEL_46;
  }
  if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    long long v23 = (char *)*(id *)(v5 + 32);
LABEL_12:
    uint64_t v24 = &v23[v0[463]];
    swift_beginAccess();
    uint64_t v25 = *(void *)v24;
    uint64_t v26 = *(os_unfair_lock_s **)(v25 + 24);
    swift_retain();
    os_unfair_lock_lock(v26);
    swift_beginAccess();
    uint64_t v27 = *(void *)(v25 + 16);
    swift_retain();
    os_unfair_lock_unlock(v26);

    swift_release();
    float32x4_t v19 = &qword_268695000;
    char v28 = (uint64_t *)(v27 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane);
    swift_beginAccess();
    uint64_t v29 = *v28;
    float32x4_t v30 = *(os_unfair_lock_s **)(v29 + 24);
    swift_retain();
    os_unfair_lock_lock(v30);
    swift_beginAccess();
    unint64_t v5 = *(void *)(v29 + 16);
    swift_retain();
    os_unfair_lock_unlock(v30);
    swift_release();
    swift_release();
    if (!v5)
    {
      float v95 = 0.0;
      goto LABEL_19;
    }
    unint64_t v7 = *(void *)v8;
    if ((*(void *)v8 & 0xC000000000000001) != 0) {
      goto LABEL_50;
    }
    if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __n128 v31 = (char *)*(id *)(v7 + 32);
      while (1)
      {
        uint64_t v32 = &v31[v0[463]];
        swift_beginAccess();
        uint64_t v33 = *(os_unfair_lock_s **)(*(void *)v32 + 24);
        swift_retain();
        os_unfair_lock_lock(v33);
        swift_beginAccess();
        swift_retain();
        os_unfair_lock_unlock(v33);

        swift_release();
        unint64_t v34 = WorldAnchor.distanceToViewAnchor.getter();
        swift_release();
        if ((v34 & 0x100000000) != 0) {
          goto LABEL_58;
        }
        float v95 = WorldPlane.estimatedErrorAlongNormal(distanceFromObservation:)(*(Swift::Float *)&v34);
        swift_release();
LABEL_19:
        unint64_t v7 = *(void *)v8;
        if ((*(void *)v8 & 0xC000000000000001) != 0) {
          goto LABEL_48;
        }
        if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
        {
          id v36 = (char *)*(id *)(v7 + 40);
          goto LABEL_22;
        }
        __break(1u);
LABEL_50:
        swift_bridgeObjectRetain();
        __n128 v31 = (char *)MEMORY[0x230FB2E90](0, v7);
        swift_bridgeObjectRelease();
      }
    }
    __break(1u);
LABEL_52:
    swift_bridgeObjectRetain();
    uint64_t v45 = (char *)MEMORY[0x230FB2E90](1, v4);
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  __break(1u);
LABEL_48:
  swift_bridgeObjectRetain();
  id v36 = (char *)MEMORY[0x230FB2E90](1, v7);
  swift_bridgeObjectRelease();
LABEL_22:
  uint64_t v37 = &v36[v0[463]];
  swift_beginAccess();
  uint64_t v38 = *(void *)v37;
  float v39 = *(os_unfair_lock_s **)(v38 + 24);
  swift_retain();
  os_unfair_lock_lock(v39);
  swift_beginAccess();
  __n128 v40 = *(uint64_t **)(v38 + 16);
  swift_retain();
  os_unfair_lock_unlock(v39);

  swift_release();
  objc_super v41 = (uint64_t *)((char *)v40 + v19[415]);
  swift_beginAccess();
  uint64_t v42 = *v41;
  char v43 = *(os_unfair_lock_s **)(v42 + 24);
  swift_retain();
  os_unfair_lock_lock(v43);
  swift_beginAccess();
  uint64_t v44 = *(void *)(v42 + 16);
  swift_retain();
  os_unfair_lock_unlock(v43);
  swift_release();
  swift_release();
  if (!v44) {
    return v6;
  }
  unint64_t v4 = *(void *)v8;
  if ((*(void *)v8 & 0xC000000000000001) != 0) {
    goto LABEL_52;
  }
  if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
  {
    __break(1u);
    goto LABEL_54;
  }
  uint64_t v45 = (char *)*(id *)(v4 + 40);
LABEL_26:
  uint64_t v46 = (uint64_t **)&v45[v0[463]];
  swift_beginAccess();
  uint64_t v47 = *v46;
  uint64_t v48 = (os_unfair_lock_s *)v47[3];
  swift_retain();
  os_unfair_lock_lock(v48);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_unlock(v48);

  swift_release();
  unint64_t v49 = WorldAnchor.distanceToViewAnchor.getter();
  swift_release();
  if ((v49 & 0x100000000) == 0)
  {
    float v93 = WorldPlane.estimatedErrorAlongNormal(distanceFromObservation:)(*(Swift::Float *)&v49);
    swift_release();
    __n128 v40 = v98;
    if (v5)
    {
      unint64_t v5 = *(void *)v8;
      if ((*(void *)v8 & 0xC000000000000001) == 0)
      {
        if (!*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_56;
        }
        uint64_t v50 = (char *)*(id *)(v5 + 32);
LABEL_31:
        uint64_t v51 = &v50[v0[463]];
        swift_beginAccess();
        uint64_t v52 = *(void *)v51;
        id v53 = *(os_unfair_lock_s **)(v52 + 24);
        swift_retain();
        os_unfair_lock_lock(v53);
        swift_beginAccess();
        uint64_t v54 = *(void *)(v52 + 16);
        swift_retain();
        os_unfair_lock_unlock(v53);

        swift_release();
        uint64_t v47 = &qword_268695000;
        long long v94 = *(_OWORD *)(v54 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);
        swift_release();
        unint64_t v8 = *(void *)v8;
        if ((v8 & 0xC000000000000001) == 0)
        {
          if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
          {
            __break(1u);
LABEL_58:
            __break(1u);
            goto LABEL_59;
          }
          uint64_t v55 = (char *)*(id *)(v8 + 40);
          goto LABEL_34;
        }
LABEL_56:
        swift_bridgeObjectRetain();
        uint64_t v55 = (char *)MEMORY[0x230FB2E90](1, v8);
        swift_bridgeObjectRelease();
LABEL_34:
        v56.i64[0] = v9;
        v56.i64[1] = v2;
        float32x4_t v92 = v56;
        v56.i64[0] = (uint64_t)v40;
        v56.i64[1] = v96;
        float32x4_t v97 = v56;
        uint64_t v57 = &v55[v0[463]];
        swift_beginAccess();
        uint64_t v58 = *(void *)v57;
        unint64_t v59 = *(os_unfair_lock_s **)(v58 + 24);
        swift_retain();
        os_unfair_lock_lock(v59);
        swift_beginAccess();
        uint64_t v60 = *(void *)(v58 + 16);
        swift_retain();
        os_unfair_lock_unlock(v59);

        swift_release();
        long long v91 = *(_OWORD *)(v60 + v47[418] + 48);
        swift_release();
        float v61 = vmuls_lane_f32(v95, v92, 2);
        float v62 = v61 + *((float *)&v94 + 2);
        float v63 = *((float *)&v94 + 2) - v61;
        float v64 = vmuls_lane_f32(v93, v97, 2);
        float v65 = v64 + *((float *)&v91 + 2);
        float v66 = *((float *)&v91 + 2) - v64;
        float32_t v67 = v62 - (float)(v64 + *((float *)&v91 + 2));
        float32_t v68 = v63 - v65;
        float32x2_t v69 = vmul_n_f32((float32x2_t)__PAIR64__(v92.u32[1], v9), v95);
        v70.i32[3] = HIDWORD(v94);
        float32x2_t v71 = vsub_f32(*(float32x2_t *)&v94, v69);
        float32x2_t v72 = vmul_n_f32((float32x2_t)__PAIR64__(v97.u32[1], v40), v93);
        float32x2_t v73 = vsub_f32(*(float32x2_t *)&v91, v72);
        float32x2_t v74 = vadd_f32(v69, *(float32x2_t *)&v94);
        *(float32x2_t *)v70.f32 = vsub_f32(v74, v73);
        v70.f32[2] = v62 - v66;
        float32x4_t v75 = vmulq_f32(v70, v70);
        float32x4_t v76 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v75, 2), vaddq_f32(v75, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v75.f32, 1)));
        float v77 = sqrtf(v76.f32[0]);
        *(float32x2_t *)v76.f32 = vadd_f32(v72, *(float32x2_t *)&v91);
        *(float32x2_t *)v78.f32 = vsub_f32(v74, *(float32x2_t *)v76.f32);
        v78.f32[2] = v67;
        float32x4_t v79 = vmulq_f32(v78, v78);
        *(float32x2_t *)v76.f32 = vsub_f32(v71, *(float32x2_t *)v76.f32);
        v76.f32[2] = v68;
        float32x4_t v80 = vmulq_f32(v76, v76);
        float v81 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v79, 2), vaddq_f32(v79, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v79.f32, 1))).f32[0]);
        float32x4_t v82 = vaddq_f32(v80, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v80.f32, 1));
        v80.i32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v80, 2), v82).u32[0];
        *(float32x2_t *)v82.f32 = vsub_f32(v71, v73);
        v82.f32[2] = v63 - v66;
        float32x4_t v83 = vmulq_f32(v82, v82);
        float v84 = sqrtf(v80.f32[0]);
        float v85 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v83, 2), vaddq_f32(v83, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v83.f32, 1))).f32[0]);
        float v86 = WorldLine.length()();
        float v87 = vabds_f32(v81, v86);
        float v88 = vabds_f32(v77, v86);
        if (v87 <= v88) {
          float v87 = v88;
        }
        float v89 = vabds_f32(v84, v86);
        float v90 = vabds_f32(v85, v86);
        if (v89 > v90) {
          float v90 = v89;
        }
        if (v87 > v90) {
          return v87;
        }
        else {
          return v90;
        }
      }
LABEL_54:
      swift_bridgeObjectRetain();
      uint64_t v50 = (char *)MEMORY[0x230FB2E90](0, v5);
      swift_bridgeObjectRelease();
      goto LABEL_31;
    }
    return v6;
  }
LABEL_59:
  __break(1u);
  return result;
}

id WorldLine.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void WorldLine.init()()
{
}

uint64_t sub_22F20BCF8()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id WorldLine.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WorldLine();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22F20BDF8(char *a1, char *a2)
{
  return sub_22F1F9380(*a1, *a2);
}

uint64_t sub_22F20BE04()
{
  return sub_22F208804();
}

uint64_t sub_22F20BE0C()
{
  return sub_22F20890C();
}

uint64_t sub_22F20BE14()
{
  return sub_22F208A00();
}

uint64_t sub_22F20BE1C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22F20C6D4();
  *a1 = result;
  return result;
}

void sub_22F20BE4C(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE200000000000000;
  uint64_t v3 = 25705;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE500000000000000;
      uint64_t v3 = 0x7472617473;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 6581861;
      *(void *)(a1 + 8) = 0xE300000000000000;
      break;
    case 3:
      *(void *)a1 = 0x6874676E656CLL;
      *(void *)(a1 + 8) = 0xE600000000000000;
      break;
    case 4:
      strcpy((char *)a1, "estimatedError");
      *(unsigned char *)(a1 + 15) = -18;
      break;
    case 5:
      *(void *)a1 = 0xD000000000000016;
      *(void *)(a1 + 8) = 0x800000022F22D690;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

unint64_t sub_22F20BF1C()
{
  unint64_t result = 25705;
  switch(*v0)
  {
    case 1:
      unint64_t result = 0x7472617473;
      break;
    case 2:
      unint64_t result = 6581861;
      break;
    case 3:
      unint64_t result = 0x6874676E656CLL;
      break;
    case 4:
      unint64_t result = 0x6574616D69747365;
      break;
    case 5:
      unint64_t result = 0xD000000000000016;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22F20BFD8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22F20C6D4();
  *a1 = result;
  return result;
}

void sub_22F20C000(unsigned char *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_22F20C00C(uint64_t a1)
{
  unint64_t v2 = sub_22F20C680();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22F20C048(uint64_t a1)
{
  unint64_t v2 = sub_22F20C680();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WorldLine.ResultRepresentation.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268695DB0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  unint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_22F20C680();
  sub_22F224868();
  swift_beginAccess();
  v18[0].n128_u8[0] = 0;
  swift_bridgeObjectRetain();
  sub_22F224678();
  if (v2)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  Swift::Bool v10 = (uint64_t *)(a2 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends);
  swift_beginAccess();
  uint64_t v11 = *v10;
  if ((*v10 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    unint64_t v12 = (char *)MEMORY[0x230FB2E90](0, v11);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (!*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_12;
    }
    unint64_t v12 = (char *)*(id *)(v11 + 32);
  }
  sub_22F214000(v12, v18);
  char v17 = 1;
  sub_22F20C720();
  uint64_t result = sub_22F2246A8();
  uint64_t v11 = *v10;
  if ((*v10 & 0xC000000000000001) != 0)
  {
LABEL_12:
    swift_bridgeObjectRetain();
    uint64_t v13 = (char *)MEMORY[0x230FB2E90](1, v11);
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  if (*(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    uint64_t v13 = (char *)*(id *)(v11 + 40);
LABEL_9:
    sub_22F214000(v13, v18);
    char v17 = 2;
    sub_22F2246A8();
    WorldLine.length()();
    id v14 = objc_msgSend(self, sel_standardUserDefaults);
    char v15 = (void *)sub_22F223A98();
    objc_msgSend(v14, sel_floatForKey_, v15);

    v18[0].n128_u8[0] = 3;
    sub_22F224698();
    WorldLine.estimatedLengthError()();
    v18[0].n128_u8[0] = 4;
    sub_22F224698();
    swift_beginAccess();
    char v17 = 5;
    sub_22F224688();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  __break(1u);
  return result;
}

uint64_t sub_22F20C47C(void *a1)
{
  return WorldLine.ResultRepresentation.encode(to:)(a1, *v1);
}

id WorldLine.resultRepresentation.getter()
{
  return v0;
}

id sub_22F20C4A0@<X0>(void **a1@<X8>)
{
  uint64_t v2 = *v1;
  *a1 = *v1;
  return v2;
}

uint64_t type metadata accessor for WorldLine()
{
  return self;
}

char *sub_22F20C4D4(uint64_t a1)
{
  return sub_22F19B630(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void sub_22F20C4E8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_22F2245C8();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x230FB2EA0);
}

char *sub_22F20C564(uint64_t a1)
{
  return sub_22F19C0BC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_22F20C578(unint64_t a1, uint64_t a2)
{
  return sub_22F20C590(a1, a2);
}

uint64_t sub_22F20C590(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    uint64_t v5 = 0;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v6 = MEMORY[0x230FB2E90](v5, a1);
        swift_unknownObjectRelease();
        if (v6 == a2) {
          return v5;
        }
      }
      else if (*(void *)(a1 + 8 * v5 + 32) == a2)
      {
        return v5;
      }
      if (__OFADD__(v5, 1)) {
        break;
      }
      if (++v5 == v4) {
        return 0;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_22F2245C8();
    swift_bridgeObjectRelease();
  }
  return 0;
}

unint64_t sub_22F20C680()
{
  unint64_t result = qword_268695DB8;
  if (!qword_268695DB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695DB8);
  }
  return result;
}

uint64_t sub_22F20C6D4()
{
  unint64_t v0 = sub_22F224628();
  swift_bridgeObjectRelease();
  if (v0 >= 6) {
    return 6;
  }
  else {
    return v0;
  }
}

unint64_t sub_22F20C720()
{
  unint64_t result = qword_268695DC0;
  if (!qword_268695DC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695DC0);
  }
  return result;
}

unint64_t sub_22F20C778()
{
  unint64_t result = qword_268695DC8;
  if (!qword_268695DC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695DC8);
  }
  return result;
}

uint64_t sub_22F20C7CC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm_1(a1, &OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends, a2);
}

uint64_t sub_22F20C7D8(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_22F208CBC(a1, a2, a3, a4, &OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends);
}

id sub_22F20C7F8@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_center);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_22F20C860@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm_1(a1, &OBJC_IVAR____TtC17MeasureFoundation9WorldLine_snappedPoints, a2);
}

uint64_t keypath_getTm_1@<X0>(void *a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v4 = (void *)(*a1 + *a2);
  swift_beginAccess();
  *a3 = *v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22F20C8C0(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_22F208CBC(a1, a2, a3, a4, &OBJC_IVAR____TtC17MeasureFoundation9WorldLine_snappedPoints);
}

uint64_t sub_22F20C8E0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (void *)(*a1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_identifiersOfObjectsComposedInto);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for WorldLine.ResultRepresentation()
{
  return &type metadata for WorldLine.ResultRepresentation;
}

uint64_t getEnumTagSinglePayload for WorldLine.ResultRepresentation.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for WorldLine.ResultRepresentation.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *unint64_t result = a2 + 5;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22F20CAA8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorldLine.ResultRepresentation.CodingKeys()
{
  return &type metadata for WorldLine.ResultRepresentation.CodingKeys;
}

unint64_t sub_22F20CAE4()
{
  unint64_t result = qword_268695DD0;
  if (!qword_268695DD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695DD0);
  }
  return result;
}

unint64_t sub_22F20CB3C()
{
  unint64_t result = qword_268695DD8;
  if (!qword_268695DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695DD8);
  }
  return result;
}

unint64_t sub_22F20CB94()
{
  unint64_t result = qword_268695DE0;
  if (!qword_268695DE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695DE0);
  }
  return result;
}

uint64_t WorldLineGuideType.rawValue.getter(uint64_t result)
{
  return result;
}

void Segment.end1.setter(__n128 a1)
{
  __n128 *v1 = a1;
}

uint64_t (*Segment.end1.modify())()
{
  return nullsub_1;
}

double Segment.end2.getter(double a1, double a2)
{
  return a2;
}

void Segment.end2.setter(__n128 a1)
{
  v1[1] = a1;
}

uint64_t (*Segment.end2.modify())()
{
  return nullsub_1;
}

BOOL Segment.isEqual(to:)(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4)
{
  float32x4_t v4 = vsubq_f32(a3, a1);
  float32x4_t v5 = vmulq_f32(v4, v4);
  float32x4_t v6 = vsubq_f32(a4, a2);
  float32x4_t v7 = vmulq_f32(v6, v6);
  BOOL v8 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2), vaddq_f32(v5, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 1))).f32[0] < 0.00000011921;
  return vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).f32[0] < 0.00000011921&& v8;
}

__n128 GuideSegments.primary.getter@<Q0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 32);
  __n128 result = *(__n128 *)v1;
  long long v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v2;
  return result;
}

uint64_t GuideSegments.primary.setter(uint64_t a1)
{
  return sub_22F20D808(a1, v1);
}

uint64_t (*GuideSegments.primary.modify())()
{
  return nullsub_1;
}

__n128 GuideSegments.visible.getter@<Q0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 80);
  __n128 result = *(__n128 *)(v1 + 48);
  long long v4 = *(_OWORD *)(v1 + 64);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v2;
  return result;
}

uint64_t GuideSegments.visible.setter(uint64_t a1)
{
  return sub_22F20D808(a1, v1 + 48);
}

uint64_t (*GuideSegments.visible.modify())()
{
  return nullsub_1;
}

BOOL static GuideAnchorState.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t GuideAnchorState.hash(into:)()
{
  return sub_22F2247F8();
}

uint64_t GuideAnchorState.hashValue.getter()
{
  return sub_22F224818();
}

BOOL sub_22F20CD90(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t WorldLineGuide.backingPlanes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WorldLineGuide.backingPlanes.setter(uint64_t a1)
{
  int v3 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_backingPlanes);
  swift_beginAccess();
  *int v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*WorldLineGuide.backingPlanes.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t WorldLineGuide.anchorState.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_anchorState);
  swift_beginAccess();
  return *v1;
}

uint64_t WorldLineGuide.anchorState.setter(char a1)
{
  char v2 = a1 & 1;
  int v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_anchorState);
  uint64_t result = swift_beginAccess();
  *int v3 = v2;
  return result;
}

uint64_t (*WorldLineGuide.anchorState.modify())()
{
  return j__swift_endAccess;
}

uint64_t WorldLineGuide.guideType.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_guideType);
  swift_beginAccess();
  return *v1;
}

double WorldLineGuide.end1.getter()
{
  *(void *)&double result = sub_22F20CFFC(&OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_end1Anchor).n128_u64[0];
  return result;
}

double WorldLineGuide.end2.getter()
{
  *(void *)&double result = sub_22F20CFFC(&OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_end2Anchor).n128_u64[0];
  return result;
}

__n128 sub_22F20CFFC(void *a1)
{
  return *(__n128 *)(*(void *)(v1 + *a1) + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
}

__n128 sub_22F20D01C@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_segments;
  swift_beginAccess();
  char v4 = *(unsigned char *)(v3 + 32);
  char v5 = *(unsigned char *)(v3 + 80);
  long long v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)v3;
  *(_OWORD *)(a2 + 16) = v6;
  *(unsigned char *)(a2 + 32) = v4;
  __n128 result = *(__n128 *)(v3 + 48);
  long long v8 = *(_OWORD *)(v3 + 64);
  *(__n128 *)(a2 + 48) = result;
  *(_OWORD *)(a2 + 64) = v8;
  *(unsigned char *)(a2 + 80) = v5;
  return result;
}

__n128 sub_22F20D088(long long *a1, void *a2)
{
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  char v4 = *((unsigned char *)a1 + 32);
  __n128 v10 = (__n128)a1[3];
  long long v11 = *a1;
  uint64_t v5 = *((void *)a1 + 8);
  uint64_t v6 = *((void *)a1 + 9);
  char v7 = *((unsigned char *)a1 + 80);
  uint64_t v8 = *a2 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_segments;
  swift_beginAccess();
  *(_OWORD *)uint64_t v8 = v11;
  *(void *)(v8 + 16) = v2;
  *(void *)(v8 + 24) = v3;
  *(unsigned char *)(v8 + 32) = v4;
  __n128 result = v10;
  *(__n128 *)(v8 + 48) = v10;
  *(void *)(v8 + 64) = v5;
  *(void *)(v8 + 72) = v6;
  *(unsigned char *)(v8 + 80) = v7;
  return result;
}

__n128 WorldLineGuide.segments.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_segments;
  swift_beginAccess();
  char v4 = *(unsigned char *)(v3 + 32);
  char v5 = *(unsigned char *)(v3 + 80);
  long long v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(_OWORD *)(a1 + 16) = v6;
  *(unsigned char *)(a1 + 32) = v4;
  __n128 result = *(__n128 *)(v3 + 48);
  long long v8 = *(_OWORD *)(v3 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v8;
  *(unsigned char *)(a1 + 80) = v5;
  return result;
}

char *WorldLineGuide.__allocating_init(guideType:end1:end2:primarySegmentEnd1:primarySegmentEnd2:backingPlanes:anchorState:)(char a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, __n128 a9, __n128 a10, __n128 a11, __n128 a12, __n128 a13, __n128 a14, __n128 a15, __n128 a16, char a17)
{
  char v24 = a4 & 1;
  char v25 = a7 & 1;
  id v26 = objc_allocWithZone(v17);
  return WorldLineGuide.init(guideType:end1:end2:primarySegmentEnd1:primarySegmentEnd2:backingPlanes:anchorState:)(a1, a2, a3, v24, a5, a6, v25, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17 & 1);
}

char *WorldLineGuide.init(guideType:end1:end2:primarySegmentEnd1:primarySegmentEnd2:backingPlanes:anchorState:)(char a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, __n128 a9, __n128 a10, __n128 a11, __n128 a12, __n128 a13, __n128 a14, __n128 a15, __n128 a16, char a17)
{
  unint64_t v20 = &v17[OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_backingPlanes];
  *(void *)&v17[OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_backingPlanes] = 0;
  char v21 = &v17[OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_anchorState];
  v17[OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_anchorState] = 0;
  char v22 = &v17[OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_segments];
  *(_OWORD *)char v22 = 0u;
  *((_OWORD *)v22 + 1) = 0u;
  v22[32] = 1;
  char v23 = a4 | a7;
  *((_OWORD *)v22 + 3) = 0u;
  *((_OWORD *)v22 + 4) = 0u;
  v22[80] = 1;
  swift_beginAccess();
  *char v21 = a17 & 1;
  v17[OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_guideType] = a1;
  memset(v47, 0, 64);
  v47[64] = 1;
  type metadata accessor for WorldAnchor();
  swift_allocObject();
  char v24 = v17;
  *(void *)&v24[OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_end1Anchor] = WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)((uint64_t)v47, 0, 1, (uint64_t)v47, a9, a10, a11, a12, 0.0);
  swift_allocObject();
  *(void *)&v24[OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_end2Anchor] = WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)((uint64_t)v47, 0, 1, (uint64_t)v47, a13, a14, a15, a16, 0.0);
  swift_beginAccess();
  *unint64_t v20 = a8;
  swift_bridgeObjectRelease();
  if ((v23 & 1) == 0)
  {
    swift_beginAccess();
    *(void *)char v22 = a2;
    *((void *)v22 + 1) = a3;
    *((void *)v22 + 2) = a5;
    *((void *)v22 + 3) = a6;
    v22[32] = 0;
  }
  __n128 v25 = a12;
  v25.n128_u32[3] = 0;
  __n128 v43 = v25;
  __n128 v26 = a16;
  v26.n128_u32[3] = 0;
  __n128 v45 = v26;
  swift_beginAccess();
  *((__n128 *)v22 + 3) = v43;
  *((__n128 *)v22 + 4) = v45;
  v22[80] = 0;

  v46.receiver = v24;
  v46.super_class = (Class)type metadata accessor for WorldLineGuide();
  uint64_t v27 = (char *)objc_msgSendSuper2(&v46, sel_init);
  uint64_t v28 = *(void *)&v27[OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state];
  uint64_t v29 = *(os_unfair_lock_s **)(v28 + 24);
  float32x4_t v30 = v27;
  swift_retain();
  os_unfair_lock_lock(v29);
  swift_beginAccess();
  *(void *)(v28 + 16) = 8;
  os_unfair_lock_unlock(v29);

  swift_release();
  return v30;
}

Swift::Void __swiftcall WorldLineGuide.update(end1:end2:)(simd_float4x4 *end1, simd_float4x4 *end2)
{
  __n128 v17 = v9;
  __n128 v18 = v10;
  __n128 v15 = v7;
  __n128 v16 = v8;
  __n128 v13 = v5;
  __n128 v14 = v6;
  __n128 v11 = v3;
  __n128 v12 = v4;
  memset(v19, 0, sizeof(v19));
  char v20 = 1;
  type metadata accessor for WorldAnchor();
  swift_allocObject();
  *(void *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_end1Anchor) = WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)((uint64_t)v19, 0, 1, (uint64_t)v19, v11, v12, v13, v14, 0.0);
  swift_release();
  swift_allocObject();
  *(void *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_end2Anchor) = WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)((uint64_t)v19, 0, 1, (uint64_t)v19, v15, v16, v17, v18, 0.0);
  swift_release();
}

__n128 WorldLineGuide.updatePrimarySegment(end1:end2:)(__n128 a1, __n128 a2)
{
  __n128 v3 = (__n128 *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_segments);
  swift_beginAccess();
  __n128 result = a2;
  *__n128 v3 = a1;
  v3[1] = a2;
  v3[2].n128_u8[0] = 0;
  return result;
}

__n128 WorldLineGuide.updateVisibleSegment(end1:end2:)(__n128 a1, __n128 a2)
{
  __n128 v3 = (__n128 *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_segments);
  swift_beginAccess();
  __n128 result = a2;
  v3[3] = a1;
  v3[4] = a2;
  v3[5].n128_u8[0] = 0;
  return result;
}

id WorldLineGuide.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void WorldLineGuide.init()()
{
}

uint64_t sub_22F20D728()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

id WorldLineGuide.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WorldLineGuide();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22F20D808(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268695DE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for WorldLineGuide()
{
  return self;
}

unint64_t sub_22F20D898()
{
  unint64_t result = qword_268695E20;
  if (!qword_268695E20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695E20);
  }
  return result;
}

unint64_t sub_22F20D8F0()
{
  unint64_t result = qword_268695E28;
  if (!qword_268695E28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695E28);
  }
  return result;
}

uint64_t sub_22F20D944@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  __n128 v3 = (unsigned char *)(*a1 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_guideType);
  uint64_t result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_22F20D998(char *a1, void *a2)
{
  char v2 = *a1;
  __n128 v3 = (unsigned char *)(*a2 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_guideType);
  uint64_t result = swift_beginAccess();
  *__n128 v3 = v2;
  return result;
}

unsigned char *storeEnumTagSinglePayload for WorldLineGuideType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22F20DABCLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorldLineGuideType()
{
  return &type metadata for WorldLineGuideType;
}

__n128 __swift_memcpy32_16(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

ValueMetadata *type metadata accessor for Segment()
{
  return &type metadata for Segment;
}

__n128 __swift_memcpy81_16(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for GuideSegments(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 81)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for GuideSegments(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 80) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 81) = v3;
  return result;
}

ValueMetadata *type metadata accessor for GuideSegments()
{
  return &type metadata for GuideSegments;
}

uint64_t getEnumTagSinglePayload for GuideAnchorState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for GuideAnchorState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22F20DD04);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_22F20DD2C(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for GuideAnchorState()
{
  return &type metadata for GuideAnchorState;
}

uint64_t WorldPlaneType.description.getter(char a1)
{
  uint64_t result = 0x74694B7261;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x6465727265666E69;
      break;
    case 2:
      uint64_t result = 0x6B6361626C6C6166;
      break;
    case 3:
      uint64_t result = 0x6C61636F6CLL;
      break;
    case 4:
      uint64_t result = 0x73756F6976657270;
      break;
    case 5:
      uint64_t result = 0x6863746170;
      break;
    case 6:
      uint64_t result = 0x706544656C707061;
      break;
    default:
      return result;
  }
  return result;
}

BOOL static WorldPlaneContext.MeasureType.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

__n128 WorldPlaneHitTestResult.init(position:normal:confidence:type:)@<Q0>(char a1@<W0>, uint64_t a2@<X8>, double a3@<D0>, float32x4_t a4@<Q1>, float a5@<S2>)
{
  _sSo13simd_float4x4a17MeasureFoundationE4make8position17normalizedForwardABs5SIMD3VySfG_AItFZ_0(a3, a4);
  sceneKitToARKit(_:)(v9, v8);
  long long v21 = v11;
  long long v22 = v10;
  __n128 v19 = v13;
  long long v20 = v12;
  id v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F20E38]), sel_initWithTransform_, *(double *)&v10, *(double *)&v11, *(double *)&v12, v13.n128_f64[0]);
  type metadata accessor for WorldPlane();
  swift_allocObject();
  uint64_t v15 = sub_22F210A98(v14, a1, 1.0 - a5, 1.0);

  swift_retain();
  sub_22F2105E8();
  int v17 = v16;
  swift_release();
  *(_OWORD *)a2 = xmmword_22F228C60;
  *(_OWORD *)(a2 + 16) = v22;
  *(_OWORD *)(a2 + 32) = v21;
  *(_OWORD *)(a2 + 48) = v20;
  __n128 result = v19;
  *(__n128 *)(a2 + 64) = v19;
  *(void *)(a2 + 80) = 0;
  *(void *)(a2 + 88) = 0;
  *(unsigned char *)(a2 + 96) = 1;
  *(void *)(a2 + 104) = v15;
  *(_DWORD *)(a2 + 112) = v17;
  return result;
}

Swift::Float __swiftcall WorldPlaneHitTestResult.distanceToCamera(in:)(ARFrame in)
{
  float v2 = v1[9].f32[0];
  id v3 = [(objc_class *)in.super.isa camera];
  objc_msgSend(v3, sel_transform);
  long long v7 = v4;

  float32x2_t v5 = vsub_f32(v1[8], *(float32x2_t *)&v7);
  return sqrtf((float)((float)(v2 - *((float *)&v7 + 2)) * (float)(v2 - *((float *)&v7 + 2))) + vaddv_f32(vmul_f32(v5, v5)));
}

uint64_t WorldPlane.__allocating_init(anchor:type:uncertainty:confidenceMultiplier:)(void *a1, char a2, float a3, float a4)
{
  swift_allocObject();
  uint64_t v8 = sub_22F210A98(a1, a2, a3, a4);

  return v8;
}

double WorldPlaneHitTestResult.init(transform:plane:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>, __n128 a3@<Q0>, __n128 a4@<Q1>, __n128 a5@<Q2>, __n128 a6@<Q3>)
{
  __n128 v23 = a6;
  switch(*(unsigned char *)(a1 + 48))
  {
    case 1:
      swift_retain();
      float v17 = WorldPlane.confidence.getter();
      swift_release();
      __n128 v10 = a3;
      __n128 v9 = a4;
      __n128 v11 = a5;
      __n128 v12 = v23;
      float v8 = v17 * 0.75;
      break;
    case 2:
    case 4:
      swift_retain();
      float v13 = WorldPlane.confidence.getter();
      swift_release();
      __n128 v10 = a3;
      __n128 v9 = a4;
      __n128 v11 = a5;
      __n128 v12 = v23;
      float v8 = v13 * 0.5;
      break;
    case 3:
    case 5:
    case 6:
      swift_retain();
      float v8 = WorldPlane.confidence.getter();
      swift_release();
      __n128 v10 = a3;
      __n128 v9 = a4;
      __n128 v11 = a5;
      __n128 v12 = v23;
      break;
    default:
      a6.n128_u32[3] = 0;
      float32x4_t v19 = (float32x4_t)a6;
      swift_retain();
      unint64_t v14 = WorldPlane.distanceToEdge(point:)(v19);
      if ((v14 & 0x100000000) != 0)
      {
        swift_release();
        float v8 = 0.0;
      }
      else
      {
        if (COERCE_FLOAT(v14 & 0x7FFFFFFF) >= 0.06) {
          float v15 = 0.0;
        }
        else {
          float v15 = 1.0 - (float)(COERCE_FLOAT(v14 & 0x7FFFFFFF) / 0.06);
        }
        float v16 = WorldPlane.confidence.getter();
        swift_release();
        float v8 = fmaxf(v15, 0.2) * v16;
      }
      __n128 v12 = v23;
      __n128 v9 = a4;
      __n128 v11 = a5;
      __n128 v10 = a3;
      break;
  }
  double result = 0.000488281365;
  *(_OWORD *)a2 = xmmword_22F228C60;
  *(__n128 *)(a2 + 16) = v10;
  *(__n128 *)(a2 + 32) = v9;
  *(__n128 *)(a2 + 48) = v11;
  *(__n128 *)(a2 + 64) = v12;
  *(void *)(a2 + 80) = 0;
  *(void *)(a2 + 88) = 0;
  *(unsigned char *)(a2 + 96) = 1;
  *(void *)(a2 + 104) = a1;
  *(float *)(a2 + 112) = v8;
  return result;
}

Swift::Float __swiftcall WorldPlaneHitTestResult.distanceSquaredToCamera(in:)(ARFrame in)
{
  float v2 = v1[9].f32[0];
  id v3 = [(objc_class *)in.super.isa camera];
  objc_msgSend(v3, sel_transform);
  long long v7 = v4;

  float32x2_t v5 = vsub_f32(v1[8], *(float32x2_t *)&v7);
  return (float)((float)(v2 - *((float *)&v7 + 2)) * (float)(v2 - *((float *)&v7 + 2))) + vaddv_f32(vmul_f32(v5, v5));
}

void WorldPlaneHitTestResult.init(arHitResult:withPlaneType:)(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  id v6 = objc_msgSend(a1, sel_anchor);
  if (v6)
  {
    long long v7 = v6;
    type metadata accessor for WorldPlane();
    swift_allocObject();
    uint64_t v8 = sub_22F210A98(v7, a2, 0.0, 1.0);

    objc_msgSend(a1, sel_worldTransform);
    long long v17 = v10;
    long long v18 = v9;
    long long v15 = v12;
    long long v16 = v11;
    swift_retain_n();
    sub_22F2105E8();
    int v14 = v13;
    swift_release_n();

    *(_OWORD *)a3 = xmmword_22F228C60;
    *(_OWORD *)(a3 + 16) = v18;
    *(_OWORD *)(a3 + 32) = v17;
    *(_OWORD *)(a3 + 48) = v16;
    *(_OWORD *)(a3 + 64) = v15;
    *(void *)(a3 + 80) = 0;
    *(void *)(a3 + 88) = 0;
    *(unsigned char *)(a3 + 96) = 1;
    *(void *)(a3 + 104) = v8;
    *(_DWORD *)(a3 + 112) = v14;
  }
  else
  {
    __break(1u);
  }
}

uint64_t WorldPlaneType.rawValue.getter(uint64_t result)
{
  return result;
}

unint64_t sub_22F20E3E0@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = _s17MeasureFoundation14WorldPlaneTypeO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_22F20E40C()
{
  return sub_22F223C78();
}

uint64_t sub_22F20E45C()
{
  uint64_t result = 0x74694B7261;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6465727265666E69;
      break;
    case 2:
      uint64_t result = 0x6B6361626C6C6166;
      break;
    case 3:
      uint64_t result = 0x6C61636F6CLL;
      break;
    case 4:
      uint64_t result = 0x73756F6976657270;
      break;
    case 5:
      uint64_t result = 0x6863746170;
      break;
    case 6:
      uint64_t result = 0x706544656C707061;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t property wrapper backing initializer of WorldPlane.anchor(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695518);
  uint64_t v2 = swift_allocObject();
  id v3 = a1;
  long long v4 = (_DWORD *)swift_slowAlloc();
  *long long v4 = 0;

  *(void *)(v2 + 16) = v3;
  *(void *)(v2 + 24) = v4;
  return v2;
}

uint64_t sub_22F20E59C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 16);
  float32x2_t v5 = *(os_unfair_lock_s **)(v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  id v6 = *(id *)(v4 + 16);
  os_unfair_lock_unlock(v5);
  uint64_t result = swift_release();
  *a2 = v6;
  return result;
}

id WorldPlane.anchor.getter()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(os_unfair_lock_s **)(v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v2);
  swift_beginAccess();
  id v3 = *(id *)(v1 + 16);
  os_unfair_lock_unlock(v2);
  swift_release();
  return v3;
}

void sub_22F20E6BC(void *a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(os_unfair_lock_s **)(v3 + 24);
  swift_retain();
  id v5 = a1;
  os_unfair_lock_lock(v4);
  swift_beginAccess();
  id v6 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v5;
  id v7 = v5;

  os_unfair_lock_unlock(v4);
  swift_release();
}

uint64_t WorldPlane.hash(into:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22F223848();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  id v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  uint64_t v6 = *(void *)(v1 + 16);
  id v7 = *(os_unfair_lock_s **)(v6 + 24);
  swift_retain();
  os_unfair_lock_lock(v7);
  swift_beginAccess();
  id v8 = *(id *)(v6 + 16);
  os_unfair_lock_unlock(v7);
  swift_release();
  id v9 = objc_msgSend(v8, sel_identifier);

  sub_22F223828();
  sub_22F210D58((unint64_t *)&qword_268694C50, 255, MEMORY[0x263F07508]);
  sub_22F2239F8();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_22F2247F8();
}

uint64_t WorldPlane.type.getter()
{
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t WorldPlane.label.getter()
{
  if (qword_2686944A0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(os_unfair_lock_s **)(v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v2);
  swift_beginAccess();
  id v3 = *(id *)(v1 + 16);
  os_unfair_lock_unlock(v2);
  swift_release();
  uint64_t v4 = sub_22F1E0634(v3);

  return v4;
}

float WorldPlane.confidence.getter()
{
  switch(*(unsigned char *)(v0 + 48))
  {
    case 1:
      if (qword_2686944A0 != -1) {
        swift_once();
      }
      swift_beginAccess();
      uint64_t v4 = *(void *)(v0 + 16);
      id v5 = *(os_unfair_lock_s **)(v4 + 24);
      swift_retain();
      os_unfair_lock_lock(v5);
      swift_beginAccess();
      id v6 = *(id *)(v4 + 16);
      os_unfair_lock_unlock(v5);
      swift_release();
      float v1 = sub_22F1E07B8(v6);

      return v1 * *(float *)(v0 + 56);
    case 2:
      float v2 = *(float *)(v0 + 52);
      float v7 = 1.0 - v2;
      float v8 = 0.8;
      goto LABEL_9;
    case 3:
    case 5:
    case 6:
      float v1 = 1.0 - *(float *)(v0 + 52);
      return v1 * *(float *)(v0 + 56);
    case 4:
      float v2 = *(float *)(v0 + 52);
      float v7 = 1.0 - v2;
      float v8 = 0.9;
LABEL_9:
      float v3 = v7 * v8;
      goto LABEL_10;
    default:
      float v2 = *(float *)(v0 + 52);
      float v3 = 1.0 - v2;
LABEL_10:
      if (v2 == 0.0) {
        float v1 = 0.0;
      }
      else {
        float v1 = v3;
      }
      return v1 * *(float *)(v0 + 56);
  }
}

Swift::Float __swiftcall WorldPlane.estimatedErrorAlongNormal(distanceFromObservation:)(Swift::Float distanceFromObservation)
{
  int v3 = *(unsigned __int8 *)(v1 + 48);
  if (v3 == 4 || v3 == 2) {
    LOBYTE(v3) = WorldPlane.baseType.getter();
  }
  Swift::Float result = -1.0;
  switch((char)v3)
  {
    case 2:
    case 4:
      return result;
    case 3:
      float v8 = (float)(*(float *)(v1 + 52) * 3.0) + 1.0;
      float v9 = 0.01;
      goto LABEL_18;
    case 5:
      Swift::Float result = (float)(distanceFromObservation * 0.01) + (float)((float)(*(float *)(v1 + 52) + 1.0) * 0.03);
      break;
    case 6:
      float v8 = *(float *)(v1 + 52);
      float v9 = 0.1;
LABEL_18:
      Swift::Float result = v8 * v9;
      break;
    default:
      unsigned int v6 = objc_msgSend(self, sel_jasperAvailable);
      Swift::Float result = -0.98;
      if (v6) {
        Swift::Float result = 0.04;
      }
      float v7 = 0.02;
      if (!v6) {
        float v7 = -1.0;
      }
      if (v3 != 1) {
        Swift::Float result = v7;
      }
      break;
  }
  return result;
}

uint64_t WorldPlane.baseType.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + 16);
  if (objc_msgSend(self, sel_jasperAvailable))
  {
    swift_beginAccess();
    uint64_t v2 = *v1;
    int v3 = *(os_unfair_lock_s **)(v2 + 24);
    swift_retain();
    os_unfair_lock_lock(v3);
    swift_beginAccess();
    id v4 = *(id *)(v2 + 16);
    os_unfair_lock_unlock(v3);
    swift_release();
    self;
    uint64_t v5 = swift_dynamicCastObjCClass();

    if (!v5)
    {
      unsigned int v6 = *(unsigned __int8 *)(v0 + 48);
      if (v6 == 5) {
        unsigned int v7 = 5;
      }
      else {
        unsigned int v7 = 6;
      }
      BOOL v8 = v6 == 3;
      goto LABEL_10;
    }
    return 0;
  }
  swift_beginAccess();
  uint64_t v9 = *v1;
  long long v10 = *(os_unfair_lock_s **)(v9 + 24);
  swift_retain();
  os_unfair_lock_lock(v10);
  swift_beginAccess();
  id v11 = *(id *)(v9 + 16);
  os_unfair_lock_unlock(v10);
  swift_release();
  self;
  uint64_t v12 = swift_dynamicCastObjCClass();

  if (v12) {
    return 0;
  }
  unsigned int v6 = *(unsigned __int8 *)(v0 + 48);
  BOOL v8 = v6 == 3;
  unsigned int v7 = 5;
LABEL_10:
  if (v8) {
    return v6;
  }
  else {
    return v7;
  }
}

uint64_t WorldPlane.description.getter()
{
  sub_22F2243F8();
  sub_22F223B48();
  WorldPlane.baseType.getter();
  sub_22F223B48();
  swift_bridgeObjectRelease();
  sub_22F223B48();
  sub_22F223B48();
  swift_bridgeObjectRelease();
  sub_22F223B48();
  WorldPlane.confidence.getter();
  sub_22F223E18();
  sub_22F223B48();
  sub_22F223E18();
  sub_22F223B48();
  if (qword_2686944A0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(os_unfair_lock_s **)(v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v2);
  swift_beginAccess();
  id v3 = *(id *)(v1 + 16);
  os_unfair_lock_unlock(v2);
  swift_release();
  sub_22F1E0634(v3);

  sub_22F224508();
  sub_22F223B48();
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = *(os_unfair_lock_s **)(v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  id v6 = *(id *)(v4 + 16);
  os_unfair_lock_unlock(v5);
  swift_release();
  sub_22F1E07B8(v6);

  sub_22F223E18();
  sub_22F223B48();
  return 0;
}

uint64_t WorldPlane.init(anchor:type:uncertainty:confidenceMultiplier:)(void *a1, char a2, float a3, float a4)
{
  uint64_t v5 = sub_22F210A98(a1, a2, a3, a4);

  return v5;
}

Swift::Void __swiftcall WorldPlane.resetConfidence()()
{
  *(_DWORD *)(v0 + 52) = 0;
}

uint64_t WorldPlane.similar(to:)(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(os_unfair_lock_s **)(v3 + 24);
  swift_retain();
  os_unfair_lock_lock(v4);
  swift_beginAccess();
  id v5 = *(id *)(v3 + 16);
  os_unfair_lock_unlock(v4);
  swift_release();
  swift_beginAccess();
  uint64_t v6 = *(void *)(a1 + 16);
  unsigned int v7 = *(os_unfair_lock_s **)(v6 + 24);
  swift_retain();
  os_unfair_lock_lock(v7);
  swift_beginAccess();
  id v8 = *(id *)(v6 + 16);
  os_unfair_lock_unlock(v7);
  swift_release();
  objc_msgSend(v5, sel_transform);
  float32x4_t v21 = v9;
  objc_msgSend(v8, sel_transform);
  float32x4_t v11 = vmulq_f32(v21, v10);
  if ((float)(v11.f32[2] + vaddv_f32(*(float32x2_t *)v11.f32)) <= 0.996)
  {
  }
  else
  {
    objc_msgSend(v5, sel_transform);
    float32x4_t v22 = v12;
    objc_msgSend(v5, sel_transform);
    float32x4_t v14 = vmulq_f32(v22, v13);
    float v15 = v14.f32[2] + vaddv_f32(*(float32x2_t *)v14.f32);
    objc_msgSend(v8, sel_transform);
    float32x4_t v23 = v16;
    objc_msgSend(v8, sel_transform);
    float32x4_t v20 = v17;

    float32x4_t v18 = vmulq_f32(v23, v20);
    if (vabds_f32(v15, v18.f32[2] + vaddv_f32(*(float32x2_t *)v18.f32)) < 0.025) {
      return 1;
    }
  }
  return 0;
}

unint64_t WorldPlane.distanceToEdge(point:)(float32x4_t a1)
{
  swift_beginAccess();
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(os_unfair_lock_s **)(v2 + 24);
  swift_retain();
  os_unfair_lock_lock(v3);
  swift_beginAccess();
  id v4 = *(id *)(v2 + 16);
  os_unfair_lock_unlock(v3);
  swift_release();
  self;
  id v5 = (void *)swift_dynamicCastObjCClass();
  uint64_t v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, sel_transform);
    simd_float4x4 v26 = __invert_f4(v25);
    *(float32x2_t *)&long long v7 = simd_float4x4.apply(to:)(a1, *(float32x2_t *)v26.columns[0].f32, *(float32x2_t *)v26.columns[1].f32, *(float32x2_t *)v26.columns[2].f32, *(float32x2_t *)v26.columns[3].f32);
    *(_OWORD *)float32x4_t v23 = v7;
    id v8 = objc_msgSend(v6, sel_geometry);
    uint64_t v9 = sub_22F2240E8();

    int64_t v10 = *(void *)(v9 + 16);
    if (v10)
    {
      uint64_t v24 = MEMORY[0x263F8EE78];
      sub_22F18FD48(0, v10, 0);
      uint64_t v11 = 0;
      uint64_t v12 = v24;
      unint64_t v13 = *(void *)(v24 + 16);
      do
      {
        float32x4_t v14 = (const float *)(v9 + 16 * v11 + 32);
        float32x2_t v15 = (float32x2_t)*(_OWORD *)vld2_f32(v14).val;
        unint64_t v16 = *(void *)(v24 + 24);
        if (v13 >= v16 >> 1) {
          sub_22F18FD48((char *)(v16 > 1), v13 + 1, 1);
        }
        ++v11;
        *(void *)(v24 + 16) = v13 + 1;
        *(float64x2_t *)(v24 + 16 * v13++ + 32) = vcvtq_f64_f32(v15);
      }
      while (v10 != v11);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v12 = MEMORY[0x263F8EE78];
    }
    _s17MeasureFoundation6CVUtilC14signedDistance5point7contour12CoreGraphics7CGFloatVSo7CGPointV_SayAKGtFZ_0(v12, v23[0], v23[2]);
    double v19 = v18;

    swift_bridgeObjectRelease();
    float v20 = v19;
    uint64_t v17 = LODWORD(v20) ^ 0x80000000;
  }
  else
  {

    uint64_t v17 = 0;
  }
  return v17 | ((unint64_t)(v6 == 0) << 32);
}

unint64_t WorldPlane.distanceToEdge(normalizedPoint:frame:)(void *a1)
{
  id v1 = objc_msgSend(a1, sel_camera);
  memset(v16, 0, sizeof(v16));
  LOBYTE(v2) = 1;
  char v17 = 1;
  __n128 v3 = _sSo7ARFrameC17MeasureFoundationE9getHitRay11cameraPoint0G00G18CorrectedTransforms5SIMD3VySfG6origin_AJ9directionts5SIMD2VySfG_So8ARCameraCSo13simd_float4x4aSgtFZ_0(v1, (uint64_t)v16);
  float32x4_t v10 = v4;
  float32x4_t v11 = (float32x4_t)v3;

  WorldPlane.hitTest(hitRay:withPlaneType:)(7, (uint64_t)v12, v11, v10);
  sub_22F1899D0((uint64_t)v12, (uint64_t)v13, &qword_268695508);
  uint64_t v5 = v15;
  if (v15)
  {
    float32x4_t v6 = v14;
    v6.i32[3] = 0;
    unint64_t v7 = WorldPlane.distanceToEdge(point:)(v6);
    unsigned int v8 = v7;
    uint64_t v2 = HIDWORD(v7) & 1;
    sub_22F1CEA38((uint64_t)v12);
    uint64_t v5 = v8;
  }
  return v5 | ((unint64_t)v2 << 32);
}

uint64_t WorldPlane.refresh(anchor:camera:uncertaintyPoint:)(void *a1, uint64_t a2, float32x4_t a3)
{
  float32x4_t v54 = a3;
  v55.i64[0] = a2;
  sub_22F1899D0(a2, (uint64_t)v57, &qword_2686948E0);
  uint64_t v50 = v58;
  *(void *)&long long v52 = v59;
  uint64_t v51 = v60;
  uint64_t v53 = v61;
  uint64_t v5 = sub_22F223848();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  float32x4_t v11 = (char *)&v50 - v10;
  uint64_t v12 = (uint64_t *)(v3 + 16);
  swift_beginAccess();
  uint64_t v56 = v3;
  uint64_t v13 = *(void *)(v3 + 16);
  float32x4_t v14 = *(os_unfair_lock_s **)(v13 + 24);
  swift_retain();
  os_unfair_lock_lock(v14);
  swift_beginAccess();
  id v15 = *(id *)(v13 + 16);
  os_unfair_lock_unlock(v14);
  swift_release();
  id v16 = objc_msgSend(v15, sel_identifier);

  char v17 = a1;
  sub_22F223828();

  id v18 = objc_msgSend(a1, sel_identifier);
  sub_22F223828();

  LOBYTE(v18) = sub_22F223818();
  double v19 = *(void (**)(char *, uint64_t))(v6 + 8);
  v19(v9, v5);
  v19(v11, v5);
  if ((v18 & 1) == 0) {
    return 0;
  }
  self;
  uint64_t v20 = swift_dynamicCastObjCClass();
  if (!v20)
  {
    uint64_t v25 = *v12;
    simd_float4x4 v26 = *(os_unfair_lock_s **)(*v12 + 24);
    id v27 = a1;
    swift_retain();
    os_unfair_lock_lock(v26);
    swift_beginAccess();
    uint64_t v28 = *(void **)(v25 + 16);
    *(void *)(v25 + 16) = v27;
    id v29 = v27;

    os_unfair_lock_unlock(v26);
    swift_release();

    return 0;
  }
  float32x4_t v21 = (void *)v20;
  uint64_t v22 = v56;
  float v23 = *(float *)(v56 + 52);
  if (v23 != 0.0)
  {
    sub_22F1899D0(v55.i64[0], (uint64_t)v62, &qword_2686948E0);
    if ((v65 & 1) == 0)
    {
      *(void *)&long long v31 = v50;
      *((void *)&v31 + 1) = v52;
      long long v52 = v31;
      v24.i64[0] = v51;
      v24.i64[1] = v53;
      goto LABEL_10;
    }
LABEL_8:
    id v30 = a1;
    goto LABEL_11;
  }
  sub_22F1899D0(v55.i64[0], (uint64_t)v62, &qword_2686948E0);
  if (v65) {
    goto LABEL_8;
  }
  long long v52 = v63;
  float32x4_t v24 = v64;
LABEL_10:
  float32x4_t v55 = v24;
  id v32 = a1;
  if (v23 != 0.0)
  {
    objc_super v41 = v32;
    float32x4_t v42 = vsubq_f32(v54, v55);
    int32x4_t v43 = (int32x4_t)vmulq_f32(v42, v42);
    if (sqrtf(*(float *)&v43.i32[2] + (float)(*(float *)v43.i32 + vmuls_lane_f32(v42.f32[1], *(float32x2_t *)v42.f32, 1))) >= 2.0|| (unsigned __int32 v44 = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v43, 2), vadd_f32(*(float32x2_t *)v43.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v43.i8, 1))).u32[0], v45 = vrsqrte_f32((float32x2_t)v44), v46 = vmul_f32(v45, vrsqrts_f32((float32x2_t)v44, vmul_f32(v45, v45))), v47 = vmulq_n_f32(v42, vmul_f32(v46, vrsqrts_f32((float32x2_t)v44, vmul_f32(v46, v46))).f32[0]), (float)(vmuls_lane_f32(0.0 - *((float *)&v52 + 2), v47, 2)+ (float)((float)((float)(0.0 - *(float *)&v52) * v47.f32[0])+ vmuls_lane_f32(0.0 - *((float *)&v52 + 1), *(float32x2_t *)v47.f32, 1))) <= 0.866)|| (objc_msgSend(v21, sel_uncertaintyAlongNormal), v48 >= *(float *)(v22 + 52)))
    {

      return 0;
    }
  }
LABEL_11:
  uint64_t v33 = *(void *)(v22 + 16);
  unint64_t v34 = *(os_unfair_lock_s **)(v33 + 24);
  id v35 = v17;
  swift_retain();
  os_unfair_lock_lock(v34);
  uint64_t v36 = 1;
  swift_beginAccess();
  uint64_t v37 = *(void **)(v33 + 16);
  *(void *)(v33 + 16) = v35;
  id v38 = v35;

  os_unfair_lock_unlock(v34);
  swift_release();

  objc_msgSend(v21, sel_uncertaintyAlongNormal);
  int v40 = v39;

  *(_DWORD *)(v22 + 52) = v40;
  return v36;
}

uint64_t WorldPlane.hitTest(normalizedPoint:frame:withPlaneType:)@<X0>(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  id v5 = objc_msgSend(a1, sel_camera);
  memset(v12, 0, sizeof(v12));
  char v13 = 1;
  __n128 v6 = _sSo7ARFrameC17MeasureFoundationE9getHitRay11cameraPoint0G00G18CorrectedTransforms5SIMD3VySfG6origin_AJ9directionts5SIMD2VySfG_So8ARCameraCSo13simd_float4x4aSgtFZ_0(v5, (uint64_t)v12);
  float32x4_t v9 = v7;
  float32x4_t v10 = (float32x4_t)v6;

  WorldPlane.hitTest(hitRay:withPlaneType:)(a2, (uint64_t)v11, v10, v9);
  return sub_22F1899D0((uint64_t)v11, a3, &qword_268695508);
}

void WorldPlane.hitTest(hitRay:withPlaneType:)(char a1@<W0>, uint64_t a2@<X8>, float32x4_t a3@<Q0>, float32x4_t a4@<Q1>)
{
  uint64_t v5 = v4;
  swift_beginAccess();
  uint64_t v8 = *(void *)(v5 + 16);
  float32x4_t v9 = *(os_unfair_lock_s **)(v8 + 24);
  swift_retain();
  os_unfair_lock_lock(v9);
  swift_beginAccess();
  id v10 = *(id *)(v8 + 16);
  os_unfair_lock_unlock(v9);
  swift_release();
  self;
  uint64_t v11 = swift_dynamicCastObjCClass();
  if (!v11)
  {
    if (WorldPlane.baseType.getter() == 3)
    {
      if (qword_2686944A0 != -1) {
        swift_once();
      }
      sub_22F1DCBB0((uint64_t)&v73, a3, a4);
      uint64_t v23 = *(void *)v74;
      int8x16_t v67 = *(int8x16_t *)&v74[8];
      long long v71 = v73;
      int8x16_t v60 = *(int8x16_t *)&v74[40];
      int8x16_t v62 = *(int8x16_t *)&v74[24];
      long long v56 = v75;
      int64x2_t v58 = *(int64x2_t *)&v74[56];
      uint64_t v5 = v76;
      int v22 = v77;

      long long v29 = v56;
      int64x2_t v27 = v58;
      int8x16_t v26 = v60;
      int8x16_t v25 = v62;
      int8x16_t v24 = v67;
      long long v28 = v71;
      goto LABEL_14;
    }
    if (WorldPlane.baseType.getter() == 5)
    {
      objc_msgSend(v10, sel_transform);
      v30.i32[3] = 0;
      float32x4_t v63 = v30;
      objc_msgSend(v10, sel_transform);
      float32x4_t v32 = v31;
      v32.i32[3] = 0;
      float32x4_t v33 = a4;
      float32x4_t v72 = v32;
      sub_22F1D2EA0(a3, v33, v63, v32);
      if (v35) {
        goto LABEL_13;
      }
      _sSo13simd_float4x4a17MeasureFoundationE4make8position17normalizedForwardABs5SIMD3VySfG_AItFZ_0(v34, v72);
      sceneKitToARKit(_:)(v37, v36);
      int8x16_t v57 = v38;
      int8x16_t v59 = v39;
      int8x16_t v61 = v40;
      int64x2_t v66 = v41;
      long long v70 = xmmword_22F228C60;
      long long v73 = xmmword_22F228C60;
      *(int8x16_t *)float32x2_t v74 = v38;
      *(int8x16_t *)&v74[16] = v40;
      *(int8x16_t *)&v74[32] = v39;
      *(int64x2_t *)&v74[48] = v41;
    }
    else
    {
      if (!objc_msgSend(self, sel_jasperAvailable)) {
        goto LABEL_13;
      }
      if (WorldPlane.baseType.getter() != 6) {
        goto LABEL_13;
      }
      objc_msgSend(v10, sel_transform);
      v42.i32[3] = 0;
      float32x4_t v64 = v42;
      objc_msgSend(v10, sel_transform);
      float32x4_t v44 = v43;
      v44.i32[3] = 0;
      sub_22F1D2EA0(a3, a4, v64, v44);
      if (v47) {
        goto LABEL_13;
      }
      __int32 v48 = v45;
      v49.i64[0] = v45;
      v49.i64[1] = v46;
      int64x2_t v68 = v49;
      objc_msgSend(v10, sel_transform);
      int8x16_t v57 = v50;
      int8x16_t v59 = v51;
      int64x2_t v52 = v68;
      v52.i32[0] = v48;
      v52.i32[3] = v53;
      int8x16_t v61 = v54;
      int64x2_t v66 = v52;
      long long v70 = xmmword_22F228C60;
      long long v73 = xmmword_22F228C60;
      *(int8x16_t *)float32x2_t v74 = v50;
      *(int8x16_t *)&v74[16] = v54;
      *(int8x16_t *)&v74[32] = v51;
      *(int64x2_t *)&v74[48] = v52;
    }
    *(void *)&v74[64] = 0;
    *(void *)&long long v75 = 0;
    BYTE8(v75) = 1;
    uint64_t v76 = v5;
    int v77 = 0;
    swift_retain();
    sub_22F2105E8();
    int v22 = v55;

LABEL_7:
    uint64_t v23 = v57.i64[0];
    int8x16_t v24 = vextq_s8(v57, v61, 8uLL);
    int8x16_t v25 = vextq_s8(v61, v59, 8uLL);
    int8x16_t v26 = vextq_s8(v59, (int8x16_t)v66, 8uLL);
    int64x2_t v27 = vzip2q_s64(v66, (int64x2_t)0);
    long long v28 = v70;
    long long v29 = xmmword_22F22ADF0;
LABEL_14:
    *(_OWORD *)a2 = v28;
    *(void *)(a2 + 16) = v23;
    *(int8x16_t *)(a2 + 24) = v24;
    *(int8x16_t *)(a2 + 40) = v25;
    *(int8x16_t *)(a2 + 56) = v26;
    *(int64x2_t *)(a2 + 72) = v27;
    *(_OWORD *)(a2 + 88) = v29;
    *(void *)(a2 + 104) = v5;
    *(_DWORD *)(a2 + 112) = v22;
    return;
  }
  uint64_t v12 = (void *)v11;
  id v10 = v10;
  id v13 = objc_msgSend(v12, sel__hitTestFromOrigin_withDirection_usingExtent_usingGeometry_, 0, 0, *(double *)a3.i64, *(double *)a4.i64);
  if (!v13)
  {

LABEL_13:
    uint64_t v23 = 0;
    uint64_t v5 = 0;
    long long v28 = 0uLL;
    int v22 = 0;
    int8x16_t v24 = 0uLL;
    int8x16_t v25 = 0uLL;
    int8x16_t v26 = 0uLL;
    int64x2_t v27 = 0uLL;
    long long v29 = 0uLL;
    goto LABEL_14;
  }
  float32x4_t v14 = v13;
  id v15 = objc_msgSend(v13, sel_anchor);
  if (v15)
  {
    id v16 = v15;
    if (a1 == 7) {
      a1 = 0;
    }
    type metadata accessor for WorldPlane();
    swift_allocObject();
    uint64_t v5 = sub_22F210A98(v16, a1, 0.0, 1.0);

    objc_msgSend(v14, sel_worldTransform);
    int8x16_t v57 = v17;
    int8x16_t v59 = v18;
    int8x16_t v61 = v19;
    int64x2_t v66 = v20;
    long long v70 = xmmword_22F228C60;
    long long v73 = xmmword_22F228C60;
    *(int8x16_t *)float32x2_t v74 = v17;
    *(int8x16_t *)&v74[16] = v19;
    *(int8x16_t *)&v74[32] = v18;
    *(int64x2_t *)&v74[48] = v20;
    *(void *)&v74[64] = 0;
    *(void *)&long long v75 = 0;
    BYTE8(v75) = 1;
    uint64_t v76 = v5;
    int v77 = 0;
    swift_retain_n();
    sub_22F2105E8();
    int v22 = v21;

    swift_release_n();
    goto LABEL_7;
  }
  __break(1u);
}

uint64_t WorldPlane.deinit()
{
  swift_release();
  return v0;
}

uint64_t WorldPlane.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t WorldPlane.hashValue.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_22F223848();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22F2247E8();
  swift_beginAccess();
  uint64_t v6 = *(void *)(v1 + 16);
  float32x4_t v7 = *(os_unfair_lock_s **)(v6 + 24);
  swift_retain();
  os_unfair_lock_lock(v7);
  swift_beginAccess();
  id v8 = *(id *)(v6 + 16);
  os_unfair_lock_unlock(v7);
  swift_release();
  id v9 = objc_msgSend(v8, sel_identifier);

  sub_22F223828();
  sub_22F210D58((unint64_t *)&qword_268694C50, 255, MEMORY[0x263F07508]);
  sub_22F2239F8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_22F2247F8();
  return sub_22F224818();
}

BOOL sub_22F2103F4(uint64_t *a1, uint64_t *a2)
{
  return _s17MeasureFoundation10WorldPlaneC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t sub_22F210400()
{
  return WorldPlane.hashValue.getter();
}

uint64_t sub_22F210424()
{
  return WorldPlane.hash(into:)();
}

uint64_t sub_22F210448()
{
  return sub_22F224818();
}

uint64_t sub_22F210488()
{
  return WorldPlane.description.getter();
}

__n128 WorldPlaneHitTestResult.transform.getter()
{
  return v0[1];
}

double WorldPlaneHitTestResult.localPosition.getter()
{
  if (*(unsigned char *)(v0 + 96))
  {
    uint64_t v1 = *(void *)(v0 + 104);
    swift_beginAccess();
    uint64_t v2 = *(void *)(v1 + 16);
    uint64_t v3 = *(os_unfair_lock_s **)(v2 + 24);
    swift_retain();
    os_unfair_lock_lock(v3);
    swift_beginAccess();
    id v4 = *(id *)(v2 + 16);
    os_unfair_lock_unlock(v3);
    swift_release();
    self;
    objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_transform);
    simd_float4 v14 = v6;
    simd_float4 v15 = v5;
    simd_float4 v12 = v8;
    simd_float4 v13 = v7;

    v16.columns[1] = v14;
    v16.columns[0] = v15;
    v16.columns[3] = v12;
    v16.columns[2] = v13;
    simd_float4x4 v17 = __invert_f4(v16);
    float32x2_t v9 = *(float32x2_t *)v17.columns[0].f32;
    v17.columns[0] = *(simd_float4 *)(v0 + 64);
    v17.columns[0].i32[3] = 0;
    *(float32x2_t *)&long long v10 = simd_float4x4.apply(to:)((float32x4_t)v17.columns[0], v9, *(float32x2_t *)v17.columns[1].f32, *(float32x2_t *)v17.columns[2].f32, *(float32x2_t *)v17.columns[3].f32);
    *(_OWORD *)(v0 + 80) = v10;
    *(unsigned char *)(v0 + 96) = 0;
  }
  else
  {
    *(void *)&long long v10 = *(void *)(v0 + 80);
  }
  return *(double *)&v10;
}

uint64_t WorldPlaneHitTestResult.plane.getter()
{
  return swift_retain();
}

float WorldPlaneHitTestResult.confidence.getter()
{
  return *(float *)(v0 + 112);
}

void sub_22F2105E8()
{
  switch(*(unsigned char *)(v0[6].i64[1] + 48))
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      goto LABEL_3;
    default:
      float32x4_t v1 = v0[4];
      v1.i32[3] = 0;
      if ((WorldPlane.distanceToEdge(point:)(v1) & 0x100000000) == 0) {
LABEL_3:
      }
        WorldPlane.confidence.getter();
      return;
  }
}

uint64_t WorldPlaneContext.MeasureType.hash(into:)()
{
  return sub_22F2247F8();
}

uint64_t WorldPlaneContext.MeasureType.hashValue.getter()
{
  return sub_22F224818();
}

uint64_t WorldPlaneContext.measureType.getter()
{
  return *v0;
}

uint64_t WorldPlaneContext.isFirstPoint.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t WorldPlaneContext.isFirstPoint.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*WorldPlaneContext.isFirstPoint.modify())()
{
  return nullsub_1;
}

uint64_t WorldPlaneContext.isMovingPoint.getter()
{
  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t WorldPlaneContext.isMovingPoint.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 2) = result;
  return result;
}

uint64_t (*WorldPlaneContext.isMovingPoint.modify())()
{
  return nullsub_1;
}

uint64_t WorldPlaneContext.lastHitTestResult.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22F210BE8(v1 + 16, a1);
}

uint64_t WorldPlaneContext.lastHitTestResult.setter(uint64_t a1)
{
  return sub_22F210C50(a1, v1 + 16);
}

uint64_t (*WorldPlaneContext.lastHitTestResult.modify())()
{
  return nullsub_1;
}

uint64_t WorldPlaneContext.fallbackPlane.getter()
{
  return swift_retain();
}

uint64_t WorldPlaneContext.fallbackPlane.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 136) = a1;
  return result;
}

uint64_t (*WorldPlaneContext.fallbackPlane.modify())()
{
  return nullsub_1;
}

double WorldPlaneContext.init(measureType:)@<D0>(char a1@<W0>, uint64_t a2@<X8>)
{
  *(unsigned char *)a2 = a1 & 1;
  *(_WORD *)(a2 + 1) = 0;
  *(void *)(a2 + 136) = 0;
  double result = 0.0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_DWORD *)(a2 + 128) = 0;
  return result;
}

BOOL _s17MeasureFoundation10WorldPlaneC2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22F223848();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  simd_float4 v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  long long v10 = &v21[-v9];
  swift_beginAccess();
  uint64_t v11 = *(void *)(a1 + 16);
  simd_float4 v12 = *(os_unfair_lock_s **)(v11 + 24);
  swift_retain();
  os_unfair_lock_lock(v12);
  swift_beginAccess();
  id v13 = *(id *)(v11 + 16);
  os_unfair_lock_unlock(v12);
  swift_release();
  id v14 = objc_msgSend(v13, sel_identifier);

  sub_22F223828();
  swift_beginAccess();
  uint64_t v15 = *(void *)(a2 + 16);
  simd_float4x4 v16 = *(os_unfair_lock_s **)(v15 + 24);
  swift_retain();
  os_unfair_lock_lock(v16);
  swift_beginAccess();
  id v17 = *(id *)(v15 + 16);
  os_unfair_lock_unlock(v16);
  swift_release();
  id v18 = objc_msgSend(v17, sel_identifier);

  sub_22F223828();
  LOBYTE(v18) = sub_22F223818();
  int8x16_t v19 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
  v19(v8, v4);
  v19(v10, v4);
  return (v18 & 1) != 0 && *(unsigned __int8 *)(a1 + 48) == *(unsigned __int8 *)(a2 + 48);
}

uint64_t sub_22F210A98(void *a1, char a2, float a3, float a4)
{
  *(_OWORD *)(v4 + 24) = xmmword_22F228C70;
  *(void *)(v4 + 40) = 0x3F5DB22D40000000;
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695518);
  uint64_t v9 = swift_allocObject();
  id v10 = a1;
  uint64_t v11 = (_DWORD *)swift_slowAlloc();
  _DWORD *v11 = 0;
  *(void *)(v9 + 16) = v10;
  *(void *)(v9 + 24) = v11;
  *(void *)(v4 + 16) = v9;
  swift_endAccess();
  *(unsigned char *)(v4 + 48) = a2;
  *(float *)(v4 + 52) = a3;
  *(float *)(v4 + 56) = a4;
  memset(v13, 0, sizeof(v13));
  char v14 = 1;
  if (qword_2686943C0 != -1) {
    swift_once();
  }
  WorldPlane.refresh(anchor:camera:uncertaintyPoint:)(v10, (uint64_t)v13, (float32x4_t)static SIMD3<>.zero);
  return v4;
}

uint64_t type metadata accessor for WorldPlane()
{
  return self;
}

unint64_t _s17MeasureFoundation14WorldPlaneTypeO8rawValueACSgSi_tcfC_0(unint64_t result)
{
  if (result >= 7) {
    return 7;
  }
  return result;
}

uint64_t sub_22F210BE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268695508);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22F210C50(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268695508);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_22F210CBC()
{
  unint64_t result = qword_268695E30;
  if (!qword_268695E30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695E30);
  }
  return result;
}

uint64_t sub_22F210D10(uint64_t a1, uint64_t a2)
{
  return sub_22F210D58(&qword_268695E38, a2, (void (*)(uint64_t))type metadata accessor for WorldPlane);
}

uint64_t sub_22F210D58(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22F210DA4()
{
  unint64_t result = qword_268695E40;
  if (!qword_268695E40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695E40);
  }
  return result;
}

void sub_22F210DFC(id *a1)
{
}

uint64_t getEnumTagSinglePayload for WorldPlaneType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for WorldPlaneType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *unint64_t result = a2 + 6;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22F210F84);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorldPlaneType()
{
  return &type metadata for WorldPlaneType;
}

uint64_t destroy for WorldPlaneHitTestResult()
{
  return swift_release();
}

uint64_t initializeWithCopy for WorldPlaneHitTestResult(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for WorldPlaneHitTestResult(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  long long v4 = *(_OWORD *)(a2 + 80);
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = v4;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_retain();
  swift_release();
  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  return a1;
}

__n128 __swift_memcpy116_16(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(_DWORD *)(a1 + 112) = *((_DWORD *)a2 + 28);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for WorldPlaneHitTestResult(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  long long v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  *(unsigned char *)(a1 + 96) = *(unsigned char *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_release();
  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorldPlaneHitTestResult(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 116)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 104);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WorldPlaneHitTestResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 112) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 116) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 104) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 116) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorldPlaneHitTestResult()
{
  return &type metadata for WorldPlaneHitTestResult;
}

uint64_t destroy for WorldPlaneContext()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for WorldPlaneContext(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  long long v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(_DWORD *)(a1 + 128) = *(_DWORD *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for WorldPlaneContext(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  long long v4 = *(_OWORD *)(a2 + 96);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = v4;
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_retain();
  swift_release();
  *(_DWORD *)(a1 + 128) = *(_DWORD *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy144_16(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(__n128 *)(a1 + 80) = result;
  *(_OWORD *)(a1 + 96) = v6;
  return result;
}

uint64_t assignWithTake for WorldPlaneContext(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  long long v6 = *(_OWORD *)(a2 + 80);
  long long v7 = *(_OWORD *)(a2 + 96);
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_release();
  *(_DWORD *)(a1 + 128) = *(_DWORD *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for WorldPlaneContext(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 144)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 120);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WorldPlaneContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 144) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 144) = 0;
    }
    if (a2) {
      *(void *)(result + 120) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorldPlaneContext()
{
  return &type metadata for WorldPlaneContext;
}

unsigned char *storeEnumTagSinglePayload for WorldPlaneContext.MeasureType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22F2115E8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorldPlaneContext.MeasureType()
{
  return &type metadata for WorldPlaneContext.MeasureType;
}

unint64_t sub_22F211620()
{
  unint64_t result = qword_268695E48;
  if (!qword_268695E48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695E48);
  }
  return result;
}

id WorldPoint.__allocating_init(anchor:type:state:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return WorldPoint.init(anchor:type:state:)(a1, a2, a3);
}

double WorldPoint.resultRepresentation.getter@<D0>(uint64_t a1@<X8>)
{
  sub_22F214000((char *)v1, v6);
  __n128 v3 = v6[3];
  *(__n128 *)(a1 + 32) = v6[2];
  *(__n128 *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v7[0];
  *(_OWORD *)(a1 + 77) = *(_OWORD *)((char *)v7 + 13);
  double result = v6[0].n128_f64[0];
  __n128 v5 = v6[1];
  *(__n128 *)a1 = v6[0];
  *(__n128 *)(a1 + 16) = v5;
  return result;
}

uint64_t *WorldPointType.default.unsafeMutableAddressor()
{
  return &static WorldPointType.default;
}

uint64_t static WorldPointType.default.getter()
{
  return static WorldPointType.default;
}

uint64_t static WorldPointType.default.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  static WorldPointType.default = a1;
  return result;
}

uint64_t (*static WorldPointType.default.modify())()
{
  return j_j__swift_endAccess;
}

Swift::Bool __swiftcall WorldPointType.isSnap()()
{
  return (v0 < 9) & (0x1E9u >> v0);
}

uint64_t WorldPointType.isSnappable.getter(unint64_t a1)
{
  return (a1 < 9) & (0x1EEu >> a1);
}

Swift::Bool __swiftcall WorldPointType.isUserObjectSnap()()
{
  return v0 < 3;
}

uint64_t WorldPointType.isSnappedOnGuide.getter(unint64_t a1)
{
  return (a1 < 9) & (0x160u >> a1);
}

unint64_t WorldPointType.description.getter(uint64_t a1)
{
  unint64_t result = 1885433459;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      unint64_t result = 0x726F6A616DLL;
      break;
    case 2:
      unint64_t result = 0x726F6E696DLL;
      break;
    case 3:
      unint64_t result = 0x6E726F4370616E73;
      break;
    case 4:
      unint64_t result = 0x6567644570616E73;
      break;
    case 5:
      unint64_t result = 0x6469754770616E73;
      break;
    case 6:
      unint64_t result = 0xD000000000000011;
      break;
    case 7:
      unint64_t result = 0x6976694470616E73;
      break;
    case 8:
      unint64_t result = 0xD000000000000010;
      break;
    default:
      sub_22F224768();
      __break(1u);
      JUMPOUT(0x22F21199CLL);
  }
  return result;
}

unint64_t WorldPointType.init(rawValue:)(unint64_t a1)
{
  return sub_22F2144B4(a1);
}

unint64_t sub_22F2119E0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_22F2144B4(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t WorldPoint.lines.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_22F211B54(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  __n128 v3 = (void *)(*a2 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_lines);
  swift_beginAccess();
  *__n128 v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_22F211BC0(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  __n128 v3 = (void **)(*a2 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_parentLine);
  swift_beginAccess();
  char v4 = *v3;
  *__n128 v3 = v2;
  id v5 = v2;
}

void *WorldPoint.parentLine.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_parentLine);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void *WorldPoint.snapLine.getter()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_snapLine);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void WorldPoint.snapLine.setter(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_snapLine);
  swift_beginAccess();
  char v4 = *v3;
  *id v3 = a1;
}

uint64_t (*WorldPoint.snapLine.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_22F211D74(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  char v4 = (void *)(*a2 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_partOfRectangleId);
  swift_beginAccess();
  *char v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t WorldPoint.partOfRectangleId.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_partOfRectangleId);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t WorldPoint.delegate.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t WorldPoint.delegate.setter(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)(v2 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_delegate);
  swift_beginAccess();
  void *v5 = a1;
  v5[1] = a2;
  return swift_unknownObjectRelease();
}

void (*WorldPoint.delegate.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = (char *)malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_delegate;
  *((void *)v3 + 5) = v1;
  *((void *)v3 + 6) = v4;
  id v5 = (_OWORD *)(v1 + v4);
  swift_beginAccess();
  *(_OWORD *)(v3 + 24) = *v5;
  swift_unknownObjectRetain();
  return sub_22F211F74;
}

void sub_22F211F74(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  *(_OWORD *)(*(void *)(*(void *)a1 + 40) + *(void *)(*(void *)a1 + 48)) = *(_OWORD *)(*(void *)a1 + 24);
  if (a2)
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRelease();
  free(v2);
}

__n128 WorldPoint.transform.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = *(os_unfair_lock_s **)(v2 + 24);
  swift_retain();
  os_unfair_lock_lock(v3);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 + 16);
  swift_retain();
  os_unfair_lock_unlock(v3);
  swift_release();
  long long v6 = *(_OWORD *)(v4 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
  swift_release();
  return (__n128)v6;
}

char *WorldPoint.connectedEndpoint.getter()
{
  uint64_t v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_lines);
  swift_beginAccess();
  uint64_t v3 = *v2;
  if (!((unint64_t)*v2 >> 62))
  {
    uint64_t v4 = *(char **)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = (char *)sub_22F2245C8();
  if (!v4) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v3 & 0xC000000000000001) != 0)
  {
    id v5 = (char *)MEMORY[0x230FB2E90](0, v3);
  }
  else
  {
    if (!*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_14:
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_22F2245C8();
      unint64_t result = (char *)swift_bridgeObjectRelease();
      if (v8 < 2) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
    id v5 = (char *)*(id *)(v3 + 32);
  }
  uint64_t v4 = v5;
  swift_bridgeObjectRelease();
  uint64_t v1 = &v4[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends];
  unint64_t result = (char *)swift_beginAccess();
  if (*(void *)v1 >> 62) {
    goto LABEL_14;
  }
  if (*(uint64_t *)((*(void *)v1 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2)
  {
LABEL_8:

    return 0;
  }
LABEL_15:
  uint64_t v9 = *(void *)v1;
  if ((*(void *)v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v10 = (char *)MEMORY[0x230FB2E90](0, v9);
    unint64_t result = (char *)swift_bridgeObjectRelease();
    uint64_t v9 = *(void *)v1;
    if ((*(void *)v1 & 0xC000000000000001) == 0) {
      goto LABEL_18;
    }
LABEL_36:
    swift_bridgeObjectRetain();
    id v7 = (char *)MEMORY[0x230FB2E90](1, v9);
    swift_bridgeObjectRelease();
LABEL_20:
    uint64_t v11 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject_id);
    swift_beginAccess();
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    char v14 = &v10[OBJC_IVAR____TtC17MeasureFoundation13MeasureObject_id];
    swift_beginAccess();
    BOOL v15 = *(void *)v14 == v12 && *((void *)v14 + 1) == v13;
    if (v15 || (sub_22F224738() & 1) != 0)
    {

      return v7;
    }
    simd_float4x4 v16 = &v7[OBJC_IVAR____TtC17MeasureFoundation13MeasureObject_id];
    swift_beginAccess();
    if (*(void *)v16 == v12 && *((void *)v16 + 1) == v13)
    {
    }
    else
    {
      char v18 = sub_22F224738();

      if ((v18 & 1) == 0)
      {

        return 0;
      }
    }
    return v10;
  }
  if (!*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_38;
  }
  unint64_t result = (char *)*(id *)(v9 + 32);
  id v10 = result;
  if ((v9 & 0xC000000000000001) != 0) {
    goto LABEL_36;
  }
LABEL_18:
  if (*(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    id v7 = (char *)*(id *)(v9 + 40);
    goto LABEL_20;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t property wrapper backing initializer of WorldPoint.anchor(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695E80);
  uint64_t v2 = swift_allocObject();
  swift_retain();
  uint64_t v3 = (_DWORD *)swift_slowAlloc();
  *uint64_t v3 = 0;
  swift_release();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return v2;
}

uint64_t WorldPoint.anchor.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = *(os_unfair_lock_s **)(v2 + 24);
  swift_retain();
  os_unfair_lock_lock(v3);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 + 16);
  swift_retain();
  os_unfair_lock_unlock(v3);
  swift_release();
  return v4;
}

uint64_t WorldPoint.anchor.setter(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor);
  swift_beginAccess();
  uint64_t v4 = *v3;
  id v5 = *(os_unfair_lock_s **)(v4 + 24);
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  *(void *)(v4 + 16) = a1;
  swift_retain();
  swift_release();
  os_unfair_lock_unlock(v5);
  swift_release();
  swift_release();
  sub_22F213438();
  return swift_release();
}

void (*WorldPoint.anchor.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x78uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor;
  v3[13] = v1;
  v3[14] = v4;
  id v5 = (uint64_t *)(v1 + v4);
  swift_beginAccess();
  uint64_t v6 = *v5;
  id v7 = *(os_unfair_lock_s **)(v6 + 24);
  swift_retain();
  os_unfair_lock_lock(v7);
  swift_beginAccess();
  uint64_t v8 = *(void *)(v6 + 16);
  swift_retain();
  os_unfair_lock_unlock(v7);
  swift_release();
  v3[12] = v8;
  return sub_22F212628;
}

void sub_22F212628(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 96);
  uint64_t v4 = *(void *)(*(void *)(*(void *)a1 + 104) + *(void *)(*(void *)a1 + 112));
  id v5 = *(os_unfair_lock_s **)(v4 + 24);
  if (a2)
  {
    swift_retain_n();
    swift_retain();
    os_unfair_lock_lock(v5);
    swift_beginAccess();
    *(void *)(v4 + 16) = v3;
    swift_retain();
    swift_release();
    os_unfair_lock_unlock(v5);
    swift_release();
    swift_release();
    sub_22F213438();
    swift_release();
  }
  else
  {
    swift_retain();
    swift_retain();
    os_unfair_lock_lock(v5);
    swift_beginAccess();
    *(void *)(v4 + 16) = v3;
    swift_retain();
    swift_release();
    os_unfair_lock_unlock(v5);
    swift_release();
    swift_release();
    sub_22F213438();
  }
  swift_release();
  free(v2);
}

uint64_t WorldPoint.triangulationAnchor.getter()
{
  return swift_retain();
}

uint64_t WorldPoint.triangulationAnchor.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_triangulationAnchor);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_release();
}

uint64_t (*WorldPoint.triangulationAnchor.modify())()
{
  return j__swift_endAccess;
}

uint64_t property wrapper backing initializer of WorldPoint.type(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695E90);
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = (_DWORD *)swift_slowAlloc();
  *uint64_t v3 = 0;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return v2;
}

uint64_t WorldPoint.type.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__type);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = *(os_unfair_lock_s **)(v2 + 24);
  swift_retain();
  os_unfair_lock_lock(v3);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 + 16);
  os_unfair_lock_unlock(v3);
  swift_release();
  return v4;
}

uint64_t WorldPoint.type.setter(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__type);
  swift_beginAccess();
  uint64_t v4 = *v3;
  id v5 = *(os_unfair_lock_s **)(*v3 + 24);
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  uint64_t v6 = *(void *)(v4 + 16);
  os_unfair_lock_unlock(v5);
  swift_release();
  uint64_t v7 = *v3;
  uint64_t v8 = *(os_unfair_lock_s **)(*v3 + 24);
  swift_retain();
  os_unfair_lock_lock(v8);
  swift_beginAccess();
  *(void *)(v7 + 16) = a1;
  os_unfair_lock_unlock(v8);
  swift_release();
  uint64_t v9 = *v3;
  id v10 = *(os_unfair_lock_s **)(v9 + 24);
  swift_retain();
  os_unfair_lock_lock(v10);
  swift_beginAccess();
  uint64_t v11 = *(void *)(v9 + 16);
  os_unfair_lock_unlock(v10);
  uint64_t result = swift_release();
  if (v6 != v11)
  {
    uint64_t v13 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_delegate);
    uint64_t result = swift_beginAccess();
    if (*v13)
    {
      uint64_t v14 = v13[1];
      uint64_t ObjectType = swift_getObjectType();
      simd_float4x4 v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 8);
      swift_unknownObjectRetain();
      v16(v1, ObjectType, v14);
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

void (*WorldPoint.type.modify(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[7] = v1;
  uint64_t v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__type);
  swift_beginAccess();
  uint64_t v5 = *v4;
  uint64_t v6 = *(os_unfair_lock_s **)(v5 + 24);
  swift_retain();
  os_unfair_lock_lock(v6);
  swift_beginAccess();
  uint64_t v7 = *(void *)(v5 + 16);
  os_unfair_lock_unlock(v6);
  swift_release();
  v3[6] = v7;
  return sub_22F212C9C;
}

void sub_22F212C9C(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  WorldPoint.type.setter(*(void *)(*(void *)a1 + 48));
  free(v1);
}

uint64_t WorldPoint.state.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state);
  uint64_t v2 = *(os_unfair_lock_s **)(v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v2);
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 16);
  os_unfair_lock_unlock(v2);
  swift_release();
  return v3;
}

uint64_t WorldPoint.state.setter(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state;
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state);
  uint64_t v5 = *(os_unfair_lock_s **)(v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  uint64_t v6 = *(void *)(v4 + 16);
  os_unfair_lock_unlock(v5);
  swift_release();
  uint64_t v7 = *(void *)(v1 + v3);
  uint64_t v8 = *(os_unfair_lock_s **)(v7 + 24);
  swift_retain();
  os_unfair_lock_lock(v8);
  swift_beginAccess();
  *(void *)(v7 + 16) = a1;
  os_unfair_lock_unlock(v8);
  swift_release();
  uint64_t v9 = *(void *)(v1 + v3);
  id v10 = *(os_unfair_lock_s **)(v9 + 24);
  swift_retain();
  os_unfair_lock_lock(v10);
  swift_beginAccess();
  uint64_t v11 = *(void *)(v9 + 16);
  os_unfair_lock_unlock(v10);
  uint64_t result = swift_release();
  if (v6 != v11)
  {
    uint64_t v13 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_delegate);
    uint64_t result = swift_beginAccess();
    if (*v13)
    {
      uint64_t v14 = v13[1];
      uint64_t ObjectType = swift_getObjectType();
      simd_float4x4 v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 8);
      swift_unknownObjectRetain();
      v16(v1, ObjectType, v14);
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

void (*WorldPoint.state.modify(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state);
  uint64_t v5 = *(os_unfair_lock_s **)(v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  uint64_t v6 = *(void *)(v4 + 16);
  os_unfair_lock_unlock(v5);
  swift_release();
  v3[3] = v6;
  return sub_22F213048;
}

void sub_22F213048(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  WorldPoint.state.setter(*(void *)(*(void *)a1 + 24));
  free(v1);
}

id WorldPoint.init(anchor:type:state:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_lines] = MEMORY[0x263F8EE78];
  *(void *)&v3[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_parentLine] = 0;
  *(void *)&v3[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_snapLine] = 0;
  uint64_t v7 = &v3[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_partOfRectangleId];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = &v3[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_delegate];
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  *(void *)&v3[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_triangulationAnchor] = 0;
  uint64_t v9 = (uint64_t *)&v3[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695E80);
  uint64_t v10 = swift_allocObject();
  uint64_t v11 = v3;
  swift_retain();
  uint64_t v12 = (_DWORD *)swift_slowAlloc();
  *uint64_t v12 = 0;
  *(void *)(v10 + 16) = a1;
  *(void *)(v10 + 24) = v12;
  *uint64_t v9 = v10;
  swift_endAccess();
  uint64_t v13 = (uint64_t *)&v11[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__type];
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695E90);
  uint64_t v14 = swift_allocObject();
  BOOL v15 = (_DWORD *)swift_slowAlloc();
  _DWORD *v15 = 0;
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = v15;
  uint64_t *v13 = v14;
  swift_endAccess();

  v18.receiver = v11;
  v18.super_class = (Class)type metadata accessor for WorldPoint();
  id v16 = objc_msgSendSuper2(&v18, sel_init);
  WorldPoint.state.setter(a3);
  sub_22F213438();

  swift_release();
  return v16;
}

uint64_t WorldPoint.addLine(_:)(void *a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_lines);
  swift_beginAccess();
  id v4 = a1;
  MEMORY[0x230FB2700]();
  if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_22F223D18();
  }
  sub_22F223D68();
  sub_22F223CD8();
  return swift_endAccess();
}

void WorldPoint.addParentLine(_:)(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_parentLine);
  swift_beginAccess();
  id v4 = *v3;
  *uint64_t v3 = a1;
  id v5 = a1;
}

void WorldPoint.removeLine(_:)(void *a1)
{
  swift_beginAccess();
  id v2 = a1;
  unint64_t v3 = swift_bridgeObjectRetain();
  unint64_t v4 = sub_22F20C578(v3, (uint64_t)v2);
  char v6 = v5;
  swift_bridgeObjectRelease();

  if ((v6 & 1) == 0)
  {
    swift_beginAccess();
    uint64_t v7 = (void *)sub_22F183860(v4);
    swift_endAccess();
  }
}

Swift::Void __swiftcall WorldPoint.removeParentLine()()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_parentLine);
  swift_beginAccess();
  id v2 = *v1;
  void *v1 = 0;
}

uint64_t sub_22F213438()
{
  uint64_t v1 = v0;
  id v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor);
  swift_beginAccess();
  uint64_t v3 = *v2;
  unint64_t v4 = *(os_unfair_lock_s **)(*v2 + 24);
  swift_retain();
  os_unfair_lock_lock(v4);
  swift_beginAccess();
  uint64_t v5 = *(void *)(v3 + 16);
  swift_retain();
  os_unfair_lock_unlock(v4);
  swift_release();
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v7 = (uint64_t *)(v5 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_updateHandler);
  swift_beginAccess();
  uint64_t v8 = *v7;
  *uint64_t v7 = (uint64_t)sub_22F214F38;
  v7[1] = v6;
  sub_22F1B4AC8(v8);
  swift_release();
  uint64_t v9 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_delegate);
  swift_beginAccess();
  if (*v9)
  {
    uint64_t v10 = v9[1];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 8);
    swift_unknownObjectRetain();
    v12(v1, ObjectType, v10);
    swift_unknownObjectRelease();
  }
  uint64_t v13 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_triangulationAnchor);
  uint64_t result = swift_beginAccess();
  if (!*v13)
  {
    uint64_t v15 = *v2;
    id v16 = *(os_unfair_lock_s **)(v15 + 24);
    swift_retain();
    os_unfair_lock_lock(v16);
    swift_beginAccess();
    uint64_t v17 = *(void *)(v15 + 16);
    swift_retain();
    os_unfair_lock_unlock(v16);
    swift_release();
    uint64_t v18 = sub_22F207054(v17, 1u);
    swift_release();
    uint64_t *v13 = v18;
    uint64_t result = swift_release();
    if (*v13)
    {
      int8x16_t v19 = (uint64_t *)(*v13 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_updateHandler);
      swift_beginAccess();
      uint64_t v20 = *v19;
      *int8x16_t v19 = 0;
      v19[1] = 0;
      return sub_22F1B4AC8(v20);
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void sub_22F213684(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x230FB41A0](v1);
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    unint64_t v4 = (uint64_t *)(v2 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_delegate);
    swift_beginAccess();
    uint64_t v5 = *v4;
    uint64_t v6 = v4[1];
    swift_unknownObjectRetain();

    if (v5)
    {
      swift_beginAccess();
      uint64_t v7 = MEMORY[0x230FB41A0](v1);
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        uint64_t ObjectType = swift_getObjectType();
        (*(void (**)(void *, uint64_t, uint64_t))(v6 + 8))(v8, ObjectType, v6);

        swift_unknownObjectRelease();
      }
      else
      {
        __break(1u);
      }
    }
  }
}

Swift::Void __swiftcall WorldPoint.markAsPartOfRectangle(withId:)(Swift::String withId)
{
  object = withId._object;
  uint64_t countAndFlagsBits = withId._countAndFlagsBits;
  unint64_t v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_partOfRectangleId);
  swift_beginAccess();
  *unint64_t v4 = countAndFlagsBits;
  v4[1] = (uint64_t)object;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
}

id WorldPoint.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void WorldPoint.init()()
{
}

uint64_t sub_22F213868()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

id WorldPoint.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WorldPoint();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_22F2139F0(char a1)
{
  unint64_t result = 0x6D726F4E77656976;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7473694477656976;
      break;
    case 2:
      unint64_t result = 0x6C6562616CLL;
      break;
    case 3:
      unint64_t result = 0x707954656E616C70;
      break;
    case 4:
      unint64_t result = 0x726F4E656E616C70;
      break;
    case 5:
      unint64_t result = 0xD000000000000017;
      break;
    case 6:
      unint64_t result = 0x6E656469666E6F63;
      break;
    case 7:
      unint64_t result = 0x6E6F43656E616C70;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_22F213B20()
{
  return sub_22F2139F0(*v0);
}

uint64_t sub_22F213B28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_22F214B50(a1, a2);
  *a3 = result;
  return result;
}

void sub_22F213B50(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_22F213B5C(uint64_t a1)
{
  unint64_t v2 = sub_22F2144E8();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_22F213B98(uint64_t a1)
{
  unint64_t v2 = sub_22F2144E8();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t WorldPoint.ResultRepresentation.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268695EA0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_22F2144E8();
  sub_22F224868();
  sub_22F1899D0(v3, (uint64_t)v19, &qword_268695EB0);
  sub_22F1899D0((uint64_t)v19, (uint64_t)v14, &qword_268695EB0);
  char v13 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268695428);
  sub_22F21453C();
  sub_22F224668();
  if (!v2)
  {
    char v9 = *(unsigned char *)(v3 + 24);
    v14[0] = 1;
    char v13 = v9;
    sub_22F224658();
    sub_22F1899D0(v3 + 25, (uint64_t)&v18, &qword_268695EB8);
    sub_22F1899D0((uint64_t)&v18, (uint64_t)v14, &qword_268695EB8);
    char v13 = 2;
    sub_22F214598();
    sub_22F224668();
    sub_22F1899D0(v3 + 26, (uint64_t)&v17, &qword_268695EC8);
    sub_22F1899D0((uint64_t)&v17, (uint64_t)v14, &qword_268695EC8);
    char v13 = 3;
    sub_22F2145EC();
    sub_22F224668();
    sub_22F1899D0(v3 + 32, (uint64_t)v16, &qword_268695EB0);
    sub_22F1899D0((uint64_t)v16, (uint64_t)v14, &qword_268695EB0);
    char v13 = 4;
    sub_22F224668();
    sub_22F1899D0(v3 + 64, (uint64_t)v15, &qword_268695EB0);
    sub_22F1899D0((uint64_t)v15, (uint64_t)v14, &qword_268695EB0);
    char v13 = 5;
    sub_22F224668();
    v14[0] = 6;
    sub_22F224698();
    char v10 = *(unsigned char *)(v3 + 92);
    v14[0] = 7;
    char v13 = v10;
    sub_22F224658();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_22F213F5C(void *a1)
{
  return WorldPoint.ResultRepresentation.encode(to:)(a1);
}

double sub_22F213FA8@<D0>(uint64_t a1@<X8>)
{
  sub_22F214000((char *)*v1, v6);
  __n128 v3 = v6[3];
  *(__n128 *)(a1 + 32) = v6[2];
  *(__n128 *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v7[0];
  *(_OWORD *)(a1 + 77) = *(_OWORD *)((char *)v7 + 13);
  double result = v6[0].n128_f64[0];
  __n128 v5 = v6[1];
  *(__n128 *)a1 = v6[0];
  *(__n128 *)(a1 + 16) = v5;
  return result;
}

__n128 sub_22F214000@<Q0>(char *a1@<X0>, __n128 *a2@<X8>)
{
  unint64_t v4 = &a1[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
  swift_beginAccess();
  __n128 v5 = *(os_unfair_lock_s **)(*(void *)v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_unlock(v5);
  swift_release();
  unint64_t v6 = WorldAnchor.viewDirection.getter();
  unint64_t v44 = v7;
  unint64_t v45 = v6;
  char v43 = v8;
  swift_release();
  char v9 = *(os_unfair_lock_s **)(*(void *)v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v9);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_unlock(v9);
  swift_release();
  unint64_t v42 = WorldAnchor.distanceToViewAnchor.getter();
  swift_release();
  uint64_t v10 = *(void *)v4;
  uint64_t v11 = *(os_unfair_lock_s **)(*(void *)v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v11);
  swift_beginAccess();
  uint64_t v12 = *(void *)(v10 + 16);
  swift_retain();
  os_unfair_lock_unlock(v11);
  swift_release();
  char v13 = (uint64_t *)(v12 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane);
  swift_beginAccess();
  uint64_t v14 = *v13;
  uint64_t v15 = *(os_unfair_lock_s **)(v14 + 24);
  swift_retain();
  os_unfair_lock_lock(v15);
  swift_beginAccess();
  uint64_t v16 = *(void *)(v14 + 16);
  swift_retain();
  os_unfair_lock_unlock(v15);
  swift_release();
  swift_release();
  if (v16)
  {
    uint64_t v17 = qword_2686944A0;
    swift_retain();
    if (v17 != -1) {
      swift_once();
    }
    swift_beginAccess();
    uint64_t v18 = *(void *)(v16 + 16);
    int8x16_t v19 = *(os_unfair_lock_s **)(v18 + 24);
    swift_retain();
    os_unfair_lock_lock(v19);
    swift_beginAccess();
    id v20 = *(id *)(v18 + 16);
    os_unfair_lock_unlock(v19);
    swift_release();
    char v41 = sub_22F1E0634(v20);
    swift_release();

    char v21 = *(unsigned char *)(v16 + 48);
    swift_beginAccess();
    uint64_t v22 = *(void *)(v16 + 16);
    uint64_t v23 = *(os_unfair_lock_s **)(v22 + 24);
    swift_retain();
    swift_retain();
    os_unfair_lock_lock(v23);
    swift_beginAccess();
    id v24 = *(id *)(v22 + 16);
    os_unfair_lock_unlock(v23);
    swift_release();
    swift_release();
    objc_msgSend(v24, sel_transform);
    __n128 v46 = v25;

    __n128 v26 = v46;
    v26.n128_u32[3] = 0;
    __n128 v47 = v26;
  }
  else
  {
    __n128 v47 = 0u;
    char v41 = 33;
    char v21 = 7;
  }
  int64x2_t v27 = &a1[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_triangulationAnchor];
  swift_beginAccess();
  if (*(void *)v27)
  {
    swift_retain();
    unint64_t v28 = WorldAnchor.viewDirection.getter();
    unint64_t v30 = v29;
    char v32 = v31;
    swift_release();
    char v33 = v32 & 1;
  }
  else
  {
    unint64_t v28 = 0;
    unint64_t v30 = 0;
    char v33 = 1;
  }
  uint64_t v34 = *(void *)v4;
  char v35 = *(os_unfair_lock_s **)(*(void *)v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v35);
  swift_beginAccess();
  uint64_t v36 = *(void *)(v34 + 16);
  swift_retain();
  os_unfair_lock_unlock(v35);
  swift_release();
  uint64_t v37 = (unsigned __int32 *)(v36 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_confidence);
  swift_beginAccess();
  unsigned __int32 v38 = *v37;
  swift_release();
  if (v16)
  {
    swift_retain();
    float v39 = WorldPlane.confidence.getter();
    swift_release_n();
  }
  else
  {

    float v39 = 0.0;
  }
  a2->n128_u64[0] = v45;
  a2->n128_u64[1] = v44;
  a2[1].n128_u8[0] = v43 & 1;
  a2[1].n128_u32[1] = v42;
  a2[1].n128_u8[8] = BYTE4(v42) & 1;
  a2[1].n128_u8[9] = v41;
  a2[1].n128_u8[10] = v21;
  __n128 result = v47;
  a2[2] = v47;
  a2[3].n128_u8[0] = v16 == 0;
  a2[4].n128_u64[0] = v28;
  a2[4].n128_u64[1] = v30;
  a2[5].n128_u8[0] = v33;
  a2[5].n128_u32[1] = v38;
  a2[5].n128_f32[2] = v39;
  a2[5].n128_u8[12] = v16 == 0;
  return result;
}

unint64_t sub_22F2144B4(unint64_t result)
{
  if (result > 8) {
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for WorldPoint()
{
  return self;
}

unint64_t sub_22F2144E8()
{
  unint64_t result = qword_268695EA8;
  if (!qword_268695EA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695EA8);
  }
  return result;
}

unint64_t sub_22F21453C()
{
  unint64_t result = qword_268695B38;
  if (!qword_268695B38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268695428);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695B38);
  }
  return result;
}

unint64_t sub_22F214598()
{
  unint64_t result = qword_268695EC0;
  if (!qword_268695EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695EC0);
  }
  return result;
}

unint64_t sub_22F2145EC()
{
  unint64_t result = qword_268695ED0;
  if (!qword_268695ED0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695ED0);
  }
  return result;
}

unint64_t sub_22F214644()
{
  unint64_t result = qword_268695ED8;
  if (!qword_268695ED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695ED8);
  }
  return result;
}

uint64_t sub_22F21469C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __n128 v3 = (void *)(*a1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_lines);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

id sub_22F2146F8@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  __n128 v3 = (void **)(*a1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_parentLine);
  swift_beginAccess();
  unint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_22F214760@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __n128 v3 = (void *)(*a1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_partOfRectangleId);
  swift_beginAccess();
  uint64_t v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for WorldPointType()
{
  return &type metadata for WorldPointType;
}

__n128 __swift_memcpy93_16(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 77) = *(_OWORD *)(a2 + 77);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for WorldPoint.ResultRepresentation(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xF9 && *(unsigned char *)(a1 + 93)) {
    return (*(_DWORD *)a1 + 249);
  }
  if (*(unsigned __int8 *)(a1 + 26) <= 7u) {
    int v3 = 7;
  }
  else {
    int v3 = *(unsigned __int8 *)(a1 + 26);
  }
  int v4 = v3 - 8;
  if (*(unsigned __int8 *)(a1 + 26) < 7u) {
    int v5 = -1;
  }
  else {
    int v5 = v4;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for WorldPoint.ResultRepresentation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 92) = 0;
    *(_DWORD *)(result + 88) = 0;
    *(void *)__n128 result = a2 - 249;
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 93) = 1;
    }
  }
  else
  {
    if (a3 >= 0xF9) {
      *(unsigned char *)(result + 93) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 26) = a2 + 7;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorldPoint.ResultRepresentation()
{
  return &type metadata for WorldPoint.ResultRepresentation;
}

uint64_t getEnumTagSinglePayload for WorldPoint.ResultRepresentation.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for WorldPoint.ResultRepresentation.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *__n128 result = a2 + 7;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22F214A10);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorldPoint.ResultRepresentation.CodingKeys()
{
  return &type metadata for WorldPoint.ResultRepresentation.CodingKeys;
}

unint64_t sub_22F214A4C()
{
  unint64_t result = qword_268695EE0;
  if (!qword_268695EE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695EE0);
  }
  return result;
}

unint64_t sub_22F214AA4()
{
  unint64_t result = qword_268695EE8;
  if (!qword_268695EE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695EE8);
  }
  return result;
}

unint64_t sub_22F214AFC()
{
  unint64_t result = qword_268695EF0;
  if (!qword_268695EF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268695EF0);
  }
  return result;
}

uint64_t sub_22F214B50(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x6D726F4E77656976 && a2 == 0xEA00000000006C61 || (sub_22F224738() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7473694477656976 && a2 == 0xEC00000065636E61 || (sub_22F224738() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6562616CLL && a2 == 0xE500000000000000 || (sub_22F224738() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x707954656E616C70 && a2 == 0xE900000000000065 || (sub_22F224738() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x726F4E656E616C70 && a2 == 0xEB000000006C616DLL || (sub_22F224738() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000022F2323E0 || (sub_22F224738() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6E656469666E6F63 && a2 == 0xEA00000000006563 || (sub_22F224738() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6E6F43656E616C70 && a2 == 0xEF65636E65646966)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    char v5 = sub_22F224738();
    swift_bridgeObjectRelease();
    if (v5) {
      return 7;
    }
    else {
      return 8;
    }
  }
}

uint64_t sub_22F214F00()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_22F214F38()
{
  sub_22F213684(v0);
}

uint64_t MeasurementEvent.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_22F223848();
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);
  return v4(a1, v1, v3);
}

uint64_t MeasurementEvent.time.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 36);
  uint64_t v5 = sub_22F2237F8();
  unsigned int v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t MeasurementEvent.name.getter(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + *(int *)(a1 + 40));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t MeasurementEvent.results.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MeasurementEvent.init(name:results:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  _s17MeasureFoundation11WorldAnchorC10identifier0B04UUIDVvpfi_0();
  uint64_t v12 = type metadata accessor for MeasurementEvent();
  _s17MeasureFoundation16MeasurementEventV4time0B04DateVvpfi_0();
  char v13 = (void *)(a6 + *(int *)(v12 + 40));
  void *v13 = a1;
  v13[1] = a2;
  v20[5] = a3;
  v20[2] = a4;
  v20[3] = a5;
  uint64_t v14 = sub_22F223DD8();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v18 = sub_22F1D2FAC((void (*)(char *, char *))sub_22F2151A4, (uint64_t)v20, v14, AssociatedTypeWitness, MEMORY[0x263F8E628], WitnessTable, MEMORY[0x263F8E658], v17);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(a6 + *(int *)(v12 + 44)) = v18;
  return result;
}

uint64_t type metadata accessor for MeasurementEvent()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22F2151A4()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 24) + 24))(*(void *)(v0 + 16));
}

BOOL sub_22F2151E8(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_22F2151F8()
{
  return sub_22F2247F8();
}

uint64_t sub_22F215220(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_22F224738() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701669236 && a2 == 0xE400000000000000 || (sub_22F224738() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_22F224738() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x73746C75736572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_22F224738();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_22F2153A0(char a1)
{
  uint64_t result = 25705;
  switch(a1)
  {
    case 1:
      uint64_t result = 1701669236;
      break;
    case 2:
      uint64_t result = 1701667182;
      break;
    case 3:
      uint64_t result = 0x73746C75736572;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_22F21541C(char *a1, char *a2)
{
  return sub_22F2151E8(*a1, *a2);
}

uint64_t sub_22F215430()
{
  return _s17MeasureFoundation8EdgeTypeO9hashValueSivg_0();
}

uint64_t sub_22F21543C()
{
  return sub_22F2151F8();
}

uint64_t sub_22F215448()
{
  return sub_22F224818();
}

uint64_t sub_22F215490()
{
  return sub_22F2153A0(*v0);
}

uint64_t sub_22F21549C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_22F215220(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22F2154CC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_22F2163AC();
  *a1 = result;
  return result;
}

uint64_t sub_22F2154F8(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B0](a1, WitnessTable);
}

uint64_t sub_22F21554C(uint64_t a1)
{
  uint64_t WitnessTable = swift_getWitnessTable();
  return MEMORY[0x270FA00B8](a1, WitnessTable);
}

uint64_t MeasurementEvent.encode(to:)(void *a1, uint64_t a2)
{
  uint64_t v13 = a2;
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(a2 + 16);
  v12[0] = *(void *)(a2 + 24);
  v12[1] = v5;
  type metadata accessor for MeasurementEvent.CodingKeys();
  swift_getWitnessTable();
  uint64_t v6 = sub_22F2246B8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v9 = (char *)v12 - v8;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_22F224868();
  LOBYTE(v17) = 0;
  sub_22F223848();
  sub_22F215910(&qword_268695EF8, MEMORY[0x263F07508]);
  uint64_t v10 = v14;
  sub_22F2246A8();
  if (!v10)
  {
    LOBYTE(v17) = 1;
    sub_22F2237F8();
    sub_22F215910(qword_268695F00, MEMORY[0x263F07490]);
    sub_22F2246A8();
    LOBYTE(v17) = 2;
    sub_22F224678();
    uint64_t v17 = *(void *)(v3 + *(int *)(v13 + 44));
    char v16 = 3;
    swift_getAssociatedTypeWitness();
    sub_22F223DD8();
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    swift_getWitnessTable();
    sub_22F2246A8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t type metadata accessor for MeasurementEvent.CodingKeys()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_22F215910(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22F215958(void *a1, uint64_t a2)
{
  return MeasurementEvent.encode(to:)(a1, a2);
}

uint64_t sub_22F215970()
{
  uint64_t result = sub_22F223848();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_22F2237F8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_22F215A50(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_22F223848();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[9];
    char v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = sub_22F2237F8();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    uint64_t v12 = a3[10];
    uint64_t v13 = a3[11];
    uint64_t v14 = (uint64_t *)((char *)a1 + v12);
    uint64_t v15 = (uint64_t *)((char *)a2 + v12);
    uint64_t v16 = v15[1];
    void *v14 = *v15;
    v14[1] = v16;
    *(uint64_t *)((char *)a1 + v13) = *(uint64_t *)((char *)a2 + v13);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_22F215B88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22F223848();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 36);
  uint64_t v6 = sub_22F2237F8();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22F215C54(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_22F223848();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[9];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22F2237F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  uint64_t v11 = a3[10];
  uint64_t v12 = a3[11];
  uint64_t v13 = (void *)(a1 + v11);
  uint64_t v14 = (void *)(a2 + v11);
  uint64_t v15 = v14[1];
  void *v13 = *v14;
  v13[1] = v15;
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_22F215D3C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_22F223848();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[9];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22F2237F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  uint64_t v11 = a3[10];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (void *)(a2 + v11);
  *uint64_t v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22F215E44(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_22F223848();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[9];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22F2237F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v8, v9, v10);
  uint64_t v11 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  return a1;
}

uint64_t sub_22F215F18(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_22F223848();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[9];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_22F2237F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = a3[10];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *uint64_t v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22F216008(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_22F21601C);
}

uint64_t sub_22F21601C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22F223848();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_5:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = sub_22F2237F8();
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 36);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_5;
  }
  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 40) + 8);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_22F216134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_22F216148);
}

uint64_t sub_22F216148(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = sub_22F223848();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t result = sub_22F2237F8();
    uint64_t v14 = *(void *)(result - 8);
    if (*(_DWORD *)(v14 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 40) + 8) = (a2 - 1);
      return result;
    }
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 36);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_22F21625C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

unsigned char *sub_22F216264(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22F216330);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_22F216358()
{
  return swift_getWitnessTable();
}

uint64_t sub_22F216374()
{
  return swift_getWitnessTable();
}

uint64_t sub_22F216390()
{
  return swift_getWitnessTable();
}

uint64_t sub_22F2163AC()
{
  return 4;
}

uint64_t sub_22F2163B4(int8x16_t *a1, uint64_t a2)
{
  int64_t v3 = a1[1].i64[0];
  uint64_t result = MEMORY[0x263F8EE78];
  if (v3)
  {
    uint64_t v22 = MEMORY[0x263F8EE78];
    sub_22F18FD68(0, v3, 0);
    uint64_t result = v22;
    uint64_t v7 = a1 + 2;
    while ((*(unsigned char *)(a2 + 128) & 1) == 0)
    {
      uint64_t v8 = *(void *)(a2 + 112);
      v9.i64[0] = v8;
      v9.i64[1] = *(void *)(a2 + 120);
      int8x16_t v10 = *v7;
      uint64_t v23 = result;
      unint64_t v12 = *(void *)(result + 16);
      unint64_t v11 = *(void *)(result + 24);
      if (v12 >= v11 >> 1)
      {
        int8x16_t v20 = v9;
        __int32 v21 = v6;
        int8x16_t v19 = *v7;
        sub_22F18FD68((char *)(v11 > 1), v12 + 1, 1);
        int8x16_t v10 = v19;
        int8x16_t v9 = v20;
        __int32 v6 = v21;
        uint64_t result = v23;
      }
      *(float32x2_t *)v13.f32 = vsub_f32((float32x2_t)__PAIR64__(v9.u32[1], v8), *(float32x2_t *)v10.i8);
      float32x2_t v14 = vsub_f32((float32x2_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL), (float32x2_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL));
      float32x2_t v15 = vmul_f32(*(float32x2_t *)v13.f32, *(float32x2_t *)v13.f32);
      *(float32x2_t *)&v13.u32[2] = v14;
      v14.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)vmulq_f32(v13, v13), 2), vadd_f32(v15, (float32x2_t)vdup_lane_s32((int32x2_t)v15, 1))).u32[0];
      float32x2_t v16 = vrsqrte_f32((float32x2_t)v14.u32[0]);
      float32x2_t v17 = vmul_f32(v16, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(v16, v16)));
      float32x4_t v18 = vmulq_n_f32(v13, vmul_f32(v17, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(v17, v17))).f32[0]);
      v18.i32[3] = v6;
      *(void *)(result + 16) = v12 + 1;
      *(float32x4_t *)(result + 16 * v12 + 32) = v18;
      ++v7;
      if (!--v3) {
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_22F216514(const void *a1)
{
  uint64_t v3 = *v1;
  unsigned int v4 = (char *)v1[2];
  uint64_t v5 = *((void *)v4 + 2);
  if (v5 >= *v1)
  {
    unint64_t v9 = v1[1];
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if (result)
    {
      if ((v9 & 0x8000000000000000) == 0) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t result = (uint64_t)sub_22F20C564((uint64_t)v4);
      unsigned int v4 = (char *)result;
      if ((v9 & 0x8000000000000000) == 0)
      {
LABEL_9:
        if (v9 < *((void *)v4 + 2))
        {
          memcpy(v10, &v4[304 * v9 + 32], 0x130uLL);
          sub_22F21A9B4((uint64_t)a1);
          sub_22F21AFC0((uint64_t)v10);
          uint64_t result = (uint64_t)memcpy(&v4[304 * v9 + 32], a1, 0x130uLL);
          v1[2] = (uint64_t)v4;
          if (v3)
          {
            v1[1] = (uint64_t)(v9 + 1) % v3;
            return result;
          }
          goto LABEL_15;
        }
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
        return result;
      }
    }
    __break(1u);
    goto LABEL_14;
  }
  sub_22F21A9B4((uint64_t)a1);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unsigned int v4 = sub_22F19C0BC(0, v5 + 1, 1, v4);
  }
  unint64_t v7 = *((void *)v4 + 2);
  unint64_t v6 = *((void *)v4 + 3);
  if (v7 >= v6 >> 1) {
    unsigned int v4 = sub_22F19C0BC((char *)(v6 > 1), v7 + 1, 1, v4);
  }
  *((void *)v4 + 2) = v7 + 1;
  uint64_t result = (uint64_t)memcpy(&v4[304 * v7 + 32], a1, 0x130uLL);
  v1[2] = (uint64_t)v4;
  return result;
}

void *RectangleQualificationParameters.qualityTolerance.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.qualityTolerance;
}

float static RectangleQualificationParameters.qualityTolerance.getter()
{
  return 0.05;
}

void *RectangleQualificationParameters.minimumEdgeLength.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.minimumEdgeLength;
}

float static RectangleQualificationParameters.minimumEdgeLength.getter()
{
  return 0.005;
}

void *RectangleQualificationParameters.maximumEdgeLength.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.maximumEdgeLength;
}

float static RectangleQualificationParameters.maximumEdgeLength.getter()
{
  return 100.0;
}

void *RectangleQualificationParameters.minimumAspectRatio.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.minimumAspectRatio;
}

float static RectangleQualificationParameters.minimumAspectRatio.getter()
{
  return 1.0;
}

void *RectangleQualificationParameters.maximumAspectRatio.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.maximumAspectRatio;
}

float static RectangleQualificationParameters.maximumAspectRatio.getter()
{
  return 100.0;
}

void *RectangleQualificationParameters.minimumArea.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.minimumArea;
}

float static RectangleQualificationParameters.minimumArea.getter()
{
  return 0.0001;
}

void *RectangleQualificationParameters.maximumArea.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.maximumArea;
}

float static RectangleQualificationParameters.maximumArea.getter()
{
  return 100.0;
}

void *RectangleQualificationParameters.squareFactorThreshold.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.squareFactorThreshold;
}

float static RectangleQualificationParameters.squareFactorThreshold.getter()
{
  return 0.9;
}

void *RectangleQualificationParameters.ignoreDistanceAlongNormal.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.ignoreDistanceAlongNormal;
}

uint64_t static RectangleQualificationParameters.ignoreDistanceAlongNormal.getter()
{
  return 1;
}

void *RectangleQualificationParameters.minDistanceThreshold.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.minDistanceThreshold;
}

float static RectangleQualificationParameters.minDistanceThreshold.getter()
{
  return 0.05;
}

void *RectangleQualificationParameters.maxDistanceThresholdCornerPoint.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.maxDistanceThresholdCornerPoint;
}

float static RectangleQualificationParameters.maxDistanceThresholdCornerPoint.getter()
{
  return 0.05;
}

void *RectangleQualificationParameters.minAreaSimilarity.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.minAreaSimilarity;
}

float static RectangleQualificationParameters.minAreaSimilarity.getter()
{
  return 0.7;
}

void *RectangleQualificationParameters.minOrientationSimilarity.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.minOrientationSimilarity;
}

float static RectangleQualificationParameters.minOrientationSimilarity.getter()
{
  return 0.8;
}

void *RectangleQualificationParameters.rectifyRectanglePoints.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.rectifyRectanglePoints;
}

uint64_t static RectangleQualificationParameters.rectifyRectanglePoints.getter()
{
  return 1;
}

void *RectangleQualificationParameters.minAspectRatioSimilarity.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.minAspectRatioSimilarity;
}

float static RectangleQualificationParameters.minAspectRatioSimilarity.getter()
{
  return 0.8;
}

void *RectangleQualificationParameters.captureQualityTolerance.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.captureQualityTolerance;
}

float static RectangleQualificationParameters.captureQualityTolerance.getter()
{
  return 0.05;
}

void *RectangleQualificationParameters.areaIncreaseTolerance.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.areaIncreaseTolerance;
}

float static RectangleQualificationParameters.areaIncreaseTolerance.getter()
{
  return 0.1;
}

uint64_t WorldRectangleData.points.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WorldRectangleData.rawPoints.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WorldRectangleData.anchors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WorldRectangleData.baseVectors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WorldRectangleData.forward.getter()
{
  return *(void *)(v0 + 32);
}

__n128 WorldRectangleData.orientation.getter@<Q0>(uint64_t a1@<X8>)
{
  __n128 result = *(__n128 *)(v1 + 64);
  long long v3 = *(_OWORD *)(v1 + 80);
  long long v4 = *(_OWORD *)(v1 + 96);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  return result;
}

uint64_t WorldRectangleData.centroid.getter()
{
  return *(void *)(v0 + 112);
}

unint64_t WorldRectangleData.area.getter()
{
  return *(unsigned int *)(v0 + 132) | ((unint64_t)*(unsigned __int8 *)(v0 + 136) << 32);
}

unint64_t WorldRectangleData.aspectRatio.getter()
{
  return *(unsigned int *)(v0 + 140) | ((unint64_t)*(unsigned __int8 *)(v0 + 144) << 32);
}

uint64_t WorldRectangleData.size.getter()
{
  return *(void *)(v0 + 148);
}

uint64_t WorldRectangleData.timestamp.getter()
{
  return *(void *)(v0 + 160);
}

unint64_t WorldRectangleData.cornerQuality.getter()
{
  return *(unsigned int *)(v0 + 172) | ((unint64_t)*(unsigned __int8 *)(v0 + 176) << 32);
}

unint64_t WorldRectangleData.captureQuality.getter()
{
  return *(unsigned int *)(v0 + 180) | ((unint64_t)*(unsigned __int8 *)(v0 + 184) << 32);
}

unint64_t WorldRectangleData.squareFactor.getter()
{
  return *(unsigned int *)(v0 + 188) | ((unint64_t)*(unsigned __int8 *)(v0 + 192) << 32);
}

uint64_t WorldRectangleData.squared.getter()
{
  return *(unsigned __int8 *)(v0 + 193);
}

uint64_t WorldRectangleData.surfaceNormal.getter()
{
  return *(void *)(v0 + 208);
}

unint64_t WorldRectangleData.boundingRadius.getter()
{
  return *(unsigned int *)(v0 + 228) | ((unint64_t)*(unsigned __int8 *)(v0 + 232) << 32);
}

__n128 WorldRectangleData.screenCoordinates.getter@<Q0>(uint64_t a1@<X8>)
{
  long long v2 = *(_OWORD *)(v1 + 256);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 240);
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(v1 + 272);
  long long v4 = *(_OWORD *)(v1 + 288);
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

double WorldRectangleData.cgSize.getter()
{
  sub_22F1899D0(v0 + 148, (uint64_t)v2, &qword_268696008);
  sub_22F1899D0((uint64_t)v2, (uint64_t)&v3, &qword_268696008);
  double result = v3;
  if (v4) {
    return 0.0;
  }
  return result;
}

Swift::OpaquePointer WorldRectangleData.init(_:screenCoordinates:keyFrame:)@<X0>(unint64_t a1@<X0>, float *a2@<X1>, void *a3@<X2>, char *rawValue@<X8>)
{
  id v81 = a3;
  uint64_t v10 = sub_22F2237F8();
  unint64_t v11 = *(void *)(v10 - 8);
  result._rawValue = (void *)MEMORY[0x270FA5388](v10);
  v84.n128_u64[0] = (unint64_t)&v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v129 = 0u;
  long long v130 = 0u;
  long long v128 = 0u;
  char v131 = 1;
  int v137 = 0;
  char v138 = 1;
  int v139 = 0;
  char v140 = 1;
  uint64_t v141 = 0;
  char v142 = 1;
  uint64_t v143 = 0;
  char v144 = 1;
  LOBYTE(v150) = 1;
  float32x2_t v14 = (__int32 *)(a1 >> 62);
  int v149 = 0;
  if (!(a1 >> 62))
  {
    if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) == 4) {
      goto LABEL_3;
    }
LABEL_92:
    swift_bridgeObjectRelease();

    goto LABEL_93;
  }
LABEL_91:
  swift_bridgeObjectRetain();
  uint64_t v75 = sub_22F2245C8();
  result._rawValue = (void *)swift_bridgeObjectRelease();
  if (v75 != 4) {
    goto LABEL_92;
  }
LABEL_3:
  long long v15 = *((_OWORD *)a2 + 1);
  long long v155 = *(_OWORD *)a2;
  long long v156 = v15;
  long long v16 = *((_OWORD *)a2 + 3);
  long long v157 = *((_OWORD *)a2 + 2);
  long long v158 = v16;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v17 = MEMORY[0x230FB2E90](0, a1);
  }
  else
  {
    if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_97;
    }
    uint64_t v17 = swift_retain();
  }
  float32x4_t v85 = *(float32x4_t *)(v17 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 16);
  swift_release();
  float32x4_t v18 = v85;
  v18.i32[3] = 0;
  float32x4_t v151 = v18;
  char v152 = 0;
  uint64_t v19 = MEMORY[0x263F8EE78];
  v83.n128_u64[0] = v10;
  v82.n128_u64[0] = v11;
  if (v81)
  {
    id v20 = objc_msgSend(v81, sel_camera);
    objc_msgSend(v20, sel_transform);
    float32x4_t v80 = v21;

    float32x4_t v22 = vmulq_f32(v85, v80);
    unsigned __int32 v147 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).u32[0];
  }
  else
  {
    unsigned __int32 v147 = 1065353216;
  }
  char v148 = 0;
  *(void *)&long long v129 = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&long long v128 = v19;
  if (v14)
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_22F2245C8();
  }
  else
  {
    uint64_t v23 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  float32x4_t v78 = rawValue;
  rawValue = (char *)MEMORY[0x263F8EE78];
  if (!v23)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    *((void *)&v128 + 1) = rawValue;
    swift_bridgeObjectRetain();
    unint64_t v33 = v84.n128_u64[0];
    _s17MeasureFoundation16MeasurementEventV4time0B04DateVvpfi_0();
    sub_22F2237D8();
    uint64_t v35 = v34;
    result._rawValue = (void *)(*(uint64_t (**)(unint64_t, unint64_t))(v82.n128_u64[0] + 8))(v33, v83.n128_u64[0]);
    uint64_t v143 = v35;
    char v144 = 0;
    a2 = (float *)v128;
    if (!(void)v128)
    {
LABEL_111:
      __break(1u);
      goto LABEL_112;
    }
    sub_22F219F2C((float32x4_t *)v128, v36, v37, v38, v39, v40);
    float v145 = v41;
    char v146 = 0;
    if (v41 > 0.05)
    {
LABEL_27:
      swift_bridgeObjectRelease();

      rawValue = v78;
      goto LABEL_93;
    }
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2686948D8);
    result._rawValue = (void *)swift_allocObject();
    *((_OWORD *)result._rawValue + 1) = xmmword_22F2265A0;
    if (*((void *)a2 + 2) >= 2uLL)
    {
      rawValue = (char *)result._rawValue;
      unint64_t v42 = (char *)result._rawValue + 32;
      float v43 = a2[14] - a2[10];
      float32x2_t v44 = vsub_f32(*(float32x2_t *)(a2 + 12), *(float32x2_t *)(a2 + 8));
      *((float *)result._rawValue + 8) = sqrtf((float)(v43 * v43) + vaddv_f32(vmul_f32(v44, v44)));
      if (*((void *)a2 + 2) >= 4uLL)
      {
        float v45 = a2[22] - a2[10];
        float32x2_t v46 = vsub_f32(*(float32x2_t *)(a2 + 20), *(float32x2_t *)(a2 + 8));
        *((float *)result._rawValue + 9) = sqrtf((float)(v45 * v45) + vaddv_f32(vmul_f32(v46, v46)));
        *(Swift::tuple_index_Int_value_Float_optional *)&result._rawValue = min(_:)(result);
        if ((v47 & 0x100000000) != 0)
        {
LABEL_112:
          __break(1u);
          goto LABEL_113;
        }
        uint64_t v48 = (uint64_t)result._rawValue + 1;
        if (!__OFADD__(result._rawValue, 1))
        {
          if (v48 >= 0) {
            uint64_t v49 = v48 & 1;
          }
          else {
            uint64_t v49 = -(v48 & 1);
          }
          if ((unint64_t)result._rawValue <= 1)
          {
            if (*(float *)&v42[4 * (uint64_t)result._rawValue] < 0.005)
            {
              swift_bridgeObjectRelease();

              swift_setDeallocating();
              swift_deallocClassInstance();
              rawValue = v78;
              goto LABEL_93;
            }
            if ((v49 & 0x8000000000000000) == 0)
            {
              float v4 = *(float *)&v42[4 * v49];
              swift_setDeallocating();
              result._rawValue = (void *)swift_deallocClassInstance();
              if (v4 > 100.0) {
                goto LABEL_27;
              }
              if (v152)
              {
LABEL_113:
                __break(1u);
LABEL_114:
                __break(1u);
                return result;
              }
              float32x4_t v79 = (char *)&v129;
              int v77 = &v130;
              float32x4_t v85 = v151;
              uint64_t v50 = swift_bridgeObjectRetain();
              int8x16_t v51 = (float32x4_t *)sub_22F21A04C(v50, (int32x4_t)v85);
              swift_bridgeObjectRelease();
              result._rawValue = (void *)swift_bridgeObjectRelease();
              a1 = 0;
              float32x2_t v14 = &v51[2].i32[2];
              float32x4_t v80 = (float32x4_t)xmmword_22F227B00;
              while ((void)v129)
              {
                if ((v129 & 0xC000000000000001) != 0)
                {
                  uint64_t v52 = MEMORY[0x230FB2E90](a1);
                }
                else
                {
                  if (a1 >= *(void *)((v129 & 0xFFFFFFFFFFFFFF8) + 0x10))
                  {
                    __break(1u);
LABEL_86:
                    __break(1u);
LABEL_87:
                    __break(1u);
LABEL_88:
                    __break(1u);
LABEL_89:
                    __break(1u);
LABEL_90:
                    __break(1u);
                    goto LABEL_91;
                  }
                  uint64_t v52 = swift_retain();
                }
                float32x4_t v53 = *(float32x4_t *)(v52 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
                __n128 v84 = *(__n128 *)(v52 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 16);
                float32x4_t v85 = v53;
                __n128 v83 = *(__n128 *)(v52 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 32);
                swift_release();
                int8x16_t v54 = (float32x4_t *)swift_allocObject();
                v54[1] = v80;
                if (a1 >= v51[1].i64[0]) {
                  goto LABEL_86;
                }
                rawValue = (char *)v54;
                v54[2].i32[0] = v51[a1 + 2].i32[0];
                v54[2].i32[1] = *(v14 - 1);
                v54[2].i32[2] = *v14;
                v54[2].i32[3] = 1065353216;
                sub_22F219EBC((uint64_t)v54);
                __n128 v82 = v55;
                swift_setDeallocating();
                result._rawValue = (void *)swift_deallocClassInstance();
                if (!(void)v129) {
                  goto LABEL_107;
                }
                if ((v129 & 0xC000000000000001) != 0)
                {
                  unint64_t v11 = MEMORY[0x230FB2E90](a1);
                }
                else
                {
                  if (a1 >= *(void *)((v129 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                    goto LABEL_87;
                  }
                  unint64_t v11 = *(void *)(v129 + 8 * a1 + 32);
                  swift_retain();
                }
                unint64_t v56 = v11 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane;
                swift_beginAccess();
                uint64_t v57 = *(void *)v56;
                int64x2_t v58 = *(os_unfair_lock_s **)(*(void *)v56 + 24);
                swift_retain();
                os_unfair_lock_lock(v58);
                swift_beginAccess();
                rawValue = *(char **)(v57 + 16);
                swift_retain();
                os_unfair_lock_unlock(v58);
                swift_release();
                result._rawValue = (void *)swift_release();
                if (!(void)v129) {
                  goto LABEL_108;
                }
                if ((v129 & 0xC000000000000001) != 0)
                {
                  unint64_t v11 = MEMORY[0x230FB2E90](a1);
                }
                else
                {
                  if (a1 >= *(void *)((v129 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                    goto LABEL_88;
                  }
                  unint64_t v11 = *(void *)(v129 + 8 * a1 + 32);
                  swift_retain();
                }
                int8x16_t v59 = (float *)(v11 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_confidence);
                swift_beginAccess();
                float v4 = *v59;
                result._rawValue = (void *)swift_release();
                if (!(void)v129) {
                  goto LABEL_109;
                }
                if ((v129 & 0xC000000000000001) != 0)
                {
                  uint64_t v60 = MEMORY[0x230FB2E90](a1);
                }
                else
                {
                  if (a1 >= *(void *)((v129 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                    goto LABEL_89;
                  }
                  uint64_t v60 = *(void *)(v129 + 8 * a1 + 32);
                  swift_retain();
                }
                memset(v159, 0, 64);
                v159[64] = 1;
                int8x16_t v61 = (unsigned char *)(v60 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_autoUpdate);
                swift_beginAccess();
                LOBYTE(v61) = *v61;
                swift_release();
                type metadata accessor for WorldAnchor();
                swift_allocObject();
                result._rawValue = (void *)WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)((uint64_t)v159, (uint64_t)rawValue, (char)v61, (uint64_t)v159, (__n128)v85, v84, v83, v82, v4);
                unint64_t v11 = v129;
                if (!(void)v129) {
                  goto LABEL_110;
                }
                rawValue = (char *)result._rawValue;
                int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
                *(void *)&long long v129 = v11;
                if (!isUniquelyReferenced_nonNull_bridgeObject || v11 >> 62)
                {
                  unint64_t v11 = sub_22F20C4D0(v11);
                  *(void *)&long long v129 = v11;
                }
                if (a1 >= *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
                  goto LABEL_90;
                }
                *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 8 * a1 + 0x20) = rawValue;
                swift_release();
                rawValue = v79;
                result._rawValue = (void *)sub_22F223CD8();
                v14 += 4;
                if (++a1 == 4)
                {
                  result._rawValue = (void *)swift_bridgeObjectRelease();
                  *(void *)&long long v128 = v51;
                  unint64_t v63 = v51[1].u64[0];
                  if (!v63) {
                    goto LABEL_102;
                  }
                  if (v63 < 3) {
                    goto LABEL_103;
                  }
                  if (v63 == 3) {
                    goto LABEL_104;
                  }
                  float32x4_t v64 = vsubq_f32(v51[2], v51[4]);
                  float32x4_t v65 = vmulq_f32(v64, v64);
                  *(void *)&double v68 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v65, 2), vaddq_f32(v65, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v65.f32, 1))).u64[0];
                  float32x4_t v66 = vsubq_f32(v51[3], v51[5]);
                  float32x4_t v67 = vmulq_f32(v66, v66);
                  *(float *)&double v68 = sqrtf(*(float *)&v68);
                  float32x4_t v69 = vaddq_f32(v67, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v67.f32, 1));
                  *(void *)&double v70 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v67, 2), v69).u64[0];
                  *(float *)&double v70 = sqrtf(*(float *)&v70);
                  if (*(float *)&v68 <= *(float *)&v70) {
                    *(float *)&double v68 = *(float *)&v70;
                  }
                  LODWORD(v70) = 0.5;
                  *(float *)&double v68 = *(float *)&v68 * 0.5;
                  int v153 = LODWORD(v68);
                  char v154 = 0;
                  *(float32x2_t *)&long long v71 = _ss5SIMD3V17MeasureFoundationSfRszrlE7averageyABySfGSayAEGFZ_0((uint64_t)v51, v68, v70, *(double *)v69.i64);
                  long long v135 = v71;
                  char v136 = 0;
                  int v149 = 0;
                  __int16 v150 = 0;
                  int v137 = 0;
                  char v138 = 0;
                  int v139 = 1065353216;
                  char v140 = 0;
                  swift_bridgeObjectRelease();
                  *((void *)&v129 + 1) = MEMORY[0x263F8EE78];
                  float32x4_t v72 = v77;
                  *(void *)int v77 = 0;
                  *((void *)v72 + 1) = 0;
                  *((unsigned char *)v72 + 16) = 0;
                  long long v73 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
                  long long v74 = *(_OWORD *)(MEMORY[0x263EF89A0] + 32);
                  long long v132 = *MEMORY[0x263EF89A0];
                  long long v133 = v73;
                  long long v134 = v74;
                  result._rawValue = (void *)sub_22F217640();
                  if (v142) {
                    goto LABEL_114;
                  }
                  float v5 = *(float *)&v141;
                  rawValue = v78;
                  id v27 = v81;
                  if (*(float *)&v141 == 0.0
                    || (float v6 = *((float *)&v141 + 1), *((float *)&v141 + 1) == 0.0)
                    || (float v4 = *((float *)&v141 + 1) / *(float *)&v141,
                        (float)(*((float *)&v141 + 1) / *(float *)&v141) > 100.0))
                  {

                    goto LABEL_93;
                  }
                  goto LABEL_81;
                }
              }
              goto LABEL_106;
            }
LABEL_101:
            __break(1u);
LABEL_102:
            __break(1u);
LABEL_103:
            __break(1u);
LABEL_104:
            __break(1u);
LABEL_105:
            __break(1u);
LABEL_106:
            __break(1u);
LABEL_107:
            __break(1u);
LABEL_108:
            __break(1u);
LABEL_109:
            __break(1u);
LABEL_110:
            __break(1u);
            goto LABEL_111;
          }
LABEL_100:
          __break(1u);
          goto LABEL_101;
        }
LABEL_99:
        __break(1u);
        goto LABEL_100;
      }
LABEL_98:
      __break(1u);
      goto LABEL_99;
    }
LABEL_97:
    __break(1u);
    goto LABEL_98;
  }
  uint64_t v24 = 1;
  uint64_t v25 = 4;
  while (1)
  {
    uint64_t v26 = v25 - 4;
    if ((a1 & 0xC000000000000001) == 0) {
      break;
    }
    result._rawValue = (void *)MEMORY[0x230FB2E90](v25 - 4, a1);
    unint64_t v28 = (char *)result._rawValue;
    uint64_t v29 = v25 - 3;
    if (__OFADD__(v26, 1)) {
      goto LABEL_80;
    }
LABEL_19:
    if (!v24) {
      goto LABEL_105;
    }
    float32x4_t v85 = *(float32x4_t *)&v28[OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      rawValue = sub_22F19B630(0, *((void *)rawValue + 2) + 1, 1, rawValue);
    }
    unint64_t v31 = *((void *)rawValue + 2);
    unint64_t v30 = *((void *)rawValue + 3);
    unint64_t v11 = v31 + 1;
    if (v31 >= v30 >> 1) {
      rawValue = sub_22F19B630((char *)(v30 > 1), v31 + 1, 1, rawValue);
    }
    float32x4_t v32 = v85;
    v32.i32[3] = 0;
    *((void *)rawValue + 2) = v11;
    *(float32x4_t *)&rawValue[16 * v31 + 32] = v32;
    swift_release();
    *(void *)&long long v128 = rawValue;
    ++v25;
    uint64_t v24 = (uint64_t)rawValue;
    if (v29 == v23) {
      goto LABEL_25;
    }
  }
  unint64_t v28 = *(char **)(a1 + 8 * v25);
  result._rawValue = (void *)swift_retain();
  uint64_t v29 = v25 - 3;
  if (!__OFADD__(v26, 1)) {
    goto LABEL_19;
  }
LABEL_80:
  __break(1u);
LABEL_81:

  if (v4 >= 1.0 && (float)(v5 * *((float *)&v141 + 1)) <= 100.0 && (float)(v5 * *((float *)&v141 + 1)) >= 0.0001)
  {
    char v96 = v131;
    char v95 = v136;
    char v94 = 0;
    char v93 = 0;
    char v92 = v142;
    char v91 = v144;
    char v90 = v146;
    char v89 = v148;
    char v88 = 0;
    char v87 = v152;
    char v86 = v154;
    v97[0] = v128;
    v97[1] = v129;
    v97[2] = v130;
    char v98 = v131;
    long long v99 = v132;
    long long v100 = v133;
    long long v101 = v134;
    long long v102 = v135;
    char v103 = v136;
    float v104 = v5 * *((float *)&v141 + 1);
    char v105 = 0;
    float v106 = v4;
    char v107 = 0;
    uint64_t v108 = v141;
    char v109 = v142;
    uint64_t v110 = v143;
    char v111 = v144;
    float v112 = v145;
    char v113 = v146;
    unsigned __int32 v114 = v147;
    char v115 = v148;
    float v116 = v5 / v6;
    char v117 = 0;
    BOOL v118 = (float)(v5 / v6) >= 0.9;
    float32x4_t v119 = v151;
    char v120 = v152;
    int v121 = v153;
    char v122 = v154;
    long long v123 = v155;
    long long v124 = v156;
    long long v125 = v157;
    long long v126 = v158;
    nullsub_1(v97);
    goto LABEL_94;
  }
LABEL_93:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22F17C028((uint64_t)v97);
LABEL_94:
  sub_22F1899D0((uint64_t)v97, (uint64_t)v127, qword_268694570);
  return (Swift::OpaquePointer)sub_22F1899D0((uint64_t)v127, (uint64_t)rawValue, qword_268694570);
}

uint64_t sub_22F217640()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268694C60);
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_22F2265A0;
  float v3 = *(float32x2_t **)v1;
  if (*(void *)v1)
  {
    unint64_t v4 = (unint64_t)v3[2];
    if (v4 < 2)
    {
      __break(1u);
    }
    else
    {
      uint64_t v0 = (char *)result;
      float32x2_t v5 = v3[4];
      *(float32x2_t *)&long long v6 = vsub_f32(v3[6], v5);
      float v7 = v3[5].f32[0];
      *((float *)&v6 + 2) = v3[7].f32[0] - v7;
      HIDWORD(v6) = 0;
      *(_OWORD *)(result + 32) = v6;
      if (v4 >= 4)
      {
        *(float32x2_t *)&long long v8 = vsub_f32(v3[10], v5);
        *((void *)&v8 + 1) = COERCE_UNSIGNED_INT(v3[11].f32[0] - v7);
        *(_OWORD *)(result + 48) = v8;
        uint64_t result = swift_bridgeObjectRelease();
        *(void *)(v1 + 24) = v0;
        if (*((void *)v0 + 2) >= 2uLL)
        {
          float32x4_t v9 = *((float32x4_t *)v0 + 2);
          float32x4_t v10 = *((float32x4_t *)v0 + 3);
          float32x4_t v11 = vmulq_f32(v10, v10);
          float32x4_t v12 = vmulq_f32(v9, v9);
          v11.f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2), vaddq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1))).f32[0]);
          v12.f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), vaddq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 1))).f32[0]);
          *(void *)(v1 + 148) = v11.u32[0] | ((unint64_t)v12.u32[0] << 32);
          *(unsigned char *)(v1 + 156) = 0;
          if (v12.f32[0] >= v11.f32[0]) {
            goto LABEL_12;
          }
          float32x4_t v25 = v9;
          float32x4_t v26 = v10;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            goto LABEL_22;
          }
          while (1)
          {
            if (*((void *)v0 + 2))
            {
              *((float32x4_t *)v0 + 2) = v26;
              *(void *)(v1 + 24) = v0;
              uint64_t result = swift_isUniquelyReferenced_nonNull_native();
              if (result) {
                goto LABEL_9;
              }
            }
            else
            {
              __break(1u);
            }
            uint64_t result = (uint64_t)sub_22F20C4D4((uint64_t)v0);
            uint64_t v0 = (char *)result;
LABEL_9:
            if (*((void *)v0 + 2) < 2uLL)
            {
              __break(1u);
              goto LABEL_26;
            }
            *((float32x4_t *)v0 + 3) = v25;
            *(void *)(v1 + 24) = v0;
            if (*(unsigned char *)(v1 + 156)) {
              goto LABEL_29;
            }
            *(int32x2_t *)(v1 + 148) = vrev64_s32(*(int32x2_t *)(v1 + 148));
LABEL_12:
            if (!v0) {
              goto LABEL_27;
            }
            uint64_t v13 = *((void *)v0 + 2);
            if (v13)
            {
              float32x4_t v14 = *((float32x4_t *)v0 + 2);
              int32x4_t v15 = (int32x4_t)vmulq_f32(v14, v14);
              v15.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v15, 2), vadd_f32(*(float32x2_t *)v15.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v15.i8, 1))).u32[0];
              float32x2_t v16 = vrsqrte_f32((float32x2_t)v15.u32[0]);
              float32x2_t v17 = vmul_f32(v16, vrsqrts_f32((float32x2_t)v15.u32[0], vmul_f32(v16, v16)));
              float32x4_t v18 = vmulq_n_f32(v14, vmul_f32(v17, vrsqrts_f32((float32x2_t)v15.u32[0], vmul_f32(v17, v17))).f32[0]);
              *(float32x4_t *)(v1 + 32) = v18;
              *(unsigned char *)(v1 + 48) = 0;
              if (v13 != 1)
              {
                if (*(unsigned char *)(v1 + 224)) {
                  goto LABEL_28;
                }
                float32x4_t v19 = *((float32x4_t *)v0 + 3);
                uint64_t v20 = *(void *)(v1 + 208);
                uint64_t v21 = *(void *)(v1 + 216);
                int32x4_t v22 = (int32x4_t)vmulq_f32(v19, v19);
                v22.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v22, 2), vadd_f32(*(float32x2_t *)v22.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v22.i8, 1))).u32[0];
                float32x2_t v23 = vrsqrte_f32((float32x2_t)v22.u32[0]);
                float32x2_t v24 = vmul_f32(v23, vrsqrts_f32((float32x2_t)v22.u32[0], vmul_f32(v23, v23)));
                *(float32x4_t *)(v1 + 64) = vmulq_n_f32(v19, vmul_f32(v24, vrsqrts_f32((float32x2_t)v22.u32[0], vmul_f32(v24, v24))).f32[0]);
                *(void *)(v1 + 80) = v20;
                *(void *)(v1 + 88) = v21;
                *(float32x4_t *)(v1 + 96) = v18;
                return result;
              }
            }
            else
            {
LABEL_20:
              __break(1u);
            }
            __break(1u);
LABEL_22:
            uint64_t v0 = sub_22F20C4D4((uint64_t)v0);
          }
        }
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
    }
    __break(1u);
    goto LABEL_19;
  }
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t static WorldRectangleData.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a1 + 168);
  uint64_t result = *(unsigned __int8 *)(a2 + 168);
  if ((v3 & 1) == 0) {
    return (*(double *)(a1 + 160) == *(double *)(a2 + 160)) & ~result;
  }
  return result;
}

void sub_22F2178CC(float32x4_t a1)
{
  long long v2 = v1;
  if (!*v1)
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    return;
  }
  char v3 = (int8x16_t *)swift_bridgeObjectRetain();
  uint64_t v4 = sub_22F2163B4(v3, (uint64_t)v1);
  swift_bridgeObjectRelease();
  int64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    uint64_t v29 = (void *)MEMORY[0x263F8EE78];
    sub_22F18FCC8(0, v5, 0);
    uint64_t v6 = 0;
    v7._rawValue = v29;
    unint64_t v8 = v29[2];
    float32x4_t v9 = a1;
    do
    {
      float32x4_t v10 = *(float32x4_t *)(v4 + 16 * v6 + 32);
      unint64_t v11 = v29[3];
      if (v8 >= v11 >> 1)
      {
        float32x4_t v26 = *(float32x4_t *)(v4 + 16 * v6 + 32);
        sub_22F18FCC8((char *)(v11 > 1), v8 + 1, 1);
        float32x4_t v10 = v26;
        float32x4_t v9 = a1;
      }
      ++v6;
      float32x4_t v12 = vmulq_f32(v10, v9);
      v29[2] = v8 + 1;
      *((_DWORD *)v29 + v8++ + 8) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), vaddq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 1))).u32[0];
    }
    while (v5 != v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v7._rawValue = (void *)MEMORY[0x263F8EE78];
  }
  Swift::tuple_index_Int_value_Float_optional v30 = max(_:)(v7);
  indefloat x = v30.value.index;
  uint64_t v14 = *(void *)&v30.is_nil;
  swift_bridgeObjectRelease();
  if ((v14 & 0x100000000) != 0) {
    goto LABEL_40;
  }
  if (index)
  {
    if (index < 0)
    {
LABEL_35:
      __break(1u);
    }
    else
    {
      int32x4_t v15 = (unint64_t *)(v2 + 2);
      while (1)
      {
        float32x2_t v16 = *v2;
        if (!*v2) {
          break;
        }
        if (swift_isUniquelyReferenced_nonNull_native())
        {
          uint64_t v17 = *((void *)v16 + 2);
          if (!v17) {
            goto LABEL_33;
          }
        }
        else
        {
          float32x2_t v16 = sub_22F20C4D4((uint64_t)v16);
          uint64_t v17 = *((void *)v16 + 2);
          if (!v17)
          {
LABEL_33:
            __break(1u);
LABEL_34:
            __break(1u);
            goto LABEL_35;
          }
        }
        uint64_t v18 = v17 - 1;
        long long v28 = *((_OWORD *)v16 + 2);
        memmove(v16 + 32, v16 + 48, 16 * (v17 - 1));
        *((void *)v16 + 2) = v18;
        uint64_t *v2 = v16;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          float32x2_t v16 = sub_22F19B630(0, *((void *)v16 + 2) + 1, 1, v16);
        }
        unint64_t v20 = *((void *)v16 + 2);
        unint64_t v19 = *((void *)v16 + 3);
        if (v20 >= v19 >> 1) {
          float32x2_t v16 = sub_22F19B630((char *)(v19 > 1), v20 + 1, 1, v16);
        }
        *((void *)v16 + 2) = v20 + 1;
        *(_OWORD *)&v16[16 * v20 + 32] = v28;
        uint64_t *v2 = v16;
        unint64_t v21 = (unint64_t)v2[2];
        if (!v21) {
          goto LABEL_37;
        }
        int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
        unint64_t *v15 = v21;
        if (!isUniquelyReferenced_nonNull_bridgeObject || v21 >> 62)
        {
          unint64_t v21 = sub_22F20C4D0(v21);
          unint64_t *v15 = v21;
        }
        uint64_t v23 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (!v23) {
          goto LABEL_34;
        }
        uint64_t v24 = v23 - 1;
        memmove((void *)((v21 & 0xFFFFFFFFFFFFFF8) + 32), (const void *)((v21 & 0xFFFFFFFFFFFFFF8) + 40), 8 * (v23 - 1));
        *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10) = v24;
        uint64_t v25 = sub_22F223CD8();
        if (!*v15) {
          goto LABEL_38;
        }
        MEMORY[0x230FB2700](v25);
        if (*(void *)((*v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_22F223D18();
        }
        sub_22F223D68();
        sub_22F223CD8();
        if (!--index)
        {
          sub_22F217640();
          return;
        }
      }
    }
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
}

uint64_t static WorldRectangleData.pointLiesWithinRectangle(point:rectangle:pointsCoplanar:)(uint64_t result, char a2, __n128 a3)
{
  uint64_t v3 = result;
  if ((a2 & 1) == 0) {
    uint64_t result = _s17MeasureFoundation18WorldRectangleDataV014projectPointToD05point9rectangles5SIMD3VySfGAI_ACtFZ_0(result);
  }
  uint64_t v4 = *(float32x4_t **)(v3 + 24);
  if (!v4) {
    goto LABEL_29;
  }
  __n128 v38 = a3;
  int64_t v5 = v4[1].i64[0];
  uint64_t v6 = (float32x4_t *)MEMORY[0x263F8EE78];
  if (v5)
  {
    __n128 v40 = (float32x2_t *)MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_22F18FD68(0, v5, 0);
    uint64_t v8 = 0;
    uint64_t v6 = (float32x4_t *)v40;
    unint64_t v9 = (unint64_t)v40[2];
    do
    {
      float32x4_t v10 = v4[v8 + 2];
      __n128 v40 = (float32x2_t *)v6;
      unint64_t v11 = v6[1].u64[1];
      if (v9 >= v11 >> 1)
      {
        float32x4_t v34 = v10;
        __int32 v37 = v7;
        sub_22F18FD68((char *)(v11 > 1), v9 + 1, 1);
        float32x4_t v10 = v34;
        __int32 v7 = v37;
        uint64_t v6 = (float32x4_t *)v40;
      }
      ++v8;
      int32x4_t v12 = (int32x4_t)vmulq_f32(v10, v10);
      v12.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v12, 2), vadd_f32(*(float32x2_t *)v12.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v12.i8, 1))).u32[0];
      float32x2_t v13 = vrsqrte_f32((float32x2_t)v12.u32[0]);
      float32x2_t v14 = vmul_f32(v13, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v13, v13)));
      float32x4_t v15 = vmulq_n_f32(v10, vmul_f32(v14, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v14, v14))).f32[0]);
      v15.i32[3] = v7;
      v6[1].i64[0] = v9 + 1;
      v6[v9++ + 2] = v15;
    }
    while (v5 != v8);
    swift_bridgeObjectRelease();
  }
  sub_22F1899D0(v3, (uint64_t)v39, &qword_268696010);
  uint64_t result = sub_22F1899D0((uint64_t)v39, (uint64_t)&v40, &qword_268696010);
  if (!v40) {
    goto LABEL_30;
  }
  if (!*(void *)&v40[2])
  {
    __break(1u);
    goto LABEL_25;
  }
  unint64_t v16 = v6[1].u64[0];
  if (!v16)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  BOOL v17 = 0;
  float32x2_t v18 = v40[4];
  float v19 = v40[5].f32[0];
  *(float32x2_t *)v20.f32 = vsub_f32((float32x2_t)v38.n128_u64[0], v18);
  v20.f32[2] = v38.n128_f32[2] - v19;
  v20.i32[3] = 0;
  float32x4_t v21 = v6[2];
  float32x4_t v22 = vmulq_f32(v20, v21);
  float32x4_t v23 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1)));
  if (v23.f32[0] > 0.0)
  {
    float v24 = v19 + vmulq_laneq_f32(v23, v21, 2).f32[0];
    *(float32x2_t *)v21.f32 = vsub_f32((float32x2_t)v38.n128_u64[0], vadd_f32(v18, vmul_n_f32(*(float32x2_t *)v21.f32, v23.f32[0])));
    v21.f32[2] = v38.n128_f32[2] - v24;
    float32x4_t v25 = vmulq_f32(v21, v21);
    float v26 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v25, 2), vaddq_f32(v25, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v25.f32, 1))).f32[0]);
    if (v26 > 0.0)
    {
      if (v4[1].i64[0] < 2uLL)
      {
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        return result;
      }
      float32x4_t v27 = vmulq_f32(v4[3], v4[3]);
      BOOL v17 = v26 < sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2), vaddq_f32(v27, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 1))).f32[0]);
    }
  }
  if (v16 < 2)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  float32x4_t v35 = v20;
  float32x4_t v36 = v6[3];
  uint64_t result = swift_bridgeObjectRelease();
  float32x4_t v28 = vmulq_f32(v35, v36);
  float32x4_t v29 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2), vaddq_f32(v28, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.f32, 1)));
  if (v29.f32[0] > 0.0)
  {
    float v30 = vmulq_laneq_f32(v29, v36, 2).f32[0];
    *(float32x2_t *)v29.f32 = vsub_f32((float32x2_t)v38.n128_u64[0], vadd_f32(v18, vmul_n_f32(*(float32x2_t *)v36.f32, v29.f32[0])));
    v29.f32[2] = v38.n128_f32[2] - (float)(v19 + v30);
    float32x4_t v31 = vmulq_f32(v29, v29);
    float v32 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v31, 2), vaddq_f32(v31, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v31.f32, 1))).f32[0]);
    if (v32 > 0.0)
    {
      if (v4[1].i64[0])
      {
        float32x4_t v33 = vmulq_f32(v4[2], v4[2]);
        uint64_t result = v32 < sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v33, 2), vaddq_f32(v33, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v33.f32, 1))).f32[0]);
        if (v17) {
          return result;
        }
        return 0;
      }
      goto LABEL_28;
    }
  }
  return 0;
}

uint64_t sub_22F217EE4(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a1 + 168);
  uint64_t result = *(unsigned __int8 *)(a2 + 168);
  if ((v3 & 1) == 0) {
    return (*(double *)(a1 + 160) == *(double *)(a2 + 160)) & ~result;
  }
  return result;
}

uint64_t WorldRectangle.edges.getter()
{
  return sub_22F19D2F4();
}

uint64_t WorldRectangle.splitters.getter()
{
  return sub_22F19D2F4();
}

uint64_t sub_22F217F24@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_data;
  swift_beginAccess();
  sub_22F1899D0(v3, (uint64_t)v5, qword_268694570);
  sub_22F1899D0((uint64_t)v5, a2, qword_268694570);
  return sub_22F21A848((uint64_t)v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_22F21A7BC);
}

uint64_t sub_22F217FBC(uint64_t a1, void *a2)
{
  sub_22F1899D0(a1, (uint64_t)v5, qword_268694570);
  uint64_t v3 = *a2 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_data;
  swift_beginAccess();
  sub_22F1899D0(v3, (uint64_t)v6, qword_268694570);
  sub_22F1899D0((uint64_t)v5, v3, qword_268694570);
  sub_22F21A848((uint64_t)v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_22F21A7BC);
  return sub_22F21A848((uint64_t)v6, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_22F21A8D4);
}

uint64_t WorldRectangle.data.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_data;
  swift_beginAccess();
  sub_22F1899D0(v3, (uint64_t)v5, qword_268694570);
  sub_22F21A848((uint64_t)v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_22F21A7BC);
  return sub_22F1899D0((uint64_t)v5, a1, qword_268694570);
}

uint64_t WorldRectangle.rectangleDataBuffer.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_rectangleDataBuffer);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t WorldRectangle.rectangleDataBuffer.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int32 v7 = (void *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_rectangleDataBuffer);
  swift_beginAccess();
  *__int32 v7 = a1;
  v7[1] = a2;
  _OWORD v7[2] = a3;
  return swift_bridgeObjectRelease();
}

uint64_t (*WorldRectangle.rectangleDataBuffer.modify())()
{
  return j__swift_endAccess;
}

uint64_t WorldRectangle.state.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state);
  uint64_t v2 = *(os_unfair_lock_s **)(v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v2);
  swift_beginAccess();
  uint64_t v3 = *(void *)(v1 + 16);
  os_unfair_lock_unlock(v2);
  swift_release();
  return v3;
}

uint64_t WorldRectangle.state.setter(uint64_t a1)
{
  uint64_t v3 = OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state;
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state);
  int64_t v5 = *(os_unfair_lock_s **)(v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  uint64_t v6 = *(void *)(v4 + 16);
  os_unfair_lock_unlock(v5);
  swift_release();
  uint64_t v7 = *(void *)(v1 + v3);
  uint64_t v8 = *(os_unfair_lock_s **)(v7 + 24);
  swift_retain();
  os_unfair_lock_lock(v8);
  swift_beginAccess();
  *(void *)(v7 + 16) = a1;
  os_unfair_lock_unlock(v8);
  swift_release();
  return sub_22F218454(v6);
}

uint64_t sub_22F218454(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = &qword_268695000;
  uint64_t v5 = OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state;
  uint64_t v6 = *(void *)&v2[OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state];
  uint64_t v7 = *(os_unfair_lock_s **)(v6 + 24);
  swift_retain();
  os_unfair_lock_lock(v7);
  swift_beginAccess();
  uint64_t v8 = *(void *)(v6 + 16);
  os_unfair_lock_unlock(v7);
  uint64_t result = swift_release();
  if (v8 == a1) {
    return result;
  }
  uint64_t v10 = *(void *)&v2[v5];
  unint64_t v11 = *(os_unfair_lock_s **)(v10 + 24);
  swift_retain();
  os_unfair_lock_lock(v11);
  swift_beginAccess();
  uint64_t v12 = *(void *)(v10 + 16);
  os_unfair_lock_unlock(v11);
  swift_release();
  if (v12 == 6)
  {
    uint64_t v13 = OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationTimer;
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationTimer], sel_invalidate);
    float32x2_t v14 = self;
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v2;
    aBlock[4] = sub_22F21B014;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22F219894;
    aBlock[3] = &block_descriptor_32;
    unint64_t v16 = _Block_copy(aBlock);
    BOOL v17 = v2;
    swift_release();
    id v18 = objc_msgSend(v14, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v16, 2.0);
    _Block_release(v16);
    float v19 = *(void **)&v2[v13];
    *(void *)&v2[v13] = v18;
  }
  float32x4_t v20 = &v2[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_edges];
  swift_beginAccess();
  uint64_t v21 = *(void *)v20;
  uint64_t v58 = v5;
  if (*(void *)v20 >> 62) {
    goto LABEL_23;
  }
  uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v22)
  {
LABEL_24:
    swift_bridgeObjectRelease();
    uint64_t v47 = &v2[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_splitters];
    swift_beginAccess();
    unint64_t v48 = *(void *)v47;
    if (v48 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_22F2245C8();
      uint64_t v49 = result;
      if (result) {
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v49 = *(void *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      if (v49)
      {
LABEL_26:
        if (v49 < 1) {
          goto LABEL_36;
        }
        uint64_t v50 = 0;
        do
        {
          if ((v48 & 0xC000000000000001) != 0) {
            int8x16_t v51 = (char *)MEMORY[0x230FB2E90](v50, v48);
          }
          else {
            int8x16_t v51 = (char *)*(id *)(v48 + 8 * v50 + 32);
          }
          uint64_t v52 = v51;
          ++v50;
          uint64_t v53 = *(void *)&v2[v58];
          int8x16_t v54 = *(os_unfair_lock_s **)(v53 + 24);
          swift_retain();
          os_unfair_lock_lock(v54);
          swift_beginAccess();
          uint64_t v55 = *(void *)(v53 + 16);
          os_unfair_lock_unlock(v54);
          swift_release();
          uint64_t v56 = *(void *)&v52[v4[87]];
          uint64_t v57 = *(os_unfair_lock_s **)(v56 + 24);
          swift_retain();
          os_unfair_lock_lock(v57);
          swift_beginAccess();
          *(void *)(v56 + 16) = v55;
          os_unfair_lock_unlock(v57);

          swift_release();
        }
        while (v49 != v50);
      }
    }
    return swift_bridgeObjectRelease();
  }
LABEL_6:
  if (v22 >= 1)
  {
    uint64_t v23 = 0;
    while (1)
    {
      if ((v21 & 0xC000000000000001) != 0) {
        float v24 = (char *)MEMORY[0x230FB2E90](v23, v21);
      }
      else {
        float v24 = (char *)*(id *)(v21 + 8 * v23 + 32);
      }
      float32x4_t v25 = v24;
      uint64_t v26 = *(void *)&v2[v58];
      float32x4_t v27 = *(os_unfair_lock_s **)(v26 + 24);
      swift_retain();
      os_unfair_lock_lock(v27);
      swift_beginAccess();
      uint64_t v28 = *(void *)(v26 + 16);
      os_unfair_lock_unlock(v27);
      swift_release();
      uint64_t v29 = *(void *)&v25[v4[87]];
      float v30 = *(os_unfair_lock_s **)(v29 + 24);
      swift_retain();
      os_unfair_lock_lock(v30);
      swift_beginAccess();
      *(void *)(v29 + 16) = v28;
      os_unfair_lock_unlock(v30);
      swift_release();
      float32x4_t v31 = &v25[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends];
      swift_beginAccess();
      uint64_t v32 = *(void *)v31;
      if ((*(void *)v31 & 0xC000000000000001) != 0)
      {
        swift_bridgeObjectRetain();
        id v33 = (id)MEMORY[0x230FB2E90](0, v32);
        swift_bridgeObjectRelease();
      }
      else
      {
        if (!*(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_22:
          __break(1u);
LABEL_23:
          swift_bridgeObjectRetain();
          uint64_t result = sub_22F2245C8();
          uint64_t v22 = result;
          if (!result) {
            goto LABEL_24;
          }
          goto LABEL_6;
        }
        id v33 = *(id *)(v32 + 32);
      }
      uint64_t v34 = *(void *)&v2[v58];
      float32x4_t v35 = *(os_unfair_lock_s **)(v34 + 24);
      swift_retain();
      os_unfair_lock_lock(v35);
      swift_beginAccess();
      uint64_t v4 = *(uint64_t **)(v34 + 16);
      os_unfair_lock_unlock(v35);
      swift_release();
      WorldPoint.state.setter((uint64_t)v4);

      uint64_t v36 = *(void *)v31;
      if ((v36 & 0xC000000000000001) != 0)
      {
        swift_bridgeObjectRetain();
        id v37 = (id)MEMORY[0x230FB2E90](1, v36);
        swift_bridgeObjectRelease();
      }
      else
      {
        if (*(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL) {
          goto LABEL_22;
        }
        id v37 = *(id *)(v36 + 40);
      }
      ++v23;
      uint64_t v38 = *(void *)&v2[v58];
      __n128 v39 = *(os_unfair_lock_s **)(v38 + 24);
      swift_retain();
      os_unfair_lock_lock(v39);
      swift_beginAccess();
      uint64_t v40 = *(void *)(v38 + 16);
      os_unfair_lock_unlock(v39);
      swift_release();
      WorldPoint.state.setter(v40);

      float v41 = (void **)&v25[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_center];
      swift_beginAccess();
      unint64_t v42 = *v41;
      uint64_t v43 = *(void *)&v2[v58];
      float32x2_t v44 = *(os_unfair_lock_s **)(v43 + 24);
      id v45 = v42;
      swift_retain();
      os_unfair_lock_lock(v44);
      swift_beginAccess();
      uint64_t v46 = *(void *)(v43 + 16);
      os_unfair_lock_unlock(v44);
      swift_release();
      WorldPoint.state.setter(v46);

      uint64_t v4 = &qword_268695000;
      if (v22 == v23) {
        goto LABEL_24;
      }
    }
  }
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

void (*WorldRectangle.state.modify(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x90uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state;
  v3[16] = v1;
  v3[17] = v4;
  uint64_t v5 = *(void *)(v1 + v4);
  uint64_t v6 = *(os_unfair_lock_s **)(v5 + 24);
  swift_retain();
  os_unfair_lock_lock(v6);
  swift_beginAccess();
  uint64_t v7 = *(void *)(v5 + 16);
  os_unfair_lock_unlock(v6);
  swift_release();
  v3[15] = v7;
  return sub_22F218B40;
}

void sub_22F218B40(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void *)(*(void *)a1 + 120);
  uint64_t v3 = *(void *)(*(void *)(*(void *)a1 + 128) + *(void *)(*(void *)a1 + 136));
  uint64_t v4 = *(os_unfair_lock_s **)(v3 + 24);
  swift_retain();
  os_unfair_lock_lock(v4);
  uint64_t v5 = v1[16];
  uint64_t v6 = v1[17];
  swift_beginAccess();
  uint64_t v7 = *(void *)(v3 + 16);
  os_unfair_lock_unlock(v4);
  swift_release();
  uint64_t v8 = *(void *)(v5 + v6);
  unint64_t v9 = *(os_unfair_lock_s **)(v8 + 24);
  swift_retain();
  os_unfair_lock_lock(v9);
  swift_beginAccess();
  *(void *)(v8 + 16) = v2;
  os_unfair_lock_unlock(v9);
  swift_release();
  sub_22F218454(v7);
  free(v1);
}

uint64_t WorldRectangle.__allocating_init(data:edges:splitters:)(const void *a1, unint64_t a2, unint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return WorldRectangle.init(data:edges:splitters:)(a1, a2, a3);
}

uint64_t WorldRectangle.init(data:edges:splitters:)(const void *a1, unint64_t a2, unint64_t a3)
{
  id v7 = (char *)MEMORY[0x263F8EE78];
  *(void *)&v3[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_edges] = MEMORY[0x263F8EE78];
  *(void *)&v3[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_splitters] = v7;
  uint64_t v8 = (uint64_t)&v3[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_data];
  sub_22F17C028((uint64_t)v58);
  sub_22F1899D0((uint64_t)v58, v8, qword_268694570);
  unint64_t v9 = &v3[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_rectangleDataBuffer];
  uint64_t v10 = v3;
  unint64_t v11 = sub_22F19C0BC(0, 10, 0, v7);
  *(_OWORD *)unint64_t v9 = xmmword_22F22B4B0;
  *((void *)v9 + 2) = v11;
  *(void *)&v10[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationTime] = 0x4000000000000000;
  *(void *)&v10[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationTimer] = 0;
  uint64_t v12 = &v10[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationAction];
  *(void *)uint64_t v12 = 0;
  *((void *)v12 + 1) = 0;

  v57.receiver = v10;
  v57.super_class = (Class)type metadata accessor for WorldRectangle();
  uint64_t v13 = (char *)objc_msgSendSuper2(&v57, sel_init);
  uint64_t v14 = OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state;
  uint64_t v15 = *(void *)&v13[OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state];
  unint64_t v16 = *(os_unfair_lock_s **)(v15 + 24);
  BOOL v17 = v13;
  swift_retain();
  os_unfair_lock_lock(v16);
  swift_beginAccess();
  uint64_t v18 = *(void *)(v15 + 16);
  os_unfair_lock_unlock(v16);
  swift_release();
  uint64_t v19 = *(void *)&v13[v14];
  float32x4_t v20 = *(os_unfair_lock_s **)(v19 + 24);
  swift_retain();
  os_unfair_lock_lock(v20);
  swift_beginAccess();
  *(void *)(v19 + 16) = 1;
  os_unfair_lock_unlock(v20);
  swift_release();
  sub_22F218454(v18);
  memcpy(__dst, a1, sizeof(__dst));
  nullsub_1(__dst);
  uint64_t v21 = (uint64_t)&v17[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_data];
  swift_beginAccess();
  sub_22F1899D0(v21, (uint64_t)v60, qword_268694570);
  sub_22F1899D0((uint64_t)__dst, v21, qword_268694570);
  sub_22F21A848((uint64_t)v60, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_22F21A8D4);
  uint64_t v22 = &v17[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_edges];
  swift_beginAccess();
  *(void *)uint64_t v22 = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v23 = &v17[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_splitters];
  swift_beginAccess();
  *(void *)uint64_t v23 = a3;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = sub_22F2245C8();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v25 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v25)
  {
    if (v25 < 1)
    {
      __break(1u);
      goto LABEL_25;
    }
    uint64_t v26 = (uint64_t *)&v17[OBJC_IVAR____TtC17MeasureFoundation13MeasureObject_id];
    if ((a2 & 0xC000000000000001) != 0)
    {
      swift_beginAccess();
      uint64_t v27 = 0;
      do
      {
        MEMORY[0x230FB2E90](v27++, a2);
        uint64_t v28 = *v26;
        uint64_t v29 = (void *)v26[1];
        swift_bridgeObjectRetain();
        v30._uint64_t countAndFlagsBits = v28;
        v30._object = v29;
        WorldLine.markAsPartOfComposedObject(withId:)(v30);
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
      }
      while (v25 != v27);
    }
    else
    {
      swift_beginAccess();
      uint64_t v31 = 0;
      do
      {
        uint64_t v32 = *(void **)(a2 + 8 * v31++ + 32);
        uint64_t v33 = *v26;
        uint64_t v34 = (void *)v26[1];
        id v35 = v32;
        swift_bridgeObjectRetain();
        v36._uint64_t countAndFlagsBits = v33;
        v36._object = v34;
        WorldLine.markAsPartOfComposedObject(withId:)(v36);

        swift_bridgeObjectRelease();
      }
      while (v25 != v31);
    }
  }
  uint64_t result = swift_bridgeObjectRelease();
  if (!(a3 >> 62))
  {
    uint64_t v37 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v37) {
      goto LABEL_13;
    }
LABEL_20:
    swift_bridgeObjectRelease();
    uint64_t v49 = OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationTimer;
    objc_msgSend(*(id *)&v17[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationTimer], sel_invalidate);
    uint64_t v50 = self;
    uint64_t v51 = swift_allocObject();
    *(void *)(v51 + 16) = v17;
    aBlock[4] = sub_22F21A970;
    aBlock[5] = v51;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22F219894;
    aBlock[3] = &block_descriptor_4;
    uint64_t v52 = _Block_copy(aBlock);
    uint64_t v53 = v17;
    swift_release();
    id v54 = objc_msgSend(v50, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v52, 2.0);
    _Block_release(v52);
    uint64_t v55 = *(void **)&v17[v49];
    *(void *)&v17[v49] = v54;

    return (uint64_t)v53;
  }
  swift_bridgeObjectRetain();
  uint64_t v37 = sub_22F2245C8();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v37) {
    goto LABEL_20;
  }
LABEL_13:
  if (v37 >= 1)
  {
    uint64_t v38 = (uint64_t *)&v17[OBJC_IVAR____TtC17MeasureFoundation13MeasureObject_id];
    if ((a3 & 0xC000000000000001) != 0)
    {
      swift_beginAccess();
      uint64_t v39 = 0;
      do
      {
        MEMORY[0x230FB2E90](v39++, a3);
        uint64_t v40 = *v38;
        float v41 = (void *)v38[1];
        swift_bridgeObjectRetain();
        v42._uint64_t countAndFlagsBits = v40;
        v42._object = v41;
        WorldLine.markAsPartOfComposedObject(withId:)(v42);
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
      }
      while (v37 != v39);
    }
    else
    {
      swift_beginAccess();
      uint64_t v43 = 0;
      do
      {
        float32x2_t v44 = *(void **)(a3 + 8 * v43++ + 32);
        uint64_t v45 = *v38;
        uint64_t v46 = (void *)v38[1];
        id v47 = v44;
        swift_bridgeObjectRetain();
        v48._uint64_t countAndFlagsBits = v45;
        v48._object = v46;
        WorldLine.markAsPartOfComposedObject(withId:)(v48);

        swift_bridgeObjectRelease();
      }
      while (v37 != v43);
    }
    goto LABEL_20;
  }
LABEL_25:
  __break(1u);
  return result;
}

void WorldRectangle.updateLinesWithRectangle(_:onExpiration:)(void *__src, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  memcpy(__dst, __src, sizeof(__dst));
  uint64_t v8 = (uint64_t)&v4[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_data];
  swift_beginAccess();
  sub_22F1899D0(v8, (uint64_t)v50, qword_268694570);
  sub_22F1899D0((uint64_t)v50, (uint64_t)v51, qword_268694570);
  if (sub_22F21A990(v51) == 1)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v53)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  __int32 v9 = v52.i32[0];
  float32x4_t v44 = v52;
  sub_22F1899D0((uint64_t)v50, (uint64_t)&v48, qword_268694570);
  if (v48)
  {
    if (!*(void *)&v48[2]) {
      goto LABEL_30;
    }
    *(float32x2_t *)v10.f32 = vsub_f32((float32x2_t)__PAIR64__(v44.u32[1], v9), v48[4]);
    v10.f32[2] = v44.f32[2] - v48[5].f32[0];
    int32x4_t v11 = (int32x4_t)vmulq_f32(v10, v10);
    v11.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v11, 2), vadd_f32(*(float32x2_t *)v11.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v11.i8, 1))).u32[0];
    float32x2_t v12 = vrsqrte_f32((float32x2_t)v11.u32[0]);
    float32x2_t v13 = vmul_f32(v12, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v12, v12)));
    float32x4_t v44 = vmulq_n_f32(v10, vmul_f32(v13, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v13, v13))).f32[0]);
    sub_22F21A9B4((uint64_t)__src);
    sub_22F2178CC(v44);
    uint64_t v14 = &v4[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_edges];
    swift_beginAccess();
    uint64_t v43 = v4;
    v44.i64[0] = (uint64_t)v14;
    uint64_t v41 = a2;
    uint64_t v42 = a3;
    uint64_t v40 = v8;
    if (*(void *)v14 >> 62) {
      goto LABEL_31;
    }
    uint64_t v15 = *(void *)((*(void *)v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    do
    {
      if (!v15)
      {
LABEL_25:
        memcpy(v46, __dst, sizeof(v46));
        nullsub_1(v46);
        sub_22F1899D0(v40, (uint64_t)v47, qword_268694570);
        sub_22F1899D0((uint64_t)v46, v40, qword_268694570);
        sub_22F21A848((uint64_t)v47, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_22F21A8D4);
        uint64_t v31 = (uint64_t *)&v43[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationAction];
        uint64_t v32 = *(void *)&v43[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationAction];
        *uint64_t v31 = v41;
        v31[1] = v42;
        sub_22F1B4AD8(v41);
        sub_22F1B4AC8(v32);
        uint64_t v33 = OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationTimer;
        objc_msgSend(*(id *)&v43[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationTimer], sel_invalidate);
        uint64_t v34 = self;
        uint64_t v35 = swift_allocObject();
        *(void *)(v35 + 16) = v43;
        aBlock[4] = sub_22F21B014;
        aBlock[5] = v35;
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_22F219894;
        aBlock[3] = &block_descriptor_7;
        Swift::String v36 = _Block_copy(aBlock);
        uint64_t v37 = v43;
        swift_release();
        id v38 = objc_msgSend(v34, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v36, 2.0);
        _Block_release(v36);
        uint64_t v39 = *(void **)&v43[v33];
        *(void *)&v43[v33] = v38;

        return;
      }
      unint64_t v16 = 0;
      uint64_t v17 = __dst[2];
      unint64_t v18 = __dst[2] & 0xC000000000000001;
      uint64_t v19 = __dst[2] & 0xFFFFFFFFFFFFFF8;
      while (v15 != v16)
      {
        uint64_t v20 = *(void *)v44.i64[0];
        if ((*(void *)v44.i64[0] & 0xC000000000000001) != 0)
        {
          swift_bridgeObjectRetain();
          uint64_t v21 = (char *)MEMORY[0x230FB2E90](v16, v20);
          swift_bridgeObjectRelease();
        }
        else
        {
          if (v16 >= *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_27;
          }
          uint64_t v21 = (char *)*(id *)(v20 + 8 * v16 + 32);
        }
        uint64_t v22 = &v21[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends];
        swift_beginAccess();
        uint64_t v23 = *(void *)v22;
        swift_bridgeObjectRetain();

        if ((v23 & 0xC000000000000001) != 0)
        {
          float v24 = (char *)MEMORY[0x230FB2E90](0, v23);
        }
        else
        {
          if (!*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_28;
          }
          float v24 = (char *)*(id *)(v23 + 32);
        }
        uint64_t v25 = v24;
        swift_bridgeObjectRelease();
        if (!v17) {
          goto LABEL_33;
        }
        if (v18)
        {
          swift_bridgeObjectRetain();
          uint64_t v26 = MEMORY[0x230FB2E90](v16, v17);
          swift_bridgeObjectRelease();
        }
        else
        {
          if (v16 >= *(void *)(v19 + 16)) {
            goto LABEL_29;
          }
          uint64_t v26 = *(void *)(v17 + 8 * v16 + 32);
          swift_retain();
        }
        ++v16;
        uint64_t v27 = sub_22F207054(v26, 2u);
        swift_release();
        uint64_t v28 = &v25[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
        swift_beginAccess();
        uint64_t v29 = *(void *)v28;
        Swift::String v30 = *(os_unfair_lock_s **)(v29 + 24);
        swift_retain();
        swift_retain();
        os_unfair_lock_lock(v30);
        swift_beginAccess();
        *(void *)(v29 + 16) = v27;
        swift_retain();
        swift_release();
        os_unfair_lock_unlock(v30);
        swift_release();
        swift_release();
        sub_22F213438();

        swift_release();
        if (v15 == v16) {
          goto LABEL_25;
        }
      }
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
LABEL_30:
      __break(1u);
LABEL_31:
      swift_bridgeObjectRetain();
      uint64_t v15 = sub_22F2245C8();
      swift_bridgeObjectRelease();
    }
    while ((v15 & 0x8000000000000000) == 0);
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
LABEL_36:
  __break(1u);
}

uint64_t sub_22F2197CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state);
  uint64_t v5 = *(os_unfair_lock_s **)(v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  uint64_t v6 = *(void *)(v4 + 16);
  os_unfair_lock_unlock(v5);
  uint64_t result = swift_release();
  if (v6 != 5 && v6 != 9)
  {
    __int32 v9 = *(void (**)(uint64_t))(a2 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationAction);
    if (v9)
    {
      swift_retain();
      v9(a1);
      return sub_22F1B4AC8((uint64_t)v9);
    }
  }
  return result;
}

void sub_22F219894(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

Swift::Void __swiftcall WorldRectangle.cleanup()()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_edges);
  swift_beginAccess();
  uint64_t v2 = *v1;
  if ((unint64_t)*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_22F2245C8();
    if (!v3) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v3) {
      goto LABEL_10;
    }
  }
  if (v3 < 1)
  {
    __break(1u);
    return;
  }
  for (uint64_t i = 0; i != v3; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v5 = (id)MEMORY[0x230FB2E90](i, v2);
    }
    else {
      id v5 = *(id *)(v2 + 8 * i + 32);
    }
    uint64_t v6 = v5;
    WorldLine.cleanup()();
  }
LABEL_10:
  swift_bridgeObjectRelease();
  if (qword_268694538 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_26869BE90;
  uint64_t v8 = *(void *)algn_26869BE98;
  sub_22F2243F8();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_22F223B48();
  swift_bridgeObjectRelease();
  sub_22F223B48();
  uint64_t v9 = sub_22F2240C8();
  _s17MeasureFoundation3LogV3log_4type9isPrivateySS_So03os_d1_E2_taSbtF_0(0x636552646C726F57, 0xEF20656C676E6174, v9, 0, v7, v8);
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall WorldRectangle.rememberCurrentRectangle()()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_rectangleDataBuffer);
  char v2 = 1;
  swift_beginAccess();
  uint64_t v3 = v1[2];
  unint64_t v4 = *(void *)(v3 + 16);
  if (v4)
  {
    uint64_t v5 = *v1;
    if (*v1)
    {
      uint64_t v6 = v1[1];
      if (v6 == 0x8000000000000000 && v5 == -1) {
        goto LABEL_21;
      }
      unint64_t v8 = v6 % v5;
      if (v8 < v4)
      {
        uint64_t v9 = v3 + 304 * v8;
        double v10 = *(double *)(v9 + 192);
        char v2 = *(unsigned char *)(v9 + 200);
        goto LABEL_10;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  double v10 = 0.0;
LABEL_10:
  uint64_t v11 = v0 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_data;
  swift_beginAccess();
  sub_22F1899D0(v11, (uint64_t)v14, qword_268694570);
  sub_22F1899D0((uint64_t)v14, (uint64_t)v15, qword_268694570);
  if (sub_22F21A990(v15) == 1)
  {
LABEL_22:
    __break(1u);
    return;
  }
  char v12 = v16;
  if (v2)
  {
    if (v16) {
      return;
    }
    goto LABEL_17;
  }
  if (v10 != *(double *)&v15[20]) {
    char v12 = 1;
  }
  if (v12)
  {
LABEL_17:
    sub_22F1899D0((uint64_t)v14, (uint64_t)v13, qword_268694570);
    memcpy(__dst, v13, sizeof(__dst));
    sub_22F21A9B4((uint64_t)v13);
    sub_22F216514(__dst);
    sub_22F21A848((uint64_t)v14, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_22F21A8D4);
  }
}

id WorldRectangle.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void WorldRectangle.init()()
{
}

uint64_t sub_22F219D1C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22F1899D0(v0 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_data, (uint64_t)v2, qword_268694570);
  sub_22F21A848((uint64_t)v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_22F21A8D4);
  swift_bridgeObjectRelease();

  return sub_22F1B4AC8(*(void *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationAction));
}

id WorldRectangle.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WorldRectangle();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22F219EBC(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  if (v1)
  {
    uint64_t v2 = 0;
    unint64_t v3 = 4;
    if ((unint64_t)(v1 - 1) < 4) {
      unint64_t v3 = v1 - 1;
    }
    long long v4 = 0uLL;
    do
    {
      if ((unint64_t)(v1 - 1) > 3)
      {
        __break(1u);
        goto LABEL_10;
      }
      int v5 = *(_DWORD *)(result + 32 + 4 * v2);
      long long v6 = v4;
      *(_DWORD *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3))) = v5;
      long long v4 = v6;
      ++v2;
    }
    while (v1 != v2);
    if (v3 < 3) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_10:
    __break(1u);
  }
  return result;
}

float32x4_t *sub_22F219F2C(float32x4_t *result, double a2, double a3, double a4, __n128 a5, __n128 a6)
{
  if (result[1].i64[0] == 4)
  {
    uint64_t v6 = 0;
    float32x4_t v7 = result[2];
    result += 2;
    float32x4_t v8 = v7;
    uint64_t v9 = result + 1;
    float v10 = 0.0;
    do
    {
      float32x4_t v26 = v9[-1];
      if (v6 == 3)
      {
        uint64_t v11 = 2;
        float32x4_t v12 = v8;
      }
      else
      {
        float32x4_t v12 = *v9;
        if (!v6)
        {
          float32x4_t v13 = result[3];
          goto LABEL_5;
        }
        uint64_t v11 = v6 - 1;
        if ((unint64_t)(v6 - 1) > 3)
        {
          __break(1u);
          return result;
        }
      }
      float32x4_t v13 = result[v11];
LABEL_5:
      float32x4_t v14 = vsubq_f32(v12, v26);
      int32x4_t v15 = (int32x4_t)vmulq_f32(v14, v14);
      v15.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v15, 2), vadd_f32(*(float32x2_t *)v15.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v15.i8, 1))).u32[0];
      float32x2_t v16 = vrsqrte_f32((float32x2_t)v15.u32[0]);
      float32x2_t v17 = vmul_f32(v16, vrsqrts_f32((float32x2_t)v15.u32[0], vmul_f32(v16, v16)));
      float32x4_t v18 = vmulq_n_f32(v14, vmul_f32(v17, vrsqrts_f32((float32x2_t)v15.u32[0], vmul_f32(v17, v17))).f32[0]);
      v18.i32[3] = a6.n128_i32[3];
      float32x4_t v19 = vsubq_f32(v13, v26);
      int32x4_t v20 = (int32x4_t)vmulq_f32(v19, v19);
      v20.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v20, 2), vadd_f32(*(float32x2_t *)v20.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v20.i8, 1))).u32[0];
      float32x2_t v21 = vrsqrte_f32((float32x2_t)v20.u32[0]);
      float32x2_t v22 = vmul_f32(v21, vrsqrts_f32((float32x2_t)v20.u32[0], vmul_f32(v21, v21)));
      float32x4_t v23 = vmulq_n_f32(v19, vmul_f32(v22, vrsqrts_f32((float32x2_t)v20.u32[0], vmul_f32(v22, v22))).f32[0]);
      v23.i32[3] = a5.n128_i32[3];
      float32x4_t v24 = vmulq_f32(v18, v23);
      ++v6;
      float v25 = fabsf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v24, 2), vaddq_f32(v24, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.f32, 1))).f32[0]);
      if (v10 < v25) {
        float v10 = v25;
      }
      ++v9;
      a6.n128_u32[3] = v18.u32[3];
      a5.n128_u32[3] = v23.u32[3];
    }
    while (v6 != 4);
  }
  return result;
}

uint64_t sub_22F21A04C(uint64_t a1, int32x4_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268694C60);
  int v5 = (_OWORD *)swift_allocObject();
  v5[1] = xmmword_22F227B00;
  unint64_t v6 = *(void *)(a1 + 16);
  if (v6 < 2)
  {
    __break(1u);
    goto LABEL_42;
  }
  float v7 = *(float *)(a1 + 32);
  float v8 = *(float *)(a1 + 48);
  float v9 = *(float *)(a1 + 52);
  float v10 = *(float *)(a1 + 36);
  float v11 = *(float *)(a1 + 40);
  float v12 = *(float *)(a1 + 56);
  HIDWORD(v13) = 0;
  HIDWORD(v14) = 0;
  *(float *)&long long v14 = v8 - v7;
  *((float *)&v14 + 1) = v9 - v10;
  *((float *)&v14 + 2) = v12 - v11;
  v102.i64[0] = (uint64_t)(v5 + 2);
  double v5[2] = v14;
  if (v6 == 2)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  float v15 = *(float *)(a1 + 64);
  float v16 = *(float *)(a1 + 68);
  float v17 = v15 - v8;
  float v18 = *(float *)(a1 + 72);
  *(float *)&long long v13 = v17;
  *((float *)&v13 + 1) = v16 - v9;
  *((float *)&v13 + 2) = v18 - v12;
  v5[3] = v13;
  if (v6 == 3)
  {
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  unint64_t v91 = v6;
  uint64_t v88 = a1 + 32;
  float v19 = *(float *)(a1 + 80);
  float v20 = *(float *)(a1 + 84);
  float v21 = *(float *)(a1 + 88);
  HIDWORD(v22) = 0;
  *(float *)&long long v22 = v19 - v15;
  *((float *)&v22 + 1) = v20 - v16;
  *((float *)&v22 + 2) = v21 - v18;
  *(float *)&long long v23 = v7 - v19;
  *((float *)&v23 + 1) = v10 - v20;
  *((void *)&v23 + 1) = COERCE_UNSIGNED_INT(v11 - v21);
  v5[4] = v22;
  v5[5] = v23;
  uint64_t v90 = a1;
  swift_bridgeObjectRetain();
  unint64_t v3 = 0;
  unint64_t v24 = 0;
  float v25 = (char *)MEMORY[0x263F8EE78];
  float v26 = 2.0;
  unint64_t v2 = 1;
  uint64_t v27 = 3;
  *(void *)&long long v103 = MEMORY[0x263F8EE78];
  do
  {
    if (v24 == 3) {
      unint64_t v28 = 0;
    }
    else {
      unint64_t v28 = v24 + 1;
    }
    a1 = ((_BYTE)v24 - 1) & 3;
    float32x4_t v92 = *(float32x4_t *)(v102.i64[0] + 16 * v24);
    float32x4_t v94 = *(float32x4_t *)(v102.i64[0] + 16 * a1);
    uint64_t v29 = (char *)v103;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v29 = sub_22F19B63C(0, *(void *)(v103 + 16) + 1, 1, (char *)v103);
    }
    unint64_t v31 = *((void *)v29 + 2);
    unint64_t v30 = *((void *)v29 + 3);
    __int32 v33 = v97;
    __int32 v32 = v98;
    if (v31 >= v30 >> 1)
    {
      uint64_t v60 = sub_22F19B63C((char *)(v30 > 1), v31 + 1, 1, v29);
      __int32 v33 = v97;
      __int32 v32 = v98;
      uint64_t v29 = v60;
    }
    int32x4_t v34 = (int32x4_t)vmulq_f32(v92, v92);
    v34.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v34, 2), vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v34.i8, 1))).u32[0];
    float32x2_t v35 = vrsqrte_f32((float32x2_t)v34.u32[0]);
    float32x2_t v36 = vmul_f32(v35, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v35, v35)));
    float32x4_t v37 = vmulq_n_f32(v92, vmul_f32(v36, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v36, v36))).f32[0]);
    v37.i32[3] = v33;
    int32x4_t v38 = (int32x4_t)vmulq_f32(v94, v94);
    v38.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v38, 2), vadd_f32(*(float32x2_t *)v38.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v38.i8, 1))).u32[0];
    float32x2_t v39 = vrsqrte_f32((float32x2_t)v38.u32[0]);
    float32x2_t v40 = vmul_f32(v39, vrsqrts_f32((float32x2_t)v38.u32[0], vmul_f32(v39, v39)));
    float32x4_t v41 = vmulq_n_f32(v94, vmul_f32(v40, vrsqrts_f32((float32x2_t)v38.u32[0], vmul_f32(v40, v40))).f32[0]);
    v41.i32[3] = v32;
    __int32 v99 = v33;
    __int32 v95 = v32;
    float32x4_t v42 = vmulq_f32(v37, v41);
    float v43 = fabsf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v42, 2), vaddq_f32(v42, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v42.f32, 1))).f32[0]);
    *((void *)v29 + 2) = v31 + 1;
    *(void *)&long long v103 = v29;
    float32x4_t v44 = v29 + 32;
    *(float *)&v44[4 * v31] = v43;
    float32x4_t v93 = *(float32x4_t *)(v102.i64[0] + 16 * v24);
    float32x4_t v96 = *(float32x4_t *)(v102.i64[0] + 16 * v28);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      float v25 = sub_22F19B63C(0, *((void *)v25 + 2) + 1, 1, v25);
    }
    unint64_t v46 = *((void *)v25 + 2);
    unint64_t v45 = *((void *)v25 + 3);
    __int32 v47 = v100.i32[3];
    __int32 v48 = v101.i32[3];
    if (v46 >= v45 >> 1)
    {
      int8x16_t v61 = sub_22F19B63C((char *)(v45 > 1), v46 + 1, 1, v25);
      __int32 v47 = v100.i32[3];
      __int32 v48 = v101.i32[3];
      float v25 = v61;
    }
    int32x4_t v49 = (int32x4_t)vmulq_f32(v93, v93);
    v49.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v49, 2), vadd_f32(*(float32x2_t *)v49.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v49.i8, 1))).u32[0];
    float32x2_t v50 = vrsqrte_f32((float32x2_t)v49.u32[0]);
    float32x2_t v51 = vmul_f32(v50, vrsqrts_f32((float32x2_t)v49.u32[0], vmul_f32(v50, v50)));
    float32x4_t v52 = vmulq_n_f32(v93, vmul_f32(v51, vrsqrts_f32((float32x2_t)v49.u32[0], vmul_f32(v51, v51))).f32[0]);
    v52.i32[3] = v47;
    int32x4_t v53 = (int32x4_t)vmulq_f32(v96, v96);
    v53.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v53, 2), vadd_f32(*(float32x2_t *)v53.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v53.i8, 1))).u32[0];
    float32x2_t v54 = vrsqrte_f32((float32x2_t)v53.u32[0]);
    float32x2_t v55 = vmul_f32(v54, vrsqrts_f32((float32x2_t)v53.u32[0], vmul_f32(v54, v54)));
    float32x4_t v56 = vmulq_n_f32(v96, vmul_f32(v55, vrsqrts_f32((float32x2_t)v53.u32[0], vmul_f32(v55, v55))).f32[0]);
    v56.i32[3] = v48;
    float32x4_t v57 = vmulq_f32(v52, v56);
    float v58 = v43
        + fabsf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v57, 2), vaddq_f32(v57, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v57.f32, 1))).f32[0]);
    if (v58 < v26) {
      unint64_t v3 = v24;
    }
    unint64_t v59 = v24 + 1;
    *((void *)v25 + 2) = v46 + 1;
    *(float *)&v25[4 * v46 + 32] = v58;
    if (v58 < v26)
    {
      uint64_t v27 = ((_BYTE)v24 - 1) & 3;
      unint64_t v2 = v28;
    }
    __int32 v97 = v99;
    __int32 v98 = v95;
    if (v58 < v26) {
      float v26 = v58;
    }
    float32x4_t v100 = v52;
    float32x4_t v101 = v56;
    ++v24;
  }
  while (v59 != 4);
  swift_bridgeObjectRelease();
  if (v3 >= v91) {
    goto LABEL_44;
  }
  if (v2 >= v91)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  if (v2 > 3)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  unint64_t v64 = *(void *)(v103 + 16);
  if (v3 >= v64)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if (v2 >= v64)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  float32x4_t v65 = (float32x2_t *)(v102.i64[0] + 16 * v27);
  *(float32x2_t *)v66.f32 = vsub_f32(0, *v65);
  v66.f32[2] = 0.0 - v65[1].f32[0];
  v66.i32[3] = 0;
  float32x4_t v67 = *(float32x4_t *)(v102.i64[0] + 16 * v2);
  v62.i64[0] = *(unsigned int *)&v44[4 * v3];
  v63.i32[0] = *(_DWORD *)&v44[4 * v2];
  if (vabds_f32(v62.f32[0], v63.f32[0]) <= 0.00000011921)
  {
    float32x4_t v69 = vmulq_f32(v66, v66);
    v69.i32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v69, 2), vaddq_f32(v69, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v69.f32, 1))).u32[0];
    float32x2_t v70 = vrsqrte_f32((float32x2_t)v69.u32[0]);
    float32x2_t v71 = vmul_f32(v70, vrsqrts_f32((float32x2_t)v69.u32[0], vmul_f32(v70, v70)));
    float32x4_t v72 = vmulq_n_f32(v66, vmul_f32(v71, vrsqrts_f32((float32x2_t)v69.u32[0], vmul_f32(v71, v71))).f32[0]);
    float32x4_t v73 = vmulq_f32(v67, v67);
    v73.f32[0] = sqrtf(v69.f32[0])
               + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v73, 2), vaddq_f32(v73, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v73.f32, 1))).f32[0]);
    v69.f32[0] = vmuls_lane_f32(v73.f32[0], v72, 2);
    *(float32x2_t *)v68.i8 = vmul_f32(vmul_n_f32(*(float32x2_t *)v72.f32, v73.f32[0]), (float32x2_t)0x3F0000003F000000);
    *(float *)&v68.i32[2] = v69.f32[0] * 0.5;
    v68.i32[3] = 0;
  }
  else
  {
    v62.f32[0] = v62.f32[0] - v63.f32[0];
    v63.i64[0] = 0;
    int8x16_t v68 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v63, v62), 0), (int8x16_t)v66, (int8x16_t)v67);
  }
  a1 = v90;
  if (v3 <= 3)
  {
    float32x4_t v101 = (float32x4_t)v68;
    long long v103 = *(_OWORD *)(v88 + 16 * v3);
    float32x4_t v100 = *(float32x4_t *)(v88 + 16 * v2);
    float32x4_t v102 = *(float32x4_t *)(v102.i64[0] + 16 * v3);
    swift_bridgeObjectRelease();
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if (result) {
      goto LABEL_33;
    }
    goto LABEL_50;
  }
LABEL_49:
  __break(1u);
LABEL_50:
  uint64_t result = (uint64_t)sub_22F20C4D4(a1);
  a1 = result;
LABEL_33:
  unint64_t v75 = v3 - 1;
  if (!v3) {
    unint64_t v75 = 3;
  }
  if ((v75 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_52;
  }
  unint64_t v76 = *(void *)(a1 + 16);
  if (v75 >= v76)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  int32x4_t v77 = (int32x4_t)vmulq_f32(v102, v102);
  v77.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v77, 2), vadd_f32(*(float32x2_t *)v77.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v77.i8, 1))).u32[0];
  float32x2_t v78 = vrsqrte_f32((float32x2_t)v77.u32[0]);
  float32x2_t v79 = vmul_f32(v78, vrsqrts_f32((float32x2_t)v77.u32[0], vmul_f32(v78, v78)));
  float32x4_t v80 = vmulq_n_f32(v102, vmul_f32(v79, vrsqrts_f32((float32x2_t)v77.u32[0], vmul_f32(v79, v79))).f32[0]);
  float32x4_t v81 = vmulq_f32(v101, v101);
  int8x16_t v82 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(a2, a2), (int8x16_t)a2, 0xCuLL), vnegq_f32(v80)), (float32x4_t)a2, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v80, (int32x4_t)v80), (int8x16_t)v80, 0xCuLL));
  v83.i32[0] = vextq_s8(v82, v82, 8uLL).u32[0];
  v80.f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v81, 2), vaddq_f32(v81, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v81.f32, 1))).f32[0]);
  v83.i32[1] = v82.i32[0];
  float32x2_t v84 = vmul_n_f32(v83, v80.f32[0]);
  float v85 = vmuls_lane_f32(v80.f32[0], *(float32x2_t *)v82.i8, 1);
  *(float32x2_t *)v82.i8 = vadd_f32(*(float32x2_t *)&v103, v84);
  *(float *)&v82.i32[2] = *((float *)&v103 + 2) + v85;
  v82.i32[3] = 0;
  *(int8x16_t *)(a1 + 32 + 16 * v75) = v82;
  unint64_t v86 = v2 - 3;
  if (v2 < 3) {
    unint64_t v86 = v2 + 1;
  }
  if (v86 < v76)
  {
    *(float32x2_t *)&long long v87 = vadd_f32(*(float32x2_t *)v100.f32, v84);
    *((void *)&v87 + 1) = COERCE_UNSIGNED_INT(v100.f32[2] + v85);
    *(_OWORD *)(a1 + 32 + 16 * v86) = v87;
    swift_bridgeObjectRelease();
    return a1;
  }
LABEL_53:
  __break(1u);
  return result;
}

uint64_t _s17MeasureFoundation18WorldRectangleDataV014projectPointToD05point9rectangles5SIMD3VySfGAI_ACtFZ_0(uint64_t a1)
{
  sub_22F1899D0(a1, (uint64_t)v3, &qword_268696010);
  uint64_t result = sub_22F1899D0((uint64_t)v3, (uint64_t)&v4, &qword_268696010);
  if (!v4) {
    goto LABEL_6;
  }
  if (!*(void *)(v4 + 16))
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (*(unsigned char *)(a1 + 224)) {
LABEL_7:
  }
    __break(1u);
  return result;
}

uint64_t sub_22F21A7BC(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t type metadata accessor for WorldRectangle()
{
  return self;
}

uint64_t sub_22F21A848(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  long long v6 = *(_OWORD *)(a1 + 256);
  long long v7 = *(_OWORD *)(a1 + 272);
  long long v4 = *(_OWORD *)(a1 + 224);
  long long v5 = *(_OWORD *)(a1 + 240);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    v4,
    *((void *)&v4 + 1),
    v5,
    *((void *)&v5 + 1),
    v6,
    *((void *)&v6 + 1),
    v7,
    *((void *)&v7 + 1),
    *(void *)(a1 + 288),
    *(void *)(a1 + 296));
  return a1;
}

uint64_t sub_22F21A8D4(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22F21A938()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22F21A970(uint64_t a1)
{
  return sub_22F2197CC(a1, *(void *)(v1 + 16));
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_22F21A990(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_22F21A9B4(uint64_t a1)
{
  return a1;
}

uint64_t sub_22F21AA04@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm_1(a1, &OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_edges, a2);
}

uint64_t sub_22F21AA10(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_22F208CBC(a1, a2, a3, a4, &OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_edges);
}

uint64_t sub_22F21AA30@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return keypath_getTm_1(a1, &OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_splitters, a2);
}

uint64_t sub_22F21AA3C(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_22F208CBC(a1, a2, a3, a4, &OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_splitters);
}

ValueMetadata *type metadata accessor for RectangleQualificationParameters()
{
  return &type metadata for RectangleQualificationParameters;
}

uint64_t destroy for WorldRectangleData()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for WorldRectangleData(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  long long v6 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v6;
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(_DWORD *)(a1 + 132) = *(_DWORD *)(a2 + 132);
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(_DWORD *)(a1 + 140) = *(_DWORD *)(a2 + 140);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(unsigned char *)(a1 + 156) = *(unsigned char *)(a2 + 156);
  *(void *)(a1 + 148) = *(void *)(a2 + 148);
  uint64_t v7 = *(void *)(a2 + 160);
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(void *)(a1 + 160) = v7;
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  *(_DWORD *)(a1 + 172) = *(_DWORD *)(a2 + 172);
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(_DWORD *)(a1 + 180) = *(_DWORD *)(a2 + 180);
  *(_DWORD *)(a1 + 188) = *(_DWORD *)(a2 + 188);
  *(_WORD *)(a1 + 192) = *(_WORD *)(a2 + 192);
  *(unsigned char *)(a1 + 224) = *(unsigned char *)(a2 + 224);
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  LODWORD(v7) = *(_DWORD *)(a2 + 228);
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(_DWORD *)(a1 + 228) = v7;
  long long v8 = *(_OWORD *)(a2 + 240);
  long long v9 = *(_OWORD *)(a2 + 256);
  long long v10 = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 288) = v10;
  *(_OWORD *)(a1 + 240) = v8;
  *(_OWORD *)(a1 + 256) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WorldRectangleData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  long long v5 = *(_OWORD *)(a2 + 112);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = v5;
  int v6 = *(_DWORD *)(a2 + 132);
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(_DWORD *)(a1 + 132) = v6;
  int v7 = *(_DWORD *)(a2 + 140);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(_DWORD *)(a1 + 140) = v7;
  uint64_t v8 = *(void *)(a2 + 148);
  *(unsigned char *)(a1 + 156) = *(unsigned char *)(a2 + 156);
  *(void *)(a1 + 148) = v8;
  uint64_t v9 = *(void *)(a2 + 160);
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(void *)(a1 + 160) = v9;
  LODWORD(v9) = *(_DWORD *)(a2 + 172);
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  *(_DWORD *)(a1 + 172) = v9;
  LODWORD(v9) = *(_DWORD *)(a2 + 180);
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(_DWORD *)(a1 + 180) = v9;
  LODWORD(v9) = *(_DWORD *)(a2 + 188);
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(_DWORD *)(a1 + 188) = v9;
  *(unsigned char *)(a1 + 193) = *(unsigned char *)(a2 + 193);
  long long v10 = *(_OWORD *)(a2 + 208);
  *(unsigned char *)(a1 + 224) = *(unsigned char *)(a2 + 224);
  *(_OWORD *)(a1 + 208) = v10;
  LODWORD(v9) = *(_DWORD *)(a2 + 228);
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  *(_DWORD *)(a1 + 228) = v9;
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  *(void *)(a1 + 264) = *(void *)(a2 + 264);
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  *(void *)(a1 + 288) = *(void *)(a2 + 288);
  *(void *)(a1 + 296) = *(void *)(a2 + 296);
  return a1;
}

void *__swift_memcpy304_16(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x130uLL);
}

uint64_t assignWithTake for WorldRectangleData(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  long long v4 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v4;
  long long v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(unsigned char *)(a1 + 136) = *(unsigned char *)(a2 + 136);
  *(_DWORD *)(a1 + 132) = *(_DWORD *)(a2 + 132);
  *(_DWORD *)(a1 + 140) = *(_DWORD *)(a2 + 140);
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  *(void *)(a1 + 148) = *(void *)(a2 + 148);
  *(unsigned char *)(a1 + 156) = *(unsigned char *)(a2 + 156);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(unsigned char *)(a1 + 168) = *(unsigned char *)(a2 + 168);
  *(unsigned char *)(a1 + 176) = *(unsigned char *)(a2 + 176);
  *(_DWORD *)(a1 + 172) = *(_DWORD *)(a2 + 172);
  int v6 = *(_DWORD *)(a2 + 180);
  *(unsigned char *)(a1 + 184) = *(unsigned char *)(a2 + 184);
  *(_DWORD *)(a1 + 180) = v6;
  *(unsigned char *)(a1 + 192) = *(unsigned char *)(a2 + 192);
  *(_DWORD *)(a1 + 188) = *(_DWORD *)(a2 + 188);
  *(unsigned char *)(a1 + 193) = *(unsigned char *)(a2 + 193);
  *(unsigned char *)(a1 + 224) = *(unsigned char *)(a2 + 224);
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  *(_DWORD *)(a1 + 228) = *(_DWORD *)(a2 + 228);
  *(unsigned char *)(a1 + 232) = *(unsigned char *)(a2 + 232);
  long long v7 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v7;
  long long v8 = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 288) = v8;
  return a1;
}

uint64_t getEnumTagSinglePayload for WorldRectangleData(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 304)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WorldRectangleData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 296) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 304) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 304) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for WorldRectangleData()
{
  return &type metadata for WorldRectangleData;
}

uint64_t sub_22F21AFC0(uint64_t a1)
{
  return a1;
}

uint64_t sub_22F21B030()
{
  uint64_t result = swift_getKeyPath();
  strcpy((char *)&qword_26869BE30, "PlaneSelection");
  algn_26869BE38[7] = -18;
  qword_26869BE40 = result;
  return result;
}

uint64_t sub_22F21B080()
{
  uint64_t result = swift_getKeyPath();
  qword_26869BE48 = 0x636E41646C726F57;
  unk_26869BE50 = 0xEB00000000726F68;
  qword_26869BE58 = result;
  return result;
}

uint64_t sub_22F21B0CC()
{
  uint64_t result = swift_getKeyPath();
  qword_26869BE60 = 0x6564695665726F43;
  *(void *)algn_26869BE68 = 0xE90000000000006FLL;
  qword_26869BE70 = result;
  return result;
}

uint64_t sub_22F21B114()
{
  uint64_t result = swift_getKeyPath();
  strcpy((char *)&qword_26869BE78, "MeasureObject");
  unk_26869BE86 = -4864;
  qword_26869BE88 = result;
  return result;
}

uint64_t sub_22F21B164()
{
  uint64_t result = swift_getKeyPath();
  strcpy((char *)&qword_26869BE90, "WorldRectangle");
  algn_26869BE98[7] = -18;
  qword_26869BEA0 = result;
  return result;
}

char *keypath_get_selector_logWorldRectangle()
{
  return sel_logWorldRectangle;
}

char *keypath_get_selector_logWorldAnchor()
{
  return sel_logWorldAnchor;
}

uint64_t sub_22F21B1DC()
{
  uint64_t result = swift_getKeyPath();
  qword_26869BEA8 = 0x616D726F66726550;
  unk_26869BEB0 = 0xEB0000000065636ELL;
  qword_26869BEB8 = result;
  return result;
}

uint64_t sub_22F21B228()
{
  uint64_t result = swift_getKeyPath();
  strcpy((char *)&qword_26869BEC0, "Uncategorized");
  *(_WORD *)&algn_26869BEC8[6] = -4864;
  qword_26869BED0 = result;
  return result;
}

char *keypath_get_selector_logMisc()
{
  return sel_logMisc;
}

char *keypath_get_selector_logPlaneSelection()
{
  return sel_logPlaneSelection;
}

char *keypath_get_selector_logMeasureObject()
{
  return sel_logMeasureObject;
}

char *keypath_get_selector_logCoreVideo()
{
  return sel_logCoreVideo;
}

char *keypath_get_selector_logPerf()
{
  return sel_logPerf;
}

char *sub_22F21B2DC(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_17;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    if (!v2) {
      return (char *)v3;
    }
    uint64_t v14 = MEMORY[0x263F8EE78];
    uint64_t result = sub_22F18FC68(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    uint64_t v5 = 0;
    uint64_t v3 = v14;
    unint64_t v13 = v1 & 0xC000000000000001;
    while (v2 != v5)
    {
      if (v13) {
        MEMORY[0x230FB2E90](v5, v1);
      }
      else {
        swift_retain();
      }
      swift_retain();
      uint64_t v6 = sub_22F224278();
      uint64_t v8 = v7;
      swift_release_n();
      if (!v8) {
        goto LABEL_16;
      }
      unint64_t v9 = v1;
      unint64_t v11 = *(void *)(v14 + 16);
      unint64_t v10 = *(void *)(v14 + 24);
      if (v11 >= v10 >> 1) {
        sub_22F18FC68((char *)(v10 > 1), v11 + 1, 1);
      }
      ++v5;
      *(void *)(v14 + 16) = v11 + 1;
      uint64_t v12 = v14 + 16 * v11;
      *(void *)(v12 + 32) = v6;
      *(void *)(v12 + 40) = v8;
      unint64_t v1 = v9;
      if (v2 == v5) {
        return (char *)v3;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_22F2245C8();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t NSUserDefaults.performOnChange<A>(to:on:action:)(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (qword_268694550 != -1) {
    swift_once();
  }
  return sub_22F21B754(a1, a2, v4, a3, a4);
}

uint64_t sub_22F21B4F4()
{
  if (qword_268694558 != -1) {
    swift_once();
  }
  unint64_t v0 = static NSUserDefaults.internalDefaults;
  unint64_t v1 = (objc_class *)type metadata accessor for NSUserDefaults._DefaultsStore();
  uint64_t v2 = (char *)objc_allocWithZone(v1);
  *(void *)&v2[OBJC_IVAR____TtCE17MeasureFoundationCSo14NSUserDefaults14_DefaultsStore_actions] = MEMORY[0x263F8EE80];
  *(void *)&v2[OBJC_IVAR____TtCE17MeasureFoundationCSo14NSUserDefaults14_DefaultsStore_managedDefaults] = v0;
  v11.receiver = v2;
  v11.super_class = v1;
  swift_bridgeObjectRetain_n();
  id v3 = objc_msgSendSuper2(&v11, sel_init);
  int v4 = sub_22F21B2DC(v0);
  uint64_t v5 = *((void *)v4 + 2);
  if (v5)
  {
    uint64_t v6 = self;
    swift_bridgeObjectRetain();
    uint64_t v7 = v4 + 40;
    do
    {
      swift_bridgeObjectRetain();
      id v8 = objc_msgSend(v6, sel_standardUserDefaults);
      unint64_t v9 = (void *)sub_22F223A98();
      objc_msgSend(v8, sel_addObserver_forKeyPath_options_context_, v3, v9, 1, 0);
      swift_bridgeObjectRelease();

      v7 += 16;
      --v5;
    }
    while (v5);

    swift_bridgeObjectRelease();
  }
  else
  {
  }
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  static NSUserDefaults.standardStore = (uint64_t)v3;
  return result;
}

uint64_t *NSUserDefaults.standardStore.unsafeMutableAddressor()
{
  if (qword_268694550 != -1) {
    swift_once();
  }
  return &static NSUserDefaults.standardStore;
}

id static NSUserDefaults.standardStore.getter()
{
  if (qword_268694550 != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)static NSUserDefaults.standardStore;
  return v0;
}

uint64_t sub_22F21B754(uint64_t *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v11 = *a1;
  uint64_t v12 = (void *)swift_allocObject();
  uint64_t v13 = *(void *)(*MEMORY[0x263F8EA20] + v11 + 8);
  void v12[2] = v13;
  v12[3] = a2;
  _OWORD v12[4] = a4;
  v12[5] = a5;
  swift_retain();
  id v33 = a2;
  uint64_t result = sub_22F224278();
  if (v15)
  {
    uint64_t v16 = result;
    uint64_t v17 = v15;
    uint64_t v32 = a4;
    float v18 = (uint64_t *)(v6 + OBJC_IVAR____TtCE17MeasureFoundationCSo14NSUserDefaults14_DefaultsStore_actions);
    swift_beginAccess();
    uint64_t v19 = *v18;
    if (*(void *)(*v18 + 16) && (unint64_t v20 = sub_22F18DE28(v16, v17), (v21 & 1) != 0))
    {
      long long v22 = *(void **)(*(void *)(v19 + 56) + 8 * v20);
      swift_endAccess();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_endAccess();
      long long v22 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = sub_22F21C558;
    *(void *)(v23 + 24) = v12;
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      long long v22 = sub_22F19B208(0, v22[2] + 1, 1, v22);
    }
    unint64_t v25 = v22[2];
    unint64_t v24 = v22[3];
    if (v25 >= v24 >> 1) {
      long long v22 = sub_22F19B208((void *)(v24 > 1), v25 + 1, 1, v22);
    }
    v22[2] = v25 + 1;
    float v26 = &v22[2 * v25];
    v26[4] = sub_22F21C59C;
    v26[5] = v23;
    uint64_t result = sub_22F224278();
    if (v27)
    {
      uint64_t v28 = result;
      uint64_t v29 = v27;
      swift_beginAccess();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v35 = *v18;
      *float v18 = 0x8000000000000000;
      sub_22F1E7178((uint64_t)v22, v28, v29, isUniquelyReferenced_nonNull_native);
      *float v18 = v35;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      v34[3] = v13;
      uint64_t v35 = (uint64_t)a3;
      __swift_allocate_boxed_opaque_existential_1(v34);
      id v31 = a3;
      swift_getAtKeyPath();

      sub_22F21BB6C((uint64_t)v34, (uint64_t)v33, v32, a5, v13);
      swift_release();
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_22F21BB6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v20[0] = a2;
  uint64_t v9 = sub_22F2238C8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_22F2238E8();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22F195C78(a1, (uint64_t)v22);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a5;
  sub_22F186BD8(v22, (_OWORD *)(v17 + 24));
  *(void *)(v17 + 56) = a3;
  *(void *)(v17 + 64) = a4;
  aBlock[4] = sub_22F21C604;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22F182A20;
  aBlock[3] = &block_descriptor_5;
  float v18 = _Block_copy(aBlock);
  swift_retain();
  sub_22F2238D8();
  v20[1] = MEMORY[0x263F8EE78];
  sub_22F1A3134(&qword_268694FE8, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268694FF0);
  sub_22F1A317C();
  sub_22F2242B8();
  MEMORY[0x230FB2B90](0, v16, v12, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  return swift_release();
}

uint64_t sub_22F21BE30(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 - 8);
  id v8 = (void *)MEMORY[0x270FA5388](a1);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(v8, v8[3]);
  swift_getDynamicType();
  if (swift_dynamicCastMetatype()
    && ((sub_22F1A321C(0, (unint64_t *)&qword_268695000), swift_dynamicCastMetatype())
     || (sub_22F1A321C(0, qword_268695008), swift_dynamicCastMetatype())))
  {
    sub_22F195C78(a1, (uint64_t)v23);
    swift_dynamicCast();
    id v11 = v22;
    unsigned __int8 v12 = objc_msgSend(v22, sel_BOOLValue);

    LOBYTE(v21) = v12;
  }
  else
  {
    if (!swift_dynamicCastMetatype()
      || (sub_22F1A321C(0, (unint64_t *)&qword_268695000), !swift_dynamicCastMetatype())
      && (sub_22F1A321C(0, qword_268695008), !swift_dynamicCastMetatype()))
    {
      if (swift_dynamicCastMetatype())
      {
        sub_22F1A321C(0, (unint64_t *)&qword_268695000);
        if (swift_dynamicCastMetatype())
        {
          sub_22F195C78(a1, (uint64_t)v23);
          swift_dynamicCast();
          id v16 = v21;
          id v17 = objc_msgSend(v21, sel_integerValue);

          id v22 = v17;
          goto LABEL_15;
        }
        sub_22F1A321C(0, qword_268695008);
        if (swift_dynamicCastMetatype())
        {
          sub_22F195C78(a1, (uint64_t)v23);
          swift_dynamicCast();
          id v18 = v22;
          unsigned int v19 = objc_msgSend(v22, sel_intValue);

          LODWORD(v21) = v19;
          goto LABEL_15;
        }
      }
      sub_22F195C78(a1, (uint64_t)v23);
      goto LABEL_15;
    }
    sub_22F195C78(a1, (uint64_t)v23);
    swift_dynamicCast();
    id v13 = v22;
    objc_msgSend(v22, sel_floatValue);
    int v15 = v14;

    LODWORD(v21) = v15;
  }
LABEL_15:
  swift_dynamicCast();
  a2(v10);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, a4);
}

uint64_t sub_22F21C204(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t PartialKeyPath<A>.keyString.getter()
{
  uint64_t result = sub_22F224278();
  if (!v1) {
    __break(1u);
  }
  return result;
}

id NSUserDefaults._DefaultsStore.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void NSUserDefaults._DefaultsStore.init()()
{
}

id NSUserDefaults._DefaultsStore.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void _sSo14NSUserDefaultsC17MeasureFoundationE01_B5StoreC12observeValue10forKeyPath2of6change7contextySSSg_ypSgSDySo05NSKeyg6ChangeI0aypGSgSvSgtF_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a2) {
    return;
  }
  uint64_t v6 = v4;
  if (!a4)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (!*(void *)(a4 + 16))
  {
LABEL_17:
    long long v20 = 0u;
    long long v21 = 0u;
    __break(1u);
    goto LABEL_18;
  }
  id v5 = (id)*MEMORY[0x263F081B8];
  uint64_t v10 = sub_22F18DD20(v5);
  if ((v11 & 1) == 0)
  {
LABEL_18:
    long long v20 = 0u;
    long long v21 = 0u;

    goto LABEL_19;
  }
  sub_22F195C78(*(void *)(a4 + 56) + 32 * v10, (uint64_t)&v20);

  if (!*((void *)&v21 + 1))
  {
LABEL_19:
    __break(1u);
    return;
  }
  sub_22F186BD8(&v20, v22);
  unsigned __int8 v12 = (uint64_t *)(v6 + OBJC_IVAR____TtCE17MeasureFoundationCSo14NSUserDefaults14_DefaultsStore_actions);
  swift_beginAccess();
  uint64_t v13 = *v12;
  if (!*(void *)(v13 + 16))
  {
LABEL_14:
    swift_endAccess();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v22);
    return;
  }
  swift_bridgeObjectRetain();
  unint64_t v14 = sub_22F18DE28(a1, a2);
  if ((v15 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  uint64_t v16 = *(void *)(*(void *)(v13 + 56) + 8 * v14);
  swift_endAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void *)(v16 + 16);
  if (v17)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = v16 + 40;
    do
    {
      unsigned int v19 = *(void (**)(_OWORD *))(v18 - 8);
      swift_retain();
      v19(v22);
      swift_release();
      v18 += 16;
      --v17;
    }
    while (v17);
    swift_bridgeObjectRelease();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v22);
  swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for NSUserDefaults._DefaultsStore()
{
  return self;
}

uint64_t sub_22F21C518()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22F21C558(uint64_t a1)
{
  return sub_22F21BB6C(a1, v1[3], v1[4], v1[5], v1[2]);
}

uint64_t sub_22F21C564()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_22F21C59C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_22F21C5C4()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 24);
  swift_release();
  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_22F21C604()
{
  return sub_22F21BE30(v0 + 24, *(void (**)(char *))(v0 + 56), *(void *)(v0 + 64), *(void *)(v0 + 16));
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

void sub_22F21C62C(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void **)(*a2 + OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_firstEdge);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = v2;
  id v5 = v2;
}

id WorldRectangleGuide.firstEdge.getter()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_firstEdge);
  swift_beginAccess();
  uint64_t v2 = *v1;
  return v2;
}

void sub_22F21C6E8(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = (void **)(*a2 + OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_secondEdge);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = v2;
  id v5 = v2;
}

void *WorldRectangleGuide.secondEdge.getter()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_secondEdge);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void *WorldRectangleGuide.data.getter@<X0>(void *a1@<X8>)
{
  id v3 = (const void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_data);
  swift_beginAccess();
  memcpy(__dst, v3, sizeof(__dst));
  sub_22F21A9B4((uint64_t)__dst);
  return memcpy(a1, __dst, 0x130uLL);
}

uint64_t WorldRectangleGuide.data.setter(const void *a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_data);
  swift_beginAccess();
  memcpy(__dst, v3, sizeof(__dst));
  memcpy(v3, a1, 0x130uLL);
  return sub_22F21AFC0((uint64_t)__dst);
}

uint64_t (*WorldRectangleGuide.data.modify())()
{
  return j__swift_endAccess;
}

id WorldRectangleGuide.__allocating_init(data:baseEdge:)(const void *a1, uint64_t a2)
{
  id v5 = (char *)objc_allocWithZone(v2);
  *(void *)&v5[OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_secondEdge] = 0;
  memcpy(&v5[OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_data], a1, 0x130uLL);
  *(void *)&v5[OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_firstEdge] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id WorldRectangleGuide.init(data:baseEdge:)(void *__src, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_secondEdge] = 0;
  memcpy(&v2[OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_data], __src, 0x130uLL);
  *(void *)&v2[OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_firstEdge] = a2;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for WorldRectangleGuide();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for WorldRectangleGuide()
{
  return self;
}

void WorldRectangleGuide.addSecondEdge(_:)(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_secondEdge);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
  id v5 = a1;
}

id WorldRectangleGuide.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void WorldRectangleGuide.init()()
{
}

uint64_t sub_22F21CAF4()
{
  memcpy(v2, (const void *)(v0 + OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_data), sizeof(v2));
  return sub_22F21AFC0((uint64_t)v2);
}

id WorldRectangleGuide.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WorldRectangleGuide();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_22F21CB8C@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  id v3 = (void **)(*a1 + OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_firstEdge);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

id sub_22F21CBF4@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  id v3 = (void **)(*a1 + OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_secondEdge);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

id sub_22F21CCC4@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logPlaneSelection);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F21CCF8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogPlaneSelection_, *a1);
}

id sub_22F21CD0C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logWorldAnchor);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F21CD40(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogWorldAnchor_, *a1);
}

id sub_22F21CD54@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logCoreVideo);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F21CD88(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogCoreVideo_, *a1);
}

id sub_22F21CD9C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logMeasureObject);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F21CDD0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogMeasureObject_, *a1);
}

id sub_22F21CDE4@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logWorldRectangle);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F21CE18(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogWorldRectangle_, *a1);
}

id sub_22F21CE2C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logPerf);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F21CE60(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogPerf_, *a1);
}

id sub_22F21CE74@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logMisc);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F21CEA8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogMisc_, *a1);
}

uint64_t *NSUserDefaults.internalDefaults.unsafeMutableAddressor()
{
  if (qword_268694558 != -1) {
    swift_once();
  }
  return &static NSUserDefaults.internalDefaults;
}

float sub_22F21CF08(void *a1)
{
  return sub_22F21EA64(a1);
}

float NSUserDefaults.kReticleADSlerpFactor.getter()
{
  id v1 = (void *)sub_22F223A98();
  objc_msgSend(v0, sel_floatForKey_, v1);
  float v3 = v2;

  return v3;
}

void sub_22F21CF88(void *a1, float a2)
{
}

void NSUserDefaults.kReticleADSlerpFactor.setter(float a1)
{
}

id sub_22F21CFC0(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kADDemoEnabled.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21D048(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kADDemoEnabled.setter(char a1)
{
}

id sub_22F21D090(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kADShowDepth.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21D110(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kADShowDepth.setter(char a1)
{
}

id sub_22F21D150(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kADGuidedFilterEnabled.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21D1C8(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kADGuidedFilterEnabled.setter(char a1)
{
}

id sub_22F21D200(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kShouldReportMeasurements.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21D278(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kShouldReportMeasurements.setter(char a1)
{
}

id sub_22F21D2B0(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kPEShowStats.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21D330(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kPEShowStats.setter(char a1)
{
}

id sub_22F21D370(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kPEShowAccuracy.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21D3F8(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kPEShowAccuracy.setter(char a1)
{
}

id sub_22F21D440(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kPEShowHitPoints.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21D4B8(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kPEShowHitPoints.setter(char a1)
{
}

id sub_22F21D4F0(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kPEShowHitRay.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21D578(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kPEShowHitRay.setter(char a1)
{
}

id sub_22F21D5C0(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kResetDefaultOnStart.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21D638(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kResetDefaultOnStart.setter(char a1)
{
}

id sub_22F21D670(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kDrawDebugPlanes.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21D6E8(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kDrawDebugPlanes.setter(char a1)
{
}

id sub_22F21D720(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kShowStatistics.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21D7A8(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kShowStatistics.setter(char a1)
{
}

id sub_22F21D7F0(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kShowOverallState.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21D868(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kShowOverallState.setter(char a1)
{
}

id sub_22F21D8A0(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kShowFeaturePoints.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21D918(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kShowFeaturePoints.setter(char a1)
{
}

id sub_22F21D950(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kHideTapToRadar.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21D9D8(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kHideTapToRadar.setter(char a1)
{
}

id sub_22F21DA20(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kShowWorldAnchorDebugInfo.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21DA98(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kShowWorldAnchorDebugInfo.setter(char a1)
{
}

id sub_22F21DAD0(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kShowRectangleDebugInfo.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21DB48(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kShowRectangleDebugInfo.setter(char a1)
{
}

id sub_22F21DB80(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.shouldEnableObjectMeasurements.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21DBF8(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.shouldEnableObjectMeasurements.setter(char a1)
{
}

id sub_22F21DC30(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.shouldShowObjectDebugViews.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21DCA8(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.shouldShowObjectDebugViews.setter(char a1)
{
}

id sub_22F21DCE0(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.shouldRenderOpaqueSurfaces.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21DD58(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.shouldRenderOpaqueSurfaces.setter(char a1)
{
}

id sub_22F21DD90(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.shouldVERefinePredictedBoundingBoxes.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21DE08(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.shouldVERefinePredictedBoundingBoxes.setter(char a1)
{
}

id sub_22F21DE40(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.shouldTuriRefinePredictedBoundingBoxes.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21DEB8(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.shouldTuriRefinePredictedBoundingBoxes.setter(char a1)
{
}

id sub_22F21DEF0(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.shouldUseNormalsForBoxOrientation.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21DF68(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.shouldUseNormalsForBoxOrientation.setter(char a1)
{
}

id sub_22F21DFA0(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.shouldArchiveSpatialMappingData.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21E018(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.shouldArchiveSpatialMappingData.setter(char a1)
{
}

id sub_22F21E050(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kShowLightIntensityDebugInfo.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21E0C8(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kShowLightIntensityDebugInfo.setter(char a1)
{
}

id sub_22F21E100(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kDisableAllCoachingAndOnboarding.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21E178(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kDisableAllCoachingAndOnboarding.setter(char a1)
{
}

id sub_22F21E1B0(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kCoachingCalloutEnabledV1.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21E228(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kCoachingCalloutEnabledV1.setter(char a1)
{
}

id sub_22F21E260(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kEnableRectangleDetection.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21E2D8(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kEnableRectangleDetection.setter(char a1)
{
}

id sub_22F21E310(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kEnableRectangleTracking.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21E388(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kEnableRectangleTracking.setter(char a1)
{
}

id sub_22F21E3C0(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kHideRectangleSuggestions.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21E438(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kHideRectangleSuggestions.setter(char a1)
{
}

id sub_22F21E470(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kADEdgeDetectionEnabled.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21E4E8(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kADEdgeDetectionEnabled.setter(char a1)
{
}

id sub_22F21E520(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.throttleEdges.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21E5A8(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.throttleEdges.setter(char a1)
{
}

id sub_22F21E5F0(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.showEDLines.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21E670(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.showEDLines.setter(char a1)
{
}

id sub_22F21E6B0(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.showFinalPlanes.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21E738(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.showFinalPlanes.setter(char a1)
{
}

id sub_22F21E780(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.showRefinementPlanes.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21E7F8(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.showRefinementPlanes.setter(char a1)
{
}

id sub_22F21E830(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.showFilteredRefinementPlanes.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21E8A8(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.showFilteredRefinementPlanes.setter(char a1)
{
}

id sub_22F21E8E0(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.showSnappableEdges.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21E958(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.showSnappableEdges.setter(char a1)
{
}

float sub_22F21E990(void *a1)
{
  return sub_22F21EA64(a1);
}

float NSUserDefaults.kRayCastDistThreshold.getter()
{
  id v1 = (void *)sub_22F223A98();
  objc_msgSend(v0, sel_floatForKey_, v1);
  float v3 = v2;

  return v3;
}

void sub_22F21EA10(void *a1, float a2)
{
}

void NSUserDefaults.kRayCastDistThreshold.setter(float a1)
{
}

float sub_22F21EA48(void *a1)
{
  return sub_22F21EA64(a1);
}

float sub_22F21EA64(void *a1)
{
  id v1 = a1;
  float v2 = (void *)sub_22F223A98();
  objc_msgSend(v1, sel_floatForKey_, v2);
  float v4 = v3;

  return v4;
}

float NSUserDefaults.kRayCastAngleThreshold.getter()
{
  id v1 = (void *)sub_22F223A98();
  objc_msgSend(v0, sel_floatForKey_, v1);
  float v3 = v2;

  return v3;
}

void sub_22F21EB38(void *a1, float a2)
{
}

void sub_22F21EB54(void *a1, float a2)
{
  id v3 = a1;
  id v5 = (id)sub_22F223A98();
  *(float *)&double v4 = a2;
  objc_msgSend(v3, sel_setFloat_forKey_, v5, v4);
}

void NSUserDefaults.kRayCastAngleThreshold.setter(float a1)
{
}

void sub_22F21EBF8(float a1)
{
  id v4 = (id)sub_22F223A98();
  *(float *)&double v3 = a1;
  objc_msgSend(v1, sel_setFloat_forKey_, v4, v3);
}

id sub_22F21EC54(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.guideSnapPointsEnabled.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21ECCC(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.guideSnapPointsEnabled.setter(char a1)
{
}

id sub_22F21ED04(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.showGuideSnapPoints.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21ED7C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.showGuideSnapPoints.setter(char a1)
{
}

id sub_22F21EDB4(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kEdgeDetectionEnabled.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21EE2C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kEdgeDetectionEnabled.setter(char a1)
{
}

id sub_22F21EE64(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kSnapReticleToEdges.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21EEDC(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kSnapReticleToEdges.setter(char a1)
{
}

id sub_22F21EF14(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kEdgeDetectionDebugReticleEnabled.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21EF8C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kEdgeDetectionDebugReticleEnabled.setter(char a1)
{
}

id sub_22F21EFC4(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kEdgeDetectionUniqueContours.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21F03C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kEdgeDetectionUniqueContours.setter(char a1)
{
}

id sub_22F21F074(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kShowPreciseMeasurement.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21F0EC(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kShowPreciseMeasurement.setter(char a1)
{
}

id sub_22F21F124(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kShowOppositeUnits.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21F19C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kShowOppositeUnits.setter(char a1)
{
}

id sub_22F21F1D4(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kLPShowPlane.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21F254(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kLPShowPlane.setter(char a1)
{
}

id sub_22F21F294(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kLPShowPoints.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21F31C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kLPShowPoints.setter(char a1)
{
}

id sub_22F21F364(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.showsOnlyYukonEModes.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21F3DC(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.showsOnlyYukonEModes.setter(char a1)
{
}

id sub_22F21F414(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.isLabelOcclusionEnabled.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21F48C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.isLabelOcclusionEnabled.setter(char a1)
{
}

id sub_22F21F4C4(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.labelFadesInAtSpot.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21F53C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.labelFadesInAtSpot.setter(char a1)
{
}

id sub_22F21F574(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.isLineOcclusionEnabled.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21F5EC(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.isLineOcclusionEnabled.setter(char a1)
{
}

id sub_22F21F624(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.isLineOcclusionAlphaBlendingEnabled.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21F69C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.isLineOcclusionAlphaBlendingEnabled.setter(char a1)
{
}

id sub_22F21F6D4(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.isPointOcclusionEnabled.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21F74C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.isPointOcclusionEnabled.setter(char a1)
{
}

id sub_22F21F784(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kMLShowUnprojectedTrail.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21F7FC(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kMLShowUnprojectedTrail.setter(char a1)
{
}

id sub_22F21F834(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kMLShowSampledPoints.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21F8AC(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kMLShowSampledPoints.setter(char a1)
{
}

id sub_22F21F8E4(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kMLShowSegmentedBackground.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21F95C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kMLShowSegmentedBackground.setter(char a1)
{
}

id sub_22F21F994(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kMLShowNormalsBackground.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21FA0C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kMLShowNormalsBackground.setter(char a1)
{
}

id sub_22F21FA44(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kPersonHeightEnabled.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21FABC(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kPersonHeightEnabled.setter(char a1)
{
}

id sub_22F21FAF4(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kPersonHeightDebugViewEnabled.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21FB6C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kPersonHeightDebugViewEnabled.setter(char a1)
{
}

id sub_22F21FBA4(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kPersonHeightCoachingEnabled.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21FC1C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kPersonHeightCoachingEnabled.setter(char a1)
{
}

id sub_22F21FC54(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kPersonSegmentationAlwaysOn.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21FCCC(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kPersonSegmentationAlwaysOn.setter(char a1)
{
}

id sub_22F21FD04(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kADShowPerson.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21FD8C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kADShowPerson.setter(char a1)
{
}

id sub_22F21FDD4(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.kDivisionsEnabled.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21FE4C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.kDivisionsEnabled.setter(char a1)
{
}

id sub_22F21FE84(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logPlaneSelection.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21FEFC(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logPlaneSelection.setter(char a1)
{
}

id sub_22F21FF34(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logObjectMeasurements.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F21FFAC(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logObjectMeasurements.setter(char a1)
{
}

id sub_22F21FFE4(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logWorldRectangle.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F22005C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logWorldRectangle.setter(char a1)
{
}

id sub_22F220094(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logUIContext.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F220114(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logUIContext.setter(char a1)
{
}

id sub_22F220154(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logHapticFeedback.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F2201CC(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logHapticFeedback.setter(char a1)
{
}

id sub_22F220204(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logComputerVision.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F22027C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logComputerVision.setter(char a1)
{
}

id sub_22F2202B4(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logARSession.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F220334(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logARSession.setter(char a1)
{
}

id sub_22F220374(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logARSessionReplay.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F2203EC(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logARSessionReplay.setter(char a1)
{
}

id sub_22F220424(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logARSessionRecording.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F22049C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logARSessionRecording.setter(char a1)
{
}

id sub_22F2204D4(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logMotionUpdates.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F22054C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logMotionUpdates.setter(char a1)
{
}

id sub_22F220584(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logApplicationState.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F2205FC(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logApplicationState.setter(char a1)
{
}

id sub_22F220634(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logMeasureObject.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F2206AC(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logMeasureObject.setter(char a1)
{
}

id sub_22F2206E4(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logLightEstimation.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F22075C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logLightEstimation.setter(char a1)
{
}

id sub_22F220794(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logCoaching.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F220814(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logCoaching.setter(char a1)
{
}

id sub_22F220854(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logLabel.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F2208C4(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logLabel.setter(char a1)
{
}

id sub_22F2208F4(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logUIAction.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F220974(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logUIAction.setter(char a1)
{
}

id sub_22F2209B4(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logEdgeDetection.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F220A2C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logEdgeDetection.setter(char a1)
{
}

id sub_22F220A64(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logEdgeSnapping.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F220AEC(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logEdgeSnapping.setter(char a1)
{
}

id sub_22F220B34(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logPersonHeight.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F220BBC(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logPersonHeight.setter(char a1)
{
}

id sub_22F220C04(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logPerf.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F220C74(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logPerf.setter(char a1)
{
}

id sub_22F220CA4(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logShaders.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F220D1C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logShaders.setter(char a1)
{
}

id sub_22F220D54(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logWorldAnchor.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F220DDC(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logWorldAnchor.setter(char a1)
{
}

id sub_22F220E24(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logCoreVideo.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F220EA4(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logCoreVideo.setter(char a1)
{
}

id sub_22F220EE4(void *a1)
{
  return sub_22F220FCC(a1);
}

id NSUserDefaults.logArbitration.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F220F6C(void *a1, uint64_t a2, uint64_t a3)
{
}

void NSUserDefaults.logArbitration.setter(char a1)
{
}

id sub_22F220FB4(void *a1)
{
  return sub_22F220FCC(a1);
}

id sub_22F220FCC(void *a1)
{
  id v1 = a1;
  id v2 = (void *)sub_22F223A98();
  id v3 = objc_msgSend(v1, sel_BOOLForKey_, v2);

  return v3;
}

id NSUserDefaults.logMisc.getter()
{
  id v1 = (void *)sub_22F223A98();
  id v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22F22108C(void *a1, uint64_t a2, uint64_t a3)
{
}

void sub_22F2210A4(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = a1;
  id v5 = (id)sub_22F223A98();
  objc_msgSend(v4, sel_setBool_forKey_, a3, v5);
}

void NSUserDefaults.logMisc.setter(char a1)
{
}

void sub_22F22113C(char a1)
{
  id v3 = (id)sub_22F223A98();
  objc_msgSend(v1, sel_setBool_forKey_, a1 & 1, v3);
}

uint64_t sub_22F2211A0()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268695250);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22F22B7D0;
  *(void *)(v0 + 32) = swift_getKeyPath();
  *(void *)(v0 + 40) = swift_getKeyPath();
  *(void *)(v0 + 48) = swift_getKeyPath();
  *(void *)(v0 + 56) = swift_getKeyPath();
  *(void *)(v0 + 64) = swift_getKeyPath();
  *(void *)(v0 + 72) = swift_getKeyPath();
  *(void *)(v0 + 80) = swift_getKeyPath();
  *(void *)(v0 + 88) = swift_getKeyPath();
  *(void *)(v0 + 96) = swift_getKeyPath();
  *(void *)(v0 + 104) = swift_getKeyPath();
  *(void *)(v0 + 112) = swift_getKeyPath();
  *(void *)(v0 + 120) = swift_getKeyPath();
  *(void *)(v0 + 128) = swift_getKeyPath();
  *(void *)(v0 + 136) = swift_getKeyPath();
  *(void *)(v0 + 144) = swift_getKeyPath();
  *(void *)(v0 + 152) = swift_getKeyPath();
  *(void *)(v0 + 160) = swift_getKeyPath();
  *(void *)(v0 + 168) = swift_getKeyPath();
  *(void *)(v0 + 176) = swift_getKeyPath();
  *(void *)(v0 + 184) = swift_getKeyPath();
  *(void *)(v0 + 192) = swift_getKeyPath();
  *(void *)(v0 + 200) = swift_getKeyPath();
  *(void *)(v0 + 208) = swift_getKeyPath();
  *(void *)(v0 + 216) = swift_getKeyPath();
  *(void *)(v0 + 224) = swift_getKeyPath();
  *(void *)(v0 + 232) = swift_getKeyPath();
  *(void *)(v0 + 240) = swift_getKeyPath();
  *(void *)(v0 + 248) = swift_getKeyPath();
  *(void *)(v0 + 256) = swift_getKeyPath();
  *(void *)(v0 + 264) = swift_getKeyPath();
  *(void *)(v0 + 272) = swift_getKeyPath();
  *(void *)(v0 + 280) = swift_getKeyPath();
  *(void *)(v0 + 288) = swift_getKeyPath();
  *(void *)(v0 + 296) = swift_getKeyPath();
  *(void *)(v0 + 304) = swift_getKeyPath();
  *(void *)(v0 + 312) = swift_getKeyPath();
  *(void *)(v0 + 320) = swift_getKeyPath();
  *(void *)(v0 + 328) = swift_getKeyPath();
  *(void *)(v0 + 336) = swift_getKeyPath();
  *(void *)(v0 + 344) = swift_getKeyPath();
  *(void *)(v0 + 352) = swift_getKeyPath();
  *(void *)(v0 + 360) = swift_getKeyPath();
  *(void *)(v0 + 368) = swift_getKeyPath();
  *(void *)(v0 + 376) = swift_getKeyPath();
  *(void *)(v0 + 384) = swift_getKeyPath();
  *(void *)(v0 + 392) = swift_getKeyPath();
  *(void *)(v0 + 400) = swift_getKeyPath();
  *(void *)(v0 + 408) = swift_getKeyPath();
  *(void *)(v0 + 416) = swift_getKeyPath();
  *(void *)(v0 + 424) = swift_getKeyPath();
  *(void *)(v0 + 432) = swift_getKeyPath();
  *(void *)(v0 + 440) = swift_getKeyPath();
  *(void *)(v0 + 448) = swift_getKeyPath();
  *(void *)(v0 + 456) = swift_getKeyPath();
  *(void *)(v0 + 464) = swift_getKeyPath();
  *(void *)(v0 + 472) = swift_getKeyPath();
  *(void *)(v0 + 480) = swift_getKeyPath();
  *(void *)(v0 + 488) = swift_getKeyPath();
  *(void *)(v0 + 496) = swift_getKeyPath();
  *(void *)(v0 + 504) = swift_getKeyPath();
  *(void *)(v0 + 512) = swift_getKeyPath();
  *(void *)(v0 + 520) = swift_getKeyPath();
  *(void *)(v0 + 528) = swift_getKeyPath();
  *(void *)(v0 + 536) = swift_getKeyPath();
  *(void *)(v0 + 544) = swift_getKeyPath();
  *(void *)(v0 + 552) = swift_getKeyPath();
  *(void *)(v0 + 560) = swift_getKeyPath();
  *(void *)(v0 + 568) = swift_getKeyPath();
  *(void *)(v0 + 576) = swift_getKeyPath();
  *(void *)(v0 + 584) = swift_getKeyPath();
  *(void *)(v0 + 592) = swift_getKeyPath();
  *(void *)(v0 + 600) = swift_getKeyPath();
  *(void *)(v0 + 608) = swift_getKeyPath();
  *(void *)(v0 + 616) = swift_getKeyPath();
  *(void *)(v0 + 624) = swift_getKeyPath();
  *(void *)(v0 + 632) = swift_getKeyPath();
  *(void *)(v0 + 640) = swift_getKeyPath();
  *(void *)(v0 + 648) = swift_getKeyPath();
  *(void *)(v0 + 656) = swift_getKeyPath();
  *(void *)(v0 + 664) = swift_getKeyPath();
  *(void *)(v0 + 672) = swift_getKeyPath();
  *(void *)(v0 + 680) = swift_getKeyPath();
  *(void *)(v0 + 688) = swift_getKeyPath();
  *(void *)(v0 + 696) = swift_getKeyPath();
  *(void *)(v0 + 704) = swift_getKeyPath();
  *(void *)(v0 + 712) = swift_getKeyPath();
  *(void *)(v0 + 720) = swift_getKeyPath();
  *(void *)(v0 + 728) = swift_getKeyPath();
  *(void *)(v0 + 736) = swift_getKeyPath();
  *(void *)(v0 + 744) = swift_getKeyPath();
  uint64_t result = sub_22F223CD8();
  static NSUserDefaults.internalDefaults = v0;
  return result;
}

uint64_t static NSUserDefaults.internalDefaults.getter()
{
  if (qword_268694558 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

Swift::Int __swiftcall NSUserDefaults.int(forKey:)(Swift::String forKey)
{
  id v2 = (void *)sub_22F223A98();
  id v3 = objc_msgSend(v1, sel_integerForKey_, v2);

  return (Swift::Int)v3;
}

char *keypath_get_selector_kReticleADSlerpFactor()
{
  return sel_kReticleADSlerpFactor;
}

id sub_22F221850@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kReticleADSlerpFactor);
  *a2 = v4;
  return result;
}

id sub_22F221884(_DWORD *a1, id *a2, double a3)
{
  LODWORD(a3) = *a1;
  return objc_msgSend(*a2, sel_setKReticleADSlerpFactor_, a3);
}

char *keypath_get_selector_kADShowDepth()
{
  return sel_kADShowDepth;
}

id sub_22F2218AC@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kADShowDepth);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F2218E0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKADShowDepth_, *a1);
}

char *keypath_get_selector_kADGuidedFilterEnabled()
{
  return sel_kADGuidedFilterEnabled;
}

id sub_22F221900@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kADGuidedFilterEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F221934(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKADGuidedFilterEnabled_, *a1);
}

char *keypath_get_selector_kShouldReportMeasurements()
{
  return sel_kShouldReportMeasurements;
}

id sub_22F221954@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kShouldReportMeasurements);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F221988(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKShouldReportMeasurements_, *a1);
}

char *keypath_get_selector_kPEShowStats()
{
  return sel_kPEShowStats;
}

id sub_22F2219A8@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kPEShowStats);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F2219DC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKPEShowStats_, *a1);
}

char *keypath_get_selector_kPEShowAccuracy()
{
  return sel_kPEShowAccuracy;
}

id sub_22F2219FC@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kPEShowAccuracy);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F221A30(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKPEShowAccuracy_, *a1);
}

char *keypath_get_selector_kPEShowHitPoints()
{
  return sel_kPEShowHitPoints;
}

id sub_22F221A50@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kPEShowHitPoints);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F221A84(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKPEShowHitPoints_, *a1);
}

char *keypath_get_selector_kPEShowHitRay()
{
  return sel_kPEShowHitRay;
}

id sub_22F221AA4@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kPEShowHitRay);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F221AD8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKPEShowHitRay_, *a1);
}

char *keypath_get_selector_kResetDefaultOnStart()
{
  return sel_kResetDefaultOnStart;
}

id sub_22F221AF8@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kResetDefaultOnStart);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F221B2C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKResetDefaultOnStart_, *a1);
}

char *keypath_get_selector_kDrawDebugPlanes()
{
  return sel_kDrawDebugPlanes;
}

id sub_22F221B4C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kDrawDebugPlanes);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F221B80(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKDrawDebugPlanes_, *a1);
}

char *keypath_get_selector_kShowStatistics()
{
  return sel_kShowStatistics;
}

id sub_22F221BA0@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kShowStatistics);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F221BD4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKShowStatistics_, *a1);
}

char *keypath_get_selector_kShowOverallState()
{
  return sel_kShowOverallState;
}

id sub_22F221BF4@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kShowOverallState);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F221C28(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKShowOverallState_, *a1);
}

char *keypath_get_selector_kShowFeaturePoints()
{
  return sel_kShowFeaturePoints;
}

id sub_22F221C48@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kShowFeaturePoints);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F221C7C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKShowFeaturePoints_, *a1);
}

char *keypath_get_selector_kHideTapToRadar()
{
  return sel_kHideTapToRadar;
}

id sub_22F221C9C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kHideTapToRadar);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F221CD0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKHideTapToRadar_, *a1);
}

char *keypath_get_selector_kShowWorldAnchorDebugInfo()
{
  return sel_kShowWorldAnchorDebugInfo;
}

id sub_22F221CF0@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kShowWorldAnchorDebugInfo);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F221D24(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKShowWorldAnchorDebugInfo_, *a1);
}

char *keypath_get_selector_kShowRectangleDebugInfo()
{
  return sel_kShowRectangleDebugInfo;
}

id sub_22F221D44@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kShowRectangleDebugInfo);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F221D78(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKShowRectangleDebugInfo_, *a1);
}

char *keypath_get_selector_shouldEnableObjectMeasurements()
{
  return sel_shouldEnableObjectMeasurements;
}

id sub_22F221D98@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_shouldEnableObjectMeasurements);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F221DCC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldEnableObjectMeasurements_, *a1);
}

char *keypath_get_selector_shouldShowObjectDebugViews()
{
  return sel_shouldShowObjectDebugViews;
}

id sub_22F221DEC@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_shouldShowObjectDebugViews);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F221E20(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldShowObjectDebugViews_, *a1);
}

char *keypath_get_selector_shouldRenderOpaqueSurfaces()
{
  return sel_shouldRenderOpaqueSurfaces;
}

id sub_22F221E40@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_shouldRenderOpaqueSurfaces);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F221E74(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldRenderOpaqueSurfaces_, *a1);
}

char *keypath_get_selector_shouldVERefinePredictedBoundingBoxes()
{
  return sel_shouldVERefinePredictedBoundingBoxes;
}

id sub_22F221E94@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_shouldVERefinePredictedBoundingBoxes);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F221EC8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldVERefinePredictedBoundingBoxes_, *a1);
}

char *keypath_get_selector_shouldTuriRefinePredictedBoundingBoxes()
{
  return sel_shouldTuriRefinePredictedBoundingBoxes;
}

id sub_22F221EE8@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_shouldTuriRefinePredictedBoundingBoxes);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F221F1C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldTuriRefinePredictedBoundingBoxes_, *a1);
}

char *keypath_get_selector_shouldUseNormalsForBoxOrientation()
{
  return sel_shouldUseNormalsForBoxOrientation;
}

id sub_22F221F3C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_shouldUseNormalsForBoxOrientation);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F221F70(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldUseNormalsForBoxOrientation_, *a1);
}

char *keypath_get_selector_shouldArchiveSpatialMappingData()
{
  return sel_shouldArchiveSpatialMappingData;
}

id sub_22F221F90@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_shouldArchiveSpatialMappingData);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F221FC4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldArchiveSpatialMappingData_, *a1);
}

char *keypath_get_selector_kShowLightIntensityDebugInfo()
{
  return sel_kShowLightIntensityDebugInfo;
}

id sub_22F221FE4@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kShowLightIntensityDebugInfo);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222018(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKShowLightIntensityDebugInfo_, *a1);
}

char *keypath_get_selector_kDisableAllCoachingAndOnboarding()
{
  return sel_kDisableAllCoachingAndOnboarding;
}

id sub_22F222038@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kDisableAllCoachingAndOnboarding);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F22206C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKDisableAllCoachingAndOnboarding_, *a1);
}

char *keypath_get_selector_kCoachingCalloutEnabledV1()
{
  return sel_kCoachingCalloutEnabledV1;
}

id sub_22F22208C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kCoachingCalloutEnabledV1);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F2220C0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKCoachingCalloutEnabledV1_, *a1);
}

char *keypath_get_selector_kEnableRectangleDetection()
{
  return sel_kEnableRectangleDetection;
}

id sub_22F2220E0@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kEnableRectangleDetection);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222114(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKEnableRectangleDetection_, *a1);
}

char *keypath_get_selector_kEnableRectangleTracking()
{
  return sel_kEnableRectangleTracking;
}

id sub_22F222134@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kEnableRectangleTracking);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222168(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKEnableRectangleTracking_, *a1);
}

char *keypath_get_selector_kHideRectangleSuggestions()
{
  return sel_kHideRectangleSuggestions;
}

id sub_22F222188@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kHideRectangleSuggestions);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F2221BC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKHideRectangleSuggestions_, *a1);
}

char *keypath_get_selector_kADEdgeDetectionEnabled()
{
  return sel_kADEdgeDetectionEnabled;
}

id sub_22F2221DC@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kADEdgeDetectionEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222210(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKADEdgeDetectionEnabled_, *a1);
}

char *keypath_get_selector_throttleEdges()
{
  return sel_throttleEdges;
}

id sub_22F222230@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_throttleEdges);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222264(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setThrottleEdges_, *a1);
}

char *keypath_get_selector_showEDLines()
{
  return sel_showEDLines;
}

id sub_22F222284@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_showEDLines);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F2222B8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShowEDLines_, *a1);
}

char *keypath_get_selector_showFinalPlanes()
{
  return sel_showFinalPlanes;
}

id sub_22F2222D8@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_showFinalPlanes);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F22230C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShowFinalPlanes_, *a1);
}

char *keypath_get_selector_showRefinementPlanes()
{
  return sel_showRefinementPlanes;
}

id sub_22F22232C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_showRefinementPlanes);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222360(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShowRefinementPlanes_, *a1);
}

char *keypath_get_selector_showFilteredRefinementPlanes()
{
  return sel_showFilteredRefinementPlanes;
}

id sub_22F222380@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_showFilteredRefinementPlanes);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F2223B4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShowFilteredRefinementPlanes_, *a1);
}

char *keypath_get_selector_showSnappableEdges()
{
  return sel_showSnappableEdges;
}

id sub_22F2223D4@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_showSnappableEdges);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222408(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShowSnappableEdges_, *a1);
}

char *keypath_get_selector_kRayCastDistThreshold()
{
  return sel_kRayCastDistThreshold;
}

id sub_22F222428@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kRayCastDistThreshold);
  *a2 = v4;
  return result;
}

id sub_22F22245C(_DWORD *a1, id *a2, double a3)
{
  LODWORD(a3) = *a1;
  return objc_msgSend(*a2, sel_setKRayCastDistThreshold_, a3);
}

char *keypath_get_selector_kRayCastAngleThreshold()
{
  return sel_kRayCastAngleThreshold;
}

id sub_22F22247C@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kRayCastAngleThreshold);
  *a2 = v4;
  return result;
}

id sub_22F2224B0(_DWORD *a1, id *a2, double a3)
{
  LODWORD(a3) = *a1;
  return objc_msgSend(*a2, sel_setKRayCastAngleThreshold_, a3);
}

char *keypath_get_selector_guideSnapPointsEnabled()
{
  return sel_guideSnapPointsEnabled;
}

id sub_22F2224D0@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_guideSnapPointsEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222504(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setGuideSnapPointsEnabled_, *a1);
}

char *keypath_get_selector_showGuideSnapPoints()
{
  return sel_showGuideSnapPoints;
}

id sub_22F222524@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_showGuideSnapPoints);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222558(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShowGuideSnapPoints_, *a1);
}

char *keypath_get_selector_kEdgeDetectionEnabled()
{
  return sel_kEdgeDetectionEnabled;
}

id sub_22F222578@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kEdgeDetectionEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F2225AC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKEdgeDetectionEnabled_, *a1);
}

char *keypath_get_selector_kSnapReticleToEdges()
{
  return sel_kSnapReticleToEdges;
}

id sub_22F2225CC@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kSnapReticleToEdges);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222600(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKSnapReticleToEdges_, *a1);
}

char *keypath_get_selector_kEdgeDetectionDebugReticleEnabled()
{
  return sel_kEdgeDetectionDebugReticleEnabled;
}

id sub_22F222620@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kEdgeDetectionDebugReticleEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222654(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKEdgeDetectionDebugReticleEnabled_, *a1);
}

char *keypath_get_selector_kEdgeDetectionUniqueContours()
{
  return sel_kEdgeDetectionUniqueContours;
}

id sub_22F222674@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kEdgeDetectionUniqueContours);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F2226A8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKEdgeDetectionUniqueContours_, *a1);
}

char *keypath_get_selector_kShowPreciseMeasurement()
{
  return sel_kShowPreciseMeasurement;
}

id sub_22F2226C8@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kShowPreciseMeasurement);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F2226FC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKShowPreciseMeasurement_, *a1);
}

char *keypath_get_selector_kShowOppositeUnits()
{
  return sel_kShowOppositeUnits;
}

id sub_22F22271C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kShowOppositeUnits);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222750(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKShowOppositeUnits_, *a1);
}

char *keypath_get_selector_kLPShowPlane()
{
  return sel_kLPShowPlane;
}

id sub_22F222770@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kLPShowPlane);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F2227A4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKLPShowPlane_, *a1);
}

char *keypath_get_selector_kLPShowPoints()
{
  return sel_kLPShowPoints;
}

id sub_22F2227C4@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kLPShowPoints);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F2227F8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKLPShowPoints_, *a1);
}

char *keypath_get_selector_showsOnlyYukonEModes()
{
  return sel_showsOnlyYukonEModes;
}

id sub_22F222818@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_showsOnlyYukonEModes);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F22284C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShowsOnlyYukonEModes_, *a1);
}

char *keypath_get_selector_isLabelOcclusionEnabled()
{
  return sel_isLabelOcclusionEnabled;
}

id sub_22F22286C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isLabelOcclusionEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F2228A0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsLabelOcclusionEnabled_, *a1);
}

char *keypath_get_selector_labelFadesInAtSpot()
{
  return sel_labelFadesInAtSpot;
}

id sub_22F2228C0@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_labelFadesInAtSpot);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F2228F4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLabelFadesInAtSpot_, *a1);
}

char *keypath_get_selector_isLineOcclusionEnabled()
{
  return sel_isLineOcclusionEnabled;
}

id sub_22F222914@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isLineOcclusionEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222948(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsLineOcclusionEnabled_, *a1);
}

char *keypath_get_selector_isLineOcclusionAlphaBlendingEnabled()
{
  return sel_isLineOcclusionAlphaBlendingEnabled;
}

id sub_22F222968@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isLineOcclusionAlphaBlendingEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F22299C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsLineOcclusionAlphaBlendingEnabled_, *a1);
}

char *keypath_get_selector_isPointOcclusionEnabled()
{
  return sel_isPointOcclusionEnabled;
}

id sub_22F2229BC@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_isPointOcclusionEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F2229F0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsPointOcclusionEnabled_, *a1);
}

char *keypath_get_selector_kMLShowUnprojectedTrail()
{
  return sel_kMLShowUnprojectedTrail;
}

id sub_22F222A10@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kMLShowUnprojectedTrail);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222A44(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKMLShowUnprojectedTrail_, *a1);
}

char *keypath_get_selector_kMLShowSampledPoints()
{
  return sel_kMLShowSampledPoints;
}

id sub_22F222A64@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kMLShowSampledPoints);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222A98(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKMLShowSampledPoints_, *a1);
}

char *keypath_get_selector_kMLShowSegmentedBackground()
{
  return sel_kMLShowSegmentedBackground;
}

id sub_22F222AB8@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kMLShowSegmentedBackground);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222AEC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKMLShowSegmentedBackground_, *a1);
}

char *keypath_get_selector_kMLShowNormalsBackground()
{
  return sel_kMLShowNormalsBackground;
}

id sub_22F222B0C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kMLShowNormalsBackground);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222B40(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKMLShowNormalsBackground_, *a1);
}

char *keypath_get_selector_kPersonHeightEnabled()
{
  return sel_kPersonHeightEnabled;
}

id sub_22F222B60@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kPersonHeightEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222B94(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKPersonHeightEnabled_, *a1);
}

char *keypath_get_selector_kPersonHeightDebugViewEnabled()
{
  return sel_kPersonHeightDebugViewEnabled;
}

id sub_22F222BB4@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kPersonHeightDebugViewEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222BE8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKPersonHeightDebugViewEnabled_, *a1);
}

char *keypath_get_selector_kPersonHeightCoachingEnabled()
{
  return sel_kPersonHeightCoachingEnabled;
}

id sub_22F222C08@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kPersonHeightCoachingEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222C3C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKPersonHeightCoachingEnabled_, *a1);
}

char *keypath_get_selector_kPersonSegmentationAlwaysOn()
{
  return sel_kPersonSegmentationAlwaysOn;
}

id sub_22F222C5C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kPersonSegmentationAlwaysOn);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222C90(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKPersonSegmentationAlwaysOn_, *a1);
}

char *keypath_get_selector_kADShowPerson()
{
  return sel_kADShowPerson;
}

id sub_22F222CB0@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kADShowPerson);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222CE4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKADShowPerson_, *a1);
}

char *keypath_get_selector_kDivisionsEnabled()
{
  return sel_kDivisionsEnabled;
}

id sub_22F222D04@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_kDivisionsEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222D38(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKDivisionsEnabled_, *a1);
}

id sub_22F222D4C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logPlaneSelection);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222D80(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogPlaneSelection_, *a1);
}

char *keypath_get_selector_logObjectMeasurements()
{
  return sel_logObjectMeasurements;
}

id sub_22F222DA0@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logObjectMeasurements);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222DD4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogObjectMeasurements_, *a1);
}

id sub_22F222DE8@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logWorldRectangle);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222E1C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogWorldRectangle_, *a1);
}

char *keypath_get_selector_logUIContext()
{
  return sel_logUIContext;
}

id sub_22F222E3C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logUIContext);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222E70(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogUIContext_, *a1);
}

char *keypath_get_selector_logHapticFeedback()
{
  return sel_logHapticFeedback;
}

id sub_22F222E90@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logHapticFeedback);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222EC4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogHapticFeedback_, *a1);
}

char *keypath_get_selector_logComputerVision()
{
  return sel_logComputerVision;
}

id sub_22F222EE4@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logComputerVision);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222F18(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogComputerVision_, *a1);
}

char *keypath_get_selector_logARSession()
{
  return sel_logARSession;
}

id sub_22F222F38@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logARSession);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222F6C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogARSession_, *a1);
}

char *keypath_get_selector_logARSessionReplay()
{
  return sel_logARSessionReplay;
}

id sub_22F222F8C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logARSessionReplay);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F222FC0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogARSessionReplay_, *a1);
}

char *keypath_get_selector_logARSessionRecording()
{
  return sel_logARSessionRecording;
}

id sub_22F222FE0@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logARSessionRecording);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F223014(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogARSessionRecording_, *a1);
}

char *keypath_get_selector_logMotionUpdates()
{
  return sel_logMotionUpdates;
}

id sub_22F223034@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logMotionUpdates);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F223068(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogMotionUpdates_, *a1);
}

char *keypath_get_selector_logApplicationState()
{
  return sel_logApplicationState;
}

id sub_22F223088@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logApplicationState);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F2230BC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogApplicationState_, *a1);
}

id sub_22F2230D0@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logMeasureObject);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F223104(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogMeasureObject_, *a1);
}

char *keypath_get_selector_logLightEstimation()
{
  return sel_logLightEstimation;
}

id sub_22F223124@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logLightEstimation);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F223158(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogLightEstimation_, *a1);
}

char *keypath_get_selector_logCoaching()
{
  return sel_logCoaching;
}

id sub_22F223178@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logCoaching);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F2231AC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogCoaching_, *a1);
}

char *keypath_get_selector_logLabel()
{
  return sel_logLabel;
}

id sub_22F2231CC@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logLabel);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F223200(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogLabel_, *a1);
}

char *keypath_get_selector_logUIAction()
{
  return sel_logUIAction;
}

id sub_22F223220@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logUIAction);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F223254(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogUIAction_, *a1);
}

char *keypath_get_selector_logEdgeDetection()
{
  return sel_logEdgeDetection;
}

id sub_22F223274@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logEdgeDetection);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F2232A8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogEdgeDetection_, *a1);
}

char *keypath_get_selector_logEdgeSnapping()
{
  return sel_logEdgeSnapping;
}

id sub_22F2232C8@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logEdgeSnapping);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F2232FC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogEdgeSnapping_, *a1);
}

char *keypath_get_selector_logPersonHeight()
{
  return sel_logPersonHeight;
}

id sub_22F22331C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logPersonHeight);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F223350(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogPersonHeight_, *a1);
}

id sub_22F223364@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logPerf);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F223398(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogPerf_, *a1);
}

char *keypath_get_selector_logShaders()
{
  return sel_logShaders;
}

id sub_22F2233B8@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logShaders);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F2233EC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogShaders_, *a1);
}

id sub_22F223400@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logWorldAnchor);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F223434(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogWorldAnchor_, *a1);
}

id sub_22F223448@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logCoreVideo);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F22347C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogCoreVideo_, *a1);
}

char *keypath_get_selector_logArbitration()
{
  return sel_logArbitration;
}

id sub_22F22349C@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logArbitration);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F2234D0(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogArbitration_, *a1);
}

id sub_22F2234E4@<X0>(id *a1@<X0>, unsigned char *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_logMisc);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22F223518(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogMisc_, *a1);
}

void cva::MatrixData<double,0ul,0ul,false>::allocate()
{
}

{
  __assert_rtn("allocate", "matrixdata.h", 479, "(!m_data) || cva::detail::assertMessage(\"No matrix data must be allocated.\")");
}

void cva::SVD<cva::Matrix<double,0u,0u,false>,true>::decomposeRectangular<cva::Matrix<double,0u,0u,false>>()
{
  __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
}

void cva::SVD<cva::Matrix<double,0u,0u,false>,true>::decomposeDirect<0u,0u>()
{
  __assert_rtn("decomposeDirect", "matrixsvd.h", 433, "(info == 0) || cva::detail::assertMessage(\"gesvd() query workspace size failed!\")");
}

void cva::SVD<cva::Matrix<double,0u,0u,false>,true>::S()
{
  __assert_rtn("VectorAsDiagonalExpr", "vectorasdiagexpr.h", 211, "(std::min(rows, cols) <= vector.elements()) || cva::detail::assertMessage(\"The matrix can't be in both dimensions larger than its diagonal.\")");
}

void cva::assign<false,false,cva::Matrix<double,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<double,0u,0u,false> const>,cva::Matrix<double,0u,0u,false>>()
{
  __assert_rtn("assert_equal_size", "matrixfun.h", 163, "(lhs.rows() == rhs.rows() && lhs.columns() == rhs.columns()) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
}

void cva::assign<false,false,cva::Matrix<double,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<double,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<double,0u,1u,false>,0u,0u>>>()
{
  __assert_rtn("assert_in_bounds", "matrixmixin.h", 2252, "((row + nRows <= mixed().rows()) && (col + nCols <= mixed().columns())) || cva::detail::assertMessage(\"Index out of bounds!\")");
}

void cva::detail::assignNoAlias<cva::Matrix<double,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<double,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<double,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>()
{
}

{
  __assert_rtn("operator()", "matrixsubexpr.h", 192, "(row < rows() && column < columns()) || cva::detail::assertMessage(\"Out of range index being used on submatrix expression.\")");
}

uint64_t sub_22F2236B8()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_22F2236C8()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_22F2236D8()
{
  return MEMORY[0x270EEEFA8]();
}

uint64_t sub_22F2236E8()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t sub_22F2236F8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_22F223708()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_22F223718()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t sub_22F223728()
{
  return MEMORY[0x270EEFCA0]();
}

uint64_t sub_22F223738()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_22F223748()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_22F223758()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_22F223768()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_22F223778()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_22F223788()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_22F223798()
{
  return MEMORY[0x270EF02D8]();
}

uint64_t sub_22F2237A8()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_22F2237B8()
{
  return MEMORY[0x270EF09A8]();
}

uint64_t sub_22F2237C8()
{
  return MEMORY[0x270EF09B8]();
}

uint64_t sub_22F2237D8()
{
  return MEMORY[0x270EF0AF8]();
}

uint64_t _s17MeasureFoundation16MeasurementEventV4time0B04DateVvpfi_0()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_22F2237F8()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_22F223808()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_22F223818()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_22F223828()
{
  return MEMORY[0x270EF0CB8]();
}

uint64_t _s17MeasureFoundation11WorldAnchorC10identifier0B04UUIDVvpfi_0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_22F223848()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_22F223858()
{
  return MEMORY[0x270EF0D20]();
}

uint64_t sub_22F223868()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_22F223878()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_22F223888()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_22F223898()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_22F2238A8()
{
  return MEMORY[0x270EE3C98]();
}

uint64_t sub_22F2238B8()
{
  return MEMORY[0x270EE3E20]();
}

uint64_t sub_22F2238C8()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_22F2238D8()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_22F2238E8()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_22F2238F8()
{
  return MEMORY[0x270FA0A80]();
}

uint64_t sub_22F223908()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_22F223928()
{
  return MEMORY[0x270F9CFC0]();
}

uint64_t _s17MeasureFoundation10ObjectPoolC7objects33_8B01F5F47CB49D64DA54EB87E4B4A93DLLShyxGvpfi_0()
{
  return MEMORY[0x270F9CFC8]();
}

uint64_t sub_22F223948()
{
  return MEMORY[0x270F9D010]();
}

uint64_t sub_22F223958()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_22F223968()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_22F223978()
{
  return MEMORY[0x270F9D068]();
}

uint64_t sub_22F223988()
{
  return MEMORY[0x270F9D0A8]();
}

uint64_t sub_22F223998()
{
  return MEMORY[0x270F9D1C8]();
}

uint64_t sub_22F2239A8()
{
  return MEMORY[0x270F9D1D0]();
}

uint64_t sub_22F2239B8()
{
  return MEMORY[0x270F9D1F0]();
}

uint64_t sub_22F2239C8()
{
  return MEMORY[0x270F9D208]();
}

uint64_t sub_22F2239D8()
{
  return MEMORY[0x270F9D210]();
}

uint64_t sub_22F2239E8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_22F2239F8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_22F223A08()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_22F223A18()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_22F223A28()
{
  return MEMORY[0x270F9D480]();
}

uint64_t sub_22F223A38()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_22F223A48()
{
  return MEMORY[0x270F9D498]();
}

uint64_t sub_22F223A58()
{
  return MEMORY[0x270F9D510]();
}

uint64_t sub_22F223A68()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_22F223A78()
{
  return MEMORY[0x270F9D5A8]();
}

uint64_t sub_22F223A88()
{
  return MEMORY[0x270F9D5C0]();
}

uint64_t sub_22F223A98()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22F223AA8()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_22F223AB8()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_22F223AC8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22F223AD8()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_22F223AE8()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_22F223AF8()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_22F223B08()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_22F223B18()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_22F223B28()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22F223B38()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_22F223B48()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22F223B58()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_22F223B68()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_22F223B78()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_22F223B88()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_22F223B98()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_22F223BA8()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_22F223BB8()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_22F223BC8()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_22F223BD8()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_22F223BE8()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_22F223BF8()
{
  return MEMORY[0x270F9D938]();
}

uint64_t sub_22F223C08()
{
  return MEMORY[0x270F9D940]();
}

uint64_t sub_22F223C18()
{
  return MEMORY[0x270F9D948]();
}

uint64_t sub_22F223C28()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_22F223C38()
{
  return MEMORY[0x270F9D980]();
}

uint64_t sub_22F223C48()
{
  return MEMORY[0x270F9D9A0]();
}

uint64_t sub_22F223C58()
{
  return MEMORY[0x270F9D9A8]();
}

uint64_t sub_22F223C68()
{
  return MEMORY[0x270F9D9D0]();
}

uint64_t sub_22F223C78()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_22F223C88()
{
  return MEMORY[0x270F9DAC8]();
}

uint64_t sub_22F223C98()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_22F223CA8()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_22F223CB8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_22F223CC8()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_22F223CD8()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_22F223CE8()
{
  return MEMORY[0x270F9DBC8]();
}

uint64_t sub_22F223CF8()
{
  return MEMORY[0x270F9DBD0]();
}

uint64_t sub_22F223D08()
{
  return MEMORY[0x270F9DBE0]();
}

uint64_t sub_22F223D18()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_22F223D28()
{
  return MEMORY[0x270F9DC08]();
}

uint64_t sub_22F223D38()
{
  return MEMORY[0x270F9DC10]();
}

uint64_t sub_22F223D48()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_22F223D58()
{
  return MEMORY[0x270F9DC30]();
}

uint64_t sub_22F223D68()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_22F223D78()
{
  return MEMORY[0x270F9DC60]();
}

uint64_t sub_22F223D88()
{
  return MEMORY[0x270F9DC80]();
}

uint64_t sub_22F223D98()
{
  return MEMORY[0x270F9DC88]();
}

uint64_t sub_22F223DA8()
{
  return MEMORY[0x270F9DC98]();
}

uint64_t sub_22F223DB8()
{
  return MEMORY[0x270F9DCA8]();
}

uint64_t sub_22F223DC8()
{
  return MEMORY[0x270F9DCC8]();
}

uint64_t sub_22F223DD8()
{
  return MEMORY[0x270F9DCD8]();
}

uint64_t sub_22F223DE8()
{
  return MEMORY[0x270F9DCF8]();
}

uint64_t sub_22F223DF8()
{
  return MEMORY[0x270F9DD08]();
}

uint64_t sub_22F223E08()
{
  return MEMORY[0x270F9DD28]();
}

uint64_t sub_22F223E18()
{
  return MEMORY[0x270F9DE48]();
}

uint64_t sub_22F223E28()
{
  return MEMORY[0x270F9DEB8]();
}

uint64_t sub_22F223E38()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_22F223E48()
{
  return MEMORY[0x270F9DF28]();
}

uint64_t sub_22F223E58()
{
  return MEMORY[0x270F9DF38]();
}

uint64_t sub_22F223E68()
{
  return MEMORY[0x270F9DF58]();
}

uint64_t sub_22F223E78()
{
  return MEMORY[0x270F9DF80]();
}

uint64_t sub_22F223E88()
{
  return MEMORY[0x270F9DFC8]();
}

uint64_t sub_22F223E98()
{
  return MEMORY[0x270F9DFD0]();
}

uint64_t sub_22F223EA8()
{
  return MEMORY[0x270F9E018]();
}

uint64_t sub_22F223EB8()
{
  return MEMORY[0x270F9E050]();
}

uint64_t sub_22F223ED8()
{
  return MEMORY[0x270F9E060]();
}

uint64_t sub_22F223F18()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_22F223F28()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_22F223F38()
{
  return MEMORY[0x270F9E0C8]();
}

uint64_t sub_22F223F48()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_22F223F58()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_22F223F78()
{
  return MEMORY[0x270F9E138]();
}

uint64_t sub_22F223F88()
{
  return MEMORY[0x270F9E140]();
}

uint64_t sub_22F223F98()
{
  return MEMORY[0x270F9E178]();
}

uint64_t sub_22F223FA8()
{
  return MEMORY[0x270F9E1A8]();
}

uint64_t sub_22F223FB8()
{
  return MEMORY[0x270F9E1C0]();
}

uint64_t sub_22F223FC8()
{
  return MEMORY[0x270F9E1D0]();
}

uint64_t sub_22F223FD8()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_22F223FE8()
{
  return MEMORY[0x270F9E1E8]();
}

uint64_t sub_22F223FF8()
{
  return MEMORY[0x270F9E1F0]();
}

uint64_t sub_22F224008()
{
  return MEMORY[0x270F9E210]();
}

uint64_t sub_22F224018()
{
  return MEMORY[0x270F9E230]();
}

uint64_t sub_22F224028()
{
  return MEMORY[0x270F9E330]();
}

uint64_t sub_22F224038()
{
  return MEMORY[0x270FA13A8]();
}

uint64_t sub_22F224058()
{
  return MEMORY[0x270FA13C8]();
}

uint64_t sub_22F224068()
{
  return MEMORY[0x270FA13D0]();
}

uint64_t sub_22F224078()
{
  return MEMORY[0x270FA13D8]();
}

uint64_t sub_22F224088()
{
  return MEMORY[0x270F9C780]();
}

uint64_t sub_22F224098()
{
  return MEMORY[0x270EE5848]();
}

uint64_t sub_22F2240A8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_22F2240B8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_22F2240C8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_22F2240D8()
{
  return MEMORY[0x270FA2F20]();
}

uint64_t sub_22F2240E8()
{
  return MEMORY[0x270F9C798]();
}

uint64_t sub_22F2240F8()
{
  return MEMORY[0x270F9C7A8]();
}

uint64_t sub_22F224108()
{
  return MEMORY[0x270FA0D38]();
}

uint64_t sub_22F224118()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_22F224128()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_22F224138()
{
  return MEMORY[0x270FA13E0]();
}

uint64_t sub_22F224148()
{
  return MEMORY[0x270FA0F00]();
}

uint64_t sub_22F224158()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_22F224168()
{
  return MEMORY[0x270EF20C0]();
}

uint64_t sub_22F224178()
{
  return MEMORY[0x270EF20D8]();
}

uint64_t sub_22F224188()
{
  return MEMORY[0x270F9C7C0]();
}

uint64_t sub_22F224198()
{
  return MEMORY[0x270F9C7C8]();
}

uint64_t sub_22F2241A8()
{
  return MEMORY[0x270F9C7D0]();
}

uint64_t sub_22F2241B8()
{
  return MEMORY[0x270FA1170]();
}

uint64_t sub_22F2241C8()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_22F2241D8()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_22F2241E8()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_22F2241F8()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_22F224208()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_22F224218()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_22F224228()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_22F224238()
{
  return MEMORY[0x270EF2568]();
}

uint64_t sub_22F224248()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_22F224258()
{
  return MEMORY[0x270F9E658]();
}

uint64_t sub_22F224268()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_22F224278()
{
  return MEMORY[0x270F9E680]();
}

uint64_t sub_22F224288()
{
  return MEMORY[0x270F9E760]();
}

uint64_t sub_22F224298()
{
  return MEMORY[0x270F9E768]();
}

uint64_t sub_22F2242B8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22F2242C8()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_22F2242D8()
{
  return MEMORY[0x270F9E800]();
}

uint64_t sub_22F2242E8()
{
  return MEMORY[0x270F9E810]();
}

uint64_t sub_22F2242F8()
{
  return MEMORY[0x270F9E818]();
}

uint64_t sub_22F224308()
{
  return MEMORY[0x270F9E820]();
}

uint64_t sub_22F224318()
{
  return MEMORY[0x270F9E830]();
}

uint64_t sub_22F224328()
{
  return MEMORY[0x270F9E838]();
}

uint64_t sub_22F224338()
{
  return MEMORY[0x270F9E840]();
}

uint64_t sub_22F224348()
{
  return MEMORY[0x270F9E848]();
}

uint64_t sub_22F224358()
{
  return MEMORY[0x270F9E858]();
}

uint64_t sub_22F224368()
{
  return MEMORY[0x270F9E860]();
}

uint64_t sub_22F224378()
{
  return MEMORY[0x270F9E870]();
}

uint64_t sub_22F224388()
{
  return MEMORY[0x270F9E878]();
}

uint64_t sub_22F224398()
{
  return MEMORY[0x270F9E880]();
}

uint64_t sub_22F2243A8()
{
  return MEMORY[0x270F9E888]();
}

uint64_t sub_22F2243B8()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_22F2243C8()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_22F2243D8()
{
  return MEMORY[0x270F9E968]();
}

uint64_t sub_22F2243E8()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_22F2243F8()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22F224408()
{
  return MEMORY[0x270F9E9E0]();
}

uint64_t sub_22F224418()
{
  return MEMORY[0x270F9EA38]();
}

uint64_t sub_22F224428()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22F224438()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_22F224448()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22F224458()
{
  return MEMORY[0x270F9EB80]();
}

uint64_t sub_22F224468()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_22F224478()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_22F224488()
{
  return MEMORY[0x270F9EBD8]();
}

uint64_t sub_22F224498()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_22F2244A8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_22F2244B8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_22F2244C8()
{
  return MEMORY[0x270F9EC48]();
}

uint64_t sub_22F2244D8()
{
  return MEMORY[0x270F9EC88]();
}

uint64_t sub_22F2244E8()
{
  return MEMORY[0x270F9EC90]();
}

uint64_t sub_22F2244F8()
{
  return MEMORY[0x270F9ED20]();
}

uint64_t sub_22F224508()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_22F224518()
{
  return MEMORY[0x270F9EDA0]();
}

uint64_t sub_22F224528()
{
  return MEMORY[0x270F9EF38]();
}

uint64_t sub_22F224538()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_22F224548()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_22F224558()
{
  return MEMORY[0x270F9F010]();
}

uint64_t sub_22F224568()
{
  return MEMORY[0x270F9F018]();
}

uint64_t sub_22F224578()
{
  return MEMORY[0x270F9F030]();
}

uint64_t sub_22F224588()
{
  return MEMORY[0x270F9F038]();
}

uint64_t sub_22F224598()
{
  return MEMORY[0x270F9F040]();
}

uint64_t sub_22F2245A8()
{
  return MEMORY[0x270F9F048]();
}

uint64_t sub_22F2245B8()
{
  return MEMORY[0x270F9F050]();
}

uint64_t sub_22F2245C8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22F2245D8()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_22F2245E8()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_22F2245F8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_22F224608()
{
  return MEMORY[0x270F9F0D0]();
}

uint64_t sub_22F224628()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_22F224638()
{
  return MEMORY[0x270F9F300]();
}

uint64_t sub_22F224648()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_22F224658()
{
  return MEMORY[0x270F9F3C8]();
}

uint64_t sub_22F224668()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_22F224678()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_22F224688()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_22F224698()
{
  return MEMORY[0x270F9F440]();
}

uint64_t sub_22F2246A8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_22F2246B8()
{
  return MEMORY[0x270F9F4A8]();
}

uint64_t sub_22F2246C8()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_22F2246D8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22F2246E8()
{
  return MEMORY[0x270F9F4F8]();
}

uint64_t sub_22F2246F8()
{
  return MEMORY[0x270F9F738]();
}

uint64_t sub_22F224708()
{
  return MEMORY[0x270F9F740]();
}

uint64_t sub_22F224718()
{
  return MEMORY[0x270F9F770]();
}

uint64_t sub_22F224728()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_22F224738()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22F224748()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_22F224758()
{
  return MEMORY[0x270F9FA60]();
}

uint64_t sub_22F224768()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_22F224778()
{
  return MEMORY[0x270F9FA70]();
}

uint64_t sub_22F224788()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_22F224798()
{
  return MEMORY[0x270F9FAD0]();
}

uint64_t sub_22F2247A8()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_22F2247B8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_22F2247C8()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_22F2247D8()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_22F2247E8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22F2247F8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22F224808()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_22F224818()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_22F224828()
{
  return MEMORY[0x270F9FCA8]();
}

uint64_t sub_22F224838()
{
  return MEMORY[0x270F9FCD0]();
}

uint64_t sub_22F224848()
{
  return MEMORY[0x270F9FCD8]();
}

uint64_t sub_22F224858()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_22F224868()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_22F224898()
{
  return MEMORY[0x270FA0128]();
}

uint64_t ARCameraFieldOfViewFromIntrinsics()
{
  return MEMORY[0x270F08CD0]();
}

uint64_t ARCameraImageToViewTransform()
{
  return MEMORY[0x270F08CD8]();
}

uint64_t ARCameraToDisplayRotation()
{
  return MEMORY[0x270F08CE0]();
}

uint64_t ARViewToCameraImageTransform()
{
  return MEMORY[0x270F08E20]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x270EE5960](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x270EE5978](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59D8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x270EE5A48](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x270EE5A68]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C60]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  MEMORY[0x270EE7148](t, (__n128)point, *(__n128 *)&point.y);
  result.float y = v3;
  result.float x = v2;
  return result;
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.float y = v3;
  result.origin.float x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.float y = v4;
  result.origin.float x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.float y = v2;
  result.origin.float x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.float y = v3;
  result.origin.float x = v2;
  return result;
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x270EEA0E0](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x270EEA0F0](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x270EEA110](image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA150](allocator, width, height, *(void *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA168](allocator, width, height, *(void *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA170](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA220](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA250](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x270EF4C28](properties);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x270EF4C58](buffer);
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EF4C80](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerElement(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4CA0](buffer);
}

size_t IOSurfaceGetBytesPerElementOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4CA8](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4CB0](buffer);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4CC0](buffer, planeIndex);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D48](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4D58](buffer, planeIndex);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4DE0](buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4DF0](buffer, planeIndex);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E18](buffer, *(void *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E88](buffer, *(void *)&options, seed);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

SCNMatrix4 *__cdecl SCNMatrix4MakeRotation(SCNMatrix4 *__return_ptr retstr, float angle, float x, float y, float z)
{
  return (SCNMatrix4 *)MEMORY[0x270EFD280](retstr, angle, x, y, z);
}

SCNMatrix4 *__cdecl SCNMatrix4Mult(SCNMatrix4 *__return_ptr retstr, SCNMatrix4 *a, SCNMatrix4 *b)
{
  return (SCNMatrix4 *)MEMORY[0x270EFD288](retstr, a, b);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F82D80]();
}

void UIRectFill(CGRect rect)
{
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x270F067E0](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x270F067F0](session, sourceBuffer, destinationBuffer);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t cva::Logger::logInCategory()
{
  return MEMORY[0x270F18AC0]();
}

uint64_t cva::Logger::instance(cva::Logger *this)
{
  return MEMORY[0x270F18AC8](this);
}

void cva::VecLib<double>::gemm()
{
  while (1)
    ;
}

uint64_t cva::vecLib::gesvd<double>()
{
  return MEMORY[0x270F18AE0]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x270ED7E18]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x270ED7E20]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x270FA0150]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

float atanf(float a1)
{
  MEMORY[0x270ED86C0](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

float cosf(float a1)
{
  MEMORY[0x270ED9130](a1);
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

double drand48(void)
{
  MEMORY[0x270ED9670]();
  return result;
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

uint64_t lroundf(float a1)
{
  return MEMORY[0x270EDA110](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x270EDAAD8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x270FA01D0]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x270FA01D8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x270FA0250]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x270FA0270]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x270FA0278]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x270FA0288]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x270FA0290]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x270FA0330]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x270FA0420]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x270FA0430]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x270FA04F8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x270FA05B8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x270FA05C0]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x270FA05C8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x270FA0610]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x270FA0618]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x270FA0620]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x270FA0630]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x270FA0648]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x270FA0650]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x270FA0658]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

int uname(utsname *a1)
{
  return MEMORY[0x270EDB998](a1);
}

vImage_Error vImageConvert_PlanarFToBGRX8888(const vImage_Buffer *blue, const vImage_Buffer *green, const vImage_Buffer *red, Pixel_8 alpha, const vImage_Buffer *dest, const Pixel_FFFF maxFloat, const Pixel_FFFF minFloat, vImage_Flags flags)
{
  return MEMORY[0x270EDF0B0](blue, green, red, alpha, dest, maxFloat, minFloat, *(void *)&flags);
}

vImage_Error vImageConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const int16_t *kernel, uint32_t kernel_height, uint32_t kernel_width, int32_t divisor, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x270EDF190](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, *(void *)&kernel_height, *(void *)&kernel_width);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF328](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_ARGBFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF340](src, dest, tempBuffer, *(void *)&flags);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x270EDF380](src, dest, tempBuffer, *(void *)&flags);
}