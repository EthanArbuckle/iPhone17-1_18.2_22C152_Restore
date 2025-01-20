@interface INSystemAppMapper
+ (id)supportedIntentsOverridesForBundleIdentifier:(id)a3;
- (INSystemAppMapper)init;
- (id).cxx_construct;
- (id)bundleIdentifiersForIntentExecutionMatchingBundleIdentifier:(id)a3;
- (id)extensionToDisplayableAppBundleIdentifierMapping;
- (id)extensionToLaunchableAppBundleIdentifierMapping;
- (id)matchForBundleIdentifier:(id)a3;
- (id)matchForBundleIdentifier:(id)a3 intentName:(id)a4;
- (id)resolvedAppMatchingExtensionBundleIdentifier:(id)a3;
- (id)resolvedIntentForAccessibilityActionWithBundleIdentifier:(id)a3 intentClassName:(id)a4;
- (id)resolvedIntentMatchingAppBundleIdentifier:(id)a3 preferredCallProvider:(int64_t)a4 intentClassName:(id)a5;
- (id)resolvedIntentMatchingExtensionBundleIdentifier:(id)a3 preferredCallProvider:(int64_t)a4 intentClassName:(id)a5;
@end

@implementation INSystemAppMapper

- (INSystemAppMapper)init
{
  v107[8] = *MEMORY[0x1E4F143B8];
  v90.receiver = self;
  v90.super_class = (Class)INSystemAppMapper;
  v2 = [(INSystemAppMapper *)&v90 init];
  v83 = v2;
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = 0;
    p_mapping = (uint64_t **)&v2->_mapping;
    do
    {
      v6 = (&INSystemAppsMapping)[v4];
      v7 = (&INSystemAppsMapping)[v4 + 1];
      v8 = (&INSystemAppsMapping)[v4 + 2];
      std::string::basic_string[abi:ne180100]<0>(__p, v6);
      v9 = std::__tree<std::__value_type<std::string,INSystemApp>,std::__map_value_compare<std::string,std::__value_type<std::string,INSystemApp>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,INSystemApp>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_mapping, __p, (uint64_t)__p);
      v9[7] = (uint64_t *)v6;
      v9[8] = (uint64_t *)v7;
      v9[9] = (uint64_t *)v8;
      if (v89 < 0) {
        operator delete(__p[0]);
      }
      std::string::basic_string[abi:ne180100]<0>(__p, v7);
      v10 = std::__tree<std::__value_type<std::string,INSystemApp>,std::__map_value_compare<std::string,std::__value_type<std::string,INSystemApp>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,INSystemApp>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_mapping, __p, (uint64_t)__p);
      v10[7] = (uint64_t *)v6;
      v10[8] = (uint64_t *)v7;
      v10[9] = (uint64_t *)v8;
      if (v89 < 0) {
        operator delete(__p[0]);
      }
      std::string::basic_string[abi:ne180100]<0>(__p, v8);
      v11 = std::__tree<std::__value_type<std::string,INSystemApp>,std::__map_value_compare<std::string,std::__value_type<std::string,INSystemApp>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,INSystemApp>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_mapping, __p, (uint64_t)__p);
      v11[7] = (uint64_t *)v6;
      v11[8] = (uint64_t *)v7;
      v11[9] = (uint64_t *)v8;
      if (v89 < 0) {
        operator delete(__p[0]);
      }
      v4 += 3;
    }
    while (v4 != 132);
    v82 = [NSString stringWithUTF8String:"com.apple.facetime"];
    v63 = [NSString stringWithUTF8String:"com.apple.facetime"];
    v106 = v63;
    v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];
    v81 = [NSString stringWithUTF8String:"com.apple.FaceTime"];
    v62 = [NSString stringWithUTF8String:"com.apple.NanoPhone"];
    v105 = v62;
    v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v105 count:1];
    v59 = +[INSystemAppGrouping groupingForKey:iOS:macOS:watchOS:](INSystemAppGrouping, "groupingForKey:iOS:macOS:watchOS:", v82, v61, v81);
    v107[0] = v59;
    v80 = [NSString stringWithUTF8String:"com.apple.InCallService"];
    v58 = [NSString stringWithUTF8String:"com.apple.InCallService"];
    v104 = v58;
    v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v104 count:1];
    v78 = [NSString stringWithUTF8String:"com.apple.FaceTime"];
    v57 = [NSString stringWithUTF8String:"com.apple.Carousel"];
    v103 = v57;
    v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v103 count:1];
    v55 = +[INSystemAppGrouping groupingForKey:iOS:macOS:watchOS:](INSystemAppGrouping, "groupingForKey:iOS:macOS:watchOS:", v80, v79, v78);
    v107[1] = v55;
    v77 = [NSString stringWithUTF8String:"com.apple.mobilephone"];
    v54 = [NSString stringWithUTF8String:"com.apple.mobilephone"];
    v102[0] = v54;
    v53 = [NSString stringWithUTF8String:"com.apple.InCallService"];
    v102[1] = v53;
    v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:2];
    v75 = [NSString stringWithUTF8String:"com.apple.FaceTime"];
    v52 = [NSString stringWithUTF8String:"com.apple.NanoPhone"];
    v101 = v52;
    v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
    v50 = +[INSystemAppGrouping groupingForKey:iOS:macOS:watchOS:](INSystemAppGrouping, "groupingForKey:iOS:macOS:watchOS:", v77, v76, v75);
    v107[2] = v50;
    v74 = [NSString stringWithUTF8String:"com.apple.mobiletimer"];
    v49 = [NSString stringWithUTF8String:"com.apple.mobiletimer"];
    v100 = v49;
    v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
    v72 = [NSString stringWithUTF8String:"com.apple.clock"];
    v48 = [NSString stringWithUTF8String:"com.apple.NanoAlarm"];
    v99[0] = v48;
    v47 = [NSString stringWithUTF8String:"com.apple.NanoStopwatch"];
    v99[1] = v47;
    v46 = [NSString stringWithUTF8String:"com.apple.private.NanoTimer"];
    v99[2] = v46;
    v45 = [NSString stringWithUTF8String:"com.apple.NanoWorldClock"];
    v99[3] = v45;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:4];
    v43 = +[INSystemAppGrouping groupingForKey:iOS:macOS:watchOS:](INSystemAppGrouping, "groupingForKey:iOS:macOS:watchOS:", v74, v73, v72);
    v107[3] = v43;
    v71 = [NSString stringWithUTF8String:"com.apple.findmy"];
    v42 = [NSString stringWithUTF8String:"com.apple.findmy"];
    v98 = v42;
    v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];
    v69 = [NSString stringWithUTF8String:"com.apple.findmy"];
    v41 = [NSString stringWithUTF8String:"com.apple.findmy.finddevices"];
    v97[0] = v41;
    v40 = [NSString stringWithUTF8String:"com.apple.findmy.finditems"];
    v97[1] = v40;
    v39 = [NSString stringWithUTF8String:"com.apple.findmy"];
    v97[2] = v39;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:3];
    v37 = +[INSystemAppGrouping groupingForKey:iOS:macOS:watchOS:](INSystemAppGrouping, "groupingForKey:iOS:macOS:watchOS:", v71, v70, v69);
    v107[4] = v37;
    v68 = [NSString stringWithUTF8String:"com.apple.FaceTime"];
    v36 = [NSString stringWithUTF8String:"com.apple.facetime"];
    v96[0] = v36;
    v35 = [NSString stringWithUTF8String:"com.apple.mobilephone"];
    v96[1] = v35;
    v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:2];
    v34 = [NSString stringWithUTF8String:"com.apple.FaceTime"];
    v33 = +[INSystemAppGrouping groupingForKey:iOS:macOS:watchOS:](INSystemAppGrouping, "groupingForKey:iOS:macOS:watchOS:", v68, v67);
    v107[5] = v33;
    v66 = [NSString stringWithUTF8String:"com.apple.Carousel"];
    v32 = [NSString stringWithUTF8String:"com.apple.InCallService"];
    v95 = v32;
    v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
    v31 = [NSString stringWithUTF8String:"com.apple.Carousel"];
    v94 = v31;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
    v13 = +[INSystemAppGrouping groupingForKey:v66 iOS:v65 macOS:0 watchOS:v12];
    v107[6] = v13;
    v14 = [NSString stringWithUTF8String:"com.apple.NanoPhone"];
    v15 = [NSString stringWithUTF8String:"com.apple.facetime"];
    v93[0] = v15;
    v16 = [NSString stringWithUTF8String:"com.apple.mobilephone"];
    v93[1] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:2];
    v18 = [NSString stringWithUTF8String:"com.apple.NanoPhone"];
    v92 = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:1];
    v20 = +[INSystemAppGrouping groupingForKey:v14 iOS:v17 macOS:0 watchOS:v19];
    v107[7] = v20;
    v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:8];

    v21 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v22 = v64;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v84 objects:v91 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v85;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v85 != v24) {
            objc_enumerationMutation(v22);
          }
          v26 = *(void **)(*((void *)&v84 + 1) + 8 * i);
          v27 = [v26 key];
          [(NSDictionary *)v21 setObject:v26 forKey:v27];
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v84 objects:v91 count:16];
      }
      while (v23);
    }

    bundleIdentifierGroupingForIntentExecution = v83->_bundleIdentifierGroupingForIntentExecution;
    v83->_bundleIdentifierGroupingForIntentExecution = v21;

    v29 = v83;
    v3 = v83;
  }

  return v83;
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifierGroupingForIntentExecution, 0);
  left = (char *)self->_mapping.__tree_.__pair1_.__value_.__left_;

  std::__tree<std::__value_type<std::string,INSystemApp>,std::__map_value_compare<std::string,std::__value_type<std::string,INSystemApp>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,INSystemApp>>>::destroy(left);
}

