@interface MLItemSimilarityRecommender
+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6;
+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5;
+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
+ (id)loadModelFromSpecificationWithCompilationOptions:(void *)a3 options:(id)a4 error:(id *)a5;
- (BOOL)_mapItemSequence:(id)a3 dest:(void *)a4 error:(id *)a5;
- (const)modelData;
- (double)predictionFromFeatures:(uint64_t)a3 options:(char)a4 error:;
- (id).cxx_construct;
- (id)_itemForIndex:(unint64_t)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation MLItemSimilarityRecommender

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 25) = 0;
  *((void *)self + 26) = 0;
  *((void *)self + 24) = 0;
  *((void *)self + 28) = 0;
  *((void *)self + 29) = 0;
  *((void *)self + 27) = 0;
  *((void *)self + 31) = 0;
  *((void *)self + 32) = 0;
  *((void *)self + 30) = 0;
  *((void *)self + 34) = 0;
  *((void *)self + 35) = 0;
  *((void *)self + 33) = 0;
  *((void *)self + 37) = 0;
  *((void *)self + 38) = 0;
  *((void *)self + 36) = 0;
  *((void *)self + 40) = 0;
  *((void *)self + 41) = 0;
  *((void *)self + 39) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_m_item_heap = &self->_m_item_heap;
  begin = self->_m_item_heap.__begin_;
  if (begin)
  {
    p_m_item_heap->__end_ = begin;
    operator delete(begin);
  }
  v5 = self->_m_item_predictions.__begin_;
  if (v5)
  {
    self->_m_item_predictions.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_m_item_invalid_mask.__begin_;
  if (v6)
  {
    self->_m_item_invalid_mask.__end_ = v6;
    operator delete(v6);
  }
  v7 = self->_m_item_buffer.__begin_;
  if (v7)
  {
    self->_m_item_buffer.__end_ = v7;
    operator delete(v7);
  }
  v8 = self->_m_items.__begin_;
  if (v8)
  {
    self->_m_items.__end_ = v8;
    operator delete(v8);
  }
  v9 = self->_m_scores.__begin_;
  if (v9)
  {
    self->_m_scores.__end_ = v9;
    operator delete(v9);
  }
  objc_storeStrong((id *)&self->m_item_integer_list, 0);
  objc_storeStrong((id *)&self->m_item_string_list, 0);
  objc_storeStrong((id *)&self->m_item_mapping, 0);
  objc_storeStrong((id *)&self->m_item_score_output_feature_name, 0);
  objc_storeStrong((id *)&self->m_item_list_output_feature_name, 0);
  objc_storeStrong((id *)&self->m_item_exclusion_feature_name, 0);
  objc_storeStrong((id *)&self->m_item_restriction_feature_name, 0);
  objc_storeStrong((id *)&self->m_num_recommendations_feature_name, 0);
  objc_storeStrong((id *)&self->m_item_data_feature_name, 0);
  objc_storeStrong((id *)&self->m_model_data, 0);
  v10 = self->m_cached_model.__begin_;
  if (v10)
  {
    self->m_cached_model.__end_ = v10;
    operator delete(v10);
  }
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v250 = *MEMORY[0x1E4F143B8];
  id v225 = a3;
  id v224 = a4;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  v7 = [(MLModel *)self predictionEvent];
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v234, v7, 4, -[MLModel signpostID](self, "signpostID"), [v224 parentSignpostID], -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v228 = [v225 featureValueForName:self->m_item_data_feature_name];
  [(MLModel *)self signpostID];
  kdebug_trace();
  if ([v228 type] == 7)
  {
    v8 = [v228 sequenceValue];
    if (![(MLItemSimilarityRecommender *)self _mapItemSequence:v8 dest:&self->_m_items error:a5])goto LABEL_53; {
    [(MLModel *)self signpostID];
    }
    v9 = 0;
    kdebug_trace();
    goto LABEL_311;
  }
  if ([v228 type] == 6)
  {
    p_m_items = &self->_m_items;
    self->_m_items.__end_ = self->_m_items.__begin_;
    p_m_scores = &self->_m_scores;
    self->_m_scores.__end_ = self->_m_scores.__begin_;
    v12 = [v228 dictionaryValue];
    std::vector<long long>::reserve((void **)&self->_m_items.__begin_, [v12 count]);

    v13 = [v228 dictionaryValue];
    std::vector<double>::reserve((void **)&self->_m_scores.__begin_, [v13 count]);

    long long v232 = 0u;
    long long v233 = 0u;
    long long v230 = 0u;
    long long v231 = 0u;
    v8 = [v228 dictionaryValue];
    uint64_t v14 = [v8 countByEnumeratingWithState:&v230 objects:v249 count:16];
    if (!v14) {
      goto LABEL_53;
    }
    obunint64_t j = v8;
    uint64_t v15 = *(void *)v231;
    while (1)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v231 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v230 + 1) + 8 * i);
        v18 = [v228 dictionaryValue];
        v19 = [v18 objectForKeyedSubscript:v17];

        if ([(NSDictionary *)self->m_item_mapping count])
        {
          v20 = [(NSDictionary *)self->m_item_mapping objectForKeyedSubscript:v17];
          v21 = v20;
          if (!v20) {
            goto LABEL_47;
          }
          unint64_t v22 = [v20 unsignedLongValue];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a5)
            {
              *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"String items require string item ids to be be set."];
            }
            [(MLModel *)self signpostID];
            kdebug_trace();
            goto LABEL_307;
          }
          unint64_t v22 = [v17 unsignedLongValue];
        }
        if (v22 < self->m_num_items)
        {
          end = self->_m_items.__end_;
          value = self->_m_items.__end_cap_.__value_;
          if (end >= value)
          {
            begin = p_m_items->__begin_;
            uint64_t v27 = end - p_m_items->__begin_;
            unint64_t v28 = v27 + 1;
            if ((unint64_t)(v27 + 1) >> 61) {
              std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v29 = (char *)value - (char *)begin;
            if (v29 >> 2 > v28) {
              unint64_t v28 = v29 >> 2;
            }
            BOOL v30 = (unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8;
            unint64_t v31 = 0x1FFFFFFFFFFFFFFFLL;
            if (!v30) {
              unint64_t v31 = v28;
            }
            if (v31)
            {
              unint64_t v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v31);
              begin = p_m_items->__begin_;
              end = self->_m_items.__end_;
            }
            else
            {
              uint64_t v32 = 0;
            }
            v33 = (unint64_t *)(v31 + 8 * v27);
            unint64_t *v33 = v22;
            v25 = v33 + 1;
            while (end != begin)
            {
              unint64_t v34 = *--end;
              *--v33 = v34;
            }
            p_m_items->__begin_ = v33;
            self->_m_items.__end_ = v25;
            self->_m_items.__end_cap_.__value_ = (unint64_t *)(v31 + 8 * v32);
            if (begin) {
              operator delete(begin);
            }
          }
          else
          {
            unint64_t *end = v22;
            v25 = end + 1;
          }
          self->_m_items.__end_ = v25;
          [v19 doubleValue];
          uint64_t v36 = v35;
          v38 = self->_m_scores.__end_;
          v37 = self->_m_scores.__end_cap_.__value_;
          if (v38 >= v37)
          {
            v40 = p_m_scores->__begin_;
            uint64_t v41 = v38 - p_m_scores->__begin_;
            unint64_t v42 = v41 + 1;
            if ((unint64_t)(v41 + 1) >> 61) {
              std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v43 = (char *)v37 - (char *)v40;
            if (v43 >> 2 > v42) {
              unint64_t v42 = v43 >> 2;
            }
            BOOL v30 = (unint64_t)v43 >= 0x7FFFFFFFFFFFFFF8;
            unint64_t v44 = 0x1FFFFFFFFFFFFFFFLL;
            if (!v30) {
              unint64_t v44 = v42;
            }
            if (v44)
            {
              unint64_t v44 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v44);
              v40 = p_m_scores->__begin_;
              v38 = self->_m_scores.__end_;
            }
            else
            {
              uint64_t v45 = 0;
            }
            v46 = (double *)(v44 + 8 * v41);
            *(void *)v46 = v36;
            v39 = v46 + 1;
            while (v38 != v40)
            {
              uint64_t v47 = *((void *)v38-- - 1);
              *((void *)v46-- - 1) = v47;
            }
            p_m_scores->__begin_ = v46;
            self->_m_scores.__end_ = v39;
            self->_m_scores.__end_cap_.__value_ = (double *)(v44 + 8 * v45);
            if (v40) {
              operator delete(v40);
            }
          }
          else
          {
            *(void *)v38 = v35;
            v39 = v38 + 1;
          }
          self->_m_scores.__end_ = v39;
        }
LABEL_47:
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v230 objects:v249 count:16];
      if (!v14)
      {
        v8 = obj;
LABEL_53:

        unint64_t m_num_items = self->m_num_items;
        if ([(NSString *)self->m_num_recommendations_feature_name length])
        {
          v49 = [v225 featureValueForName:self->m_num_recommendations_feature_name];
          uint64_t v50 = [v49 int64Value];
          if (v50 - 1 >= self->m_num_items) {
            unint64_t m_num_items = self->m_num_items;
          }
          else {
            unint64_t m_num_items = v50;
          }
        }
        p_m_item_invalid_mask = &self->_m_item_invalid_mask;
        unint64_t v52 = self->m_num_items;
        v53 = self->_m_item_invalid_mask.__end_cap_.__value_;
        v54 = self->_m_item_invalid_mask.__begin_;
        if (v53 - v54 >= v52)
        {
          v59 = (char *)(self->_m_item_invalid_mask.__end_ - v54);
          if ((unint64_t)v59 >= v52) {
            v60 = (char *)self->m_num_items;
          }
          else {
            v60 = (char *)(self->_m_item_invalid_mask.__end_ - v54);
          }
          for (; v60; --v60)
            *v54++ = 0;
          BOOL v30 = v52 >= (unint64_t)v59;
          unint64_t v61 = v52 - (void)v59;
          if (v61 != 0 && v30)
          {
            v62 = self->_m_item_invalid_mask.__end_;
            v63 = &v62[v61];
            do
            {
              *v62++ = 0;
              --v61;
            }
            while (v61);
            self->_m_item_invalid_mask.__end_ = v63;
          }
          else
          {
            self->_m_item_invalid_mask.__end_ = &p_m_item_invalid_mask->__begin_[v52];
          }
        }
        else
        {
          if (v54)
          {
            self->_m_item_invalid_mask.__end_ = v54;
            operator delete(v54);
            v53 = 0;
            p_m_item_invalid_mask->__begin_ = 0;
            self->_m_item_invalid_mask.__end_ = 0;
            self->_m_item_invalid_mask.__end_cap_.__value_ = 0;
          }
          if ((v52 & 0x8000000000000000) != 0) {
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v55 = 2 * (void)v53;
          if (2 * (uint64_t)v53 <= v52) {
            uint64_t v55 = v52;
          }
          if ((unint64_t)v53 >= 0x3FFFFFFFFFFFFFFFLL) {
            size_t v56 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            size_t v56 = v55;
          }
          std::vector<unsigned char>::__vallocate[abi:ne180100](&self->_m_item_invalid_mask.__begin_, v56);
          v57 = self->_m_item_invalid_mask.__end_;
          v58 = &v57[v52];
          do
          {
            *v57++ = 0;
            --v52;
          }
          while (v52);
          self->_m_item_invalid_mask.__end_ = v58;
        }
        if (![(NSString *)self->m_item_restriction_feature_name length]) {
          goto LABEL_98;
        }
        v64 = [v225 featureValueForName:self->m_item_restriction_feature_name];
        v8 = v64;
        if (!v64) {
          goto LABEL_97;
        }
        if ([v64 type] == 7)
        {
          v19 = [v8 sequenceValue];
          p_m_item_buffer = &self->_m_item_buffer;
          if ([(MLItemSimilarityRecommender *)self _mapItemSequence:v19 dest:&self->_m_item_buffer error:a5])
          {
LABEL_102:
            [(MLModel *)self signpostID];
            kdebug_trace();
            obunint64_t j = v8;
            goto LABEL_307;
          }
          v66 = p_m_item_buffer->__begin_;
          v67 = self->_m_item_buffer.__end_;
          if (p_m_item_buffer->__begin_ != v67)
          {
            int64_t v68 = self->_m_item_invalid_mask.__end_ - p_m_item_invalid_mask->__begin_;
            if (v68 >= 1)
            {
              memset(p_m_item_invalid_mask->__begin_, 1, v68);
              v66 = p_m_item_buffer->__begin_;
              v67 = self->_m_item_buffer.__end_;
            }
            while (v66 != v67)
            {
              uint64_t v69 = *v66++;
              p_m_item_invalid_mask->__begin_[v69] = 0;
            }
          }

LABEL_97:
LABEL_98:
          v70 = &self->_m_items;
          if (![(NSString *)self->m_item_exclusion_feature_name length]
            || ([v225 featureValueForName:self->m_item_exclusion_feature_name],
                v71 = objc_claimAutoreleasedReturnValue(),
                (v8 = v71) == 0))
          {
            v73 = v70->__begin_;
            v74 = self->_m_items.__end_;
            if (v70->__begin_ != v74)
            {
              do
              {
                uint64_t v75 = *v73++;
                p_m_item_invalid_mask->__begin_[v75] = 1;
              }
              while (v73 != v74);
            }
            goto LABEL_112;
          }
          if ([v71 type] == 7)
          {
            v19 = [v8 sequenceValue];
            v72 = &self->_m_item_buffer;
            if ([(MLItemSimilarityRecommender *)self _mapItemSequence:v19 dest:&self->_m_item_buffer error:a5])
            {
              goto LABEL_102;
            }
            v76 = v72->__begin_;
            v77 = self->_m_item_buffer.__end_;
            if (v72->__begin_ != v77)
            {
              do
              {
                uint64_t v78 = *v76++;
                p_m_item_invalid_mask->__begin_[v78] = 1;
              }
              while (v76 != v77);
            }

LABEL_112:
            std::vector<double>::resize((char **)&self->_m_item_predictions, self->m_num_items);
            int64_t v79 = (char *)self->_m_item_predictions.__end_ - (char *)self->_m_item_predictions.__begin_;
            if (v79 >= 1) {
              bzero(self->_m_item_predictions.__begin_, 8 * (((unint64_t)v79 >> 3) - ((unint64_t)v79 > 7)) + 8);
            }
            [(MLModel *)self signpostID];
            kdebug_trace();
            unint64_t v80 = [(MLModel *)self signpostID];
            uint64_t v81 = [v224 parentSignpostID];
            kdebug_trace();
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __68__MLItemSimilarityRecommender_predictionFromFeatures_options_error___block_invoke;
            aBlock[3] = &__block_descriptor_48_e5_v8__0l;
            aBlock[4] = v80;
            aBlock[5] = v81;
            v223 = (void (**)(void))_Block_copy(aBlock);
            unint64_t v222 = m_num_items;
            v82 = self->_m_item_predictions.__begin_;
            v83 = [(MLItemSimilarityRecommender *)self modelData];
            v84 = v83 + 12;
            uint64_t v85 = 8 - ((unint64_t)(v83 + 12) & 7);
            v86 = p_m_item_invalid_mask->__begin_;
            if (((unint64_t)(v83 + 12) & 7) == 0) {
              uint64_t v85 = 0;
            }
            if (self->_m_scores.__begin_ == self->_m_scores.__end_) {
              v87 = 0;
            }
            else {
              v87 = self->_m_scores.__begin_;
            }
            v88 = v70->__begin_;
            v89 = self->_m_items.__end_;
            v240[0] = 0;
            v240[1] = 0;
            long long v236 = 0u;
            long long v237 = 0u;
            v238 = 0;
            v239 = (CoreML::Archiver::MMappedContentManager *)v240;
            int v235 = 0;
            HIDWORD(v236) = 64;
            v244[0] = 0;
            v244[1] = 0;
            long long v241 = 0u;
            long long v242 = 0u;
            v243 = (CoreML::Archiver::MMappedContentManager *)v244;
            DWORD1(v241) = 64;
            v248[0] = 0;
            v248[1] = 0;
            long long v245 = 0u;
            long long v246 = 0u;
            v247 = (CoreML::Archiver::MMappedContentManager *)v248;
            int v235 = *(_DWORD *)v83;
            uint64_t v90 = *(void *)(v83 + 4);
            *(void *)&long long v236 = v90;
            v91 = &v84[v85];
            *((void *)&v236 + 1) = *(void *)&v84[v85];
            long long v237 = *(_OWORD *)&v84[v85 + 8];
            if ((void)v237)
            {
              *((void *)&v237 + 1) = *((void *)v91 + 3);
              v238 = v91 + 32;
              uint64_t v92 = (uint64_t)&v91[8 * *((void *)&v237 + 1) + 32];
            }
            else
            {
              uint64_t v92 = (uint64_t)(v91 + 24);
            }
            uint64_t v93 = 8 - (v92 & 7);
            if ((v92 & 7) == 0) {
              uint64_t v93 = 0;
            }
            uint64_t v94 = v92 + v93;
            uint64_t v95 = 8 - (v94 & 7);
            if ((v94 & 7) == 0) {
              uint64_t v95 = 0;
            }
            uint64_t v96 = v94 + v95;
            long long v241 = *(_OWORD *)v96;
            *(void *)&long long v242 = *(void *)(v96 + 16);
            if (*((void *)&v241 + 1))
            {
              *(void *)&long long v242 = *(void *)(v96 + 24);
              *((void *)&v242 + 1) = v96 + 32;
              uint64_t v97 = v96 + 32 + 8 * v242;
            }
            else
            {
              uint64_t v97 = v96 + 24;
            }
            uint64_t v98 = 8 - (v97 & 7);
            if ((v97 & 7) == 0) {
              uint64_t v98 = 0;
            }
            v99 = (void *)(v97 + v98);
            *(void *)&long long v245 = *v99;
            *((void *)&v245 + 1) = v99 + 1;
            v100 = &v99[v245 + 1];
            *(void *)&long long v246 = *v100;
            *((void *)&v246 + 1) = v100 + 1;
            if (v90 >= 1) {
              bzero(v82, 8 * (v90 - ((v90 & 0x1FFFFFFFFFFFFFFFLL) != 0)) + 8);
            }
            if (v89 == v88) {
              uint64_t v101 = v90;
            }
            else {
              uint64_t v101 = v89 - v88;
            }
            if (v101)
            {
              unint64_t v102 = 0;
              if (v87) {
                BOOL v103 = v89 == v88;
              }
              else {
                BOOL v103 = 1;
              }
              char v104 = v103;
              uint64_t v105 = HIDWORD(v236);
              v106 = v238;
              uint64_t v107 = ~(-1 << SBYTE12(v236));
              long long v108 = v246;
              uint64_t v109 = DWORD1(v241);
              uint64_t v110 = *((void *)&v242 + 1);
              uint64_t v111 = ~(-1 << SBYTE4(v241));
              while (1)
              {
                if (v89 == v88)
                {
                  double v113 = 0.0;
                  unint64_t v112 = v102;
                  goto LABEL_150;
                }
                unint64_t v112 = v88[v102];
                if (v112 < v90) {
                  break;
                }
LABEL_175:
                if (++v102 == v101) {
                  goto LABEL_176;
                }
              }
              if (v87) {
                double v113 = v87[v102];
              }
              else {
                double v113 = 1.0;
              }
LABEL_150:
              unint64_t v114 = *(void *)&v106[(v112 * v105) >> 3];
              unint64_t v115 = v105 + v105 * v112;
              if (v105 == 64)
              {
                unint64_t v116 = *(void *)&v106[v115 >> 3];
                if (!(void)v108)
                {
LABEL_155:
                  unint64_t v117 = v116 - v114;
                  if (v104)
                  {
                    if (v116 > v114)
                    {
                      uint64_t v118 = 0;
                      uint64_t v119 = 0;
                      uint64_t v120 = *((void *)&v245 + 1) + 8 * v114;
                      unint64_t v121 = v109 * v114;
                      do
                      {
                        unint64_t v122 = *(void *)(v110 + (v121 >> 3));
                        if (v109 != 64) {
                          unint64_t v122 = (v122 >> (v121 & 7)) & v111;
                        }
                        if (v118) {
                          ++v119;
                        }
                        v119 += v122;
                        if (!v86[v119]) {
                          v82[v119] = *(double *)(v120 + 8 * v118) + v82[v119];
                        }
                        ++v118;
                        v121 += v109;
                      }
                      while (v117 != v118);
                    }
                  }
                  else if (v116 > v114)
                  {
                    uint64_t v123 = 0;
                    uint64_t v124 = 0;
                    uint64_t v125 = *((void *)&v245 + 1) + 8 * v114;
                    unint64_t v126 = v109 * v114;
                    do
                    {
                      unint64_t v127 = *(void *)(v110 + (v126 >> 3));
                      if (v109 != 64) {
                        unint64_t v127 = (v127 >> (v126 & 7)) & v111;
                      }
                      if (v123) {
                        ++v124;
                      }
                      v124 += v127;
                      if (!v86[v124]) {
                        v82[v124] = v82[v124] + *(double *)(v125 + 8 * v123) * v113;
                      }
                      ++v123;
                      v126 += v109;
                    }
                    while (v117 != v123);
                  }
                  goto LABEL_175;
                }
              }
              else
              {
                unint64_t v114 = (v114 >> ((v112 * v105) & 7)) & v107;
                unint64_t v116 = (*(void *)&v106[v115 >> 3] >> (v115 & 7)) & v107;
                if (!(void)v108) {
                  goto LABEL_155;
                }
              }
              double v113 = v113 - *(double *)(*((void *)&v108 + 1) + 8 * v112);
              goto LABEL_155;
            }
LABEL_176:
            while (v90)
            {
              double *v82 = *v82 / (double)(unint64_t)v101;
              ++v82;
              --v90;
            }
            CoreML::Archiver::MMappedContentManager::~MMappedContentManager(&v247);
            CoreML::Archiver::MMappedContentManager::~MMappedContentManager(&v243);
            CoreML::Archiver::MMappedContentManager::~MMappedContentManager(&v239);
            v223[2](v223);

            [(MLModel *)self signpostID];
            kdebug_trace();
            p_m_item_heap = &self->_m_item_heap;
            v129 = self->_m_item_heap.__begin_;
            self->_m_item_heap.__end_ = v129;
            unint64_t v130 = self->m_num_items;
            if (v130 > ((char *)self->_m_item_heap.__end_cap_.__value_ - (char *)v129) >> 4)
            {
              if (v130 >> 60) {
                std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
              }
              v131 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v130);
              v134 = (char *)p_m_item_heap->__begin_;
              v133 = (char *)self->_m_item_heap.__end_;
              v135 = v131;
              if (v133 != p_m_item_heap->__begin_)
              {
                do
                {
                  *((_OWORD *)v135 - 1) = *((_OWORD *)v133 - 1);
                  v135 -= 16;
                  v133 -= 16;
                }
                while (v133 != v134);
                v133 = (char *)p_m_item_heap->__begin_;
              }
              p_m_item_heap->__begin_ = v135;
              self->_m_item_heap.__end_ = v131;
              self->_m_item_heap.__end_cap_.__value_ = &v131[16 * v132];
              if (v133) {
                operator delete(v133);
              }
            }
            unint64_t v136 = self->m_num_items;
            if (v136)
            {
              for (unint64_t j = 0; j < v136; ++j)
              {
                if (!p_m_item_invalid_mask->__begin_[j])
                {
                  double v138 = self->_m_item_predictions.__begin_[j];
                  v140 = (char *)self->_m_item_heap.__end_;
                  v139 = (char *)self->_m_item_heap.__end_cap_.__value_;
                  if (v140 >= v139)
                  {
                    v142 = (char *)p_m_item_heap->__begin_;
                    uint64_t v143 = (v140 - (char *)p_m_item_heap->__begin_) >> 4;
                    unint64_t v144 = v143 + 1;
                    if ((unint64_t)(v143 + 1) >> 60) {
                      std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
                    }
                    uint64_t v145 = v139 - v142;
                    if (v145 >> 3 > v144) {
                      unint64_t v144 = v145 >> 3;
                    }
                    if ((unint64_t)v145 >= 0x7FFFFFFFFFFFFFF0) {
                      unint64_t v146 = 0xFFFFFFFFFFFFFFFLL;
                    }
                    else {
                      unint64_t v146 = v144;
                    }
                    if (v146)
                    {
                      unint64_t v146 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v146);
                      v142 = (char *)p_m_item_heap->__begin_;
                      v140 = (char *)self->_m_item_heap.__end_;
                    }
                    else
                    {
                      uint64_t v147 = 0;
                    }
                    v148 = (double *)(v146 + 16 * v143);
                    *(void *)v148 = j;
                    v148[1] = v138;
                    v149 = v148;
                    if (v140 != v142)
                    {
                      do
                      {
                        *((_OWORD *)v149 - 1) = *((_OWORD *)v140 - 1);
                        v149 -= 2;
                        v140 -= 16;
                      }
                      while (v140 != v142);
                      v142 = (char *)p_m_item_heap->__begin_;
                    }
                    v141 = v148 + 2;
                    p_m_item_heap->__begin_ = v149;
                    self->_m_item_heap.__end_ = v148 + 2;
                    self->_m_item_heap.__end_cap_.__value_ = (void *)(v146 + 16 * v147);
                    if (v142) {
                      operator delete(v142);
                    }
                  }
                  else
                  {
                    *(void *)v140 = j;
                    *((double *)v140 + 1) = v138;
                    v141 = v140 + 16;
                  }
                  self->_m_item_heap.__end_ = v141;
                  unint64_t v136 = self->m_num_items;
                }
              }
            }
            v151 = (double *)p_m_item_heap->__begin_;
            v150 = (double *)self->_m_item_heap.__end_;
            uint64_t v152 = (char *)v150 - (char *)p_m_item_heap->__begin_;
            if (v222 >= v152 >> 4) {
              goto LABEL_289;
            }
            v153 = &v151[2 * v222];
            while (v150 != v153)
            {
              unint64_t v154 = ((char *)v150 - (char *)v151) >> 4;
              if (v154 < 2) {
                break;
              }
              if (v154 == 3)
              {
                std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::__wrap_iter<std::pair<unsigned long long,double> *>>(v151, v151 + 2, v150 - 2);
                break;
              }
              if (v154 == 2)
              {
                double v188 = *(v150 - 1);
                double v189 = v151[1];
                if (v188 > v189)
                {
                  double v190 = *v151;
                  double *v151 = *(v150 - 2);
                  *(v150 - 2) = v190;
                  v151[1] = v188;
                  *(v150 - 1) = v189;
                }
                break;
              }
              if ((char *)v150 - (char *)v151 <= 127)
              {
                while (v151 != v150 - 2)
                {
                  v191 = v151;
                  v151 += 2;
                  if (v191 != v150 && v151 != v150)
                  {
                    v192 = v151;
                    v193 = v191;
                    do
                    {
                      if (v192[1] > v193[1]) {
                        v193 = v192;
                      }
                      v192 += 2;
                    }
                    while (v192 != v150);
                    if (v193 != v191)
                    {
                      uint64_t v194 = *(void *)v191;
                      double *v191 = *v193;
                      *(void *)v193 = v194;
                      uint64_t v195 = *((void *)v191 + 1);
                      v191[1] = v193[1];
                      *((void *)v193 + 1) = v195;
                    }
                  }
                }
                break;
              }
              v155 = &v151[2 * (v154 >> 1)];
              v156 = v150 - 2;
              int v157 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::__wrap_iter<std::pair<unsigned long long,double> *>>(v151, v155, v150 - 2);
              double v158 = v151[1];
              double v159 = v155[1];
              if (v158 <= v159)
              {
                v161 = v150 - 2;
                while (1)
                {
                  unint64_t v160 = (unint64_t)(v161 - 2);
                  if (v161 - 2 == v151) {
                    break;
                  }
                  double v162 = *(v161 - 1);
                  v161 -= 2;
                  if (v162 > v159)
                  {
                    double v163 = *v151;
                    double *v151 = *(double *)v160;
                    *(double *)unint64_t v160 = v163;
                    v151[1] = v162;
                    *(double *)(v160 + 8) = v158;
                    ++v157;
                    goto LABEL_218;
                  }
                }
                v177 = v151 + 2;
                double v178 = *(v150 - 1);
                if (v158 <= v178)
                {
                  while (v177 != v156)
                  {
                    double v179 = v177[1];
                    if (v158 > v179)
                    {
                      uint64_t v183 = *(void *)v177;
                      double *v177 = *(v150 - 2);
                      *((void *)v150 - 2) = v183;
                      v177[1] = v178;
                      *(v150 - 1) = v179;
                      v177 += 2;
                      goto LABEL_249;
                    }
                    v177 += 2;
                  }
                  break;
                }
LABEL_249:
                if (v177 == v156) {
                  break;
                }
                while (1)
                {
                  double v184 = v151[1];
                  do
                  {
                    v174 = v177;
                    double v185 = v177[1];
                    v177 += 2;
                  }
                  while (v184 <= v185);
                  do
                  {
                    double v186 = *(v156 - 1);
                    v156 -= 2;
                  }
                  while (v184 > v186);
                  if (v174 >= v156) {
                    break;
                  }
                  double v187 = *v174;
                  double *v174 = *v156;
                  double *v156 = v187;
                  v174[1] = v186;
                  v156[1] = v185;
                }
                if (v174 > v153) {
                  break;
                }
              }
              else
              {
                unint64_t v160 = (unint64_t)(v150 - 2);
LABEL_218:
                v164 = v151 + 2;
                if ((unint64_t)(v151 + 2) >= v160)
                {
                  v167 = v151 + 2;
                }
                else
                {
                  v165 = v151 + 2;
                  while (1)
                  {
                    double v166 = v155[1];
                    do
                    {
                      v167 = v165;
                      double v168 = v165[1];
                      v165 += 2;
                    }
                    while (v168 > v166);
                    do
                    {
                      double v169 = *(double *)(v160 - 8);
                      v160 -= 16;
                    }
                    while (v169 <= v166);
                    if ((unint64_t)v167 >= v160) {
                      break;
                    }
                    double v170 = *v167;
                    double *v167 = *(double *)v160;
                    *(double *)unint64_t v160 = v170;
                    v167[1] = v169;
                    *(double *)(v160 + 8) = v168;
                    ++v157;
                    if (v155 == v167) {
                      v155 = (double *)v160;
                    }
                  }
                }
                if (v167 != v155)
                {
                  double v171 = v155[1];
                  double v172 = v167[1];
                  if (v171 > v172)
                  {
                    double v173 = *v167;
                    double *v167 = *v155;
                    double *v155 = v173;
                    v167[1] = v171;
                    v155[1] = v172;
                    ++v157;
                  }
                }
                if (v167 == v153) {
                  break;
                }
                if (!v157)
                {
                  if (v167 <= v153)
                  {
                    v180 = v167 + 2;
                    while (v180 != v150)
                    {
                      double v181 = v180[1];
                      double v182 = *(v180 - 1);
                      v180 += 2;
                      if (v181 > v182) {
                        goto LABEL_233;
                      }
                    }
                  }
                  else
                  {
                    while (v164 != v167)
                    {
                      double v175 = v164[1];
                      double v176 = *(v164 - 1);
                      v164 += 2;
                      if (v175 > v176) {
                        goto LABEL_233;
                      }
                    }
                  }
                  break;
                }
LABEL_233:
                if (v167 <= v153)
                {
                  v174 = v167 + 2;
                }
                else
                {
                  v150 = v167;
                  v174 = v151;
                }
              }
              v151 = v174;
            }
            v196 = p_m_item_heap->__begin_;
            v150 = (double *)self->_m_item_heap.__end_;
            unint64_t v197 = ((char *)v150 - (char *)p_m_item_heap->__begin_) >> 4;
            if (v222 <= v197)
            {
              if (v222 >= v197) {
                goto LABEL_288;
              }
              v150 = (double *)&v196[16 * v222];
            }
            else
            {
              unint64_t v198 = v222 - v197;
              v199 = self->_m_item_heap.__end_cap_.__value_;
              if (v222 - v197 > (v199 - (unsigned char *)v150) >> 4)
              {
                if (v222 >> 60) {
                  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v200 = v199 - v196;
                uint64_t v201 = v200 >> 3;
                if (v200 >> 3 <= v222) {
                  uint64_t v201 = v222;
                }
                if ((unint64_t)v200 >= 0x7FFFFFFFFFFFFFF0) {
                  unint64_t v202 = 0xFFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v202 = v201;
                }
                v203 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v202);
                v204 = &v203[16 * v197];
                v206 = &v203[16 * v205];
                bzero(v204, 16 * v198);
                v150 = (double *)&v204[16 * v198];
                v208 = (char *)p_m_item_heap->__begin_;
                v207 = (char *)self->_m_item_heap.__end_;
                if (v207 != p_m_item_heap->__begin_)
                {
                  do
                  {
                    *((_OWORD *)v204 - 1) = *((_OWORD *)v207 - 1);
                    v204 -= 16;
                    v207 -= 16;
                  }
                  while (v207 != v208);
                  v207 = (char *)p_m_item_heap->__begin_;
                }
                p_m_item_heap->__begin_ = v204;
                self->_m_item_heap.__end_ = v150;
                self->_m_item_heap.__end_cap_.__value_ = v206;
                if (v207)
                {
                  operator delete(v207);
                  v150 = (double *)self->_m_item_heap.__end_;
                }
LABEL_288:
                v151 = (double *)p_m_item_heap->__begin_;
                uint64_t v152 = (char *)v150 - (char *)p_m_item_heap->__begin_;
LABEL_289:
                unint64_t v209 = 126 - 2 * __clz(v152 >> 4);
                if (v150 == v151) {
                  uint64_t v210 = 0;
                }
                else {
                  uint64_t v210 = v209;
                }
                std::__introsort<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *,false>(v151, v150, v210, 1);
                v8 = objc_opt_new();
                obunint64_t j = v8;
                if ([(NSString *)self->m_item_score_output_feature_name length])
                {
                  v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:((char *)self->_m_item_heap.__end_ - (char *)self->_m_item_heap.__begin_) >> 4];
                  v211 = (double *)p_m_item_heap->__begin_;
                  v212 = self->_m_item_heap.__end_;
                  if (p_m_item_heap->__begin_ != v212)
                  {
                    while (1)
                    {
                      v213 = [(MLItemSimilarityRecommender *)self _itemForIndex:*(void *)v211 error:a5];
                      if (!v213) {
                        break;
                      }
                      v214 = [NSNumber numberWithDouble:v211[1]];
                      [v19 setObject:v214 forKeyedSubscript:v213];

                      v211 += 2;
                      if (v211 == v212) {
                        goto LABEL_296;
                      }
                    }
LABEL_306:
                    [(MLModel *)self signpostID];
                    kdebug_trace();
LABEL_307:

                    v9 = 0;
                    v8 = obj;
LABEL_311:

                    goto LABEL_312;
                  }
LABEL_296:
                  v215 = +[MLFeatureValue featureValueWithDictionary:v19 error:a5];
                  [obj setObject:v215 forKeyedSubscript:self->m_item_score_output_feature_name];

                  if (a5 && *a5) {
                    goto LABEL_306;
                  }

                  v8 = obj;
                }
                if ([(NSString *)self->m_item_list_output_feature_name length])
                {
                  v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:((char *)self->_m_item_heap.__end_ - (char *)self->_m_item_heap.__begin_) >> 4];
                  v216 = p_m_item_heap->__begin_;
                  v217 = self->_m_item_heap.__end_;
                  if (p_m_item_heap->__begin_ != v217)
                  {
                    v8 = obj;
                    do
                    {
                      v218 = [(MLItemSimilarityRecommender *)self _itemForIndex:*v216 error:a5];
                      if (!v218) {
                        goto LABEL_306;
                      }
                      objc_msgSend(v19, "insertObject:atIndex:", v218, objc_msgSend(v19, "count"));

                      v216 += 2;
                    }
                    while (v216 != v217);
                  }
                  if (self->m_item_string_list) {
                    +[MLSequence sequenceWithStringArray:v19];
                  }
                  else {
                  v219 = +[MLSequence sequenceWithInt64Array:v19];
                  }
                  v220 = +[MLFeatureValue featureValueWithSequence:v219];
                  [v8 setObject:v220 forKeyedSubscript:self->m_item_list_output_feature_name];

                  v8 = obj;
                }
                [(MLModel *)self signpostID];
                kdebug_trace();
                v9 = [[MLDictionaryFeatureProvider alloc] initWithDictionary:v8 error:a5];
                goto LABEL_311;
              }
              bzero(self->_m_item_heap.__end_, 16 * v198);
              v150 += 2 * v198;
            }
            self->_m_item_heap.__end_ = v150;
            goto LABEL_288;
          }
          if (a5)
          {
            *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Input exclusion list of items for item similarity recommender must be a sequence."];
          }
        }
        else if (a5)
        {
          *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Input restriction list of items for item similarity recommender must be a sequence."];
        }
        [(MLModel *)self signpostID];
        v9 = 0;
        kdebug_trace();
        goto LABEL_311;
      }
    }
  }
  if (a5)
  {
    *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Input items for item similarity recommender must be a dictionary or a sequence."];
  }
  [(MLModel *)self signpostID];
  kdebug_trace();
  v9 = 0;
