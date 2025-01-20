@interface _DPPrio3SumVectorRandomizer
+ (id)new;
+ (id)randomizerWithEpsilon:(double)a3 parameters:(id)a4;
- (BOOL)addNoiseToData:(id)a3 budgetAuditor:(id)a4 error:(id *)a5;
- (NSDictionary)plistParameters;
- (_DPPrio3SumVectorParameter)parameters;
- (_DPPrio3SumVectorRandomizer)init;
- (_DPPrio3SumVectorRandomizer)initWithEpsilon:(double)a3 parameters:(id)a4;
- (double)defaultLocalEpsilon;
- (id)dimensionFromMetadata:(id)a3;
- (id)randomizeBitValue:(id)a3 budgetAuditor:(id)a4 metadata:(id)a5 error:(id *)a6;
- (id)randomizeBitValues:(id)a3 metadata:(id)a4 forKey:(id)a5;
- (id)randomizeBitVectors:(id)a3 metadata:(id)a4 forKey:(id)a5;
- (id)randomizeVector:(id)a3 budgetAuditor:(id)a4 error:(id *)a5;
- (id)recordWithShardResult:(id)a3 metadata:(id)a4 key:(id)a5;
- (id)shardWithBudgetAuditor:(id)a3 data:(id)a4 error:(id *)a5;
@end

@implementation _DPPrio3SumVectorRandomizer

+ (id)new
{
  return 0;
}

- (_DPPrio3SumVectorRandomizer)init
{
  return 0;
}

- (_DPPrio3SumVectorRandomizer)initWithEpsilon:(double)a3 parameters:(id)a4
{
  id v7 = a4;
  v8 = v7;
  if (a3 >= 0.0 && a3 <= 16.0)
  {
    v10 = [v7 objectForKeyedSubscript:@"Prio3SumVectorBitWidth"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [v10 integerValue] != 1)
    {
      v19 = +[_DPLog framework];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[_DPPrio3SumVectorRandomizer initWithEpsilon:parameters:].cold.4();
      }
      v18 = 0;
      goto LABEL_27;
    }
    v19 = [v8 objectForKeyedSubscript:@"VDAFNumOfProofs"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && +[_DPPrio3SumVectorShim isValidNumOfProofs:[v19 integerValue]])
    {
      v20 = [v8 objectForKeyedSubscript:@"VDAFType"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && +[_DPPrio3SumVectorShim isValidVDAFType:[v20 unsignedIntValue]])
      {
        v27.receiver = self;
        v27.super_class = (Class)_DPPrio3SumVectorRandomizer;
        v21 = [(_DPPrio3SumVectorRandomizer *)&v27 init];
        v22 = v21;
        if (v21)
        {
          v21->_defaultLocalEpsilon = a3;
          objc_storeStrong((id *)&v21->_plistParameters, a4);
          v23 = [[_DPPrio3SumVectorParameter alloc] initWithBitWidth:[v10 integerValue] numOfAggregators:2 numOfProofs:[v19 integerValue] vdafType:[v20 unsignedIntValue]];
          parameters = v22->_parameters;
          v22->_parameters = v23;
        }
        self = v22;
        v18 = self;
        goto LABEL_26;
      }
      v25 = +[_DPLog framework];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[_DPPrio3SumVectorRandomizer initWithEpsilon:parameters:]();
      }
    }
    else
    {
      v20 = +[_DPLog framework];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[_DPPrio3SumVectorRandomizer initWithEpsilon:parameters:]();
      }
    }
    v18 = 0;
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }
  v10 = +[_DPLog framework];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[_DPPrio3SumVectorRandomizer initWithEpsilon:parameters:](v10, v11, v12, v13, v14, v15, v16, v17);
  }
  v18 = 0;
LABEL_28:

  return v18;
}

+ (id)randomizerWithEpsilon:(double)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)a1) initWithEpsilon:v6 parameters:a3];

  return v7;
}

