void sub_2487C0418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2487C0B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_2487C1F44(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2487C1F64(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

uint64_t sub_2487C1FC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v31 = a1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693295A0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693295A8);
  MEMORY[0x270FA5388](v29);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693295B0);
  uint64_t v9 = *(void *)(v30 - 8);
  MEMORY[0x270FA5388](v30);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v33 = *(_OWORD *)(v2 + 64);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2487CE170();
  swift_release();
  swift_release();
  sub_2487C446C((uint64_t)&v33);
  uint64_t v12 = v32;
  uint64_t v13 = sub_2487CE5E0();
  uint64_t v15 = v14;
  sub_2487C238C(v2, (uint64_t)v6);
  v16 = (uint64_t *)&v6[*(int *)(v4 + 44)];
  uint64_t *v16 = v13;
  v16[1] = v15;
  sub_2487C4A60((uint64_t)v6, (uint64_t)&v8[*(int *)(v29 + 36)], &qword_2693295A0);
  *(void *)v8 = v12;
  *((_WORD *)v8 + 4) = 256;
  *((void *)v8 + 2) = 0x3FE0000000000000;
  sub_2487C4AC4((uint64_t)v6, &qword_2693295A0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2487CE170();
  swift_release();
  swift_release();
  sub_2487C446C((uint64_t)&v33);
  uint64_t v17 = swift_allocObject();
  long long v18 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v17 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v17 + 96) = v18;
  *(void *)(v17 + 112) = *(void *)(v2 + 96);
  long long v19 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v17 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v17 + 32) = v19;
  long long v20 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v17 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v17 + 64) = v20;
  sub_2487C44AC(v2);
  sub_2487C4530();
  sub_2487C46B8();
  sub_2487CE490();
  swift_release();
  sub_2487C4AC4((uint64_t)v8, &qword_2693295A8);
  uint64_t v21 = swift_allocObject();
  long long v22 = *(_OWORD *)(v2 + 80);
  *(_OWORD *)(v21 + 80) = *(_OWORD *)(v2 + 64);
  *(_OWORD *)(v21 + 96) = v22;
  *(void *)(v21 + 112) = *(void *)(v2 + 96);
  long long v23 = *(_OWORD *)(v2 + 16);
  *(_OWORD *)(v21 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v21 + 32) = v23;
  long long v24 = *(_OWORD *)(v2 + 48);
  *(_OWORD *)(v21 + 48) = *(_OWORD *)(v2 + 32);
  *(_OWORD *)(v21 + 64) = v24;
  uint64_t v26 = v30;
  uint64_t v25 = v31;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 16))(v31, v11, v30);
  v27 = (uint64_t (**)())(v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2693295F0) + 36));
  *v27 = sub_2487C4710;
  v27[1] = (uint64_t (*)())v21;
  v27[2] = 0;
  v27[3] = 0;
  sub_2487C44AC(v2);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v26);
}

uint64_t sub_2487C238C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v34 = a1;
  uint64_t v36 = a2;
  uint64_t v3 = sub_2487CE270();
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2487CE630();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329638);
  uint64_t v11 = v10 - 8;
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329640);
  uint64_t v15 = v14 - 8;
  MEMORY[0x270FA5388](v14);
  uint64_t v35 = (uint64_t)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v38 = *(_OWORD *)(a1 + 64);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2487CE170();
  swift_release();
  swift_release();
  sub_2487C446C((uint64_t)&v38);
  uint64_t v17 = v37;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x263F1B968], v6);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v5, v9, v6);
  sub_2487C4958((uint64_t)v5, (uint64_t)&v13[*(int *)(v11 + 44)]);
  *(void *)uint64_t v13 = v17;
  *((_WORD *)v13 + 4) = 256;
  *((void *)v13 + 2) = 0x3FE0000000000000;
  swift_retain();
  sub_2487C49BC((uint64_t)v5);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_release();
  long long v18 = (long long *)v34;
  uint64_t v19 = *(void *)(v34 + 80);
  sub_2487CE660();
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v24 = v35;
  sub_2487C4A60((uint64_t)v13, v35, &qword_269329638);
  uint64_t v25 = (void *)(v24 + *(int *)(v15 + 44));
  *uint64_t v25 = v19;
  v25[1] = v19;
  v25[2] = v21;
  v25[3] = v23;
  sub_2487C4AC4((uint64_t)v13, &qword_269329638);
  uint64_t v26 = sub_2487CE5E0();
  uint64_t v28 = v27;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329648);
  uint64_t v30 = v36;
  uint64_t v31 = v36 + *(int *)(v29 + 36);
  sub_2487C26E8(v18, v31);
  uint64_t v32 = (uint64_t *)(v31 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269329650) + 36));
  *uint64_t v32 = v26;
  v32[1] = v28;
  return sub_2487C4B20(v24, v30, &qword_269329640);
}

uint64_t sub_2487C26E8@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2487CE6C0();
  uint64_t v5 = *(void *)(v4 - 8);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v87 = &v63[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_2487CE6A0();
  uint64_t v84 = *(void *)(v7 - 8);
  uint64_t v85 = v7;
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v82 = &v63[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  v81 = &v63[-v11];
  MEMORY[0x270FA5388](v10);
  v80 = &v63[-v12];
  uint64_t v88 = sub_2487CE290();
  uint64_t v86 = *(void *)(v88 - 8);
  MEMORY[0x270FA5388](v88);
  v83 = &v63[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329658);
  MEMORY[0x270FA5388](v72);
  v74 = (uint64_t *)&v63[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329660);
  MEMORY[0x270FA5388](v15 - 8);
  v73 = &v63[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = sub_2487CE590();
  uint64_t v18 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = &v63[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329668);
  MEMORY[0x270FA5388](v70);
  uint64_t v22 = &v63[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329670);
  MEMORY[0x270FA5388](v71);
  v78 = &v63[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329678);
  MEMORY[0x270FA5388](v75);
  v79 = &v63[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329680);
  uint64_t v89 = *(void *)(v25 - 8);
  uint64_t v90 = v25;
  uint64_t v26 = MEMORY[0x270FA5388](v25);
  v77 = &v63[-((v27 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v26);
  v76 = &v63[-v28];
  long long v93 = a1[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693295F8);
  sub_2487CE5C0();
  if ((v91 & 1) != 0 || (long long v93 = a1[3], sub_2487CE5C0(), v91 == 1))
  {
    long long v93 = a1[3];
    sub_2487CE5C0();
    if ((v91 & 1) == 0)
    {
      long long v93 = *a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269329628);
      sub_2487CE5C0();
      *(void *)&long long v93 = sub_2487CE860();
      *((void *)&v93 + 1) = v29;
      sub_2487CE720();
    }
    uint64_t v66 = v5;
    uint64_t v67 = v4;
    v68 = a1;
    uint64_t v69 = a2;
    sub_2487CE580();
    (*(void (**)(unsigned char *, void, uint64_t))(v18 + 104))(v20, *MEMORY[0x263F1B4B8], v17);
    uint64_t v30 = sub_2487CE5A0();
    swift_release();
    (*(void (**)(unsigned char *, uint64_t))(v18 + 8))(v20, v17);
    if (qword_2693294C0 != -1) {
      swift_once();
    }
    sub_2487CE5E0();
    sub_2487CE1D0();
    uint64_t v65 = v93;
    char v31 = BYTE8(v93);
    uint64_t v32 = v94;
    int v64 = v95;
    uint64_t v33 = v96;
    uint64_t v34 = v97;
    uint64_t v35 = (uint64_t)v73;
    sub_2487CE380();
    uint64_t v36 = sub_2487CE390();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v35, 0, 1, v36);
    uint64_t KeyPath = swift_getKeyPath();
    long long v38 = v74;
    sub_2487C4A60(v35, (uint64_t)v74 + *(int *)(v72 + 28), &qword_269329660);
    *long long v38 = KeyPath;
    sub_2487C4A60((uint64_t)v38, (uint64_t)&v22[*(int *)(v70 + 36)], &qword_269329658);
    uint64_t v39 = v65;
    *(void *)uint64_t v22 = v30;
    *((void *)v22 + 1) = v39;
    v22[16] = v31;
    *((void *)v22 + 3) = v32;
    v22[32] = v64;
    *((void *)v22 + 5) = v33;
    *((void *)v22 + 6) = v34;
    swift_retain();
    sub_2487C4AC4((uint64_t)v38, &qword_269329658);
    sub_2487C4AC4(v35, &qword_269329660);
    swift_release();
    uint64_t v40 = sub_2487CE500();
    uint64_t v41 = sub_2487CE520();
    v42 = v78;
    sub_2487C4A60((uint64_t)v22, (uint64_t)v78, &qword_269329668);
    v43 = (uint64_t *)&v42[*(int *)(v71 + 36)];
    uint64_t *v43 = v40;
    v43[1] = v41;
    sub_2487C4AC4((uint64_t)v22, &qword_269329668);
    v44 = v80;
    sub_2487CE690();
    v45 = v81;
    sub_2487CE670();
    uint64_t v46 = v85;
    v47 = *(void (**)(unsigned char *, uint64_t))(v84 + 8);
    v47(v44, v85);
    v48 = v82;
    sub_2487CE680();
    v47(v45, v46);
    v49 = v87;
    sub_2487CE6B0();
    sub_2487C4A18(&qword_269329688, MEMORY[0x263F1BBC8]);
    v50 = v83;
    sub_2487CE280();
    (*(void (**)(unsigned char *, uint64_t))(v66 + 8))(v49, v67);
    v47(v48, v46);
    uint64_t v51 = swift_getKeyPath();
    uint64_t v52 = (uint64_t)v79;
    v53 = (uint64_t *)&v79[*(int *)(v75 + 36)];
    uint64_t v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329690);
    uint64_t v55 = v86;
    uint64_t v56 = v88;
    (*(void (**)(char *, unsigned char *, uint64_t))(v86 + 16))((char *)v53 + *(int *)(v54 + 28), v50, v88);
    uint64_t *v53 = v51;
    sub_2487C4A60((uint64_t)v42, v52, &qword_269329670);
    (*(void (**)(unsigned char *, uint64_t))(v55 + 8))(v50, v56);
    sub_2487C4AC4((uint64_t)v42, &qword_269329670);
    long long v91 = *v68;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269329628);
    sub_2487CE5C0();
    uint64_t v57 = v92;
    v58 = v77;
    sub_2487C4A60(v52, (uint64_t)v77, &qword_269329678);
    uint64_t v59 = v90;
    *(void *)&v58[*(int *)(v90 + 52)] = v57;
    sub_2487C4AC4(v52, &qword_269329678);
    v60 = v76;
    sub_2487C4B20((uint64_t)v58, (uint64_t)v76, &qword_269329680);
    a2 = v69;
    sub_2487C4B20((uint64_t)v60, v69, &qword_269329680);
    uint64_t v61 = 0;
  }
  else
  {
    uint64_t v61 = 1;
    uint64_t v59 = v90;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v89 + 56))(a2, v61, 1, v59);
}

uint64_t sub_2487C3168(uint64_t a1, unsigned char *a2)
{
  switch(*a2)
  {
    case 0xE:
      uint64_t result = swift_bridgeObjectRelease();
      goto LABEL_3;
    default:
      char v2 = sub_2487CE870();
      uint64_t result = swift_bridgeObjectRelease();
      if (v2)
      {
LABEL_3:
        MEMORY[0x270FA5388](result);
        sub_2487CE610();
        sub_2487CE220();
        return swift_release();
      }
      return result;
  }
}

uint64_t sub_2487C33E0()
{
  uint64_t v1 = v0;
  long long v10 = *(_OWORD *)(v0 + 32);
  LOBYTE(v16) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693295F8);
  sub_2487CE5D0();
  long long v16 = *(_OWORD *)(v0 + 16);
  long long v10 = *(_OWORD *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269329600);
  sub_2487CE5C0();
  objc_msgSend(v15, sel_invalidate, v10);

  char v2 = self;
  uint64_t v3 = swift_allocObject();
  long long v4 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v3 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v3 + 96) = v4;
  *(void *)(v3 + 112) = *(void *)(v1 + 96);
  long long v5 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v3 + 32) = v5;
  long long v6 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v3 + 64) = v6;
  uint64_t v13 = sub_2487C4738;
  uint64_t v14 = v3;
  *(void *)&long long v10 = MEMORY[0x263EF8330];
  *((void *)&v10 + 1) = 1107296256;
  uint64_t v11 = sub_2487C3B94;
  uint64_t v12 = &block_descriptor;
  uint64_t v7 = _Block_copy(&v10);
  sub_2487C44AC(v1);
  swift_release();
  id v8 = objc_msgSend(v2, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v7, 1.0);
  _Block_release(v7);
  long long v10 = v16;
  id v15 = v8;
  return sub_2487CE5D0();
}

