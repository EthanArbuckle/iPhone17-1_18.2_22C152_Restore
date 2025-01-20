@interface AXMSignificantEventDetectorNode
+ (BOOL)addSignificantEventResultToContext:(id)a3 forIdentifier:(id)a4 confidence:(double)a5 markAsSensitiveCaptionContent:(BOOL)a6;
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (BOOL)validateVisionKitSoftLinkSymbols;
- (void)evaluate:(id)a3 metrics:(id)a4;
- (void)validateVisionKitSoftLinkSymbols;
@end

@implementation AXMSignificantEventDetectorNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupported
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  BOOL v3 = (unint64_t)[v2 physicalMemory] > 0x773593FF;

  return v3;
}

+ (id)title
{
  return @"Significant Events Detector";
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  if (getVN6Mb1ME89lyW3HpahkEygIGClass())
  {
    v5.receiver = self;
    v5.super_class = (Class)AXMSignificantEventDetectorNode;
    return [(AXMVisionEngineNode *)&v5 validateVisionKitSoftLinkSymbols];
  }
  else
  {
    v4 = AXMediaLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[AXMSignificantEventDetectorNode validateVisionKitSoftLinkSymbols](v4);
    }

    return 0;
  }
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)AXMSignificantEventDetectorNode;
  id v8 = [(AXMEvaluationNode *)&v26 evaluate:v6 metrics:v7];
  context = (void *)MEMORY[0x1BA9A10B0](v8);
  request = self->_request;
  if (!request)
  {
    v10 = (VN6Mb1ME89lyW3HpahkEygIG *)objc_alloc_init((Class)getVN6Mb1ME89lyW3HpahkEygIGClass());
    v11 = self->_request;
    self->_request = v10;

    request = self->_request;
  }
  v28[0] = request;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  [(AXMEvaluationNode *)self evaluateRequests:v12 withContext:v6 requestHandlerOptions:0 metrics:v7 error:0];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v13 = [(VN6Mb1ME89lyW3HpahkEygIG *)self->_request results];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v19 = [v18 identifier];
        [v18 confidence];
        +[AXMSignificantEventDetectorNode addSignificantEventResultToContext:v6 forIdentifier:v19 confidence:0 markAsSensitiveCaptionContent:v20];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v15);
  }
}

