@interface HUCameraUsageOptionItem
+ (unint64_t)sortOrderForUsage:(unint64_t)a3;
- (BOOL)updateInProgress;
- (HUCameraUsageOptionItem)initWithPresence:(unint64_t)a3 cameraUsage:(unint64_t)a4 cameraProfiles:(id)a5;
- (NSSet)cameraProfiles;
- (NSString)privacyDescription;
- (id)_subclass_updateWithOptions:(id)a3;
- (unint64_t)presence;
- (unint64_t)sortOrder;
- (unint64_t)usage;
- (void)setUpdateInProgress:(BOOL)a3;
@end

@implementation HUCameraUsageOptionItem

- (HUCameraUsageOptionItem)initWithPresence:(unint64_t)a3 cameraUsage:(unint64_t)a4 cameraProfiles:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUCameraUsageOptionItem;
  v9 = [(HUCameraUsageOptionItem *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_presence = a3;
    v9->_usage = a4;
    v9->_sortOrder = +[HUCameraUsageOptionItem sortOrderForUsage:a4];
    uint64_t v11 = [v8 copy];
    cameraProfiles = v10->_cameraProfiles;
    v10->_cameraProfiles = (NSSet *)v11;
  }
  return v10;
}

- (NSString)privacyDescription
{
  switch([(HUCameraUsageOptionItem *)self usage])
  {
    case 0uLL:
      v2 = @"HUCameraRecordingSettingsOffDescription";
      goto LABEL_7;
    case 1uLL:
      v2 = @"HUCameraRecordingSettingsStreamOnlyDescription";
      goto LABEL_7;
    case 2uLL:
      v2 = @"HUCameraRecordingSettingsStreamAndRecordDescription";
      goto LABEL_7;
    case 3uLL:
      v2 = @"HUCameraRecordingSettingsDetectActivityDescription";
LABEL_7:
      _HULocalizedStringWithDefaultValue(v2, v2, 1);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = &stru_1F18F92B8;
      break;
  }

  return (NSString *)v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v26[8] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F2E728];
  v5 = [(HUCameraUsageOptionItem *)self cameraProfiles];
  uint64_t v6 = objc_msgSend(v4, "hf_cameraAccessModeSelectedOptionForCameraProfiles:presenceType:", v5, -[HUCameraUsageOptionItem presence](self, "presence"));

  v7 = [(HUCameraUsageOptionItem *)self cameraProfiles];
  id v8 = [v7 anyObject];
  v9 = [v8 accessory];
  v10 = [v9 home];
  uint64_t v11 = objc_msgSend(v10, "hf_currentUserIsAdministrator") ^ 1;

  v25[0] = *MEMORY[0x1E4F68AB8];
  [(HUCameraUsageOptionItem *)self usage];
  v12 = HFLocalizedStringFromHMCameraAccessMode();
  v26[0] = v12;
  v25[1] = *MEMORY[0x1E4F68980];
  v13 = [(HUCameraUsageOptionItem *)self privacyDescription];
  v26[1] = v13;
  v25[2] = *MEMORY[0x1E4F68B40];
  objc_super v14 = objc_msgSend(NSNumber, "numberWithInt:", -[HUCameraUsageOptionItem usage](self, "usage") == v6);
  v26[2] = v14;
  v25[3] = *MEMORY[0x1E4F68908];
  v15 = [(HUCameraUsageOptionItem *)self cameraProfiles];
  v26[3] = v15;
  v25[4] = @"HUCameraSettingResultKey";
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HUCameraUsageOptionItem usage](self, "usage"));
  v26[4] = v16;
  v25[5] = *MEMORY[0x1E4F68B48];
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HUCameraUsageOptionItem sortOrder](self, "sortOrder"));
  v26[5] = v17;
  v25[6] = *MEMORY[0x1E4F68A08];
  v18 = [NSNumber numberWithBool:v11];
  v26[6] = v18;
  v25[7] = *MEMORY[0x1E4F68C48];
  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[HUCameraUsageOptionItem updateInProgress](self, "updateInProgress"));
  v26[7] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:8];

  v21 = (void *)MEMORY[0x1E4F7A0D8];
  v22 = [MEMORY[0x1E4F69228] outcomeWithResults:v20];
  v23 = [v21 futureWithResult:v22];

  return v23;
}

+ (unint64_t)sortOrderForUsage:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 0;
  }
  else {
    return qword_1BEA1A8F0[a3 - 1];
  }
}

- (unint64_t)presence
{
  return self->_presence;
}

- (unint64_t)usage
{
  return self->_usage;
}

- (unint64_t)sortOrder
{
  return self->_sortOrder;
}

- (NSSet)cameraProfiles
{
  return self->_cameraProfiles;
}

- (BOOL)updateInProgress
{
  return self->_updateInProgress;
}

- (void)setUpdateInProgress:(BOOL)a3
{
  self->_updateInProgress = a3;
}

- (void).cxx_destruct
{
}

@end