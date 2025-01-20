@interface IDSMadridEndpointFilterComponent
- (id)runIndividuallyWithInput:(id)a3;
- (void)addTokenURI:(id)a3 forProperty:(id)a4 toRegistrationPropertyToDestinationsMap:(id)a5;
@end

@implementation IDSMadridEndpointFilterComponent

- (id)runIndividuallyWithInput:(id)a3
{
  id v3 = a3;
  id v79 = objc_alloc_init((Class)NSMutableArray);
  id v91 = objc_alloc_init((Class)NSMutableDictionary);
  id v80 = objc_alloc_init((Class)NSMutableArray);
  id v81 = objc_alloc_init((Class)NSMutableDictionary);
  id v83 = objc_alloc_init((Class)NSMutableDictionary);
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id obj = [v3 endpoints];
  v89 = v3;
  id v85 = [obj countByEnumeratingWithState:&v120 objects:v138 count:16];
  if (v85)
  {
    uint64_t v84 = *(void *)v121;
    do
    {
      for (id i = 0; i != v85; id i = v45 + 1)
      {
        if (*(void *)v121 != v84) {
          objc_enumerationMutation(obj);
        }
        v88 = (char *)i;
        v5 = *(void **)(*((void *)&v120 + 1) + 8 * i);
        uint64_t v6 = [v5 pushTokenObject];
        v86 = [v5 URI];
        v87 = (void *)v6;
        v7 = [v86 URIByAddingPushToken:v6];
        long long v116 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        v8 = [v3 registrationProperties];
        v9 = [v8 interesting];

        id v10 = [v9 countByEnumeratingWithState:&v116 objects:v137 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v117;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v117 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v116 + 1) + 8 * (void)j);
              v15 = [v5 capabilities];
              uint64_t v16 = (uint64_t)[v15 valueForCapability:v14];

              if (v16 < 1)
              {
                v17 = +[IDSFoundationLog delivery];
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  v18 = [v3 guid];
                  *(_DWORD *)buf = 138412802;
                  v132 = v18;
                  __int16 v133 = 2112;
                  v134 = v7;
                  __int16 v135 = 2112;
                  uint64_t v136 = v14;
                  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "GUID %@ Destination %@ lacks interesting property %@", buf, 0x20u);
                }
              }
              else
              {
                [(IDSMadridEndpointFilterComponent *)self addTokenURI:v7 forProperty:v14 toRegistrationPropertyToDestinationsMap:v91];
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v116 objects:v137 count:16];
          }
          while (v11);
        }

        long long v114 = 0u;
        long long v115 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        v19 = [v3 registrationProperties];
        v20 = [v19 requireAll];

        id v21 = [v20 countByEnumeratingWithState:&v112 objects:v130 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v113;
          char v24 = 1;
          do
          {
            for (k = 0; k != v22; k = (char *)k + 1)
            {
              if (*(void *)v113 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v26 = *(void *)(*((void *)&v112 + 1) + 8 * (void)k);
              v27 = [v5 capabilities];
              uint64_t v28 = (uint64_t)[v27 valueForCapability:v26];

              if (v28 < 1)
              {
                v29 = +[IDSFoundationLog delivery];
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  v30 = [v89 guid];
                  *(_DWORD *)buf = 138412802;
                  v132 = v30;
                  __int16 v133 = 2112;
                  v134 = v7;
                  __int16 v135 = 2112;
                  uint64_t v136 = v26;
                  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "GUID %@ Destination %@ lacks required property %@", buf, 0x20u);
                }
                char v24 = 0;
              }
              else
              {
                [(IDSMadridEndpointFilterComponent *)self addTokenURI:v7 forProperty:v26 toRegistrationPropertyToDestinationsMap:v91];
              }
            }
            id v22 = [v20 countByEnumeratingWithState:&v112 objects:v130 count:16];
          }
          while (v22);
        }
        else
        {
          char v24 = 1;
        }

        long long v110 = 0u;
        long long v111 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        v31 = [v89 registrationProperties];
        v32 = [v31 lackAll];

        id v33 = [v32 countByEnumeratingWithState:&v108 objects:v129 count:16];
        if (v33)
        {
          id v34 = v33;
          uint64_t v35 = *(void *)v109;
          do
          {
            for (m = 0; m != v34; m = (char *)m + 1)
            {
              if (*(void *)v109 != v35) {
                objc_enumerationMutation(v32);
              }
              uint64_t v37 = *(void *)(*((void *)&v108 + 1) + 8 * (void)m);
              v38 = [v5 capabilities];
              uint64_t v39 = (uint64_t)[v38 valueForCapability:v37];

              if (v39 >= 1)
              {
                v40 = +[IDSFoundationLog delivery];
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  v41 = [v89 guid];
                  *(_DWORD *)buf = 138412802;
                  v132 = v41;
                  __int16 v133 = 2112;
                  v134 = v7;
                  __int16 v135 = 2112;
                  uint64_t v136 = v37;
                  _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "GUID %@ Destination %@ has property %@ we do not want", buf, 0x20u);
                }
                [(IDSMadridEndpointFilterComponent *)self addTokenURI:v7 forProperty:v37 toRegistrationPropertyToDestinationsMap:v91];
                char v24 = 0;
              }
            }
            id v34 = [v32 countByEnumeratingWithState:&v108 objects:v129 count:16];
          }
          while (v34);
        }

        if (v24)
        {
          v42 = v87;
          id v43 = [v83 objectForKey:v87];
          id v3 = v89;
          v44 = v86;
          if (!v43)
          {
            id v43 = objc_alloc_init((Class)NSMutableSet);
            [v83 setObject:v43 forKey:v87];
          }
          v45 = v88;
          if (![v43 count]
            || ([v89 sendOnePerToken] & 1) == 0
            && ([v43 containsObject:v86] & 1) == 0)
          {
            if (v86) {
              [v43 addObject:v86];
            }
            [v79 addObject:v5];
            id v46 = [v81 objectForKey:v86];
            if (!v46)
            {
              id v46 = objc_alloc_init((Class)NSMutableArray);
              if (v86) {
                [v81 setObject:v46 forKey:v86];
              }
            }
            if (v87) {
              [v46 addObject:v87];
            }
          }
        }
        else
        {
          v45 = v88;
          id v3 = v89;
          v44 = v86;
          v42 = v87;
          if (v7) {
            [v80 addObject:v7];
          }
        }
      }
      id v85 = [obj countByEnumeratingWithState:&v120 objects:v138 count:16];
    }
    while (v85);
  }

  [v3 setEndpoints:v79];
  v47 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v48 = [v3 guid];
    *(_DWORD *)buf = 138412290;
    v132 = v48;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "GUID %@ finished token filtering", buf, 0xCu);
  }
  v49 = [v3 guid];
  id v50 = [v49 copy];

  v51 = [v81 debugDescription];
  v102 = _NSConcreteStackBlock;
  uint64_t v103 = 3221225472;
  v104 = sub_100346F18;
  v105 = &unk_10097E440;
  id v52 = v50;
  id v106 = v52;
  id v53 = v51;
  id v107 = v53;
  cut_dispatch_log_queue();
  if ([v80 count])
  {
    v54 = [v80 debugDescription];
    v96 = _NSConcreteStackBlock;
    uint64_t v97 = 3221225472;
    v98 = sub_100346FD4;
    v99 = &unk_10097E440;
    id v100 = v52;
    id v101 = v54;
    id v55 = v54;
    cut_dispatch_log_queue();
  }
  id v56 = objc_alloc_init((Class)NSMutableArray);
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v57 = v79;
  id v58 = [v57 countByEnumeratingWithState:&v92 objects:v128 count:16];
  if (v58)
  {
    id v59 = v58;
    uint64_t v60 = *(void *)v93;
    do
    {
      for (n = 0; n != v59; n = (char *)n + 1)
      {
        if (*(void *)v93 != v60) {
          objc_enumerationMutation(v57);
        }
        v62 = *(void **)(*((void *)&v92 + 1) + 8 * (void)n);
        v63 = [v62 URI];
        v64 = [v62 pushTokenObject];
        v65 = [v63 URIByAddingPushToken:v64];

        if (v65) {
          [v56 addObject:v65];
        }
      }
      id v59 = [v57 countByEnumeratingWithState:&v92 objects:v128 count:16];
    }
    while (v59);
  }

  uint64_t v66 = [v89 willSendBlock];
  v67 = (void *)v66;
  if (v66) {
    (*(void (**)(uint64_t, id, id, id))(v66 + 16))(v66, v56, v80, v91);
  }
  if ([v57 count])
  {
    v68 = v89;
    v69 = +[CUTUnsafePromise fulfilledPromiseWithValue:v89];
  }
  else
  {
    id v70 = [v80 count];
    id v71 = objc_alloc((Class)NSError);
    uint64_t v72 = IDSSendErrorDomain;
    if (v70)
    {
      CFStringRef v126 = @"IDSPipelineParameter";
      v127 = v89;
      v73 = +[NSDictionary dictionaryWithObjects:&v127 forKeys:&v126 count:1];
      v74 = v71;
      uint64_t v75 = v72;
      uint64_t v76 = 28;
    }
    else
    {
      CFStringRef v124 = @"IDSPipelineParameter";
      v125 = v89;
      v73 = +[NSDictionary dictionaryWithObjects:&v125 forKeys:&v124 count:1];
      v74 = v71;
      uint64_t v75 = v72;
      uint64_t v76 = 1;
    }
    id v77 = [v74 initWithDomain:v75 code:v76 userInfo:v73];

    v69 = +[CUTUnsafePromise failedPromiseWithError:v77];

    v68 = v89;
  }

  return v69;
}

- (void)addTokenURI:(id)a3 forProperty:(id)a4 toRegistrationPropertyToDestinationsMap:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v8 objectForKey:v7];
  if (!v9)
  {
    id v9 = objc_alloc_init((Class)NSMutableArray);
    [v8 setObject:v9 forKey:v7];
  }
  if (v10) {
    [v9 addObject:v10];
  }
}

@end