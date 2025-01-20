@interface AMSDNFCAccessory
- (id)_addCampaignToken:(id)a3 andGroup:(id)a4 toURL:(id)a5;
- (id)_bag;
- (id)_hasArcadeSubscription:(id)a3;
- (id)_hasFitnessPlusSubscription;
- (id)_hasMusicSubscription;
- (id)_hasTVSubscription;
- (void)handleInboundURL:(id)a3;
@end

@implementation AMSDNFCAccessory

- (void)handleInboundURL:(id)a3
{
  id v155 = a3;
  v4 = +[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:");
  [v4 setQuery:0];
  v5 = [v4 URL];
  v157 = self;
  v6 = [(AMSDNFCAccessory *)self _bag];
  v7 = [v6 URLForKey:@"nfc-accessories/music/tag-url"];
  id v185 = 0;
  uint64_t v8 = [v7 valueWithError:&v185];
  id v9 = v185;

  v10 = [v6 URLForKey:@"nfc-accessories/tv/tag-url"];
  id v184 = v9;
  v156 = [v10 valueWithError:&v184];
  id v11 = v184;

  v12 = [v6 URLForKey:@"nfc-accessories/arcade/tag-url"];
  id v183 = v11;
  uint64_t v13 = [v12 valueWithError:&v183];
  id v14 = v183;

  v15 = [v6 URLForKey:@"nfc-accessories/appstore/tag-url"];
  id v182 = v14;
  uint64_t v153 = [v15 valueWithError:&v182];
  id v16 = v182;

  v17 = [v6 URLForKey:@"nfc-accessories/fitness/tag-url"];
  id v181 = v16;
  v18 = [v17 valueWithError:&v181];
  id v19 = v181;

  v151 = (void *)v8;
  v152 = (void *)v13;
  if (v8 && [v5 isEqual:v8])
  {
    v149 = v18;
    v20 = v6;
    v21 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v21)
    {
      v21 = +[AMSLogConfig sharedConfig];
    }
    v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = objc_opt_class();
      v24 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v190 = v23;
      __int16 v191 = 2114;
      v192 = v24;
      __int16 v193 = 2114;
      id v194 = v5;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Music URL detected. URL = %{public}@", buf, 0x20u);
    }
    v25 = [(AMSDNFCAccessory *)v157 _hasMusicSubscription];
    id v180 = v19;
    unsigned int v26 = [v25 resultWithError:&v180];
    id v27 = v180;

    v28 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v28)
    {
      v28 = +[AMSLogConfig sharedConfig];
    }
    v29 = [v28 OSLogObject];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = objc_opt_class();
      AMSLogKey();
      v32 = v31 = v4;
      *(_DWORD *)buf = 138543618;
      uint64_t v190 = v30;
      __int16 v191 = 2114;
      v192 = v32;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Constructing music payload.", buf, 0x16u);

      v4 = v31;
    }

    v6 = v20;
    if (v26)
    {
      v33 = [v20 dictionaryForKey:@"nfc-accessories/music/payloads/subscribed"];
      id v179 = v27;
      v34 = [v33 valueWithError:&v179];
      v35 = v179;
    }
    else
    {
      v33 = [v20 dictionaryForKey:@"nfc-accessories/music/payloads/unsubscribed"];
      id v178 = v27;
      v34 = [v33 valueWithError:&v178];
      v35 = v178;
    }
    id v65 = v35;
    CFStringRef v146 = @"music-notification-default";
    id v19 = v27;
    uint64_t v13 = (uint64_t)v152;
    goto LABEL_69;
  }
  if (v156 && [v5 isEqual:v156])
  {
    v149 = v18;
    v36 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v36)
    {
      v36 = +[AMSLogConfig sharedConfig];
    }
    v37 = [v36 OSLogObject];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v38 = objc_opt_class();
      v39 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v190 = v38;
      __int16 v191 = 2114;
      v192 = v39;
      __int16 v193 = 2114;
      id v194 = v5;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] TV URL detected. URL = %{public}@", buf, 0x20u);

      uint64_t v13 = (uint64_t)v152;
    }

    v40 = [(AMSDNFCAccessory *)v157 _hasTVSubscription];
    id v177 = v19;
    unsigned int v41 = [v40 resultWithError:&v177];
    id v42 = v177;

    if (v41)
    {
      v33 = [v6 dictionaryForKey:@"nfc-accessories/tv/payloads/subscribed"];
      id v176 = v42;
      v34 = [v33 valueWithError:&v176];
      v43 = v176;
    }
    else
    {
      v33 = [v6 dictionaryForKey:@"nfc-accessories/tv/payloads/unsubscribed"];
      id v175 = v42;
      v34 = [v33 valueWithError:&v175];
      v43 = v175;
    }
    id v65 = v43;
    CFStringRef v80 = @"com.apple.tv-default";
