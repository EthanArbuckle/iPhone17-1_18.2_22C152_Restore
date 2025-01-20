@interface MLModelIOUtils
+ (BOOL)deserializeInterfaceFormat:(void *)a3 archive:(void *)a4 error:(id *)a5;
+ (BOOL)serializeInterfaceFormat:(void *)a3 archive:(void *)a4 error:(id *)a5;
+ (BOOL)serializeMetadataAndInterfaceFromSpecification:(void *)a3 archive:(void *)a4 error:(id *)a5;
+ (BOOL)serializeVersionInfo:(id)a3 archive:(void *)a4 error:(id *)a5;
+ (_NSRange)rangeFromAllowedSizeRangeProtoMessage:(const void *)a3;
+ (id)defaultFunctionNameFromDescriptionSpecification:(void *)a3;
+ (id)descriptionFromProto:(const void *)a3;
+ (id)deserializeMetadataAndInterfaceFromArchive:(void *)a3 error:(id *)a4;
+ (id)deserializeVersionInfoFromArchive:(void *)a3 error:(id *)a4;
+ (id)featureDescriptionsFromProto:(const void *)a3;
+ (id)functionDescriptionsFromDescriptionSpecification:(void *)a3;
+ (id)inputDescriptionFromInterface:(void *)a3;
+ (id)loadFromModelSpecificationInArchive:(void *)a3 withClass:(Class)a4 versionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
+ (id)orderedFeatureNamesFromInterface:(void *)a3 forInput:(BOOL)a4;
+ (id)orderedInputFeatureNamesFromInterface:(void *)a3;
+ (id)orderedNamesFromProto:(const void *)a3;
+ (id)orderedOutputFeatureNamesFromInterface:(void *)a3;
+ (id)orderedStateFeatureNamesFromInterface:(void *)a3;
+ (id)outputDescriptionFromInterface:(void *)a3;
+ (id)populateConstraintsForArrayFeatureType:(const void *)a3 dataType:(int64_t)a4 constraintClass:(Class)a5 defaultOptionalValue:(id)a6;
+ (id)populateConstraintsForFeatureDescription:(const void *)a3;
+ (id)populateConstraintsForImageFeatureDescription:(const void *)a3;
+ (id)populateConstraintsForImageFeatureDescriptionElement:(void *)a3;
+ (id)serializeSpecification:(void *)a3 toArchive:(void *)a4 error:(id *)a5;
+ (id)specificationURLFromModelAtURL:(id)a3 error:(id *)a4;
+ (id)stateDescriptionFromInterface:(void *)a3;
+ (id)trainingInputDescriptionFromInterface:(void *)a3;
+ (id)versionForSerializedSpecification:(void *)a3 options:(id)a4 error:(id *)a5;
@end

@implementation MLModelIOUtils

+ (id)deserializeVersionInfoFromArchive:(void *)a3 error:(id *)a4
{
  uint64_t v13 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)&unk_19EC86ACE);
  operator>>((uint64_t)a3);
  operator>>((uint64_t)a3);
  operator>>((uint64_t)a3);
  operator>>((uint64_t)a3, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  uint64_t v6 = [NSString stringWithUTF8String:p_p];
  if (v6) {
    v7 = (__CFString *)v6;
  }
  else {
    v7 = &stru_1EF0E81D0;
  }
  v8 = +[MLVersionInfo versionInfoWithMajor:v13 minor:v12 patch:v11 variant:v7];

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return v8;
}

+ (id)descriptionFromProto:(const void *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:*((int *)a3 + 2)];
  [a1 featureDescriptionsFromProto:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "name", (void)v13);
        [v5 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v5;
}

+ (id)featureDescriptionsFromProto:(const void *)a3
{
  v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*((int *)a3 + 2)];
  uint64_t v6 = *((void *)a3 + 2);
  if (v6) {
    uint64_t v7 = (void *)(v6 + 8);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *((int *)a3 + 2);
  if (v8)
  {
    uint64_t v9 = 8 * v8;
    do
    {
      uint64_t v10 = *v7;
      uint64_t v11 = [a1 populateConstraintsForFeatureDescription:*v7];
      uint64_t v12 = *(uint64_t **)(v10 + 32);
      if (!v12) {
        uint64_t v12 = &CoreML::Specification::_FeatureType_default_instance_;
      }
      long long v13 = *(uint64_t **)(v10 + 16);
      if (*((char *)v13 + 23) < 0) {
        long long v13 = (uint64_t *)*v13;
      }
      uint64_t v14 = *((unsigned int *)v12 + 9);
      long long v15 = [NSString stringWithUTF8String:v13];
      long long v16 = *(uint64_t **)(v10 + 32);
      if (!v16) {
        long long v16 = &CoreML::Specification::_FeatureType_default_instance_;
      }
      v17 = +[MLFeatureDescription featureDescriptionWithName:v15 type:v14 optional:*((unsigned __int8 *)v16 + 16) constraints:v11];
      [v5 addObject:v17];

      ++v7;
      v9 -= 8;
    }
    while (v9);
  }

  return v5;
}

