id _MCCLogSystem()
{
  void *v0;
  uint64_t vars8;

  if (_MCCLogSystem_onceToken[0] != -1) {
    dispatch_once(_MCCLogSystem_onceToken, &__block_literal_global);
  }
  v0 = (void *)_MCCLogSystem_log;

  return v0;
}

uint64_t BlackPearlLevels.init(modelMetadata:senderModelMetadata:tsModelMetadata:version:threshold:bloomFilterData:domainLookupFile:tsSubjectLookupFile:tsSenderLookupFile:catLookupFile:personalDomainLookupFile:saasSenderLookupFile:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X3>, long long *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  long long v37 = a5[1];
  long long v38 = *a5;
  long long v34 = a5[3];
  long long v35 = a5[2];
  uint64_t v19 = *((void *)a5 + 8);
  uint64_t v20 = *((void *)a5 + 9);
  uint64_t v21 = *((void *)a5 + 10);
  sub_25509F608(a1, a9, type metadata accessor for BlackPearlModel);
  v22 = (int *)type metadata accessor for BlackPearlLevels();
  sub_25509F608(a2, a9 + v22[5], type metadata accessor for BlackPearlModel);
  sub_25509F608(a3, a9 + v22[6], type metadata accessor for BlackPearlModel);
  v23 = (_OWORD *)(a9 + v22[7]);
  long long v24 = a4[9];
  v23[8] = a4[8];
  v23[9] = v24;
  v23[10] = a4[10];
  *(_OWORD *)((char *)v23 + 169) = *(_OWORD *)((char *)a4 + 169);
  long long v25 = a4[5];
  v23[4] = a4[4];
  v23[5] = v25;
  long long v26 = a4[7];
  v23[6] = a4[6];
  v23[7] = v26;
  long long v27 = a4[1];
  _OWORD *v23 = *a4;
  v23[1] = v27;
  long long v28 = a4[3];
  v23[2] = a4[2];
  v23[3] = v28;
  uint64_t v29 = a9 + v22[8];
  *(_OWORD *)uint64_t v29 = v38;
  *(_OWORD *)(v29 + 16) = v37;
  *(_OWORD *)(v29 + 32) = v35;
  *(_OWORD *)(v29 + 48) = v34;
  *(void *)(v29 + 64) = v19;
  *(void *)(v29 + 72) = v20;
  *(void *)(v29 + 80) = v21;
  sub_25509F608(a6, a9 + v22[9], type metadata accessor for BloomFilterData);
  uint64_t v30 = a9 + v22[10];
  uint64_t v31 = sub_2550D97D0();
  v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 32);
  v39(v30, a7, v31);
  v39(a9 + v22[11], a8, v31);
  v39(a9 + v22[12], a10, v31);
  v39(a9 + v22[13], a11, v31);
  v39(a9 + v22[14], a12, v31);
  uint64_t v32 = a9 + v22[15];

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v39)(v32, a13, v31);
}

uint64_t type metadata accessor for BlackPearlLevels()
{
  uint64_t result = qword_26B278EB8;
  if (!qword_26B278EB8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_25509F608(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void __swiftcall BlackPearlLevels.getThreshold()(MCCKitCategorization::BlackPearlThreshold *__return_ptr retstr)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for BlackPearlLevels() + 32);
  Swift::Double v4 = *(double *)(v3 + 64);
  long long v5 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)&retstr->thresholdCommerce = *(_OWORD *)v3;
  *(_OWORD *)&retstr->thresholdEmployee = v5;
  long long v6 = *(_OWORD *)(v3 + 48);
  *(_OWORD *)&retstr->thresholdP2C = *(_OWORD *)(v3 + 32);
  *(_OWORD *)&retstr->thresholdTS = v6;
  retstr->thresholdCorpEmployee = v4;
  *(_OWORD *)&retstr->tsSenderMaxTokens = *(_OWORD *)(v3 + 72);
}

uint64_t BlackPearlLevels.getmodelMetadata()@<X0>(uint64_t a1@<X8>)
{
  return sub_25509F934(v1, a1, type metadata accessor for BlackPearlModel);
}

uint64_t BlackPearlLevels.getsenderModelMetadata()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for BlackPearlLevels();
  return sub_25509F934(v1 + *(int *)(v3 + 20), a1, type metadata accessor for BlackPearlModel);
}

uint64_t BlackPearlLevels.gettsModelMetadata()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for BlackPearlLevels();
  return sub_25509F934(v1 + *(int *)(v3 + 24), a1, type metadata accessor for BlackPearlModel);
}

void __swiftcall BlackPearlLevels.getVersion()(MCCKitCategorization::BlackPearlVersion *__return_ptr retstr)
{
  uint64_t v3 = (_OWORD *)(v1 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
  long long v4 = v3[9];
  long long v5 = v3[7];
  Swift::String_optional v25 = (Swift::String_optional)v3[8];
  long long v26 = v4;
  Swift::String_optional v6 = (Swift::String_optional)v3[9];
  v27[0] = v3[10];
  *(_OWORD *)((char *)v27 + 9) = *(_OWORD *)((char *)v3 + 169);
  long long v7 = v3[5];
  Swift::String v9 = (Swift::String)v3[3];
  Swift::String v21 = (Swift::String)v3[4];
  Swift::String v8 = v21;
  long long v22 = v7;
  Swift::String_optional v10 = (Swift::String_optional)v3[5];
  long long v11 = v3[7];
  Swift::String_optional v23 = (Swift::String_optional)v3[6];
  Swift::String_optional v12 = v23;
  long long v24 = v11;
  Swift::String v13 = (Swift::String)v3[1];
  long long v14 = v3[3];
  Swift::String v19 = (Swift::String)v3[2];
  Swift::String v15 = v19;
  long long v20 = v14;
  long long v16 = v3[1];
  v18[0] = *v3;
  Swift::String v17 = (Swift::String)v18[0];
  v18[1] = v16;
  retstr->blackPearlRolloutFactorPackId = v25;
  retstr->blackPearlRolloutId = v6;
  *(_OWORD *)&retstr->blackPearlCategorizationVersion.value.major = v3[10];
  *(_OWORD *)((char *)&retstr->blackPearlCategorizationVersion.value.minor + 1) = *(_OWORD *)((char *)v3 + 169);
  retstr->blackPearlBreakthroughVersion = v8;
  retstr->blackPearlExperimentId = v10;
  retstr->blackPearlExperimentTreatmentId = v12;
  *(_OWORD *)&retstr->blackPearlExperimentDeploymentId = v5;
  retstr->blackPearlModelVersion = v17;
  retstr->blackPearlSenderModelVersion = v13;
  retstr->blackPearlTSModelVersion = v15;
  retstr->blackPearlFinalRuleVersion = v9;
  sub_25509F83C((uint64_t)v18);
}

uint64_t sub_25509F83C(uint64_t a1)
{
  return a1;
}

uint64_t BlackPearlLevels.getbloomFilterData()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for BlackPearlLevels();
  return sub_25509F934(v1 + *(int *)(v3 + 36), a1, type metadata accessor for BloomFilterData);
}

uint64_t sub_25509F934(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t BlackPearlLevels.getdomainLookupFile()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for BlackPearlLevels() + 40);
  uint64_t v4 = sub_2550D97D0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t BlackPearlLevels.gettsSubjectLookupFile()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for BlackPearlLevels() + 44);
  uint64_t v4 = sub_2550D97D0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t BlackPearlLevels.gettsSenderLookupFile()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for BlackPearlLevels() + 48);
  uint64_t v4 = sub_2550D97D0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t BlackPearlLevels.getcatLookupFile()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for BlackPearlLevels() + 52);
  uint64_t v4 = sub_2550D97D0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t BlackPearlLevels.getPersonalDomainLookupFile()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for BlackPearlLevels() + 56);
  uint64_t v4 = sub_2550D97D0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t BlackPearlLevels.getSaasSenderLookupFile()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for BlackPearlLevels() + 60);
  uint64_t v4 = sub_2550D97D0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t dispatch thunk of static ModelProtocol.assetDir.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static ModelProtocol.modelPackageFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static ModelProtocol.modelSenderPackageFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static ModelProtocol.modelVersionFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of static ModelProtocol.senderVersionFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of static ModelProtocol.tsVersionFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of static ModelProtocol.ruleVersionFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of static ModelProtocol.breakthroughVersionFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of static ModelProtocol.commerceBloomFilterFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of static ModelProtocol.categoryGuaranteedListFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of static ModelProtocol.nerBloomFilterFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of static ModelProtocol.domainLookupFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of static ModelProtocol.tsSubjectLookupFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of static ModelProtocol.tsSenderLookupFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 112))();
}

uint64_t dispatch thunk of static ModelProtocol.thresholdCommerceFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 120))();
}

uint64_t dispatch thunk of static ModelProtocol.thresholdEmployeeFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t dispatch thunk of static ModelProtocol.thresholdPersonalFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 136))();
}

uint64_t dispatch thunk of static ModelProtocol.thresholdP2CFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 144))();
}

uint64_t dispatch thunk of static ModelProtocol.thresholdCorpEmployeeFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t dispatch thunk of static ModelProtocol.thresholdSenderFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 160))();
}

uint64_t dispatch thunk of static ModelProtocol.thresholdTSFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 168))();
}

uint64_t dispatch thunk of static ModelProtocol.thresholdCategoryTSFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 176))();
}

uint64_t dispatch thunk of static ModelProtocol.thresholdEmployeeNewsFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 184))();
}

uint64_t dispatch thunk of static ModelProtocol.modelName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 192))();
}

uint64_t dispatch thunk of static ModelProtocol.senderModelName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 200))();
}

uint64_t dispatch thunk of static ModelProtocol.modelTSPackageFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 208))();
}

uint64_t dispatch thunk of static ModelProtocol.tsSenderMaxTokensFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 216))();
}

uint64_t dispatch thunk of static ModelProtocol.tsSubjectMaxTokensFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 224))();
}

uint64_t dispatch thunk of static ModelProtocol.saasSenderLookupFactor.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 232))();
}

uint64_t dispatch thunk of ModelProtocol.blackPearlLevels.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 240))();
}

uint64_t dispatch thunk of ModelProtocol.blackPearlLevels.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 248))();
}

uint64_t dispatch thunk of ModelProtocol.blackPearlLevels.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 256))();
}

uint64_t dispatch thunk of ModelProtocol.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 264))();
}

uint64_t dispatch thunk of ModelProtocol.getBlackPearlLevels()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 272))();
}

uint64_t dispatch thunk of ModelProtocol.subscribe()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 280))();
}

uint64_t dispatch thunk of ModelProtocol.needImmediateDownloadCheck()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 288))();
}

uint64_t dispatch thunk of ModelProtocol.runImmediateDownloadAsync(retries:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 296))();
}

uint64_t dispatch thunk of static ModelProtocol.compileModel(modelPath:modelName:modelVersion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 304))();
}

ValueMetadata *type metadata accessor for BlackPearlFactors()
{
  return &type metadata for BlackPearlFactors;
}

char *initializeBufferWithCopyOfBuffer for BlackPearlLevels(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (char *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v62 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = (char *)(v62 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    Swift::String v9 = (int *)type metadata accessor for BlackPearlModel(0);
    uint64_t v10 = v9[6];
    v64 = &v4[v10];
    long long v11 = (char *)a2 + v10;
    uint64_t v12 = sub_2550D97D0();
    v66 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v66(v64, v11, v12);
    v66(&v4[v9[7]], (char *)a2 + v9[7], v12);
    uint64_t v13 = v9[8];
    long long v14 = *(void **)((char *)a2 + v13);
    *(void *)&v4[v13] = v14;
    uint64_t v15 = a3[5];
    v65 = a3;
    long long v16 = &v4[v15];
    Swift::String v17 = (char *)a2 + v15;
    uint64_t v18 = *(uint64_t *)((char *)a2 + v15 + 8);
    *(void *)long long v16 = *(uint64_t *)((char *)a2 + v15);
    *((void *)v16 + 1) = v18;
    uint64_t v19 = *(uint64_t *)((char *)a2 + v15 + 24);
    *((void *)v16 + 2) = *(uint64_t *)((char *)a2 + v15 + 16);
    *((void *)v16 + 3) = v19;
    uint64_t v20 = v9[6];
    Swift::String v21 = &v16[v20];
    long long v22 = &v17[v20];
    id v23 = v14;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v66(v21, v22, v12);
    v66(&v16[v9[7]], &v17[v9[7]], v12);
    uint64_t v24 = v9[8];
    Swift::String_optional v25 = *(void **)&v17[v24];
    *(void *)&v16[v24] = v25;
    uint64_t v26 = v65[6];
    long long v27 = &v4[v26];
    long long v28 = (char *)a2 + v26;
    uint64_t v29 = *(uint64_t *)((char *)a2 + v26 + 8);
    *(void *)long long v27 = *(uint64_t *)((char *)a2 + v26);
    *((void *)v27 + 1) = v29;
    uint64_t v30 = *(uint64_t *)((char *)a2 + v26 + 24);
    *((void *)v27 + 2) = *(uint64_t *)((char *)a2 + v26 + 16);
    *((void *)v27 + 3) = v30;
    uint64_t v31 = v9[6];
    uint64_t v32 = &v27[v31];
    v33 = &v28[v31];
    id v34 = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v66(v32, v33, v12);
    v66(&v27[v9[7]], &v28[v9[7]], v12);
    uint64_t v35 = v9[8];
    v36 = *(void **)&v28[v35];
    *(void *)&v27[v35] = v36;
    uint64_t v37 = v65[7];
    uint64_t v38 = v65[8];
    v39 = &v4[v37];
    v40 = (char *)a2 + v37;
    uint64_t v41 = *((void *)v40 + 1);
    *(void *)v39 = *(void *)v40;
    *((void *)v39 + 1) = v41;
    uint64_t v42 = *((void *)v40 + 3);
    *((void *)v39 + 2) = *((void *)v40 + 2);
    *((void *)v39 + 3) = v42;
    uint64_t v43 = *((void *)v40 + 5);
    *((void *)v39 + 4) = *((void *)v40 + 4);
    *((void *)v39 + 5) = v43;
    uint64_t v44 = *((void *)v40 + 7);
    *((void *)v39 + 6) = *((void *)v40 + 6);
    *((void *)v39 + 7) = v44;
    uint64_t v45 = *((void *)v40 + 9);
    *((void *)v39 + 8) = *((void *)v40 + 8);
    *((void *)v39 + 9) = v45;
    uint64_t v46 = *((void *)v40 + 11);
    *((void *)v39 + 10) = *((void *)v40 + 10);
    *((void *)v39 + 11) = v46;
    uint64_t v47 = *((void *)v40 + 13);
    *((void *)v39 + 12) = *((void *)v40 + 12);
    *((void *)v39 + 13) = v47;
    *((_OWORD *)v39 + 7) = *((_OWORD *)v40 + 7);
    uint64_t v48 = *((void *)v40 + 17);
    *((void *)v39 + 16) = *((void *)v40 + 16);
    *((void *)v39 + 17) = v48;
    uint64_t v49 = *((void *)v40 + 19);
    *((void *)v39 + 18) = *((void *)v40 + 18);
    *((void *)v39 + 19) = v49;
    long long v50 = *((_OWORD *)v40 + 10);
    *(_OWORD *)(v39 + 169) = *(_OWORD *)(v40 + 169);
    *((_OWORD *)v39 + 10) = v50;
    v51 = &v4[v38];
    v52 = (char *)a2 + v38;
    long long v53 = *((_OWORD *)v52 + 3);
    *((_OWORD *)v51 + 2) = *((_OWORD *)v52 + 2);
    *((_OWORD *)v51 + 3) = v53;
    *((_OWORD *)v51 + 4) = *((_OWORD *)v52 + 4);
    *((void *)v51 + 10) = *((void *)v52 + 10);
    long long v54 = *(_OWORD *)v52;
    long long v55 = *((_OWORD *)v52 + 1);
    uint64_t v56 = v65[9];
    v57 = &v4[v56];
    v58 = (char *)a2 + v56;
    *(_OWORD *)v51 = v54;
    *((_OWORD *)v51 + 1) = v55;
    id v59 = v36;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v66(v57, v58, v12);
    uint64_t v60 = type metadata accessor for BloomFilterData(0);
    v66(&v57[*(int *)(v60 + 20)], &v58[*(int *)(v60 + 20)], v12);
    v66(&v57[*(int *)(v60 + 24)], &v58[*(int *)(v60 + 24)], v12);
    v61 = v65;
    v66(&v4[v65[10]], (char *)a2 + v65[10], v12);
    v66(&v4[v61[11]], (char *)a2 + v61[11], v12);
    v66(&v4[v61[12]], (char *)a2 + v61[12], v12);
    v66(&v4[v61[13]], (char *)a2 + v61[13], v12);
    v66(&v4[v61[14]], (char *)a2 + v61[14], v12);
    v66(&v4[v61[15]], (char *)a2 + v61[15], v12);
  }
  return v4;
}

uint64_t destroy for BlackPearlLevels(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = (int *)type metadata accessor for BlackPearlModel(0);
  uint64_t v5 = a1 + v4[6];
  uint64_t v6 = sub_2550D97D0();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v13)((void *)(v6 - 8), v5, v6);
  v13(a1 + v4[7], v6);

  uint64_t v7 = a1 + a2[5];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v13(v7 + v4[6], v6);
  v13(v7 + v4[7], v6);

  uint64_t v8 = a1 + a2[6];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v13(v8 + v4[6], v6);
  v13(v8 + v4[7], v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = a1 + a2[9];
  v13(v9, v6);
  uint64_t v10 = type metadata accessor for BloomFilterData(0);
  v13(v9 + *(int *)(v10 + 20), v6);
  v13(v9 + *(int *)(v10 + 24), v6);
  v13(a1 + a2[10], v6);
  v13(a1 + a2[11], v6);
  v13(a1 + a2[12], v6);
  v13(a1 + a2[13], v6);
  v13(a1 + a2[14], v6);
  uint64_t v11 = a1 + a2[15];

  return ((uint64_t (*)(uint64_t, uint64_t))v13)(v11, v6);
}

char *initializeWithCopy for BlackPearlLevels(char *a1, char *a2, int *a3)
{
  uint64_t v5 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v5;
  uint64_t v6 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v6;
  uint64_t v7 = (int *)type metadata accessor for BlackPearlModel(0);
  uint64_t v8 = v7[6];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_2550D97D0();
  uint64_t v62 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v62(v9, v10, v11);
  v62(&a1[v7[7]], &a2[v7[7]], v11);
  uint64_t v12 = v7[8];
  uint64_t v13 = *(void **)&a2[v12];
  *(void *)&a1[v12] = v13;
  uint64_t v14 = a3[5];
  uint64_t v15 = &a1[v14];
  long long v16 = &a2[v14];
  uint64_t v17 = *(void *)&a2[v14 + 8];
  *(void *)uint64_t v15 = *(void *)&a2[v14];
  *((void *)v15 + 1) = v17;
  uint64_t v18 = *(void *)&a2[v14 + 24];
  *((void *)v15 + 2) = *(void *)&a2[v14 + 16];
  *((void *)v15 + 3) = v18;
  uint64_t v19 = v7[6];
  uint64_t v20 = &v15[v19];
  Swift::String v21 = &v16[v19];
  id v22 = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v62(v20, v21, v11);
  v62(&v15[v7[7]], &v16[v7[7]], v11);
  uint64_t v23 = v7[8];
  uint64_t v24 = *(void **)&v16[v23];
  *(void *)&v15[v23] = v24;
  uint64_t v25 = a3[6];
  uint64_t v26 = &a1[v25];
  long long v27 = &a2[v25];
  uint64_t v28 = *(void *)&a2[v25 + 8];
  *(void *)uint64_t v26 = *(void *)&a2[v25];
  *((void *)v26 + 1) = v28;
  uint64_t v29 = *(void *)&a2[v25 + 24];
  *((void *)v26 + 2) = *(void *)&a2[v25 + 16];
  *((void *)v26 + 3) = v29;
  uint64_t v30 = v7[6];
  uint64_t v31 = &v26[v30];
  uint64_t v32 = &v27[v30];
  id v33 = v24;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v62(v31, v32, v11);
  v62(&v26[v7[7]], &v27[v7[7]], v11);
  uint64_t v34 = v7[8];
  uint64_t v35 = *(void **)&v27[v34];
  *(void *)&v26[v34] = v35;
  uint64_t v36 = a3[7];
  uint64_t v37 = a3[8];
  uint64_t v38 = &a1[v36];
  v39 = &a2[v36];
  uint64_t v40 = *((void *)v39 + 1);
  *(void *)uint64_t v38 = *(void *)v39;
  *((void *)v38 + 1) = v40;
  uint64_t v41 = *((void *)v39 + 3);
  *((void *)v38 + 2) = *((void *)v39 + 2);
  *((void *)v38 + 3) = v41;
  uint64_t v42 = *((void *)v39 + 5);
  *((void *)v38 + 4) = *((void *)v39 + 4);
  *((void *)v38 + 5) = v42;
  uint64_t v43 = *((void *)v39 + 7);
  *((void *)v38 + 6) = *((void *)v39 + 6);
  *((void *)v38 + 7) = v43;
  uint64_t v44 = *((void *)v39 + 9);
  *((void *)v38 + 8) = *((void *)v39 + 8);
  *((void *)v38 + 9) = v44;
  uint64_t v45 = *((void *)v39 + 11);
  *((void *)v38 + 10) = *((void *)v39 + 10);
  *((void *)v38 + 11) = v45;
  uint64_t v46 = *((void *)v39 + 13);
  *((void *)v38 + 12) = *((void *)v39 + 12);
  *((void *)v38 + 13) = v46;
  *((_OWORD *)v38 + 7) = *((_OWORD *)v39 + 7);
  uint64_t v47 = *((void *)v39 + 17);
  *((void *)v38 + 16) = *((void *)v39 + 16);
  *((void *)v38 + 17) = v47;
  uint64_t v48 = *((void *)v39 + 19);
  *((void *)v38 + 18) = *((void *)v39 + 18);
  *((void *)v38 + 19) = v48;
  long long v49 = *((_OWORD *)v39 + 10);
  *(_OWORD *)(v38 + 169) = *(_OWORD *)(v39 + 169);
  *((_OWORD *)v38 + 10) = v49;
  long long v50 = &a1[v37];
  v51 = &a2[v37];
  long long v52 = *((_OWORD *)v51 + 3);
  *((_OWORD *)v50 + 2) = *((_OWORD *)v51 + 2);
  *((_OWORD *)v50 + 3) = v52;
  *((_OWORD *)v50 + 4) = *((_OWORD *)v51 + 4);
  *((void *)v50 + 10) = *((void *)v51 + 10);
  long long v53 = *(_OWORD *)v51;
  long long v54 = *((_OWORD *)v51 + 1);
  uint64_t v55 = a3[9];
  uint64_t v56 = &a1[v55];
  v57 = &a2[v55];
  *(_OWORD *)long long v50 = v53;
  *((_OWORD *)v50 + 1) = v54;
  id v58 = v35;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v62(v56, v57, v11);
  uint64_t v59 = type metadata accessor for BloomFilterData(0);
  v62(&v56[*(int *)(v59 + 20)], &v57[*(int *)(v59 + 20)], v11);
  v62(&v56[*(int *)(v59 + 24)], &v57[*(int *)(v59 + 24)], v11);
  uint64_t v60 = a3;
  v62(&a1[a3[10]], &a2[a3[10]], v11);
  v62(&a1[v60[11]], &a2[v60[11]], v11);
  v62(&a1[v60[12]], &a2[v60[12]], v11);
  v62(&a1[v60[13]], &a2[v60[13]], v11);
  v62(&a1[v60[14]], &a2[v60[14]], v11);
  v62(&a1[v60[15]], &a2[v60[15]], v11);
  return a1;
}

char *assignWithCopy for BlackPearlLevels(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = *((void *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = (int *)type metadata accessor for BlackPearlModel(0);
  uint64_t v7 = v6[6];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_2550D97D0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 24);
  v11(v8, v9, v10);
  v11(&a1[v6[7]], &a2[v6[7]], v10);
  uint64_t v12 = v6[8];
  uint64_t v13 = *(void **)&a1[v12];
  uint64_t v14 = *(void **)&a2[v12];
  *(void *)&a1[v12] = v14;
  id v15 = v14;

  uint64_t v16 = a3[5];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  *(void *)uint64_t v17 = *(void *)&a2[v16];
  *((void *)v17 + 1) = *(void *)&a2[v16 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v17 + 2) = *((void *)v18 + 2);
  *((void *)v17 + 3) = *((void *)v18 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11(&v17[v6[6]], &v18[v6[6]], v10);
  v11(&v17[v6[7]], &v18[v6[7]], v10);
  uint64_t v19 = v6[8];
  uint64_t v20 = *(void **)&v17[v19];
  Swift::String v21 = *(void **)&v18[v19];
  *(void *)&v17[v19] = v21;
  id v22 = v21;

  uint64_t v23 = a3[6];
  uint64_t v24 = &a1[v23];
  uint64_t v25 = &a2[v23];
  *(void *)uint64_t v24 = *(void *)&a2[v23];
  *((void *)v24 + 1) = *(void *)&a2[v23 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v24 + 2) = *((void *)v25 + 2);
  *((void *)v24 + 3) = *((void *)v25 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11(&v24[v6[6]], &v25[v6[6]], v10);
  v11(&v24[v6[7]], &v25[v6[7]], v10);
  uint64_t v26 = v6[8];
  long long v27 = *(void **)&v24[v26];
  uint64_t v28 = *(void **)&v25[v26];
  *(void *)&v24[v26] = v28;
  id v29 = v28;

  uint64_t v30 = a3[7];
  uint64_t v31 = &a1[v30];
  uint64_t v32 = &a2[v30];
  *(void *)uint64_t v31 = *(void *)&a2[v30];
  *((void *)v31 + 1) = *(void *)&a2[v30 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v31 + 2) = *((void *)v32 + 2);
  *((void *)v31 + 3) = *((void *)v32 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v31 + 4) = *((void *)v32 + 4);
  *((void *)v31 + 5) = *((void *)v32 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v31 + 6) = *((void *)v32 + 6);
  *((void *)v31 + 7) = *((void *)v32 + 7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v31 + 8) = *((void *)v32 + 8);
  *((void *)v31 + 9) = *((void *)v32 + 9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v31 + 10) = *((void *)v32 + 10);
  *((void *)v31 + 11) = *((void *)v32 + 11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v31 + 12) = *((void *)v32 + 12);
  *((void *)v31 + 13) = *((void *)v32 + 13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v31 + 14) = *((void *)v32 + 14);
  *((void *)v31 + 15) = *((void *)v32 + 15);
  *((void *)v31 + 16) = *((void *)v32 + 16);
  *((void *)v31 + 17) = *((void *)v32 + 17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v31 + 18) = *((void *)v32 + 18);
  *((void *)v31 + 19) = *((void *)v32 + 19);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v33 = *((_OWORD *)v32 + 10);
  *(_OWORD *)(v31 + 169) = *(_OWORD *)(v32 + 169);
  *((_OWORD *)v31 + 10) = v33;
  uint64_t v34 = a3[8];
  uint64_t v35 = &a1[v34];
  uint64_t v36 = &a2[v34];
  *(void *)uint64_t v35 = *(void *)v36;
  *((void *)v35 + 1) = *((void *)v36 + 1);
  *((void *)v35 + 2) = *((void *)v36 + 2);
  *((void *)v35 + 3) = *((void *)v36 + 3);
  *((void *)v35 + 4) = *((void *)v36 + 4);
  *((void *)v35 + 5) = *((void *)v36 + 5);
  *((void *)v35 + 6) = *((void *)v36 + 6);
  *((void *)v35 + 7) = *((void *)v36 + 7);
  *((void *)v35 + 8) = *((void *)v36 + 8);
  *((void *)v35 + 9) = *((void *)v36 + 9);
  *((void *)v35 + 10) = *((void *)v36 + 10);
  uint64_t v37 = a3[9];
  uint64_t v38 = &a1[v37];
  v39 = &a2[v37];
  v11(&a1[v37], &a2[v37], v10);
  uint64_t v40 = type metadata accessor for BloomFilterData(0);
  v11(&v38[*(int *)(v40 + 20)], &v39[*(int *)(v40 + 20)], v10);
  v11(&v38[*(int *)(v40 + 24)], &v39[*(int *)(v40 + 24)], v10);
  v11(&a1[a3[10]], &a2[a3[10]], v10);
  v11(&a1[a3[11]], &a2[a3[11]], v10);
  v11(&a1[a3[12]], &a2[a3[12]], v10);
  v11(&a1[a3[13]], &a2[a3[13]], v10);
  v11(&a1[a3[14]], &a2[a3[14]], v10);
  v11(&a1[a3[15]], &a2[a3[15]], v10);
  return a1;
}

char *initializeWithTake for BlackPearlLevels(char *a1, char *a2, int *a3)
{
  long long v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  uint64_t v7 = (int *)type metadata accessor for BlackPearlModel(0);
  uint64_t v8 = v7[6];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_2550D97D0();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32);
  v12(v9, v10, v11);
  v12(&a1[v7[7]], &a2[v7[7]], v11);
  *(void *)&a1[v7[8]] = *(void *)&a2[v7[8]];
  uint64_t v13 = a3[5];
  uint64_t v14 = &a1[v13];
  id v15 = &a2[v13];
  long long v16 = *(_OWORD *)&a2[v13 + 16];
  *(_OWORD *)uint64_t v14 = *(_OWORD *)&a2[v13];
  *((_OWORD *)v14 + 1) = v16;
  v12(&a1[v13 + v7[6]], &a2[v13 + v7[6]], v11);
  v12(&v14[v7[7]], &v15[v7[7]], v11);
  *(void *)&v14[v7[8]] = *(void *)&v15[v7[8]];
  uint64_t v17 = a3[6];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  long long v20 = *(_OWORD *)&a2[v17 + 16];
  *(_OWORD *)uint64_t v18 = *(_OWORD *)&a2[v17];
  *((_OWORD *)v18 + 1) = v20;
  v12(&a1[v17 + v7[6]], &a2[v17 + v7[6]], v11);
  v12(&v18[v7[7]], &v19[v7[7]], v11);
  *(void *)&v18[v7[8]] = *(void *)&v19[v7[8]];
  uint64_t v21 = a3[7];
  uint64_t v22 = a3[8];
  uint64_t v23 = &a1[v21];
  uint64_t v24 = &a2[v21];
  long long v25 = *((_OWORD *)v24 + 1);
  *(_OWORD *)uint64_t v23 = *(_OWORD *)v24;
  *((_OWORD *)v23 + 1) = v25;
  long long v26 = *((_OWORD *)v24 + 3);
  *((_OWORD *)v23 + 2) = *((_OWORD *)v24 + 2);
  *((_OWORD *)v23 + 3) = v26;
  long long v27 = *((_OWORD *)v24 + 7);
  *((_OWORD *)v23 + 6) = *((_OWORD *)v24 + 6);
  *((_OWORD *)v23 + 7) = v27;
  long long v28 = *((_OWORD *)v24 + 5);
  *((_OWORD *)v23 + 4) = *((_OWORD *)v24 + 4);
  *((_OWORD *)v23 + 5) = v28;
  *(_OWORD *)(v23 + 169) = *(_OWORD *)(v24 + 169);
  long long v29 = *((_OWORD *)v24 + 10);
  long long v30 = *((_OWORD *)v24 + 8);
  *((_OWORD *)v23 + 9) = *((_OWORD *)v24 + 9);
  *((_OWORD *)v23 + 10) = v29;
  *((_OWORD *)v23 + 8) = v30;
  uint64_t v31 = &a1[v22];
  uint64_t v32 = &a2[v22];
  long long v33 = *((_OWORD *)v32 + 1);
  *(_OWORD *)uint64_t v31 = *(_OWORD *)v32;
  *((_OWORD *)v31 + 1) = v33;
  *((void *)v31 + 10) = *((void *)v32 + 10);
  long long v34 = *((_OWORD *)v32 + 4);
  long long v36 = *((_OWORD *)v32 + 2);
  long long v35 = *((_OWORD *)v32 + 3);
  uint64_t v37 = a3[9];
  uint64_t v38 = &a1[v37];
  v39 = &a2[v37];
  *((_OWORD *)v31 + 3) = v35;
  *((_OWORD *)v31 + 4) = v34;
  *((_OWORD *)v31 + 2) = v36;
  v12(&a1[v37], &a2[v37], v11);
  uint64_t v40 = type metadata accessor for BloomFilterData(0);
  v12(&v38[*(int *)(v40 + 20)], &v39[*(int *)(v40 + 20)], v11);
  v12(&v38[*(int *)(v40 + 24)], &v39[*(int *)(v40 + 24)], v11);
  v12(&a1[a3[10]], &a2[a3[10]], v11);
  v12(&a1[a3[11]], &a2[a3[11]], v11);
  v12(&a1[a3[12]], &a2[a3[12]], v11);
  v12(&a1[a3[13]], &a2[a3[13]], v11);
  v12(&a1[a3[14]], &a2[a3[14]], v11);
  v12(&a1[a3[15]], &a2[a3[15]], v11);
  return a1;
}

char *assignWithTake for BlackPearlLevels(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = (int *)type metadata accessor for BlackPearlModel(0);
  uint64_t v9 = v8[6];
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = sub_2550D97D0();
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 40);
  v13(v10, v11, v12);
  v13(&a1[v8[7]], &a2[v8[7]], v12);
  uint64_t v14 = v8[8];
  id v15 = *(void **)&a1[v14];
  *(void *)&a1[v14] = *(void *)&a2[v14];

  uint64_t v16 = a3[5];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  uint64_t v19 = *(void *)&a2[v16 + 8];
  *(void *)uint64_t v17 = *(void *)&a2[v16];
  *((void *)v17 + 1) = v19;
  swift_bridgeObjectRelease();
  uint64_t v20 = *((void *)v18 + 3);
  *((void *)v17 + 2) = *((void *)v18 + 2);
  *((void *)v17 + 3) = v20;
  swift_bridgeObjectRelease();
  v13(&v17[v8[6]], &v18[v8[6]], v12);
  v13(&v17[v8[7]], &v18[v8[7]], v12);
  uint64_t v21 = v8[8];
  uint64_t v22 = *(void **)&v17[v21];
  *(void *)&v17[v21] = *(void *)&v18[v21];

  uint64_t v23 = a3[6];
  uint64_t v24 = &a1[v23];
  long long v25 = &a2[v23];
  uint64_t v26 = *(void *)&a2[v23 + 8];
  *(void *)uint64_t v24 = *(void *)&a2[v23];
  *((void *)v24 + 1) = v26;
  swift_bridgeObjectRelease();
  uint64_t v27 = *((void *)v25 + 3);
  *((void *)v24 + 2) = *((void *)v25 + 2);
  *((void *)v24 + 3) = v27;
  swift_bridgeObjectRelease();
  v13(&v24[v8[6]], &v25[v8[6]], v12);
  v13(&v24[v8[7]], &v25[v8[7]], v12);
  uint64_t v28 = v8[8];
  long long v29 = *(void **)&v24[v28];
  *(void *)&v24[v28] = *(void *)&v25[v28];

  uint64_t v30 = a3[7];
  uint64_t v31 = &a1[v30];
  uint64_t v32 = &a2[v30];
  uint64_t v33 = *(void *)&a2[v30 + 8];
  *(void *)uint64_t v31 = *(void *)&a2[v30];
  *((void *)v31 + 1) = v33;
  swift_bridgeObjectRelease();
  uint64_t v34 = *((void *)v32 + 3);
  *((void *)v31 + 2) = *((void *)v32 + 2);
  *((void *)v31 + 3) = v34;
  swift_bridgeObjectRelease();
  uint64_t v35 = *((void *)v32 + 5);
  *((void *)v31 + 4) = *((void *)v32 + 4);
  *((void *)v31 + 5) = v35;
  swift_bridgeObjectRelease();
  uint64_t v36 = *((void *)v32 + 7);
  *((void *)v31 + 6) = *((void *)v32 + 6);
  *((void *)v31 + 7) = v36;
  swift_bridgeObjectRelease();
  uint64_t v37 = *((void *)v32 + 9);
  *((void *)v31 + 8) = *((void *)v32 + 8);
  *((void *)v31 + 9) = v37;
  swift_bridgeObjectRelease();
  uint64_t v38 = *((void *)v32 + 11);
  *((void *)v31 + 10) = *((void *)v32 + 10);
  *((void *)v31 + 11) = v38;
  swift_bridgeObjectRelease();
  uint64_t v39 = *((void *)v32 + 13);
  *((void *)v31 + 12) = *((void *)v32 + 12);
  *((void *)v31 + 13) = v39;
  swift_bridgeObjectRelease();
  *((_OWORD *)v31 + 7) = *((_OWORD *)v32 + 7);
  uint64_t v40 = *((void *)v32 + 17);
  *((void *)v31 + 16) = *((void *)v32 + 16);
  *((void *)v31 + 17) = v40;
  swift_bridgeObjectRelease();
  uint64_t v41 = *((void *)v32 + 19);
  *((void *)v31 + 18) = *((void *)v32 + 18);
  *((void *)v31 + 19) = v41;
  swift_bridgeObjectRelease();
  *((_OWORD *)v31 + 10) = *((_OWORD *)v32 + 10);
  *(_OWORD *)(v31 + 169) = *(_OWORD *)(v32 + 169);
  uint64_t v42 = a3[8];
  uint64_t v43 = a3[9];
  uint64_t v44 = &a1[v42];
  uint64_t v45 = &a2[v42];
  long long v46 = *((_OWORD *)v45 + 1);
  *(_OWORD *)uint64_t v44 = *(_OWORD *)v45;
  *((_OWORD *)v44 + 1) = v46;
  long long v47 = *((_OWORD *)v45 + 3);
  *((_OWORD *)v44 + 2) = *((_OWORD *)v45 + 2);
  *((_OWORD *)v44 + 3) = v47;
  *((void *)v44 + 8) = *((void *)v45 + 8);
  *(_OWORD *)(v44 + 72) = *(_OWORD *)(v45 + 72);
  uint64_t v48 = &a1[v43];
  long long v49 = &a2[v43];
  v13(&a1[v43], &a2[v43], v12);
  uint64_t v50 = type metadata accessor for BloomFilterData(0);
  v13(&v48[*(int *)(v50 + 20)], &v49[*(int *)(v50 + 20)], v12);
  v13(&v48[*(int *)(v50 + 24)], &v49[*(int *)(v50 + 24)], v12);
  v13(&a1[a3[10]], &a2[a3[10]], v12);
  v13(&a1[a3[11]], &a2[a3[11]], v12);
  v13(&a1[a3[12]], &a2[a3[12]], v12);
  v13(&a1[a3[13]], &a2[a3[13]], v12);
  v13(&a1[a3[14]], &a2[a3[14]], v12);
  v13(&a1[a3[15]], &a2[a3[15]], v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for BlackPearlLevels(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2550A16C8);
}

uint64_t sub_2550A16C8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for BlackPearlModel(0);
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
    unint64_t v11 = *(void *)(a1 + a3[7] + 8);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    return (v11 + 1);
  }
  else
  {
    uint64_t v13 = type metadata accessor for BloomFilterData(0);
    uint64_t v14 = *(void *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a2)
    {
      uint64_t v8 = v13;
      uint64_t v10 = a1 + a3[9];
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
      goto LABEL_9;
    }
    uint64_t v15 = sub_2550D97D0();
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + a3[10];
    return v16(v18, a2, v17);
  }
}

uint64_t storeEnumTagSinglePayload for BlackPearlLevels(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2550A1860);
}

uint64_t sub_2550A1860(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = type metadata accessor for BlackPearlModel(0);
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
    *(void *)(a1 + a4[7] + 8) = (a2 - 1);
    return result;
  }
  uint64_t v13 = type metadata accessor for BloomFilterData(0);
  uint64_t v14 = *(void *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v12 = a1 + a4[9];
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_7;
  }
  uint64_t v15 = sub_2550D97D0();
  uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
  uint64_t v17 = v15;
  uint64_t v18 = a1 + a4[10];

  return v16(v18, a2, a2, v17);
}

uint64_t sub_2550A19E4()
{
  uint64_t result = type metadata accessor for BlackPearlModel(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for BloomFilterData(319);
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_2550D97D0();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_2550A1B08(uint64_t a1, uint64_t a2)
{
  return sub_2550A1C74(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_2550A1B20(uint64_t a1, id *a2)
{
  uint64_t result = sub_2550D9AB0();
  *a2 = 0;
  return result;
}

uint64_t sub_2550A1B98(uint64_t a1, id *a2)
{
  char v3 = sub_2550D9AC0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2550A1C18@<X0>(uint64_t *a1@<X8>)
{
  sub_2550D9AD0();
  uint64_t v2 = sub_2550D9AA0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2550A1C5C(uint64_t a1, uint64_t a2)
{
  return sub_2550A1C74(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_2550A1C74(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_2550D9AD0();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2550A1CB8()
{
  sub_2550D9AD0();
  sub_2550D9B50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2550A1D0C()
{
  sub_2550D9AD0();
  sub_2550DA1F0();
  sub_2550D9B50();
  uint64_t v0 = sub_2550DA210();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_2550A1D84(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_2550A1D8C()
{
  uint64_t v0 = sub_2550D9AD0();
  uint64_t v2 = v1;
  if (v0 == sub_2550D9AD0() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_2550DA140();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void *sub_2550A1E18@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_2550A1E24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_2550D9AA0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2550A1E6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2550D9AD0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void type metadata accessor for URLResourceKey()
{
  if (!qword_26B2799A0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26B2799A0);
    }
  }
}

uint64_t sub_2550A1EF0(uint64_t a1)
{
  uint64_t v2 = sub_2550A2024(&qword_269E847C8);
  uint64_t v3 = sub_2550A2024(&qword_269E847D0);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_2550A1F88()
{
  return sub_2550A2024(&qword_269E847B0);
}

uint64_t sub_2550A1FBC()
{
  return sub_2550A2024(&qword_269E847B8);
}

uint64_t sub_2550A1FF0()
{
  return sub_2550A2024(&qword_269E847C0);
}

uint64_t sub_2550A2024(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for URLResourceKey();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2550A206C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C50);
  MEMORY[0x270FA5388]();
  uint64_t v1 = (char *)&v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2799D8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2550DAB00;
  uint64_t v3 = (void *)*MEMORY[0x263EFF6A8];
  *(void *)(inited + 32) = *MEMORY[0x263EFF6A8];
  id v4 = v3;
  sub_2550A825C(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey();
  swift_arrayDestroy();
  sub_2550D9710();
  swift_bridgeObjectRelease();
  uint64_t v5 = sub_2550D96A0();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v1, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v1, 1, v5) == 1)
  {
    sub_2550A9778((uint64_t)v1, &qword_26B278C50);
  }
  else
  {
    char v8 = sub_2550D9690();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v1, v5);
    if (v8 != 2) {
      return v8 & 1;
    }
  }
  return 0;
}

unint64_t static TrialLoader.assetDir.getter()
{
  return 0xD000000000000010;
}

unint64_t static TrialLoader.modelTSPackageFactor.getter()
{
  return 0xD000000000000018;
}

unint64_t static TrialLoader.modelVersionFactor.getter()
{
  return 0xD000000000000016;
}

unint64_t static TrialLoader.senderVersionFactor.getter()
{
  return 0xD00000000000001CLL;
}

unint64_t static TrialLoader.tsVersionFactor.getter()
{
  return 0xD000000000000018;
}

unint64_t static TrialLoader.modelPackageFactor.getter()
{
  return 0xD000000000000016;
}

unint64_t static TrialLoader.modelSenderPackageFactor.getter()
{
  return 0xD00000000000001CLL;
}

unint64_t static TrialLoader.ruleVersionFactor.getter()
{
  return 0xD00000000000001ALL;
}

unint64_t static TrialLoader.breakthroughVersionFactor.getter()
{
  return 0xD00000000000001DLL;
}

unint64_t static TrialLoader.commerceBloomFilterFactor.getter()
{
  return 0xD000000000000013;
}

unint64_t static TrialLoader.categoryGuaranteedListFactor.getter()
{
  return 0xD000000000000016;
}

uint64_t static TrialLoader.nerBloomFilterFactor.getter()
{
  return 0x6D6F6F6C4252454ELL;
}

uint64_t static TrialLoader.domainLookupFactor.getter()
{
  return 0x6F4C6E69616D6F44;
}

uint64_t static TrialLoader.tsSubjectLookupFactor.getter()
{
  return 0x63656A6275535354;
}

uint64_t static TrialLoader.tsSenderLookupFactor.getter()
{
  return 0x7265646E65535354;
}

uint64_t static TrialLoader.catLookupFactor.getter()
{
  return 0x756B6F6F4C544143;
}

unint64_t static TrialLoader.thresholdCommerceFactor.getter()
{
  return 0xD000000000000011;
}

unint64_t static TrialLoader.thresholdEmployeeFactor.getter()
{
  return 0xD000000000000011;
}

unint64_t static TrialLoader.thresholdPersonalFactor.getter()
{
  return 0xD000000000000011;
}

uint64_t static TrialLoader.thresholdP2CFactor.getter()
{
  return 0x6C6F687365726854;
}

unint64_t static TrialLoader.thresholdCorpEmployeeFactor.getter()
{
  return 0xD000000000000015;
}

uint64_t static TrialLoader.thresholdSenderFactor.getter()
{
  return 0x6C6F687365726854;
}

uint64_t static TrialLoader.thresholdTSFactor.getter()
{
  return 0x6C6F687365726854;
}

unint64_t static TrialLoader.thresholdCategoryTSFactor.getter()
{
  return 0xD000000000000013;
}

uint64_t static TrialLoader.modelName.getter()
{
  return 0x6165506B63616C42;
}

unint64_t static TrialLoader.senderModelName.getter()
{
  return 0xD000000000000010;
}

uint64_t static TrialLoader.tsModelName.getter()
{
  return 0x6165506B63616C42;
}

unint64_t static TrialLoader.thresholdEmployeeNewsFactor.getter()
{
  return 0xD000000000000015;
}

unint64_t static TrialLoader.tsSenderMaxTokensFactor.getter()
{
  return 0xD000000000000011;
}

unint64_t static TrialLoader.tsSubjectMaxTokensFactor.getter()
{
  return 0xD000000000000012;
}

unint64_t static TrialLoader.personalDomainLookupFactor.getter()
{
  return 0xD000000000000014;
}

unint64_t static TrialLoader.saasSenderLookupFactor.getter()
{
  return 0xD000000000000011;
}

unint64_t static TrialLoader.categorizationVersionFactor.getter()
{
  return 0xD000000000000015;
}

uint64_t sub_2550A2670(uint64_t a1, void *a2)
{
  type metadata accessor for BlackPearlLevels();
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2550A2780(a1, (uint64_t)v5);
  uint64_t v6 = *a2 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
  swift_beginAccess();
  sub_2550A2840((uint64_t)v5, v6);
  return swift_endAccess();
}

uint64_t sub_2550A272C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
  swift_beginAccess();
  return sub_2550A2780(v3, a1);
}

uint64_t sub_2550A2780(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BlackPearlLevels();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2550A27E4(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
  swift_beginAccess();
  sub_2550A2840(a1, v3);
  return swift_endAccess();
}

uint64_t sub_2550A2840(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BlackPearlLevels();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_2550A28A4())()
{
  return j__swift_endAccess;
}

uint64_t TrialLoader.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  TrialLoader.init()();
  return v0;
}

uint64_t TrialLoader.init()()
{
  uint64_t v1 = type metadata accessor for BlackPearlTrialLevels();
  uint64_t v2 = v1 - 8;
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (void *)((char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = type metadata accessor for BlackPearlLevels();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = objc_msgSend(self, sel_clientWithIdentifier_, 312);
  *(void *)(v0 + 16) = v8;
  sub_2550D343C(v8, v4);
  sub_2550A2780((uint64_t)v4 + *(int *)(v2 + 28), (uint64_t)v7);
  sub_2550A76CC((uint64_t)v4, (uint64_t (*)(void))type metadata accessor for BlackPearlTrialLevels);
  sub_2550A2C1C((uint64_t)v7, v0 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels);
  id v9 = *(id *)(v0 + 16);
  uint64_t v10 = (void *)sub_2550D9AA0();
  unint64_t v11 = (void *)sub_2550D9AA0();
  id v12 = objc_msgSend(v9, sel_levelForFactor_withNamespaceName_, v10, v11);

  if (v12 && (id v13 = objc_msgSend(v12, sel_stringValue), v12, v13))
  {
    uint64_t v14 = sub_2550D9AD0();
    uint64_t v16 = v15;

    uint64_t v17 = (uint64_t *)(v0 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_forceDownloadOnLaunch);
    *uint64_t v17 = v14;
    v17[1] = v16;
    return v0;
  }
  else
  {
    unint64_t v20 = 0;
    unint64_t v21 = 0xE000000000000000;
    sub_2550D9F60();
    swift_bridgeObjectRelease();
    unint64_t v20 = 0xD000000000000024;
    unint64_t v21 = 0x80000002550DC850;
    v19[3] = 312;
    sub_2550DA130();
    sub_2550D9BA0();
    swift_bridgeObjectRelease();
    sub_2550D9BA0();
    sub_2550D9BA0();
    uint64_t result = sub_2550D9FD0();
    __break(1u);
  }
  return result;
}

uint64_t sub_2550A2C1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for BlackPearlLevels();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t TrialLoader.deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
  swift_beginAccess();
  uint64_t v3 = type metadata accessor for BlackPearlModel(0);
  uint64_t v4 = *(int *)(v3 + 32);
  uint64_t v5 = *(void **)(v2 + v4);
  *(void *)(v2 + v4) = 0;

  uint64_t v6 = type metadata accessor for BlackPearlLevels();
  uint64_t v7 = v2 + *(int *)(v6 + 24);
  uint64_t v8 = *(int *)(v3 + 32);
  id v9 = *(void **)(v7 + v8);
  *(void *)(v7 + v8) = 0;

  uint64_t v10 = v2 + *(int *)(v6 + 20);
  uint64_t v11 = *(int *)(v3 + 32);
  id v12 = *(void **)(v10 + v11);
  *(void *)(v10 + v11) = 0;

  if (qword_26B278B80 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_2550D9A00();
  __swift_project_value_buffer(v13, (uint64_t)qword_26B279BA0);
  swift_retain_n();
  uint64_t v14 = sub_2550D99E0();
  os_log_type_t v15 = sub_2550D9DD0();
  if (os_log_type_enabled(v14, v15))
  {
    os_log_type_t v25 = v15;
    log = v14;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 138412802;
    uint64_t v18 = *(void **)(v2 + *(int *)(v3 + 32));
    if (v18) {
      id v19 = v18;
    }
    sub_2550D9E90();
    *uint64_t v17 = v18;
    swift_release_n();
    *(_WORD *)(v16 + 12) = 2112;
    unint64_t v20 = *(void **)(v2 + *(int *)(v6 + 20) + *(int *)(v3 + 32));
    if (v20) {
      id v21 = v20;
    }
    sub_2550D9E90();
    v17[1] = v20;
    swift_release_n();
    *(_WORD *)(v16 + 22) = 2112;
    uint64_t v22 = *(void **)(v2 + *(int *)(v6 + 24) + *(int *)(v3 + 32));
    if (v22) {
      id v23 = v22;
    }
    sub_2550D9E90();
    v17[2] = v22;
    swift_release_n();
    _os_log_impl(&dword_25509D000, log, v25, "Destroyed trial-loader model  %@, %@, %@", (uint8_t *)v16, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E847D8);
    swift_arrayDestroy();
    MEMORY[0x25A2881E0](v17, -1, -1);
    MEMORY[0x25A2881E0](v16, -1, -1);
  }
  else
  {

    swift_release_n();
  }

  sub_2550A76CC(v2, (uint64_t (*)(void))type metadata accessor for BlackPearlLevels);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t TrialLoader.__deallocating_deinit()
{
  TrialLoader.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

void sub_2550A3074()
{
  uint64_t v1 = v0;
  if (qword_26B278B80 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_2550D9A00();
  __swift_project_value_buffer(v2, (uint64_t)qword_26B279BA0);
  uint64_t v3 = sub_2550D99E0();
  os_log_type_t v4 = sub_2550D9DC0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25509D000, v3, v4, "Subscribing to Trial updates", v5, 2u);
    MEMORY[0x25A2881E0](v5, -1, -1);
  }

  uint64_t v6 = *(void **)(v1 + 16);
  uint64_t v7 = (void *)sub_2550D9AA0();
  v10[4] = sub_2550A7770;
  v10[5] = v1;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_2550A3438;
  v10[3] = &block_descriptor;
  uint64_t v8 = _Block_copy(v10);
  swift_retain();
  swift_release();
  id v9 = objc_msgSend(v6, sel_addUpdateHandlerForNamespaceName_usingBlock_, v7, v8);
  _Block_release(v8);
  swift_unknownObjectRelease();
}

uint64_t sub_2550A3234(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for BlackPearlTrialLevels();
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (uint64_t *)((char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for BlackPearlLevels();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B278B80 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_2550D9A00();
  __swift_project_value_buffer(v9, (uint64_t)qword_26B279BA0);
  uint64_t v10 = sub_2550D99E0();
  os_log_type_t v11 = sub_2550D9DC0();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_25509D000, v10, v11, "Refreshing trial factors with new levels", v12, 2u);
    MEMORY[0x25A2881E0](v12, -1, -1);
  }

  uint64_t v13 = *(void **)(a2 + 16);
  objc_msgSend(v13, sel_refresh);
  sub_2550D343C(v13, v5);
  sub_2550A2780((uint64_t)v5 + *(int *)(v3 + 20), (uint64_t)v8);
  sub_2550A76CC((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for BlackPearlTrialLevels);
  uint64_t v14 = a2 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
  swift_beginAccess();
  sub_2550A2840((uint64_t)v8, v14);
  return swift_endAccess();
}

uint64_t sub_2550A3438(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

id sub_2550A3498()
{
  uint64_t v1 = v0;
  v45[3] = *(id *)MEMORY[0x263EF8340];
  uint64_t v2 = type metadata accessor for BlackPearlTrialLevels();
  MEMORY[0x270FA5388](v2);
  uint64_t v43 = (uint64_t *)((char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v4 = type metadata accessor for BlackPearlLevels();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26B278B80 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_2550D9A00();
  uint64_t v8 = __swift_project_value_buffer(v7, (uint64_t)qword_26B279BA0);
  uint64_t v9 = sub_2550D99E0();
  os_log_type_t v10 = sub_2550D9DC0();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    id v12 = (void *)swift_slowAlloc();
    v45[0] = v12;
    *(_DWORD *)os_log_type_t v11 = 136315138;
    uint64_t v44 = sub_2550A7884(0xD000000000000012, 0x80000002550DC490, (uint64_t *)v45);
    sub_2550D9E90();
    _os_log_impl(&dword_25509D000, v9, v10, "Initiating immediate model download for namespace %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2881E0](v12, -1, -1);
    MEMORY[0x25A2881E0](v11, -1, -1);
  }

  sub_2550A98C4((uint64_t)&unk_270441CD0);
  swift_arrayDestroy();
  uint64_t v13 = *(void **)(v1 + 16);
  uint64_t v14 = (void *)sub_2550D9D50();
  swift_bridgeObjectRelease();
  v45[0] = 0;
  id v15 = objc_msgSend(v13, sel_immediateDownloadForNamespaceNames_allowExpensiveNetworking_error_, v14, 1, v45);

  if (v15)
  {
    id v16 = v45[0];
    uint64_t v42 = v8;
    uint64_t v17 = sub_2550D99E0();
    os_log_type_t v18 = sub_2550D9DC0();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v41 = v1;
      id v19 = (uint8_t *)swift_slowAlloc();
      unint64_t v20 = (void *)swift_slowAlloc();
      v45[0] = v20;
      *(_DWORD *)id v19 = 136315138;
      uint64_t v44 = sub_2550A7884(0xD000000000000012, 0x80000002550DC490, (uint64_t *)v45);
      uint64_t v1 = v41;
      sub_2550D9E90();
      _os_log_impl(&dword_25509D000, v17, v18, "Completed immediate model download for namespace %s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2881E0](v20, -1, -1);
      MEMORY[0x25A2881E0](v19, -1, -1);
    }

    objc_msgSend(v13, sel_refresh);
    id v21 = v13;
    uint64_t v22 = v43;
    sub_2550D343C(v21, v43);
    sub_2550A2780((uint64_t)v22 + *(int *)(v2 + 20), (uint64_t)v6);
    sub_2550A76CC((uint64_t)v22, (uint64_t (*)(void))type metadata accessor for BlackPearlTrialLevels);
    uint64_t v23 = v1 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
    swift_beginAccess();
    sub_2550A2840((uint64_t)v6, v23);
    swift_endAccess();
    uint64_t v24 = sub_2550D99E0();
    os_log_type_t v25 = sub_2550D9DC0();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      uint64_t v27 = (void *)swift_slowAlloc();
      v45[0] = v27;
      *(_DWORD *)uint64_t v26 = 136315138;
      uint64_t v44 = sub_2550A7884(0xD000000000000012, 0x80000002550DC490, (uint64_t *)v45);
      sub_2550D9E90();
      _os_log_impl(&dword_25509D000, v24, v25, "Refresh completed for namespace %s", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2881E0](v27, -1, -1);
      MEMORY[0x25A2881E0](v26, -1, -1);
    }
    goto LABEL_13;
  }
  id v28 = v45[0];
  long long v29 = (void *)sub_2550D96B0();

  swift_willThrow();
  id v30 = v29;
  id v31 = v29;
  uint64_t v24 = sub_2550D99E0();
  os_log_type_t v32 = sub_2550D9DE0();
  if (!os_log_type_enabled(v24, v32))
  {

LABEL_13:
    return v15;
  }
  uint64_t v33 = swift_slowAlloc();
  uint64_t v34 = (void *)swift_slowAlloc();
  uint64_t v35 = (void *)swift_slowAlloc();
  v45[0] = v35;
  *(_DWORD *)uint64_t v33 = 136315394;
  uint64_t v44 = sub_2550A7884(0xD000000000000012, 0x80000002550DC490, (uint64_t *)v45);
  sub_2550D9E90();
  *(_WORD *)(v33 + 12) = 2112;
  id v36 = v29;
  id v37 = v15;
  uint64_t v38 = _swift_stdlib_bridgeErrorToNSError();
  uint64_t v44 = v38;
  sub_2550D9E90();
  *uint64_t v34 = v38;
  id v15 = v37;

  _os_log_impl(&dword_25509D000, v24, v32, "Failed immediate model download for namespace %s error %@", (uint8_t *)v33, 0x16u);
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E847D8);
  swift_arrayDestroy();
  MEMORY[0x25A2881E0](v34, -1, -1);
  swift_arrayDestroy();
  MEMORY[0x25A2881E0](v35, -1, -1);
  MEMORY[0x25A2881E0](v33, -1, -1);

  return v15;
}

uint64_t sub_2550A3BDC()
{
  uint64_t v1 = sub_2550D9880();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v0 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
  swift_beginAccess();
  if (*(void *)(v5 + *(int *)(type metadata accessor for BlackPearlLevels() + 28) + 152)) {
    return 0;
  }
  if (sub_2550D9B10() == 0x64656C62616E65 && v7 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = sub_2550DA140();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
      if (sub_2550D9B10() == 0x65646F6D676E616CLL && v10 == 0xED0000796C6E6F6CLL)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v12 = sub_2550DA140();
        swift_bridgeObjectRelease();
        if ((v12 & 1) == 0) {
          return 0;
        }
      }
      sub_2550D9870();
      uint64_t v13 = sub_2550D9860();
      uint64_t v15 = v14;
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      if (v13 == 28261 && v15 == 0xE200000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v17 = sub_2550DA140();
        swift_bridgeObjectRelease();
        if ((v17 & 1) == 0) {
          return 1;
        }
      }
      return 0;
    }
  }
  return 1;
}

uint64_t sub_2550A3E50(uint64_t a1)
{
  uint64_t v40 = sub_2550D9880();
  uint64_t v3 = *(void *)(v40 - 8);
  MEMORY[0x270FA5388](v40);
  uint64_t v39 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = 0;
  if (a1 < 1)
  {
LABEL_24:
    sub_2550A7790();
    swift_allocError();
    *uint64_t v24 = 2;
    swift_willThrow();
  }
  else
  {
    uint64_t v5 = v1 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
    swift_beginAccess();
    swift_beginAccess();
    uint64_t v6 = type metadata accessor for BlackPearlLevels();
    uint64_t v7 = v5 + 152;
    uint64_t v38 = (void (**)(char *, uint64_t))(v3 + 8);
    *(void *)&long long v8 = 134217984;
    long long v41 = v8;
    while (1)
    {
      if (*(void *)(v7 + *(int *)(v6 + 28))) {
        goto LABEL_30;
      }
      if (sub_2550D9B10() == 0x64656C62616E65 && v9 == 0xE700000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v11 = sub_2550DA140();
        swift_bridgeObjectRelease();
        if ((v11 & 1) == 0)
        {
          if (sub_2550D9B10() == 0x65646F6D676E616CLL && v12 == 0xED0000796C6E6F6CLL)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            char v13 = sub_2550DA140();
            swift_bridgeObjectRelease();
            if ((v13 & 1) == 0) {
              goto LABEL_30;
            }
          }
          uint64_t v14 = v39;
          sub_2550D9870();
          uint64_t v15 = sub_2550D9860();
          uint64_t v17 = v16;
          (*v38)(v14, v40);
          if (v15 == 28261 && v17 == 0xE200000000000000)
          {
            swift_bridgeObjectRelease();
LABEL_30:
            if (qword_26B278B80 == -1)
            {
LABEL_31:
              uint64_t v34 = sub_2550D9A00();
              __swift_project_value_buffer(v34, (uint64_t)qword_26B279BA0);
              uint64_t v26 = sub_2550D99E0();
              os_log_type_t v35 = sub_2550D9DC0();
              if (!os_log_type_enabled(v26, v35)) {
                goto LABEL_34;
              }
              id v28 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)id v28 = 0;
              long long v29 = "Skipping immediate download";
              id v30 = v26;
              os_log_type_t v31 = v35;
              os_log_type_t v32 = v28;
              uint32_t v33 = 2;
              goto LABEL_33;
            }
LABEL_37:
            swift_once();
            goto LABEL_31;
          }
          char v18 = sub_2550DA140();
          swift_bridgeObjectRelease();
          if (v18) {
            goto LABEL_30;
          }
        }
      }
      if (sub_2550A3498()) {
        break;
      }
      if (qword_26B278B80 != -1) {
        swift_once();
      }
      uint64_t v19 = sub_2550D9A00();
      __swift_project_value_buffer(v19, (uint64_t)qword_26B279BA0);
      unint64_t v20 = sub_2550D99E0();
      os_log_type_t v21 = sub_2550D9DE0();
      if (os_log_type_enabled(v20, v21))
      {
        uint64_t v22 = swift_slowAlloc();
        *(_DWORD *)uint64_t v22 = v41;
        *(void *)(v22 + 4) = v43;
        _os_log_impl(&dword_25509D000, v20, v21, "Attempt %ld failed", (uint8_t *)v22, 0xCu);
        MEMORY[0x25A2881E0](v22, -1, -1);
      }

      uint64_t v23 = v43 + 1;
      if (__OFADD__(v43, 1))
      {
        __break(1u);
        goto LABEL_37;
      }
      ++v43;
      if (v23 >= a1) {
        goto LABEL_24;
      }
    }
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_2550D9A00();
    __swift_project_value_buffer(v25, (uint64_t)qword_26B279BA0);
    uint64_t v26 = sub_2550D99E0();
    os_log_type_t v27 = sub_2550D9DC0();
    if (os_log_type_enabled(v26, v27))
    {
      id v28 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v28 = 67109120;
      int v42 = 1;
      sub_2550D9E90();
      long long v29 = "Completed immediate download status=%{BOOL}d";
      id v30 = v26;
      os_log_type_t v31 = v27;
      os_log_type_t v32 = v28;
      uint32_t v33 = 8;
LABEL_33:
      _os_log_impl(&dword_25509D000, v30, v31, v29, v32, v33);
      MEMORY[0x25A2881E0](v28, -1, -1);
    }
LABEL_34:
  }
  return 1;
}

uint64_t sub_2550A43B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E847E8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2550D9D00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  char v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v3;
  v11[5] = a1;
  v11[6] = a2;
  v11[7] = a3;
  swift_retain();
  swift_retain();
  sub_2550A479C((uint64_t)v9, (uint64_t)&unk_269E847F8, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_2550A44D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  return MEMORY[0x270FA2498](sub_2550A44F8, 0, 0);
}

uint64_t sub_2550A44F8()
{
  uint64_t v5 = v0;
  sub_2550A3E50(v0[4]);
  uint64_t v1 = (void (*)(__int16 *))v0[5];
  v4[0] = 1;
  v1(v4);
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_2550A479C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2550D9D00();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2550D9CF0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_2550A9778(a1, &qword_269E847E8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2550D9CE0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_2550A4948(char *a1@<X8>)
{
  v72[1] = *(id *)MEMORY[0x263EF8340];
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C58);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v3 = (char *)&v61 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_2550D97D0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v8 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  char v11 = (char *)&v61 - v10;
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)&v61 - v12;
  char v71 = 1;
  uint64_t v70 = 1;
  uint64_t v14 = container_system_group_path_for_identifier();
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    id v16 = objc_msgSend(objc_allocWithZone(NSURL), sel_initFileURLWithFileSystemRepresentation_isDirectory_relativeToURL_, v14, 1, 0);
    uint64_t v17 = (void *)sub_2550D9AA0();
    id v68 = v16;
    id v18 = objc_msgSend(v16, sel_URLByAppendingPathComponent_isDirectory_, v17, 1);

    if (!v18)
    {
      unint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
      v20(v3, 1, 1, v4);
      goto LABEL_11;
    }
    v67 = a1;
    sub_2550D9780();

    uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v19(v3, v11, v4);
    unint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    v20(v3, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      a1 = v67;
LABEL_11:
      sub_2550A9778((uint64_t)v3, &qword_26B278C58);
      if (qword_26B278B80 != -1) {
        swift_once();
      }
      uint64_t v25 = sub_2550D9A00();
      __swift_project_value_buffer(v25, (uint64_t)qword_26B279BA0);
      uint64_t v26 = sub_2550D99E0();
      os_log_type_t v27 = sub_2550D9DE0();
      if (os_log_type_enabled(v26, v27))
      {
        id v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v28 = 0;
        _os_log_impl(&dword_25509D000, v26, v27, "Failed to determine path to blackpearl cache", v28, 2u);
        MEMORY[0x25A2881E0](v28, -1, -1);
      }

      v20(a1, 1, 1, v4);
      goto LABEL_32;
    }
    uint64_t v65 = v5 + 56;
    v66 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v20;
    v64 = v19;
    v19(v13, v3, v4);
    long long v29 = self;
    id v30 = objc_msgSend(v29, sel_defaultManager);
    sub_2550D9790();
    os_log_type_t v31 = (void *)sub_2550D9AA0();
    swift_bridgeObjectRelease();
    unsigned __int8 v32 = objc_msgSend(v30, sel_fileExistsAtPath_isDirectory_, v31, &v71);

    if ((v32 & 1) == 0)
    {
      id v33 = objc_msgSend(v29, sel_defaultManager);
      uint64_t v34 = (void *)sub_2550D9740();
      v72[0] = 0;
      unsigned int v35 = objc_msgSend(v33, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v34, 1, 0, v72);

      if (!v35)
      {
        id v49 = v72[0];
        uint64_t v50 = (void *)sub_2550D96B0();

        swift_willThrow();
        if (qword_26B278B80 != -1) {
          swift_once();
        }
        uint64_t v51 = sub_2550D9A00();
        __swift_project_value_buffer(v51, (uint64_t)qword_26B279BA0);
        id v52 = v50;
        id v53 = v50;
        long long v54 = sub_2550D99E0();
        os_log_type_t v55 = sub_2550D9DE0();
        if (os_log_type_enabled(v54, v55))
        {
          uint64_t v56 = (uint8_t *)swift_slowAlloc();
          v64 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v56 = 138412290;
          v63 = v56 + 4;
          id v57 = v50;
          id v58 = (void *)_swift_stdlib_bridgeErrorToNSError();
          v72[0] = v58;
          sub_2550D9E90();
          uint64_t v59 = v64;
          void *v64 = v58;

          _os_log_impl(&dword_25509D000, v54, v55, "Failed to create directory BlackPearl/mlmodelc %@", v56, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_269E847D8);
          swift_arrayDestroy();
          MEMORY[0x25A2881E0](v59, -1, -1);
          MEMORY[0x25A2881E0](v56, -1, -1);
        }
        else
        {
        }
        uint64_t v60 = v67;

        (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
        long long v47 = v60;
        uint64_t v48 = 1;
        goto LABEL_31;
      }
      id v36 = v72[0];
    }
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v37 = sub_2550D9A00();
    __swift_project_value_buffer(v37, (uint64_t)qword_26B279BA0);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v13, v4);
    uint64_t v38 = sub_2550D99E0();
    os_log_type_t v39 = sub_2550D9DD0();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      v63 = (void *)swift_slowAlloc();
      v72[0] = v63;
      uint64_t v62 = v40;
      *(_DWORD *)uint64_t v40 = 136315138;
      v61 = v40 + 4;
      sub_2550A8FF0();
      uint64_t v41 = sub_2550DA130();
      uint64_t v69 = sub_2550A7884(v41, v42, (uint64_t *)v72);
      sub_2550D9E90();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      os_log_type_t v43 = v39;
      uint64_t v44 = v62;
      _os_log_impl(&dword_25509D000, v38, v43, "Container path %s", v62, 0xCu);
      uint64_t v45 = v63;
      swift_arrayDestroy();
      MEMORY[0x25A2881E0](v45, -1, -1);
      MEMORY[0x25A2881E0](v44, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }

    long long v46 = v67;
    ((void (*)(char *, char *, uint64_t))v64)(v67, v13, v4);
    long long v47 = v46;
    uint64_t v48 = 0;
LABEL_31:
    v66((uint64_t)v47, v48, 1, v4);
LABEL_32:
    free(v15);

    return;
  }
  if (qword_26B278B80 != -1) {
    swift_once();
  }
  uint64_t v21 = sub_2550D9A00();
  __swift_project_value_buffer(v21, (uint64_t)qword_26B279BA0);
  uint64_t v22 = sub_2550D99E0();
  os_log_type_t v23 = sub_2550D9DE0();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v24 = 0;
    _os_log_impl(&dword_25509D000, v22, v23, "Container path not found or entitled to the process", v24, 2u);
    MEMORY[0x25A2881E0](v24, -1, -1);
  }

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(a1, 1, 1, v4);
}

uint64_t static TrialLoader.compileModel(modelPath:modelName:modelVersion:)@<X0>(char *a1@<X0>, void (*a2)(char *, char *, uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, void *a7@<X8>)
{
  v115 = a1;
  v116 = a2;
  v119 = a7;
  uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B2799A8);
  uint64_t v11 = MEMORY[0x270FA5388](v111);
  v112 = (uint64_t *)((char *)&v102 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  v110 = (char **)((char *)&v102 - v14);
  MEMORY[0x270FA5388](v13);
  v123 = (char **)((char *)&v102 - v15);
  uint64_t v108 = sub_2550D96F0();
  uint64_t v16 = *(void *)(v108 - 8);
  MEMORY[0x270FA5388](v108);
  v109 = (char *)&v102 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_2550D97D0();
  v113 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  v124 = (char *)&v102 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  v104 = (char *)&v102 - v22;
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  v105 = (char *)&v102 - v24;
  uint64_t v25 = MEMORY[0x270FA5388](v23);
  v106 = (char *)&v102 - v26;
  uint64_t v27 = MEMORY[0x270FA5388](v25);
  uint64_t v125 = (uint64_t)&v102 - v28;
  MEMORY[0x270FA5388](v27);
  v107 = (char *)&v102 - v29;
  uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C58);
  uint64_t v31 = MEMORY[0x270FA5388](v30 - 8);
  uint64_t v103 = (uint64_t)&v102 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = MEMORY[0x270FA5388](v31);
  v114 = (char **)((char *)&v102 - v34);
  uint64_t v35 = MEMORY[0x270FA5388](v33);
  uint64_t v37 = (char *)&v102 - v36;
  MEMORY[0x270FA5388](v35);
  v120 = (char *)&v102 - v38;
  uint64_t v121 = a3;
  uint64_t v128 = 95;
  unint64_t v129 = 0xE100000000000000;
  uint64_t v126 = a3;
  uint64_t v127 = a4;
  uint64_t v122 = a4;
  swift_bridgeObjectRetain();
  uint64_t v126 = sub_2550D9C60();
  uint64_t v127 = v39;
  sub_2550D9B90();
  uint64_t v117 = a5;
  unint64_t v118 = a6;
  uint64_t v128 = a5;
  unint64_t v129 = a6;
  swift_bridgeObjectRetain();
  uint64_t v126 = sub_2550D9C60();
  uint64_t v127 = v40;
  sub_2550D9B90();
  uint64_t v41 = v113;
  swift_bridgeObjectRelease();
  uint64_t v42 = v126;
  unint64_t v43 = v127;
  type metadata accessor for TrialLoader();
  sub_2550A4948(v37);
  uint64_t v44 = (unsigned int (*)(char *, uint64_t, uint64_t))v41[6];
  if (v44(v37, 1, v18) == 1)
  {
    swift_bridgeObjectRelease();
    sub_2550A9778((uint64_t)v37, &qword_26B278C58);
    uint64_t v45 = 1;
    uint64_t v46 = (uint64_t)v120;
  }
  else
  {
    uint64_t v128 = v42;
    unint64_t v129 = v43;
    long long v47 = v109;
    uint64_t v48 = v108;
    (*(void (**)(char *, void, uint64_t))(v16 + 104))(v109, *MEMORY[0x263F06E50], v108);
    sub_2550A8F9C();
    id v49 = v107;
    v102 = (char *)(v41 + 6);
    sub_2550D97C0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v47, v48);
    swift_bridgeObjectRelease();
    uint64_t v50 = (void (*)(char *, uint64_t))v41[1];
    v50(v37, v18);
    uint64_t v46 = (uint64_t)v120;
    sub_2550D9760();
    v50(v49, v18);
    uint64_t v45 = 0;
  }
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v41[7])(v46, v45, 1, v18);
  sub_2550D9720();
  id v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F00D98]), sel_init);
  objc_msgSend(v51, sel_setComputeUnits_, 0);
  objc_msgSend(v51, sel_setExperimentalMLE5BNNSGraphBackendUsage_, 0);
  id v52 = (char *)v114;
  sub_2550A7EDC(v46, (uint64_t)v114);
  unint64_t v53 = 0x26B278000uLL;
  long long v54 = v41;
  if (v44(v52, 1, v18) == 1)
  {
    sub_2550A9778((uint64_t)v52, &qword_26B278C58);
  }
  else
  {
    v113 = v44;
    LODWORD(v116) = sub_2550A206C();
    v114 = (char **)v41[1];
    v115 = (char *)(v41 + 1);
    ((void (*)(char *, uint64_t))v114)(v52, v18);
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v55 = sub_2550D9A00();
    uint64_t v56 = __swift_project_value_buffer(v55, (uint64_t)qword_26B279BA0);
    id v57 = sub_2550D99E0();
    os_log_type_t v58 = sub_2550D9DD0();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v59 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v59 = 67109120;
      unint64_t v53 = 0x26B278000;
      LODWORD(v128) = v116 & 1;
      sub_2550D9E90();
      _os_log_impl(&dword_25509D000, v57, v58, "Compile model exists %{BOOL}d", v59, 8u);
      MEMORY[0x25A2881E0](v59, -1, -1);
    }

    if (v116)
    {
      uint64_t v60 = v103;
      sub_2550A7EDC(v46, v103);
      if (v113((char *)v60, 1, v18) == 1)
      {
        sub_2550A9778(v60, &qword_26B278C58);
        uint64_t result = sub_2550D9FD0();
        __break(1u);
      }
      else
      {
        v61 = (char *)v54[4];
        uint64_t v62 = v106;
        v113 = (unsigned int (*)(char *, uint64_t, uint64_t))(v54 + 4);
        v109 = v61;
        ((void (*)(char *, uint64_t, uint64_t))v61)(v106, v60, v18);
        v63 = v105;
        v116 = (void (*)(char *, char *, uint64_t))v54[2];
        v116(v105, v62, v18);
        v64 = sub_2550D99E0();
        os_log_type_t v65 = sub_2550D9DC0();
        BOOL v66 = os_log_type_enabled(v64, v65);
        uint64_t v108 = v56;
        if (v66)
        {
          v67 = (uint8_t *)swift_slowAlloc();
          uint64_t v68 = swift_slowAlloc();
          uint64_t v128 = v68;
          *(_DWORD *)v67 = 136315138;
          uint64_t v69 = sub_2550D9700();
          uint64_t v126 = sub_2550A7884(v69, v70, &v128);
          uint64_t v62 = v106;
          sub_2550D9E90();
          swift_bridgeObjectRelease();
          ((void (*)(char *, uint64_t))v114)(v105, v18);
          _os_log_impl(&dword_25509D000, v64, v65, "Using complied Model from cache %s", v67, 0xCu);
          swift_arrayDestroy();
          uint64_t v71 = v68;
          uint64_t v46 = (uint64_t)v120;
          MEMORY[0x25A2881E0](v71, -1, -1);
          MEMORY[0x25A2881E0](v67, -1, -1);
        }
        else
        {
          ((void (*)(char *, uint64_t))v114)(v63, v18);
        }

        sub_2550A8F5C();
        uint64_t v93 = (uint64_t)v104;
        v116(v104, v62, v18);
        id v94 = v51;
        id v95 = sub_2550A848C(v93, (uint64_t)v94);

        sub_2550A9778(v46, &qword_26B278C58);
        v96 = (int *)type metadata accessor for BlackPearlModel(0);
        v97 = v119;
        v98 = v109;
        ((void (*)(char *, char *, uint64_t))v109)((char *)v119 + v96[6], v62, v18);
        ((void (*)(char *, uint64_t, uint64_t))v98)((char *)v97 + v96[7], v125, v18);
        uint64_t v99 = v96[8];
        uint64_t v100 = v122;
        void *v97 = v121;
        v97[1] = v100;
        unint64_t v101 = v118;
        v97[2] = v117;
        v97[3] = v101;
        *(void *)((char *)v97 + v99) = v95;
        swift_bridgeObjectRetain();
        return swift_bridgeObjectRetain();
      }
      return result;
    }
  }
  if (*(void *)(v53 + 2944) != -1) {
    swift_once();
  }
  uint64_t v72 = sub_2550D9A00();
  __swift_project_value_buffer(v72, (uint64_t)qword_26B279BA0);
  v73 = sub_2550D99E0();
  os_log_type_t v74 = sub_2550D9DC0();
  if (os_log_type_enabled(v73, v74))
  {
    v75 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v75 = 0;
    _os_log_impl(&dword_25509D000, v73, v74, "Compiled model not found in cache", v75, 2u);
    MEMORY[0x25A2881E0](v75, -1, -1);
  }

  _s20MCCKitCategorization11TrialLoaderC16cleanCachedModel9modelNameySS_tFZ_0(v121, v122);
  uint64_t v76 = v111;
  v77 = v123;
  uint64_t v78 = v125;
  v79 = (void *)static TrialLoader.compileAndCacheModel(config:packageURL:compiledModelCachePath:)((char *)v123 + *(int *)(v111 + 48), v51, v125, v46);

  sub_2550A9778(v46, &qword_26B278C58);
  void *v77 = v79;
  v120 = (char *)v110 + *(int *)(v76 + 48);
  void *v110 = v79;
  v80 = (void (*)(void))v54[2];
  v80();
  v81 = (void (*)(char *, uint64_t, uint64_t))v54[4];
  v81(v124, v78, v18);
  uint64_t v82 = *(int *)(v76 + 48);
  v83 = v112;
  uint64_t v125 = (uint64_t)v112 + v82;
  uint64_t *v112 = (uint64_t)v79;
  v80();
  uint64_t v84 = v122;
  swift_bridgeObjectRetain();
  unint64_t v85 = v118;
  swift_bridgeObjectRetain();
  id v86 = v79;
  sub_2550A9778((uint64_t)v123, &qword_26B2799A8);
  uint64_t v87 = *v83;
  v88 = (int *)type metadata accessor for BlackPearlModel(0);
  uint64_t v89 = v88[8];
  v91 = (char *)v119;
  v90 = v120;
  void *v119 = v121;
  *((void *)v91 + 1) = v84;
  *((void *)v91 + 2) = v117;
  *((void *)v91 + 3) = v85;
  v81(&v91[v88[6]], (uint64_t)v90, v18);
  v81(&v91[v88[7]], (uint64_t)v124, v18);
  *(void *)&v91[v89] = v87;
  return ((uint64_t (*)(uint64_t, uint64_t))v54[1])(v125, v18);
}

uint64_t static TrialLoader.compileAndCacheModel(config:packageURL:compiledModelCachePath:)(char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v84 = a4;
  uint64_t v82 = a1;
  v86[2] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C58);
  uint64_t v6 = MEMORY[0x270FA5388](v5 - 8);
  v81 = (char *)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v72 - v8;
  uint64_t v10 = sub_2550D97D0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v80 = (char *)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  v77 = (char *)&v72 - v15;
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v76 = (char *)&v72 - v17;
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v78 = (char *)&v72 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v72 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v24 = (char *)&v72 - v23;
  uint64_t v25 = self;
  uint64_t v26 = (void *)sub_2550D9740();
  v86[0] = 0;
  id v27 = objc_msgSend(v25, sel_compileModelAtURL_error_, v26, v86);

  id v28 = v86[0];
  if (v27)
  {
    sub_2550D9780();
    id v29 = v28;

    sub_2550A8F5C();
    uint64_t v30 = v24;
    uint64_t v31 = *(void (**)(char *))(v11 + 16);
    v83 = v30;
    v31(v22);
    id v32 = a2;
    id v79 = sub_2550A848C((uint64_t)v22, (uint64_t)v32);

    uint64_t v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    uint64_t v34 = v84;
    if (v33((char *)v84, 1, v10) == 1)
    {
      if (qword_26B278B80 != -1) {
        swift_once();
      }
      uint64_t v35 = sub_2550D9A00();
      __swift_project_value_buffer(v35, (uint64_t)qword_26B279BA0);
      uint64_t v36 = sub_2550D99E0();
      os_log_type_t v37 = sub_2550D9DE0();
      BOOL v38 = os_log_type_enabled(v36, v37);
      uint64_t v40 = (uint64_t)v81;
      uint64_t v39 = v82;
      uint64_t v41 = v80;
      if (v38)
      {
        uint64_t v42 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v42 = 0;
        _os_log_impl(&dword_25509D000, v36, v37, "Compiled Model Caching path is nil, returning non cached instance", v42, 2u);
        unint64_t v43 = v42;
        uint64_t v34 = v84;
        MEMORY[0x25A2881E0](v43, -1, -1);
      }
    }
    else
    {
      sub_2550A7EDC(v34, (uint64_t)v9);
      if (v33(v9, 1, v10) == 1)
      {
        sub_2550A9778((uint64_t)v9, &qword_26B278C58);
        uint64_t v40 = (uint64_t)v81;
        uint64_t v39 = v82;
        uint64_t v41 = v80;
      }
      else
      {
        uint64_t v44 = v78;
        (*(void (**)(void))(v11 + 32))();
        id v45 = objc_msgSend(self, sel_defaultManager);
        char v46 = sub_2550A7F44();

        if (v46)
        {
          (*(void (**)(char *, uint64_t))(v11 + 8))(v44, v10);
        }
        else
        {
          if (qword_26B278B80 != -1) {
            swift_once();
          }
          uint64_t v47 = sub_2550D9A00();
          __swift_project_value_buffer(v47, (uint64_t)qword_26B279BA0);
          ((void (*)(char *, char *, uint64_t))v31)(v76, v44, v10);
          ((void (*)(char *, char *, uint64_t))v31)(v77, v83, v10);
          uint64_t v48 = sub_2550D99E0();
          os_log_type_t v49 = sub_2550D9DE0();
          int v50 = v49;
          if (os_log_type_enabled(v48, v49))
          {
            uint64_t v51 = swift_slowAlloc();
            v75 = (void *)swift_slowAlloc();
            v86[0] = v75;
            *(_DWORD *)uint64_t v51 = 136315394;
            os_log_t v74 = v48;
            int v73 = v50;
            id v52 = v76;
            uint64_t v53 = sub_2550D9700();
            uint64_t v85 = sub_2550A7884(v53, v54, (uint64_t *)v86);
            sub_2550D9E90();
            swift_bridgeObjectRelease();
            uint64_t v72 = *(void (**)(char *, uint64_t))(v11 + 8);
            v72(v52, v10);
            *(_WORD *)(v51 + 12) = 2080;
            sub_2550A8FF0();
            uint64_t v55 = v77;
            uint64_t v56 = sub_2550DA130();
            uint64_t v85 = sub_2550A7884(v56, v57, (uint64_t *)v86);
            uint64_t v34 = v84;
            sub_2550D9E90();
            swift_bridgeObjectRelease();
            os_log_type_t v58 = v55;
            uint64_t v59 = v72;
            v72(v58, v10);
            os_log_t v60 = v74;
            _os_log_impl(&dword_25509D000, v74, (os_log_type_t)v73, "Failed to copy model to permanent cache path %s from %s", (uint8_t *)v51, 0x16u);
            v61 = v75;
            swift_arrayDestroy();
            MEMORY[0x25A2881E0](v61, -1, -1);
            MEMORY[0x25A2881E0](v51, -1, -1);

            v59(v78, v10);
          }
          else
          {

            uint64_t v62 = *(void (**)(char *, uint64_t))(v11 + 8);
            v62(v77, v10);
            v62(v76, v10);
            v62(v44, v10);
          }
        }
        uint64_t v40 = (uint64_t)v81;
        uint64_t v39 = v82;
        uint64_t v41 = v80;
      }
    }
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v63 = sub_2550D9A00();
    __swift_project_value_buffer(v63, (uint64_t)qword_26B279BA0);
    v64 = sub_2550D99E0();
    os_log_type_t v65 = sub_2550D9DC0();
    if (os_log_type_enabled(v64, v65))
    {
      BOOL v66 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v66 = 0;
      _os_log_impl(&dword_25509D000, v64, v65, "Complied Model at runtime as no cache exists", v66, 2u);
      v67 = v66;
      uint64_t v34 = v84;
      MEMORY[0x25A2881E0](v67, -1, -1);
    }

    sub_2550A7EDC(v34, v40);
    uint64_t v68 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v68(v41, v83, v10);
    if (v33((char *)v40, 1, v10) == 1)
    {
      v68(v39, v41, v10);
      sub_2550A9778(v40, &qword_26B278C58);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v11 + 8))(v41, v10);
      v68(v39, (char *)v40, v10);
    }
    return (uint64_t)v79;
  }
  else
  {
    id v70 = v86[0];
    uint64_t v71 = sub_2550D96B0();

    swift_willThrow();
    v86[0] = 0;
    v86[1] = (id)0xE000000000000000;
    sub_2550D9F60();
    sub_2550D9BA0();
    uint64_t v85 = v71;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E84800);
    sub_2550D9FB0();
    uint64_t result = sub_2550D9FD0();
    __break(1u);
  }
  return result;
}

unint64_t sub_2550A6BA4()
{
  return 0xD000000000000010;
}

unint64_t sub_2550A6BC0()
{
  return 0xD000000000000016;
}

unint64_t sub_2550A6BDC()
{
  return 0xD00000000000001CLL;
}

unint64_t sub_2550A6BF8()
{
  return 0xD000000000000016;
}

unint64_t sub_2550A6C14()
{
  return 0xD00000000000001CLL;
}

unint64_t sub_2550A6C30()
{
  return 0xD000000000000018;
}

unint64_t sub_2550A6C4C()
{
  return 0xD00000000000001ALL;
}

unint64_t sub_2550A6C68()
{
  return 0xD00000000000001DLL;
}

unint64_t sub_2550A6C84()
{
  return 0xD000000000000013;
}

unint64_t sub_2550A6CA0()
{
  return 0xD000000000000016;
}

uint64_t sub_2550A6CBC()
{
  return 0x6D6F6F6C4252454ELL;
}

uint64_t sub_2550A6CE0()
{
  return 0x6F4C6E69616D6F44;
}

uint64_t sub_2550A6D00()
{
  return 0x63656A6275535354;
}

uint64_t sub_2550A6D24()
{
  return 0x7265646E65535354;
}

unint64_t sub_2550A6D48()
{
  return 0xD000000000000011;
}

unint64_t sub_2550A6D64()
{
  return 0xD000000000000011;
}

unint64_t sub_2550A6D80()
{
  return 0xD000000000000011;
}

uint64_t sub_2550A6D9C()
{
  return 0x6C6F687365726854;
}

unint64_t sub_2550A6DBC()
{
  return 0xD000000000000015;
}

uint64_t sub_2550A6DD8()
{
  return 0x6C6F687365726854;
}

uint64_t sub_2550A6DFC()
{
  return 0x6C6F687365726854;
}

unint64_t sub_2550A6E1C()
{
  return 0xD000000000000013;
}

unint64_t sub_2550A6E38()
{
  return 0xD000000000000015;
}

uint64_t sub_2550A6E54()
{
  return 0x6165506B63616C42;
}

unint64_t sub_2550A6E70()
{
  return 0xD000000000000010;
}

unint64_t sub_2550A6E8C()
{
  return 0xD000000000000018;
}

unint64_t sub_2550A6EA8()
{
  return 0xD000000000000011;
}

unint64_t sub_2550A6EC4()
{
  return 0xD000000000000012;
}

unint64_t sub_2550A6EE0()
{
  return 0xD000000000000011;
}

uint64_t sub_2550A6EFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
  swift_beginAccess();
  return sub_2550A2780(v3, a1);
}

uint64_t sub_2550A6F54(uint64_t a1)
{
  uint64_t v3 = *v1 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
  swift_beginAccess();
  sub_2550A2840(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_2550A6FB4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_2550A7014@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for TrialLoader();
  uint64_t v2 = swift_allocObject();
  uint64_t result = TrialLoader.init()();
  *a1 = v2;
  return result;
}

void sub_2550A7054()
{
}

uint64_t sub_2550A7078()
{
  return sub_2550A3BDC() & 1;
}

uint64_t sub_2550A70A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E847E8);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v3;
  uint64_t v11 = sub_2550D9D00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v10;
  v12[5] = a1;
  v12[6] = a2;
  v12[7] = a3;
  swift_retain();
  swift_retain();
  sub_2550A479C((uint64_t)v9, (uint64_t)&unk_269E84818, (uint64_t)v12);
  return swift_release();
}

uint64_t sub_2550A71C0@<X0>(char *a1@<X0>, void (*a2)(char *, char *, uint64_t)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, void *a7@<X8>)
{
  return static TrialLoader.compileModel(modelPath:modelName:modelVersion:)(a1, a2, a3, a4, a5, a6, a7);
}

BOOL static TrialLoader.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TrialLoader.Error.hash(into:)()
{
  return sub_2550DA200();
}

uint64_t TrialLoader.Error.hashValue.getter()
{
  return sub_2550DA210();
}

BOOL sub_2550A7260(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2550A7274()
{
  return sub_2550DA210();
}

uint64_t sub_2550A72BC()
{
  return sub_2550DA200();
}

uint64_t sub_2550A72E8()
{
  return sub_2550DA210();
}

uint64_t sub_2550A734C(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2550A735C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2550A7398(void (*a1)(void))
{
  a1();

  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_2550A73D0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2550A73F8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_2550A74D4;
  return v6(a1);
}

uint64_t sub_2550A74D4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unsigned char **sub_2550A75CC(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void sub_2550A75DC(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  sub_2550D9E90();
  *a1 = v7;
  uint64_t v8 = *a2;
  if (*a2)
  {
    *uint64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2550A76CC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
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

uint64_t sub_2550A7770(uint64_t a1)
{
  return sub_2550A3234(a1, v1);
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

unint64_t sub_2550A7790()
{
  unint64_t result = qword_269E847E0;
  if (!qword_269E847E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E847E0);
  }
  return result;
}

uint64_t sub_2550A77E4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2550A780C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_2550A7884(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_2550D9E90();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2550A7884(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2550A7958(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2550A9718((uint64_t)v12, *a3);
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
      sub_2550A9718((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2550A7958(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_2550D9EA0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2550A7B14(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_2550D9F90();
  if (!v8)
  {
    sub_2550D9FC0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2550DA020();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_2550A7B14(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2550B5568(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2550A7BAC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2550A7BAC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2550A7BAC(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C40);
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
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2550DA020();
  __break(1u);
  return result;
}

void *sub_2550A7CFC(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v5 = a2 - (void)__src;
  }
  else {
    uint64_t v5 = 0;
  }
  if (!__dst)
  {
    if (v5 <= 0) {
      return __src;
    }
LABEL_12:
    __src = (void *)sub_2550DA020();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v5) {
    goto LABEL_12;
  }
  if (__src)
  {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_2550A7DA0@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_2550A7DD4()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v0 + 48);
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = sub_2550A9A6C;
  *(_OWORD *)(v4 + 40) = v5;
  *(void *)(v4 + 24) = v2;
  *(void *)(v4 + 32) = v3;
  return MEMORY[0x270FA2498](sub_2550A44F8, 0, 0);
}

uint64_t type metadata accessor for TrialLoader()
{
  uint64_t result = qword_26B278C78;
  if (!qword_26B278C78) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2550A7EDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2550A7F44()
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v0 = self;
  id v1 = objc_msgSend(v0, sel_defaultManager);
  sub_2550D97A0();
  uint64_t v2 = (void *)sub_2550D9AA0();
  swift_bridgeObjectRelease();
  unsigned int v3 = objc_msgSend(v1, sel_fileExistsAtPath_, v2);

  if (v3)
  {
    id v4 = objc_msgSend(v0, sel_defaultManager);
    long long v5 = (void *)sub_2550D9740();
    id v20 = 0;
    unsigned int v6 = objc_msgSend(v4, sel_removeItemAtURL_error_, v5, &v20);

    id v7 = v20;
    if (!v6) {
      goto LABEL_6;
    }
    id v8 = v20;
  }
  id v9 = objc_msgSend(v0, sel_defaultManager);
  uint64_t v10 = (void *)sub_2550D9740();
  size_t v11 = (void *)sub_2550D9740();
  id v20 = 0;
  unsigned int v12 = objc_msgSend(v9, sel_copyItemAtURL_toURL_error_, v10, v11, &v20);

  id v7 = v20;
  if (v12)
  {
    id v13 = v20;
    return 1;
  }
LABEL_6:
  id v15 = v7;
  uint64_t v16 = (void *)sub_2550D96B0();

  swift_willThrow();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E84820);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_2550DAB00;
  id v20 = 0;
  unint64_t v21 = 0xE000000000000000;
  sub_2550D9F60();
  sub_2550D9BA0();
  sub_2550D97D0();
  sub_2550A8FF0();
  sub_2550DA130();
  sub_2550D9BA0();
  swift_bridgeObjectRelease();
  sub_2550D9BA0();
  sub_2550DA130();
  sub_2550D9BA0();
  swift_bridgeObjectRelease();
  sub_2550D9BA0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E84800);
  sub_2550D9FB0();
  id v18 = v20;
  unint64_t v19 = v21;
  *(void *)(v17 + 56) = MEMORY[0x263F8D310];
  *(void *)(v17 + 32) = v18;
  *(void *)(v17 + 40) = v19;
  sub_2550DA1D0();

  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_2550A825C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B2799C0);
    uint64_t v3 = sub_2550D9F40();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      unsigned int v6 = *(void **)(v32 + 8 * v4);
      sub_2550D9AD0();
      sub_2550DA1F0();
      id v7 = v6;
      sub_2550D9B50();
      uint64_t v8 = sub_2550DA210();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = sub_2550D9AD0();
        uint64_t v17 = v16;
        if (v15 == sub_2550D9AD0() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = sub_2550DA140();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_4;
        }
        uint64_t v21 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v21;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v22 = sub_2550D9AD0();
          uint64_t v24 = v23;
          if (v22 == sub_2550D9AD0() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = sub_2550DA140();
          swift_bridgeObjectRelease();
          uint64_t result = swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v7;
      uint64_t v28 = *(void *)(v3 + 16);
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

id sub_2550A848C(uint64_t a1, uint64_t a2)
{
  v13[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = (void *)sub_2550D9740();
  v13[0] = 0;
  id v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelWithContentsOfURL_configuration_error_, v4, a2, v13);

  id v6 = v13[0];
  if (v5)
  {
    uint64_t v7 = sub_2550D97D0();
    uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
    id v9 = v6;
    v8(a1, v7);
  }
  else
  {
    id v10 = v13[0];
    sub_2550D96B0();

    swift_willThrow();
    uint64_t v11 = sub_2550D97D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

void _s20MCCKitCategorization11TrialLoaderC16cleanCachedModel9modelNameySS_tFZ_0(uint64_t a1, uint64_t a2)
{
  v92[2] = *(id *)MEMORY[0x263EF8340];
  uint64_t v4 = sub_2550D97D0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x270FA5388](v6);
  v77 = (char *)&v68 - v10;
  MEMORY[0x270FA5388](v9);
  unint64_t v12 = (char *)&v68 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C58);
  uint64_t v14 = MEMORY[0x270FA5388](v13 - 8);
  uint64_t v78 = (char *)&v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v68 - v17;
  MEMORY[0x270FA5388](v16);
  char v20 = (char *)&v68 - v19;
  id v21 = objc_msgSend(self, sel_defaultManager);
  type metadata accessor for TrialLoader();
  sub_2550A4948(v20);
  sub_2550A7EDC((uint64_t)v20, (uint64_t)v18);
  id v86 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  uint64_t v87 = v5 + 48;
  if (v86(v18, 1, v4) == 1)
  {
    sub_2550A9778((uint64_t)v20, &qword_26B278C58);

    uint64_t v22 = (uint64_t)v18;
LABEL_27:
    sub_2550A9778(v22, &qword_26B278C58);
    return;
  }
  uint64_t v76 = v20;
  v83 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  uint64_t v84 = v5 + 32;
  v83(v12, v18, v4);
  uint64_t v23 = (void *)sub_2550D9740();
  v92[0] = 0;
  id v24 = objc_msgSend(v21, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v23, 0, 0, v92);

  id v25 = v92[0];
  if (v24)
  {
    uint64_t v71 = v12;
    uint64_t v26 = sub_2550D9CA0();
    id v27 = v25;

    v92[0] = (id)95;
    v92[1] = (id)0xE100000000000000;
    uint64_t v90 = a1;
    uint64_t v91 = a2;
    swift_bridgeObjectRetain();
    uint64_t v90 = sub_2550D9C60();
    uint64_t v91 = v28;
    sub_2550D9B90();
    uint64_t v85 = v91;
    uint64_t v30 = *(void *)(v26 + 16);
    uint64_t v69 = v5;
    uint64_t v70 = v26;
    if (v30)
    {
      v88 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      uint64_t v89 = v5 + 16;
      unint64_t v31 = v26 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
      uint64_t v79 = *(void *)(v5 + 72);
      uint64_t v80 = v90;
      v81 = (void (**)(char *, uint64_t))(v5 + 8);
      uint64_t v82 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
      unint64_t v68 = (v5 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      *(void *)&long long v29 = 136315138;
      long long v74 = v29;
      uint64_t v73 = MEMORY[0x263F8EE58] + 8;
      uint64_t v32 = v8;
      uint64_t v34 = v77;
      uint64_t v33 = v78;
      id v75 = v21;
      uint64_t v72 = v32;
      v88(v78, v31, v4);
      while (1)
      {
        uint64_t v35 = *v82;
        (*v82)(v33, 0, 1, v4);
        if (v86(v33, 1, v4) == 1) {
          break;
        }
        v83(v34, v33, v4);
        sub_2550D9730();
        char v36 = sub_2550D9C30();
        swift_bridgeObjectRelease();
        if (v36)
        {
          os_log_type_t v37 = (void *)sub_2550D9740();
          v92[0] = 0;
          unsigned int v38 = objc_msgSend(v21, sel_removeItemAtURL_error_, v37, v92);

          if (!v38)
          {
            id v66 = v92[0];
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v56 = (void *)sub_2550D96B0();

            swift_willThrow();
            v67 = *v81;
            (*v81)(v34, v4);
            v67(v71, v4);
            goto LABEL_19;
          }
          uint64_t v39 = qword_26B278B80;
          id v40 = v92[0];
          if (v39 != -1) {
            swift_once();
          }
          uint64_t v41 = sub_2550D9A00();
          __swift_project_value_buffer(v41, (uint64_t)qword_26B279BA0);
          v88(v32, (unint64_t)v34, v4);
          uint64_t v42 = sub_2550D99E0();
          unint64_t v43 = v32;
          os_log_type_t v44 = sub_2550D9DC0();
          if (os_log_type_enabled(v42, v44))
          {
            uint64_t v45 = swift_slowAlloc();
            char v46 = (void *)swift_slowAlloc();
            v92[0] = v46;
            *(_DWORD *)uint64_t v45 = v74;
            uint64_t v47 = sub_2550D97A0();
            *(void *)(v45 + 4) = sub_2550A7884(v47, v48, (uint64_t *)v92);
            swift_bridgeObjectRelease();
            os_log_type_t v49 = v43;
            uint64_t v50 = v4;
            uint64_t v51 = *v81;
            (*v81)(v49, v50);
            _os_log_impl(&dword_25509D000, v42, v44, "Cleaned old model from cache : %s", (uint8_t *)v45, 0xCu);
            swift_arrayDestroy();
            id v52 = v46;
            id v21 = v75;
            MEMORY[0x25A2881E0](v52, -1, -1);
            uint64_t v53 = v45;
            uint64_t v34 = v77;
            MEMORY[0x25A2881E0](v53, -1, -1);

            v51(v34, v50);
            uint64_t v4 = v50;
            uint64_t v32 = v72;
          }
          else
          {

            unint64_t v54 = *v81;
            (*v81)(v43, v4);
            v54(v34, v4);
            uint64_t v32 = v43;
          }
          uint64_t v33 = v78;
        }
        else
        {
          (*v81)(v34, v4);
        }
        v31 += v79;
        if (!--v30)
        {
          v35(v33, 1, 1, v4);
          break;
        }
        v88(v33, v31, v4);
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v78, 1, 1, v4);
    }
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v71, v4);
    uint64_t v22 = (uint64_t)v76;
    goto LABEL_27;
  }
  id v55 = v92[0];
  uint64_t v56 = (void *)sub_2550D96B0();

  swift_willThrow();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
LABEL_19:
  sub_2550A9778((uint64_t)v76, &qword_26B278C58);
  if (qword_26B278B80 != -1) {
    swift_once();
  }
  uint64_t v57 = sub_2550D9A00();
  __swift_project_value_buffer(v57, (uint64_t)qword_26B279BA0);
  id v58 = v56;
  id v59 = v56;
  os_log_t v60 = sub_2550D99E0();
  os_log_type_t v61 = sub_2550D9DE0();
  if (os_log_type_enabled(v60, v61))
  {
    uint64_t v62 = (uint8_t *)swift_slowAlloc();
    uint64_t v63 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v62 = 138412290;
    id v64 = v56;
    os_log_type_t v65 = (void *)_swift_stdlib_bridgeErrorToNSError();
    v92[0] = v65;
    sub_2550D9E90();
    void *v63 = v65;

    _os_log_impl(&dword_25509D000, v60, v61, "Failed old model cache cleanup : %@", v62, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E847D8);
    swift_arrayDestroy();
    MEMORY[0x25A2881E0](v63, -1, -1);
    MEMORY[0x25A2881E0](v62, -1, -1);
  }
  else
  {
  }
}

unint64_t sub_2550A8F5C()
{
  unint64_t result = qword_26B2799B0;
  if (!qword_26B2799B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_26B2799B0);
  }
  return result;
}

unint64_t sub_2550A8F9C()
{
  unint64_t result = qword_26B279990;
  if (!qword_26B279990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B279990);
  }
  return result;
}

unint64_t sub_2550A8FF0()
{
  unint64_t result = qword_269E84808;
  if (!qword_269E84808)
  {
    sub_2550D97D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84808);
  }
  return result;
}

unint64_t sub_2550A904C()
{
  unint64_t result = qword_269E84810;
  if (!qword_269E84810)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84810);
  }
  return result;
}

uint64_t sub_2550A90A4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *a1 + OBJC_IVAR____TtC20MCCKitCategorization11TrialLoader_blackPearlLevels;
  swift_beginAccess();
  return sub_2550A2780(v3, a2);
}

uint64_t sub_2550A9100()
{
  return type metadata accessor for TrialLoader();
}

uint64_t sub_2550A9108()
{
  uint64_t result = type metadata accessor for BlackPearlLevels();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for TrialLoader(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TrialLoader);
}

uint64_t dispatch thunk of TrialLoader.blackPearlLevels.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t dispatch thunk of TrialLoader.blackPearlLevels.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 112))();
}

uint64_t dispatch thunk of TrialLoader.blackPearlLevels.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of TrialLoader.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of TrialLoader.subscribe()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of TrialLoader.needImmediateDownloadCheck()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of TrialLoader.runImmediateDownload(retries:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))() & 1;
}

uint64_t dispatch thunk of TrialLoader.runImmediateDownloadAsync(retries:completion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of TrialLoader.getBlackPearlLevels()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TrialLoader.Error(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TrialLoader.Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x2550A9480);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_2550A94A8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2550A94B4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TrialLoader.Error()
{
  return &type metadata for TrialLoader.Error;
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return MEMORY[0x270FA0238](v0, 64, 7);
}

uint64_t sub_2550A9518()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v0 + 48);
  *(void *)(v1 + 16) = v4;
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = sub_2550A95D4;
  *(_OWORD *)(v4 + 40) = v5;
  *(void *)(v4 + 24) = v2;
  *(void *)(v4 + 32) = v3;
  return MEMORY[0x270FA2498](sub_2550A44F8, 0, 0);
}

uint64_t sub_2550A95D4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
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

uint64_t sub_2550A9718(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2550A9778(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2550A97D4()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2550A980C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  long long v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *long long v5 = v2;
  v5[1] = sub_2550A95D4;
  unsigned int v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_269E84828 + dword_269E84828);
  return v6(a1, v4);
}

uint64_t sub_2550A98C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B2799B8);
    uint64_t v3 = sub_2550D9F40();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      unsigned int v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      sub_2550DA1F0();
      swift_bridgeObjectRetain();
      sub_2550D9B50();
      uint64_t result = sub_2550DA210();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (uint64_t result = sub_2550DA140(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            uint64_t result = sub_2550DA140();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      id v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *id v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

BOOL static TrialDeploymentType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t TrialDeploymentType.hash(into:)()
{
  return sub_2550DA200();
}

uint64_t TrialDeploymentType.hashValue.getter()
{
  return sub_2550DA210();
}

unint64_t sub_2550A9AFC()
{
  unint64_t result = qword_269E84838;
  if (!qword_269E84838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84838);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for TrialDeploymentType(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2550A9C1CLL);
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

ValueMetadata *type metadata accessor for TrialDeploymentType()
{
  return &type metadata for TrialDeploymentType;
}

uint64_t TokenMapDataFrame.__allocating_init(withFileAtPath:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  TokenMapDataFrame.init(withFileAtPath:)(a1);
  return v2;
}

uint64_t TokenMapDataFrame.init(withFileAtPath:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2550D9B00();
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v62 = (char *)v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2550D9A20();
  unint64_t v60 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2550D9A50();
  uint64_t v58 = *(void *)(v9 - 8);
  id v59 = (void (*)(uint64_t, uint64_t))v9;
  MEMORY[0x270FA5388](v9);
  unint64_t v11 = (char *)v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2550D97D0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  id v55 = (char *)v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  BOOL v17 = (char *)v54 - v16;
  uint64_t v56 = v2;
  uint64_t v57 = a1;
  *(void *)(v2 + 16) = MEMORY[0x263F8EE80];
  uint64_t v18 = (char **)(v2 + 16);
  uint64_t v63 = v19;
  uint64_t v64 = v13;
  v54[0] = *(void *)(v13 + 16);
  v54[1] = v13 + 16;
  ((void (*)(char *, uint64_t))v54[0])((char *)v54 - v16, a1);
  id v20 = objc_msgSend(self, sel_defaultManager);
  sub_2550D9790();
  id v21 = (void *)sub_2550D9AA0();
  swift_bridgeObjectRelease();
  unsigned int v22 = objc_msgSend(v20, sel_fileExistsAtPath_, v21);

  if (!v22)
  {
LABEL_20:
    (*(void (**)(char *, uint64_t))(v64 + 8))(v17, v63);
    ((void (*)(char *, uint64_t, uint64_t))v54[0])(v55, v57, v63);
    uint64_t v66 = 0;
    unint64_t v67 = 0xE000000000000000;
    sub_2550D9F60();
    swift_bridgeObjectRelease();
    uint64_t v66 = 0xD000000000000023;
    unint64_t v67 = 0x80000002550DCBF0;
    sub_2550A8FF0();
    sub_2550DA130();
    sub_2550D9BA0();
    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  uint64_t v61 = v6;
  uint64_t v23 = sub_2550D97E0();
  unint64_t v25 = v24;
  sub_2550AA394(v23, v24);
  sub_2550D9A40();
  uint64_t v66 = sub_2550BB004();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E84840);
  sub_2550AC560();
  sub_2550D9A10();
  uint64_t v26 = sub_2550D9A30();
  unint64_t v28 = v27;
  (*(void (**)(char *, uint64_t))(v60 + 8))(v8, v61);
  (*(void (**)(char *, void))(v58 + 8))(v11, v59);
  long long v29 = *(void (**)(uint64_t, uint64_t))(v64 + 8);
  v64 += 8;
  id v59 = v29;
  v29((uint64_t)v17, v63);
  sub_2550AC604(v23, v25);
  sub_2550D9AF0();
  unint64_t v60 = v28;
  uint64_t v61 = v26;
  unint64_t v30 = sub_2550D9AE0();
  if (v31)
  {
    uint64_t v32 = sub_2550AA3EC(0x7FFFFFFFFFFFFFFFLL, 1, v30, v31);
    uint64_t v33 = sub_2550AA8C0(v32);
    swift_bridgeObjectRelease();
    uint64_t v62 = (char *)v33;
    uint64_t v34 = *(void *)(v33 + 16);
    if (!v34)
    {
LABEL_16:
      sub_2550AC604(v61, v60);
      v59(v57, v63);
      swift_bridgeObjectRelease();
      return v56;
    }
    uint64_t v35 = 0;
    char v36 = (uint64_t *)(v62 + 40);
    while (1)
    {
      uint64_t v38 = *(v36 - 1);
      uint64_t v37 = *v36;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      os_log_type_t v65 = *v18;
      BOOL v17 = v65;
      *uint64_t v18 = (char *)0x8000000000000000;
      unint64_t v41 = sub_2550AAB38(v38, v37);
      uint64_t v42 = *((void *)v17 + 2);
      BOOL v43 = (v40 & 1) == 0;
      uint64_t v44 = v42 + v43;
      if (__OFADD__(v42, v43)) {
        break;
      }
      char v45 = v40;
      if (*((void *)v17 + 3) >= v44)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          BOOL v17 = (char *)&v65;
          sub_2550ABD04();
        }
      }
      else
      {
        sub_2550AAC64(v44, isUniquelyReferenced_nonNull_native);
        BOOL v17 = v65;
        unint64_t v46 = sub_2550AAB38(v38, v37);
        if ((v45 & 1) != (v47 & 1)) {
          goto LABEL_19;
        }
        unint64_t v41 = v46;
      }
      ++v35;
      unint64_t v48 = v65;
      if (v45)
      {
        *(void *)(*((void *)v65 + 7) + 8 * v41) = v35;
      }
      else
      {
        *(void *)&v65[8 * (v41 >> 6) + 64] |= 1 << v41;
        os_log_type_t v49 = (uint64_t *)(*((void *)v48 + 6) + 16 * v41);
        *os_log_type_t v49 = v38;
        v49[1] = v37;
        *(void *)(*((void *)v48 + 7) + 8 * v41) = v35;
        uint64_t v50 = *((void *)v48 + 2);
        BOOL v51 = __OFADD__(v50, 1);
        uint64_t v52 = v50 + 1;
        if (v51) {
          goto LABEL_18;
        }
        *((void *)v48 + 2) = v52;
        swift_bridgeObjectRetain();
      }
      v36 += 2;
      *uint64_t v18 = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      if (v34 == v35) {
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    sub_2550DA180();
    __break(1u);
    goto LABEL_20;
  }
LABEL_21:
  uint64_t result = sub_2550D9FD0();
  __break(1u);
  return result;
}

uint64_t sub_2550AA394(uint64_t a1, unint64_t a2)
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

uint64_t sub_2550AA3EC(uint64_t a1, char a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
LABEL_50:
    uint64_t result = sub_2550D9FC0();
    __break(1u);
  }
  else
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = MEMORY[0x263F8EE78];
    uint64_t v9 = swift_allocObject();
    uint64_t v10 = v9;
    *(void *)(v9 + 16) = 15;
    uint64_t v11 = HIBYTE(a4) & 0xF;
    if (a1)
    {
      uint64_t v12 = (a4 & 0x2000000000000000) != 0 ? HIBYTE(a4) & 0xF : a3 & 0xFFFFFFFFFFFFLL;
      if (v12)
      {
        uint64_t v41 = a1;
        unint64_t v45 = 4 * v12;
        uint64_t v13 = (void *)MEMORY[0x263F8EE78];
        unint64_t v14 = 15;
        unint64_t v15 = 15;
        uint64_t v42 = (void *)a3;
        uint64_t v43 = v9;
        while (1)
        {
          uint64_t v16 = sub_2550D9C50();
          unint64_t v18 = v17;
          if (!((v17 & 0x2000000000000000) != 0 ? HIBYTE(v17) & 0xF : v16 & 0xFFFFFFFFFFFFLL)) {
            break;
          }
          if ((v17 & 0x1000000000000000) != 0)
          {
            uint64_t v20 = sub_2550D9F50();
          }
          else
          {
            if ((v17 & 0x2000000000000000) == 0 && (v16 & 0x1000000000000000) == 0) {
              sub_2550D9F90();
            }
            uint64_t v20 = sub_2550D9FA0();
          }
          uint64_t v4 = v20;
          swift_bridgeObjectRelease();
          if ((v4 - 14) > 0xFFFFFFFB || (v4 - 8232) < 2 || v4 == 133)
          {
            if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
            {
              unint64_t v14 = sub_2550D9B70();
              *(void *)(v10 + 16) = v14;
              unint64_t v15 = v14;
            }
            else
            {
              if (v14 >> 14 < v15 >> 14) {
                goto LABEL_49;
              }
              unint64_t v21 = a4;
              uint64_t v22 = sub_2550D9C70();
              uint64_t v24 = v23;
              uint64_t v26 = v25;
              uint64_t v4 = v27;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v13 = sub_2550B4F08(0, v13[2] + 1, 1, v13);
              }
              unint64_t v28 = v13;
              unint64_t v29 = v13[2];
              unint64_t v30 = v28;
              unint64_t v31 = v28[3];
              if (v29 >= v31 >> 1) {
                unint64_t v30 = sub_2550B4F08((void *)(v31 > 1), v29 + 1, 1, v30);
              }
              v30[2] = v29 + 1;
              uint64_t v32 = &v30[4 * v29];
              uint64_t v13 = v30;
              v32[4] = v22;
              v32[5] = v24;
              v32[6] = v26;
              v32[7] = v4;
              *(void *)(v8 + 16) = v30;
              a4 = v21;
              a3 = (unint64_t)v42;
              unint64_t v15 = sub_2550D9B70();
              uint64_t v10 = v43;
              *(void *)(v43 + 16) = v15;
              unint64_t v14 = v15;
              if (v13[2] == v41)
              {
LABEL_38:
                if (v45 == v15 >> 14 && (a2 & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  goto LABEL_46;
                }
                if (v45 < v15 >> 14)
                {
LABEL_49:
                  sub_2550D9FC0();
                  __break(1u);
                  goto LABEL_50;
                }
                a3 = (unint64_t)v13;
                unint64_t v15 = sub_2550D9C70();
                unint64_t v18 = v34;
                uint64_t v13 = v35;
                uint64_t v4 = v36;
                swift_bridgeObjectRelease();
                if (swift_isUniquelyReferenced_nonNull_native())
                {
LABEL_43:
                  unint64_t v38 = *(void *)(a3 + 16);
                  unint64_t v37 = *(void *)(a3 + 24);
                  if (v38 >= v37 >> 1) {
                    a3 = (unint64_t)sub_2550B4F08((void *)(v37 > 1), v38 + 1, 1, (void *)a3);
                  }
                  *(void *)(a3 + 16) = v38 + 1;
                  uint64_t v39 = (void *)(a3 + 32 * v38);
                  v39[4] = v15;
                  v39[5] = v18;
                  v39[6] = v13;
                  v39[7] = v4;
                  uint64_t v13 = (void *)a3;
                  *(void *)(v8 + 16) = a3;
                  goto LABEL_46;
                }
LABEL_48:
                a3 = (unint64_t)sub_2550B4F08(0, *(void *)(a3 + 16) + 1, 1, (void *)a3);
                goto LABEL_43;
              }
            }
          }
          else
          {
            unint64_t v14 = sub_2550D9B70();
          }
          if (v45 == v14 >> 14) {
            goto LABEL_38;
          }
        }
        __break(1u);
        goto LABEL_48;
      }
    }
    if ((a4 & 0x2000000000000000) == 0) {
      uint64_t v11 = a3 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v33 = 7;
    if (((a4 >> 60) & ((a3 & 0x800000000000000) == 0)) != 0) {
      uint64_t v33 = 11;
    }
    sub_2550CD168(v33 | (v11 << 16), v9, a2 & 1, v8);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void **)(v8 + 16);
LABEL_46:
    swift_bridgeObjectRetain();
    swift_release();
    swift_release();
    return (uint64_t)v13;
  }
  return result;
}

uint64_t sub_2550AA8C0(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v16 = MEMORY[0x263F8EE78];
    sub_2550C47AC(0, v1, 0);
    uint64_t v2 = v16;
    uint64_t v4 = (uint64_t *)(a1 + 56);
    do
    {
      uint64_t v5 = *(v4 - 3);
      uint64_t v6 = *(v4 - 2);
      uint64_t v7 = *(v4 - 1);
      uint64_t v8 = *v4;
      swift_bridgeObjectRetain();
      uint64_t v9 = MEMORY[0x25A287550](v5, v6, v7, v8);
      uint64_t v11 = v10;
      swift_bridgeObjectRelease();
      unint64_t v13 = *(void *)(v16 + 16);
      unint64_t v12 = *(void *)(v16 + 24);
      if (v13 >= v12 >> 1) {
        sub_2550C47AC(v12 > 1, v13 + 1, 1);
      }
      *(void *)(v16 + 16) = v13 + 1;
      uint64_t v14 = v16 + 16 * v13;
      *(void *)(v14 + 32) = v9;
      *(void *)(v14 + 40) = v11;
      v4 += 4;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_2550AA9C0(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(void *)(v2 + 16);
  if (!*(void *)(v5 + 16)) {
    return 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_2550AAB38(a1, a2);
  if (v7) {
    uint64_t v8 = *(void *)(*(void *)(v5 + 56) + 8 * v6);
  }
  else {
    uint64_t v8 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t TokenMapDataFrame.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TokenMapDataFrame.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_2550AAAC4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for TokenMapDataFrame();
  uint64_t v4 = swift_allocObject();
  uint64_t result = TokenMapDataFrame.init(withFileAtPath:)(a1);
  *a2 = v4;
  return result;
}

uint64_t sub_2550AAB10(uint64_t a1, uint64_t a2)
{
  return sub_2550AA9C0(a1, a2);
}

unint64_t sub_2550AAB38(uint64_t a1, uint64_t a2)
{
  sub_2550DA1F0();
  sub_2550D9B50();
  uint64_t v4 = sub_2550DA210();

  return sub_2550ABAE4(a1, a2, v4);
}

unint64_t sub_2550AABB0(unsigned __int8 a1)
{
  sub_2550DA1F0();
  sub_2550DA200();
  uint64_t v2 = sub_2550DA210();

  return sub_2550ABBC8(a1, v2);
}

unint64_t sub_2550AAC20(uint64_t a1)
{
  uint64_t v2 = sub_2550DA1E0();

  return sub_2550ABC68(a1, v2);
}

uint64_t sub_2550AAC64(uint64_t a1, char a2)
{
  int v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2799C8);
  char v37 = a2;
  uint64_t v6 = sub_2550DA000();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  unint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          int v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_2550DA1F0();
    sub_2550D9B50();
    uint64_t result = sub_2550DA210();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  int v3 = v34;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *int v3 = v7;
  return result;
}

uint64_t sub_2550AAF70(uint64_t a1, char a2)
{
  int v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E84850);
  char v35 = a2;
  uint64_t result = sub_2550DA000();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    unint64_t v34 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v9 + 63) >> 6;
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
        if (v20 >= v33) {
          goto LABEL_33;
        }
        unint64_t v21 = v34[v20];
        ++v8;
        if (!v21)
        {
          int64_t v8 = v20 + 1;
          if (v20 + 1 >= v33) {
            goto LABEL_33;
          }
          unint64_t v21 = v34[v8];
          if (!v21)
          {
            int64_t v22 = v20 + 2;
            if (v22 >= v33)
            {
LABEL_33:
              if ((v35 & 1) == 0)
              {
                uint64_t result = swift_release();
                int v3 = v2;
                goto LABEL_40;
              }
              uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
              if (v32 >= 64) {
                bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                *unint64_t v34 = -1 << v32;
              }
              int v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v21 = v34[v22];
            if (!v21)
            {
              while (1)
              {
                int64_t v8 = v22 + 1;
                if (__OFADD__(v22, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v33) {
                  goto LABEL_33;
                }
                unint64_t v21 = v34[v8];
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
      char v27 = *(unsigned char *)(*(void *)(v5 + 48) + v19);
      uint64_t v28 = *(void *)(v5 + 56) + 40 * v19;
      uint64_t v29 = *(void *)v28;
      long long v36 = *(_OWORD *)(v28 + 8);
      char v30 = *(unsigned char *)(v28 + 24);
      uint64_t v31 = *(void *)(v28 + 32);
      if ((v35 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      sub_2550DA1F0();
      sub_2550DA200();
      uint64_t result = sub_2550DA210();
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
      *(unsigned char *)(*(void *)(v7 + 48) + v16) = v27;
      uint64_t v17 = *(void *)(v7 + 56) + 40 * v16;
      *(void *)uint64_t v17 = v29;
      *(_OWORD *)(v17 + 8) = v36;
      *(unsigned char *)(v17 + 24) = v30;
      *(void *)(v17 + 32) = v31;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *int v3 = v7;
  return result;
}

uint64_t sub_2550AB280(uint64_t a1, char a2)
{
  int v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278BE0);
  uint64_t result = sub_2550DA000();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v35 = a2;
    unint64_t v34 = v3;
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v32 = -1 << v10;
    uint64_t v33 = v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v18 = v17 | (v8 << 6);
      }
      else
      {
        int64_t v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v19 >= v13) {
          goto LABEL_31;
        }
        unint64_t v20 = v9[v19];
        ++v8;
        if (!v20)
        {
          int64_t v8 = v19 + 1;
          if (v19 + 1 >= v13) {
            goto LABEL_31;
          }
          unint64_t v20 = v9[v8];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v13)
            {
LABEL_31:
              if ((v35 & 1) == 0)
              {
                uint64_t result = swift_release();
                int v3 = v34;
                goto LABEL_38;
              }
              if (v33 >= 64) {
                bzero((void *)(v5 + 64), 8 * v13);
              }
              else {
                *uint64_t v9 = v32;
              }
              int v3 = v34;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v20 = v9[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v8 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_40;
                }
                if (v8 >= v13) {
                  goto LABEL_31;
                }
                unint64_t v20 = v9[v8];
                ++v21;
                if (v20) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v8 = v21;
          }
        }
LABEL_21:
        unint64_t v12 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      uint64_t v22 = 8 * v18;
      uint64_t v23 = *(void *)(*(void *)(v5 + 48) + v22);
      uint64_t v24 = *(void *)(*(void *)(v5 + 56) + v22);
      uint64_t result = sub_2550DA1E0();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v14 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t v16 = 8 * v15;
      *(void *)(*(void *)(v7 + 48) + v16) = v23;
      *(void *)(*(void *)(v7 + 56) + v16) = v24;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_38:
  *int v3 = v7;
  return result;
}

uint64_t sub_2550AB528(uint64_t a1, char a2)
{
  int v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278BF8);
  uint64_t result = sub_2550DA000();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    uint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v32 = -1 << v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v34 = v3;
    int64_t v35 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v21 >= v35) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v35)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                int v3 = v34;
                goto LABEL_40;
              }
              if (v33 >= 64) {
                bzero((void *)(v5 + 64), 8 * v35);
              }
              else {
                *uint64_t v9 = v32;
              }
              int v3 = v34;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      BOOL v30 = *(void **)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        id v31 = v30;
      }
      uint64_t result = sub_2550DA1E0();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *int v3 = v7;
  return result;
}

uint64_t sub_2550AB7DC(uint64_t a1, char a2)
{
  int v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278BE8);
  char v37 = a2;
  uint64_t v6 = sub_2550DA000();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  int64_t v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    int64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          int v3 = v35;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    BOOL v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    uint64_t v33 = *(void *)(*(void *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_2550DA1F0();
    sub_2550D9B50();
    uint64_t result = sub_2550DA210();
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    unint64_t v19 = (void *)(*(void *)(v7 + 48) + 16 * v18);
    *unint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v7 + 56) + 8 * v18) = v33;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  int v3 = v35;
  int64_t v23 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *int v3 = v7;
  return result;
}

unint64_t sub_2550ABAE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_2550DA140() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_2550DA140() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2550ABBC8(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_2550ABC68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

void *sub_2550ABD04()
{
  int64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B2799C8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2550D9FF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *int64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    void *v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    unint64_t result = (void *)swift_bridgeObjectRetain();
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

void *sub_2550ABEB4()
{
  int64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E84850);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2550D9FF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *int64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(v2 + 56) + 40 * v15;
    uint64_t v17 = *(void *)v16;
    char v18 = *(unsigned char *)(v16 + 24);
    uint64_t v19 = *(void *)(v16 + 32);
    long long v20 = *(_OWORD *)(v16 + 8);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    uint64_t v21 = *(void *)(v4 + 56) + 40 * v15;
    *(void *)uint64_t v21 = v17;
    *(_OWORD *)(v21 + 8) = v20;
    *(unsigned char *)(v21 + 24) = v18;
    *(void *)(v21 + 32) = v19;
    unint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2550AC07C()
{
  int64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278BE0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2550D9FF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release();
    *int64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v21 = __clz(__rbit64(v19));
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = v21 + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2550AC20C()
{
  int64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278BF8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2550D9FF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *int64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2550AC3B0()
{
  int64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278BE8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_2550D9FF0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *int64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_2550AC560()
{
  unint64_t result = qword_269E84848;
  if (!qword_269E84848)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269E84840);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84848);
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

uint64_t sub_2550AC604(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for TokenMapDataFrame()
{
  return self;
}

uint64_t method lookup function for TokenMapDataFrame(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TokenMapDataFrame);
}

uint64_t dispatch thunk of TokenMapDataFrame.__allocating_init(withFileAtPath:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of TokenMapDataFrame.lookup(domain:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t sub_2550AC6F0()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2550AC728()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

void *sub_2550AC738()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C58);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[3] = 0xD000000000000016;
  v0[4] = 0x80000002550DC560;
  v0[5] = 0xD00000000000001CLL;
  v0[6] = 0x80000002550DC580;
  v0[7] = 0xD000000000000018;
  v0[8] = 0x80000002550DC5A0;
  v0[9] = 0xD00000000000001ALL;
  v0[10] = 0x80000002550DC600;
  v0[11] = 0xD00000000000001DLL;
  v0[12] = 0x80000002550DC620;
  v0[13] = 0xD000000000000016;
  v0[14] = 0x80000002550DCF30;
  v0[15] = 0xD00000000000001FLL;
  v0[16] = 0x80000002550DCF50;
  v0[17] = 0xD000000000000020;
  v0[18] = 0x80000002550DCF70;
  v0[19] = 0xD00000000000001DLL;
  v0[20] = 0x80000002550DCFA0;
  v0[21] = 0xD00000000000001DLL;
  v0[22] = 0x80000002550DCFC0;
  v0[23] = 0xD000000000000013;
  v0[24] = 0x80000002550DCFE0;
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08850]), sel_init);
  uint64_t v5 = (void *)sub_2550D9AA0();
  id v6 = objc_msgSend(v4, sel_containerURLForSecurityApplicationGroupIdentifier_, v5);

  if (v6)
  {
    sub_2550D9780();

    uint64_t v7 = sub_2550D97D0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v3, 0, 1, v7);
  }
  else
  {
    uint64_t v8 = sub_2550D97D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 1, 1, v8);
  }
  sub_2550A9778((uint64_t)v3, &qword_26B278C58);
  id v9 = objc_allocWithZone(MEMORY[0x263EFFA40]);
  uint64_t v10 = (void *)sub_2550D9AA0();
  id v11 = objc_msgSend(v9, sel_initWithSuiteName_, v10);

  v0[2] = v11;
  return v0;
}

void sub_2550AC9F8(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (v2)
  {
    uint64_t v26 = a1[11];
    uint64_t v27 = a1[13];
    uint64_t v28 = a1[14];
    uint64_t v29 = a1[15];
    uint64_t v30 = a1[17];
    uint64_t v31 = a1[19];
    id v3 = v2;
    id v4 = (void *)sub_2550D9AA0();
    uint64_t v5 = (void *)sub_2550D9AA0();
    objc_msgSend(v3, sel_setObject_forKey_, v4, v5);

    id v6 = (void *)sub_2550D9AA0();
    uint64_t v7 = (void *)sub_2550D9AA0();
    objc_msgSend(v3, sel_setObject_forKey_, v6, v7);

    uint64_t v8 = (void *)sub_2550D9AA0();
    id v9 = (void *)sub_2550D9AA0();
    objc_msgSend(v3, sel_setObject_forKey_, v8, v9);

    uint64_t v10 = (void *)sub_2550D9AA0();
    id v11 = (void *)sub_2550D9AA0();
    objc_msgSend(v3, sel_setObject_forKey_, v10, v11);

    unint64_t v12 = (void *)sub_2550D9AA0();
    uint64_t v13 = (void *)sub_2550D9AA0();
    objc_msgSend(v3, sel_setObject_forKey_, v12, v13);

    if (v26) {
      uint64_t v14 = sub_2550D9AA0();
    }
    else {
      uint64_t v14 = 0;
    }
    uint64_t v18 = (void *)sub_2550D9AA0();
    objc_msgSend(v3, sel_setObject_forKey_, v14, v18);
    swift_unknownObjectRelease();

    if (v27) {
      uint64_t v19 = sub_2550D9AA0();
    }
    else {
      uint64_t v19 = 0;
    }
    uint64_t v20 = (void *)sub_2550D9AA0();
    objc_msgSend(v3, sel_setObject_forKey_, v19, v20);
    swift_unknownObjectRelease();

    unint64_t v21 = (void *)sub_2550D9AA0();
    objc_msgSend(v3, sel_setInteger_forKey_, v28, v21);

    int64_t v22 = (void *)sub_2550D9AA0();
    objc_msgSend(v3, sel_setInteger_forKey_, v29, v22);

    if (v30) {
      uint64_t v23 = sub_2550D9AA0();
    }
    else {
      uint64_t v23 = 0;
    }
    int64_t v24 = (void *)sub_2550D9AA0();
    objc_msgSend(v3, sel_setObject_forKey_, v23, v24);
    swift_unknownObjectRelease();

    if (v31) {
      uint64_t v25 = sub_2550D9AA0();
    }
    else {
      uint64_t v25 = 0;
    }
    uint64_t v32 = sub_2550D9AA0();
    objc_msgSend(v3, sel_setObject_forKey_, v25);

    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_2550D9A00();
    __swift_project_value_buffer(v15, (uint64_t)qword_26B279BA0);
    uint64_t v32 = sub_2550D99E0();
    os_log_type_t v16 = sub_2550D9DE0();
    if (os_log_type_enabled(v32, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_25509D000, v32, v16, "Failed to load user defaults for suite group.com.apple.mail", v17, 2u);
      MEMORY[0x25A2881E0](v17, -1, -1);
    }
  }
}

void sub_2550ACDF8(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void **)(v3 + 16);
  if (v7)
  {
    uint64_t v8 = (void *)sub_2550D9AA0();
    id v9 = objc_msgSend(v7, sel_valueForKey_, v8);

    if (v9)
    {
      sub_2550D9F10();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v15, 0, sizeof(v15));
    }
    sub_2550AD11C((uint64_t)v15, (uint64_t)&v16);
    if (*((void *)&v17 + 1))
    {
      sub_2550AD184(&v16, v18);
      sub_2550AD184(v18, (_OWORD *)a3);
      return;
    }
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }
  sub_2550A9778((uint64_t)&v16, &qword_269E84858);
  if (qword_26B278B80 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_2550D9A00();
  __swift_project_value_buffer(v10, (uint64_t)qword_26B279BA0);
  swift_bridgeObjectRetain_n();
  id v11 = sub_2550D99E0();
  os_log_type_t v12 = sub_2550D9DE0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(void *)&v18[0] = v14;
    *(_DWORD *)uint64_t v13 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)&long long v16 = sub_2550A7884(a1, a2, (uint64_t *)v18);
    sub_2550D9E90();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25509D000, v11, v12, "Unable to find the value for key: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2881E0](v14, -1, -1);
    MEMORY[0x25A2881E0](v13, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(void *)(a3 + 24) = MEMORY[0x263F8D310];
  *(void *)a3 = 16718;
  *(void *)(a3 + 8) = 0xE200000000000000;
}

uint64_t BlackPearlSharedDefaults.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t BlackPearlSharedDefaults.__deallocating_deinit()
{
  BlackPearlSharedDefaults.deinit();

  return MEMORY[0x270FA0228](v0, 200, 7);
}

uint64_t sub_2550AD11C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E84858);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_2550AD184(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t type metadata accessor for BlackPearlSharedDefaults()
{
  return self;
}

uint64_t method lookup function for BlackPearlSharedDefaults(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BlackPearlSharedDefaults);
}

uint64_t dispatch thunk of BlackPearlSharedDefaults.setBlackPearlTrialState(blackpearlVersion:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of BlackPearlSharedDefaults.getValue(key:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

Swift::Void __swiftcall BlackPearlModel.destroy()()
{
  uint64_t v1 = *(int *)(type metadata accessor for BlackPearlModel(0) + 32);

  *(void *)(v0 + v1) = 0;
}

uint64_t type metadata accessor for BlackPearlModel(uint64_t a1)
{
  return sub_2550AF4F4(a1, qword_26B278D80);
}

uint64_t BlackPearlModel.init(name:version:compilePath:modelPath:model:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, void *a8@<X8>)
{
  long long v16 = (int *)type metadata accessor for BlackPearlModel(0);
  uint64_t v17 = v16[8];
  *a8 = a1;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  uint64_t v18 = (char *)a8 + v16[6];
  uint64_t v19 = sub_2550D97D0();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 32);
  v20(v18, a5, v19);
  uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v20)((char *)a8 + v16[7], a6, v19);
  *(void *)((char *)a8 + v17) = a7;
  return result;
}

void __swiftcall BlackPearlVersion.init(modelVersion:senderModelVersion:tsModelVersion:finalRuleVersion:breakthroughVersion:blackPearlExperimentId:blackPearlExperimentTreatmentId:blackPearlExperimentDeploymentId:blackPearlRolloutDeploymentId:blackPearlRolloutFactorPackId:blackPearlRolloutId:blackPearlCategorizationVersion:)(MCCKitCategorization::BlackPearlVersion *__return_ptr retstr, Swift::String modelVersion, Swift::String senderModelVersion, Swift::String tsModelVersion, Swift::String finalRuleVersion, Swift::String breakthroughVersion, Swift::String_optional blackPearlExperimentId, Swift::String_optional blackPearlExperimentTreatmentId, Swift::Int blackPearlExperimentDeploymentId, Swift::Int blackPearlRolloutDeploymentId, Swift::String_optional blackPearlRolloutFactorPackId, Swift::String_optional blackPearlRolloutId, Swift::String blackPearlCategorizationVersion)
{
  object = finalRuleVersion._object;
  uint64_t countAndFlagsBits = finalRuleVersion._countAndFlagsBits;
  uint64_t v14 = tsModelVersion._object;
  uint64_t v15 = tsModelVersion._countAndFlagsBits;
  long long v16 = senderModelVersion._object;
  uint64_t v17 = senderModelVersion._countAndFlagsBits;
  uint64_t v18 = modelVersion._object;
  uint64_t v19 = modelVersion._countAndFlagsBits;
  sub_2550AD440(blackPearlCategorizationVersion._countAndFlagsBits, (unint64_t)blackPearlCategorizationVersion._object, (uint64_t)&v24);
  Swift::Int v21 = v25;
  long long v22 = v24;
  LOBYTE(v24) = v26;
  retstr->blackPearlModelVersion._uint64_t countAndFlagsBits = v19;
  retstr->blackPearlModelVersion._object = v18;
  retstr->blackPearlSenderModelVersion._uint64_t countAndFlagsBits = v17;
  retstr->blackPearlSenderModelVersion._object = v16;
  retstr->blackPearlTSModelVersion._uint64_t countAndFlagsBits = v15;
  retstr->blackPearlTSModelVersion._object = v14;
  retstr->blackPearlFinalRuleVersion._uint64_t countAndFlagsBits = countAndFlagsBits;
  retstr->blackPearlFinalRuleVersion._object = object;
  retstr->blackPearlBreakthroughVersion = breakthroughVersion;
  retstr->blackPearlExperimentId = blackPearlExperimentId;
  retstr->blackPearlExperimentTreatmentId = blackPearlExperimentTreatmentId;
  *(_OWORD *)&retstr->blackPearlExperimentDeploymentId = *(_OWORD *)&blackPearlExperimentDeploymentId;
  retstr->blackPearlRolloutFactorPackId = blackPearlRolloutFactorPackId;
  retstr->blackPearlRolloutId = blackPearlRolloutId;
  *(_OWORD *)&retstr->blackPearlCategorizationVersion.value.major = v22;
  retstr->blackPearlCategorizationVersion.value.patch = v21;
  retstr->blackPearlCategorizationVersion.is_nil = v24;
}

uint64_t sub_2550AD440@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v35[0] = 46;
  v35[1] = 0xE100000000000000;
  v34[2] = v35;
  swift_bridgeObjectRetain();
  id v6 = (void *)sub_2550C4A34(0x7FFFFFFFFFFFFFFFLL, 1, sub_2550B2E18, (uint64_t)v34, a1, a2);
  swift_bridgeObjectRelease();
  if (v6[2] != 3) {
    goto LABEL_19;
  }
  uint64_t v7 = v6[4];
  uint64_t v8 = v6[5];
  if (!((v8 ^ (unint64_t)v7) >> 14)) {
    goto LABEL_19;
  }
  unint64_t v10 = v6[6];
  unint64_t v9 = v6[7];
  uint64_t v11 = sub_2550B1F50(v6[4], v6[5], v10, v9, 10);
  if ((v12 & 0x100) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_2550B16F4(v7, v8, v10, v9, 10);
    char v15 = v14;
    swift_bridgeObjectRelease();
    if (v15) {
      goto LABEL_19;
    }
  }
  else
  {
    if (v12) {
      goto LABEL_19;
    }
    uint64_t v13 = (unsigned __int8 *)v11;
  }
  if (v6[2] < 2uLL)
  {
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v16 = v6[8];
  uint64_t v17 = v6[9];
  if (!((v17 ^ (unint64_t)v16) >> 14))
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  unint64_t v19 = v6[10];
  unint64_t v18 = v6[11];
  uint64_t v20 = sub_2550B1F50(v6[8], v6[9], v19, v18, 10);
  if ((v21 & 0x100) == 0)
  {
    if ((v21 & 1) == 0)
    {
      long long v22 = (unsigned __int8 *)v20;
      goto LABEL_13;
    }
    goto LABEL_19;
  }
  swift_bridgeObjectRetain();
  long long v22 = sub_2550B16F4(v16, v17, v19, v18, 10);
  char v24 = v23;
  swift_bridgeObjectRelease();
  if (v24) {
    goto LABEL_19;
  }
LABEL_13:
  if (v6[2] < 3uLL)
  {
LABEL_23:
    __break(1u);
    goto LABEL_19;
  }
  unint64_t v25 = v6[12];
  unint64_t v26 = v6[13];
  unint64_t v28 = v6[14];
  unint64_t v27 = v6[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!((v26 ^ v25) >> 14)) {
    goto LABEL_19;
  }
  uint64_t v29 = sub_2550B1F50(v25, v26, v28, v27, 10);
  if ((v30 & 0x100) != 0) {
    uint64_t v29 = (uint64_t)sub_2550B16F4(v25, v26, v28, v27, 10);
  }
  uint64_t v31 = v29;
  char v32 = v30;
  uint64_t result = swift_bridgeObjectRelease();
  if ((v32 & 1) == 0)
  {
    *(void *)a3 = v13;
    *(void *)(a3 + 8) = v22;
    *(void *)(a3 + 16) = v31;
    *(unsigned char *)(a3 + 24) = 0;
    return result;
  }
LABEL_20:
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(unsigned char *)(a3 + 24) = 1;
  return result;
}

Swift::String __swiftcall BlackPearlVersion.getBlackPearlModelVersion()()
{
  uint64_t v1 = *v0;
  long long v2 = (void *)v0[1];
  swift_bridgeObjectRetain();
  uint64_t v3 = v1;
  uint64_t v4 = v2;
  result._object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

Swift::String __swiftcall BlackPearlVersion.getBlackPearlSenderModelVersion()()
{
  uint64_t v1 = *(void *)(v0 + 16);
  long long v2 = *(void **)(v0 + 24);
  swift_bridgeObjectRetain();
  uint64_t v3 = v1;
  uint64_t v4 = v2;
  result._object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

Swift::String __swiftcall BlackPearlVersion.getBlackPearlTSModelVersion()()
{
  uint64_t v1 = *(void *)(v0 + 32);
  long long v2 = *(void **)(v0 + 40);
  swift_bridgeObjectRetain();
  uint64_t v3 = v1;
  uint64_t v4 = v2;
  result._object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

Swift::String __swiftcall BlackPearlVersion.getBlackPearlFinalRuleVersion()()
{
  uint64_t v1 = *(void *)(v0 + 48);
  long long v2 = *(void **)(v0 + 56);
  swift_bridgeObjectRetain();
  uint64_t v3 = v1;
  uint64_t v4 = v2;
  result._object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

Swift::String __swiftcall BlackPearlVersion.getBlackPearlBreakthroughVersion()()
{
  uint64_t v1 = *(void *)(v0 + 64);
  long long v2 = *(void **)(v0 + 72);
  swift_bridgeObjectRetain();
  uint64_t v3 = v1;
  uint64_t v4 = v2;
  result._object = v4;
  result._uint64_t countAndFlagsBits = v3;
  return result;
}

Swift::Int __swiftcall BlackPearlVersion.getBlackPearlDeploymentId()()
{
  return *(void *)(v0 + 112);
}

Swift::String_optional __swiftcall BlackPearlVersion.getBlackPearlTreatmentId()()
{
  uint64_t v1 = *(void *)(v0 + 96);
  long long v2 = *(void **)(v0 + 104);
  swift_bridgeObjectRetain();
  uint64_t v3 = v1;
  uint64_t v4 = v2;
  result.value._object = v4;
  result.value._uint64_t countAndFlagsBits = v3;
  return result;
}

Swift::String_optional __swiftcall BlackPearlVersion.getBlackPearlExperimentId()()
{
  uint64_t v1 = *(void *)(v0 + 80);
  long long v2 = *(void **)(v0 + 88);
  swift_bridgeObjectRetain();
  uint64_t v3 = v1;
  uint64_t v4 = v2;
  result.value._object = v4;
  result.value._uint64_t countAndFlagsBits = v3;
  return result;
}

Swift::Int __swiftcall BlackPearlVersion.getBlackPearlRolloutDeploymentId()()
{
  return *(void *)(v0 + 120);
}

Swift::String_optional __swiftcall BlackPearlVersion.getBlackPearlRolloutFactorPackId()()
{
  uint64_t v1 = *(void *)(v0 + 128);
  long long v2 = *(void **)(v0 + 136);
  swift_bridgeObjectRetain();
  uint64_t v3 = v1;
  uint64_t v4 = v2;
  result.value._object = v4;
  result.value._uint64_t countAndFlagsBits = v3;
  return result;
}

Swift::String_optional __swiftcall BlackPearlVersion.getBlackPearlRolloutId()()
{
  uint64_t v1 = *(void *)(v0 + 144);
  long long v2 = *(void **)(v0 + 152);
  swift_bridgeObjectRetain();
  uint64_t v3 = v1;
  uint64_t v4 = v2;
  result.value._object = v4;
  result.value._uint64_t countAndFlagsBits = v3;
  return result;
}

Swift::Bool __swiftcall BlackPearlVersion.isCatModelInMLModelFormat()()
{
  return sub_2550D9C40();
}

Swift::Bool __swiftcall BlackPearlVersion.isSenderModelInMLModelFormat()()
{
  return sub_2550D9C40();
}

Swift::Bool __swiftcall BlackPearlVersion.isTSModelInMLModelFormat()()
{
  return sub_2550D9C40();
}

MCCKitCategorization::BlackPearlCategorizationVersion_optional __swiftcall BlackPearlVersion.getBlackPearlCategorizationVersion()()
{
  uint64_t v2 = *(void *)(v1 + 176);
  char v3 = *(unsigned char *)(v1 + 184);
  *(_OWORD *)uint64_t v0 = *(_OWORD *)(v1 + 160);
  *(void *)(v0 + 16) = v2;
  *(unsigned char *)(v0 + 24) = v3;
  return result;
}

unint64_t sub_2550AD8C0(char a1)
{
  unint64_t result = 0xD000000000000016;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 2:
      unint64_t result = 0xD000000000000018;
      break;
    case 3:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 4:
    case 8:
    case 9:
      unint64_t result = 0xD00000000000001DLL;
      break;
    case 6:
      unint64_t result = 0xD00000000000001FLL;
      break;
    case 7:
      unint64_t result = 0xD000000000000020;
      break;
    case 10:
      unint64_t result = 0xD000000000000013;
      break;
    case 11:
      unint64_t result = 0xD00000000000001FLL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_2550AD9F4()
{
  return sub_2550AD8C0(*v0);
}

uint64_t sub_2550AD9FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2550B244C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2550ADA24()
{
  return 0;
}

void sub_2550ADA30(unsigned char *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_2550ADA3C(uint64_t a1)
{
  unint64_t v2 = sub_2550ADF2C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2550ADA78(uint64_t a1)
{
  unint64_t v2 = sub_2550ADF2C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t BlackPearlVersion.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E84860);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v40 = *(void *)(v1 + 24);
  uint64_t v41 = v6;
  uint64_t v7 = *(void *)(v1 + 32);
  uint64_t v38 = *(void *)(v1 + 40);
  uint64_t v39 = v7;
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v36 = *(void *)(v1 + 56);
  uint64_t v37 = v8;
  uint64_t v9 = *(void *)(v1 + 64);
  uint64_t v34 = *(void *)(v1 + 72);
  uint64_t v35 = v9;
  uint64_t v10 = *(void *)(v1 + 80);
  uint64_t v32 = *(void *)(v1 + 88);
  uint64_t v33 = v10;
  uint64_t v11 = *(void *)(v1 + 104);
  uint64_t v30 = *(void *)(v1 + 96);
  uint64_t v31 = v11;
  uint64_t v12 = *(void *)(v1 + 112);
  uint64_t v28 = *(void *)(v1 + 120);
  uint64_t v29 = v12;
  uint64_t v13 = *(void *)(v1 + 136);
  uint64_t v26 = *(void *)(v1 + 128);
  uint64_t v27 = v13;
  uint64_t v24 = *(void *)(v1 + 144);
  uint64_t v25 = *(void *)(v1 + 152);
  uint64_t v21 = *(void *)(v1 + 160);
  uint64_t v23 = *(void *)(v1 + 168);
  uint64_t v22 = *(void *)(v1 + 176);
  int v14 = *(unsigned __int8 *)(v1 + 184);
  uint64_t v15 = a1[3];
  uint64_t v16 = a1;
  uint64_t v17 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(v16, v15);
  sub_2550ADF2C();
  sub_2550DA230();
  LOBYTE(v43) = 0;
  uint64_t v18 = v42;
  sub_2550DA0D0();
  if (!v18)
  {
    LODWORD(v42) = v14;
    LOBYTE(v43) = 1;
    sub_2550DA0D0();
    LOBYTE(v43) = 2;
    sub_2550DA0D0();
    LOBYTE(v43) = 3;
    sub_2550DA0D0();
    LOBYTE(v43) = 4;
    sub_2550DA0D0();
    LOBYTE(v43) = 5;
    sub_2550DA0B0();
    LOBYTE(v43) = 6;
    sub_2550DA0B0();
    LOBYTE(v43) = 7;
    sub_2550DA0F0();
    LOBYTE(v43) = 8;
    sub_2550DA0F0();
    LOBYTE(v43) = 9;
    sub_2550DA0B0();
    LOBYTE(v43) = 10;
    sub_2550DA0B0();
    uint64_t v43 = v21;
    uint64_t v44 = v23;
    uint64_t v45 = v22;
    char v46 = v42;
    char v47 = 11;
    sub_2550ADF80();
    sub_2550DA0C0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v17, v3);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2550ADF2C()
{
  unint64_t result = qword_269E84868;
  if (!qword_269E84868)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84868);
  }
  return result;
}

unint64_t sub_2550ADF80()
{
  unint64_t result = qword_269E84870;
  if (!qword_269E84870)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84870);
  }
  return result;
}

uint64_t BlackPearlVersion.init(from:)@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E84878);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a1[3];
  unint64_t v67 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_2550ADF2C();
  sub_2550DA220();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v67);
  }
  uint64_t v10 = v6;
  uint64_t v61 = a2;
  LOBYTE(v79[0]) = 0;
  uint64_t v11 = sub_2550DA060();
  uint64_t v13 = v12;
  LOBYTE(v79[0]) = 1;
  swift_bridgeObjectRetain();
  uint64_t v60 = sub_2550DA060();
  LOBYTE(v79[0]) = 2;
  uint64_t v15 = v14;
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_2550DA060();
  uint64_t v66 = v15;
  uint64_t v59 = v16;
  LOBYTE(v79[0]) = 3;
  uint64_t v18 = v17;
  swift_bridgeObjectRetain();
  uint64_t v19 = sub_2550DA060();
  uint64_t v65 = v18;
  uint64_t v58 = v19;
  LOBYTE(v79[0]) = 4;
  uint64_t v21 = v20;
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_2550DA060();
  uint64_t v64 = v21;
  uint64_t v57 = v22;
  LOBYTE(v79[0]) = 5;
  uint64_t v24 = v23;
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_2550DA040();
  uint64_t v63 = v24;
  uint64_t v56 = v25;
  LOBYTE(v79[0]) = 6;
  uint64_t v27 = v26;
  swift_bridgeObjectRetain();
  uint64_t v28 = sub_2550DA040();
  uint64_t v62 = v27;
  uint64_t v55 = v28;
  LOBYTE(v79[0]) = 7;
  uint64_t v30 = v29;
  swift_bridgeObjectRetain();
  uint64_t v52 = sub_2550DA080();
  uint64_t v54 = v30;
  LOBYTE(v79[0]) = 8;
  uint64_t v51 = sub_2550DA080();
  LOBYTE(v79[0]) = 9;
  uint64_t v50 = sub_2550DA040();
  uint64_t v53 = v31;
  LOBYTE(v79[0]) = 10;
  swift_bridgeObjectRetain();
  uint64_t v49 = sub_2550DA040();
  uint64_t v33 = v32;
  char v85 = 11;
  sub_2550AE9A4();
  swift_bridgeObjectRetain();
  sub_2550DA050();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v5);
  uint64_t v47 = *((void *)&v81 + 1);
  uint64_t v48 = v81;
  uint64_t v46 = v82;
  char v84 = v83;
  *(void *)&long long v68 = v11;
  *((void *)&v68 + 1) = v13;
  *(void *)&long long v69 = v60;
  *((void *)&v69 + 1) = v66;
  *(void *)&long long v70 = v59;
  *((void *)&v70 + 1) = v65;
  *(void *)&long long v71 = v58;
  *((void *)&v71 + 1) = v64;
  *(void *)&long long v72 = v57;
  *((void *)&v72 + 1) = v63;
  *(void *)&long long v73 = v56;
  *((void *)&v73 + 1) = v62;
  uint64_t v34 = v53;
  *(void *)&long long v74 = v55;
  *((void *)&v74 + 1) = v54;
  *(void *)&long long v75 = v52;
  *((void *)&v75 + 1) = v51;
  *(void *)&long long v76 = v50;
  *((void *)&v76 + 1) = v53;
  *(void *)&long long v77 = v49;
  *((void *)&v77 + 1) = v33;
  v78[0] = v81;
  *(void *)&v78[1] = v82;
  BYTE8(v78[1]) = v83;
  sub_25509F83C((uint64_t)&v68);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v35 = v63;
  swift_bridgeObjectRelease();
  uint64_t v36 = v62;
  swift_bridgeObjectRelease();
  uint64_t v37 = v54;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v38 = v77;
  uint64_t v39 = v61;
  v61[8] = v76;
  v39[9] = v38;
  v39[10] = v78[0];
  *(_OWORD *)((char *)v39 + 169) = *(_OWORD *)((char *)v78 + 9);
  long long v40 = v73;
  v39[4] = v72;
  v39[5] = v40;
  long long v41 = v75;
  v39[6] = v74;
  v39[7] = v41;
  long long v42 = v69;
  _OWORD *v39 = v68;
  v39[1] = v42;
  long long v43 = v71;
  v39[2] = v70;
  v39[3] = v43;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v67);
  v79[0] = v11;
  v79[1] = v13;
  v79[2] = v60;
  v79[3] = v66;
  v79[4] = v59;
  v79[5] = v65;
  v79[6] = v58;
  v79[7] = v64;
  v79[8] = v57;
  v79[9] = v35;
  v79[10] = v56;
  v79[11] = v36;
  v79[12] = v55;
  v79[13] = v37;
  v79[14] = v52;
  v79[15] = v51;
  v79[16] = v50;
  v79[17] = v34;
  v79[18] = v49;
  v79[19] = v33;
  v79[20] = v48;
  v79[21] = v47;
  v79[22] = v46;
  char v80 = v84;
  return sub_2550AE9F8((uint64_t)v79);
}

unint64_t sub_2550AE9A4()
{
  unint64_t result = qword_269E84880;
  if (!qword_269E84880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84880);
  }
  return result;
}

uint64_t sub_2550AE9F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_2550AEAA4@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  return BlackPearlVersion.init(from:)(a1, a2);
}

uint64_t sub_2550AEABC(void *a1)
{
  return BlackPearlVersion.encode(to:)(a1);
}

void __swiftcall BlackPearlThreshold.init(thresholdCommerce:thresholdEmployeeNews:thresholdEmployee:thresholdPersonal:thresholdP2C:thresholdSender:thresholdTS:thresholdCategoryTS:thresholdCorpEmployee:tsSenderMaxTokens:tsSubjectMaxTokens:)(MCCKitCategorization::BlackPearlThreshold *__return_ptr retstr, Swift::Double thresholdCommerce, Swift::Double thresholdEmployeeNews, Swift::Double thresholdEmployee, Swift::Double thresholdPersonal, Swift::Double thresholdP2C, Swift::Double thresholdSender, Swift::Double thresholdTS, Swift::Double thresholdCategoryTS, Swift::Double thresholdCorpEmployee, Swift::Int tsSenderMaxTokens, Swift::Int tsSubjectMaxTokens)
{
  retstr->thresholdCommerce = thresholdCommerce;
  retstr->thresholdEmployeeNews = thresholdEmployeeNews;
  retstr->thresholdEmployee = thresholdEmployee;
  retstr->thresholdPersonal = thresholdPersonal;
  retstr->thresholdP2C = thresholdP2C;
  retstr->thresholdSender = thresholdSender;
  retstr->thresholdTS = thresholdTS;
  retstr->thresholdCategoryTS = thresholdCategoryTS;
  retstr->thresholdCorpEmployee = thresholdCorpEmployee;
  retstr->tsSenderMaxTokens = tsSenderMaxTokens;
  retstr->tsSubjectMaxTokens = tsSubjectMaxTokens;
}

Swift::Double __swiftcall BlackPearlThreshold.getThresholdCommerce()()
{
  return *v0;
}

Swift::Double __swiftcall BlackPearlThreshold.getThresholdEmployeeNews()()
{
  return *(double *)(v0 + 8);
}

Swift::Double __swiftcall BlackPearlThreshold.getthresholdEmployee()()
{
  return *(double *)(v0 + 16);
}

Swift::Double __swiftcall BlackPearlThreshold.getThresholdPersonal()()
{
  return *(double *)(v0 + 24);
}

Swift::Double __swiftcall BlackPearlThreshold.getThresholdP2C()()
{
  return *(double *)(v0 + 32);
}

Swift::Double __swiftcall BlackPearlThreshold.getThresholdSender()()
{
  return *(double *)(v0 + 40);
}

Swift::Double __swiftcall BlackPearlThreshold.getThresholdTS()()
{
  return *(double *)(v0 + 48);
}

Swift::Double __swiftcall BlackPearlThreshold.getThresholdCategoryTS()()
{
  return *(double *)(v0 + 56);
}

Swift::Double __swiftcall BlackPearlThreshold.getThresholdCorpEmployee()()
{
  return *(double *)(v0 + 64);
}

Swift::Int __swiftcall BlackPearlThreshold.getTSSenderMaxTokens()()
{
  return *(void *)(v0 + 72);
}

Swift::Int __swiftcall BlackPearlThreshold.getTSSubjectMaxTokens()()
{
  return *(void *)(v0 + 80);
}

unint64_t sub_2550AEB4C(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000015;
      break;
    case 4:
    case 5:
    case 6:
      unint64_t result = 0x6C6F687365726874;
      break;
    case 7:
      unint64_t result = 0xD000000000000013;
      break;
    case 8:
      unint64_t result = 0xD000000000000015;
      break;
    case 10:
      unint64_t result = 0xD000000000000012;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_2550AEC68()
{
  return sub_2550AEB4C(*v0);
}

uint64_t sub_2550AEC70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2550B288C(a1, a2);
  *a3 = result;
  return result;
}

void sub_2550AEC98(unsigned char *a1@<X8>)
{
  *a1 = 11;
}

uint64_t sub_2550AECA4(uint64_t a1)
{
  unint64_t v2 = sub_2550AF02C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2550AECE0(uint64_t a1)
{
  unint64_t v2 = sub_2550AF02C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t BlackPearlThreshold.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E84888);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[1] = *(void *)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2550AF02C();
  sub_2550DA230();
  char v20 = 0;
  uint64_t v7 = v9[2];
  sub_2550DA0E0();
  if (!v7)
  {
    char v19 = 1;
    sub_2550DA0E0();
    char v18 = 2;
    sub_2550DA0E0();
    char v17 = 3;
    sub_2550DA0E0();
    char v16 = 4;
    sub_2550DA0E0();
    char v15 = 5;
    sub_2550DA0E0();
    char v14 = 6;
    sub_2550DA0E0();
    char v13 = 7;
    sub_2550DA0E0();
    char v12 = 8;
    sub_2550DA0E0();
    char v11 = 9;
    sub_2550DA0F0();
    char v10 = 10;
    sub_2550DA0F0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_2550AF02C()
{
  unint64_t result = qword_269E84890;
  if (!qword_269E84890)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84890);
  }
  return result;
}

uint64_t BlackPearlThreshold.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E84898);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2550AF02C();
  sub_2550DA220();
  if (!v2)
  {
    char v41 = 0;
    sub_2550DA070();
    uint64_t v10 = v9;
    char v40 = 1;
    sub_2550DA070();
    uint64_t v12 = v11;
    char v39 = 2;
    sub_2550DA070();
    uint64_t v14 = v13;
    char v38 = 3;
    sub_2550DA070();
    uint64_t v16 = v15;
    char v37 = 4;
    sub_2550DA070();
    uint64_t v18 = v17;
    char v36 = 5;
    sub_2550DA070();
    uint64_t v20 = v19;
    char v35 = 6;
    sub_2550DA070();
    uint64_t v22 = v21;
    char v34 = 7;
    sub_2550DA070();
    uint64_t v30 = v23;
    char v33 = 8;
    sub_2550DA070();
    uint64_t v25 = v24;
    char v32 = 9;
    uint64_t v27 = sub_2550DA080();
    char v31 = 10;
    uint64_t v28 = sub_2550DA080();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
    a2[1] = v12;
    a2[2] = v14;
    a2[3] = v16;
    a2[4] = v18;
    a2[5] = v20;
    uint64_t v29 = v30;
    a2[6] = v22;
    a2[7] = v29;
    a2[8] = v25;
    a2[9] = v27;
    a2[10] = v28;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_2550AF3C0@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return BlackPearlThreshold.init(from:)(a1, a2);
}

uint64_t sub_2550AF3D8(void *a1)
{
  return BlackPearlThreshold.encode(to:)(a1);
}

uint64_t BloomFilterData.init(commerceFilePath:guaranteeListFilePath:nerFilePath:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_2550D97D0();
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t, uint64_t))v12)((void *)(v8 - 8), a4, a1, v8);
  uint64_t v9 = type metadata accessor for BloomFilterData(0);
  v12(a4 + *(int *)(v9 + 20), a2, v8);
  uint64_t v10 = a4 + *(int *)(v9 + 24);

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v12)(v10, a3, v8);
}

uint64_t type metadata accessor for BloomFilterData(uint64_t a1)
{
  return sub_2550AF4F4(a1, qword_26B278E20);
}

uint64_t sub_2550AF4F4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t BloomFilterData.getCommerceFilePath()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_2550D97D0();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t BloomFilterData.getGuaranteeListFilePath()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for BloomFilterData(0) + 20);
  uint64_t v4 = sub_2550D97D0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t BloomFilterData.getNerFilePath()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for BloomFilterData(0) + 24);
  uint64_t v4 = sub_2550D97D0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

Swift::String __swiftcall BlackPearlCategorizationVersion.getVersionString()()
{
  uint64_t v4 = sub_2550DA130();
  uint64_t v5 = v0;
  sub_2550D9BA0();
  sub_2550DA130();
  sub_2550D9BA0();
  swift_bridgeObjectRelease();
  sub_2550D9BA0();
  sub_2550DA130();
  sub_2550D9BA0();
  swift_bridgeObjectRelease();
  uint64_t v1 = v4;
  uint64_t v2 = v5;
  result._object = v2;
  result._uint64_t countAndFlagsBits = v1;
  return result;
}

Swift::Int __swiftcall BlackPearlCategorizationVersion.getMajorVersion()()
{
  return *v0;
}

Swift::Int __swiftcall BlackPearlCategorizationVersion.getMinorVersion()()
{
  return *(void *)(v0 + 8);
}

Swift::Int __swiftcall BlackPearlCategorizationVersion.getPatchVersion()()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_2550AF774()
{
  return *(void *)&aMajor_0[8 * *v0];
}

uint64_t sub_2550AF78C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2550B2CD8(a1, a2);
  *a3 = result;
  return result;
}

void sub_2550AF7B4(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_2550AF7C0(uint64_t a1)
{
  unint64_t v2 = sub_2550AF9D0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2550AF7FC(uint64_t a1)
{
  unint64_t v2 = sub_2550AF9D0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t BlackPearlCategorizationVersion.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E848A0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(v1 + 8);
  v10[0] = *(void *)(v1 + 16);
  v10[1] = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2550AF9D0();
  sub_2550DA230();
  char v13 = 0;
  sub_2550DA0F0();
  if (!v2)
  {
    char v12 = 1;
    sub_2550DA0F0();
    char v11 = 2;
    sub_2550DA0F0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_2550AF9D0()
{
  unint64_t result = qword_269E848A8;
  if (!qword_269E848A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E848A8);
  }
  return result;
}

uint64_t BlackPearlCategorizationVersion.init(from:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E848B0);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2550AF9D0();
  sub_2550DA220();
  if (!v2)
  {
    char v16 = 0;
    uint64_t v9 = sub_2550DA080();
    char v15 = 1;
    uint64_t v11 = sub_2550DA080();
    char v14 = 2;
    uint64_t v12 = sub_2550DA080();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
    a2[2] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_2550AFBEC@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return BlackPearlCategorizationVersion.init(from:)(a1, a2);
}

uint64_t sub_2550AFC04(void *a1)
{
  return BlackPearlCategorizationVersion.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for BlackPearlVersion(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for BlackPearlVersion()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BlackPearlVersion(uint64_t a1, uint64_t a2)
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
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  uint64_t v9 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v9;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  uint64_t v10 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v10;
  uint64_t v11 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v11;
  long long v12 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 169) = *(_OWORD *)(a2 + 169);
  *(_OWORD *)(a1 + 160) = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BlackPearlVersion(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v4 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 169) = *(_OWORD *)(a2 + 169);
  *(_OWORD *)(a1 + 160) = v4;
  return a1;
}

__n128 __swift_memcpy185_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v5 = a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  __n128 result = (__n128)a2[8];
  long long v9 = a2[9];
  long long v10 = a2[10];
  *(_OWORD *)(a1 + 169) = *(long long *)((char *)a2 + 169);
  *(_OWORD *)(a1 + 144) = v9;
  *(_OWORD *)(a1 + 160) = v10;
  *(__n128 *)(a1 + 128) = result;
  return result;
}

uint64_t assignWithTake for BlackPearlVersion(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v10;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  uint64_t v11 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v12;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 169) = *(_OWORD *)(a2 + 169);
  return a1;
}

uint64_t getEnumTagSinglePayload for BlackPearlVersion(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 185)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BlackPearlVersion(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
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
    *(unsigned char *)(result + 184) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 185) = 1;
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
    *(unsigned char *)(result + 185) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BlackPearlVersion()
{
  return &type metadata for BlackPearlVersion;
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

uint64_t getEnumTagSinglePayload for BlackPearlThreshold(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 88)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for BlackPearlThreshold(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(unsigned char *)(result + 88) = v3;
  return result;
}

ValueMetadata *type metadata accessor for BlackPearlThreshold()
{
  return &type metadata for BlackPearlThreshold;
}

uint64_t *initializeBufferWithCopyOfBuffer for BloomFilterData(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_2550D97D0();
    uint64_t v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 24)), (uint64_t *)((char *)a2 + *(int *)(a3 + 24)), v7);
  }
  return a1;
}

uint64_t destroy for BloomFilterData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2550D97D0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v7)((void *)(v4 - 8), a1, v4);
  v7(a1 + *(int *)(a2 + 20), v4);
  uint64_t v5 = a1 + *(int *)(a2 + 24);

  return ((uint64_t (*)(uint64_t, uint64_t))v7)(v5, v4);
}

uint64_t initializeWithCopy for BloomFilterData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2550D97D0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v7(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24), v6);
  return a1;
}

uint64_t assignWithCopy for BloomFilterData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2550D97D0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v7(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24), v6);
  return a1;
}

uint64_t initializeWithTake for BloomFilterData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2550D97D0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v7(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24), v6);
  return a1;
}

uint64_t assignWithTake for BloomFilterData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2550D97D0();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  v7(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24), v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for BloomFilterData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2550B0628);
}

uint64_t sub_2550B0628(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2550D97D0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for BloomFilterData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2550B06A8);
}

uint64_t sub_2550B06A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2550D97D0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_2550B0718()
{
  uint64_t result = sub_2550D97D0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for BlackPearlModel(char *a1, char *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *(void *)a2;
    *(void *)uint64_t v4 = *(void *)a2;
    uint64_t v4 = (char *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *((void *)a2 + 1);
    *(void *)a1 = *(void *)a2;
    *((void *)a1 + 1) = v7;
    uint64_t v8 = *((void *)a2 + 3);
    *((void *)a1 + 2) = *((void *)a2 + 2);
    *((void *)a1 + 3) = v8;
    uint64_t v9 = a3[6];
    uint64_t v10 = &a1[v9];
    uint64_t v11 = &a2[v9];
    uint64_t v12 = sub_2550D97D0();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    v13(&v4[a3[7]], &a2[a3[7]], v12);
    uint64_t v14 = a3[8];
    char v15 = *(void **)&a2[v14];
    *(void *)&v4[v14] = v15;
    id v16 = v15;
  }
  return v4;
}

void destroy for BlackPearlModel(uint64_t a1, int *a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = sub_2550D97D0();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(a1 + a2[7], v5);
  uint64_t v7 = *(void **)(a1 + a2[8]);
}

char *initializeWithCopy for BlackPearlModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  uint64_t v7 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v7;
  uint64_t v8 = a3[6];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_2550D97D0();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  v12(&a1[a3[7]], &a2[a3[7]], v11);
  uint64_t v13 = a3[8];
  uint64_t v14 = *(void **)&a2[v13];
  *(void *)&a1[v13] = v14;
  id v15 = v14;
  return a1;
}

char *assignWithCopy for BlackPearlModel(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = *((void *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a3[6];
  uint64_t v7 = &a1[v6];
  uint64_t v8 = &a2[v6];
  uint64_t v9 = sub_2550D97D0();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24);
  v10(v7, v8, v9);
  v10(&a1[a3[7]], &a2[a3[7]], v9);
  uint64_t v11 = a3[8];
  uint64_t v12 = *(void **)&a1[v11];
  uint64_t v13 = *(void **)&a2[v11];
  *(void *)&a1[v11] = v13;
  id v14 = v13;

  return a1;
}

char *initializeWithTake for BlackPearlModel(char *a1, char *a2, int *a3)
{
  long long v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  uint64_t v7 = a3[6];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = sub_2550D97D0();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32);
  v11(v8, v9, v10);
  v11(&a1[a3[7]], &a2[a3[7]], v10);
  *(void *)&a1[a3[8]] = *(void *)&a2[a3[8]];
  return a1;
}

char *assignWithTake for BlackPearlModel(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[6];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = sub_2550D97D0();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40);
  v12(v9, v10, v11);
  v12(&a1[a3[7]], &a2[a3[7]], v11);
  uint64_t v13 = a3[8];
  id v14 = *(void **)&a1[v13];
  *(void *)&a1[v13] = *(void *)&a2[v13];

  return a1;
}

uint64_t getEnumTagSinglePayload for BlackPearlModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2550B0D30);
}

uint64_t sub_2550B0D30(uint64_t a1, uint64_t a2, uint64_t a3)
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
    uint64_t v8 = sub_2550D97D0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for BlackPearlModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2550B0DF4);
}

uint64_t sub_2550B0DF4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_2550D97D0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_2550B0E9C()
{
  uint64_t result = sub_2550D97D0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
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

uint64_t getEnumTagSinglePayload for BlackPearlCategorizationVersion(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for BlackPearlCategorizationVersion(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for BlackPearlCategorizationVersion()
{
  return &type metadata for BlackPearlCategorizationVersion;
}

unsigned char *storeEnumTagSinglePayload for BlackPearlCategorizationVersion.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2550B107CLL);
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

ValueMetadata *type metadata accessor for BlackPearlCategorizationVersion.CodingKeys()
{
  return &type metadata for BlackPearlCategorizationVersion.CodingKeys;
}

uint64_t getEnumTagSinglePayload for BlackPearlThreshold.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF6) {
    goto LABEL_17;
  }
  if (a2 + 10 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 10) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 10;
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
      return (*a1 | (v4 << 8)) - 10;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 10;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xB;
  int v8 = v6 - 11;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for BlackPearlThreshold.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 10 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 10) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF6) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF5)
  {
    unsigned int v6 = ((a2 - 246) >> 8) + 1;
    *__n128 result = a2 + 10;
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
        JUMPOUT(0x2550B1210);
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
          *__n128 result = a2 + 10;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BlackPearlThreshold.CodingKeys()
{
  return &type metadata for BlackPearlThreshold.CodingKeys;
}

uint64_t getEnumTagSinglePayload for BlackPearlVersion.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xC;
  int v8 = v6 - 12;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for BlackPearlVersion.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF4)
  {
    unsigned int v6 = ((a2 - 245) >> 8) + 1;
    *__n128 result = a2 + 11;
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
        JUMPOUT(0x2550B13A4);
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
          *__n128 result = a2 + 11;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BlackPearlVersion.CodingKeys()
{
  return &type metadata for BlackPearlVersion.CodingKeys;
}

unint64_t sub_2550B13E0()
{
  unint64_t result = qword_269E848B8;
  if (!qword_269E848B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E848B8);
  }
  return result;
}

unint64_t sub_2550B1438()
{
  unint64_t result = qword_269E848C0;
  if (!qword_269E848C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E848C0);
  }
  return result;
}

unint64_t sub_2550B1490()
{
  unint64_t result = qword_269E848C8;
  if (!qword_269E848C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E848C8);
  }
  return result;
}

unint64_t sub_2550B14E8()
{
  unint64_t result = qword_269E848D0;
  if (!qword_269E848D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E848D0);
  }
  return result;
}

unint64_t sub_2550B1540()
{
  unint64_t result = qword_269E848D8;
  if (!qword_269E848D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E848D8);
  }
  return result;
}

unint64_t sub_2550B1598()
{
  unint64_t result = qword_269E848E0;
  if (!qword_269E848E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E848E0);
  }
  return result;
}

unint64_t sub_2550B15F0()
{
  unint64_t result = qword_269E848E8;
  if (!qword_269E848E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E848E8);
  }
  return result;
}

unint64_t sub_2550B1648()
{
  unint64_t result = qword_269E848F0;
  if (!qword_269E848F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E848F0);
  }
  return result;
}

unint64_t sub_2550B16A0()
{
  unint64_t result = qword_269E848F8;
  if (!qword_269E848F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E848F8);
  }
  return result;
}

unsigned __int8 *sub_2550B16F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  sub_2550B2E38();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_2550D9C60();
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
    uint64_t v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  uint64_t v7 = sub_2550B1A64();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  unint64_t v8 = v12;
  if ((v12 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v9 = (unsigned __int8 *)sub_2550D9F90();
  }
LABEL_7:
  uint64_t v13 = sub_2550B17E8(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13;
}

unsigned __int8 *sub_2550B17E8(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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

uint64_t sub_2550B1A64()
{
  unint64_t v0 = sub_2550D9C70();
  uint64_t v4 = sub_2550B1AE4(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2550B1AE4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    unint64_t v9 = sub_2550B1C3C(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_2550B56E0(v9, 0);
      unint64_t v12 = sub_2550B1D3C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_2550D9F90();
LABEL_4:
        JUMPOUT(0x25A287560);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x25A287560](v11 + 4, v11[2]);
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
    return MEMORY[0x25A287560]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_2550B1C3C(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    unint64_t result = sub_2550CD428(result, a3, a4);
    unint64_t v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    unint64_t result = sub_2550CD428(a2, a3, a4);
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

  return sub_2550D9BF0();
}

unint64_t sub_2550B1D3C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
    void v9[3] = a7;
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
    unint64_t result = v12;
    if (v17 == v15) {
      unint64_t result = sub_2550CD428(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      unint64_t result = sub_2550D9C00();
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
        unint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          unint64_t result = sub_2550D9F90();
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
    unint64_t result = sub_2550CD428(v12, a6, a7);
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
    unint64_t v12 = sub_2550D9BD0();
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

uint64_t sub_2550B1F50(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
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
    uint64_t v11 = v14;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    uint64_t v11 = (void *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    uint64_t v11 = (void *)sub_2550D9F90();
  }
  uint64_t result = sub_2550B2024((uint64_t)v11, a1, a2, a3, a4, a5);
  if (!v5)
  {
    char v15 = v13 & 1;
LABEL_8:
    LOBYTE(v14[0]) = (a4 & 0x1000000000000000) != 0;
  }
  return result;
}

uint64_t sub_2550B2024(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6)
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
    uint64_t result = sub_2550CD428(a2, a4, a5);
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
  uint64_t result = sub_2550D9BF0();
  int64_t v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    uint64_t result = sub_2550CD428(v10, a4, a5);
    unint64_t v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    uint64_t result = sub_2550CD428(a3, a4, a5);
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
  uint64_t result = sub_2550D9BF0();
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
          char v34 = v19 + 1;
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

uint64_t sub_2550B244C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000016 && a2 == 0x80000002550DD020 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x80000002550DD040 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x80000002550DD060 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD00000000000001ALL && a2 == 0x80000002550DD080 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x80000002550DD0A0 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x80000002550DD0C0 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD00000000000001FLL && a2 == 0x80000002550DD0E0 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000020 && a2 == 0x80000002550DD100 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x80000002550DD130 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x80000002550DD150 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000002550DD170 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0xD00000000000001FLL && a2 == 0x80000002550DD190)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    char v5 = sub_2550DA140();
    swift_bridgeObjectRelease();
    if (v5) {
      return 11;
    }
    else {
      return 12;
    }
  }
}

uint64_t sub_2550B288C(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000011 && a2 == 0x80000002550DD1B0 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000002550DD1D0 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002550DD1F0 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002550DD210 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C6F687365726874 && a2 == 0xEC00000043325064 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6C6F687365726874 && a2 == 0xEF7265646E655364 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6C6F687365726874 && a2 == 0xEB00000000535464 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000002550DD230 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000002550DD250 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002550DD270 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000002550DD290)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else
  {
    char v5 = sub_2550DA140();
    swift_bridgeObjectRelease();
    if (v5) {
      return 10;
    }
    else {
      return 11;
    }
  }
}

uint64_t sub_2550B2CD8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x726F6A616DLL && a2 == 0xE500000000000000;
  if (v2 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726F6E696DLL && a2 == 0xE500000000000000 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6863746170 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_2550DA140();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_2550B2E18(void *a1)
{
  return sub_2550CF8E4(a1, *(void **)(v1 + 16)) & 1;
}

unint64_t sub_2550B2E38()
{
  unint64_t result = qword_269E84900;
  if (!qword_269E84900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84900);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for BitMap(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for BitMap()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for BitMap(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  return a1;
}

uint64_t assignWithTake for BitMap(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for BitMap(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BitMap(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BitMap()
{
  return &type metadata for BitMap;
}

uint64_t sub_2550B3010(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = a3;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E84908);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2550B3338();
  sub_2550DA230();
  uint64_t v15 = a2;
  char v14 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E84840);
  sub_2550B3744(&qword_269E84918);
  sub_2550DA100();
  if (!v3)
  {
    char v13 = 1;
    sub_2550DA0F0();
    char v12 = 2;
    sub_2550DA0F0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_2550B31EC()
{
  uint64_t v1 = 0x7374656B637562;
  if (*v0 != 1) {
    uint64_t v1 = 0x6E6F697469736F70;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x70614D746962;
  }
}

uint64_t sub_2550B3248@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2550B338C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2550B3270(uint64_t a1)
{
  unint64_t v2 = sub_2550B3338();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2550B32AC(uint64_t a1)
{
  unint64_t v2 = sub_2550B3338();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2550B32E8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_2550B34E8(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_2550B3318(void *a1)
{
  return sub_2550B3010(a1, *v1, v1[1]);
}

unint64_t sub_2550B3338()
{
  unint64_t result = qword_269E84910;
  if (!qword_269E84910)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84910);
  }
  return result;
}

uint64_t sub_2550B338C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x70614D746962 && a2 == 0xE600000000000000;
  if (v2 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7374656B637562 && a2 == 0xE700000000000000 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E6F697469736F70 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_2550DA140();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_2550B34E8(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E84920);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_2550B3338();
  sub_2550DA220();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E84840);
    v9[7] = 0;
    sub_2550B3744(&qword_269E84928);
    sub_2550DA090();
    uint64_t v7 = v10;
    v9[6] = 1;
    swift_bridgeObjectRetain();
    sub_2550DA080();
    v9[5] = 2;
    sub_2550DA080();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_2550B3744(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269E84840);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for BitMap.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x2550B3874);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BitMap.CodingKeys()
{
  return &type metadata for BitMap.CodingKeys;
}

unint64_t sub_2550B38B0()
{
  unint64_t result = qword_269E84930;
  if (!qword_269E84930)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84930);
  }
  return result;
}

unint64_t sub_2550B3908()
{
  unint64_t result = qword_269E84938;
  if (!qword_269E84938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84938);
  }
  return result;
}

unint64_t sub_2550B3960()
{
  unint64_t result = qword_269E84940;
  if (!qword_269E84940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84940);
  }
  return result;
}

uint64_t sub_2550B39B8(int a1, size_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_2550D9FC0();
    __break(1u);
  }
  else
  {
    if (!a2) {
      return MEMORY[0x263F8EE78];
    }
    uint64_t v4 = sub_2550D9CD0();
    *(void *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1, a2);
    return v4;
  }
  return result;
}

uint64_t sub_2550B3A74(unint64_t a1, unint64_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_2550D9FC0();
    __break(1u);
    return result;
  }
  if (!a2) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t result = sub_2550D9CD0();
  *(void *)(result + 16) = a2;
  uint64_t v5 = (unint64_t *)(result + 32);
  if (a2 < 4)
  {
    unint64_t v6 = 0;
LABEL_9:
    unint64_t v10 = a2 - v6;
    do
    {
      *v5++ = a1;
      --v10;
    }
    while (v10);
    return result;
  }
  unint64_t v6 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  v5 += a2 & 0xFFFFFFFFFFFFFFFCLL;
  int64x2_t v7 = vdupq_n_s64(a1);
  uint64_t v8 = (int64x2_t *)(result + 48);
  unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    *uint64_t v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v6 != a2) {
    goto LABEL_9;
  }
  return result;
}

uint64_t sub_2550B3B60(unsigned int a1, unint64_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    uint64_t result = sub_2550D9FC0();
    __break(1u);
    return result;
  }
  if (!a2) {
    return MEMORY[0x263F8EE78];
  }
  uint64_t result = sub_2550D9CD0();
  *(void *)(result + 16) = a2;
  uint64_t v5 = (unsigned int *)(result + 32);
  if (a2 < 8)
  {
    unint64_t v6 = 0;
LABEL_9:
    unint64_t v10 = a2 - v6;
    do
    {
      *v5++ = a1;
      --v10;
    }
    while (v10);
    return result;
  }
  unint64_t v6 = a2 & 0xFFFFFFFFFFFFFFF8;
  v5 += a2 & 0xFFFFFFFFFFFFFFF8;
  int32x4_t v7 = vdupq_n_s32(a1);
  uint64_t v8 = (int32x4_t *)(result + 48);
  unint64_t v9 = a2 & 0xFFFFFFFFFFFFFFF8;
  do
  {
    v8[-1] = v7;
    *uint64_t v8 = v7;
    v8 += 2;
    v9 -= 8;
  }
  while (v9);
  if (v6 != a2) {
    goto LABEL_9;
  }
  return result;
}

void BloomFilter.init(numHashFunction:numBuckets:)(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if ((a2 & 7) != 0)
  {
    sub_2550D9FD0();
    __break(1u);
LABEL_10:
    sub_2550D9FC0();
    __break(1u);
    return;
  }
  uint64_t v5 = a2 + 7;
  if (a2 >= 0) {
    uint64_t v5 = a2;
  }
  if (a2 <= -8) {
    goto LABEL_10;
  }
  size_t v7 = v5 >> 3;
  if ((unint64_t)a2 < 8)
  {
    uint64_t v8 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v8 = sub_2550D9CD0();
    *(void *)(v8 + 16) = v7;
    bzero((void *)(v8 + 32), v7);
  }
  *(void *)a3 = v8;
  *(void *)(a3 + 8) = a2;
  *(void *)(a3 + 16) = v7;
  *(unsigned char *)(a3 + 24) = a1;
  *(void *)(a3 + 32) = a2;
}

uint64_t sub_2550B3D88()
{
  uint64_t v1 = 0x46687361486D756ELL;
  if (*v0 != 1) {
    uint64_t v1 = 0x656B6375426D756ELL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x70614D746962;
  }
}

uint64_t sub_2550B3DF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2550B5894(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2550B3E18(uint64_t a1)
{
  unint64_t v2 = sub_2550B4058();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2550B3E54(uint64_t a1)
{
  unint64_t v2 = sub_2550B4058();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t BloomFilter.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E84948);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  size_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v11 = *v1;
  uint64_t v8 = *((void *)v1 + 2);
  int v14 = *((unsigned __int8 *)v1 + 24);
  v10[1] = *((void *)v1 + 4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2550B4058();
  sub_2550DA230();
  long long v12 = v11;
  uint64_t v13 = v8;
  char v15 = 0;
  sub_2550B40AC();
  sub_2550DA100();
  if (!v2)
  {
    LOBYTE(v12) = 1;
    sub_2550DA110();
    LOBYTE(v12) = 2;
    sub_2550DA0F0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_2550B4058()
{
  unint64_t result = qword_269E84950;
  if (!qword_269E84950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84950);
  }
  return result;
}

unint64_t sub_2550B40AC()
{
  unint64_t result = qword_269E84958;
  if (!qword_269E84958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84958);
  }
  return result;
}

uint64_t BloomFilter.init(from:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E84960);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2550B4058();
  sub_2550DA220();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  char v21 = 0;
  sub_2550B4344();
  sub_2550DA090();
  uint64_t v9 = v17;
  uint64_t v16 = v18;
  uint64_t v10 = v19;
  LOBYTE(v17) = 1;
  swift_bridgeObjectRetain();
  int v20 = sub_2550DA0A0();
  uint64_t v15 = v10;
  LOBYTE(v17) = 2;
  uint64_t v11 = sub_2550DA080();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v13 = v16;
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v13;
  *(void *)(a2 + 16) = v15;
  *(unsigned char *)(a2 + 24) = v20;
  *(void *)(a2 + 32) = v11;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_2550B4344()
{
  unint64_t result = qword_269E84968;
  if (!qword_269E84968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84968);
  }
  return result;
}

uint64_t sub_2550B4398@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return BloomFilter.init(from:)(a1, a2);
}

uint64_t sub_2550B43B0(void *a1)
{
  return BloomFilter.encode(to:)(a1);
}

Swift::Void __swiftcall BloomFilter.put(object:)(Swift::String object)
{
  uint64_t v4 = object._object;
  uint64_t countAndFlagsBits = object._countAndFlagsBits;
  int v6 = *(unsigned __int8 *)(v2 + 24);
  unint64_t v7 = *(void *)(v2 + 32);
  uint64_t v8 = *(char **)v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_2550B5568(countAndFlagsBits, (unint64_t)v4);
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)_s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(v9, 0);
  swift_release();
  if ((v7 & 0x8000000000000000) != 0 || (unint64_t i = HIDWORD(v7)) != 0)
  {
    sub_2550D9FC0();
    __break(1u);
  }
  else
  {
    if (!v7) {
      goto LABEL_30;
    }
    uint64_t v3 = v10 % v7;
    uint64_t v10 = sub_2550B5024(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v1 = v10[2];
    unint64_t i = v10[3];
    uint64_t v9 = v1 + 1;
    if (v1 >= i >> 1) {
      goto LABEL_31;
    }
    while (1)
    {
      void v10[2] = v9;
      v10[v1 + 4] = v3;
      if (v6)
      {
        LODWORD(v9) = 0;
        do
        {
          uint64_t v9 = (v9 + 1);
          swift_bridgeObjectRetain();
          uint64_t v12 = sub_2550B5568(countAndFlagsBits, (unint64_t)v4);
          swift_bridgeObjectRelease();
          uint64_t v3 = _s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(v12, v9);
          swift_release();
          unint64_t v1 = v10[2];
          unint64_t v13 = v10[3];
          if (v1 >= v13 >> 1) {
            uint64_t v10 = sub_2550B5024((void *)(v13 > 1), v1 + 1, 1, v10);
          }
          void v10[2] = v1 + 1;
          v10[v1 + 4] = v3 % v7;
        }
        while (v6 != v9);
      }
      swift_bridgeObjectRelease();
      uint64_t v4 = (void *)v10[2];
      if (!v4) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v8 = sub_2550B5748((uint64_t)v8);
      }
      for (unint64_t i = 0; ; ++i)
      {
        uint64_t v14 = (void *)(i + 1);
        if (__OFADD__(i, 1)) {
          break;
        }
        uint64_t v15 = v10[i + 4];
        uint64_t v16 = v15 + 7;
        if (v15 >= 0) {
          uint64_t v16 = v10[i + 4];
        }
        uint64_t v17 = v15 - (v16 & 0xFFFFFFFFFFFFFFF8);
        if (v17 >= 1) {
          unint64_t v18 = 2 << (v17 - 1);
        }
        else {
          unint64_t v18 = 2uLL >> (1 - v17);
        }
        if (v15 < -7) {
          goto LABEL_28;
        }
        uint64_t v19 = v16 >> 3;
        if (v19 >= *((void *)v8 + 2)) {
          goto LABEL_29;
        }
        v8[v19 + 32] |= v18;
        if (v14 == v4)
        {
          swift_bridgeObjectRelease();
          *int v20 = v8;
          return;
        }
      }
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
LABEL_30:
      __break(1u);
LABEL_31:
      uint64_t v10 = sub_2550B5024((void *)(i > 1), v9, 1, v10);
    }
    swift_bridgeObjectRelease();
  }
}

Swift::Void __swiftcall BloomFilter.putAll(list:)(Swift::OpaquePointer list)
{
  uint64_t v38 = *((void *)list._rawValue + 2);
  if (v38)
  {
    uint64_t v2 = *(char **)v1;
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_58:
    }
      uint64_t v2 = sub_2550B5748((uint64_t)v2);
    uint64_t v3 = 0;
    *(void *)uint64_t v1 = v2;
    unint64_t v44 = *(void *)(v1 + 32);
    unsigned int v36 = (void *)v1;
    int v42 = *(unsigned __int8 *)(v1 + 24);
    uint64_t v1 = 3864292196;
    while (1)
    {
      uint64_t v4 = v3 + 1;
      if (__OFADD__(v3, 1)) {
        goto LABEL_56;
      }
      uint64_t v5 = (uint64_t *)((char *)list._rawValue + 16 * v3 + 32);
      uint64_t v7 = *v5;
      unint64_t v6 = v5[1];
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v41 = v7;
      uint64_t v8 = sub_2550B5568(v7, v6);
      unint64_t v43 = v6;
      swift_bridgeObjectRelease();
      unsigned int v9 = _s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(v8, 0);
      swift_release();
      if ((v44 & 0x8000000000000000) != 0 || HIDWORD(v44))
      {
        while (1)
        {
LABEL_59:
          sub_2550D9FC0();
          __break(1u);
        }
      }
      if (!v44) {
        goto LABEL_57;
      }
      uint64_t v10 = sub_2550B5024(0, 1, 1, MEMORY[0x263F8EE78]);
      unint64_t v12 = v10[2];
      unint64_t v11 = v10[3];
      uint64_t v39 = v4;
      uint64_t v40 = (uint64_t)v2;
      if (v12 >= v11 >> 1) {
        uint64_t v10 = sub_2550B5024((void *)(v11 > 1), v12 + 1, 1, v10);
      }
      void v10[2] = v12 + 1;
      v10[v12 + 4] = v9 % v44;
      if (v42) {
        break;
      }
LABEL_34:
      uint64_t v2 = (char *)v40;
      swift_bridgeObjectRelease();
      uint64_t v28 = v10[2];
      if (v28)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v2 = sub_2550B5748(v40);
        }
        uint64_t v29 = 0;
        while (1)
        {
          uint64_t v30 = v29 + 1;
          if (__OFADD__(v29, 1)) {
            break;
          }
          uint64_t v31 = v10[v29 + 4];
          uint64_t v32 = v31 + 7;
          if (v31 >= 0) {
            uint64_t v32 = v10[v29 + 4];
          }
          uint64_t v33 = v31 - (v32 & 0xFFFFFFFFFFFFFFF8);
          if (v33 >= 1) {
            unint64_t v34 = 2 << (v33 - 1);
          }
          else {
            unint64_t v34 = 2uLL >> (1 - v33);
          }
          if (v31 < -7) {
            goto LABEL_54;
          }
          uint64_t v35 = v32 >> 3;
          if (v35 >= *((void *)v2 + 2)) {
            goto LABEL_55;
          }
          v2[v35 + 32] |= v34;
          ++v29;
          if (v30 == v28) {
            goto LABEL_47;
          }
        }
LABEL_53:
        __break(1u);
LABEL_54:
        __break(1u);
LABEL_55:
        __break(1u);
LABEL_56:
        __break(1u);
LABEL_57:
        __break(1u);
        goto LABEL_58;
      }
LABEL_47:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v3 = v39;
      if (v39 == v38) {
        goto LABEL_50;
      }
    }
    int v13 = 0;
    while (1)
    {
      ++v13;
      uint64_t v2 = (char *)v43;
      swift_bridgeObjectRetain();
      uint64_t v14 = sub_2550B5568(v41, v43);
      swift_bridgeObjectRelease();
      unint64_t v15 = *(void *)(v14 + 16);
      int v16 = v13;
      if (v15 >= 4) {
        break;
      }
LABEL_19:
      uint64_t v20 = v15 & 0x7FFFFFFFFFFFFFFCLL;
      if ((v15 & 0x7FFFFFFFFFFFFFFCLL) < v15)
      {
        uint64_t v21 = *(void *)(v14 + 16) & 3;
        if ((v15 & 3) != 0)
        {
          uint64_t v22 = v20 + v21 - 1;
          if (v22 >= (uint64_t)v15) {
            goto LABEL_52;
          }
          uint64_t v23 = v14 + 32;
          int v24 = *(unsigned __int8 *)(v14 + 32 + v21 - 1 + v20);
          if (v21 != 1)
          {
            if (v22 >= (uint64_t)v15) {
              goto LABEL_52;
            }
            int v24 = *(unsigned __int8 *)(v23 + v21 - 2 + v20) | (v24 << 8);
            if (v21 != 2)
            {
              if (v22 >= (uint64_t)v15)
              {
LABEL_52:
                __break(1u);
                goto LABEL_53;
              }
              int v24 = *(unsigned __int8 *)(v21 + v20 + v23 - 3) | (v24 << 8);
            }
          }
        }
        else
        {
          int v24 = 0;
        }
        v16 ^= 461845907 * ((380141568 * v24) | ((-862048943 * v24) >> 17));
      }
      if (HIDWORD(v15)) {
        goto LABEL_59;
      }
      swift_release();
      unint64_t v26 = v10[2];
      unint64_t v25 = v10[3];
      if (v26 >= v25 >> 1) {
        uint64_t v10 = sub_2550B5024((void *)(v25 > 1), v26 + 1, 1, v10);
      }
      unsigned int v27 = -2048144789 * (v16 ^ v15 ^ ((v16 ^ v15) >> 16));
      void v10[2] = v26 + 1;
      v10[v26 + 4] = ((-1028477387 * (v27 ^ (v27 >> 13))) ^ ((-1028477387 * (v27 ^ (v27 >> 13))) >> 16))
                   % v44;
      if (v13 == v42) {
        goto LABEL_34;
      }
    }
    uint64_t v17 = 0;
    unint64_t v18 = (v15 + 3) >> 2;
    int v16 = v13;
    while (v18 && v17 + 1 < v15 && v17 + 2 < v15 && v17 + 3 < v15)
    {
      HIDWORD(v19) = (461845907
                    * ((380141568 * *(_DWORD *)(v14 + 32 + v17)) | ((-862048943
                                                                                 * *(_DWORD *)(v14 + 32 + v17)) >> 17))) ^ v16;
      LODWORD(v19) = HIDWORD(v19);
      int v16 = 5 * (v19 >> 19) - 430675100;
      --v18;
      v17 += 4;
      if (4 * (v15 >> 2) == v17) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_50:
    swift_bridgeObjectRelease();
    void *v36 = v2;
  }
}

Swift::Bool __swiftcall BloomFilter.mayContain(object:)(Swift::String object)
{
  uint64_t v4 = object._object;
  uint64_t countAndFlagsBits = object._countAndFlagsBits;
  uint64_t v6 = *v1;
  int v7 = *((unsigned __int8 *)v1 + 24);
  unint64_t v8 = v1[4];
  swift_bridgeObjectRetain();
  unint64_t v9 = sub_2550B5568(countAndFlagsBits, (unint64_t)v4);
  swift_bridgeObjectRelease();
  uint64_t v10 = (void *)_s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(v9, 0);
  swift_release();
  if ((v8 & 0x8000000000000000) == 0)
  {
    uint64_t v11 = HIDWORD(v8);
    if (!HIDWORD(v8))
    {
      if (!v8) {
        goto LABEL_37;
      }
      unint64_t v9 = v10 % v8;
      uint64_t v10 = sub_2550B5024(0, 1, 1, MEMORY[0x263F8EE78]);
      unint64_t v3 = v10[2];
      uint64_t v11 = v10[3];
      int64_t v2 = v3 + 1;
      if (v3 >= (unint64_t)v11 >> 1) {
        goto LABEL_38;
      }
      while (1)
      {
        void v10[2] = v2;
        v10[v3 + 4] = v9;
        if (v7)
        {
          LODWORD(v3) = 0;
          do
          {
            unint64_t v3 = (v3 + 1);
            swift_bridgeObjectRetain();
            uint64_t v12 = sub_2550B5568(countAndFlagsBits, (unint64_t)v4);
            swift_bridgeObjectRelease();
            unsigned int v13 = _s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(v12, v3);
            swift_release();
            unint64_t v9 = v10[2];
            unint64_t v14 = v10[3];
            int64_t v2 = v9 + 1;
            if (v9 >= v14 >> 1) {
              uint64_t v10 = sub_2550B5024((void *)(v14 > 1), v9 + 1, 1, v10);
            }
            void v10[2] = v2;
            v10[v9 + 4] = v13 % v8;
          }
          while (v7 != v3);
        }
        uint64_t v15 = v10[4];
        uint64_t v11 = v15 + 7;
        if (v15 >= 0) {
          uint64_t v11 = v10[4];
        }
        uint64_t v16 = v15 - (v11 & 0xFFFFFFFFFFFFFFF8);
        if (v16 >= 1) {
          unint64_t v17 = 2 << (v16 - 1);
        }
        else {
          unint64_t v17 = 2uLL >> (1 - v16);
        }
        if (v15 < -7) {
          goto LABEL_35;
        }
        uint64_t v18 = v11 >> 3;
        uint64_t v11 = *(void *)(v6 + 16);
        if (v18 < v11) {
          break;
        }
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        uint64_t v10 = sub_2550B5024((void *)((unint64_t)v11 > 1), v2, 1, v10);
      }
      uint64_t v11 = v6 + 32;
      int v19 = *(unsigned char *)(v6 + 32 + v18) & v17;
      unint64_t v9 = v19 != 0;
      if (v19) {
        BOOL v20 = v2 == 1;
      }
      else {
        BOOL v20 = 1;
      }
      if (v20)
      {
LABEL_34:
        swift_bridgeObjectRelease();
        return v9;
      }
      int64_t v21 = v2 - 2;
      uint64_t v22 = v10 + 5;
      while (1)
      {
        uint64_t v24 = *v22++;
        uint64_t v23 = v24;
        uint64_t v25 = v24 + 7;
        if (v24 >= 0) {
          uint64_t v25 = v23;
        }
        uint64_t v26 = v23 - (v25 & 0xFFFFFFFFFFFFFFF8);
        unint64_t v27 = v26 >= 1 ? 2 << (v26 - 1) : 2uLL >> (1 - v26);
        if (v23 < -7) {
          break;
        }
        uint64_t v28 = v25 >> 3;
        if (v28 >= *(void *)(v6 + 16)) {
          goto LABEL_36;
        }
        int v29 = *(unsigned char *)(v11 + v28) & v27;
        unint64_t v9 = v29 != 0;
        BOOL v31 = v21-- != 0;
        if (!v29 || !v31) {
          goto LABEL_34;
        }
      }
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
  }
  Swift::Bool result = sub_2550D9FC0();
  __break(1u);
  return result;
}

void *sub_2550B4F08(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2799E0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      unsigned int v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unsigned int v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2550B57A0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_2550B5018(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2550B5140(a1, a2, a3, a4, &qword_26B278C40);
}

void *sub_2550B5024(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C30);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      unsigned int v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      unsigned int v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2550B5DD4(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_2550B5134(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_2550B5140(a1, a2, a3, a4, &qword_26B278C00);
}

char *sub_2550B5140(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v8 = a2;
    goto LABEL_8;
  }
  unint64_t v7 = *((void *)a4 + 3);
  int64_t v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v8 + 0x4000000000000000 >= 0)
  {
    int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v8 = a2;
    }
LABEL_8:
    int64_t v9 = *((void *)a4 + 2);
    if (v8 <= v9) {
      int64_t v10 = *((void *)a4 + 2);
    }
    else {
      int64_t v10 = v8;
    }
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      int64_t v11 = (char *)swift_allocObject();
      size_t v12 = _swift_stdlib_malloc_size(v11);
      *((void *)v11 + 2) = v9;
      *((void *)v11 + 3) = 2 * v12 - 64;
      unsigned int v13 = v11 + 32;
      if (v6)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[v9 + 32]) {
          memmove(v13, a4 + 32, v9);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      int64_t v11 = (char *)MEMORY[0x263F8EE78];
      unsigned int v13 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result) {
        goto LABEL_13;
      }
    }
    sub_2550B5EC0(0, v9, v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

char *sub_2550B5238(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E84988);
      int64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      unsigned int v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      int64_t v10 = (char *)MEMORY[0x263F8EE78];
      unsigned int v13 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_2550B5FA8(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_2550B5348(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C20);
      int64_t v10 = (char *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 29;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 2);
      unsigned int v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      int64_t v10 = (char *)MEMORY[0x263F8EE78];
      unsigned int v13 = (char *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32]) {
          memmove(v13, a4 + 32, 4 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_2550B5FA8(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_2550B5458(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B2799D0);
      int64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unsigned int v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      int64_t v10 = (void *)MEMORY[0x263F8EE78];
      unsigned int v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2550B6094(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2550B5568(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
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
      unint64_t v3 = sub_2550B56E0(v2, 0);
      if (v2 < 0) {
        break;
      }
      uint64_t v4 = v3;
      uint64_t v5 = sub_2550D9F70();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2550D9FC0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2550D9BC0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2550DA020();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2550D9FC0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2550B56E0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C40);
  uint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2550B5748(uint64_t a1)
{
  return sub_2550B5140(0, *(void *)(a1 + 16), 0, (char *)a1, &qword_26B278C40);
}

char *sub_2550B5778(uint64_t a1)
{
  return sub_2550B5238(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_2550B578C(void *a1)
{
  return sub_2550B5024(0, a1[2], 0, a1);
}

uint64_t sub_2550B57A0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2550DA020();
  __break(1u);
  return result;
}

uint64_t sub_2550B5894(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x70614D746962 && a2 == 0xE600000000000000;
  if (v2 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x46687361486D756ELL && a2 == 0xEF6E6F6974636E75 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656B6375426D756ELL && a2 == 0xEA00000000007374)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_2550DA140();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t initializeWithCopy for BloomFilter(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BloomFilter(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
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

uint64_t assignWithTake for BloomFilter(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for BloomFilter(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BloomFilter(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BloomFilter()
{
  return &type metadata for BloomFilter;
}

unsigned char *storeEnumTagSinglePayload for BloomFilter.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2550B5C94);
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

ValueMetadata *type metadata accessor for BloomFilter.CodingKeys()
{
  return &type metadata for BloomFilter.CodingKeys;
}

unint64_t sub_2550B5CD0()
{
  unint64_t result = qword_269E84970;
  if (!qword_269E84970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84970);
  }
  return result;
}

unint64_t sub_2550B5D28()
{
  unint64_t result = qword_269E84978;
  if (!qword_269E84978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84978);
  }
  return result;
}

unint64_t sub_2550B5D80()
{
  unint64_t result = qword_269E84980;
  if (!qword_269E84980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84980);
  }
  return result;
}

char *sub_2550B5DD4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  unint64_t result = (char *)sub_2550DA020();
  __break(1u);
  return result;
}

char *sub_2550B5EC0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + a1 + 32);
    size_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  unint64_t result = (char *)sub_2550DA020();
  __break(1u);
  return result;
}

char *sub_2550B5FA8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  unint64_t result = (char *)sub_2550DA020();
  __break(1u);
  return result;
}

uint64_t sub_2550B6094(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_2550DA020();
  __break(1u);
  return result;
}

uint64_t LanguageDetection.deinit()
{
  return v0;
}

uint64_t LanguageDetection.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t _s20MCCKitCategorization17LanguageDetectionC7english4textSbSS_tFZ_0()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F14018]), sel_init);
  uint64_t v1 = (void *)sub_2550D9AA0();
  objc_msgSend(v0, sel_processString_, v1);

  uint64_t v23 = v0;
  uint64_t result = sub_2550D9DF0();
  uint64_t v3 = result;
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  while (v8)
  {
    unint64_t v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    unint64_t v11 = v10 | (v4 << 6);
LABEL_21:
    double v15 = *(double *)(*(void *)(v3 + 56) + 8 * v11);
    uint64_t v16 = sub_2550D9AD0();
    uint64_t v18 = v17;
    if (v16 == sub_2550D9AD0() && v18 == v19)
    {
      uint64_t result = swift_bridgeObjectRelease_n();
    }
    else
    {
      char v21 = sub_2550DA140();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if ((v21 & 1) == 0 && v15 > 0.95)
      {
        uint64_t v22 = 0;
LABEL_29:

        swift_release();
        return v22;
      }
    }
  }
  int64_t v12 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v12 >= v9) {
    goto LABEL_28;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v12);
  ++v4;
  if (v13) {
    goto LABEL_20;
  }
  int64_t v4 = v12 + 1;
  if (v12 + 1 >= v9) {
    goto LABEL_28;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v4);
  if (v13) {
    goto LABEL_20;
  }
  int64_t v4 = v12 + 2;
  if (v12 + 2 >= v9) {
    goto LABEL_28;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v4);
  if (v13)
  {
LABEL_20:
    unint64_t v8 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v4 << 6);
    goto LABEL_21;
  }
  int64_t v14 = v12 + 3;
  if (v14 >= v9)
  {
LABEL_28:
    uint64_t v22 = 1;
    goto LABEL_29;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      goto LABEL_28;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_20;
    }
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for LanguageDetection()
{
  return self;
}

uint64_t method lookup function for LanguageDetection(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for LanguageDetection);
}

uint64_t static BloomFilterSerDe.writeToFile(input:path:)(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C58);
  uint64_t v7 = MEMORY[0x270FA5388](v6 - 8);
  int64_t v9 = (char *)v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  unint64_t v11 = (char *)v42 - v10;
  uint64_t v12 = sub_2550D97D0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v47 = (char *)v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = a1[2];
  if (__OFADD__(v15, 1))
  {
    __break(1u);
LABEL_23:
    swift_once();
    goto LABEL_5;
  }
  uint64_t v46 = v11;
  uint64_t v16 = *a1;
  char v17 = *((unsigned char *)a1 + 24);
  uint64_t v53 = sub_2550B784C(v15 + 1);
  unint64_t v54 = v18;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E84990);
  uint64_t v51 = v19;
  unint64_t v52 = sub_2550B78E8();
  LOBYTE(v49) = v17;
  LOBYTE(v48) = *(unsigned char *)__swift_project_boxed_opaque_existential_1(&v49, v19);
  sub_2550D9800();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v49);
  if (*(void *)(v16 + 16)) {
    sub_2550D9810();
  }
  uint64_t v45 = v9;
  if (qword_26B278B80 != -1) {
    goto LABEL_23;
  }
LABEL_5:
  uint64_t v20 = sub_2550D9A00();
  __swift_project_value_buffer(v20, (uint64_t)qword_26B279BA0);
  uint64_t v21 = v53;
  unint64_t v22 = v54;
  swift_bridgeObjectRetain();
  sub_2550AA394(v21, v22);
  swift_bridgeObjectRetain();
  sub_2550AA394(v21, v22);
  uint64_t v23 = sub_2550D99E0();
  os_log_type_t v24 = sub_2550D9DC0();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v44 = a2;
  if (v25)
  {
    unint64_t v43 = v22 >> 62;
    uint64_t v26 = swift_slowAlloc();
    v42[0] = swift_slowAlloc();
    uint64_t v49 = v42[0];
    *(_DWORD *)uint64_t v26 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_2550A7884(a2, a3, &v49);
    sub_2550D9E90();
    v42[1] = a3;
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v26 + 12) = 2048;
    switch(v43)
    {
      case 1uLL:
        goto LABEL_12;
      case 2uLL:
        uint64_t v28 = *(void *)(v21 + 16);
        uint64_t v29 = *(void *)(v21 + 24);
        sub_2550AC604(v21, v22);
        uint64_t v27 = v29 - v28;
        if (__OFSUB__(v29, v28))
        {
          __break(1u);
LABEL_12:
          sub_2550AC604(v21, v22);
          LODWORD(v27) = HIDWORD(v21) - v21;
          if (__OFSUB__(HIDWORD(v21), v21)) {
            __break(1u);
          }
          uint64_t v27 = (int)v27;
        }
        break;
      case 3uLL:
        sub_2550AC604(v21, v22);
        uint64_t v27 = 0;
        break;
      default:
        sub_2550AC604(v21, v22);
        uint64_t v27 = BYTE6(v22);
        break;
    }
    uint64_t v48 = v27 / 1000;
    sub_2550D9E90();
    sub_2550AC604(v21, v22);
    _os_log_impl(&dword_25509D000, v23, v24, "Saving bloom filter %s of size (Kb) %ld", (uint8_t *)v26, 0x16u);
    uint64_t v30 = v42[0];
    swift_arrayDestroy();
    MEMORY[0x25A2881E0](v30, -1, -1);
    MEMORY[0x25A2881E0](v26, -1, -1);
  }
  else
  {
    sub_2550AC604(v21, v22);
    swift_bridgeObjectRelease_n();
    sub_2550AC604(v21, v22);
  }
  id v31 = objc_msgSend(self, sel_defaultManager);
  id v32 = objc_msgSend(v31, sel_URLsForDirectory_inDomains_, 9, 1);

  uint64_t v33 = sub_2550D9CA0();
  uint64_t v34 = (uint64_t)v45;
  if (*(void *)(v33 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v45, v33 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80)), v12);
    uint64_t v35 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56);
    v35(v34, 0, 1, v12);
  }
  else
  {
    uint64_t v35 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56);
    v35((uint64_t)v45, 1, 1, v12);
  }
  swift_bridgeObjectRelease();
  unsigned int v36 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  if (v36(v34, 1, v12) == 1)
  {
    sub_2550B7944(v34);
    uint64_t v37 = (uint64_t)v46;
    v35((uint64_t)v46, 1, 1, v12);
    goto LABEL_26;
  }
  uint64_t v37 = (uint64_t)v46;
  sub_2550D9750();
  uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  v38(v34, v12);
  v35(v37, 0, 1, v12);
  if (v36(v37, 1, v12) == 1)
  {
LABEL_26:
    sub_2550B7944(v37);
    uint64_t v49 = 0;
    unint64_t v50 = 0xE000000000000000;
    sub_2550D9F60();
    swift_bridgeObjectRelease();
    uint64_t v49 = 0xD00000000000001FLL;
    unint64_t v50 = 0x80000002550DD5B0;
    sub_2550D9BA0();
    sub_2550D9FD0();
    __break(1u);
    JUMPOUT(0x2550B6BC4);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(v47, v37, v12);
  swift_beginAccess();
  uint64_t v39 = v53;
  unint64_t v40 = v54;
  sub_2550AA394(v53, v54);
  sub_2550D9820();
  sub_2550AC604(v39, v40);
  v38((uint64_t)v47, v12);
  return sub_2550AC604(v53, v54);
}

uint64_t static BloomFilterSerDe.readFromBundle(name:fileExtension:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v31 = a5;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C58);
  MEMORY[0x270FA5388](v9 - 8);
  unint64_t v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2550D97D0();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  unint64_t v18 = (char *)v30 - v17;
  type metadata accessor for BloomFilterSerDe();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v20 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  v30[0] = a1;
  v30[1] = a2;
  id v21 = v20;
  unint64_t v22 = (void *)sub_2550D9AA0();
  v30[2] = a3;
  v30[3] = a4;
  uint64_t v23 = (void *)sub_2550D9AA0();
  id v24 = objc_msgSend(v21, sel_URLForResource_withExtension_, v22, v23);

  if (v24)
  {
    sub_2550D9780();

    BOOL v25 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v25(v11, v16, v12);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1)
    {
      v25(v18, v11, v12);
      uint64_t v26 = sub_2550D97E0();
      unint64_t v28 = v27;
      sub_2550B6FB8(v26, v27, v31);
      sub_2550AC604(v26, v28);

      return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  }
  sub_2550B7944((uint64_t)v11);
  unint64_t v32 = 0;
  unint64_t v33 = 0xE000000000000000;
  sub_2550D9F60();
  swift_bridgeObjectRelease();
  unint64_t v32 = 0xD000000000000018;
  unint64_t v33 = 0x80000002550DD5F0;
  sub_2550D9BA0();
  sub_2550D9BA0();
  sub_2550D9BA0();
  uint64_t result = sub_2550D9FD0();
  __break(1u);
  return result;
}

uint64_t sub_2550B6FB8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v3 = a2 >> 62;
  unsigned __int8 v4 = BYTE6(a2);
  switch(a2 >> 62)
  {
    case 1uLL:
      if (!((a1 ^ (unint64_t)(a1 << 32)) >> 32)) {
        goto LABEL_7;
      }
      char v7 = sub_2550D9850();
      goto LABEL_12;
    case 2uLL:
      if (*(void *)(a1 + 16) == *(void *)(a1 + 24)) {
        goto LABEL_7;
      }
      char v7 = sub_2550D9850();
      if (v3 != 2) {
        goto LABEL_12;
      }
      uint64_t v14 = *(void *)(a1 + 16);
      uint64_t v13 = *(void *)(a1 + 24);
      uint64_t v8 = v13 - v14;
      if (!__OFSUB__(v13, v14)) {
        goto LABEL_14;
      }
      __break(1u);
LABEL_12:
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_19;
      }
      uint64_t v8 = HIDWORD(a1) - (int)a1;
      goto LABEL_14;
    case 3uLL:
      goto LABEL_7;
    default:
      if ((a2 & 0xFF000000000000) != 0)
      {
        char v7 = sub_2550D9850();
        uint64_t v8 = v4;
LABEL_14:
        if (v8 >= 1)
        {
          uint64_t v15 = sub_2550D9830();
          unint64_t v17 = v16;
          uint64_t v11 = sub_2550B79E0(v15, v16);
          uint64_t result = sub_2550AC604(v15, v17);
          unint64_t v9 = *(void *)(v11 + 16);
          if (!(v9 >> 60))
          {
            uint64_t v12 = 8 * v9;
            goto LABEL_17;
          }
          __break(1u);
LABEL_19:
          __break(1u);
        }
        __break(1u);
        JUMPOUT(0x2550B7134);
      }
LABEL_7:
      unint64_t v9 = 1;
      uint64_t result = sub_2550D9CD0();
      uint64_t v11 = result;
      *(void *)(result + 16) = 1;
      *(unsigned char *)(result + 32) = 0;
      uint64_t v12 = 8;
      char v7 = 1;
LABEL_17:
      *(void *)a3 = v11;
      *(void *)(a3 + 8) = v12;
      *(void *)(a3 + 16) = v9;
      *(unsigned char *)(a3 + 24) = v7;
      *(void *)(a3 + 32) = v12;
      return result;
  }
}

uint64_t static BloomFilterSerDe.readFromFile(path:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v28 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C58);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v26 - v7;
  uint64_t v9 = sub_2550D97D0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = objc_msgSend(self, sel_defaultManager);
  id v14 = objc_msgSend(v13, sel_URLsForDirectory_inDomains_, 9, 1);

  uint64_t v15 = sub_2550D9CA0();
  uint64_t v16 = *(void *)(v15 + 16);
  unint64_t v27 = v12;
  if (v16)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v6, v15 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80)), v9);
    unint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    v17(v6, 0, 1, v9);
  }
  else
  {
    unint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
    v17(v6, 1, 1, v9);
  }
  swift_bridgeObjectRelease();
  unint64_t v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  int v19 = v18(v6, 1, v9);
  uint64_t v26 = a1;
  if (v19 == 1)
  {
    sub_2550B7944((uint64_t)v6);
    v17(v8, 1, 1, v9);
  }
  else
  {
    sub_2550D9750();
    id v20 = *(void (**)(char *, uint64_t))(v10 + 8);
    v20(v6, v9);
    v17(v8, 0, 1, v9);
    if (v18(v8, 1, v9) != 1)
    {
      id v21 = v27;
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v27, v8, v9);
      uint64_t v22 = sub_2550D97E0();
      unint64_t v24 = v23;
      sub_2550B6FB8(v22, v23, v28);
      sub_2550AC604(v22, v24);
      return ((uint64_t (*)(char *, uint64_t))v20)(v21, v9);
    }
  }
  sub_2550B7944((uint64_t)v8);
  unint64_t v29 = 0;
  unint64_t v30 = 0xE000000000000000;
  sub_2550D9F60();
  swift_bridgeObjectRelease();
  unint64_t v29 = 0xD00000000000001ELL;
  unint64_t v30 = 0x80000002550DD640;
  sub_2550D9BA0();
  uint64_t result = sub_2550D9FD0();
  __break(1u);
  return result;
}

uint64_t static BloomFilterSerDe.readFromFile(withFilePath:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2550D97D0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  MEMORY[0x270FA5388](v6);
  uint64_t v8 = (char *)&v13 - v7;
  if (sub_2550D9770())
  {
    uint64_t v9 = sub_2550D97E0();
    unint64_t v11 = v10;
    sub_2550B6FB8(v9, v10, a2);
    return sub_2550AC604(v9, v11);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
    unint64_t v14 = 0;
    unint64_t v15 = 0xE000000000000000;
    sub_2550D9F60();
    swift_bridgeObjectRelease();
    unint64_t v14 = 0xD000000000000018;
    unint64_t v15 = 0x80000002550DD5F0;
    sub_2550A8FF0();
    sub_2550DA130();
    sub_2550D9BA0();
    swift_bridgeObjectRelease();
    uint64_t result = sub_2550D9FD0();
    __break(1u);
  }
  return result;
}

uint64_t BloomFilterSerDe.deinit()
{
  return v0;
}

uint64_t BloomFilterSerDe.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t sub_2550B784C(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result < 15)
    {
      return 0;
    }
    else
    {
      sub_2550D9640();
      swift_allocObject();
      sub_2550D9630();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_2550D97F0();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = 0;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

unint64_t sub_2550B78E8()
{
  unint64_t result = qword_269E84998;
  if (!qword_269E84998)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269E84990);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84998);
  }
  return result;
}

uint64_t sub_2550B7944(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C58);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for BloomFilterSerDe()
{
  return self;
}

uint64_t method lookup function for BloomFilterSerDe(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for BloomFilterSerDe);
}

uint64_t sub_2550B79E0(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
        JUMPOUT(0x2550B7AFCLL);
      }
      size_t v3 = HIDWORD(a1) - (int)a1;
LABEL_5:
      uint64_t v4 = sub_2550B39B8(0, v3);
LABEL_8:
      uint64_t v7 = v4;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
LABEL_9:
      }
        uint64_t v7 = (uint64_t)sub_2550B5018(0, *(void *)(v7 + 16), 0, (char *)v7);
LABEL_10:
      swift_bridgeObjectRetain();
      sub_2550D9840();
      swift_bridgeObjectRelease();
      return v7;
    case 2uLL:
      uint64_t v6 = *(void *)(a1 + 16);
      uint64_t v5 = *(void *)(a1 + 24);
      if (__OFSUB__(v5, v6)) {
        goto LABEL_14;
      }
      uint64_t v4 = sub_2550B39B8(0, v5 - v6);
      if (!__OFSUB__(*(void *)(a1 + 24), *(void *)(a1 + 16))) {
        goto LABEL_8;
      }
      goto LABEL_15;
    case 3uLL:
      uint64_t v7 = sub_2550B39B8(0, 0);
      if (swift_isUniquelyReferenced_nonNull_native()) {
        goto LABEL_10;
      }
      goto LABEL_9;
    default:
      size_t v3 = BYTE6(a2);
      goto LABEL_5;
  }
}

uint64_t SenderBloomFilterBuilder.__allocating_init(csvFilePath:probabilityOfFalsePositives:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  *(double *)(result + 32) = a3;
  return result;
}

uint64_t SenderBloomFilterBuilder.init(csvFilePath:probabilityOfFalsePositives:)(uint64_t a1, uint64_t a2, double a3)
{
  *(void *)(v3 + 16) = a1;
  *(void *)(v3 + 24) = a2;
  *(double *)(v3 + 32) = a3;
  return v3;
}

uint64_t sub_2550B7B6C()
{
  uint64_t v104 = sub_2550D98C0();
  uint64_t v117 = *(void (***)(char *, uint64_t))(v104 - 8);
  uint64_t v0 = MEMORY[0x270FA5388](v104);
  uint64_t v2 = (char *)&v99 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v0);
  v123 = (char *)&v99 - v3;
  uint64_t v4 = sub_2550D98F0();
  uint64_t v128 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v6 = (char *)&v99 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E849A0);
  uint64_t v8 = v7 - 8;
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v119 = (void (**)(char *))((char *)&v99 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v99 - v11;
  uint64_t v110 = sub_2550D9940();
  uint64_t v109 = *(void *)(v110 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v110);
  unint64_t v15 = (char *)&v99 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  unint64_t v17 = (char *)&v99 - v16;
  sub_2550B9188((uint64_t)&v99 - v16);
  sub_2550D9930();
  __swift_project_boxed_opaque_existential_1(v126, v127);
  sub_2550D9980();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v126);
  uint64_t v108 = v15;
  uint64_t v112 = sub_2550B88F0();
  v107 = v17;
  sub_2550D9900();
  uint64_t v18 = v128;
  uint64_t v19 = (uint64_t)v119;
  uint64_t v121 = *(void (**)(void (**)(char *), char *, uint64_t))(v128 + 16);
  uint64_t v122 = v128 + 16;
  v121(v119, v6, v4);
  sub_2550BA1E8();
  sub_2550D9D60();
  id v20 = *(void (**)(char *, uint64_t))(v18 + 8);
  uint64_t v128 = v18 + 8;
  v120 = v20;
  v20(v6, v4);
  *(void *)(v19 + *(int *)(v8 + 44)) = v126[0];
  sub_2550BA240(v19, (uint64_t)v12);
  id v21 = &v12[*(int *)(v8 + 44)];
  uint64_t v22 = *(void *)v21;
  sub_2550D9D80();
  if (v22 == v126[0])
  {
LABEL_2:
    sub_2550A9778((uint64_t)v12, &qword_269E849A0);
    unint64_t v23 = *(void (**)(char *, uint64_t))(v109 + 8);
    uint64_t v24 = v110;
    v23(v108, v110);
    v23(v107, v24);
    return v112;
  }
  unint64_t v118 = (void (**)(char *, char *, uint64_t))(v117 + 4);
  v119 = (void (**)(char *))(v117 + 2);
  ++v117;
  uint64_t v116 = MEMORY[0x263F8EE58] + 8;
  uint64_t v26 = v104;
  while (1)
  {
    unint64_t v27 = (void (*)(void *, void))sub_2550D9DA0();
    uint64_t v28 = v123;
    (*v119)(v123);
    v27(v126, 0);
    v121((void (**)(char *))v6, v12, v4);
    sub_2550D9D90();
    v120(v6, v4);
    (*v118)(v2, v28, v26);
    sub_2550D98D0();
    if (!v127) {
      goto LABEL_42;
    }
    if (swift_dynamicCast()) {
      break;
    }
LABEL_43:
    (*v117)(v2, v26);
LABEL_44:
    uint64_t v66 = *(void *)v21;
    sub_2550D9D80();
    if (v66 == v126[0]) {
      goto LABEL_2;
    }
  }
  unint64_t v29 = v125;
  unint64_t v115 = v124;
  sub_2550D98D0();
  if (!v127)
  {
    swift_bridgeObjectRelease();
LABEL_42:
    sub_2550A9778((uint64_t)v126, &qword_269E84858);
    goto LABEL_43;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_43;
  }
  unint64_t v114 = v29;
  uint64_t v30 = v124 + 2;
  if ((unint64_t)(v124 + 2) >= 9)
  {
LABEL_52:
    (*v117)(v2, v26);
    swift_bridgeObjectRelease();
    goto LABEL_44;
  }
  uint64_t v31 = v112;
  if (!*(void *)(v112 + 16)) {
    goto LABEL_48;
  }
  unint64_t v32 = sub_2550AABB0(v30);
  uint64_t v31 = v112;
  if ((v33 & 1) == 0
    || (uint64_t v34 = *(void *)(v112 + 56) + 40 * v32,
        uint64_t v101 = *(void *)(v34 + 8),
        uint64_t v35 = *(void *)(v34 + 16),
        int v105 = *(unsigned __int8 *)(v34 + 24),
        unint64_t v106 = *(void *)(v34 + 32),
        (unsigned int v36 = (char *)swift_bridgeObjectRetain()) == 0))
  {
LABEL_48:
    swift_bridgeObjectRelease();
    unint64_t v67 = sub_2550AABB0(v30);
    if (v68)
    {
      unint64_t v69 = v67;
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v126[0] = v31;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_2550ABEB4();
        uint64_t v31 = v126[0];
      }
      uint64_t v112 = v31;
      sub_2550B9D1C(v69, v31);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    goto LABEL_52;
  }
  uint64_t v100 = v35;
  uint64_t v103 = v36;
  swift_bridgeObjectRetain();
  unint64_t v37 = v114;
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_2550B5568(v115, v37);
  swift_bridgeObjectRelease();
  unsigned int v113 = _s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(v38, 0);
  swift_release();
  unsigned int v39 = v106;
  if ((v106 & 0x8000000000000000) != 0 || HIDWORD(v106)) {
    goto LABEL_87;
  }
  if (!v106) {
    goto LABEL_84;
  }
  unint64_t v40 = sub_2550B5024(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v42 = v40[2];
  unint64_t v41 = v40[3];
  uint64_t v111 = v40;
  unint64_t v43 = v42 + 1;
  if (v42 >= v41 >> 1)
  {
    uint64_t v102 = v42 + 1;
    v98 = sub_2550B5024((void *)(v41 > 1), v42 + 1, 1, v111);
    unint64_t v43 = v102;
    uint64_t v111 = v98;
  }
  uint64_t v102 = v30;
  uint64_t v44 = v113 % v39;
  uint64_t v45 = v111;
  v111[2] = v43;
  v45[v42 + 4] = v44;
  if (!v105)
  {
LABEL_53:
    swift_bridgeObjectRelease();
    uint64_t v71 = v111[2];
    if (v71)
    {
      char v72 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v26 = v104;
      if ((v72 & 1) == 0) {
        uint64_t v103 = sub_2550B5748((uint64_t)v103);
      }
      uint64_t v73 = 0;
      long long v74 = v111 + 4;
      long long v75 = v103;
      while (1)
      {
        uint64_t v76 = v73 + 1;
        if (__OFADD__(v73, 1)) {
          goto LABEL_81;
        }
        uint64_t v77 = v74[v73];
        uint64_t v78 = v77 + 7;
        if (v77 >= 0) {
          uint64_t v78 = v74[v73];
        }
        uint64_t v79 = v77 - (v78 & 0xFFFFFFFFFFFFFFF8);
        if (v79 >= 1) {
          unint64_t v80 = 2 << (v79 - 1);
        }
        else {
          unint64_t v80 = 2uLL >> (1 - v79);
        }
        if (v77 < -7) {
          goto LABEL_82;
        }
        uint64_t v81 = v78 >> 3;
        if (v81 >= *((void *)v75 + 2)) {
          goto LABEL_83;
        }
        v75[v81 + 32] |= v80;
        ++v73;
        if (v76 == v71) {
          goto LABEL_68;
        }
      }
    }
    uint64_t v26 = v104;
LABEL_68:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v82 = v112;
    LODWORD(v115) = swift_isUniquelyReferenced_nonNull_native();
    v126[0] = v82;
    unint64_t v84 = sub_2550AABB0(v102);
    uint64_t v85 = *(void *)(v82 + 16);
    BOOL v86 = (v83 & 1) == 0;
    uint64_t v87 = v85 + v86;
    if (__OFADD__(v85, v86)) {
      goto LABEL_85;
    }
    if (*(void *)(v82 + 24) >= v87)
    {
      if ((v115 & 1) == 0)
      {
        unint64_t v115 = v84;
        LODWORD(v114) = v83;
        sub_2550ABEB4();
        LOBYTE(v83) = v114;
        unint64_t v84 = v115;
      }
    }
    else
    {
      LODWORD(v114) = v83;
      sub_2550AAF70(v87, v115);
      unint64_t v88 = sub_2550AABB0(v102);
      int v89 = v83 & 1;
      LOBYTE(v83) = v114;
      if ((v114 & 1) != v89) {
        goto LABEL_88;
      }
      unint64_t v84 = v88;
    }
    uint64_t v90 = (void *)v126[0];
    uint64_t v112 = v126[0];
    if (v83)
    {
      uint64_t v91 = *(void *)(v126[0] + 56) + 40 * v84;
      swift_bridgeObjectRelease();
      uint64_t v92 = v101;
      *(void *)uint64_t v91 = v103;
      *(void *)(v91 + 8) = v92;
      *(void *)(v91 + 16) = v100;
      *(unsigned char *)(v91 + 24) = v105;
      *(void *)(v91 + 32) = v106;
    }
    else
    {
      *(void *)(v126[0] + 8 * (v84 >> 6) + 64) |= 1 << v84;
      *(unsigned char *)(v90[6] + v84) = v102;
      uint64_t v93 = v90[7] + 40 * v84;
      uint64_t v94 = v101;
      *(void *)uint64_t v93 = v103;
      *(void *)(v93 + 8) = v94;
      *(void *)(v93 + 16) = v100;
      *(unsigned char *)(v93 + 24) = v105;
      *(void *)(v93 + 32) = v106;
      uint64_t v95 = v90[2];
      BOOL v96 = __OFADD__(v95, 1);
      uint64_t v97 = v95 + 1;
      if (v96) {
        goto LABEL_86;
      }
      v90[2] = v97;
    }
    swift_bridgeObjectRelease();
    goto LABEL_52;
  }
  unsigned int v46 = 0;
  while (1)
  {
    unsigned int v113 = v46 + 1;
    unint64_t v47 = v114;
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_2550B5568(v115, v47);
    swift_bridgeObjectRelease();
    unint64_t v49 = *(void *)(v48 + 16);
    unsigned int v50 = v113;
    if (v49 >= 4) {
      break;
    }
LABEL_26:
    uint64_t v54 = v49 & 0x7FFFFFFFFFFFFFFCLL;
    if ((v49 & 0x7FFFFFFFFFFFFFFCLL) < v49)
    {
      uint64_t v55 = *(void *)(v48 + 16) & 3;
      if ((v49 & 3) != 0)
      {
        uint64_t v56 = v54 + v55 - 1;
        if (v56 >= (uint64_t)v49) {
          goto LABEL_80;
        }
        uint64_t v57 = v48 + 32;
        int v58 = *(unsigned __int8 *)(v48 + 32 + v55 - 1 + v54);
        if (v55 != 1)
        {
          if (v56 >= (uint64_t)v49) {
            goto LABEL_80;
          }
          int v58 = *(unsigned __int8 *)(v57 + v55 - 2 + v54) | (v58 << 8);
          if (v55 != 2)
          {
            if (v56 >= (uint64_t)v49) {
              goto LABEL_80;
            }
            int v58 = *(unsigned __int8 *)(v55 + v54 + v57 - 3) | (v58 << 8);
          }
        }
      }
      else
      {
        int v58 = 0;
      }
      v50 ^= 461845907 * ((380141568 * v58) | ((-862048943 * v58) >> 17));
    }
    if (HIDWORD(v49)) {
      goto LABEL_87;
    }
    swift_release();
    unint64_t v60 = v111[2];
    unint64_t v59 = v111[3];
    unint64_t v61 = v60 + 1;
    if (v60 >= v59 >> 1)
    {
      unint64_t v99 = v60 + 1;
      uint64_t v65 = sub_2550B5024((void *)(v59 > 1), v60 + 1, 1, v111);
      unint64_t v61 = v99;
      uint64_t v111 = v65;
    }
    unsigned int v62 = -2048144789 * (v50 ^ v49 ^ ((v50 ^ v49) >> 16));
    unsigned int v63 = v106;
    uint64_t v64 = v111;
    v111[2] = v61;
    v64[v60 + 4] = ((-1028477387 * (v62 ^ (v62 >> 13))) ^ ((-1028477387 * (v62 ^ (v62 >> 13))) >> 16)) % v63;
    unsigned int v46 = v113;
    if (v113 == v105) {
      goto LABEL_53;
    }
  }
  uint64_t v51 = 0;
  unint64_t v52 = (v49 + 3) >> 2;
  unsigned int v50 = v113;
  while (v52 && v51 + 1 < v49 && v51 + 2 < v49 && v51 + 3 < v49)
  {
    HIDWORD(v53) = (461845907
                  * ((380141568 * *(_DWORD *)(v48 + 32 + v51)) | ((-862048943 * *(_DWORD *)(v48 + 32 + v51)) >> 17))) ^ v50;
    LODWORD(v53) = HIDWORD(v53);
    unsigned int v50 = 5 * (v53 >> 19) - 430675100;
    --v52;
    v51 += 4;
    if (4 * (v49 >> 2) == v51) {
      goto LABEL_26;
    }
  }
  __break(1u);
LABEL_80:
  __break(1u);
LABEL_81:
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_83:
  __break(1u);
LABEL_84:
  __break(1u);
LABEL_85:
  __break(1u);
LABEL_86:
  __break(1u);
LABEL_87:
  sub_2550D9FC0();
  __break(1u);
LABEL_88:
  uint64_t result = sub_2550DA180();
  __break(1u);
  return result;
}

uint64_t sub_2550B88F0()
{
  uint64_t v0 = sub_2550D98C0();
  uint64_t v57 = *(void (***)(char *, uint64_t))(v0 - 8);
  uint64_t v1 = MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v1);
  uint64_t v64 = (char *)v43 - v4;
  uint64_t v5 = sub_2550D98F0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E849A0);
  uint64_t v10 = v9 - 8;
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)v43 - v14;
  sub_2550D9900();
  unint64_t v61 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  uint64_t v62 = v6 + 16;
  v61(v13, v8, v5);
  sub_2550BA1E8();
  sub_2550D9D60();
  uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v63 = v6 + 8;
  unint64_t v60 = v16;
  v16(v8, v5);
  *(void *)&v13[*(int *)(v10 + 44)] = v69[0];
  sub_2550BA240((uint64_t)v13, (uint64_t)v15);
  unint64_t v17 = &v15[*(int *)(v10 + 44)];
  uint64_t v18 = *(void *)v17;
  sub_2550D9D80();
  if (v18 == v66)
  {
    uint64_t v55 = MEMORY[0x263F8EE80];
LABEL_3:
    sub_2550A9778((uint64_t)v15, &qword_269E849A0);
    return v55;
  }
  int v58 = (void (**)(char *, char *, uint64_t))(v57 + 4);
  unint64_t v59 = (void (**)(char *))(v57 + 2);
  uint64_t v48 = &v66;
  unint64_t v47 = (char *)&v65 + 1;
  uint64_t v55 = MEMORY[0x263F8EE80];
  ++v57;
  uint64_t v56 = MEMORY[0x263F8EE58] + 8;
  *(void *)&long long v19 = 136315906;
  long long v46 = v19;
  while (1)
  {
    uint64_t v22 = (void (*)(uint64_t *, void))sub_2550D9DA0();
    unint64_t v23 = v64;
    (*v59)(v64);
    v22(&v66, 0);
    v61(v8, v15, v5);
    sub_2550D9D90();
    v60(v8, v5);
    (*v58)(v3, v23, v0);
    sub_2550D98D0();
    if (!v68) {
      goto LABEL_5;
    }
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v24 = v65 + 2;
    if ((unint64_t)(v65 + 2) > 8) {
      goto LABEL_6;
    }
    sub_2550D98D0();
    if (!v68)
    {
LABEL_5:
      sub_2550A9778((uint64_t)&v66, &qword_269E84858);
      goto LABEL_6;
    }
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v51 = v65;
    sub_2550B9C00(v65);
    uint64_t v54 = v25;
    int v53 = v26;
    uint64_t v66 = 0;
    unint64_t v67 = 0xE000000000000000;
    LOBYTE(v65) = v24;
    sub_2550D9FB0();
    unint64_t v27 = v67;
    uint64_t v49 = v66;
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_2550D9A00();
    __swift_project_value_buffer(v28, (uint64_t)qword_26B279BA0);
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_2550D99E0();
    unint64_t v52 = v27;
    uint64_t v30 = v29;
    os_log_type_t v31 = sub_2550D9DC0();
    int v32 = v31;
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v33 = swift_slowAlloc();
      int v45 = v32;
      uint64_t v34 = v33;
      uint64_t v44 = swift_slowAlloc();
      uint64_t v66 = v44;
      *(_DWORD *)uint64_t v34 = v46;
      unsigned int v50 = v30;
      v43[1] = v34 + 4;
      unint64_t v35 = v52;
      swift_bridgeObjectRetain();
      uint64_t v65 = sub_2550A7884(v49, v35, &v66);
      uint64_t v49 = v24;
      sub_2550D9E90();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v34 + 12) = 2048;
      uint64_t v65 = v51;
      sub_2550D9E90();
      *(_WORD *)(v34 + 22) = 2048;
      uint64_t v65 = v54;
      LOBYTE(v24) = v49;
      sub_2550D9E90();
      *(_WORD *)(v34 + 32) = 256;
      LOBYTE(v65) = v53;
      sub_2550D9E90();
      _os_log_impl(&dword_25509D000, v50, (os_log_type_t)v45, "Building BF for %s count %ld buckets %ld and hashes %hhu", (uint8_t *)v34, 0x23u);
      uint64_t v36 = v44;
      swift_arrayDestroy();
      MEMORY[0x25A2881E0](v36, -1, -1);
      MEMORY[0x25A2881E0](v34, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v37 = v54;
    if ((v54 & 7) != 0) {
      break;
    }
    uint64_t v38 = v54 + 7;
    if (v54 >= 0) {
      uint64_t v38 = v54;
    }
    if (v54 <= -8) {
      goto LABEL_25;
    }
    size_t v39 = v38 >> 3;
    uint64_t v40 = MEMORY[0x263F8EE78];
    if ((unint64_t)v54 >= 8)
    {
      uint64_t v40 = sub_2550D9CD0();
      *(void *)(v40 + 16) = v39;
      bzero((void *)(v40 + 32), v39);
      uint64_t v37 = v54;
    }
    v69[0] = v40;
    v69[1] = v37;
    v69[2] = v39;
    char v70 = v53;
    uint64_t v71 = v37;
    uint64_t v41 = v55;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v66 = v41;
    sub_2550BA07C((uint64_t)v69, v24, isUniquelyReferenced_nonNull_native);
    uint64_t v55 = v66;
    swift_bridgeObjectRelease();
LABEL_6:
    (*v57)(v3, v0);
    uint64_t v21 = *(void *)v17;
    sub_2550D9D80();
    if (v21 == v66) {
      goto LABEL_3;
    }
  }
  sub_2550D9FD0();
  __break(1u);
LABEL_25:
  uint64_t result = sub_2550D9FC0();
  __break(1u);
  return result;
}

uint64_t sub_2550B9188@<X0>(uint64_t a1@<X8>)
{
  uint64_t v49 = a1;
  uint64_t v1 = sub_2550D98F0();
  uint64_t v42 = *(void *)(v1 - 8);
  uint64_t v43 = v1;
  MEMORY[0x270FA5388](v1);
  uint64_t v41 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_2550D9940();
  uint64_t v54 = *(void *)(v3 - 8);
  uint64_t v55 = v3;
  MEMORY[0x270FA5388](v3);
  int v53 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_2550D96F0();
  uint64_t v51 = *(char **)(v5 - 8);
  unint64_t v52 = (char *)v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v48 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C58);
  MEMORY[0x270FA5388](v7 - 8);
  long long v46 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_2550D97D0();
  uint64_t v56 = *(void *)(v9 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  unint64_t v47 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v40 - v12;
  uint64_t v14 = sub_2550D99D0();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  unint64_t v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_2550D9970();
  uint64_t v57 = *(void *)(v18 - 8);
  uint64_t v58 = v18;
  uint64_t v19 = MEMORY[0x270FA5388](v18);
  int v45 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v22 = (char *)&v40 - v21;
  uint64_t v44 = sub_2550BDA34();
  sub_2550BEFF0((uint64_t)&unk_270441EC0);
  swift_arrayDestroy();
  sub_2550BEFF0((uint64_t)&unk_270441F20);
  uint64_t v23 = v9;
  uint64_t v24 = v56;
  swift_arrayDestroy();
  (*(void (**)(char *, void, uint64_t))(v15 + 104))(v17, *MEMORY[0x263F1BF38], v14);
  uint64_t v25 = v49;
  sub_2550D9960();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56))(v46, 1, 1, v23);
  (*((void (**)(char *, void, char *))v51 + 13))(v48, *MEMORY[0x263F06E50], v52);
  swift_bridgeObjectRetain();
  sub_2550D97B0();
  int v26 = *(void (**)(char *, char *, uint64_t))(v24 + 16);
  unint64_t v52 = v13;
  v26(v47, v13, v23);
  unint64_t v27 = *(void (**)(char *, char *, uint64_t))(v57 + 16);
  uint64_t v51 = v22;
  v27(v45, v22, v58);
  sub_2550BEC38(MEMORY[0x263F8EE78]);
  sub_2550D98B0();
  if (qword_26B278B80 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_2550D9A00();
  __swift_project_value_buffer(v28, (uint64_t)qword_26B279BA0);
  uint64_t v29 = v53;
  uint64_t v30 = v54;
  uint64_t v31 = v55;
  (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v53, v25, v55);
  int v32 = sub_2550D99E0();
  os_log_type_t v33 = sub_2550D9DC0();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = (uint8_t *)swift_slowAlloc();
    uint64_t v50 = v23;
    unint64_t v35 = v34;
    *(_DWORD *)uint64_t v34 = 134217984;
    uint64_t v36 = v41;
    sub_2550D9900();
    uint64_t v37 = sub_2550D98E0();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v36, v43);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v29, v31);
    uint64_t v59 = v37;
    uint64_t v24 = v56;
    sub_2550D9E90();
    _os_log_impl(&dword_25509D000, v32, v33, "Number of rows: %ld", v35, 0xCu);
    uint64_t v38 = v35;
    uint64_t v23 = v50;
    MEMORY[0x25A2881E0](v38, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v30 + 8))(v29, v31);
  }

  (*(void (**)(char *, uint64_t))(v24 + 8))(v52, v23);
  return (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v51, v58);
}

uint64_t SenderBloomFilterBuilder.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SenderBloomFilterBuilder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 40, 7);
}

void sub_2550B9C00(uint64_t a1)
{
  if (a1 == 0x8000000000000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  double v3 = ceil(log(*(long double *)(v1 + 32)) * (double)-a1 / 0.480453014);
  if ((~*(void *)&v3 & 0x7FF0000000000000) == 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v3 >= 9.22337204e18)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v4 = (uint64_t)v3;
  if ((uint64_t)v3 <= 0) {
    uint64_t v5 = -(-(uint64_t)v3 & 7);
  }
  else {
    uint64_t v5 = (uint64_t)v3 & 7;
  }
  if (__OFADD__(v4, 8 - v5)) {
    goto LABEL_17;
  }
  double v6 = ceil((double)v4 / (double)a1 * 0.693147181);
  if ((~*(void *)&v6 & 0x7FF0000000000000) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v6 <= -1.0)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v6 >= 256.0) {
LABEL_20:
  }
    __break(1u);
}

unint64_t sub_2550B9D1C(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2550D9F20();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_2550DA1F0();
        sub_2550DA200();
        uint64_t result = sub_2550DA210();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          uint64_t v13 = (unsigned char *)(v12 + v3);
          uint64_t v14 = (unsigned char *)(v12 + v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *uint64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = v15 + 40 * v3;
          unint64_t v17 = (long long *)(v15 + 40 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= (unint64_t)v17 + 40))
          {
            long long v9 = *v17;
            long long v10 = v17[1];
            *(void *)(v16 + 32) = *((void *)v17 + 4);
            *(_OWORD *)unint64_t v16 = v9;
            *(_OWORD *)(v16 + 16) = v10;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *uint64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_2550B9EE4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_2550D9F20();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(void *)(a2 + 48);
        long long v10 = (void *)(v9 + 8 * v6);
        uint64_t result = sub_2550DA1E0();
        unint64_t v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            uint64_t v14 = (void *)(v9 + 8 * v3);
            if (v3 != v6 || v14 >= v10 + 1) {
              *uint64_t v14 = *v10;
            }
            uint64_t v15 = *(void *)(a2 + 56);
            unint64_t v16 = (void *)(v15 + 8 * v3);
            unint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 1))
            {
              *unint64_t v16 = *v17;
              int64_t v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    uint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    uint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *uint64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_2550BA07C(uint64_t a1, unsigned __int8 a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_2550AABB0(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 < result || (a3 & 1) == 0)
  {
    if (v15 < result || (a3 & 1) != 0)
    {
      sub_2550AAF70(result, a3 & 1);
      uint64_t result = sub_2550AABB0(a2);
      if ((v14 & 1) != (v18 & 1))
      {
LABEL_17:
        uint64_t result = sub_2550DA180();
        __break(1u);
        return result;
      }
      unint64_t v10 = result;
      unint64_t v16 = (void *)*v4;
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
    uint64_t result = (uint64_t)sub_2550ABEB4();
  }
  unint64_t v16 = (void *)*v4;
  if ((v14 & 1) == 0)
  {
LABEL_13:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = a2;
    uint64_t v19 = v16[7] + 40 * v10;
    long long v20 = *(_OWORD *)a1;
    long long v21 = *(_OWORD *)(a1 + 16);
    *(void *)(v19 + 32) = *(void *)(a1 + 32);
    *(_OWORD *)uint64_t v19 = v20;
    *(_OWORD *)(v19 + 16) = v21;
    uint64_t v22 = v16[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (!v23)
    {
      v16[2] = v24;
      return result;
    }
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v17 = v16[7] + 40 * v10;

  return sub_2550BA330(a1, v17);
}

unint64_t sub_2550BA1E8()
{
  unint64_t result = qword_269E849A8;
  if (!qword_269E849A8)
  {
    sub_2550D98F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E849A8);
  }
  return result;
}

uint64_t sub_2550BA240(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E849A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for SenderBloomFilterBuilder()
{
  return self;
}

uint64_t method lookup function for SenderBloomFilterBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for SenderBloomFilterBuilder);
}

uint64_t dispatch thunk of SenderBloomFilterBuilder.__allocating_init(csvFilePath:probabilityOfFalsePositives:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of SenderBloomFilterBuilder.build()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104))();
}

uint64_t sub_2550BA330(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t DecisionRequest.senderName.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DecisionRequest.senderEmail.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DecisionRequest.senderEmail.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t (*DecisionRequest.senderEmail.modify())()
{
  return nullsub_1;
}

uint64_t DecisionRequest.receiverEmail.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DecisionRequest.emailSubject.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DecisionRequest.isUnsubscribeHeaderPresent.getter()
{
  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t DecisionRequest.isSenderVIP.getter()
{
  return *(unsigned __int8 *)(v0 + 65);
}

uint64_t DecisionRequest.isSenderInAddressBook.getter()
{
  return *(unsigned __int8 *)(v0 + 66);
}

uint64_t DecisionRequest.isSenderRecentContact.getter()
{
  return *(unsigned __int8 *)(v0 + 67);
}

uint64_t DecisionRequest.isSenderPrimary.getter()
{
  return *(unsigned __int8 *)(v0 + 68);
}

uint64_t DecisionRequest.isNonPersonalAccount.getter()
{
  return *(unsigned __int8 *)(v0 + 69);
}

uint64_t DecisionRequest.localRuleCategory.getter()
{
  uint64_t v1 = *(void *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall DecisionRequest.init(senderName:senderEmail:emailSubject:isUnsubscribeHeaderPresent:isSenderVIP:isSenderInAddressBook:)(MCCKitCategorization::DecisionRequest *__return_ptr retstr, Swift::String senderName, Swift::String senderEmail, Swift::String emailSubject, Swift::Bool isUnsubscribeHeaderPresent, Swift::Bool isSenderVIP, Swift::Bool isSenderInAddressBook)
{
  retstr->senderName = senderName;
  retstr->senderEmail = senderEmail;
  retstr->receiverEmail.value._uint64_t countAndFlagsBits = 0;
  retstr->receiverEmail.value._object = 0;
  retstr->emailSubject = emailSubject;
  retstr->isUnsubscribeHeaderPresent = isUnsubscribeHeaderPresent;
  retstr->isSenderVIP = isSenderVIP;
  retstr->isSenderInAddressBook = isSenderInAddressBook;
  *(_WORD *)&retstr->isSenderRecentContact = 0;
  retstr->isNonPersonalAccount = 0;
  retstr->localRuleCategory.value._uint64_t countAndFlagsBits = 0;
  retstr->localRuleCategory.value._object = 0;
}

void __swiftcall DecisionRequest.init(senderName:senderEmail:emailSubject:isUnsubscribeHeaderPresent:isSenderVIP:isSenderInAddressBook:receiverEmail:)(MCCKitCategorization::DecisionRequest *__return_ptr retstr, Swift::String senderName, Swift::String senderEmail, Swift::String emailSubject, Swift::Bool isUnsubscribeHeaderPresent, Swift::Bool isSenderVIP, Swift::Bool isSenderInAddressBook, Swift::String receiverEmail)
{
  retstr->senderName = senderName;
  retstr->senderEmail = senderEmail;
  retstr->receiverEmail.value = receiverEmail;
  retstr->emailSubject = emailSubject;
  retstr->isUnsubscribeHeaderPresent = isUnsubscribeHeaderPresent;
  retstr->isSenderVIP = isSenderVIP;
  retstr->isSenderInAddressBook = isSenderInAddressBook;
  *(_WORD *)&retstr->isSenderRecentContact = 0;
  retstr->isNonPersonalAccount = 0;
  retstr->localRuleCategory.value._uint64_t countAndFlagsBits = 0;
  retstr->localRuleCategory.value._object = 0;
}

void __swiftcall DecisionRequest.init(senderName:senderEmail:emailSubject:isUnsubscribeHeaderPresent:isSenderVIP:isSenderInAddressBook:isSenderRecentContact:isSenderPrimary:)(MCCKitCategorization::DecisionRequest *__return_ptr retstr, Swift::String senderName, Swift::String senderEmail, Swift::String emailSubject, Swift::Bool isUnsubscribeHeaderPresent, Swift::Bool isSenderVIP, Swift::Bool isSenderInAddressBook, Swift::Bool isSenderRecentContact, Swift::Bool isSenderPrimary)
{
  retstr->senderName = senderName;
  retstr->senderEmail = senderEmail;
  retstr->receiverEmail.value._uint64_t countAndFlagsBits = 0;
  retstr->receiverEmail.value._object = 0;
  retstr->emailSubject = emailSubject;
  retstr->isUnsubscribeHeaderPresent = isUnsubscribeHeaderPresent;
  retstr->isSenderVIP = isSenderVIP;
  retstr->isSenderInAddressBook = isSenderInAddressBook;
  retstr->isSenderRecentContact = isSenderRecentContact;
  *(_WORD *)&retstr->isSenderPrimary = isSenderPrimary;
  retstr->localRuleCategory.value._uint64_t countAndFlagsBits = 0;
  retstr->localRuleCategory.value._object = 0;
}

void __swiftcall DecisionRequest.init(senderName:senderEmail:emailSubject:isUnsubscribeHeaderPresent:isSenderVIP:isSenderInAddressBook:isSenderRecentContact:isSenderPrimary:isNonPersonalAccount:)(MCCKitCategorization::DecisionRequest *__return_ptr retstr, Swift::String senderName, Swift::String senderEmail, Swift::String emailSubject, Swift::Bool isUnsubscribeHeaderPresent, Swift::Bool isSenderVIP, Swift::Bool isSenderInAddressBook, Swift::Bool isSenderRecentContact, Swift::Bool isSenderPrimary, Swift::Bool isNonPersonalAccount)
{
  retstr->senderName = senderName;
  retstr->senderEmail = senderEmail;
  retstr->receiverEmail.value._uint64_t countAndFlagsBits = 0;
  retstr->receiverEmail.value._object = 0;
  retstr->emailSubject = emailSubject;
  retstr->isUnsubscribeHeaderPresent = isUnsubscribeHeaderPresent;
  retstr->isSenderVIP = isSenderVIP;
  retstr->isSenderInAddressBook = isSenderInAddressBook;
  retstr->isSenderRecentContact = isSenderRecentContact;
  retstr->isSenderPrimary = isSenderPrimary;
  retstr->isNonPersonalAccount = isNonPersonalAccount;
  retstr->localRuleCategory.value._uint64_t countAndFlagsBits = 0;
  retstr->localRuleCategory.value._object = 0;
}

void __swiftcall DecisionRequest.init(senderName:senderEmail:emailSubject:receiverEmail:isUnsubscribeHeaderPresent:isSenderVIP:isSenderInAddressBook:isSenderRecentContact:isSenderPrimary:isNonPersonalAccount:)(MCCKitCategorization::DecisionRequest *__return_ptr retstr, Swift::String senderName, Swift::String senderEmail, Swift::String emailSubject, Swift::String receiverEmail, Swift::Bool isUnsubscribeHeaderPresent, Swift::Bool isSenderVIP, Swift::Bool isSenderInAddressBook, Swift::Bool isSenderRecentContact, Swift::Bool isSenderPrimary, Swift::Bool isNonPersonalAccount)
{
  retstr->senderName = senderName;
  retstr->senderEmail = senderEmail;
  retstr->receiverEmail.value = receiverEmail;
  retstr->emailSubject = emailSubject;
  retstr->isUnsubscribeHeaderPresent = isUnsubscribeHeaderPresent;
  retstr->isSenderVIP = isSenderVIP;
  retstr->isSenderInAddressBook = isSenderInAddressBook;
  retstr->isSenderRecentContact = isSenderRecentContact;
  retstr->isSenderPrimary = isSenderPrimary;
  retstr->isNonPersonalAccount = isNonPersonalAccount;
  retstr->localRuleCategory.value._uint64_t countAndFlagsBits = 0;
  retstr->localRuleCategory.value._object = 0;
}

uint64_t destroy for DecisionRequest()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DecisionRequest(uint64_t a1, uint64_t a2)
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
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  *(unsigned char *)(a1 + 69) = *(unsigned char *)(a2 + 69);
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DecisionRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  *(unsigned char *)(a1 + 66) = *(unsigned char *)(a2 + 66);
  *(unsigned char *)(a1 + 67) = *(unsigned char *)(a2 + 67);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  *(unsigned char *)(a1 + 69) = *(unsigned char *)(a2 + 69);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for DecisionRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  *(unsigned char *)(a1 + 66) = *(unsigned char *)(a2 + 66);
  *(unsigned char *)(a1 + 67) = *(unsigned char *)(a2 + 67);
  *(unsigned char *)(a1 + 68) = *(unsigned char *)(a2 + 68);
  *(unsigned char *)(a1 + 69) = *(unsigned char *)(a2 + 69);
  uint64_t v8 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DecisionRequest(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DecisionRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DecisionRequest()
{
  return &type metadata for DecisionRequest;
}

char *static AssetProtection.readObfuscatedContents(fileURL:fallback:)(uint64_t a1, int a2)
{
  LODWORD(v32) = a2;
  uint64_t v3 = sub_2550D9A20();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v30 = v3;
  uint64_t v31 = v4;
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2550D9A50();
  uint64_t v29 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  char v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2550D97D0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v14 = *(void (**)(char *, uint64_t))(v11 + 16);
  uint64_t v33 = v15;
  v14(v13, a1);
  id v16 = objc_msgSend(self, sel_defaultManager);
  sub_2550D9790();
  uint64_t v17 = (void *)sub_2550D9AA0();
  swift_bridgeObjectRelease();
  unsigned int v18 = objc_msgSend(v16, sel_fileExistsAtPath_, v17);

  if (!v18)
  {
    unint64_t v26 = v34;
    if (v32)
    {
      uint64_t v27 = sub_2550D97E0();
      if (!v26)
      {
        uint64_t v6 = (char *)v27;
        (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v33);
        return v6;
      }
    }
    else
    {
      sub_2550BAD8C();
      swift_allocError();
      swift_willThrow();
    }
LABEL_8:
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v33);
    return v6;
  }
  uint64_t v32 = v7;
  uint64_t v19 = v31;
  unint64_t v20 = v34;
  uint64_t v21 = sub_2550D97E0();
  if (v20) {
    goto LABEL_8;
  }
  uint64_t v23 = v21;
  unint64_t v24 = v22;
  sub_2550AA394(v21, v22);
  unint64_t v34 = v24;
  sub_2550D9A40();
  uint64_t v35 = sub_2550BB004();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E84840);
  sub_2550AC560();
  uint64_t v25 = v6;
  sub_2550D9A10();
  uint64_t v6 = (char *)sub_2550D9A30();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v25, v30);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v9, v32);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v33);
  sub_2550AC604(v23, v34);
  return v6;
}

unint64_t sub_2550BAD8C()
{
  unint64_t result = qword_269E849B0;
  if (!qword_269E849B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E849B0);
  }
  return result;
}

uint64_t sub_2550BADE0()
{
  return 1;
}

uint64_t sub_2550BADE8()
{
  return sub_2550DA210();
}

uint64_t sub_2550BAE2C()
{
  return sub_2550DA200();
}

uint64_t sub_2550BAE54()
{
  return sub_2550DA210();
}

uint64_t sub_2550BAE94(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - result;
  if (__OFSUB__(a2, result)) {
    goto LABEL_21;
  }
  uint64_t v5 = result;
  unint64_t result = MEMORY[0x263F8EE78];
  if (v4)
  {
    uint64_t v22 = MEMORY[0x263F8EE78];
    uint64_t v21 = v5;
    unint64_t result = sub_2550C478C(0, v4 & ~(v4 >> 63), 0);
    uint64_t v9 = v21;
    if (a2 < v21 || v4 < 0) {
      goto LABEL_22;
    }
    unint64_t result = v22;
    uint64_t v10 = *(void *)(a3 + 16);
    if (v10 <= v21) {
      uint64_t v10 = v21;
    }
    uint64_t v11 = v10 - v21;
    if (*(void *)(a4 + 16) <= v21) {
      uint64_t v12 = v21;
    }
    else {
      uint64_t v12 = *(void *)(a4 + 16);
    }
    uint64_t v13 = v12 - v21;
    char v14 = (char *)(a3 + v21 + 32);
    uint64_t v15 = (char *)(a4 + v21 + 32);
    while ((v9 & 0x8000000000000000) == 0)
    {
      if (!v11) {
        goto LABEL_19;
      }
      if (!v13) {
        goto LABEL_20;
      }
      char v16 = *v14;
      char v17 = *v15;
      uint64_t v23 = result;
      unint64_t v19 = *(void *)(result + 16);
      unint64_t v18 = *(void *)(result + 24);
      if (v19 >= v18 >> 1)
      {
        char v20 = *v14;
        sub_2550C478C(v18 > 1, v19 + 1, 1);
        char v16 = v20;
        uint64_t v9 = v21;
        unint64_t result = v23;
      }
      *(void *)(result + 16) = v19 + 1;
      --v13;
      *(unsigned char *)(result + v19 + 32) = v17 ^ v16;
      --v11;
      ++v14;
      ++v15;
      if (!--v4) {
        return result;
      }
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
  }
  return result;
}

uint64_t sub_2550BB004()
{
  uint64_t v43 = MEMORY[0x263F8EE78];
  sub_2550C478C(0, 32, 0);
  uint64_t v0 = 0;
  uint64_t v1 = v43;
  do
  {
    uint64_t v42 = 0;
    MEMORY[0x25A2881F0](&v42, 8);
    if ((_BYTE)v42)
    {
      unsigned int v2 = (255 * v42) >> 8;
    }
    else
    {
      do
      {
        uint64_t v42 = 0;
        MEMORY[0x25A2881F0](&v42, 8);
      }
      while (!(_BYTE)v42);
      LOBYTE(v2) = (unsigned __int16)(255 * v42) >> 8;
    }
    uint64_t v43 = v1;
    unint64_t v4 = *(void *)(v1 + 16);
    unint64_t v3 = *(void *)(v1 + 24);
    if (v4 >= v3 >> 1)
    {
      sub_2550C478C(v3 > 1, v4 + 1, 1);
      uint64_t v1 = v43;
    }
    ++v0;
    *(void *)(v1 + 16) = v4 + 1;
    *(unsigned char *)(v1 + 32 + v4) = v2;
  }
  while (v0 != 32);
  if (v4 != 31) {
    goto LABEL_77;
  }
  swift_retain();
  uint64_t v5 = sub_2550BAE94(0, 32, (uint64_t)&unk_270441D00, v1);
  swift_release();
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_2550BAE94(0, 32, (uint64_t)&unk_270441D40, v1);
  swift_release();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_2550BAE94(0, 32, (uint64_t)&unk_270441D80, v1);
  swift_release();
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_2550BAE94(0, 32, (uint64_t)&unk_270441DC0, v1);
  swift_release();
  if (*(void *)(v5 + 16) < 0x20uLL)
  {
    __break(1u);
LABEL_63:
    swift_bridgeObjectRelease();
    uint64_t v11 = sub_2550CDE38(v5, v5 + 32, 24, 0x41uLL);
    goto LABEL_16;
  }
  sub_2550DA150();
  swift_unknownObjectRetain_n();
  uint64_t v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_bridgeObjectRelease();
    uint64_t v9 = MEMORY[0x263F8EE78];
  }
  uint64_t v10 = *(void *)(v9 + 16);
  swift_release();
  if (v10 != 8) {
    goto LABEL_63;
  }
  uint64_t v11 = swift_dynamicCastClass();
  if (!v11)
  {
    swift_bridgeObjectRelease();
    uint64_t v11 = MEMORY[0x263F8EE78];
  }
LABEL_16:
  swift_bridgeObjectRelease();
  if (*(void *)(v1 + 16) < 0x20uLL)
  {
    __break(1u);
LABEL_65:
    swift_release();
    uint64_t v14 = sub_2550CDE38(v1, v1 + 32, 24, 0x41uLL);
    goto LABEL_22;
  }
  swift_retain_n();
  uint64_t v12 = swift_dynamicCastClass();
  if (!v12)
  {
    swift_release();
    uint64_t v12 = MEMORY[0x263F8EE78];
  }
  uint64_t v13 = *(void *)(v12 + 16);
  swift_release();
  if (v13 != 8) {
    goto LABEL_65;
  }
  uint64_t v14 = swift_dynamicCastClass();
  if (!v14)
  {
    swift_release();
    uint64_t v14 = MEMORY[0x263F8EE78];
  }
LABEL_22:
  swift_release();
  uint64_t v15 = *(void *)(v14 + 16);
  if (v15 != *(void *)(v11 + 16)) {
    goto LABEL_77;
  }
  uint64_t v16 = sub_2550BAE94(0, v15, v11, v14);
  swift_release();
  swift_release();
  if (*(void *)(v6 + 16) < 8uLL)
  {
    __break(1u);
LABEL_67:
    swift_bridgeObjectRelease();
    uint64_t v19 = sub_2550CDE38(v6, v6 + 32, 0, 0x11uLL);
    goto LABEL_29;
  }
  swift_unknownObjectRetain_n();
  uint64_t v17 = swift_dynamicCastClass();
  if (!v17)
  {
    swift_bridgeObjectRelease();
    uint64_t v17 = MEMORY[0x263F8EE78];
  }
  uint64_t v18 = *(void *)(v17 + 16);
  swift_release();
  if (v18 != 8) {
    goto LABEL_67;
  }
  uint64_t v19 = swift_dynamicCastClass();
  if (!v19)
  {
    swift_bridgeObjectRelease();
    uint64_t v19 = MEMORY[0x263F8EE78];
  }
LABEL_29:
  swift_bridgeObjectRelease();
  if (*(void *)(v1 + 16) < 8uLL)
  {
    __break(1u);
LABEL_69:
    swift_release();
    uint64_t v22 = sub_2550CDE38(v1, v1 + 32, 0, 0x11uLL);
    goto LABEL_35;
  }
  swift_retain_n();
  uint64_t v20 = swift_dynamicCastClass();
  if (!v20)
  {
    swift_release();
    uint64_t v20 = MEMORY[0x263F8EE78];
  }
  uint64_t v21 = *(void *)(v20 + 16);
  swift_release();
  if (v21 != 8) {
    goto LABEL_69;
  }
  uint64_t v22 = swift_dynamicCastClass();
  if (!v22)
  {
    swift_release();
    uint64_t v22 = MEMORY[0x263F8EE78];
  }
LABEL_35:
  swift_release();
  uint64_t v23 = *(void *)(v22 + 16);
  if (v23 != *(void *)(v19 + 16)) {
    goto LABEL_77;
  }
  uint64_t v24 = sub_2550BAE94(0, v23, v19, v22);
  swift_release();
  swift_release();
  if (*(void *)(v7 + 16) < 0x18uLL)
  {
    __break(1u);
LABEL_71:
    swift_bridgeObjectRelease();
    uint64_t v27 = sub_2550CDE38(v7, v7 + 32, 16, 0x31uLL);
    goto LABEL_42;
  }
  swift_unknownObjectRetain_n();
  uint64_t v25 = swift_dynamicCastClass();
  if (!v25)
  {
    swift_bridgeObjectRelease();
    uint64_t v25 = MEMORY[0x263F8EE78];
  }
  uint64_t v26 = *(void *)(v25 + 16);
  swift_release();
  if (v26 != 8) {
    goto LABEL_71;
  }
  uint64_t v27 = swift_dynamicCastClass();
  if (!v27)
  {
    swift_bridgeObjectRelease();
    uint64_t v27 = MEMORY[0x263F8EE78];
  }
LABEL_42:
  swift_bridgeObjectRelease();
  if (*(void *)(v1 + 16) < 0x10uLL)
  {
    __break(1u);
LABEL_73:
    swift_release();
    uint64_t v30 = sub_2550CDE38(v1, v1 + 32, 16, 0x31uLL);
    goto LABEL_48;
  }
  swift_retain_n();
  uint64_t v28 = swift_dynamicCastClass();
  if (!v28)
  {
    swift_release();
    uint64_t v28 = MEMORY[0x263F8EE78];
  }
  uint64_t v29 = *(void *)(v28 + 16);
  swift_release();
  if (v29 != 8) {
    goto LABEL_73;
  }
  uint64_t v30 = swift_dynamicCastClass();
  if (!v30)
  {
    swift_release();
    uint64_t v30 = MEMORY[0x263F8EE78];
  }
LABEL_48:
  swift_release();
  uint64_t v31 = *(void *)(v30 + 16);
  if (v31 != *(void *)(v27 + 16)) {
    goto LABEL_77;
  }
  uint64_t v32 = sub_2550BAE94(0, v31, v27, v30);
  swift_release();
  swift_release();
  if (*(void *)(v8 + 16) < 0x10uLL)
  {
    __break(1u);
LABEL_75:
    swift_bridgeObjectRelease();
    uint64_t v35 = sub_2550CDE38(v8, v8 + 32, 8, 0x21uLL);
    goto LABEL_55;
  }
  swift_unknownObjectRetain_n();
  uint64_t v33 = swift_dynamicCastClass();
  if (!v33)
  {
    swift_bridgeObjectRelease();
    uint64_t v33 = MEMORY[0x263F8EE78];
  }
  uint64_t v34 = *(void *)(v33 + 16);
  swift_release();
  if (v34 != 8) {
    goto LABEL_75;
  }
  uint64_t v35 = swift_dynamicCastClass();
  if (!v35)
  {
    swift_bridgeObjectRelease();
    uint64_t v35 = MEMORY[0x263F8EE78];
  }
LABEL_55:
  swift_bridgeObjectRelease();
  swift_unknownObjectRetain_n();
  uint64_t v36 = swift_dynamicCastClass();
  if (!v36)
  {
    swift_release();
    uint64_t v36 = MEMORY[0x263F8EE78];
  }
  uint64_t v37 = *(void *)(v36 + 16);
  swift_release();
  if (v37 == 8)
  {
    uint64_t v38 = swift_dynamicCastClass();
    if (!v38)
    {
      swift_release();
      uint64_t v38 = MEMORY[0x263F8EE78];
    }
  }
  else
  {
    swift_release();
    uint64_t v38 = sub_2550CDE38(v1, v1 + 32, 8, 0x21uLL);
  }
  swift_release();
  uint64_t v39 = *(void *)(v38 + 16);
  if (v39 == *(void *)(v35 + 16))
  {
    uint64_t v40 = sub_2550BAE94(0, v39, v35, v38);
    swift_release();
    swift_release();
    uint64_t v43 = v24;
    sub_2550C57A0(v40);
    sub_2550C57A0(v32);
    sub_2550C57A0(v16);
    return v43;
  }
LABEL_77:
  uint64_t result = sub_2550D9FD0();
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for AssetProtection()
{
  return &type metadata for AssetProtection;
}

uint64_t getEnumTagSinglePayload for AssetProtection.Error(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for AssetProtection.Error(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2550BB8DCLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2550BB904()
{
  return 0;
}

ValueMetadata *type metadata accessor for AssetProtection.Error()
{
  return &type metadata for AssetProtection.Error;
}

unint64_t sub_2550BB924()
{
  unint64_t result = qword_269E849B8;
  if (!qword_269E849B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E849B8);
  }
  return result;
}

uint64_t sub_2550BB978()
{
  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_2550BB9AC(char a1)
{
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v1 + 16) = a1;
  return result;
}

uint64_t (*sub_2550BB9EC())()
{
  return j__swift_endAccess;
}

uint64_t MCCNLP.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  MCCNLP.init()();
  return v0;
}

uint64_t MCCNLP.init()()
{
  *(void *)&long long v60 = type metadata accessor for BloomFilterData(0);
  MEMORY[0x270FA5388](v60);
  *(void *)&long long v57 = (char *)&v45 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_2550D97D0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  *(void *)&long long v58 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v45 - v6;
  uint64_t v8 = (int *)type metadata accessor for BlackPearlLevels();
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_allocWithZone(MEMORY[0x263F08AE8]);
  id v12 = sub_2550BCDC4(0x100000000000001ALL, 0x80000002550DD7E0, 0);
  v65[0] = xmmword_2550DB950;
  v65[1] = xmmword_2550DB960;
  v65[2] = xmmword_2550DB970;
  unint64_t v66 = 0x80000002550DD7E0;
  id v67 = v12;
  uint64_t v13 = type metadata accessor for TrialLoader();
  swift_allocObject();
  uint64_t v14 = TrialLoader.init()();
  *(void *)(v0 + 56) = v13;
  *(void *)(v0 + 64) = &protocol witness table for TrialLoader;
  *(void *)(v0 + 32) = v14;
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 32), v13);
  *(unsigned char *)(v0 + 16) = (off_2704426A8() & 1) == 0;
  uint64_t v15 = *(void *)(v0 + 56);
  uint64_t v16 = *(void *)(v0 + 64);
  uint64_t v56 = v0;
  __swift_project_boxed_opaque_existential_1((void *)(v0 + 32), v15);
  (*(void (**)(uint64_t, uint64_t))(v16 + 272))(v15, v16);
  uint64_t v17 = v0 + OBJC_IVAR____TtC20MCCKitCategorization6MCCNLP_blackPearlLevels;
  sub_2550A2C1C((uint64_t)v10, v0 + OBJC_IVAR____TtC20MCCKitCategorization6MCCNLP_blackPearlLevels);
  swift_beginAccess();
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v18(v7, v17 + v8[9] + (uint64_t)*(int *)(v60 + 24), v2);
  type metadata accessor for NERRule();
  uint64_t v19 = swift_allocObject();
  uint64_t v48 = type metadata accessor for BloomFilterSerDe();
  static BloomFilterSerDe.readFromFile(withFilePath:)((uint64_t)v7, (uint64_t)&v61);
  *(void *)&long long v59 = *(void *)(v3 + 8);
  ((void (*)(char *, uint64_t))v59)(v7, v2);
  uint64_t v47 = v3 + 8;
  char v20 = v63;
  uint64_t v21 = v64;
  uint64_t v55 = v19;
  *(void *)(v19 + 16) = v61;
  *(_OWORD *)(v19 + 24) = v62;
  *(unsigned char *)(v19 + 40) = v20;
  *(void *)(v19 + 48) = v21;
  v18(v7, v17 + v8[10], v2);
  uint64_t v22 = type metadata accessor for DomainMapDataFrame();
  int v53 = v10;
  uint64_t v23 = v22;
  swift_allocObject();
  uint64_t v54 = DomainMapDataFrame.init(withFileAtPath:)((uint64_t)v7);
  v18(v7, v17 + v8[11], v2);
  type metadata accessor for TokenMapDataFrame();
  swift_allocObject();
  uint64_t v52 = TokenMapDataFrame.init(withFileAtPath:)((uint64_t)v7);
  v18(v7, v17 + v8[12], v2);
  swift_allocObject();
  uint64_t v51 = TokenMapDataFrame.init(withFileAtPath:)((uint64_t)v7);
  v18(v7, v17 + v8[13], v2);
  swift_allocObject();
  uint64_t v50 = TokenMapDataFrame.init(withFileAtPath:)((uint64_t)v7);
  v18(v7, v17 + v8[15], v2);
  swift_allocObject();
  uint64_t v49 = DomainMapDataFrame.init(withFileAtPath:)((uint64_t)v7);
  v18(v7, v17 + v8[9], v2);
  type metadata accessor for CommerceSenderRule();
  uint64_t v24 = swift_allocObject();
  static BloomFilterSerDe.readFromFile(withFilePath:)((uint64_t)v7, (uint64_t)&v61);
  long long v46 = v8;
  ((void (*)(char *, uint64_t))v59)(v7, v2);
  char v25 = v63;
  uint64_t v26 = v64;
  *(void *)(v24 + 16) = v61;
  *(_OWORD *)(v24 + 24) = v62;
  *(unsigned char *)(v24 + 40) = v25;
  *(void *)(v24 + 48) = v26;
  uint64_t v27 = v57;
  sub_2550BCEB8(v17 + v8[9], v57, type metadata accessor for BloomFilterData);
  v18(v7, v27 + *(int *)(v60 + 20), v2);
  sub_2550BD3DC(v27, type metadata accessor for BloomFilterData);
  type metadata accessor for GuaranteeListRule();
  uint64_t v28 = swift_allocObject();
  uint64_t v29 = v58;
  v18((char *)v58, (uint64_t)v7, v2);
  swift_allocObject();
  uint64_t v30 = DomainMapDataFrame.init(withFileAtPath:)(v29);
  uint64_t v63 = v23;
  uint64_t v64 = &protocol witness table for DomainMapDataFrame;
  uint64_t v61 = v30;
  ((void (*)(char *, uint64_t))v59)(v7, v2);
  sub_2550BCEA0((long long *)&v61, v28 + 16);
  uint64_t v31 = v46;
  v18(v7, v17 + v46[14], v2);
  swift_allocObject();
  uint64_t v32 = DomainMapDataFrame.init(withFileAtPath:)((uint64_t)v7);
  uint64_t v33 = v56;
  *(void *)(v56 + OBJC_IVAR____TtC20MCCKitCategorization6MCCNLP_personalDomains) = v32;
  uint64_t v34 = v17 + v31[8];
  long long v60 = *(_OWORD *)v34;
  long long v59 = *(_OWORD *)(v34 + 16);
  long long v58 = *(_OWORD *)(v34 + 32);
  long long v57 = *(_OWORD *)(v34 + 48);
  uint64_t v35 = *(void *)(v34 + 64);
  uint64_t v36 = *(void *)(v34 + 72);
  uint64_t v37 = *(void *)(v34 + 80);
  type metadata accessor for FinalRule();
  uint64_t v38 = swift_allocObject();
  long long v39 = v59;
  *(_OWORD *)(v38 + 16) = v60;
  *(_OWORD *)(v38 + 32) = v39;
  long long v40 = v57;
  *(_OWORD *)(v38 + 48) = v58;
  *(_OWORD *)(v38 + 64) = v40;
  *(void *)(v38 + 80) = v35;
  *(void *)(v38 + 88) = v36;
  *(void *)(v38 + 96) = v37;
  uint64_t v41 = (uint64_t)v53;
  sub_2550BCEB8(v17, (uint64_t)v53, (uint64_t (*)(void))type metadata accessor for BlackPearlLevels);
  type metadata accessor for DecisionStrategy();
  uint64_t v42 = (_OWORD *)swift_allocObject();
  uint64_t v43 = sub_2550BCF20(v65, v41, v55, v54, v52, v51, v50, v49, v24, v28, v38, v42);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t result = v33;
  *(void *)(v33 + 24) = v43;
  return result;
}

uint64_t MCCNLP.deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC20MCCKitCategorization6MCCNLP_blackPearlLevels;
  swift_beginAccess();
  uint64_t v3 = type metadata accessor for BlackPearlModel(0);
  uint64_t v4 = *(int *)(v3 + 32);
  uint64_t v5 = *(void **)(v2 + v4);
  *(void *)(v2 + v4) = 0;

  uint64_t v6 = type metadata accessor for BlackPearlLevels();
  uint64_t v7 = v2 + *(int *)(v6 + 24);
  uint64_t v8 = *(int *)(v3 + 32);
  uint64_t v9 = *(void **)(v7 + v8);
  *(void *)(v7 + v8) = 0;

  uint64_t v10 = v2 + *(int *)(v6 + 20);
  uint64_t v11 = *(int *)(v3 + 32);
  id v12 = *(void **)(v10 + v11);
  *(void *)(v10 + v11) = 0;

  if (qword_26B278B80 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_2550D9A00();
  __swift_project_value_buffer(v13, (uint64_t)qword_26B279BA0);
  swift_retain_n();
  uint64_t v14 = sub_2550D99E0();
  os_log_type_t v15 = sub_2550D9DD0();
  if (os_log_type_enabled(v14, v15))
  {
    os_log_type_t v25 = v15;
    log = v14;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 138412802;
    uint64_t v18 = *(void **)(v2 + *(int *)(v3 + 32));
    if (v18) {
      id v19 = v18;
    }
    sub_2550D9E90();
    *uint64_t v17 = v18;
    swift_release_n();
    *(_WORD *)(v16 + 12) = 2112;
    char v20 = *(void **)(v2 + *(int *)(v6 + 20) + *(int *)(v3 + 32));
    if (v20) {
      id v21 = v20;
    }
    sub_2550D9E90();
    v17[1] = v20;
    swift_release_n();
    *(_WORD *)(v16 + 22) = 2112;
    uint64_t v22 = *(void **)(v2 + *(int *)(v6 + 24) + *(int *)(v3 + 32));
    if (v22) {
      id v23 = v22;
    }
    sub_2550D9E90();
    v17[2] = v22;
    swift_release_n();
    _os_log_impl(&dword_25509D000, log, v25, "Destroyed MCCNLP model  %@, %@, %@", (uint8_t *)v16, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E847D8);
    swift_arrayDestroy();
    MEMORY[0x25A2881E0](v17, -1, -1);
    MEMORY[0x25A2881E0](v16, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v1 + 32);
  sub_2550BD3DC(v2, (uint64_t (*)(void))type metadata accessor for BlackPearlLevels);
  swift_release();
  return v1;
}

uint64_t MCCNLP.__deallocating_deinit()
{
  MCCNLP.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2550BC708@<X0>(long long *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *((void *)a1 + 2);
  uint64_t v3 = *((void *)a1 + 3);
  uint64_t v4 = *((void *)a1 + 6);
  uint64_t v5 = *((void *)a1 + 7);
  char v6 = *((unsigned char *)a1 + 64);
  char v7 = *((unsigned char *)a1 + 65);
  char v8 = *((unsigned char *)a1 + 66);
  char v9 = *((unsigned char *)a1 + 67);
  char v10 = *((unsigned char *)a1 + 68);
  char v11 = *((unsigned char *)a1 + 69);
  long long v13 = *a1;
  uint64_t v14 = v2;
  uint64_t v15 = v3;
  long long v16 = a1[2];
  uint64_t v17 = v4;
  uint64_t v18 = v5;
  char v19 = v6;
  char v20 = v7;
  char v21 = v8;
  char v22 = v9;
  char v23 = v10;
  char v24 = v11;
  long long v25 = *(long long *)((char *)a1 + 72);
  return sub_2550C6814((uint64_t *)&v13, a2);
}

uint64_t sub_2550BC790()
{
  uint64_t v1 = type metadata accessor for BlackPearlLevels();
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = v0[7];
  uint64_t v5 = v0[8];
  __swift_project_boxed_opaque_existential_1(v0 + 4, v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 272))(v4, v5);
  uint64_t v6 = (uint64_t)v0 + OBJC_IVAR____TtC20MCCKitCategorization6MCCNLP_blackPearlLevels;
  swift_beginAccess();
  sub_2550A2840((uint64_t)v3, v6);
  return swift_endAccess();
}

uint64_t sub_2550BC874@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC20MCCKitCategorization6MCCNLP_blackPearlLevels;
  swift_beginAccess();
  uint64_t v4 = (_OWORD *)(v3 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
  long long v5 = v4[8];
  long long v6 = v4[10];
  long long v29 = v4[9];
  long long v7 = v29;
  v30[0] = v6;
  *(_OWORD *)((char *)v30 + 9) = *(_OWORD *)((char *)v4 + 169);
  long long v8 = v4[5];
  long long v10 = v4[3];
  long long v24 = v4[4];
  long long v9 = v24;
  long long v25 = v8;
  long long v11 = v4[5];
  long long v26 = v4[6];
  long long v12 = v4[6];
  long long v13 = v4[8];
  long long v27 = v4[7];
  long long v14 = v27;
  long long v28 = v13;
  long long v15 = v4[1];
  long long v16 = v4[3];
  long long v22 = v4[2];
  long long v17 = v22;
  long long v23 = v16;
  long long v18 = v4[1];
  v21[0] = *v4;
  long long v19 = v21[0];
  v21[1] = v18;
  a1[8] = v5;
  a1[9] = v7;
  a1[10] = v4[10];
  *(_OWORD *)((char *)a1 + 169) = *(_OWORD *)((char *)v4 + 169);
  a1[4] = v9;
  a1[5] = v11;
  a1[6] = v12;
  a1[7] = v14;
  *a1 = v19;
  a1[1] = v15;
  a1[2] = v17;
  a1[3] = v10;
  return sub_25509F83C((uint64_t)v21);
}

uint64_t sub_2550BC950()
{
  uint64_t v1 = v0[7];
  uint64_t v2 = v0[8];
  __swift_project_boxed_opaque_existential_1(v0 + 4, v1);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t (*)(char *), void *, uint64_t, uint64_t))(v2 + 296);
  swift_retain();
  v3(3, sub_2550BD43C, v0, v1, v2);

  return swift_release();
}

uint64_t sub_2550BC9E8(char *a1, uint64_t a2)
{
  char v3 = *a1;
  if (a1[1])
  {
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_2550D9A00();
    __swift_project_value_buffer(v4, (uint64_t)qword_26B279BA0);
    long long v5 = sub_2550D99E0();
    os_log_type_t v6 = sub_2550D9DE0();
    if (os_log_type_enabled(v5, v6))
    {
      long long v7 = (uint8_t *)swift_slowAlloc();
      long long v8 = (void *)swift_slowAlloc();
      *(_DWORD *)long long v7 = 138412290;
      sub_2550A7790();
      swift_allocError();
      *long long v9 = v3;
      uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
      sub_2550D9E90();
      *long long v8 = v11;
      _os_log_impl(&dword_25509D000, v5, v6, "Failed model download %@", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E847D8);
      swift_arrayDestroy();
      MEMORY[0x25A2881E0](v8, -1, -1);
      MEMORY[0x25A2881E0](v7, -1, -1);
    }

    uint64_t result = swift_beginAccess();
    *(unsigned char *)(a2 + 16) = 0;
  }
  else
  {
    uint64_t result = swift_beginAccess();
    *(unsigned char *)(a2 + 16) = v3 & 1;
  }
  return result;
}

uint64_t sub_2550BCBB8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2550C9BE4(a1, a2);
  swift_bridgeObjectRelease();
  return v2;
}

BOOL sub_2550BCBEC()
{
  uint64_t v0 = sub_2550D9B10();
  uint64_t v2 = sub_2550BE778(v0, v1);
  char v4 = v3;
  swift_bridgeObjectRelease();
  return (v4 & 1) == 0 && v2 > 0;
}

uint64_t sub_2550BCC44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC20MCCKitCategorization6MCCNLP_blackPearlLevels;
  swift_beginAccess();
  uint64_t result = type metadata accessor for BlackPearlLevels();
  uint64_t v5 = v3 + *(int *)(result + 28);
  if (*(unsigned char *)(v5 + 184))
  {
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_2550D9A00();
    __swift_project_value_buffer(v6, (uint64_t)qword_26B279BA0);
    long long v7 = sub_2550D99E0();
    os_log_type_t v8 = sub_2550D9DE0();
    if (os_log_type_enabled(v7, v8))
    {
      long long v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v9 = 0;
      _os_log_impl(&dword_25509D000, v7, v8, "BlackPearl Categorization version is nil", v9, 2u);
      MEMORY[0x25A2881E0](v9, -1, -1);
    }

    sub_2550BD444();
    swift_allocError();
    *long long v10 = 1;
    return swift_willThrow();
  }
  else
  {
    uint64_t v11 = *(void *)(v5 + 176);
    *(_OWORD *)a1 = *(_OWORD *)(v5 + 160);
    *(void *)(a1 + 16) = v11;
  }
  return result;
}

BOOL sub_2550BCDAC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

id sub_2550BCDC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v10[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v5 = (void *)sub_2550D9AA0();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  id v6 = objc_msgSend(v3, sel_initWithPattern_options_error_, v5, a3, v10);

  if (v6)
  {
    id v7 = v10[0];
  }
  else
  {
    id v8 = v10[0];
    sub_2550D96B0();

    swift_willThrow();
  }
  return v6;
}

uint64_t sub_2550BCEA0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_2550BCEB8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_2550BCF20(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, _OWORD *a12)
{
  uint64_t v19 = type metadata accessor for DomainMapDataFrame();
  v34[3] = v19;
  void v34[4] = &protocol witness table for DomainMapDataFrame;
  v34[0] = a4;
  uint64_t v32 = type metadata accessor for TokenMapDataFrame();
  uint64_t v33 = &protocol witness table for TokenMapDataFrame;
  v31[0] = a5;
  v30[3] = v32;
  void v30[4] = &protocol witness table for TokenMapDataFrame;
  v29[4] = &protocol witness table for TokenMapDataFrame;
  v30[0] = a6;
  v29[3] = v32;
  v28[4] = &protocol witness table for DomainMapDataFrame;
  v29[0] = a7;
  *(void *)((char *)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_catMaxSeqLen) = 256;
  v28[3] = v19;
  v28[0] = a8;
  *(void *)((char *)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_nonCommerceCategories) = &unk_270441F80;
  long long v20 = a1[1];
  a12[1] = *a1;
  a12[2] = v20;
  long long v21 = a1[3];
  a12[3] = a1[2];
  a12[4] = v21;
  sub_2550BCEB8(a2, (uint64_t)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels, (uint64_t (*)(void))type metadata accessor for BlackPearlLevels);
  *(void *)((char *)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_nerRule) = a3;
  *(void *)((char *)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_commerceSenderRule) = a9;
  *(void *)((char *)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_guaranteeList) = a10;
  *(void *)((char *)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_finalRule) = a11;
  sub_2550BD9D0((uint64_t)v34, (uint64_t)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_domainMap);
  sub_2550BD9D0((uint64_t)v31, (uint64_t)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsSubjectMap);
  sub_2550BD9D0((uint64_t)v30, (uint64_t)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsSenderMap);
  sub_2550BD9D0((uint64_t)v29, (uint64_t)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_catMap);
  sub_2550BD9D0((uint64_t)v28, (uint64_t)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_saasSenderMap);
  id v22 = objc_allocWithZone(MEMORY[0x263F08AE8]);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  *(void *)((char *)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_privateRelayRegex) = sub_2550BCDC4(0xD000000000000041, 0x80000002550DD8E0, 1);
  id v23 = objc_allocWithZone(MEMORY[0x263F08AE8]);
  *(void *)((char *)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsRegex) = sub_2550BCDC4(0x775C5E5B7C2B775CLL, 0xEB000000005D735CLL, 0);
  id v24 = objc_allocWithZone(MEMORY[0x263F08AE8]);
  id v25 = sub_2550BCDC4(0xD000000000000014, 0x80000002550DD9C0, 0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v28);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v30);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
  sub_2550BD3DC(a2, (uint64_t (*)(void))type metadata accessor for BlackPearlLevels);
  *(void *)((char *)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_alphaNumericRegex) = v25;
  return a12;
}

uint64_t sub_2550BD3DC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2550BD43C(char *a1)
{
  return sub_2550BC9E8(a1, v1);
}

unint64_t sub_2550BD444()
{
  unint64_t result = qword_269E849C0;
  if (!qword_269E849C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E849C0);
  }
  return result;
}

uint64_t sub_2550BD498@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(unsigned char *)(v3 + 16);
  return result;
}

uint64_t sub_2550BD4E0(char *a1, uint64_t *a2)
{
  char v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(unsigned char *)(v3 + 16) = v2;
  return result;
}

uint64_t sub_2550BD524()
{
  return type metadata accessor for MCCNLP();
}

uint64_t type metadata accessor for MCCNLP()
{
  uint64_t result = qword_26B278B70;
  if (!qword_26B278B70) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2550BD578()
{
  uint64_t result = type metadata accessor for BlackPearlLevels();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for MCCNLP(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MCCNLP);
}

uint64_t dispatch thunk of MCCNLP.isModelPresetLoaded.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of MCCNLP.isModelPresetLoaded.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of MCCNLP.isModelPresetLoaded.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of MCCNLP.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of MCCNLP.predictCommerceEmail(decisionRequest:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of MCCNLP.refresh()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of MCCNLP.getBlackPearlModelVersions()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of MCCNLP.scheduleImmediateDownload()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t dispatch thunk of MCCNLP.getIABCategoryID(domain:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 208))();
}

uint64_t dispatch thunk of MCCNLP.isPersonalEmail(domain:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of MCCNLP.getBlackPearlCatVersion()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t getEnumTagSinglePayload for MCCNLP.Error(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MCCNLP.Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x2550BD930);
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

unsigned char *sub_2550BD958(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MCCNLP.Error()
{
  return &type metadata for MCCNLP.Error;
}

unint64_t sub_2550BD97C()
{
  unint64_t result = qword_269E849C8;
  if (!qword_269E849C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E849C8);
  }
  return result;
}

uint64_t sub_2550BD9D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2550BDA34()
{
  uint64_t v0 = sub_2550BEFF0((uint64_t)&unk_270441E00);
  swift_arrayDestroy();
  return v0;
}

uint64_t DomainMapDataFrame.__allocating_init(withFileAtPath:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  DomainMapDataFrame.init(withFileAtPath:)(a1);
  return v2;
}

uint64_t DomainMapDataFrame.init(withFileAtPath:)(uint64_t a1)
{
  uint64_t v56 = sub_2550D98F0();
  uint64_t v55 = *(void *)(v56 - 8);
  MEMORY[0x270FA5388](v56);
  uint64_t v54 = (char *)&v53 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C68);
  uint64_t v58 = *(void *)(v59 - 8);
  MEMORY[0x270FA5388](v59);
  long long v57 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_2550D9990();
  uint64_t v70 = *(void *)(v72 - 8);
  MEMORY[0x270FA5388](v72);
  uint64_t v68 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_2550D9940();
  uint64_t v71 = *(void *)(v73 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v73);
  unint64_t v69 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  id v67 = (char *)&v53 - v7;
  uint64_t v8 = sub_2550D9A20();
  uint64_t v65 = *(void *)(v8 - 8);
  uint64_t v66 = v8;
  MEMORY[0x270FA5388](v8);
  long long v62 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_2550D9A50();
  uint64_t v63 = *(void *)(v64 - 8);
  MEMORY[0x270FA5388](v64);
  uint64_t v61 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v80 = sub_2550D97D0();
  uint64_t v75 = *(void *)(v80 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v80);
  long long v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  long long v15 = (char *)&v53 - v14;
  uint64_t v16 = sub_2550D99D0();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v53 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_2550D9970();
  uint64_t v78 = *(void *)(v20 - 8);
  uint64_t v79 = v20;
  uint64_t v21 = MEMORY[0x270FA5388](v20);
  long long v60 = (char *)&v53 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v21);
  id v24 = (char *)&v53 - v23;
  uint64_t v76 = a1;
  if ((sub_2550D96E0() & 1) == 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v13, v76, v80);
    uint64_t v81 = 0;
    unint64_t v82 = 0xE000000000000000;
    sub_2550D9F60();
    swift_bridgeObjectRelease();
    uint64_t v81 = 0xD000000000000014;
    unint64_t v82 = 0x80000002550DDA40;
    sub_2550A8FF0();
    sub_2550DA130();
    sub_2550D9BA0();
    swift_bridgeObjectRelease();
LABEL_9:
    uint64_t result = sub_2550D9FD0();
    __break(1u);
    return result;
  }
  sub_2550BEFF0((uint64_t)&unk_270441E00);
  swift_arrayDestroy();
  sub_2550BEFF0((uint64_t)&unk_270441EC0);
  swift_arrayDestroy();
  sub_2550BEFF0((uint64_t)&unk_270441F20);
  swift_arrayDestroy();
  (*(void (**)(char *, void, uint64_t))(v17 + 104))(v19, *MEMORY[0x263F1BF38], v16);
  sub_2550D9960();
  (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v15, v76, v80);
  id v25 = objc_msgSend(self, sel_defaultManager);
  sub_2550D9790();
  long long v26 = (void *)sub_2550D9AA0();
  swift_bridgeObjectRelease();
  unsigned int v27 = objc_msgSend(v25, sel_fileExistsAtPath_, v26);

  if (!v27)
  {
    sub_2550BAD8C();
    uint64_t v52 = swift_allocError();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v75 + 8))(v15, v80);
    uint64_t v81 = 0;
    unint64_t v82 = 0xE000000000000000;
    sub_2550D9F60();
    sub_2550D9BA0();
    uint64_t v83 = v52;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E84800);
    sub_2550D9FB0();
    goto LABEL_9;
  }
  uint64_t v77 = v24;
  long long v28 = v15;
  uint64_t v29 = sub_2550D97E0();
  uint64_t v30 = v61;
  uint64_t v31 = v29;
  unint64_t v33 = v32;
  sub_2550AA394(v29, v32);
  sub_2550D9A40();
  uint64_t v81 = sub_2550BB004();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E84840);
  sub_2550BF190((unint64_t *)&qword_269E84848, &qword_269E84840);
  uint64_t v34 = v62;
  sub_2550D9A10();
  sub_2550D9A30();
  uint64_t v35 = v75;
  (*(void (**)(char *, uint64_t))(v65 + 8))(v34, v66);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v30, v64);
  uint64_t v36 = v28;
  uint64_t v37 = v80;
  uint64_t v75 = *(void *)(v35 + 8);
  ((void (*)(char *, uint64_t))v75)(v36, v80);
  sub_2550AC604(v31, v33);
  (*(void (**)(char *, char *, uint64_t))(v78 + 16))(v60, v77, v79);
  sub_2550BEC38(MEMORY[0x263F8EE78]);
  uint64_t v38 = v67;
  sub_2550D9890();
  uint64_t v40 = v73;
  uint64_t v39 = v74;
  uint64_t v41 = v74 + OBJC_IVAR____TtC20MCCKitCategorization18DomainMapDataFrame_dataframe;
  uint64_t v42 = v71;
  (*(void (**)(uint64_t, char *, uint64_t))(v71 + 32))(v74 + OBJC_IVAR____TtC20MCCKitCategorization18DomainMapDataFrame_dataframe, v38, v73);
  swift_beginAccess();
  uint64_t v43 = v70;
  uint64_t v44 = v68;
  uint64_t v45 = v72;
  (*(void (**)(char *, void, uint64_t))(v70 + 104))(v68, *MEMORY[0x263F1BF08], v72);
  sub_2550D9910();
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v45);
  long long v46 = v69;
  (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v69, v41, v40);
  sub_2550D98A0();
  LOBYTE(v45) = v47;
  (*(void (**)(char *, uint64_t))(v42 + 8))(v46, v40);
  if (v45)
  {
    swift_beginAccess();
    uint64_t v48 = v54;
    sub_2550D9900();
    swift_endAccess();
    unint64_t v49 = sub_2550D98E0();
    (*(void (**)(char *, uint64_t))(v55 + 8))(v48, v56);
    uint64_t v81 = sub_2550B3A74(1uLL, v49);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E849D0);
    sub_2550BF190(&qword_269E849D8, &qword_269E849D0);
    uint64_t v50 = v57;
    sub_2550D99A0();
    swift_beginAccess();
    sub_2550D9920();
    swift_endAccess();
    ((void (*)(uint64_t, uint64_t))v75)(v76, v37);
    (*(void (**)(char *, uint64_t))(v58 + 8))(v50, v59);
  }
  else
  {
    ((void (*)(uint64_t, uint64_t))v75)(v76, v37);
  }
  (*(void (**)(char *, uint64_t))(v78 + 8))(v77, v79);
  return v39;
}

uint64_t sub_2550BE778(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C68);
  uint64_t v23 = *(void *)(v4 - 8);
  uint64_t v24 = v4;
  MEMORY[0x270FA5388](v4);
  uint64_t v22 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2550D9940();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C60);
  uint64_t v26 = *(void *)(v10 - 8);
  uint64_t v27 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = v2 + OBJC_IVAR____TtC20MCCKitCategorization18DomainMapDataFrame_dataframe;
  swift_beginAccess();
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v14(v9, v13, v6);
  sub_2550D9950();
  long long v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v9, v6);
  uint64_t v16 = sub_2550BF1D4((uint64_t)v12, a1, v25);
  if (v17)
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v27);
  }
  else
  {
    v14(v9, v13, v6);
    uint64_t v18 = v22;
    sub_2550D9950();
    v15(v9, v6);
    uint64_t v19 = v24;
    sub_2550D99C0();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v18, v19);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v27);
    return v28;
  }
  return v16;
}

uint64_t sub_2550BEAA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2550BF1D4(a1, a2, a3);
}

uint64_t DomainMapDataFrame.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20MCCKitCategorization18DomainMapDataFrame_dataframe;
  uint64_t v2 = sub_2550D9940();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t DomainMapDataFrame.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20MCCKitCategorization18DomainMapDataFrame_dataframe;
  uint64_t v2 = sub_2550D9940();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

uint64_t sub_2550BEBC0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  type metadata accessor for DomainMapDataFrame();
  uint64_t v4 = swift_allocObject();
  uint64_t result = DomainMapDataFrame.init(withFileAtPath:)(a1);
  *a2 = v4;
  return result;
}

uint64_t sub_2550BEC10(uint64_t a1, uint64_t a2)
{
  return sub_2550BE778(a1, a2);
}

unint64_t sub_2550BEC38(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B279998);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E849E0);
  uint64_t v6 = sub_2550DA010();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = (char *)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_2550BF560(v12, (uint64_t)v5);
    uint64_t v14 = *v5;
    uint64_t v15 = v5[1];
    unint64_t result = sub_2550BEE30(*v5, v15);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v19 = (uint64_t *)(v7[6] + 16 * result);
    *uint64_t v19 = v14;
    v19[1] = v15;
    uint64_t v20 = v7[7];
    uint64_t v21 = sub_2550D99D0();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18, v9, v21);
    uint64_t v22 = v7[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_11;
    }
    v7[2] = v24;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_2550BEE30(uint64_t a1, uint64_t a2)
{
  sub_2550DA1F0();
  sub_2550D9B50();
  uint64_t v4 = sub_2550DA210();

  return sub_2550BEEA8(a1, a2, v4);
}

unint64_t sub_2550BEEA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_2550DA140() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        uint64_t v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_2550DA140() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_2550DA140()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_2550BEFF0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B2799B8);
    uint64_t v3 = sub_2550D9F40();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v6 = a1 + 32;
    while (1)
    {
      uint64_t v7 = (uint64_t *)(v6 + 16 * v4);
      uint64_t v9 = *v7;
      uint64_t v8 = v7[1];
      sub_2550DA1F0();
      swift_bridgeObjectRetain();
      sub_2550D9B50();
      uint64_t result = sub_2550DA210();
      uint64_t v11 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v12 = result & ~v11;
      unint64_t v13 = v12 >> 6;
      uint64_t v14 = *(void *)(v5 + 8 * (v12 >> 6));
      uint64_t v15 = 1 << v12;
      if (((1 << v12) & v14) != 0)
      {
        uint64_t v16 = *(void *)(v3 + 48);
        char v17 = (void *)(v16 + 16 * v12);
        BOOL v18 = *v17 == v9 && v17[1] == v8;
        if (v18 || (uint64_t result = sub_2550DA140(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v19 = ~v11;
        while (1)
        {
          unint64_t v12 = (v12 + 1) & v19;
          unint64_t v13 = v12 >> 6;
          uint64_t v14 = *(void *)(v5 + 8 * (v12 >> 6));
          uint64_t v15 = 1 << v12;
          if ((v14 & (1 << v12)) == 0) {
            break;
          }
          uint64_t v20 = (void *)(v16 + 16 * v12);
          if (*v20 != v9 || v20[1] != v8)
          {
            uint64_t result = sub_2550DA140();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v13) = v15 | v14;
      uint64_t v22 = (void *)(*(void *)(v3 + 48) + 16 * v12);
      void *v22 = v9;
      v22[1] = v8;
      uint64_t v23 = *(void *)(v3 + 16);
      BOOL v24 = __OFADD__(v23, 1);
      uint64_t v25 = v23 + 1;
      if (v24)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v25;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

uint64_t sub_2550BF190(unint64_t *a1, uint64_t *a2)
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

uint64_t sub_2550BF1D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C60);
  uint64_t v5 = sub_2550D99B0();
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    while (1)
    {
      if (__OFSUB__(v6, v7))
      {
        __break(1u);
LABEL_22:
        __break(1u);
        goto LABEL_23;
      }
      uint64_t v8 = v7 + (v6 - v7) / 2;
      if (__OFADD__(v7, (v6 - v7) / 2)) {
        goto LABEL_22;
      }
      sub_2550D99C0();
      if (!v16) {
        break;
      }
      if (v15 == a2 && v16 == a3 || (sub_2550DA140() & 1) != 0) {
        goto LABEL_14;
      }
      char v9 = sub_2550DA140();
      swift_bridgeObjectRelease();
      if (v9)
      {
        uint64_t v7 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
          __break(1u);
LABEL_14:
          swift_bridgeObjectRelease();
          return v8;
        }
        uint64_t v8 = v6;
      }
      uint64_t v6 = v8;
      if (v7 >= v8) {
        return 0;
      }
    }
    if (qword_26B278B80 == -1) {
      goto LABEL_16;
    }
LABEL_23:
    swift_once();
LABEL_16:
    uint64_t v10 = sub_2550D9A00();
    __swift_project_value_buffer(v10, (uint64_t)qword_26B279BA0);
    uint64_t v11 = sub_2550D99E0();
    os_log_type_t v12 = sub_2550D9DE0();
    if (os_log_type_enabled(v11, v12))
    {
      unint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v13 = 0;
      _os_log_impl(&dword_25509D000, v11, v12, "Index out of bound, returning nil", v13, 2u);
      MEMORY[0x25A2881E0](v13, -1, -1);
    }
  }
  return 0;
}

uint64_t sub_2550BF3C8()
{
  return type metadata accessor for DomainMapDataFrame();
}

uint64_t type metadata accessor for DomainMapDataFrame()
{
  uint64_t result = qword_26B279490;
  if (!qword_26B279490) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2550BF41C()
{
  uint64_t result = sub_2550D9940();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for DomainMapDataFrame(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DomainMapDataFrame);
}

uint64_t dispatch thunk of DomainMapDataFrame.__allocating_init(withFileAtPath:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of DomainMapDataFrame.lookup(domain:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of DomainMapDataFrame.binarySearch(cols:key:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t sub_2550BF560(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B279998);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

MCCKitCategorization::Category_optional __swiftcall Category.init(rawValue:)(Swift::Int rawValue)
{
  char v2 = rawValue + 2;
  if ((unint64_t)(rawValue + 2) >= 9) {
    char v2 = 9;
  }
  *unint64_t v1 = v2;
  return (MCCKitCategorization::Category_optional)rawValue;
}

void static Category.getCategory(for:)(char *a1@<X8>)
{
  uint64_t v3 = sub_2550D9B20();
  uint64_t v4 = v2;
  if (v3 == 0x4C414E4F53524550 && v2 == 0xE800000000000000 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    char v5 = 2;
  }
  else if (v3 == 0x4F49544F4D4F5250 && v4 == 0xEA0000000000534ELL || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    char v5 = 3;
  }
  else if (v3 == 0x4C4149434F53 && v4 == 0xE600000000000000 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    char v5 = 4;
  }
  else if (v3 == 0x544341534E415254 && v4 == 0xEC000000534E4F49 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    char v5 = 5;
  }
  else if (v3 == 1398228302 && v4 == 0xE400000000000000 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    char v5 = 6;
  }
  else
  {
    if (v3 == 0x53524548544FLL && v4 == 0xE600000000000000 || (sub_2550DA140() & 1) != 0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      if (v3 == 0xD000000000000014 && v4 == 0x80000002550DDAC0 || (sub_2550DA140() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        char v5 = 0;
        goto LABEL_5;
      }
      if (v3 == 0x41535F504F4ELL && v4 == 0xE600000000000000 || (sub_2550DA140() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        char v5 = 8;
        goto LABEL_5;
      }
      if (v3 == 0x524F525245 && v4 == 0xE500000000000000)
      {
        swift_bridgeObjectRelease();
        char v5 = 1;
        goto LABEL_5;
      }
      char v6 = sub_2550DA140();
      swift_bridgeObjectRelease();
      if (v6)
      {
        char v5 = 1;
        goto LABEL_5;
      }
      if (qword_26B278B80 != -1) {
        swift_once();
      }
      uint64_t v7 = sub_2550D9A00();
      __swift_project_value_buffer(v7, (uint64_t)qword_26B279BA0);
      swift_bridgeObjectRetain_n();
      uint64_t v8 = sub_2550D99E0();
      os_log_type_t v9 = sub_2550D9DE0();
      if (os_log_type_enabled(v8, v9))
      {
        uint64_t v10 = (uint8_t *)swift_slowAlloc();
        uint64_t v11 = swift_slowAlloc();
        uint64_t v14 = v11;
        *(_DWORD *)uint64_t v10 = 136315138;
        uint64_t v12 = sub_2550D9B20();
        sub_2550A7884(v12, v13, &v14);
        sub_2550D9E90();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25509D000, v8, v9, "Invalid category key: %s", v10, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A2881E0](v11, -1, -1);
        MEMORY[0x25A2881E0](v10, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
    char v5 = 7;
  }
LABEL_5:
  *a1 = v5;
}

unint64_t static Category.getCategoryText(for:)(unsigned __int8 *a1)
{
  uint64_t v1 = *a1;
  unint64_t result = 0x4C414E4F53524550;
  switch(v1)
  {
    case 1:
      unint64_t result = 0x524F525245;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x4F49544F4D4F5250;
      break;
    case 4:
      unint64_t result = 0x4C4149434F53;
      break;
    case 5:
      unint64_t result = 0x544341534E415254;
      break;
    case 6:
      unint64_t result = 1398228302;
      break;
    case 7:
      unint64_t result = 0x53524548544FLL;
      break;
    case 8:
      unint64_t result = 0x41535F504F4ELL;
      break;
    default:
      unint64_t result = 0xD000000000000014;
      break;
  }
  return result;
}

void *static Category.allCases.getter()
{
  return &unk_270442120;
}

uint64_t Category.rawValue.getter()
{
  return *v0 - 2;
}

uint64_t sub_2550BFC54()
{
  return sub_2550DA210();
}

uint64_t sub_2550BFC9C()
{
  return sub_2550DA200();
}

uint64_t sub_2550BFCCC()
{
  return sub_2550DA210();
}

MCCKitCategorization::Category_optional sub_2550BFD10(Swift::Int *a1)
{
  return Category.init(rawValue:)(*a1);
}

void sub_2550BFD18(void *a1@<X8>)
{
  *a1 = *v1 - 2;
}

void sub_2550BFD28(void *a1@<X8>)
{
  *a1 = &unk_270442120;
}

unint64_t sub_2550BFD3C()
{
  unint64_t result = qword_26B2798D0;
  if (!qword_26B2798D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B2798D0);
  }
  return result;
}

unint64_t sub_2550BFD94()
{
  unint64_t result = qword_269E849E8;
  if (!qword_269E849E8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269E849F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E849E8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Category(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF8) {
    goto LABEL_17;
  }
  if (a2 + 8 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 8) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 8;
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
      return (*a1 | (v4 << 8)) - 8;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 8;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 9;
  int v8 = v6 - 9;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for Category(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x2550BFF4CLL);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for Category()
{
  return &type metadata for Category;
}

id HashingVectorizer.init(charNgramLow:charNgramHigh:tokenNgramLow:tokenNgramHigh:buckets:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  id v12 = objc_allocWithZone(MEMORY[0x263F08AE8]);
  id result = sub_2550BCDC4(0x100000000000001ALL, 0x80000002550DD7E0, 0);
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  a6[5] = 0x100000000000001ALL;
  a6[6] = 0x80000002550DD7E0;
  a6[7] = result;
  return result;
}

uint64_t sub_2550C00D8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = (void *)(a8 + 16);
  swift_beginAccess();
  id v12 = *(void **)(a8 + 16);
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(a8 + 16) = v12;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    id v12 = sub_2550B5458(0, v12[2] + 1, 1, v12);
    *uint64_t v11 = v12;
  }
  unint64_t v15 = v12[2];
  unint64_t v14 = v12[3];
  if (v15 >= v14 >> 1)
  {
    id v12 = sub_2550B5458((void *)(v14 > 1), v15 + 1, 1, v12);
    *uint64_t v11 = v12;
  }
  unint64_t v16 = 0xE000000000000000;
  if (a2)
  {
    unint64_t v16 = a2;
    uint64_t v17 = a1;
  }
  else
  {
    uint64_t v17 = 0;
  }
  v12[2] = v15 + 1;
  BOOL v18 = &v12[2 * v15];
  v18[4] = v17;
  v18[5] = v16;
  return swift_endAccess();
}

uint64_t sub_2550C01C8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v34 = result;
  uint64_t v6 = a2 - 1;
  if (__OFSUB__(a2, 1)) {
    goto LABEL_41;
  }
  if (__OFSUB__(a3, 1))
  {
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  if (a3 - 1 >= a4) {
    uint64_t v7 = a4;
  }
  else {
    uint64_t v7 = a3 - 1;
  }
  if (v7 < v6) {
    goto LABEL_43;
  }
  if (v6 == v7) {
    return result;
  }
  uint64_t v33 = *(void *)(v5 + 32);
  if (v33)
  {
    uint64_t v9 = a2;
    while (1)
    {
      if (v9 - 1 >= v7)
      {
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
        goto LABEL_42;
      }
      if (v6 < 0) {
        goto LABEL_36;
      }
      if ((unint64_t)(v9 - 1) >= *(void *)(*(void *)v34 + 16)) {
        goto LABEL_37;
      }
      unint64_t v10 = *(unsigned int *)(*(void *)v34 + 4 * v9 + 28);
      if (v10) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = -1;
      }
      uint64_t v12 = (uint64_t)(v10 >> 1) % v33;
      uint64_t v13 = *a5;
      uint64_t v14 = *(void *)(*a5 + 16);
      if (v14)
      {
        unint64_t v15 = sub_2550AAC20(v12);
        if (v16) {
          uint64_t v14 = *(void *)(*(void *)(v13 + 56) + 8 * v15);
        }
        else {
          uint64_t v14 = 0;
        }
      }
      uint64_t v17 = v14 + v11;
      if (__OFADD__(v14, v11)) {
        goto LABEL_38;
      }
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v19 = *a5;
      uint64_t v35 = (void *)*a5;
      *a5 = 0x8000000000000000;
      unint64_t v21 = sub_2550AAC20(v12);
      uint64_t v22 = *(void *)(v19 + 16);
      BOOL v23 = (v20 & 1) == 0;
      uint64_t v24 = v22 + v23;
      if (__OFADD__(v22, v23)) {
        goto LABEL_39;
      }
      char v25 = v20;
      if (*(void *)(v19 + 24) >= v24)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          uint64_t v28 = v35;
          if (v20) {
            goto LABEL_11;
          }
        }
        else
        {
          sub_2550AC07C();
          uint64_t v28 = v35;
          if (v25) {
            goto LABEL_11;
          }
        }
      }
      else
      {
        sub_2550AB280(v24, isUniquelyReferenced_nonNull_native);
        unint64_t v26 = sub_2550AAC20(v12);
        if ((v25 & 1) != (v27 & 1)) {
          goto LABEL_45;
        }
        unint64_t v21 = v26;
        uint64_t v28 = v35;
        if (v25)
        {
LABEL_11:
          *(void *)(v28[7] + 8 * v21) = v17;
          goto LABEL_12;
        }
      }
      v28[(v21 >> 6) + 8] |= 1 << v21;
      uint64_t v29 = 8 * v21;
      *(void *)(v28[6] + v29) = v12;
      *(void *)(v28[7] + v29) = v17;
      uint64_t v30 = v28[2];
      BOOL v31 = __OFADD__(v30, 1);
      uint64_t v32 = v30 + 1;
      if (v31) {
        goto LABEL_40;
      }
      void v28[2] = v32;
LABEL_12:
      *a5 = (uint64_t)v28;
      id result = swift_bridgeObjectRelease();
      if (v7 + 1 == ++v9) {
        return result;
      }
    }
  }
LABEL_44:
  __break(1u);
LABEL_45:
  id result = sub_2550DA180();
  __break(1u);
  return result;
}

uint64_t sub_2550C0414(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v8 = *v3;
  uint64_t v7 = v3[1];
  uint64_t v9 = v3[4];
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_2550D9B60();
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v50 = sub_2550C0FFC(v10, 0);
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_2550C0F40(&v54, v50 + 4, v11, a1, a2);
    swift_bridgeObjectRelease();
    if (v12 != (void *)v11) {
      goto LABEL_59;
    }
    swift_bridgeObjectRelease();
    if (v7 >= v8) {
      goto LABEL_4;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v50 = (void *)MEMORY[0x263F8EE78];
    if (v7 >= v8)
    {
LABEL_4:
      if (v8 == v7)
      {
LABEL_5:
        return swift_release();
      }
      uint64_t v49 = v50[2];
      uint64_t v14 = MEMORY[0x263F8EE78];
      uint64_t v48 = v7;
      while (1)
      {
        if (v8 >= v7) {
          goto LABEL_55;
        }
        uint64_t v15 = v49 - v8;
        if (__OFSUB__(v49, v8)) {
          goto LABEL_56;
        }
        BOOL v16 = __OFADD__(v15, 1);
        uint64_t v17 = v15 + 1;
        if (v16) {
          goto LABEL_57;
        }
        if (v17 > 0) {
          break;
        }
LABEL_9:
        ++v8;
        uint64_t v7 = v48;
        if (v8 == v48) {
          goto LABEL_5;
        }
      }
      if (v9)
      {
        unint64_t v18 = 0;
        uint64_t v19 = v50 + 5;
        uint64_t v51 = v17;
        uint64_t v52 = v8;
        while (1)
        {
          uint64_t v54 = v14;
          uint64_t v20 = v18 + v8;
          if (__OFADD__(v18, v8)) {
            goto LABEL_49;
          }
          if (v20 < (uint64_t)v18) {
            goto LABEL_50;
          }
          if (v18 != v20)
          {
            unint64_t v21 = v50[2];
            BOOL v22 = v18 < v21 && v20 <= (uint64_t)v21;
            BOOL v23 = v19;
            if (!v22) {
              goto LABEL_53;
            }
            do
            {
              uint64_t v24 = *(v23 - 1);
              unint64_t v25 = *v23;
              swift_bridgeObjectRetain();
              sub_2550C57B8(v24, v25);
              v23 += 2;
              --v8;
            }
            while (v8);
            uint64_t v14 = v54;
          }
          unsigned int v26 = _s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(v14, 0);
          swift_bridgeObjectRelease();
          if (v26) {
            uint64_t v27 = 1;
          }
          else {
            uint64_t v27 = -1;
          }
          uint64_t v28 = (v26 >> 1) % v9;
          uint64_t v29 = *a3;
          uint64_t v30 = *(void *)(*a3 + 16);
          if (v30)
          {
            unint64_t v31 = sub_2550AAC20(v28);
            if (v32) {
              uint64_t v30 = *(void *)(*(void *)(v29 + 56) + 8 * v31);
            }
            else {
              uint64_t v30 = 0;
            }
          }
          uint64_t v33 = v30 + v27;
          if (__OFADD__(v30, v27)) {
            goto LABEL_51;
          }
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v35 = *a3;
          uint64_t v53 = (void *)*a3;
          *a3 = 0x8000000000000000;
          unint64_t v37 = sub_2550AAC20(v28);
          uint64_t v38 = *(void *)(v35 + 16);
          BOOL v39 = (v36 & 1) == 0;
          uint64_t v40 = v38 + v39;
          if (__OFADD__(v38, v39)) {
            goto LABEL_52;
          }
          char v41 = v36;
          if (*(void *)(v35 + 24) >= v40)
          {
            if (isUniquelyReferenced_nonNull_native)
            {
              uint64_t v44 = v53;
              if (v36) {
                goto LABEL_16;
              }
            }
            else
            {
              sub_2550AC07C();
              uint64_t v44 = v53;
              if (v41) {
                goto LABEL_16;
              }
            }
          }
          else
          {
            sub_2550AB280(v40, isUniquelyReferenced_nonNull_native);
            unint64_t v42 = sub_2550AAC20(v28);
            if ((v41 & 1) != (v43 & 1)) {
              goto LABEL_60;
            }
            unint64_t v37 = v42;
            uint64_t v44 = v53;
            if (v41)
            {
LABEL_16:
              *(void *)(v44[7] + 8 * v37) = v33;
              goto LABEL_17;
            }
          }
          v44[(v37 >> 6) + 8] |= 1 << v37;
          uint64_t v45 = 8 * v37;
          *(void *)(v44[6] + v45) = v28;
          *(void *)(v44[7] + v45) = v33;
          uint64_t v46 = v44[2];
          BOOL v16 = __OFADD__(v46, 1);
          uint64_t v47 = v46 + 1;
          if (v16) {
            goto LABEL_54;
          }
          v44[2] = v47;
LABEL_17:
          ++v18;
          *a3 = (uint64_t)v44;
          swift_bridgeObjectRelease();
          v19 += 2;
          uint64_t v8 = v52;
          uint64_t v14 = MEMORY[0x263F8EE78];
          if (v18 == v51) {
            goto LABEL_9;
          }
        }
      }
      goto LABEL_58;
    }
  }
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  uint64_t result = sub_2550DA180();
  __break(1u);
  return result;
}

uint64_t sub_2550C0798(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = v3[3];
  uint64_t v32 = v3[2];
  uint64_t v5 = (void *)v3[7];
  uint64_t v6 = sub_2550D9B60();
  uint64_t v7 = (void *)sub_2550D9AA0();
  uint64_t v8 = (void *)sub_2550D9AA0();
  id v9 = objc_msgSend(v5, sel_stringByReplacingMatchesInString_options_range_withTemplate_, v7, 0, 0, v6, v8);

  uint64_t v10 = sub_2550D9AD0();
  unint64_t v12 = v11;

  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = MEMORY[0x263F8EE78];
  uint64_t v14 = (uint64_t *)(v13 + 16);
  uint64_t v15 = HIBYTE(v12) & 0xF;
  if ((v12 & 0x2000000000000000) == 0) {
    uint64_t v15 = v10;
  }
  uint64_t v16 = 11;
  if (((v12 >> 60) & ((v10 & 0x800000000000000) == 0)) == 0) {
    uint64_t v16 = 7;
  }
  v34[1] = 15;
  v34[2] = v16 | (v15 << 16);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278BA8);
  sub_2550A8F9C();
  sub_2550C10B4();
  sub_2550D9ED0();
  swift_bridgeObjectRelease();
  swift_release();
  swift_beginAccess();
  uint64_t v17 = *v14;
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t result = sub_2550B3B60(0, v4);
  uint64_t v19 = result;
  v34[0] = result;
  uint64_t v20 = *(void *)(v17 + 16);
  if (v20)
  {
    unint64_t v21 = 0;
    while (v21 < *(void *)(v17 + 16))
    {
      BOOL v22 = (uint64_t *)(v17 + 32 + 16 * v21);
      uint64_t v23 = *v22;
      unint64_t v24 = v22[1];
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_2550B5568(v23, v24);
      int v26 = _s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(v25, 0);
      swift_bridgeObjectRelease();
      swift_release();
      if (v4 > 2)
      {
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_2550B5778(v19);
          uint64_t v19 = result;
        }
        uint64_t v27 = v4;
        while (1)
        {
          uint64_t v28 = v27 - 1;
          if (v4 <= v27 - 1) {
            break;
          }
          uint64_t v29 = *(void *)(v19 + 16);
          if (v27 - 3 >= v29) {
            goto LABEL_25;
          }
          if (v27 - 2 >= v29) {
            goto LABEL_26;
          }
          uint64_t v30 = v19 + 4 * v27;
          LODWORD(v31) = v26 ^ __ROR4__(*(_DWORD *)(v30 + 20), 9);
          HIDWORD(v31) = v31;
          *(_DWORD *)(v30 + 24) = (v31 >> 5) + v26;
          uint64_t v27 = v28;
          if (v28 == 2) {
            goto LABEL_9;
          }
        }
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
        break;
      }
LABEL_9:
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if (result)
      {
        if (!*(void *)(v19 + 16)) {
          goto LABEL_28;
        }
      }
      else
      {
        uint64_t result = (uint64_t)sub_2550B5778(v19);
        uint64_t v19 = result;
        if (!*(void *)(result + 16)) {
          goto LABEL_28;
        }
      }
      ++v21;
      *(_DWORD *)(v19 + 32) = v26;
      v34[0] = v19;
      uint64_t result = sub_2550C01C8((uint64_t)v34, v32, v4, v21, a3);
      if (v21 == v20) {
        goto LABEL_23;
      }
    }
    __break(1u);
LABEL_28:
    __break(1u);
  }
  else
  {
LABEL_23:
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2550C0AF8()
{
  unint64_t v1 = *(void *)(v0 + 32);
  unint64_t v22 = sub_2550D145C(MEMORY[0x263F8EE78]);
  uint64_t v2 = sub_2550D9B10();
  uint64_t v4 = v3;
  sub_2550C0414(v2, v3, (uint64_t *)&v22);
  sub_2550C0798(v2, v4, (uint64_t *)&v22);
  swift_bridgeObjectRelease();
  uint64_t result = sub_2550B3A74(0, v1);
  uint64_t v6 = (void *)result;
  int64_t v7 = 0;
  unint64_t v8 = v22;
  uint64_t v9 = 1 << *(unsigned char *)(v22 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v22 + 64;
  unint64_t v12 = v10 & *(void *)(v22 + 64);
  int64_t v13 = (unint64_t)(v9 + 63) >> 6;
  if (!v12) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v14 | (v7 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v7 << 6))
  {
    uint64_t v19 = 8 * i;
    unint64_t v20 = *(void *)(*(void *)(v8 + 48) + v19);
    uint64_t v21 = *(void *)(*(void *)(v8 + 56) + v19);
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if (result)
    {
      if ((v20 & 0x8000000000000000) != 0) {
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t result = (uint64_t)sub_2550B578C(v6);
      uint64_t v6 = (void *)result;
      if ((v20 & 0x8000000000000000) != 0)
      {
LABEL_25:
        __break(1u);
LABEL_26:
        swift_release();
        return (uint64_t)v6;
      }
    }
    if (v20 >= v6[2])
    {
      __break(1u);
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    v6[v20 + 4] = v21;
    if (v12) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v16 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      goto LABEL_28;
    }
    if (v16 >= v13) {
      goto LABEL_26;
    }
    unint64_t v17 = *(void *)(v11 + 8 * v16);
    ++v7;
    if (!v17)
    {
      int64_t v7 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v17 = *(void *)(v11 + 8 * v7);
      if (!v17)
      {
        int64_t v7 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_26;
        }
        unint64_t v17 = *(void *)(v11 + 8 * v7);
        if (!v17) {
          break;
        }
      }
    }
LABEL_18:
    unint64_t v12 = (v17 - 1) & v17;
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_26;
  }
  unint64_t v17 = *(void *)(v11 + 8 * v18);
  if (v17)
  {
    int64_t v7 = v18;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v7 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v7 >= v13) {
      goto LABEL_26;
    }
    unint64_t v17 = *(void *)(v11 + 8 * v7);
    ++v18;
    if (v17) {
      goto LABEL_18;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

void destroy for HashingVectorizer(uint64_t a1)
{
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void **)(a1 + 56);
}

uint64_t initializeWithCopy for HashingVectorizer(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v4 = *(void **)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  swift_bridgeObjectRetain();
  id v5 = v4;
  return a1;
}

void *assignWithCopy for HashingVectorizer(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a2[7];
  id v5 = (void *)a1[7];
  a1[7] = v4;
  id v6 = v4;

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

uint64_t assignWithTake for HashingVectorizer(uint64_t a1, _OWORD *a2)
{
  long long v4 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = a2[2];
  swift_bridgeObjectRelease();
  id v5 = *(void **)(a1 + 56);
  *(_OWORD *)(a1 + 48) = a2[3];

  return a1;
}

uint64_t getEnumTagSinglePayload for HashingVectorizer(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 64)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HashingVectorizer(uint64_t result, int a2, int a3)
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 64) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HashingVectorizer()
{
  return &type metadata for HashingVectorizer;
}

void *sub_2550C0F40(void *result, uint64_t *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  id v5 = result;
  uint64_t v6 = HIBYTE(a5) & 0xF;
  uint64_t v12 = a4;
  unint64_t v13 = a5;
  if ((a5 & 0x2000000000000000) == 0) {
    uint64_t v6 = a4 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v14 = v6;
  if (!a2)
  {
    uint64_t v7 = 0;
LABEL_14:
    *id v5 = a4;
    v5[1] = a5;
    v5[2] = 0;
    v5[3] = v6;
    return (void *)v7;
  }
  uint64_t v7 = a3;
  if (!a3) {
    goto LABEL_14;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    unint64_t v8 = a2;
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = sub_2550D9BB0();
      if (!v11) {
        break;
      }
      ++v9;
      *unint64_t v8 = v10;
      v8[1] = v11;
      v8 += 2;
      if (v7 == v9)
      {
        a4 = v12;
        a5 = v13;
        goto LABEL_13;
      }
    }
    a4 = v12;
    a5 = v13;
    uint64_t v7 = v9;
LABEL_13:
    uint64_t v6 = v14;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

void *sub_2550C0FFC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C08);
  long long v4 = (void *)swift_allocObject();
  int64_t v5 = _swift_stdlib_malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 17;
  }
  v4[2] = a1;
  v4[3] = 2 * (v6 >> 4);
  return v4;
}

uint64_t sub_2550C1074()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2550C10AC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_2550C00D8(a1, a2, a3, a4, a5, a6, a7, v7);
}

unint64_t sub_2550C10B4()
{
  unint64_t result = qword_26B278BB0;
  if (!qword_26B278BB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_26B278BA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B278BB0);
  }
  return result;
}

uint64_t GuaranteeListRule.__allocating_init(fromSenderCategoryFile:)(uint64_t a1)
{
  uint64_t v2 = sub_2550D97D0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  int64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  uint64_t v7 = type metadata accessor for DomainMapDataFrame();
  swift_allocObject();
  uint64_t v8 = DomainMapDataFrame.init(withFileAtPath:)((uint64_t)v5);
  uint64_t v12 = v7;
  unint64_t v13 = &protocol witness table for DomainMapDataFrame;
  *(void *)&long long v11 = v8;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  sub_2550BCEA0(&v11, v6 + 16);
  return v6;
}

uint64_t GuaranteeListRule.init(fromSenderCategoryFile:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_2550D97D0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v8 = type metadata accessor for DomainMapDataFrame();
  swift_allocObject();
  uint64_t v9 = DomainMapDataFrame.init(withFileAtPath:)((uint64_t)v7);
  uint64_t v13 = v8;
  uint64_t v14 = &protocol witness table for DomainMapDataFrame;
  *(void *)&long long v12 = v9;
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  sub_2550BCEA0(&v12, v2 + 16);
  return v2;
}

uint64_t GuaranteeListRule.deinit()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return v0;
}

uint64_t GuaranteeListRule.__deallocating_deinit()
{
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);

  return MEMORY[0x270FA0228](v0, 56, 7);
}

uint64_t type metadata accessor for GuaranteeListRule()
{
  return self;
}

uint64_t method lookup function for GuaranteeListRule(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for GuaranteeListRule);
}

uint64_t dispatch thunk of GuaranteeListRule.__allocating_init(fromSenderCategoryFile:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_2550C1434()
{
  uint64_t v0 = sub_2550D9A00();
  __swift_allocate_value_buffer(v0, qword_26B279BA0);
  __swift_project_value_buffer(v0, (uint64_t)qword_26B279BA0);
  swift_bridgeObjectRetain();
  return sub_2550D99F0();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t static MurmurHash3.getMurmurHash3(text:seed:)(uint64_t a1, unint64_t a2, int a3)
{
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_2550B5568(a1, a2);
  swift_bridgeObjectRelease();
  uint64_t v7 = _s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(v6, a3);
  swift_release();
  return v7;
}

unint64_t sub_2550C159C(unint64_t result, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 16);
  BOOL v3 = v2 >= result;
  unint64_t v5 = v2 - result;
  BOOL v4 = v5 != 0 && v3;
  if (!v3) {
    unint64_t v5 = 0;
  }
  if (!v4 || v5 == 1 || v5 == 2)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (!__OFADD__(result, 3))
  {
    if (v5 != 3) {
      return *(unsigned __int8 *)(a2 + 32 + result) | (*(unsigned __int8 *)(result + a2 + 32 + 1) << 8) | (*(unsigned __int8 *)(result + a2 + 32 + 2) << 16) | (*(unsigned __int8 *)(a2 + 32 + result + 3) << 24);
    }
    goto LABEL_10;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t _s20MCCKitCategorization11MurmurHash3V03getcD05bytes4seeds6UInt32VSays5UInt8VG_AHtFZ_0(uint64_t a1, int a2)
{
  unint64_t v4 = *(void *)(a1 + 16);
  if (v4 >= 4)
  {
    unint64_t v5 = 0;
    do
    {
      int v6 = sub_2550C159C(v5, a1);
      HIDWORD(v7) = (461845907 * ((380141568 * v6) | ((-862048943 * v6) >> 17))) ^ a2;
      LODWORD(v7) = HIDWORD(v7);
      a2 = 5 * (v7 >> 19) - 430675100;
      v5 += 4;
    }
    while (4 * (v4 >> 2) != v5);
  }
  uint64_t v8 = v4 & 0x7FFFFFFFFFFFFFFCLL;
  if ((v4 & 0x7FFFFFFFFFFFFFFCLL) < v4)
  {
    unint64_t v9 = v4 & 3;
    if ((v4 & 3) != 0)
    {
      uint64_t v10 = a1 + 32;
      int v11 = *(unsigned __int8 *)(a1 + 32 + v9 - 1 + v8);
      if (v9 != 1)
      {
        int v11 = *(unsigned __int8 *)(v10 + v9 - 2 + v8) | (v11 << 8);
        if (v9 != 2) {
          int v11 = *(unsigned __int8 *)(v9 + v8 + v10 - 3) | (v11 << 8);
        }
      }
    }
    else
    {
      int v11 = 0;
    }
    a2 ^= 461845907 * ((380141568 * v11) | ((-862048943 * v11) >> 17));
  }
  if (HIDWORD(v4))
  {
    uint64_t result = sub_2550D9FC0();
    __break(1u);
  }
  else
  {
    unsigned int v12 = -2048144789 * (a2 ^ v4 ^ ((a2 ^ v4) >> 16));
    return (-1028477387 * (v12 ^ (v12 >> 13))) ^ ((-1028477387 * (v12 ^ (v12 >> 13))) >> 16);
  }
  return result;
}

ValueMetadata *type metadata accessor for MurmurHash3()
{
  return &type metadata for MurmurHash3;
}

uint64_t dispatch thunk of DomainMap.init(withFileAtPath:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of DomainMap.lookup(domain:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t DecisionResult.commerce.getter()
{
  return *v0;
}

uint64_t DecisionResult.timesensitive.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

void DecisionResult.subCategory.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 2);
}

void DecisionResult.subCategoryTS.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 3);
}

double DecisionResult.score.getter()
{
  return *(double *)(v0 + 8);
}

double DecisionResult.senderScore.getter()
{
  return *(double *)(v0 + 16);
}

double DecisionResult.tsScore.getter()
{
  return *(double *)(v0 + 24);
}

double DecisionResult.tsCategoryScore.getter()
{
  return *(double *)(v0 + 32);
}

uint64_t DecisionResult.reasonCodes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DecisionResult.blackPearlVersion.getter@<X0>(_OWORD *a1@<X8>)
{
  long long v2 = v1[12];
  long long v3 = v1[10];
  long long v24 = v1[11];
  long long v25 = v2;
  long long v4 = v1[12];
  v26[0] = v1[13];
  *(_OWORD *)((char *)v26 + 9) = *(_OWORD *)((char *)v1 + 217);
  long long v5 = v1[8];
  long long v7 = v1[6];
  long long v20 = v1[7];
  long long v6 = v20;
  long long v21 = v5;
  long long v8 = v1[8];
  long long v9 = v1[10];
  long long v22 = v1[9];
  long long v10 = v22;
  long long v23 = v9;
  long long v11 = v1[4];
  v17[0] = v1[3];
  v17[1] = v11;
  long long v12 = v1[6];
  long long v14 = v1[3];
  long long v13 = v1[4];
  long long v18 = v1[5];
  long long v15 = v18;
  long long v19 = v12;
  a1[8] = v24;
  a1[9] = v4;
  a1[10] = v1[13];
  *(_OWORD *)((char *)a1 + 169) = *(_OWORD *)((char *)v1 + 217);
  a1[4] = v6;
  a1[5] = v8;
  a1[6] = v10;
  a1[7] = v3;
  *a1 = v14;
  a1[1] = v13;
  a1[2] = v15;
  a1[3] = v7;
  return sub_25509F83C((uint64_t)v17);
}

double static DecisionResultBuilder.buildErrorResult()@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_2550C18EC((uint64_t)&unk_2704420F8, a1).n128_u64[0];
  return result;
}

double static DecisionResultBuilder.buildCategorizationNotReadyResult()@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_2550C18EC((uint64_t)&unk_270442150, a1).n128_u64[0];
  return result;
}

__n128 sub_2550C18EC@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_2550AD440(0x312D2E312D2E312DLL, 0xE800000000000000, (uint64_t)&v11);
  uint64_t v4 = v12;
  __n128 result = v11;
  v11.n128_u8[0] = v13;
  *(_DWORD *)a2 = 16842752;
  __asm { FMOV            V1.2D, #-1.0 }
  *(_OWORD *)(a2 + 8) = _Q1;
  *(_OWORD *)(a2 + 24) = _Q1;
  *(void *)(a2 + 40) = a1;
  *(void *)(a2 + 48) = 16718;
  *(void *)(a2 + 56) = 0xE200000000000000;
  *(void *)(a2 + 64) = 16718;
  *(void *)(a2 + 72) = 0xE200000000000000;
  *(void *)(a2 + 80) = 16718;
  *(void *)(a2 + 88) = 0xE200000000000000;
  *(void *)(a2 + 96) = 16718;
  *(void *)(a2 + 104) = 0xE200000000000000;
  *(void *)(a2 + 112) = 16718;
  *(void *)(a2 + 120) = 0xE200000000000000;
  *(_OWORD *)(a2 + 128) = xmmword_2550DBD90;
  *(_OWORD *)(a2 + 144) = xmmword_2550DBD90;
  *(void *)(a2 + 160) = -1;
  *(void *)(a2 + 168) = -1;
  *(_OWORD *)(a2 + 176) = xmmword_2550DBD90;
  *(_OWORD *)(a2 + 192) = xmmword_2550DBD90;
  *(__n128 *)(a2 + 208) = result;
  *(void *)(a2 + 224) = v4;
  *(unsigned char *)(a2 + 232) = v11.n128_u8[0];
  return result;
}

uint64_t static DecisionResultBuilder.buildXpcResult(info:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2550D96D0();
  long long v5 = *(void (***)(char *, uint64_t))(v4 - 8);
  MEMORY[0x270FA5388](v4);
  long long v7 = (char *)&v85 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v109 = sub_2550D9AD0();
  *((void *)&v109 + 1) = v8;
  swift_bridgeObjectRetain();
  id v9 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  swift_unknownObjectRelease();
  uint64_t v101 = v5;
  if (v9)
  {
    sub_2550D9F10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  sub_2550AD11C((uint64_t)&v107, (uint64_t)&v109);
  uint64_t v102 = v4;
  if (v111)
  {
    if (swift_dynamicCast())
    {
      int v10 = v105;
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2550C305C((uint64_t)&v109);
  }
  int v10 = 0;
LABEL_10:
  *(void *)&long long v109 = sub_2550D9AD0();
  *((void *)&v109 + 1) = v11;
  swift_bridgeObjectRetain();
  id v12 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  swift_unknownObjectRelease();
  if (v12)
  {
    sub_2550D9F10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  sub_2550AD11C((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if (swift_dynamicCast())
    {
      int v13 = v105;
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2550C305C((uint64_t)&v109);
  }
  int v13 = 0;
LABEL_19:
  *(void *)&long long v107 = sub_2550D9AD0();
  *((void *)&v107 + 1) = v14;
  swift_bridgeObjectRetain();
  id v15 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  swift_unknownObjectRelease();
  if (v15)
  {
    sub_2550D9F10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  sub_2550AD11C((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    swift_dynamicCast();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2550C305C((uint64_t)&v109);
  }
  static Category.getCategory(for:)((char *)&v109);
  swift_bridgeObjectRelease();
  int v104 = v109;
  *(void *)&long long v109 = sub_2550D9AD0();
  *((void *)&v109 + 1) = v16;
  swift_bridgeObjectRetain();
  id v17 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  swift_unknownObjectRelease();
  if (v17)
  {
    sub_2550D9F10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  sub_2550AD11C((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if (swift_dynamicCast())
    {
      Swift::Int v18 = (Swift::Int)v105;
      swift_bridgeObjectRelease();
      goto LABEL_34;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2550C305C((uint64_t)&v109);
  }
  Swift::Int v18 = -1;
LABEL_34:
  CategoryTS.init(rawValue:)(v18);
  int v103 = v109;
  *(void *)&long long v109 = sub_2550D9AD0();
  *((void *)&v109 + 1) = v19;
  swift_bridgeObjectRetain();
  id v20 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  swift_unknownObjectRelease();
  if (v20)
  {
    sub_2550D9F10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  sub_2550AD11C((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if (swift_dynamicCast())
    {
      long long v21 = v105;
      swift_bridgeObjectRelease();
      goto LABEL_43;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2550C305C((uint64_t)&v109);
  }
  long long v21 = 0;
LABEL_43:
  *(void *)&long long v109 = sub_2550D9AD0();
  *((void *)&v109 + 1) = v22;
  swift_bridgeObjectRetain();
  id v23 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  swift_unknownObjectRelease();
  if (v23)
  {
    sub_2550D9F10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  sub_2550AD11C((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if (swift_dynamicCast())
    {
      long long v24 = v105;
      swift_bridgeObjectRelease();
      goto LABEL_52;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2550C305C((uint64_t)&v109);
  }
  long long v24 = 0;
LABEL_52:
  *(void *)&long long v109 = sub_2550D9AD0();
  *((void *)&v109 + 1) = v25;
  swift_bridgeObjectRetain();
  id v26 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  swift_unknownObjectRelease();
  if (v26)
  {
    sub_2550D9F10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  sub_2550AD11C((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if (swift_dynamicCast())
    {
      uint64_t v27 = v105;
      swift_bridgeObjectRelease();
      goto LABEL_61;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2550C305C((uint64_t)&v109);
  }
  uint64_t v27 = 0;
LABEL_61:
  *(void *)&long long v109 = sub_2550D9AD0();
  *((void *)&v109 + 1) = v28;
  swift_bridgeObjectRetain();
  id v29 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  swift_unknownObjectRelease();
  if (v29)
  {
    sub_2550D9F10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  sub_2550AD11C((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if (swift_dynamicCast())
    {
      uint64_t v30 = v105;
      swift_bridgeObjectRelease();
      goto LABEL_70;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2550C305C((uint64_t)&v109);
  }
  uint64_t v30 = 0;
LABEL_70:
  *(void *)&long long v109 = sub_2550D9AD0();
  *((void *)&v109 + 1) = v31;
  swift_bridgeObjectRetain();
  id v32 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  uint64_t result = swift_unknownObjectRelease();
  if (!v32)
  {
    __break(1u);
    return result;
  }
  int v99 = v13;
  sub_2550D9F10();
  swift_unknownObjectRelease();
  sub_2550AD184(&v107, &v109);
  sub_2550C30BC();
  swift_dynamicCast();
  uint64_t v34 = v105;
  sub_2550D9E00();
  swift_bridgeObjectRelease();

  sub_2550D96C0();
  int v100 = v10;
  uint64_t v35 = (char *)MEMORY[0x263F8EE78];
  while (v111)
  {
    sub_2550AD184(&v109, &v107);
    if (swift_dynamicCast())
    {
      uint64_t v36 = (uint64_t)v105;
      unint64_t v37 = v106;
    }
    else
    {
      unint64_t v37 = 0xE400000000000000;
      uint64_t v36 = 1162760014;
    }
    ReasonCode.init(rawValue:)(*(Swift::String *)&v36);
    if (v107 == 31) {
      char v38 = 14;
    }
    else {
      char v38 = v107;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v35 = sub_2550B5134(0, *((void *)v35 + 2) + 1, 1, v35);
    }
    unint64_t v40 = *((void *)v35 + 2);
    unint64_t v39 = *((void *)v35 + 3);
    if (v40 >= v39 >> 1) {
      uint64_t v35 = sub_2550B5134((char *)(v39 > 1), v40 + 1, 1, v35);
    }
    *((void *)v35 + 2) = v40 + 1;
    v35[v40 + 32] = v38;
    sub_2550D96C0();
  }
  v101[1](v7, v102);
  *(void *)&long long v107 = sub_2550D9AD0();
  *((void *)&v107 + 1) = v41;
  swift_bridgeObjectRetain();
  id v42 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  swift_unknownObjectRelease();
  if (v42)
  {
    sub_2550D9F10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  sub_2550AD11C((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if (swift_dynamicCast())
    {
      uint64_t v43 = (uint64_t)v105;
      unint64_t v44 = v106;
      swift_bridgeObjectRelease();
      goto LABEL_92;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2550C305C((uint64_t)&v109);
  }
  uint64_t v43 = 0;
  unint64_t v44 = 0xE000000000000000;
LABEL_92:
  *(void *)&long long v107 = sub_2550D9AD0();
  *((void *)&v107 + 1) = v45;
  swift_bridgeObjectRetain();
  id v46 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  swift_unknownObjectRelease();
  if (v46)
  {
    sub_2550D9F10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  sub_2550AD11C((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if (swift_dynamicCast())
    {
      uint64_t v47 = (void (**)(char *, uint64_t))v105;
      unint64_t v98 = v106;
      swift_bridgeObjectRelease();
      goto LABEL_101;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2550C305C((uint64_t)&v109);
  }
  uint64_t v47 = 0;
  unint64_t v98 = 0xE000000000000000;
LABEL_101:
  *(void *)&long long v107 = sub_2550D9AD0();
  *((void *)&v107 + 1) = v48;
  swift_bridgeObjectRetain();
  id v49 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  swift_unknownObjectRelease();
  if (v49)
  {
    sub_2550D9F10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  sub_2550AD11C((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if (swift_dynamicCast())
    {
      uint64_t v97 = v105;
      unint64_t v96 = v106;
      swift_bridgeObjectRelease();
      goto LABEL_110;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2550C305C((uint64_t)&v109);
  }
  uint64_t v97 = 0;
  unint64_t v96 = 0xE000000000000000;
LABEL_110:
  *(void *)&long long v107 = sub_2550D9AD0();
  *((void *)&v107 + 1) = v50;
  swift_bridgeObjectRetain();
  id v51 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  swift_unknownObjectRelease();
  if (v51)
  {
    sub_2550D9F10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  sub_2550AD11C((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if (swift_dynamicCast())
    {
      uint64_t v95 = v105;
      unint64_t v94 = v106;
      swift_bridgeObjectRelease();
      goto LABEL_119;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2550C305C((uint64_t)&v109);
  }
  uint64_t v95 = 0;
  unint64_t v94 = 0xE000000000000000;
LABEL_119:
  *(void *)&long long v107 = sub_2550D9AD0();
  *((void *)&v107 + 1) = v52;
  swift_bridgeObjectRetain();
  id v53 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  swift_unknownObjectRelease();
  if (v53)
  {
    sub_2550D9F10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  sub_2550AD11C((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if (swift_dynamicCast())
    {
      uint64_t v93 = v105;
      unint64_t v92 = v106;
      swift_bridgeObjectRelease();
      goto LABEL_128;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2550C305C((uint64_t)&v109);
  }
  uint64_t v93 = 0;
  unint64_t v92 = 0xE000000000000000;
LABEL_128:
  *(void *)&long long v107 = sub_2550D9AD0();
  *((void *)&v107 + 1) = v54;
  swift_bridgeObjectRetain();
  id v55 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  swift_unknownObjectRelease();
  if (v55)
  {
    sub_2550D9F10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  sub_2550AD11C((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if (swift_dynamicCast())
    {
      uint64_t v91 = v105;
      unint64_t v90 = v106;
      swift_bridgeObjectRelease();
      goto LABEL_137;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2550C305C((uint64_t)&v109);
  }
  uint64_t v91 = 0;
  unint64_t v90 = 0xE000000000000000;
LABEL_137:
  *(void *)&long long v109 = sub_2550D9AD0();
  *((void *)&v109 + 1) = v56;
  swift_bridgeObjectRetain();
  id v57 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  swift_unknownObjectRelease();
  if (v57)
  {
    sub_2550D9F10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  sub_2550AD11C((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if (swift_dynamicCast())
    {
      uint64_t v87 = v105;
      swift_bridgeObjectRelease();
      goto LABEL_146;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2550C305C((uint64_t)&v109);
  }
  uint64_t v87 = 0;
LABEL_146:
  *(void *)&long long v107 = sub_2550D9AD0();
  *((void *)&v107 + 1) = v58;
  swift_bridgeObjectRetain();
  id v59 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  swift_unknownObjectRelease();
  if (v59)
  {
    sub_2550D9F10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  sub_2550AD11C((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if (swift_dynamicCast())
    {
      int v89 = v105;
      unint64_t v88 = v106;
      swift_bridgeObjectRelease();
      goto LABEL_155;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2550C305C((uint64_t)&v109);
  }
  int v89 = 0;
  unint64_t v88 = 0xE000000000000000;
LABEL_155:
  *(void *)&long long v109 = sub_2550D9AD0();
  *((void *)&v109 + 1) = v60;
  swift_bridgeObjectRetain();
  id v61 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  swift_unknownObjectRelease();
  if (v61)
  {
    sub_2550D9F10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  sub_2550AD11C((uint64_t)&v107, (uint64_t)&v109);
  uint64_t v102 = v43;
  if (v111)
  {
    if (swift_dynamicCast())
    {
      BOOL v86 = v105;
      swift_bridgeObjectRelease();
      goto LABEL_164;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2550C305C((uint64_t)&v109);
  }
  BOOL v86 = 0;
LABEL_164:
  *(void *)&long long v107 = sub_2550D9AD0();
  *((void *)&v107 + 1) = v62;
  swift_bridgeObjectRetain();
  id v63 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  swift_unknownObjectRelease();
  if (v63)
  {
    sub_2550D9F10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  sub_2550AD11C((uint64_t)&v107, (uint64_t)&v109);
  uint64_t v101 = v47;
  if (v111)
  {
    if (swift_dynamicCast())
    {
      uint64_t v64 = v105;
      unint64_t v65 = v106;
      swift_bridgeObjectRelease();
      goto LABEL_173;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2550C305C((uint64_t)&v109);
  }
  uint64_t v64 = 0;
  unint64_t v65 = 0xE000000000000000;
LABEL_173:
  *(void *)&long long v107 = sub_2550D9AD0();
  *((void *)&v107 + 1) = v66;
  swift_bridgeObjectRetain();
  id v67 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  swift_unknownObjectRelease();
  if (v67)
  {
    sub_2550D9F10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  sub_2550AD11C((uint64_t)&v107, (uint64_t)&v109);
  if (v111)
  {
    if (swift_dynamicCast())
    {
      uint64_t v68 = v105;
      unint64_t v69 = v106;
      swift_bridgeObjectRelease();
      goto LABEL_182;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2550C305C((uint64_t)&v109);
  }
  uint64_t v68 = 0;
  unint64_t v69 = 0xE000000000000000;
LABEL_182:
  *(void *)&long long v107 = sub_2550D9AD0();
  *((void *)&v107 + 1) = v70;
  swift_bridgeObjectRetain();
  id v71 = objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, sub_2550DA170());
  swift_unknownObjectRelease();
  if (v71)
  {
    sub_2550D9F10();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v107 = 0u;
    long long v108 = 0u;
  }
  sub_2550AD11C((uint64_t)&v107, (uint64_t)&v109);
  if (!v111)
  {
    swift_bridgeObjectRelease();
    sub_2550C305C((uint64_t)&v109);
LABEL_190:
    uint64_t v72 = 0;
    unint64_t v73 = 0xE000000000000000;
    goto LABEL_191;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_190;
  }
  uint64_t v72 = (uint64_t)v105;
  unint64_t v73 = v106;
  swift_bridgeObjectRelease();
LABEL_191:
  if (v103 == 9) {
    char v74 = 1;
  }
  else {
    char v74 = v103;
  }
  uint64_t result = sub_2550AD440(v72, v73, (uint64_t)&v109);
  uint64_t v75 = v110;
  long long v76 = v109;
  LOBYTE(v109) = v111;
  *(unsigned char *)a2 = v100;
  *(unsigned char *)(a2 + 1) = v99;
  *(unsigned char *)(a2 + 2) = v104;
  *(unsigned char *)(a2 + 3) = v74;
  *(void *)(a2 + 8) = v21;
  *(void *)(a2 + 16) = v24;
  *(void *)(a2 + 24) = v27;
  *(void *)(a2 + 32) = v30;
  uint64_t v77 = v102;
  *(void *)(a2 + 40) = v35;
  *(void *)(a2 + 48) = v77;
  uint64_t v78 = v101;
  *(void *)(a2 + 56) = v44;
  *(void *)(a2 + 64) = v78;
  uint64_t v79 = v97;
  *(void *)(a2 + 72) = v98;
  *(void *)(a2 + 80) = v79;
  uint64_t v80 = v95;
  *(void *)(a2 + 88) = v96;
  *(void *)(a2 + 96) = v80;
  uint64_t v81 = v93;
  *(void *)(a2 + 104) = v94;
  *(void *)(a2 + 112) = v81;
  unint64_t v82 = v91;
  *(void *)(a2 + 120) = v92;
  *(void *)(a2 + 128) = v82;
  uint64_t v83 = v89;
  *(void *)(a2 + 136) = v90;
  *(void *)(a2 + 144) = v83;
  unint64_t v84 = v87;
  *(void *)(a2 + 152) = v88;
  *(void *)(a2 + 160) = v84;
  *(void *)(a2 + 168) = v86;
  *(void *)(a2 + 176) = v64;
  *(void *)(a2 + 184) = v65;
  *(void *)(a2 + 192) = v68;
  *(void *)(a2 + 200) = v69;
  *(_OWORD *)(a2 + 208) = v76;
  *(void *)(a2 + 224) = v75;
  *(unsigned char *)(a2 + 232) = v109;
  return result;
}

uint64_t sub_2550C305C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E84858);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2550C30BC()
{
  unint64_t result = qword_269E84A08;
  if (!qword_269E84A08)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269E84A08);
  }
  return result;
}

uint64_t DecisionResultBuilder.deinit()
{
  return v0;
}

uint64_t DecisionResultBuilder.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 16, 7);
}

uint64_t destroy for DecisionResult()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DecisionResult(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  uint64_t v3 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v3;
  uint64_t v4 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v4;
  uint64_t v5 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v5;
  uint64_t v6 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v6;
  uint64_t v7 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v7;
  uint64_t v8 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v8;
  uint64_t v9 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v9;
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  uint64_t v10 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v10;
  uint64_t v11 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v11;
  *(_OWORD *)(a1 + 217) = *(_OWORD *)(a2 + 217);
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DecisionResult(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(unsigned char *)(a1 + 3) = *(unsigned char *)(a2 + 3);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
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
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v4 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 217) = *(_OWORD *)(a2 + 217);
  *(_OWORD *)(a1 + 208) = v4;
  return a1;
}

__n128 __swift_memcpy233_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  long long v4 = a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  long long v7 = a2[7];
  long long v8 = a2[8];
  long long v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  __n128 result = (__n128)a2[11];
  long long v11 = a2[12];
  long long v12 = a2[13];
  *(_OWORD *)(a1 + 217) = *(long long *)((char *)a2 + 217);
  *(_OWORD *)(a1 + 192) = v11;
  *(_OWORD *)(a1 + 208) = v12;
  *(__n128 *)(a1 + 176) = result;
  return result;
}

uint64_t assignWithTake for DecisionResult(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(_WORD *)(a1 + 2) = *(_WORD *)(a2 + 2);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v10;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  uint64_t v11 = *(void *)(a2 + 184);
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  *(void *)(a1 + 184) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 200);
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  *(void *)(a1 + 200) = v12;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 217) = *(_OWORD *)(a2 + 217);
  return a1;
}

uint64_t getEnumTagSinglePayload for DecisionResult(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 233)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DecisionResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
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
    *(unsigned char *)(result + 232) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 233) = 1;
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
    *(unsigned char *)(result + 233) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DecisionResult()
{
  return &type metadata for DecisionResult;
}

uint64_t type metadata accessor for DecisionResultBuilder()
{
  return self;
}

uint64_t method lookup function for DecisionResultBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DecisionResultBuilder);
}

uint64_t _s20MCCKitCategorization7NERRuleC18nerBloomFilterPathAC10Foundation3URLV_tcfC_0(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  type metadata accessor for BloomFilterSerDe();
  static BloomFilterSerDe.readFromFile(withFilePath:)(a1, (uint64_t)&v7);
  uint64_t v3 = sub_2550D97D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  char v4 = v9;
  uint64_t v5 = v10;
  *(void *)(v2 + 16) = v7;
  *(_OWORD *)(v2 + 24) = v8;
  *(unsigned char *)(v2 + 40) = v4;
  *(void *)(v2 + 48) = v5;
  return v2;
}

__n128 FinalRule.__allocating_init(thresholds:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = *(void *)(a1 + 64);
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v2 + 32) = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v2 + 64) = v5;
  *(void *)(v2 + 80) = v3;
  __n128 result = *(__n128 *)(a1 + 72);
  *(__n128 *)(v2 + 88) = result;
  return result;
}

uint64_t _s20MCCKitCategorization7NERRuleC18nerBloomFilterPathAC10Foundation3URLV_tcfc_0(uint64_t a1)
{
  type metadata accessor for BloomFilterSerDe();
  static BloomFilterSerDe.readFromFile(withFilePath:)(a1, (uint64_t)&v7);
  uint64_t v3 = sub_2550D97D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  char v4 = v9;
  uint64_t v5 = v10;
  *(void *)(v1 + 16) = v7;
  *(_OWORD *)(v1 + 24) = v8;
  *(unsigned char *)(v1 + 40) = v4;
  *(void *)(v1 + 48) = v5;
  return v1;
}

uint64_t CommerceSenderRule.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t _s20MCCKitCategorization7NERRuleCfD_0()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 56, 7);
}

void sub_2550C38EC(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE400000000000000;
  uint64_t v3 = 1701147238;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE300000000000000;
      uint64_t v3 = 7761767;
      goto LABEL_3;
    case 2:
      *a1 = 1937204590;
      a1[1] = 0xE400000000000000;
      break;
    case 3:
      *a1 = 0x726568746FLL;
      a1[1] = 0xE500000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t FinalRule.init(thresholds:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 32) = v3;
  long long v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v1 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v1 + 64) = v4;
  *(void *)(v1 + 80) = v2;
  *(_OWORD *)(v1 + 88) = *(_OWORD *)(a1 + 72);
  return v1;
}

uint64_t sub_2550C3990(char *a1, uint64_t a2, uint64_t a3, double a4)
{
  if ((unint64_t)(a2 - 430) >= 0xFFFFFFFFFFFFFFF7) {
    char v5 = 2;
  }
  else {
    char v5 = 3;
  }
  if ((unint64_t)(a2 - 406) >= 0xE) {
    char v6 = v5;
  }
  else {
    char v6 = 1;
  }
  if ((unint64_t)(a2 - 380) < 3 || a2 == -1) {
    char v8 = 0;
  }
  else {
    char v8 = v6;
  }
  if ((unint64_t)(a3 - 430) >= 0xFFFFFFFFFFFFFFF7) {
    char v9 = 2;
  }
  else {
    char v9 = 3;
  }
  if ((unint64_t)(a3 - 406) >= 0xE) {
    char v10 = v9;
  }
  else {
    char v10 = 1;
  }
  if (a3 == -1) {
    char v10 = 0;
  }
  if ((unint64_t)(a3 - 380) >= 3) {
    char v11 = v10;
  }
  else {
    char v11 = 0;
  }
  switch(v8)
  {
    case 1:
      if (v4[5] < a4) {
        goto LABEL_38;
      }
      uint64_t result = 1;
      char v15 = 24;
      break;
    case 2:
      if (v4[3] < a4) {
        goto LABEL_38;
      }
      uint64_t result = 1;
      char v15 = 25;
      break;
    case 3:
      switch(v11)
      {
        case 1:
        case 2:
        case 3:
          char v16 = sub_2550DA140();
          swift_bridgeObjectRelease();
          if (v16) {
            goto LABEL_34;
          }
          if (v4[10] <= a4) {
            goto LABEL_38;
          }
          uint64_t result = 1;
          char v15 = 26;
          break;
        default:
          swift_bridgeObjectRelease();
LABEL_34:
          if (v4[4] < a4) {
            goto LABEL_38;
          }
          uint64_t result = 1;
          char v15 = 23;
          break;
      }
      break;
    default:
      if (v4[2] < a4)
      {
LABEL_38:
        uint64_t result = 0;
        char v15 = 14;
      }
      else
      {
        uint64_t result = 1;
        char v15 = 22;
      }
      break;
  }
  *a1 = v15;
  return result;
}

uint64_t FinalRule.deinit()
{
  return v0;
}

uint64_t FinalRule.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 104, 7);
}

uint64_t type metadata accessor for NERRule()
{
  return self;
}

uint64_t method lookup function for NERRule(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for NERRule);
}

uint64_t dispatch thunk of NERRule.__allocating_init(nerBloomFilterPath:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t type metadata accessor for CommerceSenderRule()
{
  return self;
}

uint64_t method lookup function for CommerceSenderRule(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for CommerceSenderRule);
}

uint64_t dispatch thunk of CommerceSenderRule.__allocating_init(commerceBloomFilterURL:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t type metadata accessor for FinalRule()
{
  return self;
}

uint64_t method lookup function for FinalRule(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for FinalRule);
}

uint64_t dispatch thunk of FinalRule.__allocating_init(thresholds:)()
{
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_2550C3C7C(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 1701147238;
  unint64_t v3 = 0xE400000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 1701147238;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE300000000000000;
      uint64_t v5 = 7761767;
      break;
    case 2:
      uint64_t v5 = 1937204590;
      break;
    case 3:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x726568746FLL;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE400000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE300000000000000;
      if (v5 == 7761767) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 2:
      uint64_t v2 = 1937204590;
      goto LABEL_9;
    case 3:
      unint64_t v6 = 0xE500000000000000;
      if (v5 == 0x726568746FLL) {
        goto LABEL_12;
      }
      goto LABEL_14;
    default:
LABEL_9:
      if (v5 != v2) {
        goto LABEL_14;
      }
LABEL_12:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_14:
      }
        char v7 = sub_2550DA140();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_2550C3DCC()
{
  uint64_t v0 = ReasonCode.rawValue.getter();
  uint64_t v2 = v1;
  if (v0 == ReasonCode.rawValue.getter() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_2550DA140();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t ReasonCode.rawValue.getter()
{
  uint64_t result = 5854019;
  switch(*v0)
  {
    case 1:
      uint64_t result = 5854037;
      break;
    case 2:
      uint64_t result = 4541768;
      break;
    case 3:
      uint64_t result = 5854787;
      break;
    case 4:
      uint64_t result = 4408658;
      break;
    case 5:
      uint64_t result = 5261654;
      break;
    case 6:
      uint64_t result = 5132099;
      break;
    case 7:
      uint64_t result = 4805200;
      break;
    case 8:
      uint64_t result = 4805196;
      break;
    case 9:
      uint64_t result = 4411980;
      break;
    case 0xA:
      uint64_t result = 5521731;
      break;
    case 0xB:
      uint64_t result = 5260622;
      break;
    case 0xC:
      uint64_t result = 5129550;
      break;
    case 0xD:
      uint64_t result = 5195086;
      break;
    case 0xE:
      uint64_t result = 1162760014;
      break;
    case 0xF:
      uint64_t result = 5002069;
      break;
    case 0x10:
      uint64_t result = 5852231;
      break;
    case 0x11:
      uint64_t result = 5262675;
      break;
    case 0x12:
      uint64_t result = 4410707;
      break;
    case 0x13:
      uint64_t result = 5067604;
      break;
    case 0x14:
      uint64_t result = 4403792;
      break;
    case 0x15:
      uint64_t result = 4474446;
      break;
    case 0x16:
      uint64_t result = 4409428;
      break;
    case 0x17:
      uint64_t result = 4540500;
      break;
    case 0x18:
      uint64_t result = 5261396;
      break;
    case 0x19:
      uint64_t result = 5130324;
      break;
    case 0x1A:
      uint64_t result = 5195860;
      break;
    case 0x1B:
      uint64_t result = 4281157;
      break;
    case 0x1C:
      uint64_t result = 5066309;
      break;
    case 0x1D:
      uint64_t result = 5263182;
      break;
    case 0x1E:
      uint64_t result = 5456211;
      break;
    default:
      return result;
  }
  return result;
}

MCCKitCategorization::ReasonCode_optional __swiftcall ReasonCode.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v2 = v1;
  uint64_t v3 = sub_2550DA160();
  result.value = swift_bridgeObjectRelease();
  char v5 = 0;
  char v6 = 13;
  switch(v3)
  {
    case 0:
      goto LABEL_15;
    case 1:
      char v5 = 1;
      goto LABEL_15;
    case 2:
      char v5 = 2;
      goto LABEL_15;
    case 3:
      char v5 = 3;
      goto LABEL_15;
    case 4:
      char v5 = 4;
      goto LABEL_15;
    case 5:
      char v5 = 5;
      goto LABEL_15;
    case 6:
      char v5 = 6;
      goto LABEL_15;
    case 7:
      char v5 = 7;
      goto LABEL_15;
    case 8:
      char v5 = 8;
      goto LABEL_15;
    case 9:
      char v5 = 9;
      goto LABEL_15;
    case 10:
      char v5 = 10;
      goto LABEL_15;
    case 11:
      char v5 = 11;
      goto LABEL_15;
    case 12:
      char v5 = 12;
LABEL_15:
      char v6 = v5;
      break;
    case 13:
      break;
    case 14:
      char v6 = 14;
      break;
    case 15:
      char v6 = 15;
      break;
    case 16:
      char v6 = 16;
      break;
    case 17:
      char v6 = 17;
      break;
    case 18:
      char v6 = 18;
      break;
    case 19:
      char v6 = 19;
      break;
    case 20:
      char v6 = 20;
      break;
    case 21:
      char v6 = 21;
      break;
    case 22:
      char v6 = 22;
      break;
    case 23:
      char v6 = 23;
      break;
    case 24:
      char v6 = 24;
      break;
    case 25:
      char v6 = 25;
      break;
    case 26:
      char v6 = 26;
      break;
    case 27:
      char v6 = 27;
      break;
    case 28:
      char v6 = 28;
      break;
    case 29:
      char v6 = 29;
      break;
    case 30:
      char v6 = 30;
      break;
    default:
      char v6 = 31;
      break;
  }
  *uint64_t v2 = v6;
  return result;
}

int64_t static ReasonCode.getStringReason(reasonCodes:)(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    sub_2550C47AC(0, v1, 0);
    uint64_t v3 = (unsigned __int8 *)(a1 + 32);
    do
    {
      int v4 = *v3++;
      uint64_t v5 = 5854019;
      unint64_t v6 = 0xE300000000000000;
      switch(v4)
      {
        case 1:
          uint64_t v5 = 5854037;
          break;
        case 2:
          uint64_t v5 = 4541768;
          break;
        case 3:
          uint64_t v5 = 5854787;
          break;
        case 4:
          uint64_t v5 = 4408658;
          break;
        case 5:
          uint64_t v5 = 5261654;
          break;
        case 6:
          uint64_t v5 = 5132099;
          break;
        case 7:
          uint64_t v5 = 4805200;
          break;
        case 8:
          uint64_t v5 = 4805196;
          break;
        case 9:
          uint64_t v5 = 4411980;
          break;
        case 10:
          uint64_t v5 = 5521731;
          break;
        case 11:
          uint64_t v5 = 5260622;
          break;
        case 12:
          uint64_t v5 = 5129550;
          break;
        case 13:
          uint64_t v5 = 5195086;
          break;
        case 14:
          unint64_t v6 = 0xE400000000000000;
          uint64_t v5 = 1162760014;
          break;
        case 15:
          uint64_t v5 = 5002069;
          break;
        case 16:
          uint64_t v5 = 5852231;
          break;
        case 17:
          uint64_t v5 = 5262675;
          break;
        case 18:
          uint64_t v5 = 4410707;
          break;
        case 19:
          uint64_t v5 = 5067604;
          break;
        case 20:
          uint64_t v5 = 4403792;
          break;
        case 21:
          uint64_t v5 = 4474446;
          break;
        case 22:
          uint64_t v5 = 4409428;
          break;
        case 23:
          uint64_t v5 = 4540500;
          break;
        case 24:
          uint64_t v5 = 5261396;
          break;
        case 25:
          uint64_t v5 = 5130324;
          break;
        case 26:
          uint64_t v5 = 5195860;
          break;
        case 27:
          uint64_t v5 = 4281157;
          break;
        case 28:
          uint64_t v5 = 5066309;
          break;
        case 29:
          uint64_t v5 = 5263182;
          break;
        case 30:
          uint64_t v5 = 5456211;
          break;
        default:
          break;
      }
      unint64_t v8 = *(void *)(v11 + 16);
      unint64_t v7 = *(void *)(v11 + 24);
      if (v8 >= v7 >> 1) {
        sub_2550C47AC(v7 > 1, v8 + 1, 1);
      }
      *(void *)(v11 + 16) = v8 + 1;
      uint64_t v9 = v11 + 16 * v8;
      *(void *)(v9 + 32) = v5;
      *(void *)(v9 + 40) = v6;
      --v1;
    }
    while (v1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B278B98);
    sub_2550BF190(&qword_26B278BA0, &qword_26B278B98);
    int64_t v1 = sub_2550D9A90();
    swift_release();
  }
  return v1;
}

void *static ReasonCode.allCases.getter()
{
  return &unk_270442480;
}

uint64_t sub_2550C460C()
{
  return sub_2550C3DCC();
}

uint64_t sub_2550C4618()
{
  return sub_2550DA210();
}

uint64_t sub_2550C4680()
{
  ReasonCode.rawValue.getter();
  sub_2550D9B50();

  return swift_bridgeObjectRelease();
}

uint64_t sub_2550C46E4()
{
  return sub_2550DA210();
}

MCCKitCategorization::ReasonCode_optional sub_2550C4748(Swift::String *a1)
{
  return ReasonCode.init(rawValue:)(*a1);
}

uint64_t sub_2550C4754@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ReasonCode.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_2550C477C(void *a1@<X8>)
{
  *a1 = &unk_270442480;
}

uint64_t sub_2550C478C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2550CD4A4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_2550C47AC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2550CD5F4(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

unint64_t sub_2550C47D0()
{
  unint64_t result = qword_269E84A10;
  if (!qword_269E84A10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84A10);
  }
  return result;
}

uint64_t sub_2550C4824()
{
  return sub_2550BF190(&qword_269E84A18, &qword_269E84A20);
}

uint64_t getEnumTagSinglePayload for ReasonCode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xE2) {
    goto LABEL_17;
  }
  if (a2 + 30 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 30) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 30;
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
      return (*a1 | (v4 << 8)) - 30;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 30;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x1F;
  int v8 = v6 - 31;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ReasonCode(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 30 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 30) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xE2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xE1)
  {
    unsigned int v6 = ((a2 - 226) >> 8) + 1;
    *unint64_t result = a2 + 30;
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
        JUMPOUT(0x2550C49BCLL);
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
          *unint64_t result = a2 + 30;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ReasonCode()
{
  return &type metadata for ReasonCode;
}

uint64_t sub_2550C49F4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2550CD760(a1, a2, a3, *v3);
  *int v3 = (char *)result;
  return result;
}

uint64_t sub_2550C4A14(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2550CDA58(a1, a2, a3, *v3);
  *int v3 = (char *)result;
  return result;
}

uint64_t sub_2550C4A34(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v50[3] = a4;
  if (a1 < 0) {
    goto LABEL_42;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x263F8EE78];
  uint64_t v47 = swift_allocObject();
  *(void *)(v47 + 16) = 15;
  uint64_t v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v12 = HIBYTE(a6) & 0xF) : (uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_2550CD168(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    int v13 = *(void **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  uint64_t v42 = a1;
  uint64_t v43 = v10;
  unint64_t v48 = 4 * v12;
  int v13 = (void *)MEMORY[0x263F8EE78];
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v50[0] = sub_2550D9C50();
    v50[1] = v17;
    char v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    char v19 = v18;
    swift_bridgeObjectRelease();
    if (v19) {
      break;
    }
    unint64_t v14 = sub_2550D9B70();
LABEL_9:
    if (v48 == v14 >> 14) {
      goto LABEL_29;
    }
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v14 = sub_2550D9B70();
    *(void *)(v47 + 16) = v14;
    unint64_t v15 = v14;
    unint64_t v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14) {
    goto LABEL_41;
  }
  uint64_t v20 = sub_2550D9C70();
  uint64_t v44 = v21;
  uint64_t v45 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    int v13 = sub_2550B4F08(0, v13[2] + 1, 1, v13);
  }
  unint64_t v27 = v13[2];
  unint64_t v26 = v13[3];
  if (v27 >= v26 >> 1) {
    int v13 = sub_2550B4F08((void *)(v26 > 1), v27 + 1, 1, v13);
  }
  id v13[2] = v27 + 1;
  uint64_t v28 = &v13[4 * v27];
  v28[4] = v45;
  void v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(void *)(v43 + 16) = v13;
  uint64_t v29 = sub_2550D9B70();
  unint64_t v14 = v29;
  *(void *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    unint64_t v15 = v29;
    unint64_t v16 = v29;
    goto LABEL_9;
  }
  unint64_t v16 = v29;
  unint64_t v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    uint64_t v31 = sub_2550D9C70();
    uint64_t v33 = v32;
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int v13 = sub_2550B4F08(0, v13[2] + 1, 1, v13);
    }
    unint64_t v39 = v13[2];
    unint64_t v38 = v13[3];
    if (v39 >= v38 >> 1) {
      int v13 = sub_2550B4F08((void *)(v38 > 1), v39 + 1, 1, v13);
    }
    id v13[2] = v39 + 1;
    unint64_t v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(void *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_2550D9FC0();
  __break(1u);
LABEL_42:
  uint64_t result = sub_2550D9FC0();
  __break(1u);
  return result;
}

uint64_t sub_2550C4ED8(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, unint64_t a5, unint64_t a6)
{
  v47[3] = a4;
  if (a1 < 0) {
    goto LABEL_35;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x263F8EE78];
  uint64_t v44 = swift_allocObject();
  *(void *)(v44 + 16) = a5;
  if (!a1 || (unint64_t v45 = a6 >> 14, a6 >> 14 == a5 >> 14))
  {
    sub_2550CD2C4(a6, v44, a2 & 1, v10);
    swift_bridgeObjectRelease();
    a6 = *(void *)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_5:
    swift_release();
    return a6;
  }
  uint64_t v35 = a1;
  uint64_t v36 = v10;
  uint64_t v43 = (void *)MEMORY[0x263F8EE78];
  unint64_t v12 = a5;
  unint64_t v13 = a5;
  unint64_t v40 = a5;
  while (1)
  {
    v47[0] = sub_2550D9E60();
    v47[1] = v14;
    char v15 = a3(v47);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return a6;
    }
    char v16 = v15;
    swift_bridgeObjectRelease();
    if (v16) {
      break;
    }
    unint64_t v12 = sub_2550D9E50();
LABEL_9:
    if (v45 == v12 >> 14) {
      goto LABEL_24;
    }
  }
  if (v13 >> 14 == v12 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v12 = sub_2550D9E50();
    *(void *)(v44 + 16) = v12;
    unint64_t v13 = v12;
    unint64_t v40 = v12;
    goto LABEL_9;
  }
  if (v12 >> 14 < v13 >> 14) {
    goto LABEL_34;
  }
  uint64_t v17 = sub_2550D9E80();
  uint64_t v39 = v18;
  uint64_t v41 = v17;
  uint64_t v37 = v20;
  uint64_t v38 = v19;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v43 = sub_2550B4F08(0, v43[2] + 1, 1, v43);
  }
  unint64_t v22 = v43[2];
  unint64_t v21 = v43[3];
  if (v22 >= v21 >> 1) {
    uint64_t v43 = sub_2550B4F08((void *)(v21 > 1), v22 + 1, 1, v43);
  }
  void v43[2] = v22 + 1;
  uint64_t v23 = &v43[4 * v22];
  v23[4] = v41;
  v23[5] = v39;
  v23[6] = v38;
  v23[7] = v37;
  *(void *)(v36 + 16) = v43;
  uint64_t v24 = sub_2550D9E50();
  unint64_t v12 = v24;
  *(void *)(v44 + 16) = v24;
  if (v43[2] != v35)
  {
    unint64_t v13 = v24;
    unint64_t v40 = v24;
    goto LABEL_9;
  }
  unint64_t v40 = v24;
  unint64_t v13 = v24;
LABEL_24:
  if (v45 == v13 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    a6 = (unint64_t)v43;
LABEL_33:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_5;
  }
  if (v45 >= v40 >> 14)
  {
    uint64_t v25 = sub_2550D9E80();
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    uint64_t v31 = v30;
    swift_bridgeObjectRelease();
    a6 = (unint64_t)v43;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      a6 = (unint64_t)sub_2550B4F08(0, v43[2] + 1, 1, v43);
    }
    unint64_t v33 = *(void *)(a6 + 16);
    unint64_t v32 = *(void *)(a6 + 24);
    if (v33 >= v32 >> 1) {
      a6 = (unint64_t)sub_2550B4F08((void *)(v32 > 1), v33 + 1, 1, (void *)a6);
    }
    *(void *)(a6 + 16) = v33 + 1;
    uint64_t v34 = (void *)(a6 + 32 * v33);
    void v34[4] = v25;
    void v34[5] = v27;
    void v34[6] = v29;
    v34[7] = v31;
    *(void *)(v36 + 16) = a6;
    goto LABEL_33;
  }
LABEL_34:
  sub_2550D9FC0();
  __break(1u);
LABEL_35:
  uint64_t result = sub_2550D9FC0();
  __break(1u);
  return result;
}

_OWORD *DecisionStrategy.__allocating_init(hashing:blackPearlLevels:nerRule:domainMap:tsSubjectMap:tsSenderMap:catMap:saasSenderMap:commerceSenderRule:guaranteeList:finalRule:)(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10)
{
  uint64_t v14 = *(void *)(a4 + 24);
  uint64_t v30 = *(void *)(a4 + 32);
  uint64_t v32 = __swift_mutable_project_boxed_opaque_existential_1(a4, v14);
  uint64_t v37 = a5;
  uint64_t v15 = *(void *)(a5 + 24);
  uint64_t v28 = *(void *)(a5 + 32);
  uint64_t v31 = __swift_mutable_project_boxed_opaque_existential_1(a5, v15);
  uint64_t v16 = *(void *)(a6 + 24);
  uint64_t v26 = *(void *)(a6 + 32);
  uint64_t v29 = __swift_mutable_project_boxed_opaque_existential_1(a6, v16);
  uint64_t v17 = *(void *)(a7 + 24);
  uint64_t v18 = *(void *)(a7 + 32);
  uint64_t v27 = __swift_mutable_project_boxed_opaque_existential_1(a7, v17);
  uint64_t v20 = *(void *)(a8 + 24);
  uint64_t v19 = *(void *)(a8 + 32);
  uint64_t v21 = __swift_mutable_project_boxed_opaque_existential_1(a8, v20);
  *((void *)&v25 + 1) = v30;
  *((void *)&v24 + 1) = v28;
  *(void *)&long long v25 = v18;
  *(void *)&long long v24 = v19;
  unint64_t v22 = sub_2550D046C(a1, a2, a3, v32, v31, v29, v27, v21, a9, a10, v36, v20, v15, v17, v14, v16, v24, v25, v26);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(a8);
  __swift_destroy_boxed_opaque_existential_0(a7);
  __swift_destroy_boxed_opaque_existential_0(a6);
  __swift_destroy_boxed_opaque_existential_0(v37);
  __swift_destroy_boxed_opaque_existential_0(a4);
  return v22;
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

unint64_t sub_2550C5560(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    int v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278BF0);
  uint64_t v2 = sub_2550DA010();
  int v3 = (void *)v2;
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
    sub_2550D2FAC(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_2550AAB38(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_2550AD184(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

unint64_t sub_2550C568C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278BE8);
  uint64_t v2 = (void *)sub_2550DA010();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_2550AAB38(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
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

uint64_t sub_2550C57A0(uint64_t a1)
{
  return sub_2550C5B78(a1, (uint64_t (*)(void))sub_2550B5018);
}

uint64_t sub_2550C57B8(uint64_t result, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    unint64_t result = sub_2550D9BC0();
    uint64_t v3 = result;
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    uint64_t v3 = HIBYTE(a2) & 0xF;
  }
  else
  {
    uint64_t v3 = result & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  int64_t v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
  }
  else
  {
    char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v2 = v4;
    if (!isUniquelyReferenced_nonNull_native || *((void *)v4 + 3) >> 1 < v6)
    {
      if (v5 <= v6) {
        int64_t v8 = v5 + v3;
      }
      else {
        int64_t v8 = v5;
      }
      uint64_t v4 = sub_2550B5018(isUniquelyReferenced_nonNull_native, v8, 1, v4);
      *uint64_t v2 = v4;
    }
    swift_bridgeObjectRetain();
    unint64_t result = sub_2550D9F70();
    if (v9) {
      goto LABEL_22;
    }
    uint64_t v10 = result;
    unint64_t result = swift_bridgeObjectRelease_n();
    if (v10 >= v3)
    {
      if (v10 < 1)
      {
LABEL_17:
        *uint64_t v2 = v4;
        return result;
      }
      uint64_t v11 = *((void *)v4 + 2);
      BOOL v12 = __OFADD__(v11, v10);
      uint64_t v13 = v11 + v10;
      if (!v12)
      {
        *((void *)v4 + 2) = v13;
        goto LABEL_17;
      }
      goto LABEL_21;
    }
  }
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_2550C58E4(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
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
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_2550B5348(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v10 = &v3[4 * v9 + 32];
  if (a1 + 32 < (unint64_t)&v10[4 * v8] && (unint64_t)v10 < a1 + 32 + 4 * v8) {
    goto LABEL_24;
  }
  memcpy(v10, (const void *)(a1 + 32), 4 * v8);
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = *((void *)v3 + 2);
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    *((void *)v3 + 2) = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *int64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_2550DA020();
  __break(1u);
  return result;
}

uint64_t sub_2550C5A30(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_2550B5024(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v9 = &v3[v8 + 4];
  if (a1 + 32 < (unint64_t)&v9[v2] && (unint64_t)v9 < a1 + 32 + 8 * v2) {
    goto LABEL_24;
  }
  memcpy(v9, (const void *)(a1 + 32), 8 * v2);
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_2550DA020();
  __break(1u);
  return result;
}

uint64_t sub_2550C5B78(uint64_t a1, uint64_t (*a2)(void))
{
  int64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 16);
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (swift_isUniquelyReferenced_nonNull_native() && v5 + v3 <= *(void *)(v4 + 24) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
  uint64_t v4 = a2();
  if (!*(void *)(a1 + 16))
  {
LABEL_15:
    if (!v3) {
      goto LABEL_16;
    }
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v8 = *(void *)(v4 + 16);
  if ((*(void *)(v4 + 24) >> 1) - v8 < v3)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = (void *)(v4 + v8 + 32);
  if (a1 + 32 < (unint64_t)v9 + v3 && (unint64_t)v9 < a1 + 32 + v3) {
    goto LABEL_21;
  }
  memcpy(v9, (const void *)(a1 + 32), v3);
  if (!v3)
  {
LABEL_16:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v2 = v4;
    return result;
  }
  uint64_t v11 = *(void *)(v4 + 16);
  BOOL v12 = __OFADD__(v11, v3);
  uint64_t v13 = v11 + v3;
  if (!v12)
  {
    *(void *)(v4 + 16) = v13;
    goto LABEL_16;
  }
LABEL_20:
  __break(1u);
LABEL_21:
  uint64_t result = sub_2550DA020();
  __break(1u);
  return result;
}

unint64_t sub_2550C5CD0(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v3 >= result >> 14) {
    return sub_2550D9C70();
  }
  __break(1u);
  return result;
}

uint64_t PredictionRequest.senderEmail.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PredictionRequest.senderEmail.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*PredictionRequest.senderEmail.modify())()
{
  return nullsub_1;
}

uint64_t PredictionRequest.receiverEmail.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PredictionRequest.emailSubject.getter()
{
  uint64_t v1 = *(void *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PredictionRequest.isUnsubscribeHeaderPresent.getter()
{
  return *(unsigned __int8 *)(v0 + 48);
}

double PredictionRequest.senderScore.getter()
{
  return *(double *)(v0 + 56);
}

void PredictionRequest.senderModelResult.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 64);
}

uint64_t PredictionRequest.isHME.getter()
{
  return *(unsigned __int8 *)(v0 + 65);
}

void __swiftcall PredictionRequest.init(senderEmail:receiverEmail:emailSubject:isUnsubscribeHeaderPresent:senderScore:senderModelResult:isHME:)(MCCKitCategorization::PredictionRequest *__return_ptr retstr, Swift::String senderEmail, Swift::String receiverEmail, Swift::String emailSubject, Swift::Bool isUnsubscribeHeaderPresent, Swift::Double senderScore, MCCKitCategorization::ReasonCode senderModelResult, Swift::Bool isHME)
{
  MCCKitCategorization::ReasonCode v8 = *(unsigned char *)senderModelResult;
  retstr->senderEmail = senderEmail;
  retstr->receiverEmail = receiverEmail;
  retstr->emailSubject = emailSubject;
  retstr->isUnsubscribeHeaderPresent = isUnsubscribeHeaderPresent;
  retstr->senderScore = senderScore;
  retstr->senderModelResult = v8;
  retstr->isHME = isHME;
}

void __swiftcall PredictionRequest.init(decisionRequest:originalSender:isHME:senderScore:senderModelResult:)(MCCKitCategorization::PredictionRequest *__return_ptr retstr, MCCKitCategorization::DecisionRequest *decisionRequest, Swift::String originalSender, Swift::Bool isHME, Swift::Double senderScore, MCCKitCategorization::ReasonCode senderModelResult)
{
  object = decisionRequest->receiverEmail.value._object;
  uint64_t countAndFlagsBits = decisionRequest->emailSubject._countAndFlagsBits;
  uint64_t v11 = decisionRequest->emailSubject._object;
  Swift::Bool isUnsubscribeHeaderPresent = decisionRequest->isUnsubscribeHeaderPresent;
  MCCKitCategorization::ReasonCode v13 = *(unsigned char *)senderModelResult;
  if (object)
  {
    uint64_t v14 = decisionRequest->receiverEmail.value._countAndFlagsBits;
    int64_t v15 = object;
  }
  else
  {
    uint64_t v14 = 0;
    int64_t v15 = (void *)0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  retstr->senderEmail = originalSender;
  retstr->receiverEmail._uint64_t countAndFlagsBits = v14;
  retstr->receiverEmail._object = v15;
  retstr->emailSubject._uint64_t countAndFlagsBits = countAndFlagsBits;
  retstr->emailSubject._object = v11;
  retstr->Swift::Bool isUnsubscribeHeaderPresent = isUnsubscribeHeaderPresent;
  retstr->senderScore = senderScore;
  retstr->senderModelResult = v13;
  retstr->isHME = isHME;
}

_OWORD *DecisionStrategy.init(hashing:blackPearlLevels:nerRule:domainMap:tsSubjectMap:tsSenderMap:catMap:saasSenderMap:commerceSenderRule:guaranteeList:finalRule:)(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v56 = a3;
  uint64_t v55 = a2;
  uint64_t v52 = a9;
  id v53 = a1;
  uint64_t v50 = a11;
  uint64_t v51 = a10;
  uint64_t v58 = a4;
  uint64_t v15 = *(void *)(a4 + 24);
  uint64_t v49 = *(void *)(a4 + 32);
  uint64_t v16 = __swift_mutable_project_boxed_opaque_existential_1(a4, v15);
  MEMORY[0x270FA5388](v16);
  uint64_t v48 = (uint64_t)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(void))(v18 + 16))();
  uint64_t v54 = a5;
  uint64_t v19 = *(void *)(a5 + 24);
  uint64_t v46 = *(void *)(a5 + 32);
  uint64_t v20 = __swift_mutable_project_boxed_opaque_existential_1(a5, v19);
  MEMORY[0x270FA5388](v20);
  unint64_t v22 = (char *)&v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v23 + 16))(v22);
  uint64_t v47 = a6;
  uint64_t v24 = *(void *)(a6 + 24);
  uint64_t v44 = *(void *)(a6 + 32);
  uint64_t v25 = __swift_mutable_project_boxed_opaque_existential_1(a6, v24);
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (char *)&v42 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v28 + 16))(v27);
  uint64_t v45 = a7;
  uint64_t v29 = *(void *)(a7 + 24);
  uint64_t v42 = *(void *)(a7 + 32);
  uint64_t v30 = __swift_mutable_project_boxed_opaque_existential_1(a7, v29);
  MEMORY[0x270FA5388](v30);
  uint64_t v32 = (char *)&v42 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v33 + 16))(v32);
  uint64_t v43 = a8;
  uint64_t v34 = *(void *)(a8 + 24);
  uint64_t v35 = *(void *)(a8 + 32);
  uint64_t v36 = __swift_mutable_project_boxed_opaque_existential_1(a8, v34);
  MEMORY[0x270FA5388](v36);
  uint64_t v38 = (char *)&v42 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v39 + 16))(v38);
  unint64_t v40 = sub_2550CFF00(v53, v55, v56, v48, (uint64_t)v22, (uint64_t)v27, (uint64_t)v32, (uint64_t)v38, v52, v51, v50, v57, v34, v19, v29, v15, v24, v35, v46,
          v42,
          v49,
          v44);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v43);
  __swift_destroy_boxed_opaque_existential_0(v45);
  __swift_destroy_boxed_opaque_existential_0(v47);
  __swift_destroy_boxed_opaque_existential_0(v54);
  __swift_destroy_boxed_opaque_existential_0(v58);
  return v40;
}

uint64_t DecisionStrategy.deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
  uint64_t v3 = type metadata accessor for BlackPearlModel(0);
  uint64_t v4 = *(int *)(v3 + 32);
  uint64_t v5 = *(void **)(v2 + v4);
  *(void *)(v2 + v4) = 0;

  uint64_t v6 = type metadata accessor for BlackPearlLevels();
  uint64_t v7 = v2 + *(int *)(v6 + 20);
  uint64_t v8 = *(int *)(v3 + 32);
  uint64_t v9 = *(void **)(v7 + v8);
  *(void *)(v7 + v8) = 0;

  uint64_t v10 = v2 + *(int *)(v6 + 24);
  uint64_t v11 = *(int *)(v3 + 32);
  BOOL v12 = *(void **)(v10 + v11);
  *(void *)(v10 + v11) = 0;

  if (qword_26B278B80 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_2550D9A00();
  __swift_project_value_buffer(v13, (uint64_t)qword_26B279BA0);
  swift_retain_n();
  uint64_t v14 = sub_2550D99E0();
  os_log_type_t v15 = sub_2550D9DD0();
  if (os_log_type_enabled(v14, v15))
  {
    os_log_type_t v25 = v15;
    log = v14;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 138412802;
    uint64_t v18 = *(void **)(v2 + *(int *)(v3 + 32));
    if (v18) {
      id v19 = v18;
    }
    sub_2550D9E90();
    *uint64_t v17 = v18;
    swift_release_n();
    *(_WORD *)(v16 + 12) = 2112;
    uint64_t v20 = *(void **)(v2 + *(int *)(v6 + 20) + *(int *)(v3 + 32));
    if (v20) {
      id v21 = v20;
    }
    sub_2550D9E90();
    v17[1] = v20;
    swift_release_n();
    *(_WORD *)(v16 + 22) = 2112;
    unint64_t v22 = *(void **)(v2 + *(int *)(v6 + 24) + *(int *)(v3 + 32));
    if (v22) {
      id v23 = v22;
    }
    sub_2550D9E90();
    _OWORD v17[2] = v22;
    swift_release_n();
    _os_log_impl(&dword_25509D000, log, v25, "Destroyed DecisionStrategy model  %@, %@, %@", (uint8_t *)v16, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E847D8);
    swift_arrayDestroy();
    MEMORY[0x25A2881E0](v17, -1, -1);
    MEMORY[0x25A2881E0](v16, -1, -1);
  }
  else
  {

    swift_release_n();
  }

  swift_bridgeObjectRelease();
  sub_2550D0840(v2);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v1 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_domainMap);
  __swift_destroy_boxed_opaque_existential_0(v1 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsSubjectMap);
  __swift_destroy_boxed_opaque_existential_0(v1 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsSenderMap);
  __swift_destroy_boxed_opaque_existential_0(v1 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_catMap);
  __swift_destroy_boxed_opaque_existential_0(v1 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_saasSenderMap);
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  return v1;
}

uint64_t DecisionStrategy.__deallocating_deinit()
{
  DecisionStrategy.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2550C6814@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1[3];
  uint64_t v5 = a1[4];
  unint64_t v4 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  char v8 = *((unsigned char *)a1 + 64);
  char v9 = *((unsigned char *)a1 + 65);
  char v10 = *((unsigned char *)a1 + 66);
  char v11 = *((unsigned char *)a1 + 67);
  char v12 = *((unsigned char *)a1 + 68);
  int v13 = *((unsigned __int8 *)a1 + 69);
  uint64_t v14 = a1[9];
  uint64_t v15 = a1[10];
  uint64_t v79 = a1[1];
  uint64_t v80 = *a1;
  v97[0] = *a1;
  v97[1] = v79;
  unint64_t v82 = v3;
  uint64_t v83 = v2;
  v97[2] = v2;
  v97[3] = v3;
  v97[4] = v5;
  v97[5] = v4;
  v97[6] = v6;
  v97[7] = v7;
  char v98 = v8;
  char v99 = v9;
  char v100 = v10;
  char v78 = v11;
  char v101 = v11;
  char v102 = v12;
  char v103 = v13;
  uint64_t v76 = v15;
  uint64_t v77 = v14;
  uint64_t v104 = v14;
  uint64_t v105 = v15;
  sub_2550C8EAC((uint64_t)v97, (uint64_t)v106);
  sub_2550D2ED0((uint64_t)v106, (uint64_t)v97, &qword_26B278B60);
  sub_2550D2ED0((uint64_t)v97, (uint64_t)v106, &qword_26B278B60);
  if (sub_2550D089C((uint64_t)v106) != 1) {
    return sub_2550D2ED0((uint64_t)v97, a2, &qword_26B278B60);
  }
  *(void *)&long long v86 = v80;
  *((void *)&v86 + 1) = v79;
  *(void *)&long long v87 = v83;
  *((void *)&v87 + 1) = v82;
  *(void *)&long long v88 = v5;
  *((void *)&v88 + 1) = v4;
  *(void *)&long long v89 = v6;
  *((void *)&v89 + 1) = v7;
  LOBYTE(v90) = v8;
  BYTE1(v90) = v9;
  BYTE2(v90) = v10;
  BYTE3(v90) = v78;
  BYTE4(v90) = v12;
  BYTE5(v90) = v13;
  *((void *)&v90 + 1) = v77;
  *(void *)&long long v91 = v76;
  uint64_t v16 = sub_2550D08B4((unsigned __int8 *)&v86);
  if (v17)
  {
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v18 = sub_2550D9A00();
    __swift_project_value_buffer(v18, (uint64_t)qword_26B279BA0);
    id v19 = sub_2550D99E0();
    os_log_type_t v20 = sub_2550D9DC0();
    uint64_t v21 = a2;
    if (os_log_type_enabled(v19, v20))
    {
      unint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v22 = 0;
      _os_log_impl(&dword_25509D000, v19, v20, "Returning categorization result for CVR sender", v22, 2u);
      MEMORY[0x25A2881E0](v22, -1, -1);
    }

    uint64_t v23 = v75 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
    uint64_t v24 = (long long *)(v23 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
    long long v25 = v24[9];
    long long v27 = v24[7];
    long long v94 = v24[8];
    long long v26 = v94;
    long long v95 = v25;
    long long v28 = v24[9];
    v96[0] = v24[10];
    *(_OWORD *)((char *)v96 + 9) = *(long long *)((char *)v24 + 169);
    long long v29 = v24[5];
    long long v31 = v24[3];
    long long v90 = v24[4];
    long long v30 = v90;
    long long v91 = v29;
    long long v32 = v24[5];
    long long v33 = v24[7];
    long long v92 = v24[6];
    long long v34 = v92;
    long long v93 = v33;
    long long v35 = v24[1];
    long long v37 = v24[2];
    long long v36 = v24[3];
    long long v88 = v37;
    long long v89 = v36;
    long long v38 = v24[1];
    long long v86 = *v24;
    long long v39 = v86;
    long long v87 = v38;
    *(_DWORD *)a2 = 117571584;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(a2 + 8) = _Q0;
    *(_OWORD *)(a2 + 24) = _Q0;
    *(_OWORD *)(a2 + 176) = v26;
    *(_OWORD *)(a2 + 192) = v28;
    *(_OWORD *)(a2 + 208) = v24[10];
    *(_OWORD *)(a2 + 217) = *(long long *)((char *)v24 + 169);
    *(_OWORD *)(a2 + 112) = v30;
    *(_OWORD *)(a2 + 128) = v32;
    *(_OWORD *)(a2 + 144) = v34;
    *(_OWORD *)(a2 + 160) = v27;
    *(_OWORD *)(a2 + 48) = v39;
    *(_OWORD *)(a2 + 64) = v35;
LABEL_15:
    *(void *)(v21 + 40) = v16;
    *(_OWORD *)(v21 + 80) = v37;
    *(_OWORD *)(v21 + 96) = v31;
    return sub_25509F83C((uint64_t)&v86);
  }
  uint64_t v81 = v6;
  swift_bridgeObjectRelease();
  sub_2550C6DA4(v83, v82, (uint64_t)&v86);
  uint64_t v16 = (char *)v86;
  if ((void)v86)
  {
    int v46 = BYTE8(v86);
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v47 = sub_2550D9A00();
    __swift_project_value_buffer(v47, (uint64_t)qword_26B279BA0);
    uint64_t v48 = sub_2550D99E0();
    os_log_type_t v49 = sub_2550D9DC0();
    uint64_t v21 = a2;
    if (os_log_type_enabled(v48, v49))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v50 = 0;
      _os_log_impl(&dword_25509D000, v48, v49, "Returning categorization result from Guaranteed list", v50, 2u);
      MEMORY[0x25A2881E0](v50, -1, -1);
    }

    uint64_t v51 = v75 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
    uint64_t v52 = (long long *)(v51 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
    long long v53 = v52[9];
    long long v55 = v52[7];
    long long v94 = v52[8];
    long long v54 = v94;
    long long v95 = v53;
    long long v56 = v52[9];
    v96[0] = v52[10];
    *(_OWORD *)((char *)v96 + 9) = *(long long *)((char *)v52 + 169);
    long long v57 = v52[5];
    long long v31 = v52[3];
    long long v90 = v52[4];
    long long v58 = v90;
    long long v91 = v57;
    long long v59 = v52[5];
    long long v60 = v52[7];
    long long v92 = v52[6];
    long long v61 = v92;
    long long v93 = v60;
    long long v62 = v52[1];
    long long v37 = v52[2];
    long long v63 = v52[3];
    long long v88 = v37;
    long long v89 = v63;
    long long v64 = v52[1];
    long long v86 = *v52;
    long long v65 = v86;
    long long v87 = v64;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(a2 + 8) = _Q0;
    *(_OWORD *)(a2 + 24) = _Q0;
    *(_OWORD *)(a2 + 176) = v54;
    *(_OWORD *)(a2 + 192) = v56;
    *(_OWORD *)(a2 + 208) = v52[10];
    *(_OWORD *)(a2 + 217) = *(long long *)((char *)v52 + 169);
    *(_OWORD *)(a2 + 112) = v58;
    *(_OWORD *)(a2 + 128) = v59;
    *(_OWORD *)(a2 + 144) = v61;
    *(_OWORD *)(a2 + 160) = v55;
    *(_OWORD *)(a2 + 48) = v65;
    *(_OWORD *)(a2 + 64) = v62;
    *(unsigned char *)a2 = v46 != 2;
    *(unsigned char *)(a2 + 1) = 0;
    *(unsigned char *)(a2 + 2) = v46;
    *(unsigned char *)(a2 + 3) = 7;
    goto LABEL_15;
  }
  uint64_t v67 = sub_2550CB214(v83, v82);
  unint64_t v69 = v68;
  char v84 = v70;
  sub_2550CAD04((char *)&v86, v67, v68);
  char v72 = v86;
  if (v4) {
    uint64_t v73 = v5;
  }
  else {
    uint64_t v73 = 0;
  }
  if (v4) {
    unint64_t v74 = v4;
  }
  else {
    unint64_t v74 = 0xE000000000000000;
  }
  *(void *)&long long v86 = v67;
  *((void *)&v86 + 1) = v69;
  *(void *)&long long v87 = v73;
  *((void *)&v87 + 1) = v74;
  *(void *)&long long v88 = v81;
  *((void *)&v88 + 1) = v7;
  LOBYTE(v89) = v8;
  *((void *)&v89 + 1) = v71;
  LOBYTE(v90) = v72;
  BYTE1(v90) = v84 & 1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v13) {
    sub_2550C7F08((uint64_t)&v86, a2);
  }
  else {
    sub_2550C70E0((uint64_t)&v86, a2);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

char sub_2550C6DA4@<W0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = *(void **)(v3 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_guaranteeList);
  uint64_t v8 = v7[5];
  uint64_t v9 = v7[6];
  __swift_project_boxed_opaque_existential_1(v7 + 2, v8);
  char v10 = (char *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 16))(a1, a2, v8, v9);
  if ((v11 & 1) != 0 || (LOBYTE(v10) = Category.init(rawValue:)((Swift::Int)v10), char v12 = v18, v18 == 9))
  {
    int v13 = 0;
    char v12 = 0;
  }
  else
  {
    char v10 = sub_2550B5134(0, 1, 1, MEMORY[0x263F8EE78]);
    int v13 = v10;
    unint64_t v15 = *((void *)v10 + 2);
    unint64_t v14 = *((void *)v10 + 3);
    unint64_t v16 = v15 + 1;
    if (v15 >= v14 >> 1)
    {
      char v10 = sub_2550B5134((char *)(v14 > 1), v15 + 1, 1, v10);
      unint64_t v16 = v15 + 1;
      int v13 = v10;
    }
    *((void *)v13 + 2) = v16;
    v13[v15 + 32] = 16;
  }
  *(void *)a3 = v13;
  *(unsigned char *)(a3 + 8) = v12;
  return (char)v10;
}

char *sub_2550C6EB4(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t v6 = sub_2550D9B10();
  uint64_t v8 = v7;
  swift_bridgeObjectRetain();
  v9._uint64_t countAndFlagsBits = v6;
  v9._object = v8;
  BloomFilter.mayContain(object:)(v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (ReasonCode.rawValue.getter() == 5854019 && v10 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    char v12 = sub_2550B5134(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v14 = *((void *)v12 + 2);
    unint64_t v13 = *((void *)v12 + 3);
    unint64_t v15 = v14 + 1;
    if (v14 >= v13 >> 1) {
      char v12 = sub_2550B5134((char *)(v13 > 1), v14 + 1, 1, v12);
    }
    char v16 = 0;
    goto LABEL_8;
  }
  char v11 = sub_2550DA140();
  swift_bridgeObjectRelease();
  if (v11) {
    goto LABEL_5;
  }
  if (a3)
  {
    char v16 = 1;
    char v12 = sub_2550B5134(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v14 = *((void *)v12 + 2);
    unint64_t v18 = *((void *)v12 + 3);
    unint64_t v15 = v14 + 1;
    if (v14 >= v18 >> 1)
    {
      char v16 = 1;
      char v12 = sub_2550B5134((char *)(v18 > 1), v14 + 1, 1, v12);
    }
  }
  else
  {
    if ((a4 & 1) == 0) {
      return (char *)MEMORY[0x263F8EE78];
    }
    char v12 = sub_2550B5134(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v14 = *((void *)v12 + 2);
    unint64_t v19 = *((void *)v12 + 3);
    unint64_t v15 = v14 + 1;
    if (v14 >= v19 >> 1) {
      char v12 = sub_2550B5134((char *)(v19 > 1), v14 + 1, 1, v12);
    }
    char v16 = 2;
  }
LABEL_8:
  *((void *)v12 + 2) = v15;
  v12[v14 + 32] = v16;
  return v12;
}

void sub_2550C70E0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)a1;
  unint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v8 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  Swift::String v9 = *(void (**)(char *, uint64_t))(a1 + 40);
  char v11 = *(unsigned char *)(a1 + 48);
  double v12 = *(double *)(a1 + 56);
  char v13 = *(unsigned char *)(a1 + 65);
  v168 = (char *)MEMORY[0x263F8EE78];
  unint64_t v14 = sub_2550C6EB4(v5, v6, v11, v13);
  char v16 = v15;
  sub_2550C5B78((uint64_t)v14, (uint64_t (*)(void))sub_2550B5134);
  if ((v16 & 1) == 0)
  {
    uint64_t v144 = v2;
    uint64_t v17 = HIBYTE(v6) & 0xF;
    if ((v6 & 0x2000000000000000) == 0) {
      uint64_t v17 = v5 & 0xFFFFFFFFFFFFLL;
    }
    if (v17)
    {
      unint64_t v18 = sub_2550D0DBC(v5, v6);
      uint64_t v20 = sub_2550C9BE4(v18, v19);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v20 = -1;
    }
    uint64_t v21 = HIBYTE(v8) & 0xF;
    if ((v8 & 0x2000000000000000) == 0) {
      uint64_t v21 = v7 & 0xFFFFFFFFFFFFLL;
    }
    if (v21)
    {
      unint64_t v22 = sub_2550D0DBC(v7, v8);
      uint64_t v24 = sub_2550C9BE4(v22, v23);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v24 = -1;
    }
    if (sub_2550C3990((char *)&v157, v20, v24, v12))
    {
      char v25 = v157;
      long long v26 = v168;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        long long v26 = sub_2550B5134(0, *((void *)v26 + 2) + 1, 1, v26);
      }
      unint64_t v28 = *((void *)v26 + 2);
      unint64_t v27 = *((void *)v26 + 3);
      if (v28 >= v27 >> 1) {
        long long v26 = sub_2550B5134((char *)(v27 > 1), v28 + 1, 1, v26);
      }
      *((void *)v26 + 2) = v28 + 1;
      v26[v28 + 32] = v25;
      if (qword_26B278B80 != -1) {
        swift_once();
      }
      uint64_t v29 = sub_2550D9A00();
      __swift_project_value_buffer(v29, (uint64_t)qword_26B279BA0);
      long long v30 = sub_2550D99E0();
      os_log_type_t v31 = sub_2550D9DC0();
      if (os_log_type_enabled(v30, v31))
      {
        long long v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)long long v32 = 0;
        _os_log_impl(&dword_25509D000, v30, v31, "Returning categorization result for non commerce sender", v32, 2u);
        MEMORY[0x25A2881E0](v32, -1, -1);
      }

      uint64_t v33 = v144 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
      long long v34 = (long long *)(v33 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
      long long v35 = v34[9];
      long long v37 = v34[7];
      long long v165 = v34[8];
      long long v36 = v165;
      long long v166 = v35;
      long long v38 = v34[9];
      v167[0] = v34[10];
      *(_OWORD *)((char *)v167 + 9) = *(long long *)((char *)v34 + 169);
      long long v39 = v34[5];
      long long v41 = v34[3];
      long long v161 = v34[4];
      long long v40 = v161;
      long long v162 = v39;
      long long v42 = v34[5];
      long long v43 = v34[7];
      long long v163 = v34[6];
      long long v44 = v163;
      long long v164 = v43;
      long long v45 = v34[1];
      long long v47 = v34[2];
      long long v46 = v34[3];
      long long v159 = v47;
      long long v160 = v46;
      long long v48 = v34[1];
      long long v157 = *v34;
      long long v49 = v157;
      long long v158 = v48;
      *(_DWORD *)a2 = 117571584;
      *(double *)(a2 + 16) = v12;
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)(a2 + 24) = _Q0;
      *(_OWORD *)(a2 + 176) = v36;
      *(_OWORD *)(a2 + 192) = v38;
      *(_OWORD *)(a2 + 208) = v34[10];
      *(_OWORD *)(a2 + 217) = *(long long *)((char *)v34 + 169);
      *(_OWORD *)(a2 + 112) = v40;
      *(_OWORD *)(a2 + 128) = v42;
      *(_OWORD *)(a2 + 144) = v44;
      *(_OWORD *)(a2 + 160) = v37;
      *(_OWORD *)(a2 + 48) = v49;
      *(_OWORD *)(a2 + 64) = v45;
      *(void *)(a2 + 8) = 0x3FF0000000000000;
LABEL_51:
      *(void *)(a2 + 40) = v26;
LABEL_52:
      *(_OWORD *)(a2 + 80) = v47;
      *(_OWORD *)(a2 + 96) = v41;
      sub_25509F83C((uint64_t)&v157);
      return;
    }
  }
  if (((unint64_t)v9 & 0x2000000000000000) == 0)
  {
    if ((v10 & 0xFFFFFFFFFFFFLL) != 0) {
      goto LABEL_24;
    }
LABEL_37:
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v74 = sub_2550D9A00();
    __swift_project_value_buffer(v74, (uint64_t)qword_26B279BA0);
    uint64_t v75 = sub_2550D99E0();
    os_log_type_t v76 = sub_2550D9DC0();
    if (os_log_type_enabled(v75, v76))
    {
      uint64_t v77 = v3;
      char v78 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v78 = 0;
      _os_log_impl(&dword_25509D000, v75, v76, "Returning categorization result for empty subject", v78, 2u);
      uint64_t v79 = v78;
      uint64_t v3 = v77;
      MEMORY[0x25A2881E0](v79, -1, -1);
    }

    uint64_t v80 = v168;
    uint64_t v81 = v3 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
    unint64_t v82 = (long long *)(v81 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
    long long v83 = v82[9];
    long long v85 = v82[7];
    long long v165 = v82[8];
    long long v84 = v165;
    long long v166 = v83;
    long long v86 = v82[9];
    v167[0] = v82[10];
    *(_OWORD *)((char *)v167 + 9) = *(long long *)((char *)v82 + 169);
    long long v87 = v82[5];
    long long v41 = v82[3];
    long long v161 = v82[4];
    long long v88 = v161;
    long long v162 = v87;
    long long v89 = v82[5];
    long long v90 = v82[7];
    long long v163 = v82[6];
    long long v91 = v163;
    long long v164 = v90;
    long long v92 = v82[1];
    long long v47 = v82[2];
    long long v93 = v82[3];
    long long v159 = v47;
    long long v160 = v93;
    long long v94 = v82[1];
    long long v157 = *v82;
    long long v95 = v157;
    long long v158 = v94;
    *(_DWORD *)a2 = 117899264;
    *(double *)(a2 + 16) = v12;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(a2 + 24) = _Q0;
    *(_OWORD *)(a2 + 176) = v84;
    *(_OWORD *)(a2 + 192) = v86;
    *(_OWORD *)(a2 + 208) = v82[10];
    *(_OWORD *)(a2 + 217) = *(long long *)((char *)v82 + 169);
    *(_OWORD *)(a2 + 112) = v88;
    *(_OWORD *)(a2 + 128) = v89;
    *(_OWORD *)(a2 + 144) = v91;
    *(_OWORD *)(a2 + 160) = v85;
    *(_OWORD *)(a2 + 48) = v95;
    *(_OWORD *)(a2 + 64) = v92;
    *(void *)(a2 + 8) = 0x3FF0000000000000;
    *(void *)(a2 + 40) = v80;
    goto LABEL_52;
  }
  if ((((unint64_t)v9 >> 56) & 0xF) == 0) {
    goto LABEL_37;
  }
LABEL_24:
  if ((_s20MCCKitCategorization17LanguageDetectionC7english4textSbSS_tFZ_0() & 1) == 0)
  {
    long long v26 = v168;
    uint64_t v97 = v2;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      long long v26 = sub_2550B5134(0, *((void *)v26 + 2) + 1, 1, v26);
    }
    unint64_t v99 = *((void *)v26 + 2);
    unint64_t v98 = *((void *)v26 + 3);
    if (v99 >= v98 >> 1) {
      long long v26 = sub_2550B5134((char *)(v98 > 1), v99 + 1, 1, v26);
    }
    *((void *)v26 + 2) = v99 + 1;
    v26[v99 + 32] = 15;
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v100 = sub_2550D9A00();
    __swift_project_value_buffer(v100, (uint64_t)qword_26B279BA0);
    char v101 = sub_2550D99E0();
    os_log_type_t v102 = sub_2550D9DC0();
    if (os_log_type_enabled(v101, v102))
    {
      char v103 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v103 = 0;
      _os_log_impl(&dword_25509D000, v101, v102, "Returning categorization result for unsupported language", v103, 2u);
      MEMORY[0x25A2881E0](v103, -1, -1);
    }

    uint64_t v104 = v97 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
    uint64_t v105 = (long long *)(v104 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
    long long v106 = v105[9];
    long long v108 = v105[7];
    long long v165 = v105[8];
    long long v107 = v165;
    long long v166 = v106;
    long long v109 = v105[9];
    v167[0] = v105[10];
    *(_OWORD *)((char *)v167 + 9) = *(long long *)((char *)v105 + 169);
    long long v110 = v105[5];
    long long v41 = v105[3];
    long long v161 = v105[4];
    long long v111 = v161;
    long long v162 = v110;
    long long v112 = v105[5];
    long long v113 = v105[7];
    long long v163 = v105[6];
    long long v114 = v163;
    long long v164 = v113;
    long long v115 = v105[1];
    long long v47 = v105[2];
    long long v116 = v105[3];
    long long v159 = v47;
    long long v160 = v116;
    long long v117 = v105[1];
    long long v157 = *v105;
    long long v118 = v157;
    long long v158 = v117;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(a2 + 8) = _Q0;
    *(_OWORD *)(a2 + 24) = _Q0;
    *(_OWORD *)(a2 + 176) = v107;
    *(_OWORD *)(a2 + 192) = v109;
    *(_OWORD *)(a2 + 208) = v105[10];
    *(_OWORD *)(a2 + 217) = *(long long *)((char *)v105 + 169);
    *(_OWORD *)(a2 + 112) = v111;
    *(_OWORD *)(a2 + 128) = v112;
    *(_OWORD *)(a2 + 144) = v114;
    *(_OWORD *)(a2 + 160) = v108;
    *(_OWORD *)(a2 + 48) = v118;
    *(_OWORD *)(a2 + 64) = v115;
    *(_DWORD *)a2 = 0;
    goto LABEL_51;
  }
  sub_2550C8FE4(&v157, v5, v6, (void *)v10, v9);
  uint64_t v56 = v55;
  uint64_t v145 = v157;
  long long v57 = v168;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    long long v57 = sub_2550B5134(0, *((void *)v57 + 2) + 1, 1, v57);
  }
  unint64_t v59 = *((void *)v57 + 2);
  unint64_t v58 = *((void *)v57 + 3);
  if (v59 >= v58 >> 1) {
    long long v57 = sub_2550B5134((char *)(v58 > 1), v59 + 1, 1, v57);
  }
  *((void *)v57 + 2) = v59 + 1;
  v57[v59 + 32] = 10;
  v168 = v57;
  *(void *)&v147[0] = 0;
  *((void *)&v147[0] + 1) = 0xE000000000000000;
  uint64_t v60 = v2 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
  uint64_t v61 = type metadata accessor for BlackPearlLevels();
  long long v62 = (long long *)(v60 + *(int *)(v61 + 28));
  long long v63 = v62[9];
  long long v165 = v62[8];
  long long v166 = v63;
  v167[0] = v62[10];
  *(_OWORD *)((char *)v167 + 9) = *(long long *)((char *)v62 + 169);
  long long v64 = v62[5];
  long long v161 = v62[4];
  long long v162 = v64;
  long long v65 = v62[7];
  long long v163 = v62[6];
  long long v164 = v65;
  long long v66 = v62[1];
  long long v157 = *v62;
  long long v158 = v66;
  long long v67 = v62[3];
  long long v159 = v62[2];
  long long v160 = v67;
  sub_2550D9FB0();
  sub_2550CCD60(v5, v6, v10, v9, (uint64_t)&v157);
  char v68 = v157;
  uint64_t v69 = *((void *)&v157 + 1);
  uint64_t v70 = v158;
  if (v145 == 3) {
    int v71 = 0;
  }
  else {
    int v71 = BYTE8(v158);
  }
  char v143 = v71;
  if (v71 == 1)
  {
    unint64_t v73 = *((void *)v57 + 2);
    unint64_t v72 = *((void *)v57 + 3);
    if (v73 >= v72 >> 1) {
      long long v57 = sub_2550B5134((char *)(v72 > 1), v73 + 1, 1, v57);
    }
    *((void *)v57 + 2) = v73 + 1;
    v57[v73 + 32] = 19;
    v168 = v57;
  }
  v120 = (_OWORD *)(v60 + *(int *)(v61 + 28));
  long long v121 = v120[8];
  long long v122 = v120[10];
  long long v155 = v120[9];
  v156[0] = v122;
  *(_OWORD *)((char *)v156 + 9) = *(_OWORD *)((char *)v120 + 169);
  long long v123 = v120[5];
  long long v124 = v120[3];
  long long v150 = v120[4];
  long long v151 = v123;
  long long v125 = v120[5];
  long long v152 = v120[6];
  long long v126 = v120[6];
  long long v127 = v120[8];
  long long v153 = v120[7];
  long long v154 = v127;
  long long v128 = v120[1];
  v147[0] = *v120;
  v147[1] = v128;
  long long v129 = v120[3];
  long long v131 = *v120;
  long long v130 = v120[1];
  long long v148 = v120[2];
  long long v149 = v129;
  long long v165 = v121;
  long long v166 = v155;
  v167[0] = v120[10];
  *(_OWORD *)((char *)v167 + 9) = *(_OWORD *)((char *)v120 + 169);
  long long v161 = v150;
  long long v162 = v125;
  long long v163 = v126;
  long long v164 = v153;
  long long v157 = v131;
  long long v158 = v130;
  long long v159 = v148;
  long long v160 = v124;
  v146[0] = 0;
  v146[1] = 0xE000000000000000;
  sub_25509F83C((uint64_t)v147);
  sub_2550D9F60();
  sub_2550D9BA0();
  sub_2550DA130();
  sub_2550D9BA0();
  swift_bridgeObjectRelease();
  sub_2550D9BA0();
  sub_2550D9BA0();
  swift_bridgeObjectRelease();
  sub_2550D9BA0();
  sub_2550DA130();
  sub_2550D9BA0();
  swift_bridgeObjectRelease();
  sub_2550D9BA0();
  sub_2550D9D30();
  sub_2550D9BA0();
  sub_2550D9D30();
  sub_2550D9BA0();
  sub_2550D9D30();
  sub_2550D9BA0();
  sub_2550D9D30();
  sub_2550D9BA0();
  sub_2550D9BA0();
  sub_2550D9BA0();
  uint64_t v132 = swift_bridgeObjectRetain();
  MEMORY[0x25A2876D0](v132, &type metadata for ReasonCode);
  sub_2550D9BA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2550D9BA0();
  sub_2550D9BA0();
  swift_bridgeObjectRelease();
  sub_2550D9BA0();
  sub_2550D9BA0();
  swift_bridgeObjectRelease();
  if (qword_26B278B80 != -1) {
    swift_once();
  }
  uint64_t v133 = sub_2550D9A00();
  __swift_project_value_buffer(v133, (uint64_t)qword_26B279BA0);
  swift_bridgeObjectRetain();
  v134 = sub_2550D99E0();
  os_log_type_t v135 = sub_2550D9DC0();
  if (os_log_type_enabled(v134, v135))
  {
    v136 = (uint8_t *)swift_slowAlloc();
    uint64_t v137 = swift_slowAlloc();
    v146[0] = v137;
    *(_DWORD *)v136 = 136315138;
    swift_bridgeObjectRetain();
    sub_2550A7884(0, 0xE000000000000000, v146);
    sub_2550D9E90();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25509D000, v134, v135, "%s", v136, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2881E0](v137, -1, -1);
    MEMORY[0x25A2881E0](v136, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(unsigned char *)a2 = 1;
  *(unsigned char *)(a2 + 1) = v143;
  *(unsigned char *)(a2 + 2) = v145;
  *(unsigned char *)(a2 + 3) = v68;
  *(void *)(a2 + 8) = v56;
  *(double *)(a2 + 16) = v12;
  *(void *)(a2 + 24) = v69;
  *(void *)(a2 + 32) = v70;
  *(void *)(a2 + 40) = v57;
  long long v138 = v166;
  *(_OWORD *)(a2 + 176) = v165;
  *(_OWORD *)(a2 + 192) = v138;
  *(_OWORD *)(a2 + 208) = v167[0];
  *(_OWORD *)(a2 + 217) = *(_OWORD *)((char *)v167 + 9);
  long long v139 = v162;
  *(_OWORD *)(a2 + 112) = v161;
  *(_OWORD *)(a2 + 128) = v139;
  long long v140 = v164;
  *(_OWORD *)(a2 + 144) = v163;
  *(_OWORD *)(a2 + 160) = v140;
  long long v141 = v158;
  *(_OWORD *)(a2 + 48) = v157;
  *(_OWORD *)(a2 + 64) = v141;
  long long v142 = v160;
  *(_OWORD *)(a2 + 80) = v159;
  *(_OWORD *)(a2 + 96) = v142;
}

uint64_t sub_2550C7F08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v4 = *(void *)(a1 + 16);
  unint64_t v5 = *(void *)(a1 + 24);
  uint64_t v118 = *(void *)(a1 + 40);
  uint64_t v119 = *(void *)(a1 + 32);
  double v6 = *(double *)(a1 + 56);
  char v116 = *(unsigned char *)(a1 + 64);
  char v117 = *(unsigned char *)(a1 + 48);
  char v115 = *(unsigned char *)(a1 + 65);
  unint64_t v122 = *(void *)(a1 + 8);
  sub_2550D0DBC(*(void *)a1, v122);
  uint64_t v7 = sub_2550D9B10();
  unint64_t v9 = v8;
  swift_bridgeObjectRelease();
  unint64_t v120 = v5;
  uint64_t v121 = v4;
  sub_2550D0DBC(v4, v5);
  uint64_t v10 = sub_2550D9B10();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  char v13 = sub_2550B5134(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v15 = *((void *)v13 + 2);
  unint64_t v14 = *((void *)v13 + 3);
  if (v15 >= v14 >> 1) {
    char v13 = sub_2550B5134((char *)(v14 > 1), v15 + 1, 1, v13);
  }
  *((void *)v13 + 2) = v15 + 1;
  v13[v15 + 32] = 29;
  v147 = v13;
  if ((v7 != v10 || v9 != v12) && (sub_2550DA140() & 1) == 0)
  {
    sub_2550C9BE4(v7, v9);
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    sub_2550C9BE4(v10, v12);
    if (v17 == v21 && v19 == v20)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v22 = sub_2550DA140();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v22 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v69 = sub_2550D9B10();
        unint64_t v71 = v70;
        uint64_t v72 = sub_2550C88FC(v10, v12);
        uint64_t v74 = v73;
        *(void *)long long v125 = sub_2550C89FC(v69, v71);
        *(void *)&v125[8] = v75;
        *(void *)&long long v135 = v72;
        *((void *)&v135 + 1) = v74;
        strcpy(v146, "<company_name>");
        v146[15] = -18;
        sub_2550A8F9C();
        sub_2550D9EE0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v76 = sub_2550D9B10();
        uint64_t v78 = v77;
        swift_bridgeObjectRelease();
        uint64_t v79 = *(void *)(v124 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_saasSenderMap + 24);
        uint64_t v80 = *(void *)(v124 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_saasSenderMap + 32);
        __swift_project_boxed_opaque_existential_1((void *)(v124 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_saasSenderMap), v79);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v80 + 16))(v76, v78, v79, v80);
        LOBYTE(v76) = v81;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v76)
        {
          *(void *)&long long v135 = v3;
          *((void *)&v135 + 1) = v122;
          *(void *)&long long v136 = v121;
          *((void *)&v136 + 1) = v120;
          *(void *)&long long v137 = v119;
          *((void *)&v137 + 1) = v118;
          LOBYTE(v138) = v117;
          *((double *)&v138 + 1) = v6;
          LOBYTE(v139) = v116;
          BYTE1(v139) = v115;
          sub_2550C70E0((uint64_t)&v135, (uint64_t)v125);
          uint64_t v91 = swift_bridgeObjectRetain();
          sub_2550C5B78(v91, (uint64_t (*)(void))sub_2550B5134);
          sub_2550D0ECC((uint64_t)v125);
          char v92 = v125[0];
          char v93 = v125[1];
          __int16 v94 = *(_WORD *)&v125[2];
          long long v123 = *(_OWORD *)&v125[8];
          uint64_t v95 = *(void *)&v125[24];
          uint64_t v96 = v126;
          uint64_t v97 = v147;
          uint64_t v98 = v124 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
          unint64_t v99 = (long long *)(v98 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
          long long v100 = v99[9];
          long long v102 = v99[7];
          long long v143 = v99[8];
          long long v101 = v143;
          long long v144 = v100;
          long long v103 = v99[9];
          v145[0] = v99[10];
          *(_OWORD *)((char *)v145 + 9) = *(long long *)((char *)v99 + 169);
          long long v104 = v99[5];
          long long v106 = v99[3];
          long long v139 = v99[4];
          long long v105 = v139;
          long long v140 = v104;
          long long v107 = v99[5];
          long long v108 = v99[7];
          long long v141 = v99[6];
          long long v109 = v141;
          long long v142 = v108;
          long long v110 = v99[1];
          long long v111 = v99[3];
          long long v137 = v99[2];
          long long v112 = v137;
          long long v138 = v111;
          long long v113 = v99[1];
          long long v135 = *v99;
          long long v114 = v135;
          long long v136 = v113;
          *(_OWORD *)(a2 + 8) = v123;
          *(void *)(a2 + 24) = v95;
          *(void *)(a2 + 32) = v96;
          *(_OWORD *)(a2 + 176) = v101;
          *(_OWORD *)(a2 + 192) = v103;
          *(_OWORD *)(a2 + 208) = v99[10];
          *(_OWORD *)(a2 + 217) = *(long long *)((char *)v99 + 169);
          *(_OWORD *)(a2 + 112) = v105;
          *(_OWORD *)(a2 + 128) = v107;
          *(_OWORD *)(a2 + 144) = v109;
          *(_OWORD *)(a2 + 160) = v102;
          *(unsigned char *)a2 = v92;
          *(unsigned char *)(a2 + 1) = v93;
          *(_WORD *)(a2 + 2) = v94;
          *(void *)(a2 + 40) = v97;
          *(_OWORD *)(a2 + 48) = v114;
          *(_OWORD *)(a2 + 64) = v110;
          *(_OWORD *)(a2 + 80) = v112;
          *(_OWORD *)(a2 + 96) = v106;
          long long v67 = &v135;
          return sub_25509F83C((uint64_t)v67);
        }
        if (qword_26B278B80 != -1) {
          swift_once();
        }
        uint64_t v82 = sub_2550D9A00();
        __swift_project_value_buffer(v82, (uint64_t)qword_26B279BA0);
        long long v83 = sub_2550D99E0();
        os_log_type_t v84 = sub_2550D9DC0();
        if (os_log_type_enabled(v83, v84))
        {
          long long v85 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)long long v85 = 0;
          _os_log_impl(&dword_25509D000, v83, v84, "Returning NOP categorization result for Saas sender", v85, 2u);
          MEMORY[0x25A2881E0](v85, -1, -1);
        }

        char v13 = v147;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          char v13 = sub_2550B5134(0, *((void *)v147 + 2) + 1, 1, v147);
        }
        unint64_t v87 = *((void *)v13 + 2);
        unint64_t v86 = *((void *)v13 + 3);
        if (v87 >= v86 >> 1) {
          char v13 = sub_2550B5134((char *)(v86 > 1), v87 + 1, 1, v13);
        }
        *((void *)v13 + 2) = v87 + 1;
        v13[v87 + 32] = 30;
        long long v88 = sub_2550D99E0();
        os_log_type_t v89 = sub_2550D9DC0();
        if (os_log_type_enabled(v88, v89))
        {
          long long v90 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)long long v90 = 0;
          _os_log_impl(&dword_25509D000, v88, v89, "Returning NOP categorization result for SA sender", v90, 2u);
          MEMORY[0x25A2881E0](v90, -1, -1);
        }

        uint64_t v56 = v124 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
        goto LABEL_29;
      }
    }
  }
  uint64_t v23 = sub_2550C9BE4(v7, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v24 = sub_2550C9BE4(v10, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (sub_2550C3990(v125, v23, v24, v6))
  {
    char v25 = v125[0];
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_2550D9A00();
    __swift_project_value_buffer(v26, (uint64_t)qword_26B279BA0);
    unint64_t v27 = sub_2550D99E0();
    os_log_type_t v28 = sub_2550D9DC0();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_25509D000, v27, v28, "Returning NOP categorization result for person", v29, 2u);
      MEMORY[0x25A2881E0](v29, -1, -1);
    }

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      char v13 = sub_2550B5134(0, *((void *)v13 + 2) + 1, 1, v13);
    }
    unint64_t v31 = *((void *)v13 + 2);
    unint64_t v30 = *((void *)v13 + 3);
    if (v31 >= v30 >> 1) {
      char v13 = sub_2550B5134((char *)(v30 > 1), v31 + 1, 1, v13);
    }
    *((void *)v13 + 2) = v31 + 1;
    v13[v31 + 32] = v25;
    uint64_t v32 = v124 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
    uint64_t v33 = (long long *)(v32 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
    long long v35 = v33[8];
    long long v34 = v33[9];
    long long v36 = v33[7];
    long long v132 = v35;
    long long v133 = v34;
    long long v37 = v33[9];
    v134[0] = v33[10];
    *(_OWORD *)((char *)v134 + 9) = *(long long *)((char *)v33 + 169);
    long long v39 = v33[4];
    long long v38 = v33[5];
    long long v40 = v33[3];
    long long v128 = v39;
    long long v129 = v38;
    long long v41 = v33[5];
    long long v43 = v33[6];
    long long v42 = v33[7];
    long long v130 = v43;
    long long v131 = v42;
    long long v44 = v33[1];
    long long v46 = v33[2];
    long long v45 = v33[3];
    long long v126 = v46;
    long long v127 = v45;
    long long v47 = v33[1];
    long long v48 = *v33;
    *(_OWORD *)long long v125 = *v33;
    *(_OWORD *)&v125[16] = v47;
    int v49 = 100794368;
    goto LABEL_30;
  }
  if (qword_26B278B80 != -1) {
    swift_once();
  }
  uint64_t v50 = sub_2550D9A00();
  __swift_project_value_buffer(v50, (uint64_t)qword_26B279BA0);
  uint64_t v51 = sub_2550D99E0();
  os_log_type_t v52 = sub_2550D9DC0();
  if (os_log_type_enabled(v51, v52))
  {
    long long v53 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v53 = 0;
    _os_log_impl(&dword_25509D000, v51, v52, "Returning NOP categorization result for SA sender", v53, 2u);
    MEMORY[0x25A2881E0](v53, -1, -1);
  }

  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    char v13 = sub_2550B5134(0, *((void *)v13 + 2) + 1, 1, v13);
  }
  unint64_t v55 = *((void *)v13 + 2);
  unint64_t v54 = *((void *)v13 + 3);
  if (v55 >= v54 >> 1) {
    char v13 = sub_2550B5134((char *)(v54 > 1), v55 + 1, 1, v13);
  }
  *((void *)v13 + 2) = v55 + 1;
  v13[v55 + 32] = 18;
  uint64_t v56 = v124 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
LABEL_29:
  uint64_t v33 = (long long *)(v56 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
  long long v35 = v33[8];
  long long v57 = v33[9];
  long long v36 = v33[7];
  long long v132 = v35;
  long long v133 = v57;
  long long v37 = v33[9];
  v134[0] = v33[10];
  *(_OWORD *)((char *)v134 + 9) = *(long long *)((char *)v33 + 169);
  long long v39 = v33[4];
  long long v58 = v33[5];
  long long v40 = v33[3];
  long long v128 = v39;
  long long v129 = v58;
  long long v41 = v33[5];
  long long v43 = v33[6];
  long long v59 = v33[7];
  long long v130 = v43;
  long long v131 = v59;
  long long v44 = v33[1];
  long long v46 = v33[2];
  long long v60 = v33[3];
  long long v126 = v46;
  long long v127 = v60;
  long long v61 = v33[1];
  long long v48 = *v33;
  *(_OWORD *)long long v125 = *v33;
  *(_OWORD *)&v125[16] = v61;
  int v49 = 101187584;
LABEL_30:
  *(_DWORD *)a2 = v49;
  *(double *)(a2 + 16) = v6;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(a2 + 24) = _Q0;
  *(_OWORD *)(a2 + 176) = v35;
  *(_OWORD *)(a2 + 192) = v37;
  *(_OWORD *)(a2 + 208) = v33[10];
  *(_OWORD *)(a2 + 217) = *(long long *)((char *)v33 + 169);
  *(_OWORD *)(a2 + 112) = v39;
  *(_OWORD *)(a2 + 128) = v41;
  *(_OWORD *)(a2 + 144) = v43;
  *(_OWORD *)(a2 + 160) = v36;
  *(_OWORD *)(a2 + 48) = v48;
  *(_OWORD *)(a2 + 64) = v44;
  *(void *)(a2 + 8) = 0x3FF0000000000000;
  *(void *)(a2 + 40) = v13;
  *(_OWORD *)(a2 + 80) = v46;
  *(_OWORD *)(a2 + 96) = v40;
  long long v67 = (long long *)v125;
  return sub_25509F83C((uint64_t)v67);
}

uint64_t sub_2550C88FC(uint64_t a1, unint64_t a2)
{
  sub_2550C9BE4(a1, a2);
  uint64_t v3 = v2;
  unint64_t v5 = v4;
  v16[0] = 46;
  v16[1] = 0xE100000000000000;
  _OWORD v15[2] = v16;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_2550C4A34(0x7FFFFFFFFFFFFFFFLL, 1, sub_2550D2F90, (uint64_t)v15, v3, v5);
  swift_bridgeObjectRelease();
  unint64_t v7 = *(void *)(v6 + 16);
  if (v7 >= 2)
  {
    unint64_t v9 = v6 + 32 * v7;
    uint64_t v10 = *(void *)(v9 - 32);
    uint64_t v11 = *(void *)(v9 - 24);
    uint64_t v12 = *(void *)(v9 - 16);
    uint64_t v13 = *(void *)(v9 - 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v8 = MEMORY[0x25A287550](v10, v11, v12, v13);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v8;
}

uint64_t sub_2550C89FC(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E84A40);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v51 = a1;
  unint64_t v52 = a2;
  uint64_t v55 = 0x796C706572;
  unint64_t v56 = 0xE500000000000000;
  uint64_t v9 = sub_2550D9880();
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
  v10(v8, 1, 1, v9);
  sub_2550A8F9C();
  sub_2550D9EF0();
  unint64_t v12 = v11;
  char v14 = v13;
  sub_2550D3140((uint64_t)v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v14) {
    goto LABEL_9;
  }
  uint64_t v16 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v16 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v12 >> 14 > 4 * v16)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v49 = v3;
  unint64_t v50 = v12 >> 14;
  unint64_t v51 = a1;
  unint64_t v52 = a2;
  uint64_t v55 = 64;
  unint64_t v56 = 0xE100000000000000;
  v10(v8, 1, 1, v9);
  unint64_t v17 = sub_2550D9EF0();
  char v19 = v18;
  sub_2550D3140((uint64_t)v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v19)
  {
LABEL_9:
    swift_bridgeObjectRetain();
    return a1;
  }
  if (v50 <= v17 >> 14)
  {
    uint64_t v20 = sub_2550D9C70();
    MEMORY[0x25A287550](v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_2550D9C10();
    swift_bridgeObjectRelease();
    char v22 = *(void **)(v49 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_alphaNumericRegex);
    uint64_t v23 = (void *)sub_2550D9AA0();
    swift_bridgeObjectRelease();
    id v24 = objc_msgSend(v22, sel_firstMatchInString_options_range_, v23, 0, 0, v21);

    swift_bridgeObjectRetain();
    if (v24)
    {
      uint64_t v25 = sub_2550D9C70();
      uint64_t v27 = v26;
      uint64_t v29 = v28;
      uint64_t v31 = v30;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      unint64_t v32 = sub_2550C5CD0(v17, a1, a2);
      unint64_t v34 = v33;
      uint64_t v36 = v35;
      uint64_t v38 = v37;
      swift_bridgeObjectRelease();
      unint64_t v51 = v32;
      unint64_t v52 = v34;
      uint64_t v53 = v36;
      uint64_t v54 = v38;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t v39 = MEMORY[0x25A287550](v25, v27, v29, v31);
      unint64_t v41 = v40;
      swift_bridgeObjectRelease();
      uint64_t v55 = v39;
      unint64_t v56 = v41;
      sub_2550B2E38();
      sub_2550D9B90();
      uint64_t v42 = MEMORY[0x25A287890](v55, v56);
      uint64_t v44 = v43;
      uint64_t v46 = v45;
      uint64_t v48 = v47;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      a1 = MEMORY[0x25A287550](v42, v44, v46, v48);
      swift_bridgeObjectRelease();
    }
    return a1;
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_2550C8DF0@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
  unint64_t v4 = (_OWORD *)(v3 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
  long long v5 = v4[9];
  long long v6 = v4[7];
  long long v27 = v4[8];
  long long v28 = v5;
  long long v7 = v4[9];
  v29[0] = v4[10];
  *(_OWORD *)((char *)v29 + 9) = *(_OWORD *)((char *)v4 + 169);
  long long v8 = v4[5];
  long long v10 = v4[3];
  long long v23 = v4[4];
  long long v9 = v23;
  long long v24 = v8;
  long long v11 = v4[5];
  long long v12 = v4[7];
  long long v25 = v4[6];
  long long v13 = v25;
  long long v26 = v12;
  long long v14 = v4[1];
  long long v15 = v4[3];
  long long v21 = v4[2];
  long long v16 = v21;
  long long v22 = v15;
  long long v17 = v4[1];
  v20[0] = *v4;
  long long v18 = v20[0];
  v20[1] = v17;
  a1[8] = v27;
  a1[9] = v7;
  a1[10] = v4[10];
  *(_OWORD *)((char *)a1 + 169) = *(_OWORD *)((char *)v4 + 169);
  a1[4] = v9;
  a1[5] = v11;
  a1[6] = v13;
  a1[7] = v6;
  *a1 = v18;
  a1[1] = v14;
  a1[2] = v16;
  a1[3] = v10;
  return sub_25509F83C((uint64_t)v20);
}

uint64_t sub_2550C8EAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v3 = *(void *)(a1 + 24);
  uint64_t v4 = HIBYTE(v3) & 0xF;
  if ((v3 & 0x2000000000000000) == 0) {
    uint64_t v4 = *(void *)(a1 + 16) & 0xFFFFFFFFFFFFLL;
  }
  if (v4
    && (*(void *)long long v14 = *(void *)(a1 + 16),
        *(void *)&v14[8] = v3,
        uint64_t v36 = 64,
        unint64_t v37 = 0xE100000000000000,
        sub_2550A8F9C(),
        (sub_2550D9F00() & 1) != 0))
  {
    sub_2550D31F4(v14);
  }
  else
  {
    sub_2550AD440(0x312D2E312D2E312DLL, 0xE800000000000000, (uint64_t)v14);
    uint64_t v5 = *(void *)&v14[16];
    char v6 = v15;
    long long v7 = *(_OWORD *)v14;
    LOBYTE(v36) = v15;
    *(_DWORD *)long long v14 = 16842752;
    __asm { FMOV            V1.2D, #-1.0 }
    *(_OWORD *)&v14[8] = _Q1;
    long long v15 = _Q1;
    long long v16 = &unk_270441FD0;
    uint64_t v17 = 16718;
    unint64_t v18 = 0xE200000000000000;
    uint64_t v19 = 16718;
    unint64_t v20 = 0xE200000000000000;
    uint64_t v21 = 16718;
    unint64_t v22 = 0xE200000000000000;
    uint64_t v23 = 16718;
    unint64_t v24 = 0xE200000000000000;
    uint64_t v25 = 16718;
    unint64_t v26 = 0xE200000000000000;
    long long v27 = xmmword_2550DBD90;
    long long v28 = xmmword_2550DBD90;
    uint64_t v29 = -1;
    uint64_t v30 = -1;
    long long v31 = xmmword_2550DBD90;
    long long v32 = xmmword_2550DBD90;
    long long v33 = v7;
    uint64_t v34 = v5;
    char v35 = v6;
    nullsub_1(v14);
  }
  return sub_2550D2ED0((uint64_t)v14, a2, &qword_26B278B60);
}

void sub_2550C8FE4(unsigned char *a1, uint64_t a2, unint64_t a3, void *a4, void (*a5)(char *, uint64_t))
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  uint64_t v11 = v5 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
  long long v12 = *(void **)(v11 + *(int *)(type metadata accessor for BlackPearlModel(0) + 32));
  if (!v12)
  {
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v62 = sub_2550D9A00();
    __swift_project_value_buffer(v62, (uint64_t)qword_26B279BA0);
    long long v63 = sub_2550D99E0();
    os_log_type_t v64 = sub_2550D9DE0();
    if (os_log_type_enabled(v63, v64))
    {
      long long v65 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v65 = 0;
      _os_log_impl(&dword_25509D000, v63, v64, "Model creation failed", v65, 2u);
      MEMORY[0x25A2881E0](v65, -1, -1);
    }

    goto LABEL_34;
  }
  id v13 = v12;
  long long v14 = (void *)sub_2550D1928(a4, a5, a2, a3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C18);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2550DAB00;
  *(void *)(inited + 32) = 120;
  *(void *)(inited + 40) = 0xE100000000000000;
  *(void *)(inited + 72) = sub_2550D305C(0, &qword_26B278BB8);
  *(void *)(inited + 48) = v14;
  id v16 = v14;
  sub_2550C5560(inited);
  id v17 = objc_allocWithZone(MEMORY[0x263F00D38]);
  unint64_t v18 = 0;
  id v19 = sub_2550CCF84();
  *(void *)&v84[0] = 0;
  id v20 = objc_msgSend(v13, sel_predictionFromFeatures_error_, v19, v84);
  if (!v20)
  {
    id v66 = *(id *)&v84[0];
    long long v67 = (void *)sub_2550D96B0();

    swift_willThrow();
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v68 = sub_2550D9A00();
    __swift_project_value_buffer(v68, (uint64_t)qword_26B279BA0);
    id v69 = v67;
    unint64_t v70 = sub_2550D99E0();
    os_log_type_t v71 = sub_2550D9DE0();
    if (os_log_type_enabled(v70, v71))
    {
      uint64_t v72 = (uint8_t *)swift_slowAlloc();
      uint64_t v73 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v72 = 138412290;
      id v74 = v67;
      uint64_t v75 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)&v84[0] = v75;
      sub_2550D9E90();
      void *v73 = v75;

      _os_log_impl(&dword_25509D000, v70, v71, "Model execution failed %@", v72, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E847D8);
      swift_arrayDestroy();
      MEMORY[0x25A2881E0](v73, -1, -1);
      MEMORY[0x25A2881E0](v72, -1, -1);
    }
    else
    {
    }
    goto LABEL_34;
  }
  uint64_t v21 = v20;
  id v22 = *(id *)&v84[0];
  uint64_t v23 = (void *)sub_2550D9AA0();
  id v24 = objc_msgSend(v21, sel_featureValueForName_, v23);

  if (!v24) {
    goto LABEL_34;
  }
  uint64_t v25 = (_OWORD *)(v11 + *(int *)(type metadata accessor for BlackPearlLevels() + 28));
  long long v26 = v25[8];
  long long v27 = v25[10];
  v84[9] = v25[9];
  v85[0] = v27;
  *(_OWORD *)((char *)v85 + 9) = *(_OWORD *)((char *)v25 + 169);
  long long v28 = v25[5];
  v84[4] = v25[4];
  v84[5] = v28;
  long long v29 = v25[7];
  v84[6] = v25[6];
  v84[7] = v29;
  v84[8] = v26;
  long long v30 = v25[3];
  v84[2] = v25[2];
  v84[3] = v30;
  long long v31 = v25[1];
  v84[0] = *v25;
  v84[1] = v31;
  sub_25509F83C((uint64_t)v84);
  char v32 = sub_2550D9C40();
  sub_2550AE9F8((uint64_t)v84);
  char v81 = v24;
  if (v32)
  {
    id v33 = objc_msgSend(v24, sel_dictionaryValue);
    sub_2550D305C(0, &qword_26B278BC8);
    uint64_t v34 = sub_2550D9A70();

    uint64_t v35 = sub_2550D2A84(v34);
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  id v36 = objc_msgSend(v24, sel_multiArrayValue);
  if (!v36)
  {
LABEL_34:
    sub_2550D9FD0();
    __break(1u);
    return;
  }
  unint64_t v37 = v36;
  uint64_t v35 = sub_2550D21A4(v36);

LABEL_8:
  swift_bridgeObjectRetain_n();
  uint64_t v38 = sub_2550CE1E8(v35);
  swift_bridgeObjectRelease();
  long long v83 = v38;
  sub_2550CDDCC(&v83);
  swift_bridgeObjectRelease();
  uint64_t v39 = v83;
  if (!v83[2])
  {
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v77 = v19;
  unint64_t v18 = v83[5];
  uint64_t v82 = v83[4];
  uint64_t v40 = qword_26B278B80;
  swift_bridgeObjectRetain();
  if (v40 != -1) {
LABEL_21:
  }
    swift_once();
  uint64_t v41 = sub_2550D9A00();
  __swift_project_value_buffer(v41, (uint64_t)qword_26B279BA0);
  swift_retain();
  uint64_t v42 = sub_2550D99E0();
  os_log_type_t v43 = sub_2550D9DD0();
  uint64_t v79 = v13;
  uint64_t v80 = a1;
  uint64_t v78 = v16;
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    unint64_t v76 = v18;
    uint64_t v45 = (void *)swift_slowAlloc();
    long long v83 = v45;
    *(_DWORD *)uint64_t v44 = 136315138;
    swift_retain();
    uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E84A28);
    uint64_t v47 = MEMORY[0x25A2876D0](v39, v46);
    unint64_t v49 = v48;
    swift_release();
    sub_2550A7884(v47, v49, (uint64_t *)&v83);
    sub_2550D9E90();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25509D000, v42, v43, "Sorted Category: %s", v44, 0xCu);
    swift_arrayDestroy();
    unint64_t v50 = v45;
    unint64_t v18 = v76;
    MEMORY[0x25A2881E0](v50, -1, -1);
    MEMORY[0x25A2881E0](v44, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  swift_bridgeObjectRetain_n();
  unint64_t v51 = sub_2550D99E0();
  os_log_type_t v52 = sub_2550D9DD0();
  if (os_log_type_enabled(v51, v52))
  {
    uint64_t v53 = swift_slowAlloc();
    uint64_t v54 = (void *)swift_slowAlloc();
    long long v83 = v54;
    *(_DWORD *)uint64_t v53 = 136315394;
    swift_bridgeObjectRetain();
    sub_2550A7884(v82, v18, (uint64_t *)&v83);
    sub_2550D9E90();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v53 + 12) = 2048;
    sub_2550D9E90();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25509D000, v51, v52, "Top Category: %s Value %f ", (uint8_t *)v53, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2881E0](v54, -1, -1);
    MEMORY[0x25A2881E0](v53, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  uint64_t v55 = sub_2550D99E0();
  os_log_type_t v56 = sub_2550D9DC0();
  if (os_log_type_enabled(v55, v56))
  {
    long long v57 = (uint8_t *)swift_slowAlloc();
    long long v58 = (void *)swift_slowAlloc();
    long long v83 = v58;
    *(_DWORD *)long long v57 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v59 = sub_2550D9A80();
    unint64_t v61 = v60;
    swift_bridgeObjectRelease();
    sub_2550A7884(v59, v61, (uint64_t *)&v83);
    sub_2550D9E90();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25509D000, v55, v56, "Category Scores: %s ", v57, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2881E0](v58, -1, -1);
    MEMORY[0x25A2881E0](v57, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  static Category.getCategory(for:)((char *)&v83);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  unsigned char *v80 = (_BYTE)v83;
}

unint64_t sub_2550C9AF4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v4 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return 0;
  }
  uint64_t v7 = 4 * v4;
  unint64_t v8 = 15;
  while (sub_2550D9C50() != a1 || v9 != a2)
  {
    char v10 = sub_2550DA140();
    swift_bridgeObjectRelease();
    if (v10) {
      return v8;
    }
    unint64_t v8 = sub_2550D9B70();
    if (v7 == v8 >> 14) {
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_2550C9BE4(uint64_t a1, unint64_t a2)
{
  uint64_t v21 = 46;
  unint64_t v22 = 0xE100000000000000;
  id v20 = &v21;
  swift_bridgeObjectRetain();
  uint64_t result = sub_2550C4A34(0x7FFFFFFFFFFFFFFFLL, 1, sub_2550D2F90, (uint64_t)v19, a1, a2);
  uint64_t v6 = result;
  unint64_t v7 = *(void *)(result + 16);
  if (v7)
  {
    uint64_t v8 = 0;
    unint64_t v18 = result + 32;
    uint64_t v9 = (void *)(v2 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_domainMap);
    while (*(void *)(v6 + 16) >= v7)
    {
      uint64_t v21 = v6;
      unint64_t v22 = v18;
      uint64_t v23 = v8;
      uint64_t v24 = (2 * v7) | 1;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B278BD8);
      sub_2550BF190(&qword_26B278BD0, &qword_26B278BD8);
      sub_2550D30EC();
      uint64_t v10 = sub_2550D9C80();
      uint64_t v12 = v11;
      swift_bridgeObjectRelease();
      uint64_t v14 = v9[3];
      uint64_t v13 = v9[4];
      __swift_project_boxed_opaque_existential_1(v9, v14);
      uint64_t v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 16))(v10, v12, v14, v13);
      if ((v16 & 1) == 0)
      {
        uint64_t v17 = v15;
        swift_bridgeObjectRelease();
        return v17;
      }
      ++v8;
      uint64_t result = swift_bridgeObjectRelease();
      if (v7 == v8) {
        goto LABEL_6;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_6:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    return 0;
  }
  return result;
}

void *sub_2550C9DD0(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = sub_2550D9620();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v9 = sub_2550D0DBC(a1, a2);
  unint64_t v11 = v10;
  uint64_t v60 = 64;
  unint64_t v61 = 0xE100000000000000;
  uint64_t v55 = &v60;
  swift_bridgeObjectRetain();
  uint64_t result = (void *)sub_2550C4A34(0x7FFFFFFFFFFFFFFFLL, 1, sub_2550D2F90, (uint64_t)v54, a1, a2);
  if (!result[2])
  {
LABEL_18:
    __break(1u);
    return result;
  }
  uint64_t v48 = v5;
  uint64_t v49 = v2;
  uint64_t v46 = v8;
  uint64_t v47 = v6;
  uint64_t v13 = result[4];
  uint64_t v14 = result[5];
  uint64_t v15 = result[6];
  uint64_t v16 = result[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v50 = MEMORY[0x25A287550](v13, v14, v15, v16);
  unint64_t v51 = v17;
  uint64_t v18 = swift_bridgeObjectRelease();
  uint64_t v60 = 46;
  unint64_t v61 = 0xE100000000000000;
  MEMORY[0x270FA5388](v18);
  uint64_t v42 = &v60;
  swift_bridgeObjectRetain();
  uint64_t result = (void *)sub_2550C4A34(0x7FFFFFFFFFFFFFFFLL, 1, sub_2550D2F90, (uint64_t)&v40, v9, v11);
  id v19 = result;
  unint64_t v20 = result[2];
  unint64_t v21 = v9;
  if (v20)
  {
    unint64_t v44 = v9;
    unint64_t v45 = v11;
    uint64_t v22 = 0;
    uint64_t v52 = (2 * v20) | 1;
    uint64_t v53 = result + 4;
    uint64_t v23 = (void *)(v49 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_domainMap);
    while (v19[2] >= v20)
    {
      uint64_t v60 = (uint64_t)v19;
      unint64_t v61 = (unint64_t)v53;
      uint64_t v62 = v22;
      uint64_t v63 = v52;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B278BD8);
      sub_2550BF190(&qword_26B278BD0, &qword_26B278BD8);
      sub_2550D30EC();
      uint64_t v24 = sub_2550D9C80();
      unint64_t v26 = v25;
      swift_bridgeObjectRelease();
      uint64_t v28 = v23[3];
      uint64_t v27 = v23[4];
      __swift_project_boxed_opaque_existential_1(v23, v28);
      (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v27 + 16))(v24, v26, v28, v27);
      if ((v29 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        goto LABEL_10;
      }
      ++v22;
      uint64_t result = (void *)swift_bridgeObjectRelease();
      if (v20 == v22)
      {
        swift_bridgeObjectRelease();
        uint64_t v24 = 0;
        unint64_t v26 = 0xE000000000000000;
LABEL_10:
        unint64_t v11 = v45;
        unint64_t v21 = v44;
        goto LABEL_11;
      }
    }
    __break(1u);
    goto LABEL_18;
  }
  swift_bridgeObjectRelease();
  uint64_t v24 = 0;
  unint64_t v26 = 0xE000000000000000;
LABEL_11:
  uint64_t v30 = HIBYTE(v26) & 0xF;
  if ((v26 & 0x2000000000000000) == 0) {
    uint64_t v30 = v24 & 0xFFFFFFFFFFFFLL;
  }
  if (v30)
  {
    uint64_t v60 = v50;
    unint64_t v61 = v51;
    swift_bridgeObjectRetain();
    sub_2550D9BA0();
    swift_bridgeObjectRelease();
    uint64_t v31 = v60;
    unint64_t v32 = v61;
    uint64_t v60 = v21;
    unint64_t v61 = v11;
    uint64_t v58 = v24;
    unint64_t v59 = v26;
    uint64_t v56 = 0;
    unint64_t v57 = 0xE000000000000000;
    unint64_t v33 = sub_2550A8F9C();
    uint64_t v34 = MEMORY[0x263F8D310];
    uint64_t v42 = (uint64_t *)v33;
    unint64_t v43 = v33;
    uint64_t v40 = MEMORY[0x263F8D310];
    unint64_t v41 = v33;
    uint64_t v35 = sub_2550D9EE0();
    unint64_t v37 = v36;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v60 = v35;
    unint64_t v61 = v37;
    uint64_t v58 = 46;
    unint64_t v59 = 0xE100000000000000;
    uint64_t v56 = 32;
    unint64_t v57 = 0xE100000000000000;
    uint64_t v42 = (uint64_t *)v33;
    unint64_t v43 = v33;
    uint64_t v40 = v34;
    unint64_t v41 = v33;
    sub_2550D9EE0();
    swift_bridgeObjectRelease();
    uint64_t v60 = v31;
    unint64_t v61 = v32;
    swift_bridgeObjectRetain();
    sub_2550D9BA0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v38 = v46;
    sub_2550D95F0();
    uint64_t v39 = sub_2550D9EC0();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v38, v48);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (void *)v50;
  }
  return (void *)v39;
}

uint64_t sub_2550CA2B4(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = v3;
  sub_2550C9DD0(a1, a2);
  unint64_t v9 = v8;
  unint64_t v11 = *(void *)(v2 + 64);
  unint64_t v10 = *(void **)(v2 + 72);
  long long v12 = *(_OWORD *)(v2 + 32);
  v96[0] = *(_OWORD *)(v2 + 16);
  v96[1] = v12;
  v96[2] = *(_OWORD *)(v2 + 48);
  unint64_t v97 = v11;
  uint64_t v98 = v10;
  swift_bridgeObjectRetain();
  id v13 = v10;
  uint64_t v14 = sub_2550C0AF8();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)&v96[0] = 64;
  *((void *)&v96[0] + 1) = 0xE100000000000000;
  char v93 = v96;
  swift_bridgeObjectRetain();
  uint64_t v87 = a1;
  unint64_t v88 = a2;
  uint64_t v15 = sub_2550C4A34(0x7FFFFFFFFFFFFFFFLL, 1, sub_2550D2F90, (uint64_t)v92, a1, a2);
  if (*(void *)(v15 + 16) < 2uLL)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2550D3098();
    swift_allocError();
    *uint64_t v16 = 0;
    swift_willThrow();
    return (uint64_t)v9;
  }
  uint64_t v17 = v5;
  swift_bridgeObjectRetain();
  uint64_t v18 = sub_2550D9E40();
  uint64_t v20 = v19;
  swift_bridgeObjectRelease();
  *(void *)&v96[0] = v18;
  *((void *)&v96[0] + 1) = v20;
  if (!*(void *)(v15 + 16))
  {
LABEL_63:
    __break(1u);
LABEL_64:
    swift_once();
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v21 = sub_2550D9E40();
  uint64_t v23 = v22;
  swift_bridgeObjectRelease();
  uint64_t v94 = v21;
  uint64_t v95 = v23;
  sub_2550A8F9C();
  LOBYTE(v21) = sub_2550D9F00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v21) {
    float v4 = 1.0;
  }
  else {
    float v4 = 0.0;
  }
  unint64_t v11 = MEMORY[0x263F8EE78];
  unint64_t v90 = sub_2550D1534(MEMORY[0x263F8EE78]);
  if (qword_26B278B80 != -1) {
    goto LABEL_64;
  }
LABEL_8:
  uint64_t v24 = sub_2550D9A00();
  __swift_project_value_buffer(v24, (uint64_t)qword_26B279BA0);
  swift_bridgeObjectRetain();
  unint64_t v25 = sub_2550D99E0();
  os_log_type_t v26 = sub_2550D9DD0();
  uint64_t v86 = (void *)v17;
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 134217984;
    *(void *)&v96[0] = *(void *)(v14 + 16);
    sub_2550D9E90();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25509D000, v25, v26, "SenderHashingSize: %ld", v27, 0xCu);
    MEMORY[0x25A2881E0](v27, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  int64_t v28 = *(void *)(v14 + 16);
  if (v28)
  {
    *(void *)&v96[0] = v11;
    sub_2550C4A14(0, v28, 0);
    uint64_t v29 = 0;
    unint64_t v11 = *(void *)&v96[0];
    unint64_t v30 = *(void *)(*(void *)&v96[0] + 16);
    do
    {
      uint64_t v31 = *(void *)(v14 + 8 * v29 + 32);
      *(void *)&v96[0] = v11;
      unint64_t v32 = *(void *)(v11 + 24);
      if (v30 >= v32 >> 1)
      {
        sub_2550C4A14(v32 > 1, v30 + 1, 1);
        unint64_t v11 = *(void *)&v96[0];
      }
      ++v29;
      *(void *)(v11 + 16) = v30 + 1;
      *(float *)(v11 + 4 * v30++ + 32) = (float)v31;
    }
    while (v28 != v29);
  }
  swift_bridgeObjectRelease();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v11 = (unint64_t)sub_2550B5348(0, *(void *)(v11 + 16) + 1, 1, (char *)v11);
  }
  unint64_t v34 = *(void *)(v11 + 16);
  unint64_t v33 = *(void *)(v11 + 24);
  if (v34 >= v33 >> 1) {
    unint64_t v11 = (unint64_t)sub_2550B5348((char *)(v33 > 1), v34 + 1, 1, (char *)v11);
  }
  *(void *)(v11 + 16) = v34 + 1;
  *(float *)(v11 + 4 * v34 + 32) = v4;
  uint64_t v35 = HIBYTE(v88) & 0xF;
  if ((v88 & 0x2000000000000000) == 0) {
    uint64_t v35 = v87 & 0xFFFFFFFFFFFFLL;
  }
  if (v35)
  {
    unint64_t v36 = sub_2550D0DBC(v87, v88);
    uint64_t v38 = sub_2550C9BE4(v36, v37);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v39 = (char *)v11;
    if (swift_isUniquelyReferenced_nonNull_native()) {
      goto LABEL_24;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v38 = -1;
    uint64_t v39 = (char *)v11;
    if (swift_isUniquelyReferenced_nonNull_native()) {
      goto LABEL_24;
    }
  }
  uint64_t v39 = sub_2550B5348(0, *(void *)(v11 + 16) + 1, 1, (char *)v11);
LABEL_24:
  unint64_t v41 = *((void *)v39 + 2);
  unint64_t v40 = *((void *)v39 + 3);
  if (v41 >= v40 >> 1) {
    uint64_t v39 = sub_2550B5348((char *)(v40 > 1), v41 + 1, 1, v39);
  }
  *((void *)v39 + 2) = v41 + 1;
  *(float *)&v39[4 * v41 + 32] = (float)v38;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C48);
  uint64_t v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_2550DC070;
  uint64_t v17 = sub_2550D305C(0, &qword_26B278BC8);
  *(void *)(v42 + 32) = sub_2550D9E10();
  *(void *)(v42 + 40) = sub_2550D9E10();
  *(void *)&v96[0] = v42;
  sub_2550D9CC0();
  uint64_t v43 = *(void *)&v96[0];
  id v44 = objc_allocWithZone(MEMORY[0x263F00DA8]);
  id v45 = sub_2550CD06C(v43, 65600);
  if (v86)
  {
LABEL_68:

    goto LABEL_69;
  }
  unint64_t v9 = v45;
  unint64_t v88 = 0;
  if (v45)
  {
    uint64_t v14 = *((void *)v39 + 2);
    if (v14)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        uint64_t v47 = (void *)sub_2550D9D40();
        objc_msgSend(v9, sel_setObject_atIndexedSubscript_, v47, i);
      }
    }
    swift_bridgeObjectRelease();
    id v48 = objc_msgSend(v9, sel_count);
    unint64_t v11 = (unint64_t)v48 - 1;
    if (__OFSUB__(v48, 1))
    {
      __break(1u);
    }
    else if ((v11 & 0x8000000000000000) == 0)
    {
      uint64_t v49 = 0;
      unint64_t v50 = 0x2653BF000uLL;
      uint64_t v89 = v17;
      while (1)
      {
        id v51 = objc_msgSend(v9, *(SEL *)(v50 + 3728), v49);
        uint64_t v52 = (void *)sub_2550D9E10();
        char v53 = sub_2550D9E20();

        if ((v53 & 1) == 0)
        {
          id v54 = objc_msgSend(v9, *(SEL *)(v50 + 3728), v49);
          if (v54)
          {
            uint64_t v14 = (uint64_t)v54;
            uint64_t v17 = v50;
            uint64_t v55 = v9;
            unint64_t v56 = v11;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            *(void *)&v96[0] = v90;
            unint64_t v11 = sub_2550AAC20(v49);
            uint64_t v59 = *(void *)(v90 + 16);
            BOOL v60 = (v58 & 1) == 0;
            uint64_t v61 = v59 + v60;
            if (__OFADD__(v59, v60)) {
              goto LABEL_61;
            }
            char v62 = v58;
            if (*(void *)(v90 + 24) >= v61)
            {
              if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                sub_2550AC20C();
              }
            }
            else
            {
              sub_2550AB528(v61, isUniquelyReferenced_nonNull_native);
              unint64_t v63 = sub_2550AAC20(v49);
              if ((v62 & 1) != (v64 & 1)) {
                goto LABEL_67;
              }
              unint64_t v11 = v63;
            }
            os_log_type_t v71 = *(void **)&v96[0];
            unint64_t v90 = *(void *)&v96[0];
            if (v62)
            {
              uint64_t v72 = *(void *)(*(void *)&v96[0] + 56);

              *(void *)(v72 + 8 * v11) = v14;
            }
            else
            {
              *(void *)(*(void *)&v96[0] + 8 * (v11 >> 6) + 64) |= 1 << v11;
              *(void *)(v71[6] + 8 * v11) = v49;
              *(void *)(v71[7] + 8 * v11) = v14;
              uint64_t v73 = v71[2];
              BOOL v74 = __OFADD__(v73, 1);
              uint64_t v75 = v73 + 1;
              if (v74) {
                goto LABEL_62;
              }
              v71[2] = v75;
            }
            swift_bridgeObjectRelease();
            unint64_t v11 = v56;
            unint64_t v9 = v55;
            unint64_t v50 = v17;
            uint64_t v17 = v89;
          }
          else
          {
            unint64_t v65 = sub_2550AAC20(v49);
            if (v66)
            {
              unint64_t v67 = v65;
              char v68 = swift_isUniquelyReferenced_nonNull_native();
              *(void *)&v96[0] = v90;
              uint64_t v69 = v90;
              if ((v68 & 1) == 0)
              {
                sub_2550AC20C();
                uint64_t v69 = *(void *)&v96[0];
              }
              unint64_t v70 = *(void **)(*(void *)(v69 + 56) + 8 * v67);
              unint64_t v90 = v69;
              sub_2550B9EE4(v67, v69);

              swift_bridgeObjectRelease();
            }
          }
        }
        if (v11 == v49) {
          break;
        }
        BOOL v74 = __OFADD__(v49++, 1);
        if (v74)
        {
          __break(1u);
LABEL_61:
          __break(1u);
LABEL_62:
          __break(1u);
          goto LABEL_63;
        }
      }
      swift_bridgeObjectRetain_n();
      unint64_t v76 = sub_2550CDF94(v90);
      swift_bridgeObjectRelease();
      *(void *)&v96[0] = v76;
      sub_2550CDD60((void **)v96);
      swift_bridgeObjectRelease();
      uint64_t v77 = *(void *)&v96[0];
      swift_bridgeObjectRelease();
      swift_retain();
      uint64_t v78 = sub_2550D99E0();
      os_log_type_t v79 = sub_2550D9DD0();
      if (os_log_type_enabled(v78, v79))
      {
        uint64_t v80 = (uint8_t *)swift_slowAlloc();
        uint64_t v91 = swift_slowAlloc();
        *(void *)&v96[0] = v91;
        *(_DWORD *)uint64_t v80 = 136315138;
        swift_retain();
        uint64_t v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B278B68);
        uint64_t v82 = MEMORY[0x25A2876D0](v77, v81);
        unint64_t v84 = v83;
        swift_release();
        uint64_t v94 = sub_2550A7884(v82, v84, (uint64_t *)v96);
        sub_2550D9E90();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_25509D000, v78, v79, "Sender input: %s", v80, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x25A2881E0](v91, -1, -1);
        MEMORY[0x25A2881E0](v80, -1, -1);
      }
      else
      {

        swift_release_n();
      }
      return (uint64_t)v9;
    }
    __break(1u);
LABEL_67:
    sub_2550DA180();
    __break(1u);
    goto LABEL_68;
  }
LABEL_69:
  sub_2550D9FD0();
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

void sub_2550CAD04(char *a1, uint64_t a2, unint64_t a3)
{
  v40[11] = *(id *)MEMORY[0x263EF8340];
  uint64_t v8 = v3 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
  uint64_t v9 = type metadata accessor for BlackPearlLevels();
  uint64_t v10 = v8 + *(int *)(v9 + 20);
  unint64_t v11 = *(void **)(v10 + *(int *)(type metadata accessor for BlackPearlModel(0) + 32));
  if (!v11)
  {
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_2550D9A00();
    __swift_project_value_buffer(v34, (uint64_t)qword_26B279BA0);
    uint64_t v35 = sub_2550D99E0();
    os_log_type_t v36 = sub_2550D9DE0();
    if (os_log_type_enabled(v35, v36))
    {
      unint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v37 = 0;
      _os_log_impl(&dword_25509D000, v35, v36, "Could not create sender model", v37, 2u);
      MEMORY[0x25A2881E0](v37, -1, -1);
    }

LABEL_23:
    sub_2550D9FD0();
    __break(1u);
    return;
  }
  id v12 = v11;
  uint64_t v13 = sub_2550CA2B4(a2, a3);
  if (v4)
  {

    return;
  }
  uint64_t v14 = (void *)v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C18);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2550DAB00;
  *(void *)(inited + 32) = 120;
  *(void *)(inited + 40) = 0xE100000000000000;
  *(void *)(inited + 72) = sub_2550D305C(0, &qword_26B278BB8);
  *(void *)(inited + 48) = v14;
  uint64_t v16 = v14;
  sub_2550C5560(inited);
  id v17 = objc_allocWithZone(MEMORY[0x263F00D38]);
  id v18 = sub_2550CCF84();
  v40[0] = 0;
  id v19 = objc_msgSend(v12, sel_predictionFromFeatures_error_, v18, v40);
  if (!v19)
  {
    id v32 = v40[0];
    sub_2550D96B0();

    swift_willThrow();
    return;
  }
  uint64_t v20 = v19;
  uint64_t v39 = v16;
  id v21 = v40[0];
  uint64_t v22 = (void *)sub_2550D9AA0();
  id v23 = objc_msgSend(v20, sel_featureValueForName_, v22);

  if (!v23) {
    goto LABEL_23;
  }
  id v24 = objc_msgSend(v23, sel_multiArrayValue);

  if (!v24) {
    goto LABEL_23;
  }
  unint64_t v25 = objc_msgSend(v24, sel_objectAtIndexedSubscript_, 0);

  if (!v25) {
    goto LABEL_23;
  }
  sub_2550D9D10();
  uint64_t v27 = v26;
  if (qword_26B278B80 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_2550D9A00();
  __swift_project_value_buffer(v28, (uint64_t)qword_26B279BA0);
  uint64_t v29 = sub_2550D99E0();
  os_log_type_t v30 = sub_2550D9DC0();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v38 = v18;
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 134217984;
    v40[0] = v27;
    sub_2550D9E90();
    _os_log_impl(&dword_25509D000, v29, v30, "Sender Scores: %f", v31, 0xCu);
    MEMORY[0x25A2881E0](v31, -1, -1);

    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
    uint64_t v29 = v25;
    id v12 = v18;
    unint64_t v25 = v39;
  }

  if (*(double *)(v8 + *(int *)(v9 + 32) + 40) >= *(double *)&v27) {
    char v33 = 17;
  }
  else {
    char v33 = 18;
  }
  *a1 = v33;
}

uint64_t sub_2550CB214(uint64_t a1, unint64_t a2)
{
  v42[0] = 64;
  v42[1] = 0xE100000000000000;
  unint64_t v41 = v42;
  swift_bridgeObjectRetain();
  uint64_t v5 = (void *)sub_2550C4A34(0x7FFFFFFFFFFFFFFFLL, 1, sub_2550D2F90, (uint64_t)v40, a1, a2);
  if (v5[2] <= 1uLL)
  {
    swift_bridgeObjectRelease();
    sub_2550D3098();
    uint64_t v6 = (void *)swift_allocError();
    *uint64_t v7 = 0;
    swift_willThrow();
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_2550D9A00();
    __swift_project_value_buffer(v26, (uint64_t)qword_26B279BA0);
    id v27 = v6;
    id v28 = v6;
    uint64_t v29 = sub_2550D99E0();
    os_log_type_t v30 = sub_2550D9DE0();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = (uint8_t *)swift_slowAlloc();
      id v32 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 138412290;
      id v33 = v6;
      uint64_t v34 = _swift_stdlib_bridgeErrorToNSError();
      v42[0] = v34;
      sub_2550D9E90();
      *id v32 = v34;

      _os_log_impl(&dword_25509D000, v29, v30, "Failed to resolve private relay email %@", v31, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E847D8);
      swift_arrayDestroy();
      MEMORY[0x25A2881E0](v32, -1, -1);
      MEMORY[0x25A2881E0](v31, -1, -1);
    }
    else
    {
    }
    goto LABEL_24;
  }
  uint64_t v39 = v2;
  uint64_t v8 = v5[4];
  uint64_t v9 = v5[5];
  uint64_t v10 = v5[6];
  uint64_t v11 = v5[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = MEMORY[0x25A287550](v8, v9, v10, v11);
  unint64_t v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_2550D9C10();
  swift_bridgeObjectRelease();
  if (sub_2550D9E40() == 0xD000000000000018 && v16 == 0x80000002550DDF80)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  char v17 = sub_2550DA140();
  swift_bridgeObjectRelease();
  if (v17) {
    goto LABEL_7;
  }
  uint64_t v38 = v15;
  if (sub_2550D9E40() == 0x632E64756F6C6369 && v18 == 0xEA00000000006D6FLL)
  {
    swift_bridgeObjectRelease();
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v15 = v38;
    goto LABEL_15;
  }
  char v19 = sub_2550DA140();
  swift_bridgeObjectRelease();
  if (v19) {
    goto LABEL_14;
  }
  uint64_t v20 = sub_2550D9E40();
  uint64_t v22 = v21;
  swift_bridgeObjectRelease();
  if (v20 == 0xD000000000000012 && v22 == 0x80000002550DDFA0) {
    goto LABEL_14;
  }
  char v36 = sub_2550DA140();
  swift_bridgeObjectRelease();
  uint64_t v15 = v38;
  if ((v36 & 1) == 0) {
    goto LABEL_23;
  }
LABEL_15:
  id v23 = *(void **)(v39 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_privateRelayRegex);
  id v24 = (void *)sub_2550D9AA0();
  id v25 = objc_msgSend(v23, sel_firstMatchInString_options_range_, v24, 0, 0, v15);

  if (!v25)
  {
LABEL_23:
    swift_bridgeObjectRelease();
LABEL_24:
    swift_bridgeObjectRetain();
    return a1;
  }
  uint64_t v35 = sub_2550D0AD8(v12, v14);
  swift_bridgeObjectRelease();
  return v35;
}

uint64_t sub_2550CB74C(uint64_t result, uint64_t a2)
{
  if (result < 0) {
    goto LABEL_30;
  }
  uint64_t v2 = a2;
  if (!result) {
    return v2;
  }
  uint64_t v3 = *(void *)(a2 + 16);
  if (!v3)
  {
    uint64_t v30 = MEMORY[0x263F8EE78];
LABEL_25:
    swift_bridgeObjectRelease();
    swift_release();
    return v30;
  }
  unint64_t v4 = 0;
  unint64_t v5 = 0;
  uint64_t v6 = (uint64_t *)(a2 + 56);
  uint64_t v28 = v3 - 1;
  uint64_t v7 = MEMORY[0x263F8EE78];
  uint64_t v30 = MEMORY[0x263F8EE78];
  uint64_t v27 = result;
  do
  {
    uint64_t v13 = *(v6 - 1);
    uint64_t v12 = *v6;
    uint64_t v14 = *(void *)(v7 + 16);
    uint64_t v31 = *(v6 - 2);
    uint64_t v32 = *(v6 - 3);
    if (v14 < result)
    {
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_2550C49F4(0, v14 + 1, 1);
      }
      unint64_t v9 = *(void *)(v7 + 16);
      unint64_t v8 = *(void *)(v7 + 24);
      if (v9 >= v8 >> 1) {
        sub_2550C49F4(v8 > 1, v9 + 1, 1);
      }
      *(void *)(v7 + 16) = v9 + 1;
      uint64_t v10 = (void *)(v7 + 32 * v9);
      v10[4] = v32;
      v10[5] = v31;
      void v10[6] = v13;
      v10[7] = v12;
      uint64_t result = v27;
      uint64_t v11 = a2;
LABEL_8:
      if (v28 == v4) {
        goto LABEL_25;
      }
      goto LABEL_9;
    }
    if (v5 >= v14) {
      goto LABEL_28;
    }
    unint64_t v26 = v5;
    uint64_t v15 = (void *)(v7 + 32 * v5);
    uint64_t v16 = v15[4];
    uint64_t v17 = v15[5];
    uint64_t v18 = v15[6];
    uint64_t v19 = v15[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v21 = v30;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_2550C49F4(0, *(void *)(v30 + 16) + 1, 1);
      uint64_t v21 = v30;
    }
    unint64_t v23 = *(void *)(v21 + 16);
    unint64_t v22 = *(void *)(v21 + 24);
    if (v23 >= v22 >> 1)
    {
      sub_2550C49F4(v22 > 1, v23 + 1, 1);
      uint64_t v21 = v30;
    }
    *(void *)(v21 + 16) = v23 + 1;
    uint64_t v30 = v21;
    id v24 = (void *)(v21 + 32 * v23);
    v24[4] = v16;
    v24[5] = v17;
    v24[6] = v18;
    v24[7] = v19;
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = sub_2550CF8A8(v7);
      uint64_t v7 = result;
    }
    uint64_t v11 = a2;
    if (v26 >= *(void *)(v7 + 16)) {
      goto LABEL_29;
    }
    id v25 = (void *)(v7 + 32 * v26);
    swift_bridgeObjectRelease();
    v25[4] = v32;
    v25[5] = v31;
    v25[6] = v13;
    v25[7] = v12;
    unint64_t v5 = v26 + 1;
    uint64_t result = v27;
    if ((uint64_t)(v26 + 1) < v27) {
      goto LABEL_8;
    }
    if (v28 == v4) {
      goto LABEL_25;
    }
    unint64_t v5 = 0;
LABEL_9:
    ++v4;
    v6 += 4;
  }
  while (v4 < *(void *)(v11 + 16));
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2550CB9E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_2550D9620();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v49 = v6;
  uint64_t v50 = v7;
  MEMORY[0x270FA5388](v6);
  unint64_t v9 = (char *)v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v55 = a1;
  uint64_t v56 = a2;
  uint64_t v53 = 2843740;
  unint64_t v54 = 0xE300000000000000;
  uint64_t v51 = 0x737469676964;
  unint64_t v52 = 0xE600000000000000;
  sub_2550A8F9C();
  uint64_t v10 = sub_2550D9EE0();
  uint64_t v12 = *(void **)(v3 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsRegex);
  uint64_t v13 = HIBYTE(v11) & 0xF;
  if ((v11 & 0x2000000000000000) == 0) {
    uint64_t v13 = v10;
  }
  uint64_t v14 = 7;
  if (((v11 >> 60) & ((v10 & 0x800000000000000) == 0)) != 0) {
    uint64_t v14 = 11;
  }
  uint64_t v55 = 15;
  uint64_t v56 = v14 | (v13 << 16);
  uint64_t v53 = v10;
  unint64_t v54 = v11;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278BA8);
  sub_2550BF190((unint64_t *)&qword_26B278BB0, &qword_26B278BA8);
  uint64_t v15 = sub_2550D9E30();
  uint64_t v17 = v16;
  uint64_t v18 = (void *)sub_2550D9AA0();
  id v19 = objc_msgSend(v12, sel_matchesInString_options_range_, v18, 0, v15, v17);

  sub_2550D305C(0, &qword_26B278BC0);
  unint64_t v20 = sub_2550D9CA0();

  swift_bridgeObjectRetain();
  uint64_t v21 = sub_2550CFD48(v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v55 = v21;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B278B98);
  v47[1] = sub_2550BF190(&qword_26B278BA0, &qword_26B278B98);
  v47[2] = v22;
  uint64_t v23 = sub_2550D9A90();
  uint64_t v25 = v24;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v55 = v23;
  uint64_t v56 = v25;
  uint64_t v53 = 95;
  unint64_t v54 = 0xE100000000000000;
  uint64_t v51 = 2121504;
  unint64_t v52 = 0xE300000000000000;
  uint64_t v26 = sub_2550D9EE0();
  uint64_t v28 = v27;
  swift_bridgeObjectRelease();
  uint64_t v55 = v26;
  uint64_t v56 = v28;
  sub_2550D95F0();
  uint64_t v29 = sub_2550D9EB0();
  uint64_t v30 = *(void (**)(char *, uint64_t))(v50 + 8);
  id v48 = v9;
  v50 += 8;
  v47[0] = v30;
  v30(v9, v49);
  swift_bridgeObjectRelease();
  uint64_t v31 = *(void *)(v29 + 16);
  if (v31)
  {
    uint64_t v32 = (uint64_t *)(v29 + 40);
    uint64_t v33 = MEMORY[0x263F8EE78];
    do
    {
      uint64_t v37 = *(v32 - 1);
      uint64_t v38 = *v32;
      uint64_t v39 = HIBYTE(*v32) & 0xF;
      if ((*v32 & 0x2000000000000000) == 0) {
        uint64_t v39 = v37 & 0xFFFFFFFFFFFFLL;
      }
      if (v39)
      {
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v55 = v33;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_2550C47AC(0, *(void *)(v33 + 16) + 1, 1);
          uint64_t v33 = v55;
        }
        unint64_t v35 = *(void *)(v33 + 16);
        unint64_t v34 = *(void *)(v33 + 24);
        if (v35 >= v34 >> 1)
        {
          sub_2550C47AC(v34 > 1, v35 + 1, 1);
          uint64_t v33 = v55;
        }
        *(void *)(v33 + 16) = v35 + 1;
        unint64_t v36 = v33 + 16 * v35;
        *(void *)(v36 + 32) = v37;
        *(void *)(v36 + 40) = v38;
      }
      v32 += 2;
      --v31;
    }
    while (v31);
  }
  else
  {
    uint64_t v33 = MEMORY[0x263F8EE78];
  }
  swift_bridgeObjectRelease();
  uint64_t v55 = v33;
  uint64_t v41 = sub_2550D9A90();
  uint64_t v43 = v42;
  swift_release();
  uint64_t v55 = v41;
  uint64_t v56 = v43;
  id v44 = v48;
  sub_2550D95F0();
  uint64_t v45 = sub_2550D9EC0();
  ((void (*)(char *, uint64_t))v47[0])(v44, v49);
  swift_bridgeObjectRelease();
  return v45;
}

int64_t sub_2550CBED0(int64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v2 = *(void *)(a2 + 16);
    if ((uint64_t)v2 >= result) {
      unint64_t v3 = result;
    }
    else {
      unint64_t v3 = *(void *)(a2 + 16);
    }
    if (!result) {
      unint64_t v3 = 0;
    }
    if (v2 >= v3) {
      return a2;
    }
  }
  __break(1u);
  return result;
}

id sub_2550CBF14(uint64_t a1, uint64_t a2, uint64_t a3, id a4)
{
  uint64_t v6 = v5;
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v11 = v4 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
  uint64_t v12 = type metadata accessor for BlackPearlLevels();
  uint64_t v13 = v11 + *(int *)(v12 + 24);
  uint64_t v14 = *(void **)(v13 + *(int *)(type metadata accessor for BlackPearlModel(0) + 32));
  if (v14)
  {
    id v56 = v14;
    uint64_t v15 = sub_2550CB9DC(a3, a4);
    unint64_t v17 = v16;
    uint64_t v57 = 32;
    unint64_t v58 = 0xE100000000000000;
    MEMORY[0x270FA5388](v15);
    uint64_t v55 = &v57;
    swift_bridgeObjectRetain();
    uint64_t v18 = v15;
    uint64_t v19 = v6;
    uint64_t v20 = sub_2550C4A34(0x7FFFFFFFFFFFFFFFLL, 1, sub_2550D2F90, (uint64_t)v54, v18, v17);
    swift_bridgeObjectRelease();
    swift_retain();
    uint64_t v21 = sub_2550D2414(v20, v4, &OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsSubjectMap);
    uint64_t v22 = v19;
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v23 = sub_2550CB9DC(a1, a2);
    unint64_t v25 = v24;
    uint64_t v57 = 32;
    unint64_t v58 = 0xE100000000000000;
    MEMORY[0x270FA5388](v23);
    uint64_t v55 = &v57;
    swift_bridgeObjectRetain();
    uint64_t v26 = v23;
    uint64_t v27 = v22;
    uint64_t v28 = sub_2550C4A34(0x7FFFFFFFFFFFFFFFLL, 1, sub_2550D2F90, (uint64_t)v54, v26, v25);
    swift_bridgeObjectRelease();
    swift_retain();
    uint64_t v29 = sub_2550D2414(v28, v4, &OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsSenderMap);
    swift_bridgeObjectRelease();
    swift_release();
    a4 = (id)sub_2550D17C4((uint64_t)v21, *(void *)(v11 + *(int *)(v12 + 32) + 80));
    swift_bridgeObjectRelease();
    uint64_t v30 = sub_2550D17C4((uint64_t)v29, *(void *)(v11 + *(int *)(v12 + 32) + 72));
    swift_bridgeObjectRelease();
    uint64_t v31 = (void *)sub_2550D25C0((uint64_t)a4, *(void *)(v11 + *(int *)(v12 + 32) + 80));
    swift_bridgeObjectRelease();
    uint64_t v32 = (void *)sub_2550D25C0(v30, *(void *)(v11 + *(int *)(v12 + 32) + 72));
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C18);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2550DC080;
    *(void *)(inited + 32) = 0x6275735F78;
    *(void *)(inited + 40) = 0xE500000000000000;
    uint64_t v34 = sub_2550D305C(0, &qword_26B278BB8);
    *(void *)(inited + 48) = v31;
    *(void *)(inited + 72) = v34;
    *(void *)(inited + 80) = 0x6E65735F78;
    *(void *)(inited + 120) = v34;
    *(void *)(inited + 88) = 0xE500000000000000;
    *(void *)(inited + 96) = v32;
    id v35 = v31;
    id v36 = v32;
    sub_2550C5560(inited);
    id v37 = objc_allocWithZone(MEMORY[0x263F00D38]);
    id v38 = sub_2550CCF84();
    if (v27)
    {
    }
    else
    {
      uint64_t v46 = v38;
      uint64_t v57 = 0;
      id v47 = v56;
      id v48 = objc_msgSend(v56, sel_predictionFromFeatures_error_, v38, &v57);
      a4 = (id)v57;
      if (v48)
      {
        uint64_t v49 = v48;
        id v50 = (id)v57;
        uint64_t v51 = (void *)sub_2550D9AA0();
        a4 = objc_msgSend(v49, sel_featureValueForName_, v51);

        if (!a4)
        {
          id v53 = objc_allocWithZone(MEMORY[0x263F087E8]);
          a4 = (id)sub_2550D9AA0();
          objc_msgSend(v53, sel_initWithDomain_code_userInfo_, a4, 1, 0);

          swift_willThrow();
        }

        swift_unknownObjectRelease();
      }
      else
      {
        id v52 = (id)v57;
        sub_2550D96B0();

        swift_willThrow();
      }
    }
  }
  else
  {
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v39 = sub_2550D9A00();
    __swift_project_value_buffer(v39, (uint64_t)qword_26B279BA0);
    unint64_t v40 = sub_2550D99E0();
    os_log_type_t v41 = sub_2550D9DE0();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v42 = 0;
      _os_log_impl(&dword_25509D000, v40, v41, "Failed to create TS model", v42, 2u);
      MEMORY[0x25A2881E0](v42, -1, -1);
    }

    id v43 = objc_allocWithZone(MEMORY[0x263F087E8]);
    id v44 = (void *)sub_2550D9AA0();
    objc_msgSend(v43, sel_initWithDomain_code_userInfo_, v44, 2, 0);

    swift_willThrow();
  }
  return a4;
}

uint64_t sub_2550CC520@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels;
  uint64_t v60 = type metadata accessor for BlackPearlLevels();
  uint64_t v61 = v5;
  uint64_t v6 = (_OWORD *)(v5 + *(int *)(v60 + 28));
  long long v7 = v6[8];
  long long v8 = v6[10];
  v65[9] = v6[9];
  v66[0] = v8;
  *(_OWORD *)((char *)v66 + 9) = *(_OWORD *)((char *)v6 + 169);
  long long v9 = v6[5];
  v65[4] = v6[4];
  v65[5] = v9;
  long long v10 = v6[7];
  v65[6] = v6[6];
  v65[7] = v10;
  v65[8] = v7;
  long long v11 = v6[3];
  v65[2] = v6[2];
  _OWORD v65[3] = v11;
  long long v12 = v6[1];
  v65[0] = *v6;
  v65[1] = v12;
  sub_25509F83C((uint64_t)v65);
  LOBYTE(v5) = sub_2550D9C40();
  sub_2550AE9F8((uint64_t)v65);
  if (v5)
  {
    id v13 = objc_msgSend(a1, sel_dictionaryValue);
    sub_2550D305C(0, &qword_26B278BC8);
    uint64_t v14 = sub_2550D9A70();

    uint64_t v15 = sub_2550D2A84(v14);
    swift_bridgeObjectRelease();
    if (*(void *)(v15 + 16)) {
      goto LABEL_3;
    }
LABEL_13:
    double v17 = 0.0;
    double v18 = 0.0;
LABEL_14:
    double v21 = 0.0;
    goto LABEL_15;
  }
  id v25 = objc_msgSend(a1, sel_multiArrayValue);
  if (!v25)
  {
LABEL_35:
    uint64_t result = sub_2550D9FD0();
    __break(1u);
    return result;
  }
  uint64_t v26 = v25;
  uint64_t v15 = sub_2550D2814(v25);

  if (!*(void *)(v15 + 16)) {
    goto LABEL_13;
  }
LABEL_3:
  unint64_t v16 = sub_2550AAB38(0x5354544F4ELL, 0xE500000000000000);
  double v17 = 0.0;
  double v18 = 0.0;
  if (v19) {
    double v18 = *(double *)(*(void *)(v15 + 56) + 8 * v16);
  }
  if (!*(void *)(v15 + 16)) {
    goto LABEL_14;
  }
  unint64_t v20 = sub_2550AAB38(0x544341534E415254, 0xEC000000534E4F49);
  double v21 = 0.0;
  if (v22) {
    double v17 = *(double *)(*(void *)(v15 + 56) + 8 * v20);
  }
  if (*(void *)(v15 + 16))
  {
    unint64_t v23 = sub_2550AAB38(0x544F4E524548544FLL, 0xEA00000000005354);
    if (v24) {
      double v21 = *(double *)(*(void *)(v15 + 56) + 8 * v23);
    }
  }
LABEL_15:
  if (qword_26B278B80 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_2550D9A00();
  __swift_project_value_buffer(v27, (uint64_t)qword_26B279BA0);
  uint64_t v28 = sub_2550D99E0();
  os_log_type_t v29 = sub_2550D9DD0();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 134217984;
    char v64 = *(double **)&v18;
    sub_2550D9E90();
    _os_log_impl(&dword_25509D000, v28, v29, "NOTTS Score: %f", v30, 0xCu);
    MEMORY[0x25A2881E0](v30, -1, -1);
  }

  swift_bridgeObjectRetain_n();
  uint64_t v31 = (double *)sub_2550CE1E8(v15);
  swift_bridgeObjectRelease();
  char v64 = v31;
  sub_2550CDDCC((void **)&v64);
  swift_bridgeObjectRelease();
  uint64_t v32 = v64;
  if (!*((void *)v64 + 2))
  {
    __break(1u);
    swift_release();
    __break(1u);
    goto LABEL_35;
  }
  unint64_t v33 = *((void *)v64 + 5);
  uint64_t v62 = a2;
  uint64_t v63 = *((void *)v64 + 4);
  double v34 = v64[6];
  swift_bridgeObjectRetain();
  swift_retain();
  id v35 = sub_2550D99E0();
  os_log_type_t v36 = sub_2550D9DD0();
  if (os_log_type_enabled(v35, v36))
  {
    id v37 = (uint8_t *)swift_slowAlloc();
    id v38 = (double *)swift_slowAlloc();
    char v64 = v38;
    *(_DWORD *)id v37 = 136315138;
    swift_retain();
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E84A28);
    unint64_t v40 = v33;
    uint64_t v41 = MEMORY[0x25A2876D0](v32, v39);
    unint64_t v43 = v42;
    swift_release();
    uint64_t v44 = v41;
    unint64_t v33 = v40;
    sub_2550A7884(v44, v43, (uint64_t *)&v64);
    sub_2550D9E90();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25509D000, v35, v36, "Sorted TS Category: %s", v37, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2881E0](v38, -1, -1);
    MEMORY[0x25A2881E0](v37, -1, -1);
  }
  else
  {

    swift_release_n();
  }
  swift_bridgeObjectRetain_n();
  uint64_t v45 = sub_2550D99E0();
  os_log_type_t v46 = sub_2550D9DD0();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = swift_slowAlloc();
    id v48 = (double *)swift_slowAlloc();
    char v64 = v48;
    *(_DWORD *)uint64_t v47 = 136315394;
    swift_bridgeObjectRetain();
    sub_2550A7884(v63, v33, (uint64_t *)&v64);
    sub_2550D9E90();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v47 + 12) = 2048;
    sub_2550D9E90();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_25509D000, v45, v46, "Top TS Category: %s Value %f ", (uint8_t *)v47, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x25A2881E0](v48, -1, -1);
    MEMORY[0x25A2881E0](v47, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  uint64_t v49 = sub_2550D99E0();
  os_log_type_t v50 = sub_2550D9DC0();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = (uint8_t *)swift_slowAlloc();
    id v52 = (double *)swift_slowAlloc();
    char v64 = v52;
    *(_DWORD *)uint64_t v51 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v53 = sub_2550D9A80();
    unint64_t v55 = v54;
    swift_bridgeObjectRelease();
    sub_2550A7884(v53, v55, (uint64_t *)&v64);
    sub_2550D9E90();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25509D000, v49, v50, "Category TS Scores: %s ", v51, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A2881E0](v52, -1, -1);
    MEMORY[0x25A2881E0](v51, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  static CategoryTS.getCategory(for:)((char *)&v64);
  uint64_t result = swift_bridgeObjectRelease();
  double v57 = 1.0 - v18;
  BOOL v59 = v64 <= 5u
     && (uint64_t v58 = v61 + *(int *)(v60 + 32), *(double *)(v58 + 56) < v34)
     && *(double *)(v58 + 48) < v57;
  *(unsigned char *)uint64_t v62 = (_BYTE)v64;
  *(double *)(v62 + 8) = v57 - v17 - v21;
  *(double *)(v62 + 16) = v34;
  *(unsigned char *)(v62 + 24) = v59;
  return result;
}

__n128 sub_2550CCD60@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  id v6 = sub_2550CBF14(a1, a2, a3, a4);
  sub_2550CC520(v6, (uint64_t)&v9);

  char v7 = v11;
  __n128 result = v10;
  *(unsigned char *)a5 = v9;
  *(__n128 *)(a5 + 8) = result;
  *(unsigned char *)(a5 + 24) = v7;
  return result;
}

id sub_2550CCF84()
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = (void *)sub_2550D9A60();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_initWithDictionary_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_2550D96B0();

    swift_willThrow();
  }
  return v2;
}

id sub_2550CD06C(uint64_t a1, uint64_t a2)
{
  v9[1] = *(id *)MEMORY[0x263EF8340];
  sub_2550D305C(0, &qword_26B278BC8);
  id v4 = (void *)sub_2550D9C90();
  swift_bridgeObjectRelease();
  v9[0] = 0;
  id v5 = objc_msgSend(v2, sel_initWithShape_dataType_error_, v4, a2, v9);

  if (v5)
  {
    id v6 = v9[0];
  }
  else
  {
    id v7 = v9[0];
    sub_2550D96B0();

    swift_willThrow();
  }
  return v5;
}

uint64_t sub_2550CD168(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_2550D9C70();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v14 = *(void **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v14 = sub_2550B4F08(0, v14[2] + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      uint64_t v14 = sub_2550B4F08((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    void v14[2] = v17 + 1;
    double v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_2550D9FC0();
  __break(1u);
  return result;
}

uint64_t sub_2550CD2C4(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = sub_2550D9E80();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v14 = *(void **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v14 = sub_2550B4F08(0, v14[2] + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      uint64_t v14 = sub_2550B4F08((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }
    void v14[2] = v17 + 1;
    double v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  uint64_t result = sub_2550D9FC0();
  __break(1u);
  return result;
}

uint64_t sub_2550CD428(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_2550D9C20();
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
    uint64_t v5 = MEMORY[0x25A287600](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_2550CD4A4(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C40);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2550DA020();
  __break(1u);
  return result;
}

uint64_t sub_2550CD5F4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B2799D0);
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
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
  uint64_t result = sub_2550DA020();
  __break(1u);
  return result;
}

uint64_t sub_2550CD760(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B2799E0);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2550DA020();
  __break(1u);
  return result;
}

uint64_t sub_2550CD8CC(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C28);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    id v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B278B68);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2550DA020();
  __break(1u);
  return result;
}

uint64_t sub_2550CDA58(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C20);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2550DA020();
  __break(1u);
  return result;
}

uint64_t sub_2550CDBB8(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C10);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    id v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8) {
      memmove(v10 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E84A28);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2550DA020();
  __break(1u);
  return result;
}

uint64_t sub_2550CDD60(void **a1)
{
  id v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    id v2 = (void *)sub_2550CF8BC(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  uint64_t result = sub_2550CE2E0(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_2550CDDCC(void **a1)
{
  id v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    id v2 = (void *)sub_2550CF8D0(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  uint64_t result = sub_2550CE9B4(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_2550CDE38(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  int64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return MEMORY[0x263F8EE78];
    }
    if (v5 <= 0)
    {
      uint64_t v8 = (void *)MEMORY[0x263F8EE78];
      if (v4 != a3)
      {
LABEL_5:
        if (v5 < 0) {
          goto LABEL_17;
        }
        uint64_t v10 = v8 + 4;
        if (a2 + a3 < (unint64_t)v8 + v5 + 32 && (unint64_t)v10 < a2 + a3 + v5) {
          goto LABEL_17;
        }
        memcpy(v10, (const void *)(a2 + a3), v5);
        return (uint64_t)v8;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C40);
      uint64_t v8 = (void *)swift_allocObject();
      size_t v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * v9 - 64;
      if (v4 != a3) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_17:
  uint64_t result = sub_2550DA020();
  __break(1u);
  return result;
}

void *sub_2550CDF94(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C28);
  uint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  unint64_t v6 = sub_2550CF93C(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_2550D2F88();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_2550CE07C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return MEMORY[0x263F8EE78];
    }
    uint64_t v8 = 8 * v5;
    if (v5 <= 0)
    {
      size_t v9 = (char *)MEMORY[0x263F8EE78];
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0) {
          goto LABEL_19;
        }
        unint64_t v12 = v9 + 32;
        unint64_t v13 = (char *)(a2 + 8 * a3);
        if (v13 < &v9[v8 + 32] && v12 < &v13[v8]) {
          goto LABEL_19;
        }
        memcpy(v12, v13, 8 * v5);
        return (uint64_t)v9;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C30);
      size_t v9 = (char *)swift_allocObject();
      int64_t v10 = _swift_stdlib_malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 25;
      }
      *((void *)v9 + 2) = v5;
      *((void *)v9 + 3) = 2 * (v11 >> 3);
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  uint64_t result = sub_2550DA020();
  __break(1u);
  return result;
}

void *sub_2550CE1E8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C10);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 24);
  uint64_t v5 = sub_2550CFB40((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_2550D2F88();
  if (v5 != v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t sub_2550CE2E0(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_2550DA120();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_136;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v85 = 0;
      uint64_t v86 = *a1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        uint64_t v88 = *(void *)(v86 + 16 * i);
        uint64_t v89 = v85;
        do
        {
          if (v88 >= *(void *)(v86 + v89)) {
            break;
          }
          if (!v86) {
            goto LABEL_140;
          }
          unint64_t v90 = (void *)(v86 + v89);
          uint64_t v91 = *(void *)(v86 + v89 + 24);
          *(_OWORD *)(v86 + v89 + 16) = *(_OWORD *)(v86 + v89);
          void *v90 = v88;
          v90[1] = v91;
          v89 -= 16;
        }
        while (v89 != -16);
        v85 += 16;
      }
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_145;
  }
  uint64_t v6 = result;
  long long v101 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    __dst = (char *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v13 = *(void *)(MEMORY[0x263F8EE78] + 16);
      unint64_t v12 = (char *)MEMORY[0x263F8EE78];
LABEL_102:
      char v92 = v12;
      uint64_t v103 = v9;
      if (v13 >= 2)
      {
        uint64_t v93 = *v101;
        do
        {
          unint64_t v94 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_131;
          }
          if (!v93) {
            goto LABEL_144;
          }
          uint64_t v95 = v92;
          uint64_t v96 = *(void *)&v92[16 * v94 + 32];
          uint64_t v97 = *(void *)&v92[16 * v13 + 24];
          sub_2550CF0D0((char *)(v93 + 16 * v96), (char *)(v93 + 16 * *(void *)&v92[16 * v13 + 16]), v93 + 16 * v97, __dst);
          if (v1) {
            break;
          }
          if (v97 < v96) {
            goto LABEL_132;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v95 = sub_2550CF894((uint64_t)v95);
          }
          if (v94 >= *((void *)v95 + 2)) {
            goto LABEL_133;
          }
          uint64_t v98 = &v95[16 * v94 + 32];
          *(void *)uint64_t v98 = v96;
          *((void *)v98 + 1) = v97;
          unint64_t v99 = *((void *)v95 + 2);
          if (v13 > v99) {
            goto LABEL_134;
          }
          memmove(&v95[16 * v13 + 16], &v95[16 * v13 + 32], 16 * (v99 - v13));
          char v92 = v95;
          *((void *)v95 + 2) = v99 - 1;
          unint64_t v13 = v99 - 1;
        }
        while (v99 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(void *)(v103 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v103 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B278B68);
    uint64_t v8 = sub_2550D9CD0();
    *(void *)(v8 + 16) = v7;
    uint64_t v103 = v8;
    __dst = (char *)(v8 + 32);
  }
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v102 = *a1 + 32;
  uint64_t v100 = *a1 - 16;
  unint64_t v12 = (char *)MEMORY[0x263F8EE78];
  uint64_t v104 = v6;
  uint64_t v105 = v3;
  uint64_t v106 = v11;
  while (1)
  {
    uint64_t v14 = v10++;
    if (v10 < v3)
    {
      uint64_t v15 = *(void *)(v11 + 16 * v10);
      uint64_t v16 = 16 * v14;
      uint64_t v17 = *(void *)(v11 + 16 * v14);
      uint64_t v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        double v18 = (uint64_t *)(v102 + 16 * v14);
        uint64_t v19 = v15;
        while (1)
        {
          uint64_t v21 = *v18;
          v18 += 2;
          uint64_t v20 = v21;
          if (v15 < v17 == v21 >= v19) {
            break;
          }
          ++v10;
          uint64_t v19 = v20;
          if (v3 == v10)
          {
            uint64_t v10 = v3;
            break;
          }
        }
      }
      if (v15 < v17)
      {
        if (v10 < v14) {
          goto LABEL_137;
        }
        if (v14 < v10)
        {
          uint64_t v22 = 16 * v10;
          uint64_t v23 = v10;
          uint64_t v24 = v14;
          do
          {
            if (v24 != --v23)
            {
              if (!v11) {
                goto LABEL_143;
              }
              uint64_t v25 = v11 + v22;
              uint64_t v26 = *(void *)(v11 + v16);
              uint64_t v27 = *(void *)(v11 + v16 + 8);
              *(_OWORD *)(v11 + v16) = *(_OWORD *)(v11 + v22 - 16);
              *(void *)(v25 - 16) = v26;
              *(void *)(v25 - 8) = v27;
            }
            ++v24;
            v22 -= 16;
            v16 += 16;
          }
          while (v24 < v23);
        }
      }
    }
    if (v10 >= v3) {
      goto LABEL_46;
    }
    if (__OFSUB__(v10, v14)) {
      goto LABEL_135;
    }
    if (v10 - v14 >= v6) {
      goto LABEL_46;
    }
    uint64_t v28 = v14 + v6;
    if (__OFADD__(v14, v6)) {
      goto LABEL_138;
    }
    if (v28 >= v3) {
      uint64_t v28 = v3;
    }
    if (v28 < v14) {
      break;
    }
    if (v10 != v28)
    {
      uint64_t v29 = v100 + 16 * v10;
      do
      {
        uint64_t v30 = *(void *)(v11 + 16 * v10);
        uint64_t v31 = v14;
        uint64_t v32 = v29;
        do
        {
          if (v30 >= *(void *)v32) {
            break;
          }
          if (!v11) {
            goto LABEL_141;
          }
          uint64_t v33 = *(void *)(v32 + 24);
          *(_OWORD *)(v32 + 16) = *(_OWORD *)v32;
          *(void *)uint64_t v32 = v30;
          *(void *)(v32 + 8) = v33;
          v32 -= 16;
          ++v31;
        }
        while (v10 != v31);
        ++v10;
        v29 += 16;
      }
      while (v10 != v28);
      uint64_t v10 = v28;
    }
LABEL_46:
    if (v10 < v14) {
      goto LABEL_130;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v12 = sub_2550CF60C(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v35 = *((void *)v12 + 2);
    unint64_t v34 = *((void *)v12 + 3);
    unint64_t v13 = v35 + 1;
    uint64_t v11 = v106;
    if (v35 >= v34 >> 1)
    {
      unint64_t v84 = sub_2550CF60C((char *)(v34 > 1), v35 + 1, 1, v12);
      uint64_t v11 = v106;
      unint64_t v12 = v84;
    }
    *((void *)v12 + 2) = v13;
    os_log_type_t v36 = v12 + 32;
    id v37 = &v12[16 * v35 + 32];
    *(void *)id v37 = v14;
    *((void *)v37 + 1) = v10;
    if (v35)
    {
      while (1)
      {
        unint64_t v38 = v13 - 1;
        if (v13 >= 4)
        {
          unint64_t v43 = &v36[16 * v13];
          uint64_t v44 = *((void *)v43 - 8);
          uint64_t v45 = *((void *)v43 - 7);
          BOOL v49 = __OFSUB__(v45, v44);
          uint64_t v46 = v45 - v44;
          if (v49) {
            goto LABEL_119;
          }
          uint64_t v48 = *((void *)v43 - 6);
          uint64_t v47 = *((void *)v43 - 5);
          BOOL v49 = __OFSUB__(v47, v48);
          uint64_t v41 = v47 - v48;
          char v42 = v49;
          if (v49) {
            goto LABEL_120;
          }
          unint64_t v50 = v13 - 2;
          uint64_t v51 = &v36[16 * v13 - 32];
          uint64_t v53 = *(void *)v51;
          uint64_t v52 = *((void *)v51 + 1);
          BOOL v49 = __OFSUB__(v52, v53);
          uint64_t v54 = v52 - v53;
          if (v49) {
            goto LABEL_122;
          }
          BOOL v49 = __OFADD__(v41, v54);
          uint64_t v55 = v41 + v54;
          if (v49) {
            goto LABEL_125;
          }
          if (v55 >= v46)
          {
            uint64_t v73 = &v36[16 * v38];
            uint64_t v75 = *(void *)v73;
            uint64_t v74 = *((void *)v73 + 1);
            BOOL v49 = __OFSUB__(v74, v75);
            uint64_t v76 = v74 - v75;
            if (v49) {
              goto LABEL_129;
            }
            BOOL v66 = v41 < v76;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v67 = *((void *)v12 + 4);
            uint64_t v68 = *((void *)v12 + 5);
            BOOL v49 = __OFSUB__(v68, v67);
            uint64_t v60 = v68 - v67;
            char v61 = v49;
            goto LABEL_77;
          }
          uint64_t v40 = *((void *)v12 + 4);
          uint64_t v39 = *((void *)v12 + 5);
          BOOL v49 = __OFSUB__(v39, v40);
          uint64_t v41 = v39 - v40;
          char v42 = v49;
        }
        if (v42) {
          goto LABEL_121;
        }
        unint64_t v50 = v13 - 2;
        id v56 = &v36[16 * v13 - 32];
        uint64_t v58 = *(void *)v56;
        uint64_t v57 = *((void *)v56 + 1);
        BOOL v59 = __OFSUB__(v57, v58);
        uint64_t v60 = v57 - v58;
        char v61 = v59;
        if (v59) {
          goto LABEL_124;
        }
        uint64_t v62 = &v36[16 * v38];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v49 = __OFSUB__(v63, v64);
        uint64_t v65 = v63 - v64;
        if (v49) {
          goto LABEL_127;
        }
        if (__OFADD__(v60, v65)) {
          goto LABEL_128;
        }
        if (v60 + v65 >= v41)
        {
          BOOL v66 = v41 < v65;
LABEL_83:
          if (v66) {
            unint64_t v38 = v50;
          }
          goto LABEL_85;
        }
LABEL_77:
        if (v61) {
          goto LABEL_123;
        }
        uint64_t v69 = &v36[16 * v38];
        uint64_t v71 = *(void *)v69;
        uint64_t v70 = *((void *)v69 + 1);
        BOOL v49 = __OFSUB__(v70, v71);
        uint64_t v72 = v70 - v71;
        if (v49) {
          goto LABEL_126;
        }
        if (v72 < v60) {
          goto LABEL_15;
        }
LABEL_85:
        unint64_t v77 = v38 - 1;
        if (v38 - 1 >= v13)
        {
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
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v11) {
          goto LABEL_142;
        }
        uint64_t v78 = v12;
        os_log_type_t v79 = &v36[16 * v77];
        uint64_t v80 = *(void *)v79;
        uint64_t v81 = &v36[16 * v38];
        uint64_t v82 = *((void *)v81 + 1);
        sub_2550CF0D0((char *)(v11 + 16 * *(void *)v79), (char *)(v11 + 16 * *(void *)v81), v11 + 16 * v82, __dst);
        if (v1) {
          goto LABEL_93;
        }
        if (v82 < v80) {
          goto LABEL_116;
        }
        if (v38 > *((void *)v78 + 2)) {
          goto LABEL_117;
        }
        *(void *)os_log_type_t v79 = v80;
        *(void *)&v36[16 * v77 + 8] = v82;
        unint64_t v83 = *((void *)v78 + 2);
        if (v38 >= v83) {
          goto LABEL_118;
        }
        unint64_t v12 = v78;
        unint64_t v13 = v83 - 1;
        memmove(&v36[16 * v38], v81 + 16, 16 * (v83 - 1 - v38));
        *((void *)v78 + 2) = v83 - 1;
        uint64_t v11 = v106;
        if (v83 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_15:
    uint64_t v6 = v104;
    uint64_t v3 = v105;
    if (v10 >= v105)
    {
      uint64_t v9 = v103;
      goto LABEL_102;
    }
  }
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  uint64_t result = sub_2550D9FC0();
  __break(1u);
  return result;
}

uint64_t sub_2550CE9B4(uint64_t *a1)
{
  uint64_t v3 = a1[1];
  uint64_t result = sub_2550DA120();
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_137;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v88 = *a1;
      uint64_t v89 = *a1 + 16;
      uint64_t v90 = -1;
      for (uint64_t i = 1; i != v3; ++i)
      {
        double v92 = *(double *)(v88 + 24 * i + 16);
        uint64_t v93 = v90;
        uint64_t v94 = v89;
        do
        {
          if (*(double *)v94 >= v92) {
            break;
          }
          if (!v88) {
            goto LABEL_141;
          }
          uint64_t v95 = *(void *)(v94 + 8);
          uint64_t v96 = *(void *)(v94 + 16);
          *(_OWORD *)(v94 + 8) = *(_OWORD *)(v94 - 16);
          *(void *)(v94 + 24) = *(void *)v94;
          *(void *)(v94 - 16) = v95;
          *(void *)(v94 - 8) = v96;
          *(double *)uint64_t v94 = v92;
          v94 -= 24;
        }
        while (!__CFADD__(v93++, 1));
        v89 += 24;
        --v90;
      }
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_146;
  }
  uint64_t v6 = result;
  uint64_t v106 = a1;
  if (v3 < 2)
  {
    uint64_t v9 = MEMORY[0x263F8EE78];
    __dst = (double *)(MEMORY[0x263F8EE78] + 32);
    if (v3 != 1)
    {
      unint64_t v13 = *(void *)(MEMORY[0x263F8EE78] + 16);
      unint64_t v12 = (char *)MEMORY[0x263F8EE78];
LABEL_103:
      uint64_t v98 = v12;
      uint64_t v108 = v9;
      if (v13 >= 2)
      {
        uint64_t v99 = *v106;
        do
        {
          unint64_t v100 = v13 - 2;
          if (v13 < 2) {
            goto LABEL_132;
          }
          if (!v99) {
            goto LABEL_145;
          }
          long long v101 = v98;
          uint64_t v102 = *(void *)&v98[16 * v100 + 32];
          uint64_t v103 = *(void *)&v98[16 * v13 + 24];
          sub_2550CF34C((double *)(v99 + 24 * v102), (double *)(v99 + 24 * *(void *)&v98[16 * v13 + 16]), v99 + 24 * v103, __dst);
          if (v1) {
            break;
          }
          if (v103 < v102) {
            goto LABEL_133;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            long long v101 = sub_2550CF894((uint64_t)v101);
          }
          if (v100 >= *((void *)v101 + 2)) {
            goto LABEL_134;
          }
          uint64_t v104 = &v101[16 * v100 + 32];
          *(void *)uint64_t v104 = v102;
          *((void *)v104 + 1) = v103;
          unint64_t v105 = *((void *)v101 + 2);
          if (v13 > v105) {
            goto LABEL_135;
          }
          memmove(&v101[16 * v13 + 16], &v101[16 * v13 + 32], 16 * (v105 - v13));
          uint64_t v98 = v101;
          *((void *)v101 + 2) = v105 - 1;
          unint64_t v13 = v105 - 1;
        }
        while (v105 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(void *)(v108 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v108 = MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_269E84A28);
    uint64_t v8 = sub_2550D9CD0();
    *(void *)(v8 + 16) = v7;
    uint64_t v108 = v8;
    __dst = (double *)(v8 + 32);
  }
  uint64_t v10 = 0;
  uint64_t v11 = *a1;
  uint64_t v107 = *a1 + 64;
  unint64_t v12 = (char *)MEMORY[0x263F8EE78];
  uint64_t v109 = v6;
  uint64_t v110 = v3;
  uint64_t v111 = v11;
  while (1)
  {
    uint64_t v14 = v10++;
    if (v10 < v3)
    {
      double v15 = *(double *)(v11 + 24 * v10 + 16);
      double v16 = *(double *)(v11 + 24 * v14 + 16);
      uint64_t v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        uint64_t v17 = (double *)(v107 + 24 * v14);
        double v18 = v15;
        while (1)
        {
          double v19 = v18;
          double v18 = *v17;
          if (v16 < v15 == v19 >= *v17) {
            break;
          }
          ++v10;
          v17 += 3;
          if (v3 == v10)
          {
            uint64_t v10 = v3;
            break;
          }
        }
      }
      if (v16 < v15)
      {
        if (v10 < v14) {
          goto LABEL_138;
        }
        if (v14 < v10)
        {
          uint64_t v20 = 24 * v10;
          uint64_t v21 = 24 * v14;
          uint64_t v22 = v10;
          uint64_t v23 = v14;
          do
          {
            if (v23 != --v22)
            {
              if (!v11) {
                goto LABEL_144;
              }
              uint64_t v24 = v11 + v21;
              uint64_t v25 = v11 + v20;
              uint64_t v26 = *(void *)(v11 + v21);
              uint64_t v27 = *(void *)(v11 + v21 + 8);
              uint64_t v28 = *(void *)(v11 + v21 + 16);
              uint64_t v29 = *(void *)(v11 + v20 - 8);
              *(_OWORD *)uint64_t v24 = *(_OWORD *)(v11 + v20 - 24);
              *(void *)(v24 + 16) = v29;
              *(void *)(v25 - 24) = v26;
              *(void *)(v25 - 16) = v27;
              *(void *)(v25 - 8) = v28;
            }
            ++v23;
            v20 -= 24;
            v21 += 24;
          }
          while (v23 < v22);
        }
      }
    }
    if (v10 >= v3) {
      goto LABEL_46;
    }
    if (__OFSUB__(v10, v14)) {
      goto LABEL_136;
    }
    if (v10 - v14 >= v6) {
      goto LABEL_46;
    }
    uint64_t v30 = v14 + v6;
    if (__OFADD__(v14, v6)) {
      goto LABEL_139;
    }
    if (v30 >= v3) {
      uint64_t v30 = v3;
    }
    if (v30 < v14) {
      break;
    }
    if (v10 != v30)
    {
      uint64_t v31 = (double *)(v11 + 24 * v10);
      do
      {
        double v32 = *(double *)(v11 + 24 * v10 + 16);
        uint64_t v33 = v14;
        unint64_t v34 = v31;
        do
        {
          if (*(v34 - 1) >= v32) {
            break;
          }
          if (!v11) {
            goto LABEL_142;
          }
          double v35 = *v34;
          uint64_t v36 = *((void *)v34 + 1);
          *(_OWORD *)unint64_t v34 = *(_OWORD *)(v34 - 3);
          v34[2] = *(v34 - 1);
          *((void *)v34 - 2) = v36;
          *(v34 - 1) = v32;
          *(v34 - 3) = v35;
          v34 -= 3;
          ++v33;
        }
        while (v10 != v33);
        ++v10;
        v31 += 3;
      }
      while (v10 != v30);
      uint64_t v10 = v30;
    }
LABEL_46:
    if (v10 < v14) {
      goto LABEL_131;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v12 = sub_2550CF60C(0, *((void *)v12 + 2) + 1, 1, v12);
    }
    unint64_t v38 = *((void *)v12 + 2);
    unint64_t v37 = *((void *)v12 + 3);
    unint64_t v13 = v38 + 1;
    uint64_t v11 = v111;
    if (v38 >= v37 >> 1)
    {
      uint64_t v87 = sub_2550CF60C((char *)(v37 > 1), v38 + 1, 1, v12);
      uint64_t v11 = v111;
      unint64_t v12 = v87;
    }
    *((void *)v12 + 2) = v13;
    uint64_t v39 = v12 + 32;
    uint64_t v40 = &v12[16 * v38 + 32];
    *(void *)uint64_t v40 = v14;
    *((void *)v40 + 1) = v10;
    if (v38)
    {
      while (1)
      {
        unint64_t v41 = v13 - 1;
        if (v13 >= 4)
        {
          uint64_t v46 = &v39[16 * v13];
          uint64_t v47 = *((void *)v46 - 8);
          uint64_t v48 = *((void *)v46 - 7);
          BOOL v52 = __OFSUB__(v48, v47);
          uint64_t v49 = v48 - v47;
          if (v52) {
            goto LABEL_120;
          }
          uint64_t v51 = *((void *)v46 - 6);
          uint64_t v50 = *((void *)v46 - 5);
          BOOL v52 = __OFSUB__(v50, v51);
          uint64_t v44 = v50 - v51;
          char v45 = v52;
          if (v52) {
            goto LABEL_121;
          }
          unint64_t v53 = v13 - 2;
          uint64_t v54 = &v39[16 * v13 - 32];
          uint64_t v56 = *(void *)v54;
          uint64_t v55 = *((void *)v54 + 1);
          BOOL v52 = __OFSUB__(v55, v56);
          uint64_t v57 = v55 - v56;
          if (v52) {
            goto LABEL_123;
          }
          BOOL v52 = __OFADD__(v44, v57);
          uint64_t v58 = v44 + v57;
          if (v52) {
            goto LABEL_126;
          }
          if (v58 >= v49)
          {
            uint64_t v76 = &v39[16 * v41];
            uint64_t v78 = *(void *)v76;
            uint64_t v77 = *((void *)v76 + 1);
            BOOL v52 = __OFSUB__(v77, v78);
            uint64_t v79 = v77 - v78;
            if (v52) {
              goto LABEL_130;
            }
            BOOL v69 = v44 < v79;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            uint64_t v70 = *((void *)v12 + 4);
            uint64_t v71 = *((void *)v12 + 5);
            BOOL v52 = __OFSUB__(v71, v70);
            uint64_t v63 = v71 - v70;
            char v64 = v52;
            goto LABEL_77;
          }
          uint64_t v43 = *((void *)v12 + 4);
          uint64_t v42 = *((void *)v12 + 5);
          BOOL v52 = __OFSUB__(v42, v43);
          uint64_t v44 = v42 - v43;
          char v45 = v52;
        }
        if (v45) {
          goto LABEL_122;
        }
        unint64_t v53 = v13 - 2;
        BOOL v59 = &v39[16 * v13 - 32];
        uint64_t v61 = *(void *)v59;
        uint64_t v60 = *((void *)v59 + 1);
        BOOL v62 = __OFSUB__(v60, v61);
        uint64_t v63 = v60 - v61;
        char v64 = v62;
        if (v62) {
          goto LABEL_125;
        }
        uint64_t v65 = &v39[16 * v41];
        uint64_t v67 = *(void *)v65;
        uint64_t v66 = *((void *)v65 + 1);
        BOOL v52 = __OFSUB__(v66, v67);
        uint64_t v68 = v66 - v67;
        if (v52) {
          goto LABEL_128;
        }
        if (__OFADD__(v63, v68)) {
          goto LABEL_129;
        }
        if (v63 + v68 >= v44)
        {
          BOOL v69 = v44 < v68;
LABEL_83:
          if (v69) {
            unint64_t v41 = v53;
          }
          goto LABEL_85;
        }
LABEL_77:
        if (v64) {
          goto LABEL_124;
        }
        uint64_t v72 = &v39[16 * v41];
        uint64_t v74 = *(void *)v72;
        uint64_t v73 = *((void *)v72 + 1);
        BOOL v52 = __OFSUB__(v73, v74);
        uint64_t v75 = v73 - v74;
        if (v52) {
          goto LABEL_127;
        }
        if (v75 < v63) {
          goto LABEL_15;
        }
LABEL_85:
        unint64_t v80 = v41 - 1;
        if (v41 - 1 >= v13)
        {
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
          goto LABEL_140;
        }
        if (!v11) {
          goto LABEL_143;
        }
        uint64_t v81 = v12;
        uint64_t v82 = &v39[16 * v80];
        uint64_t v83 = *(void *)v82;
        unint64_t v84 = &v39[16 * v41];
        uint64_t v85 = *((void *)v84 + 1);
        sub_2550CF34C((double *)(v11 + 24 * *(void *)v82), (double *)(v11 + 24 * *(void *)v84), v11 + 24 * v85, __dst);
        if (v1) {
          goto LABEL_93;
        }
        if (v85 < v83) {
          goto LABEL_117;
        }
        if (v41 > *((void *)v81 + 2)) {
          goto LABEL_118;
        }
        *(void *)uint64_t v82 = v83;
        *(void *)&v39[16 * v80 + 8] = v85;
        unint64_t v86 = *((void *)v81 + 2);
        if (v41 >= v86) {
          goto LABEL_119;
        }
        unint64_t v12 = v81;
        unint64_t v13 = v86 - 1;
        memmove(&v39[16 * v41], v84 + 16, 16 * (v86 - 1 - v41));
        *((void *)v81 + 2) = v86 - 1;
        uint64_t v11 = v111;
        if (v86 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v13 = 1;
LABEL_15:
    uint64_t v6 = v109;
    uint64_t v3 = v110;
    if (v10 >= v110)
    {
      uint64_t v9 = v108;
      goto LABEL_103;
    }
  }
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  uint64_t result = sub_2550D9FC0();
  __break(1u);
  return result;
}

uint64_t sub_2550CF0D0(char *__src, char *a2, unint64_t a3, char *__dst)
{
  size_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  uint64_t v24 = __src;
  uint64_t v23 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      double v16 = &v4[16 * v13];
      uint64_t v22 = v16;
      uint64_t v24 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v17 = (char *)(a3 - 16);
        double v18 = v6;
        while (1)
        {
          double v19 = v17 + 16;
          uint64_t v20 = *((void *)v18 - 2);
          v18 -= 16;
          if (*((void *)v16 - 2) >= v20)
          {
            uint64_t v22 = v16 - 16;
            if (v19 < v16 || v17 >= v16 || v19 != v16) {
              *(_OWORD *)uint64_t v17 = *((_OWORD *)v16 - 1);
            }
            double v18 = v6;
            v16 -= 16;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }
          else
          {
            if (v19 != v6 || v17 >= v6) {
              *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
            }
            uint64_t v24 = v18;
            if (v18 <= v7) {
              goto LABEL_42;
            }
          }
          v17 -= 16;
          uint64_t v6 = v18;
          if (v16 <= v4) {
            goto LABEL_42;
          }
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    uint64_t v14 = &v4[16 * v10];
    uint64_t v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        if (*(void *)v6 >= *(void *)v4)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v23 = v4;
          double v15 = v6;
        }
        else
        {
          double v15 = v6 + 16;
          if (v7 < v6 || v7 >= v15 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      uint64_t v24 = v7;
    }
LABEL_42:
    sub_2550CF708((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  uint64_t result = sub_2550DA020();
  __break(1u);
  return result;
}

uint64_t sub_2550CF34C(double *__src, double *a2, unint64_t a3, double *__dst)
{
  size_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = (char *)a2 - (char *)__src;
  int64_t v9 = ((char *)a2 - (char *)__src) / 24;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 24;
  uint64_t v26 = __src;
  uint64_t v25 = __dst;
  if (v9 >= v11)
  {
    if (v10 >= -23)
    {
      if (__dst != a2 || &a2[3 * v11] <= __dst) {
        memmove(__dst, a2, 24 * v11);
      }
      uint64_t v17 = &v4[3 * v11];
      uint64_t v24 = (char *)v17;
      uint64_t v26 = v6;
      if (v7 < v6 && v10 >= 24)
      {
        unint64_t v18 = a3 - 24;
        do
        {
          double v19 = (double *)(v18 + 24);
          if (*(v6 - 1) >= *(v17 - 1))
          {
            uint64_t v24 = (char *)(v17 - 3);
            if (v19 < v17 || v18 >= (unint64_t)v17 || v19 != v17)
            {
              long long v22 = *(_OWORD *)(v17 - 3);
              *(double *)(v18 + 16) = *(v17 - 1);
              *(_OWORD *)unint64_t v18 = v22;
            }
            uint64_t v20 = v6;
            v17 -= 3;
            if (v6 <= v7) {
              break;
            }
          }
          else
          {
            uint64_t v20 = v6 - 3;
            if (v19 != v6 || v18 >= (unint64_t)v6)
            {
              long long v21 = *(_OWORD *)v20;
              *(double *)(v18 + 16) = *(v6 - 1);
              *(_OWORD *)unint64_t v18 = v21;
            }
            uint64_t v26 = v6 - 3;
            if (v20 <= v7) {
              break;
            }
          }
          v18 -= 24;
          uint64_t v6 = v20;
        }
        while (v17 > v4);
      }
LABEL_40:
      sub_2550CF7C4((void **)&v26, (const void **)&v25, &v24);
      return 1;
    }
  }
  else if (v8 >= -23)
  {
    if (__dst != __src || &__src[3 * v9] <= __dst) {
      memmove(__dst, __src, 24 * v9);
    }
    uint64_t v12 = &v4[3 * v9];
    uint64_t v24 = (char *)v12;
    if ((unint64_t)v6 < a3 && v8 >= 24)
    {
      uint64_t v13 = v4;
      while (1)
      {
        if (v13[2] >= v6[2])
        {
          size_t v4 = v13 + 3;
          double v15 = v13;
          uint64_t v14 = v6;
          if (v7 == v13)
          {
            v13 += 3;
            if (v7 < v4) {
              goto LABEL_18;
            }
          }
          else
          {
            v13 += 3;
          }
        }
        else
        {
          uint64_t v14 = v6 + 3;
          double v15 = v6;
          if (v7 == v6 && v7 < v14) {
            goto LABEL_18;
          }
        }
        long long v16 = *(_OWORD *)v15;
        v7[2] = v15[2];
        *(_OWORD *)uint64_t v7 = v16;
LABEL_18:
        v7 += 3;
        if (v13 < v12)
        {
          uint64_t v6 = v14;
          if ((unint64_t)v14 < a3) {
            continue;
          }
        }
        uint64_t v25 = v4;
        uint64_t v26 = v7;
        goto LABEL_40;
      }
    }
    goto LABEL_40;
  }
  uint64_t result = sub_2550DA020();
  __break(1u);
  return result;
}

char *sub_2550CF60C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C38);
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
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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

char *sub_2550CF708(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_2550DA020();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_2550CF7C4(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  if (v4 <= -24)
  {
    uint64_t result = (char *)sub_2550DA020();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v6 = v4 / 24;
    if (result != v3 || result >= &v3[24 * v6])
    {
      return (char *)memmove(result, v3, 24 * v6);
    }
  }
  return result;
}

char *sub_2550CF894(uint64_t a1)
{
  return sub_2550CF60C(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2550CF8A8(uint64_t a1)
{
  return sub_2550CD760(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2550CF8BC(void *a1)
{
  return sub_2550CD8CC(0, a1[2], 0, a1);
}

uint64_t sub_2550CF8D0(void *a1)
{
  return sub_2550CDBB8(0, a1[2], 0, a1);
}

uint64_t sub_2550CF8E4(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_2550DA140() & 1;
  }
}

void *sub_2550CF93C(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (void *)v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = *(void **)(*(void *)(a4 + 56) + 8 * v16);
    *int64_t v11 = *(void *)(*(void *)(a4 + 48) + 8 * v16);
    v11[1] = v20;
    if (v13 == v10)
    {
      id v21 = v20;
      goto LABEL_38;
    }
    v11 += 2;
    uint64_t result = v20;
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2550CFB40(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  int64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    uint64_t v22 = *(void *)(*(void *)(a4 + 56) + 8 * v16);
    *int64_t v11 = *v20;
    v11[1] = v21;
    v11[2] = v22;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 3;
    uint64_t result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_2550CFD48(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v3 = MEMORY[0x263F8EE78];
    if (!v2) {
      return v3;
    }
    uint64_t v18 = MEMORY[0x263F8EE78];
    uint64_t result = sub_2550C47AC(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    uint64_t v5 = 0;
    uint64_t v3 = v18;
    unint64_t v16 = v1 & 0xC000000000000001;
    unint64_t v17 = v1;
    while (v2 != v5)
    {
      if (v16) {
        id v6 = (id)MEMORY[0x25A2879A0](v5, v1);
      }
      else {
        id v6 = *(id *)(v1 + 8 * v5 + 32);
      }
      uint64_t v7 = v6;
      objc_msgSend(v6, sel_range);
      sub_2550D9DB0();
      if (v8)
      {

        uint64_t v10 = 0;
        unint64_t v12 = 0xE000000000000000;
      }
      else
      {
        uint64_t v9 = sub_2550D9C70();
        uint64_t v10 = MEMORY[0x25A287550](v9);
        unint64_t v12 = v11;

        swift_bridgeObjectRelease();
      }
      unint64_t v14 = *(void *)(v18 + 16);
      unint64_t v13 = *(void *)(v18 + 24);
      if (v14 >= v13 >> 1) {
        sub_2550C47AC(v13 > 1, v14 + 1, 1);
      }
      ++v5;
      *(void *)(v18 + 16) = v14 + 1;
      uint64_t v15 = v18 + 16 * v14;
      *(void *)(v15 + 32) = v10;
      *(void *)(v15 + 40) = v12;
      unint64_t v1 = v17;
      if (v2 == v5) {
        return v3;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_2550D9FE0();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

_OWORD *sub_2550CFF00(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, _OWORD *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  v46[3] = a16;
  v46[4] = a21;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v46);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a16 - 8) + 32))(boxed_opaque_existential_1, a4, a16);
  v45[3] = a14;
  id v45[4] = a19;
  uint64_t v26 = __swift_allocate_boxed_opaque_existential_1(v45);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a14 - 8) + 32))(v26, a5, a14);
  v44[3] = a17;
  v44[4] = a22;
  uint64_t v27 = __swift_allocate_boxed_opaque_existential_1(v44);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a17 - 8) + 32))(v27, a6, a17);
  v43[3] = a15;
  v43[4] = a20;
  uint64_t v28 = __swift_allocate_boxed_opaque_existential_1(v43);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a15 - 8) + 32))(v28, a7, a15);
  v42[3] = a13;
  v42[4] = a18;
  uint64_t v29 = __swift_allocate_boxed_opaque_existential_1(v42);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(a13 - 8) + 32))(v29, a8, a13);
  *(void *)((char *)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_catMaxSeqLen) = 256;
  *(void *)((char *)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_nonCommerceCategories) = &unk_270441FA8;
  long long v30 = a1[1];
  a12[1] = *a1;
  a12[2] = v30;
  long long v31 = a1[3];
  a12[3] = a1[2];
  a12[4] = v31;
  sub_2550A2780(a2, (uint64_t)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_blackPearlLevels);
  *(void *)((char *)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_nerRule) = a3;
  *(void *)((char *)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_commerceSenderRule) = a9;
  *(void *)((char *)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_guaranteeList) = a10;
  *(void *)((char *)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_finalRule) = a11;
  sub_2550BD9D0((uint64_t)v46, (uint64_t)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_domainMap);
  sub_2550BD9D0((uint64_t)v45, (uint64_t)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsSubjectMap);
  sub_2550BD9D0((uint64_t)v44, (uint64_t)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsSenderMap);
  sub_2550BD9D0((uint64_t)v43, (uint64_t)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_catMap);
  sub_2550BD9D0((uint64_t)v42, (uint64_t)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_saasSenderMap);
  id v32 = objc_allocWithZone(MEMORY[0x263F08AE8]);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  *(void *)((char *)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_privateRelayRegex) = sub_2550BCDC4(0xD000000000000041, 0x80000002550DD8E0, 1);
  id v33 = objc_allocWithZone(MEMORY[0x263F08AE8]);
  *(void *)((char *)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_tsRegex) = sub_2550BCDC4(0x775C5E5B7C2B775CLL, 0xEB000000005D735CLL, 0);
  id v34 = objc_allocWithZone(MEMORY[0x263F08AE8]);
  id v35 = sub_2550BCDC4(0xD000000000000014, 0x80000002550DD9C0, 0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v42);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v43);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v44);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v45);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v46);
  sub_2550D0840(a2);
  *(void *)((char *)a12 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_alphaNumericRegex) = v35;
  return a12;
}

_OWORD *sub_2550D046C(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  uint64_t v50 = a6;
  uint64_t v51 = a7;
  uint64_t v47 = a5;
  uint64_t v45 = a4;
  uint64_t v59 = a2;
  uint64_t v60 = a3;
  uint64_t v58 = a1;
  long long v57 = a9;
  uint64_t v55 = a8;
  uint64_t v56 = a10;
  long long v53 = a18;
  long long v54 = a17;
  uint64_t v52 = a19;
  uint64_t v49 = a12;
  uint64_t v48 = *(void *)(a12 - 8);
  uint64_t v44 = a14;
  uint64_t v19 = MEMORY[0x270FA5388](a1);
  uint64_t v46 = (char *)&v41 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](v19);
  uint64_t v43 = (char *)&v41 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = *(void *)(a16 - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v23);
  uint64_t v28 = (char *)&v41 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = *(void *)(a13 - 8);
  uint64_t v30 = MEMORY[0x270FA5388](v26);
  id v32 = (char *)&v41 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = *(void *)(a15 - 8);
  MEMORY[0x270FA5388](v30);
  id v35 = (char *)&v41 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DecisionStrategy();
  uint64_t v42 = (_OWORD *)swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v35, v45, a15);
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v32, v47, a13);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v28, v50, a16);
  uint64_t v37 = (uint64_t)v43;
  uint64_t v36 = v44;
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v43, v51, v44);
  uint64_t v38 = v49;
  uint64_t v39 = (uint64_t)v46;
  (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v46, v55, v49);
  return sub_2550CFF00(v58, v59, v60, (uint64_t)v35, (uint64_t)v32, (uint64_t)v28, v37, v39, v57, *((uint64_t *)&v57 + 1), v56, v42, v38, a13, v36, a15, a16, v54, *((uint64_t *)&v54 + 1),
           v53,
           *((uint64_t *)&v53 + 1),
           v52);
}

uint64_t sub_2550D0840(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for BlackPearlLevels();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2550D089C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 40);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

char *sub_2550D08B4(unsigned __int8 *a1)
{
  int v1 = a1[65];
  int v2 = a1[66];
  int v3 = a1[68];
  if (a1[67])
  {
    uint64_t v4 = sub_2550B5134(0, 1, 1, MEMORY[0x263F8EE78]);
    unint64_t v6 = *((void *)v4 + 2);
    unint64_t v5 = *((void *)v4 + 3);
    if (v6 >= v5 >> 1) {
      uint64_t v4 = sub_2550B5134((char *)(v5 > 1), v6 + 1, 1, v4);
    }
    *((void *)v4 + 2) = v6 + 1;
    v4[v6 + 32] = 4;
    if (!v2)
    {
      if (!v3) {
        goto LABEL_6;
      }
      goto LABEL_16;
    }
    goto LABEL_9;
  }
  uint64_t v4 = (char *)MEMORY[0x263F8EE78];
  if (v2)
  {
LABEL_9:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v4 = sub_2550B5134(0, *((void *)v4 + 2) + 1, 1, v4);
    }
    unint64_t v8 = *((void *)v4 + 2);
    unint64_t v7 = *((void *)v4 + 3);
    if (v8 >= v7 >> 1) {
      uint64_t v4 = sub_2550B5134((char *)(v7 > 1), v8 + 1, 1, v4);
    }
    *((void *)v4 + 2) = v8 + 1;
    v4[v8 + 32] = 6;
    if (!v3)
    {
LABEL_6:
      if (!v1) {
        return v4;
      }
      goto LABEL_23;
    }
    goto LABEL_16;
  }
  if ((v3 & 1) == 0)
  {
    if ((v1 & 1) == 0) {
      return v4;
    }
    goto LABEL_23;
  }
LABEL_16:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v4 = sub_2550B5134(0, *((void *)v4 + 2) + 1, 1, v4);
  }
  unint64_t v10 = *((void *)v4 + 2);
  unint64_t v9 = *((void *)v4 + 3);
  if (v10 >= v9 >> 1) {
    uint64_t v4 = sub_2550B5134((char *)(v9 > 1), v10 + 1, 1, v4);
  }
  *((void *)v4 + 2) = v10 + 1;
  v4[v10 + 32] = 4;
  if (v1)
  {
LABEL_23:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v4 = sub_2550B5134(0, *((void *)v4 + 2) + 1, 1, v4);
    }
    unint64_t v12 = *((void *)v4 + 2);
    unint64_t v11 = *((void *)v4 + 3);
    if (v12 >= v11 >> 1) {
      uint64_t v4 = sub_2550B5134((char *)(v11 > 1), v12 + 1, 1, v4);
    }
    *((void *)v4 + 2) = v12 + 1;
    v4[v12 + 32] = 5;
  }
  return v4;
}

uint64_t sub_2550D0AD8(uint64_t a1, unint64_t a2)
{
  uint64_t v19 = a1;
  unint64_t v20 = a2;
  v18[4] = 1601462623;
  v18[5] = 0xE400000000000000;
  sub_2550D31A0();
  int v2 = (void *)sub_2550D9D70();
  int v3 = v2;
  if (v2[2] > 1uLL)
  {
    uint64_t v6 = v2[4];
    uint64_t v7 = v2[5];
    uint64_t v8 = v2[6];
    uint64_t v9 = v2[7];
    swift_bridgeObjectRetain();
    uint64_t v10 = MEMORY[0x25A287550](v6, v7, v8, v9);
    unint64_t v12 = v11;
    uint64_t result = swift_bridgeObjectRelease();
    if (v3[2] < 2uLL)
    {
      __break(1u);
    }
    else
    {
      unint64_t v13 = v3[8];
      unint64_t v14 = v3[9];
      swift_bridgeObjectRetain();
      uint64_t v15 = swift_bridgeObjectRelease();
      uint64_t v19 = 95;
      unint64_t v20 = 0xE100000000000000;
      MEMORY[0x270FA5388](v15);
      _OWORD v18[2] = &v19;
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_2550C4ED8(0x7FFFFFFFFFFFFFFFLL, 1, sub_2550D2F90, (uint64_t)v18, v13, v14);
      swift_bridgeObjectRelease();
      if (*(void *)(v16 + 16) > 2uLL)
      {
        uint64_t v19 = sub_2550CB74C(2, v16);
        __swift_instantiateConcreteTypeFromMangledName(&qword_269E84A50);
        sub_2550BF190(&qword_269E84A58, &qword_269E84A50);
        sub_2550D30EC();
        sub_2550D9C80();
        uint64_t v19 = v10;
        unint64_t v20 = v12;
        swift_bridgeObjectRetain();
        sub_2550D9BA0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_2550D9BA0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v19;
      }
      else
      {
        swift_bridgeObjectRelease();
        sub_2550D3098();
        swift_allocError();
        *unint64_t v17 = 1;
        swift_willThrow();
        return swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2550D3098();
    swift_allocError();
    *uint64_t v4 = 0;
    return swift_willThrow();
  }
  return result;
}

unint64_t sub_2550D0DBC(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = a1;
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4
    || (sub_2550A8F9C(), (sub_2550D9F00() & 1) == 0)
    || (sub_2550C9AF4(64, 0xE100000000000000, v3, a2), (v5 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    return v3;
  }
  unint64_t result = sub_2550D9B80();
  if (4 * v4 >= result >> 14)
  {
    uint64_t v7 = sub_2550D9C70();
    uint64_t v3 = MEMORY[0x25A287550](v7);
    swift_bridgeObjectRelease();
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_2550D0ECC(uint64_t a1)
{
  return a1;
}

uint64_t destroy for PredictionRequest()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PredictionRequest(uint64_t a1, uint64_t a2)
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
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PredictionRequest(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  return a1;
}

__n128 __swift_memcpy66_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_WORD *)(a1 + 64) = *(_WORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for PredictionRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(unsigned char *)(a1 + 65) = *(unsigned char *)(a2 + 65);
  return a1;
}

uint64_t getEnumTagSinglePayload for PredictionRequest(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 66)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PredictionRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 64) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 66) = 1;
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
    *(unsigned char *)(result + 66) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PredictionRequest()
{
  return &type metadata for PredictionRequest;
}

uint64_t sub_2550D1238()
{
  return type metadata accessor for DecisionStrategy();
}

uint64_t type metadata accessor for DecisionStrategy()
{
  uint64_t result = qword_26B279008;
  if (!qword_26B279008) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2550D128C()
{
  uint64_t result = type metadata accessor for BlackPearlLevels();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t method lookup function for DecisionStrategy(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DecisionStrategy);
}

uint64_t dispatch thunk of DecisionStrategy.__allocating_init(hashing:blackPearlLevels:nerRule:domainMap:tsSubjectMap:tsSenderMap:catMap:saasSenderMap:commerceSenderRule:guaranteeList:finalRule:)()
{
  return (*(uint64_t (**)(void))(v0 + 232))();
}

uint64_t dispatch thunk of DecisionStrategy.predictEmail(decisionRequest:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 240))();
}

uint64_t dispatch thunk of DecisionStrategy.predictCommerceEmail(predictionRequest:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 272))();
}

uint64_t dispatch thunk of DecisionStrategy.predictEnterpriseEmail(predictionRequest:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 280))();
}

uint64_t dispatch thunk of DecisionStrategy.getBlackPearlModelVersions()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 360))();
}

unint64_t sub_2550D145C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_26B278BE0);
    long long v3 = (void *)sub_2550DA010();
    for (uint64_t i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      uint64_t v5 = *(i - 1);
      uint64_t v6 = *i;
      unint64_t result = sub_2550AAC20(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      uint64_t v9 = 8 * result;
      *(void *)(v3[6] + v9) = v5;
      *(void *)(v3[7] + v9) = v6;
      uint64_t v10 = v3[2];
      BOOL v11 = __OFADD__(v10, 1);
      uint64_t v12 = v10 + 1;
      if (v11) {
        goto LABEL_10;
      }
      v3[2] = v12;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE80];
  }
  return result;
}

unint64_t sub_2550D1534(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return MEMORY[0x263F8EE80];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278BF8);
  long long v3 = (void *)sub_2550DA010();
  uint64_t v4 = a1[4];
  uint64_t v5 = (void *)a1[5];
  unint64_t result = sub_2550AAC20(v4);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    id v17 = v5;
    return (unint64_t)v3;
  }
  char v8 = (void **)(a1 + 7);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v4;
    *(void *)(v3[7] + v9) = v5;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    unint64_t v13 = v8 + 2;
    uint64_t v4 = (uint64_t)*(v8 - 1);
    unint64_t v14 = *v8;
    id v15 = v5;
    unint64_t result = sub_2550AAC20(v4);
    char v8 = v13;
    uint64_t v5 = v14;
    if (v16) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

void *sub_2550D162C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (void *)(a2 + OBJC_IVAR____TtC20MCCKitCategorization16DecisionStrategy_catMap);
  uint64_t v3 = swift_bridgeObjectRetain() + 40;
  uint64_t v4 = (void *)MEMORY[0x263F8EE78];
  do
  {
    uint64_t v5 = v13[4];
    __swift_project_boxed_opaque_existential_1(v13, v13[3]);
    sub_2550D9B10();
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_2550D9C60();
    uint64_t v7 = (*(uint64_t (**)(uint64_t))(v5 + 16))(v6);
    char v9 = v8;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v4 = sub_2550B5024(0, v4[2] + 1, 1, v4);
      }
      unint64_t v11 = v4[2];
      unint64_t v10 = v4[3];
      if (v11 >= v10 >> 1) {
        uint64_t v4 = sub_2550B5024((void *)(v10 > 1), v11 + 1, 1, v4);
      }
      v4[2] = v11 + 1;
      v4[v11 + 4] = v7;
    }
    v3 += 16;
    --v2;
  }
  while (v2);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2550D17C4(uint64_t a1, int64_t a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)(a1 + 16);
  BOOL v4 = __OFSUB__(a2, v3);
  int64_t v5 = a2 - v3;
  if ((v5 < 0) ^ v4 | (v5 == 0))
  {
    if (v5 < 0 != v4)
    {
      int64_t v7 = sub_2550CBED0(a2, a1);
      uint64_t v9 = v8;
      uint64_t v11 = v10;
      unint64_t v13 = v12;
      if (v12)
      {
        sub_2550DA150();
        swift_unknownObjectRetain_n();
        swift_bridgeObjectRetain();
        uint64_t v16 = swift_dynamicCastClass();
        if (!v16)
        {
          swift_unknownObjectRelease();
          uint64_t v16 = MEMORY[0x263F8EE78];
        }
        uint64_t v17 = *(void *)(v16 + 16);
        swift_release();
        if (__OFSUB__(v13 >> 1, v11))
        {
          __break(1u);
        }
        else if (v17 == (v13 >> 1) - v11)
        {
          uint64_t v2 = swift_dynamicCastClass();
          swift_unknownObjectRelease();
          if (!v2)
          {
            swift_unknownObjectRelease();
            return MEMORY[0x263F8EE78];
          }
          return v2;
        }
        swift_unknownObjectRelease();
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      uint64_t v14 = sub_2550CE07C(v7, v9, v11, v13);
      swift_unknownObjectRelease();
      return v14;
    }
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v18 = sub_2550B3A74(0, v5);
    uint64_t v6 = swift_bridgeObjectRetain();
    sub_2550C5A30(v6);
    return v18;
  }
  return v2;
}

uint64_t sub_2550D1928(void *a1, void (*a2)(char *, uint64_t), uint64_t a3, unint64_t a4)
{
  uint64_t v82 = a3;
  unint64_t v83 = a4;
  uint64_t v88 = sub_2550D9620();
  uint64_t v7 = *(void *)(v88 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v88);
  uint64_t v10 = (char *)&v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  unint64_t v13 = (char *)&v80 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  uint64_t v87 = (char *)&v80 - v15;
  MEMORY[0x270FA5388](v14);
  uint64_t v85 = v4;
  unint64_t v86 = (char *)&v80 - v16;
  uint64_t v17 = *(void *)(v4 + 64);
  uint64_t v18 = *(void **)(v4 + 72);
  long long v19 = *(_OWORD *)(v4 + 32);
  v91[0] = *(_OWORD *)(v4 + 16);
  v91[1] = v19;
  v91[2] = *(_OWORD *)(v4 + 48);
  uint64_t v92 = v17;
  uint64_t v93 = v18;
  swift_bridgeObjectRetain();
  id v20 = v18;
  uint64_t v21 = sub_2550C0AF8();

  swift_bridgeObjectRelease();
  int64_t v22 = *(void *)(v21 + 16);
  if (v22)
  {
    uint64_t v81 = a1;
    unint64_t v84 = a2;
    uint64_t v89 = v7;
    *(void *)&v91[0] = MEMORY[0x263F8EE78];
    sub_2550C4A14(0, v22, 0);
    uint64_t v23 = 0;
    uint64_t v24 = *(void *)&v91[0];
    unint64_t v25 = *(void *)(*(void *)&v91[0] + 16);
    do
    {
      uint64_t v26 = *(void *)(v21 + 8 * v23 + 32);
      *(void *)&v91[0] = v24;
      unint64_t v27 = *(void *)(v24 + 24);
      if (v25 >= v27 >> 1)
      {
        sub_2550C4A14(v27 > 1, v25 + 1, 1);
        uint64_t v24 = *(void *)&v91[0];
      }
      ++v23;
      *(void *)(v24 + 16) = v25 + 1;
      *(float *)(v24 + 4 * v25++ + 32) = (float)v26;
    }
    while (v22 != v23);
    swift_bridgeObjectRelease();
    uint64_t v7 = v89;
    a2 = v84;
    a1 = v81;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v24 = MEMORY[0x263F8EE78];
  }
  sub_2550D95E0();
  sub_2550D95D0();
  sub_2550D9610();
  *(void *)&v91[0] = a1;
  *((void *)&v91[0] + 1) = a2;
  sub_2550D95C0();
  sub_2550D9600();
  uint64_t v28 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v29 = v88;
  v28(v10, v88);
  sub_2550A8F9C();
  uint64_t v30 = sub_2550D9EB0();
  uint64_t v89 = v7 + 8;
  unint64_t v84 = v28;
  v28(v13, v29);
  uint64_t v31 = *(void *)(v30 + 16);
  uint64_t v32 = MEMORY[0x263F8EE78];
  if (v31)
  {
    uint64_t v33 = (uint64_t *)(v30 + 40);
    do
    {
      uint64_t v38 = *(v33 - 1);
      uint64_t v37 = *v33;
      uint64_t v39 = HIBYTE(*v33) & 0xF;
      if ((*v33 & 0x2000000000000000) == 0) {
        uint64_t v39 = v38 & 0xFFFFFFFFFFFFLL;
      }
      if (v39)
      {
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)&v91[0] = v32;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_2550C47AC(0, *(void *)(v32 + 16) + 1, 1);
          uint64_t v32 = *(void *)&v91[0];
        }
        unint64_t v35 = *(void *)(v32 + 16);
        unint64_t v34 = *(void *)(v32 + 24);
        if (v35 >= v34 >> 1)
        {
          sub_2550C47AC(v34 > 1, v35 + 1, 1);
          uint64_t v32 = *(void *)&v91[0];
        }
        *(void *)(v32 + 16) = v35 + 1;
        uint64_t v36 = v32 + 16 * v35;
        *(void *)(v36 + 32) = v38;
        *(void *)(v36 + 40) = v37;
      }
      v33 += 2;
      --v31;
    }
    while (v31);
  }
  swift_bridgeObjectRelease();
  uint64_t v41 = v85;
  swift_retain();
  uint64_t v42 = 0;
  uint64_t v43 = sub_2550D162C(v32, v41);
  swift_release();
  swift_release();
  if (qword_26B278B80 != -1) {
    swift_once();
  }
  uint64_t v44 = sub_2550D9A00();
  __swift_project_value_buffer(v44, (uint64_t)qword_26B279BA0);
  swift_bridgeObjectRetain_n();
  uint64_t v45 = sub_2550D99E0();
  os_log_type_t v46 = sub_2550D9DD0();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    uint64_t v81 = 0;
    uint64_t v49 = v48;
    *(void *)&v91[0] = v48;
    *(_DWORD *)uint64_t v47 = 136315138;
    uint64_t v50 = swift_bridgeObjectRetain();
    uint64_t v51 = MEMORY[0x25A2876D0](v50, MEMORY[0x263F8D6C8]);
    unint64_t v53 = v52;
    swift_bridgeObjectRelease();
    uint64_t v90 = sub_2550A7884(v51, v53, (uint64_t *)v91);
    sub_2550D9E90();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_25509D000, v45, v46, "LSTM Token IDs: %s", v47, 0xCu);
    swift_arrayDestroy();
    uint64_t v42 = v81;
    MEMORY[0x25A2881E0](v49, -1, -1);
    MEMORY[0x25A2881E0](v47, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v54 = sub_2550D17C4((uint64_t)v43, 256);
  swift_bridgeObjectRelease();
  int64_t v55 = *(void *)(v54 + 16);
  if (v55)
  {
    *(void *)&v91[0] = MEMORY[0x263F8EE78];
    sub_2550C4A14(0, v55, 0);
    uint64_t v56 = 0;
    uint64_t v57 = *(void *)&v91[0];
    unint64_t v58 = *(void *)(*(void *)&v91[0] + 16);
    do
    {
      uint64_t v59 = *(void *)(v54 + 8 * v56 + 32);
      *(void *)&v91[0] = v57;
      unint64_t v60 = *(void *)(v57 + 24);
      if (v58 >= v60 >> 1)
      {
        sub_2550C4A14(v60 > 1, v58 + 1, 1);
        uint64_t v57 = *(void *)&v91[0];
      }
      ++v56;
      *(void *)(v57 + 16) = v58 + 1;
      *(float *)(v57 + 4 * v58++ + 32) = (float)v59;
    }
    while (v55 != v56);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v57 = MEMORY[0x263F8EE78];
  }
  *(void *)&v91[0] = v57;
  sub_2550C58E4(v24);
  uint64_t v61 = *(void *)&v91[0];
  unint64_t v62 = HIBYTE(v83) & 0xF;
  if ((v83 & 0x2000000000000000) == 0) {
    unint64_t v62 = v82 & 0xFFFFFFFFFFFFLL;
  }
  if (v62)
  {
    unint64_t v63 = sub_2550D0DBC(v82, v83);
    uint64_t v65 = sub_2550C9BE4(v63, v64);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    uint64_t v66 = (char *)v61;
    if (swift_isUniquelyReferenced_nonNull_native()) {
      goto LABEL_35;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v65 = -1;
    uint64_t v66 = (char *)v61;
    if (swift_isUniquelyReferenced_nonNull_native()) {
      goto LABEL_35;
    }
  }
  uint64_t v66 = sub_2550B5348(0, *(void *)(v61 + 16) + 1, 1, (char *)v61);
LABEL_35:
  unint64_t v68 = *((void *)v66 + 2);
  unint64_t v67 = *((void *)v66 + 3);
  if (v68 >= v67 >> 1) {
    uint64_t v66 = sub_2550B5348((char *)(v67 > 1), v68 + 1, 1, v66);
  }
  *((void *)v66 + 2) = v68 + 1;
  *(float *)&v66[4 * v68 + 32] = (float)v65;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C48);
  uint64_t v69 = swift_allocObject();
  *(_OWORD *)(v69 + 16) = xmmword_2550DC070;
  sub_2550D305C(0, &qword_26B278BC8);
  *(void *)(v69 + 32) = sub_2550D9E10();
  *(void *)(v69 + 40) = sub_2550D9E10();
  *(void *)&v91[0] = v69;
  sub_2550D9CC0();
  uint64_t v70 = *(void *)&v91[0];
  id v71 = objc_allocWithZone(MEMORY[0x263F00DA8]);
  id v72 = sub_2550CD06C(v70, 65600);
  if (v42)
  {

    goto LABEL_46;
  }
  uint64_t v73 = v72;
  if (!v72)
  {
LABEL_46:
    uint64_t result = sub_2550D9FD0();
    __break(1u);
    return result;
  }
  uint64_t v74 = *((void *)v66 + 2);
  if (v74)
  {
    for (uint64_t i = 0; i != v74; ++i)
    {
      uint64_t v76 = (void *)sub_2550D9D40();
      objc_msgSend(v73, sel_setObject_atIndexedSubscript_, v76, i);
    }
  }
  swift_bridgeObjectRelease();
  uint64_t v77 = v88;
  uint64_t v78 = v84;
  v84(v87, v88);
  v78(v86, v77);
  return (uint64_t)v73;
}

uint64_t sub_2550D21A4(void *a1)
{
  uint64_t v2 = (void *)sub_2550C568C(MEMORY[0x263F8EE78]);
  id v3 = objc_msgSend(a1, sel_count);
  if (__OFSUB__(v3, 1)) {
    goto LABEL_23;
  }
  if ((((unint64_t)v3 - 1) & 0x8000000000000000) != 0)
  {
LABEL_24:
    __break(1u);
LABEL_25:
    uint64_t result = sub_2550DA180();
    __break(1u);
  }
  else
  {
    id v4 = v3;
    id v5 = objc_msgSend(a1, sel_objectAtIndexedSubscript_, 0);
    objc_msgSend(v5, sel_doubleValue);
    uint64_t v7 = v6;

    if (qword_270442008)
    {
      uint64_t v8 = (uint64_t *)&unk_270442020;
      unint64_t v9 = 1;
      do
      {
        uint64_t v11 = *(v8 - 1);
        uint64_t v10 = *v8;
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v14 = sub_2550AAB38(v11, v10);
        uint64_t v15 = v2[2];
        BOOL v16 = (v13 & 1) == 0;
        uint64_t v17 = v15 + v16;
        if (__OFADD__(v15, v16))
        {
          __break(1u);
LABEL_22:
          __break(1u);
LABEL_23:
          __break(1u);
          goto LABEL_24;
        }
        char v18 = v13;
        if (v2[3] >= v17)
        {
          if (isUniquelyReferenced_nonNull_native)
          {
            if (v13) {
              goto LABEL_12;
            }
          }
          else
          {
            sub_2550AC3B0();
            if (v18) {
              goto LABEL_12;
            }
          }
        }
        else
        {
          sub_2550AB7DC(v17, isUniquelyReferenced_nonNull_native);
          unint64_t v19 = sub_2550AAB38(v11, v10);
          if ((v18 & 1) != (v20 & 1)) {
            goto LABEL_25;
          }
          unint64_t v14 = v19;
          if (v18)
          {
LABEL_12:
            *(void *)(v2[7] + 8 * v14) = v7;
            goto LABEL_16;
          }
        }
        v2[(v14 >> 6) + 8] |= 1 << v14;
        uint64_t v21 = (uint64_t *)(v2[6] + 16 * v14);
        *uint64_t v21 = v11;
        v21[1] = v10;
        *(void *)(v2[7] + 8 * v14) = v7;
        uint64_t v22 = v2[2];
        BOOL v23 = __OFADD__(v22, 1);
        uint64_t v24 = v22 + 1;
        if (v23) {
          goto LABEL_22;
        }
        v2[2] = v24;
        swift_bridgeObjectRetain();
LABEL_16:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v4 == (id)v9) {
          goto LABEL_20;
        }
        v8 += 2;
        id v25 = objc_msgSend(a1, sel_objectAtIndexedSubscript_, v9);
        objc_msgSend(v25, sel_doubleValue);
        uint64_t v7 = v26;
      }
      while (v9++ < qword_270442008);
    }
    __break(1u);
LABEL_20:
    swift_arrayDestroy();
    return (uint64_t)v2;
  }
  return result;
}

void *sub_2550D2414(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v14 = (void *)(a2 + *a3);
  uint64_t v4 = swift_bridgeObjectRetain() + 56;
  id v5 = (void *)MEMORY[0x263F8EE78];
  do
  {
    uint64_t v15 = v5;
    uint64_t v6 = v14[4];
    __swift_project_boxed_opaque_existential_1(v14, v14[3]);
    swift_bridgeObjectRetain();
    sub_2550D9E40();
    uint64_t v7 = sub_2550D9C60();
    uint64_t v8 = (*(uint64_t (**)(uint64_t))(v6 + 16))(v7);
    char v10 = v9;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v10)
    {
      id v5 = v15;
    }
    else
    {
      id v5 = v15;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        id v5 = sub_2550B5024(0, v15[2] + 1, 1, v15);
      }
      unint64_t v12 = v5[2];
      unint64_t v11 = v5[3];
      if (v12 >= v11 >> 1) {
        id v5 = sub_2550B5024((void *)(v11 > 1), v12 + 1, 1, v5);
      }
      uint64_t v5[2] = v12 + 1;
      v5[v12 + 4] = v8;
    }
    v4 += 32;
    --v3;
  }
  while (v3);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2550D25C0(uint64_t a1, uint64_t a2)
{
  int64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = MEMORY[0x263F8EE78];
  if (v3)
  {
    uint64_t v21 = MEMORY[0x263F8EE78];
    sub_2550C4A14(0, v3, 0);
    uint64_t v4 = v21;
    uint64_t v6 = (uint64_t *)(a1 + 32);
    unint64_t v7 = *(void *)(v21 + 16);
    do
    {
      uint64_t v9 = *v6++;
      uint64_t v8 = v9;
      unint64_t v10 = *(void *)(v21 + 24);
      if (v7 >= v10 >> 1) {
        sub_2550C4A14(v10 > 1, v7 + 1, 1);
      }
      *(void *)(v21 + 16) = v7 + 1;
      *(float *)(v21 + 4 * v7++ + 32) = (float)v8;
      --v3;
    }
    while (v3);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C48);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_2550DC070;
  sub_2550D305C(0, &qword_26B278BC8);
  *(void *)(v11 + 32) = sub_2550D9E10();
  *(void *)(v11 + 40) = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, a2);
  sub_2550D9CC0();
  id v12 = objc_allocWithZone(MEMORY[0x263F00DA8]);
  id v13 = sub_2550CD06C(v11, 65600);
  if (v13)
  {
    uint64_t v14 = *(void *)(v4 + 16);
    if (v14)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        int v16 = *(_DWORD *)(v4 + 32 + 4 * i);
        id v17 = objc_allocWithZone(NSNumber);
        LODWORD(v18) = v16;
        id v19 = objc_msgSend(v17, sel_initWithFloat_, v18);
        objc_msgSend(v13, sel_setObject_atIndexedSubscript_, v19, i);
      }
    }
    swift_bridgeObjectRelease();
    return (uint64_t)v13;
  }
  else
  {
    uint64_t result = sub_2550D9FD0();
    __break(1u);
  }
  return result;
}

uint64_t sub_2550D2814(void *a1)
{
  uint64_t v2 = (void *)sub_2550C568C(MEMORY[0x263F8EE78]);
  id v3 = objc_msgSend(a1, sel_count);
  if (__OFSUB__(v3, 1)) {
    goto LABEL_23;
  }
  if ((((unint64_t)v3 - 1) & 0x8000000000000000) != 0)
  {
LABEL_24:
    __break(1u);
LABEL_25:
    uint64_t result = sub_2550DA180();
    __break(1u);
  }
  else
  {
    id v4 = v3;
    id v5 = objc_msgSend(a1, sel_objectAtIndexedSubscript_, 0);
    objc_msgSend(v5, sel_doubleValue);
    uint64_t v7 = v6;

    if (qword_270442078)
    {
      uint64_t v8 = (uint64_t *)&unk_270442090;
      unint64_t v9 = 1;
      do
      {
        uint64_t v11 = *(v8 - 1);
        uint64_t v10 = *v8;
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v14 = sub_2550AAB38(v11, v10);
        uint64_t v15 = v2[2];
        BOOL v16 = (v13 & 1) == 0;
        uint64_t v17 = v15 + v16;
        if (__OFADD__(v15, v16))
        {
          __break(1u);
LABEL_22:
          __break(1u);
LABEL_23:
          __break(1u);
          goto LABEL_24;
        }
        char v18 = v13;
        if (v2[3] >= v17)
        {
          if (isUniquelyReferenced_nonNull_native)
          {
            if (v13) {
              goto LABEL_12;
            }
          }
          else
          {
            sub_2550AC3B0();
            if (v18) {
              goto LABEL_12;
            }
          }
        }
        else
        {
          sub_2550AB7DC(v17, isUniquelyReferenced_nonNull_native);
          unint64_t v19 = sub_2550AAB38(v11, v10);
          if ((v18 & 1) != (v20 & 1)) {
            goto LABEL_25;
          }
          unint64_t v14 = v19;
          if (v18)
          {
LABEL_12:
            *(void *)(v2[7] + 8 * v14) = v7;
            goto LABEL_16;
          }
        }
        v2[(v14 >> 6) + 8] |= 1 << v14;
        uint64_t v21 = (uint64_t *)(v2[6] + 16 * v14);
        *uint64_t v21 = v11;
        v21[1] = v10;
        *(void *)(v2[7] + 8 * v14) = v7;
        uint64_t v22 = v2[2];
        BOOL v23 = __OFADD__(v22, 1);
        uint64_t v24 = v22 + 1;
        if (v23) {
          goto LABEL_22;
        }
        v2[2] = v24;
        swift_bridgeObjectRetain();
LABEL_16:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v4 == (id)v9) {
          goto LABEL_20;
        }
        v8 += 2;
        id v25 = objc_msgSend(a1, sel_objectAtIndexedSubscript_, v9);
        objc_msgSend(v25, sel_doubleValue);
        uint64_t v7 = v26;
      }
      while (v9++ < qword_270442078);
    }
    __break(1u);
LABEL_20:
    swift_arrayDestroy();
    return (uint64_t)v2;
  }
  return result;
}

uint64_t sub_2550D2A84(uint64_t a1)
{
  unint64_t v33 = sub_2550C568C(MEMORY[0x263F8EE78]);
  uint64_t v32 = a1 + 64;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  unint64_t v4 = v3 & *(void *)(a1 + 64);
  int64_t v5 = (unint64_t)(v2 + 63) >> 6;
  int64_t v31 = v5 - 1;
  swift_bridgeObjectRetain();
  int64_t v34 = 0;
  if (!v4) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v6 = __clz(__rbit64(v4));
  v4 &= v4 - 1;
  unint64_t v7 = v6 | (v34 << 6);
LABEL_7:
  sub_2550D2E74(*(void *)(a1 + 48) + 40 * v7, (uint64_t)&v39);
  *((void *)&v41 + 1) = *(void *)(*(void *)(a1 + 56) + 8 * v7);
  id v8 = *((id *)&v41 + 1);
  while (1)
  {
    sub_2550D2ED0((uint64_t)&v39, (uint64_t)&v42, &qword_269E84A30);
    if (!*((void *)&v43 + 1))
    {
      swift_release();
      return v33;
    }
    long long v39 = v42;
    long long v40 = v43;
    id v12 = v45;
    *(void *)&long long v41 = v44;
    sub_2550D9F30();
    if (swift_dynamicCast())
    {
      uint64_t v37 = 0;
      char v38 = 1;
      MEMORY[0x25A287740](v12, &v37);
      if (v38)
      {
        swift_bridgeObjectRelease();

        sub_2550D2F34((uint64_t)&v39);
      }
      else
      {
        uint64_t v13 = a1;
        int64_t v14 = v5;
        uint64_t v15 = v37;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v37 = (void *)v33;
        unint64_t v18 = sub_2550AAB38(v35, v36);
        uint64_t v19 = *(void *)(v33 + 16);
        BOOL v20 = (v17 & 1) == 0;
        uint64_t v21 = v19 + v20;
        if (__OFADD__(v19, v20)) {
          goto LABEL_45;
        }
        char v22 = v17;
        if (*(void *)(v33 + 24) >= v21)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            sub_2550AC3B0();
          }
        }
        else
        {
          sub_2550AB7DC(v21, isUniquelyReferenced_nonNull_native);
          unint64_t v23 = sub_2550AAB38(v35, v36);
          if ((v22 & 1) != (v24 & 1)) {
            goto LABEL_48;
          }
          unint64_t v18 = v23;
        }
        id v25 = v37;
        unint64_t v33 = (unint64_t)v37;
        if (v22)
        {
          *(void *)(v37[7] + 8 * v18) = v15;
        }
        else
        {
          v37[(v18 >> 6) + 8] |= 1 << v18;
          uint64_t v26 = (uint64_t *)(v25[6] + 16 * v18);
          *uint64_t v26 = v35;
          v26[1] = v36;
          *(void *)(v25[7] + 8 * v18) = v15;
          uint64_t v27 = v25[2];
          BOOL v28 = __OFADD__(v27, 1);
          uint64_t v29 = v27 + 1;
          if (v28) {
            goto LABEL_46;
          }
          void v25[2] = v29;
          swift_bridgeObjectRetain();
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_2550D2F34((uint64_t)&v39);
        int64_t v5 = v14;
        a1 = v13;
      }
      if (v4) {
        goto LABEL_6;
      }
    }
    else
    {

      sub_2550D2F34((uint64_t)&v39);
      if (v4) {
        goto LABEL_6;
      }
    }
LABEL_8:
    int64_t v9 = v34 + 1;
    if (__OFADD__(v34, 1)) {
      break;
    }
    if (v9 < v5)
    {
      unint64_t v10 = *(void *)(v32 + 8 * v9);
      if (v10) {
        goto LABEL_11;
      }
      int64_t v11 = v34 + 2;
      ++v34;
      if (v9 + 1 < v5)
      {
        unint64_t v10 = *(void *)(v32 + 8 * v11);
        if (v10) {
          goto LABEL_14;
        }
        int64_t v34 = v9 + 1;
        if (v9 + 2 < v5)
        {
          unint64_t v10 = *(void *)(v32 + 8 * (v9 + 2));
          if (v10)
          {
            v9 += 2;
            goto LABEL_11;
          }
          int64_t v11 = v9 + 3;
          int64_t v34 = v9 + 2;
          if (v9 + 3 < v5)
          {
            unint64_t v10 = *(void *)(v32 + 8 * v11);
            if (!v10)
            {
              while (1)
              {
                int64_t v9 = v11 + 1;
                if (__OFADD__(v11, 1)) {
                  goto LABEL_47;
                }
                if (v9 >= v5)
                {
                  int64_t v34 = v31;
                  goto LABEL_25;
                }
                unint64_t v10 = *(void *)(v32 + 8 * v9);
                ++v11;
                if (v10) {
                  goto LABEL_11;
                }
              }
            }
LABEL_14:
            int64_t v9 = v11;
LABEL_11:
            unint64_t v4 = (v10 - 1) & v10;
            unint64_t v7 = __clz(__rbit64(v10)) + (v9 << 6);
            int64_t v34 = v9;
            goto LABEL_7;
          }
        }
      }
    }
LABEL_25:
    unint64_t v4 = 0;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v39 = 0u;
  }
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  uint64_t result = sub_2550DA180();
  __break(1u);
  return result;
}

uint64_t sub_2550D2E74(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2550D2ED0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2550D2F34(uint64_t a1)
{
  return a1;
}

uint64_t sub_2550D2F88()
{
  return swift_release();
}

uint64_t sub_2550D2F90(void *a1)
{
  return sub_2550D3280(a1) & 1;
}

uint64_t sub_2550D2FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B278B90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2550D3014()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2550D304C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2550D305C(uint64_t a1, unint64_t *a2)
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

unint64_t sub_2550D3098()
{
  unint64_t result = qword_269E84A38;
  if (!qword_269E84A38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84A38);
  }
  return result;
}

unint64_t sub_2550D30EC()
{
  unint64_t result = qword_26B278B88;
  if (!qword_26B278B88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26B278B88);
  }
  return result;
}

uint64_t sub_2550D3140(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_269E84A40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2550D31A0()
{
  unint64_t result = qword_269E84A48;
  if (!qword_269E84A48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84A48);
  }
  return result;
}

double sub_2550D31F4(_OWORD *a1)
{
  double result = 0.0;
  *(_OWORD *)((char *)a1 + 217) = 0u;
  a1[12] = 0u;
  a1[13] = 0u;
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
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

uint64_t sub_2550D3280(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_2550DA140() & 1;
  }
}

unsigned char *storeEnumTagSinglePayload for DecisionStrategy.Error(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *double result = a2 + 1;
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
        JUMPOUT(0x2550D33A4);
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
          *double result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DecisionStrategy.Error()
{
  return &type metadata for DecisionStrategy.Error;
}

unint64_t sub_2550D33E4()
{
  unint64_t result = qword_269E84A60;
  if (!qword_269E84A60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84A60);
  }
  return result;
}

uint64_t sub_2550D343C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = sub_2550D97D0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  long long v127 = (char *)&v118 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  long long v128 = (char *)&v118 - v9;
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  long long v129 = (char *)&v118 - v11;
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  long long v130 = (char *)&v118 - v13;
  MEMORY[0x270FA5388](v12);
  long long v131 = (char *)&v118 - v14;
  uint64_t v15 = type metadata accessor for BloomFilterData(0);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v135 = (uint64_t)&v118 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for BlackPearlModel(0);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  v134 = (uint64_t *)((char *)&v118 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  long long v138 = (uint64_t *)((char *)&v118 - v21);
  MEMORY[0x270FA5388](v20);
  long long v141 = (uint64_t *)((char *)&v118 - v22);
  type metadata accessor for BlackPearlSharedDefaults();
  swift_allocObject();
  *a2 = sub_2550AC738();
  swift_retain();
  static BlackPearlTrialLevels.buildVersion(trialClient:)(a1, (uint64_t)v146);
  long long v165 = v157;
  v166[0] = v158[0];
  *(_OWORD *)((char *)v166 + 9) = *(_OWORD *)((char *)v158 + 9);
  long long v161 = v153;
  long long v162 = v154;
  long long v163 = v155;
  long long v164 = v156;
  long long v159 = v151;
  long long v160 = v152;
  unint64_t v139 = v146[1];
  uint64_t v140 = v146[0];
  unint64_t v136 = v148;
  uint64_t v137 = v147;
  unint64_t v132 = v150;
  uint64_t v133 = v149;
  v158[0] = v166[0];
  *(_OWORD *)((char *)v158 + 9) = *(_OWORD *)((char *)v166 + 9);
  sub_2550AC9F8(v146);
  swift_release();
  unint64_t v23 = (void *)sub_2550D9AA0();
  long long v143 = "P";
  char v24 = (void *)sub_2550D9AA0();
  id v126 = a1;
  id v25 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v23, v24);

  if (!v25) {
    goto LABEL_38;
  }
  id v26 = objc_msgSend(v25, sel_directoryValue);

  if (!v26)
  {
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  id v27 = objc_msgSend(v26, sel_path);

  if (!v27) {
    goto LABEL_38;
  }
  uint64_t v124 = a2;
  uint64_t v125 = v5;
  BOOL v28 = (char *)sub_2550D9AD0();
  uint64_t v30 = v29;

  v146[0] = 47;
  v146[1] = 0xE100000000000000;
  long long v144 = v28;
  uint64_t v145 = v30;
  swift_bridgeObjectRetain();
  long long v144 = (char *)sub_2550D9C60();
  uint64_t v145 = v31;
  sub_2550D9B90();
  swift_bridgeObjectRelease();
  strcpy((char *)v146, "BlackPearl");
  BYTE3(v146[1]) = 0;
  HIDWORD(v146[1]) = -369098752;
  swift_bridgeObjectRetain();
  long long v144 = (char *)sub_2550D9C60();
  uint64_t v145 = v32;
  sub_2550D9B90();
  swift_bridgeObjectRelease();
  strcpy((char *)v146, ".mlpackage");
  BYTE3(v146[1]) = 0;
  HIDWORD(v146[1]) = -369098752;
  swift_bridgeObjectRetain();
  long long v144 = (char *)sub_2550D9C60();
  uint64_t v145 = v33;
  sub_2550D9B90();
  swift_bridgeObjectRelease();
  int64_t v34 = v144;
  uint64_t v35 = v145;
  id v142 = (id)type metadata accessor for TrialLoader();
  static TrialLoader.compileModel(modelPath:modelName:modelVersion:)(v34, v35, 0x6165506B63616C42, 0xEA00000000006C72, v140, v139, v141);
  swift_bridgeObjectRelease();
  uint64_t v36 = (void *)sub_2550D9AA0();
  uint64_t v37 = (void *)sub_2550D9AA0();
  id v38 = v126;
  id v39 = objc_msgSend(v126, sel_levelForFactor_withNamespaceName_, v36, v37);

  if (!v39) {
    goto LABEL_38;
  }
  id v40 = objc_msgSend(v39, sel_directoryValue);

  if (!v40) {
    goto LABEL_30;
  }
  id v41 = objc_msgSend(v40, sel_path);

  if (!v41) {
    goto LABEL_38;
  }
  uint64_t v123 = v4;
  long long v42 = (char *)sub_2550D9AD0();
  uint64_t v44 = v43;

  v146[0] = 47;
  v146[1] = 0xE100000000000000;
  long long v144 = v42;
  uint64_t v145 = v44;
  swift_bridgeObjectRetain();
  long long v144 = (char *)sub_2550D9C60();
  uint64_t v145 = v45;
  sub_2550D9B90();
  swift_bridgeObjectRelease();
  v146[0] = 0xD000000000000010;
  v146[1] = 0x80000002550DC720;
  swift_bridgeObjectRetain();
  long long v144 = (char *)sub_2550D9C60();
  uint64_t v145 = v46;
  sub_2550D9B90();
  swift_bridgeObjectRelease();
  strcpy((char *)v146, ".mlpackage");
  BYTE3(v146[1]) = 0;
  HIDWORD(v146[1]) = -369098752;
  swift_bridgeObjectRetain();
  long long v144 = (char *)sub_2550D9C60();
  uint64_t v145 = v47;
  sub_2550D9B90();
  swift_bridgeObjectRelease();
  static TrialLoader.compileModel(modelPath:modelName:modelVersion:)(v144, v145, 0xD000000000000010, 0x80000002550DC720, v137, v136, v138);
  swift_bridgeObjectRelease();
  uint64_t v48 = (void *)sub_2550D9AA0();
  uint64_t v49 = (void *)sub_2550D9AA0();
  id v50 = objc_msgSend(v38, sel_levelForFactor_withNamespaceName_, v48, v49);

  if (!v50) {
    goto LABEL_38;
  }
  id v51 = objc_msgSend(v50, sel_directoryValue);

  if (!v51) {
    goto LABEL_31;
  }
  id v52 = objc_msgSend(v51, sel_path);

  if (!v52) {
    goto LABEL_38;
  }
  unint64_t v53 = (char *)sub_2550D9AD0();
  int64_t v55 = v54;

  v146[0] = 47;
  v146[1] = 0xE100000000000000;
  long long v144 = v53;
  uint64_t v145 = v55;
  swift_bridgeObjectRetain();
  long long v144 = (char *)sub_2550D9C60();
  uint64_t v145 = v56;
  sub_2550D9B90();
  swift_bridgeObjectRelease();
  strcpy((char *)v146, "BlackPearlTS");
  BYTE5(v146[1]) = 0;
  HIWORD(v146[1]) = -5120;
  swift_bridgeObjectRetain();
  long long v144 = (char *)sub_2550D9C60();
  uint64_t v145 = v57;
  sub_2550D9B90();
  swift_bridgeObjectRelease();
  strcpy((char *)v146, ".mlpackage");
  BYTE3(v146[1]) = 0;
  HIDWORD(v146[1]) = -369098752;
  swift_bridgeObjectRetain();
  long long v144 = (char *)sub_2550D9C60();
  uint64_t v145 = v58;
  sub_2550D9B90();
  swift_bridgeObjectRelease();
  static TrialLoader.compileModel(modelPath:modelName:modelVersion:)(v144, v145, 0x6165506B63616C42, 0xEC00000053546C72, v133, v132, v134);
  swift_bridgeObjectRelease();
  static BlackPearlTrialLevels.buildThresholds(trialClient:)(v38, v146);
  uint64_t v59 = v146[0];
  uint64_t v60 = v146[1];
  uint64_t v61 = v147;
  unint64_t v62 = v148;
  uint64_t v63 = v149;
  unint64_t v64 = v150;
  long long v65 = v151;
  uint64_t v122 = v152;
  uint64_t v66 = v153;
  uint64_t v121 = *((void *)&v152 + 1);
  static BlackPearlTrialLevels.buildBloomFilters(trialClient:)(v38, v135);
  unint64_t v67 = (void *)sub_2550D9AA0();
  unint64_t v68 = (void *)sub_2550D9AA0();
  id v69 = objc_msgSend(v38, sel_levelForFactor_withNamespaceName_, v67, v68);

  if (!v69) {
    goto LABEL_38;
  }
  id v70 = objc_msgSend(v69, sel_fileValue);
  if (!v70) {
    goto LABEL_32;
  }
  id v71 = v70;
  id v72 = objc_msgSend(v70, sel_path);

  if (!v72) {
    goto LABEL_38;
  }
  id v120 = v69;
  sub_2550D9AD0();

  sub_2550D9720();
  swift_bridgeObjectRelease();
  uint64_t v73 = (void *)sub_2550D9AA0();
  uint64_t v74 = (void *)sub_2550D9AA0();
  id v75 = objc_msgSend(v38, sel_levelForFactor_withNamespaceName_, v73, v74);

  id v142 = v75;
  if (!v75) {
    goto LABEL_38;
  }
  id v76 = objc_msgSend(v142, sel_fileValue);
  if (!v76) {
    goto LABEL_33;
  }
  uint64_t v77 = v76;
  id v78 = objc_msgSend(v76, (SEL)&selRef_setObject_forKey_);

  if (!v78) {
    goto LABEL_38;
  }
  uint64_t v119 = v66;
  sub_2550D9AD0();

  sub_2550D9720();
  swift_bridgeObjectRelease();
  uint64_t v79 = (void *)sub_2550D9AA0();
  uint64_t v80 = (void *)sub_2550D9AA0();
  id v81 = objc_msgSend(v38, sel_levelForFactor_withNamespaceName_, v79, v80);

  if (!v81) {
    goto LABEL_38;
  }
  id v82 = objc_msgSend(v81, sel_fileValue);
  if (!v82) {
    goto LABEL_34;
  }
  unint64_t v83 = v82;
  id v84 = objc_msgSend(v82, (SEL)&selRef_setObject_forKey_);

  if (!v84) {
    goto LABEL_38;
  }
  sub_2550D9AD0();

  sub_2550D9720();
  swift_bridgeObjectRelease();
  uint64_t v85 = (void *)sub_2550D9AA0();
  unint64_t v86 = (void *)sub_2550D9AA0();
  id v87 = objc_msgSend(v38, sel_levelForFactor_withNamespaceName_, v85, v86);

  if (!v87) {
    goto LABEL_38;
  }
  id v88 = objc_msgSend(v87, sel_fileValue);
  if (!v88) {
    goto LABEL_35;
  }
  uint64_t v89 = v88;
  id v90 = objc_msgSend(v88, (SEL)&selRef_setObject_forKey_);

  if (!v90) {
    goto LABEL_38;
  }
  sub_2550D9AD0();

  sub_2550D9720();
  swift_bridgeObjectRelease();
  uint64_t v91 = (void *)sub_2550D9AA0();
  uint64_t v92 = (void *)sub_2550D9AA0();
  id v93 = objc_msgSend(v38, sel_levelForFactor_withNamespaceName_, v91, v92);

  if (!v93) {
    goto LABEL_38;
  }
  id v94 = objc_msgSend(v93, sel_fileValue);
  if (!v94) {
    goto LABEL_36;
  }
  uint64_t v95 = v94;
  id v96 = objc_msgSend(v94, sel_path);

  if (!v96) {
    goto LABEL_38;
  }
  sub_2550D9AD0();

  sub_2550D9720();
  swift_bridgeObjectRelease();
  uint64_t v97 = (void *)sub_2550D9AA0();
  uint64_t v98 = (void *)sub_2550D9AA0();
  id v99 = objc_msgSend(v38, sel_levelForFactor_withNamespaceName_, v97, v98);

  if (!v99) {
    goto LABEL_38;
  }
  id v100 = objc_msgSend(v99, sel_fileValue);
  if (!v100) {
    goto LABEL_37;
  }
  long long v101 = v100;
  id v102 = objc_msgSend(v100, sel_path);

  if (v102)
  {
    sub_2550D9AD0();

    uint64_t v103 = (uint64_t)v124 + *(int *)(type metadata accessor for BlackPearlTrialLevels() + 20);
    uint64_t v104 = (int *)type metadata accessor for BlackPearlLevels();
    sub_2550D9720();
    swift_bridgeObjectRelease();

    sub_25509F608((uint64_t)v141, v103, type metadata accessor for BlackPearlModel);
    sub_25509F608((uint64_t)v138, v103 + v104[5], type metadata accessor for BlackPearlModel);
    sub_25509F608((uint64_t)v134, v103 + v104[6], type metadata accessor for BlackPearlModel);
    uint64_t v105 = v103 + v104[7];
    unint64_t v106 = v139;
    *(void *)uint64_t v105 = v140;
    *(void *)(v105 + 8) = v106;
    unint64_t v107 = v136;
    *(void *)(v105 + 16) = v137;
    *(void *)(v105 + 24) = v107;
    unint64_t v108 = v132;
    *(void *)(v105 + 32) = v133;
    *(void *)(v105 + 40) = v108;
    long long v109 = v166[0];
    *(_OWORD *)(v105 + 144) = v165;
    *(_OWORD *)(v105 + 160) = v109;
    *(_OWORD *)(v105 + 169) = *(_OWORD *)((char *)v166 + 9);
    long long v110 = v162;
    *(_OWORD *)(v105 + 80) = v161;
    *(_OWORD *)(v105 + 96) = v110;
    long long v111 = v164;
    *(_OWORD *)(v105 + 112) = v163;
    *(_OWORD *)(v105 + 128) = v111;
    long long v112 = v160;
    *(_OWORD *)(v105 + 48) = v159;
    *(_OWORD *)(v105 + 64) = v112;
    uint64_t v113 = v103 + v104[8];
    *(void *)uint64_t v113 = v59;
    *(void *)(v113 + 8) = v60;
    *(void *)(v113 + 16) = v61;
    *(void *)(v113 + 24) = v62;
    *(void *)(v113 + 32) = v63;
    *(void *)(v113 + 40) = v64;
    *(_OWORD *)(v113 + 48) = v65;
    *(void *)(v113 + 64) = v122;
    uint64_t v114 = v119;
    *(void *)(v113 + 72) = v121;
    *(void *)(v113 + 80) = v114;
    sub_25509F608(v135, v103 + v104[9], type metadata accessor for BloomFilterData);
    char v115 = *(void (**)(uint64_t, char *, uint64_t))(v125 + 32);
    uint64_t v116 = v123;
    v115(v103 + v104[10], v131, v123);
    v115(v103 + v104[11], v130, v116);
    v115(v103 + v104[12], v129, v116);
    v115(v103 + v104[13], v128, v116);
    return ((uint64_t (*)(uint64_t, char *, uint64_t))v115)(v103 + v104[14], v127, v116);
  }
LABEL_38:
  uint64_t result = sub_2550D9FD0();
  __break(1u);
  return result;
}

uint64_t BlackPearlTrialLevels.getBlackPearlLevels()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for BlackPearlTrialLevels() + 20);

  return sub_2550A2780(v3, a1);
}

uint64_t type metadata accessor for BlackPearlTrialLevels()
{
  uint64_t result = qword_26B279568;
  if (!qword_26B279568) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void static BlackPearlTrialLevels.buildVersion(trialClient:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (void *)sub_2550D9AA0();
  id v5 = objc_msgSend(a1, sel_experimentIdentifiersWithNamespaceName_, v4);

  uint64_t v6 = (void *)sub_2550D9AA0();
  id v83 = objc_msgSend(a1, sel_rolloutIdentifiersWithNamespaceName_, v6);

  uint64_t v7 = (void *)sub_2550D9AA0();
  uint64_t v8 = (void *)sub_2550D9AA0();
  id v9 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v7, v8);

  if (!v9 || (id v10 = objc_msgSend(v9, sel_stringValue), v9, !v10))
  {
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v57 = sub_2550D9A00();
    __swift_project_value_buffer(v57, (uint64_t)qword_26B279BA0);
    unint64_t v58 = sub_2550D99E0();
    os_log_type_t v59 = sub_2550D9DE0();
    if (!os_log_type_enabled(v58, v59)) {
      goto LABEL_44;
    }
    uint64_t v60 = "Model version not found";
    goto LABEL_43;
  }
  uint64_t v81 = sub_2550D9AD0();
  uint64_t v82 = v11;

  uint64_t v12 = (void *)sub_2550D9AA0();
  uint64_t v13 = (void *)sub_2550D9AA0();
  id v14 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v12, v13);

  if (!v14 || (id v15 = objc_msgSend(v14, sel_stringValue), v14, !v15))
  {
    swift_bridgeObjectRelease();
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v61 = sub_2550D9A00();
    __swift_project_value_buffer(v61, (uint64_t)qword_26B279BA0);
    unint64_t v58 = sub_2550D99E0();
    os_log_type_t v59 = sub_2550D9DE0();
    if (!os_log_type_enabled(v58, v59)) {
      goto LABEL_44;
    }
    uint64_t v60 = "Sender Model Version not found";
    goto LABEL_43;
  }
  uint64_t v79 = sub_2550D9AD0();
  uint64_t v80 = v16;

  uint64_t v17 = (void *)sub_2550D9AA0();
  uint64_t v18 = (void *)sub_2550D9AA0();
  id v19 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v17, v18);

  if (!v19 || (id v20 = objc_msgSend(v19, sel_stringValue), v19, !v20))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v62 = sub_2550D9A00();
    __swift_project_value_buffer(v62, (uint64_t)qword_26B279BA0);
    unint64_t v58 = sub_2550D99E0();
    os_log_type_t v59 = sub_2550D9DE0();
    if (!os_log_type_enabled(v58, v59)) {
      goto LABEL_44;
    }
    uint64_t v60 = "TS Model Version not found";
    goto LABEL_43;
  }
  uint64_t v77 = sub_2550D9AD0();
  uint64_t v78 = v21;

  uint64_t v22 = (void *)sub_2550D9AA0();
  unint64_t v23 = (void *)sub_2550D9AA0();
  id v24 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v22, v23);

  if (!v24 || (id v25 = objc_msgSend(v24, sel_stringValue), v24, !v25))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v63 = sub_2550D9A00();
    __swift_project_value_buffer(v63, (uint64_t)qword_26B279BA0);
    unint64_t v58 = sub_2550D99E0();
    os_log_type_t v59 = sub_2550D9DE0();
    if (!os_log_type_enabled(v58, v59)) {
      goto LABEL_44;
    }
    uint64_t v60 = "Rule Version not found";
    goto LABEL_43;
  }
  uint64_t v75 = sub_2550D9AD0();
  uint64_t v76 = v26;

  id v27 = (void *)sub_2550D9AA0();
  BOOL v28 = (void *)sub_2550D9AA0();
  id v29 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v27, v28);

  if (!v29 || (id v30 = objc_msgSend(v29, sel_stringValue), v29, !v30))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v64 = sub_2550D9A00();
    __swift_project_value_buffer(v64, (uint64_t)qword_26B279BA0);
    unint64_t v58 = sub_2550D99E0();
    os_log_type_t v59 = sub_2550D9DE0();
    if (!os_log_type_enabled(v58, v59)) {
      goto LABEL_44;
    }
    uint64_t v60 = "BreakThrough version not found";
    goto LABEL_43;
  }
  uint64_t v73 = sub_2550D9AD0();
  uint64_t v74 = v31;

  uint64_t v32 = (void *)sub_2550D9AA0();
  unint64_t v33 = (void *)sub_2550D9AA0();
  id v34 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v32, v33);

  if (v34)
  {
    id v35 = objc_msgSend(v34, sel_stringValue);

    if (v35)
    {
      uint64_t v36 = sub_2550D9AD0();
      unint64_t v71 = v37;
      uint64_t v72 = v36;

      id v38 = v83;
      if (v5)
      {
        id v39 = objc_msgSend(v5, sel_experimentId);
        uint64_t v40 = sub_2550D9AD0();
        uint64_t v69 = v41;
        uint64_t v70 = v40;

        id v42 = objc_msgSend(v5, sel_treatmentId);
        uint64_t v68 = sub_2550D9AD0();
        uint64_t v44 = v43;

        uint64_t v45 = (int)objc_msgSend(v5, sel_deploymentId);
        if (v83)
        {
LABEL_15:
          uint64_t v46 = (int)objc_msgSend(v83, sel_deploymentId);
          id v47 = objc_msgSend(v83, sel_factorPackId);
          uint64_t v48 = sub_2550D9AD0();
          uint64_t v50 = v49;

          id v51 = objc_msgSend(v83, sel_rolloutId);
          uint64_t v52 = sub_2550D9AD0();
          uint64_t v54 = v53;

          id v38 = v83;
LABEL_18:
          sub_2550AD440(v72, v71, (uint64_t)&v84);

          uint64_t v55 = v85;
          long long v56 = v84;
          LOBYTE(v84) = v86;
          *(void *)a2 = v81;
          *(void *)(a2 + 8) = v82;
          *(void *)(a2 + 16) = v79;
          *(void *)(a2 + 24) = v80;
          *(void *)(a2 + 32) = v77;
          *(void *)(a2 + 40) = v78;
          *(void *)(a2 + 48) = v75;
          *(void *)(a2 + 56) = v76;
          *(void *)(a2 + 64) = v73;
          *(void *)(a2 + 72) = v74;
          *(void *)(a2 + 80) = v70;
          *(void *)(a2 + 88) = v69;
          *(void *)(a2 + 96) = v68;
          *(void *)(a2 + 104) = v44;
          *(void *)(a2 + 112) = v45;
          *(void *)(a2 + 120) = v46;
          *(void *)(a2 + 128) = v48;
          *(void *)(a2 + 136) = v50;
          *(void *)(a2 + 144) = v52;
          *(void *)(a2 + 152) = v54;
          *(_OWORD *)(a2 + 160) = v56;
          *(void *)(a2 + 176) = v55;
          *(unsigned char *)(a2 + 184) = v84;
          return;
        }
      }
      else
      {
        uint64_t v68 = 0;
        uint64_t v69 = 0;
        uint64_t v44 = 0;
        uint64_t v70 = 0;
        uint64_t v45 = -1;
        if (v83) {
          goto LABEL_15;
        }
      }
      uint64_t v52 = 0;
      uint64_t v54 = 0;
      uint64_t v48 = 0;
      uint64_t v50 = 0;
      uint64_t v46 = -1;
      goto LABEL_18;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_26B278B80 != -1) {
    swift_once();
  }
  uint64_t v65 = sub_2550D9A00();
  __swift_project_value_buffer(v65, (uint64_t)qword_26B279BA0);
  unint64_t v58 = sub_2550D99E0();
  os_log_type_t v59 = sub_2550D9DE0();
  if (os_log_type_enabled(v58, v59))
  {
    uint64_t v60 = "Categorization version not found";
LABEL_43:
    uint64_t v66 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v66 = 0;
    _os_log_impl(&dword_25509D000, v58, v59, v60, v66, 2u);
    MEMORY[0x25A2881E0](v66, -1, -1);
  }
LABEL_44:

  sub_2550A7790();
  swift_allocError();
  unsigned char *v67 = 1;
  swift_willThrow();

  sub_2550D9F60();
  sub_2550D9BA0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E84800);
  sub_2550D9FB0();
  sub_2550D9FD0();
  __break(1u);
}

void static BlackPearlTrialLevels.buildThresholds(trialClient:)(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = (void *)sub_2550D9AA0();
  id v5 = (void *)sub_2550D9AA0();
  id v6 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v4, v5);

  if (!v6)
  {
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v62 = sub_2550D9A00();
    __swift_project_value_buffer(v62, (uint64_t)qword_26B279BA0);
    uint64_t v63 = sub_2550D99E0();
    os_log_type_t v64 = sub_2550D9DE0();
    if (!os_log_type_enabled(v63, v64)) {
      goto LABEL_58;
    }
    uint64_t v65 = "Threshold Commerce not found";
    goto LABEL_57;
  }
  objc_msgSend(v6, sel_doubleValue);
  uint64_t v8 = v7;

  id v9 = (void *)sub_2550D9AA0();
  id v10 = (void *)sub_2550D9AA0();
  id v11 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v9, v10);

  if (!v11)
  {
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v66 = sub_2550D9A00();
    __swift_project_value_buffer(v66, (uint64_t)qword_26B279BA0);
    uint64_t v63 = sub_2550D99E0();
    os_log_type_t v64 = sub_2550D9DE0();
    if (!os_log_type_enabled(v63, v64)) {
      goto LABEL_58;
    }
    uint64_t v65 = "ThresholdEmployeeNews value not found";
    goto LABEL_57;
  }
  objc_msgSend(v11, sel_doubleValue);
  uint64_t v13 = v12;

  id v14 = (void *)sub_2550D9AA0();
  id v15 = (void *)sub_2550D9AA0();
  id v16 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v14, v15);

  if (!v16)
  {
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v67 = sub_2550D9A00();
    __swift_project_value_buffer(v67, (uint64_t)qword_26B279BA0);
    uint64_t v63 = sub_2550D99E0();
    os_log_type_t v64 = sub_2550D9DE0();
    if (!os_log_type_enabled(v63, v64)) {
      goto LABEL_58;
    }
    uint64_t v65 = "ThresholdEmployee value not found";
    goto LABEL_57;
  }
  objc_msgSend(v16, sel_doubleValue);
  uint64_t v18 = v17;

  id v19 = (void *)sub_2550D9AA0();
  id v20 = (void *)sub_2550D9AA0();
  id v21 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v19, v20);

  if (!v21)
  {
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v68 = sub_2550D9A00();
    __swift_project_value_buffer(v68, (uint64_t)qword_26B279BA0);
    uint64_t v63 = sub_2550D99E0();
    os_log_type_t v64 = sub_2550D9DE0();
    if (!os_log_type_enabled(v63, v64)) {
      goto LABEL_58;
    }
    uint64_t v65 = "ThresholdPersonal value not found";
    goto LABEL_57;
  }
  objc_msgSend(v21, sel_doubleValue);
  uint64_t v23 = v22;

  id v24 = (void *)sub_2550D9AA0();
  id v25 = (void *)sub_2550D9AA0();
  id v26 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v24, v25);

  if (!v26)
  {
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v69 = sub_2550D9A00();
    __swift_project_value_buffer(v69, (uint64_t)qword_26B279BA0);
    uint64_t v63 = sub_2550D99E0();
    os_log_type_t v64 = sub_2550D9DE0();
    if (!os_log_type_enabled(v63, v64)) {
      goto LABEL_58;
    }
    uint64_t v65 = "ThresholdP2C values ";
    goto LABEL_57;
  }
  objc_msgSend(v26, sel_doubleValue);
  uint64_t v28 = v27;

  id v29 = (void *)sub_2550D9AA0();
  id v30 = (void *)sub_2550D9AA0();
  id v31 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v29, v30);

  if (!v31)
  {
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v70 = sub_2550D9A00();
    __swift_project_value_buffer(v70, (uint64_t)qword_26B279BA0);
    uint64_t v63 = sub_2550D99E0();
    os_log_type_t v64 = sub_2550D9DE0();
    if (!os_log_type_enabled(v63, v64)) {
      goto LABEL_58;
    }
    uint64_t v65 = "ThresholdCorpEmployee not found";
    goto LABEL_57;
  }
  objc_msgSend(v31, sel_doubleValue);
  uint64_t v33 = v32;

  id v34 = (void *)sub_2550D9AA0();
  id v35 = (void *)sub_2550D9AA0();
  id v36 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v34, v35);

  if (!v36)
  {
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v71 = sub_2550D9A00();
    __swift_project_value_buffer(v71, (uint64_t)qword_26B279BA0);
    uint64_t v63 = sub_2550D99E0();
    os_log_type_t v64 = sub_2550D9DE0();
    if (!os_log_type_enabled(v63, v64)) {
      goto LABEL_58;
    }
    uint64_t v65 = "Threshold Sender is not found";
    goto LABEL_57;
  }
  uint64_t v78 = v33;
  uint64_t v37 = v28;
  uint64_t v38 = v23;
  uint64_t v39 = v18;
  uint64_t v40 = v13;
  objc_msgSend(v36, sel_doubleValue);
  uint64_t v42 = v41;

  uint64_t v43 = (void *)sub_2550D9AA0();
  uint64_t v44 = (void *)sub_2550D9AA0();
  id v45 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v43, v44);

  if (!v45)
  {
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v72 = sub_2550D9A00();
    __swift_project_value_buffer(v72, (uint64_t)qword_26B279BA0);
    uint64_t v63 = sub_2550D99E0();
    os_log_type_t v64 = sub_2550D9DE0();
    if (!os_log_type_enabled(v63, v64)) {
      goto LABEL_58;
    }
    uint64_t v65 = "Threshold TS is not found";
    goto LABEL_57;
  }
  uint64_t v46 = v8;
  objc_msgSend(v45, sel_doubleValue);
  uint64_t v48 = v47;

  uint64_t v49 = (void *)sub_2550D9AA0();
  uint64_t v50 = (void *)sub_2550D9AA0();
  id v51 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v49, v50);

  if (!v51)
  {
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v73 = sub_2550D9A00();
    __swift_project_value_buffer(v73, (uint64_t)qword_26B279BA0);
    uint64_t v63 = sub_2550D99E0();
    os_log_type_t v64 = sub_2550D9DE0();
    if (!os_log_type_enabled(v63, v64)) {
      goto LABEL_58;
    }
    uint64_t v65 = "Threshold Category TS is not found";
    goto LABEL_57;
  }
  objc_msgSend(v51, sel_doubleValue);
  uint64_t v53 = v52;

  uint64_t v54 = (void *)sub_2550D9AA0();
  uint64_t v55 = (void *)sub_2550D9AA0();
  id v56 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v54, v55);

  if (!v56)
  {
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v74 = sub_2550D9A00();
    __swift_project_value_buffer(v74, (uint64_t)qword_26B279BA0);
    uint64_t v63 = sub_2550D99E0();
    os_log_type_t v64 = sub_2550D9DE0();
    if (!os_log_type_enabled(v63, v64)) {
      goto LABEL_58;
    }
    uint64_t v65 = "Sender Max Tokens is not found";
    goto LABEL_57;
  }
  id v57 = objc_msgSend(v56, sel_longValue);

  unint64_t v58 = (void *)sub_2550D9AA0();
  os_log_type_t v59 = (void *)sub_2550D9AA0();
  id v60 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v58, v59);

  if (v60)
  {
    id v61 = objc_msgSend(v60, sel_longValue);

    *a2 = v46;
    a2[1] = v40;
    a2[2] = v39;
    a2[3] = v38;
    a2[4] = v37;
    a2[5] = v42;
    a2[6] = v48;
    a2[7] = v53;
    a2[8] = v78;
    a2[9] = v57;
    a2[10] = v61;
    return;
  }
  if (qword_26B278B80 != -1) {
    swift_once();
  }
  uint64_t v75 = sub_2550D9A00();
  __swift_project_value_buffer(v75, (uint64_t)qword_26B279BA0);
  uint64_t v63 = sub_2550D99E0();
  os_log_type_t v64 = sub_2550D9DE0();
  if (os_log_type_enabled(v63, v64))
  {
    uint64_t v65 = "Subject Max Tokens is not found";
LABEL_57:
    uint64_t v76 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v76 = 0;
    _os_log_impl(&dword_25509D000, v63, v64, v65, v76, 2u);
    MEMORY[0x25A2881E0](v76, -1, -1);
  }
LABEL_58:

  sub_2550A7790();
  swift_allocError();
  unsigned char *v77 = 1;
  swift_willThrow();
  sub_2550D9F60();
  sub_2550D9BA0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E84800);
  sub_2550D9FB0();
  sub_2550D9FD0();
  __break(1u);
}

uint64_t static BlackPearlTrialLevels.buildBloomFilters(trialClient:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_2550D97D0();
  uint64_t v47 = *(void *)(v4 - 8);
  uint64_t v48 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  uint64_t v49 = (char *)&v46 - v8;
  id v9 = (void *)sub_2550D9AA0();
  id v10 = (void *)sub_2550D9AA0();
  id v11 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v9, v10);

  if (!v11) {
    goto LABEL_14;
  }
  id v12 = objc_msgSend(v11, sel_fileValue);

  if (!v12)
  {
    __break(1u);
    goto LABEL_12;
  }
  id v13 = objc_msgSend(v12, sel_path);

  if (!v13)
  {
LABEL_14:
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v28 = sub_2550D9A00();
    __swift_project_value_buffer(v28, (uint64_t)qword_26B279BA0);
    id v29 = sub_2550D99E0();
    os_log_type_t v30 = sub_2550D9DE0();
    if (os_log_type_enabled(v29, v30))
    {
      id v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v31 = 0;
      _os_log_impl(&dword_25509D000, v29, v30, "Commerce Bloom filter file is missing", v31, 2u);
      MEMORY[0x25A2881E0](v31, -1, -1);
    }

    sub_2550A7790();
    uint64_t v32 = swift_allocError();
    unsigned char *v33 = 1;
    swift_willThrow();
    goto LABEL_29;
  }
  sub_2550D9AD0();

  sub_2550D9720();
  swift_bridgeObjectRelease();
  id v14 = (void *)sub_2550D9AA0();
  id v15 = (void *)sub_2550D9AA0();
  id v16 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v14, v15);

  if (!v16)
  {
LABEL_19:
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v34 = sub_2550D9A00();
    __swift_project_value_buffer(v34, (uint64_t)qword_26B279BA0);
    id v35 = sub_2550D99E0();
    os_log_type_t v36 = sub_2550D9DE0();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_25509D000, v35, v36, "Guaranteed list file is missing", v37, 2u);
      MEMORY[0x25A2881E0](v37, -1, -1);
    }

    sub_2550A7790();
    uint64_t v32 = swift_allocError();
    *uint64_t v38 = 1;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v47 + 8))(v49, v48);
    goto LABEL_29;
  }
  id v17 = objc_msgSend(v16, sel_fileValue);

  if (!v17)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  id v18 = objc_msgSend(v17, sel_path);

  if (!v18) {
    goto LABEL_19;
  }
  sub_2550D9AD0();

  sub_2550D9720();
  swift_bridgeObjectRelease();
  id v19 = (void *)sub_2550D9AA0();
  id v20 = (void *)sub_2550D9AA0();
  id v21 = objc_msgSend(a1, sel_levelForFactor_withNamespaceName_, v19, v20);

  if (v21)
  {
    id v22 = objc_msgSend(v21, sel_fileValue);

    if (v22)
    {
      id v23 = objc_msgSend(v22, sel_path);

      if (v23)
      {
        sub_2550D9AD0();

        uint64_t v24 = type metadata accessor for BloomFilterData(0);
        sub_2550D9720();
        swift_bridgeObjectRelease();
        uint64_t v25 = v48;
        id v26 = *(void (**)(uint64_t, char *, uint64_t))(v47 + 32);
        v26(a2, v49, v48);
        return ((uint64_t (*)(uint64_t, char *, uint64_t))v26)(a2 + *(int *)(v24 + 20), v7, v25);
      }
      goto LABEL_24;
    }
    goto LABEL_13;
  }
LABEL_24:
  if (qword_26B278B80 != -1) {
    swift_once();
  }
  uint64_t v39 = sub_2550D9A00();
  __swift_project_value_buffer(v39, (uint64_t)qword_26B279BA0);
  uint64_t v40 = sub_2550D99E0();
  os_log_type_t v41 = sub_2550D9DE0();
  if (os_log_type_enabled(v40, v41))
  {
    uint64_t v42 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v42 = 0;
    _os_log_impl(&dword_25509D000, v40, v41, "NER bloom filer file path not found", v42, 2u);
    MEMORY[0x25A2881E0](v42, -1, -1);
  }

  sub_2550A7790();
  uint64_t v32 = swift_allocError();
  *uint64_t v43 = 1;
  swift_willThrow();
  uint64_t v44 = v48;
  id v45 = *(void (**)(char *, uint64_t))(v47 + 8);
  v45(v7, v48);
  v45(v49, v44);
LABEL_29:
  uint64_t v51 = 0;
  unint64_t v52 = 0xE000000000000000;
  sub_2550D9F60();
  sub_2550D9BA0();
  uint64_t v50 = v32;
  __swift_instantiateConcreteTypeFromMangledName(&qword_269E84800);
  sub_2550D9FB0();
  uint64_t result = sub_2550D9FD0();
  __break(1u);
  return result;
}

void __swiftcall BlackPearlTrialLevels.getThresholds()(MCCKitCategorization::BlackPearlThreshold *__return_ptr retstr)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for BlackPearlTrialLevels() + 20);
  uint64_t v4 = v3 + *(int *)(type metadata accessor for BlackPearlLevels() + 32);
  Swift::Double v5 = *(double *)(v4 + 64);
  long long v6 = *(_OWORD *)(v4 + 16);
  *(_OWORD *)&retstr->thresholdCommerce = *(_OWORD *)v4;
  *(_OWORD *)&retstr->thresholdEmployee = v6;
  long long v7 = *(_OWORD *)(v4 + 48);
  *(_OWORD *)&retstr->thresholdP2C = *(_OWORD *)(v4 + 32);
  *(_OWORD *)&retstr->thresholdTS = v7;
  retstr->thresholdCorpEmployee = v5;
  *(_OWORD *)&retstr->tsSenderMaxTokens = *(_OWORD *)(v4 + 72);
}

uint64_t *initializeBufferWithCopyOfBuffer for BlackPearlTrialLevels(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    os_log_type_t v64 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(int *)(a3 + 20);
    long long v7 = (uint64_t *)((char *)a1 + v6);
    uint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = *(uint64_t *)((char *)a2 + v6 + 8);
    *long long v7 = *(uint64_t *)((char *)a2 + v6);
    v7[1] = v9;
    uint64_t v10 = *(uint64_t *)((char *)a2 + v6 + 24);
    v7[2] = *(uint64_t *)((char *)a2 + v6 + 16);
    v7[3] = v10;
    id v11 = (int *)type metadata accessor for BlackPearlModel(0);
    uint64_t v12 = v11[6];
    uint64_t v69 = (char *)v7 + v12;
    id v13 = &v8[v12];
    uint64_t v67 = a1;
    uint64_t v14 = sub_2550D97D0();
    id v15 = *(void (**)(void, void, void))(*(void *)(v14 - 8) + 16);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v68 = (void (*)(char *, char *, uint64_t))v15;
    v15(v69, v13, v14);
    v15((char *)v7 + v11[7], &v8[v11[7]], v14);
    uint64_t v16 = v11[8];
    id v17 = *(void **)&v8[v16];
    *(void *)((char *)v7 + v16) = v17;
    uint64_t v70 = (int *)type metadata accessor for BlackPearlLevels();
    uint64_t v18 = v70[5];
    id v19 = (void *)((char *)v7 + v18);
    id v20 = &v8[v18];
    uint64_t v21 = *(void *)&v8[v18 + 8];
    *id v19 = *(void *)&v8[v18];
    v19[1] = v21;
    uint64_t v22 = *(void *)&v8[v18 + 24];
    v19[2] = *(void *)&v8[v18 + 16];
    v19[3] = v22;
    uint64_t v23 = v11[6];
    uint64_t v66 = (char *)v19 + v23;
    uint64_t v24 = &v20[v23];
    id v25 = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v68(v66, v24, v14);
    v68((char *)v19 + v11[7], &v20[v11[7]], v14);
    uint64_t v26 = v11[8];
    uint64_t v27 = *(void **)&v20[v26];
    *(void *)((char *)v19 + v26) = v27;
    uint64_t v28 = v70[6];
    id v29 = (void *)((char *)v7 + v28);
    os_log_type_t v30 = &v8[v28];
    uint64_t v31 = *(void *)&v8[v28 + 8];
    *id v29 = *(void *)&v8[v28];
    v29[1] = v31;
    uint64_t v32 = *(void *)&v8[v28 + 24];
    _OWORD v29[2] = *(void *)&v8[v28 + 16];
    v29[3] = v32;
    uint64_t v33 = v11[6];
    uint64_t v34 = (char *)v29 + v33;
    id v35 = &v30[v33];
    id v36 = v27;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v68(v34, v35, v14);
    v68((char *)v29 + v11[7], &v30[v11[7]], v14);
    uint64_t v37 = v11[8];
    uint64_t v38 = *(void **)&v30[v37];
    *(void *)((char *)v29 + v37) = v38;
    uint64_t v39 = v70[7];
    uint64_t v40 = (char *)v7 + v39;
    os_log_type_t v41 = &v8[v39];
    uint64_t v42 = *((void *)v41 + 1);
    *(void *)uint64_t v40 = *(void *)v41;
    *((void *)v40 + 1) = v42;
    uint64_t v43 = *((void *)v41 + 3);
    *((void *)v40 + 2) = *((void *)v41 + 2);
    *((void *)v40 + 3) = v43;
    uint64_t v44 = *((void *)v41 + 5);
    *((void *)v40 + 4) = *((void *)v41 + 4);
    *((void *)v40 + 5) = v44;
    uint64_t v45 = *((void *)v41 + 7);
    *((void *)v40 + 6) = *((void *)v41 + 6);
    *((void *)v40 + 7) = v45;
    uint64_t v46 = *((void *)v41 + 9);
    *((void *)v40 + 8) = *((void *)v41 + 8);
    *((void *)v40 + 9) = v46;
    uint64_t v47 = *((void *)v41 + 11);
    *((void *)v40 + 10) = *((void *)v41 + 10);
    *((void *)v40 + 11) = v47;
    uint64_t v48 = *((void *)v41 + 13);
    *((void *)v40 + 12) = *((void *)v41 + 12);
    *((void *)v40 + 13) = v48;
    *((_OWORD *)v40 + 7) = *((_OWORD *)v41 + 7);
    uint64_t v49 = *((void *)v41 + 17);
    *((void *)v40 + 16) = *((void *)v41 + 16);
    *((void *)v40 + 17) = v49;
    uint64_t v50 = *((void *)v41 + 19);
    *((void *)v40 + 18) = *((void *)v41 + 18);
    *((void *)v40 + 19) = v50;
    long long v51 = *((_OWORD *)v41 + 10);
    *(_OWORD *)(v40 + 169) = *(_OWORD *)(v41 + 169);
    *((_OWORD *)v40 + 10) = v51;
    uint64_t v52 = v70[8];
    uint64_t v53 = (char *)v7 + v52;
    uint64_t v54 = &v8[v52];
    long long v55 = *((_OWORD *)v54 + 3);
    *((_OWORD *)v53 + 2) = *((_OWORD *)v54 + 2);
    *((_OWORD *)v53 + 3) = v55;
    *((_OWORD *)v53 + 4) = *((_OWORD *)v54 + 4);
    *((void *)v53 + 10) = *((void *)v54 + 10);
    long long v56 = *((_OWORD *)v54 + 1);
    *(_OWORD *)uint64_t v53 = *(_OWORD *)v54;
    *((_OWORD *)v53 + 1) = v56;
    uint64_t v57 = v70[9];
    unint64_t v58 = (char *)v7 + v57;
    os_log_type_t v59 = &v8[v57];
    id v60 = v38;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v68(v58, v59, v14);
    uint64_t v61 = type metadata accessor for BloomFilterData(0);
    v68(&v58[*(int *)(v61 + 20)], &v59[*(int *)(v61 + 20)], v14);
    v68(&v58[*(int *)(v61 + 24)], &v59[*(int *)(v61 + 24)], v14);
    uint64_t v62 = v70;
    v68((char *)v7 + v70[10], &v8[v70[10]], v14);
    v68((char *)v7 + v62[11], &v8[v62[11]], v14);
    v68((char *)v7 + v62[12], &v8[v62[12]], v14);
    v68((char *)v7 + v62[13], &v8[v62[13]], v14);
    v68((char *)v7 + v62[14], &v8[v62[14]], v14);
    uint64_t v63 = v14;
    os_log_type_t v64 = v67;
    v68((char *)v7 + v62[15], &v8[v62[15]], v63);
  }
  return v64;
}

uint64_t destroy for BlackPearlTrialLevels(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  Swift::Double v5 = (int *)type metadata accessor for BlackPearlModel(0);
  uint64_t v6 = v4 + v5[6];
  uint64_t v7 = sub_2550D97D0();
  id v15 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v15)((void *)(v7 - 8), v6, v7);
  v15(v4 + v5[7], v7);

  uint64_t v8 = (int *)type metadata accessor for BlackPearlLevels();
  uint64_t v9 = v4 + v8[5];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v15(v9 + v5[6], v7);
  v15(v9 + v5[7], v7);

  uint64_t v10 = v4 + v8[6];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v15(v10 + v5[6], v7);
  v15(v10 + v5[7], v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = v4 + v8[9];
  v15(v11, v7);
  uint64_t v12 = type metadata accessor for BloomFilterData(0);
  v15(v11 + *(int *)(v12 + 20), v7);
  v15(v11 + *(int *)(v12 + 24), v7);
  v15(v4 + v8[10], v7);
  v15(v4 + v8[11], v7);
  v15(v4 + v8[12], v7);
  v15(v4 + v8[13], v7);
  v15(v4 + v8[14], v7);
  uint64_t v13 = v4 + v8[15];

  return ((uint64_t (*)(uint64_t, uint64_t))v15)(v13, v7);
}

void *initializeWithCopy for BlackPearlTrialLevels(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v3 = *(int *)(a3 + 20);
  uint64_t v4 = (char *)a1 + v3;
  Swift::Double v5 = (char *)a2 + v3;
  uint64_t v6 = *(void *)((char *)a2 + v3 + 8);
  *(void *)uint64_t v4 = *(void *)((char *)a2 + v3);
  *((void *)v4 + 1) = v6;
  uint64_t v7 = *(void *)((char *)a2 + v3 + 24);
  *((void *)v4 + 2) = *(void *)((char *)a2 + v3 + 16);
  *((void *)v4 + 3) = v7;
  uint64_t v8 = (int *)type metadata accessor for BlackPearlModel(0);
  uint64_t v9 = v8[6];
  uint64_t v63 = &v4[v9];
  uint64_t v10 = &v5[v9];
  uint64_t v11 = sub_2550D97D0();
  uint64_t v62 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v62(v63, v10, v11);
  v62(&v4[v8[7]], &v5[v8[7]], v11);
  uint64_t v12 = v8[8];
  uint64_t v13 = *(void **)&v5[v12];
  *(void *)&v4[v12] = v13;
  os_log_type_t v64 = (int *)type metadata accessor for BlackPearlLevels();
  uint64_t v14 = v64[5];
  id v15 = &v4[v14];
  uint64_t v16 = &v5[v14];
  uint64_t v17 = *(void *)&v5[v14 + 8];
  *(void *)id v15 = *(void *)&v5[v14];
  *((void *)v15 + 1) = v17;
  uint64_t v18 = *(void *)&v5[v14 + 24];
  *((void *)v15 + 2) = *(void *)&v5[v14 + 16];
  *((void *)v15 + 3) = v18;
  uint64_t v19 = v8[6];
  id v60 = &v15[v19];
  id v20 = &v16[v19];
  id v21 = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v62(v60, v20, v11);
  v62(&v15[v8[7]], &v16[v8[7]], v11);
  uint64_t v22 = v8[8];
  uint64_t v23 = *(void **)&v16[v22];
  *(void *)&v15[v22] = v23;
  uint64_t v24 = v64[6];
  id v25 = &v4[v24];
  uint64_t v26 = &v5[v24];
  uint64_t v27 = *(void *)&v5[v24 + 8];
  *(void *)id v25 = *(void *)&v5[v24];
  *((void *)v25 + 1) = v27;
  uint64_t v28 = *(void *)&v5[v24 + 24];
  *((void *)v25 + 2) = *(void *)&v5[v24 + 16];
  *((void *)v25 + 3) = v28;
  uint64_t v29 = v8[6];
  os_log_type_t v30 = &v25[v29];
  uint64_t v31 = &v26[v29];
  id v32 = v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v62(v30, v31, v11);
  v62(&v25[v8[7]], &v26[v8[7]], v11);
  uint64_t v33 = v8[8];
  uint64_t v34 = *(void **)&v26[v33];
  *(void *)&v25[v33] = v34;
  uint64_t v35 = v64[7];
  id v36 = &v4[v35];
  uint64_t v37 = &v5[v35];
  uint64_t v38 = *((void *)v37 + 1);
  *(void *)id v36 = *(void *)v37;
  *((void *)v36 + 1) = v38;
  uint64_t v39 = *((void *)v37 + 3);
  *((void *)v36 + 2) = *((void *)v37 + 2);
  *((void *)v36 + 3) = v39;
  uint64_t v40 = *((void *)v37 + 5);
  *((void *)v36 + 4) = *((void *)v37 + 4);
  *((void *)v36 + 5) = v40;
  uint64_t v41 = *((void *)v37 + 7);
  *((void *)v36 + 6) = *((void *)v37 + 6);
  *((void *)v36 + 7) = v41;
  uint64_t v42 = *((void *)v37 + 9);
  *((void *)v36 + 8) = *((void *)v37 + 8);
  *((void *)v36 + 9) = v42;
  uint64_t v43 = *((void *)v37 + 11);
  *((void *)v36 + 10) = *((void *)v37 + 10);
  *((void *)v36 + 11) = v43;
  uint64_t v44 = *((void *)v37 + 13);
  *((void *)v36 + 12) = *((void *)v37 + 12);
  *((void *)v36 + 13) = v44;
  *((_OWORD *)v36 + 7) = *((_OWORD *)v37 + 7);
  uint64_t v45 = *((void *)v37 + 17);
  *((void *)v36 + 16) = *((void *)v37 + 16);
  *((void *)v36 + 17) = v45;
  uint64_t v46 = *((void *)v37 + 19);
  *((void *)v36 + 18) = *((void *)v37 + 18);
  *((void *)v36 + 19) = v46;
  long long v47 = *((_OWORD *)v37 + 10);
  *(_OWORD *)(v36 + 169) = *(_OWORD *)(v37 + 169);
  *((_OWORD *)v36 + 10) = v47;
  uint64_t v48 = v64[8];
  uint64_t v49 = &v4[v48];
  uint64_t v50 = &v5[v48];
  long long v51 = *((_OWORD *)v50 + 3);
  *((_OWORD *)v49 + 2) = *((_OWORD *)v50 + 2);
  *((_OWORD *)v49 + 3) = v51;
  *((_OWORD *)v49 + 4) = *((_OWORD *)v50 + 4);
  *((void *)v49 + 10) = *((void *)v50 + 10);
  long long v52 = *((_OWORD *)v50 + 1);
  *(_OWORD *)uint64_t v49 = *(_OWORD *)v50;
  *((_OWORD *)v49 + 1) = v52;
  uint64_t v53 = v64[9];
  uint64_t v54 = &v4[v53];
  long long v55 = &v5[v53];
  id v56 = v34;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v62(v54, v55, v11);
  uint64_t v57 = type metadata accessor for BloomFilterData(0);
  v62(&v54[*(int *)(v57 + 20)], &v55[*(int *)(v57 + 20)], v11);
  v62(&v54[*(int *)(v57 + 24)], &v55[*(int *)(v57 + 24)], v11);
  unint64_t v58 = v64;
  v62(&v4[v64[10]], &v5[v64[10]], v11);
  v62(&v4[v58[11]], &v5[v58[11]], v11);
  v62(&v4[v58[12]], &v5[v58[12]], v11);
  v62(&v4[v58[13]], &v5[v58[13]], v11);
  v62(&v4[v58[14]], &v5[v58[14]], v11);
  v62(&v4[v58[15]], &v5[v58[15]], v11);
  return a1;
}

void *assignWithCopy for BlackPearlTrialLevels(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  *(void *)uint64_t v7 = *(void *)((char *)a2 + v6);
  *((void *)v7 + 1) = *(void *)((char *)a2 + v6 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v7 + 2) = *((void *)v8 + 2);
  *((void *)v7 + 3) = *((void *)v8 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v9 = (int *)type metadata accessor for BlackPearlModel(0);
  uint64_t v10 = v9[6];
  uint64_t v11 = &v7[v10];
  uint64_t v12 = &v8[v10];
  uint64_t v13 = sub_2550D97D0();
  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24);
  v14(v11, v12, v13);
  v14(&v7[v9[7]], &v8[v9[7]], v13);
  uint64_t v15 = v9[8];
  uint64_t v16 = *(void **)&v7[v15];
  uint64_t v17 = *(void **)&v8[v15];
  *(void *)&v7[v15] = v17;
  id v18 = v17;

  uint64_t v19 = (int *)type metadata accessor for BlackPearlLevels();
  uint64_t v20 = v19[5];
  id v21 = &v7[v20];
  uint64_t v22 = &v8[v20];
  *(void *)id v21 = *(void *)&v8[v20];
  *((void *)v21 + 1) = *(void *)&v8[v20 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v21 + 2) = *((void *)v22 + 2);
  *((void *)v21 + 3) = *((void *)v22 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14(&v21[v9[6]], &v22[v9[6]], v13);
  v14(&v21[v9[7]], &v22[v9[7]], v13);
  uint64_t v23 = v9[8];
  uint64_t v24 = *(void **)&v21[v23];
  id v25 = *(void **)&v22[v23];
  *(void *)&v21[v23] = v25;
  id v26 = v25;

  uint64_t v27 = v19[6];
  uint64_t v28 = &v7[v27];
  uint64_t v29 = &v8[v27];
  *(void *)uint64_t v28 = *(void *)&v8[v27];
  *((void *)v28 + 1) = *(void *)&v8[v27 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v28 + 2) = *((void *)v29 + 2);
  *((void *)v28 + 3) = *((void *)v29 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14(&v28[v9[6]], &v29[v9[6]], v13);
  v14(&v28[v9[7]], &v29[v9[7]], v13);
  uint64_t v30 = v9[8];
  uint64_t v31 = *(void **)&v28[v30];
  id v32 = *(void **)&v29[v30];
  *(void *)&v28[v30] = v32;
  id v33 = v32;

  uint64_t v34 = v19[7];
  uint64_t v35 = &v7[v34];
  id v36 = &v8[v34];
  *(void *)uint64_t v35 = *(void *)&v8[v34];
  *((void *)v35 + 1) = *(void *)&v8[v34 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v35 + 2) = *((void *)v36 + 2);
  *((void *)v35 + 3) = *((void *)v36 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v35 + 4) = *((void *)v36 + 4);
  *((void *)v35 + 5) = *((void *)v36 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v35 + 6) = *((void *)v36 + 6);
  *((void *)v35 + 7) = *((void *)v36 + 7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v35 + 8) = *((void *)v36 + 8);
  *((void *)v35 + 9) = *((void *)v36 + 9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v35 + 10) = *((void *)v36 + 10);
  *((void *)v35 + 11) = *((void *)v36 + 11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v35 + 12) = *((void *)v36 + 12);
  *((void *)v35 + 13) = *((void *)v36 + 13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v35 + 14) = *((void *)v36 + 14);
  *((void *)v35 + 15) = *((void *)v36 + 15);
  *((void *)v35 + 16) = *((void *)v36 + 16);
  *((void *)v35 + 17) = *((void *)v36 + 17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((void *)v35 + 18) = *((void *)v36 + 18);
  *((void *)v35 + 19) = *((void *)v36 + 19);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  long long v37 = *((_OWORD *)v36 + 10);
  *(_OWORD *)(v35 + 169) = *(_OWORD *)(v36 + 169);
  *((_OWORD *)v35 + 10) = v37;
  uint64_t v38 = v19[8];
  uint64_t v39 = &v7[v38];
  uint64_t v40 = &v8[v38];
  *(void *)uint64_t v39 = *(void *)v40;
  *((void *)v39 + 1) = *((void *)v40 + 1);
  *((void *)v39 + 2) = *((void *)v40 + 2);
  *((void *)v39 + 3) = *((void *)v40 + 3);
  *((void *)v39 + 4) = *((void *)v40 + 4);
  *((void *)v39 + 5) = *((void *)v40 + 5);
  *((void *)v39 + 6) = *((void *)v40 + 6);
  *((void *)v39 + 7) = *((void *)v40 + 7);
  *((void *)v39 + 8) = *((void *)v40 + 8);
  *((void *)v39 + 9) = *((void *)v40 + 9);
  *((void *)v39 + 10) = *((void *)v40 + 10);
  uint64_t v41 = v19[9];
  uint64_t v42 = &v7[v41];
  uint64_t v43 = &v8[v41];
  v14(&v7[v41], &v8[v41], v13);
  uint64_t v44 = type metadata accessor for BloomFilterData(0);
  v14(&v42[*(int *)(v44 + 20)], &v43[*(int *)(v44 + 20)], v13);
  v14(&v42[*(int *)(v44 + 24)], &v43[*(int *)(v44 + 24)], v13);
  v14(&v7[v19[10]], &v8[v19[10]], v13);
  v14(&v7[v19[11]], &v8[v19[11]], v13);
  v14(&v7[v19[12]], &v8[v19[12]], v13);
  v14(&v7[v19[13]], &v8[v19[13]], v13);
  v14(&v7[v19[14]], &v8[v19[14]], v13);
  v14(&v7[v19[15]], &v8[v19[15]], v13);
  return a1;
}

void *initializeWithTake for BlackPearlTrialLevels(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  Swift::Double v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  long long v7 = *(_OWORD *)((char *)a2 + v4 + 16);
  *(_OWORD *)Swift::Double v5 = *(_OWORD *)((char *)a2 + v4);
  *((_OWORD *)v5 + 1) = v7;
  uint64_t v8 = (int *)type metadata accessor for BlackPearlModel(0);
  uint64_t v9 = v8[6];
  uint64_t v10 = &v5[v9];
  uint64_t v11 = &v6[v9];
  uint64_t v12 = sub_2550D97D0();
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32);
  v13(v10, v11, v12);
  v13(&v5[v8[7]], &v6[v8[7]], v12);
  *(void *)&v5[v8[8]] = *(void *)&v6[v8[8]];
  uint64_t v14 = (int *)type metadata accessor for BlackPearlLevels();
  uint64_t v15 = v14[5];
  uint64_t v16 = &v5[v15];
  uint64_t v17 = &v6[v15];
  long long v18 = *(_OWORD *)&v6[v15 + 16];
  *(_OWORD *)uint64_t v16 = *(_OWORD *)&v6[v15];
  *((_OWORD *)v16 + 1) = v18;
  v13(&v5[v15 + v8[6]], &v6[v15 + v8[6]], v12);
  v13(&v16[v8[7]], &v17[v8[7]], v12);
  *(void *)&v16[v8[8]] = *(void *)&v17[v8[8]];
  uint64_t v19 = v14[6];
  uint64_t v20 = &v5[v19];
  id v21 = &v6[v19];
  long long v22 = *(_OWORD *)&v6[v19 + 16];
  *(_OWORD *)uint64_t v20 = *(_OWORD *)&v6[v19];
  *((_OWORD *)v20 + 1) = v22;
  v13(&v5[v19 + v8[6]], &v6[v19 + v8[6]], v12);
  v13(&v20[v8[7]], &v21[v8[7]], v12);
  *(void *)&v20[v8[8]] = *(void *)&v21[v8[8]];
  uint64_t v23 = v14[7];
  uint64_t v24 = &v5[v23];
  id v25 = &v6[v23];
  long long v26 = *((_OWORD *)v25 + 1);
  *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
  *((_OWORD *)v24 + 1) = v26;
  long long v27 = *((_OWORD *)v25 + 3);
  *((_OWORD *)v24 + 2) = *((_OWORD *)v25 + 2);
  *((_OWORD *)v24 + 3) = v27;
  long long v28 = *((_OWORD *)v25 + 7);
  *((_OWORD *)v24 + 6) = *((_OWORD *)v25 + 6);
  *((_OWORD *)v24 + 7) = v28;
  long long v29 = *((_OWORD *)v25 + 5);
  *((_OWORD *)v24 + 4) = *((_OWORD *)v25 + 4);
  *((_OWORD *)v24 + 5) = v29;
  *(_OWORD *)(v24 + 169) = *(_OWORD *)(v25 + 169);
  long long v30 = *((_OWORD *)v25 + 10);
  long long v31 = *((_OWORD *)v25 + 8);
  *((_OWORD *)v24 + 9) = *((_OWORD *)v25 + 9);
  *((_OWORD *)v24 + 10) = v30;
  *((_OWORD *)v24 + 8) = v31;
  uint64_t v32 = v14[8];
  id v33 = &v5[v32];
  uint64_t v34 = &v6[v32];
  long long v35 = *((_OWORD *)v34 + 3);
  *((_OWORD *)v33 + 2) = *((_OWORD *)v34 + 2);
  *((_OWORD *)v33 + 3) = v35;
  *((_OWORD *)v33 + 4) = *((_OWORD *)v34 + 4);
  *((void *)v33 + 10) = *((void *)v34 + 10);
  long long v36 = *((_OWORD *)v34 + 1);
  *(_OWORD *)id v33 = *(_OWORD *)v34;
  *((_OWORD *)v33 + 1) = v36;
  uint64_t v37 = v14[9];
  uint64_t v38 = &v5[v37];
  uint64_t v39 = &v6[v37];
  v13(&v5[v37], &v6[v37], v12);
  uint64_t v40 = type metadata accessor for BloomFilterData(0);
  v13(&v38[*(int *)(v40 + 20)], &v39[*(int *)(v40 + 20)], v12);
  v13(&v38[*(int *)(v40 + 24)], &v39[*(int *)(v40 + 24)], v12);
  v13(&v5[v14[10]], &v6[v14[10]], v12);
  v13(&v5[v14[11]], &v6[v14[11]], v12);
  v13(&v5[v14[12]], &v6[v14[12]], v12);
  v13(&v5[v14[13]], &v6[v14[13]], v12);
  v13(&v5[v14[14]], &v6[v14[14]], v12);
  v13(&v5[v14[15]], &v6[v14[15]], v12);
  return a1;
}

void *assignWithTake for BlackPearlTrialLevels(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  uint64_t v6 = *(int *)(a3 + 20);
  long long v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = *(void *)((char *)a2 + v6 + 8);
  *(void *)long long v7 = *(void *)((char *)a2 + v6);
  *((void *)v7 + 1) = v9;
  swift_bridgeObjectRelease();
  uint64_t v10 = *((void *)v8 + 3);
  *((void *)v7 + 2) = *((void *)v8 + 2);
  *((void *)v7 + 3) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = (int *)type metadata accessor for BlackPearlModel(0);
  uint64_t v12 = v11[6];
  uint64_t v13 = &v7[v12];
  uint64_t v14 = &v8[v12];
  uint64_t v15 = sub_2550D97D0();
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 40);
  v16(v13, v14, v15);
  v16(&v7[v11[7]], &v8[v11[7]], v15);
  uint64_t v17 = v11[8];
  long long v18 = *(void **)&v7[v17];
  *(void *)&v7[v17] = *(void *)&v8[v17];

  uint64_t v19 = (int *)type metadata accessor for BlackPearlLevels();
  uint64_t v20 = v19[5];
  id v21 = &v7[v20];
  long long v22 = &v8[v20];
  uint64_t v23 = *(void *)&v8[v20 + 8];
  *(void *)id v21 = *(void *)&v8[v20];
  *((void *)v21 + 1) = v23;
  swift_bridgeObjectRelease();
  uint64_t v24 = *((void *)v22 + 3);
  *((void *)v21 + 2) = *((void *)v22 + 2);
  *((void *)v21 + 3) = v24;
  swift_bridgeObjectRelease();
  v16(&v21[v11[6]], &v22[v11[6]], v15);
  v16(&v21[v11[7]], &v22[v11[7]], v15);
  uint64_t v25 = v11[8];
  long long v26 = *(void **)&v21[v25];
  *(void *)&v21[v25] = *(void *)&v22[v25];

  uint64_t v27 = v19[6];
  long long v28 = &v7[v27];
  long long v29 = &v8[v27];
  uint64_t v30 = *(void *)&v8[v27 + 8];
  *(void *)long long v28 = *(void *)&v8[v27];
  *((void *)v28 + 1) = v30;
  swift_bridgeObjectRelease();
  uint64_t v31 = *((void *)v29 + 3);
  *((void *)v28 + 2) = *((void *)v29 + 2);
  *((void *)v28 + 3) = v31;
  swift_bridgeObjectRelease();
  v16(&v28[v11[6]], &v29[v11[6]], v15);
  v16(&v28[v11[7]], &v29[v11[7]], v15);
  uint64_t v32 = v11[8];
  id v33 = *(void **)&v28[v32];
  *(void *)&v28[v32] = *(void *)&v29[v32];

  uint64_t v34 = v19[7];
  long long v35 = &v7[v34];
  long long v36 = &v8[v34];
  uint64_t v37 = *(void *)&v8[v34 + 8];
  *(void *)long long v35 = *(void *)&v8[v34];
  *((void *)v35 + 1) = v37;
  swift_bridgeObjectRelease();
  uint64_t v38 = *((void *)v36 + 3);
  *((void *)v35 + 2) = *((void *)v36 + 2);
  *((void *)v35 + 3) = v38;
  swift_bridgeObjectRelease();
  uint64_t v39 = *((void *)v36 + 5);
  *((void *)v35 + 4) = *((void *)v36 + 4);
  *((void *)v35 + 5) = v39;
  swift_bridgeObjectRelease();
  uint64_t v40 = *((void *)v36 + 7);
  *((void *)v35 + 6) = *((void *)v36 + 6);
  *((void *)v35 + 7) = v40;
  swift_bridgeObjectRelease();
  uint64_t v41 = *((void *)v36 + 9);
  *((void *)v35 + 8) = *((void *)v36 + 8);
  *((void *)v35 + 9) = v41;
  swift_bridgeObjectRelease();
  uint64_t v42 = *((void *)v36 + 11);
  *((void *)v35 + 10) = *((void *)v36 + 10);
  *((void *)v35 + 11) = v42;
  swift_bridgeObjectRelease();
  uint64_t v43 = *((void *)v36 + 13);
  *((void *)v35 + 12) = *((void *)v36 + 12);
  *((void *)v35 + 13) = v43;
  swift_bridgeObjectRelease();
  *((_OWORD *)v35 + 7) = *((_OWORD *)v36 + 7);
  uint64_t v44 = *((void *)v36 + 17);
  *((void *)v35 + 16) = *((void *)v36 + 16);
  *((void *)v35 + 17) = v44;
  swift_bridgeObjectRelease();
  uint64_t v45 = *((void *)v36 + 19);
  *((void *)v35 + 18) = *((void *)v36 + 18);
  *((void *)v35 + 19) = v45;
  swift_bridgeObjectRelease();
  *((_OWORD *)v35 + 10) = *((_OWORD *)v36 + 10);
  *(_OWORD *)(v35 + 169) = *(_OWORD *)(v36 + 169);
  uint64_t v46 = v19[8];
  long long v47 = &v7[v46];
  uint64_t v48 = &v8[v46];
  long long v49 = *((_OWORD *)v48 + 1);
  *(_OWORD *)long long v47 = *(_OWORD *)v48;
  *((_OWORD *)v47 + 1) = v49;
  long long v50 = *((_OWORD *)v48 + 3);
  *((_OWORD *)v47 + 2) = *((_OWORD *)v48 + 2);
  *((_OWORD *)v47 + 3) = v50;
  *((void *)v47 + 8) = *((void *)v48 + 8);
  *(_OWORD *)(v47 + 72) = *(_OWORD *)(v48 + 72);
  uint64_t v51 = v19[9];
  long long v52 = &v7[v51];
  uint64_t v53 = &v8[v51];
  v16(&v7[v51], &v8[v51], v15);
  uint64_t v54 = type metadata accessor for BloomFilterData(0);
  v16(&v52[*(int *)(v54 + 20)], &v53[*(int *)(v54 + 20)], v15);
  v16(&v52[*(int *)(v54 + 24)], &v53[*(int *)(v54 + 24)], v15);
  v16(&v7[v19[10]], &v8[v19[10]], v15);
  v16(&v7[v19[11]], &v8[v19[11]], v15);
  v16(&v7[v19[12]], &v8[v19[12]], v15);
  v16(&v7[v19[13]], &v8[v19[13]], v15);
  v16(&v7[v19[14]], &v8[v19[14]], v15);
  v16(&v7[v19[15]], &v8[v19[15]], v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for BlackPearlTrialLevels(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2550D7CCC);
}

uint64_t sub_2550D7CCC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for BlackPearlLevels();
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for BlackPearlTrialLevels(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2550D7D90);
}

void *sub_2550D7D90(void *result, uint64_t a2, int a3, uint64_t a4)
{
  Swift::Double v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for BlackPearlLevels();
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 20);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_2550D7E38()
{
  uint64_t result = type metadata accessor for BlackPearlLevels();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t CategoryTS.rawValue.getter()
{
  return qword_2550DC400[*v0];
}

MCCKitCategorization::CategoryTS_optional __swiftcall CategoryTS.init(rawValue:)(Swift::Int rawValue)
{
  if ((unint64_t)(rawValue + 2) > 9) {
    *unint64_t v1 = 9;
  }
  else {
    *unint64_t v1 = byte_2550DC3F6[rawValue + 2];
  }
  return (MCCKitCategorization::CategoryTS_optional)rawValue;
}

void static CategoryTS.getCategory(for:)(char *a1@<X8>)
{
  uint64_t v3 = sub_2550D9B20();
  uint64_t v4 = v2;
  if (v3 == 0x5241444E454C4143 && v2 == 0xE800000000000000 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    char v5 = 2;
  }
  else if (v3 == 5130566 && v4 == 0xE300000000000000 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    char v5 = 3;
  }
  else if (v3 == 0x59545245504F5250 && v4 == 0xE800000000000000 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    char v5 = 4;
  }
  else if (v3 == 0x4E49474F4CLL && v4 == 0xE500000000000000 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    char v5 = 5;
  }
  else if (v3 == 0x5354544F4ELL && v4 == 0xE500000000000000 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    char v5 = 6;
  }
  else if (v3 == 0x544F4E524548544FLL && v4 == 0xEA00000000005354 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    char v5 = 7;
  }
  else if (v3 == 0x544341534E415254 && v4 == 0xEC000000534E4F49 || (sub_2550DA140() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    char v5 = 8;
  }
  else
  {
    if ((v3 != 0xD000000000000014 || v4 != 0x80000002550DDAC0) && (sub_2550DA140() & 1) == 0)
    {
      if (v3 == 0x524F525245 && v4 == 0xE500000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v6 = sub_2550DA140();
        swift_bridgeObjectRelease();
        if ((v6 & 1) == 0)
        {
          if (qword_26B278B80 != -1) {
            swift_once();
          }
          uint64_t v7 = sub_2550D9A00();
          __swift_project_value_buffer(v7, (uint64_t)qword_26B279BA0);
          swift_bridgeObjectRetain_n();
          uint64_t v8 = sub_2550D99E0();
          os_log_type_t v9 = sub_2550D9DE0();
          if (os_log_type_enabled(v8, v9))
          {
            uint64_t v10 = (uint8_t *)swift_slowAlloc();
            uint64_t v11 = swift_slowAlloc();
            uint64_t v14 = v11;
            *(_DWORD *)uint64_t v10 = 136315138;
            uint64_t v12 = sub_2550D9B20();
            sub_2550A7884(v12, v13, &v14);
            sub_2550D9E90();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_25509D000, v8, v9, "Invalid category key: %s", v10, 0xCu);
            char v5 = 1;
            swift_arrayDestroy();
            MEMORY[0x25A2881E0](v11, -1, -1);
            MEMORY[0x25A2881E0](v10, -1, -1);

            goto LABEL_5;
          }

          swift_bridgeObjectRelease_n();
        }
      }
      char v5 = 1;
      goto LABEL_5;
    }
    swift_bridgeObjectRelease();
    char v5 = 0;
  }
LABEL_5:
  *a1 = v5;
}

unint64_t static CategoryTS.getCategoryText(for:)(unsigned __int8 *a1)
{
  uint64_t v1 = *a1;
  unint64_t result = 0x5241444E454C4143;
  switch(v1)
  {
    case 1:
      unint64_t result = 0x524F525245;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 5130566;
      break;
    case 4:
      unint64_t result = 0x59545245504F5250;
      break;
    case 5:
      unint64_t result = 0x4E49474F4CLL;
      break;
    case 6:
      unint64_t result = 0x5354544F4ELL;
      break;
    case 7:
      unint64_t result = 0x544F4E524548544FLL;
      break;
    case 8:
      unint64_t result = 0x544341534E415254;
      break;
    default:
      unint64_t result = 0xD000000000000014;
      break;
  }
  return result;
}

void *static CategoryTS.allCases.getter()
{
  return &unk_2704424C0;
}

BOOL sub_2550D8580(char *a1, char *a2)
{
  return qword_2550DC400[*a1] == qword_2550DC400[*a2];
}

uint64_t sub_2550D85A4()
{
  return sub_2550DA210();
}

uint64_t sub_2550D85F4()
{
  return sub_2550DA200();
}

uint64_t sub_2550D862C()
{
  return sub_2550DA210();
}

MCCKitCategorization::CategoryTS_optional sub_2550D8678(Swift::Int *a1)
{
  return CategoryTS.init(rawValue:)(*a1);
}

void sub_2550D8680(void *a1@<X8>)
{
  *a1 = qword_2550DC400[*v1];
}

void sub_2550D8698(void *a1@<X8>)
{
  *a1 = &unk_2704424C0;
}

unint64_t sub_2550D86AC()
{
  unint64_t result = qword_269E84A68;
  if (!qword_269E84A68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84A68);
  }
  return result;
}

unint64_t sub_2550D8704()
{
  unint64_t result = qword_269E84A70;
  if (!qword_269E84A70)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_269E84A78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_269E84A70);
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for CategoryTS(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 8 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 8) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF7)
  {
    unsigned int v6 = ((a2 - 248) >> 8) + 1;
    *unint64_t result = a2 + 8;
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
        JUMPOUT(0x2550D882CLL);
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
          *unint64_t result = a2 + 8;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CategoryTS()
{
  return &type metadata for CategoryTS;
}

void *ModelProxy.__allocating_init(modelLocation:)(uint64_t a1, unint64_t a2)
{
  unsigned int v4 = (void *)swift_allocObject();
  v4[2] = 0x636C65646F6D6C6DLL;
  v4[3] = 0xE800000000000000;
  v4[4] = 0x6C65646F6D6C6DLL;
  __int16 v4[5] = 0xE700000000000000;
  v4[6] = a1;
  v4[7] = a2;
  swift_bridgeObjectRetain();
  id v5 = sub_2550D8C0C(a1, a2);
  swift_bridgeObjectRelease();
  v4[8] = v5;
  return v4;
}

void *ModelProxy.init(modelLocation:)(uint64_t a1, unint64_t a2)
{
  v2[2] = 0x636C65646F6D6C6DLL;
  v2[3] = 0xE800000000000000;
  v2[4] = 0x6C65646F6D6C6DLL;
  v2[5] = 0xE700000000000000;
  v2[6] = a1;
  v2[7] = a2;
  swift_bridgeObjectRetain();
  v2[8] = sub_2550D8C0C(a1, a2);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_2550D8984(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRelease();
}

void sub_2550D89C4()
{
  uint64_t v1 = v0[6];
  unint64_t v2 = v0[7];
  swift_bridgeObjectRetain();
  id v3 = sub_2550D8C0C(v1, v2);
  swift_bridgeObjectRelease();
  unsigned int v4 = (void *)v0[8];
  v0[8] = v3;
}

id sub_2550D8A24(uint64_t a1)
{
  v11[1] = *(id *)MEMORY[0x263EF8340];
  unint64_t v2 = (void *)sub_2550D9740();
  v11[0] = 0;
  id v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelWithContentsOfURL_error_, v2, v11);

  id v4 = v11[0];
  if (v3)
  {
    uint64_t v5 = sub_2550D97D0();
    unsigned int v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
    id v7 = v4;
    v6(a1, v5);
  }
  else
  {
    id v8 = v11[0];
    sub_2550D96B0();

    swift_willThrow();
    uint64_t v9 = sub_2550D97D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1, v9);
  }
  return v3;
}

id sub_2550D8B7C()
{
  return *(id *)(v0 + 64);
}

uint64_t ModelProxy.deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t ModelProxy.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0228](v0, 72, 7);
}

id sub_2550D8C0C(uint64_t a1, unint64_t a2)
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B278C58);
  MEMORY[0x270FA5388](v4 - 8);
  unsigned int v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2550D97D0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v51 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  long long v52 = (char *)&v51 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v51 - v14;
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  long long v18 = (char *)&v51 - v17;
  MEMORY[0x270FA5388](v16);
  uint64_t v20 = (char *)&v51 - v19;
  type metadata accessor for MCCNLP();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v22 = objc_msgSend(self, sel_bundleForClass_, ObjCClassFromMetadata);
  uint64_t v53 = a1;
  unint64_t v55 = a2;
  uint64_t v23 = (void *)sub_2550D9AA0();
  uint64_t v24 = (void *)sub_2550D9AA0();
  id v54 = v22;
  id v25 = objc_msgSend(v22, sel_URLForResource_withExtension_, v23, v24);

  if (!v25)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
LABEL_9:
    sub_2550B7944((uint64_t)v6);
    if (qword_26B278B80 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_2550D9A00();
    __swift_project_value_buffer(v32, (uint64_t)qword_26B279BA0);
    swift_bridgeObjectRetain_n();
    id v33 = sub_2550D99E0();
    os_log_type_t v34 = sub_2550D9DD0();
    if (os_log_type_enabled(v33, v34))
    {
      long long v35 = (uint8_t *)swift_slowAlloc();
      long long v36 = (void *)swift_slowAlloc();
      id v57 = v36;
      *(_DWORD *)long long v35 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v37 = v53;
      uint64_t v56 = sub_2550A7884(v53, v55, (uint64_t *)&v57);
      sub_2550D9E90();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_25509D000, v33, v34, "Compiled model not found. Finding %s", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A2881E0](v36, -1, -1);
      MEMORY[0x25A2881E0](v35, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v37 = v53;
    }
    uint64_t v38 = (void *)sub_2550D9AA0();
    uint64_t v39 = (void *)sub_2550D9AA0();
    id v40 = objc_msgSend(v54, sel_pathForResource_ofType_, v38, v39);

    if (v40)
    {
      sub_2550D9AD0();

      uint64_t v41 = self;
      sub_2550D9720();
      swift_bridgeObjectRelease();
      uint64_t v42 = (void *)sub_2550D9740();
      uint64_t v43 = *(void (**)(char *, uint64_t))(v8 + 8);
      v43(v18, v7);
      id v57 = 0;
      id v44 = objc_msgSend(v41, sel_compileModelAtURL_error_, v42, &v57);

      id v45 = v57;
      if (v44)
      {
        uint64_t v46 = v52;
        sub_2550D9780();

        sub_2550A8F5C();
        uint64_t v47 = (uint64_t)v51;
        (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v51, v46, v7);
        id v31 = sub_2550D8A24(v47);
        v43(v46, v7);
        goto LABEL_17;
      }
      long long v49 = v45;
      uint64_t v50 = sub_2550D96B0();

      uint64_t v37 = v50;
      swift_willThrow();
      id v57 = 0;
      unint64_t v58 = 0xE000000000000000;
      sub_2550D9F60();
      sub_2550D9BA0();
      sub_2550D9BA0();
      sub_2550D9BA0();
      uint64_t v56 = v50;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E84800);
      sub_2550D9FB0();
    }
    else
    {
      id v57 = 0;
      unint64_t v58 = 0xE000000000000000;
      sub_2550D9F60();
      swift_bridgeObjectRelease();
      id v57 = (id)0xD00000000000001ELL;
      unint64_t v58 = 0x80000002550DE260;
      sub_2550D9BA0();
    }
    while (1)
    {
      sub_2550D9FD0();
      __break(1u);
      id v57 = 0;
      unint64_t v58 = 0xE000000000000000;
      sub_2550D9F60();
      sub_2550D9BA0();
      sub_2550D9BA0();
      sub_2550D9BA0();
      uint64_t v56 = v37;
      __swift_instantiateConcreteTypeFromMangledName(&qword_269E84800);
      sub_2550D9FB0();
    }
  }
  sub_2550D9780();

  long long v26 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v26(v6, v18, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1) {
    goto LABEL_9;
  }
  v26(v20, v6, v7);
  if (qword_26B278B80 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_2550D9A00();
  __swift_project_value_buffer(v27, (uint64_t)qword_26B279BA0);
  long long v28 = sub_2550D99E0();
  os_log_type_t v29 = sub_2550D9DD0();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl(&dword_25509D000, v28, v29, "Model already compiled", v30, 2u);
    MEMORY[0x25A2881E0](v30, -1, -1);
  }

  sub_2550A8F5C();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v15, v20, v7);
  id v31 = sub_2550D8A24((uint64_t)v15);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v20, v7);
LABEL_17:

  return v31;
}

uint64_t type metadata accessor for ModelProxy()
{
  return self;
}

uint64_t method lookup function for ModelProxy(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ModelProxy);
}

uint64_t dispatch thunk of ModelProxy.__allocating_init(modelLocation:)()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of ModelProxy.setModelLocation(modelLocation:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of ModelProxy.compileModel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of ModelProxy.getModel()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t sub_2550D95C0()
{
  return MEMORY[0x270EEE098]();
}

uint64_t sub_2550D95D0()
{
  return MEMORY[0x270EEE0C0]();
}

uint64_t sub_2550D95E0()
{
  return MEMORY[0x270EEE170]();
}

uint64_t sub_2550D95F0()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_2550D9600()
{
  return MEMORY[0x270EEE1A8]();
}

uint64_t sub_2550D9610()
{
  return MEMORY[0x270EEE228]();
}

uint64_t sub_2550D9620()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_2550D9630()
{
  return MEMORY[0x270EEE680]();
}

uint64_t sub_2550D9640()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_2550D9650()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_2550D9660()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_2550D9670()
{
  return MEMORY[0x270EEE940]();
}

uint64_t sub_2550D9680()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_2550D9690()
{
  return MEMORY[0x270EEEEF0]();
}

uint64_t sub_2550D96A0()
{
  return MEMORY[0x270EEEFF8]();
}

uint64_t sub_2550D96B0()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2550D96C0()
{
  return MEMORY[0x270EEFA08]();
}

uint64_t sub_2550D96D0()
{
  return MEMORY[0x270EEFA18]();
}

uint64_t sub_2550D96E0()
{
  return MEMORY[0x270EEFBC0]();
}

uint64_t sub_2550D96F0()
{
  return MEMORY[0x270EEFC10]();
}

uint64_t sub_2550D9700()
{
  return MEMORY[0x270EEFC58]();
}

uint64_t sub_2550D9710()
{
  return MEMORY[0x270EEFC88]();
}

uint64_t sub_2550D9720()
{
  return MEMORY[0x270EEFCB0]();
}

uint64_t sub_2550D9730()
{
  return MEMORY[0x270EEFCE0]();
}

uint64_t sub_2550D9740()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2550D9750()
{
  return MEMORY[0x270EEFD78]();
}

uint64_t sub_2550D9760()
{
  return MEMORY[0x270EEFD90]();
}

uint64_t sub_2550D9770()
{
  return MEMORY[0x270EEFDB8]();
}

uint64_t sub_2550D9780()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2550D9790()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_2550D97A0()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_2550D97B0()
{
  return MEMORY[0x270EEFF18]();
}

uint64_t sub_2550D97C0()
{
  return MEMORY[0x270EEFF58]();
}

uint64_t sub_2550D97D0()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2550D97E0()
{
  return MEMORY[0x270EEFFC8]();
}

uint64_t sub_2550D97F0()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_2550D9800()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_2550D9810()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_2550D9820()
{
  return MEMORY[0x270EF01C0]();
}

uint64_t sub_2550D9830()
{
  return MEMORY[0x270EF0218]();
}

uint64_t sub_2550D9840()
{
  return MEMORY[0x270EF0268]();
}

uint64_t sub_2550D9850()
{
  return MEMORY[0x270EF02A8]();
}

uint64_t sub_2550D9860()
{
  return MEMORY[0x270EF0D80]();
}

uint64_t sub_2550D9870()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_2550D9880()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2550D9890()
{
  return MEMORY[0x270F05840]();
}

uint64_t sub_2550D98A0()
{
  return MEMORY[0x270F05850]();
}

uint64_t sub_2550D98B0()
{
  return MEMORY[0x270F05870]();
}

uint64_t sub_2550D98C0()
{
  return MEMORY[0x270F058A0]();
}

uint64_t sub_2550D98D0()
{
  return MEMORY[0x270F058A8]();
}

uint64_t sub_2550D98E0()
{
  return MEMORY[0x270F058B8]();
}

uint64_t sub_2550D98F0()
{
  return MEMORY[0x270F058C8]();
}

uint64_t sub_2550D9900()
{
  return MEMORY[0x270F058D8]();
}

uint64_t sub_2550D9910()
{
  return MEMORY[0x270F058E0]();
}

uint64_t sub_2550D9920()
{
  return MEMORY[0x270F05930]();
}

uint64_t sub_2550D9930()
{
  return MEMORY[0x270F05970]();
}

uint64_t sub_2550D9940()
{
  return MEMORY[0x270F05988]();
}

uint64_t sub_2550D9950()
{
  return MEMORY[0x270F059A0]();
}

uint64_t sub_2550D9960()
{
  return MEMORY[0x270F059F8]();
}

uint64_t sub_2550D9970()
{
  return MEMORY[0x270F05A00]();
}

uint64_t sub_2550D9980()
{
  return MEMORY[0x270F05A38]();
}

uint64_t sub_2550D9990()
{
  return MEMORY[0x270F05A48]();
}

uint64_t sub_2550D99A0()
{
  return MEMORY[0x270F05A68]();
}

uint64_t sub_2550D99B0()
{
  return MEMORY[0x270F05A88]();
}

uint64_t sub_2550D99C0()
{
  return MEMORY[0x270F05AD0]();
}

uint64_t sub_2550D99D0()
{
  return MEMORY[0x270F05AD8]();
}

uint64_t sub_2550D99E0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2550D99F0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2550D9A00()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2550D9A10()
{
  return MEMORY[0x270EEAB00]();
}

uint64_t sub_2550D9A20()
{
  return MEMORY[0x270EEAB30]();
}

uint64_t sub_2550D9A30()
{
  return MEMORY[0x270EEAC48]();
}

uint64_t sub_2550D9A40()
{
  return MEMORY[0x270EEACC8]();
}

uint64_t sub_2550D9A50()
{
  return MEMORY[0x270EEACD8]();
}

uint64_t sub_2550D9A60()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2550D9A70()
{
  return MEMORY[0x270EF1840]();
}

uint64_t sub_2550D9A80()
{
  return MEMORY[0x270F9D060]();
}

uint64_t sub_2550D9A90()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2550D9AA0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2550D9AB0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_2550D9AC0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_2550D9AD0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2550D9AE0()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_2550D9AF0()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_2550D9B00()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_2550D9B10()
{
  return MEMORY[0x270F9D5F8]();
}

uint64_t sub_2550D9B20()
{
  return MEMORY[0x270F9D610]();
}

uint64_t sub_2550D9B30()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2550D9B40()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_2550D9B50()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2550D9B60()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2550D9B70()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_2550D9B80()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_2550D9B90()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_2550D9BA0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2550D9BB0()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_2550D9BC0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2550D9BD0()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_2550D9BE0()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2550D9BF0()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_2550D9C00()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_2550D9C10()
{
  return MEMORY[0x270F9D850]();
}

uint64_t sub_2550D9C20()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2550D9C30()
{
  return MEMORY[0x270F9D878]();
}

uint64_t sub_2550D9C40()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_2550D9C50()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_2550D9C60()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_2550D9C70()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2550D9C80()
{
  return MEMORY[0x270F9DA28]();
}

uint64_t sub_2550D9C90()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2550D9CA0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2550D9CB0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_2550D9CC0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2550D9CD0()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_2550D9CE0()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_2550D9CF0()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_2550D9D00()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_2550D9D10()
{
  return MEMORY[0x270EF1C00]();
}

uint64_t sub_2550D9D20()
{
  return MEMORY[0x270EF1C28]();
}

uint64_t sub_2550D9D30()
{
  return MEMORY[0x270F9DDA0]();
}

uint64_t sub_2550D9D40()
{
  return MEMORY[0x270EF1C48]();
}

uint64_t sub_2550D9D50()
{
  return MEMORY[0x270EF1C98]();
}

uint64_t sub_2550D9D60()
{
  return MEMORY[0x270F9E080]();
}

uint64_t sub_2550D9D70()
{
  return MEMORY[0x270FA2B98]();
}

uint64_t sub_2550D9D80()
{
  return MEMORY[0x270F9E0D8]();
}

uint64_t sub_2550D9D90()
{
  return MEMORY[0x270F9E0E0]();
}

uint64_t sub_2550D9DA0()
{
  return MEMORY[0x270F9E1E0]();
}

uint64_t sub_2550D9DB0()
{
  return MEMORY[0x270EF1D50]();
}

uint64_t sub_2550D9DC0()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2550D9DD0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2550D9DE0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2550D9DF0()
{
  return MEMORY[0x270FA10E8]();
}

uint64_t sub_2550D9E00()
{
  return MEMORY[0x270EF20D8]();
}

uint64_t sub_2550D9E10()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_2550D9E20()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2550D9E30()
{
  return MEMORY[0x270EF2210]();
}

uint64_t sub_2550D9E40()
{
  return MEMORY[0x270F9E468]();
}

uint64_t sub_2550D9E50()
{
  return MEMORY[0x270F9E4A0]();
}

uint64_t sub_2550D9E60()
{
  return MEMORY[0x270F9E4F8]();
}

uint64_t sub_2550D9E70()
{
  return MEMORY[0x270F9E500]();
}

uint64_t sub_2550D9E80()
{
  return MEMORY[0x270F9E508]();
}

uint64_t sub_2550D9E90()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2550D9EA0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2550D9EB0()
{
  return MEMORY[0x270EF23D8]();
}

uint64_t sub_2550D9EC0()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_2550D9ED0()
{
  return MEMORY[0x270EF2490]();
}

uint64_t sub_2550D9EE0()
{
  return MEMORY[0x270EF24A0]();
}

uint64_t sub_2550D9EF0()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_2550D9F00()
{
  return MEMORY[0x270EF25B0]();
}

uint64_t sub_2550D9F10()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2550D9F20()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_2550D9F30()
{
  return MEMORY[0x270F9E8D0]();
}

uint64_t sub_2550D9F40()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_2550D9F50()
{
  return MEMORY[0x270F9E9A0]();
}

uint64_t sub_2550D9F60()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2550D9F70()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2550D9F80()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2550D9F90()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2550D9FA0()
{
  return MEMORY[0x270F9EB30]();
}

uint64_t sub_2550D9FB0()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_2550D9FC0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2550D9FD0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2550D9FE0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2550D9FF0()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_2550DA000()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_2550DA010()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2550DA020()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2550DA040()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2550DA050()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_2550DA060()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2550DA070()
{
  return MEMORY[0x270F9F2F8]();
}

uint64_t sub_2550DA080()
{
  return MEMORY[0x270F9F308]();
}

uint64_t sub_2550DA090()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_2550DA0A0()
{
  return MEMORY[0x270F9F340]();
}

uint64_t sub_2550DA0B0()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2550DA0C0()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_2550DA0D0()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2550DA0E0()
{
  return MEMORY[0x270F9F438]();
}

uint64_t sub_2550DA0F0()
{
  return MEMORY[0x270F9F448]();
}

uint64_t sub_2550DA100()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_2550DA110()
{
  return MEMORY[0x270F9F480]();
}

uint64_t sub_2550DA120()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_2550DA130()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2550DA140()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2550DA150()
{
  return MEMORY[0x270F9F920]();
}

uint64_t sub_2550DA160()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_2550DA170()
{
  return MEMORY[0x270F9FA88]();
}

uint64_t sub_2550DA180()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_2550DA190()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2550DA1A0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2550DA1B0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2550DA1C0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2550DA1D0()
{
  return MEMORY[0x270F9FC28]();
}

uint64_t sub_2550DA1E0()
{
  return MEMORY[0x270F9FC40]();
}

uint64_t sub_2550DA1F0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2550DA200()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2550DA210()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2550DA220()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2550DA230()
{
  return MEMORY[0x270F9FD98]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x270FA0158]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x270ED90F0]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}