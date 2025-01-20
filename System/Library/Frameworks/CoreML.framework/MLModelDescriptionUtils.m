@interface MLModelDescriptionUtils
+ (BOOL)saveModelDescription:(id)a3 toSpecification:(void *)a4 error:(id *)a5;
+ (BOOL)validateAllFeatureDescriptions:(id)a3 hasAnyFeatureTypeIn:(id)a4 minimalCount:(unint64_t)a5 maximumCount:(unint64_t)a6 debugLabel:(id)a7 error:(id *)a8;
+ (void)copyFeatureDescriptionFrom:(id)a3 to:(void *)a4 error:(id *)a5;
+ (void)createFeatureTypeFromFeatureDescription:(id)a3 error:(id *)a4;
+ (void)createMetaData:(id)a3;
+ (void)createModelDescription:(id)a3 error:(id *)a4;
+ (void)getArrayFeatureTypeFromConstraint:(id)a3;
+ (void)getDictionaryFeatureTypeFromConstraint:(id)a3 error:(id *)a4;
+ (void)getImageFeatureTypeFromConstraint:(id)a3;
+ (void)getSequenceFeatureTypeFromConstraint:(id)a3 error:(id *)a4;
+ (void)getStateFeatureTypeFromConstraint:(id)a3;
@end

@implementation MLModelDescriptionUtils

+ (BOOL)validateAllFeatureDescriptions:(id)a3 hasAnyFeatureTypeIn:(id)a4 minimalCount:(unint64_t)a5 maximumCount:(unint64_t)a6 debugLabel:(id)a7 error:(id *)a8
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v39 = a4;
  v34 = v12;
  id v35 = a7;
  unint64_t v13 = [v12 count];
  unint64_t v14 = v13;
  if (v13 < a5)
  {
    v15 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v51 = v35;
      __int16 v52 = 2048;
      unint64_t v53 = a5;
      __int16 v54 = 2048;
      unint64_t v55 = v14;
      _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, "%{public}@: There must be at least %tu features, but there is only %tu.", buf, 0x20u);
    }

    if (a8)
    {
      id v16 = +[MLModelErrorUtils genericErrorWithFormat:@"%@: There must be at least %tu features, but there is only %tu.", v35, a5, v14];
LABEL_11:
      BOOL v18 = 0;
      *a8 = v16;
      goto LABEL_35;
    }
    goto LABEL_12;
  }
  if (v13 > a6)
  {
    v17 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v51 = v35;
      __int16 v52 = 2048;
      unint64_t v53 = a6;
      __int16 v54 = 2048;
      unint64_t v55 = v14;
      _os_log_error_impl(&dword_19E58B000, v17, OS_LOG_TYPE_ERROR, "%{public}@: There must be at most %tu features, but there is %tu.", buf, 0x20u);
    }

    if (a8)
    {
      id v16 = +[MLModelErrorUtils genericErrorWithFormat:@"%@: There must be at most %tu features, but there is %tu.", v35, a6, v14];
      goto LABEL_11;
    }
LABEL_12:
    BOOL v18 = 0;
    goto LABEL_35;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v12;
  uint64_t v19 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v19)
  {
    uint64_t v38 = *(void *)v45;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v45 != v38) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v21, "type"));
        char v23 = [v39 containsObject:v22];

        if ((v23 & 1) == 0)
        {
          v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v39, "count"));
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v25 = v39;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v26)
          {
            uint64_t v27 = *(void *)v41;
            do
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v41 != v27) {
                  objc_enumerationMutation(v25);
                }
                v29 = +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", [*(id *)(*((void *)&v40 + 1) + 8 * j) integerValue]);
                [v24 addObject:v29];
              }
              uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v48 count:16];
            }
            while (v26);
          }

          v30 = [v24 componentsJoinedByString:@", "];
          v31 = +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", [v21 type]);
          v32 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            id v51 = v35;
            __int16 v52 = 2114;
            unint64_t v53 = (unint64_t)v30;
            __int16 v54 = 2114;
            unint64_t v55 = (unint64_t)v31;
            _os_log_error_impl(&dword_19E58B000, v32, OS_LOG_TYPE_ERROR, "%{public}@: The feature type must be one of {%{public}@}, but it is %{public}@.", buf, 0x20u);
          }

          if (a8)
          {
            *a8 = +[MLModelErrorUtils genericErrorWithFormat:@"%@: The feature type must be one of {%@}, but it is %@.", v35, v30, v31];

            BOOL v18 = 0;
            goto LABEL_34;
          }
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
  BOOL v18 = 1;
LABEL_34:

LABEL_35:
  return v18;
}

+ (BOOL)saveModelDescription:(id)a3 toSpecification:(void *)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = *(void *)a4;
  uint64_t v9 = *(void *)(*(void *)a4 + 16);
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  *(void *)(v8 + 16) = 0;
  id v17 = 0;
  v10 = +[MLModelDescriptionUtils createModelDescription:v7 error:&v17];
  id v11 = v17;
  id v12 = v11;
  if (v10)
  {
    uint64_t v13 = *(void *)(v8 + 16);
    if (v13) {
      (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
    }
    *(void *)(v8 + 16) = v10;
    if (a5) {
      *a5 = v12;
    }
    BOOL v14 = v12 == 0;
  }
  else if (a5)
  {
    if (v11)
    {
      id v15 = v11;
    }
    else
    {
      id v15 = +[MLModelErrorUtils genericErrorWithFormat:@"Could not save MLModelDescription to MLModelSpecification"];
    }
    BOOL v14 = 0;
    *a5 = v15;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (void)createModelDescription:(id)a3 error:(id *)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  operator new();
}

+ (void)copyFeatureDescriptionFrom:(id)a3 to:(void *)a4 error:(id *)a5
{
  id v7 = a3;
  if (a4)
  {
    CoreML::Specification::FeatureDescription::Clear((CoreML::Specification::FeatureDescription *)a4);
    id v8 = [v7 name];
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v8 UTF8String]);
    google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)a4 + 2, &__p);
    if (v13 < 0) {
      operator delete((void *)__p.n128_u64[0]);
    }

    id v9 = [v7 description];
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v9 UTF8String]);
    google::protobuf::internal::ArenaStringPtr::SetNoArena((long long **)a4 + 3, &__p);
    if (v13 < 0) {
      operator delete((void *)__p.n128_u64[0]);
    }

    v10 = +[MLModelDescriptionUtils createFeatureTypeFromFeatureDescription:v7 error:a5];
    uint64_t v11 = *((void *)a4 + 4);
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
    }
    *((void *)a4 + 4) = v10;
  }
}

+ (void)createFeatureTypeFromFeatureDescription:(id)a3 error:(id *)a4
{
  id v4 = a3;
  operator new();
}

+ (void)getSequenceFeatureTypeFromConstraint:(id)a3 error:(id *)a4
{
  id v4 = a3;
  operator new();
}

+ (void)getDictionaryFeatureTypeFromConstraint:(id)a3 error:(id *)a4
{
  id v4 = a3;
  operator new();
}

+ (void)getStateFeatureTypeFromConstraint:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (a3) {
    operator new();
  }

  return 0;
}

+ (void)getArrayFeatureTypeFromConstraint:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (a3) {
    operator new();
  }

  return 0;
}

+ (void)getImageFeatureTypeFromConstraint:(id)a3
{
  if (a3) {
    operator new();
  }

  return 0;
}

+ (void)createMetaData:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  operator new();
}

@end