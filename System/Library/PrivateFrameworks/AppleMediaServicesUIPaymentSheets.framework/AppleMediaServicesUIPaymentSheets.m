uint64_t initializeBufferWithCopyOfBuffer for AlternativeDistributionMessageView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AlternativeDistributionMessageView(id *a1)
{
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for AlternativeDistributionMessageView(void *a1, uint64_t a2)
{
  v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  id v6 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AlternativeDistributionMessageView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for AlternativeDistributionMessageView(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = a2[3];
  return a1;
}

uint64_t getEnumTagSinglePayload for AlternativeDistributionMessageView(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AlternativeDistributionMessageView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AlternativeDistributionMessageView()
{
  return &type metadata for AlternativeDistributionMessageView;
}

uint64_t sub_23CAC8DB8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23CAC8DD4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  *(void *)a4 = sub_23CAE4EA0();
  *(void *)(a4 + 8) = 0;
  *(unsigned char *)(a4 + 16) = 1;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8278);
  return sub_23CAC8E4C(a1, a2, a3, a4 + *(int *)(v10 + 44), a5);
}

uint64_t sub_23CAC8E4C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t v98 = a2;
  uint64_t v99 = a3;
  uint64_t v101 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8280);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v100 = (uint64_t)&v85 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8288) - 8;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v89 = (uint64_t)&v85 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23CAE4D10() - 8;
  uint64_t v90 = v9;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v11 = (double *)((char *)&v85 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8290);
  ((void (*)(void))MEMORY[0x270FA5388])();
  v13 = (char *)&v85 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8298) - 8;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v16 = (uint64_t *)((char *)&v85 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC82A0) - 8;
  ((void (*)(void))MEMORY[0x270FA5388])();
  v91 = (char *)&v85 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC82A8) - 8;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v93 = (uint64_t)&v85 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC82B0) - 8;
  uint64_t v19 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v95 = (uint64_t)&v85 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v102 = (uint64_t)&v85 - v21;
  id v22 = a1;
  uint64_t v23 = sub_23CAE5240();
  v24 = (char *)v11 + *(int *)(v9 + 28);
  unsigned int v87 = *MEMORY[0x263F19860];
  uint64_t v25 = v87;
  uint64_t v26 = sub_23CAE4E60();
  uint64_t v27 = *(void *)(v26 - 8);
  v86 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 104);
  uint64_t v88 = v27 + 104;
  v86(v24, v25, v26);
  double *v11 = a5;
  v11[1] = a5;
  id v28 = objc_msgSend(self, sel_systemGrayColor);
  uint64_t v29 = MEMORY[0x23ECF0E30](v28);
  sub_23CAE4C80();
  sub_23CAC9908((uint64_t)v11, (uint64_t)v13);
  v30 = &v13[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BC82B8) + 36)];
  long long v31 = v106;
  *(_OWORD *)v30 = v105;
  *((_OWORD *)v30 + 1) = v31;
  *((void *)v30 + 4) = v107;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC82C0);
  *(void *)&v13[*(int *)(v32 + 52)] = v29;
  *(_WORD *)&v13[*(int *)(v32 + 56)] = 256;
  uint64_t v33 = sub_23CAE5340();
  uint64_t v35 = v34;
  v36 = (uint64_t *)&v13[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BC82C8) + 36)];
  uint64_t *v36 = v33;
  v36[1] = v35;
  sub_23CAC996C((uint64_t)v11);
  uint64_t v37 = sub_23CAE5340();
  uint64_t v39 = v38;
  uint64_t v40 = v89;
  sub_23CAC9ABC((uint64_t)v13, v89, &qword_268BC8290);
  v41 = (uint64_t *)(v40 + *(int *)(v96 + 44));
  uint64_t *v41 = v37;
  v41[1] = v39;
  sub_23CAC9ABC(v40, (uint64_t)v16 + *(int *)(v14 + 44), &qword_268BC8288);
  uint64_t *v16 = v23;
  swift_retain();
  sub_23CAC9B30(v40, &qword_268BC8288);
  sub_23CAC9B30((uint64_t)v13, &qword_268BC8290);
  swift_release();
  v86((char *)v11 + *(int *)(v90 + 28), v87, v26);
  double *v11 = a5;
  v11[1] = a5;
  uint64_t v42 = (uint64_t)v91;
  uint64_t v43 = (uint64_t)&v91[*(int *)(v92 + 44)];
  sub_23CAC9908((uint64_t)v11, v43);
  *(_WORD *)(v43 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EBC0) + 36)) = 256;
  sub_23CAC9ABC((uint64_t)v16, v42, &qword_268BC8298);
  sub_23CAC996C((uint64_t)v11);
  sub_23CAC9B30((uint64_t)v16, &qword_268BC8298);
  LOBYTE(v43) = sub_23CAE4F30();
  sub_23CAE4C50();
  uint64_t v45 = v44;
  uint64_t v47 = v46;
  uint64_t v49 = v48;
  uint64_t v51 = v50;
  uint64_t v52 = v93;
  sub_23CAC9ABC(v42, v93, &qword_268BC82A0);
  uint64_t v53 = v52 + *(int *)(v94 + 44);
  *(unsigned char *)uint64_t v53 = v43;
  *(void *)(v53 + 8) = v45;
  *(void *)(v53 + 16) = v47;
  *(void *)(v53 + 24) = v49;
  *(void *)(v53 + 32) = v51;
  *(unsigned char *)(v53 + 40) = 0;
  sub_23CAC9B30(v42, &qword_268BC82A0);
  LOBYTE(v43) = sub_23CAE4F40();
  sub_23CAE4C50();
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  uint64_t v59 = v58;
  uint64_t v61 = v60;
  uint64_t v62 = v95;
  sub_23CAC9ABC(v52, v95, &qword_268BC82A8);
  uint64_t v63 = v62 + *(int *)(v97 + 44);
  *(unsigned char *)uint64_t v63 = v43;
  *(void *)(v63 + 8) = v55;
  *(void *)(v63 + 16) = v57;
  *(void *)(v63 + 24) = v59;
  *(void *)(v63 + 32) = v61;
  *(unsigned char *)(v63 + 40) = 0;
  sub_23CAC9B30(v52, &qword_268BC82A8);
  sub_23CAC99C8(v62, v102);
  uint64_t v103 = v98;
  uint64_t v104 = v99;
  sub_23CAC9A30();
  swift_bridgeObjectRetain();
  uint64_t v64 = sub_23CAE5130();
  uint64_t v66 = v65;
  LOBYTE(v16) = v67 & 1;
  sub_23CAE4FD0();
  uint64_t v68 = sub_23CAE4FA0();
  uint64_t v69 = v100;
  __swift_storeEnumTagSinglePayload(v100, 1, 1, v68);
  sub_23CAE4FF0();
  sub_23CAC9B30(v69, &qword_268BC8280);
  uint64_t v70 = sub_23CAE5100();
  uint64_t v72 = v71;
  LOBYTE(v23) = v73;
  swift_release();
  sub_23CAC9AA4(v64, v66, (char)v16);
  swift_bridgeObjectRelease();
  sub_23CAE4FD0();
  uint64_t v74 = sub_23CAE5040();
  uint64_t v76 = v75;
  uint64_t v78 = v77;
  LOBYTE(v16) = v79 & 1;
  sub_23CAC9AA4(v70, v72, v23 & 1);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v81 = v102;
  sub_23CAC9ABC(v102, v62, &qword_268BC82B0);
  uint64_t v82 = v101;
  sub_23CAC9ABC(v62, v101, &qword_268BC82B0);
  uint64_t v83 = v82 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BC82D0) + 48);
  *(void *)uint64_t v83 = v74;
  *(void *)(v83 + 8) = v76;
  *(unsigned char *)(v83 + 16) = (_BYTE)v16;
  *(void *)(v83 + 24) = v78;
  *(void *)(v83 + 32) = KeyPath;
  *(unsigned char *)(v83 + 40) = 1;
  sub_23CAC9B20(v74, v76, (char)v16);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23CAC9B30(v81, &qword_268BC82B0);
  sub_23CAC9AA4(v74, v76, (char)v16);
  swift_release();
  swift_bridgeObjectRelease();
  return sub_23CAC9B30(v62, &qword_268BC82B0);
}

uint64_t sub_23CAC9688()
{
  return sub_23CAE51A0();
}

uint64_t sub_23CAC96A4@<X0>(uint64_t a1@<X8>)
{
  return sub_23CAC8DD4(*(void **)v1, *(void *)(v1 + 8), *(void *)(v1 + 16), a1, *(double *)(v1 + 24));
}

uint64_t sub_23CAC96B4()
{
  return sub_23CAC9D44(*v0, MEMORY[0x263F07B58]);
}

uint64_t sub_23CAC96EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23CAC9E7C();
  *a1 = result;
  return result;
}

uint64_t sub_23CAC9714()
{
  return sub_23CAC9D44(*v0, MEMORY[0x263F8D308]);
}

uint64_t sub_23CAC9744()
{
  return sub_23CAC9870();
}

uint64_t sub_23CAC974C()
{
  return sub_23CACD9CC();
}

uint64_t sub_23CAC9754()
{
  return sub_23CACDA40();
}

uint64_t sub_23CAC9760@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_23CAE5430();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_23CAC97A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23CAC97D4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23CAC97D8(uint64_t a1)
{
  uint64_t v2 = sub_23CAC9CCC((unint64_t *)&qword_26AD6ECD0);
  uint64_t v3 = sub_23CAC9CCC(&qword_268BC8300);
  uint64_t v4 = MEMORY[0x263F8D320];
  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_23CAC9870()
{
  sub_23CAE5460();
  sub_23CAE5480();
  return swift_bridgeObjectRelease();
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

uint64_t sub_23CAC9908(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23CAE4D10();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23CAC996C(uint64_t a1)
{
  uint64_t v2 = sub_23CAE4D10();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23CAC99C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC82B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23CAC9A30()
{
  unint64_t result = qword_26AD6EC78;
  if (!qword_26AD6EC78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD6EC78);
  }
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_23CAC9AA4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_23CAC9ABC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23CAC9B20(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_23CAC9B30(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
}

void type metadata accessor for Key(uint64_t a1)
{
}

unint64_t sub_23CAC9BC8()
{
  unint64_t result = qword_268BC82E0;
  if (!qword_268BC82E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC82E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC82E0);
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

uint64_t sub_23CAC9C64()
{
  return sub_23CAC9CCC(&qword_268BC82F0);
}

uint64_t sub_23CAC9C98()
{
  return sub_23CAC9CCC(&qword_268BC82F8);
}

uint64_t sub_23CAC9CCC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Key(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23CAC9D10()
{
  return sub_23CAC9CCC(&qword_26AD6ECD8);
}

uint64_t sub_23CAC9D44(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = sub_23CAE5460();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_23CAC9D84(uint64_t a1, id *a2)
{
  uint64_t result = sub_23CAE5440();
  *a2 = 0;
  return result;
}

uint64_t sub_23CAC9DFC(uint64_t a1, id *a2)
{
  char v3 = sub_23CAE5450();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_23CAC9E7C()
{
  sub_23CAE5460();
  uint64_t v0 = sub_23CAE5430();
  swift_bridgeObjectRelease();
  return v0;
}

void type metadata accessor for CGImage(uint64_t a1)
{
}

uint64_t getEnumTagSinglePayload for IconAdornmentMerchandizedIAPViewModifier(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for IconAdornmentMerchandizedIAPViewModifier(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
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

void sub_23CAC9F24(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

id sub_23CAC9F74(uint64_t a1)
{
  return sub_23CAC9FC4(a1, 0x656C746974, 0xE500000000000000, 0x6F6349656C746974, 0xE90000000000006ELL);
}

id sub_23CAC9FA0(uint64_t a1)
{
  return sub_23CAC9FC4(a1, 0x6567617373656DLL, 0xE700000000000000, 1852793705, 0xE400000000000000);
}

id sub_23CAC9FC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1)
  {
    sub_23CACBF9C(a2, a3, a1, &v16);
    if (*((void *)&v17 + 1))
    {
      OUTLINED_FUNCTION_0();
      goto LABEL_6;
    }
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }
  sub_23CACA184((uint64_t)&v16);
  if (!a1)
  {
    long long v16 = 0u;
    long long v17 = 0u;
LABEL_10:
    sub_23CACA184((uint64_t)&v16);
    if (!a1)
    {
      uint64_t v8 = 0;
      long long v16 = 0u;
      long long v17 = 0u;
      unint64_t v9 = 0xC000000000000000;
      goto LABEL_16;
    }
    goto LABEL_11;
  }
LABEL_6:
  sub_23CACBF9C(a4, a5, a1, &v16);
  if (!*((void *)&v17 + 1)) {
    goto LABEL_10;
  }
  if (OUTLINED_FUNCTION_0())
  {
    uint64_t v8 = *(void *)&v14;
    unint64_t v9 = v15;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v8 = 0;
  unint64_t v9 = 0xC000000000000000;
LABEL_12:
  sub_23CACBF9C(0x63536E6565726373, 0xEB00000000656C61, a1, &v16);
  if (!*((void *)&v17 + 1))
  {
LABEL_16:
    sub_23CACA184((uint64_t)&v16);
    goto LABEL_17;
  }
  if (OUTLINED_FUNCTION_0())
  {
    double v10 = v14;
    goto LABEL_18;
  }
LABEL_17:
  double v10 = 1.0;
LABEL_18:
  sub_23CACA1E4();
  sub_23CACA224(v8, v9);
  id v11 = sub_23CADDA24(v8, v9, v10);
  if (!v11) {
    id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_init);
  }
  id v12 = v11;
  sub_23CACA27C(v8, v9);
  return v12;
}

uint64_t sub_23CACA184(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD6ED20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23CACA1E4()
{
  unint64_t result = qword_268BC8308;
  if (!qword_268BC8308)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268BC8308);
  }
  return result;
}

uint64_t sub_23CACA224(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_23CACA27C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for AlternativeDistributionTitleViewModel()
{
  return &type metadata for AlternativeDistributionTitleViewModel;
}

void *_s33AppleMediaServicesUIPaymentSheets39AlternativeDistributionMessageViewModelVwCP_0(void *a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  a1[2] = *(void *)(a2 + 16);
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AlternativeDistributionTitleView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AlternativeDistributionTitleView(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AlternativeDistributionTitleView(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AlternativeDistributionTitleView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AlternativeDistributionMessageViewModel()
{
  return &type metadata for AlternativeDistributionMessageViewModel;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_dynamicCast();
}

ValueMetadata *type metadata accessor for AlternativeDistributionTitleView()
{
  return &type metadata for AlternativeDistributionTitleView;
}

uint64_t sub_23CACA4BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23CACA4D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8310);
  MEMORY[0x270FA5388](v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8318);
  sub_23CACA7DC();
  sub_23CACA828();
  sub_23CAE52B0();
  sub_23CACA8C8(&qword_268BC8330, &qword_268BC8310);
  uint64_t result = sub_23CAE52F0();
  *a1 = result;
  return result;
}

uint64_t sub_23CACA628@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EBC0);
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_23CAE4D10();
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  id v11 = (_OWORD *)((char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v12 = a1;
  uint64_t v13 = sub_23CAE5240();
  double v14 = (char *)v11 + *(int *)(v9 + 28);
  uint64_t v15 = *MEMORY[0x263F19860];
  uint64_t v16 = sub_23CAE4E60();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(v14, v15, v16);
  __asm { FMOV            V0.2D, #5.0 }
  _OWORD *v11 = _Q0;
  sub_23CAC9908((uint64_t)v11, (uint64_t)v7);
  *(_WORD *)&v7[*(int *)(v5 + 44)] = 256;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8318);
  sub_23CACA90C((uint64_t)v7, (uint64_t)a2 + *(int *)(v22 + 36));
  *a2 = v13;
  swift_retain();
  sub_23CACA974((uint64_t)v7);
  sub_23CAC996C((uint64_t)v11);
  return swift_release();
}

uint64_t sub_23CACA7B8@<X0>(uint64_t *a1@<X8>)
{
  return sub_23CACA4D8(a1);
}

uint64_t sub_23CACA7C4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 32);
  *a1 = *(void *)(v1 + 24);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23CACA7D0@<X0>(uint64_t *a1@<X8>)
{
  return sub_23CACA628(*(void **)(v1 + 16), a1);
}

unint64_t sub_23CACA7DC()
{
  unint64_t result = qword_268BC8320;
  if (!qword_268BC8320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8320);
  }
  return result;
}

unint64_t sub_23CACA828()
{
  unint64_t result = qword_268BC8328;
  if (!qword_268BC8328)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC8318);
    sub_23CACA8C8((unint64_t *)&qword_26AD6EBB8, &qword_26AD6EBC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8328);
  }
  return result;
}

uint64_t sub_23CACA8C8(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_23CACA90C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EBC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23CACA974(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EBC0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23CACA9D4()
{
  return MEMORY[0x263F1B718];
}

id AMSUIPaymentSheetViewProvider.__allocating_init(context:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return AMSUIPaymentSheetViewProvider.init(context:)(a1);
}

id AMSUIPaymentSheetViewProvider.init(context:)(void *a1)
{
  uint64_t v2 = v1;
  id v3 = a1;
  uint64_t v4 = OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_context;
  *(void *)&v1[OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_context] = 0;
  uint64_t v5 = (void **)&v1[OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_request];
  v5[1] = 0;
  v5[2] = 0;
  *uint64_t v5 = 0;
  uint64_t v6 = (uint64_t *)&v1[OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_header];
  *uint64_t v6 = 0;
  v6[1] = 0;
  uint64_t v7 = (uint64_t *)&v1[OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_content];
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v8 = (uint64_t *)&v1[OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_footer];
  *uint64_t v8 = 0;
  v8[1] = 0;
  uint64_t v9 = (uint64_t *)&v1[OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_secondaryContent];
  *uint64_t v9 = 0;
  v9[1] = 0;
  uint64_t v10 = &v2[OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_secondaryFooter];
  *(void *)uint64_t v10 = 0;
  *((void *)v10 + 1) = 0;
  if (a1)
  {
    id v11 = *(void **)&v2[v4];
    *(void *)&v2[v4] = a1;
    id v12 = a1;
    uint64_t v13 = v2;

    id v3 = v12;
    double v14 = (void *)sub_23CADE258(v3);
    if (v16)
    {
      uint64_t v61 = v7;
      uint64_t v62 = v3;
      uint64_t v63 = v13;
      uint64_t v64 = v8;
      long long v17 = *v5;
      uint64_t v18 = (uint64_t)v5[1];
      uint64_t v19 = (uint64_t)v5[2];
      *uint64_t v5 = v14;
      v5[1] = v15;
      v5[2] = v16;
      uint64_t v20 = v14;
      char v21 = (char)v15;
      uint64_t v22 = (uint64_t)v16;
      id v23 = v14;
      swift_bridgeObjectRetain();
      sub_23CACAEBC(v17, v18, v19);
      id v24 = objc_msgSend(v23, sel_secondarySalableInfo);
      if (!v24)
      {
LABEL_13:
        type metadata accessor for HeaderViewProvider();
        uint64_t v40 = (void *)OUTLINED_FUNCTION_6();
        uint64_t v43 = sub_23CAE37A4(v40, v41, v42);
        uint64_t v45 = v44;
        OUTLINED_FUNCTION_4();
        uint64_t v46 = *v6;
        *uint64_t v6 = (uint64_t)v43;
        v6[1] = v45;
        sub_23CACB934(v46);
        type metadata accessor for ContentViewProvider();
        uint64_t v47 = (void *)OUTLINED_FUNCTION_6();
        uint64_t v50 = sub_23CAE3278(v47, v48, v49);
        uint64_t v52 = v51;
        OUTLINED_FUNCTION_4();
        uint64_t v53 = *v61;
        *uint64_t v61 = (uint64_t)v50;
        v61[1] = v52;
        sub_23CACB934(v53);
        type metadata accessor for FooterViewProvider();
        id v3 = v62;
        uint64_t v54 = sub_23CAE39BC(v20);
        uint64_t v56 = v55;

        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_4();
        uint64_t v57 = *v64;
        *uint64_t v64 = (uint64_t)v54;
        v64[1] = v56;
        sub_23CACB934(v57);

        goto LABEL_14;
      }
      uint64_t v25 = v24;
      uint64_t v60 = v22;
      uint64_t v26 = v23;
      uint64_t v27 = v20;
      id v28 = v26;
      id v29 = objc_msgSend(v26, sel_salableInfo);

      if (v29)
      {
        id v30 = v25;
        long long v31 = v25;
        if (v20)
        {
LABEL_6:
          id v32 = objc_msgSend(v28, sel_secondaryContentItems);
          sub_23CACB9A4();
          uint64_t v33 = sub_23CAE5510();

          uint64_t v25 = v32;
          uint64_t v34 = v33;
LABEL_12:

          uint64_t v37 = swift_allocObject();
          *(void *)(v37 + 16) = v31;
          *(void *)(v37 + 24) = v27;
          uint64_t v20 = v27;
          *(unsigned char *)(v37 + 32) = v21;
          *(void *)(v37 + 40) = v60;
          *(void *)(v37 + 48) = v34;
          OUTLINED_FUNCTION_4();
          uint64_t v38 = *v9;
          *uint64_t v9 = (uint64_t)sub_23CACB994;
          v9[1] = v37;
          swift_bridgeObjectRetain();
          id v39 = v28;
          sub_23CACB934(v38);
          id v23 = v28;
          goto LABEL_13;
        }
      }
      else
      {
        long long v31 = 0;
        if (v20) {
          goto LABEL_6;
        }
      }
      uint64_t v34 = MEMORY[0x263F8EE78];
      goto LABEL_12;
    }

    type metadata accessor for Log();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8370);
    uint64_t v36 = sub_23CAE53F0();
    OUTLINED_FUNCTION_1(v36);
    *(_OWORD *)(OUTLINED_FUNCTION_3() + 16) = xmmword_23CAE6110;
    OUTLINED_FUNCTION_2();
    uint64_t v67 = MEMORY[0x263F8D310];
    OUTLINED_FUNCTION_7();
    sub_23CACA184((uint64_t)v66);
    sub_23CADCA8C();
  }
  else
  {
    type metadata accessor for Log();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8370);
    uint64_t v35 = sub_23CAE53F0();
    OUTLINED_FUNCTION_1(v35);
    *(_OWORD *)(OUTLINED_FUNCTION_3() + 16) = xmmword_23CAE6110;
    OUTLINED_FUNCTION_2();
    uint64_t v67 = MEMORY[0x263F8D310];
    OUTLINED_FUNCTION_7();
    sub_23CACA184((uint64_t)v66);
    sub_23CADCA8C();
  }
  swift_bridgeObjectRelease();
LABEL_14:
  v65.receiver = v2;
  v65.super_class = (Class)type metadata accessor for AMSUIPaymentSheetViewProvider();
  id v58 = objc_msgSendSuper2(&v65, sel_init);

  return v58;
}

uint64_t type metadata accessor for AMSUIPaymentSheetViewProvider()
{
  return self;
}

void sub_23CACAEBC(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_23CACAF00(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  sub_23CADE494(a2, a3, a4);
  sub_23CACBE2C();
  swift_bridgeObjectRetain();
  return sub_23CAE52F0();
}

uint64_t sub_23CACAF88@<X0>(uint64_t (**a1)@<X0>(uint64_t *@<X8>)@<X8>)
{
  uint64_t result = sub_23CACB088();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = v3;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    *(void *)(result + 24) = v5;
    uint64_t v6 = sub_23CACBE78;
  }
  else
  {
    uint64_t v6 = 0;
  }
  *a1 = v6;
  a1[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))result;
  return result;
}

uint64_t sub_23CACAFF8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = sub_23CACBEA0;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  sub_23CACB9E4(v1);
  return sub_23CACB094((uint64_t)v4, v3);
}

uint64_t sub_23CACB088()
{
  return sub_23CACB614(&OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_header);
}

uint64_t sub_23CACB094(uint64_t a1, uint64_t a2)
{
  return sub_23CACB678(a1, a2, &OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_header);
}

uint64_t (*sub_23CACB0A0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_23CACB0E8@<X0>(uint64_t (**a1)@<X0>(uint64_t *@<X8>)@<X8>)
{
  uint64_t result = sub_23CACB1E8();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = v3;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    *(void *)(result + 24) = v5;
    uint64_t v6 = sub_23CACBE78;
  }
  else
  {
    uint64_t v6 = 0;
  }
  *a1 = v6;
  a1[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))result;
  return result;
}

uint64_t sub_23CACB158(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = sub_23CACBEA0;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  sub_23CACB9E4(v1);
  return sub_23CACB1F4((uint64_t)v4, v3);
}

uint64_t sub_23CACB1E8()
{
  return sub_23CACB614(&OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_content);
}

uint64_t sub_23CACB1F4(uint64_t a1, uint64_t a2)
{
  return sub_23CACB678(a1, a2, &OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_content);
}

uint64_t (*sub_23CACB200())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_23CACB248@<X0>(uint64_t (**a1)@<X0>(uint64_t *@<X8>)@<X8>)
{
  uint64_t result = sub_23CACB348();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = v3;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    *(void *)(result + 24) = v5;
    uint64_t v6 = sub_23CACBE78;
  }
  else
  {
    uint64_t v6 = 0;
  }
  *a1 = v6;
  a1[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))result;
  return result;
}

uint64_t sub_23CACB2B8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = sub_23CACBEA0;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  sub_23CACB9E4(v1);
  return sub_23CACB354((uint64_t)v4, v3);
}

uint64_t sub_23CACB348()
{
  return sub_23CACB614(&OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_footer);
}

uint64_t sub_23CACB354(uint64_t a1, uint64_t a2)
{
  return sub_23CACB678(a1, a2, &OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_footer);
}

uint64_t (*sub_23CACB360())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_23CACB3A8@<X0>(uint64_t (**a1)@<X0>(uint64_t *@<X8>)@<X8>)
{
  uint64_t result = sub_23CACB4A8();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = v3;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    *(void *)(result + 24) = v5;
    uint64_t v6 = sub_23CACBE78;
  }
  else
  {
    uint64_t v6 = 0;
  }
  *a1 = v6;
  a1[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))result;
  return result;
}

uint64_t sub_23CACB418(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = sub_23CACBEA0;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  sub_23CACB9E4(v1);
  return sub_23CACB4B4((uint64_t)v4, v3);
}

uint64_t sub_23CACB4A8()
{
  return sub_23CACB614(&OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_secondaryContent);
}

uint64_t sub_23CACB4B4(uint64_t a1, uint64_t a2)
{
  return sub_23CACB678(a1, a2, &OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_secondaryContent);
}

uint64_t (*sub_23CACB4C0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_23CACB508@<X0>(uint64_t (**a1)@<X0>(uint64_t *a1@<X8>)@<X8>)
{
  uint64_t result = sub_23CACB608();
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = v3;
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = v4;
    *(void *)(result + 24) = v5;
    uint64_t v6 = sub_23CACBDFC;
  }
  else
  {
    uint64_t v6 = 0;
  }
  *a1 = v6;
  a1[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))result;
  return result;
}

uint64_t sub_23CACB578(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[1];
  if (*a1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v4 = sub_23CACBDC4;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  sub_23CACB9E4(v1);
  return sub_23CACB66C((uint64_t)v4, v3);
}

uint64_t sub_23CACB608()
{
  return sub_23CACB614(&OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_secondaryFooter);
}

uint64_t sub_23CACB614(void *a1)
{
  uint64_t v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  uint64_t v3 = *v2;
  sub_23CACB9E4(*v2);
  return v3;
}

uint64_t sub_23CACB66C(uint64_t a1, uint64_t a2)
{
  return sub_23CACB678(a1, a2, &OBJC_IVAR____TtC33AppleMediaServicesUIPaymentSheets29AMSUIPaymentSheetViewProvider_secondaryFooter);
}

uint64_t sub_23CACB678(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (uint64_t *)(v3 + *a3);
  OUTLINED_FUNCTION_4();
  uint64_t v7 = *v6;
  *uint64_t v6 = a1;
  v6[1] = a2;
  return sub_23CACB934(v7);
}

uint64_t (*sub_23CACB6CC())()
{
  return j__swift_endAccess;
}

id AMSUIPaymentSheetViewProvider.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void AMSUIPaymentSheetViewProvider.init()()
{
}

id AMSUIPaymentSheetViewProvider.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMSUIPaymentSheetViewProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_23CACB858@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = AMSUIPaymentSheetViewProvider.__allocating_init(context:)(a1);
  *a2 = result;
  return result;
}

uint64_t sub_23CACB880()
{
  return sub_23CACB088();
}

uint64_t sub_23CACB8A4()
{
  return sub_23CACB1E8();
}

uint64_t sub_23CACB8C8()
{
  return sub_23CACB348();
}

uint64_t sub_23CACB8EC()
{
  return sub_23CACB4A8();
}

uint64_t sub_23CACB910()
{
  return sub_23CACB608();
}

uint64_t sub_23CACB934(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_23CACB944()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_23CACB994()
{
  return sub_23CACAF00(*(void **)(v0 + 16), *(void *)(v0 + 24), *(unsigned __int8 *)(v0 + 32), *(void *)(v0 + 40));
}

unint64_t sub_23CACB9A4()
{
  unint64_t result = qword_268BC8378;
  if (!qword_268BC8378)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268BC8378);
  }
  return result;
}

uint64_t sub_23CACB9E4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t method lookup function for AMSUIPaymentSheetViewProvider(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for AMSUIPaymentSheetViewProvider);
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.__allocating_init(context:)()
{
  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.header.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.header.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.header.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.content.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.content.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.content.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.footer.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.footer.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.footer.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.secondaryContent.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.secondaryContent.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.secondaryContent.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.secondaryFooter.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.secondaryFooter.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of AMSUIPaymentSheetViewProvider.secondaryFooter.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x130))();
}

uint64_t sub_23CACBD8C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23CACBDC4()
{
  (*(void (**)(uint64_t *__return_ptr))(v0 + 16))(&v2);
  return v2;
}

uint64_t sub_23CACBDFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

unint64_t sub_23CACBE2C()
{
  unint64_t result = qword_268BC8380;
  if (!qword_268BC8380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8380);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return sub_23CAE5360();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + a1);
  return sub_23CACB934(v3);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_7()
{
  *(void *)(v2 - 120) = v0;
  *(void *)(v2 - 112) = (v1 - 32) | 0x8000000000000000;
  return sub_23CAE53D0();
}

double sub_23CACBF9C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_23CACD198(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_23CACD210(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

double sub_23CACC000@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_23CACD26C(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_23CACD210(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_23CACC064@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = sub_23CAE5460();
  sub_23CACBF9C(v4, v5, a1, &v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v13)
  {
    sub_23CACD7A4((uint64_t)&v11, (uint64_t *)&unk_26AD6ED20);
    goto LABEL_6;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    goto LABEL_7;
  }
  uint64_t v6 = 0;
  unint64_t v7 = 0;
  switch(v10)
  {
    case 1:
      swift_bridgeObjectRelease();
      type metadata accessor for Localizations();
      OUTLINED_FUNCTION_4_0();
      sub_23CADC9B0();
      OUTLINED_FUNCTION_2_0();
      unint64_t v7 = 0xEB00000000636973;
      OUTLINED_FUNCTION_1_0();
      uint64_t v6 = 0x756D000000000000;
      break;
    case 2:
      swift_bridgeObjectRelease();
      type metadata accessor for Localizations();
      OUTLINED_FUNCTION_4_0();
      sub_23CADC9B0();
      OUTLINED_FUNCTION_2_0();
      unint64_t v7 = 0xEA00000000007377;
      OUTLINED_FUNCTION_1_0();
      uint64_t v6 = 0x656E000000000000;
      break;
    case 6:
      swift_bridgeObjectRelease();
      type metadata accessor for Localizations();
      OUTLINED_FUNCTION_4_0();
      sub_23CADC9B0();
      OUTLINED_FUNCTION_2_0();
      unint64_t v7 = 0xEC00000065646163;
      OUTLINED_FUNCTION_1_0();
      uint64_t v6 = 0x7261000000000000;
      break;
    case 7:
      swift_bridgeObjectRelease();
      type metadata accessor for Localizations();
      OUTLINED_FUNCTION_4_0();
      sub_23CADC9B0();
      OUTLINED_FUNCTION_2_0();
      unint64_t v7 = 0xED00007373656E74;
      OUTLINED_FUNCTION_1_0();
      uint64_t v6 = 0x6966000000000000;
      break;
    case 8:
      swift_bridgeObjectRelease();
      type metadata accessor for Localizations();
      OUTLINED_FUNCTION_4_0();
      sub_23CADC9B0();
      OUTLINED_FUNCTION_2_0();
      unint64_t v7 = 0xE900000000000065;
      OUTLINED_FUNCTION_1_0();
      uint64_t v6 = 0x6E6F000000000000;
      break;
    case 9:
      swift_bridgeObjectRelease();
      type metadata accessor for Localizations();
      unint64_t v7 = 0xE800000000000000;
      OUTLINED_FUNCTION_4_0();
      sub_23CADC9B0();
      OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_1_0();
      uint64_t v6 = 0x7674000000000000;
      break;
    default:
      break;
  }
LABEL_7:
  *(void *)&long long v11 = 0xD00000000000004DLL;
  *((void *)&v11 + 1) = 0x800000023CAE7880;
  uint64_t v12 = v6;
  unint64_t v13 = v7;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0x4035000000000000;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_23CACC3A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = 0xD00000000000004DLL;
  a2[1] = 0x800000023CAE7880;
  a2[2] = v6;
  a2[3] = v7;
  a2[4] = 0;
  a2[5] = 0;
  a2[6] = v8;
  a2[7] = 0x4035000000000000;
  return result;
}

uint64_t sub_23CACC3A8()
{
  sub_23CACD7F8(v0 + 16, (uint64_t)v2, &qword_26AD6EC88);
  sub_23CACD7F8((uint64_t)v2, (uint64_t)v3, &qword_26AD6EC88);
  if (v3[1])
  {
    sub_23CACC464();
    swift_bridgeObjectRetain();
    sub_23CACD13C((uint64_t)v2);
    if (sub_23CACD0C8()) {
      return sub_23CAE52A0();
    }
    sub_23CACD168((uint64_t)v2);
  }
  return 0;
}

unint64_t sub_23CACC464()
{
  unint64_t result = qword_268BC8388;
  if (!qword_268BC8388)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268BC8388);
  }
  return result;
}

uint64_t sub_23CACC4A4@<X0>(uint64_t a1@<X8>)
{
  sub_23CAE4E80();
  OUTLINED_FUNCTION_3_0();
  uint64_t v35 = v4;
  uint64_t v36 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_23CAE5270();
  OUTLINED_FUNCTION_3_0();
  uint64_t v9 = v8;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EC10);
  OUTLINED_FUNCTION_10();
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = MEMORY[0x270FA5388](v14);
  MEMORY[0x270FA5388](v17);
  char v21 = (char *)&v32 - v20;
  if (*((void *)v1 + 6))
  {
    uint64_t v32 = v19;
    uint64_t v33 = v18;
    uint64_t v34 = a1;
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v12, *MEMORY[0x263F1B4B8], v7);
    swift_retain();
    uint64_t v22 = sub_23CAE5290();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v7);
    double v23 = v1[7];
    uint64_t v24 = sub_23CAE5340();
    sub_23CACC848(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v40, 0.0, 1, v23, 0, v24, v25, v22, 0, 1, 0);
    swift_release();
    memcpy(__dst, v40, 0x88uLL);
    memcpy(v39, v40, sizeof(v39));
    if (*((void *)v1 + 5))
    {
      uint64_t v26 = *((void *)v1 + 4);
      unint64_t v27 = *((void *)v1 + 5);
    }
    else
    {
      uint64_t v26 = 0;
      unint64_t v27 = 0xE000000000000000;
    }
    uint64_t v37 = v26;
    unint64_t v38 = v27;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EC00);
    sub_23CACD688();
    sub_23CAC9A30();
    sub_23CAE51B0();
    swift_bridgeObjectRelease();
    sub_23CACD778((uint64_t)__dst);
    sub_23CAE4E70();
    uint64_t v29 = v32;
    uint64_t v30 = v33;
    sub_23CAE4CF0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v36);
    sub_23CACD7A4((uint64_t)v16, &qword_26AD6EC10);
    sub_23CACD7F8(v29, (uint64_t)v21, &qword_26AD6EC10);
    uint64_t v31 = v34;
    sub_23CACD7F8((uint64_t)v21, v34, &qword_26AD6EC10);
    return __swift_storeEnumTagSinglePayload(v31, 0, 1, v30);
  }
  else
  {
    return __swift_storeEnumTagSinglePayload(a1, 1, 1, v18);
  }
}

uint64_t sub_23CACC848@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, char a19)
{
  uint64_t v20 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  int v23 = a8 & 1;
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (v23) {
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
    sub_23CAE55C0();
    uint64_t v30 = (void *)sub_23CAE4F10();
    sub_23CAE4C40();

    uint64_t v20 = a17;
  }
  sub_23CAE4D20();
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v20;
  *(unsigned char *)(a9 + 16) = a18 & 1;
  *(unsigned char *)(a9 + 17) = a19 & 1;
  memcpy((void *)(a9 + 24), __src, 0x70uLL);
  return swift_retain();
}

