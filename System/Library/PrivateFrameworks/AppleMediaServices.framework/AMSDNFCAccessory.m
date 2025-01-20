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
  id v154 = a3;
  v4 = +[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:");
  [v4 setQuery:0];
  v152 = v4;
  v5 = [v4 URL];
  v157 = self;
  v6 = [(AMSDNFCAccessory *)self _bag];
  v7 = [v6 URLForKey:@"nfc-accessories/music/tag-url"];
  id v185 = 0;
  v8 = [v7 valueWithError:&v185];
  id v9 = v185;

  v10 = [v6 URLForKey:@"nfc-accessories/tv/tag-url"];
  id v184 = v9;
  uint64_t v155 = [v10 valueWithError:&v184];
  id v11 = v184;

  v12 = [v6 URLForKey:@"nfc-accessories/arcade/tag-url"];
  id v183 = v11;
  v153 = [v12 valueWithError:&v183];
  id v13 = v183;

  v14 = [v6 URLForKey:@"nfc-accessories/appstore/tag-url"];
  id v182 = v13;
  uint64_t v15 = [v14 valueWithError:&v182];
  id v16 = v182;

  v156 = v6;
  v17 = [v6 URLForKey:@"nfc-accessories/fitness/tag-url"];
  id v181 = v16;
  v18 = [v17 valueWithError:&v181];
  id v19 = v181;

  v20 = v5;
  if (v8 && [v5 isEqual:v8])
  {
    v21 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v21)
    {
      v21 = +[AMSLogConfig sharedConfig];
    }
    v146 = v18;
    v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = objc_opt_class();
      v24 = AMSLogKey();
      v25 = AMSLogableURL();
      *(_DWORD *)buf = 138543874;
      uint64_t v190 = v23;
      __int16 v191 = 2114;
      v192 = v24;
      __int16 v193 = 2114;
      id v194 = v25;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Music URL detected. URL = %{public}@", buf, 0x20u);
    }
    v26 = [(AMSDNFCAccessory *)v157 _hasMusicSubscription];
    id v180 = v19;
    unsigned int v27 = [v26 resultWithError:&v180];
    id v28 = v180;

    if (v27)
    {
      v29 = [v156 dictionaryForKey:@"nfc-accessories/music/payloads/subscribed"];
      id v179 = v28;
      uint64_t v30 = [v29 valueWithError:&v179];
      v31 = v179;
    }
    else
    {
      v29 = [v156 dictionaryForKey:@"nfc-accessories/music/payloads/unsubscribed"];
      id v178 = v28;
      uint64_t v30 = [v29 valueWithError:&v178];
      v31 = v178;
    }
    id v150 = v31;
    CFStringRef v66 = @"music-notification-default";
    id v19 = v28;
    v20 = v5;
    v33 = (void *)v15;
    v41 = (void *)v30;
  }
  else
  {
    if (v155 && objc_msgSend(v5, "isEqual:"))
    {
      v147 = v5;
      v32 = +[AMSLogConfig sharedAccountsDaemonConfig];
      v33 = (void *)v15;
      if (!v32)
      {
        v32 = +[AMSLogConfig sharedConfig];
      }
      v146 = v18;
      v34 = [v32 OSLogObject];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = objc_opt_class();
        v36 = AMSLogKey();
        v37 = AMSLogableURL();
        *(_DWORD *)buf = 138543874;
        uint64_t v190 = v35;
        __int16 v191 = 2114;
        v192 = v36;
        __int16 v193 = 2114;
        id v194 = v37;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] TV URL detected. URL = %{public}@", buf, 0x20u);
      }
      v38 = [(AMSDNFCAccessory *)v157 _hasTVSubscription];
      id v177 = v19;
      unsigned int v39 = [v38 resultWithError:&v177];
      id v40 = v177;

      if (v39)
      {
        v29 = [v156 dictionaryForKey:@"nfc-accessories/tv/payloads/subscribed"];
        id v176 = v40;
        v41 = [v29 valueWithError:&v176];
        v42 = v176;
      }
      else
      {
        v29 = [v156 dictionaryForKey:@"nfc-accessories/tv/payloads/unsubscribed"];
        id v175 = v40;
        v41 = [v29 valueWithError:&v175];
        v42 = v175;
      }
      id v150 = v42;
      CFStringRef v66 = @"com.apple.tv-default";
    }
    else
    {
      v33 = (void *)v15;
      if (v153 && objc_msgSend(v20, "isEqual:"))
      {
        v146 = v18;
        v148 = v20;
        v43 = +[AMSLogConfig sharedAccountsDaemonConfig];
        if (!v43)
        {
          v43 = +[AMSLogConfig sharedConfig];
        }
        v44 = [v43 OSLogObject];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v45 = objc_opt_class();
          v46 = AMSLogKey();
          v47 = AMSLogableURL();
          *(_DWORD *)buf = 138543874;
          uint64_t v190 = v45;
          __int16 v191 = 2114;
          v192 = v46;
          __int16 v193 = 2114;
          id v194 = v47;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Arcade URL detected. URL = %{public}@", buf, 0x20u);
        }
        v48 = [v156 stringForKey:@"arcade-iap-family-id"];
        id v174 = v19;
        v29 = [v48 valueWithError:&v174];
        id v49 = v174;

        v50 = [(AMSDNFCAccessory *)v157 _hasArcadeSubscription:v29];
        id v173 = v49;
        unsigned int v51 = [v50 resultWithError:&v173];
        id v52 = v173;

        if (v52 && [v52 code] == (id)1)
        {
          v53 = +[AMSLogConfig sharedAccountsDaemonConfig];
          if (!v53)
          {
            v53 = +[AMSLogConfig sharedConfig];
          }
          v54 = [v53 OSLogObject];
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            uint64_t v55 = objc_opt_class();
            v56 = AMSLogKey();
            *(_DWORD *)buf = 138543874;
            uint64_t v190 = v55;
            __int16 v191 = 2114;
            v192 = v56;
            __int16 v193 = 2114;
            id v194 = v52;
            _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Timed out getting Arcade subscription status. Error = %{public}@", buf, 0x20u);

            v33 = (void *)v15;
          }
        }
        if (v51)
        {
          v57 = [v156 dictionaryForKey:@"nfc-accessories/arcade/payloads/subscribed"];
          id v19 = v57;
          id v172 = v52;
          v58 = &v172;
          v59 = &v172;
        }
        else
        {
          v57 = [v156 dictionaryForKey:@"nfc-accessories/arcade/payloads/unsubscribed"];
          id v19 = v57;
          id v171 = v52;
          v58 = &v171;
          v59 = &v171;
        }
        v41 = [v57 valueWithError:v59];
        id v150 = *v58;

        CFStringRef v66 = @"asd-notification-default";
        v20 = v148;
        goto LABEL_64;
      }
      if (v15 && [v20 isEqual:v15])
      {
        v146 = v18;
        v60 = +[AMSLogConfig sharedAccountsDaemonConfig];
        if (!v60)
        {
          v60 = +[AMSLogConfig sharedConfig];
        }
        v61 = [v60 OSLogObject];
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          v62 = v20;
          uint64_t v63 = objc_opt_class();
          v64 = AMSLogKey();
          v65 = AMSLogableURL();
          *(_DWORD *)buf = 138543874;
          uint64_t v190 = v63;
          v20 = v62;
          __int16 v191 = 2114;
          v192 = v64;
          __int16 v193 = 2114;
          id v194 = v65;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] App Store URL detected. URL = %{public}@", buf, 0x20u);

          v33 = (void *)v15;
        }

        v29 = [v156 dictionaryForKey:@"nfc-accessories/appstore/payloads/unsubscribed"];
        id v170 = v19;
        v41 = [v29 valueWithError:&v170];
        id v150 = v170;
        CFStringRef v66 = @"asd-notification-default";
        goto LABEL_64;
      }
      if (!v18 || ![v20 isEqual:v18])
      {
        id v150 = v19;
        goto LABEL_89;
      }
      v147 = v20;
      v67 = +[AMSLogConfig sharedAccountsDaemonConfig];
      if (!v67)
      {
        v67 = +[AMSLogConfig sharedConfig];
      }
      v68 = [v67 OSLogObject];
      v146 = v18;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v69 = objc_opt_class();
        v70 = AMSLogKey();
        v71 = AMSLogableURL();
        *(_DWORD *)buf = 138543874;
        uint64_t v190 = v69;
        __int16 v191 = 2114;
        v192 = v70;
        __int16 v193 = 2114;
        id v194 = v71;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fitness URL detected. URL = %{public}@", buf, 0x20u);

        v33 = (void *)v15;
      }

      v72 = [(AMSDNFCAccessory *)v157 _hasFitnessPlusSubscription];
      id v169 = v19;
      unsigned int v73 = [v72 resultWithError:&v169];
      id v40 = v169;

      if (v40 && [v40 code] == (id)1)
      {
        v74 = +[AMSLogConfig sharedAccountsDaemonConfig];
        if (!v74)
        {
          v74 = +[AMSLogConfig sharedConfig];
        }
        v75 = [v74 OSLogObject];
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          uint64_t v76 = objc_opt_class();
          v77 = AMSLogKey();
          *(_DWORD *)buf = 138543874;
          uint64_t v190 = v76;
          __int16 v191 = 2114;
          v192 = v77;
          __int16 v193 = 2114;
          id v194 = v40;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Timed out getting Fitness+ subscription status. Error = %{public}@", buf, 0x20u);
        }
      }
      if (v73)
      {
        v29 = [v156 dictionaryForKey:@"nfc-accessories/fitness/payloads/subscribed"];
        id v168 = v40;
        v41 = [v29 valueWithError:&v168];
        v78 = v168;
      }
      else
      {
        v29 = [v156 dictionaryForKey:@"nfc-accessories/fitness/payloads/unsubscribed"];
        id v167 = v40;
        v41 = [v29 valueWithError:&v167];
        v78 = v167;
      }
      id v150 = v78;
      CFStringRef v66 = @"fitcored-engagement-category";
    }
    id v19 = v40;
    v20 = v147;
  }
