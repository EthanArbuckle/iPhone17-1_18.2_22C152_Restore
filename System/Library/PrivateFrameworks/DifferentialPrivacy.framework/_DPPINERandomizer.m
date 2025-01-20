@interface _DPPINERandomizer
+ (BOOL)isValidCentralEpsilon:(double)a3 plistParameter:(id)a4;
+ (id)new;
+ (id)randomizerWithMaxCentralEpsilon:(double)a3 parameters:(id)a4;
- (BOOL)isDPMechanismNoneForMetadata:(id)a3;
- (NSDictionary)plistParameter;
- (_DPPINERandomizer)init;
- (_DPPINERandomizer)initWithMaxCentralEpsilon:(double)a3 parameter:(id)a4;
- (double)maxCentralEpsilon;
- (id)addNoiseToData:(id)a3 metadata:(id)a4;
- (id)auditedMetadata:(id)a3;
- (id)pineParameterWithMetadata:(id)a3;
- (id)randomizeFloatVector:(id)a3 metadata:(id)a4;
- (id)randomizeFloatVectors:(id)a3 metadata:(id)a4 forKey:(id)a5;
- (id)recordWithShardResult:(id)a3 metadata:(id)a4 key:(id)a5;
@end

@implementation _DPPINERandomizer

+ (id)new
{
  return 0;
}

- (_DPPINERandomizer)init
{
  return 0;
}

+ (BOOL)isValidCentralEpsilon:(double)a3 plistParameter:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (a3 >= 0.0 && a3 <= 16.0)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v35[0] = @"MaxCentralDelta";
    v35[1] = @"PINEFractionalBitCount";
    v35[2] = @"MaxDimension";
    v35[3] = @"PINEWraparoundCheckCount";
    v35[4] = @"VDAFType";
    v35[5] = @"VDAFNumOfProofs";
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:6];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * i)];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v26 = +[_DPLog framework];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              +[_DPPINERandomizer isValidCentralEpsilon:plistParameter:].cold.7();
            }

            goto LABEL_25;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    v14 = [v5 objectForKeyedSubscript:@"VDAFType"];
    if (!+[_DPPINEShim isValidPINEType:[v14 unsignedIntValue]])
    {
      v20 = +[_DPLog framework];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[_DPPINERandomizer isValidCentralEpsilon:plistParameter:].cold.6();
      }
      BOOL v27 = 0;
      goto LABEL_41;
    }
    v20 = [v5 objectForKeyedSubscript:@"VDAFNumOfProofs"];
    if (+[_DPPINEShim isValidNumOfProofs:[v20 unsignedCharValue]])
    {
      v21 = [v5 objectForKeyedSubscript:@"PINEWraparoundCheckCount"];
      if (+[_DPPINEShim isValidWraparoundCheckCount:[v21 unsignedCharValue]])
      {
        v22 = [v5 objectForKeyedSubscript:@"MaxCentralDelta"];
        [v22 doubleValue];
        double v24 = v23;

        if (v24 > 0.0)
        {
          v29 = [v5 objectForKeyedSubscript:@"MaxDimension"];
          uint64_t v30 = [v29 unsignedLongLongValue];

          if (+[_DPPrioPlusPlusNoiseGenerator isValidDimension:v30])
          {
            BOOL v27 = 1;
LABEL_40:

LABEL_41:
            goto LABEL_26;
          }
          v25 = +[_DPLog framework];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            +[_DPPINERandomizer isValidCentralEpsilon:plistParameter:](v5, @"MaxDimension");
          }
        }
        else
        {
          v25 = +[_DPLog framework];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            +[_DPPINERandomizer isValidCentralEpsilon:plistParameter:](v5, @"MaxCentralDelta");
          }
        }
      }
      else
      {
        v25 = +[_DPLog framework];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          +[_DPPINERandomizer isValidCentralEpsilon:plistParameter:].cold.4();
        }
      }
    }
    else
    {
      v21 = +[_DPLog framework];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[_DPPINERandomizer isValidCentralEpsilon:plistParameter:].cold.4();
      }
    }
    BOOL v27 = 0;
    goto LABEL_40;
  }
  v14 = +[_DPLog framework];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[_DPPrio3SumVectorRandomizer initWithEpsilon:parameters:](v14, v7, v8, v9, v10, v11, v12, v13);
  }
LABEL_25:
  BOOL v27 = 0;
LABEL_26:

  return v27;
}

