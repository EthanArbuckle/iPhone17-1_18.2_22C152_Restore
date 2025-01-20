@interface MLImputer
+ (id)imputeValueFrom:(id)a3 replaceValue:(id)a4 dataTransformerName:(id)a5 inputDescription:(id)a6 outputDescription:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9 error:(id *)a10;
+ (id)imputeValueFrom:(id)a3 replaceValue:(id)a4 inputDescription:(id)a5 outputDescription:(id)a6 orderedInputFeatureNames:(id)a7 orderedOutputFeatureNames:(id)a8 error:(id *)a9;
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (MLFeatureValue)imputeValue;
- (MLFeatureValue)replaceValue;
- (MLImputer)initWith:(id)a3 imputeValue:(id)a4 replaceValue:(id)a5 inputDescription:(id)a6 outputDescription:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9 configuration:(id)a10 error:(id *)a11;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (unint64_t)predictionTypeForKTrace;
@end

@implementation MLImputer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceValue, 0);

  objc_storeStrong((id *)&self->_imputeValue, 0);
}

- (MLFeatureValue)replaceValue
{
  return self->_replaceValue;
}

- (MLFeatureValue)imputeValue
{
  return self->_imputeValue;
}

- (unint64_t)predictionTypeForKTrace
{
  return 13;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v67 = a3;
  id v7 = a4;
  unint64_t v8 = [(MLImputer *)self predictionTypeForKTrace];
  unint64_t v9 = [(MLModelEngine *)self signpostID];
  uint64_t v10 = [v7 parentSignpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__MLImputer_predictionFromFeatures_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_56_e5_v8__0l;
  aBlock[4] = v8;
  aBlock[5] = v9;
  aBlock[6] = v10;
  v11 = (void (**)(void))_Block_copy(aBlock);
  v12 = [(MLModelEngine *)self modelDescription];
  v13 = [v12 inputFeatureNames];
  v14 = [v13 objectAtIndexedSubscript:0];

  v15 = [(MLModelEngine *)self modelDescription];
  v16 = [v15 outputFeatureNames];
  v17 = [v16 objectAtIndexedSubscript:0];

  v18 = [v67 featureValueForName:v14];
  v19 = v18;
  if (!v18 || [(MLFeatureValue *)v18 isUndefined])
  {
LABEL_3:
    v20 = self->_imputeValue;
    v21 = v19;
LABEL_4:

LABEL_5:
    v22 = [MLDictionaryFeatureProvider alloc];
    v69 = v17;
    v70 = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
    v23 = [(MLDictionaryFeatureProvider *)v22 initWithDictionary:v21 error:a5];
    goto LABEL_6;
  }
  v20 = v19;
  if (!self->_replaceValue) {
    goto LABEL_5;
  }
  v20 = v19;
  switch([(MLFeatureValue *)self->_imputeValue type])
  {
    case MLFeatureTypeInt64:
      uint64_t v25 = [(MLFeatureValue *)v19 int64Value];
      v20 = v19;
      if (v25 == [(MLFeatureValue *)self->_replaceValue int64Value]) {
        goto LABEL_3;
      }
      goto LABEL_5;
    case MLFeatureTypeDouble:
      [(MLFeatureValue *)self->_replaceValue doubleValue];
      [(MLFeatureValue *)v19 doubleValue];
      double v30 = v29;
      [(MLFeatureValue *)self->_replaceValue doubleValue];
      v20 = v19;
      if (v30 == v31) {
        goto LABEL_3;
      }
      goto LABEL_5;
    case MLFeatureTypeString:
      v26 = [(MLFeatureValue *)v19 stringValue];
      v27 = [(MLFeatureValue *)self->_replaceValue stringValue];
      int v28 = [v26 isEqualToString:v27];

      v20 = v19;
      if (v28) {
        goto LABEL_3;
      }
      goto LABEL_5;
    case MLFeatureTypeMultiArray:
      MLFeatureType v32 = [(MLFeatureValue *)self->_replaceValue type];
      replaceValue = self->_replaceValue;
      if (v32 == MLFeatureTypeDouble)
      {
        [(MLFeatureValue *)replaceValue doubleValue];
        double v35 = v34;
      }
      else
      {
        v20 = v19;
        if ([(MLFeatureValue *)replaceValue type] != MLFeatureTypeInt64) {
          goto LABEL_5;
        }
        double v35 = (double)[(MLFeatureValue *)self->_replaceValue int64Value];
      }
      v21 = [(MLFeatureValue *)v19 multiArrayValue];
      uint64_t v65 = [v21 count];
      if ([v21 dataType] != 65600 || !objc_msgSend(v21, "isContiguous"))
      {
        if (v65 < 1) {
          goto LABEL_54;
        }
        uint64_t v38 = 0;
        char v62 = 0;
        while (1)
        {
          uint64_t v39 = [v21 dataType];
          double v40 = 0.0;
          if (v39 <= 65599)
          {
            if (v39 != 65552 && v39 != 65568) {
              goto LABEL_38;
            }
            v41 = [v21 objectAtIndexedSubscript:v38];
            [v41 floatValue];
            double v40 = v42;
            goto LABEL_37;
          }
          if (v39 == 65600) {
            break;
          }
          if (v39 == 131104)
          {
            v41 = [v21 objectAtIndexedSubscript:v38];
            double v40 = (double)[v41 integerValue];
LABEL_37:
          }
LABEL_38:
          if (v35 == v40)
          {
            ++v38;
            char v62 = 1;
            if (v38 == v65) {
              goto LABEL_44;
            }
          }
          else if (v65 == ++v38)
          {
            if (v62) {
              goto LABEL_44;
            }
LABEL_54:
            v20 = v19;
            goto LABEL_4;
          }
        }
        v41 = [v21 objectAtIndexedSubscript:v38];
        [v41 doubleValue];
        double v40 = v43;
        goto LABEL_37;
      }
      v36 = (double *)[v21 bytes];
      uint64_t v37 = v65;
      if (v65 < 1) {
        goto LABEL_54;
      }
      while (v35 != *v36)
      {
        ++v36;
        if (!--v37) {
          goto LABEL_54;
        }
      }
LABEL_44:
      v44 = [MLMultiArray alloc];
      v45 = [NSNumber numberWithInteger:v65];
      v71[0] = v45;
      v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];
      v61 = -[MLMultiArray initWithShape:dataType:error:](v44, "initWithShape:dataType:error:", v46, [v21 dataType], a5);

      v47 = v61;
      if (v61)
      {
        char v48 = [v21 copyIntoMultiArray:v61 error:a5];
        v47 = v61;
        if (v48)
        {
          if (objc_msgSend(v21, "dataType", v61) == 65600 && objc_msgSend(v21, "isContiguous"))
          {
            uint64_t v63 = [v21 bytes];
            uint64_t v60 = [(MLMultiArray *)v61 mutableBytes];
            for (uint64_t i = 0; i != v65; ++i)
            {
              double v50 = *(double *)(v63 + 8 * i);
              if (v35 == v50)
              {
                v51 = [(MLFeatureValue *)self->_imputeValue multiArrayValue];
                v52 = [v51 objectAtIndexedSubscript:i];
                [v52 doubleValue];
                *(void *)(v60 + 8 * i) = v53;
              }
              else
              {
                *(double *)(v60 + 8 * i) = v50;
              }
            }
          }
          else
          {
            for (uint64_t j = 0; j != v65; ++j)
            {
              v64 = [v21 objectAtIndexedSubscript:j];
              uint64_t v55 = [v21 dataType];
              double v56 = 0.0;
              if (v55 > 65599)
              {
                if (v55 == 65600)
                {
                  objc_msgSend(v64, "doubleValue", 0.0);
                }
                else if (v55 == 131104)
                {
                  double v56 = (double)objc_msgSend(v64, "integerValue", 0.0);
                }
              }
              else if (v55 == 65552 || v55 == 65568)
              {
                objc_msgSend(v64, "floatValue", 0.0);
                double v56 = v57;
              }
              if (v35 == v56)
              {
                v58 = [(MLFeatureValue *)self->_imputeValue multiArrayValue];
                v59 = [v58 objectAtIndexedSubscript:j];
                [(MLMultiArray *)v61 setObject:v59 atIndexedSubscript:j];
              }
            }
          }
          v20 = +[MLFeatureValue featureValueWithMultiArray:v61];

          goto LABEL_4;
        }
      }

      v23 = 0;
      v20 = v19;
LABEL_6:

      v11[2](v11);
      return v23;
    default:
      goto LABEL_5;
  }
}

