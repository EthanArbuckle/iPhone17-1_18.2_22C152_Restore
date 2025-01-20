@interface AMSFraudReportHandleResponse
@end

@implementation AMSFraudReportHandleResponse

id ___AMSFraudReportHandleResponse_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  if (([a2 BOOLValue] & 1) == 0)
  {
    v11 = +[AMSOptional optionalWithNil];
    v12 = +[AMSPromise promiseWithResult:v11];

    goto LABEL_145;
  }
  id v3 = *(id *)(a1 + 32);
  v4 = AMSSetLogKeyIfNeeded();
  if (!v3 || (objc_msgSend(v3, "ams_isLocalAccount") & 1) != 0 || (objc_msgSend(v3, "isActive") & 1) == 0)
  {
    v5 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    v6 = objc_msgSend(v5, "ams_activeiTunesAccount");

    if (v6)
    {
      id v7 = v6;

      v8 = +[AMSLogConfig sharedFraudReportConfig];
      if (!v8)
      {
        v8 = +[AMSLogConfig sharedConfig];
      }
      v9 = [v8 OSLogObject];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v4;
      v10 = "AMSFraudReport: [%{public}@] Fraud report: account overridden with the active account.";
    }
    else
    {
      if (objc_msgSend(v3, "ams_isLocalAccount"))
      {
LABEL_18:

        goto LABEL_19;
      }
      v13 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      objc_msgSend(v13, "ams_localiTunesAccount");
      id v7 = (id)objc_claimAutoreleasedReturnValue();

      v8 = +[AMSLogConfig sharedFraudReportConfig];
      if (!v8)
      {
        v8 = +[AMSLogConfig sharedConfig];
      }
      v9 = [v8 OSLogObject];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_17:

        id v3 = v7;
        goto LABEL_18;
      }
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v4;
      v10 = "AMSFraudReport: [%{public}@] Fraud report: account overridden with the local account.";
    }
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&buf, 0xCu);
    goto LABEL_17;
  }
