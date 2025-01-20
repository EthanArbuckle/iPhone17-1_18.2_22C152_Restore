@interface _DPTaskProv06
- (BOOL)validatePINEParametersWithError:(id *)a3;
- (_DPTaskProv06)initWithDonation:(id)a3 leaderURL:(id)a4 helperURL:(id)a5 error:(id *)a6;
- (id)derivedMaxBatchSizeFromDonationMetadata:(id)a3 minBatchSize:(unsigned int)a4 error:(id *)a5;
- (id)encodedDPConfigWithError:(id *)a3;
- (id)encodedTaskConfigWithError:(id *)a3;
- (id)encodedVDAFConfigWithEncodedDPConfig:(id)a3 error:(id *)a4;
@end

@implementation _DPTaskProv06

- (_DPTaskProv06)initWithDonation:(id)a3 leaderURL:(id)a4 helperURL:(id)a5 error:(id *)a6
{
  v7.receiver = self;
  v7.super_class = (Class)_DPTaskProv06;
  return [(_DPTaskProv *)&v7 initWithDonation:a3 leaderURL:a4 helperURL:a5 error:a6];
}

- (id)encodedTaskConfigWithError:(id *)a3
{
  v5 = -[_DPTaskProv06 encodedDPConfigWithError:](self, "encodedDPConfigWithError:");
  if (v5)
  {
    v6 = [(_DPTaskProv06 *)self encodedVDAFConfigWithEncodedDPConfig:v5 error:a3];
    if (v6)
    {
      v14 = [(_DPTaskProv *)self taskInfo];
      objc_super v7 = [(_DPTaskProv *)self leaderURL];
      v8 = [(_DPTaskProv *)self helperURL];
      uint64_t v9 = [(_DPTaskProv *)self minBatchSize];
      LODWORD(v13) = [(_DPTaskProv *)self maxBatchSize];
      v10 = +[_DPPPM_0_2_1_PayloadEncoderShim encodedTaskConfigWithTaskInfo:v14 leaderAggregatorEndpoint:v7 helperAggregatorEndpoint:v8 timePrecision:14400 maxBatchQueryCount:(unsigned __int16)kDPTaskProvMaxBatchQueryCount minBatchSize:v9 maxBatchSize:v13 taskExpiration:[(_DPTaskProv *)self taskExpiration] encodedVDAFConfig:v6 error:a3];
      [(_DPTaskProv *)self setEncodedTaskConfig:v10];

      v11 = [(_DPTaskProv *)self encodedTaskConfig];
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)derivedMaxBatchSizeFromDonationMetadata:(id)a3 minBatchSize:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  uint64_t v9 = [v8 objectForKeyedSubscript:kDPMetadataDediscoTaskConfig];
  v10 = [v9 objectForKeyedSubscript:kDPMetadataDediscoTaskConfigMaxBatchSize];

  if (v10)
  {
    v13.receiver = self;
    v13.super_class = (Class)_DPTaskProv06;
    v11 = [(_DPTaskProv *)&v13 derivedMaxBatchSizeFromDonationMetadata:v8 minBatchSize:v6 error:a5];
  }
  else
  {
    v11 = &off_100079858;
  }

  return v11;
}

- (id)encodedDPConfigWithError:(id *)a3
{
  v4 = [(_DPTaskProv *)self donation];
  v5 = [v4 metadata];
  uint64_t v6 = kDPMetadataDediscoTaskConfig;
  objc_super v7 = [v5 objectForKeyedSubscript:kDPMetadataDediscoTaskConfig];
  uint64_t v8 = kDPMetadataDediscoTaskConfigDPConfig;
  uint64_t v9 = [v7 objectForKeyedSubscript:kDPMetadataDediscoTaskConfigDPConfig];

  uint64_t v10 = kDPMetadataDediscoTaskConfigDPConfigMechanism;
  v11 = [v9 objectForKeyedSubscript:kDPMetadataDediscoTaskConfigDPConfigMechanism];
  v12 = v11;
  if (!v11
    || [v11 isEqualToString:kDPMetadataDediscoTaskConfigDPConfigMechanismClientSymmetricRAPPOR])
  {
    uint64_t v13 = kDPMetadataDediscoTaskConfigDPConfigLocalEpsilon;
    v14 = [v9 objectForKeyedSubscript:kDPMetadataDediscoTaskConfigDPConfigLocalEpsilon];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v16 = [v9 objectForKeyedSubscript:v13];
      [v16 doubleValue];
      v17 = +[_DPPPM_0_2_1_PayloadEncoderShim encodedEpsDPConfigWithEpsilon:error:](_DPPPM_0_2_1_PayloadEncoderShim, "encodedEpsDPConfigWithEpsilon:error:", a3);

      goto LABEL_33;
    }
    v18 = +[NSString stringWithFormat:@"Malformed parameter (%@.%@.%@) in metadata, it should be a number", v6, v8, v13];
    v19 = +[_DPDediscoError errorWithCode:400 description:v18];

    [v19 logAndStoreInError:a3];
    goto LABEL_6;
  }
  if ([v12 isEqualToString:kDPMetadataDediscoTaskConfigDPConfigMechanismAggregatorDiscreteGaussianClientSymmetricRAPPOR])
  {
    uint64_t v89 = v6;
    v92 = a3;
    v94 = v12;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    uint64_t v79 = kDPMetadataDediscoTaskConfigDPConfigTargetCentralEpsilon;
    uint64_t v81 = kDPMetadataDediscoTaskConfigDPConfigTargetCentralDelta;
    v105[0] = kDPMetadataDediscoTaskConfigDPConfigTargetCentralEpsilon;
    v105[1] = kDPMetadataDediscoTaskConfigDPConfigTargetCentralDelta;
    uint64_t v83 = kDPMetadataDediscoTaskConfigDPConfigGaussianSigma;
    uint64_t v85 = kDPMetadataDPConfigSquaredL2Sensitivity;
    v105[2] = kDPMetadataDediscoTaskConfigDPConfigGaussianSigma;
    v105[3] = kDPMetadataDPConfigSquaredL2Sensitivity;
    uint64_t v87 = kDPMetadataDediscoTaskConfigDPConfigLocalEpsilon;
    v105[4] = kDPMetadataDediscoTaskConfigDPConfigLocalEpsilon;
    v20 = +[NSArray arrayWithObjects:v105 count:5];
    id v21 = [v20 countByEnumeratingWithState:&v99 objects:v106 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v100;
      while (2)
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v100 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v99 + 1) + 8 * i);
          v26 = [v9 objectForKeyedSubscript:v25];
          objc_opt_class();
          char v27 = objc_opt_isKindOfClass();

          if ((v27 & 1) == 0)
          {
            v65 = +[NSString stringWithFormat:@"Malformed parameter (%@.%@.%@) in metadata, expected numbers.", v89, v8, v25];
            v66 = +[_DPDediscoError errorWithCode:400 description:v65];

            [v66 logAndStoreInError:v92];
            goto LABEL_31;
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v99 objects:v106 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    v28 = [v9 objectForKeyedSubscript:v79];
    [v28 doubleValue];
    double v30 = v29;
    v31 = [v9 objectForKeyedSubscript:v81];
    [v31 doubleValue];
    double v33 = v32;
    v34 = [v9 objectForKeyedSubscript:v83];
    [v34 doubleValue];
    double v36 = v35;
    v37 = [v9 objectForKeyedSubscript:v85];
    [v37 doubleValue];
    double v39 = v38;
    v40 = [v9 objectForKeyedSubscript:v87];
    [v40 doubleValue];
    v17 = +[_DPPPM_0_2_1_PayloadEncoderShim encodedAggregatorDiscreteGaussianClientSymmetricRAPPORDPConfigWithTargetCentralEpsilon:v92 targetCentralDelta:v30 sigma:v33 squaredL2Sensitivity:v36 localEpsilon:v39 error:v41];

LABEL_32:
    v12 = v94;
    goto LABEL_33;
  }
  if ([v12 isEqualToString:kDPMetadataDediscoTaskConfigDPConfigMechanismGaussianWithSubsampledMomentsAccountant])
  {
    uint64_t v90 = v6;
    v93 = a3;
    v94 = v12;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    uint64_t v73 = kDPMetadataDPConfigMaxCohortSize;
    uint64_t v75 = kDPMetadataDPConfigNumIterations;
    v103[0] = kDPMetadataDPConfigMaxCohortSize;
    v103[1] = kDPMetadataDPConfigNumIterations;
    uint64_t v77 = kDPMetadataDPConfigPopulationSize;
    uint64_t v80 = kDPMetadataDPConfigRenyiOrder;
    v103[2] = kDPMetadataDPConfigPopulationSize;
    v103[3] = kDPMetadataDPConfigRenyiOrder;
    uint64_t v82 = kDPMetadataDPConfigCohortSigma;
    uint64_t v84 = kDPMetadataDPConfigSigmaAfterNormalizing;
    v103[4] = kDPMetadataDPConfigCohortSigma;
    v103[5] = kDPMetadataDPConfigSigmaAfterNormalizing;
    uint64_t v86 = kDPMetadataDediscoTaskConfigDPConfigTargetCentralEpsilon;
    uint64_t v88 = kDPMetadataDediscoTaskConfigDPConfigTargetCentralDelta;
    v103[6] = kDPMetadataDediscoTaskConfigDPConfigTargetCentralEpsilon;
    v103[7] = kDPMetadataDediscoTaskConfigDPConfigTargetCentralDelta;
    v42 = +[NSArray arrayWithObjects:v103 count:8];
    id v43 = [v42 countByEnumeratingWithState:&v95 objects:v104 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v96;
      while (2)
      {
        for (j = 0; j != v44; j = (char *)j + 1)
        {
          if (*(void *)v96 != v45) {
            objc_enumerationMutation(v42);
          }
          uint64_t v47 = *(void *)(*((void *)&v95 + 1) + 8 * (void)j);
          v48 = [v9 objectForKeyedSubscript:v47];
          objc_opt_class();
          char v49 = objc_opt_isKindOfClass();

          if ((v49 & 1) == 0)
          {
            v67 = +[NSString stringWithFormat:@"Malformed parameter (%@.%@.%@) in metadata, expected numbers.", v90, v8, v47];
            v68 = +[_DPDediscoError errorWithCode:400 description:v67];

            [v68 logAndStoreInError:v93];
LABEL_31:
            v17 = 0;
            goto LABEL_32;
          }
        }
        id v44 = [v42 countByEnumeratingWithState:&v95 objects:v104 count:16];
        if (v44) {
          continue;
        }
        break;
      }
    }

    v50 = [v9 objectForKeyedSubscript:v73];
    id v74 = [v50 unsignedLongValue];
    v91 = [v9 objectForKeyedSubscript:v75];
    unsigned int v76 = [v91 unsignedIntValue];
    v51 = [v9 objectForKeyedSubscript:v77];
    id v78 = [v51 unsignedLongValue];
    v52 = [v9 objectForKeyedSubscript:v80];
    id v53 = [v52 unsignedIntValue];
    v54 = [v9 objectForKeyedSubscript:v82];
    [v54 doubleValue];
    double v56 = v55;
    v57 = [v9 objectForKeyedSubscript:v84];
    [v57 doubleValue];
    double v59 = v58;
    v60 = [v9 objectForKeyedSubscript:v86];
    [v60 doubleValue];
    double v62 = v61;
    v63 = [v9 objectForKeyedSubscript:v88];
    [v63 doubleValue];
    v17 = +[_DPPPM_0_2_1_PayloadEncoderShim encodedGaussianWithSubsampledMomentsAccountantConfigWithMaxCohortSize:v74 numIterations:v76 populationSize:v78 renyiOrder:v53 sigma:v93 sigmaAfterNormalization:v56 targetCentralEpsilon:v59 targetCentralDelta:v62 error:v64];

    goto LABEL_32;
  }
  if (![v12 isEqualToString:kDPMetadataDediscoTaskConfigDPConfigMechanismNone])
  {
    v70 = [v9 objectForKeyedSubscript:v10];
    v71 = +[NSString stringWithFormat:@"Unknown DP config mechanism %@", v70];
    v72 = +[_DPDediscoError errorWithCode:400 description:v71];

    [v72 logAndStoreInError:a3];
LABEL_6:
    v17 = 0;
    goto LABEL_33;
  }
  v17 = +[_DPPPM_0_2_1_PayloadEncoderShim encodedNoneDPConfigAndReturnError:a3];
LABEL_33:

  return v17;
}