uint64_t sub_23CACCA0C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char __src,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51)
{
  OUTLINED_FUNCTION_8();
  a50 = v52;
  a51 = v53;
  uint64_t v55 = v54;
  double v67 = OUTLINED_FUNCTION_0_1(v56);
  if (!v68) {
    double v67 = -INFINITY;
  }
  double v69 = v57;
  if (v58) {
    double v69 = v67;
  }
  double v70 = v59;
  if (v60) {
    double v70 = v69;
  }
  if (v67 > v69 || v69 > v70) {
    goto LABEL_22;
  }
  double v72 = v61;
  if (v62) {
    double v72 = -INFINITY;
  }
  double v73 = v66;
  if (v64) {
    double v73 = v72;
  }
  double v74 = v65;
  if (v63) {
    double v74 = v73;
  }
  if (v72 > v73 || v73 > v74)
  {
LABEL_22:
    sub_23CAE55C0();
    uint64_t v76 = (void *)sub_23CAE4F10();
    OUTLINED_FUNCTION_5_0();
  }
  sub_23CAE4D20();
  long long v77 = *(_OWORD *)(v51 + 16);
  *(_OWORD *)uint64_t v55 = *(_OWORD *)v51;
  *(_OWORD *)(v55 + 16) = v77;
  *(_OWORD *)(v55 + 32) = *(_OWORD *)(v51 + 32);
  *(void *)(v55 + 48) = *(void *)(v51 + 48);
  memcpy((void *)(v55 + 56), &__src, 0x70uLL);
  OUTLINED_FUNCTION_7_0();
  return sub_23CACDCBC(v78);
}

void *sub_23CACCB74()
{
  OUTLINED_FUNCTION_14();
  return OUTLINED_FUNCTION_13(v0, v1, v3, v4, v5, v6, v7, v8, &qword_268BC83A8, &qword_268BC83B0);
}

#error "23CACCC6C: call analysis failed (funcsize=59)"

uint64_t sub_23CACCCA0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char __src,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51)
{
  OUTLINED_FUNCTION_8();
  a50 = v52;
  a51 = v53;
  uint64_t v55 = v54;
  double v61 = OUTLINED_FUNCTION_0_1(v56);
  if (!v62) {
    double v61 = -INFINITY;
  }
  double v63 = v57;
  if (v58) {
    double v63 = v61;
  }
  double v64 = v59;
  if (v60) {
    double v64 = v63;
  }
  BOOL v65 = v61 > v63 || v63 > v64;
  if (v65 || ((OUTLINED_FUNCTION_9(), v68 <= v66) ? (BOOL v69 = v66 > v67) : (BOOL v69 = 1), v69))
  {
    sub_23CAE55C0();
    double v70 = (void *)sub_23CAE4F10();
    OUTLINED_FUNCTION_5_0();
  }
  sub_23CAE4D20();
  memcpy((void *)v55, v51, 0x51uLL);
  memcpy((void *)(v55 + 88), &__src, 0x70uLL);
  OUTLINED_FUNCTION_7_0();
  return sub_23CACDC0C(v71);
}

void *sub_23CACCE00()
{
  OUTLINED_FUNCTION_14();
  return OUTLINED_FUNCTION_13(v0, v1, v3, v4, v5, v6, v7, v8, &qword_268BC8398, &qword_268BC83A0);
}

void *sub_23CACCE38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9, uint64_t *a10)
{
  uint64_t v12 = a10;
  double v23 = OUTLINED_FUNCTION_0_1(a1);
  if (!v24) {
    double v23 = -INFINITY;
  }
  double v25 = v13;
  if (v14) {
    double v25 = v23;
  }
  double v26 = v15;
  if (v16) {
    double v26 = v25;
  }
  if (v23 > v25 || v25 > v26) {
    goto LABEL_22;
  }
  double v28 = v17;
  if (v18) {
    double v28 = -INFINITY;
  }
  double v29 = v22;
  if (v20) {
    double v29 = v28;
  }
  double v30 = v21;
  if (v19) {
    double v30 = v29;
  }
  if (v28 > v29 || v29 > v30)
  {
LABEL_22:
    sub_23CAE55C0();
    uint64_t v32 = (void *)sub_23CAE4F10();
    sub_23CAE4C40();

    uint64_t v12 = a10;
  }
  sub_23CAE4D20();
  sub_23CACDC60(v10, a2, a9);
  uint64_t v33 = __swift_instantiateConcreteTypeFromMangledName(v12);
  return memcpy((void *)(a2 + *(int *)(v33 + 36)), __src, 0x70uLL);
}

#error "23CACD094: call analysis failed (funcsize=59)"

id sub_23CACD0C8()
{
  id v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v1 = (void *)sub_23CAE5430();
  swift_bridgeObjectRelease();
  id v2 = objc_msgSend(v0, sel_initWithPath_, v1);

  return v2;
}

uint64_t sub_23CACD13C(uint64_t a1)
{
  return a1;
}

uint64_t sub_23CACD168(uint64_t a1)
{
  return a1;
}

unint64_t sub_23CACD198(uint64_t a1, uint64_t a2)
{
  sub_23CAE5700();
  sub_23CAE5480();
  uint64_t v4 = sub_23CAE5730();
  return sub_23CACD300(a1, a2, v4);
}

uint64_t sub_23CACD210(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_23CACD26C(uint64_t a1)
{
  sub_23CAE5460();
  sub_23CAE5700();
  sub_23CAE5480();
  uint64_t v2 = sub_23CAE5730();
  swift_bridgeObjectRelease();
  return sub_23CACD854(a1, v2);
}

unint64_t sub_23CACD300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_23CAE56E0() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        double v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_23CAE56E0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t destroy for AppleLogoHeaderView()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

void *initializeWithCopy for AppleLogoHeaderView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for AppleLogoHeaderView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_retain();
  swift_release();
  a1[7] = a2[7];
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AppleLogoHeaderView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppleLogoHeaderView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppleLogoHeaderView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 64) = 1;
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
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppleLogoHeaderView()
{
  return &type metadata for AppleLogoHeaderView;
}

uint64_t sub_23CACD66C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_23CACD688()
{
  unint64_t result = qword_26AD6EBF8;
  if (!qword_26AD6EBF8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD6EC00);
    sub_23CACD704();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD6EBF8);
  }
  return result;
}

unint64_t sub_23CACD704()
{
  unint64_t result = qword_26AD6EBD8;
  if (!qword_26AD6EBD8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD6EBE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD6EBD8);
  }
  return result;
}

uint64_t sub_23CACD778(uint64_t a1)
{
  return a1;
}

uint64_t sub_23CACD7A4(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_10();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_23CACD7F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_10();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

unint64_t sub_23CACD854(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_23CAE5460();
    uint64_t v8 = v7;
    if (v6 == sub_23CAE5460() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_23CAE56E0();
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
          uint64_t v13 = sub_23CAE5460();
          uint64_t v15 = v14;
          if (v13 == sub_23CAE5460() && v15 == v16) {
            break;
          }
          char v18 = sub_23CAE56E0();
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

uint64_t sub_23CACD9CC()
{
  sub_23CAE5460();
  sub_23CAE5700();
  sub_23CAE5480();
  uint64_t v0 = sub_23CAE5730();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23CACDA40()
{
  uint64_t v0 = sub_23CAE5460();
  uint64_t v2 = v1;
  if (v0 == sub_23CAE5460() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_23CAE56E0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

unint64_t sub_23CACDACC()
{
  unint64_t result = qword_26AD6EC20;
  if (!qword_26AD6EC20)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD6EC18);
    sub_23CACDB40();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD6EC20);
  }
  return result;
}

unint64_t sub_23CACDB40()
{
  unint64_t result = qword_26AD6EC08;
  if (!qword_26AD6EC08)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD6EC10);
    sub_23CACD688();
    sub_23CACDBBC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD6EC08);
  }
  return result;
}

unint64_t sub_23CACDBBC()
{
  unint64_t result = qword_268BC8390;
  if (!qword_268BC8390)
  {
    sub_23CAE4F00();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8390);
  }
  return result;
}

uint64_t sub_23CACDC0C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  char v3 = *(unsigned char *)(a1 + 32);
  id v4 = *(id *)a1;
  sub_23CACDC54(v2, v3);
  return a1;
}

uint64_t sub_23CACDC54(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_23CACDC60(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_10();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_23CACDCBC(uint64_t a1)
{
  return a1;
}

double OUTLINED_FUNCTION_0_1(uint64_t a1)
{
  return *(double *)&a1;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return 0x5F454C505041;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_23CAE4C40();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return sub_23CAE4D20();
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  return a19;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return sub_23CAE55C0();
}

void *OUTLINED_FUNCTION_13@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9, uint64_t *a10)
{
  LOBYTE(a6) = v13;
  LOBYTE(a4) = v11;
  return sub_23CACCE38(a1, a2, v10, a4, v12, a6, v14, v15, a9, a10);
}

void *OUTLINED_FUNCTION_15(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char __src)
{
  void *v24 = v25;
  return memcpy(v24 + 1, &__src, 0x70uLL);
}

void sub_23CACDEB4(void *a1@<X0>, unsigned __int8 a2@<W1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  swift_bridgeObjectRetain();
  id v8 = a1;
  id v9 = objc_msgSend(v8, sel_salableInfo);

  if (v9) {
    id v9 = objc_msgSend(v8, sel_salableInfo);
  }
  uint64_t v10 = MEMORY[0x263F8EE78];
  if (a1)
  {
    id v11 = objc_msgSend(v8, sel_paymentContentItems);
    sub_23CACB9A4();
    unint64_t v12 = sub_23CAE5510();
  }
  else
  {
    unint64_t v12 = MEMORY[0x263F8EE78];
  }
  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_23CAE56A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v13 >= 1) {
    uint64_t v14 = v10;
  }
  else {
    uint64_t v14 = 0;
  }
  if (a1 && v13 >= 1)
  {
    id v15 = objc_msgSend(v8, sel_paymentContentItems);
    sub_23CACB9A4();
    uint64_t v14 = sub_23CAE5510();
  }
  swift_bridgeObjectRelease();

  *a4 = a1;
  a4[1] = a2;
  a4[2] = a3;
  a4[3] = v14;
  a4[4] = v9;
}

void destroy for CardOnFileView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 32);
}

uint64_t initializeWithCopy for CardOnFileView(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v5;
  id v6 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v7 = v5;
  return a1;
}

uint64_t assignWithCopy for CardOnFileView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  id v7 = *(void **)(a1 + 32);
  id v8 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v8;
  id v9 = v8;

  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CardOnFileView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for CardOnFileView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CardOnFileView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CardOnFileView()
{
  return &type metadata for CardOnFileView;
}

uint64_t sub_23CACE290()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 sub_23CACE2AC@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_23CAE4EA0();
  sub_23CACE320(v1, (uint64_t)v10);
  __int16 v4 = v11;
  __n128 result = (__n128)v10[0];
  long long v6 = v10[1];
  long long v7 = v10[2];
  long long v8 = v10[3];
  long long v9 = v10[4];
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  *(__n128 *)(a1 + 24) = result;
  *(_OWORD *)(a1 + 40) = v6;
  *(_OWORD *)(a1 + 56) = v7;
  *(_OWORD *)(a1 + 72) = v8;
  *(_OWORD *)(a1 + 88) = v9;
  *(_WORD *)(a1 + 104) = v4;
  return result;
}

uint64_t sub_23CACE320@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int16 v4 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = *(void *)a1;
    uint64_t v6 = *(void *)(a1 + 16);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 8);
    id v8 = v4;
    char v9 = sub_23CADE494(v5, v7, v6);
    sub_23CADF698(v8, v9, 0, (uint64_t)v23);
    uint64_t v10 = v23[0];
    __int16 v11 = v24;
    uint64_t v12 = v25;
    uint64_t v13 = v26;
    uint64_t v14 = v27;
    uint64_t v15 = v30;
    uint64_t v16 = v31;
    uint64_t v22 = v32;
    unint64_t v17 = v28 | ((unint64_t)v29 << 8);
    __int16 v21 = 256;
  }
  else
  {
    __int16 v21 = 0;
    uint64_t v10 = 0;
    __int16 v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    unint64_t v17 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v22 = 0;
  }
  sub_23CACE4F8(a1 + 24, (uint64_t)v33);
  sub_23CACE4F8((uint64_t)v33, (uint64_t)&v34);
  uint64_t v18 = v34;
  __int16 v19 = v21;
  if (!v34) {
    __int16 v19 = 0;
  }
  *(void *)a2 = v10;
  *(void *)(a2 + 8) = v11;
  *(void *)(a2 + 16) = v12;
  *(void *)(a2 + 24) = v13;
  *(void *)(a2 + 32) = v14;
  *(void *)(a2 + 40) = v17;
  *(void *)(a2 + 48) = v15;
  *(void *)(a2 + 56) = v16;
  *(void *)(a2 + 64) = v22;
  *(void *)(a2 + 72) = v18;
  *(_WORD *)(a2 + 80) = v19;
  sub_23CACE560(v10, v11, v12, v13, v14, v17, v15, v16);
  swift_bridgeObjectRetain();
  sub_23CACE5C4((uint64_t)v33);
  swift_bridgeObjectRelease();
  return sub_23CACE5F0(v10, v11, v12, v13, v14, v17, v15, v16);
}

double sub_23CACE4BC@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_23CACE2AC(a1).n128_u64[0];
  return result;
}

uint64_t sub_23CACE4F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC83B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23CACE560(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if (a2)
  {
    char v10 = a8 & 1;
    id v11 = a4;
    id v12 = a2;
    sub_23CACDC54(a7, v10);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_23CACE5C4(uint64_t a1)
{
  return a1;
}

uint64_t sub_23CACE5F0(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if (a2)
  {

    sub_23CACE658(a7, a8 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23CACE658(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

unint64_t sub_23CACE668()
{
  unint64_t result = qword_268BC83C0;
  if (!qword_268BC83C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC83C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC83C0);
  }
  return result;
}

id sub_23CACE6BC()
{
  sub_23CACC464();
  id result = sub_23CACD0C8();
  qword_268BC9D80 = (uint64_t)result;
  return result;
}

uint64_t sub_23CACE708()
{
  if (qword_268BC8250 != -1) {
    swift_once();
  }
  id v0 = (id)qword_268BC9D80;
  uint64_t result = sub_23CAE5220();
  qword_268BC83D0 = result;
  return result;
}

uint64_t static Color.borderColor.getter()
{
  if (qword_268BC8258 != -1) {
    swift_once();
  }
  return swift_retain();
}

void sub_23CACE7E8()
{
  OUTLINED_FUNCTION_20();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  type metadata accessor for TitleWithImage();
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_6_1();
  uint64_t v48 = v1;
  if (!*(void *)(v1 + 16))
  {
    __break(1u);
    goto LABEL_14;
  }
  sub_23CAD1398(v1, (uint64_t)&v39);
  if (!v41)
  {
LABEL_14:
    __break(1u);
    return;
  }
  sub_23CAD1FD4(&v39, (uint64_t)&v42);
  swift_bridgeObjectRetain();
  sub_23CAD1FEC(0, 1);
  __swift_project_boxed_opaque_existential_1(&v42, v44);
  sub_23CAE5160();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v42);
  uint64_t v5 = *(void *)(v48 + 16);
  if (!v5)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    long long v42 = v45;
    char v43 = v46;
    uint64_t v44 = v47;
    uint64_t *v3 = sub_23CAE52F0();
    goto LABEL_11;
  }
  uint64_t v32 = v3;
  uint64_t v6 = v48 + 32;
  while (1)
  {
    sub_23CAD218C(v6, (uint64_t)&v42);
    sub_23CAD218C((uint64_t)&v42, (uint64_t)&v39);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EBA0);
    uint64_t v36 = v5;
    uint64_t v35 = v6;
    if (swift_dynamicCast()) {
      break;
    }
LABEL_9:
    long long v10 = v45;
    char v11 = v46;
    __swift_project_boxed_opaque_existential_1(&v42, v44);
    sub_23CAC9B20(v10, *((uint64_t *)&v10 + 1), v11);
    swift_bridgeObjectRetain();
    sub_23CAE5160();
    long long v12 = v39;
    char v13 = v40;
    uint64_t v14 = sub_23CAE50F0();
    uint64_t v16 = v15;
    char v33 = v17;
    uint64_t v34 = v18;
    sub_23CAC9AA4(v12, *((uint64_t *)&v12 + 1), v13);
    swift_bridgeObjectRelease();
    sub_23CAC9AA4(v10, *((uint64_t *)&v10 + 1), v11);
    swift_bridgeObjectRelease();
    sub_23CAC9AA4(v10, *((uint64_t *)&v10 + 1), v11);
    swift_bridgeObjectRelease();
    *(void *)&long long v45 = v14;
    *((void *)&v45 + 1) = v16;
    char v46 = v33 & 1;
    uint64_t v47 = v34;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v42);
    uint64_t v6 = v35 + 40;
    uint64_t v5 = v36 - 1;
    if (v36 == 1) {
      goto LABEL_10;
    }
  }
  uint64_t v7 = (void *)sub_23CAD21F0(0, (unint64_t *)&qword_268BC8388);
  swift_bridgeObjectRetain();
  if (!sub_23CACD0C8()
    || (uint64_t v8 = OUTLINED_FUNCTION_26(),
        sub_23CAD21F0(v8, (unint64_t *)&qword_268BC8308),
        swift_bridgeObjectRetain(),
        (id v9 = sub_23CACEE18(v37, v38, v7)) == 0))
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_9;
  }
  __int16 v19 = v9;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v20 = v47;
  uint64_t v21 = OUTLINED_FUNCTION_18();
  sub_23CAC9B20(v21, v22, v23);
  swift_bridgeObjectRetain();
  uint64_t v24 = OUTLINED_FUNCTION_18();
  sub_23CACEC30(v24, v25, v26, v20, v37, v38, v27);
  sub_23CAD3208(&qword_268BC8440, (void (*)(uint64_t))type metadata accessor for TitleWithImage);
  uint64_t v28 = sub_23CAE52F0();
  uint64_t v29 = OUTLINED_FUNCTION_18();
  sub_23CAC9AA4(v29, v30, v31);
  swift_bridgeObjectRelease();
  *uint64_t v32 = v28;
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v42);
LABEL_11:
  OUTLINED_FUNCTION_17();
}

uint64_t sub_23CACEC30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  *a7 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8448);
  swift_storeEnumTagMultiPayload();
  uint64_t v14 = (int *)type metadata accessor for TitleWithImage();
  uint64_t v15 = (uint64_t *)((char *)a7 + v14[5]);
  *uint64_t v15 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8450);
  swift_storeEnumTagMultiPayload();
  uint64_t v16 = v14[9];
  sub_23CAD21F0(0, (unint64_t *)&qword_268BC8388);
  id v17 = sub_23CACD0C8();
  *(uint64_t *)((char *)a7 + v16) = (uint64_t)v17;
  uint64_t v18 = (char *)a7 + v14[6];
  *(void *)uint64_t v18 = a1;
  *((void *)v18 + 1) = a2;
  a3 &= 1u;
  v18[16] = a3;
  *((void *)v18 + 3) = a4;
  __int16 v19 = (uint64_t *)((char *)a7 + v14[7]);
  *__int16 v19 = a5;
  v19[1] = a6;
  sub_23CAC9B20(a1, a2, a3);
  id v20 = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23CAE52A0();
  uint64_t v21 = (uint64_t *)((char *)a7 + v14[8]);
  sub_23CAE52C0();
  sub_23CAC9AA4(a1, a2, a3);
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v21 = v23;
  v21[1] = v24;
  return result;
}

void sub_23CACEDD8(void *a1@<X8>)
{
  sub_23CACE7E8();
  *a1 = v2;
}

void sub_23CACEE10(void *a1@<X8>)
{
}

id sub_23CACEE18(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    uint64_t v4 = (void *)sub_23CAE5430();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_imageNamed_inBundle_, v4, a3);

  return v5;
}

uint64_t sub_23CACEE98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v63 = a1;
  sub_23CAE5590();
  OUTLINED_FUNCTION_3_0();
  uint64_t v64 = v3;
  uint64_t v65 = v2;
  MEMORY[0x270FA5388](v2);
  OUTLINED_FUNCTION_3_1();
  uint64_t v62 = v4;
  OUTLINED_FUNCTION_27();
  uint64_t v5 = type metadata accessor for TitleWithImage();
  uint64_t v6 = v5 - 8;
  uint64_t v61 = *(void *)(v5 - 8);
  uint64_t v60 = *(void *)(v61 + 64);
  MEMORY[0x270FA5388](v5);
  uint64_t v59 = (uint64_t)v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_27();
  sub_23CAE4C60();
  OUTLINED_FUNCTION_3_0();
  uint64_t v57 = v8;
  uint64_t v58 = v9;
  MEMORY[0x270FA5388](v8);
  OUTLINED_FUNCTION_3_1();
  uint64_t v56 = v10;
  OUTLINED_FUNCTION_27();
  sub_23CAE4E90();
  OUTLINED_FUNCTION_3_0();
  uint64_t v54 = v11;
  uint64_t v55 = v12;
  MEMORY[0x270FA5388](v11);
  OUTLINED_FUNCTION_19();
  id v13 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x263F83590]);
  objc_msgSend(v13, sel_pointSize);
  uint64_t v15 = v14;

  uint64_t v16 = *(int *)(v6 + 32);
  uint64_t v52 = v1;
  uint64_t v17 = v1 + v16;
  uint64_t v53 = *(void *)v17;
  uint64_t v51 = *(void *)(v17 + 8);
  int v50 = *(unsigned __int8 *)(v17 + 16);
  v49[1] = *(void *)(v17 + 24);
  uint64_t v18 = (uint64_t *)(v1 + *(int *)(v6 + 40));
  uint64_t v20 = *v18;
  unint64_t v19 = v18[1];
  uint64_t v66 = v20;
  unint64_t v67 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8488);
  sub_23CAE52D0();
  uint64_t v21 = sub_23CAE5140();
  uint64_t v23 = v22;
  char v25 = v24 & 1;
  uint64_t v26 = sub_23CAE50B0();
  uint64_t v28 = v27;
  char v30 = v29 & 1;
  sub_23CAC9AA4(v21, v23, v25);
  swift_bridgeObjectRelease();
  uint64_t v31 = sub_23CAE50F0();
  uint64_t v33 = v32;
  uint64_t v53 = v34;
  int v36 = v35 & 1;
  sub_23CAC9AA4(v26, v28, v30);
  swift_bridgeObjectRelease();
  uint64_t v66 = 0;
  unint64_t v67 = 0xE000000000000000;
  uint64_t v37 = v52;
  sub_23CAD1464();
  sub_23CAD3208(&qword_268BC8490, MEMORY[0x263F19A00]);
  sub_23CAE56D0();
  sub_23CAE54B0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_0();
  v38();
  sub_23CAE54B0();
  OUTLINED_FUNCTION_10_0();
  sub_23CAE5690();
  OUTLINED_FUNCTION_11_0();
  v39();
  uint64_t v40 = v66;
  uint64_t v41 = v67;
  uint64_t v42 = v59;
  sub_23CAD3250(v37, v59);
  unint64_t v43 = (*(unsigned __int8 *)(v61 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80);
  unint64_t v44 = (v60 + v43 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v45 = swift_allocObject();
  sub_23CAD3480(v42, v45 + v43);
  *(void *)(v45 + v44) = v15;
  uint64_t v46 = v62;
  sub_23CAE5580();
  sub_23CACF6CC(v40, v41, v46, (uint64_t)&unk_268BC84A0, v45, v31, v33, v36, v63, v53);
  swift_release();
  OUTLINED_FUNCTION_11_0();
  v47();
  swift_bridgeObjectRelease();
  sub_23CAC9AA4(v31, v33, v36);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CACF3AC(uint64_t a1, double a2)
{
  *(double *)(v2 + 48) = a2;
  *(void *)(v2 + 40) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC84B8);
  *(void *)(v2 + 56) = swift_task_alloc();
  sub_23CAE5570();
  *(void *)(v2 + 64) = sub_23CAE5560();
  uint64_t v4 = sub_23CAE5550();
  return MEMORY[0x270FA2498](sub_23CACF478, v4, v3);
}

uint64_t sub_23CACF478()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_release();
  sub_23CAD21F0(0, (unint64_t *)&qword_268BC8308);
  OUTLINED_FUNCTION_26();
  uint64_t v2 = (int *)type metadata accessor for TitleWithImage();
  uint64_t v3 = (uint64_t *)(v1 + v2[7]);
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = *(void **)(v1 + v2[9]);
  id v7 = v6;
  swift_bridgeObjectRetain();
  id v8 = sub_23CACEE18(v4, v5, v6);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)(v0 + 56);
    id v11 = objc_msgSend(v8, sel_imageAsset);
    OUTLINED_FUNCTION_10_0();
    uint64_t v12 = sub_23CAE4C60();
    __swift_storeEnumTagSinglePayload(v10, 0, 1, v12);
    uint64_t v13 = sub_23CAE55E0();
    id v14 = objc_msgSend(self, sel_traitCollectionWithUserInterfaceStyle_, v13);
    if (!v11)
    {
LABEL_5:

      goto LABEL_7;
    }
    id v15 = objc_msgSend(v11, sel_imageWithTraitCollection_, v14);
    if (v15)
    {
      double v16 = *(double *)(v0 + 48);
      uint64_t v17 = *(void *)(v0 + 40);
      id v18 = v15;
      objc_msgSend(v18, sel_size);
      double v20 = v19;
      objc_msgSend(v18, sel_size);
      uint64_t v22 = (void *)sub_23CAD3A24(v16 * (v20 / v21), v16);

      id v23 = v22;
      uint64_t v24 = sub_23CAE5240();
      char v25 = (uint64_t *)(v17 + v2[8]);
      uint64_t v27 = *v25;
      uint64_t v26 = v25[1];
      *(void *)(v0 + 16) = v27;
      *(void *)(v0 + 24) = v26;
      *(void *)(v0 + 32) = v24;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8488);
      sub_23CAE52E0();

      goto LABEL_5;
    }
  }
LABEL_7:
  swift_task_dealloc();
  uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
  return v28();
}

uint64_t sub_23CACF6CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, uint64_t a10)
{
  int v29 = a8;
  uint64_t v27 = a4;
  uint64_t v28 = a7;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC84A8);
  uint64_t v17 = v16 - 8;
  MEMORY[0x270FA5388](v16);
  double v19 = (uint64_t *)((char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  double v20 = (char *)v19 + *(int *)(v17 + 44);
  uint64_t v21 = sub_23CAE5590();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16))(v20, a3, v21);
  uint64_t v22 = (void *)((char *)v19 + *(int *)(v17 + 48));
  *uint64_t v22 = a1;
  v22[1] = a2;
  *double v19 = v27;
  v19[1] = a5;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC84B0);
  sub_23CACDC60((uint64_t)v19, a9 + *(int *)(v23 + 36), &qword_268BC84A8);
  uint64_t v24 = v28;
  *(void *)a9 = a6;
  *(void *)(a9 + 8) = v24;
  LOBYTE(v20) = v29 & 1;
  *(unsigned char *)(a9 + 16) = v29 & 1;
  *(void *)(a9 + 24) = a10;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23CAC9B20(a6, v24, (char)v20);
  swift_bridgeObjectRetain();
  return sub_23CAD36B8((uint64_t)v19, &qword_268BC84A8);
}

void sub_23CACF850()
{
  OUTLINED_FUNCTION_20();
  uint64_t v2 = v0;
  uint64_t v3 = sub_23CAE4B50();
  OUTLINED_FUNCTION_3_0();
  uint64_t v5 = v4;
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_6_1();
  unsigned __int8 v38 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  id v7 = *(void **)(v0 + 32);
  id v8 = objc_msgSend(v7, sel_length);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = &v38;
  *(void *)(v9 + 24) = &v36;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_23CAD1974;
  *(void *)(v10 + 24) = v9;
  uint64_t v34 = sub_23CAD1980;
  uint64_t v35 = v10;
  uint64_t v30 = MEMORY[0x263EF8330];
  uint64_t v31 = 1107296256;
  uint64_t v32 = sub_23CADFE0C;
  uint64_t v33 = &block_descriptor;
  id v11 = _Block_copy(&v30);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_enumerateAttributesInRange_options_usingBlock_, 0, v8, 0, v11);
  _Block_release(v11);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v8)
  {
    __break(1u);
    return;
  }
  uint64_t v12 = v37;
  int v13 = v38;
  if (!v37) {
    goto LABEL_20;
  }
  uint64_t v14 = v36;
  BOOL v15 = v36 == 0x656E696C64616568 && v37 == 0xE800000000000000;
  if (!v15 && (OUTLINED_FUNCTION_16() & 1) == 0)
  {
    BOOL v16 = v14 == 0x65746F6E746F6F66 && v12 == 0xE800000000000000;
    if (v16 || (OUTLINED_FUNCTION_16() & 1) != 0)
    {
LABEL_21:
      sub_23CAE5020();
      goto LABEL_23;
    }
    BOOL v17 = v14 == 0x656772616CLL && v12 == 0xE500000000000000;
    if (v17 || (OUTLINED_FUNCTION_16() & 1) != 0)
    {
      sub_23CAE4F80();
      goto LABEL_23;
    }
LABEL_20:
    if (!v13)
    {
      sub_23CAE5010();
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  sub_23CAE5030();
LABEL_23:
  id v18 = objc_msgSend(v7, sel_string);
  uint64_t v19 = sub_23CAE5460();
  uint64_t v21 = v20;

  uint64_t v30 = v19;
  uint64_t v31 = v21;
  sub_23CAE4B40();
  sub_23CAC9A30();
  sub_23CAE5630();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  swift_bridgeObjectRelease();
  uint64_t v22 = 8;
  if (v38) {
    uint64_t v22 = 24;
  }
  char v23 = *(unsigned char *)(v2 + v22);
  uint64_t v24 = swift_retain();
  sub_23CAD17FC(v24, v23);
  swift_release();
  OUTLINED_FUNCTION_23();
  uint64_t v25 = sub_23CAE50C0();
  uint64_t v27 = v26;
  char v29 = v28;
  swift_bridgeObjectRelease();
  swift_release();
  swift_retain();
  sub_23CAE5100();
  swift_release_n();
  sub_23CAC9AA4(v25, v27, v29 & 1);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17();
}

uint64_t sub_23CACFC58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 *a5, void *a6)
{
  id v9 = (id)*MEMORY[0x263F279F8];
  sub_23CACC000((uint64_t)v9, a1, &v15);

  if (v16)
  {
    sub_23CAD21F0(0, &qword_26AD6ECF0);
    if (swift_dynamicCast())
    {
      unsigned __int8 v10 = objc_msgSend(v13, sel_BOOLValue);

      *a5 = v10;
    }
  }
  else
  {
    sub_23CAD36B8((uint64_t)&v15, (uint64_t *)&unk_26AD6ED20);
  }
  id v11 = (id)*MEMORY[0x263F27A48];
  sub_23CACC000((uint64_t)v11, a1, &v15);

  if (!v16) {
    return sub_23CAD36B8((uint64_t)&v15, (uint64_t *)&unk_26AD6ED20);
  }
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    *a6 = v13;
    a6[1] = v14;
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_23CACFDA4(uint64_t a1@<X8>)
{
  sub_23CACF850();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
}

id sub_23CACFDD8(uint64_t a1, unint64_t a2)
{
  sub_23CAD21F0(0, (unint64_t *)&qword_268BC8308);
  sub_23CACA224(a1, a2);
  uint64_t v4 = OUTLINED_FUNCTION_7_1();
  id v6 = sub_23CACFEF0(v4, v5);
  if (v6)
  {
    OUTLINED_FUNCTION_24();
  }
  else
  {
    type metadata accessor for Log();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8370);
    uint64_t v7 = sub_23CAE53F0();
    OUTLINED_FUNCTION_1(v7);
    *(_OWORD *)(OUTLINED_FUNCTION_15_0() + 16) = xmmword_23CAE62A0;
    v9[3] = MEMORY[0x263F8D310];
    OUTLINED_FUNCTION_28();
    sub_23CAD36B8((uint64_t)v9, (uint64_t *)&unk_26AD6ED20);
    sub_23CADCA8C();
    OUTLINED_FUNCTION_24();
    swift_bridgeObjectRelease();
  }
  return v6;
}

id sub_23CACFEF0(uint64_t a1, unint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  unint64_t v5 = (void *)sub_23CAE4BF0();
  id v6 = objc_msgSend(v4, sel_initWithData_, v5);
  sub_23CACA27C(a1, a2);

  return v6;
}

id sub_23CACFF68(uint64_t a1, unint64_t a2, double a3)
{
  sub_23CAD21F0(0, (unint64_t *)&qword_268BC8308);
  sub_23CACA224(a1, a2);
  uint64_t v6 = OUTLINED_FUNCTION_7_1();
  id v8 = sub_23CADDA24(v6, v7, a3);
  if (v8)
  {
    OUTLINED_FUNCTION_24();
  }
  else
  {
    type metadata accessor for Log();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8370);
    uint64_t v9 = sub_23CAE53F0();
    OUTLINED_FUNCTION_1(v9);
    *(_OWORD *)(OUTLINED_FUNCTION_15_0() + 16) = xmmword_23CAE62A0;
    v11[3] = MEMORY[0x263F8D310];
    OUTLINED_FUNCTION_28();
    sub_23CAD36B8((uint64_t)v11, (uint64_t *)&unk_26AD6ED20);
    sub_23CADCA8C();
    OUTLINED_FUNCTION_24();
    swift_bridgeObjectRelease();
  }
  return v8;
}

uint64_t sub_23CAD0090(void *a1)
{
  id v1 = a1;
  sub_23CAE5240();
  return sub_23CAE5140();
}

uint64_t sub_23CAD00BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_23CAD0090(*v1);
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_23CAD00F4()
{
  unint64_t v0 = sub_23CAE56C0();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

uint64_t sub_23CAD0140()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_7_1();
  if (sub_23CAD00F4() == 5)
  {
    swift_bridgeObjectRelease();
    type metadata accessor for Log();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8370);
    OUTLINED_FUNCTION_26();
    uint64_t v0 = sub_23CAE53F0();
    OUTLINED_FUNCTION_1(v0);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_23CAE62A0;
    sub_23CAE5650();
    swift_bridgeObjectRelease();
    v5[0] = 0xD00000000000001ALL;
    v5[1] = 0x800000023CAE7940;
    OUTLINED_FUNCTION_7_1();
    sub_23CAE54B0();
    swift_bridgeObjectRelease();
    v5[3] = MEMORY[0x263F8D310];
    sub_23CAE53D0();
    sub_23CAD36B8((uint64_t)v5, (uint64_t *)&unk_26AD6ED20);
    sub_23CADCA8C();
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_23CAD02E8();
    uint64_t v4 = v3;
    swift_bridgeObjectRelease();
    if (v4) {
      return v2;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_23CAD02E8()
{
  return 0x5F676E69746172;
}

void sub_23CAD0418(uint64_t a1)
{
  swift_release();
  swift_release();
  uint64_t v2 = *(void **)(a1 + 32);
}

uint64_t sub_23CAD045C(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  char v4 = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = v4;
  char v5 = *(void **)(a2 + 32);
  *(void *)(a1 + 32) = v5;
  swift_retain();
  swift_retain();
  id v6 = v5;
  return a1;
}

uint64_t sub_23CAD04C0(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  char v5 = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = v5;
  swift_retain();
  swift_release();
  id v6 = *(void **)(a2 + 32);
  unint64_t v7 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v6;
  id v8 = v6;

  return a1;
}

uint64_t sub_23CAD0544(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  swift_release();
  char v5 = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = v5;
  swift_release();
  id v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);

  return a1;
}

uint64_t sub_23CAD05AC(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 32);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_23CAD05EC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)(result + 32) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for AttributedStringRowComponent()
{
}

void *initializeBufferWithCopyOfBuffer for TitleHeaderView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for TitleHeaderView()
{
  return swift_bridgeObjectRelease();
}

void *assignWithTake for TitleHeaderView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for RatingRowComponent()
{
}

