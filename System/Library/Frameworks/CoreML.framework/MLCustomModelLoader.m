@interface MLCustomModelLoader
+ (id)customModelWithName:(id)a3 modelDescription:(id)a4 modelConfiguration:(id)a5 parameterDictionary:(id)a6 error:(id *)a7;
+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
+ (id)parametersFromCustomModelSpec:(void *)a3 error:(id *)a4;
@end

@implementation MLCustomModelLoader

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (*(_DWORD *)(*(void *)a3 + 44) == 555)
  {
    if (*(void *)(*(void *)a3 + 16)) {
      v9 = *(const CoreML::Specification::ModelDescription **)(*(void *)a3 + 16);
    }
    else {
      v9 = (const CoreML::Specification::ModelDescription *)&CoreML::Specification::_ModelDescription_default_instance_;
    }
    _MLModelDescriptionSpecification::_MLModelDescriptionSpecification((_MLModelDescriptionSpecification *)v31, v9);
    id v10 = [[MLModelDescription alloc] initFromSingleFunctionModelDescriptionSpecification:v31];
    v11 = v10;
    if (v10)
    {
      if (*(_DWORD *)(*(void *)a3 + 44) == 555)
      {
        v12 = *(void **)(*(void *)a3 + 32);
      }
      else
      {
        CoreML::Specification::protobuf_CustomModel_2eproto::InitDefaults((CoreML::Specification::protobuf_CustomModel_2eproto *)v10);
        v12 = &CoreML::Specification::_CustomModel_default_instance_;
      }
      v23 = &unk_1EF0CE8F8;
      unint64_t v24 = 0;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      int v27 = 0;
      google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::Init((uint64_t)&v26);
      int v27 = 0;
      int v30 = 0;
      uint64_t v14 = v12[1];
      if (v14) {
        google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v24, v14 & 0xFFFFFFFFFFFFFFFELL);
      }
      google::protobuf::internal::MapFieldLite<google::protobuf::internal::MapEntryLite<std::string,CoreML::Specification::CustomModel_CustomModelParamValue,(google::protobuf::internal::WireFormatLite::FieldType)9,(google::protobuf::internal::WireFormatLite::FieldType)11,0>,std::string,CoreML::Specification::CustomModel_CustomModelParamValue,(google::protobuf::internal::WireFormatLite::FieldType)9,(google::protobuf::internal::WireFormatLite::FieldType)11,0>::MergeFrom((uint64_t)&v25, (void *)v12[5]);
      v28 = &google::protobuf::internal::fixed_address_empty_string;
      uint64_t v15 = v12[6];
      if (*(char *)(v15 + 23) < 0) {
        uint64_t v16 = *(void *)(v15 + 8);
      }
      else {
        uint64_t v16 = *(unsigned __int8 *)(v15 + 23);
      }
      if ((long long *)v15 != &google::protobuf::internal::fixed_address_empty_string && v16) {
        google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena();
      }
      v29 = &google::protobuf::internal::fixed_address_empty_string;
      uint64_t v17 = v12[7];
      if (*(char *)(v17 + 23) < 0) {
        uint64_t v18 = *(void *)(v17 + 8);
      }
      else {
        uint64_t v18 = *(unsigned __int8 *)(v17 + 23);
      }
      if ((long long *)v17 != &google::protobuf::internal::fixed_address_empty_string && v18) {
        google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena();
      }
      v19 = objc_msgSend(NSString, "stringWithUTF8String:");
      v20 = [(id)objc_opt_class() parametersFromCustomModelSpec:&v23 error:a5];
      if (v20)
      {
        v21 = [a1 customModelWithName:v19 modelDescription:v11 modelConfiguration:v8 parameterDictionary:v20 error:a5];
        if (v21) {
          v13 = [[MLCustomModelWrapper alloc] initWithModelDescription:v11 customModel:v21 configuration:v8];
        }
        else {
          v13 = 0;
        }
      }
      else
      {
        v13 = 0;
      }

      CoreML::Specification::CustomModel::~CustomModel((CoreML::Specification::CustomModel *)&v23);
    }
    else
    {
      v13 = 0;
    }

    if (v32) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v32);
    }
  }
  else if (a5)
  {
    +[MLModelErrorUtils IOErrorWithFormat:@"Model type is not a CustomModel"];
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)customModelWithName:(id)a3 modelDescription:(id)a4 modelConfiguration:(id)a5 parameterDictionary:(id)a6 error:(id *)a7
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v11 = (NSString *)a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  Class v15 = NSClassFromString(v11);
  Class v16 = v15;
  if (!v15)
  {
    uint64_t v18 = [NSString stringWithFormat:@"Unable to load custom model ‘%@’ which requires an Objective-C class named ‘%@’. If you have defined this class in Swift you may need to annotate it with @objc(%@) in order to make it visible to the objective-c runtime via the required name.", v11, v11, v11];
    v19 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v24 = [v18 UTF8String];
      _os_log_error_impl(&dword_19E58B000, v19, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }

    if (!a7) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if ([(objc_class *)v15 conformsToProtocol:&unk_1EF11E650])
  {
    if (-[objc_class instancesRespondToSelector:](v16, "instancesRespondToSelector:", sel_initWithModelDescription_configuration_parameterDictionary_error_))uint64_t v17 = [objc_alloc(NSClassFromString(v11)) initWithModelDescription:v12 configuration:v13 parameterDictionary:v14 error:a7]; {
    else
    }
      uint64_t v17 = [objc_alloc(NSClassFromString(v11)) initWithModelDescription:v12 parameterDictionary:v14 error:a7];
    v21 = (void *)v17;
    goto LABEL_16;
  }
  uint64_t v18 = [NSString stringWithFormat:@"Custom model implmenetantion class named '%@' does not conform to MLCustomModel protocol", v11];
  v20 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v24 = [v18 UTF8String];
    _os_log_error_impl(&dword_19E58B000, v20, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
  }

  if (a7)
  {
LABEL_12:
    *a7 = +[MLModelErrorUtils errorWithCode:5, @"%@", v18 format];
  }
LABEL_13:

  v21 = 0;
LABEL_16:

  return v21;
}

