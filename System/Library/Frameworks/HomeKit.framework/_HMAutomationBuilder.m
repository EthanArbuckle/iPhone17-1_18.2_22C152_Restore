@interface _HMAutomationBuilder
+ (void)adoptExternalCategoriesFromClasses:(Class)a3;
- (HMHome)home;
- (NSUUID)uniqueIdentifier;
- (_HMAutomationBuilder)initWithContext:(id)a3 home:(id)a4;
- (id)assistantIdentifier;
- (id)uuid;
@end

@implementation _HMAutomationBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (HMHome)home
{
  return self->_home;
}

- (_HMAutomationBuilder)initWithContext:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v14 = (void *)_HMFPreconditionFailure();
    +[_HMAutomationBuilder adoptExternalCategoriesFromClasses:v16];
    return result;
  }
  v17.receiver = self;
  v17.super_class = (Class)_HMAutomationBuilder;
  v10 = [(_HMAutomationBuilder *)&v17 init];
  if (v10)
  {
    uint64_t v11 = HMTransientIdentifier();
    uniqueIdentifier = v10->_uniqueIdentifier;
    v10->_uniqueIdentifier = (NSUUID *)v11;

    objc_storeStrong((id *)&v10->_context, a3);
    objc_storeStrong((id *)&v10->_home, a4);
  }

  return v10;
}

+ (void)adoptExternalCategoriesFromClasses:(Class)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v34 = (Class *)&v46;
  v28[0] = [a1 methodForSelector:a2];
  if (a3)
  {
    uint64_t v6 = 0;
    uint64_t v32 = 0;
    *(void *)&long long v5 = 138544386;
    long long v29 = v5;
    do
    {
      unsigned int outCount = 0;
      id v7 = class_copyMethodList(a3, &outCount);
      if (outCount)
      {
        id v8 = v7;
        v28[1] = v28;
        unint64_t v9 = 8 * (outCount + 1);
        v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFF0);
        if (v9 >= 0x200) {
          size_t v11 = 512;
        }
        else {
          size_t v11 = 8 * (outCount + 1);
        }
        bzero((char *)v28 - ((v9 + 15) & 0xFFFFFFFF0), v11);
        unsigned int v12 = outCount;
        v13 = &v28[-4 * outCount - 4];
        if (outCount)
        {
          for (unint64_t i = 0; i < outCount; ++i)
          {
            *(void *)&v10[8 * i] = method_getImplementation(v8[i]);
            unsigned int v12 = outCount;
          }
        }
        *(void *)&v10[8 * v12] = v28[0];
        _dyld_images_for_addresses();
        uint64_t v15 = outCount;
        if (outCount)
        {
          v30 = v13;
          Class v31 = a3;
          unint64_t v16 = 0;
          objc_super v17 = v13 + 3;
          do
          {
            if (*v17 != v13[4 * v15 + 3])
            {
              Name = method_getName(v8[v16]);
              v19 = *(void (**)(void))&v10[8 * v16];
              TypeEncoding = method_getTypeEncoding(v8[v16]);
              if (!class_addMethod((Class)a1, Name, v19, TypeEncoding))
              {
                uint64_t v21 = *v17;
                if (*v17 != v6)
                {
                  uint64_t v32 = dyld_image_path_containing_address();
                  uint64_t v6 = v21;
                }
                v22 = (void *)MEMORY[0x19F3A64A0]();
                v23 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                {
                  HMFGetLogIdentifier();
                  v25 = uint64_t v24 = v6;
                  v26 = NSStringFromSelector(Name);
                  *(_DWORD *)buf = v29;
                  v36 = v25;
                  __int16 v37 = 2112;
                  id v38 = a1;
                  __int16 v39 = 2112;
                  Class v40 = v31;
                  __int16 v41 = 2112;
                  v42 = v26;
                  __int16 v43 = 2080;
                  uint64_t v44 = v32;
                  _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@%@: Did not adopt -[%@ %@] defined in %s", buf, 0x34u);

                  uint64_t v6 = v24;
                  v13 = v30;
                }
              }
            }
            ++v16;
            uint64_t v15 = outCount;
            v17 += 4;
          }
          while (v16 < outCount);
        }
        free(v8);
      }
      v27 = v34++;
      a3 = *v27;
    }
    while (*v27);
  }
}

- (id)assistantIdentifier
{
  return &stru_1EEE9DD88;
}

- (id)uuid
{
  return 0;
}

@end