uint64_t __50__MLImputer_predictionFromFeatures_options_error___block_invoke()
{
  return kdebug_trace();
}

- (MLImputer)initWith:(id)a3 imputeValue:(id)a4 replaceValue:(id)a5 inputDescription:(id)a6 outputDescription:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9 configuration:(id)a10 error:(id *)a11
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v38 = a4;
  id v39 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  v41 = v18;
  double v40 = v19;
  v22 = [[MLModelDescription alloc] initWithInputDescriptions:v17 outputDescriptions:v18 predictedFeatureName:0 predictedProbabilitiesName:0 trainingInputDescriptions:0 orderedInputFeatureNames:v19 orderedOutputFeatureNames:v20 metadata:0];
  v42.receiver = self;
  v42.super_class = (Class)MLImputer;
  v23 = [(MLModelEngine *)&v42 initWithDescription:v22 configuration:v21];
  p_isa = (id *)&v23->super.super.isa;
  if (!v23) {
    goto LABEL_21;
  }
  p_imputeValue = (id *)&v23->_imputeValue;
  objc_storeStrong((id *)&v23->_imputeValue, a4);
  v26 = p_isa + 5;
  objc_storeStrong(p_isa + 5, a5);
  if (*p_imputeValue)
  {
    v27 = (void *)MEMORY[0x1E4F1CA48];
    int v28 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*p_imputeValue, "type"));
    v43[0] = v28;
    double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
    double v30 = [v27 arrayWithArray:v29];

    if ([*p_imputeValue type] == 2 || objc_msgSend(*p_imputeValue, "type") == 1) {
      [v30 addObject:&unk_1EF11A658];
    }
    double v31 = [v17 allValues];
    BOOL v32 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:v31 hasAnyFeatureTypeIn:v30 minimalCount:1 maximumCount:1 debugLabel:@"MLImputer Input" error:a11];

    if (!v32) {
      goto LABEL_24;
    }
    v33 = [v41 allValues];
    BOOL v34 = +[MLModelDescriptionUtils validateAllFeatureDescriptions:v33 hasAnyFeatureTypeIn:v30 minimalCount:1 maximumCount:1 debugLabel:@"MLImputer Output" error:a11];

    if (!v34) {
      goto LABEL_24;
    }
    if (*v26)
    {
      uint64_t v35 = [*v26 type];
      if (v35 == 1)
      {
        if ([*p_imputeValue type] != 1)
        {
LABEL_19:
          if ([*p_imputeValue type] != 5) {
            goto LABEL_22;
          }
        }
      }
      else
      {
        if (v35 != 2)
        {
          if (v35 != 3 || [*p_imputeValue type] != 3)
          {
LABEL_22:
            if (a11)
            {
              *a11 = +[MLModelErrorUtils genericErrorWithFormat:@"Invalid combination of replace value type and input/output/feature value types."];
            }
LABEL_24:

            goto LABEL_25;
          }
          goto LABEL_20;
        }
        if ([*p_imputeValue type] != 2) {
          goto LABEL_19;
        }
      }
    }
