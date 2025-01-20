@interface SMTGlobalNNLM
+ (id)attachmentURL:(id)a3 withName:(id)a4;
+ (id)compressedAttachmentURLFromRecipe:(id)a3 attachments:(id)a4;
+ (void)initialize;
- (BOOL)deltaIsPartial;
- (NSArray)attachments;
- (NSData)delta;
- (NSMutableArray)evalData;
- (NSMutableArray)trainData;
- (NSMutableDictionary)results;
- (SMTGlobalNNLM)initWithRecipe:(id)a3;
- (SMTKaldiVocab)vocab;
- (id).cxx_construct;
- (id)_fetchTensorInfo:(id)a3;
- (id)computeDelta:(BOOL)a3;
- (id)evaluate;
- (id)evaluatePartialDelta;
- (id)getEvalTask:(id *)a3;
- (id)getTrainTask:(id *)a3;
- (id)loadData;
- (id)restoreFromLatestWeights:(id)a3;
- (id)setup;
- (id)train;
- (void)setAttachments:(id)a3;
- (void)setEvalData:(id)a3;
- (void)setTrainData:(id)a3;
@end

@implementation SMTGlobalNNLM

- (id).cxx_construct
{
  *((void *)self + 16) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_delta, 0);
  objc_storeStrong((id *)&self->_mmappedPartialWeights, 0);
  objc_storeStrong((id *)&self->_partialUpdateOffsets, 0);
  objc_storeStrong((id *)&self->_tensorInfo, 0);
  objc_storeStrong((id *)&self->_tensors, 0);
  objc_storeStrong((id *)&self->_mmappedWeights, 0);
  value = self->_weights.__ptr_.__value_;
  self->_weights.__ptr_.__value_ = 0;
  if (value) {
    operator delete[]();
  }
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

- (SMTKaldiVocab)vocab
{
  return self->_vocab;
}

- (BOOL)deltaIsPartial
{
  return self->_deltaIsPartial;
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (void)setEvalData:(id)a3
{
}

- (NSMutableArray)evalData
{
  return self->_evalData;
}

- (void)setTrainData:(id)a3
{
}

- (NSMutableArray)trainData
{
  return self->_trainData;
}

- (NSData)delta
{
  return self->_delta;
}

- (void)setAttachments:(id)a3
{
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (id)computeDelta:(BOOL)a3
{
  BOOL v3 = a3;
  id v139 = 0;
  v6 = [(SMTGlobalNNLM *)self getEvalTask:&v139];
  context = v5;
  BOOL v122 = v3;
  id v7 = v139;
  v123 = v7;
  v125 = v6;
  if (!v6 || v7)
  {
    double v10 = COERCE_DOUBLE(v7);
    int v36 = 1;
  }
  else
  {
    v8 = self->_tensorInfo;
    id v9 = v6;
    double v10 = COERCE_DOUBLE(objc_opt_new());
    long long v142 = 0u;
    long long v143 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    v11 = v8;
    id v12 = [(NSDictionary *)v11 countByEnumeratingWithState:&v140 objects:buf count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v141;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v141 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v140 + 1) + 8 * i);
          v16 = [v9 getTensorNamed:v15 directBind:1];
          [*(id *)&v10 setObject:v16 forKeyedSubscript:v15];
        }
        id v12 = [(NSDictionary *)v11 countByEnumeratingWithState:&v140 objects:buf count:16];
      }
      while (v12);
    }

    long long v135 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    id v17 = *(id *)&v10;
    v126 = v17;
    id v18 = [v17 countByEnumeratingWithState:&v135 objects:v162 count:16];
    if (v18)
    {
      uint64_t v118 = *(void *)v136;
      do
      {
        uint64_t v19 = 0;
        id v116 = v18;
        do
        {
          if (*(void *)v136 != v118) {
            objc_enumerationMutation(v17);
          }
          uint64_t v20 = *(void *)(*((void *)&v135 + 1) + 8 * v19);
          v21 = [v17 objectForKeyedSubscript:v20];
          uint64_t v120 = v19;
          v22 = (float *)[v21 dataPointer];

          double v10 = 0.0;
          while (1)
          {
            v23 = [(NSDictionary *)self->_tensorInfo objectForKeyedSubscript:v20];
            v24 = [v23 objectForKeyedSubscript:@"size"];
            BOOL v25 = *(void *)&v10 < (int)[v24 intValue];

            if (!v25) {
              break;
            }
            v26 = [(NSDictionary *)self->_tensorInfo objectForKeyedSubscript:v20];
            v27 = [v26 objectForKeyedSubscript:@"offset"];
            unsigned int v28 = [v27 intValue];

            weightsRawPtr = self->_weightsRawPtr;
            float v30 = weightsRawPtr[LODWORD(v10) + v28] - v22[*(void *)&v10];
            weightsRawPtr[LODWORD(v10) + v28] = v30;
            ++*(void *)&v10;
            if ((LODWORD(v30) & 0x7FFFFFFFu) >= 0x7F800000)
            {
              v37 = +[NSString stringWithFormat:@"delta[%d] is not finite", v28 + LODWORD(v10) - 1];
              NSErrorUserInfoKey v160 = NSLocalizedDescriptionKey;
              v161 = v37;
              v38 = +[NSDictionary dictionaryWithObjects:&v161 forKeys:&v160 count:1];
              double v10 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:156 userInfo:v38];

              goto LABEL_26;
            }
          }
          uint64_t v19 = v120 + 1;
          id v17 = v126;
        }
        while ((id)(v120 + 1) != v116);
        id v18 = [v126 countByEnumeratingWithState:&v135 objects:v162 count:16];
      }
      while (v18);
    }

    unint64_t numParam = self->_numParam;
    if (numParam)
    {
      v32 = self->_weightsRawPtr;
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
    float v51 = sqrt(v34);
    v52 = qword_1000443B8;
    if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v164 = v51;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "l2-norm of the delta is %f", buf, 0xCu);
    }
    *(float *)&double v53 = v51;
    v54 = +[NSNumber numberWithFloat:v53];
    [(NSMutableDictionary *)self->_results setObject:v54 forKeyedSubscript:@"DeltaL2Norm"];

    if (!self->_deltaIsPartial) {
      goto LABEL_103;
    }
    self->_unint64_t numParam = 0;
    long long v131 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    v55 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingGlobals"];
    id v56 = [v55 countByEnumeratingWithState:&v131 objects:v159 count:16];
    if (v56)
    {
      uint64_t v57 = *(void *)v132;
      v121 = v55;
      uint64_t v115 = *(void *)v132;
      do
      {
        uint64_t v58 = 0;
        id v117 = v56;
        while (2)
        {
          if (*(void *)v132 != v57) {
            objc_enumerationMutation(v55);
          }
          uint64_t v119 = v58;
          double v10 = *(double *)(*((void *)&v131 + 1) + 8 * v58);
          v59 = [(NSDictionary *)self->_tensorInfo objectForKeyedSubscript:*(void *)&v10];
          uint64_t v60 = [v59 objectForKeyedSubscript:@"offset"];
          unsigned int v61 = [(id)v60 intValue];

          v62 = [(NSMutableDictionary *)self->_partialUpdateOffsets objectForKeyedSubscript:*(void *)&v10];
          LOBYTE(v60) = v62 == 0;

          if (v60)
          {
            v157[0] = &off_10003F220;
            v156[0] = @"start";
            v156[1] = @"end";
            v63 = [(NSDictionary *)self->_tensorInfo objectForKeyedSubscript:*(void *)&v10];
            v64 = [v63 objectForKeyedSubscript:@"size"];
            v156[2] = @"scale";
            v157[1] = v64;
            v157[2] = &off_10003F298;
            v65 = +[NSDictionary dictionaryWithObjects:v157 forKeys:v156 count:3];
            v158 = v65;
            v66 = +[NSArray arrayWithObjects:&v158 count:1];
            [(NSMutableDictionary *)self->_partialUpdateOffsets setObject:v66 forKeyedSubscript:*(void *)&v10];

            v67 = qword_1000443B8;
            if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              double v164 = v10;
              _os_log_debug_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "%@ applies full update", buf, 0xCu);
            }
          }
          for (unint64_t j = 0; ; ++j)
          {
            v69 = [(NSMutableDictionary *)self->_partialUpdateOffsets objectForKeyedSubscript:*(void *)&v10];
            BOOL v70 = j < (unint64_t)[v69 count];

            if (!v70) {
              break;
            }
            v71 = [(NSMutableDictionary *)self->_partialUpdateOffsets objectForKeyedSubscript:*(void *)&v10];
            v72 = [v71 objectAtIndexedSubscript:j];
            v73 = [v72 objectForKeyedSubscript:@"start"];
            unsigned int v74 = [v73 unsignedIntValue];

            v75 = [(NSMutableDictionary *)self->_partialUpdateOffsets objectForKeyedSubscript:*(void *)&v10];
            v76 = [v75 objectAtIndexedSubscript:j];
            v77 = [v76 objectForKeyedSubscript:@"end"];
            LODWORD(v72) = [v77 unsignedIntValue];

            v78 = [(NSMutableDictionary *)self->_partialUpdateOffsets objectForKeyedSubscript:*(void *)&v10];
            v79 = [v78 objectAtIndexedSubscript:j];
            v80 = [v79 objectForKeyedSubscript:@"scale"];
            [v80 floatValue];
            float v82 = v81;

            unint64_t v83 = v74 + v61;
            uint64_t v84 = v72 + v61;
            if (v83 < v84)
            {
              unint64_t v85 = self->_numParam;
              while (v83 >= v85)
              {
                v86 = self->_weightsRawPtr;
                float v87 = v82 * v86[v83];
                self->_unint64_t numParam = v85 + 1;
                v86[v85] = v87;
                ++v83;
                ++v85;
                if (v84 == v83) {
                  goto LABEL_62;
                }
              }
              v95 = +[NSString stringWithFormat:@"shifting delta[%lu] to delta[%lu] may overwrite chosen gradient", v83, v85];
              NSErrorUserInfoKey v154 = NSLocalizedDescriptionKey;
              v155 = v95;
              v96 = +[NSDictionary dictionaryWithObjects:&v155 forKeys:&v154 count:1];
              double v10 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:156 userInfo:v96];

              goto LABEL_26;
            }
LABEL_62:
            ;
          }
          uint64_t v58 = v119 + 1;
          v55 = v121;
          uint64_t v57 = v115;
          if ((id)(v119 + 1) != v117) {
            continue;
          }
          break;
        }
        id v56 = [v121 countByEnumeratingWithState:&v131 objects:v159 count:16];
      }
      while (v56);
    }

    v88 = self->_weightsRawPtr;
    unint64_t v89 = self->_numParam;
    if (v89)
    {
      uint64_t v90 = 4 * v89;
      double v91 = 0.0;
      v92 = self->_weightsRawPtr;
      v93 = &OBJC_METACLASS___ServiceDelegate;
      do
      {
        float v94 = *v92++;
        double v91 = v91 + (float)(v94 * v94);
        v90 -= 4;
      }
      while (v90);
    }
    else
    {
      double v91 = 0.0;
      v93 = &OBJC_METACLASS___ServiceDelegate;
    }
    float v97 = sqrt(v91);
    info = v93[23].info;
    if (os_log_type_enabled(info, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v164 = v97;
      _os_log_impl((void *)&_mh_execute_header, info, OS_LOG_TYPE_INFO, "l2-norm of the partial delta before normalization is %f", buf, 0xCu);
      unint64_t v89 = self->_numParam;
      v88 = self->_weightsRawPtr;
    }
    if (v89)
    {
      v99 = v88;
      unint64_t v100 = v89;
      do
      {
        float *v99 = (float)(v51 / v97) * *v99;
        ++v99;
        --v100;
      }
      while (v100);
      uint64_t v101 = 4 * v89;
      double v102 = 0.0;
      do
      {
        float v103 = *v88++;
        double v102 = v102 + (float)(v103 * v103);
        v101 -= 4;
      }
      while (v101);
    }
    else
    {
      double v102 = 0.0;
    }
    v104 = v93[23].info;
    if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
    {
      float v105 = sqrt(v102);
      *(_DWORD *)buf = 134217984;
      double v164 = v105;
      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_INFO, "l2-norm of the partial delta after normalization is %f", buf, 0xCu);
      v104 = v93[23].info;
    }
    if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
    {
      double v106 = *(double *)&self->_numParam;
      *(_DWORD *)buf = 134217984;
      double v164 = v106;
      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_INFO, "Gradients of %lu parameters are chosen and sent to server", buf, 0xCu);
    }
    v107 = [[SMTSimpleMmapBuffer alloc] initWithData:self->_weightsRawPtr ofSize:4 * self->_numParam];
    mmappedPartialWeights = self->_mmappedPartialWeights;
    self->_mmappedPartialWeights = v107;

    if (!self->_mmappedPartialWeights)
    {
      NSErrorUserInfoKey v152 = NSLocalizedDescriptionKey;
      CFStringRef v153 = @"Unable to buffer partial delta";
      v113 = +[NSDictionary dictionaryWithObjects:&v153 forKeys:&v152 count:1];
      double v10 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:1 userInfo:v113];