LABEL_68:
    CFStringRef v146 = v80;
    id v19 = v42;
    goto LABEL_69;
  }
  if (v13 && [v5 isEqual:v13])
  {
    v149 = v18;
    v143 = v4;
    v44 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v44)
    {
      v44 = +[AMSLogConfig sharedConfig];
    }
    v45 = [v44 OSLogObject];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v46 = objc_opt_class();
      v47 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v190 = v46;
      __int16 v191 = 2114;
      v192 = v47;
      __int16 v193 = 2114;
      id v194 = v5;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Arcade URL detected. URL = %{public}@", buf, 0x20u);
    }
    v48 = v6;
    v49 = [v6 stringForKey:@"arcade-iap-family-id"];
    id v174 = v19;
    v33 = [v49 valueWithError:&v174];
    id v50 = v174;

    v51 = [(AMSDNFCAccessory *)v157 _hasArcadeSubscription:v33];
    id v173 = v50;
    unsigned int v52 = [v51 resultWithError:&v173];
    id v53 = v173;

    if (v53 && [v53 code] == (id)1)
    {
      v54 = +[AMSLogConfig sharedAccountsDaemonConfig];
      if (!v54)
      {
        v54 = +[AMSLogConfig sharedConfig];
      }
      v55 = [v54 OSLogObject];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        uint64_t v56 = objc_opt_class();
        v57 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v190 = v56;
        __int16 v191 = 2114;
        v192 = v57;
        __int16 v193 = 2114;
        id v194 = v53;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Timed out getting Arcade subscription status. Error = %{public}@", buf, 0x20u);
      }
    }
    v6 = v48;
    if (v52)
    {
      v58 = [v48 dictionaryForKey:@"nfc-accessories/arcade/payloads/subscribed"];
      id v19 = v58;
      id v172 = v53;
      v59 = &v172;
      v60 = &v172;
    }
    else
    {
      v58 = [v48 dictionaryForKey:@"nfc-accessories/arcade/payloads/unsubscribed"];
      id v19 = v58;
      id v171 = v53;
      v59 = &v171;
      v60 = &v171;
    }
    v34 = [v58 valueWithError:v60];
    v4 = v143;
    uint64_t v13 = (uint64_t)v152;
    id v65 = *v59;
  }
  else
  {
    if (!v153 || !objc_msgSend(v5, "isEqual:"))
    {
      if (!v18 || ![v5 isEqual:v18])
      {
        v147 = v6;
        id v65 = v19;
        v79 = v155;
        goto LABEL_94;
      }
      v149 = v18;
      v66 = v6;
      v67 = +[AMSLogConfig sharedAccountsDaemonConfig];
      if (!v67)
      {
        v67 = +[AMSLogConfig sharedConfig];
      }
      v68 = [v67 OSLogObject];
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v69 = objc_opt_class();
        v70 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v190 = v69;
        __int16 v191 = 2114;
        v192 = v70;
        __int16 v193 = 2114;
        id v194 = v5;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fitness URL detected. URL = %{public}@", buf, 0x20u);

        uint64_t v13 = (uint64_t)v152;
      }

      v71 = [(AMSDNFCAccessory *)v157 _hasFitnessPlusSubscription];
      id v169 = v19;
      unsigned int v72 = [v71 resultWithError:&v169];
      id v42 = v169;

      if (v42 && [v42 code] == (id)1)
      {
        v73 = +[AMSLogConfig sharedAccountsDaemonConfig];
        if (!v73)
        {
          v73 = +[AMSLogConfig sharedConfig];
        }
        v74 = [v73 OSLogObject];
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          uint64_t v75 = objc_opt_class();
          AMSLogKey();
          v77 = v76 = v4;
          *(_DWORD *)buf = 138543874;
          uint64_t v190 = v75;
          __int16 v191 = 2114;
          v192 = v77;
          __int16 v193 = 2114;
          id v194 = v42;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Timed out getting Fitness+ subscription status. Error = %{public}@", buf, 0x20u);

          v4 = v76;
        }

        uint64_t v13 = (uint64_t)v152;
      }
      v6 = v66;
      if (v72)
      {
        v33 = [v66 dictionaryForKey:@"nfc-accessories/fitness/payloads/subscribed"];
        id v168 = v42;
        v34 = [v33 valueWithError:&v168];
        v78 = v168;
      }
      else
      {
        v33 = [v66 dictionaryForKey:@"nfc-accessories/fitness/payloads/unsubscribed"];
        id v167 = v42;
        v34 = [v33 valueWithError:&v167];
        v78 = v167;
      }
      id v65 = v78;
      CFStringRef v80 = @"fitcored-engagement-category";
      goto LABEL_68;
    }
    v149 = v18;
    v61 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v61)
    {
      v61 = +[AMSLogConfig sharedConfig];
    }
    v62 = [v61 OSLogObject];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v63 = objc_opt_class();
      v64 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v190 = v63;
      __int16 v191 = 2114;
      v192 = v64;
      __int16 v193 = 2114;
      id v194 = v5;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] App Store URL detected. URL = %{public}@", buf, 0x20u);

      uint64_t v13 = (uint64_t)v152;
    }

    v33 = [v6 dictionaryForKey:@"nfc-accessories/appstore/payloads/unsubscribed"];
    id v170 = v19;
    v34 = [v33 valueWithError:&v170];
    id v65 = v170;
  }
  CFStringRef v146 = @"asd-notification-default";
