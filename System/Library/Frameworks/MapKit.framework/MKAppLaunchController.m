@interface MKAppLaunchController
+ (id)sharedController;
+ (void)launchAttributionURLs:(id)a3 withAttribution:(id)a4 completionHandler:(id)a5;
+ (void)launchAttributionURLs:(id)a3 withAttribution:(id)a4 usingTarget:(int)a5 completionHandler:(id)a6;
- (NSURL)webURL;
- (void)lookUpAppStoreURLForBundle:(id)a3 usingTarget:(int)a4 completionHandler:(id)a5;
- (void)setWebURL:(id)a3;
@end

@implementation MKAppLaunchController

+ (id)sharedController
{
  if (qword_1EB315DD0 != -1) {
    dispatch_once(&qword_1EB315DD0, &__block_literal_global_41);
  }
  v2 = (void *)_MergedGlobals_145;

  return v2;
}

void __41__MKAppLaunchController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(MKAppLaunchController);
  v1 = (void *)_MergedGlobals_145;
  _MergedGlobals_145 = (uint64_t)v0;
}

- (void)lookUpAppStoreURLForBundle:(id)a3 usingTarget:(int)a4 completionHandler:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if ([v8 length])
  {
    v10 = +[MKAppleMediaServices sharedInstance];
    v15[0] = v8;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__MKAppLaunchController_lookUpAppStoreURLForBundle_usingTarget_completionHandler___block_invoke;
    v12[3] = &unk_1E54BAC30;
    v12[4] = self;
    id v13 = v9;
    int v14 = a4;
    [v10 appleMediaServicesResultsWithBundleIdentifiers:v11 source:1 completion:v12];
  }
  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

void __82__MKAppLaunchController_lookUpAppStoreURLForBundle_usingTarget_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  if (!v5)
  {
    id v9 = [v18 firstObject];
    id v8 = [v9 url];

    goto LABEL_5;
  }
  v6 = [*(id *)(a1 + 32) webURL];

  if (v6)
  {
    v7 = [*(id *)(a1 + 32) webURL];
    NSLog(&cfstr_Mkapplemediase_0.isa, v5, v7);

    id v8 = [*(id *)(a1 + 32) webURL];
LABEL_5:
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v8, 0);
    }
    v11 = +[MKSystemController sharedInstance];
    [v11 openURL:v8 completionHandler:0];

    v12 = [v8 host];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      int v14 = +[MKMapService sharedService];
      uint64_t v15 = *(unsigned int *)(a1 + 48);
      v16 = [v8 host];
      [v14 captureUserAction:6050 onTarget:v15 eventValue:v16];
    }
    goto LABEL_12;
  }
  NSLog(&cfstr_ErrorLaunching.isa, v5);
  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, void, void))(v17 + 16))(v17, 0, 0);
  }
  id v8 = 0;
LABEL_12:
}

+ (void)launchAttributionURLs:(id)a3 withAttribution:(id)a4 completionHandler:(id)a5
{
}