LABEL_26:
      int v36 = 1;
    }
    else
    {
LABEL_103:
      if (sub_10000AE0C(self->_recipe, @"deltaIsWeighted", (id)1))
      {
        unint64_t v109 = self->_numParam;
        if (v109)
        {
          float numWordsTrain = (float)self->_numWordsTrain;
          v111 = self->_weightsRawPtr;
          do
          {
            float *v111 = *v111 * numWordsTrain;
            ++v111;
            --v109;
          }
          while (v109);
        }
        v112 = qword_1000443B8;
        if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_INFO, "delta is weighted", buf, 2u);
        }
      }
      int v36 = 0;
    }
  }
  if (!v36)
  {
    if (!v122)
    {
      v49 = +[NSData dataWithBytes:self->_weightsRawPtr length:4 * self->_numParam];
      double v10 = 0.0;
      delta = self->_delta;
      self->_delta = v49;
LABEL_97:

      goto LABEL_98;
    }
    v151[0] = @"maxNorm";
    v151[1] = @"normBinCount";
    +[NSArray arrayWithObjects:v151 count:2];
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    delta = (NSData *)(id)objc_claimAutoreleasedReturnValue();
    id v40 = [(NSData *)delta countByEnumeratingWithState:&v127 objects:v150 count:16];
    if (v40)
    {
      uint64_t v41 = *(void *)v128;
      while (2)
      {
        for (k = 0; k != v40; k = (char *)k + 1)
        {
          if (*(void *)v128 != v41) {
            objc_enumerationMutation(delta);
          }
          uint64_t v43 = *(void *)(*((void *)&v127 + 1) + 8 * (void)k);
          v44 = [(NSDictionary *)self->_recipe valueForKey:v43];
          BOOL v45 = v44 == 0;

          if (v45)
          {
            id v47 = +[NSString stringWithFormat:@"Unable to read recipe[%@]", v43];
            NSErrorUserInfoKey v148 = NSLocalizedDescriptionKey;
            id v149 = v47;
            v50 = +[NSDictionary dictionaryWithObjects:&v149 forKeys:&v148 count:1];
            double v10 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:153 userInfo:v50];
            v46 = delta;
            goto LABEL_95;
          }
        }
        id v40 = [(NSData *)delta countByEnumeratingWithState:&v127 objects:v150 count:16];
        if (v40) {
          continue;
        }
        break;
      }
    }

    v46 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"iCloudAggServiceKey"];
    if (v46
      || ([(NSDictionary *)self->_recipe objectForKeyedSubscript:@"HaruspexKey"],
          (v46 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v47 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v46 options:0];
      NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
      if (!v47)
      {
        NSErrorUserInfoKey v146 = NSLocalizedDescriptionKey;
        CFStringRef v147 = @"Corrupted HaruspexKey";
        id v47 = +[NSDictionary dictionaryWithObjects:&v147 forKeys:&v146 count:1];
        double v10 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:153 userInfo:v47];
LABEL_96:

        goto LABEL_97;
      }
    }
    else
    {
      id v47 = 0;
      NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
    }
    NSErrorUserInfoKey v144 = v48;
    CFStringRef v145 = @"Privatization of deltas failed";
    v50 = +[NSDictionary dictionaryWithObjects:&v145 forKeys:&v144 count:1];
    double v10 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:153 userInfo:v50];