+ (id)populateConstraintsForFeatureDescription:(const void *)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  v3 = &CoreML::Specification::_FeatureType_default_instance_;
  if (*((void *)a3 + 4)) {
    v3 = (uint64_t *)*((void *)a3 + 4);
  }
  switch(*((_DWORD *)v3 + 9))
  {
    case 4:
      uint64_t v4 = +[MLModelIOUtils populateConstraintsForImageFeatureDescription:](MLModelIOUtils, "populateConstraintsForImageFeatureDescription:");
      goto LABEL_28;
    case 5:
      uint64_t v7 = 0;
      uint64_t v8 = v3[3];
      int v9 = *(_DWORD *)(v8 + 36);
      uint64_t v10 = 65600;
      if (v9 > 65599)
      {
        if (v9 == 65600)
        {
          double v29 = 0.0;
          if (*(_DWORD *)(v8 + 64) == 61) {
            double v29 = *(double *)(v8 + 48);
          }
          uint64_t v12 = [NSNumber numberWithDouble:v29];
          uint64_t v10 = 65600;
        }
        else
        {
          if (v9 != 131104) {
            goto LABEL_43;
          }
          if (*(_DWORD *)(v8 + 64) == 41) {
            uint64_t v26 = *(unsigned int *)(v8 + 48);
          }
          else {
            uint64_t v26 = 0;
          }
          uint64_t v12 = [NSNumber numberWithInt:v26];
          uint64_t v10 = 131104;
        }
        goto LABEL_42;
      }
      if (v9 != 65552)
      {
        if (v9 != 65568) {
          goto LABEL_43;
        }
        double v11 = 0.0;
        if (*(_DWORD *)(v8 + 64) == 51) {
          LODWORD(v11) = *(_DWORD *)(v8 + 48);
        }
        uint64_t v12 = [NSNumber numberWithFloat:v11];
        uint64_t v10 = 65568;
LABEL_42:
        uint64_t v7 = (void *)v12;
        goto LABEL_43;
      }
      double v28 = 0.0;
      if (*(_DWORD *)(v8 + 64) == 51) {
        LODWORD(v28) = *(_DWORD *)(v8 + 48);
      }
      uint64_t v7 = [NSNumber numberWithFloat:v28];
      uint64_t v10 = 65552;
LABEL_43:
      long long v15 = +[MLModelIOUtils populateConstraintsForArrayFeatureType:v8 dataType:v10 constraintClass:objc_opt_class() defaultOptionalValue:v7];

LABEL_44:
      return v15;
    case 6:
      int v13 = *(_DWORD *)(v3[3] + 28);
      if (v13 == 2)
      {
        v27 = +[MLDictionaryConstraint constraintWithStringKeys];
        v31 = v27;
        long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
      }
      else if (v13 == 1)
      {
        uint64_t v14 = +[MLDictionaryConstraint constraintWithInt64Keys];
        v32 = v14;
        long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
      }
      else
      {
LABEL_16:
        long long v15 = 0;
      }
      goto LABEL_44;
    case 7:
      uint64_t v16 = v3[3];
      if (*(void *)(v16 + 16)) {
        v17 = *(uint64_t **)(v16 + 16);
      }
      else {
        v17 = &CoreML::Specification::_SizeRange_default_instance_;
      }
      uint64_t v18 = +[MLModelIOUtils rangeFromAllowedSizeRangeProtoMessage:v17];
      uint64_t v20 = v19;
      int v21 = *(_DWORD *)(v16 + 36);
      uint64_t v22 = 3;
      if (v21 != 3) {
        uint64_t v22 = 0;
      }
      if (v21 == 1) {
        uint64_t v23 = 1;
      }
      else {
        uint64_t v23 = v22;
      }
      v24 = +[MLFeatureDescription featureDescriptionWithName:@"values" type:v23 optional:0 constraints:0];
      v25 = -[MLSequenceConstraint initWithValueDescription:countRange:]([MLSequenceConstraint alloc], "initWithValueDescription:countRange:", v24, v18, v20);
      v33[0] = v25;
      long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];

      goto LABEL_44;
    case 8:
      uint64_t v5 = v3[3];
      if (*(_DWORD *)(v5 + 28) == 1)
      {
        uint64_t v6 = *(uint64_t **)(v5 + 16);
      }
      else
      {
        CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)a1);
        uint64_t v6 = &CoreML::Specification::_ArrayFeatureType_default_instance_;
      }
      uint64_t v4 = +[MLModelIOUtils populateConstraintsForArrayFeatureType:v6 dataType:65552 constraintClass:objc_opt_class() defaultOptionalValue:0];
LABEL_28:
      long long v15 = (void *)v4;
      goto LABEL_44;
    default:
      goto LABEL_16;
  }
}