LABEL_19:

  if (objc_msgSend(*(id *)(a1 + 40), "ams_isFraudReportInitURLResponse"))
  {
    v14 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v14)
    {
      v14 = +[AMSLogConfig sharedConfig];
    }
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(a1 + 48);
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_INFO, "AMSFraudReport: [%{public}@] Handling init-URL-based fraud score refresh request.", (uint8_t *)&buf, 0xCu);
    }

    v17 = *(void **)(a1 + 40);
    v18 = *(void **)(a1 + 56);
    v19 = *(void **)(a1 + 64);
    v20 = *(void **)(a1 + 72);
    id v21 = v18;
    id v22 = v17;
    id v23 = v3;
    id v24 = v19;
    id v25 = v20;
    v150 = AMSSetLogKeyIfNeeded();
    v26 = (void *)MEMORY[0x1E4F1CB10];
    v27 = objc_msgSend(v22, "ams_fsrInitUrl");
    uint64_t v28 = [v26 URLWithString:v27];

    v148 = (void *)v28;
    v149 = v24;
    if (!v28)
    {
      v87 = v25;
      v88 = off_1E559C000;
      v89 = +[AMSLogConfig sharedFraudReportConfig];
      if (!v89)
      {
        v89 = +[AMSLogConfig sharedConfig];
      }
      v90 = [v89 OSLogObject];
      if (!os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
        goto LABEL_107;
      }
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v150;
      v91 = "AMSFraudReport: [%{public}@] Failed to create init URL, not calling.";
      v92 = v90;
      os_log_type_t v93 = OS_LOG_TYPE_ERROR;
      goto LABEL_106;
    }
    v29 = (void *)v28;
    v30 = objc_msgSend(v22, "ams_fsrNameSpace");
    uint64_t v31 = objc_msgSend(v22, "ams_fsrRequestInterval");
    v32 = v29;
    v33 = (void *)v31;
    id v140 = v32;
    id obj = v30;
    id v34 = v33;
    id v35 = v23;
    id v142 = v25;
    id v36 = v25;
    v37 = AMSSetLogKeyIfNeeded();
    id v144 = v23;
    id v146 = v22;
    if (v35)
    {
      if (v36)
      {
        id v138 = v21;
        id v135 = v34;
        [v34 doubleValue];
        double v39 = v38;
        v40 = v37;
        v41 = NSString;
        id v42 = obj;
        id v134 = v35;
        v43 = [v35 identifier];
        v44 = [v41 stringWithFormat:@"%@::%@", v42, v43];

        v45 = [v36 objectForKeyedSubscript:v44];
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v156 = __AMSFraudReportShouldCallInitURL_block_invoke;
        v157 = &unk_1E55A3208;
        v46 = v140;
        id v47 = v140;
        id v158 = v47;
        double v162 = v39;
        id v159 = v36;
        id v48 = v44;
        id v160 = v48;
        v136 = v40;
        id v133 = v40;
        id v161 = v133;
        v49 = (void (**)(void))_Block_copy(&buf);
        if (!v45)
        {
          v98 = +[AMSLogConfig sharedFraudReportConfig];
          if (!v98)
          {
            v98 = +[AMSLogConfig sharedConfig];
          }
          v99 = [v98 OSLogObject];
          id v21 = v138;
          id v34 = v135;
          if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
          {
            LODWORD(v163) = 138543362;
            *(void *)((char *)&v163 + 4) = v133;
            _os_log_impl(&dword_18D554000, v99, OS_LOG_TYPE_INFO, "AMSFraudReport: [%{public}@] No persisted state for key, will call init URL.", (uint8_t *)&v163, 0xCu);
          }

          v49[2](v49);
          int v97 = 1;
          v46 = v140;
          v37 = v136;
          goto LABEL_99;
        }
        uint64_t v50 = [v45 objectForKeyedSubscript:@"initURL"];
        objc_opt_class();
        v132 = (void *)v50;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v100 = +[AMSLogConfig sharedFraudReportConfig];
          if (!v100)
          {
            v100 = +[AMSLogConfig sharedConfig];
          }
          v101 = [v100 OSLogObject];
          id v21 = v138;
          id v34 = v135;
          if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
          {
            LODWORD(v163) = 138543362;
            *(void *)((char *)&v163 + 4) = v133;
            _os_log_impl(&dword_18D554000, v101, OS_LOG_TYPE_INFO, "AMSFraudReport: [%{public}@] No or malformed last init URL, will call init URL.", (uint8_t *)&v163, 0xCu);
          }

          v49[2](v49);
          int v97 = 1;
          v46 = v140;
          v37 = v136;
          goto LABEL_98;
        }
        v51 = [MEMORY[0x1E4F1CB10] URLWithString:v50];
        v131 = v51;
        if (v51)
        {
          id v34 = v135;
          if ([v51 isEqual:v47])
          {
            v52 = [v45 objectForKeyedSubscript:@"date"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v52 timeIntervalSinceNow];
              if (v39 >= -v53)
              {
                int v97 = 0;
                goto LABEL_96;
              }
              v54 = +[AMSLogConfig sharedFraudReportConfig];
              if (!v54)
              {
                v54 = +[AMSLogConfig sharedConfig];
              }
              v55 = [v54 OSLogObject];
              if (!os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
LABEL_94:

                v49[2](v49);
                int v97 = 1;
                v46 = v140;
LABEL_96:

                id v21 = v138;
                goto LABEL_97;
              }
              LODWORD(v163) = 138543362;
              *(void *)((char *)&v163 + 4) = v133;
              v56 = "AMSFraudReport: [%{public}@] Request interval elapsed, will call init URL.";
            }
            else
            {
              v54 = +[AMSLogConfig sharedFraudReportConfig];
              if (!v54)
              {
                v54 = +[AMSLogConfig sharedConfig];
              }
              v55 = [v54 OSLogObject];
              if (!os_log_type_enabled(v55, OS_LOG_TYPE_INFO)) {
                goto LABEL_94;
              }
              LODWORD(v163) = 138543362;
              *(void *)((char *)&v163 + 4) = v133;
              v56 = "AMSFraudReport: [%{public}@] No or malformed last init date, will call init URL.";
            }
            _os_log_impl(&dword_18D554000, v55, OS_LOG_TYPE_INFO, v56, (uint8_t *)&v163, 0xCu);
            goto LABEL_94;
          }
          v102 = +[AMSLogConfig sharedFraudReportConfig];
          id v21 = v138;
          if (!v102)
          {
            v102 = +[AMSLogConfig sharedConfig];
          }
          v103 = [v102 OSLogObject];
          if (!os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
          {
LABEL_88:

            v49[2](v49);
            int v97 = 1;
            v46 = v140;
LABEL_97:
            v37 = v136;

LABEL_98:
LABEL_99:

            id v35 = v134;
            goto LABEL_100;
          }
          LODWORD(v163) = 138543362;
          *(void *)((char *)&v163 + 4) = v133;
          v104 = "AMSFraudReport: [%{public}@] Last init URL differs from current init URL, will call init URL.";
        }
        else
        {
          v102 = +[AMSLogConfig sharedFraudReportConfig];
          id v21 = v138;
          id v34 = v135;
          if (!v102)
          {
            v102 = +[AMSLogConfig sharedConfig];
          }
          v103 = [v102 OSLogObject];
          if (!os_log_type_enabled(v103, OS_LOG_TYPE_INFO)) {
            goto LABEL_88;
          }
          LODWORD(v163) = 138543362;
          *(void *)((char *)&v163 + 4) = v133;
          v104 = "AMSFraudReport: [%{public}@] Unable to create last init URL, will call init URL.";
        }
        _os_log_impl(&dword_18D554000, v103, OS_LOG_TYPE_INFO, v104, (uint8_t *)&v163, 0xCu);
        goto LABEL_88;
      }
      id v48 = +[AMSLogConfig sharedFraudReportConfig];
      if (!v48)
      {
        id v48 = +[AMSLogConfig sharedConfig];
      }
      v45 = [v48 OSLogObject];
      v46 = v140;
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
LABEL_68:
        int v97 = 1;