LABEL_95:

    goto LABEL_96;
  }
LABEL_98:

  return *(id *)&v10;
}

- (id)evaluatePartialDelta
{
  v48[0] = 0;
  BOOL v3 = [(SMTGlobalNNLM *)self getEvalTask:v48];
  id v4 = v48[0];
  v42 = v3;
  if (v3 && !v4)
  {
    sub_10000B754(self->_tensorInfo, v3, (uint64_t)self->_weightsRawPtr);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    tensors = self->_tensors;
    self->_tensors = v5;

    uint64_t v43 = [(SMTSimpleMmapBuffer *)self->_mmappedPartialWeights dataPointer];
    unint64_t v7 = [(SMTSimpleMmapBuffer *)self->_mmappedPartialWeights size];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    obunint64_t j = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingGlobals"];
    id v8 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
    unint64_t v9 = 0;
    if (v8)
    {
      unint64_t v10 = v7 >> 2;
      uint64_t v11 = *(void *)v45;
      uint64_t v38 = *(void *)v45;
      do
      {
        uint64_t v12 = 0;
        id v39 = v8;
        while (2)
        {
          if (*(void *)v45 != v11) {
            objc_enumerationMutation(obj);
          }
          unint64_t v13 = 0;
          uint64_t v40 = v12;
          uint64_t v14 = *(void *)(*((void *)&v44 + 1) + 8 * v12);
          while (1)
          {
            uint64_t v15 = [(NSMutableDictionary *)self->_partialUpdateOffsets objectForKeyedSubscript:v14];
            BOOL v16 = v13 < (unint64_t)[v15 count];

            if (!v16) {
              break;
            }
            id v17 = [(NSMutableDictionary *)self->_partialUpdateOffsets objectForKeyedSubscript:v14];
            id v18 = [v17 objectAtIndexedSubscript:v13];
            uint64_t v19 = [v18 objectForKeyedSubscript:@"start"];
            unint64_t v20 = (unint64_t)[v19 unsignedIntegerValue];

            v21 = [(NSMutableDictionary *)self->_partialUpdateOffsets objectForKeyedSubscript:v14];
            v22 = [v21 objectAtIndexedSubscript:v13];
            v23 = [v22 objectForKeyedSubscript:@"end"];
            id v24 = [v23 unsignedIntegerValue];

            BOOL v25 = [(NSDictionary *)self->_tensorInfo objectForKeyedSubscript:v14];
            v26 = [v25 objectForKeyedSubscript:@"size"];
            unsigned int v27 = [v26 unsignedIntValue];

            unsigned int v28 = [(NSDictionary *)self->_tensors objectForKeyedSubscript:v14];
            v29 = (float *)[v28 dataPointer];

            if (v20 < (unint64_t)v24)
            {
              while (1)
              {
                if (v20 > v27)
                {
                  double v34 = +[NSString stringWithFormat:@"setting %@[%lu] while size(%@) == %lu", v14, v20, v14, v27];
                  NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
                  v54 = v34;
                  float v35 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
                  uint64_t v36 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:154 userInfo:v35];
                  goto LABEL_25;
                }
                if (v9 > v10) {
                  break;
                }
                unint64_t v30 = v9 + 1;
                v29[v20] = v43[v9] + v29[v20];
                ++v20;
                ++v9;
                if (v24 == (id)v20) {
                  goto LABEL_16;
                }
              }
              double v34 = +[NSString stringWithFormat:@"accessing partiaDelta[%lu] while size(partiaDelta) == %lu", v9, v10];
              NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
              v52 = v34;
              float v35 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
              uint64_t v36 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:154 userInfo:v35];
LABEL_25:
              uint64_t v33 = (void *)v36;

              id v32 = 0;
              goto LABEL_26;
            }
            unint64_t v30 = v9;
LABEL_16:
            ++v13;
            unint64_t v9 = v30;
          }
          uint64_t v12 = v40 + 1;
          uint64_t v11 = v38;
          if ((id)(v40 + 1) != v39) {
            continue;
          }
          break;
        }
        id v8 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
      }
      while (v8);
    }

    v31 = qword_1000443B8;
    if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v50 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "parsed %lu chosen gradients", buf, 0xCu);
    }
    id v4 = [(SMTGlobalNNLM *)self evaluate];
  }
  id v32 = v4;
  uint64_t v33 = v32;
LABEL_26:

  return v33;
}

- (id)train
{
  uint64_t v58 = +[NSMutableArray array];
  v95[0] = 0;
  id v4 = [(SMTGlobalNNLM *)self getTrainTask:v95];
  id v5 = v95[0];
  context = v3;
  if (!v4 || v5)
  {
    unint64_t v20 = v5;
    int v21 = 1;
    v22 = v20;
    goto LABEL_36;
  }
  uint64_t v57 = v4;
  v55 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingOutputs"];
  v6 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"learningRateName"];
  BOOL v7 = v6 == 0;

  if (v7)
  {
    id v18 = 0;
    goto LABEL_16;
  }
  id v8 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"learningRateName"];
  unint64_t v9 = [v4 getTensorNamed:v8];

  unint64_t v10 = (float *)[v9 dataPointer];
  uint64_t v11 = qword_1000443B8;
  if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_INFO))
  {
    double v12 = *v10;
    LODWORD(buf) = 134217984;
    *(double *)((char *)&buf + 4) = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "The learning rate embedded in the training graph is %f", (uint8_t *)&buf, 0xCu);
  }
  unint64_t v13 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"learningRateValue"];
  BOOL v14 = v13 == 0;

  if (!v14)
  {
    uint64_t v15 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"learningRateValue"];
    [v15 floatValue];
    *(_DWORD *)unint64_t v10 = v16;

    id v17 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"learningRateName"];
    id v94 = 0;
    [v57 setTensorNamed:v17 withValue:v9 error:&v94];
    id v18 = v94;

    uint64_t v19 = qword_1000443B8;
    if (v18)
    {
      if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unable to override learning rate", (uint8_t *)&buf, 2u);
      }
      goto LABEL_15;
    }
    if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_INFO))
    {
      double v23 = *v10;
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = v23;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Override learning rate with value %f", (uint8_t *)&buf, 0xCu);
    }
  }
  id v18 = 0;
LABEL_15:

LABEL_16:
  v54 = v18;
  id v24 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"batchPerUpdate"];
  int v25 = [v24 unsignedIntValue];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v104 = 0x3032000000;
  float v105 = sub_10000C730;
  double v106 = sub_10000C740;
  id v107 = (id)objc_opt_new();
  uint64_t v88 = 0;
  unint64_t v89 = &v88;
  uint64_t v90 = 0x3032000000;
  double v91 = sub_10000C730;
  v92 = sub_10000C740;
  uint64_t v26 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"sparseGlobals"];
  unsigned int v27 = (void *)v26;
  unsigned int v28 = &__NSArray0__struct;
  if (v26) {
    unsigned int v28 = (void *)v26;
  }
  id v93 = v28;

  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x2020000000;
  int v87 = 0;
  uint64_t v82 = 0;
  unint64_t v83 = (float *)&v82;
  uint64_t v84 = 0x2020000000;
  float v85 = 0.0;
  v29 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"l2ClipNorm"];
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
  uint64_t v33 = qword_1000443B8;
  BOOL v34 = os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_INFO);
  if (v32 <= 0.0)
  {
    if (!v34) {
      goto LABEL_27;
    }
    LOWORD(v100) = 0;
    float v35 = "Gradients are not clipped";
    uint64_t v36 = v33;
    uint32_t v37 = 2;
  }
  else
  {
    if (!v34) {
      goto LABEL_27;
    }
    LODWORD(v100) = 134217984;
    *(double *)((char *)&v100 + 4) = v32;
    float v35 = "Gradients are clipped by global L2Norm of %f";
    uint64_t v36 = v33;
    uint32_t v37 = 12;
  }
  _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, v35, (uint8_t *)&v100, v37);
LABEL_27:
  *(void *)&long long v100 = 0;
  *((void *)&v100 + 1) = &v100;
  uint64_t v101 = 0x2020000000;
  BOOL v102 = v25 > 0;
  if (v25 >= 1)
  {
    uint64_t v38 = qword_1000443B8;
    if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_INFO))
    {
      uint64_t v39 = v89[5];
      *(_DWORD *)v98 = 138412290;
      uint64_t v99 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Gradient of %@ are accumulated in a sparse fashion", v98, 0xCu);
    }
  }
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_10000C748;
  v70[3] = &unk_10003CA38;
  id v40 = v55;
  id v71 = v40;
  id v72 = v58;
  v73 = self;
  v22 = v86;
  v75 = v86;
  p_long long buf = &buf;
  v77 = v80;
  v78 = &v82;
  v79 = &v100;
  id v41 = v57;
  id v74 = v41;
  v42 = objc_retainBlock(v70);
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_10000CDAC;
  v60[3] = &unk_10003CA60;
  id v43 = v40;
  id v61 = v43;
  v62 = self;
  v63 = v86;
  v64 = &buf;
  int v69 = v25;
  v65 = &v88;
  v66 = v80;
  v67 = &v82;
  v68 = &v100;
  long long v44 = objc_retainBlock(v60);
  long long v45 = objc_opt_new();
  long long v46 = objc_retainBlock(v42);
  [v45 setObject:v46 forKeyedSubscript:ETCallbackTypeEpoch];

  if (*(unsigned char *)(*((void *)&v100 + 1) + 24))
  {
    long long v47 = objc_retainBlock(v44);
    [v45 setObject:v47 forKeyedSubscript:ETCallbackTypeBatch];
  }
  [(SMTTextProcessorTrain *)self->_textProcessorTrain shuffleSamples];
  [(SMTDataSourceTrain *)self->_fofeTrainSource setVectorsWithProcessor:self->_textProcessorTrain];
  fofeTrainSource = self->_fofeTrainSource;
  v49 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"numberOfEpochs"];
  id v59 = v54;
  unsigned __int8 v50 = objc_msgSend(v41, "doTrainingOnData:forNumberOfEpochs:withCallback:error:", fofeTrainSource, (int)objc_msgSend(v49, "intValue"), v45, &v59);
  unint64_t v20 = v59;

  if (v50)
  {
    int v21 = 0;
  }
  else
  {
    v96[0] = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v51 = +[NSString stringWithFormat:@"Training failed with error."];
    v96[1] = NSUnderlyingErrorKey;
    v97[0] = v51;
    v97[1] = v20;
    v52 = +[NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:2];
    v22 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:152 userInfo:v52];

    int v21 = 1;
  }

  _Block_object_dispose(&v100, 8);
  _Block_object_dispose(v80, 8);
  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(v86, 8);
  _Block_object_dispose(&v88, 8);

  _Block_object_dispose(&buf, 8);
  id v4 = v57;
LABEL_36:

  if (!v21)
  {
    [(NSMutableDictionary *)self->_results setObject:v58 forKeyedSubscript:@"TrainingCostOfEachBatch"];
    v22 = 0;
    self->_weightsAreUpdated = 1;
  }

  return v22;
}

