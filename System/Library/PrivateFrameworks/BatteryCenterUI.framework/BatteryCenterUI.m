uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

uint64_t objectdestroy_8Tm()
{
  uint64_t v1 = sub_1DADF61D0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = (int *)(type metadata accessor for BCUI2x4AvocadoView() - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(*(void *)v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  swift_release();
  uint64_t v7 = v6 + v1[7];
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);

  return MEMORY[0x1F4186498](v0, v4, v5);
}

uint64_t objectdestroyTm_0()
{
  sub_1DADB6340(*(id *)(v0 + 16), *(unsigned char *)(v0 + 24));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 104, 7);
}

uint64_t objectdestroyTm_1()
{
  uint64_t v1 = (int *)type metadata accessor for BCUI2x2AvocadoView(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1DADF6790();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v3 + v4;
  sub_1DADABA40(*(void *)(v5 + v1[5]), *(unsigned char *)(v5 + v1[5] + 8));
  swift_release();
  uint64_t v8 = v5 + v1[7];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
  v10(v8, v9);
  v10(v5 + v1[8], v9);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, v7, v2 | 7);
}

uint64_t objectdestroyTm_2()
{
  uint64_t v1 = (int *)type metadata accessor for BCUIRingAndGlyphView(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682688);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1DADF5DA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v5 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_1DADF6790();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = v2 | 7;
  uint64_t v10 = v3 + v4;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v11 = v5 + v1[13];
  swift_release();
  swift_release();
  uint64_t v12 = v11 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v13 = sub_1DADF5D80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  swift_release();
  uint64_t v14 = v5 + v1[15];
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, v10, v9);
}

uint64_t objectdestroyTm_3()
{
  uint64_t v1 = (int *)type metadata accessor for BatteryAvocadoArchivableView();
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_1DADB6340(*(id *)(v0 + v3), *(unsigned char *)(v0 + v3 + 8));
  uint64_t v6 = v0 + v3 + v1[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1DADF5C00();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  uint64_t v8 = v5 + v1[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_1DADF5D80();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  else
  {
    swift_release();
  }
  sub_1DADABA40(*(void *)(v5 + v1[7]), *(unsigned char *)(v5 + v1[7] + 8));
  uint64_t v10 = v5 + v1[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_1DADF5A60();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }
  uint64_t v12 = v5 + v1[9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v13 = sub_1DADF60F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  }
  else
  {
    swift_release();
  }
  sub_1DADD7CA0();

  return MEMORY[0x1F4186498](v0, v3 + v4, v2 | 7);
}

uint64_t objectdestroyTm_4()
{
  uint64_t v1 = (int *)type metadata accessor for BCUIBoltView(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1DADF5C00();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  sub_1DADABA40(*(void *)(v5 + v1[5]), *(unsigned char *)(v5 + v1[5] + 8));
  uint64_t v7 = v5 + v1[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v8 = sub_1DADF6790();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  uint64_t v9 = v2 | 7;
  uint64_t v10 = v3 + v4;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v11 = v5 + v1[8];
  swift_release();
  swift_release();
  uint64_t v12 = v11 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v13 = sub_1DADF5D80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  swift_release();
  swift_release();
  uint64_t v14 = v5 + v1[11];
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  v16 = *(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8);
  v16(v14, v15);
  v16(v5 + v1[12], v15);

  return MEMORY[0x1F4186498](v0, v10, v9);
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t objectdestroy_5Tm()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return MEMORY[0x1F4186498](v0, 88, 7);
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

double BCUI6x8ColumnWidthForBounds(double a1, double a2, double a3, double a4)
{
  CGFloat Width = CGRectGetWidth(*(CGRect *)&a1);
  double v5 = (Width + -72.0) * 0.125;
  BOOL v6 = Width == 72.0;
  BOOL v7 = Width < 72.0;
  double result = 0.0;
  if (!v7 && !v6) {
    return v5;
  }
  return result;
}

CGFloat BCUI6x8RowHeightForBounds(double a1, double a2, double a3, double a4)
{
  return CGRectGetHeight(*(CGRect *)&a1) / 6.0;
}

void sub_1DAD9A21C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1DAD9B0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_1DAD9CBAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DAD9D18C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,char a25)
{
  objc_destroyWeak(v25);
  _Block_object_dispose(&a25, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1DAD9D534(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DADA01D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

CGFloat CoordinatesOfPointAtArcFraction(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double Width = CGRectGetWidth(*(CGRect *)&a1);
  v17.origin.x = a1;
  v17.origin.y = a2;
  v17.size.width = a3;
  v17.size.height = a4;
  double Height = CGRectGetHeight(v17);
  if (Width <= Height) {
    double Height = Width;
  }
  double v12 = Height * 0.5;
  float v13 = (a5 + -0.75 + a5 + -0.75) * 3.14159265;
  double v14 = v12 * __sincosf_stret(v13).__cosval;
  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  CGFloat v15 = CGRectGetMidX(v18) - v14;
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.width = a3;
  v19.size.height = a4;
  CGRectGetMidY(v19);
  return v15;
}

uint64_t __NewRingCapShadowImage_block_invoke(uint64_t a1, void *a2)
{
  CGFloat v3 = *(double *)(a1 + 64);
  CGFloat v4 = *(double *)(a1 + 72) * 0.5;
  CGFloat v5 = *(double *)(a1 + 40);
  CGFloat v6 = *(double *)(a1 + 48);
  CGFloat v7 = *(double *)(a1 + 56);
  id v8 = a2;
  v22.origin.x = v5;
  v22.origin.y = v6;
  v22.size.width = v7;
  v22.size.height = v3;
  CGRect v23 = CGRectInset(v22, v4, v4);
  CoordinatesOfPointAtArcFraction(v23.origin.x, v23.origin.y, v23.size.width, v23.size.height, 0.75);
  UIPointRoundToScale();
  CGFloat v10 = *(double *)(a1 + 88) * 0.5 - v9;
  CGFloat v12 = *(double *)(a1 + 96) * 0.5 - v11;
  CGFloat Width = CGRectGetWidth(*(CGRect *)(a1 + 40));
  CGFloat Height = CGRectGetHeight(*(CGRect *)(a1 + 40));
  CGFloat v15 = (CGContext *)[v8 CGContext];

  v24.origin.x = v10;
  v24.origin.y = v12;
  v24.size.width = Width;
  v24.size.height = Height;
  CGContextClipToMask(v15, v24, *(CGImageRef *)(a1 + 104));
  CGImageRelease(*(CGImageRef *)(a1 + 104));
  v16 = [MEMORY[0x1E4FB1618] colorWithRed:0.560784314 green:0.560784314 blue:0.560784314 alpha:1.0];
  [v16 set];

  CGRect v17 = *(void **)(a1 + 32);
  double v18 = *MEMORY[0x1E4F1DAD8];
  double v19 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);

  return objc_msgSend(v17, "drawAtPoint:", v18, v19);
}

id sub_1DADA4F10(uint64_t a1, uint64_t a2)
{
  CGFloat v4 = self;
  id v5 = objc_msgSend(self, sel_traitCollectionWithPreferredContentSizeCategory_, a2);
  id v6 = objc_msgSend(v4, sel_preferredFontForTextStyle_compatibleWithTraitCollection_, a1, v5);

  return v6;
}

uint64_t sub_1DADA4FA0()
{
  uint64_t v0 = sub_1DADF5C00();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790]();
  CGFloat v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = objc_msgSend(self, sel_tertiarySystemBackgroundColor);
  MEMORY[0x1E01818F0](v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4F3C5C0], v0);
  sub_1DADF5BF0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  uint64_t v5 = sub_1DADF64E0();
  swift_release();
  return v5;
}

double sub_1DADA50F4(double a1, double a2, double a3, double a4, double a5)
{
  return a1 - (a1 - a2) * (a3 - a5) / (a3 - a4);
}

uint64_t sub_1DADA5114@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1DADF6030();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  MEMORY[0x1F4188790]();
  double v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DADA5D48(v2, (uint64_t)v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_1DADF5C00();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v10 - 8) + 32))(a1, v9, v10);
  }
  else
  {
    os_log_type_t v12 = sub_1DADF69F0();
    float v13 = sub_1DADF6200();
    if (os_log_type_enabled(v13, v12))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v17 = v15;
      *(_DWORD *)uint64_t v14 = 136315138;
      *(void *)(v14 + 4) = sub_1DADA5DB0(0x686353726F6C6F43, 0xEB00000000656D65, &v17);
      _os_log_impl(&dword_1DAD96000, v13, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1E01829D0](v15, -1, -1);
      MEMORY[0x1E01829D0](v14, -1, -1);
    }

    sub_1DADF6020();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_1DADA53A0()
{
  return sub_1DADF5EB0();
}

uint64_t sub_1DADA53C4(uint64_t a1)
{
  sub_1DADF5C00();
  MEMORY[0x1F4188790]();
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1DADF5EC0();
}

uint64_t sub_1DADA548C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1DADF64A0();
  *a1 = result;
  return result;
}

uint64_t sub_1DADA54B4@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1DADA550C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1DADA5514(a1, a2);
}

uint64_t sub_1DADA5514(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADA5584()
{
  return sub_1DADF63B0();
}

uint64_t sub_1DADA55A4()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for Utilities()
{
  return &type metadata for Utilities;
}

uint64_t *sub_1DADA55D0(uint64_t *a1, uint64_t *a2)
{
  int v4 = *(_DWORD *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68) - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v6 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v6 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = sub_1DADF5C00();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1DADA56DC(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v2 = sub_1DADF5C00();
    uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
    return v3(a1, v2);
  }
  else
  {
    return swift_release();
  }
}

void *sub_1DADA5780(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1DADF5C00();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_1DADA583C(void *a1, void *a2)
{
  if (a1 != a2)
  {
    sub_1DADA5908((uint64_t)a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v4 = sub_1DADF5C00();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1DADA5908(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_1DADA5968(void *a1, const void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_1DADF5C00();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
  }
  return a1;
}

void *sub_1DADA5A2C(void *a1, const void *a2)
{
  if (a1 != a2)
  {
    sub_1DADA5908((uint64_t)a1);
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v5 = sub_1DADF5C00();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v4 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1DADA5B00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DADA5B14);
}

uint64_t sub_1DADA5B14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_1DADA5B84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DADA5B98);
}

uint64_t sub_1DADA5B98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A8);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for Utilities.Background()
{
  uint64_t result = qword_1EA8F9060;
  if (!qword_1EA8F9060) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1DADA5C58()
{
  sub_1DADA5CE4();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1DADA5CE4()
{
  if (!qword_1EB6835B8)
  {
    sub_1DADF5C00();
    unint64_t v0 = sub_1DADF5C10();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB6835B8);
    }
  }
}

uint64_t sub_1DADA5D3C()
{
  return MEMORY[0x1E4F3EB88];
}

uint64_t sub_1DADA5D48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1DADA5DB0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_1DADA5E84(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1DADA5F84((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1DADA5F84((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_1DADA5E84(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = sub_1DADA5FE0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_1DADF6B00();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1DADA5F84(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1DADA5FE0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1DADA6078(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_1DADA617C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_1DADA617C((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1DADA6078(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1DADA6114(v2, 0);
      uint64_t result = sub_1DADF6AD0();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_1DADF6880();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1DADA6114(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F84F0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1DADA617C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F84F0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  os_log_type_t v12 = v10 + 32;
  float v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1DADA6268()
{
  return swift_deallocClassInstance();
}

id sub_1DADA6278()
{
  _s13currentBundleCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_1EB6847F8 = (uint64_t)result;
  return result;
}

uint64_t *sub_1DADA62CC()
{
  if (qword_1EB684260 != -1) {
    swift_once();
  }
  return &qword_1EB6847F8;
}

id sub_1DADA6318()
{
  if (qword_1EB684260 != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)qword_1EB6847F8;

  return v0;
}

unint64_t BCBatteryDevice.isLeftHeadPhone.getter()
{
  return (unint64_t)objc_msgSend(v0, sel_parts) & 1;
}

unint64_t BCBatteryDevice.isRightHeadPhone.getter()
{
  return ((unint64_t)objc_msgSend(v0, sel_parts) >> 1) & 1;
}

unint64_t BCBatteryDevice.isHeadPhoneCase.getter()
{
  return ((unint64_t)objc_msgSend(v0, sel_parts) >> 2) & 1;
}

uint64_t BCBatteryDevice.priority.getter()
{
  return sub_1DADA63F4(v0);
}

uint64_t sub_1DADA63F4(void *a1)
{
  if (objc_msgSend(a1, sel_isLowBattery) && (uint64_t)objc_msgSend(a1, sel_percentCharge) >= 1)
  {
    uint64_t result = (uint64_t)objc_msgSend(a1, sel_percentCharge);
    if (__OFADD__(result, 1))
    {
      __break(1u);
    }
    else if (result != -1)
    {
      return result;
    }
    __break(1u);
    return result;
  }
  if (objc_msgSend(a1, sel_accessoryCategory) != (id)2
    || (uint64_t)objc_msgSend(a1, sel_percentCharge) < 1
    || (uint64_t result = (uint64_t)objc_msgSend(a1, sel_parts), LODWORD(v3) = 1.0, (result & 4) != 0))
  {
    if (objc_msgSend(a1, sel_accessoryCategory, v3) != (id)10
      || (uint64_t result = (uint64_t)objc_msgSend(a1, sel_percentCharge), result <= 0))
    {
      if (objc_msgSend(a1, sel_accessoryCategory) != (id)3
        || (uint64_t result = (uint64_t)objc_msgSend(a1, sel_percentCharge), result <= 0))
      {
        if (objc_msgSend(a1, sel_accessoryCategory) != (id)7
          || (uint64_t result = (uint64_t)objc_msgSend(a1, sel_percentCharge), result <= 0))
        {
          if (objc_msgSend(a1, sel_accessoryCategory) != (id)5
            || (uint64_t result = (uint64_t)objc_msgSend(a1, sel_percentCharge), result <= 0))
          {
            if (objc_msgSend(a1, sel_accessoryCategory) != (id)6
              || (uint64_t result = (uint64_t)objc_msgSend(a1, sel_percentCharge), result <= 0))
            {
              if (objc_msgSend(a1, sel_accessoryCategory) != (id)9
                || (uint64_t result = (uint64_t)objc_msgSend(a1, sel_percentCharge), result <= 0))
              {
                if (objc_msgSend(a1, sel_accessoryCategory) != (id)8
                  || (uint64_t result = (uint64_t)objc_msgSend(a1, sel_percentCharge), result <= 0))
                {
                  if (objc_msgSend(a1, sel_accessoryCategory) != (id)2
                    || (uint64_t)objc_msgSend(a1, sel_percentCharge) < 1
                    || (uint64_t result = (uint64_t)objc_msgSend(a1, sel_parts), LODWORD(v4) = 9.0, (result & 4) == 0))
                  {
                    if (objc_msgSend(a1, sel_accessoryCategory, v4) != (id)4
                      || (uint64_t result = (uint64_t)objc_msgSend(a1, sel_percentCharge), result <= 0))
                    {
                      uint64_t result = (uint64_t)objc_msgSend(a1, sel_accessoryCategory);
                      if (result == 1) {
                        return (uint64_t)objc_msgSend(a1, sel_percentCharge);
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL sub_1DADA66AC(void *a1, id a2)
{
  return objc_msgSend(a1, sel_accessoryCategory) == a2 && (uint64_t)objc_msgSend(a1, sel_percentCharge) > 0;
}

uint64_t sub_1DADA6704()
{
  return *v0;
}

uint64_t sub_1DADA670C()
{
  return *(unsigned __int8 *)(v0 + 1);
}

double sub_1DADA6714()
{
  return *(double *)(v0 + 8);
}

uint64_t sub_1DADA671C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1DADA674C()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1DADA677C()
{
  return swift_retain();
}

void sub_1DADA6784(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = sub_1DADF5AD0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v8);
  float v13 = (char *)&v80 - v12;
  MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)&v80 - v14;
  if (a2)
  {
    if (a2 == 1)
    {
      id v16 = a1;
      uint64_t v17 = sub_1DADF08BC();
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v13, v17, v6);
      double v18 = sub_1DADF5AB0();
      os_log_type_t v19 = sub_1DADF6A00();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1DAD96000, v18, v19, "BatteryDeviceData|Not Connected", v20, 2u);
        MEMORY[0x1E01829D0](v20, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
      sub_1DADA73E8(0, qword_1EB6833B8);
      v21 = (void *)sub_1DADF6A70();
      sub_1DADF6970();
      uint64_t v23 = v22;

      if (qword_1EB684260 != -1) {
        swift_once();
      }
      uint64_t v24 = sub_1DADF5A10();
      unint64_t v26 = v25;
      id v27 = objc_msgSend(v16, sel_displayString);
      uint64_t v28 = sub_1DADF6840();
      unint64_t v30 = v29;

      id v31 = objc_msgSend(v16, sel_systemImageName);
      if (v31)
      {
        v32 = v31;
        v33 = a1;
        uint64_t v84 = a3;
        sub_1DADF6840();

        id v34 = objc_msgSend(v16, sel_isCustomImage);
        v35 = v34;
        if (v34)
        {
          unsigned __int8 v36 = objc_msgSend(v34, sel_BOOLValue);
          swift_bridgeObjectRetain();
          uint64_t v37 = sub_1DADF6520();
          if (v36)
          {
            sub_1DADA73E8(0, &qword_1EA8F86C0);
            uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
            uint64_t v39 = self;
            v82 = v37;
            uint64_t v40 = v24;
            v41 = (void *)v39;
            swift_bridgeObjectRetain();
            v42 = v41;
            uint64_t v24 = v40;
            id v43 = objc_msgSend(v42, sel_bundleForClass_, ObjCClassFromMetadata);
            uint64_t v44 = sub_1DADF6550();
            swift_release();
            sub_1DADA73D4(v33, 1u);
            sub_1DADA73D4(v33, 1u);
            swift_bridgeObjectRelease();

            char v45 = 0;
            LOBYTE(v35) = 0;
          }
          else
          {
            sub_1DADA73D4(a1, 1u);
            sub_1DADA73D4(a1, 1u);
            swift_bridgeObjectRelease();

            char v45 = 0;
            LOBYTE(v35) = 0;
            uint64_t v44 = v37;
          }
          a3 = v84;
        }
        else
        {
          sub_1DADA73D4(a1, 1u);
          sub_1DADA73D4(a1, 1u);
          swift_bridgeObjectRelease();
          uint64_t v44 = 0;
          char v45 = 0;
          a3 = v84;
        }
        goto LABEL_32;
      }
      sub_1DADA73D4(a1, 1u);
      sub_1DADA73D4(a1, 1u);
      uint64_t v44 = 0;
    }
    else
    {
      uint64_t v55 = sub_1DADF08BC();
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v55, v6);
      v56 = sub_1DADF5AB0();
      os_log_type_t v57 = sub_1DADF6A00();
      if (os_log_type_enabled(v56, v57))
      {
        v58 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v58 = 0;
        _os_log_impl(&dword_1DAD96000, v56, v57, "BatteryDeviceData|error", v58, 2u);
        MEMORY[0x1E01829D0](v58, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      sub_1DADA73E8(0, qword_1EB6833B8);
      v59 = (void *)sub_1DADF6A70();
      sub_1DADF6970();
      uint64_t v23 = v60;

      if (qword_1EB684260 != -1) {
        swift_once();
      }
      unint64_t v30 = 0xE000000000000000;
      uint64_t v24 = sub_1DADF5A10();
      unint64_t v26 = v61;
      uint64_t v44 = 0;
      uint64_t v28 = 0;
    }
    char v45 = 0;
    LOBYTE(v35) = 0;
    goto LABEL_32;
  }
  id v46 = a1;
  uint64_t v47 = sub_1DADF08BC();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v15, v47, v6);
  id v48 = v46;
  v49 = sub_1DADF5AB0();
  os_log_type_t v50 = sub_1DADF6A00();
  BOOL v51 = os_log_type_enabled(v49, v50);
  id v83 = a1;
  uint64_t v84 = a3;
  if (v51)
  {
    v82 = v49;
    v52 = (uint8_t *)swift_slowAlloc();
    v81 = (void *)swift_slowAlloc();
    *(_DWORD *)v52 = 138412290;
    uint64_t v85 = (uint64_t)v48;
    id v53 = v48;
    v49 = v82;
    sub_1DADF6A90();
    v54 = v81;
    void *v81 = a1;
    sub_1DADA73D4(a1, 0);
    sub_1DADA73D4(a1, 0);
    _os_log_impl(&dword_1DAD96000, v49, v50, "BatteryDeviceData|Connected|%@", v52, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F85F0);
    swift_arrayDestroy();
    MEMORY[0x1E01829D0](v54, -1, -1);
    MEMORY[0x1E01829D0](v52, -1, -1);
  }
  else
  {
    sub_1DADA73D4(a1, 0);
    sub_1DADA73D4(a1, 0);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v15, v6);
  LOBYTE(v35) = objc_msgSend(v48, sel_isCharging);
  objc_msgSend(v48, sel_percentCharge);
  v62 = (void *)sub_1DADF69C0();
  sub_1DADF6970();
  uint64_t v23 = v63;

  id v64 = objc_msgSend(self, sel_bcui_newPercentChargeFormatter);
  v65 = (void *)sub_1DADF5A70();
  id v66 = objc_msgSend(v64, sel_stringFromNumber_, v65);

  if (v66)
  {
    uint64_t v67 = sub_1DADF6840();
    unint64_t v26 = v68;
  }
  else
  {
    uint64_t v85 = 0;
    unint64_t v86 = 0xE000000000000000;
    sub_1DADF69A0();
    uint64_t v67 = v85;
    unint64_t v26 = v86;
  }
  id v69 = objc_msgSend(v48, sel_name);
  v82 = v67;
  if (v69)
  {
    v70 = v69;
    uint64_t v28 = sub_1DADF6840();
    unint64_t v30 = v71;
  }
  else
  {
    uint64_t v28 = 0;
    unint64_t v30 = 0xE000000000000000;
  }
  LOBYTE(v85) = 0;
  id v72 = objc_msgSend(v48, sel_batteryWidgetGlyphName_, &v85);
  sub_1DADF6840();

  int v73 = v85;
  swift_bridgeObjectRetain();
  uint64_t v74 = sub_1DADF6520();
  if (v73 == 1)
  {
    sub_1DADA73E8(0, &qword_1EA8F86C0);
    uint64_t v75 = swift_getObjCClassFromMetadata();
    v76 = self;
    swift_bridgeObjectRetain();
    id v77 = objc_msgSend(v76, sel_bundleForClass_, v75);
    uint64_t v44 = sub_1DADF6550();
    swift_release();
    id v78 = v83;
    sub_1DADA73D4(v83, 0);
    sub_1DADA73D4(v78, 0);
    swift_bridgeObjectRelease();
    char v45 = 1;
  }
  else
  {
    id v79 = v83;
    sub_1DADA73D4(v83, 0);
    sub_1DADA73D4(v79, 0);
    swift_bridgeObjectRelease();
    char v45 = 1;
    uint64_t v44 = v74;
  }
  a3 = v84;
  uint64_t v24 = (uint64_t)v82;
LABEL_32:
  *(unsigned char *)a3 = (_BYTE)v35;
  *(unsigned char *)(a3 + 1) = v45;
  *(void *)(a3 + 8) = v23;
  *(void *)(a3 + 16) = v24;
  *(void *)(a3 + 24) = v26;
  *(void *)(a3 + 32) = v28;
  *(void *)(a3 + 40) = v30;
  *(void *)(a3 + 48) = v44;
}

uint64_t sub_1DADA7168(uint64_t a1, uint64_t a2, char a3)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_1DADF6520();
  if (a3)
  {
    sub_1DADA73E8(0, &qword_1EA8F86C0);
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    uint64_t v6 = self;
    swift_bridgeObjectRetain();
    id v7 = objc_msgSend(v6, sel_bundleForClass_, ObjCClassFromMetadata);
    uint64_t v8 = sub_1DADF6550();
    swift_release();
    return v8;
  }
  return result;
}

uint64_t sub_1DADA7238()
{
  return 0;
}

void sub_1DADA73D4(id a1, unsigned __int8 a2)
{
  if (a2 <= 1u) {
}
  }

uint64_t sub_1DADA73E8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t _s13currentBundleCMa()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for BatteryDeviceData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for BatteryDeviceData()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for BatteryDeviceData(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v3;
  uint64_t v4 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for BatteryDeviceData(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for BatteryDeviceData(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for BatteryDeviceData(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BatteryDeviceData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BatteryDeviceData()
{
  return &type metadata for BatteryDeviceData;
}

uint64_t sub_1DADA76D4(uint64_t a1)
{
  return sub_1DADA7764(a1, 0xD000000000000012, 0x80000001DADFACB0, &qword_1EA8F90F8);
}

uint64_t sub_1DADA76F8(uint64_t a1)
{
  return sub_1DADA7764(a1, 0xD000000000000017, 0x80000001DADFACD0, &qword_1EA8F9108);
}

uint64_t sub_1DADA771C(uint64_t a1)
{
  return sub_1DADA7764(a1, 0xD000000000000011, 0x80000001DADFACF0, &qword_1EA8F9118);
}

uint64_t sub_1DADA7740(uint64_t a1)
{
  return sub_1DADA7764(a1, 0xD000000000000015, 0x80000001DADFAD60, &qword_1EA8F9128);
}

uint64_t sub_1DADA7764(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  id v5 = (id)*sub_1DADF282C();
  uint64_t result = sub_1DADF6550();
  *a4 = result;
  return result;
}

uint64_t sub_1DADA77B4()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  MEMORY[0x1E0181A90](&v2, v0);
  return v2;
}

uint64_t sub_1DADA7804()
{
  return sub_1DADF6620();
}

uint64_t (*sub_1DADA7858(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = *v1;
  uint64_t v5 = v1[1];
  v3[3] = *v1;
  v3[4] = v5;
  char v6 = *((unsigned char *)v1 + 16);
  *((unsigned char *)v3 + 19) = v6;
  *uint64_t v3 = v4;
  v3[1] = v5;
  *((unsigned char *)v3 + 16) = v6;
  swift_retain();
  swift_retain();
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  MEMORY[0x1E0181A90]();
  return sub_1DADA78F8;
}

uint64_t sub_1DADA78FC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  sub_1DADF6640();
  return v1;
}

double sub_1DADA7950()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B80);
  MEMORY[0x1E0181A90](&v2, v0);
  return v2;
}

uint64_t sub_1DADA79A0()
{
  return sub_1DADF6620();
}

void (*sub_1DADA79F4(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  v3[5] = v4;
  v3[6] = v5;
  uint64_t v6 = v1[5];
  v3[7] = v6;
  *uint64_t v3 = v4;
  v3[1] = v5;
  v3[2] = v6;
  swift_retain();
  swift_retain();
  v3[8] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B80);
  MEMORY[0x1E0181A90]();
  return sub_1DADA7A94;
}

void sub_1DADA7A94(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void *)(*(void *)a1 + 24);
  uint64_t v3 = *(void *)(*(void *)a1 + 56);
  uint64_t v4 = *(void *)(*(void *)a1 + 48);
  *uint64_t v1 = *(void *)(*(void *)a1 + 40);
  v1[1] = v4;
  v1[2] = v3;
  v1[4] = v2;
  sub_1DADF6620();
  swift_release();
  swift_release();

  free(v1);
}

double sub_1DADA7B04()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B80);
  sub_1DADF6640();
  return v1;
}

uint64_t sub_1DADA7B58()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  MEMORY[0x1E0181A90](&v2, v0);
  return v2;
}

uint64_t sub_1DADA7BA8()
{
  return sub_1DADF6620();
}

uint64_t (*sub_1DADA7BFC(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = *(void *)(v1 + 48);
  uint64_t v5 = *(void *)(v1 + 56);
  v3[3] = v4;
  v3[4] = v5;
  char v6 = *(unsigned char *)(v1 + 64);
  *((unsigned char *)v3 + 19) = v6;
  *uint64_t v3 = v4;
  v3[1] = v5;
  *((unsigned char *)v3 + 16) = v6;
  swift_retain();
  swift_retain();
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  MEMORY[0x1E0181A90]();
  return sub_1DADA78F8;
}

uint64_t sub_1DADA7C9C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  sub_1DADF6640();
  return v1;
}

uint64_t sub_1DADA7CF0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  MEMORY[0x1E0181A90](&v2, v0);
  return v2;
}

uint64_t sub_1DADA7D40()
{
  return sub_1DADF6620();
}

uint64_t (*sub_1DADA7D94(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = *(void *)(v1 + 72);
  uint64_t v5 = *(void *)(v1 + 80);
  v3[3] = v4;
  v3[4] = v5;
  char v6 = *(unsigned char *)(v1 + 88);
  *((unsigned char *)v3 + 19) = v6;
  *uint64_t v3 = v4;
  v3[1] = v5;
  *((unsigned char *)v3 + 16) = v6;
  swift_retain();
  swift_retain();
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  MEMORY[0x1E0181A90]();
  return sub_1DADA78F8;
}

void sub_1DADA7E34(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  char v2 = *(unsigned char *)(*(void *)a1 + 17);
  uint64_t v3 = *(void *)(*(void *)a1 + 32);
  char v4 = *(unsigned char *)(*(void *)a1 + 19);
  *uint64_t v1 = *(void *)(*(void *)a1 + 24);
  v1[1] = v3;
  *((unsigned char *)v1 + 16) = v4;
  *((unsigned char *)v1 + 18) = v2;
  sub_1DADF6620();
  swift_release();
  swift_release();

  free(v1);
}

uint64_t sub_1DADA7EA4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  sub_1DADF6640();
  return v1;
}

uint64_t sub_1DADA7EF8()
{
  sub_1DADF65D0();
  return v1;
}

double sub_1DADA7F34()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F86C8);
  sub_1DADF65E0();
  return v1;
}

uint64_t sub_1DADA7F84()
{
  return sub_1DADF65F0();
}

void (*sub_1DADA7FD4(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = *(void *)(v1 + 96);
  v3[4] = v4;
  uint64_t v5 = *(void *)(v1 + 104);
  v3[5] = v5;
  *uint64_t v3 = v4;
  v3[1] = v5;
  swift_retain();
  v3[6] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F86C8);
  sub_1DADF65E0();
  return sub_1DADA8064;
}

void sub_1DADA8064(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void *)(*(void *)a1 + 16);
  uint64_t v3 = *(void *)(*(void *)a1 + 40);
  *uint64_t v1 = *(void *)(*(void *)a1 + 32);
  v1[1] = v3;
  v1[3] = v2;
  sub_1DADF65F0();
  swift_release();

  free(v1);
}

double sub_1DADA80C0()
{
  return 10.0;
}

double sub_1DADA80C8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F86C8);
  sub_1DADF6600();
  return v1;
}

uint64_t sub_1DADA8120()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  return v1;
}

uint64_t sub_1DADA8170()
{
  return sub_1DADF65F0();
}

uint64_t (*sub_1DADA81C4(void *a1))()
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  char v4 = *(unsigned char *)(v1 + 112);
  v3[34] = v4;
  uint64_t v5 = *(void *)(v1 + 120);
  *uint64_t v3 = v4;
  *((void *)v3 + 1) = v5;
  *((void *)v3 + 2) = v5;
  swift_retain();
  *((void *)v3 + 3) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  return sub_1DADA8250;
}

uint64_t sub_1DADA8254()
{
  return 0;
}

uint64_t sub_1DADA825C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF6600();
  return v1;
}

uint64_t sub_1DADA82B0()
{
  sub_1DADF65D0();
  return v1;
}

uint64_t sub_1DADA82EC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  return v1;
}

uint64_t sub_1DADA833C()
{
  return sub_1DADF65F0();
}

uint64_t (*sub_1DADA8390(void *a1))()
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  char v4 = *(unsigned char *)(v1 + 128);
  v3[34] = v4;
  uint64_t v5 = *(void *)(v1 + 136);
  *uint64_t v3 = v4;
  *((void *)v3 + 1) = v5;
  *((void *)v3 + 2) = v5;
  swift_retain();
  *((void *)v3 + 3) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  return sub_1DADA8250;
}

void sub_1DADA841C(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  char v2 = *(unsigned char *)(*(void *)a1 + 32);
  uint64_t v3 = *(void *)(*(void *)a1 + 16);
  *(unsigned char *)uint64_t v1 = *(unsigned char *)(*(void *)a1 + 34);
  v1[1] = v3;
  *((unsigned char *)v1 + 33) = v2;
  sub_1DADF65F0();
  swift_release();

  free(v1);
}

uint64_t sub_1DADA8478()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF6600();
  return v1;
}

uint64_t sub_1DADA84CC@<X0>(uint64_t *a1@<X8>)
{
  return sub_1DADA860C(&qword_1EB682F68, a1);
}

uint64_t sub_1DADA84E0@<X0>(uint64_t *a1@<X8>)
{
  return sub_1DADA860C(&qword_1EA8F86D0, a1);
}

uint64_t sub_1DADA84F4()
{
  return sub_1DADF5F60();
}

uint64_t sub_1DADA8518()
{
  return swift_getKeyPath();
}

uint64_t sub_1DADA853C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_1DADF5FE0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1DADA856C()
{
  return sub_1DADF5FF0();
}

uint64_t sub_1DADA8594@<X0>(uint64_t *a1@<X8>)
{
  return sub_1DADA860C(&qword_1EB682688, a1);
}

uint64_t sub_1DADA85A8()
{
  return sub_1DADF5F40();
}

uint64_t sub_1DADA85CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1DADA86AC(a1, a2, a3, a4, MEMORY[0x1E4F3CBF0], MEMORY[0x1E4F3D010]);
}

uint64_t sub_1DADA85F8@<X0>(uint64_t *a1@<X8>)
{
  return sub_1DADA860C(&qword_1EB682F58, a1);
}

uint64_t sub_1DADA860C@<X0>(uint64_t *a1@<X1>, uint64_t *a2@<X8>)
{
  *a2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(a1);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1DADA865C()
{
  return sub_1DADF5FB0();
}

uint64_t sub_1DADA8680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1DADA86AC(a1, a2, a3, a4, MEMORY[0x1E4F46AE8], MEMORY[0x1E4F46968]);
}

uint64_t sub_1DADA86AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  MEMORY[0x1F4188790]();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

void *sub_1DADA877C()
{
  return &unk_1DADF8530;
}

double sub_1DADA8788()
{
  return 22.0;
}

double sub_1DADA8794@<D0>(uint64_t a1@<X8>)
{
  sub_1DADADA30((uint64_t)v4);
  double result = *(double *)v4;
  long long v3 = v4[1];
  *(_OWORD *)a1 = v4[0];
  *(_OWORD *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 32) = v5;
  return result;
}

uint64_t sub_1DADA87E0()
{
  return MEMORY[0x1F40FC680]();
}

void (*sub_1DADA87F8(void *a1))(void *a1)
{
  char v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1DADF5BA0();
  return sub_1DADA8868;
}

void sub_1DADA8868(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t sub_1DADA88B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DADAD764(qword_1EB683E50);

  return MEMORY[0x1F40FC6D8](a1, a2, a3, v6);
}

uint64_t sub_1DADA8934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DADAD764(qword_1EB683E50);

  return MEMORY[0x1F40FC690](a1, a2, a3, v6);
}

uint64_t sub_1DADA89B4(uint64_t a1)
{
  uint64_t v2 = sub_1DADAD764(qword_1EB683E50);

  return MEMORY[0x1F40FC6B0](a1, v2);
}

uint64_t sub_1DADA8A1C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1DADF6790();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v17 - v7;
  type metadata accessor for BCUIBatteryGlyphView(0);
  sub_1DADAD7A8(&qword_1EB682F58, MEMORY[0x1E4F46AE8], 0xD000000000000013, 0x80000001DADFAD40, (uint64_t)v8);
  sub_1DADF6780();
  sub_1DADADFFC(&qword_1EB682BC0, MEMORY[0x1E4F46AE8]);
  char v9 = sub_1DADF6800();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v6, v2);
  v10(v8, v2);
  if (v9)
  {
    sub_1DADF3990();
    return swift_retain();
  }
  else
  {
    uint64_t v12 = *(void *)(v1 + 56);
    char v13 = *(unsigned char *)(v1 + 64);
    uint64_t v18 = *(void *)(v1 + 48);
    uint64_t v19 = v12;
    char v20 = v13;
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
    MEMORY[0x1E0181A90](&v21);
    if (v21 == 1)
    {
      return sub_1DADF6480();
    }
    else
    {
      uint64_t v15 = *(void *)(v1 + 80);
      char v16 = *(unsigned char *)(v1 + 88);
      uint64_t v18 = *(void *)(v1 + 72);
      uint64_t v19 = v15;
      char v20 = v16;
      MEMORY[0x1E0181A90](&v21, v14);
      if (v21 == 1) {
        return sub_1DADF64D0();
      }
      else {
        return sub_1DADF64B0();
      }
    }
  }
}

uint64_t sub_1DADA8C4C()
{
  uint64_t v21 = sub_1DADF5C00();
  uint64_t v1 = *(void *)(v21 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v21);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v20 - v5;
  uint64_t v7 = sub_1DADF6790();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v9);
  char v13 = (char *)&v20 - v12;
  type metadata accessor for BCUIBatteryGlyphView(0);
  uint64_t v20 = v0;
  sub_1DADAD7A8(&qword_1EB682F58, MEMORY[0x1E4F46AE8], 0xD000000000000013, 0x80000001DADFAD40, (uint64_t)v13);
  sub_1DADF6780();
  sub_1DADADFFC(&qword_1EB682BC0, MEMORY[0x1E4F46AE8]);
  char v14 = sub_1DADF6800();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v11, v7);
  v15(v13, v7);
  if (v14)
  {
    sub_1DADF3990();
    return swift_retain();
  }
  else
  {
    sub_1DADAD7A8(&qword_1EB682F68, MEMORY[0x1E4F3C5D0], 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v6);
    uint64_t v17 = v21;
    (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, *MEMORY[0x1E4F3C5C0], v21);
    char v18 = sub_1DADF5BF0();
    uint64_t v19 = *(void (**)(char *, uint64_t))(v1 + 8);
    v19(v4, v17);
    v19(v6, v17);
    if (v18) {
      return sub_1DADF6490();
    }
    else {
      return sub_1DADF64C0();
    }
  }
}

uint64_t sub_1DADA8F70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v26 = a1;
  uint64_t v3 = sub_1DADF60A0();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v24 = sub_1DADF61A0();
  uint64_t v4 = *(void *)(v24 - 8);
  MEMORY[0x1F4188790](v24);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F86D8);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (uint64_t *)((char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F86E0);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F86E8);
  uint64_t v13 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v9 = sub_1DADF66D0();
  v9[1] = v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F86F0);
  sub_1DADA9314((char *)v2, (uint64_t)v9 + *(int *)(v17 + 44));
  sub_1DADAE0AC((uint64_t)v9, (uint64_t)v12, &qword_1EA8F86D8);
  sub_1DADADF3C((uint64_t)v9, &qword_1EA8F86D8);
  sub_1DADF6180();
  unint64_t v18 = sub_1DADAADAC();
  sub_1DADF6400();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v24);
  sub_1DADADF3C((uint64_t)v12, &qword_1EA8F86E0);
  sub_1DADF6090();
  sub_1DADF6080();
  unint64_t v19 = *(void *)(v2 + 8);
  char v20 = *(unsigned char *)(v2 + 16);
  uint64_t v27 = *(void *)v2;
  unint64_t v28 = v19;
  char v29 = v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  MEMORY[0x1E0181A90](&v30, v21);
  sub_1DADF26EC(v30);
  sub_1DADF6070();
  swift_bridgeObjectRelease();
  sub_1DADF6080();
  sub_1DADF60C0();
  uint64_t v27 = v10;
  unint64_t v28 = v18;
  swift_getOpaqueTypeConformance2();
  uint64_t v22 = v25;
  sub_1DADF63D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v22);
}

uint64_t sub_1DADA9314@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v195 = a2;
  uint64_t v3 = sub_1DADF5E30();
  MEMORY[0x1F4188790](v3 - 8);
  v177 = (char *)&v171 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v178 = sub_1DADF6720();
  uint64_t v176 = *(void *)(v178 - 8);
  MEMORY[0x1F4188790](v178);
  v175 = (char *)&v171 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v173 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8740);
  uint64_t v6 = MEMORY[0x1F4188790](v173);
  v179 = (char *)&v171 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v193 = (uint64_t)&v171 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8748);
  uint64_t v10 = MEMORY[0x1F4188790](v9 - 8);
  uint64_t v212 = (uint64_t)&v171 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v209 = (uint64_t)&v171 - v12;
  uint64_t v211 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8750);
  uint64_t v194 = *(void *)(v211 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v211);
  v210 = (char *)&v171 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v216 = (uint64_t)&v171 - v15;
  uint64_t v184 = type metadata accessor for BCUIBatteryGlyphView.BatteryFillShape(0);
  MEMORY[0x1F4188790](v184);
  v186 = (char *)&v171 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8758);
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v185 = (uint64_t)&v171 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v190 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8760);
  MEMORY[0x1F4188790](v190);
  uint64_t v187 = (uint64_t)&v171 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v191 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8768);
  uint64_t v189 = *(void *)(v191 - 8);
  MEMORY[0x1F4188790](v191);
  uint64_t v188 = (uint64_t)&v171 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8770);
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v218 = v21;
  uint64_t v219 = v22;
  uint64_t v23 = MEMORY[0x1F4188790](v21);
  v217 = (char *)&v171 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v23);
  v215 = (char *)&v171 - v25;
  uint64_t v199 = sub_1DADF6790();
  v213 = *(void **)(v199 - 8);
  uint64_t v26 = MEMORY[0x1F4188790](v199);
  v198 = (char *)&v171 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v26);
  uint64_t v197 = (uint64_t)&v171 - v28;
  uint64_t v29 = sub_1DADF6510();
  uint64_t v30 = *(void *)(v29 - 8);
  MEMORY[0x1F4188790](v29);
  v32 = (char *)&v171 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8778);
  uint64_t v207 = *(void *)(v33 - 8);
  uint64_t v208 = v33;
  uint64_t v34 = MEMORY[0x1F4188790](v33);
  v174 = (char *)&v171 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = MEMORY[0x1F4188790](v34);
  uint64_t v206 = (uint64_t)&v171 - v37;
  MEMORY[0x1F4188790](v36);
  uint64_t v214 = (uint64_t)&v171 - v38;
  if (qword_1EA8F9120 != -1) {
    swift_once();
  }
  uint64_t v39 = *(void (**)(void))(v30 + 104);
  LODWORD(v203) = *MEMORY[0x1E4F3EBF8];
  v201 = (void (*)(void, void, void))v39;
  uint64_t v202 = v30 + 104;
  v39(v32);
  uint64_t v40 = sub_1DADF6540();
  v41 = *(void (**)(void, void))(v30 + 8);
  v204 = (void (*)(void, void, void))(v30 + 8);
  v200 = v41;
  v41(v32, v29);
  uint64_t v43 = *((void *)a1 + 13);
  *(void *)&long long v286 = *((void *)a1 + 12);
  uint64_t v42 = v286;
  *((void *)&v286 + 1) = v43;
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F86C8);
  sub_1DADF65E0();
  unint64_t v205 = v29;
  v196 = v32;
  double v45 = *(double *)&v250 * 19.0 / 10.0;
  *(void *)&long long v286 = v42;
  *((void *)&v286 + 1) = v43;
  sub_1DADF65E0();
  double v46 = *(double *)&v250;
  uint64_t v47 = sub_1DADF66D0();
  sub_1DADAAE4C(0.0, 1, v45, 0, 0.0, 1, 0.0, 1, (uint64_t)&v286, v46, 0, 0.0, 1, v47, v48, v40);
  swift_release();
  char v269 = v287;
  char v267 = v288;
  char v265 = v289;
  char v263 = v290;
  char v261 = v291;
  char v259 = v292[0];
  *(_DWORD *)((char *)&v287 + 1) = *(_DWORD *)v268;
  DWORD1(v287) = *(_DWORD *)&v268[3];
  *(_DWORD *)((char *)&v288 + 1) = *(_DWORD *)v266;
  DWORD1(v288) = *(_DWORD *)&v266[3];
  DWORD1(v289) = *(_DWORD *)&v264[3];
  *(_DWORD *)((char *)&v289 + 1) = *(_DWORD *)v264;
  DWORD1(v290) = *(_DWORD *)&v262[3];
  *(_DWORD *)((char *)&v290 + 1) = *(_DWORD *)v262;
  DWORD1(v291) = *(_DWORD *)&v260[3];
  *(_DWORD *)((char *)&v291 + 1) = *(_DWORD *)v260;
  DWORD1(v292[0]) = *(_DWORD *)&v258[3];
  *(_DWORD *)((char *)v292 + 1) = *(_DWORD *)v258;
  WORD4(v292[1]) = 257;
  v49 = &a1[*(int *)(type metadata accessor for BCUIBatteryGlyphView(0) + 60)];
  uint64_t v50 = v197;
  unint64_t v182 = 0x80000001DADFAD40;
  v183 = v49;
  sub_1DADAD7A8(&qword_1EB682F58, MEMORY[0x1E4F46AE8], 0xD000000000000013, 0x80000001DADFAD40, v197);
  BOOL v51 = v198;
  sub_1DADF6780();
  LOBYTE(v49) = sub_1DADF6770();
  id v53 = (char *)(v213 + 1);
  v52 = (void (*)(void, void))v213[1];
  v54 = v51;
  uint64_t v55 = v199;
  v52(v54, v199);
  v213 = v53;
  v181 = v52;
  v52(v50, v55);
  v180 = sub_1DADF3990();
  uint64_t v56 = *v180;
  swift_retain();
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8780);
  uint64_t v171 = sub_1DADADCCC();
  uint64_t v172 = v57;
  sub_1DADF19B8(v49 & 1, v56, v57, v171, v214);
  swift_release();
  v270[4] = v290;
  v270[5] = v291;
  v271[0] = v292[0];
  *(_OWORD *)((char *)v271 + 10) = *(_OWORD *)((char *)v292 + 10);
  v270[0] = v286;
  v270[1] = v287;
  v270[2] = v288;
  v270[3] = v289;
  sub_1DADADD70((uint64_t)v270);
  uint64_t v58 = *((void *)a1 + 4);
  uint64_t v59 = *((void *)a1 + 5);
  *(void *)&long long v286 = *((void *)a1 + 3);
  *((void *)&v286 + 1) = v58;
  *(void *)&long long v287 = v59;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B80);
  MEMORY[0x1E0181A90](&v250, v60);
  uint64_t v61 = v250;
  uint64_t v62 = v184;
  uint64_t v63 = v186;
  sub_1DADAD7A8(&qword_1EB682688, MEMORY[0x1E4F3CBF0], 0x694474756F79614CLL, 0xEF6E6F6974636572, (uint64_t)&v186[*(int *)(v184 + 20)]);
  uint64_t v65 = *((void *)a1 + 13);
  *(void *)&long long v286 = *((void *)a1 + 12);
  uint64_t v64 = v286;
  *((void *)&v286 + 1) = v65;
  sub_1DADF65E0();
  double v66 = *(double *)&v250 * 19.0 / 10.0;
  *(void *)&long long v286 = v64;
  *((void *)&v286 + 1) = v65;
  sub_1DADF65E0();
  *uint64_t v63 = v61;
  *(double *)((char *)v63 + *(int *)(v62 + 24)) = v66;
  *(void *)((char *)v63 + *(int *)(v62 + 28)) = v250;
  *(void *)&long long v286 = v64;
  *((void *)&v286 + 1) = v65;
  sub_1DADF65E0();
  double v67 = *(double *)&v250 * 19.0 / 10.0;
  *(void *)&long long v286 = v64;
  *((void *)&v286 + 1) = v65;
  uint64_t v68 = v44;
  sub_1DADF65E0();
  double v69 = *(double *)&v250;
  sub_1DADF66D0();
  uint64_t v70 = v185;
  sub_1DADAB008(0.0, 1, v67, 0, 0.0, 1, 0.0, 1, v185, v69, 0, 0.0, 1);
  sub_1DADADEDC((uint64_t)v63, type metadata accessor for BCUIBatteryGlyphView.BatteryFillShape);
  uint64_t v71 = v187;
  sub_1DADAE0AC(v70, v187, &qword_1EA8F8758);
  uint64_t v72 = v190;
  *(_WORD *)(v71 + *(int *)(v190 + 36)) = 257;
  sub_1DADADF3C(v70, &qword_1EA8F8758);
  uint64_t v73 = *((void *)a1 + 17);
  LOBYTE(v286) = a1[128];
  *((void *)&v286 + 1) = v73;
  uint64_t v185 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  uint64_t v74 = v250;
  uint64_t v75 = sub_1DADA8A1C();
  uint64_t v76 = sub_1DADADD9C(&qword_1EA8F87A0, &qword_1EA8F8760, (void (*)(void))sub_1DADADE18);
  v186 = a1;
  uint64_t v77 = v76;
  uint64_t v78 = v188;
  sub_1DADF19B8(v74, v75, v72, v76, v188);
  swift_release();
  sub_1DADADF3C(v71, &qword_1EA8F8760);
  *(void *)&long long v286 = v72;
  *((void *)&v286 + 1) = v77;
  swift_getOpaqueTypeConformance2();
  id v79 = v217;
  uint64_t v80 = v191;
  sub_1DADF6360();
  (*(void (**)(uint64_t, uint64_t))(v189 + 8))(v78, v80);
  (*(void (**)(char *, char *, uint64_t))(v219 + 32))(v215, v79, v218);
  if (qword_1EA8F9110 != -1) {
    swift_once();
  }
  v81 = v196;
  unint64_t v82 = v205;
  v201(v196, v203, v205);
  uint64_t v83 = sub_1DADF6540();
  v200(v81, v82);
  uint64_t v84 = v186;
  uint64_t v86 = *((void *)v186 + 13);
  *(void *)&long long v286 = *((void *)v186 + 12);
  uint64_t v85 = v286;
  *((void *)&v286 + 1) = v86;
  sub_1DADF65E0();
  double v87 = (*(double *)&v250 + *(double *)&v250) / 10.0;
  *(void *)&long long v286 = v85;
  *((void *)&v286 + 1) = v86;
  sub_1DADF65E0();
  double v88 = *(double *)&v250;
  uint64_t v89 = sub_1DADF66D0();
  sub_1DADAAE4C(0.0, 1, v87, 0, 0.0, 1, 0.0, 1, (uint64_t)&v286, v88, 0, 0.0, 1, v89, v90, v83);
  swift_release();
  long long v91 = v286;
  uint64_t v92 = *((void *)&v287 + 1);
  uint64_t v93 = v68;
  uint64_t v94 = *((void *)&v288 + 1);
  uint64_t v95 = *((void *)&v289 + 1);
  uint64_t v96 = *((void *)&v291 + 1);
  uint64_t v190 = *((void *)&v292[0] + 1);
  uint64_t v191 = *((void *)&v290 + 1);
  uint64_t v189 = *(void *)&v292[1];
  char v283 = v287;
  char v281 = v288;
  char v279 = v289;
  char v277 = v290;
  char v275 = v291;
  char v273 = v292[0];
  *(void *)&long long v286 = v85;
  *((void *)&v286 + 1) = v86;
  uint64_t v192 = v93;
  sub_1DADF65E0();
  *(_DWORD *)((char *)&v251 + 1) = *(_DWORD *)v282;
  DWORD1(v251) = *(_DWORD *)&v282[3];
  *(_DWORD *)((char *)&v252 + 1) = *(_DWORD *)v280;
  DWORD1(v252) = *(_DWORD *)&v280[3];
  *(_DWORD *)((char *)&v253 + 1) = *(_DWORD *)v278;
  DWORD1(v253) = *(_DWORD *)&v278[3];
  *(double *)&unint64_t v97 = *(double *)&v250 * 11.5 / 10.0;
  *(_DWORD *)((char *)&v254 + 1) = *(_DWORD *)v276;
  DWORD1(v254) = *(_DWORD *)&v276[3];
  DWORD1(v255) = *(_DWORD *)&v274[3];
  *(_DWORD *)((char *)&v255 + 1) = *(_DWORD *)v274;
  DWORD1(v256[0]) = *(_DWORD *)&v272[3];
  *(_DWORD *)((char *)v256 + 1) = *(_DWORD *)v272;
  long long v250 = v91;
  LOBYTE(v251) = v283;
  *((void *)&v251 + 1) = v92;
  LOBYTE(v252) = v281;
  *((void *)&v252 + 1) = v94;
  LOBYTE(v253) = v279;
  *((void *)&v253 + 1) = v95;
  LOBYTE(v254) = v277;
  *((void *)&v254 + 1) = v191;
  LOBYTE(v255) = v275;
  *((void *)&v255 + 1) = v96;
  LOBYTE(v256[0]) = v273;
  *((void *)&v256[0] + 1) = v190;
  *(void *)&v256[1] = v189;
  WORD4(v256[1]) = 257;
  HIWORD(v256[1]) = v285;
  *(_DWORD *)((char *)&v256[1] + 10) = v284;
  long long v257 = v97;
  uint64_t v98 = v197;
  sub_1DADAD7A8(&qword_1EB682F58, MEMORY[0x1E4F46AE8], 0xD000000000000013, v182, v197);
  v99 = v198;
  sub_1DADF6780();
  LOBYTE(v88) = sub_1DADF6770();
  v100 = v99;
  uint64_t v101 = v199;
  v102 = v181;
  v181(v100, v199);
  v102(v98, v101);
  uint64_t v103 = *v180;
  swift_retain();
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F87B0);
  uint64_t v105 = sub_1DADADD9C(&qword_1EA8F87B8, &qword_1EA8F87B0, (void (*)(void))sub_1DADADCCC);
  sub_1DADF19B8(LOBYTE(v88) & 1, v103, v104, v105, v216);
  swift_release();
  v292[0] = v256[0];
  v292[1] = v256[1];
  v292[2] = v257;
  long long v288 = v252;
  long long v289 = v253;
  long long v290 = v254;
  long long v291 = v255;
  long long v286 = v250;
  long long v287 = v251;
  sub_1DADADD70((uint64_t)&v286);
  uint64_t v106 = *((void *)v84 + 1);
  char v107 = v84[16];
  *(void *)&long long v250 = *(void *)v84;
  *((void *)&v250 + 1) = v106;
  LOBYTE(v251) = v107;
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  MEMORY[0x1E0181A90](&v223, v108);
  if (LOBYTE(v223) == 1)
  {
    v109 = v84;
    if (qword_1EA8F9100 != -1) {
      swift_once();
    }
    v110 = v196;
    unint64_t v111 = v205;
    v201(v196, v203, v205);
    uint64_t v112 = sub_1DADF6540();
    v200(v110, v111);
    uint64_t v114 = *((void *)v84 + 13);
    *(void *)&long long v250 = *((void *)v84 + 12);
    uint64_t v113 = v250;
    *((void *)&v250 + 1) = v114;
    sub_1DADF65E0();
    double v115 = v223 * 9.0 / 10.0;
    *(void *)&long long v250 = v113;
    *((void *)&v250 + 1) = v114;
    sub_1DADF65E0();
    double v116 = v223 * 12.0 / 10.0;
    uint64_t v117 = sub_1DADF66D0();
    sub_1DADAAE4C(0.0, 1, v115, 0, 0.0, 1, 0.0, 1, (uint64_t)&v250, v116, 0, 0.0, 1, v117, v118, v112);
    swift_release();
    WORD4(v256[1]) = 257;
    v120 = v175;
    uint64_t v119 = v176;
    uint64_t v121 = v178;
    (*(void (**)(char *, void, uint64_t))(v176 + 104))(v175, *MEMORY[0x1E4F3EFC8], v178);
    uint64_t v122 = (uint64_t)v177;
    (*(void (**)(char *, char *, uint64_t))(v119 + 16))(v177, v120, v121);
    v123 = v179;
    sub_1DADAE044(v122, (uint64_t)&v179[*(int *)(v173 + 36)], MEMORY[0x1E4F3CE18]);
    long long v124 = v255;
    v123[4] = v254;
    v123[5] = v124;
    v123[6] = v256[0];
    *(_OWORD *)((char *)v123 + 106) = *(_OWORD *)((char *)v256 + 10);
    long long v125 = v251;
    _OWORD *v123 = v250;
    v123[1] = v125;
    long long v126 = v253;
    v123[2] = v252;
    v123[3] = v126;
    sub_1DADADEB0((uint64_t)&v250);
    sub_1DADADEDC(v122, MEMORY[0x1E4F3CE18]);
    (*(void (**)(char *, uint64_t))(v119 + 8))(v120, v121);
    swift_release();
    uint64_t v127 = v193;
    sub_1DADADF98((uint64_t)v123, v193, &qword_1EA8F8740);
    if (qword_1EA8F90F0 != -1) {
      swift_once();
    }
    unint64_t v128 = v205;
    v201(v110, v203, v205);
    uint64_t v129 = sub_1DADF6540();
    v200(v110, v128);
    uint64_t v131 = *((void *)v109 + 13);
    double v223 = *((double *)v109 + 12);
    double v130 = v223;
    uint64_t v224 = v131;
    sub_1DADF65E0();
    double v132 = v220 * 9.0 / 10.0;
    double v223 = v130;
    uint64_t v224 = v131;
    sub_1DADF65E0();
    double v133 = v220 * 12.0 / 10.0;
    uint64_t v134 = sub_1DADF66D0();
    sub_1DADAAE4C(0.0, 1, v132, 0, 0.0, 1, 0.0, 1, (uint64_t)&v223, v133, 0, 0.0, 1, v134, v135, v129);
    swift_release();
    char v249 = v225;
    char v247 = v227;
    char v245 = v229;
    char v243 = v231;
    char v241 = v233;
    char v239 = v235;
    v226[0] = *(_DWORD *)v248;
    *(_DWORD *)((char *)v226 + 3) = *(_DWORD *)&v248[3];
    v228[0] = *(_DWORD *)v246;
    *(_DWORD *)((char *)v228 + 3) = *(_DWORD *)&v246[3];
    *(_DWORD *)((char *)v230 + 3) = *(_DWORD *)&v244[3];
    v230[0] = *(_DWORD *)v244;
    *(_DWORD *)((char *)v232 + 3) = *(_DWORD *)&v242[3];
    v232[0] = *(_DWORD *)v242;
    *(_DWORD *)((char *)v234 + 3) = *(_DWORD *)&v240[3];
    v234[0] = *(_DWORD *)v240;
    *(_DWORD *)((char *)v236 + 3) = *(_DWORD *)&v238[3];
    v236[0] = *(_DWORD *)v238;
    __int16 v237 = 257;
    uint64_t v136 = *((void *)v109 + 15);
    LOBYTE(v220) = v109[112];
    uint64_t v221 = v136;
    sub_1DADF65E0();
    uint64_t v137 = v222;
    uint64_t v138 = sub_1DADA8C4C();
    uint64_t v139 = v206;
    sub_1DADF19B8(v137, v138, v172, v171, v206);
    swift_release();
    swift_release();
    sub_1DADAE0AC(v127, (uint64_t)v123, &qword_1EA8F8740);
    uint64_t v140 = v207;
    uint64_t v141 = v208;
    uint64_t v142 = (uint64_t)v123;
    v143 = *(void **)(v207 + 16);
    unint64_t v205 = (v207 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    v144 = v174;
    ((void (*)(char *, uint64_t, uint64_t))v143)(v174, v139, v208);
    uint64_t v145 = v212;
    sub_1DADAE0AC(v142, v212, &qword_1EA8F8740);
    uint64_t v146 = v145 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F87D0) + 48);
    v213 = v143;
    ((void (*)(uint64_t, char *, uint64_t))v143)(v146, v144, v141);
    v147 = *(void (**)(void, void))(v140 + 8);
    v147(v139, v141);
    sub_1DADADF3C(v193, &qword_1EA8F8740);
    v147(v144, v141);
    uint64_t v148 = v139;
    sub_1DADADF3C(v142, &qword_1EA8F8740);
    uint64_t v149 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F87C0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v149 - 8) + 56))(v145, 0, 1, v149);
    uint64_t v150 = v145;
    uint64_t v151 = v209;
    sub_1DADADF98(v150, v209, &qword_1EA8F8748);
    uint64_t v152 = v214;
    v153 = v215;
    uint64_t v154 = v219;
  }
  else
  {
    uint64_t v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F87C0);
    uint64_t v151 = v209;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v155 - 8) + 56))(v209, 1, 1, v155);
    uint64_t v141 = v208;
    v213 = *(void **)(v207 + 16);
    unint64_t v205 = (v207 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    uint64_t v154 = v219;
    uint64_t v152 = v214;
    v153 = v215;
    uint64_t v148 = v206;
  }
  v156 = (void (*)(void, void, void))v213;
  ((void (*)(uint64_t, uint64_t, uint64_t))v213)(v148, v152, v141);
  v204 = *(void (**)(void, void, void))(v154 + 16);
  v204(v217, v153, v218);
  uint64_t v157 = v194;
  v203 = *(void (**)(void, void, void))(v194 + 16);
  v203(v210, v216, v211);
  sub_1DADAE0AC(v151, v212, &qword_1EA8F8748);
  uint64_t v158 = v141;
  uint64_t v159 = v195;
  v156(v195, v148, v158);
  v160 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F87C8);
  uint64_t v161 = v218;
  v204(v159 + v160[12], v217, v218);
  v162 = v210;
  uint64_t v163 = v211;
  v203(v159 + v160[16], v210, v211);
  uint64_t v164 = v159 + v160[20];
  uint64_t v165 = v212;
  sub_1DADAE0AC(v212, v164, &qword_1EA8F8748);
  sub_1DADADF3C(v209, &qword_1EA8F8748);
  v166 = *(void (**)(void, void))(v157 + 8);
  v166(v216, v163);
  v167 = *(void (**)(void, void))(v219 + 8);
  v219 += 8;
  v167(v215, v161);
  uint64_t v168 = v208;
  v169 = *(void (**)(void, void))(v207 + 8);
  v169(v214, v208);
  sub_1DADADF3C(v165, &qword_1EA8F8748);
  v166(v162, v163);
  v167(v217, v218);
  return ((uint64_t (*)(uint64_t, uint64_t))v169)(v206, v168);
}

unint64_t sub_1DADAADAC()
{
  unint64_t result = qword_1EA8F86F8;
  if (!qword_1EA8F86F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F86E0);
    sub_1DADAD660(&qword_1EA8F8700, &qword_1EA8F86D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F86F8);
  }
  return result;
}

uint64_t sub_1DADAAE4C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1DADF69F0();
    uint64_t v25 = (void *)sub_1DADF6200();
    sub_1DADF5AA0();
  }
  sub_1DADF5E40();
  *(_OWORD *)(a9 + 56) = v30;
  *(_OWORD *)(a9 + 72) = v31;
  *(_OWORD *)(a9 + 88) = v32;
  *(_OWORD *)(a9 + 104) = v33;
  *(_OWORD *)(a9 + 8) = v27;
  *(_OWORD *)(a9 + 24) = v28;
  *(void *)a9 = a16;
  *(_OWORD *)(a9 + 40) = v29;

  return swift_retain();
}

__n128 sub_1DADAB008@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1DADF69F0();
    uint64_t v23 = (void *)sub_1DADF6200();
    sub_1DADF5AA0();
  }
  sub_1DADF5E40();
  sub_1DADAE044(v13, a9, type metadata accessor for BCUIBatteryGlyphView.BatteryFillShape);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8758) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *uint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_1DADAB1D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10@<D0>, uint64_t a11, uint64_t a12, char a13)
{
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(unsigned char *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(double *)(a9 + 40) = a10;
  *(void *)(a9 + 48) = a6;
  *(void *)(a9 + 56) = a7;
  *(unsigned char *)(a9 + 64) = a8;
  *(void *)(a9 + 72) = a11;
  *(void *)(a9 + 80) = a12;
  *(unsigned char *)(a9 + 88) = a13;
  sub_1DADF65D0();
  *(void *)(a9 + 96) = v21;
  *(void *)(a9 + 104) = v22;
  sub_1DADF65D0();
  *(unsigned char *)(a9 + 112) = v21;
  *(void *)(a9 + 120) = v22;
  sub_1DADF65D0();
  *(unsigned char *)(a9 + 128) = v21;
  *(void *)(a9 + 136) = v22;
  uint64_t v14 = (int *)type metadata accessor for BCUIBatteryGlyphView(0);
  uint64_t v15 = (uint64_t *)(a9 + v14[11]);
  *uint64_t v15 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  swift_storeEnumTagMultiPayload();
  uint64_t v16 = (uint64_t *)(a9 + v14[12]);
  uint64_t *v16 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F86D0);
  swift_storeEnumTagMultiPayload();
  uint64_t v17 = a9 + v14[13];
  *(void *)uint64_t v17 = swift_getKeyPath();
  *(unsigned char *)(v17 + 8) = 0;
  uint64_t v18 = (uint64_t *)(a9 + v14[14]);
  *uint64_t v18 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682688);
  swift_storeEnumTagMultiPayload();
  uint64_t v19 = (uint64_t *)(a9 + v14[15]);
  *uint64_t v19 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata accessor for BCUIBatteryGlyphView(uint64_t a1)
{
  return sub_1DADAD54C(a1, qword_1EB684270);
}

uint64_t sub_1DADAB3C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADAB3E4(uint64_t a1, uint64_t *a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(void *)(a1 + 8) = a2[1];
    *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
    uint64_t v7 = a2[4];
    *(void *)(a1 + 24) = a2[3];
    *(void *)(a1 + 32) = v7;
    uint64_t v8 = a2[6];
    *(void *)(a1 + 40) = a2[5];
    *(void *)(a1 + 48) = v8;
    *(void *)(a1 + 56) = a2[7];
    *(unsigned char *)(a1 + 64) = *((unsigned char *)a2 + 64);
    uint64_t v9 = a2[10];
    *(void *)(a1 + 72) = a2[9];
    *(void *)(a1 + 80) = v9;
    *(unsigned char *)(a1 + 88) = *((unsigned char *)a2 + 88);
    uint64_t v10 = a2[13];
    *(void *)(a1 + 96) = a2[12];
    *(void *)(a1 + 104) = v10;
    *(unsigned char *)(a1 + 112) = *((unsigned char *)a2 + 112);
    *(void *)(a1 + 120) = a2[15];
    *(unsigned char *)(a1 + 128) = *((unsigned char *)a2 + 128);
    uint64_t v11 = a3[11];
    long long v32 = (void *)(a1 + v11);
    long long v31 = (uint64_t *)((char *)a2 + v11);
    *(void *)(a1 + 136) = a2[17];
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_1DADF5C00();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v32, v31, v12);
    }
    else
    {
      void *v32 = *v31;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[12];
    uint64_t v14 = (void *)(a1 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F86D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v16 = sub_1DADF60E0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      *uint64_t v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v17 = a3[13];
    uint64_t v18 = a1 + v17;
    uint64_t v19 = (uint64_t)a2 + v17;
    uint64_t v20 = *(void *)v19;
    char v21 = *(unsigned char *)(v19 + 8);
    sub_1DADAB7C8(*(void *)v19, v21);
    *(void *)uint64_t v18 = v20;
    *(unsigned char *)(v18 + 8) = v21;
    uint64_t v22 = a3[14];
    uint64_t v23 = (void *)(a1 + v22);
    uint64_t v24 = (uint64_t *)((char *)a2 + v22);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682688);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v25 = sub_1DADF5DA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
    }
    else
    {
      *uint64_t v23 = *v24;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v26 = a3[15];
    long long v27 = (void *)(a1 + v26);
    long long v28 = (uint64_t *)((char *)a2 + v26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v29 = sub_1DADF6790();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v29 - 8) + 16))(v27, v28, v29);
    }
    else
    {
      *long long v27 = *v28;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1DADAB7C8(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1DADAB7D4(uint64_t a1, int *a2)
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + a2[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_1DADF5C00();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + a2[12];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F86D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1DADF60E0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  sub_1DADABA40(*(void *)(a1 + a2[13]), *(unsigned char *)(a1 + a2[13] + 8));
  uint64_t v8 = a1 + a2[14];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682688);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_1DADF5DA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  else
  {
    swift_release();
  }
  uint64_t v10 = a1 + a2[15];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_1DADF6790();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
    return v12(v10, v11);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_1DADABA40(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1DADABA4C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  uint64_t v9 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v9;
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  uint64_t v10 = a3[11];
  long long v31 = (void *)(a1 + v10);
  long long v30 = (void *)(a2 + v10);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_1DADF5C00();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v31, v30, v11);
  }
  else
  {
    *long long v31 = *v30;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = a3[12];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F86D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_1DADF60E0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  else
  {
    *uint64_t v13 = *v14;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v16 = a3[13];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = *(void *)v18;
  char v20 = *(unsigned char *)(v18 + 8);
  sub_1DADAB7C8(*(void *)v18, v20);
  *(void *)uint64_t v17 = v19;
  *(unsigned char *)(v17 + 8) = v20;
  uint64_t v21 = a3[14];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682688);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v24 = sub_1DADF5DA0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
  }
  else
  {
    *uint64_t v22 = *v23;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v25 = a3[15];
  uint64_t v26 = (void *)(a1 + v25);
  long long v27 = (void *)(a2 + v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v28 = sub_1DADF6790();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
  }
  else
  {
    *uint64_t v26 = *v27;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_1DADABDDC(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = a3[11];
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (void *)(a2 + v6);
    sub_1DADADF3C(a1 + v6, &qword_1EB682F68);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = sub_1DADF5C00();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v10 = a3[12];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_1DADADF3C(a1 + v10, &qword_1EA8F86D0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F86D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_1DADF60E0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v14 = a3[13];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  uint64_t v17 = *(void *)v16;
  char v18 = *(unsigned char *)(v16 + 8);
  sub_1DADAB7C8(*(void *)v16, v18);
  uint64_t v19 = *(void *)v15;
  char v20 = *(unsigned char *)(v15 + 8);
  *(void *)uint64_t v15 = v17;
  *(unsigned char *)(v15 + 8) = v18;
  sub_1DADABA40(v19, v20);
  if (a1 != a2)
  {
    uint64_t v21 = a3[14];
    uint64_t v22 = (void *)(a1 + v21);
    uint64_t v23 = (void *)(a2 + v21);
    sub_1DADADF3C(a1 + v21, &qword_1EB682688);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682688);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v24 = sub_1DADF5DA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
    }
    else
    {
      *uint64_t v22 = *v23;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v25 = a3[15];
    uint64_t v26 = (void *)(a1 + v25);
    long long v27 = (void *)(a2 + v25);
    sub_1DADADF3C(a1 + v25, &qword_1EB682F58);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v28 = sub_1DADF6790();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
    }
    else
    {
      *uint64_t v26 = *v27;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1DADAC21C(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  long long v6 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v6;
  uint64_t v7 = a3[11];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_1DADF5C00();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
  }
  uint64_t v12 = a3[12];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F86D0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v16 = sub_1DADF60E0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v16 - 8) + 32))(v13, v14, v16);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v13, v14, *(void *)(*(void *)(v15 - 8) + 64));
  }
  uint64_t v17 = a3[13];
  uint64_t v18 = a3[14];
  uint64_t v19 = a1 + v17;
  uint64_t v20 = a2 + v17;
  *(void *)uint64_t v19 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = *(unsigned char *)(v20 + 8);
  uint64_t v21 = (void *)(a1 + v18);
  uint64_t v22 = (const void *)(a2 + v18);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682688);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v24 = sub_1DADF5DA0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v24 - 8) + 32))(v21, v22, v24);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v21, v22, *(void *)(*(void *)(v23 - 8) + 64));
  }
  uint64_t v25 = a3[15];
  uint64_t v26 = (void *)(a1 + v25);
  long long v27 = (const void *)(a2 + v25);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v29 = sub_1DADF6790();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v29 - 8) + 32))(v26, v27, v29);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
  }
  return a1;
}

uint64_t sub_1DADAC540(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_release();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_release();
  *(unsigned char *)(a1 + 112) = *(unsigned char *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_release();
  *(unsigned char *)(a1 + 128) = *(unsigned char *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = a3[11];
    uint64_t v7 = (void *)(a1 + v6);
    uint64_t v8 = (const void *)(a2 + v6);
    sub_1DADADF3C(a1 + v6, &qword_1EB682F68);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_1DADF5C00();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
    uint64_t v11 = a3[12];
    uint64_t v12 = (void *)(a1 + v11);
    uint64_t v13 = (const void *)(a2 + v11);
    sub_1DADADF3C(a1 + v11, &qword_1EA8F86D0);
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F86D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v15 = sub_1DADF60E0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
    }
  }
  uint64_t v16 = a3[13];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = (uint64_t *)(a2 + v16);
  uint64_t v19 = *v18;
  LOBYTE(v18) = *((unsigned char *)v18 + 8);
  uint64_t v20 = *(void *)v17;
  char v21 = *(unsigned char *)(v17 + 8);
  *(void *)uint64_t v17 = v19;
  *(unsigned char *)(v17 + 8) = (_BYTE)v18;
  sub_1DADABA40(v20, v21);
  if (a1 != a2)
  {
    uint64_t v22 = a3[14];
    uint64_t v23 = (void *)(a1 + v22);
    uint64_t v24 = (const void *)(a2 + v22);
    sub_1DADADF3C(a1 + v22, &qword_1EB682688);
    uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682688);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v26 = sub_1DADF5DA0();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v26 - 8) + 32))(v23, v24, v26);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v23, v24, *(void *)(*(void *)(v25 - 8) + 64));
    }
    uint64_t v27 = a3[15];
    uint64_t v28 = (void *)(a1 + v27);
    uint64_t v29 = (const void *)(a2 + v27);
    sub_1DADADF3C(a1 + v27, &qword_1EB682F58);
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v31 = sub_1DADF6790();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v31 - 8) + 32))(v28, v29, v31);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v28, v29, *(void *)(*(void *)(v30 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1DADAC95C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DADAC970);
}

uint64_t sub_1DADAC970(uint64_t a1, uint64_t a2, int *a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A8);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a2)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a3[11];
LABEL_11:
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v14(a1 + v11, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8708);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a3[12];
    goto LABEL_11;
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826B8);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a2)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a3[14];
    goto LABEL_11;
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A0);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a3[15];

  return v16(v18, a2, v17);
}

uint64_t sub_1DADACB44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DADACB58);
}

uint64_t sub_1DADACB58(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
    return result;
  }
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A8);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[11];
LABEL_9:
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    return v14(v5 + v11, a2, a2, v9);
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8708);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
  {
    uint64_t v9 = v12;
    uint64_t v10 = *(void *)(v12 - 8);
    uint64_t v11 = a4[12];
    goto LABEL_9;
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826B8);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v9 = v13;
    uint64_t v10 = *(void *)(v13 - 8);
    uint64_t v11 = a4[14];
    goto LABEL_9;
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A0);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = v5 + a4[15];

  return v16(v18, a2, a2, v17);
}

void sub_1DADACD2C()
{
  sub_1DADACF0C(319, (unint64_t *)&qword_1EB6835B8, MEMORY[0x1E4F3C5D0]);
  if (v0 <= 0x3F)
  {
    sub_1DADACF0C(319, &qword_1EA8F8710, MEMORY[0x1E4F3D548]);
    if (v1 <= 0x3F)
    {
      sub_1DADACF0C(319, &qword_1EB682690, MEMORY[0x1E4F3CBF0]);
      if (v2 <= 0x3F)
      {
        sub_1DADACF0C(319, (unint64_t *)&qword_1EB683638, MEMORY[0x1E4F46AE8]);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_1DADACF0C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1DADF5C10();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_1DADACF64()
{
  unint64_t result = qword_1EA8F8718;
  if (!qword_1EA8F8718)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8720);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F86E0);
    sub_1DADAADAC();
    swift_getOpaqueTypeConformance2();
    sub_1DADADFFC(&qword_1EA8F83E8, MEMORY[0x1E4F3DF60]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8718);
  }
  return result;
}

uint64_t *sub_1DADAD044(uint64_t *a1, uint64_t *a2, int *a3)
{
  unint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *unint64_t v4 = *a2;
    unint64_t v4 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    uint64_t v7 = a3[5];
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    uint64_t v10 = sub_1DADF5DA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    uint64_t v11 = a3[7];
    *(uint64_t *)((char *)v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    *(uint64_t *)((char *)v4 + v11) = *(uint64_t *)((char *)a2 + v11);
  }
  return v4;
}

uint64_t sub_1DADAD134(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  uint64_t v3 = sub_1DADF5DA0();
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);

  return v4(v2, v3);
}

void *sub_1DADAD19C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1DADF5DA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  return a1;
}

void *sub_1DADAD23C(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1DADF5DA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
  return a1;
}

void *sub_1DADAD2E0(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1DADF5DA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  return a1;
}

void *sub_1DADAD380(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a3[5];
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_1DADF5DA0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 40))(v7, v8, v9);
  uint64_t v10 = a3[7];
  *(void *)((char *)a1 + a3[6]) = *(void *)((char *)a2 + a3[6]);
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  return a1;
}

uint64_t sub_1DADAD420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DADAD434);
}

uint64_t sub_1DADAD434(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 20);
  uint64_t v5 = sub_1DADF5DA0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48);

  return v6(v4, a2, v5);
}

uint64_t sub_1DADAD4A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DADAD4B8);
}

uint64_t sub_1DADAD4B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 20);
  uint64_t v6 = sub_1DADF5DA0();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(v5, a2, a2, v6);
}

uint64_t type metadata accessor for BCUIBatteryGlyphView.BatteryFillShape(uint64_t a1)
{
  return sub_1DADAD54C(a1, (uint64_t *)&unk_1EB684250);
}

uint64_t sub_1DADAD54C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1DADAD584()
{
  uint64_t result = sub_1DADF5DA0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1DADAD624()
{
  return sub_1DADAD660(&qword_1EA8F8728, &qword_1EA8F8730);
}

uint64_t sub_1DADAD660(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1DADAD6A8()
{
  unint64_t result = qword_1EA8F8738;
  if (!qword_1EA8F8738)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8738);
  }
  return result;
}

uint64_t sub_1DADAD6FC()
{
  return sub_1DADAD764(&qword_1EA8F8DA0);
}

uint64_t sub_1DADAD730()
{
  return sub_1DADAD764(&qword_1EA8F8D98);
}

uint64_t sub_1DADAD764(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for BCUIBatteryGlyphView.BatteryFillShape(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DADAD7A8@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v23 = a4;
  uint64_t v9 = v5;
  uint64_t v11 = sub_1DADF6030();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x1F4188790]();
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DADAE0AC(v9, (uint64_t)v16, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v17 - 8) + 32))(a5, v16, v17);
  }
  else
  {
    os_log_type_t v19 = sub_1DADF69F0();
    uint64_t v20 = sub_1DADF6200();
    if (os_log_type_enabled(v20, v19))
    {
      uint64_t v21 = swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v24 = v22;
      *(_DWORD *)uint64_t v21 = 136315138;
      *(void *)(v21 + 4) = sub_1DADA5DB0(a3, v23, &v24);
      _os_log_impl(&dword_1DAD96000, v20, v19, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1E01829D0](v22, -1, -1);
      MEMORY[0x1E01829D0](v21, -1, -1);
    }

    sub_1DADF6020();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

double sub_1DADADA30@<D0>(uint64_t a1@<X8>)
{
  uint64_t v11 = sub_1DADF60D0();
  uint64_t v2 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1DADF5DA0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BCUIBatteryGlyphView.BatteryFillShape(0);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4F3CBD8], v5);
  sub_1DADF5D90();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E4F3D4A0], v11);
  sub_1DADF6320();
  double result = *(double *)&v12;
  long long v10 = v13;
  *(_OWORD *)a1 = v12;
  *(_OWORD *)(a1 + 16) = v10;
  *(unsigned char *)(a1 + 32) = v14;
  return result;
}

uint64_t sub_1DADADCCC()
{
  return sub_1DADADD9C(&qword_1EA8F8788, &qword_1EA8F8780, (void (*)(void))sub_1DADADCFC);
}

unint64_t sub_1DADADCFC()
{
  unint64_t result = qword_1EA8F8790;
  if (!qword_1EA8F8790)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8798);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8790);
  }
  return result;
}

uint64_t sub_1DADADD70(uint64_t a1)
{
  return a1;
}

uint64_t sub_1DADADD9C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1DADADE18()
{
  unint64_t result = qword_1EA8F87A8;
  if (!qword_1EA8F87A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8758);
    sub_1DADAD764(&qword_1EA8F8D98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F87A8);
  }
  return result;
}

uint64_t sub_1DADADEB0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1DADADEDC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1DADADF3C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1DADADF98(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DADADFFC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1DADAE044(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DADAE0AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DADAE114()
{
  return 4;
}

uint64_t sub_1DADAE11C()
{
  return 6;
}

uint64_t sub_1DADAE124(uint64_t a1)
{
  return sub_1DADAE684(a1, &qword_1EB682F90);
}

uint64_t sub_1DADAE130()
{
  return sub_1DADAE6DC();
}

uint64_t sub_1DADAE144@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 168))();
  *a2 = result;
  return result;
}

uint64_t sub_1DADAE190(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 176);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_1DADAE1E4()
{
  return sub_1DADAE80C();
}

uint64_t (*sub_1DADAE1F8(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1DADF5B50();
  return sub_1DADAE284;
}

uint64_t sub_1DADAE288()
{
  return MEMORY[0x1E4FBC860];
}

uint64_t sub_1DADAE294()
{
  return sub_1DADAF30C((uint64_t)&OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__devices, &qword_1EB682678);
}

uint64_t sub_1DADAE2A8(uint64_t a1)
{
  return sub_1DADAF390(a1, &qword_1EA8F87D8, (uint64_t)&OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__devices, &qword_1EB682678);
}

uint64_t (*sub_1DADAE2C4(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F87D8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__devices;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682678);
  sub_1DADF5B30();
  swift_endAccess();
  return sub_1DADAE3D4;
}

uint64_t sub_1DADAE3D8(uint64_t a1)
{
  return sub_1DADAE684(a1, &qword_1EB682F88);
}

uint64_t sub_1DADAE3E4()
{
  return sub_1DADAE6DC();
}

uint64_t sub_1DADAE3F8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 216))();
  *a2 = result;
  return result;
}

uint64_t sub_1DADAE444(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 224);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_1DADAE498()
{
  return sub_1DADAE80C();
}

uint64_t (*sub_1DADAE4AC(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1DADF5B50();
  return sub_1DADAE284;
}

uint64_t sub_1DADAE538()
{
  return sub_1DADAF30C((uint64_t)&OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__chargeRingsData, &qword_1EB682670);
}

uint64_t sub_1DADAE54C(uint64_t a1)
{
  return sub_1DADAF390(a1, &qword_1EA8F87E0, (uint64_t)&OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__chargeRingsData, &qword_1EB682670);
}

uint64_t (*sub_1DADAE568(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F87E0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__chargeRingsData;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682670);
  sub_1DADF5B30();
  swift_endAccess();
  return sub_1DADAE3D4;
}

uint64_t sub_1DADAE678(uint64_t a1)
{
  return sub_1DADAE684(a1, &qword_1EB682F80);
}

uint64_t sub_1DADAE684(uint64_t a1, uint64_t *a2)
{
  return sub_1DADF5B20();
}

uint64_t sub_1DADAE6C8()
{
  return sub_1DADAE6DC();
}

uint64_t sub_1DADAE6DC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DADF5B60();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1DADAE748@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 264))();
  *a2 = result;
  return result;
}

uint64_t sub_1DADAE79C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))(**(void **)a2 + 272);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_1DADAE7F8()
{
  return sub_1DADAE80C();
}

uint64_t sub_1DADAE80C()
{
  return sub_1DADF5B70();
}

uint64_t (*sub_1DADAE878(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1DADF5B50();
  return sub_1DADAE284;
}

uint64_t sub_1DADAE904()
{
  return sub_1DADAF30C((uint64_t)&OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__chargeRowsData, &qword_1EB682668);
}

uint64_t sub_1DADAE918(uint64_t a1)
{
  return sub_1DADAF390(a1, &qword_1EA8F87E8, (uint64_t)&OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__chargeRowsData, &qword_1EB682668);
}

uint64_t (*sub_1DADAE934(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F87E8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__chargeRowsData;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682668);
  sub_1DADF5B30();
  swift_endAccess();
  return sub_1DADAE3D4;
}

uint64_t sub_1DADAEA44()
{
  return sub_1DADF5B20();
}

uint64_t sub_1DADAEA94()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DADF5B60();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1DADAEB0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 312))();
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1DADAEB68(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void))(**(void **)a2 + 320))(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_1DADAEBC4()
{
  return sub_1DADF5B70();
}

uint64_t (*sub_1DADAEC48(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1DADF5B50();
  return sub_1DADAE284;
}

uint64_t sub_1DADAECD4()
{
  return 0;
}

uint64_t sub_1DADAECE0()
{
  return sub_1DADAF30C((uint64_t)&OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__systemMediumWidth, &qword_1EB682660);
}

uint64_t sub_1DADAECF4(uint64_t a1)
{
  return sub_1DADAF390(a1, &qword_1EA8F87F0, (uint64_t)&OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__systemMediumWidth, &qword_1EB682660);
}

uint64_t (*sub_1DADAED10(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F87F0);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__systemMediumWidth;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682660);
  sub_1DADF5B30();
  swift_endAccess();
  return sub_1DADAE3D4;
}

uint64_t sub_1DADAEE20(uint64_t a1)
{
  uint64_t v2 = sub_1DADF5D80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_1DADF5B20();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t sub_1DADAEF18()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DADF5B60();
  swift_release();

  return swift_release();
}

uint64_t sub_1DADAEF90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 360))();
}

uint64_t sub_1DADAEFDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1DADF5D80();
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v7 + 16))(v6, a1);
  return (*(uint64_t (**)(char *))(**(void **)a2 + 368))(v6);
}

uint64_t sub_1DADAF0DC(uint64_t a1)
{
  uint64_t v2 = sub_1DADF5D80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  swift_retain();
  sub_1DADF5B70();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*sub_1DADAF204(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1DADF5B50();
  return sub_1DADAE284;
}

void sub_1DADAF290(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();

  free(v1);
}

uint64_t sub_1DADAF2F8()
{
  return sub_1DADAF30C((uint64_t)&OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__dynamicTypeSize, &qword_1EB6825A0);
}

uint64_t sub_1DADAF30C(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t sub_1DADAF374(uint64_t a1)
{
  return sub_1DADAF390(a1, &qword_1EA8F87F8, (uint64_t)&OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__dynamicTypeSize, &qword_1EB6825A0);
}

uint64_t sub_1DADAF390(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_1DADF5B40();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_1DADAF4C0(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F87F8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__dynamicTypeSize;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6825A0);
  sub_1DADF5B30();
  swift_endAccess();
  return sub_1DADAE3D4;
}

void sub_1DADAF5D0(uint64_t a1, char a2)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_1DADF5B40();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    sub_1DADF5B40();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);

  free(v3);
}

uint64_t sub_1DADAF740@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__colorScheme;
  swift_beginAccess();
  uint64_t v4 = sub_1DADF5C00();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_1DADAF7C4(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__colorScheme;
  swift_beginAccess();
  uint64_t v4 = sub_1DADF5C00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

void (*sub_1DADAF850(void *a1))(uint64_t *a1, char a2)
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_1DADF5C00();
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = v5;
  v3[11] = v5;
  size_t v7 = *(void *)(v5 + 64);
  v3[12] = malloc(v7);
  uint64_t v8 = malloc(v7);
  uint64_t v9 = OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__colorScheme;
  v3[13] = v8;
  v3[14] = v9;
  uint64_t v10 = v1 + v9;
  swift_beginAccess();
  uint64_t v11 = *(void (**)(void *, uint64_t, uint64_t))(v6 + 16);
  v3[15] = v11;
  v3[16] = (v6 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v11(v8, v10, v4);
  return sub_1DADAF96C;
}

void sub_1DADAF96C(uint64_t *a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void **)(*a1 + 104);
  uint64_t v5 = *(void *)(*a1 + 88);
  uint64_t v4 = *(void **)(*a1 + 96);
  uint64_t v6 = *(void *)(*a1 + 80);
  uint64_t v7 = *(void *)(v2 + 72) + *(void *)(v2 + 112);
  if (a2)
  {
    (*(void (**)(void, void, void))(v2 + 120))(*(void *)(v2 + 96), *(void *)(v2 + 104), *(void *)(v2 + 80));
    swift_beginAccess();
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 40))(v7, v4, v6);
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v5 + 8))(v3, v6);
  }
  else
  {
    swift_beginAccess();
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 40))(v7, v3, v6);
    swift_endAccess();
  }
  free(v3);
  free(v4);

  free((void *)v2);
}

uint64_t sub_1DADAFA98()
{
  uint64_t v1 = sub_1DADF5D80();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v1);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t))(*(void *)v0 + 360))(v3);
  char v6 = sub_1DADF333C();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  if (v6) {
    return 3;
  }
  else {
    return 4;
  }
}

uint64_t sub_1DADAFBA4()
{
  uint64_t v1 = sub_1DADF5D80();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v1);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t))(*(void *)v0 + 360))(v3);
  char v6 = sub_1DADF333C();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  if (v6) {
    return 3;
  }
  else {
    return 6;
  }
}

uint64_t sub_1DADAFCB4(uint64_t a1, char *a2, uint64_t a3)
{
  swift_allocObject();
  uint64_t v6 = sub_1DADB1B48(a1, a2, a3);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1DADAFD18(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v3 = sub_1DADB1B48(a1, a2, a3);
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_1DADAFD4C(unint64_t a1)
{
  uint64_t v3 = sub_1DADF5AD0();
  uint64_t v4 = *(char **)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)&v79 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v80 = (char *)&v79 - v8;
  uint64_t v9 = *(void (**)(uint64_t))(*(void *)v1 + 176);
  uint64_t v10 = swift_bridgeObjectRetain();
  v9(v10);
  uint64_t v11 = MEMORY[0x1E4FBC860];
  (*(void (**)(void))(*(void *)v1 + 224))(MEMORY[0x1E4FBC860]);
  long long v12 = *(void (**)(uint64_t))(*(void *)v1 + 272);
  uint64_t v88 = v1;
  v12(v11);
  if (a1 >> 62) {
    goto LABEL_34;
  }
  uint64_t v14 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  do
  {
    if (!v14)
    {
LABEL_32:
      uint64_t v96 = 0;
      unint64_t v97 = 0xE000000000000000;
      uint64_t v98 = 0;
      *(void *)&long long v99 = 0;
      *(_DWORD *)((char *)&v99 + 7) = 0;
      unint64_t v100 = 0;
      unint64_t v101 = 0xE000000000000000;
      uint64_t v73 = v88;
      uint64_t v74 = (void (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v88 + 232))(v95);
      uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F88);
      sub_1DADF21BC((uint64_t)&v96, 4, v75);
      v74(v95, 0);
      uint64_t v96 = 0;
      unint64_t v97 = 0xE000000000000000;
      uint64_t v98 = 0;
      long long v99 = 0uLL;
      unint64_t v100 = 0xE000000000000000;
      LOWORD(v101) = 0;
      BYTE2(v101) = 0;
      uint64_t v76 = (uint64_t (*)(unsigned char *, void))(*(uint64_t (**)(unsigned char *))(*(void *)v73 + 280))(v95);
      uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F80);
      sub_1DADF21BC((uint64_t)&v96, 6, v77);
      return v76(v95, 0);
    }
    unint64_t v15 = 0;
    unint64_t v94 = a1 & 0xC000000000000001;
    unint64_t v82 = (void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    uint64_t v83 = (void (**)(char *, uint64_t))(v4 + 8);
    *(void *)&long long v13 = 136315138;
    long long v81 = v13;
    uint64_t v79 = MEMORY[0x1E4FBC840] + 8;
    uint64_t v85 = v3;
    uint64_t v86 = v14;
    double v87 = v7;
    unint64_t v84 = a1;
    while (v14 != v15)
    {
      if (v15 != 6)
      {
        id v16 = v94 ? (id)MEMORY[0x1E0181F60](v15, a1) : *(id *)(a1 + 8 * v15 + 32);
        uint64_t v17 = v16;
        id v18 = objc_msgSend(v16, sel_identifier, v79);
        if (v18)
        {
          os_log_type_t v19 = v18;
          uint64_t v20 = sub_1DADF6840();
          uint64_t v22 = v21;

          id v23 = objc_msgSend(v17, sel_name);
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v93 = v20;
            uint64_t v92 = sub_1DADF6840();
            uint64_t v26 = v25;

            double v27 = (double)(uint64_t)objc_msgSend(v17, sel_percentCharge) / 100.0;
            uint64_t v28 = sub_1DADF09C8();
            unsigned int v91 = objc_msgSend(v17, sel_isLowBattery);
            unsigned int v90 = objc_msgSend(v17, sel_isLowPowerModeActive);
            unsigned int v89 = objc_msgSend(v17, sel_isCharging);
            if (v15 <= 3)
            {
              uint64_t v29 = *(uint64_t (**)(uint64_t *))(*(void *)v88 + 232);
              swift_bridgeObjectRetain();
              swift_retain();
              swift_bridgeObjectRetain();
              uint64_t v30 = (void (*)(uint64_t *, void))v29(&v96);
              long long v32 = v31;
              long long v33 = *v31;
              char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              void *v32 = v33;
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              {
                long long v33 = sub_1DADB182C(0, v33[2] + 1, 1, v33);
                void *v32 = v33;
              }
              unint64_t v36 = v33[2];
              unint64_t v35 = v33[3];
              if (v36 >= v35 >> 1)
              {
                long long v33 = sub_1DADB182C((void *)(v35 > 1), v36 + 1, 1, v33);
                void *v32 = v33;
              }
              v33[2] = v36 + 1;
              uint64_t v37 = (double *)&v33[7 * v36];
              *((void *)v37 + 4) = v92;
              *((void *)v37 + 5) = v26;
              v37[6] = v27;
              *((void *)v37 + 7) = v28;
              *((unsigned char *)v37 + 64) = v91;
              *((unsigned char *)v37 + 65) = v90;
              *((unsigned char *)v37 + 66) = v89;
              *((void *)v37 + 9) = v93;
              *((void *)v37 + 10) = v22;
              v30(&v96, 0);
            }
            uint64_t v38 = *(uint64_t (**)(uint64_t *))(*(void *)v88 + 280);
            swift_retain();
            uint64_t v39 = (void (*)(uint64_t *, void))v38(&v96);
            v41 = v40;
            uint64_t v42 = *v40;
            char v43 = swift_isUniquelyReferenced_nonNull_native();
            void *v41 = v42;
            if ((v43 & 1) == 0)
            {
              uint64_t v42 = sub_1DADB1704(0, v42[2] + 1, 1, v42);
              void *v41 = v42;
            }
            unint64_t v45 = v42[2];
            unint64_t v44 = v42[3];
            uint64_t v4 = (char *)(v45 + 1);
            if (v45 >= v44 >> 1)
            {
              uint64_t v42 = sub_1DADB1704((void *)(v44 > 1), v45 + 1, 1, v42);
              void *v41 = v42;
            }
            uint64_t v3 = v85;
            v42[2] = v4;
            double v46 = (double *)&v42[7 * v45];
            *((void *)v46 + 4) = v92;
            *((void *)v46 + 5) = v26;
            v46[6] = v27;
            uint64_t v47 = v93;
            *((void *)v46 + 7) = v28;
            *((void *)v46 + 8) = v47;
            *((void *)v46 + 9) = v22;
            *((unsigned char *)v46 + 80) = v89;
            *((unsigned char *)v46 + 81) = v91;
            *((unsigned char *)v46 + 82) = v90;
            v39(&v96, 0);

            swift_release();
            a1 = v84;
            uint64_t v14 = v86;
            uint64_t v7 = v87;
          }
          else
          {
            swift_bridgeObjectRelease();
            uint64_t v60 = sub_1DADF08BC();
            uint64_t v61 = v80;
            (*v82)(v80, v60, v3);
            uint64_t v4 = v17;
            uint64_t v62 = sub_1DADF5AB0();
            os_log_type_t v63 = sub_1DADF69E0();
            if (os_log_type_enabled(v62, v63))
            {
              uint64_t v64 = swift_slowAlloc();
              uint64_t v65 = swift_slowAlloc();
              uint64_t v96 = v65;
              *(_DWORD *)uint64_t v64 = v81;
              id v66 = objc_msgSend(v4, sel_description);
              uint64_t v67 = sub_1DADF6840();
              unint64_t v69 = v68;

              uint64_t v70 = v67;
              uint64_t v3 = v85;
              *(void *)(v64 + 4) = sub_1DADA5DB0(v70, v69, &v96);

              swift_bridgeObjectRelease();
              _os_log_impl(&dword_1DAD96000, v62, v63, "Skipping report of this device because its name was nil: %s", (uint8_t *)v64, 0xCu);
              swift_arrayDestroy();
              uint64_t v71 = v65;
              uint64_t v7 = v87;
              MEMORY[0x1E01829D0](v71, -1, -1);
              uint64_t v72 = v64;
              uint64_t v14 = v86;
              MEMORY[0x1E01829D0](v72, -1, -1);
            }
            else
            {
            }
            (*v83)(v61, v3);
            a1 = v84;
          }
        }
        else
        {
          uint64_t v48 = sub_1DADF08BC();
          (*v82)(v7, v48, v3);
          uint64_t v4 = v17;
          v49 = sub_1DADF5AB0();
          os_log_type_t v50 = sub_1DADF69E0();
          if (os_log_type_enabled(v49, v50))
          {
            uint64_t v51 = swift_slowAlloc();
            uint64_t v52 = swift_slowAlloc();
            uint64_t v96 = v52;
            *(_DWORD *)uint64_t v51 = v81;
            id v53 = objc_msgSend(v4, sel_description);
            uint64_t v54 = sub_1DADF6840();
            unint64_t v56 = v55;

            uint64_t v57 = v54;
            uint64_t v3 = v85;
            *(void *)(v51 + 4) = sub_1DADA5DB0(v57, v56, &v96);

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1DAD96000, v49, v50, "Skipping report of this device because its identifier was nil: %s", (uint8_t *)v51, 0xCu);
            swift_arrayDestroy();
            uint64_t v58 = v52;
            uint64_t v7 = v87;
            MEMORY[0x1E01829D0](v58, -1, -1);
            uint64_t v59 = v51;
            uint64_t v14 = v86;
            MEMORY[0x1E01829D0](v59, -1, -1);
          }
          else
          {
          }
          (*v83)(v7, v3);
        }
        if (v14 != ++v15) {
          continue;
        }
      }
      goto LABEL_32;
    }
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_1DADF6B30();
    uint64_t result = swift_bridgeObjectRelease();
  }
  while ((v14 & 0x8000000000000000) == 0);
  __break(1u);
  return result;
}

uint64_t sub_1DADB06EC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>)
{
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(double *)(a9 + 16) = a10;
  *(void *)(a9 + 24) = a3;
  *(unsigned char *)(a9 + 32) = a4;
  *(unsigned char *)(a9 + 33) = a5;
  *(unsigned char *)(a9 + 34) = a6;
  *(void *)(a9 + 40) = a7;
  *(void *)(a9 + 48) = a8;
  return result;
}

uint64_t sub_1DADB070C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, char a7@<W6>, char a8@<W7>, uint64_t a9@<X8>, double a10@<D0>)
{
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(double *)(a9 + 16) = a10;
  *(void *)(a9 + 24) = a3;
  *(void *)(a9 + 32) = a4;
  *(void *)(a9 + 40) = a5;
  *(unsigned char *)(a9 + 48) = a6;
  *(unsigned char *)(a9 + 49) = a7;
  *(unsigned char *)(a9 + 50) = a8;
  return result;
}

void *sub_1DADB072C()
{
  return &unk_1DADF82D0;
}

void *sub_1DADB0738()
{
  return &unk_1DADF8298;
}

uint64_t sub_1DADB0744()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__colorScheme;
  uint64_t v2 = sub_1DADF5C00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__devices;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682678);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__chargeRingsData;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682670);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v0 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__chargeRowsData;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682668);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v0 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__systemMediumWidth;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682660);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = v0 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__dynamicTypeSize;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6825A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  return v0;
}

uint64_t sub_1DADB0910()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__colorScheme;
  uint64_t v2 = sub_1DADF5C00();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__devices;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682678);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__chargeRingsData;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682670);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = v0 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__chargeRowsData;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682668);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  uint64_t v9 = v0 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__systemMediumWidth;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682660);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = v0 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__dynamicTypeSize;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6825A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);

  return swift_deallocClassInstance();
}

uint64_t sub_1DADB0B18@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AvocadoViewModel();
  uint64_t result = sub_1DADF5AE0();
  *a1 = result;
  return result;
}

uint64_t sub_1DADB0B58(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 40) == *(void *)(a2 + 40) && *(void *)(a1 + 48) == *(void *)(a2 + 48)) {
    return 1;
  }
  else {
    return sub_1DADF6BB0();
  }
}

uint64_t sub_1DADB0B88()
{
  swift_bridgeObjectRetain();
  sub_1DADF6860();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1DADB0BE0()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1DADB0C10(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*sub_1DADB0C48())()
{
  return nullsub_1;
}

double sub_1DADB0C68()
{
  return *(double *)(v0 + 16);
}

void sub_1DADB0C70(double a1)
{
  *(double *)(v1 + 16) = a1;
}

uint64_t (*sub_1DADB0C78())()
{
  return nullsub_1;
}

uint64_t sub_1DADB0C98()
{
  return 0;
}

uint64_t sub_1DADB0CA0()
{
  return swift_retain();
}

uint64_t sub_1DADB0CA8(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 24) = a1;
  return result;
}

uint64_t (*sub_1DADB0CD4())()
{
  return nullsub_1;
}

uint64_t sub_1DADB0CF4()
{
  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t sub_1DADB0CFC(uint64_t result)
{
  *(unsigned char *)(v1 + 32) = result;
  return result;
}

uint64_t (*sub_1DADB0D04())()
{
  return nullsub_1;
}

uint64_t sub_1DADB0D24()
{
  return *(unsigned __int8 *)(v0 + 33);
}

uint64_t sub_1DADB0D2C(uint64_t result)
{
  *(unsigned char *)(v1 + 33) = result;
  return result;
}

uint64_t (*sub_1DADB0D34())()
{
  return nullsub_1;
}

uint64_t sub_1DADB0D54()
{
  return *(unsigned __int8 *)(v0 + 34);
}

uint64_t sub_1DADB0D5C(uint64_t result)
{
  *(unsigned char *)(v1 + 34) = result;
  return result;
}

uint64_t (*sub_1DADB0D64())()
{
  return nullsub_1;
}

uint64_t sub_1DADB0D84()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1DADB0DB4(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return result;
}

uint64_t (*sub_1DADB0DEC())()
{
  return nullsub_1;
}

void sub_1DADB0E0C(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 31) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0xE000000000000000;
}

BOOL sub_1DADB0E24()
{
  return *(void *)(v0 + 24) == 0;
}

uint64_t sub_1DADB0E34()
{
  uint64_t v3 = 0;
  unint64_t v4 = 0xE000000000000000;
  sub_1DADF6AC0();
  sub_1DADF6870();
  swift_bridgeObjectRetain();
  sub_1DADF6870();
  swift_bridgeObjectRelease();
  sub_1DADF6870();
  sub_1DADF6990();
  sub_1DADF6870();
  swift_bridgeObjectRelease();
  sub_1DADF6870();
  sub_1DADB20E8(v0 + 24, (uint64_t)v5);
  sub_1DADB20E8((uint64_t)v5, (uint64_t)&v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F85C8);
  sub_1DADF6A80();
  sub_1DADF6870();
  swift_bridgeObjectRelease();
  sub_1DADF6870();
  sub_1DADF6870();
  swift_bridgeObjectRelease();
  sub_1DADF6870();
  sub_1DADF6870();
  swift_bridgeObjectRelease();
  sub_1DADF6870();
  sub_1DADF6870();
  swift_bridgeObjectRelease();
  sub_1DADF6870();
  swift_bridgeObjectRetain();
  sub_1DADF6870();
  swift_bridgeObjectRelease();
  sub_1DADF6870();
  return v3;
}

uint64_t sub_1DADB10DC()
{
  return sub_1DADF6BF0();
}

uint64_t sub_1DADB1138()
{
  return sub_1DADF6BF0();
}

uint64_t sub_1DADB1194()
{
  return sub_1DADF6BF0();
}

uint64_t sub_1DADB11EC(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32) == *(void *)(a2 + 32) && *(void *)(a1 + 40) == *(void *)(a2 + 40)) {
    return 1;
  }
  else {
    return sub_1DADF6BB0();
  }
}

uint64_t sub_1DADB121C()
{
  swift_bridgeObjectRetain();
  sub_1DADF6860();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1DADB1274(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 32) = a1;
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t sub_1DADB12AC()
{
  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t sub_1DADB12B4(uint64_t result)
{
  *(unsigned char *)(v1 + 48) = result;
  return result;
}

uint64_t (*sub_1DADB12BC())()
{
  return nullsub_1;
}

uint64_t sub_1DADB12DC()
{
  return *(unsigned __int8 *)(v0 + 49);
}

uint64_t sub_1DADB12E4(uint64_t result)
{
  *(unsigned char *)(v1 + 49) = result;
  return result;
}

uint64_t (*sub_1DADB12EC())()
{
  return nullsub_1;
}

uint64_t sub_1DADB130C()
{
  return *(unsigned __int8 *)(v0 + 50);
}

uint64_t sub_1DADB1314(uint64_t result)
{
  *(unsigned char *)(v1 + 50) = result;
  return result;
}

uint64_t (*sub_1DADB131C())()
{
  return nullsub_1;
}

void sub_1DADB133C(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0xE000000000000000;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0xE000000000000000;
  *(_WORD *)(a1 + 48) = 0;
  *(unsigned char *)(a1 + 50) = 0;
}

uint64_t sub_1DADB1358()
{
  uint64_t v3 = 0;
  unint64_t v4 = 0xE000000000000000;
  sub_1DADF6AC0();
  sub_1DADF6870();
  swift_bridgeObjectRetain();
  sub_1DADF6870();
  swift_bridgeObjectRelease();
  sub_1DADF6870();
  sub_1DADF6990();
  sub_1DADF6870();
  swift_bridgeObjectRelease();
  sub_1DADF6870();
  sub_1DADB20E8(v0 + 24, (uint64_t)v5);
  sub_1DADB20E8((uint64_t)v5, (uint64_t)&v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F85C8);
  sub_1DADF6A80();
  sub_1DADF6870();
  swift_bridgeObjectRelease();
  sub_1DADF6870();
  swift_bridgeObjectRetain();
  sub_1DADF6870();
  swift_bridgeObjectRelease();
  sub_1DADF6870();
  sub_1DADF6870();
  swift_bridgeObjectRelease();
  sub_1DADF6870();
  sub_1DADF6870();
  swift_bridgeObjectRelease();
  sub_1DADF6870();
  sub_1DADF6870();
  swift_bridgeObjectRelease();
  sub_1DADF6870();
  return v3;
}

uint64_t sub_1DADB15F4()
{
  return sub_1DADF6BF0();
}

uint64_t sub_1DADB1650()
{
  return sub_1DADF6BF0();
}

uint64_t sub_1DADB16AC()
{
  return sub_1DADF6BF0();
}

void *sub_1DADB1704(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BE8);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[7 * v8 + 4]) {
          memmove(v12, a4 + 4, 56 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v12 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1DADB1A50(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1DADB182C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6825A8);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[7 * v8 + 4]) {
          memmove(v12, a4 + 4, 56 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x1E4FBC860];
      uint64_t v12 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1DADB1958(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DADB1958(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 56 * a1 + 32;
    unint64_t v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1DADF6B70();
  __break(1u);
  return result;
}

uint64_t sub_1DADB1A50(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 56 * a1 + 32;
    unint64_t v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1DADF6B70();
  __break(1u);
  return result;
}

uint64_t sub_1DADB1B48(uint64_t a1, char *a2, uint64_t a3)
{
  os_log_type_t v50 = a2;
  uint64_t v51 = a3;
  uint64_t v52 = a1;
  uint64_t v4 = sub_1DADF5D80();
  uint64_t v47 = *(void *)(v4 - 8);
  uint64_t v48 = v4;
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  v49 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  double v46 = (char *)&v40 - v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682660);
  uint64_t v44 = *(void *)(v8 - 8);
  uint64_t v45 = v8;
  MEMORY[0x1F4188790](v8);
  char v43 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682668);
  uint64_t v41 = *(void *)(v10 - 8);
  uint64_t v42 = v10;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682670);
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1F4188790](v13);
  id v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682678);
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v3 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel_maxChargeRings) = 4;
  *(void *)(v3 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel_maxChargeRows) = 6;
  uint64_t v21 = v3 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__devices;
  uint64_t v22 = MEMORY[0x1E4FBC860];
  uint64_t v53 = MEMORY[0x1E4FBC860];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F90);
  sub_1DADF5B20();
  (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(v21, v20, v17);
  uint64_t v23 = v3 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__chargeRingsData;
  uint64_t v53 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F88);
  sub_1DADF5B20();
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v23, v16, v13);
  uint64_t v24 = v3 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__chargeRowsData;
  uint64_t v53 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F80);
  sub_1DADF5B20();
  (*(void (**)(uint64_t, char *, uint64_t))(v41 + 32))(v24, v12, v42);
  uint64_t v25 = v3 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__systemMediumWidth;
  uint64_t v53 = 0;
  char v54 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F20);
  uint64_t v26 = v43;
  sub_1DADF5B20();
  (*(void (**)(uint64_t, char *, uint64_t))(v44 + 32))(v25, v26, v45);
  uint64_t v28 = v46;
  uint64_t v27 = v47;
  uint64_t v29 = *(void (**)(char *, uint64_t, uint64_t))(v47 + 16);
  uint64_t v30 = v50;
  uint64_t v31 = v48;
  v29(v46, (uint64_t)v50, v48);
  swift_beginAccess();
  v29(v49, (uint64_t)v28, v31);
  sub_1DADF5B20();
  long long v32 = *(void (**)(char *, uint64_t))(v27 + 8);
  uint64_t v33 = v31;
  v32(v28, v31);
  swift_endAccess();
  uint64_t v34 = v3 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel__colorScheme;
  uint64_t v35 = sub_1DADF5C00();
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v37 = v34;
  uint64_t v38 = v51;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v37, v51, v35);
  (*(void (**)(uint64_t))(*(void *)v3 + 456))(v52);
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v38, v35);
  v32(v30, v33);
  return v3;
}

uint64_t sub_1DADB20E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F85C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADB2150()
{
  return MEMORY[0x1E4F1ABE8];
}

unint64_t sub_1DADB2160()
{
  unint64_t result = qword_1EA8F8800;
  if (!qword_1EA8F8800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8800);
  }
  return result;
}

unint64_t sub_1DADB21B8()
{
  unint64_t result = qword_1EA8F8808;
  if (!qword_1EA8F8808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8808);
  }
  return result;
}

uint64_t sub_1DADB220C()
{
  return type metadata accessor for AvocadoViewModel();
}

uint64_t type metadata accessor for AvocadoViewModel()
{
  uint64_t result = qword_1EB6840A0;
  if (!qword_1EB6840A0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1DADB2260()
{
  sub_1DADF5C00();
  if (v0 <= 0x3F)
  {
    sub_1DADB2468(319, &qword_1EB682F48, &qword_1EB682F90);
    if (v1 <= 0x3F)
    {
      sub_1DADB2468(319, &qword_1EB682F40, &qword_1EB682F88);
      if (v2 <= 0x3F)
      {
        sub_1DADB2468(319, &qword_1EB682F38, &qword_1EB682F80);
        if (v3 <= 0x3F)
        {
          sub_1DADB2468(319, &qword_1EB682F28, &qword_1EB682F20);
          if (v4 <= 0x3F)
          {
            sub_1DADB24B8();
            if (v5 <= 0x3F) {
              swift_updateClassMetadata2();
            }
          }
        }
      }
    }
  }
}

void sub_1DADB2468(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    unint64_t v4 = sub_1DADF5B80();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_1DADB24B8()
{
  if (!qword_1EB682F30)
  {
    sub_1DADF5D80();
    unint64_t v0 = sub_1DADF5B80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB682F30);
    }
  }
}

uint64_t destroy for ChargeRingData()
{
  swift_bridgeObjectRelease();
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ChargeRingData(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(_WORD *)(a1 + 33) = *(_WORD *)(a2 + 33);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ChargeRingData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ChargeRingData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
  *(unsigned char *)(a1 + 34) = *(unsigned char *)(a2 + 34);
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ChargeRingData(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ChargeRingData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ChargeRingData()
{
  return &type metadata for ChargeRingData;
}

uint64_t destroy for ChargeRowData()
{
  swift_bridgeObjectRelease();
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ChargeRowData(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_WORD *)(a1 + 49) = *(_WORD *)(a2 + 49);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ChargeRowData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(unsigned char *)(a1 + 50) = *(unsigned char *)(a2 + 50);
  return a1;
}

__n128 __swift_memcpy51_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 47) = *(_DWORD *)(a2 + 47);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ChargeRowData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(unsigned char *)(a1 + 49) = *(unsigned char *)(a2 + 49);
  *(unsigned char *)(a1 + 50) = *(unsigned char *)(a2 + 50);
  return a1;
}

uint64_t getEnumTagSinglePayload for ChargeRowData(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 51)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ChargeRowData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 50) = 0;
    *(_WORD *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 51) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 51) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ChargeRowData()
{
  return &type metadata for ChargeRowData;
}

void sub_1DADB2A14()
{
}

uint64_t sub_1DADB2A2C()
{
  type metadata accessor for AvocadoViewModel();
  sub_1DADB506C(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);

  return sub_1DADF5D40();
}

uint64_t sub_1DADB2AA8()
{
  return swift_retain();
}

uint64_t sub_1DADB2AB0(uint64_t a1)
{
  uint64_t result = swift_release();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*sub_1DADB2ADC())()
{
  return nullsub_1;
}

uint64_t sub_1DADB2AFC()
{
  type metadata accessor for AvocadoViewModel();
  sub_1DADB506C(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);

  return sub_1DADF5D50();
}

uint64_t sub_1DADB2B84()
{
  return sub_1DADF5C60();
}

unint64_t sub_1DADB2BCC()
{
  unint64_t result = qword_1EB682F78;
  if (!qword_1EB682F78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB682F78);
  }
  return result;
}

double sub_1DADB2C20()
{
  type metadata accessor for BCUI2x4AvocadoView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  sub_1DADF5C70();
  return v1;
}

uint64_t type metadata accessor for BCUI2x4AvocadoView()
{
  uint64_t result = qword_1EB683A20;
  if (!qword_1EB683A20) {
    return swift_getSingletonMetadata();
  }
  return result;
}

double sub_1DADB2CB8()
{
  return *(double *)sub_1DADF3BDC();
}

double sub_1DADB2CD4()
{
  return 11.0;
}

uint64_t sub_1DADB2CDC@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_1DADF6110();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8360);
  return sub_1DADB2D24(v1, (void *)(a1 + *(int *)(v3 + 44)));
}

uint64_t sub_1DADB2D24@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v98 = a2;
  uint64_t v3 = sub_1DADF5D80();
  uint64_t v95 = *(void *)(v3 - 8);
  uint64_t v96 = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v93 = (char *)v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F83F8);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)v84 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8390);
  MEMORY[0x1F4188790](v90);
  uint64_t v9 = (char *)v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F83C0);
  uint64_t v10 = MEMORY[0x1F4188790](v92);
  uint64_t v97 = (uint64_t)v84 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v91 = (uint64_t)v84 - v13;
  MEMORY[0x1F4188790](v12);
  uint64_t v94 = (uint64_t)v84 - v14;
  uint64_t v89 = type metadata accessor for BCUI2x4AvocadoView();
  uint64_t v99 = *(void *)(v89 - 8);
  uint64_t v15 = *(void *)(v99 + 64);
  MEMORY[0x1F4188790](v89);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8400);
  MEMORY[0x1F4188790](v16 - 8);
  uint64_t v18 = (char *)v84 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8398);
  uint64_t v19 = MEMORY[0x1F4188790](v100);
  uint64_t v21 = (char *)v84 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  uint64_t v101 = (uint64_t)v84 - v22;
  *(void *)uint64_t v18 = sub_1DADF6050();
  *((void *)v18 + 1) = 0;
  v18[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8358);
  uint64_t v102 = a1;
  uint64_t v23 = *(uint64_t (**)(uint64_t))(**(void **)(a1 + 8) + 432);
  uint64_t v24 = swift_retain();
  uint64_t v25 = v23(v24);
  uint64_t result = swift_release();
  if (v25 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v88 = v9;
    uint64_t v103 = 0;
    uint64_t v104 = v25;
    swift_getKeyPath();
    uint64_t v27 = v102;
    sub_1DADB50B4(v102, (uint64_t)v84 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for BCUI2x4AvocadoView);
    uint64_t v28 = *(unsigned __int8 *)(v99 + 80);
    uint64_t v29 = (v28 + 16) & ~v28;
    v84[2] = v29 + v15;
    v84[1] = v28 | 7;
    uint64_t v30 = swift_allocObject();
    uint64_t v85 = v29;
    uint64_t v87 = (uint64_t)v84 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1DADB4BC0(v87, v30 + v29);
    uint64_t v31 = v7;
    long long v32 = v21;
    uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8438);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F83B8);
    unint64_t v34 = sub_1DADB4C3C();
    sub_1DADB4D0C();
    uint64_t v99 = v33;
    uint64_t v35 = (uint64_t)v32;
    uint64_t v36 = (uint64_t)v31;
    unint64_t v86 = v34;
    sub_1DADF6660();
    char v37 = sub_1DADF6210();
    sub_1DADF5BE0();
    uint64_t v39 = v38;
    uint64_t v41 = v40;
    uint64_t v43 = v42;
    uint64_t v45 = v44;
    sub_1DADAE0AC((uint64_t)v18, v35, &qword_1EA8F8400);
    uint64_t v46 = v35 + *(int *)(v100 + 36);
    *(unsigned char *)uint64_t v46 = v37;
    *(void *)(v46 + 8) = v39;
    *(void *)(v46 + 16) = v41;
    *(void *)(v46 + 24) = v43;
    *(void *)(v46 + 32) = v45;
    *(unsigned char *)(v46 + 40) = 0;
    sub_1DADADF3C((uint64_t)v18, &qword_1EA8F8400);
    uint64_t v47 = v101;
    sub_1DADADF98(v35, v101, &qword_1EA8F8398);
    *(void *)uint64_t v31 = sub_1DADF6050();
    *((void *)v31 + 1) = 0;
    v31[16] = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8350);
    uint64_t v48 = *(uint64_t (**)(uint64_t))(**(void **)(v27 + 8) + 432);
    uint64_t v49 = swift_retain();
    uint64_t v50 = v48(v49);
    uint64_t result = swift_release();
    if ((v50 & 0x8000000000000000) == 0)
    {
      uint64_t v103 = 0;
      uint64_t v104 = v50;
      swift_getKeyPath();
      uint64_t v51 = v102;
      uint64_t v52 = v87;
      sub_1DADB50B4(v102, v87, (uint64_t (*)(void))type metadata accessor for BCUI2x4AvocadoView);
      uint64_t v53 = swift_allocObject();
      sub_1DADB4BC0(v52, v53 + v85);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F83A8);
      sub_1DADB4F14();
      sub_1DADF6660();
      char v54 = sub_1DADF6210();
      sub_1DADF5BE0();
      uint64_t v56 = v55;
      uint64_t v58 = v57;
      uint64_t v60 = v59;
      uint64_t v62 = v61;
      uint64_t v63 = (uint64_t)v88;
      sub_1DADAE0AC(v36, (uint64_t)v88, &qword_1EA8F83F8);
      uint64_t v64 = v63 + *(int *)(v90 + 36);
      *(unsigned char *)uint64_t v64 = v54;
      *(void *)(v64 + 8) = v56;
      *(void *)(v64 + 16) = v58;
      *(void *)(v64 + 24) = v60;
      *(void *)(v64 + 32) = v62;
      *(unsigned char *)(v64 + 40) = 0;
      sub_1DADADF3C(v36, &qword_1EA8F83F8);
      char v65 = sub_1DADF6230();
      id v66 = *(void (**)(uint64_t))(**(void **)(v51 + 8) + 360);
      uint64_t v67 = swift_retain();
      unint64_t v68 = v93;
      v66(v67);
      swift_release();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
      sub_1DADF5C70();
      sub_1DADF3318();
      (*(void (**)(char *, uint64_t))(v95 + 8))(v68, v96);
      sub_1DADF5BE0();
      uint64_t v70 = v69;
      uint64_t v72 = v71;
      uint64_t v74 = v73;
      uint64_t v76 = v75;
      uint64_t v77 = v91;
      sub_1DADAE0AC(v63, v91, &qword_1EA8F8390);
      uint64_t v78 = v77 + *(int *)(v92 + 36);
      *(unsigned char *)uint64_t v78 = v65;
      *(void *)(v78 + 8) = v70;
      *(void *)(v78 + 16) = v72;
      *(void *)(v78 + 24) = v74;
      *(void *)(v78 + 32) = v76;
      *(unsigned char *)(v78 + 40) = 0;
      sub_1DADADF3C(v63, &qword_1EA8F8390);
      uint64_t v79 = v94;
      sub_1DADADF98(v77, v94, &qword_1EA8F83C0);
      sub_1DADAE0AC(v47, v35, &qword_1EA8F8398);
      uint64_t v80 = v97;
      sub_1DADAE0AC(v79, v97, &qword_1EA8F83C0);
      long long v81 = v98;
      *uint64_t v98 = 0;
      *((unsigned char *)v81 + 8) = 1;
      unint64_t v82 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8408);
      sub_1DADAE0AC(v35, (uint64_t)v81 + v82[12], &qword_1EA8F8398);
      sub_1DADAE0AC(v80, (uint64_t)v81 + v82[16], &qword_1EA8F83C0);
      uint64_t v83 = (char *)v81 + v82[20];
      *(void *)uint64_t v83 = 0;
      v83[8] = 1;
      sub_1DADADF3C(v79, &qword_1EA8F83C0);
      sub_1DADADF3C(v47, &qword_1EA8F8398);
      sub_1DADADF3C(v80, &qword_1EA8F83C0);
      return sub_1DADADF3C(v35, &qword_1EA8F8398);
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1DADB3604@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v39 = a3;
  uint64_t v36 = sub_1DADF5D80();
  uint64_t v5 = *(void *)(v36 - 8);
  MEMORY[0x1F4188790](v36);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8428);
  MEMORY[0x1F4188790](v37);
  uint64_t v9 = (uint64_t *)((char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F83F0);
  uint64_t v10 = *(void *)(v38 - 8);
  MEMORY[0x1F4188790](v38);
  uint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8388);
  uint64_t v14 = v13 - 8;
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = *a1;
  *uint64_t v9 = sub_1DADF66D0();
  v9[1] = v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8368);
  sub_1DADB39F0(v17, (uint64_t)v9 + *(int *)(v19 + 44));
  uint64_t v20 = *(void (**)(uint64_t))(**(void **)(a2 + 8) + 360);
  uint64_t v21 = swift_retain();
  v20(v21);
  swift_release();
  LOBYTE(a2) = sub_1DADF333C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v36);
  uint64_t v22 = sub_1DADAD660(&qword_1EA8F8420, &qword_1EA8F8428);
  sub_1DADF1554(a2 & 1, 0x4052800000000000, 0, 0, 1, v37, v22, (uint64_t)v12);
  sub_1DADADF3C((uint64_t)v9, &qword_1EA8F8428);
  LOBYTE(a2) = sub_1DADF6210();
  sub_1DADF5BE0();
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v31 = v38;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v16, v12, v38);
  long long v32 = &v16[*(int *)(v14 + 44)];
  char *v32 = a2;
  *((void *)v32 + 1) = v24;
  *((void *)v32 + 2) = v26;
  *((void *)v32 + 3) = v28;
  *((void *)v32 + 4) = v30;
  v32[40] = 0;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v31);
  uint64_t v33 = sub_1DADF66D0();
  sub_1DADB3E3C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v39, 0.0, 1, 0.0, 1, v33, v34, (uint64_t)&qword_1EA8F8388, (void (*)(uint64_t, uint64_t, uint64_t))sub_1DADAE0AC, &qword_1EA8F83B8);
  return sub_1DADADF3C((uint64_t)v16, &qword_1EA8F8388);
}

uint64_t sub_1DADB39F0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v3 = type metadata accessor for BCUIChargeRingView(0);
  uint64_t v4 = MEMORY[0x1F4188790](v3 - 8);
  uint64_t v24 = (uint64_t)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v23 = (uint64_t *)((char *)&v21 - v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for BCUIChargeRingView.maskChargeRingView(0);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v22 = (uint64_t)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v21 - v13;
  type metadata accessor for AvocadoViewModel();
  sub_1DADB506C(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  sub_1DADDE298((uint64_t)v9, (uint64_t)v14);
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  long long v34 = v32;
  *(void *)&long long v35 = v33;
  uint64_t v26 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BA8);
  sub_1DADAD660(&qword_1EB682BD0, &qword_1EB682F88);
  sub_1DADF6650();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  long long v36 = v29;
  long long v37 = v30;
  uint64_t v38 = v31;
  long long v34 = v27;
  long long v35 = v28;
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  uint64_t v15 = v23;
  sub_1DADDDC28((uint64_t)&v34, (uint64_t)v9, v23);
  uint64_t v16 = v22;
  sub_1DADB50B4((uint64_t)v14, v22, type metadata accessor for BCUIChargeRingView.maskChargeRingView);
  uint64_t v17 = v24;
  sub_1DADB50B4((uint64_t)v15, v24, type metadata accessor for BCUIChargeRingView);
  uint64_t v18 = v25;
  sub_1DADB50B4(v16, v25, type metadata accessor for BCUIChargeRingView.maskChargeRingView);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8340);
  sub_1DADB50B4(v17, v18 + *(int *)(v19 + 48), type metadata accessor for BCUIChargeRingView);
  sub_1DADB511C((uint64_t)v15, type metadata accessor for BCUIChargeRingView);
  sub_1DADB511C((uint64_t)v14, type metadata accessor for BCUIChargeRingView.maskChargeRingView);
  sub_1DADB511C(v17, type metadata accessor for BCUIChargeRingView);
  return sub_1DADB511C(v16, type metadata accessor for BCUIChargeRingView.maskChargeRingView);
}

__n128 sub_1DADB3E3C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, void (*a17)(uint64_t, uint64_t, uint64_t), uint64_t *a18)
{
  uint64_t v20 = a17;
  uint64_t v21 = a18;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  int v24 = a8 & 1;
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (v24) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1DADF69F0();
    uint64_t v31 = (void *)sub_1DADF6200();
    sub_1DADF5AA0();

    uint64_t v21 = a18;
    uint64_t v20 = a17;
  }
  sub_1DADF5E40();
  v20(v18, a9, a16);
  long long v32 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v21) + 36));
  v32[4] = v38;
  v32[5] = v39;
  v32[6] = v40;
  _OWORD *v32 = v34;
  v32[1] = v35;
  __n128 result = v37;
  v32[2] = v36;
  v32[3] = v37;
  return result;
}

uint64_t sub_1DADB4020@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v16 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for BCUIChargeRingLabelView();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (uint64_t *)((char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8378);
  MEMORY[0x1F4188790](v17);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *a1;
  type metadata accessor for AvocadoViewModel();
  sub_1DADB506C(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  long long v27 = v25;
  *(void *)&long long v28 = v26;
  uint64_t v19 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BA8);
  sub_1DADAD660(&qword_1EB682BD0, &qword_1EB682F88);
  sub_1DADF6650();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  long long v29 = v22;
  long long v30 = v23;
  uint64_t v31 = v24;
  long long v27 = v20;
  long long v28 = v21;
  sub_1DADF5D50();
  swift_getKeyPath();
  uint64_t v11 = (uint64_t)v16;
  sub_1DADF5D60();
  swift_release();
  swift_release();
  *(double *)&uint64_t v12 = sub_1DADBF99C();
  sub_1DADBF9B8((uint64_t)&v27, v11, v7, v12);
  uint64_t v13 = sub_1DADF66D0();
  sub_1DADB3E3C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v9, 0.0, 1, 0.0, 1, v13, v14, (uint64_t)type metadata accessor for BCUIChargeRingLabelView, (void (*)(uint64_t, uint64_t, uint64_t))sub_1DADB50B4, &qword_1EA8F8378);
  sub_1DADB511C((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for BCUIChargeRingLabelView);
  sub_1DADB4FC0();
  sub_1DADF63E0();
  return sub_1DADADF3C((uint64_t)v9, &qword_1EA8F8378);
}

uint64_t sub_1DADB43C0@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AvocadoViewModel();
  sub_1DADB506C(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
  *a1 = sub_1DADF5D40();
  a1[1] = v2;
  uint64_t v3 = type metadata accessor for BCUI2x4AvocadoView();
  sub_1DADB2BCC();
  uint64_t result = sub_1DADF5C60();
  *(uint64_t *)((char *)a1 + *(int *)(v3 + 24)) = 0x4026000000000000;
  return result;
}

uint64_t sub_1DADB4494()
{
  return sub_1DADF3318();
}

uint64_t sub_1DADB44DC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_1DADB44F8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    swift_retain();
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t sub_1DADB45E8(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_1DADB4664(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  swift_retain();
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_1DADB4704(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_OWORD *sub_1DADB47B8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *sub_1DADB4854(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_release();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  *(void *)((char *)a1 + *(int *)(a3 + 24)) = *(void *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_1DADB48F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DADB490C);
}

uint64_t sub_1DADB490C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1DADB49C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DADB49D4);
}

uint64_t sub_1DADB49D4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1DADB4A80()
{
  sub_1DADB4B24();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1DADB4B24()
{
  if (!qword_1EB6826D0)
  {
    sub_1DADB2BCC();
    unint64_t v0 = sub_1DADF5C80();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB6826D0);
    }
  }
}

uint64_t sub_1DADB4B80()
{
  return sub_1DADAD660(&qword_1EA8F8410, &qword_1EA8F8418);
}

uint64_t sub_1DADB4BC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BCUI2x4AvocadoView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADB4C24(uint64_t a1)
{
  return sub_1DADB4E80(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1DADB3604);
}

unint64_t sub_1DADB4C3C()
{
  unint64_t result = qword_1EA8F8440;
  if (!qword_1EA8F8440)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8438);
    sub_1DADB4CB8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8440);
  }
  return result;
}

unint64_t sub_1DADB4CB8()
{
  unint64_t result = qword_1EA8F8430;
  if (!qword_1EA8F8430)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8430);
  }
  return result;
}

unint64_t sub_1DADB4D0C()
{
  unint64_t result = qword_1EA8F83B0;
  if (!qword_1EA8F83B0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F83B8);
    sub_1DADB4D88();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F83B0);
  }
  return result;
}

unint64_t sub_1DADB4D88()
{
  unint64_t result = qword_1EA8F8380;
  if (!qword_1EA8F8380)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8388);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8428);
    sub_1DADAD660(&qword_1EA8F8420, &qword_1EA8F8428);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8380);
  }
  return result;
}

uint64_t sub_1DADB4E68(uint64_t a1)
{
  return sub_1DADB4E80(a1, (uint64_t (*)(uint64_t, uint64_t))sub_1DADB4020);
}

uint64_t sub_1DADB4E80(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(type metadata accessor for BCUI2x4AvocadoView() - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a2(a1, v5);
}

unint64_t sub_1DADB4F14()
{
  unint64_t result = qword_1EA8F83A0;
  if (!qword_1EA8F83A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F83A8);
    sub_1DADB4FC0();
    sub_1DADB506C(&qword_1EA8F83E8, MEMORY[0x1E4F3DF60]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F83A0);
  }
  return result;
}

unint64_t sub_1DADB4FC0()
{
  unint64_t result = qword_1EA8F8370;
  if (!qword_1EA8F8370)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8378);
    sub_1DADB506C(&qword_1EA8F8348, (void (*)(uint64_t))type metadata accessor for BCUIChargeRingLabelView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8370);
  }
  return result;
}

uint64_t sub_1DADB506C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1DADB50B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DADB511C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_1DADB5180()
{
  qword_1EA8F9A28 = 0x4020000000000000;
}

uint64_t *sub_1DADB5190()
{
  if (qword_1EB684300 != -1) {
    swift_once();
  }
  return &qword_1EA8F9A28;
}

double sub_1DADB51DC()
{
  if (qword_1EB684300 != -1) {
    swift_once();
  }
  return *(double *)&qword_1EA8F9A28;
}

void *sub_1DADB5228()
{
  return &unk_1DADF8C10;
}

double sub_1DADB5234()
{
  return 0.4925;
}

void *sub_1DADB5240()
{
  return &unk_1DADF8C18;
}

double sub_1DADB524C()
{
  return 0.1;
}

void *sub_1DADB5258()
{
  return &unk_1DADF8C20;
}

double sub_1DADB5264()
{
  return 0.2;
}

void *sub_1DADB5270()
{
  return &unk_1DADF8C28;
}

double sub_1DADB527C()
{
  return 0.25;
}

uint64_t sub_1DADB5284()
{
  return swift_getKeyPath();
}

uint64_t sub_1DADB52A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1DADF5FC0();
  *a1 = result;
  return result;
}

uint64_t sub_1DADB52D4(id *a1)
{
  id v1 = *a1;
  return sub_1DADF5FD0();
}

double sub_1DADB5304@<D0>(uint64_t a1@<X8>)
{
  sub_1DADF65D0();
  double result = v5;
  *(unsigned char *)a1 = v3;
  *(unsigned char *)(a1 + 1) = v4;
  *(double *)(a1 + 8) = v5;
  *(_OWORD *)(a1 + 16) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(_OWORD *)(a1 + 48) = v9;
  return result;
}

double sub_1DADB5388@<D0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6833B0);
  sub_1DADF65E0();
  double result = v5;
  *(unsigned char *)a1 = v3;
  *(unsigned char *)(a1 + 1) = v4;
  *(double *)(a1 + 8) = v5;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = v7;
  *(void *)(a1 + 48) = v8;
  return result;
}

uint64_t sub_1DADB5424()
{
  return sub_1DADF65F0();
}

void (*sub_1DADB54AC(void *a1))(uint64_t a1, char a2)
{
  char v3 = malloc(0xF8uLL);
  *a1 = v3;
  char v4 = *(unsigned char *)(v1 + 16);
  v3[240] = v4;
  char v5 = *(unsigned char *)(v1 + 17);
  v3[241] = v5;
  uint64_t v6 = *(void *)(v1 + 24);
  *((void *)v3 + 22) = v6;
  uint64_t v7 = *(void *)(v1 + 32);
  uint64_t v8 = *(void *)(v1 + 40);
  *((void *)v3 + 23) = v7;
  *((void *)v3 + 24) = v8;
  uint64_t v9 = *(void *)(v1 + 48);
  uint64_t v10 = *(void *)(v1 + 56);
  *((void *)v3 + 25) = v9;
  *((void *)v3 + 26) = v10;
  uint64_t v12 = *(void *)(v1 + 64);
  uint64_t v11 = *(void *)(v1 + 72);
  *((void *)v3 + 27) = v12;
  *((void *)v3 + 28) = v11;
  *char v3 = v4;
  v3[1] = v5;
  *((void *)v3 + 1) = v6;
  *((void *)v3 + 2) = v7;
  *((void *)v3 + 3) = v8;
  *((void *)v3 + 4) = v9;
  *((void *)v3 + 5) = v10;
  *((void *)v3 + 6) = v12;
  *((void *)v3 + 7) = v11;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  *((void *)v3 + 29) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6833B0);
  sub_1DADF65E0();
  return sub_1DADB5594;
}

void sub_1DADB5594(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  char v3 = *(unsigned char *)(*(void *)a1 + 64);
  char v4 = *(unsigned char *)(*(void *)a1 + 65);
  uint64_t v5 = *(void *)(*(void *)a1 + 72);
  uint64_t v6 = *(void *)(*(void *)a1 + 80);
  uint64_t v7 = *(void *)(*(void *)a1 + 88);
  uint64_t v8 = *(void *)(*(void *)a1 + 96);
  uint64_t v9 = *(void *)(*(void *)a1 + 104);
  uint64_t v10 = *(void *)(*(void *)a1 + 112);
  uint64_t v11 = v2[28];
  uint64_t v13 = v2[26];
  uint64_t v12 = v2[27];
  uint64_t v15 = v2[24];
  uint64_t v14 = v2[25];
  uint64_t v16 = v2[23];
  uint64_t v17 = v2[22];
  char v18 = *((unsigned char *)v2 + 241);
  char v19 = *((unsigned char *)v2 + 240);
  *((unsigned char *)v2 + 120) = v3;
  *(unsigned char *)uint64_t v2 = v19;
  *((unsigned char *)v2 + 1) = v18;
  v2[1] = v17;
  v2[2] = v16;
  v2[3] = v15;
  v2[4] = v14;
  v2[5] = v13;
  v2[6] = v12;
  v2[7] = v11;
  *((unsigned char *)v2 + 121) = v4;
  v2[16] = v5;
  v2[17] = v6;
  v2[18] = v7;
  v2[19] = v8;
  v2[20] = v9;
  v2[21] = v10;
  if (a2)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1DADF65F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1DADF65F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  swift_release();

  free(v2);
}

double sub_1DADB56DC@<D0>(uint64_t a1@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6833B0);
  sub_1DADF6600();
  double result = v7;
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  *(unsigned char *)(a1 + 17) = v6;
  *(double *)(a1 + 24) = v7;
  *(_OWORD *)(a1 + 32) = v8;
  *(_OWORD *)(a1 + 48) = v9;
  *(void *)(a1 + 64) = v10;
  return result;
}

id sub_1DADB5780()
{
  unint64_t v0 = (void *)*sub_1DADDB6D0();

  return v0;
}

double BatteryArchivableView.init()@<D0>(uint64_t a1@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  id v3 = (id)*sub_1DADDB6D0();
  sub_1DADA6784(0, 2, (uint64_t)v11);
  sub_1DADF65D0();
  char v4 = v11[56];
  char v5 = v11[57];
  double result = v12;
  long long v7 = v13;
  uint64_t v8 = v14;
  uint64_t v9 = v15;
  long long v10 = v16;
  *(void *)a1 = KeyPath;
  *(unsigned char *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 17) = v5;
  *(double *)(a1 + 24) = result;
  *(_OWORD *)(a1 + 32) = v7;
  *(void *)(a1 + 48) = v8;
  *(void *)(a1 + 56) = v9;
  *(_OWORD *)(a1 + 64) = v10;
  *(void *)(a1 + 80) = v3;
  return result;
}

__n128 BatteryArchivableView.init(from:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  id v5 = (id)*sub_1DADDB6D0();
  sub_1DADA6784(0, 2, (uint64_t)v14);
  sub_1DADF65D0();
  char v6 = v14[56];
  char v7 = v14[57];
  uint64_t v8 = v15;
  __n128 v12 = v17;
  long long v13 = v16;
  uint64_t v9 = v18;
  uint64_t v10 = v19;
  __swift_destroy_boxed_opaque_existential_0(a1);
  *(void *)a2 = KeyPath;
  *(unsigned char *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = v6;
  *(unsigned char *)(a2 + 17) = v7;
  *(void *)(a2 + 24) = v8;
  __n128 result = v12;
  *(_OWORD *)(a2 + 32) = v13;
  *(__n128 *)(a2 + 48) = v12;
  *(void *)(a2 + 64) = v9;
  *(void *)(a2 + 72) = v10;
  *(void *)(a2 + 80) = v5;
  return result;
}

uint64_t BatteryArchivableView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BD8);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v49 = &v40[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682650);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v52 = &v40[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v8 = v1[3];
  long long v57 = v1[2];
  long long v58 = v8;
  long long v59 = v1[4];
  uint64_t v60 = *((void *)v1 + 10);
  long long v9 = v1[1];
  long long v55 = *v1;
  long long v56 = v9;
  uint64_t v10 = sub_1DADF66D0();
  uint64_t v50 = v11;
  uint64_t v51 = v10;
  __n128 v12 = (void *)v55;
  char v13 = BYTE8(v55);
  sub_1DADB6354((uint64_t)&v55);
  sub_1DADB63C4(v12, v13);
  uint64_t v14 = (void *)sub_1DADBAA78(v12, v13);
  sub_1DADB6340(v12, v13);
  sub_1DADBE234((uint64_t)&v55);
  uint64_t v53 = v6;
  uint64_t v54 = v5;
  if (v14 && (id v15 = objc_msgSend(v14, sel_family), v14, v15 == (id)10))
  {
    *(_OWORD *)id v66 = v56;
    *(_OWORD *)&v66[16] = v57;
    long long v67 = v58;
    long long v68 = v59;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6833B0);
    sub_1DADF65E0();
    uint64_t v16 = 256;
    if (!v69[1]) {
      uint64_t v16 = 0;
    }
    *(_OWORD *)&v66[8] = *(_OWORD *)&v69[8];
    *(void *)id v66 = v16 | v69[0];
    *(void *)&v66[24] = *(void *)&v69[24];
    long long v67 = *(_OWORD *)&v69[32];
    *(void *)&long long v68 = *(void *)&v69[48];
    BYTE8(v68) = 0;
  }
  else
  {
    sub_1DADB6354((uint64_t)&v55);
    sub_1DADB63C4(v12, v13);
    __n128 v17 = (void *)sub_1DADBAA78(v12, v13);
    sub_1DADB6340(v12, v13);
    sub_1DADBE234((uint64_t)&v55);
    if (!v17 || (id v18 = objc_msgSend(v17, sel_family), v17, v18 != (id)11))
    {
      memset(v69, 0, 57);
      v69[57] = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8580);
      sub_1DADBE2F0();
      sub_1DADF6140();
      goto LABEL_13;
    }
    *(_OWORD *)id v66 = v56;
    *(_OWORD *)&v66[16] = v57;
    long long v67 = v58;
    long long v68 = v59;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6833B0);
    sub_1DADF65E0();
    uint64_t v19 = 256;
    if (!v69[1]) {
      uint64_t v19 = 0;
    }
    *(_OWORD *)&v66[8] = *(_OWORD *)&v69[8];
    *(void *)id v66 = v19 | v69[0];
    *(void *)&v66[24] = *(void *)&v69[24];
    long long v67 = *(_OWORD *)&v69[32];
    *(void *)&long long v68 = *(void *)&v69[48];
    BYTE8(v68) = 1;
  }
  sub_1DADBE36C();
  sub_1DADBE3C0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1DADF6140();
  *(_OWORD *)uint64_t v69 = v61;
  *(_OWORD *)&v69[16] = v62;
  *(_OWORD *)&v69[32] = v63;
  *(void *)&v69[48] = v64;
  *(_WORD *)&v69[56] = v65;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8580);
  sub_1DADBE2F0();
  sub_1DADF6140();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
LABEL_13:
  uint64_t v47 = *(void *)&v66[8];
  uint64_t v48 = *(void *)v66;
  uint64_t v45 = *(void *)&v66[24];
  uint64_t v46 = *(void *)&v66[16];
  uint64_t v43 = *((void *)&v67 + 1);
  uint64_t v44 = v67;
  uint64_t v42 = v68;
  int v41 = BYTE8(v68);
  char v20 = BYTE9(v68);
  uint64_t v21 = swift_allocObject();
  long long v22 = v58;
  *(_OWORD *)(v21 + 48) = v57;
  *(_OWORD *)(v21 + 64) = v22;
  *(_OWORD *)(v21 + 80) = v59;
  uint64_t v23 = v60;
  *(void *)(v21 + 96) = v60;
  long long v24 = v56;
  *(_OWORD *)(v21 + 16) = v55;
  *(_OWORD *)(v21 + 32) = v24;
  *(void *)id v66 = *(void *)(v23 + OBJC_IVAR____TtC15BatteryCenterUI21BatteryCenterObserver_subject);
  sub_1DADA73E8(0, (unint64_t *)&qword_1EB683690);
  sub_1DADB6354((uint64_t)&v55);
  swift_retain();
  *(void *)uint64_t v69 = sub_1DADF6A40();
  uint64_t v25 = sub_1DADF6A20();
  uint64_t v26 = (uint64_t)v49;
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v49, 1, 1, v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6835B0);
  sub_1DADAD660(&qword_1EB682658, &qword_1EB6835B0);
  sub_1DADB63D0();
  long long v27 = v52;
  sub_1DADF5B90();
  sub_1DADADF3C(v26, &qword_1EB682BD8);

  swift_release();
  uint64_t v28 = swift_allocObject();
  long long v29 = v58;
  *(_OWORD *)(v28 + 48) = v57;
  *(_OWORD *)(v28 + 64) = v29;
  *(_OWORD *)(v28 + 80) = v59;
  *(void *)(v28 + 96) = v60;
  long long v30 = v56;
  *(_OWORD *)(v28 + 16) = v55;
  *(_OWORD *)(v28 + 32) = v30;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8570);
  uint64_t v33 = v53;
  uint64_t v32 = v54;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v53 + 16))(a1 + *(int *)(v31 + 52), v27, v54);
  uint64_t v34 = v50;
  *(void *)a1 = v51;
  *(void *)(a1 + 8) = v34;
  uint64_t v35 = v47;
  *(void *)(a1 + 16) = v48;
  *(void *)(a1 + 24) = v35;
  uint64_t v36 = v45;
  *(void *)(a1 + 32) = v46;
  *(void *)(a1 + 40) = v36;
  uint64_t v37 = v43;
  *(void *)(a1 + 48) = v44;
  *(void *)(a1 + 56) = v37;
  *(void *)(a1 + 64) = v42;
  *(unsigned char *)(a1 + 72) = v41;
  *(unsigned char *)(a1 + 73) = v20;
  *(void *)(a1 + 80) = sub_1DADB634C;
  *(void *)(a1 + 88) = v21;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  long long v38 = (uint64_t (**)(uint64_t *))(a1 + *(int *)(v31 + 56));
  *long long v38 = sub_1DADB71C0;
  v38[1] = (uint64_t (*)(uint64_t *))v28;
  sub_1DADB6354((uint64_t)&v55);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v33 + 8))(v27, v32);
}

double sub_1DADB5FC0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result = *(double *)(a1 + 8);
  long long v3 = *(_OWORD *)(a1 + 16);
  long long v4 = *(_OWORD *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  char v6 = *(unsigned char *)(a1 + 1) & 1;
  *(unsigned char *)a2 = *(unsigned char *)a1 & 1;
  *(unsigned char *)(a2 + 1) = v6;
  *(double *)(a2 + 8) = result;
  *(_OWORD *)(a2 + 16) = v3;
  *(_OWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 48) = v5;
  return result;
}

uint64_t sub_1DADB5FF4(uint64_t a1)
{
  uint64_t v2 = sub_1DADF5AD0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v6 = *(_OWORD *)(a1 + 48);
  long long v33 = *(_OWORD *)(a1 + 32);
  long long v34 = v6;
  long long v35 = *(_OWORD *)(a1 + 64);
  uint64_t v36 = *(void *)(a1 + 80);
  long long v7 = *(_OWORD *)(a1 + 16);
  long long v31 = *(_OWORD *)a1;
  long long v32 = v7;
  sub_1DADB6354(a1);
  sub_1DADF5B00();
  sub_1DADB6438(v27, (uint64_t)v37);
  swift_bridgeObjectRelease();
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v31 = *(_OWORD *)(a1 + 16);
  long long v32 = v8;
  long long v9 = *(_OWORD *)(a1 + 64);
  long long v11 = *(_OWORD *)(a1 + 16);
  long long v10 = *(_OWORD *)(a1 + 32);
  long long v33 = *(_OWORD *)(a1 + 48);
  long long v34 = v9;
  long long v27 = v11;
  long long v28 = v10;
  long long v12 = *(_OWORD *)(a1 + 64);
  long long v29 = *(_OWORD *)(a1 + 48);
  long long v30 = v12;
  v39[0] = v37[0];
  v39[1] = v37[1];
  v39[2] = v37[2];
  uint64_t v40 = v38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6833B0);
  sub_1DADF65F0();
  sub_1DADBE234(a1);
  uint64_t v13 = sub_1DADF08BC();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v13, v2);
  sub_1DADB6354(a1);
  sub_1DADB6354(a1);
  uint64_t v14 = sub_1DADF5AB0();
  os_log_type_t v15 = sub_1DADF6A00();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v25 = v3;
    uint64_t v26 = v17;
    uint64_t v18 = v17;
    uint64_t v24 = v2;
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v23 = v16 + 4;
    long long v27 = v31;
    long long v28 = v32;
    long long v29 = v33;
    long long v30 = v34;
    sub_1DADF65E0();
    uint64_t v19 = sub_1DADA7238();
    unint64_t v21 = v20;
    sub_1DADBE2A4((uint64_t)v39);
    *(void *)&long long v27 = sub_1DADA5DB0(v19, v21, &v26);
    sub_1DADF6A90();
    swift_bridgeObjectRelease();
    sub_1DADBE234(a1);
    sub_1DADBE234(a1);
    _os_log_impl(&dword_1DAD96000, v14, v15, "View | Intent to be displayed on appear: %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E01829D0](v18, -1, -1);
    MEMORY[0x1E01829D0](v16, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v5, v24);
  }
  else
  {
    sub_1DADBE234(a1);
    sub_1DADBE234(a1);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

void sub_1DADB6340(id a1, char a2)
{
  if (a2) {

  }
  else {
    swift_release();
  }
}

uint64_t sub_1DADB634C()
{
  return sub_1DADB5FF4(v0 + 16);
}

uint64_t sub_1DADB6354(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 80);
  sub_1DADB63C4(*(id *)a1, *(unsigned char *)(a1 + 8));
  swift_retain();
  id v3 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

id sub_1DADB63C4(id a1, char a2)
{
  if (a2) {
    return a1;
  }
  else {
    return (id)swift_retain();
  }
}

unint64_t sub_1DADB63D0()
{
  unint64_t result = qword_1EB682BE0;
  if (!qword_1EB682BE0)
  {
    sub_1DADA73E8(255, (unint64_t *)&qword_1EB683690);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB682BE0);
  }
  return result;
}

__n128 sub_1DADB6438@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v108 = a1;
  uint64_t v4 = sub_1DADF5AD0();
  uint64_t v109 = *(void *)(v4 - 8);
  uint64_t v110 = v4;
  uint64_t v5 = MEMORY[0x1F4188790](v4);
  uint64_t v105 = (void *)((char *)v95 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v106 = (char *)v95 - v8;
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  char v107 = (char *)v95 - v10;
  MEMORY[0x1F4188790](v9);
  long long v12 = (char *)v95 - v11;
  uint64_t v13 = *(void **)v2;
  char v14 = *(unsigned char *)(v2 + 8);
  os_log_type_t v15 = *(void **)(v2 + 80);
  sub_1DADB63C4(v13, v14);
  swift_retain();
  id v16 = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1DADB63C4(v13, v14);
  uint64_t v17 = (void *)sub_1DADBAA78(v13, v14);
  sub_1DADB6340(v13, v14);
  sub_1DADB6340(v13, v14);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v17) {
    goto LABEL_11;
  }
  id v18 = objc_msgSend(v17, sel_intent);

  if (!v18) {
    goto LABEL_11;
  }
  id v19 = (id)INTypedIntentWithIntent();
  if (!v19)
  {
LABEL_10:

LABEL_11:
    sub_1DADA6784(0, 2, (uint64_t)v112);
    goto LABEL_12;
  }
  unint64_t v20 = v19;
  self;
  uint64_t v21 = swift_dynamicCastObjCClass();
  if (!v21)
  {

    goto LABEL_10;
  }
  long long v22 = (void *)v21;
  uint64_t v23 = sub_1DADF08BC();
  uint64_t v25 = v109;
  uint64_t v24 = v110;
  uint64_t v27 = v109 + 16;
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v109 + 16);
  uint64_t v103 = v23;
  uint64_t v104 = v26;
  ((void (*)(char *))v26)(v12);
  id v28 = v18;
  id v29 = v20;
  id v30 = v28;
  id v31 = v29;
  long long v32 = sub_1DADF5AB0();
  LODWORD(v101) = sub_1DADF69D0();
  BOOL v33 = os_log_type_enabled(v32, (os_log_type_t)v101);
  long long v34 = &selRef_CGColor;
  id v102 = v31;
  if (v33)
  {
    uint64_t v98 = v32;
    uint64_t v99 = v27;
    uint64_t v35 = swift_slowAlloc();
    uint64_t v96 = (void *)swift_slowAlloc();
    uint64_t v97 = swift_slowAlloc();
    v112[0] = v97;
    *(_DWORD *)uint64_t v35 = 136315394;
    id v100 = (id)(v35 + 4);
    id v36 = objc_msgSend(v30, sel__dictionaryRepresentation);
    uint64_t v37 = MEMORY[0x1E4FBC840] + 8;
    sub_1DADF67D0();

    v95[1] = v37;
    uint64_t v38 = sub_1DADF67E0();
    unint64_t v40 = v39;
    swift_bridgeObjectRelease();
    unint64_t v111 = sub_1DADA5DB0(v38, v40, v112);
    sub_1DADF6A90();

    id v100 = v30;
    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 12) = 2112;
    id v41 = objc_msgSend(v22, sel_automatic);
    if (!v41)
    {
      sub_1DADA73E8(0, qword_1EB6833B8);
      id v41 = (id)sub_1DADF6A70();
    }
    unint64_t v111 = (unint64_t)v41;
    sub_1DADF6A90();
    uint64_t v42 = v96;
    *uint64_t v96 = v41;
    id v31 = v102;

    uint64_t v43 = (uint8_t *)v98;
    _os_log_impl(&dword_1DAD96000, v98, (os_log_type_t)v101, "_findMatchingBatteryDevice| intent:  %s, isAutomatic: %@", (uint8_t *)v35, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F85F0);
    swift_arrayDestroy();
    MEMORY[0x1E01829D0](v42, -1, -1);
    uint64_t v44 = v97;
    swift_arrayDestroy();
    MEMORY[0x1E01829D0](v44, -1, -1);
    MEMORY[0x1E01829D0](v35, -1, -1);

    uint64_t v24 = v110;
    uint64_t v45 = *(void (**)(char *, uint64_t))(v109 + 8);
    v45(v12, v110);
    id v30 = v100;
    long long v34 = &selRef_CGColor;
  }
  else
  {

    uint64_t v45 = *(void (**)(char *, uint64_t))(v25 + 8);
    v45(v12, v24);
  }
  id v51 = [v22 v34[331]];
  if (v51)
  {
    uint64_t v52 = v51;
    if (objc_msgSend(v51, sel_BOOLValue))
    {
      uint64_t v53 = (void *)sub_1DADB71C8(v108);
      if (v53) {
        char v54 = 0;
      }
      else {
        char v54 = 2;
      }
      sub_1DADA6784(v53, v54, (uint64_t)v112);

      goto LABEL_12;
    }
  }
  long long v55 = objc_msgSend(v22, sel_device);
  if (v55)
  {
    uint64_t v105 = v55;
    long long v56 = v107;
    v104(v107, v103, v24);
    long long v57 = (char *)v30;
    long long v58 = sub_1DADF5AB0();
    os_log_type_t v59 = sub_1DADF69D0();
    int v60 = v59;
    BOOL v61 = os_log_type_enabled(v58, v59);
    uint64_t v101 = v45;
    if (v61)
    {
      uint64_t v62 = swift_slowAlloc();
      LODWORD(v100) = v60;
      long long v63 = (uint8_t *)v62;
      uint64_t v99 = swift_slowAlloc();
      v112[0] = v99;
      uint64_t v98 = v63;
      *(_DWORD *)long long v63 = 136315138;
      uint64_t v97 = (uint64_t)(v63 + 4);
      id v64 = objc_msgSend(v57, sel__dictionaryRepresentation);
      sub_1DADF67D0();

      uint64_t v65 = sub_1DADF67E0();
      unint64_t v67 = v66;
      swift_bridgeObjectRelease();
      uint64_t v68 = v65;
      uint64_t v45 = v101;
      unint64_t v111 = sub_1DADA5DB0(v68, v67, v112);
      sub_1DADF6A90();

      uint64_t v24 = v110;
      swift_bridgeObjectRelease();
      uint64_t v69 = v98;
      _os_log_impl(&dword_1DAD96000, v58, (os_log_type_t)v100, "_findMatchingBatteryDevice| intent:  %s", (uint8_t *)v98, 0xCu);
      uint64_t v70 = v99;
      swift_arrayDestroy();
      MEMORY[0x1E01829D0](v70, -1, -1);
      MEMORY[0x1E01829D0](v69, -1, -1);

      uint64_t v71 = v107;
    }
    else
    {

      uint64_t v71 = v56;
    }
    v45(v71, v24);
    uint64_t v79 = v105;
    uint64_t v80 = v106;
    v104(v106, v103, v24);
    long long v81 = v79;
    unint64_t v82 = v79;
    uint64_t v83 = sub_1DADF5AB0();
    os_log_type_t v84 = sub_1DADF69D0();
    if (os_log_type_enabled(v83, v84))
    {
      uint64_t v85 = (uint8_t *)swift_slowAlloc();
      uint64_t v105 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v85 = 138412290;
      v112[0] = (uint64_t)v81;
      unint64_t v86 = v82;
      uint64_t v87 = v81;
      char v107 = v57;
      uint64_t v88 = v87;
      uint64_t v24 = v110;
      sub_1DADF6A90();
      uint64_t v89 = v105;
      *uint64_t v105 = v86;

      long long v57 = v107;
      _os_log_impl(&dword_1DAD96000, v83, v84, "_findMatchingBatteryDevice| usersDevices: %@", v85, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F85F0);
      swift_arrayDestroy();
      MEMORY[0x1E01829D0](v89, -1, -1);
      uint64_t v90 = v85;
      uint64_t v80 = v106;
      MEMORY[0x1E01829D0](v90, -1, -1);
    }
    else
    {

      uint64_t v83 = v81;
    }
    unint64_t v91 = v108;
    id v92 = v102;

    v101(v80, v24);
    uint64_t v93 = sub_1DADB7520(v81, v91);
    sub_1DADA6784(v93, v94, (uint64_t)v112);
  }
  else
  {
    uint64_t v72 = v30;
    uint64_t v73 = (char *)v105;
    v104((char *)v105, v103, v24);
    uint64_t v74 = sub_1DADF5AB0();
    os_log_type_t v75 = sub_1DADF69D0();
    if (os_log_type_enabled(v74, v75))
    {
      uint64_t v76 = v45;
      uint64_t v77 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v77 = 0;
      _os_log_impl(&dword_1DAD96000, v74, v75, "_findMatchingBatteryDevice| error", v77, 2u);
      uint64_t v78 = v77;
      uint64_t v45 = v76;
      MEMORY[0x1E01829D0](v78, -1, -1);
    }

    v45(v73, v24);
    sub_1DADA6784(0, 2, (uint64_t)v112);
  }
LABEL_12:
  uint64_t v46 = v115;
  long long v48 = v113;
  __n128 result = v114;
  uint64_t v49 = v112[1];
  char v50 = BYTE1(v112[0]);
  *(unsigned char *)a2 = v112[0];
  *(unsigned char *)(a2 + 1) = v50;
  *(void *)(a2 + 8) = v49;
  *(_OWORD *)(a2 + 16) = v48;
  *(__n128 *)(a2 + 32) = result;
  *(void *)(a2 + 48) = v46;
  return result;
}

uint64_t sub_1DADB6E80(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = sub_1DADF5AD0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  long long v9 = *(_OWORD *)(a2 + 48);
  long long v35 = *(_OWORD *)(a2 + 32);
  long long v36 = v9;
  long long v37 = *(_OWORD *)(a2 + 64);
  uint64_t v38 = *(void *)(a2 + 80);
  long long v10 = *(_OWORD *)(a2 + 16);
  long long v33 = *(_OWORD *)a2;
  long long v34 = v10;
  sub_1DADB6354(a2);
  sub_1DADB6438(v8, (uint64_t)v39);
  long long v11 = *(_OWORD *)(a2 + 32);
  long long v33 = *(_OWORD *)(a2 + 16);
  long long v34 = v11;
  long long v12 = *(_OWORD *)(a2 + 64);
  long long v14 = *(_OWORD *)(a2 + 16);
  long long v13 = *(_OWORD *)(a2 + 32);
  long long v35 = *(_OWORD *)(a2 + 48);
  long long v36 = v12;
  long long v29 = v14;
  long long v30 = v13;
  long long v15 = *(_OWORD *)(a2 + 64);
  long long v31 = *(_OWORD *)(a2 + 48);
  long long v32 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6833B0);
  sub_1DADF65F0();
  sub_1DADBE234(a2);
  uint64_t v16 = sub_1DADF08BC();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v16, v4);
  sub_1DADB6354(a2);
  sub_1DADB6354(a2);
  uint64_t v17 = sub_1DADF5AB0();
  os_log_type_t v18 = sub_1DADF69D0();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v27 = v4;
    unint64_t v20 = (uint8_t *)v19;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v28 = v21;
    *(_DWORD *)unint64_t v20 = 136315138;
    v26[1] = v20 + 4;
    long long v29 = v33;
    long long v30 = v34;
    long long v31 = v35;
    long long v32 = v36;
    sub_1DADF65E0();
    uint64_t v22 = sub_1DADA7238();
    unint64_t v24 = v23;
    sub_1DADBE2A4((uint64_t)v39);
    *(void *)&long long v29 = sub_1DADA5DB0(v22, v24, &v28);
    sub_1DADF6A90();
    swift_bridgeObjectRelease();
    sub_1DADBE234(a2);
    sub_1DADBE234(a2);
    _os_log_impl(&dword_1DAD96000, v17, v18, "View | Intent to be displayed on receive: %s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E01829D0](v21, -1, -1);
    MEMORY[0x1E01829D0](v20, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v27);
  }
  else
  {
    sub_1DADBE234(a2);
    sub_1DADBE234(a2);

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_1DADB71C0(uint64_t *a1)
{
  return sub_1DADB6E80(a1, v1 + 16);
}

uint64_t sub_1DADB71C8(uint64_t a1)
{
  uint64_t v2 = sub_1DADF5AD0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 < 0 || (a1 & 0x4000000000000000) != 0)
  {
    unint64_t v22 = swift_bridgeObjectRetain();
    uint64_t v6 = (uint64_t)sub_1DADBAC98(v22);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  v26[0] = v6;
  sub_1DADB7AA0(v26);
  unint64_t v27 = v26[0];
  sub_1DADB7A18(&v27);
  uint64_t v7 = sub_1DADF08BC();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
  uint64_t v8 = sub_1DADF5AB0();
  os_log_type_t v9 = sub_1DADF69D0();
  if (os_log_type_enabled(v8, v9))
  {
    long long v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v24 = v2;
    uint64_t v12 = v11;
    v26[0] = v11;
    *(_DWORD *)long long v10 = 136315138;
    v23[1] = v10 + 4;
    swift_beginAccess();
    uint64_t v13 = sub_1DADA73E8(0, &qword_1EB683680);
    uint64_t v14 = swift_bridgeObjectRetain();
    uint64_t v15 = MEMORY[0x1E0181DA0](v14, v13);
    unint64_t v17 = v16;
    swift_bridgeObjectRelease();
    unint64_t v25 = sub_1DADA5DB0(v15, v17, v26);
    sub_1DADF6A90();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1DAD96000, v8, v9, "smartChoice| sortedDevices: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E01829D0](v12, -1, -1);
    MEMORY[0x1E01829D0](v10, -1, -1);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v24);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  swift_beginAccess();
  unint64_t v18 = v27;
  if (v27 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_1DADF6B30();
    if (!v19) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v19 = *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v19)
    {
LABEL_13:
      swift_bridgeObjectRelease_n();
      return v19;
    }
  }
  if ((v18 & 0xC000000000000001) != 0)
  {
    id v20 = (id)MEMORY[0x1E0181F60](0, v18);
    goto LABEL_12;
  }
  if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v20 = *(id *)(v18 + 32);
LABEL_12:
    uint64_t v19 = (uint64_t)v20;
    goto LABEL_13;
  }
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

void *sub_1DADB7520(void *a1, unint64_t a2)
{
  id v4 = objc_msgSend(a1, sel_isInternal);
  if (v4 && (uint64_t v5 = v4, v6 = objc_msgSend(v4, sel_BOOLValue), v5, v6))
  {
    if (a2 >> 62) {
      goto LABEL_19;
    }
    uint64_t v7 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v7; uint64_t v7 = sub_1DADF6B30())
    {
      uint64_t v8 = 4;
      while (1)
      {
        id v9 = (a2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1E0181F60](v8 - 4, a2) : *(id *)(a2 + 8 * v8);
        long long v10 = v9;
        uint64_t v11 = v8 - 3;
        if (__OFADD__(v8 - 4, 1)) {
          break;
        }
        if (objc_msgSend(v9, sel_isInternal))
        {
          swift_bridgeObjectRelease();
          return v10;
        }

        ++v8;
        if (v11 == v7) {
          goto LABEL_12;
        }
      }
      __break(1u);
LABEL_19:
      swift_bridgeObjectRetain();
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    uint64_t v12 = sub_1DADB7678(a1, a2);
    if (v12)
    {
      return v12;
    }
    else
    {
      id v13 = a1;
      return a1;
    }
  }
}

void *sub_1DADB7678(void *a1, unint64_t a2)
{
  uint64_t v4 = sub_1DADF5AD0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  long long v10 = (char *)&v35 - v9;
  id v11 = objc_msgSend(a1, sel_isSynthesized);
  if (v11)
  {
    uint64_t v12 = v11;
    unsigned int v13 = objc_msgSend(v11, sel_BOOLValue);

    if (v13)
    {
      if ((a2 & 0x8000000000000000) != 0 || (a2 & 0x4000000000000000) != 0)
      {
        unint64_t v34 = swift_bridgeObjectRetain();
        uint64_t v14 = (uint64_t)sub_1DADBAC98(v34);
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v14 = a2 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain();
      }
      long long v36 = (id *)v14;
      sub_1DADB7AA0((uint64_t *)&v36);
      uint64_t v15 = v36;
      id v16 = a1;
      unint64_t v17 = sub_1DADBCC1C(v15, v16);
LABEL_16:
      uint64_t v26 = v17;
      swift_release();

      return v26;
    }
  }
  id v18 = objc_msgSend(a1, sel_parts);
  if (!v18)
  {
LABEL_10:
    uint64_t v20 = sub_1DADF08BC();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v20, v4);
    uint64_t v21 = sub_1DADF5AB0();
    os_log_type_t v22 = sub_1DADF69D0();
    if (os_log_type_enabled(v21, v22))
    {
      unint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v23 = 0;
      _os_log_impl(&dword_1DAD96000, v21, v22, "findDeviceIfConnected| Not Headphone Case", v23, 2u);
      MEMORY[0x1E01829D0](v23, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    if ((a2 & 0x8000000000000000) != 0 || (a2 & 0x4000000000000000) != 0)
    {
      unint64_t v33 = swift_bridgeObjectRetain();
      uint64_t v24 = (uint64_t)sub_1DADBAC98(v33);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v24 = a2 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
    }
    long long v36 = (id *)v24;
    sub_1DADB7AA0((uint64_t *)&v36);
    unint64_t v25 = (unint64_t)v36;
    id v16 = a1;
    unint64_t v17 = sub_1DADBD074(v25, v16);
    goto LABEL_16;
  }
  uint64_t v19 = v18;
  if ((sub_1DADF69B0() & 4) == 0)
  {

    goto LABEL_10;
  }
  uint64_t v27 = sub_1DADF08BC();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v27, v4);
  uint64_t v28 = sub_1DADF5AB0();
  os_log_type_t v29 = sub_1DADF69D0();
  if (os_log_type_enabled(v28, v29))
  {
    long long v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v30 = 0;
    _os_log_impl(&dword_1DAD96000, v28, v29, "findDeviceIfConnected| Headphone Case", v30, 2u);
    MEMORY[0x1E01829D0](v30, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  id v31 = a1;
  uint64_t v26 = sub_1DADBCE34(a2, v31);

  return v26;
}

uint64_t sub_1DADB7A18(unint64_t *a1)
{
  unint64_t v2 = *a1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *a1 = v2;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v2 & 0x8000000000000000) != 0
    || (v2 & 0x4000000000000000) != 0)
  {
    sub_1DADBC958(v2);
    unint64_t v2 = v4;
    *a1 = v4;
  }
  uint64_t v5 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v7[0] = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  v7[1] = v5;
  sub_1DADBAD90(v7);
  return sub_1DADF6930();
}

uint64_t sub_1DADB7AA0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    sub_1DADBCC08();
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_1DADBB4F4(v6);
  return sub_1DADF6B10();
}

uint64_t sub_1DADB7B1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1DADBDC08();

  return MEMORY[0x1F40F8CC0](a1, a2, a3, v6);
}

uint64_t sub_1DADB7B80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1DADBDC08();

  return MEMORY[0x1F40F8CC8](a1, a2, a3, v6);
}

uint64_t sub_1DADB7BE4()
{
  return sub_1DADF5E00();
}

__n128 sub_1DADB7C30@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t KeyPath = swift_getKeyPath();
  id v5 = (id)*sub_1DADDB6D0();
  sub_1DADA6784(0, 2, (uint64_t)v14);
  sub_1DADF65D0();
  char v6 = v14[56];
  char v7 = v14[57];
  uint64_t v8 = v15;
  __n128 v12 = v17;
  long long v13 = v16;
  uint64_t v9 = v18;
  uint64_t v10 = v19;
  __swift_destroy_boxed_opaque_existential_0(a1);
  *(void *)a2 = KeyPath;
  *(unsigned char *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = v6;
  *(unsigned char *)(a2 + 17) = v7;
  *(void *)(a2 + 24) = v8;
  __n128 result = v12;
  *(_OWORD *)(a2 + 32) = v13;
  *(__n128 *)(a2 + 48) = v12;
  *(void *)(a2 + 64) = v9;
  *(void *)(a2 + 72) = v10;
  *(void *)(a2 + 80) = v5;
  return result;
}

uint64_t sub_1DADB7D1C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADBD2B4(v1, a1);
}

uint64_t sub_1DADB7D2C()
{
  uint64_t v1 = sub_1DADF61A0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8810);
  MEMORY[0x1F4188790](v5);
  char v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)char v7 = sub_1DADF6120();
  *((void *)v7 + 1) = 0;
  v7[16] = 0;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8818);
  sub_1DADB7EC8(v0, &v7[*(int *)(v8 + 44)]);
  sub_1DADF6190();
  sub_1DADAD660(&qword_1EA8F8820, &qword_1EA8F8810);
  sub_1DADF6400();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_1DADADF3C((uint64_t)v7, &qword_1EA8F8810);
}

uint64_t sub_1DADB7EC8@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  char v50 = a2;
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8850);
  MEMORY[0x1F4188790](v49);
  uint64_t v4 = (uint64_t *)&v43[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8858);
  uint64_t v6 = MEMORY[0x1F4188790](v5 - 8);
  uint64_t v8 = &v43[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v6);
  uint64_t v53 = &v43[-v9];
  uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8860);
  uint64_t v52 = *(void *)(v54 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v54);
  id v51 = &v43[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v10);
  long long v48 = &v43[-v12];
  uint64_t v56 = a1;
  uint64_t v55 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8868);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F85C8);
  sub_1DADBDFB0();
  sub_1DADBDD04();
  sub_1DADF6560();
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v57 = *(void *)(a1 + 32);
  uint64_t v58 = v13;
  sub_1DADBE16C();
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_1DADF6350();
  uint64_t v16 = v15;
  LOBYTE(v13) = v17 & 1;
  sub_1DADF62A0();
  uint64_t v18 = sub_1DADF6330();
  uint64_t v46 = v19;
  uint64_t v47 = v18;
  uint64_t v45 = v20;
  char v22 = v21;
  swift_release();
  int v44 = v22 & 1;
  sub_1DADBE1C0(v14, v16, v13);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  *uint64_t v4 = sub_1DADF66D0();
  v4[1] = v24;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8898);
  sub_1DADB8908(a1, (uint64_t *)((char *)v4 + *(int *)(v25 + 44)));
  sub_1DADAD660(&qword_1EA8F88A0, &qword_1EA8F8850);
  uint64_t v26 = (uint64_t)v8;
  sub_1DADF63E0();
  sub_1DADADF3C((uint64_t)v4, &qword_1EA8F8850);
  uint64_t v27 = v53;
  sub_1DADADF98((uint64_t)v8, (uint64_t)v53, &qword_1EA8F8858);
  uint64_t v28 = v51;
  os_log_type_t v29 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v52 + 16);
  long long v30 = v48;
  uint64_t v31 = v54;
  v29(v51, v48, v54);
  sub_1DADAE0AC((uint64_t)v27, v26, &qword_1EA8F8858);
  long long v32 = v50;
  v29(v50, v28, v31);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F88A8);
  unint64_t v34 = &v32[*(int *)(v33 + 48)];
  uint64_t v36 = v46;
  uint64_t v35 = v47;
  uint64_t v37 = v45;
  *(void *)unint64_t v34 = v47;
  *((void *)v34 + 1) = v37;
  char v38 = v44;
  v34[16] = v44;
  *((void *)v34 + 3) = v36;
  *((void *)v34 + 4) = KeyPath;
  *((void *)v34 + 5) = 1;
  v34[48] = 0;
  sub_1DADAE0AC(v26, (uint64_t)&v32[*(int *)(v33 + 64)], &qword_1EA8F8858);
  sub_1DADBE1D0(v35, v37, v38);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1DADADF3C((uint64_t)v53, &qword_1EA8F8858);
  unint64_t v39 = *(void (**)(unsigned char *, uint64_t))(v52 + 8);
  unint64_t v40 = v30;
  uint64_t v41 = v54;
  v39(v40, v54);
  sub_1DADADF3C(v26, &qword_1EA8F8858);
  sub_1DADBE1C0(v35, v37, v38);
  swift_release();
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(unsigned char *, uint64_t))v39)(v51, v41);
}

uint64_t sub_1DADB8360@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v53 = a2;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F88D8);
  MEMORY[0x1F4188790](v52);
  char v50 = (uint64_t *)((char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8590);
  MEMORY[0x1F4188790](v49);
  uint64_t v5 = (uint64_t *)((char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = sub_1DADF6530();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1DADF60A0();
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8890);
  MEMORY[0x1F4188790](v48);
  uint64_t v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8880);
  uint64_t v13 = MEMORY[0x1F4188790](v51);
  MEMORY[0x1F4188790](v13);
  char v16 = *a1;
  uint64_t v18 = *((void *)a1 + 2);
  uint64_t v17 = *((void *)a1 + 3);
  if (v16)
  {
    uint64_t v46 = v15;
    uint64_t v47 = (uint64_t)&v46 - v14;
    sub_1DADF6090();
    sub_1DADF6080();
    sub_1DADF6500();
    sub_1DADF6060();
    swift_release();
    sub_1DADF6080();
    sub_1DADF6070();
    sub_1DADF6080();
    sub_1DADF60C0();
    uint64_t v33 = sub_1DADF6340();
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    char v39 = v38 & 1;
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E4F3EC60], v6);
    uint64_t KeyPath = swift_getKeyPath();
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v5 + *(int *)(v49 + 28), v9, v6);
    *uint64_t v5 = KeyPath;
    sub_1DADAE0AC((uint64_t)v5, (uint64_t)&v12[*(int *)(v48 + 36)], &qword_1EA8F8590);
    *(void *)uint64_t v12 = v33;
    *((void *)v12 + 1) = v35;
    v12[16] = v39;
    *((void *)v12 + 3) = v37;
    sub_1DADBE1D0(v33, v35, v39);
    swift_bridgeObjectRetain();
    sub_1DADADF3C((uint64_t)v5, &qword_1EA8F8590);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    sub_1DADBE1C0(v33, v35, v39);
    swift_bridgeObjectRelease();
    uint64_t v41 = sub_1DADF6300();
    uint64_t v42 = swift_getKeyPath();
    uint64_t v43 = v46;
    sub_1DADAE0AC((uint64_t)v12, v46, &qword_1EA8F8890);
    int v44 = (uint64_t *)(v43 + *(int *)(v51 + 36));
    *int v44 = v42;
    v44[1] = v41;
    sub_1DADADF3C((uint64_t)v12, &qword_1EA8F8890);
    uint64_t v45 = v47;
    sub_1DADADF98(v43, v47, &qword_1EA8F8880);
    sub_1DADAE0AC(v45, (uint64_t)v50, &qword_1EA8F8880);
    swift_storeEnumTagMultiPayload();
    sub_1DADBE02C();
    sub_1DADF6140();
    return sub_1DADADF3C(v45, &qword_1EA8F8880);
  }
  else
  {
    uint64_t v54 = v18;
    uint64_t v55 = v17;
    sub_1DADBE16C();
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_1DADF6350();
    uint64_t v21 = v20;
    char v23 = v22 & 1;
    sub_1DADF6300();
    uint64_t v24 = sub_1DADF6330();
    uint64_t v26 = v25;
    char v28 = v27;
    uint64_t v30 = v29;
    swift_release();
    sub_1DADBE1C0(v19, v21, v23);
    swift_bridgeObjectRelease();
    uint64_t v31 = v50;
    *char v50 = v24;
    v31[1] = v26;
    *((unsigned char *)v31 + 16) = v28 & 1;
    v31[3] = v30;
    swift_storeEnumTagMultiPayload();
    sub_1DADBE02C();
    return sub_1DADF6140();
  }
}

uint64_t sub_1DADB8908@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F88B0);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v49 = v3;
  uint64_t v50 = v4;
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F88B8);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  uint64_t v48 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v46 = (char *)&v42 - v12;
  MEMORY[0x1F4188790](v11);
  uint64_t v51 = (char *)&v42 - v13;
  sub_1DADF60B0();
  uint64_t v14 = sub_1DADF6340();
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  sub_1DADF62A0();
  uint64_t v19 = sub_1DADF6330();
  uint64_t v43 = v20;
  uint64_t v44 = v19;
  char v22 = v21;
  uint64_t v45 = v23;
  swift_release();
  char v24 = v22 & 1;
  sub_1DADBE1C0(v14, v16, v18);
  swift_bridgeObjectRelease();
  double v25 = *(double *)(v47 + 8) / 100.0;
  if (v25 > 1.0) {
    double v25 = 1.0;
  }
  if (v25 < 0.0) {
    double v25 = 0.0;
  }
  double v53 = v25;
  char v54 = 0;
  uint64_t v52 = 0x3FF0000000000000;
  sub_1DADB2BCC();
  sub_1DADF5C40();
  sub_1DADAD660(&qword_1EA8F88C0, &qword_1EA8F88B0);
  sub_1DADBE1E0();
  uint64_t v26 = v46;
  uint64_t v27 = v49;
  sub_1DADF6390();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v6, v27);
  char v28 = v51;
  uint64_t v29 = v7;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v51, v26, v7);
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  uint64_t v31 = v48;
  long long v32 = v28;
  uint64_t v33 = v29;
  v30(v48, v32, v29);
  uint64_t v35 = v44;
  uint64_t v34 = v45;
  uint64_t v36 = a2;
  *a2 = v44;
  uint64_t v37 = v43;
  v36[1] = v43;
  LOBYTE(v29) = v24;
  *((unsigned char *)v36 + 16) = v24;
  v36[3] = v34;
  char v38 = v36;
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F88D0);
  v30((char *)v38 + *(int *)(v39 + 48), v31, v33);
  sub_1DADBE1D0(v35, v37, v29);
  unint64_t v40 = *(void (**)(char *, uint64_t))(v8 + 8);
  swift_bridgeObjectRetain();
  v40(v51, v33);
  v40(v31, v33);
  sub_1DADBE1C0(v35, v37, v29);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DADB8CF0()
{
  uint64_t v1 = sub_1DADF61A0();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8810);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v8 = *(_OWORD *)(v0 + 16);
  v11[0] = *(_OWORD *)v0;
  v11[1] = v8;
  v11[2] = *(_OWORD *)(v0 + 32);
  uint64_t v12 = *(void *)(v0 + 48);
  *(void *)uint64_t v7 = sub_1DADF6120();
  *((void *)v7 + 1) = 0;
  v7[16] = 0;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8818);
  sub_1DADB7EC8((uint64_t)v11, &v7[*(int *)(v9 + 44)]);
  sub_1DADF6190();
  sub_1DADAD660(&qword_1EA8F8820, &qword_1EA8F8810);
  sub_1DADF6400();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_1DADADF3C((uint64_t)v7, &qword_1EA8F8810);
}

__n128 sub_1DADB8EA4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  __n128 v7 = *(__n128 *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 16);
  uint64_t v3 = *(void *)(a1 + 48);
  char v4 = *(unsigned char *)a1 & 1;
  char v5 = *(unsigned char *)(a1 + 1) & 1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  *(unsigned char *)uint64_t v1 = v4;
  *(unsigned char *)(v1 + 1) = v5;
  *(void *)(v1 + 8) = v2;
  __n128 result = v7;
  *(_OWORD *)(v1 + 16) = v8;
  *(__n128 *)(v1 + 32) = v7;
  *(void *)(v1 + 48) = v3;
  return result;
}

uint64_t sub_1DADB8F3C@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v3 = swift_allocObject();
  long long v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v3 + 32) = v4;
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(v1 + 32);
  *(void *)(v3 + 64) = *(void *)(v1 + 48);
  *(_OWORD *)(v3 + 72) = xmmword_1DADF8C00;
  *a1 = sub_1DADBD314;
  a1[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v3;

  return sub_1DADBD320(v1);
}

uint64_t sub_1DADB8FBC@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F85D8);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (uint64_t *)((char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1DADF5D10();
  double v12 = v11;
  sub_1DADF5D10();
  double v14 = v13 * 0.1;
  *uint64_t v10 = sub_1DADF66D0();
  v10[1] = v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8508);
  sub_1DADB90F4(a1, (char *)v10 + *(int *)(v16 + 44), a3, a4, v12 * 0.4925, v14);
  sub_1DADAE0AC((uint64_t)v10, a2, &qword_1EA8F85D8);
  return sub_1DADADF3C((uint64_t)v10, &qword_1EA8F85D8);
}

uint64_t sub_1DADB90F4@<X0>(uint64_t *a1@<X0>, char *a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D4>, double a6@<D5>)
{
  long long v124 = a2;
  uint64_t v11 = sub_1DADF5E30();
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v106 = (char *)&v99 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = sub_1DADF6720();
  uint64_t v105 = *(void *)(v107 - 8);
  MEMORY[0x1F4188790](v107);
  uint64_t v103 = (char *)&v99 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1DADF6510();
  uint64_t v109 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  uint64_t v108 = (char *)&v99 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8538);
  MEMORY[0x1F4188790](v99);
  uint64_t v104 = (uint64_t *)((char *)&v99 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8550);
  MEMORY[0x1F4188790](v100);
  uint64_t v102 = (uint64_t)&v99 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8558);
  uint64_t v18 = MEMORY[0x1F4188790](v101);
  uint64_t v110 = (uint64_t)&v99 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  uint64_t v123 = (uint64_t)&v99 - v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F85E8);
  uint64_t v22 = MEMORY[0x1F4188790](v21 - 8);
  char v24 = (char *)&v99 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v22);
  uint64_t v26 = (char *)&v99 - v25;
  uint64_t v121 = (id *)sub_1DADF61F0();
  uint64_t v120 = (uint64_t)*(v121 - 1);
  MEMORY[0x1F4188790](v121);
  double v116 = (char *)&v99 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v117 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F85C0);
  uint64_t v28 = *(v117 - 1);
  MEMORY[0x1F4188790](v117);
  uint64_t v30 = (char *)&v99 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8530);
  MEMORY[0x1F4188790](v31);
  uint64_t v33 = (char *)&v99 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v119 = (void *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F85A0);
  uint64_t v118 = *(v119 - 1);
  MEMORY[0x1F4188790](v119);
  uint64_t v35 = (char *)&v99 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F85A8);
  uint64_t v37 = MEMORY[0x1F4188790](v36);
  uint64_t v122 = (char *)&v99 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = MEMORY[0x1F4188790](v37);
  uint64_t v41 = (char *)&v99 - v40;
  uint64_t result = MEMORY[0x1F4188790](v39);
  uint64_t v43 = *a1;
  *(void *)&long long v128 = a1[1];
  if (a3 > a4)
  {
    __break(1u);
  }
  else
  {
    uint64_t v113 = v14;
    __n128 v114 = v26;
    uint64_t v115 = v24;
    double v131 = a3;
    double v132 = a4;
    unint64_t v111 = v35;
    uint64_t v44 = v30;
    double v45 = *(double *)&v31;
    __int16 v46 = v43;
    uint64_t v112 = v43;
    uint64_t v47 = MEMORY[0x1F4188790](result);
    uint64_t v125 = v48;
    uint64_t v126 = v49;
    *(&v99 - 2) = v50;
    uint64_t v127 = v47;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8548);
    sub_1DADBDC64();
    sub_1DADB2BCC();
    sub_1DADF64F0();
    if ((v46 & 0x100) != 0) {
      double v51 = 1.0;
    }
    else {
      double v51 = 0.5;
    }
    uint64_t v52 = v117;
    (*(void (**)(char *, char *, void *))(v28 + 16))(v33, v44, v117);
    *(double *)&v33[*(int *)(*(void *)&v45 + 36)] = v51;
    (*(void (**)(char *, void *))(v28 + 8))(v44, v52);
    double v53 = v116;
    sub_1DADF61E0();
    unint64_t v54 = sub_1DADBDD70();
    unint64_t v55 = sub_1DADBDE10();
    uint64_t v56 = v111;
    uint64_t v57 = v121;
    sub_1DADF63A0();
    (*(void (**)(char *, id *))(v120 + 8))(v53, v57);
    sub_1DADADF3C((uint64_t)v33, &qword_1EA8F8530);
    double v131 = v45;
    double v132 = *(double *)&v57;
    unint64_t v133 = v54;
    unint64_t v134 = v55;
    swift_getOpaqueTypeConformance2();
    uint64_t v58 = v119;
    sub_1DADF63F0();
    (*(void (**)(char *, void *))(v118 + 8))(v56, v58);
    uint64_t v60 = v125;
    uint64_t v59 = v126;
    uint64_t v61 = v127;
    (*(void (**)(uint64_t, char *, uint64_t))(v126 + 32))(v125, v41, v127);
    if (v112)
    {
      uint64_t v121 = (id *)sub_1DADA62CC();
      id v65 = *v121;
      sub_1DADF6550();
      LODWORD(v120) = *MEMORY[0x1E4F3EBF8];
      uint64_t v66 = v109;
      unint64_t v67 = *(void (**)(void))(v109 + 104);
      uint64_t v118 = v109 + 104;
      uint64_t v119 = v67;
      uint64_t v68 = v108;
      uint64_t v69 = v113;
      v67(v108);
      uint64_t v70 = sub_1DADF6540();
      swift_release();
      uint64_t v117 = *(void **)(v66 + 8);
      ((void (*)(char *, uint64_t))v117)(v68, v69);
      uint64_t v71 = v105;
      uint64_t v72 = v103;
      uint64_t v73 = v107;
      (*(void (**)(char *, void, uint64_t))(v105 + 104))(v103, *MEMORY[0x1E4F3EFC8], v107);
      uint64_t v74 = (uint64_t)v106;
      (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v106, v72, v73);
      os_log_type_t v75 = v104;
      uint64_t v76 = (uint64_t (*)(void))MEMORY[0x1E4F3CE18];
      sub_1DADBDE68(v74, (uint64_t)v104 + *(int *)(v99 + 36), MEMORY[0x1E4F3CE18]);
      *os_log_type_t v75 = v70;
      swift_retain();
      sub_1DADBDED0(v74, v76);
      (*(void (**)(char *, uint64_t))(v71 + 8))(v72, v73);
      swift_release();
      sub_1DADF66D0();
      sub_1DADF5CC0();
      uint64_t v77 = v102;
      sub_1DADAE0AC((uint64_t)v75, v102, &qword_1EA8F8538);
      uint64_t v78 = (_OWORD *)(v77 + *(int *)(v100 + 36));
      long long v79 = v129;
      *uint64_t v78 = v128;
      v78[1] = v79;
      v78[2] = v130;
      sub_1DADADF3C((uint64_t)v75, &qword_1EA8F8538);
      uint64_t v80 = v110;
      sub_1DADAE0AC(v77, v110, &qword_1EA8F8550);
      long long v81 = (double *)(v80 + *(int *)(v101 + 36));
      double *v81 = a5;
      v81[1] = a6;
      sub_1DADADF3C(v77, &qword_1EA8F8550);
      uint64_t v82 = v123;
      sub_1DADADF98(v80, v123, &qword_1EA8F8558);
      id v83 = *v121;
      sub_1DADF6550();
      uint64_t v84 = v113;
      ((void (*)(char *, void, uint64_t))v119)(v68, v120, v113);
      uint64_t v85 = sub_1DADF6540();
      swift_release();
      ((void (*)(char *, uint64_t))v117)(v68, v84);
      sub_1DADF66D0();
      sub_1DADF5CC0();
      double v86 = v131;
      LOBYTE(v70) = LOBYTE(v132);
      unint64_t v87 = v133;
      char v88 = v134;
      uint64_t v89 = v135;
      uint64_t v90 = v136;
      sub_1DADAE0AC(v82, v80, &qword_1EA8F8558);
      uint64_t v64 = (uint64_t)v115;
      sub_1DADAE0AC(v80, (uint64_t)v115, &qword_1EA8F8558);
      uint64_t v91 = v64 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8560) + 48);
      *(void *)uint64_t v91 = v85;
      *(double *)(v91 + 8) = v86;
      *(unsigned char *)(v91 + 16) = v70;
      *(void *)(v91 + 24) = v87;
      *(unsigned char *)(v91 + 32) = v88;
      *(void *)(v91 + 40) = v89;
      *(void *)(v91 + 48) = v90;
      uint64_t v59 = v126;
      uint64_t v61 = v127;
      *(double *)(v91 + 56) = a5;
      *(double *)(v91 + 64) = a6;
      swift_retain();
      sub_1DADADF3C(v123, &qword_1EA8F8558);
      swift_release();
      uint64_t v92 = v80;
      uint64_t v60 = v125;
      sub_1DADADF3C(v92, &qword_1EA8F8558);
      uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F85E0);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v93 - 8) + 56))(v64, 0, 1, v93);
      uint64_t v63 = (uint64_t)v114;
      sub_1DADADF98(v64, (uint64_t)v114, &qword_1EA8F85E8);
    }
    else
    {
      uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F85E0);
      uint64_t v63 = (uint64_t)v114;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v62 - 8) + 56))(v114, 1, 1, v62);
      uint64_t v64 = (uint64_t)v115;
    }
    char v94 = *(void (**)(char *, uint64_t, uint64_t))(v59 + 16);
    uint64_t v95 = v122;
    v94(v122, v60, v61);
    sub_1DADAE0AC(v63, v64, &qword_1EA8F85E8);
    uint64_t v96 = v124;
    v94(v124, (uint64_t)v95, v61);
    uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F85B0);
    sub_1DADAE0AC(v64, (uint64_t)&v96[*(int *)(v97 + 48)], &qword_1EA8F85E8);
    sub_1DADADF3C(v63, &qword_1EA8F85E8);
    uint64_t v98 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
    v98(v60, v61);
    sub_1DADADF3C(v64, &qword_1EA8F85E8);
    return ((uint64_t (*)(char *, uint64_t))v98)(v95, v61);
  }
  return result;
}

uint64_t sub_1DADB9EDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8590);
  uint64_t v5 = v4 - 8;
  MEMORY[0x1F4188790](v4);
  __n128 v7 = (uint64_t *)((char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_1DADF6530();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v12 = *(_OWORD *)(a1 + 16);
  v16[0] = *(_OWORD *)a1;
  v16[1] = v12;
  v16[2] = *(_OWORD *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 48);
  sub_1DADADF98((uint64_t)&v17, (uint64_t)v18, &qword_1EA8F85C8);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E4F3EC60], v8);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))((char *)v7 + *(int *)(v5 + 36), v11, v8);
  *__n128 v7 = KeyPath;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8548);
  sub_1DADAE0AC((uint64_t)v7, a2 + *(int *)(v14 + 36), &qword_1EA8F8590);
  sub_1DADADF98((uint64_t)v18, a2, &qword_1EA8F85C8);
  sub_1DADADEB0((uint64_t)v18);
  sub_1DADADEB0((uint64_t)v18);
  sub_1DADADF3C((uint64_t)v7, &qword_1EA8F8590);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return sub_1DADADD70((uint64_t)v18);
}

uint64_t sub_1DADBA0F0@<X0>(uint64_t (**a1)@<X0>(uint64_t@<X8>)@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v7[0] = *(_OWORD *)v1;
  v7[1] = v3;
  uint64_t v7[2] = *(_OWORD *)(v1 + 32);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v4 = swift_allocObject();
  long long v5 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v4 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v4 + 32) = v5;
  *(_OWORD *)(v4 + 48) = *(_OWORD *)(v1 + 32);
  *(void *)(v4 + 64) = *(void *)(v1 + 48);
  *(_OWORD *)(v4 + 72) = xmmword_1DADF8C00;
  *a1 = sub_1DADBE418;
  a1[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v4;
  return sub_1DADBD320((uint64_t)v7);
}

double sub_1DADBA184@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1DADF61D0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = sub_1DADF66D0();
  uint64_t v9 = v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v10 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v11 + v10, (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  if (qword_1EB684300 != -1) {
    swift_once();
  }
  sub_1DADF66D0();
  sub_1DADF5CC0();
  uint64_t v12 = v17;
  char v13 = v18;
  uint64_t v14 = v19;
  char v15 = v20;
  *(void *)a2 = v7;
  *(void *)(a2 + 8) = v9;
  *(void *)(a2 + 16) = sub_1DADBD36C;
  *(void *)(a2 + 24) = v11;
  *(void *)(a2 + 32) = v12;
  *(unsigned char *)(a2 + 40) = v13;
  *(void *)(a2 + 48) = v14;
  *(unsigned char *)(a2 + 56) = v15;
  double result = *(double *)&v21;
  *(_OWORD *)(a2 + 64) = v21;
  return result;
}

uint64_t sub_1DADBA350@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v58 = a2;
  uint64_t v61 = a1;
  uint64_t v63 = a3;
  uint64_t v3 = sub_1DADF5E20();
  MEMORY[0x1F4188790](v3);
  uint64_t v5 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8838);
  uint64_t v7 = MEMORY[0x1F4188790](v6);
  uint64_t v60 = (uint64_t)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  unint64_t v10 = (char *)&v51 - v9;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8840);
  uint64_t v11 = MEMORY[0x1F4188790](v56);
  uint64_t v62 = (uint64_t)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v55 = (uint64_t)&v51 - v14;
  uint64_t v15 = MEMORY[0x1F4188790](v13);
  uint64_t v59 = (uint64_t)&v51 - v16;
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)&v51 - v18;
  MEMORY[0x1F4188790](v17);
  uint64_t v57 = (uint64_t)&v51 - v20;
  uint64_t v53 = v3;
  long long v21 = &v5[*(int *)(v3 + 20)];
  uint64_t v22 = *MEMORY[0x1E4F3D4A0];
  uint64_t v23 = sub_1DADF60D0();
  char v24 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 104);
  unsigned int v52 = v22;
  v24(v21, v22, v23);
  __asm { FMOV            V0.2D, #5.0 }
  long long v51 = _Q0;
  *(_OWORD *)uint64_t v5 = _Q0;
  uint64_t v30 = sub_1DADF6490();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v32 = (uint64_t (*)(void))MEMORY[0x1E4F3CDB8];
  sub_1DADBDE68((uint64_t)v5, (uint64_t)v10, MEMORY[0x1E4F3CDB8]);
  uint64_t v54 = v6;
  uint64_t v33 = (uint64_t *)&v10[*(int *)(v6 + 36)];
  uint64_t *v33 = KeyPath;
  v33[1] = v30;
  sub_1DADBDED0((uint64_t)v5, v32);
  if (qword_1EB684300 != -1) {
    swift_once();
  }
  sub_1DADF66D0();
  sub_1DADF5CC0();
  sub_1DADAE0AC((uint64_t)v10, (uint64_t)v19, &qword_1EA8F8838);
  uint64_t v34 = v56;
  uint64_t v35 = &v19[*(int *)(v56 + 36)];
  long long v36 = v65;
  *(_OWORD *)uint64_t v35 = v64;
  *((_OWORD *)v35 + 1) = v36;
  *((_OWORD *)v35 + 2) = v66;
  sub_1DADADF3C((uint64_t)v10, &qword_1EA8F8838);
  uint64_t v37 = v57;
  sub_1DADADF98((uint64_t)v19, v57, &qword_1EA8F8840);
  v24(&v5[*(int *)(v53 + 20)], v52, v23);
  *(_OWORD *)uint64_t v5 = v51;
  uint64_t v38 = sub_1DADF64C0();
  uint64_t v39 = swift_getKeyPath();
  uint64_t v40 = (uint64_t (*)(void))MEMORY[0x1E4F3CDB8];
  uint64_t v41 = v60;
  sub_1DADBDE68((uint64_t)v5, v60, MEMORY[0x1E4F3CDB8]);
  uint64_t v42 = (uint64_t *)(v41 + *(int *)(v54 + 36));
  uint64_t *v42 = v39;
  v42[1] = v38;
  sub_1DADBDED0((uint64_t)v5, v40);
  sub_1DADF61C0();
  sub_1DADF5D10();
  sub_1DADF66D0();
  sub_1DADF5CC0();
  uint64_t v43 = v55;
  sub_1DADAE0AC(v41, v55, &qword_1EA8F8838);
  uint64_t v44 = (_OWORD *)(v43 + *(int *)(v34 + 36));
  long long v45 = v68;
  *uint64_t v44 = v67;
  v44[1] = v45;
  v44[2] = v69;
  sub_1DADADF3C(v41, &qword_1EA8F8838);
  uint64_t v46 = v59;
  sub_1DADADF98(v43, v59, &qword_1EA8F8840);
  sub_1DADAE0AC(v37, (uint64_t)v19, &qword_1EA8F8840);
  uint64_t v47 = v62;
  sub_1DADAE0AC(v46, v62, &qword_1EA8F8840);
  uint64_t v48 = v63;
  sub_1DADAE0AC((uint64_t)v19, v63, &qword_1EA8F8840);
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8848);
  sub_1DADAE0AC(v47, v48 + *(int *)(v49 + 48), &qword_1EA8F8840);
  sub_1DADADF3C(v46, &qword_1EA8F8840);
  sub_1DADADF3C(v37, &qword_1EA8F8840);
  sub_1DADADF3C(v47, &qword_1EA8F8840);
  return sub_1DADADF3C((uint64_t)v19, &qword_1EA8F8840);
}

double sub_1DADBA8AC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1DADF61D0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = sub_1DADF66D0();
  uint64_t v9 = v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v10 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v11 + v10, (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  if (qword_1EB684300 != -1) {
    swift_once();
  }
  sub_1DADF66D0();
  sub_1DADF5CC0();
  uint64_t v12 = v17;
  char v13 = v18;
  uint64_t v14 = v19;
  char v15 = v20;
  *(void *)a2 = v7;
  *(void *)(a2 + 8) = v9;
  *(void *)(a2 + 16) = sub_1DADBD36C;
  *(void *)(a2 + 24) = v11;
  *(void *)(a2 + 32) = v12;
  *(unsigned char *)(a2 + 40) = v13;
  *(void *)(a2 + 48) = v14;
  *(unsigned char *)(a2 + 56) = v15;
  double result = *(double *)&v21;
  *(_OWORD *)(a2 + 64) = v21;
  return result;
}

uint64_t sub_1DADBAA78(void *a1, char a2)
{
  uint64_t v4 = sub_1DADF6030();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    id v15 = a1;
  }
  else
  {
    swift_retain();
    os_log_type_t v8 = sub_1DADF69F0();
    uint64_t v9 = sub_1DADF6200();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v12 = swift_slowAlloc();
      uint64_t v18 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      v17[1] = v11 + 4;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F88F0);
      uint64_t v13 = sub_1DADF6C10();
      v17[2] = sub_1DADA5DB0(v13, v14, &v18);
      sub_1DADF6A90();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1DAD96000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1E01829D0](v12, -1, -1);
      MEMORY[0x1E01829D0](v11, -1, -1);
    }

    sub_1DADF6020();
    swift_getAtKeyPath();
    sub_1DADB6340(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v18;
  }
  return (uint64_t)a1;
}

void *sub_1DADBAC98(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = (void *)MEMORY[0x1E4FBC860];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F85F8);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_1DADBC9D4((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1DADF6B30();
    swift_bridgeObjectRelease();
    if (!v2) {
      return (void *)MEMORY[0x1E4FBC860];
    }
  }
  return v3;
}

void sub_1DADBAD90(uint64_t *a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = sub_1DADF6BA0();
  if (v4 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_132;
    }
    if (v3) {
      sub_1DADBBC68(0, v3, 1, v2);
    }
    return;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_140;
  }
  uint64_t v6 = v4;
  uint64_t v108 = v2;
  if (v3 < 2)
  {
    os_log_type_t v10 = (char *)MEMORY[0x1E4FBC860];
    uint64_t v117 = MEMORY[0x1E4FBC860];
    __n128 v114 = (char *)((MEMORY[0x1E4FBC860] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      unint64_t v13 = *(void *)(MEMORY[0x1E4FBC860] + 16);
LABEL_99:
      uint64_t v100 = v10;
      if (v13 >= 2)
      {
        uint64_t v101 = *v108;
        do
        {
          unint64_t v102 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_127;
          }
          if (!v101) {
            goto LABEL_139;
          }
          uint64_t v103 = v100;
          uint64_t v104 = *(void *)&v100[16 * v102 + 32];
          uint64_t v105 = *(void *)&v100[16 * v13 + 24];
          sub_1DADBBE48((id *)(v101 + 8 * v104), (id *)(v101 + 8 * *(void *)&v100[16 * v13 + 16]), v101 + 8 * v105, v114);
          if (v1) {
            break;
          }
          if (v105 < v104) {
            goto LABEL_128;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v103 = sub_1DADBC60C((uint64_t)v103);
          }
          if (v102 >= *((void *)v103 + 2)) {
            goto LABEL_129;
          }
          uint64_t v106 = &v103[16 * v102 + 32];
          *(void *)uint64_t v106 = v104;
          *((void *)v106 + 1) = v105;
          unint64_t v107 = *((void *)v103 + 2);
          if (v13 > v107) {
            goto LABEL_130;
          }
          memmove(&v103[16 * v13 + 16], &v103[16 * v13 + 32], 16 * (v107 - v13));
          uint64_t v100 = v103;
          *((void *)v103 + 2) = v107 - 1;
          unint64_t v13 = v107 - 1;
        }
        while (v107 > 2);
      }
LABEL_96:
      swift_bridgeObjectRelease();
      *(void *)((v117 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_1DADF6930();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v7 = v2;
    uint64_t v8 = v5 >> 1;
    sub_1DADA73E8(0, &qword_1EB683680);
    uint64_t v9 = sub_1DADF6940();
    *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
    uint64_t v2 = v7;
    __n128 v114 = (char *)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v117 = v9;
  }
  uint64_t v111 = v6;
  uint64_t v11 = 0;
  uint64_t v12 = *v2;
  uint64_t v109 = *v2 - 8;
  uint64_t v110 = *v2 + 16;
  os_log_type_t v10 = (char *)MEMORY[0x1E4FBC860];
  uint64_t v113 = v3;
  while (1)
  {
    uint64_t v14 = v11++;
    if (v11 >= v3) {
      goto LABEL_31;
    }
    id v15 = *(void **)(v12 + 8 * v14);
    id v16 = *(id *)(v12 + 8 * v11);
    id v17 = v15;
    BCBatteryDevice.priority.getter();
    float v19 = v18;
    BCBatteryDevice.priority.getter();
    float v21 = v20;

    uint64_t v11 = v14 + 2;
    if (v14 + 2 >= v3)
    {
LABEL_21:
      if (v19 >= v21) {
        goto LABEL_31;
      }
LABEL_24:
      if (v11 < v14) {
        goto LABEL_133;
      }
      if (v14 < v11)
      {
        uint64_t v30 = (uint64_t *)(v109 + 8 * v11);
        uint64_t v31 = v11;
        uint64_t v32 = v14;
        uint64_t v33 = (uint64_t *)(v12 + 8 * v14);
        while (1)
        {
          if (v32 != --v31)
          {
            if (!v12) {
              goto LABEL_138;
            }
            uint64_t v34 = *v33;
            uint64_t *v33 = *v30;
            *uint64_t v30 = v34;
          }
          ++v32;
          --v30;
          ++v33;
          if (v32 >= v31) {
            goto LABEL_31;
          }
        }
      }
      goto LABEL_31;
    }
    uint64_t v22 = (id *)(v110 + 8 * v14);
    while (1)
    {
      uint64_t v23 = *(v22 - 1);
      id v24 = *v22;
      id v25 = v23;
      BCBatteryDevice.priority.getter();
      float v27 = v26;
      BCBatteryDevice.priority.getter();
      float v29 = v28;

      if (v19 < v21 == v27 >= v29) {
        break;
      }
      ++v11;
      ++v22;
      if (v113 == v11)
      {
        uint64_t v11 = v113;
        uint64_t v3 = v113;
        goto LABEL_21;
      }
    }
    uint64_t v3 = v113;
    if (v19 < v21) {
      goto LABEL_24;
    }
LABEL_31:
    if (v11 >= v3) {
      goto LABEL_48;
    }
    if (__OFSUB__(v11, v14)) {
      goto LABEL_131;
    }
    if (v11 - v14 >= v111) {
      goto LABEL_48;
    }
    if (__OFADD__(v14, v111)) {
      goto LABEL_134;
    }
    uint64_t v35 = v14 + v111 >= v3 ? v3 : v14 + v111;
    if (v35 < v14) {
      break;
    }
    if (v11 != v35)
    {
      uint64_t v36 = v109 + 8 * v11;
      uint64_t v112 = v14;
      uint64_t v115 = v35;
      do
      {
        uint64_t v37 = *(void **)(v12 + 8 * v11);
        uint64_t v38 = v36;
        do
        {
          uint64_t v39 = *(void **)v38;
          id v40 = v37;
          id v41 = v39;
          BCBatteryDevice.priority.getter();
          float v43 = v42;
          BCBatteryDevice.priority.getter();
          float v45 = v44;

          if (v43 >= v45) {
            break;
          }
          if (!v12) {
            goto LABEL_136;
          }
          uint64_t v46 = *(void **)v38;
          uint64_t v37 = *(void **)(v38 + 8);
          *(void *)uint64_t v38 = v37;
          *(void *)(v38 + 8) = v46;
          v38 -= 8;
          ++v14;
        }
        while (v11 != v14);
        ++v11;
        v36 += 8;
        uint64_t v14 = v112;
      }
      while (v11 != v115);
      uint64_t v11 = v115;
    }
LABEL_48:
    if (v11 < v14) {
      goto LABEL_126;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      os_log_type_t v10 = sub_1DADBC454(0, *((void *)v10 + 2) + 1, 1, v10);
    }
    unint64_t v48 = *((void *)v10 + 2);
    unint64_t v47 = *((void *)v10 + 3);
    unint64_t v13 = v48 + 1;
    if (v48 >= v47 >> 1) {
      os_log_type_t v10 = sub_1DADBC454((char *)(v47 > 1), v48 + 1, 1, v10);
    }
    *((void *)v10 + 2) = v13;
    double v116 = v10 + 32;
    uint64_t v49 = &v10[16 * v48 + 32];
    *(void *)uint64_t v49 = v14;
    *((void *)v49 + 1) = v11;
    if (v48)
    {
      uint64_t v50 = v10 + 32;
      while (1)
      {
        unint64_t v51 = v13 - 1;
        if (v13 >= 4)
        {
          uint64_t v56 = &v50[16 * v13];
          uint64_t v57 = *((void *)v56 - 8);
          uint64_t v58 = *((void *)v56 - 7);
          BOOL v62 = __OFSUB__(v58, v57);
          uint64_t v59 = v58 - v57;
          if (v62) {
            goto LABEL_115;
          }
          uint64_t v61 = *((void *)v56 - 6);
          uint64_t v60 = *((void *)v56 - 5);
          BOOL v62 = __OFSUB__(v60, v61);
          uint64_t v54 = v60 - v61;
          char v55 = v62;
          if (v62) {
            goto LABEL_116;
          }
          unint64_t v63 = v13 - 2;
          long long v64 = &v50[16 * v13 - 32];
          uint64_t v66 = *(void *)v64;
          uint64_t v65 = *((void *)v64 + 1);
          BOOL v62 = __OFSUB__(v65, v66);
          uint64_t v67 = v65 - v66;
          if (v62) {
            goto LABEL_118;
          }
          BOOL v62 = __OFADD__(v54, v67);
          uint64_t v68 = v54 + v67;
          if (v62) {
            goto LABEL_121;
          }
          if (v68 >= v59)
          {
            double v86 = &v50[16 * v51];
            uint64_t v88 = *(void *)v86;
            uint64_t v87 = *((void *)v86 + 1);
            BOOL v62 = __OFSUB__(v87, v88);
            uint64_t v89 = v87 - v88;
            if (v62) {
              goto LABEL_125;
            }
            BOOL v79 = v54 < v89;
            goto LABEL_86;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v80 = *((void *)v10 + 4);
            uint64_t v81 = *((void *)v10 + 5);
            BOOL v62 = __OFSUB__(v81, v80);
            uint64_t v73 = v81 - v80;
            char v74 = v62;
            goto LABEL_80;
          }
          uint64_t v53 = *((void *)v10 + 4);
          uint64_t v52 = *((void *)v10 + 5);
          BOOL v62 = __OFSUB__(v52, v53);
          uint64_t v54 = v52 - v53;
          char v55 = v62;
        }
        if (v55) {
          goto LABEL_117;
        }
        unint64_t v63 = v13 - 2;
        long long v69 = &v50[16 * v13 - 32];
        uint64_t v71 = *(void *)v69;
        uint64_t v70 = *((void *)v69 + 1);
        BOOL v72 = __OFSUB__(v70, v71);
        uint64_t v73 = v70 - v71;
        char v74 = v72;
        if (v72) {
          goto LABEL_120;
        }
        os_log_type_t v75 = &v50[16 * v51];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v62 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v62) {
          goto LABEL_123;
        }
        if (__OFADD__(v73, v78)) {
          goto LABEL_124;
        }
        if (v73 + v78 >= v54)
        {
          BOOL v79 = v54 < v78;
LABEL_86:
          if (v79) {
            unint64_t v51 = v63;
          }
          goto LABEL_88;
        }
LABEL_80:
        if (v74) {
          goto LABEL_119;
        }
        uint64_t v82 = &v50[16 * v51];
        uint64_t v84 = *(void *)v82;
        uint64_t v83 = *((void *)v82 + 1);
        BOOL v62 = __OFSUB__(v83, v84);
        uint64_t v85 = v83 - v84;
        if (v62) {
          goto LABEL_122;
        }
        if (v85 < v73) {
          goto LABEL_14;
        }
LABEL_88:
        unint64_t v90 = v51 - 1;
        if (v51 - 1 >= v13)
        {
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
          goto LABEL_135;
        }
        uint64_t v91 = v12;
        if (!v12) {
          goto LABEL_137;
        }
        uint64_t v92 = v10;
        uint64_t v93 = &v50[16 * v90];
        char v94 = v50;
        uint64_t v95 = *(void *)v93;
        uint64_t v96 = &v94[16 * v51];
        uint64_t v97 = *((void *)v96 + 1);
        uint64_t v98 = v91;
        sub_1DADBBE48((id *)(v91 + 8 * *(void *)v93), (id *)(v91 + 8 * *(void *)v96), v91 + 8 * v97, v114);
        if (v1) {
          goto LABEL_96;
        }
        if (v97 < v95) {
          goto LABEL_112;
        }
        if (v51 > *((void *)v92 + 2)) {
          goto LABEL_113;
        }
        *(void *)uint64_t v93 = v95;
        uint64_t v50 = v116;
        *(void *)&v116[16 * v90 + 8] = v97;
        unint64_t v99 = *((void *)v92 + 2);
        if (v51 >= v99) {
          goto LABEL_114;
        }
        os_log_type_t v10 = v92;
        unint64_t v13 = v99 - 1;
        memmove(v96, v96 + 16, 16 * (v99 - 1 - v51));
        *((void *)v92 + 2) = v99 - 1;
        uint64_t v12 = v98;
        if (v99 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_14:
    uint64_t v3 = v113;
    if (v11 >= v113) {
      goto LABEL_99;
    }
  }
LABEL_135:
  __break(1u);
LABEL_136:
  __break(1u);
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:
  sub_1DADF6B20();
  __break(1u);
}

void sub_1DADBB4F4(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = sub_1DADF6BA0();
  if (v4 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_132;
    }
    if (v3) {
      sub_1DADBBD54(0, v3, 1, a1);
    }
    return;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_140;
  }
  uint64_t v104 = v4;
  unint64_t v99 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = (char *)MEMORY[0x1E4FBC860];
    uint64_t v111 = MEMORY[0x1E4FBC860];
    uint64_t v110 = (void **)((MEMORY[0x1E4FBC860] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      unint64_t v11 = *(void *)(MEMORY[0x1E4FBC860] + 16);
LABEL_98:
      if (v11 >= 2)
      {
        uint64_t v93 = *v99;
        do
        {
          unint64_t v94 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_127;
          }
          if (!v93) {
            goto LABEL_139;
          }
          uint64_t v95 = *(void *)&v8[16 * v94 + 32];
          uint64_t v96 = *(void *)&v8[16 * v11 + 24];
          sub_1DADBC134((id *)(v93 + 8 * v95), (id *)(v93 + 8 * *(void *)&v8[16 * v11 + 16]), v93 + 8 * v96, v110);
          if (v1) {
            break;
          }
          if (v96 < v95) {
            goto LABEL_128;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v8 = sub_1DADBC60C((uint64_t)v8);
          }
          if (v94 >= *((void *)v8 + 2)) {
            goto LABEL_129;
          }
          uint64_t v97 = &v8[16 * v94 + 32];
          *(void *)uint64_t v97 = v95;
          *((void *)v97 + 1) = v96;
          unint64_t v98 = *((void *)v8 + 2);
          if (v11 > v98) {
            goto LABEL_130;
          }
          memmove(&v8[16 * v11 + 16], &v8[16 * v11 + 32], 16 * (v98 - v11));
          *((void *)v8 + 2) = v98 - 1;
          unint64_t v11 = v98 - 1;
        }
        while (v98 > 2);
      }
LABEL_109:
      swift_bridgeObjectRelease();
      *(void *)((v111 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_1DADF6930();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    sub_1DADA73E8(0, &qword_1EB683680);
    uint64_t v7 = sub_1DADF6940();
    *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
    uint64_t v110 = (void **)((v7 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v111 = v7;
  }
  uint64_t v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v100 = *a1 - 8;
  uint64_t v101 = *a1 + 16;
  uint64_t v8 = (char *)MEMORY[0x1E4FBC860];
  uint64_t v107 = v3;
  while (1)
  {
    uint64_t v12 = v9++;
    uint64_t v108 = v12;
    if (v9 < v3)
    {
      unint64_t v13 = *(void **)(v10 + 8 * v12);
      id v14 = *(id *)(v10 + 8 * v9);
      id v15 = v13;
      id v105 = objc_msgSend(v14, sel_percentCharge);
      id v16 = objc_msgSend(v15, sel_percentCharge);

      uint64_t v3 = v107;
      uint64_t v9 = v12 + 2;
      if (v12 + 2 < v107)
      {
        unint64_t v102 = v8;
        id v17 = (id *)(v101 + 8 * v12);
        while (1)
        {
          float v18 = *(v17 - 1);
          id v19 = *v17;
          id v20 = v18;
          id v21 = objc_msgSend(v19, sel_percentCharge);
          id v22 = objc_msgSend(v20, sel_percentCharge);

          if ((uint64_t)v105 < (uint64_t)v16 == (uint64_t)v21 >= (uint64_t)v22) {
            break;
          }
          ++v9;
          ++v17;
          uint64_t v3 = v107;
          if (v107 == v9)
          {
            uint64_t v9 = v107;
            uint64_t v8 = v102;
            goto LABEL_22;
          }
        }
        uint64_t v8 = v102;
        uint64_t v3 = v107;
LABEL_22:
        uint64_t v12 = v108;
      }
      if ((uint64_t)v105 < (uint64_t)v16)
      {
        if (v9 < v12) {
          goto LABEL_133;
        }
        if (v12 < v9)
        {
          uint64_t v23 = (uint64_t *)(v100 + 8 * v9);
          uint64_t v24 = v9;
          uint64_t v25 = v12;
          float v26 = (uint64_t *)(v10 + 8 * v12);
          do
          {
            if (v25 != --v24)
            {
              if (!v10) {
                goto LABEL_138;
              }
              uint64_t v27 = *v26;
              *float v26 = *v23;
              *uint64_t v23 = v27;
            }
            ++v25;
            --v23;
            ++v26;
          }
          while (v25 < v24);
        }
      }
    }
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v12)) {
        goto LABEL_131;
      }
      if (v9 - v12 < v104) {
        break;
      }
    }
LABEL_48:
    if (v9 < v12) {
      goto LABEL_126;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v8 = sub_1DADBC454(0, *((void *)v8 + 2) + 1, 1, v8);
    }
    unint64_t v40 = *((void *)v8 + 2);
    unint64_t v39 = *((void *)v8 + 3);
    unint64_t v11 = v40 + 1;
    if (v40 >= v39 >> 1) {
      uint64_t v8 = sub_1DADBC454((char *)(v39 > 1), v40 + 1, 1, v8);
    }
    *((void *)v8 + 2) = v11;
    id v41 = v8 + 32;
    float v42 = &v8[16 * v40 + 32];
    *(void *)float v42 = v12;
    *((void *)v42 + 1) = v9;
    if (v40)
    {
      uint64_t v109 = v9;
      while (1)
      {
        unint64_t v43 = v11 - 1;
        if (v11 >= 4)
        {
          unint64_t v48 = &v41[16 * v11];
          uint64_t v49 = *((void *)v48 - 8);
          uint64_t v50 = *((void *)v48 - 7);
          BOOL v54 = __OFSUB__(v50, v49);
          uint64_t v51 = v50 - v49;
          if (v54) {
            goto LABEL_115;
          }
          uint64_t v53 = *((void *)v48 - 6);
          uint64_t v52 = *((void *)v48 - 5);
          BOOL v54 = __OFSUB__(v52, v53);
          uint64_t v46 = v52 - v53;
          char v47 = v54;
          if (v54) {
            goto LABEL_116;
          }
          unint64_t v55 = v11 - 2;
          uint64_t v56 = &v41[16 * v11 - 32];
          uint64_t v58 = *(void *)v56;
          uint64_t v57 = *((void *)v56 + 1);
          BOOL v54 = __OFSUB__(v57, v58);
          uint64_t v59 = v57 - v58;
          if (v54) {
            goto LABEL_118;
          }
          BOOL v54 = __OFADD__(v46, v59);
          uint64_t v60 = v46 + v59;
          if (v54) {
            goto LABEL_121;
          }
          if (v60 >= v51)
          {
            uint64_t v78 = &v41[16 * v43];
            uint64_t v80 = *(void *)v78;
            uint64_t v79 = *((void *)v78 + 1);
            BOOL v54 = __OFSUB__(v79, v80);
            uint64_t v81 = v79 - v80;
            if (v54) {
              goto LABEL_125;
            }
            BOOL v71 = v46 < v81;
            goto LABEL_86;
          }
        }
        else
        {
          if (v11 != 3)
          {
            uint64_t v72 = *((void *)v8 + 4);
            uint64_t v73 = *((void *)v8 + 5);
            BOOL v54 = __OFSUB__(v73, v72);
            uint64_t v65 = v73 - v72;
            char v66 = v54;
            goto LABEL_80;
          }
          uint64_t v45 = *((void *)v8 + 4);
          uint64_t v44 = *((void *)v8 + 5);
          BOOL v54 = __OFSUB__(v44, v45);
          uint64_t v46 = v44 - v45;
          char v47 = v54;
        }
        if (v47) {
          goto LABEL_117;
        }
        unint64_t v55 = v11 - 2;
        uint64_t v61 = &v41[16 * v11 - 32];
        uint64_t v63 = *(void *)v61;
        uint64_t v62 = *((void *)v61 + 1);
        BOOL v64 = __OFSUB__(v62, v63);
        uint64_t v65 = v62 - v63;
        char v66 = v64;
        if (v64) {
          goto LABEL_120;
        }
        uint64_t v67 = &v41[16 * v43];
        uint64_t v69 = *(void *)v67;
        uint64_t v68 = *((void *)v67 + 1);
        BOOL v54 = __OFSUB__(v68, v69);
        uint64_t v70 = v68 - v69;
        if (v54) {
          goto LABEL_123;
        }
        if (__OFADD__(v65, v70)) {
          goto LABEL_124;
        }
        if (v65 + v70 >= v46)
        {
          BOOL v71 = v46 < v70;
LABEL_86:
          if (v71) {
            unint64_t v43 = v55;
          }
          goto LABEL_88;
        }
LABEL_80:
        if (v66) {
          goto LABEL_119;
        }
        char v74 = &v41[16 * v43];
        uint64_t v76 = *(void *)v74;
        uint64_t v75 = *((void *)v74 + 1);
        BOOL v54 = __OFSUB__(v75, v76);
        uint64_t v77 = v75 - v76;
        if (v54) {
          goto LABEL_122;
        }
        if (v77 < v65) {
          goto LABEL_14;
        }
LABEL_88:
        unint64_t v82 = v43 - 1;
        if (v43 - 1 >= v11)
        {
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
          goto LABEL_135;
        }
        uint64_t v83 = v10;
        if (!v10) {
          goto LABEL_137;
        }
        uint64_t v84 = v8;
        uint64_t v85 = &v41[16 * v82];
        uint64_t v86 = *(void *)v85;
        uint64_t v87 = v41;
        unint64_t v88 = v43;
        uint64_t v89 = &v41[16 * v43];
        uint64_t v90 = *((void *)v89 + 1);
        uint64_t v91 = v83;
        sub_1DADBC134((id *)(v83 + 8 * *(void *)v85), (id *)(v83 + 8 * *(void *)v89), v83 + 8 * v90, v110);
        if (v1) {
          goto LABEL_109;
        }
        if (v90 < v86) {
          goto LABEL_112;
        }
        if (v88 > *((void *)v84 + 2)) {
          goto LABEL_113;
        }
        *(void *)uint64_t v85 = v86;
        *(void *)&v87[16 * v82 + 8] = v90;
        unint64_t v92 = *((void *)v84 + 2);
        if (v88 >= v92) {
          goto LABEL_114;
        }
        uint64_t v8 = v84;
        unint64_t v11 = v92 - 1;
        memmove(v89, v89 + 16, 16 * (v92 - 1 - v88));
        id v41 = v87;
        *((void *)v84 + 2) = v92 - 1;
        uint64_t v10 = v91;
        uint64_t v9 = v109;
        if (v92 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v11 = 1;
LABEL_14:
    uint64_t v3 = v107;
    if (v9 >= v107) {
      goto LABEL_98;
    }
  }
  if (__OFADD__(v12, v104)) {
    goto LABEL_134;
  }
  if (v12 + v104 >= v3) {
    uint64_t v28 = v3;
  }
  else {
    uint64_t v28 = v12 + v104;
  }
  if (v28 >= v12)
  {
    if (v9 != v28)
    {
      uint64_t v103 = v8;
      uint64_t v29 = v100 + 8 * v9;
      uint64_t v106 = v28;
      do
      {
        uint64_t v30 = *(void **)(v10 + 8 * v9);
        uint64_t v31 = v12;
        uint64_t v32 = v29;
        do
        {
          uint64_t v33 = *(void **)v32;
          id v34 = v30;
          id v35 = v33;
          id v36 = objc_msgSend(v34, sel_percentCharge);
          id v37 = objc_msgSend(v35, sel_percentCharge);

          if ((uint64_t)v36 >= (uint64_t)v37) {
            break;
          }
          if (!v10) {
            goto LABEL_136;
          }
          uint64_t v38 = *(void **)v32;
          uint64_t v30 = *(void **)(v32 + 8);
          *(void *)uint64_t v32 = v30;
          *(void *)(v32 + 8) = v38;
          v32 -= 8;
          ++v31;
        }
        while (v9 != v31);
        ++v9;
        v29 += 8;
        uint64_t v12 = v108;
      }
      while (v9 != v106);
      uint64_t v9 = v106;
      uint64_t v8 = v103;
    }
    goto LABEL_48;
  }
LABEL_135:
  __break(1u);
LABEL_136:
  __break(1u);
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:
  sub_1DADF6B20();
  __break(1u);
}

void sub_1DADBBC68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = *a4;
    uint64_t v7 = *a4 + 8 * a3 - 8;
LABEL_5:
    uint64_t v8 = *(void **)(v6 + 8 * v4);
    uint64_t v9 = a1;
    uint64_t v10 = v7;
    while (1)
    {
      unint64_t v11 = *(void **)v10;
      id v12 = v8;
      id v13 = v11;
      BCBatteryDevice.priority.getter();
      float v15 = v14;
      BCBatteryDevice.priority.getter();
      float v17 = v16;

      if (v15 >= v17)
      {
LABEL_4:
        ++v4;
        v7 += 8;
        if (v4 == a2) {
          return;
        }
        goto LABEL_5;
      }
      if (!v6) {
        break;
      }
      float v18 = *(void **)v10;
      uint64_t v8 = *(void **)(v10 + 8);
      *(void *)uint64_t v10 = v8;
      *(void *)(v10 + 8) = v18;
      v10 -= 8;
      if (v4 == ++v9) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

void sub_1DADBBD54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v5 = *a4;
    uint64_t v6 = *a4 + 8 * a3 - 8;
LABEL_5:
    uint64_t v7 = *(void **)(v5 + 8 * v4);
    uint64_t v8 = a1;
    uint64_t v17 = v6;
    while (1)
    {
      uint64_t v9 = *(void **)v6;
      id v10 = v7;
      id v11 = v9;
      id v12 = objc_msgSend(v10, sel_percentCharge);
      id v13 = objc_msgSend(v11, sel_percentCharge);

      if ((uint64_t)v12 >= (uint64_t)v13)
      {
LABEL_4:
        ++v4;
        uint64_t v6 = v17 + 8;
        if (v4 == a2) {
          return;
        }
        goto LABEL_5;
      }
      if (!v5) {
        break;
      }
      float v14 = *(void **)v6;
      uint64_t v7 = *(void **)(v6 + 8);
      *(void *)uint64_t v6 = v7;
      *(void *)(v6 + 8) = v14;
      v6 -= 8;
      if (v4 == ++v8) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

uint64_t sub_1DADBBE48(id *a1, id *__src, unint64_t a3, char *a4)
{
  uint64_t v5 = __src;
  uint64_t v6 = (char *)__src - (char *)a1;
  uint64_t v7 = (char *)__src - (char *)a1 + 7;
  if ((char *)__src - (char *)a1 >= 0) {
    uint64_t v7 = (char *)__src - (char *)a1;
  }
  uint64_t v8 = v7 >> 3;
  uint64_t v9 = a3 - (void)__src;
  uint64_t v10 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v10 = a3 - (void)__src;
  }
  uint64_t v11 = v10 >> 3;
  unint64_t v39 = a1;
  uint64_t v38 = (void **)a4;
  if (v8 >= v10 >> 3)
  {
    if (v9 >= -7)
    {
      if (a4 != (char *)__src || &__src[v11] <= (id *)a4) {
        memmove(a4, __src, 8 * v11);
      }
      uint64_t v23 = &a4[8 * v11];
      id v37 = v23;
      unint64_t v39 = v5;
      if (a1 < v5 && v9 >= 8)
      {
        uint64_t v24 = (id *)(a3 - 8);
        uint64_t v25 = v5;
        do
        {
          float v26 = v24 + 1;
          uint64_t v27 = *--v25;
          id v28 = *((id *)v23 - 1);
          id v29 = v27;
          BCBatteryDevice.priority.getter();
          float v31 = v30;
          BCBatteryDevice.priority.getter();
          float v33 = v32;

          if (v31 >= v33)
          {
            id v37 = v23 - 8;
            if (v26 < (id *)v23 || v24 >= (id *)v23 || v26 != (id *)v23) {
              *uint64_t v24 = (id)*((void *)v23 - 1);
            }
            uint64_t v25 = v5;
            v23 -= 8;
          }
          else
          {
            if (v26 != v5 || v24 >= v5) {
              *uint64_t v24 = *v25;
            }
            unint64_t v39 = v25;
          }
          if (v25 <= a1) {
            break;
          }
          --v24;
          uint64_t v5 = v25;
        }
        while (v23 > a4);
      }
      goto LABEL_43;
    }
  }
  else if (v6 >= -7)
  {
    if (a4 != (char *)a1 || &a1[v8] <= (id *)a4) {
      memmove(a4, a1, 8 * v8);
    }
    id v12 = (void **)&a4[8 * v8];
    id v37 = (char *)v12;
    if ((unint64_t)v5 < a3 && v6 >= 8)
    {
      id v13 = (void **)a4;
      float v14 = a1;
      do
      {
        float v15 = *v13;
        id v16 = *v5;
        id v17 = v15;
        BCBatteryDevice.priority.getter();
        float v19 = v18;
        BCBatteryDevice.priority.getter();
        float v21 = v20;

        if (v19 >= v21)
        {
          if (v14 != v13) {
            *float v14 = *v13;
          }
          uint64_t v38 = ++v13;
          id v22 = v5;
        }
        else
        {
          id v22 = v5 + 1;
          if (v14 < v5 || v14 >= v22 || v14 != v5) {
            *float v14 = *v5;
          }
        }
        ++v14;
        if (v13 >= v12) {
          break;
        }
        uint64_t v5 = v22;
      }
      while ((unint64_t)v22 < a3);
      unint64_t v39 = v14;
    }
LABEL_43:
    sub_1DADBC550((void **)&v39, (const void **)&v38, &v37);
    return 1;
  }
  uint64_t result = sub_1DADF6B70();
  __break(1u);
  return result;
}

uint64_t sub_1DADBC134(id *__src, id *a2, unint64_t a3, void **a4)
{
  uint64_t v4 = a2;
  uint64_t v5 = __src;
  int64_t v6 = (char *)a2 - (char *)__src;
  int64_t v7 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v7 = (char *)a2 - (char *)__src;
  }
  uint64_t v8 = v7 >> 3;
  uint64_t v9 = a3 - (void)a2;
  uint64_t v10 = a3 - (void)a2 + 7;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v10 = a3 - (void)a2;
  }
  uint64_t v11 = v10 >> 3;
  uint64_t v38 = __src;
  id v37 = a4;
  if (v8 >= v10 >> 3)
  {
    if (v9 >= -7)
    {
      if (a4 != a2 || &a2[v11] <= a4) {
        memmove(a4, a2, 8 * v11);
      }
      id v22 = &a4[v11];
      id v36 = (char *)v22;
      uint64_t v38 = v4;
      if (v5 < v4 && v9 >= 8)
      {
        uint64_t v23 = (id *)(a3 - 8);
        uint64_t v24 = v4;
        float v32 = v5;
        do
        {
          id v35 = v4;
          uint64_t v25 = v23 + 1;
          float v26 = *--v24;
          id v27 = *(v22 - 1);
          id v28 = v26;
          id v29 = objc_msgSend(v27, sel_percentCharge);
          id v30 = objc_msgSend(v28, sel_percentCharge);

          if ((uint64_t)v29 >= (uint64_t)v30)
          {
            id v36 = (char *)(v22 - 1);
            if (v25 < v22 || v23 >= v22 || v25 != v22) {
              *uint64_t v23 = *(v22 - 1);
            }
            uint64_t v24 = v35;
            --v22;
          }
          else
          {
            if (v25 != v35 || v23 >= v35) {
              *uint64_t v23 = *v24;
            }
            uint64_t v38 = v24;
          }
          if (v24 <= v32) {
            break;
          }
          --v23;
          uint64_t v4 = v24;
        }
        while (v22 > a4);
      }
      goto LABEL_43;
    }
  }
  else if (v6 >= -7)
  {
    if (a4 != __src || &__src[v8] <= a4) {
      memmove(a4, __src, 8 * v8);
    }
    id v12 = &a4[v8];
    id v36 = (char *)v12;
    if ((unint64_t)v4 < a3 && v6 >= 8)
    {
      id v13 = a4;
      do
      {
        float v14 = v5;
        float v15 = *v13;
        id v16 = *v4;
        id v17 = v15;
        id v18 = objc_msgSend(v16, sel_percentCharge);
        id v19 = objc_msgSend(v17, sel_percentCharge);

        if ((uint64_t)v18 >= (uint64_t)v19)
        {
          float v21 = v14;
          if (v14 != v13) {
            *float v14 = *v13;
          }
          id v37 = ++v13;
          float v20 = v4;
        }
        else
        {
          float v20 = v4 + 1;
          float v21 = v14;
          if (v14 < v4 || v14 >= v20 || v14 != v4) {
            *float v14 = *v4;
          }
        }
        uint64_t v5 = v21 + 1;
        if (v13 >= v12) {
          break;
        }
        uint64_t v4 = v20;
      }
      while ((unint64_t)v20 < a3);
      uint64_t v38 = v5;
    }
LABEL_43:
    sub_1DADBC550((void **)&v38, (const void **)&v37, &v36);
    return 1;
  }
  uint64_t result = sub_1DADF6B70();
  __break(1u);
  return result;
}

char *sub_1DADBC454(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F88E0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  id v13 = v10 + 32;
  float v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1DADBC550(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)sub_1DADF6B70();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_1DADBC60C(uint64_t a1)
{
  return sub_1DADBC454(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1DADBC620@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_1DADF6000();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_1DADBC654()
{
  return sub_1DADF6010();
}

uint64_t sub_1DADBC684()
{
  return sub_1DADF5E90();
}

uint64_t sub_1DADBC6A8(uint64_t a1)
{
  uint64_t v2 = sub_1DADF6530();
  MEMORY[0x1F4188790](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1DADF5EA0();
}

uint64_t sub_1DADBC770@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1DADF5F70();
  *a1 = result;
  return result;
}

uint64_t sub_1DADBC79C()
{
  return sub_1DADF5F80();
}

uint64_t sub_1DADBC7C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1DADF5F20();
  *a1 = result;
  return result;
}

uint64_t sub_1DADBC7F4()
{
  return sub_1DADF5F30();
}

void (*sub_1DADBC820(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1DADBC8D0(v6, a2, a3);
  return sub_1DADBC888;
}

void sub_1DADBC888(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_1DADBC8D0(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)MEMORY[0x1E0181F60](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_1DADBC950;
  }
  __break(1u);
  return result;
}

void sub_1DADBC950(id *a1)
{
}

void sub_1DADBC958(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1DADF6B30();
    swift_bridgeObjectRelease();
  }

  JUMPOUT(0x1E0181F70);
}

uint64_t sub_1DADBC9D4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1DADF6B30();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1DADF6B30();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1DADAD660(&qword_1EA8F88E8, &qword_1EB682F90);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F90);
          uint64_t v12 = sub_1DADBC820(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1DADA73E8(0, &qword_1EB683680);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1DADF6B70();
  __break(1u);
  return result;
}

void sub_1DADBCC08()
{
}

id *sub_1DADBCC1C(id *a1, void *a2)
{
  uint64_t v3 = v2;
  unint64_t v4 = (unint64_t)a1;
  if ((unint64_t)a1 >> 62)
  {
LABEL_28:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1DADF6B30();
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = *(void *)(((unint64_t)a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
    {
LABEL_3:
      uint64_t v20 = v3;
      float v21 = (id *)v4;
      unint64_t v22 = v4 & 0xC000000000000001;
      uint64_t v6 = 4;
      uint64_t v7 = &selRef_CGColor;
      do
      {
        if (v22) {
          uint64_t v8 = (id *)MEMORY[0x1E0181F60](v6 - 4, v4);
        }
        else {
          uint64_t v8 = (id *)*(id *)(v4 + 8 * v6);
        }
        unint64_t v4 = (unint64_t)v8;
        uint64_t v9 = v6 - 3;
        if (__OFADD__(v6 - 4, 1))
        {
          __break(1u);
          goto LABEL_28;
        }
        id v10 = [v8 v7[329]];
        if (v10)
        {
          uint64_t v3 = (uint64_t)v10;
          uint64_t v11 = sub_1DADF6840();
          uint64_t v13 = v12;
        }
        else
        {
          uint64_t v11 = 0;
          uint64_t v13 = 0;
        }
        id v14 = v7;
        id v15 = objc_msgSend(a2, v7[329], v20);
        if (v15)
        {
          uint64_t v3 = (uint64_t)v15;
          uint64_t v16 = sub_1DADF6840();
          uint64_t v18 = v17;

          if (v13)
          {
            if (v18)
            {
              if (v11 == v16 && v13 == v18)
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
LABEL_23:
                if ((BCBatteryDevice.isHeadPhoneCase.getter() & 1) == 0)
                {
                  swift_bridgeObjectRelease();
                  return (id *)v4;
                }
              }
              else
              {
                uint64_t v3 = sub_1DADF6BB0();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if (v3) {
                  goto LABEL_23;
                }
              }

              goto LABEL_6;
            }
          }
          else if (!v18)
          {
            goto LABEL_23;
          }
        }
        else if (!v13)
        {
          goto LABEL_23;
        }

        swift_bridgeObjectRelease();
LABEL_6:
        unint64_t v4 = (unint64_t)v21;
        ++v6;
        uint64_t v7 = v14;
      }
      while (v9 != v5);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_1DADBCE34(unint64_t a1, void *a2)
{
  unint64_t v2 = a1;
  if (a1 >> 62)
  {
LABEL_31:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1DADF6B30();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      unint64_t v23 = v2;
      unint64_t v25 = v2 & 0xC000000000000001;
      uint64_t v4 = 4;
      uint64_t v5 = &selRef_CGColor;
      while (1)
      {
        if (v25) {
          id v6 = (id)MEMORY[0x1E0181F60](v4 - 4, v2);
        }
        else {
          id v6 = *(id *)(v2 + 8 * v4);
        }
        uint64_t v7 = v6;
        uint64_t v8 = v4 - 3;
        if (__OFADD__(v4 - 4, 1))
        {
          __break(1u);
          goto LABEL_31;
        }
        id v9 = [v6 v5[329]];
        if (v9) {
          break;
        }

LABEL_5:
        ++v4;
        if (v8 == v3) {
          goto LABEL_32;
        }
      }
      uint64_t v10 = v3;

      id v11 = [v7 v5[329]];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = sub_1DADF6840();
        uint64_t v15 = v14;
      }
      else
      {
        uint64_t v13 = 0;
        uint64_t v15 = 0;
      }
      id v16 = [a2 v5[329]];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = sub_1DADF6840();
        uint64_t v20 = v19;

        if (v15)
        {
          if (v20)
          {
            if (v13 == v18 && v15 == v20)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
            else
            {
              char v21 = sub_1DADF6BB0();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v21 & 1) == 0)
              {
LABEL_26:

                goto LABEL_27;
              }
            }
LABEL_25:
            if (BCBatteryDevice.isHeadPhoneCase.getter())
            {
              swift_bridgeObjectRelease();
              return v7;
            }
            goto LABEL_26;
          }
        }
        else if (!v20)
        {
          goto LABEL_25;
        }
      }
      else if (!v15)
      {
        goto LABEL_25;
      }

      swift_bridgeObjectRelease();
LABEL_27:
      uint64_t v3 = v10;
      unint64_t v2 = v23;
      uint64_t v5 = &selRef_CGColor;
      goto LABEL_5;
    }
  }
LABEL_32:
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_1DADBD074(unint64_t a1, void *a2)
{
  unint64_t v2 = a1;
  if (a1 >> 62)
  {
LABEL_31:
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1DADF6B30();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      unint64_t v23 = v2;
      unint64_t v25 = v2 & 0xC000000000000001;
      uint64_t v4 = 4;
      uint64_t v5 = &selRef_CGColor;
      while (1)
      {
        if (v25) {
          id v6 = (id)MEMORY[0x1E0181F60](v4 - 4, v2);
        }
        else {
          id v6 = *(id *)(v2 + 8 * v4);
        }
        uint64_t v7 = v6;
        uint64_t v8 = v4 - 3;
        if (__OFADD__(v4 - 4, 1))
        {
          __break(1u);
          goto LABEL_31;
        }
        id v9 = [v6 v5[329]];
        if (v9) {
          break;
        }

LABEL_5:
        ++v4;
        if (v8 == v3) {
          goto LABEL_32;
        }
      }
      uint64_t v10 = v3;

      id v11 = [v7 v5[329]];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = sub_1DADF6840();
        uint64_t v15 = v14;
      }
      else
      {
        uint64_t v13 = 0;
        uint64_t v15 = 0;
      }
      id v16 = [a2 v5[329]];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = sub_1DADF6840();
        uint64_t v20 = v19;

        if (v15)
        {
          if (v20)
          {
            if (v13 == v18 && v15 == v20)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
            else
            {
              char v21 = sub_1DADF6BB0();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v21 & 1) == 0)
              {
LABEL_26:

                goto LABEL_27;
              }
            }
LABEL_25:
            if ((BCBatteryDevice.isHeadPhoneCase.getter() & 1) == 0)
            {
              swift_bridgeObjectRelease();
              return v7;
            }
            goto LABEL_26;
          }
        }
        else if (!v20)
        {
          goto LABEL_25;
        }
      }
      else if (!v15)
      {
        goto LABEL_25;
      }

      swift_bridgeObjectRelease();
LABEL_27:
      uint64_t v3 = v10;
      unint64_t v2 = v23;
      uint64_t v5 = &selRef_CGColor;
      goto LABEL_5;
    }
  }
LABEL_32:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1DADBD2B4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1DADBD314@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADB8FBC((uint64_t *)(v1 + 16), a1, *(double *)(v1 + 72), *(double *)(v1 + 80));
}

uint64_t sub_1DADBD320(uint64_t a1)
{
  return a1;
}

uint64_t sub_1DADBD370()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1DADBD390()
{
  unint64_t result = qword_1EB6836B8;
  if (!qword_1EB6836B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6836B8);
  }
  return result;
}

unint64_t sub_1DADBD3E8()
{
  unint64_t result = qword_1EB6836B0;
  if (!qword_1EB6836B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6836B0);
  }
  return result;
}

unint64_t sub_1DADBD440()
{
  unint64_t result = qword_1EB6836A8;
  if (!qword_1EB6836A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6836A8);
  }
  return result;
}

uint64_t sub_1DADBD494()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADBD4B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADBD4CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for BatteryDisplayMode(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_1DADBD530(*(id *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

id sub_1DADBD530(id result, unsigned __int8 a2)
{
  if (a2 <= 1u) {
    return result;
  }
  return result;
}

void destroy for BatteryDisplayMode(uint64_t a1)
{
}

uint64_t assignWithCopy for BatteryDisplayMode(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  unsigned __int8 v4 = *(unsigned char *)(a2 + 8);
  sub_1DADBD530(*(id *)a2, v4);
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = v3;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v4;
  sub_1DADA73D4(v5, v6);
  return a1;
}

uint64_t assignWithTake for BatteryDisplayMode(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  unsigned __int8 v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  unsigned __int8 v5 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v3;
  sub_1DADA73D4(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for BatteryDisplayMode(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BatteryDisplayMode(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)unint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1DADBD674(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_1DADBD68C(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)unint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for BatteryDisplayMode()
{
  return &type metadata for BatteryDisplayMode;
}

ValueMetadata *type metadata accessor for Constants()
{
  return &type metadata for Constants;
}

void destroy for BatteryArchivableView(uint64_t a1)
{
  sub_1DADB6340(*(id *)a1, *(unsigned char *)(a1 + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  unint64_t v2 = *(void **)(a1 + 80);
}

uint64_t initializeWithCopy for BatteryArchivableView(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1DADB63C4(*(id *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  uint64_t v7 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  uint64_t v9 = *(void *)(a2 + 72);
  uint64_t v8 = *(void **)(a2 + 80);
  *(void *)(a1 + 72) = v9;
  *(void *)(a1 + 80) = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  id v10 = v8;
  return a1;
}

uint64_t assignWithCopy for BatteryArchivableView(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1DADB63C4(*(id *)a2, v5);
  uint64_t v6 = *(void **)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_1DADB6340(v6, v7);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  uint64_t v8 = *(void **)(a2 + 80);
  uint64_t v9 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = v8;
  id v10 = v8;

  return a1;
}

uint64_t assignWithTake for BatteryArchivableView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void **)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_1DADB6340(v6, v7);
  *(unsigned char *)(a1 + 16) = *((unsigned char *)a2 + 16);
  *(unsigned char *)(a1 + 17) = *((unsigned char *)a2 + 17);
  *(void *)(a1 + 24) = a2[3];
  uint64_t v8 = a2[5];
  *(void *)(a1 + 32) = a2[4];
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = a2[6];
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 7);
  swift_release();
  swift_release();
  uint64_t v9 = *(void **)(a1 + 80);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 9);

  return a1;
}

uint64_t getEnumTagSinglePayload for BatteryArchivableView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BatteryArchivableView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
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
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BatteryArchivableView()
{
  return &type metadata for BatteryArchivableView;
}

ValueMetadata *type metadata accessor for RectangularBatteriesWidgetEntryView()
{
  return &type metadata for RectangularBatteriesWidgetEntryView;
}

ValueMetadata *type metadata accessor for CircularBatteriesWidgetEntryView()
{
  return &type metadata for CircularBatteriesWidgetEntryView;
}

ValueMetadata *type metadata accessor for CustomProgressView()
{
  return &type metadata for CustomProgressView;
}

uint64_t sub_1DADBDA4C()
{
  return sub_1DADAD660(&qword_1EA8F8568, &qword_1EA8F8570);
}

uint64_t sub_1DADBDA88()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADBDB08()
{
  return sub_1DADAD660(&qword_1EA8F8510, &qword_1EA8F8518);
}

uint64_t sub_1DADBDB44()
{
  return sub_1DADAD660(&qword_1EA8F8828, &qword_1EA8F8830);
}

uint64_t sub_1DADBDB84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(sub_1DADF61D0() - 8);
  uint64_t v6 = v2 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1DADBA350(a1, v6, a2);
}

unint64_t sub_1DADBDC08()
{
  unint64_t result = qword_1EB6836A0;
  if (!qword_1EB6836A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6836A0);
  }
  return result;
}

uint64_t sub_1DADBDC5C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADB9EDC(*(void *)(v1 + 16), a1);
}

unint64_t sub_1DADBDC64()
{
  unint64_t result = qword_1EA8F8540;
  if (!qword_1EA8F8540)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8548);
    sub_1DADBDD04();
    sub_1DADAD660(&qword_1EA8F8588, &qword_1EA8F8590);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8540);
  }
  return result;
}

unint64_t sub_1DADBDD04()
{
  unint64_t result = qword_1EA8F85D0;
  if (!qword_1EA8F85D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F85C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F85D0);
  }
  return result;
}

unint64_t sub_1DADBDD70()
{
  unint64_t result = qword_1EA8F8528;
  if (!qword_1EA8F8528)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8530);
    sub_1DADAD660(&qword_1EA8F85B8, &qword_1EA8F85C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8528);
  }
  return result;
}

unint64_t sub_1DADBDE10()
{
  unint64_t result = qword_1EA8F8598;
  if (!qword_1EA8F8598)
  {
    sub_1DADF61F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8598);
  }
  return result;
}

uint64_t sub_1DADBDE68(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DADBDED0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1DADBDF30@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADB8360(*(char **)(v1 + 16), a1);
}

uint64_t sub_1DADBDF38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *(void *)(*(void *)(v1 + 16) + 48);
  sub_1DADADF98((uint64_t)&v4, (uint64_t)v5, &qword_1EA8F85C8);
  sub_1DADADF98((uint64_t)v5, a1, &qword_1EA8F85C8);
  return sub_1DADADEB0((uint64_t)v5);
}

unint64_t sub_1DADBDFB0()
{
  unint64_t result = qword_1EA8F8870;
  if (!qword_1EA8F8870)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8868);
    sub_1DADBE02C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8870);
  }
  return result;
}

unint64_t sub_1DADBE02C()
{
  unint64_t result = qword_1EA8F8878;
  if (!qword_1EA8F8878)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8880);
    sub_1DADBE0CC();
    sub_1DADAD660(&qword_1EB6829E8, &qword_1EB6829F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8878);
  }
  return result;
}

unint64_t sub_1DADBE0CC()
{
  unint64_t result = qword_1EA8F8888;
  if (!qword_1EA8F8888)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8890);
    sub_1DADAD660(&qword_1EA8F8588, &qword_1EA8F8590);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8888);
  }
  return result;
}

unint64_t sub_1DADBE16C()
{
  unint64_t result = qword_1EB682BC8;
  if (!qword_1EB682BC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB682BC8);
  }
  return result;
}

uint64_t sub_1DADBE1C0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1DADBE1D0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

unint64_t sub_1DADBE1E0()
{
  unint64_t result = qword_1EA8F88C8;
  if (!qword_1EA8F88C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F88C8);
  }
  return result;
}

uint64_t sub_1DADBE234(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 80);
  sub_1DADB6340(*(id *)a1, *(unsigned char *)(a1 + 8));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_1DADBE2A4(uint64_t a1)
{
  return a1;
}

unint64_t sub_1DADBE2F0()
{
  unint64_t result = qword_1EA8F8578;
  if (!qword_1EA8F8578)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8580);
    sub_1DADBE36C();
    sub_1DADBE3C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8578);
  }
  return result;
}

unint64_t sub_1DADBE36C()
{
  unint64_t result = qword_1EA8F84F8;
  if (!qword_1EA8F84F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F84F8);
  }
  return result;
}

unint64_t sub_1DADBE3C0()
{
  unint64_t result = qword_1EA8F8500;
  if (!qword_1EA8F8500)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8500);
  }
  return result;
}

uint64_t sub_1DADBE41C@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1DADBE474()
{
  sub_1DADF3A74();
  swift_bridgeObjectRetain();
  id v0 = (id)*sub_1DADF3B34();

  return sub_1DADF5BC0();
}

uint64_t sub_1DADBE4E8()
{
  return 3158065;
}

double sub_1DADBE4F8@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for BCUIChargeRingLabelView();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B78);
  MEMORY[0x1E0181A90](v11, v2);
  uint64_t v3 = v11[1];
  double result = *(double *)&v11[2];
  uint64_t v5 = v11[3];
  char v6 = v12;
  char v7 = v13;
  char v8 = v14;
  uint64_t v9 = v15;
  uint64_t v10 = v16;
  *(void *)a1 = v11[0];
  *(void *)(a1 + 8) = v3;
  *(double *)(a1 + 16) = result;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 33) = v7;
  *(unsigned char *)(a1 + 34) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  return result;
}

uint64_t type metadata accessor for BCUIChargeRingLabelView()
{
  uint64_t result = qword_1EB684240;
  if (!qword_1EB684240) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1DADBE60C()
{
  return sub_1DADF6620();
}

void (*sub_1DADBE6B8(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x108uLL);
  *a1 = v3;
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for BCUIChargeRingLabelView() + 24));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  v3[23] = *v4;
  v3[24] = v6;
  uint64_t v7 = v4[2];
  uint64_t v8 = v4[3];
  v3[25] = v7;
  v3[26] = v8;
  uint64_t v9 = v4[4];
  v3[27] = v9;
  uint64_t v10 = v4[5];
  char v11 = *((unsigned char *)v4 + 48);
  *((unsigned char *)v3 + 256) = v11;
  char v12 = *((unsigned char *)v4 + 49);
  *((unsigned char *)v3 + 257) = v12;
  char v13 = *((unsigned char *)v4 + 50);
  *((unsigned char *)v3 + 258) = v13;
  uint64_t v14 = v4[7];
  uint64_t v15 = v4[8];
  v3[28] = v10;
  v3[29] = v14;
  v3[30] = v15;
  *uint64_t v3 = v5;
  v3[1] = v6;
  v3[2] = v7;
  v3[3] = v8;
  v3[4] = v9;
  v3[5] = v10;
  *((unsigned char *)v3 + 48) = v11;
  *((unsigned char *)v3 + 49) = v12;
  *((unsigned char *)v3 + 50) = v13;
  v3[7] = v14;
  v3[8] = v15;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v3[31] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B78);
  MEMORY[0x1E0181A90]();
  return sub_1DADBE7D0;
}

void sub_1DADBE7D0(uint64_t a1, char a2)
{
  uint64_t v2 = *(unsigned char **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 72);
  uint64_t v4 = *(void *)a1 + 256;
  uint64_t v5 = *(void *)(*(void *)a1 + 80);
  uint64_t v6 = *(void *)(*(void *)a1 + 88);
  uint64_t v7 = *(void *)(*(void *)a1 + 96);
  char v8 = v2[104];
  char v9 = v2[105];
  char v10 = v2[106];
  uint64_t v11 = *((void *)v2 + 14);
  uint64_t v12 = *((void *)v2 + 15);
  uint64_t v13 = *((void *)v2 + 30);
  char v14 = *(unsigned char *)(v4 + 2);
  LOBYTE(v4) = *(unsigned char *)(v4 + 1);
  char v15 = v2[256];
  uint64_t v17 = *((void *)v2 + 28);
  uint64_t v16 = *((void *)v2 + 29);
  uint64_t v18 = *((void *)v2 + 27);
  uint64_t v19 = *((void *)v2 + 25);
  uint64_t v20 = *((void *)v2 + 26);
  uint64_t v22 = *((void *)v2 + 23);
  uint64_t v21 = *((void *)v2 + 24);
  *((void *)v2 + 16) = v3;
  *(void *)uint64_t v2 = v22;
  *((void *)v2 + 1) = v21;
  *((void *)v2 + 2) = v19;
  *((void *)v2 + 3) = v20;
  *((void *)v2 + 4) = v18;
  *((void *)v2 + 5) = v17;
  v2[48] = v15;
  v2[49] = v4;
  v2[50] = v14;
  *((void *)v2 + 7) = v16;
  *((void *)v2 + 8) = v13;
  *((void *)v2 + 17) = v5;
  *((void *)v2 + 18) = v6;
  *((void *)v2 + 19) = v7;
  v2[160] = v8;
  v2[161] = v9;
  v2[162] = v10;
  *((void *)v2 + 21) = v11;
  *((void *)v2 + 22) = v12;
  if (a2)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1DADF6620();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    sub_1DADF6620();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
  }

  free(v2);
}

double sub_1DADBE954@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for BCUIChargeRingLabelView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B78);
  sub_1DADF6640();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(unsigned char *)(a1 + 48) = v8;
  *(unsigned char *)(a1 + 49) = v9;
  *(unsigned char *)(a1 + 50) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v12;
  return result;
}

uint64_t sub_1DADBEA24()
{
  return sub_1DADBED7C(MEMORY[0x1E4F3EE08]);
}

uint64_t sub_1DADBEA3C(uint64_t a1)
{
  uint64_t v2 = sub_1DADF5D80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BCUIChargeRingLabelView();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  sub_1DADF6620();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1DADBEB48(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = sub_1DADF5D80();
  *uint64_t v3 = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[1] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[2] = malloc(v6);
  v3[3] = malloc(v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  v3[4] = v7;
  char v8 = malloc(*(void *)(*(void *)(v7 - 8) + 64));
  v3[5] = v8;
  uint64_t v9 = type metadata accessor for BCUIChargeRingLabelView();
  sub_1DADAE0AC(v1 + *(int *)(v9 + 28), (uint64_t)v8, &qword_1EB682B88);
  MEMORY[0x1E0181A90](v7);
  return sub_1DADBEC7C;
}

void sub_1DADBEC7C(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(*(void *)a1 + 40);
  uint64_t v4 = *(void **)(*(void *)a1 + 16);
  uint64_t v5 = *(void **)(*(void *)a1 + 24);
  if (a2)
  {
    uint64_t v6 = *v2;
    uint64_t v7 = v2[1];
    (*(void (**)(void, void *, void))(v7 + 16))(*(void *)(*(void *)a1 + 16), v5, *v2);
    sub_1DADF6620();
    sub_1DADADF3C((uint64_t)v3, &qword_1EB682B88);
    (*(void (**)(void *, uint64_t))(v7 + 8))(v5, v6);
  }
  else
  {
    sub_1DADF6620();
    sub_1DADADF3C((uint64_t)v3, &qword_1EB682B88);
  }
  free(v3);
  free(v5);
  free(v4);

  free(v2);
}

uint64_t sub_1DADBED64()
{
  return sub_1DADBED7C(MEMORY[0x1E4F3EE10]);
}

uint64_t sub_1DADBED7C(uint64_t (*a1)(uint64_t))
{
  type metadata accessor for BCUIChargeRingLabelView();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  return a1(v2);
}

uint64_t sub_1DADBEDD0(double a1)
{
  uint64_t v2 = sub_1DADF6310();
  MEMORY[0x1F4188790](v2);
  *(double *)&v6[1] = a1;
  (*(void (**)(char *, void))(v4 + 104))((char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x1E4F3E140]);
  sub_1DADB2BCC();
  return sub_1DADF5C50();
}

double sub_1DADBEEC0()
{
  type metadata accessor for BCUIChargeRingLabelView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  sub_1DADF5C70();
  return v1;
}

uint64_t sub_1DADBEF0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v102 = a1;
  uint64_t v101 = sub_1DADF61B0() - 8;
  MEMORY[0x1F4188790](v101);
  uint64_t v100 = (char *)&v82 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = sub_1DADF5E80();
  uint64_t v98 = *(void *)(v99 - 8);
  MEMORY[0x1F4188790](v99);
  uint64_t v97 = (char *)&v82 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = sub_1DADF6790();
  uint64_t v87 = *(void *)(v88 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v88);
  uint64_t v85 = (char *)&v82 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v83 = (uint64_t)&v82 - v6;
  uint64_t v7 = sub_1DADF5D80();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  char v10 = (char *)&v82 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A20);
  uint64_t v91 = *(void *)(v92 - 8);
  MEMORY[0x1F4188790](v92);
  uint64_t v84 = (uint64_t)&v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6827B0) - 8;
  MEMORY[0x1F4188790](v89);
  uint64_t v86 = (char *)&v82 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682850) - 8;
  MEMORY[0x1F4188790](v95);
  uint64_t v93 = (uint64_t)&v82 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F83D0);
  MEMORY[0x1F4188790](v96);
  uint64_t v94 = (uint64_t)&v82 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for BCUIChargeRingLabelView();
  uint64_t v82 = v15;
  uint64_t v103 = v1;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1E0181A90](v16);
  char v17 = sub_1DADF301C();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v18 = (long long *)(v1 + *(int *)(v15 + 24));
  uint64_t v19 = *((void *)v18 + 2);
  uint64_t v20 = *((void *)v18 + 3);
  uint64_t v21 = *((void *)v18 + 4);
  uint64_t v22 = *((void *)v18 + 5);
  char v23 = *((unsigned char *)v18 + 48);
  char v24 = *((unsigned char *)v18 + 49);
  char v25 = *((unsigned char *)v18 + 50);
  uint64_t v26 = *((void *)v18 + 7);
  uint64_t v27 = *((void *)v18 + 8);
  long long v104 = *v18;
  uint64_t v105 = v19;
  uint64_t v106 = v20;
  uint64_t v107 = v21;
  uint64_t v108 = v22;
  char v109 = v23;
  char v110 = v24;
  char v111 = v25;
  uint64_t v112 = v26;
  uint64_t v113 = v27;
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B78);
  MEMORY[0x1E0181A90](v114);
  double v28 = *(double *)&v114[2];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  double v29 = sub_1DADF3650(v28);
  *(void *)&long long v104 = sub_1DADBFF68(v17 & 1, v29);
  *((void *)&v104 + 1) = v30;
  sub_1DADBE16C();
  uint64_t v31 = sub_1DADF6350();
  uint64_t v33 = v32;
  char v35 = v34 & 1;
  sub_1DADF62E0();
  uint64_t v36 = sub_1DADF6330();
  uint64_t v38 = v37;
  LOBYTE(v15) = v39;
  uint64_t v41 = v40;
  swift_release();
  sub_1DADBE1C0(v31, v33, v35);
  swift_bridgeObjectRelease();
  *(void *)&long long v104 = v36;
  *((void *)&v104 + 1) = v38;
  LOBYTE(v105) = v15 & 1;
  uint64_t v106 = v41;
  uint64_t v42 = v83;
  sub_1DADBFCDC(v83);
  unint64_t v43 = v85;
  sub_1DADF6780();
  uint64_t v44 = v43;
  LOBYTE(v43) = sub_1DADF6770();
  uint64_t v45 = *(void (**)(char *, uint64_t))(v87 + 8);
  uint64_t v46 = v44;
  uint64_t v47 = v88;
  v45(v46, v88);
  v45((char *)v42, v47);
  uint64_t v48 = *sub_1DADF3990();
  swift_retain();
  uint64_t v49 = v84;
  sub_1DADF19B8(v43 & 1, v48, MEMORY[0x1E4F3E2F8], MEMORY[0x1E4F3E2E8], v84);
  swift_release();
  sub_1DADBE1C0(v104, *((uint64_t *)&v104 + 1), v105);
  swift_bridgeObjectRelease();
  uint64_t v50 = v97;
  sub_1DADF5E60();
  uint64_t v51 = *sub_1DADF3900();
  uint64_t v52 = v98;
  uint64_t v53 = (uint64_t)v100;
  uint64_t v54 = v99;
  (*(void (**)(char *, char *, uint64_t))(v98 + 16))(v100, v50, v99);
  uint64_t v55 = v101;
  *(void *)(v53 + *(int *)(v101 + 28)) = v51;
  *(_DWORD *)(v53 + *(int *)(v55 + 32)) = 0;
  uint64_t v56 = v91;
  uint64_t v57 = (uint64_t)v86;
  uint64_t v58 = v92;
  (*(void (**)(char *, uint64_t, uint64_t))(v91 + 16))(v86, v49, v92);
  sub_1DADC0228(v53, v57 + *(int *)(v89 + 44));
  swift_retain();
  sub_1DADC028C(v53);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v50, v54);
  (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v49, v58);
  LOBYTE(v51) = sub_1DADF6280();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  sub_1DADF5C70();
  sub_1DADF5BE0();
  uint64_t v60 = v59;
  uint64_t v62 = v61;
  uint64_t v64 = v63;
  uint64_t v66 = v65;
  uint64_t v67 = v93;
  sub_1DADAE0AC(v57, v93, &qword_1EB6827B0);
  uint64_t v68 = v67 + *(int *)(v95 + 44);
  *(unsigned char *)uint64_t v68 = v51;
  *(void *)(v68 + 8) = v60;
  *(void *)(v68 + 16) = v62;
  *(void *)(v68 + 24) = v64;
  *(void *)(v68 + 32) = v66;
  *(unsigned char *)(v68 + 40) = 0;
  sub_1DADADF3C(v57, &qword_1EB6827B0);
  uint64_t v69 = v94;
  sub_1DADAE0AC(v67, v94, &qword_1EB682850);
  uint64_t v70 = v96;
  *(_WORD *)(v69 + *(int *)(v96 + 36)) = 257;
  sub_1DADADF3C(v67, &qword_1EB682850);
  uint64_t v71 = *((void *)v18 + 2);
  uint64_t v72 = *((void *)v18 + 3);
  uint64_t v73 = *((void *)v18 + 4);
  uint64_t v74 = *((void *)v18 + 5);
  char v75 = *((unsigned char *)v18 + 48);
  char v76 = *((unsigned char *)v18 + 49);
  char v77 = *((unsigned char *)v18 + 50);
  uint64_t v78 = *((void *)v18 + 7);
  uint64_t v79 = *((void *)v18 + 8);
  long long v104 = *v18;
  uint64_t v105 = v71;
  uint64_t v106 = v72;
  uint64_t v107 = v73;
  uint64_t v108 = v74;
  char v109 = v75;
  char v110 = v76;
  char v111 = v77;
  uint64_t v112 = v78;
  uint64_t v113 = v79;
  MEMORY[0x1E0181A90](v114, v90);
  LOBYTE(v51) = sub_1DADB0E24();
  sub_1DADC02E8((uint64_t)v114);
  uint64_t v80 = sub_1DADC0364(&qword_1EA8F83C8, &qword_1EA8F83D0, (void (*)(void))sub_1DADC0334);
  sub_1DADF0ACC(v51 & 1, v70, v80, v102);
  return sub_1DADADF3C(v69, &qword_1EA8F83D0);
}

uint64_t sub_1DADBF7FC()
{
  uint64_t v1 = sub_1DADF5D80();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for BCUIChargeRingLabelView();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1E0181A90](v6);
  char v7 = sub_1DADF301C();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  uint64_t v8 = (long long *)(v0 + *(int *)(v5 + 24));
  long long v9 = *v8;
  uint64_t v10 = *((void *)v8 + 2);
  uint64_t v11 = *((void *)v8 + 3);
  uint64_t v12 = *((void *)v8 + 4);
  uint64_t v13 = *((void *)v8 + 5);
  char v14 = *((unsigned char *)v8 + 48);
  char v15 = *((unsigned char *)v8 + 49);
  char v16 = *((unsigned char *)v8 + 50);
  uint64_t v18 = *((void *)v8 + 7);
  uint64_t v17 = *((void *)v8 + 8);
  long long v23 = v9;
  uint64_t v24 = v10;
  uint64_t v25 = v11;
  uint64_t v26 = v12;
  uint64_t v27 = v13;
  char v28 = v14;
  char v29 = v15;
  char v30 = v16;
  uint64_t v31 = v18;
  uint64_t v32 = v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B78);
  MEMORY[0x1E0181A90](v33, v19);
  double v20 = *(double *)&v33[2];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  double v21 = sub_1DADF3650(v20);
  return sub_1DADBFF68(v7 & 1, v21);
}

double sub_1DADBF99C()
{
  return *(double *)sub_1DADF3BF0();
}

uint64_t sub_1DADBF9B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>, uint64_t a4@<D0>)
{
  v18[0] = a2;
  uint64_t v7 = sub_1DADF6310();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a3 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = (int *)type metadata accessor for BCUIChargeRingLabelView();
  uint64_t v12 = v11[5];
  sub_1DADF3A74();
  swift_bridgeObjectRetain();
  id v13 = (id)*sub_1DADF3B34();
  *(uint64_t *)((char *)a3 + v12) = sub_1DADF5BC0();
  char v14 = (char *)a3 + v11[6];
  long long v15 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v14 + 2) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v14 + 3) = v15;
  *((void *)v14 + 8) = *(void *)(a1 + 64);
  long long v16 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)char v14 = *(_OWORD *)a1;
  *((_OWORD *)v14 + 1) = v16;
  sub_1DADC048C(v18[0], (uint64_t)a3 + v11[7]);
  v18[1] = a4;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E4F3E140], v7);
  sub_1DADB2BCC();
  return sub_1DADF5C50();
}

double sub_1DADBFB88(double a1)
{
  return -a1;
}

uint64_t sub_1DADBFB90()
{
  uint64_t v0 = sub_1DADF5D80();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BCUIChargeRingLabelView();
  sub_1DADF5BD0();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1E0181A90](v4);
  sub_1DADF301C();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_1DADF6870();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1DADBFCDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1DADF6030();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DADAE0AC(v2, (uint64_t)v10, &qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_1DADF6790();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_1DADF69F0();
    char v14 = sub_1DADF6200();
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v18 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)(v15 + 4) = sub_1DADA5DB0(0xD000000000000013, 0x80000001DADFAD40, &v18);
      _os_log_impl(&dword_1DAD96000, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1E01829D0](v16, -1, -1);
      MEMORY[0x1E01829D0](v15, -1, -1);
    }

    sub_1DADF6020();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_1DADBFF68(char a1, double a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F18);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1DADF5A60();
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6825F8);
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    double v15 = a2;
    sub_1DADF5A50();
    sub_1DADB2BCC();
    sub_1DADF5A40();
    sub_1DADAD660(&qword_1EB6825F0, &qword_1EB6825F8);
    sub_1DADF67B0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  else
  {
    double v15 = a2 * 100.0;
    sub_1DADF5A50();
    sub_1DADB2BCC();
    sub_1DADF5A30();
    sub_1DADAD660(&qword_1EB682F10, &qword_1EB682F18);
    sub_1DADF67B0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return v16;
}

uint64_t sub_1DADC0228(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1DADF61B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADC028C(uint64_t a1)
{
  uint64_t v2 = sub_1DADF61B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DADC02E8(uint64_t a1)
{
  return a1;
}

uint64_t sub_1DADC0334()
{
  return sub_1DADC0364(&qword_1EB682848, &qword_1EB682850, (void (*)(void))sub_1DADC03E0);
}

uint64_t sub_1DADC0364(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1DADC03E0()
{
  unint64_t result = qword_1EB6827A8;
  if (!qword_1EB6827A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB6827B0);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6827A8);
  }
  return result;
}

uint64_t sub_1DADC048C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADC04F4()
{
  return swift_getOpaqueTypeConformance2();
}

void *sub_1DADC0510(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1DADF6790();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[6];
    *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = *((void *)v11 + 1);
    *(void *)uint64_t v10 = *(void *)v11;
    *((void *)v10 + 1) = v12;
    uint64_t v13 = *((void *)v11 + 3);
    *((void *)v10 + 2) = *((void *)v11 + 2);
    *((void *)v10 + 3) = v13;
    uint64_t v14 = *((void *)v11 + 5);
    *((void *)v10 + 4) = *((void *)v11 + 4);
    *((void *)v10 + 5) = v14;
    v10[48] = v11[48];
    v10[49] = v11[49];
    v10[50] = v11[50];
    uint64_t v15 = *((void *)v11 + 8);
    *((void *)v10 + 7) = *((void *)v11 + 7);
    *((void *)v10 + 8) = v15;
    uint64_t v16 = a3[7];
    char v29 = a2;
    char v30 = a3;
    uint64_t v17 = (void *)((char *)a1 + v16);
    uint64_t v18 = (void *)((char *)a2 + v16);
    uint64_t v19 = v18[1];
    *uint64_t v17 = *v18;
    v17[1] = v19;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    uint64_t v20 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
    double v21 = (char *)v17 + v20;
    uint64_t v22 = (char *)v18 + v20;
    uint64_t v23 = sub_1DADF5D80();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    uint64_t v24 = v30[8];
    uint64_t v25 = (char *)a1 + v24;
    uint64_t v26 = (char *)v29 + v24;
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
  }
  return a1;
}

uint64_t sub_1DADC0784(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1DADF6790();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 28);
  swift_release();
  swift_release();
  uint64_t v6 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v7 = sub_1DADF5D80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + *(int *)(a2 + 32);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);

  return v10(v8, v9);
}

void *sub_1DADC0904(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1DADF6790();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[6];
  *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *((void *)v9 + 1);
  *(void *)uint64_t v8 = *(void *)v9;
  *((void *)v8 + 1) = v10;
  uint64_t v11 = *((void *)v9 + 3);
  *((void *)v8 + 2) = *((void *)v9 + 2);
  *((void *)v8 + 3) = v11;
  uint64_t v12 = *((void *)v9 + 5);
  *((void *)v8 + 4) = *((void *)v9 + 4);
  *((void *)v8 + 5) = v12;
  v8[48] = v9[48];
  v8[49] = v9[49];
  v8[50] = v9[50];
  uint64_t v13 = *((void *)v9 + 8);
  *((void *)v8 + 7) = *((void *)v9 + 7);
  *((void *)v8 + 8) = v13;
  uint64_t v14 = a3[7];
  uint64_t v27 = a2;
  char v28 = a3;
  uint64_t v15 = (void *)((char *)a1 + v14);
  uint64_t v16 = (void *)((char *)a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v19 = (char *)v15 + v18;
  uint64_t v20 = (char *)v16 + v18;
  uint64_t v21 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  uint64_t v22 = v28[8];
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)v27 + v22;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
  return a1;
}

void *sub_1DADC0B28(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1DADADF3C((uint64_t)a1, &qword_1EB682F58);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1DADF6790();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(void *)((char *)a1 + a3[5]) = *(void *)((char *)a2 + a3[5]);
  swift_retain();
  swift_release();
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  swift_retain();
  swift_release();
  *((void *)v8 + 1) = *((void *)v9 + 1);
  swift_retain();
  swift_release();
  *((void *)v8 + 2) = *((void *)v9 + 2);
  *((void *)v8 + 3) = *((void *)v9 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v8 + 4) = *((void *)v9 + 4);
  *((void *)v8 + 5) = *((void *)v9 + 5);
  swift_retain();
  swift_release();
  v8[48] = v9[48];
  v8[49] = v9[49];
  v8[50] = v9[50];
  *((void *)v8 + 7) = *((void *)v9 + 7);
  *((void *)v8 + 8) = *((void *)v9 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[7];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  swift_retain();
  swift_release();
  *((void *)v11 + 1) = *((void *)v12 + 1);
  swift_retain();
  swift_release();
  uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v14 = &v11[v13];
  uint64_t v15 = &v12[v13];
  uint64_t v16 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  uint64_t v17 = a3[8];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 24))(v18, v19, v20);
  return a1;
}

char *sub_1DADC0DB4(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1DADF6790();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  long long v11 = *((_OWORD *)v10 + 3);
  *((_OWORD *)v9 + 2) = *((_OWORD *)v10 + 2);
  *((_OWORD *)v9 + 3) = v11;
  *((void *)v9 + 8) = *((void *)v10 + 8);
  long long v12 = *((_OWORD *)v10 + 1);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *((_OWORD *)v9 + 1) = v12;
  uint64_t v13 = a3[7];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = *(void *)&a2[v13 + 8];
  *(void *)uint64_t v14 = *(void *)&a2[v13];
  *((void *)v14 + 1) = v16;
  uint64_t v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v18 = &v14[v17];
  uint64_t v19 = &v15[v17];
  uint64_t v20 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
  uint64_t v21 = a3[8];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 32))(v22, v23, v24);
  return a1;
}

char *sub_1DADC0F64(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1DADADF3C((uint64_t)a1, &qword_1EB682F58);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1DADF6790();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  *(void *)&a1[a3[5]] = *(void *)&a2[a3[5]];
  swift_release();
  uint64_t v8 = a3[6];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  swift_release();
  *((void *)v9 + 1) = *((void *)v10 + 1);
  swift_release();
  uint64_t v11 = *((void *)v10 + 3);
  *((void *)v9 + 2) = *((void *)v10 + 2);
  *((void *)v9 + 3) = v11;
  swift_bridgeObjectRelease();
  *((void *)v9 + 4) = *((void *)v10 + 4);
  *((void *)v9 + 5) = *((void *)v10 + 5);
  swift_release();
  v9[48] = v10[48];
  v9[49] = v10[49];
  v9[50] = v10[50];
  uint64_t v12 = *((void *)v10 + 8);
  *((void *)v9 + 7) = *((void *)v10 + 7);
  *((void *)v9 + 8) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  *(void *)&a1[v13] = *(void *)&a2[v13];
  swift_release();
  *((void *)v14 + 1) = *((void *)v15 + 1);
  swift_release();
  uint64_t v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v17 = &v14[v16];
  uint64_t v18 = &v15[v16];
  uint64_t v19 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  uint64_t v20 = a3[8];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 40))(v21, v22, v23);
  return a1;
}

uint64_t sub_1DADC11A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DADC11BC);
}

uint64_t sub_1DADC11BC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_9:
    return v9(v10, a2, v8);
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v11 = *(void *)(a1 + a3[5]);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
    uint64_t v14 = *(void *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a2)
    {
      uint64_t v8 = v13;
      uint64_t v10 = a1 + a3[7];
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
      goto LABEL_9;
    }
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[8];
    return v16(v18, a2, v17);
  }
}

uint64_t sub_1DADC1348(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DADC135C);
}

uint64_t sub_1DADC135C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_7:
    return v11(v12, a2, a2, v10);
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[5]) = (a2 - 1);
    return result;
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + a4[7];
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_7;
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a4[8];

  return v16(v18, a2, a2, v17);
}

void sub_1DADC14E8()
{
  sub_1DADC1664(319, (unint64_t *)&qword_1EB683638, MEMORY[0x1E4F46AE8], MEMORY[0x1E4F3C648]);
  if (v0 <= 0x3F)
  {
    sub_1DADC1664(319, &qword_1EB682B90, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3EE18]);
    if (v1 <= 0x3F)
    {
      sub_1DADB4B24();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_1DADC1664(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1DADC16C8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADC1758(uint64_t a1, char a2)
{
  uint64_t v4 = sub_1DADF6030();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return a1 & 1;
  }
  swift_retain();
  os_log_type_t v8 = sub_1DADF69F0();
  uint64_t v9 = sub_1DADF6200();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    uint64_t v13 = v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = sub_1DADA5DB0(1819242306, 0xE400000000000000, &v13);
    _os_log_impl(&dword_1DAD96000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E01829D0](v11, -1, -1);
    MEMORY[0x1E01829D0](v10, -1, -1);
  }

  sub_1DADF6020();
  swift_getAtKeyPath();
  sub_1DADABA40(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_1DADC1934()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for BCUI2x2AvocadoView(0) + 20);
  uint64_t v2 = *(void *)v1;
  char v3 = *(unsigned char *)(v1 + 8);
  sub_1DADAB7C8(*(void *)v1, v3);
  char v4 = sub_1DADC1758(v2, v3);
  sub_1DADABA40(v2, v3);
  return v4 & 1;
}

uint64_t type metadata accessor for BCUI2x2AvocadoView(uint64_t a1)
{
  return sub_1DADAD54C(a1, qword_1EB683990);
}

uint64_t sub_1DADC19BC()
{
  sub_1DADF5FA0();
  sub_1DADCA89C(&qword_1EA8F83E0, MEMORY[0x1E4F468D8]);
  sub_1DADF6040();
  return v1;
}

uint64_t sub_1DADC1A38@<X0>(unsigned char *a1@<X8>)
{
  sub_1DADF5FA0();
  sub_1DADCA89C(&qword_1EA8F83E0, MEMORY[0x1E4F468D8]);
  uint64_t result = sub_1DADF6040();
  *a1 = v3;
  return result;
}

uint64_t sub_1DADC1AC8()
{
  type metadata accessor for AvocadoViewModel();
  sub_1DADCA89C(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);

  return sub_1DADF5D40();
}

uint64_t sub_1DADC1B44()
{
  type metadata accessor for BCUI2x2AvocadoView(0);

  return swift_retain();
}

uint64_t sub_1DADC1B7C(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for BCUI2x2AvocadoView(0) + 24);
  uint64_t result = swift_release();
  *(void *)(v3 + 8) = a1;
  return result;
}

uint64_t (*sub_1DADC1BB8())()
{
  return nullsub_1;
}

uint64_t sub_1DADC1C04()
{
  type metadata accessor for BCUI2x2AvocadoView(0);
  type metadata accessor for AvocadoViewModel();
  sub_1DADCA89C(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);

  return sub_1DADF5D50();
}

double sub_1DADC1CA0()
{
  type metadata accessor for BCUI2x2AvocadoView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  sub_1DADF5C70();
  return v1;
}

double sub_1DADC1CEC()
{
  type metadata accessor for BCUI2x2AvocadoView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  sub_1DADF5C70();
  return v1;
}

double sub_1DADC1D38()
{
  return 46.0;
}

double sub_1DADC1D44()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1DADF5D80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for BCUI2x2AvocadoView(0);
  uint64_t v7 = v0 + *(int *)(v6 + 20);
  uint64_t v8 = *(void *)v7;
  char v9 = *(unsigned char *)(v7 + 8);
  sub_1DADAB7C8(*(void *)v7, v9);
  char v10 = sub_1DADC1758(v8, v9);
  sub_1DADABA40(v8, v9);
  uint64_t v11 = *(void (**)(uint64_t))(**(void **)(v1 + *(int *)(v6 + 24) + 8) + 360);
  uint64_t v12 = swift_retain();
  v11(v12);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  sub_1DADF5C70();
  double v13 = v20;
  sub_1DADF5C70();
  double v14 = 12.0;
  if ((v10 & 1) == 0)
  {
    double v15 = v20;
    double v16 = sub_1DADDF288(0, v13);
    double v17 = sub_1DADCC67C(0, v15);
    double v14 = 0.0;
    if (v17 < v16) {
      double v14 = (v16 - v17) * 0.5;
    }
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v14;
}

double sub_1DADC1F48()
{
  return 1.0;
}

double sub_1DADC1F50()
{
  return 0.0;
}

uint64_t sub_1DADC1F58()
{
  sub_1DADF65D0();
  return v1;
}

uint64_t sub_1DADC1F94()
{
  return sub_1DADF65F0();
}

uint64_t sub_1DADC20B4(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for BCUI2x2AvocadoView(0);
  MEMORY[0x1F4188790](v4);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DADCA0FC(a1, (uint64_t)v6, type metadata accessor for BCUI2x2AvocadoView);
  if (a2)
  {
    uint64_t v7 = &v6[*(int *)(v4 + 20)];
    uint64_t v8 = *(void *)v7;
    char v9 = v7[8];
    sub_1DADAB7C8(*(void *)v7, v9);
    char v10 = sub_1DADC1758(v8, v9);
    sub_1DADABA40(v8, v9);
    sub_1DADCA164((uint64_t)v6, type metadata accessor for BCUI2x2AvocadoView);
    double v11 = 0.0;
    if ((v10 & 1) == 0) {
      double v11 = sub_1DADC1D44();
    }
  }
  else
  {
    sub_1DADCA164((uint64_t)v6, type metadata accessor for BCUI2x2AvocadoView);
    double v11 = 0.0;
  }
  uint64_t v12 = (uint64_t *)(a1 + *(int *)(v4 + 56));
  uint64_t v13 = *v12;
  uint64_t v14 = v12[1];
  *(double *)&v16[1] = v11;
  v16[2] = v13;
  _OWORD v16[3] = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A90);
  return sub_1DADF65F0();
}

uint64_t sub_1DADC2218@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_1DADF66D0();
  a1[1] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682708);
  return sub_1DADC225C(v1, (uint64_t)a1 + *(int *)(v4 + 44));
}

uint64_t sub_1DADC225C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v105 = a2;
  uint64_t v3 = type metadata accessor for BCUI2x2AvocadoView(0);
  uint64_t v106 = *(void *)(v3 - 8);
  uint64_t v90 = *(void *)(v106 + 64);
  MEMORY[0x1F4188790](v3);
  uint64_t v89 = (uint64_t)v88 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682AF0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)v88 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6827F8);
  uint64_t v9 = v8 - 8;
  MEMORY[0x1F4188790](v8);
  double v11 = (char *)v88 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682868);
  MEMORY[0x1F4188790](v107);
  uint64_t v108 = (uint64_t)v88 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A70);
  uint64_t v92 = *(void *)(v99 - 8);
  MEMORY[0x1F4188790](v99);
  uint64_t v91 = (char *)v88 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A78);
  uint64_t v98 = *(void *)(v101 - 8);
  MEMORY[0x1F4188790](v101);
  uint64_t v96 = (char *)v88 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A10);
  uint64_t v103 = *(void *)(v15 - 8);
  uint64_t v104 = v15;
  uint64_t v16 = MEMORY[0x1F4188790](v15);
  uint64_t v102 = (char *)v88 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  uint64_t v95 = (char *)v88 - v19;
  MEMORY[0x1F4188790](v18);
  uint64_t v100 = (char *)v88 - v20;
  uint64_t v21 = type metadata accessor for BCUI2x2PlaceholderMask(0);
  uint64_t v22 = MEMORY[0x1F4188790](v21);
  uint64_t v97 = (uint64_t)v88 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v22);
  uint64_t v25 = (char *)v88 - v24;
  uint64_t v93 = v3;
  uint64_t v26 = a1 + *(int *)(v3 + 24);
  uint64_t KeyPath = swift_getKeyPath();
  swift_retain();
  uint64_t v28 = *(void *)sub_1DADF3C04();
  uint64_t v29 = *(void *)sub_1DADF3C20();
  *(void *)uint64_t v25 = KeyPath;
  v25[8] = 0;
  type metadata accessor for AvocadoViewModel();
  sub_1DADCA89C(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
  *((void *)v25 + 2) = sub_1DADF5D40();
  *((void *)v25 + 3) = v30;
  uint64_t v109 = v28;
  sub_1DADB2BCC();
  sub_1DADF5C60();
  uint64_t v94 = v25;
  uint64_t v109 = v29;
  sub_1DADF5C60();
  *(void *)uint64_t v7 = sub_1DADF6120();
  *((void *)v7 + 1) = 0;
  v7[16] = 0;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826F8);
  sub_1DADC2D34(a1, (uint64_t)&v7[*(int *)(v31 + 44)]);
  sub_1DADC1D44();
  char v32 = sub_1DADF6220();
  sub_1DADF5BE0();
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  sub_1DADAE0AC((uint64_t)v7, (uint64_t)v11, &qword_1EB682AF0);
  uint64_t v41 = &v11[*(int *)(v9 + 44)];
  char *v41 = v32;
  *((void *)v41 + 1) = v34;
  *((void *)v41 + 2) = v36;
  *((void *)v41 + 3) = v38;
  *((void *)v41 + 4) = v40;
  v41[40] = 0;
  sub_1DADADF3C((uint64_t)v7, &qword_1EB682AF0);
  uint64_t v42 = v89;
  sub_1DADCA0FC(a1, v89, type metadata accessor for BCUI2x2AvocadoView);
  uint64_t v43 = *(unsigned __int8 *)(v106 + 80);
  uint64_t v44 = (v43 + 16) & ~v43;
  v88[1] = (uint64_t (*)(void))(v43 | 7);
  uint64_t v45 = swift_allocObject();
  uint64_t v106 = v44;
  uint64_t v46 = v42;
  sub_1DADCA2A4(v42, v45 + v44);
  uint64_t v47 = v108;
  sub_1DADAE0AC((uint64_t)v11, v108, &qword_1EB6827F8);
  uint64_t v48 = (uint64_t (**)())(v47 + *(int *)(v107 + 36));
  *uint64_t v48 = sub_1DADCA308;
  v48[1] = (uint64_t (*)())v45;
  v48[2] = 0;
  v48[3] = 0;
  sub_1DADADF3C((uint64_t)v11, &qword_1EB6827F8);
  uint64_t v90 = v26;
  uint64_t v49 = *(uint64_t (**)(uint64_t))(**(void **)(v26 + 8) + 168);
  uint64_t v50 = swift_retain();
  unint64_t v51 = v49(v50);
  swift_release();
  if (v51 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v52 = sub_1DADF6B30();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v52 = *(void *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  LOBYTE(v109) = v52 == 1;
  v88[0] = type metadata accessor for BCUI2x2AvocadoView;
  sub_1DADCA0FC(a1, v46, type metadata accessor for BCUI2x2AvocadoView);
  uint64_t v53 = swift_allocObject();
  sub_1DADCA2A4(v46, v53 + v106);
  unint64_t v54 = sub_1DADCA474();
  uint64_t v55 = v91;
  uint64_t v57 = v107;
  uint64_t v56 = v108;
  sub_1DADF6460();
  swift_release();
  sub_1DADADF3C(v56, &qword_1EB682868);
  uint64_t v58 = a1 + *(int *)(v93 + 20);
  uint64_t v59 = *(void *)v58;
  char v60 = *(unsigned char *)(v58 + 8);
  sub_1DADAB7C8(*(void *)v58, v60);
  char v61 = sub_1DADC1758(v59, v60);
  sub_1DADABA40(v59, v60);
  char v62 = v61 & 1;
  uint64_t v63 = MEMORY[0x1E4FBB390];
  char v113 = v62;
  sub_1DADCA0FC(a1, v46, v88[0]);
  uint64_t v64 = swift_allocObject();
  sub_1DADCA2A4(v46, v64 + v106);
  uint64_t v109 = v57;
  uint64_t v110 = v63;
  unint64_t v111 = v54;
  uint64_t v65 = MEMORY[0x1E4FBB3A8];
  uint64_t v112 = MEMORY[0x1E4FBB3A8];
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v67 = v96;
  uint64_t v68 = v99;
  sub_1DADF6460();
  swift_release();
  (*(void (**)(char *, uint64_t))(v92 + 8))(v55, v68);
  uint64_t v69 = *(uint64_t (**)(uint64_t))(**(void **)(v90 + 8) + 168);
  uint64_t v70 = swift_retain();
  unint64_t v71 = v69(v70);
  swift_release();
  if (v71 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v72 = sub_1DADF6B30();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v72 = *(void *)((v71 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  char v73 = v72 == 1;
  uint64_t v109 = v68;
  uint64_t v110 = v63;
  unint64_t v111 = OpaqueTypeConformance2;
  uint64_t v112 = v65;
  uint64_t v74 = swift_getOpaqueTypeConformance2();
  char v75 = v95;
  uint64_t v76 = v101;
  sub_1DADF1E50(v73, v101, v74, v95);
  (*(void (**)(char *, uint64_t))(v98 + 8))(v67, v76);
  uint64_t v78 = v103;
  uint64_t v77 = v104;
  uint64_t v79 = v100;
  (*(void (**)(char *, char *, uint64_t))(v103 + 32))(v100, v75, v104);
  uint64_t v80 = (uint64_t)v94;
  uint64_t v81 = v97;
  sub_1DADCA0FC((uint64_t)v94, v97, type metadata accessor for BCUI2x2PlaceholderMask);
  uint64_t v82 = *(void (**)(char *, char *, uint64_t))(v78 + 16);
  uint64_t v83 = v102;
  v82(v102, v79, v77);
  uint64_t v84 = v105;
  sub_1DADCA0FC(v81, v105, type metadata accessor for BCUI2x2PlaceholderMask);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682640);
  v82((char *)(v84 + *(int *)(v85 + 48)), v83, v77);
  uint64_t v86 = *(void (**)(char *, uint64_t))(v78 + 8);
  v86(v79, v77);
  sub_1DADCA164(v80, type metadata accessor for BCUI2x2PlaceholderMask);
  v86(v83, v77);
  return sub_1DADCA164(v81, type metadata accessor for BCUI2x2PlaceholderMask);
}

uint64_t sub_1DADC2D34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v73 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6825E8);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v72 = (char *)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B70);
  MEMORY[0x1F4188790](v66);
  uint64_t v6 = (uint64_t *)((char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A50);
  uint64_t v67 = *(void *)(v7 - 8);
  uint64_t v68 = v7;
  uint64_t v8 = MEMORY[0x1F4188790](v7);
  unint64_t v71 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v64 = (uint64_t)&v63 - v11;
  MEMORY[0x1F4188790](v10);
  uint64_t v69 = (char *)&v63 - v12;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682AB8);
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v63 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A30);
  uint64_t v70 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v16);
  uint64_t v65 = (char *)&v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x1F4188790](v17);
  uint64_t v21 = (char *)&v63 - v20;
  MEMORY[0x1F4188790](v19);
  uint64_t v74 = (char *)&v63 - v22;
  uint64_t v23 = a1 + *(int *)(type metadata accessor for BCUI2x2AvocadoView(0) + 24);
  uint64_t v24 = *(void *)(v23 + 8);
  uint64_t v25 = *(uint64_t (**)(uint64_t))(*(void *)v24 + 216);
  uint64_t v26 = swift_retain();
  uint64_t v27 = v25(v26);
  swift_release();
  uint64_t v28 = *(void *)(v27 + 16);
  swift_bridgeObjectRelease();
  if (v28 == *(void *)(v24 + OBJC_IVAR____TtC15BatteryCenterUI16AvocadoViewModel_maxChargeRings))
  {
    *(void *)uint64_t v15 = sub_1DADF6050();
    *((void *)v15 + 1) = 0;
    v15[16] = 0;
    uint64_t v29 = (uint64_t)&v15[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826E8) + 44)];
    uint64_t v63 = a1;
    sub_1DADC3454(a1, v29);
    uint64_t v30 = *(uint64_t (**)(uint64_t))(*(void *)v24 + 168);
    uint64_t v31 = swift_retain();
    unint64_t v32 = v30(v31);
    swift_release();
    if (v32 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v33 = sub_1DADF6B30();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v33 = *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    uint64_t v34 = sub_1DADAD660(&qword_1EB682AB0, &qword_1EB682AB8);
    sub_1DADF10D4(v33, v13, v34, (uint64_t)v21);
    sub_1DADADF3C((uint64_t)v15, &qword_1EB682AB8);
    (*(void (**)(char *, char *, uint64_t))(v70 + 32))(v74, v21, v16);
    *uint64_t v6 = sub_1DADF66D0();
    v6[1] = v35;
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682710);
    sub_1DADC4314(v63, (uint64_t)v6 + *(int *)(v36 + 44));
    uint64_t v37 = *(uint64_t (**)(uint64_t))(**(void **)(v23 + 8) + 168);
    uint64_t v38 = swift_retain();
    unint64_t v39 = v37(v38);
    swift_release();
    uint64_t v40 = v16;
    if (v39 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v41 = sub_1DADF6B30();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v41 = *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    uint64_t v42 = sub_1DADAD660(&qword_1EB682B68, &qword_1EB682B70);
    uint64_t v43 = v64;
    sub_1DADF10D4(v41, v66, v42, v64);
    sub_1DADADF3C((uint64_t)v6, &qword_1EB682B70);
    uint64_t v45 = v67;
    uint64_t v44 = v68;
    uint64_t v46 = v69;
    (*(void (**)(char *, uint64_t, uint64_t))(v67 + 32))(v69, v43, v68);
    uint64_t v47 = v70;
    uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v70 + 16);
    uint64_t v49 = v65;
    v48(v65, v74, v40);
    uint64_t v50 = *(void (**)(char *, char *, uint64_t))(v45 + 16);
    v50(v71, v46, v44);
    unint64_t v51 = v72;
    v48(v72, v49, v40);
    uint64_t v52 = &v51[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A38) + 48)];
    uint64_t v53 = v71;
    v50(v52, v71, v44);
    unint64_t v54 = *(void (**)(char *, uint64_t))(v45 + 8);
    v54(v69, v44);
    uint64_t v55 = *(void (**)(char *, uint64_t))(v47 + 8);
    v55(v74, v40);
    v54(v53, v44);
    v55(v49, v40);
    uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB8);
    uint64_t v57 = (uint64_t)v72;
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v56 - 8) + 56))(v72, 0, 1, v56);
    return sub_1DADADF98(v57, v73, &qword_1EB6825E8);
  }
  else
  {
    uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB8);
    char v60 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56);
    uint64_t v61 = v59;
    uint64_t v62 = v73;
    return v60(v62, 1, 1, v61);
  }
}

uint64_t sub_1DADC3454@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v143 = a2;
  uint64_t v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682880);
  MEMORY[0x1F4188790](v139);
  uint64_t v140 = (uint64_t)&v114 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6828B0);
  uint64_t v4 = MEMORY[0x1F4188790](v137);
  uint64_t v142 = (uint64_t)&v114 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v138 = (uint64_t)&v114 - v7;
  MEMORY[0x1F4188790](v6);
  uint64_t v141 = (uint64_t)&v114 - v8;
  uint64_t v9 = sub_1DADF5E80();
  uint64_t v129 = *(void *)(v9 - 8);
  uint64_t v130 = v9;
  MEMORY[0x1F4188790](v9);
  uint64_t v127 = (char *)&v114 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v114 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for BCUIChargeRingView(0);
  uint64_t v15 = MEMORY[0x1F4188790](v14 - 8);
  double v132 = (uint64_t *)((char *)&v114 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v15);
  uint64_t v115 = (uint64_t *)((char *)&v114 - v17);
  uint64_t v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682770);
  uint64_t v18 = MEMORY[0x1F4188790](v144);
  uint64_t v133 = (uint64_t)&v114 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  uint64_t v120 = (uint64_t)&v114 - v20;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682838);
  uint64_t v22 = MEMORY[0x1F4188790](v21 - 8);
  uint64_t v135 = (uint64_t)&v114 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v22);
  uint64_t v122 = (uint64_t)&v114 - v24;
  uint64_t v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682890);
  MEMORY[0x1F4188790](v117);
  uint64_t v125 = (char *)&v114 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6828C0);
  uint64_t v26 = MEMORY[0x1F4188790](v123);
  uint64_t v136 = (uint64_t)&v114 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x1F4188790](v26);
  uint64_t v121 = (uint64_t)&v114 - v29;
  MEMORY[0x1F4188790](v28);
  uint64_t v134 = (uint64_t)&v114 - v30;
  uint64_t v31 = type metadata accessor for BCUI2x2AvocadoView(0);
  uint64_t v145 = a1;
  uint64_t v146 = (int *)v31;
  uint64_t v32 = a1 + *(int *)(v31 + 24);
  uint64_t v33 = type metadata accessor for AvocadoViewModel();
  uint64_t v34 = sub_1DADCA89C(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  long long v160 = v148;
  *(void *)&long long v161 = v149;
  *(void *)&long long v153 = 0;
  uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BA8);
  uint64_t v118 = sub_1DADAD660(&qword_1EB682BD0, &qword_1EB682F88);
  uint64_t v119 = v35;
  uint64_t v36 = v115;
  sub_1DADF6650();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  long long v162 = v157;
  long long v163 = v158;
  uint64_t v164 = v159;
  long long v160 = v155;
  long long v161 = v156;
  uint64_t v128 = v32;
  uint64_t v126 = v33;
  sub_1DADF5D50();
  swift_getKeyPath();
  uint64_t v124 = v34;
  sub_1DADF5D60();
  swift_release();
  swift_release();
  sub_1DADA8254();
  double v131 = v13;
  sub_1DADDDC28((uint64_t)&v160, (uint64_t)v13, v36);
  unsigned __int8 v37 = sub_1DADF6270();
  unsigned __int8 v38 = sub_1DADF6240();
  char v39 = sub_1DADF6260();
  sub_1DADF6260();
  if (sub_1DADF6260() != v37) {
    char v39 = sub_1DADF6260();
  }
  sub_1DADF6260();
  if (sub_1DADF6260() != v38) {
    char v39 = sub_1DADF6260();
  }
  uint64_t v40 = v145;
  uint64_t v41 = v145 + v146[5];
  uint64_t v42 = *(void *)v41;
  uint64_t v116 = v41;
  char v43 = *(unsigned char *)(v41 + 8);
  sub_1DADAB7C8(v42, v43);
  sub_1DADC1758(v42, v43);
  sub_1DADABA40(v42, v43);
  sub_1DADF5BE0();
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  uint64_t v51 = v50;
  uint64_t v52 = v120;
  sub_1DADCA0FC((uint64_t)v36, v120, type metadata accessor for BCUIChargeRingView);
  uint64_t v53 = v52 + *(int *)(v144 + 36);
  *(unsigned char *)uint64_t v53 = v39;
  *(void *)(v53 + 8) = v45;
  *(void *)(v53 + 16) = v47;
  *(void *)(v53 + 24) = v49;
  *(void *)(v53 + 32) = v51;
  *(unsigned char *)(v53 + 40) = 0;
  sub_1DADCA164((uint64_t)v36, type metadata accessor for BCUIChargeRingView);
  uint64_t v54 = sub_1DADF66D0();
  uint64_t v55 = v122;
  sub_1DADC4144(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v122, 0.0, 1, 0.0, 1, v54, v56, &qword_1EB682770, &qword_1EB682838);
  sub_1DADADF3C(v52, &qword_1EB682770);
  uint64_t v57 = v127;
  sub_1DADF5E50();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v59 = (uint64_t)v125;
  char v60 = (uint64_t *)&v125[*(int *)(v117 + 36)];
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6829E0);
  uint64_t v62 = v129;
  uint64_t v63 = v130;
  (*(void (**)(char *, char *, uint64_t))(v129 + 16))((char *)v60 + *(int *)(v61 + 28), v57, v130);
  *char v60 = KeyPath;
  sub_1DADAE0AC(v55, v59, &qword_1EB682838);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v57, v63);
  sub_1DADADF3C(v55, &qword_1EB682838);
  uint64_t v64 = (uint64_t *)(v40 + v146[14]);
  uint64_t v65 = *v64;
  uint64_t v66 = v64[1];
  *(void *)&long long v155 = v65;
  *((void *)&v155 + 1) = v66;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A90);
  sub_1DADF65E0();
  double v67 = -*(double *)&v148;
  uint64_t v68 = v121;
  sub_1DADAE0AC(v59, v121, &qword_1EB682890);
  uint64_t v69 = v68 + *(int *)(v123 + 36);
  *(double *)uint64_t v69 = v67;
  *(void *)(v69 + 8) = 0;
  sub_1DADADF3C(v59, &qword_1EB682890);
  uint64_t v70 = v134;
  sub_1DADADF98(v68, v134, &qword_1EB6828C0);
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  long long v155 = v153;
  *(void *)&long long v156 = v154;
  uint64_t v147 = 1;
  sub_1DADF6650();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  long long v157 = v150;
  long long v158 = v151;
  uint64_t v159 = v152;
  long long v155 = v148;
  long long v156 = v149;
  sub_1DADF5D50();
  swift_getKeyPath();
  uint64_t v71 = (uint64_t)v131;
  sub_1DADF5D60();
  swift_release();
  swift_release();
  sub_1DADA8254();
  uint64_t v72 = v132;
  sub_1DADDDC28((uint64_t)&v155, v71, v132);
  LOBYTE(v71) = sub_1DADF6250();
  unsigned __int8 v73 = sub_1DADF6240();
  char v74 = sub_1DADF6260();
  sub_1DADF6260();
  if (sub_1DADF6260() != v71) {
    char v74 = sub_1DADF6260();
  }
  sub_1DADF6260();
  if (sub_1DADF6260() != v73) {
    char v74 = sub_1DADF6260();
  }
  uint64_t v75 = *(void *)v116;
  char v76 = *(unsigned char *)(v116 + 8);
  sub_1DADAB7C8(*(void *)v116, v76);
  sub_1DADC1758(v75, v76);
  sub_1DADABA40(v75, v76);
  sub_1DADF5BE0();
  uint64_t v78 = v77;
  uint64_t v80 = v79;
  uint64_t v82 = v81;
  uint64_t v84 = v83;
  uint64_t v85 = v133;
  sub_1DADCA0FC((uint64_t)v72, v133, type metadata accessor for BCUIChargeRingView);
  uint64_t v86 = v85 + *(int *)(v144 + 36);
  *(unsigned char *)uint64_t v86 = v74;
  *(void *)(v86 + 8) = v78;
  *(void *)(v86 + 16) = v80;
  *(void *)(v86 + 24) = v82;
  *(void *)(v86 + 32) = v84;
  *(unsigned char *)(v86 + 40) = 0;
  sub_1DADCA164((uint64_t)v72, type metadata accessor for BCUIChargeRingView);
  uint64_t v87 = sub_1DADF66D0();
  uint64_t v88 = v135;
  sub_1DADC4144(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v135, 0.0, 1, 0.0, 1, v87, v89, &qword_1EB682770, &qword_1EB682838);
  sub_1DADADF3C(v85, &qword_1EB682770);
  uint64_t v90 = v145;
  uint64_t v91 = v146;
  uint64_t v92 = (uint64_t *)(v145 + v146[10]);
  uint64_t v93 = *v92;
  uint64_t v94 = v92[1];
  *(void *)&long long v148 = v93;
  *((void *)&v148 + 1) = v94;
  sub_1DADF65E0();
  uint64_t v95 = v153;
  uint64_t v96 = (uint64_t *)(v90 + v91[11]);
  uint64_t v97 = *v96;
  uint64_t v98 = v96[1];
  *(void *)&long long v148 = v97;
  *((void *)&v148 + 1) = v98;
  sub_1DADF65E0();
  uint64_t v99 = v153;
  sub_1DADF6740();
  uint64_t v101 = v100;
  uint64_t v103 = v102;
  uint64_t v104 = v140;
  sub_1DADAE0AC(v88, v140, &qword_1EB682838);
  uint64_t v105 = (void *)(v104 + *(int *)(v139 + 36));
  *uint64_t v105 = v95;
  v105[1] = v95;
  v105[2] = v101;
  v105[3] = v103;
  uint64_t v106 = v142;
  sub_1DADAE0AC(v104, v142, &qword_1EB682880);
  uint64_t v107 = v106 + *(int *)(v137 + 36);
  *(void *)uint64_t v107 = v99;
  *(unsigned char *)(v107 + 8) = 0;
  sub_1DADADF3C(v104, &qword_1EB682880);
  uint64_t v108 = v138;
  sub_1DADADF98(v106, v138, &qword_1EB6828B0);
  sub_1DADADF3C(v88, &qword_1EB682838);
  uint64_t v109 = v141;
  sub_1DADADF98(v108, v141, &qword_1EB6828B0);
  uint64_t v110 = v136;
  sub_1DADAE0AC(v70, v136, &qword_1EB6828C0);
  sub_1DADAE0AC(v109, v106, &qword_1EB6828B0);
  uint64_t v111 = v143;
  sub_1DADAE0AC(v110, v143, &qword_1EB6828C0);
  uint64_t v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6828C8);
  sub_1DADAE0AC(v106, v111 + *(int *)(v112 + 48), &qword_1EB6828B0);
  sub_1DADADF3C(v109, &qword_1EB6828B0);
  sub_1DADADF3C(v70, &qword_1EB6828C0);
  sub_1DADADF3C(v106, &qword_1EB6828B0);
  return sub_1DADADF3C(v110, &qword_1EB6828C0);
}

__n128 sub_1DADC4144@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v19 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1DADF69F0();
    uint64_t v28 = (void *)sub_1DADF6200();
    sub_1DADF5AA0();

    uint64_t v19 = a17;
  }
  sub_1DADF5E40();
  sub_1DADAE0AC(v17, a9, a16);
  uint64_t v29 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  *uint64_t v29 = v31;
  v29[1] = v32;
  __n128 result = v34;
  v29[2] = v33;
  v29[3] = v34;
  return result;
}

uint64_t sub_1DADC4314@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682AA8);
  uint64_t v5 = MEMORY[0x1F4188790](v4 - 8);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v21 - v8;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B58);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v15 = (uint64_t *)((char *)&v21 - v14);
  *uint64_t v15 = sub_1DADF66B0();
  v15[1] = v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682720);
  sub_1DADC44F8(a1, (uint64_t)v15 + *(int *)(v17 + 44));
  *(void *)uint64_t v9 = sub_1DADF6050();
  *((void *)v9 + 1) = 0;
  v9[16] = 0;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826E0);
  sub_1DADC5944(a1, (uint64_t)&v9[*(int *)(v18 + 44)]);
  sub_1DADAE0AC((uint64_t)v15, (uint64_t)v13, &qword_1EB682B58);
  sub_1DADAE0AC((uint64_t)v9, (uint64_t)v7, &qword_1EB682AA8);
  sub_1DADAE0AC((uint64_t)v13, a2, &qword_1EB682B58);
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B60);
  sub_1DADAE0AC((uint64_t)v7, a2 + *(int *)(v19 + 48), &qword_1EB682AA8);
  sub_1DADADF3C((uint64_t)v9, &qword_1EB682AA8);
  sub_1DADADF3C((uint64_t)v15, &qword_1EB682B58);
  sub_1DADADF3C((uint64_t)v7, &qword_1EB682AA8);
  return sub_1DADADF3C((uint64_t)v13, &qword_1EB682B58);
}

uint64_t sub_1DADC44F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v205 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v197 = (char *)&v165 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for BCUIChargeRingView(0);
  MEMORY[0x1F4188790](v5 - 8);
  v200 = (uint64_t *)((char *)&v165 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v198 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682770);
  MEMORY[0x1F4188790](v198);
  uint64_t v202 = (uint64_t)&v165 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682838);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v201 = (uint64_t)&v165 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682888);
  uint64_t v11 = MEMORY[0x1F4188790](v10 - 8);
  uint64_t v204 = (uint64_t)&v165 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v199 = (uint64_t)&v165 - v14;
  MEMORY[0x1F4188790](v13);
  uint64_t v203 = (uint64_t)&v165 - v15;
  uint64_t v193 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6828D8);
  MEMORY[0x1F4188790](v193);
  uint64_t v194 = (uint64_t)&v165 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v180 = sub_1DADF61B0();
  MEMORY[0x1F4188790](v180);
  unint64_t v182 = (char *)&v165 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v183 = sub_1DADF5E80();
  uint64_t v181 = *(void *)(v183 - 8);
  MEMORY[0x1F4188790](v183);
  v179 = (char *)&v165 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v172 = sub_1DADF6790();
  uint64_t v171 = *(void *)(v172 - 8);
  uint64_t v19 = MEMORY[0x1F4188790](v172);
  v170 = (char *)&v165 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  uint64_t v169 = (uint64_t)&v165 - v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A08);
  MEMORY[0x1F4188790](v22 - 8);
  uint64_t v24 = (char *)&v165 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_1DADF5A60();
  MEMORY[0x1F4188790](v25 - 8);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6825F8);
  uint64_t v27 = *(void *)(v26 - 8);
  MEMORY[0x1F4188790](v26);
  uint64_t v29 = (char *)&v165 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v176 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A20);
  uint64_t v174 = *(void *)(v176 - 8);
  MEMORY[0x1F4188790](v176);
  uint64_t v173 = (uint64_t)&v165 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6827B0);
  MEMORY[0x1F4188790](v168);
  v175 = (char *)&v165 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v177 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682850);
  MEMORY[0x1F4188790](v177);
  uint64_t v184 = (uint64_t)&v165 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v178 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6828A0);
  MEMORY[0x1F4188790](v178);
  uint64_t v187 = (uint64_t)&v165 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v186 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6828F0);
  uint64_t v34 = MEMORY[0x1F4188790](v186);
  uint64_t v185 = (uint64_t)&v165 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v34);
  uint64_t v189 = (uint64_t)&v165 - v36;
  uint64_t v191 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682910);
  MEMORY[0x1F4188790](v191);
  uint64_t v190 = (uint64_t)&v165 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682918);
  uint64_t v39 = MEMORY[0x1F4188790](v38 - 8);
  uint64_t v196 = (uint64_t)&v165 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = MEMORY[0x1F4188790](v39);
  uint64_t v188 = (char *)&v165 - v42;
  MEMORY[0x1F4188790](v41);
  uint64_t v195 = (char *)&v165 - v43;
  uint64_t v44 = type metadata accessor for BCUI2x2AvocadoView(0);
  uint64_t v45 = a1;
  uint64_t v192 = a1 + *(int *)(v44 + 24);
  uint64_t v46 = *(uint64_t (**)(uint64_t))(**(void **)(v192 + 8) + 216);
  uint64_t v47 = swift_retain();
  uint64_t v48 = v46(v47);
  uint64_t result = swift_release();
  if (*(void *)(v48 + 16))
  {
    double v50 = *(double *)(v48 + 48);
    swift_bridgeObjectRelease();
    *(void *)&long long v208 = sub_1DADF3650(v50);
    sub_1DADF5A50();
    sub_1DADB2BCC();
    sub_1DADF5A40();
    sub_1DADAD660(&qword_1EB6825F0, &qword_1EB6825F8);
    sub_1DADF67B0();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v26);
    long long v208 = v215;
    sub_1DADBE16C();
    uint64_t v51 = sub_1DADF6350();
    uint64_t v53 = v52;
    char v55 = v54 & 1;
    v166 = (int *)v44;
    uint64_t v56 = *(int *)(v44 + 36);
    uint64_t v206 = v45;
    uint64_t v167 = v56;
    uint64_t v57 = sub_1DADF62B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v24, 1, 1, v57);
    sub_1DADF62D0();
    sub_1DADADF3C((uint64_t)v24, &qword_1EB682A08);
    uint64_t v58 = sub_1DADF6330();
    uint64_t v60 = v59;
    char v62 = v61;
    uint64_t v64 = v63;
    swift_release();
    sub_1DADBE1C0(v51, v53, v55);
    swift_bridgeObjectRelease();
    *(void *)&long long v215 = v58;
    *((void *)&v215 + 1) = v60;
    LOBYTE(v216) = v62 & 1;
    *((void *)&v216 + 1) = v64;
    uint64_t v65 = v169;
    sub_1DADBFCDC(v169);
    uint64_t v66 = v170;
    sub_1DADF6780();
    char v67 = sub_1DADF6770();
    uint64_t v68 = *(void (**)(char *, uint64_t))(v171 + 8);
    uint64_t v69 = v66;
    uint64_t v70 = v172;
    v68(v69, v172);
    v68((char *)v65, v70);
    uint64_t v71 = *sub_1DADF3990();
    swift_retain();
    uint64_t v72 = v173;
    sub_1DADF19B8(v67 & 1, v71, MEMORY[0x1E4F3E2F8], MEMORY[0x1E4F3E2E8], v173);
    swift_release();
    sub_1DADBE1C0(v215, *((uint64_t *)&v215 + 1), v216);
    swift_bridgeObjectRelease();
    unsigned __int8 v73 = v179;
    sub_1DADF5E60();
    uint64_t v74 = *sub_1DADF3900();
    uint64_t v75 = v181;
    uint64_t v76 = (uint64_t)v182;
    uint64_t v77 = v183;
    (*(void (**)(char *, char *, uint64_t))(v181 + 16))(v182, v73, v183);
    uint64_t v78 = v180;
    *(void *)(v76 + *(int *)(v180 + 20)) = v74;
    *(_DWORD *)(v76 + *(int *)(v78 + 24)) = 0;
    uint64_t v79 = v174;
    uint64_t v80 = (uint64_t)v175;
    uint64_t v81 = v176;
    (*(void (**)(char *, uint64_t, uint64_t))(v174 + 16))(v175, v72, v176);
    uint64_t v82 = (uint64_t (*)(void))MEMORY[0x1E4F3DD90];
    sub_1DADCA0FC(v76, v80 + *(int *)(v168 + 36), MEMORY[0x1E4F3DD90]);
    swift_retain();
    sub_1DADCA164(v76, v82);
    (*(void (**)(char *, uint64_t))(v75 + 8))(v73, v77);
    (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v72, v81);
    char v83 = sub_1DADF6250();
    uint64_t v84 = v166;
    uint64_t v85 = v206;
    uint64_t v86 = v206 + v166[5];
    uint64_t v87 = *(void *)v86;
    LOBYTE(v77) = *(unsigned char *)(v86 + 8);
    sub_1DADAB7C8(*(void *)v86, v77);
    LOBYTE(v76) = sub_1DADC1758(v87, v77);
    sub_1DADABA40(v87, v77);
    if (v76) {
      sub_1DADC1D44();
    }
    sub_1DADF5BE0();
    uint64_t v89 = v88;
    uint64_t v91 = v90;
    uint64_t v93 = v92;
    uint64_t v95 = v94;
    uint64_t v96 = v184;
    sub_1DADAE0AC(v80, v184, &qword_1EB6827B0);
    uint64_t v97 = v96 + *(int *)(v177 + 36);
    *(unsigned char *)uint64_t v97 = v83;
    *(void *)(v97 + 8) = v89;
    *(void *)(v97 + 16) = v91;
    *(void *)(v97 + 24) = v93;
    *(void *)(v97 + 32) = v95;
    *(unsigned char *)(v97 + 40) = 0;
    sub_1DADADF3C(v80, &qword_1EB6827B0);
    char v98 = sub_1DADF6240();
    uint64_t v99 = *(void *)v86;
    char v100 = *(unsigned char *)(v86 + 8);
    sub_1DADAB7C8(*(void *)v86, v100);
    char v101 = sub_1DADC1758(v99, v100);
    sub_1DADABA40(v99, v100);
    uint64_t v102 = (uint64_t)v195;
    if (v101) {
      sub_1DADC1D44();
    }
    sub_1DADF5BE0();
    uint64_t v104 = v103;
    uint64_t v106 = v105;
    uint64_t v108 = v107;
    uint64_t v110 = v109;
    uint64_t v111 = v187;
    sub_1DADAE0AC(v96, v187, &qword_1EB682850);
    uint64_t v112 = v111 + *(int *)(v178 + 36);
    *(unsigned char *)uint64_t v112 = v98;
    *(void *)(v112 + 8) = v104;
    *(void *)(v112 + 16) = v106;
    *(void *)(v112 + 24) = v108;
    *(void *)(v112 + 32) = v110;
    *(unsigned char *)(v112 + 40) = 0;
    sub_1DADADF3C(v96, &qword_1EB682850);
    char v113 = (uint64_t *)(v85 + v84[12]);
    uint64_t v114 = *v113;
    uint64_t v115 = v113[1];
    *(void *)&long long v215 = v114;
    *((void *)&v215 + 1) = v115;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A90);
    sub_1DADF65E0();
    uint64_t v116 = v208;
    uint64_t v117 = (uint64_t *)(v85 + v84[13]);
    uint64_t v118 = *v117;
    uint64_t v119 = v117[1];
    *(void *)&long long v215 = v118;
    *((void *)&v215 + 1) = v119;
    sub_1DADF65E0();
    uint64_t v120 = v208;
    sub_1DADF6740();
    uint64_t v122 = v121;
    uint64_t v124 = v123;
    uint64_t v125 = v194;
    sub_1DADAE0AC(v111, v194, &qword_1EB6828A0);
    uint64_t v126 = (void *)(v125 + *(int *)(v193 + 36));
    *uint64_t v126 = v116;
    v126[1] = v116;
    v126[2] = v122;
    v126[3] = v124;
    uint64_t v127 = v185;
    sub_1DADAE0AC(v125, v185, &qword_1EB6828D8);
    uint64_t v128 = v127 + *(int *)(v186 + 36);
    *(void *)uint64_t v128 = v120;
    *(unsigned char *)(v128 + 8) = 0;
    sub_1DADADF3C(v125, &qword_1EB6828D8);
    uint64_t v129 = v127;
    uint64_t v130 = v189;
    sub_1DADADF98(v129, v189, &qword_1EB6828F0);
    sub_1DADADF3C(v111, &qword_1EB6828A0);
    double v131 = (void *)(v85 + v84[14]);
    uint64_t v133 = v131[1];
    *(void *)&long long v215 = *v131;
    uint64_t v132 = v215;
    *((void *)&v215 + 1) = v133;
    sub_1DADF65E0();
    double v134 = -*(double *)&v208;
    *(void *)&long long v215 = v132;
    *((void *)&v215 + 1) = v133;
    sub_1DADF65E0();
    uint64_t v135 = v208;
    uint64_t v136 = v190;
    sub_1DADAE0AC(v130, v190, &qword_1EB6828F0);
    uint64_t v137 = v136 + *(int *)(v191 + 36);
    *(double *)uint64_t v137 = v134;
    *(void *)(v137 + 8) = v135;
    sub_1DADADF3C(v130, &qword_1EB6828F0);
    sub_1DADCA700(&qword_1EB682908, &qword_1EB682910, (void (*)(void))sub_1DADCA670);
    uint64_t v138 = (uint64_t)v188;
    sub_1DADF63E0();
    sub_1DADADF3C(v136, &qword_1EB682910);
    sub_1DADADF98(v138, v102, &qword_1EB682918);
    type metadata accessor for AvocadoViewModel();
    sub_1DADCA89C(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
    sub_1DADF5D50();
    swift_getKeyPath();
    sub_1DADF5D60();
    swift_release();
    swift_release();
    long long v215 = v213;
    *(void *)&long long v216 = v214;
    uint64_t v207 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BA8);
    sub_1DADAD660(&qword_1EB682BD0, &qword_1EB682F88);
    sub_1DADF6650();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    long long v217 = v210;
    long long v218 = v211;
    uint64_t v219 = v212;
    long long v215 = v208;
    long long v216 = v209;
    sub_1DADF5D50();
    swift_getKeyPath();
    uint64_t v139 = (uint64_t)v197;
    sub_1DADF5D60();
    swift_release();
    swift_release();
    sub_1DADA8254();
    uint64_t v140 = v200;
    sub_1DADDDC28((uint64_t)&v215, v139, v200);
    LOBYTE(v138) = sub_1DADF6270();
    unsigned __int8 v141 = sub_1DADF6230();
    char v142 = sub_1DADF6260();
    sub_1DADF6260();
    unsigned __int8 v143 = sub_1DADF6260();
    uint64_t v144 = v205;
    if (v143 != v138) {
      char v142 = sub_1DADF6260();
    }
    sub_1DADF6260();
    if (sub_1DADF6260() != v141) {
      char v142 = sub_1DADF6260();
    }
    uint64_t v145 = *(void *)v86;
    char v146 = *(unsigned char *)(v86 + 8);
    sub_1DADAB7C8(*(void *)v86, v146);
    sub_1DADC1758(v145, v146);
    sub_1DADABA40(v145, v146);
    sub_1DADF5BE0();
    uint64_t v148 = v147;
    uint64_t v150 = v149;
    uint64_t v152 = v151;
    uint64_t v154 = v153;
    uint64_t v155 = v202;
    sub_1DADCA0FC((uint64_t)v140, v202, type metadata accessor for BCUIChargeRingView);
    uint64_t v156 = v155 + *(int *)(v198 + 36);
    *(unsigned char *)uint64_t v156 = v142;
    *(void *)(v156 + 8) = v148;
    *(void *)(v156 + 16) = v150;
    *(void *)(v156 + 24) = v152;
    *(void *)(v156 + 32) = v154;
    *(unsigned char *)(v156 + 40) = 0;
    sub_1DADCA164((uint64_t)v140, type metadata accessor for BCUIChargeRingView);
    uint64_t v157 = sub_1DADF66D0();
    uint64_t v158 = v201;
    sub_1DADC4144(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v201, 0.0, 1, 0.0, 1, v157, v159, &qword_1EB682770, &qword_1EB682838);
    sub_1DADADF3C(v155, &qword_1EB682770);
    uint64_t v160 = v199;
    sub_1DADAE0AC(v158, v199, &qword_1EB682838);
    sub_1DADADF3C(v158, &qword_1EB682838);
    uint64_t v161 = v203;
    sub_1DADADF98(v160, v203, &qword_1EB682888);
    uint64_t v162 = v196;
    sub_1DADAE0AC(v102, v196, &qword_1EB682918);
    uint64_t v163 = v204;
    sub_1DADAE0AC(v161, v204, &qword_1EB682888);
    sub_1DADAE0AC(v162, v144, &qword_1EB682918);
    uint64_t v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682920);
    sub_1DADAE0AC(v163, v144 + *(int *)(v164 + 48), &qword_1EB682888);
    sub_1DADADF3C(v161, &qword_1EB682888);
    sub_1DADADF3C(v102, &qword_1EB682918);
    sub_1DADADF3C(v163, &qword_1EB682888);
    return sub_1DADADF3C(v162, &qword_1EB682918);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DADC5944@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v125 = a2;
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682880);
  MEMORY[0x1F4188790](v130);
  uint64_t v131 = (uint64_t)&v107 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v107 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for BCUIChargeRingView(0);
  uint64_t v8 = MEMORY[0x1F4188790](v7 - 8);
  uint64_t v119 = (uint64_t *)((char *)&v107 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v8);
  uint64_t v126 = (uint64_t *)((char *)&v107 - v10);
  uint64_t v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682770);
  uint64_t v11 = MEMORY[0x1F4188790](v127);
  uint64_t v120 = (uint64_t)&v107 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v112 = (uint64_t *)((char *)&v107 - v13);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682838);
  uint64_t v15 = MEMORY[0x1F4188790](v14 - 8);
  uint64_t v122 = (uint64_t)&v107 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v114 = (uint64_t)&v107 - v17;
  uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6828B0);
  uint64_t v18 = MEMORY[0x1F4188790](v128);
  uint64_t v124 = (uint64_t)&v107 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  uint64_t v121 = (uint64_t)&v107 - v21;
  uint64_t v22 = MEMORY[0x1F4188790](v20);
  uint64_t v123 = (uint64_t)&v107 - v23;
  uint64_t v24 = MEMORY[0x1F4188790](v22);
  uint64_t v117 = (uint64_t)&v107 - v25;
  uint64_t v26 = MEMORY[0x1F4188790](v24);
  uint64_t v113 = (uint64_t)&v107 - v27;
  MEMORY[0x1F4188790](v26);
  uint64_t v129 = (uint64_t)&v107 - v28;
  uint64_t v108 = type metadata accessor for BCUI2x2AvocadoView(0);
  uint64_t v116 = a1;
  uint64_t v29 = type metadata accessor for AvocadoViewModel();
  sub_1DADCA89C(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  long long v145 = v133;
  *(void *)&long long v146 = v134;
  *(void *)&long long v138 = 2;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BA8);
  uint64_t v110 = sub_1DADAD660(&qword_1EB682BD0, &qword_1EB682F88);
  uint64_t v111 = v30;
  sub_1DADF6650();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  long long v147 = v142;
  long long v148 = v143;
  uint64_t v149 = v144;
  long long v145 = v140;
  long long v146 = v141;
  uint64_t v115 = v29;
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  sub_1DADA8254();
  uint64_t v118 = v6;
  sub_1DADDDC28((uint64_t)&v145, (uint64_t)v6, v126);
  unsigned __int8 v31 = sub_1DADF6270();
  unsigned __int8 v32 = sub_1DADF6230();
  char v33 = sub_1DADF6260();
  sub_1DADF6260();
  if (sub_1DADF6260() != v31) {
    char v33 = sub_1DADF6260();
  }
  sub_1DADF6260();
  if (sub_1DADF6260() != v32) {
    char v33 = sub_1DADF6260();
  }
  uint64_t v34 = v108;
  uint64_t v35 = v116;
  uint64_t v36 = v116 + *(int *)(v108 + 20);
  uint64_t v37 = *(void *)v36;
  uint64_t v109 = v36;
  char v38 = *(unsigned char *)(v36 + 8);
  sub_1DADAB7C8(v37, v38);
  sub_1DADC1758(v37, v38);
  sub_1DADABA40(v37, v38);
  sub_1DADF5BE0();
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t v47 = v126;
  uint64_t v48 = v112;
  sub_1DADCA0FC((uint64_t)v126, (uint64_t)v112, type metadata accessor for BCUIChargeRingView);
  uint64_t v49 = (char *)v48 + *(int *)(v127 + 36);
  char *v49 = v33;
  *((void *)v49 + 1) = v40;
  *((void *)v49 + 2) = v42;
  *((void *)v49 + 3) = v44;
  *((void *)v49 + 4) = v46;
  v49[40] = 0;
  sub_1DADCA164((uint64_t)v47, type metadata accessor for BCUIChargeRingView);
  uint64_t v50 = sub_1DADF66D0();
  uint64_t v51 = v114;
  sub_1DADC4144(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v114, 0.0, 1, 0.0, 1, v50, v52, &qword_1EB682770, &qword_1EB682838);
  sub_1DADADF3C((uint64_t)v48, &qword_1EB682770);
  uint64_t v53 = (void *)(v35 + *(int *)(v34 + 40));
  uint64_t v54 = *v53;
  uint64_t v112 = v53;
  uint64_t v55 = v53[1];
  *(void *)&long long v140 = v54;
  *((void *)&v140 + 1) = v55;
  uint64_t v56 = (uint64_t *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A90);
  sub_1DADF65E0();
  uint64_t v57 = v133;
  uint64_t v58 = (void *)(v35 + *(int *)(v34 + 44));
  uint64_t v59 = v58[1];
  *(void *)&long long v140 = *v58;
  *((void *)&v140 + 1) = v59;
  uint64_t v126 = v56;
  sub_1DADF65E0();
  uint64_t v60 = v133;
  sub_1DADF6740();
  uint64_t v62 = v61;
  uint64_t v64 = v63;
  uint64_t v65 = v131;
  sub_1DADAE0AC(v51, v131, &qword_1EB682838);
  uint64_t v66 = (void *)(v65 + *(int *)(v130 + 36));
  *uint64_t v66 = v57;
  v66[1] = v57;
  v66[2] = v62;
  v66[3] = v64;
  uint64_t v67 = v117;
  sub_1DADAE0AC(v65, v117, &qword_1EB682880);
  uint64_t v68 = v67 + *(int *)(v128 + 36);
  *(void *)uint64_t v68 = v60;
  *(unsigned char *)(v68 + 8) = 0;
  sub_1DADADF3C(v65, &qword_1EB682880);
  uint64_t v69 = v113;
  sub_1DADADF98(v67, v113, &qword_1EB6828B0);
  sub_1DADADF3C(v51, &qword_1EB682838);
  sub_1DADADF98(v69, v129, &qword_1EB6828B0);
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  long long v140 = v138;
  *(void *)&long long v141 = v139;
  uint64_t v132 = 3;
  sub_1DADF6650();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  long long v142 = v135;
  long long v143 = v136;
  uint64_t v144 = v137;
  long long v140 = v133;
  long long v141 = v134;
  sub_1DADF5D50();
  swift_getKeyPath();
  uint64_t v70 = (uint64_t)v118;
  sub_1DADF5D60();
  swift_release();
  swift_release();
  sub_1DADA8254();
  uint64_t v71 = v119;
  sub_1DADDDC28((uint64_t)&v140, v70, v119);
  LOBYTE(v48) = sub_1DADF6250();
  unsigned __int8 v72 = sub_1DADF6230();
  char v73 = sub_1DADF6260();
  sub_1DADF6260();
  if (sub_1DADF6260() != v48) {
    char v73 = sub_1DADF6260();
  }
  sub_1DADF6260();
  if (sub_1DADF6260() != v72) {
    char v73 = sub_1DADF6260();
  }
  uint64_t v74 = *(void *)v109;
  char v75 = *(unsigned char *)(v109 + 8);
  sub_1DADAB7C8(*(void *)v109, v75);
  sub_1DADC1758(v74, v75);
  sub_1DADABA40(v74, v75);
  sub_1DADF5BE0();
  uint64_t v77 = v76;
  uint64_t v79 = v78;
  uint64_t v81 = v80;
  uint64_t v83 = v82;
  uint64_t v84 = v120;
  sub_1DADCA0FC((uint64_t)v71, v120, type metadata accessor for BCUIChargeRingView);
  uint64_t v85 = v84 + *(int *)(v127 + 36);
  *(unsigned char *)uint64_t v85 = v73;
  *(void *)(v85 + 8) = v77;
  *(void *)(v85 + 16) = v79;
  *(void *)(v85 + 24) = v81;
  *(void *)(v85 + 32) = v83;
  *(unsigned char *)(v85 + 40) = 0;
  sub_1DADCA164((uint64_t)v71, type metadata accessor for BCUIChargeRingView);
  uint64_t v86 = sub_1DADF66D0();
  uint64_t v87 = v122;
  sub_1DADC4144(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v122, 0.0, 1, 0.0, 1, v86, v88, &qword_1EB682770, &qword_1EB682838);
  sub_1DADADF3C(v84, &qword_1EB682770);
  uint64_t v89 = v112[1];
  *(void *)&long long v133 = *v112;
  *((void *)&v133 + 1) = v89;
  sub_1DADF65E0();
  uint64_t v90 = v138;
  uint64_t v91 = v58[1];
  *(void *)&long long v133 = *v58;
  *((void *)&v133 + 1) = v91;
  sub_1DADF65E0();
  uint64_t v92 = v138;
  sub_1DADF6740();
  uint64_t v94 = v93;
  uint64_t v96 = v95;
  uint64_t v97 = v131;
  sub_1DADAE0AC(v87, v131, &qword_1EB682838);
  char v98 = (void *)(v97 + *(int *)(v130 + 36));
  *char v98 = v90;
  v98[1] = v90;
  v98[2] = v94;
  v98[3] = v96;
  sub_1DADAE0AC(v97, v67, &qword_1EB682880);
  uint64_t v99 = v67 + *(int *)(v128 + 36);
  *(void *)uint64_t v99 = v92;
  *(unsigned char *)(v99 + 8) = 0;
  sub_1DADADF3C(v97, &qword_1EB682880);
  uint64_t v100 = v121;
  sub_1DADADF98(v67, v121, &qword_1EB6828B0);
  sub_1DADADF3C(v87, &qword_1EB682838);
  uint64_t v101 = v123;
  sub_1DADADF98(v100, v123, &qword_1EB6828B0);
  uint64_t v102 = v129;
  sub_1DADAE0AC(v129, v67, &qword_1EB6828B0);
  uint64_t v103 = v124;
  sub_1DADAE0AC(v101, v124, &qword_1EB6828B0);
  uint64_t v104 = v125;
  sub_1DADAE0AC(v67, v125, &qword_1EB6828B0);
  uint64_t v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6828B8);
  sub_1DADAE0AC(v103, v104 + *(int *)(v105 + 48), &qword_1EB6828B0);
  sub_1DADADF3C(v101, &qword_1EB6828B0);
  sub_1DADADF3C(v102, &qword_1EB6828B0);
  sub_1DADADF3C(v103, &qword_1EB6828B0);
  return sub_1DADADF3C(v67, &qword_1EB6828B0);
}

uint64_t sub_1DADC6508(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(**(void **)(a1
                                                       + *(int *)(type metadata accessor for BCUI2x2AvocadoView(0) + 24)
                                                       + 8)
                                         + 168);
  uint64_t v2 = swift_retain();
  unint64_t v3 = v1(v2);
  swift_release();
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1DADF6B30();
    swift_bridgeObjectRelease();
  }
  uint64_t v4 = swift_bridgeObjectRelease();
  MEMORY[0x1F4188790](v4);
  uint64_t v5 = sub_1DADF5D30();
  MEMORY[0x1F4188790](v5);
  return sub_1DADF5D30();
}

uint64_t sub_1DADC6684(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(**(void **)(a1
                                                       + *(int *)(type metadata accessor for BCUI2x2AvocadoView(0) + 24)
                                                       + 8)
                                         + 168);
  uint64_t v2 = swift_retain();
  unint64_t v3 = v1(v2);
  swift_release();
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1DADF6B30();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v4 = sub_1DADF37B8();
  MEMORY[0x1F4188790](v4);
  swift_retain();
  sub_1DADF5D30();
  return swift_release();
}

uint64_t sub_1DADC67C4@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1DADC681C()
{
  return swift_getKeyPath();
}

double sub_1DADC6840()
{
  return *(double *)sub_1DADF3C04();
}

double sub_1DADC685C()
{
  return *(double *)sub_1DADF3C20();
}

double sub_1DADC6878@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>, double a5@<D1>)
{
  sub_1DADADF98(a1, a4, &qword_1EB6826A0);
  uint64_t v9 = (int *)type metadata accessor for BCUI2x2AvocadoView(0);
  uint64_t v10 = a4 + v9[5];
  *(void *)uint64_t v10 = a2;
  *(unsigned char *)(v10 + 8) = a3 & 1;
  uint64_t v11 = (uint64_t *)(a4 + v9[6]);
  type metadata accessor for AvocadoViewModel();
  sub_1DADCA89C(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
  *uint64_t v11 = sub_1DADF5D40();
  v11[1] = v12;
  sub_1DADB2BCC();
  sub_1DADF5C60();
  sub_1DADF5C60();
  *(void *)(a4 + v9[9]) = 0x4047000000000000;
  uint64_t v13 = a4 + v9[10];
  sub_1DADF65D0();
  *(double *)uint64_t v13 = a5;
  *(void *)(v13 + 8) = v19;
  uint64_t v14 = a4 + v9[11];
  sub_1DADF65D0();
  *(double *)uint64_t v14 = a5;
  *(void *)(v14 + 8) = v19;
  uint64_t v15 = a4 + v9[12];
  sub_1DADF65D0();
  *(double *)uint64_t v15 = a5;
  *(void *)(v15 + 8) = v19;
  uint64_t v16 = a4 + v9[13];
  sub_1DADF65D0();
  *(double *)uint64_t v16 = a5;
  *(void *)(v16 + 8) = v19;
  uint64_t v17 = a4 + v9[14];
  sub_1DADF65D0();
  double result = a5;
  *(double *)uint64_t v17 = a5;
  *(void *)(v17 + 8) = v19;
  return result;
}

uint64_t sub_1DADC6A90()
{
  return swift_getOpaqueTypeConformance2();
}

char *sub_1DADC6AAC(char *a1, char *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    uint64_t v4 = (char *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1DADF6790();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *(void *)uint64_t v4 = *(void *)a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = &v4[v9];
    uint64_t v11 = &a2[v9];
    uint64_t v12 = *(void *)v11;
    char v13 = v11[8];
    sub_1DADAB7C8(*(void *)v11, v13);
    *(void *)uint64_t v10 = v12;
    v10[8] = v13;
    uint64_t v14 = a3[6];
    uint64_t v15 = a3[7];
    uint64_t v16 = &v4[v14];
    uint64_t v17 = &a2[v14];
    uint64_t v18 = *((void *)v17 + 1);
    *(void *)uint64_t v16 = *(void *)v17;
    *((void *)v16 + 1) = v18;
    uint64_t v19 = &v4[v15];
    uint64_t v20 = &a2[v15];
    swift_retain();
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    uint64_t v22 = *(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16);
    v22(v19, v20, v21);
    v22(&v4[a3[8]], &a2[a3[8]], v21);
    uint64_t v23 = a3[10];
    *(void *)&v4[a3[9]] = *(void *)&a2[a3[9]];
    uint64_t v24 = &v4[v23];
    uint64_t v25 = &a2[v23];
    uint64_t v26 = *((void *)v25 + 1);
    *(void *)uint64_t v24 = *(void *)v25;
    *((void *)v24 + 1) = v26;
    uint64_t v27 = a3[11];
    uint64_t v28 = a3[12];
    uint64_t v29 = &v4[v27];
    uint64_t v30 = &a2[v27];
    uint64_t v31 = *((void *)v30 + 1);
    *(void *)uint64_t v29 = *(void *)v30;
    *((void *)v29 + 1) = v31;
    unsigned __int8 v32 = &v4[v28];
    char v33 = &a2[v28];
    uint64_t v34 = *((void *)v33 + 1);
    *(void *)unsigned __int8 v32 = *(void *)v33;
    *((void *)v32 + 1) = v34;
    uint64_t v35 = a3[13];
    uint64_t v36 = a3[14];
    uint64_t v37 = &v4[v35];
    char v38 = &a2[v35];
    uint64_t v39 = *((void *)v38 + 1);
    *(void *)uint64_t v37 = *(void *)v38;
    *((void *)v37 + 1) = v39;
    uint64_t v40 = &v4[v36];
    uint64_t v41 = &a2[v36];
    uint64_t v42 = *((void *)v41 + 1);
    *(void *)uint64_t v40 = *(void *)v41;
    *((void *)v40 + 1) = v42;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_1DADC6CF8(uint64_t a1, int *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1DADF6790();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  sub_1DADABA40(*(void *)(a1 + a2[5]), *(unsigned char *)(a1 + a2[5] + 8));
  swift_release();
  uint64_t v5 = a1 + a2[7];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(a1 + a2[8], v6);
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

char *sub_1DADC6E70(char *a1, char *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1DADF6790();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = *(void *)v9;
  char v11 = v9[8];
  sub_1DADAB7C8(*(void *)v9, v11);
  *(void *)uint64_t v8 = v10;
  v8[8] = v11;
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = &a1[v12];
  uint64_t v15 = &a2[v12];
  uint64_t v16 = *((void *)v15 + 1);
  *(void *)uint64_t v14 = *(void *)v15;
  *((void *)v14 + 1) = v16;
  uint64_t v17 = &a1[v13];
  uint64_t v18 = &a2[v13];
  swift_retain();
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v20 = *(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16);
  v20(v17, v18, v19);
  v20(&a1[a3[8]], &a2[a3[8]], v19);
  uint64_t v21 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  uint64_t v24 = *((void *)v23 + 1);
  *(void *)uint64_t v22 = *(void *)v23;
  *((void *)v22 + 1) = v24;
  uint64_t v25 = a3[11];
  uint64_t v26 = a3[12];
  uint64_t v27 = &a1[v25];
  uint64_t v28 = &a2[v25];
  uint64_t v29 = *((void *)v28 + 1);
  *(void *)uint64_t v27 = *(void *)v28;
  *((void *)v27 + 1) = v29;
  uint64_t v30 = &a1[v26];
  uint64_t v31 = &a2[v26];
  uint64_t v32 = *((void *)v31 + 1);
  *(void *)uint64_t v30 = *(void *)v31;
  *((void *)v30 + 1) = v32;
  uint64_t v33 = a3[13];
  uint64_t v34 = a3[14];
  uint64_t v35 = &a1[v33];
  uint64_t v36 = &a2[v33];
  uint64_t v37 = *((void *)v36 + 1);
  *(void *)uint64_t v35 = *(void *)v36;
  *((void *)v35 + 1) = v37;
  char v38 = &a1[v34];
  uint64_t v39 = &a2[v34];
  uint64_t v40 = *((void *)v39 + 1);
  *(void *)char v38 = *(void *)v39;
  *((void *)v38 + 1) = v40;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

char *sub_1DADC7070(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1DADADF3C((uint64_t)a1, &qword_1EB682F58);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1DADF6790();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *(void *)a1 = *(void *)a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = *(void *)v9;
  char v11 = v9[8];
  sub_1DADAB7C8(*(void *)v9, v11);
  uint64_t v12 = *(void *)v8;
  char v13 = v8[8];
  *(void *)uint64_t v8 = v10;
  v8[8] = v11;
  sub_1DADABA40(v12, v13);
  uint64_t v14 = a3[6];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  *(void *)uint64_t v15 = *(void *)v16;
  *((void *)v15 + 1) = *((void *)v16 + 1);
  swift_retain();
  swift_release();
  uint64_t v17 = a3[7];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v21 = *(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 24);
  v21(v18, v19, v20);
  v21(&a1[a3[8]], &a2[a3[8]], v20);
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  uint64_t v22 = a3[10];
  uint64_t v23 = &a1[v22];
  uint64_t v24 = &a2[v22];
  *(void *)uint64_t v23 = *(void *)v24;
  *((void *)v23 + 1) = *((void *)v24 + 1);
  swift_retain();
  swift_release();
  uint64_t v25 = a3[11];
  uint64_t v26 = &a1[v25];
  uint64_t v27 = &a2[v25];
  *(void *)uint64_t v26 = *(void *)v27;
  *((void *)v26 + 1) = *((void *)v27 + 1);
  swift_retain();
  swift_release();
  uint64_t v28 = a3[12];
  uint64_t v29 = &a1[v28];
  uint64_t v30 = &a2[v28];
  *(void *)uint64_t v29 = *(void *)v30;
  *((void *)v29 + 1) = *((void *)v30 + 1);
  swift_retain();
  swift_release();
  uint64_t v31 = a3[13];
  uint64_t v32 = &a1[v31];
  uint64_t v33 = &a2[v31];
  *(void *)uint64_t v32 = *(void *)v33;
  *((void *)v32 + 1) = *((void *)v33 + 1);
  swift_retain();
  swift_release();
  uint64_t v34 = a3[14];
  uint64_t v35 = &a1[v34];
  uint64_t v36 = &a2[v34];
  *(void *)uint64_t v35 = *(void *)v36;
  *((void *)v35 + 1) = *((void *)v36 + 1);
  swift_retain();
  swift_release();
  return a1;
}

char *sub_1DADC730C(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1DADF6790();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v8];
  char v11 = &a2[v8];
  *(void *)uint64_t v10 = *(void *)v11;
  long long v12 = *(_OWORD *)&a2[v9];
  v10[8] = v11[8];
  *(_OWORD *)&a1[v9] = v12;
  uint64_t v13 = a3[7];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32);
  v17(v14, v15, v16);
  v17(&a1[a3[8]], &a2[a3[8]], v16);
  uint64_t v18 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  *(_OWORD *)&a1[v18] = *(_OWORD *)&a2[v18];
  uint64_t v19 = a3[12];
  *(_OWORD *)&a1[a3[11]] = *(_OWORD *)&a2[a3[11]];
  *(_OWORD *)&a1[v19] = *(_OWORD *)&a2[v19];
  uint64_t v20 = a3[14];
  *(_OWORD *)&a1[a3[13]] = *(_OWORD *)&a2[a3[13]];
  *(_OWORD *)&a1[v20] = *(_OWORD *)&a2[v20];
  return a1;
}

char *sub_1DADC74B0(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1DADADF3C((uint64_t)a1, &qword_1EB682F58);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1DADF6790();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = *(void *)v10;
  LOBYTE(v10) = v10[8];
  uint64_t v12 = *(void *)v9;
  char v13 = v9[8];
  *(void *)uint64_t v9 = v11;
  v9[8] = (char)v10;
  sub_1DADABA40(v12, v13);
  uint64_t v14 = a3[6];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v18 = *(void *)v16;
  uint64_t v17 = *((void *)v16 + 1);
  *(void *)uint64_t v15 = v18;
  *((void *)v15 + 1) = v17;
  swift_release();
  uint64_t v19 = a3[7];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v23 = *(void (**)(char *, char *, uint64_t))(*(void *)(v22 - 8) + 40);
  v23(v20, v21, v22);
  v23(&a1[a3[8]], &a2[a3[8]], v22);
  uint64_t v24 = a3[10];
  *(void *)&a1[a3[9]] = *(void *)&a2[a3[9]];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  *(void *)uint64_t v25 = *(void *)v26;
  *((void *)v25 + 1) = *((void *)v26 + 1);
  swift_release();
  uint64_t v27 = a3[11];
  uint64_t v28 = &a1[v27];
  uint64_t v29 = &a2[v27];
  *(void *)uint64_t v28 = *(void *)v29;
  *((void *)v28 + 1) = *((void *)v29 + 1);
  swift_release();
  uint64_t v30 = a3[12];
  uint64_t v31 = &a1[v30];
  uint64_t v32 = &a2[v30];
  *(void *)uint64_t v31 = *(void *)v32;
  *((void *)v31 + 1) = *((void *)v32 + 1);
  swift_release();
  uint64_t v33 = a3[13];
  uint64_t v34 = &a1[v33];
  uint64_t v35 = &a2[v33];
  *(void *)uint64_t v34 = *(void *)v35;
  *((void *)v34 + 1) = *((void *)v35 + 1);
  swift_release();
  uint64_t v36 = a3[14];
  uint64_t v37 = &a1[v36];
  char v38 = &a2[v36];
  *(void *)uint64_t v37 = *(void *)v38;
  *((void *)v37 + 1) = *((void *)v38 + 1);
  swift_release();
  return a1;
}

uint64_t sub_1DADC770C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DADC7720);
}

uint64_t sub_1DADC7720(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 28);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_1DADC7858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DADC786C);
}

uint64_t sub_1DADC786C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 28);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_1DADC79A4()
{
  sub_1DADC7AA0();
  if (v0 <= 0x3F)
  {
    sub_1DADB4B24();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_1DADC7AA0()
{
  if (!qword_1EB683638)
  {
    sub_1DADF6790();
    unint64_t v0 = sub_1DADF5C10();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1EB683638);
    }
  }
}

uint64_t sub_1DADC7AF8()
{
  return sub_1DADAD660(&qword_1EB682B38, &qword_1EB682B40);
}

unint64_t sub_1DADC7B34(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v15 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    char v8 = *(unsigned char *)(a2 + 8);
    sub_1DADAB7C8(*(void *)a2, v8);
    *(void *)a1 = v7;
    *(unsigned char *)(a1 + 8) = v8;
    uint64_t v9 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = *(void *)(a2 + 16);
    *(void *)(a1 + 24) = v9;
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = a1 + v10;
    uint64_t v12 = a2 + v10;
    swift_retain();
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16);
    v14(v11, v12, v13);
    v14(a1 + *(int *)(a3 + 28), a2 + *(int *)(a3 + 28), v13);
  }
  return a1;
}

uint64_t sub_1DADC7C5C(uint64_t a1, uint64_t a2)
{
  sub_1DADABA40(*(void *)a1, *(unsigned char *)(a1 + 8));
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  char v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v8)((void *)(v5 - 8), v4, v5);
  uint64_t v6 = a1 + *(int *)(a2 + 28);

  return v8(v6, v5);
}

uint64_t sub_1DADC7D1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_1DADAB7C8(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v8;
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  swift_retain();
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16);
  v13(v10, v11, v12);
  v13(a1 + *(int *)(a3 + 28), a2 + *(int *)(a3 + 28), v12);
  return a1;
}

uint64_t sub_1DADC7DF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_1DADAB7C8(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_1DADABA40(v8, v9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24);
  v14(v11, v12, v13);
  v14(a1 + *(int *)(a3 + 28), a2 + *(int *)(a3 + 28), v13);
  return a1;
}

uint64_t sub_1DADC7EEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v10(a1 + *(int *)(a3 + 28), a2 + *(int *)(a3 + 28), v9);
  return a1;
}

uint64_t sub_1DADC7FB4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void *)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_1DADABA40(v8, v9);
  uint64_t v10 = a2[3];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v10;
  swift_release();
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (uint64_t)a2 + v11;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 40);
  v15(v12, v13, v14);
  v15(a1 + *(int *)(a3 + 28), (uint64_t)a2 + *(int *)(a3 + 28), v14);
  return a1;
}

uint64_t sub_1DADC8090(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DADC80A4);
}

uint64_t sub_1DADC80A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    char v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1DADC8158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DADC816C);
}

uint64_t sub_1DADC816C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for BCUI2x2PlaceholderMask(uint64_t a1)
{
  return sub_1DADAD54C(a1, qword_1EB683D70);
}

void sub_1DADC8238()
{
  sub_1DADB4B24();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_1DADC82D8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADC82F4(char a1, double a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682828);
  MEMORY[0x1F4188790](v5);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682960);
  MEMORY[0x1F4188790](v8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682878);
  MEMORY[0x1F4188790](v11);
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v14 = (char *)&v19 - v13;
  if (a1)
  {
    sub_1DADAE0AC(v2, (uint64_t)&v19 - v13, &qword_1EB682828);
    uint64_t v15 = &v14[*(int *)(v11 + 36)];
    *(double *)uint64_t v15 = a2;
    *((void *)v15 + 1) = 0;
    sub_1DADAE0AC((uint64_t)v14, (uint64_t)v10, &qword_1EB682878);
    swift_storeEnumTagMultiPayload();
    sub_1DADCA700(&qword_1EB682870, &qword_1EB682878, (void (*)(void))sub_1DADCA1C4);
    sub_1DADCA1C4();
    sub_1DADF6140();
    uint64_t v16 = (uint64_t)v14;
    uint64_t v17 = &qword_1EB682878;
  }
  else
  {
    sub_1DADAE0AC(v2, (uint64_t)v7, &qword_1EB682828);
    sub_1DADAE0AC((uint64_t)v7, (uint64_t)v10, &qword_1EB682828);
    swift_storeEnumTagMultiPayload();
    sub_1DADCA700(&qword_1EB682870, &qword_1EB682878, (void (*)(void))sub_1DADCA1C4);
    sub_1DADCA1C4();
    sub_1DADF6140();
    uint64_t v16 = (uint64_t)v7;
    uint64_t v17 = &qword_1EB682828;
  }
  return sub_1DADADF3C(v16, v17);
}

double sub_1DADC8580()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1DADF5D80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  char v7 = *((unsigned char *)v1 + 8);
  sub_1DADAB7C8(v6, v7);
  char v8 = sub_1DADC1758(v6, v7);
  sub_1DADABA40(v6, v7);
  uint64_t v9 = *(void (**)(uint64_t))(*(void *)v1[3] + 360);
  uint64_t v10 = swift_retain();
  v9(v10);
  swift_release();
  type metadata accessor for BCUI2x2PlaceholderMask(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  sub_1DADF5C70();
  double v11 = v18;
  sub_1DADF5C70();
  double v12 = 12.0;
  if ((v8 & 1) == 0)
  {
    double v13 = v18;
    double v14 = sub_1DADDF288(0, v11);
    double v15 = sub_1DADCC67C(0, v13);
    double v12 = 0.0;
    if (v15 < v14) {
      double v12 = (v14 - v15) * 0.5;
    }
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v12;
}

uint64_t sub_1DADC8768@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v68 = a2;
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682AA0);
  MEMORY[0x1F4188790](v61);
  uint64_t v4 = (char *)&v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A28);
  uint64_t v64 = *(void *)(v5 - 8);
  uint64_t v65 = v5;
  MEMORY[0x1F4188790](v5);
  char v7 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A60);
  uint64_t v66 = *(void *)(v8 - 8);
  uint64_t v67 = v8;
  uint64_t v9 = MEMORY[0x1F4188790](v8);
  unsigned __int8 v72 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  uint64_t v62 = (uint64_t)&v60 - v12;
  MEMORY[0x1F4188790](v11);
  uint64_t v71 = (char *)&v60 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682AC8);
  MEMORY[0x1F4188790](v14);
  uint64_t v16 = (char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A40);
  uint64_t v69 = *(void *)(v17 - 8);
  uint64_t v70 = v17;
  uint64_t v18 = MEMORY[0x1F4188790](v17);
  uint64_t v63 = (char *)&v60 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  uint64_t v22 = (char *)&v60 - v21;
  MEMORY[0x1F4188790](v20);
  char v73 = (char *)&v60 - v23;
  *(void *)uint64_t v16 = sub_1DADF6050();
  *((void *)v16 + 1) = 0;
  v16[16] = 0;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826F0);
  sub_1DADC8E68(a1, (uint64_t)&v16[*(int *)(v24 + 44)]);
  uint64_t v25 = a1;
  uint64_t v26 = *(uint64_t (**)(uint64_t))(**(void **)(a1 + 24) + 168);
  uint64_t v27 = swift_retain();
  unint64_t v28 = v26(v27);
  swift_release();
  if (v28 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_1DADF6B30();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v29 = *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  uint64_t v30 = sub_1DADAD660(&qword_1EB682AC0, &qword_1EB682AC8);
  sub_1DADF10D4(v29, v14, v30, (uint64_t)v22);
  sub_1DADADF3C((uint64_t)v16, &qword_1EB682AC8);
  (*(void (**)(char *, char *, uint64_t))(v69 + 32))(v73, v22, v70);
  *(void *)uint64_t v4 = sub_1DADF6050();
  *((void *)v4 + 1) = 0;
  v4[16] = 0;
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826D8);
  sub_1DADC98D4(v25, (uint64_t)&v4[*(int *)(v31 + 44)]);
  uint64_t v32 = *(uint64_t (**)(uint64_t))(**(void **)(v25 + 24) + 168);
  uint64_t v33 = swift_retain();
  unint64_t v34 = v32(v33);
  swift_release();
  if (v34 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_1DADF6B30();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v35 = *(void *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  uint64_t v36 = sub_1DADAD660(&qword_1EB682A98, &qword_1EB682AA0);
  uint64_t v37 = v35;
  uint64_t v38 = v61;
  sub_1DADF10D4(v37, v61, v36, (uint64_t)v7);
  sub_1DADADF3C((uint64_t)v4, &qword_1EB682AA0);
  uint64_t v39 = *(uint64_t (**)(uint64_t))(**(void **)(v25 + 24) + 168);
  uint64_t v40 = swift_retain();
  unint64_t v41 = v39(v40);
  swift_release();
  if (v41 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v42 = sub_1DADF6B30();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v42 = *(void *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  uint64_t v74 = v38;
  uint64_t v75 = v36;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v44 = v62;
  uint64_t v45 = v65;
  sub_1DADF0ACC(v42 == 1, v65, OpaqueTypeConformance2, v62);
  (*(void (**)(char *, uint64_t))(v64 + 8))(v7, v45);
  uint64_t v47 = v66;
  uint64_t v46 = v67;
  uint64_t v48 = v71;
  (*(void (**)(char *, uint64_t, uint64_t))(v66 + 32))(v71, v44, v67);
  uint64_t v50 = v69;
  uint64_t v49 = v70;
  uint64_t v51 = *(void (**)(char *, char *, uint64_t))(v69 + 16);
  uint64_t v52 = v63;
  v51(v63, v73, v70);
  uint64_t v53 = *(void (**)(char *, char *, uint64_t))(v47 + 16);
  v53(v72, v48, v46);
  uint64_t v54 = v68;
  v51(v68, v52, v49);
  uint64_t v55 = &v54[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A48) + 48)];
  uint64_t v56 = v72;
  v53(v55, v72, v46);
  uint64_t v57 = *(void (**)(char *, uint64_t))(v47 + 8);
  v57(v71, v46);
  uint64_t v58 = *(void (**)(char *, uint64_t))(v50 + 8);
  v58(v73, v49);
  v57(v56, v46);
  return ((uint64_t (*)(char *, uint64_t))v58)(v52, v49);
}

uint64_t sub_1DADC8E68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v111 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A58);
  uint64_t v113 = *(void *)(v3 - 8);
  uint64_t v114 = v3;
  uint64_t v4 = MEMORY[0x1F4188790](v3);
  uint64_t v112 = (char *)v99 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v109 = (uint64_t)v99 - v7;
  MEMORY[0x1F4188790](v6);
  uint64_t v110 = (char *)v99 - v8;
  uint64_t v9 = type metadata accessor for BCUI2x2PlaceholderMask(0);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v101 = (char *)v99 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)v99 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for BCUIChargeRingView.maskChargeRingView(0);
  uint64_t v15 = MEMORY[0x1F4188790](v14 - 8);
  uint64_t v103 = (uint64_t)v99 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v18 = (char *)v99 - v17;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682768);
  uint64_t v20 = MEMORY[0x1F4188790](v19);
  uint64_t v104 = (uint64_t)v99 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v20);
  uint64_t v23 = (char *)v99 - v22;
  uint64_t v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682828);
  uint64_t v24 = MEMORY[0x1F4188790](v106);
  uint64_t v105 = (uint64_t)v99 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v24);
  uint64_t v27 = (char *)v99 - v26;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682998);
  uint64_t v29 = MEMORY[0x1F4188790](v28 - 8);
  uint64_t v108 = (uint64_t)v99 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = MEMORY[0x1F4188790](v29);
  uint64_t v100 = (char *)v99 - v32;
  MEMORY[0x1F4188790](v31);
  uint64_t v107 = (char *)v99 - v33;
  uint64_t v34 = type metadata accessor for AvocadoViewModel();
  sub_1DADCA89C(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
  v99[1] = v34;
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  uint64_t v102 = v13;
  sub_1DADDE298((uint64_t)v13, (uint64_t)v18);
  unsigned __int8 v35 = sub_1DADF6270();
  unsigned __int8 v36 = sub_1DADF6240();
  char v37 = sub_1DADF6260();
  sub_1DADF6260();
  if (sub_1DADF6260() != v35) {
    char v37 = sub_1DADF6260();
  }
  sub_1DADF6260();
  if (sub_1DADF6260() != v36) {
    char v37 = sub_1DADF6260();
  }
  uint64_t v38 = *(void *)a1;
  char v39 = *(unsigned char *)(a1 + 8);
  sub_1DADAB7C8(*(void *)a1, v39);
  sub_1DADC1758(v38, v39);
  sub_1DADABA40(v38, v39);
  sub_1DADF5BE0();
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  sub_1DADCA0FC((uint64_t)v18, (uint64_t)v23, type metadata accessor for BCUIChargeRingView.maskChargeRingView);
  uint64_t v48 = &v23[*(int *)(v19 + 36)];
  *uint64_t v48 = v37;
  *((void *)v48 + 1) = v41;
  *((void *)v48 + 2) = v43;
  *((void *)v48 + 3) = v45;
  *((void *)v48 + 4) = v47;
  v48[40] = 0;
  sub_1DADCA164((uint64_t)v18, type metadata accessor for BCUIChargeRingView.maskChargeRingView);
  uint64_t v49 = sub_1DADF66D0();
  sub_1DADC4144(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v27, 0.0, 1, 0.0, 1, v49, v50, &qword_1EB682768, &qword_1EB682828);
  sub_1DADADF3C((uint64_t)v23, &qword_1EB682768);
  uint64_t v51 = *(uint64_t (**)(uint64_t))(**(void **)(a1 + 24) + 168);
  uint64_t v52 = swift_retain();
  unint64_t v53 = v51(v52);
  swift_release();
  if (v53 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v54 = sub_1DADF6B30();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v54 = *(void *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v55 = (uint64_t)v107;
  uint64_t v56 = (uint64_t)v101;
  swift_bridgeObjectRelease();
  sub_1DADCA0FC(a1, v56, type metadata accessor for BCUI2x2PlaceholderMask);
  if (v54 == 1)
  {
    uint64_t v57 = *(void *)v56;
    char v58 = *(unsigned char *)(v56 + 8);
    sub_1DADAB7C8(*(void *)v56, v58);
    char v59 = sub_1DADC1758(v57, v58);
    sub_1DADABA40(v57, v58);
    char v60 = v59 ^ 1;
  }
  else
  {
    char v60 = 0;
  }
  sub_1DADCA164(v56, type metadata accessor for BCUI2x2PlaceholderMask);
  double v61 = sub_1DADC8580();
  uint64_t v62 = (uint64_t)v100;
  sub_1DADC82F4(v60 & 1, -v61);
  sub_1DADADF3C((uint64_t)v27, &qword_1EB682828);
  sub_1DADADF98(v62, v55, &qword_1EB682998);
  sub_1DADF5D50();
  swift_getKeyPath();
  uint64_t v63 = (uint64_t)v102;
  sub_1DADF5D60();
  swift_release();
  swift_release();
  uint64_t v64 = v103;
  sub_1DADDE298(v63, v103);
  unsigned __int8 v65 = sub_1DADF6250();
  unsigned __int8 v66 = sub_1DADF6240();
  char v67 = sub_1DADF6260();
  sub_1DADF6260();
  if (sub_1DADF6260() != v65) {
    char v67 = sub_1DADF6260();
  }
  sub_1DADF6260();
  if (sub_1DADF6260() != v66) {
    char v67 = sub_1DADF6260();
  }
  uint64_t v68 = *(void *)a1;
  char v69 = *(unsigned char *)(a1 + 8);
  sub_1DADAB7C8(*(void *)a1, v69);
  sub_1DADC1758(v68, v69);
  sub_1DADABA40(v68, v69);
  sub_1DADF5BE0();
  uint64_t v71 = v70;
  uint64_t v73 = v72;
  uint64_t v75 = v74;
  uint64_t v77 = v76;
  uint64_t v78 = v104;
  sub_1DADCA0FC(v64, v104, type metadata accessor for BCUIChargeRingView.maskChargeRingView);
  uint64_t v79 = v78 + *(int *)(v19 + 36);
  *(unsigned char *)uint64_t v79 = v67;
  *(void *)(v79 + 8) = v71;
  *(void *)(v79 + 16) = v73;
  *(void *)(v79 + 24) = v75;
  *(void *)(v79 + 32) = v77;
  *(unsigned char *)(v79 + 40) = 0;
  sub_1DADCA164(v64, type metadata accessor for BCUIChargeRingView.maskChargeRingView);
  uint64_t v80 = sub_1DADF66D0();
  uint64_t v81 = v105;
  sub_1DADC4144(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v105, 0.0, 1, 0.0, 1, v80, v82, &qword_1EB682768, &qword_1EB682828);
  sub_1DADADF3C(v78, &qword_1EB682768);
  uint64_t v83 = *(uint64_t (**)(uint64_t))(**(void **)(a1 + 24) + 168);
  uint64_t v84 = swift_retain();
  unint64_t v85 = v83(v84);
  swift_release();
  if (v85 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v86 = sub_1DADF6B30();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v86 = *(void *)((v85 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  uint64_t v87 = sub_1DADCA1C4();
  uint64_t v88 = v109;
  sub_1DADF0ACC(v86 == 1, v106, v87, v109);
  sub_1DADADF3C(v81, &qword_1EB682828);
  uint64_t v90 = v113;
  uint64_t v89 = v114;
  uint64_t v91 = v110;
  (*(void (**)(char *, uint64_t, uint64_t))(v113 + 32))(v110, v88, v114);
  uint64_t v92 = v108;
  sub_1DADAE0AC(v55, v108, &qword_1EB682998);
  uint64_t v93 = *(void (**)(char *, char *, uint64_t))(v90 + 16);
  uint64_t v94 = v112;
  v93(v112, v91, v89);
  uint64_t v95 = v111;
  sub_1DADAE0AC(v92, v111, &qword_1EB682998);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6829A0);
  v93((char *)(v95 + *(int *)(v96 + 48)), v94, v89);
  uint64_t v97 = *(void (**)(char *, uint64_t))(v90 + 8);
  v97(v91, v89);
  sub_1DADADF3C(v55, &qword_1EB682998);
  v97(v94, v89);
  return sub_1DADADF3C(v92, &qword_1EB682998);
}

uint64_t sub_1DADC98D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v79 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v71 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for BCUIChargeRingView.maskChargeRingView(0);
  uint64_t v7 = MEMORY[0x1F4188790](v6 - 8);
  uint64_t v74 = (uint64_t)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v71 - v9;
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682768);
  uint64_t v11 = MEMORY[0x1F4188790](v80);
  uint64_t v76 = (uint64_t)&v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v71 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682828);
  uint64_t v16 = MEMORY[0x1F4188790](v15 - 8);
  uint64_t v78 = (uint64_t)&v71 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x1F4188790](v16);
  uint64_t v77 = (uint64_t)&v71 - v19;
  uint64_t v20 = MEMORY[0x1F4188790](v18);
  uint64_t v72 = (uint64_t)&v71 - v21;
  uint64_t v22 = MEMORY[0x1F4188790](v20);
  uint64_t v75 = (uint64_t)&v71 - v23;
  uint64_t v24 = MEMORY[0x1F4188790](v22);
  uint64_t v26 = (char *)&v71 - v25;
  MEMORY[0x1F4188790](v24);
  uint64_t v73 = (uint64_t)&v71 - v27;
  uint64_t v28 = type metadata accessor for AvocadoViewModel();
  sub_1DADCA89C(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
  uint64_t v71 = v28;
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  sub_1DADDE298((uint64_t)v5, (uint64_t)v10);
  unsigned __int8 v29 = sub_1DADF6270();
  unsigned __int8 v30 = sub_1DADF6230();
  char v31 = sub_1DADF6260();
  sub_1DADF6260();
  if (sub_1DADF6260() != v29) {
    char v31 = sub_1DADF6260();
  }
  sub_1DADF6260();
  if (sub_1DADF6260() != v30) {
    char v31 = sub_1DADF6260();
  }
  uint64_t v32 = *(void *)a1;
  char v33 = *(unsigned char *)(a1 + 8);
  sub_1DADAB7C8(*(void *)a1, v33);
  sub_1DADC1758(v32, v33);
  sub_1DADABA40(v32, v33);
  sub_1DADF5BE0();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  sub_1DADCA0FC((uint64_t)v10, (uint64_t)v14, type metadata accessor for BCUIChargeRingView.maskChargeRingView);
  uint64_t v42 = &v14[*(int *)(v80 + 36)];
  char *v42 = v31;
  *((void *)v42 + 1) = v35;
  *((void *)v42 + 2) = v37;
  *((void *)v42 + 3) = v39;
  *((void *)v42 + 4) = v41;
  v42[40] = 0;
  sub_1DADCA164((uint64_t)v10, type metadata accessor for BCUIChargeRingView.maskChargeRingView);
  uint64_t v43 = sub_1DADF66D0();
  sub_1DADC4144(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v26, 0.0, 1, 0.0, 1, v43, v44, &qword_1EB682768, &qword_1EB682828);
  sub_1DADADF3C((uint64_t)v14, &qword_1EB682768);
  uint64_t v45 = v73;
  sub_1DADADF98((uint64_t)v26, v73, &qword_1EB682828);
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  uint64_t v46 = v74;
  sub_1DADDE298((uint64_t)v5, v74);
  unsigned __int8 v47 = sub_1DADF6250();
  unsigned __int8 v48 = sub_1DADF6230();
  char v49 = sub_1DADF6260();
  sub_1DADF6260();
  if (sub_1DADF6260() != v47) {
    char v49 = sub_1DADF6260();
  }
  sub_1DADF6260();
  if (sub_1DADF6260() != v48) {
    char v49 = sub_1DADF6260();
  }
  uint64_t v50 = *(void *)a1;
  char v51 = *(unsigned char *)(a1 + 8);
  sub_1DADAB7C8(v50, v51);
  sub_1DADC1758(v50, v51);
  sub_1DADABA40(v50, v51);
  sub_1DADF5BE0();
  uint64_t v53 = v52;
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  uint64_t v59 = v58;
  uint64_t v60 = v76;
  sub_1DADCA0FC(v46, v76, type metadata accessor for BCUIChargeRingView.maskChargeRingView);
  uint64_t v61 = v60 + *(int *)(v80 + 36);
  *(unsigned char *)uint64_t v61 = v49;
  *(void *)(v61 + 8) = v53;
  *(void *)(v61 + 16) = v55;
  *(void *)(v61 + 24) = v57;
  *(void *)(v61 + 32) = v59;
  *(unsigned char *)(v61 + 40) = 0;
  sub_1DADCA164(v46, type metadata accessor for BCUIChargeRingView.maskChargeRingView);
  uint64_t v62 = sub_1DADF66D0();
  uint64_t v63 = v72;
  sub_1DADC4144(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v72, 0.0, 1, 0.0, 1, v62, v64, &qword_1EB682768, &qword_1EB682828);
  sub_1DADADF3C(v60, &qword_1EB682768);
  uint64_t v65 = v75;
  sub_1DADADF98(v63, v75, &qword_1EB682828);
  uint64_t v66 = v77;
  sub_1DADAE0AC(v45, v77, &qword_1EB682828);
  uint64_t v67 = v78;
  sub_1DADAE0AC(v65, v78, &qword_1EB682828);
  uint64_t v68 = v79;
  sub_1DADAE0AC(v66, v79, &qword_1EB682828);
  uint64_t v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682830);
  sub_1DADAE0AC(v67, v68 + *(int *)(v69 + 48), &qword_1EB682828);
  sub_1DADADF3C(v65, &qword_1EB682828);
  sub_1DADADF3C(v45, &qword_1EB682828);
  sub_1DADADF3C(v67, &qword_1EB682828);
  return sub_1DADADF3C(v66, &qword_1EB682828);
}

uint64_t sub_1DADC9FE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B00);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v5 = sub_1DADF6120();
  *((void *)v5 + 1) = 0;
  v5[16] = 0;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682700);
  sub_1DADC8768(v1, &v5[*(int *)(v6 + 44)]);
  sub_1DADC8580();
  char v7 = sub_1DADF6220();
  sub_1DADF5BE0();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  sub_1DADAE0AC((uint64_t)v5, a1, &qword_1EB682B00);
  uint64_t v16 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB6827E8) + 36);
  *(unsigned char *)uint64_t v16 = v7;
  *(void *)(v16 + 8) = v9;
  *(void *)(v16 + 16) = v11;
  *(void *)(v16 + 24) = v13;
  *(void *)(v16 + 32) = v15;
  *(unsigned char *)(v16 + 40) = 0;
  return sub_1DADADF3C((uint64_t)v5, &qword_1EB682B00);
}

uint64_t sub_1DADCA0FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DADCA164(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1DADCA1C4()
{
  return sub_1DADCA700(&qword_1EB682820, &qword_1EB682828, (void (*)(void))sub_1DADCA1F4);
}

unint64_t sub_1DADCA1F4()
{
  unint64_t result = qword_1EB682760;
  if (!qword_1EB682760)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB682768);
    sub_1DADCA89C(&qword_1EB682630, (void (*)(uint64_t))type metadata accessor for BCUIChargeRingView.maskChargeRingView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB682760);
  }
  return result;
}

uint64_t sub_1DADCA2A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BCUI2x2AvocadoView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADCA308()
{
  uint64_t v1 = *(void *)(type metadata accessor for BCUI2x2AvocadoView(0) - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_1DADC6508(v2);
}

uint64_t sub_1DADCA36C()
{
  return swift_release();
}

unint64_t sub_1DADCA474()
{
  unint64_t result = qword_1EB682860;
  if (!qword_1EB682860)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB682868);
    sub_1DADCA510(&qword_1EB6827F0, &qword_1EB6827F8, &qword_1EB682AE8, &qword_1EB682AF0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB682860);
  }
  return result;
}

uint64_t sub_1DADCA510(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_1DADAD660(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DADCA5B0()
{
  uint64_t v1 = *(void *)(type metadata accessor for BCUI2x2AvocadoView(0) - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_1DADC6684(v2);
}

uint64_t sub_1DADCA610()
{
  return sub_1DADC20B4(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_1DADCA640()
{
  return sub_1DADC1F94();
}

uint64_t sub_1DADCA670()
{
  return sub_1DADCA700(&qword_1EB6828E8, &qword_1EB6828F0, (void (*)(void))sub_1DADCA6A0);
}

uint64_t sub_1DADCA6A0()
{
  return sub_1DADCA700(&qword_1EB6828D0, &qword_1EB6828D8, (void (*)(void))sub_1DADCA6D0);
}

uint64_t sub_1DADCA6D0()
{
  return sub_1DADCA700(&qword_1EB682898, &qword_1EB6828A0, (void (*)(void))sub_1DADC0334);
}

uint64_t sub_1DADCA700(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DADCA77C()
{
  return sub_1DADF5F50();
}

uint64_t sub_1DADCA7A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1DADCA7CC(a1, a2, a3, a4, MEMORY[0x1E4F3CEB8], MEMORY[0x1E4F3D090]);
}

uint64_t sub_1DADCA7CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  MEMORY[0x1F4188790]();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_1DADCA89C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1DADCA8E4()
{
  return sub_1DADCA510(&qword_1EB6827E0, &qword_1EB6827E8, &qword_1EB682AF8, &qword_1EB682B00);
}

uint64_t sub_1DADCA928()
{
  return sub_1DADCA610();
}

uint64_t sub_1DADCA940()
{
  return sub_1DADCA640();
}

uint64_t sub_1DADCA958@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADCA9AC(&qword_1EB682688, MEMORY[0x1E4F3CBF0], 0x694474756F79614CLL, 0xEF6E6F6974636572, a1);
}

uint64_t sub_1DADCA9AC@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v24 = a4;
  uint64_t v9 = v5;
  uint64_t v11 = sub_1DADF6030();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DADAE0AC(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = sub_1DADF69F0();
    uint64_t v21 = sub_1DADF6200();
    if (os_log_type_enabled(v21, v20))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v25 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      *(void *)(v22 + 4) = sub_1DADA5DB0(a3, v24, &v25);
      _os_log_impl(&dword_1DAD96000, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1E01829D0](v23, -1, -1);
      MEMORY[0x1E01829D0](v22, -1, -1);
    }

    sub_1DADF6020();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_1DADCAC34@<X0>(uint64_t *a1@<X8>)
{
  return sub_1DADA860C(&qword_1EB682688, a1);
}

uint64_t sub_1DADCAC48@<X0>(uint64_t *a1@<X8>)
{
  return sub_1DADA860C(&qword_1EB682F58, a1);
}

uint64_t sub_1DADCAC5C()
{
  type metadata accessor for BCUIRingAndGlyphView(0);
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BA0);
  MEMORY[0x1E0181A90](&v2, v0);
  return v2;
}

uint64_t type metadata accessor for BCUIRingAndGlyphView(uint64_t a1)
{
  return sub_1DADAD54C(a1, qword_1EB683CE0);
}

uint64_t sub_1DADCACDC()
{
  return sub_1DADF6620();
}

uint64_t (*sub_1DADCAD50(void *a1))()
{
  uint64_t v3 = malloc(0x68uLL);
  *a1 = v3;
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for BCUIRingAndGlyphView(0) + 24));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  v3[8] = *v4;
  v3[9] = v6;
  uint64_t v7 = v4[2];
  uint64_t v8 = v4[3];
  v3[10] = v7;
  v3[11] = v8;
  *uint64_t v3 = v5;
  v3[1] = v6;
  v3[2] = v7;
  v3[3] = v8;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v3[12] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BA0);
  MEMORY[0x1E0181A90]();
  return sub_1DADCAE08;
}

uint64_t sub_1DADCAE0C()
{
  type metadata accessor for BCUIRingAndGlyphView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BA0);
  sub_1DADF6640();
  return v1;
}

double sub_1DADCAE70()
{
  type metadata accessor for BCUIRingAndGlyphView(0);
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B80);
  MEMORY[0x1E0181A90](&v2, v0);
  return v2;
}

uint64_t sub_1DADCAED0()
{
  return sub_1DADF6620();
}

void (*sub_1DADCAF40(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for BCUIRingAndGlyphView(0) + 28));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  v3[5] = *v4;
  v3[6] = v6;
  uint64_t v7 = v4[2];
  v3[7] = v7;
  *uint64_t v3 = v5;
  v3[1] = v6;
  v3[2] = v7;
  swift_retain();
  swift_retain();
  v3[8] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B80);
  MEMORY[0x1E0181A90]();
  return sub_1DADA7A94;
}

double sub_1DADCAFE8()
{
  type metadata accessor for BCUIRingAndGlyphView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B80);
  sub_1DADF6640();
  return v1;
}

uint64_t sub_1DADCB04C()
{
  type metadata accessor for BCUIRingAndGlyphView(0);
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BA0);
  MEMORY[0x1E0181A90](&v2, v0);
  return v2;
}

uint64_t sub_1DADCB0AC()
{
  return sub_1DADF6620();
}

uint64_t (*sub_1DADCB120(void *a1))()
{
  uint64_t v3 = malloc(0x68uLL);
  *a1 = v3;
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for BCUIRingAndGlyphView(0) + 32));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  v3[8] = *v4;
  v3[9] = v6;
  uint64_t v7 = v4[2];
  uint64_t v8 = v4[3];
  v3[10] = v7;
  v3[11] = v8;
  *uint64_t v3 = v5;
  v3[1] = v6;
  v3[2] = v7;
  v3[3] = v8;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v3[12] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BA0);
  MEMORY[0x1E0181A90]();
  return sub_1DADCAE08;
}

void sub_1DADCB1D8(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)(*(void *)a1 + 48) = *(void *)(*(void *)a1 + 32);
  uint64_t v3 = v2[5];
  uint64_t v4 = v2[11];
  uint64_t v6 = v2[9];
  uint64_t v5 = v2[10];
  *uint64_t v2 = v2[8];
  v2[1] = v6;
  v2[2] = v5;
  v2[3] = v4;
  v2[7] = v3;
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_1DADF6620();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1DADF6620();
    swift_release();
    swift_release();
  }
  swift_bridgeObjectRelease();

  free(v2);
}

uint64_t sub_1DADCB2A0()
{
  type metadata accessor for BCUIRingAndGlyphView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BA0);
  sub_1DADF6640();
  return v1;
}

uint64_t sub_1DADCB304()
{
  type metadata accessor for BCUIRingAndGlyphView(0);
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B98);
  MEMORY[0x1E0181A90](&v2, v0);
  return v2;
}

uint64_t sub_1DADCB364()
{
  return sub_1DADF6620();
}

void (*sub_1DADCB3CC(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x48uLL);
  *a1 = v3;
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for BCUIRingAndGlyphView(0) + 36));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  v3[5] = *v4;
  v3[6] = v6;
  uint64_t v7 = v4[2];
  v3[7] = v7;
  *uint64_t v3 = v5;
  v3[1] = v6;
  v3[2] = v7;
  swift_retain();
  swift_retain();
  swift_retain();
  v3[8] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B98);
  MEMORY[0x1E0181A90]();
  return sub_1DADCB484;
}

void sub_1DADCB484(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  v2[4] = *(void *)(*(void *)a1 + 24);
  uint64_t v3 = v2[7];
  uint64_t v4 = v2[6];
  *uint64_t v2 = v2[5];
  v2[1] = v4;
  v2[2] = v3;
  if (a2)
  {
    swift_retain();
    sub_1DADF6620();
    swift_release();
  }
  else
  {
    sub_1DADF6620();
  }
  swift_release();
  swift_release();
  swift_release();

  free(v2);
}

uint64_t sub_1DADCB540()
{
  type metadata accessor for BCUIRingAndGlyphView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B98);
  sub_1DADF6640();
  return v1;
}

uint64_t sub_1DADCB5A4()
{
  type metadata accessor for BCUIRingAndGlyphView(0);
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  MEMORY[0x1E0181A90](&v2, v0);
  return v2;
}

uint64_t sub_1DADCB604()
{
  return sub_1DADF6620();
}

uint64_t (*sub_1DADCB66C(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for BCUIRingAndGlyphView(0) + 40));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  v3[3] = *v4;
  v3[4] = v6;
  LOBYTE(v4) = *((unsigned char *)v4 + 16);
  *((unsigned char *)v3 + 19) = (_BYTE)v4;
  *uint64_t v3 = v5;
  v3[1] = v6;
  *((unsigned char *)v3 + 16) = (_BYTE)v4;
  swift_retain();
  swift_retain();
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  MEMORY[0x1E0181A90]();
  return sub_1DADA78F8;
}

uint64_t sub_1DADCB714()
{
  type metadata accessor for BCUIRingAndGlyphView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  sub_1DADF6640();
  return v1;
}

uint64_t sub_1DADCB778()
{
  type metadata accessor for BCUIRingAndGlyphView(0);
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  MEMORY[0x1E0181A90](&v2, v0);
  return v2;
}

uint64_t sub_1DADCB7D8()
{
  return sub_1DADF6620();
}

uint64_t (*sub_1DADCB840(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for BCUIRingAndGlyphView(0) + 44));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  v3[3] = *v4;
  v3[4] = v6;
  LOBYTE(v4) = *((unsigned char *)v4 + 16);
  *((unsigned char *)v3 + 19) = (_BYTE)v4;
  *uint64_t v3 = v5;
  v3[1] = v6;
  *((unsigned char *)v3 + 16) = (_BYTE)v4;
  swift_retain();
  swift_retain();
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  MEMORY[0x1E0181A90]();
  return sub_1DADA78F8;
}

uint64_t sub_1DADCB8E8()
{
  type metadata accessor for BCUIRingAndGlyphView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  sub_1DADF6640();
  return v1;
}

uint64_t sub_1DADCB94C()
{
  type metadata accessor for BCUIRingAndGlyphView(0);
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  MEMORY[0x1E0181A90](&v2, v0);
  return v2;
}

uint64_t sub_1DADCB9AC()
{
  return sub_1DADF6620();
}

uint64_t (*sub_1DADCBA14(void *a1))()
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for BCUIRingAndGlyphView(0) + 48));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  v3[3] = *v4;
  v3[4] = v6;
  LOBYTE(v4) = *((unsigned char *)v4 + 16);
  *((unsigned char *)v3 + 19) = (_BYTE)v4;
  *uint64_t v3 = v5;
  v3[1] = v6;
  *((unsigned char *)v3 + 16) = (_BYTE)v4;
  swift_retain();
  swift_retain();
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  MEMORY[0x1E0181A90]();
  return sub_1DADA78F8;
}

uint64_t sub_1DADCBABC()
{
  type metadata accessor for BCUIRingAndGlyphView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  sub_1DADF6640();
  return v1;
}

uint64_t sub_1DADCBB20()
{
  return sub_1DADCBD94(MEMORY[0x1E4F3EE08]);
}

uint64_t sub_1DADCBB38(uint64_t a1)
{
  uint64_t v2 = sub_1DADF5D80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BCUIRingAndGlyphView(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  sub_1DADF6620();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1DADCBC44(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = sub_1DADF5D80();
  *uint64_t v3 = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[1] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[2] = malloc(v6);
  v3[3] = malloc(v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  v3[4] = v7;
  uint64_t v8 = malloc(*(void *)(*(void *)(v7 - 8) + 64));
  v3[5] = v8;
  uint64_t v9 = type metadata accessor for BCUIRingAndGlyphView(0);
  sub_1DADAE0AC(v1 + *(int *)(v9 + 52), (uint64_t)v8, &qword_1EB682B88);
  MEMORY[0x1E0181A90](v7);
  return sub_1DADCBD78;
}

uint64_t sub_1DADCBD7C()
{
  return sub_1DADCBD94(MEMORY[0x1E4F3EE10]);
}

uint64_t sub_1DADCBD94(uint64_t (*a1)(uint64_t))
{
  type metadata accessor for BCUIRingAndGlyphView(0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  return a1(v2);
}

uint64_t sub_1DADCBDE8()
{
  type metadata accessor for BCUIRingAndGlyphView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  return v1;
}

uint64_t sub_1DADCBE48()
{
  return sub_1DADF65F0();
}

uint64_t (*sub_1DADCBEB0(void *a1))()
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = (char *)(v1 + *(int *)(type metadata accessor for BCUIRingAndGlyphView(0) + 56));
  char v5 = *v4;
  v3[34] = *v4;
  uint64_t v6 = *((void *)v4 + 1);
  *uint64_t v3 = v5;
  *((void *)v3 + 1) = v6;
  *((void *)v3 + 2) = v6;
  swift_retain();
  *((void *)v3 + 3) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  return sub_1DADA8250;
}

uint64_t sub_1DADCBF4C()
{
  type metadata accessor for BCUIRingAndGlyphView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF6600();
  return v1;
}

double sub_1DADCBFB0()
{
  type metadata accessor for BCUIRingAndGlyphView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  sub_1DADF5C70();
  return v1;
}

double sub_1DADCBFFC()
{
  return 18.0;
}

double sub_1DADCC004()
{
  return 0.13;
}

uint64_t sub_1DADCC010()
{
  sub_1DADF65D0();
  return v1;
}

uint64_t sub_1DADCC04C()
{
  return sub_1DADF65F0();
}

uint64_t sub_1DADCC0BC()
{
  return sub_1DADF65F0();
}

uint64_t sub_1DADCC12C()
{
  return sub_1DADF65F0();
}

uint64_t sub_1DADCC198()
{
  uint64_t v1 = type metadata accessor for BCUIRingAndGlyphView(0);
  uint64_t v2 = MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v5 = (uint64_t *)(v0 + *(int *)(v2 + 28));
  uint64_t v6 = v5[1];
  uint64_t v7 = v5[2];
  uint64_t v17 = *v5;
  uint64_t v18 = v6;
  uint64_t v19 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B80);
  MEMORY[0x1E0181A90](&v20, v8);
  double v9 = v20;
  double v10 = *(double *)(v0 + *(int *)(v1 + 64)) / -360.0 + 1.0;
  sub_1DADD4D5C(v0, (uint64_t)v4, type metadata accessor for BCUIRingAndGlyphView);
  if (v10 >= v9)
  {
    char v15 = 0;
  }
  else
  {
    uint64_t v11 = &v4[*(int *)(v1 + 48)];
    uint64_t v12 = *(void *)v11;
    uint64_t v13 = *((void *)v11 + 1);
    LOBYTE(v11) = v11[16];
    uint64_t v17 = v12;
    uint64_t v18 = v13;
    LOBYTE(v19) = (_BYTE)v11;
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
    MEMORY[0x1E0181A90](&v20, v14);
    char v15 = LOBYTE(v20) ^ 1;
  }
  sub_1DADD5050((uint64_t)v4, type metadata accessor for BCUIRingAndGlyphView);
  return v15 & 1;
}

double sub_1DADCC2F4()
{
  uint64_t v1 = sub_1DADF5DA0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = MEMORY[0x1F4188790](v1);
  char v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v3);
  uint64_t v7 = (char *)v17 - v6;
  uint64_t v8 = (void *)(v0 + *(int *)(type metadata accessor for BCUIRingAndGlyphView(0) + 28));
  uint64_t v9 = v8[1];
  uint64_t v10 = v8[2];
  v17[0] = *v8;
  v17[1] = v9;
  v17[2] = v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B80);
  MEMORY[0x1E0181A90](&v18, v11);
  double v12 = v18;
  sub_1DADCA9AC(&qword_1EB682688, MEMORY[0x1E4F3CBF0], 0x694474756F79614CLL, 0xEF6E6F6974636572, (uint64_t)v7);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v5, *MEMORY[0x1E4F3CBE8], v1);
  char v13 = sub_1DADF5D90();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v2 + 8);
  v14(v5, v1);
  v14(v7, v1);
  double v15 = -90.0;
  if (v13) {
    double v15 = 90.0;
  }
  return v12 * 360.0 + -360.0 + v15;
}

double sub_1DADCC4F8()
{
  uint64_t v1 = sub_1DADF5D80();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v5 = (char *)(v0 + *(int *)(type metadata accessor for BCUIRingAndGlyphView(0) + 56));
  char v6 = *v5;
  uint64_t v7 = *((void *)v5 + 1);
  LOBYTE(v16) = v6;
  uint64_t v17 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  int v8 = v18;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1E0181A90](v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  sub_1DADF5C70();
  double v10 = 6.0;
  if (v8 == 1)
  {
    double v11 = v16;
    char v12 = sub_1DADF333C();
    double v13 = fmin(v11 + 6.0, 6.5);
    if (v12) {
      double v10 = v13;
    }
    else {
      double v10 = 6.0;
    }
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v10;
}

double sub_1DADCC67C(char a1, double a2)
{
  double v2 = 6.0;
  if (a1 & 1) != 0 && (sub_1DADF333C()) {
    return fmin(a2 + 6.0, 6.5);
  }
  return v2;
}

uint64_t sub_1DADCC6CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v116 = a1;
  uint64_t v2 = sub_1DADF5D80();
  uint64_t v113 = *(void *)(v2 - 8);
  uint64_t v114 = v2;
  MEMORY[0x1F4188790](v2);
  uint64_t v112 = (char *)&v97 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1DADF60A0();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v115 = (char *)&v97 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = type metadata accessor for BCUIRingAndGlyphView(0);
  uint64_t v119 = *(void *)(v121 - 8);
  uint64_t v6 = *(void *)(v119 + 64);
  MEMORY[0x1F4188790](v121);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F84E8);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (uint64_t *)((char *)&v97 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8470);
  uint64_t v11 = v10 - 8;
  MEMORY[0x1F4188790](v10);
  double v13 = (char *)&v97 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F84A0);
  MEMORY[0x1F4188790](v98);
  uint64_t v15 = (char *)&v97 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F84B8);
  uint64_t v101 = *(void *)(v100 - 8);
  MEMORY[0x1F4188790](v100);
  uint64_t v122 = (char *)&v97 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F84C0);
  uint64_t v105 = *(void *)(v104 - 8);
  MEMORY[0x1F4188790](v104);
  uint64_t v123 = (char *)&v97 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F84C8);
  uint64_t v106 = *(void *)(v109 - 8);
  MEMORY[0x1F4188790](v109);
  uint64_t v99 = (char *)&v97 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F84A8);
  uint64_t v110 = *(void *)(v111 - 8);
  MEMORY[0x1F4188790](v111);
  uint64_t v108 = (char *)&v97 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8458);
  MEMORY[0x1F4188790](v20 - 8);
  uint64_t v107 = (char *)&v97 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  *uint64_t v9 = sub_1DADF66D0();
  v9[1] = v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8448);
  sub_1DADCD31C(v1, (uint64_t)v9 + *(int *)(v23 + 44));
  uint64_t v24 = v1;
  sub_1DADCC4F8();
  char v25 = sub_1DADF6220();
  sub_1DADF5BE0();
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  sub_1DADAE0AC((uint64_t)v9, (uint64_t)v13, &qword_1EA8F84E8);
  uint64_t v34 = &v13[*(int *)(v11 + 44)];
  *uint64_t v34 = v25;
  *((void *)v34 + 1) = v27;
  *((void *)v34 + 2) = v29;
  *((void *)v34 + 3) = v31;
  *((void *)v34 + 4) = v33;
  v34[40] = 0;
  sub_1DADADF3C((uint64_t)v9, &qword_1EA8F84E8);
  uint64_t v35 = (char *)&v97 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = type metadata accessor for BCUIRingAndGlyphView;
  sub_1DADD4D5C(v24, (uint64_t)v35, type metadata accessor for BCUIRingAndGlyphView);
  uint64_t v36 = *(unsigned __int8 *)(v119 + 80);
  uint64_t v37 = ((v36 + 16) & ~v36) + v6;
  uint64_t v38 = (v36 + 16) & ~v36;
  uint64_t v117 = v36 | 7;
  uint64_t v118 = v37;
  uint64_t v39 = swift_allocObject();
  uint64_t v119 = v38;
  sub_1DADCEDB8((uint64_t)v35, v39 + v38);
  uint64_t v40 = v15;
  uint64_t v97 = v15;
  sub_1DADAE0AC((uint64_t)v13, (uint64_t)v15, &qword_1EA8F8470);
  uint64_t v41 = v98;
  uint64_t v42 = (uint64_t (**)())&v40[*(int *)(v98 + 36)];
  char *v42 = sub_1DADCEE1C;
  v42[1] = (uint64_t (*)())v39;
  v42[2] = 0;
  v42[3] = 0;
  sub_1DADADF3C((uint64_t)v13, &qword_1EA8F8470);
  uint64_t v43 = v121;
  uint64_t v44 = (void *)(v24 + *(int *)(v121 + 28));
  uint64_t v45 = *v44;
  uint64_t v46 = v44[1];
  uint64_t v103 = v44;
  unint64_t v47 = v44[2];
  *(void *)&long long v125 = v45;
  *((void *)&v125 + 1) = v46;
  unint64_t v126 = v47;
  uint64_t v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B80);
  MEMORY[0x1E0181A90](&v124);
  sub_1DADD4D5C(v24, (uint64_t)v35, type metadata accessor for BCUIRingAndGlyphView);
  uint64_t v48 = swift_allocObject() + v38;
  uint64_t v49 = (uint64_t)v35;
  sub_1DADCEDB8((uint64_t)v35, v48);
  unint64_t v50 = sub_1DADCF2DC();
  unint64_t v51 = sub_1DADCF378();
  uint64_t v52 = (uint64_t)v97;
  sub_1DADF6460();
  swift_release();
  sub_1DADADF3C(v52, &qword_1EA8F84A0);
  uint64_t v53 = v24 + *(int *)(v43 + 40);
  uint64_t v54 = *(void *)v53;
  uint64_t v55 = *(void *)(v53 + 8);
  LOBYTE(v53) = *(unsigned char *)(v53 + 16);
  *(void *)&long long v125 = v54;
  *((void *)&v125 + 1) = v55;
  LOBYTE(v126) = v53;
  uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  MEMORY[0x1E0181A90](&v124);
  sub_1DADD4D5C(v24, v49, v120);
  uint64_t v57 = swift_allocObject();
  sub_1DADCEDB8(v49, v57 + v119);
  *(void *)&long long v125 = v41;
  *((void *)&v125 + 1) = MEMORY[0x1E4FBC958];
  unint64_t v126 = v50;
  unint64_t v127 = v51;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v59 = v122;
  uint64_t v60 = v100;
  sub_1DADF6460();
  swift_release();
  (*(void (**)(char *, uint64_t))(v101 + 8))(v59, v60);
  uint64_t v61 = (int *)v121;
  uint64_t v62 = v24 + *(int *)(v121 + 44);
  uint64_t v63 = *(void *)v62;
  uint64_t v64 = *(void *)(v62 + 8);
  LOBYTE(v62) = *(unsigned char *)(v62 + 16);
  *(void *)&long long v125 = v63;
  *((void *)&v125 + 1) = v64;
  LOBYTE(v126) = v62;
  uint64_t v122 = (char *)v56;
  MEMORY[0x1E0181A90](&v124, v56);
  sub_1DADD4D5C(v24, v49, v120);
  uint64_t v65 = swift_allocObject();
  uint64_t v66 = v99;
  sub_1DADCEDB8(v49, v65 + v119);
  *(void *)&long long v125 = v60;
  unint64_t v67 = MEMORY[0x1E4FBB3A8];
  *((void *)&v125 + 1) = MEMORY[0x1E4FBB390];
  unint64_t v126 = OpaqueTypeConformance2;
  unint64_t v127 = MEMORY[0x1E4FBB3A8];
  uint64_t v68 = MEMORY[0x1E4FBB390];
  uint64_t v69 = swift_getOpaqueTypeConformance2();
  uint64_t v70 = v104;
  uint64_t v71 = v123;
  sub_1DADF6460();
  swift_release();
  (*(void (**)(char *, uint64_t))(v105 + 8))(v71, v70);
  uint64_t v72 = v24 + v61[9];
  long long v73 = *(_OWORD *)v72;
  unint64_t v74 = *(void *)(v72 + 16);
  long long v125 = v73;
  unint64_t v126 = v74;
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B98);
  MEMORY[0x1E0181A90](&v124, v75);
  double v76 = v124;
  if (v124 != 0.0) {
    swift_release();
  }
  *(void *)&long long v125 = v70;
  *((void *)&v125 + 1) = v68;
  unint64_t v126 = v69;
  unint64_t v127 = v67;
  uint64_t v77 = swift_getOpaqueTypeConformance2();
  uint64_t v78 = v108;
  uint64_t v79 = v109;
  sub_1DADF1E50(*(void *)&v76 != 0, v109, v77, v108);
  (*(void (**)(char *, uint64_t))(v106 + 8))(v66, v79);
  sub_1DADF6090();
  sub_1DADF6080();
  uint64_t v80 = v24 + v61[6];
  long long v81 = *(_OWORD *)v80;
  unint64_t v83 = *(void *)(v80 + 16);
  unint64_t v82 = *(void *)(v80 + 24);
  long long v125 = v81;
  unint64_t v126 = v83;
  unint64_t v127 = v82;
  uint64_t v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BA0);
  MEMORY[0x1E0181A90](&v124, v84);
  sub_1DADF6070();
  swift_bridgeObjectRelease();
  sub_1DADF6080();
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  uint64_t v86 = v112;
  MEMORY[0x1E0181A90](v85);
  char v87 = sub_1DADF301C();
  (*(void (**)(char *, uint64_t))(v113 + 8))(v86, v114);
  uint64_t v88 = v103[1];
  unint64_t v89 = v103[2];
  *(void *)&long long v125 = *v103;
  *((void *)&v125 + 1) = v88;
  unint64_t v126 = v89;
  MEMORY[0x1E0181A90](&v124, v102);
  double v90 = sub_1DADF3650(v124);
  sub_1DADBFCD8(v87 & 1, v90);
  sub_1DADF6070();
  swift_bridgeObjectRelease();
  sub_1DADF6080();
  uint64_t v91 = v24 + v61[12];
  uint64_t v92 = *(void *)v91;
  uint64_t v93 = *(void *)(v91 + 8);
  LOBYTE(v91) = *(unsigned char *)(v91 + 16);
  *(void *)&long long v125 = v92;
  *((void *)&v125 + 1) = v93;
  LOBYTE(v126) = v91;
  MEMORY[0x1E0181A90](&v124, v122);
  sub_1DADF26EC(SLOBYTE(v124));
  sub_1DADF6070();
  swift_bridgeObjectRelease();
  sub_1DADF6080();
  sub_1DADF60C0();
  *(void *)&long long v125 = v79;
  *((void *)&v125 + 1) = v77;
  swift_getOpaqueTypeConformance2();
  uint64_t v94 = (uint64_t)v107;
  uint64_t v95 = v111;
  sub_1DADF63D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v110 + 8))(v78, v95);
  return sub_1DADADF98(v94, v116, &qword_1EA8F8458);
}

uint64_t sub_1DADCD31C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v195 = a2;
  uint64_t v186 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1F4188790](v186);
  uint64_t v187 = (char *)&v159 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v188 = type metadata accessor for DeviceGlyph(0);
  MEMORY[0x1F4188790](v188);
  uint64_t v190 = (uint64_t *)((char *)&v159 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v189 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682AD0);
  MEMORY[0x1F4188790](v189);
  uint64_t v192 = (uint64_t)&v159 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v191 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6827C8);
  uint64_t v6 = MEMORY[0x1F4188790](v191);
  uint64_t v194 = (uint64_t)&v159 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v193 = (uint64_t)&v159 - v8;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F84D8);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v160 = (uint64_t *)((char *)&v159 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F84D0);
  MEMORY[0x1F4188790](v159);
  uint64_t v162 = (uint64_t)&v159 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8460);
  MEMORY[0x1F4188790](v164);
  uint64_t v163 = (char *)&v159 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8480);
  uint64_t v183 = *(void *)(v13 - 8);
  uint64_t v184 = v13;
  MEMORY[0x1F4188790](v13);
  uint64_t v161 = (char *)&v159 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8488);
  uint64_t v16 = MEMORY[0x1F4188790](v15 - 8);
  uint64_t v203 = (uint64_t)&v159 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v16);
  uint64_t v208 = (uint64_t)&v159 - v18;
  uint64_t v198 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6829E0);
  MEMORY[0x1F4188790](v198);
  uint64_t v178 = (uint64_t *)((char *)&v159 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v197 = sub_1DADF5E80();
  *(void *)&long long v205 = *(void *)(v197 - 8);
  MEMORY[0x1F4188790](v197);
  v175 = (char *)&v159 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v177 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6827D8);
  MEMORY[0x1F4188790](v177);
  uint64_t v176 = (long long *)((char *)&v159 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v182 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682858);
  uint64_t v22 = MEMORY[0x1F4188790](v182);
  uint64_t v180 = (char *)&v159 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v22);
  uint64_t v181 = (char *)&v159 - v24;
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F84B0);
  uint64_t v201 = *(void *)(v25 - 8);
  uint64_t v202 = v25;
  uint64_t v26 = MEMORY[0x1F4188790](v25);
  uint64_t v185 = (char *)&v159 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = MEMORY[0x1F4188790](v26);
  v179 = (char *)&v159 - v29;
  MEMORY[0x1F4188790](v28);
  uint64_t v207 = (char *)&v159 - v30;
  uint64_t v31 = sub_1DADF5DA0();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = MEMORY[0x1F4188790](v31);
  uint64_t v35 = (char *)&v159 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v33);
  uint64_t v37 = (char *)&v159 - v36;
  uint64_t v196 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682840);
  uint64_t v38 = MEMORY[0x1F4188790](v196);
  uint64_t v200 = (uint64_t)&v159 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = MEMORY[0x1F4188790](v38);
  uint64_t v172 = (char *)&v159 - v41;
  uint64_t v42 = MEMORY[0x1F4188790](v40);
  uint64_t v174 = (char *)&v159 - v43;
  MEMORY[0x1F4188790](v42);
  uint64_t v206 = (uint64_t)&v159 - v44;
  id v45 = objc_msgSend(self, sel_labelColor);
  MEMORY[0x1E01818F0](v45);
  uint64_t v199 = type metadata accessor for BCUIRingAndGlyphView(0);
  uint64_t v166 = sub_1DADF64E0();
  swift_release();
  uint64_t v204 = a1;
  sub_1DADCC4F8();
  sub_1DADF5C30();
  uint64_t v46 = v222;
  uint64_t v47 = v224;
  uint64_t v48 = v225;
  uint64_t v49 = v226;
  uint64_t v165 = sub_1DADF66D0();
  uint64_t v51 = v50;
  uint64_t v173 = (void (*)(char *, char *, uint64_t))MEMORY[0x1E4F3CBF0];
  sub_1DADCA9AC(&qword_1EB682688, MEMORY[0x1E4F3CBF0], 0x694474756F79614CLL, 0xEF6E6F6974636572, (uint64_t)v37);
  unsigned int v171 = *MEMORY[0x1E4F3CBE8];
  v170 = *(void (**)(char *))(v32 + 104);
  uint64_t v52 = v223;
  uint64_t v53 = v35;
  uint64_t v54 = v35;
  uint64_t v55 = v31;
  uint64_t v167 = v31;
  v170(v54);
  uint64_t v168 = v53;
  LOBYTE(v31) = sub_1DADF5D90();
  uint64_t v56 = *(void (**)(char *, uint64_t))(v32 + 8);
  uint64_t v169 = v32 + 8;
  v56(v53, v55);
  v56(v37, v55);
  if (v31) {
    double v57 = 1.57079633;
  }
  else {
    double v57 = -1.57079633;
  }
  sub_1DADF6740();
  long long v214 = xmmword_1DADF92B0;
  *(void *)&long long v215 = v46;
  *((void *)&v215 + 1) = v52;
  *(void *)&long long v216 = v47;
  *((void *)&v216 + 1) = v48;
  *(void *)&long long v217 = v49;
  *((void *)&v217 + 1) = v166;
  LOWORD(v218) = 256;
  *((void *)&v218 + 1) = v165;
  *(void *)&long long v219 = v51;
  *((double *)&v219 + 1) = v57;
  *(void *)&long long v220 = v58;
  *((void *)&v220 + 1) = v59;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682798);
  sub_1DADD4E50(&qword_1EB682790, &qword_1EB682798, &qword_1EB682928, &qword_1EB682930);
  uint64_t v60 = (uint64_t)v172;
  sub_1DADF6410();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v61 = (uint64_t)v174;
  sub_1DADF5DB0();
  sub_1DADADF3C(v60, &qword_1EB682840);
  sub_1DADADF98(v61, v206, &qword_1EB682840);
  uint64_t v62 = v199;
  uint64_t v63 = v204;
  uint64_t v64 = (uint64_t *)(v204 + *(int *)(v199 + 72));
  uint64_t v65 = *v64;
  uint64_t v66 = v64[1];
  *(void *)&long long v214 = v65;
  *((void *)&v214 + 1) = v66;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A90);
  sub_1DADF65E0();
  unint64_t v67 = v227;
  uint64_t v68 = (uint64_t *)(v63 + *(int *)(v62 + 80));
  uint64_t v70 = *v68;
  uint64_t v69 = v68[1];
  *(void *)&long long v214 = v70;
  *((void *)&v214 + 1) = v69;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A80);
  sub_1DADF65E0();
  uint64_t v174 = v227;
  sub_1DADCC4F8();
  sub_1DADF5C30();
  uint64_t v71 = v227;
  uint64_t v72 = v229;
  uint64_t v172 = v230;
  uint64_t v73 = v231;
  uint64_t v74 = sub_1DADF66D0();
  uint64_t v76 = v75;
  sub_1DADCA9AC(&qword_1EB682688, (uint64_t (*)(void))v173, 0x694474756F79614CLL, 0xEF6E6F6974636572, (uint64_t)v37);
  uint64_t v77 = v228;
  uint64_t v79 = v167;
  uint64_t v78 = v168;
  ((void (*)(char *, void, uint64_t))v170)(v168, v171, v167);
  uint64_t v80 = v78;
  LOBYTE(v78) = sub_1DADF5D90();
  v56(v80, v79);
  v56(v37, v79);
  if (v78) {
    double v81 = 1.57079633;
  }
  else {
    double v81 = -1.57079633;
  }
  sub_1DADF6740();
  uint64_t v83 = v82;
  uint64_t v85 = v84;
  uint64_t v86 = v63 + *(int *)(v62 + 32);
  uint64_t v87 = *(void *)(v86 + 16);
  uint64_t v88 = *(void *)(v86 + 24);
  long long v214 = *(_OWORD *)v86;
  *(void *)&long long v215 = v87;
  *((void *)&v215 + 1) = v88;
  uint64_t v196 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BA0);
  MEMORY[0x1E0181A90](&v209);
  *(void *)&long long v214 = 0;
  *((void *)&v214 + 1) = v67;
  *(void *)&long long v215 = v71;
  *((void *)&v215 + 1) = v77;
  *(void *)&long long v216 = v72;
  *((void *)&v216 + 1) = v172;
  *(void *)&long long v217 = v73;
  unint64_t v89 = v175;
  *((void *)&v217 + 1) = v174;
  LOWORD(v218) = 256;
  *((void *)&v218 + 1) = v74;
  *(void *)&long long v219 = v76;
  *((double *)&v219 + 1) = v81;
  *(void *)&long long v220 = v83;
  *((void *)&v220 + 1) = v85;
  long long v221 = v209;
  sub_1DADF5E50();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v91 = v197;
  uint64_t v92 = v178;
  uint64_t v93 = (char *)v178 + *(int *)(v198 + 28);
  uint64_t v94 = v205;
  uint64_t v173 = *(void (**)(char *, char *, uint64_t))(v205 + 16);
  uint64_t v174 = (char *)(v205 + 16);
  v173(v93, v89, v197);
  *uint64_t v92 = KeyPath;
  uint64_t v95 = v176;
  sub_1DADAE0AC((uint64_t)v92, (uint64_t)v176 + *(int *)(v177 + 36), &qword_1EB6829E0);
  long long v96 = v219;
  long long v97 = v220;
  v95[4] = v218;
  v95[5] = v96;
  long long v98 = v221;
  v95[6] = v97;
  v95[7] = v98;
  long long v99 = v215;
  *uint64_t v95 = v214;
  v95[1] = v99;
  long long v100 = v217;
  void v95[2] = v216;
  v95[3] = v100;
  sub_1DADD4EEC((uint64_t)&v214);
  sub_1DADADF3C((uint64_t)v92, &qword_1EB6829E0);
  uint64_t v101 = v94 + 8;
  uint64_t v102 = *(char **)(v94 + 8);
  uint64_t v103 = v89;
  *(void *)&long long v205 = v101;
  uint64_t v178 = (uint64_t *)v102;
  ((void (*)(char *, uint64_t))v102)(v89, v91);
  sub_1DADD4F38((uint64_t)&v214);
  sub_1DADD50B0(&qword_1EB6827D0, &qword_1EB6827D8, &qword_1EB682AD8, &qword_1EB682AE0);
  uint64_t v104 = (uint64_t)v180;
  sub_1DADF6410();
  sub_1DADADF3C((uint64_t)v95, &qword_1EB6827D8);
  uint64_t v105 = (uint64_t)v181;
  sub_1DADF5DB0();
  sub_1DADADF3C(v104, &qword_1EB682858);
  sub_1DADD4F84();
  uint64_t v106 = v179;
  sub_1DADF6360();
  sub_1DADADF3C(v105, &qword_1EB682858);
  uint64_t v107 = v106;
  uint64_t v108 = v86;
  (*(void (**)(char *, char *, uint64_t))(v201 + 32))(v207, v107, v202);
  char v109 = sub_1DADCC198();
  uint64_t v110 = 1;
  if (v109)
  {
    uint64_t v111 = sub_1DADF66D0();
    uint64_t v112 = (uint64_t)v160;
    uint64_t *v160 = v111;
    *(void *)(v112 + 8) = v113;
    uint64_t v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F88F8);
    sub_1DADCE634(v204, v112 + *(int *)(v114 + 44));
    uint64_t v115 = *(void *)(v86 + 16);
    uint64_t v116 = *(void *)(v86 + 24);
    long long v209 = *(_OWORD *)v86;
    uint64_t v210 = v115;
    uint64_t v211 = v116;
    MEMORY[0x1E0181A90](&v212, v196);
    long long v117 = v212;
    uint64_t v118 = v162;
    sub_1DADAE0AC(v112, v162, &qword_1EA8F84D8);
    *(_OWORD *)(v118 + *(int *)(v159 + 52)) = v117;
    sub_1DADADF3C(v112, &qword_1EA8F84D8);
    sub_1DADF5E50();
    uint64_t v119 = swift_getKeyPath();
    uint64_t v120 = (uint64_t)v163;
    uint64_t v121 = (uint64_t *)&v163[*(int *)(v164 + 36)];
    uint64_t v122 = v197;
    v173((char *)v121 + *(int *)(v198 + 28), v103, v197);
    *uint64_t v121 = v119;
    sub_1DADAE0AC(v118, v120, &qword_1EA8F84D0);
    ((void (*)(char *, uint64_t))v178)(v103, v122);
    sub_1DADADF3C(v118, &qword_1EA8F84D0);
    sub_1DADD50B0(&qword_1EA8F8900, &qword_1EA8F8460, &qword_1EA8F8908, &qword_1EA8F84D0);
    uint64_t v123 = (uint64_t)v161;
    sub_1DADF63E0();
    sub_1DADADF3C(v120, &qword_1EA8F8460);
    sub_1DADADF98(v123, v208, &qword_1EA8F8480);
    uint64_t v110 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v183 + 56))(v208, v110, 1, v184);
  uint64_t v124 = v199;
  uint64_t v125 = v204;
  unint64_t v126 = (long long *)(v204 + *(int *)(v199 + 36));
  long long v127 = *v126;
  uint64_t v128 = *((void *)v126 + 2);
  long long v212 = v127;
  uint64_t v213 = v128;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B98);
  sub_1DADF6640();
  long long v205 = v209;
  uint64_t v129 = v210;
  uint64_t v130 = (uint64_t)v187;
  sub_1DADF6640();
  uint64_t v131 = v125 + *(int *)(v124 + 56);
  char v132 = *(unsigned char *)v131;
  uint64_t v133 = *(void *)(v131 + 8);
  LOBYTE(v209) = v132;
  *((void *)&v209 + 1) = v133;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  char v134 = v212;
  uint64_t v135 = *(void *)sub_1DADF3C38();
  uint64_t v136 = swift_getKeyPath();
  uint64_t v137 = (uint64_t)v190;
  *uint64_t v190 = v136;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  swift_storeEnumTagMultiPayload();
  uint64_t v138 = v188;
  uint64_t v139 = v137 + *(int *)(v188 + 20);
  *(_OWORD *)uint64_t v139 = v205;
  *(void *)(v139 + 16) = v129;
  sub_1DADADF98(v130, v137 + *(int *)(v138 + 24), &qword_1EB682B88);
  uint64_t v140 = v137 + *(int *)(v138 + 28);
  LOBYTE(v212) = v134;
  sub_1DADF65D0();
  uint64_t v141 = *((void *)&v209 + 1);
  *(unsigned char *)uint64_t v140 = v209;
  *(void *)(v140 + 8) = v141;
  *(void *)&long long v209 = v135;
  sub_1DADB2BCC();
  sub_1DADF5C60();
  uint64_t v142 = *(void *)(v108 + 16);
  uint64_t v143 = *(void *)(v108 + 24);
  long long v209 = *(_OWORD *)v108;
  uint64_t v210 = v142;
  uint64_t v211 = v143;
  MEMORY[0x1E0181A90](&v212, v196);
  long long v144 = v212;
  uint64_t v145 = v192;
  sub_1DADD4D5C(v137, v192, type metadata accessor for DeviceGlyph);
  *(_OWORD *)(v145 + *(int *)(v189 + 52)) = v144;
  sub_1DADD5050(v137, type metadata accessor for DeviceGlyph);
  sub_1DADF5CE0();
  sub_1DADF5CD0();
  sub_1DADF5CF0();
  swift_release();
  swift_release();
  sub_1DADF37B8();
  swift_retain();
  uint64_t v146 = sub_1DADF5D00();
  swift_release();
  swift_release();
  uint64_t v147 = v194;
  sub_1DADAE0AC(v145, v194, &qword_1EB682AD0);
  *(void *)(v147 + *(int *)(v191 + 36)) = v146;
  sub_1DADADF3C(v145, &qword_1EB682AD0);
  uint64_t v148 = v193;
  sub_1DADADF98(v147, v193, &qword_1EB6827C8);
  uint64_t v149 = v200;
  sub_1DADAE0AC(v206, v200, &qword_1EB682840);
  uint64_t v150 = v201;
  uint64_t v151 = v202;
  uint64_t v152 = *(void (**)(char *, char *, uint64_t))(v201 + 16);
  uint64_t v153 = v185;
  v152(v185, v207, v202);
  sub_1DADAE0AC(v208, v203, &qword_1EA8F8488);
  sub_1DADAE0AC(v148, v147, &qword_1EB6827C8);
  uint64_t v154 = v195;
  sub_1DADAE0AC(v149, v195, &qword_1EB682840);
  uint64_t v155 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8478);
  v152((char *)(v154 + v155[12]), v153, v151);
  uint64_t v156 = v203;
  sub_1DADAE0AC(v203, v154 + v155[16], &qword_1EA8F8488);
  sub_1DADAE0AC(v147, v154 + v155[20], &qword_1EB6827C8);
  sub_1DADADF3C(v148, &qword_1EB6827C8);
  sub_1DADADF3C(v208, &qword_1EA8F8488);
  uint64_t v157 = *(void (**)(char *, uint64_t))(v150 + 8);
  v157(v207, v151);
  sub_1DADADF3C(v206, &qword_1EB682840);
  sub_1DADADF3C(v147, &qword_1EB6827C8);
  sub_1DADADF3C(v156, &qword_1EA8F8488);
  v157(v153, v151);
  return sub_1DADADF3C(v200, &qword_1EB682840);
}

uint64_t sub_1DADCE634@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v88 = a2;
  uint64_t v3 = sub_1DADF5DA0();
  uint64_t v79 = *(void *)(v3 - 8);
  uint64_t v80 = v3;
  uint64_t v4 = MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  uint64_t v78 = (uint64_t)&v75 - v7;
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682840);
  MEMORY[0x1F4188790](v87);
  uint64_t v84 = (char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8910);
  uint64_t v89 = *(void *)(v86 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v86);
  uint64_t v85 = (char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x1F4188790](v9);
  double v81 = (char *)&v75 - v12;
  MEMORY[0x1F4188790](v11);
  uint64_t v83 = (char *)&v75 - v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8918);
  uint64_t v15 = MEMORY[0x1F4188790](v14 - 8);
  uint64_t v82 = (uint64_t)&v75 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v77 = (uint64_t)&v75 - v17;
  uint64_t v18 = (int *)type metadata accessor for BCUIRingAndGlyphView(0);
  double v19 = *(double *)(a1 + v18[16]);
  double v76 = v19 / 360.0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8920);
  *(double *)&uint64_t v20 = COERCE_DOUBLE(swift_allocObject());
  *(_OWORD *)(v20 + 16) = xmmword_1DADF92C0;
  sub_1DADF6490();
  uint64_t v21 = sub_1DADF64E0();
  swift_release();
  *(void *)(v20 + 32) = v21;
  *(void *)(v20 + 40) = sub_1DADF64A0();
  double v90 = *(double *)&v20;
  sub_1DADF6930();
  uint64_t v22 = MEMORY[0x1E0181AF0](*(void *)&v90);
  sub_1DADF6740();
  MEMORY[0x1E01811F0](&v107, v22);
  double v23 = v107;
  long long v75 = v108;
  uint64_t v24 = v109;
  double v25 = v110;
  sub_1DADCC4F8();
  sub_1DADF5C30();
  uint64_t v26 = v111;
  uint64_t v27 = v113;
  uint64_t v28 = v114;
  uint64_t v29 = v115;
  uint64_t v30 = sub_1DADF66D0();
  uint64_t v32 = v31;
  double v33 = sub_1DADCC2F4() * 0.0174532925;
  sub_1DADF6740();
  double v90 = 0.0;
  double v91 = v76;
  uint64_t v92 = v26;
  uint64_t v93 = v112;
  uint64_t v94 = v27;
  uint64_t v95 = v28;
  uint64_t v96 = v29;
  double v97 = v23;
  long long v98 = v75;
  uint64_t v99 = v24;
  double v100 = v25;
  LOWORD(v101) = 256;
  uint64_t v102 = v30;
  uint64_t v103 = v32;
  double v104 = v33;
  uint64_t v105 = v34;
  uint64_t v106 = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8928);
  sub_1DADD4E50(&qword_1EA8F8930, &qword_1EA8F8928, &qword_1EA8F8938, &qword_1EA8F8940);
  sub_1DADF63E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v36 = (double *)(a1 + v18[7]);
  double v37 = v36[1];
  uint64_t v38 = *((void *)v36 + 2);
  double v39 = (360.0 - v19) / 360.0;
  double v90 = *v36;
  double v91 = v37;
  uint64_t v92 = v38;
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B80);
  MEMORY[0x1E0181A90](v116, v40);
  double v41 = *(double *)v116;
  uint64_t v42 = (double *)(a1 + v18[20]);
  double v44 = *v42;
  double v43 = v42[1];
  double v90 = v44;
  double v91 = v43;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A80);
  sub_1DADF65E0();
  double v76 = *(double *)v116;
  sub_1DADCC4F8();
  sub_1DADF5C30();
  uint64_t v45 = v116[0];
  uint64_t v46 = v116[2];
  uint64_t v47 = v116[3];
  uint64_t v48 = v116[4];
  uint64_t v49 = sub_1DADF66D0();
  uint64_t v51 = v50;
  uint64_t v52 = v78;
  sub_1DADCA9AC(&qword_1EB682688, MEMORY[0x1E4F3CBF0], 0x694474756F79614CLL, 0xEF6E6F6974636572, v78);
  uint64_t v54 = v79;
  uint64_t v53 = v80;
  uint64_t v55 = v116[1];
  uint64_t v56 = v6;
  (*(void (**)(char *, void, uint64_t))(v79 + 104))(v6, *MEMORY[0x1E4F3CBE8], v80);
  LOBYTE(v6) = sub_1DADF5D90();
  double v57 = *(void (**)(char *, uint64_t))(v54 + 8);
  v57(v56, v53);
  v57((char *)v52, v53);
  if (v6) {
    double v58 = 1.57079633;
  }
  else {
    double v58 = -1.57079633;
  }
  sub_1DADF6740();
  double v90 = v39;
  double v91 = v41;
  uint64_t v92 = v45;
  uint64_t v93 = v55;
  uint64_t v94 = v46;
  uint64_t v95 = v47;
  uint64_t v96 = v48;
  double v97 = v76;
  LOWORD(v98) = 256;
  *((void *)&v98 + 1) = v49;
  uint64_t v99 = v51;
  double v100 = v58;
  uint64_t v101 = v59;
  uint64_t v102 = v60;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682798);
  sub_1DADD4E50(&qword_1EB682790, &qword_1EB682798, &qword_1EB682928, &qword_1EB682930);
  uint64_t v61 = (uint64_t)v84;
  sub_1DADF63E0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1DADD5170();
  uint64_t v62 = v81;
  sub_1DADF6360();
  sub_1DADADF3C(v61, &qword_1EB682840);
  uint64_t v63 = v89;
  uint64_t v64 = v83;
  uint64_t v65 = v86;
  (*(void (**)(char *, char *, uint64_t))(v89 + 32))(v83, v62, v86);
  uint64_t v66 = v77;
  uint64_t v67 = v82;
  sub_1DADAE0AC(v77, v82, &qword_1EA8F8918);
  uint64_t v68 = *(void (**)(char *, char *, uint64_t))(v63 + 16);
  uint64_t v69 = v85;
  uint64_t v70 = v65;
  v68(v85, v64, v65);
  uint64_t v71 = v88;
  sub_1DADAE0AC(v67, v88, &qword_1EA8F8918);
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8950);
  v68((char *)(v71 + *(int *)(v72 + 48)), v69, v70);
  uint64_t v73 = *(void (**)(char *, uint64_t))(v89 + 8);
  v73(v64, v70);
  sub_1DADADF3C(v66, &qword_1EA8F8918);
  v73(v69, v70);
  return sub_1DADADF3C(v67, &qword_1EA8F8918);
}

uint64_t sub_1DADCEDB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BCUIRingAndGlyphView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADCEE1C()
{
  uint64_t v1 = type metadata accessor for BCUIRingAndGlyphView(0);
  uint64_t v2 = v0
     + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80));
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B80);
  MEMORY[0x1E0181A90](&v8);
  _OWORD v7[3] = v2;
  sub_1DADF5D30();
  MEMORY[0x1E0181A90](v7, v3);
  sub_1DADF5D30();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  MEMORY[0x1E0181A90](&v9);
  char v5 = v9;
  MEMORY[0x1E0181A90](&v9, v4);
  sub_1DADCEFF8(v5, v9);
  sub_1DADF5D30();
  return swift_release();
}

uint64_t sub_1DADCEFF8(char a1, char a2)
{
  uint64_t v4 = sub_1DADF6790();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v14 - v9;
  type metadata accessor for BCUIRingAndGlyphView(0);
  sub_1DADCA9AC(&qword_1EB682F58, MEMORY[0x1E4F46AE8], 0xD000000000000013, 0x80000001DADFAD40, (uint64_t)v10);
  sub_1DADF6780();
  sub_1DADADFFC(&qword_1EB682BC0, MEMORY[0x1E4F46AE8]);
  char v11 = sub_1DADF6800();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  v12(v10, v4);
  if (v11)
  {
    sub_1DADF3990();
    return swift_retain();
  }
  else if (a2)
  {
    return sub_1DADF64D0();
  }
  else if (a1)
  {
    return sub_1DADF6480();
  }
  else
  {
    return sub_1DADF64B0();
  }
}

uint64_t sub_1DADCF1D4()
{
  return swift_release();
}

unint64_t sub_1DADCF2DC()
{
  unint64_t result = qword_1EA8F8498;
  if (!qword_1EA8F8498)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F84A0);
    sub_1DADD3AD8(&qword_1EA8F8468, &qword_1EA8F8470, &qword_1EA8F84E0, &qword_1EA8F84E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8498);
  }
  return result;
}

unint64_t sub_1DADCF378()
{
  unint64_t result = qword_1EB682608;
  if (!qword_1EB682608)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB682608);
  }
  return result;
}

uint64_t sub_1DADCF3D0(uint64_t a1, unsigned char *a2)
{
  type metadata accessor for BCUIRingAndGlyphView(0);
  LOBYTE(a2) = *a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  MEMORY[0x1E0181A90](&v5, v3);
  sub_1DADCEFF8((char)a2, v5);
  sub_1DADF37B8();
  swift_retain();
  sub_1DADF5D30();
  swift_release();
  return swift_release();
}

uint64_t sub_1DADCF4D8(uint64_t a1, unsigned char *a2)
{
  type metadata accessor for BCUIRingAndGlyphView(0);
  LOBYTE(a2) = *a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BB0);
  MEMORY[0x1E0181A90](&v5, v3);
  sub_1DADCEFF8(v5, (char)a2);
  sub_1DADF37B8();
  swift_retain();
  sub_1DADF5D30();
  swift_release();
  return swift_release();
}

uint64_t sub_1DADCF5DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, double a11@<D1>, long long a12, uint64_t a13, long long a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25)
{
  sub_1DADADF98(a1, a9, &qword_1EB6826B8);
  uint64_t v31 = (int *)type metadata accessor for BCUIRingAndGlyphView(0);
  uint64_t v32 = (uint64_t *)(a9 + v31[5]);
  uint64_t *v32 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  swift_storeEnumTagMultiPayload();
  double v33 = (void *)(a9 + v31[6]);
  void *v33 = a2;
  v33[1] = a3;
  v33[2] = a4;
  void v33[3] = a5;
  uint64_t v34 = a9 + v31[7];
  *(void *)uint64_t v34 = a6;
  *(void *)(v34 + 8) = a7;
  *(double *)(v34 + 16) = a10;
  uint64_t v35 = a9 + v31[8];
  *(void *)uint64_t v35 = a8;
  *(_OWORD *)(v35 + 8) = a12;
  *(void *)(v35 + 24) = a13;
  uint64_t v36 = a9 + v31[9];
  *(_OWORD *)uint64_t v36 = a14;
  *(void *)(v36 + 16) = a15;
  uint64_t v37 = a9 + v31[10];
  *(void *)uint64_t v37 = a16;
  *(void *)(v37 + 8) = a17;
  *(unsigned char *)(v37 + 16) = a18;
  uint64_t v38 = a9 + v31[11];
  *(void *)uint64_t v38 = a19;
  *(void *)(v38 + 8) = a20;
  *(unsigned char *)(v38 + 16) = a21;
  uint64_t v39 = a9 + v31[12];
  *(void *)uint64_t v39 = a22;
  *(void *)(v39 + 8) = a23;
  *(unsigned char *)(v39 + 16) = a24;
  sub_1DADADF98(a25, a9 + v31[13], &qword_1EB682B88);
  uint64_t v40 = a9 + v31[14];
  sub_1DADF65D0();
  *(unsigned char *)uint64_t v40 = v49;
  *(void *)(v40 + 8) = v50;
  sub_1DADB2BCC();
  sub_1DADF5C60();
  *(void *)(a9 + v31[16]) = 0x4032000000000000;
  *(void *)(a9 + v31[17]) = 0x3FC0A3D70A3D70A4;
  uint64_t v41 = a9 + v31[18];
  sub_1DADF65D0();
  *(double *)uint64_t v41 = a11;
  *(void *)(v41 + 8) = v50;
  uint64_t v42 = a9 + v31[19];
  sub_1DADF65D0();
  *(double *)uint64_t v42 = a11;
  *(void *)(v42 + 8) = v50;
  uint64_t v43 = a9 + v31[20];
  sub_1DADF64B0();
  uint64_t result = sub_1DADF65D0();
  *(double *)uint64_t v43 = a11;
  *(void *)(v43 + 8) = v50;
  return result;
}

double sub_1DADCF8D0()
{
  uint64_t v1 = sub_1DADF5D80();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (char *)(v0 + *(int *)(type metadata accessor for DeviceGlyph(0) + 28));
  char v6 = *v5;
  uint64_t v7 = *((void *)v5 + 1);
  LOBYTE(v13) = v6;
  uint64_t v14 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  double v8 = 24.0;
  if (v15 == 1)
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
    MEMORY[0x1E0181A90](v9);
    char v10 = sub_1DADF333C();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
      sub_1DADF5C70();
      double v8 = 27.0;
      if (v13 + 24.0 < 27.0)
      {
        sub_1DADF5C70();
        return v13 + 24.0;
      }
    }
  }
  return v8;
}

uint64_t sub_1DADCFA68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1DADF6790();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  double v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  char v10 = (char *)&v29 - v9;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A08);
  MEMORY[0x1F4188790](v11 - 8);
  double v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (long long *)(a1 + *(int *)(type metadata accessor for DeviceGlyph(0) + 20));
  long long v15 = *v14;
  uint64_t v16 = *((void *)v14 + 2);
  long long v29 = v15;
  uint64_t v30 = v16;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B98);
  MEMORY[0x1E0181A90](&v31, v17);
  uint64_t v18 = v31;
  if (v31)
  {
    sub_1DADCF8D0();
    sub_1DADF62C0();
    uint64_t v19 = sub_1DADF62B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v13, 1, 1, v19);
    uint64_t v20 = sub_1DADF62D0();
    sub_1DADADF3C((uint64_t)v13, &qword_1EB682A08);
    uint64_t KeyPath = swift_getKeyPath();
    *(void *)&long long v29 = v18;
    *((void *)&v29 + 1) = KeyPath;
    uint64_t v30 = v20;
    swift_retain();
    sub_1DADCA9AC(&qword_1EB682F58, MEMORY[0x1E4F46AE8], 0xD000000000000013, 0x80000001DADFAD40, (uint64_t)v10);
    sub_1DADF6780();
    LOBYTE(v20) = sub_1DADF6770();
    uint64_t v22 = *(void (**)(char *, uint64_t))(v5 + 8);
    v22(v8, v4);
    v22(v10, v4);
    uint64_t v23 = *sub_1DADF3990();
    swift_retain();
    uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6827C0);
    unint64_t v25 = sub_1DADD4CBC();
    sub_1DADF19B8(v20 & 1, v23, v24, v25, a2);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A18);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(a2, 0, 1, v26);
  }
  else
  {
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A18);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(a2, 1, 1, v28);
  }
}

uint64_t sub_1DADCFDDC@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_1DADF66D0();
  a1[1] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682728);
  return sub_1DADCFA68(v1, (uint64_t)a1 + *(int *)(v4 + 44));
}

uint64_t sub_1DADCFE20@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADCA9AC(&qword_1EB682F68, MEMORY[0x1E4F3C5D0], 0x686353726F6C6F43, 0xEB00000000656D65, a1);
}

uint64_t sub_1DADCFE70@<X0>(uint64_t *a1@<X8>)
{
  return sub_1DADA860C(&qword_1EB682F68, a1);
}

uint64_t sub_1DADCFE84()
{
  type metadata accessor for BCUIRingAndGlyphView.maskRingAndGlyphView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  return v1;
}

uint64_t type metadata accessor for BCUIRingAndGlyphView.maskRingAndGlyphView(uint64_t a1)
{
  return sub_1DADAD54C(a1, (uint64_t *)&unk_1EB683CD0);
}

uint64_t sub_1DADCFF04()
{
  return sub_1DADF65F0();
}

uint64_t (*sub_1DADCFF6C(void *a1))()
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = (char *)(v1 + *(int *)(type metadata accessor for BCUIRingAndGlyphView.maskRingAndGlyphView(0) + 20));
  char v5 = *v4;
  v3[34] = *v4;
  uint64_t v6 = *((void *)v4 + 1);
  *uint64_t v3 = v5;
  *((void *)v3 + 1) = v6;
  *((void *)v3 + 2) = v6;
  swift_retain();
  *((void *)v3 + 3) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  return sub_1DADA8250;
}

uint64_t sub_1DADD0008()
{
  type metadata accessor for BCUIRingAndGlyphView.maskRingAndGlyphView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF6600();
  return v1;
}

uint64_t sub_1DADD006C()
{
  return sub_1DADD02DC(MEMORY[0x1E4F3EE08]);
}

uint64_t sub_1DADD0084(uint64_t a1)
{
  uint64_t v2 = sub_1DADF5D80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BCUIRingAndGlyphView.maskRingAndGlyphView(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  sub_1DADF6620();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1DADD0190(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = sub_1DADF5D80();
  *uint64_t v3 = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[1] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[2] = malloc(v6);
  v3[3] = malloc(v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  v3[4] = v7;
  double v8 = malloc(*(void *)(*(void *)(v7 - 8) + 64));
  v3[5] = v8;
  uint64_t v9 = type metadata accessor for BCUIRingAndGlyphView.maskRingAndGlyphView(0);
  sub_1DADAE0AC(v1 + *(int *)(v9 + 24), (uint64_t)v8, &qword_1EB682B88);
  MEMORY[0x1E0181A90](v7);
  return sub_1DADCBD78;
}

uint64_t sub_1DADD02C4()
{
  return sub_1DADD02DC(MEMORY[0x1E4F3EE10]);
}

uint64_t sub_1DADD02DC(uint64_t (*a1)(uint64_t))
{
  type metadata accessor for BCUIRingAndGlyphView.maskRingAndGlyphView(0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  return a1(v2);
}

double sub_1DADD0330()
{
  type metadata accessor for BCUIRingAndGlyphView.maskRingAndGlyphView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  sub_1DADF5C70();
  return v1;
}

double sub_1DADD037C()
{
  uint64_t v1 = sub_1DADF5D80();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (char *)(v0 + *(int *)(type metadata accessor for BCUIRingAndGlyphView.maskRingAndGlyphView(0) + 20));
  char v6 = *v5;
  uint64_t v7 = *((void *)v5 + 1);
  LOBYTE(v16) = v6;
  uint64_t v17 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  int v8 = v18;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1E0181A90](v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  sub_1DADF5C70();
  double v10 = 6.0;
  if (v8 == 1)
  {
    double v11 = v16;
    char v12 = sub_1DADF333C();
    double v13 = fmin(v11 + 6.0, 6.5);
    if (v12) {
      double v10 = v13;
    }
    else {
      double v10 = 6.0;
    }
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v10;
}

uint64_t sub_1DADD0500@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B20);
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v4 = (uint64_t *)((char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v4 = sub_1DADF66D0();
  v4[1] = v5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682738);
  sub_1DADD0618((uint64_t)v4 + *(int *)(v6 + 44));
  sub_1DADD037C();
  char v7 = sub_1DADF6220();
  sub_1DADF5BE0();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  sub_1DADAE0AC((uint64_t)v4, a1, &qword_1EB682B20);
  uint64_t v16 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682818) + 36);
  *(unsigned char *)uint64_t v16 = v7;
  *(void *)(v16 + 8) = v9;
  *(void *)(v16 + 16) = v11;
  *(void *)(v16 + 24) = v13;
  *(void *)(v16 + 32) = v15;
  *(unsigned char *)(v16 + 40) = 0;
  return sub_1DADADF3C((uint64_t)v4, &qword_1EB682B20);
}

uint64_t sub_1DADD0618@<X0>(uint64_t a1@<X8>)
{
  uint64_t v37 = a1;
  uint64_t v1 = sub_1DADF5E30();
  MEMORY[0x1F4188790](v1 - 8);
  uint64_t v36 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1DADF6720();
  uint64_t v34 = *(void *)(v3 - 8);
  uint64_t v35 = v3;
  MEMORY[0x1F4188790](v3);
  double v33 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1DADF5C00();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v33 - v10;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6827A0);
  uint64_t v13 = v12 - 8;
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DADF6490();
  sub_1DADCA9AC(&qword_1EB682F68, MEMORY[0x1E4F3C5D0], 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v11);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v9, *MEMORY[0x1E4F3C5B8], v5);
  sub_1DADF5BF0();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v9, v5);
  v16(v11, v5);
  uint64_t v17 = sub_1DADF64E0();
  swift_release();
  sub_1DADD037C();
  sub_1DADF5C30();
  uint64_t v18 = v38;
  uint64_t v19 = v40;
  uint64_t v20 = v41;
  uint64_t v21 = v42;
  uint64_t v22 = sub_1DADF66D0();
  uint64_t v24 = v23;
  uint64_t v26 = v33;
  uint64_t v25 = v34;
  uint64_t v27 = v39;
  uint64_t v28 = v35;
  (*(void (**)(char *, void, uint64_t))(v34 + 104))(v33, *MEMORY[0x1E4F3EFC8], v35);
  uint64_t v29 = v25;
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v25 + 16);
  uint64_t v31 = (uint64_t)v36;
  v30(v36, v26, v28);
  sub_1DADD4D5C(v31, (uint64_t)&v15[*(int *)(v13 + 44)], MEMORY[0x1E4F3CE18]);
  *(_OWORD *)uint64_t v15 = xmmword_1DADF92B0;
  *((void *)v15 + 2) = v18;
  *((void *)v15 + 3) = v27;
  *((void *)v15 + 4) = v19;
  *((void *)v15 + 5) = v20;
  *((void *)v15 + 6) = v21;
  *((void *)v15 + 7) = v17;
  *((_WORD *)v15 + 32) = 256;
  *((void *)v15 + 9) = v22;
  *((void *)v15 + 10) = v24;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1DADD5050(v31, MEMORY[0x1E4F3CE18]);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v26, v28);
  swift_release();
  swift_bridgeObjectRelease();
  return sub_1DADADF98((uint64_t)v15, v37, &qword_1EB6827A0);
}

uint64_t sub_1DADD0A48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  sub_1DADADF98(a1, a3, &qword_1EB6826A8);
  uint64_t v5 = type metadata accessor for BCUIRingAndGlyphView.maskRingAndGlyphView(0);
  uint64_t v6 = a3 + *(int *)(v5 + 20);
  sub_1DADF65D0();
  *(unsigned char *)uint64_t v6 = v8;
  *(void *)(v6 + 8) = v9;
  sub_1DADADF98(a2, a3 + *(int *)(v5 + 24), &qword_1EB682B88);
  sub_1DADB2BCC();
  return sub_1DADF5C60();
}

uint64_t sub_1DADD0B20()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADD0B3C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_1DADD0B58(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682688);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1DADF5DA0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *uint64_t v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (uint64_t *)((char *)v4 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_1DADF6790();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[6];
    uint64_t v14 = a3[7];
    uint64_t v15 = (uint64_t *)((char *)v4 + v13);
    uint64_t v16 = (uint64_t *)((char *)a2 + v13);
    uint64_t v17 = v16[1];
    *uint64_t v15 = *v16;
    v15[1] = v17;
    uint64_t v68 = v16[3];
    v15[2] = v16[2];
    v15[3] = v68;
    uint64_t v18 = (uint64_t *)((char *)v4 + v14);
    uint64_t v19 = (uint64_t *)((char *)a2 + v14);
    uint64_t v69 = v19[1];
    *uint64_t v18 = *v19;
    v18[1] = v69;
    uint64_t v18[2] = v19[2];
    uint64_t v20 = a3[8];
    uint64_t v21 = a3[9];
    uint64_t v22 = (uint64_t *)((char *)v4 + v20);
    uint64_t v23 = (uint64_t *)((char *)a2 + v20);
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = v23[3];
    v22[2] = v23[2];
    v22[3] = v25;
    uint64_t v26 = (uint64_t *)((char *)v4 + v21);
    uint64_t v27 = (uint64_t *)((char *)a2 + v21);
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    void v26[2] = v27[2];
    uint64_t v29 = a3[10];
    uint64_t v30 = a3[11];
    uint64_t v31 = (char *)v4 + v29;
    uint64_t v32 = (char *)a2 + v29;
    uint64_t v33 = *((void *)v32 + 1);
    *(void *)uint64_t v31 = *(void *)v32;
    *((void *)v31 + 1) = v33;
    v31[16] = v32[16];
    uint64_t v34 = (char *)v4 + v30;
    uint64_t v35 = (char *)a2 + v30;
    uint64_t v71 = *((void *)v35 + 1);
    *(void *)uint64_t v34 = *(void *)v35;
    *((void *)v34 + 1) = v71;
    v34[16] = v35[16];
    uint64_t v36 = a3[12];
    uint64_t v37 = a3[13];
    uint64_t v38 = (char *)v4 + v36;
    uint64_t v39 = (char *)a2 + v36;
    uint64_t v40 = *((void *)v39 + 1);
    *(void *)uint64_t v38 = *(void *)v39;
    *((void *)v38 + 1) = v40;
    v38[16] = v39[16];
    uint64_t v41 = (uint64_t *)((char *)v4 + v37);
    uint64_t v42 = (char *)a2 + v37;
    uint64_t v70 = *(uint64_t *)((char *)a2 + v37 + 8);
    void *v41 = *(uint64_t *)((char *)a2 + v37);
    v41[1] = v70;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v43 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
    double v44 = (char *)v41 + v43;
    uint64_t v45 = &v42[v43];
    uint64_t v46 = sub_1DADF5D80();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16))(v44, v45, v46);
    uint64_t v47 = a3[14];
    uint64_t v48 = a3[15];
    char v49 = (char *)v4 + v47;
    uint64_t v50 = (char *)a2 + v47;
    char *v49 = *v50;
    *((void *)v49 + 1) = *((void *)v50 + 1);
    uint64_t v51 = (char *)v4 + v48;
    uint64_t v52 = (char *)a2 + v48;
    swift_retain();
    uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v53 - 8) + 16))(v51, v52, v53);
    uint64_t v54 = a3[17];
    *(uint64_t *)((char *)v4 + a3[16]) = *(uint64_t *)((char *)a2 + a3[16]);
    *(uint64_t *)((char *)v4 + v54) = *(uint64_t *)((char *)a2 + v54);
    uint64_t v55 = a3[18];
    uint64_t v56 = a3[19];
    double v57 = (uint64_t *)((char *)v4 + v55);
    double v58 = (uint64_t *)((char *)a2 + v55);
    uint64_t v59 = v58[1];
    *double v57 = *v58;
    v57[1] = v59;
    uint64_t v60 = (uint64_t *)((char *)v4 + v56);
    uint64_t v61 = (uint64_t *)((char *)a2 + v56);
    uint64_t v62 = v61[1];
    *uint64_t v60 = *v61;
    v60[1] = v62;
    uint64_t v63 = a3[20];
    uint64_t v64 = (uint64_t *)((char *)v4 + v63);
    uint64_t v65 = (uint64_t *)((char *)a2 + v63);
    uint64_t v66 = v65[1];
    *uint64_t v64 = *v65;
    v64[1] = v66;
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_1DADD0FC4(uint64_t a1, int *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682688);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1DADF5DA0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + a2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1DADF6790();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v7 = a1 + a2[13];
  swift_release();
  swift_release();
  uint64_t v8 = v7 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v9 = sub_1DADF5D80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_release();
  uint64_t v10 = a1 + a2[15];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

void *sub_1DADD127C(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682688);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1DADF5DA0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_1DADF6790();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = a3[7];
  uint64_t v13 = (void *)((char *)a1 + v11);
  uint64_t v14 = (void *)((char *)a2 + v11);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  uint64_t v66 = v14[3];
  v13[2] = v14[2];
  v13[3] = v66;
  uint64_t v16 = (void *)((char *)a1 + v12);
  uint64_t v17 = (void *)((char *)a2 + v12);
  uint64_t v67 = v17[1];
  void *v16 = *v17;
  v16[1] = v67;
  v16[2] = v17[2];
  uint64_t v18 = a3[8];
  uint64_t v19 = a3[9];
  uint64_t v20 = (void *)((char *)a1 + v18);
  uint64_t v21 = (void *)((char *)a2 + v18);
  uint64_t v22 = v21[1];
  void *v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = v21[3];
  v20[2] = v21[2];
  v20[3] = v23;
  uint64_t v24 = (void *)((char *)a1 + v19);
  uint64_t v25 = (void *)((char *)a2 + v19);
  uint64_t v26 = v25[1];
  *uint64_t v24 = *v25;
  v24[1] = v26;
  v24[2] = v25[2];
  uint64_t v27 = a3[10];
  uint64_t v28 = a3[11];
  uint64_t v29 = (char *)a1 + v27;
  uint64_t v30 = (char *)a2 + v27;
  uint64_t v31 = *((void *)v30 + 1);
  *(void *)uint64_t v29 = *(void *)v30;
  *((void *)v29 + 1) = v31;
  v29[16] = v30[16];
  uint64_t v32 = (char *)a1 + v28;
  uint64_t v33 = (char *)a2 + v28;
  uint64_t v69 = *((void *)v33 + 1);
  *(void *)uint64_t v32 = *(void *)v33;
  *((void *)v32 + 1) = v69;
  v32[16] = v33[16];
  uint64_t v34 = a3[12];
  uint64_t v35 = a3[13];
  uint64_t v36 = (char *)a1 + v34;
  uint64_t v37 = (char *)a2 + v34;
  uint64_t v38 = *((void *)v37 + 1);
  *(void *)uint64_t v36 = *(void *)v37;
  *((void *)v36 + 1) = v38;
  v36[16] = v37[16];
  uint64_t v39 = (void *)((char *)a1 + v35);
  uint64_t v40 = (char *)a2 + v35;
  uint64_t v68 = *(void *)((char *)a2 + v35 + 8);
  *uint64_t v39 = *(void *)((char *)a2 + v35);
  v39[1] = v68;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v41 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v42 = (char *)v39 + v41;
  uint64_t v43 = &v40[v41];
  uint64_t v44 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 16))(v42, v43, v44);
  uint64_t v45 = a3[14];
  uint64_t v46 = a3[15];
  uint64_t v47 = (char *)a1 + v45;
  uint64_t v48 = (char *)a2 + v45;
  *uint64_t v47 = *v48;
  *((void *)v47 + 1) = *((void *)v48 + 1);
  char v49 = (char *)a1 + v46;
  uint64_t v50 = (char *)a2 + v46;
  swift_retain();
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v51 - 8) + 16))(v49, v50, v51);
  uint64_t v52 = a3[17];
  *(void *)((char *)a1 + a3[16]) = *(void *)((char *)a2 + a3[16]);
  *(void *)((char *)a1 + v52) = *(void *)((char *)a2 + v52);
  uint64_t v53 = a3[18];
  uint64_t v54 = a3[19];
  uint64_t v55 = (void *)((char *)a1 + v53);
  uint64_t v56 = (void *)((char *)a2 + v53);
  uint64_t v57 = v56[1];
  *uint64_t v55 = *v56;
  v55[1] = v57;
  double v58 = (void *)((char *)a1 + v54);
  uint64_t v59 = (void *)((char *)a2 + v54);
  uint64_t v60 = v59[1];
  void *v58 = *v59;
  v58[1] = v60;
  uint64_t v61 = a3[20];
  uint64_t v62 = (void *)((char *)a1 + v61);
  uint64_t v63 = (void *)((char *)a2 + v61);
  uint64_t v64 = v63[1];
  void *v62 = *v63;
  v62[1] = v64;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_1DADD169C(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1DADADF3C((uint64_t)a1, &qword_1EB682688);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682688);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1DADF5DA0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v7 = a3[5];
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_1DADADF3C((uint64_t)a1 + v7, &qword_1EB682F58);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_1DADF6790();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  *(void *)((char *)a1 + v11) = *(void *)((char *)a2 + v11);
  swift_retain();
  swift_release();
  v12[1] = v13[1];
  swift_retain();
  swift_release();
  void v12[2] = v13[2];
  unint64_t v12[3] = v13[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  swift_retain();
  swift_release();
  *((void *)v15 + 1) = *((void *)v16 + 1);
  swift_retain();
  swift_release();
  *((void *)v15 + 2) = *((void *)v16 + 2);
  uint64_t v17 = a3[8];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  *(void *)((char *)a1 + v17) = *(void *)((char *)a2 + v17);
  swift_retain();
  swift_release();
  v18[1] = v19[1];
  swift_retain();
  swift_release();
  uint64_t v18[2] = v19[2];
  v18[3] = v19[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[9];
  uint64_t v21 = (char *)a1 + v20;
  uint64_t v22 = (char *)a2 + v20;
  *(void *)((char *)a1 + v20) = *(void *)((char *)a2 + v20);
  swift_retain();
  swift_release();
  *((void *)v21 + 1) = *((void *)v22 + 1);
  swift_retain();
  swift_release();
  *((void *)v21 + 2) = *((void *)v22 + 2);
  swift_retain();
  swift_release();
  uint64_t v23 = a3[10];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  *(void *)((char *)a1 + v23) = *(void *)((char *)a2 + v23);
  swift_retain();
  swift_release();
  *((void *)v24 + 1) = *((void *)v25 + 1);
  swift_retain();
  swift_release();
  v24[16] = v25[16];
  uint64_t v26 = a3[11];
  uint64_t v27 = (char *)a1 + v26;
  uint64_t v28 = (char *)a2 + v26;
  *(void *)((char *)a1 + v26) = *(void *)((char *)a2 + v26);
  swift_retain();
  swift_release();
  *((void *)v27 + 1) = *((void *)v28 + 1);
  swift_retain();
  swift_release();
  v27[16] = v28[16];
  uint64_t v29 = a3[12];
  uint64_t v30 = (char *)a1 + v29;
  uint64_t v31 = (char *)a2 + v29;
  *(void *)((char *)a1 + v29) = *(void *)((char *)a2 + v29);
  swift_retain();
  swift_release();
  *((void *)v30 + 1) = *((void *)v31 + 1);
  swift_retain();
  swift_release();
  v30[16] = v31[16];
  uint64_t v32 = a3[13];
  uint64_t v33 = (char *)a1 + v32;
  uint64_t v34 = (char *)a2 + v32;
  *(void *)((char *)a1 + v32) = *(void *)((char *)a2 + v32);
  swift_retain();
  swift_release();
  *((void *)v33 + 1) = *((void *)v34 + 1);
  swift_retain();
  swift_release();
  uint64_t v35 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v36 = &v33[v35];
  uint64_t v37 = &v34[v35];
  uint64_t v38 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v38 - 8) + 24))(v36, v37, v38);
  uint64_t v39 = a3[14];
  uint64_t v40 = (char *)a1 + v39;
  uint64_t v41 = (char *)a2 + v39;
  *uint64_t v40 = *v41;
  *((void *)v40 + 1) = *((void *)v41 + 1);
  swift_retain();
  swift_release();
  uint64_t v42 = a3[15];
  uint64_t v43 = (char *)a1 + v42;
  uint64_t v44 = (char *)a2 + v42;
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 24))(v43, v44, v45);
  *(void *)((char *)a1 + a3[16]) = *(void *)((char *)a2 + a3[16]);
  *(void *)((char *)a1 + a3[17]) = *(void *)((char *)a2 + a3[17]);
  uint64_t v46 = a3[18];
  uint64_t v47 = (void *)((char *)a1 + v46);
  uint64_t v48 = (void *)((char *)a2 + v46);
  *uint64_t v47 = *v48;
  v47[1] = v48[1];
  swift_retain();
  swift_release();
  uint64_t v49 = a3[19];
  uint64_t v50 = (void *)((char *)a1 + v49);
  uint64_t v51 = (void *)((char *)a2 + v49);
  *uint64_t v50 = *v51;
  v50[1] = v51[1];
  swift_retain();
  swift_release();
  uint64_t v52 = a3[20];
  uint64_t v53 = (char *)a1 + v52;
  uint64_t v54 = (char *)a2 + v52;
  *(void *)((char *)a1 + v52) = *(void *)((char *)a2 + v52);
  swift_retain();
  swift_release();
  *((void *)v53 + 1) = *((void *)v54 + 1);
  swift_retain();
  swift_release();
  return a1;
}

char *sub_1DADD1BF4(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682688);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1DADF5DA0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_1DADF6790();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = &a1[v13];
  uint64_t v16 = &a2[v13];
  long long v17 = *((_OWORD *)v16 + 1);
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  *((_OWORD *)v15 + 1) = v17;
  uint64_t v18 = &a1[v14];
  uint64_t v19 = &a2[v14];
  *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  *((void *)v18 + 2) = *((void *)v19 + 2);
  uint64_t v20 = a3[8];
  uint64_t v21 = a3[9];
  uint64_t v22 = &a1[v20];
  uint64_t v23 = &a2[v20];
  long long v24 = *((_OWORD *)v23 + 1);
  *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
  *((_OWORD *)v22 + 1) = v24;
  uint64_t v25 = &a1[v21];
  uint64_t v26 = &a2[v21];
  *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
  *((void *)v25 + 2) = *((void *)v26 + 2);
  uint64_t v27 = a3[10];
  uint64_t v28 = a3[11];
  uint64_t v29 = &a1[v27];
  uint64_t v30 = &a2[v27];
  long long v31 = *(_OWORD *)v30;
  v29[16] = v30[16];
  *(_OWORD *)uint64_t v29 = v31;
  uint64_t v32 = &a1[v28];
  uint64_t v33 = &a2[v28];
  v32[16] = v33[16];
  *(_OWORD *)uint64_t v32 = *(_OWORD *)v33;
  uint64_t v34 = a3[12];
  uint64_t v35 = a3[13];
  uint64_t v36 = &a1[v34];
  uint64_t v37 = &a2[v34];
  v36[16] = v37[16];
  *(_OWORD *)uint64_t v36 = *(_OWORD *)v37;
  uint64_t v38 = &a1[v35];
  uint64_t v39 = &a2[v35];
  uint64_t v40 = *(void *)&a2[v35];
  uint64_t v41 = *(void *)&a2[v35 + 8];
  *(void *)uint64_t v38 = v40;
  *((void *)v38 + 1) = v41;
  uint64_t v42 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v43 = &v38[v42];
  uint64_t v44 = &v39[v42];
  uint64_t v45 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v45 - 8) + 32))(v43, v44, v45);
  uint64_t v46 = a3[15];
  *(_OWORD *)&a1[a3[14]] = *(_OWORD *)&a2[a3[14]];
  uint64_t v47 = &a1[v46];
  uint64_t v48 = &a2[v46];
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 32))(v47, v48, v49);
  uint64_t v50 = a3[17];
  *(void *)&a1[a3[16]] = *(void *)&a2[a3[16]];
  *(void *)&a1[v50] = *(void *)&a2[v50];
  uint64_t v51 = a3[19];
  *(_OWORD *)&a1[a3[18]] = *(_OWORD *)&a2[a3[18]];
  *(_OWORD *)&a1[v51] = *(_OWORD *)&a2[v51];
  *(_OWORD *)&a1[a3[20]] = *(_OWORD *)&a2[a3[20]];
  return a1;
}

char *sub_1DADD1EF8(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1DADADF3C((uint64_t)a1, &qword_1EB682688);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682688);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1DADF5DA0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    uint64_t v8 = a3[5];
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    sub_1DADADF3C((uint64_t)&a1[v8], &qword_1EB682F58);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_1DADF6790();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
    }
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  *(void *)&a1[v13] = *(void *)&a2[v13];
  swift_release();
  *((void *)v14 + 1) = *((void *)v15 + 1);
  swift_release();
  uint64_t v16 = *((void *)v15 + 3);
  *((void *)v14 + 2) = *((void *)v15 + 2);
  *((void *)v14 + 3) = v16;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[7];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  *(void *)&a1[v17] = *(void *)&a2[v17];
  swift_release();
  *((void *)v18 + 1) = *((void *)v19 + 1);
  swift_release();
  *((void *)v18 + 2) = *((void *)v19 + 2);
  uint64_t v20 = a3[8];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  *(void *)&a1[v20] = *(void *)&a2[v20];
  swift_release();
  *((void *)v21 + 1) = *((void *)v22 + 1);
  swift_release();
  uint64_t v23 = *((void *)v22 + 3);
  *((void *)v21 + 2) = *((void *)v22 + 2);
  *((void *)v21 + 3) = v23;
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[9];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  *(void *)&a1[v24] = *(void *)&a2[v24];
  swift_release();
  *((void *)v25 + 1) = *((void *)v26 + 1);
  swift_release();
  *((void *)v25 + 2) = *((void *)v26 + 2);
  swift_release();
  uint64_t v27 = a3[10];
  uint64_t v28 = &a1[v27];
  uint64_t v29 = &a2[v27];
  *(void *)&a1[v27] = *(void *)&a2[v27];
  swift_release();
  *((void *)v28 + 1) = *((void *)v29 + 1);
  swift_release();
  v28[16] = v29[16];
  uint64_t v30 = a3[11];
  long long v31 = &a1[v30];
  uint64_t v32 = &a2[v30];
  *(void *)&a1[v30] = *(void *)&a2[v30];
  swift_release();
  *((void *)v31 + 1) = *((void *)v32 + 1);
  swift_release();
  v31[16] = v32[16];
  uint64_t v33 = a3[12];
  uint64_t v34 = &a1[v33];
  uint64_t v35 = &a2[v33];
  *(void *)&a1[v33] = *(void *)&a2[v33];
  swift_release();
  *((void *)v34 + 1) = *((void *)v35 + 1);
  swift_release();
  v34[16] = v35[16];
  uint64_t v36 = a3[13];
  uint64_t v37 = &a1[v36];
  uint64_t v38 = &a2[v36];
  *(void *)&a1[v36] = *(void *)&a2[v36];
  swift_release();
  *((void *)v37 + 1) = *((void *)v38 + 1);
  swift_release();
  uint64_t v39 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v40 = &v37[v39];
  uint64_t v41 = &v38[v39];
  uint64_t v42 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v42 - 8) + 40))(v40, v41, v42);
  uint64_t v43 = a3[14];
  uint64_t v44 = &a1[v43];
  uint64_t v45 = &a2[v43];
  *uint64_t v44 = *v45;
  *((void *)v44 + 1) = *((void *)v45 + 1);
  swift_release();
  uint64_t v46 = a3[15];
  uint64_t v47 = &a1[v46];
  uint64_t v48 = &a2[v46];
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v49 - 8) + 40))(v47, v48, v49);
  uint64_t v50 = a3[17];
  *(void *)&a1[a3[16]] = *(void *)&a2[a3[16]];
  *(void *)&a1[v50] = *(void *)&a2[v50];
  uint64_t v51 = a3[18];
  uint64_t v52 = &a1[v51];
  uint64_t v53 = &a2[v51];
  *(void *)uint64_t v52 = *(void *)v53;
  *((void *)v52 + 1) = *((void *)v53 + 1);
  swift_release();
  uint64_t v54 = a3[19];
  uint64_t v55 = &a1[v54];
  uint64_t v56 = &a2[v54];
  *(void *)uint64_t v55 = *(void *)v56;
  *((void *)v55 + 1) = *((void *)v56 + 1);
  swift_release();
  uint64_t v57 = a3[20];
  double v58 = &a1[v57];
  uint64_t v59 = &a2[v57];
  *(void *)&a1[v57] = *(void *)v59;
  swift_release();
  *((void *)v58 + 1) = *((void *)v59 + 1);
  swift_release();
  return a1;
}

uint64_t sub_1DADD238C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DADD23A0);
}

uint64_t sub_1DADD23A0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826B8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_12:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A0);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[5];
LABEL_11:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_12;
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v14 = *(void *)(a1 + a3[6] + 8);
    if (v14 >= 0xFFFFFFFF) {
      LODWORD(v14) = -1;
    }
    return (v14 + 1);
  }
  else
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
    if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a2)
    {
      uint64_t v8 = v16;
      uint64_t v12 = *(void *)(v16 - 8);
      uint64_t v13 = a3[13];
      goto LABEL_11;
    }
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48);
    uint64_t v19 = v17;
    uint64_t v20 = a1 + a3[15];
    return v18(v20, a2, v19);
  }
}

uint64_t sub_1DADD2580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DADD2594);
}

uint64_t sub_1DADD2594(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826B8);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_10:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A0);
  if (*(_DWORD *)(*(void *)(result - 8) + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v14 = *(void *)(result - 8);
    uint64_t v15 = a4[5];
LABEL_9:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_10;
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[6] + 8) = (a2 - 1);
    return result;
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[13];
    goto LABEL_9;
  }
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  uint64_t v19 = v17;
  uint64_t v20 = a1 + a4[15];

  return v18(v20, a2, a2, v19);
}

void sub_1DADD2774()
{
  sub_1DADD389C(319, &qword_1EB682690, MEMORY[0x1E4F3CBF0], MEMORY[0x1E4F3C648]);
  if (v0 <= 0x3F)
  {
    sub_1DADD389C(319, (unint64_t *)&qword_1EB683638, MEMORY[0x1E4F46AE8], MEMORY[0x1E4F3C648]);
    if (v1 <= 0x3F)
    {
      sub_1DADD389C(319, &qword_1EB682B90, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3EE18]);
      if (v2 <= 0x3F)
      {
        sub_1DADB4B24();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

uint64_t *sub_1DADD298C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1DADF5C00();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    uint64_t v11 = (char *)a1 + v9;
    uint64_t v12 = (char *)a2 + v9;
    *uint64_t v11 = *v12;
    *((void *)v11 + 1) = *((void *)v12 + 1);
    uint64_t v13 = (uint64_t *)((char *)a1 + v10);
    uint64_t v14 = (char *)a2 + v10;
    uint64_t v15 = *(uint64_t *)((char *)a2 + v10 + 8);
    *uint64_t v13 = *(uint64_t *)((char *)a2 + v10);
    v13[1] = v15;
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
    uint64_t v17 = (char *)v13 + v16;
    uint64_t v18 = &v14[v16];
    uint64_t v19 = sub_1DADF5D80();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 16))(v17, v18, v19);
    uint64_t v20 = a3[7];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
  }
  return a1;
}

uint64_t sub_1DADD2B8C(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1DADF5C00();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  swift_release();
  swift_release();
  uint64_t v6 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v7 = sub_1DADF5D80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  uint64_t v8 = a1 + *(int *)(a2 + 28);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);

  return v10(v8, v9);
}

void *sub_1DADD2CE0(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1DADF5C00();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v7;
  uint64_t v10 = (char *)a2 + v7;
  *uint64_t v9 = *v10;
  *((void *)v9 + 1) = *((void *)v10 + 1);
  uint64_t v11 = (void *)((char *)a1 + v8);
  uint64_t v12 = (char *)a2 + v8;
  uint64_t v13 = *(void *)((char *)a2 + v8 + 8);
  *uint64_t v11 = *(void *)((char *)a2 + v8);
  v11[1] = v13;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v15 = (char *)v11 + v14;
  uint64_t v16 = &v12[v14];
  uint64_t v17 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
  uint64_t v18 = a3[7];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  return a1;
}

void *sub_1DADD2E90(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1DADADF3C((uint64_t)a1, &qword_1EB682F68);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1DADF5C00();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *uint64_t v8 = *v9;
  *((void *)v8 + 1) = *((void *)v9 + 1);
  swift_retain();
  swift_release();
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  swift_retain();
  swift_release();
  *((void *)v11 + 1) = *((void *)v12 + 1);
  swift_retain();
  swift_release();
  uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v14 = &v11[v13];
  uint64_t v15 = &v12[v13];
  uint64_t v16 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  uint64_t v17 = a3[7];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 24))(v18, v19, v20);
  return a1;
}

char *sub_1DADD3078(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1DADF5C00();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = *(void *)&a2[v8];
  uint64_t v12 = *(void *)&a2[v8 + 8];
  *(void *)uint64_t v9 = v11;
  *((void *)v9 + 1) = v12;
  uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v14 = &v9[v13];
  uint64_t v15 = &v10[v13];
  uint64_t v16 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  uint64_t v17 = a3[7];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 32))(v18, v19, v20);
  return a1;
}

char *sub_1DADD3204(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1DADADF3C((uint64_t)a1, &qword_1EB682F68);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1DADF5C00();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  *uint64_t v9 = *v10;
  *((void *)v9 + 1) = *((void *)v10 + 1);
  swift_release();
  uint64_t v11 = a3[6];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  *(void *)&a1[v11] = *(void *)&a2[v11];
  swift_release();
  *((void *)v12 + 1) = *((void *)v13 + 1);
  swift_release();
  uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v15 = &v12[v14];
  uint64_t v16 = &v13[v14];
  uint64_t v17 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 40))(v15, v16, v17);
  uint64_t v18 = a3[7];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 40))(v19, v20, v21);
  return a1;
}

uint64_t sub_1DADD33DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DADD33F0);
}

uint64_t sub_1DADD33F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_11:
    return v9(v10, a2, v8);
  }
  if (a2 == 2147483646)
  {
    unint64_t v11 = *(void *)(a1 + a3[5] + 8);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    int v12 = v11 - 1;
    if (v12 < 0) {
      int v12 = -1;
    }
    return (v12 + 1);
  }
  else
  {
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
    uint64_t v15 = *(void *)(v14 - 8);
    if (*(_DWORD *)(v15 + 84) == a2)
    {
      uint64_t v8 = v14;
      uint64_t v10 = a1 + a3[6];
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
      goto LABEL_11;
    }
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48);
    uint64_t v18 = v16;
    uint64_t v19 = a1 + a3[7];
    return v17(v19, a2, v18);
  }
}

uint64_t sub_1DADD358C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DADD35A0);
}

uint64_t sub_1DADD35A0(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_7:
    return v11(v12, a2, a2, v10);
  }
  if (a3 == 2147483646)
  {
    *(void *)(a1 + a4[5] + 8) = a2;
    return result;
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + a4[6];
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_7;
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a4[7];

  return v16(v18, a2, a2, v17);
}

void sub_1DADD3730()
{
  sub_1DADD389C(319, (unint64_t *)&qword_1EB6835B8, MEMORY[0x1E4F3C5D0], MEMORY[0x1E4F3C648]);
  if (v0 <= 0x3F)
  {
    sub_1DADD389C(319, &qword_1EB682B90, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3EE18]);
    if (v1 <= 0x3F)
    {
      sub_1DADB4B24();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

void sub_1DADD389C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_1DADD3904()
{
  unint64_t result = qword_1EA8F8450;
  if (!qword_1EA8F8450)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8458);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F84C8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F84C0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F84B8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F84A0);
    sub_1DADCF2DC();
    sub_1DADCF378();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_1DADADFFC(&qword_1EA8F83E8, MEMORY[0x1E4F3DF60]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8450);
  }
  return result;
}

uint64_t sub_1DADD3AA0()
{
  return sub_1DADD3AD8(&qword_1EB682810, &qword_1EB682818, &qword_1EB682B18, &qword_1EB682B20);
}

uint64_t sub_1DADD3AD8(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_1DADAD660(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_1DADD3B74(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1DADF6790();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    unint64_t v11 = (uint64_t *)((char *)a1 + v9);
    uint64_t v12 = (uint64_t *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    *unint64_t v11 = *v12;
    v11[1] = v13;
    v11[2] = v12[2];
    uint64_t v14 = (uint64_t *)((char *)a1 + v10);
    uint64_t v15 = (char *)a2 + v10;
    uint64_t v16 = *(uint64_t *)((char *)a2 + v10 + 8);
    *uint64_t v14 = *(uint64_t *)((char *)a2 + v10);
    v14[1] = v16;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v17 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
    uint64_t v18 = (char *)v14 + v17;
    uint64_t v19 = &v15[v17];
    uint64_t v20 = sub_1DADF5D80();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16))(v18, v19, v20);
    uint64_t v21 = a3[7];
    uint64_t v22 = a3[8];
    uint64_t v23 = (char *)a1 + v21;
    uint64_t v24 = (char *)a2 + v21;
    *uint64_t v23 = *v24;
    *((void *)v23 + 1) = *((void *)v24 + 1);
    uint64_t v25 = (char *)a1 + v22;
    uint64_t v26 = (char *)a2 + v22;
    swift_retain();
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 16))(v25, v26, v27);
  }
  return a1;
}

uint64_t sub_1DADD3DA8(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1DADF6790();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  swift_release();
  swift_release();
  uint64_t v6 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v7 = sub_1DADF5D80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_release();
  uint64_t v8 = a1 + *(int *)(a2 + 32);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);

  return v10(v8, v9);
}

void *sub_1DADD3F1C(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1DADF6790();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  v9[2] = v10[2];
  uint64_t v12 = (void *)((char *)a1 + v8);
  uint64_t v13 = (char *)a2 + v8;
  uint64_t v14 = *(void *)((char *)a2 + v8 + 8);
  *uint64_t v12 = *(void *)((char *)a2 + v8);
  v12[1] = v14;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v15 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v16 = (char *)v12 + v15;
  uint64_t v17 = &v13[v15];
  uint64_t v18 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 16))(v16, v17, v18);
  uint64_t v19 = a3[7];
  uint64_t v20 = a3[8];
  uint64_t v21 = (char *)a1 + v19;
  uint64_t v22 = (char *)a2 + v19;
  char *v21 = *v22;
  *((void *)v21 + 1) = *((void *)v22 + 1);
  uint64_t v23 = (char *)a1 + v20;
  uint64_t v24 = (char *)a2 + v20;
  swift_retain();
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16))(v23, v24, v25);
  return a1;
}

void *sub_1DADD4100(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1DADADF3C((uint64_t)a1, &qword_1EB682F58);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1DADF6790();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  swift_retain();
  swift_release();
  *((void *)v8 + 1) = *((void *)v9 + 1);
  swift_retain();
  swift_release();
  *((void *)v8 + 2) = *((void *)v9 + 2);
  swift_retain();
  swift_release();
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  swift_retain();
  swift_release();
  *((void *)v11 + 1) = *((void *)v12 + 1);
  swift_retain();
  swift_release();
  uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v14 = &v11[v13];
  uint64_t v15 = &v12[v13];
  uint64_t v16 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  uint64_t v17 = a3[7];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  *uint64_t v18 = *v19;
  *((void *)v18 + 1) = *((void *)v19 + 1);
  swift_retain();
  swift_release();
  uint64_t v20 = a3[8];
  uint64_t v21 = (char *)a1 + v20;
  uint64_t v22 = (char *)a2 + v20;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 24))(v21, v22, v23);
  return a1;
}

char *sub_1DADD433C(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1DADF6790();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v8];
  uint64_t v11 = &a2[v8];
  *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
  *((void *)v10 + 2) = *((void *)v11 + 2);
  uint64_t v12 = &a1[v9];
  uint64_t v13 = &a2[v9];
  uint64_t v14 = *(void *)&a2[v9];
  uint64_t v15 = *(void *)&a2[v9 + 8];
  *(void *)uint64_t v12 = v14;
  *((void *)v12 + 1) = v15;
  uint64_t v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v17 = &v12[v16];
  uint64_t v18 = &v13[v16];
  uint64_t v19 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
  uint64_t v20 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 32))(v21, v22, v23);
  return a1;
}

char *sub_1DADD44E0(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1DADADF3C((uint64_t)a1, &qword_1EB682F58);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1DADF6790();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  swift_release();
  *((void *)v9 + 1) = *((void *)v10 + 1);
  swift_release();
  *((void *)v9 + 2) = *((void *)v10 + 2);
  swift_release();
  uint64_t v11 = a3[6];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  *(void *)&a1[v11] = *(void *)&a2[v11];
  swift_release();
  *((void *)v12 + 1) = *((void *)v13 + 1);
  swift_release();
  uint64_t v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v15 = &v12[v14];
  uint64_t v16 = &v13[v14];
  uint64_t v17 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 40))(v15, v16, v17);
  uint64_t v18 = a3[7];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  *uint64_t v19 = *v20;
  *((void *)v19 + 1) = *((void *)v20 + 1);
  swift_release();
  uint64_t v21 = a3[8];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v24 - 8) + 40))(v22, v23, v24);
  return a1;
}

uint64_t sub_1DADD46F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DADD4708);
}

uint64_t sub_1DADD4708(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_9:
    return v9(v10, a2, v8);
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v11 = *(void *)(a1 + a3[5] + 8);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
    uint64_t v14 = *(void *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a2)
    {
      uint64_t v8 = v13;
      uint64_t v10 = a1 + a3[6];
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
      goto LABEL_9;
    }
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[8];
    return v16(v18, a2, v17);
  }
}

uint64_t sub_1DADD4898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DADD48AC);
}

uint64_t sub_1DADD48AC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_7:
    return v11(v12, a2, a2, v10);
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[5] + 8) = (a2 - 1);
    return result;
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + a4[6];
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_7;
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a4[8];

  return v16(v18, a2, a2, v17);
}

uint64_t type metadata accessor for DeviceGlyph(uint64_t a1)
{
  return sub_1DADAD54C(a1, qword_1EB6837F0);
}

void sub_1DADD4A5C()
{
  sub_1DADD389C(319, (unint64_t *)&qword_1EB683638, MEMORY[0x1E4F46AE8], MEMORY[0x1E4F3C648]);
  if (v0 <= 0x3F)
  {
    sub_1DADD389C(319, &qword_1EB682B90, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3EE18]);
    if (v1 <= 0x3F)
    {
      sub_1DADB4B24();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t sub_1DADD4BD0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADD4BEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  MEMORY[0x1F4188790]();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

unint64_t sub_1DADD4CBC()
{
  unint64_t result = qword_1EB6827B8;
  if (!qword_1EB6827B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB6827C0);
    sub_1DADAD660(&qword_1EB6829E8, &qword_1EB6829F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6827B8);
  }
  return result;
}

uint64_t sub_1DADD4D5C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DADD4DC4()
{
  return sub_1DADCC12C();
}

uint64_t sub_1DADD4DF0()
{
  return sub_1DADCC04C();
}

uint64_t sub_1DADD4E20()
{
  return sub_1DADCC0BC();
}

uint64_t sub_1DADD4E50(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_1DADAD660(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DADD4EEC(uint64_t a1)
{
  return a1;
}

uint64_t sub_1DADD4F38(uint64_t a1)
{
  return a1;
}

unint64_t sub_1DADD4F84()
{
  unint64_t result = qword_1EA8F8490;
  if (!qword_1EA8F8490)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB682858);
    sub_1DADD50B0(&qword_1EB6827D0, &qword_1EB6827D8, &qword_1EB682AD8, &qword_1EB682AE0);
    sub_1DADADFFC(&qword_1EA8F83E8, MEMORY[0x1E4F3DF60]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8490);
  }
  return result;
}

uint64_t sub_1DADD5050(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1DADD50B0(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_1DADAD660(a3, a4);
    sub_1DADAD660(&qword_1EB6829D8, &qword_1EB6829E0);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1DADD5170()
{
  unint64_t result = qword_1EA8F8948;
  if (!qword_1EA8F8948)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB682840);
    sub_1DADD4E50(&qword_1EB682790, &qword_1EB682798, &qword_1EB682928, &qword_1EB682930);
    sub_1DADADFFC(&qword_1EA8F83E8, MEMORY[0x1E4F3DF60]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8948);
  }
  return result;
}

uint64_t sub_1DADD523C()
{
  return sub_1DADAD660(&qword_1EB682B28, &qword_1EB682B30);
}

uint64_t sub_1DADD5278()
{
  return sub_1DADD4DC4();
}

uint64_t sub_1DADD5290()
{
  return sub_1DADD4DF0();
}

uint64_t sub_1DADD52A8()
{
  return sub_1DADD4E20();
}

uint64_t sub_1DADD52C0()
{
  return swift_getKeyPath();
}

uint64_t sub_1DADD52E4@<X0>(uint64_t *a1@<X8>)
{
  return sub_1DADA860C(&qword_1EB682F68, a1);
}

uint64_t sub_1DADD52F8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADD53B8(&qword_1EB682F70, MEMORY[0x1E4F3CB98], 0x5463696D616E7944, 0xEF657A6953657079, a1);
}

uint64_t type metadata accessor for BatteryAvocadoArchivableView()
{
  uint64_t result = qword_1EB684310;
  if (!qword_1EB684310) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1DADD53B8@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v28 = a3;
  uint64_t v9 = v5;
  uint64_t v11 = sub_1DADF6030();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x1F4188790](v15);
  uint64_t v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DADAE0AC(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = sub_1DADF69F0();
    uint64_t v21 = sub_1DADF6200();
    if (os_log_type_enabled(v21, v20))
    {
      unint64_t v26 = a4;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v27 = a5;
      uint64_t v23 = (uint8_t *)v22;
      uint64_t v24 = swift_slowAlloc();
      uint64_t v30 = v24;
      *(_DWORD *)uint64_t v23 = 136315138;
      unint64_t v29 = sub_1DADA5DB0(v28, v26, &v30);
      sub_1DADF6A90();
      _os_log_impl(&dword_1DAD96000, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1E01829D0](v24, -1, -1);
      MEMORY[0x1E01829D0](v23, -1, -1);
    }

    sub_1DADF6020();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_1DADD5670@<X0>(uint64_t *a1@<X8>)
{
  return sub_1DADA860C(&qword_1EB682F70, a1);
}

uint64_t sub_1DADD5684()
{
  return sub_1DADF5F10();
}

uint64_t sub_1DADD56A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1DADD58F8(a1, a2, a3, a4, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3CFE8]);
}

uint64_t sub_1DADD56D4()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for BatteryAvocadoArchivableView() + 28);
  uint64_t v2 = *(void *)v1;
  char v3 = *(unsigned char *)(v1 + 8);
  sub_1DADAB7C8(*(void *)v1, v3);
  char v4 = sub_1DADC1758(v2, v3);
  sub_1DADABA40(v2, v3);
  return v4 & 1;
}

uint64_t sub_1DADD573C()
{
  return swift_getKeyPath();
}

uint64_t sub_1DADD5760@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADD53B8(&qword_1EB682F50, MEMORY[0x1E4F27A78], 0x656C61636F4CLL, 0xE600000000000000, a1);
}

uint64_t sub_1DADD57C4@<X0>(uint64_t *a1@<X8>)
{
  return sub_1DADA860C(&qword_1EB682F50, a1);
}

uint64_t sub_1DADD57D8()
{
  return sub_1DADF5F90();
}

uint64_t sub_1DADD57FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1DADD58F8(a1, a2, a3, a4, MEMORY[0x1E4F27A78], MEMORY[0x1E4F3D220]);
}

uint64_t sub_1DADD5828@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADD53B8(&qword_1EB682F60, MEMORY[0x1E4F3D5D8], 0xD000000000000013, 0x80000001DADFB240, a1);
}

uint64_t sub_1DADD5894@<X0>(uint64_t *a1@<X8>)
{
  return sub_1DADA860C(&qword_1EB682F60, a1);
}

uint64_t sub_1DADD58A8()
{
  return sub_1DADF5EE0();
}

uint64_t sub_1DADD58CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1DADD58F8(a1, a2, a3, a4, MEMORY[0x1E4F3D5D8], MEMORY[0x1E4F3CF98]);
}

uint64_t sub_1DADD58F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  MEMORY[0x1F4188790]();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_1DADD59D0()
{
  return sub_1DADD5BE4(MEMORY[0x1E4F3C670]);
}

uint64_t (*sub_1DADD59E8())()
{
  return sub_1DADD5A04;
}

uint64_t sub_1DADD5A04()
{
  uint64_t v0 = sub_1DADF5C00();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  char v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1DADF5D80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AvocadoViewModel();
  sub_1DADDB6D0();
  swift_retain();
  sub_1DADF5B00();
  swift_release();
  uint64_t v8 = v10[1];
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4F3CB60], v4);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4F3C5C0], v0);
  return sub_1DADAFCB4(v8, v7, (uint64_t)v3);
}

uint64_t sub_1DADD5BCC()
{
  return sub_1DADD5BE4(MEMORY[0x1E4F3C678]);
}

uint64_t sub_1DADD5BE4(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2 = (uint64_t *)(v1 + *(int *)(type metadata accessor for BatteryAvocadoArchivableView() + 40));
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  uint64_t v5 = *((unsigned __int8 *)v2 + 16);
  uint64_t v6 = type metadata accessor for AvocadoViewModel();
  uint64_t v7 = sub_1DADDB5A4(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);

  return a1(v3, v4, v5, v6, v7);
}

uint64_t BatteryAvocadoArchivableView.init(withSize:andFamily:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F08);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1DADF67A0();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)a2 = swift_getKeyPath();
  *(unsigned char *)(a2 + 8) = 0;
  uint64_t v15 = (int *)type metadata accessor for BatteryAvocadoArchivableView();
  uint64_t v16 = (uint64_t *)(a2 + v15[5]);
  uint64_t *v16 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  swift_storeEnumTagMultiPayload();
  uint64_t v17 = (uint64_t *)(a2 + v15[6]);
  *uint64_t v17 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F70);
  swift_storeEnumTagMultiPayload();
  uint64_t v18 = a2 + v15[7];
  *(void *)uint64_t v18 = swift_getKeyPath();
  *(unsigned char *)(v18 + 8) = 0;
  uint64_t v19 = (uint64_t *)(a2 + v15[8]);
  *uint64_t v19 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F50);
  swift_storeEnumTagMultiPayload();
  os_log_type_t v20 = (uint64_t *)(a2 + v15[9]);
  uint64_t *v20 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F60);
  swift_storeEnumTagMultiPayload();
  uint64_t v21 = a2 + v15[10];
  *(void *)uint64_t v21 = sub_1DADD5A04;
  *(void *)(v21 + 8) = 0;
  *(unsigned char *)(v21 + 16) = 0;
  uint64_t v22 = v15[11];
  uint64_t v23 = sub_1DADDB6D0();
  uint64_t v24 = (void *)*v23;
  *(void *)(a2 + v22) = *v23;
  sub_1DADAE0AC(a1, (uint64_t)v10, &qword_1EB682F08);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    id v25 = v24;
    sub_1DADADF3C((uint64_t)v10, &qword_1EB682F08);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    if (a3 == 0.0 && a4 == 0.0)
    {
      unint64_t v26 = *(void (**)(char *, uint64_t))(v12 + 8);
      id v27 = v24;
      v26(v14, v11);
    }
    else
    {
      id v28 = v24;
      sub_1DADD5FCC();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    }
  }
  sub_1DADD636C();
  return sub_1DADADF3C(a1, &qword_1EB682F08);
}

void sub_1DADD5FCC()
{
  uint64_t v0 = sub_1DADF5AD0();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1DADF67A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void *)*sub_1DADF3B34();
  if (v8)
  {
    (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4F46B60], v4);
    sub_1DADDB5A4(&qword_1EB6825B0, MEMORY[0x1E4F46B98]);
    id v9 = v8;
    sub_1DADF6900();
    sub_1DADF6900();
    unint64_t v11 = v23;
    uint64_t v10 = v24;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (v10 == v11)
    {
      uint64_t v12 = (void *)sub_1DADF5A70();
      sub_1DADF3A4C();
      swift_bridgeObjectRetain();
      uint64_t v13 = (void *)sub_1DADF6810();
      swift_bridgeObjectRelease();
      objc_msgSend(v9, sel_setObject_forKey_, v12, v13);
    }
  }
  else
  {
    uint64_t v14 = sub_1DADF08BC();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v14, v0);
    uint64_t v15 = sub_1DADF5AB0();
    os_log_type_t v16 = sub_1DADF69E0();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      uint64_t v24 = v18;
      *(_DWORD *)uint64_t v17 = 136315138;
      v22[1] = v17 + 4;
      uint64_t v19 = (uint64_t *)sub_1DADF3A9C();
      uint64_t v20 = *v19;
      unint64_t v21 = v19[1];
      swift_bridgeObjectRetain();
      unint64_t v23 = sub_1DADA5DB0(v20, v21, &v24);
      sub_1DADF6A90();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1DAD96000, v15, v16, "BatteryAvocadoArchivableView: UserDefault object for domain \"%s\" was nil", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1E01829D0](v18, -1, -1);
      MEMORY[0x1E01829D0](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
}

uint64_t sub_1DADD636C()
{
  uint64_t v0 = sub_1DADF5A60();
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v42 = (char *)&v39 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F18);
  uint64_t v2 = *(void *)(v41 - 8);
  MEMORY[0x1F4188790](v41);
  uint64_t v4 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (void *)sub_1DADDB494(MEMORY[0x1E4FBC860]);
  int v43 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = (void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v40 = *MEMORY[0x1E4FB28C8];
  for (double i = 0.0; i < 1.0; double i = v11)
  {
    BOOL v10 = __OFADD__(v6++, 1);
    if (v10) {
      goto LABEL_28;
    }
    double v11 = (double)v6 * 0.01 + 0.0;
LABEL_9:
    double v44 = i * 100.0;
    sub_1DADF5A50();
    sub_1DADB2BCC();
    sub_1DADF5A30();
    sub_1DADAD660(&qword_1EB682F10, &qword_1EB682F18);
    uint64_t v12 = v41;
    sub_1DADF67B0();
    (*v7)(v4, v12);
    uint64_t v13 = v45;
    uint64_t v14 = v46;
    id v15 = objc_msgSend(self, sel_preferredFontForTextStyle_, v40);
    double v16 = sub_1DADF22E0(v15);

    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v45 = v5;
    unint64_t v19 = sub_1DADDAF48(v16);
    uint64_t v20 = v5[2];
    BOOL v21 = (v18 & 1) == 0;
    uint64_t v22 = v20 + v21;
    if (__OFADD__(v20, v21))
    {
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
LABEL_30:
      uint64_t result = sub_1DADF6BC0();
      __break(1u);
      return result;
    }
    char v23 = v18;
    if (v5[3] >= v22)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v5 = v45;
        if (v18) {
          goto LABEL_2;
        }
      }
      else
      {
        sub_1DADDB2E4();
        uint64_t v5 = v45;
        if (v23) {
          goto LABEL_2;
        }
      }
    }
    else
    {
      sub_1DADDB028(v22, isUniquelyReferenced_nonNull_native);
      unint64_t v24 = sub_1DADDAF48(v16);
      if ((v23 & 1) != (v25 & 1)) {
        goto LABEL_30;
      }
      unint64_t v19 = v24;
      uint64_t v5 = v45;
      if (v23)
      {
LABEL_2:
        id v9 = (void *)(v5[7] + 16 * v19);
        swift_bridgeObjectRelease();
        *id v9 = v13;
        v9[1] = v14;
        goto LABEL_3;
      }
    }
    v5[(v19 >> 6) + 8] |= 1 << v19;
    *(double *)(v5[6] + 8 * v19) = v16;
    unint64_t v26 = (void *)(v5[7] + 16 * v19);
    *unint64_t v26 = v13;
    v26[1] = v14;
    uint64_t v27 = v5[2];
    BOOL v10 = __OFADD__(v27, 1);
    uint64_t v28 = v27 + 1;
    if (v10) {
      goto LABEL_29;
    }
    v5[2] = v28;
LABEL_3:
    swift_bridgeObjectRelease();
  }
  double v11 = 1.0;
  if (!((i != 1.0) | v43 & 1))
  {
    int v43 = 1;
    goto LABEL_9;
  }
  uint64_t v29 = swift_bridgeObjectRetain();
  uint64_t v30 = sub_1DADD8B28(v29);
  char v32 = v31;
  swift_bridgeObjectRelease();
  if ((v32 & 1) == 0)
  {
    if (v5[2])
    {
      sub_1DADDAF48(*(double *)&v30);
      if (v33)
      {
        swift_bridgeObjectRetain();
        uint64_t v34 = (void *)*sub_1DADF3B34();
        if (v34)
        {
          id v35 = v34;
          uint64_t v36 = (void *)sub_1DADF6810();
          swift_bridgeObjectRelease();
          sub_1DADF3A74();
          swift_bridgeObjectRetain();
          uint64_t v37 = (void *)sub_1DADF6810();
          swift_bridgeObjectRelease();
          objc_msgSend(v35, sel_setObject_forKey_, v36, v37);
        }
        else
        {
          swift_bridgeObjectRelease();
        }
      }
    }
  }
  return swift_bridgeObjectRelease();
}

uint64_t BatteryAvocadoArchivableView.init(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F08);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1DADF67A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  BatteryAvocadoArchivableView.init(withSize:andFamily:)((uint64_t)v6, a2, 0.0, 0.0);
  return __swift_destroy_boxed_opaque_existential_0(a1);
}

uint64_t BatteryAvocadoArchivableView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v94 = a1;
  uint64_t v93 = sub_1DADF5A60();
  uint64_t v95 = *(void *)(v93 - 8);
  MEMORY[0x1F4188790](v93);
  uint64_t v92 = (uint64_t)&v74 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v90 = sub_1DADF5C00();
  uint64_t v91 = *(void *)(v90 - 8);
  MEMORY[0x1F4188790](v90);
  uint64_t v89 = (uint64_t)&v74 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_1DADF5D80();
  uint64_t v88 = *(void *)(v87 - 8);
  MEMORY[0x1F4188790](v87);
  uint64_t v83 = (uint64_t)&v74 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682BD8);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v78 = (char *)&v74 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682650);
  uint64_t v80 = *(void *)(v81 - 8);
  MEMORY[0x1F4188790](v81);
  uint64_t v79 = (char *)&v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for BatteryAvocadoArchivableView();
  uint64_t v106 = *(void *)(v7 - 8);
  uint64_t v105 = *(void *)(v106 + 64);
  uint64_t v107 = v7 - 8;
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v98 = (uint64_t)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v104 = (uint64_t (*)())(sub_1DADF61B0() - 8);
  MEMORY[0x1F4188790](v104);
  BOOL v10 = (char *)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = sub_1DADF5E80();
  uint64_t v75 = *(void *)(v96 - 8);
  uint64_t v11 = v75;
  MEMORY[0x1F4188790](v96);
  uint64_t v13 = (char *)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6825B8) - 8;
  MEMORY[0x1F4188790](v76);
  id v15 = (char *)&v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6825C0) - 8;
  MEMORY[0x1F4188790](v77);
  uint64_t v97 = (uint64_t)&v74 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6825D0);
  MEMORY[0x1F4188790](v100);
  uint64_t v99 = (uint64_t)&v74 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6825D8);
  uint64_t v84 = *(void *)(v82 - 8);
  MEMORY[0x1F4188790](v82);
  uint64_t v101 = (char *)&v74 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6825E0);
  uint64_t v86 = *(void *)(v85 - 8);
  MEMORY[0x1F4188790](v85);
  uint64_t v102 = (char *)&v74 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AvocadoViewModel();
  sub_1DADDB5A4(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
  sub_1DADF5C20();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v21 = sub_1DADF5D40();
  uint64_t v23 = v22;
  uint64_t v24 = swift_getKeyPath();
  uint64_t v25 = sub_1DADF6160();
  sub_1DADF5E70();
  uint64_t v26 = sub_1DADF6710();
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  uint64_t v28 = v96;
  v27(v10, v13, v96);
  uint64_t v29 = v104;
  *(void *)&v10[*((int *)v104 + 7)] = v26;
  *(_DWORD *)&v10[*((int *)v29 + 8)] = 0;
  sub_1DADDAE80((uint64_t)v10, (uint64_t)&v15[*(int *)(v76 + 44)], MEMORY[0x1E4F3DD90]);
  *(void *)id v15 = KeyPath;
  v15[8] = 0;
  *((void *)v15 + 2) = v21;
  *((void *)v15 + 3) = v23;
  *((void *)v15 + 4) = v24;
  *((void *)v15 + 5) = v25;
  *((void *)v15 + 6) = MEMORY[0x1E4F3D8C8];
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1DADDAEE8((uint64_t)v10, MEMORY[0x1E4F3DD90]);
  (*(void (**)(char *, uint64_t))(v75 + 8))(v13, v28);
  swift_release();
  swift_release();
  swift_release();
  double v104 = type metadata accessor for BatteryAvocadoArchivableView;
  uint64_t v30 = v103;
  uint64_t v31 = v98;
  sub_1DADDAE80(v103, v98, (uint64_t (*)(void))type metadata accessor for BatteryAvocadoArchivableView);
  uint64_t v32 = v105;
  uint64_t v33 = *(unsigned __int8 *)(v106 + 80);
  uint64_t v34 = (v33 + 16) & ~v33;
  uint64_t v105 = v33 | 7;
  uint64_t v106 = v34 + v32;
  uint64_t v35 = swift_allocObject();
  uint64_t v96 = v34;
  sub_1DADD7CA8(v31, v35 + v34);
  uint64_t v36 = v97;
  sub_1DADAE0AC((uint64_t)v15, v97, &qword_1EB6825B8);
  uint64_t v37 = (void (**)())(v36 + *(int *)(v77 + 44));
  *uint64_t v37 = sub_1DADD7D0C;
  v37[1] = (void (*)())v35;
  v37[2] = 0;
  _OWORD v37[3] = 0;
  sub_1DADADF3C((uint64_t)v15, &qword_1EB6825B8);
  uint64_t v108 = *(void *)(*(void *)(v30 + *(int *)(v107 + 52))
                   + OBJC_IVAR____TtC15BatteryCenterUI21BatteryCenterObserver_subject);
  sub_1DADD7D6C();
  swift_retain();
  id v112 = (id)sub_1DADF6A40();
  uint64_t v38 = sub_1DADF6A20();
  uint64_t v39 = (uint64_t)v78;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v78, 1, 1, v38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6835B0);
  sub_1DADAD660(&qword_1EB682658, &qword_1EB6835B0);
  sub_1DADDB5A4((unint64_t *)&qword_1EB682BE0, (void (*)(uint64_t))sub_1DADD7D6C);
  uint64_t v40 = v79;
  sub_1DADF5B90();
  sub_1DADADF3C(v39, &qword_1EB682BD8);

  swift_release();
  sub_1DADDAE80(v30, v31, (uint64_t (*)(void))v104);
  uint64_t v41 = swift_allocObject();
  sub_1DADD7CA8(v31, v41 + v34);
  uint64_t v42 = v97;
  uint64_t v43 = v99;
  sub_1DADAE0AC(v97, v99, &qword_1EB6825C0);
  uint64_t v44 = v100;
  uint64_t v45 = v80;
  uint64_t v46 = v81;
  (*(void (**)(uint64_t, char *, uint64_t))(v80 + 16))(v43 + *(int *)(v100 + 52), v40, v81);
  uint64_t v47 = (uint64_t (**)(uint64_t *))(v43 + *(int *)(v44 + 56));
  *uint64_t v47 = sub_1DADD7DB0;
  v47[1] = (uint64_t (*)(uint64_t *))v41;
  (*(void (**)(char *, uint64_t))(v45 + 8))(v40, v46);
  sub_1DADADF3C(v42, &qword_1EB6825C0);
  uint64_t v48 = v103;
  uint64_t v49 = v83;
  sub_1DADD53B8(&qword_1EB682F70, MEMORY[0x1E4F3CB98], 0x5463696D616E7944, 0xEF657A6953657079, v83);
  uint64_t v50 = v31;
  uint64_t v51 = v104;
  sub_1DADDAE80(v48, v31, (uint64_t (*)(void))v104);
  uint64_t v52 = swift_allocObject();
  uint64_t v53 = v96;
  sub_1DADD7CA8(v50, v52 + v96);
  uint64_t v81 = sub_1DADAD660(&qword_1EB6825C8, &qword_1EB6825D0);
  uint64_t v97 = sub_1DADDB5A4(&qword_1EB682750, MEMORY[0x1E4F3CB98]);
  uint64_t v54 = v100;
  uint64_t v55 = v87;
  uint64_t v56 = v99;
  sub_1DADF6460();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v49, v55);
  sub_1DADADF3C(v56, &qword_1EB6825D0);
  uint64_t v57 = v103;
  uint64_t v58 = v89;
  sub_1DADD53B8(&qword_1EB682F68, MEMORY[0x1E4F3C5D0], 0x686353726F6C6F43, 0xEB00000000656D65, v89);
  uint64_t v59 = v98;
  sub_1DADDAE80(v57, v98, (uint64_t (*)(void))v51);
  uint64_t v60 = swift_allocObject() + v53;
  uint64_t v61 = v59;
  sub_1DADD7CA8(v59, v60);
  uint64_t v108 = v54;
  uint64_t v109 = v55;
  uint64_t v110 = v81;
  uint64_t v111 = v97;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v63 = sub_1DADDB5A4(&qword_1EB682680, MEMORY[0x1E4F3C5D0]);
  uint64_t v64 = v101;
  uint64_t v65 = v58;
  uint64_t v66 = v82;
  uint64_t v67 = v90;
  sub_1DADF6460();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v91 + 8))(v65, v67);
  (*(void (**)(char *, uint64_t))(v84 + 8))(v64, v66);
  uint64_t v68 = v92;
  sub_1DADD53B8(&qword_1EB682F50, MEMORY[0x1E4F27A78], 0x656C61636F4CLL, 0xE600000000000000, v92);
  sub_1DADDAE80(v57, v61, (uint64_t (*)(void))v104);
  uint64_t v69 = swift_allocObject();
  sub_1DADD7CA8(v61, v69 + v96);
  uint64_t v108 = v66;
  uint64_t v109 = v67;
  uint64_t v110 = OpaqueTypeConformance2;
  uint64_t v111 = v63;
  swift_getOpaqueTypeConformance2();
  sub_1DADDB5A4(&qword_1EB682600, MEMORY[0x1E4F27A78]);
  uint64_t v70 = v93;
  uint64_t v71 = v85;
  uint64_t v72 = v102;
  sub_1DADF6460();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v68, v70);
  return (*(uint64_t (**)(char *, uint64_t))(v86 + 8))(v72, v71);
}

uint64_t sub_1DADD77B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1DADF5EF0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1DADD77E4()
{
  return sub_1DADF5F00();
}

void sub_1DADD7810()
{
  uint64_t v0 = sub_1DADF5C00();
  MEMORY[0x1F4188790](v0 - 8);
  uint64_t v20 = (uint64_t)&v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1DADF5D80();
  MEMORY[0x1F4188790](v2 - 8);
  uint64_t v19 = (uint64_t)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BatteryAvocadoArchivableView();
  type metadata accessor for AvocadoViewModel();
  sub_1DADDB5A4(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
  uint64_t v4 = sub_1DADF5C20();
  swift_retain();
  sub_1DADF5B00();
  swift_release();
  (*(void (**)(uint64_t))(*(void *)v4 + 456))(v21);
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = sub_1DADF5C20();
  uint64_t v6 = v19;
  sub_1DADD53B8(&qword_1EB682F70, MEMORY[0x1E4F3CB98], 0x5463696D616E7944, 0xEF657A6953657079, v19);
  (*(void (**)(uint64_t))(*(void *)v5 + 368))(v6);
  swift_release();
  uint64_t v7 = sub_1DADF5C20();
  uint64_t v8 = v20;
  sub_1DADD53B8(&qword_1EB682F68, MEMORY[0x1E4F3C5D0], 0x686353726F6C6F43, 0xEB00000000656D65, v20);
  (*(void (**)(uint64_t))(*(void *)v7 + 416))(v8);
  swift_release();
  uint64_t v9 = sub_1DADF3B34();
  if (*v9)
  {
    id v10 = (id)*v9;
    sub_1DADF3A4C();
    swift_bridgeObjectRetain();
    uint64_t v11 = (void *)sub_1DADF6810();
    swift_bridgeObjectRelease();
    objc_msgSend(v10, sel_floatForKey_, v11);
    float v13 = v12;

    if (v13 != 0.0)
    {
      uint64_t v14 = *(void *)sub_1DADF5C20();
      (*(void (**)(void))(v14 + 312))();
      char v16 = v15;
      swift_release();
      if (v16)
      {
        uint64_t v17 = sub_1DADF5C20();
        (*(void (**)(void, void))(*(void *)v17 + 320))(v13, 0);
        swift_release();
      }
    }
  }
}

uint64_t sub_1DADD7CA0()
{
  return swift_release();
}

uint64_t sub_1DADD7CA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BatteryAvocadoArchivableView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1DADD7D0C()
{
  type metadata accessor for BatteryAvocadoArchivableView();

  sub_1DADD7810();
}

unint64_t sub_1DADD7D6C()
{
  unint64_t result = qword_1EB683690;
  if (!qword_1EB683690)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB683690);
  }
  return result;
}

uint64_t sub_1DADD7DB0(uint64_t *a1)
{
  type metadata accessor for BatteryAvocadoArchivableView();
  uint64_t v2 = *a1;
  type metadata accessor for AvocadoViewModel();
  sub_1DADDB5A4(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
  uint64_t v3 = *(void *)sub_1DADF5C20();
  (*(void (**)(uint64_t))(v3 + 456))(v2);

  return swift_release();
}

uint64_t sub_1DADD7EDC(uint64_t a1)
{
  uint64_t v2 = sub_1DADF5D80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BatteryAvocadoArchivableView();
  type metadata accessor for AvocadoViewModel();
  sub_1DADDB5A4(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
  uint64_t v6 = sub_1DADF5C20();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  (*(void (**)(char *))(*(void *)v6 + 368))(v5);
  return swift_release();
}

uint64_t sub_1DADD806C(uint64_t a1, uint64_t a2)
{
  return sub_1DADD822C(a1, a2, (uint64_t (*)(uint64_t, uint64_t))sub_1DADD7EDC);
}

uint64_t sub_1DADD8084(uint64_t a1)
{
  uint64_t v2 = sub_1DADF5C00();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BatteryAvocadoArchivableView();
  type metadata accessor for AvocadoViewModel();
  sub_1DADDB5A4(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
  uint64_t v6 = sub_1DADF5C20();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  (*(void (**)(char *))(*(void *)v6 + 416))(v5);
  return swift_release();
}

uint64_t sub_1DADD8214(uint64_t a1, uint64_t a2)
{
  return sub_1DADD822C(a1, a2, (uint64_t (*)(uint64_t, uint64_t))sub_1DADD8084);
}

uint64_t sub_1DADD822C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v5 = *(void *)(type metadata accessor for BatteryAvocadoArchivableView() - 8);
  uint64_t v6 = v3 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return a3(a2, v6);
}

uint64_t sub_1DADD82B4()
{
  type metadata accessor for BatteryAvocadoArchivableView();

  return sub_1DADD636C();
}

uint64_t sub_1DADD82E0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADD82FC@<X0>(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v47 = a3;
  uint64_t v52 = a4;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682958);
  MEMORY[0x1F4188790](v46);
  uint64_t v7 = (uint64_t **)((char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682990);
  MEMORY[0x1F4188790](v51);
  uint64_t v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = type metadata accessor for BCUI2x4AvocadoView();
  MEMORY[0x1F4188790](v44);
  uint64_t v43 = (uint64_t *)((char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682970);
  MEMORY[0x1F4188790](v49);
  float v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682950);
  MEMORY[0x1F4188790](v13);
  char v15 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682980);
  MEMORY[0x1F4188790](v50);
  uint64_t v45 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A0);
  MEMORY[0x1F4188790](v17 - 8);
  uint64_t v19 = (uint64_t *)((char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v48 = type metadata accessor for BCUI2x2AvocadoView(0);
  MEMORY[0x1F4188790](v48);
  uint64_t v21 = (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v22 = a2 & 1;
  sub_1DADB63C4(a1, a2 & 1);
  uint64_t v23 = (void *)sub_1DADBAA78(a1, a2 & 1);
  sub_1DADB6340(a1, v22);
  if (!v23) {
    goto LABEL_6;
  }
  id v24 = objc_msgSend(v23, sel_family);

  if (v24 != (id)3)
  {
    if (v24 == (id)2)
    {
      swift_retain();
      sub_1DADB517C();
      uint64_t v41 = v43;
      sub_1DADB43C0(v43);
      sub_1DADDAE80((uint64_t)v41, (uint64_t)v15, (uint64_t (*)(void))type metadata accessor for BCUI2x4AvocadoView);
      swift_storeEnumTagMultiPayload();
      sub_1DADDB5A4(&qword_1EB682618, (void (*)(uint64_t))type metadata accessor for BCUI2x2AvocadoView);
      sub_1DADDB5A4(&qword_1EB682620, (void (*)(uint64_t))type metadata accessor for BCUI2x4AvocadoView);
      uint64_t v42 = (uint64_t)v45;
      sub_1DADF6140();
      sub_1DADAE0AC(v42, (uint64_t)v12, &qword_1EB682980);
      swift_storeEnumTagMultiPayload();
      sub_1DADDACF8();
      sub_1DADDADD4();
      sub_1DADF6140();
      sub_1DADADF3C(v42, &qword_1EB682980);
      uint64_t v36 = (uint64_t (*)(void))type metadata accessor for BCUI2x4AvocadoView;
      uint64_t v37 = (uint64_t)v41;
      return sub_1DADDAEE8(v37, v36);
    }
    if (v24 == (id)1)
    {
      swift_retain();
      sub_1DADC1930(v19);
      uint64_t v25 = sub_1DADC681C();
      char v27 = v26 & 1;
      sub_1DADC6840();
      double v28 = sub_1DADC685C();
      sub_1DADC6878((uint64_t)v19, v25, v27, (uint64_t)v21, v28);
      sub_1DADDAE80((uint64_t)v21, (uint64_t)v15, type metadata accessor for BCUI2x2AvocadoView);
      swift_storeEnumTagMultiPayload();
      sub_1DADDB5A4(&qword_1EB682618, (void (*)(uint64_t))type metadata accessor for BCUI2x2AvocadoView);
      sub_1DADDB5A4(&qword_1EB682620, (void (*)(uint64_t))type metadata accessor for BCUI2x4AvocadoView);
      uint64_t v29 = (uint64_t)v45;
      sub_1DADF6140();
      uint64_t v30 = &qword_1EB682980;
      sub_1DADAE0AC(v29, (uint64_t)v12, &qword_1EB682980);
      swift_storeEnumTagMultiPayload();
      sub_1DADDACF8();
      sub_1DADDADD4();
      sub_1DADF6140();
      uint64_t v31 = v29;
LABEL_7:
      sub_1DADADF3C(v31, v30);
      uint64_t v36 = type metadata accessor for BCUI2x2AvocadoView;
      uint64_t v37 = (uint64_t)v21;
      return sub_1DADDAEE8(v37, v36);
    }
LABEL_6:
    swift_retain();
    sub_1DADC1930(v19);
    uint64_t v32 = sub_1DADC681C();
    char v34 = v33 & 1;
    sub_1DADC6840();
    double v35 = sub_1DADC685C();
    sub_1DADC6878((uint64_t)v19, v32, v34, (uint64_t)v21, v35);
    sub_1DADDAE80((uint64_t)v21, (uint64_t)v7, type metadata accessor for BCUI2x2AvocadoView);
    swift_storeEnumTagMultiPayload();
    sub_1DADDACA4();
    sub_1DADDB5A4(&qword_1EB682618, (void (*)(uint64_t))type metadata accessor for BCUI2x2AvocadoView);
    sub_1DADF6140();
    uint64_t v30 = &qword_1EB682990;
    sub_1DADAE0AC((uint64_t)v9, (uint64_t)v12, &qword_1EB682990);
    swift_storeEnumTagMultiPayload();
    sub_1DADDACF8();
    sub_1DADDADD4();
    sub_1DADF6140();
    uint64_t v31 = (uint64_t)v9;
    goto LABEL_7;
  }
  uint64_t v39 = swift_retain();
  *uint64_t v7 = sub_1DADE3940(v39);
  v7[1] = v40;
  swift_storeEnumTagMultiPayload();
  sub_1DADDACA4();
  sub_1DADDB5A4(&qword_1EB682618, (void (*)(uint64_t))type metadata accessor for BCUI2x2AvocadoView);
  swift_retain();
  sub_1DADF6140();
  sub_1DADAE0AC((uint64_t)v9, (uint64_t)v12, &qword_1EB682990);
  swift_storeEnumTagMultiPayload();
  sub_1DADDACF8();
  sub_1DADDADD4();
  sub_1DADF6140();
  sub_1DADADF3C((uint64_t)v9, &qword_1EB682990);
  return swift_release();
}

uint64_t sub_1DADD8B10@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADD82FC(*(void **)v1, *(unsigned char *)(v1 + 8), *(void *)(v1 + 24), a1);
}

uint64_t sub_1DADD8B28(uint64_t a1)
{
  uint64_t v1 = a1 + 64;
  char v2 = *(unsigned char *)(a1 + 32);
  uint64_t v3 = 1 << v2;
  uint64_t v4 = -1;
  if (1 << v2 < 64) {
    uint64_t v4 = ~(-1 << (1 << v2));
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  if (v5)
  {
    uint64_t v6 = 0;
    unint64_t v7 = __clz(__rbit64(v5));
    unint64_t v8 = (v5 - 1) & v5;
    int64_t v9 = (unint64_t)(v3 + 63) >> 6;
  }
  else
  {
    LODWORD(v6) = v2 & 0x3F;
    if (v6 <= 6) {
      return 0;
    }
    int64_t v9 = (unint64_t)(v3 + 63) >> 6;
    unint64_t v18 = *(void *)(a1 + 72);
    if (v18)
    {
      uint64_t v6 = 1;
    }
    else
    {
      if (v6 < 8) {
        return 0;
      }
      unint64_t v18 = *(void *)(a1 + 80);
      if (v18)
      {
        uint64_t v6 = 2;
      }
      else
      {
        unint64_t v18 = *(void *)(a1 + 88);
        if (v18)
        {
          uint64_t v6 = 3;
        }
        else
        {
LABEL_37:
          if (v6 < 9) {
            return 0;
          }
          unint64_t v18 = *(void *)(a1 + 96);
          if (v18)
          {
            uint64_t v6 = 4;
          }
          else
          {
            unint64_t v18 = *(void *)(a1 + 104);
            if (!v18) {
              goto LABEL_43;
            }
            uint64_t v6 = 5;
          }
        }
      }
    }
LABEL_30:
    unint64_t v8 = (v18 - 1) & v18;
    unint64_t v7 = __clz(__rbit64(v18)) + (v6 << 6);
  }
  uint64_t v10 = *(void *)(a1 + 48);
  double v11 = *(double *)(v10 + 8 * v7);
  while (v8)
  {
    unint64_t v12 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v13 = v12 | (v6 << 6);
LABEL_7:
    if (v11 < *(double *)(v10 + 8 * v13)) {
      double v11 = *(double *)(v10 + 8 * v13);
    }
  }
  int64_t v14 = v6 + 1;
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v14 >= v9) {
    return *(void *)&v11;
  }
  unint64_t v15 = *(void *)(v1 + 8 * v14);
  ++v6;
  if (v15) {
    goto LABEL_25;
  }
  uint64_t v6 = v14 + 1;
  if (v14 + 1 >= v9) {
    return *(void *)&v11;
  }
  unint64_t v15 = *(void *)(v1 + 8 * v6);
  if (v15) {
    goto LABEL_25;
  }
  uint64_t v6 = v14 + 2;
  if (v14 + 2 >= v9) {
    return *(void *)&v11;
  }
  unint64_t v15 = *(void *)(v1 + 8 * v6);
  if (v15) {
    goto LABEL_25;
  }
  uint64_t v6 = v14 + 3;
  if (v14 + 3 >= v9) {
    return *(void *)&v11;
  }
  unint64_t v15 = *(void *)(v1 + 8 * v6);
  if (v15)
  {
LABEL_25:
    unint64_t v8 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v6 << 6);
    goto LABEL_7;
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v9) {
    return *(void *)&v11;
  }
  unint64_t v15 = *(void *)(v1 + 8 * v16);
  if (v15)
  {
    uint64_t v6 = v16;
    goto LABEL_25;
  }
  while (1)
  {
    uint64_t v6 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v6 >= v9) {
      return *(void *)&v11;
    }
    unint64_t v15 = *(void *)(v1 + 8 * v6);
    ++v16;
    if (v15) {
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_43:
  uint64_t v19 = 0;
  uint64_t v20 = 6;
  if (v9 > 6) {
    uint64_t v20 = v9;
  }
  uint64_t v21 = v20 - 6;
  while (v21 != v19)
  {
    unint64_t v18 = *(void *)(a1 + 112 + 8 * v19++);
    if (v18)
    {
      uint64_t v6 = v19 + 5;
      goto LABEL_30;
    }
  }
  return 0;
}

uint64_t sub_1DADD8D24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DADDB5A4((unint64_t *)&qword_1EB6835E8, (void (*)(uint64_t))type metadata accessor for BatteryAvocadoArchivableView);

  return MEMORY[0x1F40F8CC0](a1, a2, a3, v6);
}

uint64_t sub_1DADD8DB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1DADDB5A4((unint64_t *)&qword_1EB6835E8, (void (*)(uint64_t))type metadata accessor for BatteryAvocadoArchivableView);

  return MEMORY[0x1F40F8CC8](a1, a2, a3, v6);
}

uint64_t sub_1DADD8E4C()
{
  return sub_1DADF5E00();
}

uint64_t sub_1DADD8EC4()
{
  return sub_1DADDB5A4(&qword_1EB683600, (void (*)(uint64_t))type metadata accessor for BatteryAvocadoArchivableView);
}

uint64_t sub_1DADD8F0C()
{
  return sub_1DADDB5A4(&qword_1EB6835F8, (void (*)(uint64_t))type metadata accessor for BatteryAvocadoArchivableView);
}

uint64_t sub_1DADD8F54()
{
  return sub_1DADDB5A4(&qword_1EB6835F0, (void (*)(uint64_t))type metadata accessor for BatteryAvocadoArchivableView);
}

uint64_t sub_1DADD8F9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F08);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1DADF67A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  BatteryAvocadoArchivableView.init(withSize:andFamily:)((uint64_t)v6, a2, 0.0, 0.0);
  return __swift_destroy_boxed_opaque_existential_0(a1);
}

char *initializeBufferWithCopyOfBuffer for BatteryAvocadoArchivableView(char *a1, char **a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    unint64_t v13 = *a2;
    *(void *)a1 = *a2;
    a1 = &v13[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    char v8 = *((unsigned char *)a2 + 8);
    sub_1DADB63C4(*a2, v8);
    *(void *)a1 = v7;
    a1[8] = v8;
    uint64_t v9 = a3[5];
    uint64_t v10 = &a1[v9];
    double v11 = (char **)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_1DADF5C00();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *(void *)uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v14 = a3[6];
    unint64_t v15 = &a1[v14];
    int64_t v16 = (char **)((char *)a2 + v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_1DADF5D80();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *(void *)unint64_t v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v18 = a3[7];
    uint64_t v19 = &a1[v18];
    uint64_t v20 = (uint64_t)a2 + v18;
    uint64_t v21 = *(void *)v20;
    char v22 = *(unsigned char *)(v20 + 8);
    sub_1DADAB7C8(*(void *)v20, v22);
    *(void *)uint64_t v19 = v21;
    v19[8] = v22;
    uint64_t v23 = a3[8];
    id v24 = &a1[v23];
    uint64_t v25 = (char **)((char *)a2 + v23);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v26 = sub_1DADF5A60();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v26 - 8) + 16))(v24, v25, v26);
    }
    else
    {
      *(void *)id v24 = *v25;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v27 = a3[9];
    double v28 = &a1[v27];
    uint64_t v29 = (char **)((char *)a2 + v27);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F60);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v30 = sub_1DADF60F0();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
    }
    else
    {
      *(void *)double v28 = *v29;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v31 = a3[10];
    uint64_t v32 = &a1[v31];
    char v33 = (uint64_t *)((char *)a2 + v31);
    uint64_t v34 = *v33;
    uint64_t v35 = v33[1];
    char v36 = *((unsigned char *)v33 + 16);
    sub_1DADD93CC();
    *(void *)uint64_t v32 = v34;
    *((void *)v32 + 1) = v35;
    v32[16] = v36;
    uint64_t v37 = a3[11];
    uint64_t v38 = *(char **)((char *)a2 + v37);
    *(void *)&a1[v37] = v38;
    id v39 = v38;
  }
  return a1;
}

uint64_t sub_1DADD93CC()
{
  return swift_retain();
}

void destroy for BatteryAvocadoArchivableView(uint64_t a1, int *a2)
{
  sub_1DADB6340(*(id *)a1, *(unsigned char *)(a1 + 8));
  uint64_t v4 = a1 + a2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_1DADF5C00();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  uint64_t v6 = a1 + a2[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1DADF5D80();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  sub_1DADABA40(*(void *)(a1 + a2[7]), *(unsigned char *)(a1 + a2[7] + 8));
  uint64_t v8 = a1 + a2[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = sub_1DADF5A60();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  }
  else
  {
    swift_release();
  }
  uint64_t v10 = a1 + a2[9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_1DADF60F0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  }
  else
  {
    swift_release();
  }
  sub_1DADD7CA0();
  uint64_t v12 = *(void **)(a1 + a2[11]);
}

uint64_t initializeWithCopy for BatteryAvocadoArchivableView(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = *(id *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_1DADB63C4(*(id *)a2, v7);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  uint64_t v8 = a3[5];
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (void *)(a2 + v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_1DADF5C00();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  }
  else
  {
    *uint64_t v9 = *v10;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v12 = a3[6];
  unint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_1DADF5D80();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  else
  {
    *unint64_t v13 = *v14;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v16 = a3[7];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = *(void *)v18;
  char v20 = *(unsigned char *)(v18 + 8);
  sub_1DADAB7C8(*(void *)v18, v20);
  *(void *)uint64_t v17 = v19;
  *(unsigned char *)(v17 + 8) = v20;
  uint64_t v21 = a3[8];
  char v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v24 = sub_1DADF5A60();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v24 - 8) + 16))(v22, v23, v24);
  }
  else
  {
    *char v22 = *v23;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v25 = a3[9];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (void *)(a2 + v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v28 = sub_1DADF60F0();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
  }
  else
  {
    *uint64_t v26 = *v27;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v29 = a3[10];
  uint64_t v30 = a1 + v29;
  uint64_t v31 = (uint64_t *)(a2 + v29);
  uint64_t v32 = *v31;
  uint64_t v33 = v31[1];
  char v34 = *((unsigned char *)v31 + 16);
  sub_1DADD93CC();
  *(void *)uint64_t v30 = v32;
  *(void *)(v30 + 8) = v33;
  *(unsigned char *)(v30 + 16) = v34;
  uint64_t v35 = a3[11];
  char v36 = *(void **)(a2 + v35);
  *(void *)(a1 + v35) = v36;
  id v37 = v36;
  return a1;
}

uint64_t assignWithCopy for BatteryAvocadoArchivableView(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = *(id *)a2;
  char v7 = *(unsigned char *)(a2 + 8);
  sub_1DADB63C4(*(id *)a2, v7);
  uint64_t v8 = *(void **)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_1DADB6340(v8, v9);
  if (a1 != a2)
  {
    uint64_t v10 = a3[5];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (void *)(a2 + v10);
    sub_1DADADF3C(a1 + v10, &qword_1EB682F68);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_1DADF5C00();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      *uint64_t v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v14 = a3[6];
    uint64_t v15 = (void *)(a1 + v14);
    uint64_t v16 = (void *)(a2 + v14);
    sub_1DADADF3C(a1 + v14, &qword_1EB682F70);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_1DADF5D80();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *uint64_t v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v18 = a3[7];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = *(void *)v20;
  char v22 = *(unsigned char *)(v20 + 8);
  sub_1DADAB7C8(*(void *)v20, v22);
  uint64_t v23 = *(void *)v19;
  char v24 = *(unsigned char *)(v19 + 8);
  *(void *)uint64_t v19 = v21;
  *(unsigned char *)(v19 + 8) = v22;
  sub_1DADABA40(v23, v24);
  if (a1 != a2)
  {
    uint64_t v25 = a3[8];
    uint64_t v26 = (void *)(a1 + v25);
    uint64_t v27 = (void *)(a2 + v25);
    sub_1DADADF3C(a1 + v25, &qword_1EB682F50);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v28 = sub_1DADF5A60();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v28 - 8) + 16))(v26, v27, v28);
    }
    else
    {
      *uint64_t v26 = *v27;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v29 = a3[9];
    uint64_t v30 = (void *)(a1 + v29);
    uint64_t v31 = (void *)(a2 + v29);
    sub_1DADADF3C(a1 + v29, &qword_1EB682F60);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F60);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v32 = sub_1DADF60F0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
    }
    else
    {
      *uint64_t v30 = *v31;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v33 = a3[10];
  uint64_t v34 = a1 + v33;
  uint64_t v35 = (uint64_t *)(a2 + v33);
  uint64_t v36 = *v35;
  uint64_t v37 = v35[1];
  char v38 = *((unsigned char *)v35 + 16);
  sub_1DADD93CC();
  *(void *)uint64_t v34 = v36;
  *(void *)(v34 + 8) = v37;
  *(unsigned char *)(v34 + 16) = v38;
  sub_1DADD7CA0();
  uint64_t v39 = a3[11];
  uint64_t v40 = *(void **)(a2 + v39);
  uint64_t v41 = *(void **)(a1 + v39);
  *(void *)(a1 + v39) = v40;
  id v42 = v40;

  return a1;
}

uint64_t initializeWithTake for BatteryAvocadoArchivableView(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v6 = a3[5];
  char v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_1DADF5C00();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[6];
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_1DADF5D80();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  uint64_t v16 = a3[7];
  uint64_t v17 = a3[8];
  uint64_t v18 = a1 + v16;
  uint64_t v19 = a2 + v16;
  *(void *)uint64_t v18 = *(void *)v19;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  uint64_t v20 = (void *)(a1 + v17);
  uint64_t v21 = (const void *)(a2 + v17);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F50);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v23 = sub_1DADF5A60();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v23 - 8) + 32))(v20, v21, v23);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v20, v21, *(void *)(*(void *)(v22 - 8) + 64));
  }
  uint64_t v24 = a3[9];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (const void *)(a2 + v24);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F60);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v28 = sub_1DADF60F0();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v28 - 8) + 32))(v25, v26, v28);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v25, v26, *(void *)(*(void *)(v27 - 8) + 64));
  }
  uint64_t v29 = a3[10];
  uint64_t v30 = a3[11];
  uint64_t v31 = a1 + v29;
  uint64_t v32 = a2 + v29;
  *(_OWORD *)uint64_t v31 = *(_OWORD *)v32;
  *(unsigned char *)(v31 + 16) = *(unsigned char *)(v32 + 16);
  *(void *)(a1 + v30) = *(void *)(a2 + v30);
  return a1;
}

uint64_t assignWithTake for BatteryAvocadoArchivableView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  char v7 = *((unsigned char *)a2 + 8);
  uint64_t v8 = *(void **)a1;
  char v9 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v6;
  *(unsigned char *)(a1 + 8) = v7;
  sub_1DADB6340(v8, v9);
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v10 = a3[5];
    uint64_t v11 = (void *)(a1 + v10);
    uint64_t v12 = (char *)a2 + v10;
    sub_1DADADF3C(a1 + v10, &qword_1EB682F68);
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v14 = sub_1DADF5C00();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v14 - 8) + 32))(v11, v12, v14);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v11, v12, *(void *)(*(void *)(v13 - 8) + 64));
    }
    uint64_t v15 = a3[6];
    uint64_t v16 = (void *)(a1 + v15);
    uint64_t v17 = (char *)a2 + v15;
    sub_1DADADF3C(a1 + v15, &qword_1EB682F70);
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v19 = sub_1DADF5D80();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v19 - 8) + 32))(v16, v17, v19);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v16, v17, *(void *)(*(void *)(v18 - 8) + 64));
    }
  }
  uint64_t v20 = a3[7];
  uint64_t v21 = a1 + v20;
  uint64_t v22 = (uint64_t *)((char *)a2 + v20);
  uint64_t v23 = *v22;
  LOBYTE(v22) = *((unsigned char *)v22 + 8);
  uint64_t v24 = *(void *)v21;
  char v25 = *(unsigned char *)(v21 + 8);
  *(void *)uint64_t v21 = v23;
  *(unsigned char *)(v21 + 8) = (_BYTE)v22;
  sub_1DADABA40(v24, v25);
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v26 = a3[8];
    uint64_t v27 = (void *)(a1 + v26);
    uint64_t v28 = (char *)a2 + v26;
    sub_1DADADF3C(a1 + v26, &qword_1EB682F50);
    uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F50);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v30 = sub_1DADF5A60();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v30 - 8) + 32))(v27, v28, v30);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v27, v28, *(void *)(*(void *)(v29 - 8) + 64));
    }
    uint64_t v31 = a3[9];
    uint64_t v32 = (void *)(a1 + v31);
    uint64_t v33 = (char *)a2 + v31;
    sub_1DADADF3C(a1 + v31, &qword_1EB682F60);
    uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F60);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v35 = sub_1DADF60F0();
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v35 - 8) + 32))(v32, v33, v35);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v32, v33, *(void *)(*(void *)(v34 - 8) + 64));
    }
  }
  uint64_t v36 = a3[10];
  uint64_t v37 = a1 + v36;
  uint64_t v38 = (uint64_t)a2 + v36;
  char v39 = *(unsigned char *)(v38 + 16);
  *(_OWORD *)uint64_t v37 = *(_OWORD *)v38;
  *(unsigned char *)(v37 + 16) = v39;
  sub_1DADD7CA0();
  uint64_t v40 = a3[11];
  uint64_t v41 = *(void **)(a1 + v40);
  *(void *)(a1 + v40) = *(uint64_t *)((char *)a2 + v40);

  return a1;
}

uint64_t getEnumTagSinglePayload for BatteryAvocadoArchivableView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DADDA328);
}

uint64_t sub_1DADDA328(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A8);
  if (*(_DWORD *)(*(void *)(v6 - 8) + 84) == a2)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(v6 - 8);
    uint64_t v9 = a3[5];
LABEL_9:
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    return v13(a1 + v9, a2, v7);
  }
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826B0);
  if (*(_DWORD *)(*(void *)(v10 - 8) + 84) == a2)
  {
    uint64_t v7 = v10;
    uint64_t v8 = *(void *)(v10 - 8);
    uint64_t v9 = a3[6];
    goto LABEL_9;
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682698);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v7 = v11;
    uint64_t v8 = *(void *)(v11 - 8);
    uint64_t v9 = a3[8];
    goto LABEL_9;
  }
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C0);
  if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a2)
  {
    uint64_t v7 = v12;
    uint64_t v8 = *(void *)(v12 - 8);
    uint64_t v9 = a3[9];
    goto LABEL_9;
  }
  unint64_t v15 = *(void *)(a1 + a3[11]);
  if (v15 >= 0xFFFFFFFF) {
    LODWORD(v15) = -1;
  }
  return (v15 + 1);
}

uint64_t storeEnumTagSinglePayload for BatteryAvocadoArchivableView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DADDA4F4);
}

uint64_t sub_1DADDA4F4(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A8);
  if (*(_DWORD *)(*(void *)(v8 - 8) + 84) == a3)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v8 - 8);
    uint64_t v11 = a4[5];
  }
  else
  {
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826B0);
    if (*(_DWORD *)(*(void *)(v12 - 8) + 84) == a3)
    {
      uint64_t v9 = v12;
      uint64_t v10 = *(void *)(v12 - 8);
      uint64_t v11 = a4[6];
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682698);
      if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
      {
        uint64_t v9 = v13;
        uint64_t v10 = *(void *)(v13 - 8);
        uint64_t v11 = a4[8];
      }
      else
      {
        uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C0);
        if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
        {
          *(void *)(a1 + a4[11]) = (a2 - 1);
          return result;
        }
        uint64_t v9 = result;
        uint64_t v10 = *(void *)(result - 8);
        uint64_t v11 = a4[9];
      }
    }
  }
  unint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);

  return v15(a1 + v11, a2, a2, v9);
}

void sub_1DADDA6A8()
{
  sub_1DADDA87C(319, (unint64_t *)&qword_1EB6835B8, MEMORY[0x1E4F3C5D0]);
  if (v0 <= 0x3F)
  {
    sub_1DADDA87C(319, (unint64_t *)&unk_1EB683648, MEMORY[0x1E4F3CB98]);
    if (v1 <= 0x3F)
    {
      sub_1DADDA87C(319, &qword_1EB683630, MEMORY[0x1E4F27A78]);
      if (v2 <= 0x3F)
      {
        sub_1DADDA87C(319, &qword_1EB683640, MEMORY[0x1E4F3D5D8]);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_1DADDA87C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_1DADF5C10();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1DADDA8D0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for BatteryAvocadoArchivableView.BatteryAvocadoContentView(uint64_t a1)
{
  sub_1DADB6340(*(id *)a1, *(unsigned char *)(a1 + 8));

  return swift_release();
}

uint64_t initializeWithCopy for BatteryAvocadoArchivableView.BatteryAvocadoContentView(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1DADB63C4(*(id *)a2, v5);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for BatteryAvocadoArchivableView.BatteryAvocadoContentView(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  char v5 = *(unsigned char *)(a2 + 8);
  sub_1DADB63C4(*(id *)a2, v5);
  uint64_t v6 = *(void **)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_1DADB6340(v6, v7);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for BatteryAvocadoArchivableView.BatteryAvocadoContentView(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *((unsigned char *)a2 + 8);
  uint64_t v6 = *(void **)a1;
  char v7 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v4;
  *(unsigned char *)(a1 + 8) = v5;
  sub_1DADB6340(v6, v7);
  uint64_t v8 = a2[3];
  *(void *)(a1 + 16) = a2[2];
  *(void *)(a1 + 24) = v8;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for BatteryAvocadoArchivableView.BatteryAvocadoContentView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BatteryAvocadoArchivableView.BatteryAvocadoContentView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BatteryAvocadoArchivableView.BatteryAvocadoContentView()
{
  return &type metadata for BatteryAvocadoArchivableView.BatteryAvocadoContentView;
}

uint64_t sub_1DADDAC88()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1DADDACA4()
{
  unint64_t result = qword_1EB682628;
  if (!qword_1EB682628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB682628);
  }
  return result;
}

unint64_t sub_1DADDACF8()
{
  unint64_t result = qword_1EB682978;
  if (!qword_1EB682978)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB682980);
    sub_1DADDB5A4(&qword_1EB682618, (void (*)(uint64_t))type metadata accessor for BCUI2x2AvocadoView);
    sub_1DADDB5A4(&qword_1EB682620, (void (*)(uint64_t))type metadata accessor for BCUI2x4AvocadoView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB682978);
  }
  return result;
}

unint64_t sub_1DADDADD4()
{
  unint64_t result = qword_1EB682988;
  if (!qword_1EB682988)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB682990);
    sub_1DADDACA4();
    sub_1DADDB5A4(&qword_1EB682618, (void (*)(uint64_t))type metadata accessor for BCUI2x2AvocadoView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB682988);
  }
  return result;
}

uint64_t sub_1DADDAE80(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DADDAEE8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1DADDAF48(double a1)
{
  uint64_t v2 = sub_1DADF6BD0();

  return sub_1DADDAF90(v2, a1);
}

unint64_t sub_1DADDAF90(uint64_t a1, double a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a1 & ~v4;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v6 = *(void *)(v2 + 48);
    if (*(double *)(v6 + 8 * result) != a2)
    {
      uint64_t v7 = ~v4;
      for (unint64_t result = (result + 1) & v7;
            ((*(void *)(v3 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v7)
      {
        if (*(double *)(v6 + 8 * result) == a2) {
          break;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1DADDB028(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682FC0);
  uint64_t result = sub_1DADF6B50();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v35 = (uint64_t *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v31 = -1 << v9;
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v33 = v3;
    int64_t v34 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v19 = v18 | (v8 << 6);
      }
      else
      {
        int64_t v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v20 >= v34) {
          goto LABEL_33;
        }
        unint64_t v21 = v35[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v34) {
            goto LABEL_33;
          }
          unint64_t v21 = v35[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v34)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v33;
                goto LABEL_40;
              }
              if (v32 >= 64) {
                bzero(v35, 8 * v34);
              }
              else {
                uint64_t *v35 = v31;
              }
              uint64_t v3 = v33;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v35[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v34) {
                  goto LABEL_33;
                }
                unint64_t v21 = v35[v8];
                ++v22;
                if (v21) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v22;
          }
        }
LABEL_30:
        unint64_t v11 = (v21 - 1) & v21;
        unint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      uint64_t v27 = *(void *)(*(void *)(v5 + 48) + 8 * v19);
      uint64_t v28 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v19);
      uint64_t v30 = *v28;
      uint64_t v29 = v28[1];
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      uint64_t result = sub_1DADF6BD0();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v25 = v15 == v24;
          if (v15 == v24) {
            unint64_t v15 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        unint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(void *)(*(void *)(v7 + 48) + 8 * v16) = v27;
      uint64_t v17 = (void *)(*(void *)(v7 + 56) + 16 * v16);
      *uint64_t v17 = v30;
      v17[1] = v29;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

void *sub_1DADDB2E4()
{
  unint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682FC0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1DADF6B40();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *unint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 16 * v15;
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 56) + v18);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    int64_t v22 = (void *)(*(void *)(v4 + 56) + v18);
    *int64_t v22 = v21;
    v22[1] = v20;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_1DADDB494(double *a1)
{
  uint64_t v1 = *((void *)a1 + 2);
  if (!v1) {
    return MEMORY[0x1E4FBC868];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682FC0);
  uint64_t v3 = (void *)sub_1DADF6B60();
  double v4 = a1[4];
  uint64_t v6 = *((void *)a1 + 5);
  double v5 = a1[6];
  unint64_t result = sub_1DADDAF48(v4);
  if (v8)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  int64_t v9 = a1 + 9;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(double *)(v3[6] + 8 * result) = v4;
    uint64_t v10 = (double *)(v3[7] + 16 * result);
    *(void *)uint64_t v10 = v6;
    v10[1] = v5;
    uint64_t v11 = v3[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      break;
    }
    v3[2] = v13;
    if (!--v1) {
      goto LABEL_8;
    }
    unint64_t v14 = v9 + 3;
    double v4 = *(v9 - 2);
    uint64_t v6 = *((void *)v9 - 1);
    double v15 = *v9;
    swift_bridgeObjectRetain();
    unint64_t result = sub_1DADDAF48(v4);
    int64_t v9 = v14;
    double v5 = v15;
    if (v16) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1DADDB5A4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1DADDB5F0()
{
  unint64_t result = qword_1EB6829B8;
  if (!qword_1EB6829B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB6829C0);
    sub_1DADDACF8();
    sub_1DADDADD4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6829B8);
  }
  return result;
}

id sub_1DADDB66C()
{
  id result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BatteryCenterObserver()), sel_init);
  qword_1EB684800 = (uint64_t)result;
  return result;
}

id sub_1DADDB69C()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

uint64_t *sub_1DADDB6D0()
{
  if (qword_1EB684320 != -1) {
    swift_once();
  }
  return &qword_1EB684800;
}

id sub_1DADDB71C()
{
  if (qword_1EB684320 != -1) {
    swift_once();
  }
  unint64_t v0 = (void *)qword_1EB684800;

  return v0;
}

uint64_t sub_1DADDB778()
{
  return sub_1DADF5B10();
}

uint64_t sub_1DADDB7CC()
{
  return swift_retain();
}

char *sub_1DADDB7DC()
{
  uint64_t v1 = sub_1DADF5AD0();
  uint64_t v54 = *(void *)(v1 - 8);
  uint64_t v55 = v1;
  MEMORY[0x1F4188790](v1);
  uint64_t v53 = (char *)&v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = (char *)sub_1DADF6A30();
  uint64_t v3 = *((void *)v52 - 1);
  MEMORY[0x1F4188790](v52);
  double v5 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1DADF6A10();
  MEMORY[0x1F4188790](v6);
  uint64_t v7 = sub_1DADF6760();
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v8 = OBJC_IVAR____TtC15BatteryCenterUI21BatteryCenterObserver_subject;
  uint64_t v9 = MEMORY[0x1E4FBC860];
  uint64_t v59 = MEMORY[0x1E4FBC860];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6835B0);
  swift_allocObject();
  uint64_t v10 = v0;
  *(void *)&v0[v8] = sub_1DADF5B10();
  sub_1DADA73E8(0, (unint64_t *)&qword_1EB683690);
  sub_1DADF6750();
  uint64_t v59 = v9;
  sub_1DADDC3F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB683670);
  sub_1DADAD660(&qword_1EB683678, &qword_1EB683670);
  sub_1DADF6AB0();
  (*(void (**)(char *, void, char *))(v3 + 104))(v5, *MEMORY[0x1E4FBCC68], v52);
  *(void *)&v10[OBJC_IVAR____TtC15BatteryCenterUI21BatteryCenterObserver_dispatchQueue] = sub_1DADF6A50();
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F4F9D0]), sel_init);
  *(void *)&v10[OBJC_IVAR____TtC15BatteryCenterUI21BatteryCenterObserver_batteryController] = v11;

  BOOL v12 = (objc_class *)type metadata accessor for BatteryCenterObserver();
  v58.receiver = v10;
  v58.super_class = v12;
  uint64_t v13 = (char *)objc_msgSendSuper2(&v58, sel_init);
  unint64_t v14 = *(void **)&v13[OBJC_IVAR____TtC15BatteryCenterUI21BatteryCenterObserver_batteryController];
  uint64_t v15 = *(void *)&v13[OBJC_IVAR____TtC15BatteryCenterUI21BatteryCenterObserver_dispatchQueue];
  char v16 = v13;
  objc_msgSend(v14, sel_addBatteryDeviceObserver_queue_, v16, v15);
  id result = (char *)objc_msgSend(v14, sel_connectedDevices);
  if (result)
  {
    uint64_t v18 = result;
    sub_1DADA73E8(0, &qword_1EB683680);
    uint64_t v19 = sub_1DADF6910();

    uint64_t v59 = v19;
    sub_1DADF5AF0();
    swift_bridgeObjectRelease();
    uint64_t v20 = sub_1DADF08BC();
    int64_t v22 = v53;
    uint64_t v21 = v54;
    uint64_t v23 = v55;
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v53, v20, v55);
    unint64_t v24 = v16;
    int64_t v25 = sub_1DADF5AB0();
    int v26 = sub_1DADF6A00();
    if (!os_log_type_enabled(v25, (os_log_type_t)v26))
    {

LABEL_18:
      (*(void (**)(char *, uint64_t))(v21 + 8))(v22, v23);
      return v24;
    }
    int v49 = v26;
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    uint64_t v59 = v48;
    *(_DWORD *)uint64_t v27 = 136315138;
    sub_1DADF5B00();
    unint64_t v28 = v57;
    if (v57 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_1DADF6B30();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v29 = *(void *)((v57 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    os_log_t v51 = v25;
    uint64_t v52 = v24;
    uint64_t v50 = v27;
    if (!v29)
    {
      swift_bridgeObjectRelease();
      unint64_t v31 = MEMORY[0x1E4FBC860];
LABEL_17:
      unint64_t v57 = v31;
      uint64_t v41 = v50;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EB683658);
      sub_1DADAD660((unint64_t *)&unk_1EB683660, &qword_1EB683658);
      uint64_t v42 = sub_1DADF67F0();
      unint64_t v44 = v43;
      swift_bridgeObjectRelease();
      unint64_t v57 = sub_1DADA5DB0(v42, v44, &v59);
      sub_1DADF6A90();
      unint64_t v24 = v52;

      swift_bridgeObjectRelease();
      os_log_t v45 = v51;
      _os_log_impl(&dword_1DAD96000, v51, (os_log_type_t)v49, "BatteryCenterObserver: initial devices - %s", v41, 0xCu);
      uint64_t v46 = v48;
      swift_arrayDestroy();
      MEMORY[0x1E01829D0](v46, -1, -1);
      MEMORY[0x1E01829D0](v41, -1, -1);

      goto LABEL_18;
    }
    unint64_t v56 = MEMORY[0x1E4FBC860];
    id result = (char *)sub_1DADDC474(0, v29 & ~(v29 >> 63), 0);
    if ((v29 & 0x8000000000000000) == 0)
    {
      uint64_t v30 = 0;
      unint64_t v31 = v56;
      do
      {
        if ((v28 & 0xC000000000000001) != 0) {
          id v32 = (id)MEMORY[0x1E0181F60](v30, v28);
        }
        else {
          id v32 = *(id *)(v28 + 8 * v30 + 32);
        }
        uint64_t v33 = v32;
        id v34 = objc_msgSend(v32, sel_description);
        uint64_t v35 = sub_1DADF6840();
        uint64_t v37 = v36;

        unint64_t v56 = v31;
        unint64_t v39 = *(void *)(v31 + 16);
        unint64_t v38 = *(void *)(v31 + 24);
        if (v39 >= v38 >> 1)
        {
          sub_1DADDC474(v38 > 1, v39 + 1, 1);
          unint64_t v31 = v56;
        }
        ++v30;
        *(void *)(v31 + 16) = v39 + 1;
        unint64_t v40 = v31 + 16 * v39;
        *(void *)(v40 + 32) = v35;
        *(void *)(v40 + 40) = v37;
      }
      while (v29 != v30);
      swift_bridgeObjectRelease();
      uint64_t v21 = v54;
      uint64_t v23 = v55;
      int64_t v22 = v53;
      goto LABEL_17;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1DADDBEF8(unint64_t a1)
{
  uint64_t v3 = sub_1DADF5AD0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1DADF08BC();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  swift_bridgeObjectRetain_n();
  uint64_t v8 = sub_1DADF5AB0();
  int v9 = sub_1DADF6A00();
  if (!os_log_type_enabled(v8, (os_log_type_t)v9))
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
LABEL_16:
    unint64_t v41 = a1;
    return sub_1DADF5AF0();
  }
  os_log_t v38 = v8;
  uint64_t v10 = (uint8_t *)swift_slowAlloc();
  uint64_t v35 = swift_slowAlloc();
  unint64_t v41 = v35;
  uint64_t v37 = v10;
  *(_DWORD *)uint64_t v10 = 136315138;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_1DADF6B30();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v11 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t v12 = MEMORY[0x1E4FBC860];
  uint64_t v39 = v1;
  int v36 = v9;
  if (!v11)
  {
LABEL_15:
    unint64_t v40 = v12;
    int v26 = v37;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB683658);
    sub_1DADAD660((unint64_t *)&unk_1EB683660, &qword_1EB683658);
    uint64_t v27 = sub_1DADF67F0();
    unint64_t v29 = v28;
    swift_bridgeObjectRelease();
    unint64_t v40 = sub_1DADA5DB0(v27, v29, (uint64_t *)&v41);
    sub_1DADF6A90();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    os_log_t v30 = v38;
    _os_log_impl(&dword_1DAD96000, v38, (os_log_type_t)v36, "BatteryCenterObserver: devices changed - %s", v26, 0xCu);
    uint64_t v31 = v35;
    swift_arrayDestroy();
    MEMORY[0x1E01829D0](v31, -1, -1);
    MEMORY[0x1E01829D0](v26, -1, -1);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    goto LABEL_16;
  }
  unint64_t v40 = MEMORY[0x1E4FBC860];
  uint64_t result = sub_1DADDC474(0, v11 & ~(v11 >> 63), 0);
  if ((v11 & 0x8000000000000000) == 0)
  {
    id v32 = v6;
    uint64_t v33 = v4;
    uint64_t v34 = v3;
    uint64_t v14 = 0;
    unint64_t v12 = v40;
    unint64_t v15 = a1 & 0xC000000000000001;
    unint64_t v16 = a1;
    do
    {
      if (v15) {
        id v17 = (id)MEMORY[0x1E0181F60](v14, a1);
      }
      else {
        id v17 = *(id *)(a1 + 8 * v14 + 32);
      }
      uint64_t v18 = v17;
      id v19 = objc_msgSend(v17, sel_description, v32, v33, v34);
      uint64_t v20 = sub_1DADF6840();
      uint64_t v22 = v21;

      unint64_t v40 = v12;
      unint64_t v24 = *(void *)(v12 + 16);
      unint64_t v23 = *(void *)(v12 + 24);
      if (v24 >= v23 >> 1)
      {
        sub_1DADDC474(v23 > 1, v24 + 1, 1);
        unint64_t v12 = v40;
      }
      ++v14;
      *(void *)(v12 + 16) = v24 + 1;
      unint64_t v25 = v12 + 16 * v24;
      *(void *)(v25 + 32) = v20;
      *(void *)(v25 + 40) = v22;
      a1 = v16;
    }
    while (v11 != v14);
    uint64_t v4 = v33;
    uint64_t v3 = v34;
    uint64_t v6 = v32;
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

id sub_1DADDC368()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BatteryCenterObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1DADDC3F8()
{
  unint64_t result = qword_1EB683688;
  if (!qword_1EB683688)
  {
    sub_1DADF6A10();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB683688);
  }
  return result;
}

uint64_t type metadata accessor for BatteryCenterObserver()
{
  return self;
}

uint64_t sub_1DADDC474(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1DADDC494(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1DADDC494(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB683698);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1DADF6B70();
  __break(1u);
  return result;
}

uint64_t sub_1DADDC600@<X0>(uint64_t *a1@<X8>)
{
  return sub_1DADA860C(&qword_1EB682F58, a1);
}

double sub_1DADDC614@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for BCUIChargeRingView(0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B78);
  MEMORY[0x1E0181A90](v11, v2);
  uint64_t v3 = v11[1];
  double result = *(double *)&v11[2];
  uint64_t v5 = v11[3];
  char v6 = v12;
  char v7 = v13;
  char v8 = v14;
  uint64_t v9 = v15;
  uint64_t v10 = v16;
  *(void *)a1 = v11[0];
  *(void *)(a1 + 8) = v3;
  *(double *)(a1 + 16) = result;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 33) = v7;
  *(unsigned char *)(a1 + 34) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  return result;
}

uint64_t type metadata accessor for BCUIChargeRingView(uint64_t a1)
{
  return sub_1DADAD54C(a1, qword_1EB683BC0);
}

uint64_t sub_1DADDC6FC()
{
  return sub_1DADF6620();
}

void (*sub_1DADDC7A8(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x108uLL);
  *a1 = v3;
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for BCUIChargeRingView(0) + 20));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  v3[23] = *v4;
  v3[24] = v6;
  uint64_t v7 = v4[2];
  uint64_t v8 = v4[3];
  v3[25] = v7;
  v3[26] = v8;
  uint64_t v9 = v4[4];
  v3[27] = v9;
  uint64_t v10 = v4[5];
  char v11 = *((unsigned char *)v4 + 48);
  *((unsigned char *)v3 + 256) = v11;
  char v12 = *((unsigned char *)v4 + 49);
  *((unsigned char *)v3 + 257) = v12;
  char v13 = *((unsigned char *)v4 + 50);
  *((unsigned char *)v3 + 258) = v13;
  uint64_t v14 = v4[7];
  uint64_t v15 = v4[8];
  v3[28] = v10;
  v3[29] = v14;
  v3[30] = v15;
  *uint64_t v3 = v5;
  v3[1] = v6;
  v3[2] = v7;
  v3[3] = v8;
  v3[4] = v9;
  v3[5] = v10;
  *((unsigned char *)v3 + 48) = v11;
  *((unsigned char *)v3 + 49) = v12;
  *((unsigned char *)v3 + 50) = v13;
  v3[7] = v14;
  v3[8] = v15;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v3[31] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B78);
  MEMORY[0x1E0181A90]();
  return sub_1DADDC8C0;
}

double sub_1DADDC8C4@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for BCUIChargeRingView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B78);
  sub_1DADF6640();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(unsigned char *)(a1 + 48) = v8;
  *(unsigned char *)(a1 + 49) = v9;
  *(unsigned char *)(a1 + 50) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v12;
  return result;
}

uint64_t sub_1DADDC994()
{
  return sub_1DADDCC04(MEMORY[0x1E4F3EE08]);
}

uint64_t sub_1DADDC9AC(uint64_t a1)
{
  uint64_t v2 = sub_1DADF5D80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BCUIChargeRingView(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  sub_1DADF6620();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1DADDCAB8(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = sub_1DADF5D80();
  *uint64_t v3 = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[1] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[2] = malloc(v6);
  v3[3] = malloc(v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  v3[4] = v7;
  char v8 = malloc(*(void *)(*(void *)(v7 - 8) + 64));
  v3[5] = v8;
  uint64_t v9 = type metadata accessor for BCUIChargeRingView(0);
  sub_1DADAE0AC(v1 + *(int *)(v9 + 24), (uint64_t)v8, &qword_1EB682B88);
  MEMORY[0x1E0181A90](v7);
  return sub_1DADCBD78;
}

uint64_t sub_1DADDCBEC()
{
  return sub_1DADDCC04(MEMORY[0x1E4F3EE10]);
}

uint64_t sub_1DADDCC04(uint64_t (*a1)(uint64_t))
{
  type metadata accessor for BCUIChargeRingView(0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  return a1(v2);
}

uint64_t sub_1DADDCC58()
{
  type metadata accessor for BCUIChargeRingView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  return v1;
}

uint64_t sub_1DADDCCB8()
{
  return sub_1DADF65F0();
}

uint64_t (*sub_1DADDCD20(void *a1))()
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = (char *)(v1 + *(int *)(type metadata accessor for BCUIChargeRingView(0) + 28));
  char v5 = *v4;
  v3[34] = *v4;
  uint64_t v6 = *((void *)v4 + 1);
  *uint64_t v3 = v5;
  *((void *)v3 + 1) = v6;
  *((void *)v3 + 2) = v6;
  swift_retain();
  *((void *)v3 + 3) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  return sub_1DADA8250;
}

uint64_t sub_1DADDCDBC()
{
  type metadata accessor for BCUIChargeRingView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF6600();
  return v1;
}

uint64_t sub_1DADDCE20@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_1DADF66C0();
  a1[1] = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682730);
  return sub_1DADDCE64(v1, (uint64_t)a1 + *(int *)(v4 + 44));
}

uint64_t sub_1DADDCE64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v175 = a1;
  uint64_t v180 = a2;
  uint64_t v3 = type metadata accessor for BCUIBoltView(0);
  MEMORY[0x1F4188790](v3 - 8);
  v179 = (uint64_t *)((char *)&v148 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826B8);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v178 = (uint64_t *)((char *)&v148 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v181 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1F4188790](v181);
  uint64_t v176 = (char *)&v148 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for BCUIRingAndGlyphView(0);
  MEMORY[0x1F4188790](v8 - 8);
  uint64_t v177 = (uint64_t)&v148 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v174 = type metadata accessor for BCUIChargeRingView(0);
  char v10 = (long long *)(a1 + *(int *)(v174 + 20));
  uint64_t v11 = *((void *)v10 + 2);
  uint64_t v12 = *((void *)v10 + 3);
  uint64_t v13 = *((void *)v10 + 4);
  uint64_t v14 = *((void *)v10 + 5);
  char v15 = *((unsigned char *)v10 + 48);
  char v16 = *((unsigned char *)v10 + 49);
  char v17 = *((unsigned char *)v10 + 50);
  uint64_t v18 = *((void *)v10 + 7);
  uint64_t v19 = *((void *)v10 + 8);
  long long v203 = *v10;
  uint64_t v204 = v11;
  uint64_t v205 = v12;
  uint64_t v206 = v13;
  uint64_t v207 = v14;
  char v208 = v15;
  char v209 = v16;
  char v210 = v17;
  uint64_t v211 = v18;
  uint64_t v212 = v19;
  uint64_t v182 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B78);
  sub_1DADF6640();
  uint64_t v20 = v213;
  uint64_t v21 = v214;
  uint64_t v172 = v214;
  uint64_t v173 = v213;
  uint64_t v22 = v216;
  uint64_t v171 = v215;
  uint64_t v23 = v217;
  uint64_t v24 = v218;
  LODWORD(v170) = v219;
  LODWORD(v169) = v220;
  LODWORD(v168) = v221;
  uint64_t v26 = v222;
  uint64_t v25 = v223;
  swift_getKeyPath();
  uint64_t v213 = v20;
  uint64_t v214 = v21;
  uint64_t v215 = v171;
  uint64_t v216 = v22;
  uint64_t v217 = v23;
  uint64_t v218 = v24;
  unsigned __int8 v219 = v170;
  unsigned __int8 v220 = v169;
  unsigned __int8 v221 = v168;
  uint64_t v222 = v26;
  uint64_t v223 = v25;
  sub_1DADF6630();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v172 = v200;
  uint64_t v173 = v199;
  uint64_t v170 = v202;
  uint64_t v171 = v201;
  uint64_t v27 = *((void *)v10 + 2);
  uint64_t v28 = *((void *)v10 + 3);
  uint64_t v29 = *((void *)v10 + 4);
  uint64_t v30 = *((void *)v10 + 5);
  char v31 = *((unsigned char *)v10 + 48);
  char v32 = *((unsigned char *)v10 + 49);
  char v33 = *((unsigned char *)v10 + 50);
  uint64_t v34 = *((void *)v10 + 7);
  uint64_t v35 = *((void *)v10 + 8);
  long long v203 = *v10;
  uint64_t v204 = v27;
  uint64_t v205 = v28;
  uint64_t v206 = v29;
  uint64_t v207 = v30;
  char v208 = v31;
  char v209 = v32;
  char v210 = v33;
  uint64_t v211 = v34;
  uint64_t v212 = v35;
  sub_1DADF6640();
  uint64_t v36 = v213;
  uint64_t v37 = v214;
  uint64_t v168 = v214;
  uint64_t v169 = v213;
  uint64_t v38 = v216;
  uint64_t v167 = v215;
  uint64_t v39 = v217;
  uint64_t v40 = v218;
  LODWORD(v166) = v219;
  LOBYTE(v21) = v220;
  LODWORD(v165) = v221;
  uint64_t v41 = v223;
  uint64_t v164 = v222;
  swift_getKeyPath();
  uint64_t v213 = v36;
  uint64_t v214 = v37;
  uint64_t v215 = v167;
  uint64_t v216 = v38;
  uint64_t v217 = v39;
  uint64_t v218 = v40;
  unsigned __int8 v219 = v166;
  unsigned __int8 v220 = v21;
  unsigned __int8 v221 = v165;
  uint64_t v222 = v164;
  uint64_t v223 = v41;
  sub_1DADF6630();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v168 = v197;
  uint64_t v169 = v196;
  double v42 = v198;
  uint64_t v43 = *((void *)v10 + 2);
  uint64_t v44 = *((void *)v10 + 3);
  uint64_t v45 = *((void *)v10 + 4);
  uint64_t v46 = *((void *)v10 + 5);
  char v47 = *((unsigned char *)v10 + 48);
  char v48 = *((unsigned char *)v10 + 49);
  char v49 = *((unsigned char *)v10 + 50);
  uint64_t v50 = *((void *)v10 + 7);
  uint64_t v51 = *((void *)v10 + 8);
  long long v203 = *v10;
  uint64_t v204 = v43;
  uint64_t v205 = v44;
  uint64_t v206 = v45;
  uint64_t v207 = v46;
  char v208 = v47;
  char v209 = v48;
  char v210 = v49;
  uint64_t v211 = v50;
  uint64_t v212 = v51;
  sub_1DADF6640();
  uint64_t v52 = v213;
  uint64_t v53 = v214;
  uint64_t v166 = v214;
  uint64_t v167 = v213;
  uint64_t v54 = v216;
  uint64_t v165 = v215;
  uint64_t v55 = v217;
  uint64_t v56 = v218;
  LODWORD(v164) = v219;
  LOBYTE(v21) = v220;
  LODWORD(v163) = v221;
  uint64_t v57 = v223;
  uint64_t v162 = v222;
  swift_getKeyPath();
  uint64_t v213 = v52;
  uint64_t v214 = v53;
  uint64_t v215 = v165;
  uint64_t v216 = v54;
  uint64_t v217 = v55;
  uint64_t v218 = v56;
  unsigned __int8 v219 = v164;
  unsigned __int8 v220 = v21;
  unsigned __int8 v221 = v163;
  uint64_t v222 = v162;
  uint64_t v223 = v57;
  sub_1DADF6630();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v166 = v193;
  uint64_t v167 = v192;
  uint64_t v164 = v195;
  uint64_t v165 = v194;
  uint64_t v58 = *((void *)v10 + 2);
  uint64_t v59 = *((void *)v10 + 3);
  uint64_t v60 = *((void *)v10 + 4);
  uint64_t v61 = *((void *)v10 + 5);
  char v62 = *((unsigned char *)v10 + 48);
  char v63 = *((unsigned char *)v10 + 49);
  char v64 = *((unsigned char *)v10 + 50);
  uint64_t v65 = *((void *)v10 + 7);
  uint64_t v66 = *((void *)v10 + 8);
  long long v203 = *v10;
  uint64_t v204 = v58;
  uint64_t v205 = v59;
  uint64_t v206 = v60;
  uint64_t v207 = v61;
  char v208 = v62;
  char v209 = v63;
  char v210 = v64;
  uint64_t v211 = v65;
  uint64_t v212 = v66;
  sub_1DADF6640();
  uint64_t v67 = v213;
  uint64_t v68 = v214;
  uint64_t v162 = v214;
  uint64_t v163 = v213;
  uint64_t v69 = v216;
  uint64_t v161 = v215;
  uint64_t v70 = v217;
  uint64_t v71 = v218;
  LODWORD(v160) = v219;
  LOBYTE(v21) = v220;
  LODWORD(v159) = v221;
  uint64_t v72 = v223;
  uint64_t v158 = v222;
  swift_getKeyPath();
  uint64_t v213 = v67;
  uint64_t v214 = v68;
  uint64_t v215 = v161;
  uint64_t v216 = v69;
  uint64_t v217 = v70;
  uint64_t v218 = v71;
  unsigned __int8 v219 = v160;
  unsigned __int8 v220 = v21;
  unsigned __int8 v221 = v159;
  uint64_t v222 = v158;
  uint64_t v223 = v72;
  sub_1DADF6630();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v162 = v190;
  uint64_t v163 = v189;
  uint64_t v161 = v191;
  uint64_t v73 = *((void *)v10 + 2);
  uint64_t v74 = *((void *)v10 + 3);
  uint64_t v75 = *((void *)v10 + 4);
  uint64_t v76 = *((void *)v10 + 5);
  char v77 = *((unsigned char *)v10 + 48);
  char v78 = *((unsigned char *)v10 + 49);
  char v79 = *((unsigned char *)v10 + 50);
  uint64_t v80 = *((void *)v10 + 7);
  uint64_t v81 = *((void *)v10 + 8);
  long long v203 = *v10;
  uint64_t v204 = v73;
  uint64_t v205 = v74;
  uint64_t v206 = v75;
  uint64_t v207 = v76;
  char v208 = v77;
  char v209 = v78;
  char v210 = v79;
  uint64_t v211 = v80;
  uint64_t v212 = v81;
  sub_1DADF6640();
  uint64_t v82 = v213;
  uint64_t v83 = v214;
  uint64_t v159 = v214;
  uint64_t v160 = v213;
  uint64_t v84 = v216;
  uint64_t v158 = v215;
  uint64_t v85 = v217;
  uint64_t v86 = v218;
  LODWORD(v157) = v219;
  LOBYTE(v21) = v220;
  LODWORD(v156) = v221;
  uint64_t v87 = v223;
  uint64_t v155 = v222;
  swift_getKeyPath();
  uint64_t v213 = v82;
  uint64_t v214 = v83;
  uint64_t v215 = v158;
  uint64_t v216 = v84;
  uint64_t v217 = v85;
  uint64_t v218 = v86;
  unsigned __int8 v219 = v157;
  unsigned __int8 v220 = v21;
  unsigned __int8 v221 = v156;
  uint64_t v222 = v155;
  uint64_t v223 = v87;
  sub_1DADF6630();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v159 = v187;
  uint64_t v160 = v186;
  LODWORD(v158) = v188;
  uint64_t v88 = *((void *)v10 + 2);
  uint64_t v89 = *((void *)v10 + 3);
  uint64_t v90 = *((void *)v10 + 4);
  uint64_t v91 = *((void *)v10 + 5);
  char v92 = *((unsigned char *)v10 + 48);
  char v93 = *((unsigned char *)v10 + 49);
  char v94 = *((unsigned char *)v10 + 50);
  uint64_t v95 = *((void *)v10 + 7);
  uint64_t v96 = *((void *)v10 + 8);
  long long v203 = *v10;
  uint64_t v204 = v88;
  uint64_t v205 = v89;
  uint64_t v206 = v90;
  uint64_t v207 = v91;
  char v208 = v92;
  char v209 = v93;
  char v210 = v94;
  uint64_t v211 = v95;
  uint64_t v212 = v96;
  sub_1DADF6640();
  uint64_t v97 = v213;
  uint64_t v98 = v214;
  uint64_t v156 = v214;
  uint64_t v157 = v213;
  uint64_t v99 = v216;
  uint64_t v155 = v215;
  uint64_t v100 = v217;
  uint64_t v101 = v218;
  LODWORD(v154) = v219;
  LOBYTE(v21) = v220;
  LODWORD(v153) = v221;
  uint64_t v102 = v223;
  uint64_t v152 = v222;
  swift_getKeyPath();
  uint64_t v213 = v97;
  uint64_t v214 = v98;
  uint64_t v215 = v155;
  uint64_t v216 = v99;
  uint64_t v217 = v100;
  uint64_t v218 = v101;
  unsigned __int8 v219 = v154;
  unsigned __int8 v220 = v21;
  unsigned __int8 v221 = v153;
  uint64_t v222 = v152;
  uint64_t v223 = v102;
  sub_1DADF6630();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v156 = v184;
  uint64_t v157 = v183;
  LODWORD(v155) = v185;
  uint64_t v103 = *((void *)v10 + 2);
  uint64_t v104 = *((void *)v10 + 3);
  uint64_t v105 = *((void *)v10 + 4);
  uint64_t v106 = *((void *)v10 + 5);
  char v107 = *((unsigned char *)v10 + 48);
  char v108 = *((unsigned char *)v10 + 49);
  char v109 = *((unsigned char *)v10 + 50);
  uint64_t v110 = *((void *)v10 + 7);
  uint64_t v111 = *((void *)v10 + 8);
  long long v203 = *v10;
  uint64_t v204 = v103;
  uint64_t v205 = v104;
  uint64_t v206 = v105;
  uint64_t v207 = v106;
  char v208 = v107;
  char v209 = v108;
  char v210 = v109;
  uint64_t v211 = v110;
  uint64_t v212 = v111;
  sub_1DADF6640();
  uint64_t v112 = v213;
  uint64_t v113 = v214;
  uint64_t v153 = v214;
  uint64_t v154 = v213;
  uint64_t v114 = v216;
  uint64_t v152 = v215;
  uint64_t v115 = v217;
  uint64_t v116 = v218;
  LOBYTE(v21) = v220;
  int v150 = v221;
  int v151 = v219;
  uint64_t v117 = v223;
  uint64_t v149 = v222;
  swift_getKeyPath();
  uint64_t v213 = v112;
  uint64_t v214 = v113;
  uint64_t v215 = v152;
  uint64_t v216 = v114;
  uint64_t v217 = v115;
  uint64_t v218 = v116;
  unsigned __int8 v219 = v151;
  unsigned __int8 v220 = v21;
  unsigned __int8 v221 = v150;
  uint64_t v222 = v149;
  uint64_t v223 = v117;
  sub_1DADF6630();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  long long v118 = v203;
  LOBYTE(v21) = v204;
  uint64_t v120 = v174;
  uint64_t v119 = v175;
  uint64_t v154 = v175 + *(int *)(v174 + 24);
  uint64_t v121 = (uint64_t)v176;
  sub_1DADF6640();
  uint64_t v122 = (unsigned __int8 *)(v119 + *(int *)(v120 + 28));
  LODWORD(v175) = *v122;
  uint64_t v174 = *((void *)v122 + 1);
  LOBYTE(v213) = v175;
  uint64_t v214 = v174;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  uint64_t v123 = v178;
  sub_1DADCAC34(v178);
  double v124 = sub_1DADCA924();
  char v147 = v21;
  *((void *)&v146 + 1) = v162;
  *(void *)&long long v146 = v163;
  *((void *)&v145 + 1) = v165;
  *(void *)&long long v145 = v166;
  uint64_t v125 = v177;
  sub_1DADCF5DC((uint64_t)v123, v173, v172, v171, v170, v169, v168, v167, v177, v42, v124, v145, v164, v146, v161, v160, v159, v158, v157,
    v156,
    v155,
    v118,
    *((uint64_t *)&v118 + 1),
    v147,
    v121);
  uint64_t v126 = *((void *)v10 + 1);
  uint64_t v127 = *((void *)v10 + 2);
  uint64_t v128 = *((void *)v10 + 3);
  uint64_t v129 = *((void *)v10 + 4);
  uint64_t v130 = *((void *)v10 + 5);
  char v131 = *((unsigned char *)v10 + 48);
  char v132 = *((unsigned char *)v10 + 49);
  char v133 = *((unsigned char *)v10 + 50);
  uint64_t v134 = *((void *)v10 + 7);
  uint64_t v135 = *((void *)v10 + 8);
  *(void *)&long long v203 = *(void *)v10;
  *((void *)&v203 + 1) = v126;
  uint64_t v204 = v127;
  uint64_t v205 = v128;
  uint64_t v206 = v129;
  uint64_t v207 = v130;
  char v208 = v131;
  char v209 = v132;
  char v210 = v133;
  uint64_t v211 = v134;
  uint64_t v212 = v135;
  sub_1DADF6640();
  sub_1DADF6640();
  LOBYTE(v203) = v175;
  *((void *)&v203 + 1) = v174;
  sub_1DADF65E0();
  sub_1DADF3C04();
  sub_1DADF3C20();
  uint64_t v136 = v179;
  sub_1DADDDA6C((uint64_t)&v213, v121, v179);
  uint64_t v137 = sub_1DADF66D0();
  uint64_t v139 = v138;
  uint64_t v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682778);
  uint64_t v141 = v180;
  uint64_t v142 = v180 + *(int *)(v140 + 36);
  sub_1DADE3688((uint64_t)v136, v142, type metadata accessor for BCUIBoltView);
  uint64_t v143 = (uint64_t *)(v142 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682938) + 36));
  uint64_t *v143 = v137;
  v143[1] = v139;
  sub_1DADE3688(v125, v141, type metadata accessor for BCUIRingAndGlyphView);
  sub_1DADE37CC((uint64_t)v136, type metadata accessor for BCUIBoltView);
  return sub_1DADE37CC(v125, type metadata accessor for BCUIRingAndGlyphView);
}

uint64_t sub_1DADDDA6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  swift_storeEnumTagMultiPayload();
  uint64_t v6 = (int *)type metadata accessor for BCUIBoltView(0);
  uint64_t v7 = (char *)a3 + v6[5];
  *(void *)uint64_t v7 = swift_getKeyPath();
  v7[8] = 0;
  uint64_t v8 = (uint64_t *)((char *)a3 + v6[6]);
  *uint64_t v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  swift_storeEnumTagMultiPayload();
  uint64_t v9 = (char *)a3 + v6[7];
  long long v10 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v9 + 2) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v9 + 3) = v10;
  *((void *)v9 + 8) = *(void *)(a1 + 64);
  long long v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v9 = *(_OWORD *)a1;
  *((_OWORD *)v9 + 1) = v11;
  sub_1DADADF98(a2, (uint64_t)a3 + v6[8], &qword_1EB682B88);
  uint64_t v12 = (char *)a3 + v6[9];
  sub_1DADF65D0();
  *uint64_t v12 = v15;
  *((void *)v12 + 1) = v16;
  uint64_t v13 = (uint64_t *)((char *)a3 + v6[10]);
  sub_1DADF65D0();
  *uint64_t v13 = v15;
  v13[1] = v16;
  sub_1DADB2BCC();
  sub_1DADF5C60();
  return sub_1DADF5C60();
}

uint64_t sub_1DADDDC28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  swift_storeEnumTagMultiPayload();
  uint64_t v6 = (int *)type metadata accessor for BCUIChargeRingView(0);
  uint64_t v7 = (char *)a3 + v6[5];
  long long v8 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v7 + 2) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v7 + 3) = v8;
  *((void *)v7 + 8) = *(void *)(a1 + 64);
  long long v9 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v7 = *(_OWORD *)a1;
  *((_OWORD *)v7 + 1) = v9;
  sub_1DADADF98(a2, (uint64_t)a3 + v6[6], &qword_1EB682B88);
  long long v10 = (char *)a3 + v6[7];
  uint64_t result = sub_1DADF65D0();
  *long long v10 = v12;
  *((void *)v10 + 1) = v13;
  return result;
}

uint64_t sub_1DADDDD0C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  return v1;
}

uint64_t sub_1DADDDD5C()
{
  return sub_1DADF65F0();
}

uint64_t (*sub_1DADDDDB0(void *a1))()
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  char v4 = *v1;
  v3[34] = *v1;
  uint64_t v5 = *((void *)v1 + 1);
  *uint64_t v3 = v4;
  *((void *)v3 + 1) = v5;
  *((void *)v3 + 2) = v5;
  swift_retain();
  *((void *)v3 + 3) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  return sub_1DADA8250;
}

uint64_t sub_1DADDDE3C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF6600();
  return v1;
}

uint64_t sub_1DADDDE90()
{
  return sub_1DADDE100(MEMORY[0x1E4F3EE08]);
}

uint64_t sub_1DADDDEA8(uint64_t a1)
{
  uint64_t v2 = sub_1DADF5D80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BCUIChargeRingView.maskChargeRingView(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  sub_1DADF6620();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1DADDDFB4(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = sub_1DADF5D80();
  *uint64_t v3 = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[1] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[2] = malloc(v6);
  v3[3] = malloc(v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  v3[4] = v7;
  long long v8 = malloc(*(void *)(*(void *)(v7 - 8) + 64));
  v3[5] = v8;
  uint64_t v9 = type metadata accessor for BCUIChargeRingView.maskChargeRingView(0);
  sub_1DADAE0AC(v1 + *(int *)(v9 + 20), (uint64_t)v8, &qword_1EB682B88);
  MEMORY[0x1E0181A90](v7);
  return sub_1DADCBD78;
}

uint64_t sub_1DADDE0E8()
{
  return sub_1DADDE100(MEMORY[0x1E4F3EE10]);
}

uint64_t sub_1DADDE100(uint64_t (*a1)(uint64_t))
{
  type metadata accessor for BCUIChargeRingView.maskChargeRingView(0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  return a1(v2);
}

uint64_t sub_1DADDE154@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A8);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (uint64_t *)&v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1F4188790](v6);
  long long v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = *(void *)(v1 + 8);
  v11[8] = *(unsigned char *)v1;
  uint64_t v12 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  type metadata accessor for BCUIChargeRingView.maskChargeRingView(0);
  sub_1DADF6640();
  sub_1DADCFE70(v5);
  sub_1DADC685C();
  return sub_1DADD0A48((uint64_t)v5, (uint64_t)v8, a1);
}

uint64_t sub_1DADDE298@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  sub_1DADF65D0();
  *(unsigned char *)a2 = v6;
  *(void *)(a2 + 8) = v7;
  uint64_t v4 = type metadata accessor for BCUIChargeRingView.maskChargeRingView(0);
  return sub_1DADADF98(a1, a2 + *(int *)(v4 + 20), &qword_1EB682B88);
}

uint64_t sub_1DADDE30C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A8);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (uint64_t *)&v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1F4188790](v6);
  long long v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = *(void *)(v1 + 8);
  v11[8] = *(unsigned char *)v1;
  uint64_t v12 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  sub_1DADF6640();
  sub_1DADCFE70(v5);
  sub_1DADC685C();
  return sub_1DADD0A48((uint64_t)v5, (uint64_t)v8, a1);
}

uint64_t sub_1DADDE44C@<X0>(uint64_t *a1@<X8>)
{
  return sub_1DADA860C(&qword_1EB682F68, a1);
}

uint64_t sub_1DADDE460(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  MEMORY[0x1F4188790]();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t type metadata accessor for BCUIBoltView(uint64_t a1)
{
  return sub_1DADAD54C(a1, qword_1EB683880);
}

uint64_t sub_1DADDE550()
{
  return swift_getKeyPath();
}

double sub_1DADDE574@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for BCUIBoltView(0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B78);
  MEMORY[0x1E0181A90](v11, v2);
  uint64_t v3 = v11[1];
  double result = *(double *)&v11[2];
  uint64_t v5 = v11[3];
  char v6 = v12;
  char v7 = v13;
  char v8 = v14;
  uint64_t v9 = v15;
  uint64_t v10 = v16;
  *(void *)a1 = v11[0];
  *(void *)(a1 + 8) = v3;
  *(double *)(a1 + 16) = result;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  *(unsigned char *)(a1 + 33) = v7;
  *(unsigned char *)(a1 + 34) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  return result;
}

uint64_t sub_1DADDE63C()
{
  return sub_1DADF6620();
}

void (*sub_1DADDE6E8(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x108uLL);
  *a1 = v3;
  uint64_t v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for BCUIBoltView(0) + 28));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];
  v3[23] = *v4;
  v3[24] = v6;
  uint64_t v7 = v4[2];
  uint64_t v8 = v4[3];
  v3[25] = v7;
  v3[26] = v8;
  uint64_t v9 = v4[4];
  v3[27] = v9;
  uint64_t v10 = v4[5];
  char v11 = *((unsigned char *)v4 + 48);
  *((unsigned char *)v3 + 256) = v11;
  char v12 = *((unsigned char *)v4 + 49);
  *((unsigned char *)v3 + 257) = v12;
  char v13 = *((unsigned char *)v4 + 50);
  *((unsigned char *)v3 + 258) = v13;
  uint64_t v14 = v4[7];
  uint64_t v15 = v4[8];
  v3[28] = v10;
  v3[29] = v14;
  v3[30] = v15;
  *uint64_t v3 = v5;
  v3[1] = v6;
  v3[2] = v7;
  v3[3] = v8;
  v3[4] = v9;
  v3[5] = v10;
  *((unsigned char *)v3 + 48) = v11;
  *((unsigned char *)v3 + 49) = v12;
  *((unsigned char *)v3 + 50) = v13;
  v3[7] = v14;
  v3[8] = v15;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  v3[31] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B78);
  MEMORY[0x1E0181A90]();
  return sub_1DADDC8C0;
}

double sub_1DADDE800@<D0>(uint64_t a1@<X8>)
{
  type metadata accessor for BCUIBoltView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B78);
  sub_1DADF6640();
  double result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(unsigned char *)(a1 + 48) = v8;
  *(unsigned char *)(a1 + 49) = v9;
  *(unsigned char *)(a1 + 50) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v12;
  return result;
}

uint64_t sub_1DADDE8D0()
{
  return sub_1DADDEB40(MEMORY[0x1E4F3EE08]);
}

uint64_t sub_1DADDE8E8(uint64_t a1)
{
  uint64_t v2 = sub_1DADF5D80();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BCUIBoltView(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  sub_1DADF6620();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1DADDE9F4(void *a1))(uint64_t, char)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = sub_1DADF5D80();
  *uint64_t v3 = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[1] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[2] = malloc(v6);
  v3[3] = malloc(v6);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  v3[4] = v7;
  char v8 = malloc(*(void *)(*(void *)(v7 - 8) + 64));
  v3[5] = v8;
  uint64_t v9 = type metadata accessor for BCUIBoltView(0);
  sub_1DADAE0AC(v1 + *(int *)(v9 + 32), (uint64_t)v8, &qword_1EB682B88);
  MEMORY[0x1E0181A90](v7);
  return sub_1DADCBD78;
}

uint64_t sub_1DADDEB28()
{
  return sub_1DADDEB40(MEMORY[0x1E4F3EE10]);
}

uint64_t sub_1DADDEB40(uint64_t (*a1)(uint64_t))
{
  type metadata accessor for BCUIBoltView(0);
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  return a1(v2);
}

uint64_t sub_1DADDEB94()
{
  type metadata accessor for BCUIBoltView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  return v1;
}

uint64_t sub_1DADDEBF4()
{
  return sub_1DADF65F0();
}

uint64_t (*sub_1DADDEC5C(void *a1))()
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = (char *)(v1 + *(int *)(type metadata accessor for BCUIBoltView(0) + 36));
  char v5 = *v4;
  v3[34] = *v4;
  uint64_t v6 = *((void *)v4 + 1);
  *uint64_t v3 = v5;
  *((void *)v3 + 1) = v6;
  *((void *)v3 + 2) = v6;
  swift_retain();
  *((void *)v3 + 3) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  return sub_1DADA8250;
}

uint64_t sub_1DADDECF8()
{
  type metadata accessor for BCUIBoltView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF6600();
  return v1;
}

double sub_1DADDED5C()
{
  type metadata accessor for BCUIBoltView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  sub_1DADF5C70();
  return v1;
}

uint64_t type metadata accessor for BCUIChargeRingView.maskChargeRingView(uint64_t a1)
{
  return sub_1DADAD54C(a1, qword_1EB683B30);
}

double sub_1DADDEDC8()
{
  type metadata accessor for BCUIBoltView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  sub_1DADF5C70();
  return v1;
}

uint64_t sub_1DADDEE14()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1DADF6790();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x1F4188790](v2);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v4);
  char v8 = (char *)&v32 - v7;
  uint64_t v9 = type metadata accessor for BCUIBoltView(0);
  sub_1DADBFCDC((uint64_t)v8);
  sub_1DADF6780();
  sub_1DADE3784(&qword_1EB682BC0, MEMORY[0x1E4F46AE8]);
  char v10 = sub_1DADF6800();
  uint64_t v11 = *(void (**)(char *, uint64_t))(v3 + 8);
  v11(v6, v2);
  v11(v8, v2);
  if (v10)
  {
    uint64_t v12 = *sub_1DADF3990();
    swift_retain();
  }
  else
  {
    id v13 = objc_msgSend(self, sel_labelColor);
    uint64_t v12 = MEMORY[0x1E01818F0](v13);
    uint64_t v14 = (uint64_t *)(v1 + *(int *)(v9 + 28));
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = v14[2];
    uint64_t v18 = v14[3];
    uint64_t v19 = v14[4];
    uint64_t v20 = v14[5];
    char v21 = *((unsigned char *)v14 + 48);
    int v22 = *((unsigned __int8 *)v14 + 49);
    int v23 = *((unsigned __int8 *)v14 + 50);
    uint64_t v25 = v14[7];
    uint64_t v24 = v14[8];
    uint64_t v36 = v15;
    uint64_t v37 = v16;
    uint64_t v38 = v17;
    uint64_t v39 = v18;
    uint64_t v40 = v19;
    uint64_t v41 = v20;
    char v42 = v21;
    int v34 = v23;
    int v35 = v22;
    char v43 = v22;
    char v44 = v23;
    uint64_t v32 = v24;
    uint64_t v33 = v25;
    uint64_t v45 = v25;
    uint64_t v46 = v24;
    uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B78);
    MEMORY[0x1E0181A90](v47);
    double v27 = *(double *)&v47[2];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    if (v27 == 1.0)
    {
      uint64_t v36 = v15;
      uint64_t v37 = v16;
      uint64_t v38 = v17;
      uint64_t v39 = v18;
      uint64_t v40 = v19;
      uint64_t v41 = v20;
      char v42 = v21;
      char v43 = v35;
      char v44 = v34;
      uint64_t v45 = v33;
      uint64_t v46 = v32;
      MEMORY[0x1E0181A90](v47, v26);
      int v28 = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      if (v28 == 1) {
        uint64_t v29 = sub_1DADF64D0();
      }
      else {
        uint64_t v29 = sub_1DADF64B0();
      }
      uint64_t v30 = v29;
      swift_release();
      return v30;
    }
  }
  return v12;
}

double sub_1DADDF104()
{
  uint64_t v1 = sub_1DADF5D80();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1F4188790](v1);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (char *)(v0 + *(int *)(type metadata accessor for BCUIBoltView(0) + 36));
  char v6 = *v5;
  uint64_t v7 = *((void *)v5 + 1);
  LOBYTE(v16) = v6;
  uint64_t v17 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  int v8 = v18;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1E0181A90](v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  sub_1DADF5C70();
  double v10 = 15.0;
  if (v8 == 1)
  {
    double v11 = v16;
    char v12 = sub_1DADF333C();
    double v13 = fmin(v11 + 15.0, 17.0);
    if (v12) {
      double v10 = v13;
    }
    else {
      double v10 = 15.0;
    }
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v10;
}

double sub_1DADDF288(char a1, double a2)
{
  double v2 = 15.0;
  if (a1 & 1) != 0 && (sub_1DADF333C()) {
    return fmin(a2 + 15.0, 17.0);
  }
  return v2;
}

double sub_1DADDF2D8(double a1)
{
  uint64_t v3 = sub_1DADF5D80();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  char v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (char *)(v1 + *(int *)(type metadata accessor for BCUIBoltView(0) + 36));
  char v8 = *v7;
  uint64_t v9 = *((void *)v7 + 1);
  LOBYTE(v15) = v8;
  uint64_t v16 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A88);
  sub_1DADF65E0();
  char v10 = v17;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1E0181A90](v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  sub_1DADF5C70();
  double v12 = sub_1DADCC67C(v10, v15);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v12 * 0.5 - a1 * 0.5;
}

uint64_t sub_1DADDF450()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for BCUIBoltView(0);
  uint64_t v3 = v2 - 8;
  uint64_t v4 = *(void *)(v2 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x1F4188790](v2);
  char v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DADE3688(v1, (uint64_t)v6, type metadata accessor for BCUIBoltView);
  unint64_t v7 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = swift_allocObject();
  sub_1DADDF8AC((uint64_t)v6, v8 + v7);
  sub_1DADE3688(v1, (uint64_t)v6, type metadata accessor for BCUIBoltView);
  uint64_t v9 = swift_allocObject();
  sub_1DADDF8AC((uint64_t)v6, v9 + v7);
  uint64_t v37 = sub_1DADDF910;
  uint64_t v38 = v8;
  uint64_t v39 = sub_1DADE0290;
  uint64_t v40 = v9;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v10 = v1 + *(int *)(v3 + 36);
  long long v11 = *(_OWORD *)v10;
  uint64_t v12 = *(void *)(v10 + 16);
  uint64_t v13 = *(void *)(v10 + 24);
  uint64_t v14 = *(void *)(v10 + 32);
  uint64_t v15 = *(void *)(v10 + 40);
  char v16 = *(unsigned char *)(v10 + 48);
  char v17 = *(unsigned char *)(v10 + 49);
  char v18 = *(unsigned char *)(v10 + 50);
  uint64_t v20 = *(void *)(v10 + 56);
  uint64_t v19 = *(void *)(v10 + 64);
  long long v25 = v11;
  uint64_t v26 = v12;
  uint64_t v27 = v13;
  uint64_t v28 = v14;
  uint64_t v29 = v15;
  char v30 = v16;
  char v31 = v17;
  char v32 = v18;
  uint64_t v33 = v20;
  uint64_t v34 = v19;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B78);
  MEMORY[0x1E0181A90](&v35, v21);
  LOBYTE(v9) = v36;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  LOBYTE(v25) = v9;
  sub_1DADE3688(v1, (uint64_t)v6, type metadata accessor for BCUIBoltView);
  uint64_t v22 = swift_allocObject();
  sub_1DADDF8AC((uint64_t)v6, v22 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682788);
  sub_1DADE0490();
  sub_1DADF6460();
  swift_release();
  swift_release();
  sub_1DADE0530((uint64_t)v39);
  return sub_1DADE0530(v41);
}

uint64_t sub_1DADDF708(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B50);
  MEMORY[0x1F4188790](v4 - 8);
  char v6 = (uint64_t *)((char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682808);
  MEMORY[0x1F4188790](v7);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *char v6 = sub_1DADF66D0();
  v6[1] = v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682718);
  sub_1DADDF990(a2, a1, (uint64_t)v6 + *(int *)(v11 + 44));
  sub_1DADF5D10();
  sub_1DADF5D10();
  sub_1DADF66D0();
  sub_1DADF5CC0();
  sub_1DADAE0AC((uint64_t)v6, (uint64_t)v9, &qword_1EB682B50);
  uint64_t v12 = &v9[*(int *)(v7 + 36)];
  long long v13 = v15[1];
  *(_OWORD *)uint64_t v12 = v15[0];
  *((_OWORD *)v12 + 1) = v13;
  *((_OWORD *)v12 + 2) = v15[2];
  sub_1DADADF3C((uint64_t)v6, &qword_1EB682B50);
  sub_1DADE35E8();
  sub_1DADF63E0();
  return sub_1DADADF3C((uint64_t)v9, &qword_1EB682808);
}

uint64_t sub_1DADDF8AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BCUIBoltView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADDF910(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for BCUIBoltView(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_1DADDF708(a1, v4);
}

uint64_t sub_1DADDF990@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v91 = a2;
  uint64_t v89 = a3;
  uint64_t v4 = sub_1DADF5E30();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v84 = (char *)v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1DADF6720();
  uint64_t v82 = *(void *)(v6 - 8);
  uint64_t v83 = v6;
  MEMORY[0x1F4188790](v6);
  uint64_t v73 = (char *)v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6828A8) - 8;
  MEMORY[0x1F4188790](v80);
  uint64_t v9 = (char *)v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6828E0) - 8;
  MEMORY[0x1F4188790](v87);
  uint64_t v85 = (uint64_t)v66 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6828F8) - 8;
  uint64_t v11 = MEMORY[0x1F4188790](v88);
  uint64_t v86 = (uint64_t)v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  uint64_t v90 = (uint64_t)v66 - v13;
  uint64_t v14 = sub_1DADF6510();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x1F4188790](v14);
  char v17 = (char *)v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_1DADF282C();
  id v18 = (id)*v70;
  sub_1DADF6550();
  unsigned int v69 = *MEMORY[0x1E4F3EBF8];
  uint64_t v68 = *(void (**)(char *))(v15 + 104);
  v68(v17);
  uint64_t v81 = sub_1DADF6540();
  swift_release();
  uint64_t v67 = *(void (**)(char *, uint64_t))(v15 + 8);
  v67(v17, v14);
  uint64_t v19 = a1;
  sub_1DADDF104();
  sub_1DADF66D0();
  sub_1DADF5CC0();
  unsigned __int8 v20 = v93;
  uint64_t v75 = v92;
  uint64_t v76 = v94;
  LOBYTE(a1) = v95;
  uint64_t v78 = v97;
  uint64_t v79 = v96;
  uint64_t v77 = sub_1DADDEE14();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v72 = (uint64_t *)(v19 + *(int *)(type metadata accessor for BCUIBoltView(0) + 40));
  uint64_t v21 = v72[1];
  uint64_t v121 = *v72;
  uint64_t v122 = v21;
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A90);
  sub_1DADF65E0();
  uint64_t v22 = v111;
  sub_1DADF6740();
  uint64_t v24 = v23;
  unint64_t v26 = v25;
  sub_1DADF5D10();
  v66[1] = v19;
  double v28 = sub_1DADDF2D8(v27);
  unsigned __int8 v110 = 1;
  unsigned __int8 v107 = v20;
  unsigned __int8 v105 = a1;
  id v29 = (id)*v70;
  sub_1DADF6550();
  ((void (*)(char *, void, uint64_t))v68)(v17, v69, v14);
  uint64_t v30 = sub_1DADF6540();
  swift_release();
  v67(v17, v14);
  sub_1DADDF104();
  sub_1DADF66D0();
  sub_1DADF5CC0();
  uint64_t v70 = v98;
  unsigned int v69 = v99;
  uint64_t v68 = v100;
  LOBYTE(v17) = v101;
  uint64_t v31 = v102;
  uint64_t v32 = v103;
  uint64_t v33 = v82;
  uint64_t v34 = v83;
  uint64_t v35 = v73;
  (*(void (**)(char *, void, uint64_t))(v82 + 104))(v73, *MEMORY[0x1E4F3EFC8], v83);
  uint64_t v36 = (uint64_t)v84;
  (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v84, v35, v34);
  sub_1DADE3688(v36, (uint64_t)&v9[*(int *)(v80 + 44)], MEMORY[0x1E4F3CE18]);
  *(void *)uint64_t v9 = v30;
  *((void *)v9 + 1) = 0;
  *((_WORD *)v9 + 8) = 1;
  *((void *)v9 + 3) = v70;
  v9[32] = v69;
  *((void *)v9 + 5) = v68;
  v9[48] = (char)v17;
  *((void *)v9 + 7) = v31;
  *((void *)v9 + 8) = v32;
  swift_retain();
  sub_1DADE37CC(v36, MEMORY[0x1E4F3CE18]);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v35, v34);
  swift_release();
  uint64_t v37 = v72[1];
  uint64_t v121 = *v72;
  uint64_t v122 = v37;
  sub_1DADF65E0();
  uint64_t v38 = v111;
  sub_1DADF6740();
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v43 = v85;
  sub_1DADAE0AC((uint64_t)v9, v85, &qword_1EB6828A8);
  char v44 = (void *)(v43 + *(int *)(v87 + 44));
  *char v44 = v38;
  v44[1] = v38;
  v44[2] = v40;
  v44[3] = v42;
  sub_1DADADF3C((uint64_t)v9, &qword_1EB6828A8);
  sub_1DADF5D10();
  double v46 = sub_1DADDF2D8(v45);
  uint64_t v47 = v86;
  sub_1DADAE0AC(v43, v86, &qword_1EB6828E0);
  unsigned __int8 v48 = (double *)(v47 + *(int *)(v88 + 44));
  *unsigned __int8 v48 = 0.0;
  v48[1] = v46;
  sub_1DADADF3C(v43, &qword_1EB6828E0);
  uint64_t v49 = v90;
  sub_1DADADF98(v47, v90, &qword_1EB6828F8);
  LOBYTE(v35) = v110;
  LODWORD(v87) = v110;
  LOBYTE(v36) = v107;
  LODWORD(v88) = v107;
  LOBYTE(v43) = v105;
  LODWORD(v91) = v105;
  sub_1DADAE0AC(v49, v47, &qword_1EB6828F8);
  uint64_t v50 = v81;
  long long v111 = (unint64_t)v81;
  LOWORD(v112) = v35;
  *(_DWORD *)((char *)&v112 + 2) = v108;
  WORD3(v112) = v109;
  uint64_t v51 = v75;
  *((void *)&v112 + 1) = v75;
  LOBYTE(v113) = v36;
  *(_DWORD *)((char *)&v113 + 1) = *(_DWORD *)v106;
  DWORD1(v113) = *(_DWORD *)&v106[3];
  uint64_t v52 = v76;
  uint64_t v53 = v77;
  *((void *)&v113 + 1) = v76;
  LOBYTE(v114) = v43;
  *(_DWORD *)((char *)&v114 + 1) = *(_DWORD *)v104;
  DWORD1(v114) = *(_DWORD *)&v104[3];
  uint64_t v55 = v78;
  uint64_t v54 = v79;
  *((void *)&v114 + 1) = v79;
  *(void *)&long long v115 = v78;
  uint64_t v56 = KeyPath;
  *((void *)&v115 + 1) = KeyPath;
  *(void *)&long long v116 = v77;
  *((void *)&v116 + 1) = v22;
  *(void *)&long long v117 = v22;
  *((void *)&v117 + 1) = v24;
  unint64_t v118 = v26;
  uint64_t v119 = 0;
  double v120 = v28;
  long long v57 = v117;
  uint64_t v58 = (_OWORD *)v89;
  *(double *)(v89 + 128) = v28;
  v58[6] = v57;
  v58[7] = v26;
  long long v59 = v111;
  long long v60 = v112;
  long long v61 = v116;
  v58[4] = v115;
  v58[5] = v61;
  long long v62 = v114;
  v58[2] = v113;
  v58[3] = v62;
  _OWORD *v58 = v59;
  v58[1] = v60;
  char v63 = v58;
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682900);
  sub_1DADAE0AC(v47, (uint64_t)v63 + *(int *)(v64 + 48), &qword_1EB6828F8);
  sub_1DADE36F0((uint64_t)&v111);
  sub_1DADADF3C(v90, &qword_1EB6828F8);
  sub_1DADADF3C(v47, &qword_1EB6828F8);
  uint64_t v121 = v50;
  uint64_t v122 = 0;
  char v123 = v87;
  char v124 = 0;
  int v125 = v108;
  __int16 v126 = v109;
  uint64_t v127 = v51;
  char v128 = v88;
  *(_DWORD *)uint64_t v129 = *(_DWORD *)v106;
  *(_DWORD *)&v129[3] = *(_DWORD *)&v106[3];
  uint64_t v130 = v52;
  char v131 = v91;
  *(_DWORD *)&v132[3] = *(_DWORD *)&v104[3];
  *(_DWORD *)char v132 = *(_DWORD *)v104;
  uint64_t v133 = v54;
  uint64_t v134 = v55;
  uint64_t v135 = v56;
  uint64_t v136 = v53;
  uint64_t v137 = v22;
  uint64_t v138 = v22;
  uint64_t v139 = v24;
  unint64_t v140 = v26;
  uint64_t v141 = 0;
  double v142 = v28;
  return sub_1DADE3738((uint64_t)&v121);
}

uint64_t sub_1DADE0290()
{
  type metadata accessor for BCUIBoltView(0);
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B78);
  MEMORY[0x1E0181A90](&v4, v0);
  int v1 = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  double v2 = 0.0;
  if (v1) {
    double v2 = 1.0;
  }
  double v4 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A90);
  return sub_1DADF65F0();
}

uint64_t sub_1DADE03D4()
{
  return swift_release();
}

unint64_t sub_1DADE0490()
{
  unint64_t result = qword_1EB682780;
  if (!qword_1EB682780)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB682788);
    sub_1DADAD660(&qword_1EB682740, &qword_1EB682748);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB682780);
  }
  return result;
}

uint64_t sub_1DADE0530(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1DADE0540()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADE055C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADE0578()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *sub_1DADE0598(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1DADF6790();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (char *)a1 + v9;
    uint64_t v12 = (char *)a2 + v9;
    uint64_t v13 = *((void *)v12 + 1);
    *(void *)uint64_t v11 = *(void *)v12;
    *((void *)v11 + 1) = v13;
    uint64_t v14 = *((void *)v12 + 3);
    *((void *)v11 + 2) = *((void *)v12 + 2);
    *((void *)v11 + 3) = v14;
    uint64_t v15 = *((void *)v12 + 5);
    *((void *)v11 + 4) = *((void *)v12 + 4);
    *((void *)v11 + 5) = v15;
    *((_WORD *)v11 + 24) = *((_WORD *)v12 + 24);
    v11[50] = v12[50];
    uint64_t v16 = *((void *)v12 + 8);
    *((void *)v11 + 7) = *((void *)v12 + 7);
    *((void *)v11 + 8) = v16;
    char v17 = (uint64_t *)((char *)a1 + v10);
    uint64_t v28 = a3;
    id v18 = (char *)a2 + v10;
    uint64_t v19 = *(uint64_t *)((char *)a2 + v10 + 8);
    *char v17 = *(uint64_t *)((char *)a2 + v10);
    v17[1] = v19;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    uint64_t v20 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
    uint64_t v21 = (char *)v17 + v20;
    uint64_t v22 = &v18[v20];
    uint64_t v23 = sub_1DADF5D80();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    uint64_t v24 = *(int *)(v28 + 28);
    unint64_t v25 = (char *)a1 + v24;
    unint64_t v26 = (char *)a2 + v24;
    char *v25 = *v26;
    *((void *)v25 + 1) = *((void *)v26 + 1);
  }
  swift_retain();
  return a1;
}

uint64_t sub_1DADE07C0(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1DADF6790();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  swift_release();
  swift_release();
  uint64_t v6 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v7 = sub_1DADF5D80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  return swift_release();
}

void *sub_1DADE0900(void *a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1DADF6790();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v7;
  uint64_t v10 = (char *)a2 + v7;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = *(void *)v10;
  *((void *)v9 + 1) = v11;
  uint64_t v12 = *((void *)v10 + 3);
  *((void *)v9 + 2) = *((void *)v10 + 2);
  *((void *)v9 + 3) = v12;
  uint64_t v13 = *((void *)v10 + 5);
  *((void *)v9 + 4) = *((void *)v10 + 4);
  *((void *)v9 + 5) = v13;
  *((_WORD *)v9 + 24) = *((_WORD *)v10 + 24);
  v9[50] = v10[50];
  uint64_t v14 = *((void *)v10 + 8);
  *((void *)v9 + 7) = *((void *)v10 + 7);
  *((void *)v9 + 8) = v14;
  uint64_t v15 = (void *)((char *)a1 + v8);
  uint64_t v26 = a3;
  uint64_t v16 = (char *)a2 + v8;
  uint64_t v17 = *(void *)((char *)a2 + v8 + 8);
  *uint64_t v15 = *(void *)((char *)a2 + v8);
  v15[1] = v17;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v19 = (char *)v15 + v18;
  uint64_t v20 = &v16[v18];
  uint64_t v21 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  uint64_t v22 = *(int *)(v26 + 28);
  uint64_t v23 = (char *)a1 + v22;
  uint64_t v24 = (char *)a2 + v22;
  *uint64_t v23 = *v24;
  *((void *)v23 + 1) = *((void *)v24 + 1);
  swift_retain();
  return a1;
}

void *sub_1DADE0ADC(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1DADADF3C((uint64_t)a1, &qword_1EB682F58);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1DADF6790();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  swift_retain();
  swift_release();
  *((void *)v8 + 1) = *((void *)v9 + 1);
  swift_retain();
  swift_release();
  *((void *)v8 + 2) = *((void *)v9 + 2);
  *((void *)v8 + 3) = *((void *)v9 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v8 + 4) = *((void *)v9 + 4);
  *((void *)v8 + 5) = *((void *)v9 + 5);
  swift_retain();
  swift_release();
  v8[48] = v9[48];
  v8[49] = v9[49];
  v8[50] = v9[50];
  *((void *)v8 + 7) = *((void *)v9 + 7);
  *((void *)v8 + 8) = *((void *)v9 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  swift_retain();
  swift_release();
  *((void *)v11 + 1) = *((void *)v12 + 1);
  swift_retain();
  swift_release();
  uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v14 = &v11[v13];
  uint64_t v15 = &v12[v13];
  uint64_t v16 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  uint64_t v17 = a3[7];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  *uint64_t v18 = *v19;
  *((void *)v18 + 1) = *((void *)v19 + 1);
  swift_retain();
  swift_release();
  return a1;
}

char *sub_1DADE0D2C(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1DADF6790();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v8];
  uint64_t v11 = &a2[v8];
  long long v12 = *((_OWORD *)v11 + 3);
  *((_OWORD *)v10 + 2) = *((_OWORD *)v11 + 2);
  *((_OWORD *)v10 + 3) = v12;
  *((void *)v10 + 8) = *((void *)v11 + 8);
  long long v13 = *((_OWORD *)v11 + 1);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
  *((_OWORD *)v10 + 1) = v13;
  uint64_t v14 = &a1[v9];
  uint64_t v15 = &a2[v9];
  uint64_t v16 = *(void *)&a2[v9];
  uint64_t v17 = *(void *)&a2[v9 + 8];
  *(void *)uint64_t v14 = v16;
  *((void *)v14 + 1) = v17;
  uint64_t v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v19 = &v14[v18];
  uint64_t v20 = &v15[v18];
  uint64_t v21 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  return a1;
}

char *sub_1DADE0E90(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1DADADF3C((uint64_t)a1, &qword_1EB682F58);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1DADF6790();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  swift_release();
  *((void *)v9 + 1) = *((void *)v10 + 1);
  swift_release();
  uint64_t v11 = *((void *)v10 + 3);
  *((void *)v9 + 2) = *((void *)v10 + 2);
  *((void *)v9 + 3) = v11;
  swift_bridgeObjectRelease();
  *((void *)v9 + 4) = *((void *)v10 + 4);
  *((void *)v9 + 5) = *((void *)v10 + 5);
  swift_release();
  v9[48] = v10[48];
  v9[49] = v10[49];
  v9[50] = v10[50];
  uint64_t v12 = *((void *)v10 + 8);
  *((void *)v9 + 7) = *((void *)v10 + 7);
  *((void *)v9 + 8) = v12;
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  *(void *)&a1[v13] = *(void *)&a2[v13];
  swift_release();
  *((void *)v14 + 1) = *((void *)v15 + 1);
  swift_release();
  uint64_t v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v17 = &v14[v16];
  uint64_t v18 = &v15[v16];
  uint64_t v19 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  uint64_t v20 = a3[7];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  char *v21 = *v22;
  *((void *)v21 + 1) = *((void *)v22 + 1);
  swift_release();
  return a1;
}

uint64_t sub_1DADE1098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DADE10AC);
}

uint64_t sub_1DADE10AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_1DADE11E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DADE11F8);
}

uint64_t sub_1DADE11F8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_1DADE1330()
{
  sub_1DADE3400(319, (unint64_t *)&qword_1EB683638, MEMORY[0x1E4F46AE8], MEMORY[0x1E4F3C648]);
  if (v0 <= 0x3F)
  {
    sub_1DADE3400(319, &qword_1EB682B90, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3EE18]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_1DADE1468(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    a1[1] = a2[1];
    uint64_t v5 = *(int *)(a3 + 20);
    uint64_t v6 = (uint64_t *)((char *)a1 + v5);
    uint64_t v7 = (char *)a2 + v5;
    uint64_t v8 = *(uint64_t *)((char *)a2 + v5 + 8);
    *uint64_t v6 = *(uint64_t *)((char *)a2 + v5);
    v6[1] = v8;
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
    unint64_t v10 = (char *)v6 + v9;
    uint64_t v11 = &v7[v9];
    uint64_t v12 = sub_1DADF5D80();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  }
  return v3;
}

uint64_t sub_1DADE1578(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  swift_release();
  swift_release();
  uint64_t v5 = v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v6 = sub_1DADF5D80();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);

  return v7(v5, v6);
}

uint64_t sub_1DADE1614(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = a2 + v4;
  uint64_t v7 = *(void *)(a2 + v4 + 8);
  *uint64_t v5 = *(void *)(a2 + v4);
  v5[1] = v7;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v9 = (char *)v5 + v8;
  uint64_t v10 = v6 + v8;
  uint64_t v11 = sub_1DADF5D80();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  return a1;
}

uint64_t sub_1DADE16D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = (void *)(a2 + v6);
  *(void *)(a1 + v6) = *v8;
  swift_retain();
  swift_release();
  *(void *)(v7 + 8) = v8[1];
  swift_retain();
  swift_release();
  uint64_t v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v10 = v7 + v9;
  uint64_t v11 = (char *)v8 + v9;
  uint64_t v12 = sub_1DADF5D80();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_OWORD *sub_1DADE17B8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (void *)((char *)a1 + v4);
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = *(void *)((char *)a2 + v4 + 8);
  *uint64_t v5 = *(void *)((char *)a2 + v4);
  v5[1] = v7;
  uint64_t v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v9 = (char *)v5 + v8;
  uint64_t v10 = &v6[v8];
  uint64_t v11 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

uint64_t sub_1DADE1854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = (void *)(a2 + v6);
  *(void *)(a1 + v6) = *v8;
  swift_release();
  *(void *)(v7 + 8) = v8[1];
  swift_release();
  uint64_t v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v10 = v7 + v9;
  uint64_t v11 = (char *)v8 + v9;
  uint64_t v12 = sub_1DADF5D80();
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_1DADE1920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DADE1934);
}

uint64_t sub_1DADE1934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = a1 + *(int *)(a3 + 20);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_1DADE19F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DADE1A08);
}

uint64_t sub_1DADE1A08(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 2147483646)
  {
    *(void *)(result + 8) = a2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_1DADE1AB4()
{
  sub_1DADE3400(319, &qword_1EB682B90, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3EE18]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

char *sub_1DADE1B7C(char *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1DADF5C00();
      (*(void (**)(char *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *(void *)a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = &a1[v9];
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = *(void *)v11;
    char v13 = v11[8];
    sub_1DADAB7C8(*(void *)v11, v13);
    *(void *)uint64_t v10 = v12;
    v10[8] = v13;
    uint64_t v14 = a3[6];
    uint64_t v15 = &a1[v14];
    uint64_t v16 = (uint64_t *)((char *)a2 + v14);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_1DADF6790();
      (*(void (**)(char *, void *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *(void *)uint64_t v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v18 = a3[7];
    uint64_t v19 = a3[8];
    uint64_t v20 = &a1[v18];
    uint64_t v21 = (char *)a2 + v18;
    uint64_t v22 = *((void *)v21 + 1);
    *(void *)uint64_t v20 = *(void *)v21;
    *((void *)v20 + 1) = v22;
    uint64_t v23 = *((void *)v21 + 3);
    *((void *)v20 + 2) = *((void *)v21 + 2);
    *((void *)v20 + 3) = v23;
    uint64_t v24 = *((void *)v21 + 5);
    *((void *)v20 + 4) = *((void *)v21 + 4);
    *((void *)v20 + 5) = v24;
    v20[48] = v21[48];
    *(_WORD *)(v20 + 49) = *(_WORD *)(v21 + 49);
    uint64_t v25 = *((void *)v21 + 8);
    *((void *)v20 + 7) = *((void *)v21 + 7);
    *((void *)v20 + 8) = v25;
    uint64_t v26 = &a1[v19];
    double v46 = a3;
    double v27 = (char *)a2 + v19;
    uint64_t v28 = *(uint64_t *)((char *)a2 + v19 + 8);
    *(void *)uint64_t v26 = *(uint64_t *)((char *)a2 + v19);
    *((void *)v26 + 1) = v28;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    uint64_t v29 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
    uint64_t v30 = &v26[v29];
    uint64_t v31 = &v27[v29];
    uint64_t v32 = sub_1DADF5D80();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 16))(v30, v31, v32);
    uint64_t v33 = v46[9];
    uint64_t v34 = v46[10];
    uint64_t v35 = &a1[v33];
    uint64_t v36 = (char *)a2 + v33;
    char *v35 = *v36;
    *((void *)v35 + 1) = *((void *)v36 + 1);
    uint64_t v37 = &a1[v34];
    uint64_t v38 = (uint64_t *)((char *)a2 + v34);
    uint64_t v39 = v38[1];
    *(void *)uint64_t v37 = *v38;
    *((void *)v37 + 1) = v39;
    uint64_t v40 = v46[11];
    uint64_t v41 = &a1[v40];
    uint64_t v42 = (char *)a2 + v40;
    swift_retain();
    swift_retain();
    uint64_t v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    char v44 = *(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 16);
    v44(v41, v42, v43);
    v44(&a1[v46[12]], (char *)a2 + v46[12], v43);
  }
  return a1;
}

uint64_t sub_1DADE1EE8(uint64_t a1, int *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1DADF5C00();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  sub_1DADABA40(*(void *)(a1 + a2[5]), *(unsigned char *)(a1 + a2[5] + 8));
  uint64_t v5 = a1 + a2[6];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1DADF6790();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v7 = a1 + a2[8];
  swift_release();
  swift_release();
  uint64_t v8 = v7 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v9 = sub_1DADF5D80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_release();
  swift_release();
  uint64_t v10 = a1 + a2[11];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v14)((void *)(v11 - 8), v10, v11);
  uint64_t v12 = a1 + a2[12];

  return v14(v12, v11);
}

char *sub_1DADE212C(char *a1, char *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1DADF5C00();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = *(void *)v9;
  char v11 = v9[8];
  sub_1DADAB7C8(*(void *)v9, v11);
  *(void *)uint64_t v8 = v10;
  v8[8] = v11;
  uint64_t v12 = a3[6];
  char v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_1DADF6790();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  else
  {
    *(void *)char v13 = *(void *)v14;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v16 = a3[7];
  uint64_t v17 = a3[8];
  uint64_t v18 = &a1[v16];
  uint64_t v19 = &a2[v16];
  uint64_t v20 = *((void *)v19 + 1);
  *(void *)uint64_t v18 = *(void *)v19;
  *((void *)v18 + 1) = v20;
  uint64_t v21 = *((void *)v19 + 3);
  *((void *)v18 + 2) = *((void *)v19 + 2);
  *((void *)v18 + 3) = v21;
  uint64_t v22 = *((void *)v19 + 5);
  *((void *)v18 + 4) = *((void *)v19 + 4);
  *((void *)v18 + 5) = v22;
  v18[48] = v19[48];
  *(_WORD *)(v18 + 49) = *(_WORD *)(v19 + 49);
  uint64_t v23 = *((void *)v19 + 8);
  *((void *)v18 + 7) = *((void *)v19 + 7);
  *((void *)v18 + 8) = v23;
  uint64_t v24 = &a1[v17];
  char v44 = a3;
  uint64_t v25 = &a2[v17];
  uint64_t v26 = *(void *)&a2[v17 + 8];
  *(void *)uint64_t v24 = *(void *)&a2[v17];
  *((void *)v24 + 1) = v26;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v27 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v28 = &v24[v27];
  uint64_t v29 = &v25[v27];
  uint64_t v30 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 16))(v28, v29, v30);
  uint64_t v31 = v44[9];
  uint64_t v32 = v44[10];
  uint64_t v33 = &a1[v31];
  uint64_t v34 = &a2[v31];
  char *v33 = *v34;
  *((void *)v33 + 1) = *((void *)v34 + 1);
  uint64_t v35 = &a1[v32];
  uint64_t v36 = &a2[v32];
  uint64_t v37 = *((void *)v36 + 1);
  *(void *)uint64_t v35 = *(void *)v36;
  *((void *)v35 + 1) = v37;
  uint64_t v38 = v44[11];
  uint64_t v39 = &a1[v38];
  uint64_t v40 = &a2[v38];
  swift_retain();
  swift_retain();
  uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v42 = *(void (**)(char *, char *, uint64_t))(*(void *)(v41 - 8) + 16);
  v42(v39, v40, v41);
  v42(&a1[v44[12]], &a2[v44[12]], v41);
  return a1;
}

char *sub_1DADE2448(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1DADADF3C((uint64_t)a1, &qword_1EB682F68);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1DADF5C00();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *(void *)a1 = *(void *)a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = *(void *)v9;
  char v11 = v9[8];
  sub_1DADAB7C8(*(void *)v9, v11);
  uint64_t v12 = *(void *)v8;
  char v13 = v8[8];
  *(void *)uint64_t v8 = v10;
  v8[8] = v11;
  sub_1DADABA40(v12, v13);
  if (a1 != a2)
  {
    uint64_t v14 = a3[6];
    uint64_t v15 = &a1[v14];
    uint64_t v16 = &a2[v14];
    sub_1DADADF3C((uint64_t)&a1[v14], &qword_1EB682F58);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v17 = sub_1DADF6790();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *(void *)uint64_t v15 = *(void *)v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v18 = a3[7];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  *(void *)&a1[v18] = *(void *)&a2[v18];
  swift_retain();
  swift_release();
  *((void *)v19 + 1) = *((void *)v20 + 1);
  swift_retain();
  swift_release();
  *((void *)v19 + 2) = *((void *)v20 + 2);
  *((void *)v19 + 3) = *((void *)v20 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v19 + 4) = *((void *)v20 + 4);
  *((void *)v19 + 5) = *((void *)v20 + 5);
  swift_retain();
  swift_release();
  v19[48] = v20[48];
  v19[49] = v20[49];
  v19[50] = v20[50];
  *((void *)v19 + 7) = *((void *)v20 + 7);
  *((void *)v19 + 8) = *((void *)v20 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = a3[8];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  *(void *)&a1[v21] = *(void *)&a2[v21];
  swift_retain();
  swift_release();
  *((void *)v22 + 1) = *((void *)v23 + 1);
  swift_retain();
  swift_release();
  uint64_t v24 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v25 = &v22[v24];
  uint64_t v26 = &v23[v24];
  uint64_t v27 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v27 - 8) + 24))(v25, v26, v27);
  uint64_t v28 = a3[9];
  uint64_t v29 = &a1[v28];
  uint64_t v30 = &a2[v28];
  *uint64_t v29 = *v30;
  *((void *)v29 + 1) = *((void *)v30 + 1);
  swift_retain();
  swift_release();
  uint64_t v31 = a3[10];
  uint64_t v32 = &a1[v31];
  uint64_t v33 = &a2[v31];
  *(void *)uint64_t v32 = *(void *)v33;
  *((void *)v32 + 1) = *((void *)v33 + 1);
  swift_retain();
  swift_release();
  uint64_t v34 = a3[11];
  uint64_t v35 = &a1[v34];
  uint64_t v36 = &a2[v34];
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v38 = *(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 24);
  v38(v35, v36, v37);
  v38(&a1[a3[12]], &a2[a3[12]], v37);
  return a1;
}

char *sub_1DADE2814(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1DADF5C00();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v8];
  char v11 = &a2[v8];
  *(void *)uint64_t v10 = *(void *)v11;
  v10[8] = v11[8];
  uint64_t v12 = &a1[v9];
  char v13 = &a2[v9];
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v15 = sub_1DADF6790();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 32))(v12, v13, v15);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v12, v13, *(void *)(*(void *)(v14 - 8) + 64));
  }
  uint64_t v16 = a3[7];
  uint64_t v17 = a3[8];
  uint64_t v18 = &a1[v16];
  uint64_t v19 = &a2[v16];
  long long v20 = *((_OWORD *)v19 + 3);
  *((_OWORD *)v18 + 2) = *((_OWORD *)v19 + 2);
  *((_OWORD *)v18 + 3) = v20;
  *((void *)v18 + 8) = *((void *)v19 + 8);
  long long v21 = *((_OWORD *)v19 + 1);
  *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
  *((_OWORD *)v18 + 1) = v21;
  uint64_t v22 = &a1[v17];
  uint64_t v23 = &a2[v17];
  uint64_t v24 = *(void *)&a2[v17];
  uint64_t v25 = *(void *)&a2[v17 + 8];
  *(void *)uint64_t v22 = v24;
  *((void *)v22 + 1) = v25;
  uint64_t v26 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v27 = &v22[v26];
  uint64_t v28 = &v23[v26];
  uint64_t v29 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 32))(v27, v28, v29);
  uint64_t v30 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  *(_OWORD *)&a1[v30] = *(_OWORD *)&a2[v30];
  uint64_t v31 = a3[11];
  uint64_t v32 = &a1[v31];
  uint64_t v33 = &a2[v31];
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v35 = *(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 32);
  v35(v32, v33, v34);
  v35(&a1[a3[12]], &a2[a3[12]], v34);
  return a1;
}

char *sub_1DADE2AAC(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1DADADF3C((uint64_t)a1, &qword_1EB682F68);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1DADF5C00();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = *(void *)v10;
  LOBYTE(v10) = v10[8];
  uint64_t v12 = *(void *)v9;
  char v13 = v9[8];
  *(void *)uint64_t v9 = v11;
  v9[8] = (char)v10;
  sub_1DADABA40(v12, v13);
  if (a1 != a2)
  {
    uint64_t v14 = a3[6];
    uint64_t v15 = &a1[v14];
    uint64_t v16 = &a2[v14];
    sub_1DADADF3C((uint64_t)&a1[v14], &qword_1EB682F58);
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v18 = sub_1DADF6790();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v15, v16, v18);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v15, v16, *(void *)(*(void *)(v17 - 8) + 64));
    }
  }
  uint64_t v19 = a3[7];
  long long v20 = &a1[v19];
  long long v21 = &a2[v19];
  *(void *)&a1[v19] = *(void *)&a2[v19];
  swift_release();
  *((void *)v20 + 1) = *((void *)v21 + 1);
  swift_release();
  uint64_t v22 = *((void *)v21 + 3);
  *((void *)v20 + 2) = *((void *)v21 + 2);
  *((void *)v20 + 3) = v22;
  swift_bridgeObjectRelease();
  *((void *)v20 + 4) = *((void *)v21 + 4);
  *((void *)v20 + 5) = *((void *)v21 + 5);
  swift_release();
  v20[48] = v21[48];
  v20[49] = v21[49];
  v20[50] = v21[50];
  uint64_t v23 = *((void *)v21 + 8);
  *((void *)v20 + 7) = *((void *)v21 + 7);
  *((void *)v20 + 8) = v23;
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[8];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  *(void *)&a1[v24] = *(void *)&a2[v24];
  swift_release();
  *((void *)v25 + 1) = *((void *)v26 + 1);
  swift_release();
  uint64_t v27 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v28 = &v25[v27];
  uint64_t v29 = &v26[v27];
  uint64_t v30 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 40))(v28, v29, v30);
  uint64_t v31 = a3[9];
  uint64_t v32 = &a1[v31];
  uint64_t v33 = &a2[v31];
  char *v32 = *v33;
  *((void *)v32 + 1) = *((void *)v33 + 1);
  swift_release();
  uint64_t v34 = a3[10];
  uint64_t v35 = &a1[v34];
  uint64_t v36 = &a2[v34];
  *(void *)uint64_t v35 = *(void *)v36;
  *((void *)v35 + 1) = *((void *)v36 + 1);
  swift_release();
  uint64_t v37 = a3[11];
  uint64_t v38 = &a1[v37];
  uint64_t v39 = &a2[v37];
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 40);
  v41(v38, v39, v40);
  v41(&a1[a3[12]], &a2[a3[12]], v40);
  return a1;
}

uint64_t sub_1DADE2E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DADE2E40);
}

uint64_t sub_1DADE2E40(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_12:
    return v9(v10, a2, v8);
  }
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A0);
  if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
  {
    uint64_t v8 = v11;
    uint64_t v12 = *(void *)(v11 - 8);
    uint64_t v13 = a3[6];
LABEL_11:
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    goto LABEL_12;
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v14 = *(void *)(a1 + a3[7] + 8);
    if (v14 >= 0xFFFFFFFF) {
      LODWORD(v14) = -1;
    }
    return (v14 + 1);
  }
  else
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
    if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a2)
    {
      uint64_t v8 = v16;
      uint64_t v12 = *(void *)(v16 - 8);
      uint64_t v13 = a3[8];
      goto LABEL_11;
    }
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48);
    uint64_t v19 = v17;
    uint64_t v20 = a1 + a3[11];
    return v18(v20, a2, v19);
  }
}

uint64_t sub_1DADE3020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DADE3034);
}

uint64_t sub_1DADE3034(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A8);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_10:
    return v11(v12, a2, a2, v10);
  }
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A0);
  if (*(_DWORD *)(*(void *)(result - 8) + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v14 = *(void *)(result - 8);
    uint64_t v15 = a4[6];
LABEL_9:
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_10;
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[7] + 8) = (a2 - 1);
    return result;
  }
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[8];
    goto LABEL_9;
  }
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  uint64_t v19 = v17;
  uint64_t v20 = a1 + a4[11];

  return v18(v20, a2, a2, v19);
}

void sub_1DADE3214()
{
  sub_1DADE3400(319, (unint64_t *)&qword_1EB6835B8, MEMORY[0x1E4F3C5D0], MEMORY[0x1E4F3C648]);
  if (v0 <= 0x3F)
  {
    sub_1DADE3400(319, (unint64_t *)&qword_1EB683638, MEMORY[0x1E4F46AE8], MEMORY[0x1E4F3C648]);
    if (v1 <= 0x3F)
    {
      sub_1DADE3400(319, &qword_1EB682B90, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3EE18]);
      if (v2 <= 0x3F)
      {
        sub_1DADB4B24();
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_1DADE3400(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_1DADE3464()
{
  return sub_1DADAD660(&qword_1EB682B08, &qword_1EB682B10);
}

uint64_t sub_1DADE34A0()
{
  return sub_1DADE3784(&qword_1EB682638, (void (*)(uint64_t))type metadata accessor for BCUIRingAndGlyphView.maskRingAndGlyphView);
}

uint64_t sub_1DADE34E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADE3558()
{
  return sub_1DADF65F0();
}

unint64_t sub_1DADE35E8()
{
  unint64_t result = qword_1EB682800;
  if (!qword_1EB682800)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB682808);
    sub_1DADAD660(&qword_1EB682B48, &qword_1EB682B50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB682800);
  }
  return result;
}

uint64_t sub_1DADE3688(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DADE36F0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1DADE3738(uint64_t a1)
{
  return a1;
}

uint64_t sub_1DADE3784(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1DADE37CC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t static BatteryCenterUI.registerWidgetViewDecoders()()
{
  return sub_1DADF5E10();
}

unint64_t sub_1DADE387C()
{
  unint64_t result = qword_1EB6835E8;
  if (!qword_1EB6835E8)
  {
    type metadata accessor for BatteryAvocadoArchivableView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6835E8);
  }
  return result;
}

uint64_t BatteryCenterUI.deinit()
{
  return v0;
}

uint64_t BatteryCenterUI.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1DADE38EC()
{
  return swift_allocObject();
}

uint64_t sub_1DADE38FC()
{
  return v0;
}

uint64_t type metadata accessor for BatteryCenterUI()
{
  return self;
}

uint64_t method lookup function for BatteryCenterUI(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for BatteryCenterUI);
}

uint64_t sub_1DADE3944()
{
  type metadata accessor for AvocadoViewModel();
  sub_1DADF07B4(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);

  return sub_1DADF5D50();
}

__n128 sub_1DADE39D0@<Q0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1DADF5D80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1DADF66D0();
  uint64_t v10 = v9;
  uint64_t v11 = *(void (**)(uint64_t))(*(void *)a1 + 360);
  uint64_t v12 = swift_retain();
  v11(v12);
  swift_release();
  char v13 = sub_1DADF333C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v13)
  {
    type metadata accessor for AvocadoViewModel();
    sub_1DADF07B4(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
    swift_retain();
    uint64_t v23 = sub_1DADF5D40();
    uint64_t v24 = v14;
    long long v25 = xmmword_1DADF9C00;
    char v26 = 0;
  }
  else
  {
    swift_retain();
    sub_1DADF3A74();
    swift_bridgeObjectRetain();
    id v15 = (id)*sub_1DADF3B34();
    uint64_t v16 = sub_1DADF5BC0();
    type metadata accessor for AvocadoViewModel();
    sub_1DADF07B4(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
    uint64_t v17 = sub_1DADF5D40();
    uint64_t v23 = v16;
    uint64_t v24 = v17;
    *(void *)&long long v25 = v18;
    *((void *)&v25 + 1) = 0x3FC28F5C28F5C28FLL;
    char v26 = 1;
  }
  sub_1DADE3F18();
  sub_1DADE3F6C();
  sub_1DADF6140();
  __n128 result = v27;
  long long v20 = v28;
  char v21 = v29;
  *(void *)a2 = v8;
  *(void *)(a2 + 8) = v10;
  *(__n128 *)(a2 + 16) = result;
  *(_OWORD *)(a2 + 32) = v20;
  *(unsigned char *)(a2 + 48) = v21;
  return result;
}

double sub_1DADE3C80@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1DADF5D80();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void (**)(uint64_t))(*(void *)a1 + 360);
  uint64_t v9 = swift_retain();
  v8(v9);
  swift_release();
  char v10 = sub_1DADF333C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v10)
  {
    type metadata accessor for AvocadoViewModel();
    sub_1DADF07B4(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
    swift_retain();
    uint64_t v20 = sub_1DADF5D40();
    uint64_t v21 = v11;
    long long v22 = xmmword_1DADF9C00;
    char v23 = 0;
  }
  else
  {
    swift_retain();
    sub_1DADF3A74();
    swift_bridgeObjectRetain();
    id v12 = (id)*sub_1DADF3B34();
    uint64_t v13 = sub_1DADF5BC0();
    type metadata accessor for AvocadoViewModel();
    sub_1DADF07B4(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
    uint64_t v14 = sub_1DADF5D40();
    uint64_t v20 = v13;
    uint64_t v21 = v14;
    *(void *)&long long v22 = v15;
    *((void *)&v22 + 1) = 0x3FC28F5C28F5C28FLL;
    char v23 = 1;
  }
  sub_1DADE3F18();
  sub_1DADE3F6C();
  sub_1DADF6140();
  double result = *(double *)&v24;
  long long v17 = v25;
  char v18 = v26;
  *(_OWORD *)a2 = v24;
  *(_OWORD *)(a2 + 16) = v17;
  *(unsigned char *)(a2 + 32) = v18;
  return result;
}

unint64_t sub_1DADE3F18()
{
  unint64_t result = qword_1EA8F93A0;
  if (!qword_1EA8F93A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F93A0);
  }
  return result;
}

unint64_t sub_1DADE3F6C()
{
  unint64_t result = qword_1EA8F93A8[0];
  if (!qword_1EA8F93A8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1EA8F93A8);
  }
  return result;
}

uint64_t sub_1DADE3FC0()
{
  type metadata accessor for AvocadoViewModel();
  sub_1DADF07B4(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);

  return sub_1DADF5D40();
}

uint64_t sub_1DADE403C()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 sub_1DADE4058@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = sub_1DADF66D0();
  uint64_t v6 = v5;
  sub_1DADE3C80(v3, (uint64_t)v10);
  char v7 = v11;
  __n128 result = (__n128)v10[0];
  long long v9 = v10[1];
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v6;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v9;
  *(unsigned char *)(a1 + 48) = v7;
  return result;
}

void *initializeBufferWithCopyOfBuffer for BCUI4x4AvocadoView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

void *assignWithCopy for BCUI4x4AvocadoView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

void *assignWithTake for BCUI4x4AvocadoView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for BCUI4x4AvocadoView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BCUI4x4AvocadoView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BCUI4x4AvocadoView()
{
  return &type metadata for BCUI4x4AvocadoView;
}

uint64_t sub_1DADE41F4()
{
  return sub_1DADAD660(&qword_1EA8F8A30, &qword_1EA8F8A38);
}

uint64_t destroy for BCUI4x4Standard()
{
  swift_release();

  return swift_release();
}

void *initializeWithCopy for BCUI4x4Standard(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_retain();
  return a1;
}

void *assignWithCopy for BCUI4x4Standard(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  return a1;
}

void *assignWithTake for BCUI4x4Standard(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  uint64_t v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_release();
  a1[3] = a2[3];
  return a1;
}

uint64_t getEnumTagSinglePayload for BCUI4x4Standard(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BCUI4x4Standard(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BCUI4x4Standard()
{
  return &type metadata for BCUI4x4Standard;
}

uint64_t destroy for BCUI4x4AX3Plus()
{
  return swift_release();
}

void *_s15BatteryCenterUI14BCUI4x4AX3PlusVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  return a1;
}

void *assignWithCopy for BCUI4x4AX3Plus(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  return a1;
}

void *assignWithTake for BCUI4x4AX3Plus(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_release();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for BCUI4x4AX3Plus(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BCUI4x4AX3Plus(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BCUI4x4AX3Plus()
{
  return &type metadata for BCUI4x4AX3Plus;
}

uint64_t sub_1DADE4578()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADE4594(double a1)
{
  uint64_t v2 = sub_1DADF6680();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DADF5D10();
  double v7 = v6 * a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8A80);
  sub_1DADF6690();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1DADF92C0;
  *(double *)uint64_t v5 = v7;
  long long v9 = *(void (**)(char *, void, uint64_t))(v3 + 104);
  v9(v5, *MEMORY[0x1E4F3EF18], v2);
  sub_1DADF66D0();
  sub_1DADF66A0();
  sub_1DADF5D10();
  *(double *)uint64_t v5 = v7;
  *((void *)v5 + 1) = v10;
  v9(v5, *MEMORY[0x1E4F3EF28], v2);
  sub_1DADF66B0();
  sub_1DADF66A0();
  return v8;
}

void sub_1DADE4784(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1DADF5A60();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8B30);
  uint64_t v35 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  double v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1DADF5D80();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v11 = *(void (**)(uint64_t))(*(void *)a2 + 360);
  uint64_t v12 = swift_retain();
  v11(v12);
  swift_release();
  id v13 = sub_1DADF2F04(*MEMORY[0x1E4FB28D8]);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_1DADF5BD0();
  unint64_t v14 = HIBYTE(v38) & 0xF;
  uint64_t v15 = v37 & 0xFFFFFFFFFFFFLL;
  if ((v38 & 0x2000000000000000) != 0) {
    unint64_t v16 = HIBYTE(v38) & 0xF;
  }
  else {
    unint64_t v16 = v37 & 0xFFFFFFFFFFFFLL;
  }
  if (!v16)
  {
    swift_bridgeObjectRelease();
LABEL_53:
    sub_1DADF5BD0();
    swift_bridgeObjectRetain();
    sub_1DADF6870();
    swift_bridgeObjectRelease();
    sub_1DADF22E0(v13);

    swift_bridgeObjectRelease();
    return;
  }
  if ((v38 & 0x1000000000000000) != 0)
  {
    uint64_t v18 = (uint64_t)sub_1DADEB8D0(v37, v38, 10);
    char v20 = v33;
    goto LABEL_44;
  }
  if ((v38 & 0x2000000000000000) == 0)
  {
    if ((v37 & 0x1000000000000000) != 0) {
      long long v17 = (unsigned __int8 *)((v38 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      long long v17 = (unsigned __int8 *)sub_1DADF6B00();
    }
    uint64_t v18 = (uint64_t)sub_1DADEB9B8(v17, v15, 10);
    char v20 = v19 & 1;
LABEL_44:
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0)
    {
      uint64_t v36 = v18;
      sub_1DADF5A50();
      sub_1DADEC8D4();
      sub_1DADF5A20();
      sub_1DADAD660(&qword_1EA8F8B40, &qword_1EA8F8B30);
      sub_1DADF6AA0();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v4);
      sub_1DADF22E0(v13);
      swift_bridgeObjectRelease();

      return;
    }
    goto LABEL_53;
  }
  v38 &= 0xFFFFFFFFFFFFFFuLL;
  if (v37 == 43)
  {
    if (!v14) {
      goto LABEL_57;
    }
    if (v14 == 1 || (BYTE1(v37) - 48) > 9u) {
      goto LABEL_31;
    }
    uint64_t v18 = (BYTE1(v37) - 48);
    if (v14 != 2)
    {
      if ((BYTE2(v37) - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v18 = 10 * (BYTE1(v37) - 48) + (BYTE2(v37) - 48);
      unint64_t v21 = v14 - 3;
      if (v21)
      {
        long long v22 = (unsigned __int8 *)&v37 + 3;
        while (1)
        {
          unsigned int v23 = *v22 - 48;
          if (v23 > 9) {
            goto LABEL_31;
          }
          uint64_t v24 = 10 * v18;
          if ((unsigned __int128)(v18 * (__int128)10) >> 64 != (10 * v18) >> 63) {
            goto LABEL_31;
          }
          uint64_t v18 = v24 + v23;
          if (__OFADD__(v24, v23)) {
            goto LABEL_31;
          }
          char v20 = 0;
          ++v22;
          if (!--v21) {
            goto LABEL_44;
          }
        }
      }
    }
LABEL_43:
    char v20 = 0;
    goto LABEL_44;
  }
  if (v37 != 45)
  {
    if (!v14 || (v37 - 48) > 9u) {
      goto LABEL_31;
    }
    uint64_t v18 = (v37 - 48);
    if (v14 != 1)
    {
      if ((BYTE1(v37) - 48) > 9u) {
        goto LABEL_31;
      }
      uint64_t v18 = 10 * (v37 - 48) + (BYTE1(v37) - 48);
      unint64_t v25 = v14 - 2;
      if (v25)
      {
        char v26 = (unsigned __int8 *)&v37 + 2;
        while (1)
        {
          unsigned int v27 = *v26 - 48;
          if (v27 > 9) {
            goto LABEL_31;
          }
          uint64_t v28 = 10 * v18;
          if ((unsigned __int128)(v18 * (__int128)10) >> 64 != (10 * v18) >> 63) {
            goto LABEL_31;
          }
          uint64_t v18 = v28 + v27;
          if (__OFADD__(v28, v27)) {
            goto LABEL_31;
          }
          char v20 = 0;
          ++v26;
          if (!--v25) {
            goto LABEL_44;
          }
        }
      }
    }
    goto LABEL_43;
  }
  if (v14)
  {
    if (v14 != 1 && (BYTE1(v37) - 48) <= 9u)
    {
      if (v14 == 2)
      {
        char v20 = 0;
        uint64_t v18 = -(uint64_t)(BYTE1(v37) - 48);
        goto LABEL_44;
      }
      if ((BYTE2(v37) - 48) <= 9u)
      {
        uint64_t v18 = -10 * (BYTE1(v37) - 48) - (BYTE2(v37) - 48);
        unint64_t v29 = v14 - 3;
        if (!v29) {
          goto LABEL_43;
        }
        uint64_t v30 = (unsigned __int8 *)&v37 + 3;
        while (1)
        {
          unsigned int v31 = *v30 - 48;
          if (v31 > 9) {
            break;
          }
          uint64_t v32 = 10 * v18;
          if ((unsigned __int128)(v18 * (__int128)10) >> 64 != (10 * v18) >> 63) {
            break;
          }
          uint64_t v18 = v32 - v31;
          if (__OFSUB__(v32, v31)) {
            break;
          }
          char v20 = 0;
          ++v30;
          if (!--v29) {
            goto LABEL_44;
          }
        }
      }
    }
LABEL_31:
    uint64_t v18 = 0;
    char v20 = 1;
    goto LABEL_44;
  }
  __break(1u);
LABEL_57:
  __break(1u);
}

uint64_t sub_1DADE4D48(double a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = a4;
  uint64_t v36 = a3;
  uint64_t v5 = sub_1DADF5D80();
  uint64_t v33 = *(void *)(v5 - 8);
  uint64_t v34 = v5;
  MEMORY[0x1F4188790](v5);
  unsigned int v31 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1DADF6680();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  char v11 = (uint64_t *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1F4188790](v9);
  id v13 = (char *)&v27 - v12;
  sub_1DADF5D10();
  double v15 = v14 * a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8A80);
  uint64_t v16 = *(void *)(*(void *)(sub_1DADF6690() - 8) + 72);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_1DADF9C10;
  uint64_t v32 = v17;
  *(double *)id v13 = v15;
  uint64_t v18 = *MEMORY[0x1E4F3EF18];
  char v19 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 104);
  v19(v13, v18, v7);
  sub_1DADF66D0();
  sub_1DADF66A0();
  uint64_t v29 = v16;
  sub_1DADF5D10();
  *(double *)id v13 = v15;
  *((void *)v13 + 1) = v20;
  v19(v13, *MEMORY[0x1E4F3EF28], v7);
  sub_1DADF66E0();
  sub_1DADF66A0();
  uint64_t v21 = v28;
  sub_1DADE4784(v36, v28);
  *char v11 = v22;
  uint64_t v35 = v11;
  uint64_t v36 = v7;
  unsigned int v30 = v18;
  v19((char *)v11, v18, v7);
  unsigned int v23 = *(void (**)(uint64_t))(*(void *)v21 + 360);
  uint64_t v24 = swift_retain();
  unint64_t v25 = v31;
  v23(v24);
  swift_release();
  LOBYTE(v21) = sub_1DADF3318();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v25, v34);
  if (v21) {
    sub_1DADF66F0();
  }
  else {
    sub_1DADF66E0();
  }
  sub_1DADF66A0();
  *(double *)id v13 = v15 * 0.8;
  v19(v13, v30, v36);
  sub_1DADF66E0();
  sub_1DADF66A0();
  return v32;
}

uint64_t sub_1DADE5120@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, char *a5@<X8>, double a6@<D0>)
{
  uint64_t v55 = a3;
  uint64_t v54 = a2;
  long long v61 = a5;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A8);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v56 = (void *)((char *)v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v11 = type metadata accessor for Dividers(0);
  uint64_t v12 = (int *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v60 = (uint64_t)v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = (char *)v51 - v15;
  uint64_t v17 = sub_1DADF6170();
  MEMORY[0x1F4188790](v17);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8AF8);
  uint64_t v58 = *(void *)(v18 - 8);
  uint64_t v59 = v18;
  uint64_t v19 = MEMORY[0x1F4188790](v18);
  long long v57 = (char *)v51 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v19);
  uint64_t v53 = (char *)v51 - v21;
  sub_1DADF5D10();
  double v23 = v22;
  uint64_t v52 = (uint64_t (**)(uint64_t))(*a4 + 440);
  uint64_t v24 = *v52;
  uint64_t v25 = swift_retain();
  uint64_t v26 = v24(v25);
  swift_release();
  double v27 = v23 / (double)v26;
  uint64_t v28 = v54;
  v51[1] = sub_1DADE4D48(a6, a1, v54, (uint64_t)a4);
  sub_1DADF6110();
  uint64_t v62 = v28;
  uint64_t v63 = v55;
  uint64_t v64 = a4;
  double v65 = a6;
  double v66 = v27;
  uint64_t v67 = a1;
  LODWORD(v69) = 0;
  sub_1DADF07B4(&qword_1EA8F8A48, MEMORY[0x1E4F3D910]);
  sub_1DADF6C00();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8B00);
  sub_1DADEC67C(&qword_1EA8F8B08, &qword_1EA8F8B00, &qword_1EA8F8B10, &qword_1EA8F8B18);
  sub_1DADF6730();
  uint64_t v29 = sub_1DADE4594(a6);
  uint64_t v30 = swift_retain();
  uint64_t v31 = v24(v30);
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v33 = (uint64_t)v56;
  uint64_t *v56 = KeyPath;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  swift_storeEnumTagMultiPayload();
  uint64_t v34 = swift_getKeyPath();
  sub_1DADADF98(v33, (uint64_t)v16, &qword_1EB6826A8);
  uint64_t v35 = &v16[v12[7]];
  *(void *)uint64_t v35 = v34;
  v35[8] = 0;
  uint64_t v36 = &v16[v12[8]];
  double v68 = *(double *)&v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8A70);
  sub_1DADF65D0();
  uint64_t v37 = *((void *)&v69 + 1);
  *(void *)uint64_t v36 = v69;
  *((void *)v36 + 1) = v37;
  unint64_t v38 = &v16[v12[9]];
  double v68 = v27;
  sub_1DADF65D0();
  uint64_t v39 = *((void *)&v69 + 1);
  *(void *)unint64_t v38 = v69;
  *((void *)v38 + 1) = v39;
  uint64_t v40 = v12[10];
  double v68 = *(double *)&v31;
  sub_1DADF65D0();
  *(_OWORD *)&v16[v40] = v69;
  uint64_t v41 = v57;
  uint64_t v42 = v58;
  uint64_t v43 = *(void (**)(char *, char *, uint64_t))(v58 + 16);
  char v44 = v53;
  uint64_t v45 = v59;
  v43(v57, v53, v59);
  uint64_t v46 = v60;
  sub_1DADEC510((uint64_t)v16, v60, type metadata accessor for Dividers);
  uint64_t v47 = v61;
  v43(v61, v41, v45);
  uint64_t v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8B20);
  sub_1DADEC510(v46, (uint64_t)&v47[*(int *)(v48 + 48)], type metadata accessor for Dividers);
  sub_1DADEC578((uint64_t)v16, type metadata accessor for Dividers);
  uint64_t v49 = *(void (**)(char *, uint64_t))(v42 + 8);
  v49(v44, v45);
  sub_1DADEC578(v46, type metadata accessor for Dividers);
  return ((uint64_t (*)(char *, uint64_t))v49)(v41, v45);
}

uint64_t sub_1DADE56C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>)
{
  v22[1] = a5;
  uint64_t v13 = sub_1DADF5D20();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void *)(v14 + 64);
  MEMORY[0x1F4188790](v13);
  uint64_t v16 = *(uint64_t (**)(uint64_t))(*(void *)a3 + 440);
  uint64_t v17 = swift_retain();
  uint64_t v18 = v16(v17);
  uint64_t result = swift_release();
  if (v18 < 0)
  {
    __break(1u);
  }
  else
  {
    void v22[2] = 0;
    v22[3] = v18;
    swift_getKeyPath();
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), a4, v13);
    unint64_t v20 = (*(unsigned __int8 *)(v14 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    uint64_t v21 = swift_allocObject();
    *(void *)(v21 + 16) = a1;
    *(void *)(v21 + 24) = a2;
    *(void *)(v21 + 32) = a3;
    *(double *)(v21 + 40) = a6;
    *(double *)(v21 + 48) = a7;
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v21 + v20, (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v13);
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8438);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8B18);
    sub_1DADB4C3C();
    sub_1DADAD660(&qword_1EA8F8B10, &qword_1EA8F8B18);
    return sub_1DADF6660();
  }
  return result;
}

uint64_t sub_1DADE591C@<X0>(double *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>)
{
  uint64_t v71 = a4;
  uint64_t v74 = a5;
  uint64_t v73 = type metadata accessor for AdjustedPercentChargeLabel(0) - 8;
  uint64_t v12 = MEMORY[0x1F4188790](v73);
  uint64_t v79 = (uint64_t *)&v66[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v12);
  uint64_t v82 = &v66[-v14];
  *(void *)&long long v72 = type metadata accessor for AdjustedNameLabel(0) - 8;
  uint64_t v15 = MEMORY[0x1F4188790](v72);
  uint64_t v86 = (uint64_t *)&v66[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v15);
  uint64_t v81 = &v66[-v17];
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1F4188790](v18 - 8);
  uint64_t v83 = &v66[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v20 = type metadata accessor for AdjustedDeviceGlyph(0);
  uint64_t v21 = MEMORY[0x1F4188790](v20 - 8);
  uint64_t v80 = &v66[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v21);
  uint64_t v87 = (uint64_t *)&v66[-v23];
  double v85 = *a1;
  double v24 = v85;
  uint64_t v25 = type metadata accessor for AvocadoViewModel();
  sub_1DADF07B4(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  long long v96 = v94;
  *(void *)&long long v97 = v95;
  *(double *)&long long v89 = v24;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8AA8);
  uint64_t v84 = sub_1DADAD660(&qword_1EA8F8AB0, &qword_1EB682F80);
  uint64_t v78 = v26;
  sub_1DADF6650();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  long long v98 = *(_OWORD *)v93;
  *(_OWORD *)unsigned __int8 v99 = *(_OWORD *)&v93[16];
  *(_DWORD *)&v99[15] = *(_DWORD *)&v93[31];
  long long v96 = v91;
  long long v97 = v92;
  uint64_t v75 = a2;
  uint64_t v76 = a3;
  sub_1DADF5D50();
  swift_getKeyPath();
  uint64_t v27 = (uint64_t)v83;
  sub_1DADF5D60();
  swift_release();
  swift_release();
  sub_1DADF5D10();
  double v29 = v28 * a6;
  double v30 = *(double *)sub_1DADF3C50();
  double v31 = *(double *)sub_1DADF3C68();
  double v32 = *(double *)sub_1DADF3C7C();
  uint64_t v33 = (double *)sub_1DADF3C90();
  sub_1DADE65F8((uint64_t)&v96, v27, 0, v87, a7, v29, v30, v31, v32, *v33);
  uint64_t v77 = v25;
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  long long v89 = v94;
  uint64_t v90 = v95;
  double v88 = v85;
  sub_1DADF6650();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  long long v70 = v91;
  uint64_t v34 = *((void *)&v92 + 1);
  uint64_t v69 = v92;
  uint64_t v35 = *(void *)v93;
  long long v68 = *(_OWORD *)&v93[8];
  uint64_t v36 = *(void *)&v93[24];
  int v67 = v93[32];
  LOBYTE(a3) = v93[33];
  LOBYTE(a2) = v93[34];
  sub_1DADF5D50();
  swift_getKeyPath();
  uint64_t v37 = (uint64_t)v83;
  sub_1DADF5D60();
  swift_release();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v39 = v86;
  *uint64_t v86 = KeyPath;
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  swift_storeEnumTagMultiPayload();
  uint64_t v40 = v72;
  uint64_t v41 = (char *)v39 + *(int *)(v72 + 28);
  *(_OWORD *)uint64_t v41 = v70;
  *((void *)v41 + 2) = v69;
  *((void *)v41 + 3) = v34;
  *((void *)v41 + 4) = v35;
  *(_OWORD *)(v41 + 40) = v68;
  *((void *)v41 + 7) = v36;
  v41[64] = v67;
  v41[65] = a3;
  v41[66] = a2;
  sub_1DADADF98(v37, (uint64_t)v39 + *(int *)(v40 + 32), &qword_1EB682B88);
  sub_1DADEC86C((uint64_t)v39, (uint64_t)v81, type metadata accessor for AdjustedNameLabel);
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  long long v89 = v94;
  uint64_t v90 = v95;
  double v88 = v85;
  sub_1DADF6650();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  long long v72 = v91;
  uint64_t v69 = *((void *)&v92 + 1);
  *(void *)&long long v70 = v92;
  uint64_t v42 = *(void *)v93;
  long long v68 = *(_OWORD *)&v93[8];
  uint64_t v43 = *(void *)&v93[24];
  LOBYTE(a2) = v93[32];
  LOBYTE(v34) = v93[33];
  LOBYTE(v36) = v93[34];
  sub_1DADF5D50();
  swift_getKeyPath();
  uint64_t v44 = (uint64_t)v83;
  sub_1DADF5D60();
  swift_release();
  swift_release();
  uint64_t v45 = swift_getKeyPath();
  uint64_t v46 = v79;
  *uint64_t v79 = v45;
  swift_storeEnumTagMultiPayload();
  uint64_t v47 = v73;
  uint64_t v48 = (char *)v46 + *(int *)(v73 + 28);
  *(_OWORD *)uint64_t v48 = v72;
  uint64_t v49 = v69;
  *((void *)v48 + 2) = v70;
  *((void *)v48 + 3) = v49;
  *((void *)v48 + 4) = v42;
  *(_OWORD *)(v48 + 40) = v68;
  *((void *)v48 + 7) = v43;
  v48[64] = a2;
  v48[65] = v34;
  v48[66] = v36;
  sub_1DADADF98(v44, (uint64_t)v46 + *(int *)(v47 + 32), &qword_1EB682B88);
  uint64_t v50 = (uint64_t)v46;
  sub_1DADEC86C((uint64_t)v46, (uint64_t)v82, type metadata accessor for AdjustedPercentChargeLabel);
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  long long v89 = v94;
  uint64_t v90 = v95;
  double v88 = v85;
  sub_1DADF6650();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v84 = *((void *)&v91 + 1);
  double v85 = *(double *)&v91;
  uint64_t v73 = *((void *)&v92 + 1);
  uint64_t v83 = (unsigned char *)v92;
  uint64_t v51 = *(void *)v93;
  *(void *)&long long v72 = *(void *)&v93[8];
  uint64_t v71 = *(void *)&v93[24];
  uint64_t v78 = *(void *)&v93[16];
  LODWORD(v77) = v93[32];
  LODWORD(v76) = v93[33];
  LODWORD(v75) = v93[34];
  double v88 = a7;
  sub_1DADF65D0();
  long long v52 = v89;
  LOBYTE(v88) = 0;
  sub_1DADF65D0();
  LODWORD(v70) = v89;
  uint64_t v53 = *((void *)&v89 + 1);
  uint64_t v54 = v80;
  sub_1DADEC510((uint64_t)v87, (uint64_t)v80, type metadata accessor for AdjustedDeviceGlyph);
  uint64_t v55 = v81;
  uint64_t v56 = v86;
  sub_1DADEC510((uint64_t)v81, (uint64_t)v86, type metadata accessor for AdjustedNameLabel);
  long long v57 = v82;
  sub_1DADEC510((uint64_t)v82, (uint64_t)v46, type metadata accessor for AdjustedPercentChargeLabel);
  uint64_t v58 = (uint64_t)v54;
  uint64_t v59 = v74;
  sub_1DADEC510(v58, v74, type metadata accessor for AdjustedDeviceGlyph);
  uint64_t v60 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8B28);
  sub_1DADEC510((uint64_t)v56, v59 + v60[12], type metadata accessor for AdjustedNameLabel);
  sub_1DADEC510(v50, v59 + v60[16], type metadata accessor for AdjustedPercentChargeLabel);
  uint64_t v61 = v59 + v60[20];
  uint64_t v62 = v84;
  *(double *)uint64_t v61 = v85;
  *(void *)(v61 + 8) = v62;
  uint64_t v63 = v73;
  *(void *)(v61 + 16) = v83;
  *(void *)(v61 + 24) = v63;
  *(void *)(v61 + 32) = v51;
  uint64_t v64 = v78;
  *(void *)(v61 + 40) = v72;
  *(void *)(v61 + 48) = v64;
  *(void *)(v61 + 56) = v71;
  *(unsigned char *)(v61 + 64) = v77;
  *(unsigned char *)(v61 + 65) = v76;
  *(unsigned char *)(v61 + 66) = v75;
  *(_OWORD *)(v61 + 72) = v52;
  *(unsigned char *)(v61 + 88) = v70;
  *(void *)(v61 + 96) = v53;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1DADEC578((uint64_t)v57, type metadata accessor for AdjustedPercentChargeLabel);
  sub_1DADEC578((uint64_t)v55, type metadata accessor for AdjustedNameLabel);
  sub_1DADEC578((uint64_t)v87, type metadata accessor for AdjustedDeviceGlyph);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_1DADEC578((uint64_t)v79, type metadata accessor for AdjustedPercentChargeLabel);
  sub_1DADEC578((uint64_t)v86, type metadata accessor for AdjustedNameLabel);
  return sub_1DADEC578((uint64_t)v80, type metadata accessor for AdjustedDeviceGlyph);
}

uint64_t sub_1DADE65F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t *a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>, double a9@<D4>, double a10@<D5>)
{
  uint64_t v20 = sub_1DADF6310();
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20);
  uint64_t v23 = (char *)&v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a4 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  swift_storeEnumTagMultiPayload();
  double v24 = (int *)type metadata accessor for AdjustedDeviceGlyph(0);
  uint64_t v25 = (char *)a4 + v24[5];
  long long v26 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v25 + 2) = *(_OWORD *)(a1 + 32);
  *((_OWORD *)v25 + 3) = v26;
  *(_DWORD *)(v25 + 63) = *(_DWORD *)(a1 + 63);
  long long v27 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)uint64_t v25 = *(_OWORD *)a1;
  *((_OWORD *)v25 + 1) = v27;
  sub_1DADADF98(a2, (uint64_t)a4 + v24[6], &qword_1EB682B88);
  double v28 = (double *)((char *)a4 + v24[7]);
  double v38 = a5;
  sub_1DADF65D0();
  uint64_t v29 = v40;
  *double v28 = v39;
  *((void *)v28 + 1) = v29;
  double v30 = (char *)a4 + v24[8];
  LOBYTE(v38) = a3;
  sub_1DADF65D0();
  uint64_t v31 = v40;
  *double v30 = LOBYTE(v39);
  *((void *)v30 + 1) = v31;
  double v32 = (double *)((char *)a4 + v24[9]);
  double v38 = a6;
  sub_1DADF65D0();
  uint64_t v33 = v40;
  double *v32 = v39;
  *((void *)v32 + 1) = v33;
  double v39 = a7;
  uint64_t v34 = *MEMORY[0x1E4F3E140];
  uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 104);
  v35(v23, v34, v20);
  sub_1DADB2BCC();
  sub_1DADF5C50();
  double v39 = a8;
  v35(v23, v34, v20);
  sub_1DADF5C50();
  double v39 = a9;
  v35(v23, v34, v20);
  sub_1DADF5C50();
  double v39 = a10;
  v35(v23, v34, v20);
  return sub_1DADF5C50();
}

uint64_t sub_1DADE6904@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = sub_1DADF66D0();
  uint64_t v9 = v8;
  uint64_t v10 = (void *)swift_allocObject();
  _OWORD v10[2] = v3;
  v10[3] = v4;
  v10[4] = v5;
  v10[5] = v6;
  *a1 = v7;
  a1[1] = v9;
  a1[2] = (uint64_t)sub_1DADEC658;
  a1[3] = (uint64_t)v10;
  swift_retain();

  return swift_retain();
}

uint64_t sub_1DADE69A8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADE69C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>, double a5@<D0>)
{
  uint64_t v51 = a2;
  long long v57 = a4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A8);
  MEMORY[0x1F4188790](v8 - 8);
  long long v52 = (void *)((char *)v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v10 = type metadata accessor for Dividers(0);
  uint64_t v11 = (int *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1F4188790](v10);
  uint64_t v56 = (uint64_t)v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v15 = (char *)v49 - v14;
  uint64_t v16 = sub_1DADF6170();
  MEMORY[0x1F4188790](v16);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8A40);
  uint64_t v54 = *(void *)(v17 - 8);
  uint64_t v55 = v17;
  uint64_t v18 = MEMORY[0x1F4188790](v17);
  uint64_t v53 = (char *)v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v18);
  uint64_t v50 = (char *)v49 - v20;
  sub_1DADF5D10();
  double v22 = v21;
  uint64_t v23 = *(uint64_t (**)(uint64_t))(*(void *)a3 + 440);
  uint64_t v24 = swift_retain();
  uint64_t v25 = v23(v24);
  swift_release();
  double v26 = v22 / (double)v25;
  v49[1] = sub_1DADEC19C(a5);
  v49[0] = sub_1DADF6110();
  uint64_t v58 = v51;
  uint64_t v59 = a3;
  double v60 = a5;
  double v61 = v26;
  uint64_t v62 = a1;
  LODWORD(v64) = 0;
  sub_1DADF07B4(&qword_1EA8F8A48, MEMORY[0x1E4F3D910]);
  sub_1DADF6C00();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8A50);
  sub_1DADEC67C(&qword_1EA8F8A58, &qword_1EA8F8A50, &qword_1EA8F8A60, &qword_1EA8F8A68);
  sub_1DADF6730();
  uint64_t v27 = sub_1DADE4594(a5);
  uint64_t v28 = swift_retain();
  uint64_t v29 = v23(v28);
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v31 = (uint64_t)v52;
  uint64_t *v52 = KeyPath;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  swift_storeEnumTagMultiPayload();
  uint64_t v32 = swift_getKeyPath();
  sub_1DADADF98(v31, (uint64_t)v15, &qword_1EB6826A8);
  uint64_t v33 = &v15[v11[7]];
  *(void *)uint64_t v33 = v32;
  v33[8] = 0;
  uint64_t v34 = &v15[v11[8]];
  double v63 = *(double *)&v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8A70);
  sub_1DADF65D0();
  uint64_t v35 = *((void *)&v64 + 1);
  *(void *)uint64_t v34 = v64;
  *((void *)v34 + 1) = v35;
  uint64_t v36 = &v15[v11[9]];
  double v63 = v26;
  sub_1DADF65D0();
  uint64_t v37 = *((void *)&v64 + 1);
  *(void *)uint64_t v36 = v64;
  *((void *)v36 + 1) = v37;
  uint64_t v38 = v11[10];
  double v63 = *(double *)&v29;
  sub_1DADF65D0();
  *(_OWORD *)&v15[v38] = v64;
  double v39 = v53;
  uint64_t v40 = v54;
  uint64_t v41 = *(void (**)(char *, char *, uint64_t))(v54 + 16);
  uint64_t v42 = v50;
  uint64_t v43 = v55;
  v41(v53, v50, v55);
  uint64_t v44 = v56;
  sub_1DADEC510((uint64_t)v15, v56, type metadata accessor for Dividers);
  uint64_t v45 = v57;
  v41(v57, v39, v43);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8A78);
  sub_1DADEC510(v44, (uint64_t)&v45[*(int *)(v46 + 48)], type metadata accessor for Dividers);
  sub_1DADEC578((uint64_t)v15, type metadata accessor for Dividers);
  uint64_t v47 = *(void (**)(char *, uint64_t))(v40 + 8);
  v47(v42, v43);
  sub_1DADEC578(v44, type metadata accessor for Dividers);
  return ((uint64_t (*)(char *, uint64_t))v47)(v39, v43);
}

uint64_t sub_1DADE6F30(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v10 = sub_1DADF5D20();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  MEMORY[0x1F4188790](v10);
  uint64_t v13 = *(uint64_t (**)(uint64_t))(*(void *)a2 + 440);
  uint64_t v14 = swift_retain();
  uint64_t v15 = v13(v14);
  uint64_t result = swift_release();
  if (v15 < 0)
  {
    __break(1u);
  }
  else
  {
    v19[0] = 0;
    v19[1] = v15;
    swift_getKeyPath();
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v10);
    unint64_t v17 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = a1;
    *(void *)(v18 + 24) = a2;
    *(double *)(v18 + 32) = a4;
    *(double *)(v18 + 40) = a5;
    (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v18 + v17, (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8438);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8A68);
    sub_1DADB4C3C();
    sub_1DADAD660(&qword_1EA8F8A60, &qword_1EA8F8A68);
    return sub_1DADF6660();
  }
  return result;
}

uint64_t sub_1DADE7178@<X0>(double *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>, double a7@<D1>)
{
  uint64_t v70 = a4;
  uint64_t v67 = a3;
  uint64_t v66 = a2;
  uint64_t v78 = a5;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8A88);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8A90) - 8;
  MEMORY[0x1F4188790](v73);
  uint64_t v71 = (uint64_t)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8A98) - 8;
  MEMORY[0x1F4188790](v75);
  uint64_t v74 = (uint64_t)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8AA0) - 8;
  uint64_t v15 = MEMORY[0x1F4188790](v77);
  unint64_t v17 = (char *)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v15);
  uint64_t v76 = (uint64_t)&v66 - v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1F4188790](v19 - 8);
  double v21 = (char *)&v66 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = type metadata accessor for AdjustedDeviceGlyph(0);
  uint64_t v23 = MEMORY[0x1F4188790](v22 - 8);
  uint64_t v72 = (uint64_t)&v66 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v23);
  uint64_t v69 = (uint64_t *)((char *)&v66 - v25);
  double v68 = *a1;
  double v26 = v68;
  type metadata accessor for AvocadoViewModel();
  sub_1DADF07B4(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  long long v84 = *(_OWORD *)&v83[3];
  *(void *)&long long v85 = v83[5];
  double v79 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8AA8);
  sub_1DADAD660(&qword_1EA8F8AB0, &qword_1EB682F80);
  sub_1DADF6650();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  long long v86 = v82;
  *(_OWORD *)uint64_t v87 = *(_OWORD *)v83;
  *(_DWORD *)&v87[15] = *(_DWORD *)((char *)&v83[1] + 7);
  long long v84 = v80;
  long long v85 = v81;
  uint64_t v27 = v66;
  uint64_t v28 = v67;
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  sub_1DADF5D10();
  double v30 = v29 * a6;
  double v31 = *(double *)sub_1DADF3C50();
  double v32 = *(double *)sub_1DADF3C68();
  double v33 = *(double *)sub_1DADF3C7C();
  uint64_t v34 = (double *)sub_1DADF3C90();
  uint64_t v35 = v69;
  sub_1DADE65F8((uint64_t)&v84, (uint64_t)v21, 1, v69, a7, v30, v31, v32, v33, *v34);
  *(void *)uint64_t v12 = sub_1DADF6120();
  *((void *)v12 + 1) = 0;
  v12[16] = 0;
  uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8AB8);
  sub_1DADE78AC(v27, v28, v68, (uint64_t)&v12[*(int *)(v36 + 44)], a7);
  LOBYTE(a1) = sub_1DADF6250();
  sub_1DADF5BE0();
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  uint64_t v45 = v71;
  sub_1DADAE0AC((uint64_t)v12, v71, &qword_1EA8F8A88);
  uint64_t v46 = v45 + *(int *)(v73 + 44);
  *(unsigned char *)uint64_t v46 = (_BYTE)a1;
  *(void *)(v46 + 8) = v38;
  *(void *)(v46 + 16) = v40;
  *(void *)(v46 + 24) = v42;
  *(void *)(v46 + 32) = v44;
  *(unsigned char *)(v46 + 40) = 0;
  sub_1DADADF3C((uint64_t)v12, &qword_1EA8F8A88);
  LOBYTE(v12) = sub_1DADF6270();
  sub_1DADF5BE0();
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  uint64_t v54 = v53;
  uint64_t v55 = v74;
  sub_1DADAE0AC(v45, v74, &qword_1EA8F8A90);
  uint64_t v56 = v55 + *(int *)(v75 + 44);
  *(unsigned char *)uint64_t v56 = (_BYTE)v12;
  *(void *)(v56 + 8) = v48;
  *(void *)(v56 + 16) = v50;
  *(void *)(v56 + 24) = v52;
  *(void *)(v56 + 32) = v54;
  *(unsigned char *)(v56 + 40) = 0;
  sub_1DADADF3C(v45, &qword_1EA8F8A90);
  sub_1DADF66D0();
  sub_1DADF5CC0();
  sub_1DADAE0AC(v55, (uint64_t)v17, &qword_1EA8F8A98);
  long long v57 = &v17[*(int *)(v77 + 44)];
  long long v58 = v81;
  *(_OWORD *)long long v57 = v80;
  *((_OWORD *)v57 + 1) = v58;
  *((_OWORD *)v57 + 2) = v82;
  sub_1DADADF3C(v55, &qword_1EA8F8A98);
  uint64_t v59 = v76;
  sub_1DADADF98((uint64_t)v17, v76, &qword_1EA8F8AA0);
  uint64_t v60 = (uint64_t)v35;
  uint64_t v61 = (uint64_t)v35;
  uint64_t v62 = v72;
  sub_1DADEC510(v60, v72, type metadata accessor for AdjustedDeviceGlyph);
  sub_1DADAE0AC(v59, (uint64_t)v17, &qword_1EA8F8AA0);
  uint64_t v63 = v78;
  sub_1DADEC510(v62, v78, type metadata accessor for AdjustedDeviceGlyph);
  uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8AC0);
  sub_1DADAE0AC((uint64_t)v17, v63 + *(int *)(v64 + 48), &qword_1EA8F8AA0);
  sub_1DADADF3C(v59, &qword_1EA8F8AA0);
  sub_1DADEC578(v61, type metadata accessor for AdjustedDeviceGlyph);
  sub_1DADADF3C((uint64_t)v17, &qword_1EA8F8AA0);
  return sub_1DADEC578(v62, type metadata accessor for AdjustedDeviceGlyph);
}

uint64_t sub_1DADE78AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, double a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  double v56 = a3;
  uint64_t v62 = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8AC8);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v59 = (uint64_t *)&v46[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8AD0);
  uint64_t v12 = MEMORY[0x1F4188790](v11 - 8);
  uint64_t v60 = &v46[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v12);
  uint64_t v61 = &v46[-v14];
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1F4188790](v15 - 8);
  uint64_t v55 = &v46[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = type metadata accessor for AdjustedNameLabel(0);
  uint64_t v18 = v17 - 8;
  MEMORY[0x1F4188790](v17);
  uint64_t v20 = (uint64_t *)&v46[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8AD8);
  uint64_t v22 = MEMORY[0x1F4188790](v21 - 8);
  long long v57 = &v46[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v22);
  long long v58 = &v46[-v24];
  uint64_t v52 = type metadata accessor for AvocadoViewModel();
  sub_1DADF07B4(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
  uint64_t v53 = a1;
  uint64_t v54 = a2;
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  uint64_t v64 = v76;
  uint64_t v65 = v77;
  uint64_t v66 = v78;
  double v63 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8AA8);
  sub_1DADAD660(&qword_1EA8F8AB0, &qword_1EB682F80);
  sub_1DADF6650();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  long long v51 = v67;
  uint64_t v25 = v68;
  uint64_t v26 = v69;
  uint64_t v27 = v70;
  long long v50 = v71;
  uint64_t v28 = v72;
  int v49 = v73;
  int v48 = v74;
  int v47 = v75;
  sub_1DADF5D50();
  swift_getKeyPath();
  uint64_t v29 = (uint64_t)v55;
  sub_1DADF5D60();
  swift_release();
  swift_release();
  uint64_t *v20 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  swift_storeEnumTagMultiPayload();
  double v30 = (char *)v20 + *(int *)(v18 + 28);
  *(_OWORD *)double v30 = v51;
  *((void *)v30 + 2) = v25;
  *((void *)v30 + 3) = v26;
  *((void *)v30 + 4) = v27;
  *(_OWORD *)(v30 + 40) = v50;
  *((void *)v30 + 7) = v28;
  v30[64] = v49;
  v30[65] = v48;
  v30[66] = v47;
  sub_1DADADF98(v29, (uint64_t)v20 + *(int *)(v18 + 32), &qword_1EB682B88);
  uint64_t v31 = sub_1DADF66D0();
  double v32 = v57;
  sub_1DADE7F5C(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v57, 0.0, 1, INFINITY, 0, v31, v33, (uint64_t)type metadata accessor for AdjustedNameLabel, (void (*)(uint64_t, uint64_t, uint64_t))sub_1DADEC510, &qword_1EA8F8AD8);
  sub_1DADEC578((uint64_t)v20, type metadata accessor for AdjustedNameLabel);
  uint64_t v34 = v58;
  sub_1DADADF98((uint64_t)v32, (uint64_t)v58, &qword_1EA8F8AD8);
  uint64_t v35 = sub_1DADF6050();
  uint64_t v36 = (uint64_t)v59;
  uint64_t *v59 = v35;
  *(void *)(v36 + 8) = 0x4024000000000000;
  *(unsigned char *)(v36 + 16) = 0;
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8AE0);
  sub_1DADE8140(v53, v54, v56, v36 + *(int *)(v37 + 44), a5);
  uint64_t v38 = sub_1DADF66D0();
  uint64_t v39 = v60;
  sub_1DADE7F5C(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v60, 0.0, 1, INFINITY, 0, v38, v40, (uint64_t)&qword_1EA8F8AC8, (void (*)(uint64_t, uint64_t, uint64_t))sub_1DADAE0AC, &qword_1EA8F8AD0);
  sub_1DADADF3C(v36, &qword_1EA8F8AC8);
  uint64_t v41 = v61;
  sub_1DADADF98((uint64_t)v39, (uint64_t)v61, &qword_1EA8F8AD0);
  sub_1DADAE0AC((uint64_t)v34, (uint64_t)v32, &qword_1EA8F8AD8);
  uint64_t v42 = (uint64_t)v39;
  sub_1DADAE0AC((uint64_t)v41, (uint64_t)v39, &qword_1EA8F8AD0);
  uint64_t v43 = v62;
  sub_1DADAE0AC((uint64_t)v32, v62, &qword_1EA8F8AD8);
  uint64_t v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8AE8);
  sub_1DADAE0AC(v42, v43 + *(int *)(v44 + 48), &qword_1EA8F8AD0);
  sub_1DADADF3C((uint64_t)v41, &qword_1EA8F8AD0);
  sub_1DADADF3C((uint64_t)v34, &qword_1EA8F8AD8);
  sub_1DADADF3C(v42, &qword_1EA8F8AD0);
  return sub_1DADADF3C((uint64_t)v32, &qword_1EA8F8AD8);
}

__n128 sub_1DADE7F5C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, void (*a17)(uint64_t, uint64_t, uint64_t), uint64_t *a18)
{
  uint64_t v20 = a17;
  uint64_t v21 = a18;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  int v24 = a8 & 1;
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (v24) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_1DADF69F0();
    uint64_t v31 = (void *)sub_1DADF6200();
    sub_1DADF5AA0();

    uint64_t v21 = a18;
    uint64_t v20 = a17;
  }
  sub_1DADF5E40();
  v20(v18, a9, a16);
  double v32 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v21) + 36));
  v32[4] = v38;
  v32[5] = v39;
  v32[6] = v40;
  _OWORD *v32 = v34;
  v32[1] = v35;
  __n128 result = v37;
  v32[2] = v36;
  v32[3] = v37;
  return result;
}

uint64_t sub_1DADE8140@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, double a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  double v50 = a3;
  uint64_t v52 = a4;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1F4188790](v9 - 8);
  int v48 = &v36[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = type metadata accessor for AdjustedPercentChargeLabel(0);
  uint64_t v12 = v11 - 8;
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  int v49 = (uint64_t *)&v36[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v13);
  long long v51 = &v36[-v15];
  uint64_t v45 = type metadata accessor for AvocadoViewModel();
  sub_1DADF07B4(&qword_1EB682610, (void (*)(uint64_t))type metadata accessor for AvocadoViewModel);
  uint64_t v43 = a1;
  uint64_t v44 = a2;
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  uint64_t v54 = v66;
  uint64_t v55 = v67;
  uint64_t v56 = v68;
  double v53 = a3;
  uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8AA8);
  uint64_t v46 = sub_1DADAD660(&qword_1EA8F8AB0, &qword_1EB682F80);
  sub_1DADF6650();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  long long v42 = v57;
  double v16 = v58;
  uint64_t v17 = v59;
  uint64_t v18 = v60;
  long long v41 = v61;
  uint64_t v40 = v62;
  int v39 = v63;
  int v38 = v64;
  int v37 = v65;
  sub_1DADF5D50();
  swift_getKeyPath();
  uint64_t v19 = (uint64_t)v48;
  sub_1DADF5D60();
  swift_release();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v21 = (uint64_t)v49;
  uint64_t *v49 = KeyPath;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  swift_storeEnumTagMultiPayload();
  uint64_t v22 = v21 + *(int *)(v12 + 28);
  *(_OWORD *)uint64_t v22 = v42;
  *(double *)(v22 + 16) = v16;
  *(void *)(v22 + 24) = v17;
  *(void *)(v22 + 32) = v18;
  *(_OWORD *)(v22 + 40) = v41;
  *(void *)(v22 + 56) = v40;
  *(unsigned char *)(v22 + 64) = v39;
  *(unsigned char *)(v22 + 65) = v38;
  *(unsigned char *)(v22 + 66) = v37;
  sub_1DADADF98(v19, v21 + *(int *)(v12 + 32), &qword_1EB682B88);
  uint64_t v23 = v51;
  sub_1DADEC86C(v21, (uint64_t)v51, type metadata accessor for AdjustedPercentChargeLabel);
  sub_1DADF5D50();
  swift_getKeyPath();
  sub_1DADF5D60();
  swift_release();
  swift_release();
  uint64_t v54 = v66;
  uint64_t v55 = v67;
  uint64_t v56 = v68;
  double v53 = v50;
  sub_1DADF6650();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v43 = *((void *)&v57 + 1);
  uint64_t v44 = v57;
  uint64_t v24 = v59;
  double v50 = v58;
  uint64_t v25 = v60;
  int v48 = (unsigned char *)*((void *)&v61 + 1);
  uint64_t v26 = v61;
  uint64_t v27 = v62;
  LODWORD(v47) = v63;
  LODWORD(v46) = v64;
  LODWORD(v45) = v65;
  double v53 = a5;
  sub_1DADF65D0();
  uint64_t v28 = v54;
  uint64_t v29 = v55;
  LOBYTE(v53) = 1;
  sub_1DADF65D0();
  LOBYTE(v12) = v54;
  uint64_t v30 = v55;
  sub_1DADEC510((uint64_t)v23, v21, type metadata accessor for AdjustedPercentChargeLabel);
  uint64_t v31 = v52;
  sub_1DADEC510(v21, v52, type metadata accessor for AdjustedPercentChargeLabel);
  uint64_t v32 = v31 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8AF0) + 48);
  uint64_t v33 = v43;
  *(void *)uint64_t v32 = v44;
  *(void *)(v32 + 8) = v33;
  *(double *)(v32 + 16) = v50;
  *(void *)(v32 + 24) = v24;
  *(void *)(v32 + 32) = v25;
  long long v34 = v48;
  *(void *)(v32 + 40) = v26;
  *(void *)(v32 + 48) = v34;
  *(void *)(v32 + 56) = v27;
  *(unsigned char *)(v32 + 64) = v47;
  *(unsigned char *)(v32 + 65) = v46;
  *(unsigned char *)(v32 + 66) = v45;
  *(void *)(v32 + 72) = v28;
  *(void *)(v32 + 80) = v29;
  *(unsigned char *)(v32 + 88) = v12;
  *(void *)(v32 + 96) = v30;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1DADEC578((uint64_t)v23, type metadata accessor for AdjustedPercentChargeLabel);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return sub_1DADEC578(v21, type metadata accessor for AdjustedPercentChargeLabel);
}

uint64_t sub_1DADE8794@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v6 = sub_1DADF66D0();
  uint64_t v8 = v7;
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v4;
  v9[3] = v3;
  v9[4] = v5;
  *a1 = v6;
  a1[1] = v8;
  a1[2] = (uint64_t)sub_1DADE8860;
  a1[3] = (uint64_t)v9;

  return swift_retain();
}

uint64_t sub_1DADE8828()
{
  swift_release();

  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1DADE8860@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_1DADE69C4(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2, *(double *)(v2 + 32));
}

uint64_t type metadata accessor for Dividers(uint64_t a1)
{
  return sub_1DADAD54C(a1, qword_1EA8F9510);
}

uint64_t sub_1DADE888C()
{
  uint64_t v0 = sub_1DADF6170();
  MEMORY[0x1F4188790](v0);
  type metadata accessor for Dividers(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8C48);
  sub_1DADF65E0();
  sub_1DADF6110();
  sub_1DADF07B4(&qword_1EA8F8A48, MEMORY[0x1E4F3D910]);
  sub_1DADF6C00();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8C50);
  sub_1DADEC67C(&qword_1EA8F8C58, &qword_1EA8F8C50, &qword_1EA8F8C60, &qword_1EA8F8C68);
  return sub_1DADF6730();
}

uint64_t sub_1DADE8A20(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Dividers(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  long long v8 = *(_OWORD *)(a1 + *(int *)(MEMORY[0x1F4188790](v2 - 8) + 40));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8C70);
  uint64_t result = sub_1DADF65E0();
  if (__OFSUB__(v9, 1))
  {
    __break(1u);
  }
  else if (((v9 - 1) & 0x8000000000000000) == 0)
  {
    *(void *)&long long v8 = 0;
    *((void *)&v8 + 1) = v9 - 1;
    swift_getKeyPath();
    sub_1DADEC510(a1, (uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for Dividers);
    unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    uint64_t v7 = swift_allocObject();
    sub_1DADEC86C((uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, type metadata accessor for Dividers);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8438);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8C68);
    sub_1DADB4C3C();
    sub_1DADAD660(&qword_1EA8F8C60, &qword_1EA8F8C68);
    return sub_1DADF6660();
  }
  __break(1u);
  return result;
}

double sub_1DADE8C1C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1DADF5C00();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  long long v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v39 - v9;
  uint64_t v48 = sub_1DADF6110();
  uint64_t v46 = type metadata accessor for Dividers(0);
  uint64_t v11 = *(int *)(v46 + 28);
  uint64_t v47 = a1;
  uint64_t v12 = (uint64_t *)(a1 + v11);
  uint64_t v13 = *v12;
  uint64_t v14 = v12[1];
  uint64_t v63 = v13;
  uint64_t v64 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F86C8);
  sub_1DADF65E0();
  double v15 = v77;
  sub_1DADF66D0();
  if (v15 > INFINITY)
  {
    sub_1DADF69F0();
    double v16 = (void *)sub_1DADF6200();
    sub_1DADF5AA0();
  }
  sub_1DADF5E40();
  uint64_t v45 = v63;
  uint64_t v17 = v65;
  uint64_t v44 = v67;
  uint64_t v43 = v69;
  uint64_t v42 = v71;
  uint64_t v41 = v73;
  uint64_t v40 = v75;
  uint64_t v39 = v76;
  char v62 = 1;
  char v60 = v64;
  char v58 = v66;
  char v56 = v68;
  char v54 = v70;
  char v52 = v72;
  char v50 = v74;
  id v18 = objc_msgSend(self, sel_labelColor);
  MEMORY[0x1E01818F0](v18);
  uint64_t v19 = v47;
  sub_1DADEB54C(&qword_1EB682F68, MEMORY[0x1E4F3C5D0], 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v10);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v8, *MEMORY[0x1E4F3C5B8], v4);
  sub_1DADF5BF0();
  uint64_t v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  v20(v8, v4);
  v20(v10, v4);
  uint64_t v21 = sub_1DADF64E0();
  swift_release();
  uint64_t v22 = v19 + *(int *)(v46 + 20);
  uint64_t v23 = *(void *)v22;
  char v24 = *(unsigned char *)(v22 + 8);
  sub_1DADAB7C8(*(void *)v22, v24);
  sub_1DADEB36C(v23, v24);
  sub_1DADABA40(v23, v24);
  sub_1DADF66D0();
  sub_1DADF5CC0();
  double v25 = v77;
  char v26 = v78;
  uint64_t v27 = v79;
  char v28 = v80;
  char v29 = v62;
  *(_DWORD *)(a2 + 17) = *(_DWORD *)v61;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)&v61[3];
  char v30 = v60;
  *(_DWORD *)(a2 + 33) = *(_DWORD *)v59;
  *(_DWORD *)(a2 + 36) = *(_DWORD *)&v59[3];
  char v31 = v58;
  *(_DWORD *)(a2 + 49) = *(_DWORD *)v57;
  *(_DWORD *)(a2 + 52) = *(_DWORD *)&v57[3];
  char v32 = v56;
  *(_DWORD *)(a2 + 65) = *(_DWORD *)v55;
  *(_DWORD *)(a2 + 68) = *(_DWORD *)&v55[3];
  char v33 = v54;
  *(_DWORD *)(a2 + 81) = *(_DWORD *)v53;
  *(_DWORD *)(a2 + 84) = *(_DWORD *)&v53[3];
  char v34 = v52;
  *(_DWORD *)(a2 + 97) = *(_DWORD *)v51;
  *(_DWORD *)(a2 + 100) = *(_DWORD *)&v51[3];
  char v35 = v50;
  int v36 = *(_DWORD *)v49;
  *(_DWORD *)(a2 + 116) = *(_DWORD *)&v49[3];
  *(_DWORD *)(a2 + 113) = v36;
  *(void *)a2 = v48;
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = v29;
  *(void *)(a2 + 24) = v45;
  *(unsigned char *)(a2 + 32) = v30;
  *(void *)(a2 + 40) = v17;
  *(unsigned char *)(a2 + 48) = v31;
  *(void *)(a2 + 56) = v44;
  *(unsigned char *)(a2 + 64) = v32;
  *(void *)(a2 + 72) = v43;
  *(unsigned char *)(a2 + 80) = v33;
  *(void *)(a2 + 88) = v42;
  *(unsigned char *)(a2 + 96) = v34;
  *(void *)(a2 + 104) = v41;
  *(unsigned char *)(a2 + 112) = v35;
  uint64_t v37 = v39;
  *(void *)(a2 + 120) = v40;
  *(void *)(a2 + 128) = v37;
  *(void *)(a2 + 136) = v21;
  *(_WORD *)(a2 + 144) = 256;
  *(double *)(a2 + 152) = v25;
  *(unsigned char *)(a2 + 160) = v26;
  *(void *)(a2 + 168) = v27;
  *(unsigned char *)(a2 + 176) = v28;
  double result = *(double *)&v81;
  *(_OWORD *)(a2 + 184) = v81;
  return result;
}

double sub_1DADE91C4()
{
  uint64_t v0 = sub_1DADF5D80();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AdjustedDeviceGlyph(0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1E0181A90]();
  char v5 = sub_1DADF333C();
  uint64_t v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v3, v0);
  MEMORY[0x1E0181A90](v4);
  sub_1DADF333C();
  v6(v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  sub_1DADF5C70();
  double v7 = 23.5;
  if ((v5 & 1) == 0) {
    double v7 = 8.0;
  }
  double v8 = v7 + v13;
  double v9 = (v7 + v13) / 100.0;
  BOOL v10 = v8 <= 65.0;
  double result = 0.65;
  if (v10) {
    return v9;
  }
  return result;
}

double sub_1DADE9378()
{
  uint64_t v0 = sub_1DADF5D80();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AdjustedDeviceGlyph(0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  MEMORY[0x1E0181A90]();
  HIDWORD(v11) = sub_1DADF333C();
  char v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v5(v3, v0);
  MEMORY[0x1E0181A90](v4);
  char v6 = sub_1DADF333C();
  v5(v3, v0);
  MEMORY[0x1E0181A90](v4);
  sub_1DADF333C();
  v5(v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  sub_1DADF5C70();
  double v7 = 45.0;
  if (v6) {
    double v7 = 50.0;
  }
  double v8 = 8.0;
  if ((v11 & 0x100000000) != 0) {
    double v8 = 8.5;
  }
  double v9 = v8 + v12;
  if (v7 < v8 + v12) {
    double v9 = v7;
  }
  return v9 / 100.0;
}

uint64_t *sub_1DADE9560()
{
  uint64_t v37 = sub_1DADF6110();
  uint64_t v36 = sub_1DADF6110();
  sub_1DADE99B4(v0, (uint64_t)&v67);
  uint64_t v35 = *((void *)&v67 + 1);
  uint64_t v40 = *((void *)&v68 + 1);
  uint64_t v41 = v68;
  uint64_t v38 = v67;
  uint64_t v39 = v69;
  char v1 = BYTE8(v69);
  sub_1DADE91C4();
  uint64_t v2 = (int *)type metadata accessor for AdjustedDeviceGlyph(0);
  uint64_t v3 = (uint64_t *)(v0 + v2[9]);
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  *(void *)&long long v67 = v4;
  *((void *)&v67 + 1) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F86C8);
  sub_1DADF65E0();
  sub_1DADE9378();
  char v6 = (uint64_t *)(v0 + v2[7]);
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  *(void *)&long long v67 = v7;
  *((void *)&v67 + 1) = v8;
  sub_1DADF65E0();
  sub_1DADF66D0();
  sub_1DADF5CC0();
  char v9 = BYTE8(v67);
  uint64_t v33 = v68;
  uint64_t v34 = v67;
  char v10 = BYTE8(v68);
  uint64_t v31 = *((void *)&v69 + 1);
  uint64_t v32 = v69;
  char v64 = 1;
  char v63 = 1;
  char v62 = v1;
  char v11 = v1;
  char v61 = BYTE8(v67);
  char v60 = BYTE8(v68);
  double v12 = (uint64_t *)(v0 + v2[9]);
  uint64_t v13 = *v12;
  uint64_t v14 = v12[1];
  *(void *)&long long v67 = v13;
  *((void *)&v67 + 1) = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F86C8);
  sub_1DADF65E0();
  double v15 = (uint64_t *)(v0 + v2[7]);
  uint64_t v16 = *v15;
  uint64_t v17 = v15[1];
  *(void *)&long long v67 = v16;
  *((void *)&v67 + 1) = v17;
  sub_1DADF65E0();
  sub_1DADF66D0();
  sub_1DADF5CC0();
  char v66 = v55;
  char v65 = v57;
  long long v67 = (unint64_t)v37;
  LOBYTE(v68) = 1;
  *((void *)&v68 + 1) = v36;
  *(void *)&long long v69 = 0;
  BYTE8(v69) = 1;
  *(void *)&long long v70 = v38;
  *((void *)&v70 + 1) = v35;
  *(void *)&long long v71 = v41;
  *((void *)&v71 + 1) = v40;
  *(void *)&long long v72 = v39;
  BYTE8(v72) = v1;
  *(void *)&long long v73 = v34;
  BYTE8(v73) = v9;
  *(void *)&long long v74 = v33;
  BYTE8(v74) = v10;
  *(void *)&long long v75 = v32;
  *((void *)&v75 + 1) = v31;
  *(void *)&long long v76 = v54;
  BYTE8(v76) = v55;
  *(void *)&long long v77 = v56;
  BYTE8(v77) = v57;
  long long v78 = v58;
  uint64_t v18 = v0 + v2[5];
  uint64_t v19 = *(void *)(v18 + 16);
  uint64_t v20 = *(void *)(v18 + 24);
  uint64_t v21 = *(void *)(v18 + 32);
  uint64_t v22 = *(void *)(v18 + 56);
  char v23 = *(unsigned char *)(v18 + 64);
  char v24 = *(unsigned char *)(v18 + 65);
  char v25 = *(unsigned char *)(v18 + 66);
  long long v42 = *(_OWORD *)v18;
  *(void *)&long long v43 = v19;
  *((void *)&v43 + 1) = v20;
  *(void *)uint64_t v44 = v21;
  *(_OWORD *)&v44[8] = *(_OWORD *)(v18 + 40);
  *(void *)&v44[24] = v22;
  LOBYTE(v45) = v23;
  BYTE1(v45) = v24;
  BYTE2(v45) = v25;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8B68);
  MEMORY[0x1E0181A90](v59, v26);
  BOOL v27 = sub_1DADB0E24();
  sub_1DADEFBE0((uint64_t)v59);
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8BF8);
  unint64_t v29 = sub_1DADEFF54();
  sub_1DADF0ACC(v27, v28, v29, (uint64_t)&v42);
  sub_1DADEFFF4(v38, v35, v41, v40, v39, v11);
  long long v77 = v51;
  long long v78 = v52;
  long long v73 = v47;
  long long v74 = v48;
  long long v75 = v49;
  long long v76 = v50;
  long long v69 = *(_OWORD *)v44;
  long long v70 = *(_OWORD *)&v44[16];
  long long v71 = v45;
  long long v72 = v46;
  long long v67 = v42;
  long long v68 = v43;
  char v79 = v53;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8C18);
  sub_1DADEFE2C(&qword_1EA8F8C20, &qword_1EA8F8C18, (void (*)(void))sub_1DADF0058, (void (*)(void))sub_1DADEFF54);
  sub_1DADF63E0();
  return sub_1DADF0128((uint64_t *)&v67);
}

double sub_1DADE99B4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_1DADF6790();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  uint64_t v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  char v10 = (char *)v36 - v9;
  uint64_t v11 = sub_1DADF6510();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  uint64_t v14 = (char *)v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(int *)(type metadata accessor for AdjustedDeviceGlyph(0) + 20);
  v36[1] = a1;
  uint64_t v16 = (long long *)(a1 + v15);
  uint64_t v17 = *((void *)v16 + 2);
  uint64_t v18 = *((void *)v16 + 3);
  uint64_t v19 = *((void *)v16 + 4);
  uint64_t v20 = *((void *)v16 + 7);
  char v21 = *((unsigned char *)v16 + 64);
  char v22 = *((unsigned char *)v16 + 65);
  char v23 = *((unsigned char *)v16 + 66);
  long long v37 = *v16;
  *(void *)&long long v38 = v17;
  *((void *)&v38 + 1) = v18;
  uint64_t v39 = v19;
  long long v40 = *(long long *)((char *)v16 + 40);
  uint64_t v41 = v20;
  char v42 = v21;
  char v43 = v22;
  char v44 = v23;
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8B68);
  MEMORY[0x1E0181A90](v45, v24);
  uint64_t v25 = v47;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v25) {
    sub_1DADF6500();
  }
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x1E4F3EBF8], v11);
  uint64_t v26 = sub_1DADF6540();
  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v45[0] = v26;
  v45[1] = 0;
  __int16 v46 = 1;
  sub_1DADEB54C(&qword_1EB682F58, MEMORY[0x1E4F46AE8], 0xD000000000000013, 0x80000001DADFAD40, (uint64_t)v10);
  sub_1DADF6780();
  char v27 = sub_1DADF6770();
  uint64_t v28 = *(void (**)(char *, uint64_t))(v5 + 8);
  v28(v8, v4);
  v28(v10, v4);
  uint64_t v29 = *sub_1DADF3990();
  swift_retain();
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8C38);
  uint64_t v31 = sub_1DADF01B8(&qword_1EA8F8C40, &qword_1EA8F8C38);
  sub_1DADF19B8(v27 & 1, v29, v30, v31, (uint64_t)&v37);
  swift_release();
  swift_release();
  uint64_t v32 = v39;
  char v33 = v40;
  double result = *(double *)&v37;
  long long v35 = v38;
  *(_OWORD *)a2 = v37;
  *(_OWORD *)(a2 + 16) = v35;
  *(void *)(a2 + 32) = v32;
  *(unsigned char *)(a2 + 40) = v33;
  return result;
}

uint64_t sub_1DADE9D34@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v59 = a1;
  uint64_t v58 = sub_1DADF6790();
  uint64_t v57 = *(void *)(v58 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v58);
  char v55 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  uint64_t v54 = (uint64_t)&v52 - v4;
  uint64_t v5 = *(int *)(type metadata accessor for AdjustedNameLabel(0) + 20);
  uint64_t v56 = v1;
  uint64_t v6 = (uint64_t *)(v1 + v5);
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  uint64_t v9 = v6[2];
  uint64_t v10 = v6[3];
  uint64_t v11 = v6[4];
  uint64_t v12 = v6[5];
  uint64_t v13 = v6[6];
  uint64_t v14 = v6[7];
  char v15 = *((unsigned char *)v6 + 64);
  int v16 = *((unsigned __int8 *)v6 + 65);
  LODWORD(v6) = *((unsigned __int8 *)v6 + 66);
  *(void *)&long long v64 = v7;
  *((void *)&v64 + 1) = v8;
  *(void *)&long long v65 = v9;
  *((void *)&v65 + 1) = v10;
  *(void *)&long long v66 = v11;
  *((void *)&v66 + 1) = v12;
  *(void *)&long long v67 = v13;
  *((void *)&v67 + 1) = v14;
  LOBYTE(v68) = v15;
  int v53 = v16;
  BYTE1(v68) = v16;
  int v52 = (int)v6;
  BYTE2(v68) = (_BYTE)v6;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8B68);
  MEMORY[0x1E0181A90](v71);
  BOOL v18 = sub_1DADB0E24();
  sub_1DADEFBE0((uint64_t)v71);
  if (v18)
  {
    sub_1DADF60B0();
    *(void *)&long long v60 = sub_1DADF6340();
    *((void *)&v60 + 1) = v20;
    *(void *)&long long v61 = v19 & 1;
    *((void *)&v61 + 1) = v21;
    long long v62 = 0u;
    memset(v63, 0, 26);
  }
  else
  {
    *(void *)&long long v64 = v7;
    *((void *)&v64 + 1) = v8;
    *(void *)&long long v65 = v9;
    *((void *)&v65 + 1) = v10;
    *(void *)&long long v66 = v11;
    *((void *)&v66 + 1) = v12;
    *(void *)&long long v67 = v13;
    *((void *)&v67 + 1) = v14;
    LOBYTE(v68) = v15;
    BYTE1(v68) = v53;
    BYTE2(v68) = v52;
    MEMORY[0x1E0181A90](&v60, v17);
    long long v27 = v60;
    swift_bridgeObjectRelease();
    swift_release();
    long long v64 = v27;
    sub_1DADBE16C();
    uint64_t v28 = sub_1DADF6350();
    uint64_t v30 = v29;
    char v32 = v31 & 1;
    sub_1DADF6290();
    uint64_t v33 = sub_1DADF6330();
    uint64_t v35 = v34;
    char v37 = v36;
    uint64_t v39 = v38;
    swift_release();
    sub_1DADBE1C0(v28, v30, v32);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    *(void *)&long long v60 = v33;
    *((void *)&v60 + 1) = v35;
    LOBYTE(v61) = v37 & 1;
    *((void *)&v61 + 1) = v39;
    *(void *)&long long v62 = KeyPath;
    *((void *)&v62 + 1) = 1;
    LOBYTE(v63[0]) = 0;
    uint64_t v41 = v54;
    sub_1DADEB54C(&qword_1EB682F58, MEMORY[0x1E4F46AE8], 0xD000000000000013, 0x80000001DADFAD40, v54);
    char v42 = v55;
    sub_1DADF6780();
    LOBYTE(v28) = sub_1DADF6770();
    char v43 = *(void (**)(char *, uint64_t))(v57 + 8);
    char v44 = v42;
    uint64_t v45 = v58;
    v43(v44, v58);
    v43((char *)v41, v45);
    uint64_t v46 = *sub_1DADF3990();
    swift_retain();
    uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8BC8);
    unint64_t v48 = sub_1DADEFD8C();
    sub_1DADF19B8(v28 & 1, v46, v47, v48, (uint64_t)&v64);
    swift_release();
    sub_1DADBE1C0(v60, *((uint64_t *)&v60 + 1), v61);
    swift_bridgeObjectRelease();
    swift_release();
    long long v60 = v64;
    long long v61 = v65;
    long long v62 = v66;
    v63[0] = v67;
    *(void *)&v63[1] = v68;
    BYTE8(v63[1]) = v69;
    BYTE9(v63[1]) = 1;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8BD8);
  sub_1DADEFE2C(&qword_1EA8F8BE0, &qword_1EA8F8BD8, (void (*)(void))sub_1DADEFEB4, (void (*)(void))sub_1DADEFD8C);
  uint64_t result = sub_1DADF6140();
  long long v23 = v65;
  long long v24 = v66;
  long long v25 = v67;
  uint64_t v26 = v68;
  char v49 = v69;
  char v50 = v70;
  long long v51 = v59;
  _OWORD *v59 = v64;
  v51[1] = v23;
  void v51[2] = v24;
  v51[3] = v25;
  *((void *)v51 + 8) = v26;
  *((unsigned char *)v51 + 72) = v49;
  *((unsigned char *)v51 + 73) = v50;
  return result;
}

uint64_t sub_1DADEA32C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v98 = a1;
  uint64_t v94 = sub_1DADF6790();
  uint64_t v93 = *(void *)(v94 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v94);
  long long v91 = (char *)&v72 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  uint64_t v90 = (uint64_t)&v72 - v4;
  uint64_t v81 = sub_1DADF61B0();
  MEMORY[0x1F4188790](v81);
  long long v85 = (char *)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_1DADF5E80();
  uint64_t v83 = *(void *)(v86 - 8);
  MEMORY[0x1F4188790](v86);
  long long v82 = (char *)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1DADF5A60();
  MEMORY[0x1F4188790](v7 - 8);
  long long v75 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6825F8);
  uint64_t v77 = *(void *)(v78 - 8);
  MEMORY[0x1F4188790](v78);
  long long v76 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8520);
  MEMORY[0x1F4188790](v79);
  char v80 = (char *)&v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8B78);
  MEMORY[0x1F4188790](v88);
  uint64_t v87 = (uint64_t)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8B80);
  uint64_t v12 = MEMORY[0x1F4188790](v97);
  uint64_t v84 = (uint64_t)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v89 = (uint64_t)&v72 - v14;
  uint64_t v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8B88);
  MEMORY[0x1F4188790](v95);
  long long v96 = (uint64_t *)((char *)&v72 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = *(int *)(type metadata accessor for AdjustedPercentChargeLabel(0) + 20);
  uint64_t v92 = v1;
  uint64_t v17 = (double *)(v1 + v16);
  double v18 = *v17;
  double v19 = v17[1];
  uint64_t v21 = *((void *)v17 + 2);
  uint64_t v20 = *((void *)v17 + 3);
  uint64_t v22 = *((void *)v17 + 4);
  uint64_t v24 = *((void *)v17 + 5);
  uint64_t v23 = *((void *)v17 + 6);
  uint64_t v25 = *((void *)v17 + 7);
  char v26 = *((unsigned char *)v17 + 64);
  int v27 = *((unsigned __int8 *)v17 + 65);
  LODWORD(v17) = *((unsigned __int8 *)v17 + 66);
  double v100 = v18;
  double v101 = v19;
  uint64_t v102 = v21;
  uint64_t v103 = v20;
  uint64_t v104 = v22;
  uint64_t v105 = v24;
  uint64_t v106 = v23;
  uint64_t v107 = v25;
  char v108 = v26;
  int v74 = v27;
  char v109 = v27;
  int v73 = (int)v17;
  char v110 = (char)v17;
  uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8B68);
  MEMORY[0x1E0181A90](&v111);
  BOOL v29 = sub_1DADB0E24();
  sub_1DADEFBE0((uint64_t)&v111);
  if (v29)
  {
    sub_1DADF60B0();
    uint64_t v30 = sub_1DADF6340();
    char v31 = v96;
    *long long v96 = v30;
    v31[1] = v32;
    *((unsigned char *)v31 + 16) = v33 & 1;
    v31[3] = v34;
    swift_storeEnumTagMultiPayload();
    sub_1DADEFE2C(&qword_1EA8F8BB0, &qword_1EA8F8B80, (void (*)(void))sub_1DADEFCEC, (void (*)(void))sub_1DADEFC2C);
    return sub_1DADF6140();
  }
  else
  {
    double v100 = v18;
    double v101 = v19;
    uint64_t v102 = v21;
    uint64_t v103 = v20;
    uint64_t v104 = v22;
    uint64_t v105 = v24;
    uint64_t v106 = v23;
    uint64_t v107 = v25;
    char v108 = v26;
    char v109 = v74;
    char v110 = v73;
    MEMORY[0x1E0181A90](v99, v28);
    double v36 = v99[2];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    v99[0] = sub_1DADF3650(v36);
    sub_1DADF5A50();
    sub_1DADB2BCC();
    char v37 = v76;
    sub_1DADF5A40();
    sub_1DADAD660(&qword_1EB6825F0, &qword_1EB6825F8);
    uint64_t v38 = v78;
    sub_1DADF67B0();
    (*(void (**)(char *, uint64_t))(v77 + 8))(v37, v38);
    v99[0] = v100;
    v99[1] = v101;
    sub_1DADBE16C();
    uint64_t v39 = sub_1DADF6350();
    uint64_t v41 = v40;
    char v43 = v42 & 1;
    sub_1DADF62F0();
    uint64_t v44 = sub_1DADF6330();
    uint64_t v46 = v45;
    char v48 = v47;
    uint64_t v50 = v49;
    swift_release();
    char v51 = v48 & 1;
    sub_1DADBE1C0(v39, v41, v43);
    swift_bridgeObjectRelease();
    int v52 = v82;
    sub_1DADF5E60();
    uint64_t v53 = *sub_1DADF3900();
    uint64_t v54 = v83;
    uint64_t v55 = (uint64_t)v85;
    uint64_t v56 = v86;
    (*(void (**)(char *, char *, uint64_t))(v83 + 16))(v85, v52, v86);
    uint64_t v57 = v81;
    *(void *)(v55 + *(int *)(v81 + 20)) = v53;
    *(_DWORD *)(v55 + *(int *)(v57 + 24)) = 0;
    uint64_t v58 = (uint64_t)v80;
    sub_1DADEC510(v55, (uint64_t)&v80[*(int *)(v79 + 36)], MEMORY[0x1E4F3DD90]);
    *(void *)uint64_t v58 = v44;
    *(void *)(v58 + 8) = v46;
    *(unsigned char *)(v58 + 16) = v51;
    *(void *)(v58 + 24) = v50;
    swift_retain();
    sub_1DADBE1D0(v44, v46, v51);
    swift_bridgeObjectRetain();
    sub_1DADEC578(v55, MEMORY[0x1E4F3DD90]);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v52, v56);
    sub_1DADBE1C0(v44, v46, v51);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v60 = v87;
    sub_1DADAE0AC(v58, v87, &qword_1EA8F8520);
    uint64_t v61 = v88;
    uint64_t v62 = v60 + *(int *)(v88 + 36);
    *(void *)uint64_t v62 = KeyPath;
    *(void *)(v62 + 8) = 1;
    *(unsigned char *)(v62 + 16) = 0;
    sub_1DADADF3C(v58, &qword_1EA8F8520);
    uint64_t v63 = v90;
    sub_1DADEB54C(&qword_1EB682F58, MEMORY[0x1E4F46AE8], 0xD000000000000013, 0x80000001DADFAD40, v90);
    long long v64 = v91;
    sub_1DADF6780();
    LOBYTE(v56) = sub_1DADF6770();
    long long v65 = *(void (**)(char *, uint64_t))(v93 + 8);
    long long v66 = v64;
    uint64_t v67 = v94;
    v65(v66, v94);
    v65((char *)v63, v67);
    uint64_t v68 = *sub_1DADF3990();
    unint64_t v69 = sub_1DADEFC2C();
    swift_retain();
    uint64_t v70 = v84;
    sub_1DADF19B8(v56 & 1, v68, v61, v69, v84);
    swift_release();
    sub_1DADADF3C(v60, &qword_1EA8F8B78);
    uint64_t v71 = v89;
    sub_1DADADF98(v70, v89, &qword_1EA8F8B80);
    sub_1DADAE0AC(v71, (uint64_t)v96, &qword_1EA8F8B80);
    swift_storeEnumTagMultiPayload();
    sub_1DADEFE2C(&qword_1EA8F8BB0, &qword_1EA8F8B80, (void (*)(void))sub_1DADEFCEC, (void (*)(void))sub_1DADEFC2C);
    sub_1DADF6140();
    return sub_1DADADF3C(v71, &qword_1EA8F8B80);
  }
}

uint64_t sub_1DADEADD0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v56 = a1;
  uint64_t v55 = type metadata accessor for BCUIBatteryGlyphView(0);
  MEMORY[0x1F4188790](v55);
  uint64_t v54 = (uint64_t)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v4 = v1[1];
  long long v5 = v1[3];
  unsigned long long v77 = v1[2];
  v78[0] = v5;
  long long v6 = v1[1];
  long long v75 = *v1;
  long long v76 = v6;
  long long v7 = v1[3];
  unsigned long long v69 = v77;
  v70[0] = v7;
  *(_DWORD *)((char *)v78 + 15) = *(_DWORD *)((char *)v1 + 63);
  *(_DWORD *)((char *)v70 + 15) = *(_DWORD *)((char *)v1 + 63);
  long long v67 = v75;
  long long v68 = v4;
  uint64_t v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8B68);
  sub_1DADF6640();
  long long v8 = v71;
  uint64_t v52 = *((void *)&v71 + 1);
  uint64_t v53 = v71;
  uint64_t v9 = *((void *)&v72 + 1);
  uint64_t v51 = v72;
  unsigned long long v10 = v73;
  long long v11 = v74[0];
  LODWORD(v50) = LOBYTE(v74[1]);
  char v12 = BYTE1(v74[1]);
  LODWORD(v49) = BYTE2(v74[1]);
  swift_getKeyPath();
  long long v71 = v8;
  *(void *)&long long v72 = v51;
  *((void *)&v72 + 1) = v9;
  unsigned long long v73 = v10;
  v74[0] = v11;
  LOBYTE(v74[1]) = v50;
  BYTE1(v74[1]) = v12;
  BYTE2(v74[1]) = v49;
  sub_1DADF6630();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v52 = v65;
  uint64_t v53 = v64;
  LODWORD(v51) = v66;
  long long v13 = v1[3];
  unsigned long long v69 = v1[2];
  v70[0] = v13;
  *(_DWORD *)((char *)v70 + 15) = *(_DWORD *)((char *)v1 + 63);
  long long v14 = v1[1];
  long long v67 = *v1;
  long long v68 = v14;
  sub_1DADF6640();
  long long v15 = v71;
  uint64_t v49 = *((void *)&v71 + 1);
  uint64_t v50 = v71;
  uint64_t v16 = *((void *)&v72 + 1);
  uint64_t v48 = v72;
  unsigned long long v17 = v73;
  long long v18 = v74[0];
  LODWORD(v47) = LOBYTE(v74[1]);
  char v19 = BYTE1(v74[1]);
  LODWORD(v46) = BYTE2(v74[1]);
  swift_getKeyPath();
  long long v71 = v15;
  *(void *)&long long v72 = v48;
  *((void *)&v72 + 1) = v16;
  unsigned long long v73 = v17;
  v74[0] = v18;
  LOBYTE(v74[1]) = v47;
  BYTE1(v74[1]) = v19;
  BYTE2(v74[1]) = v46;
  sub_1DADF6630();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v49 = v62;
  uint64_t v50 = v61;
  double v20 = v63;
  long long v21 = v1[3];
  unsigned long long v69 = v1[2];
  v70[0] = v21;
  *(_DWORD *)((char *)v70 + 15) = *(_DWORD *)((char *)v1 + 63);
  long long v22 = v1[1];
  long long v67 = *v1;
  long long v68 = v22;
  sub_1DADF6640();
  long long v23 = v71;
  uint64_t v47 = *((void *)&v71 + 1);
  uint64_t v48 = v71;
  uint64_t v24 = *((void *)&v72 + 1);
  uint64_t v46 = v72;
  unsigned long long v25 = v73;
  long long v26 = v74[0];
  LODWORD(v45) = LOBYTE(v74[1]);
  char v27 = BYTE1(v74[1]);
  LODWORD(v44) = BYTE2(v74[1]);
  swift_getKeyPath();
  long long v71 = v23;
  *(void *)&long long v72 = v46;
  *((void *)&v72 + 1) = v24;
  unsigned long long v73 = v25;
  v74[0] = v26;
  LOBYTE(v74[1]) = v45;
  BYTE1(v74[1]) = v27;
  BYTE2(v74[1]) = v44;
  sub_1DADF6630();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v47 = v59;
  uint64_t v48 = v58;
  LODWORD(v46) = v60;
  long long v28 = v1[3];
  unsigned long long v69 = v1[2];
  v70[0] = v28;
  *(_DWORD *)((char *)v70 + 15) = *(_DWORD *)((char *)v1 + 63);
  long long v29 = v1[1];
  long long v67 = *v1;
  long long v68 = v29;
  sub_1DADF6640();
  long long v30 = v71;
  uint64_t v44 = *((void *)&v71 + 1);
  uint64_t v45 = v71;
  uint64_t v31 = *((void *)&v72 + 1);
  uint64_t v43 = v72;
  unint64_t v32 = *((void *)&v73 + 1);
  unint64_t v33 = v73;
  long long v34 = v74[0];
  char v35 = BYTE1(v74[1]);
  int v41 = BYTE2(v74[1]);
  int v42 = LOBYTE(v74[1]);
  swift_getKeyPath();
  long long v71 = v30;
  *(void *)&long long v72 = v43;
  *((void *)&v72 + 1) = v31;
  unsigned long long v73 = __PAIR128__(v32, v33);
  v74[0] = v34;
  LOBYTE(v74[1]) = v42;
  BYTE1(v74[1]) = v35;
  BYTE2(v74[1]) = v41;
  uint64_t v36 = v57;
  sub_1DADF6630();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  long long v37 = v67;
  LOBYTE(v31) = v68;
  long long v71 = *(long long *)((char *)v2 + 72);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F86C8);
  sub_1DADF65E0();
  uint64_t v38 = v54;
  sub_1DADAB1D4(v53, v52, v51, v50, v49, v48, v47, v46, v54, v20, v37, *((uint64_t *)&v37 + 1), v31);
  unsigned long long v73 = v77;
  v74[0] = v78[0];
  *(_DWORD *)((char *)v74 + 15) = *(_DWORD *)((char *)v78 + 15);
  long long v71 = v75;
  long long v72 = v76;
  MEMORY[0x1E0181A90](&v67, v36);
  LOBYTE(v32) = sub_1DADB0E24();
  sub_1DADEFBE0((uint64_t)&v67);
  uint64_t v39 = sub_1DADF07B4(&qword_1EA8F8B70, (void (*)(uint64_t))type metadata accessor for BCUIBatteryGlyphView);
  sub_1DADF0ACC(v32 & 1, v55, v39, v56);
  return sub_1DADEC578(v38, type metadata accessor for BCUIBatteryGlyphView);
}

double sub_1DADEB36C(uint64_t a1, char a2)
{
  uint64_t v4 = sub_1DADF6030();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  long long v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2) {
    return *(double *)&a1;
  }
  swift_retain();
  os_log_type_t v8 = sub_1DADF69F0();
  uint64_t v9 = sub_1DADF6200();
  if (os_log_type_enabled(v9, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    double v14 = *(double *)&v11;
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)(v10 + 4) = sub_1DADA5DB0(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v14);
    _os_log_impl(&dword_1DAD96000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1E01829D0](v11, -1, -1);
    MEMORY[0x1E01829D0](v10, -1, -1);
  }

  sub_1DADF6020();
  swift_getAtKeyPath();
  sub_1DADABA40(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_1DADEB54C@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v24 = a4;
  uint64_t v9 = v5;
  uint64_t v11 = sub_1DADF6030();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11);
  double v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x1F4188790](v15);
  unsigned long long v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DADAE0AC(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    os_log_type_t v20 = sub_1DADF69F0();
    long long v21 = sub_1DADF6200();
    if (os_log_type_enabled(v21, v20))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v25 = v23;
      *(_DWORD *)uint64_t v22 = 136315138;
      *(void *)(v22 + 4) = sub_1DADA5DB0(a3, v24, &v25);
      _os_log_impl(&dword_1DAD96000, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1E01829D0](v23, -1, -1);
      MEMORY[0x1E01829D0](v22, -1, -1);
    }

    sub_1DADF6020();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_1DADEB7D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  MEMORY[0x1F4188790]();
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_1DADEB8A4@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_1DADF5ED0();
  *a1 = v3;
  return result;
}

unsigned __int8 *sub_1DADEB8D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1DADF68E0();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    long long v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_1DADEBC34();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    long long v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    long long v7 = (unsigned __int8 *)sub_1DADF6B00();
  }
LABEL_7:
  uint64_t v11 = sub_1DADEB9B8(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_1DADEB9B8(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
            for (double i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
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
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
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
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_1DADEBC34()
{
  unint64_t v0 = sub_1DADF68F0();
  uint64_t v4 = sub_1DADEBCB4(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1DADEBCB4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_1DADEBE0C(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_1DADA6114(v9, 0);
      unint64_t v12 = sub_1DADEBF0C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_1DADF6B00();
LABEL_4:
        JUMPOUT(0x1E0181CD0);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x1E4FBC860];
    }
    uint64_t v13 = MEMORY[0x1E0181CD0](v11 + 4, v11[2]);
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
    return MEMORY[0x1E0181CD0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

uint64_t sub_1DADEBE0C(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_1DADEC120(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_1DADEC120(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return MEMORY[0x1F4183AA8](a1, a2, a3, a4);
  }
  __break(1u);
  return MEMORY[0x1F4183AA8](a1, a2, a3, a4);
}

unint64_t sub_1DADEBF0C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    v9[2] = a6;
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
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_1DADEC120(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_1DADF68C0();
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
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_1DADF6B00();
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
    uint64_t result = sub_1DADEC120(v12, a6, a7);
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
    unint64_t v12 = sub_1DADF6890();
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

uint64_t sub_1DADEC120(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_1DADF68D0();
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
    uint64_t v5 = MEMORY[0x1E0181D20](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_1DADEC19C(double a1)
{
  uint64_t v2 = sub_1DADF6680();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DADF5D10();
  double v7 = v6 * a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8F8A80);
  sub_1DADF6690();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1DADF92C0;
  *(double *)uint64_t v5 = v7;
  uint64_t v9 = *(void (**)(char *, void, uint64_t))(v3 + 104);
  v9(v5, *MEMORY[0x1E4F3EF18], v2);
  sub_1DADF66D0();
  sub_1DADF66A0();
  sub_1DADF5D10();
  *(double *)uint64_t v5 = v7;
  *((void *)v5 + 1) = v10;
  v9(v5, *MEMORY[0x1E4F3EF28], v2);
  sub_1DADF66E0();
  sub_1DADF66A0();
  return v8;
}

uint64_t sub_1DADEC38C()
{
  return sub_1DADE6F30(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 48), *(double *)(v0 + 32), *(double *)(v0 + 40));
}

uint64_t sub_1DADEC39C()
{
  uint64_t v1 = sub_1DADF5D20();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1DADEC468@<X0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(sub_1DADF5D20() - 8);
  uint64_t v6 = *((void *)v2 + 2);
  uint64_t v7 = *((void *)v2 + 3);
  double v8 = v2[4];
  double v9 = v2[5];
  uint64_t v10 = (uint64_t)v2 + ((*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1DADE7178(a1, v6, v7, v10, a2, v8, v9);
}

uint64_t type metadata accessor for AdjustedDeviceGlyph(uint64_t a1)
{
  return sub_1DADAD54C(a1, (uint64_t *)&unk_1EA8F9500);
}

uint64_t sub_1DADEC510(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DADEC578(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for AdjustedNameLabel(uint64_t a1)
{
  return sub_1DADAD54C(a1, (uint64_t *)&unk_1EA8F94F0);
}

uint64_t type metadata accessor for AdjustedPercentChargeLabel(uint64_t a1)
{
  return sub_1DADAD54C(a1, (uint64_t *)&unk_1EA8F94E0);
}

uint64_t sub_1DADEC618()
{
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, 48, 7);
}

uint64_t sub_1DADEC658@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return sub_1DADE5120(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32), a2, *(double *)(v2 + 40));
}

uint64_t sub_1DADEC668@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADE56C4(*(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 56), a1, *(double *)(v1 + 40), *(double *)(v1 + 48));
}

uint64_t sub_1DADEC67C(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    sub_1DADAD660(a3, a4);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DADEC710()
{
  uint64_t v1 = sub_1DADF5D20();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 56) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_1DADEC7E4@<X0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(sub_1DADF5D20() - 8);
  uint64_t v6 = *((void *)v2 + 3);
  uint64_t v7 = *((void *)v2 + 4);
  double v8 = v2[5];
  double v9 = v2[6];
  uint64_t v10 = (uint64_t)v2 + ((*(unsigned __int8 *)(v5 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));

  return sub_1DADE591C(a1, v6, v7, v10, a2, v8, v9);
}

uint64_t sub_1DADEC86C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_1DADEC8D4()
{
  unint64_t result = qword_1EA8F8B38;
  if (!qword_1EA8F8B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8B38);
  }
  return result;
}

uint64_t destroy for AdjustedStaticBatteryImage()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for AdjustedStaticBatteryImage(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  *(unsigned char *)(a1 + 66) = *(unsigned char *)(a2 + 66);
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AdjustedStaticBatteryImage(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  *(unsigned char *)(a1 + 66) = *(unsigned char *)(a2 + 66);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for AdjustedStaticBatteryImage(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  *(unsigned char *)(a1 + 66) = *(unsigned char *)(a2 + 66);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_release();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AdjustedStaticBatteryImage(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 104)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AdjustedStaticBatteryImage(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 104) = 1;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AdjustedStaticBatteryImage()
{
  return &type metadata for AdjustedStaticBatteryImage;
}

uint64_t sub_1DADECD18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t sub_1DADECD30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

uint64_t *sub_1DADECD4C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1DADF6790();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (char *)a1 + v9;
    uint64_t v12 = (char *)a2 + v9;
    uint64_t v13 = *((void *)v12 + 1);
    *(void *)uint64_t v11 = *(void *)v12;
    *((void *)v11 + 1) = v13;
    uint64_t v14 = *((void *)v12 + 3);
    *((void *)v11 + 2) = *((void *)v12 + 2);
    *((void *)v11 + 3) = v14;
    uint64_t v15 = *((void *)v12 + 5);
    *((void *)v11 + 4) = *((void *)v12 + 4);
    *((void *)v11 + 5) = v15;
    uint64_t v16 = *((void *)v12 + 7);
    *((void *)v11 + 6) = *((void *)v12 + 6);
    *((void *)v11 + 7) = v16;
    unsigned char v11[64] = v12[64];
    v11[65] = v12[65];
    v11[66] = v12[66];
    unint64_t v17 = (uint64_t *)((char *)a1 + v10);
    unint64_t v18 = (char *)a2 + v10;
    uint64_t v19 = *(uint64_t *)((char *)a2 + v10 + 8);
    *unint64_t v17 = *(uint64_t *)((char *)a2 + v10);
    v17[1] = v19;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    uint64_t v20 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
    uint64_t v21 = (char *)v17 + v20;
    uint64_t v22 = &v18[v20];
    uint64_t v23 = sub_1DADF5D80();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
  }
  return a1;
}

uint64_t sub_1DADECF50(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1DADF6790();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  swift_release();
  swift_release();
  uint64_t v6 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v7 = sub_1DADF5D80();
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);

  return v8(v6, v7);
}

void *sub_1DADED080(void *a1, void *a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1DADF6790();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v7;
  uint64_t v10 = (char *)a2 + v7;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = *(void *)v10;
  *((void *)v9 + 1) = v11;
  uint64_t v12 = *((void *)v10 + 3);
  *((void *)v9 + 2) = *((void *)v10 + 2);
  *((void *)v9 + 3) = v12;
  uint64_t v13 = *((void *)v10 + 5);
  *((void *)v9 + 4) = *((void *)v10 + 4);
  *((void *)v9 + 5) = v13;
  uint64_t v14 = *((void *)v10 + 7);
  *((void *)v9 + 6) = *((void *)v10 + 6);
  *((void *)v9 + 7) = v14;
  v9[64] = v10[64];
  v9[65] = v10[65];
  v9[66] = v10[66];
  uint64_t v15 = (void *)((char *)a1 + v8);
  uint64_t v16 = (char *)a2 + v8;
  uint64_t v17 = *(void *)((char *)a2 + v8 + 8);
  *uint64_t v15 = *(void *)((char *)a2 + v8);
  v15[1] = v17;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v19 = (char *)v15 + v18;
  uint64_t v20 = &v16[v18];
  uint64_t v21 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  return a1;
}

void *sub_1DADED234(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1DADADF3C((uint64_t)a1, &qword_1EB682F58);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1DADF6790();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  *(void *)((char *)a1 + v7) = *(void *)((char *)a2 + v7);
  swift_retain();
  swift_release();
  *((void *)v8 + 1) = *((void *)v9 + 1);
  swift_retain();
  swift_release();
  *((void *)v8 + 2) = *((void *)v9 + 2);
  *((void *)v8 + 3) = *((void *)v9 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v8 + 4) = *((void *)v9 + 4);
  *((void *)v8 + 5) = *((void *)v9 + 5);
  swift_retain();
  swift_release();
  *((void *)v8 + 6) = *((void *)v9 + 6);
  *((void *)v8 + 7) = *((void *)v9 + 7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[64] = v9[64];
  v8[65] = v9[65];
  v8[66] = v9[66];
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  *(void *)((char *)a1 + v10) = *(void *)((char *)a2 + v10);
  swift_retain();
  swift_release();
  *((void *)v11 + 1) = *((void *)v12 + 1);
  swift_retain();
  swift_release();
  uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v14 = &v11[v13];
  uint64_t v15 = &v12[v13];
  uint64_t v16 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  return a1;
}

char *sub_1DADED458(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1DADF6790();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = &a1[v8];
  uint64_t v11 = &a2[v8];
  long long v12 = *((_OWORD *)v11 + 3);
  *((_OWORD *)v10 + 2) = *((_OWORD *)v11 + 2);
  *((_OWORD *)v10 + 3) = v12;
  *(_DWORD *)(v10 + 63) = *(_DWORD *)(v11 + 63);
  long long v13 = *((_OWORD *)v11 + 1);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
  *((_OWORD *)v10 + 1) = v13;
  uint64_t v14 = &a1[v9];
  uint64_t v15 = &a2[v9];
  uint64_t v16 = *(void *)&a2[v9];
  uint64_t v17 = *(void *)&a2[v9 + 8];
  *(void *)uint64_t v14 = v16;
  *((void *)v14 + 1) = v17;
  uint64_t v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v19 = &v14[v18];
  uint64_t v20 = &v15[v18];
  uint64_t v21 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
  return a1;
}

char *sub_1DADED5A8(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1DADADF3C((uint64_t)a1, &qword_1EB682F58);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1DADF6790();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  swift_release();
  *((void *)v9 + 1) = *((void *)v10 + 1);
  swift_release();
  uint64_t v11 = *((void *)v10 + 3);
  *((void *)v9 + 2) = *((void *)v10 + 2);
  *((void *)v9 + 3) = v11;
  swift_bridgeObjectRelease();
  *((void *)v9 + 4) = *((void *)v10 + 4);
  *((void *)v9 + 5) = *((void *)v10 + 5);
  swift_release();
  uint64_t v12 = *((void *)v10 + 7);
  *((void *)v9 + 6) = *((void *)v10 + 6);
  *((void *)v9 + 7) = v12;
  swift_bridgeObjectRelease();
  v9[64] = v10[64];
  v9[65] = v10[65];
  v9[66] = v10[66];
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  *(void *)&a1[v13] = *(void *)&a2[v13];
  swift_release();
  *((void *)v14 + 1) = *((void *)v15 + 1);
  swift_release();
  uint64_t v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v17 = &v14[v16];
  uint64_t v18 = &v15[v16];
  uint64_t v19 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t sub_1DADED78C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DADED7A0);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_1DADED8DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DADED8F0);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_1DADEDA2C()
{
  sub_1DADE3400(319, (unint64_t *)&qword_1EB683638, MEMORY[0x1E4F46AE8], MEMORY[0x1E4F3C648]);
  if (v0 <= 0x3F)
  {
    sub_1DADE3400(319, &qword_1EB682B90, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3EE18]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

char *sub_1DADEDB5C(char *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1DADF6790();
      (*(void (**)(char *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *(void *)a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    uint64_t v11 = &a1[v9];
    uint64_t v12 = (char *)a2 + v9;
    uint64_t v13 = *((void *)v12 + 1);
    *(void *)uint64_t v11 = *(void *)v12;
    *((void *)v11 + 1) = v13;
    uint64_t v14 = *((void *)v12 + 3);
    *((void *)v11 + 2) = *((void *)v12 + 2);
    *((void *)v11 + 3) = v14;
    uint64_t v15 = *((void *)v12 + 5);
    *((void *)v11 + 4) = *((void *)v12 + 4);
    *((void *)v11 + 5) = v15;
    uint64_t v16 = *((void *)v12 + 7);
    *((void *)v11 + 6) = *((void *)v12 + 6);
    *((void *)v11 + 7) = v16;
    unsigned char v11[64] = v12[64];
    v11[65] = v12[65];
    v11[66] = v12[66];
    uint64_t v17 = &a1[v10];
    int v42 = a3;
    uint64_t v18 = (char *)a2 + v10;
    uint64_t v19 = *(uint64_t *)((char *)a2 + v10 + 8);
    *(void *)uint64_t v17 = *(uint64_t *)((char *)a2 + v10);
    *((void *)v17 + 1) = v19;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    uint64_t v20 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
    uint64_t v21 = &v17[v20];
    uint64_t v22 = &v18[v20];
    uint64_t v23 = sub_1DADF5D80();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16))(v21, v22, v23);
    uint64_t v24 = v42[7];
    uint64_t v25 = v42[8];
    uint64_t v26 = &a1[v24];
    unint64_t v27 = (uint64_t *)((char *)a2 + v24);
    uint64_t v28 = v27[1];
    *(void *)uint64_t v26 = *v27;
    *((void *)v26 + 1) = v28;
    long long v29 = &a1[v25];
    long long v30 = (char *)a2 + v25;
    *long long v29 = *v30;
    *((void *)v29 + 1) = *((void *)v30 + 1);
    uint64_t v31 = v42[9];
    uint64_t v32 = v42[10];
    unint64_t v33 = v42;
    long long v34 = &a1[v31];
    char v35 = (uint64_t *)((char *)a2 + v31);
    uint64_t v36 = v35[1];
    *(void *)long long v34 = *v35;
    *((void *)v34 + 1) = v36;
    long long v37 = &a1[v32];
    uint64_t v38 = (char *)a2 + v32;
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    uint64_t v40 = *(void (**)(char *, char *, uint64_t))(*(void *)(v39 - 8) + 16);
    v40(v37, v38, v39);
    v40(&a1[v33[11]], (char *)a2 + v33[11], v39);
    v40(&a1[v33[12]], (char *)a2 + v33[12], v39);
    v40(&a1[v33[13]], (char *)a2 + v33[13], v39);
  }
  return a1;
}

uint64_t sub_1DADEDE68(uint64_t a1, int *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1DADF6790();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + a2[6];
  swift_release();
  swift_release();
  uint64_t v6 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v7 = sub_1DADF5D80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v8 = a1 + a2[10];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v12)((void *)(v9 - 8), v8, v9);
  v12(a1 + a2[11], v9);
  v12(a1 + a2[12], v9);
  uint64_t v10 = a1 + a2[13];

  return ((uint64_t (*)(uint64_t, uint64_t))v12)(v10, v9);
}

char *sub_1DADEE074(char *a1, char *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1DADF6790();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *(void *)a1 = *(void *)a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = &a1[v7];
  uint64_t v10 = &a2[v7];
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = *(void *)v10;
  *((void *)v9 + 1) = v11;
  uint64_t v12 = *((void *)v10 + 3);
  *((void *)v9 + 2) = *((void *)v10 + 2);
  *((void *)v9 + 3) = v12;
  uint64_t v13 = *((void *)v10 + 5);
  *((void *)v9 + 4) = *((void *)v10 + 4);
  *((void *)v9 + 5) = v13;
  uint64_t v14 = *((void *)v10 + 7);
  *((void *)v9 + 6) = *((void *)v10 + 6);
  *((void *)v9 + 7) = v14;
  v9[64] = v10[64];
  v9[65] = v10[65];
  v9[66] = v10[66];
  uint64_t v15 = &a1[v8];
  uint64_t v40 = a3;
  uint64_t v16 = &a2[v8];
  uint64_t v17 = *(void *)&a2[v8 + 8];
  *(void *)uint64_t v15 = *(void *)&a2[v8];
  *((void *)v15 + 1) = v17;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  uint64_t v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v19 = &v15[v18];
  uint64_t v20 = &v16[v18];
  uint64_t v21 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16))(v19, v20, v21);
  uint64_t v22 = v40[7];
  uint64_t v23 = v40[8];
  uint64_t v24 = &a1[v22];
  uint64_t v25 = &a2[v22];
  uint64_t v26 = *((void *)v25 + 1);
  *(void *)uint64_t v24 = *(void *)v25;
  *((void *)v24 + 1) = v26;
  unint64_t v27 = &a1[v23];
  uint64_t v28 = &a2[v23];
  *unint64_t v27 = *v28;
  *((void *)v27 + 1) = *((void *)v28 + 1);
  uint64_t v29 = v40[9];
  uint64_t v30 = v40[10];
  uint64_t v31 = v40;
  uint64_t v32 = &a1[v29];
  unint64_t v33 = &a2[v29];
  uint64_t v34 = *((void *)v33 + 1);
  *(void *)uint64_t v32 = *(void *)v33;
  *((void *)v32 + 1) = v34;
  char v35 = &a1[v30];
  uint64_t v36 = &a2[v30];
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v38 = *(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16);
  v38(v35, v36, v37);
  v38(&a1[v31[11]], &a2[v31[11]], v37);
  v38(&a1[v31[12]], &a2[v31[12]], v37);
  v38(&a1[v31[13]], &a2[v31[13]], v37);
  return a1;
}

char *sub_1DADEE330(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1DADADF3C((uint64_t)a1, &qword_1EB682F58);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1DADF6790();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *(void *)a1 = *(void *)a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  *(void *)&a1[v7] = *(void *)&a2[v7];
  swift_retain();
  swift_release();
  *((void *)v8 + 1) = *((void *)v9 + 1);
  swift_retain();
  swift_release();
  *((void *)v8 + 2) = *((void *)v9 + 2);
  *((void *)v8 + 3) = *((void *)v9 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v8 + 4) = *((void *)v9 + 4);
  *((void *)v8 + 5) = *((void *)v9 + 5);
  swift_retain();
  swift_release();
  *((void *)v8 + 6) = *((void *)v9 + 6);
  *((void *)v8 + 7) = *((void *)v9 + 7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[64] = v9[64];
  v8[65] = v9[65];
  v8[66] = v9[66];
  uint64_t v10 = a3[6];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  *(void *)&a1[v10] = *(void *)&a2[v10];
  swift_retain();
  swift_release();
  *((void *)v11 + 1) = *((void *)v12 + 1);
  swift_retain();
  swift_release();
  uint64_t v13 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v14 = &v11[v13];
  uint64_t v15 = &v12[v13];
  uint64_t v16 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  uint64_t v17 = a3[7];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  *(void *)uint64_t v18 = *(void *)v19;
  *((void *)v18 + 1) = *((void *)v19 + 1);
  swift_retain();
  swift_release();
  uint64_t v20 = a3[8];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  char *v21 = *v22;
  *((void *)v21 + 1) = *((void *)v22 + 1);
  swift_retain();
  swift_release();
  uint64_t v23 = a3[9];
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  *(void *)uint64_t v24 = *(void *)v25;
  *((void *)v24 + 1) = *((void *)v25 + 1);
  swift_retain();
  swift_release();
  uint64_t v26 = a3[10];
  unint64_t v27 = &a1[v26];
  uint64_t v28 = &a2[v26];
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v30 = *(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 24);
  v30(v27, v28, v29);
  v30(&a1[a3[11]], &a2[a3[11]], v29);
  v30(&a1[a3[12]], &a2[a3[12]], v29);
  v30(&a1[a3[13]], &a2[a3[13]], v29);
  return a1;
}

char *sub_1DADEE684(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1DADF6790();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v8];
  uint64_t v11 = &a2[v8];
  long long v12 = *((_OWORD *)v11 + 3);
  *((_OWORD *)v10 + 2) = *((_OWORD *)v11 + 2);
  *((_OWORD *)v10 + 3) = v12;
  *(_DWORD *)(v10 + 63) = *(_DWORD *)(v11 + 63);
  long long v13 = *((_OWORD *)v11 + 1);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
  *((_OWORD *)v10 + 1) = v13;
  uint64_t v14 = &a1[v9];
  uint64_t v15 = &a2[v9];
  uint64_t v16 = *(void *)&a2[v9];
  uint64_t v17 = *(void *)&a2[v9 + 8];
  *(void *)uint64_t v14 = v16;
  *((void *)v14 + 1) = v17;
  uint64_t v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v19 = &v14[v18];
  uint64_t v20 = &v15[v18];
  uint64_t v21 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
  uint64_t v22 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v22] = *(_OWORD *)&a2[v22];
  uint64_t v23 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  unint64_t v27 = *(void (**)(char *, char *, uint64_t))(*(void *)(v26 - 8) + 32);
  v27(v24, v25, v26);
  v27(&a1[a3[11]], &a2[a3[11]], v26);
  v27(&a1[a3[12]], &a2[a3[12]], v26);
  v27(&a1[a3[13]], &a2[a3[13]], v26);
  return a1;
}

char *sub_1DADEE8A4(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1DADADF3C((uint64_t)a1, &qword_1EB682F58);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F58);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1DADF6790();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  swift_release();
  *((void *)v9 + 1) = *((void *)v10 + 1);
  swift_release();
  uint64_t v11 = *((void *)v10 + 3);
  *((void *)v9 + 2) = *((void *)v10 + 2);
  *((void *)v9 + 3) = v11;
  swift_bridgeObjectRelease();
  *((void *)v9 + 4) = *((void *)v10 + 4);
  *((void *)v9 + 5) = *((void *)v10 + 5);
  swift_release();
  uint64_t v12 = *((void *)v10 + 7);
  *((void *)v9 + 6) = *((void *)v10 + 6);
  *((void *)v9 + 7) = v12;
  swift_bridgeObjectRelease();
  v9[64] = v10[64];
  v9[65] = v10[65];
  v9[66] = v10[66];
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  *(void *)&a1[v13] = *(void *)&a2[v13];
  swift_release();
  *((void *)v14 + 1) = *((void *)v15 + 1);
  swift_release();
  uint64_t v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88) + 32);
  uint64_t v17 = &v14[v16];
  uint64_t v18 = &v15[v16];
  uint64_t v19 = sub_1DADF5D80();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v19 - 8) + 40))(v17, v18, v19);
  uint64_t v20 = a3[7];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  *(void *)uint64_t v21 = *(void *)v22;
  *((void *)v21 + 1) = *((void *)v22 + 1);
  swift_release();
  uint64_t v23 = a3[8];
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  *uint64_t v24 = *v25;
  *((void *)v24 + 1) = *((void *)v25 + 1);
  swift_release();
  uint64_t v26 = a3[9];
  unint64_t v27 = &a1[v26];
  uint64_t v28 = &a2[v26];
  *(void *)unint64_t v27 = *(void *)v28;
  *((void *)v27 + 1) = *((void *)v28 + 1);
  swift_release();
  uint64_t v29 = a3[10];
  uint64_t v30 = &a1[v29];
  uint64_t v31 = &a2[v29];
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  unint64_t v33 = *(void (**)(char *, char *, uint64_t))(*(void *)(v32 - 8) + 40);
  v33(v30, v31, v32);
  v33(&a1[a3[11]], &a2[a3[11]], v32);
  v33(&a1[a3[12]], &a2[a3[12]], v32);
  v33(&a1[a3[13]], &a2[a3[13]], v32);
  return a1;
}

uint64_t sub_1DADEEBA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DADEEBB4);
}

uint64_t sub_1DADEEBB4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_9:
    return v9(v10, a2, v8);
  }
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v11 = *(void *)(a1 + a3[5] + 8);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
    uint64_t v14 = *(void *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a2)
    {
      uint64_t v8 = v13;
      uint64_t v10 = a1 + a3[6];
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
      goto LABEL_9;
    }
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[10];
    return v16(v18, a2, v17);
  }
}

uint64_t sub_1DADEED44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DADEED58);
}

uint64_t sub_1DADEED58(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_7:
    return v11(v12, a2, a2, v10);
  }
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + a4[5] + 8) = (a2 - 1);
    return result;
  }
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682B88);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + a4[6];
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_7;
  }
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826C8);
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a4[10];

  return v16(v18, a2, a2, v17);
}

void sub_1DADEEEE8()
{
  sub_1DADE3400(319, (unint64_t *)&qword_1EB683638, MEMORY[0x1E4F46AE8], MEMORY[0x1E4F3C648]);
  if (v0 <= 0x3F)
  {
    sub_1DADE3400(319, &qword_1EB682B90, MEMORY[0x1E4F3CB98], MEMORY[0x1E4F3EE18]);
    if (v1 <= 0x3F)
    {
      sub_1DADB4B24();
      if (v2 <= 0x3F) {
        swift_initStructMetadata();
      }
    }
  }
}

uint64_t *sub_1DADEF064(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1DADF5C00();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *uint64_t v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (char *)v4 + v9;
    unint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = *(void *)v11;
    char v13 = v11[8];
    sub_1DADAB7C8(*(void *)v11, v13);
    *(void *)uint64_t v10 = v12;
    v10[8] = v13;
    uint64_t v14 = a3[6];
    uint64_t v15 = a3[7];
    uint64_t v16 = (uint64_t *)((char *)v4 + v14);
    uint64_t v17 = (uint64_t *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    void *v16 = *v17;
    v16[1] = v18;
    uint64_t v19 = (uint64_t *)((char *)v4 + v15);
    uint64_t v20 = (uint64_t *)((char *)a2 + v15);
    uint64_t v21 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v21;
    uint64_t v22 = a3[8];
    uint64_t v23 = (uint64_t *)((char *)v4 + v22);
    uint64_t v24 = (uint64_t *)((char *)a2 + v22);
    uint64_t v25 = v24[1];
    *uint64_t v23 = *v24;
    v23[1] = v25;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_1DADEF1F4(uint64_t a1, uint64_t a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_1DADF5C00();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  sub_1DADABA40(*(void *)(a1 + *(int *)(a2 + 20)), *(unsigned char *)(a1 + *(int *)(a2 + 20) + 8));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return swift_release();
}

void *sub_1DADEF2DC(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_1DADF5C00();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  char v11 = v9[8];
  sub_1DADAB7C8(*(void *)v9, v11);
  *(void *)uint64_t v8 = v10;
  v8[8] = v11;
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)((char *)a1 + v12);
  uint64_t v15 = (void *)((char *)a2 + v12);
  uint64_t v16 = v15[1];
  *uint64_t v14 = *v15;
  v14[1] = v16;
  uint64_t v17 = (void *)((char *)a1 + v13);
  uint64_t v18 = (void *)((char *)a2 + v13);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = a3[8];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  uint64_t v23 = v22[1];
  void *v21 = *v22;
  v21[1] = v23;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_1DADEF420(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1DADADF3C((uint64_t)a1, &qword_1EB682F68);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_1DADF5C00();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  char v11 = v9[8];
  sub_1DADAB7C8(*(void *)v9, v11);
  uint64_t v12 = *(void *)v8;
  char v13 = v8[8];
  *(void *)uint64_t v8 = v10;
  v8[8] = v11;
  sub_1DADABA40(v12, v13);
  uint64_t v14 = a3[6];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  *(void *)((char *)a1 + v14) = *(void *)((char *)a2 + v14);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v15 + 1) = *((void *)v16 + 1);
  swift_retain();
  swift_release();
  uint64_t v17 = a3[7];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  *uint64_t v18 = *v19;
  v18[1] = v19[1];
  swift_retain();
  swift_release();
  uint64_t v20 = a3[8];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  void *v21 = *v22;
  v21[1] = v22[1];
  swift_retain();
  swift_release();
  return a1;
}

char *sub_1DADEF5C8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_1DADF5C00();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = a3[6];
  uint64_t v10 = &a1[v8];
  char v11 = &a2[v8];
  *(void *)uint64_t v10 = *(void *)v11;
  v10[8] = v11[8];
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  uint64_t v12 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v12] = *(_OWORD *)&a2[v12];
  return a1;
}

char *sub_1DADEF6C8(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_1DADADF3C((uint64_t)a1, &qword_1EB682F68);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_1DADF5C00();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = *(void *)v10;
  LOBYTE(v10) = v10[8];
  uint64_t v12 = *(void *)v9;
  char v13 = v9[8];
  *(void *)uint64_t v9 = v11;
  v9[8] = (char)v10;
  sub_1DADABA40(v12, v13);
  uint64_t v14 = a3[6];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  *(void *)&a1[v14] = *(void *)&a2[v14];
  swift_bridgeObjectRelease();
  *((void *)v15 + 1) = *((void *)v16 + 1);
  swift_release();
  uint64_t v17 = a3[7];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  *(void *)uint64_t v18 = *(void *)v19;
  *((void *)v18 + 1) = *((void *)v19 + 1);
  swift_release();
  uint64_t v20 = a3[8];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  uint64_t v24 = *(void *)v22;
  uint64_t v23 = *((void *)v22 + 1);
  *(void *)uint64_t v21 = v24;
  *((void *)v21 + 1) = v23;
  swift_release();
  return a1;
}

uint64_t sub_1DADEF844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4186578](a1, a2, a3, sub_1DADEF858);
}

uint64_t sub_1DADEF858(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1DADEF91C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F41867C0](a1, a2, a3, a4, sub_1DADEF930);
}

uint64_t sub_1DADEF930(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6826A8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

void sub_1DADEF9F0()
{
  sub_1DADE3400(319, (unint64_t *)&qword_1EB6835B8, MEMORY[0x1E4F3C5D0], MEMORY[0x1E4F3C648]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

ValueMetadata *type metadata accessor for BCUI4x4LayoutCoordinator()
{
  return &type metadata for BCUI4x4LayoutCoordinator;
}

uint64_t sub_1DADEFADC()
{
  return sub_1DADAD660(&qword_1EA8F8B48, &qword_1EA8F8B50);
}

uint64_t sub_1DADEFB18()
{
  return sub_1DADAD660(&qword_1EA8F8B58, &qword_1EA8F8B60);
}

uint64_t sub_1DADEFB54()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADEFB70()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADEFB8C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADEFBA8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADEFBC4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADEFBE0(uint64_t a1)
{
  return a1;
}

unint64_t sub_1DADEFC2C()
{
  unint64_t result = qword_1EA8F8B90;
  if (!qword_1EA8F8B90)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8B78);
    sub_1DADF01B8(&qword_1EA8F8B98, &qword_1EA8F8520);
    sub_1DADAD660(&qword_1EA8F8BA0, &qword_1EA8F8BA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8B90);
  }
  return result;
}

unint64_t sub_1DADEFCEC()
{
  unint64_t result = qword_1EA8F8BB8;
  if (!qword_1EA8F8BB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8BC0);
    sub_1DADEFC2C();
    sub_1DADAD660(&qword_1EB6829F8, &qword_1EB682A00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8BB8);
  }
  return result;
}

unint64_t sub_1DADEFD8C()
{
  unint64_t result = qword_1EA8F8BD0;
  if (!qword_1EA8F8BD0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8BC8);
    sub_1DADAD660(&qword_1EA8F8BA0, &qword_1EA8F8BA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8BD0);
  }
  return result;
}

uint64_t sub_1DADEFE2C(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    a4();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1DADEFEB4()
{
  unint64_t result = qword_1EA8F8BE8;
  if (!qword_1EA8F8BE8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8BF0);
    sub_1DADEFD8C();
    sub_1DADAD660(&qword_1EB6829F8, &qword_1EB682A00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8BE8);
  }
  return result;
}

unint64_t sub_1DADEFF54()
{
  unint64_t result = qword_1EA8F8C00;
  if (!qword_1EA8F8C00)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8BF8);
    sub_1DADAD660(&qword_1EA8F8C08, &qword_1EA8F8C10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8C00);
  }
  return result;
}

uint64_t sub_1DADEFFF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t result = swift_release();
  if ((a6 & 1) == 0)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

unint64_t sub_1DADF0058()
{
  unint64_t result = qword_1EA8F8C28;
  if (!qword_1EA8F8C28)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8C30);
    sub_1DADEFF54();
    sub_1DADF00D4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8C28);
  }
  return result;
}

unint64_t sub_1DADF00D4()
{
  unint64_t result = qword_1EA8F83D8;
  if (!qword_1EA8F83D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F83D8);
  }
  return result;
}

uint64_t *sub_1DADF0128(uint64_t *a1)
{
  return a1;
}

uint64_t sub_1DADF019C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  return sub_1DADEFFF4(a7, a8, a9, a10, a11, a12 & 1);
}

uint64_t sub_1DADF01B8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DADF0228()
{
  return sub_1DADE8A20(*(void *)(v0 + 16));
}

uint64_t sub_1DADF0230()
{
  uint64_t v1 = type metadata accessor for Dividers(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682F68);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_1DADF5C00();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  sub_1DADABA40(*(void *)(v0 + v3 + *(int *)(v1 + 20)), *(unsigned char *)(v0 + v3 + *(int *)(v1 + 20) + 8));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return MEMORY[0x1F4186498](v0, v3 + v4, v2 | 7);
}

double sub_1DADF0390@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for Dividers(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_1DADE8C1C(v4, a1);
}

unint64_t sub_1DADF0404()
{
  unint64_t result = qword_1EA8F8C78;
  if (!qword_1EA8F8C78)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8C80);
    sub_1DADF04B0();
    sub_1DADF07B4(&qword_1EA8F8B70, (void (*)(uint64_t))type metadata accessor for BCUIBatteryGlyphView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8C78);
  }
  return result;
}

unint64_t sub_1DADF04B0()
{
  unint64_t result = qword_1EA8F8C88;
  if (!qword_1EA8F8C88)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8C90);
    sub_1DADF07B4(&qword_1EA8F8B70, (void (*)(uint64_t))type metadata accessor for BCUIBatteryGlyphView);
    sub_1DADF00D4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8C88);
  }
  return result;
}

unint64_t sub_1DADF0560()
{
  unint64_t result = qword_1EA8F8C98;
  if (!qword_1EA8F8C98)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8CA0);
    sub_1DADEFE2C(&qword_1EA8F8BB0, &qword_1EA8F8B80, (void (*)(void))sub_1DADEFCEC, (void (*)(void))sub_1DADEFC2C);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8C98);
  }
  return result;
}

unint64_t sub_1DADF0618()
{
  unint64_t result = qword_1EA8F8CA8;
  if (!qword_1EA8F8CA8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8CB0);
    sub_1DADEFE2C(&qword_1EA8F8BE0, &qword_1EA8F8BD8, (void (*)(void))sub_1DADEFEB4, (void (*)(void))sub_1DADEFD8C);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8CA8);
  }
  return result;
}

unint64_t sub_1DADF06D0()
{
  unint64_t result = qword_1EA8F8CB8;
  if (!qword_1EA8F8CB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8CC0);
    sub_1DADEFE2C(&qword_1EA8F8C20, &qword_1EA8F8C18, (void (*)(void))sub_1DADF0058, (void (*)(void))sub_1DADEFF54);
    sub_1DADF07B4(&qword_1EA8F83E8, MEMORY[0x1E4F3DF60]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8CB8);
  }
  return result;
}

uint64_t sub_1DADF07B4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1DADF07FC()
{
  return sub_1DADAD660(&qword_1EA8F8CC8, &qword_1EA8F8CD0);
}

uint64_t sub_1DADF0840()
{
  uint64_t v0 = sub_1DADF5AD0();
  __swift_allocate_value_buffer(v0, qword_1EB684808);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EB684808);
  return sub_1DADF5AC0();
}

uint64_t sub_1DADF08BC()
{
  if (qword_1EB684330 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1DADF5AD0();

  return __swift_project_value_buffer(v0, (uint64_t)qword_1EB684808);
}

uint64_t sub_1DADF0920@<X0>(uint64_t a1@<X8>)
{
  if (qword_1EB684330 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1DADF5AD0();
  uint64_t v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EB684808);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1DADF09C8()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  char v5 = 0;
  id v1 = objc_msgSend(v0, sel_batteryWidgetGlyphName_, &v5);
  sub_1DADF6840();

  if (v5 != 1) {
    return sub_1DADF6520();
  }
  uint64_t v2 = (void *)sub_1DADF6810();
  id v3 = objc_msgSend(self, sel_bundleWithIdentifier_, v2);

  return sub_1DADF6550();
}

uint64_t sub_1DADF0ACC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v36 = a4;
  uint64_t v37 = a3;
  LODWORD(v33) = a1;
  uint64_t v5 = *(void *)(a2 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](a1);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  unint64_t v10 = (char *)&v32 - v9;
  uint64_t v11 = sub_1DADF5DC0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x1F4188790](v11);
  uint64_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v17 = (char *)&v32 - v16;
  uint64_t v18 = sub_1DADF6150();
  uint64_t v35 = *(void *)(v18 - 8);
  MEMORY[0x1F4188790](v18);
  uint64_t v20 = (char *)&v32 - v19;
  if (v33)
  {
    uint64_t v33 = v18;
    uint64_t v21 = v37;
    sub_1DADF6440();
    unint64_t v22 = sub_1DADF00D4();
    uint64_t v38 = v21;
    unint64_t v39 = v22;
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    v23(v17, v15, v11);
    uint64_t v24 = *(void (**)(char *, uint64_t))(v12 + 8);
    v24(v15, v11);
    v23(v15, v17, v11);
    uint64_t v18 = v33;
    sub_1DADF0EE4((uint64_t)v15, v11);
    v24(v15, v11);
    v24(v17, v11);
  }
  else
  {
    uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v25(v10, WitnessTable, a2);
    v25(v8, (uint64_t)v10, a2);
    unint64_t v26 = sub_1DADF00D4();
    uint64_t v44 = v37;
    unint64_t v45 = v26;
    swift_getWitnessTable();
    sub_1DADF0FDC((uint64_t)v8, v11, a2);
    unint64_t v27 = *(void (**)(char *, uint64_t))(v5 + 8);
    v27(v8, a2);
    v27(v10, a2);
  }
  unint64_t v28 = sub_1DADF00D4();
  uint64_t v29 = v37;
  uint64_t v42 = v37;
  unint64_t v43 = v28;
  uint64_t v40 = swift_getWitnessTable();
  uint64_t v41 = v29;
  swift_getWitnessTable();
  uint64_t v30 = v35;
  (*(void (**)(uint64_t, char *, uint64_t))(v35 + 16))(v36, v20, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v20, v18);
}

uint64_t sub_1DADF0EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1DADF6130();
  MEMORY[0x1F4188790](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_1DADF6140();
}

uint64_t sub_1DADF0FDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1DADF6130();
  MEMORY[0x1F4188790](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_1DADF6140();
}

uint64_t sub_1DADF10D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v37 = a4;
  uint64_t v38 = a3;
  uint64_t v5 = sub_1DADF5DC0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x1F4188790](v7);
  uint64_t v12 = (char *)&v33 - v11;
  uint64_t v13 = *(void *)(a2 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v10);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v33 - v17;
  uint64_t v36 = sub_1DADF6150();
  uint64_t v19 = *(void *)(v36 - 8);
  MEMORY[0x1F4188790](v36);
  uint64_t v21 = (char *)&v33 - v20;
  if (v34 == 1)
  {
    unint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    v22(v18, WitnessTable, a2);
    v22(v16, (uint64_t)v18, a2);
    uint64_t v39 = v38;
    uint64_t v40 = MEMORY[0x1E4F3CE38];
    swift_getWitnessTable();
    sub_1DADF0EE4((uint64_t)v16, a2);
    uint64_t v23 = *(void (**)(char *, uint64_t))(v13 + 8);
    v23(v16, a2);
    v23(v18, a2);
  }
  else
  {
    sub_1DADF66D0();
    uint64_t v34 = v19;
    uint64_t v24 = v12;
    uint64_t v25 = v38;
    sub_1DADF6430();
    uint64_t v45 = v25;
    uint64_t v46 = MEMORY[0x1E4F3CE38];
    uint64_t WitnessTable = swift_getWitnessTable();
    unint64_t v26 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
    v26(v24, v9, v5);
    unint64_t v27 = *(void (**)(char *, uint64_t))(v6 + 8);
    v27(v9, v5);
    v26(v9, v24, v5);
    sub_1DADF0FDC((uint64_t)v9, a2, v5);
    v27(v9, v5);
    unint64_t v28 = v24;
    uint64_t v19 = v34;
    v27(v28, v5);
  }
  uint64_t v29 = v38;
  uint64_t v43 = v38;
  uint64_t v44 = MEMORY[0x1E4F3CE38];
  uint64_t v30 = swift_getWitnessTable();
  uint64_t v41 = v29;
  uint64_t v42 = v30;
  uint64_t v31 = v36;
  swift_getWitnessTable();
  (*(void (**)(uint64_t, char *, uint64_t))(v19 + 16))(v37, v21, v31);
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v31);
}

uint64_t sub_1DADF1554@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v39 = a8;
  uint64_t v40 = a7;
  v33[0] = a3;
  v33[1] = a5;
  uint64_t v34 = a2;
  uint64_t v35 = a4;
  LODWORD(v36) = a1;
  uint64_t v9 = *(void *)(a6 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](a1);
  uint64_t v12 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)v33 - v13;
  uint64_t v15 = sub_1DADF5DC0();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x1F4188790](v15);
  uint64_t v19 = (char *)v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v17);
  uint64_t v21 = (char *)v33 - v20;
  uint64_t v22 = sub_1DADF6150();
  uint64_t v38 = *(void *)(v22 - 8);
  MEMORY[0x1F4188790](v22);
  uint64_t v24 = (char *)v33 - v23;
  if (v36)
  {
    sub_1DADF66D0();
    uint64_t v36 = v22;
    uint64_t v25 = v40;
    sub_1DADF6420();
    uint64_t v41 = v25;
    uint64_t v42 = MEMORY[0x1E4F3C7D0];
    uint64_t WitnessTable = swift_getWitnessTable();
    unint64_t v26 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
    v26(v21, v19, v15);
    unint64_t v27 = *(void (**)(char *, uint64_t))(v16 + 8);
    v27(v19, v15);
    v26(v19, v21, v15);
    uint64_t v22 = v36;
    sub_1DADF0EE4((uint64_t)v19, v15);
    v27(v19, v15);
    v27(v21, v15);
  }
  else
  {
    unint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    v28(v14, WitnessTable, a6);
    v28(v12, (uint64_t)v14, a6);
    uint64_t v47 = v40;
    uint64_t v48 = MEMORY[0x1E4F3C7D0];
    swift_getWitnessTable();
    sub_1DADF0FDC((uint64_t)v12, v15, a6);
    uint64_t v29 = *(void (**)(char *, uint64_t))(v9 + 8);
    v29(v12, a6);
    v29(v14, a6);
  }
  uint64_t v30 = v40;
  uint64_t v45 = v40;
  uint64_t v46 = MEMORY[0x1E4F3C7D0];
  uint64_t v43 = swift_getWitnessTable();
  uint64_t v44 = v30;
  swift_getWitnessTable();
  uint64_t v31 = v38;
  (*(void (**)(uint64_t, char *, uint64_t))(v38 + 16))(v39, v24, v22);
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v24, v22);
}

uint64_t sub_1DADF19B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v37 = a5;
  uint64_t v38 = a4;
  uint64_t v33 = a2;
  LODWORD(v34) = a1;
  uint64_t v6 = *(void *)(a3 - 8);
  uint64_t v7 = MEMORY[0x1F4188790](a1);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  uint64_t v11 = (char *)&v33 - v10;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB682A00);
  uint64_t v12 = sub_1DADF5DC0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  uint64_t v18 = (char *)&v33 - v17;
  uint64_t v19 = sub_1DADF6150();
  uint64_t v36 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19);
  uint64_t v21 = (char *)&v33 - v20;
  if (v34)
  {
    uint64_t v34 = v19;
    uint64_t v22 = v38;
    sub_1DADF63C0();
    uint64_t v23 = sub_1DADAD660(&qword_1EB6829F8, &qword_1EB682A00);
    uint64_t v39 = v22;
    uint64_t v40 = v23;
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    v24(v18, v16, v12);
    uint64_t v25 = *(void (**)(char *, uint64_t))(v13 + 8);
    v25(v16, v12);
    v24(v16, v18, v12);
    uint64_t v19 = v34;
    sub_1DADF0EE4((uint64_t)v16, v12);
    v25(v16, v12);
    v25(v18, v12);
  }
  else
  {
    unint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    v26(v11, WitnessTable, a3);
    v26(v9, (uint64_t)v11, a3);
    uint64_t v27 = sub_1DADAD660(&qword_1EB6829F8, &qword_1EB682A00);
    uint64_t v45 = v38;
    uint64_t v46 = v27;
    swift_getWitnessTable();
    sub_1DADF0FDC((uint64_t)v9, v12, a3);
    unint64_t v28 = *(void (**)(char *, uint64_t))(v6 + 8);
    v28(v9, a3);
    v28(v11, a3);
  }
  uint64_t v29 = sub_1DADAD660(&qword_1EB6829F8, &qword_1EB682A00);
  uint64_t v30 = v38;
  uint64_t v43 = v38;
  uint64_t v44 = v29;
  uint64_t v41 = swift_getWitnessTable();
  uint64_t v42 = v30;
  swift_getWitnessTable();
  uint64_t v31 = v36;
  (*(void (**)(uint64_t, char *, uint64_t))(v36 + 16))(v37, v21, v19);
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v21, v19);
}

uint64_t sub_1DADF1E50@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v8 = sub_1DADF5DC0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x1F4188790](v8);
  uint64_t v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v14 = (char *)v19 - v13;
  char v20 = a1;
  MEMORY[0x1E01818D0](&v20, a2, &type metadata for AccessibilityConditionallyCombined, a3);
  unint64_t v15 = sub_1DADF1FF8();
  v19[1] = a3;
  void v19[2] = v15;
  swift_getWitnessTable();
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v16(v14, v12, v8);
  uint64_t v17 = *(void (**)(char *, uint64_t))(v9 + 8);
  v17(v12, v8);
  v16(a4, v14, v8);
  return ((uint64_t (*)(char *, uint64_t))v17)(v14, v8);
}

uint64_t sub_1DADF1FF0(char a1)
{
  return a1 & 1;
}

unint64_t sub_1DADF1FF8()
{
  unint64_t result = qword_1EB682648;
  if (!qword_1EB682648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB682648);
  }
  return result;
}

uint64_t sub_1DADF204C@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_1DADF6510();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E4F3EBF8], v6);
    uint64_t v10 = sub_1DADF6540();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v13 = v10;
    char v14 = 0;
  }
  else
  {
    uint64_t v13 = a2;
    char v14 = 1;
    swift_retain();
  }
  uint64_t result = sub_1DADF6140();
  char v12 = v16;
  *(void *)a3 = v15;
  *(unsigned char *)(a3 + 8) = v12;
  return result;
}

uint64_t sub_1DADF21BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 + 16);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](a1);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v3;
  uint64_t result = MEMORY[0x1E0181DD0](*v3, v6);
  if (result < a2)
  {
    uint64_t result = MEMORY[0x1E0181DD0](v10, v6);
    if (a2 < result)
    {
      __break(1u);
    }
    else
    {
      if (a2 == result) {
        return result;
      }
      BOOL v12 = a2 <= result;
      uint64_t v13 = a2 - result;
      if (!v12)
      {
        char v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
        do
        {
          v14(v9, a1, v6);
          uint64_t result = sub_1DADF6960();
          --v13;
        }
        while (v13);
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

double sub_1DADF22E0(void *a1)
{
  uint64_t v2 = (void *)sub_1DADF6810();
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB682FD0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DADFA1C0;
  uint64_t v4 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
  *(void *)(inited + 64) = sub_1DADF240C();
  *(void *)(inited + 40) = a1;
  id v5 = v4;
  id v6 = a1;
  sub_1DADF244C(inited);
  type metadata accessor for Key();
  sub_1DADF4ED4(&qword_1EB682F98, (void (*)(uint64_t))type metadata accessor for Key);
  uint64_t v7 = (void *)sub_1DADF67C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_sizeWithAttributes_, v7);
  double v9 = v8;

  return v9;
}

unint64_t sub_1DADF240C()
{
  unint64_t result = qword_1EB682FB8;
  if (!qword_1EB682FB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EB682FB8);
  }
  return result;
}

unint64_t sub_1DADF244C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = (void *)MEMORY[0x1E4FBC868];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682FC8);
  uint64_t v2 = sub_1DADF6B60();
  id v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1DADF5430(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_1DADF4F1C(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_1DADF5498(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void type metadata accessor for Key()
{
  if (!qword_1EB682FA8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EB682FA8);
    }
  }
}

double sub_1DADF25C0(void *a1)
{
  uint64_t v2 = (void *)sub_1DADF6810();
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB682FD0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DADFA1C0;
  uint64_t v4 = (void *)*MEMORY[0x1E4FB06F8];
  *(void *)(inited + 32) = *MEMORY[0x1E4FB06F8];
  *(void *)(inited + 64) = sub_1DADF240C();
  *(void *)(inited + 40) = a1;
  id v5 = v4;
  id v6 = a1;
  sub_1DADF244C(inited);
  type metadata accessor for Key();
  sub_1DADF4ED4(&qword_1EB682F98, (void (*)(uint64_t))type metadata accessor for Key);
  uint64_t v7 = (void *)sub_1DADF67C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_sizeWithAttributes_, v7);
  double v9 = v8;

  return v9;
}

uint64_t sub_1DADF26EC(char a1)
{
  if (qword_1EB683E48 != -1) {
    swift_once();
  }
  if (!qword_1EB6847C0) {
    return 0;
  }
  id v2 = (id)qword_1EB6847C0;
  sub_1DADF5A10();
  swift_bridgeObjectRelease();
  if (a1) {
    uint64_t v3 = 8236;
  }
  else {
    uint64_t v3 = 32;
  }
  uint64_t v5 = v3;
  sub_1DADF6870();

  swift_bridgeObjectRelease();
  return v5;
}

uint64_t *sub_1DADF282C()
{
  if (qword_1EB683E48 != -1) {
    swift_once();
  }
  return &qword_1EB6847C0;
}

uint64_t sub_1DADF2878@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682948);
  MEMORY[0x1F4188790](v4 - 8);
  id v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682758);
  MEMORY[0x1F4188790](v7 - 8);
  double v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1DADF5D80();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, v2, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  id v12 = (id)sub_1DADF6A60();
  sub_1DADF6100();
  uint64_t v13 = sub_1DADF60F0();
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v6, 1, v13) == 1)
  {
    sub_1DADF36D8((uint64_t)v6);
    if (qword_1EB684330 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_1DADF5AD0();
    __swift_project_value_buffer(v15, (uint64_t)qword_1EB684808);
    id v16 = v12;
    uint64_t v17 = sub_1DADF5AB0();
    os_log_type_t v18 = sub_1DADF69E0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      uint64_t v27 = a1;
      uint64_t v21 = v20;
      uint64_t v29 = v20;
      *(_DWORD *)uint64_t v19 = 136315138;
      uint64_t v22 = sub_1DADF6840();
      unint64_t v28 = sub_1DADA5DB0(v22, v23, &v29);
      sub_1DADF6A90();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1DAD96000, v17, v18, "Unable to convert UIContentSizeCategory of %s to ContentSizeCategory.", v19, 0xCu);
      swift_arrayDestroy();
      uint64_t v24 = v21;
      a1 = v27;
      MEMORY[0x1E01829D0](v24, -1, -1);
      MEMORY[0x1E01829D0](v19, -1, -1);
    }
    else
    {
    }
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v14 + 104))(a1, *MEMORY[0x1E4F3D598], v13);
  }
  else
  {

    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a1, v6, v13);
  }
}

uint64_t sub_1DADF2C04()
{
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB682BF0);
  uint64_t v0 = sub_1DADF60F0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1DADFA1D0;
  unint64_t v5 = v4 + v3;
  id v6 = *(void (**)(unint64_t, void, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x1E4F3D5A8], v0);
  v6(v5 + v2, *MEMORY[0x1E4F3D570], v0);
  uint64_t result = ((uint64_t (*)(unint64_t, void, uint64_t))v6)(v5 + 2 * v2, *MEMORY[0x1E4F3D578], v0);
  qword_1EB683E10 = v4;
  return result;
}

uint64_t sub_1DADF2D3C()
{
  if (qword_1EB683E18 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1EB683E10;
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB682BF0);
  uint64_t v1 = sub_1DADF60F0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 72);
  unint64_t v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1DADF92C0;
  unint64_t v6 = v5 + v4;
  uint64_t v7 = *(void (**)(unint64_t, void, uint64_t))(v2 + 104);
  v7(v6, *MEMORY[0x1E4F3D5A0], v1);
  v7(v6 + v3, *MEMORY[0x1E4F3D598], v1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DADF5128(v5);
  swift_setDeallocating();
  swift_arrayDestroy();
  uint64_t result = swift_deallocClassInstance();
  qword_1EB683E00 = v0;
  return result;
}

id sub_1DADF2F04(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682758);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1DADF5D80();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, v1, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  uint64_t v8 = (void *)sub_1DADF6A60();
  id v9 = sub_1DADA4F10(a1, (uint64_t)v8);

  return v9;
}

uint64_t sub_1DADF301C()
{
  uint64_t v0 = sub_1DADF60F0();
  unint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x1F4188790](v0);
  uint64_t v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v2);
  uint64_t v6 = (uint64_t)v15 - v5;
  if (qword_1EB683E08 != -1) {
    goto LABEL_18;
  }
  while (1)
  {
    uint64_t v7 = qword_1EB683E00;
    swift_bridgeObjectRetain();
    sub_1DADF2878(v6);
    uint64_t v21 = *(void *)(v7 + 16);
    if (!v21)
    {
      uint64_t v10 = 1;
      (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v6, v0);
      goto LABEL_16;
    }
    unint64_t v16 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
    uint64_t v20 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
    v20(v4, v7 + v16, v0);
    sub_1DADF4ED4(&qword_1EB682940, MEMORY[0x1E4F3D5D8]);
    swift_bridgeObjectRetain();
    char v8 = sub_1DADF6800();
    id v9 = *(void (**)(char *, uint64_t))(v1 + 8);
    uint64_t v17 = (v1 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v9(v4, v0);
    if (v8)
    {
      swift_bridgeObjectRelease();
      uint64_t v10 = 0;
      goto LABEL_15;
    }
    if (v21 == 1) {
      break;
    }
    os_log_type_t v18 = v9;
    uint64_t v19 = v6;
    uint64_t v6 = *(void *)(v1 + 72);
    v15[1] = v7;
    unint64_t v1 = v7 + v6 + v16;
    uint64_t v11 = 1;
    while (1)
    {
      v20(v4, v1, v0);
      uint64_t v12 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        break;
      }
      char v13 = sub_1DADF6800();
      v18(v4, v0);
      if (v13)
      {
        swift_bridgeObjectRelease();
        uint64_t v10 = 0;
        goto LABEL_14;
      }
      ++v11;
      v1 += v6;
      if (v12 == v21)
      {
        swift_bridgeObjectRelease();
        uint64_t v10 = 1;
LABEL_14:
        id v9 = v18;
        uint64_t v6 = v19;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_18:
    swift_once();
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = 1;
LABEL_15:
  v9((char *)v6, v0);
LABEL_16:
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1DADF3318()
{
  return sub_1DADF3360(&qword_1EB683E08, &qword_1EB683E00);
}

uint64_t sub_1DADF333C()
{
  return sub_1DADF3360(&qword_1EB683E18, &qword_1EB683E10);
}

uint64_t sub_1DADF3360(void *a1, uint64_t *a2)
{
  uint64_t v4 = sub_1DADF60F0();
  unint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x1F4188790](v4);
  char v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v6);
  uint64_t v10 = (uint64_t)v19 - v9;
  if (*a1 != -1) {
    goto LABEL_18;
  }
  while (1)
  {
    uint64_t v11 = *a2;
    swift_bridgeObjectRetain();
    sub_1DADF2878(v10);
    uint64_t v25 = *(void *)(v11 + 16);
    if (!v25)
    {
      uint64_t v14 = 0;
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v10, v4);
      goto LABEL_16;
    }
    unint64_t v20 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v24 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    v24(v8, v11 + v20, v4);
    sub_1DADF4ED4(&qword_1EB682940, MEMORY[0x1E4F3D5D8]);
    swift_bridgeObjectRetain();
    char v12 = sub_1DADF6800();
    a2 = (uint64_t *)(v5 + 8);
    char v13 = *(void (**)(char *, uint64_t))(v5 + 8);
    uint64_t v21 = (v5 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v13(v8, v4);
    if (v12)
    {
      swift_bridgeObjectRelease();
      uint64_t v14 = 1;
      goto LABEL_15;
    }
    if (v25 == 1) {
      break;
    }
    uint64_t v22 = v13;
    uint64_t v23 = v10;
    uint64_t v10 = *(void *)(v5 + 72);
    v19[1] = v11;
    unint64_t v5 = v11 + v10 + v20;
    uint64_t v15 = 1;
    while (1)
    {
      v24(v8, v5, v4);
      uint64_t v16 = v15 + 1;
      if (__OFADD__(v15, 1)) {
        break;
      }
      char v17 = sub_1DADF6800();
      v22(v8, v4);
      if (v17)
      {
        swift_bridgeObjectRelease();
        uint64_t v14 = 1;
        goto LABEL_14;
      }
      ++v15;
      v5 += v10;
      if (v16 == v25)
      {
        swift_bridgeObjectRelease();
        uint64_t v14 = 0;
LABEL_14:
        char v13 = v22;
        uint64_t v10 = v23;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_18:
    swift_once();
  }
  swift_bridgeObjectRelease();
  uint64_t v14 = 0;
LABEL_15:
  v13((char *)v10, v4);
LABEL_16:
  swift_bridgeObjectRelease();
  return v14;
}

double sub_1DADF3650(double a1)
{
  return round(a1 * 100.0) / 100.0;
}

void sub_1DADF3668()
{
  uint64_t v0 = (void *)sub_1DADF6810();
  id v1 = objc_msgSend(self, sel_bundleWithIdentifier_, v0);

  qword_1EB6847C0 = (uint64_t)v1;
}

uint64_t sub_1DADF36D8(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682948);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DADF3738()
{
  if (qword_1EB683E48 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1EB6847C0;
  id v1 = (id)qword_1EB6847C0;
  return v0;
}

uint64_t sub_1DADF3794()
{
  uint64_t result = sub_1DADF6710();
  qword_1EB6847D8 = result;
  return result;
}

uint64_t *sub_1DADF37B8()
{
  if (qword_1EB683E40 != -1) {
    swift_once();
  }
  return &qword_1EB6847D8;
}

uint64_t sub_1DADF3804()
{
  return sub_1DADF3A00(&qword_1EB683E40);
}

uint64_t sub_1DADF3828()
{
  sub_1DADF6710();
  uint64_t v0 = sub_1DADF6700();
  uint64_t result = swift_release();
  qword_1EA8F9A20 = v0;
  return result;
}

uint64_t *sub_1DADF386C()
{
  if (qword_1EA8F8DA8 != -1) {
    swift_once();
  }
  return &qword_1EA8F9A20;
}

uint64_t sub_1DADF38B8()
{
  return sub_1DADF3A00(qword_1EA8F8DA8);
}

uint64_t sub_1DADF38DC()
{
  uint64_t result = sub_1DADF6710();
  qword_1EB6847D0 = result;
  return result;
}

uint64_t *sub_1DADF3900()
{
  if (qword_1EB683E30 != -1) {
    swift_once();
  }
  return &qword_1EB6847D0;
}

uint64_t sub_1DADF394C()
{
  return sub_1DADF3A00(&qword_1EB683E30);
}

uint64_t sub_1DADF3970()
{
  uint64_t result = sub_1DADF64C0();
  qword_1EB6847C8 = result;
  return result;
}

uint64_t *sub_1DADF3990()
{
  if (qword_1EB683E28 != -1) {
    swift_once();
  }
  return &qword_1EB6847C8;
}

uint64_t sub_1DADF39DC()
{
  return sub_1DADF3A00(&qword_1EB683E28);
}

uint64_t sub_1DADF3A00(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }

  return swift_retain();
}

void *sub_1DADF3A4C()
{
  return &unk_1E6BE0EC8;
}

unint64_t sub_1DADF3A58()
{
  return 0xD000000000000019;
}

void *sub_1DADF3A74()
{
  return &unk_1E6BE0ED8;
}

unint64_t sub_1DADF3A80()
{
  return 0xD000000000000016;
}

void *sub_1DADF3A9C()
{
  return &unk_1E6BE0EE8;
}

unint64_t sub_1DADF3AA8()
{
  return 0xD000000000000025;
}

void sub_1DADF3AC4()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F1CB18]);
  id v1 = (void *)sub_1DADF6810();
  id v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  qword_1EB6847F0 = (uint64_t)v2;
}

uint64_t *sub_1DADF3B34()
{
  if (qword_1EB6840B0 != -1) {
    swift_once();
  }
  return &qword_1EB6847F0;
}

uint64_t sub_1DADF3B80()
{
  if (qword_1EB6840B0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1EB6847F0;
  id v1 = (id)qword_1EB6847F0;
  return v0;
}

void *sub_1DADF3BDC()
{
  return &unk_1DADFA1F0;
}

double sub_1DADF3BE8()
{
  return 3.5;
}

void *sub_1DADF3BF0()
{
  return &unk_1DADFA1F8;
}

double sub_1DADF3BFC()
{
  return 4.0;
}

void *sub_1DADF3C04()
{
  return &unk_1DADFA200;
}

double sub_1DADF3C10()
{
  return 0.7;
}

void *sub_1DADF3C20()
{
  return &unk_1DADFA208;
}

double sub_1DADF3C2C()
{
  return 0.18;
}

void *sub_1DADF3C38()
{
  return &unk_1DADFA210;
}

double sub_1DADF3C44()
{
  return 1.1;
}

void *sub_1DADF3C50()
{
  return &unk_1DADFA218;
}

double sub_1DADF3C5C()
{
  return 32.0;
}

void *sub_1DADF3C68()
{
  return &unk_1DADFA220;
}

double sub_1DADF3C74()
{
  return 14.5;
}

void *sub_1DADF3C7C()
{
  return &unk_1DADFA228;
}

double sub_1DADF3C88()
{
  return 20.0;
}

void *sub_1DADF3C90()
{
  return &unk_1DADFA230;
}

uint64_t sub_1DADF3C9C@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  int v25 = a2;
  uint64_t v26 = a1;
  uint64_t v28 = a3;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6829D0);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682968);
  MEMORY[0x1F4188790](v27);
  char v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_1DADF61A0();
  uint64_t v9 = *(void *)(v24 - 8);
  MEMORY[0x1F4188790](v24);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682A68);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x1F4188790](v12);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v14);
  os_log_type_t v18 = (char *)&v23 - v17;
  if (v25)
  {
    sub_1DADF6190();
    uint64_t v19 = sub_1DADAD660(&qword_1EB6829C8, &qword_1EB6829D0);
    sub_1DADF6400();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v24);
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v16, v12);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v8, v18, v12);
    swift_storeEnumTagMultiPayload();
    uint64_t v29 = v3;
    uint64_t v30 = v19;
    swift_getOpaqueTypeConformance2();
    sub_1DADF6140();
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
  }
  else
  {
    uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    v21(v6, v26, v3);
    v21(v8, (uint64_t)v6, v3);
    swift_storeEnumTagMultiPayload();
    uint64_t v22 = sub_1DADAD660(&qword_1EB6829C8, &qword_1EB6829D0);
    uint64_t v29 = v3;
    uint64_t v30 = v22;
    swift_getOpaqueTypeConformance2();
    sub_1DADF6140();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_1DADF40B8()
{
  return sub_1DADF5CB0();
}

uint64_t sub_1DADF40D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1DADF3C9C(a1, *v2, a2);
}

uint64_t sub_1DADF40DC(uint64_t a1, uint64_t a2)
{
  return sub_1DADF4248(a1, a2, MEMORY[0x1E4F27EB8]);
}

uint64_t sub_1DADF40F4(uint64_t a1, id *a2)
{
  uint64_t result = sub_1DADF6820();
  *a2 = 0;
  return result;
}

uint64_t sub_1DADF416C(uint64_t a1, id *a2)
{
  char v3 = sub_1DADF6830();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1DADF41EC@<X0>(uint64_t *a1@<X8>)
{
  sub_1DADF6840();
  uint64_t v2 = sub_1DADF6810();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1DADF4230(uint64_t a1, uint64_t a2)
{
  return sub_1DADF4248(a1, a2, MEMORY[0x1E4FBB198]);
}

uint64_t sub_1DADF4248(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_1DADF6840();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1DADF428C()
{
  sub_1DADF6840();
  sub_1DADF6860();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1DADF42E0()
{
  sub_1DADF6840();
  sub_1DADF6BE0();
  sub_1DADF6860();
  uint64_t v0 = sub_1DADF6BF0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1DADF4354()
{
  uint64_t v0 = sub_1DADF6840();
  uint64_t v2 = v1;
  if (v0 == sub_1DADF6840() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1DADF6BB0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1DADF43E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_1DADF6810();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1DADF4428@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1DADF6840();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1DADF4454(uint64_t a1)
{
  uint64_t v2 = sub_1DADF4ED4(&qword_1EB682F98, (void (*)(uint64_t))type metadata accessor for Key);
  uint64_t v3 = sub_1DADF4ED4(&qword_1EA8F8CF8, (void (*)(uint64_t))type metadata accessor for Key);
  uint64_t v4 = MEMORY[0x1E4FBB1B0];

  return MEMORY[0x1F4185450](a1, v2, v3, v4);
}

uint64_t sub_1DADF4510(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4FBC860];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_1EB682BF0);
  uint64_t v10 = *(void *)(sub_1DADF60F0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_1DADF6B20();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_1DADF60F0() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1DADF52D8(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_1DADF4778()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *_s6SharedOMa()
{
  return &_s6SharedON;
}

ValueMetadata *_s6SharedO4KeysOMa()
{
  return &_s6SharedO4KeysON;
}

ValueMetadata *type metadata accessor for TunedScaledMetrics()
{
  return &type metadata for TunedScaledMetrics;
}

ValueMetadata *type metadata accessor for TunedScaledMetrics.SystemLargeFramePercentage()
{
  return &type metadata for TunedScaledMetrics.SystemLargeFramePercentage;
}

uint64_t getEnumTagSinglePayload for AccessibilityConditionallyCombined(unsigned __int8 *a1, unsigned int a2)
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
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AccessibilityConditionallyCombined(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x1DADF4940);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessibilityConditionallyCombined()
{
  return &type metadata for AccessibilityConditionallyCombined;
}

uint64_t sub_1DADF4978()
{
  return swift_getWitnessTable();
}

uint64_t sub_1DADF4A20()
{
  return swift_getWitnessTable();
}

uint64_t sub_1DADF4ACC()
{
  return swift_getWitnessTable();
}

uint64_t sub_1DADF4B78()
{
  return swift_getWitnessTable();
}

uint64_t sub_1DADF4C4C()
{
  return swift_getWitnessTable();
}

unint64_t sub_1DADF4CB4()
{
  unint64_t result = qword_1EA8F8CD8;
  if (!qword_1EA8F8CD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EA8F8CE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA8F8CD8);
  }
  return result;
}

unint64_t sub_1DADF4D24()
{
  unint64_t result = qword_1EB6829A8;
  if (!qword_1EB6829A8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB6829B0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EB6829D0);
    sub_1DADAD660(&qword_1EB6829C8, &qword_1EB6829D0);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EB6829A8);
  }
  return result;
}

uint64_t sub_1DADF4DFC()
{
  return sub_1DADF4ED4(&qword_1EA8F8CE8, (void (*)(uint64_t))type metadata accessor for Key);
}

uint64_t sub_1DADF4E44()
{
  return sub_1DADF4ED4(&qword_1EA8F8CF0, (void (*)(uint64_t))type metadata accessor for Key);
}

uint64_t sub_1DADF4E8C()
{
  return sub_1DADF4ED4(&qword_1EB682FA0, (void (*)(uint64_t))type metadata accessor for Key);
}

uint64_t sub_1DADF4ED4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1DADF4F1C(uint64_t a1)
{
  sub_1DADF6840();
  sub_1DADF6BE0();
  sub_1DADF6860();
  uint64_t v2 = sub_1DADF6BF0();
  swift_bridgeObjectRelease();

  return sub_1DADF4FB0(a1, v2);
}

unint64_t sub_1DADF4FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_1DADF6840();
    uint64_t v8 = v7;
    if (v6 == sub_1DADF6840() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_1DADF6BB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_1DADF6840();
          uint64_t v15 = v14;
          if (v13 == sub_1DADF6840() && v15 == v16) {
            break;
          }
          char v18 = sub_1DADF6BB0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_1DADF5128(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *v1;
  int64_t v4 = *(void *)(*v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(void *)(v3 + 24) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v23 = v4 + v2;
  }
  else {
    int64_t v23 = v4;
  }
  unint64_t v3 = sub_1DADF4510(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *(void *)(v3 + 16);
  uint64_t v10 = (*(void *)(v3 + 24) >> 1) - v9;
  uint64_t v11 = *(void *)(sub_1DADF60F0() - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v14 = v3 + v13 + v12 * v9;
  unint64_t v15 = a1 + v13;
  uint64_t v16 = v12 * v8;
  unint64_t v17 = v14 + v16;
  unint64_t v18 = v15 + v16;
  if (v15 < v17 && v14 < v18) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v20 = *(void *)(v3 + 16);
  BOOL v21 = __OFADD__(v20, v8);
  uint64_t v22 = v20 + v8;
  if (!v21)
  {
    *(void *)(v3 + 16) = v22;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1DADF6B70();
  __break(1u);
  return result;
}

uint64_t sub_1DADF52D8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(sub_1DADF60F0() - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_1DADF6B70();
  __break(1u);
  return result;
}

uint64_t sub_1DADF5430(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB682FB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1DADF5498(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

id sub_1DADF54A8()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  qword_1EA8F99D8 = (uint64_t)result;
  return result;
}

uint64_t sub_1DADF54FC(uint64_t a1)
{
  return sub_1DADF5814(a1, qword_1EA8F9A30);
}

uint64_t sub_1DADF5520()
{
  return sub_1DADF58DC(&qword_1EA8F99E0, (uint64_t)qword_1EA8F9A30);
}

uint64_t sub_1DADF5544@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADF5954(&qword_1EA8F99E0, (uint64_t)qword_1EA8F9A30, a1);
}

uint64_t sub_1DADF5568(uint64_t a1)
{
  return sub_1DADF5814(a1, qword_1EA8F9A48);
}

uint64_t sub_1DADF558C()
{
  return sub_1DADF58DC(&qword_1EA8F99E8, (uint64_t)qword_1EA8F9A48);
}

uint64_t sub_1DADF55B0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADF5954(&qword_1EA8F99E8, (uint64_t)qword_1EA8F9A48, a1);
}

uint64_t sub_1DADF55D4(uint64_t a1)
{
  return sub_1DADF5814(a1, qword_1EA8F9A60);
}

uint64_t sub_1DADF55F8()
{
  return sub_1DADF58DC(&qword_1EA8F99F0, (uint64_t)qword_1EA8F9A60);
}

uint64_t sub_1DADF561C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADF5954(&qword_1EA8F99F0, (uint64_t)qword_1EA8F9A60, a1);
}

uint64_t sub_1DADF5640(uint64_t a1)
{
  return sub_1DADF5814(a1, qword_1EA8F9A78);
}

uint64_t sub_1DADF5664()
{
  return sub_1DADF58DC(&qword_1EA8F99F8, (uint64_t)qword_1EA8F9A78);
}

uint64_t sub_1DADF5688@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADF5954(&qword_1EA8F99F8, (uint64_t)qword_1EA8F9A78, a1);
}

uint64_t sub_1DADF56AC(uint64_t a1)
{
  return sub_1DADF5814(a1, qword_1EA8F9A90);
}

uint64_t sub_1DADF56D0()
{
  return sub_1DADF58DC(&qword_1EA8F9A00, (uint64_t)qword_1EA8F9A90);
}

uint64_t sub_1DADF56F4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADF5954(&qword_1EA8F9A00, (uint64_t)qword_1EA8F9A90, a1);
}

uint64_t sub_1DADF5718(uint64_t a1)
{
  return sub_1DADF5814(a1, qword_1EA8F9AA8);
}

uint64_t sub_1DADF573C()
{
  return sub_1DADF58DC(&qword_1EA8F9A08, (uint64_t)qword_1EA8F9AA8);
}

uint64_t sub_1DADF5760@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADF5954(&qword_1EA8F9A08, (uint64_t)qword_1EA8F9AA8, a1);
}

uint64_t sub_1DADF5784(uint64_t a1)
{
  return sub_1DADF5814(a1, qword_1EA8F9AC0);
}

uint64_t sub_1DADF57A8()
{
  return sub_1DADF58DC(&qword_1EA8F9A10, (uint64_t)qword_1EA8F9AC0);
}

uint64_t sub_1DADF57CC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADF5954(&qword_1EA8F9A10, (uint64_t)qword_1EA8F9AC0, a1);
}

uint64_t sub_1DADF57F0(uint64_t a1)
{
  return sub_1DADF5814(a1, qword_1EA8F9AD8);
}

uint64_t sub_1DADF5814(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1DADF5A90();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_1EA8F99D0 != -1) {
    swift_once();
  }
  id v4 = (id)qword_1EA8F99D8;
  return sub_1DADF5A80();
}

uint64_t sub_1DADF58B8()
{
  return sub_1DADF58DC(&qword_1EA8F9A18, (uint64_t)qword_1EA8F9AD8);
}

uint64_t sub_1DADF58DC(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1DADF5A90();

  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_1DADF5930@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADF5954(&qword_1EA8F9A18, (uint64_t)qword_1EA8F9AD8, a1);
}

uint64_t sub_1DADF5954@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_1DADF5A90();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_1DADF5A10()
{
  return MEMORY[0x1F40E3F58]();
}

uint64_t sub_1DADF5A20()
{
  return MEMORY[0x1F40E40D0]();
}

uint64_t sub_1DADF5A30()
{
  return MEMORY[0x1F40E4620]();
}

uint64_t sub_1DADF5A40()
{
  return MEMORY[0x1F40E4640]();
}

uint64_t sub_1DADF5A50()
{
  return MEMORY[0x1F40E5658]();
}

uint64_t sub_1DADF5A60()
{
  return MEMORY[0x1F40E5890]();
}

uint64_t sub_1DADF5A70()
{
  return MEMORY[0x1F40E5F50]();
}

uint64_t sub_1DADF5A80()
{
  return MEMORY[0x1F40E05E0]();
}

uint64_t sub_1DADF5A90()
{
  return MEMORY[0x1F40E05E8]();
}

uint64_t sub_1DADF5AA0()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1DADF5AB0()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1DADF5AC0()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1DADF5AD0()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1DADF5AE0()
{
  return MEMORY[0x1F40D69E0]();
}

uint64_t sub_1DADF5AF0()
{
  return MEMORY[0x1F40D6A40]();
}

uint64_t sub_1DADF5B00()
{
  return MEMORY[0x1F40D6A50]();
}

uint64_t sub_1DADF5B10()
{
  return MEMORY[0x1F40D6A78]();
}

uint64_t sub_1DADF5B20()
{
  return MEMORY[0x1F40D6B80]();
}

uint64_t sub_1DADF5B30()
{
  return MEMORY[0x1F40D6B88]();
}

uint64_t sub_1DADF5B40()
{
  return MEMORY[0x1F40D6B90]();
}

uint64_t sub_1DADF5B50()
{
  return MEMORY[0x1F40D6B98]();
}

uint64_t sub_1DADF5B60()
{
  return MEMORY[0x1F40D6BA0]();
}

uint64_t sub_1DADF5B70()
{
  return MEMORY[0x1F40D6BA8]();
}

uint64_t sub_1DADF5B80()
{
  return MEMORY[0x1F40D6BB8]();
}

uint64_t sub_1DADF5B90()
{
  return MEMORY[0x1F40D6D80]();
}

uint64_t sub_1DADF5BA0()
{
  return MEMORY[0x1F40F7D88]();
}

uint64_t sub_1DADF5BB0()
{
  return MEMORY[0x1F40F7DA0]();
}

uint64_t sub_1DADF5BC0()
{
  return MEMORY[0x1F40F7DB0]();
}

uint64_t sub_1DADF5BD0()
{
  return MEMORY[0x1F40F7DD0]();
}

uint64_t sub_1DADF5BE0()
{
  return MEMORY[0x1F40F7E80]();
}

uint64_t sub_1DADF5BF0()
{
  return MEMORY[0x1F40F8030]();
}

uint64_t sub_1DADF5C00()
{
  return MEMORY[0x1F40F8050]();
}

uint64_t sub_1DADF5C10()
{
  return MEMORY[0x1F40F80A0]();
}

uint64_t sub_1DADF5C20()
{
  return MEMORY[0x1F40F8108]();
}

uint64_t sub_1DADF5C30()
{
  return MEMORY[0x1F40F8118]();
}

uint64_t sub_1DADF5C40()
{
  return MEMORY[0x1F40F8278]();
}

uint64_t sub_1DADF5C50()
{
  return MEMORY[0x1F40F82A8]();
}

uint64_t sub_1DADF5C60()
{
  return MEMORY[0x1F40F82B8]();
}

uint64_t sub_1DADF5C70()
{
  return MEMORY[0x1F40F82C8]();
}

uint64_t sub_1DADF5C80()
{
  return MEMORY[0x1F40F82D8]();
}

uint64_t sub_1DADF5C90()
{
  return MEMORY[0x1F40F8350]();
}

uint64_t sub_1DADF5CA0()
{
  return MEMORY[0x1F40F8360]();
}

uint64_t sub_1DADF5CB0()
{
  return MEMORY[0x1F40F8378]();
}

uint64_t sub_1DADF5CC0()
{
  return MEMORY[0x1F40F83E0]();
}

uint64_t sub_1DADF5CD0()
{
  return MEMORY[0x1F40F8408]();
}

uint64_t sub_1DADF5CE0()
{
  return MEMORY[0x1F40F8418]();
}

uint64_t sub_1DADF5CF0()
{
  return MEMORY[0x1F40F8438]();
}

uint64_t sub_1DADF5D00()
{
  return MEMORY[0x1F40F8450]();
}

uint64_t sub_1DADF5D10()
{
  return MEMORY[0x1F40F84B8]();
}

uint64_t sub_1DADF5D20()
{
  return MEMORY[0x1F40F84E8]();
}

uint64_t sub_1DADF5D30()
{
  return MEMORY[0x1F40F8650]();
}

uint64_t sub_1DADF5D40()
{
  return MEMORY[0x1F40F87F0]();
}

uint64_t sub_1DADF5D50()
{
  return MEMORY[0x1F40F8808]();
}

uint64_t sub_1DADF5D60()
{
  return MEMORY[0x1F40F8818]();
}

uint64_t sub_1DADF5D70()
{
  return MEMORY[0x1F40F8998]();
}

uint64_t sub_1DADF5D80()
{
  return MEMORY[0x1F40F8A28]();
}

uint64_t sub_1DADF5D90()
{
  return MEMORY[0x1F40F8AE0]();
}

uint64_t sub_1DADF5DA0()
{
  return MEMORY[0x1F40F8AF0]();
}

uint64_t sub_1DADF5DB0()
{
  return MEMORY[0x1F40F8B98]();
}

uint64_t sub_1DADF5DC0()
{
  return MEMORY[0x1F40F8C00]();
}

uint64_t sub_1DADF5DF0()
{
  return MEMORY[0x1F40F8CD0]();
}

uint64_t sub_1DADF5E00()
{
  return MEMORY[0x1F40F8CD8]();
}

uint64_t sub_1DADF5E10()
{
  return MEMORY[0x1F40F8CE0]();
}

uint64_t sub_1DADF5E20()
{
  return MEMORY[0x1F40F8EA0]();
}

uint64_t sub_1DADF5E30()
{
  return MEMORY[0x1F40F8F40]();
}

uint64_t sub_1DADF5E40()
{
  return MEMORY[0x1F40F8F50]();
}

uint64_t sub_1DADF5E50()
{
  return MEMORY[0x1F40F8FF8]();
}

uint64_t sub_1DADF5E60()
{
  return MEMORY[0x1F40F9008]();
}

uint64_t sub_1DADF5E70()
{
  return MEMORY[0x1F40F9080]();
}

uint64_t sub_1DADF5E80()
{
  return MEMORY[0x1F40F9098]();
}

uint64_t sub_1DADF5E90()
{
  return MEMORY[0x1F40F9100]();
}

uint64_t sub_1DADF5EA0()
{
  return MEMORY[0x1F40F9110]();
}

uint64_t sub_1DADF5EB0()
{
  return MEMORY[0x1F40F9138]();
}

uint64_t sub_1DADF5EC0()
{
  return MEMORY[0x1F40F9150]();
}

uint64_t sub_1DADF5ED0()
{
  return MEMORY[0x1F40F91A8]();
}

uint64_t sub_1DADF5EE0()
{
  return MEMORY[0x1F40F9208]();
}

uint64_t sub_1DADF5EF0()
{
  return MEMORY[0x1F40F9220]();
}

uint64_t sub_1DADF5F00()
{
  return MEMORY[0x1F40F9228]();
}

uint64_t sub_1DADF5F10()
{
  return MEMORY[0x1F40F9268]();
}

uint64_t sub_1DADF5F20()
{
  return MEMORY[0x1F40F9280]();
}

uint64_t sub_1DADF5F30()
{
  return MEMORY[0x1F40F9298]();
}

uint64_t sub_1DADF5F40()
{
  return MEMORY[0x1F40F92A8]();
}

uint64_t sub_1DADF5F50()
{
  return MEMORY[0x1F40F9340]();
}

uint64_t sub_1DADF5F60()
{
  return MEMORY[0x1F40F93D8]();
}

uint64_t sub_1DADF5F70()
{
  return MEMORY[0x1F40F9550]();
}

uint64_t sub_1DADF5F80()
{
  return MEMORY[0x1F40F9568]();
}

uint64_t sub_1DADF5F90()
{
  return MEMORY[0x1F40F9598]();
}

uint64_t sub_1DADF5FA0()
{
  return MEMORY[0x1F4103EE8]();
}

uint64_t sub_1DADF5FB0()
{
  return MEMORY[0x1F4103FB0]();
}

uint64_t sub_1DADF5FC0()
{
  return MEMORY[0x1F4104070]();
}

uint64_t sub_1DADF5FD0()
{
  return MEMORY[0x1F4104078]();
}

uint64_t sub_1DADF5FE0()
{
  return MEMORY[0x1F40F9648]();
}

uint64_t sub_1DADF5FF0()
{
  return MEMORY[0x1F40F9658]();
}

uint64_t sub_1DADF6000()
{
  return MEMORY[0x1F40F9660]();
}

uint64_t sub_1DADF6010()
{
  return MEMORY[0x1F40F9670]();
}

uint64_t sub_1DADF6020()
{
  return MEMORY[0x1F40F96C8]();
}

uint64_t sub_1DADF6030()
{
  return MEMORY[0x1F40F96D8]();
}

uint64_t sub_1DADF6040()
{
  return MEMORY[0x1F40F96F8]();
}

uint64_t sub_1DADF6050()
{
  return MEMORY[0x1F40F98C0]();
}

uint64_t sub_1DADF6060()
{
  return MEMORY[0x1F40F9A80]();
}

uint64_t sub_1DADF6070()
{
  return MEMORY[0x1F40F9A90]();
}

uint64_t sub_1DADF6080()
{
  return MEMORY[0x1F40F9A98]();
}

uint64_t sub_1DADF6090()
{
  return MEMORY[0x1F40F9AB0]();
}

uint64_t sub_1DADF60A0()
{
  return MEMORY[0x1F40F9AB8]();
}

uint64_t sub_1DADF60B0()
{
  return MEMORY[0x1F40F9AD0]();
}

uint64_t sub_1DADF60C0()
{
  return MEMORY[0x1F40F9AD8]();
}

uint64_t sub_1DADF60D0()
{
  return MEMORY[0x1F40F9B68]();
}

uint64_t sub_1DADF60E0()
{
  return MEMORY[0x1F40F9C78]();
}

uint64_t sub_1DADF60F0()
{
  return MEMORY[0x1F40F9C98]();
}

uint64_t sub_1DADF6100()
{
  return MEMORY[0x1F40F9CA8]();
}

uint64_t sub_1DADF6110()
{
  return MEMORY[0x1F40F9CD8]();
}

uint64_t sub_1DADF6120()
{
  return MEMORY[0x1F40F9CE8]();
}

uint64_t sub_1DADF6130()
{
  return MEMORY[0x1F40F9F90]();
}

uint64_t sub_1DADF6140()
{
  return MEMORY[0x1F40F9FA8]();
}

uint64_t sub_1DADF6150()
{
  return MEMORY[0x1F40F9FB8]();
}

uint64_t sub_1DADF6160()
{
  return MEMORY[0x1F40FA268]();
}

uint64_t sub_1DADF6170()
{
  return MEMORY[0x1F40FA2C0]();
}

uint64_t sub_1DADF6180()
{
  return MEMORY[0x1F40FA860]();
}

uint64_t sub_1DADF6190()
{
  return MEMORY[0x1F40FA868]();
}

uint64_t sub_1DADF61A0()
{
  return MEMORY[0x1F40FA880]();
}

uint64_t sub_1DADF61B0()
{
  return MEMORY[0x1F40FA8E0]();
}

uint64_t sub_1DADF61C0()
{
  return MEMORY[0x1F40FABB0]();
}

uint64_t sub_1DADF61D0()
{
  return MEMORY[0x1F40FABC0]();
}

uint64_t sub_1DADF61E0()
{
  return MEMORY[0x1F40FACC8]();
}

uint64_t sub_1DADF61F0()
{
  return MEMORY[0x1F40FACD0]();
}

uint64_t sub_1DADF6200()
{
  return MEMORY[0x1F40FAD68]();
}

uint64_t sub_1DADF6210()
{
  return MEMORY[0x1F40FADB8]();
}

uint64_t sub_1DADF6220()
{
  return MEMORY[0x1F40FADC0]();
}

uint64_t sub_1DADF6230()
{
  return MEMORY[0x1F40FADD8]();
}

uint64_t sub_1DADF6240()
{
  return MEMORY[0x1F40FADE0]();
}

uint64_t sub_1DADF6250()
{
  return MEMORY[0x1F40FADF8]();
}

uint64_t sub_1DADF6260()
{
  return MEMORY[0x1F40FAE00]();
}

uint64_t sub_1DADF6270()
{
  return MEMORY[0x1F40FAE18]();
}

uint64_t sub_1DADF6280()
{
  return MEMORY[0x1F40FAE28]();
}

uint64_t sub_1DADF6290()
{
  return MEMORY[0x1F40FAE68]();
}

uint64_t sub_1DADF62A0()
{
  return MEMORY[0x1F40FAF00]();
}

uint64_t sub_1DADF62B0()
{
  return MEMORY[0x1F40FAF60]();
}

uint64_t sub_1DADF62C0()
{
  return MEMORY[0x1F40FAFC0]();
}

uint64_t sub_1DADF62D0()
{
  return MEMORY[0x1F40FB038]();
}

uint64_t sub_1DADF62E0()
{
  return MEMORY[0x1F40FB068]();
}

uint64_t sub_1DADF62F0()
{
  return MEMORY[0x1F40FB0E8]();
}

uint64_t sub_1DADF6300()
{
  return MEMORY[0x1F40FB130]();
}

uint64_t sub_1DADF6310()
{
  return MEMORY[0x1F40FB148]();
}

uint64_t sub_1DADF6320()
{
  return MEMORY[0x1F40FB258]();
}

uint64_t sub_1DADF6330()
{
  return MEMORY[0x1F40FB460]();
}

uint64_t sub_1DADF6340()
{
  return MEMORY[0x1F40FB558]();
}

uint64_t sub_1DADF6350()
{
  return MEMORY[0x1F40FB580]();
}

uint64_t sub_1DADF6360()
{
  return MEMORY[0x1F41040E8]();
}

uint64_t sub_1DADF6370()
{
  return MEMORY[0x1F40FB5D0]();
}

uint64_t sub_1DADF6380()
{
  return MEMORY[0x1F40FB5D8]();
}

uint64_t sub_1DADF6390()
{
  return MEMORY[0x1F40FB5F0]();
}

uint64_t sub_1DADF63A0()
{
  return MEMORY[0x1F40FB650]();
}

uint64_t sub_1DADF63B0()
{
  return MEMORY[0x1F40FB920]();
}

uint64_t sub_1DADF63C0()
{
  return MEMORY[0x1F40FB9E8]();
}

uint64_t sub_1DADF63D0()
{
  return MEMORY[0x1F40FBB78]();
}

uint64_t sub_1DADF63E0()
{
  return MEMORY[0x1F40FBCB8]();
}

uint64_t sub_1DADF63F0()
{
  return MEMORY[0x1F40FBCC8]();
}

uint64_t sub_1DADF6400()
{
  return MEMORY[0x1F40FBD60]();
}

uint64_t sub_1DADF6410()
{
  return MEMORY[0x1F40FBE68]();
}

uint64_t sub_1DADF6420()
{
  return MEMORY[0x1F40FC000]();
}

uint64_t sub_1DADF6430()
{
  return MEMORY[0x1F40FC010]();
}

uint64_t sub_1DADF6440()
{
  return MEMORY[0x1F40FC048]();
}

uint64_t sub_1DADF6450()
{
  return MEMORY[0x1F40FC140]();
}

uint64_t sub_1DADF6460()
{
  return MEMORY[0x1F40FC158]();
}

uint64_t sub_1DADF6470()
{
  return MEMORY[0x1F40FC2E0]();
}

uint64_t sub_1DADF6480()
{
  return MEMORY[0x1F40FC350]();
}

uint64_t sub_1DADF6490()
{
  return MEMORY[0x1F40FC3B8]();
}

uint64_t sub_1DADF64A0()
{
  return MEMORY[0x1F40FC3D0]();
}

uint64_t sub_1DADF64B0()
{
  return MEMORY[0x1F40FC3E0]();
}

uint64_t sub_1DADF64C0()
{
  return MEMORY[0x1F40FC3E8]();
}

uint64_t sub_1DADF64D0()
{
  return MEMORY[0x1F40FC428]();
}

uint64_t sub_1DADF64E0()
{
  return MEMORY[0x1F40FC438]();
}

uint64_t sub_1DADF64F0()
{
  return MEMORY[0x1F40FC508]();
}

uint64_t sub_1DADF6500()
{
  return MEMORY[0x1F40FC550]();
}

uint64_t sub_1DADF6510()
{
  return MEMORY[0x1F40FC568]();
}

uint64_t sub_1DADF6520()
{
  return MEMORY[0x1F40FC5A0]();
}

uint64_t sub_1DADF6530()
{
  return MEMORY[0x1F40FC5D0]();
}

uint64_t sub_1DADF6540()
{
  return MEMORY[0x1F40FC5E8]();
}

uint64_t sub_1DADF6550()
{
  return MEMORY[0x1F40FC600]();
}

uint64_t sub_1DADF6560()
{
  return MEMORY[0x1F40FC620]();
}

uint64_t sub_1DADF6590()
{
  return MEMORY[0x1F40FC6A0]();
}

uint64_t sub_1DADF65B0()
{
  return MEMORY[0x1F40FC6C8]();
}

uint64_t sub_1DADF65D0()
{
  return MEMORY[0x1F40FC6F0]();
}

uint64_t sub_1DADF65E0()
{
  return MEMORY[0x1F40FC700]();
}

uint64_t sub_1DADF65F0()
{
  return MEMORY[0x1F40FC708]();
}

uint64_t sub_1DADF6600()
{
  return MEMORY[0x1F40FC718]();
}

uint64_t sub_1DADF6610()
{
  return MEMORY[0x1F40FC910]();
}

uint64_t sub_1DADF6620()
{
  return MEMORY[0x1F40FC920]();
}

uint64_t sub_1DADF6630()
{
  return MEMORY[0x1F40FC930]();
}

uint64_t sub_1DADF6640()
{
  return MEMORY[0x1F40FC940]();
}

uint64_t sub_1DADF6650()
{
  return MEMORY[0x1F40FC968]();
}

uint64_t sub_1DADF6660()
{
  return MEMORY[0x1F40FC9B8]();
}

uint64_t sub_1DADF6670()
{
  return MEMORY[0x1F40FCB40]();
}

uint64_t sub_1DADF6680()
{
  return MEMORY[0x1F40FCB58]();
}

uint64_t sub_1DADF6690()
{
  return MEMORY[0x1F40FCB68]();
}

uint64_t sub_1DADF66A0()
{
  return MEMORY[0x1F40FCB78]();
}

uint64_t sub_1DADF66B0()
{
  return MEMORY[0x1F40FCBF8]();
}

uint64_t sub_1DADF66C0()
{
  return MEMORY[0x1F40FCC10]();
}

uint64_t sub_1DADF66D0()
{
  return MEMORY[0x1F40FCC30]();
}

uint64_t sub_1DADF66E0()
{
  return MEMORY[0x1F40FCC40]();
}

uint64_t sub_1DADF66F0()
{
  return MEMORY[0x1F40FCC50]();
}

uint64_t sub_1DADF6700()
{
  return MEMORY[0x1F40FCC98]();
}

uint64_t sub_1DADF6710()
{
  return MEMORY[0x1F40FCD10]();
}

uint64_t sub_1DADF6720()
{
  return MEMORY[0x1F40FCD30]();
}

uint64_t sub_1DADF6730()
{
  return MEMORY[0x1F40FCD90]();
}

uint64_t sub_1DADF6740()
{
  return MEMORY[0x1F40FCED8]();
}

uint64_t sub_1DADF6750()
{
  return MEMORY[0x1F4186D40]();
}

uint64_t sub_1DADF6760()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1DADF6770()
{
  return MEMORY[0x1F4104270]();
}

uint64_t sub_1DADF6780()
{
  return MEMORY[0x1F4104280]();
}

uint64_t sub_1DADF6790()
{
  return MEMORY[0x1F41042B0]();
}

uint64_t sub_1DADF67A0()
{
  return MEMORY[0x1F41043D8]();
}

uint64_t sub_1DADF67B0()
{
  return MEMORY[0x1F40E5FE0]();
}

uint64_t sub_1DADF67C0()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1DADF67D0()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1DADF67E0()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1DADF67F0()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1DADF6800()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1DADF6810()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1DADF6820()
{
  return MEMORY[0x1F40E61B8]();
}

uint64_t sub_1DADF6830()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1DADF6840()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1DADF6850()
{
  return MEMORY[0x1F4183958]();
}

uint64_t sub_1DADF6860()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1DADF6870()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1DADF6880()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1DADF6890()
{
  return MEMORY[0x1F4183A88]();
}

uint64_t sub_1DADF68A0()
{
  return MEMORY[0x1F4183AA0]();
}

uint64_t sub_1DADF68C0()
{
  return MEMORY[0x1F4183AB0]();
}

uint64_t sub_1DADF68D0()
{
  return MEMORY[0x1F4183B10]();
}

uint64_t sub_1DADF68E0()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1DADF68F0()
{
  return MEMORY[0x1F4183BA0]();
}

uint64_t sub_1DADF6900()
{
  return MEMORY[0x1F4183D70]();
}

uint64_t sub_1DADF6910()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1DADF6920()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1DADF6930()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1DADF6940()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1DADF6950()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1DADF6960()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1DADF6970()
{
  return MEMORY[0x1F40E63B8]();
}

uint64_t sub_1DADF6980()
{
  return MEMORY[0x1F40E63C8]();
}

uint64_t sub_1DADF6990()
{
  return MEMORY[0x1F4184008]();
}

uint64_t sub_1DADF69A0()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1DADF69B0()
{
  return MEMORY[0x1F40E6468]();
}

uint64_t sub_1DADF69C0()
{
  return MEMORY[0x1F40E6478]();
}

uint64_t sub_1DADF69D0()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1DADF69E0()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1DADF69F0()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1DADF6A00()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1DADF6A10()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1DADF6A20()
{
  return MEMORY[0x1F4187040]();
}

uint64_t sub_1DADF6A30()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1DADF6A40()
{
  return MEMORY[0x1F41870B8]();
}

uint64_t sub_1DADF6A50()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1DADF6A60()
{
  return MEMORY[0x1F40FCF08]();
}

uint64_t sub_1DADF6A70()
{
  return MEMORY[0x1F40E6910]();
}

uint64_t sub_1DADF6A80()
{
  return MEMORY[0x1F4184628]();
}

uint64_t sub_1DADF6A90()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1DADF6AA0()
{
  return MEMORY[0x1F40E6D98]();
}

uint64_t sub_1DADF6AB0()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1DADF6AC0()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1DADF6AD0()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1DADF6AE0()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1DADF6AF0()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1DADF6B00()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1DADF6B10()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1DADF6B20()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1DADF6B30()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1DADF6B40()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1DADF6B50()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1DADF6B60()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1DADF6B70()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1DADF6B90()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1DADF6BA0()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1DADF6BB0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1DADF6BC0()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1DADF6BD0()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1DADF6BE0()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1DADF6BF0()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_1DADF6C00()
{
  return MEMORY[0x1F41862B8]();
}

uint64_t sub_1DADF6C10()
{
  return MEMORY[0x1F4186318]();
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return MEMORY[0x1F410C2B0]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x1F410C548]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGImageRelease(CGImageRef image)
{
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t INTypedIntentWithIntent()
{
  return MEMORY[0x1F40E9BB0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t NSStringFromWidgetFamily()
{
  return MEMORY[0x1F41117F0]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1F4166B98](lhs, rhs);
}

uint64_t UIPointRoundToScale()
{
  return MEMORY[0x1F4166DF8]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x1F4166E08]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1F4166E20]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1F4166E38]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1F4166E48]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4166E80]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1F4166E98]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1F4166EB8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x1F40C9C88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1F4186488]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1F41864B0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1F4186550]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1F4186618]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}