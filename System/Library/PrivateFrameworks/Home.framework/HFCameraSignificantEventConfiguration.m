@interface HFCameraSignificantEventConfiguration
+ (id)_configurationForCameraProfiles:(id)a3 eventTypesTransform:(id)a4 personFamiliarityOptionsTransform:(id)a5;
+ (id)configurationForCameraProfilesNotificationSettings:(id)a3;
+ (id)configurationForCameraProfilesRecordingSettings:(id)a3;
+ (id)configurationWithEventTypes:(unint64_t)a3 personFamiliarityOptions:(unint64_t)a4;
+ (id)defaultAnyMotionConfiguration;
+ (id)defaultSmartMotionConfiguration;
- (BOOL)containsConfiguration:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFaceDetectionConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizationKey;
- (id)localizedDescription;
- (id)predicateRepresentation;
- (unint64_t)eventTypes;
- (unint64_t)hash;
- (unint64_t)personFamiliarityOptions;
- (void)addConfiguration:(id)a3;
- (void)removeConfiguration:(id)a3;
- (void)setEventTypes:(unint64_t)a3;
- (void)setPersonFamiliarityOptions:(unint64_t)a3;
@end

@implementation HFCameraSignificantEventConfiguration

+ (id)configurationWithEventTypes:(unint64_t)a3 personFamiliarityOptions:(unint64_t)a4
{
  id v6 = objc_alloc_init((Class)a1);
  [v6 setEventTypes:a3];
  [v6 setPersonFamiliarityOptions:a4];
  return v6;
}

+ (id)configurationForCameraProfilesNotificationSettings:(id)a3
{
  v4 = objc_msgSend(a3, "na_filter:", &__block_literal_global_40);
  v5 = [a1 _configurationForCameraProfiles:v4 eventTypesTransform:&__block_literal_global_3_5 personFamiliarityOptionsTransform:&__block_literal_global_5_1];

  return v5;
}

uint64_t __92__HFCameraSignificantEventConfiguration_configurationForCameraProfilesNotificationSettings___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 userSettings];
  v3 = [v2 smartNotificationBulletin];
  uint64_t v4 = [v3 isEnabled];

  return v4;
}

uint64_t __92__HFCameraSignificantEventConfiguration_configurationForCameraProfilesNotificationSettings___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 userSettings];
  v3 = [v2 smartNotificationBulletin];
  uint64_t v4 = [v3 significantEventTypes];

  return v4;
}

uint64_t __92__HFCameraSignificantEventConfiguration_configurationForCameraProfilesNotificationSettings___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 userSettings];
  v3 = [v2 smartNotificationBulletin];
  uint64_t v4 = [v3 personFamiliarityOptions];

  return v4;
}

+ (id)configurationForCameraProfilesRecordingSettings:(id)a3
{
  return (id)[a1 _configurationForCameraProfiles:a3 eventTypesTransform:&__block_literal_global_7_0 personFamiliarityOptionsTransform:&__block_literal_global_9_1];
}

uint64_t __89__HFCameraSignificantEventConfiguration_configurationForCameraProfilesRecordingSettings___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 userSettings];
  uint64_t v3 = [v2 recordingEventTriggers];

  return v3;
}

uint64_t __89__HFCameraSignificantEventConfiguration_configurationForCameraProfilesRecordingSettings___block_invoke_2()
{
  return 0;
}

+ (id)defaultAnyMotionConfiguration
{
  return (id)[a1 configurationWithEventTypes:31 personFamiliarityOptions:0];
}

+ (id)defaultSmartMotionConfiguration
{
  return (id)[a1 configurationWithEventTypes:30 personFamiliarityOptions:7];
}

- (BOOL)isFaceDetectionConfiguration
{
  return ([(HFCameraSignificantEventConfiguration *)self eventTypes] & 2) != 0
      && [(HFCameraSignificantEventConfiguration *)self personFamiliarityOptions] != 0;
}

- (BOOL)containsConfiguration:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(HFCameraSignificantEventConfiguration *)self eventTypes];
  if (([v4 eventTypes] & ~v5) != 0)
  {
    BOOL v7 = 0;
  }
  else
  {
    unint64_t v6 = [(HFCameraSignificantEventConfiguration *)self personFamiliarityOptions];
    BOOL v7 = ([v4 personFamiliarityOptions] & ~v6) == 0;
  }

  return v7;
}

- (void)addConfiguration:(id)a3
{
  id v4 = a3;
  -[HFCameraSignificantEventConfiguration setEventTypes:](self, "setEventTypes:", [v4 eventTypes] | -[HFCameraSignificantEventConfiguration eventTypes](self, "eventTypes"));
  unint64_t v5 = [(HFCameraSignificantEventConfiguration *)self personFamiliarityOptions];
  uint64_t v6 = [v4 personFamiliarityOptions];

  [(HFCameraSignificantEventConfiguration *)self setPersonFamiliarityOptions:v6 | v5];
}