- (id)evaluate
{
  v85[0] = 0;
  BOOL v3 = [(SMTGlobalNNLM *)self getEvalTask:v85];
  id v4 = v85[0];
  if (!v3 || v4) {
    goto LABEL_7;
  }
  id v5 = qword_1000443B8;
  if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Evaluation model loaded", buf, 2u);
  }
  if (self->_weightsAreUpdated)
  {
    id v4 = [(SMTGlobalNNLM *)self restoreFromLatestWeights:v3];
    if (v4)
    {
LABEL_7:
      id v69 = v4;
      id v61 = v69;
      goto LABEL_59;
    }
  }
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  obunint64_t j = self->_evalData;
  v66 = v3;
  BOOL v70 = self;
  id v55 = [(NSMutableArray *)obj countByEnumeratingWithState:&v81 objects:v93 count:16];
  if (v55)
  {
    int v59 = 0;
    id v6 = 0;
    uint64_t v56 = *(void *)v82;
    float v7 = 0.0;
    do
    {
      for (i = 0; i != v55; i = (char *)i + 1)
      {
        id v69 = v6;
        if (*(void *)v82 != v56) {
          objc_enumerationMutation(obj);
        }
        id v62 = [*(id *)(*((void *)&v81 + 1) + 8 * i) mutableCopy];
        [(SMTTextProcessorInference *)self->_textProcessorInference resetWithBOS:[(SMTKaldiVocab *)self->_vocab beginOfSentenceIndex]];
        id v8 = [(SMTKaldiVocab *)self->_vocab endOfSentenceToken];
        [v62 addObject:v8];

        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v63 = v62;
        id v9 = [v63 countByEnumeratingWithState:&v77 objects:v92 count:16];
        if (v9)
        {
          uint64_t v65 = *(void *)v78;
          while (2)
          {
            unint64_t v10 = 0;
            id v64 = v9;
            v59 += (int)v9;
            do
            {
              if (*(void *)v78 != v65) {
                objc_enumerationMutation(v63);
              }
              id v68 = *(id *)(*((void *)&v77 + 1) + 8 * (void)v10);
              -[SMTTextProcessorInference addText:](v70->_textProcessorInference, "addText:");
              [(SMTDataSourceInference *)v70->_fofeInferenceSource setVectorsWithProcessor:v70->_textProcessorInference];
              fofeInferenceSource = v70->_fofeInferenceSource;
              id v76 = v69;
              unint64_t v13 = [v66 doInferenceOnData:fofeInferenceSource error:&v76];
              id v14 = v76;

              if (v13) {
                BOOL v15 = v14 == 0;
              }
              else {
                BOOL v15 = 0;
              }
              int v16 = v15;
              int v67 = v16;
              if (v15)
              {
                id v75 = 0;
                id v17 = [v13 dataPointAtIndex:0 error:&v75];
                id v69 = v75;
                long long v71 = 0u;
                long long v72 = 0u;
                long long v73 = 0u;
                long long v74 = 0u;
                id v25 = v17;
                id v18 = [v25 countByEnumeratingWithState:&v71 objects:v89 count:16];
                if (v18)
                {
                  uint64_t v19 = *(void *)v72;
                  do
                  {
                    for (unint64_t j = 0; j != v18; unint64_t j = (char *)j + 1)
                    {
                      if (*(void *)v72 != v19) {
                        objc_enumerationMutation(v25);
                      }
                      id v21 = *(id *)(*((void *)&v71 + 1) + 8 * (void)j);
                      v22 = [v25 objectForKeyedSubscript:v21];
                      double v23 = (float *)[v22 dataPointer];

                      float v24 = *v23;
                      float v7 = v7 + v24;
                    }
                    id v18 = [v25 countByEnumeratingWithState:&v71 objects:v89 count:16];
                  }
                  while (v18);
                }
              }
              else
              {
                v90[0] = NSLocalizedDescriptionKey;
                v90[1] = NSUnderlyingErrorKey;
                v91[0] = @"Call to doInferenceOnData during evaluation failed.";
                v91[1] = v14;
                id v25 = +[NSDictionary dictionaryWithObjects:v91 forKeys:v90 count:2];
                id v61 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:154 userInfo:v25];
                id v69 = v14;
              }

              if (!v67)
              {

                goto LABEL_58;
              }
              unint64_t v10 = (char *)v10 + 1;
            }
            while (v10 != v64);
            id v9 = [v63 countByEnumeratingWithState:&v77 objects:v92 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }

        id v6 = v69;
        self = v70;
      }
      id v55 = [(NSMutableArray *)obj countByEnumeratingWithState:&v81 objects:v93 count:16];
    }
    while (v55);
  }
  else
  {
    int v59 = 0;
    id v6 = 0;
    float v7 = 0.0;
  }
  id v69 = v6;

  uint64_t v26 = [(NSMutableDictionary *)v70->_results objectForKeyedSubscript:@"NumWordsInEvaluation"];
  unsigned int v27 = v26;
  if (!v26) {
    uint64_t v26 = &off_10003F220;
  }
  int v28 = [v26 intValue];

  if (v28 >= 1 && v28 != v59)
  {
    float v30 = qword_1000443B8;
    if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109376;
      *(_DWORD *)int v87 = v28;
      *(_WORD *)&v87[4] = 1024;
      *(_DWORD *)&v87[6] = v59;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Data size mismatch. %d tokens were fetched while %d words were evaluated", buf, 0xEu);
    }
  }
  if (v70->_weightsAreUpdated)
  {
    if (v70->_mmappedPartialWeights)
    {
      *(float *)&double v29 = v7;
      float v31 = +[NSNumber numberWithFloat:v29];
      [(NSMutableDictionary *)v70->_results setObject:v31 forKeyedSubscript:@"TotalEvalCostWithPartialUpdate"];

      float v32 = v7 / (float)v59;
      float v33 = expf(v32);
      *(float *)&double v34 = v32;
      float v35 = +[NSNumber numberWithFloat:v34];
      [(NSMutableDictionary *)v70->_results setObject:v35 forKeyedSubscript:@"EvaluationCostWithPartialUpdate"];

      *(float *)&double v36 = v33;
      uint32_t v37 = +[NSNumber numberWithFloat:v36];
      [(NSMutableDictionary *)v70->_results setObject:v37 forKeyedSubscript:@"EvaluationPPLWithPartialUpdate"];

      uint64_t v38 = qword_1000443B8;
      if (!os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_INFO)) {
        goto LABEL_57;
      }
      *(_DWORD *)long long buf = 134218240;
      *(double *)int v87 = v32;
      *(_WORD *)&v87[8] = 2048;
      double v88 = v33;
      uint64_t v39 = "evaluation cost/PPL with partial update: %.2f/%.2f";
    }
    else
    {
      *(float *)&double v29 = v7;
      long long v47 = +[NSNumber numberWithFloat:v29];
      [(NSMutableDictionary *)v70->_results setObject:v47 forKeyedSubscript:@"TotalEvalCostAfterTraining"];

      float v48 = v7 / (float)v59;
      float v49 = expf(v48);
      *(float *)&double v50 = v48;
      NSErrorUserInfoKey v51 = +[NSNumber numberWithFloat:v50];
      [(NSMutableDictionary *)v70->_results setObject:v51 forKeyedSubscript:@"EvaluationCostAfterTraining"];

      *(float *)&double v52 = v49;
      NSErrorUserInfoKey v53 = +[NSNumber numberWithFloat:v52];
      [(NSMutableDictionary *)v70->_results setObject:v53 forKeyedSubscript:@"EvaluationPPLAfterTraining"];

      uint64_t v38 = qword_1000443B8;
      if (!os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_INFO)) {
        goto LABEL_57;
      }
      *(_DWORD *)long long buf = 134218240;
      *(double *)int v87 = v48;
      *(_WORD *)&v87[8] = 2048;
      double v88 = v49;
      uint64_t v39 = "evaluation cost/PPL after training: %.2f/%.2f";
    }
  }
  else
  {
    *(float *)&double v29 = v7;
    id v40 = +[NSNumber numberWithFloat:v29];
    [(NSMutableDictionary *)v70->_results setObject:v40 forKeyedSubscript:@"TotalEvalCostBeforeTraining"];

    float v41 = v7 / (float)v59;
    float v42 = expf(v41);
    *(float *)&double v43 = v41;
    long long v44 = +[NSNumber numberWithFloat:v43];
    [(NSMutableDictionary *)v70->_results setObject:v44 forKeyedSubscript:@"EvaluationCostBeforeTraining"];

    *(float *)&double v45 = v42;
    long long v46 = +[NSNumber numberWithFloat:v45];
    [(NSMutableDictionary *)v70->_results setObject:v46 forKeyedSubscript:@"EvaluationPPLBeforeTraining"];

    uint64_t v38 = qword_1000443B8;
    if (!os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_INFO)) {
      goto LABEL_57;
    }
    *(_DWORD *)long long buf = 134218240;
    *(double *)int v87 = v41;
    *(_WORD *)&v87[8] = 2048;
    double v88 = v42;
    uint64_t v39 = "evaluation cost/PPL before training: %.2f/%.2f";
  }
  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, v39, buf, 0x16u);
LABEL_57:
  id v61 = 0;
LABEL_58:
  BOOL v3 = v66;
LABEL_59:

  return v61;
}

- (id)restoreFromLatestWeights:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingGlobals", 0];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
      unint64_t v10 = [v4 getTensorNamed:v9 directBind:1];
      uint64_t v11 = [(NSDictionary *)self->_tensors objectForKeyedSubscript:v9];
      double v12 = sub_10000D714(v11, v10);

      if (v12) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
    double v12 = 0;
  }

  return v12;
}

