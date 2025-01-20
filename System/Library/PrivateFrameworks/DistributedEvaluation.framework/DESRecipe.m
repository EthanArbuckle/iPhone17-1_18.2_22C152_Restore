@interface DESRecipe
+ (BOOL)_hasValidClippingBounds:(id)a3 matchValidNumChunks:(id)a4;
+ (BOOL)pluginShouldAddNoiseAndEncryptResult:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (BOOL)transportIsDedisco:(id)a3;
+ (BOOL)useAdaptiveClipping:(id)a3;
+ (BOOL)useAggregatableMetadata:(id)a3;
+ (BOOL)useSparsification:(id)a3;
- (BOOL)isFederatedBufferStaled;
- (BOOL)isFederatedBufferStaled:(id)a3;
- (BOOL)pluginShouldAddNoiseAndEncryptResult;
- (BOOL)transportIsDedisco;
- (BOOL)useAdaptiveClipping;
- (BOOL)useAggregatableMetadata;
- (BOOL)useFederatedBuffer;
- (BOOL)useSparsification;
- (DESRecipe)initWithCoder:(id)a3;
- (NSArray)attachmentPaths;
- (NSArray)attachmentSignatures;
- (NSArray)attachments;
- (NSData)certificate;
- (NSDictionary)parametersUsed;
- (NSDictionary)predicate;
- (NSDictionary)recipeUserInfo;
- (NSNumber)approximateStaleness;
- (NSNumber)federatedBufferDownScalingFactor;
- (NSNumber)maxNorm;
- (NSNumber)normBinCount;
- (NSString)bundleIdentifier;
- (NSString)privacyIdentifier;
- (NSString)privacyIdentifierExt;
- (NSString)recipeID;
- (id)_initWithAssetURL:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5;
- (id)_initWithRecipeResponse:(id)a3 recipeID:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6;
- (id)_initWithRecipeUserInfo:(id)a3 recipeID:(id)a4 bundleIdentifier:(id)a5;
- (id)_initWithRecipeUserInfo:(id)a3 recipeID:(id)a4 bundleIdentifier:(id)a5 predicate:(id)a6;
- (id)_initWithRecipeUserInfo:(id)a3 recipeID:(id)a4 bundleIdentifier:(id)a5 predicate:(id)a6 attachments:(id)a7;
- (id)_inithWithContentsOfFile:(id)a3 recipeID:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6;
- (id)description;
- (id)haruspexKeyWithError:(id *)a3;
- (void)approximateStaleness;
- (void)encodeWithCoder:(id)a3;
- (void)federatedBufferDownScalingFactor;
- (void)setAttachmentPaths:(id)a3;
- (void)setAttachmentSignatures:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setRecipeID:(id)a3;
@end

@implementation DESRecipe

- (id)_inithWithContentsOfFile:(id)a3 recipeID:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v22 = 0;
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v10 options:0 error:&v22];
  id v14 = v22;
  if (v13)
  {
    id v21 = v14;
    v15 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v13 options:0 error:&v21];
    id v16 = v21;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = [(DESRecipe *)self _initWithRecipeUserInfo:v15 recipeID:v11 bundleIdentifier:v12];
    }
    else
    {
      v19 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v24 = v10;
        __int16 v25 = 2112;
        id v26 = v16;
        _os_log_impl(&dword_1BECCB000, v19, OS_LOG_TYPE_INFO, "Unparsable record: %@, %@", buf, 0x16u);
      }

      id v17 = 0;
      if (a6) {
        *a6 = v16;
      }
    }
  }
  else
  {
    v18 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v14;
      _os_log_impl(&dword_1BECCB000, v18, OS_LOG_TYPE_INFO, "Unreadable recipe %@: %@", buf, 0x16u);
    }

    if (a6)
    {
      id v16 = v14;
      id v17 = 0;
      *a6 = v16;
    }
    else
    {
      id v17 = 0;
      id v16 = v14;
    }
  }

  return v17;
}

- (id)_initWithRecipeUserInfo:(id)a3 recipeID:(id)a4 bundleIdentifier:(id)a5
{
  return [(DESRecipe *)self _initWithRecipeUserInfo:a3 recipeID:a4 bundleIdentifier:a5 predicate:0];
}

- (id)_initWithRecipeUserInfo:(id)a3 recipeID:(id)a4 bundleIdentifier:(id)a5 predicate:(id)a6
{
  return [(DESRecipe *)self _initWithRecipeUserInfo:a3 recipeID:a4 bundleIdentifier:a5 predicate:a6 attachments:MEMORY[0x1E4F1CBF0]];
}

