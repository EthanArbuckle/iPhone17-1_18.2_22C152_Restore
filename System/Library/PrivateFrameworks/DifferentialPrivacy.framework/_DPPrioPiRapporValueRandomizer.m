@interface _DPPrioPiRapporValueRandomizer
+ (id)randomizerWithEpsilon:(double)a3 dimensionality:(unint64_t)a4 dynamicVectorSize:(BOOL)a5 piRapporPrime:(unsigned int)a6 piRapporAlpha0:(double)a7 piRapporAlpha1:(double)a8;
- (BOOL)dynamicVectorSize;
- (_DPPrioPiRapporValueRandomizer)init;
- (_DPPrioPiRapporValueRandomizer)initWithEpsilon:(double)a3 dimensionality:(unint64_t)a4 dynamicVectorSize:(BOOL)a5 piRapporPrime:(unsigned int)a6 piRapporAlpha0:(double)a7 piRapporAlpha1:(double)a8;
- (double)epsilon;
- (double)piRapporAlpha0;
- (double)piRapporAlpha1;
- (id)createDPPrioRecordFromPrivatizedShares:(id)a3 forKey:(id)a4 withMetadata:(id)a5 withCreationDate:(double)a6;
- (id)encodeClassIndices:(id)a3 withDimensionality:(unint64_t)a4;
- (id)randomize:(id)a3 metadata:(id)a4;
- (id)randomizeBitValues:(id)a3 forKey:(id)a4;
- (id)randomizeBitValues:(id)a3 metadata:(id)a4 forKey:(id)a5;
- (id)randomizeBitVectors:(id)a3 metadata:(id)a4 forKey:(id)a5;
- (id)randomizeStrings:(id)a3 forKey:(id)a4;
- (id)randomizeVector:(id)a3 metadata:(id)a4;
- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5;
- (unint64_t)getAllocationSizeWithPiRapporAlgorithm:(id)a3 numberOfEncodedIndices:(unint64_t)a4;
- (unint64_t)p;
- (unsigned)piRapporPrime;
@end

@implementation _DPPrioPiRapporValueRandomizer

- (_DPPrioPiRapporValueRandomizer)init
{
  return 0;
}

- (_DPPrioPiRapporValueRandomizer)initWithEpsilon:(double)a3 dimensionality:(unint64_t)a4 dynamicVectorSize:(BOOL)a5 piRapporPrime:(unsigned int)a6 piRapporAlpha0:(double)a7 piRapporAlpha1:(double)a8
{
  v8 = self;
  if (!a4 || ((double v10 = 16.0, a3 >= 0.0) ? (v11 = a3 > 16.0) : (v11 = 1), v11))
  {
LABEL_17:
    v19 = 0;
    goto LABEL_18;
  }
  double v12 = a8;
  double v13 = a7;
  unsigned int v14 = a6;
  if (a6 || a7 != 0.0 || a8 != 0.0) {
    goto LABEL_11;
  }
  unsigned int v17 = (int)a3 - 2;
  if (v17 >= 9)
  {
    v20 = +[_DPLog framework];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      [(_DPPrioPiRapporValueRandomizer *)v20 initWithEpsilon:v22 dimensionality:v23 dynamicVectorSize:v24 piRapporPrime:v25 piRapporAlpha0:v26 piRapporAlpha1:v27];
    }

    goto LABEL_17;
  }
  unsigned int v14 = kPrecomputedPrime[v17];
  double v13 = kPrecomputedAlpha0[v17];
  double v10 = 1.0;
  double v12 = 1.0 - v13;
LABEL_11:
  v29.receiver = self;
  v29.super_class = (Class)_DPPrioPiRapporValueRandomizer;
  v18 = [(_DPPrioPiRapporValueRandomizer *)&v29 init];
  if (v18)
  {
    v18->_piRapporAlpha1 = v12;
    v18->_epsilon = a3;
    v18->_p = a4;
    v18->_dynamicVectorSize = a5;
    v18->_piRapporPrime = v14;
    v18->_piRapporAlpha0 = v13;
  }
  v8 = v18;
  v19 = v8;
