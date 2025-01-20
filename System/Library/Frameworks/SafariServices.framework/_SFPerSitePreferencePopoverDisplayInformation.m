@interface _SFPerSitePreferencePopoverDisplayInformation
+ (id)popoverDisplayInformationForPerSitePreference:(id)a3;
+ (void)_buildMapIfNeeded;
- (NSString)localizedDisplayName;
- (id)_initWithDisplayOption:(unint64_t)a3 localizedDisplayName:(id)a4;
- (unint64_t)displayOption;
@end

@implementation _SFPerSitePreferencePopoverDisplayInformation

+ (id)popoverDisplayInformationForPerSitePreference:(id)a3
{
  id v4 = a3;
  [a1 _buildMapIfNeeded];
  v5 = (void *)preferenceToDisplayInformation_0;
  v6 = [v4 identifier];

  v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

+ (void)_buildMapIfNeeded
{
  v30[8] = *MEMORY[0x1E4F143B8];
  if (!preferenceToDisplayInformation_0)
  {
    v29[0] = *MEMORY[0x1E4F99410];
    id v3 = objc_alloc((Class)a1);
    v28 = _WBSLocalizedString();
    v27 = (void *)[v3 _initWithDisplayOption:0 localizedDisplayName:v28];
    v30[0] = v27;
    v29[1] = *MEMORY[0x1E4F990E8];
    id v4 = objc_alloc((Class)a1);
    v26 = _WBSLocalizedString();
    v25 = (void *)[v4 _initWithDisplayOption:0 localizedDisplayName:v26];
    v30[1] = v25;
    v29[2] = *MEMORY[0x1E4F99060];
    id v5 = objc_alloc((Class)a1);
    v24 = _WBSLocalizedString();
    v23 = (void *)[v5 _initWithDisplayOption:1 localizedDisplayName:v24];
    v30[2] = v23;
    v29[3] = *MEMORY[0x1E4F992A8];
    id v6 = objc_alloc((Class)a1);
    v22 = _WBSLocalizedString();
    v7 = (void *)[v6 _initWithDisplayOption:1 localizedDisplayName:v22];
    v30[3] = v7;
    v29[4] = *MEMORY[0x1E4F99228];
    id v8 = objc_alloc((Class)a1);
    v9 = _WBSLocalizedString();
    v10 = (void *)[v8 _initWithDisplayOption:1 localizedDisplayName:v9];
    v30[4] = v10;
    v29[5] = *MEMORY[0x1E4F99438];
    id v11 = objc_alloc((Class)a1);
    v12 = _WBSLocalizedString();
    v13 = (void *)[v11 _initWithDisplayOption:0 localizedDisplayName:v12];
    v30[5] = v13;
    v29[6] = *MEMORY[0x1E4F992A0];
    id v14 = objc_alloc((Class)a1);
    v15 = _WBSLocalizedString();
    v16 = (void *)[v14 _initWithDisplayOption:0 localizedDisplayName:v15];
    v30[6] = v16;
    v29[7] = *MEMORY[0x1E4F993D0];
    id v17 = objc_alloc((Class)a1);
    v18 = _WBSLocalizedString();
    v19 = (void *)[v17 _initWithDisplayOption:1 localizedDisplayName:v18];
    v30[7] = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:8];
    v21 = (void *)preferenceToDisplayInformation_0;
    preferenceToDisplayInformation_0 = v20;
  }
}

- (id)_initWithDisplayOption:(unint64_t)a3 localizedDisplayName:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SFPerSitePreferencePopoverDisplayInformation;
  v7 = [(_SFPerSitePreferencePopoverDisplayInformation *)&v13 init];
  id v8 = v7;
  if (v7)
  {
    v7->_displayOption = a3;
    uint64_t v9 = [v6 copy];
    localizedDisplayName = v8->_localizedDisplayName;
    v8->_localizedDisplayName = (NSString *)v9;

    id v11 = v8;
  }

  return v8;
}

- (unint64_t)displayOption
{
  return self->_displayOption;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void).cxx_destruct
{
}

@end