LABEL_20:

LABEL_21:
    v36 = p_isa;
    goto LABEL_26;
  }
  if (!a11)
  {
LABEL_25:
    v36 = 0;
    goto LABEL_26;
  }
  +[MLModelErrorUtils genericErrorWithFormat:@"imputed feature value not set."];
  v36 = 0;
  *a11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v36;
}

+ (id)imputeValueFrom:(id)a3 replaceValue:(id)a4 dataTransformerName:(id)a5 inputDescription:(id)a6 outputDescription:(id)a7 orderedInputFeatureNames:(id)a8 orderedOutputFeatureNames:(id)a9 error:(id *)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v22 = [MLImputer alloc];
  v23 = objc_alloc_init(MLModelConfiguration);
  v24 = [(MLImputer *)v22 initWith:v17 imputeValue:v15 replaceValue:v16 inputDescription:v18 outputDescription:v19 orderedInputFeatureNames:v20 orderedOutputFeatureNames:v21 configuration:v23 error:a10];

  return v24;
}

+ (id)imputeValueFrom:(id)a3 replaceValue:(id)a4 inputDescription:(id)a5 outputDescription:(id)a6 orderedInputFeatureNames:(id)a7 orderedOutputFeatureNames:(id)a8 error:(id *)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = [MLImputer alloc];
  id v21 = objc_alloc_init(MLModelConfiguration);
  v22 = [(MLImputer *)v20 initWith:@"MLimputer" imputeValue:v14 replaceValue:v15 inputDescription:v16 outputDescription:v17 orderedInputFeatureNames:v18 orderedOutputFeatureNames:v19 configuration:v21 error:a9];

  return v22;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  inited = (CoreML::Specification::protobuf_Imputer_2eproto *)a4;
  v77 = inited;
  if (*(_DWORD *)(*(void *)a3 + 44) == 601)
  {
    unint64_t v8 = *(uint64_t **)(*(void *)a3 + 32);
  }
  else
  {
    inited = (CoreML::Specification::protobuf_Imputer_2eproto *)CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
    unint64_t v8 = &CoreML::Specification::_Imputer_default_instance_;
  }
  unint64_t v9 = 0;
  switch(*((_DWORD *)v8 + 9))
  {
    case 0:
      goto LABEL_120;
    case 1:
      if (*(_DWORD *)(*(void *)a3 + 44) == 601)
      {
        uint64_t v10 = *(uint64_t **)(*(void *)a3 + 32);
      }
      else
      {
        CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
        uint64_t v10 = &CoreML::Specification::_Imputer_default_instance_;
      }
      double v17 = 0.0;
      if (*((_DWORD *)v10 + 9) == 1) {
        double v17 = *((double *)v10 + 2);
      }
      inited = +[MLFeatureValue featureValueWithDouble:v17];
      goto LABEL_43;
    case 2:
      if (*(_DWORD *)(*(void *)a3 + 44) == 601)
      {
        v11 = *(uint64_t **)(*(void *)a3 + 32);
      }
      else
      {
        CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
        v11 = &CoreML::Specification::_Imputer_default_instance_;
      }
      if (*((_DWORD *)v11 + 9) == 2) {
        uint64_t v18 = v11[2];
      }
      else {
        uint64_t v18 = 0;
      }
      inited = +[MLFeatureValue featureValueWithInt64:v18];
LABEL_43:
      unint64_t v9 = (MLImputer *)inited;
      goto LABEL_84;
    case 3:
      if (*(_DWORD *)(*(void *)a3 + 44) == 601)
      {
        v12 = *(uint64_t **)(*(void *)a3 + 32);
      }
      else
      {
        CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
        v12 = &CoreML::Specification::_Imputer_default_instance_;
      }
      if (*((_DWORD *)v12 + 9) == 3) {
        id v19 = (long long *)v12[2];
      }
      else {
        id v19 = &google::protobuf::internal::fixed_address_empty_string;
      }
      if (*((char *)v19 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v79, *(const std::string::value_type **)v19, *((void *)v19 + 1));
      }
      else
      {
        long long v25 = *v19;
        v79.__r_.__value_.__r.__words[2] = *((void *)v19 + 2);
        *(_OWORD *)&v79.__r_.__value_.__l.__data_ = v25;
      }
      if ((v79.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v46 = &v79;
      }
      else {
        v46 = (std::string *)v79.__r_.__value_.__r.__words[0];
      }
      v47 = [NSString stringWithUTF8String:v46];
      unint64_t v9 = +[MLFeatureValue featureValueWithString:v47];

      if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v79.__r_.__value_.__l.__data_);
      }
      goto LABEL_84;
    case 4:
      if (*(_DWORD *)(*(void *)a3 + 44) == 601)
      {
        v13 = *(uint64_t **)(*(void *)a3 + 32);
      }
      else
      {
        inited = (CoreML::Specification::protobuf_Imputer_2eproto *)CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
        v13 = &CoreML::Specification::_Imputer_default_instance_;
      }
      if (*((_DWORD *)v13 + 9) == 4)
      {
        id v20 = a5;
        id v21 = (uint64_t *)v13[2];
      }
      else
      {
        CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        id v20 = a5;
        id v21 = &CoreML::Specification::_DoubleVector_default_instance_;
      }
      uint64_t v26 = *((int *)v21 + 4);
      v27 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v26];
      if (v26)
      {
        uint64_t v28 = 0;
        do
        {
          double v29 = [NSNumber numberWithDouble:*(double *)(v21[3] + (v28 >> 29) + 8)];
          [v27 addObject:v29];

          v28 += 0x100000000;
          --v26;
        }
        while (v26);
      }
      goto LABEL_57;
    case 5:
      if (*(_DWORD *)(*(void *)a3 + 44) == 601)
      {
        id v14 = *(uint64_t **)(*(void *)a3 + 32);
      }
      else
      {
        inited = (CoreML::Specification::protobuf_Imputer_2eproto *)CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
        id v14 = &CoreML::Specification::_Imputer_default_instance_;
      }
      if (*((_DWORD *)v14 + 9) == 5)
      {
        v22 = (uint64_t *)v14[2];
      }
      else
      {
        CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        v22 = &CoreML::Specification::_Int64Vector_default_instance_;
      }
      id v20 = a5;
      uint64_t v30 = *((int *)v22 + 4);
      v27 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v30];
      if (!v30) {
        goto LABEL_57;
      }
      uint64_t v31 = 0;
      break;
    case 6:
      if (*(_DWORD *)(*(void *)a3 + 44) == 601)
      {
        id v15 = *(uint64_t **)(*(void *)a3 + 32);
      }
      else
      {
        inited = (CoreML::Specification::protobuf_Imputer_2eproto *)CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
        id v15 = &CoreML::Specification::_Imputer_default_instance_;
      }
      if (*((_DWORD *)v15 + 9) == 6)
      {
        v23 = (int **)v15[2];
      }
      else
      {
        CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        v23 = (int **)&CoreML::Specification::_StringToDoubleMap_default_instance_;
      }
      uint64_t v35 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:*v23[5]];
      google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::begin(&v79, v23[5]);
      while (v79.__r_.__value_.__r.__words[0])
      {
        v36 = *(long long **)(v79.__r_.__value_.__r.__words[0] + 24);
        if (*((char *)v36 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v78, *(const std::string::value_type **)v36, *((void *)v36 + 1));
        }
        else
        {
          long long v37 = *v36;
          v78.__r_.__value_.__r.__words[2] = *((void *)v36 + 2);
          *(_OWORD *)&v78.__r_.__value_.__l.__data_ = v37;
        }
        id v38 = [NSNumber numberWithDouble:*((double *)v36 + 3)];
        if ((v78.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          id v39 = &v78;
        }
        else {
          id v39 = (std::string *)v78.__r_.__value_.__r.__words[0];
        }
        double v40 = [NSString stringWithUTF8String:v39];
        [v35 setObject:v38 forKey:v40];

        if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v78.__r_.__value_.__l.__data_);
        }
        google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::InnerMap::iterator_base<google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::KeyValuePair const>::operator++((unsigned __int8 **)&v79);
      }
      uint64_t v41 = +[MLFeatureValue featureValueWithDictionary:v35 error:a5];
      goto LABEL_76;
    case 7:
      if (*(_DWORD *)(*(void *)a3 + 44) == 601)
      {
        id v16 = *(uint64_t **)(*(void *)a3 + 32);
      }
      else
      {
        inited = (CoreML::Specification::protobuf_Imputer_2eproto *)CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
        id v16 = &CoreML::Specification::_Imputer_default_instance_;
      }
      if (*((_DWORD *)v16 + 9) == 7)
      {
        v24 = (int **)v16[2];
      }
      else
      {
        CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(inited);
        v24 = (int **)&CoreML::Specification::_Int64ToDoubleMap_default_instance_;
      }
      uint64_t v35 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:*v24[5]];
      google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::begin(&v79, v24[5]);
      while (v79.__r_.__value_.__r.__words[0])
      {
        objc_super v42 = *(uint64_t **)(v79.__r_.__value_.__r.__words[0] + 8);
        uint64_t v43 = *v42;
        v44 = [NSNumber numberWithDouble:*((double *)v42 + 1)];
        v45 = [NSNumber numberWithLongLong:v43];
        [v35 setObject:v44 forKey:v45];

        google::protobuf::Map<long long,double>::InnerMap::iterator_base<google::protobuf::Map<long long,double>::KeyValuePair const>::operator++((uint64_t **)&v79);
      }
      uint64_t v41 = +[MLFeatureValue featureValueWithDictionary:v35 error:a5];