LABEL_18:

  return v19;
}

+ (id)randomizerWithEpsilon:(double)a3 dimensionality:(unint64_t)a4 dynamicVectorSize:(BOOL)a5 piRapporPrime:(unsigned int)a6 piRapporAlpha0:(double)a7 piRapporAlpha1:(double)a8
{
  v8 = (void *)[objc_alloc((Class)a1) initWithEpsilon:a4 dimensionality:a5 dynamicVectorSize:*(void *)&a6 piRapporPrime:a3 piRapporAlpha0:a7 piRapporAlpha1:a8];
  return v8;
}

- (id)randomize:(id)a3 metadata:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(_DPPrioPiRapporValueRandomizer *)self p];
  if ([(_DPPrioPiRapporValueRandomizer *)self dynamicVectorSize])
  {
    v9 = [NSString stringWithFormat:@"%@.%@", @"AlgorithmParameters", @"Dimensionality"];
    double v10 = [v7 valueForKeyPath:v9];
    BOOL v11 = v10;
    if (v10) {
      unint64_t v8 = [v10 unsignedIntegerValue];
    }
  }
  if ([v6 unsignedIntegerValue] >= v8)
  {
    double v12 = +[_DPLog framework];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_DPPrioPiRapporValueRandomizer randomize:metadata:]();
    }
    double v13 = 0;
  }
  else
  {
    v15[0] = v6;
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    double v13 = [(_DPPrioPiRapporValueRandomizer *)self encodeClassIndices:v12 withDimensionality:v8];
  }

  return v13;
}

- (id)randomizeVector:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  if ([(_DPPrioPiRapporValueRandomizer *)self dynamicVectorSize]) {
    uint64_t v6 = [v5 length];
  }
  else {
    uint64_t v6 = [(_DPPrioPiRapporValueRandomizer *)self p];
  }
  uint64_t v7 = v6;
  if ([v5 length] == v6)
  {
    unint64_t v8 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    id v9 = v5;
    uint64_t v10 = [v9 bytes];
    if ([v9 length])
    {
      uint64_t v11 = 0;
      while (*(unsigned __int8 *)(v10 + v11) < 2u)
      {
        if (*(unsigned char *)(v10 + v11))
        {
          double v12 = [NSNumber numberWithUnsignedInteger:v11];
          [v8 addObject:v12];
        }
        if (++v11 >= (unint64_t)[v9 length]) {
          goto LABEL_11;
        }
      }
      unsigned int v14 = +[_DPLog framework];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[_DPPrioPiRapporValueRandomizer randomizeVector:metadata:]();
      }
    }
    else
    {
LABEL_11:
      if ([v8 count])
      {
        double v13 = [(_DPPrioPiRapporValueRandomizer *)self encodeClassIndices:v8 withDimensionality:v7];
        goto LABEL_21;
      }
      unsigned int v14 = +[_DPLog framework];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[_DPPrioPiRapporValueRandomizer randomizeVector:metadata:]();
      }
    }
  }
  else
  {
    unint64_t v8 = +[_DPLog framework];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_DPPrioPiRapporValueRandomizer randomizeVector:metadata:](v5, v7, v8);
    }
  }
  double v13 = 0;
LABEL_21:

  return v13;
}

