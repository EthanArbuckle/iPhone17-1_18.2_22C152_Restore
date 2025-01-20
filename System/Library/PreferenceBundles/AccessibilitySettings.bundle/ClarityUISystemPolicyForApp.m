@interface ClarityUISystemPolicyForApp
- (BOOL)_checkAccessForService:(id)a3;
- (BOOL)_isLocationServicesRestricted;
- (BOOL)_isSystemApplication;
- (BOOL)requiresBluetoothAccess;
- (BOOL)requiresCalendarAccess;
- (BOOL)requiresCameraAccess;
- (BOOL)requiresContactsAccess;
- (BOOL)requiresCrossAppTracking;
- (BOOL)requiresFaceIDAccess;
- (BOOL)requiresFocusAccess;
- (BOOL)requiresHomeKitData;
- (BOOL)requiresLocationAccess;
- (BOOL)requiresMediaLibraryAccess;
- (BOOL)requiresMicrophoneAccess;
- (BOOL)requiresMotionTracking;
- (BOOL)requiresNearbyInteractions;
- (BOOL)requiresPhotosAccess;
- (BOOL)requiresPhotosAddAccess;
- (BOOL)requiresRemindersAccess;
- (BOOL)requiresSpeechRecognition;
- (ClarityUISystemPolicyForApp)initWithBundleIdentifier:(id)a3;
- (NSString)bundleIdentifier;
- (PSSystemPolicyForApp)appPolicy;
- (id)_PSSystemPolicyOptionsAsArray:(unint64_t)a3;
- (id)_PSSystemPolicyOptionsAsString:(unint64_t)a3;
- (id)_axPSSystemPolicyOptions:(unint64_t)a3;
- (id)_axSpecifiersForPolicyOptions:(unint64_t)a3 force:(BOOL)a4;
- (id)_bundle;
- (id)_localizedExplanationsForServices:(id)a3;
- (id)appInfo;
- (id)authLevelStringForStatus:(unint64_t)a3;
- (id)clarityPolicySpecifiers;
- (id)contactsServicesSpecifier;
- (id)developerExplanationsForSpecifiers:(id)a3;
- (id)locationServicesSpecifier;
- (id)locationStatus:(id)a3;
- (id)photosServicesSpecifier;
- (id)privacySpecifiersForPolicyOptions:(unint64_t)a3;
- (id)record;
- (id)systemPolicySpecifiers;
- (id)systemPolicySpecifiersIncludingForced:(BOOL)a3;
- (unint64_t)_axPolicyOptionsFromSpecifiers:(id)a3;
- (unint64_t)claritySupportedPolicyOptions;
- (unint64_t)tccPolicyOptions;
- (void)record;
- (void)setAppPolicy:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setClaritySupportedPolicyOptions:(unint64_t)a3;
- (void)setTccPolicyOptions:(unint64_t)a3;
@end

@implementation ClarityUISystemPolicyForApp

- (ClarityUISystemPolicyForApp)initWithBundleIdentifier:(id)a3
{
  v4 = (NSString *)a3;
  v15.receiver = self;
  v15.super_class = (Class)ClarityUISystemPolicyForApp;
  v5 = [(ClarityUISystemPolicyForApp *)&v15 init];
  v6 = v5;
  if (v5)
  {
    v5->_bundleIdentifier = v4;
    *(_OWORD *)&v5->_claritySupportedPolicyOptions = xmmword_1A16C0;
    appPolicy = v5->_appPolicy;
    v5->_appPolicy = 0;

    uint64_t v8 = objc_opt_new();
    infoPlistCache = v6->_infoPlistCache;
    v6->_infoPlistCache = (NSMutableDictionary *)v8;

    appInfo = v6->_appInfo;
    v6->_appInfo = 0;

    record = v6->_record;
    v6->_record = 0;

    photosPrivacyController = v6->_photosPrivacyController;
    v6->_photosPrivacyController = 0;

    contactsPrivacyController = v6->_contactsPrivacyController;
    v6->_contactsPrivacyController = 0;

    if (!TCCKeyToPolicyMap) {
      InitializeMap();
    }
  }

  return v6;
}

- (id)record
{
  record = self->_record;
  if (!record)
  {
    id v4 = objc_alloc((Class)LSApplicationRecord);
    bundleIdentifier = self->_bundleIdentifier;
    id v11 = 0;
    v6 = (LSApplicationRecord *)[v4 initWithBundleIdentifier:bundleIdentifier allowPlaceholder:0 error:&v11];
    id v7 = v11;
    if (v7)
    {
      uint64_t v8 = CLFLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(ClarityUISystemPolicyForApp *)(uint64_t *)&self->_bundleIdentifier record];
      }
    }
    v9 = self->_record;
    self->_record = v6;

    record = self->_record;
  }

  return record;
}

