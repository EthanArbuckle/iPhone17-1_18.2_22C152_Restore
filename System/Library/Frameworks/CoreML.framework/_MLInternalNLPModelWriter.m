@interface _MLInternalNLPModelWriter
+ (BOOL)saveCustomSentenceClassifierModelToURL:(id)a3 modelData:(id)a4 stringInputName:(id)a5 classname:(id)a6 NSError:(id *)a7;
+ (BOOL)saveCustomWordTaggingModelToURL:(id)a3 modelData:(id)a4 stringInputName:(id)a5 classname:(id)a6 NSError:(id *)a7;
@end

@implementation _MLInternalNLPModelWriter

+ (BOOL)saveCustomSentenceClassifierModelToURL:(id)a3 modelData:(id)a4 stringInputName:(id)a5 classname:(id)a6 NSError:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  CoreML::Specification::Model::Model((CoreML::Specification::Model *)&__p);
  std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>(&v41, (const CoreML::Specification::Model *)&__p);
  CoreML::Specification::Model::~Model((CoreML::Specification::Model *)&__p);
  v13 = v41;
  *((_DWORD *)v41 + 6) = 9;
  uint64_t v14 = *((void *)v13 + 2);
  if (!v14) {
    operator new();
  }
  uint64_t v15 = *(void *)(v14 + 160);
  if (!v15) {
    operator new();
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "A model for classifying sentences constructed in memory");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)(v15 + 48), &__p);
  if (SHIBYTE(v39) < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  v16 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v14 + 16);
  id v17 = v12;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v17 UTF8String]);
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v16 + 2, &__p);
  if (SHIBYTE(v39) < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "Input sentence");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v16 + 3, &__p);
  if (SHIBYTE(v39) < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  uint64_t v18 = (uint64_t)v16[4];
  if (!v18) {
    operator new();
  }
  if (*(_DWORD *)(v18 + 36) != 3)
  {
    CoreML::Specification::FeatureType::clear_Type(v18);
    *(_DWORD *)(v18 + 36) = 3;
    operator new();
  }
  v19 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v14 + 40);
  std::string::basic_string[abi:ne180100]<0>(&__p, "label");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v19 + 2, &__p);
  if (SHIBYTE(v39) < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "Output label");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v19 + 3, &__p);
  if (SHIBYTE(v39) < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  uint64_t v20 = (uint64_t)v19[4];
  if (!v20) {
    operator new();
  }
  if (*(_DWORD *)(v20 + 36) != 3)
  {
    CoreML::Specification::FeatureType::clear_Type(v20);
    *(_DWORD *)(v20 + 36) = 3;
    operator new();
  }
  v21 = v41;
  if (*((_DWORD *)v41 + 11) != 555)
  {
    CoreML::Specification::Model::clear_Type((uint64_t)v41);
    *((_DWORD *)v21 + 11) = 555;
    operator new();
  }
  uint64_t v22 = *((void *)v41 + 4);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[@"_MLNLPSentenceClassifierModel" UTF8String]);
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)(v22 + 48), &__p);
  if (SHIBYTE(v39) < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  CoreML::Specification::CustomModel_CustomModelParamValue::CustomModel_CustomModelParamValue((CoreML::Specification::CustomModel_CustomModelParamValue *)&__p);
  id v23 = v11;
  v24 = (void *)[v23 bytes];
  size_t v25 = [v23 length];
  if (v40 != 60)
  {
    CoreML::Specification::CustomModel_CustomModelParamValue::clear_value((uint64_t)&__p);
    int v40 = 60;
    v39 = &google::protobuf::internal::fixed_address_empty_string;
  }
  std::string::basic_string[abi:ne180100](&__dst, v24, v25);
  google::protobuf::internal::ArenaStringPtr::SetNoArena(&v39, &__dst);
  if (v36 < 0) {
    operator delete((void *)__dst.n128_u64[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(&__dst, "modelData");
  v26 = google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::operator[](v22 + 24, (uint64_t)&__dst);
  v27 = (std::string *)v26;
  if (&__p != (__n128 *)v26)
  {
    CoreML::Specification::CustomModel_CustomModelParamValue::clear_value((uint64_t)v26);
    CoreML::Specification::CustomModel_CustomModelParamValue::MergeFrom(v27, (const CoreML::Specification::CustomModel_CustomModelParamValue *)&__p);
  }
  if (v36 < 0) {
    operator delete((void *)__dst.n128_u64[0]);
  }
  v28 = v41;
  id v29 = v10;
  std::string::basic_string[abi:ne180100]<0>(&v33, (char *)[v29 fileSystemRepresentation]);
  CoreML::Model::Model((CoreML::Model *)v43, v28);
  CoreML::Model::save((uint64_t)&__dst, (uint64_t)v43);
  v43[0] = &unk_1EF0DB228;
  if (v44) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v44);
  }
  if (v34 < 0) {
    operator delete(v33);
  }
  unsigned __int32 v30 = __dst.n128_u32[0] & 0xFFFFFFEF;
  if (a7 && v30)
  {
    v31 = &__dst.n128_u64[1];
    if (v37 < 0) {
      v31 = (unint64_t *)__dst.n128_u64[1];
    }
    *a7 = +[MLModelErrorUtils IOErrorWithFormat:@"Unable to save model to %@. %s", v29, v31];
  }
  if (v37 < 0) {
    operator delete((void *)__dst.n128_u64[1]);
  }
  CoreML::Specification::CustomModel_CustomModelParamValue::~CustomModel_CustomModelParamValue((CoreML::Specification::CustomModel_CustomModelParamValue *)&__p);
  if (v42) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v42);
  }

  return v30 == 0;
}