- (id)getTrainTask:(id *)a3
{
  v51[0] = @"trainingGraph";
  v51[1] = @"inferenceInputs";
  v51[2] = @"inferenceOutputs";
  v51[3] = @"trainingInputs";
  v51[4] = @"trainingOutputs";
  v51[5] = @"trainingGlobals";
  v51[6] = @"numberOfEpochs";
  +[NSArray arrayWithObjects:v51 count:7];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v41;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v41 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v40 + 1) + 8 * i);
        unint64_t v10 = [(NSDictionary *)self->_recipe objectForKey:v9];
        BOOL v11 = v10 == 0;

        if (v11)
        {
          uint64_t v27 = +[NSString stringWithFormat:@"Unable to read recipe[%@]", v9];
          unint64_t v13 = (void *)v27;
          if (a3)
          {
            NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
            uint64_t v49 = v27;
            int v28 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
            *a3 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:152 userInfo:v28];
          }
          id v26 = 0;
          double v12 = v5;
          goto LABEL_44;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v40 objects:v50 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  double v12 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingGraph"];
  id v9 = [(id)objc_opt_class() attachmentURL:self->_attachments withName:v12];
  if (v9)
  {
    unint64_t v13 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingOutputs"];
    float v35 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingInputs"];
    id v14 = objc_alloc((Class)ETModelDefinition);
    long long v15 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"inferenceInputs"];
    long long v16 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"inferenceOutputs"];
    long long v17 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"checkpointName"];
    id v39 = 0;
    id v36 = [v14 initWithTrainingNetworkPath:v9 inferenceInputs:v15 inferenceOutputs:v16 trainingInputs:v35 trainingOutputs:v13 trainingControlVariableName:@"is_training" withInitializer:v17 error:&v39];
    id v18 = v39;

    if (v18 || !v36)
    {
      if (!a3)
      {
        id v26 = 0;
LABEL_43:

        goto LABEL_44;
      }
      double v29 = +[NSMutableDictionary dictionaryWithObject:@"Unable to create ETModelDefinition (train)" forKey:NSLocalizedDescriptionKey];
      uint64_t v19 = v29;
      if (v18) {
        [v29 setObject:v18 forKey:NSUnderlyingErrorKey];
      }
      +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:152 userInfo:v19];
      id v26 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v38 = 0;
      id v34 = [objc_alloc((Class)ETTaskDefinition) initWithTrainingModelDefinition:v36 forPlatform:1 error:&v38];
      id v18 = v38;
      uint64_t v19 = v34;
      if (v18 || !v34)
      {
        if (!a3)
        {
          id v26 = 0;
          goto LABEL_42;
        }
        float v30 = +[NSMutableDictionary dictionaryWithObject:@"Unable to create ETTaskDefinition (training)" forKey:NSLocalizedDescriptionKey];
        float v31 = v30;
        if (v18) {
          [v30 setObject:v18 forKey:NSUnderlyingErrorKey];
        }
        *a3 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:152 userInfo:v31];
      }
      else
      {
        unint64_t v20 = qword_1000443B8;
        if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Training model loaded", buf, 2u);
        }
        unint64_t numParam = self->_numParam;
        v22 = [(SMTGlobalNNLM *)self _fetchTensorInfo:v34];
        double v23 = [v22 objectForKeyedSubscript:@"totalSize"];
        LOBYTE(numParam) = numParam == (void)[v23 unsignedLongValue];

        if (numParam)
        {
          uint64_t v19 = v34;
          float v24 = v34;
          if (a3)
          {
            id v25 = [(SMTGlobalNNLM *)self restoreFromLatestWeights:v34];
            *a3 = v25;
            uint64_t v19 = v34;
            if (v25) {
              float v24 = 0;
            }
            else {
              float v24 = v34;
            }
          }
          id v26 = v24;
          id v18 = 0;
          goto LABEL_42;
        }
        if (a3)
        {
          NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
          CFStringRef v45 = @"Unexpected number of paramters changed (training, this[%lu] vs previous[%lu])";
          float v32 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
          *a3 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:152 userInfo:v32];
        }
        id v18 = 0;
      }
      id v26 = 0;
      uint64_t v19 = v34;
    }
LABEL_42:

    goto LABEL_43;
  }
  if (!a3)
  {
    id v9 = 0;
    id v26 = 0;
    goto LABEL_45;
  }
  NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
  CFStringRef v47 = @"training model is not attached";
  unint64_t v13 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
  +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:152 userInfo:v13];
  id v9 = 0;
  id v26 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

LABEL_45:
  return v26;
}

- (id)getEvalTask:(id *)a3
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v34[0] = @"inferenceInputs";
  v34[1] = @"inferenceOutputs";
  v34[2] = @"inferenceGraph";
  id v5 = +[NSArray arrayWithObjects:v34 count:3];
  id v6 = [v5 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (!v6)
  {
LABEL_9:

    id v5 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"inferenceInputs"];
    double v12 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"inferenceOutputs"];
    unint64_t v13 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"inferenceGraph"];
    id v14 = [(id)objc_opt_class() attachmentURL:self->_attachments withName:v13];
    id v15 = objc_alloc((Class)ETModelDefinition);
    long long v16 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"checkpointName"];
    id v27 = 0;
    id v17 = [v15 initWithTrainingNetworkPath:v14 inferenceInputs:v5 inferenceOutputs:v12 trainingInputs:v5 trainingOutputs:v12 trainingControlVariableName:@"is_training" withInitializer:v16 error:&v27];
    id v18 = v27;

    if (v18 || !v17)
    {
      if (!a3)
      {
        unint64_t v20 = 0;
LABEL_27:

LABEL_28:
        goto LABEL_29;
      }
      v22 = +[NSString stringWithFormat:@"Unable to create ETModelDefinition (evaluation)"];
      id v19 = +[NSMutableDictionary dictionaryWithObject:v22 forKey:NSLocalizedDescriptionKey];

      if (v18) {
        [v19 setObject:v18 forKey:NSUnderlyingErrorKey];
      }
      +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:154 userInfo:v19];
      unint64_t v20 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v26 = 0;
      id v19 = [objc_alloc((Class)ETTaskDefinition) initWithTrainingModelDefinition:v17 forPlatform:1 error:&v26];
      id v18 = v26;
      if (v18 || !v19)
      {
        if (a3)
        {
          double v23 = +[NSMutableDictionary dictionaryWithObject:@"Unable to create ETTaskDefinition (evaluation)" forKey:NSLocalizedDescriptionKey];
          float v24 = v23;
          if (v18) {
            [v23 setObject:v18 forKey:NSUnderlyingErrorKey];
          }
          *a3 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:154 userInfo:v24];
        }
        unint64_t v20 = 0;
      }
      else
      {
        id v19 = v19;
        id v18 = 0;
        unint64_t v20 = v19;
      }
    }

    goto LABEL_27;
  }
  uint64_t v7 = *(void *)v29;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v29 != v7) {
      objc_enumerationMutation(v5);
    }
    uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * v8);
    unint64_t v10 = [(NSDictionary *)self->_recipe valueForKey:v9];
    BOOL v11 = v10 == 0;

    if (v11) {
      break;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [v5 countByEnumeratingWithState:&v28 objects:v35 count:16];
      if (v6) {
        goto LABEL_3;
      }
      goto LABEL_9;
    }
  }
  uint64_t v21 = +[NSString stringWithFormat:@"Unable to read recipe[%@]", v9];
  double v12 = (void *)v21;
  if (a3)
  {
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    uint64_t v33 = v21;
    unint64_t v13 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:154 userInfo:v13];
    unint64_t v20 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  unint64_t v20 = 0;
LABEL_29:

  return v20;
}

- (id)setup
{
  BOOL v3 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"kaldiVocab"];

  if (!v3)
  {
    NSErrorUserInfoKey v112 = NSLocalizedDescriptionKey;
    id v10 = +[NSString stringWithFormat:@"No vocab filename specified in recipe."];
    id v113 = v10;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v113 forKeys:&v112 count:1];
    id v13 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:151 userInfo:v7];
    goto LABEL_11;
  }
  id v4 = objc_opt_class();
  attachments = self->_attachments;
  id v6 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"kaldiVocab"];
  uint64_t v7 = [v4 attachmentURL:attachments withName:v6];

  if (!v7)
  {
    NSErrorUserInfoKey v110 = NSLocalizedDescriptionKey;
    id v12 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"kaldiVocab"];
    id v14 = +[NSString stringWithFormat:@"No vocab file attached: %@", v12];
    v111 = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:&v111 forKeys:&v110 count:1];
    id v13 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:151 userInfo:v15];

    uint64_t v7 = 0;
    goto LABEL_9;
  }
  uint64_t v8 = qword_1000443B8;
  if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    unint64_t v109 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Attached vocabulary URL: %@", buf, 0xCu);
  }
  v93[0] = 0;
  uint64_t v9 = [[SMTKaldiVocab alloc] initWithContentsOfUrl:v7 outError:v93];
  id v10 = v93[0];
  vocab = self->_vocab;
  self->_vocab = v9;

  if (!v10)
  {
    id v17 = qword_1000443B8;
    if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Vocabulary loaded", buf, 2u);
    }
    partialUpdateOffsets = self->_partialUpdateOffsets;
    self->_partialUpdateOffsets = 0;

    id v19 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"partialUpdateOffsetFile"];
    BOOL v20 = v19 == 0;

    if (v20) {
      goto LABEL_24;
    }
    uint64_t v21 = objc_opt_class();
    v22 = self->_attachments;
    double v23 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"partialUpdateOffsetFile"];
    float v24 = [v21 attachmentURL:v22 withName:v23];

    if (v24)
    {
      id v92 = 0;
      id v25 = +[NSData dataWithContentsOfURL:v24 options:1 error:&v92];
      id v26 = v92;
      if (v26)
      {
        id v10 = v26;
        NSErrorUserInfoKey v102 = NSLocalizedDescriptionKey;
        CFStringRef v103 = @"Unable to load partial update offsets";
        id v27 = +[NSDictionary dictionaryWithObjects:&v103 forKeys:&v102 count:1];
        id v13 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:151 userInfo:v27];

LABEL_43:
        id v12 = v24;
        goto LABEL_10;
      }
      id v91 = 0;
      long long v28 = +[NSJSONSerialization JSONObjectWithData:v25 options:1 error:&v91];
      id v10 = v91;
      if (v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        NSErrorUserInfoKey v100 = NSLocalizedDescriptionKey;
        CFStringRef v101 = @"Unable to load _recipe[kRecipePartialUpdateOffsetFile] as json";
        long long v74 = +[NSDictionary dictionaryWithObjects:&v101 forKeys:&v100 count:1];
        id v13 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:153 userInfo:v74];

        goto LABEL_43;
      }
      long long v29 = self->_partialUpdateOffsets;
      self->_partialUpdateOffsets = v28;

      self->_deltaIsPartial = 1;