- (id)_initWithRecipeUserInfo:(id)a3 recipeID:(id)a4 bundleIdentifier:(id)a5 predicate:(id)a6 attachments:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v32.receiver = self;
  v32.super_class = (Class)DESRecipe;
  id v17 = [(DESRecipe *)&v32 init];
  if (v17)
  {
    uint64_t v18 = [v13 copy];
    recipeID = v17->_recipeID;
    v17->_recipeID = (NSString *)v18;

    uint64_t v20 = [v14 copy];
    bundleIdentifier = v17->_bundleIdentifier;
    v17->_bundleIdentifier = (NSString *)v20;

    uint64_t v22 = [v12 copy];
    recipeUserInfo = v17->_recipeUserInfo;
    v17->_recipeUserInfo = (NSDictionary *)v22;

    uint64_t v24 = [v16 copy];
    attachments = v17->_attachments;
    v17->_attachments = (NSArray *)v24;

    attachmentSignatures = v17->_attachmentSignatures;
    v17->_attachmentSignatures = (NSArray *)MEMORY[0x1E4F1CBF0];

    certificate = v17->_certificate;
    v17->_certificate = 0;

    uint64_t v28 = [v15 copy];
    predicate = v17->_predicate;
    v17->_predicate = (NSDictionary *)v28;

    v30 = v17;
  }

  return v17;
}

- (id)_initWithAssetURL:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v28 = 0;
    id v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v8 options:8 error:&v28];
    id v11 = v28;
    if (!v10)
    {
      if (!a5)
      {
        uint64_t v18 = 0;
LABEL_23:

        goto LABEL_24;
      }
      uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
      v35[0] = *MEMORY[0x1E4F28568];
      id v12 = [NSString stringWithFormat:@"Fail to read URL=(%@)", v8];
      v35[1] = *MEMORY[0x1E4F28A50];
      v36[0] = v12;
      v36[1] = v11;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
      [v20 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:5006 userInfo:v15];
      uint64_t v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      id v13 = v11;
      goto LABEL_21;
    }
    id v27 = v11;
    id v12 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v10 options:0 error:&v27];
    id v13 = v27;

    if (!v12)
    {
      if (!a5)
      {
        uint64_t v18 = 0;
        goto LABEL_22;
      }
      id v26 = (void *)MEMORY[0x1E4F28C58];
      v33[0] = *MEMORY[0x1E4F28568];
      id v15 = [NSString stringWithFormat:@"Fail to decode JSONObject from URL=(%@)", v8];
      v33[1] = *MEMORY[0x1E4F28A50];
      v34[0] = v15;
      v34[1] = v13;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
      [v26 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:5006 userInfo:v16];
      uint64_t v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    id v14 = [v12 objectForKeyedSubscript:@"recipe_blob"];
    id v15 = v14;
    if (v14)
    {
      id v16 = [v14 objectForKeyedSubscript:@"id"];
      if (v16)
      {
        id v25 = v13;
        id v17 = [v12 objectForKeyedSubscript:@"recipe_predicate_client"];
        self = (DESRecipe *)[(DESRecipe *)self _initWithRecipeUserInfo:v15 recipeID:v16 bundleIdentifier:v9 predicate:v17];
        uint64_t v18 = self;
      }
      else
      {
        if (!a5)
        {
          uint64_t v18 = 0;
          goto LABEL_20;
        }
        uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
        id v25 = v13;
        uint64_t v29 = *MEMORY[0x1E4F28568];
        id v17 = [NSString stringWithFormat:@"Missing recipe ID for URL=(%@)", v8];
        v30 = v17;
        id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        *a5 = [v24 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1524 userInfo:v21];

        uint64_t v18 = 0;
      }
    }
    else
    {
      if (!a5)
      {
        uint64_t v18 = 0;
        goto LABEL_21;
      }
      v23 = (void *)MEMORY[0x1E4F28C58];
      id v25 = v13;
      uint64_t v31 = *MEMORY[0x1E4F28568];
      id v16 = [NSString stringWithFormat:@"Missing user info dictionary for URL=(%@)", v8];
      objc_super v32 = v16;
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      [v23 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1524 userInfo:v17];
      uint64_t v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v13 = v25;
LABEL_20:

LABEL_21:
LABEL_22:

    id v11 = v13;
    goto LABEL_23;
  }
  if (a5)
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v37 = *MEMORY[0x1E4F28568];
    v38[0] = @"Nil recipe asset URL";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
    [v19 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:5003 userInfo:v11];
    uint64_t v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

    goto LABEL_25;
  }
  uint64_t v18 = 0;
LABEL_25:

  return v18;
}

- (id)_initWithRecipeResponse:(id)a3 recipeID:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  v150[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v116.receiver = self;
  v116.super_class = (Class)DESRecipe;
  id v13 = [(DESRecipe *)&v116 init];
  if (!v13)
  {
    uint64_t v24 = 0;
    goto LABEL_136;
  }
  id v14 = [v10 objectForKey:@"recipe_signing"];
  if (!v14)
  {
    id v25 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:]();
    }

    if (a6)
    {
      id v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v149 = *MEMORY[0x1E4F28588];
      v150[0] = @"Missing recipe_signing";
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v150 forKeys:&v149 count:1];
      id v27 = [v26 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1521 userInfo:v15];
LABEL_25:
      uint64_t v24 = 0;
      *a6 = v27;
      goto LABEL_134;
    }
