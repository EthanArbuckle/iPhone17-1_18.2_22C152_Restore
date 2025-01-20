@interface HMDBackingStoreCacheFetchModelObjectResult
- (CKRecord)record;
- (HMDBackingStoreCacheFetchModelObjectResult)initWithRecord:(id)a3 data:(id)a4 encoding:(unint64_t)a5 error:(id *)a6;
- (HMDBackingStoreModelObject)object;
@end

@implementation HMDBackingStoreCacheFetchModelObjectResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

- (HMDBackingStoreModelObject)object
{
  return self->_object;
}

- (CKRecord)record
{
  return self->_record;
}

- (HMDBackingStoreCacheFetchModelObjectResult)initWithRecord:(id)a3 data:(id)a4 encoding:(unint64_t)a5 error:(id *)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HMDBackingStoreCacheFetchModelObjectResult;
  v12 = [(HMDBackingStoreCacheFetchModelObjectResult *)&v25 init];
  if (!v12) {
    goto LABEL_13;
  }
  if (v10 && v11)
  {
    v13 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v10 error:0];
    uint64_t v14 = [objc_alloc(MEMORY[0x263EFD7C8]) initWithCoder:v13];
    record = v12->_record;
    v12->_record = (CKRecord *)v14;

    if (a5)
    {
      uint64_t v16 = +[HMDBackingStoreModelObject objectFromData:v11 encoding:a5 error:a6];
      object = v12->_object;
      v12->_object = (HMDBackingStoreModelObject *)v16;
    }
    if (*a6)
    {
      v18 = (void *)MEMORY[0x230FBD990]();
      v19 = v12;
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = HMFGetLogIdentifier();
        id v22 = *a6;
        *(_DWORD *)buf = 138543618;
        v27 = v21;
        __int16 v28 = 2112;
        id v29 = v22;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@unable to decode cached object %@", buf, 0x16u);
      }
    }
    else if (v12->_object)
    {
      v23 = v12;
      goto LABEL_16;
    }
    v23 = 0;
LABEL_16:

    goto LABEL_17;
  }
  if (a6)
  {
    [MEMORY[0x263F087E8] hmfErrorWithCode:8];
    v23 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_13:
    v23 = 0;
  }
LABEL_17:

  return v23;
}

@end