- (BOOL)addNoiseToData:(id)a3 budgetAuditor:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = +[_DPLog framework];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[_DPPrio3SumVectorRandomizer addNoiseToData:budgetAuditor:error:](v9);
    }

    LOBYTE(a5) = 1;
  }
  else
  {
    v10 = [v8 getSymmetricRAPPORLocalEpsilonWithError:a5];
    uint64_t v11 = v10;
    if (v10)
    {
      [v10 doubleValue];
      uint64_t v13 = +[_DPBiasedCoin coinWithBias:(double)(1.0 / (exp(v12) + 1.0))];
      id v14 = v7;
      uint64_t v15 = [v14 mutableBytes];
      if ([v14 length])
      {
        uint64_t v16 = 0;
        while (*(unsigned __int8 *)(v15 + v16) < 2u)
        {
          if ([v13 flip]) {
            *(unsigned char *)(v15 + v16) = *(unsigned char *)(v15 + v16) == 0;
          }
          if (++v16 >= (unint64_t)[v14 length]) {
            goto LABEL_12;
          }
        }
        if (a5)
        {
          uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid value (%d) at position %zu", *(unsigned __int8 *)(v15 + v16), v16);
          _DPVDAFError(3, v17);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

          LOBYTE(a5) = 0;
        }
      }
      else
      {
LABEL_12:
        LOBYTE(a5) = 1;
      }
    }
    else
    {
      LOBYTE(a5) = 0;
    }
  }
  return (char)a5;
}

- (id)dimensionFromMetadata:(id)a3
{
  id v3 = a3;
  if (_DPMetadataIsV2(v3)) {
    [NSString stringWithFormat:@"%@.%@.%@", @"DediscoTaskConfig", @"VDAFConfig", @"Dimensionality"];
  }
  else {
  v4 = [NSString stringWithFormat:@"%@.%@", @"AlgorithmParameters", @"Dimensionality", v9];
  }
  v5 = [v3 valueForKeyPath:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
  }
  else
  {
    id v7 = +[_DPLog framework];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_DPPrio3SumVectorRandomizer dimensionFromMetadata:]();
    }

    id v6 = 0;
  }

  return v6;
}

- (id)shardWithBudgetAuditor:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ([(_DPPrio3SumVectorRandomizer *)self addNoiseToData:v8 budgetAuditor:a3 error:a5])
  {
    uint64_t v9 = [(_DPPrio3SumVectorRandomizer *)self parameters];
    v10 = +[_DPPrio3SumVectorShim shard:v8 parameter:v9 error:a5];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)randomizeBitValue:(id)a3 budgetAuditor:(id)a4 metadata:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  long double v12 = [(_DPPrio3SumVectorRandomizer *)self dimensionFromMetadata:a5];
  uint64_t v13 = v12;
  if (!v12)
  {
    if (a6)
    {
      _DPVDAFError(1, @"Fail to fetch dimension");
      uint64_t v17 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  unint64_t v14 = [v12 unsignedLongValue];
  if (v14 <= 0x186A0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v14 > [v10 unsignedLongValue])
    {
      id v18 = [MEMORY[0x1E4F1CA58] dataWithLength:v14];
      uint64_t v19 = [v18 mutableBytes];
      *(unsigned char *)(v19 + [v10 unsignedLongValue]) = 1;
      uint64_t v17 = [(_DPPrio3SumVectorRandomizer *)self shardWithBudgetAuditor:v11 data:v18 error:a6];

      goto LABEL_14;
    }
    if (a6)
    {
      uint64_t v15 = [NSString stringWithFormat:@"bitValue=(%@) >= dimension=(%@)", v10, v13];
      uint64_t v16 = 2;
      goto LABEL_12;
    }
  }
  else if (a6)
  {
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"dimension=(%lu) should be less than or equal to %zu", v14, 100000);
    uint64_t v16 = 4;
LABEL_12:
    _DPVDAFError(v16, v15);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_13:
  uint64_t v17 = 0;
LABEL_14:

  return v17;
}