LABEL_64:

  if (v41)
  {
    id v79 = [objc_alloc((Class)AMSPushPayload) initWithPayload:v41];
    id v80 = objc_alloc((Class)AMSPushConfiguration);
    uint64_t v188 = AMSPushActionTypeRichNotification;
    v81 = +[NSArray arrayWithObjects:&v188 count:1];
    v82 = +[NSSet setWithArray:v81];
    v83 = [v80 initWithEnabledActionTypes:v82];

    v151 = v79;
    id v84 = [objc_alloc((Class)AMSUserNotification) initWithPayload:v79 andConfig:v83];
    v85 = v152;
    v144 = v83;
    v145 = v84;
    if (v84)
    {
      v86 = v84;
      v139 = v41;
      v140 = v33;
      v142 = v8;
      v149 = v20;
      v87 = +[ACAccountStore ams_sharedAccountStore];
      v88 = objc_msgSend(v87, "ams_activeiTunesAccount");
      [v86 setAccount:v88];

      v89 = +[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:");
      v90 = objc_alloc_init((Class)NSMutableDictionary);
      long long v163 = 0u;
      long long v164 = 0u;
      long long v165 = 0u;
      long long v166 = 0u;
      v143 = v89;
      v91 = [v89 queryItems];
      id v92 = [v91 countByEnumeratingWithState:&v163 objects:v187 count:16];
      CFStringRef v93 = v66;
      if (v92)
      {
        id v94 = v92;
        uint64_t v95 = *(void *)v164;
        do
        {
          for (i = 0; i != v94; i = (char *)i + 1)
          {
            if (*(void *)v164 != v95) {
              objc_enumerationMutation(v91);
            }
            v97 = *(void **)(*((void *)&v163 + 1) + 8 * i);
            uint64_t v98 = [v97 name];
            if (v98)
            {
              v99 = (void *)v98;
              v100 = [v97 value];

              if (v100)
              {
                v101 = [v97 value];
                v102 = [v97 name];
                [v90 setObject:v101 forKey:v102];
              }
            }
          }
          id v94 = [v91 countByEnumeratingWithState:&v163 objects:v187 count:16];
        }
        while (v94);
      }

      v103 = v145;
      v104 = [v145 metricsEvent];
      id v105 = [v104 mutableCopy];

      v106 = [v154 absoluteString];
      [v105 setObject:v106 forKeyedSubscript:@"tagURL"];

      if ([v90 count])
      {
        id v107 = [v90 copy];
        [v105 setObject:v107 forKeyedSubscript:@"tagParameters"];
      }
      id v108 = [v105 copy];
      [v145 setMetricsEvent:v108];

      [v145 setCategoryIdentifier:v93];
      uint64_t v109 = [v90 objectForKeyedSubscript:@"itscg"];
      uint64_t v110 = [v90 objectForKeyedSubscript:@"itsct"];
      if (v109 | v110)
      {
        id v138 = v105;
        v111 = [v145 defaultAction];
        v112 = [v111 defaultURL];
        uint64_t v113 = [(AMSDNFCAccessory *)v157 _addCampaignToken:v110 andGroup:v109 toURL:v112];

        v114 = [v145 defaultAction];
        v137 = (void *)v113;
        [v114 setDefaultURL:v113];

        long long v161 = 0u;
        long long v162 = 0u;
        long long v159 = 0u;
        long long v160 = 0u;
        v115 = [v145 buttonActions];
        id v116 = [v115 countByEnumeratingWithState:&v159 objects:v186 count:16];
        if (v116)
        {
          id v117 = v116;
          uint64_t v118 = *(void *)v160;
          do
          {
            for (j = 0; j != v117; j = (char *)j + 1)
            {
              if (*(void *)v160 != v118) {
                objc_enumerationMutation(v115);
              }
              v120 = *(void **)(*((void *)&v159 + 1) + 8 * (void)j);
              v121 = [v120 defaultURL];
              v122 = [(AMSDNFCAccessory *)v157 _addCampaignToken:v110 andGroup:v109 toURL:v121];

              [v120 setDefaultURL:v122];
            }
            id v117 = [v115 countByEnumeratingWithState:&v159 objects:v186 count:16];
          }
          while (v117);
        }

        v103 = v145;
        id v105 = v138;
      }
      v123 = [v151 clientIdentifier];
      v124 = +[AMSUserNotificationCenter postNotification:v103 bag:v156 centerBundleId:v123];

      v158[0] = _NSConcreteStackBlock;
      v158[1] = 3221225472;
      v158[2] = sub_100047C14;
      v158[3] = &unk_1001138F8;
      v158[4] = v157;
      [v124 addFinishBlock:v158];

      v85 = v152;
      v18 = v146;
      v20 = v149;
      v33 = v140;
      v8 = v142;
      v125 = (void *)v155;
      v41 = v139;
    }
    else
    {
      v133 = +[AMSLogConfig sharedAccountsDaemonConfig];
      if (!v133)
      {
        v133 = +[AMSLogConfig sharedConfig];
      }
      v143 = v133;
      v90 = [v133 OSLogObject];
      v18 = v146;
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      {
        uint64_t v134 = objc_opt_class();
        AMSLogKey();
        v141 = v33;
        v136 = v135 = v20;
        *(_DWORD *)buf = 138543874;
        uint64_t v190 = v134;
        __int16 v191 = 2114;
        v192 = v136;
        __int16 v193 = 2114;
        id v194 = v41;
        _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] There was a problem parsing the payload dictionary. Payload = %{public}@", buf, 0x20u);

        v20 = v135;
        v33 = v141;
      }
      v125 = (void *)v155;
      v103 = 0;
    }

    v127 = v144;
    goto LABEL_100;
  }
  v18 = v146;