LABEL_69:

  if (v34)
  {
    id v81 = [objc_alloc((Class)AMSPushPayload) initWithPayload:v34];
    id v82 = objc_alloc((Class)AMSPushConfiguration);
    uint64_t v188 = AMSPushActionTypeRichNotification;
    v83 = +[NSArray arrayWithObjects:&v188 count:1];
    v84 = +[NSSet setWithArray:v83];
    v85 = [v82 initWithEnabledActionTypes:v84];

    v154 = v81;
    id v86 = [objc_alloc((Class)AMSUserNotification) initWithPayload:v81 andConfig:v85];
    v79 = v155;
    v150 = v85;
    if (v86)
    {
      v138 = v34;
      id v139 = v65;
      v141 = v5;
      v144 = v4;
      v87 = +[ACAccountStore ams_sharedAccountStore];
      v88 = objc_msgSend(v87, "ams_activeiTunesAccount");
      id v140 = v86;
      [v86 setAccount:v88];

      v89 = +[NSURLComponents componentsWithURL:v155 resolvingAgainstBaseURL:1];
      v90 = objc_alloc_init((Class)NSMutableDictionary);
      long long v163 = 0u;
      long long v164 = 0u;
      long long v165 = 0u;
      long long v166 = 0u;
      v142 = v89;
      v91 = [v89 queryItems];
      id v92 = [v91 countByEnumeratingWithState:&v163 objects:v187 count:16];
      if (v92)
      {
        id v93 = v92;
        uint64_t v94 = *(void *)v164;
        do
        {
          for (i = 0; i != v93; i = (char *)i + 1)
          {
            if (*(void *)v164 != v94) {
              objc_enumerationMutation(v91);
            }
            v96 = *(void **)(*((void *)&v163 + 1) + 8 * i);
            uint64_t v97 = [v96 name];
            if (v97)
            {
              v98 = (void *)v97;
              v99 = [v96 value];

              if (v99)
              {
                v100 = [v96 value];
                v101 = [v96 name];
                [v90 setObject:v100 forKey:v101];
              }
            }
          }
          id v93 = [v91 countByEnumeratingWithState:&v163 objects:v187 count:16];
        }
        while (v93);
      }

      v102 = [v86 metricsEvent];
      id v103 = [v102 mutableCopy];

      v79 = v155;
      v104 = [v155 absoluteString];
      [v103 setObject:v104 forKeyedSubscript:@"tagURL"];

      v5 = v141;
      if ([v90 count])
      {
        id v105 = [v90 copy];
        [v103 setObject:v105 forKeyedSubscript:@"tagParameters"];
      }
      id v106 = [v103 copy];
      [v86 setMetricsEvent:v106];

      [v86 setCategoryIdentifier:v146];
      uint64_t v107 = [v90 objectForKeyedSubscript:@"itscg"];
      uint64_t v108 = [v90 objectForKeyedSubscript:@"itsct"];
      if (v107 | v108)
      {
        id v137 = v103;
        v148 = v6;
        v109 = [v86 defaultAction];
        v110 = [v109 defaultURL];
        uint64_t v111 = [(AMSDNFCAccessory *)v157 _addCampaignToken:v108 andGroup:v107 toURL:v110];

        v112 = [v86 defaultAction];
        v136 = (void *)v111;
        [v112 setDefaultURL:v111];

        long long v161 = 0u;
        long long v162 = 0u;
        long long v159 = 0u;
        long long v160 = 0u;
        v113 = [v86 buttonActions];
        id v114 = [v113 countByEnumeratingWithState:&v159 objects:v186 count:16];
        if (v114)
        {
          id v115 = v114;
          uint64_t v116 = *(void *)v160;
          do
          {
            for (j = 0; j != v115; j = (char *)j + 1)
            {
              if (*(void *)v160 != v116) {
                objc_enumerationMutation(v113);
              }
              v118 = *(void **)(*((void *)&v159 + 1) + 8 * (void)j);
              v119 = [v118 defaultURL];
              v120 = [(AMSDNFCAccessory *)v157 _addCampaignToken:v108 andGroup:v107 toURL:v119];

              [v118 setDefaultURL:v120];
            }
            id v115 = [v113 countByEnumeratingWithState:&v159 objects:v186 count:16];
          }
          while (v115);
        }

        v79 = v155;
        id v86 = v140;
        v5 = v141;
        v6 = v148;
        id v103 = v137;
      }
      v121 = [v154 clientIdentifier];
      v122 = +[AMSUserNotificationCenter postNotification:v86 bag:v6 centerBundleId:v121];

      v158[0] = _NSConcreteStackBlock;
      v158[1] = 3221225472;
      v158[2] = sub_100055F08;
      v158[3] = &unk_10020B710;
      v158[4] = v157;
      [v122 addFinishBlock:v158];

      v4 = v144;
      v124 = v152;
      v123 = (void *)v153;
      v34 = v138;
      id v65 = v139;
    }
    else
    {
      v131 = +[AMSLogConfig sharedAccountsDaemonConfig];
      v124 = v152;
      if (!v131)
      {
        v131 = +[AMSLogConfig sharedConfig];
      }
      v142 = v131;
      v90 = [v131 OSLogObject];
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      {
        uint64_t v132 = objc_opt_class();
        AMSLogKey();
        v145 = v4;
        v133 = v5;
        v135 = id v134 = v65;
        *(_DWORD *)buf = 138543874;
        uint64_t v190 = v132;
        __int16 v191 = 2114;
        v192 = v135;
        __int16 v193 = 2114;
        id v194 = v34;
        _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] There was a problem parsing the payload dictionary. Payload = %{public}@", buf, 0x20u);

        id v65 = v134;
        v5 = v133;
        v4 = v145;
      }
      v123 = (void *)v153;
    }

    v18 = v149;
    goto LABEL_105;
  }
  v147 = v6;
  v79 = v155;
  v18 = v149;