- (id)randomizeVector:(id)a3 budgetAuditor:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    if (a5)
    {
      _DPVDAFError(4, @"vector must not be nil");
      id v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if ((unint64_t)[v8 length] > 0x186A0)
  {
    if (a5)
    {
      id v10 = objc_msgSend(NSString, "stringWithFormat:", @"dimension=(%lu) should be less than or equal to %zu", objc_msgSend(v8, "length"), 100000);
      _DPVDAFError(4, v10);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_7:
    id v11 = 0;
    goto LABEL_9;
  }
  long double v12 = [MEMORY[0x1E4F1CA58] dataWithData:v8];
  id v11 = [(_DPPrio3SumVectorRandomizer *)self shardWithBudgetAuditor:v9 data:v12 error:a5];

LABEL_9:
  return v11;
}

- (id)recordWithShardResult:(id)a3 metadata:(id)a4 key:(id)a5
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F1C9C8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 dateWithTimeIntervalSinceNow:0.0];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  unint64_t v14 = (void *)[v9 mutableCopy];
  v27[0] = @"Prio3SumVectorChunkLength";
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "chunkLength"));
  v28[0] = v15;
  v27[1] = @"Nonce";
  uint64_t v16 = [v10 nonce];
  v28[1] = v16;
  v27[2] = @"PublicShare";
  uint64_t v17 = [v10 publicShare];
  v28[2] = v17;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
  [v14 setObject:v18 forKeyedSubscript:@"VDAF"];

  uint64_t v19 = [_DPPrioRecord alloc];
  v20 = [v10 inputShares];
  v21 = [v20 objectAtIndexedSubscript:0];
  v22 = [v10 inputShares];
  v23 = [v22 objectAtIndexedSubscript:1];
  uint64_t v24 = [v10 dimension];

  v25 = [(_DPPrioRecord *)v19 initWithKey:v8 share1:v21 share2:v23 dimension:v24 metadata:v14 creationDate:0 submitted:v13 objectId:0];
  return v25;
}

- (id)randomizeBitValues:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v32 = a5;
  id v10 = [(_DPPrio3SumVectorRandomizer *)self plistParameters];
  id v40 = 0;
  id v11 = +[_DPBudgetAuditor budgetAuditorFromMetadata:v9 plistParameters:v10 error:&v40];
  id v12 = v40;

  if (v11)
  {
    id v39 = v12;
    double v13 = [v11 auditedMetadataWithError:&v39];
    id v14 = v39;

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      obj = v8;
      uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        id v28 = v9;
        id v29 = v8;
        uint64_t v33 = *(void *)v36;
        do
        {
          uint64_t v17 = 0;
          id v18 = v14;
          do
          {
            if (*(void *)v36 != v33) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void *)(*((void *)&v35 + 1) + 8 * v17);
            v20 = +[_DPLog framework];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v42 = v19;
              _os_log_debug_impl(&dword_1DC55E000, v20, OS_LOG_TYPE_DEBUG, "Start to privatize bitValue=%@", buf, 0xCu);
            }

            v21 = (void *)MEMORY[0x1E019F810]();
            id v34 = v18;
            v22 = v11;
            v23 = [(_DPPrio3SumVectorRandomizer *)self randomizeBitValue:v19 budgetAuditor:v11 metadata:v13 error:&v34];
            id v14 = v34;

            if (v23)
            {
              uint64_t v24 = [(_DPPrio3SumVectorRandomizer *)self recordWithShardResult:v23 metadata:v13 key:v32];
              if (v24) {
                [v30 addObject:v24];
              }

              v25 = +[_DPLog framework];
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v42 = v19;
                _os_log_debug_impl(&dword_1DC55E000, v25, OS_LOG_TYPE_DEBUG, "Done to privatize bitValue=%@", buf, 0xCu);
              }
            }
            else
            {
              v26 = +[_DPLog framework];
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v42 = v19;
                __int16 v43 = 2112;
                id v44 = v14;
                _os_log_error_impl(&dword_1DC55E000, v26, OS_LOG_TYPE_ERROR, "Fail to privatize bitValue=%@ with error=%@", buf, 0x16u);
              }
            }
            id v11 = v22;
            ++v17;
            id v18 = v14;
          }
          while (v16 != v17);
          uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
        }
        while (v16);
        id v9 = v28;
        id v8 = v29;
      }
    }
    else
    {
      obj = +[_DPLog framework];
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
        -[_DPPrio3SumVectorRandomizer randomizeBitValues:metadata:forKey:]();
      }
      id v30 = 0;
    }

    id v12 = v14;
  }
  else
  {
    double v13 = +[_DPLog framework];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_DPPrio3SumVectorRandomizer randomizeBitValues:metadata:forKey:]();
    }
    id v30 = 0;
  }

  return v30;
}