LABEL_24:
      v99[0] = @"inferenceContextSize";
      v99[1] = @"trainingContextKey";
      v99[2] = @"trainingTargetKey";
      v99[3] = @"sequenceLength";
      v99[4] = @"numNoise";
      v99[5] = @"batchSize";
      v99[6] = @"trainingMaskKey";
      v99[7] = @"trainingNoiseKey";
      +[NSArray arrayWithObjects:v99 count:8];
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      id v30 = [v12 countByEnumeratingWithState:&v87 objects:v98 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v88;
        while (2)
        {
          for (i = 0; i != v30; i = (char *)i + 1)
          {
            if (*(void *)v88 != v31) {
              objc_enumerationMutation(v12);
            }
            uint64_t v33 = *(void *)(*((void *)&v87 + 1) + 8 * i);
            id v34 = [(NSDictionary *)self->_recipe valueForKey:v33];
            BOOL v35 = v34 == 0;

            if (v35)
            {
              long long v72 = +[NSString stringWithFormat:@"Unable to read recipe[%@]", v33];
              NSErrorUserInfoKey v96 = NSLocalizedDescriptionKey;
              float v97 = v72;
              long long v73 = +[NSDictionary dictionaryWithObjects:&v97 forKeys:&v96 count:1];
              id v13 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:151 userInfo:v73];

              goto LABEL_9;
            }
          }
          id v30 = [v12 countByEnumeratingWithState:&v87 objects:v98 count:16];
          if (v30) {
            continue;
          }
          break;
        }
      }

      id v36 = [SMTTextProcessorInference alloc];
      uint32_t v37 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"inferenceContextSize"];
      id v38 = -[SMTTextProcessorInference initWithLength:vocab:BOS:](v36, "initWithLength:vocab:BOS:", [v37 integerValue], self->_vocab, -[SMTKaldiVocab beginOfSentenceIndex](self->_vocab, "beginOfSentenceIndex"));
      textProcessorInference = self->_textProcessorInference;
      self->_textProcessorInference = v38;

      long long v40 = [SMTDataSourceInference alloc];
      long long v41 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"inferenceContextSize"];
      id v42 = [v41 integerValue];
      long long v43 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingContextKey"];
      NSErrorUserInfoKey v44 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingTargetKey"];
      CFStringRef v45 = [(SMTDataSourceInference *)v40 initWithLength:v42 contextKey:v43 targetKey:v44];
      fofeInferenceSource = self->_fofeInferenceSource;
      self->_fofeInferenceSource = v45;

      CFStringRef v47 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"sequenceLength"];
      LODWORD(v41) = [v47 intValue];

      NSErrorUserInfoKey v48 = [[SMTTextProcessorTrain alloc] initWithVocab:self->_vocab];
      textProcessorTrain = self->_textProcessorTrain;
      self->_textProcessorTrain = v48;

      uint64_t v50 = (int)v41;
      trainData = self->_trainData;
      v86[0] = _NSConcreteStackBlock;
      v86[1] = 3221225472;
      v86[2] = sub_1000106C4;
      void v86[3] = &unk_10003CA10;
      v86[4] = self;
      v86[5] = (int)v41;
      [(NSMutableArray *)trainData enumerateObjectsUsingBlock:v86];
      double v52 = [SMTDataSourceTrain alloc];
      unint64_t v53 = [(SMTTextProcessorTrain *)self->_textProcessorTrain numberSamples];
      [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"numNoise"];
      v82 = unint64_t v81 = v53;
      LODWORD(v53) = [v82 intValue];
      long long v80 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"batchSize"];
      signed int v54 = [v80 intValue];
      unint64_t v55 = [(SMTKaldiVocab *)self->_vocab vocabSize];
      long long v84 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingContextKey"];
      long long v83 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingTargetKey"];
      uint64_t v56 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingMaskKey"];
      uint64_t v57 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingNoiseKey"];
      uint64_t v58 = [(SMTDataSourceTrain *)v52 initWithNumDataPoints:v81 sequenceLength:v50 noiseSize:(int)v53 batchSize:v54 vocabSize:v55 contextKey:v84 targetKey:v83 maskKey:v56 noiseKey:v57];
      fofeTrainSource = self->_fofeTrainSource;
      self->_fofeTrainSource = v58;

      uint64_t v60 = qword_1000443B8;
      if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "Data feeder loaded", buf, 2u);
      }
      id v85 = 0;
      id v61 = [(SMTGlobalNNLM *)self getEvalTask:&v85];
      id v62 = v85;
      id v10 = v62;
      if (!v61 || v62)
      {
        id v13 = v62;
      }
      else
      {
        id v63 = [(SMTGlobalNNLM *)self _fetchTensorInfo:v61];
        id v64 = [v63 objectForKeyedSubscript:@"tensorInfo"];
        tensorInfo = self->_tensorInfo;
        self->_tensorInfo = v64;

        v66 = [v63 objectForKeyedSubscript:@"totalSize"];
        self->_unint64_t numParam = (int)[v66 intValue];

        if (!sub_10000AE0C(self->_recipe, @"enableMemoryMap", 0)) {
          operator new[]();
        }
        int v67 = [[SMTSimpleMmapBuffer alloc] initWithData:0 ofSize:4 * self->_numParam];
        mmappedWeights = self->_mmappedWeights;
        self->_mmappedWeights = v67;

        id v69 = self->_mmappedWeights;
        if (v69)
        {
          value = self->_weights.__ptr_.__value_;
          self->_weights.__ptr_.__value_ = 0;
          if (value) {
            operator delete[]();
          }
          long long v71 = [(SMTSimpleMmapBuffer *)v69 dataPointer];
          self->_weightsRawPtr = v71;
          sub_10000B754(self->_tensorInfo, v61, (uint64_t)v71);
          id v75 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          tensors = self->_tensors;
          self->_tensors = v75;

          long long v77 = qword_1000443B8;
          if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "Initial weights and tensor shapes have been read from evaluation graph", buf, 2u);
          }
          id v13 = 0;
        }
        else
        {
          NSErrorUserInfoKey v94 = NSLocalizedDescriptionKey;
          CFStringRef v95 = @"Unable to memory map the buffer";
          long long v79 = +[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
          id v13 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:151 userInfo:v79];
        }
      }

      goto LABEL_10;
    }
    NSErrorUserInfoKey v104 = NSLocalizedDescriptionKey;
    CFStringRef v105 = @"recipe[kRecipePartialUpdateOffsetFile] is configured but not resolved";
    id v12 = +[NSDictionary dictionaryWithObjects:&v105 forKeys:&v104 count:1];
    id v13 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:151 userInfo:v12];