- (void)removeConfiguration:(id)a3
{
  id v4 = a3;
  -[HFCameraSignificantEventConfiguration setEventTypes:](self, "setEventTypes:", -[HFCameraSignificantEventConfiguration eventTypes](self, "eventTypes") & ~[v4 eventTypes]);
  unint64_t v5 = [(HFCameraSignificantEventConfiguration *)self personFamiliarityOptions];
  uint64_t v6 = [v4 personFamiliarityOptions];

  [(HFCameraSignificantEventConfiguration *)self setPersonFamiliarityOptions:v5 & ~v6];
}

- (id)predicateRepresentation
{
  uint64_t v3 = (void *)MEMORY[0x263F0E188];
  unint64_t v4 = [(HFCameraSignificantEventConfiguration *)self eventTypes];
  unint64_t v5 = [(HFCameraSignificantEventConfiguration *)self personFamiliarityOptions];
  return (id)[v3 predicateForSignificantEventTypes:v4 personFamiliarityOptions:v5];
}

- (id)localizedDescription
{
  v2 = [(HFCameraSignificantEventConfiguration *)self localizationKey];
  uint64_t v3 = _HFLocalizedStringWithDefaultValue(v2, v2, 1);

  return v3;
}

- (id)localizationKey
{
  if ([(HFCameraSignificantEventConfiguration *)self isFaceDetectionConfiguration]) {
    HFLocalizationKeyFromHMCameraSignificantEventPersonFamiliarityOptions([(HFCameraSignificantEventConfiguration *)self personFamiliarityOptions]);
  }
  else {
  uint64_t v3 = HFLocalizationKeyFromHMCameraMotionDetectionType([(HFCameraSignificantEventConfiguration *)self eventTypes]);
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7
    && (unint64_t v8 = [(HFCameraSignificantEventConfiguration *)self eventTypes],
        v8 == [v7 eventTypes]))
  {
    unint64_t v9 = [(HFCameraSignificantEventConfiguration *)self personFamiliarityOptions];
    BOOL v10 = v9 == [v7 personFamiliarityOptions];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HFCameraSignificantEventConfiguration *)self personFamiliarityOptions];
  return v3 + 131 * [(HFCameraSignificantEventConfiguration *)self eventTypes];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_configurationForCameraProfiles:(id)a3 eventTypesTransform:(id)a4 personFamiliarityOptionsTransform:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x263F089C8] indexSet];
  v12 = [MEMORY[0x263F089C8] indexSet];
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  v25 = __127__HFCameraSignificantEventConfiguration__configurationForCameraProfiles_eventTypesTransform_personFamiliarityOptionsTransform___block_invoke;
  v26 = &unk_26408FEA0;
  id v13 = v11;
  id v27 = v13;
  id v29 = v9;
  id v14 = v12;
  id v28 = v14;
  id v30 = v10;
  id v15 = v10;
  id v16 = v9;
  objc_msgSend(v8, "na_each:", &v23);
  if (objc_msgSend(v13, "count", v23, v24, v25, v26) == 1)
  {
    uint64_t v17 = [v13 firstIndex];
  }
  else
  {
    v18 = HFLogForCategory(0x1AuLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v32 = v13;
      __int16 v33 = 2112;
      id v34 = v8;
      _os_log_error_impl(&dword_20B986000, v18, OS_LOG_TYPE_ERROR, "Mismatched HMCameraSignificantEventTypes:%@ for HMCameraProfiles:%@", buf, 0x16u);
    }

    uint64_t v17 = 1;
  }
  if ([v14 count] == 1)
  {
    uint64_t v19 = [v14 firstIndex];
  }
  else
  {
    v20 = HFLogForCategory(0x1AuLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v32 = v14;
      __int16 v33 = 2112;
      id v34 = v8;
      _os_log_error_impl(&dword_20B986000, v20, OS_LOG_TYPE_ERROR, "Mismatched HMCameraSignificantEventPersonFamiliarityOptions:%@ for HMCameraProfiles:%@", buf, 0x16u);
    }

    uint64_t v19 = 7;
  }
  v21 = [a1 configurationWithEventTypes:v17 personFamiliarityOptions:v19];

  return v21;
}

uint64_t __127__HFCameraSignificantEventConfiguration__configurationForCameraProfiles_eventTypesTransform_personFamiliarityOptionsTransform___block_invoke(void *a1, void *a2)
{
  unint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[6];
  id v5 = *(uint64_t (**)(uint64_t, id))(v4 + 16);
  id v6 = a2;
  objc_msgSend(v3, "addIndex:", v5(v4, v6));
  id v7 = (void *)a1[5];
  uint64_t v8 = (*(uint64_t (**)(void))(a1[7] + 16))();

  return [v7 addIndex:v8];
}

- (unint64_t)eventTypes
{
  return self->_eventTypes;
}

- (void)setEventTypes:(unint64_t)a3
{
  self->_eventTypes = a3;
}

- (unint64_t)personFamiliarityOptions
{
  return self->_personFamiliarityOptions;
}

- (void)setPersonFamiliarityOptions:(unint64_t)a3
{
  self->_personFamiliarityOptions = a3;
}

@end