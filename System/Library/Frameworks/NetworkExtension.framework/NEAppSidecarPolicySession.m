@interface NEAppSidecarPolicySession
+ (id)connectionIdentifier;
- (BOOL)installPolicies;
- (BOOL)uninstallPolicies;
- (NEAppSidecarPolicySession)init;
@end

@implementation NEAppSidecarPolicySession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyIDList, 0);

  objc_storeStrong((id *)&self->_policySession, 0);
}

- (BOOL)uninstallPolicies
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!self || !objc_getProperty(self, a2, 8, 1))
  {
    v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315138;
      v9 = "-[NEAppSidecarPolicySession uninstallPolicies]";
      _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "%s called with null self.policySession", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_8;
  }
  BOOL v4 = 1;
  objc_msgSend(objc_getProperty(self, v3, 8, 1), "removeAllPolicies");
  if ((objc_msgSend(objc_getProperty(self, v5, 8, 1), "apply") & 1) == 0)
  {
    v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "Failed to uninstall Sidecar policies", (uint8_t *)&v8, 2u);
    }
LABEL_8:

    return 0;
  }
  return v4;
}

- (BOOL)installPolicies
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  if (self && objc_getProperty(self, a2, 8, 1))
  {
    selfa = self;
    v3 = +[NEProcessInfo copyUUIDsForExecutable:@"/usr/libexec/rapportd"];
    if (v3)
    {
      BOOL v4 = +[NEProcessInfo copyUUIDsForExecutable:@"/usr/libexec/SidecarRelay"];
      if (v4)
      {
        SEL v5 = +[NEProcessInfo copyDNSUUIDs];
        v6 = v5;
        if (v5)
        {
          v128 = v5;
          v125 = v3;
          v126 = v4;
          long long v147 = 0u;
          long long v148 = 0u;
          long long v145 = 0u;
          long long v146 = 0u;
          obj = v3;
          uint64_t v7 = [obj countByEnumeratingWithState:&v145 objects:v151 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            LODWORD(v9) = 0;
            uint64_t v10 = 0;
            v11 = 0;
            id v133 = *(id *)v146;
            while (2)
            {
              uint64_t v12 = 0;
              uint64_t v13 = v9;
              do
              {
                v14 = v11;
                v15 = v10;
                if (*(id *)v146 != v133) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v16 = *(void *)(*((void *)&v145 + 1) + 8 * v12);
                id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                v18 = +[NEPolicyCondition effectiveApplication:v16];
                [v17 addObject:v18];

                v19 = +[NEPolicyCondition allInterfaces];
                [v17 addObject:v19];

                v11 = +[NEPolicyResult passWithFlags:2];

                uint64_t v10 = [[NEPolicy alloc] initWithOrder:v13 + v12 result:v11 conditions:v17];
                uint64_t v21 = objc_msgSend(objc_getProperty(selfa, v20, 8, 1), "addPolicy:", v10);
                int is_debug_logging_enabled = nelog_is_debug_logging_enabled();
                v23 = ne_log_obj();
                v24 = v23;
                if (!v21)
                {
                  BOOL v32 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
                  if (is_debug_logging_enabled)
                  {
                    v3 = v125;
                    BOOL v4 = v126;
                    v6 = v128;
                    if (v32)
                    {
                      *(_DWORD *)buf = 138412290;
                      v153 = (__CFString *)v10;
                      _os_log_error_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_ERROR, "Failed to add policy: %@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    v3 = v125;
                    BOOL v4 = v126;
                    v6 = v128;
                    if (v32)
                    {
                      v120 = [(NEPolicy *)v10 descriptionWithIndent:0 options:2];
                      *(_DWORD *)buf = 138412290;
                      v153 = v120;
                      _os_log_error_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_ERROR, "Failed to add policy: %@", buf, 0xCu);
                    }
                  }

                  v113 = obj;
LABEL_80:

                  goto LABEL_81;
                }
                if (is_debug_logging_enabled)
                {
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v153 = (__CFString *)v10;
                    _os_log_debug_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_DEBUG, "Added policy: %@", buf, 0xCu);
                  }
                }
                else if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  v25 = [(NEPolicy *)v10 descriptionWithIndent:0 options:2];
                  *(_DWORD *)buf = 138412290;
                  v153 = v25;
                  _os_log_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_INFO, "Added policy: %@", buf, 0xCu);
                }
                id Property = objc_getProperty(selfa, v26, 16, 1);
                v28 = NSNumber;
                id v29 = Property;
                v30 = [v28 numberWithUnsignedInteger:v21];
                [v29 addObject:v30];

                ++v12;
              }
              while (v8 != v12);
              uint64_t v9 = (v13 + v12);
              uint64_t v8 = [obj countByEnumeratingWithState:&v145 objects:v151 count:16];
              if (v8) {
                continue;
              }
              break;
            }
          }
          else
          {
            uint64_t v9 = 0;
            uint64_t v10 = 0;
            v11 = 0;
          }

          long long v143 = 0u;
          long long v144 = 0u;
          long long v141 = 0u;
          long long v142 = 0u;
          v127 = v128;
          uint64_t v130 = [v127 countByEnumeratingWithState:&v141 objects:v150 count:16];
          if (v130)
          {
            uint64_t obja = *(void *)v142;
            while (2)
            {
              for (uint64_t i = 0; i != v130; ++i)
              {
                if (*(void *)v142 != obja) {
                  objc_enumerationMutation(v127);
                }
                uint64_t v34 = *(void *)(*((void *)&v141 + 1) + 8 * i);
                id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                v36 = +[NEPolicyCondition effectiveApplication:v34];
                [v35 addObject:v36];

                v37 = +[NEPolicyCondition packetFilterTags:1];
                [v35 addObject:v37];

                v38 = +[NEPolicyCondition allInterfaces];
                [v35 addObject:v38];

                v39 = +[NEPolicyResult passWithFlags:2];

                id v134 = v35;
                v40 = [[NEPolicy alloc] initWithOrder:v9 result:v39 conditions:v35];

                uint64_t v42 = objc_msgSend(objc_getProperty(selfa, v41, 8, 1), "addPolicy:", v40);
                int v43 = nelog_is_debug_logging_enabled();
                v44 = ne_log_obj();
                v45 = v44;
                if (!v42)
                {
                  BOOL v116 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
                  if (v43)
                  {
                    v3 = v125;
                    BOOL v4 = v126;
                    v6 = v128;
                    if (v116)
                    {
                      *(_DWORD *)buf = 138412290;
                      v153 = (__CFString *)v40;
                      _os_log_error_impl(&dword_19DDAF000, v45, OS_LOG_TYPE_ERROR, "Failed to add policy: %@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    v3 = v125;
                    BOOL v4 = v126;
                    v6 = v128;
                    if (v116)
                    {
                      v122 = [(NEPolicy *)v40 descriptionWithIndent:0 options:2];
                      *(_DWORD *)buf = 138412290;
                      v153 = v122;
                      _os_log_error_impl(&dword_19DDAF000, v45, OS_LOG_TYPE_ERROR, "Failed to add policy: %@", buf, 0xCu);
                    }
                  }
                  v58 = v40;
                  v56 = v39;
                  goto LABEL_110;
                }
                if (v43)
                {
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v153 = (__CFString *)v40;
                    _os_log_debug_impl(&dword_19DDAF000, v45, OS_LOG_TYPE_DEBUG, "Added policy: %@", buf, 0xCu);
                  }
                }
                else if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                {
                  v46 = [(NEPolicy *)v40 descriptionWithIndent:0 options:2];
                  *(_DWORD *)buf = 138412290;
                  v153 = v46;
                  _os_log_impl(&dword_19DDAF000, v45, OS_LOG_TYPE_INFO, "Added policy: %@", buf, 0xCu);
                }
                id v48 = objc_getProperty(selfa, v47, 16, 1);
                v49 = NSNumber;
                id v50 = v48;
                v51 = [v49 numberWithUnsignedInteger:v42];
                [v50 addObject:v51];

                v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                v52 = +[NEPolicyCondition effectiveApplication:v34];
                [v45 addObject:v52];

                v53 = [MEMORY[0x1E4F38BC8] endpointWithHostname:@"224.0.0.251" port:@"5353"];
                v54 = +[NEPolicyCondition remoteAddress:v53 prefix:0];
                [v45 addObject:v54];

                v55 = +[NEPolicyCondition allInterfaces];
                [v45 addObject:v55];

                v56 = +[NEPolicyResult passWithFlags:2];

                int v129 = v9;
                int v57 = v9 + 1;
                v58 = [[NEPolicy alloc] initWithOrder:(v9 + 1) result:v56 conditions:v45];

                uint64_t v60 = objc_msgSend(objc_getProperty(selfa, v59, 8, 1), "addPolicy:", v58);
                int v61 = nelog_is_debug_logging_enabled();
                v62 = ne_log_obj();
                v63 = v62;
                if (!v60)
                {
                  BOOL v117 = os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);
                  if (v61)
                  {
                    v3 = v125;
                    BOOL v4 = v126;
                    v6 = v128;
                    v118 = v134;
                    if (v117)
                    {
                      *(_DWORD *)buf = 138412290;
                      v153 = (__CFString *)v58;
                      _os_log_error_impl(&dword_19DDAF000, v63, OS_LOG_TYPE_ERROR, "Failed to add policy: %@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    v3 = v125;
                    BOOL v4 = v126;
                    v6 = v128;
                    v118 = v134;
                    if (v117)
                    {
                      v123 = [(NEPolicy *)v58 descriptionWithIndent:0 options:2];
                      *(_DWORD *)buf = 138412290;
                      v153 = v123;
                      _os_log_error_impl(&dword_19DDAF000, v63, OS_LOG_TYPE_ERROR, "Failed to add policy: %@", buf, 0xCu);
                    }
                  }

                  goto LABEL_111;
                }
                if (v61)
                {
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v153 = (__CFString *)v58;
                    _os_log_debug_impl(&dword_19DDAF000, v63, OS_LOG_TYPE_DEBUG, "Added policy: %@", buf, 0xCu);
                  }
                }
                else if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                {
                  v64 = [(NEPolicy *)v58 descriptionWithIndent:0 options:2];
                  *(_DWORD *)buf = 138412290;
                  v153 = v64;
                  _os_log_impl(&dword_19DDAF000, v63, OS_LOG_TYPE_INFO, "Added policy: %@", buf, 0xCu);
                }
                id v66 = objc_getProperty(selfa, v65, 16, 1);
                v67 = NSNumber;
                id v68 = v66;
                v69 = [v67 numberWithUnsignedInteger:v60];
                [v68 addObject:v69];

                id v70 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                v71 = +[NEPolicyCondition effectiveApplication:v34];
                [v70 addObject:v71];

                v72 = [MEMORY[0x1E4F38BC8] endpointWithHostname:@"FF02::FB" port:@"5353"];
                v73 = +[NEPolicyCondition remoteAddress:v72 prefix:0];
                [v70 addObject:v73];

                v74 = +[NEPolicyCondition allInterfaces];
                [v70 addObject:v74];

                v11 = +[NEPolicyResult passWithFlags:2];

                uint64_t v75 = (v57 + 1);
                uint64_t v10 = [[NEPolicy alloc] initWithOrder:v75 result:v11 conditions:v70];

                uint64_t v77 = objc_msgSend(objc_getProperty(selfa, v76, 8, 1), "addPolicy:", v10);
                int v78 = nelog_is_debug_logging_enabled();
                v79 = ne_log_obj();
                v80 = v79;
                if (!v77)
                {
                  BOOL v119 = os_log_type_enabled(v79, OS_LOG_TYPE_ERROR);
                  if (v78)
                  {
                    v3 = v125;
                    BOOL v4 = v126;
                    v6 = v128;
                    if (v119)
                    {
                      *(_DWORD *)buf = 138412290;
                      v153 = (__CFString *)v10;
                      _os_log_error_impl(&dword_19DDAF000, v80, OS_LOG_TYPE_ERROR, "Failed to add policy: %@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    v3 = v125;
                    BOOL v4 = v126;
                    v6 = v128;
                    if (v119)
                    {
                      v124 = [(NEPolicy *)v10 descriptionWithIndent:0 options:2];
                      *(_DWORD *)buf = 138412290;
                      v153 = v124;
                      _os_log_error_impl(&dword_19DDAF000, v80, OS_LOG_TYPE_ERROR, "Failed to add policy: %@", buf, 0xCu);
                    }
                  }

                  v58 = v10;
                  v56 = v11;
LABEL_110:
                  v118 = v134;
LABEL_111:

                  BOOL v31 = 0;
                  v11 = v56;
                  goto LABEL_82;
                }
                if (v78)
                {
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v153 = (__CFString *)v10;
                    _os_log_debug_impl(&dword_19DDAF000, v80, OS_LOG_TYPE_DEBUG, "Added policy: %@", buf, 0xCu);
                  }
                }
                else if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
                {
                  v81 = [(NEPolicy *)v10 descriptionWithIndent:0 options:2];
                  *(_DWORD *)buf = 138412290;
                  v153 = v81;
                  _os_log_impl(&dword_19DDAF000, v80, OS_LOG_TYPE_INFO, "Added policy: %@", buf, 0xCu);
                }
                id v83 = objc_getProperty(selfa, v82, 16, 1);
                v84 = NSNumber;
                id v85 = v83;
                v86 = [v84 numberWithUnsignedInteger:v77];
                [v85 addObject:v86];

                uint64_t v9 = (v75 + 1);
              }
              uint64_t v9 = (v129 + 3);
              uint64_t v130 = [v127 countByEnumeratingWithState:&v141 objects:v150 count:16];
              if (v130) {
                continue;
              }
              break;
            }
          }

          long long v139 = 0u;
          long long v140 = 0u;
          long long v137 = 0u;
          long long v138 = 0u;
          v135 = v126;
          uint64_t v87 = [v135 countByEnumeratingWithState:&v137 objects:v149 count:16];
          if (v87)
          {
            uint64_t v88 = v87;
            uint64_t v89 = *(void *)v138;
            while (2)
            {
              uint64_t v90 = 0;
              uint64_t v91 = v9;
              do
              {
                v92 = v11;
                v93 = v10;
                if (*(void *)v138 != v89) {
                  objc_enumerationMutation(v135);
                }
                uint64_t v94 = *(void *)(*((void *)&v137 + 1) + 8 * v90);
                id v95 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                v96 = +[NEPolicyCondition effectiveApplication:v94];
                [v95 addObject:v96];

                v97 = +[NEPolicyCondition allInterfaces];
                [v95 addObject:v97];

                v11 = +[NEPolicyResult passWithFlags:2];

                uint64_t v10 = [[NEPolicy alloc] initWithOrder:v91 + v90 result:v11 conditions:v95];
                uint64_t v99 = objc_msgSend(objc_getProperty(selfa, v98, 8, 1), "addPolicy:", v10);
                int v100 = nelog_is_debug_logging_enabled();
                v101 = ne_log_obj();
                v102 = v101;
                if (!v99)
                {
                  BOOL v115 = os_log_type_enabled(v101, OS_LOG_TYPE_ERROR);
                  if (v100)
                  {
                    v3 = v125;
                    BOOL v4 = v126;
                    v6 = v128;
                    if (v115)
                    {
                      *(_DWORD *)buf = 138412290;
                      v153 = (__CFString *)v10;
                      _os_log_error_impl(&dword_19DDAF000, v102, OS_LOG_TYPE_ERROR, "Failed to add policy: %@", buf, 0xCu);
                    }
                  }
                  else
                  {
                    v3 = v125;
                    BOOL v4 = v126;
                    v6 = v128;
                    if (v115)
                    {
                      v121 = [(NEPolicy *)v10 descriptionWithIndent:0 options:2];
                      *(_DWORD *)buf = 138412290;
                      v153 = v121;
                      _os_log_error_impl(&dword_19DDAF000, v102, OS_LOG_TYPE_ERROR, "Failed to add policy: %@", buf, 0xCu);
                    }
                  }

                  v113 = v135;
                  goto LABEL_80;
                }
                if (v100)
                {
                  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v153 = (__CFString *)v10;
                    _os_log_debug_impl(&dword_19DDAF000, v102, OS_LOG_TYPE_DEBUG, "Added policy: %@", buf, 0xCu);
                  }
                }
                else if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
                {
                  v103 = [(NEPolicy *)v10 descriptionWithIndent:0 options:2];
                  *(_DWORD *)buf = 138412290;
                  v153 = v103;
                  _os_log_impl(&dword_19DDAF000, v102, OS_LOG_TYPE_INFO, "Added policy: %@", buf, 0xCu);
                }
                id v105 = objc_getProperty(selfa, v104, 16, 1);
                v106 = NSNumber;
                id v107 = v105;
                v108 = [v106 numberWithUnsignedInteger:v99];
                [v107 addObject:v108];

                ++v90;
              }
              while (v88 != v90);
              LODWORD(v9) = v91 + v90;
              uint64_t v88 = [v135 countByEnumeratingWithState:&v137 objects:v149 count:16];
              if (v88) {
                continue;
              }
              break;
            }
          }

          char v110 = objc_msgSend(objc_getProperty(selfa, v109, 8, 1), "apply");
          v111 = ne_log_obj();
          v112 = v111;
          if (v110)
          {
            v3 = v125;
            v6 = v128;
            if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19DDAF000, v112, OS_LOG_TYPE_INFO, "Sidecar policies install successful", buf, 2u);
            }

            BOOL v31 = 1;
          }
          else
          {
            v3 = v125;
            v6 = v128;
            if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_19DDAF000, v112, OS_LOG_TYPE_ERROR, "Sidecar policies install failed", buf, 2u);
            }

            BOOL v31 = 0;
          }
          BOOL v4 = v126;
        }
        else
        {
          v11 = ne_log_obj();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_ERROR, "failed to get DNS UUID", buf, 2u);
          }