- (id)encodeClassIndices:(id)a3 withDimensionality:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(_DPPrioPiRapporValueRandomizer *)self piRapporPrime];
  [(_DPPrioPiRapporValueRandomizer *)self piRapporAlpha0];
  double v9 = v8;
  [(_DPPrioPiRapporValueRandomizer *)self piRapporAlpha1];
  uint64_t v11 = +[_DPPiRapporAlgorithm piRapporWithNumberOfClasses:a4 prime:v7 alpha0:v9 alpha1:v10];
  if (!v11)
  {
    double v13 = +[_DPLog framework];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_DPPrioPiRapporValueRandomizer encodeClassIndices:withDimensionality:]();
    }
    goto LABEL_7;
  }
  uint64_t v12 = [v6 count];
  if ([(_DPPrioPiRapporValueRandomizer *)self getAllocationSizeWithPiRapporAlgorithm:v11 numberOfEncodedIndices:v12] >= 0x100000)
  {
    double v13 = +[_DPLog framework];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_DPPrioPiRapporValueRandomizer encodeClassIndices:withDimensionality:]();
    }
LABEL_7:
    unsigned int v14 = 0;
    goto LABEL_24;
  }
  [(_DPPrioPiRapporValueRandomizer *)self epsilon];
  double v13 = +[_DPPrioAlgorithm prioWithEpsilon:dimensionality:](_DPPrioAlgorithm, "prioWithEpsilon:dimensionality:", v12 * [v11 prime], v15);
  if (!v13)
  {
    v28 = +[_DPLog framework];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[_DPPrioPiRapporValueRandomizer encodeClassIndices:withDimensionality:]();
    }
    goto LABEL_22;
  }
  v16 = (void *)MEMORY[0x1E019F810]();
  unsigned int v17 = [v11 encodeClassIndices:v6];
  if (!v17)
  {
    objc_super v29 = +[_DPLog framework];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[_DPPrioPiRapporValueRandomizer encodeClassIndices:withDimensionality:].cold.4();
    }

    v28 = 0;
    goto LABEL_22;
  }
  v18 = v17;
  id v19 = [v17 phi0];
  uint64_t v20 = [v19 bytes];

  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  v33 = __72___DPPrioPiRapporValueRandomizer_encodeClassIndices_withDimensionality___block_invoke;
  v34 = &unk_1E6C44810;
  uint64_t v37 = v12;
  uint64_t v38 = v20;
  id v21 = v11;
  id v35 = v21;
  id v36 = v6;
  uint64_t v22 = [v13 privatizeDataWithLocalDP:0 withBlock:&v31];
  uint64_t v23 = objc_msgSend(v22, "count", v31, v32, v33, v34);
  if (v23)
  {
    uint64_t v24 = [v22 mutableCopy];
    uint64_t v25 = [NSNumber numberWithUnsignedInteger:v12];
    [v24 setObject:v25 forKeyedSubscript:@"numberOfEncodedIndices"];

    uint64_t v26 = [v18 otherPhi];
    [v24 setObject:v26 forKeyedSubscript:@"otherPhi"];

    uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "numberOfClasses"));
    [v24 setObject:v27 forKeyedSubscript:@"dimensionality"];

    v28 = [v24 copy];
  }
  else
  {
    uint64_t v24 = +[_DPLog framework];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[_DPPrioPiRapporValueRandomizer encodeClassIndices:withDimensionality:].cold.5();
    }
    v28 = 0;
  }

  if (!v23)
  {
LABEL_22:
    unsigned int v14 = 0;
    goto LABEL_23;
  }
  v28 = v28;
  unsigned int v14 = v28;
LABEL_23:

LABEL_24:
  return v14;
}

- (unint64_t)getAllocationSizeWithPiRapporAlgorithm:(id)a3 numberOfEncodedIndices:(unint64_t)a4
{
  id v5 = a3;
  unint64_t v6 = prio_share_length([v5 prime] * a4);
  unint64_t v7 = +[_DPPrioSeedablePRNG seedLength];
  uint64_t v8 = [v5 numberOfOtherPhi];

  return v7 + 4 * v6 + 8 * a4 * v8 + 56;
}

