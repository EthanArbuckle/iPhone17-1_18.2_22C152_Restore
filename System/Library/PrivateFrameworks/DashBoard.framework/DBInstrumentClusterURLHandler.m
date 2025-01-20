@interface DBInstrumentClusterURLHandler
+ (BOOL)_isMapsClusterURL:(id)a3;
+ (BOOL)isURLSupported:(id)a3;
+ (id)_correctedComponentsForURL:(id)a3;
+ (unint64_t)_clusterSettingForURLValue:(id)a3;
+ (unint64_t)_gaugeClusterPresentationForURLValue:(id)a3;
+ (unint64_t)_layoutSettingForURLValue:(id)a3;
+ (void)applySettingsForClusterURL:(id)a3 toSceneSettings:(id)a4;
@end

@implementation DBInstrumentClusterURLHandler

+ (BOOL)isURLSupported:(id)a3
{
  if (a3)
  {
    return objc_msgSend(a1, "_isMapsClusterURL:");
  }
  else
  {
    v5 = DBLogForCategory(8uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[DBInstrumentClusterURLHandler isURLSupported:](v5);
    }

    return 0;
  }
}

+ (void)applySettingsForClusterURL:(id)a3 toSceneSettings:(id)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [v7 setItemType:0];
  [v7 setShowsSpeedLimit:2];
  [v7 setShowsCompass:2];
  [v7 setShowsETA:2];
  [v7 setLayoutJustification:0];
  v53 = v7;
  [v7 setHostedAltScreenPresentationType:0];
  if (v6)
  {
    v8 = [a1 _correctedComponentsForURL:v6];
    v9 = [v8 path];
    v10 = [v9 pathComponents];
    v11 = (void *)[v10 mutableCopy];

    objc_msgSend(v11, "db_removeFirstObjectIfMatching:", @"/");
    v12 = [v8 scheme];
    LODWORD(v10) = [v12 isEqualToString:@"maps"];

    if (!v10 || !objc_msgSend(v11, "db_removeFirstObjectsIfMatching:", &unk_26E17EFA8)) {
      goto LABEL_38;
    }
    if ([v11 count])
    {
      if (objc_msgSend(v11, "db_removeFirstObjectIfMatching:", @"instructioncard"))
      {
        v13 = DBLogForCategory(8uLL);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v14 = 2;
          _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_DEFAULT, "Received instrument cluster URL of type instructioncard.", buf, 2u);
        }
        else
        {
          uint64_t v14 = 2;
        }
      }
      else
      {
        if (!objc_msgSend(v11, "db_removeFirstObjectIfMatching:", @"map"))
        {
LABEL_19:
          if ([v11 count])
          {
            v15 = v53;
            v53 = 0;
          }
          else
          {
            long long v60 = 0u;
            long long v61 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            v15 = [v8 queryItems];
            uint64_t v16 = [v15 countByEnumeratingWithState:&v58 objects:v64 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              v49 = v8;
              id v51 = v6;
              v47 = v11;
              id v18 = a1;
              uint64_t v19 = *(void *)v59;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v59 != v19) {
                    objc_enumerationMutation(v15);
                  }
                  v21 = *(void **)(*((void *)&v58 + 1) + 8 * i);
                  v22 = objc_msgSend(v21, "value", v47, v49, v51);
                  v23 = [v22 lowercaseString];

                  v24 = [v21 name];
                  int v25 = [v24 isEqualToString:@"showSpeedLimit"];

                  if (v25)
                  {
                    objc_msgSend(v53, "setShowsSpeedLimit:", objc_msgSend(v18, "_clusterSettingForURLValue:", v23));
                  }
                  else
                  {
                    v26 = [v21 name];
                    int v27 = [v26 isEqualToString:@"showCompass"];

                    if (v27)
                    {
                      objc_msgSend(v53, "setShowsCompass:", objc_msgSend(v18, "_clusterSettingForURLValue:", v23));
                    }
                    else
                    {
                      v28 = [v21 name];
                      int v29 = [v28 isEqualToString:@"showETA"];

                      if (v29)
                      {
                        objc_msgSend(v53, "setShowsETA:", objc_msgSend(v18, "_clusterSettingForURLValue:", v23));
                      }
                      else
                      {
                        v30 = [v21 name];
                        int v31 = [v30 isEqualToString:@"maneuverLayout"];

                        if (v31) {
                          objc_msgSend(v53, "setLayoutJustification:", objc_msgSend(v18, "_layoutSettingForURLValue:", v23));
                        }
                      }
                    }
                  }
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v58 objects:v64 count:16];
              }
              while (v17);
              a1 = v18;
              v11 = v47;
              v8 = v49;
              id v6 = v51;
            }
          }