+ (id)populateConstraintsForArrayFeatureType:(const void *)a3 dataType:(int64_t)a4 constraintClass:(Class)a5 defaultOptionalValue:(id)a6
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v46 = a6;
  uint64_t v10 = CoreML::numericArrayToObjC<google::protobuf::RepeatedField<long long>,long long>((int *)a3 + 4);
  int v11 = *((_DWORD *)a3 + 15);
  switch(v11)
  {
    case 0:
      int v13 = (CoreML::Specification::protobuf_FeatureTypes_2eproto *)[[a5 alloc] initWithShape:v10 dataType:a4 shapeConstraint:0 defaultOptionalValue:v46];
      v51 = v13;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
LABEL_41:

      break;
    case 21:
      long long v15 = (CoreML::Specification::protobuf_FeatureTypes_2eproto *)objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v16 = v15;
      if (*((_DWORD *)a3 + 15) == 21)
      {
        v17 = (uint64_t *)*((void *)a3 + 5);
      }
      else
      {
        CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults(v15);
        v17 = &CoreML::Specification::_ArrayFeatureType_EnumeratedShapes_default_instance_;
      }
      v34 = [(CoreML::Specification::protobuf_FeatureTypes_2eproto *)v16 initWithCapacity:*((int *)v17 + 6)];
      int v13 = v34;
      if (*((_DWORD *)a3 + 15) == 21)
      {
        v35 = (uint64_t *)*((void *)a3 + 5);
      }
      else
      {
        CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults(v34);
        v35 = &CoreML::Specification::_ArrayFeatureType_EnumeratedShapes_default_instance_;
      }
      uint64_t v36 = v35[4];
      if (v36) {
        uint64_t v37 = v36 + 8;
      }
      else {
        uint64_t v37 = 0;
      }
      uint64_t v38 = *((int *)v35 + 6);
      if (v38)
      {
        uint64_t v39 = 8 * v38;
        do
        {
          v40 = CoreML::numericArrayToObjC<google::protobuf::RepeatedField<long long>,long long>((int *)(*(void *)v37 + 16));
          [(CoreML::Specification::protobuf_FeatureTypes_2eproto *)v13 addObject:v40];

          v37 += 8;
          v39 -= 8;
        }
        while (v39);
      }
      v25 = [[MLMultiArrayShapeConstraint alloc] initWithEnumeratedShapes:v13];
      if (![v10 count])
      {
        v41 = [(CoreML::Specification::protobuf_FeatureTypes_2eproto *)v13 objectAtIndexedSubscript:0];
        uint64_t v42 = [v41 copy];

        uint64_t v10 = (void *)v42;
      }
      v32 = (void *)[[a5 alloc] initWithShape:v10 dataType:a4 shapeConstraint:v25 defaultOptionalValue:v46];
      v54[0] = v32;
      uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
      goto LABEL_40;
    case 31:
      int64_t v44 = a4;
      v45 = a5;
      uint64_t v12 = (CoreML::Specification::protobuf_FeatureTypes_2eproto *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      int v13 = v12;
      if (*((_DWORD *)a3 + 15) == 31)
      {
        uint64_t v14 = (uint64_t *)*((void *)a3 + 5);
      }
      else
      {
        CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults(v12);
        uint64_t v14 = &CoreML::Specification::_ArrayFeatureType_ShapeRange_default_instance_;
      }
      uint64_t v18 = v14[4];
      if (v18) {
        uint64_t v19 = (void *)(v18 + 8);
      }
      else {
        uint64_t v19 = 0;
      }
      uint64_t v20 = *((int *)v14 + 6);
      if (v20)
      {
        uint64_t v21 = 8 * v20;
        do
        {
          uint64_t v22 = +[MLModelIOUtils rangeFromAllowedSizeRangeProtoMessage:*v19];
          v24 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v22, v23);
          [(CoreML::Specification::protobuf_FeatureTypes_2eproto *)v13 addObject:v24];

          ++v19;
          v21 -= 8;
        }
        while (v21);
      }
      v25 = [[MLMultiArrayShapeConstraint alloc] initWithSizeRangeForDimension:v13];
      if (![v10 count])
      {
        uint64_t v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[CoreML::Specification::protobuf_FeatureTypes_2eproto count](v13, "count"));
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        v27 = v13;
        uint64_t v28 = [(CoreML::Specification::protobuf_FeatureTypes_2eproto *)v27 countByEnumeratingWithState:&v47 objects:v53 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v48 != v29) {
                objc_enumerationMutation(v27);
              }
              v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * i), "rangeValue"));
              [v26 addObject:v31];
            }
            uint64_t v28 = [(CoreML::Specification::protobuf_FeatureTypes_2eproto *)v27 countByEnumeratingWithState:&v47 objects:v53 count:16];
          }
          while (v28);
        }

        uint64_t v10 = v26;
      }
      v32 = (void *)[[v45 alloc] initWithShape:v10 dataType:v44 shapeConstraint:v25 defaultOptionalValue:v46];
      v52 = v32;
      uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
LABEL_40:
      uint64_t v6 = (void *)v33;

      goto LABEL_41;
  }

  return v6;
}