- (id)resolvedIntentForAccessibilityActionWithBundleIdentifier:(id)a3 intentClassName:(id)a4
{
  id v5 = a4;
  v6 = [NSString stringWithUTF8String:"com.apple.Preferences"];
  v7 = [(INSystemAppMapper *)self matchForBundleIdentifier:v6];
  v8 = [v7 bundleIdentifierForCurrentPlatform];

  v9 = objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", 0, 2, @"AX");
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v8 allowPlaceholder:0 error:0];
  v11 = [INIntentDescriptor alloc];
  v12 = [v10 localizedName];
  v13 = [v10 teamIdentifier];
  v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
  v15 = [(INIntentDescriptor *)v11 initWithIntentClassName:v9 localizedName:v12 bundleIdentifier:v8 displayableBundleIdentifier:v8 extensionBundleIdentifier:@"com.apple.AccessibilityUtilities.AXSettingsShortcuts" uiExtensionBundleIdentifier:0 counterpartIdentifiers:0 teamIdentifier:v13 preferredCallProvider:0 supportedIntents:v14 bundleURL:0 documentTypes:0];

  return v15;
}

- (id)extensionToDisplayableAppBundleIdentifierMapping
{
  v24[6] = *MEMORY[0x1E4F143B8];
  v23[0] = @"com.apple.ActionKit.BundledIntentHandler";
  id v22 = [NSString stringWithUTF8String:"com.apple.shortcuts"];
  v21 = [(INSystemAppMapper *)self matchForBundleIdentifier:v22];
  v20 = [v21 bundleIdentifierForCurrentPlatform];
  v24[0] = v20;
  v23[1] = @"com.apple.TelephonyUtilities.PhoneIntentHandler";
  v19 = [NSString stringWithUTF8String:"com.apple.mobilephone"];
  v18 = -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:");
  v17 = [v18 bundleIdentifierForCurrentPlatform];
  v24[1] = v17;
  v23[2] = @"com.apple.PassKit.PassKitIntentsExtension";
  v16 = [NSString stringWithUTF8String:"com.apple.Passbook"];
  v15 = -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:");
  v14 = [v15 bundleIdentifierForCurrentPlatform];
  v24[2] = v14;
  v23[3] = @"com.apple.HomeKit.HomeKitIntentExtension";
  v3 = [NSString stringWithUTF8String:"com.apple.Home"];
  uint64_t v4 = [(INSystemAppMapper *)self matchForBundleIdentifier:v3];
  id v5 = [v4 bundleIdentifierForCurrentPlatform];
  v24[3] = v5;
  v23[4] = @"com.apple.DoNotDisturb.Intents";
  v6 = [NSString stringWithUTF8String:"com.apple.Preferences"];
  v7 = [(INSystemAppMapper *)self matchForBundleIdentifier:v6];
  v8 = [v7 bundleIdentifierForCurrentPlatform];
  v24[4] = v8;
  v23[5] = @"com.apple.AccessibilityUtilities.AXSettingsShortcuts";
  v9 = [NSString stringWithUTF8String:"com.apple.Preferences"];
  v10 = [(INSystemAppMapper *)self matchForBundleIdentifier:v9];
  v11 = [v10 bundleIdentifierForCurrentPlatform];
  v24[5] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:6];

  return v12;
}

