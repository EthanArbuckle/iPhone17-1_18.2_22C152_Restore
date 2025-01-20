@interface _DPPPM_0_2_1_PayloadEncoderShim
+ (id)encodedAggregatorDiscreteGaussianClientSymmetricRAPPORDPConfigWithTargetCentralEpsilon:(double)a3 targetCentralDelta:(double)a4 sigma:(double)a5 squaredL2Sensitivity:(double)a6 localEpsilon:(double)a7 error:(id *)a8;
+ (id)encodedEpsDPConfigWithEpsilon:(double)a3 error:(id *)a4;
+ (id)encodedGaussianWithSubsampledMomentsAccountantConfigWithMaxCohortSize:(unint64_t)a3 numIterations:(unsigned int)a4 populationSize:(unint64_t)a5 renyiOrder:(unsigned int)a6 sigma:(double)a7 sigmaAfterNormalization:(double)a8 targetCentralEpsilon:(double)a9 targetCentralDelta:(double)a10 error:(id *)a11;
+ (id)encodedInputShareAADWithTaskID:(id)a3 reportID:(id)a4 time:(unint64_t)a5 publicShare:(id)a6 error:(id *)a7;
+ (id)encodedNoneDPConfigAndReturnError:(id *)a3;
+ (id)encodedPINE32VDAFConfigWithL2NormBound:(unint64_t)a3 numFractionalBits:(unsigned int)a4 length:(unsigned int)a5 chunkLength:(unsigned int)a6 chunkLengthNormEquality:(unsigned int)a7 numProofs:(unsigned __int8)a8 wraparoundCheckCount:(unsigned __int16)a9 encodedDPConfig:(id)a10 error:(id *)a11;
+ (id)encodedPINE40VDAFConfigWithL2NormBound:(unint64_t)a3 numFractionalBits:(unsigned int)a4 length:(unsigned int)a5 chunkLength:(unsigned int)a6 chunkLengthNormEquality:(unsigned int)a7 numProofs:(unsigned __int8)a8 wraparoundCheckCount:(unsigned __int16)a9 encodedDPConfig:(id)a10 error:(id *)a11;
+ (id)encodedPINE64VDAFConfigWithL2NormBound:(unint64_t)a3 numFractionalBits:(unsigned int)a4 length:(unsigned int)a5 chunkLength:(unsigned int)a6 chunkLengthNormEquality:(unsigned int)a7 numProofs:(unsigned __int8)a8 wraparoundCheckCount:(unsigned __int16)a9 encodedDPConfig:(id)a10 error:(id *)a11;
+ (id)encodedPlaintextInputShareWithTaskProvExtensionData:(id)a3 payload:(id)a4 error:(id *)a5;
+ (id)encodedPrio2VDAFConfigWithLength:(unsigned int)a3 encodedDPConfig:(id)a4 error:(id *)a5;
+ (id)encodedPrio3SumVectorVDAFConfigWithLength:(unsigned int)a3 bits:(unsigned __int8)a4 chunkLength:(unsigned int)a5 numProofs:(unsigned __int8)a6 encodedDPConfig:(id)a7 error:(id *)a8;
+ (id)encodedReportWithReportID:(id)a3 time:(unint64_t)a4 publicShare:(id)a5 leaderHPKEConfigID:(unsigned __int8)a6 leaderEnc:(id)a7 leaderPayload:(id)a8 helperHPKEConfigID:(unsigned __int8)a9 helperEnc:(id)a10 helperPayload:(id)a11 error:(id *)a12;
+ (id)encodedTaskConfigWithTaskInfo:(id)a3 leaderAggregatorEndpoint:(id)a4 helperAggregatorEndpoint:(id)a5 timePrecision:(unint64_t)a6 maxBatchQueryCount:(unsigned __int16)a7 minBatchSize:(unsigned int)a8 maxBatchSize:(unsigned int)a9 taskExpiration:(unint64_t)a10 encodedVDAFConfig:(id)a11 error:(id *)a12;
- (_DPPPM_0_2_1_PayloadEncoderShim)init;
@end

@implementation _DPPPM_0_2_1_PayloadEncoderShim

