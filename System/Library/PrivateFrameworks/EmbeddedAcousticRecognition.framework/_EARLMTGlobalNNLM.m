@interface _EARLMTGlobalNNLM
+ (id)attachmentURL:(id)a3 withName:(id)a4;
+ (id)compressedAttachmentURLFromRecipe:(id)a3 attachments:(id)a4;
+ (void)initialize;
- (BOOL)deltaIsPartial;
- (NSArray)attachments;
- (NSData)delta;
- (NSMutableArray)evalData;
- (NSMutableArray)trainData;
- (NSMutableDictionary)results;
- (_EARLMTGlobalNNLM)initWithRecipe:(id)a3;
- (_EARLMTGlobalNNLM)initWithRecipe:(id)a3 assetPath:(id)a4;
- (_EARLMTKaldiVocab)vocab;
- (id).cxx_construct;
- (id)_fetchTensorInfo:(id)a3;
- (id)computeDelta:(BOOL)a3;
- (id)evaluate;
- (id)evaluatePartialDelta;
- (id)findTensorsIndicesByKeyWord:(id)a3 tensorInfo:(id)a4;
- (id)getEvalTask:(id *)a3;
- (id)getTrainTask:(id *)a3;
- (id)loadData;
- (id)loadWeight;
- (id)restoreFromLatestWeights:(id)a3;
- (id)saveWeight:(id)a3;
- (id)setup;
- (id)train;
- (void)evaluate;
- (void)evaluatePartialDelta;
- (void)setAttachments:(id)a3;
- (void)setEvalData:(id)a3;
- (void)setTrainData:(id)a3;
- (void)train;
@end

@implementation _EARLMTGlobalNNLM

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.speech.speechmodeltraining", "_EARLMTGlobalNNLM");
    v3 = (void *)sLog;
    sLog = (uint64_t)v2;
  }
}

+ (id)attachmentURL:(id)a3 withName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v6 && v7)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __44___EARLMTGlobalNNLM_attachmentURL_withName___block_invoke;
    v13[3] = &unk_1E6000528;
    id v14 = v6;
    uint64_t v8 = [v5 indexOfObjectPassingTest:v13];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = 0;
    }
    else
    {
      v9 = [v5 objectAtIndexedSubscript:v8];
    }
  }
  else
  {
    v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v11 = [v10 fileExistsAtPath:v6];

    if (v11)
    {
      v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:0];
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)compressedAttachmentURLFromRecipe:(id)a3 attachments:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"compressedAttachmentFilename"];
  if (v8)
  {
    v9 = [a1 attachmentURL:v7 withName:v8];
    v10 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_1B1A86000, v10, OS_LOG_TYPE_INFO, "Attached compressed file URL: %@", (uint8_t *)&v13, 0xCu);
    }
    if (v9) {
      id v11 = v9;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_fetchTensorInfo:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v26 = (id)objc_opt_new();
  v30 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingGlobals"];
  uint64_t v4 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v4)
  {
    unsigned int v34 = 0;
    uint64_t v28 = *(void *)v41;
    do
    {
      uint64_t v5 = 0;
      uint64_t v31 = v4;
      do
      {
        if (*(void *)v41 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v40 + 1) + 8 * v5);
        context = (void *)MEMORY[0x1B3EA9930]();
        id v7 = [v29 getTensorNamed:v6 directBind:1];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        v35 = v7;
        uint64_t v8 = [v7 shape];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v46 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v37;
          LODWORD(v11) = 1;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v37 != v10) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(id *)(*((void *)&v36 + 1) + 8 * i);
              int v14 = [v13 intValue];

              uint64_t v11 = (v14 * v11);
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v36 objects:v46 count:16];
          }
          while (v9);
        }
        else
        {
          uint64_t v11 = 1;
        }

        v45[0] = v6;
        v44[0] = @"name";
        v44[1] = @"size";
        v32 = [NSNumber numberWithInt:v11];
        v45[1] = v32;
        v44[2] = @"shape";
        id v15 = objc_alloc(MEMORY[0x1E4F1CA48]);
        v16 = [v35 shape];
        v17 = (void *)[v15 initWithArray:v16 copyItems:1];
        v45[2] = v17;
        v44[3] = @"strides";
        id v18 = objc_alloc(MEMORY[0x1E4F1CA48]);
        v19 = [v35 strides];
        v20 = (void *)[v18 initWithArray:v19 copyItems:1];
        v45[3] = v20;
        v44[4] = @"offset";
        v21 = [NSNumber numberWithInt:v34];
        v45[4] = v21;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:5];
        v23 = (void *)[v22 mutableCopy];
        [v30 setObject:v23 forKeyedSubscript:v6];

        v34 += v11;
        ++v5;
      }
      while (v5 != v31);
      uint64_t v4 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v4);
  }
  else
  {
    unsigned int v34 = 0;
  }

  [v26 setObject:v30 forKeyedSubscript:@"tensorInfo"];
  v24 = [NSNumber numberWithInt:v34];
  [v26 setObject:v24 forKeyedSubscript:@"totalSize"];

  return v26;
}

- (_EARLMTGlobalNNLM)initWithRecipe:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_EARLMTGlobalNNLM;
  uint64_t v6 = [(_EARLMTGlobalNNLM *)&v18 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_recipe, a3);
    v7->_numParam = 0;
    uint64_t v8 = objc_opt_new();
    assetPath = v7->_assetPath;
    v7->_assetPath = (NSString *)v8;

    uint64_t v10 = objc_opt_new();
    trainData = v7->_trainData;
    v7->_trainData = (NSMutableArray *)v10;

    uint64_t v12 = objc_opt_new();
    evalData = v7->_evalData;
    v7->_evalData = (NSMutableArray *)v12;

    v7->_weightsAreUpdated = 0;
    v7->_numWordsTrain = 0;
    v7->_numWordsEval = 0;
    uint64_t v14 = objc_opt_new();
    results = v7->_results;
    v7->_results = (NSMutableDictionary *)v14;

    v7->_deltaIsPartial = 0;
    mmappedPartialWeights = v7->_mmappedPartialWeights;
    v7->_mmappedPartialWeights = 0;
  }
  return v7;
}

- (_EARLMTGlobalNNLM)initWithRecipe:(id)a3 assetPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_EARLMTGlobalNNLM;
  uint64_t v9 = [(_EARLMTGlobalNNLM *)&v18 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recipe, a3);
    objc_storeStrong((id *)&v10->_assetPath, a4);
    v10->_numParam = 0;
    uint64_t v11 = objc_opt_new();
    trainData = v10->_trainData;
    v10->_trainData = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    evalData = v10->_evalData;
    v10->_evalData = (NSMutableArray *)v13;

    v10->_weightsAreUpdated = 0;
    v10->_numWordsTrain = 0;
    v10->_numWordsEval = 0;
    uint64_t v15 = objc_opt_new();
    results = v10->_results;
    v10->_results = (NSMutableDictionary *)v15;
  }
  return v10;
}

- (id)loadData
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"language"];
  uint64_t v4 = v3;
  if (!v3) {
    v3 = @"en-US";
  }
  id v5 = [(__CFString *)v3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  language = self->_language;
  self->_language = v5;

  int v7 = _parseRecipeBoolField(self->_recipe, @"mergeTrainDev", 0);
  if (v7)
  {
    objc_storeStrong((id *)&self->_evalData, self->_trainData);
    id v8 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B1A86000, v8, OS_LOG_TYPE_INFO, "merge training and evaluation data and use them for both training and evaluation", buf, 2u);
    }
  }
  uint64_t v9 = (void *)MEMORY[0x1B3EA9930]();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v10 = self->_trainData;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v10);
        }
        self->_numWordsTrain += [*(id *)(*((void *)&v35 + 1) + 8 * i) count] + 1;
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v11);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v14 = self->_evalData;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v14);
        }
        self->_numWordsEval += [*(id *)(*((void *)&v31 + 1) + 8 * j) count] + 1;
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v15);
  }

  objc_super v18 = (id)sLog;
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v19)
    {
      uint64_t v20 = [(NSMutableArray *)self->_trainData count];
      unint64_t numWordsTrain = self->_numWordsTrain;
      *(_DWORD *)buf = 134218240;
      uint64_t v40 = v20;
      __int16 v41 = 2048;
      unint64_t v42 = numWordsTrain;
      _os_log_impl(&dword_1B1A86000, v18, OS_LOG_TYPE_INFO, "%lu sentences (%lu words) will be used for both traiing and evaluation data", buf, 0x16u);
    }

    unint64_t v22 = self->_numWordsTrain + self->_numWordsEval;
    self->_unint64_t numWordsTrain = v22;
    self->_unint64_t numWordsEval = v22;
  }
  else
  {
    if (v19)
    {
      uint64_t v23 = [(NSMutableArray *)self->_trainData count];
      unint64_t v24 = self->_numWordsTrain;
      *(_DWORD *)buf = 134218240;
      uint64_t v40 = v23;
      __int16 v41 = 2048;
      unint64_t v42 = v24;
      _os_log_impl(&dword_1B1A86000, v18, OS_LOG_TYPE_INFO, "%lu sentences (%lu words) will be used for traiing data", buf, 0x16u);
    }

    v25 = (id)sLog;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = [(NSMutableArray *)self->_evalData count];
      unint64_t numWordsEval = self->_numWordsEval;
      *(_DWORD *)buf = 134218240;
      uint64_t v40 = v26;
      __int16 v41 = 2048;
      unint64_t v42 = numWordsEval;
      _os_log_impl(&dword_1B1A86000, v25, OS_LOG_TYPE_INFO, "%lu sentences (%lu words) will be used for evaluation data", buf, 0x16u);
    }

    unint64_t v22 = self->_numWordsTrain;
  }
  uint64_t v28 = [NSNumber numberWithUnsignedInteger:v22];
  [(NSMutableDictionary *)self->_results setObject:v28 forKeyedSubscript:@"NumWordsInTraining"];

  id v29 = [NSNumber numberWithUnsignedInteger:self->_numWordsEval];
  [(NSMutableDictionary *)self->_results setObject:v29 forKeyedSubscript:@"NumWordsInEvaluation"];

  return 0;
}