uint64_t sub_23CAD06C4()
{
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CAD0708(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  char v4 = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = v4;
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23CAD0778(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  char v5 = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = v5;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_23CAD0824(uint64_t a1, uint64_t a2)
{
  char v4 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v4;
  swift_release();
  char v5 = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = v5;
  swift_release();
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23CAD0894(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 40);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_23CAD08D4(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for TextEncapsulationRowComponent()
{
}

void type metadata accessor for ImageRowComponent()
{
}

void type metadata accessor for CombinedRowView()
{
}

void *assignWithCopy for TitleHeaderView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TitleHeaderView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TitleHeaderView(uint64_t result, int a2, int a3)
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

void type metadata accessor for StringRowComponent()
{
}

uint64_t sub_23CAD0A10()
{
  return MEMORY[0x263F1A820];
}

uint64_t sub_23CAD0A1C()
{
  return sub_23CAE5110();
}

uint64_t sub_23CAD0A6C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_23CAD0A1C();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_23CAD0AA0(uint64_t a1)
{
  return a1;
}

uint64_t sub_23CAD0AE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_23CAD0AA0(*v1);
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5 & 1;
  *(void *)(a1 + 24) = MEMORY[0x263F8EE78];
  return result;
}

uint64_t sub_23CAD0B28()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_23CAD0B44()
{
  OUTLINED_FUNCTION_20();
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC83F8);
  uint64_t v3 = OUTLINED_FUNCTION_14_0(v2);
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_3_1();
  uint64_t v64 = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8400);
  uint64_t v6 = OUTLINED_FUNCTION_14_0(v5);
  MEMORY[0x270FA5388](v6);
  OUTLINED_FUNCTION_3_1();
  uint64_t v63 = v7;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8408);
  uint64_t v9 = OUTLINED_FUNCTION_14_0(v8);
  MEMORY[0x270FA5388](v9);
  OUTLINED_FUNCTION_3_1();
  uint64_t v61 = v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8410);
  uint64_t v12 = OUTLINED_FUNCTION_14_0(v11);
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_3_1();
  uint64_t v59 = v13;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8418);
  uint64_t v15 = OUTLINED_FUNCTION_14_0(v14);
  MEMORY[0x270FA5388](v15);
  OUTLINED_FUNCTION_6_1();
  sub_23CAE50A0();
  OUTLINED_FUNCTION_3_0();
  uint64_t v66 = v16;
  uint64_t v67 = v17;
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_3_1();
  uint64_t v65 = v18;
  OUTLINED_FUNCTION_27();
  uint64_t v19 = sub_23CAE4BD0();
  uint64_t v20 = OUTLINED_FUNCTION_14_0(v19);
  MEMORY[0x270FA5388](v20);
  OUTLINED_FUNCTION_19();
  uint64_t v62 = sub_23CAE4B90();
  OUTLINED_FUNCTION_3_0();
  uint64_t v60 = v21;
  uint64_t v23 = MEMORY[0x270FA5388](v22);
  uint64_t v25 = (char *)&v56 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v27 = (char *)&v56 - v26;
  swift_bridgeObjectRetain();
  sub_23CAE4BC0();
  sub_23CAE4BA0();
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  if (*(unsigned char *)(v0 + 25)) {
    uint64_t v28 = 24;
  }
  else {
    uint64_t v28 = 8;
  }
  char v29 = *(unsigned char *)(v0 + v28);
  uint64_t v30 = swift_retain();
  uint64_t v31 = sub_23CAD17FC(v30, v29);
  swift_release();
  uint64_t v70 = v31;
  sub_23CAD1E20();
  sub_23CAE4B80();
  char v32 = *(unsigned char *)(v0 + v28);
  uint64_t v33 = swift_retain();
  uint64_t v34 = sub_23CAD17FC(v33, v32);
  swift_release();
  uint64_t v35 = sub_23CAE5060();
  OUTLINED_FUNCTION_25(v1, v36, v37, v35);
  uint64_t v38 = sub_23CAE5070();
  OUTLINED_FUNCTION_25(v59, v39, v40, v38);
  uint64_t v41 = sub_23CAE5080();
  OUTLINED_FUNCTION_25(v61, v42, v43, v41);
  uint64_t v44 = sub_23CAE5050();
  __swift_storeEnumTagSinglePayload(v63, 1, 1, v44);
  uint64_t v58 = v34;
  swift_retain();
  uint64_t v45 = v65;
  sub_23CAE5090();
  uint64_t v68 = swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v46 = v66;
  uint64_t v47 = v64;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 16))(v64, v45, v66);
  __swift_storeEnumTagSinglePayload(v47, 0, 1, v46);
  sub_23CAD1EF4();
  OUTLINED_FUNCTION_7_1();
  uint64_t v57 = v27;
  sub_23CAE4B80();
  uint64_t v48 = v60;
  uint64_t v49 = v62;
  (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v25, v27, v62);
  uint64_t v50 = sub_23CAE5120();
  uint64_t v52 = v51;
  LOBYTE(v34) = v53 & 1;
  sub_23CAE5020();
  sub_23CAE5100();
  uint64_t v64 = v54;
  swift_release();
  sub_23CAC9AA4(v50, v52, v34);
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_0();
  v55();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v57, v49);
  OUTLINED_FUNCTION_17();
}

void sub_23CAD1034()
{
}

uint64_t sub_23CAD105C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return sub_23CAE5420() & 1;
}

uint64_t sub_23CAD10B4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_23CAE5410();
}

void sub_23CAD10F8()
{
}

void sub_23CAD1120(uint64_t a1@<X8>)
{
  sub_23CAD0B44();
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
}

unint64_t sub_23CAD1154(uint64_t a1)
{
  unint64_t result = sub_23CAD117C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23CAD117C()
{
  unint64_t result = qword_26AD6EBA8;
  if (!qword_26AD6EBA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD6EBA8);
  }
  return result;
}

unint64_t sub_23CAD11C8(uint64_t a1)
{
  unint64_t result = sub_23CAD11F0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23CAD11F0()
{
  unint64_t result = qword_26AD6EB90;
  if (!qword_26AD6EB90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD6EB90);
  }
  return result;
}

unint64_t sub_23CAD123C(uint64_t a1)
{
  unint64_t result = sub_23CAD1264();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23CAD1264()
{
  unint64_t result = qword_268BC83D8;
  if (!qword_268BC83D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC83D8);
  }
  return result;
}

unint64_t sub_23CAD12B0(uint64_t a1)
{
  unint64_t result = sub_23CAD12D8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23CAD12D8()
{
  unint64_t result = qword_268BC83E0;
  if (!qword_268BC83E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC83E0);
  }
  return result;
}

unint64_t sub_23CAD1324(uint64_t a1)
{
  unint64_t result = sub_23CAD134C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23CAD134C()
{
  unint64_t result = qword_268BC83E8;
  if (!qword_268BC83E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC83E8);
  }
  return result;
}

double sub_23CAD1398@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(void *)(a1 + 16))
  {
    sub_23CAD218C(a1 + 32, a2);
  }
  else
  {
    *(void *)(a2 + 32) = 0;
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t sub_23CAD13BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void), uint64_t (*a6)(char *))
{
  a5(0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v13 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v13 - v9, a1);
  return a6(v10);
}

void sub_23CAD1464()
{
  OUTLINED_FUNCTION_20();
  unint64_t v20 = v1;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  sub_23CAE4E00();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_5_1();
  __swift_instantiateConcreteTypeFromMangledName(v7);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23CACDC60(v0, (uint64_t)v13, v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5(0);
    OUTLINED_FUNCTION_10();
    (*(void (**)(uint64_t, char *))(v14 + 32))(v9, v13);
  }
  else
  {
    os_log_type_t v15 = sub_23CAE55C0();
    uint64_t v16 = sub_23CAE4F10();
    if (os_log_type_enabled(v16, v15))
    {
      uint64_t v17 = swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 136315138;
      *(void *)(v17 + 4) = sub_23CAD19A0(v3, v20, &v21);
      _os_log_impl(&dword_23CAC6000, v16, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v17, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_13_0();
    }

    sub_23CAE4DF0();
    swift_getAtKeyPath();
    swift_release();
    uint64_t v18 = OUTLINED_FUNCTION_23();
    v19(v18);
  }
  OUTLINED_FUNCTION_17();
}

double sub_23CAD1680(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_26();
  sub_23CAE4E00();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5_1();
  if (a2) {
    return *(double *)&v2;
  }
  swift_retain();
  os_log_type_t v5 = sub_23CAE55C0();
  uint64_t v6 = sub_23CAE4F10();
  if (os_log_type_enabled(v6, v5))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    *(void *)(v7 + 4) = sub_23CAD19A0(0x74616F6C464743, 0xE700000000000000, &v13);
    OUTLINED_FUNCTION_22(&dword_23CAC6000, v8, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_13_0();
  }

  sub_23CAE4DF0();
  OUTLINED_FUNCTION_23();
  swift_getAtKeyPath();
  sub_23CACE658(v2, 0);
  uint64_t v10 = OUTLINED_FUNCTION_7_1();
  v11(v10);
  return *(double *)&v13;
}

uint64_t sub_23CAD17FC(uint64_t a1, char a2)
{
  sub_23CAE4E00();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x270FA5388](v4);
  OUTLINED_FUNCTION_5_1();
  swift_retain();
  if ((a2 & 1) == 0)
  {
    os_log_type_t v5 = sub_23CAE55C0();
    uint64_t v6 = sub_23CAE4F10();
    if (os_log_type_enabled(v6, v5))
    {
      uint64_t v7 = swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 136315138;
      *(void *)(v7 + 4) = sub_23CAD19A0(0x726F6C6F43, 0xE500000000000000, &v13);
      OUTLINED_FUNCTION_22(&dword_23CAC6000, v8, v9, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.");
      swift_arrayDestroy();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_13_0();
    }

    sub_23CAE4DF0();
    OUTLINED_FUNCTION_7_1();
    swift_getAtKeyPath();
    swift_release();
    uint64_t v10 = OUTLINED_FUNCTION_23();
    v11(v10);
    return v13;
  }
  return a1;
}

uint64_t sub_23CAD1974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CACFC58(a1, a2, a3, a4, *(unsigned __int8 **)(v4 + 16), *(void **)(v4 + 24));
}

uint64_t sub_23CAD1980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CADFDE4(a1, a2, a3, a4, *(uint64_t (**)(void))(v4 + 16));
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

unint64_t sub_23CAD19A0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_23CAD1A74(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_23CACD210((uint64_t)v12, *a3);
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
      sub_23CACD210((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v12);
  return v7;
}

unint64_t sub_23CAD1A74(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    unint64_t result = sub_23CAD1B74(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = sub_23CAE5680();
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

uint64_t sub_23CAD1B74(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_23CAD1C0C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = (uint64_t)sub_23CAD1D10(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = (uint64_t)sub_23CAD1D10((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23CAD1C0C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_23CAD1CA8(v2, 0);
      uint64_t result = sub_23CAE5660();
      if (v5) {
        break;
      }
      if (result == v2) {
        return (uint64_t)v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = sub_23CAE54C0();
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

void *sub_23CAD1CA8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC83F0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_23CAD1D10(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BC83F0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[v8] <= v12) {
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

void sub_23CAD1E00()
{
}

unint64_t sub_23CAD1E20()
{
  unint64_t result = qword_268BC8420;
  if (!qword_268BC8420)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8420);
  }
  return result;
}

uint64_t sub_23CAD1E78(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_23CAD1E84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CAD105C(a1, a2, a3, &qword_268BC8438) & 1;
}

uint64_t sub_23CAD1EA8(uint64_t a1, uint64_t a2)
{
  return sub_23CAD10B4(a1, a2, &qword_268BC8438);
}

void *sub_23CAD1EC8(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

void sub_23CAD1ED4()
{
}

unint64_t sub_23CAD1EF4()
{
  unint64_t result = qword_268BC8428;
  if (!qword_268BC8428)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8428);
  }
  return result;
}

uint64_t sub_23CAD1F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CAD105C(a1, a2, a3, &qword_268BC8430) & 1;
}

uint64_t sub_23CAD1F6C(uint64_t a1, uint64_t a2)
{
  return sub_23CAD10B4(a1, a2, &qword_268BC8430);
}

uint64_t type metadata accessor for TitleWithImage()
{
  uint64_t result = qword_268BC8468;
  if (!qword_268BC8468) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_23CAD1FD4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_23CAD1FEC(uint64_t result, int64_t a2)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v4 = *(void **)v2;
  int64_t v5 = *(void *)(*(void *)v2 + 16);
  if (v5 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v6 = result;
  int64_t v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    unint64_t v4 = sub_23CAE17C0(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  uint64_t v12 = (char *)&v4[5 * v6 + 4];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EBA0);
  uint64_t result = swift_arrayDestroy();
  if (!v7) {
    goto LABEL_16;
  }
  uint64_t v13 = v4[2];
  if (__OFSUB__(v13, a2)) {
    goto LABEL_22;
  }
  uint64_t result = (uint64_t)sub_23CAE1B98((char *)&v4[5 * a2 + 4], v13 - a2, v12);
  uint64_t v14 = v4[2];
  BOOL v15 = __OFADD__(v14, v8);
  uint64_t v16 = v14 - v7;
  if (!v15)
  {
    v4[2] = v16;
LABEL_16:
    *(void *)uint64_t v2 = v4;
    return result;
  }
LABEL_23:
  __break(1u);
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return OUTLINED_FUNCTION_12_0();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_23CAD218C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_23CAD21F0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23CAD222C()
{
  return sub_23CAE4D50();
}

uint64_t sub_23CAD2250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CAD13BC(a1, a2, a3, a4, MEMORY[0x263F18520], MEMORY[0x263F19230]);
}

uint64_t sub_23CAD2290()
{
  return sub_23CAE4D80();
}

uint64_t sub_23CAD22B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CAD13BC(a1, a2, a3, a4, MEMORY[0x263F19A00], MEMORY[0x263F192B8]);
}

void *sub_23CAD22F4(void *a1, void *a2, int *a3)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8448);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_23CAE4C60();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = (void *)((char *)a1 + v9);
    int64_t v11 = (void *)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8450);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_23CAE4E90();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v13 = a3[6];
    uint64_t v14 = (char *)a1 + v13;
    BOOL v15 = (char *)a2 + v13;
    uint64_t v16 = *(void *)((char *)a2 + v13);
    uint64_t v17 = *(void *)((char *)a2 + v13 + 8);
    char v18 = *((unsigned char *)a2 + v13 + 16);
    sub_23CAC9B20(v16, v17, v18);
    *(void *)uint64_t v14 = v16;
    *((void *)v14 + 1) = v17;
    v14[16] = v18;
    *((void *)v14 + 3) = *((void *)v15 + 3);
    uint64_t v19 = a3[7];
    uint64_t v20 = a3[8];
    uint64_t v21 = (void *)((char *)a1 + v19);
    uint64_t v22 = (void *)((char *)a2 + v19);
    uint64_t v23 = v22[1];
    *uint64_t v21 = *v22;
    v21[1] = v23;
    uint64_t v24 = (void *)((char *)a1 + v20);
    uint64_t v25 = (void *)((char *)a2 + v20);
    uint64_t v26 = v25[1];
    void *v24 = *v25;
    v24[1] = v26;
    uint64_t v27 = a3[9];
    uint64_t v28 = *(void **)((char *)a2 + v27);
    *(void *)((char *)a1 + v27) = v28;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    id v29 = v28;
  }
  return a1;
}

void sub_23CAD2530(uint64_t a1, int *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8448);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_23CAE4C60();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  uint64_t v5 = a1 + a2[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8450);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_23CAE4E90();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  sub_23CAC9AA4(*(void *)(a1 + a2[6]), *(void *)(a1 + a2[6] + 8), *(unsigned char *)(a1 + a2[6] + 16));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v7 = *(void **)(a1 + a2[9]);
}

void *sub_23CAD2688(void *a1, void *a2, int *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8448);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_23CAE4C60();
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8450);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_23CAE4E90();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = a3[6];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = *(void *)((char *)a2 + v11);
  uint64_t v15 = *(void *)((char *)a2 + v11 + 8);
  char v16 = *((unsigned char *)a2 + v11 + 16);
  sub_23CAC9B20(v14, v15, v16);
  *(void *)uint64_t v12 = v14;
  *((void *)v12 + 1) = v15;
  v12[16] = v16;
  *((void *)v12 + 3) = *((void *)v13 + 3);
  uint64_t v17 = a3[7];
  uint64_t v18 = a3[8];
  uint64_t v19 = (void *)((char *)a1 + v17);
  uint64_t v20 = (void *)((char *)a2 + v17);
  uint64_t v21 = v20[1];
  *uint64_t v19 = *v20;
  v19[1] = v21;
  uint64_t v22 = (void *)((char *)a1 + v18);
  uint64_t v23 = (void *)((char *)a2 + v18);
  uint64_t v24 = v23[1];
  *uint64_t v22 = *v23;
  v22[1] = v24;
  uint64_t v25 = a3[9];
  uint64_t v26 = *(void **)((char *)a2 + v25);
  *(void *)((char *)a1 + v25) = v26;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  id v27 = v26;
  return a1;
}

void *sub_23CAD2874(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_23CAD36B8((uint64_t)a1, &qword_268BC8448);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8448);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_23CAE4C60();
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
    sub_23CAD36B8((uint64_t)a1 + v7, &qword_268BC8450);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8450);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = sub_23CAE4E90();
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
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = *(void *)((char *)a2 + v11);
  uint64_t v15 = *(void *)((char *)a2 + v11 + 8);
  char v16 = *((unsigned char *)a2 + v11 + 16);
  sub_23CAC9B20(v14, v15, v16);
  uint64_t v17 = *(void *)v12;
  uint64_t v18 = *((void *)v12 + 1);
  char v19 = v12[16];
  *(void *)uint64_t v12 = v14;
  *((void *)v12 + 1) = v15;
  v12[16] = v16;
  sub_23CAC9AA4(v17, v18, v19);
  *((void *)v12 + 3) = *((void *)v13 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[7];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  *uint64_t v21 = *v22;
  v21[1] = v22[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v23 = a3[8];
  uint64_t v24 = (char *)a1 + v23;
  uint64_t v25 = (char *)a2 + v23;
  *(void *)((char *)a1 + v23) = *(void *)((char *)a2 + v23);
  swift_retain();
  swift_release();
  *((void *)v24 + 1) = *((void *)v25 + 1);
  swift_retain();
  swift_release();
  uint64_t v26 = a3[9];
  id v27 = *(void **)((char *)a1 + v26);
  uint64_t v28 = *(void **)((char *)a2 + v26);
  *(void *)((char *)a1 + v26) = v28;
  id v29 = v28;

  return a1;
}

char *sub_23CAD2AD4(char *a1, char *a2, int *a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8448);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_23CAE4C60();
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
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8450);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_23CAE4E90();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(void *)(*(void *)(v11 - 8) + 64));
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  long long v15 = *(_OWORD *)&a2[v13];
  long long v16 = *(_OWORD *)&a2[v13 + 16];
  uint64_t v17 = &a1[v13];
  *(_OWORD *)uint64_t v17 = v15;
  *((_OWORD *)v17 + 1) = v16;
  *(_OWORD *)&a1[v14] = *(_OWORD *)&a2[v14];
  uint64_t v18 = a3[9];
  *(_OWORD *)&a1[a3[8]] = *(_OWORD *)&a2[a3[8]];
  *(void *)&a1[v18] = *(void *)&a2[v18];
  return a1;
}

char *sub_23CAD2C74(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_23CAD36B8((uint64_t)a1, &qword_268BC8448);
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8448);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_23CAE4C60();
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
    sub_23CAD36B8((uint64_t)&a1[v8], &qword_268BC8450);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8450);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_23CAE4E90();
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
  long long v15 = &a2[v13];
  LOBYTE(v13) = a2[v13 + 16];
  uint64_t v16 = *(void *)v14;
  uint64_t v17 = *((void *)v14 + 1);
  char v18 = v14[16];
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  v14[16] = v13;
  sub_23CAC9AA4(v16, v17, v18);
  *((void *)v14 + 3) = *((void *)v15 + 3);
  swift_bridgeObjectRelease();
  uint64_t v19 = a3[7];
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v23 = *(void *)v21;
  uint64_t v22 = *((void *)v21 + 1);
  *(void *)uint64_t v20 = v23;
  *((void *)v20 + 1) = v22;
  swift_bridgeObjectRelease();
  uint64_t v24 = a3[8];
  uint64_t v25 = &a1[v24];
  uint64_t v26 = &a2[v24];
  *(void *)&a1[v24] = *(void *)&a2[v24];
  swift_release();
  *((void *)v25 + 1) = *((void *)v26 + 1);
  swift_release();
  uint64_t v27 = a3[9];
  uint64_t v28 = *(void **)&a1[v27];
  *(void *)&a1[v27] = *(void *)&a2[v27];

  return a1;
}

uint64_t sub_23CAD2EA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23CAD2EB4);
}

uint64_t sub_23CAD2EB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8458);
  OUTLINED_FUNCTION_1_1();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_5:
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8460);
  OUTLINED_FUNCTION_1_1();
  if (*(_DWORD *)(v11 + 84) == a2)
  {
    uint64_t v8 = v10;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    goto LABEL_5;
  }
  unint64_t v13 = *(void *)(a1 + *(int *)(a3 + 24) + 24);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  return (v13 + 1);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_23CAD2F9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23CAD2FB0);
}

void sub_23CAD2FB0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8458);
  OUTLINED_FUNCTION_1_1();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8460);
    OUTLINED_FUNCTION_1_1();
    if (*(_DWORD *)(v13 + 84) != a3)
    {
      *(void *)(a1 + *(int *)(a4 + 24) + 24) = (a2 - 1);
      return;
    }
    uint64_t v10 = v12;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
  }
  __swift_storeEnumTagSinglePayload(v11, a2, a2, v10);
}