LABEL_26:
    uint64_t v24 = 0;
    goto LABEL_135;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v28 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:]7();
    }

    if (a6)
    {
      uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v147 = *MEMORY[0x1E4F28588];
      v148 = @"Malformed recipe_signing";
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v148 forKeys:&v147 count:1];
      id v27 = [v29 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1521 userInfo:v15];
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  id v15 = [v14 objectForKey:@"recipe_signature"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:]6();
    }

    if (a6)
    {
      uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v145 = *MEMORY[0x1E4F28588];
      v146 = @"Malformed recipe_signature";
      v109 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v146 forKeys:&v145 count:1];
      [v31 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1521 userInfo:v109];
      uint64_t v24 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v24 = 0;
    }
    goto LABEL_134;
  }
  v108 = [v14 objectForKey:@"recipe_content"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v32 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:]5();
    }

    if (a6)
    {
      v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v143 = *MEMORY[0x1E4F28588];
      v144 = @"Malformed recipe_content";
      v107 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
      [v33 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1521 userInfo:v107];
      uint64_t v24 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v24 = 0;
    }
    goto LABEL_133;
  }
  v106 = [v14 objectForKey:@"asset_signing_certificate"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v106 length])
  {
    v34 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:]();
    }

    if (a6)
    {
      v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v141 = *MEMORY[0x1E4F28588];
      v142 = @"Malformed asset_signing_certificate";
      v105 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v142 forKeys:&v141 count:1];
      [v35 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1521 userInfo:v105];
      uint64_t v24 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v24 = 0;
    }
    goto LABEL_132;
  }
  v104 = [v106 dataUsingEncoding:4];
  uint64_t v16 = [v104 copy];
  certificate = v13->_certificate;
  v13->_certificate = (NSData *)v16;

  v103 = [v108 dataUsingEncoding:4];
  v102 = +[DESSignatureKey keyFromData:v104];
  if (([v102 validateBase64Signature:v15 data:v103] & 1) == 0)
  {
    v36 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:]4();
    }

    if (a6)
    {
      uint64_t v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v139 = *MEMORY[0x1E4F28588];
      v140 = @"Failed to validate recipe signature";
      v101 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
      [v37 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1504 userInfo:v101];
      uint64_t v24 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v24 = 0;
    }
    goto LABEL_131;
  }
  v100 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v108 options:0];
  if (!v100)
  {
    v38 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:]();
    }

    if (a6)
    {
      v39 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v137 = *MEMORY[0x1E4F28588];
      v138 = @"Failed to base64 decode recipe content";
      v99 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
      [v39 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1530 userInfo:v99];
      uint64_t v24 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v24 = 0;
    }
    goto LABEL_130;
  }
  v98 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v100 options:0 error:a6];
  uint64_t v18 = +[DESLogging coreChannel];
  v19 = v18;
  if (!v98)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.4();
    }

    if (a6)
    {
      v40 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v135 = *MEMORY[0x1E4F28588];
      v136 = @"Failed to deserialize recipe content";
      v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
      *a6 = [v40 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1522 userInfo:v41];
    }
    uint64_t v24 = 0;
    goto LABEL_129;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:]3();
  }

  uint64_t v113 = 0;
  v114[0] = &v113;
  v114[1] = 0x3032000000;
  v114[2] = __Block_byref_object_copy__1;
  v114[3] = __Block_byref_object_dispose__1;
  id v115 = [v98 objectForKeyedSubscript:@"recipe"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v42 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:]2((uint64_t)v114, v42, v43, v44, v45, v46, v47, v48);
    }

    if (a6)
    {
      v49 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v133 = *MEMORY[0x1E4F28588];
      v134 = @"Malformed recipe";
      v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v134 forKeys:&v133 count:1];
      [v49 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1524 userInfo:v50];
      uint64_t v24 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v24 = 0;
    }
    goto LABEL_128;
  }
  uint64_t v20 = [v98 objectForKeyedSubscript:@"parameters"];
  objc_opt_class();
  v93 = v20;
  if (objc_opt_isKindOfClass())
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v110[0] = MEMORY[0x1E4F143A8];
    v110[1] = 3221225472;
    v110[2] = __69__DESRecipe__initWithRecipeResponse_recipeID_bundleIdentifier_error___block_invoke;
    v110[3] = &unk_1E63C1D08;
    id v22 = v21;
    id v111 = v22;
    v112 = &v113;
    [v20 enumerateKeysAndObjectsUsingBlock:v110];

    v23 = v22;
  }
  else
  {
    v23 = 0;
  }
  v91 = v23;
  uint64_t v51 = [v23 copy];
  parametersUsed = v13->_parametersUsed;
  v13->_parametersUsed = (NSDictionary *)v51;

  uint64_t v53 = [*(id *)(v114[0] + 40) copy];
  recipeUserInfo = v13->_recipeUserInfo;
  v13->_recipeUserInfo = (NSDictionary *)v53;

  v96 = [v98 objectForKeyedSubscript:@"attached_files"];
  if (v96)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v61 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
        -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:]1();
      }

      if (a6)
      {
        v62 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v131 = *MEMORY[0x1E4F28588];
        v132 = @"Malformed attached_files";
        v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v132 forKeys:&v131 count:1];
        [v62 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1523 userInfo:v63];
        uint64_t v24 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v24 = 0;
      }
      goto LABEL_127;
    }
  }
  v95 = [v98 objectForKeyedSubscript:@"attached_files_signatures"];
  if (v95)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v68 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
        -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:]0();
      }

      if (a6)
      {
        v69 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v129 = *MEMORY[0x1E4F28588];
        v130 = @"Malformed attached_files_signatures";
        uint64_t v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v130 forKeys:&v129 count:1];
        [v69 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1523 userInfo:v70];
        v92 = (void *)v70;
        id v67 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_99;
      }