+ (id)orderedNamesFromProto:(const void *)a3
{
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = *((void *)a3 + 2);
  if (v5) {
    uint64_t v6 = v5 + 8;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *((int *)a3 + 2);
  if (v7)
  {
    uint64_t v8 = 8 * v7;
    do
    {
      int v9 = *(uint64_t **)(*(void *)v6 + 16);
      if (*((char *)v9 + 23) < 0) {
        int v9 = (uint64_t *)*v9;
      }
      uint64_t v10 = [NSString stringWithUTF8String:v9];
      [v4 addObject:v10];

      v6 += 8;
      v8 -= 8;
    }
    while (v8);
  }

  return v4;
}

+ (_NSRange)rangeFromAllowedSizeRangeProtoMessage:(const void *)a3
{
  unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (*((void *)a3 + 2) >= 0x7FFFFFFFFFFFFFFFuLL) {
    NSUInteger v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    NSUInteger v4 = *((void *)a3 + 2);
  }
  if (*((void *)a3 + 3) < 0x7FFFFFFFFFFFFFFFuLL) {
    unint64_t v3 = *((void *)a3 + 3);
  }
  BOOL v5 = v3 >= v4;
  unint64_t v6 = v3 - v4;
  if (v5) {
    NSUInteger v7 = v6 + 1;
  }
  else {
    NSUInteger v7 = 0;
  }
  result.length = v7;
  result.location = v4;
  return result;
}

+ (id)trainingInputDescriptionFromInterface:(void *)a3
{
  return (id)[a1 descriptionFromProto:*(void *)a3 + 112];
}

+ (id)stateDescriptionFromInterface:(void *)a3
{
  return (id)[a1 descriptionFromProto:*(void *)a3 + 64];
}

+ (id)outputDescriptionFromInterface:(void *)a3
{
  return (id)[a1 descriptionFromProto:*(void *)a3 + 40];
}

+ (id)orderedStateFeatureNamesFromInterface:(void *)a3
{
  return (id)[a1 orderedNamesFromProto:*(void *)a3 + 64];
}

+ (id)orderedOutputFeatureNamesFromInterface:(void *)a3
{
  return (id)[a1 orderedNamesFromProto:*(void *)a3 + 40];
}

+ (id)orderedInputFeatureNamesFromInterface:(void *)a3
{
  return (id)[a1 orderedNamesFromProto:*(void *)a3 + 16];
}

+ (id)inputDescriptionFromInterface:(void *)a3
{
  return (id)[a1 descriptionFromProto:*(void *)a3 + 16];
}

+ (id)functionDescriptionsFromDescriptionSpecification:(void *)a3
{
  uint64_t v4 = *(void *)a3;
  id v21 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*(int *)(*(void *)a3 + 96)];
  uint64_t v5 = *(void *)(v4 + 104);
  if (v5) {
    unint64_t v6 = (uint64_t *)(v5 + 8);
  }
  else {
    unint64_t v6 = 0;
  }
  uint64_t v7 = *(int *)(v4 + 96);
  if (v7)
  {
    for (uint64_t i = 8 * v7; i; i -= 8)
    {
      uint64_t v9 = *v6;
      uint64_t v10 = *(uint64_t **)(*v6 + 88);
      if (*((char *)v10 + 23) < 0) {
        uint64_t v10 = (uint64_t *)*v10;
      }
      int v11 = [NSString stringWithUTF8String:v10];
      uint64_t v12 = [a1 featureDescriptionsFromProto:v9 + 16];
      int v13 = [a1 featureDescriptionsFromProto:v9 + 40];
      uint64_t v14 = [a1 featureDescriptionsFromProto:v9 + 64];
      long long v15 = *(uint64_t **)(v9 + 96);
      if (*((char *)v15 + 23) < 0)
      {
        if (v15[1])
        {
          long long v15 = (uint64_t *)*v15;
LABEL_13:
          uint64_t v16 = [NSString stringWithUTF8String:v15];
          goto LABEL_15;
        }
      }
      else if (*((unsigned char *)v15 + 23))
      {
        goto LABEL_13;
      }
      uint64_t v16 = 0;
LABEL_15:
      v17 = *(uint64_t **)(v9 + 104);
      if (*((char *)v17 + 23) < 0)
      {
        if (!v17[1])
        {
LABEL_21:
          uint64_t v18 = 0;
          goto LABEL_22;
        }
        v17 = (uint64_t *)*v17;
      }
      else if (!*((unsigned char *)v17 + 23))
      {
        goto LABEL_21;
      }
      uint64_t v18 = [NSString stringWithUTF8String:v17];
LABEL_22:
      uint64_t v19 = [[MLModelDescription alloc] initWithInputDescriptions:v12 outputDescriptions:v13 stateDescriptions:v14 predictedFeatureName:v16 predictedProbabilitiesName:v18 functionName:v11];
      [v21 addObject:v19];

      ++v6;
    }
  }

  return v21;
}

