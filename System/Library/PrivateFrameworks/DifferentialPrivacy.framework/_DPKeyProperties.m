@interface _DPKeyProperties
+ (_DPKeyProperties)keyPropertiesWithName:(id)a3 fromDictionary:(id)a4;
+ (id)keyPropertiesForName:(id)a3;
+ (id)parametersForAlgorithm:(id)a3 properties:(id)a4 epsilon:(id)a5 fragmentWidth:(unint64_t)a6;
+ (id)propertiesFromFile:(id)a3;
+ (void)initialize;
- (BOOL)approvedForNonDNU;
- (BOOL)bitStringAlgorithm;
- (BOOL)directUpload;
- (BOOL)keyPatternsAllowed;
- (BOOL)telemetryAllowed;
- (NSDictionary)parameterDictionary;
- (NSNumber)acceptableError;
- (NSNumber)privacyParameter;
- (NSString)huffmanTableClass;
- (NSString)namespaceName;
- (NSString)noiseDistribution;
- (NSString)propertiesName;
- (NSString)serverAlgorithmString;
- (_DPKeyProperties)init;
- (_DPKeyProperties)initWithPropertyName:(id)a3 dictionary:(id)a4;
- (_DPPrivacyBudget)budget;
- (_DPValueRange)possibleRange;
- (_DPValueRange)trimmedScale;
- (id)description;
- (id)privatizationAlgorithmString;
- (unint64_t)dataAlgorithm;
- (unint64_t)fragmentWidth;
- (unint64_t)privatizationAlgorithm;
- (unint64_t)submissionPriority;
- (unint64_t)transparencyLogLifetime;
- (unint64_t)transport;
@end

@implementation _DPKeyProperties

+ (void)initialize
{
  if (initialize_onceToken_2 != -1) {
    dispatch_once(&initialize_onceToken_2, &__block_literal_global_15);
  }
}

+ (id)parametersForAlgorithm:(id)a3 properties:(id)a4 epsilon:(id)a5 fragmentWidth:(unint64_t)a6
{
  unint64_t v25 = a6;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  context = (void *)MEMORY[0x1E019F810]();
  v11 = [v9 objectForKeyedSubscript:@"AlgorithmParameters"];
  v12 = +[_DPAlgorithmParameters algorithmParametersForKey:v8];
  v13 = (void *)[v12 mutableCopy];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        v20 = objc_msgSend(v14, "objectForKeyedSubscript:", v19, v25);
        [v13 setObject:v20 forKeyedSubscript:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v16);
  }

  v21 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  if ([(id)kAlgorithmsWithEpsilon containsObject:v8])
  {
    [v21 setObject:v10 forKeyedSubscript:@"epsilon"];
    [v21 addEntriesFromDictionary:v13];
  }
  if ((objc_msgSend(v8, "isEqualToString:", @"SequenceFragmentPuzzle+CountMedianSketch", v25) & 1) != 0
    || [v8 isEqualToString:@"SequenceFragmentPuzzle+HadamardCountMedianSketch"])
  {
    v22 = [NSNumber numberWithUnsignedInteger:v26];
    [v21 setObject:v22 forKeyedSubscript:@"fragmentWidth"];
  }
  v23 = (void *)[v21 copy];

  return v23;
}

- (_DPKeyProperties)init
{
  return 0;
}

- (_DPKeyProperties)initWithPropertyName:(id)a3 dictionary:(id)a4
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v110.receiver = self;
  v110.super_class = (Class)_DPKeyProperties;
  id v9 = [(_DPKeyProperties *)&v110 init];
  id v10 = v9;
  if (!v9) {
    goto LABEL_78;
  }
  if (!v7)
  {
    id v14 = +[_DPLog framework];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_DPKeyProperties initWithPropertyName:dictionary:]();
    }

    goto LABEL_31;
  }
  objc_storeStrong((id *)&v9->_propertiesName, a3);
  v11 = [v8 objectForKeyedSubscript:@"Transport"];
  v12 = v11;
  if (!v11) {
    goto LABEL_13;
  }
  if (![v11 isEqualToString:@"parsec"])
  {
    if ([v12 isEqualToString:@"PrivateCloud"])
    {
      uint64_t v13 = 3;
      goto LABEL_14;
    }
    if ([v12 isEqualToString:@"Dedisco"])
    {
      uint64_t v13 = 4;
      goto LABEL_14;
    }
LABEL_13:
    uint64_t v13 = 1;
    goto LABEL_14;
  }
  uint64_t v13 = 2;
