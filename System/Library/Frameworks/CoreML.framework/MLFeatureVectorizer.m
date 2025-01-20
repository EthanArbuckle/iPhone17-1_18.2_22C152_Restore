@interface MLFeatureVectorizer
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (MLFeatureVectorizer)initWith:(id)a3 dimensionEncoding:(id)a4 dataTransformerName:(id)a5 inputDescription:(id)a6 outputDescription:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9 configuration:(id)a10;
- (NSArray)columnNameEncoding;
- (NSArray)dimensionEncoding;
- (id).cxx_construct;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)vectorizeOneHotEncoderDict:(id)a3 index:(unint64_t)a4 error:(id *)a5;
- (unint64_t)predictionTypeForKTrace;
@end

@implementation MLFeatureVectorizer

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 5) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimensionEncoding, 0);
  objc_storeStrong((id *)&self->_columnNameEncoding, 0);
  begin = self->index_mapping.__begin_;
  if (begin)
  {
    self->index_mapping.__end_ = begin;
    operator delete(begin);
  }

  objc_storeStrong((id *)&self->_output_array_shape, 0);
}

- (NSArray)dimensionEncoding
{
  return self->_dimensionEncoding;
}

- (NSArray)columnNameEncoding
{
  return self->_columnNameEncoding;
}

- (id)vectorizeOneHotEncoderDict:(id)a3 index:(unint64_t)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  v7 = objc_opt_new();
  for (unint64_t i = 0; ; ++i)
  {
    v9 = -[NSArray objectAtIndexedSubscript:](self->_dimensionEncoding, "objectAtIndexedSubscript:", a4, v23);
    unint64_t v10 = [v9 unsignedIntegerValue];

    if (i >= v10) {
      break;
    }
    [v7 setObject:&unk_1EF11A6D0 atIndexedSubscript:i];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v23;
  uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v25 = *(void *)v28;
LABEL_6:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v28 != v25) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v27 + 1) + 8 * v12);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      unint64_t v14 = [v13 unsignedIntegerValue];
      v15 = [(NSArray *)self->_dimensionEncoding objectAtIndexedSubscript:a4];
      BOOL v16 = v14 < [v15 unsignedIntegerValue];

      if (!v16)
      {
        if (a5)
        {
          v21 = @"MLFeatureVectorizer: Dict idx out of range.";
LABEL_21:
          *a5 = +[MLModelErrorUtils genericErrorWithFormat:v21];
        }
        goto LABEL_22;
      }
      v17 = [obj objectForKeyedSubscript:v13];
      if (v17)
      {
        objc_msgSend(v7, "replaceObjectAtIndex:withObject:", objc_msgSend(v13, "unsignedIntegerValue"), v17);
      }
      else
      {
        uint64_t v18 = [v13 unsignedIntegerValue];
        v19 = [MEMORY[0x1E4F1CA98] null];
        [v7 replaceObjectAtIndex:v18 withObject:v19];
      }
      if (v11 == ++v12)
      {
        uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v11) {
          goto LABEL_6;
        }
        goto LABEL_16;
      }
    }
    if (a5)
    {
      v21 = @"MLFeatureVectorizer: Dict key type must be NSNumber.";
      goto LABEL_21;
    }
LABEL_22:

    id v20 = 0;
    goto LABEL_23;
  }
LABEL_16:

  id v20 = v7;
LABEL_23:

  return v20;
}