void sub_23CAD306C()
{
  sub_23CAD318C(319, &qword_268BC8478, MEMORY[0x263F18520]);
  if (v0 <= 0x3F)
  {
    sub_23CAD318C(319, &qword_268BC8480, MEMORY[0x263F19A00]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_23CAD318C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_23CAE4C70();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_23CAD31E0()
{
  return MEMORY[0x263F1B718];
}

uint64_t sub_23CAD31EC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23CAD3208(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_23CAD3250(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TitleWithImage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23CAD32B4()
{
  uint64_t v1 = type metadata accessor for TitleWithImage();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  uint64_t v5 = v0 + v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8448);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_23CAE4C60();
    OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_11_0();
    v6();
  }
  else
  {
    swift_release();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8450);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_23CAE4E90();
    OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_11_0();
    v7();
  }
  else
  {
    swift_release();
  }
  sub_23CAC9AA4(*(void *)(v5 + *(int *)(v1 + 24)), *(void *)(v5 + *(int *)(v1 + 24) + 8), *(unsigned char *)(v5 + *(int *)(v1 + 24) + 16));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, ((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

uint64_t sub_23CAD3480(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TitleWithImage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23CAD34E4()
{
  uint64_t v2 = type metadata accessor for TitleWithImage();
  OUTLINED_FUNCTION_1(v2);
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  unint64_t v7 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v8 = v0 + v7;
  double v9 = *(double *)(v0 + ((*(void *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v10;
  *uint64_t v10 = v1;
  v10[1] = sub_23CAD35C4;
  return sub_23CACF3AC(v8, v9);
}

uint64_t sub_23CAD35C4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_23CAD36B8(uint64_t a1, uint64_t *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_11_0();
  v3();
  return a1;
}

unint64_t sub_23CAD370C()
{
  unint64_t result = qword_268BC84C0;
  if (!qword_268BC84C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC84B0);
    sub_23CAD3788();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC84C0);
  }
  return result;
}

unint64_t sub_23CAD3788()
{
  unint64_t result = qword_268BC84C8;
  if (!qword_268BC84C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC84A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC84C8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void OUTLINED_FUNCTION_10_0()
{
  sub_23CAD1464();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_release();
}

void OUTLINED_FUNCTION_13_0()
{
  JUMPOUT(0x23ECF1880);
}

uint64_t OUTLINED_FUNCTION_14_0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_23CAE56E0();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_21()
{
  return 8;
}

void OUTLINED_FUNCTION_22(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 0xCu);
}

uint64_t OUTLINED_FUNCTION_23()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return sub_23CACA27C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_25(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_26()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_23CAE53D0();
}

uint64_t sub_23CAD3A24(double a1, double a2)
{
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827A0]), sel_initWithSize_, a1, a2);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v2;
  *(double *)(v6 + 24) = a1;
  *(double *)(v6 + 32) = a2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_23CAD3BF8;
  *(void *)(v7 + 24) = v6;
  v12[4] = sub_23CAD3C24;
  v12[5] = v7;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  void v12[2] = sub_23CAD3C4C;
  unint64_t v12[3] = &block_descriptor_0;
  uint64_t v8 = _Block_copy(v12);
  id v9 = v2;
  swift_retain();
  swift_release();
  id v10 = objc_msgSend(v5, sel_imageWithActions_, v8);

  _Block_release(v8);
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v5 & 1) == 0) {
    return (uint64_t)v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23CAD3BC0()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

id sub_23CAD3BF8()
{
  return objc_msgSend(*(id *)(v0 + 16), sel_drawInRect_, 0.0, 0.0, *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_23CAD3C14()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23CAD3C24()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_23CAD3C4C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
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

uint64_t sub_23CAD3CB0()
{
  return sub_23CAD8E08(&qword_26AD6EB48, MEMORY[0x263F07508]);
}

uint64_t sub_23CAD3CF8(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000032;
  unint64_t v3 = 0x800000023CAE7610;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v5 = 0xD00000000000002BLL;
    }
    else {
      unint64_t v5 = 0xD000000000000033;
    }
    if (v4 == 1) {
      unint64_t v6 = 0x800000023CAE7650;
    }
    else {
      unint64_t v6 = 0x800000023CAE7680;
    }
  }
  else
  {
    unint64_t v5 = 0xD000000000000032;
    unint64_t v6 = 0x800000023CAE7610;
  }
  if (a2)
  {
    if (a2 == 1) {
      unint64_t v2 = 0xD00000000000002BLL;
    }
    else {
      unint64_t v2 = 0xD000000000000033;
    }
    if (a2 == 1) {
      unint64_t v3 = 0x800000023CAE7650;
    }
    else {
      unint64_t v3 = 0x800000023CAE7680;
    }
  }
  if (v5 == v2 && v6 == v3) {
    char v8 = 1;
  }
  else {
    char v8 = sub_23CAE56E0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

BOOL sub_23CAD3DE4(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_23CAD3DF4(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x746C7561666564;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x746C7561666564;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x65746F6E746F6F66;
      break;
    case 2:
      unint64_t v3 = 0xE800000000000000;
      uint64_t v5 = 0x656E696C64616568;
      break;
    case 3:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x656772616CLL;
      break;
    case 4:
      uint64_t v5 = 0x72614C6172747865;
      unint64_t v3 = 0xEA00000000006567;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v2 = 0x65746F6E746F6F66;
      break;
    case 2:
      unint64_t v6 = 0xE800000000000000;
      uint64_t v2 = 0x656E696C64616568;
      break;
    case 3:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v2 = 0x656772616CLL;
      break;
    case 4:
      uint64_t v2 = 0x72614C6172747865;
      unint64_t v6 = 0xEA00000000006567;
      break;
    default:
      break;
  }
  if (v5 == v2 && v3 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_23CAE56E0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23CAD3FA8()
{
  sub_23CAE5480();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23CAD4038()
{
  return sub_23CAE5710();
}

uint64_t sub_23CAD4060()
{
  sub_23CAE5480();
  return swift_bridgeObjectRelease();
}

unint64_t sub_23CAD4144(unint64_t result)
{
  if (result >= 4) {
    return 4;
  }
  return result;
}

uint64_t sub_23CAD4154(uint64_t result)
{
  return result;
}

BOOL sub_23CAD415C(char *a1, char *a2)
{
  return sub_23CAD3DE4(*a1, *a2);
}

uint64_t sub_23CAD4168()
{
  return sub_23CADAFF8(*v0);
}

uint64_t sub_23CAD4170()
{
  return sub_23CAD4038();
}

uint64_t sub_23CAD4178(uint64_t a1)
{
  return sub_23CADB054(a1, *v1);
}

unint64_t sub_23CAD4180@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_23CAD4144(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_23CAD41AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23CAD4154(*v1);
  *a1 = result;
  return result;
}

void sub_23CAD41D8(void *a1@<X0>, void *a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v21 = a3 & 1;
  sub_23CAD21F0(0, (unint64_t *)&qword_268BC8388);
  id v11 = sub_23CACD0C8();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v13 = sub_23CAD42EC(a1, 11043042, 0xA300000000000000, a4, a5);
  swift_bridgeObjectRelease();
  uint64_t v14 = sub_23CADC16C(a1, a2);
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;

  *(void *)a6 = v11;
  *(void *)(a6 + 8) = v13;
  *(unsigned char *)(a6 + 16) = v21;
  *(void *)(a6 + 24) = v14;
  *(void *)(a6 + 32) = v16;
  *(void *)(a6 + 40) = v18;
  *(void *)(a6 + 48) = v20;
  *(void *)(a6 + 56) = KeyPath;
  *(unsigned char *)(a6 + 64) = 0;
}

uint64_t sub_23CAD42EC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v102 = a4;
  uint64_t v103 = a5;
  uint64_t v8 = type metadata accessor for FlexListItem();
  uint64_t v100 = *(void *)(v8 - 8);
  uint64_t v101 = v8;
  uint64_t v9 = MEMORY[0x270FA5388](v8);
  uint64_t v110 = (uint64_t)&v91 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v91 - v11;
  id v108 = a1;
  id v13 = objc_msgSend(a1, sel_string);
  uint64_t v14 = sub_23CAE5460();
  uint64_t v16 = v15;

  *(void *)&long long v111 = v14;
  *((void *)&v111 + 1) = v16;
  uint64_t v109 = a2;
  uint64_t v114 = a2;
  uint64_t v115 = a3;
  sub_23CAC9A30();
  uint64_t v17 = sub_23CAE5620();
  swift_bridgeObjectRelease();
  unint64_t v113 = MEMORY[0x263F8EE78];
  uint64_t v18 = *(void *)(v17 + 16);
  if (v18)
  {
    uint64_t v19 = 0;
    uint64_t v107 = v17;
    uint64_t v20 = (void *)(v17 + 40);
    while (1)
    {
      if ((*v20 & 0x1000000000000000) != 0) {
        uint64_t v21 = sub_23CAE54D0();
      }
      else {
        uint64_t v21 = sub_23CAE54E0();
      }
      unint64_t v22 = v21;
      id v23 = objc_msgSend(v108, sel_attributedSubstringFromRange_, v19, v21);
      if ((uint64_t)objc_msgSend(v23, sel_length) >= 1)
      {
        id v24 = v23;
        MEMORY[0x23ECF1100]();
        if (*(void *)((v113 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v113 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_23CAE5530();
        }
        sub_23CAE5540();
        sub_23CAE5520();
      }
      uint64_t v25 = sub_23CAE5490();

      unint64_t v26 = v22 + v25;
      if (__OFADD__(v22, v25)) {
        break;
      }
      BOOL v27 = __OFADD__(v19, v26);
      v19 += v26;
      if (v27) {
        goto LABEL_155;
      }
      v20 += 2;
      if (!--v18)
      {
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v22 = v113;
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_155:
    __break(1u);
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    unint64_t v22 = MEMORY[0x263F8EE78];
LABEL_15:
    if (!(v22 >> 62))
    {
      uint64_t v29 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v29) {
        goto LABEL_157;
      }
      goto LABEL_17;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v29 = sub_23CAE56A0();
  uint64_t result = swift_bridgeObjectRelease();
  if (v29)
  {
LABEL_17:
    if (v29 < 1)
    {
      __break(1u);
      return result;
    }
    uint64_t v30 = 0;
    unint64_t v106 = v22 & 0xC000000000000001;
    id v97 = (id)*MEMORY[0x263F27A20];
    id v96 = (id)*MEMORY[0x263F279D0];
    id v95 = (id)*MEMORY[0x263F279F8];
    id v94 = (id)*MEMORY[0x263F27A48];
    id v93 = (id)*MEMORY[0x263F27A50];
    uint64_t v109 = *MEMORY[0x263F27A68];
    uint64_t v104 = *MEMORY[0x263F27A60];
    uint64_t v91 = *MEMORY[0x263F27A58];
    id v92 = (id)*MEMORY[0x263F27A70];
    size_t v31 = MEMORY[0x263F8EE78];
    uint64_t v105 = MEMORY[0x263F8EE58] + 8;
    uint64_t v98 = v29;
    unint64_t v99 = v22;
    while (1)
    {
      id v32 = v106 ? (id)MEMORY[0x23ECF1270](v30, v22) : *(id *)(v22 + 8 * v30 + 32);
      uint64_t v33 = v32;
      id v34 = objc_msgSend(v32, sel_attributesAtIndex_effectiveRange_, 0, 0, v91);
      type metadata accessor for Key(0);
      sub_23CAD8E08((unint64_t *)&qword_26AD6ECD0, type metadata accessor for Key);
      uint64_t v35 = sub_23CAE5400();

      if (!*(void *)(v35 + 16)) {
        break;
      }
      id v36 = v97;
      unint64_t v37 = sub_23CACD26C((uint64_t)v36);
      if (v38)
      {
        sub_23CACD210(*(void *)(v35 + 56) + 32 * v37, (uint64_t)&v111);
      }
      else
      {
        long long v111 = 0u;
        long long v112 = 0u;
      }

      if (!*((void *)&v112 + 1)) {
        goto LABEL_33;
      }
      if ((swift_dynamicCast() & 1) == 0 || v114 != 3 && v114 != 2 && v114 != 1) {
        goto LABEL_34;
      }

      swift_bridgeObjectRelease();
LABEL_150:
      if (v29 == ++v30) {
        goto LABEL_158;
      }
    }
    long long v111 = 0u;
    long long v112 = 0u;
LABEL_33:
    sub_23CACD7A4((uint64_t)&v111, (uint64_t *)&unk_26AD6ED20);
LABEL_34:
    if (*(void *)(v35 + 16))
    {
      id v39 = v96;
      unint64_t v40 = sub_23CACD26C((uint64_t)v39);
      if (v41)
      {
        sub_23CACD210(*(void *)(v35 + 56) + 32 * v40, (uint64_t)&v111);
      }
      else
      {
        long long v111 = 0u;
        long long v112 = 0u;
      }

      if (*((void *)&v112 + 1))
      {
        if (swift_dynamicCast())
        {
          LODWORD(v108) = v114;
          goto LABEL_44;
        }
LABEL_43:
        LODWORD(v108) = 0;
LABEL_44:
        if (*(void *)(v35 + 16))
        {
          id v42 = v95;
          unint64_t v43 = sub_23CACD26C((uint64_t)v42);
          if (v44)
          {
            sub_23CACD210(*(void *)(v35 + 56) + 32 * v43, (uint64_t)&v111);
          }
          else
          {
            long long v111 = 0u;
            long long v112 = 0u;
          }

          if (*((void *)&v112 + 1))
          {
            if (swift_dynamicCast())
            {
              LODWORD(v107) = v114;
              goto LABEL_54;
            }
LABEL_53:
            LODWORD(v107) = 0;
LABEL_54:
            if (*(void *)(v35 + 16))
            {
              id v45 = v94;
              unint64_t v46 = sub_23CACD26C((uint64_t)v45);
              if (v47)
              {
                sub_23CACD210(*(void *)(v35 + 56) + 32 * v46, (uint64_t)&v111);
              }
              else
              {
                long long v111 = 0u;
                long long v112 = 0u;
              }

              if (*((void *)&v112 + 1))
              {
                if (swift_dynamicCast())
                {
                  char v48 = sub_23CAD6E28();
                  if (v48 != 5)
                  {
LABEL_65:
                    if (*(void *)(v35 + 16))
                    {
                      id v49 = v93;
                      unint64_t v50 = sub_23CACD26C((uint64_t)v49);
                      if (v51)
                      {
                        sub_23CACD210(*(void *)(v35 + 56) + 32 * v50, (uint64_t)&v111);
                      }
                      else
                      {
                        long long v111 = 0u;
                        long long v112 = 0u;
                      }

                      if (*((void *)&v112 + 1))
                      {
                        if (swift_dynamicCast())
                        {
                          uint64_t v53 = v114;
                          uint64_t v52 = v115;
                          goto LABEL_75;
                        }
LABEL_74:
                        uint64_t v53 = 0;
                        uint64_t v52 = 0;
LABEL_75:
                        uint64_t v54 = sub_23CAE5460();
                        if (v52)
                        {
                          if (v53 == v54 && v52 == v55)
                          {
                            swift_bridgeObjectRelease();
LABEL_91:
                            swift_bridgeObjectRelease();
                            char v62 = 1;
                            goto LABEL_105;
                          }
                          char v57 = sub_23CAE56E0();
                          swift_bridgeObjectRelease();
                          if (v57) {
                            goto LABEL_91;
                          }
                        }
                        else
                        {
                          swift_bridgeObjectRelease();
                        }
                        uint64_t v58 = sub_23CAE5460();
                        if (v52)
                        {
                          if (v53 == v58 && v52 == v59)
                          {
                            swift_bridgeObjectRelease();
LABEL_101:
                            swift_bridgeObjectRelease();
                            char v62 = 2;
                            goto LABEL_105;
                          }
                          char v61 = sub_23CAE56E0();
                          swift_bridgeObjectRelease();
                          if (v61) {
                            goto LABEL_101;
                          }
                        }
                        else
                        {
                          swift_bridgeObjectRelease();
                        }
                        uint64_t v63 = sub_23CAE5460();
                        if (!v52)
                        {
                          swift_bridgeObjectRelease();
                          char v62 = 0;
                          goto LABEL_105;
                        }
                        if (v53 == v63 && v52 == v64)
                        {
                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                        }
                        else
                        {
                          char v66 = sub_23CAE56E0();
                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                          char v62 = 0;
                          if ((v66 & 1) == 0)
                          {
LABEL_105:
                            if (*(void *)(v35 + 16))
                            {
                              id v67 = v92;
                              unint64_t v68 = sub_23CACD26C((uint64_t)v67);
                              if (v69)
                              {
                                sub_23CACD210(*(void *)(v35 + 56) + 32 * v68, (uint64_t)&v111);
                              }
                              else
                              {
                                long long v111 = 0u;
                                long long v112 = 0u;
                              }
                            }
                            else
                            {
                              long long v111 = 0u;
                              long long v112 = 0u;
                            }
                            swift_bridgeObjectRelease();
                            if (*((void *)&v112 + 1))
                            {
                              if (swift_dynamicCast())
                              {
                                uint64_t v71 = v114;
                                uint64_t v70 = v115;
                                goto LABEL_116;
                              }
                            }
                            else
                            {
                              sub_23CACD7A4((uint64_t)&v111, (uint64_t *)&unk_26AD6ED20);
                            }
                            uint64_t v71 = 0;
                            uint64_t v70 = 0;
LABEL_116:
                            uint64_t v72 = sub_23CAE5460();
                            if (v70)
                            {
                              if (v71 == v72 && v70 == v73)
                              {
                                swift_bridgeObjectRelease();
LABEL_132:
                                swift_bridgeObjectRelease();
                                char v80 = 1;
                                goto LABEL_144;
                              }
                              char v75 = sub_23CAE56E0();
                              swift_bridgeObjectRelease();
                              if (v75) {
                                goto LABEL_132;
                              }
                            }
                            else
                            {
                              swift_bridgeObjectRelease();
                            }
                            uint64_t v76 = sub_23CAE5460();
                            if (v70)
                            {
                              if (v71 == v76 && v70 == v77)
                              {
                                swift_bridgeObjectRelease();
LABEL_142:
                                swift_bridgeObjectRelease();
                                char v80 = 2;
                                goto LABEL_144;
                              }
                              char v79 = sub_23CAE56E0();
                              swift_bridgeObjectRelease();
                              if (v79) {
                                goto LABEL_142;
                              }
                            }
                            else
                            {
                              swift_bridgeObjectRelease();
                            }
                            uint64_t v81 = sub_23CAE5460();
                            if (v70)
                            {
                              if (v71 == v81 && v70 == v82)
                              {
                                swift_bridgeObjectRelease();
                                swift_bridgeObjectRelease();
                                uint64_t v29 = v98;
                                unint64_t v22 = v99;
                                char v85 = (char)v108;
                                char v86 = v107;
                              }
                              else
                              {
                                char v84 = sub_23CAE56E0();
                                swift_bridgeObjectRelease();
                                swift_bridgeObjectRelease();
                                char v80 = 0;
                                uint64_t v29 = v98;
                                unint64_t v22 = v99;
                                char v85 = (char)v108;
                                char v86 = v107;
                                if ((v84 & 1) == 0)
                                {
LABEL_145:
                                  uint64_t v87 = v103;
                                  *(void *)uint64_t v12 = v102;
                                  *((void *)v12 + 1) = v87;
                                  v12[16] = v85;
                                  v12[17] = v86;
                                  v12[18] = v48;
                                  v12[19] = v62;
                                  v12[20] = v80;
                                  *((void *)v12 + 3) = v33;
                                  swift_bridgeObjectRetain();
                                  id v88 = v33;
                                  sub_23CAE4C10();
                                  sub_23CAD80C4((uint64_t)v12, v110);
                                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                                    size_t v31 = sub_23CAE19E8(0, *(void *)(v31 + 16) + 1, 1, v31);
                                  }
                                  unint64_t v90 = *(void *)(v31 + 16);
                                  unint64_t v89 = *(void *)(v31 + 24);
                                  if (v90 >= v89 >> 1) {
                                    size_t v31 = sub_23CAE19E8(v89 > 1, v90 + 1, 1, v31);
                                  }
                                  *(void *)(v31 + 16) = v90 + 1;
                                  sub_23CAD8128(v110, v31+ ((*(unsigned __int8 *)(v100 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v100 + 80))+ *(void *)(v100 + 72) * v90);

                                  sub_23CAD818C((uint64_t)v12);
                                  goto LABEL_150;
                                }
                              }
                              char v80 = 3;
                              goto LABEL_145;
                            }
                            swift_bridgeObjectRelease();
                            char v80 = 0;
LABEL_144:
                            uint64_t v29 = v98;
                            unint64_t v22 = v99;
                            char v85 = (char)v108;
                            char v86 = v107;
                            goto LABEL_145;
                          }
                        }
                        char v62 = 3;
                        goto LABEL_105;
                      }
                    }
                    else
                    {
                      long long v111 = 0u;
                      long long v112 = 0u;
                    }
                    sub_23CACD7A4((uint64_t)&v111, (uint64_t *)&unk_26AD6ED20);
                    goto LABEL_74;
                  }
                }
LABEL_64:
                char v48 = 0;
                goto LABEL_65;
              }
            }
            else
            {
              long long v111 = 0u;
              long long v112 = 0u;
            }
            sub_23CACD7A4((uint64_t)&v111, (uint64_t *)&unk_26AD6ED20);
            goto LABEL_64;
          }
        }
        else
        {
          long long v111 = 0u;
          long long v112 = 0u;
        }
        sub_23CACD7A4((uint64_t)&v111, (uint64_t *)&unk_26AD6ED20);
        goto LABEL_53;
      }
    }
    else
    {
      long long v111 = 0u;
      long long v112 = 0u;
    }
    sub_23CACD7A4((uint64_t)&v111, (uint64_t *)&unk_26AD6ED20);
    goto LABEL_43;
  }
LABEL_157:
  size_t v31 = MEMORY[0x263F8EE78];
LABEL_158:
  swift_bridgeObjectRelease();
  return v31;
}

void sub_23CAD4EDC(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_23CAE4E40();
  *(void *)(a1 + 8) = 0x4030000000000000;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC84E8);
  sub_23CAD4F28(v1, (void *)(a1 + *(int *)(v3 + 44)));
}

void sub_23CAD4F28(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC84F0);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC84F8);
  uint64_t v7 = MEMORY[0x270FA5388](v40);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = MEMORY[0x270FA5388](v7);
  uint64_t v12 = (char *)&v35 - v11;
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v35 - v13;
  sub_23CACD7F8((uint64_t)(a1 + 3), (uint64_t)v44, &qword_268BC8500);
  sub_23CACD7F8((uint64_t)v44, (uint64_t)&v45, &qword_268BC8500);
  char v38 = v14;
  id v39 = v9;
  uint64_t v37 = v48;
  if (v48)
  {
    uint64_t v35 = v47;
    id v36 = v45;
    uint64_t v41 = v46;
  }
  else
  {
    uint64_t v35 = 0;
    id v36 = 0;
    uint64_t v41 = 0;
  }
  sub_23CAD8600((uint64_t)v44);
  *(void *)unint64_t v6 = sub_23CAE4EA0();
  *((void *)v6 + 1) = 0;
  v6[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8508);
  uint64_t v42 = a1[1];
  uint64_t v43 = v42;
  uint64_t v15 = swift_allocObject();
  memcpy((void *)(v15 + 16), a1, 0x41uLL);
  sub_23CACE5C4((uint64_t)&v43);
  sub_23CAD86F8((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EC90);
  sub_23CAE4C20();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8510);
  sub_23CACA8C8(&qword_26AD6EC98, &qword_26AD6EC90);
  sub_23CACA8C8(&qword_268BC8518, &qword_268BC8510);
  sub_23CAD8E08(&qword_26AD6EB58, (void (*)(uint64_t))type metadata accessor for FlexListItem);
  sub_23CAE5330();
  unsigned __int8 v16 = sub_23CAE4F30();
  unsigned __int8 v17 = sub_23CAE4F40();
  char v18 = sub_23CAE4F60();
  sub_23CAE4F60();
  if (sub_23CAE4F60() != v16) {
    char v18 = sub_23CAE4F60();
  }
  sub_23CAE4F60();
  if (sub_23CAE4F60() != v17) {
    char v18 = sub_23CAE4F60();
  }
  uint64_t v20 = (uint64_t)v38;
  uint64_t v19 = (uint64_t)v39;
  unint64_t v22 = v36;
  uint64_t v21 = v37;
  uint64_t v23 = v35;
  sub_23CAE4C50();
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  sub_23CACDC60((uint64_t)v6, (uint64_t)v12, &qword_268BC84F0);
  id v32 = &v12[*(int *)(v40 + 36)];
  *id v32 = v18;
  *((void *)v32 + 1) = v25;
  *((void *)v32 + 2) = v27;
  *((void *)v32 + 3) = v29;
  *((void *)v32 + 4) = v31;
  v32[40] = 0;
  sub_23CACD7A4((uint64_t)v6, &qword_268BC84F0);
  sub_23CACD7F8((uint64_t)v12, v20, &qword_268BC84F8);
  sub_23CACDC60(v20, v19, &qword_268BC84F8);
  uint64_t v33 = v41;
  *a2 = v22;
  a2[1] = v33;
  a2[2] = v23;
  a2[3] = v21;
  uint64_t v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8520);
  sub_23CACDC60(v19, (uint64_t)a2 + *(int *)(v34 + 48), &qword_268BC84F8);
  sub_23CAD8634(v22, v33, v23, v21);
  sub_23CACD7A4(v20, &qword_268BC84F8);
  sub_23CACD7A4(v19, &qword_268BC84F8);
  sub_23CAD876C(v22, v33, v23, v21);
}

uint64_t sub_23CAD5374@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8528);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  uint64_t v42 = (uint64_t)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v32 - v9;
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v32 - v11;
  int v13 = *(unsigned __int8 *)(a1 + 20);
  if (*(unsigned char *)(a1 + 20))
  {
    sub_23CAE5340();
    uint64_t v41 = 1;
    sub_23CAE4CC0();
    uint64_t v39 = v44;
    uint64_t v40 = v43;
    uint64_t v37 = v46;
    uint64_t v38 = v45;
    uint64_t v35 = v48;
    uint64_t v36 = v47;
  }
  else
  {
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    uint64_t v38 = 0;
    uint64_t v39 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v35 = 0;
  }
  *(void *)uint64_t v10 = sub_23CAE4E40();
  *((void *)v10 + 1) = 0;
  v10[16] = 1;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8530);
  sub_23CAD5DD4(v2, a1, (uint64_t)&v10[*(int *)(v14 + 44)]);
  sub_23CACD7F8((uint64_t)v10, (uint64_t)v12, &qword_268BC8528);
  int v15 = *(unsigned __int8 *)(a1 + 19);
  if (*(unsigned char *)(a1 + 19))
  {
    sub_23CAE5340();
    uint64_t v34 = 1;
    sub_23CAE4CC0();
    uint64_t v33 = v49;
    uint64_t v32 = v50;
    uint64_t v16 = v51;
    uint64_t v17 = v52;
    uint64_t v19 = v53;
    uint64_t v18 = v54;
  }
  else
  {
    uint64_t v34 = 0;
    uint64_t v33 = 0;
    uint64_t v32 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v19 = 0;
    uint64_t v18 = 0;
  }
  BOOL v20 = v15 == 0;
  BOOL v21 = v13 == 0;
  uint64_t v22 = v42;
  sub_23CACDC60((uint64_t)v12, v42, &qword_268BC8528);
  uint64_t v23 = v41;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = v23;
  uint64_t v24 = v39;
  *(void *)(a2 + 16) = v40;
  *(void *)(a2 + 24) = v24;
  uint64_t v25 = v37;
  *(void *)(a2 + 32) = v38;
  *(void *)(a2 + 40) = v25;
  uint64_t v26 = v35;
  *(void *)(a2 + 48) = v36;
  *(void *)(a2 + 56) = v26;
  *(unsigned char *)(a2 + 64) = v21;
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8538);
  sub_23CACDC60(v22, a2 + *(int *)(v27 + 48), &qword_268BC8528);
  uint64_t v28 = a2 + *(int *)(v27 + 64);
  uint64_t v29 = v34;
  *(void *)uint64_t v28 = 0;
  *(void *)(v28 + 8) = v29;
  uint64_t v30 = v32;
  *(void *)(v28 + 16) = v33;
  *(void *)(v28 + 24) = v30;
  *(void *)(v28 + 32) = v16;
  *(void *)(v28 + 40) = v17;
  *(void *)(v28 + 48) = v19;
  *(void *)(v28 + 56) = v18;
  *(unsigned char *)(v28 + 64) = v20;
  sub_23CACD7A4((uint64_t)v12, &qword_268BC8528);
  return sub_23CACD7A4(v22, &qword_268BC8528);
}

void sub_23CAD5670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v92 = a7;
  uint64_t v94 = a1;
  uint64_t v11 = sub_23CAE4B50();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v85 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = objc_msgSend(a5, sel_string);
  if (!v15)
  {
    __break(1u);
    return;
  }
  id v93 = v15;
  id v16 = objc_msgSend(v15, sel_substringWithRange_, a2, a3);
  uint64_t v17 = sub_23CAE5460();
  uint64_t v19 = v18;

  *(void *)&long long v96 = v17;
  *((void *)&v96 + 1) = v19;
  sub_23CAE4B30();
  unint64_t v91 = sub_23CAC9A30();
  uint64_t v20 = sub_23CAE5630();
  unint64_t v22 = v21;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_bridgeObjectRelease();
  uint64_t v23 = HIBYTE(v22) & 0xF;
  if ((v22 & 0x2000000000000000) == 0) {
    uint64_t v23 = v20 & 0xFFFFFFFFFFFFLL;
  }
  if (v23)
  {
    uint64_t v24 = *(void *)a6;
    uint64_t v25 = *(void *)(a6 + 8);
    char v26 = *(unsigned char *)(a6 + 16);
    sub_23CAC9B20(*(void *)a6, v25, v26);
    swift_bridgeObjectRetain();
    uint64_t v27 = sub_23CAE50F0();
    uint64_t v29 = v28;
    char v31 = v30;
    uint64_t v33 = v32;
    swift_bridgeObjectRelease();
    sub_23CAC9AA4(v24, v25, v26);
    swift_bridgeObjectRelease();
    uint64_t v34 = *(void *)a6;
    uint64_t v35 = *(void *)(a6 + 8);
    char v36 = *(unsigned char *)(a6 + 16);
    *(void *)a6 = v27;
    *(void *)(a6 + 8) = v29;
    *(unsigned char *)(a6 + 16) = v31 & 1;
    *(void *)(a6 + 24) = v33;
    sub_23CAC9AA4(v34, v35, v36);
  }
  swift_bridgeObjectRelease();
  id v37 = (id)*MEMORY[0x263F27A80];
  uint64_t v38 = v94;
  sub_23CACC000((uint64_t)v37, v94, &v96);

  if (!v97) {
    goto LABEL_14;
  }
  if (swift_dynamicCast())
  {
    id v39 = (id)*MEMORY[0x263F27A88];
    sub_23CACC000((uint64_t)v39, v38, &v96);

    if (v97)
    {
      if (swift_dynamicCast())
      {
        if ((void)v95 == 2)
        {
          uint64_t v40 = sub_23CAE5280();
          uint64_t v41 = *(void *)(v40 - 8);
          uint64_t v42 = v92;
          (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v92, v40);
          uint64_t v43 = (unsigned int *)MEMORY[0x263F1B530];
        }
        else if ((void)v95)
        {
          uint64_t v40 = sub_23CAE5280();
          uint64_t v41 = *(void *)(v40 - 8);
          uint64_t v42 = v92;
          (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v92, v40);
          uint64_t v43 = (unsigned int *)MEMORY[0x263F1B540];
        }
        else
        {
          uint64_t v40 = sub_23CAE5280();
          uint64_t v41 = *(void *)(v40 - 8);
          uint64_t v42 = v92;
          (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v92, v40);
          uint64_t v43 = (unsigned int *)MEMORY[0x263F1B538];
        }
        (*(void (**)(uint64_t, void, uint64_t))(v41 + 104))(v42, *v43, v40);
        uint64_t v44 = sub_23CAE5260();
        swift_retain();
        uint64_t v45 = sub_23CAE5140();
        uint64_t v47 = v46;
        char v49 = v48;
        uint64_t v51 = v50;
        id v52 = (id)*MEMORY[0x263F27A78];
        sub_23CACC000((uint64_t)v52, v38, &v96);

        uint64_t v92 = v44;
        if (v97)
        {
          if (swift_dynamicCast())
          {
            uint64_t v53 = *(void *)a6;
            uint64_t v54 = *(void *)(a6 + 8);
            unsigned __int8 v55 = *(unsigned char *)(a6 + 16);
            int v87 = v55;
            long long v96 = v95;
            sub_23CAC9B20(v53, v54, v55);
            swift_bridgeObjectRetain();
            char v56 = v49 & 1;
            uint64_t v57 = sub_23CAE50E0();
            uint64_t v86 = v45;
            uint64_t v58 = v57;
            uint64_t v60 = v59;
            uint64_t v88 = v51;
            char v62 = v61;
            uint64_t v85 = v47;
            swift_bridgeObjectRelease();
            char v63 = v62 & 1;
            char v64 = v87;
            uint64_t v65 = sub_23CAE50F0();
            uint64_t v90 = v66;
            unint64_t v91 = v65;
            int v89 = v67;
            uint64_t v94 = v68;
            swift_release();
            sub_23CAC9AA4(v86, v85, v56);

            swift_bridgeObjectRelease();
            sub_23CAC9AA4(v58, v60, v63);
            swift_bridgeObjectRelease();
            sub_23CAC9AA4(v53, v54, v64);
            swift_bridgeObjectRelease();
            uint64_t v69 = *(void *)a6;
            uint64_t v70 = *(void *)(a6 + 8);
            char v71 = *(unsigned char *)(a6 + 16);
            uint64_t v72 = v90;
            *(void *)a6 = v91;
            *(void *)(a6 + 8) = v72;
            *(unsigned char *)(a6 + 16) = v89 & 1;
            *(void *)(a6 + 24) = v94;
            sub_23CAC9AA4(v69, v70, v71);
LABEL_26:
            swift_bridgeObjectRelease();
            return;
          }
          uint64_t v73 = v45;
        }
        else
        {
          uint64_t v73 = v45;
          sub_23CACD7A4((uint64_t)&v96, (uint64_t *)&unk_26AD6ED20);
        }
        uint64_t v74 = *(void *)a6;
        uint64_t v75 = *(void *)(a6 + 8);
        char v76 = *(unsigned char *)(a6 + 16);
        sub_23CAC9B20(*(void *)a6, v75, v76);
        swift_bridgeObjectRetain();
        uint64_t v77 = v73;
        unint64_t v91 = sub_23CAE50F0();
        uint64_t v79 = v78;
        LODWORD(v90) = v80;
        uint64_t v94 = v81;
        swift_release();
        sub_23CAC9AA4(v77, v47, v49 & 1);

        swift_bridgeObjectRelease();
        sub_23CAC9AA4(v74, v75, v76);
        swift_bridgeObjectRelease();
        uint64_t v82 = *(void *)a6;
        uint64_t v83 = *(void *)(a6 + 8);
        char v84 = *(unsigned char *)(a6 + 16);
        *(void *)a6 = v91;
        *(void *)(a6 + 8) = v79;
        *(unsigned char *)(a6 + 16) = v90 & 1;
        *(void *)(a6 + 24) = v94;
        sub_23CAC9AA4(v82, v83, v84);
        goto LABEL_26;
      }
      swift_bridgeObjectRelease();
      goto LABEL_16;
    }
    swift_bridgeObjectRelease();
LABEL_14:

    sub_23CACD7A4((uint64_t)&v96, (uint64_t *)&unk_26AD6ED20);
    return;
  }
LABEL_16:
}

uint64_t sub_23CAD5DD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v126 = a1;
  uint64_t v113 = a3;
  uint64_t v4 = sub_23CAE5270();
  uint64_t v107 = *(void *)(v4 - 8);
  uint64_t v108 = v4;
  MEMORY[0x270FA5388](v4);
  unint64_t v106 = (char *)&v106 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EC70);
  MEMORY[0x270FA5388](v116);
  v117 = (uint64_t *)((char *)&v106 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_23CAE5280();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v136 = (char *)&v106 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v106 - v11;
  uint64_t v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EBD0);
  MEMORY[0x270FA5388](v137);
  v119 = (char *)&v106 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC83A8);
  MEMORY[0x270FA5388](v14 - 8);
  v118 = (char *)&v106 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC83B0);
  MEMORY[0x270FA5388](v16 - 8);
  v122 = (char *)&v106 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8540);
  MEMORY[0x270FA5388](v120);
  uint64_t v124 = (uint64_t)&v106 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8548);
  MEMORY[0x270FA5388](v121);
  uint64_t v125 = (uint64_t)&v106 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8550);
  MEMORY[0x270FA5388](v123);
  v129 = (char *)&v106 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8558);
  MEMORY[0x270FA5388](v133);
  uint64_t v132 = (uint64_t)&v106 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8560);
  uint64_t v134 = *(void *)(v22 - 8);
  uint64_t v135 = v22;
  MEMORY[0x270FA5388](v22);
  v131 = (char *)&v106 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8568);
  uint64_t v24 = MEMORY[0x270FA5388](v130);
  char v26 = (char *)&v106 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = MEMORY[0x270FA5388](v24);
  v128 = (char *)&v106 - v28;
  MEMORY[0x270FA5388](v27);
  uint64_t v114 = (char *)&v106 - v29;
  uint64_t v127 = a2;
  char v30 = *(void **)(a2 + 24);
  v142[0] = xmmword_23CAE67D0;
  LOBYTE(v142[1]) = 0;
  *((void *)&v142[1] + 1) = MEMORY[0x263F8EE78];
  uint64_t v31 = v8;
  uint64_t v32 = *(void (**)(char *, void, uint64_t))(v8 + 104);
  uint64_t v33 = v7;
  v32(v12, *MEMORY[0x263F1B540], v7);
  id v34 = objc_msgSend(v30, sel_length);
  uint64_t v35 = (void *)swift_allocObject();
  v35[2] = v30;
  v35[3] = v142;
  char v36 = v12;
  v35[4] = v12;
  uint64_t v37 = swift_allocObject();
  *(void *)(v37 + 16) = sub_23CAD87E8;
  *(void *)(v37 + 24) = v35;
  uint64_t v115 = v35;
  v148 = sub_23CAD1980;
  uint64_t v149 = v37;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v145 = 1107296256;
  v146 = sub_23CADFE0C;
  v147 = &block_descriptor_1;
  uint64_t v38 = _Block_copy(&aBlock);
  id v39 = v30;
  swift_retain();
  swift_release();
  objc_msgSend(v39, sel_enumerateAttributesInRange_options_usingBlock_, 0, v34, 0, v38);
  _Block_release(v38);
  LOBYTE(v34) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v34)
  {
    __break(1u);
LABEL_23:
    __break(1u);
    return result;
  }
  uint64_t v109 = v26;
  uint64_t v41 = *((void *)&v142[0] + 1);
  uint64_t v110 = *(void *)&v142[0];
  char v42 = v142[1];
  uint64_t v111 = *((void *)&v142[1] + 1);
  long long v112 = v36;
  uint64_t v43 = v31;
  uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
  uint64_t v45 = v136;
  v44(v136, v36, v33);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v47 = v117;
  char v48 = v45;
  uint64_t v49 = v33;
  v44((char *)v117 + *(int *)(v116 + 28), v48, v33);
  *uint64_t v47 = KeyPath;
  uint64_t v50 = (uint64_t)v119;
  sub_23CACDC60((uint64_t)v47, (uint64_t)&v119[*(int *)(v137 + 36)], &qword_26AD6EC70);
  uint64_t v52 = v111;
  uint64_t v51 = v110;
  *(void *)uint64_t v50 = v110;
  *(void *)(v50 + 8) = v41;
  *(unsigned char *)(v50 + 16) = v42;
  *(void *)(v50 + 24) = v52;
  swift_bridgeObjectRetain();
  sub_23CAC9B20(v51, v41, v42);
  swift_bridgeObjectRetain();
  sub_23CAC9B20(v51, v41, v42);
  sub_23CACD7A4((uint64_t)v47, &qword_26AD6EC70);
  uint64_t v53 = *(void (**)(char *, uint64_t))(v43 + 8);
  v53(v136, v49);
  sub_23CAC9AA4(v51, v41, v42);
  swift_bridgeObjectRelease();
  v53(v112, v49);
  sub_23CAC9AA4(*(uint64_t *)&v142[0], *((uint64_t *)&v142[0] + 1), v142[1]);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v54 = v127;
  sub_23CAD8900();
  uint64_t v55 = (uint64_t)v118;
  sub_23CAE51C0();
  sub_23CACD7A4(v50, &qword_26AD6EBD0);
  uint64_t v56 = v126;
  char v57 = *(unsigned char *)(v126 + 16);
  if (v57) {
    sub_23CAE5340();
  }
  else {
    sub_23CAE5350();
  }
  uint64_t v58 = (uint64_t)v129;
  uint64_t v59 = (uint64_t)v122;
  sub_23CACCB74();
  sub_23CACD7A4(v55, &qword_268BC83A8);
  uint64_t v60 = swift_getKeyPath();
  uint64_t v61 = v124;
  sub_23CACDC60(v59, v124, &qword_268BC83B0);
  uint64_t v62 = v61 + *(int *)(v120 + 36);
  *(void *)uint64_t v62 = v60;
  *(unsigned char *)(v62 + 8) = 0;
  sub_23CACD7A4(v59, &qword_268BC83B0);
  uint64_t v63 = sub_23CAD6DD0(v54);
  uint64_t v64 = swift_getKeyPath();
  uint64_t v65 = v125;
  sub_23CACDC60(v61, v125, &qword_268BC8540);
  uint64_t v66 = (uint64_t *)(v65 + *(int *)(v121 + 36));
  *uint64_t v66 = v64;
  v66[1] = v63;
  sub_23CACD7A4(v61, &qword_268BC8540);
  uint64_t v67 = sub_23CAE5200();
  uint64_t v68 = sub_23CAE5340();
  uint64_t v70 = v69;
  sub_23CACDC60(v65, v58, &qword_268BC8548);
  char v71 = (uint64_t *)(v58 + *(int *)(v123 + 36));
  *char v71 = v67;
  v71[1] = v68;
  v71[2] = v70;
  sub_23CACD7A4(v65, &qword_268BC8548);
  if (*(unsigned char *)(v54 + 17) == 1)
  {
    uint64_t v72 = v133;
    if (v57)
    {
      id v73 = objc_msgSend(self, sel_secondaryLabelColor);
      uint64_t v74 = MEMORY[0x23ECF0E30](v73);
    }
    else
    {
      uint64_t v74 = sub_23CAE5210();
    }
    uint64_t v77 = v74;
  }
  else
  {
    char v75 = *(unsigned char *)(v56 + 64);
    uint64_t v76 = swift_retain();
    uint64_t v77 = sub_23CAD17FC(v76, v75);
    swift_release();
    uint64_t v72 = v133;
  }
  uint64_t v78 = (uint64_t)v114;
  uint64_t v79 = swift_getKeyPath();
  uint64_t v80 = v132;
  sub_23CACDC60(v58, v132, &qword_268BC8550);
  uint64_t v81 = (uint64_t *)(v80 + *(int *)(v72 + 36));
  *uint64_t v81 = v79;
  v81[1] = v77;
  sub_23CACD7A4(v58, &qword_268BC8550);
  if (*(unsigned char *)(v54 + 16) == 1) {
    sub_23CAE4FE0();
  }
  else {
    sub_23CAE4FD0();
  }
  sub_23CAD8A60();
  uint64_t v82 = v131;
  sub_23CAE5190();
  sub_23CACD7A4(v80, &qword_268BC8558);
  uint64_t v84 = v134;
  uint64_t v83 = v135;
  uint64_t v85 = (uint64_t)v128;
  (*(void (**)(char *, char *, uint64_t))(v134 + 16))(v128, v82, v135);
  *(_WORD *)(v85 + *(int *)(v130 + 36)) = 256;
  (*(void (**)(char *, uint64_t))(v84 + 8))(v82, v83);
  sub_23CACD7F8(v85, v78, &qword_268BC8568);
  uint64_t v143 = 0;
  double v138 = 0.0;
  double v139 = 0.0;
  char v140 = 1;
  uint64_t v86 = *(void **)(v54 + 24);
  id v87 = objc_msgSend(v86, sel_length);
  uint64_t v88 = swift_allocObject();
  *(void *)(v88 + 16) = &v143;
  *(void *)(v88 + 24) = &v138;
  uint64_t v89 = swift_allocObject();
  *(void *)(v89 + 16) = sub_23CAD8E54;
  *(void *)(v89 + 24) = v88;
  v148 = sub_23CAD9210;
  uint64_t v149 = v89;
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v145 = 1107296256;
  v146 = sub_23CADFE0C;
  v147 = &block_descriptor_43;
  uint64_t v90 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v86, sel_enumerateAttributesInRange_options_usingBlock_, 0, v87, 0, v90);
  _Block_release(v90);
  LOBYTE(v86) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v86) {
    goto LABEL_23;
  }
  if (v143)
  {
    double v91 = v138;
    double v92 = v139;
    char v93 = v140;
    swift_release();
    uint64_t v94 = (uint64_t)v109;
    uint64_t v95 = *MEMORY[0x263F1B4B8];
    uint64_t v97 = v106;
    uint64_t v96 = v107;
    if (v93)
    {
      uint64_t v98 = v108;
      (*(void (**)(char *, uint64_t, uint64_t))(v107 + 104))(v106, v95, v108);
      swift_retain();
      uint64_t v99 = sub_23CAE5290();
      swift_release();
      (*(void (**)(char *, uint64_t))(v96 + 8))(v97, v98);
      uint64_t aBlock = v99;
      sub_23CAD8F70((uint64_t)&aBlock);
    }
    else
    {
      uint64_t v101 = v108;
      (*(void (**)(char *, uint64_t, uint64_t))(v107 + 104))(v106, v95, v108);
      swift_retain();
      uint64_t v102 = sub_23CAE5290();
      swift_release();
      (*(void (**)(char *, uint64_t))(v96 + 8))(v97, v101);
      uint64_t v103 = sub_23CAE5340();
      ((void (*)(void *__return_ptr, void, void, void, void, void, void, void, void, void, _BYTE, void, _BYTE, void, void, void))sub_23CACCBAC)(&aBlock, 0, 1, 0, 1, v91 * (16.0 / v92), 0, 0, 1, 0, 1, 0x4030000000000000, 0, v103, v104, v102);
      swift_release();
      sub_23CAD8FF0((uint64_t)&aBlock);
    }
    sub_23CACD7F8((uint64_t)&aBlock, (uint64_t)v142, &qword_268BC85B0);
    swift_retain_n();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BC85B8);
    sub_23CAD8F7C();
    sub_23CAE4EC0();
    swift_release_n();
    swift_release();
    memcpy(v142, v141, 0x79uLL);
    memcpy(v141, v142, 0x79uLL);
    nullsub_1(v141);
    sub_23CACD7F8((uint64_t)v141, (uint64_t)&aBlock, &qword_268BC85A0);
    uint64_t v100 = v113;
  }
  else
  {
    swift_release();
    sub_23CAD8E60((uint64_t)v142);
    sub_23CACD7F8((uint64_t)v142, (uint64_t)&aBlock, &qword_268BC85A0);
    uint64_t v100 = v113;
    uint64_t v94 = (uint64_t)v109;
  }
  sub_23CACDC60(v78, v94, &qword_268BC8568);
  sub_23CACD7F8((uint64_t)&aBlock, (uint64_t)&v138, &qword_268BC85A0);
  sub_23CACDC60(v94, v100, &qword_268BC8568);
  uint64_t v105 = v100 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BC85A8) + 48);
  sub_23CACD7F8((uint64_t)&v138, (uint64_t)v141, &qword_268BC85A0);
  sub_23CACD7F8((uint64_t)v141, v105, &qword_268BC85A0);
  sub_23CAD8EC4((uint64_t)v141, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_23CAD8E84);
  sub_23CACD7A4(v78, &qword_268BC8568);
  sub_23CACD7F8((uint64_t)&v138, (uint64_t)v142, &qword_268BC85A0);
  sub_23CAD8EC4((uint64_t)v142, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_23CAD8F30);
  return sub_23CACD7A4(v94, &qword_268BC8568);
}

uint64_t sub_23CAD6DD0(uint64_t a1)
{
  switch(*(unsigned char *)(a1 + 18))
  {
    case 1:
      goto LABEL_3;
    case 2:
      return sub_23CAE5030();
    case 3:
      if ((*(unsigned char *)(v1 + 16) & 1) == 0) {
        goto LABEL_7;
      }
      uint64_t result = sub_23CAE5000();
      break;
    case 4:
      return MEMORY[0x270F02B90]();
    default:
      if (*(unsigned char *)(v1 + 16)) {
LABEL_7:
      }
        uint64_t result = sub_23CAE4F80();
      else {
LABEL_3:
      }
        uint64_t result = sub_23CAE5020();
      break;
  }
  return result;
}

uint64_t sub_23CAD6E28()
{
  unint64_t v0 = sub_23CAE56C0();
  swift_bridgeObjectRelease();
  if (v0 >= 5) {
    return 5;
  }
  else {
    return v0;
  }
}

void sub_23CAD6E74(uint64_t a1@<X8>)
{
  memcpy(__dst, v1, sizeof(__dst));
  sub_23CAD4EDC(a1);
}

uint64_t sub_23CAD6EB8(char a1)
{
  uint64_t result = 0x746C7561666564;
  switch(a1)
  {
    case 1:
      uint64_t result = 0x65746F6E746F6F66;
      break;
    case 2:
      uint64_t result = 0x656E696C64616568;
      break;
    case 3:
      uint64_t result = 0x656772616CLL;
      break;
    case 4:
      uint64_t result = 0x72614C6172747865;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_23CAD6F68()
{
  return sub_23CAE5730();
}

uint64_t sub_23CAD6FB0(unsigned __int8 *a1, char *a2)
{
  return sub_23CAD3DF4(*a1, *a2);
}

uint64_t sub_23CAD6FBC()
{
  return sub_23CADAFA8(*v0);
}

uint64_t sub_23CAD6FC4()
{
  return sub_23CAD4060();
}

uint64_t sub_23CAD6FCC(uint64_t a1)
{
  return sub_23CADB008(a1, *v1);
}

uint64_t sub_23CAD6FD4@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23CAD6E28();
  *a1 = result;
  return result;
}

uint64_t sub_23CAD7004@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23CAD6EB8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23CAD7030()
{
  return sub_23CAD6F68();
}

uint64_t sub_23CAD7038()
{
  return sub_23CAE5730();
}

void sub_23CAD707C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6)
{
  if (!*(void *)(a1 + 16))
  {
    long long v39 = 0u;
    long long v40 = 0u;
    goto LABEL_11;
  }
  id v9 = (id)*MEMORY[0x263F27A18];
  unint64_t v10 = sub_23CACD26C((uint64_t)v9);
  if ((v11 & 1) == 0)
  {
    long long v39 = 0u;
    long long v40 = 0u;

    goto LABEL_11;
  }
  sub_23CACD210(*(void *)(a1 + 56) + 32 * v10, (uint64_t)&v39);

  if (!*((void *)&v40 + 1))
  {
LABEL_11:
    sub_23CACD7A4((uint64_t)&v39, (uint64_t *)&unk_26AD6ED20);
    goto LABEL_12;
  }
  if (swift_dynamicCast())
  {
    sub_23CAD21F0(0, (unint64_t *)&qword_268BC8308);
    uint64_t v12 = qword_268BC8250;
    swift_bridgeObjectRetain();
    if (v12 != -1) {
      swift_once();
    }
    uint64_t v13 = (void *)qword_268BC9D80;
    id v14 = (id)qword_268BC9D80;
    id v15 = sub_23CACEE18(v37, v38, v13);
    if (v15)
    {
      uint64_t v16 = v15;
      id v17 = v14;
      *a5 = sub_23CAE52A0();
      swift_release();
      objc_msgSend(v16, sel_size);
      double v19 = v18;
      objc_msgSend(v16, sel_scale);
      double v21 = v19 / v20;
      objc_msgSend(v16, sel_size);
      double v23 = v22;
      objc_msgSend(v16, sel_scale);
      double v25 = v24;

      *(double *)a6 = v21;
      *(double *)(a6 + 8) = v23 / v25;
      *(unsigned char *)(a6 + 16) = 0;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
LABEL_12:
  if (*a5) {
    return;
  }
  id v26 = (id)*MEMORY[0x263F279E0];
  sub_23CACC000((uint64_t)v26, a1, &v39);

  if (!*((void *)&v40 + 1)) {
    goto LABEL_26;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EC80);
  if ((swift_dynamicCast() & 1) == 0) {
    return;
  }
  uint64_t v27 = sub_23CAE5460();
  sub_23CACBF9C(v27, v28, v37, &v39);
  swift_bridgeObjectRelease();
  if (!*((void *)&v40 + 1))
  {
    swift_bridgeObjectRelease();
LABEL_26:
    sub_23CACD7A4((uint64_t)&v39, (uint64_t *)&unk_26AD6ED20);
    return;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v29 = sub_23CAE5460();
  sub_23CACBF9C(v29, v30, v37, &v39);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v40 + 1))
  {
    sub_23CACA27C(v37, v38);
    goto LABEL_26;
  }
  if ((swift_dynamicCast() & 1) != 0
    && (sub_23CAD21F0(0, (unint64_t *)&qword_268BC8308),
        sub_23CACA224(v37, v38),
        (id v31 = sub_23CADDA24(v37, v38, *(double *)&v37)) != 0))
  {
    id v32 = v31;
    *a5 = sub_23CAE5240();
    swift_release();
    objc_msgSend(v32, sel_size);
    double v34 = v33 / *(double *)&v37;
    objc_msgSend(v32, sel_size);
    double v36 = v35;
    sub_23CACA27C(v37, v38);

    *(double *)a6 = v34;
    *(double *)(a6 + 8) = v36 / *(double *)&v37;
    *(unsigned char *)(a6 + 16) = 0;
  }
  else
  {
    sub_23CACA27C(v37, v38);
  }
}

uint64_t sub_23CAD7464(uint64_t a1, uint64_t a2)
{
  BOOL v4 = *(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8);
  if (!v4 && (sub_23CAE56E0() & 1) == 0
    || *(unsigned __int8 *)(a1 + 16) != *(unsigned __int8 *)(a2 + 16)
    || *(unsigned __int8 *)(a1 + 17) != *(unsigned __int8 *)(a2 + 17))
  {
    return 0;
  }
  char v5 = *(unsigned char *)(a2 + 18);
  uint64_t v6 = sub_23CAD6EB8(*(unsigned char *)(a1 + 18));
  uint64_t v8 = v7;
  if (v6 == sub_23CAD6EB8(v5) && v8 == v9)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v11 = sub_23CAE56E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0) {
      return 0;
    }
  }
  if (*(unsigned __int8 *)(a1 + 19) != *(unsigned __int8 *)(a2 + 19)) {
    return 0;
  }
  if (*(unsigned __int8 *)(a1 + 20) != *(unsigned __int8 *)(a2 + 20)) {
    return 0;
  }
  sub_23CAD21F0(0, &qword_26AD6ECF8);
  if ((sub_23CAE55F0() & 1) == 0) {
    return 0;
  }
  uint64_t v12 = *(int *)(type metadata accessor for FlexListItem() + 44);
  return MEMORY[0x270EF0CB0](a1 + v12, a2 + v12);
}