LABEL_14:
  v10->_transport = v13;
  uint64_t v15 = [v8 objectForKeyedSubscript:@"DirectUpload"];
  v10->_directUpload = [v15 BOOLValue];

  uint64_t v16 = [v8 objectForKeyedSubscript:@"DataAlgorithm"];
  if (!v16)
  {
    uint64_t v19 = +[_DPLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[_DPKeyProperties initWithPropertyName:dictionary:]();
    }
    goto LABEL_30;
  }
  uint64_t v17 = [(id)kDataAlgorithmsMap objectForKeyedSubscript:v16];
  v10->_dataAlgorithm = [v17 unsignedIntegerValue];

  if (!v10->_dataAlgorithm)
  {
    uint64_t v19 = +[_DPLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[_DPKeyProperties initWithPropertyName:dictionary:]((uint64_t)&v10->_dataAlgorithm, v19, v28, v29, v30, v31, v32, v33);
    }
    goto LABEL_30;
  }
  v18 = [v8 objectForKeyedSubscript:@"FragmentWidth"];
  v10->_fragmentWidth = [v18 unsignedIntegerValue];

  if (!v10->_fragmentWidth) {
    v10->_fragmentWidth = 2;
  }
  if (v10->_transport != 3)
  {
    uint64_t v19 = [v8 objectForKeyedSubscript:@"PrivacyParameter"];
    if (!v19)
    {
      v21 = +[_DPLog framework];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[_DPKeyProperties initWithPropertyName:dictionary:].cold.8();
      }
      goto LABEL_29;
    }
    objc_storeStrong((id *)&v10->_privacyParameter, v19);
    [(NSNumber *)v10->_privacyParameter doubleValue];
    if (isInvalidEpsilon(v20))
    {
      v21 = +[_DPLog framework];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[_DPKeyProperties initWithPropertyName:dictionary:].cold.9((uint64_t)&v10->_privacyParameter, v21, v22, v23, v24, v25, v26, v27);
      }
LABEL_29:

LABEL_30:
      goto LABEL_31;
    }
  }
  v35 = [v8 objectForKeyedSubscript:@"KeyPatternsAllowed"];
  v10->_keyPatternsAllowed = [v35 BOOLValue];

  v36 = [v8 objectForKeyedSubscript:@"SubmissionPriority"];
  v10->_submissionPriority = [v36 unsignedIntegerValue];

  if (!v10->_submissionPriority) {
    v10->_submissionPriority = kLowestSubmissionPriority;
  }
  uint64_t v37 = [v8 objectForKeyedSubscript:@"ServerAlgorithmString"];
  v38 = (void *)v37;
  if (!v37)
  {
    v105 = +[_DPLog framework];
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
      -[_DPKeyProperties initWithPropertyName:dictionary:].cold.4();
    }
    int v51 = 1;
    goto LABEL_77;
  }
  v101 = (void *)v37;
  v104 = v16;
  v102 = v12;
  id v103 = v7;
  uint64_t v39 = [v8 objectForKeyedSubscript:@"ServerAlgorithmString"];
  serverAlgorithmString = v10->_serverAlgorithmString;
  v10->_serverAlgorithmString = (NSString *)v39;

  uint64_t v41 = [(id)objc_opt_class() parametersForAlgorithm:v10->_serverAlgorithmString properties:v8 epsilon:v10->_privacyParameter fragmentWidth:v10->_fragmentWidth];
  parameterDictionary = v10->_parameterDictionary;
  v10->_parameterDictionary = (NSDictionary *)v41;

  v105 = [v8 objectForKeyedSubscript:@"PrivatizationAlgorithm"];
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v43 = (id)kAlgorithmStringsMap;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v106 objects:v111 count:16];
  if (!v44) {
    goto LABEL_47;
  }
  uint64_t v45 = v44;
  uint64_t v46 = *(void *)v107;
  while (2)
  {
    for (uint64_t i = 0; i != v45; ++i)
    {
      if (*(void *)v107 != v46) {
        objc_enumerationMutation(v43);
      }
      v48 = *(void **)(*((void *)&v106 + 1) + 8 * i);
      v49 = [(id)kAlgorithmStringsMap objectForKeyedSubscript:v48];
      if ([v105 isEqual:v49])
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v52 = v48;

          if (!v52) {
            goto LABEL_63;
          }
          v10->_privatizationAlgorithm = [v52 unsignedIntegerValue];
          v53 = [v8 objectForKeyedSubscript:@"MinimumPossible"];
          uint64_t v54 = [v8 objectForKeyedSubscript:@"MaximumPossible"];
          v55 = (void *)v54;
          uint64_t v16 = v104;
          if (v53 && v54)
          {
            uint64_t v56 = +[_DPValueRange rangeWithMin:v53 max:v54];
            possibleRange = v10->_possibleRange;
            v10->_possibleRange = (_DPValueRange *)v56;
          }
          if (v10->_dataAlgorithm == 1 && !v10->_possibleRange)
          {
            int v51 = 1;
            v38 = v101;
LABEL_75:

            v12 = v102;
            id v7 = v103;
            goto LABEL_76;
          }
          v58 = [v8 objectForKeyedSubscript:@"NoiseDistribution"];
          p_noiseDistribution = (id *)&v10->_noiseDistribution;
          objc_storeStrong((id *)&v10->_noiseDistribution, v58);
          v38 = v101;
          if (v10->_dataAlgorithm != 1
            || ([*p_noiseDistribution isEqualToString:@"Laplace"] & 1) != 0
            || ([*p_noiseDistribution isEqualToString:@"Uniform"] & 1) != 0)
          {
            v60 = [v8 objectForKeyedSubscript:@"BudgetKeyName"];
            if (v60)
            {
              v61 = +[_DPPrivacyBudget budgetWithName:v60];
              objc_storeStrong((id *)&v10->_budget, v61);
              if (v10->_budget)
              {
                v62 = [v8 objectForKeyedSubscript:@"HuffmanTableClass"];
                v100 = v61;
                v63 = v58;
                huffmanTableClass = v10->_huffmanTableClass;
                v10->_huffmanTableClass = v62;
                v97 = v62;

                v65 = [v8 objectForKeyedSubscript:@"AcceptableError"];
                acceptableError = v10->_acceptableError;
                v10->_acceptableError = v65;
                v96 = v65;

                uint64_t v99 = [v8 objectForKeyedSubscript:@"MinimumTrimmed"];
                v98 = [v8 objectForKeyedSubscript:@"MaximumTrimmed"];
                v67 = +[_DPValueRange rangeWithMin:v99 max:v98];
                trimmedScale = v10->_trimmedScale;
                v10->_trimmedScale = v67;
                v69 = v67;

                v58 = v63;
                v61 = v100;
                uint64_t v70 = [v8 objectForKeyedSubscript:@"Namespace"];
                namespaceName = v10->_namespaceName;
                v10->_namespaceName = (NSString *)v70;

                v72 = [v8 objectForKeyedSubscript:@"ApprovedForNonDNU"];
                v10->_approvedForNonDNU = [v72 BOOLValue];

                v73 = [v8 objectForKeyedSubscript:@"TelemetryAllowed"];
                v10->_telemetryAllowed = [v73 BOOLValue];

                v74 = [v8 objectForKeyedSubscript:@"TransparencyLogLifetime"];
                v10->_transparencyLogLifetime = [v74 unsignedIntegerValue];

                v75 = (void *)v99;
                int v51 = 0;
              }
              else
              {
                v82 = +[_DPLog framework];
                if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
                  -[_DPKeyProperties initWithPropertyName:dictionary:].cold.6((uint64_t)v60, v82, v83, v84, v85, v86, v87, v88);
                }
                v75 = v82;
                int v51 = 1;
              }

              goto LABEL_74;
            }
          }
          else
          {
            v60 = +[_DPLog framework];
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
              -[_DPKeyProperties initWithPropertyName:dictionary:].cold.7((uint64_t)v58, v60, v89, v90, v91, v92, v93, v94);
            }
          }
          int v51 = 1;