LABEL_9:
    id v10 = 0;
    goto LABEL_10;
  }
  NSErrorUserInfoKey v106 = NSUnderlyingErrorKey;
  id v107 = v10;
  id v12 = +[NSDictionary dictionaryWithObjects:&v107 forKeys:&v106 count:1];
  id v13 = +[NSError errorWithDomain:@"com.apple.siri.speechmodeltraining" code:151 userInfo:v12];
LABEL_10:

LABEL_11:
  return v13;
}

- (id)loadData
{
  BOOL v3 = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"language"];
  id v4 = v3;
  if (!v3) {
    BOOL v3 = @"en-US";
  }
  id v5 = [(__CFString *)v3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
  language = self->_language;
  self->_language = v5;

  unsigned int v7 = sub_10000AE0C(self->_recipe, @"mergeTrainDev", 0);
  if (v7)
  {
    objc_storeStrong((id *)&self->_evalData, self->_trainData);
    uint64_t v8 = qword_1000443B8;
    if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "merge training and evaluation data and use them for both training and evaluation", buf, 2u);
    }
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v10 = self->_trainData;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v36;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v10);
        }
        self->_numWordsTrain += (unint64_t)[*(id *)(*((void *)&v35 + 1) + 8 * i) count]+ 1;
      }
      id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v11);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v14 = self->_evalData;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v32;
    do
    {
      for (unint64_t j = 0; j != v15; unint64_t j = (char *)j + 1)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v14);
        }
        self->_numWordsEval += (unint64_t)[*(id *)(*((void *)&v31 + 1) + 8 * (void)j) count]
                             + 1;
      }
      id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v15);
  }

  id v18 = (id)qword_1000443B8;
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v19)
    {
      id v20 = [(NSMutableArray *)self->_trainData count];
      unint64_t numWordsTrain = self->_numWordsTrain;
      *(_DWORD *)long long buf = 134218240;
      id v40 = v20;
      __int16 v41 = 2048;
      unint64_t v42 = numWordsTrain;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%lu sentences (%lu words) will be used for both traiing and evaluation data", buf, 0x16u);
    }

    unint64_t v22 = self->_numWordsTrain + self->_numWordsEval;
    self->_unint64_t numWordsTrain = v22;
    self->_unint64_t numWordsEval = v22;
  }
  else
  {
    if (v19)
    {
      id v23 = [(NSMutableArray *)self->_trainData count];
      unint64_t v24 = self->_numWordsTrain;
      *(_DWORD *)long long buf = 134218240;
      id v40 = v23;
      __int16 v41 = 2048;
      unint64_t v42 = v24;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%lu sentences (%lu words) will be used for traiing data", buf, 0x16u);
    }

    id v25 = (id)qword_1000443B8;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      id v26 = [(NSMutableArray *)self->_evalData count];
      unint64_t numWordsEval = self->_numWordsEval;
      *(_DWORD *)long long buf = 134218240;
      id v40 = v26;
      __int16 v41 = 2048;
      unint64_t v42 = numWordsEval;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%lu sentences (%lu words) will be used for evaluation data", buf, 0x16u);
    }

    unint64_t v22 = self->_numWordsTrain;
  }
  long long v28 = +[NSNumber numberWithUnsignedInteger:v22];
  [(NSMutableDictionary *)self->_results setObject:v28 forKeyedSubscript:@"NumWordsInTraining"];

  long long v29 = +[NSNumber numberWithUnsignedInteger:self->_numWordsEval];
  [(NSMutableDictionary *)self->_results setObject:v29 forKeyedSubscript:@"NumWordsInEvaluation"];

  return 0;
}

- (SMTGlobalNNLM)initWithRecipe:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SMTGlobalNNLM;
  id v6 = [(SMTGlobalNNLM *)&v16 init];
  unsigned int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_recipe, a3);
    v7->_unint64_t numParam = 0;
    uint64_t v8 = objc_opt_new();
    trainData = v7->_trainData;
    v7->_trainData = (NSMutableArray *)v8;

    uint64_t v10 = objc_opt_new();
    evalData = v7->_evalData;
    v7->_evalData = (NSMutableArray *)v10;

    v7->_weightsAreUpdated = 0;
    v7->_unint64_t numWordsTrain = 0;
    v7->_unint64_t numWordsEval = 0;
    uint64_t v12 = objc_opt_new();
    results = v7->_results;
    v7->_results = (NSMutableDictionary *)v12;

    v7->_deltaIsPartial = 0;
    mmappedPartialWeights = v7->_mmappedPartialWeights;
    v7->_mmappedPartialWeights = 0;
  }
  return v7;
}

- (id)_fetchTensorInfo:(id)a3
{
  id v29 = a3;
  id v26 = (id)objc_opt_new();
  id v30 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obunint64_t j = [(NSDictionary *)self->_recipe objectForKeyedSubscript:@"trainingGlobals"];
  id v4 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v4)
  {
    unsigned int v34 = 0;
    uint64_t v28 = *(void *)v41;
    do
    {
      id v5 = 0;
      id v31 = v4;
      do
      {
        if (*(void *)v41 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v40 + 1) + 8 * (void)v5);
        unsigned int v7 = [v29 getTensorNamed:v6 directBind:1];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v35 = v7;
        uint64_t v8 = [v7 shape];
        id v9 = [v8 countByEnumeratingWithState:&v36 objects:v46 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v37;
          LODWORD(v11) = 1;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v37 != v10) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(id *)(*((void *)&v36 + 1) + 8 * i);
              unsigned int v14 = [v13 intValue];

              uint64_t v11 = v14 * v11;
            }
            id v9 = [v8 countByEnumeratingWithState:&v36 objects:v46 count:16];
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
        long long v32 = +[NSNumber numberWithInt:v11];
        v45[1] = v32;
        v44[2] = @"shape";
        id v15 = objc_alloc((Class)NSMutableArray);
        objc_super v16 = [v35 shape];
        id v17 = [v15 initWithArray:v16 copyItems:1];
        v45[2] = v17;
        v44[3] = @"strides";
        id v18 = objc_alloc((Class)NSMutableArray);
        BOOL v19 = [v35 strides];
        id v20 = [v18 initWithArray:v19 copyItems:1];
        v45[3] = v20;
        v44[4] = @"offset";
        uint64_t v21 = +[NSNumber numberWithInt:v34];
        v45[4] = v21;
        unint64_t v22 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:5];
        id v23 = [v22 mutableCopy];
        [v30 setObject:v23 forKeyedSubscript:v6];

        v34 += v11;
        id v5 = (char *)v5 + 1;
      }
      while (v5 != v31);
      id v4 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v4);
  }
  else
  {
    unsigned int v34 = 0;
  }

  [v26 setObject:v30 forKeyedSubscript:@"tensorInfo"];
  unint64_t v24 = +[NSNumber numberWithInt:v34];
  [v26 setObject:v24 forKeyedSubscript:@"totalSize"];

  return v26;
}

+ (id)compressedAttachmentURLFromRecipe:(id)a3 attachments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"compressedAttachmentFilename"];
  if (v8)
  {
    id v9 = [a1 attachmentURL:v7 withName:v8];
    uint64_t v10 = qword_1000443B8;
    if (os_log_type_enabled((os_log_t)qword_1000443B8, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      unsigned int v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Attached compressed file URL: %@", (uint8_t *)&v13, 0xCu);
    }
    if (v9) {
      id v11 = v9;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)attachmentURL:(id)a3 withName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 count];
  uint64_t v8 = 0;
  if (v6 && v7)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100011594;
    v11[3] = &unk_10003C9E8;
    id v12 = v6;
    id v9 = [v5 indexOfObjectPassingTest:v11];
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = [v5 objectAtIndexedSubscript:v9];
    }
  }
  return v8;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_1000443B8 = (uint64_t)os_log_create("com.apple.speech.speechmodeltraining", "SMTGlobalNNLM");
    _objc_release_x1();
  }
}

@end