- (id)loadWeight
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  v103[0] = 0;
  os_log_t v2 = [(_EARLMTGlobalNNLM *)self getEvalTask:v103];
  id v3 = v103[0];
  if (!v2 || v3)
  {
    id v68 = v3;
    id v61 = v68;
  }
  else
  {
    v54 = v2;
    uint64_t v4 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B1A86000, v4, OS_LOG_TYPE_INFO, "Evaluation model loaded in reloading weight", buf, 2u);
    }
    assetPath = self->_assetPath;
    uint64_t v6 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"weightMap"];
    v58 = [(NSString *)assetPath stringByAppendingString:v6];

    int v7 = self->_assetPath;
    id v8 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"weightFile"];
    id v53 = [(NSString *)v7 stringByAppendingString:v8];

    id v102 = 0;
    v57 = [NSString stringWithContentsOfFile:v58 encoding:4 error:&v102];
    id v68 = v102;
    v100[0] = 0;
    v100[1] = v100;
    v100[2] = 0x3032000000;
    v100[3] = __Block_byref_object_copy__16;
    v100[4] = __Block_byref_object_dispose__16;
    id v101 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    v56 = [v57 componentsSeparatedByCharactersInSet:v9];

    v99[0] = MEMORY[0x1E4F143A8];
    v99[1] = 3221225472;
    v99[2] = __31___EARLMTGlobalNNLM_loadWeight__block_invoke;
    v99[3] = &unk_1E5FFE350;
    v99[4] = v100;
    [v56 enumerateObjectsUsingBlock:v99];
    id v55 = v53;
    std::string::basic_string[abi:ne180100]<0>(&__sz, (char *)[v55 UTF8String]);
    if (SHIBYTE(__sz.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v96, __sz.__r_.__value_.__l.__data_, __sz.__r_.__value_.__l.__size_);
    }
    else {
      std::string v96 = __sz;
    }
    StorageAccessor::EspressoStorageAccessor::EspressoStorageAccessor((uint64_t)buf, (long long *)&v96);
    if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v96.__r_.__value_.__l.__data_);
    }
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id obj = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingGlobals"];
    uint64_t v10 = [obj countByEnumeratingWithState:&v92 objects:v107 count:16];
    if (v10)
    {
      uint64_t v62 = *(void *)v93;
      uint64_t v59 = *MEMORY[0x1E4F28568];
      while (1)
      {
        uint64_t v11 = 0;
        uint64_t v63 = v10;
        do
        {
          if (*(void *)v93 != v62) {
            objc_enumerationMutation(obj);
          }
          uint64_t v66 = v11;
          uint64_t v12 = *(void **)(*((void *)&v92 + 1) + 8 * v11);
          context = (void *)MEMORY[0x1B3EA9930]();
          v67 = [v12 componentsSeparatedByString:@"/"];
          v70 = [v67 objectAtIndex:2];
          if ((unint64_t)[v67 count] < 4)
          {
            uint64_t v16 = v70;
          }
          else
          {
            uint64_t v13 = [v70 stringByAppendingString:@"/"];
            uint64_t v14 = [v67 objectAtIndex:3];
            uint64_t v15 = [v13 stringByAppendingString:v14];

            uint64_t v16 = (void *)v15;
          }
          v71 = v16;
          v69 = -[_EARLMTGlobalNNLM findTensorsIndicesByKeyWord:tensorInfo:](self, "findTensorsIndicesByKeyWord:tensorInfo:");
          v17 = [v69 objectForKey:@"constant_blob"];
          BOOL v18 = v17 == 0;

          if (!v18)
          {
            BOOL v19 = [v69 objectForKey:@"constant_blob"];
            StorageAccessor::EspressoStorageAccessor::GetDataView<float>((uint64_t)buf, [v19 integerValue], &v89);
            uint64_t v20 = v89;
            v90 = 0;
            uint64_t v91 = 0;
            v89 = 0;

            goto LABEL_21;
          }
          v21 = [v69 objectForKey:@"Q_meta"];
          if (v21)
          {
            unint64_t v22 = [v69 objectForKey:@"weights_u8"];
            BOOL v23 = v22 == 0;

            if (!v23)
            {
              unint64_t v24 = [v69 objectForKey:@"Q_meta"];
              StorageAccessor::EspressoStorageAccessor::GetDataView<float>((uint64_t)buf, [v24 integerValue], &v89);

              v25 = [v69 objectForKey:@"weights_u8"];
              StorageAccessor::EspressoStorageAccessor::GetDataView<unsigned char>((uint64_t)buf, (int)[v25 intValue], &v86);

              uint64_t v26 = [v69 objectForKey:@"nB"];
              LODWORD(v25) = [v26 intValue];

              v27 = [v69 objectForKey:@"nC"];
              LODWORD(v26) = [v27 intValue];

              v83 = 0;
              uint64_t v84 = 0;
              v82 = 0;
              std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v82, v86, (uint64_t)v87, v87 - (unsigned char *)v86);
              __p = 0;
              v80 = 0;
              uint64_t v81 = 0;
              std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v89, (uint64_t)v90, (v90 - (unsigned char *)v89) >> 2);
              quasar::QuantizationTool::LinearRegionDequantize((uint64_t *)&v82, (int)v25, (int)v26, 64, (uint64_t *)&__p, v85);
              uint64_t v20 = (void *)v85[0];
              memset(v85, 0, sizeof(v85));
              if (__p)
              {
                v80 = __p;
                operator delete(__p);
              }
              if (v82)
              {
                v83 = v82;
                operator delete(v82);
              }
              uint64_t v28 = (void *)v86;
              if (!v86) {
                goto LABEL_44;
              }
              v87 = v86;
              goto LABEL_43;
            }
          }
          long long v38 = [v69 objectForKey:@"w_quantization_scale"];
          if (!v38
            || ([v69 objectForKey:@"W_int8"],
                long long v39 = objc_claimAutoreleasedReturnValue(),
                BOOL v40 = v39 == 0,
                v39,
                v38,
                v40))
          {
            uint64_t v45 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v105 = v59;
            v46 = [NSString stringWithFormat:@"Exception in fetching weights"];
            v106 = v46;
            v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
            uint64_t v48 = [v45 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:1 userInfo:v47];

            uint64_t v20 = 0;
            id v68 = (id)v48;
            goto LABEL_21;
          }
          __int16 v41 = [v69 objectForKey:@"w_quantization_scale"];
          [v41 floatValue];
          float v43 = v42;

          v44 = [v69 objectForKey:@"W_int8"];
          StorageAccessor::EspressoStorageAccessor::GetDataView<signed char>((uint64_t)buf, [v44 integerValue], &v89);

          v77 = 0;
          uint64_t v78 = 0;
          v76 = 0;
          std::vector<signed char>::__init_with_size[abi:ne180100]<signed char *,signed char *>(&v76, v89, (uint64_t)v90, v90 - (unsigned char *)v89);
          quasar::QuantizationTool::SimpleDequantize((uint64_t *)&v76, &v86, v43);
          uint64_t v20 = (void *)v86;
          v87 = 0;
          uint64_t v88 = 0;
          v86 = 0;
          uint64_t v28 = v76;
          if (v76)
          {
            v77 = v76;
LABEL_43:
            operator delete(v28);
          }
LABEL_44:
          if (v89)
          {
            v90 = v89;
            operator delete(v89);
          }
LABEL_21:
          if (v68)
          {
            id v61 = v68;
          }
          else
          {
            id v29 = [(NSDictionary *)self->_tensors objectForKeyedSubscript:v12];
            v30 = (void *)[v29 dataPointer];
            long long v74 = 0u;
            long long v75 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            long long v31 = [v29 shape];
            uint64_t v32 = [v31 countByEnumeratingWithState:&v72 objects:v104 count:16];
            if (v32)
            {
              uint64_t v33 = *(void *)v73;
              int v34 = 1;
              do
              {
                for (uint64_t i = 0; i != v32; ++i)
                {
                  if (*(void *)v73 != v33) {
                    objc_enumerationMutation(v31);
                  }
                  id v36 = *(id *)(*((void *)&v72 + 1) + 8 * i);
                  int v37 = [v36 intValue];

                  v34 *= v37;
                }
                uint64_t v32 = [v31 countByEnumeratingWithState:&v72 objects:v104 count:16];
              }
              while (v32);
            }
            else
            {
              int v34 = 1;
            }

            memcpy(v30, v20, 4 * v34);
          }

          if (v20) {
            operator delete(v20);
          }

          if (v68)
          {

            goto LABEL_59;
          }
          id v68 = 0;
          uint64_t v11 = v66 + 1;
        }
        while (v66 + 1 != v63);
        uint64_t v49 = [obj countByEnumeratingWithState:&v92 objects:v107 count:16];
        uint64_t v10 = v49;
        id v68 = 0;
        v50 = 0;
        if (!v49) {
          goto LABEL_58;
        }
      }
    }
    v50 = v68;
LABEL_58:

    id v51 = [(_EARLMTGlobalNNLM *)self restoreFromLatestWeights:v54];
    id v68 = v50;
    id v61 = v68;
LABEL_59:
    StorageAccessor::EspressoStorageAccessor::~EspressoStorageAccessor((StorageAccessor::EspressoStorageAccessor *)buf);
    if (SHIBYTE(__sz.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__sz.__r_.__value_.__l.__data_);
    }

    _Block_object_dispose(v100, 8);
    os_log_t v2 = v54;
  }

  return v61;
}