+ (id)parametersFromCustomModelSpec:(void *)a3 error:(id *)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::begin(v31, *((void **)a3 + 5));
  while (1)
  {
    if (!v31[0])
    {
      id v21 = v5;
      goto LABEL_54;
    }
    v6 = (long long *)*((void *)v31[0] + 3);
    if (*((char *)v6 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v25, *(const std::string::value_type **)v6, *((void *)v6 + 1));
    }
    else
    {
      long long v7 = *v6;
      v25.__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
      *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v7;
    }
    uint64_t v26 = &unk_1EF0D8CD8;
    unint64_t v27 = 0;
    int v29 = 0;
    uint64_t v8 = *((void *)v6 + 4);
    if (v8) {
      google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v27, v8 & 0xFFFFFFFFFFFFFFFELL);
    }
    int v30 = 0;
    int v9 = *((_DWORD *)v6 + 13);
    if (v9 > 39)
    {
      switch(v9)
      {
        case '(':
          id v12 = (long long *)*((void *)v6 + 5);
          CoreML::Specification::CustomModel_CustomModelParamValue::clear_value((uint64_t)&v26);
          int v30 = 40;
          v28 = v12;
          break;
        case '2':
          char v13 = *((unsigned char *)v6 + 40);
          CoreML::Specification::CustomModel_CustomModelParamValue::clear_value((uint64_t)&v26);
          int v30 = 50;
          LOBYTE(v28) = v13;
          break;
        case '<':
LABEL_16:
          CoreML::Specification::CustomModel_CustomModelParamValue::clear_value((uint64_t)&v26);
          int v30 = v9;
          v28 = &google::protobuf::internal::fixed_address_empty_string;
          google::protobuf::internal::ArenaStringPtr::CreateInstanceNoArena();
      }
    }
    else
    {
      switch(v9)
      {
        case 10:
          v11 = (long long *)*((void *)v6 + 5);
          CoreML::Specification::CustomModel_CustomModelParamValue::clear_value((uint64_t)&v26);
          int v30 = 10;
          v28 = v11;
          break;
        case 20:
          goto LABEL_16;
        case 30:
          int v10 = *((_DWORD *)v6 + 10);
          CoreML::Specification::CustomModel_CustomModelParamValue::clear_value((uint64_t)&v26);
          int v30 = 30;
          LODWORD(v28) = v10;
          break;
      }
    }
    id v14 = (v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &v25
        : (std::string *)v25.__r_.__value_.__r.__words[0];
    Class v15 = [NSString stringWithUTF8String:v14];
    Class v16 = 0;
    if (v30 <= 39) {
      break;
    }
    switch(v30)
    {
      case '(':
        uint64_t v17 = [NSNumber numberWithLongLong:v28];
        goto LABEL_38;
      case '2':
        uint64_t v17 = [NSNumber numberWithBool:v28];
        goto LABEL_38;
      case '<':
        if (*((char *)v28 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v24, *(const std::string::value_type **)v28, *((void *)v28 + 1));
        }
        else
        {
          long long v18 = *v28;
          v24.__r_.__value_.__r.__words[2] = *((void *)v28 + 2);
          *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v18;
        }
        v19 = (v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? &v24
            : (std::string *)v24.__r_.__value_.__r.__words[0];
        std::string::size_type v20 = (v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? HIBYTE(v24.__r_.__value_.__r.__words[2])
            : v24.__r_.__value_.__l.__size_;
        Class v16 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v19 length:v20];
        if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v24.__r_.__value_.__l.__data_);
        }
        break;
    }
LABEL_39:
    [v5 setObject:v16 forKeyedSubscript:v15];

    google::protobuf::MapPair<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::~MapPair((uint64_t)&v25);
    google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::InnerMap::iterator_base<google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::KeyValuePair const>::operator++(v31);
  }
  if (v30 > 19)
  {
    if (v30 == 20)
    {
      uint64_t v17 = objc_msgSend(NSString, "stringWithUTF8String:");
    }
    else
    {
      if (v30 != 30) {
        goto LABEL_39;
      }
      uint64_t v17 = [NSNumber numberWithInt:v28];
    }
    goto LABEL_38;
  }
  if (v30 == 10)
  {
    uint64_t v17 = [NSNumber numberWithDouble:*(double *)&v28];
LABEL_38:
    Class v16 = (void *)v17;
    goto LABEL_39;
  }
  if (v30) {
    goto LABEL_39;
  }
  if (a4)
  {
    *a4 = +[MLModelErrorUtils errorWithCode:5, @"Parameter '%@' has no value", v15 format];
  }

  google::protobuf::MapPair<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::~MapPair((uint64_t)&v25);
  id v21 = 0;
LABEL_54:

  return v21;
}

@end