- (unint64_t)predictionTypeForKTrace
{
  return 17;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v42 = a4;
  unint64_t v7 = [(MLFeatureVectorizer *)self predictionTypeForKTrace];
  unint64_t v8 = [(MLModelEngine *)self signpostID];
  uint64_t v9 = [v42 parentSignpostID];
  v48 = self;
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__MLFeatureVectorizer_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_56_e5_v8__0l;
  aBlock[4] = v7;
  aBlock[5] = v8;
  aBlock[6] = v9;
  v43 = (void (**)(void))_Block_copy(aBlock);
  unint64_t v10 = [[MLMultiArray alloc] initWithShape:self->_output_array_shape dataType:65600 error:a5];
  if (v10)
  {
    v40 = v10;
    v41 = v10;
    uint64_t v44 = [(MLMultiArray *)v41 mutableBytes];
    uint64_t v11 = self;
    p_index_mapping = &self->index_mapping;
    begin = (char *)self->index_mapping.__begin_;
    if (self->index_mapping.__end_ == begin) {
      goto LABEL_25;
    }
    unint64_t v13 = 0;
    while (1)
    {
      unint64_t v14 = &begin[16 * v13];
      uint64_t v15 = *(void *)v14;
      uint64_t v16 = *((void *)v14 + 1);
      v17 = [(NSArray *)v11->_columnNameEncoding objectAtIndexedSubscript:v13];
      uint64_t v18 = [v47 featureValueForName:v17];

      if (!v18) {
        break;
      }
      v19 = (double *)(v44 + 8 * v15);
      switch([v18 type])
      {
        case 0:
        case 3:
        case 4:
        case 7:
        case 8:
          if (!a5) {
            goto LABEL_41;
          }
          +[MLModelErrorUtils genericErrorWithFormat:@"MLFeatureVectorizer: Incorrect Type."];
          v36 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_42;
        case 1:
          double v20 = (double)[v18 int64Value];
          goto LABEL_8;
        case 2:
          [v18 doubleValue];
LABEL_8:
          double *v19 = v20;
          goto LABEL_24;
        case 5:
          v21 = [v18 multiArrayValue];
          if ([v21 count] == v16)
          {
            BOOL v22 = [(MLMultiArray *)v41 setRangeWithRawData:v21 destIndex:*((void *)p_index_mapping->__begin_ + 2 * v13) error:a5];

            if (v22) {
              goto LABEL_24;
            }
          }
          else
          {
            if (a5)
            {
              *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"MLFeatureVectorizer: Array length incorrect."];
            }
          }
          goto LABEL_41;
        case 6:
          id v23 = [v18 dictionaryValue];
          if (v16 >= 1) {
            bzero(v19, 8 * (v16 - ((v16 & 0x1FFFFFFFFFFFFFFFLL) != 0)) + 8);
          }
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v24 = v23;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v49 objects:v56 count:16];
          if (!v25) {
            goto LABEL_23;
          }
          uint64_t v26 = *(void *)v50;
          break;
        default:
          goto LABEL_24;
      }
      while (2)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v50 != v26) {
            objc_enumerationMutation(v24);
          }
          long long v28 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          long long v29 = [v24 objectForKeyedSubscript:v28];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a5)
            {
              v37 = +[MLModelErrorUtils genericErrorWithFormat:@"MLFeatureVectorizer: Dictionary key type must be NSNumber."];
              goto LABEL_31;
            }
LABEL_32:

            goto LABEL_41;
          }
          unint64_t v30 = [v28 unsignedIntegerValue];
          if (v30 >= v16)
          {
            if (a5)
            {
              v37 = +[MLModelErrorUtils genericErrorWithFormat:@"MLFeatureVectorizer: Dictionary index out of range."];
LABEL_31:
              *a5 = v37;
            }
            goto LABEL_32;
          }
          [v29 doubleValue];
          v19[v30] = v31;
        }
        uint64_t v25 = [v24 countByEnumeratingWithState:&v49 objects:v56 count:16];
        if (v25) {
          continue;
        }
        break;
      }
LABEL_23:

LABEL_24:
      ++v13;
      begin = (char *)p_index_mapping->__begin_;
      uint64_t v11 = v48;
      if (v13 >= ((char *)p_index_mapping->__end_ - (char *)p_index_mapping->__begin_) >> 4)
      {
LABEL_25:
        uint64_t v32 = [MLDictionaryFeatureProvider alloc];
        uint64_t v18 = [(MLModelEngine *)v11 modelDescription];
        v33 = [v18 outputFeatureNames];
        v34 = [v33 objectAtIndexedSubscript:0];
        v54 = v34;
        v55 = v41;
        v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        v36 = [(MLDictionaryFeatureProvider *)v32 initWithDictionary:v35 error:a5];

        goto LABEL_42;
      }
    }
    if (a5)
    {
      v38 = [(NSArray *)v48->_columnNameEncoding objectAtIndexedSubscript:v13];
      *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Expected value for feature '%@'.", v38];
    }
    uint64_t v18 = 0;