LABEL_312:

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v234);

  return v9;
}

uint64_t __68__MLItemSimilarityRecommender_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (double)predictionFromFeatures:(uint64_t)a3 options:(char)a4 error:
{
  v9 = result;
  while (2)
  {
    v10 = v9;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          v9 = v10;
          uint64_t v11 = (char *)a2 - (char *)v10;
          unint64_t v12 = ((char *)a2 - (char *)v10) >> 4;
          if (v5 || !v4)
          {
            switch(v12)
            {
              case 0uLL:
              case 1uLL:
                return result;
              case 2uLL:
                double v44 = *(a2 - 1);
                double v45 = v10[1];
                if (v44 > v45)
                {
                  double v46 = *v10;
                  double *v10 = *(a2 - 2);
                  *(a2 - 2) = v46;
                  v10[1] = v44;
                  *(a2 - 1) = v45;
                }
                break;
              case 3uLL:
                result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *>(v10, v10 + 2, a2 - 2);
                break;
              case 4uLL:
                result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *>(v10, v10 + 2, v10 + 4, a2 - 2);
                break;
              case 5uLL:
                result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *>(v10, v10 + 2, v10 + 4, v10 + 6);
                double v47 = *(a2 - 1);
                double v48 = v10[7];
                if (v47 > v48)
                {
                  uint64_t v49 = *((void *)v10 + 6);
                  v10[6] = *(a2 - 2);
                  *((void *)a2 - 2) = v49;
                  v10[7] = v47;
                  *(a2 - 1) = v48;
                  double v50 = v10[7];
                  double v51 = v10[5];
                  if (v50 > v51)
                  {
                    uint64_t v52 = *((void *)v10 + 4);
                    uint64_t v53 = *((void *)v10 + 6);
                    *((void *)v10 + 4) = v53;
                    *((void *)v10 + 6) = v52;
                    v10[5] = v50;
                    v10[7] = v51;
                    double v54 = v10[3];
                    if (v50 > v54)
                    {
                      uint64_t v55 = *((void *)v10 + 2);
                      *((void *)v10 + 2) = v53;
                      *((void *)v10 + 4) = v55;
                      v10[3] = v50;
                      v10[5] = v54;
                      double v56 = v10[1];
                      if (v50 > v56)
                      {
                        double v57 = *v10;
                        *(void *)v10 = v53;
                        v10[2] = v57;
                        v10[1] = v50;
                        v10[3] = v56;
                      }
                    }
                  }
                }
                break;
              default:
                JUMPOUT(0);
            }
            return result;
          }
          if (v11 <= 383)
          {
            v58 = v10 + 2;
            BOOL v60 = v10 == a2 || v58 == a2;
            if (a4)
            {
              if (!v60)
              {
                uint64_t v61 = 0;
                v62 = v10;
                do
                {
                  double v63 = v62[3];
                  double v64 = v62[1];
                  v62 = v58;
                  if (v63 > v64)
                  {
                    double v65 = *v58;
                    uint64_t v66 = v61;
                    while (1)
                    {
                      v67 = (double *)((char *)v10 + v66);
                      v67[2] = *(double *)((char *)v10 + v66);
                      v67[3] = *(double *)((char *)v10 + v66 + 8);
                      if (!v66) {
                        break;
                      }
                      v66 -= 16;
                      if (v63 <= *(v67 - 1))
                      {
                        uint64_t v68 = (uint64_t)v10 + v66 + 16;
                        goto LABEL_85;
                      }
                    }
                    uint64_t v68 = (uint64_t)v10;
LABEL_85:
                    *(double *)uint64_t v68 = v65;
                    *(double *)(v68 + 8) = v63;
                  }
                  v58 = v62 + 2;
                  v61 += 16;
                }
                while (v62 + 2 != a2);
              }
            }
            else if (!v60)
            {
              uint64_t v97 = v10 + 1;
              do
              {
                double v98 = v9[3];
                double v99 = v9[1];
                v9 = v58;
                if (v98 > v99)
                {
                  double v100 = *v58;
                  uint64_t v101 = v97;
                  do
                  {
                    v101[1] = *(v101 - 1);
                    v101[2] = *v101;
                    double v102 = *(v101 - 2);
                    v101 -= 2;
                  }
                  while (v98 > v102);
                  v101[1] = v100;
                  v101[2] = v98;
                }
                v58 = v9 + 2;
                v97 += 2;
              }
              while (v9 + 2 != a2);
            }
            return result;
          }
          if (!a3)
          {
            if (v10 != a2)
            {
              int64_t v69 = (v12 - 2) >> 1;
              int64_t v70 = v69;
              do
              {
                int64_t v71 = v70;
                if (v69 >= v70)
                {
                  uint64_t v72 = (2 * v70) | 1;
                  v73 = &v10[2 * v72];
                  if (2 * v71 + 2 < (uint64_t)v12 && v73[1] > v73[3])
                  {
                    v73 += 2;
                    uint64_t v72 = 2 * v71 + 2;
                  }
                  double v74 = v73[1];
                  double v75 = v10[2 * v71 + 1];
                  if (v74 <= v75)
                  {
                    v76 = &v10[2 * v71];
                    uint64_t v77 = *(void *)v76;
                    do
                    {
                      uint64_t v78 = v76;
                      v76 = v73;
                      *uint64_t v78 = *v73;
                      v78[1] = v74;
                      if (v69 < v72) {
                        break;
                      }
                      uint64_t v79 = 2 * v72;
                      uint64_t v72 = (2 * v72) | 1;
                      v73 = &v10[2 * v72];
                      uint64_t v80 = v79 + 2;
                      if (v80 < (uint64_t)v12 && v73[1] > v73[3])
                      {
                        v73 += 2;
                        uint64_t v72 = v80;
                      }
                      double v74 = v73[1];
                    }
                    while (v74 <= v75);
                    *(void *)v76 = v77;
                    v76[1] = v75;
                  }
                }
                int64_t v70 = v71 - 1;
              }
              while (v71);
              uint64_t v81 = (unint64_t)v11 >> 4;
              do
              {
                uint64_t v82 = 0;
                double v83 = *v10;
                uint64_t v84 = *((void *)v10 + 1);
                uint64_t v85 = v10;
                do
                {
                  v86 = v85;
                  v85 += 2 * v82 + 2;
                  uint64_t v87 = 2 * v82;
                  uint64_t v82 = (2 * v82) | 1;
                  uint64_t v88 = v87 + 2;
                  if (v88 < v81 && v85[1] > v85[3])
                  {
                    v85 += 2;
                    uint64_t v82 = v88;
                  }
                  double *v86 = *v85;
                  v86[1] = v85[1];
                }
                while (v82 <= (uint64_t)((unint64_t)(v81 - 2) >> 1));
                if (v85 == a2 - 2)
                {
                  *uint64_t v85 = v83;
                  *((void *)v85 + 1) = v84;
                }
                else
                {
                  *uint64_t v85 = *(a2 - 2);
                  v85[1] = *(a2 - 1);
                  *(a2 - 2) = v83;
                  *((void *)a2 - 1) = v84;
                  uint64_t v89 = (char *)v85 - (char *)v10 + 16;
                  if (v89 >= 17)
                  {
                    unint64_t v90 = (((unint64_t)v89 >> 4) - 2) >> 1;
                    double v91 = v10[2 * v90 + 1];
                    double v92 = v85[1];
                    if (v91 > v92)
                    {
                      uint64_t v93 = *(void *)v85;
                      do
                      {
                        unint64_t v94 = v90;
                        uint64_t v95 = v85;
                        uint64_t v85 = &v10[2 * v94];
                        *uint64_t v95 = *v85;
                        v95[1] = v91;
                        if (!v94) {
                          break;
                        }
                        unint64_t v90 = (v94 - 1) >> 1;
                        double v91 = v10[2 * v90 + 1];
                      }
                      while (v91 > v92);
                      *(void *)uint64_t v85 = v93;
                      v10[2 * v94 + 1] = v92;
                    }
                  }
                }
                a2 -= 2;
              }
              while (v81-- > 2);
            }
            return result;
          }
          unint64_t v13 = v12 >> 1;
          uint64_t v14 = &v10[2 * (v12 >> 1)];
          if ((unint64_t)v11 >= 0x801)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *>(v9, &v9[2 * (v12 >> 1)], a2 - 2);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *>(v9 + 2, v14 - 2, a2 - 4);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *>(v9 + 4, &v9[2 * v13 + 2], a2 - 6);
            result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *>(v14 - 2, v14, &v9[2 * v13 + 2]);
            double v15 = *v9;
            double *v9 = *v14;
            *uint64_t v14 = v15;
            uint64_t v16 = *((void *)v9 + 1);
            v9[1] = v14[1];
            *((void *)v14 + 1) = v16;
          }
          else
          {
            result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *>(&v9[2 * (v12 >> 1)], v9, a2 - 2);
          }
          --a3;
          if (a4) {
            break;
          }
          double v17 = v9[1];
          if (*(v9 - 1) > v17) {
            goto LABEL_13;
          }
          if (v17 <= *(a2 - 1))
          {
            unint64_t v34 = v9 + 2;
            do
            {
              v10 = v34;
              if (v34 >= a2) {
                break;
              }
              double v35 = v34[1];
              v34 += 2;
            }
            while (v17 <= v35);
          }
          else
          {
            uint64_t v32 = v9;
            do
            {
              v10 = v32 + 2;
              double v33 = v32[3];
              v32 += 2;
            }
            while (v17 <= v33);
          }
          uint64_t v36 = a2;
          if (v10 < a2)
          {
            v37 = a2;
            do
            {
              uint64_t v36 = v37 - 2;
              double v38 = *(v37 - 1);
              v37 -= 2;
            }
            while (v17 > v38);
          }
          double v39 = *v9;
          while (v10 < v36)
          {
            double v40 = *v10;
            double *v10 = *v36;
            *uint64_t v36 = v40;
            uint64_t v41 = *((void *)v10 + 1);
            v10[1] = v36[1];
            *((void *)v36 + 1) = v41;
            do
            {
              double v42 = v10[3];
              v10 += 2;
            }
            while (v17 <= v42);
            do
            {
              double v43 = *(v36 - 1);
              v36 -= 2;
            }
            while (v17 > v43);
          }
          BOOL v4 = v10 - 2 >= v9;
          BOOL v5 = v10 - 2 == v9;
          if (v10 - 2 != v9)
          {
            double *v9 = *(v10 - 2);
            v9[1] = *(v10 - 1);
          }
          a4 = 0;
          *(v10 - 2) = v39;
          *(v10 - 1) = v17;
        }
        double v17 = v9[1];