+ (BOOL)addSignificantEventResultToContext:(id)a3 forIdentifier:(id)a4 confidence:(double)a5 markAsSensitiveCaptionContent:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  v11 = (void *)getVN3FNQUJVIs2puI1uPc9mxh7SymbolLoc_ptr_0;
  uint64_t v45 = getVN3FNQUJVIs2puI1uPc9mxh7SymbolLoc_ptr_0;
  if (!getVN3FNQUJVIs2puI1uPc9mxh7SymbolLoc_ptr_0)
  {
    v12 = (void *)VisionLibrary_9();
    v43[3] = (uint64_t)dlsym(v12, "VN3FNQUJVIs2puI1uPc9mxh7");
    getVN3FNQUJVIs2puI1uPc9mxh7SymbolLoc_ptr_0 = v43[3];
    v11 = (void *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v11)
  {
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_44:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_45:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_46:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
LABEL_47:
    __77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    goto LABEL_48;
  }
  if ([v10 isEqualToString:*v11])
  {
    v13 = AXMSignificantEventCategoryBlood;
    goto LABEL_39;
  }
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v14 = (void *)getVNSY8t4EoTztuqIL02g8uVA0SymbolLoc_ptr_0;
  uint64_t v45 = getVNSY8t4EoTztuqIL02g8uVA0SymbolLoc_ptr_0;
  if (!getVNSY8t4EoTztuqIL02g8uVA0SymbolLoc_ptr_0)
  {
    uint64_t v15 = (void *)VisionLibrary_9();
    v43[3] = (uint64_t)dlsym(v15, "VNSY8t4EoTztuqIL02g8uVA0");
    getVNSY8t4EoTztuqIL02g8uVA0SymbolLoc_ptr_0 = v43[3];
    uint64_t v14 = (void *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v14) {
    goto LABEL_44;
  }
  if ([v10 isEqualToString:*v14])
  {
    v13 = AXMSignificantEventCategoryDemonstration;
    goto LABEL_39;
  }
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v16 = (void *)getVN6XNMvaRunPpzWjGa9uUHD6SymbolLoc_ptr_0;
  uint64_t v45 = getVN6XNMvaRunPpzWjGa9uUHD6SymbolLoc_ptr_0;
  if (!getVN6XNMvaRunPpzWjGa9uUHD6SymbolLoc_ptr_0)
  {
    v17 = (void *)VisionLibrary_9();
    v43[3] = (uint64_t)dlsym(v17, "VN6XNMvaRunPpzWjGa9uUHD6");
    getVN6XNMvaRunPpzWjGa9uUHD6SymbolLoc_ptr_0 = v43[3];
    uint64_t v16 = (void *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v16) {
    goto LABEL_45;
  }
  if ([v10 isEqualToString:*v16])
  {
    v13 = AXMSignificantEventCategoryDestruction;
    goto LABEL_39;
  }
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  v18 = (void *)getVN4QuphG8kE4qDaDycivBkX5SymbolLoc_ptr_0;
  uint64_t v45 = getVN4QuphG8kE4qDaDycivBkX5SymbolLoc_ptr_0;
  if (!getVN4QuphG8kE4qDaDycivBkX5SymbolLoc_ptr_0)
  {
    v19 = (void *)VisionLibrary_9();
    v43[3] = (uint64_t)dlsym(v19, "VN4QuphG8kE4qDaDycivBkX5");
    getVN4QuphG8kE4qDaDycivBkX5SymbolLoc_ptr_0 = v43[3];
    v18 = (void *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v18) {
    goto LABEL_46;
  }
  if ([v10 isEqualToString:*v18])
  {
    v13 = AXMSignificantEventCategoryFireDevastation;
    goto LABEL_39;
  }
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  float v20 = (void *)getVN7gQUejje8mmnE9GSTsVBVVSymbolLoc_ptr_0;
  uint64_t v45 = getVN7gQUejje8mmnE9GSTsVBVVSymbolLoc_ptr_0;
  if (!getVN7gQUejje8mmnE9GSTsVBVVSymbolLoc_ptr_0)
  {
    v21 = (void *)VisionLibrary_9();
    v43[3] = (uint64_t)dlsym(v21, "VN7gQUejje8mmnE9GSTsVBVV");
    getVN7gQUejje8mmnE9GSTsVBVVSymbolLoc_ptr_0 = v43[3];
    float v20 = (void *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v20) {
    goto LABEL_47;
  }
  if ([v10 isEqualToString:*v20])
  {
    v13 = AXMSignificantEventCategoryFloodDevastation;
    goto LABEL_39;
  }
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  long long v22 = (void *)getVNa9xpOJNvRoaW9plFGZ9Eo0SymbolLoc_ptr_0;
  uint64_t v45 = getVNa9xpOJNvRoaW9plFGZ9Eo0SymbolLoc_ptr_0;
  if (!getVNa9xpOJNvRoaW9plFGZ9Eo0SymbolLoc_ptr_0)
  {
    long long v23 = (void *)VisionLibrary_9();
    v43[3] = (uint64_t)dlsym(v23, "VNa9xpOJNvRoaW9plFGZ9Eo0");
    getVNa9xpOJNvRoaW9plFGZ9Eo0SymbolLoc_ptr_0 = v43[3];
    long long v22 = (void *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v22)
  {
LABEL_48:
    v41 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v42, 8);
    _Unwind_Resume(v41);
  }
  if ([v10 isEqualToString:*v22])
  {
    v13 = AXMSignificantEventCategoryFuneral;
  }
  else
  {
    long long v24 = getVN2vIWnsZbk4Su55oeWfKDq1_0();
    char v25 = [v10 isEqualToString:v24];

    if (v25)
    {
      v13 = AXMSignificantEventCategoryHospital;
    }
    else
    {
      objc_super v26 = getVNmNJnu0xlW8CZXt6hJ7Rpb0_0();
      char v27 = [v10 isEqualToString:v26];

      if (v27)
      {
        v13 = AXMSignificantEventCategoryReligiousSetting;
      }
      else
      {
        v28 = getVN35FOB1QhtSfYGRIJvTgtTq_0();
        char v29 = [v10 isEqualToString:v28];

        if (v29)
        {
          v13 = AXMSignificantEventCategoryVehicleCrash;
        }
        else
        {
          v30 = getVN6ZsEIQ9ri2eF1vhsxw5COm_0();
          int v31 = [v10 isEqualToString:v30];

          if (!v31)
          {
LABEL_41:
            BOOL v39 = 0;
            goto LABEL_42;
          }
          v13 = &AXMSignificantEventCategoryWar;
        }
      }
    }
  }
LABEL_39:
  v32 = *v13;
  if (!v32) {
    goto LABEL_41;
  }
  v33 = v32;
  [v9 size];
  double v36 = v35;
  float v34 = a5;
  *(float *)&double v35 = v34;
  v38 = +[AXMVisionFeature significantEventClassificationWithCategory:confidence:canvasSize:](AXMVisionFeature, "significantEventClassificationWithCategory:confidence:canvasSize:", v33, v35, v36, v37);
  [v38 setCaptionMayContainSensitiveContent:v6];
  [v9 appendFeature:v38];

  BOOL v39 = 1;
LABEL_42:

  return v39;
}

- (void).cxx_destruct
{
}

- (void)validateVisionKitSoftLinkSymbols
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "Could not evaluate. VNClassifySignificantEventRequestSoft was nil", v1, 2u);
}

@end