LABEL_74:

          uint64_t v16 = v104;
          goto LABEL_75;
        }
      }
      else
      {
      }
    }
    uint64_t v45 = [v43 countByEnumeratingWithState:&v106 objects:v111 count:16];
    if (v45) {
      continue;
    }
    break;
  }
LABEL_47:

LABEL_63:
  v52 = +[_DPLog framework];
  uint64_t v16 = v104;
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
    -[_DPKeyProperties initWithPropertyName:dictionary:].cold.5((uint64_t)v105, v52, v76, v77, v78, v79, v80, v81);
  }
  int v51 = 1;
  v12 = v102;
  v38 = v101;
LABEL_76:

LABEL_77:
  if (!v51)
  {
LABEL_78:
    v34 = v10;
    goto LABEL_79;
  }
LABEL_31:
  v34 = 0;
LABEL_79:

  return v34;
}

+ (_DPKeyProperties)keyPropertiesWithName:(id)a3 fromDictionary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithPropertyName:v7 dictionary:v6];

  return (_DPKeyProperties *)v8;
}

+ (id)keyPropertiesForName:(id)a3
{
  id v4 = a3;
  v5 = +[_DPStrings keyPropertiesPath];
  id v6 = [a1 propertiesFromFile:v5];

  id v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  long long v12 = *(_OWORD *)&self->_acceptableError;
  long long v13 = *(_OWORD *)&self->_propertiesName;
  long long v11 = *(_OWORD *)&self->_noiseDistribution;
  privacyParameter = self->_privacyParameter;
  unint64_t transport = self->_transport;
  id v8 = [(_DPKeyProperties *)self privatizationAlgorithmString];
  objc_msgSend(v3, "stringWithFormat:", @"%@: { propertiesName=%@ ; possibleRange=%@ ; acceptableError=%@ ; trimmedScale=%@ ; noiseDistribution=%@ ; budget=%@ ; privacyParameter=%@ ; transport=%ld ; privatizationAlgorithm=%@ ; keyPatternsAllowed=%d ; submissionPriority=%lu ; parameterDictionary=%@ ;  }",
    v5,
    v13,
    v12,
    v11,
    privacyParameter,
    transport,
    v8,
    self->_keyPatternsAllowed,
    self->_submissionPriority,
  id v9 = self->_parameterDictionary);

  return v9;
}

+ (id)propertiesFromFile:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39___DPKeyProperties_propertiesFromFile___block_invoke;
  v9[3] = &unk_1E6C43EF0;
  id v10 = v4;
  id v11 = a1;
  uint64_t v5 = propertiesFromFile__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&propertiesFromFile__onceToken, v9);
  }
  id v7 = (id)allKeyProperties;

  return v7;
}

- (id)privatizationAlgorithmString
{
  v2 = (void *)kAlgorithmStringsMap;
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_DPKeyProperties privatizationAlgorithm](self, "privatizationAlgorithm"));
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  if (v4) {
    uint64_t v5 = (__CFString *)v4;
  }
  else {
    uint64_t v5 = @"UNKNOWN";
  }
  return v5;
}

- (NSString)propertiesName
{
  return self->_propertiesName;
}