- (id)createDPPrioRecordFromPrivatizedShares:(id)a3 forKey:(id)a4 withMetadata:(id)a5 withCreationDate:(double)a6
{
  id v10 = a3;
  id v38 = a4;
  id v37 = a5;
  uint64_t v11 = [v10 objectForKeyedSubscript:@"share1"];
  uint64_t v12 = [v10 objectForKeyedSubscript:@"share2"];
  double v13 = [v10 objectForKeyedSubscript:@"numberOfEncodedIndices"];
  uint64_t v14 = [v13 unsignedIntegerValue];

  double v15 = [v10 objectForKeyedSubscript:@"otherPhi"];
  v16 = [[_DPDediscoPrioPiRapporShare alloc] initWithPrioShare:v11 numberOfEncodedIndices:v14 piRapporOtherPhi:v15];
  id v40 = 0;
  unsigned int v17 = [(_DPDediscoPrioPiRapporShare *)v16 serializeAndReturnError:&v40];
  id v18 = v40;
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = +[_DPLog framework];
    if (os_log_type_enabled(&v20->super, OS_LOG_TYPE_ERROR)) {
      -[_DPPrioPiRapporValueRandomizer createDPPrioRecordFromPrivatizedShares:forKey:withMetadata:withCreationDate:]();
    }
    id v21 = 0;
  }
  else
  {
    id v36 = v17;
    uint64_t v20 = [[_DPDediscoPrioPiRapporShare alloc] initWithPrioShare:v12 numberOfEncodedIndices:v14 piRapporOtherPhi:v15];
    id v39 = 0;
    uint64_t v22 = [(_DPDediscoPrioPiRapporShare *)v20 serializeAndReturnError:&v39];
    id v19 = v39;
    if (v19)
    {
      uint64_t v23 = +[_DPLog framework];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[_DPPrioPiRapporValueRandomizer createDPPrioRecordFromPrivatizedShares:forKey:withMetadata:withCreationDate:]();
      }
      id v21 = 0;
    }
    else
    {
      v34 = v12;
      id v35 = v22;
      uint64_t v32 = objc_msgSend(v10, "objectForKeyedSubscript:");
      uint64_t v24 = objc_opt_new();
      uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[_DPPrioPiRapporValueRandomizer piRapporPrime](self, "piRapporPrime"));
      [v24 setObject:v25 forKeyedSubscript:@"PiRapporPrime"];

      uint64_t v26 = NSNumber;
      [(_DPPrioPiRapporValueRandomizer *)self piRapporAlpha0];
      uint64_t v27 = objc_msgSend(v26, "numberWithDouble:");
      [v24 setObject:v27 forKeyedSubscript:@"PiRapporAlpha0"];

      v28 = NSNumber;
      [(_DPPrioPiRapporValueRandomizer *)self piRapporAlpha1];
      objc_super v29 = objc_msgSend(v28, "numberWithDouble:");
      [v24 setObject:v29 forKeyedSubscript:@"PiRapporAlpha1"];

      uint64_t v23 = v32;
      v30 = (void *)[v37 mutableCopy];
      v33 = v24;
      [v30 setObject:v24 forKeyedSubscript:@"AlgorithmParameters"];
      if ([(_DPPrioPiRapporValueRandomizer *)self dynamicVectorSize]) {
        [v30 setObject:v32 forKeyedSubscript:@"dimensionality"];
      }
      uint64_t v22 = v35;
      id v21 = [[_DPPrioRecord alloc] initWithKey:v38 share1:v36 share2:v35 dimension:[v32 longLongValue] metadata:v30 creationDate:0 submitted:a6 objectId:0];

      uint64_t v12 = v34;
    }

    unsigned int v17 = v36;
  }

  return v21;
}

- (id)randomizeStrings:(id)a3 forKey:(id)a4
{
  return 0;
}

- (id)randomizeWords:(id)a3 fragmentWidth:(unint64_t)a4 forKey:(id)a5
{
  return 0;
}

- (id)randomizeBitValues:(id)a3 forKey:(id)a4
{
  return 0;
}