+ (id)defaultFunctionNameFromDescriptionSpecification:(void *)a3
{
  if (!*(_DWORD *)(*(void *)a3 + 96)) {
    goto LABEL_8;
  }
  unint64_t v3 = *(uint64_t **)(*(void *)a3 + 152);
  if ((*((char *)v3 + 23) & 0x80000000) == 0)
  {
    if (!*((unsigned char *)v3 + 23)) {
      goto LABEL_8;
    }
LABEL_7:
    uint64_t v4 = [NSString stringWithUTF8String:v3];
    goto LABEL_9;
  }
  if (v3[1])
  {
    unint64_t v3 = (uint64_t *)*v3;
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v4 = 0;
LABEL_9:

  return v4;
}

+ (BOOL)deserializeInterfaceFormat:(void *)a3 archive:(void *)a4 error:(id *)a5
{
  _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification16ModelDescriptionENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_((CoreML::Specification::ModelDescription **)&v22);
  uint64_t v8 = (google::protobuf::MessageLite *)v22;
  uint64_t v9 = (std::__shared_weak_count *)*((void *)a3 + 1);
  *(_OWORD *)a3 = v22;
  if (v9)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    uint64_t v10 = *(google::protobuf::MessageLite **)a3;
  }
  else
  {
    uint64_t v10 = v8;
  }
  memset(&v26, 0, sizeof(v26));
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v22);
  operator>>((uint64_t)a4, &v26);
  if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v11 = &v26;
  }
  else {
    int v11 = (std::string *)v26.__r_.__value_.__r.__words[0];
  }
  if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v26.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v26.__r_.__value_.__l.__size_;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)v11, size);
  uint64_t v39 = &unk_1EF0DB2F8;
  v40[0] = &unk_1EF0DB2C8;
  v40[1] = &v22;
  v41[0] = &unk_1EF0DB3A8;
  v41[1] = v40;
  __int16 v42 = 0;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v46 = 0;
  int v45 = 0x2000;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  v31 = &v39;
  *(void *)v32 = 0;
  *(void *)((char *)&v32[1] + 2) = 0;
  uint64_t v33 = 0x7FFFFFFFLL;
  uint64_t v34 = 0x647FFFFFFFLL;
  int v35 = 100;
  char v36 = 1;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  google::protobuf::io::CodedInputStream::Refresh((google::protobuf::io::CodedInputStream *)&v29);
  LODWORD(v34) = 0x7FFFFFFF;
  uint64_t v13 = v30 + SHIDWORD(v33);
  uint64_t v30 = v13;
  int v14 = v32[0] - v33;
  if (v32[0] <= (int)v33) {
    int v14 = 0;
  }
  else {
    uint64_t v30 = v13 - v14;
  }
  HIDWORD(v33) = v14;
  if (google::protobuf::MessageLite::ParseFromCodedStream(v10, (google::protobuf::io::CodedInputStream *)&v29))
  {
    CoreML::Result::Result((CoreML::Result *)&v19);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v27, "unable to deserialize object");
    uint64_t v19 = 5;
    std::operator+<char>();
    if (v28 < 0) {
      operator delete(v27);
    }
  }
  google::protobuf::io::CodedInputStream::~CodedInputStream((google::protobuf::io::CodedInputStream *)&v29);
  uint64_t v39 = &unk_1EF0DB2F8;
  google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((google::protobuf::io::CopyingInputStreamAdaptor *)v41);
  BOOL v15 = (v19 & 0xFFFFFFEF) == 0;
  if (a5 && (v19 & 0xFFFFFFEF) != 0)
  {
    p_p = &__p;
    if (v21 < 0) {
      p_p = __p;
    }
    *a5 = +[MLModelErrorUtils IOErrorWithFormat:@"%s", p_p];
  }
  if (v21 < 0) {
    operator delete(__p);
  }
  *(void *)&long long v22 = *MEMORY[0x1E4FBA408];
  uint64_t v17 = *(void *)(MEMORY[0x1E4FBA408] + 72);
  *(void *)((char *)&v23[-2] + *(void *)(v22 - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
  v23[0] = v17;
  v23[1] = MEMORY[0x1E4FBA470] + 16;
  if (v24 < 0) {
    operator delete((void *)v23[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x19F3C1850](&v25);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
  return v15;
}

+ (id)orderedFeatureNamesFromInterface:(void *)a3 forInput:(BOOL)a4
{
  uint64_t v4 = 40;
  if (a4) {
    uint64_t v4 = 16;
  }
  uint64_t v5 = [a1 orderedNamesFromProto:*(void *)a3 + v4];

  return v5;
}

+ (id)specificationURLFromModelAtURL:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v14 = 0;
  unint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v7 = [v5 path];
  char v8 = [v6 fileExistsAtPath:v7 isDirectory:&v14];

  if (v8)
  {
    if (v14)
    {
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v5 fileSystemRepresentation]);
      MPL::ModelPackage::ModelPackage((uint64_t)v13, (char *)&__p, 0, 1);
    }
    id v9 = v5;
    uint64_t v10 = v9;
  }
  else
  {
    if (a4)
    {
      *a4 = +[MLModelErrorUtils IOErrorWithFormat:@"Model does not exist at %@", v5];
    }
    int v11 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int __p = 138412290;
      __p_4 = v5;
      _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "Model does not exist at %@", (uint8_t *)&__p, 0xCu);
    }

    uint64_t v10 = 0;
    id v9 = v5;
  }

  return v10;
}

+ (id)deserializeMetadataAndInterfaceFromArchive:(void *)a3 error:(id *)a4
{
  _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification16ModelDescriptionENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v9);
  if (+[MLModelIOUtils deserializeInterfaceFormat:&v9 archive:a3 error:a4])
  {
    unint64_t v6 = [[MLModelDescription alloc] initWithModelDescriptionSpecification:&v9 error:a4];
    uint64_t v7 = [[MLModel alloc] initWithDescription:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }

  return v7;
}