LABEL_94:
  v125 = (void *)v13;
  v126 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v126)
  {
    v126 = +[AMSLogConfig sharedConfig];
  }
  v154 = v126;
  v127 = [v126 OSLogObject];
  v150 = v127;
  if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
  {
    uint64_t v128 = objc_opt_class();
    AMSLogKey();
    v130 = v129 = v18;
    *(_DWORD *)buf = 138544130;
    uint64_t v190 = v128;
    __int16 v191 = 2114;
    v192 = v130;
    __int16 v193 = 2114;
    id v194 = v79;
    __int16 v195 = 2114;
    id v196 = v65;
    _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No payload was found for the incoming NFC URL. TagURL = %{public}@, Error = %{public}@", buf, 0x2Au);

    v18 = v129;
  }
  v34 = 0;
  v123 = (void *)v153;
  v124 = v125;
  v6 = v147;
LABEL_105:
}

- (id)_bag
{
  id v2 = objc_alloc_init((Class)AMSMutableBagKeySet);
  [v2 addBagKey:@"arcade-iap-family-id" valueType:4];
  [v2 addBagKey:@"nfc-accessories/music/tag-url" valueType:5];
  [v2 addBagKey:@"nfc-accessories/music/payloads/unsubscribed" valueType:6];
  [v2 addBagKey:@"nfc-accessories/music/payloads/subscribed" valueType:6];
  [v2 addBagKey:@"nfc-accessories/tv/tag-url" valueType:5];
  [v2 addBagKey:@"nfc-accessories/tv/payloads/unsubscribed" valueType:6];
  [v2 addBagKey:@"nfc-accessories/tv/payloads/subscribed" valueType:6];
  [v2 addBagKey:@"nfc-accessories/arcade/tag-url" valueType:5];
  [v2 addBagKey:@"nfc-accessories/arcade/payloads/unsubscribed" valueType:6];
  [v2 addBagKey:@"nfc-accessories/arcade/payloads/subscribed" valueType:6];
  v3 = +[AMSURLRequestEncoder bagKeySet];
  [v2 unionBagKeySet:v3];

  v4 = +[AMSMetrics bagKeySet];
  [v2 unionBagKeySet:v4];

  v5 = +[AMSMescal bagKeySet];
  [v2 unionBagKeySet:v5];

  v6 = +[AMSUserNotification bagKeySet];
  [v2 unionBagKeySet:v6];

  +[AMSBagKeySet registerBagKeySet:v2 forProfile:@"AMSNFCAccessory" profileVersion:@"1"];
  v7 = +[AMSBag bagForProfile:@"AMSNFCAccessory" profileVersion:@"1"];

  return v7;
}