LABEL_38:
          v32 = [v8 scheme];
          int v33 = [v32 isEqualToString:@"nextGenInstrumentCluster"];

          if (v33)
          {
            if ([v11 count])
            {

              goto LABEL_54;
            }
            v48 = v11;
            v50 = v8;
            id v52 = v6;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            v34 = [v8 queryItems];
            uint64_t v35 = [v34 countByEnumeratingWithState:&v54 objects:v63 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v55;
              do
              {
                for (uint64_t j = 0; j != v36; ++j)
                {
                  if (*(void *)v55 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  v39 = *(void **)(*((void *)&v54 + 1) + 8 * j);
                  v40 = [v39 value];
                  v41 = [v40 lowercaseString];

                  v42 = [v39 name];
                  int v43 = [v42 isEqualToString:@"showETA"];

                  if (v43)
                  {
                    objc_msgSend(v53, "setShowsETA:", objc_msgSend(a1, "_clusterSettingForURLValue:", v41));
                  }
                  else
                  {
                    v44 = [v39 name];
                    int v45 = [v44 isEqualToString:@"altScreenPresentation"];

                    if (v45) {
                      objc_msgSend(v53, "setHostedAltScreenPresentationType:", objc_msgSend(a1, "_gaugeClusterPresentationForURLValue:", v41));
                    }
                  }
                }
                uint64_t v36 = [v34 countByEnumeratingWithState:&v54 objects:v63 count:16];
              }
              while (v36);
            }

            v8 = v50;
            id v6 = v52;
            v11 = v48;
          }
          if (v53)
          {
LABEL_57:

            goto LABEL_58;
          }
LABEL_54:
          v46 = DBLogForCategory(8uLL);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
            +[DBInstrumentClusterURLHandler applySettingsForClusterURL:toSceneSettings:]((uint64_t)v6, v46);
          }

          v53 = 0;
          goto LABEL_57;
        }
        v13 = DBLogForCategory(8uLL);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_DEFAULT, "Received instrument cluster URL of type map.", buf, 2u);
        }
        uint64_t v14 = 1;
      }
    }
    else
    {
      v13 = DBLogForCategory(8uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_DEFAULT, "Received a base instrument cluster URL; using type AnyContent",
          buf,
          2u);
      }
      uint64_t v14 = 3;
    }

    [v53 setItemType:v14];
    goto LABEL_19;
  }
  v8 = DBLogForCategory(8uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[DBInstrumentClusterURLHandler isURLSupported:](v8);
  }
LABEL_58:
}

+ (id)_correctedComponentsForURL:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F08BA0];
  id v4 = a3;
  v5 = [v3 componentsWithURL:v4 resolvingAgainstBaseURL:0];
  id v6 = [v4 absoluteString];

  id v7 = [v5 scheme];
  v8 = [v7 stringByAppendingString:@"://"];
  if ([v6 hasPrefix:v8])
  {
    v9 = [v7 stringByAppendingString:@":/"];
    v10 = (void *)[v6 mutableCopy];
    objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", v8, v9, 8, 0, objc_msgSend(v10, "length"));
    v11 = (void *)MEMORY[0x263F08BA0];
    v12 = [NSURL URLWithString:v10];
    uint64_t v13 = [v11 componentsWithURL:v12 resolvingAgainstBaseURL:0];

    v5 = (void *)v13;
  }

  return v5;
}

+ (BOOL)_isMapsClusterURL:(id)a3
{
  uint64_t v3 = [a3 absoluteString];
  id v4 = [v3 lowercaseString];

  if ([v4 hasPrefix:@"maps:/car/instrumentcluster"]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 hasPrefix:@"maps://car/instrumentcluster"];
  }

  return v5;
}

+ (unint64_t)_layoutSettingForURLValue:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"leftaligned"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"rightaligned"])
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = [v3 isEqualToString:@"topaligned"];
  }

  return v4;
}

+ (unint64_t)_clusterSettingForURLValue:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"yes"] & 1) != 0
    || ([v3 isEqualToString:@"1"] & 1) != 0)
  {
    unint64_t v4 = 1;
  }
  else if (([v3 isEqualToString:@"no"] & 1) != 0 {
         || ([v3 isEqualToString:@"0"] & 1) != 0)
  }
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"user"])
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = 2;
  }

  return v4;
}

+ (unint64_t)_gaugeClusterPresentationForURLValue:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"dcacarousel"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"mapsmediacarousel"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"popover"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"passengerdisplay"])
  {
    unint64_t v4 = 4;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (void)isURLSupported:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22D6F0000, log, OS_LOG_TYPE_ERROR, "No available cluster URL.", v1, 2u);
}

+ (void)applySettingsForClusterURL:(uint64_t)a1 toSceneSettings:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "Received an invalid instrument cluster URL: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end