LABEL_41:
    v36 = 0;
LABEL_42:

    unint64_t v10 = v40;
  }
  else
  {
    v36 = 0;
  }

  v43[2](v43);

  return v36;
}

uint64_t __60__MLFeatureVectorizer_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (MLFeatureVectorizer)initWith:(id)a3 dimensionEncoding:(id)a4 dataTransformerName:(id)a5 inputDescription:(id)a6 outputDescription:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9 configuration:(id)a10
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v62 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v67.receiver = self;
  v67.super_class = (Class)MLFeatureVectorizer;
  v63 = v17;
  v64 = v20;
  id v23 = v17;
  id v24 = v19;
  v65 = v21;
  id v66 = v22;
  uint64_t v25 = -[MLModelEngine initWithName:inputDescription:outputDescription:orderedInputFeatureNames:orderedOutputFeatureNames:configuration:](&v67, sel_initWithName_inputDescription_outputDescription_orderedInputFeatureNames_orderedOutputFeatureNames_configuration_, v23, v18, v19, v20, v21);
  uint64_t v26 = v25;
  if (!v25)
  {
LABEL_28:
    v48 = v26;
    goto LABEL_29;
  }
  objc_storeStrong((id *)&v25->_columnNameEncoding, a3);
  p_dimensionEncoding = (id *)&v26->_dimensionEncoding;
  objc_storeStrong((id *)&v26->_dimensionEncoding, a4);
  long long v28 = objc_msgSend(v18, "allValues", v61, v62);
  BOOL v29 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:v28 hasAnyFeatureTypeIn:&unk_1EF11AA00 minimalCount:1 maximumCount:-1 debugLabel:@"MLFeatureVectorizer Input" error:0];

  if (v29)
  {
    unint64_t v30 = [v24 allValues];
    BOOL v31 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:v30 hasAnyFeatureTypeIn:&unk_1EF11AA18 minimalCount:1 maximumCount:1 debugLabel:@"MLFeatureVectorizer Output" error:0];

    if (v31)
    {
      unint64_t v32 = [*p_dimensionEncoding count];
      p_index_mapping = &v26->index_mapping;
      begin = v26->index_mapping.__begin_;
      end = (char *)v26->index_mapping.__end_;
      unint64_t v36 = (end - begin) >> 4;
      if (v32 <= v36)
      {
        if (v32 >= v36)
        {
LABEL_22:
          if (end == p_index_mapping->__begin_)
          {
            uint64_t v51 = 0;
          }
          else
          {
            uint64_t v49 = 0;
            unint64_t v50 = 0;
            uint64_t v51 = 0;
            do
            {
              long long v52 = [*p_dimensionEncoding objectAtIndexedSubscript:v50];
              int v53 = [v52 intValue];

              v54 = (char *)p_index_mapping->__begin_;
              v55 = v26->index_mapping.__end_;
              v56 = (uint64_t *)((char *)p_index_mapping->__begin_ + v49);
              uint64_t *v56 = v51;
              v56[1] = v53;
              v51 += v53;
              ++v50;
              v49 += 16;
            }
            while (v50 < (v55 - v54) >> 4);
          }
          uint64_t v57 = [NSNumber numberWithUnsignedLong:v51];
          v68[0] = v57;
          uint64_t v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:1];
          output_array_shape = v26->_output_array_shape;
          v26->_output_array_shape = (NSArray *)v58;

          goto LABEL_28;
        }
        end = &begin[16 * v32];
      }
      else
      {
        unint64_t v37 = v32 - v36;
        value = v26->index_mapping.__end_cap_.__value_;
        if (v32 - v36 > (value - end) >> 4)
        {
          if (v32 >> 60) {
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v39 = value - begin;
          uint64_t v40 = v39 >> 3;
          if (v39 >> 3 <= v32) {
            uint64_t v40 = v32;
          }
          if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v41 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v41 = v40;
          }
          id v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreML::NNCompiler::MLRangeShape::Range>>(v41);
          v43 = &v42[16 * v36];
          v45 = &v42[16 * v44];
          bzero(v43, 16 * v37);
          end = &v43[16 * v37];
          id v47 = (char *)p_index_mapping->__begin_;
          v46 = (char *)v26->index_mapping.__end_;
          if (v46 != p_index_mapping->__begin_)
          {
            do
            {
              *((_OWORD *)v43 - 1) = *((_OWORD *)v46 - 1);
              v43 -= 16;
              v46 -= 16;
            }
            while (v46 != v47);
            v46 = (char *)p_index_mapping->__begin_;
          }
          p_index_mapping->__begin_ = v43;
          v26->index_mapping.__end_ = end;
          v26->index_mapping.__end_cap_.__value_ = v45;
          if (v46)
          {
            operator delete(v46);
            end = (char *)v26->index_mapping.__end_;
          }
          goto LABEL_22;
        }
        bzero(v26->index_mapping.__end_, 16 * v37);
        end += 16 * v37;
      }
      v26->index_mapping.__end_ = end;
      goto LABEL_22;
    }
  }
  v48 = 0;