- (id)_addCampaignToken:(id)a3 andGroup:(id)a4 toURL:(id)a5
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  id v9 = a5;
  v10 = v9;
  if (v7 | v8)
  {
    id v11 = +[NSURLComponents componentsWithURL:v9 resolvingAgainstBaseURL:1];
    v12 = [v11 queryItems];
    id v13 = [v12 mutableCopy];
    id v14 = v13;
    if (v13) {
      id v15 = v13;
    }
    else {
      id v15 = objc_alloc_init((Class)NSMutableArray);
    }
    v17 = v15;

    if (v8)
    {
      v18 = +[NSURLQueryItem queryItemWithName:@"itscg" value:v8];
      [v17 addObject:v18];
    }
    if (v7)
    {
      id v19 = +[NSURLQueryItem queryItemWithName:@"itsct" value:v7];
      [v17 addObject:v19];
    }
    [v11 setQueryItems:v17];
    id v16 = [v11 URL];
  }
  else
  {
    id v16 = v9;
  }

  return v16;
}

- (id)_hasArcadeSubscription:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)AMSPromise) initWithTimeout:2.0];
  v6 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v6)
  {
    v6 = +[AMSLogConfig sharedConfig];
  }
  unint64_t v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v8;
    __int16 v21 = 2114;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking Arcade subscription status", buf, 0x16u);
  }
  v10 = [sub_10005656C() sharedInstance];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100056650;
  v15[3] = &unk_10020B760;
  id v16 = v4;
  v17 = self;
  id v18 = v5;
  id v11 = v5;
  id v12 = v4;
  [v10 getSubscriptionEntitlementsForSegment:1 ignoreCaches:0 withResultHandler:v15];
  id v13 = [v11 binaryPromiseAdapter];

  return v13;
}

