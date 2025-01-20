@interface CKAssistantSMSRecipientSearch
- (id)_oldSearch;
- (id)_perform;
- (id)_search;
- (id)_validate;
- (void)performWithCompletion:(id)a3;
@end

@implementation CKAssistantSMSRecipientSearch

- (id)_search
{
  id v85 = objc_alloc_init((Class)SASmsRecipientSearchCompleted);
  v107 = +[NSMutableArray array];
  v108 = +[NSMutableDictionary dictionary];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = [(CKAssistantSMSRecipientSearch *)self recipients];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Performing fast search path with recipients: %@", buf, 0xCu);
    }
  }
  long long v158 = 0u;
  long long v159 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  id obj = [(CKAssistantSMSRecipientSearch *)self recipients];
  id v88 = [obj countByEnumeratingWithState:&v156 objects:v175 count:16];
  if (v88)
  {
    uint64_t v86 = *(void *)v157;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v157 != v86)
        {
          uint64_t v6 = v5;
          objc_enumerationMutation(obj);
          uint64_t v5 = v6;
        }
        uint64_t v87 = v5;
        v109 = *(void **)(*((void *)&v156 + 1) + 8 * v5);
        v7 = +[IMContactStore sharedInstance];
        v8 = [v109 internalGUID];
        v90 = [v7 fetchCNContactWithIdentifier:v8];

        if (IMOSLoggingEnabled())
        {
          v9 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            uint64_t v10 = [v109 internalGUID];
            v11 = (void *)v10;
            *(_DWORD *)buf = 138412546;
            CFStringRef v12 = @"YES";
            if (!v90) {
              CFStringRef v12 = @"NO";
            }
            *(void *)&buf[4] = v10;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v12;
            _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Found record for internal GUID %@: %@", buf, 0x16u);
          }
        }
        if ([v90 count])
        {
          long long v146 = 0uLL;
          long long v147 = 0uLL;
          long long v144 = 0uLL;
          long long v145 = 0uLL;
          id v96 = v90;
          id v92 = [v96 countByEnumeratingWithState:&v144 objects:v172 count:16];
          if (v92)
          {
            uint64_t v91 = *(void *)v145;
            do
            {
              for (i = 0; i != v92; i = (char *)i + 1)
              {
                if (*(void *)v145 != v91) {
                  objc_enumerationMutation(v96);
                }
                v97 = *(void **)(*((void *)&v144 + 1) + 8 * i);
                v95 = [v97 phoneNumbers];
                v99 = +[NSMutableArray array];
                if ([v95 count])
                {
                  long long v142 = 0u;
                  long long v143 = 0u;
                  long long v140 = 0u;
                  long long v141 = 0u;
                  id v100 = v95;
                  id v104 = [v100 countByEnumeratingWithState:&v140 objects:v171 count:16];
                  if (v104)
                  {
                    uint64_t v102 = *(void *)v141;
                    do
                    {
                      for (j = 0; j != v104; j = (char *)j + 1)
                      {
                        if (*(void *)v141 != v102) {
                          objc_enumerationMutation(v100);
                        }
                        v14 = *(void **)(*((void *)&v140 + 1) + 8 * (void)j);
                        v15 = [v14 value];
                        v111 = [v15 stringValue];

                        v16 = [v14 label];
                        if (IMOSLoggingEnabled())
                        {
                          v17 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 138412546;
                            *(void *)&buf[4] = v111;
                            *(_WORD *)&buf[12] = 2112;
                            *(void *)&buf[14] = v16;
                            _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Found number %@ for label %@", buf, 0x16u);
                          }
                        }
                        if (v111)
                        {
                          id v18 = +[CKAssistantSearchUtilities canonicalizeNumber:v111];
                          [v107 addObject:v18];
                          [v108 setObject:v109 forKey:v18];
                          if (v16)
                          {
                            long long v138 = 0u;
                            long long v139 = 0u;
                            long long v136 = 0u;
                            long long v137 = 0u;
                            v19 = [v109 phones];
                            id v20 = [v19 countByEnumeratingWithState:&v136 objects:v170 count:16];
                            if (v20)
                            {
                              uint64_t v21 = *(void *)v137;
                              while (2)
                              {
                                for (k = 0; k != v20; k = (char *)k + 1)
                                {
                                  if (*(void *)v137 != v21) {
                                    objc_enumerationMutation(v19);
                                  }
                                  v23 = *(void **)(*((void *)&v136 + 1) + 8 * (void)k);
                                  v24 = [v23 label];
                                  unsigned int v25 = [v24 isEqualToString:v16];

                                  if (v25)
                                  {
                                    [v23 setNumber:v18];
                                    [v99 addObject:v23];
                                    goto LABEL_44;
                                  }
                                }
                                id v20 = [v19 countByEnumeratingWithState:&v136 objects:v170 count:16];
                                if (v20) {
                                  continue;
                                }
                                break;
                              }
                            }
LABEL_44:
                          }
                        }
                      }
                      id v104 = [v100 countByEnumeratingWithState:&v140 objects:v171 count:16];
                    }
                    while (v104);
                  }
                }
                [v109 setPhones:v99];
                v94 = [v97 emailAddresses];
                v98 = +[NSMutableArray array];
                if ([v94 count])
                {
                  long long v134 = 0u;
                  long long v135 = 0u;
                  long long v132 = 0u;
                  long long v133 = 0u;
                  id v101 = v94;
                  id v105 = [v101 countByEnumeratingWithState:&v132 objects:v169 count:16];
                  if (v105)
                  {
                    uint64_t v103 = *(void *)v133;
                    do
                    {
                      for (m = 0; m != v105; m = (char *)m + 1)
                      {
                        if (*(void *)v133 != v103) {
                          objc_enumerationMutation(v101);
                        }
                        v27 = *(void **)(*((void *)&v132 + 1) + 8 * (void)m);
                        v112 = [v27 value];
                        v28 = [v27 label];
                        if (IMOSLoggingEnabled())
                        {
                          v29 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 138412546;
                            *(void *)&buf[4] = v112;
                            *(_WORD *)&buf[12] = 2112;
                            *(void *)&buf[14] = v28;
                            _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Found email %@ for label %@", buf, 0x16u);
                          }
                        }
                        if (v112)
                        {
                          id v30 = +[CKAssistantSearchUtilities canonicalizeNumber:v112];
                          [v107 addObject:v30];
                          [v108 setObject:v109 forKey:v30];
                          if (v28)
                          {
                            long long v130 = 0u;
                            long long v131 = 0u;
                            long long v128 = 0u;
                            long long v129 = 0u;
                            v31 = [v109 emails];
                            id v32 = [v31 countByEnumeratingWithState:&v128 objects:v168 count:16];
                            if (v32)
                            {
                              uint64_t v33 = *(void *)v129;
                              while (2)
                              {
                                for (n = 0; n != v32; n = (char *)n + 1)
                                {
                                  if (*(void *)v129 != v33) {
                                    objc_enumerationMutation(v31);
                                  }
                                  v35 = *(void **)(*((void *)&v128 + 1) + 8 * (void)n);
                                  v36 = [v35 label];
                                  unsigned int v37 = [v36 isEqualToString:v28];

                                  if (v37)
                                  {
                                    [v35 setEmailAddress:v30];
                                    [v98 addObject:v35];
                                    goto LABEL_71;
                                  }
                                }
                                id v32 = [v31 countByEnumeratingWithState:&v128 objects:v168 count:16];
                                if (v32) {
                                  continue;
                                }
                                break;
                              }
                            }
LABEL_71:
                          }
                        }
                      }
                      id v105 = [v101 countByEnumeratingWithState:&v132 objects:v169 count:16];
                    }
                    while (v105);
                  }
                }
                [v109 setEmails:v98];
              }
              id v92 = [v96 countByEnumeratingWithState:&v144 objects:v172 count:16];
            }
            while (v92);
          }
        }
        else
        {
          long long v154 = 0uLL;
          long long v155 = 0uLL;
          long long v152 = 0uLL;
          long long v153 = 0uLL;
          v38 = [v109 phones];
          id v39 = [v38 countByEnumeratingWithState:&v152 objects:v174 count:16];
          if (v39)
          {
            uint64_t v40 = *(void *)v153;
            do
            {
              for (ii = 0; ii != v39; ii = (char *)ii + 1)
              {
                if (*(void *)v153 != v40) {
                  objc_enumerationMutation(v38);
                }
                v42 = [*(id *)(*((void *)&v152 + 1) + 8 * (void)ii) number];
                id v43 = +[CKAssistantSearchUtilities canonicalizeNumber:v42];

                if (v43)
                {
                  v44 = [v109 internalGUID];
                  if (v44)
                  {
                    [v109 setInternalGUID:v44];
                  }
                  else
                  {
                    v45 = +[NSUUID UUID];
                    v46 = [v45 UUIDString];
                    [v109 setInternalGUID:v46];
                  }
                  [v108 setObject:v109 forKey:v43];
                  [v107 addObject:v43];
                }
              }
              id v39 = [v38 countByEnumeratingWithState:&v152 objects:v174 count:16];
            }
            while (v39);
          }

          long long v150 = 0u;
          long long v151 = 0u;
          long long v148 = 0u;
          long long v149 = 0u;
          id v96 = [v109 emails];
          id v47 = [v96 countByEnumeratingWithState:&v148 objects:v173 count:16];
          if (v47)
          {
            uint64_t v48 = *(void *)v149;
            do
            {
              for (jj = 0; jj != v47; jj = (char *)jj + 1)
              {
                if (*(void *)v149 != v48) {
                  objc_enumerationMutation(v96);
                }
                v50 = [*(id *)(*((void *)&v148 + 1) + 8 * (void)jj) emailAddress];
                id v51 = +[CKAssistantSearchUtilities canonicalizeNumber:v50];

                if (v51)
                {
                  v52 = [v109 internalGUID];
                  if (v52)
                  {
                    [v109 setInternalGUID:v52];
                  }
                  else
                  {
                    v53 = +[NSUUID UUID];
                    v54 = [v53 UUIDString];
                    [v109 setInternalGUID:v54];
                  }
                  [v108 setObject:v109 forKey:v51];
                  [v107 addObject:v51];
                }
              }
              id v47 = [v96 countByEnumeratingWithState:&v148 objects:v173 count:16];
            }
            while (v47);
          }
        }

        uint64_t v5 = v87 + 1;
      }
      while ((id)(v87 + 1) != v88);
      id v88 = [obj countByEnumeratingWithState:&v156 objects:v175 count:16];
    }
    while (v88);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v165 = sub_7D34;
  v166 = sub_7D44;
  id v167 = 0;
  v122 = _NSConcreteStackBlock;
  uint64_t v123 = 3221225472;
  v124 = sub_7D4C;
  v125 = &unk_104E8;
  v127 = buf;
  id v106 = v107;
  id v126 = v106;
  IMDPersistencePerformBlock();
  v110 = +[NSMutableArray array];
  v113 = +[NSMutableArray array];
  v55 = +[NSMutableArray array];
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v56 = *(id *)(*(void *)&buf[8] + 40);
  id v57 = [v56 countByEnumeratingWithState:&v118 objects:v163 count:16];
  if (v57)
  {
    uint64_t v58 = *(void *)v119;
    do
    {
      for (kk = 0; kk != v57; kk = (char *)kk + 1)
      {
        if (*(void *)v119 != v58) {
          objc_enumerationMutation(v56);
        }
        uint64_t v60 = *(void *)(*((void *)&v118 + 1) + 8 * (void)kk);
        v61 = [v108 objectForKey:v60];
        v62 = [v61 internalGUID];
        unsigned __int8 v63 = [v55 containsObject:v62];

        if ((v63 & 1) == 0)
        {
          id v64 = objc_alloc_init((Class)SAPersonAttribute);
          [v64 setData:v60];
          if (IMOSLoggingEnabled())
          {
            v65 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v161 = 138412290;
              id v162 = v61;
              _os_log_impl(&dword_0, v65, OS_LOG_TYPE_INFO, "Setting SAPerson as object on attribute: %@", v161, 0xCu);
            }
          }
          [v64 setObject:v61];
          v66 = [v61 fullName];
          [v64 setDisplayText:v66];

          v67 = [v61 internalGUID];
          [v55 addObject:v67];

          [v113 addObject:v64];
          [v110 addObject:v60];
        }
      }
      id v57 = [v56 countByEnumeratingWithState:&v118 objects:v163 count:16];
    }
    while (v57);
  }

  [v85 setRecipients:v113];
  if (IMOSLoggingEnabled())
  {
    v68 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v161 = 138412290;
      id v162 = v85;
      _os_log_impl(&dword_0, v68, OS_LOG_TYPE_INFO, "recipient search result %@", v161, 0xCu);
    }
  }
  if (+[IMDowntimeController isContactLimitsFeatureEnabled](IMDowntimeController, "isContactLimitsFeatureEnabled")&& ((IMSharedDowntimeController(), v69 = objc_claimAutoreleasedReturnValue(), v70 = v69, v110)? (v71 = v110): (v71 = &__NSArray0__struct), unsigned __int8 v72 = [v69 allowedToShowConversationWithHandleIDs:v71 sync:1 context:0], v70, (v72 & 1) == 0))
  {
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id v74 = v110;
    id v75 = [v74 countByEnumeratingWithState:&v114 objects:v160 count:16];
    v76 = (void *)SASmsSendErrorRecipientNotWhitelistedErrorCode;
    if (v75)
    {
      uint64_t v77 = *(void *)v115;
      while (2)
      {
        for (mm = 0; mm != v75; mm = (char *)mm + 1)
        {
          if (*(void *)v115 != v77) {
            objc_enumerationMutation(v74);
          }
          uint64_t v79 = *(void *)(*((void *)&v114 + 1) + 8 * (void)mm);
          v80 = +[IMContactStore sharedInstance];
          v81 = [v80 fetchCNContactForHandleID:v79 withKeys:&__NSArray0__struct];
          LOBYTE(v79) = v81 == 0;

          if ((v79 & 1) == 0)
          {
            v76 = (void *)SASmsSendErrorScreenTimeRestrictionEnabledErrorCode;
            goto LABEL_138;
          }
        }
        id v75 = [v74 countByEnumeratingWithState:&v114 objects:v160 count:16];
        if (v75) {
          continue;
        }
        break;
      }
    }
LABEL_138:

    if (IMOSLoggingEnabled())
    {
      v82 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v161 = 134217984;
        id v162 = v76;
        _os_log_impl(&dword_0, v82, OS_LOG_TYPE_INFO, "blocking handles due to Screen Time policy, error code: %ld", v161, 0xCu);
      }
    }
    id v73 = [objc_alloc((Class)SACommandFailed) initWithErrorCode:v76];
  }
  else
  {
    id v73 = v85;
  }
  v83 = v73;

  _Block_object_dispose(buf, 8);

  return v83;
}