uint64_t sub_2487C3590(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_2487CE6D0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  long long v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_2487CE6F0();
  uint64_t v7 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2487C4758();
  long long v10 = (void *)sub_2487CE7D0();
  uint64_t v11 = swift_allocObject();
  long long v12 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v11 + 80) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v11 + 96) = v12;
  *(void *)(v11 + 112) = *(void *)(a2 + 96);
  long long v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v11 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v11 + 32) = v13;
  long long v14 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v11 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v11 + 64) = v14;
  aBlock[4] = sub_2487C479C;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2487C7604;
  aBlock[3] = &block_descriptor_36;
  id v15 = _Block_copy(aBlock);
  sub_2487C44AC(a2);
  swift_release();
  sub_2487CE6E0();
  aBlock[0] = MEMORY[0x263F8EE78];
  sub_2487C4A18(&qword_269329610, MEMORY[0x263F8F030]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269329618);
  sub_2487C47A4(&qword_269329620, &qword_269329618);
  sub_2487CE7F0();
  MEMORY[0x24C580600](0, v9, v6, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v18);
}

uint64_t sub_2487C3880(uint64_t a1)
{
  uint64_t v2 = sub_2487CE3D0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  long long v13 = *(_OWORD *)a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269329628);
  sub_2487CE5C0();
  uint64_t v12 = a1;
  if (v14 < 2)
  {
    uint64_t v7 = swift_allocObject();
    long long v8 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(v7 + 80) = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(v7 + 96) = v8;
    *(void *)(v7 + 112) = *(void *)(a1 + 96);
    long long v9 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v7 + 32) = v9;
    long long v10 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v7 + 48) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v7 + 64) = v10;
    sub_2487C44AC(a1);
    sub_2487CE610();
    sub_2487CE3C0();
    sub_2487CE210();
    swift_release();
    swift_release();
    return (*(uint64_t (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    sub_2487CE610();
    sub_2487CE220();
    return swift_release();
  }
}

uint64_t sub_2487C3A74(long long *a1)
{
  long long v3 = *a1;
  sub_2487C4B20((uint64_t)&v3 + 8, (uint64_t)v4, &qword_269329630);
  sub_2487C48D0((uint64_t)v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269329628);
  uint64_t result = sub_2487CE5C0();
  if (__OFSUB__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    sub_2487CE5D0();
    return sub_2487C446C((uint64_t)&v3);
  }
  return result;
}

uint64_t sub_2487C3B28(uint64_t a1)
{
  long long v3 = *(_OWORD *)(a1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269329600);
  sub_2487CE5C0();
  objc_msgSend(v4, sel_invalidate, v3);

  return (*(uint64_t (**)(void))(a1 + 88))();
}

void sub_2487C3B94(uint64_t a1, void *a2)
{
  long long v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_2487C3C04()
{
  return sub_2487CE470();
}

uint64_t sub_2487C3C20@<X0>(uint64_t a1@<X8>)
{
  return sub_2487C1FC4(a1);
}

uint64_t sub_2487C3C6C()
{
  return sub_2487CE2C0();
}

uint64_t sub_2487C3C90(uint64_t a1)
{
  uint64_t v2 = sub_2487CE290();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2487CE2D0();
}

uint64_t sub_2487C3D58()
{
  return sub_2487CE300();
}

uint64_t sub_2487C3D7C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329660);
  MEMORY[0x270FA5388](v2 - 8);
  sub_2487C4A60(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_269329660);
  return sub_2487CE310();
}

double sub_2487C3E10@<D0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>, double a4@<D0>)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_269329580);
  sub_2487CE5B0();
  sub_2487CE5B0();
  sub_2487CE5B0();
  type metadata accessor for GazeStateManager();
  sub_2487C4A18(&qword_269329588, (void (*)(uint64_t))type metadata accessor for GazeStateManager);
  swift_retain();
  uint64_t v6 = sub_2487CE230();
  uint64_t v8 = v7;
  sub_2487CE5B0();
  double result = *(double *)&v12;
  *(_OWORD *)a3 = v12;
  *(_OWORD *)(a3 + 16) = v12;
  *(unsigned char *)(a3 + 32) = v12;
  *(void *)(a3 + 40) = *((void *)&v12 + 1);
  *(unsigned char *)(a3 + 48) = v12;
  *(void *)(a3 + 56) = *((void *)&v12 + 1);
  *(void *)(a3 + 64) = v6;
  *(void *)(a3 + 72) = v8;
  *(double *)(a3 + 80) = a4;
  *(void *)(a3 + 88) = a1;
  *(void *)(a3 + 96) = a2;
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