LABEL_89:
  v85 = v152;
  v126 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v126)
  {
    v126 = +[AMSLogConfig sharedConfig];
  }
  v151 = v126;
  v127 = [v126 OSLogObject];
  if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
  {
    uint64_t v128 = objc_opt_class();
    v129 = AMSLogKey();
    AMSLogableURL();
    v130 = v33;
    v132 = v131 = v20;
    *(_DWORD *)buf = 138544130;
    uint64_t v190 = v128;
    __int16 v191 = 2114;
    v192 = v129;
    __int16 v193 = 2114;
    id v194 = v132;
    __int16 v195 = 2114;
    id v196 = v150;
    _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No payload was found for the incoming NFC URL. TagURL = %{public}@, Error = %{public}@", buf, 0x2Au);

    v20 = v131;
    v33 = v130;
  }
  v41 = 0;
  v125 = (void *)v155;
LABEL_100:
}

- (id)_bag
{
  return +[AMSBag bagForProfile:@"AMSNFCAccessory" profileVersion:@"1"];
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
    v14 = v13;
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
  id v5 = [objc_alloc((Class)AMSMutablePromise) initWithTimeout:2.0];
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
  v10 = [sub_1000480B0() sharedInstance];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100048194;
  v15[3] = &unk_100113948;
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
  id v3 = [objc_alloc((Class)AMSMutablePromise) initWithTimeout:2.0];
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
  uint64_t v8 = [sub_1000480B0() sharedInstance];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_10004868C;
  id v15 = &unk_1001139B0;
  id v16 = self;
  id v17 = v3;
  id v9 = v3;
  [v8 getSubscriptionEntitlementsForSegment:2 ignoreCaches:0 withResultHandler:&v12];
  v10 = objc_msgSend(v9, "binaryPromiseAdapter", v12, v13, v14, v15, v16);

  return v10;
}

