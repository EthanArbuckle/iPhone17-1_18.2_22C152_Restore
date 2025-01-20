BOOL HKUIEqualDoubles(double a1, double a2)
{
  return vabdd_f64(a1, a2) <= 2.22044605e-16;
}

double HKUIOnePixel()
{
  double result = *(double *)&HKUIOnePixel___onePixel;
  if (*(double *)&HKUIOnePixel___onePixel == 2.22507386e-308)
  {
    v1 = objc_msgSend(MEMORY[0x263F82B60], "mainScreen", *(double *)&HKUIOnePixel___onePixel);
    [v1 scale];
    *(double *)&HKUIOnePixel___onePixel = 1.0 / v2;

    return *(double *)&HKUIOnePixel___onePixel;
  }
  return result;
}

id HKHealthKitUIFrameworkBundle()
{
  v0 = (void *)HKHealthKitUIFrameworkBundle___HKUIClassBundle;
  if (!HKHealthKitUIFrameworkBundle___HKUIClassBundle)
  {
    uint64_t v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v2 = (void *)HKHealthKitUIFrameworkBundle___HKUIClassBundle;
    HKHealthKitUIFrameworkBundle___HKUIClassBundle = v1;

    v0 = (void *)HKHealthKitUIFrameworkBundle___HKUIClassBundle;
  }

  return v0;
}

double HKUIFloorToScreenScale(double a1)
{
  double v2 = *(double *)&HKUIFloorToScreenScale___mainscreenScale;
  if (*(double *)&HKUIFloorToScreenScale___mainscreenScale == 2.22507386e-308)
  {
    v3 = objc_msgSend(MEMORY[0x263F82B60], "mainScreen", *(double *)&HKUIFloorToScreenScale___mainscreenScale);
    [v3 scale];
    HKUIFloorToScreenScale___mainscreenScale = v4;

    double v2 = *(double *)&HKUIFloorToScreenScale___mainscreenScale;
  }
  return floor(v2 * a1) / v2;
}

uint64_t View.healthDataAccessRequest<A>(store:shareTypes:readTypes:trigger:completion:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v32 = a7;
  uint64_t v28 = a2;
  uint64_t v29 = a5;
  uint64_t v26 = a4;
  v27 = (void *)a1;
  uint64_t v30 = a9;
  uint64_t v31 = a10;
  sub_21FA72DDC(0, &qword_267EF3160, MEMORY[0x263F185D0]);
  uint64_t v13 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v15 = (uint64_t *)((char *)&v26 - v14);
  uint64_t v16 = *(void *)(a8 - 8);
  MEMORY[0x270FA5388](v13);
  v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for HealthStoreAuthorizationOverlayModifier();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  v22 = (char *)&v26 - v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v26, a8);
  sub_21FA71998(v15);
  v23 = v27;
  sub_21FA71A08((uint64_t)v27, v28, a3, (uint64_t)v18, v29, a6, (uint64_t)v15, a8, v22);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  id v24 = v23;
  MEMORY[0x223C56CA0](v22, v32, v19, v31);
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v22, v19);
}

uint64_t type metadata accessor for HealthStoreAuthorizationOverlayModifier()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21FA71998@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_21FA72DDC(0, &qword_267EF3168, MEMORY[0x263F185C8]);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_21FA71A08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>)
{
  *(void *)a9 = a1;
  *((void *)a9 + 1) = a2;
  *((void *)a9 + 2) = a3;
  v15 = (int *)type metadata accessor for HealthStoreAuthorizationOverlayModifier();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(a8 - 8) + 32))(&a9[v15[11]], a4, a8);
  uint64_t v16 = &a9[v15[12]];
  *(void *)uint64_t v16 = a5;
  *((void *)v16 + 1) = a6;
  uint64_t v17 = (uint64_t)&a9[v15[13]];

  return sub_21FA75DB8(a7, v17);
}

uint64_t View.healthDataAccessRequest<A>(store:readTypes:trigger:completion:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v31 = a8;
  uint64_t v29 = a9;
  uint64_t v30 = a6;
  uint64_t v27 = a2;
  uint64_t v28 = a4;
  uint64_t v26 = a3;
  sub_21FA72DDC(0, &qword_267EF3160, MEMORY[0x263F185D0]);
  uint64_t v13 = MEMORY[0x270FA5388](v12 - 8);
  v15 = (uint64_t *)((char *)&v25 - v14);
  uint64_t v16 = *(void *)(a7 - 8);
  MEMORY[0x270FA5388](v13);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for HealthStoreAuthorizationOverlayModifier();
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  v22 = (char *)&v25 - v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v26, a7);
  sub_21FA71998(v15);
  sub_21FA71A08((uint64_t)a1, 0, v27, (uint64_t)v18, v28, a5, (uint64_t)v15, a7, v22);
  id v23 = a1;
  swift_retain();
  swift_bridgeObjectRetain();
  MEMORY[0x223C56CA0](v22, v30, v19, v31);
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v22, v19);
}

uint64_t View.healthDataAccessRequest<A>(store:objectType:predicate:trigger:completion:)@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v38 = a7;
  uint64_t v34 = a5;
  uint64_t v35 = a6;
  v33 = a2;
  uint64_t v36 = a9;
  uint64_t v37 = a10;
  sub_21FA72DDC(0, &qword_267EF3160, MEMORY[0x263F185D0]);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  uint64_t v17 = (uint64_t *)((char *)&v32 - v16);
  uint64_t v18 = *(void *)(a8 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = (int *)type metadata accessor for HealthStorePerObjectAuthorizationOverlayModifier();
  uint64_t v22 = *((void *)v21 - 1);
  MEMORY[0x270FA5388](v21);
  id v24 = (char *)&v32 - v23;
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, a4, a8);
  *uint64_t v17 = swift_getKeyPath();
  sub_21FA72DDC(0, &qword_267EF3168, MEMORY[0x263F185C8]);
  swift_storeEnumTagMultiPayload();
  uint64_t v25 = v33;
  *(void *)id v24 = a1;
  *((void *)v24 + 1) = v25;
  *((void *)v24 + 2) = a3;
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(&v24[v21[11]], v20, a8);
  uint64_t v26 = &v24[v21[12]];
  uint64_t v27 = v35;
  *(void *)uint64_t v26 = v34;
  *((void *)v26 + 1) = v27;
  sub_21FA75DB8((uint64_t)v17, (uint64_t)&v24[v21[13]]);
  id v28 = a3;
  swift_retain();
  id v29 = a1;
  id v30 = v25;
  MEMORY[0x223C56CA0](v24, v38, v21, v37);
  return (*(uint64_t (**)(char *, int *))(v22 + 8))(v24, v21);
}

uint64_t type metadata accessor for HealthStorePerObjectAuthorizationOverlayModifier()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_21FA71FC8(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzSQRd__r__lAA15ModifiedContentVyx09HealthKitB00F33StoreAuthorizationOverlayModifier33_214B0F285CDA8168FBED6EA091EA168CLLVyqd__GGAaBHPxAaBHD1__AiA0cK0HPyHCHCTm(a1, (void (*)(uint64_t, void, void))type metadata accessor for HealthStoreAuthorizationOverlayModifier);
}

uint64_t sub_21FA71FF4(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzSQRd__r__lAA15ModifiedContentVyx09HealthKitB00F33StoreAuthorizationOverlayModifier33_214B0F285CDA8168FBED6EA091EA168CLLVyqd__GGAaBHPxAaBHD1__AiA0cK0HPyHCHCTm(a1, (void (*)(uint64_t, void, void))type metadata accessor for HealthStorePerObjectAuthorizationOverlayModifier);
}

uint64_t get_witness_table_7SwiftUI4ViewRzSQRd__r__lAA15ModifiedContentVyx09HealthKitB00F33StoreAuthorizationOverlayModifier33_214B0F285CDA8168FBED6EA091EA168CLLVyqd__GGAaBHPxAaBHD1__AiA0cK0HPyHCHCTm(uint64_t a1, void (*a2)(uint64_t, void, void))
{
  return swift_getWitnessTable();
}