uint64_t initializeBufferWithCopyOfBuffer for GazeFocusPoint(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for GazeFocusPoint(uint64_t a1)
{
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for GazeFocusPoint(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  swift_retain();
  id v9 = v5;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for GazeFocusPoint(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v4 = *(void **)(a1 + 16);
  uint64_t v5 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v5;
  id v6 = v5;

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_retain();
  swift_release();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  uint64_t v7 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v7;
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

uint64_t assignWithTake for GazeFocusPoint(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  uint64_t v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_release();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_release();
  uint64_t v5 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v5;
  swift_release();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for GazeFocusPoint(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 104)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GazeFocusPoint(uint64_t result, int a2, int a3)
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
      *(void *)(result + 72) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 104) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GazeFocusPoint()
{
  return &type metadata for GazeFocusPoint;
}

void type metadata accessor for UIDeviceOrientation(uint64_t a1)
{
}

uint64_t sub_2487C43A4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2487C43C4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void sub_2487C4400(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_2487C4448()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2487C446C(uint64_t a1)
{
  return a1;
}

uint64_t sub_2487C44A4(uint64_t a1, unsigned char *a2)
{
  return sub_2487C3168(a1, a2);
}

uint64_t sub_2487C44AC(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  id v3 = v2;
  swift_retain();
  swift_retain();
  return a1;
}

unint64_t sub_2487C4530()
{
  unint64_t result = qword_2693295B8;
  if (!qword_2693295B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2693295A8);
    sub_2487C4618();
    sub_2487C47A4(&qword_2693295E0, &qword_2693295A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693295B8);
  }
  return result;
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

unint64_t sub_2487C4618()
{
  unint64_t result = qword_2693295C0;
  if (!qword_2693295C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2693295C8);
    sub_2487C47A4(&qword_2693295D0, &qword_2693295D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693295C0);
  }
  return result;
}

unint64_t sub_2487C46B8()
{
  unint64_t result = qword_2693295E8;
  if (!qword_2693295E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693295E8);
  }
  return result;
}

uint64_t sub_2487C4710()
{
  return sub_2487C33E0();
}

uint64_t sub_2487C4738(uint64_t a1)
{
  return sub_2487C3590(a1, v1 + 16);
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

unint64_t sub_2487C4758()
{
  unint64_t result = qword_269329608;
  if (!qword_269329608)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269329608);
  }
  return result;
}

uint64_t sub_2487C479C()
{
  return sub_2487C3880(v0 + 16);
}

uint64_t sub_2487C47A4(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2487C47E8()
{
  return sub_2487CE5D0();
}

uint64_t objectdestroyTm()
{
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 120, 7);
}

uint64_t sub_2487C48AC()
{
  return sub_2487C3B28(v0 + 16);
}

uint64_t sub_2487C48B4()
{
  return sub_2487C3A74(*(long long **)(v0 + 16));
}

uint64_t sub_2487C48D0(uint64_t a1)
{
  return a1;
}

uint64_t sub_2487C48FC()
{
  return sub_2487CE5D0();
}

uint64_t sub_2487C4958(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2487CE270();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2487C49BC(uint64_t a1)
{
  uint64_t v2 = sub_2487CE270();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2487C4A18(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2487C4A60(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2487C4AC4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2487C4B20(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_2487C4B88()
{
  unint64_t result = qword_269329698;
  if (!qword_269329698)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2693295F0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2693295A8);
    sub_2487C4530();
    sub_2487C46B8();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269329698);
  }
  return result;
}

uint64_t sub_2487C4C68(double a1, double a2, double a3, double a4, double a5, double a6, uint64_t a7, char a8)
{
  if ((a8 & 1) == 0)
  {
    if (qword_2693294C8 != -1) {
      uint64_t result = swift_once();
    }
    if (*(double *)&qword_269329F78 != a5 || unk_269329F80 != a6)
    {
      if (qword_2693294D0 != -1) {
        uint64_t result = swift_once();
      }
      if (*(double *)&xmmword_269329F90 != a5 || *((double *)&xmmword_269329F90 + 1) != a6)
      {
        if (qword_2693294D8 != -1) {
          uint64_t result = swift_once();
        }
        if (*(double *)&xmmword_269329FA0 != a5 || *((double *)&xmmword_269329FA0 + 1) != a6)
        {
          if (qword_2693294E0 != -1) {
            uint64_t result = swift_once();
          }
          BOOL v13 = *(double *)&xmmword_269329FB0 == a5 && *((double *)&xmmword_269329FB0 + 1) == a6;
          if (!v13 && (a5 != 0.5 || a6 != 0.5))
          {
            if (qword_2693294E8 != -1) {
              uint64_t result = swift_once();
            }
            if (*(double *)&xmmword_269329FC0 != a5 || *((double *)&xmmword_269329FC0 + 1) != a6)
            {
              if (qword_2693294F0 != -1) {
                uint64_t result = swift_once();
              }
              if (*(double *)&xmmword_269329FD0 != a5 || *((double *)&xmmword_269329FD0 + 1) != a6)
              {
                if (qword_2693294F8 != -1) {
                  uint64_t result = swift_once();
                }
                if ((*(double *)&xmmword_269329FE0 != a5 || *((double *)&xmmword_269329FE0 + 1) != a6)
                  && qword_269329500 != -1)
                {
                  return swift_once();
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

uint64_t sub_2487C4FB0()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for GazeFocusModelFactory()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for GazeFocusModel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_retain();
  return a1;
}

uint64_t destroy for GazeFocusModel()
{
  return swift_release();
}

void *assignWithCopy for GazeFocusModel(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for GazeFocusModel(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for GazeFocusModel(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GazeFocusModel(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for GazeFocusModel()
{
  return &type metadata for GazeFocusModel;
}

void sub_2487C5168()
{
  if (AXDeviceIsPhone())
  {
    id v0 = objc_msgSend(self, sel_mainScreen);
    objc_msgSend(v0, sel_bounds);
    CGFloat v2 = v1;
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;

    v9.origin.x = v2;
    v9.origin.y = v4;
    v9.size.width = v6;
    v9.size.height = v8;
    CGRectGetWidth(v9);
  }
  else if (qword_2693294C0 != -1)
  {
    swift_once();
  }
}

double sub_2487C52C4(char a1)
{
  double result = 0.5;
  switch(a1)
  {
    case 1:
    case 2:
      if (qword_2693294C8 != -1) {
        swift_once();
      }
      CGFloat v2 = (long long *)&qword_269329F78;
      goto LABEL_26;
    case 3:
      if (qword_2693294D0 != -1) {
        swift_once();
      }
      CGFloat v2 = &xmmword_269329F90;
      goto LABEL_26;
    case 4:
    case 5:
      if (qword_2693294D8 != -1) {
        swift_once();
      }
      CGFloat v2 = &xmmword_269329FA0;
      goto LABEL_26;
    case 6:
      if (qword_2693294E8 != -1) {
        swift_once();
      }
      CGFloat v2 = &xmmword_269329FC0;
      goto LABEL_26;
    case 7:
    case 8:
      if (qword_269329500 != -1) {
        swift_once();
      }
      CGFloat v2 = &xmmword_269329FF0;
      goto LABEL_26;
    case 9:
      if (qword_2693294F8 != -1) {
        swift_once();
      }
      CGFloat v2 = &xmmword_269329FE0;
      goto LABEL_26;
    case 10:
    case 11:
      if (qword_2693294F0 != -1) {
        swift_once();
      }
      CGFloat v2 = &xmmword_269329FD0;
      goto LABEL_26;
    case 12:
      if (qword_2693294E0 != -1) {
        swift_once();
      }
      CGFloat v2 = &xmmword_269329FB0;
LABEL_26:
      double result = *(double *)v2;
      break;
    default:
      return result;
  }
  return result;
}

void sub_2487C5528(unsigned __int8 a1, double *a2, double a3)
{
  if (!AXDeviceIsPhone()) {
    return;
  }
  id v6 = objc_msgSend(self, sel_sharedApplication);
  id v7 = objc_msgSend(v6, sel_keyWindow);

  if (!v7) {
    return;
  }
  unsigned int v8 = a1;
  id v9 = objc_msgSend(self, sel_currentDevice);
  id v10 = objc_msgSend(v9, sel_orientation);

  objc_msgSend(v7, sel_safeAreaInsets);
  double v12 = v11;

  if (v10 == (id)4)
  {
    if (v8 - 5 > 2) {
      return;
    }
    double v13 = *a2 - (a3 * 0.5 + v12);
    goto LABEL_14;
  }
  if (v10 == (id)3)
  {
    if (v8 > 0xC || ((1 << v8) & 0x1802) == 0) {
      return;
    }
    double v13 = v12 + a3 * -0.5 + *a2;
LABEL_14:
    *a2 = v13;
    return;
  }
  if (v10 == (id)1 && v8 <= 5 && ((1 << v8) & 0x2A) != 0) {
    a2[1] = v12 + a3 * -0.5 + a2[1];
  }
}

uint64_t sub_2487C56B0(char a1, uint64_t a2)
{
  switch(a1)
  {
    case 1:
    case 7:
      uint64_t v4 = sub_2487CE4C0();
      break;
    case 2:
    case 8:
      uint64_t v4 = sub_2487CE530();
      break;
    case 3:
    case 12:
      uint64_t v4 = sub_2487CE550();
      break;
    case 4:
      uint64_t v4 = sub_2487CE540();
      break;
    case 5:
    case 13:
      uint64_t v4 = sub_2487CE4B0();
      break;
    case 6:
      uint64_t v4 = sub_2487CE560();
      break;
    case 9:
      uint64_t v4 = sub_2487CE4F0();
      break;
    case 10:
      uint64_t v4 = sub_2487CE4E0();
      break;
    case 11:
      uint64_t v4 = sub_2487CE510();
      break;
    default:
      uint64_t v4 = sub_2487CE520();
      break;
  }
  uint64_t v5 = v4;
  sub_2487C5874(a2, (uint64_t)v21);
  if ((v24 & 1) == 0)
  {
    double v6 = v22;
    double v7 = v23;
    swift_retain();
    double v8 = sub_2487C52C4(a1);
    double v10 = v8;
    double v11 = v9;
    if (qword_2693294C0 != -1) {
      swift_once();
    }
    double v12 = *(double *)&qword_269329F70;
    sub_2487C4C68(v8, v9, v6, v7, v10, v11, qword_269329F70, 0);
    double v14 = v13;
    double v16 = v15;
    sub_2487C5168();
    v20[0] = v14 + v17;
    v20[1] = v16 + v18;
    sub_2487C5528(a1, v20, v12);
    swift_release();
  }
  return v5;
}

uint64_t sub_2487C5874(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329700);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

char *sub_2487C58E0(double a1, double a2, double a3, double a4)
{
  double v9 = self;
  double v10 = v4;
  id v55 = objc_msgSend(v9, sel_effectWithStyle_, 18);
  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E50]), sel_init);
  uint64_t v12 = OBJC_IVAR____TtC16AssistiveTouchUI22CalibrationContentView_blurView;
  *(void *)&v10[OBJC_IVAR____TtC16AssistiveTouchUI22CalibrationContentView_blurView] = v11;
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v11, sel_setEffect_, v55);
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E00]), sel_init);
  uint64_t v14 = OBJC_IVAR____TtC16AssistiveTouchUI22CalibrationContentView_overlayView;
  *(void *)&v10[OBJC_IVAR____TtC16AssistiveTouchUI22CalibrationContentView_overlayView] = v13;
  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  double v15 = self;
  id v16 = v13;
  id v17 = objc_msgSend(v15, sel_blackColor);
  objc_msgSend(v16, sel_setBackgroundColor_, v17);

  id v18 = objc_msgSend(*(id *)&v10[v14], sel_layer);
  LODWORD(v19) = 1060320051;
  objc_msgSend(v18, sel_setOpacity_, v19);

  id v20 = objc_msgSend(*(id *)&v10[v12], sel_contentView);
  id v21 = *(id *)&v10[v14];
  objc_msgSend(v20, sel_addSubview_, v21);

  v56.receiver = v10;
  v56.super_class = (Class)type metadata accessor for CalibrationContentView();
  double v22 = (char *)objc_msgSendSuper2(&v56, sel_initWithFrame_, a1, a2, a3, a4);
  id v23 = objc_msgSend(v15, sel_clearColor);
  objc_msgSend(v22, sel_setBackgroundColor_, v23);

  objc_msgSend(v22, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  uint64_t v24 = OBJC_IVAR____TtC16AssistiveTouchUI22CalibrationContentView_blurView;
  uint64_t v25 = *(void **)&v22[OBJC_IVAR____TtC16AssistiveTouchUI22CalibrationContentView_blurView];
  objc_msgSend(v22, sel_addSubview_, v25);
  objc_msgSend(v22, sel_setIsAccessibilityElement_, 0);
  id v54 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693297F0);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_2487CF480;
  id v27 = objc_msgSend(v25, sel_topAnchor);
  id v28 = [v22 (SEL)0x26523F533];
  id v29 = objc_msgSend(v27, sel_constraintEqualToAnchor_, v28);

  *(void *)(v26 + 32) = v29;
  id v30 = objc_msgSend(*(id *)&v22[v24], sel_leadingAnchor);
  id v31 = objc_msgSend(v22, sel_leadingAnchor);
  id v32 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v31);

  *(void *)(v26 + 40) = v32;
  id v33 = objc_msgSend(*(id *)&v22[v24], sel_trailingAnchor);
  id v34 = objc_msgSend(v22, sel_trailingAnchor);
  id v35 = objc_msgSend(v33, sel_constraintEqualToAnchor_, v34);

  *(void *)(v26 + 48) = v35;
  id v36 = objc_msgSend(*(id *)&v22[v24], sel_bottomAnchor);
  id v37 = objc_msgSend(v22, sel_bottomAnchor);
  id v38 = objc_msgSend(v36, sel_constraintEqualToAnchor_, v37);

  *(void *)(v26 + 56) = v38;
  uint64_t v39 = OBJC_IVAR____TtC16AssistiveTouchUI22CalibrationContentView_overlayView;
  id v40 = objc_msgSend(*(id *)&v22[OBJC_IVAR____TtC16AssistiveTouchUI22CalibrationContentView_overlayView], sel_topAnchor);
  id v41 = objc_msgSend(v22, sel_topAnchor);
  id v42 = objc_msgSend(v40, sel_constraintEqualToAnchor_, v41);

  *(void *)(v26 + 64) = v42;
  id v43 = objc_msgSend(*(id *)&v22[v39], sel_leadingAnchor);
  id v44 = objc_msgSend(v22, sel_leadingAnchor);
  id v45 = objc_msgSend(v43, sel_constraintEqualToAnchor_, v44);

  *(void *)(v26 + 72) = v45;
  id v46 = objc_msgSend(*(id *)&v22[v39], sel_trailingAnchor);
  id v47 = objc_msgSend(v22, sel_trailingAnchor);
  id v48 = objc_msgSend(v46, sel_constraintEqualToAnchor_, v47);

  *(void *)(v26 + 80) = v48;
  id v49 = objc_msgSend(*(id *)&v22[v39], sel_bottomAnchor);
  id v50 = objc_msgSend(v22, sel_bottomAnchor);
  id v51 = objc_msgSend(v49, sel_constraintEqualToAnchor_, v50);

  *(void *)(v26 + 88) = v51;
  sub_2487CE740();
  sub_2487C6008();
  uint64_t v52 = (void *)sub_2487CE730();
  swift_bridgeObjectRelease();
  objc_msgSend(v54, sel_activateConstraints_, v52);

  return v22;
}

id sub_2487C5F64()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CalibrationContentView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CalibrationContentView()
{
  return self;
}

unint64_t sub_2487C6008()
{
  unint64_t result = qword_269329718;
  if (!qword_269329718)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269329718);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for GazeFocusState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF2) {
    goto LABEL_17;
  }
  if (a2 + 14 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 14) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 14;
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
      return (*a1 | (v4 << 8)) - 14;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 14;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xF;
  int v8 = v6 - 15;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for GazeFocusState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF1)
  {
    unsigned int v6 = ((a2 - 242) >> 8) + 1;
    *unint64_t result = a2 + 14;
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
        JUMPOUT(0x2487C61B0);
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
          *unint64_t result = a2 + 14;
        break;
    }
  }
  return result;
}

uint64_t sub_2487C61D8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2487C61E4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for GazeFocusState()
{
  return &type metadata for GazeFocusState;
}

uint64_t sub_2487C61FC(unsigned __int8 a1)
{
  sub_2487CE7C0();
  int v2 = (char *)MEMORY[0x24C5805D0]();
  int v3 = (id *)&v2[*MEMORY[0x263F22308]];
  swift_beginAccess();
  id v4 = *v3;

  char v5 = sub_2487CE7A0();
  if (v5) {
    unsigned int v6 = &unk_26FC82578;
  }
  else {
    unsigned int v6 = &unk_26FC825A8;
  }
  uint64_t v7 = sub_2487C6318(a1, (uint64_t)v6);
  if (v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v7;
  }
  BOOL v10 = __OFADD__(v9, 1);
  uint64_t v11 = v9 + 1;
  if (v10)
  {
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v5) {
    uint64_t v12 = &unk_26FC82578;
  }
  else {
    uint64_t v12 = &unk_26FC825A8;
  }
  uint64_t v13 = v12[2];
  if (v11 < v13)
  {
    if ((v11 & 0x8000000000000000) == 0)
    {
      if (v5) {
        uint64_t v14 = (char *)&unk_26FC82578;
      }
      else {
        uint64_t v14 = (char *)&unk_26FC825A8;
      }
      double v15 = &v14[v11];
      goto LABEL_21;
    }
    goto LABEL_23;
  }
  if (v13)
  {
    if (v5) {
      double v15 = (char *)&unk_26FC82578;
    }
    else {
      double v15 = (char *)&unk_26FC825A8;
    }
LABEL_21:
    uint64_t v16 = v15[32];
    swift_bridgeObjectRelease();
    return v16;
  }
LABEL_24:
  uint64_t result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_2487C6318(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = 0;
  uint64_t v4 = a2 + 32;
  uint64_t v5 = a1;
  while (2)
  {
    unint64_t v6 = 0xE700000000000000;
    unint64_t v7 = 0x6C616974696E69;
    switch(*(unsigned char *)(v4 + v3))
    {
      case 1:
        unint64_t v7 = 0x7466654C706F74;
        break;
      case 2:
        unint64_t v7 = 0x4D7466654C706F74;
        unint64_t v6 = 0xED0000656C646469;
        break;
      case 3:
        unint64_t v6 = 0xE300000000000000;
        unint64_t v7 = 7368564;
        break;
      case 4:
        unint64_t v7 = 0x7468676952706F74;
        unint64_t v6 = 0xEE00656C6464694DLL;
        break;
      case 5:
        unint64_t v6 = 0xE800000000000000;
        unint64_t v7 = 0x7468676952706F74;
        break;
      case 6:
        unint64_t v6 = 0xE500000000000000;
        unint64_t v7 = 0x7468676972;
        break;
      case 7:
        unint64_t v7 = 0x69526D6F74746F62;
        unint64_t v6 = 0xEB00000000746867;
        break;
      case 8:
        unint64_t v7 = 0xD000000000000011;
        unint64_t v6 = 0x80000002487CFC20;
        break;
      case 9:
        unint64_t v6 = 0xE600000000000000;
        unint64_t v7 = 0x6D6F74746F62;
        break;
      case 0xA:
        unint64_t v6 = 0x80000002487CFC40;
        unint64_t v7 = 0xD000000000000010;
        break;
      case 0xB:
        unint64_t v7 = 0x654C6D6F74746F62;
        unint64_t v6 = 0xEA00000000007466;
        break;
      case 0xC:
        unint64_t v6 = 0xE400000000000000;
        unint64_t v7 = 1952867692;
        break;
      case 0xD:
        unint64_t v6 = 0xE600000000000000;
        unint64_t v7 = 0x7265746E6563;
        break;
      case 0xE:
        unint64_t v6 = 0xE800000000000000;
        unint64_t v7 = 0x6574656C706D6F63;
        break;
      default:
        break;
    }
    unint64_t v8 = 0xE700000000000000;
    uint64_t v9 = 0x6C616974696E69;
    switch(v5)
    {
      case 1:
        if (v7 == 0x7466654C706F74) {
          goto LABEL_45;
        }
        goto LABEL_46;
      case 2:
        unint64_t v8 = 0xED0000656C646469;
        if (v7 != 0x4D7466654C706F74) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 3:
        unint64_t v8 = 0xE300000000000000;
        if (v7 != 7368564) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 4:
        unint64_t v8 = 0xEE00656C6464694DLL;
        if (v7 != 0x7468676952706F74) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 5:
        unint64_t v8 = 0xE800000000000000;
        if (v7 != 0x7468676952706F74) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 6:
        unint64_t v8 = 0xE500000000000000;
        if (v7 != 0x7468676972) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 7:
        unint64_t v8 = 0xEB00000000746867;
        if (v7 != 0x69526D6F74746F62) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 8:
        unint64_t v8 = 0x80000002487CFC20;
        if (v7 != 0xD000000000000011) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 9:
        unint64_t v8 = 0xE600000000000000;
        if (v7 != 0x6D6F74746F62) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 10:
        unint64_t v8 = 0x80000002487CFC40;
        if (v7 != 0xD000000000000010) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 11:
        unint64_t v8 = 0xEA00000000007466;
        if (v7 != 0x654C6D6F74746F62) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 12:
        unint64_t v8 = 0xE400000000000000;
        if (v7 != 1952867692) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 13:
        unint64_t v8 = 0xE600000000000000;
        uint64_t v9 = 0x7265746E6563;
        goto LABEL_44;
      case 14:
        unint64_t v8 = 0xE800000000000000;
        if (v7 != 0x6574656C706D6F63) {
          goto LABEL_46;
        }
        goto LABEL_45;
      default:
LABEL_44:
        if (v7 != v9) {
          goto LABEL_46;
        }
LABEL_45:
        if (v6 == v8)
        {
          swift_bridgeObjectRelease_n();
          return v3;
        }
LABEL_46:
        char v10 = sub_2487CE870();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v10) {
          return v3;
        }
        if (v2 != ++v3) {
          continue;
        }
        uint64_t v3 = 0;
        break;
    }
    return v3;
  }
}

unint64_t sub_2487C67C8(char a1)
{
  unint64_t result = 0x6C616974696E69;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x7466654C706F74;
      break;
    case 2:
      unint64_t result = 0x4D7466654C706F74;
      break;
    case 3:
      unint64_t result = 7368564;
      break;
    case 4:
    case 5:
      unint64_t result = 0x7468676952706F74;
      break;
    case 6:
      unint64_t result = 0x7468676972;
      break;
    case 7:
      unint64_t result = 0x69526D6F74746F62;
      break;
    case 8:
      unint64_t result = 0xD000000000000011;
      break;
    case 9:
      unint64_t result = 0x6D6F74746F62;
      break;
    case 10:
      unint64_t result = 0xD000000000000010;
      break;
    case 11:
      unint64_t result = 0x654C6D6F74746F62;
      break;
    case 12:
      unint64_t result = 1952867692;
      break;
    case 13:
      unint64_t result = 0x7265746E6563;
      break;
    case 14:
      unint64_t result = 0x6574656C706D6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2487C6990()
{
  char v1 = *v0;
  sub_2487CE8A0();
  sub_2487C67C8(v1);
  sub_2487CE710();
  swift_bridgeObjectRelease();
  return sub_2487CE8B0();
}

uint64_t sub_2487C69F4()
{
  sub_2487C67C8(*v0);
  sub_2487CE710();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2487C6A48()
{
  char v1 = *v0;
  sub_2487CE8A0();
  sub_2487C67C8(v1);
  sub_2487CE710();
  swift_bridgeObjectRelease();
  return sub_2487CE8B0();
}

uint64_t sub_2487C6AA8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2487C6C30();
  *a1 = result;
  return result;
}

unint64_t sub_2487C6AD8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_2487C67C8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2487C6B04(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_2487C67C8(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_2487C67C8(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_2487CE870();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

void sub_2487C6B90(void *a1@<X8>)
{
  *a1 = &unk_26FC82578;
}

uint64_t sub_2487C6BA0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2487C61FC(*v1);
  *a1 = result;
  return result;
}

unint64_t sub_2487C6BD0()
{
  unint64_t result = qword_269329720;
  if (!qword_269329720)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269329728);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269329720);
  }
  return result;
}

uint64_t sub_2487C6C30()
{
  unint64_t v0 = sub_2487CE850();
  swift_bridgeObjectRelease();
  if (v0 >= 0xF) {
    return 15;
  }
  else {
    return v0;
  }
}

uint64_t sub_2487C6C7C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2487CE170();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2487C6CF0(char a1)
{
  swift_getKeyPath();
  swift_getKeyPath();
  v5[0] = a1;
  swift_retain();
  sub_2487CE180();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2487CE170();
  swift_release();
  swift_release();
  sub_2487C5874(v1 + OBJC_IVAR____TtC16AssistiveTouchUI16GazeStateManager_frame, (uint64_t)v4);
  uint64_t result = sub_2487C5874((uint64_t)v4, (uint64_t)v5);
  if ((v5[32] & 1) == 0)
  {
    sub_2487C56B0(a1, (uint64_t)v4);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    return sub_2487CE180();
  }
  return result;
}

double sub_2487C6E3C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2487CE170();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2487C6EB4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329768);
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v0 + OBJC_IVAR____TtC16AssistiveTouchUI16GazeStateManager__focusModel;
  uint64_t v6 = sub_2487CE4D0();
  v17[1] = 0;
  v17[2] = 0;
  v17[0] = v6;
  sub_2487CE150();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v5, v4, v1);
  uint64_t v7 = v0 + OBJC_IVAR____TtC16AssistiveTouchUI16GazeStateManager_frame;
  *(_OWORD *)uint64_t v7 = 0u;
  *(_OWORD *)(v7 + 16) = 0u;
  *(unsigned char *)(v7 + 32) = 1;
  swift_beginAccess();
  v16[0] = 0;
  sub_2487CE150();
  swift_endAccess();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2487CE170();
  swift_release();
  swift_release();
  char v8 = v17[0];
  sub_2487C5874(v7, (uint64_t)v16);
  sub_2487C5874((uint64_t)v16, (uint64_t)v17);
  if ((v18 & 1) == 0)
  {
    uint64_t v9 = sub_2487C56B0(v8, (uint64_t)v16);
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    swift_getKeyPath();
    swift_getKeyPath();
    v15[1] = v9;
    v15[2] = v11;
    v15[3] = v13;
    swift_retain();
    sub_2487CE180();
  }
  return v0;
}

uint64_t sub_2487C70D8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2487CE170();
  swift_release();
  swift_release();
  unsigned __int8 v1 = sub_2487C61FC(v5[0]);
  swift_getKeyPath();
  swift_getKeyPath();
  if (v1 == 15) {
    v5[0] = 1;
  }
  else {
    v5[0] = v1;
  }
  swift_retain();
  sub_2487CE180();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2487CE170();
  swift_release();
  swift_release();
  char v2 = v5[0];
  sub_2487C5874(v0 + OBJC_IVAR____TtC16AssistiveTouchUI16GazeStateManager_frame, (uint64_t)v4);
  uint64_t result = sub_2487C5874((uint64_t)v4, (uint64_t)v5);
  if ((v5[32] & 1) == 0)
  {
    sub_2487C56B0(v2, (uint64_t)v4);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    return sub_2487CE180();
  }
  return result;
}