LABEL_13:
        double v18 = *v9;
        v19 = v9;
        do
        {
          v20 = v19;
          v19 += 2;
        }
        while (v20[3] > v17);
        v21 = a2;
        if (v20 == v9)
        {
          v24 = a2;
          while (v19 < v24)
          {
            unint64_t v22 = v24 - 2;
            double v25 = *(v24 - 1);
            v24 -= 2;
            if (v25 > v17) {
              goto LABEL_23;
            }
          }
          unint64_t v22 = v24;
        }
        else
        {
          do
          {
            unint64_t v22 = v21 - 2;
            double v23 = *(v21 - 1);
            v21 -= 2;
          }
          while (v23 <= v17);
        }
LABEL_23:
        v10 = v19;
        if (v19 < v22)
        {
          v26 = v22;
          do
          {
            double v27 = *v10;
            double *v10 = *v26;
            double *v26 = v27;
            uint64_t v28 = *((void *)v10 + 1);
            v10[1] = v26[1];
            *((void *)v26 + 1) = v28;
            do
            {
              double v29 = v10[3];
              v10 += 2;
            }
            while (v29 > v17);
            do
            {
              double v30 = *(v26 - 1);
              v26 -= 2;
            }
            while (v30 <= v17);
          }
          while (v10 < v26);
        }
        if (v10 - 2 != v9)
        {
          double *v9 = *(v10 - 2);
          v9[1] = *(v10 - 1);
        }
        *(v10 - 2) = v18;
        *(v10 - 1) = v17;
        if (v19 >= v22) {
          break;
        }