- (id)extensionToLaunchableAppBundleIdentifierMapping
{
  v36[10] = *MEMORY[0x1E4F143B8];
  v35[0] = @"com.apple.WorkflowKit.ShortcutsIntents";
  v34 = [NSString stringWithUTF8String:"com.apple.shortcuts"];
  v33 = [(INSystemAppMapper *)self matchForBundleIdentifier:v34];
  v32 = [v33 bundleIdentifierForCurrentPlatform];
  v36[0] = v32;
  v35[1] = @"com.apple.TelephonyUtilities.PhoneIntentHandler";
  v31 = [NSString stringWithUTF8String:"com.apple.InCallService"];
  v30 = -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:");
  v29 = [v30 bundleIdentifierForCurrentPlatform];
  v36[1] = v29;
  v35[2] = @"com.apple.AccessibilityUtilities.AXSettingsShortcuts";
  v28 = [NSString stringWithUTF8String:"com.apple.Preferences"];
  v27 = -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:");
  v26 = [v27 bundleIdentifierForCurrentPlatform];
  v36[2] = v26;
  v35[3] = @"com.apple.ActionKit.BundledIntentHandler";
  v25 = [NSString stringWithUTF8String:"com.apple.shortcuts"];
  uint64_t v24 = -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:");
  uint64_t v23 = [v24 bundleIdentifierForCurrentPlatform];
  v36[3] = v23;
  v35[4] = @"com.apple.UniversalAccess.UASettingsShortcuts";
  id v22 = [NSString stringWithUTF8String:"com.apple.systempreferences"];
  v21 = -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:");
  v20 = [v21 bundleIdentifierForCurrentPlatform];
  v36[4] = v20;
  v35[5] = @"com.apple.mobiletimer-framework.MobileTimerIntents";
  v19 = [NSString stringWithUTF8String:"com.apple.mobiletimer"];
  v18 = -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:");
  v17 = [v18 bundleIdentifierForCurrentPlatform];
  v36[5] = v17;
  v35[6] = @"com.apple.PBBridgeSupport.BridgeIntents";
  v16 = [NSString stringWithUTF8String:"com.apple.Bridge"];
  v15 = -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:");
  v3 = [v15 bundleIdentifierForCurrentPlatform];
  v36[6] = v3;
  v35[7] = @"com.apple.PassKit.PassKitIntentsExtension";
  uint64_t v4 = [NSString stringWithUTF8String:"com.apple.MobileSMS"];
  id v5 = [(INSystemAppMapper *)self matchForBundleIdentifier:v4];
  v6 = [v5 bundleIdentifierForCurrentPlatform];
  v36[7] = v6;
  v35[8] = @"com.apple.HomeKit.HomeKitIntentExtension";
  v7 = [NSString stringWithUTF8String:"com.apple.Home"];
  v8 = [(INSystemAppMapper *)self matchForBundleIdentifier:v7];
  v9 = [v8 bundleIdentifierForCurrentPlatform];
  v36[8] = v9;
  v35[9] = @"com.apple.DoNotDisturb.Intents";
  v10 = [NSString stringWithUTF8String:"com.apple.Preferences"];
  v11 = [(INSystemAppMapper *)self matchForBundleIdentifier:v10];
  v12 = [v11 bundleIdentifierForCurrentPlatform];
  v36[9] = v12;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:10];

  return v14;
}