- (id)_bundle
{
  v2 = [(ClarityUISystemPolicyForApp *)self record];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 URL];
    v5 = +[NSBundle bundleWithURL:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)appInfo
{
  appInfo = self->_appInfo;
  if (!appInfo)
  {
    id v4 = [(ClarityUISystemPolicyForApp *)self _bundle];
    v5 = [v4 pathForResource:@"Info" ofType:@"plist"];

    v6 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithContentsOfFile:v5];
    id v7 = self->_appInfo;
    self->_appInfo = v6;

    appInfo = self->_appInfo;
  }

  return appInfo;
}

- (BOOL)_isSystemApplication
{
  v3 = [(ClarityUISystemPolicyForApp *)self record];
  unsigned int v4 = [v3 developerType];

  v5 = [(ClarityUISystemPolicyForApp *)self record];
  unsigned __int8 v6 = [v5 hasSettingsBundle];

  if (v4 == 1) {
    return v6 ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)_checkAccessForService:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_infoPlistCache objectForKey:v4];

  if (v5)
  {
    unsigned __int8 v6 = [(NSMutableDictionary *)self->_infoPlistCache objectForKey:v4];
    LOBYTE(v7) = [v6 BOOLValue];
  }
  else
  {
    unsigned __int8 v6 = [(ClarityUISystemPolicyForApp *)self appInfo];
    uint64_t v8 = [v6 objectForKey:v4];
    uint64_t v7 = v8 != 0;

    infoPlistCache = self->_infoPlistCache;
    v10 = +[NSNumber numberWithBool:v7];
    [(NSMutableDictionary *)infoPlistCache setObject:v10 forKey:v4];
  }
  return v7;
}

- (BOOL)requiresPhotosAccess
{
  return [(ClarityUISystemPolicyForApp *)self _checkAccessForService:@"NSPhotoLibraryUsageDescription"];
}

- (BOOL)requiresPhotosAddAccess
{
  return [(ClarityUISystemPolicyForApp *)self _checkAccessForService:@"NSPhotoLibraryAddUsageDescription"];
}

- (BOOL)requiresLocationAccess
{
  unsigned __int8 v3 = [(ClarityUISystemPolicyForApp *)self _checkAccessForService:@"NSLocationWhenInUseUsageDescription"];
  unsigned __int8 v4 = [(ClarityUISystemPolicyForApp *)self _checkAccessForService:@"NSLocationAlwaysAndWhenInUseUsageDescription"];
  return v3 | v4 | [(ClarityUISystemPolicyForApp *)self _checkAccessForService:@"NSLocationTemporaryUsageDescriptionDictionary"];
}

- (BOOL)requiresContactsAccess
{
  return [(ClarityUISystemPolicyForApp *)self _checkAccessForService:@"NSContactsUsageDescription"];
}

- (BOOL)requiresBluetoothAccess
{
  if ([(ClarityUISystemPolicyForApp *)self _checkAccessForService:@"NSBluetoothAlwaysUsageDescription"])
  {
    return 1;
  }

  return [(ClarityUISystemPolicyForApp *)self _checkAccessForService:@"NSBluetoothPeripheralUsageDescription"];
}

- (BOOL)requiresCalendarAccess
{
  return [(ClarityUISystemPolicyForApp *)self _checkAccessForService:@"NSCalendarsUsageDescription"];
}

- (BOOL)requiresCameraAccess
{
  return [(ClarityUISystemPolicyForApp *)self _checkAccessForService:@"NSCameraUsageDescription"];
}

- (BOOL)requiresFaceIDAccess
{
  return [(ClarityUISystemPolicyForApp *)self _checkAccessForService:@"NSFaceIDUsageDescription"];
}

- (BOOL)requiresFocusAccess
{
  return [(ClarityUISystemPolicyForApp *)self _checkAccessForService:@"NSFocusStatusUsageDescription"];
}

- (BOOL)requiresMediaLibraryAccess
{
  return [(ClarityUISystemPolicyForApp *)self _checkAccessForService:@"NSAppleMusicUsageDescription"];
}

- (BOOL)requiresMicrophoneAccess
{
  return [(ClarityUISystemPolicyForApp *)self _checkAccessForService:@"NSMicrophoneUsageDescription"];
}

- (BOOL)requiresRemindersAccess
{
  return [(ClarityUISystemPolicyForApp *)self _checkAccessForService:@"NSRemindersUsageDescription"];
}

- (BOOL)requiresSpeechRecognition
{
  return [(ClarityUISystemPolicyForApp *)self _checkAccessForService:@"NSSpeechRecognitionUsageDescription"];
}

- (BOOL)requiresCrossAppTracking
{
  return [(ClarityUISystemPolicyForApp *)self _checkAccessForService:@"NSUserTrackingUsageDescription"];
}