uint64_t sub_2487C7288()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16AssistiveTouchUI16GazeStateManager__gazeState;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269329770);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC16AssistiveTouchUI16GazeStateManager__focusModel;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329768);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v5, v6);
}

uint64_t sub_2487C7374()
{
  return type metadata accessor for GazeStateManager();
}

uint64_t type metadata accessor for GazeStateManager()
{
  uint64_t result = qword_269329748;
  if (!qword_269329748) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2487C73C8()
{
  sub_2487C74B8(319, &qword_269329758);
  if (v0 <= 0x3F)
  {
    sub_2487C74B8(319, &qword_269329760);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_2487C74B8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_2487CE190();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t sub_2487C7500()
{
  return MEMORY[0x263EFDDD8];
}

uint64_t sub_2487C750C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for GazeStateManager();
  uint64_t result = sub_2487CE140();
  *a1 = result;
  return result;
}

void sub_2487C755C()
{
  qword_269329F70 = 0x4049000000000000;
}

void sub_2487C756C()
{
  qword_269329F78 = 0;
  unk_269329F80 = 0;
}

double sub_2487C757C()
{
  double result = 0.5;
  xmmword_269329F90 = xmmword_2487CF6D0;
  return result;
}

double sub_2487C7590()
{
  double result = 1.0;
  xmmword_269329FA0 = xmmword_2487CF6E0;
  return result;
}

double sub_2487C75A4()
{
  double result = 0.0;
  xmmword_269329FB0 = xmmword_2487CF6F0;
  return result;
}

double sub_2487C75B8()
{
  double result = 1.0;
  xmmword_269329FC0 = xmmword_2487CF700;
  return result;
}

double sub_2487C75CC()
{
  double result = 0.0;
  xmmword_269329FD0 = xmmword_2487CF710;
  return result;
}

double sub_2487C75E0()
{
  double result = 0.5;
  xmmword_269329FE0 = xmmword_2487CF720;
  return result;
}

__n128 sub_2487C75F4()
{
  __asm { FMOV            V0.2D, #1.0 }
  xmmword_269329FF0 = (__int128)result;
  return result;
}

uint64_t sub_2487C7604(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_2487C7648()
{
  uint64_t v1 = OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController____lazy_storage___calibrationView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController____lazy_storage___calibrationView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController____lazy_storage___calibrationView);
  }
  else
  {
    uint64_t v4 = v0;
    uint64_t v5 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    sub_2487CDD90((uint64_t)sub_2487C98D4, 0, (uint64_t)sub_2487C8B84, v5, (uint64_t)v11);
    id v6 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2693297E8));
    uint64_t v7 = (void *)sub_2487CE240();
    char v8 = *(void **)(v0 + v1);
    *(void *)(v4 + v1) = v7;
    id v3 = v7;

    uint64_t v2 = 0;
  }
  id v9 = v2;
  return v3;
}

void sub_2487C773C(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x24C580C80](v1);
  if (v2)
  {
    id v3 = (void *)v2;
    swift_beginAccess();
    uint64_t v4 = MEMORY[0x24C580C80](v1);
    uint64_t v5 = (void *)v4;
    if (v4)
    {
      uint64_t v7 = *(void *)(v4 + OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_dismissCompletion);
      uint64_t v6 = *(void *)(v4 + OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_dismissCompletion + 8);
      swift_retain();

      v8[4] = v7;
      v8[5] = v6;
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 1107296256;
      v8[2] = sub_2487C7604;
      v8[3] = &block_descriptor_0;
      uint64_t v5 = _Block_copy(v8);
      swift_release();
    }
    objc_msgSend(v3, sel_dismissViewControllerAnimated_completion_, 1, v5);
    _Block_release(v5);
  }
}

id CalibrationViewController.__allocating_init(delegate:dismissCompletion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (char *)objc_allocWithZone(v3);
  swift_unknownObjectWeakInit();
  *(void *)&v6[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_cancellable] = 0;
  *(void *)&v6[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_enrollmentCancellable] = 0;
  uint64_t v7 = OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_calibrationObservable;
  type metadata accessor for CalibrationViewDelegate();
  swift_allocObject();
  char v8 = v6;
  *(void *)&v6[v7] = sub_2487C9614();
  *(void *)&v8[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController____lazy_storage___calibrationView] = 0;
  swift_unknownObjectWeakAssign();
  id v9 = &v8[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_dismissCompletion];
  *(void *)id v9 = a2;
  *((void *)v9 + 1) = a3;
  swift_retain();

  v12.receiver = v8;
  v12.super_class = v3;
  id v10 = objc_msgSendSuper2(&v12, sel_initWithNibName_bundle_, 0, 0);
  swift_unknownObjectRelease();
  swift_release();
  return v10;
}

id CalibrationViewController.init(delegate:dismissCompletion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_unknownObjectWeakInit();
  *(void *)&v3[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_cancellable] = 0;
  *(void *)&v3[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_enrollmentCancellable] = 0;
  uint64_t v6 = OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_calibrationObservable;
  type metadata accessor for CalibrationViewDelegate();
  swift_allocObject();
  uint64_t v7 = v3;
  *(void *)&v3[v6] = sub_2487C9614();
  *(void *)&v7[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController____lazy_storage___calibrationView] = 0;
  swift_unknownObjectWeakAssign();
  char v8 = &v7[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_dismissCompletion];
  *(void *)char v8 = a2;
  *((void *)v8 + 1) = a3;
  swift_retain();

  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for CalibrationViewController();
  id v9 = objc_msgSendSuper2(&v11, sel_initWithNibName_bundle_, 0, 0);
  swift_unknownObjectRelease();
  swift_release();
  return v9;
}

id CalibrationViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

uint64_t sub_2487C7B10()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693297B0);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693297B8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = (objc_class *)type metadata accessor for CalibrationViewController();
  v15.receiver = v0;
  v15.super_class = v10;
  objc_msgSendSuper2(&v15, sel_viewDidLoad);
  sub_2487C819C();
  swift_beginAccess();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693297C0);
  sub_2487CE160();
  swift_endAccess();
  swift_release();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_2487C8B08(&qword_2693297C8, &qword_2693297B8);
  uint64_t v11 = sub_2487CE1A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *(void *)&v1[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_cancellable] = v11;
  swift_release();
  swift_beginAccess();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693297D0);
  sub_2487CE160();
  swift_endAccess();
  swift_release();
  sub_2487C8B08((unint64_t *)&unk_2693297D8, &qword_2693297B0);
  uint64_t v12 = sub_2487CE1A0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)&v1[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_enrollmentCancellable] = v12;
  return swift_release();
}

void sub_2487C7E18(double *a1, uint64_t a2)
{
  double v2 = *a1;
  double v3 = a1[1];
  uint64_t v4 = a2 + 16;
  swift_beginAccess();
  uint64_t v5 = MEMORY[0x24C580C80](v4);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = MEMORY[0x24C580C80](v5 + OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_delegate);
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      if (v2 == 0.0 && v3 == 0.0)
      {
        swift_unknownObjectRelease();
      }
      else
      {
        id v9 = objc_msgSend(self, sel_sharedManager);
        id v10 = objc_msgSend(v8, sel_gazePointManager);
        if (!v10)
        {
          __break(1u);
          return;
        }
        objc_msgSend(v10, sel_lastSeenLookAtPoint);
        double v12 = v11;
        double v14 = v13;
        swift_unknownObjectRelease();
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        sub_2487CE170();
        swift_release();
        swift_release();
        swift_release();
        sub_2487C67C8(v16);
        objc_super v15 = (void *)sub_2487CE700();
        swift_bridgeObjectRelease();
        objc_msgSend(v9, sel_captureCurrentEnrollmentPoint_gazePoint_positionName_, v15, v2, v3, v12, v14);
        swift_unknownObjectRelease();
      }
    }
  }
}

void sub_2487C7FD0(unsigned char *a1)
{
  if (*a1 == 1)
  {
    id v1 = objc_msgSend(self, sel_sharedInstance);
    objc_msgSend(v1, sel_setAssistiveTouchBubbleModeEnabled_, 1);

    id v2 = objc_msgSend(self, sel_sharedManager);
    objc_msgSend(v2, sel_setEnrollmentComplete_, 1);
  }
}