- (_DPPINERandomizer)initWithMaxCentralEpsilon:(double)a3 parameter:(id)a4
{
  id v6 = a4;
  if ([(id)objc_opt_class() isValidCentralEpsilon:v6 plistParameter:a3])
  {
    v13.receiver = self;
    v13.super_class = (Class)_DPPINERandomizer;
    uint64_t v7 = [(_DPPINERandomizer *)&v13 init];
    uint64_t v8 = v7;
    if (v7)
    {
      v7->_maxCentralEpsilon = a3;
      uint64_t v9 = [v6 copy];
      plistParameter = v8->_plistParameter;
      v8->_plistParameter = (NSDictionary *)v9;
    }
    self = v8;
    uint64_t v11 = self;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)randomizerWithMaxCentralEpsilon:(double)a3 parameters:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithMaxCentralEpsilon:v6 parameter:a3];

  return v7;
}

- (id)addNoiseToData:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"DediscoTaskConfig"];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"DPConfig"];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"SigmaAfterNormalizing"];
  [v9 doubleValue];
  double v11 = v10;

  uint64_t v12 = [v6 objectForKeyedSubscript:@"DediscoTaskConfig"];

  objc_super v13 = [v12 objectForKeyedSubscript:@"MinBatchSize"];

  if (!v13)
  {
    v20 = +[_DPLog framework];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[_DPPINERandomizer addNoiseToData:metadata:]();
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v13 longLongValue])
  {
    v19 = +[_DPLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[_DPPINERandomizer addNoiseToData:metadata:]();
    }
    goto LABEL_10;
  }
  double v14 = v11 / sqrt((double)[v13 longLongValue]);
  if (!+[_DPPrioPlusPlusNoiseGenerator isValidSigma:v14])
  {
    v19 = +[_DPLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[_DPPINERandomizer addNoiseToData:metadata:](v19, v22, v23, v24, v25, v26, v27, v28);
    }
LABEL_10:

LABEL_14:
    id v18 = 0;
    goto LABEL_15;
  }
  id v15 = [MEMORY[0x1E4F1CA58] dataWithData:v5];
  uint64_t v16 = (float *)[v15 mutableBytes];
  unint64_t v17 = (unint64_t)[v15 length] >> 2;
  _DPClipNorm(v16, v17, 1.0);
  id v18 = +[_DPPrioPlusPlusNoiseGenerator randomize:v15 dimension:v17 stddev:v14];

  if (v18) {
    id v18 = v15;
  }

LABEL_15:
  return v18;
}

- (id)pineParameterWithMetadata:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_DPPINERandomizer *)self plistParameter];
  id v6 = [v5 objectForKeyedSubscript:@"PINEFractionalBitCount"];

  uint64_t v7 = [(_DPPINERandomizer *)self plistParameter];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"VDAFNumOfProofs"];

  uint64_t v9 = [(_DPPINERandomizer *)self plistParameter];
  double v10 = [v9 objectForKeyedSubscript:@"PINEWraparoundCheckCount"];

  double v11 = [(_DPPINERandomizer *)self plistParameter];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"VDAFType"];
  uint64_t v13 = [v12 unsignedIntValue];

  if (_DPMetadataIsV2(v4))
  {
    double v14 = [v4 objectForKeyedSubscript:@"DediscoTaskConfig"];
    id v15 = [v14 objectForKeyedSubscript:@"VDAFConfig"];

    uint64_t v16 = [v15 objectForKeyedSubscript:@"L2NormBoundWithNoise"];
    unint64_t v17 = [v15 objectForKeyedSubscript:@"FractionalBitCount"];

    if (v17)
    {
      id v18 = [v15 objectForKeyedSubscript:@"FractionalBitCount"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || [v18 integerValue] < 0)
      {
        v19 = +[_DPLog framework];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          long long v31 = @"DediscoTaskConfig";
          __int16 v32 = 2112;
          long long v33 = @"VDAFConfig";
          __int16 v34 = 2112;
          v35 = @"FractionalBitCount";
          __int16 v36 = 2112;
          uint64_t v37 = v18;
          _os_log_error_impl(&dword_1DC55E000, v19, OS_LOG_TYPE_ERROR, "Invalid %@.%@.%@=%@", buf, 0x2Au);
        }

        v20 = 0;
LABEL_17:

        id v6 = v18;
        goto LABEL_18;
      }
    }
    else
    {
      id v18 = v6;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v16 floatValue];
      v21 = [_DPPINEParameter alloc];
      uint64_t v22 = [v18 integerValue];
      [v16 floatValue];
      int v24 = v23;
      uint64_t v25 = [v8 integerValue];
      uint64_t v26 = [v10 integerValue];
      LODWORD(v27) = v24;
      v20 = [(_DPPINEParameter *)v21 initWithFractionalBitCount:v22 l2NormBound:v25 numOfProofs:v26 wraparoundCheckCount:v13 pineType:v27];
    }
    else
    {
      uint64_t v28 = +[_DPLog framework];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[_DPPINERandomizer pineParameterWithMetadata:]();
      }

      v20 = 0;
    }
    goto LABEL_17;
  }
  id v15 = +[_DPLog framework];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[_DPPINERandomizer pineParameterWithMetadata:](v15);
  }
  v20 = 0;