LABEL_76:
      unint64_t v9 = (MLImputer *)v41;

      if (!v9) {
        goto LABEL_120;
      }
      goto LABEL_84;
    default:
      goto LABEL_84;
  }
  while (1)
  {
    uint64_t v32 = *(void *)(v22[3] + (v31 >> 29) + 8);
    if (v32 != (uint64_t)(double)v32) {
      break;
    }
    v33 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v27 addObject:v33];

    v31 += 0x100000000;
    if (!--v30)
    {
LABEL_57:
      BOOL v34 = +[MLMultiArray doubleVectorWithValues:v27];
      unint64_t v9 = +[MLFeatureValue featureValueWithMultiArray:v34];
      a5 = v20;

LABEL_84:
      v76 = v9;
      if (*(_DWORD *)(*(void *)a3 + 44) == 601)
      {
        char v48 = *(uint64_t **)(*(void *)a3 + 32);
      }
      else
      {
        inited = (CoreML::Specification::protobuf_Imputer_2eproto *)CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
        char v48 = &CoreML::Specification::_Imputer_default_instance_;
      }
      int v49 = *((_DWORD *)v48 + 10);
      if (v49 == 11)
      {
        if (*(_DWORD *)(*(void *)a3 + 44) == 601)
        {
          v51 = *(uint64_t **)(*(void *)a3 + 32);
        }
        else
        {
          CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
          v51 = &CoreML::Specification::_Imputer_default_instance_;
        }
        double v55 = 0.0;
        if (*((_DWORD *)v51 + 10) == 11) {
          double v55 = *((double *)v51 + 3);
        }
        uint64_t v56 = +[MLFeatureValue featureValueWithDouble:v55];
      }
      else
      {
        if (v49 != 12)
        {
          if (v49 == 13)
          {
            if (*(_DWORD *)(*(void *)a3 + 44) == 601)
            {
              double v50 = *(uint64_t **)(*(void *)a3 + 32);
            }
            else
            {
              CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
              double v50 = &CoreML::Specification::_Imputer_default_instance_;
            }
            if (*((_DWORD *)v50 + 10) == 13) {
              v54 = (long long *)v50[3];
            }
            else {
              v54 = &google::protobuf::internal::fixed_address_empty_string;
            }
            if (*((char *)v54 + 23) < 0)
            {
              std::string::__init_copy_ctor_external(&v79, *(const std::string::value_type **)v54, *((void *)v54 + 1));
            }
            else
            {
              long long v58 = *v54;
              v79.__r_.__value_.__r.__words[2] = *((void *)v54 + 2);
              *(_OWORD *)&v79.__r_.__value_.__l.__data_ = v58;
            }
            if ((v79.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              v59 = &v79;
            }
            else {
              v59 = (std::string *)v79.__r_.__value_.__r.__words[0];
            }
            uint64_t v60 = [NSString stringWithUTF8String:v59];
            uint64_t v53 = +[MLFeatureValue featureValueWithString:v60];

            if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v79.__r_.__value_.__l.__data_);
            }
          }
          else
          {
            uint64_t v53 = 0;
          }
          goto LABEL_119;
        }
        if (*(_DWORD *)(*(void *)a3 + 44) == 601)
        {
          v52 = *(uint64_t **)(*(void *)a3 + 32);
        }
        else
        {
          CoreML::Specification::protobuf_Imputer_2eproto::InitDefaults(inited);
          v52 = &CoreML::Specification::_Imputer_default_instance_;
        }
        if (*((_DWORD *)v52 + 10) == 12) {
          uint64_t v57 = v52[3];
        }
        else {
          uint64_t v57 = 0;
        }
        uint64_t v56 = +[MLFeatureValue featureValueWithInt64:v57];
      }
      uint64_t v53 = v56;
