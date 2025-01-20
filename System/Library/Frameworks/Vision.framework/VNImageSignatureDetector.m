@interface VNImageSignatureDetector
+ (id)configurationOptionKeysForDetectorKey;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8;
- (shared_ptr<vision::mod::ImageDescriptorBufferAbstract>)_calculateImageSignatureHashDescriptorFrom:(const void *)a3 options:(id)a4 error:(id *)a5;
- (shared_ptr<vision::mod::ImageDescriptorBufferAbstract>)_calculateImageSignatureprintDescriptorFromOptions:(id)a3 error:(id *)a4;
- (unint64_t)imageSignatureHashType;
- (unint64_t)imageSignatureprintType;
@end

@implementation VNImageSignatureDetector

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__VNImageSignatureDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNImageSignatureDetector configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNImageSignatureDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNImageSignatureDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __65__VNImageSignatureDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNImageSignatureDetector;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 addObject:@"VNImageSignatureDetectorInitOption_ImageSignatureprintType"];
  [v2 addObject:@"VNImageSignatureDetectorInitOption_ImageSignatureHashType"];
  uint64_t v3 = [v2 copy];
  v4 = (void *)+[VNImageSignatureDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNImageSignatureDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"VNComputeStageMain";
  v4 = +[VNComputeDeviceUtilities allCPUComputeDevices];
  v8[0] = v4;
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  return self;
}