LABEL_100:

        if (v97)
        {
          id v24 = v149;
          v105 = AMSFraudReportCallURL(v21, v46, 2, 0, v149);
          v153[0] = MEMORY[0x1E4F143A8];
          v153[1] = 3221225472;
          v153[2] = __AMSFraudReportHandleInitURLFraudReportResponse_block_invoke;
          v153[3] = &unk_1E55A0F50;
          id v154 = v150;
          [v105 resultWithCompletion:v153];

          v89 = v154;
          id v23 = v144;
          id v22 = v146;
          v87 = v142;
          v88 = off_1E559C000;
LABEL_108:

          if (v87)
          {
            id v106 = v87;
            v141 = AMSSetLogKeyIfNeeded();
            v107 = [v106 lastCleanupDate];
            v137 = v107;
            if (v107 && ([v107 timeIntervalSinceNow], v108 >= -7257600.0))
            {
              v126 = [(__objc2_class *)v88[17] sharedFraudReportConfig];
              if (!v126)
              {
                v126 = [(__objc2_class *)v88[17] sharedConfig];
              }
              id obja = v126;
              v127 = [v126 OSLogObject];
              if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
              {
                LODWORD(buf) = 138543362;
                *(void *)((char *)&buf + 4) = v141;
                _os_log_impl(&dword_18D554000, v127, OS_LOG_TYPE_INFO, "AMSFraudReport: [%{public}@] Not enough time passed since last persistent state cleanup, not cleaning up persistent state.", (uint8_t *)&buf, 0xCu);
              }
            }
            else
            {
              v109 = [(__objc2_class *)v88[17] sharedFraudReportConfig];
              if (!v109)
              {
                v109 = [(__objc2_class *)v88[17] sharedConfig];
              }
              id v139 = v21;
              v110 = [v109 OSLogObject];
              if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
              {
                LODWORD(buf) = 138543362;
                *(void *)((char *)&buf + 4) = v141;
                _os_log_impl(&dword_18D554000, v110, OS_LOG_TYPE_INFO, "AMSFraudReport: [%{public}@] Cleaning up old entries in persistent state.", (uint8_t *)&buf, 0xCu);
              }

              v111 = objc_opt_new();
              [v106 setLastCleanupDate:v111];

              v112 = [v106 allKeys];
              long long v163 = 0u;
              long long v164 = 0u;
              long long v165 = 0u;
              long long v166 = 0u;
              id obja = v112;
              uint64_t v113 = [v112 countByEnumeratingWithState:&v163 objects:&buf count:16];
              if (v113)
              {
                uint64_t v114 = v113;
                v143 = v87;
                id v145 = v23;
                id v147 = v22;
                uint64_t v115 = *(void *)v164;
                while (1)
                {
                  for (uint64_t i = 0; i != v114; ++i)
                  {
                    if (*(void *)v164 != v115) {
                      objc_enumerationMutation(obja);
                    }
                    uint64_t v117 = *(void *)(*((void *)&v163 + 1) + 8 * i);
                    v118 = [v106 objectForKeyedSubscript:v117];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      id v119 = v118;
                    }
                    else {
                      id v119 = 0;
                    }

                    v120 = [v119 objectForKeyedSubscript:@"date"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      id v121 = v120;
                    }
                    else {
                      id v121 = 0;
                    }

                    v122 = [v119 objectForKeyedSubscript:@"requestInterval"];
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {

                      v122 = 0;
LABEL_132:
                      [v106 setObject:0 forKeyedSubscript:v117];
                      goto LABEL_133;
                    }
                    if (!v121) {
                      goto LABEL_132;
                    }
                    if (!v122) {
                      goto LABEL_132;
                    }
                    [v121 timeIntervalSinceNow];
                    double v124 = -v123;
                    [v122 doubleValue];
                    if (v125 < v124) {
                      goto LABEL_132;
                    }
LABEL_133:
                  }
                  uint64_t v114 = [obja countByEnumeratingWithState:&v163 objects:&buf count:16];
                  if (!v114)
                  {
                    id v21 = v139;
                    id v23 = v145;
                    id v22 = v147;
                    id v24 = v149;
                    v87 = v143;
                    goto LABEL_142;
                  }
                }
              }
              id v24 = v149;
            }
LABEL_142:
          }
          v128 = +[AMSURLAction proceedAction];
          v129 = +[AMSOptional optionalWithValue:v128];
          v12 = +[AMSPromise promiseWithResult:v129];

          goto LABEL_144;
        }
        v88 = off_1E559C000;
        v89 = +[AMSLogConfig sharedFraudReportConfig];
        id v24 = v149;
        if (!v89)
        {
          v89 = +[AMSLogConfig sharedConfig];
        }
        v90 = [v89 OSLogObject];
        id v23 = v144;
        id v22 = v146;
        v87 = v142;
        if (!os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
        {
LABEL_107:

          goto LABEL_108;
        }
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v150;
        v91 = "AMSFraudReport [%{public}@] Don't need to call init URL at this point, not calling.";
        v92 = v90;
        os_log_type_t v93 = OS_LOG_TYPE_INFO;
LABEL_106:
        _os_log_impl(&dword_18D554000, v92, v93, v91, (uint8_t *)&buf, 0xCu);
        goto LABEL_107;
      }
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v37;
      v96 = "AMSFraudReport: [%{public}@] Persistent state storage is not available, will call init URL.";
    }
    else
    {
      id v48 = +[AMSLogConfig sharedFraudReportConfig];
      if (!v48)
      {
        id v48 = +[AMSLogConfig sharedConfig];
      }
      v45 = [v48 OSLogObject];
      v46 = v140;
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
        goto LABEL_68;
      }
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v37;
      v96 = "AMSFraudReport: [%{public}@] No account available to look up persisted state, will call init URL.";
    }
    _os_log_impl(&dword_18D554000, v45, OS_LOG_TYPE_ERROR, v96, (uint8_t *)&buf, 0xCu);
    goto LABEL_68;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "ams_isFraudReportRetryResponse"))
  {
    v57 = +[AMSLogConfig sharedFraudReportConfig];
    if (!v57)
    {
      v57 = +[AMSLogConfig sharedConfig];
    }
    v58 = [v57 OSLogObject];
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      uint64_t v59 = *(void *)(a1 + 48);
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v59;
      _os_log_impl(&dword_18D554000, v58, OS_LOG_TYPE_INFO, "AMSFraudReport: [%{public}@] Handling retry-based fraud score refresh request.", (uint8_t *)&buf, 0xCu);
    }

    v60 = *(void **)(a1 + 64);
    v61 = *(void **)(a1 + 80);
    id v62 = *(id *)(a1 + 40);
    id v63 = v3;
    id v64 = v60;
    id v65 = v61;
    v66 = AMSSetLogKeyIfNeeded();
    v67 = AMSFraudReportGetFSRHeadersForFraudReportResponse(v62, v63, v64, v65);

    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v156 = __AMSFraudReportHandleRetryFraudReportResponse_block_invoke;
    v157 = &unk_1E55A3230;
    id v158 = v66;
    id v68 = v66;
    v12 = [v67 continueWithBlock:&buf];
  }
  else
  {
    int v69 = objc_msgSend(*(id *)(a1 + 40), "ams_isFraudReportCallbackResponse");
    uint64_t v70 = +[AMSLogConfig sharedFraudReportConfig];
    v71 = (void *)v70;
    if (v69)
    {
      if (!v70)
      {
        v71 = +[AMSLogConfig sharedConfig];
      }
      v72 = [v71 OSLogObject];
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        uint64_t v73 = *(void *)(a1 + 48);
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v73;
        _os_log_impl(&dword_18D554000, v72, OS_LOG_TYPE_INFO, "AMSFraudReport: [%{public}@] Handling callback-based fraud score refresh request.", (uint8_t *)&buf, 0xCu);
      }

      v74 = *(void **)(a1 + 40);
      v75 = *(void **)(a1 + 64);
      v76 = *(void **)(a1 + 80);
      id v77 = *(id *)(a1 + 56);
      id v78 = v74;
      id v79 = v75;
      id v80 = v3;
      id v81 = v76;
      v82 = AMSSetLogKeyIfNeeded();
      v67 = AMSFraudReportGetFSRHeadersForFraudReportResponse(v78, v80, v79, v81);

      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v156 = __AMSFraudReportHandleCallbackFraudReportResponse_block_invoke;
      v157 = &unk_1E55A32A8;
      id v158 = v82;
      id v159 = v78;
      id v160 = v77;
      id v161 = v79;
      id v83 = v82;
      id v84 = v78;
      id v85 = v77;
      id v86 = v79;
      v12 = [v67 continueWithBlock:&buf];
    }
    else
    {
      if (!v70)
      {
        v71 = +[AMSLogConfig sharedConfig];
      }
      v94 = [v71 OSLogObject];
      if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
      {
        uint64_t v95 = *(void *)(a1 + 48);
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v95;
        _os_log_impl(&dword_18D554000, v94, OS_LOG_TYPE_INFO, "AMSFraudReport: [%{public}@] Skipping fraud report score refresh.", (uint8_t *)&buf, 0xCu);
      }

      v67 = +[AMSOptional optionalWithNil];
      v12 = +[AMSPromise promiseWithResult:v67];
    }
  }

LABEL_144:
LABEL_145:
  return v12;
}

@end