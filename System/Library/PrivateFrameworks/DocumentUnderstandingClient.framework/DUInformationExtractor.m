@interface DUInformationExtractor
+ (id)sharedExtractor;
- (id)mockAttributes;
- (void)requestExtractionOfPersonalIDFromDocument:(id)a3 completion:(id)a4;
@end

@implementation DUInformationExtractor

- (void)requestExtractionOfPersonalIDFromDocument:(id)a3 completion:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, DUPersonalIDResult *, void))a4;
  if (+[DocumentUnderstandingFeatureFlagReader isFoundInUseLLMEnabled])
  {
    v8 = [(DUInformationExtractor *)self mockAttributes];
    if (v8)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "[DUInformationExtractor] Returns DUMockPersonalIDResult from user defaults, skipping XPC call to textunderstandingd", buf, 2u);
      }
      v9 = -[DUPersonalIDResult initWithResultType:attributes:isPartialExtraction:]([DUPersonalIDResult alloc], "initWithResultType:attributes:isPartialExtraction:", [v6 type], v8, 0);
      v7[2](v7, v9, 0);
    }
    else
    {
      v12 = +[DUXPCClient sharedInstance];
      uint64_t v13 = getpid();
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_24CF7D0D8;
      v14[3] = &unk_2652FA980;
      v15 = v7;
      [v12 requestExtractionOfPersonalIDFromDocument:v6 pid:v13 completion:v14];

      v9 = v15;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "[DUInformationExtractor] FoundInUseLLM disabled, skipping XPC call to textunderstandingd", buf, 2u);
    }
    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08320];
    v18[0] = @"Extraction feature is not enabled";
    v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v8 = [v10 errorWithDomain:@"DUInformationExtractorErrorDomain" code:0 userInfo:v11];

    ((void (**)(id, DUPersonalIDResult *, void *))v7)[2](v7, 0, v8);
  }
}

- (id)mockAttributes
{
  if (qword_26B182BA8 != -1) {
    dispatch_once(&qword_26B182BA8, &unk_26FF53C18);
  }
  v2 = (void *)qword_269848780;
  return v2;
}

+ (id)sharedExtractor
{
  if (qword_26B182BA0 != -1) {
    dispatch_once(&qword_26B182BA0, &unk_26FF53BF8);
  }
  v2 = (void *)qword_26B182BB0;
  return v2;
}

@end