LABEL_100:
      uint64_t v24 = 0;
      goto LABEL_126;
    }
  }
  uint64_t v55 = [v95 count];
  if (v55 != [v96 count])
  {
    v64 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.9();
    }

    if (a6)
    {
      v65 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v127 = *MEMORY[0x1E4F28588];
      v128 = @"Length mismatch between attached_files and attached_files_signatures";
      uint64_t v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v128 forKeys:&v127 count:1];
      [v65 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1523 userInfo:v66];
      v92 = (void *)v66;
      id v67 = (id)objc_claimAutoreleasedReturnValue();
LABEL_99:
      uint64_t v24 = 0;
      *a6 = v67;
      goto LABEL_125;
    }
    goto LABEL_100;
  }
  v92 = [v98 objectForKeyedSubscript:@"attached_files_paths"];
  if (v92)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v56 = [v92 count];
      if (v56 == [v96 count]) {
        goto LABEL_70;
      }
      v78 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
        -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.7();
      }

      if (a6)
      {
        v79 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v123 = *MEMORY[0x1E4F28588];
        v124 = @"Length mismatch between paths and attachments";
        id obj = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v124 forKeys:&v123 count:1];
        id v77 = [v79 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1523 userInfo:obj];
        goto LABEL_111;
      }
    }
    else
    {
      v75 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
        -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.8();
      }

      if (a6)
      {
        v76 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v125 = *MEMORY[0x1E4F28588];
        v126 = @"Malformed paths";
        id obj = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1];
        id v77 = [v76 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1523 userInfo:obj];
LABEL_111:
        uint64_t v24 = 0;
        *a6 = v77;
        goto LABEL_124;
      }
    }
    uint64_t v24 = 0;
    goto LABEL_125;
  }
LABEL_70:
  id obj = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v89 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v88 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v57 = 0;
  *(void *)&long long v58 = 138412290;
  long long v87 = v58;
  while (1)
  {
    if (v57 >= objc_msgSend(v96, "count", v87))
    {
      objc_storeStrong((id *)&v13->_attachments, obj);
      objc_storeStrong((id *)&v13->_attachmentSignatures, v89);
      objc_storeStrong((id *)&v13->_attachmentPaths, v88);
      uint64_t v71 = [v11 copy];
      recipeID = v13->_recipeID;
      v13->_recipeID = (NSString *)v71;

      uint64_t v73 = [v12 copy];
      bundleIdentifier = v13->_bundleIdentifier;
      v13->_bundleIdentifier = (NSString *)v73;

      uint64_t v24 = v13;
      goto LABEL_123;
    }
    v97 = [v96 objectAtIndexedSubscript:v57];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    v60 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v87;
      v122 = v97;
      _os_log_error_impl(&dword_1BECCB000, v60, OS_LOG_TYPE_ERROR, "Invalid attachmentURLString = %@", buf, 0xCu);
    }
LABEL_85:

    ++v57;
  }
  uint64_t v59 = [MEMORY[0x1E4F1CB10] URLWithString:v97];
  v60 = v59;
  if (!v59)
  {
    log = +[DESLogging coreChannel];
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v87;
      v122 = v97;
      _os_log_error_impl(&dword_1BECCB000, log, OS_LOG_TYPE_ERROR, "Fail to create URL from attachmentURLString = %@", buf, 0xCu);
    }
LABEL_84:

    goto LABEL_85;
  }
  [obj addObject:v59];
  if (v57 >= [v95 count])
  {
LABEL_77:
    if (v57 >= [v92 count]) {
      goto LABEL_85;
    }
    log = [v92 objectAtIndexedSubscript:v57];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v84 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
        -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.5();
      }

      if (a6)
      {
        v85 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v117 = *MEMORY[0x1E4F28588];
        v118 = @"Nonstring type used as attachment path";
        v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
        v83 = [v85 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1523 userInfo:v82];
        goto LABEL_121;
      }
      goto LABEL_122;
    }
    [v88 addObject:log];
    goto LABEL_84;
  }
  log = [v95 objectAtIndexedSubscript:v57];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v89 addObject:log];

    goto LABEL_77;
  }
  v80 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
    -[DESRecipe _initWithRecipeResponse:recipeID:bundleIdentifier:error:].cold.6();
  }

  if (a6)
  {
    v81 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v119 = *MEMORY[0x1E4F28588];
    v120 = @"Nonstring type used as signature in attached_files_signatures";
    v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v120 forKeys:&v119 count:1];
    v83 = [v81 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1523 userInfo:v82];
