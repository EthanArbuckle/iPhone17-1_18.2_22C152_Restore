@interface CHSingletonMLModel
+ (id)modelWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
+ (unint64_t)powerLogModelNameForModelKey:(id)a3;
+ (void)releaseModelWithKey:(id)a3;
- (MLModelConfiguration)configuration;
- (MLModelDescription)modelDescription;
- (NSString)modelKey;
- (id)model;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (int64_t)usageCount;
@end

@implementation CHSingletonMLModel

+ (id)modelWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  self;
  if (qword_1EA3C92B8 != -1) {
    dispatch_once(&qword_1EA3C92B8, &unk_1F2012C70);
  }
  v14 = objc_msgSend_relativePath(v7, v9, v10, v11, v12, v13);
  v15 = qword_1EA3C92B0;
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = sub_1C4A489F4;
  v29 = &unk_1E64E2578;
  id v16 = v14;
  id v30 = v16;
  id v17 = v7;
  id v31 = v17;
  id v18 = v8;
  id v32 = v18;
  v33 = a5;
  dispatch_sync(v15, &v26);
  uint64_t v23 = objc_msgSend_objectForKey_((void *)qword_1EA3C92A0, v19, (uint64_t)v16, v20, v21, v22, v26, v27, v28, v29);
  v24 = (void *)v23;
  if (v23) {
    ++*(void *)(v23 + 16);
  }

  return v24;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_1C4A48D88;
  id v30 = sub_1C4A48D98;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_1C4A48D88;
  v24 = sub_1C4A48D98;
  id v25 = 0;
  uint64_t v10 = qword_1EA3C92B0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4A48DA0;
  block[3] = &unk_1E64E2C58;
  id v18 = &v26;
  block[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  v19 = &v20;
  dispatch_sync(v10, block);
  if (a5) {
    *a5 = (id) v21[5];
  }
  id v13 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (id)model
{
  return self->_model;
}

- (MLModelDescription)modelDescription
{
  return (MLModelDescription *)objc_msgSend_modelDescription(self->_model, a2, v2, v3, v4, v5);
}

- (MLModelConfiguration)configuration
{
  return (MLModelConfiguration *)objc_msgSend_configuration(self->_model, a2, v2, v3, v4, v5);
}

- (int64_t)usageCount
{
  return self->_modelUseCount;
}

+ (void)releaseModelWithKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = qword_1EA3C92B0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4A48ED4;
  block[3] = &unk_1E64E0D48;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

+ (unint64_t)powerLogModelNameForModelKey:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_hasSuffix_(v3, v4, @"ctc_latn.bundle", v5, v6, v7))
  {

    return 4;
  }
  else if (objc_msgSend_hasSuffix_(v3, v8, @"ctc_zh.bundle", v9, v10, v11))
  {

    return 5;
  }
  else if (objc_msgSend_hasSuffix_(v3, v13, @"ctc_ja.bundle", v14, v15, v16))
  {

    return 6;
  }
  else if (objc_msgSend_hasSuffix_(v3, v17, @"ctc_ko.bundle", v18, v19, v20))
  {

    return 7;
  }
  else if (objc_msgSend_hasSuffix_(v3, v21, @"ctc_th.bundle", v22, v23, v24))
  {

    return 8;
  }
  else if ((objc_msgSend_hasSuffix_(v3, v25, @"ctc_cyrl.bundle", v26, v27, v28) & 1) != 0 {
         || (objc_msgSend_hasSuffix_(v3, v29, @"ctc_ar.bundle", v30, v31, v32) & 1) != 0)
  }
  {

    return 9;
  }
  else
  {
    if (objc_msgSend_hasSuffix_(v3, v33, @"ctc_vi.bundle", v34, v35, v36)) {
      unint64_t v37 = 11;
    }
    else {
      unint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
    }

    return v37;
  }
}

- (NSString)modelKey
{
  return self->_modelKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_modelKey, 0);
}

@end