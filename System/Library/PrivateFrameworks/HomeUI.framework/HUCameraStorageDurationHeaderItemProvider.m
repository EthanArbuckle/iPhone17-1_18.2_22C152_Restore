@interface HUCameraStorageDurationHeaderItemProvider
- (HUCameraStorageDurationHeaderItemProvider)initWithCameraProfiles:(id)a3 displayStyle:(unint64_t)a4;
- (HUCameraStorageDurationHeaderItemProvider)initWithItems:(id)a3;
- (NSSet)cameraProfiles;
- (id)invalidationReasons;
- (unint64_t)displayStyle;
@end

@implementation HUCameraStorageDurationHeaderItemProvider

- (HUCameraStorageDurationHeaderItemProvider)initWithCameraProfiles:(id)a3 displayStyle:(unint64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = objc_alloc(MEMORY[0x1E4F695C0]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__HUCameraStorageDurationHeaderItemProvider_initWithCameraProfiles_displayStyle___block_invoke;
  v15[3] = &unk_1E6384FD0;
  objc_copyWeak(&v16, &location);
  v8 = (void *)[v7 initWithResultsBlock:v15];
  v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
  v14.receiver = self;
  v14.super_class = (Class)HUCameraStorageDurationHeaderItemProvider;
  v10 = [(HFStaticItemProvider *)&v14 initWithItems:v9];

  if (v10)
  {
    uint64_t v11 = [v6 copy];
    cameraProfiles = v10->_cameraProfiles;
    v10->_cameraProfiles = (NSSet *)v11;

    v10->_displayStyle = a4;
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v10;
}

id __81__HUCameraStorageDurationHeaderItemProvider_initWithCameraProfiles_displayStyle___block_invoke(uint64_t a1)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained displayStyle];

  switch(v2)
  {
    case 1:
      v3 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingSettingsHeaderDisplayStyleOnboarding_Header", @"HUCameraRecordingSettingsHeaderDisplayStyleOnboarding_Header", 1);
      v5 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingSettingsHeaderDisplayStyleOnboarding_Body", @"HUCameraRecordingSettingsHeaderDisplayStyleOnboarding_Body", 1);
      uint64_t v6 = 1;
LABEL_7:
      v4 = HUCameraBuildHeaderAttributedString(v6, v3, v5);

      goto LABEL_8;
    case 2:
      v3 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingSettingsHeaderDisplayStyleSetup_Header", @"HUCameraRecordingSettingsHeaderDisplayStyleSetup_Header", 1);
      v5 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingSettingsHeaderDisplayStyleSetup_Body", @"HUCameraRecordingSettingsHeaderDisplayStyleSetup_Body", 1);
      uint64_t v6 = 2;
      goto LABEL_7;
    case 3:
      v3 = _HULocalizedStringWithDefaultValue(@"HUCameraRecordingSettingsHeaderDisplayStyleServiceDetails", @"HUCameraRecordingSettingsHeaderDisplayStyleServiceDetails", 1);
      v4 = HUCameraBuildHeaderAttributedString(3, v3, 0);
LABEL_8:

      goto LABEL_10;
  }
  v4 = objc_opt_new();
LABEL_10:
  uint64_t v7 = *MEMORY[0x1E4F68980];
  v14[0] = v4;
  uint64_t v8 = *MEMORY[0x1E4F68B10];
  v13[0] = v7;
  v13[1] = v8;
  v9 = [NSNumber numberWithInt:v2 == 0];
  v13[2] = *MEMORY[0x1E4F68B48];
  v14[1] = v9;
  v14[2] = &unk_1F19B5000;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  uint64_t v11 = [MEMORY[0x1E4F7A0D8] futureWithResult:v10];

  return v11;
}

- (HUCameraStorageDurationHeaderItemProvider)initWithItems:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  uint64_t v6 = NSStringFromSelector(sel_initWithCameraProfiles_displayStyle_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUCameraStorageDurationHeaderItemProvider.m", 67, @"%s is unavailable; use %@ instead",
    "-[HUCameraStorageDurationHeaderItemProvider initWithItems:]",
    v6);

  return 0;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HUCameraStorageDurationHeaderItemProvider;
  uint64_t v2 = [(HFItemProvider *)&v5 invalidationReasons];
  v3 = [v2 setByAddingObject:*MEMORY[0x1E4F686B0]];

  return v3;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (void).cxx_destruct
{
}

@end