- (id)saveWeight:(id)a3
{
  v118[19] = *MEMORY[0x1E4F143B8];
  id v64 = a3;
  v108[0] = 0;
  v70 = self;
  uint64_t v4 = [(_EARLMTGlobalNNLM *)self getEvalTask:v108];
  id v5 = v108[0];
  v69 = (void *)v4;
  if (!v4
    || v5
    || (uint64_t v6 = v70, v70->_weightsAreUpdated)
    && ([(_EARLMTGlobalNNLM *)v70 restoreFromLatestWeights:v4],
        id v5 = (id)objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = v70,
        v5))
  {
    id v74 = v5;
    id v66 = v74;
    goto LABEL_64;
  }
  assetPath = v6->_assetPath;
  id v8 = [(NSDictionary *)v6->_recipe objectForKeyedSubscript:@"weightMap"];
  uint64_t v62 = [(NSString *)assetPath stringByAppendingString:v8];

  uint64_t v9 = v70->_assetPath;
  uint64_t v10 = [(NSDictionary *)v70->_recipe objectForKeyedSubscript:@"weightFile"];
  id v57 = [(NSString *)v9 stringByAppendingString:v10];

  uint64_t v11 = [v64 stringByAppendingString:@"/"];
  uint64_t v12 = [(NSDictionary *)v70->_recipe objectForKeyedSubscript:@"weightSaveFile"];
  id v56 = [v11 stringByAppendingString:v12];

  id v107 = 0;
  id v61 = [NSString stringWithContentsOfFile:v62 encoding:4 error:&v107];
  id v74 = v107;
  uint64_t v101 = 0;
  id v102 = &v101;
  uint64_t v103 = 0x3032000000;
  v104 = __Block_byref_object_copy__16;
  uint64_t v105 = __Block_byref_object_dispose__16;
  id v106 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v13 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  v60 = [v61 componentsSeparatedByCharactersInSet:v13];

  v100[0] = MEMORY[0x1E4F143A8];
  v100[1] = 3221225472;
  v100[2] = __32___EARLMTGlobalNNLM_saveWeight___block_invoke;
  v100[3] = &unk_1E5FFE350;
  v100[4] = &v101;
  [v60 enumerateObjectsUsingBlock:v100];
  id v59 = v57;
  std::string::basic_string[abi:ne180100]<0>(&v98, (char *)[v59 UTF8String]);
  id v58 = v56;
  std::string::basic_string[abi:ne180100]<0>(&__s, (char *)[v58 UTF8String]);
  std::ifstream::basic_ifstream(v116);
  std::ofstream::basic_ofstream(&v113);
  std::ostream::operator<<();
  if (!std::filebuf::close()) {
    std::ios_base::clear((std::ios_base *)((char *)v116 + *(void *)(v116[0] - 24)), *(_DWORD *)&v117[*(void *)(v116[0] - 24) + 16] | 4);
  }
  if (!std::filebuf::close()) {
    std::ios_base::clear((std::ios_base *)&v114[*(void *)(v113 - 24) - 8], *(_DWORD *)&v114[*(void *)(v113 - 24) + 24] | 4);
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v95, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
  }
  else {
    std::string v95 = __s;
  }
  StorageAccessor::EspressoStorageAccessor::EspressoStorageAccessor((uint64_t)v96, (long long *)&v95);
  if (SHIBYTE(v95.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v95.__r_.__value_.__l.__data_);
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  uint64_t v14 = [(NSDictionary *)v70->_recipe objectForKeyedSubscript:@"trainingGlobals"];
  id obj = v14;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v91 objects:v112 count:16];
  if (v15)
  {
    uint64_t v68 = *(void *)v92;
    uint64_t v63 = *MEMORY[0x1E4F28568];
    while (1)
    {
      uint64_t v67 = v15;
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v92 != v68) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v91 + 1) + 8 * v16);
        context = (void *)MEMORY[0x1B3EA9930]();
        long long v72 = [v17 componentsSeparatedByString:@"/"];
        long long v75 = [v72 objectAtIndex:2];
        if ((unint64_t)[v72 count] >= 4)
        {
          BOOL v18 = [v75 stringByAppendingString:@"/"];
          BOOL v19 = [v72 objectAtIndex:3];
          uint64_t v20 = [v18 stringByAppendingString:v19];

          long long v75 = (void *)v20;
        }
        long long v73 = [v69 getTensorNamed:v17 directBind:1];
        v21 = [(_EARLMTGlobalNNLM *)v70 findTensorsIndicesByKeyWord:v75 tensorInfo:v102[5]];
        unint64_t v22 = (const void *)[v73 dataPointer];
        long long v89 = 0u;
        long long v90 = 0u;
        long long v88 = 0u;
        long long v87 = 0u;
        BOOL v23 = [v73 shape];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v87 objects:v111 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v88;
          int v26 = 1;
          do
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v88 != v25) {
                objc_enumerationMutation(v23);
              }
              id v28 = *(id *)(*((void *)&v87 + 1) + 8 * i);
              int v29 = [v28 intValue];

              v26 *= v29;
            }
            uint64_t v24 = [v23 countByEnumeratingWithState:&v87 objects:v111 count:16];
          }
          while (v24);
        }
        else
        {
          int v26 = 1;
        }

        __p = 0;
        v85 = 0;
        uint64_t v86 = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v22, (uint64_t)v22 + 4 * v26, v26);
        v30 = [v21 objectForKey:@"constant_blob"];
        BOOL v31 = v30 == 0;

        if (!v31)
        {
          uint64_t v32 = [v21 objectForKey:@"constant_blob"];
          StorageAccessor::EspressoStorageAccessor::SetDataView<float>((uint64_t)v96, [v32 integerValue], (uint64_t *)&__p);

          goto LABEL_33;
        }
        uint64_t v33 = [v21 objectForKey:@"Q_meta"];
        if (!v33
          || ([v21 objectForKey:@"weights_u8"],
              int v34 = objc_claimAutoreleasedReturnValue(),
              BOOL v35 = v34 == 0,
              v34,
              v33,
              v35))
        {
          float v42 = [v21 objectForKey:@"w_quantization_scale"];
          if (!v42
            || ([v21 objectForKey:@"W_int8"],
                float v43 = objc_claimAutoreleasedReturnValue(),
                BOOL v44 = v43 == 0,
                v43,
                v42,
                v44))
          {
            uint64_t v49 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v109 = v63;
            v50 = [NSString stringWithFormat:@"Exception in saving weights"];
            v110 = v50;
            id v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
            uint64_t v52 = [v49 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:1 userInfo:v51];

            id v74 = (id)v52;
            goto LABEL_33;
          }
          uint64_t v45 = [v21 objectForKey:@"w_quantization_scale"];
          [v45 floatValue];
          float v47 = v46;

          v77 = 0;
          uint64_t v78 = 0;
          v76 = 0;
          std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v76, __p, (uint64_t)v85, (v85 - (unsigned char *)__p) >> 2);
          quasar::QuantizationTool::SimpleQuantizeWithRatio((unint64_t **)&v76, (unint64_t *)v82, v47);
          if (v76)
          {
            v77 = v76;
            operator delete(v76);
          }
          uint64_t v48 = [v21 objectForKey:@"W_int8"];
          StorageAccessor::EspressoStorageAccessor::SetDataView<signed char>((uint64_t)v96, [v48 integerValue], (uint64_t *)v82);
        }
        else
        {
          id v36 = [v21 objectForKey:@"nB"];
          int v37 = [v36 intValue];

          long long v38 = [v21 objectForKey:@"nC"];
          int v39 = [v38 intValue];

          v80 = 0;
          uint64_t v81 = 0;
          v79 = 0;
          std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v79, __p, (uint64_t)v85, (v85 - (unsigned char *)__p) >> 2);
          quasar::QuantizationTool::LinearRegionQuantize(&v79, v37, v39, [&unk_1F0A74100 intValue], v82);
          if (v79)
          {
            v80 = v79;
            operator delete(v79);
          }
          BOOL v40 = [v21 objectForKey:@"Q_meta"];
          StorageAccessor::EspressoStorageAccessor::SetDataView<float>((uint64_t)v96, [v40 integerValue], (uint64_t *)v82);

          __int16 v41 = [v21 objectForKey:@"weights_u8"];
          StorageAccessor::EspressoStorageAccessor::SetDataView<unsigned char>((uint64_t)v96, (int)[v41 intValue], (uint64_t *)v83);

          if (v83[0])
          {
            v83[1] = v83[0];
            operator delete(v83[0]);
          }
        }
        if (v82[0])
        {
          v82[1] = v82[0];
          operator delete(v82[0]);
        }
LABEL_33:
        if (v74) {
          id v66 = v74;
        }
        if (__p)
        {
          v85 = __p;
          operator delete(__p);
        }

        if (v74)
        {

          goto LABEL_59;
        }
        id v74 = 0;
        ++v16;
      }
      while (v16 != v67);
      uint64_t v14 = obj;
      uint64_t v53 = [obj countByEnumeratingWithState:&v91 objects:v112 count:16];
      uint64_t v15 = v53;
      id v74 = 0;
      v54 = 0;
      if (!v53) {
        goto LABEL_58;
      }
    }
  }
  v54 = v74;
LABEL_58:

  id v74 = v54;
  id v66 = v74;
LABEL_59:
  StorageAccessor::EspressoStorageAccessor::~EspressoStorageAccessor((StorageAccessor::EspressoStorageAccessor *)v96);
  uint64_t v113 = *MEMORY[0x1E4FBA400];
  *(void *)&v114[*(void *)(v113 - 24) - 8] = *(void *)(MEMORY[0x1E4FBA400] + 24);
  MEMORY[0x1B3EA7CF0](v114);
  std::ostream::~ostream();
  MEMORY[0x1B3EA8520](&v115);
  v116[0] = *MEMORY[0x1E4FBA3F8];
  *(uint64_t *)((char *)v116 + *(void *)(v116[0] - 24)) = *(void *)(MEMORY[0x1E4FBA3F8] + 24);
  MEMORY[0x1B3EA7CF0](v117);
  std::istream::~istream();
  MEMORY[0x1B3EA8520](v118);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
  if (v99 < 0) {
    operator delete(v98);
  }

  _Block_object_dispose(&v101, 8);
LABEL_64:

  return v66;
}

- (id)setup
{
  v124[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"kaldiVocab"];

  if (!v3)
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v123 = *MEMORY[0x1E4F28568];
    id v12 = [NSString stringWithFormat:@"No vocab filename specified in recipe."];
    v124[0] = v12;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v124 forKeys:&v123 count:1];
    id v16 = [v17 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:151 userInfo:v9];
    goto LABEL_11;
  }
  uint64_t v4 = objc_opt_class();
  attachments = self->_attachments;
  assetPath = self->_assetPath;
  int v7 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"kaldiVocab"];
  id v8 = [(NSString *)assetPath stringByAppendingString:v7];
  uint64_t v9 = [v4 attachmentURL:attachments withName:v8];

  if (!v9)
  {
    BOOL v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v121 = *MEMORY[0x1E4F28568];
    BOOL v19 = NSString;
    id v15 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"kaldiVocab"];
    uint64_t v20 = [v19 stringWithFormat:@"No vocab file attached: %@", v15];
    v122 = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v122 forKeys:&v121 count:1];
    id v16 = [v18 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:151 userInfo:v21];

    goto LABEL_9;
  }
  uint64_t v10 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v120 = v9;
    _os_log_impl(&dword_1B1A86000, v10, OS_LOG_TYPE_INFO, "Attached vocabulary URL: %@", buf, 0xCu);
  }
  v104[0] = 0;
  uint64_t v11 = [[_EARLMTKaldiVocab alloc] initWithContentsOfUrl:v9 outError:v104];
  id v12 = v104[0];
  vocab = self->_vocab;
  self->_vocab = v11;

  if (!v12)
  {
    BOOL v23 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B1A86000, v23, OS_LOG_TYPE_INFO, "Vocabulary loaded", buf, 2u);
    }
    partialUpdateOffsets = self->_partialUpdateOffsets;
    self->_partialUpdateOffsets = 0;

    uint64_t v25 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"partialUpdateOffsetFile"];
    BOOL v26 = v25 == 0;

    if (v26) {
      goto LABEL_24;
    }
    v27 = objc_opt_class();
    id v28 = self->_attachments;
    int v29 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"partialUpdateOffsetFile"];
    v30 = [v27 attachmentURL:v28 withName:v29];

    if (v30)
    {
      id v103 = 0;
      BOOL v31 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v30 options:1 error:&v103];
      id v32 = v103;
      if (v32)
      {
        id v12 = v32;
        uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v113 = *MEMORY[0x1E4F28568];
        v114 = @"Unable to load partial update offsets";
        int v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
        id v16 = [v33 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:151 userInfo:v34];

LABEL_43:
        id v15 = v30;
        goto LABEL_10;
      }
      id v102 = 0;
      id v36 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v31 options:1 error:&v102];
      id v12 = v102;
      if (v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v83 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v111 = *MEMORY[0x1E4F28568];
        v112 = @"Unable to load _recipe[kRecipePartialUpdateOffsetFile] as json";
        uint64_t v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
        id v16 = [v83 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:153 userInfo:v84];

        goto LABEL_43;
      }
      int v37 = self->_partialUpdateOffsets;
      self->_partialUpdateOffsets = v36;

      self->_deltaIsPartial = 1;