void sub_23CAD75D4()
{
  sub_23CAE5720();
  sub_23CAE5720();
  sub_23CAD6EB8(*(unsigned char *)(v0 + 18));
  sub_23CAE5480();
  swift_bridgeObjectRelease();
  sub_23CAE5710();
  sub_23CAE5710();
  id v1 = *(id *)(v0 + 24);
  sub_23CAE5600();
}

uint64_t sub_23CAD7680()
{
  return sub_23CAE5730();
}

uint64_t sub_23CAD76C8()
{
  return sub_23CAE5730();
}

uint64_t sub_23CAD7704@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for FlexListItem() + 44);
  sub_23CAE4C20();
  OUTLINED_FUNCTION_10();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v6(a1, v3, v4);
}

uint64_t sub_23CAD7778()
{
  return sub_23CAD8E08(&qword_268BC84D0, (void (*)(uint64_t))type metadata accessor for FlexListItem);
}

uint64_t type metadata accessor for FlexListItem()
{
  uint64_t result = qword_26AD6EB60;
  if (!qword_26AD6EB60) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_23CAD7808(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    void *v3 = *a2;
    uint64_t v3 = (void *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v5;
    *(_DWORD *)(a1 + 16) = *((_DWORD *)a2 + 4);
    *(unsigned char *)(a1 + 20) = *((unsigned char *)a2 + 20);
    uint64_t v6 = (void *)a2[3];
    *(void *)(a1 + 24) = v6;
    uint64_t v7 = *(int *)(a3 + 44);
    uint64_t v8 = a1 + v7;
    uint64_t v9 = (uint64_t)a2 + v7;
    uint64_t v10 = sub_23CAE4C20();
    char v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    id v12 = v6;
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t sub_23CAD790C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();

  uint64_t v4 = a1 + *(int *)(a2 + 44);
  uint64_t v5 = sub_23CAE4C20();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t sub_23CAD798C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  uint64_t v5 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v5;
  uint64_t v6 = *(int *)(a3 + 44);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_23CAE4C20();
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  id v11 = v5;
  v10(v7, v8, v9);
  return a1;
}

uint64_t sub_23CAD7A40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  *(unsigned char *)(a1 + 19) = *(unsigned char *)(a2 + 19);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  uint64_t v6 = *(void **)(a2 + 24);
  uint64_t v7 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v6;
  id v8 = v6;

  uint64_t v9 = *(int *)(a3 + 44);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = sub_23CAE4C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_23CAD7B18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 20) = *(unsigned char *)(a2 + 20);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 44);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = sub_23CAE4C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t sub_23CAD7BAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(a1 + 17) = *(unsigned char *)(a2 + 17);
  *(unsigned char *)(a1 + 18) = *(unsigned char *)(a2 + 18);
  *(_WORD *)(a1 + 19) = *(_WORD *)(a2 + 19);
  uint64_t v7 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  uint64_t v8 = *(int *)(a3 + 44);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_23CAE4C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_23CAD7C68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_23CAD7C7C);
}

uint64_t sub_23CAD7C7C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_23CAE4C20();
    uint64_t v9 = a1 + *(int *)(a3 + 44);
    return __swift_getEnumTagSinglePayload(v9, a2, v8);
  }
}

uint64_t sub_23CAD7D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_23CAD7D18);
}

uint64_t sub_23CAD7D18(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_23CAE4C20();
    uint64_t v8 = v5 + *(int *)(a4 + 44);
    return __swift_storeEnumTagSinglePayload(v8, a2, a2, v7);
  }
  return result;
}

uint64_t sub_23CAD7D98()
{
  uint64_t result = sub_23CAE4C20();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

void type metadata accessor for FlexListItem.Spacing()
{
}

uint64_t sub_23CAD7E84(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
    if (a2 + 4 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 4) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v5 = v6 - 5;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_23CAD7F0C(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x23CAD7FD8);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_23CAD8000(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_23CAD8008(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

void type metadata accessor for FlexListItem.Size()
{
}

unint64_t sub_23CAD8020()
{
  unint64_t result = qword_268BC84D8;
  if (!qword_268BC84D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC84D8);
  }
  return result;
}

unint64_t sub_23CAD8070()
{
  unint64_t result = qword_268BC84E0;
  if (!qword_268BC84E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC84E0);
  }
  return result;
}

uint64_t sub_23CAD80C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FlexListItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23CAD8128(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for FlexListItem();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23CAD818C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for FlexListItem();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23CAD81E8(uint64_t a1)
{
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 48))
  {
    uint64_t v2 = *(void **)(a1 + 24);
    swift_bridgeObjectRelease();
  }
  return swift_release();
}

uint64_t sub_23CAD8240(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 48);
  id v7 = v4;
  swift_bridgeObjectRetain();
  if (v6)
  {
    uint64_t v8 = *(void **)(a2 + 24);
    *(void *)(a1 + 24) = v8;
    *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = v6;
    id v9 = v8;
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v10 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v10;
  }
  char v11 = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = v11;
  swift_retain();
  return a1;
}

uint64_t sub_23CAD82E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  id v7 = (_OWORD *)(a1 + 24);
  uint64_t v8 = (_OWORD *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 48);
  if (*(void *)(a1 + 48))
  {
    if (v9)
    {
      long long v10 = *(void **)(a1 + 24);
      char v11 = *(void **)(a2 + 24);
      *(void *)(a1 + 24) = v11;
      id v12 = v11;

      *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
      *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_23CAD841C(a1 + 24);
      long long v15 = *(_OWORD *)(a2 + 40);
      *id v7 = *v8;
      *(_OWORD *)(a1 + 40) = v15;
    }
  }
  else if (v9)
  {
    uint64_t v13 = *(void **)(a2 + 24);
    *(void *)(a1 + 24) = v13;
    *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
    *(unsigned char *)(a1 + 33) = *(unsigned char *)(a2 + 33);
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    id v14 = v13;
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v16 = *(_OWORD *)(a2 + 40);
    *id v7 = *v8;
    *(_OWORD *)(a1 + 40) = v16;
  }
  char v17 = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = v17;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_23CAD841C(uint64_t a1)
{
  return a1;
}

void *__swift_memcpy65_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x41uLL);
}

uint64_t sub_23CAD8478(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  if (!*(void *)(a1 + 48)) {
    goto LABEL_5;
  }
  uint64_t v5 = *(void *)(a2 + 48);
  if (!v5)
  {
    sub_23CAD841C(a1 + 24);
LABEL_5:
    long long v7 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 40) = v7;
    goto LABEL_6;
  }
  id v6 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
LABEL_6:
  char v8 = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = v8;
  swift_release();
  return a1;
}

uint64_t sub_23CAD8544(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 65))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_23CAD8584(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 65) = 1;
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
    *(unsigned char *)(result + 65) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for FlexListItemView()
{
}

uint64_t sub_23CAD85E4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23CAD8600(uint64_t a1)
{
  return a1;
}

void *sub_23CAD8634(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    id v4 = result;
    return (void *)swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_23CAD8674()
{
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 64))
  {

    swift_bridgeObjectRelease();
  }
  swift_release();
  return MEMORY[0x270FA0238](v0, 81, 7);
}

uint64_t sub_23CAD86D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23CAD5374(a1, a2);
}

uint64_t sub_23CAD86F8(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(id *)a1;
  swift_bridgeObjectRetain();
  sub_23CAD8634(v2, v3, v4, v5);
  swift_retain();
  return a1;
}

void sub_23CAD876C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_23CAD87B0()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_23CAD87E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23CAD5670(a1, a2, a3, a4, *(void **)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_23CAD8810()
{
  return sub_23CAE4D30();
}

uint64_t sub_23CAD8834(uint64_t a1)
{
  uint64_t v2 = sub_23CAE5280();
  MEMORY[0x270FA5388](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_23CAE4D40();
}

unint64_t sub_23CAD8900()
{
  unint64_t result = qword_26AD6EBC8;
  if (!qword_26AD6EBC8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD6EBD0);
    sub_23CACA8C8(&qword_26AD6EC68, &qword_26AD6EC70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD6EBC8);
  }
  return result;
}

uint64_t sub_23CAD89A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23CAE4DD0();
  *a1 = result;
  return result;
}

uint64_t sub_23CAD89D4()
{
  return sub_23CAE4DE0();
}

uint64_t sub_23CAD8A04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_23CAE4D90();
  *a1 = result;
  return result;
}

uint64_t sub_23CAD8A30()
{
  return sub_23CAE4DA0();
}

unint64_t sub_23CAD8A60()
{
  unint64_t result = qword_268BC8570;
  if (!qword_268BC8570)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC8558);
    sub_23CAD8B00();
    sub_23CACA8C8(&qword_26AD6EC58, &qword_26AD6EC60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8570);
  }
  return result;
}

unint64_t sub_23CAD8B00()
{
  unint64_t result = qword_268BC8578;
  if (!qword_268BC8578)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC8550);
    sub_23CAD8BA0();
    sub_23CACA8C8(&qword_26AD6EC28, &qword_26AD6EC30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8578);
  }
  return result;
}

unint64_t sub_23CAD8BA0()
{
  unint64_t result = qword_268BC8580;
  if (!qword_268BC8580)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC8548);
    sub_23CAD8C40();
    sub_23CACA8C8(&qword_26AD6EC48, &qword_26AD6EC50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8580);
  }
  return result;
}

unint64_t sub_23CAD8C40()
{
  unint64_t result = qword_268BC8588;
  if (!qword_268BC8588)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC8540);
    sub_23CAD8CE0();
    sub_23CACA8C8(&qword_26AD6EC38, &qword_26AD6EC40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8588);
  }
  return result;
}

unint64_t sub_23CAD8CE0()
{
  unint64_t result = qword_268BC8590;
  if (!qword_268BC8590)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC83B0);
    sub_23CAD8D5C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8590);
  }
  return result;
}

unint64_t sub_23CAD8D5C()
{
  unint64_t result = qword_268BC8598;
  if (!qword_268BC8598)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC83A8);
    sub_23CAD8900();
    sub_23CAD8E08((unint64_t *)&qword_268BC8390, MEMORY[0x263F1A470]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8598);
  }
  return result;
}

uint64_t sub_23CAD8E08(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_23CAD8E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23CAD707C(a1, a2, a3, a4, *(uint64_t **)(v4 + 16), *(void *)(v4 + 24));
}

double sub_23CAD8E60(uint64_t a1)
{
  *(void *)(a1 + 112) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(unsigned char *)(a1 + 120) = -1;
  return result;
}

uint64_t sub_23CAD8E84(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned __int8 a16)
{
  if (a16 != 255) {
    return j__swift_retain(result, a2, a3, a4, a5, a6, a7);
  }
  return result;
}

uint64_t sub_23CAD8EC4(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 120);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), v4);
  return a1;
}

uint64_t sub_23CAD8F30(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned __int8 a16)
{
  if (a16 != 255) {
    return j__swift_release(result, a2, a3, a4, a5, a6, a7);
  }
  return result;
}

uint64_t sub_23CAD8F70(uint64_t result)
{
  *(unsigned char *)(result + 120) = 1;
  return result;
}

unint64_t sub_23CAD8F7C()
{
  unint64_t result = qword_268BC85C0;
  if (!qword_268BC85C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC85B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC85C0);
  }
  return result;
}

uint64_t sub_23CAD8FF0(uint64_t result)
{
  *(unsigned char *)(result + 120) = 0;
  return result;
}

uint64_t sub_23CAD8FF8(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 3) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_23CAD9080(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x23CAD914CLL);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

void type metadata accessor for LeadingItemType()
{
}

uint64_t sub_23CAD9180()
{
  return sub_23CACA8C8(&qword_268BC85C8, &qword_268BC85D0);
}

unint64_t sub_23CAD91C0()
{
  unint64_t result = qword_268BC85D8;
  if (!qword_268BC85D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC85D8);
  }
  return result;
}

uint64_t destroy for FlexListView()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s33AppleMediaServicesUIPaymentSheets12FlexListViewVwCP_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FlexListView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  return a1;
}

uint64_t __swift_memcpy10_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t assignWithTake for FlexListView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  return a1;
}

uint64_t getEnumTagSinglePayload for FlexListView(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 10))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FlexListView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 8) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 10) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 10) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for FlexListView()
{
  return &type metadata for FlexListView;
}

uint64_t sub_23CAD93B4()
{
  return swift_getOpaqueTypeConformance2();
}

BOOL sub_23CAD93D0(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_23CAD93E0()
{
  return sub_23CAE5710();
}

uint64_t sub_23CAD9408()
{
  return sub_23CAE5730();
}

BOOL sub_23CAD9450(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_23CAD93D0(*a1, *a2);
}

uint64_t sub_23CAD945C()
{
  return sub_23CAD9408();
}

uint64_t sub_23CAD9464()
{
  return sub_23CAD93E0();
}

uint64_t sub_23CAD946C()
{
  uint64_t v0 = sub_23CAE56C0();
  swift_bridgeObjectRelease();
  if (v0 == 1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 2;
  }
  if (v0) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t sub_23CAD94C0@<X0>(uint64_t a1@<X0>, __int16 a2@<W1>, uint64_t a3@<X8>)
{
  char v3 = a2;
  char v6 = HIBYTE(a2);
  char v7 = a2 & 1;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC85E0);
  MEMORY[0x270FA5388](v8 - 8);
  long long v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3) {
    uint64_t v11 = sub_23CAE4EA0();
  }
  else {
    uint64_t v11 = sub_23CAE4EB0();
  }
  *(void *)long long v10 = v11;
  *((void *)v10 + 1) = 0;
  v10[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC85E8);
  unint64_t v12 = swift_bridgeObjectRetain();
  uint64_t v13 = sub_23CAD9D64(v12);
  swift_bridgeObjectRelease();
  v17[1] = v13;
  swift_getKeyPath();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a1;
  *(unsigned char *)(v14 + 24) = v7;
  *(unsigned char *)(v14 + 25) = v6 & 1;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_23CAD9F78;
  *(void *)(v15 + 24) = v14;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC85F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC85F8);
  sub_23CACA8C8(&qword_268BC8600, &qword_268BC85F0);
  sub_23CACA8C8(&qword_268BC8608, &qword_268BC85F8);
  sub_23CAE5320();
  return sub_23CADA068((uint64_t)v10, a3, &qword_268BC85E0);
}

uint64_t sub_23CAD96E0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, __int16 a3@<W3>, uint64_t a4@<X8>)
{
  char v75 = (void *)a1;
  uint64_t v72 = a4;
  uint64_t v6 = sub_23CAE5310();
  uint64_t v71 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EBE8);
  uint64_t v9 = MEMORY[0x270FA5388](v74);
  uint64_t v11 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v70 - v12;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EBF0);
  uint64_t v15 = MEMORY[0x270FA5388](v14 - 8);
  char v17 = (char *)&v70 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v15);
  uint64_t v77 = (uint64_t)&v70 - v18;
  id v19 = objc_msgSend(a2, sel_padding);
  sub_23CAE5460();

  sub_23CAD946C();
  id v20 = objc_msgSend(a2, sel_label);
  int v73 = a3 & 1;
  char v22 = sub_23CAD9C40(v20, (uint64_t)v75, v21, a3 & 0x101);

  uint64_t v76 = v17;
  if (v22)
  {
    uint64_t v23 = v71;
    sub_23CAE5300();
    unsigned __int8 v24 = sub_23CAE4F50();
    char v25 = sub_23CAE4F60();
    sub_23CAE4F60();
    if (sub_23CAE4F60() != v24) {
      char v25 = sub_23CAE4F60();
    }
    sub_23CAE4C50();
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    uint64_t v31 = v30;
    uint64_t v33 = v32;
    uint64_t v34 = v6;
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v11, v8, v6);
    uint64_t v35 = v74;
    double v36 = &v11[*(int *)(v74 + 36)];
    char *v36 = v25;
    *((void *)v36 + 1) = v27;
    *((void *)v36 + 2) = v29;
    *((void *)v36 + 3) = v31;
    *((void *)v36 + 4) = v33;
    v36[40] = 0;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v34);
    sub_23CADA068((uint64_t)v11, (uint64_t)v13, &qword_26AD6EBE8);
    uint64_t v37 = (uint64_t)v13;
    uint64_t v38 = v77;
    sub_23CADA068(v37, v77, &qword_26AD6EBE8);
    uint64_t v39 = 0;
  }
  else
  {
    uint64_t v39 = 1;
    uint64_t v38 = v77;
    uint64_t v35 = v74;
  }
  char v40 = v73;
  __swift_storeEnumTagSinglePayload(v38, v39, 1, v35);
  id v41 = objc_msgSend(a2, sel_label);
  id v42 = objc_msgSend(a2, sel_image);
  id v43 = objc_msgSend(a2, sel_accessibilityIdentifier);
  uint64_t v44 = sub_23CAE5460();
  uint64_t v46 = v45;

  sub_23CAD41D8(v41, v42, v40, v44, v46, (uint64_t)v78);
  uint64_t v47 = v78[1];
  char v75 = (void *)v78[0];
  char v48 = v80;
  uint64_t v49 = v81;
  uint64_t v50 = v82;
  uint64_t v51 = v83;
  uint64_t v52 = v84;
  int v73 = v85;
  LODWORD(v74) = v79;
  LOBYTE(v42) = sub_23CAE4F50();
  unsigned __int8 v53 = sub_23CAE4F70();
  char v54 = sub_23CAE4F60();
  sub_23CAE4F60();
  if (sub_23CAE4F60() != v42) {
    char v54 = sub_23CAE4F60();
  }
  sub_23CAE4F60();
  if (sub_23CAE4F60() != v53) {
    char v54 = sub_23CAE4F60();
  }
  uint64_t v55 = v72;
  sub_23CAE4C50();
  uint64_t v57 = v56;
  uint64_t v59 = v58;
  uint64_t v61 = v60;
  uint64_t v63 = v62;
  uint64_t v65 = (uint64_t)v76;
  uint64_t v64 = v77;
  sub_23CADA000(v77, (uint64_t)v76);
  sub_23CADA000(v65, v55);
  uint64_t v66 = v55 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BC8610) + 48);
  uint64_t v67 = v75;
  *(void *)uint64_t v66 = v75;
  *(void *)(v66 + 8) = v47;
  *(unsigned char *)(v66 + 16) = v74;
  *(void *)(v66 + 24) = v48;
  *(void *)(v66 + 32) = v49;
  *(void *)(v66 + 40) = v50;
  *(void *)(v66 + 48) = v51;
  *(void *)(v66 + 56) = v52;
  *(unsigned char *)(v66 + 64) = v73;
  *(unsigned char *)(v66 + 72) = v54;
  *(void *)(v66 + 80) = v57;
  *(void *)(v66 + 88) = v59;
  *(void *)(v66 + 96) = v61;
  *(void *)(v66 + 104) = v63;
  *(unsigned char *)(v66 + 112) = 0;
  id v68 = v67;
  swift_bridgeObjectRetain();
  sub_23CAD8634(v48, v49, v50, v51);
  swift_retain();
  sub_23CAC9B30(v64, &qword_26AD6EBF0);
  swift_bridgeObjectRelease();

  sub_23CAD876C(v48, v49, v50, v51);
  swift_release();
  return sub_23CAC9B30(v65, &qword_26AD6EBF0);
}

uint64_t sub_23CAD9C40(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (!a2) {
    return (a4 >> 8) & 1;
  }
  id v4 = objc_msgSend(a1, sel_attributesAtIndex_effectiveRange_, 0, 0);
  type metadata accessor for Key(0);
  sub_23CADA0CC();
  uint64_t v5 = sub_23CAE5400();

  id v6 = (id)*MEMORY[0x263F27A10];
  sub_23CACC000((uint64_t)v6, v5, &v9);

  swift_bridgeObjectRelease();
  if (v10)
  {
    if (swift_dynamicCast()) {
      return v8;
    }
  }
  else
  {
    sub_23CAC9B30((uint64_t)&v9, (uint64_t *)&unk_26AD6ED20);
  }
  return 1;
}

uint64_t sub_23CAD9D44@<X0>(uint64_t a1@<X8>)
{
  if (*(unsigned char *)(v1 + 9)) {
    __int16 v2 = 256;
  }
  else {
    __int16 v2 = 0;
  }
  return sub_23CAD94C0(*(void *)v1, v2 | *(unsigned __int8 *)(v1 + 8), a1);
}

uint64_t sub_23CAD9D64(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_33;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  for (uint64_t result = swift_bridgeObjectRetain(); ; v2 = result)
  {
    id v4 = (void *)MEMORY[0x263F8EE78];
    if (!v2) {
      break;
    }
    if (v2 < 1)
    {
      __break(1u);
      goto LABEL_35;
    }
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = (void *)(MEMORY[0x263F8EE78] + 32);
    unint64_t v8 = v1 & 0xC000000000000001;
    unint64_t v25 = v1 & 0xC000000000000001;
    while (1)
    {
      if (v8) {
        id v9 = (id)MEMORY[0x23ECF1270](v6, v1);
      }
      else {
        id v9 = *(id *)(v1 + 8 * v6 + 32);
      }
      id v10 = v9;
      if (!v5)
      {
        unint64_t v11 = v4[3];
        if ((uint64_t)((v11 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_32;
        }
        unint64_t v12 = v1;
        int64_t v13 = v11 & 0xFFFFFFFFFFFFFFFELL;
        if (v13 <= 1) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = v13;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8618);
        uint64_t v15 = (void *)swift_allocObject();
        uint64_t v16 = (uint64_t)(_swift_stdlib_malloc_size(v15) - 32) / 16;
        v15[2] = v14;
        v15[3] = 2 * v16;
        unint64_t v17 = (unint64_t)(v15 + 4);
        unint64_t v18 = v4[3];
        unint64_t v19 = v18 >> 1;
        if (v4[2])
        {
          if (v15 != v4 || v17 >= (unint64_t)&v4[2 * v19 + 4]) {
            memmove(v15 + 4, v4 + 4, 16 * v19);
          }
          v4[2] = 0;
        }
        uint64_t v7 = (void *)(v17 + 16 * v19);
        uint64_t v5 = (v16 & 0x7FFFFFFFFFFFFFFFLL) - (v18 >> 1);
        swift_release();
        id v4 = v15;
        unint64_t v1 = v12;
        unint64_t v8 = v25;
      }
      BOOL v21 = __OFSUB__(v5--, 1);
      if (v21) {
        break;
      }
      *uint64_t v7 = v6;
      v7[1] = v10;
      v7 += 2;
      if (v2 == ++v6) {
        goto LABEL_27;
      }
    }
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    swift_bridgeObjectRetain();
    uint64_t result = sub_23CAE56A0();
  }
  uint64_t v5 = 0;
LABEL_27:
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v22 = v4[3];
  if (v22 < 2) {
    return (uint64_t)v4;
  }
  unint64_t v23 = v22 >> 1;
  BOOL v21 = __OFSUB__(v23, v5);
  unint64_t v24 = v23 - v5;
  if (!v21)
  {
    v4[2] = v24;
    return (uint64_t)v4;
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_23CAD9F40()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 26, 7);
}

uint64_t sub_23CAD9F78@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  if (*(unsigned char *)(v3 + 25)) {
    __int16 v4 = 256;
  }
  else {
    __int16 v4 = 0;
  }
  return sub_23CAD96E0(a1, a2, v4 | *(unsigned __int8 *)(v3 + 24), a3);
}

uint64_t sub_23CAD9F98()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23CAD9FD0(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_23CADA000(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EBF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23CADA068(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_23CADA0CC()
{
  unint64_t result = qword_26AD6ECD0;
  if (!qword_26AD6ECD0)
  {
    type metadata accessor for Key(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD6ECD0);
  }
  return result;
}

uint64_t sub_23CADA11C(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  uint64_t v2 = (void *)MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v3 = result;
    unint64_t result = swift_bridgeObjectRetain();
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = v2 + 4;
    while (1)
    {
      uint64_t v7 = *(void *)(v3 + 8 * v5 + 32);
      if (v4)
      {
        unint64_t result = swift_bridgeObjectRetain();
      }
      else
      {
        unint64_t v8 = v2[3];
        if ((uint64_t)((v8 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_28;
        }
        int64_t v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
        uint64_t v10 = v9 <= 1 ? 1 : v9;
        __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6ED18);
        unint64_t v11 = (void *)swift_allocObject();
        uint64_t v12 = (uint64_t)(_swift_stdlib_malloc_size(v11) - 32) / 16;
        v11[2] = v10;
        v11[3] = 2 * v12;
        int64_t v13 = v11 + 4;
        uint64_t v14 = v2[3] >> 1;
        uint64_t v6 = &v11[2 * v14 + 4];
        uint64_t v4 = (v12 & 0x7FFFFFFFFFFFFFFFLL) - v14;
        if (v2[2])
        {
          if (v11 != v2 || v13 >= &v2[2 * v14 + 4]) {
            memmove(v13, v2 + 4, 16 * v14);
          }
          swift_bridgeObjectRetain();
          v2[2] = 0;
        }
        else
        {
          swift_bridgeObjectRetain();
        }
        unint64_t result = swift_release();
        uint64_t v2 = v11;
      }
      BOOL v16 = __OFSUB__(v4--, 1);
      if (v16) {
        break;
      }
      *uint64_t v6 = v5;
      v6[1] = v7;
      v6 += 2;
      if (v1 == ++v5)
      {
        unint64_t result = swift_bridgeObjectRelease();
        goto LABEL_23;
      }
    }
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v4 = 0;
LABEL_23:
  unint64_t v17 = v2[3];
  if (v17 < 2) {
    return (uint64_t)v2;
  }
  unint64_t v18 = v17 >> 1;
  BOOL v16 = __OFSUB__(v18, v4);
  uint64_t v19 = v18 - v4;
  if (!v16)
  {
    v2[2] = v19;
    return (uint64_t)v2;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t getEnumTagSinglePayload for FlexListView.Layout(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for FlexListView.Layout(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x23CADA3F4);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_23CADA41C(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FlexListView.Layout()
{
  return &type metadata for FlexListView.Layout;
}

uint64_t sub_23CADA438()
{
  return sub_23CACA8C8(&qword_268BC8620, &qword_268BC85E0);
}

unint64_t sub_23CADA478()
{
  unint64_t result = qword_268BC8628;
  if (!qword_268BC8628)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8628);
  }
  return result;
}

ValueMetadata *type metadata accessor for IconAdornmentMerchandizedIAPViewModifier()
{
  return &type metadata for IconAdornmentMerchandizedIAPViewModifier;
}

uint64_t sub_23CADA4D4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23CADA4F0@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t *a1@<X8>)@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8630);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x270FA5388](v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v11 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = swift_allocObject();
  *(double *)(v12 + 16) = a3;
  *(double *)(v12 + 24) = a4;
  uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v9 + 32))(v12 + v11, (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  *a2 = sub_23CADAE08;
  a2[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v12;
  return result;
}

uint64_t sub_23CADA634@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  *a2 = sub_23CAE5340();
  a2[1] = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8638);
  return sub_23CADA6A4(a1, (uint64_t *)((char *)a2 + *(int *)(v5 + 44)));
}

uint64_t sub_23CADA6A4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v57 = a1;
  id v68 = a2;
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8640);
  MEMORY[0x270FA5388](v61);
  uint64_t v60 = (uint64_t)&v57 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8648);
  MEMORY[0x270FA5388](v59);
  uint64_t v65 = (uint64_t)&v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_23CAE4EF0();
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  BOOL v7 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8650);
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  unint64_t v11 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8658);
  MEMORY[0x270FA5388](v58);
  uint64_t v64 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8660);
  uint64_t v13 = MEMORY[0x270FA5388](v62);
  uint64_t v67 = (uint64_t)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v66 = (uint64_t)&v57 - v15;
  id v16 = objc_msgSend(self, sel_secondarySystemBackgroundColor);
  uint64_t v63 = MEMORY[0x23ECF0E30](v16);
  sub_23CAE4CD0();
  unint64_t v17 = &v7[*(int *)(v5 + 28)];
  uint64_t v18 = *MEMORY[0x263F19860];
  uint64_t v19 = sub_23CAE4E60();
  id v20 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104);
  v20(v17, v18, v19);
  sub_23CAE4ED0();
  *(void *)BOOL v7 = v21;
  *((void *)v7 + 1) = v22;
  *((void *)v7 + 2) = v23;
  *((void *)v7 + 3) = v24;
  uint64_t v25 = (uint64_t)&v11[*(int *)(v9 + 44)];
  sub_23CADAE90((uint64_t)v7, v25);
  *(_WORD *)(v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BC8668) + 36)) = 256;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8630);
  uint64_t v27 = (uint64_t)v11;
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v26 - 8) + 16))(v11, v57, v26);
  sub_23CADAEF4((uint64_t)v7);
  sub_23CAE4CD0();
  v20(&v7[*(int *)(v5 + 28)], v18, v19);
  sub_23CAE4ED0();
  *(void *)BOOL v7 = v28;
  *((void *)v7 + 1) = v29;
  *((void *)v7 + 2) = v30;
  *((void *)v7 + 3) = v31;
  if (qword_268BC8258 != -1) {
    swift_once();
  }
  uint64_t v32 = qword_268BC83D0;
  swift_retain();
  sub_23CAE4C80();
  uint64_t v33 = v65;
  sub_23CADAE90((uint64_t)v7, v65);
  double v34 = *(double *)&v69 * 0.5;
  uint64_t v35 = v60;
  sub_23CADAE90((uint64_t)v7, v60);
  *(double *)(v35 + *(int *)(sub_23CAE4EE0() + 20)) = v34;
  uint64_t v36 = v35 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BC8670) + 36);
  long long v37 = v70;
  *(_OWORD *)uint64_t v36 = v69;
  *(_OWORD *)(v36 + 16) = v37;
  *(void *)(v36 + 32) = v71;
  uint64_t v38 = v61;
  *(void *)(v35 + *(int *)(v61 + 52)) = v32;
  *(_WORD *)(v35 + *(int *)(v38 + 56)) = 256;
  uint64_t v39 = sub_23CAE5340();
  uint64_t v41 = v40;
  uint64_t v42 = v33 + *(int *)(v59 + 68);
  id v43 = (uint64_t *)(v42 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BC8678) + 36));
  *id v43 = v39;
  v43[1] = v41;
  sub_23CACD7F8(v35, v42, &qword_268BC8640);
  sub_23CADAEF4((uint64_t)v7);
  uint64_t v44 = sub_23CAE5340();
  uint64_t v46 = v45;
  uint64_t v47 = (uint64_t)v64;
  uint64_t v48 = (uint64_t)&v64[*(int *)(v58 + 36)];
  sub_23CACDC60(v33, v48, &qword_268BC8648);
  uint64_t v49 = (uint64_t *)(v48 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BC8680) + 36));
  *uint64_t v49 = v44;
  v49[1] = v46;
  sub_23CACDC60(v27, v47, &qword_268BC8650);
  sub_23CACD7A4(v33, &qword_268BC8648);
  sub_23CACD7A4(v27, &qword_268BC8650);
  sub_23CAE4CD0();
  sub_23CAE4CD0();
  sub_23CAE5340();
  sub_23CAE4CC0();
  uint64_t v50 = v67;
  sub_23CACDC60(v47, v67, &qword_268BC8658);
  uint64_t v51 = (_OWORD *)(v50 + *(int *)(v62 + 36));
  long long v52 = v73;
  *uint64_t v51 = v72;
  v51[1] = v52;
  v51[2] = v74;
  sub_23CACD7A4(v47, &qword_268BC8658);
  uint64_t v53 = v66;
  sub_23CACD7F8(v50, v66, &qword_268BC8660);
  sub_23CACDC60(v53, v50, &qword_268BC8660);
  char v54 = v68;
  *id v68 = v63;
  *((_WORD *)v54 + 4) = 256;
  uint64_t v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8688);
  sub_23CACDC60(v50, (uint64_t)v54 + *(int *)(v55 + 48), &qword_268BC8660);
  swift_retain();
  sub_23CACD7A4(v53, &qword_268BC8660);
  sub_23CACD7A4(v50, &qword_268BC8660);
  return swift_release();
}

uint64_t sub_23CADAD58()
{
  return sub_23CAE4CB0();
}

uint64_t sub_23CADAD74@<X0>(uint64_t a1@<X0>, uint64_t (**a2)@<X0>(uint64_t *a1@<X8>)@<X8>)
{
  return sub_23CADA4F0(a1, a2, *v2, v2[1]);
}

uint64_t sub_23CADAD7C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8630);
  OUTLINED_FUNCTION_10();
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  (*(void (**)(uint64_t))(v1 + 8))(v0 + v3);
  return MEMORY[0x270FA0238](v0, v4, v5);
}

uint64_t sub_23CADAE08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BC8630) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  return sub_23CADA634(v4, a1);
}

uint64_t sub_23CADAE90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_23CAE4EF0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23CADAEF4(uint64_t a1)
{
  uint64_t v2 = sub_23CAE4EF0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23CADAF54()
{
  unint64_t result = qword_268BC8690;
  if (!qword_268BC8690)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC8698);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8690);
  }
  return result;
}

uint64_t sub_23CADAFA8(char a1)
{
  return sub_23CAE5730();
}

uint64_t sub_23CADAFFC()
{
  return sub_23CADB09C();
}

uint64_t sub_23CADB008(uint64_t a1, char a2)
{
  return sub_23CAE5730();
}

uint64_t sub_23CADB058()
{
  return sub_23CAE5730();
}

uint64_t sub_23CADB09C()
{
  return sub_23CAE5730();
}

unint64_t sub_23CADB140(unint64_t result)
{
  if (result >= 7) {
    return 7;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for IconAdornmentStyle(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFA)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v5 = v6 - 7;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for IconAdornmentStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23CADB2A4);
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

ValueMetadata *type metadata accessor for IconAdornmentStyle()
{
  return &type metadata for IconAdornmentStyle;
}

uint64_t sub_23CADB2DC()
{
  return sub_23CAD6F68();
}

uint64_t sub_23CADB2F8(uint64_t a1)
{
  return sub_23CAD9218(a1, *v1);
}

uint64_t sub_23CADB300()
{
  return sub_23CADB058();
}

unint64_t sub_23CADB31C@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_23CADB140(*a1);
  *a2 = result;
  return result;
}

unint64_t sub_23CADB34C()
{
  unint64_t result = qword_268BC86A0;
  if (!qword_268BC86A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC86A0);
  }
  return result;
}

uint64_t sub_23CADB398@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned __int8 a3@<W2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
  uint64_t v85 = a1;
  uint64_t v86 = a4;
  int v84 = a3;
  uint64_t v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC86A8);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v10);
  OUTLINED_FUNCTION_1_2();
  uint64_t v13 = v12 - v11;
  uint64_t v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC86B0);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_3_1();
  uint64_t v82 = v15;
  uint64_t v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC86B8);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v16);
  OUTLINED_FUNCTION_1_2();
  uint64_t v19 = v18 - v17;
  uint64_t v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC86C0);
  OUTLINED_FUNCTION_10();
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  uint64_t v81 = (char *)&v75 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  uint64_t v83 = (uint64_t)&v75 - v23;
  uint64_t v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC86C8);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v24);
  OUTLINED_FUNCTION_3_1();
  uint64_t v89 = v25;
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EBC0);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v27);
  OUTLINED_FUNCTION_1_2();
  uint64_t v30 = v29 - v28;
  uint64_t v31 = sub_23CAE4D10();
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v32);
  OUTLINED_FUNCTION_1_2();
  uint64_t v35 = (double *)(v34 - v33);
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC86D0);
  OUTLINED_FUNCTION_10();
  uint64_t v37 = MEMORY[0x270FA5388](v36);
  uint64_t v39 = (uint64_t *)((char *)&v75 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v37);
  uint64_t v41 = (char *)&v75 - v40;
  if (v84 == 1)
  {
    uint64_t v42 = sub_23CADBA74(v85, a2, 1u);
    double v43 = sub_23CADBC18(a5, a6, a2, 1);
    uint64_t v44 = (char *)v35 + *(int *)(v31 + 20);
    uint64_t v45 = *MEMORY[0x263F19860];
    sub_23CAE4E60();
    OUTLINED_FUNCTION_10();
    (*(void (**)(char *, uint64_t))(v46 + 104))(v44, v45);
    *uint64_t v35 = v43;
    v35[1] = v43;
    sub_23CAC9908((uint64_t)v35, v30);
    *(_WORD *)(v30 + *(int *)(v26 + 36)) = 256;
    sub_23CACDC60(v30, (uint64_t)v39 + *(int *)(v87 + 36), &qword_26AD6EBC0);
    *uint64_t v39 = v42;
    swift_retain();
    sub_23CACD7A4(v30, &qword_26AD6EBC0);
    sub_23CAC996C((uint64_t)v35);
    swift_release();
    sub_23CACD7F8((uint64_t)v39, (uint64_t)v41, &qword_268BC86D0);
    sub_23CACDC60((uint64_t)v41, v89, &qword_268BC86D0);
    swift_storeEnumTagMultiPayload();
    sub_23CADBDB4();
    sub_23CADBE54();
    sub_23CAE4EC0();
    uint64_t v47 = (uint64_t)v41;
    uint64_t v48 = &qword_268BC86D0;
  }
  else
  {
    uint64_t v76 = a2;
    double v49 = sub_23CADBC18(a5, a6, a2, a3);
    sub_23CAE4E60();
    OUTLINED_FUNCTION_10();
    uint64_t v51 = *(void (**)(void))(v50 + 104);
    OUTLINED_FUNCTION_3_2();
    v51();
    *uint64_t v35 = v49;
    v35[1] = v49;
    uint64_t v52 = *(int *)(v78 + 36);
    uint64_t v77 = v19;
    uint64_t v53 = v19 + v52;
    sub_23CAC9908((uint64_t)v35, v19 + v52);
    *(_WORD *)(v53 + *(int *)(v26 + 36)) = 256;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BC86D8);
    OUTLINED_FUNCTION_10();
    (*(void (**)(uint64_t, uint64_t))(v54 + 16))(v19, v85);
    sub_23CAC996C((uint64_t)v35);
    OUTLINED_FUNCTION_3_2();
    v51();
    *uint64_t v35 = v49;
    v35[1] = v49;
    uint64_t v55 = v76;
    swift_retain();
    sub_23CAE4C80();
    uint64_t v56 = v82;
    sub_23CAC9908((uint64_t)v35, v82);
    double v57 = *(double *)&v91 * 0.5;
    sub_23CAC9908((uint64_t)v35, v13);
    *(double *)(v13 + *(int *)(sub_23CAE4D00() + 20)) = v57;
    uint64_t v58 = v13 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BC86E0) + 36);
    long long v59 = v92;
    *(_OWORD *)uint64_t v58 = v91;
    *(_OWORD *)(v58 + 16) = v59;
    *(void *)(v58 + 32) = v93;
    uint64_t v60 = v80;
    *(void *)(v13 + *(int *)(v80 + 52)) = v55;
    *(_WORD *)(v13 + *(int *)(v60 + 56)) = 256;
    uint64_t v61 = sub_23CAE5340();
    uint64_t v63 = v62;
    uint64_t v64 = v56 + *(int *)(v79 + 68);
    uint64_t v65 = (uint64_t *)(v64 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BC86E8) + 36));
    *uint64_t v65 = v61;
    v65[1] = v63;
    sub_23CACD7F8(v13, v64, &qword_268BC86A8);
    sub_23CAC996C((uint64_t)v35);
    uint64_t v66 = sub_23CAE5340();
    uint64_t v68 = v67;
    uint64_t v69 = (uint64_t)v81;
    uint64_t v70 = (uint64_t)&v81[*(int *)(v90 + 36)];
    sub_23CACDC60(v56, v70, &qword_268BC86B0);
    uint64_t v71 = (uint64_t *)(v70 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BC86F0) + 36));
    *uint64_t v71 = v66;
    v71[1] = v68;
    uint64_t v72 = v77;
    sub_23CACDC60(v77, v69, &qword_268BC86B8);
    sub_23CACD7A4(v56, &qword_268BC86B0);
    sub_23CACD7A4(v72, &qword_268BC86B8);
    uint64_t v73 = v83;
    sub_23CACD7F8(v69, v83, &qword_268BC86C0);
    sub_23CACDC60(v73, v89, &qword_268BC86C0);
    swift_storeEnumTagMultiPayload();
    sub_23CADBDB4();
    sub_23CADBE54();
    sub_23CAE4EC0();
    uint64_t v47 = v73;
    uint64_t v48 = &qword_268BC86C0;
  }
  return sub_23CACD7A4(v47, v48);
}