LABEL_121:
    *a6 = v83;
  }
LABEL_122:

  uint64_t v24 = 0;
LABEL_123:

LABEL_124:
LABEL_125:

LABEL_126:
LABEL_127:

LABEL_128:
  _Block_object_dispose(&v113, 8);

LABEL_129:
LABEL_130:

LABEL_131:
LABEL_132:

LABEL_133:
LABEL_134:

LABEL_135:
LABEL_136:

  return v24;
}

void __69__DESRecipe__initWithRecipeResponse_recipeID_bundleIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count])
  {
    v7 = objc_msgSend(v6, "objectAtIndex:", arc4random_uniform(objc_msgSend(v6, "count")));
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = (void *)MEMORY[0x1E4F28D90];
      id v9 = [v7 dataUsingEncoding:4];
      id v19 = 0;
      id v10 = [v8 JSONObjectWithData:v9 options:4 error:&v19];
      id v11 = v19;

      if (v10)
      {
        [*(id *)(a1 + 32) setValue:v7 forKey:v5];
        id v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        id v13 = [@"$" stringByAppendingString:v5];
        uint64_t v14 = objc_msgSend(v12, "_fides_objectByReplacingValue:withValue:", v13, v10);

        id v15 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          *(_DWORD *)buf = 138412802;
          id v21 = v5;
          __int16 v22 = 2112;
          uint64_t v23 = v18;
          __int16 v24 = 2112;
          uint64_t v25 = v14;
          _os_log_debug_impl(&dword_1BECCB000, v15, OS_LOG_TYPE_DEBUG, "Recipe after replacement of %@: %@ -> %@", buf, 0x20u);
        }

        uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
        id v17 = *(NSObject **)(v16 + 40);
        *(void *)(v16 + 40) = v14;
      }
      else
      {
        id v17 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __69__DESRecipe__initWithRecipeResponse_recipeID_bundleIdentifier_error___block_invoke_cold_2();
        }
      }
    }
    else
    {
      id v11 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __69__DESRecipe__initWithRecipeResponse_recipeID_bundleIdentifier_error___block_invoke_cold_3();
      }
    }
  }
  else
  {
    v7 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __69__DESRecipe__initWithRecipeResponse_recipeID_bundleIdentifier_error___block_invoke_cold_1();
    }
  }
}

+ (BOOL)transportIsDedisco:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"des_settings"];
  v4 = [v3 objectForKeyedSubscript:@"data_transport"];
  char v5 = [v4 isEqualToString:@"dedisco"];

  return v5;
}

- (BOOL)transportIsDedisco
{
  return +[DESRecipe transportIsDedisco:self->_recipeUserInfo];
}

+ (BOOL)pluginShouldAddNoiseAndEncryptResult:(id)a3
{
  return !+[DESRecipe transportIsDedisco:a3];
}

- (BOOL)pluginShouldAddNoiseAndEncryptResult
{
  return +[DESRecipe pluginShouldAddNoiseAndEncryptResult:self->_recipeUserInfo];
}

- (NSString)privacyIdentifier
{
  return (NSString *)[(NSDictionary *)self->_recipeUserInfo objectForKeyedSubscript:@"privacyIdentifier"];
}

- (NSString)privacyIdentifierExt
{
  v3 = [(NSDictionary *)self->_recipeUserInfo objectForKeyedSubscript:@"privacyIdentifierExt"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v5 = [(NSDictionary *)self->_recipeUserInfo objectForKeyedSubscript:@"privacyIdentifierExt"];
  }
  else
  {
    char v5 = 0;
  }

  return (NSString *)v5;
}

- (id)haruspexKeyWithError:(id *)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v4 = [(NSDictionary *)self->_recipeUserInfo objectForKeyedSubscript:@"iCloudAggServiceKey"];
  if (v4)
  {
    char v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v4 options:0];
    id v6 = v5;
    if (v5)
    {
      id v6 = v5;
      v7 = v6;
    }
    else
    {
      if (a3)
      {
        id v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v12 = *MEMORY[0x1E4F28568];
        id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
        *a3 = [v9 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1501 userInfo:v10];
      }
      v7 = 0;
    }
    goto LABEL_9;
  }
  if (a3)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    [v8 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1501 userInfo:v6];
    v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  v7 = 0;
LABEL_10:

  return v7;
}

+ (BOOL)useSparsification:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    char v5 = [v3 objectForKeyedSubscript:@"sparsification"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v4 objectForKeyedSubscript:@"sparsification"];
      v7 = [v6 objectForKeyedSubscript:@"chunkClippingBounds"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [v4 objectForKeyedSubscript:@"sparsification"];
        id v9 = [v8 objectForKeyedSubscript:@"numChunks"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = [v4 objectForKeyedSubscript:@"sparsification"];
          uint64_t v11 = [v10 objectForKeyedSubscript:@"chunkClippingBounds"];
          uint64_t v18 = [v4 objectForKeyedSubscript:@"sparsification"];
          uint64_t v12 = [v18 objectForKeyedSubscript:@"numChunks"];
          id v19 = (void *)v11;
          if (+[DESRecipe _hasValidClippingBounds:v11 matchValidNumChunks:v12])
          {
            id v13 = [v4 objectForKeyedSubscript:@"sparsification"];
            [v13 objectForKeyedSubscript:@"sparsificationMapFile"];
            uint64_t v14 = v17 = v10;
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            id v10 = v17;
          }
          else
          {
            char isKindOfClass = 0;
          }
        }
        else
        {
          char isKindOfClass = 0;
        }
      }
      else
      {
        char isKindOfClass = 0;
      }
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