- (_DPPPM_0_2_1_PayloadEncoderShim)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DPPPM_0_2_1_PayloadEncoderShim();
  return [(_DPPPM_0_2_1_PayloadEncoderShim *)&v3 init];
}

+ (id)encodedTaskConfigWithTaskInfo:(id)a3 leaderAggregatorEndpoint:(id)a4 helperAggregatorEndpoint:(id)a5 timePrecision:(unint64_t)a6 maxBatchQueryCount:(unsigned __int16)a7 minBatchSize:(unsigned int)a8 maxBatchSize:(unsigned int)a9 taskExpiration:(unint64_t)a10 encodedVDAFConfig:(id)a11 error:(id *)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a11;
  unint64_t v21 = sub_10001BE40(v17, v18, v19, a6, a7, a8, a9, a10, v20);
  unint64_t v23 = v22;

  v24.super.isa = sub_100058D70().super.isa;
  sub_100016B2C(v21, v23);
  return v24.super.isa;
}

+ (id)encodedPrio2VDAFConfigWithLength:(unsigned int)a3 encodedDPConfig:(id)a4 error:(id *)a5
{
  id v6 = a4;
  uint64_t v7 = sub_10001D9C4(a3, v6);
  unint64_t v9 = v8;

  v10.super.isa = sub_100058D70().super.isa;
  sub_100016B2C(v7, v9);
  return v10.super.isa;
}

+ (id)encodedPrio3SumVectorVDAFConfigWithLength:(unsigned int)a3 bits:(unsigned __int8)a4 chunkLength:(unsigned int)a5 numProofs:(unsigned __int8)a6 encodedDPConfig:(id)a7 error:(id *)a8
{
  id v12 = a7;
  uint64_t v13 = sub_10001DCD0(a3, a4, a5, a6, v12);
  unint64_t v15 = v14;

  v16.super.isa = sub_100058D70().super.isa;
  sub_100016B2C(v13, v15);
  return v16.super.isa;
}

+ (id)encodedPINE64VDAFConfigWithL2NormBound:(unint64_t)a3 numFractionalBits:(unsigned int)a4 length:(unsigned int)a5 chunkLength:(unsigned int)a6 chunkLengthNormEquality:(unsigned int)a7 numProofs:(unsigned __int8)a8 wraparoundCheckCount:(unsigned __int16)a9 encodedDPConfig:(id)a10 error:(id *)a11
{
  return sub_100017F6C((uint64_t)a1, (uint64_t)a2, a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, *(uint64_t *)&a7, a8, a9, a10, (uint64_t)a11, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, id))sub_10001E000);
}

+ (id)encodedPINE32VDAFConfigWithL2NormBound:(unint64_t)a3 numFractionalBits:(unsigned int)a4 length:(unsigned int)a5 chunkLength:(unsigned int)a6 chunkLengthNormEquality:(unsigned int)a7 numProofs:(unsigned __int8)a8 wraparoundCheckCount:(unsigned __int16)a9 encodedDPConfig:(id)a10 error:(id *)a11
{
  return sub_100017F6C((uint64_t)a1, (uint64_t)a2, a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, *(uint64_t *)&a7, a8, a9, a10, (uint64_t)a11, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, id))sub_10001E374);
}

+ (id)encodedPINE40VDAFConfigWithL2NormBound:(unint64_t)a3 numFractionalBits:(unsigned int)a4 length:(unsigned int)a5 chunkLength:(unsigned int)a6 chunkLengthNormEquality:(unsigned int)a7 numProofs:(unsigned __int8)a8 wraparoundCheckCount:(unsigned __int16)a9 encodedDPConfig:(id)a10 error:(id *)a11
{
  return sub_100017F6C((uint64_t)a1, (uint64_t)a2, a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6, *(uint64_t *)&a7, a8, a9, a10, (uint64_t)a11, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, id))sub_10001E6E8);
}

+ (id)encodedEpsDPConfigWithEpsilon:(double)a3 error:(id *)a4
{
  unint64_t v4 = sub_10001EA54(a3);
  unint64_t v6 = v5;
  v7.super.isa = sub_100058D70().super.isa;
  sub_100016B2C(v4, v6);
  return v7.super.isa;
}