LABEL_24:
      v110[0] = @"inferenceContextSize";
      v110[1] = @"trainingContextKey";
      v110[2] = @"trainingTargetKey";
      v110[3] = @"sequenceLength";
      v110[4] = @"numNoise";
      v110[5] = @"batchSize";
      v110[6] = @"trainingMaskKey";
      v110[7] = @"trainingNoiseKey";
      [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:8];
      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v38 = [v15 countByEnumeratingWithState:&v98 objects:v109 count:16];
      if (v38)
      {
        uint64_t v39 = *(void *)v99;
        while (2)
        {
          for (uint64_t i = 0; i != v38; ++i)
          {
            if (*(void *)v99 != v39) {
              objc_enumerationMutation(v15);
            }
            uint64_t v41 = *(void *)(*((void *)&v98 + 1) + 8 * i);
            float v42 = [(NSDictionary *)self->_recipe valueForKey:v41];
            BOOL v43 = v42 == 0;

            if (v43)
            {
              v80 = [NSString stringWithFormat:@"Unable to read recipe[%@]", v41];
              uint64_t v81 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v107 = *MEMORY[0x1E4F28568];
              uint64_t v108 = v80;
              v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
              id v16 = [v81 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:151 userInfo:v82];

              goto LABEL_9;
            }
          }
          uint64_t v38 = [v15 countByEnumeratingWithState:&v98 objects:v109 count:16];
          if (v38) {
            continue;
          }
          break;
        }
      }

      BOOL v44 = [TextProcessorInference alloc];
      uint64_t v45 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"inferenceContextSize"];
      float v46 = -[TextProcessorInference initWithLength:vocab:BOS:](v44, "initWithLength:vocab:BOS:", [v45 integerValue], self->_vocab, -[_EARLMTKaldiVocab beginOfSentenceIndex](self->_vocab, "beginOfSentenceIndex"));
      textProcessorInference = self->_textProcessorInference;
      self->_textProcessorInference = v46;

      uint64_t v48 = [DataSourceInference alloc];
      uint64_t v49 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"inferenceContextSize"];
      uint64_t v50 = [v49 integerValue];
      id v51 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingContextKey"];
      uint64_t v52 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingTargetKey"];
      uint64_t v53 = [(DataSourceInference *)v48 initWithLength:v50 contextKey:v51 targetKey:v52];
      fofeInferenceSource = self->_fofeInferenceSource;
      self->_fofeInferenceSource = v53;

      id v55 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"sequenceLength"];
      LODWORD(v49) = [v55 intValue];

      id v56 = [[TextProcessorTrain alloc] initWithVocab:self->_vocab];
      textProcessorTrain = self->_textProcessorTrain;
      self->_textProcessorTrain = v56;

      uint64_t v58 = (int)v49;
      trainData = self->_trainData;
      v97[0] = MEMORY[0x1E4F143A8];
      v97[1] = 3221225472;
      v97[2] = __26___EARLMTGlobalNNLM_setup__block_invoke;
      v97[3] = &unk_1E5FFE640;
      v97[4] = self;
      v97[5] = (int)v49;
      [(NSMutableArray *)trainData enumerateObjectsUsingBlock:v97];
      v60 = [DataSourceTrain alloc];
      unint64_t v61 = [(TextProcessorTrain *)self->_textProcessorTrain numberSamples];
      [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"numNoise"];
      v93 = unint64_t v92 = v61;
      LODWORD(v61) = [v93 intValue];
      long long v91 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"batchSize"];
      int v62 = [v91 intValue];
      unint64_t v63 = [(_EARLMTKaldiVocab *)self->_vocab vocabSize];
      std::string v95 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingContextKey"];
      long long v94 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingTargetKey"];
      id v64 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingMaskKey"];
      v65 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingNoiseKey"];
      id v66 = [(DataSourceTrain *)v60 initWithNumDataPoints:v92 sequenceLength:v58 noiseSize:(int)v61 batchSize:v62 vocabSize:v63 contextKey:v95 targetKey:v94 maskKey:v64 noiseKey:v65];
      fofeTrainSource = self->_fofeTrainSource;
      self->_fofeTrainSource = v66;

      uint64_t v68 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B1A86000, v68, OS_LOG_TYPE_INFO, "Data feeder loaded", buf, 2u);
      }
      id v96 = 0;
      v69 = [(_EARLMTGlobalNNLM *)self getEvalTask:&v96];
      id v70 = v96;
      id v12 = v70;
      if (!v69 || v70)
      {
        id v16 = v70;
      }
      else
      {
        v71 = [(_EARLMTGlobalNNLM *)self _fetchTensorInfo:v69];
        long long v72 = [v71 objectForKeyedSubscript:@"tensorInfo"];
        tensorInfo = self->_tensorInfo;
        self->_tensorInfo = v72;

        id v74 = [v71 objectForKeyedSubscript:@"totalSize"];
        self->_numParam = (int)[v74 intValue];

        if (!_parseRecipeBoolField(self->_recipe, @"enableMemoryMap", 0)) {
          operator new[]();
        }
        long long v75 = [[SimpleMmapBuffer alloc] initWithData:0 ofSize:4 * self->_numParam];
        mmappedWeights = self->_mmappedWeights;
        self->_mmappedWeights = v75;

        v77 = self->_mmappedWeights;
        if (v77)
        {
          value = self->_weights.__ptr_.__value_;
          self->_weights.__ptr_.__value_ = 0;
          if (value)
          {
            MEMORY[0x1B3EA8630](value, 0x1000C8052888210);
            v77 = self->_mmappedWeights;
          }
          v79 = [(SimpleMmapBuffer *)v77 dataPointer];
          self->_weightsRawPtr = v79;
          _fetchTensors(self->_tensorInfo, v69, (uint64_t)v79);
          v85 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          tensors = self->_tensors;
          self->_tensors = v85;

          long long v87 = sLog;
          if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B1A86000, v87, OS_LOG_TYPE_INFO, "Initial weights and tensor shapes have been read from evaluation graph", buf, 2u);
          }
          id v16 = 0;
        }
        else
        {
          long long v89 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v105 = *MEMORY[0x1E4F28568];
          id v106 = @"Unable to memory map the buffer";
          long long v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
          id v16 = [v89 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:151 userInfo:v90];
        }
      }

      goto LABEL_10;
    }
    BOOL v35 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v115 = *MEMORY[0x1E4F28568];
    v116 = @"recipe[kRecipePartialUpdateOffsetFile] is configured but not resolved";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
    id v16 = [v35 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:151 userInfo:v15];
LABEL_9:
    id v12 = 0;
    goto LABEL_10;
  }
  uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v117 = *MEMORY[0x1E4F28A50];
  id v118 = v12;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
  id v16 = [v14 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:151 userInfo:v15];
LABEL_10:

LABEL_11:
  return v16;
}

- (id)getEvalTask:(id *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v42[0] = @"inferenceInputs";
  v42[1] = @"inferenceOutputs";
  v42[2] = @"inferenceGraph";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:3];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v10 = [(NSDictionary *)self->_recipe valueForKey:v9];
        BOOL v11 = v10 == 0;

        if (v11)
        {
          id v12 = [NSString stringWithFormat:@"Unable to read recipe[%@]", v9];
          unint64_t v22 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v40 = *MEMORY[0x1E4F28568];
          uint64_t v41 = v12;
          id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
          [v22 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:154 userInfo:v15];
          v21 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v43 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v5 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"inferenceInputs"];
  id v12 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"inferenceOutputs"];
  assetPath = self->_assetPath;
  uint64_t v14 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"inferenceGraph"];
  id v15 = [(NSString *)assetPath stringByAppendingString:v14];

  int v29 = [(id)objc_opt_class() attachmentURL:self->_attachments withName:v15];
  id v16 = objc_alloc(MEMORY[0x1E4F611B8]);
  v17 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"checkpointName"];
  id v31 = 0;
  BOOL v18 = (void *)[v16 initWithTrainingNetworkPath:v29 inferenceInputs:v5 inferenceOutputs:v12 trainingInputs:v5 trainingOutputs:v12 trainingControlVariableName:@"is_training" withInitializer:v17 error:&v31];
  id v19 = v31;

  if (v19 || !v18)
  {
    BOOL v23 = (void *)MEMORY[0x1E4F28C58];
    v38[0] = *MEMORY[0x1E4F28568];
    id v20 = [NSString stringWithFormat:@"Unable to create ETModelDefinition (evaluation)"];
    v38[1] = *MEMORY[0x1E4F28A50];
    v39[0] = v20;
    v39[1] = v19;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
    *a3 = [v23 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:154 userInfo:v24];

LABEL_17:
    v21 = 0;
    goto LABEL_18;
  }
  id v30 = 0;
  id v20 = (id)[objc_alloc(MEMORY[0x1E4F611C8]) initWithTrainingModelDefinition:v18 forPlatform:1 error:&v30];
  id v19 = v30;
  if (v19 || !v20)
  {
    uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
    v36[0] = *MEMORY[0x1E4F28568];
    BOOL v26 = [NSString stringWithFormat:@"Unable to create ETTaskDefinition (evaluation)"];
    v36[1] = *MEMORY[0x1E4F28A50];
    v37[0] = v26;
    v37[1] = v19;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
    *a3 = [v25 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:154 userInfo:v27];

    goto LABEL_17;
  }
  id v20 = v20;
  v21 = v20;
LABEL_18:

LABEL_19:
  return v21;
}