void sub_2487C80F8(void *a1, uint64_t a2, uint64_t a3, const char **a4, char a5)
{
  v11.receiver = a1;
  v11.super_class = (Class)type metadata accessor for CalibrationViewController();
  uint64_t v8 = *a4;
  id v9 = v11.receiver;
  objc_msgSendSuper2(&v11, v8, a3);
  id v10 = objc_msgSend(self, sel_sharedApplication, v11.receiver, v11.super_class);
  objc_msgSend(v10, sel_setIdleTimerDisabled_, a5 & 1);
}

void sub_2487C819C()
{
  id v1 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CalibrationContentView()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  id v2 = objc_msgSend(v0, sel_view);
  if (!v2)
  {
    __break(1u);
    goto LABEL_14;
  }
  double v3 = v2;
  objc_msgSend(v2, sel_addSubview_, v1);

  id v4 = sub_2487C7648();
  objc_msgSend(v1, sel_addSubview_, v4);

  id v5 = sub_2487C7648();
  objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  id v52 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82CB0]), sel_initWithTarget_action_, v0, sel_handleTapGuesture_);
  objc_msgSend(v1, sel_addGestureRecognizer_);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693297F0);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_2487CF480;
  id v7 = objc_msgSend(v1, sel_topAnchor);
  id v8 = objc_msgSend(v0, sel_view);
  if (!v8)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  id v9 = v8;
  id v10 = objc_msgSend(v8, sel_topAnchor);

  id v11 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v10);
  *(void *)(v6 + 32) = v11;
  id v12 = objc_msgSend(v1, sel_leadingAnchor);
  id v13 = objc_msgSend(v0, sel_view);
  if (!v13)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  double v14 = v13;
  id v15 = objc_msgSend(v13, sel_leadingAnchor);

  id v16 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v15);
  *(void *)(v6 + 40) = v16;
  id v17 = objc_msgSend(v1, sel_trailingAnchor);
  id v18 = objc_msgSend(v0, sel_view);
  if (!v18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  double v19 = v18;
  id v20 = objc_msgSend(v18, sel_trailingAnchor);

  id v21 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v20);
  *(void *)(v6 + 48) = v21;
  id v22 = objc_msgSend(v1, sel_bottomAnchor);
  id v23 = objc_msgSend(v0, sel_view);
  if (!v23)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v24 = v23;
  id v25 = objc_msgSend(v23, sel_bottomAnchor);

  id v26 = objc_msgSend(v22, sel_constraintEqualToAnchor_, v25);
  *(void *)(v6 + 56) = v26;
  id v27 = sub_2487C7648();
  id v28 = objc_msgSend(v27, sel_topAnchor);

  id v29 = objc_msgSend(v0, sel_view);
  if (!v29)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id v30 = v29;
  id v31 = objc_msgSend(v29, sel_topAnchor);

  id v32 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v31);
  *(void *)(v6 + 64) = v32;
  id v33 = sub_2487C7648();
  id v34 = objc_msgSend(v33, sel_leadingAnchor);

  id v35 = objc_msgSend(v0, sel_view);
  if (!v35)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  id v36 = v35;
  id v37 = objc_msgSend(v35, sel_leadingAnchor);

  id v38 = objc_msgSend(v34, sel_constraintEqualToAnchor_, v37);
  *(void *)(v6 + 72) = v38;
  id v39 = sub_2487C7648();
  id v40 = objc_msgSend(v39, sel_trailingAnchor);

  id v41 = objc_msgSend(v0, sel_view);
  if (!v41)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v42 = v41;
  id v43 = objc_msgSend(v41, sel_trailingAnchor);

  id v44 = objc_msgSend(v40, sel_constraintEqualToAnchor_, v43);
  *(void *)(v6 + 80) = v44;
  id v45 = sub_2487C7648();
  id v46 = objc_msgSend(v45, sel_bottomAnchor);

  id v47 = objc_msgSend(v0, sel_view);
  if (!v47)
  {
LABEL_21:
    __break(1u);
    return;
  }
  id v48 = v47;
  id v49 = self;
  id v50 = objc_msgSend(v48, sel_bottomAnchor);

  id v51 = objc_msgSend(v46, sel_constraintEqualToAnchor_, v50);
  *(void *)(v6 + 88) = v51;
  sub_2487CE740();
  sub_2487C6008();
  id v53 = (id)sub_2487CE730();
  swift_bridgeObjectRelease();
  objc_msgSend(v49, sel_activateConstraints_, v53);
}

void sub_2487C8758(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess();
  uint64_t v2 = MEMORY[0x24C580C80](v1);
  if (v2)
  {
    double v3 = (void *)v2;
    id v4 = (void *)MEMORY[0x24C580C80](v2 + OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_delegate);

    if (v4)
    {
      objc_msgSend(v4, sel_didForceDismissForEmergencyTap);
      swift_unknownObjectRelease();
    }
  }
}

id CalibrationViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = v3;
  if (a2)
  {
    uint64_t v6 = (void *)sub_2487CE700();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void CalibrationViewController.init(nibName:bundle:)()
{
}

id CalibrationViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CalibrationViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CalibrationViewController()
{
  return self;
}

void _s16AssistiveTouchUI25CalibrationViewControllerC5coderACSgSo7NSCoderC_tcfc_0()
{
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_cancellable] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_enrollmentCancellable] = 0;
  uint64_t v1 = OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController_calibrationObservable;
  type metadata accessor for CalibrationViewDelegate();
  swift_allocObject();
  *(void *)&v0[v1] = sub_2487C9614();
  *(void *)&v0[OBJC_IVAR____TtC16AssistiveTouchUI25CalibrationViewController____lazy_storage___calibrationView] = 0;

  sub_2487CE840();
  __break(1u);
}

uint64_t sub_2487C8AC8()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_2487C8B00(double *a1)
{
  sub_2487C7E18(a1, v1);
}

uint64_t sub_2487C8B08(unint64_t *a1, uint64_t *a2)
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

uint64_t method lookup function for CalibrationViewController(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CalibrationViewController);
}

uint64_t dispatch thunk of CalibrationViewController.__allocating_init(delegate:dismissCompletion:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
}

void sub_2487C8B84()
{
  sub_2487C773C(v0);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void sub_2487C8BA4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_2487CE170();
  swift_release();
  swift_release();
  swift_release();
  if ((v3[0] & 1) == 0)
  {
    uint64_t v1 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v3[4] = sub_2487C8CF4;
    v3[5] = v1;
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 1107296256;
    v3[2] = sub_2487C7604;
    v3[3] = &block_descriptor_23;
    uint64_t v2 = _Block_copy(v3);
    swift_release();
    objc_msgSend(v0, sel_dismissViewControllerAnimated_completion_, 1, v2);
    _Block_release(v2);
  }
}

void sub_2487C8CF4()
{
  sub_2487C8758(v0);
}

uint64_t sub_2487C8CFC(uint64_t a1)
{
  return a1;
}

uint64_t sub_2487C8D34()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2487CE170();
  swift_release();
  swift_release();
  return v1;
}

double sub_2487C8DA8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2487CE170();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2487C8E1C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2487CE170();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_2487C8E90()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC16AssistiveTouchUI23CalibrationViewDelegate__currentGazeState;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269329770);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC16AssistiveTouchUI23CalibrationViewDelegate__calibrationPoint;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693297C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = v0 + OBJC_IVAR____TtC16AssistiveTouchUI23CalibrationViewDelegate__enrollmentComplete;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693297D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v8 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v7, v8);
}

uint64_t sub_2487C8FC4()
{
  return type metadata accessor for CalibrationViewDelegate();
}

uint64_t type metadata accessor for CalibrationViewDelegate()
{
  uint64_t result = qword_269329818;
  if (!qword_269329818) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2487C9018()
{
  sub_2487C74B8(319, &qword_269329758);
  if (v0 <= 0x3F)
  {
    sub_2487C913C();
    if (v1 <= 0x3F)
    {
      sub_2487C74B8(319, &qword_269329830);
      if (v2 <= 0x3F) {
        swift_updateClassMetadata2();
      }
    }
  }
}

void sub_2487C913C()
{
  if (!qword_269329828)
  {
    type metadata accessor for CGPoint(255);
    unint64_t v0 = sub_2487CE190();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269329828);
    }
  }
}

uint64_t sub_2487C9194()
{
  return swift_retain();
}

uint64_t destroy for CalibrationView()
{
  swift_release();
  sub_2487C920C();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_2487C920C()
{
  return swift_release();
}

uint64_t initializeWithCopy for CalibrationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(unsigned char *)(a2 + 32);
  swift_retain();
  sub_2487C9194();
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(unsigned char *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  uint64_t v9 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v9;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  uint64_t v10 = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = v10;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CalibrationView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  char v6 = *(unsigned char *)(a2 + 32);
  sub_2487C9194();
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  sub_2487C920C();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_retain();
  swift_release();
  uint64_t v7 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v7;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
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
  long long v7 = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for CalibrationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_release();
  char v5 = *(unsigned char *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = v5;
  sub_2487C920C();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  swift_release();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_release();
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  swift_release();
  uint64_t v7 = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = v7;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CalibrationView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 136)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CalibrationView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 136) = 1;
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
    *(unsigned char *)(result + 136) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CalibrationView()
{
  return &type metadata for CalibrationView;
}

uint64_t sub_2487C95F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2487C9614()
{
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693297D0);
  uint64_t v1 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  long long v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693297C0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269329770);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  id v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = v0 + OBJC_IVAR____TtC16AssistiveTouchUI23CalibrationViewDelegate__currentGazeState;
  LOBYTE(v18) = 0;
  sub_2487CE150();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v12, v11, v8);
  uint64_t v13 = v0 + OBJC_IVAR____TtC16AssistiveTouchUI23CalibrationViewDelegate__calibrationPoint;
  type metadata accessor for CGPoint(0);
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  sub_2487CE150();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v13, v7, v4);
  uint64_t v14 = v0 + OBJC_IVAR____TtC16AssistiveTouchUI23CalibrationViewDelegate__enrollmentComplete;
  LOBYTE(v18) = 0;
  sub_2487CE150();
  (*(void (**)(uint64_t, char *, uint64_t))(v1 + 32))(v14, v3, v17);
  return v0;
}

uint64_t sub_2487C9894@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for CalibrationViewDelegate();
  uint64_t result = sub_2487CE140();
  *a1 = result;
  return result;
}

uint64_t sub_2487C98D4()
{
  return sub_2487C6EB4();
}

uint64_t sub_2487C990C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2487CE250();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329838);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = swift_allocObject();
  long long v11 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(v10 + 112) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(v10 + 128) = v11;
  *(void *)(v10 + 144) = *(void *)(v1 + 128);
  long long v12 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v10 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v10 + 64) = v12;
  long long v13 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v10 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v10 + 96) = v13;
  long long v14 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v10 + 32) = v14;
  sub_2487CC470(v1);
  uint64_t v15 = sub_2487CE260();
  char v16 = sub_2487CE3E0();
  v21[0] = sub_2487CC468;
  v21[1] = v10;
  v21[2] = v15;
  char v22 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269329840);
  sub_2487CC51C();
  sub_2487CE480();
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F18DC8], v3);
  uint64_t v18 = (uint64_t *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_269329860) + 36));
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329868);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v18 + *(int *)(v19 + 28), v6, v3);
  *uint64_t v18 = KeyPath;
  sub_2487C4A60((uint64_t)v9, a1, &qword_269329838);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return sub_2487C4AC4((uint64_t)v9, &qword_269329838);
}

uint64_t sub_2487C9B70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  id v25 = a3;
  uint64_t v26 = a1;
  uint64_t v4 = sub_2487CE3A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a2 + 24);
  type metadata accessor for GazeStateManager();
  sub_2487CE0CC(&qword_269329588, (void (*)(uint64_t))type metadata accessor for GazeStateManager);
  v24[1] = v9;
  v24[2] = v8;
  sub_2487CE1C0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2487CE170();
  swift_release();
  swift_release();
  swift_release();
  if (sub_2487C67C8(v27) == 0x6C616974696E69 && v10 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v11 = sub_2487CE870();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      sub_2487CE1C0();
      swift_getKeyPath();
      swift_getKeyPath();
      sub_2487CE170();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      double v17 = v28;
      double v18 = v29;
      uint64_t v12 = v26;
      goto LABEL_7;
    }
  }
  sub_2487CE3B0();
  uint64_t v12 = v26;
  sub_2487CE1F0();
  double v14 = v13;
  double v16 = v15;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  double v17 = v14 * 0.5;
  double v18 = v16 * 0.5;
LABEL_7:
  uint64_t v19 = sub_2487CE5E0();
  id v20 = v25;
  *id v25 = v19;
  v20[1] = v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329870);
  return sub_2487C9E58(a2, v12, (uint64_t)v20 + *(int *)(v22 + 44), v17, v18);
}