- (id)randomizeBitValues:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  uint64_t v14 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v8;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = -[_DPPrioPiRapporValueRandomizer randomize:metadata:](self, "randomize:metadata:", *(void *)(*((void *)&v23 + 1) + 8 * i), v9, (void)v23);
        if ([v20 count])
        {
          id v21 = [(_DPPrioPiRapporValueRandomizer *)self createDPPrioRecordFromPrivatizedShares:v20 forKey:v10 withMetadata:v9 withCreationDate:v13];
          if (v21) {
            [v14 addObject:v21];
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }

  return v14;
}

- (id)randomizeBitVectors:(id)a3 metadata:(id)a4 forKey:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  uint64_t v14 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v8;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = -[_DPPrioPiRapporValueRandomizer randomizeVector:metadata:](self, "randomizeVector:metadata:", *(void *)(*((void *)&v23 + 1) + 8 * i), v9, (void)v23);
        if ([v20 count])
        {
          id v21 = [(_DPPrioPiRapporValueRandomizer *)self createDPPrioRecordFromPrivatizedShares:v20 forKey:v10 withMetadata:v9 withCreationDate:v13];
          if (v21) {
            [v14 addObject:v21];
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }

  return v14;
}

- (unsigned)piRapporPrime
{
  return self->_piRapporPrime;
}

- (double)piRapporAlpha0
{
  return self->_piRapporAlpha0;
}

- (double)piRapporAlpha1
{
  return self->_piRapporAlpha1;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (unint64_t)p
{
  return self->_p;
}

- (BOOL)dynamicVectorSize
{
  return self->_dynamicVectorSize;
}

- (void)initWithEpsilon:(uint64_t)a3 dimensionality:(uint64_t)a4 dynamicVectorSize:(uint64_t)a5 piRapporPrime:(uint64_t)a6 piRapporAlpha0:(uint64_t)a7 piRapporAlpha1:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)randomize:metadata:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1DC55E000, v1, OS_LOG_TYPE_ERROR, "Input bit position should be less than dimensionality (%lu), instead got %lu.", v2, 0x16u);
}

- (void)randomizeVector:metadata:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1DC55E000, v0, v1, "Pi-Rappor cannot encode 0-hot vector.", v2, v3, v4, v5, v6);
}

- (void)randomizeVector:metadata:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Encountered a value at vector index %lu that is neither 0 nor 1.", v2, v3, v4, v5, v6);
}

- (void)randomizeVector:(NSObject *)a3 metadata:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = [a1 length];
  _os_log_error_impl(&dword_1DC55E000, a3, OS_LOG_TYPE_ERROR, "Prio + Pi-Rappor expects dimensionality to be %lu, instead got %lu", (uint8_t *)&v4, 0x16u);
}

- (void)encodeClassIndices:withDimensionality:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1DC55E000, v0, v1, "Failed to initialize Pi-Rappor algorithm.", v2, v3, v4, v5, v6);
}

- (void)encodeClassIndices:withDimensionality:.cold.2()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1DC55E000, v0, v1, "The allocation size with Prio + Pi-Rappor exceeds the 1MB limit.", v2, v3, v4, v5, v6);
}

- (void)encodeClassIndices:withDimensionality:.cold.3()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1DC55E000, v0, v1, "Failed to initialize Prio algorithm.", v2, v3, v4, v5, v6);
}

- (void)encodeClassIndices:withDimensionality:.cold.4()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1DC55E000, v0, v1, "Pi-Rappor algorithm failed to encode all hot bits.", v2, v3, v4, v5, v6);
}

- (void)encodeClassIndices:withDimensionality:.cold.5()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1DC55E000, v0, v1, "Prio algorithm failed to encode outputs from Pi-Rappor algorithm.", v2, v3, v4, v5, v6);
}

- (void)createDPPrioRecordFromPrivatizedShares:forKey:withMetadata:withCreationDate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Failed to serialize shares for Prio + Pi-Rappor, error: %@", v2, v3, v4, v5, v6);
}

@end