LABEL_34:
        result = (double *)std::__introsort<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *,false>(v9, v10 - 2, a3, a4 & 1);
        a4 = 0;
      }
      BOOL v31 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *>(v9, v10 - 2);
      result = (double *)std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[MLItemSimilarityRecommender predictionFromFeatures:options:error:]::$_0 &,std::pair<unsigned long long,double> *>(v10, a2);
      if (result) {
        break;
      }
      if (!v31) {
        goto LABEL_34;
      }
    }
    a2 = v10 - 2;
    if (!v31) {
      continue;
    }
    return result;
  }
}

- (BOOL)_mapItemSequence:(id)a3 dest:(void *)a4 error:(id *)a5
{
  id v8 = a3;
  if ([v8 type] != 1 && objc_msgSend(v8, "type") != 3)
  {
    if (a5)
    {
      v10 = @"Input sequence of items for item similarity recommender must be strings or integers.";
      goto LABEL_39;
    }
    goto LABEL_40;
  }
  *((void *)a4 + 1) = *(void *)a4;
  if ([v8 type] == 1)
  {
    m_item_string_list = self->m_item_string_list;
    if (m_item_string_list && [(NSArray *)m_item_string_list count])
    {
      if (a5)
      {
        v10 = @"Input sequence of items for item similarity recommender with string item ids must be strings.";
LABEL_39:
        *a5 = +[MLModelErrorUtils genericErrorWithFormat:v10];
        goto LABEL_40;
      }
      goto LABEL_40;
    }
    uint64_t v11 = [v8 int64Values];
    std::vector<long long>::reserve((void **)a4, [v11 count]);

    m_item_integer_list = self->m_item_integer_list;
    if (m_item_integer_list && [(NSArray *)m_item_integer_list count])
    {
      for (unint64_t i = 0; ; ++i)
      {
        uint64_t v14 = [v8 int64Values];
        unint64_t v15 = [v14 count];

        if (i >= v15) {
          break;
        }
        m_item_mapping = self->m_item_mapping;
        double v17 = [v8 int64Values];
        double v18 = [v17 objectAtIndexedSubscript:i];
        v19 = [(NSDictionary *)m_item_mapping objectForKeyedSubscript:v18];

        if (v19)
        {
          uint64_t v20 = [v19 unsignedLongValue];
          uint64_t v21 = v20;
          double v23 = (uint64_t *)*((void *)a4 + 1);
          unint64_t v22 = *((void *)a4 + 2);
          if ((unint64_t)v23 >= v22)
          {
            double v25 = *(uint64_t **)a4;
            uint64_t v26 = ((uint64_t)v23 - *(void *)a4) >> 3;
            unint64_t v27 = v26 + 1;
            if ((unint64_t)(v26 + 1) >> 61) {
              std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v28 = v22 - (void)v25;
            if (v28 >> 2 > v27) {
              unint64_t v27 = v28 >> 2;
            }
            if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v29 = v27;
            }
            if (v29)
            {
              unint64_t v29 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v29);
              double v25 = *(uint64_t **)a4;
              double v23 = (uint64_t *)*((void *)a4 + 1);
            }
            else
            {
              uint64_t v30 = 0;
            }
            BOOL v31 = (uint64_t *)(v29 + 8 * v26);
            *BOOL v31 = v21;
            v24 = v31 + 1;
            while (v23 != v25)
            {
              uint64_t v32 = *--v23;
              *--BOOL v31 = v32;
            }
            *(void *)a4 = v31;
            *((void *)a4 + 1) = v24;
            *((void *)a4 + 2) = v29 + 8 * v30;
            if (v25) {
              operator delete(v25);
            }
          }
          else
          {
            *double v23 = v20;
            v24 = v23 + 1;
          }
          *((void *)a4 + 1) = v24;
        }
      }
    }
    else
    {
      for (unint64_t j = 0; ; ++j)
      {
        double v35 = [v8 int64Values];
        unint64_t v36 = [v35 count];

        if (j >= v36) {
          break;
        }
        v37 = [v8 int64Values];
        double v38 = [v37 objectAtIndexedSubscript:j];
        unint64_t v39 = [v38 unsignedLongValue];

        if (v39 < self->m_num_items)
        {
          uint64_t v41 = (unint64_t *)*((void *)a4 + 1);
          unint64_t v40 = *((void *)a4 + 2);
          if ((unint64_t)v41 >= v40)
          {
            double v43 = *(unint64_t **)a4;
            uint64_t v44 = ((uint64_t)v41 - *(void *)a4) >> 3;
            unint64_t v45 = v44 + 1;
            if ((unint64_t)(v44 + 1) >> 61) {
              std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v46 = v40 - (void)v43;
            if (v46 >> 2 > v45) {
              unint64_t v45 = v46 >> 2;
            }
            if ((unint64_t)v46 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v47 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v47 = v45;
            }
            if (v47)
            {
              unint64_t v47 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v47);
              double v43 = *(unint64_t **)a4;
              uint64_t v41 = (unint64_t *)*((void *)a4 + 1);
            }
            else
            {
              uint64_t v48 = 0;
            }
            uint64_t v49 = (unint64_t *)(v47 + 8 * v44);
            unint64_t *v49 = v39;
            double v42 = v49 + 1;
            while (v41 != v43)
            {
              unint64_t v50 = *--v41;
              *--uint64_t v49 = v50;
            }
            *(void *)a4 = v49;
            *((void *)a4 + 1) = v42;
            *((void *)a4 + 2) = v47 + 8 * v48;
            if (v43) {
              operator delete(v43);
            }
          }
          else
          {
            *uint64_t v41 = v39;
            double v42 = v41 + 1;
          }
          *((void *)a4 + 1) = v42;
        }
      }
    }
LABEL_84:
    BOOL v33 = 0;
    goto LABEL_85;
  }
  if ([v8 type] != 3)
  {
    if (a5)
    {
      v10 = @"Input sequence of items for item similarity recommender must be integers or strings.";
      goto LABEL_39;
    }
    goto LABEL_40;
  }
  if (![(NSArray *)self->m_item_integer_list count])
  {
    if (![(NSArray *)self->m_item_string_list count])
    {
      if (!a5) {
        goto LABEL_40;
      }
      v10 = @"String items require string item ids to be be set.";
      goto LABEL_39;
    }
    double v51 = [v8 stringValues];
    std::vector<long long>::reserve((void **)a4, [v51 count]);

    for (unint64_t k = 0; ; ++k)
    {
      uint64_t v53 = [v8 stringValues];
      unint64_t v54 = [v53 count];

      if (k >= v54) {
        break;
      }
      uint64_t v55 = self->m_item_mapping;
      double v56 = [v8 stringValues];
      double v57 = [v56 objectAtIndexedSubscript:k];
      v58 = [(NSDictionary *)v55 objectForKeyedSubscript:v57];

      if (v58)
      {
        uint64_t v59 = [v58 unsignedLongValue];
        uint64_t v60 = v59;
        v62 = (uint64_t *)*((void *)a4 + 1);
        unint64_t v61 = *((void *)a4 + 2);
        if ((unint64_t)v62 >= v61)
        {
          double v64 = *(uint64_t **)a4;
          uint64_t v65 = ((uint64_t)v62 - *(void *)a4) >> 3;
          unint64_t v66 = v65 + 1;
          if ((unint64_t)(v65 + 1) >> 61) {
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v67 = v61 - (void)v64;
          if (v67 >> 2 > v66) {
            unint64_t v66 = v67 >> 2;
          }
          if ((unint64_t)v67 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v68 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v68 = v66;
          }
          if (v68)
          {
            unint64_t v68 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v68);
            double v64 = *(uint64_t **)a4;
            v62 = (uint64_t *)*((void *)a4 + 1);
          }
          else
          {
            uint64_t v69 = 0;
          }
          int64_t v70 = (uint64_t *)(v68 + 8 * v65);
          uint64_t *v70 = v60;
          double v63 = v70 + 1;
          while (v62 != v64)
          {
            uint64_t v71 = *--v62;
            *--int64_t v70 = v71;
          }
          *(void *)a4 = v70;
          *((void *)a4 + 1) = v63;
          *((void *)a4 + 2) = v68 + 8 * v69;
          if (v64) {
            operator delete(v64);
          }
        }
        else
        {
          uint64_t *v62 = v59;
          double v63 = v62 + 1;
        }
        *((void *)a4 + 1) = v63;
      }
    }
    goto LABEL_84;
  }
  if (a5)
  {
    v10 = @"Input sequence of items for item similarity recommender with integer item ids must be integers.";
    goto LABEL_39;
  }