uint64_t sub_2487C9E58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v125 = a3;
  uint64_t v126 = a2;
  uint64_t v8 = sub_2487CE200();
  uint64_t v113 = *(void *)(v8 - 8);
  uint64_t v114 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v111 = v9;
  uint64_t v10 = &v89[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329878);
  uint64_t v119 = *(void *)(v121 - 8);
  MEMORY[0x270FA5388](v121);
  v117 = &v89[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v122 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329880);
  uint64_t v120 = *(void *)(v122 - 8);
  MEMORY[0x270FA5388](v122);
  v118 = &v89[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329888);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  v124 = &v89[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v14);
  v123 = &v89[-v16];
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329890);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = &v89[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329898);
  uint64_t v21 = *(void *)(v20 - 8);
  MEMORY[0x270FA5388](v20);
  id v23 = &v89[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693298A0);
  uint64_t v25 = MEMORY[0x270FA5388](v24 - 8);
  v116 = &v89[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v25);
  double v28 = &v89[-v27];
  v150[0] = *(_OWORD *)(a1 + 104);
  uint64_t v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693295F8);
  sub_2487CE5C0();
  uint64_t v29 = 1;
  if (v128 == 1)
  {
    *(void *)uint64_t v19 = sub_2487CE370();
    *((void *)v19 + 1) = 0;
    v19[16] = 1;
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693298F8);
    sub_2487CAA44(v126, (uint64_t)&v19[*(int *)(v30 + 44)]);
    char v31 = sub_2487CE3E0();
    sub_2487CE1B0();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    uint64_t v39 = v38;
    sub_2487C4A60((uint64_t)v19, (uint64_t)v23, &qword_269329890);
    id v40 = &v23[*(int *)(v20 + 36)];
    *id v40 = v31;
    *((void *)v40 + 1) = v33;
    *((void *)v40 + 2) = v35;
    *((void *)v40 + 3) = v37;
    *((void *)v40 + 4) = v39;
    v40[40] = 0;
    sub_2487C4AC4((uint64_t)v19, &qword_269329890);
    sub_2487C4B20((uint64_t)v23, (uint64_t)v28, &qword_269329898);
    uint64_t v29 = 0;
  }
  v112 = v28;
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v21 + 56))(v28, v29, 1, v20);
  uint64_t v41 = *(void *)(a1 + 16);
  uint64_t v42 = *(void *)(a1 + 24);
  int v43 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v44 = type metadata accessor for GazeStateManager();
  uint64_t v45 = sub_2487CE0CC(&qword_269329588, (void (*)(uint64_t))type metadata accessor for GazeStateManager);
  uint64_t v109 = v42;
  uint64_t v110 = v41;
  int v108 = v43;
  uint64_t v106 = v45;
  uint64_t v107 = v44;
  sub_2487CE1C0();
  v150[0] = *(_OWORD *)(a1 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693298A8);
  sub_2487CE5C0();
  double v46 = *(double *)&v128;
  uint64_t v47 = swift_allocObject();
  long long v48 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v47 + 112) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v47 + 128) = v48;
  *(void *)(v47 + 144) = *(void *)(a1 + 128);
  long long v49 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v47 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v47 + 64) = v49;
  long long v50 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v47 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v47 + 96) = v50;
  long long v51 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v47 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v47 + 32) = v51;
  sub_2487CC470(a1);
  sub_2487C3E10((uint64_t)sub_2487CC7C0, v47, (uint64_t)v152, v46);
  uint64_t v103 = v152[1];
  uint64_t v104 = v152[0];
  uint64_t v101 = v152[3];
  uint64_t v102 = v152[2];
  int v100 = v153;
  uint64_t v99 = v154;
  int v98 = v155;
  uint64_t v96 = v157;
  uint64_t v97 = v156;
  uint64_t v95 = v158;
  uint64_t v52 = v159;
  long long v105 = v160;
  swift_release();
  if (qword_2693294C0 != -1) {
    swift_once();
  }
  sub_2487CE5E0();
  sub_2487CE1D0();
  char v53 = v162;
  uint64_t v93 = v163;
  uint64_t v94 = v161;
  int v90 = v164;
  uint64_t v91 = v166;
  uint64_t v92 = v165;
  char v143 = v162;
  unsigned __int8 v141 = v164;
  v149[0] = *(_DWORD *)v145;
  *(_DWORD *)((char *)v149 + 3) = *(_DWORD *)&v145[3];
  v148[0] = *(_DWORD *)v144;
  *(_DWORD *)((char *)v148 + 3) = *(_DWORD *)&v144[3];
  *(_DWORD *)((char *)v147 + 3) = *(_DWORD *)&v142[3];
  v147[0] = *(_DWORD *)v142;
  *(_DWORD *)((char *)v146 + 3) = *(_DWORD *)&v140[3];
  v146[0] = *(_DWORD *)v140;
  uint64_t v55 = v113;
  uint64_t v54 = v114;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v113 + 16))(v10, v126, v114);
  unint64_t v56 = (*(unsigned __int8 *)(v55 + 80) + 152) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80);
  uint64_t v57 = swift_allocObject();
  long long v58 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v57 + 112) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v57 + 128) = v58;
  *(void *)(v57 + 144) = *(void *)(a1 + 128);
  long long v59 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v57 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v57 + 64) = v59;
  long long v60 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v57 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v57 + 96) = v60;
  long long v61 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v57 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v57 + 32) = v61;
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v55 + 32))(v57 + v56, v10, v54);
  *(_DWORD *)((char *)&v130 + 1) = v149[0];
  DWORD1(v130) = *(_DWORD *)((char *)v149 + 3);
  *(_DWORD *)((char *)&v131 + 1) = v148[0];
  DWORD1(v131) = *(_DWORD *)((char *)v148 + 3);
  *(_DWORD *)((char *)&v134 + 1) = v147[0];
  DWORD1(v134) = *(_DWORD *)((char *)v147 + 3);
  *(_DWORD *)((char *)&v135 + 1) = v146[0];
  DWORD1(v135) = *(_DWORD *)((char *)v146 + 3);
  *(void *)&long long v128 = v104;
  *((void *)&v128 + 1) = v103;
  *(void *)&long long v129 = v102;
  *((void *)&v129 + 1) = v101;
  LOBYTE(v130) = v100;
  *((void *)&v130 + 1) = v99;
  LOBYTE(v131) = v98;
  *((void *)&v131 + 1) = v97;
  *(void *)&long long v132 = v96;
  *((void *)&v132 + 1) = v95;
  *(void *)&v133[0] = v52;
  *(_OWORD *)((char *)v133 + 8) = v105;
  *((void *)&v133[1] + 1) = v94;
  LOBYTE(v134) = v53;
  *((void *)&v134 + 1) = v93;
  LOBYTE(v135) = v90;
  *((void *)&v135 + 1) = v92;
  *(void *)&long long v136 = v91;
  *((double *)&v136 + 1) = a4;
  *(double *)&long long v137 = a5;
  *((void *)&v137 + 1) = sub_2487CD264;
  long long v138 = (unint64_t)v57;
  uint64_t v139 = 0;
  sub_2487CC470(a1);
  sub_2487CE1C0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2487CE170();
  swift_release();
  swift_release();
  swift_release();
  char v127 = v150[0];
  uint64_t v62 = swift_allocObject();
  long long v63 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v62 + 112) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v62 + 128) = v63;
  *(void *)(v62 + 144) = *(void *)(a1 + 128);
  long long v64 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v62 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v62 + 64) = v64;
  long long v65 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v62 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v62 + 96) = v65;
  long long v66 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v62 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v62 + 32) = v66;
  sub_2487CC470(a1);
  uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693298B0);
  uint64_t v68 = sub_2487CD2D4(&qword_2693298B8, &qword_2693298B0, (void (*)(void))sub_2487CD350);
  unint64_t v69 = sub_2487C46B8();
  uint64_t v70 = v117;
  sub_2487CE490();
  swift_release();
  v150[10] = v137;
  v150[11] = v138;
  uint64_t v151 = v139;
  v150[6] = v133[1];
  v150[7] = v134;
  v150[8] = v135;
  v150[9] = v136;
  v150[2] = v130;
  v150[3] = v131;
  v150[4] = v132;
  v150[5] = v133[0];
  v150[0] = v128;
  v150[1] = v129;
  sub_2487CD4A0(v150);
  long long v128 = *(_OWORD *)(a1 + 88);
  sub_2487CE5C0();
  uint64_t v71 = swift_allocObject();
  long long v72 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v71 + 112) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v71 + 128) = v72;
  *(void *)(v71 + 144) = *(void *)(a1 + 128);
  long long v73 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v71 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v71 + 64) = v73;
  long long v74 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v71 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v71 + 96) = v74;
  long long v75 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v71 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v71 + 32) = v75;
  sub_2487CC470(a1);
  *(void *)&long long v128 = v67;
  *((void *)&v128 + 1) = &type metadata for GazeFocusState;
  *(void *)&long long v129 = v68;
  *((void *)&v129 + 1) = v69;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v77 = MEMORY[0x263F8D4F8];
  uint64_t v78 = MEMORY[0x263F8D510];
  v79 = v118;
  uint64_t v80 = v121;
  sub_2487CE490();
  swift_release();
  (*(void (**)(unsigned char *, uint64_t))(v119 + 8))(v70, v80);
  *(void *)&long long v128 = v80;
  *((void *)&v128 + 1) = v77;
  *(void *)&long long v129 = OpaqueTypeConformance2;
  *((void *)&v129 + 1) = v78;
  swift_getOpaqueTypeConformance2();
  uint64_t v81 = (uint64_t)v124;
  uint64_t v82 = v122;
  sub_2487CE480();
  (*(void (**)(unsigned char *, uint64_t))(v120 + 8))(v79, v82);
  v83 = v123;
  sub_2487C4B20(v81, (uint64_t)v123, &qword_269329888);
  uint64_t v84 = (uint64_t)v112;
  uint64_t v85 = v116;
  sub_2487C4A60((uint64_t)v112, (uint64_t)v116, &qword_2693298A0);
  sub_2487C4A60((uint64_t)v83, v81, &qword_269329888);
  uint64_t v86 = v125;
  sub_2487C4A60((uint64_t)v85, v125, &qword_2693298A0);
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_2693298F0);
  sub_2487C4A60(v81, v86 + *(int *)(v87 + 48), &qword_269329888);
  sub_2487C4AC4((uint64_t)v83, &qword_269329888);
  sub_2487C4AC4(v84, &qword_2693298A0);
  sub_2487C4AC4(v81, &qword_269329888);
  return sub_2487C4AC4((uint64_t)v85, &qword_2693298A0);
}

uint64_t sub_2487CAA44@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329900);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v17 - v8;
  *(void *)uint64_t v9 = sub_2487CE360();
  *((void *)v9 + 1) = 0x4024000000000000;
  v9[16] = 0;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329908);
  sub_2487CABE0(a1, (double *)&v9[*(int *)(v10 + 44)]);
  sub_2487CE1E0();
  double v12 = v11;
  if (qword_2693294C0 != -1) {
    swift_once();
  }
  double v13 = v12 * 0.5 + *(double *)&qword_269329F70 * 0.5;
  sub_2487C4A60((uint64_t)v9, (uint64_t)v7, &qword_269329900);
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329910);
  sub_2487C4A60((uint64_t)v7, a2 + *(int *)(v14 + 48), &qword_269329900);
  uint64_t v15 = a2 + *(int *)(v14 + 64);
  *(double *)uint64_t v15 = v13;
  *(unsigned char *)(v15 + 8) = 0;
  sub_2487C4AC4((uint64_t)v9, &qword_269329900);
  return sub_2487C4AC4((uint64_t)v7, &qword_269329900);
}

id sub_2487CABE0@<X0>(uint64_t a1@<X1>, double *a2@<X8>)
{
  uint64_t v4 = sub_2487CE4A0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329918);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  double v11 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  double v13 = (char *)&v58 - v12;
  sub_2487CE1E0();
  double v15 = v14;
  double v16 = 0.0;
  int IsPad = AXDeviceIsPad();
  if (IsPad) {
    double v16 = v15 / 6.0;
  }
  long long v64 = v13;
  id result = (id)AXAssistiveTouchBundle();
  if (result)
  {
    uint64_t v19 = result;
    uint64_t v58 = v5;
    uint64_t v59 = v4;
    int v60 = IsPad;
    uint64_t v61 = a1;
    uint64_t v62 = v11;
    long long v63 = a2;
    uint64_t v20 = sub_2487CE130();
    uint64_t v22 = v21;

    uint64_t v65 = v20;
    uint64_t v66 = v22;
    sub_2487CD5A0();
    uint64_t v23 = sub_2487CE440();
    uint64_t v25 = v24;
    char v27 = v26;
    if (qword_269329508 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_2487CE420();
    uint64_t v30 = v29;
    char v32 = v31 & 1;
    sub_2487CD5F4(v23, v25, v27 & 1);
    swift_bridgeObjectRelease();
    sub_2487CE520();
    uint64_t v33 = sub_2487CE410();
    uint64_t v35 = v34;
    char v37 = v36;
    swift_release();
    sub_2487CD5F4(v28, v30, v32);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, void, uint64_t))(v58 + 104))(v7, *MEMORY[0x263F1B378], v59);
    double v38 = 0.0;
    sub_2487CE570();
    uint64_t v39 = sub_2487CE430();
    uint64_t v41 = v40;
    char v43 = v42;
    uint64_t v45 = v44;
    swift_release();
    sub_2487CD5F4(v33, v35, v37 & 1);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v47 = swift_getKeyPath();
    uint64_t v48 = swift_getKeyPath();
    uint64_t v65 = v39;
    uint64_t v66 = v41;
    char v67 = v43 & 1;
    uint64_t v68 = v45;
    uint64_t v69 = KeyPath;
    char v70 = 1;
    uint64_t v71 = v47;
    uint64_t v72 = 3;
    char v73 = 0;
    uint64_t v74 = v48;
    uint64_t v75 = 0x3F847AE147AE147BLL;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269329928);
    sub_2487CD710();
    uint64_t v49 = (uint64_t)v64;
    sub_2487CE480();
    sub_2487CD5F4(v39, v41, v43 & 1);
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    sub_2487CE1E0();
    double v51 = v50;
    int v52 = AXDeviceIsPad();
    char v53 = v52;
    if (v52) {
      double v38 = v51 / 6.0;
    }
    uint64_t v54 = (uint64_t)v62;
    sub_2487C4A60(v49, (uint64_t)v62, &qword_269329918);
    uint64_t v55 = v63;
    *long long v63 = v16;
    *((unsigned char *)v55 + 8) = v60 ^ 1;
    uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329988);
    sub_2487C4A60(v54, (uint64_t)v55 + *(int *)(v56 + 48), &qword_269329918);
    uint64_t v57 = (double *)((char *)v55 + *(int *)(v56 + 64));
    *uint64_t v57 = v38;
    *((unsigned char *)v57 + 8) = v53 ^ 1;
    sub_2487C4AC4(v49, &qword_269329918);
    return (id)sub_2487C4AC4(v54, &qword_269329918);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2487CB0EC()
{
  return sub_2487CB148();
}