LABEL_29:

  return v48;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v6 = a4;
  unint64_t v7 = objc_opt_new();
  inited = (CoreML::Specification::protobuf_FeatureVectorizer_2eproto *)objc_opt_new();
  uint64_t v9 = inited;
  for (uint64_t i = 0; ; ++i)
  {
    if (*(_DWORD *)(*(void *)a3 + 44) == 602)
    {
      uint64_t v11 = *(uint64_t **)(*(void *)a3 + 32);
    }
    else
    {
      inited = (CoreML::Specification::protobuf_FeatureVectorizer_2eproto *)CoreML::Specification::protobuf_FeatureVectorizer_2eproto::InitDefaults(inited);
      uint64_t v11 = &CoreML::Specification::_FeatureVectorizer_default_instance_;
    }
    if (i >= *((int *)v11 + 6)) {
      break;
    }
    if (*(_DWORD *)(*(void *)a3 + 44) == 602)
    {
      uint64_t v12 = *(uint64_t **)(*(void *)a3 + 32);
    }
    else
    {
      CoreML::Specification::protobuf_FeatureVectorizer_2eproto::InitDefaults(inited);
      uint64_t v12 = &CoreML::Specification::_FeatureVectorizer_default_instance_;
    }
    uint64_t v13 = *(void *)(v12[4] + 8 * i + 8);
    unint64_t v14 = [NSNumber numberWithUnsignedLongLong:*(void *)(v13 + 24)];
    [(CoreML::Specification::protobuf_FeatureVectorizer_2eproto *)v9 addObject:v14];

    uint64_t v15 = *(uint64_t **)(v13 + 16);
    if (*((char *)v15 + 23) < 0) {
      uint64_t v15 = (uint64_t *)*v15;
    }
    uint64_t v16 = [NSString stringWithUTF8String:v15];
    [v7 addObject:v16];
  }
  id v17 = [[MLModelDescription alloc] initFromSingleFunctionModelSpecification:a3];
  id v18 = [MLFeatureVectorizer alloc];
  id v19 = [v17 inputDescriptionsByName];
  id v20 = [v17 outputDescriptionsByName];
  id v21 = [v17 inputFeatureNames];
  id v22 = [v17 outputFeatureNames];
  id v23 = [(MLFeatureVectorizer *)v18 initWith:v7 dimensionEncoding:v9 dataTransformerName:@"feature vectorizer" inputDescription:v19 outputDescription:v20 orderedInputFeatureNames:v21 orderedOutputFeatureNames:v22 configuration:v6];

  return v23;
}

@end