- (id)findTensorsIndicesByKeyWord:(id)a3 tensorInfo:(id)a4
{
  id v5 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__16;
  id v16 = __Block_byref_object_dispose__16;
  id v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60___EARLMTGlobalNNLM_findTensorsIndicesByKeyWord_tensorInfo___block_invoke;
  v9[3] = &unk_1E6000550;
  id v10 = v5;
  BOOL v11 = &v12;
  id v6 = v5;
  [a4 enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)getTrainTask:(id *)a3
{
  v63[7] = *MEMORY[0x1E4F143B8];
  v63[0] = @"trainingGraph";
  v63[1] = @"inferenceInputs";
  v63[2] = @"inferenceOutputs";
  v63[3] = @"trainingInputs";
  v63[4] = @"trainingOutputs";
  v63[5] = @"trainingGlobals";
  v63[6] = @"numberOfEpochs";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:7];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v48 objects:v62 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v49;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v49 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v48 + 1) + 8 * i);
        id v10 = [(NSDictionary *)self->_recipe objectForKey:v9];
        BOOL v11 = v10 == 0;

        if (v11)
        {
          id v15 = [NSString stringWithFormat:@"Unable to read recipe[%@]", v9];
          int v29 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v60 = *MEMORY[0x1E4F28568];
          unint64_t v61 = v15;
          id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
          *a3 = [v29 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:152 userInfo:v30];

          id v28 = 0;
          uint64_t v14 = v5;
          goto LABEL_28;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v48 objects:v62 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  assetPath = self->_assetPath;
  uint64_t v13 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingGraph"];
  uint64_t v14 = [(NSString *)assetPath stringByAppendingString:v13];

  id v9 = [(id)objc_opt_class() attachmentURL:self->_attachments withName:v14];
  if (!v9)
  {
    id v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v58 = *MEMORY[0x1E4F28568];
    id v59 = @"training model is not attached";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    [v31 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:152 userInfo:v15];
    id v28 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  id v15 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingOutputs"];
  BOOL v43 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingInputs"];
  id v16 = objc_alloc(MEMORY[0x1E4F611B8]);
  id v17 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"inferenceInputs"];
  BOOL v18 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"inferenceOutputs"];
  id v19 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"checkpointName"];
  id v47 = 0;
  uint64_t v44 = (void *)[v16 initWithTrainingNetworkPath:v9 inferenceInputs:v17 inferenceOutputs:v18 trainingInputs:v43 trainingOutputs:v15 trainingControlVariableName:@"is_training" withInitializer:v19 error:&v47];
  id v20 = v47;

  if (v20 || !v44)
  {
    long long v32 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28A50];
    v56[0] = *MEMORY[0x1E4F28568];
    v56[1] = v33;
    v57[0] = @"Unable to create ETModelDefinition (train)";
    v57[1] = v20;
    uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
    long long v35 = v32;
    BOOL v26 = (void *)v34;
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", @"com.apple.siri.languagemodeltraining", 152);
    id v28 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v46 = 0;
    uint64_t v42 = [objc_alloc(MEMORY[0x1E4F611C8]) initWithTrainingModelDefinition:v44 forPlatform:1 error:&v46];
    id v20 = v46;
    if (v20 || !v42)
    {
      id v36 = (void *)MEMORY[0x1E4F28C58];
      v54[0] = *MEMORY[0x1E4F28568];
      int v37 = [NSString stringWithFormat:@"Unable to create ETTaskDefinition (training)"];
      v54[1] = *MEMORY[0x1E4F28A50];
      v55[0] = v37;
      v55[1] = v20;
      uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];
      *a3 = [v36 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:152 userInfo:v38];
    }
    else
    {
      v21 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B1A86000, v21, OS_LOG_TYPE_INFO, "Training model loaded", buf, 2u);
      }
      unint64_t numParam = self->_numParam;
      BOOL v23 = [(_EARLMTGlobalNNLM *)self _fetchTensorInfo:v42];
      uint64_t v24 = [v23 objectForKeyedSubscript:@"totalSize"];
      LOBYTE(numParam) = numParam == [v24 unsignedLongValue];

      if (numParam)
      {
        id v25 = [(_EARLMTGlobalNNLM *)self restoreFromLatestWeights:v42];
        *a3 = v25;
        BOOL v26 = (void *)v42;
        if (v25) {
          v27 = 0;
        }
        else {
          v27 = (void *)v42;
        }
        id v28 = v27;
        goto LABEL_27;
      }
      uint64_t v39 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v52 = *MEMORY[0x1E4F28568];
      uint64_t v53 = @"Unexpected number of parameters changed (training, this[%lu] vs previous[%lu])";
      uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      *a3 = [v39 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:152 userInfo:v40];
    }
    id v28 = 0;
    BOOL v26 = (void *)v42;
  }
LABEL_27:

LABEL_28:
  return v28;
}

- (id)restoreFromLatestWeights:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingGlobals", 0];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v5);
      }
      uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
      id v10 = [v4 getTensorNamed:v9 directBind:1];
      BOOL v11 = [(NSDictionary *)self->_tensors objectForKeyedSubscript:v9];
      uint64_t v12 = _copy(v11, v10);

      if (v12) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)evaluate
{
  os_log_t v2 = self;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1B3EA9930](self, a2);
  v88[0] = 0;
  id v3 = [(_EARLMTGlobalNNLM *)v2 getEvalTask:v88];
  id v4 = v88[0];
  if (!v3 || v4) {
    goto LABEL_7;
  }
  id v5 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B1A86000, v5, OS_LOG_TYPE_INFO, "Evaluation model loaded", buf, 2u);
  }
  if (v2->_weightsAreUpdated)
  {
    id v4 = [(_EARLMTGlobalNNLM *)v2 restoreFromLatestWeights:v3];
    if (v4)
    {
LABEL_7:
      id v72 = v4;
      id v66 = v72;
      goto LABEL_59;
    }
  }
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id obj = v2->_evalData;
  v69 = v3;
  long long v73 = v2;
  uint64_t v56 = [(NSMutableArray *)obj countByEnumeratingWithState:&v84 objects:v97 count:16];
  if (v56)
  {
    int v61 = 0;
    id v6 = 0;
    uint64_t v57 = *(void *)v85;
    uint64_t v64 = *MEMORY[0x1E4F28568];
    uint64_t v63 = *MEMORY[0x1E4F28A50];
    float v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        id v72 = v6;
        if (*(void *)v85 != v57) {
          objc_enumerationMutation(obj);
        }
        uint64_t v60 = (void *)[*(id *)(*((void *)&v84 + 1) + 8 * i) mutableCopy];
        [(TextProcessorInference *)v2->_textProcessorInference resetWithBOS:[(_EARLMTKaldiVocab *)v2->_vocab beginOfSentenceIndex]];
        uint64_t v8 = [(_EARLMTKaldiVocab *)v2->_vocab endOfSentenceToken];
        [v60 addObject:v8];

        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        id v65 = v60;
        uint64_t v9 = [v65 countByEnumeratingWithState:&v80 objects:v96 count:16];
        if (v9)
        {
          uint64_t v68 = *(void *)v81;
          while (2)
          {
            uint64_t v10 = 0;
            uint64_t v67 = v9;
            v61 += v9;
            do
            {
              if (*(void *)v81 != v68) {
                objc_enumerationMutation(v65);
              }
              id v71 = *(id *)(*((void *)&v80 + 1) + 8 * v10);
              -[TextProcessorInference addText:](v73->_textProcessorInference, "addText:");
              BOOL v11 = (void *)MEMORY[0x1B3EA9930]([(DataSourceInference *)v73->_fofeInferenceSource setVectorsWithProcessor:v73->_textProcessorInference]);
              fofeInferenceSource = v73->_fofeInferenceSource;
              id v79 = v72;
              uint64_t v13 = [v69 doInferenceOnData:fofeInferenceSource error:&v79];
              id v14 = v79;

              if (v13) {
                BOOL v15 = v14 == 0;
              }
              else {
                BOOL v15 = 0;
              }
              int v16 = v15;
              int v70 = v16;
              if (v15)
              {
                id v78 = 0;
                long long v17 = [v13 dataPointAtIndex:0 error:&v78];
                id v72 = v78;
                long long v74 = 0u;
                long long v75 = 0u;
                long long v76 = 0u;
                long long v77 = 0u;
                id v26 = v17;
                uint64_t v18 = [v26 countByEnumeratingWithState:&v74 objects:v93 count:16];
                if (v18)
                {
                  uint64_t v19 = *(void *)v75;
                  do
                  {
                    for (uint64_t j = 0; j != v18; ++j)
                    {
                      if (*(void *)v75 != v19) {
                        objc_enumerationMutation(v26);
                      }
                      id v21 = *(id *)(*((void *)&v74 + 1) + 8 * j);
                      unint64_t v22 = [v26 objectForKeyedSubscript:v21];
                      BOOL v23 = (float *)[v22 dataPointer];

                      float v24 = *v23;
                      float v7 = v7 + v24;
                    }
                    uint64_t v18 = [v26 countByEnumeratingWithState:&v74 objects:v93 count:16];
                  }
                  while (v18);
                }
              }
              else
              {
                id v25 = (void *)MEMORY[0x1E4F28C58];
                v94[0] = v64;
                v94[1] = v63;
                v95[0] = @"Call to doInferenceOnData during evaluation failed.";
                v95[1] = v14;
                id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:2];
                id v66 = [v25 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:154 userInfo:v26];
                id v72 = v14;
              }

              if (!v70)
              {

                goto LABEL_58;
              }
              ++v10;
            }
            while (v10 != v67);
            uint64_t v9 = [v65 countByEnumeratingWithState:&v80 objects:v96 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }

        id v6 = v72;
        os_log_t v2 = v73;
      }
      uint64_t v56 = [(NSMutableArray *)obj countByEnumeratingWithState:&v84 objects:v97 count:16];
    }
    while (v56);
  }
  else
  {
    int v61 = 0;
    id v6 = 0;
    float v7 = 0.0;
  }
  id v72 = v6;

  v27 = [(NSMutableDictionary *)v73->_results objectForKeyedSubscript:@"NumWordsInEvaluation"];
  id v28 = v27;
  if (!v27) {
    v27 = &unk_1F0A74118;
  }
  int v29 = [v27 intValue];

  if (v29 >= 1 && v29 != v61)
  {
    id v31 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
      [(_EARLMTGlobalNNLM *)v29 evaluate];
    }
  }
  if (v73->_weightsAreUpdated)
  {
    if (v73->_mmappedPartialWeights)
    {
      *(float *)&double v30 = v7;
      long long v32 = [NSNumber numberWithFloat:v30];
      [(NSMutableDictionary *)v73->_results setObject:v32 forKeyedSubscript:@"TotalEvalCostWithPartialUpdate"];

      float v33 = v7 / (float)v61;
      float v34 = expf(v33);
      *(float *)&double v35 = v33;
      id v36 = [NSNumber numberWithFloat:v35];
      [(NSMutableDictionary *)v73->_results setObject:v36 forKeyedSubscript:@"EvaluationCostWithPartialUpdate"];

      *(float *)&double v37 = v34;
      uint64_t v38 = [NSNumber numberWithFloat:v37];
      [(NSMutableDictionary *)v73->_results setObject:v38 forKeyedSubscript:@"EvaluationPPLWithPartialUpdate"];

      uint64_t v39 = sLog;
      if (!os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO)) {
        goto LABEL_57;
      }
      *(_DWORD *)buf = 134218240;
      double v90 = v33;
      __int16 v91 = 2048;
      double v92 = v34;
      uint64_t v40 = "evaluation cost/PPL with partial update: %.2f/%.2f";
    }
    else
    {
      *(float *)&double v30 = v7;
      long long v48 = [NSNumber numberWithFloat:v30];
      [(NSMutableDictionary *)v73->_results setObject:v48 forKeyedSubscript:@"TotalEvalCostAfterTraining"];

      float v49 = v7 / (float)v61;
      float v50 = expf(v49);
      *(float *)&double v51 = v49;
      uint64_t v52 = [NSNumber numberWithFloat:v51];
      [(NSMutableDictionary *)v73->_results setObject:v52 forKeyedSubscript:@"EvaluationCostAfterTraining"];

      *(float *)&double v53 = v50;
      v54 = [NSNumber numberWithFloat:v53];
      [(NSMutableDictionary *)v73->_results setObject:v54 forKeyedSubscript:@"EvaluationPPLAfterTraining"];

      uint64_t v39 = sLog;
      if (!os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO)) {
        goto LABEL_57;
      }
      *(_DWORD *)buf = 134218240;
      double v90 = v49;
      __int16 v91 = 2048;
      double v92 = v50;
      uint64_t v40 = "evaluation cost/PPL after training: %.2f/%.2f";
    }
  }
  else
  {
    *(float *)&double v30 = v7;
    uint64_t v41 = [NSNumber numberWithFloat:v30];
    [(NSMutableDictionary *)v73->_results setObject:v41 forKeyedSubscript:@"TotalEvalCostBeforeTraining"];

    float v42 = v7 / (float)v61;
    float v43 = expf(v42);
    *(float *)&double v44 = v42;
    uint64_t v45 = [NSNumber numberWithFloat:v44];
    [(NSMutableDictionary *)v73->_results setObject:v45 forKeyedSubscript:@"EvaluationCostBeforeTraining"];

    *(float *)&double v46 = v43;
    id v47 = [NSNumber numberWithFloat:v46];
    [(NSMutableDictionary *)v73->_results setObject:v47 forKeyedSubscript:@"EvaluationPPLBeforeTraining"];

    uint64_t v39 = sLog;
    if (!os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO)) {
      goto LABEL_57;
    }
    *(_DWORD *)buf = 134218240;
    double v90 = v42;
    __int16 v91 = 2048;
    double v92 = v43;
    uint64_t v40 = "evaluation cost/PPL before training: %.2f/%.2f";
  }
  _os_log_impl(&dword_1B1A86000, v39, OS_LOG_TYPE_INFO, v40, buf, 0x16u);