- (id)_hasFitnessPlusSubscription
{
  id v3 = [objc_alloc((Class)AMSPromise) initWithTimeout:2.0];
  id v4 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    unint64_t v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v6;
    __int16 v20 = 2114;
    __int16 v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking Fitness+ subscription status", buf, 0x16u);
  }
  uint64_t v8 = [sub_10005656C() sharedInstance];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_100056B48;
  id v15 = &unk_10020B7C8;
  id v16 = self;
  id v17 = v3;
  id v9 = v3;
  [v8 getSubscriptionEntitlementsForSegment:2 ignoreCaches:0 withResultHandler:&v12];
  v10 = objc_msgSend(v9, "binaryPromiseAdapter", v12, v13, v14, v15, v16);

  return v10;
}

- (id)_hasMusicSubscription
{
  id v3 = [objc_alloc((Class)AMSPromise) initWithTimeout:2.0];
  id v4 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    unint64_t v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking Music subscription status", buf, 0x16u);
  }
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x2050000000;
  uint64_t v8 = (void *)qword_100235150;
  uint64_t v23 = qword_100235150;
  if (!qword_100235150)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100057964;
    v25 = &unk_10020B840;
    unsigned int v26 = &v20;
    sub_100057964((uint64_t)buf);
    uint64_t v8 = (void *)v21[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v20, 8);
  v10 = [v9 sharedStatusController];
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_100057058;
  id v17 = &unk_10020B7F0;
  id v18 = self;
  id v19 = v3;
  id v11 = v3;
  [v10 getSubscriptionStatusWithCompletionHandler:&v14];
  id v12 = objc_msgSend(v11, "binaryPromiseAdapter", v14, v15, v16, v17, v18);

  return v12;
}

- (id)_hasTVSubscription
{
  id v3 = [objc_alloc((Class)AMSPromise) initWithTimeout:2.0];
  id v4 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    unint64_t v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking TV subscription status", buf, 0x16u);
  }
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x2050000000;
  uint64_t v8 = (void *)qword_100235160;
  uint64_t v23 = qword_100235160;
  if (!qword_100235160)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100057B1C;
    v25 = &unk_10020B840;
    unsigned int v26 = &v20;
    sub_100057B1C((uint64_t)buf);
    uint64_t v8 = (void *)v21[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v20, 8);
  id v10 = objc_alloc_init(v9);
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_100057540;
  id v17 = &unk_10020B818;
  id v18 = self;
  id v19 = v3;
  id v11 = v3;
  [v10 fetchSubscriptionData:1 completion:&v14];
  id v12 = objc_msgSend(v11, "binaryPromiseAdapter", v14, v15, v16, v17, v18);

  return v12;
}

@end