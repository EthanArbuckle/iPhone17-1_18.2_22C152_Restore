@interface HDDemoDataManager
- (HDDemoDataGenerator)generator;
- (HDDemoDataManager)initWithProfile:(id)a3;
- (HDProfile)profile;
- (void)_queue_generateDemoDataIfNeeded;
- (void)profileDidBecomeReady:(id)a3;
@end

@implementation HDDemoDataManager

- (HDDemoDataManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDDemoDataManager;
  v5 = [(HDDemoDataManager *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialUtilityDispatchQueue();
    demoDataQueue = v6->_demoDataQueue;
    v6->_demoDataQueue = (OS_dispatch_queue *)v7;

    [v4 registerProfileReadyObserver:v6 queue:v6->_demoDataQueue];
  }

  return v6;
}

- (void)_queue_generateDemoDataIfNeeded
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if ([MEMORY[0x1E4F2B898] shouldGenerateDemoData])
    {
      if (!*(void *)(a1 + 24))
      {
        v2 = [HDDemoDataGenerator alloc];
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
        uint64_t v4 = [(HDDemoDataGenerator *)v2 initWithProfile:WeakRetained queue:*(void *)(a1 + 8)];
        v5 = *(void **)(a1 + 24);
        *(void *)(a1 + 24) = v4;

        v6 = [*(id *)(a1 + 24) configuration];
        uint64_t v7 = +[HDDemoDataPerson defaultPersonWithBiologicalSex:](HDDemoDataPerson, "defaultPersonWithBiologicalSex:", [v6 biologicalSex]);
        v8 = [*(id *)(a1 + 24) gregorianCalendar];
        v9 = [v7 birthDateComponents];
        objc_super v10 = [v8 dateFromComponents:v9];
        [v7 setBirthDate:v10];

        objc_msgSend(v7, "setNutritionTrackingType:", objc_msgSend(v6, "nutritionTrackingType"));
        objc_msgSend(v7, "setResultsTrackingType:", objc_msgSend(v6, "resultsTrackingType"));
        objc_msgSend(v7, "applyProfileType:", objc_msgSend(v6, "profileType"));
        objc_msgSend(v7, "setHighFidelityGeneration:", objc_msgSend(v6, "highFidelityGeneration"));
        [*(id *)(a1 + 24) setDemoPerson:v7];
      }
      v11 = [MEMORY[0x1E4F1C9C8] date];
      if ([MEMORY[0x1E4F2B860] runningInStoreDemoModeF201])
      {
        v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        uint64_t v13 = objc_msgSend(v12, "hk_startOfDateByAddingDays:toDate:", 1, v11);

        v11 = (void *)v13;
      }
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      v15 = *(void **)(a1 + 24);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __52__HDDemoDataManager__queue_generateDemoDataIfNeeded__block_invoke;
      v17[3] = &unk_1E63096A8;
      *(CFAbsoluteTime *)&v17[5] = Current;
      v17[4] = a1;
      [v15 generateThroughEndDate:v11 completion:v17];
    }
    else
    {
      _HKInitializeLogging();
      v16 = *MEMORY[0x1E4F29F30];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "Not generating demo data", buf, 2u);
      }
    }
  }
}

void __52__HDDemoDataManager__queue_generateDemoDataIfNeeded__block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v7 = a4;
  double Current = CFAbsoluteTimeGetCurrent();
  if (a2)
  {
    double v9 = Current;
    double v10 = *(double *)(a1 + 40);
    v11 = [MEMORY[0x1E4F2B860] sharedBehavior];
    char v12 = [v11 isAppleWatch];

    if ((v12 & 1) == 0)
    {
      objc_initWeak(location, *(id *)(a1 + 32));
      dispatch_time_t v13 = dispatch_time(0, 3600000000000);
      v14 = *(NSObject **)(*(void *)(a1 + 32) + 8);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__HDDemoDataManager__queue_generateDemoDataIfNeeded__block_invoke_282;
      block[3] = &unk_1E62F6BD0;
      objc_copyWeak(&v22, location);
      dispatch_after(v13, v14, block);
      objc_destroyWeak(&v22);
      objc_destroyWeak(location);
    }
    v15 = [*(id *)(*(void *)(a1 + 32) + 24) configuration];
    int v16 = [v15 shouldPresentNotifications];

    if ([MEMORY[0x1E4F2B860] isAppleInternalInstall] && v16)
    {
      double v17 = v9 - v10;
      id v18 = objc_alloc_init(MEMORY[0x1E4F65D98]);
      [v18 setTitle:@"Health Demo Data"];
      if (v17 <= 10.0)
      {
        if (v17 <= 1.0) {
          objc_msgSend(NSString, "stringWithFormat:", @"Generation of demo data complete\n %ld ms elapsed\n %ld samples written", (uint64_t)(v17 * 1000.0), a3);
        }
        else {
          objc_msgSend(NSString, "stringWithFormat:", @"Generation of demo data complete\n %.1f s elapsed\n %ld samples written", *(void *)&v17, a3);
        }
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Generation of demo data complete\n %ld s elapsed\n %ld samples written", (uint64_t)v17, a3);
      v20 = };
      [v18 setMessage:v20];
      [v18 setDefaultButton:@"Ok"];
      [v18 presentWithResponseHandler:&__block_literal_global_203];
    }
  }
  else
  {
    _HKInitializeLogging();
    v19 = *MEMORY[0x1E4F29F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F30], OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v7;
      _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "Failed to generate demo data: %{public}@", (uint8_t *)location, 0xCu);
    }
  }
}

void __52__HDDemoDataManager__queue_generateDemoDataIfNeeded__block_invoke_282(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDDemoDataManager _queue_generateDemoDataIfNeeded]();
}

- (void)profileDidBecomeReady:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_demoDataQueue);

  -[HDDemoDataManager _queue_generateDemoDataIfNeeded]((uint64_t)self);
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HDDemoDataGenerator)generator
{
  return self->_generator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generator, 0);
  objc_destroyWeak((id *)&self->_profile);

  objc_storeStrong((id *)&self->_demoDataQueue, 0);
}

@end