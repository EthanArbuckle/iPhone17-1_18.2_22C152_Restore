@interface HUCameraEraseRecordingsItem
- (HMCameraProfile)cameraProfile;
- (HUCameraEraseRecordingsItem)initWithCameraProfile:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (void)_updateResultsForFuture:(id)a3 withHiddenStatus:(BOOL)a4;
@end

@implementation HUCameraEraseRecordingsItem

- (HUCameraEraseRecordingsItem)initWithCameraProfile:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUCameraEraseRecordingsItem;
  v6 = [(HFStaticItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cameraProfile, a3);
  }

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
  objc_initWeak(&location, self);
  v6 = [(HUCameraEraseRecordingsItem *)self cameraProfile];
  v7 = [v6 clipManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__HUCameraEraseRecordingsItem__subclass_updateWithOptions___block_invoke;
  v10[3] = &unk_1E638E660;
  objc_copyWeak(&v12, &location);
  id v8 = v5;
  id v11 = v8;
  [v7 fetchCountOfAllClipsWithCompletion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

void __59__HUCameraEraseRecordingsItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = [v3 BOOLValue];
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Erase all camera recording control hidden:%{BOOL}d.", (uint8_t *)v6, 8u);
  }

  objc_msgSend(WeakRetained, "_updateResultsForFuture:withHiddenStatus:", *(void *)(a1 + 32), objc_msgSend(v3, "integerValue") < 1);
}

- (void)_updateResultsForFuture:(id)a3 withHiddenStatus:(BOOL)a4
{
  BOOL v4 = a4;
  v15[3] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F68AB8];
  id v6 = a3;
  uint64_t v7 = _HULocalizedStringWithDefaultValue(@"HUCameraEraseAllRecordings", @"HUCameraEraseAllRecordings", 1);
  v15[0] = v7;
  v14[1] = *MEMORY[0x1E4F68908];
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  objc_super v9 = [(HUCameraEraseRecordingsItem *)self cameraProfile];
  v10 = [v8 setWithObject:v9];
  v15[1] = v10;
  v14[2] = *MEMORY[0x1E4F68B10];
  id v11 = [NSNumber numberWithBool:v4];
  v15[2] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  v13 = [MEMORY[0x1E4F69228] outcomeWithResults:v12];
  [v6 finishWithResult:v13];
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void).cxx_destruct
{
}

@end