- (BOOL)requiresMotionTracking
{
  return [(ClarityUISystemPolicyForApp *)self _checkAccessForService:@"NSMotionUsageDescription"];
}

- (BOOL)requiresNearbyInteractions
{
  return [(ClarityUISystemPolicyForApp *)self _checkAccessForService:@"NSNearbyInteractionUsageDescription"];
}

- (BOOL)requiresHomeKitData
{
  return [(ClarityUISystemPolicyForApp *)self _checkAccessForService:@"NSHomeKitUsageDescription"];
}

- (id)systemPolicySpecifiers
{
  return [(ClarityUISystemPolicyForApp *)self systemPolicySpecifiersIncludingForced:0];
}

- (id)clarityPolicySpecifiers
{
  return [(ClarityUISystemPolicyForApp *)self systemPolicySpecifiersIncludingForced:1];
}

- (id)systemPolicySpecifiersIncludingForced:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(ClarityUISystemPolicyForApp *)self appPolicy];

  if (!v5)
  {
    id v6 = [objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:self->_bundleIdentifier];
    [(ClarityUISystemPolicyForApp *)self setAppPolicy:v6];
  }
  uint64_t v7 = [(ClarityUISystemPolicyForApp *)self _axSpecifiersForPolicyOptions:self->_tccPolicyOptions force:0];
  uint64_t v8 = +[NSMutableArray arrayWithArray:v7];

  if (v3 && ![(ClarityUISystemPolicyForApp *)self _isSystemApplication])
  {
    unint64_t v10 = [(ClarityUISystemPolicyForApp *)self _axPolicyOptionsFromSpecifiers:v8];
    unint64_t tccPolicyOptions = self->_tccPolicyOptions;
    v12 = CLFLogSettings();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      bundleIdentifier = self->_bundleIdentifier;
      v14 = [(ClarityUISystemPolicyForApp *)self _PSSystemPolicyOptionsAsString:v10];
      int v17 = 138412546;
      v18 = bundleIdentifier;
      __int16 v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Bundle ID: %@ - Current Options from Preferences: %@", (uint8_t *)&v17, 0x16u);
    }
    objc_super v15 = [(ClarityUISystemPolicyForApp *)self privacySpecifiersForPolicyOptions:tccPolicyOptions & ~v10];
    [v8 addObjectsFromArray:v15];
    id v9 = [(ClarityUISystemPolicyForApp *)self developerExplanationsForSpecifiers:v8];
  }
  else
  {
    id v9 = v8;
  }

  return v9;
}

- (id)_axSpecifiersForPolicyOptions:(unint64_t)a3 force:(BOOL)a4
{
  uint64_t v4 = a4;
  v36 = objc_opt_new();
  v41 = self;
  uint64_t v7 = [(ClarityUISystemPolicyForApp *)self _axPSSystemPolicyOptions:a3];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v40 = [v7 countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v48;
    *(void *)&long long v8 = 138412290;
    long long v35 = v8;
    unsigned int v38 = v4;
    v37 = v7;
    do
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(void *)v48 != v39) {
          objc_enumerationMutation(v7);
        }
        unint64_t v10 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v11 = objc_msgSend(v7, "valueForKey:", v10, v35);
        v12 = v11;
        if (v11)
        {
          v42 = v11;
          id v13 = [v11 integerValue];
          v14 = [(ClarityUISystemPolicyForApp *)v41 appPolicy];
          objc_super v15 = [v14 specifiersForPolicyOptions:v13 force:v4];

          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          v16 = v15;
          id v17 = [v16 countByEnumeratingWithState:&v43 objects:v55 count:16];
          if (v17)
          {
            id v18 = v17;
            id v19 = 0;
            uint64_t v20 = *(void *)v44;
            do
            {
              for (j = 0; j != v18; j = (char *)j + 1)
              {
                if (*(void *)v44 != v20) {
                  objc_enumerationMutation(v16);
                }
                v22 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
                if ([v22 cellType])
                {
                  if (v19)
                  {
                    v23 = CLFLogSettings();
                    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      v52 = v22;
                      __int16 v53 = 2112;
                      id v54 = v19;
                      _os_log_error_impl(&dword_0, v23, OS_LOG_TYPE_ERROR, "Found more than one specifier! Something is wrong! \n\t New Specifier: %@. \n\t Previously Found Specifier: %@", buf, 0x16u);
                    }
                  }
                  else
                  {
                    id v19 = v22;
                  }
                }
              }
              id v18 = [v16 countByEnumeratingWithState:&v43 objects:v55 count:16];
            }
            while (v18);
          }
          else
          {
            id v19 = 0;
          }

          uint64_t v4 = v38;
          if (v38)
          {
            uint64_t v7 = v37;
            v12 = v42;
            if (!v19)
            {
              if ([v10 isEqualToString:@"PSSystemPolicyOptionsPrivacyPhotos"])
              {
                v24 = [(ClarityUISystemPolicyForApp *)v41 photosServicesSpecifier];
                id v19 = v24;
                if (v24) {
                  id v25 = v24;
                }
              }
              else
              {
                id v19 = 0;
              }
              if ([v10 isEqualToString:@"PSSystemPolicyOptionsPrivacyAddressBook"])
              {
                v26 = [(ClarityUISystemPolicyForApp *)v41 contactsServicesSpecifier];
                v27 = v26;
                if (v26)
                {
                  id v28 = v26;

                  id v19 = v28;
                }
              }
              if ([v10 isEqualToString:@"PSSystemPolicyOptionsLocation"])
              {
                v29 = [(ClarityUISystemPolicyForApp *)v41 locationServicesSpecifier];
                v30 = v29;
                if (v29)
                {
                  id v31 = v29;

                  id v19 = v31;
                }
              }
            }
          }
          else
          {
            uint64_t v7 = v37;
            v12 = v42;
          }
          if (v19)
          {
            [v19 setProperty:v10 forKey:@"ClarityIDKey"];
            [v19 setProperty:v12 forKey:@"ClarityPSPolicyOption"];
            v32 = [(id)SpecifierIdentifierToTCCKeyMap objectForKey:v10];
            [v19 setProperty:v32 forKey:@"ClarityTCCIdentifier"];
            [v36 addObject:v19];
            goto LABEL_45;
          }
          if (v38)
          {
            v32 = CLFLogSettings();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v35;
              v52 = v10;
              _os_log_error_impl(&dword_0, v32, OS_LOG_TYPE_ERROR, "Forcing policyKey: %@, but no specifier was found!", buf, 0xCu);
            }
LABEL_45:
          }
          goto LABEL_47;
        }
        v16 = CLFLogSettings();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v35;
          v52 = v10;
          _os_log_error_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "No PSSystemPolicyOption found policyKey: %@", buf, 0xCu);
        }