LABEL_18:

  return v20;
}

- (BOOL)isDPMechanismNoneForMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(_DPPINERandomizer *)self plistParameter];
  if (+[_DPAlgorithmParameters allowDPMechanismNone:v5])
  {
    char IsDPMechanismNone = _DPMetadataIsDPMechanismNone(v4);
  }
  else
  {
    char IsDPMechanismNone = 0;
  }

  return IsDPMechanismNone;
}

- (id)auditedMetadata:(id)a3
{
  id v4 = a3;
  if ([(_DPPINERandomizer *)self isDPMechanismNoneForMetadata:v4])
  {
    id v5 = v4;
  }
  else
  {
    id v6 = [(_DPPINERandomizer *)self plistParameter];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"MaxCentralDelta"];
    [v7 doubleValue];

    [(_DPPINERandomizer *)self maxCentralEpsilon];
    +[_DPRandomizerUtils auditedDPParametersWithMetadata:maxCentralEpsilon:maxCentralDelta:](_DPRandomizerUtils, "auditedDPParametersWithMetadata:maxCentralEpsilon:maxCentralDelta:", v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v8 = v5;

  return v8;
}

- (id)randomizeFloatVector:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v13 = 0;
    goto LABEL_23;
  }
  unint64_t v8 = (unint64_t)[v6 length] >> 2;
  uint64_t v9 = [(_DPPINERandomizer *)self plistParameter];
  double v10 = [v9 objectForKeyedSubscript:@"MaxDimension"];
  unint64_t v11 = [v10 unsignedLongLongValue];

  if (v8 > v11)
  {
    uint64_t v12 = +[_DPLog framework];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_DPPINERandomizer randomizeFloatVector:metadata:]();
    }
    goto LABEL_16;
  }
  uint64_t v12 = [(_DPPINERandomizer *)self pineParameterWithMetadata:v7];
  if (v12)
  {
    if ([(_DPPINERandomizer *)self isDPMechanismNoneForMetadata:v7])
    {
      double v14 = +[_DPLog framework];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[_DPPINERandomizer randomizeFloatVector:metadata:].cold.4(v14);
      }

      id v15 = v6;
      goto LABEL_12;
    }
    id v15 = [(_DPPINERandomizer *)self addNoiseToData:v6 metadata:v7];
    if (v15)
    {
LABEL_12:
      id v16 = v15;
      float v17 = _DPL2Norm((float *)[v16 bytes], v8);
      [v12 l2NormBound];
      if (v17 <= v18)
      {
        id v22 = 0;
        uint64_t v13 = +[_DPPINEShim shard:v16 parameter:v12 error:&v22];
        v19 = v22;
        if (!v13)
        {
          v20 = +[_DPLog framework];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[_DPPINERandomizer randomizeFloatVector:metadata:]();
          }
        }
      }
      else
      {
        v19 = +[_DPLog framework];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[_DPPINERandomizer randomizeFloatVector:metadata:](v12, v19, v17);
        }
        uint64_t v13 = 0;
      }

      goto LABEL_22;
    }
  }
LABEL_16:
  uint64_t v13 = 0;
LABEL_22:

LABEL_23:
  return v13;
}

- (id)recordWithShardResult:(id)a3 metadata:(id)a4 key:(id)a5
{
  v30[6] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F1C9C8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unint64_t v11 = [v7 dateWithTimeIntervalSinceNow:0.0];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  double v14 = (void *)[v9 mutableCopy];
  v29[0] = @"PINEChunkLength";
  id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "chunkLength"));
  v30[0] = v15;
  v29[1] = @"PINEChunkLengthNormEquality";
  id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "chunkLengthNormEquality"));
  v30[1] = v16;
  v29[2] = @"PINEFractionalBitCount";
  float v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "fractionalBitCount"));
  v30[2] = v17;
  v29[3] = @"PINEL2NormBoundInt";
  float v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v10, "l2NormBoundInt"));
  v30[3] = v18;
  v29[4] = @"Nonce";
  v19 = [v10 nonce];
  v30[4] = v19;
  v29[5] = @"PublicShare";
  v20 = [v10 publicShare];
  v30[5] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:6];
  [v14 setObject:v21 forKeyedSubscript:@"VDAF"];

  id v22 = [_DPPrioRecord alloc];
  int v23 = [v10 inputShares];
  int v24 = [v23 objectAtIndexedSubscript:0];
  uint64_t v25 = [v10 inputShares];
  uint64_t v26 = [v25 objectAtIndexedSubscript:1];
  LODWORD(v20) = [v10 dimension];

  double v27 = [(_DPPrioRecord *)v22 initWithKey:v8 share1:v24 share2:v26 dimension:v20 metadata:v14 creationDate:0 submitted:v13 objectId:0];
  return v27;
}