+ (id)encodedNoneDPConfigAndReturnError:(id *)a3
{
  unint64_t v3 = sub_10001EC80();
  unint64_t v5 = v4;
  v6.super.isa = sub_100058D70().super.isa;
  sub_100016B2C(v3, v5);
  return v6.super.isa;
}

+ (id)encodedAggregatorDiscreteGaussianClientSymmetricRAPPORDPConfigWithTargetCentralEpsilon:(double)a3 targetCentralDelta:(double)a4 sigma:(double)a5 squaredL2Sensitivity:(double)a6 localEpsilon:(double)a7 error:(id *)a8
{
  unint64_t v8 = sub_10001EE54(a3, a4, a5, a6, a7);
  unint64_t v10 = v9;
  v11.super.isa = sub_100058D70().super.isa;
  sub_100016B2C(v8, v10);
  return v11.super.isa;
}

+ (id)encodedGaussianWithSubsampledMomentsAccountantConfigWithMaxCohortSize:(unint64_t)a3 numIterations:(unsigned int)a4 populationSize:(unint64_t)a5 renyiOrder:(unsigned int)a6 sigma:(double)a7 sigmaAfterNormalization:(double)a8 targetCentralEpsilon:(double)a9 targetCentralDelta:(double)a10 error:(id *)a11
{
  unint64_t v11 = sub_10001F2F8(a3, a4, a5, a6, a7, a8, a9, a10);
  unint64_t v13 = v12;
  v14.super.isa = sub_100058D70().super.isa;
  sub_100016B2C(v11, v13);
  return v14.super.isa;
}

+ (id)encodedReportWithReportID:(id)a3 time:(unint64_t)a4 publicShare:(id)a5 leaderHPKEConfigID:(unsigned __int8)a6 leaderEnc:(id)a7 leaderPayload:(id)a8 helperHPKEConfigID:(unsigned __int8)a9 helperEnc:(id)a10 helperPayload:(id)a11 error:(id *)a12
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a10;
  id v20 = a11;
  v51 = v15;
  uint64_t v54 = sub_10001BC6C(v15);
  unint64_t v22 = v21;
  v50 = v16;
  uint64_t v23 = sub_10001BC6C(v16);
  unint64_t v25 = v24;
  v49 = v17;
  uint64_t v26 = sub_10001BC6C(v17);
  unint64_t v28 = v27;
  v48 = v18;
  uint64_t v29 = sub_10001BC6C(v18);
  unint64_t v31 = v30;
  v47 = v19;
  v32 = v19;
  uint64_t v33 = v29;
  uint64_t v34 = sub_10001BC6C(v32);
  unint64_t v36 = v35;
  uint64_t v37 = sub_10001BC6C(v20);
  unint64_t v45 = v28;
  unint64_t v46 = v31;
  unint64_t v39 = v38;
  unint64_t v52 = v36;
  uint64_t v53 = v37;
  uint64_t v40 = sub_10001D490();
  unint64_t v42 = v41;
  sub_100016B2C(v54, v22);
  sub_100016B2C(v23, v25);
  sub_100016B2C(v26, v45);
  sub_100016B2C(v33, v46);
  sub_100016B2C(v34, v52);
  sub_100016B2C(v53, v39);

  v43.super.isa = sub_100058D70().super.isa;
  sub_100016B2C(v40, v42);
  return v43.super.isa;
}

+ (id)encodedInputShareAADWithTaskID:(id)a3 reportID:(id)a4 time:(unint64_t)a5 publicShare:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = sub_10001F73C(v10, v11, a5, v12);
  unint64_t v15 = v14;

  v16.super.isa = sub_100058D70().super.isa;
  sub_100016B2C(v13, v15);
  return v16.super.isa;
}

+ (id)encodedPlaintextInputShareWithTaskProvExtensionData:(id)a3 payload:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_10001F8CC(v7);
  unint64_t v10 = v9;

  v11.super.isa = sub_100058D70().super.isa;
  sub_100016B2C(v8, v10);
  return v11.super.isa;
}

@end