+ (BOOL)_hasValidClippingBounds:(id)a3 matchValidNumChunks:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    v7 = [v5 objectAtIndexedSubscript:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  int v9 = [v6 intValue];
  BOOL v10 = isKindOfClass & ([v5 count] == v9);

  return v10;
}

- (BOOL)useSparsification
{
  return +[DESRecipe useSparsification:self->_recipeUserInfo];
}

+ (BOOL)useAggregatableMetadata:(id)a3
{
  if (a3)
  {
    id v3 = [a3 objectForKeyedSubscript:@"MetadataEncoding"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (BOOL)useAggregatableMetadata
{
  return +[DESRecipe useAggregatableMetadata:self->_recipeUserInfo];
}

+ (BOOL)useAdaptiveClipping:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"ClippingIndicatorScale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v4 objectForKeyedSubscript:@"ClippingIndicatorScale"];
      [v6 doubleValue];
      BOOL v8 = v7 > 0.0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)useAdaptiveClipping
{
  return +[DESRecipe useAdaptiveClipping:self->_recipeUserInfo];
}

- (BOOL)useFederatedBuffer
{
  id v3 = [(NSDictionary *)self->_recipeUserInfo objectForKeyedSubscript:@"federatedBufferContext"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(NSDictionary *)self->_recipeUserInfo objectForKeyedSubscript:@"ramsayRecipeID"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (NSNumber)approximateStaleness
{
  if (![(DESRecipe *)self useFederatedBuffer])
  {
    uint64_t v14 = [NSNumber numberWithDouble:0.0];
    goto LABEL_15;
  }
  id v3 = [(NSDictionary *)self->_recipeUserInfo objectForKeyedSubscript:@"federatedBufferContext"];
  v4 = [v3 objectForKeyedSubscript:@"iterationStartTime"];

  if (!v4)
  {
    uint64_t v14 = [NSNumber numberWithDouble:0.0];
    goto LABEL_14;
  }
  id v5 = [v3 objectForKeyedSubscript:@"iterationStartTime"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  id v6 = [v3 objectForKeyedSubscript:@"stalenessScale"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_10:
    goto LABEL_11;
  }
  double v7 = [v3 objectForKeyedSubscript:@"stalenessBias"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_11:
    id v15 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      [(DESRecipe *)v3 approximateStaleness];
    }

    uint64_t v14 = 0;
    goto LABEL_14;
  }
  int v9 = [v3 objectForKeyedSubscript:@"iterationStartTime"];
  [v9 doubleValue];
  double v11 = v10;
  uint64_t v12 = [v3 objectForKeyedSubscript:@"stalenessScale"];
  id v13 = [v3 objectForKeyedSubscript:@"stalenessBias"];
  uint64_t v14 = +[DESFederatedBuffer computeApproximateStaleness:v12 stalenessScale:v13 stalenessBias:v11];

LABEL_14:
LABEL_15:

  return (NSNumber *)v14;
}

- (BOOL)isFederatedBufferStaled:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(DESRecipe *)self useFederatedBuffer])
    {
      id v5 = [(NSDictionary *)self->_recipeUserInfo objectForKeyedSubscript:@"federatedBufferContext"];
      id v6 = [v5 objectForKeyedSubscript:@"maximumStaleness"];

      if (v6)
      {
        double v7 = [v5 objectForKeyedSubscript:@"maximumStaleness"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          [v4 doubleValue];
          double v10 = v9;
          double v11 = [v5 objectForKeyedSubscript:@"maximumStaleness"];
          [v11 doubleValue];
          double v13 = v12;

          if (v10 < v13)
          {
            LOBYTE(v6) = 0;
            goto LABEL_14;
          }
          id v6 = +[DESLogging coreChannel];
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
            [(DESRecipe *)(uint64_t)v4 isFederatedBufferStaled:v6];
          }
        }
        else
        {
          id v6 = +[DESLogging coreChannel];
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            -[DESRecipe isFederatedBufferStaled:](v5);
          }
        }

        LOBYTE(v6) = 1;
      }
LABEL_14:

      goto LABEL_15;
    }
    LOBYTE(v6) = 0;
  }
  else
  {
    LOBYTE(v6) = 1;
  }
LABEL_15:

  return (char)v6;
}

- (BOOL)isFederatedBufferStaled
{
  v2 = self;
  id v3 = [(DESRecipe *)self approximateStaleness];
  LOBYTE(v2) = [(DESRecipe *)v2 isFederatedBufferStaled:v3];

  return (char)v2;
}