LABEL_47:
      }
      id v40 = [v7 countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v40);
  }
  v33 = [(ClarityUISystemPolicyForApp *)v41 developerExplanationsForSpecifiers:v36];

  return v33;
}

- (unint64_t)_axPolicyOptionsFromSpecifiers:(id)a3
{
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    id v6 = v4;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v17;
    *(void *)&long long v5 = 138412290;
    long long v15 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v3);
        }
        unint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "propertyForKey:", @"ClarityPSPolicyOption", v15);
        v12 = v11;
        if (v11)
        {
          v7 |= (unint64_t)[v11 integerValue];
        }
        else
        {
          id v13 = CLFLogSettings();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            v21 = v10;
            _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "Specifier property for ClarityPSPolicyOptionKey is nil! Specifier: %@", buf, 0xCu);
          }
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)privacySpecifiersForPolicyOptions:(unint64_t)a3
{
  long long v5 = CLFLogSettings();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Checking which System Policy Specifiers we will need to force to appear.", buf, 2u);
  }

  id v6 = CLFLogSettings();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    bundleIdentifier = self->_bundleIdentifier;
    uint64_t v8 = [(ClarityUISystemPolicyForApp *)self _PSSystemPolicyOptionsAsString:a3];
    *(_DWORD *)buf = 138412546;
    unsigned int v38 = bundleIdentifier;
    __int16 v39 = 2112;
    id v40 = v8;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Bundle ID: %@ - Policy Options to check for: %@", buf, 0x16u);
  }
  id v9 = [(ClarityUISystemPolicyForApp *)self _axPSSystemPolicyOptions:a3];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v10)
  {
    uint64_t v13 = 0;
    goto LABEL_24;
  }
  id v12 = v10;
  uint64_t v13 = 0;
  uint64_t v14 = *(void *)v33;
  long long v15 = off_266000;
  *(void *)&long long v11 = 138412290;
  long long v30 = v11;
  id v31 = v9;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(void *)v33 != v14) {
        objc_enumerationMutation(v9);
      }
      long long v17 = *(NSString **)(*((void *)&v32 + 1) + 8 * i);
      long long v18 = objc_msgSend(v15[277], "objectForKey:", v17, v30);
      if (v18)
      {
        if (![(ClarityUISystemPolicyForApp *)self _checkAccessForService:v18]) {
          goto LABEL_20;
        }
        long long v19 = [v9 objectForKey:v17];
        uint64_t v20 = v19;
        if (v19)
        {
          v13 |= (unint64_t)[v19 integerValue];
        }
        else
        {
          v21 = v15;
          v22 = self;
          uint64_t v23 = v13;
          v24 = CLFLogSettings();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v30;
            unsigned int v38 = v17;
            _os_log_error_impl(&dword_0, v24, OS_LOG_TYPE_ERROR, "No Policy Option Number found for policyKey: %@", buf, 0xCu);
          }

          uint64_t v13 = v23;
          self = v22;
          long long v15 = v21;
          id v9 = v31;
        }
      }
      else
      {
        uint64_t v20 = CLFLogSettings();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v30;
          unsigned int v38 = v17;
          _os_log_error_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "No TCC Key found for policyKey: %@", buf, 0xCu);
        }
      }