LABEL_40:
  BOOL v33 = 1;
LABEL_85:

  return v33;
}

- (id)_itemForIndex:(unint64_t)a3 error:(id *)a4
{
  uint64_t v7 = 184;
  m_item_integer_list = self->m_item_integer_list;
  if (m_item_integer_list || (uint64_t v7 = 176, (m_item_integer_list = self->m_item_string_list) != 0))
  {
    if ([(NSArray *)m_item_integer_list count] <= a3)
    {
      if (a4)
      {
        id v10 = +[MLModelErrorUtils genericErrorWithFormat:@"Internal Error: item index out of bounds."];
        v9 = 0;
        *a4 = v10;
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v9 = [*(id *)((char *)&self->super.super.isa + v7) objectAtIndexedSubscript:a3];
    }
  }
  else
  {
    v9 = [NSNumber numberWithUnsignedInteger:a3];
  }

  return v9;
}

- (const)modelData
{
  if (self->m_model_data) {
    return (const char *)[(NSData *)self->m_model_data bytes];
  }
  else {
    return self->m_cached_model.__begin_;
  }
}

+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = +[MLVersionInfo versionInfoWithMajor:1 minor:0 patch:0 variant:@"generic"];
  uint64_t v15 = [v14 majorVersion];
  if (v15 >= [v12 majorVersion])
  {
    double v18 = [(MLModel *)[MLItemSimilarityRecommender alloc] initInterfaceAndMetadataWithCompiledArchive:a3 error:a7];
    a7 = (id *)v18;
    if (!v18)
    {
LABEL_48:

      goto LABEL_49;
    }
    unint64_t v61 = v14;
    id v62 = v13;
    operator>><unsigned char>((uint64_t)a3, v18 + 10);
    if (a7[10] == a7[11])
    {
      memset(&__p, 0, sizeof(__p));
      operator>>((uint64_t)a3, &__p);
      IArchive::blob(&p_p, *(void *)a3, (uint64_t)&__p);
      v19 = (*(void (**)(void *))(*(void *)p_p + 32))(p_p);
      id v20 = a7[13];
      a7[13] = v19;

      if (v65) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v65);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    operator>>((uint64_t)a3);
    memset(&__p, 0, sizeof(__p));
    p_p = 0;
    uint64_t v65 = 0;
    uint64_t v66 = 0;
    operator>><long long>((uint64_t)a3, (char **)&p_p);
    operator>><std::string>((uint64_t)a3, (std::vector<std::string> *)&__p);
    unint64_t v22 = (std::__shared_weak_count *)p_p;
    uint64_t v21 = v65;
    unint64_t v23 = 0x1E4F29000uLL;
    if (p_p == v65 && __p.__r_.__value_.__r.__words[0] == __p.__r_.__value_.__l.__size_)
    {
LABEL_25:
      memset(&v63, 0, sizeof(v63));
      operator>>((uint64_t)a3, &v63);
      if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unint64_t v39 = &v63;
      }
      else {
        unint64_t v39 = (std::string *)v63.__r_.__value_.__r.__words[0];
      }
      unint64_t v40 = [*(id *)(v23 + 24) stringWithUTF8String:v39];
      id v41 = a7[15];
      a7[15] = v40;

      operator>>((uint64_t)a3, &v63);
      if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        double v42 = &v63;
      }
      else {
        double v42 = (std::string *)v63.__r_.__value_.__r.__words[0];
      }
      double v43 = [*(id *)(v23 + 24) stringWithUTF8String:v42];
      id v44 = a7[16];
      a7[16] = v43;

      operator>>((uint64_t)a3, &v63);
      if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unint64_t v45 = &v63;
      }
      else {
        unint64_t v45 = (std::string *)v63.__r_.__value_.__r.__words[0];
      }
      uint64_t v46 = [*(id *)(v23 + 24) stringWithUTF8String:v45];
      id v47 = a7[17];
      a7[17] = v46;

      operator>>((uint64_t)a3, &v63);
      if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v48 = &v63;
      }
      else {
        uint64_t v48 = (std::string *)v63.__r_.__value_.__r.__words[0];
      }
      uint64_t v49 = [*(id *)(v23 + 24) stringWithUTF8String:v48];
      id v50 = a7[18];
      a7[18] = v49;

      operator>>((uint64_t)a3, &v63);
      if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        double v51 = &v63;
      }
      else {
        double v51 = (std::string *)v63.__r_.__value_.__r.__words[0];
      }
      uint64_t v52 = [*(id *)(v23 + 24) stringWithUTF8String:v51];
      id v53 = a7[19];
      a7[19] = v52;

      operator>>((uint64_t)a3, &v63);
      if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unint64_t v54 = &v63;
      }
      else {
        unint64_t v54 = (std::string *)v63.__r_.__value_.__r.__words[0];
      }
      uint64_t v55 = [*(id *)(v23 + 24) stringWithUTF8String:v54];
      id v56 = a7[20];
      a7[20] = v55;

      double v57 = a7;
      uint64_t v14 = v61;
      id v13 = v62;
      if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v63.__r_.__value_.__l.__data_);
      }
      if (p_p) {
        operator delete(p_p);
      }
      p_p = &__p;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p);
      goto LABEL_48;
    }
    id v24 = a7[14];
    double v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v24];
    if (v22 == v21)
    {
      if (__p.__r_.__value_.__r.__words[0] == __p.__r_.__value_.__l.__size_)
      {
LABEL_24:
        id v38 = a7[21];
        a7[21] = v25;

        goto LABEL_25;
      }
      id v59 = v12;
      id v60 = v11;
      uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v24];
      if (__p.__r_.__value_.__l.__size_ != __p.__r_.__value_.__r.__words[0])
      {
        uint64_t v33 = 0;
        unint64_t v34 = 0;
        do
        {
          unint64_t v35 = v23;
          unint64_t v36 = objc_msgSend(*(id *)(v23 + 24), "stringWithUTF8String:");
          [v32 addObject:v36];
          v37 = [NSNumber numberWithUnsignedLong:v34];
          [v25 setObject:v37 forKey:v36];

          ++v34;
          v33 += 24;
          unint64_t v23 = v35;
        }
        while (v34 < 0xAAAAAAAAAAAAAAABLL
                    * ((uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3));
      }
      id v31 = a7[22];
      a7[22] = v32;
    }
    else
    {
      id v59 = v12;
      id v60 = v11;
      uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v24];
      uint64_t v27 = 0;
      if ((unint64_t)(((char *)v21 - (char *)v22) >> 3) <= 1) {
        uint64_t v28 = 1;
      }
      else {
        uint64_t v28 = ((char *)v21 - (char *)v22) >> 3;
      }
      do
      {
        unint64_t v29 = [NSNumber numberWithLongLong:*((void *)&v22->__vftable + v27)];
        [v26 addObject:v29];
        uint64_t v30 = [NSNumber numberWithUnsignedLong:v27];
        [v25 setObject:v30 forKey:v29];

        ++v27;
      }
      while (v28 != v27);
      id v31 = a7[23];
      a7[23] = v26;
      unint64_t v23 = 0x1E4F29000;
    }

    id v12 = v59;
    id v11 = v60;
    goto LABEL_24;
  }
  if (a7)
  {
    uint64_t v16 = [v12 versionNumberString];
    double v17 = [v14 versionNumberString];
    *a7 = +[MLModelErrorUtils genericErrorWithFormat:@"compiler major version for compiled model is %@ and is more recent than this framework major version %@.", v16, v17];

    a7 = 0;
  }