+ (BOOL)saveCustomWordTaggingModelToURL:(id)a3 modelData:(id)a4 stringInputName:(id)a5 classname:(id)a6 NSError:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  CoreML::Specification::Model::Model((CoreML::Specification::Model *)&__p);
  std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>(&v57, (const CoreML::Specification::Model *)&__p);
  CoreML::Specification::Model::~Model((CoreML::Specification::Model *)&__p);
  uint64_t v15 = v57;
  *((_DWORD *)v57 + 6) = 9;
  uint64_t v16 = *((void *)v15 + 2);
  if (!v16) {
    operator new();
  }
  uint64_t v17 = *(void *)(v16 + 160);
  if (!v17) {
    operator new();
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "A model for tagging words constructed in memory");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)(v17 + 48), &__p);
  if (SHIBYTE(v55) < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  uint64_t v18 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v16 + 16);
  id v19 = v13;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v19 UTF8String]);
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v18 + 2, &__p);
  if (SHIBYTE(v55) < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "Input text");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v18 + 3, &__p);
  if (SHIBYTE(v55) < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  uint64_t v20 = (uint64_t)v18[4];
  if (!v20) {
    operator new();
  }
  if (*(_DWORD *)(v20 + 36) != 3)
  {
    CoreML::Specification::FeatureType::clear_Type(v20);
    *(_DWORD *)(v20 + 36) = 3;
    operator new();
  }
  uint64_t v21 = v16 + 40;
  uint64_t v22 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v21);
  std::string::basic_string[abi:ne180100]<0>(&__p, "labels");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v22 + 2, &__p);
  if (SHIBYTE(v55) < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "Output labels");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v22 + 3, &__p);
  if (SHIBYTE(v55) < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  uint64_t v23 = (uint64_t)v22[4];
  if (!v23) {
    operator new();
  }
  if (*(_DWORD *)(v23 + 36) != 7)
  {
    CoreML::Specification::FeatureType::clear_Type(v23);
    *(_DWORD *)(v23 + 36) = 7;
    operator new();
  }
  uint64_t v24 = *(void *)(v23 + 24);
  if (*(_DWORD *)(v24 + 36) != 3)
  {
    CoreML::Specification::SequenceFeatureType::clear_Type(v24);
    *(_DWORD *)(v24 + 36) = 3;
    operator new();
  }
  if (*(_DWORD *)(v23 + 36) != 7)
  {
    CoreML::Specification::FeatureType::clear_Type(v23);
    *(_DWORD *)(v23 + 36) = 7;
    operator new();
  }
  uint64_t v25 = *(void *)(*(void *)(v23 + 24) + 16);
  if (!v25) {
    operator new();
  }
  *(void *)(v25 + 16) = 0;
  if (*(_DWORD *)(v23 + 36) != 7)
  {
    CoreML::Specification::FeatureType::clear_Type(v23);
    *(_DWORD *)(v23 + 36) = 7;
    operator new();
  }
  uint64_t v26 = *(void *)(*(void *)(v23 + 24) + 16);
  if (!v26) {
    operator new();
  }
  *(void *)(v26 + 24) = 10000;
  v27 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v21);
  std::string::basic_string[abi:ne180100]<0>(&__p, "locations");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v27 + 2, &__p);
  if (SHIBYTE(v55) < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "Output locations");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v27 + 3, &__p);
  if (SHIBYTE(v55) < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  uint64_t v28 = (uint64_t)v27[4];
  if (!v28) {
    operator new();
  }
  if (*(_DWORD *)(v28 + 36) != 7)
  {
    CoreML::Specification::FeatureType::clear_Type(v28);
    *(_DWORD *)(v28 + 36) = 7;
    operator new();
  }
  uint64_t v29 = *(void *)(v28 + 24);
  if (*(_DWORD *)(v29 + 36) != 1)
  {
    CoreML::Specification::SequenceFeatureType::clear_Type(v29);
    *(_DWORD *)(v29 + 36) = 1;
    operator new();
  }
  if (*(_DWORD *)(v28 + 36) != 7)
  {
    CoreML::Specification::FeatureType::clear_Type(v28);
    *(_DWORD *)(v28 + 36) = 7;
    operator new();
  }
  uint64_t v30 = *(void *)(*(void *)(v28 + 24) + 16);
  if (!v30) {
    operator new();
  }
  *(void *)(v30 + 16) = 0;
  if (*(_DWORD *)(v28 + 36) != 7)
  {
    CoreML::Specification::FeatureType::clear_Type(v28);
    *(_DWORD *)(v28 + 36) = 7;
    operator new();
  }
  uint64_t v31 = *(void *)(*(void *)(v28 + 24) + 16);
  if (!v31) {
    operator new();
  }
  *(void *)(v31 + 24) = 10000;
  v32 = google::protobuf::internal::RepeatedPtrFieldBase::Add<google::protobuf::RepeatedPtrField<CoreML::Specification::FeatureDescription>::TypeHandler>(v21);
  std::string::basic_string[abi:ne180100]<0>(&__p, "lengths");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v32 + 2, &__p);
  if (SHIBYTE(v55) < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "Output lengths");
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)v32 + 3, &__p);
  if (SHIBYTE(v55) < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  uint64_t v33 = (uint64_t)v32[4];
  if (!v33) {
    operator new();
  }
  if (*(_DWORD *)(v33 + 36) != 7)
  {
    CoreML::Specification::FeatureType::clear_Type(v33);
    *(_DWORD *)(v33 + 36) = 7;
    operator new();
  }
  uint64_t v34 = *(void *)(v33 + 24);
  if (*(_DWORD *)(v34 + 36) != 1)
  {
    CoreML::Specification::SequenceFeatureType::clear_Type(v34);
    *(_DWORD *)(v34 + 36) = 1;
    operator new();
  }
  if (*(_DWORD *)(v33 + 36) != 7)
  {
    CoreML::Specification::FeatureType::clear_Type(v33);
    *(_DWORD *)(v33 + 36) = 7;
    operator new();
  }
  uint64_t v35 = *(void *)(*(void *)(v33 + 24) + 16);
  if (!v35) {
    operator new();
  }
  *(void *)(v35 + 16) = 0;
  if (*(_DWORD *)(v33 + 36) != 7)
  {
    CoreML::Specification::FeatureType::clear_Type(v33);
    *(_DWORD *)(v33 + 36) = 7;
    operator new();
  }
  uint64_t v36 = *(void *)(*(void *)(v33 + 24) + 16);
  if (!v36) {
    operator new();
  }
  *(void *)(v36 + 24) = 10000;
  char v37 = v57;
  if (*((_DWORD *)v57 + 11) != 555)
  {
    CoreML::Specification::Model::clear_Type((uint64_t)v57);
    *((_DWORD *)v37 + 11) = 555;
    operator new();
  }
  uint64_t v38 = *((void *)v57 + 4);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[@"_MLNLPWordTaggingModel" UTF8String]);
  google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)(v38 + 48), &__p);
  if (SHIBYTE(v55) < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  CoreML::Specification::CustomModel_CustomModelParamValue::CustomModel_CustomModelParamValue((CoreML::Specification::CustomModel_CustomModelParamValue *)&__p);
  id v39 = v12;
  int v40 = (void *)[v39 bytes];
  size_t v41 = [v39 length];
  if (v56 != 60)
  {
    CoreML::Specification::CustomModel_CustomModelParamValue::clear_value((uint64_t)&__p);
    int v56 = 60;
    v55 = &google::protobuf::internal::fixed_address_empty_string;
  }
  std::string::basic_string[abi:ne180100](&__dst, v40, v41);
  google::protobuf::internal::ArenaStringPtr::SetNoArena(&v55, &__dst);
  if (v52 < 0) {
    operator delete((void *)__dst.n128_u64[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(&__dst, "modelData");
  v42 = google::protobuf::Map<std::string,CoreML::Specification::CustomModel_CustomModelParamValue>::operator[](v38 + 24, (uint64_t)&__dst);
  v43 = (std::string *)v42;
  if (&__p != (__n128 *)v42)
  {
    CoreML::Specification::CustomModel_CustomModelParamValue::clear_value((uint64_t)v42);
    CoreML::Specification::CustomModel_CustomModelParamValue::MergeFrom(v43, (const CoreML::Specification::CustomModel_CustomModelParamValue *)&__p);
  }
  if (v52 < 0) {
    operator delete((void *)__dst.n128_u64[0]);
  }
  v44 = v57;
  id v45 = v11;
  std::string::basic_string[abi:ne180100]<0>(&v49, (char *)[v45 fileSystemRepresentation]);
  CoreML::Model::Model((CoreML::Model *)v59, v44);
  CoreML::Model::save((uint64_t)&__dst, (uint64_t)v59);
  v59[0] = &unk_1EF0DB228;
  if (v60) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v60);
  }
  if (v50 < 0) {
    operator delete(v49);
  }
  unsigned __int32 v46 = __dst.n128_u32[0] & 0xFFFFFFEF;
  if (a7 && v46)
  {
    v47 = &__dst.n128_u64[1];
    if (v53 < 0) {
      v47 = (unint64_t *)__dst.n128_u64[1];
    }
    *a7 = +[MLModelErrorUtils IOErrorWithFormat:@"Unable to save model to %@. %s", v45, v47];
  }
  if (v53 < 0) {
    operator delete((void *)__dst.n128_u64[1]);
  }
  CoreML::Specification::CustomModel_CustomModelParamValue::~CustomModel_CustomModelParamValue((CoreML::Specification::CustomModel_CustomModelParamValue *)&__p);
  if (v58) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v58);
  }

  return v46 == 0;
}

@end