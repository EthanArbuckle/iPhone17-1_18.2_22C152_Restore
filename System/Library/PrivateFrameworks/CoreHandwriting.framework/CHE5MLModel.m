@interface CHE5MLModel
+ (id)createProgramLibraryWithError:(id *)a3;
+ (id)defaultURLOfModelInThisBundle;
+ (id)inputNames;
+ (id)modelHash;
+ (id)outputNames;
@end

@implementation CHE5MLModel

+ (id)modelHash
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4C00D48;
  block[3] = &unk_1E64E1AA8;
  block[4] = a1;
  if (qword_1EA3C9578 == -1)
  {
    v2 = (void *)qword_1EA3C9570;
  }
  else
  {
    dispatch_once(&qword_1EA3C9578, block);
    v2 = (void *)qword_1EA3C9570;
  }
  return v2;
}

+ (id)createProgramLibraryWithError:(id *)a3
{
  v7 = objc_msgSend_defaultURLOfModelInThisBundle(a1, a2, (uint64_t)a3, v3, v4, v5);
  if (v7)
  {
    v12 = v7;
    v13 = objc_msgSend_URLByAppendingPathComponent_(v7, v8, @"model.specialization.bundle", v9, v10, v11);
    if (objc_msgSend_checkResourceIsReachableAndReturnError_(v13, v14, 0, v15, v16, v17))
    {
      id v18 = v13;

      v12 = v18;
    }
    v19 = [CHE5MLProgramLibrary alloc];
    uint64_t v23 = objc_msgSend_initWithModelURL_error_(v19, v20, (uint64_t)v12, (uint64_t)a3, v21, v22);

    v24 = (void *)v23;
  }
  else
  {
    v24 = 0;
  }
  return v24;
}

+ (id)defaultURLOfModelInThisBundle
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Subclasses must override this method.", 0, v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)inputNames
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Subclasses must override this method.", 0, v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)outputNames
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"Subclasses must override this method.", 0, v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end