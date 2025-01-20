@interface _SFPerSitePreferenceDisplayInformation
+ (id)displayInformationForPerSitePreference:(id)a3;
+ (void)_buildMapIfNeeded;
- (NSString)localizedAllWebsiteSettingsTitle;
- (NSString)localizedClearAllSettingsPrompt;
- (NSString)localizedSiteSpecificSettingsTitle;
- (id)_initWithLocalizedSiteSpecificSettingsTitle:(id)a3 localizedAllWebsiteSettingsTitle:(id)a4 localizedClearAllSettingsPrompt:(id)a5 displayOption:(unint64_t)a6;
- (unint64_t)displayOption;
@end

@implementation _SFPerSitePreferenceDisplayInformation

+ (id)displayInformationForPerSitePreference:(id)a3
{
  id v4 = a3;
  [a1 _buildMapIfNeeded];
  v5 = (void *)preferenceToDisplayInformation;
  v6 = [v4 identifier];

  v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

+ (void)_buildMapIfNeeded
{
  if (!preferenceToDisplayInformation)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
    v3 = (void *)preferenceToDisplayInformation;
    preferenceToDisplayInformation = v2;

    id v4 = [_SFPerSitePreferenceDisplayInformation alloc];
    v5 = _WBSLocalizedString();
    v6 = _WBSLocalizedString();
    id v7 = [(_SFPerSitePreferenceDisplayInformation *)v4 _initWithLocalizedSiteSpecificSettingsTitle:v5 localizedAllWebsiteSettingsTitle:0 localizedClearAllSettingsPrompt:v6 displayOption:0];
    [(id)preferenceToDisplayInformation setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F99410]];

    v8 = [_SFPerSitePreferenceDisplayInformation alloc];
    v9 = _WBSLocalizedString();
    v10 = _WBSLocalizedString();
    id v11 = [(_SFPerSitePreferenceDisplayInformation *)v8 _initWithLocalizedSiteSpecificSettingsTitle:v9 localizedAllWebsiteSettingsTitle:0 localizedClearAllSettingsPrompt:v10 displayOption:0];
    [(id)preferenceToDisplayInformation setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F990E8]];

    v12 = [_SFPerSitePreferenceDisplayInformation alloc];
    v13 = _WBSLocalizedString();
    v14 = _WBSLocalizedString();
    v15 = _WBSLocalizedString();
    id v16 = [(_SFPerSitePreferenceDisplayInformation *)v12 _initWithLocalizedSiteSpecificSettingsTitle:v13 localizedAllWebsiteSettingsTitle:v14 localizedClearAllSettingsPrompt:v15 displayOption:1];
    [(id)preferenceToDisplayInformation setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F99060]];

    v17 = [_SFPerSitePreferenceDisplayInformation alloc];
    v18 = _WBSLocalizedString();
    v19 = _WBSLocalizedString();
    v20 = _WBSLocalizedString();
    id v21 = [(_SFPerSitePreferenceDisplayInformation *)v17 _initWithLocalizedSiteSpecificSettingsTitle:v18 localizedAllWebsiteSettingsTitle:v19 localizedClearAllSettingsPrompt:v20 displayOption:1];
    [(id)preferenceToDisplayInformation setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F992A8]];

    v22 = [_SFPerSitePreferenceDisplayInformation alloc];
    v23 = _WBSLocalizedString();
    v24 = _WBSLocalizedString();
    v25 = _WBSLocalizedString();
    id v26 = [(_SFPerSitePreferenceDisplayInformation *)v22 _initWithLocalizedSiteSpecificSettingsTitle:v23 localizedAllWebsiteSettingsTitle:v24 localizedClearAllSettingsPrompt:v25 displayOption:1];
    [(id)preferenceToDisplayInformation setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F99228]];

    v27 = [_SFPerSitePreferenceDisplayInformation alloc];
    v28 = _WBSLocalizedString();
    v29 = _WBSLocalizedString();
    id v30 = [(_SFPerSitePreferenceDisplayInformation *)v27 _initWithLocalizedSiteSpecificSettingsTitle:v28 localizedAllWebsiteSettingsTitle:0 localizedClearAllSettingsPrompt:v29 displayOption:0];
    [(id)preferenceToDisplayInformation setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F99438]];

    v31 = [_SFPerSitePreferenceDisplayInformation alloc];
    v32 = _WBSLocalizedString();
    v33 = _WBSLocalizedString();
    v34 = _WBSLocalizedString();
    id v35 = [(_SFPerSitePreferenceDisplayInformation *)v31 _initWithLocalizedSiteSpecificSettingsTitle:v32 localizedAllWebsiteSettingsTitle:v33 localizedClearAllSettingsPrompt:v34 displayOption:1];
    [(id)preferenceToDisplayInformation setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F997D8]];

    v36 = [_SFPerSitePreferenceDisplayInformation alloc];
    v37 = _WBSLocalizedString();
    v38 = _WBSLocalizedString();
    id v39 = [(_SFPerSitePreferenceDisplayInformation *)v36 _initWithLocalizedSiteSpecificSettingsTitle:v37 localizedAllWebsiteSettingsTitle:0 localizedClearAllSettingsPrompt:v38 displayOption:0];
    [(id)preferenceToDisplayInformation setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F992A0]];

    v40 = [_SFPerSitePreferenceDisplayInformation alloc];
    _WBSLocalizedString();
    id v43 = (id)objc_claimAutoreleasedReturnValue();
    v41 = _WBSLocalizedString();
    id v42 = [(_SFPerSitePreferenceDisplayInformation *)v40 _initWithLocalizedSiteSpecificSettingsTitle:v43 localizedAllWebsiteSettingsTitle:0 localizedClearAllSettingsPrompt:v41 displayOption:1];
    [(id)preferenceToDisplayInformation setObject:v42 forKeyedSubscript:*MEMORY[0x1E4F993D0]];
  }
}

- (id)_initWithLocalizedSiteSpecificSettingsTitle:(id)a3 localizedAllWebsiteSettingsTitle:(id)a4 localizedClearAllSettingsPrompt:(id)a5 displayOption:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_SFPerSitePreferenceDisplayInformation;
  v13 = [(_SFPerSitePreferenceDisplayInformation *)&v22 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    localizedSiteSpecificSettingsTitle = v13->_localizedSiteSpecificSettingsTitle;
    v13->_localizedSiteSpecificSettingsTitle = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    localizedAllWebsiteSettingsTitle = v13->_localizedAllWebsiteSettingsTitle;
    v13->_localizedAllWebsiteSettingsTitle = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    localizedClearAllSettingsPrompt = v13->_localizedClearAllSettingsPrompt;
    v13->_localizedClearAllSettingsPrompt = (NSString *)v18;

    v13->_displayOption = a6;
    v20 = v13;
  }

  return v13;
}

- (NSString)localizedSiteSpecificSettingsTitle
{
  return self->_localizedSiteSpecificSettingsTitle;
}

- (NSString)localizedAllWebsiteSettingsTitle
{
  return self->_localizedAllWebsiteSettingsTitle;
}

- (NSString)localizedClearAllSettingsPrompt
{
  return self->_localizedClearAllSettingsPrompt;
}

- (unint64_t)displayOption
{
  return self->_displayOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedClearAllSettingsPrompt, 0);
  objc_storeStrong((id *)&self->_localizedAllWebsiteSettingsTitle, 0);

  objc_storeStrong((id *)&self->_localizedSiteSpecificSettingsTitle, 0);
}

@end