- (id)bundleIdentifiersForIntentExecutionMatchingBundleIdentifier:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSDictionary *)self->_bundleIdentifierGroupingForIntentExecution objectForKey:v4];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 iOS];
  }
  else
  {
    v8 = [(INSystemAppMapper *)self matchForBundleIdentifier:v4];
    v9 = [v8 bundleIdentifierForCurrentPlatform];

    if (v9)
    {
      v11[0] = v9;
      v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)matchForBundleIdentifier:(id)a3 intentName:(id)a4
{
  id v4 = -[INSystemAppMapper matchForBundleIdentifier:](self, "matchForBundleIdentifier:", a3, a4);

  return v4;
}

- (id)matchForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v4 UTF8String]);
    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, INSystemApp>, void *>>> *)self->_mapping.__tree_.__pair1_.__value_.__left_;
    p_pair1 = &self->_mapping.__tree_.__pair1_;
    v6 = left;
    if (!left) {
      goto LABEL_9;
    }
    v8 = p_pair1;
    do
    {
      BOOL v9 = std::less<std::string>::operator()[abi:ne180100](&v6[4].__value_.__left_, __p);
      v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, INSystemApp>, void *>>> **)&v6[1];
      if (!v9)
      {
        v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, INSystemApp>, void *>>> **)v6;
        v8 = v6;
      }
      v6 = *v10;
    }
    while (*v10);
    if (v8 == p_pair1 || std::less<std::string>::operator()[abi:ne180100](__p, &v8[4].__value_.__left_))
    {
LABEL_9:
      v11 = 0;
    }
    else
    {
      id v14 = v8[7].__value_.__left_;
      v13 = v8[8].__value_.__left_;
      v15 = v8[9].__value_.__left_;
      v16 = [NSString stringWithUTF8String:v13];
      v17 = [NSString stringWithUTF8String:v14];
      v18 = [NSString stringWithUTF8String:v15];
      if ([v17 length]) {
        v19 = v17;
      }
      else {
        v19 = 0;
      }
      uint64_t v20 = [v16 length];
      uint64_t v21 = [v18 length];
      if (v20) {
        id v22 = v16;
      }
      else {
        id v22 = 0;
      }
      if (v21) {
        uint64_t v23 = v18;
      }
      else {
        uint64_t v23 = 0;
      }
      v11 = +[INSystemAppMatch matchWithiOSBundleIdentifier:v19 macOSBundleIdentifier:v22 watchOSBundleIdentifier:v23];
    }
    if (v25 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)resolvedIntentMatchingAppBundleIdentifier:(id)a3 preferredCallProvider:(int64_t)a4 intentClassName:(id)a5
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v25[0] = @"com.apple.AccessibilityUtilities.AXSettingsShortcuts";
  v25[1] = @"com.apple.UniversalAccess.UASettingsShortcuts";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  if ([v10 containsObject:v8])
  {
    v11 = [(INSystemAppMapper *)self resolvedIntentForAccessibilityActionWithBundleIdentifier:v8 intentClassName:v9];
  }
  else
  {
    v12 = [NSString stringWithUTF8String:"com.apple.NanoSettings"];
    uint64_t v23 = v12;
    v13 = [NSString stringWithUTF8String:"com.apple.Bridge"];
    uint64_t v24 = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];

    v15 = [v14 objectForKey:v8];
    if (v15)
    {
      v16 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v15 allowPlaceholder:0 error:0];
      v17 = v16;
      if (v16
        && ([v16 applicationState],
            v18 = objc_claimAutoreleasedReturnValue(),
            char v19 = [v18 isInstalled],
            v18,
            (v19 & 1) != 0))
      {
        uint64_t v20 = [[INAppDescriptor alloc] initWithApplicationRecord:v17];
        uint64_t v21 = [[INIntentDescriptor alloc] initWithIntentClassName:v9 localizedName:0 bundleIdentifier:0 displayableBundleIdentifier:0 extensionBundleIdentifier:0 uiExtensionBundleIdentifier:0 counterpartIdentifiers:0 teamIdentifier:0 preferredCallProvider:a4 supportedIntents:0 bundleURL:0 documentTypes:0];
        v11 = [(INIntentDescriptor *)v21 descriptorWithAppDescriptor:v20];
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)resolvedIntentMatchingExtensionBundleIdentifier:(id)a3 preferredCallProvider:(int64_t)a4 intentClassName:(id)a5
{
  id v8 = a3;
  id v28 = a5;
  id v9 = [(INSystemAppMapper *)self extensionToLaunchableAppBundleIdentifierMapping];
  uint64_t v10 = [v9 objectForKey:v8];

  v11 = [(INSystemAppMapper *)self extensionToDisplayableAppBundleIdentifierMapping];
  uint64_t v12 = [v11 objectForKey:v8];

  if (v10 | v12)
  {
    if (a4 == 2)
    {
      v13 = [NSString stringWithUTF8String:"com.apple.facetime"];
      id v14 = [(INSystemAppMapper *)self matchForBundleIdentifier:v13];
      uint64_t v15 = [v14 bundleIdentifierForCurrentPlatform];

      uint64_t v12 = v15;
    }
    id v16 = objc_alloc(MEMORY[0x1E4F223C8]);
    if (v10) {
      uint64_t v17 = v10;
    }
    else {
      uint64_t v17 = v12;
    }
    v18 = (void *)[v16 initWithBundleIdentifier:v17 allowPlaceholder:0 error:0];
    char v19 = [v18 localizedName];
    if (v12 && ([(id)v10 isEqualToString:v12] & 1) == 0)
    {
      uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v12 allowPlaceholder:0 error:0];
      uint64_t v21 = [v20 localizedName];

      char v19 = (void *)v21;
    }
    id v22 = [INIntentDescriptor alloc];
    uint64_t v23 = objc_msgSend(v18, "in_counterpartIdentifiers");
    uint64_t v24 = [v18 teamIdentifier];
    char v25 = objc_msgSend(v18, "in_supportedIntents");
    v26 = [(INIntentDescriptor *)v22 initWithIntentClassName:v28 localizedName:v19 bundleIdentifier:v10 displayableBundleIdentifier:v12 extensionBundleIdentifier:v8 uiExtensionBundleIdentifier:0 counterpartIdentifiers:v23 teamIdentifier:v24 preferredCallProvider:a4 supportedIntents:v25 bundleURL:0 documentTypes:0];
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)resolvedAppMatchingExtensionBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INSystemAppMapper *)self extensionToLaunchableAppBundleIdentifierMapping];
  uint64_t v6 = [v5 objectForKey:v4];

  v7 = [(INSystemAppMapper *)self extensionToDisplayableAppBundleIdentifierMapping];
  uint64_t v8 = [v7 objectForKey:v4];

  if (!(v6 | v8))
  {
    uint64_t v12 = 0;
    goto LABEL_16;
  }
  id v9 = objc_alloc(MEMORY[0x1E4F223C8]);
  if (v6) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = v8;
  }
  v11 = (void *)[v9 initWithBundleIdentifier:v10 allowPlaceholder:0 error:0];
  if (v11)
  {
    if (!v6 || v8)
    {
      if (v6 || !v8) {
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v8 = v6;
    }
    uint64_t v6 = (uint64_t)(id)v8;
    uint64_t v8 = v6;
LABEL_14:
    v13 = [INAppDescriptor alloc];
    uint64_t v20 = [v11 localizedName];
    char v19 = objc_msgSend(v11, "in_counterpartIdentifiers");
    v18 = [v11 teamIdentifier];
    uint64_t v17 = objc_msgSend(v11, "in_supportedIntents");
    id v14 = [v11 URL];
    uint64_t v15 = objc_msgSend(v11, "in_documentTypes");
    uint64_t v12 = [(INAppDescriptor *)v13 initWithLocalizedName:v20 bundleIdentifier:v6 extensionBundleIdentifier:v4 counterpartIdentifiers:v19 teamIdentifier:v18 supportedIntents:v17 bundleURL:v14 documentTypes:v15];

    goto LABEL_15;
  }
  uint64_t v12 = 0;
LABEL_15:

LABEL_16:

  return v12;
}