uint64_t sub_23CADBA74(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  int v4 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC86D8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8720);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  if (v4 == 1)
  {
    v12(v11, a1, v5);
    *(_OWORD *)&v11[*(int *)(v9 + 36)] = xmmword_23CAE6DA0;
    sub_23CADBFB8();
  }
  else
  {
    v12(v8, a1, v5);
    sub_23CACA8C8(&qword_268BC8710, &qword_268BC86D8);
  }
  return sub_23CAE52F0();
}

double sub_23CADBC18(double a1, double a2, uint64_t a3, char a4)
{
  double v4 = 0.5;
  double result = 2.0;
  switch(a4)
  {
    case 1:
      return result;
    case 2:
    case 3:
    case 6:
      return v4 * a2;
    case 4:
      double v4 = 0.22;
      return v4 * a2;
    default:
      double v4 = 0.11;
      return v4 * a2;
  }
}

uint64_t sub_23CADBC84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23CADB398(a1, *(void *)v2, *(unsigned char *)(v2 + 16), a2, *(double *)(v2 + 8), *(double *)(v2 + 24));
}

uint64_t initializeWithCopy for IconAdornmentViewModifier(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for IconAdornmentViewModifier(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

uint64_t assignWithTake for IconAdornmentViewModifier(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  return a1;
}

ValueMetadata *type metadata accessor for IconAdornmentViewModifier()
{
  return &type metadata for IconAdornmentViewModifier;
}

uint64_t sub_23CADBD98()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_23CADBDB4()
{
  unint64_t result = qword_268BC86F8;
  if (!qword_268BC86F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC86D0);
    sub_23CACA8C8((unint64_t *)&qword_26AD6EBB8, &qword_26AD6EBC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC86F8);
  }
  return result;
}

unint64_t sub_23CADBE54()
{
  unint64_t result = qword_268BC8700;
  if (!qword_268BC8700)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC86C0);
    sub_23CADBEF4();
    sub_23CACA8C8(&qword_268BC8718, &qword_268BC86F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8700);
  }
  return result;
}

unint64_t sub_23CADBEF4()
{
  unint64_t result = qword_268BC8708;
  if (!qword_268BC8708)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC86B8);
    sub_23CACA8C8(&qword_268BC8710, &qword_268BC86D8);
    sub_23CACA8C8((unint64_t *)&qword_26AD6EBB8, &qword_26AD6EBC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8708);
  }
  return result;
}

unint64_t sub_23CADBFB8()
{
  unint64_t result = qword_268BC8728;
  if (!qword_268BC8728)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC8720);
    sub_23CACA8C8(&qword_268BC8710, &qword_268BC86D8);
    sub_23CADC058();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8728);
  }
  return result;
}

unint64_t sub_23CADC058()
{
  unint64_t result = qword_268BC8730;
  if (!qword_268BC8730)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8730);
  }
  return result;
}

unint64_t sub_23CADC0A8()
{
  unint64_t result = qword_268BC8738;
  if (!qword_268BC8738)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC8740);
    sub_23CADBDB4();
    sub_23CADBE54();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8738);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return sub_23CAE5480();
}

void *sub_23CADC16C(void *a1, void *a2)
{
  id v3 = objc_msgSend(a1, sel_attributesAtIndex_effectiveRange_, 0, 0);
  type metadata accessor for Key(0);
  sub_23CADA0CC();
  uint64_t v4 = sub_23CAE5400();

  id v5 = (id)*MEMORY[0x263F27A20];
  sub_23CACC000((uint64_t)v5, v4, &v14);

  if (!v15)
  {
    sub_23CAC9B30((uint64_t)&v14, (uint64_t *)&unk_26AD6ED20);
    goto LABEL_5;
  }
  if (!swift_dynamicCast())
  {
LABEL_5:
    unint64_t v6 = 0;
    goto LABEL_6;
  }
  unint64_t v6 = v13;
LABEL_6:
  char v7 = sub_23CAD4144(v6);
  if (v7 != 4 && v7)
  {
    id v8 = (id)*MEMORY[0x263F27A30];
    sub_23CACC000((uint64_t)v8, v4, &v14);

    if (v15) {
      OUTLINED_FUNCTION_0();
    }
    else {
      sub_23CAC9B30((uint64_t)&v14, (uint64_t *)&unk_26AD6ED20);
    }
    id v9 = (id)*MEMORY[0x263F27A28];
    sub_23CACC000((uint64_t)v9, v4, &v14);

    swift_bridgeObjectRelease();
    if (v15)
    {
      if (OUTLINED_FUNCTION_0())
      {
        unint64_t v10 = v13;
LABEL_17:
        sub_23CADB140(v10);
        id v11 = a2;
        return a2;
      }
    }
    else
    {
      sub_23CAC9B30((uint64_t)&v14, (uint64_t *)&unk_26AD6ED20);
    }
    unint64_t v10 = 0;
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t destroy for LeadingItem(id *a1)
{
  return swift_bridgeObjectRelease();
}

ValueMetadata *type metadata accessor for LeadingItem()
{
  return &type metadata for LeadingItem;
}

uint64_t _s33AppleMediaServicesUIPaymentSheets11LeadingItemVwcp_0(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s33AppleMediaServicesUIPaymentSheets11LeadingItemVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s33AppleMediaServicesUIPaymentSheets11LeadingItemVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s33AppleMediaServicesUIPaymentSheets11LeadingItemVwet_0(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_23CADC53C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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

ValueMetadata *type metadata accessor for LeadingItemView()
{
  return &type metadata for LeadingItemView;
}

uint64_t sub_23CADC58C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_23CADC5A8(void *a1@<X0>, __int16 a2@<W1>, __n128 *a3@<X8>)
{
  unsigned __int8 v3 = a2;
  int v6 = HIBYTE(a2);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8280);
  MEMORY[0x270FA5388](v7 - 8);
  id v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v10 = 0uLL;
  if (v6 == 2)
  {
    if (a1)
    {
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v38 = (uint64_t)a1;
      uint64_t v39 = 0x3FF0000000000000;
      unint64_t v40 = (unint64_t)v3 << 8;
      uint64_t v41 = KeyPath;
      __int16 v42 = 256;
      sub_23CADC858();
      id v35 = a1;
      sub_23CAE4EC0();
      __n128 v10 = OUTLINED_FUNCTION_1_3();
      if (v32) {
        __int16 v33 = 0;
      }
      else {
        __int16 v33 = 256;
      }
      goto LABEL_10;
    }
LABEL_11:
    __int16 v36 = -256;
    __n128 v31 = 0uLL;
    goto LABEL_12;
  }
  if (v6 != 3) {
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  sub_23CAE5260();
  uint64_t v11 = sub_23CAE5140();
  uint64_t v13 = v12;
  char v15 = v14 & 1;
  uint64_t v16 = sub_23CAE4FA0();
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v16);
  sub_23CAE4FF0();
  sub_23CAC9B30((uint64_t)v9, &qword_268BC8280);
  uint64_t v17 = sub_23CAE5100();
  uint64_t v19 = v18;
  char v21 = v20;
  swift_release();
  char v22 = v21 & 1;
  sub_23CAC9AA4(v11, v13, v15);
  swift_bridgeObjectRelease();
  uint64_t v43 = sub_23CAE51F0();
  uint64_t v23 = sub_23CAE50D0();
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  unint64_t v29 = v28 & 1;
  sub_23CAC9AA4(v17, v19, v22);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v38 = v23;
  uint64_t v39 = v25;
  unint64_t v40 = v29;
  uint64_t v41 = v27;
  __int16 v42 = 0;
  sub_23CADC858();
  sub_23CAE4EC0();
  __n128 v10 = OUTLINED_FUNCTION_1_3();
  if (v32) {
    __int16 v33 = 0;
  }
  else {
    __int16 v33 = 256;
  }
LABEL_10:
  __int16 v36 = v33 | v30;
LABEL_12:
  *a3 = v10;
  a3[1] = v31;
  a3[2].n128_u16[0] = v36;
}

void sub_23CADC840(__n128 *a1@<X8>)
{
  sub_23CADC5A8(*(void **)v1, *(_WORD *)(v1 + 8), a1);
}

unint64_t sub_23CADC858()
{
  unint64_t result = qword_268BC8748;
  if (!qword_268BC8748)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8748);
  }
  return result;
}

unint64_t sub_23CADC8A8()
{
  unint64_t result = qword_268BC8750;
  if (!qword_268BC8750)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC8758);
    sub_23CADC91C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8750);
  }
  return result;
}

unint64_t sub_23CADC91C()
{
  unint64_t result = qword_268BC8760;
  if (!qword_268BC8760)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC8768);
    sub_23CADC858();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8760);
  }
  return result;
}

__n128 OUTLINED_FUNCTION_1_3()
{
  return *(__n128 *)(v0 - 128);
}

uint64_t sub_23CADC9B0()
{
  type metadata accessor for Localizations();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v2 = sub_23CAE4BB0();

  return v2;
}

uint64_t sub_23CADCA58()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t type metadata accessor for Localizations()
{
  return self;
}

uint64_t sub_23CADCA8C()
{
  os_log_type_t v0 = sub_23CAE55B0();
  return sub_23CADCB5C(v0);
}

uint64_t sub_23CADCAC4()
{
  sub_23CADCCF8();
  uint64_t result = sub_23CAE5610();
  qword_268BC8770 = result;
  return result;
}

uint64_t sub_23CADCB24()
{
  os_log_type_t v0 = sub_23CAE55A0();
  return sub_23CADCB5C(v0);
}

uint64_t sub_23CADCB5C(os_log_type_t a1)
{
  if (qword_268BC8260 != -1) {
    swift_once();
  }
  uint64_t result = os_log_type_enabled((os_log_t)qword_268BC8770, a1);
  if (result)
  {
    sub_23CAE5370();
    uint64_t v3 = sub_23CAE53E0();
    uint64_t v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8778);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_23CAE62A0;
    *(void *)(v6 + 56) = MEMORY[0x263F8D310];
    *(void *)(v6 + 64) = sub_23CADCCAC();
    *(void *)(v6 + 32) = v3;
    *(void *)(v6 + 40) = v5;
    sub_23CAE4C30();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for Log()
{
  return self;
}

unint64_t sub_23CADCCAC()
{
  unint64_t result = qword_268BC8780;
  if (!qword_268BC8780)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8780);
  }
  return result;
}

unint64_t sub_23CADCCF8()
{
  unint64_t result = qword_268BC8788;
  if (!qword_268BC8788)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268BC8788);
  }
  return result;
}

uint64_t destroy for ParentalVerificationMessageViewModel(id *a1)
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ParentalVerificationMessageView(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  uint64_t v6 = *(void *)(a2 + 40);
  a1[4] = *(void *)(a2 + 32);
  a1[5] = v6;
  id v7 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ParentalVerificationMessageView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

uint64_t assignWithTake for ParentalVerificationMessageView(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[4];
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = a2[5];
  return a1;
}

uint64_t getEnumTagSinglePayload for ParentalVerificationMessageView(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ParentalVerificationMessageView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ParentalVerificationMessageView()
{
  return &type metadata for ParentalVerificationMessageView;
}

uint64_t sub_23CADCF5C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23CADCF78@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = sub_23CAE4EA0();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8790);
  return sub_23CADCFC4(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_23CADCFC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v105 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8280);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v104 = (uint64_t)&v92 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8288) - 8;
  MEMORY[0x270FA5388](v101);
  uint64_t v96 = (uint64_t)&v92 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_23CAE4D10() - 8;
  unint64_t v97 = v6;
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v92 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8290);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (uint64_t)&v92 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8298);
  uint64_t v13 = v12 - 8;
  MEMORY[0x270FA5388](v12);
  char v15 = (uint64_t *)((char *)&v92 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC82A0) - 8;
  uint64_t v16 = MEMORY[0x270FA5388](v98);
  uint64_t v107 = (uint64_t)&v92 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v106 = (uint64_t)&v92 - v18;
  uint64_t v19 = *(void **)a1;
  uint64_t v100 = *(void *)(a1 + 8);
  uint64_t v99 = *(void *)(a1 + 16);
  uint64_t v20 = *(void *)(a1 + 24);
  uint64_t v102 = *(void *)(a1 + 32);
  uint64_t v103 = v20;
  id v21 = v19;
  uint64_t v22 = sub_23CAE5240();
  uint64_t v23 = *(void *)(a1 + 40);
  uint64_t v24 = &v8[*(int *)(v6 + 28)];
  unsigned int v94 = *MEMORY[0x263F19860];
  uint64_t v25 = v94;
  uint64_t v26 = sub_23CAE4E60();
  uint64_t v27 = *(void *)(v26 - 8);
  uint64_t v93 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 104);
  uint64_t v95 = v27 + 104;
  v93(v24, v25, v26);
  *(void *)uint64_t v8 = v23;
  *((void *)v8 + 1) = v23;
  id v28 = objc_msgSend(self, sel_systemGrayColor);
  uint64_t v29 = MEMORY[0x23ECF0E30](v28);
  sub_23CAE4C80();
  sub_23CAC9908((uint64_t)v8, v11);
  uint64_t v30 = v11 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BC82B8) + 36);
  long long v31 = v111;
  *(_OWORD *)uint64_t v30 = v110;
  *(_OWORD *)(v30 + 16) = v31;
  *(void *)(v30 + 32) = v112;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC82C0);
  *(void *)(v11 + *(int *)(v32 + 52)) = v29;
  *(_WORD *)(v11 + *(int *)(v32 + 56)) = 256;
  uint64_t v33 = sub_23CAE5340();
  uint64_t v35 = v34;
  __int16 v36 = (uint64_t *)(v11 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BC82C8) + 36));
  uint64_t *v36 = v33;
  v36[1] = v35;
  sub_23CAC996C((uint64_t)v8);
  uint64_t v37 = sub_23CAE5340();
  uint64_t v39 = v38;
  uint64_t v40 = v96;
  sub_23CAC9ABC(v11, v96, &qword_268BC8290);
  uint64_t v41 = (uint64_t *)(v40 + *(int *)(v101 + 44));
  uint64_t *v41 = v37;
  v41[1] = v39;
  sub_23CAC9ABC(v40, (uint64_t)v15 + *(int *)(v13 + 44), &qword_268BC8288);
  *char v15 = v22;
  swift_retain();
  sub_23CAC9B30(v40, &qword_268BC8288);
  sub_23CAC9B30(v11, &qword_268BC8290);
  swift_release();
  v93(&v8[*(int *)(v97 + 28)], v94, v26);
  *(void *)uint64_t v8 = v23;
  *((void *)v8 + 1) = v23;
  uint64_t v42 = v107;
  uint64_t v43 = v107 + *(int *)(v98 + 44);
  sub_23CAC9908((uint64_t)v8, v43);
  *(_WORD *)(v43 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EBC0) + 36)) = 256;
  sub_23CAC9ABC((uint64_t)v15, v42, &qword_268BC8298);
  sub_23CAC996C((uint64_t)v8);
  sub_23CAC9B30((uint64_t)v15, &qword_268BC8298);
  sub_23CADD8BC(v42, v106);
  uint64_t v108 = v100;
  uint64_t v109 = v99;
  unint64_t v97 = sub_23CAC9A30();
  swift_bridgeObjectRetain();
  uint64_t v44 = sub_23CAE5130();
  uint64_t v46 = v45;
  char v48 = v47 & 1;
  sub_23CAE4FB0();
  uint64_t v96 = sub_23CAE4FA0();
  uint64_t v49 = v104;
  __swift_storeEnumTagSinglePayload(v104, 1, 1, v96);
  sub_23CAE4FF0();
  sub_23CAC9B30(v49, &qword_268BC8280);
  uint64_t v50 = sub_23CAE5100();
  uint64_t v52 = v51;
  LOBYTE(v11) = v53;
  swift_release();
  sub_23CAC9AA4(v44, v46, v48);
  swift_bridgeObjectRelease();
  sub_23CAE4FB0();
  uint64_t v101 = sub_23CAE5040();
  uint64_t v99 = v54;
  uint64_t v100 = v55;
  char v57 = v56 & 1;
  sub_23CAC9AA4(v50, v52, v11 & 1);
  swift_bridgeObjectRelease();
  LODWORD(v98) = sub_23CAE4F20();
  sub_23CAE4C50();
  uint64_t v59 = v58;
  uint64_t v61 = v60;
  uint64_t v63 = v62;
  uint64_t v65 = v64;
  uint64_t v108 = v103;
  uint64_t v109 = v102;
  swift_bridgeObjectRetain();
  uint64_t v66 = sub_23CAE5130();
  uint64_t v68 = v67;
  LOBYTE(v52) = v69 & 1;
  sub_23CAE4FD0();
  __swift_storeEnumTagSinglePayload(v49, 1, 1, v96);
  sub_23CAE4FF0();
  sub_23CAC9B30(v49, &qword_268BC8280);
  uint64_t v70 = sub_23CAE5100();
  uint64_t v72 = v71;
  LOBYTE(v49) = v73;
  swift_release();
  LOBYTE(v26) = v49 & 1;
  sub_23CAC9AA4(v66, v68, v52);
  swift_bridgeObjectRelease();
  sub_23CAE4FD0();
  uint64_t v74 = sub_23CAE5040();
  uint64_t v76 = v75;
  uint64_t v78 = v77;
  LOBYTE(v50) = v79 & 1;
  sub_23CAC9AA4(v70, v72, v26);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v82 = v106;
  uint64_t v81 = v107;
  sub_23CAC9ABC(v106, v107, &qword_268BC82A0);
  LOBYTE(v108) = v57;
  uint64_t v83 = v81;
  uint64_t v84 = v105;
  sub_23CAC9ABC(v83, v105, &qword_268BC82A0);
  uint64_t v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8798);
  uint64_t v86 = v84 + *(int *)(v85 + 48);
  uint64_t v87 = v101;
  uint64_t v88 = v99;
  *(void *)uint64_t v86 = v101;
  *(void *)(v86 + 8) = v88;
  *(unsigned char *)(v86 + 16) = v57;
  *(void *)(v86 + 24) = v100;
  *(unsigned char *)(v86 + 32) = v98;
  *(void *)(v86 + 40) = v59;
  *(void *)(v86 + 48) = v61;
  *(void *)(v86 + 56) = v63;
  *(void *)(v86 + 64) = v65;
  *(unsigned char *)(v86 + 72) = 0;
  uint64_t v89 = v84 + *(int *)(v85 + 64);
  *(void *)uint64_t v89 = v74;
  *(void *)(v89 + 8) = v76;
  *(unsigned char *)(v89 + 16) = v50;
  *(void *)(v89 + 24) = v78;
  *(void *)(v89 + 32) = KeyPath;
  *(unsigned char *)(v89 + 40) = 1;
  uint64_t v90 = v87;
  sub_23CAC9B20(v87, v88, v57);
  swift_bridgeObjectRetain();
  sub_23CAC9B20(v74, v76, v50);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_23CAC9B30(v82, &qword_268BC82A0);
  sub_23CAC9AA4(v74, v76, v50);
  swift_release();
  swift_bridgeObjectRelease();
  sub_23CAC9AA4(v90, v88, v108);
  swift_bridgeObjectRelease();
  return sub_23CAC9B30(v107, &qword_268BC82A0);
}

uint64_t sub_23CADD880@<X0>(uint64_t a1@<X8>)
{
  return sub_23CADCF78(a1);
}

uint64_t sub_23CADD8BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC82A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23CADD924@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23CAE4DB0();
  *a1 = result;
  return result;
}

uint64_t sub_23CADD950@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23CAE4DB0();
  *a1 = result;
  return result;
}

uint64_t sub_23CADD97C()
{
  return sub_23CAE4DC0();
}

uint64_t sub_23CADD9A4()
{
  return sub_23CAE4DC0();
}

unint64_t sub_23CADD9D0()
{
  unint64_t result = qword_268BC87A0;
  if (!qword_268BC87A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC87A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC87A0);
  }
  return result;
}

id sub_23CADDA24(uint64_t a1, unint64_t a2, double a3)
{
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  uint64_t v7 = (void *)sub_23CAE4BF0();
  id v8 = objc_msgSend(v6, sel_initWithData_scale_, v7, a3);
  sub_23CACA27C(a1, a2);

  return v8;
}

id sub_23CADDAAC(uint64_t a1)
{
  if (a1)
  {
    sub_23CACBF9C(0x7469547465656873, 0xEA0000000000656CLL, a1, &v19);
    if (v20)
    {
      OUTLINED_FUNCTION_0_2();
      goto LABEL_6;
    }
  }
  else
  {
    OUTLINED_FUNCTION_2_2();
  }
  sub_23CACA184((uint64_t)&v19);
  if (!a1)
  {
    OUTLINED_FUNCTION_2_2();
LABEL_10:
    uint64_t v2 = sub_23CACA184((uint64_t)&v19);
    if (!a1)
    {
      uint64_t v10 = 0;
      OUTLINED_FUNCTION_2_2();
      unint64_t v11 = 0xC000000000000000;
      goto LABEL_16;
    }
    goto LABEL_11;
  }
LABEL_6:
  sub_23CACBF9C(0x6F6349656C746974, 0xE90000000000006ELL, a1, &v19);
  if (!v20) {
    goto LABEL_10;
  }
  uint64_t v2 = OUTLINED_FUNCTION_0_2();
  if (v2)
  {
    uint64_t v10 = v16;
    unint64_t v11 = v18;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v10 = 0;
  unint64_t v11 = 0xC000000000000000;
LABEL_12:
  OUTLINED_FUNCTION_1_4(v2, v3, v4, v5, v6, v7, v8, v9, v16, v18, v19);
  if (!v20)
  {
LABEL_16:
    sub_23CACA184((uint64_t)&v19);
    goto LABEL_17;
  }
  if (OUTLINED_FUNCTION_0_2())
  {
    double v12 = v17;
    goto LABEL_18;
  }
LABEL_17:
  double v12 = 1.0;
LABEL_18:
  sub_23CACA1E4();
  sub_23CACA224(v10, v11);
  id v13 = sub_23CADDA24(v10, v11, v12);
  if (!v13) {
    id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_init);
  }
  id v14 = v13;
  sub_23CACA27C(v10, v11);
  return v14;
}

uint64_t sub_23CADDC60@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (!a1)
  {
    OUTLINED_FUNCTION_2_2();
LABEL_6:
    sub_23CACA184((uint64_t)&v29);
    if (!a1)
    {
      uint64_t v6 = 0;
      OUTLINED_FUNCTION_2_2();
      unint64_t v7 = 0xE000000000000000;
LABEL_12:
      sub_23CACA184((uint64_t)&v29);
      if (!a1)
      {
        uint64_t v8 = 0;
        OUTLINED_FUNCTION_2_2();
        unint64_t v9 = 0xE000000000000000;
LABEL_18:
        uint64_t v12 = sub_23CACA184((uint64_t)&v29);
        if (!a1)
        {
          uint64_t v20 = 0;
          OUTLINED_FUNCTION_2_2();
          unint64_t v21 = 0xC000000000000000;
          goto LABEL_24;
        }
        goto LABEL_19;
      }
      goto LABEL_13;
    }
    goto LABEL_7;
  }
  uint64_t v4 = OUTLINED_FUNCTION_3_3();
  sub_23CACBF9C(v4 & 0xFFFFFFFFFFFFLL | 0x5474000000000000, 0xEC000000656C7469, a1, v5);
  if (!v30) {
    goto LABEL_6;
  }
  if (OUTLINED_FUNCTION_0_2())
  {
    uint64_t v6 = v26;
    unint64_t v7 = v28;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v6 = 0;
  unint64_t v7 = 0xE000000000000000;
LABEL_8:
  sub_23CACBF9C(0x6567617373656DLL, 0xE700000000000000, a1, &v29);
  if (!v30) {
    goto LABEL_12;
  }
  if (OUTLINED_FUNCTION_0_2())
  {
    uint64_t v8 = v26;
    unint64_t v9 = v28;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v8 = 0;
  unint64_t v9 = 0xE000000000000000;
LABEL_14:
  uint64_t v10 = OUTLINED_FUNCTION_3_3();
  sub_23CACBF9C(v10 & 0xFFFFFFFFFFFFLL | 0x4974000000000000, 0xEB000000006E6F63, a1, v11);
  if (!v30) {
    goto LABEL_18;
  }
  uint64_t v12 = OUTLINED_FUNCTION_0_2();
  if (v12)
  {
    uint64_t v20 = v26;
    unint64_t v21 = v28;
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v20 = 0;
  unint64_t v21 = 0xC000000000000000;
LABEL_20:
  OUTLINED_FUNCTION_1_4(v12, v13, v14, v15, v16, v17, v18, v19, v26, v28, v29);
  if (!v30)
  {
LABEL_24:
    sub_23CACA184((uint64_t)&v29);
    goto LABEL_25;
  }
  if (OUTLINED_FUNCTION_0_2())
  {
    double v22 = v27;
    goto LABEL_26;
  }
LABEL_25:
  double v22 = 1.0;
LABEL_26:
  sub_23CACA1E4();
  sub_23CACA224(v20, v21);
  id v23 = sub_23CADDA24(v20, v21, v22);
  if (!v23) {
    id v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F827E8]), sel_init);
  }
  id v24 = v23;
  uint64_t result = sub_23CACA27C(v20, v21);
  *a2 = v24;
  a2[1] = v6;
  a2[2] = v7;
  a2[3] = v8;
  a2[4] = v9;
  return result;
}

ValueMetadata *type metadata accessor for WalletTitleViewModel()
{
  return &type metadata for WalletTitleViewModel;
}

void *initializeWithCopy for ParentalVerificationMessageViewModel(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  a1[4] = *(void *)(a2 + 32);
  id v6 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ParentalVerificationMessageViewModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ParentalVerificationMessageViewModel(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[4];
  *(void *)(a1 + 24) = a2[3];
  *(void *)(a1 + 32) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ParentalVerificationMessageViewModel(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ParentalVerificationMessageViewModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ParentalVerificationMessageViewModel()
{
  return &type metadata for ParentalVerificationMessageViewModel;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return swift_dynamicCast();
}

double OUTLINED_FUNCTION_1_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long a11)
{
  return sub_23CACBF9C(0x63536E6565726373, 0xEB00000000656C61, v11, &a11);
}

double OUTLINED_FUNCTION_2_2()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return 0x7865746E6F63;
}

uint64_t sub_23CADE0CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  id v4 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PaymentSheetViewRequest(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PaymentSheetViewRequest(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PaymentSheetViewRequest(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PaymentSheetViewRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PaymentSheetViewRequest()
{
  return &type metadata for PaymentSheetViewRequest;
}

uint64_t sub_23CADE258(void *a1)
{
  *(void *)&long long v9 = sub_23CAE5460();
  *((void *)&v9 + 1) = v2;
  swift_bridgeObjectRetain();
  id v3 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_23CAE56F0());
  swift_unknownObjectRelease();
  if (v3)
  {
    sub_23CAE5640();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  sub_23CADEBA4((uint64_t)&v9, (uint64_t)v11);
  if (v12)
  {
    if (OUTLINED_FUNCTION_0_3())
    {
      swift_bridgeObjectRelease();
      sub_23CADE6A4();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_23CACA184((uint64_t)v11);
  }
  *(void *)&long long v9 = sub_23CAE5460();
  *((void *)&v9 + 1) = v4;
  swift_bridgeObjectRetain();
  id v5 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_23CAE56F0());
  swift_unknownObjectRelease();
  if (v5)
  {
    sub_23CAE5640();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
  }
  sub_23CADEBA4((uint64_t)&v9, (uint64_t)v11);
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EC80);
    OUTLINED_FUNCTION_0_3();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_23CACA184((uint64_t)v11);
  }
  uint64_t v6 = swift_bridgeObjectRetain();
  uint64_t v7 = sub_23CADE7CC(v6);
  swift_bridgeObjectRelease();

  return v7;
}

unint64_t sub_23CADE494(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_23CAE53B0();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v5 = sub_23CAE5460();
  sub_23CACBF9C(v5, v6, a3, &v11);
  swift_bridgeObjectRelease();
  if (!v12)
  {
    sub_23CACA184((uint64_t)&v11);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  unint64_t v7 = sub_23CADB140(v10);
  if (v7 == 7) {
    return 0;
  }
  unint64_t v8 = v7;
  type metadata accessor for Log();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8370);
  sub_23CAE53F0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_23CAE62A0;
  sub_23CAE53A0();
  sub_23CAE5390();
  uint64_t v12 = &type metadata for IconAdornmentStyle;
  LOBYTE(v11) = v8;
  sub_23CAE5380();
  sub_23CACA184((uint64_t)&v11);
  sub_23CAE5390();
  sub_23CAE53C0();
  sub_23CADCB24();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_23CADE6A4()
{
  unint64_t v0 = sub_23CAE56C0();
  swift_bridgeObjectRelease();
  if (v0 >= 3) {
    return 3;
  }
  else {
    return v0;
  }
}

unint64_t sub_23CADE6F0(char a1)
{
  if (!a1) {
    return 0xD000000000000032;
  }
  if (a1 == 1) {
    return 0xD00000000000002BLL;
  }
  return 0xD000000000000033;
}

uint64_t sub_23CADE74C(unsigned __int8 *a1, char *a2)
{
  return sub_23CAD3CF8(*a1, *a2);
}

uint64_t sub_23CADE758()
{
  return sub_23CADAFFC();
}

uint64_t sub_23CADE760()
{
  return sub_23CAD3FA8();
}

uint64_t sub_23CADE768()
{
  return sub_23CADB09C();
}

uint64_t sub_23CADE770@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_23CADE6A4();
  *a1 = result;
  return result;
}

unint64_t sub_23CADE7A0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_23CADE6F0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23CADE7CC(uint64_t a1)
{
  uint64_t v2 = sub_23CAE5460();
  sub_23CACBF9C(v2, v3, a1, &v9);
  swift_bridgeObjectRelease();
  if (!v10)
  {
    sub_23CACA184((uint64_t)&v9);
    goto LABEL_6;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    type metadata accessor for Log();
    __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8370);
    sub_23CAE53F0();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_23CAE6110;
    sub_23CAE5360();
    uint64_t v10 = MEMORY[0x263F8D310];
    *(void *)&long long v9 = 0xD000000000000041;
    *((void *)&v9 + 1) = 0x800000023CAE7AB0;
    sub_23CAE53D0();
    sub_23CACA184((uint64_t)&v9);
    sub_23CADCA8C();
    swift_bridgeObjectRelease();
    return 0;
  }
  sub_23CAD21F0(0, &qword_26AD6ECC8);
  sub_23CAD21F0(0, &qword_268BC87B0);
  uint64_t v4 = sub_23CAE55D0();
  uint64_t v5 = v4;
  if (v4)
  {
    sub_23CACA27C(v7, v8);
    return v5;
  }
  type metadata accessor for Log();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8370);
  sub_23CAE53F0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_23CAE6110;
  sub_23CAE5360();
  uint64_t v10 = MEMORY[0x263F8D310];
  *(void *)&long long v9 = 0xD00000000000002CLL;
  *((void *)&v9 + 1) = 0x800000023CAE7B00;
  sub_23CAE53D0();
  sub_23CACA184((uint64_t)&v9);
  sub_23CADCA8C();
  swift_bridgeObjectRelease();
  sub_23CACA27C(v7, v8);
  return 0;
}

uint64_t sub_23CADEAFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_23CAE5460();
  sub_23CACBF9C(v4, v5, a3, &v8);
  swift_bridgeObjectRelease();
  if (!v9)
  {
    sub_23CACA184((uint64_t)&v8);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  if (v7 >= 0xA) {
    return 0;
  }
  else {
    return (0x3C6u >> v7) & 1;
  }
}

uint64_t sub_23CADEBA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD6ED20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t getEnumTagSinglePayload for PaymentRequestLayoutStyle(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
    if (a2 + 2 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 2) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v5 = v6 - 3;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for PaymentRequestLayoutStyle(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x23CADED60);
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

ValueMetadata *type metadata accessor for PaymentRequestLayoutStyle()
{
  return &type metadata for PaymentRequestLayoutStyle;
}

unint64_t sub_23CADED9C()
{
  unint64_t result = qword_268BC87B8;
  if (!qword_268BC87B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC87B8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return swift_dynamicCast();
}

uint64_t destroy for SalableIconView(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  char v3 = *(unsigned char *)(a1 + 32);
  return sub_23CACE658(v2, v3);
}

uint64_t initializeWithCopy for SalableIconView(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  char v6 = *(unsigned char *)(a2 + 32);
  id v7 = v3;
  sub_23CACDC54(v5, v6);
  *(void *)(a1 + 24) = v5;
  *(unsigned char *)(a1 + 32) = v6;
  return a1;
}

uint64_t assignWithCopy for SalableIconView(uint64_t a1, void **a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  id v6 = v5;

  id v7 = v2[1];
  *(unsigned char *)(a1 + 16) = *((unsigned char *)v2 + 16);
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 17) = *((unsigned char *)v2 + 17);
  uint64_t v8 = (uint64_t)v2[3];
  LOBYTE(v2) = *((unsigned char *)v2 + 32);
  sub_23CACDC54(v8, (char)v2);
  uint64_t v9 = *(void *)(a1 + 24);
  char v10 = *(unsigned char *)(a1 + 32);
  *(void *)(a1 + 24) = v8;
  *(unsigned char *)(a1 + 32) = (_BYTE)v2;
  sub_23CACE658(v9, v10);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SalableIconView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  char v5 = *(unsigned char *)(a2 + 32);
  uint64_t v6 = *(void *)(a1 + 24);
  char v7 = *(unsigned char *)(a1 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(unsigned char *)(a1 + 32) = v5;
  sub_23CACE658(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for SalableIconView(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 33))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      uint64_t v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SalableIconView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 33) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 33) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SalableIconView()
{
  return &type metadata for SalableIconView;
}

uint64_t sub_23CADF05C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23CADF078@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_23CAE5270();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = *(void **)v1;
  if (*(void *)v1)
  {
    if (*(unsigned char *)(v1 + 16))
    {
      uint64_t v8 = *(void *)(v1 + 24);
      char v9 = *(unsigned char *)(v1 + 32);
      id v10 = v7;
      sub_23CACDC54(v8, v9);
      sub_23CAD1680(v8, v9);
      sub_23CACE658(v8, v9);
    }
    else
    {
      id v11 = v7;
    }
    id v12 = v7;
    sub_23CAE5250();
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F1B4B8], v3);
    uint64_t v13 = sub_23CAE5290();
    swift_release();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    char v14 = *(unsigned char *)(v1 + 17);
    double v15 = sub_23CADF328();
    if (qword_268BC8258 != -1) {
      swift_once();
    }
    uint64_t v24 = v13;
    uint64_t v25 = 0;
    __int16 v26 = 1;
    uint64_t v27 = qword_268BC83D0;
    uint64_t v28 = 0x3FE0000000000000;
    char v29 = v14;
    double v30 = v15;
    swift_retain();
    double v16 = sub_23CADF328();
    int v17 = LODWORD(v16);
    uint64_t v18 = sub_23CAE5340();
    sub_23CACCA0C(v21, 0, 1, 0, 1, v17, 0, 0, 1, 0, 1, 0x404B000000000000, 0, v18, v19, v21[0], v21[1], v21[2], SHIDWORD(v21[2]),
      v21[3],
      v21[4],
      v21[5],
      v21[6],
      v21[7],
      v21[8],
      v21[9],
      v21[10],
      v21[11],
      v21[12],
      v21[13],
      v21[14],
      v21[15],
      v21[16],
      v21[17],
      v21[18],
      v21[19],
      v21[20],
      v22[0],
      v22[1],
      v22[2],
      v22[3],
      v22[4],
      v22[5],
      v22[6],
      v22[7],
      v22[8],
      v22[9],
      v22[10],
      v22[11],
      v22[12],
      v22[13],
      v22[14]);
    swift_release();
    swift_release();

    memcpy(v22, v21, sizeof(v22));
    char v23 = 1;
    nullsub_1(v22);
  }
  else
  {
    sub_23CADF3A4(v22);
  }
  sub_23CADF3AC((uint64_t)v22, (uint64_t)v31);
  return sub_23CADF3AC((uint64_t)v31, a1);
}

