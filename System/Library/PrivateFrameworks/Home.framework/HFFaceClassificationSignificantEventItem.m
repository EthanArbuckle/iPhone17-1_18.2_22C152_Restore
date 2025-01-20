@interface HFFaceClassificationSignificantEventItem
+ (id)dateFormatter;
- (HFFaceClassificationSignificantEventItem)initWithSignificantEvent:(id)a3 home:(id)a4;
- (HMFaceClassification)faceClassification;
- (HMPerson)person;
- (HMPersonManager)personManager;
- (UIImage)faceCropImage;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setFaceCropImage:(id)a3;
@end

@implementation HFFaceClassificationSignificantEventItem

+ (id)dateFormatter
{
  if (qword_26AB2F238 != -1) {
    dispatch_once(&qword_26AB2F238, &__block_literal_global_126);
  }
  v2 = (void *)_MergedGlobals_270;
  return v2;
}

uint64_t __57__HFFaceClassificationSignificantEventItem_dateFormatter__block_invoke()
{
  v0 = +[HFFormatterManager sharedInstance];
  uint64_t v1 = [v0 relativeDateFormatter];
  v2 = (void *)_MergedGlobals_270;
  _MergedGlobals_270 = v1;

  v3 = (void *)_MergedGlobals_270;
  return [v3 setTimeStyle:0];
}

- (HFFaceClassificationSignificantEventItem)initWithSignificantEvent:(id)a3 home:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 faceClassification];

  if (!v8) {
    NSLog(&cfstr_EventIsMissing.isa, v6);
  }
  v9 = [v6 faceClassification];

  if (!v9)
  {
    v10 = HFLogForCategory(0x13uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_error_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, "Event %@ is missing a face classification", buf, 0xCu);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)HFFaceClassificationSignificantEventItem;
  v11 = [(HFCameraClipSignificantEventItem *)&v13 initWithSignificantEvent:v6 home:v7];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [HFFaceClassificationSignificantEventItem alloc];
  v5 = [(HFCameraClipSignificantEventItem *)self event];
  id v6 = [(HFCameraClipSignificantEventItem *)self home];
  id v7 = [(HFFaceClassificationSignificantEventItem *)v4 initWithSignificantEvent:v5 home:v6];

  v8 = [(HFFaceClassificationSignificantEventItem *)self faceCropImage];
  [(HFFaceClassificationSignificantEventItem *)v7 setFaceCropImage:v8];

  return v7;
}

- (HMFaceClassification)faceClassification
{
  v2 = [(HFCameraClipSignificantEventItem *)self event];
  v3 = [v2 faceClassification];

  return (HMFaceClassification *)v3;
}

- (HMPerson)person
{
  v2 = [(HFCameraClipSignificantEventItem *)self event];
  v3 = [v2 faceClassification];
  v4 = [v3 person];

  return (HMPerson *)v4;
}

- (HMPersonManager)personManager
{
  v3 = [(HFCameraClipSignificantEventItem *)self home];
  v4 = [(HFFaceClassificationSignificantEventItem *)self faceClassification];
  v5 = [v4 personManagerUUID];
  id v6 = objc_msgSend(v3, "hf_personManagerWithIdentifier:", v5);

  return (HMPersonManager *)v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HFCameraClipSignificantEventItem *)self home];
  id v6 = [v5 personManagerSettings];
  char v7 = [v6 isFaceClassificationEnabled];

  if (v7)
  {
    v8 = [v4 objectForKeyedSubscript:HFItemUpdateOptionLogger];
    objc_initWeak(&location, self);
    v19.receiver = self;
    v19.super_class = (Class)HFFaceClassificationSignificantEventItem;
    v9 = [(HFCameraClipSignificantEventItem *)&v19 _subclass_updateWithOptions:v4];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke;
    v15[3] = &unk_2640969B8;
    objc_copyWeak(&v18, &location);
    id v16 = v4;
    id v10 = v8;
    id v17 = v10;
    v11 = [v9 flatMap:v15];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = (void *)MEMORY[0x263F58190];
    v21 = @"hidden";
    v22[0] = MEMORY[0x263EFFA88];
    id v10 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    objc_super v13 = +[HFItemUpdateOutcome outcomeWithResults:v10];
    v11 = [v12 futureWithResult:v13];
  }
  return v11;
}

id __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F58190];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_2;
  v8[3] = &unk_264096990;
  objc_copyWeak(&v12, a1 + 6);
  id v5 = v3;
  id v9 = v5;
  id v10 = a1[4];
  id v11 = a1[5];
  id v6 = [v4 futureWithBlock:v8];

  objc_destroyWeak(&v12);
  return v6;
}