uint64_t sub_2487CB148()
{
  long long v5 = *(_OWORD *)(v0 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693295F8);
  sub_2487CE5C0();
  if (v6 == 1)
  {
    type metadata accessor for GazeStateManager();
    sub_2487CE0CC(&qword_269329588, (void (*)(uint64_t))type metadata accessor for GazeStateManager);
    sub_2487CE1C0();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2487CE170();
    swift_release();
    swift_release();
    swift_release();
    if (sub_2487C67C8(v5) == 0x6C616974696E69 && v1 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v2 = sub_2487CE870();
      swift_bridgeObjectRelease();
      if ((v2 & 1) == 0) {
        return sub_2487CBE90();
      }
    }
  }
  uint64_t v3 = sub_2487CE620();
  MEMORY[0x270FA5388](v3);
  sub_2487CE220();
  return swift_release();
}

uint64_t sub_2487CB338(uint64_t a1)
{
  uint64_t v2 = sub_2487CE650();
  uint64_t v20 = *(void *)(v2 - 8);
  uint64_t v21 = v2;
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2487CE3A0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GazeStateManager();
  sub_2487CE0CC(&qword_269329588, (void (*)(uint64_t))type metadata accessor for GazeStateManager);
  uint64_t v9 = sub_2487CE1C0();
  sub_2487CE3B0();
  sub_2487CE1F0();
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v18 = v9 + OBJC_IVAR____TtC16AssistiveTouchUI16GazeStateManager_frame;
  *(void *)uint64_t v18 = v11;
  *(void *)(v18 + 8) = v13;
  *(void *)(v18 + 16) = v15;
  *(void *)(v18 + 24) = v17;
  *(unsigned char *)(v18 + 32) = 0;
  swift_release();
  sub_2487CE640();
  sub_2487CE5F0();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v21);
  sub_2487CE600();
  swift_release();
  uint64_t v22 = a1;
  sub_2487CE220();
  return swift_release();
}

uint64_t sub_2487CB5D4(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269329990);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_2487C67C8(*a2) == 0x6574656C706D6F63 && v8 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v10 = sub_2487CE870();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {
      long long v22 = *(_OWORD *)(a3 + 40);
      char v21 = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2693295F8);
      sub_2487CE5D0();
      return sub_2487CB148();
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v22) = 1;
  swift_retain();
  sub_2487CE180();
  long long v22 = *(_OWORD *)(a3 + 40);
  char v21 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693295F8);
  sub_2487CE5D0();
  uint64_t v12 = sub_2487CE790();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 1, 1, v12);
  sub_2487CE770();
  sub_2487CC470(a3);
  uint64_t v13 = sub_2487CE760();
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = MEMORY[0x263F8F500];
  *(void *)(v14 + 16) = v13;
  *(void *)(v14 + 24) = v15;
  long long v16 = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(v14 + 128) = *(_OWORD *)(a3 + 96);
  *(_OWORD *)(v14 + 144) = v16;
  *(void *)(v14 + 160) = *(void *)(a3 + 128);
  long long v17 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v14 + 64) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v14 + 80) = v17;
  long long v18 = *(_OWORD *)(a3 + 80);
  *(_OWORD *)(v14 + 96) = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(v14 + 112) = v18;
  long long v19 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v14 + 32) = *(_OWORD *)a3;
  *(_OWORD *)(v14 + 48) = v19;
  sub_2487CBC1C((uint64_t)v7, (uint64_t)&unk_2693299A0, v14);
  return swift_release();
}

uint64_t sub_2487CB828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a4;
  uint64_t v5 = sub_2487CE820();
  v4[5] = v5;
  v4[6] = *(void *)(v5 - 8);
  v4[7] = swift_task_alloc();
  sub_2487CE770();
  unsigned char v4[8] = sub_2487CE760();
  uint64_t v7 = sub_2487CE750();
  v4[9] = v7;
  v4[10] = v6;
  return MEMORY[0x270FA2498](sub_2487CB91C, v7, v6);
}

uint64_t sub_2487CB91C()
{
  sub_2487CE810();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_2693299B8 + dword_2693299B8);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_2487CB9E4;
  return v3(1000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_2487CB9E4()
{
  uint64_t v3 = (void *)*v1;
  uint64_t v2 = (void *)*v1;
  swift_task_dealloc();
  uint64_t v4 = v2[7];
  uint64_t v5 = v2[6];
  uint64_t v6 = v2[5];
  if (v0)
  {

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v7 = v3[9];
    uint64_t v8 = v3[10];
    uint64_t v9 = sub_2487CE12C;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v7 = v3[9];
    uint64_t v8 = v3[10];
    uint64_t v9 = sub_2487CBB78;
  }
  return MEMORY[0x270FA2498](v9, v7, v8);
}

uint64_t sub_2487CBB78()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_release();
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v1 + 88);
  *(unsigned char *)(v0 + 96) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2693295F8);
  sub_2487CE5D0();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_2487CBC1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2487CE790();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2487CE780();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2487C4AC4(a1, &qword_269329990);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2487CE750();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2487CBDC8(uint64_t a1)
{
  uint64_t v2 = sub_2487CE250();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_2487CE2B0();
}

uint64_t sub_2487CBE90()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2487CE3D0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_2487CE650();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2487CE640();
  sub_2487CE5F0();
  (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
  sub_2487CE600();
  swift_release();
  uint64_t v17 = v1;
  uint64_t v10 = swift_allocObject();
  long long v11 = *(_OWORD *)(v1 + 112);
  *(_OWORD *)(v10 + 112) = *(_OWORD *)(v1 + 96);
  *(_OWORD *)(v10 + 128) = v11;
  *(void *)(v10 + 144) = *(void *)(v1 + 128);
  long long v12 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v10 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v10 + 64) = v12;
  long long v13 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v10 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v10 + 96) = v13;
  long long v14 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v10 + 32) = v14;
  sub_2487CC470(v1);
  sub_2487CE3C0();
  sub_2487CE210();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_2487CC0D8()
{
  return swift_release();
}

uint64_t sub_2487CC338()
{
  return swift_release();
}

uint64_t sub_2487CC410@<X0>(uint64_t a1@<X8>)
{
  return sub_2487C990C(a1);
}

uint64_t sub_2487CC468@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2487C9B70(a1, v2 + 16, a2);
}

uint64_t sub_2487CC470(uint64_t a1)
{
  return a1;
}

unint64_t sub_2487CC51C()
{
  unint64_t result = qword_269329848;
  if (!qword_269329848)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269329840);
    sub_2487C47A4(&qword_269329850, &qword_269329858);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269329848);
  }
  return result;
}

uint64_t sub_2487CC5BC()
{
  return sub_2487CE2A0();
}

uint64_t sub_2487CC5E4()
{
  if (AXDeviceIsPad()) {
    uint64_t result = sub_2487CE3F0();
  }
  else {
    uint64_t result = sub_2487CE400();
  }
  qword_2693297F8 = result;
  return result;
}

uint64_t sub_2487CC614@<X0>(unsigned char *a1@<X8>)
{
  return sub_2487CC7DC(a1);
}

uint64_t sub_2487CC628@<X0>(unsigned char *a1@<X8>)
{
  return sub_2487CC7DC(a1);
}

uint64_t sub_2487CC650(char *a1)
{
  return sub_2487C6CF0(*a1);
}

uint64_t sub_2487CC678(char *a1)
{
  return sub_2487C6CF0(*a1);
}

__n128 sub_2487CC6A0@<Q0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2487CE170();
  swift_release();
  swift_release();
  __n128 result = v4;
  *(void *)a1 = v3;
  *(__n128 *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_2487CC72C()
{
  return sub_2487CE180();
}

uint64_t sub_2487CC7C0()
{
  return sub_2487CB0EC();
}

uint64_t sub_2487CC7C8@<X0>(unsigned char *a1@<X8>)
{
  return sub_2487CC7DC(a1);
}

uint64_t sub_2487CC7DC@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2487CE170();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2487CC858()
{
  return sub_2487CE180();
}

double sub_2487CC8CC@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2487CE170();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_2487CC94C()
{
  return sub_2487CE180();
}

uint64_t sub_2487CC9C8@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2487CE170();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2487CCA48()
{
  return sub_2487CE180();
}

uint64_t sub_2487CCABC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  __n128 v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *__n128 v4 = v2;
  v4[1] = sub_2487CCB98;
  return v6(a1);
}

uint64_t sub_2487CCB98()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2487CCC90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 56) = v5;
  uint64_t v12 = sub_2487CE800();
  *(void *)(v6 + 64) = v12;
  *(void *)(v6 + 72) = *(void *)(v12 - 8);
  *(void *)(v6 + 80) = swift_task_alloc();
  *(void *)(v6 + 88) = swift_task_alloc();
  *(void *)(v6 + 40) = a1;
  *(void *)(v6 + 48) = a2;
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  *(unsigned char *)(v6 + 32) = a5 & 1;
  return MEMORY[0x270FA2498](sub_2487CCD94, 0, 0);
}

uint64_t sub_2487CCD94()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[8];
  uint64_t v3 = v0[9];
  uint64_t v4 = sub_2487CE820();
  uint64_t v5 = sub_2487CE0CC(&qword_2693299C0, MEMORY[0x263F8F710]);
  sub_2487CE880();
  sub_2487CE0CC(&qword_2693299C8, MEMORY[0x263F8F6D8]);
  sub_2487CE830();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v6;
  v0[13] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v6(v1, v2);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[14] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_2487CCF34;
  uint64_t v8 = v0[11];
  return MEMORY[0x270FA2380](v8, v0 + 2, v4, v5);
}

uint64_t sub_2487CCF34()
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 64);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2487CD0F0, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_2487CD0F0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_2487CD15C()
{
  uint64_t v1 = sub_2487CE200();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 152) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  sub_2487C920C();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2487CD264()
{
  sub_2487CE200();
  return sub_2487CB338(v0 + 16);
}

uint64_t sub_2487CD2CC(uint64_t a1, char *a2)
{
  return sub_2487CB5D4(a1, a2, v2 + 16);
}

uint64_t sub_2487CD2D4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_2487CD350()
{
  unint64_t result = qword_2693298C0;
  if (!qword_2693298C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2693298C8);
    sub_2487CD2D4(&qword_2693298D0, &qword_2693298D8, (void (*)(void))sub_2487CD3F8);
    sub_2487CD44C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693298C0);
  }
  return result;
}

unint64_t sub_2487CD3F8()
{
  unint64_t result = qword_2693298E0;
  if (!qword_2693298E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693298E0);
  }
  return result;
}

unint64_t sub_2487CD44C()
{
  unint64_t result = qword_2693298E8;
  if (!qword_2693298E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693298E8);
  }
  return result;
}

void *sub_2487CD4A0(void *a1)
{
  uint64_t v2 = (void *)a1[2];
  uint64_t v3 = a1[21];
  uint64_t v5 = a1[23];
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  sub_2487CD558(v3);
  sub_2487CD558(v5);
  return a1;
}

uint64_t sub_2487CD558(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_2487CD56C(uint64_t a1, unsigned char *a2)
{
  if (*a2 == 1) {
    return (*(uint64_t (**)(void))(v2 + 136))();
  }
  return result;
}

unint64_t sub_2487CD5A0()
{
  unint64_t result = qword_269329920;
  if (!qword_269329920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269329920);
  }
  return result;
}

uint64_t sub_2487CD5F4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2487CD604@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_2487CE320();
  *a1 = result;
  return result;
}

uint64_t sub_2487CD630()
{
  return sub_2487CE330();
}

uint64_t sub_2487CD658@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_2487CE340();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_2487CD68C()
{
  return sub_2487CE350();
}

uint64_t sub_2487CD6BC@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_2487CE2E0();
  *a1 = v3;
  return result;
}

uint64_t sub_2487CD6E8()
{
  return sub_2487CE2F0();
}

