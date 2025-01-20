@interface DESSparsification
- (BOOL)reportErrorWithErrorStr:(id)a3 error:(id *)a4;
- (id)splitResultToChunksWithResult:(id)a3 recipe:(id)a4 baseKey:(id)a5 error:(id *)a6;
@end

@implementation DESSparsification

- (BOOL)reportErrorWithErrorStr:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[DESSparsification reportErrorWithErrorStr:error:]((uint64_t)v5, v6);
  }

  if (a4)
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = v5;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    *a4 = [v7 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:2008 userInfo:v8];
  }
  return a4 != 0;
}

- (id)splitResultToChunksWithResult:(id)a3 recipe:(id)a4 baseKey:(id)a5 error:(id *)a6
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  float v114 = 0.0;
  int v13 = [v11 useAdaptiveClipping];
  if (v13)
  {
    v14 = [v11 maxNorm];
    [v14 doubleValue];
    double v16 = v15;

    v17 = [v11 recipeUserInfo];
    v18 = [v17 objectForKeyedSubscript:@"ClippingIndicatorScale"];
    [v18 doubleValue];
    double v20 = v19;

    *(float *)&double v21 = v16;
    *(float *)&double v22 = v20;
    if (!+[DESAdaptiveClipping computeClippingIndicator:v10 clippingBound:&v114 scale:v21 clippingIndicator:v22])
    {
      v62 = NSString;
      v63 = [v11 recipeID];
      v39 = [v62 stringWithFormat:@"Recipe %@ has %@=%f but failed to compute the adaptive clipping indicator", v63, @"ClippingIndicatorScale", *(void *)&v20];

      v64 = self;
      v65 = v39;
      v66 = a6;
LABEL_25:
      [(DESSparsification *)v64 reportErrorWithErrorStr:v65 error:v66];
      id v61 = 0;
      goto LABEL_26;
    }
    v23 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = [v11 recipeID];
      *(_DWORD *)buf = 138412546;
      v117 = v24;
      __int16 v118 = 2048;
      double v119 = v114;
      _os_log_impl(&dword_1BECCB000, v23, OS_LOG_TYPE_INFO, "Recipe %@ uses adaptive clipping, indicator=%f", buf, 0x16u);
    }
    int v102 = v13;
    v107 = self;
    v108 = a6;

    uint64_t v25 = 1;
  }
  else
  {
    int v102 = 0;
    v107 = self;
    v108 = a6;
    uint64_t v25 = 0;
  }
  v26 = [v11 recipeUserInfo];
  v27 = [v26 objectForKeyedSubscript:@"sparsification"];
  uint64_t v28 = [v27 objectForKeyedSubscript:@"chunkClippingBounds"];
  if (!v28) {
    goto LABEL_23;
  }
  v29 = (void *)v28;
  v30 = [v11 recipeUserInfo];
  v31 = [v30 objectForKeyedSubscript:@"sparsification"];
  uint64_t v32 = [v31 objectForKeyedSubscript:@"numChunks"];
  if (!v32)
  {

LABEL_23:
    goto LABEL_24;
  }
  v33 = (void *)v32;
  obj = (char *)v25;
  [v11 recipeUserInfo];
  v34 = v109 = v11;
  [v34 objectForKeyedSubscript:@"sparsification"];
  v35 = id v101 = v10;
  v36 = [v35 objectForKeyedSubscript:@"sparsificationMapFile"];

  id v10 = v101;
  id v11 = v109;

  if (!v36)
  {
LABEL_24:
    v39 = [NSString stringWithFormat:@"Recipe does not include all keys required for sparsification and chunking. Required keys include %@, %@, %@, %@", @"sparsification", @"chunkClippingBounds", @"numChunks", @"sparsificationMapFile"];
    v64 = v107;
    v66 = v108;
    v65 = v39;
    goto LABEL_25;
  }
  v37 = [v109 recipeUserInfo];
  v38 = [v37 objectForKeyedSubscript:@"sparsification"];
  v39 = [v38 objectForKeyedSubscript:@"chunkClippingBounds"];

  v40 = [v109 recipeUserInfo];
  v41 = [v40 objectForKeyedSubscript:@"sparsification"];
  v42 = [v41 objectForKeyedSubscript:@"numChunks"];
  unint64_t v43 = (int)[v42 intValue];

  uint64_t v44 = [v39 count];
  unint64_t v45 = [v101 length];
  v46 = &obj[v45 >> 2];
  if ((unint64_t)v46 >= v43 && v44 == v43)
  {
    unint64_t v47 = v45;
    v97 = &obj[v45 >> 2];
    *(void *)__upper_bound = v43;
    v99 = v12;
    v100 = v39;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id obja = [v109 attachments];
    uint64_t v48 = [obja countByEnumeratingWithState:&v110 objects:v115 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      unint64_t v95 = v47;
      unint64_t v96 = v47 >> 2;
      uint64_t v50 = *(void *)v111;
LABEL_14:
      uint64_t v51 = 0;
      while (1)
      {
        if (*(void *)v111 != v50) {
          objc_enumerationMutation(obja);
        }
        v52 = *(void **)(*((void *)&v110 + 1) + 8 * v51);
        v53 = [v52 lastPathComponent];
        v54 = [v11 recipeUserInfo];
        v55 = [v54 objectForKeyedSubscript:@"sparsification"];
        v56 = [v55 objectForKeyedSubscript:@"sparsificationMapFile"];
        int v57 = [v53 isEqualToString:v56];

        if (v57) {
          break;
        }
        ++v51;
        id v11 = v109;
        if (v49 == v51)
        {
          uint64_t v49 = [obja countByEnumeratingWithState:&v110 objects:v115 count:16];
          if (v49) {
            goto LABEL_14;
          }
          goto LABEL_20;
        }
      }
      v68 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
        -[DESSparsification splitResultToChunksWithResult:recipe:baseKey:error:]((uint64_t)v52, v68);
      }

      uint64_t v69 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v52 options:1 error:v108];
      id v11 = v109;
      id v12 = v99;
      v39 = v100;
      v60 = obja;
      if (!v69)
      {
        id v10 = v101;
        if (v108) {
          id v91 = *v108;
        }
        else {
          id v91 = 0;
        }
        v93 = [NSString stringWithFormat:@"Sparsification map file was not readable: %@", v91];
        [(DESSparsification *)v107 reportErrorWithErrorStr:v93 error:v108];

        goto LABEL_30;
      }
      v70 = (void *)v69;

      uint64_t v71 = [v70 length];
      if ((char *)v71 == v97)
      {
        id objb = v70;
        id v72 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if (__upper_bound[0])
        {
          uint64_t v73 = 1;
          do
          {
            v74 = [NSNumber numberWithInt:v73];
            v75 = [v99 resultsKeyStringForChunk:v74];

            v76 = [DESChunk alloc];
            v77 = [v100 objectAtIndexedSubscript:v73 - 1];
            id v78 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
            v79 = [(DESChunk *)v76 initWithKey:v75 clippingBound:v77 data:v78];

            [v72 addObject:v79];
            ++v73;
          }
          while (v73 != __upper_bound[0] + 1);
        }
        id objc = objb;
        v80 = (unsigned __int8 *)[objc bytes];
        id v10 = v101;
        uint64_t v81 = [v101 bytes];
        id v12 = v99;
        unint64_t v82 = *(void *)__upper_bound;
        unint64_t v83 = v96;
        if (v95 >= 4)
        {
          uint64_t v84 = v81;
          do
          {
            unsigned int v86 = *v80++;
            unint64_t v85 = v86;
            if (v86)
            {
              if (v85 > *(void *)__upper_bound)
              {
                v94 = [NSString stringWithFormat:@"Chunk mapping value = %8u, which is greater than number of chunks = %lu, found in map file", v85, *(void *)__upper_bound];
                [(DESSparsification *)v107 reportErrorWithErrorStr:v94 error:v108];

                id v61 = 0;
                id v11 = v109;
                goto LABEL_50;
              }
              v87 = [v72 objectAtIndexedSubscript:(v85 - 1)];
              v88 = [v87 data];
              [v88 appendBytes:v84 length:4];
            }
            v84 += 4;
            --v83;
          }
          while (v83);
        }
        if (v102)
        {
          v89 = objc_msgSend(v72, "objectAtIndexedSubscript:", objc_msgSend(v72, "count") - 1);
          v90 = [v89 data];
          [v90 appendBytes:&v114 length:4];
        }
        id v11 = v109;
        if (__upper_bound[0] >= 2)
        {
          do
          {
            [v72 exchangeObjectAtIndex:v82 - 1 withObjectAtIndex:arc4random_uniform(v82)];
            --v82;
          }
          while (v82 > 1);
        }
        id v61 = v72;
LABEL_50:

        v39 = v100;
        v60 = objc;
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Length of sparsification mapping file does not match number of statistics to be privatised and aggregated: number of statistics = %lu; number of byte values in mapping file = %lu",
          v97,
        v92 = v71);
        [(DESSparsification *)v107 reportErrorWithErrorStr:v92 error:v108];

        id v61 = 0;
        v60 = v70;
        id v10 = v101;
      }
    }
    else
    {
LABEL_20:

      v58 = NSString;
      v59 = [v11 attachments];
      v60 = [v58 stringWithFormat:@"Sparsification map file not found in recipe attachments. Recipe attachments = %@", v59];

      [(DESSparsification *)v107 reportErrorWithErrorStr:v60 error:v108];
      id v61 = 0;
      v39 = v100;
      id v10 = v101;
      id v12 = v99;
    }
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Incorrect settings for chunking parameters: size of result vector = %lu; number of chunks = %lu; number of clipping bounds = %lu",
      v46,
      v43,
    v60 = v44);
    [(DESSparsification *)v107 reportErrorWithErrorStr:v60 error:v108];
LABEL_30:
    id v61 = 0;
  }

LABEL_26:

  return v61;
}

- (void)reportErrorWithErrorStr:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

- (void)splitResultToChunksWithResult:(uint64_t)a1 recipe:(NSObject *)a2 baseKey:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_DEBUG, "Sparsification map file found at: %@", (uint8_t *)&v2, 0xCu);
}

@end