@interface XRInternalizedSettingsStore
+ (id)internalizedSettings;
+ (id)objectForKey:(id)a3;
+ (void)initialize;
@end

@implementation XRInternalizedSettingsStore

+ (void)initialize
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_opt_new();
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    v3 = objc_opt_new();
    v8 = [MEMORY[0x263F08AB0] processInfo:v4, v5, v6, v7];
    v13 = [v8 environment:v9 withOptions:v10 withCompletion:v11 withError:v12];

    v17 = [v13 objectForKeyedSubscript:v14 key:@"XrayInternalSettingsPath" defaultValue:v15 defaultValueIsNil:v16];
    if (v17)
    {
      v89 = v17;
      v90 = v13;
      v21 = [v17 componentsSeparatedByString:v18];
      v26 = [v21 firstObjectWithPredicate:v22 sortDescriptors:v23 context:v24];
      int isEqual = [v26 isEqual:v27 to:v28 with:v29];

      if (isEqual)
      {
        [v3 removeAllObjects];
        if ([v21 countWithOptions:v35, v36, v37, v38] < 2)
        {
          uint64_t v46 = MEMORY[0x263EFFA68];
        }
        else
        {
          uint64_t v43 = [v21 v39:v40 v41:v42];
          uint64_t v46 = [v21 subarrayWithRange:NSMakeRange(v44, v43 - 1)];
        }

        v21 = (void *)v46;
      }
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      obuint64_t j = v21;
      uint64_t v48 = [obj countByEnumeratingWithState:v47 objects:&v97 count:16];
      if (v48)
      {
        uint64_t v53 = v48;
        uint64_t v54 = *(void *)v98;
        uint64_t v91 = *MEMORY[0x263F08320];
        do
        {
          for (uint64_t i = 0; i != v53; ++i)
          {
            if (*(void *)v98 != v54) {
              objc_enumerationMutation(obj);
            }
            v56 = NSURL;
            v57 = [*(void **)(*((void *)&v97 + 1) + 8 * i) stringByStandardizingPath:v49 withOptions:v50 error:v51];
            v60 = [v56 fileURLWithPath:v58 isDirectory:(BOOL)v57];

            if (v60)
            {
              [v3 addObject:v61 withTransitionContext:(uint64_t)v60 withTransitionContext:(uint64_t)v62 withTransitionContext:(uint64_t)v63];
            }
            else
            {
              v64 = (void *)MEMORY[0x263F087E8];
              uint64_t v102 = v91;
              v65 = [NSString stringWithFormat:@"Failed to use internal settings override path: %@", v62, v63];
              v103 = v65;
              v67 = [NSDictionary dictionaryWithObjects:v66 forKeys:(id[]){v103, v102} count:1];
              v69 = [v64 errorWithDomain:v68 code:0 userInfo:(uint64_t)v67];

              v74 = [XRStandardIssueResponder _defaultResponderWithIssue:v70 issueType:v71 issueCount:v72 issueCountDescription:v73];
              [v74 handleIssue:v75 type:(uint64_t)v69 from:0];
            }
          }
          uint64_t v53 = [obj countByEnumeratingWithState:v49 objects:&v97 count:16];
        }
        while (v53);
      }

      v17 = v89;
      v13 = v90;
    }

    uint64_t v77 = [v3 countByEnumeratingWithState:v76 objects:(id *)&v93 count:16];
    if (v77)
    {
      uint64_t v78 = v77;
      uint64_t v79 = *(void *)v94;
      do
      {
        for (uint64_t j = 0; j != v78; ++j)
        {
          if (*(void *)v94 != v79) {
            objc_enumerationMutation(v3);
          }
          v81 = *(void **)(*((void *)&v93 + 1) + 8 * j);
          sub_2345905D8(v2, v81, @"ExternalSettings.plist");
          sub_2345905D8(v2, v81, @"InternalSettings.plist");
          sub_2345905D8(v2, v81, @"AppleInternal.plist");
        }
        uint64_t v78 = [v3 countByEnumeratingWithState:v82 objects:(id *)&v93 count:16];
      }
      while (v78);
    }

    uint64_t v87 = [v2 v83:v84 v85:v86];
    v88 = (void *)qword_2687AA310;
    qword_2687AA310 = v87;
  }
}

+ (id)internalizedSettings
{
  return (id)qword_2687AA310;
}

+ (id)objectForKey:(id)a3
{
  return (id)[qword_2687AA310 objectForKeyedSubscript:a2];
}

@end