+ (BOOL)serializeMetadataAndInterfaceFromSpecification:(void *)a3 archive:(void *)a4 error:(id *)a5
{
  if (*(void *)(*(void *)a3 + 16)) {
    uint64_t v7 = *(const CoreML::Specification::ModelDescription **)(*(void *)a3 + 16);
  }
  else {
    uint64_t v7 = (const CoreML::Specification::ModelDescription *)&CoreML::Specification::_ModelDescription_default_instance_;
  }
  _MLModelDescriptionSpecification::_MLModelDescriptionSpecification((_MLModelDescriptionSpecification *)&v10, v7);
  BOOL v8 = +[MLModelIOUtils serializeInterfaceFormat:&v10 archive:a4 error:a5];
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  return v8;
}

+ (BOOL)serializeVersionInfo:(id)a3 archive:(void *)a4 error:(id *)a5
{
  id v6 = a3;
  operator<<((uint64_t)a4, [v6 majorVersion]);
  operator<<((uint64_t)a4, [v6 minorVersion]);
  operator<<((uint64_t)a4, [v6 patchVersion]);
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v11 = 0;
  uint64_t v7 = [v6 variantString];

  if (v7)
  {
    id v8 = [v6 variantString];
    MEMORY[0x19F3C1430](__p, [v8 UTF8String]);
  }
  operator<<((uint64_t)a4, (uint64_t *)__p);
  if (SHIBYTE(v11) < 0) {
    operator delete(__p[0]);
  }

  return 1;
}

+ (id)populateConstraintsForImageFeatureDescriptionElement:(void *)a3
{
  return (id)[a1 populateConstraintsForImageFeatureDescription:*(void *)a3];
}

+ (id)populateConstraintsForImageFeatureDescription:(const void *)a3
{
  v55[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (uint64_t *)*((void *)a3 + 4);
  if (!v3) {
    unint64_t v3 = &CoreML::Specification::_FeatureType_default_instance_;
  }
  if (*((_DWORD *)v3 + 9) == 4)
  {
    uint64_t v4 = (uint64_t *)v3[3];
  }
  else
  {
    CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)a1);
    uint64_t v4 = &CoreML::Specification::_ImageFeatureType_default_instance_;
  }
  int v5 = *((_DWORD *)v4 + 8);
  uint64_t v6 = 30;
  uint64_t v7 = 40;
  if (v5 != 40) {
    uint64_t v7 = 0;
  }
  if (v5 != 30) {
    uint64_t v6 = v7;
  }
  uint64_t v8 = 10;
  uint64_t v9 = 20;
  if (v5 != 20) {
    uint64_t v9 = 0;
  }
  if (v5 != 10) {
    uint64_t v8 = v9;
  }
  if (v5 <= 29) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v6;
  }
  uint64_t v51 = v10;
  uint64_t v11 = [[MLImageSize alloc] initWithPixelsWide:v4[2] pixelsHigh:v4[3]];
  uint64_t v12 = [MLImageSizeConstraint alloc];
  v55[0] = v11;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
  v52 = [(MLImageSizeConstraint *)v12 initWithEnumeratedImageSizes:v13];

  if ([(MLImageSize *)v11 pixelsWide]) {
    BOOL v14 = [(MLImageSize *)v11 pixelsHigh] != 0;
  }
  else {
    BOOL v14 = 0;
  }
  int v15 = *((_DWORD *)v4 + 13);
  if (!v15)
  {
    if (v14) {
      goto LABEL_69;
    }
    long long v22 = v52;
    v52 = [[MLImageSizeConstraint alloc] initUnspecified];
    goto LABEL_68;
  }
  if (v15 == 21)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = v23;
    uint64_t v24 = 0;
    for (unint64_t i = 0; ; ++i)
    {
      if (*((_DWORD *)v4 + 13) == 21)
      {
        std::string v26 = (uint64_t *)v4[5];
      }
      else
      {
        CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults(v23);
        std::string v26 = &CoreML::Specification::_ImageFeatureType_EnumeratedImageSizes_default_instance_;
      }
      if (i >= *((int *)v26 + 6)) {
        break;
      }
      inited = [MLImageSize alloc];
      char v28 = inited;
      int v29 = *((_DWORD *)v4 + 13);
      if (v29 == 21)
      {
        uint64_t v30 = (uint64_t *)v4[5];
      }
      else
      {
        inited = (MLImageSize *)CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)inited);
        int v29 = *((_DWORD *)v4 + 13);
        uint64_t v30 = &CoreML::Specification::_ImageFeatureType_EnumeratedImageSizes_default_instance_;
      }
      uint64_t v31 = *(void *)(*(void *)(v30[4] + (v24 >> 29) + 8) + 16);
      if (v29 == 21)
      {
        v32 = (uint64_t *)v4[5];
      }
      else
      {
        CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults((CoreML::Specification::protobuf_FeatureTypes_2eproto *)inited);
        v32 = &CoreML::Specification::_ImageFeatureType_EnumeratedImageSizes_default_instance_;
      }
      uint64_t v33 = [(MLImageSize *)v28 initWithPixelsWide:v31 pixelsHigh:*(void *)(*(void *)(v32[4] + 8 * (v24 >> 32) + 8) + 24)];
      [v22 addObject:v33];

      v24 += 0x100000000;
    }
    if (![v22 count])
    {
      uint64_t v34 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19E58B000, v34, OS_LOG_TYPE_ERROR, "Image descripition included empty set of enumerated sizes", buf, 2u);
      }

      int v35 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19E58B000, v35, OS_LOG_TYPE_ERROR, "Using the default size", buf, 2u);
      }

      [v22 addObject:v11];
    }
    char v36 = [[MLImageSizeConstraint alloc] initWithEnumeratedImageSizes:v22];

    v52 = v36;
    if (v14)
    {
      if ([(MLImageSizeConstraint *)v36 isAllowedImageSize:v11 error:0]) {
        goto LABEL_68;
      }
      uint64_t v37 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19E58B000, v37, OS_LOG_TYPE_ERROR, "Image descripition width and height and are not valid according to the enumerated sizes", buf, 2u);
      }

      uint64_t v38 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19E58B000, v38, OS_LOG_TYPE_ERROR, "Changing default height and width to be the first enumerated size", buf, 2u);
      }
    }
    uint64_t v39 = [v22 objectAtIndexedSubscript:0];

    uint64_t v11 = (MLImageSize *)v39;
    goto LABEL_68;
  }
  if (v15 != 31) {
    goto LABEL_69;
  }
  if (*(void *)(v4[5] + 16)) {
    uint64_t v16 = *(uint64_t **)(v4[5] + 16);
  }
  else {
    uint64_t v16 = &CoreML::Specification::_SizeRange_default_instance_;
  }
  uint64_t v17 = (CoreML::Specification::protobuf_FeatureTypes_2eproto *)+[MLModelIOUtils rangeFromAllowedSizeRangeProtoMessage:v16];
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  if (*((_DWORD *)v4 + 13) == 31)
  {
    char v21 = (uint64_t *)v4[5];
  }
  else
  {
    CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults(v17);
    char v21 = &CoreML::Specification::_ImageFeatureType_ImageSizeRange_default_instance_;
  }
  v40 = (uint64_t *)v21[3];
  if (v40) {
    v41 = v40;
  }
  else {
    v41 = &CoreML::Specification::_SizeRange_default_instance_;
  }
  uint64_t v42 = +[MLModelIOUtils rangeFromAllowedSizeRangeProtoMessage:v41];
  uint64_t v44 = -[MLImageSizeConstraint initWithPixelsWideRange:pixelsHighRange:]([MLImageSizeConstraint alloc], "initWithPixelsWideRange:pixelsHighRange:", v18, v20, v42, v43);

  v52 = v44;
  if (v14)
  {
    if ([(MLImageSizeConstraint *)v44 isAllowedImageSize:v11 error:0]) {
      goto LABEL_69;
    }
    int v45 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v45, OS_LOG_TYPE_ERROR, "Image descripition width and height and are not valid according to the specified flexible ranges", buf, 2u);
    }

    uint64_t v46 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v46, OS_LOG_TYPE_ERROR, "Changing default height and width to minimum size in range", buf, 2u);
    }
  }
  long long v47 = [[MLImageSize alloc] initWithPixelsWide:v18 pixelsHigh:v42];
  long long v22 = v11;
  uint64_t v11 = v47;