- (NSNumber)federatedBufferDownScalingFactor
{
  if (![(DESRecipe *)self useFederatedBuffer])
  {
    id v5 = [NSNumber numberWithDouble:1.0];
    goto LABEL_18;
  }
  id v3 = [(DESRecipe *)self approximateStaleness];
  if (!v3)
  {
    id v4 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[DESRecipe federatedBufferDownScalingFactor](v4);
    }
    goto LABEL_16;
  }
  if ([(DESRecipe *)self isFederatedBufferStaled:v3])
  {
    id v4 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[DESRecipe federatedBufferDownScalingFactor](v4);
    }
LABEL_16:
    id v5 = 0;
    goto LABEL_17;
  }
  id v4 = [(NSDictionary *)self->_recipeUserInfo objectForKeyedSubscript:@"federatedBufferContext"];
  id v6 = [v4 objectForKeyedSubscript:@"downScalingOrder"];

  if (v6)
  {
    double v7 = [v4 objectForKeyedSubscript:@"downScalingOrder"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      double v10 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[DESRecipe federatedBufferDownScalingFactor](v4);
      }

      goto LABEL_16;
    }
    double v9 = [v4 objectForKeyedSubscript:@"downScalingOrder"];
    id v5 = +[DESFederatedBuffer computeDownScalingFactor:v9 approximateStaleness:v3];
  }
  else
  {
    id v5 = [NSNumber numberWithDouble:1.0];
  }
LABEL_17:

LABEL_18:

  return (NSNumber *)v5;
}

- (NSNumber)maxNorm
{
  id v3 = [(NSDictionary *)self->_recipeUserInfo objectForKeyedSubscript:@"maxNorm"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(NSDictionary *)self->_recipeUserInfo objectForKeyedSubscript:@"L2NormBound"];
  }
  id v6 = v5;

  return (NSNumber *)v6;
}

- (NSNumber)normBinCount
{
  return (NSNumber *)[(NSDictionary *)self->_recipeUserInfo objectForKeyedSubscript:@"normBinCount"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  recipeID = self->_recipeID;
  id v11 = v4;
  if (recipeID)
  {
    [v4 encodeObject:recipeID forKey:@"recipeId"];
    id v4 = v11;
  }
  [v4 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  recipeUserInfo = self->_recipeUserInfo;
  if (recipeUserInfo) {
    [v11 encodeObject:recipeUserInfo forKey:@"recipeUserInfo"];
  }
  attachments = self->_attachments;
  if (attachments) {
    [v11 encodeObject:attachments forKey:@"attachments"];
  }
  attachmentSignatures = self->_attachmentSignatures;
  double v9 = v11;
  if (attachmentSignatures)
  {
    [v11 encodeObject:attachmentSignatures forKey:@"attachmentSignatures"];
    double v9 = v11;
  }
  attachmentPaths = self->_attachmentPaths;
  if (attachmentPaths)
  {
    [v11 encodeObject:attachmentPaths forKey:@"attachmentPaths"];
    double v9 = v11;
  }
}

- (DESRecipe)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)DESRecipe;
  id v5 = [(DESRecipe *)&v33 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipeId"];
    double v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    if (v7)
    {
      objc_storeStrong((id *)&v5->_recipeID, v6);
      objc_storeStrong((id *)&v5->_bundleIdentifier, v7);
      BOOL v8 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      double v13 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
      uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"recipeUserInfo"];
      recipeUserInfo = v5->_recipeUserInfo;
      v5->_recipeUserInfo = (NSDictionary *)v14;

      uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
      uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"attachments"];
      attachments = v5->_attachments;
      v5->_attachments = (NSArray *)v19;

      id v21 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v22 = objc_opt_class();
      uint64_t v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
      uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"attachmentSignatures"];
      attachmentSignatures = v5->_attachmentSignatures;
      v5->_attachmentSignatures = (NSArray *)v24;

      uint64_t v26 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v27 = objc_opt_class();
      id v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
      uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"attachmentPaths"];
      attachmentPaths = v5->_attachmentPaths;
      v5->_attachmentPaths = (NSArray *)v29;

      uint64_t v31 = v5;
    }
    else
    {
      uint64_t v31 = 0;
    }
  }
  else
  {
    uint64_t v31 = 0;
  }

  return v31;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"%@(%@, %@, %@)", v5, self->_bundleIdentifier, self->_recipeID, self->_recipeUserInfo];

  return v6;
}

- (NSDictionary)recipeUserInfo
{
  return self->_recipeUserInfo;
}