- (_DPValueRange)possibleRange
{
  return self->_possibleRange;
}

- (NSNumber)acceptableError
{
  return self->_acceptableError;
}

- (_DPValueRange)trimmedScale
{
  return self->_trimmedScale;
}

- (NSString)noiseDistribution
{
  return self->_noiseDistribution;
}

- (_DPPrivacyBudget)budget
{
  return self->_budget;
}

- (NSNumber)privacyParameter
{
  return self->_privacyParameter;
}

- (unint64_t)fragmentWidth
{
  return self->_fragmentWidth;
}

- (BOOL)directUpload
{
  return self->_directUpload;
}

- (BOOL)bitStringAlgorithm
{
  return self->_bitStringAlgorithm;
}

- (NSString)serverAlgorithmString
{
  return self->_serverAlgorithmString;
}

- (NSDictionary)parameterDictionary
{
  return self->_parameterDictionary;
}

- (BOOL)keyPatternsAllowed
{
  return self->_keyPatternsAllowed;
}

- (unint64_t)submissionPriority
{
  return self->_submissionPriority;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (BOOL)approvedForNonDNU
{
  return self->_approvedForNonDNU;
}

- (BOOL)telemetryAllowed
{
  return self->_telemetryAllowed;
}

- (unint64_t)transparencyLogLifetime
{
  return self->_transparencyLogLifetime;
}

- (unint64_t)dataAlgorithm
{
  return self->_dataAlgorithm;
}

- (unint64_t)privatizationAlgorithm
{
  return self->_privatizationAlgorithm;
}

- (unint64_t)transport
{
  return self->_transport;
}

- (NSString)huffmanTableClass
{
  return self->_huffmanTableClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_huffmanTableClass, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_parameterDictionary, 0);
  objc_storeStrong((id *)&self->_serverAlgorithmString, 0);
  objc_storeStrong((id *)&self->_privacyParameter, 0);
  objc_storeStrong((id *)&self->_budget, 0);
  objc_storeStrong((id *)&self->_noiseDistribution, 0);
  objc_storeStrong((id *)&self->_trimmedScale, 0);
  objc_storeStrong((id *)&self->_acceptableError, 0);
  objc_storeStrong((id *)&self->_possibleRange, 0);
  objc_storeStrong((id *)&self->_propertiesName, 0);
}

- (void)initWithPropertyName:dictionary:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1DC55E000, v0, v1, "nil propertiesName", v2, v3, v4, v5, v6);
}

- (void)initWithPropertyName:dictionary:.cold.2()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1DC55E000, v0, v1, "nil dataAlgorithmString", v2, v3, v4, v5, v6);
}

- (void)initWithPropertyName:(uint64_t)a3 dictionary:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DC55E000, a2, a3, "unknown dataAlgorithmString = %lu", a5, a6, a7, a8, 0);
}

- (void)initWithPropertyName:dictionary:.cold.4()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1DC55E000, v0, v1, "nil serverAlgorithmString", v2, v3, v4, v5, v6);
}

- (void)initWithPropertyName:(uint64_t)a3 dictionary:(uint64_t)a4 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DC55E000, a2, a3, "Unknown privatization algorithm string = %@.", a5, a6, a7, a8, 2u);
}

- (void)initWithPropertyName:(uint64_t)a3 dictionary:(uint64_t)a4 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithPropertyName:(uint64_t)a3 dictionary:(uint64_t)a4 .cold.7(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DC55E000, a2, a3, "Unknown noise distribution = %@.", a5, a6, a7, a8, 2u);
}

- (void)initWithPropertyName:dictionary:.cold.8()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1DC55E000, v0, v1, "nil privacyParameter", v2, v3, v4, v5, v6);
}

- (void)initWithPropertyName:(uint64_t)a3 dictionary:(uint64_t)a4 .cold.9(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DC55E000, a2, a3, "invalid epsilon = %@", a5, a6, a7, a8, 2u);
}

@end