void __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_2(id *a1, void *a2)
{
  v73[2] = *MEMORY[0x263EF8340];
  id v48 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  v49 = (void *)[a1[4] mutableCopy];
  id v4 = [WeakRetained faceClassification];

  if (!v4)
  {
    objc_super v13 = v49;
    [v49 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
    [v48 finishWithResult:v49];
    goto LABEL_20;
  }
  id v5 = [v49 objectForKeyedSubscript:@"dependentHomeKitObjects"];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = objc_alloc_init(MEMORY[0x263F58190]);
  v8 = [a1[5] objectForKeyedSubscript:HFItemUpdateOptionFullUpdateIndicated];
  if (![v8 BOOLValue])
  {
    v14 = [WeakRetained faceCropImage];
    if (v14)
    {
    }
    else
    {
      id v16 = [a1[5] objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
      char v17 = [v16 BOOLValue];

      if ((v17 & 1) == 0) {
        goto LABEL_4;
      }
    }
    id v18 = [WeakRetained faceCropImage];
    [v7 finishWithResult:v18];

    char v15 = 0;
    id v12 = 0;
    v47 = v7;
    goto LABEL_13;
  }

LABEL_4:
  id v9 = [WeakRetained cameraProfile];
  id v10 = [WeakRetained event];
  v47 = objc_msgSend(v9, "hf_faceCropImageForSignificantEvent:", v10);

  if (a1[6])
  {
    id v11 = [MEMORY[0x263F581B8] mainThreadScheduler];
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_3;
    v70[3] = &unk_26408D450;
    id v71 = a1[6];
    id v72 = WeakRetained;
    id v12 = [v11 afterDelay:v70 performBlock:10.0];
  }
  else
  {
    id v12 = 0;
  }
  char v15 = 1;
LABEL_13:
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_9;
  v65[3] = &unk_264096918;
  objc_copyWeak(&v68, a1 + 7);
  char v69 = v15;
  id v19 = v49;
  id v66 = v19;
  id v45 = v6;
  id v67 = v45;
  id v20 = (id)[v47 addCompletionBlock:v65];
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_12;
  v63[3] = &unk_264091218;
  id v44 = v12;
  id v64 = v44;
  id v21 = (id)[v47 addCompletionBlock:v63];
  v22 = [WeakRetained home];
  v23 = [WeakRetained faceClassification];
  v24 = [v23 personManagerUUID];
  v46 = objc_msgSend(v22, "hf_personManagerWithIdentifier:", v24);

  v25 = NSNumber;
  objc_opt_class();
  v26 = [v25 numberWithBool:objc_opt_isKindOfClass() & 1];
  [v19 setObject:v26 forKeyedSubscript:@"HFPersonResultIsHomeOriginatedKey"];

  v27 = [WeakRetained faceClassification];
  v28 = [v27 person];

  v29 = [MEMORY[0x263F58190] futureWithNoResult];
  if (v28)
  {
    v30 = [HFPersonItemUpdateRequest alloc];
    v31 = [WeakRetained home];
    v32 = [(HFPersonItemUpdateRequest *)v30 initWithPerson:v28 personManager:v46 home:v31];

    v33 = (void *)[a1[5] mutableCopy];
    [v33 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:HFPersonItemUpdateOptionSkipFaceCrop];
    if (a1[6])
    {
      v34 = [MEMORY[0x263F581B8] mainThreadScheduler];
      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_2_17;
      v60[3] = &unk_26408D450;
      id v61 = a1[6];
      id v62 = WeakRetained;
      v35 = [v34 afterDelay:v60 performBlock:10.0];
    }
    else
    {
      v35 = 0;
    }
    v37 = [(HFPersonItemUpdateRequest *)v32 updateWithOptions:v33];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_18;
    v56[3] = &unk_264096940;
    id v36 = v35;
    id v57 = v36;
    id v58 = v19;
    id v59 = v45;
    uint64_t v38 = [v37 addCompletionBlock:v56];

    v29 = (void *)v38;
  }
  else
  {
    id v36 = 0;
  }
  v39 = (void *)MEMORY[0x263F58190];
  v73[0] = v47;
  v73[1] = v29;
  v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:2];
  v41 = [v39 chainFutures:v40];
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_2_21;
  v50[3] = &unk_264096968;
  id v51 = v19;
  id v42 = v45;
  id v52 = v42;
  id v53 = v48;
  id v54 = a1[6];
  id v55 = WeakRetained;
  id v43 = (id)[v41 addCompletionBlock:v50];

  objc_destroyWeak(&v68);
  objc_super v13 = v49;
LABEL_20:
}

void __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    id v3 = [v2 loggerActivity];
    os_activity_scope_enter(v3, &state);

    id v4 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v8 = 138412290;
      uint64_t v9 = v5;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Face crop update is taking more than 10 seconds: %@", (uint8_t *)&v8, 0xCu);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    id v6 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = v7;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "Face crop update is taking more than 10 seconds: %@", (uint8_t *)&state, 0xCu);
    }
  }
}