- (id)_oldSearch
{
  id v62 = objc_alloc_init((Class)SASmsRecipientSearchCompleted);
  v2 = +[NSMutableArray array];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = [(CKAssistantSMSRecipientSearch *)self recipients];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Performing old search path with recipients: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id obj = [(CKAssistantSMSRecipientSearch *)self recipients];
  id v72 = [obj countByEnumeratingWithState:&v104 objects:v121 count:16];
  if (v72)
  {
    uint64_t v70 = *(void *)v105;
    do
    {
      for (i = 0; i != v72; i = (char *)i + 1)
      {
        if (*(void *)v105 != v70) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v104 + 1) + 8 * i);
        long long v100 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        v7 = [v6 phones];
        id v8 = [v7 countByEnumeratingWithState:&v100 objects:v120 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v101;
          do
          {
            for (j = 0; j != v8; j = (char *)j + 1)
            {
              if (*(void *)v101 != v9) {
                objc_enumerationMutation(v7);
              }
              v11 = *(void **)(*((void *)&v100 + 1) + 8 * (void)j);
              CFStringRef v12 = [v11 number];

              if (v12)
              {
                v13 = [v11 number];
                CFArrayAppendValue(v2, +[CKAssistantSearchUtilities canonicalizeNumber:v13]);
              }
            }
            id v8 = [v7 countByEnumeratingWithState:&v100 objects:v120 count:16];
          }
          while (v8);
        }

        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        v14 = [v6 emails];
        id v15 = [v14 countByEnumeratingWithState:&v96 objects:v119 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v97;
          do
          {
            for (k = 0; k != v15; k = (char *)k + 1)
            {
              if (*(void *)v97 != v16) {
                objc_enumerationMutation(v14);
              }
              id v18 = *(void **)(*((void *)&v96 + 1) + 8 * (void)k);
              v19 = [v18 emailAddress];

              if (v19)
              {
                id v20 = [v18 emailAddress];
                CFArrayAppendValue(v2, +[CKAssistantSearchUtilities canonicalizeNumber:v20]);
              }
            }
            id v15 = [v14 countByEnumeratingWithState:&v96 objects:v119 count:16];
          }
          while (v15);
        }
      }
      id v72 = [obj countByEnumeratingWithState:&v104 objects:v121 count:16];
    }
    while (v72);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v115 = 0x3032000000;
  long long v116 = sub_7D34;
  long long v117 = sub_7D44;
  id v118 = 0;
  v90 = _NSConcreteStackBlock;
  uint64_t v91 = 3221225472;
  id v92 = sub_8764;
  v93 = &unk_104E8;
  p_long long buf = &buf;
  v61 = v2;
  v94 = v61;
  IMDPersistencePerformBlock();
  id v63 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
  for (unint64_t m = 0; m < (unint64_t)objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "count", v61); ++m)
  {
    uint64_t v21 = objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "objectAtIndex:");
    id v22 = objc_alloc_init((Class)SAPersonAttribute);
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    v23 = [(CKAssistantSMSRecipientSearch *)self recipients];
    id v24 = [v23 countByEnumeratingWithState:&v86 objects:v113 count:16];
    id v73 = v22;
    if (v24)
    {
      id v66 = v23;
      uint64_t v67 = *(void *)v87;
      do
      {
        unsigned int v25 = 0;
        id obja = v24;
        do
        {
          if (*(void *)v87 != v67) {
            objc_enumerationMutation(v66);
          }
          v26 = *(void **)(*((void *)&v86 + 1) + 8 * (void)v25);
          long long v82 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          v71 = v26;
          v27 = [v26 emails];
          id v28 = [v27 countByEnumeratingWithState:&v82 objects:v112 count:16];
          if (v28)
          {
            uint64_t v29 = *(void *)v83;
            while (2)
            {
              for (n = 0; n != v28; n = (char *)n + 1)
              {
                if (*(void *)v83 != v29) {
                  objc_enumerationMutation(v27);
                }
                v31 = *(void **)(*((void *)&v82 + 1) + 8 * (void)n);
                id v32 = [v31 emailAddress];

                if (v32)
                {
                  uint64_t v33 = [v31 emailAddress];
                  BOOL v34 = CFEqual(+[CKAssistantSearchUtilities canonicalizeNumber:v33], v21) == 0;

                  if (!v34)
                  {
                    v35 = [v31 emailAddress];
                    [v73 setData:v35];

                    [v73 setObject:v71];
                    v36 = [v71 fullName];
                    [v73 setDisplayText:v36];

                    goto LABEL_48;
                  }
                }
              }
              id v28 = [v27 countByEnumeratingWithState:&v82 objects:v112 count:16];
              if (v28) {
                continue;
              }
              break;
            }
          }
LABEL_48:

          unsigned int v37 = [v73 object];
          BOOL v38 = v37 == 0;

          if (v38)
          {
            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            id v39 = [v71 phones];
            id v40 = [v39 countByEnumeratingWithState:&v78 objects:v111 count:16];
            if (v40)
            {
              uint64_t v41 = *(void *)v79;
              while (2)
              {
                for (ii = 0; ii != v40; ii = (char *)ii + 1)
                {
                  if (*(void *)v79 != v41) {
                    objc_enumerationMutation(v39);
                  }
                  id v43 = *(void **)(*((void *)&v78 + 1) + 8 * (void)ii);
                  v44 = [v43 number];

                  if (v44)
                  {
                    v45 = [v43 number];
                    BOOL v46 = CFEqual(+[CKAssistantSearchUtilities canonicalizeNumber:v45], v21) == 0;

                    if (!v46)
                    {
                      id v47 = [v43 number];
                      [v73 setData:v47];

                      [v73 setObject:v71];
                      uint64_t v48 = [v71 fullName];
                      [v73 setDisplayText:v48];

                      goto LABEL_60;
                    }
                  }
                }
                id v40 = [v39 countByEnumeratingWithState:&v78 objects:v111 count:16];
                if (v40) {
                  continue;
                }
                break;
              }
            }
LABEL_60:
          }
          unsigned int v25 = (char *)v25 + 1;
        }
        while (v25 != obja);
        v23 = v66;
        id v24 = [v66 countByEnumeratingWithState:&v86 objects:v113 count:16];
      }
      while (v24);
    }

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v49 = v63;
    id v50 = [v49 countByEnumeratingWithState:&v74 objects:v110 count:16];
    if (v50)
    {
      uint64_t v51 = *(void *)v75;
      while (2)
      {
        for (jj = 0; jj != v50; jj = (char *)jj + 1)
        {
          if (*(void *)v75 != v51) {
            objc_enumerationMutation(v49);
          }
          v53 = [*(id *)(*((void *)&v74 + 1) + 8 * (void)jj) object];
          v54 = [v73 object];
          unsigned __int8 v55 = [v53 isEqual:v54];

          if (v55)
          {

            id v57 = v73;
            goto LABEL_73;
          }
        }
        id v50 = [v49 countByEnumeratingWithState:&v74 objects:v110 count:16];
        if (v50) {
          continue;
        }
        break;
      }
    }

    id v56 = v49;
    id v57 = v73;
    [v56 addObject:v73];