- (id)_hasMusicSubscription
{
  id v3 = [objc_alloc((Class)AMSMutablePromise) initWithTimeout:2.0];
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
  uint64_t v8 = (void *)qword_100130370;
  uint64_t v23 = qword_100130370;
  if (!qword_100130370)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1000494A4;
    v25 = &unk_100112770;
    v26 = &v20;
    sub_1000494A4((uint64_t)buf);
    uint64_t v8 = (void *)v21[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v20, 8);
  id v10 = objc_alloc_init(v9);
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_100048B98;
  id v17 = &unk_1001139D8;
  id v18 = self;
  id v19 = v3;
  id v11 = v3;
  [v10 getSubscriptionStatusWithCompletionHandler:&v14];
  id v12 = objc_msgSend(v11, "binaryPromiseAdapter", v14, v15, v16, v17, v18);

  return v12;
}

- (id)_hasTVSubscription
{
  id v3 = [objc_alloc((Class)AMSMutablePromise) initWithTimeout:2.0];
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
  uint64_t v8 = (void *)qword_100130380;
  uint64_t v23 = qword_100130380;
  if (!qword_100130380)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10004965C;
    v25 = &unk_100112770;
    v26 = &v20;
    sub_10004965C((uint64_t)buf);
    uint64_t v8 = (void *)v21[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v20, 8);
  id v10 = objc_alloc_init(v9);
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_100049080;
  id v17 = &unk_100113A00;
  id v18 = self;
  id v19 = v3;
  id v11 = v3;
  [v10 fetchSubscriptionData:1 completion:&v14];
  id v12 = objc_msgSend(v11, "binaryPromiseAdapter", v14, v15, v16, v17, v18);

  return v12;
}

@end