- (BOOL)validatePINEParametersWithError:(id *)a3
{
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v44[0] = kDPMetadataPINEL2NormBoundInt;
  v44[1] = kDPMetadataPINEFractionalBitCount;
  v44[2] = kDPMetadataPINEChunkLength;
  v44[3] = kDPMetadataPINEChunkLengthNormEquality;
  id obj = +[NSArray arrayWithObjects:v44 count:4];
  id v3 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v39;
    uint64_t v6 = kDPMetadataVDAF;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v39 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v9 = [(_DPTaskProv *)self donation];
        uint64_t v10 = [v9 metadata];
        v11 = [v10 objectForKeyedSubscript:v6];
        v12 = [v11 objectForKeyedSubscript:v8];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          v24 = [(_DPTaskProv *)self donation];
          uint64_t v25 = [v24 metadata];
          v26 = [v25 objectForKeyedSubscript:v6];
          char v27 = [v26 objectForKeyedSubscript:v8];
          +[NSString stringWithFormat:@"Invalid VDAF plist parameter (%@) = %@", v8, v27];
          v28 = LABEL_20:;
          double v29 = +[_DPDediscoError errorWithCode:701 description:v28];

          [v29 logAndStoreInError:a3];
          BOOL v23 = 0;
          goto LABEL_21;
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v42[0] = kDPVDAFNumOfProofs;
  v42[1] = kDPPINEWraparoundCheckCount;
  id obj = +[NSArray arrayWithObjects:v42 count:2];
  id v14 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v35;
    while (2)
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * (void)j);
        v19 = [(_DPTaskProv *)self donation];
        v20 = [v19 algorithmParameters];
        id v21 = [v20 objectForKeyedSubscript:v18];
        objc_opt_class();
        char v22 = objc_opt_isKindOfClass();

        if ((v22 & 1) == 0)
        {
          v24 = [(_DPTaskProv *)self donation];
          uint64_t v25 = [v24 metadata];
          v26 = [v25 objectForKeyedSubscript:kDPMetadataVDAF];
          char v27 = [v26 objectForKeyedSubscript:v18];
          +[NSString stringWithFormat:@"Invalid VDAF metadata parameter (%@) = %@", v18, v27];
          goto LABEL_20;
        }
      }
      id v15 = [obj countByEnumeratingWithState:&v34 objects:v43 count:16];
      BOOL v23 = 1;
      if (v15) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v23 = 1;
  }