- (id)randomizeBitVectors:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v29 = a5;
  id v10 = [(_DPPrio3SumVectorRandomizer *)self plistParameters];
  id v37 = 0;
  id v11 = +[_DPBudgetAuditor budgetAuditorFromMetadata:v9 plistParameters:v10 error:&v37];
  id v12 = v37;

  if (v11)
  {
    id v36 = v12;
    uint64_t v13 = [v11 auditedMetadataWithError:&v36];
    id v14 = v36;

    id v30 = v13;
    if (v13)
    {
      id v27 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      obj = v8;
      uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        id v25 = v9;
        id v26 = v8;
        uint64_t v17 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            uint64_t v19 = v14;
            if (*(void *)v33 != v17) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            v21 = (void *)MEMORY[0x1E019F810]();
            id v31 = v14;
            v22 = [(_DPPrio3SumVectorRandomizer *)self randomizeVector:v20 budgetAuditor:v11 error:&v31];
            id v14 = v31;

            if (v22)
            {
              v23 = [(_DPPrio3SumVectorRandomizer *)self recordWithShardResult:v22 metadata:v30 key:v29];
              if (v23) {
                [v27 addObject:v23];
              }
            }
            else
            {
              v23 = +[_DPLog framework];
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v39 = v20;
                __int16 v40 = 2112;
                id v41 = v14;
                _os_log_error_impl(&dword_1DC55E000, v23, OS_LOG_TYPE_ERROR, "Fail to privatize vector=%@ with error=%@", buf, 0x16u);
              }
            }
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
        }
        while (v16);
        id v9 = v25;
        id v8 = v26;
      }
    }
    else
    {
      obj = +[_DPLog framework];
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
        -[_DPPrio3SumVectorRandomizer randomizeBitValues:metadata:forKey:]();
      }
      id v27 = 0;
    }

    id v12 = v14;
  }
  else
  {
    id v30 = +[_DPLog framework];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[_DPPrio3SumVectorRandomizer randomizeBitValues:metadata:forKey:]();
    }
    id v27 = 0;
  }

  return v27;
}

- (double)defaultLocalEpsilon
{
  return self->_defaultLocalEpsilon;
}

- (NSDictionary)plistParameters
{
  return self->_plistParameters;
}

- (_DPPrio3SumVectorParameter)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_plistParameters, 0);
}

- (void)initWithEpsilon:(uint64_t)a3 parameters:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DC55E000, a1, a3, "Invalid epsilon = %f.", a5, a6, a7, a8, 0);
}

- (void)initWithEpsilon:parameters:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Unknown VDAFType = %@", v2, v3, v4, v5, v6);
}

- (void)initWithEpsilon:parameters:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Invalid numOfProofs = %@", v2, v3, v4, v5, v6);
}

- (void)initWithEpsilon:parameters:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Invalid bitWidth = %@: must be one", v2, v3, v4, v5, v6);
}

- (void)addNoiseToData:(os_log_t)log budgetAuditor:error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1DC55E000, log, OS_LOG_TYPE_DEBUG, "Local DP is not added", v1, 2u);
}

- (void)dimensionFromMetadata:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "key(%@) is required in metadata.", v2, v3, v4, v5, v6);
}

- (void)randomizeBitValues:metadata:forKey:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Failed to create DP budget auditor, error=%@", v2, v3, v4, v5, v6);
}

- (void)randomizeBitValues:metadata:forKey:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Donation failed DP auditing check, error=%@", v2, v3, v4, v5, v6);
}

@end