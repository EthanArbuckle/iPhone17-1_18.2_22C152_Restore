@interface ANSTAlgorithm
+ (Class)_concreteClassOfVersion:(unint64_t)a3;
+ (id)new;
+ (unint64_t)_version;
- (ANSTAlgorithm)init;
- (ANSTAlgorithm)initWithConfiguration:(id)a3;
- (BOOL)prepareWithError:(id *)a3;
- (__CVBuffer)createPixelBuffer:(unsigned int)a3 width:(unint64_t)a4 height:(unint64_t)a5;
- (__CVPixelBufferPool)pixelBufferPoolCreateWithMinCapacity:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(unsigned int)a6;
- (unint64_t)version;
@end

@implementation ANSTAlgorithm

+ (id)new
{
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTAlgorithm)init
{
  id result = (ANSTAlgorithm *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (unint64_t)version
{
  v2 = objc_opt_class();
  return objc_msgSend__version(v2, v3, v4);
}

+ (unint64_t)_version
{
  unint64_t result = objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

+ (Class)_concreteClassOfVersion:(unint64_t)a3
{
  return 0;
}

- (ANSTAlgorithm)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ANSTAlgorithm;
  v5 = [(ANSTAlgorithm *)&v19 init];
  if (v5)
  {
    v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_version(v4, v7, v8);
    uint64_t v11 = objc_msgSend__concreteClassOfVersion_(v6, v10, v9);
    if (v11)
    {
      v12 = (objc_class *)v11;
      v13 = objc_opt_class();
      if ((objc_msgSend_isSubclassOfClass_(v13, v14, (uint64_t)v12) & 1) == 0)
      {
        id v15 = [v12 alloc];
        uint64_t v17 = objc_msgSend_initWithConfiguration_(v15, v16, (uint64_t)v4);

        v5 = (ANSTAlgorithm *)v17;
      }
    }
  }

  return v5;
}

- (BOOL)prepareWithError:(id *)a3
{
  id v4 = objc_opt_class();
  uint64_t v6 = objc_msgSend_methodForSelector_(v4, v5, (uint64_t)sel__version);
  uint64_t v8 = objc_msgSend_methodForSelector_(ANSTAlgorithm, v7, (uint64_t)sel__version);
  uint64_t v10 = v8;
  if (a3 && v6 == v8)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v9, @"ANSTErrorDomain", 1, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 != v10;
}

- (__CVBuffer)createPixelBuffer:(unsigned int)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  v22[4] = *MEMORY[0x263EF8340];
  v21[0] = *MEMORY[0x263F04240];
  uint64_t v8 = objc_msgSend_numberWithUnsignedLong_(NSNumber, a2, a4);
  v22[0] = v8;
  v21[1] = *MEMORY[0x263F04118];
  uint64_t v10 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v9, a5);
  v22[1] = v10;
  v21[2] = *MEMORY[0x263F04180];
  v12 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v11, v7);
  v21[3] = *MEMORY[0x263F04130];
  v22[2] = v12;
  v22[3] = MEMORY[0x263EFFA78];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v13, (uint64_t)v22, v21, 4);
  CFDictionaryRef v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  CVPixelBufferRef v20 = 0;
  CVReturn v15 = CVPixelBufferCreate(0, a4, a5, v7, v14, &v20);
  if (v15)
  {
    int v16 = v15;
    uint64_t v17 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_246D99E48(v16, v17);
    }

    v18 = 0;
  }
  else
  {
    v18 = v20;
  }

  return v18;
}

- (__CVPixelBufferPool)pixelBufferPoolCreateWithMinCapacity:(unint64_t)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  v29[1] = *MEMORY[0x263EF8340];
  CVPixelBufferPoolRef v25 = 0;
  uint64_t v28 = *MEMORY[0x263F041C0];
  uint64_t v9 = objc_msgSend_numberWithUnsignedLong_(NSNumber, a2, a3);
  v29[0] = v9;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v29, &v28, 1);
  CFDictionaryRef v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v26[0] = *MEMORY[0x263F04240];
  v13 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v12, a4);
  v27[0] = v13;
  v26[1] = *MEMORY[0x263F04118];
  CVReturn v15 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v14, a5);
  v27[1] = v15;
  v26[2] = *MEMORY[0x263F04180];
  uint64_t v17 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v16, v6);
  v26[3] = *MEMORY[0x263F04130];
  v27[2] = v17;
  v27[3] = MEMORY[0x263EFFA78];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v18, (uint64_t)v27, v26, 4);
  CFDictionaryRef v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  CVReturn v20 = CVPixelBufferPoolCreate(0, v11, v19, &v25);
  if (v20)
  {
    int v21 = v20;
    v22 = _ANSTLoggingGetOSLogForCategoryANSTKit();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_246D9AB3C(v21, v22);
    }

    v23 = 0;
  }
  else
  {
    v23 = v25;
  }

  return v23;
}

@end