LABEL_119:
      id v61 = [[MLModelDescription alloc] initFromSingleFunctionModelSpecification:a3];
      v75 = (void *)v53;
      char v62 = [MLImputer alloc];
      v74 = [v61 inputDescriptionsByName];
      uint64_t v63 = [v61 outputDescriptionsByName];
      v64 = (void *)MEMORY[0x1E4F1CAA0];
      v73 = (void *)v63;
      v72 = [v61 inputDescriptionsByName];
      v71 = [v72 allKeys];
      uint64_t v65 = [v64 orderedSetWithArray:v71];
      v66 = (void *)MEMORY[0x1E4F1CAA0];
      id v67 = [v61 outputDescriptionsByName];
      v68 = [v67 allKeys];
      v69 = [v66 orderedSetWithArray:v68];
      unint64_t v9 = [(MLImputer *)v62 initWith:@"imputer" imputeValue:v76 replaceValue:v75 inputDescription:v74 outputDescription:v73 orderedInputFeatureNames:v65 orderedOutputFeatureNames:v69 configuration:v77 error:a5];

      goto LABEL_120;
    }
  }
  if (a5)
  {
    *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"Only integer values with magnitude less than 2^48 are supported in the imputer."];
  }

  unint64_t v9 = 0;
LABEL_120:

  return v9;
}

@end