LABEL_57:
  id v66 = 0;
LABEL_58:
  id v3 = v69;
LABEL_59:

  return v66;
}

- (id)train
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  uint64_t v58 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = MEMORY[0x1B3EA9930]();
  v95[0] = 0;
  id v4 = [(_EARLMTGlobalNNLM *)self getTrainTask:v95];
  id v5 = v95[0];
  context = (void *)v3;
  if (!v4 || v5)
  {
    id v20 = v5;
    int v21 = 1;
    unint64_t v22 = v20;
    goto LABEL_35;
  }
  uint64_t v57 = v4;
  id v55 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingOutputs"];
  id v6 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"learningRateName"];
  BOOL v7 = v6 == 0;

  if (!v7)
  {
    uint64_t v8 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"learningRateName"];
    uint64_t v9 = [v4 getTensorNamed:v8];

    uint64_t v10 = (float *)[v9 dataPointer];
    BOOL v11 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      double v12 = *v10;
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_1B1A86000, v11, OS_LOG_TYPE_INFO, "The learning rate embedded in the training graph is %f", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v13 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"learningRateValue"];
    BOOL v14 = v13 == 0;

    if (!v14)
    {
      BOOL v15 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"learningRateValue"];
      [v15 floatValue];
      *(_DWORD *)uint64_t v10 = v16;

      long long v17 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"learningRateName"];
      id v94 = 0;
      [v57 setTensorNamed:v17 withValue:v9 error:&v94];
      id v18 = v94;

      uint64_t v19 = sLog;
      if (v18)
      {
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
          -[_EARLMTGlobalNNLM train](v19);
        }
      }
      else if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
      {
        double v23 = *v10;
        LODWORD(buf) = 134217984;
        *(double *)((char *)&buf + 4) = v23;
        _os_log_impl(&dword_1B1A86000, v19, OS_LOG_TYPE_INFO, "Override learning rate with value %f", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  float v24 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"batchPerUpdate"];
  int v25 = [v24 unsignedIntValue];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v104 = 0x3032000000;
  uint64_t v105 = __Block_byref_object_copy__16;
  id v106 = __Block_byref_object_dispose__16;
  id v107 = (id)objc_opt_new();
  uint64_t v88 = 0;
  long long v89 = &v88;
  uint64_t v90 = 0x3032000000;
  __int16 v91 = __Block_byref_object_copy__16;
  double v92 = __Block_byref_object_dispose__16;
  uint64_t v26 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"sparseGlobals"];
  v27 = (void *)v26;
  id v28 = (void *)MEMORY[0x1E4F1CBF0];
  if (v26) {
    id v28 = (void *)v26;
  }
  id v93 = v28;

  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x2020000000;
  int v87 = 0;
  uint64_t v82 = 0;
  long long v83 = (float *)&v82;
  uint64_t v84 = 0x2020000000;
  float v85 = 0.0;
  int v29 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"l2ClipNorm"];
  [v29 floatValue];
  if (v30 == 0.0) {
    float v31 = 0.0;
  }
  else {
    float v31 = v30;
  }

  float v85 = v31;
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x2020000000;
  BOOL v81 = 0;
  float v32 = v83[6];
  BOOL v81 = v32 > 0.0;
  uint64_t v33 = sLog;
  BOOL v34 = os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO);
  if (v32 <= 0.0)
  {
    if (!v34) {
      goto LABEL_26;
    }
    LOWORD(v100) = 0;
    id v36 = "Gradients are not clipped";
    double v37 = v33;
    uint32_t v38 = 2;
  }
  else
  {
    if (!v34) {
      goto LABEL_26;
    }
    double v35 = v83[6];
    LODWORD(v100) = 134217984;
    *(double *)((char *)&v100 + 4) = v35;
    id v36 = "Gradients are clipped by global L2Norm of %f";
    double v37 = v33;
    uint32_t v38 = 12;
  }
  _os_log_impl(&dword_1B1A86000, v37, OS_LOG_TYPE_INFO, v36, (uint8_t *)&v100, v38);
LABEL_26:
  *(void *)&long long v100 = 0;
  *((void *)&v100 + 1) = &v100;
  uint64_t v101 = 0x2020000000;
  BOOL v102 = v25 > 0;
  if (v25 >= 1)
  {
    uint64_t v39 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      uint64_t v40 = v89[5];
      *(_DWORD *)uint64_t v98 = 138412290;
      uint64_t v99 = v40;
      _os_log_impl(&dword_1B1A86000, v39, OS_LOG_TYPE_INFO, "Gradient of %@ are accumulated in a sparse fashion", v98, 0xCu);
    }
  }
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __26___EARLMTGlobalNNLM_train__block_invoke;
  v70[3] = &unk_1E6000578;
  id v41 = v55;
  id v71 = v41;
  id v72 = v58;
  long long v73 = self;
  long long v75 = v86;
  p_long long buf = &buf;
  long long v77 = v80;
  id v78 = &v82;
  id v79 = &v100;
  id v42 = v57;
  id v74 = v42;
  float v43 = (void *)MEMORY[0x1B3EA9B60](v70);
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __26___EARLMTGlobalNNLM_train__block_invoke_307;
  v60[3] = &unk_1E60005A0;
  id v44 = v41;
  id v61 = v44;
  int v62 = self;
  uint64_t v63 = v86;
  uint64_t v64 = &buf;
  int v69 = v25;
  id v65 = &v88;
  id v66 = v80;
  uint64_t v67 = &v82;
  uint64_t v68 = &v100;
  uint64_t v45 = (void *)MEMORY[0x1B3EA9B60](v60);
  double v46 = objc_opt_new();
  id v47 = (void *)MEMORY[0x1B3EA9B60](v43);
  [v46 setObject:v47 forKeyedSubscript:*MEMORY[0x1E4F61190]];

  if (*(unsigned char *)(*((void *)&v100 + 1) + 24))
  {
    long long v48 = (void *)MEMORY[0x1B3EA9B60](v45);
    [v46 setObject:v48 forKeyedSubscript:*MEMORY[0x1E4F61178]];
  }
  [(TextProcessorTrain *)self->_textProcessorTrain shuffleSamples];
  [(DataSourceTrain *)self->_fofeTrainSource setVectorsWithProcessor:self->_textProcessorTrain];
  fofeTrainSource = self->_fofeTrainSource;
  unint64_t v22 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"numberOfEpochs"];
  id v59 = 0;
  char v50 = objc_msgSend(v42, "doTrainingOnData:forNumberOfEpochs:withCallback:error:", fofeTrainSource, (int)objc_msgSend(v22, "intValue"), v46, &v59);
  id v20 = v59;

  if (v50)
  {
    int v21 = 0;
  }
  else
  {
    double v51 = (void *)MEMORY[0x1E4F28C58];
    v96[0] = *MEMORY[0x1E4F28568];
    uint64_t v52 = [NSString stringWithFormat:@"Training failed with error."];
    v96[1] = *MEMORY[0x1E4F28A50];
    v97[0] = v52;
    v97[1] = v20;
    double v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:2];
    unint64_t v22 = [v51 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:152 userInfo:v53];

    int v21 = 1;
  }

  _Block_object_dispose(&v100, 8);
  _Block_object_dispose(v80, 8);
  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(v86, 8);
  _Block_object_dispose(&v88, 8);

  _Block_object_dispose(&buf, 8);
  id v4 = v57;
LABEL_35:

  if (!v21)
  {
    [(NSMutableDictionary *)self->_results setObject:v58 forKeyedSubscript:@"TrainingCostOfEachBatch"];
    unint64_t v22 = 0;
    self->_weightsAreUpdated = 1;
  }

  return v22;
}