LABEL_20:
    }
    id v12 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  }
  while (v12);
LABEL_24:
  id v25 = CLFLogSettings();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = self->_bundleIdentifier;
    v27 = [(ClarityUISystemPolicyForApp *)self _PSSystemPolicyOptionsAsString:v13];
    *(_DWORD *)buf = 138412546;
    unsigned int v38 = v26;
    __int16 v39 = 2112;
    id v40 = v27;
    _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "Bundle ID: %@ - Forcing Specifiers for Policy Options: %@", buf, 0x16u);
  }
  id v28 = [(ClarityUISystemPolicyForApp *)self _axSpecifiersForPolicyOptions:v13 force:1];

  return v28;
}

- (id)_localizedExplanationsForServices:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v4 = a3;
  long long v5 = +[LSApplicationProxy applicationProxyForIdentifier:bundleIdentifier];
  id v6 = +[NSSet setWithArray:v4];

  unint64_t v7 = [v5 localizedValuesForKeys:v6 fromTable:0];

  return v7;
}

- (id)developerExplanationsForSpecifiers:(id)a3
{
  id v4 = a3;
  long long v17 = [(id)TCCKeyToSpecifierIdentifierMap allKeys];
  long long v19 = [(ClarityUISystemPolicyForApp *)self _localizedExplanationsForServices:v17];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v9 = [v8 name];
        id v10 = [v8 propertyForKey:@"ClarityTCCIdentifier"];
        if (v10)
        {
          *(void *)v29 = 0;
          *(void *)&v29[8] = v29;
          *(void *)&v29[16] = 0x3032000000;
          long long v30 = __Block_byref_object_copy__2;
          id v31 = __Block_byref_object_dispose__2;
          id v32 = 0;
          id v20 = v19;
          id v11 = v10;
          AXPerformSafeBlock();
          if (*(void *)(*(void *)&v29[8] + 40))
          {
            id v12 = CLFLogSettings();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v13 = *(void **)(*(void *)&v29[8] + 40);
              *(_DWORD *)buf = 138412546;
              id v26 = v13;
              __int16 v27 = 2112;
              id v28 = v11;
              _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Found explanation: %@ for TCCKey: %@.", buf, 0x16u);
            }

            [v8 setProperty:*(void *)(*(void *)&v29[8] + 40) forKey:@"ClarityTCCExplanation"];
          }
          else
          {
            long long v15 = CLFLogSettings();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v26 = v11;
              _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "No explanation found for TCCKey: %@", buf, 0xCu);
            }
          }
          _Block_object_dispose(v29, 8);
        }
        else
        {
          uint64_t v14 = CLFLogSettings();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v29 = 138412546;
            *(void *)&v29[4] = v9;
            *(_WORD *)&v29[12] = 2112;
            *(void *)&v29[14] = v8;
            _os_log_error_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "A valid tcc key was not found for tcc title: %@, specifier: %@", v29, 0x16u);
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v5);
  }

  return obj;
}

uint64_t __66__ClarityUISystemPolicyForApp_developerExplanationsForSpecifiers___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stringForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return _objc_release_x1(v2, v4);
}