unint64_t sub_2487CD710()
{
  unint64_t result = qword_269329930;
  if (!qword_269329930)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269329928);
    sub_2487CD7B0();
    sub_2487C47A4(&qword_269329978, &qword_269329980);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269329930);
  }
  return result;
}

unint64_t sub_2487CD7B0()
{
  unint64_t result = qword_269329938;
  if (!qword_269329938)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269329940);
    sub_2487CD850();
    sub_2487C47A4(&qword_269329968, &qword_269329970);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269329938);
  }
  return result;
}

unint64_t sub_2487CD850()
{
  unint64_t result = qword_269329948;
  if (!qword_269329948)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269329950);
    sub_2487C47A4(&qword_269329958, &qword_269329960);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269329948);
  }
  return result;
}

uint64_t sub_2487CD8F8()
{
  swift_unknownObjectRelease();
  swift_release();
  sub_2487C920C();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 168, 7);
}

uint64_t sub_2487CD974(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  void *v6 = v2;
  v6[1] = sub_2487CDA28;
  return sub_2487CB828(a1, v4, v5, v1 + 32);
}

uint64_t sub_2487CDA28()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2487CDB1C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2487CDB54(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2487CDA28;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_2693299A8 + dword_2693299A8);
  return v6(a1, v4);
}

uint64_t sub_2487CDC0C()
{
  return sub_2487CE5D0();
}

uint64_t objectdestroyTm_0()
{
  swift_release();
  sub_2487C920C();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return MEMORY[0x270FA0238](v0, 152, 7);
}

uint64_t sub_2487CDCE0()
{
  return sub_2487CC0D8();
}

uint64_t sub_2487CDCE8@<X0>(unsigned char *a1@<X8>)
{
  return sub_2487CC7DC(a1);
}

uint64_t sub_2487CDD1C()
{
  return sub_2487CC338();
}

uint64_t sub_2487CDD38()
{
  return sub_2487CE5D0();
}

uint64_t sub_2487CDD90@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  type metadata accessor for CalibrationViewDelegate();
  sub_2487CE0CC(&qword_2693299D0, (void (*)(uint64_t))type metadata accessor for CalibrationViewDelegate);
  uint64_t v6 = sub_2487CE230();
  uint64_t v8 = v7;
  sub_2487CE5B0();
  sub_2487CE5B0();
  type metadata accessor for UIDeviceOrientation(0);
  sub_2487CE5B0();
  sub_2487CE5B0();
  uint64_t result = sub_2487CE5B0();
  *(void *)a5 = v6;
  *(void *)(a5 + 8) = v8;
  *(void *)(a5 + 16) = a1;
  *(void *)(a5 + 24) = a2;
  *(unsigned char *)(a5 + 32) = 0;
  *(_DWORD *)(a5 + 33) = v14;
  *(_DWORD *)(a5 + 36) = *(_DWORD *)((char *)&v14 + 3);
  *(unsigned char *)(a5 + 40) = v14;
  *(_DWORD *)(a5 + 41) = 1;
  *(_DWORD *)(a5 + 44) = 0;
  *(void *)(a5 + 48) = v15;
  *(void *)(a5 + 56) = v14;
  *(void *)(a5 + 64) = v15;
  *(void *)(a5 + 72) = v14;
  *(void *)(a5 + 80) = v15;
  *(unsigned char *)(a5 + 88) = v14;
  *(_DWORD *)(a5 + 92) = *(_DWORD *)&v17[3];
  *(_DWORD *)(a5 + 89) = *(_DWORD *)v17;
  *(void *)(a5 + 96) = v15;
  *(unsigned char *)(a5 + 104) = v14;
  *(_DWORD *)(a5 + 105) = *(_DWORD *)v16;
  *(_DWORD *)(a5 + 108) = *(_DWORD *)&v16[3];
  *(void *)(a5 + 112) = v15;
  *(void *)(a5 + 120) = a3;
  *(void *)(a5 + 128) = a4;
  return result;
}

unint64_t sub_2487CDF80()
{
  unint64_t result = qword_2693299D8;
  if (!qword_2693299D8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269329860);
    sub_2487CE020();
    sub_2487C47A4((unint64_t *)&unk_2693299F0, &qword_269329868);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693299D8);
  }
  return result;
}

unint64_t sub_2487CE020()
{
  unint64_t result = qword_2693299E0;
  if (!qword_2693299E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269329838);
    sub_2487CC51C();
    sub_2487CE0CC(&qword_2693299E8, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2693299E0);
  }
  return result;
}

uint64_t sub_2487CE0CC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2487CE114()
{
  return sub_2487CDD1C();
}

uint64_t sub_2487CE130()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_2487CE140()
{
  return MEMORY[0x270EE3C20]();
}

uint64_t sub_2487CE150()
{
  return MEMORY[0x270EE3DA8]();
}

uint64_t sub_2487CE160()
{
  return MEMORY[0x270EE3DB0]();
}

uint64_t sub_2487CE170()
{
  return MEMORY[0x270EE3DD8]();
}

uint64_t sub_2487CE180()
{
  return MEMORY[0x270EE3DE0]();
}

uint64_t sub_2487CE190()
{
  return MEMORY[0x270EE3DF0]();
}

uint64_t sub_2487CE1A0()
{
  return MEMORY[0x270EE4008]();
}

uint64_t sub_2487CE1B0()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_2487CE1C0()
{
  return MEMORY[0x270EFF108]();
}

uint64_t sub_2487CE1D0()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_2487CE1E0()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_2487CE1F0()
{
  return MEMORY[0x270EFF6E8]();
}

uint64_t sub_2487CE200()
{
  return MEMORY[0x270EFF6F8]();
}

uint64_t sub_2487CE210()
{
  return MEMORY[0x270EFF930]();
}

uint64_t sub_2487CE220()
{
  return MEMORY[0x270EFF940]();
}

uint64_t sub_2487CE230()
{
  return MEMORY[0x270EFFB80]();
}

uint64_t sub_2487CE240()
{
  return MEMORY[0x270EFFD88]();
}

uint64_t sub_2487CE250()
{
  return MEMORY[0x270F00058]();
}

uint64_t sub_2487CE260()
{
  return MEMORY[0x270F00220]();
}

uint64_t sub_2487CE270()
{
  return MEMORY[0x270F00670]();
}

uint64_t sub_2487CE280()
{
  return MEMORY[0x270F00780]();
}

uint64_t sub_2487CE290()
{
  return MEMORY[0x270F007E0]();
}

uint64_t sub_2487CE2A0()
{
  return MEMORY[0x270F00A50]();
}

uint64_t sub_2487CE2B0()
{
  return MEMORY[0x270F00A58]();
}

uint64_t sub_2487CE2C0()
{
  return MEMORY[0x270F00AF0]();
}

uint64_t sub_2487CE2D0()
{
  return MEMORY[0x270F00AF8]();
}

uint64_t sub_2487CE2E0()
{
  return MEMORY[0x270F00B78]();
}

uint64_t sub_2487CE2F0()
{
  return MEMORY[0x270F00B80]();
}

uint64_t sub_2487CE300()
{
  return MEMORY[0x270F00BE0]();
}

uint64_t sub_2487CE310()
{
  return MEMORY[0x270F00BE8]();
}

uint64_t sub_2487CE320()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_2487CE330()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_2487CE340()
{
  return MEMORY[0x270F00E88]();
}

uint64_t sub_2487CE350()
{
  return MEMORY[0x270F00E98]();
}

uint64_t sub_2487CE360()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_2487CE370()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_2487CE380()
{
  return MEMORY[0x270F01608]();
}

uint64_t sub_2487CE390()
{
  return MEMORY[0x270F01610]();
}

uint64_t sub_2487CE3A0()
{
  return MEMORY[0x270F01B78]();
}

uint64_t sub_2487CE3B0()
{
  return MEMORY[0x270F01F98]();
}

uint64_t sub_2487CE3C0()
{
  return MEMORY[0x270F02490]();
}

uint64_t sub_2487CE3D0()
{
  return MEMORY[0x270F024A8]();
}

uint64_t sub_2487CE3E0()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_2487CE3F0()
{
  return MEMORY[0x270F02AD0]();
}

uint64_t sub_2487CE400()
{
  return MEMORY[0x270F02B90]();
}

uint64_t sub_2487CE410()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_2487CE420()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_2487CE430()
{
  return MEMORY[0x270F03148]();
}

uint64_t sub_2487CE440()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_2487CE450()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_2487CE460()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_2487CE470()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_2487CE480()
{
  return MEMORY[0x270F03B00]();
}

uint64_t sub_2487CE490()
{
  return MEMORY[0x270F04188]();
}

uint64_t sub_2487CE4A0()
{
  return MEMORY[0x270F043A8]();
}

uint64_t sub_2487CE4B0()
{
  return MEMORY[0x270F043E8]();
}

uint64_t sub_2487CE4C0()
{
  return MEMORY[0x270F043F8]();
}

uint64_t sub_2487CE4D0()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_2487CE4E0()
{
  return MEMORY[0x270F04438]();
}

uint64_t sub_2487CE4F0()
{
  return MEMORY[0x270F04450]();
}

uint64_t sub_2487CE500()
{
  return MEMORY[0x270F04460]();
}

uint64_t sub_2487CE510()
{
  return MEMORY[0x270F04488]();
}

uint64_t sub_2487CE520()
{
  return MEMORY[0x270F04498]();
}

uint64_t sub_2487CE530()
{
  return MEMORY[0x270F044A8]();
}

uint64_t sub_2487CE540()
{
  return MEMORY[0x270F044C0]();
}

uint64_t sub_2487CE550()
{
  return MEMORY[0x270F044C8]();
}

uint64_t sub_2487CE560()
{
  return MEMORY[0x270F044D8]();
}

uint64_t sub_2487CE570()
{
  return MEMORY[0x270F04580]();
}

uint64_t sub_2487CE580()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_2487CE590()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_2487CE5A0()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_2487CE5B0()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_2487CE5C0()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_2487CE5D0()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_2487CE5E0()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_2487CE5F0()
{
  return MEMORY[0x270F050B0]();
}

uint64_t sub_2487CE600()
{
  return MEMORY[0x270F050E8]();
}

uint64_t sub_2487CE610()
{
  return MEMORY[0x270F05140]();
}

uint64_t sub_2487CE620()
{
  return MEMORY[0x270F05170]();
}

uint64_t sub_2487CE630()
{
  return MEMORY[0x270F05198]();
}

uint64_t sub_2487CE640()
{
  return MEMORY[0x270F05350]();
}

uint64_t sub_2487CE650()
{
  return MEMORY[0x270F05358]();
}

uint64_t sub_2487CE660()
{
  return MEMORY[0x270F053C8]();
}

uint64_t sub_2487CE670()
{
  return MEMORY[0x270F05490]();
}

uint64_t sub_2487CE680()
{
  return MEMORY[0x270F05498]();
}

uint64_t sub_2487CE690()
{
  return MEMORY[0x270F054A0]();
}

uint64_t sub_2487CE6A0()
{
  return MEMORY[0x270F054A8]();
}

uint64_t sub_2487CE6B0()
{
  return MEMORY[0x270F054B0]();
}

uint64_t sub_2487CE6C0()
{
  return MEMORY[0x270F054B8]();
}

uint64_t sub_2487CE6D0()
{
  return MEMORY[0x270FA09A8]();
}

uint64_t sub_2487CE6E0()
{
  return MEMORY[0x270FA09E8]();
}

uint64_t sub_2487CE6F0()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2487CE700()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2487CE710()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2487CE720()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2487CE730()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2487CE740()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2487CE750()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2487CE760()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_2487CE770()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_2487CE780()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2487CE790()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2487CE7A0()
{
  return MEMORY[0x270F09E20]();
}

uint64_t sub_2487CE7B0()
{
  return MEMORY[0x270F09E30]();
}

uint64_t sub_2487CE7C0()
{
  return MEMORY[0x270F09EC8]();
}

uint64_t sub_2487CE7D0()
{
  return MEMORY[0x270FA0D70]();
}

uint64_t sub_2487CE7E0()
{
  return MEMORY[0x270FA0DA0]();
}

uint64_t sub_2487CE7F0()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2487CE800()
{
  return MEMORY[0x270FA21A0]();
}

uint64_t sub_2487CE810()
{
  return MEMORY[0x270FA21A8]();
}

uint64_t sub_2487CE820()
{
  return MEMORY[0x270FA21B0]();
}

uint64_t sub_2487CE830()
{
  return MEMORY[0x270F9ECD8]();
}

uint64_t sub_2487CE840()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2487CE850()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_2487CE860()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2487CE870()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2487CE880()
{
  return MEMORY[0x270FA2378]();
}

uint64_t sub_2487CE8A0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2487CE8B0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AXAssistiveTouchBundle()
{
  return MEMORY[0x270F09D30]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x270F091E0]();
}

uint64_t AXDeviceIsPhone()
{
  return MEMORY[0x270F091E8]();
}

uint64_t AXSCalibrationStrategyName()
{
  return MEMORY[0x270F09530]();
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
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
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int sgetrf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE7D0](__m, __n, __a, __lda, __ipiv, __info);
}

int sgetri_(__CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE7E0](__n, __a, __lda, __ipiv, __work, __lwork, __info);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
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

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
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

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x270FA2458]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x270FA2460]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

void vDSP_mmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N, vDSP_Length __P)
{
}

void vDSP_mtrans(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N)
{
}