LABEL_21:

  return v23;
}

- (id)encodedVDAFConfigWithEncodedDPConfig:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = [(_DPTaskProv *)self donation];
  id v8 = [v7 dimension];

  unsigned int v9 = [(_DPTaskProv *)self vdafType];
  id v67 = v6;
  switch(v9)
  {
    case 0xFFFF1003:
      v65 = [(_DPTaskProv *)self donation];
      v63 = [v65 algorithmParameters];
      double v62 = [v63 objectForKeyedSubscript:kDPVDAFPrio3SumVectorBitWidth];
      unsigned int v55 = [v62 unsignedCharValue];
      uint64_t v10 = [(_DPTaskProv *)self donation];
      v11 = [v10 metadata];
      v12 = [v11 objectForKeyedSubscript:kDPMetadataVDAF];
      uint64_t v13 = [v12 objectForKeyedSubscript:kDPMetadataVDAFPrio3SumVectorChunkLength];
      id v14 = [v13 unsignedIntValue];
      id v15 = [(_DPTaskProv *)self donation];
      uint64_t v16 = [v15 algorithmParameters];
      [v16 objectForKeyedSubscript:kDPVDAFNumOfProofs];
      v17 = a4;
      v19 = id v18 = v8;
      id v20 = [v19 unsignedCharValue];
      id v21 = v14;
      id v6 = v67;
      char v22 = +[_DPPPM_0_2_1_PayloadEncoderShim encodedPrio3SumVectorVDAFConfigWithLength:v18 bits:v55 chunkLength:v21 numProofs:v20 encodedDPConfig:v67 error:v17];

      goto LABEL_15;
    case 0xFFFF1004:
      id v44 = [(_DPTaskProv *)self donation];
      uint64_t v45 = [v44 metadata];
      uint64_t v25 = [v45 objectForKeyedSubscript:kDPMetadataVDAF];

      v46 = [(_DPTaskProv *)self donation];
      char v27 = [v46 algorithmParameters];

      if (![(_DPTaskProv06 *)self validatePINEParametersWithError:a4]) {
        goto LABEL_13;
      }
      v66 = [v25 objectForKeyedSubscript:kDPMetadataPINEL2NormBoundInt];
      id v61 = [v66 unsignedLongLongValue];
      double v64 = [v25 objectForKeyedSubscript:kDPMetadataPINEFractionalBitCount];
      unsigned int v58 = [v64 unsignedIntValue];
      v28 = [v25 objectForKeyedSubscript:kDPMetadataPINEChunkLength];
      unsigned int v54 = [v28 unsignedIntValue];
      double v29 = [v25 objectForKeyedSubscript:kDPMetadataPINEChunkLengthNormEquality];
      id v47 = [v29 unsignedIntValue];
      v31 = [v27 objectForKeyedSubscript:kDPVDAFNumOfProofs];
      id v48 = [v31 unsignedCharValue];
      [v27 objectForKeyedSubscript:kDPPINEWraparoundCheckCount];
      v34 = id v49 = v8;
      LOWORD(v51) = (unsigned __int16)[v34 unsignedCharValue];
      uint64_t v35 = +[_DPPPM_0_2_1_PayloadEncoderShim encodedPINE64VDAFConfigWithL2NormBound:v61 numFractionalBits:v58 length:v49 chunkLength:v54 chunkLengthNormEquality:v47 numProofs:v48 wraparoundCheckCount:v51 encodedDPConfig:v67 error:a4];
      goto LABEL_12;
    case 0xFFFF1005:
      BOOL v23 = [(_DPTaskProv *)self donation];
      v24 = [v23 metadata];
      uint64_t v25 = [v24 objectForKeyedSubscript:kDPMetadataVDAF];

      v26 = [(_DPTaskProv *)self donation];
      char v27 = [v26 algorithmParameters];

      if (![(_DPTaskProv06 *)self validatePINEParametersWithError:a4]) {
        goto LABEL_13;
      }
      v66 = [v25 objectForKeyedSubscript:kDPMetadataPINEL2NormBoundInt];
      id v59 = [v66 unsignedLongLongValue];
      double v64 = [v25 objectForKeyedSubscript:kDPMetadataPINEFractionalBitCount];
      unsigned int v56 = [v64 unsignedIntValue];
      v28 = [v25 objectForKeyedSubscript:kDPMetadataPINEChunkLength];
      unsigned int v52 = [v28 unsignedIntValue];
      double v29 = [v25 objectForKeyedSubscript:kDPMetadataPINEChunkLengthNormEquality];
      id v30 = [v29 unsignedIntValue];
      v31 = [v27 objectForKeyedSubscript:kDPVDAFNumOfProofs];
      id v32 = [v31 unsignedCharValue];
      [v27 objectForKeyedSubscript:kDPPINEWraparoundCheckCount];
      v34 = id v33 = v8;
      LOWORD(v51) = (unsigned __int16)[v34 unsignedCharValue];
      uint64_t v35 = +[_DPPPM_0_2_1_PayloadEncoderShim encodedPINE32VDAFConfigWithL2NormBound:v59 numFractionalBits:v56 length:v33 chunkLength:v52 chunkLengthNormEquality:v30 numProofs:v32 wraparoundCheckCount:v51 encodedDPConfig:v67 error:a4];
      goto LABEL_12;
    case 0xFFFF1006:
      long long v36 = [(_DPTaskProv *)self donation];
      long long v37 = [v36 metadata];
      uint64_t v25 = [v37 objectForKeyedSubscript:kDPMetadataVDAF];

      long long v38 = [(_DPTaskProv *)self donation];
      char v27 = [v38 algorithmParameters];

      if ([(_DPTaskProv06 *)self validatePINEParametersWithError:a4])
      {
        v66 = [v25 objectForKeyedSubscript:kDPMetadataPINEL2NormBoundInt];
        id v60 = [v66 unsignedLongLongValue];
        double v64 = [v25 objectForKeyedSubscript:kDPMetadataPINEFractionalBitCount];
        unsigned int v57 = [v64 unsignedIntValue];
        v28 = [v25 objectForKeyedSubscript:kDPMetadataPINEChunkLength];
        unsigned int v53 = [v28 unsignedIntValue];
        double v29 = [v25 objectForKeyedSubscript:kDPMetadataPINEChunkLengthNormEquality];
        id v39 = [v29 unsignedIntValue];
        v31 = [v27 objectForKeyedSubscript:kDPVDAFNumOfProofs];
        id v40 = [v31 unsignedCharValue];
        [v27 objectForKeyedSubscript:kDPPINEWraparoundCheckCount];
        v34 = id v41 = v8;
        LOWORD(v51) = (unsigned __int16)[v34 unsignedCharValue];
        uint64_t v35 = +[_DPPPM_0_2_1_PayloadEncoderShim encodedPINE40VDAFConfigWithL2NormBound:v60 numFractionalBits:v57 length:v41 chunkLength:v53 chunkLengthNormEquality:v39 numProofs:v40 wraparoundCheckCount:v51 encodedDPConfig:v67 error:a4];
LABEL_12:
        char v22 = (void *)v35;
      }
      else
      {
LABEL_13:
        char v22 = 0;
      }

      id v6 = v67;
LABEL_15:

      return v22;
    default:
      if (v9 == -65536)
      {
        char v22 = +[_DPPPM_0_2_1_PayloadEncoderShim encodedPrio2VDAFConfigWithLength:v8 encodedDPConfig:v6 error:a4];
      }
      else
      {
        v42 = +[NSString stringWithFormat:@"Unknown VDAFType = %u in TaskProv06.", [(_DPTaskProv *)self vdafType]];
        id v43 = +[_DPDediscoError errorWithCode:700 description:v42];

        [v43 logAndStoreInError:a4];
        char v22 = 0;
      }
      goto LABEL_15;
  }
}

@end