- (id)photosServicesSpecifier
{
  BOOL v3 = [(ClarityUISystemPolicyForApp *)self requiresPhotosAccess];
  BOOL v4 = [(ClarityUISystemPolicyForApp *)self requiresPhotosAddAccess];
  BOOL v5 = v4;
  if (v3 || v4)
  {
    photosPrivacyController = self->_photosPrivacyController;
    if (!photosPrivacyController)
    {
      uint64_t v8 = (PSPhotosPolicyController *)objc_opt_new();
      id v9 = self->_photosPrivacyController;
      self->_photosPrivacyController = v8;

      photosPrivacyController = self->_photosPrivacyController;
    }
    id v10 = settingsLocString(@"PHOTOS", @"ClarityUISettings");
    uint64_t v6 = [(PSPhotosPolicyController *)photosPrivacyController appSpecifierWithName:v10 bundleID:self->_bundleIdentifier showPhotosAccess:v3 showPhotosAddAccess:v5];

    [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:PSLazyIconLoading];
    [v6 setObject:@"com.apple.mobileslideshow" forKeyedSubscript:PSLazyIconAppID];
    [v6 setProperty:@"Photos" forKey:@"ClarityIDKey"];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)contactsServicesSpecifier
{
  if ([(ClarityUISystemPolicyForApp *)self requiresContactsAccess])
  {
    contactsPrivacyController = self->_contactsPrivacyController;
    if (!contactsPrivacyController)
    {
      BOOL v4 = (PSContactsPolicyController *)objc_opt_new();
      BOOL v5 = self->_contactsPrivacyController;
      self->_contactsPrivacyController = v4;

      contactsPrivacyController = self->_contactsPrivacyController;
    }
    uint64_t v6 = settingsLocString(@"CONTACTS", @"ClarityUISettings");
    unint64_t v7 = [(PSContactsPolicyController *)contactsPrivacyController appSpecifierWithName:v6 bundleID:self->_bundleIdentifier showContactsAccess:1 showPickerUsage:0];

    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:PSLazyIconLoading];
    [v7 setObject:@"com.apple.MobileAddressBook" forKeyedSubscript:PSLazyIconAppID];
    [v7 setProperty:@"Contacts" forKey:@"ClarityIDKey"];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)locationServicesSpecifier
{
  BOOL v3 = settingsLocString(@"LOCATION_SERVICES", @"ClarityUISettings");
  BOOL v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:0 get:"locationStatus:" detail:NSClassFromString(@"PUILocationServicesAuthorizationLevelController") cell:2 edit:0];

  BOOL v5 = +[NSNumber numberWithInt:[(ClarityUISystemPolicyForApp *)self _isLocationServicesRestricted] ^ 1];
  [v4 setProperty:v5 forKey:PSEnabledKey];

  [v4 setProperty:self->_bundleIdentifier forKey:PSIDKey];
  [v4 setProperty:NSClassFromString(@"PSUILocationServicesAuthLevelCell") forKey:PSCellClassKey];
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:PSLazyIconLoading];
  [v4 setObject:@"com.apple.graphic-icon.location" forKeyedSubscript:PSIconUTTypeIdentifierKey];
  [v4 setProperty:@"Location" forKey:@"ClarityIDKey"];

  return v4;
}

- (BOOL)_isLocationServicesRestricted
{
  return !+[CLLocationManager locationServicesEnabled];
}

- (id)locationStatus:(id)a3
{
  BOOL v4 = (void *)CLCopyAppsUsingLocation();
  BOOL v5 = [v4 objectForKey:self->_bundleIdentifier];
  id v6 = +[CLLocationManager entityAuthorizationForLocationDictionary:v5];

  unint64_t v7 = [(ClarityUISystemPolicyForApp *)self authLevelStringForStatus:v6];

  return v7;
}

- (id)authLevelStringForStatus:(unint64_t)a3
{
  if (a3)
  {
    id v6 = @"NEVER_AUTHORIZATION";
  }
  else if (a3)
  {
    if ((a3 & 4) != 0)
    {
      id v6 = @"ALWAYS_AUTHORIZATION";
    }
    else
    {
      if ((a3 & 2) == 0)
      {
        BOOL v4 = 0;
        return v4;
      }
      id v6 = @"WHEN_IN_USE_AUTHORIZATION_SHORT";
    }
  }
  else
  {
    id v6 = @"NOT_DETERMINED_AUTHORIZATION_SHORT";
  }
  BOOL v4 = settingsLocString(v6, @"ClarityUISettings");
  return v4;
}