- (NSData)certificate
{
  return self->_certificate;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (NSArray)attachmentSignatures
{
  return self->_attachmentSignatures;
}

- (void)setAttachmentSignatures:(id)a3
{
}

- (NSArray)attachmentPaths
{
  return self->_attachmentPaths;
}

- (void)setAttachmentPaths:(id)a3
{
}

- (NSDictionary)parametersUsed
{
  return self->_parametersUsed;
}

- (NSString)recipeID
{
  return self->_recipeID;
}

- (void)setRecipeID:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSDictionary)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_recipeID, 0);
  objc_storeStrong((id *)&self->_parametersUsed, 0);
  objc_storeStrong((id *)&self->_attachmentPaths, 0);
  objc_storeStrong((id *)&self->_attachmentSignatures, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_certificate, 0);

  objc_storeStrong((id *)&self->_recipeUserInfo, 0);
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BECCB000, v0, v1, "Missing recipe_signing for recipeId=%@", v2, v3, v4, v5, v6);
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BECCB000, v0, v1, "asset_signing_certificate is of wrong type or zero length, certStr=%@", v2, v3, v4, v5, v6);
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BECCB000, v0, v1, "Failed to base64 decode recipe content for recipeId=%@", v2, v3, v4, v5, v6);
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BECCB000, v0, v1, "Failed to deserialize recipe content for recipeId=%@", v2, v3, v4, v5, v6);
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BECCB000, v0, v1, "path  is of wrong type, path=%@", v2, v3, v4, v5, v6);
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BECCB000, v0, v1, "signature is of wrong type, signature=%@", v2, v3, v4, v5, v6);
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.7()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_1BECCB000, v0, v1, "Length mismatch between paths and attachments, attachmentURLStrings=%@, attachmentPaths=%@");
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BECCB000, v0, v1, "attachmentPaths is of wrong type, attachmentPaths=%@", v2, v3, v4, v5, v6);
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.9()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_1BECCB000, v0, v1, "Length mismatch between attached_files and attached_files_signatures, attachmentURLStrings=%@, attachmentSignatures=%@");
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.10()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BECCB000, v0, v1, "attachmentSignatures is of wrong type, attachmentSignatures=%@", v2, v3, v4, v5, v6);
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.11()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BECCB000, v0, v1, "attachmentURLStrings is of wrong type, attachmentURLStrings=%@", v2, v3, v4, v5, v6);
}

- (void)_initWithRecipeResponse:(uint64_t)a3 recipeID:(uint64_t)a4 bundleIdentifier:(uint64_t)a5 error:(uint64_t)a6 .cold.12(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BECCB000, a2, a3, "recipe is of wrong type or zero length, recipe=%@", a5, a6, a7, a8, 2u);
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.13()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1BECCB000, v0, OS_LOG_TYPE_DEBUG, "Successfully validated recipe signature: %@", v1, 0xCu);
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.14()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BECCB000, v0, v1, "Failed to validate recipe signature: %@", v2, v3, v4, v5, v6);
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.15()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BECCB000, v0, v1, "recipe_content is of wrong type, recipeContent=%@", v2, v3, v4, v5, v6);
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.16()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BECCB000, v0, v1, "recipe_signature is of wrong type, recipeSignature=%@", v2, v3, v4, v5, v6);
}

- (void)_initWithRecipeResponse:recipeID:bundleIdentifier:error:.cold.17()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BECCB000, v0, v1, "recipe_signing is of wrong type, recipeSigning=%@", v2, v3, v4, v5, v6);
}

void __69__DESRecipe__initWithRecipeResponse_recipeID_bundleIdentifier_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_1BECCB000, v0, v1, "Skipping invalid parameter set %@: %@");
}

void __69__DESRecipe__initWithRecipeResponse_recipeID_bundleIdentifier_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_1BECCB000, v0, v1, "Skipping unparsable parameter value %@: %@");
}

void __69__DESRecipe__initWithRecipeResponse_recipeID_bundleIdentifier_error___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_1BECCB000, v0, v1, "Skipping invalid parameter value %@: %@");
}

- (void)approximateStaleness
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 objectForKeyedSubscript:@"iterationStartTime"];
  uint64_t v5 = [a1 objectForKeyedSubscript:@"stalenessScale"];
  uint8_t v6 = [a1 objectForKeyedSubscript:@"stalenessBias"];
  int v7 = 138412802;
  BOOL v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_ERROR, "Recipe content for approximating staleness iterationStartTime=%@ or scale=%@ or bias=%@ is malformed", (uint8_t *)&v7, 0x20u);
}

- (void)isFederatedBufferStaled:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 objectForKeyedSubscript:@"maximumStaleness"];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  __int16 v9 = v5;
  _os_log_debug_impl(&dword_1BECCB000, a3, OS_LOG_TYPE_DEBUG, "Rejecting recipe since the staleness %@ is larger or equal than the limit %@", (uint8_t *)&v6, 0x16u);
}

- (void)isFederatedBufferStaled:(void *)a1 .cold.2(void *a1)
{
  os_log_t v1 = [a1 objectForKeyedSubscript:@"maximumStaleness"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BECCB000, v2, v3, "Maximum staleness for rejecting staled donation is malformed: %@", v4, v5, v6, v7, v8);
}

- (void)federatedBufferDownScalingFactor
{
  os_log_t v1 = [a1 objectForKeyedSubscript:@"downScalingOrder"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1BECCB000, v2, v3, "Federated buffer down-scaling order is malformed: %@", v4, v5, v6, v7, v8);
}

@end