LABEL_73:
  }
  [v62 setRecipients:v63];
  if (IMOSLoggingEnabled())
  {
    uint64_t v58 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v108 = 138412290;
      id v109 = v62;
      _os_log_impl(&dword_0, v58, OS_LOG_TYPE_INFO, "Returning recipient old search result %@", v108, 0xCu);
    }
  }
  id v59 = v62;

  _Block_object_dispose(&buf, 8);

  return v59;
}

- (id)_perform
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(CKAssistantSMSRecipientSearch *)self clientShouldResolvePhonesAndEmails])
  {
    v3 = [(CKAssistantSMSRecipientSearch *)self _search];
  }
  else
  {
    v3 = [(CKAssistantSMSRecipientSearch *)self _oldSearch];
  }

  return v3;
}

- (id)_validate
{
  v2 = [(CKAssistantSMSRecipientSearch *)self recipients];
  if ([v2 count]) {
    id v3 = 0;
  }
  else {
    id v3 = [objc_alloc((Class)SACommandFailed) initWithReason:@"CKAssistantSMSRecipientSearch has nil or empty recipients."];
  }

  return v3;
}

- (void)performWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "SMSRecipientSearch performWithCompletion", buf, 2u);
    }
  }
  uint64_t v6 = [(CKAssistantSMSRecipientSearch *)self _validate];
  if (v6)
  {
    v7 = (void *)v6;
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "SMSRecipientSearch has nil or empty recipients", v10, 2u);
      }
    }
  }
  else
  {
    v7 = [(CKAssistantSMSRecipientSearch *)self _perform];
  }
  uint64_t v9 = [v7 dictionary];
  v4[2](v4, v9);
}

@end