+ (void)launchAttributionURLs:(id)a3 withAttribution:(id)a4 usingTarget:(int)a5 completionHandler:(id)a6
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(void, void *, void *))a6;
  if ([v10 count])
  {
    unsigned int v96 = a5;
    id v89 = a1;
    uint64_t v13 = [a1 sharedController];
    [v13 setWebURL:0];
    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    obuint64_t j = v10;
    v99 = v13;
    v100 = v11;
    uint64_t v101 = [obj countByEnumeratingWithState:&v143 objects:v156 count:16];
    id v97 = v10;
    v98 = v12;
    if (v101)
    {
      v104 = 0;
      uint64_t v14 = *(void *)v144;
      uint64_t v15 = *MEMORY[0x1E4F63E48];
      do
      {
        uint64_t v16 = 0;
        uint64_t v17 = v101;
        do
        {
          if (*(void *)v144 != v14) {
            objc_enumerationMutation(obj);
          }
          id v18 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(*((void *)&v143 + 1) + 8 * v16)];
          v19 = [v18 scheme];
          if (([v19 isEqualToString:@"http"] & 1) != 0
            || ([v18 scheme],
                v20 = objc_claimAutoreleasedReturnValue(),
                int v21 = [v20 isEqualToString:@"https"],
                v20,
                v21))
          {
            v22 = [v13 webURL];

            if (!v22) {
              [v13 setWebURL:v18];
            }
          }
          else if ([v19 isEqualToString:v15])
          {
            if (!v104)
            {
              v23 = [MEMORY[0x1E4F223E0] defaultWorkspace];
              v104 = [v23 applicationsAvailableForOpeningURL:v18];
            }
            long long v141 = 0u;
            long long v142 = 0u;
            long long v139 = 0u;
            long long v140 = 0u;
            id v105 = [v11 attributionApps];
            uint64_t v90 = [v105 countByEnumeratingWithState:&v139 objects:v155 count:16];
            if (v90)
            {
              uint64_t v24 = *(void *)v140;
              uint64_t v83 = v15;
              uint64_t v86 = v14;
              uint64_t v82 = *(void *)v140;
              do
              {
                uint64_t v25 = 0;
                do
                {
                  if (*(void *)v140 != v24) {
                    objc_enumerationMutation(v105);
                  }
                  uint64_t v93 = v25;
                  v26 = [*(id *)(*((void *)&v139 + 1) + 8 * v25) appBundleIdentifier];
                  long long v135 = 0u;
                  long long v136 = 0u;
                  long long v137 = 0u;
                  long long v138 = 0u;
                  id v27 = v104;
                  uint64_t v28 = [v27 countByEnumeratingWithState:&v135 objects:v154 count:16];
                  if (v28)
                  {
                    uint64_t v29 = v28;
                    uint64_t v30 = *(void *)v136;
                    do
                    {
                      for (uint64_t i = 0; i != v29; ++i)
                      {
                        if (*(void *)v136 != v30) {
                          objc_enumerationMutation(v27);
                        }
                        v32 = [*(id *)(*((void *)&v135 + 1) + 8 * i) bundleIdentifier];
                        int v33 = [v32 isEqualToString:v26];

                        if (v33)
                        {
                          v12 = v98;
                          if (v98) {
                            v98[2](v98, v18, v26);
                          }
                          v36 = +[MKSystemController sharedInstance];
                          [v36 openURL:v18 bundleIdentifier:v26 completionHandler:0];

                          v37 = +[MKMapService sharedService];
                          v38 = [v18 absoluteString];
                          [v37 captureUserAction:6050 onTarget:v96 eventValue:v38];

                          v104 = v27;
                          uint64_t v13 = v99;
                          id v11 = v100;
LABEL_38:

                          goto LABEL_108;
                        }
                      }
                      uint64_t v29 = [v27 countByEnumeratingWithState:&v135 objects:v154 count:16];
                    }
                    while (v29);
                  }

                  uint64_t v25 = v93 + 1;
                  uint64_t v13 = v99;
                  id v11 = v100;
                  uint64_t v15 = v83;
                  uint64_t v14 = v86;
                  uint64_t v17 = v101;
                  uint64_t v24 = v82;
                }
                while (v93 + 1 != v90);
                uint64_t v90 = [v105 countByEnumeratingWithState:&v139 objects:v155 count:16];
              }
              while (v90);
            }
          }
          else
          {
            v34 = [MEMORY[0x1E4F42738] sharedApplication];
            int v35 = [v34 canOpenURL:v18];

            if (v35)
            {
              v12 = v98;
              if (v98) {
                v98[2](v98, v18, 0);
              }
              v80 = +[MKSystemController sharedInstance];
              [v80 openURL:v18 completionHandler:0];

              v81 = +[MKMapService sharedService];
              v26 = [v18 absoluteString];
              id v105 = v81;
              [v81 captureUserAction:6050 onTarget:v96 eventValue:v26];
              goto LABEL_38;
            }
            uint64_t v17 = v101;
          }

          ++v16;
        }
        while (v16 != v17);
        uint64_t v101 = [obj countByEnumeratingWithState:&v143 objects:v156 count:16];
      }
      while (v101);
    }
    else
    {
      v104 = 0;
    }

    if (GEOConfigGetBOOL() && [v11 shouldOpenInAppStore])
    {
      long long v133 = 0u;
      long long v134 = 0u;
      long long v131 = 0u;
      long long v132 = 0u;
      id v39 = obj;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v131 objects:v153 count:16];
      if (v40)
      {
        uint64_t v41 = *(void *)v132;
        unint64_t v42 = 0x1E4F1C000uLL;
        uint64_t v84 = *(void *)v132;
        v87 = v39;
        do
        {
          uint64_t v43 = 0;
          uint64_t v91 = v40;
          do
          {
            if (*(void *)v132 != v41) {
              objc_enumerationMutation(v39);
            }
            id v18 = [*(id *)(v42 + 2832) URLWithString:*(void *)(*((void *)&v131 + 1) + 8 * v43)];
            long long v127 = 0u;
            long long v128 = 0u;
            long long v129 = 0u;
            long long v130 = 0u;
            v19 = [v11 attributionApps];
            uint64_t v102 = [v19 countByEnumeratingWithState:&v127 objects:v152 count:16];
            if (v102)
            {
              uint64_t v44 = *(void *)v128;
              uint64_t v94 = *(void *)v128;
              do
              {
                for (uint64_t j = 0; j != v102; ++j)
                {
                  if (*(void *)v128 != v44) {
                    objc_enumerationMutation(v19);
                  }
                  v46 = *(void **)(*((void *)&v127 + 1) + 8 * j);
                  long long v123 = 0u;
                  long long v124 = 0u;
                  long long v125 = 0u;
                  long long v126 = 0u;
                  id v105 = [v46 handledSchemes];
                  uint64_t v47 = [v105 countByEnumeratingWithState:&v123 objects:v151 count:16];
                  if (v47)
                  {
                    uint64_t v48 = v47;
                    uint64_t v49 = *(void *)v124;
                    do
                    {
                      for (uint64_t k = 0; k != v48; ++k)
                      {
                        if (*(void *)v124 != v49) {
                          objc_enumerationMutation(v105);
                        }
                        uint64_t v51 = *(void *)(*((void *)&v123 + 1) + 8 * k);
                        v52 = [v18 scheme];
                        LODWORD(v51) = [v52 isEqualToString:v51];

                        if (v51)
                        {
LABEL_102:
                          v76 = [v89 sharedController];
                          v77 = [v46 appBundleIdentifier];
                          v12 = v98;
                          [v76 lookUpAppStoreURLForBundle:v77 usingTarget:v96 completionHandler:v98];

                          goto LABEL_107;
                        }
                      }
                      uint64_t v48 = [v105 countByEnumeratingWithState:&v123 objects:v151 count:16];
                    }
                    while (v48);
                  }

                  id v11 = v100;
                  uint64_t v44 = v94;
                }
                uint64_t v102 = [v19 countByEnumeratingWithState:&v127 objects:v152 count:16];
              }
              while (v102);
            }

            ++v43;
            uint64_t v41 = v84;
            id v39 = v87;
            unint64_t v42 = 0x1E4F1C000;
          }
          while (v43 != v91);
          uint64_t v40 = [v87 countByEnumeratingWithState:&v131 objects:v153 count:16];
        }
        while (v40);
      }
    }
    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id v53 = obj;
    uint64_t v54 = [v53 countByEnumeratingWithState:&v119 objects:v150 count:16];
    if (!v54) {
      goto LABEL_74;
    }
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v120;
LABEL_67:
    uint64_t v57 = 0;
    while (1)
    {
      if (*(void *)v120 != v56) {
        objc_enumerationMutation(v53);
      }
      id v18 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(*((void *)&v119 + 1) + 8 * v57)];
      v58 = [v18 scheme];
      if ([v58 isEqualToString:@"http"]) {
        break;
      }
      v59 = [v18 scheme];
      int v60 = [v59 isEqualToString:@"https"];

      if (v60) {
        goto LABEL_104;
      }

      if (v55 == ++v57)
      {
        uint64_t v55 = [v53 countByEnumeratingWithState:&v119 objects:v150 count:16];
        if (!v55)
        {
LABEL_74:

          long long v117 = 0u;
          long long v118 = 0u;
          long long v115 = 0u;
          long long v116 = 0u;
          id v61 = v53;
          uint64_t v103 = [v61 countByEnumeratingWithState:&v115 objects:v149 count:16];
          if (!v103)
          {
            uint64_t v13 = v99;
            id v11 = v100;
            v12 = v98;
            goto LABEL_109;
          }
          uint64_t v62 = *(void *)v116;
          unint64_t v63 = 0x1E4F1C000uLL;
          v12 = v98;
          uint64_t v13 = v99;
          while (2)
          {
            uint64_t v64 = 0;
LABEL_77:
            if (*(void *)v116 != v62) {
              objc_enumerationMutation(v61);
            }
            id v18 = [*(id *)(v63 + 2832) URLWithString:*(void *)(*((void *)&v115 + 1) + 8 * v64)];
            v19 = [v18 scheme];
            if ([v19 isEqualToString:@"http"])
            {
LABEL_80:
            }
            else
            {
              v65 = [v18 scheme];
              char v66 = [v65 isEqualToString:@"https"];

              if ((v66 & 1) == 0)
              {
                long long v113 = 0u;
                long long v114 = 0u;
                long long v111 = 0u;
                long long v112 = 0u;
                v19 = [v100 attributionApps];
                uint64_t v95 = [v19 countByEnumeratingWithState:&v111 objects:v148 count:16];
                if (v95)
                {
                  uint64_t v85 = v62;
                  id v88 = v61;
                  uint64_t v67 = *(void *)v112;
                  uint64_t v92 = *(void *)v112;
                  while (2)
                  {
                    uint64_t v68 = 0;
                    do
                    {
                      if (*(void *)v112 != v67) {
                        objc_enumerationMutation(v19);
                      }
                      v46 = *(void **)(*((void *)&v111 + 1) + 8 * v68);
                      long long v107 = 0u;
                      long long v108 = 0u;
                      long long v109 = 0u;
                      long long v110 = 0u;
                      id v105 = [v46 handledSchemes];
                      uint64_t v69 = [v105 countByEnumeratingWithState:&v107 objects:v147 count:16];
                      if (v69)
                      {
                        uint64_t v70 = v69;
                        uint64_t v71 = *(void *)v108;
LABEL_91:
                        uint64_t v72 = 0;
                        while (1)
                        {
                          if (*(void *)v108 != v71) {
                            objc_enumerationMutation(v105);
                          }
                          uint64_t v73 = *(void *)(*((void *)&v107 + 1) + 8 * v72);
                          v74 = [v18 scheme];
                          LOBYTE(v73) = [v74 isEqualToString:v73];

                          if (v73) {
                            goto LABEL_102;
                          }
                          if (v70 == ++v72)
                          {
                            uint64_t v70 = [v105 countByEnumeratingWithState:&v107 objects:v147 count:16];
                            if (v70) {
                              goto LABEL_91;
                            }
                            break;
                          }
                        }
                      }

                      ++v68;
                      uint64_t v67 = v92;
                      v12 = v98;
                      uint64_t v13 = v99;
                    }
                    while (v68 != v95);
                    uint64_t v95 = [v19 countByEnumeratingWithState:&v111 objects:v148 count:16];
                    if (v95) {
                      continue;
                    }
                    break;
                  }
                  uint64_t v62 = v85;
                  id v61 = v88;
                  unint64_t v63 = 0x1E4F1C000;
                }
                goto LABEL_80;
              }
            }

            if (++v64 == v103)
            {
              uint64_t v75 = [v61 countByEnumeratingWithState:&v115 objects:v149 count:16];
              uint64_t v103 = v75;
              if (!v75)
              {
                id v11 = v100;
                goto LABEL_109;
              }
              continue;
            }
            goto LABEL_77;
          }
        }
        goto LABEL_67;
      }
    }

LABEL_104:
    v78 = [v89 sharedController];
    [v78 setWebURL:v18];

    v12 = v98;
    if (v98) {
      v98[2](v98, v18, 0);
    }
    v79 = +[MKSystemController sharedInstance];
    [v79 openURL:v18 completionHandler:0];

    v19 = +[MKMapService sharedService];
    id v105 = [v18 absoluteString];
    objc_msgSend(v19, "captureUserAction:onTarget:eventValue:", 6050, v96);
LABEL_107:
    uint64_t v13 = v99;
    id v11 = v100;
LABEL_108:

LABEL_109:
    id v10 = v97;
  }
}

- (NSURL)webURL
{
  return self->webURL;
}

- (void)setWebURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->webURL, 0);

  objc_storeStrong((id *)&self->_webURLString, 0);
}

@end