LABEL_81:
          BOOL v31 = 0;
        }
LABEL_82:
      }
      else
      {
        v6 = ne_log_obj();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v153 = @"/usr/libexec/SidecarRelay";
          _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "failed to get sidecarrelay UUID %@", buf, 0xCu);
        }
        BOOL v31 = 0;
      }
    }
    else
    {
      BOOL v4 = ne_log_obj();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v153 = @"/usr/libexec/rapportd";
        _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "failed to get rapportd UUID %@", buf, 0xCu);
      }
      BOOL v31 = 0;
    }
  }
  else
  {
    v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v153 = (__CFString *)"-[NEAppSidecarPolicySession installPolicies]";
      _os_log_fault_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_FAULT, "%s called with null self.policySession", buf, 0xCu);
    }
    BOOL v31 = 0;
  }

  return v31;
}

- (NEAppSidecarPolicySession)init
{
  v12.receiver = self;
  v12.super_class = (Class)NEAppSidecarPolicySession;
  v2 = [(NEAppSidecarPolicySession *)&v12 init];
  if (!v2) {
    goto LABEL_4;
  }
  v3 = [[NEPolicySession alloc] initFromPrivilegedProcess];
  policySession = v2->_policySession;
  v2->_policySession = v3;

  SEL v5 = v2->_policySession;
  if (v5)
  {
    [(NEPolicySession *)v5 lockSessionToCurrentProcess];
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    policyIDList = v2->_policyIDList;
    v2->_policyIDList = v6;

LABEL_4:
    uint64_t v8 = v2;
    goto LABEL_8;
  }
  uint64_t v9 = ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "failed to create policy session", v11, 2u);
  }

  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

+ (id)connectionIdentifier
{
  return @"AppleSidecar";
}

@end