- (void).cxx_destruct
{
  value = self->_hyperplaneLSHProcessor.__ptr_.__value_;
  self->_hyperplaneLSHProcessor.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (unint64_t)imageSignatureHashType
{
  return self->_imageSignatureHashType;
}

- (unint64_t)imageSignatureprintType
{
  return self->_imageSignatureprintType;
}

- (shared_ptr<vision::mod::ImageDescriptorBufferAbstract>)_calculateImageSignatureHashDescriptorFrom:(const void *)a3 options:(id)a4 error:(id *)a5
{
  v9 = v5;
  id v10 = a4;
  uint64_t v16 = 0;
  if (!+[VNValidationUtilities getNSUIntegerValue:&v16 forKey:@"VNImageSignatureDetectorInitOption_ImageSignatureHashType" inOptions:v10 error:a5])
  {
LABEL_7:
    void *v9 = 0;
    v9[1] = 0;
    goto LABEL_8;
  }
  uint64_t v11 = v16;
  if (v11 != [(VNImageSignatureDetector *)self imageSignatureHashType])
  {
    if (a5)
    {
      *a5 = +[VNError errorForInvalidArgumentWithLocalizedDescription:@"Mismatch in signature hash type"];
    }
    goto LABEL_7;
  }
  (*(void (**)(long long *__return_ptr))(*(void *)self->_hyperplaneLSHProcessor.__ptr_.__value_ + 64))(&v15);
  v12 = (void *)(*(uint64_t (**)(ImageDescriptorProcessorHyperplaneLSH *, void, void))(*(void *)self->_hyperplaneLSHProcessor.__ptr_.__value_ + 160))(self->_hyperplaneLSHProcessor.__ptr_.__value_, *(void *)a3, v15);
  if (v12 == 128)
  {
    *(_OWORD *)v9 = v15;
  }
  else
  {
    if (a5)
    {
      VNErrorForCVMLStatus(v12);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    void *v9 = 0;
    v9[1] = 0;
    if (*((void *)&v15 + 1)) {
      std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v15 + 1));
    }
  }
LABEL_8:

  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (shared_ptr<vision::mod::ImageDescriptorBufferAbstract>)_calculateImageSignatureprintDescriptorFromOptions:(id)a3 error:(id *)a4
{
  v7 = v4;
  id v8 = a3;
  id v23 = 0;
  BOOL v9 = +[VNValidationUtilities getOptionalObject:&v23 ofClass:objc_opt_class() forKey:@"VNImageSignatureDetectorProcessOption_ImageSignatureprintInput" inOptions:v8 error:a4];
  id v10 = v23;
  if (!v9) {
    goto LABEL_11;
  }
  uint64_t v22 = 0;
  if (!+[VNValidationUtilities getNSUIntegerValue:&v22 forKey:@"VNImageSignatureDetectorInitOption_ImageSignatureprintType" inOptions:v8 error:a4])goto LABEL_11; {
  uint64_t v11 = v22;
  }
  if (v11 != [(VNImageSignatureDetector *)self imageSignatureprintType])
  {
    if (a4)
    {
      v18 = +[VNError errorForInvalidArgumentWithLocalizedDescription:@"Mismatch in signature print type"];
LABEL_10:
      *a4 = v18;
    }
LABEL_11:
    void *v7 = 0;
    v7[1] = 0;
    goto LABEL_12;
  }
  if (v22 != 3)
  {
    if (a4)
    {
      v18 = +[VNError errorForInvalidArgumentWithLocalizedDescription:@"Unknown signature print type"];
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v12 = [v10 descriptorData];
  v13 = (void *)[v12 bytes];
  uint64_t v14 = [v10 elementCount];
  long long v15 = operator new(0x90uLL);
  v15[1] = 0;
  v15[2] = 0;
  *long long v15 = &unk_1EF7539A0;
  uint64_t v16 = vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((vision::mod::ImageDescriptorBufferAbstract *)(v15 + 3), v13, 4 * v14, 1, 0);
  v15[3] = &unk_1EF752918;
  *((_DWORD *)v15 + 32) = 1;
  v15[17] = 0;
  v15[15] = v14 & 0x3FFFFFFFFFFFFFFFLL;
  *(void *)&long long v17 = v16;
  *((void *)&v17 + 1) = v15;
  long long v21 = v17;

  *(_OWORD *)v7 = v21;
LABEL_12:

  result.var1 = v20;
  result.var0 = v19;
  return result;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a6;
  id v14 = a8;
  long long v15 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v12 error:a7];
  if (v15)
  {
    uint64_t v16 = [(VNDetector *)self computeDeviceForComputeStage:@"VNComputeStageMain" processingOptions:v12 error:a7];
    if (v16)
    {
      [(VNImageSignatureDetector *)self _calculateImageSignatureprintDescriptorFromOptions:v12 error:a7];
      if (v28)
      {
        unint64_t v17 = (*(uint64_t (**)(void *))(*v28 + 104))(v28);
        v18 = [VN6Ac6Cyl5O5oK19HboyMBR alloc];
        v19 = [(VN6Ac6Cyl5O5oK19HboyMBR *)v18 initWithData:v28[7] elementCount:v17 >> 2 elementType:1 lengthInBytes:v17 imageSignatureprintType:[(VNImageSignatureDetector *)self imageSignatureprintType] originatingRequestSpecifier:v15];
        [(VNImageSignatureDetector *)self _calculateImageSignatureHashDescriptorFrom:&v28 options:v12 error:a7];
        if (v26)
        {
          unint64_t v20 = (*(uint64_t (**)())(*v26 + 104))();
          long long v21 = [[VN6B8mkraBUpwUqskMYPtS3 alloc] initWithData:v26[7] elementCount:v20 >> 2 elementType:1 lengthInBytes:v20 imageSignatureHashType:[(VNImageSignatureDetector *)self imageSignatureHashType] requestRevision:1];
          uint64_t v22 = [[VN3XKGTKNBvy6h4RFtpxLyW alloc] initWithOriginatingRequestSpecifier:v15 imageSignatureprint:v19 imageSignatureHash:v21];
          id v23 = v22;
          if (v22)
          {
            v30[0] = v22;
            v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
          }
          else if (a7)
          {
            +[VNError errorForInternalErrorWithLocalizedDescription:@"Unknown error creating VNObservation object"];
            v24 = 0;
            *a7 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v24 = 0;
          }
        }
        else
        {
          v24 = 0;
        }
        if (v27) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v27);
        }
      }
      else
      {
        v24 = 0;
      }
      if (v29) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v29);
      }
    }
    else
    {
      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)VNImageSignatureDetector;
  if (-[VNDetector completeInitializationForSession:error:](&v11, sel_completeInitializationForSession_error_, a3))
  {
    v6 = [(VNDetector *)self configurationOptions];
    if (+[VNValidationUtilities getNSUIntegerValue:forKey:inOptions:error:](VNValidationUtilities, "getNSUIntegerValue:forKey:inOptions:error:", &self->_imageSignatureprintType, @"VNImageSignatureDetectorInitOption_ImageSignatureprintType", v6, a4)&& +[VNValidationUtilities getNSUIntegerValue:&self->_imageSignatureHashType forKey:@"VNImageSignatureDetectorInitOption_ImageSignatureHashType" inOptions:v6 error:a4])
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __67__VNImageSignatureDetector_completeInitializationForSession_error___block_invoke;
      aBlock[3] = &unk_1E5B1FBB0;
      aBlock[4] = self;
      v7 = (uint64_t (**)(void *, __CFString *, id *))_Block_copy(aBlock);
      if ([(VNImageSignatureDetector *)self imageSignatureprintType] == 3)
      {
        LOBYTE(a4) = v7[2](v7, @"neuralhash_128x96_seed1", a4);
      }
      else if (a4)
      {
        id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown signature print type: %lu", -[VNImageSignatureDetector imageSignatureprintType](self, "imageSignatureprintType"));
        *a4 = +[VNError errorForInvalidArgumentWithLocalizedDescription:v8];

        LOBYTE(a4) = 0;
      }
    }
    else
    {
      LOBYTE(a4) = 0;
    }
  }
  else
  {
    LOBYTE(a4) = 0;
  }
  return (char)a4;
}

BOOL __67__VNImageSignatureDetector_completeInitializationForSession_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 72);
  if (v7 == 1)
  {
    id v8 = v5;
    BOOL v9 = VNFrameworkBundle();
    id v10 = [v9 pathForResource:v8 ofType:@"dat"];
    if (v10)
    {

      [v10 UTF8String];
      operator new();
    }
    uint64_t v13 = [[NSString alloc] initWithFormat:@"Model file %@.dat is missing", v8];
    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"Loading Resource Error" reason:v13 userInfo:0];
    objc_exception_throw(v14);
  }
  if (a3)
  {
    objc_super v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown signature hash type: %lu", objc_msgSend(*(id *)(a1 + 32), "imageSignatureHashType"));
    *a3 = +[VNError errorForInvalidArgumentWithLocalizedDescription:v11];
  }
  return v7 == 1;
}

@end