LABEL_49:

  return a7;
}

+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5
{
  BOOL v5 = +[MLVersionInfo versionInfoWithMajor:1 minor:0 patch:0 variant:@"generic"];

  return v5;
}

+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v42 = a5;
  id v44 = (void **)a4;
  +[MLModel serializeInterfaceAndMetadata:a3 toArchive:a4 error:a6];
  v9 = objc_opt_new();
  uint64_t v10 = +[MLItemSimilarityRecommender loadModelFromSpecification:a3 configuration:v9 error:a6];

  double v43 = (id *)v10;
  if (!v10)
  {
    id v12 = 0;
    goto LABEL_78;
  }
  memset(&__p, 0, 24);
  operator<<<unsigned char>((uint64_t)v44, (uint64_t *)&__p);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)&unk_19EC86ACE);
  OArchive::uniqueBlob(&v59, v44[1], (const void **)&__p.__first_);
  if (SHIBYTE(__p.__end_) < 0) {
    operator delete(__p.__first_);
  }
  uint64_t v11 = v59;
  operator<<((uint64_t)v44, (uint64_t *)(v59 + 576));
  if (!((*(void *)(v10 + 88) - *(void *)(v10 + 80)) >> 31))
  {
    if (!*(unsigned char *)v11 && !*(void *)(v11 + 624)) {
      Archiver::_ODataBlobImpl::_openAsStream(v11);
    }
    std::ostream::write();
    operator<<((uint64_t)v44, *(void *)(v10 + 112));
    memset(&v58, 0, sizeof(v58));
    uint64_t v55 = 0;
    id v56 = 0;
    unint64_t v57 = 0;
    if ([*(id *)(v10 + 184) count])
    {
      std::vector<long long>::reserve(&v55, *(void *)(v10 + 112));
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v13 = *(id *)(v10 + 184);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v63 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v52;
        unint64_t v16 = v57;
        double v17 = (uint64_t *)v55;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v52 != v15) {
              objc_enumerationMutation(v13);
            }
            uint64_t v19 = [*(id *)(*((void *)&v51 + 1) + 8 * i) longValue];
            uint64_t v20 = v19;
            uint64_t v21 = v56;
            if ((unint64_t)v56 >= v16)
            {
              uint64_t v23 = v56 - v17;
              unint64_t v24 = v23 + 1;
              if ((unint64_t)(v23 + 1) >> 61)
              {
                uint64_t v55 = v17;
                std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
              }
              if ((uint64_t)(v16 - (void)v17) >> 2 > v24) {
                unint64_t v24 = (uint64_t)(v16 - (void)v17) >> 2;
              }
              if (v16 - (unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v25 = v24;
              }
              if (v25) {
                unint64_t v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v25);
              }
              else {
                uint64_t v26 = 0;
              }
              uint64_t v27 = (uint64_t *)(v25 + 8 * v23);
              *uint64_t v27 = v20;
              unint64_t v22 = v27 + 1;
              while (v21 != v17)
              {
                uint64_t v28 = *--v21;
                *--uint64_t v27 = v28;
              }
              unint64_t v16 = v25 + 8 * v26;
              id v56 = v22;
              if (v17) {
                operator delete(v17);
              }
              double v17 = v27;
            }
            else
            {
              *id v56 = v19;
              unint64_t v22 = v21 + 1;
            }
            id v56 = v22;
          }
          unint64_t v57 = v16;
          uint64_t v55 = v17;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v63 count:16];
        }
        while (v14);
      }
    }
    else
    {
      if (![*(id *)(v10 + 176) count])
      {
LABEL_61:
        operator<<<long long>((uint64_t)v44, (uint64_t *)&v55);
        operator<<<std::string>((uint64_t)v44, (uint64_t *)&v58);
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v43[15] UTF8String]);
        operator<<((uint64_t)v44, (uint64_t *)&__p);
        if (SHIBYTE(__p.__end_) < 0) {
          operator delete(__p.__first_);
        }
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v43[16] UTF8String]);
        operator<<((uint64_t)v44, (uint64_t *)&__p);
        if (SHIBYTE(__p.__end_) < 0) {
          operator delete(__p.__first_);
        }
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v43[17] UTF8String]);
        operator<<((uint64_t)v44, (uint64_t *)&__p);
        if (SHIBYTE(__p.__end_) < 0) {
          operator delete(__p.__first_);
        }
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v43[18] UTF8String]);
        operator<<((uint64_t)v44, (uint64_t *)&__p);
        if (SHIBYTE(__p.__end_) < 0) {
          operator delete(__p.__first_);
        }
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v43[19] UTF8String]);
        operator<<((uint64_t)v44, (uint64_t *)&__p);
        if (SHIBYTE(__p.__end_) < 0) {
          operator delete(__p.__first_);
        }
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v43[20] UTF8String]);
        operator<<((uint64_t)v44, (uint64_t *)&__p);
        if (SHIBYTE(__p.__end_) < 0) {
          operator delete(__p.__first_);
        }
        id v12 = +[MLCompilerResult resultWithArchive:v44];
        if (v55) {
          operator delete(v55);
        }
        __p.__first_ = (std::__split_buffer<std::string>::pointer)&v58;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
        goto LABEL_76;
      }
      std::vector<std::string>::reserve(&v58, *(void *)(v10 + 112));
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v13 = *(id *)(v10 + 176);
      uint64_t v29 = [v13 countByEnumeratingWithState:&v47 objects:v62 count:16];
      if (v29)
      {
        uint64_t v30 = *(void *)v48;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v48 != v30) {
              objc_enumerationMutation(v13);
            }
            std::string::basic_string[abi:ne180100]<0>(v45, (char *)[*(id *)(*((void *)&v47 + 1) + 8 * j) UTF8String]);
            std::vector<std::string>::pointer end = v58.__end_;
            if (v58.__end_ >= v58.__end_cap_.__value_)
            {
              unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * (((char *)v58.__end_ - (char *)v58.__begin_) >> 3);
              unint64_t v35 = v34 + 1;
              if (v34 + 1 > 0xAAAAAAAAAAAAAAALL) {
                std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
              }
              if (0x5555555555555556 * (((char *)v58.__end_cap_.__value_ - (char *)v58.__begin_) >> 3) > v35) {
                unint64_t v35 = 0x5555555555555556 * (((char *)v58.__end_cap_.__value_ - (char *)v58.__begin_) >> 3);
              }
              if (0xAAAAAAAAAAAAAAABLL * (((char *)v58.__end_cap_.__value_ - (char *)v58.__begin_) >> 3) >= 0x555555555555555) {
                unint64_t v36 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v36 = v35;
              }
              __p.__end_cap_.__value_ = (std::allocator<std::string> *)&v58.__end_cap_;
              if (v36) {
                v37 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v58.__end_cap_, v36);
              }
              else {
                v37 = 0;
              }
              id v38 = v37 + v34;
              __p.__first_ = v37;
              __p.__begin_ = v38;
              __p.__end_cap_.__value_ = &v37[v36];
              long long v39 = *(_OWORD *)v45;
              v38->__r_.__value_.__r.__words[2] = v46;
              *(_OWORD *)&v38->__r_.__value_.__l.__data_ = v39;
              v45[1] = 0;
              std::string::size_type v46 = 0;
              v45[0] = 0;
              __p.__end_ = v38 + 1;
              std::vector<std::string>::__swap_out_circular_buffer(&v58, &__p);
              unint64_t v40 = v58.__end_;
              std::__split_buffer<std::string>::~__split_buffer(&__p);
              v58.__end_ = v40;
              if (SHIBYTE(v46) < 0) {
                operator delete(v45[0]);
              }
            }
            else
            {
              long long v33 = *(_OWORD *)v45;
              v58.__end_->__r_.__value_.__r.__words[2] = v46;
              *(_OWORD *)&end->__r_.__value_.__l.__data_ = v33;
              v58.__end_ = end + 1;
            }
          }
          uint64_t v29 = [v13 countByEnumeratingWithState:&v47 objects:v62 count:16];
        }
        while (v29);
      }
    }

    goto LABEL_61;
  }
  if (a6)
  {
    +[MLModelErrorUtils genericErrorWithFormat:@"Internal error: model too large to be compiled."];
    id v12 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }
LABEL_76:
  if (v60) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v60);
  }
LABEL_78:

  return v12;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  BOOL v5 = +[MLItemSimilarityRecommender loadModelFromSpecificationWithCompilationOptions:a3 options:MEMORY[0x1E4F1CC08] error:a5];

  return v5;
}

+ (id)loadModelFromSpecificationWithCompilationOptions:(void *)a3 options:(id)a4 error:(id *)a5
{
  v148[2] = *MEMORY[0x1E4F143B8];
  id v120 = a4;
  if (*(_DWORD *)(*(void *)a3 + 44) == 501)
  {
    uint64_t v119 = a5;
    uint64_t v7 = [MLItemSimilarityRecommender alloc];
    id v8 = objc_alloc_init(MLModelConfiguration);
    id v9 = [(MLModel *)v7 initDescriptionOnlyWithSpecification:a3 configuration:v8 error:v119];

    if (!v9)
    {
      uint64_t v72 = 0;
LABEL_142:

      goto LABEL_143;
    }
    unint64_t v121 = v9;
    CoreML::Recommender::constructAndValidateItemSimilarityRecommenderFromSpec((CoreML::Recommender *)&v133, *(const CoreML::Specification::Model **)a3);
    v132[0] = 0;
    v132[1] = 0;
    v131 = (uint64_t *)v132;
    long long v127 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    long long v130 = 0u;
    id v10 = v120;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v127 objects:v137 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v128;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v128 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void **)(*((void *)&v127 + 1) + 8 * i);
          id v15 = [v10 objectForKeyedSubscript:v14];
          uint64_t v16 = [v15 UTF8String];
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v14 UTF8String]);
          __src = &__p;
          double v17 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v131, &__p, (_OWORD **)&__src);
          MEMORY[0x19F3C1430]((char *)v17 + 56, v16);
          if (SHIBYTE(v139[1]) < 0) {
            operator delete(__p);
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v127 objects:v137 count:16];
      }
      while (v11);
    }

    uint64_t v19 = (void *)v133;
    double v18 = v134;
    if (v134) {
      atomic_fetch_add_explicit(&v134->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v141[0] = 0;
    v141[1] = 0;
    memset(v139, 0, sizeof(v139));
    v140 = (CoreML::Archiver::MMappedContentManager *)v141;
    LODWORD(__p) = 0;
    HIDWORD(v139[1]) = 64;
    v144[1] = 0;
    memset(v142, 0, sizeof(v142));
    uint64_t v143 = (CoreML::Archiver::MMappedContentManager *)v144;
    v144[0] = 0;
    v142[1] = 64;
    v148[1] = 0;
    *(_OWORD *)uint64_t v145 = 0u;
    *(_OWORD *)unint64_t v146 = 0u;
    v148[0] = 0;
    uint64_t v147 = (CoreML::Archiver::MMappedContentManager *)v148;
    uint64_t v20 = v136;
    v136[0] = 0;
    v136[1] = 0;
    __src = (void **)v136;
    uint64_t v21 = (std::__shared_weak_count *)operator new(0x110uLL);
    v21->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF0DD618;
    v21->__shared_owners_ = 0;
    v21[1].__shared_owners_ = 0;
    v21->__shared_weak_owners_ = 0;
    v21[1].__vftable = (std::__shared_weak_count_vtbl *)&v21[1].__shared_owners_;
    v21[2].__shared_weak_owners_ = 0;
    v21[2].__shared_owners_ = 0;
    v21[1].__shared_weak_owners_ = 0;
    v21[2].__vftable = (std::__shared_weak_count_vtbl *)&v21[2].__shared_owners_;
    *(_OWORD *)&v21[3].__shared_owners_ = 0u;
    v21[4].std::__shared_count = 0u;
    *(_OWORD *)&v21[4].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v21[5].__shared_owners_ = 0u;
    v21[6].std::__shared_count = 0u;
    *(_OWORD *)&v21[6].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v21[7].__shared_owners_ = 0u;
    v21[8].std::__shared_count = 0u;
    *(_OWORD *)&v21[8].__shared_weak_owners_ = 0u;
    *(_OWORD *)&v21[9].__shared_owners_ = 0u;
    v21[10].std::__shared_count = 0u;
    *(_OWORD *)&v21[10].__shared_weak_owners_ = 0u;
    uint64_t v23 = v19 + 1;
    unint64_t v22 = (void *)*v19;
    if ((void *)*v19 != v19 + 1)
    {
      do
      {
        std::__tree<unsigned long long>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t *)&__src, v22[4], v22[4]);
        unint64_t v24 = (unint64_t *)v22[5];
        unint64_t v25 = (unint64_t *)v22[6];
        while (v24 != v25)
        {
          std::__tree<unsigned long long>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t *)&__src, *v24, *v24);
          v24 += 2;
        }
        uint64_t v26 = (void *)v22[1];
        if (v26)
        {
          do
          {
            uint64_t v27 = v26;
            uint64_t v26 = (void *)*v26;
          }
          while (v26);
        }
        else
        {
          do
          {
            uint64_t v27 = (void *)v22[2];
            BOOL v28 = *v27 == (void)v22;
            unint64_t v22 = v27;
          }
          while (!v28);
        }
        unint64_t v22 = v27;
      }
      while (v27 != v23);
    }
    uint64_t v29 = (void *)v19[3];
    if (v29 != v19 + 4)
    {
      do
      {
        std::__tree<unsigned long long>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t *)&__src, v29[4], v29[4]);
        uint64_t v30 = (void *)v29[1];
        if (v30)
        {
          do
          {
            id v31 = v30;
            uint64_t v30 = (void *)*v30;
          }
          while (v30);
        }
        else
        {
          do
          {
            id v31 = (void *)v29[2];
            BOOL v28 = *v31 == (void)v29;
            uint64_t v29 = v31;
          }
          while (!v28);
        }
        uint64_t v29 = v31;
      }
      while (v31 != v19 + 4);
    }
    uint64_t v32 = v136[0];
    if (v136[0])
    {
      do
      {
        long long v33 = v32;
        uint64_t v32 = (void *)v32[1];
      }
      while (v32);
    }
    else
    {
      do
      {
        long long v33 = v20[2];
        BOOL v28 = *v33 == (void)v20;
        uint64_t v20 = (void **)v33;
      }
      while (v28);
    }
    unint64_t v116 = v19 + 4;
    unint64_t v117 = v19;
    uint64_t v118 = v18;
    v139[0] = v33[4] + 1;
    unint64_t v34 = (void *)*v19;
    if ((void *)*v19 != v23)
    {
      unint64_t v122 = v19 + 1;
      uint64_t v123 = 0;
      unint64_t v35 = 0;
      unint64_t v36 = 0;
      uint64_t v37 = 0;
      while (1)
      {
        if (v34[4] <= (unint64_t)(v37 + 1)) {
          uint64_t v38 = v37 + 1;
        }
        else {
          uint64_t v38 = v34[4];
        }
        uint64_t v39 = v38 - v37;
        do
        {
          CoreML::Archiver::PackedIntegerVector::push_back((CoreML::Archiver::PackedIntegerVector *)&v139[1], v145[0]);
          --v39;
        }
        while (v39);
        uint64_t v124 = v38;
        unint64_t v40 = (char *)v34[5];
        id v41 = (char *)v34[6];
        unint64_t v42 = (v41 - v40) >> 4;
        uint64_t v43 = (uint64_t)v123;
        if (v42 <= (v123 - (char *)v36) >> 4)
        {
          unint64_t v50 = (uint64_t)(v35 - (void)v36) >> 4;
          if (v50 < v42)
          {
            long long v51 = &v40[16 * v50];
            if ((void *)v35 != v36)
            {
              long long v52 = v36;
              do
              {
                *long long v52 = *(void *)v40;
                v52[1] = *((void *)v40 + 1);
                v40 += 16;
                v52 += 2;
              }
              while (v40 != v51);
            }
            long long v53 = (_OWORD *)v35;
            while (v51 != v41)
            {
              long long v54 = *(_OWORD *)v51;
              v51 += 16;
              *v53++ = v54;
            }
            int64_t v55 = (int64_t)v53 - v35;
            goto LABEL_66;
          }
          for (uint64_t j = (char *)v36; v40 != v41; v40 += 16)
          {
            *(void *)uint64_t j = *(void *)v40;
            *((void *)j + 1) = *((void *)v40 + 1);
            j += 16;
          }
        }
        else
        {
          if (v36)
          {
            operator delete(v36);
            uint64_t v43 = 0;
          }
          if (v41 - v40 < 0) {
            goto LABEL_146;
          }
          uint64_t v44 = v43 >> 3;
          if (v43 >> 3 <= v42) {
            uint64_t v44 = (v41 - v40) >> 4;
          }
          unint64_t v45 = (unint64_t)v43 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v44;
          if (v45 >> 60) {
LABEL_146:
          }
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          std::string::size_type v46 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v45);
          unint64_t v36 = v46;
          for (uint64_t j = v46; v40 != v41; j += 16)
          {
            long long v49 = *(_OWORD *)v40;
            v40 += 16;
            *(_OWORD *)uint64_t j = v49;
          }
          uint64_t v123 = &v46[16 * v47];
        }
        int64_t v55 = j - (char *)v36;
        unint64_t v35 = (unint64_t)v36;
LABEL_66:
        v35 += v55;
        unint64_t v56 = 126 - 2 * __clz((uint64_t)(v35 - (void)v36) >> 4);
        if ((void *)v35 == v36) {
          uint64_t v57 = 0;
        }
        else {
          uint64_t v57 = v56;
        }
        std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<unsigned long long,double> *,false>(v36, v35, v57, 1);
        if ((void *)v35 != v36)
        {
          unint64_t v58 = 0;
          uint64_t v59 = 0;
          char v60 = 1;
          unint64_t v61 = (uint64_t)(v35 - (void)v36) >> 4;
          do
          {
            id v62 = &v36[2 * v58];
            uint64_t v65 = *v62;
            std::string v63 = (double *)(v62 + 2);
            uint64_t v64 = v65;
            if (v61 <= v58 + 1) {
              unint64_t v61 = v58 + 1;
            }
            double v66 = 0.0;
            while (1)
            {
              double v66 = v66 + *(v63 - 1);
              if (v61 - 1 == v58) {
                break;
              }
              ++v58;
              double v67 = *v63;
              v63 += 2;
              if (*(void *)&v67 != v64) {
                goto LABEL_78;
              }
            }
            unint64_t v58 = v61;
LABEL_78:
            if (v66 == 0.0)
            {
              unint64_t v61 = (uint64_t)(v35 - (void)v36) >> 4;
            }
            else
            {
              if (v60) {
                uint64_t v68 = 0;
              }
              else {
                uint64_t v68 = ~v59;
              }
              CoreML::Archiver::PackedIntegerVector::push_back((CoreML::Archiver::PackedIntegerVector *)v142, v64 + v68);
              uint64_t v69 = CoreML::Archiver::MMappedContentManager::extend_data_block<double>((uint64_t)&v147, (uint64_t *)v145, (void **)&v145[1], 1);
              char v60 = 0;
              *(double *)(v145[1] + 8 * v69) = v66;
              unint64_t v61 = (uint64_t)(v35 - (void)v36) >> 4;
              uint64_t v59 = v64;
            }
          }
          while (v58 < v61);
        }
        int64_t v70 = (void *)v34[1];
        if (v70)
        {
          do
          {
            uint64_t v71 = v70;
            int64_t v70 = (void *)*v70;
          }
          while (v70);
        }
        else
        {
          do
          {
            uint64_t v71 = (void *)v34[2];
            BOOL v28 = *v71 == (void)v34;
            unint64_t v34 = v71;
          }
          while (!v28);
        }
        unint64_t v34 = v71;
        uint64_t v37 = v124;
        if (v71 == v122) {
          goto LABEL_97;
        }
      }
    }
    unint64_t v36 = 0;