+ (id)supportedIntentsOverridesForBundleIdentifier:(id)a3
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [NSString stringWithUTF8String:"com.apple.NanoAlarm"];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"MTCreateAlarmIntent", @"MTDeleteAlarmIntent", @"MTDisableAlarmIntent", @"MTEnableAlarmIntent", @"MTGetAlarmsIntent", @"MTToggleAlarmIntent", @"MTUpdateAlarmIntent", 0, v4);
  v16[0] = v5;
  uint64_t v6 = [NSString stringWithUTF8String:"com.apple.private.NanoTimer"];
  v15[1] = v6;
  v7 = [MEMORY[0x1E4F1CAD0] setWithObject:@"INCreateTimerIntent"];
  v16[1] = v7;
  uint64_t v8 = [NSString stringWithUTF8String:"com.apple.NanoSettings"];
  v15[2] = v8;
  id v9 = [MEMORY[0x1E4F1CAD0] setWithObject:@"DNDToggleDoNotDisturbIntent"];
  v16[2] = v9;
  uint64_t v10 = [NSString stringWithUTF8String:"com.apple.VoiceMemos"];
  v15[3] = v10;
  v11 = [MEMORY[0x1E4F1CAD0] setWithObject:@"PlaybackVoiceMemoIntent"];
  v16[3] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];

  v13 = [v12 objectForKey:v3];

  return v13;
}

@end