- (id)randomizeFloatVectors:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v29 = a5;
  id v27 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v31;
    *(void *)&long long v11 = 138412290;
    long long v26 = v11;
    do
    {
      uint64_t v14 = 0;
      do
      {
        id v15 = v9;
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(const void **)(*((void *)&v30 + 1) + 8 * v14);
        float v17 = +[_DPLog daemon];
        float v18 = +[_DPLog daemon];
        os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v18, v16);

        if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1DC55E000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v19, "_DPPINERandomizer", (const char *)&unk_1DC5F5B43, buf, 2u);
        }

        id v9 = [(_DPPINERandomizer *)self auditedMetadata:v15];

        v20 = [(_DPPINERandomizer *)self randomizeFloatVector:v16 metadata:v9];
        v21 = +[_DPLog daemon];
        id v22 = +[_DPLog daemon];
        os_signpost_id_t v23 = os_signpost_id_make_with_pointer(v22, v16);

        if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1DC55E000, v21, OS_SIGNPOST_INTERVAL_END, v23, "_DPPINERandomizer", (const char *)&unk_1DC5F5B43, buf, 2u);
        }

        if (v20)
        {
          int v24 = [(_DPPINERandomizer *)self recordWithShardResult:v20 metadata:v9 key:v29];
          if (v24) {
            [v27 addObject:v24];
          }
        }
        else
        {
          int v24 = +[_DPLog framework];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v26;
            id v35 = v29;
            _os_log_error_impl(&dword_1DC55E000, v24, OS_LOG_TYPE_ERROR, "Fail to private vector with key=%@, continuing...", buf, 0xCu);
          }
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v12);
  }

  return v27;
}

- (double)maxCentralEpsilon
{
  return self->_maxCentralEpsilon;
}

- (NSDictionary)plistParameter
{
  return self->_plistParameter;
}

- (void).cxx_destruct
{
}

+ (void)isValidCentralEpsilon:(void *)a1 plistParameter:(uint64_t)a2 .cold.2(void *a1, uint64_t a2)
{
  v2 = [a1 objectForKeyedSubscript:a2];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1DC55E000, v3, v4, "Invalid parameter in plist: kDPMaxCentralDelta=%@", v5, v6, v7, v8, v9);
}

+ (void)isValidCentralEpsilon:(void *)a1 plistParameter:(uint64_t)a2 .cold.3(void *a1, uint64_t a2)
{
  v2 = [a1 objectForKeyedSubscript:a2];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1DC55E000, v3, v4, "Invalid parameter in plist: kDPPINEMaxDimension=%@", v5, v6, v7, v8, v9);
}

+ (void)isValidCentralEpsilon:plistParameter:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Invalid parameter in plist: kDPVDAFNumOfProofs=%@", v2, v3, v4, v5, v6);
}

+ (void)isValidCentralEpsilon:plistParameter:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Invalid parameter in plist: kDPVDAFType=%@", v2, v3, v4, v5, v6);
}

+ (void)isValidCentralEpsilon:plistParameter:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1DC55E000, v0, v1, "Invalid parameter in plist: key=%@, value= (%@)");
}

- (void)addNoiseToData:metadata:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1DC55E000, v0, v1, "Missing key=%@.%@ in metadata");
}

- (void)addNoiseToData:metadata:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1DC55E000, v0, v1, "Invalid value for %@=%@");
}

- (void)addNoiseToData:(uint64_t)a3 metadata:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DC55E000, a1, a3, "Invalid sigma=%f", a5, a6, a7, a8, 0);
}

- (void)pineParameterWithMetadata:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Invalid VDAFConfig.kDPMetadataVDAFConfigL2NormBoundWithNoise=%@", v2, v3, v4, v5, v6);
}

- (void)pineParameterWithMetadata:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "Metadata V2 is expected", v1, 2u);
}

- (void)randomizeFloatVector:metadata:.cold.1()
{
  OUTLINED_FUNCTION_1();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_2_0(&dword_1DC55E000, v0, v1, "Float vector dimension=%lu exceeds limit=%lu", v2, v3);
}

- (void)randomizeFloatVector:(float)a3 metadata:.cold.2(void *a1, NSObject *a2, float a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v4 = a3;
  [a1 l2NormBound];
  int v6 = 134218240;
  double v7 = v4;
  __int16 v8 = 2048;
  double v9 = v5;
  _os_log_error_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_ERROR, "L2 norm for noised data = %f > norm bound = %f", (uint8_t *)&v6, 0x16u);
}

- (void)randomizeFloatVector:metadata:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Fail to shard with error=%@", v2, v3, v4, v5, v6);
}

- (void)randomizeFloatVector:(os_log_t)log metadata:.cold.4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1DC55E000, log, OS_LOG_TYPE_DEBUG, "DPMechanismNone is detected", v1, 2u);
}

@end