void __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v8 = WeakRetained;
  if (*(unsigned char *)(a1 + 56)) {
    [WeakRetained setFaceCropImage:v5];
  }
  if (v5)
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"HFPersonResultFaceCropImageKey"];
    uint64_t v9 = [v8 event];
    id v10 = [v9 dateOfOccurrence];

    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:@"HFPersonResultFaceCropDateKey"];
    uint64_t v11 = (void *)MEMORY[0x263EFFA08];
    id v12 = [v8 event];
    objc_super v13 = [v12 faceClassification];
    v14 = [v13 faceCrop];
    char v15 = [v14 UUID];
    id v16 = objc_msgSend(v11, "na_setWithSafeObject:", v15);
    [*(id *)(a1 + 32) setObject:v16 forKeyedSubscript:@"HFPersonResultFaceCropIdentifiersKey"];

    char v17 = [(id)objc_opt_class() dateFormatter];
    id v18 = [v17 stringFromDate:v10];
    [*(id *)(a1 + 32) setObject:v18 forKeyedSubscript:@"description"];

    id v19 = *(void **)(a1 + 40);
    id v20 = [v8 event];
    id v21 = [v20 faceClassification];
    v22 = [v21 faceCrop];
    objc_msgSend(v19, "na_safeAddObject:", v22);
  }
  else if (*(unsigned char *)(a1 + 56))
  {
    v23 = HFLogForCategory(0x13uLL);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v24 = 138412546;
      v25 = v8;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_error_impl(&dword_20B986000, v23, OS_LOG_TYPE_ERROR, "%@: Unable to process face crop from significant event (error: %@)", (uint8_t *)&v24, 0x16u);
    }
  }
}

uint64_t __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_2_17(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    id v3 = [v2 loggerActivity];
    os_activity_scope_enter(v3, &state);

    id v4 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v8 = 138412290;
      uint64_t v9 = v5;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Person update is taking more than 10 seconds: %@", (uint8_t *)&v8, 0xCu);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    id v6 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      LODWORD(state.opaque[0]) = 138412290;
      *(uint64_t *)((char *)state.opaque + 4) = v7;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "Person update is taking more than 10 seconds: %@", (uint8_t *)&state, 0xCu);
    }
  }
}

void __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_18(uint64_t a1, void *a2)
{
  id v5 = a2;
  [*(id *)(a1 + 32) cancel];
  if (v5)
  {
    [*(id *)(a1 + 40) addResultsFromOutcome:v5];
    id v3 = *(void **)(a1 + 48);
    id v4 = [v5 objectForKeyedSubscript:@"dependentHomeKitObjects"];
    [v3 unionSet:v4];
  }
}

uint64_t __72__HFFaceClassificationSignificantEventItem__subclass_updateWithOptions___block_invoke_2_21(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKeyedSubscript:@"dependentHomeKitObjects"];
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"HFPersonResultFaceCropImageKey"];

  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"title"];
  uint64_t v4 = [v3 length];

  if (v2) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (v5)
  {
    uint64_t v9 = *(void **)(a1 + 56);
    if (v9)
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      id v10 = [v9 loggerActivity];
      os_activity_scope_enter(v10, &state);

      uint64_t v11 = HFLogForCategory(0x13uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 64);
        int v15 = 138412290;
        uint64_t v16 = v12;
        _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_ERROR, "Unable to display face crop or person: %@", (uint8_t *)&v15, 0xCu);
      }

      os_activity_scope_leave(&state);
    }
    else
    {
      objc_super v13 = HFLogForCategory(0x13uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = *(void *)(a1 + 64);
        LODWORD(state.opaque[0]) = 138412290;
        *(uint64_t *)((char *)state.opaque + 4) = v14;
        _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_ERROR, "Unable to display face crop or person: %@", (uint8_t *)&state, 0xCu);
      }
    }
    [*(id *)(a1 + 32) setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
    return [*(id *)(a1 + 48) finishWithResult:*(void *)(a1 + 32)];
  }
  else
  {
    id v6 = *(void **)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    return [v6 finishWithResult:v7];
  }
}

- (UIImage)faceCropImage
{
  return self->_faceCropImage;
}

- (void)setFaceCropImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end