- (id)evaluatePartialDelta
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v49[0] = 0;
  uint64_t v3 = [(_EARLMTGlobalNNLM *)self getEvalTask:v49];
  id v4 = v49[0];
  float v43 = v3;
  if (v3 && !v4)
  {
    _fetchTensors(self->_tensorInfo, v3, (uint64_t)self->_weightsRawPtr);
    id v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    tensors = self->_tensors;
    self->_tensors = v5;

    id v44 = [(SimpleMmapBuffer *)self->_mmappedPartialWeights dataPointer];
    unint64_t v7 = [(SimpleMmapBuffer *)self->_mmappedPartialWeights size];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingGlobals"];
    uint64_t v8 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
    unint64_t v9 = 0;
    if (v8)
    {
      unint64_t v10 = v7 >> 2;
      uint64_t v11 = *(void *)v46;
      uint64_t v39 = *(void *)v46;
      do
      {
        uint64_t v12 = 0;
        uint64_t v40 = v8;
        while (2)
        {
          if (*(void *)v46 != v11) {
            objc_enumerationMutation(obj);
          }
          unint64_t v13 = 0;
          uint64_t v41 = v12;
          uint64_t v14 = *(void *)(*((void *)&v45 + 1) + 8 * v12);
          while (1)
          {
            BOOL v15 = [(NSMutableDictionary *)self->_partialUpdateOffsets objectForKeyedSubscript:v14];
            BOOL v16 = v13 < [v15 count];

            if (!v16) {
              break;
            }
            long long v17 = [(NSMutableDictionary *)self->_partialUpdateOffsets objectForKeyedSubscript:v14];
            id v18 = [v17 objectAtIndexedSubscript:v13];
            uint64_t v19 = [v18 objectForKeyedSubscript:@"start"];
            unint64_t v20 = [v19 unsignedIntegerValue];

            int v21 = [(NSMutableDictionary *)self->_partialUpdateOffsets objectForKeyedSubscript:v14];
            unint64_t v22 = [v21 objectAtIndexedSubscript:v13];
            double v23 = [v22 objectForKeyedSubscript:@"end"];
            unint64_t v24 = [v23 unsignedIntegerValue];

            int v25 = [(NSDictionary *)self->_tensorInfo objectForKeyedSubscript:v14];
            uint64_t v26 = [v25 objectForKeyedSubscript:@"size"];
            unsigned int v27 = [v26 unsignedIntValue];

            id v28 = [(NSDictionary *)self->_tensors objectForKeyedSubscript:v14];
            uint64_t v29 = [v28 dataPointer];

            if (v20 < v24)
            {
              while (1)
              {
                if (v20 > v27)
                {
                  uint64_t v33 = [NSString stringWithFormat:@"setting %@[%lu] while size(%@) == %lu", v14, v20, v14, v27];
                  BOOL v34 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v52 = *MEMORY[0x1E4F28568];
                  double v53 = v33;
                  double v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
                  uint64_t v36 = [v34 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:154 userInfo:v35];
                  goto LABEL_25;
                }
                if (v9 > v10) {
                  break;
                }
                unint64_t v30 = v9 + 1;
                *(float *)(v29 + 4 * v20) = v44[v9] + *(float *)(v29 + 4 * v20);
                ++v20;
                ++v9;
                if (v24 == v20) {
                  goto LABEL_16;
                }
              }
              uint64_t v33 = objc_msgSend(NSString, "stringWithFormat:", @"accessing partiaDelta[%lu] while size(partiaDelta) == %lu", v9, v10);
              double v37 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v50 = *MEMORY[0x1E4F28568];
              double v51 = v33;
              double v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
              uint64_t v36 = [v37 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:154 userInfo:v35];
LABEL_25:
              float v32 = (void *)v36;

              id v31 = 0;
              goto LABEL_26;
            }
            unint64_t v30 = v9;
LABEL_16:
            ++v13;
            unint64_t v9 = v30;
          }
          uint64_t v12 = v41 + 1;
          uint64_t v11 = v39;
          if (v41 + 1 != v40) {
            continue;
          }
          break;
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v8);
    }

    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEBUG)) {
      -[_EARLMTGlobalNNLM evaluatePartialDelta]();
    }
    id v4 = [(_EARLMTGlobalNNLM *)self evaluate];
  }
  id v31 = v4;
  float v32 = v31;
LABEL_26:

  return v32;
}

- (id)computeDelta:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = MEMORY[0x1B3EA9930](self, a2);
  id v146 = 0;
  id v6 = [(_EARLMTGlobalNNLM *)self getEvalTask:&v146];
  context = (void *)v5;
  BOOL v129 = v3;
  id v7 = v146;
  v130 = v7;
  v132 = v6;
  if (!v6 || v7)
  {
    double v10 = COERCE_DOUBLE(v7);
    int v36 = 1;
  }
  else
  {
    uint64_t v8 = self->_tensorInfo;
    id v9 = v6;
    double v10 = COERCE_DOUBLE(objc_opt_new());
    long long v149 = 0u;
    long long v150 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    uint64_t v11 = v8;
    uint64_t v12 = [(NSDictionary *)v11 countByEnumeratingWithState:&v147 objects:buf count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v148;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v148 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v147 + 1) + 8 * i);
          BOOL v16 = [v9 getTensorNamed:v15 directBind:1];
          [*(id *)&v10 setObject:v16 forKeyedSubscript:v15];
        }
        uint64_t v12 = [(NSDictionary *)v11 countByEnumeratingWithState:&v147 objects:buf count:16];
      }
      while (v12);
    }

    long long v142 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    long long v145 = 0u;
    id v17 = *(id *)&v10;
    v133 = v17;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v142 objects:v169 count:16];
    if (v18)
    {
      uint64_t v125 = *(void *)v143;
      do
      {
        uint64_t v19 = 0;
        uint64_t v123 = v18;
        do
        {
          if (*(void *)v143 != v125) {
            objc_enumerationMutation(v17);
          }
          uint64_t v20 = *(void *)(*((void *)&v142 + 1) + 8 * v19);
          int v21 = [v17 objectForKeyedSubscript:v20];
          uint64_t v127 = v19;
          uint64_t v22 = [v21 dataPointer];

          double v10 = 0.0;
          while (1)
          {
            double v23 = [(NSDictionary *)self->_tensorInfo objectForKeyedSubscript:v20];
            unint64_t v24 = [v23 objectForKeyedSubscript:@"size"];
            BOOL v25 = *(void *)&v10 < (int)[v24 intValue];

            if (!v25) {
              break;
            }
            uint64_t v26 = [(NSDictionary *)self->_tensorInfo objectForKeyedSubscript:v20];
            unsigned int v27 = [v26 objectForKeyedSubscript:@"offset"];
            unsigned int v28 = [v27 intValue];

            weightsRawPtr = self->_weightsRawPtr;
            float v30 = weightsRawPtr[LODWORD(v10) + v28] - *(float *)(v22 + 4 * *(void *)&v10);
            weightsRawPtr[LODWORD(v10) + v28] = v30;
            ++*(void *)&v10;
            if ((LODWORD(v30) & 0x7FFFFFFFu) >= 0x7F800000)
            {
              double v37 = objc_msgSend(NSString, "stringWithFormat:", @"delta[%d] is not finite", *(void *)&v10 + v28 - 1);
              uint32_t v38 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v167 = *MEMORY[0x1E4F28568];
              v168 = v37;
              uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v168 forKeys:&v167 count:1];
              double v10 = [v38 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:156 userInfo:v39];

              goto LABEL_26;
            }
          }
          uint64_t v19 = v127 + 1;
          id v17 = v133;
        }
        while (v127 + 1 != v123);
        uint64_t v18 = [v133 countByEnumeratingWithState:&v142 objects:v169 count:16];
      }
      while (v18);
    }

    unint64_t numParam = self->_numParam;
    if (numParam)
    {
      float v32 = self->_weightsRawPtr;
      uint64_t v33 = 4 * numParam;
      double v34 = 0.0;
      do
      {
        float v35 = *v32++;
        double v34 = v34 + (float)(v35 * v35);
        v33 -= 4;
      }
      while (v33);
    }
    else
    {
      double v34 = 0.0;
    }
    float v54 = sqrt(v34);
    uint64_t v55 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      double v171 = v54;
      _os_log_impl(&dword_1B1A86000, v55, OS_LOG_TYPE_INFO, "l2-norm of the delta is %f", buf, 0xCu);
    }
    *(float *)&double v56 = v54;
    uint64_t v57 = [NSNumber numberWithFloat:v56];
    [(NSMutableDictionary *)self->_results setObject:v57 forKeyedSubscript:@"DeltaL2Norm"];

    if (!self->_deltaIsPartial) {
      goto LABEL_101;
    }
    self->_unint64_t numParam = 0;
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    uint64_t v58 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingGlobals"];
    uint64_t v59 = [v58 countByEnumeratingWithState:&v138 objects:v166 count:16];
    if (v59)
    {
      uint64_t v60 = *(void *)v139;
      v128 = v58;
      uint64_t v122 = *(void *)v139;
      do
      {
        uint64_t v61 = 0;
        uint64_t v124 = v59;
        while (2)
        {
          if (*(void *)v139 != v60) {
            objc_enumerationMutation(v58);
          }
          uint64_t v126 = v61;
          double v10 = *(double *)(*((void *)&v138 + 1) + 8 * v61);
          int v62 = [(NSDictionary *)self->_tensorInfo objectForKeyedSubscript:*(void *)&v10];
          uint64_t v63 = [v62 objectForKeyedSubscript:@"offset"];
          int v64 = [(id)v63 intValue];

          id v65 = [(NSMutableDictionary *)self->_partialUpdateOffsets objectForKeyedSubscript:*(void *)&v10];
          LOBYTE(v63) = v65 == 0;

          if (v63)
          {
            v164[0] = &unk_1F0A74118;
            v163[0] = @"start";
            v163[1] = @"end";
            id v66 = [(NSDictionary *)self->_tensorInfo objectForKeyedSubscript:*(void *)&v10];
            uint64_t v67 = [v66 objectForKeyedSubscript:@"size"];
            v163[2] = @"scale";
            v164[1] = v67;
            v164[2] = &unk_1F0A74218;
            uint64_t v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v164 forKeys:v163 count:3];
            v165 = v68;
            int v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v165 count:1];
            [(NSMutableDictionary *)self->_partialUpdateOffsets setObject:v69 forKeyedSubscript:*(void *)&v10];

            int v70 = sLog;
            if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138412290;
              double v171 = v10;
              _os_log_debug_impl(&dword_1B1A86000, v70, OS_LOG_TYPE_DEBUG, "%@ applies full update", buf, 0xCu);
            }
          }
          for (unint64_t j = 0; ; ++j)
          {
            id v72 = [(NSMutableDictionary *)self->_partialUpdateOffsets objectForKeyedSubscript:*(void *)&v10];
            BOOL v73 = j < [v72 count];

            if (!v73) {
              break;
            }
            id v74 = [(NSMutableDictionary *)self->_partialUpdateOffsets objectForKeyedSubscript:*(void *)&v10];
            long long v75 = [v74 objectAtIndexedSubscript:j];
            long long v76 = [v75 objectForKeyedSubscript:@"start"];
            int v77 = [v76 unsignedIntValue];

            id v78 = [(NSMutableDictionary *)self->_partialUpdateOffsets objectForKeyedSubscript:*(void *)&v10];
            id v79 = [v78 objectAtIndexedSubscript:j];
            long long v80 = [v79 objectForKeyedSubscript:@"end"];
            LODWORD(v75) = [v80 unsignedIntValue];

            BOOL v81 = [(NSMutableDictionary *)self->_partialUpdateOffsets objectForKeyedSubscript:*(void *)&v10];
            uint64_t v82 = [v81 objectAtIndexedSubscript:j];
            long long v83 = [v82 objectForKeyedSubscript:@"scale"];
            [v83 floatValue];
            float v85 = v84;

            unint64_t v86 = (v77 + v64);
            uint64_t v87 = (v75 + v64);
            if (v86 < v87)
            {
              unint64_t v88 = self->_numParam;
              while (v86 >= v88)
              {
                long long v89 = self->_weightsRawPtr;
                float v90 = v85 * v89[v86];
                self->_unint64_t numParam = v88 + 1;
                v89[v88] = v90;
                ++v86;
                ++v88;
                if (v87 == v86) {
                  goto LABEL_62;
                }
              }
              id v96 = objc_msgSend(NSString, "stringWithFormat:", @"shifting delta[%lu] to delta[%lu] may overwrite chosen gradient", v86, v88);
              v97 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v161 = *MEMORY[0x1E4F28568];
              v162 = v96;
              uint64_t v98 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v162 forKeys:&v161 count:1];
              double v10 = [v97 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:156 userInfo:v98];

              goto LABEL_26;
            }