double sub_23CADF328()
{
  if (!*(void *)v0) {
    return 54.0;
  }
  int v1 = *(unsigned __int8 *)(v0 + 17);
  int v2 = (CGImage *)*(id *)v0;
  int64_t Width = CGImageGetWidth(v2);
  int64_t Height = CGImageGetHeight(v2);

  BOOL v5 = v1 == 2 && Height < Width;
  double result = 54.0;
  if (v5) {
    return 72.0;
  }
  return result;
}

void sub_23CADF3A4(void *a1)
{
}

uint64_t sub_23CADF3AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC87C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_23CADF418()
{
  unint64_t result = qword_268BC87C8;
  if (!qword_268BC87C8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC87C0);
    sub_23CADF578(&qword_268BC87D0, &qword_268BC87D8, (void (*)(void))sub_23CADF4C4, (void (*)(void))sub_23CADF64C);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC87C8);
  }
  return result;
}

unint64_t sub_23CADF4C4()
{
  unint64_t result = qword_268BC87E0;
  if (!qword_268BC87E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC87E8);
    sub_23CADF578(&qword_268BC87F0, &qword_268BC87F8, (void (*)(void))sub_23CACD704, (void (*)(void))sub_23CADF600);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC87E0);
  }
  return result;
}

uint64_t sub_23CADF578(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
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

unint64_t sub_23CADF600()
{
  unint64_t result = qword_268BC8800;
  if (!qword_268BC8800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8800);
  }
  return result;
}

unint64_t sub_23CADF64C()
{
  unint64_t result = qword_268BC8808;
  if (!qword_268BC8808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8808);
  }
  return result;
}

uint64_t sub_23CADF698@<X0>(void *a1@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X8>)
{
  id v4 = a1;
  id v5 = objc_msgSend(v4, sel_label);
  uint64_t v56 = MEMORY[0x263F8EE78];
  uint64_t v6 = (long long *)objc_msgSend(v5, sel_length);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = &v56;
  *(void *)(v7 + 24) = v5;
  uint64_t v8 = (uint64_t *)swift_allocObject();
  v8[2] = (uint64_t)sub_23CAE16F8;
  v8[3] = v7;
  uint64_t v54 = sub_23CAE170C;
  uint64_t v55 = v8;
  uint64_t aBlock = MEMORY[0x263EF8330];
  *(void *)&long long v52 = 1107296256;
  *((void *)&v52 + 1) = sub_23CADFE0C;
  char v53 = &block_descriptor_2;
  char v9 = _Block_copy(&aBlock);
  id v10 = v5;
  swift_retain();
  swift_release();
  OUTLINED_FUNCTION_9_1(v10, sel_enumerateAttributesInRange_options_usingBlock_);
  _Block_release(v9);
  LOBYTE(v9) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v9)
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    char v14 = OUTLINED_FUNCTION_3_4();
    goto LABEL_22;
  }
  uint64_t v37 = v10;
  uint64_t v49 = 0;
  char v50 = 1;
  uint64_t v8 = (uint64_t *)objc_msgSend(v4, sel_label);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = &v49;
  id v10 = (void *)swift_allocObject();
  v10[2] = sub_23CAE1758;
  v10[3] = v11;
  uint64_t v54 = sub_23CAE2AE0;
  uint64_t v55 = v10;
  uint64_t aBlock = MEMORY[0x263EF8330];
  *(void *)&long long v52 = 1107296256;
  *((void *)&v52 + 1) = sub_23CADFE0C;
  char v53 = &block_descriptor_13;
  id v12 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  OUTLINED_FUNCTION_9_1(v8, sel_enumerateAttributesInRange_options_usingBlock_);

  _Block_release(v12);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v12) {
    goto LABEL_29;
  }
  __int16 v36 = (uint64_t *)v4;
  id v35 = objc_msgSend(v4, sel_image);
  uint64_t v34 = v49;
  char v13 = v50;
  uint64_t KeyPath = swift_getKeyPath();
  char v58 = v13;
  char v57 = 0;
  char v14 = (char *)MEMORY[0x263F8EE78];
  char v48 = (void *)MEMORY[0x263F8EE78];
  id v10 = *(void **)(v56 + 16);
  uint64_t v41 = v56 + 32;
  uint64_t v42 = v56;
  swift_bridgeObjectRetain();
  unint64_t v15 = 0;
  uint64_t v8 = &qword_26AD6ECB0;
  while (1)
  {
    if ((void *)v15 == v10)
    {
      unint64_t v15 = (unint64_t)v10;
      memset(v47, 0, sizeof(v47));
    }
    else
    {
      if (v15 >= *(void *)(v42 + 16))
      {
        __break(1u);
        goto LABEL_28;
      }
      uint64_t v6 = &v44;
      sub_23CAD218C(v41 + 40 * v15, (uint64_t)&v44);
      *(void *)&v47[0] = v15;
      sub_23CAD1FD4(&v44, (uint64_t)v47 + 8);
      ++v15;
    }
    sub_23CACD7F8((uint64_t)v47, (uint64_t)&aBlock, &qword_26AD6ECB0);
    if (!v54) {
      break;
    }
    sub_23CAD1FD4(&v52, (uint64_t)v47);
    sub_23CAD218C((uint64_t)v47, (uint64_t)v43);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EBA0);
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      double v16 = v48;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        char v14 = OUTLINED_FUNCTION_3_4();
      }
      unint64_t v18 = *((void *)v14 + 2);
      unint64_t v17 = *((void *)v14 + 3);
      if (v18 >= v17 >> 1) {
        char v14 = OUTLINED_FUNCTION_7_2(v17);
      }
      *((void *)v14 + 2) = v18 + 1;
      *(void *)&v14[8 * v18 + 32] = v16;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
      char v48 = (void *)MEMORY[0x263F8EE78];
    }
    else
    {
      sub_23CAD218C((uint64_t)v47, (uint64_t)v43);
      uint64_t v19 = v48;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        uint64_t v19 = sub_23CAE17C0(0, v19[2] + 1, 1, v19);
        char v48 = v19;
      }
      uint64_t v6 = &v52;
      unint64_t v21 = v19[2];
      unint64_t v20 = v19[3];
      if (v21 >= v20 >> 1) {
        char v48 = sub_23CAE17C0((void *)(v20 > 1), v21 + 1, 1, v19);
      }
      uint64_t v22 = v45;
      uint64_t v23 = v46;
      uint64_t v24 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v43, v45);
      MEMORY[0x270FA5388](v24);
      OUTLINED_FUNCTION_6_2();
      (*(void (**)(long long *))(v25 + 16))(&v52);
      sub_23CAE1EA8(v21, (uint64_t)&v52, (uint64_t *)&v48, v22, v23);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = (long long *)v48;
  if (!v48[2])
  {
    swift_bridgeObjectRelease();
    uint64_t v8 = v36;
    uint64_t v28 = v36;
    char v29 = v37;
    goto LABEL_26;
  }
  uint64_t v8 = v36;
  id v10 = v37;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_30;
  }
LABEL_22:
  unint64_t v27 = *((void *)v14 + 2);
  unint64_t v26 = *((void *)v14 + 3);
  if (v27 >= v26 >> 1) {
    char v14 = OUTLINED_FUNCTION_7_2(v26);
  }
  *((void *)v14 + 2) = v27 + 1;
  *(void *)&v14[8 * v27 + 32] = v6;
  uint64_t v28 = v10;
  char v29 = v8;
LABEL_26:

  swift_release();
  swift_release();
  uint64_t result = swift_bridgeObjectRelease();
  char v31 = v58;
  char v32 = v57;
  *(unsigned char *)a4 = a2;
  *(void *)(a4 + 8) = v8;
  *(unsigned char *)(a4 + 16) = a3 & 1;
  *(void *)(a4 + 24) = v35;
  *(void *)(a4 + 32) = v34;
  *(unsigned char *)(a4 + 40) = v31;
  *(unsigned char *)(a4 + 41) = a2;
  *(void *)(a4 + 48) = KeyPath;
  *(unsigned char *)(a4 + 56) = v32;
  *(void *)(a4 + 64) = v14;
  return result;
}

uint64_t sub_23CADFDE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

uint64_t sub_23CADFE0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  type metadata accessor for Key(0);
  sub_23CADA0CC();
  uint64_t v9 = sub_23CAE5400();
  v8(v9, a3, a4, a5);
  return swift_bridgeObjectRelease();
}

void sub_23CADFEAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, void *a6)
{
  id v11 = (id)*MEMORY[0x263F279F8];
  sub_23CACC000((uint64_t)v11, a1, &v74);

  if (v76)
  {
    if (swift_dynamicCast())
    {
      char v12 = v72;
      goto LABEL_6;
    }
  }
  else
  {
    sub_23CACD7A4((uint64_t)&v74, (uint64_t *)&unk_26AD6ED20);
  }
  char v12 = 0;
LABEL_6:
  id v13 = (id)*MEMORY[0x263F279E0];
  sub_23CACC000((uint64_t)v13, a1, &v74);

  if (!v76)
  {
LABEL_15:
    sub_23CACD7A4((uint64_t)&v74, (uint64_t *)&unk_26AD6ED20);
    goto LABEL_16;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EC80);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_16;
  }
  uint64_t v14 = sub_23CAE5460();
  sub_23CACBF9C(v14, v15, v72, &v74);
  swift_bridgeObjectRelease();
  if (!v76)
  {
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  if (swift_dynamicCast())
  {
    uint64_t v16 = sub_23CAE5460();
    sub_23CACBF9C(v16, v17, v72, &v74);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v76)
    {
      if (swift_dynamicCast())
      {
        sub_23CACA224(v72, v73);
        id v18 = sub_23CACFF68(v72, v73, *(double *)&v72);
        if (v18) {
          goto LABEL_19;
        }
      }
      sub_23CACA27C(v72, v73);
    }
    else
    {
      sub_23CACA27C(v72, v73);
      sub_23CACD7A4((uint64_t)&v74, (uint64_t *)&unk_26AD6ED20);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
LABEL_16:
  id v19 = (id)*MEMORY[0x263F279E8];
  sub_23CACC000((uint64_t)v19, a1, &v74);

  if (v76)
  {
    if (swift_dynamicCast())
    {
      sub_23CACA224(v72, v73);
      id v18 = sub_23CACFDD8(v72, v73);
      if (v18)
      {
LABEL_19:
        id v20 = v18;
        sub_23CAE1634();
        unint64_t v21 = *(void **)(*a5 + 16);
        sub_23CAE1680(v21);
        sub_23CAE1CA0((uint64_t)v21, (uint64_t)v20, a5);
        sub_23CACA27C(v72, v73);

        return;
      }
      sub_23CACA27C(v72, v73);
    }
  }
  else
  {
    sub_23CACD7A4((uint64_t)&v74, (uint64_t *)&unk_26AD6ED20);
  }
  id v22 = (id)*MEMORY[0x263F27A90];
  sub_23CACC000((uint64_t)v22, a1, &v74);

  if (v76)
  {
    if (swift_dynamicCast())
    {
      uint64_t KeyPath = swift_getKeyPath();
      uint64_t v24 = swift_getKeyPath();
      *(void *)&long long v74 = KeyPath;
      BYTE8(v74) = 0;
      uint64_t v75 = v24;
      LOBYTE(v76) = 0;
      BYTE1(v76) = v12;
      uint64_t v77 = v72;
      unint64_t v78 = v73;
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      sub_23CAE1634();
      uint64_t v25 = *(void **)(*a5 + 16);
      sub_23CAE1680(v25);
      sub_23CAE1D10((uint64_t)v25, &v74, a5);
      swift_bridgeObjectRelease();
      swift_release();
LABEL_58:
      swift_release();
      return;
    }
  }
  else
  {
    sub_23CACD7A4((uint64_t)&v74, (uint64_t *)&unk_26AD6ED20);
  }
  id v26 = (id)*MEMORY[0x263F27A38];
  sub_23CACC000((uint64_t)v26, a1, &v74);

  if (v76)
  {
    if (swift_dynamicCast())
    {
      sub_23CAE5470();
      strcpy((char *)&v74, "rating_mpaa_");
      BYTE13(v74) = 0;
      HIWORD(v74) = -5120;
      sub_23CAE54B0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      long long v27 = v74;
      sub_23CAE1634();
      uint64_t v28 = *(void **)(*a5 + 16);
      sub_23CAE1680(v28);
      char v29 = &unk_26F0B7218;
      double v30 = sub_23CAE2134;
      uint64_t v31 = (uint64_t)v28;
      uint64_t v33 = *((void *)&v27 + 1);
      uint64_t v32 = v27;
LABEL_61:
      sub_23CAE1DA4(v31, v32, v33, a5, (uint64_t)v29, (uint64_t (*)(void))v30);
      return;
    }
  }
  else
  {
    sub_23CACD7A4((uint64_t)&v74, (uint64_t *)&unk_26AD6ED20);
  }
  id v34 = (id)*MEMORY[0x263F27A40];
  sub_23CACC000((uint64_t)v34, a1, &v74);

  if (!v76) {
    goto LABEL_44;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EC80);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_45;
  }
  uint64_t v35 = sub_23CAE5460();
  sub_23CACBF9C(v35, v36, v72, &v74);
  swift_bridgeObjectRelease();
  if (!v76) {
    goto LABEL_43;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_65;
  }
  uint64_t v37 = sub_23CAE5460();
  sub_23CACBF9C(v37, v38, v72, &v74);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v76)
  {
LABEL_43:
    swift_bridgeObjectRelease();
LABEL_44:
    sub_23CACD7A4((uint64_t)&v74, (uint64_t *)&unk_26AD6ED20);
    goto LABEL_45;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_65:
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  uint64_t v39 = sub_23CAD0140();
  if (v40)
  {
    uint64_t v41 = v39;
    uint64_t v42 = v40;
    sub_23CAE1634();
    uint64_t v43 = *(void **)(*a5 + 16);
    sub_23CAE1680(v43);
    char v29 = &unk_26F0B7218;
    double v30 = sub_23CAE2134;
    uint64_t v31 = (uint64_t)v43;
    uint64_t v32 = v41;
    uint64_t v33 = v42;
    goto LABEL_61;
  }
LABEL_45:
  if (a3 != 1) {
    goto LABEL_51;
  }
  id v44 = objc_msgSend(a6, sel_attributedSubstringFromRange_, a2, 1);
  id v45 = objc_msgSend(v44, sel_string);

  uint64_t v46 = sub_23CAE5460();
  uint64_t v48 = v47;

  if (v46 == 10 && v48 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    goto LABEL_60;
  }
  char v50 = sub_23CAE56E0();
  swift_bridgeObjectRelease();
  if (v50)
  {
LABEL_60:
    id v65 = objc_msgSend(a6, sel_attributedSubstringFromRange_, a2, 1);
    id v66 = objc_msgSend(v65, sel_string);

    uint64_t v67 = sub_23CAE5460();
    uint64_t v69 = v68;

    sub_23CAE1634();
    uint64_t v70 = *(void **)(*a5 + 16);
    sub_23CAE1680(v70);
    char v29 = &unk_26F0B7370;
    double v30 = sub_23CAE2180;
    uint64_t v31 = (uint64_t)v70;
    uint64_t v32 = v67;
    uint64_t v33 = v69;
    goto LABEL_61;
  }
LABEL_51:
  id v51 = objc_msgSend(a6, sel_attributedSubstringFromRange_, a2, a3);
  uint64_t v52 = swift_getKeyPath();
  uint64_t v53 = swift_getKeyPath();
  *(void *)&long long v74 = v52;
  BYTE8(v74) = 0;
  uint64_t v75 = v53;
  LOBYTE(v76) = 0;
  uint64_t v77 = (uint64_t)v51;
  id v54 = v51;
  swift_retain();
  swift_retain();
  sub_23CAE1634();
  uint64_t v55 = *(void **)(*a5 + 16);
  sub_23CAE1680(v55);
  sub_23CAE1E14((uint64_t)v55, (uint64_t)&v74, a5);
  id v56 = objc_msgSend(v54, sel_string);
  uint64_t v57 = sub_23CAE5460();
  unint64_t v59 = v58;

  uint64_t v60 = sub_23CAE086C(v57, v59);
  uint64_t v62 = v61;
  swift_bridgeObjectRelease();
  if (!v62)
  {
LABEL_57:
    swift_release();

    goto LABEL_58;
  }
  if (v60 == 10 && v62 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v64 = sub_23CAE56E0();
    swift_bridgeObjectRelease();
    if ((v64 & 1) == 0) {
      goto LABEL_57;
    }
  }
  sub_23CAE1634();
  uint64_t v71 = *(void **)(*a5 + 16);
  sub_23CAE1680(v71);
  sub_23CAE1DA4((uint64_t)v71, 10, 0xE100000000000000, a5, (uint64_t)&unk_26F0B7370, (uint64_t (*)(void))sub_23CAE2180);
  swift_release();
  swift_release();
}

uint64_t sub_23CAE086C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return 0;
  }
  sub_23CAE54A0();
  return sub_23CAE54F0();
}

uint64_t sub_23CAE08EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(void *)(a1 + 16))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    return sub_23CACD7A4((uint64_t)&v14, (uint64_t *)&unk_26AD6ED20);
  }
  id v7 = (id)*MEMORY[0x263F279E0];
  unint64_t v8 = sub_23CACD26C((uint64_t)v7);
  if ((v9 & 1) == 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;

    return sub_23CACD7A4((uint64_t)&v14, (uint64_t *)&unk_26AD6ED20);
  }
  sub_23CACD210(*(void *)(a1 + 56) + 32 * v8, (uint64_t)&v14);

  if (!*((void *)&v15 + 1)) {
    return sub_23CACD7A4((uint64_t)&v14, (uint64_t *)&unk_26AD6ED20);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EC80);
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
    return result;
  }
  uint64_t v11 = sub_23CAE5460();
  sub_23CACBF9C(v11, v12, v13, &v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v15 + 1)) {
    return sub_23CACD7A4((uint64_t)&v14, (uint64_t *)&unk_26AD6ED20);
  }
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    *(void *)a5 = v13;
    *(unsigned char *)(a5 + 8) = 0;
  }
  return result;
}

uint64_t sub_23CAE0A24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = (const void *)v1;
  uint64_t v66 = a1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8398);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC83A0);
  uint64_t v8 = MEMORY[0x270FA5388](v7 - 8);
  uint64_t v64 = (uint64_t)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v62 = (uint64_t)&v58 - v10;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8878);
  MEMORY[0x270FA5388](v11 - 8);
  OUTLINED_FUNCTION_19();
  uint64_t v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8868);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v12);
  OUTLINED_FUNCTION_3_1();
  uint64_t v63 = v13;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8858);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v14);
  OUTLINED_FUNCTION_3_1();
  uint64_t v65 = v15;
  if (*(void *)(*(void *)(v1 + 64) + 16) == 1) {
    uint64_t v16 = sub_23CAE4E40();
  }
  else {
    uint64_t v16 = sub_23CAE4E30();
  }
  *(void *)uint64_t v2 = v16;
  *(void *)(v2 + 8) = 0;
  *(unsigned char *)(v2 + 16) = 0;
  id v18 = *(void **)(v1 + 24);
  uint64_t v17 = *(void *)(v1 + 32);
  int v19 = *(unsigned __int8 *)(v1 + 40);
  LODWORD(v58) = *(unsigned __int8 *)(v1 + 41);
  HIDWORD(v58) = v19;
  uint64_t v20 = *(void *)(v1 + 48);
  char v21 = *(unsigned char *)(v1 + 56);
  id v59 = v18;
  sub_23CACDC54(v20, v21);
  unsigned __int8 v22 = sub_23CAE4F70();
  char v23 = sub_23CAE4F60();
  sub_23CAE4F60();
  if (sub_23CAE4F60() != v22) {
    char v23 = sub_23CAE4F60();
  }
  uint64_t v24 = (void *)(v2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BC88A8) + 44));
  sub_23CAE4C50();
  uint64_t v70 = v18;
  uint64_t v71 = v17;
  char v72 = BYTE4(v58);
  char v73 = v58;
  uint64_t v74 = v20;
  char v75 = v21;
  char v76 = v23;
  uint64_t v77 = v25;
  uint64_t v78 = v26;
  uint64_t v79 = v27;
  uint64_t v80 = v28;
  char v81 = 0;
  uint64_t v56 = sub_23CAE5340();
  uint64_t v57 = v29;
  int v30 = OUTLINED_FUNCTION_2_3();
  sub_23CACCCA0(v30, v31, v32, v33, v34, v35, v36, v37, 0, 1, 0x7FF0000000000000, 0, v56, v57, v58, (int)v59, SHIDWORD(v59), v60, v61,
    v62,
    v63,
    v64,
    v65,
    v66,
    v67[0],
    v67[1],
    v67[2],
    v67[3],
    v67[4],
    v67[5],
    v67[6],
    v67[7],
    v67[8],
    v67[9],
    v67[10],
    v67[11],
    v67[12],
    v67[13],
    v67[14],
    v67[15],
    v67[16],
    v67[17],
    v67[18],
    v67[19],
    v67[20],
    v67[21],
    v67[22],
    v67[23],
    v67[24],
    v68[0],
    v68[1]);

  sub_23CACE658(v20, v21);
  *(void *)uint64_t v6 = sub_23CAE4EB0();
  *((void *)v6 + 1) = 0;
  v6[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8888);
  sub_23CAE0F00(v3);
  sub_23CAE5340();
  uint64_t v38 = v64;
  OUTLINED_FUNCTION_2_3();
  sub_23CACCE00();
  sub_23CACD7A4((uint64_t)v6, &qword_268BC8398);
  uint64_t v39 = v62;
  sub_23CACD7F8(v38, v62, &qword_268BC83A0);
  sub_23CACDC60(v39, v38, &qword_268BC83A0);
  memcpy(v68, v67, sizeof(v68));
  memcpy(v24, v67, 0xC8uLL);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC88B0);
  sub_23CACDC60(v38, (uint64_t)v24 + *(int *)(v40 + 48), &qword_268BC83A0);
  sub_23CACDC0C((uint64_t)v68);
  sub_23CACD7A4(v39, &qword_268BC83A0);
  sub_23CACD7A4(v38, &qword_268BC83A0);
  memcpy(v69, v67, sizeof(v69));
  sub_23CAE2874((uint64_t)v69);
  uint64_t v41 = v63;
  sub_23CACDC60(v2, v63, &qword_268BC8878);
  *(_WORD *)(v41 + *(int *)(v61 + 36)) = 256;
  sub_23CACD7A4(v2, &qword_268BC8878);
  uint64_t v42 = v65;
  sub_23CACDC60(v41, v65, &qword_268BC8868);
  uint64_t v43 = v42 + *(int *)(v60 + 36);
  *(void *)uint64_t v43 = 0;
  *(_WORD *)(v43 + 8) = 1;
  sub_23CACD7A4(v41, &qword_268BC8868);
  char v44 = sub_23CAE4F20();
  sub_23CAE4C50();
  uint64_t v46 = v45;
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  uint64_t v53 = v66;
  sub_23CACDC60(v42, v66, &qword_268BC8858);
  uint64_t v54 = v53 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268BC8828) + 36);
  *(unsigned char *)uint64_t v54 = v44;
  *(void *)(v54 + 8) = v46;
  *(void *)(v54 + 16) = v48;
  *(void *)(v54 + 24) = v50;
  *(void *)(v54 + 32) = v52;
  *(unsigned char *)(v54 + 40) = 0;
  return sub_23CACD7A4(v42, &qword_268BC8858);
}

uint64_t sub_23CAE0F00(const void *a1)
{
  uint64_t v2 = swift_bridgeObjectRetain();
  sub_23CADA11C(v2);
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  uint64_t v3 = swift_allocObject();
  memcpy((void *)(v3 + 16), a1, 0x48uLL);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = sub_23CAE2754;
  *(void *)(v4 + 24) = v3;
  sub_23CAE27C4((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6ECA0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8898);
  sub_23CACA8C8(&qword_26AD6ECA8, &qword_26AD6ECA0);
  sub_23CAE2588(&qword_268BC88A0, &qword_268BC8898, (void (*)(void))sub_23CAE2828);
  return sub_23CAE5320();
}

__n128 sub_23CAE108C@<Q0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  if (*(unsigned char *)(a2 + 16)) {
    uint64_t v5 = sub_23CAE5340();
  }
  else {
    uint64_t v5 = sub_23CAE5350();
  }
  sub_23CACCFD4(v20, 0, 1, 0, 1, 0x7FF0000000000000, 0, 0, 1, 0, 1, 0, 1, v5, v6, a1);
  uint64_t v7 = v20[1];
  char v8 = v21;
  uint64_t v9 = v22;
  char v10 = v23;
  uint64_t v11 = v24;
  char v12 = v25;
  uint64_t v13 = v26;
  char v14 = v27;
  uint64_t v15 = v28;
  char v16 = v29;
  uint64_t v17 = v30;
  char v18 = v31;
  __n128 result = v32;
  *(void *)a3 = v20[0];
  *(void *)(a3 + 8) = v7;
  *(unsigned char *)(a3 + 16) = v8;
  *(void *)(a3 + 24) = v9;
  *(unsigned char *)(a3 + 32) = v10;
  *(void *)(a3 + 40) = v11;
  *(unsigned char *)(a3 + 48) = v12;
  *(void *)(a3 + 56) = v13;
  *(unsigned char *)(a3 + 64) = v14;
  *(void *)(a3 + 72) = v15;
  *(unsigned char *)(a3 + 80) = v16;
  *(void *)(a3 + 88) = v17;
  *(unsigned char *)(a3 + 96) = v18;
  *(__n128 *)(a3 + 104) = result;
  return result;
}

uint64_t sub_23CAE1178@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8398);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v9 = (char *)&v19 - v8;
  long long v10 = *(_OWORD *)(a1 + 40);
  long long v19 = *(_OWORD *)(a1 + 24);
  long long v20 = v10;
  char v21 = *(unsigned char *)(a1 + 56);
  sub_23CACD7F8((uint64_t)&v19, (uint64_t)&v24, &qword_26AD6ECC0);
  uint64_t v22 = *((void *)&v20 + 1);
  char v23 = v21;
  sub_23CAE26A4(&v24);
  sub_23CAE26D0((uint64_t)&v22);
  *(void *)uint64_t v9 = sub_23CAE4EB0();
  *((void *)v9 + 1) = 0;
  v9[16] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8888);
  sub_23CAE0F00((const void *)a1);
  long long v11 = v19;
  char v12 = v20;
  char v13 = BYTE1(v20);
  uint64_t v14 = *((void *)&v20 + 1);
  char v15 = v21;
  sub_23CACDC60((uint64_t)v9, (uint64_t)v7, &qword_268BC8398);
  v15 &= 1u;
  *(_OWORD *)a2 = v11;
  *(unsigned char *)(a2 + 16) = v12 & 1;
  *(unsigned char *)(a2 + 17) = v13;
  *(void *)(a2 + 24) = v14;
  *(unsigned char *)(a2 + 32) = v15;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8890);
  sub_23CACDC60((uint64_t)v7, a2 + *(int *)(v16 + 48), &qword_268BC8398);
  id v17 = (id)v11;
  sub_23CACDC54(v14, v15);
  sub_23CACD7A4((uint64_t)v9, &qword_268BC8398);
  sub_23CACD7A4((uint64_t)v7, &qword_268BC8398);

  return sub_23CACE658(v14, v15);
}

uint64_t sub_23CAE133C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8828);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v3);
  OUTLINED_FUNCTION_19();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8830);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8838);
  OUTLINED_FUNCTION_10();
  MEMORY[0x270FA5388](v7);
  OUTLINED_FUNCTION_6_2();
  if (*(unsigned char *)(v0 + 16) == 1)
  {
    *(void *)uint64_t v2 = sub_23CAE4EA0();
    *(void *)(v2 + 8) = 0;
    *(unsigned char *)(v2 + 16) = 1;
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8880);
    sub_23CAE1178(v0, v2 + *(int *)(v8 + 44));
    uint64_t v9 = &qword_268BC8838;
    sub_23CACDC60(v2, (uint64_t)v6, &qword_268BC8838);
    swift_storeEnumTagMultiPayload();
    sub_23CACA8C8(&qword_268BC8840, &qword_268BC8838);
    sub_23CAE2588(&qword_268BC8848, &qword_268BC8828, (void (*)(void))sub_23CAE2558);
    OUTLINED_FUNCTION_4_1();
    sub_23CAE4EC0();
    uint64_t v10 = v2;
  }
  else
  {
    sub_23CAE0A24(v1);
    uint64_t v9 = &qword_268BC8828;
    sub_23CACDC60(v1, (uint64_t)v6, &qword_268BC8828);
    swift_storeEnumTagMultiPayload();
    sub_23CACA8C8(&qword_268BC8840, &qword_268BC8838);
    sub_23CAE2588(&qword_268BC8848, &qword_268BC8828, (void (*)(void))sub_23CAE2558);
    OUTLINED_FUNCTION_4_1();
    sub_23CAE4EC0();
    uint64_t v10 = v1;
  }
  return sub_23CACD7A4(v10, v9);
}

uint64_t sub_23CAE159C()
{
  memcpy(__dst, v0, sizeof(__dst));
  return sub_23CAE133C();
}

uint64_t sub_23CAE15E0@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_23CAE4D60();
  *a1 = v3;
  return result;
}

uint64_t sub_23CAE160C()
{
  return sub_23CAE4D70();
}

void *sub_23CAE1634()
{
  uint64_t v1 = *v0;
  uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
  const void *v0 = v1;
  if (!result)
  {
    uint64_t result = sub_23CAE17C0(result, v1[2] + 1, 1, v1);
    const void *v0 = result;
  }
  return result;
}

void *sub_23CAE1680(void *result)
{
  unint64_t v2 = (*v1)[3];
  if ((uint64_t)result + 1 > (uint64_t)(v2 >> 1))
  {
    uint64_t result = sub_23CAE17C0((void *)(v2 > 1), (int64_t)result + 1, 1, *v1);
    *uint64_t v1 = result;
  }
  return result;
}

uint64_t sub_23CAE16C0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_23CAE16F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23CADFEAC(a1, a2, a3, a4, *(uint64_t **)(v4 + 16), *(void **)(v4 + 24));
}

uint64_t sub_23CAE1700()
{
  return OUTLINED_FUNCTION_1_5(v0, 32);
}

uint64_t sub_23CAE170C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_23CAE174C()
{
  return OUTLINED_FUNCTION_1_5(v0, 24);
}

uint64_t sub_23CAE1758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23CAE08EC(a1, a2, a3, a4, *(void *)(v4 + 16));
}

uint64_t sub_23CAE1760()
{
  return OUTLINED_FUNCTION_1_5(v0, 32);
}

uint64_t sub_23CAE176C@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_23CAE4D60();
  *a1 = v3;
  return result;
}

uint64_t sub_23CAE1798()
{
  return sub_23CAE4D70();
}

void *sub_23CAE17C0(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6ED10);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || &a4[5 * v8 + 4] <= v10 + 4) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EBA0);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_23CAE18E8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6ED08);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  char v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[8 * v8] <= v12) {
      memmove(v12, v13, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_23CAE19E8(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
        __break(1u);
        return result;
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
    char v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6ED00);
  uint64_t v10 = *(void *)(type metadata accessor for FlexListItem() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  char v13 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_24;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for FlexListItem() - 8);
  if (v5)
  {
    unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    sub_23CAE1BCC(a4 + v16, v8, (unint64_t)v13 + v16);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

char *sub_23CAE1B98(char *__src, uint64_t a2, char *__dst)
{
  if (__dst != __src || &__src[40 * a2] <= __dst) {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

uint64_t sub_23CAE1BCC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 < a1
    || (uint64_t result = type metadata accessor for FlexListItem(), a1 + *(void *)(*(void *)(result - 8) + 72) * a2 <= a3))
  {
    uint64_t v7 = type metadata accessor for FlexListItem();
    return MEMORY[0x270FA01D8](a3, a1, a2, v7);
  }
  else if (a3 != a1)
  {
    return MEMORY[0x270FA01D0](a3, a1, a2, result);
  }
  return result;
}

uint64_t sub_23CAE1CA0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v9 = &unk_26F0B72C8;
  unint64_t v10 = sub_23CAE2054();
  *(void *)&long long v8 = a2;
  uint64_t v6 = *a3;
  *(void *)(v6 + 16) = a1 + 1;
  return sub_23CAD1FD4(&v8, v6 + 40 * a1 + 32);
}

uint64_t sub_23CAE1D10(uint64_t a1, _OWORD *a2, uint64_t *a3)
{
  uint64_t v11 = &unk_26F0B7298;
  unint64_t v12 = sub_23CAE20A0();
  uint64_t v6 = (_OWORD *)swift_allocObject();
  *(void *)&long long v10 = v6;
  long long v7 = a2[1];
  v6[1] = *a2;
  v6[2] = v7;
  v6[3] = a2[2];
  uint64_t v8 = *a3;
  *(void *)(v8 + 16) = a1 + 1;
  return sub_23CAD1FD4(&v10, v8 + 40 * a1 + 32);
}

uint64_t sub_23CAE1DA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t (*a6)(void))
{
  uint64_t v13 = a5;
  uint64_t v14 = a6();
  *(void *)&long long v12 = a2;
  *((void *)&v12 + 1) = a3;
  uint64_t v10 = *a4;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_23CAD1FD4(&v12, v10 + 40 * a1 + 32);
}

uint64_t sub_23CAE1E14(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v11 = &unk_26F0B7190;
  unint64_t v12 = sub_23CAE21CC();
  uint64_t v6 = swift_allocObject();
  *(void *)&long long v10 = v6;
  long long v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v6 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v6 + 32) = v7;
  *(void *)(v6 + 48) = *(void *)(a2 + 32);
  uint64_t v8 = *a3;
  *(void *)(v8 + 16) = a1 + 1;
  return sub_23CAD1FD4(&v10, v8 + 40 * a1 + 32);
}

uint64_t sub_23CAE1EA8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v13 = a4;
  uint64_t v14 = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  uint64_t v10 = *a3;
  *(void *)(v10 + 16) = a1 + 1;
  return sub_23CAD1FD4(&v12, v10 + 40 * a1 + 32);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_23CAE2054()
{
  unint64_t result = qword_268BC8810;
  if (!qword_268BC8810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8810);
  }
  return result;
}

unint64_t sub_23CAE20A0()
{
  unint64_t result = qword_268BC8818;
  if (!qword_268BC8818)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8818);
  }
  return result;
}

uint64_t sub_23CAE20EC()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 64, 7);
}

unint64_t sub_23CAE2134()
{
  unint64_t result = qword_268BC8820;
  if (!qword_268BC8820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8820);
  }
  return result;
}

unint64_t sub_23CAE2180()
{
  unint64_t result = qword_26AD6EB98;
  if (!qword_26AD6EB98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD6EB98);
  }
  return result;
}

unint64_t sub_23CAE21CC()
{
  unint64_t result = qword_26AD6EBB0;
  if (!qword_26AD6EBB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD6EBB0);
  }
  return result;
}

uint64_t sub_23CAE2218()
{
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t destroy for SalableItemView(uint64_t a1)
{
  sub_23CACE658(*(void *)(a1 + 48), *(unsigned char *)(a1 + 56));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SalableItemView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = *(void **)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v5;
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 48);
  char v8 = *(unsigned char *)(a2 + 56);
  id v9 = v4;
  id v10 = v6;
  sub_23CACDC54(v7, v8);
  *(void *)(a1 + 48) = v7;
  *(unsigned char *)(a1 + 56) = v8;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SalableItemView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  uint64_t v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  id v6 = v4;

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v7 = *(void **)(a1 + 24);
  char v8 = *(void **)(a2 + 24);
  *(void *)(a1 + 24) = v8;
  id v9 = v8;

  uint64_t v10 = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 32) = v10;
  *(unsigned char *)(a1 + 41) = *(unsigned char *)(a2 + 41);
  uint64_t v11 = *(void *)(a2 + 48);
  char v12 = *(unsigned char *)(a2 + 56);
  sub_23CACDC54(v11, v12);
  uint64_t v13 = *(void *)(a1 + 48);
  char v14 = *(unsigned char *)(a1 + 56);
  *(void *)(a1 + 48) = v11;
  *(unsigned char *)(a1 + 56) = v12;
  sub_23CACE658(v13, v14);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy72_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