uint64_t sub_21FA720B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 40);
}

void sub_21FA720B8()
{
}

void **sub_21FA720C8(void **a1, void **a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64) + 7;
  uint64_t v9 = sub_21FA76010();
  uint64_t v10 = *(void *)(v9 - 8);
  int v11 = *(_DWORD *)(v10 + 80);
  uint64_t v12 = v11 & 0xF8 | 7;
  if (*(void *)(v10 + 64) <= 8uLL) {
    uint64_t v13 = 8;
  }
  else {
    uint64_t v13 = *(void *)(v10 + 64);
  }
  int v14 = (v11 | v7) & 0x100000;
  uint64_t v15 = (char *)*a2;
  *a1 = *a2;
  if ((v12 | v7) != 7
    || v14 != 0
    || v13
     + ((v12
       + ((v8 + ((v7 + 24) & ~(unint64_t)v7)) & 0xFFFFFFFFFFFFFFF8)
       + 16) & ~v12)
     + 1 > 0x18)
  {
    uint64_t v18 = (void **)&v15[((v12 | v7) + 16) & ~(v12 | v7)];
LABEL_30:
    swift_retain();
    return v18;
  }
  uint64_t v44 = v9;
  uint64_t v45 = v10;
  v46 = a1;
  uint64_t v19 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v20 = (void **)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v21 = *v20;
  *uint64_t v19 = *v20;
  uint64_t v22 = (void *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v23 = (void **)(((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8);
  id v24 = *v23;
  void *v22 = *v23;
  unint64_t v25 = ((unint64_t)v22 + v7 + 8) & ~(unint64_t)v7;
  unint64_t v26 = ((unint64_t)v23 + v7 + 8) & ~(unint64_t)v7;
  uint64_t v27 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16);
  id v28 = v15;
  id v29 = v21;
  id v30 = v24;
  v27(v25, v26, v5);
  uint64_t v31 = (void *)((v8 + v25) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v32 = (void *)((v8 + v26) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v33 = v32[1];
  *uint64_t v31 = *v32;
  v31[1] = v33;
  uint64_t v34 = (void *)(((unint64_t)v31 + v12 + 16) & ~v12);
  uint64_t v35 = (unsigned __int8 *)(((unint64_t)v32 + v12 + 16) & ~v12);
  unsigned int v36 = v35[v13];
  swift_retain();
  if (v36 < 2)
  {
    uint64_t v38 = v45;
    uint64_t v18 = v46;
LABEL_20:
    if (v36 != 1)
    {
LABEL_29:
      *uint64_t v34 = *(void *)v35;
      *((unsigned char *)v34 + v13) = 0;
      goto LABEL_30;
    }
  }
  else
  {
    if (v13 <= 3) {
      uint64_t v37 = v13;
    }
    else {
      uint64_t v37 = 4;
    }
    uint64_t v38 = v45;
    uint64_t v18 = v46;
    switch(v37)
    {
      case 1:
        int v39 = *v35;
        break;
      case 2:
        int v39 = *(unsigned __int16 *)v35;
        break;
      case 3:
        int v39 = *(unsigned __int16 *)v35 | (v35[2] << 16);
        break;
      case 4:
        int v39 = *(_DWORD *)v35;
        break;
      default:
        goto LABEL_20;
    }
    int v40 = (v39 | ((v36 - 2) << (8 * v13))) + 2;
    int v41 = v39 + 2;
    if (v13 >= 4) {
      int v42 = v41;
    }
    else {
      int v42 = v40;
    }
    if (v42 != 1) {
      goto LABEL_29;
    }
  }
  (*(void (**)(void *, unsigned __int8 *, uint64_t))(v38 + 16))(v34, v35, v44);
  *((unsigned char *)v34 + v13) = 1;
  return v18;
}

uint64_t sub_21FA723BC(id *a1, uint64_t a2)
{
  unint64_t v3 = (unint64_t)a1 + 15;

  v3 &= 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = (id *)((v3 + 15) & 0xFFFFFFFFFFFFFFF8);

  uint64_t v5 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v6 = v5 + 8;
  unint64_t v7 = ((unint64_t)v4 + *(unsigned __int8 *)(v5 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  (*(void (**)(unint64_t))(v5 + 8))(v7);
  unint64_t v8 = (*(void *)(v6 + 56) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  uint64_t v9 = *(void *)(sub_21FA76010() - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80) & 0xF8 | 7;
  int v11 = (unsigned __int8 *)((v8 + v10 + 16) & ~v10);
  unint64_t v12 = *(void *)(v9 + 64);
  if (v12 <= 8) {
    unint64_t v12 = 8;
  }
  unsigned int v13 = v11[v12];
  unsigned int v14 = v13 - 2;
  if (v13 >= 2)
  {
    if (v12 <= 3) {
      uint64_t v15 = v12;
    }
    else {
      uint64_t v15 = 4;
    }
    switch(v15)
    {
      case 1:
        int v16 = *v11;
        goto LABEL_12;
      case 2:
        int v16 = *(unsigned __int16 *)v11;
        goto LABEL_12;
      case 3:
        int v16 = *(unsigned __int16 *)v11 | (v11[2] << 16);
        goto LABEL_12;
      case 4:
        int v16 = *(_DWORD *)v11;
LABEL_12:
        int v17 = (v16 | (v14 << (8 * v12))) + 2;
        unsigned int v13 = v16 + 2;
        if (v12 < 4) {
          unsigned int v13 = v17;
        }
        break;
      default:
        break;
    }
  }
  if (v13 == 1)
  {
    uint64_t v18 = *(uint64_t (**)(void))(v9 + 8);
    return v18();
  }
  else
  {
    return swift_release();
  }
}

void **sub_21FA725A8(void **a1, void **a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  *a1 = *a2;
  uint64_t v5 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v6 = (void **)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v7 = *v6;
  *uint64_t v5 = *v6;
  unint64_t v8 = (void *)(((unint64_t)v5 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = (void **)(((unint64_t)v6 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v10 = *v9;
  *unint64_t v8 = *v9;
  uint64_t v11 = *(void *)(a3 + 16);
  uint64_t v12 = *(void *)(v11 - 8);
  unsigned int v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
  uint64_t v14 = v12 + 16;
  uint64_t v15 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v16 = ((unint64_t)v8 + v15 + 8) & ~v15;
  uint64_t v17 = ((unint64_t)v9 + v15 + 8) & ~v15;
  id v18 = v4;
  id v19 = v7;
  id v20 = v10;
  v13(v16, v17, v11);
  uint64_t v21 = *(void *)(v14 + 48) + 7;
  uint64_t v22 = (void *)((v21 + v16) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v23 = (void *)((v21 + v17) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v24 = v23[1];
  void *v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = sub_21FA76010();
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v27 = *(_DWORD *)(v26 + 80) & 0xF8;
  uint64_t v28 = v27 + 23;
  unint64_t v29 = (unint64_t)v22 + v27 + 23;
  unint64_t v30 = ~v27 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v31 = (void *)(v29 & v30);
  uint64_t v32 = (unsigned __int8 *)(((unint64_t)v23 + v28) & v30);
  if (*(void *)(v26 + 64) <= 8uLL) {
    uint64_t v33 = 8;
  }
  else {
    uint64_t v33 = *(void *)(*(void *)(v25 - 8) + 64);
  }
  unsigned int v34 = v32[v33];
  swift_retain();
  if (v34 >= 2)
  {
    if (v33 <= 3) {
      uint64_t v35 = v33;
    }
    else {
      uint64_t v35 = 4;
    }
    switch(v35)
    {
      case 1:
        int v36 = *v32;
        goto LABEL_13;
      case 2:
        int v36 = *(unsigned __int16 *)v32;
        goto LABEL_13;
      case 3:
        int v36 = *(unsigned __int16 *)v32 | (v32[2] << 16);
        goto LABEL_13;
      case 4:
        int v36 = *(_DWORD *)v32;
LABEL_13:
        int v37 = (v36 | ((v34 - 2) << (8 * v33))) + 2;
        unsigned int v38 = v36 + 2;
        if (v33 >= 4) {
          unsigned int v34 = v38;
        }
        else {
          unsigned int v34 = v37;
        }
        break;
      default:
        break;
    }
  }
  if (v34 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v26 + 16))(v31, v32, v25);
    char v39 = 1;
  }
  else
  {
    *uint64_t v31 = *(void *)v32;
    swift_retain();
    char v39 = 0;
  }
  *((unsigned char *)v31 + v33) = v39;
  return a1;
}

void **sub_21FA727E0(void **a1, void **a2, uint64_t a3)
{
  unint64_t v6 = (unint64_t)a2 + 15;
  uint64_t v5 = *a2;
  unint64_t v7 = *a1;
  *a1 = *a2;
  unint64_t v8 = (unint64_t)a1 + 15;
  id v9 = v5;

  uint64_t v10 = (void *)(v8 & 0xFFFFFFFFFFFFFFF8);
  v6 &= 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = *(void **)v6;
  uint64_t v12 = *(void **)(v8 & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v10 = *(void *)v6;
  id v13 = v11;

  uint64_t v14 = (void **)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v15 = (void **)((v6 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v16 = *v15;
  uint64_t v17 = *v14;
  *uint64_t v14 = *v15;
  id v18 = v16;

  uint64_t v19 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v20 = v19 + 24;
  uint64_t v21 = *(unsigned __int8 *)(v19 + 80);
  uint64_t v22 = ((unint64_t)v14 + v21 + 8) & ~v21;
  uint64_t v23 = ((unint64_t)v15 + v21 + 8) & ~v21;
  (*(void (**)(uint64_t, uint64_t))(v19 + 24))(v22, v23);
  uint64_t v24 = *(void *)(v20 + 40) + 7;
  uint64_t v25 = (void *)((v24 + v22) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v26 = (void *)((v24 + v23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v27 = v26[1];
  *uint64_t v25 = *v26;
  v25[1] = v27;
  swift_retain();
  swift_release();
  uint64_t v28 = sub_21FA76010();
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = *(_DWORD *)(v29 + 80) & 0xF8;
  uint64_t v31 = v30 + 23;
  unint64_t v32 = (unint64_t)v25 + v30 + 23;
  unint64_t v33 = ~v30 & 0xFFFFFFFFFFFFFFF8;
  unsigned int v34 = (unsigned __int8 *)(v32 & v33);
  unint64_t v35 = (unint64_t)v26 + v31;
  int v36 = (unsigned __int8 *)(v35 & v33);
  if ((v32 & v33) != (v35 & v33))
  {
    uint64_t v37 = v28;
    uint64_t v38 = *(void *)(v28 - 8);
    if (*(void *)(v29 + 64) <= 8uLL) {
      uint64_t v39 = 8;
    }
    else {
      uint64_t v39 = *(void *)(v29 + 64);
    }
    unsigned int v40 = v34[v39];
    unsigned int v41 = v40 - 2;
    if (v40 >= 2)
    {
      if (v39 <= 3) {
        uint64_t v42 = v39;
      }
      else {
        uint64_t v42 = 4;
      }
      switch(v42)
      {
        case 1:
          int v43 = *v34;
          goto LABEL_14;
        case 2:
          int v43 = *(unsigned __int16 *)v34;
          goto LABEL_14;
        case 3:
          int v43 = *(unsigned __int16 *)v34 | (v34[2] << 16);
          goto LABEL_14;
        case 4:
          int v43 = *(_DWORD *)v34;
LABEL_14:
          int v44 = (v43 | (v41 << (8 * v39))) + 2;
          unsigned int v40 = v43 + 2;
          if (v39 < 4) {
            unsigned int v40 = v44;
          }
          break;
        default:
          break;
      }
    }
    if (v40 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v38 + 8))(v34, v28);
    }
    else {
      swift_release();
    }
    unsigned int v45 = v36[v39];
    unsigned int v46 = v45 - 2;
    if (v45 >= 2)
    {
      if (v39 <= 3) {
        uint64_t v47 = v39;
      }
      else {
        uint64_t v47 = 4;
      }
      switch(v47)
      {
        case 1:
          int v48 = *v36;
          goto LABEL_28;
        case 2:
          int v48 = *(unsigned __int16 *)v36;
          goto LABEL_28;
        case 3:
          int v48 = *(unsigned __int16 *)v36 | (v36[2] << 16);
          goto LABEL_28;
        case 4:
          int v48 = *(_DWORD *)v36;
LABEL_28:
          int v49 = (v48 | (v46 << (8 * v39))) + 2;
          unsigned int v45 = v48 + 2;
          if (v39 < 4) {
            unsigned int v45 = v49;
          }
          break;
        default:
          break;
      }
    }
    if (v45 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v38 + 16))(v34, v36, v37);
      v34[v39] = 1;
    }
    else
    {
      *(void *)unsigned int v34 = *(void *)v36;
      v34[v39] = 0;
      swift_retain();
    }
  }
  return a1;
}

void **sub_21FA72AE8(void **a1, void **a2, uint64_t a3)
{
  unint64_t v5 = (unint64_t)a2 + 15;
  unint64_t v6 = *a1;
  *a1 = *a2;
  unint64_t v7 = (unint64_t)a1 + 15;

  v7 &= 0xFFFFFFFFFFFFFFF8;
  v5 &= 0xFFFFFFFFFFFFFFF8;
  unint64_t v8 = *(void **)v7;
  *(void *)unint64_t v7 = *(void *)v5;

  id v9 = (void **)((v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v10 = (void **)((v5 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v11 = *v9;
  *id v9 = *v10;

  uint64_t v12 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v13 = v12 + 40;
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = ((unint64_t)v9 + v14 + 8) & ~v14;
  uint64_t v16 = ((unint64_t)v10 + v14 + 8) & ~v14;
  (*(void (**)(uint64_t, uint64_t))(v12 + 40))(v15, v16);
  uint64_t v17 = *(void *)(v13 + 24) + 7;
  id v18 = (_OWORD *)((v17 + v15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v19 = (_OWORD *)((v17 + v16) & 0xFFFFFFFFFFFFFFF8);
  _OWORD *v18 = *v19;
  swift_release();
  uint64_t v20 = sub_21FA76010();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = *(_DWORD *)(v21 + 80) & 0xF8;
  uint64_t v23 = v22 + 23;
  unint64_t v24 = (unint64_t)v18 + v22 + 23;
  unint64_t v25 = ~v22 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v26 = (unsigned __int8 *)(v24 & v25);
  unint64_t v27 = (unint64_t)v19 + v23;
  uint64_t v28 = (unsigned __int8 *)(v27 & v25);
  if ((v24 & v25) != (v27 & v25))
  {
    uint64_t v29 = v20;
    uint64_t v30 = *(void *)(v20 - 8);
    if (*(void *)(v21 + 64) <= 8uLL) {
      uint64_t v31 = 8;
    }
    else {
      uint64_t v31 = *(void *)(v21 + 64);
    }
    unsigned int v32 = v26[v31];
    unsigned int v33 = v32 - 2;
    if (v32 >= 2)
    {
      if (v31 <= 3) {
        uint64_t v34 = v31;
      }
      else {
        uint64_t v34 = 4;
      }
      switch(v34)
      {
        case 1:
          int v35 = *v26;
          goto LABEL_14;
        case 2:
          int v35 = *(unsigned __int16 *)v26;
          goto LABEL_14;
        case 3:
          int v35 = *(unsigned __int16 *)v26 | (v26[2] << 16);
          goto LABEL_14;
        case 4:
          int v35 = *(_DWORD *)v26;
LABEL_14:
          int v36 = (v35 | (v33 << (8 * v31))) + 2;
          unsigned int v32 = v35 + 2;
          if (v31 < 4) {
            unsigned int v32 = v36;
          }
          break;
        default:
          break;
      }
    }
    if (v32 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v30 + 8))(v26, v20);
    }
    else {
      swift_release();
    }
    unsigned int v37 = v28[v31];
    unsigned int v38 = v37 - 2;
    if (v37 >= 2)
    {
      if (v31 <= 3) {
        uint64_t v39 = v31;
      }
      else {
        uint64_t v39 = 4;
      }
      switch(v39)
      {
        case 1:
          int v40 = *v28;
          goto LABEL_28;
        case 2:
          int v40 = *(unsigned __int16 *)v28;
          goto LABEL_28;
        case 3:
          int v40 = *(unsigned __int16 *)v28 | (v28[2] << 16);
          goto LABEL_28;
        case 4:
          int v40 = *(_DWORD *)v28;
LABEL_28:
          int v41 = (v40 | (v38 << (8 * v31))) + 2;
          unsigned int v37 = v40 + 2;
          if (v31 < 4) {
            unsigned int v37 = v41;
          }
          break;
        default:
          break;
      }
    }
    if (v37 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v30 + 32))(v26, v28, v29);
      char v42 = 1;
    }
    else
    {
      char v42 = 0;
      *(void *)uint64_t v26 = *(void *)v28;
    }
    v26[v31] = v42;
  }
  return a1;
}

void sub_21FA72DDC(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = sub_21FA76010();
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

void sub_21FA72E3C()
{
}

void sub_21FA72E48()
{
  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    sub_21FA72DDC(319, &qword_267EF3168, MEMORY[0x263F185C8]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void **sub_21FA72F58(void **a1, void **a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = *(void *)(v6 + 64) + 7;
  uint64_t v9 = sub_21FA76010();
  uint64_t v10 = *(void *)(v9 - 8);
  int v11 = *(_DWORD *)(v10 + 80);
  uint64_t v12 = v11 & 0xF8 | 7;
  if (*(void *)(v10 + 64) <= 8uLL) {
    uint64_t v13 = 8;
  }
  else {
    uint64_t v13 = *(void *)(v10 + 64);
  }
  int v14 = (v11 | v7) & 0x100000;
  uint64_t v15 = (char *)*a2;
  *a1 = *a2;
  if ((v12 | v7) != 7
    || v14 != 0
    || v13
     + ((v12
       + ((v8 + ((v7 + 24) & ~(unint64_t)v7)) & 0xFFFFFFFFFFFFFFF8)
       + 16) & ~v12)
     + 1 > 0x18)
  {
    a1 = (void **)&v15[((v12 | v7) + 16) & ~(v12 | v7)];
LABEL_30:
    swift_retain();
    return a1;
  }
  uint64_t v39 = v9;
  uint64_t v40 = v10;
  id v18 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v19 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  void *v18 = *v19;
  uint64_t v20 = (void *)(((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v21 = (void *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v20 = *v21;
  unint64_t v22 = ((unint64_t)v20 + v7 + 8) & ~(unint64_t)v7;
  unint64_t v23 = ((unint64_t)v21 + v7 + 8) & ~(unint64_t)v7;
  unint64_t v24 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16);
  unint64_t v25 = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v24(v22, v23, v5);
  uint64_t v26 = (void *)((v8 + v22) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v27 = (void *)((v8 + v23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v28 = v27[1];
  *uint64_t v26 = *v27;
  v26[1] = v28;
  uint64_t v29 = (void *)(((unint64_t)v26 + v12 + 16) & ~v12);
  uint64_t v30 = (unsigned __int8 *)(((unint64_t)v27 + v12 + 16) & ~v12);
  unsigned int v31 = v30[v13];
  swift_retain();
  if (v31 < 2)
  {
    uint64_t v33 = v40;
LABEL_20:
    if (v31 != 1)
    {
LABEL_29:
      *uint64_t v29 = *(void *)v30;
      *((unsigned char *)v29 + v13) = 0;
      goto LABEL_30;
    }
  }
  else
  {
    if (v13 <= 3) {
      uint64_t v32 = v13;
    }
    else {
      uint64_t v32 = 4;
    }
    uint64_t v33 = v40;
    switch(v32)
    {
      case 1:
        int v34 = *v30;
        break;
      case 2:
        int v34 = *(unsigned __int16 *)v30;
        break;
      case 3:
        int v34 = *(unsigned __int16 *)v30 | (v30[2] << 16);
        break;
      case 4:
        int v34 = *(_DWORD *)v30;
        break;
      default:
        goto LABEL_20;
    }
    int v35 = (v34 | ((v31 - 2) << (8 * v13))) + 2;
    int v36 = v34 + 2;
    if (v13 >= 4) {
      int v37 = v36;
    }
    else {
      int v37 = v35;
    }
    if (v37 != 1) {
      goto LABEL_29;
    }
  }
  (*(void (**)(void *, unsigned __int8 *, uint64_t))(v33 + 16))(v29, v30, v39);
  *((unsigned char *)v29 + v13) = 1;
  return a1;
}

uint64_t sub_21FA73254(id *a1, uint64_t a2)
{
  unint64_t v3 = (unint64_t)a1 + 15;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = v4 + 8;
  unint64_t v6 = ((((v3 & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v4 + 8))(v6);
  unint64_t v7 = (*(void *)(v5 + 56) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  uint64_t v8 = *(void *)(sub_21FA76010() - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80) & 0xF8 | 7;
  uint64_t v10 = (unsigned __int8 *)((v7 + v9 + 16) & ~v9);
  unint64_t v11 = *(void *)(v8 + 64);
  if (v11 <= 8) {
    unint64_t v11 = 8;
  }
  unsigned int v12 = v10[v11];
  unsigned int v13 = v12 - 2;
  if (v12 >= 2)
  {
    if (v11 <= 3) {
      uint64_t v14 = v11;
    }
    else {
      uint64_t v14 = 4;
    }
    switch(v14)
    {
      case 1:
        int v15 = *v10;
        goto LABEL_12;
      case 2:
        int v15 = *(unsigned __int16 *)v10;
        goto LABEL_12;
      case 3:
        int v15 = *(unsigned __int16 *)v10 | (v10[2] << 16);
        goto LABEL_12;
      case 4:
        int v15 = *(_DWORD *)v10;
LABEL_12:
        int v16 = (v15 | (v13 << (8 * v11))) + 2;
        unsigned int v12 = v15 + 2;
        if (v11 < 4) {
          unsigned int v12 = v16;
        }
        break;
      default:
        break;
    }
  }
  if (v12 == 1)
  {
    uint64_t v17 = *(uint64_t (**)(void))(v8 + 8);
    return v17();
  }
  else
  {
    return swift_release();
  }
}

void **sub_21FA73440(void **a1, void **a2, uint64_t a3)
{
  uint64_t v4 = *a2;
  *a1 = *a2;
  uint64_t v5 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v6 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v5 = *v6;
  unint64_t v7 = (void *)(((unint64_t)v5 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)(((unint64_t)v6 + 15) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v7 = *v8;
  uint64_t v9 = *(void *)(a3 + 16);
  uint64_t v10 = *(void *)(v9 - 8);
  unint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  uint64_t v12 = v10 + 16;
  uint64_t v13 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v14 = ((unint64_t)v7 + v13 + 8) & ~v13;
  uint64_t v15 = ((unint64_t)v8 + v13 + 8) & ~v13;
  id v16 = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v14, v15, v9);
  uint64_t v17 = *(void *)(v12 + 48) + 7;
  id v18 = (void *)((v17 + v14) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v19 = (void *)((v17 + v15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v20 = v19[1];
  void *v18 = *v19;
  v18[1] = v20;
  uint64_t v21 = sub_21FA76010();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(_DWORD *)(v22 + 80) & 0xF8;
  uint64_t v24 = v23 + 23;
  unint64_t v25 = (unint64_t)v18 + v23 + 23;
  unint64_t v26 = ~v23 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v27 = (void *)(v25 & v26);
  uint64_t v28 = (unsigned __int8 *)(((unint64_t)v19 + v24) & v26);
  if (*(void *)(v22 + 64) <= 8uLL) {
    uint64_t v29 = 8;
  }
  else {
    uint64_t v29 = *(void *)(*(void *)(v21 - 8) + 64);
  }
  unsigned int v30 = v28[v29];
  swift_retain();
  if (v30 >= 2)
  {
    if (v29 <= 3) {
      uint64_t v31 = v29;
    }
    else {
      uint64_t v31 = 4;
    }
    switch(v31)
    {
      case 1:
        int v32 = *v28;
        goto LABEL_13;
      case 2:
        int v32 = *(unsigned __int16 *)v28;
        goto LABEL_13;
      case 3:
        int v32 = *(unsigned __int16 *)v28 | (v28[2] << 16);
        goto LABEL_13;
      case 4:
        int v32 = *(_DWORD *)v28;
LABEL_13:
        int v33 = (v32 | ((v30 - 2) << (8 * v29))) + 2;
        unsigned int v34 = v32 + 2;
        if (v29 >= 4) {
          unsigned int v30 = v34;
        }
        else {
          unsigned int v30 = v33;
        }
        break;
      default:
        break;
    }
  }
  if (v30 == 1)
  {
    (*(void (**)(void *, unsigned __int8 *, uint64_t))(v22 + 16))(v27, v28, v21);
    char v35 = 1;
  }
  else
  {
    void *v27 = *(void *)v28;
    swift_retain();
    char v35 = 0;
  }
  *((unsigned char *)v27 + v29) = v35;
  return a1;
}

void **sub_21FA73680(void **a1, void **a2, uint64_t a3)
{
  unint64_t v6 = (unint64_t)a2 + 15;
  uint64_t v5 = *a2;
  unint64_t v7 = *a1;
  *a1 = *a2;
  unint64_t v8 = (unint64_t)a1 + 15;
  id v9 = v5;

  *(void *)(v8 & 0xFFFFFFFFFFFFFFF8) = *(void *)(v6 & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)(((v8 & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v11 = (void *)(((v6 & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v10 = *v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v13 = v12 + 24;
  uint64_t v14 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = ((unint64_t)v10 + v14 + 8) & ~v14;
  uint64_t v16 = ((unint64_t)v11 + v14 + 8) & ~v14;
  (*(void (**)(uint64_t, uint64_t))(v12 + 24))(v15, v16);
  uint64_t v17 = *(void *)(v13 + 40) + 7;
  id v18 = (void *)((v17 + v15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v19 = (void *)((v17 + v16) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v20 = v19[1];
  void *v18 = *v19;
  v18[1] = v20;
  swift_retain();
  swift_release();
  uint64_t v21 = sub_21FA76010();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = *(_DWORD *)(v22 + 80) & 0xF8;
  uint64_t v24 = v23 + 23;
  unint64_t v25 = (unint64_t)v18 + v23 + 23;
  unint64_t v26 = ~v23 & 0xFFFFFFFFFFFFFFF8;
  unint64_t v27 = (unsigned __int8 *)(v25 & v26);
  unint64_t v28 = (unint64_t)v19 + v24;
  uint64_t v29 = (unsigned __int8 *)(v28 & v26);
  if ((v25 & v26) != (v28 & v26))
  {
    uint64_t v30 = v21;
    uint64_t v31 = *(void *)(v21 - 8);
    if (*(void *)(v22 + 64) <= 8uLL) {
      uint64_t v32 = 8;
    }
    else {
      uint64_t v32 = *(void *)(v22 + 64);
    }
    unsigned int v33 = v27[v32];
    unsigned int v34 = v33 - 2;
    if (v33 >= 2)
    {
      if (v32 <= 3) {
        uint64_t v35 = v32;
      }
      else {
        uint64_t v35 = 4;
      }
      switch(v35)
      {
        case 1:
          int v36 = *v27;
          goto LABEL_14;
        case 2:
          int v36 = *(unsigned __int16 *)v27;
          goto LABEL_14;
        case 3:
          int v36 = *(unsigned __int16 *)v27 | (v27[2] << 16);
          goto LABEL_14;
        case 4:
          int v36 = *(_DWORD *)v27;
LABEL_14:
          int v37 = (v36 | (v34 << (8 * v32))) + 2;
          unsigned int v33 = v36 + 2;
          if (v32 < 4) {
            unsigned int v33 = v37;
          }
          break;
        default:
          break;
      }
    }
    if (v33 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v31 + 8))(v27, v21);
    }
    else {
      swift_release();
    }
    unsigned int v38 = v29[v32];
    unsigned int v39 = v38 - 2;
    if (v38 >= 2)
    {
      if (v32 <= 3) {
        uint64_t v40 = v32;
      }
      else {
        uint64_t v40 = 4;
      }
      switch(v40)
      {
        case 1:
          int v41 = *v29;
          goto LABEL_28;
        case 2:
          int v41 = *(unsigned __int16 *)v29;
          goto LABEL_28;
        case 3:
          int v41 = *(unsigned __int16 *)v29 | (v29[2] << 16);
          goto LABEL_28;
        case 4:
          int v41 = *(_DWORD *)v29;
LABEL_28:
          int v42 = (v41 | (v39 << (8 * v32))) + 2;
          unsigned int v38 = v41 + 2;
          if (v32 < 4) {
            unsigned int v38 = v42;
          }
          break;
        default:
          break;
      }
    }
    if (v38 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v31 + 16))(v27, v29, v30);
      v27[v32] = 1;
    }
    else
    {
      *(void *)unint64_t v27 = *(void *)v29;
      v27[v32] = 0;
      swift_retain();
    }
  }
  return a1;
}

void *sub_21FA7398C(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = (void *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v5 = (void *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v4 = *v5;
  unint64_t v6 = (void *)(((unint64_t)v4 + 15) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v7 = (void *)(((unint64_t)v5 + 15) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v6 = *v7;
  uint64_t v8 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v9 = v8 + 32;
  uint64_t v10 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v11 = ((unint64_t)v6 + v10 + 8) & ~v10;
  uint64_t v12 = ((unint64_t)v7 + v10 + 8) & ~v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v11, v12);
  uint64_t v13 = *(void *)(v9 + 32) + 7;
  uint64_t v14 = (_OWORD *)((v13 + v11) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v15 = (_OWORD *)((v13 + v12) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v14 = *v15;
  uint64_t v16 = *(void *)(sub_21FA76010() - 8);
  uint64_t v17 = *(_DWORD *)(v16 + 80) & 0xF8;
  uint64_t v18 = v17 + 23;
  unint64_t v19 = (unint64_t)v14 + v17 + 23;
  unint64_t v20 = ~v17 & 0xFFFFFFFFFFFFFFF8;
  uint64_t v21 = (void *)(v19 & v20);
  uint64_t v22 = (unsigned __int8 *)(((unint64_t)v15 + v18) & v20);
  if (*(void *)(v16 + 64) <= 8uLL) {
    uint64_t v23 = 8;
  }
  else {
    uint64_t v23 = *(void *)(v16 + 64);
  }
  unsigned int v24 = v22[v23];
  unsigned int v25 = v24 - 2;
  if (v24 >= 2)
  {
    if (v23 <= 3) {
      uint64_t v26 = v23;
    }
    else {
      uint64_t v26 = 4;
    }
    switch(v26)
    {
      case 1:
        int v27 = *v22;
        goto LABEL_13;
      case 2:
        int v27 = *(unsigned __int16 *)v22;
        goto LABEL_13;
      case 3:
        int v27 = *(unsigned __int16 *)v22 | (v22[2] << 16);
        goto LABEL_13;
      case 4:
        int v27 = *(_DWORD *)v22;
LABEL_13:
        int v28 = (v27 | (v25 << (8 * v23))) + 2;
        unsigned int v24 = v27 + 2;
        if (v23 < 4) {
          unsigned int v24 = v28;
        }
        break;
      default:
        break;
    }
  }
  if (v24 == 1)
  {
    (*(void (**)(void *))(v16 + 32))(v21);
    char v29 = 1;
  }
  else
  {
    char v29 = 0;
    *uint64_t v21 = *(void *)v22;
  }
  *((unsigned char *)v21 + v23) = v29;
  return a1;
}

void **sub_21FA73B90(void **a1, void **a2, uint64_t a3)
{
  unint64_t v5 = (unint64_t)a2 + 15;
  unint64_t v6 = *a1;
  *a1 = *a2;
  unint64_t v7 = (unint64_t)a1 + 15;

  v7 &= 0xFFFFFFFFFFFFFFF8;
  v5 &= 0xFFFFFFFFFFFFFFF8;
  *(void *)unint64_t v7 = *(void *)v5;
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)((v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = (void *)((v5 + 15) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v8 = *v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v11 = v10 + 40;
  uint64_t v12 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = ((unint64_t)v8 + v12 + 8) & ~v12;
  uint64_t v14 = ((unint64_t)v9 + v12 + 8) & ~v12;
  (*(void (**)(uint64_t, uint64_t))(v10 + 40))(v13, v14);
  uint64_t v15 = *(void *)(v11 + 24) + 7;
  uint64_t v16 = (_OWORD *)((v15 + v13) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v17 = (_OWORD *)((v15 + v14) & 0xFFFFFFFFFFFFFFF8);
  *uint64_t v16 = *v17;
  swift_release();
  uint64_t v18 = sub_21FA76010();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(_DWORD *)(v19 + 80) & 0xF8;
  uint64_t v21 = v20 + 23;
  unint64_t v22 = (unint64_t)v16 + v20 + 23;
  unint64_t v23 = ~v20 & 0xFFFFFFFFFFFFFFF8;
  unsigned int v24 = (unsigned __int8 *)(v22 & v23);
  unint64_t v25 = (unint64_t)v17 + v21;
  uint64_t v26 = (unsigned __int8 *)(v25 & v23);
  if ((v22 & v23) != (v25 & v23))
  {
    uint64_t v27 = v18;
    uint64_t v28 = *(void *)(v18 - 8);
    if (*(void *)(v19 + 64) <= 8uLL) {
      uint64_t v29 = 8;
    }
    else {
      uint64_t v29 = *(void *)(v19 + 64);
    }
    unsigned int v30 = v24[v29];
    unsigned int v31 = v30 - 2;
    if (v30 >= 2)
    {
      if (v29 <= 3) {
        uint64_t v32 = v29;
      }
      else {
        uint64_t v32 = 4;
      }
      switch(v32)
      {
        case 1:
          int v33 = *v24;
          goto LABEL_14;
        case 2:
          int v33 = *(unsigned __int16 *)v24;
          goto LABEL_14;
        case 3:
          int v33 = *(unsigned __int16 *)v24 | (v24[2] << 16);
          goto LABEL_14;
        case 4:
          int v33 = *(_DWORD *)v24;
LABEL_14:
          int v34 = (v33 | (v31 << (8 * v29))) + 2;
          unsigned int v30 = v33 + 2;
          if (v29 < 4) {
            unsigned int v30 = v34;
          }
          break;
        default:
          break;
      }
    }
    if (v30 == 1) {
      (*(void (**)(unsigned __int8 *, uint64_t))(v28 + 8))(v24, v18);
    }
    else {
      swift_release();
    }
    unsigned int v35 = v26[v29];
    unsigned int v36 = v35 - 2;
    if (v35 >= 2)
    {
      if (v29 <= 3) {
        uint64_t v37 = v29;
      }
      else {
        uint64_t v37 = 4;
      }
      switch(v37)
      {
        case 1:
          int v38 = *v26;
          goto LABEL_28;
        case 2:
          int v38 = *(unsigned __int16 *)v26;
          goto LABEL_28;
        case 3:
          int v38 = *(unsigned __int16 *)v26 | (v26[2] << 16);
          goto LABEL_28;
        case 4:
          int v38 = *(_DWORD *)v26;
LABEL_28:
          int v39 = (v38 | (v36 << (8 * v29))) + 2;
          unsigned int v35 = v38 + 2;
          if (v29 < 4) {
            unsigned int v35 = v39;
          }
          break;
        default:
          break;
      }
    }
    if (v35 == 1)
    {
      (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v28 + 32))(v24, v26, v27);
      char v40 = 1;
    }
    else
    {
      char v40 = 0;
      *(void *)unsigned int v24 = *(void *)v26;
    }
    v24[v29] = v40;
  }
  return a1;
}

uint64_t sub_21FA73E7C(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(void *)(sub_21FA76010() - 8);
  uint64_t v10 = 8;
  if (*(void *)(v9 + 64) > 8uLL) {
    uint64_t v10 = *(void *)(v9 + 64);
  }
  uint64_t v11 = *(unsigned __int8 *)(v6 + 80);
  if (!a2) {
    return 0;
  }
  if (a2 <= v8) {
    goto LABEL_25;
  }
  uint64_t v12 = *(_DWORD *)(v9 + 80) & 0xF8 | 7;
  unint64_t v13 = v10 + ((v12 + ((*(void *)(v6 + 64) + ((v11 + 24) & ~v11) + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & ~v12) + 1;
  char v14 = 8 * v13;
  if (v13 <= 3)
  {
    unsigned int v17 = ((a2 - v8 + ~(-1 << v14)) >> v14) + 1;
    if (HIWORD(v17))
    {
      int v15 = *(_DWORD *)((char *)a1 + v13);
      if (!v15) {
        goto LABEL_25;
      }
      goto LABEL_17;
    }
    if (v17 > 0xFF)
    {
      int v15 = *(unsigned __int16 *)((char *)a1 + v13);
      if (!*(unsigned __int16 *)((char *)a1 + v13)) {
        goto LABEL_25;
      }
      goto LABEL_17;
    }
    if (v17 < 2)
    {
LABEL_25:
      if ((v7 & 0x80000000) != 0)
      {
        uint64_t v20 = *(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v6 + 48);
        return v20(((((((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + v11 + 8) & ~v11, v7, v5);
      }
      else
      {
        uint64_t v19 = *(void *)a1;
        if (*(void *)a1 >= 0xFFFFFFFFuLL) {
          LODWORD(v19) = -1;
        }
        return (v19 + 1);
      }
    }
  }
  int v15 = *((unsigned __int8 *)a1 + v13);
  if (!*((unsigned char *)a1 + v13)) {
    goto LABEL_25;
  }
LABEL_17:
  int v18 = (v15 - 1) << v14;
  if (v13 > 3) {
    int v18 = 0;
  }
  if (v13)
  {
    if (v13 > 3) {
      LODWORD(v13) = 4;
    }
    switch((int)v13)
    {
      case 2:
        LODWORD(v13) = *a1;
        break;
      case 3:
        LODWORD(v13) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v13) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v13) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v8 + (v13 | v18) + 1;
}

void sub_21FA74118(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v23 = v8;
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  if (v9 <= 0x7FFFFFFF) {
    unsigned int v10 = 0x7FFFFFFF;
  }
  else {
    unsigned int v10 = *(_DWORD *)(v8 + 84);
  }
  uint64_t v11 = *(void *)(sub_21FA76010() - 8);
  uint64_t v12 = 8;
  if (*(void *)(v11 + 64) > 8uLL) {
    uint64_t v12 = *(void *)(v11 + 64);
  }
  uint64_t v13 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v14 = *(_DWORD *)(v11 + 80) & 0xF8 | 7;
  size_t v15 = v12 + ((v14 + ((*(void *)(v8 + 64) + ((v13 + 24) & ~v13) + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & ~v14) + 1;
  if (a3 <= v10)
  {
    int v16 = 0;
  }
  else if (v15 <= 3)
  {
    unsigned int v19 = ((a3 - v10 + ~(-1 << (8 * v15))) >> (8 * v15)) + 1;
    if (HIWORD(v19))
    {
      int v16 = 4;
    }
    else if (v19 >= 0x100)
    {
      int v16 = 2;
    }
    else
    {
      int v16 = v19 > 1;
    }
  }
  else
  {
    int v16 = 1;
  }
  if (v10 < a2)
  {
    unsigned int v17 = ~v10 + a2;
    if (v15 < 4)
    {
      int v18 = (v17 >> (8 * v15)) + 1;
      if (v15)
      {
        int v20 = v17 & ~(-1 << (8 * v15));
        bzero(a1, v15);
        if (v15 == 3)
        {
          *(_WORD *)a1 = v20;
          a1[2] = BYTE2(v20);
        }
        else if (v15 == 2)
        {
          *(_WORD *)a1 = v20;
        }
        else
        {
          *a1 = v20;
        }
      }
    }
    else
    {
      bzero(a1, v15);
      *(_DWORD *)a1 = v17;
      int v18 = 1;
    }
    switch(v16)
    {
      case 1:
        a1[v15] = v18;
        return;
      case 2:
        *(_WORD *)&a1[v15] = v18;
        return;
      case 3:
        goto LABEL_44;
      case 4:
        *(_DWORD *)&a1[v15] = v18;
        return;
      default:
        return;
    }
  }
  switch(v16)
  {
    case 1:
      a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 2:
      *(_WORD *)&a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_26;
    case 3:
LABEL_44:
      __break(1u);
      JUMPOUT(0x21FA7442CLL);
    case 4:
      *(_DWORD *)&a1[v15] = 0;
      goto LABEL_25;
    default:
LABEL_25:
      if (a2)
      {
LABEL_26:
        if ((v9 & 0x80000000) != 0)
        {
          unint64_t v22 = *(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56);
          v22((((((unint64_t)(a1 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + v13 + 8) & ~v13, a2, v9, v7);
        }
        else
        {
          if ((a2 & 0x80000000) != 0) {
            uint64_t v21 = a2 ^ 0x80000000;
          }
          else {
            uint64_t v21 = (a2 - 1);
          }
          *(void *)a1 = v21;
        }
      }
      return;
  }
}

uint64_t sub_21FA74454()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_21FA74498(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v6 = type metadata accessor for HealthStoreAuthorizationOverlayModifier();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v16 - v8;
  id v19 = *(id *)a2;
  objc_msgSend(v19, sel_setAuthorizationViewControllerPresenter_, a1);
  unsigned int v10 = *(void **)(a2 + 8);
  if (v10)
  {
    sub_21FA7513C(0, &qword_267EF3180);
    sub_21FA75178(&qword_267EF3188, &qword_267EF3180);
    unsigned int v10 = (void *)sub_21FA76060();
  }
  uint64_t v11 = *(void **)(a2 + 16);
  if (v11)
  {
    sub_21FA7513C(0, &qword_267EF3170);
    sub_21FA75178(&qword_267EF3178, &qword_267EF3170);
    uint64_t v11 = (void *)sub_21FA76060();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  unint64_t v12 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v13 = swift_allocObject();
  uint64_t v14 = v18;
  *(void *)(v13 + 16) = v17;
  *(void *)(v13 + 24) = v14;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v13 + v12, v9, v6);
  aBlock[4] = sub_21FA7510C;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21FA7472C;
  aBlock[3] = &block_descriptor;
  size_t v15 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v19, sel_requestAuthorizationToShareTypes_readTypes_completion_, v10, v11, v15);
  _Block_release(v15);
}

void sub_21FA7472C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_21FA747AC()
{
  return sub_21FA75FA0();
}

uint64_t sub_21FA747C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  return sub_21FA74810(a1, a2, (uint64_t)&unk_26D1447C8, (uint64_t)sub_21FA74F38, a3);
}

uint64_t sub_21FA74810@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, char *a5@<X8>)
{
  uint64_t v39 = a3;
  uint64_t v40 = a4;
  uint64_t v6 = v5;
  uint64_t v41 = a1;
  int v42 = a5;
  uint64_t v8 = *(void *)(a2 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  uint64_t v10 = MEMORY[0x270FA5388](a1);
  int v38 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(v11 + 16);
  uint64_t v43 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v33 = v14;
  swift_getWitnessTable();
  uint64_t v15 = sub_21FA75FF0();
  uint64_t v36 = v15;
  uint64_t WitnessTable = swift_getWitnessTable();
  uint64_t v34 = *(void *)(a2 + 24);
  uint64_t v44 = v15;
  uint64_t v45 = v12;
  uint64_t v46 = WitnessTable;
  uint64_t v47 = v34;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2();
  uint64_t v17 = *(void *)(OpaqueTypeMetadata2 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](OpaqueTypeMetadata2);
  int v20 = (char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  unsigned int v35 = (char *)&v32 - v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v14, v6 + *(int *)(a2 + 44), v12);
  uint64_t v22 = v8;
  uint64_t v23 = v38;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v38, v6, a2);
  unint64_t v24 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v25 = swift_allocObject();
  uint64_t v26 = v34;
  *(void *)(v25 + 16) = v12;
  *(void *)(v25 + 24) = v26;
  (*(void (**)(unint64_t, char *, uint64_t))(v22 + 32))(v25 + v24, v23, a2);
  swift_checkMetadataState();
  uint64_t v27 = v33;
  sub_21FA76040();
  swift_release();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v27, v12);
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  uint64_t v29 = v35;
  v28(v35, v20, OpaqueTypeMetadata2);
  unsigned int v30 = *(void (**)(char *, uint64_t))(v17 + 8);
  v30(v20, OpaqueTypeMetadata2);
  v28(v42, v29, OpaqueTypeMetadata2);
  return ((uint64_t (*)(char *, uint64_t))v30)(v29, OpaqueTypeMetadata2);
}

uint64_t sub_21FA74BA4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t))
{
  uint64_t v8 = sub_21FA76010();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  a4(0, a2, a3);
  sub_21FA751C8((uint64_t)v11);
  uint64_t v14 = a2;
  uint64_t v15 = a3;
  uint64_t v16 = a1;
  sub_21FA76000();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
}

void sub_21FA74CC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for HealthStorePerObjectAuthorizationOverlayModifier();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v17 - v10;
  id v12 = *(id *)a2;
  objc_msgSend(*(id *)a2, sel_setAuthorizationViewControllerPresenter_, a1);
  uint64_t v13 = *(void *)(a2 + 16);
  uint64_t v18 = *(void *)(a2 + 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  unint64_t v14 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  *(void *)(v15 + 24) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v15 + v14, v11, v8);
  aBlock[4] = sub_21FA75CD0;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21FA7472C;
  aBlock[3] = &block_descriptor_15;
  uint64_t v16 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v12, sel_requestPerObjectReadAuthorizationForType_predicate_completion_, v18, v13, v16);
  _Block_release(v16);
}

uint64_t sub_21FA74EA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  return sub_21FA74810(a1, a2, (uint64_t)&unk_26D144840, (uint64_t)sub_21FA75A64, a3);
}

uint64_t sub_21FA74EF0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21FA74F38(uint64_t a1, uint64_t a2)
{
  return sub_21FA75A94(a1, a2, (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for HealthStoreAuthorizationOverlayModifier, (void (*)(void, uint64_t, uint64_t))type metadata accessor for HealthStoreAuthorizationOverlayModifier);
}

void sub_21FA74F68(uint64_t a1)
{
  sub_21FA74498(a1, v1[4], v1[2], v1[3]);
}

uint64_t objectdestroyTm()
{
  uint64_t v1 = *(void *)(v0 + 16);
  double v2 = (int *)(type metadata accessor for HealthStoreAuthorizationOverlayModifier() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(*(void *)v2 + 64);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v4 + v2[13], v1);
  swift_release();
  uint64_t v6 = v0 + v4 + v2[15];
  sub_21FA72DDC(0, &qword_267EF3168, MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_21FA76010();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v4 + v5, v3 | 7);
}

uint64_t sub_21FA7510C(char a1, void *a2)
{
  return sub_21FA75CE8(a1, a2, (uint64_t (*)(void, void, void))type metadata accessor for HealthStoreAuthorizationOverlayModifier);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_21FA7513C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21FA75178(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_21FA7513C(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21FA751C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_21FA75FE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21FA72DDC(0, &qword_267EF3168, MEMORY[0x263F185C8]);
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v17 - v9;
  sub_21FA75460(v2, (uint64_t)&v17 - v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = sub_21FA76010();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = sub_21FA76070();
    unint64_t v14 = sub_21FA76020();
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = swift_slowAlloc();
      uint64_t v18 = v16;
      *(_DWORD *)uint64_t v15 = 136315138;
      *(void *)(v15 + 4) = sub_21FA75504(0xD000000000000022, 0x800000021FA76C90, &v18);
      _os_log_impl(&dword_21FA6E000, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C57230](v16, -1, -1);
      MEMORY[0x223C57230](v15, -1, -1);
    }

    sub_21FA75FD0();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_21FA75460(uint64_t a1, uint64_t a2)
{
  sub_21FA72DDC(0, &qword_267EF3168, MEMORY[0x263F185C8]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21FA754E0()
{
  return sub_21FA75FC0();
}

unint64_t sub_21FA75504(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_21FA755D8(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_21FA75728((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_21FA75728((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_21FA755D8(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    unint64_t result = sub_21FA75784(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_21FA76090();
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

uint64_t sub_21FA75728(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21FA75784(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_21FA7581C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_21FA7591C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_21FA7591C((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21FA7581C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_21FA758B8(v2, 0);
      uint64_t result = sub_21FA76080();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_21FA76050();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_21FA758B8(uint64_t a1, uint64_t a2)
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
  sub_21FA75A04();
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_21FA7591C(char *result, int64_t a2, char a3, char *a4)
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
    sub_21FA75A04();
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  id v12 = v10 + 32;
  os_log_type_t v13 = a4 + 32;
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

void sub_21FA75A04()
{
  if (!qword_267EF3190)
  {
    unint64_t v0 = sub_21FA760A0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_267EF3190);
    }
  }
}

uint64_t sub_21FA75A64(uint64_t a1, uint64_t a2)
{
  return sub_21FA75A94(a1, a2, (uint64_t (*)(void, uint64_t, uint64_t))type metadata accessor for HealthStorePerObjectAuthorizationOverlayModifier, (void (*)(void, uint64_t, uint64_t))type metadata accessor for HealthStorePerObjectAuthorizationOverlayModifier);
}

uint64_t sub_21FA75A94(uint64_t a1, uint64_t a2, uint64_t (*a3)(void, uint64_t, uint64_t), void (*a4)(void, uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v7 = *(void *)(v4 + 24);
  uint64_t v8 = *(void *)(a3(0, v6, v7) - 8);
  return sub_21FA74BA4(v4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), v6, v7, a4);
}

void sub_21FA75B2C(uint64_t a1)
{
  sub_21FA74CC0(a1, v1[4], v1[2], v1[3]);
}

uint64_t objectdestroy_8Tm()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = (int *)(type metadata accessor for HealthStorePerObjectAuthorizationOverlayModifier() - 8);
  uint64_t v3 = *(unsigned __int8 *)(*(void *)v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = *(void *)(*(void *)v2 + 64);

  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + v4 + v2[13], v1);
  swift_release();
  uint64_t v6 = v0 + v4 + v2[15];
  sub_21FA72DDC(0, &qword_267EF3168, MEMORY[0x263F185C8]);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_21FA76010();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }

  return MEMORY[0x270FA0238](v0, v4 + v5, v3 | 7);
}

uint64_t sub_21FA75CD0(char a1, void *a2)
{
  return sub_21FA75CE8(a1, a2, (uint64_t (*)(void, void, void))type metadata accessor for HealthStorePerObjectAuthorizationOverlayModifier);
}

uint64_t sub_21FA75CE8(char a1, void *a2, uint64_t (*a3)(void, void, void))
{
  uint64_t v6 = a3(0, *(void *)(v3 + 16), *(void *)(v3 + 24));
  uint64_t v7 = v6;
  uint64_t v8 = v3
     + ((*(unsigned __int8 *)(*(void *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80));
  if (a2)
  {
    int64_t v9 = *(void (**)(void *, uint64_t))(v8 + *(int *)(v6 + 48));
    id v10 = a2;
    v9(a2, 1);
  }
  return (*(uint64_t (**)(void, void))(v8 + *(int *)(v7 + 48)))(a1 & 1, 0);
}

uint64_t sub_21FA75DB8(uint64_t a1, uint64_t a2)
{
  sub_21FA72DDC(0, &qword_267EF3160, MEMORY[0x263F185D0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_21FA75E68(void *a1)
{
  return get_witness_table_SQRzlqd0__7SwiftUI4ViewHD3_AaBPAAE8onChange2of7initial_Qrqd___Sbyqd___qd__tctSQRd__lFQOyAA01_C16Modifier_ContentVy09HealthKitB00j25StoreAuthorizationOverlayH033_214B0F285CDA8168FBED6EA091EA168CLLVyxGG_xQo_HOTm(a1, (void (*)(uint64_t, void, void))type metadata accessor for HealthStoreAuthorizationOverlayModifier);
}

uint64_t sub_21FA75E94(void *a1)
{
  return get_witness_table_SQRzlqd0__7SwiftUI4ViewHD3_AaBPAAE8onChange2of7initial_Qrqd___Sbyqd___qd__tctSQRd__lFQOyAA01_C16Modifier_ContentVy09HealthKitB00j25StoreAuthorizationOverlayH033_214B0F285CDA8168FBED6EA091EA168CLLVyxGG_xQo_HOTm(a1, (void (*)(uint64_t, void, void))type metadata accessor for HealthStorePerObjectAuthorizationOverlayModifier);
}

uint64_t get_witness_table_SQRzlqd0__7SwiftUI4ViewHD3_AaBPAAE8onChange2of7initial_Qrqd___Sbyqd___qd__tctSQRd__lFQOyAA01_C16Modifier_ContentVy09HealthKitB00j25StoreAuthorizationOverlayH033_214B0F285CDA8168FBED6EA091EA168CLLVyxGG_xQo_HOTm(void *a1, void (*a2)(uint64_t, void, void))
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21FA75F80()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_21FA75F90()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_21FA75FA0()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_21FA75FB0()
{
  return MEMORY[0x270F001A8]();
}

uint64_t sub_21FA75FC0()
{
  return MEMORY[0x270F00D10]();
}

uint64_t sub_21FA75FD0()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_21FA75FE0()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_21FA75FF0()
{
  return MEMORY[0x270F01C68]();
}

uint64_t sub_21FA76000()
{
  return MEMORY[0x270F02948]();
}

uint64_t sub_21FA76010()
{
  return MEMORY[0x270F02950]();
}

uint64_t sub_21FA76020()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_21FA76030()
{
  return MEMORY[0x270F04170]();
}

uint64_t sub_21FA76040()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_21FA76050()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_21FA76060()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_21FA76070()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_21FA76080()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_21FA76090()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_21FA760A0()
{
  return MEMORY[0x270F9F4F8]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t HKProgramSDKAtLeast()
{
  return MEMORY[0x270EF37E0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x270F82F00]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x270FA03F0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x270FA03F8]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x270FA0578]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}