LABEL_62:
            ;
          }
          uint64_t v61 = v126 + 1;
          uint64_t v58 = v128;
          uint64_t v60 = v122;
          if (v126 + 1 != v124) {
            continue;
          }
          break;
        }
        uint64_t v59 = [v128 countByEnumeratingWithState:&v138 objects:v166 count:16];
      }
      while (v59);
    }

    unint64_t v91 = self->_numParam;
    if (v91)
    {
      double v92 = self->_weightsRawPtr;
      uint64_t v93 = 4 * v91;
      double v94 = 0.0;
      do
      {
        float v95 = *v92++;
        double v94 = v94 + (float)(v95 * v95);
        v93 -= 4;
      }
      while (v93);
    }
    else
    {
      double v94 = 0.0;
    }
    float v99 = sqrt(v94);
    long long v100 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      double v171 = v99;
      _os_log_impl(&dword_1B1A86000, v100, OS_LOG_TYPE_INFO, "l2-norm of the partial delta before normalization is %f", buf, 0xCu);
    }
    unint64_t v101 = self->_numParam;
    double v102 = 0.0;
    if (v101)
    {
      id v103 = self->_weightsRawPtr;
      uint64_t v104 = v103;
      unint64_t v105 = self->_numParam;
      do
      {
        *uint64_t v104 = (float)(v54 / v99) * *v104;
        ++v104;
        --v105;
      }
      while (v105);
      uint64_t v106 = 4 * v101;
      double v102 = 0.0;
      do
      {
        float v107 = *v103++;
        double v102 = v102 + (float)(v107 * v107);
        v106 -= 4;
      }
      while (v106);
    }
    uint64_t v108 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      float v109 = sqrt(v102);
      *(_DWORD *)long long buf = 134217984;
      double v171 = v109;
      _os_log_impl(&dword_1B1A86000, v108, OS_LOG_TYPE_INFO, "l2-norm of the partial delta after normalization is %f", buf, 0xCu);
    }
    v110 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      double v111 = *(double *)&self->_numParam;
      *(_DWORD *)long long buf = 134217984;
      double v171 = v111;
      _os_log_impl(&dword_1B1A86000, v110, OS_LOG_TYPE_INFO, "Gradients of %lu parameters are chosen and sent to server", buf, 0xCu);
    }
    v112 = [[SimpleMmapBuffer alloc] initWithData:self->_weightsRawPtr ofSize:4 * self->_numParam];
    mmappedPartialWeights = self->_mmappedPartialWeights;
    self->_mmappedPartialWeights = v112;

    if (!self->_mmappedPartialWeights)
    {
      id v118 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v159 = *MEMORY[0x1E4F28568];
      v160 = @"Unable to buffer partial delta";
      v119 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v160 forKeys:&v159 count:1];
      double v10 = [v118 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:1 userInfo:v119];

LABEL_26:
      int v36 = 1;
    }
    else
    {
LABEL_101:
      if (_parseRecipeBoolField(self->_recipe, @"deltaIsWeighted", 1))
      {
        unint64_t v114 = self->_numParam;
        if (v114)
        {
          float numWordsTrain = (float)self->_numWordsTrain;
          v116 = self->_weightsRawPtr;
          do
          {
            float *v116 = *v116 * numWordsTrain;
            ++v116;
            --v114;
          }
          while (v114);
        }
        uint64_t v117 = sLog;
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B1A86000, v117, OS_LOG_TYPE_INFO, "delta is weighted", buf, 2u);
        }
      }
      int v36 = 0;
    }
  }
  if (!v36)
  {
    if (!v129)
    {
      double v51 = [MEMORY[0x1E4F1C9B8] dataWithBytes:self->_weightsRawPtr length:4 * self->_numParam];
      double v10 = 0.0;
      delta = self->_delta;
      self->_delta = v51;
LABEL_95:

      goto LABEL_96;
    }
    v158[0] = @"maxNorm";
    v158[1] = @"normBinCount";
    [MEMORY[0x1E4F1C978] arrayWithObjects:v158 count:2];
    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    delta = (NSData *)(id)objc_claimAutoreleasedReturnValue();
    uint64_t v41 = [(NSData *)delta countByEnumeratingWithState:&v134 objects:v157 count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v135;
      while (2)
      {
        for (uint64_t k = 0; k != v41; ++k)
        {
          if (*(void *)v135 != v42) {
            objc_enumerationMutation(delta);
          }
          uint64_t v44 = *(void *)(*((void *)&v134 + 1) + 8 * k);
          long long v45 = [(NSDictionary *)self->_recipe valueForKey:v44];
          BOOL v46 = v45 == 0;

          if (v46)
          {
            long long v48 = [NSString stringWithFormat:@"Unable to read recipe[%@]", v44];
            uint64_t v52 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v155 = *MEMORY[0x1E4F28568];
            v156 = v48;
            double v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v156 forKeys:&v155 count:1];
            double v10 = [v52 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:153 userInfo:v53];
            long long v47 = delta;
            goto LABEL_93;
          }
        }
        uint64_t v41 = [(NSData *)delta countByEnumeratingWithState:&v134 objects:v157 count:16];
        if (v41) {
          continue;
        }
        break;
      }
    }

    long long v47 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"iCloudAggServiceKey"];
    if (v47
      || ([(NSDictionary *)self->_recipe objectForKeyedSubscript:@"HaruspexKey"],
          (long long v47 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      long long v48 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v47 options:0];
      uint64_t v49 = *MEMORY[0x1E4F28568];
      if (!v48)
      {
        uint64_t v50 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v153 = *MEMORY[0x1E4F28568];
        v154 = @"Corrupted HaruspexKey";
        long long v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v154 forKeys:&v153 count:1];
        double v10 = [v50 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:153 userInfo:v48];
LABEL_94:

        goto LABEL_95;
      }
    }
    else
    {
      long long v48 = 0;
      uint64_t v49 = *MEMORY[0x1E4F28568];
    }
    v120 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v151 = v49;
    v152 = @"Privatization of deltas failed";
    double v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v152 forKeys:&v151 count:1];
    double v10 = [v120 errorWithDomain:@"com.apple.siri.languagemodeltraining" code:153 userInfo:v53];
LABEL_93:

    goto LABEL_94;
  }
LABEL_96:

  return *(id *)&v10;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (NSData)delta
{
  return self->_delta;
}

- (NSMutableArray)trainData
{
  return self->_trainData;
}

- (void)setTrainData:(id)a3
{
}

- (NSMutableArray)evalData
{
  return self->_evalData;
}

- (void)setEvalData:(id)a3
{
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (BOOL)deltaIsPartial
{
  return self->_deltaIsPartial;
}

- (_EARLMTKaldiVocab)vocab
{
  return self->_vocab;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_delta, 0);
  objc_storeStrong((id *)&self->_mmappedPartialWeights, 0);
  objc_storeStrong((id *)&self->_partialUpdateOffsets, 0);
  objc_storeStrong((id *)&self->_tensorInfo, 0);
  objc_storeStrong((id *)&self->_tensorsWeightMap, 0);
  objc_storeStrong((id *)&self->_tensors, 0);
  objc_storeStrong((id *)&self->_mmappedWeights, 0);
  value = self->_weights.__ptr_.__value_;
  self->_weights.__ptr_.__value_ = 0;
  if (value) {
    MEMORY[0x1B3EA8630](value, 0x1000C8052888210);
  }
  objc_storeStrong((id *)&self->_assetPath, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_fofeTrainSource, 0);
  objc_storeStrong((id *)&self->_textProcessorTrain, 0);
  objc_storeStrong((id *)&self->_fofeInferenceSource, 0);
  objc_storeStrong((id *)&self->_textProcessorInference, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_vocab, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_evalData, 0);
  objc_storeStrong((id *)&self->_trainData, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
}

- (id).cxx_construct
{
  *((void *)self + 17) = 0;
  return self;
}

- (void)evaluate
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_1B1A86000, log, OS_LOG_TYPE_ERROR, "Data size mismatch. %d tokens were fetched while %d words were evaluated", (uint8_t *)v3, 0xEu);
}

- (void)train
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B1A86000, log, OS_LOG_TYPE_ERROR, "Unable to override learning rate", v1, 2u);
}

- (void)evaluatePartialDelta
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1B1A86000, v0, OS_LOG_TYPE_DEBUG, "parsed %lu chosen gradients", v1, 0xCu);
}

@end