uint64_t assignWithTake for SalableItemView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);

  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(_WORD *)(a1 + 40) = *(_WORD *)(a2 + 40);
  char v6 = *(unsigned char *)(a2 + 56);
  uint64_t v7 = *(void *)(a1 + 48);
  char v8 = *(unsigned char *)(a1 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = v6;
  sub_23CACE658(v7, v8);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SalableItemView(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(unsigned char *)(a1 + 72))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SalableItemView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
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
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SalableItemView()
{
  return &type metadata for SalableItemView;
}

uint64_t sub_23CAE253C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23CAE2558()
{
  return sub_23CAE2588(&qword_268BC8850, &qword_268BC8858, (void (*)(void))sub_23CAE2604);
}

uint64_t sub_23CAE2588(unint64_t *a1, uint64_t *a2, void (*a3)(void))
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

unint64_t sub_23CAE2604()
{
  unint64_t result = qword_268BC8860;
  if (!qword_268BC8860)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC8868);
    sub_23CACA8C8(&qword_268BC8870, &qword_268BC8878);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8860);
  }
  return result;
}

id *sub_23CAE26A4(id *a1)
{
  id v2 = *a1;
  return a1;
}

uint64_t sub_23CAE26D0(uint64_t a1)
{
  return a1;
}

uint64_t sub_23CAE2700()
{
  sub_23CACE658(*(void *)(v0 + 64), *(unsigned char *)(v0 + 72));
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 88, 7);
}

double sub_23CAE2754@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)&double result = sub_23CAE108C(a1, v2 + 16, a2).n128_u64[0];
  return result;
}

uint64_t sub_23CAE275C()
{
  swift_release();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_23CAE2794(void *a1)
{
  return (*(uint64_t (**)(void, void))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_23CAE27C4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 48);
  char v4 = *(unsigned char *)(a1 + 56);
  id v5 = *(id *)(a1 + 24);
  id v6 = v2;
  sub_23CACDC54(v3, v4);
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_23CAE2828()
{
  unint64_t result = qword_26AD6EB88;
  if (!qword_26AD6EB88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD6EB88);
  }
  return result;
}

uint64_t sub_23CAE2874(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  char v3 = *(unsigned char *)(a1 + 32);

  sub_23CACE658(v2, v3);
  return a1;
}

unsigned char *storeEnumTagSinglePayload for SalableItemView.Layout(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 1;
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
        JUMPOUT(0x23CAE2988);
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
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SalableItemView.Layout()
{
  return &type metadata for SalableItemView.Layout;
}

unint64_t sub_23CAE29C4()
{
  unint64_t result = qword_268BC88B8;
  if (!qword_268BC88B8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC88C0);
    sub_23CACA8C8(&qword_268BC8840, &qword_268BC8838);
    sub_23CAE2588(&qword_268BC8848, &qword_268BC8828, (void (*)(void))sub_23CAE2558);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC88B8);
  }
  return result;
}

unint64_t sub_23CAE2A94()
{
  unint64_t result = qword_268BC88C8;
  if (!qword_268BC88C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC88C8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_5(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA0238](a1, a2, 7);
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return 0;
}

char *OUTLINED_FUNCTION_3_4()
{
  int64_t v2 = *(void *)(v0 + 16) + 1;
  return sub_23CAE18E8(0, v2, 1, (char *)v0);
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return v0;
}

char *OUTLINED_FUNCTION_7_2@<X0>(unint64_t a1@<X8>)
{
  return sub_23CAE18E8((char *)(a1 > 1), v1, 1, v2);
}

id OUTLINED_FUNCTION_9_1(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 0, v3, 0, v2);
}

uint64_t destroy for SecondaryContentView(id *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t _s33AppleMediaServicesUIPaymentSheets20SecondaryContentViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  id v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SecondaryContentView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SecondaryContentView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SecondaryContentView(uint64_t *a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      uint64_t v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v3) = -1;
      }
      int v2 = v3 - 1;
      if (v2 < 0) {
        int v2 = -1;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SecondaryContentView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SecondaryContentView()
{
  return &type metadata for SecondaryContentView;
}

uint64_t sub_23CAE2DA8()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 sub_23CAE2DC4@<Q0>(void *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_23CAE4EA0();
  sub_23CAE2E68(a1, a2, a3, (uint64_t)v17);
  uint64_t v9 = v18;
  __int16 v10 = v19;
  __n128 result = (__n128)v17[0];
  long long v12 = v17[1];
  long long v13 = v17[2];
  long long v14 = v17[3];
  long long v15 = v17[4];
  long long v16 = v17[5];
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = 0;
  *(unsigned char *)(a4 + 16) = 1;
  *(__n128 *)(a4 + 24) = result;
  *(_OWORD *)(a4 + 40) = v12;
  *(_OWORD *)(a4 + 56) = v13;
  *(_OWORD *)(a4 + 72) = v14;
  *(_OWORD *)(a4 + 88) = v15;
  *(_OWORD *)(a4 + 104) = v16;
  *(void *)(a4 + 120) = v9;
  *(_WORD *)(a4 + 128) = v10;
  return result;
}

uint64_t sub_23CAE2E68@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  if (a1)
  {
    sub_23CADF698(a1, a3, 1, (uint64_t)v19);
    uint64_t v6 = v19[0];
    uint64_t v7 = v20;
    uint64_t v8 = v21;
    uint64_t v9 = v22;
    uint64_t v10 = v23;
    uint64_t v11 = v26;
    uint64_t v12 = v27;
    uint64_t v18 = v28;
    unint64_t v13 = v24 | ((unint64_t)v25 << 8);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    unint64_t v13 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v18 = 0;
  }
  if (a2)
  {
    uint64_t v14 = sub_23CAE4EA0();
    uint64_t v15 = 1;
    __int16 v16 = 257;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    __int16 v16 = 0;
  }
  *(void *)a4 = v6;
  *(void *)(a4 + 8) = v7;
  *(void *)(a4 + 16) = v8;
  *(void *)(a4 + 24) = v9;
  *(void *)(a4 + 32) = v10;
  *(void *)(a4 + 40) = v13;
  *(void *)(a4 + 48) = v11;
  *(void *)(a4 + 56) = v12;
  *(void *)(a4 + 64) = v18;
  *(void *)(a4 + 72) = v14;
  *(void *)(a4 + 80) = 0;
  *(void *)(a4 + 88) = v15;
  *(void *)(a4 + 96) = a2;
  *(_WORD *)(a4 + 104) = v16;
  swift_bridgeObjectRetain();
  sub_23CACE560(v6, v7, v8, v9, v10, v13, v11, v12);
  return sub_23CACE5F0(v6, v7, v8, v9, v10, v13, v11, v12);
}

double sub_23CAE2FC4@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_23CAE2DC4((void *)*(void *)v1, *(void *)(v1 + 8), *(unsigned char *)(v1 + 16), a1).n128_u64[0];
  return result;
}

unint64_t sub_23CAE2FD4()
{
  unint64_t result = qword_268BC88D0;
  if (!qword_268BC88D0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC88D8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC88D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for TitleHeaderView()
{
  return &type metadata for TitleHeaderView;
}

uint64_t sub_23CAE3038()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23CAE3054@<X0>(uint64_t a1@<X8>)
{
  sub_23CAC9A30();
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_23CAE5130();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  sub_23CAE5000();
  uint64_t v7 = sub_23CAE5100();
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  sub_23CAC9AA4(v2, v4, v6);
  swift_bridgeObjectRelease();
  sub_23CAE4FC0();
  uint64_t v12 = sub_23CAE5040();
  uint64_t v14 = v13;
  char v16 = v15;
  uint64_t v18 = v17;
  sub_23CAC9AA4(v7, v9, v11 & 1);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)a1 = v12;
  *(void *)(a1 + 8) = v14;
  *(unsigned char *)(a1 + 16) = v16 & 1;
  *(void *)(a1 + 24) = v18;
  return result;
}

uint64_t sub_23CAE3180@<X0>(uint64_t a1@<X8>)
{
  return sub_23CAE3054(a1);
}

uint64_t sub_23CAE3188()
{
  return MEMORY[0x263F1A820];
}

uint64_t EnvironmentValues.primaryText.getter()
{
  return sub_23CAE3DE4((void (*)(void))sub_23CAE31B4);
}

unint64_t sub_23CAE31B4()
{
  unint64_t result = qword_268BC88F0;
  if (!qword_268BC88F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC88F0);
  }
  return result;
}

uint64_t sub_23CAE3200@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.primaryText.getter();
  *a1 = result;
  return result;
}

uint64_t sub_23CAE322C()
{
  uint64_t v0 = swift_retain();
  return EnvironmentValues.primaryText.setter(v0);
}

uint64_t EnvironmentValues.primaryText.setter(uint64_t a1)
{
  return sub_23CAE3EF0(a1, (void (*)(void))sub_23CAE31B4);
}

uint64_t (*sub_23CAE3278(void *a1, unsigned __int8 a2, uint64_t a3))()
{
  id v6 = a1;
  swift_bridgeObjectRetain();
  sub_23CACDEB4(a1, a2, a3, v15);
  if (a2)
  {
    sub_23CAE44C8(v15, (void (*)(void, void, void, void, void))sub_23CAE41A4);
    if (a2 == 1)
    {
      uint64_t v7 = OUTLINED_FUNCTION_1_6();
      *(void *)(v7 + 16) = a1;
      *(unsigned char *)(v7 + 24) = 1;
      *(void *)(v7 + 32) = a3;
      swift_bridgeObjectRetain();
      id v8 = v6;
      return sub_23CAE421C;
    }
    else
    {
      uint64_t v11 = OUTLINED_FUNCTION_1_6();
      *(void *)(v11 + 16) = a1;
      *(unsigned char *)(v11 + 24) = 2;
      *(void *)(v11 + 32) = a3;
      swift_bridgeObjectRetain();
      id v12 = v6;
      return sub_23CAE4208;
    }
  }
  else if (a1 && objc_msgSend(v6, sel_drawBackground))
  {
    uint64_t v10 = swift_allocObject();
    sub_23CAE4230((uint64_t)v15, v10 + 16);
    return sub_23CAE42FC;
  }
  else
  {
    uint64_t v13 = swift_allocObject();
    sub_23CAE4230((uint64_t)v15, v13 + 16);
    return sub_23CAE4298;
  }
}

uint64_t sub_23CAE3428(uint64_t a1)
{
  uint64_t v2 = sub_23CAE4D10();
  uint64_t v3 = v2 - 8;
  MEMORY[0x270FA5388](v2);
  char v5 = &v24[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8908);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = &v24[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8910);
  MEMORY[0x270FA5388](v10);
  id v12 = &v24[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_23CAE4230(a1, (uint64_t)v24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EB78);
  sub_23CAE4304();
  sub_23CAE5150();
  uint64_t v13 = &v5[*(int *)(v3 + 28)];
  uint64_t v14 = *MEMORY[0x263F19860];
  uint64_t v15 = sub_23CAE4E60();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v13, v14, v15);
  __asm { FMOV            V0.2D, #12.0 }
  *(_OWORD *)char v5 = _Q0;
  uint64_t v21 = (uint64_t)&v12[*(int *)(v10 + 36)];
  sub_23CAC9908((uint64_t)v5, v21);
  *(_WORD *)(v21 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EBC0) + 36)) = 256;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v12, v9, v6);
  sub_23CAC996C((uint64_t)v5);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_23CAE43C4();
  return sub_23CAE52F0();
}

uint64_t sub_23CAE3690(void *a1)
{
  sub_23CAE4230((uint64_t)a1, (uint64_t)v3);
  sub_23CAE44C8(a1, (void (*)(void, void, void, void, void))sub_23CAE4504);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EB78);
  sub_23CAE4304();
  return sub_23CAE52F0();
}

uint64_t sub_23CAE3700(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23CADDC60(a3, &v4);
  sub_23CAE4560();
  return sub_23CAE52F0();
}

uint64_t sub_23CAE375C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23CAE52F0();
}

uint64_t (*sub_23CAE37A4(void *a1, char a2, uint64_t a3))()
{
  if (a2)
  {
    if (a2 == 1)
    {
      uint64_t v5 = OUTLINED_FUNCTION_1_6();
      *(void *)(v5 + 16) = a1;
      *(unsigned char *)(v5 + 24) = 1;
      *(void *)(v5 + 32) = a3;
      id v6 = a1;
      swift_bridgeObjectRetain();
      return sub_23CAE4694;
    }
    else
    {
      uint64_t v9 = OUTLINED_FUNCTION_1_6();
      *(void *)(v9 + 16) = a1;
      *(unsigned char *)(v9 + 24) = 2;
      *(void *)(v9 + 32) = a3;
      id v10 = a1;
      swift_bridgeObjectRetain();
      return sub_23CAE45FC;
    }
  }
  else if (sub_23CAE38EC(a1, 0, a3))
  {
    return sub_23CAE46E8;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_23CAE3894(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), void (*a5)(void))
{
  return sub_23CAE52F0();
}

uint64_t sub_23CAE38EC(void *a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  if (sub_23CADEAFC((uint64_t)a1, a2, a3))
  {
    sub_23CACC064(a3, v11);
    sub_23CAE410C();
    return sub_23CAE52F0();
  }
  swift_bridgeObjectRelease();
  if (a1)
  {
    id v6 = objc_msgSend(a1, sel_localizedNavigationTitle);
    uint64_t v7 = sub_23CAE5460();
    uint64_t v9 = v8;

    v11[0] = v7;
    v11[1] = v9;
    sub_23CACA7DC();
    return sub_23CAE52F0();
  }
  return 0;
}

uint64_t (*sub_23CAE39BC(void *a1))()
{
  if (a1 && (objc_msgSend(a1, sel_drawBottomDivider) & 1) != 0) {
    return sub_23CAE3A0C;
  }
  else {
    return 0;
  }
}

uint64_t sub_23CAE3A0C()
{
  return sub_23CAE52F0();
}

uint64_t sub_23CAE3A20()
{
  uint64_t result = sub_23CAE51D0();
  qword_268BC88E0 = result;
  return result;
}

uint64_t static PrimaryTextColorKey.defaultValue.getter()
{
  return sub_23CAE3C3C(&qword_268BC8268);
}

uint64_t static PrimaryTextColorKey.defaultValue.setter(uint64_t a1)
{
  return sub_23CAE3CBC(a1, &qword_268BC8268, &qword_268BC88E0);
}

uint64_t (*static PrimaryTextColorKey.defaultValue.modify())()
{
  if (qword_268BC8268 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_4();
  return j__swift_endAccess;
}

uint64_t sub_23CAE3B00@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static PrimaryTextColorKey.defaultValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_23CAE3B28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_23CAE4158();
  return MEMORY[0x270EFF9B8](a1, a2, a3, a4, v8);
}

uint64_t (*EnvironmentValues.primaryText.modify(uint64_t a1))(void *a1, char a2)
{
  *(void *)(a1 + 16) = v1;
  *(void *)(a1 + 24) = sub_23CAE31B4();
  sub_23CAE4E10();
  return sub_23CAE3BEC;
}

uint64_t sub_23CAE3BEC(void *a1, char a2)
{
  return sub_23CAE3FA4(a1, a2);
}

uint64_t sub_23CAE3BF8()
{
  uint64_t result = sub_23CAE51E0();
  qword_268BC88E8 = result;
  return result;
}

uint64_t static SecondaryTextColorKey.defaultValue.getter()
{
  return sub_23CAE3C3C(&qword_268BC8270);
}

uint64_t sub_23CAE3C3C(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return swift_retain();
}

uint64_t static SecondaryTextColorKey.defaultValue.setter(uint64_t a1)
{
  return sub_23CAE3CBC(a1, &qword_268BC8270, &qword_268BC88E8);
}

uint64_t sub_23CAE3CBC(uint64_t a1, void *a2, void *a3)
{
  if (*a2 != -1) {
    swift_once();
  }
  swift_beginAccess();
  *a3 = a1;
  return swift_release();
}

uint64_t (*static SecondaryTextColorKey.defaultValue.modify())()
{
  if (qword_268BC8270 != -1) {
    swift_once();
  }
  OUTLINED_FUNCTION_0_4();
  return j_j__swift_endAccess;
}

uint64_t sub_23CAE3D9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static SecondaryTextColorKey.defaultValue.getter();
  *a1 = result;
  return result;
}

uint64_t EnvironmentValues.secondaryText.getter()
{
  return sub_23CAE3DE4((void (*)(void))sub_23CAE3E2C);
}

uint64_t sub_23CAE3DE4(void (*a1)(void))
{
  a1();
  sub_23CAE4E10();
  return v2;
}

unint64_t sub_23CAE3E2C()
{
  unint64_t result = qword_268BC88F8;
  if (!qword_268BC88F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC88F8);
  }
  return result;
}

uint64_t sub_23CAE3E78@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.secondaryText.getter();
  *a1 = result;
  return result;
}

uint64_t sub_23CAE3EA4()
{
  uint64_t v0 = swift_retain();
  return EnvironmentValues.secondaryText.setter(v0);
}

uint64_t EnvironmentValues.secondaryText.setter(uint64_t a1)
{
  return sub_23CAE3EF0(a1, (void (*)(void))sub_23CAE3E2C);
}

uint64_t sub_23CAE3EF0(uint64_t a1, void (*a2)(void))
{
  return sub_23CAE4E20();
}

uint64_t (*EnvironmentValues.secondaryText.modify(uint64_t a1))(void *a1, char a2)
{
  *(void *)(a1 + 16) = v1;
  *(void *)(a1 + 24) = sub_23CAE3E2C();
  sub_23CAE4E10();
  return sub_23CAE3F98;
}

uint64_t sub_23CAE3F98(void *a1, char a2)
{
  return sub_23CAE3FA4(a1, a2);
}

uint64_t sub_23CAE3FA4(void *a1, char a2)
{
  a1[1] = *a1;
  if ((a2 & 1) == 0) {
    return OUTLINED_FUNCTION_2_4();
  }
  swift_retain();
  OUTLINED_FUNCTION_2_4();
  return swift_release();
}

uint64_t sub_23CAE4020@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.primaryText.getter();
  *a1 = result;
  return result;
}

uint64_t sub_23CAE4050@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.secondaryText.getter();
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for ContentViewProvider()
{
  return self;
}

uint64_t type metadata accessor for HeaderViewProvider()
{
  return self;
}

uint64_t type metadata accessor for FooterViewProvider()
{
  return self;
}

ValueMetadata *type metadata accessor for PrimaryTextColorKey()
{
  return &type metadata for PrimaryTextColorKey;
}

ValueMetadata *type metadata accessor for SecondaryTextColorKey()
{
  return &type metadata for SecondaryTextColorKey;
}

unint64_t sub_23CAE410C()
{
  unint64_t result = qword_26AD6EB50;
  if (!qword_26AD6EB50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD6EB50);
  }
  return result;
}

unint64_t sub_23CAE4158()
{
  unint64_t result = qword_268BC8900;
  if (!qword_268BC8900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8900);
  }
  return result;
}

void sub_23CAE41A4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a3)
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_23CAE4208()
{
  return sub_23CAE375C(*(void *)(v0 + 16), *(unsigned __int8 *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_23CAE421C()
{
  return sub_23CAE3700(*(void *)(v0 + 16), *(unsigned __int8 *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_23CAE4230(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EB78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23CAE4298()
{
  return sub_23CAE3690((void *)(v0 + 16));
}

uint64_t objectdestroy_23Tm()
{
  if (*(void *)(v0 + 32))
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_23CAE42FC()
{
  return sub_23CAE3428(v0 + 16);
}

unint64_t sub_23CAE4304()
{
  unint64_t result = qword_26AD6EB80;
  if (!qword_26AD6EB80)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD6EB78);
    sub_23CAE4378();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD6EB80);
  }
  return result;
}

unint64_t sub_23CAE4378()
{
  unint64_t result = qword_26AD6EB70;
  if (!qword_26AD6EB70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD6EB70);
  }
  return result;
}

unint64_t sub_23CAE43C4()
{
  unint64_t result = qword_268BC8918;
  if (!qword_268BC8918)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268BC8910);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD6EB78);
    sub_23CAE4304();
    swift_getOpaqueTypeConformance2();
    sub_23CAE4474();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8918);
  }
  return result;
}

unint64_t sub_23CAE4474()
{
  unint64_t result = qword_26AD6EBB8;
  if (!qword_26AD6EBB8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26AD6EBC0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AD6EBB8);
  }
  return result;
}

void *sub_23CAE44C8(void *a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

uint64_t sub_23CAE4504(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a3)
  {
    uint64_t v5 = (void *)result;
    id v6 = a5;
    id v7 = v5;
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_23CAE4560()
{
  unint64_t result = qword_268BC8920;
  if (!qword_268BC8920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8920);
  }
  return result;
}

unint64_t sub_23CAE45AC()
{
  unint64_t result = qword_268BC8928;
  if (!qword_268BC8928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8928);
  }
  return result;
}

uint64_t sub_23CAE45FC()
{
  return sub_23CAE3894(*(void *)(v0 + 16), *(unsigned __int8 *)(v0 + 24), *(void *)(v0 + 32), (void (*)(uint64_t))sub_23CAC9F74, (void (*)(void))sub_23CAE473C);
}

uint64_t objectdestroyTm()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_23CAE4694()
{
  return sub_23CAE3894(*(void *)(v0 + 16), *(unsigned __int8 *)(v0 + 24), *(void *)(v0 + 32), (void (*)(uint64_t))sub_23CADDAAC, (void (*)(void))sub_23CAE46F0);
}

uint64_t sub_23CAE46E8()
{
  return swift_retain();
}

unint64_t sub_23CAE46F0()
{
  unint64_t result = qword_268BC8930;
  if (!qword_268BC8930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8930);
  }
  return result;
}

unint64_t sub_23CAE473C()
{
  unint64_t result = qword_268BC8938;
  if (!qword_268BC8938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268BC8938);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return sub_23CAE4E20();
}

ValueMetadata *type metadata accessor for WalletTitleView()
{
  return &type metadata for WalletTitleView;
}

uint64_t sub_23CAE47F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_23CAE4814@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8310);
  MEMORY[0x270FA5388](v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8318);
  sub_23CACA7DC();
  sub_23CACA828();
  sub_23CAE52B0();
  sub_23CACA8C8(&qword_268BC8330, &qword_268BC8310);
  uint64_t result = sub_23CAE52F0();
  *a1 = result;
  return result;
}

uint64_t sub_23CAE4964@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD6EBC0);
  uint64_t v5 = v4 - 8;
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_23CAE4D10();
  uint64_t v9 = v8 - 8;
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (_OWORD *)((char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v12 = a1;
  uint64_t v13 = sub_23CAE5240();
  uint64_t v14 = (char *)v11 + *(int *)(v9 + 28);
  uint64_t v15 = *MEMORY[0x263F19860];
  uint64_t v16 = sub_23CAE4E60();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104))(v14, v15, v16);
  __asm { FMOV            V0.2D, #5.0 }
  _OWORD *v11 = _Q0;
  sub_23CAC9908((uint64_t)v11, (uint64_t)v7);
  *(_WORD *)&v7[*(int *)(v5 + 44)] = 256;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_268BC8318);
  sub_23CACA90C((uint64_t)v7, (uint64_t)a2 + *(int *)(v22 + 36));
  *a2 = v13;
  swift_retain();
  sub_23CACA974((uint64_t)v7);
  sub_23CAC996C((uint64_t)v11);
  return swift_release();
}

uint64_t sub_23CAE4AF4@<X0>(uint64_t *a1@<X8>)
{
  return sub_23CAE4814(a1);
}

uint64_t sub_23CAE4B00@<X0>(uint64_t *a1@<X8>)
{
  return sub_23CAE4964(*(void **)(v1 + 16), a1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_23CAE4B30()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_23CAE4B40()
{
  return MEMORY[0x270EEE218]();
}

uint64_t sub_23CAE4B50()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_23CAE4B60()
{
  return MEMORY[0x270EFEAC8]();
}

uint64_t sub_23CAE4B70()
{
  return MEMORY[0x270EFEAE8]();
}

uint64_t sub_23CAE4B80()
{
  return MEMORY[0x270EEEB18]();
}

uint64_t sub_23CAE4B90()
{
  return MEMORY[0x270EEEDD8]();
}

uint64_t sub_23CAE4BA0()
{
  return MEMORY[0x270EEEDF0]();
}

uint64_t sub_23CAE4BB0()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_23CAE4BC0()
{
  return MEMORY[0x270EEF060]();
}

uint64_t sub_23CAE4BD0()
{
  return MEMORY[0x270EEF070]();
}

uint64_t sub_23CAE4BE0()
{
  return MEMORY[0x270EFEB28]();
}

uint64_t sub_23CAE4BF0()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_23CAE4C10()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_23CAE4C20()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_23CAE4C30()
{
  return MEMORY[0x270FA2C68]();
}

uint64_t sub_23CAE4C40()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_23CAE4C50()
{
  return MEMORY[0x270EFECF8]();
}

uint64_t sub_23CAE4C60()
{
  return MEMORY[0x270EFEF30]();
}

uint64_t sub_23CAE4C70()
{
  return MEMORY[0x270EFEFD0]();
}

uint64_t sub_23CAE4C80()
{
  return MEMORY[0x270EFF128]();
}

uint64_t sub_23CAE4C90()
{
  return MEMORY[0x270EFF510]();
}

uint64_t sub_23CAE4CA0()
{
  return MEMORY[0x270EFF520]();
}

uint64_t sub_23CAE4CB0()
{
  return MEMORY[0x270EFF538]();
}

uint64_t sub_23CAE4CC0()
{
  return MEMORY[0x270EFF598]();
}

uint64_t sub_23CAE4CD0()
{
  return MEMORY[0x270EFF6D0]();
}

uint64_t sub_23CAE4CF0()
{
  return MEMORY[0x270F00170]();
}

uint64_t sub_23CAE4D00()
{
  return MEMORY[0x270F00590]();
}

uint64_t sub_23CAE4D10()
{
  return MEMORY[0x270F00598]();
}

uint64_t sub_23CAE4D20()
{
  return MEMORY[0x270F00688]();
}

uint64_t sub_23CAE4D30()
{
  return MEMORY[0x270F00860]();
}

uint64_t sub_23CAE4D40()
{
  return MEMORY[0x270F00868]();
}

uint64_t sub_23CAE4D50()
{
  return MEMORY[0x270F008D0]();
}

uint64_t sub_23CAE4D60()
{
  return MEMORY[0x270F00940]();
}

uint64_t sub_23CAE4D70()
{
  return MEMORY[0x270F00948]();
}

uint64_t sub_23CAE4D80()
{
  return MEMORY[0x270F00978]();
}

uint64_t sub_23CAE4D90()
{
  return MEMORY[0x270F00A20]();
}

uint64_t sub_23CAE4DA0()
{
  return MEMORY[0x270F00A30]();
}

uint64_t sub_23CAE4DB0()
{
  return MEMORY[0x270F00C78]();
}

uint64_t sub_23CAE4DC0()
{
  return MEMORY[0x270F00C88]();
}

uint64_t sub_23CAE4DD0()
{
  return MEMORY[0x270F00D80]();
}

uint64_t sub_23CAE4DE0()
{
  return MEMORY[0x270F00D90]();
}

uint64_t sub_23CAE4DF0()
{
  return MEMORY[0x270F00ED8]();
}

uint64_t sub_23CAE4E00()
{
  return MEMORY[0x270F00EE0]();
}

uint64_t sub_23CAE4E10()
{
  return MEMORY[0x270F00F10]();
}

uint64_t sub_23CAE4E20()
{
  return MEMORY[0x270F00F20]();
}

uint64_t sub_23CAE4E30()
{
  return MEMORY[0x270F01050]();
}

uint64_t sub_23CAE4E40()
{
  return MEMORY[0x270F01070]();
}

uint64_t sub_23CAE4E50()
{
  return MEMORY[0x270F01270]();
}

uint64_t sub_23CAE4E60()
{
  return MEMORY[0x270F01358]();
}

uint64_t sub_23CAE4E70()
{
  return MEMORY[0x270F01420]();
}

uint64_t sub_23CAE4E80()
{
  return MEMORY[0x270F01460]();
}

uint64_t sub_23CAE4E90()
{
  return MEMORY[0x270F014A8]();
}

uint64_t sub_23CAE4EA0()
{
  return MEMORY[0x270F01510]();
}

uint64_t sub_23CAE4EB0()
{
  return MEMORY[0x270F01520]();
}

uint64_t sub_23CAE4EC0()
{
  return MEMORY[0x270F01800]();
}

uint64_t sub_23CAE4ED0()
{
  return MEMORY[0x270F01938]();
}

uint64_t sub_23CAE4EE0()
{
  return MEMORY[0x270F01E40]();
}

uint64_t sub_23CAE4EF0()
{
  return MEMORY[0x270F01E48]();
}

uint64_t sub_23CAE4F00()
{
  return MEMORY[0x270F027A8]();
}

uint64_t sub_23CAE4F10()
{
  return MEMORY[0x270F029E0]();
}

uint64_t sub_23CAE4F20()
{
  return MEMORY[0x270F02A30]();
}

uint64_t sub_23CAE4F30()
{
  return MEMORY[0x270F02A38]();
}

uint64_t sub_23CAE4F40()
{
  return MEMORY[0x270F02A48]();
}

uint64_t sub_23CAE4F50()
{
  return MEMORY[0x270F02A60]();
}

uint64_t sub_23CAE4F60()
{
  return MEMORY[0x270F02A68]();
}

uint64_t sub_23CAE4F70()
{
  return MEMORY[0x270F02A78]();
}

uint64_t sub_23CAE4F80()
{
  return MEMORY[0x270F02B48]();
}

uint64_t sub_23CAE4FA0()
{
  return MEMORY[0x270F02BA8]();
}

uint64_t sub_23CAE4FB0()
{
  return MEMORY[0x270F02BC0]();
}

uint64_t sub_23CAE4FC0()
{
  return MEMORY[0x270F02BF8]();
}

uint64_t sub_23CAE4FD0()
{
  return MEMORY[0x270F02C00]();
}

uint64_t sub_23CAE4FE0()
{
  return MEMORY[0x270F02C10]();
}

uint64_t sub_23CAE4FF0()
{
  return MEMORY[0x270F02C40]();
}

uint64_t sub_23CAE5000()
{
  return MEMORY[0x270F02C70]();
}

uint64_t sub_23CAE5010()
{
  return MEMORY[0x270F02CC0]();
}

uint64_t sub_23CAE5020()
{
  return MEMORY[0x270F02D08]();
}

uint64_t sub_23CAE5030()
{
  return MEMORY[0x270F02D10]();
}

uint64_t sub_23CAE5040()
{
  return MEMORY[0x270F02F28]();
}

uint64_t sub_23CAE5050()
{
  return MEMORY[0x270F02F80]();
}

uint64_t sub_23CAE5060()
{
  return MEMORY[0x270F02F98]();
}

uint64_t sub_23CAE5070()
{
  return MEMORY[0x270F02FA8]();
}

uint64_t sub_23CAE5080()
{
  return MEMORY[0x270F02FC0]();
}

uint64_t sub_23CAE5090()
{
  return MEMORY[0x270F02FC8]();
}

uint64_t sub_23CAE50A0()
{
  return MEMORY[0x270F02FD0]();
}

uint64_t sub_23CAE50B0()
{
  return MEMORY[0x270F02FF0]();
}

uint64_t sub_23CAE50C0()
{
  return MEMORY[0x270F03008]();
}

uint64_t sub_23CAE50D0()
{
  return MEMORY[0x270F03010]();
}

uint64_t sub_23CAE50E0()
{
  return MEMORY[0x270F03050]();
}

uint64_t sub_23CAE50F0()
{
  return MEMORY[0x270F03060]();
}

uint64_t sub_23CAE5100()
{
  return MEMORY[0x270F030A8]();
}

uint64_t sub_23CAE5110()
{
  return MEMORY[0x270F03228]();
}

uint64_t sub_23CAE5120()
{
  return MEMORY[0x270F03238]();
}

uint64_t sub_23CAE5130()
{
  return MEMORY[0x270F03250]();
}

uint64_t sub_23CAE5140()
{
  return MEMORY[0x270F03260]();
}

uint64_t sub_23CAE5150()
{
  return MEMORY[0x270F52080]();
}

uint64_t sub_23CAE5160()
{
  return MEMORY[0x270F03268]();
}

uint64_t sub_23CAE5170()
{
  return MEMORY[0x270F032C0]();
}

uint64_t sub_23CAE5180()
{
  return MEMORY[0x270F032D0]();
}

uint64_t sub_23CAE5190()
{
  return MEMORY[0x270F03360]();
}

uint64_t sub_23CAE51A0()
{
  return MEMORY[0x270F036C0]();
}

uint64_t sub_23CAE51B0()
{
  return MEMORY[0x270F039B0]();
}

uint64_t sub_23CAE51C0()
{
  return MEMORY[0x270F03D30]();
}

uint64_t sub_23CAE51D0()
{
  return MEMORY[0x270F52088]();
}

uint64_t sub_23CAE51E0()
{
  return MEMORY[0x270F52090]();
}

uint64_t sub_23CAE51F0()
{
  return MEMORY[0x270F04410]();
}

uint64_t sub_23CAE5200()
{
  return MEMORY[0x270F04478]();
}

uint64_t sub_23CAE5210()
{
  return MEMORY[0x270F04558]();
}

uint64_t sub_23CAE5220()
{
  return MEMORY[0x270F04588]();
}

uint64_t sub_23CAE5230()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_23CAE5240()
{
  return MEMORY[0x270F04630]();
}

uint64_t sub_23CAE5250()
{
  return MEMORY[0x270F04638]();
}

uint64_t sub_23CAE5260()
{
  return MEMORY[0x270F04650]();
}

uint64_t sub_23CAE5270()
{
  return MEMORY[0x270F04690]();
}

uint64_t sub_23CAE5280()
{
  return MEMORY[0x270F04708]();
}

uint64_t sub_23CAE5290()
{
  return MEMORY[0x270F04718]();
}

uint64_t sub_23CAE52A0()
{
  return MEMORY[0x270F04738]();
}

uint64_t sub_23CAE52B0()
{
  return MEMORY[0x270F04748]();
}

uint64_t sub_23CAE52C0()
{
  return MEMORY[0x270F04818]();
}

uint64_t sub_23CAE52D0()
{
  return MEMORY[0x270F04820]();
}

uint64_t sub_23CAE52E0()
{
  return MEMORY[0x270F04830]();
}

uint64_t sub_23CAE52F0()
{
  return MEMORY[0x270F04B20]();
}

uint64_t sub_23CAE5300()
{
  return MEMORY[0x270F04C20]();
}

uint64_t sub_23CAE5310()
{
  return MEMORY[0x270F04C30]();
}

uint64_t sub_23CAE5320()
{
  return MEMORY[0x270F04C90]();
}

uint64_t sub_23CAE5330()
{
  return MEMORY[0x270F04CA8]();
}

uint64_t sub_23CAE5340()
{
  return MEMORY[0x270F05078]();
}

uint64_t sub_23CAE5350()
{
  return MEMORY[0x270F05088]();
}

uint64_t sub_23CAE5360()
{
  return MEMORY[0x270F45180]();
}

uint64_t sub_23CAE5370()
{
  return MEMORY[0x270F45188]();
}

uint64_t sub_23CAE5380()
{
  return MEMORY[0x270F45198]();
}

uint64_t sub_23CAE5390()
{
  return MEMORY[0x270F451B0]();
}

uint64_t sub_23CAE53A0()
{
  return MEMORY[0x270F451B8]();
}

uint64_t sub_23CAE53B0()
{
  return MEMORY[0x270F451C0]();
}

uint64_t sub_23CAE53C0()
{
  return MEMORY[0x270F451C8]();
}

uint64_t sub_23CAE53D0()
{
  return MEMORY[0x270F451D0]();
}

uint64_t sub_23CAE53E0()
{
  return MEMORY[0x270F451D8]();
}

uint64_t sub_23CAE53F0()
{
  return MEMORY[0x270F451E8]();
}

uint64_t sub_23CAE5400()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_23CAE5410()
{
  return MEMORY[0x270F9D328]();
}

uint64_t sub_23CAE5420()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_23CAE5430()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23CAE5440()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_23CAE5450()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_23CAE5460()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23CAE5470()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_23CAE5480()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23CAE5490()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_23CAE54A0()
{
  return MEMORY[0x270F9D750]();
}

uint64_t sub_23CAE54B0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23CAE54C0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_23CAE54D0()
{
  return MEMORY[0x270F9D830]();
}

uint64_t sub_23CAE54E0()
{
  return MEMORY[0x270F9D840]();
}

uint64_t sub_23CAE54F0()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_23CAE5500()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_23CAE5510()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_23CAE5520()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_23CAE5530()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_23CAE5540()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_23CAE5550()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_23CAE5560()
{
  return MEMORY[0x270FA1EA0]();
}

uint64_t sub_23CAE5570()
{
  return MEMORY[0x270FA1EA8]();
}

uint64_t sub_23CAE5580()
{
  return MEMORY[0x270FA1EC0]();
}

uint64_t sub_23CAE5590()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_23CAE55A0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_23CAE55B0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_23CAE55C0()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_23CAE55D0()
{
  return MEMORY[0x270EF1F60]();
}

uint64_t sub_23CAE55E0()
{
  return MEMORY[0x270F05408]();
}

uint64_t sub_23CAE55F0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_23CAE5600()
{
  return MEMORY[0x270FA1190]();
}

uint64_t sub_23CAE5610()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_23CAE5620()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_23CAE5630()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_23CAE5640()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_23CAE5650()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23CAE5660()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_23CAE5670()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_23CAE5680()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_23CAE5690()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_23CAE56A0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_23CAE56C0()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_23CAE56D0()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_23CAE56E0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23CAE56F0()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_23CAE5700()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23CAE5710()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23CAE5720()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_23CAE5730()
{
  return MEMORY[0x270F9FC90]();
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void bzero(void *a1, size_t a2)
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x270FA0310]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x270FA04D8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
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

uint64_t swift_task_alloc()
{
  return MEMORY[0x270FA2450]();
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