LABEL_97:
    CoreML::Archiver::PackedIntegerVector::push_back((CoreML::Archiver::PackedIntegerVector *)&v139[1], v145[0]);
    if (v117[5])
    {
      CoreML::Archiver::MMappedContentManager::extend_data_block<double>((uint64_t)&v147, (uint64_t *)v146, &v146[1], v139[0]);
      v73 = v146[1];
      if (v139[0] >= 1) {
        bzero(v146[1], 8 * (v139[0] - ((v139[0] & 0x1FFFFFFFFFFFFFFFLL) != 0)) + 8);
      }
      double v74 = (void *)v117[3];
      if (v74 != v116)
      {
        do
        {
          v73[v74[4]] = v74[5];
          double v75 = (void *)v74[1];
          if (v75)
          {
            do
            {
              v76 = v75;
              double v75 = (void *)*v75;
            }
            while (v75);
          }
          else
          {
            do
            {
              v76 = (void *)v74[2];
              BOOL v28 = *v76 == (void)v74;
              double v74 = v76;
            }
            while (!v28);
          }
          double v74 = v76;
        }
        while (v76 != v116);
      }
    }
    if (v36) {
      operator delete(v36);
    }
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
    std::__tree<std::__value_type<CoreML::TreeEnsembleBase::BranchMode,unsigned long>,std::__map_value_compare<CoreML::TreeEnsembleBase::BranchMode,std::__value_type<CoreML::TreeEnsembleBase::BranchMode,unsigned long>,std::less<CoreML::TreeEnsembleBase::BranchMode>,true>,std::allocator<std::__value_type<CoreML::TreeEnsembleBase::BranchMode,unsigned long>>>::destroy(v136[0]);
    __dst[1] = 0;
    uint64_t v126 = 0;
    __dst[0] = 0;
    std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>((uint64_t)__dst, 0, (char *)&__p, (char *)&__p + 4, 4);
    std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>((uint64_t)__dst, (char *)__dst[1], (char *)v139, (char *)&v139[1], 8);
    CoreML::Archiver::PackedIntegerVector::export_to_image((char *)&v139[1], (char **)__dst, 1);
    CoreML::Archiver::PackedIntegerVector::export_to_image((char *)v142, (char **)__dst, 1);
    uint64_t v77 = (char *)v145[1];
    __src = (void **)v145[0];
    std::vector<unsigned char>::reserve((unint64_t *)__dst, (char *)__dst[1] + v145[0] - (char *)__dst[0] + 8);
    std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>((uint64_t)__dst, (char *)__dst[1], (char *)&__src, (char *)v136, 8);
    std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>((uint64_t)__dst, (char *)__dst[1], v77, &v77[8 * (void)__src], 8 * (void)__src);
    uint64_t v78 = (char *)v146[1];
    __src = (void **)v146[0];
    std::vector<unsigned char>::reserve((unint64_t *)__dst, (char *)v146[0] + (unint64_t)__dst[1] - (char *)__dst[0] + 8);
    std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>((uint64_t)__dst, (char *)__dst[1], (char *)&__src, (char *)v136, 8);
    std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char *,unsigned char *>((uint64_t)__dst, (char *)__dst[1], v78, &v78[8 * (void)__src], 8 * (void)__src);
    CoreML::Archiver::MMappedContentManager::~MMappedContentManager(&v147);
    CoreML::Archiver::MMappedContentManager::~MMappedContentManager(&v143);
    CoreML::Archiver::MMappedContentManager::~MMappedContentManager(&v140);
    uint64_t v79 = v121 + 10;
    uint64_t v80 = (void *)v121[10];
    if (v80)
    {
      v121[11] = v80;
      operator delete(v80);
      *uint64_t v79 = 0;
      v121[11] = 0;
      v121[12] = 0;
    }
    *(_OWORD *)uint64_t v79 = *(_OWORD *)__dst;
    v121[12] = v126;
    __dst[0] = 0;
    __dst[1] = 0;
    uint64_t v126 = 0;
    if (v118) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v118);
    }
    uint64_t v81 = v133;
    v121[14] = *(void *)(v133 + 48);
    if (*(void *)(v81 + 200) == *(void *)(v81 + 208) && *(void *)(v81 + 224) == *(void *)(v81 + 232))
    {
LABEL_127:
      uint64_t v96 = (void *)(v81 + 128);
      if (*(char *)(v81 + 151) < 0) {
        uint64_t v96 = (void *)*v96;
      }
      uint64_t v97 = [NSString stringWithUTF8String:v96];
      double v98 = (void *)v121[15];
      v121[15] = v97;

      double v99 = (char *)v133;
      double v100 = (void *)(v133 + 80);
      if (*(char *)(v133 + 103) < 0) {
        double v100 = (void *)*v100;
      }
      uint64_t v101 = [NSString stringWithUTF8String:v100];
      double v102 = (void *)v121[16];
      v121[16] = v101;

      BOOL v103 = v99 + 56;
      if (v99[79] < 0) {
        BOOL v103 = (void *)*v103;
      }
      uint64_t v104 = [NSString stringWithUTF8String:v103];
      uint64_t v105 = (void *)v121[17];
      v121[17] = v104;

      v106 = v99 + 104;
      if (v99[127] < 0) {
        v106 = (void *)*v106;
      }
      uint64_t v107 = [NSString stringWithUTF8String:v106];
      long long v108 = (void *)v121[18];
      v121[18] = v107;

      uint64_t v109 = v99 + 152;
      if (v99[175] < 0) {
        uint64_t v109 = (void *)*v109;
      }
      uint64_t v110 = [NSString stringWithUTF8String:v109];
      uint64_t v111 = (void *)v121[19];
      v121[19] = v110;

      unint64_t v112 = v99 + 176;
      if (v99[199] < 0) {
        unint64_t v112 = (void *)*v112;
      }
      uint64_t v113 = [NSString stringWithUTF8String:v112];
      unint64_t v114 = (void *)v121[20];
      v121[20] = v113;

      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v132[0]);
      if (v134) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v134);
      }
      id v9 = v121;
      uint64_t v72 = v121;
      goto LABEL_142;
    }
    uint64_t v82 = *(void *)(v81 + 48);
    double v83 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v82];
    if (*(void *)(v81 + 200) == *(void *)(v81 + 208))
    {
      if (*(void *)(v81 + 224) == *(void *)(v81 + 232))
      {
LABEL_126:
        uint64_t v95 = (void *)v121[21];
        v121[21] = v83;

        goto LABEL_127;
      }
      uint64_t v84 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v82];
      if (*(void *)(v81 + 232) != *(void *)(v81 + 224))
      {
        uint64_t v90 = 0;
        unint64_t v91 = 0;
        do
        {
          double v92 = objc_msgSend(NSString, "stringWithUTF8String:");
          [v84 addObject:v92];
          uint64_t v93 = [NSNumber numberWithUnsignedLong:v91];
          [v83 setObject:v93 forKey:v92];

          ++v91;
          uint64_t v81 = v133;
          v90 += 24;
        }
        while (v91 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v133 + 232) - *(void *)(v133 + 224)) >> 3));
      }
      uint64_t v89 = 22;
    }
    else
    {
      uint64_t v84 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v82];
      uint64_t v85 = *(void *)(v81 + 200);
      if (*(void *)(v81 + 208) != v85)
      {
        unint64_t v86 = 0;
        do
        {
          uint64_t v87 = [NSNumber numberWithLongLong:*(void *)(v85 + 8 * v86)];
          [v84 addObject:v87];
          uint64_t v88 = [NSNumber numberWithUnsignedLong:v86];
          [v83 setObject:v88 forKey:v87];

          ++v86;
          uint64_t v85 = *(void *)(v81 + 200);
        }
        while (v86 < (*(void *)(v81 + 208) - v85) >> 3);
      }
      uint64_t v89 = 23;
    }
    unint64_t v94 = (void *)v121[v89];
    v121[v89] = v84;

    goto LABEL_126;
  }
  if (a5)
  {
    +[MLModelErrorUtils IOErrorWithFormat:@"Interface type is not an ItemSimilarityRecommender"];
    uint64_t v72 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v72 = 0;
  }
LABEL_143:

  return v72;
}

@end