- (id)_axPSSystemPolicyOptions:(unint64_t)a3
{
  BOOL v4 = objc_opt_new();
  BOOL v5 = v4;
  if (a3)
  {
    [v4 setObject:&off_229FD8 forKey:@"PSSystemPolicyOptionsNotifications"];
    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_42;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v5 setObject:&off_229E70 forKey:@"PSSystemPolicyOptionsBackgroundRefresh"];
  if ((a3 & 4) == 0)
  {
LABEL_4:
    if ((a3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_43;
  }
LABEL_42:
  [v5 setObject:&off_229ED0 forKey:@"PSSystemPolicyOptionsPrivacyAddressBook"];
  if ((a3 & 8) == 0)
  {
LABEL_5:
    if ((a3 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_44;
  }
LABEL_43:
  [v5 setObject:&off_229EA0 forKey:@"PSSystemPolicyOptionsPrivacyCalendar"];
  if ((a3 & 0x10) == 0)
  {
LABEL_6:
    if ((a3 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_45;
  }
LABEL_44:
  [v5 setObject:&off_22A008 forKey:@"PSSystemPolicyOptionsPrivacyReminders"];
  if ((a3 & 0x20) == 0)
  {
LABEL_7:
    if ((a3 & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_46;
  }
LABEL_45:
  [v5 setObject:&off_229FF0 forKey:@"PSSystemPolicyOptionsPrivacyPhotos"];
  if ((a3 & 0x400) == 0)
  {
LABEL_8:
    if ((a3 & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_47;
  }
LABEL_46:
  [v5 setObject:&off_229E88 forKey:@"PSSystemPolicyOptionsBluetooth"];
  if ((a3 & 0x800) == 0)
  {
LABEL_9:
    if ((a3 & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_48;
  }
LABEL_47:
  [v5 setObject:&off_229F90 forKey:@"PSSystemPolicyOptionsMicrophone"];
  if ((a3 & 0x1000) == 0)
  {
LABEL_10:
    if ((a3 & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_49;
  }
LABEL_48:
  [v5 setObject:&off_229FA8 forKey:@"PSSystemPolicyOptionsMotion"];
  if ((a3 & 0x2000) == 0)
  {
LABEL_11:
    if ((a3 & 0x4000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v5 setObject:&off_229EB8 forKey:@"PSSystemPolicyOptionsCamera"];
  if ((a3 & 0x4000) == 0)
  {
LABEL_12:
    if ((a3 & 0x8000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_51;
  }
LABEL_50:
  [v5 setObject:&off_22A068 forKey:@"PSSystemPolicyOptionsUbiquity"];
  if ((a3 & 0x8000) == 0)
  {
LABEL_13:
    if ((a3 & 0x10000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_52;
  }
LABEL_51:
  [v5 setObject:&off_22A080 forKey:@"PSSystemPolicyOptionsCellularData"];
  if ((a3 & 0x10000) == 0)
  {
LABEL_14:
    if ((a3 & 0x20000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_53;
  }
LABEL_52:
  [v5 setObject:&off_229F60 forKey:@"PSSystemPolicyOptionsLocation"];
  if ((a3 & 0x20000) == 0)
  {
LABEL_15:
    if ((a3 & 0x40000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_54;
  }
LABEL_53:
  [v5 setObject:&off_22A098 forKey:@"PSSystemPolicyOptionsKeyboardNetworking"];
  if ((a3 & 0x40000) == 0)
  {
LABEL_16:
    if ((a3 & 0x80000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v5 setObject:&off_229F30 forKey:@"PSSystemPolicyOptionsWillow"];
  if ((a3 & 0x80000) == 0)
  {
LABEL_17:
    if ((a3 & 0x100000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_56;
  }
LABEL_55:
  [v5 setObject:&off_229F78 forKey:@"PSSystemPolicyOptionsMediaLibrary"];
  if ((a3 & 0x100000) == 0)
  {
LABEL_18:
    if ((a3 & 0x200000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_57;
  }
LABEL_56:
  [v5 setObject:&off_22A038 forKey:@"PSSystemPolicyOptionsSpeechRecognition"];
  if ((a3 & 0x200000) == 0)
  {
LABEL_19:
    if ((a3 & 0x400000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_58;
  }
LABEL_57:
  [v5 setObject:&off_22A0B0 forKey:@"PSSystemPolicyOptionsVideoSubscriber"];
  if ((a3 & 0x400000) == 0)
  {
LABEL_20:
    if ((a3 & 0x800000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_59;
  }
LABEL_58:
  [v5 setObject:&off_22A0C8 forKey:@"PSSystemPolicyOptionsDocumentsAndData"];
  if ((a3 & 0x800000) == 0)
  {
LABEL_21:
    if ((a3 & 0x1000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_60;
  }
LABEL_59:
  [v5 setObject:&off_22A020 forKey:@"PSSystemPolicyOptionsAssistantAndSearch"];
  if ((a3 & 0x1000000) == 0)
  {
LABEL_22:
    if ((a3 & 0x2000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_61;
  }
LABEL_60:
  [v5 setObject:&off_229F00 forKey:@"PSSystemPolicyOptionsFaceID"];
  if ((a3 & 0x2000000) == 0)
  {
LABEL_23:
    if ((a3 & 0x4000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_62;
  }
LABEL_61:
  [v5 setObject:&off_22A0E0 forKey:@"PSSystemPolicyOptionsPreferredLanguage"];
  if ((a3 & 0x4000000) == 0)
  {
LABEL_24:
    if ((a3 & 0x8000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_63;
  }
LABEL_62:
  [v5 setObject:&off_229F48 forKey:@"PSSystemPolicyOptionsNetwork"];
  if ((a3 & 0x8000000) == 0)
  {
LABEL_25:
    if ((a3 & 0x10000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_64;
  }
LABEL_63:
  [v5 setObject:&off_22A0F8 forKey:@"PSSystemPolicyOptionsAccounts"];
  if ((a3 & 0x10000000) == 0)
  {
LABEL_26:
    if ((a3 & 0x20000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_65;
  }
LABEL_64:
  [v5 setObject:&off_22A050 forKey:@"PSSystemPolicyOptionsCrossSiteTracking"];
  if ((a3 & 0x20000000) == 0)
  {
LABEL_27:
    if ((a3 & 0x40000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_66;
  }
LABEL_65:
  [v5 setObject:&off_22A110 forKey:@"PSSystemPolicyOptionsDefaultBrowser"];
  if ((a3 & 0x40000000) == 0)
  {
LABEL_28:
    if ((a3 & 0x80000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_67;
  }
LABEL_66:
  [v5 setObject:&off_22A128 forKey:@"PSSystemPolicyOptionsDefaultMailApp"];
  if ((a3 & 0x80000000) == 0)
  {
LABEL_29:
    if ((a3 & 0x100000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_68;
  }
LABEL_67:
  [v5 setObject:&off_229EE8 forKey:@"PSSystemPolicyOptionsCrossAppTracking"];
  if ((a3 & 0x100000000) == 0)
  {
LABEL_30:
    if ((a3 & 0x400000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_69;
  }
LABEL_68:
  [v5 setObject:&off_22A140 forKey:@"PSSystemPolicyOptionsExposureNotification"];
  if ((a3 & 0x400000000) == 0)
  {
LABEL_31:
    if ((a3 & 0x800000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_70;
  }
LABEL_69:
  [v5 setObject:&off_229F18 forKey:@"PSSystemPolicyOptionsUserAvailability"];
  if ((a3 & 0x800000000) == 0)
  {
LABEL_32:
    if ((a3 & 0x1000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_71;
  }
LABEL_70:
  [v5 setObject:&off_229FC0 forKey:@"PSSystemPolicyOptionsNearbyInteraction"];
  if ((a3 & 0x1000000000) == 0)
  {
LABEL_33:
    if ((a3 & 0x8000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_72;
  }
LABEL_71:
  [v5 setObject:&off_22A158 forKey:@"PSSystemPolicyOptionsFamilyControls"];
  if ((a3 & 0x8000000000) == 0)
  {
LABEL_34:
    if ((a3 & 0x10000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_73;
  }
LABEL_72:
  [v5 setObject:&off_22A170 forKey:@"PSSystemPolicyOptionsTapToPayLock"];
  if ((a3 & 0x10000000000) == 0)
  {
LABEL_35:
    if ((a3 & 0x20000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_74;
  }
LABEL_73:
  [v5 setObject:&off_22A188 forKey:@"PSSystemPolicyOptionsLiveActivities"];
  if ((a3 & 0x20000000000) == 0)
  {
LABEL_36:
    if ((a3 & 0x40000000000) == 0) {
      goto LABEL_37;
    }
LABEL_75:
    [v5 setObject:&off_22A1B8 forKey:@"PSSystemPolicyOptionsTapToPaySound"];
    if ((a3 & 0x80000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
LABEL_74:
  [v5 setObject:&off_22A1A0 forKey:@"PSSystemPolicyOptionsPasteboard"];
  if ((a3 & 0x40000000000) != 0) {
    goto LABEL_75;
  }
LABEL_37:
  if ((a3 & 0x80000000000) != 0) {
LABEL_38:
  }
    [v5 setObject:&off_22A1D0 forKey:@"PSSystemPolicyOptionsNudityDetection"];
LABEL_39:
  id v6 = v5;

  return v6;
}

- (id)_PSSystemPolicyOptionsAsArray:(unint64_t)a3
{
  uint64_t v3 = [(ClarityUISystemPolicyForApp *)self _axPSSystemPolicyOptions:a3];
  BOOL v4 = [v3 allValues];

  return v4;
}

- (id)_PSSystemPolicyOptionsAsString:(unint64_t)a3
{
  uint64_t v3 = [(ClarityUISystemPolicyForApp *)self _axPSSystemPolicyOptions:a3];
  BOOL v4 = [v3 allKeys];
  BOOL v5 = [v4 componentsJoinedByString:@", "];

  return v5;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  self->_bundleIdentifier = (NSString *)a3;
}

- (unint64_t)claritySupportedPolicyOptions
{
  return self->_claritySupportedPolicyOptions;
}

- (void)setClaritySupportedPolicyOptions:(unint64_t)a3
{
  self->_claritySupportedPolicyOptions = a3;
}

- (unint64_t)tccPolicyOptions
{
  return self->_tccPolicyOptions;
}

- (void)setTccPolicyOptions:(unint64_t)a3
{
  self->_unint64_t tccPolicyOptions = a3;
}

- (PSSystemPolicyForApp)appPolicy
{
  return self->_appPolicy;
}

- (void)setAppPolicy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appPolicy, 0);
  objc_storeStrong((id *)&self->_contactsPrivacyController, 0);
  objc_storeStrong((id *)&self->_photosPrivacyController, 0);
  objc_storeStrong((id *)&self->_clarityServices, 0);
  objc_storeStrong((id *)&self->_appInfo, 0);
  objc_storeStrong((id *)&self->_infoPlistCache, 0);

  objc_storeStrong((id *)&self->_record, 0);
}

- (void)record
{
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "LSApplicationRecord Lookup for Bundle ID: %@, encountered error: %@", (uint8_t *)&v4, 0x16u);
}

@end