LABEL_68:

LABEL_69:
  long long v48 = +[MLImageConstraint constraintWithPixelsWide:[(MLImageSize *)v11 pixelsWide] pixelsHigh:[(MLImageSize *)v11 pixelsHigh] pixelType:v51 sizeConstraint:v52];
  v54 = v48;
  long long v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];

  return v49;
}

+ (BOOL)serializeInterfaceFormat:(void *)a3 archive:(void *)a4 error:(id *)a5
{
  uint64_t v7 = *(google::protobuf::MessageLite **)a3;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v15);
  char v21 = &unk_1EF0DB360;
  long long v22 = &unk_1EF0DB338;
  uint64_t v23 = v16;
  uint64_t v24 = &unk_1EF0DB3E8;
  uint64_t v25 = &v22;
  __int16 v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = 0x2000;
  if (google::protobuf::MessageLite::SerializeToZeroCopyStream(v7, (google::protobuf::io::ZeroCopyOutputStream *)&v21))
  {
    CoreML::Result::Result((CoreML::Result *)&v12);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v19, "unable to serialize object");
    uint64_t v12 = 4;
    std::operator+<char>();
    if (v20 < 0) {
      operator delete(v19);
    }
  }
  google::protobuf::io::OstreamOutputStream::~OstreamOutputStream((google::protobuf::io::OstreamOutputStream *)&v21);
  BOOL v8 = (v12 & 0xFFFFFFEF) == 0;
  if ((v12 & 0xFFFFFFEF) != 0)
  {
    if (a5)
    {
      p_p = &__p;
      if (v14 < 0) {
        p_p = __p;
      }
      *a5 = +[MLModelErrorUtils IOErrorWithFormat:@"%s", p_p];
    }
  }
  else
  {
    std::stringbuf::str();
    operator<<((uint64_t)a4, (uint64_t *)&v21);
    if (SHIBYTE(v23) < 0) {
      operator delete(v21);
    }
  }
  if (v14 < 0) {
    operator delete(__p);
  }
  v15[0] = *MEMORY[0x1E4FBA408];
  uint64_t v10 = *(void *)(MEMORY[0x1E4FBA408] + 72);
  *(void *)((char *)v15 + *(void *)(v15[0] - 24)) = *(void *)(MEMORY[0x1E4FBA408] + 64);
  v16[0] = v10;
  v16[1] = MEMORY[0x1E4FBA470] + 16;
  if (v17 < 0) {
    operator delete((void *)v16[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x19F3C1850](&v18);
  return v8;
}

+ (id)serializeSpecification:(void *)a3 toArchive:(void *)a4 error:(id *)a5
{
  uint64_t v7 = *(google::protobuf::MessageLite **)a3;
  uint64_t v8 = (*(uint64_t (**)(void, SEL))(**((void **)a4 + 1) + 56))(*((void *)a4 + 1), a2);
  char v17 = &unk_1EF0DB360;
  v18[0] = &unk_1EF0DB338;
  v18[1] = v8;
  v18[2] = &unk_1EF0DB3E8;
  v18[3] = v18;
  __int16 v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0x2000;
  if (google::protobuf::MessageLite::SerializeToZeroCopyStream(v7, (google::protobuf::io::ZeroCopyOutputStream *)&v17))
  {
    CoreML::Result::Result((CoreML::Result *)&v12);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "unable to serialize object");
    uint64_t v12 = 4;
    std::operator+<char>();
    if (v16 < 0) {
      operator delete(__p);
    }
  }
  google::protobuf::io::OstreamOutputStream::~OstreamOutputStream((google::protobuf::io::OstreamOutputStream *)&v17);
  if ((v12 & 0xFFFFFFEF) != 0)
  {
    if (a5)
    {
      uint64_t v9 = &v13;
      if (v14 < 0) {
        uint64_t v9 = v13;
      }
      +[MLModelErrorUtils IOErrorWithFormat:@"%s", v9];
      uint64_t v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = +[MLCompilerResult resultWithArchive:a4];
  }
  if (v14 < 0) {
    operator delete(v13);
  }

  return v10;
}

+ (id)versionForSerializedSpecification:(void *)a3 options:(id)a4 error:(id *)a5
{
  int v5 = +[MLVersionInfo versionInfoWithMajor:1 minor:0 patch:0 variant:@"spec"];

  return v5;
}

+ (id)loadFromModelSpecificationInArchive:(void *)a3 withClass:(Class)a4 versionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v11 = a5;
  id v12 = a6;
  CoreML::Specification::Model::Model((CoreML::Specification::Model *)v22);
  uint64_t v13 = (std::__shared_weak_count *)(*(uint64_t (**)(void))(**(void **)(*(void *)a3 + 32) + 16))(*(void *)(*(void *)a3 + 32));
  int v35 = (CoreML::Specification::Model *)&unk_1EF0DB2F8;
  v36[0] = (std::__shared_weak_count *)&unk_1EF0DB2C8;
  v36[1] = v13;
  v37[0] = &unk_1EF0DB3A8;
  v37[1] = v36;
  __int16 v38 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v42 = 0;
  int v41 = 0x2000;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v35;
  *(void *)uint64_t v28 = 0;
  *(void *)((char *)&v28[1] + 2) = 0;
  uint64_t v29 = 0x7FFFFFFFLL;
  uint64_t v30 = 0x647FFFFFFFLL;
  int v31 = 100;
  char v32 = 1;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  google::protobuf::io::CodedInputStream::Refresh((google::protobuf::io::CodedInputStream *)&v25);
  LODWORD(v30) = 0x7FFFFFFF;
  uint64_t v14 = v26 + SHIDWORD(v29);
  uint64_t v26 = v14;
  int v15 = v28[0] - v29;
  if (v28[0] <= (int)v29) {
    int v15 = 0;
  }
  else {
    uint64_t v26 = v14 - v15;
  }
  HIDWORD(v29) = v15;
  if (google::protobuf::MessageLite::ParseFromCodedStream((google::protobuf::MessageLite *)v22, (google::protobuf::io::CodedInputStream *)&v25))
  {
    CoreML::Result::Result((CoreML::Result *)&v19);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "unable to deserialize object");
    uint64_t v19 = 5;
    std::operator+<char>();
    if (v24 < 0) {
      operator delete(__p);
    }
  }
  google::protobuf::io::CodedInputStream::~CodedInputStream((google::protobuf::io::CodedInputStream *)&v25);
  int v35 = (CoreML::Specification::Model *)&unk_1EF0DB2F8;
  google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((google::protobuf::io::CopyingInputStreamAdaptor *)v37);
  if ((v19 & 0xFFFFFFEF) != 0)
  {
    if (a7)
    {
      char v16 = &v20;
      if (v21 < 0) {
        char v16 = v20;
      }
      +[MLModelErrorUtils IOErrorWithFormat:@"%s", v16];
      char v17 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>(&v35, (const CoreML::Specification::Model *)v22);
    char v17 = [(objc_class *)a4 loadModelFromSpecification:&v35 configuration:v12 error:a7];
    if (v36[0]) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v36[0]);
    }
  }
  if (v21 < 0) {
    operator delete(v20);
  }
  CoreML::Specification::Model::~Model((CoreML::Specification::Model *)v22);

  return v17;
}

@end