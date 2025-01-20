@interface HMDRemoteMessageFilter
+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5;
@end

@implementation HMDRemoteMessageFilter

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5
{
  uint64_t v153 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v8 && [v8 isRemote])
  {
    v10 = [a1 requiredPolicyOfClass:objc_opt_class() fromPolicies:v9 error:0];
    if (!v10)
    {
      v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = a1;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        v19 = [v8 identifier];
        *(_DWORD *)buf = 138543618;
        v148 = v18;
        __int16 v149 = 2114;
        v150 = v19;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Missing remote policy for message %{public}@", buf, 0x16u);
      }
      int64_t v14 = -1;
      goto LABEL_125;
    }
    uint64_t v11 = [v8 remoteRestriction];
    id v141 = a1;
    if ([v10 transportRestriction] == -1)
    {
      v13 = 0;
      BOOL v12 = 1;
    }
    else
    {
      BOOL v12 = (unint64_t)(v11 - 1) < 0xFFFFFFFFFFFFFFFELL;
      if ((unint64_t)(v11 - 1) >= 0xFFFFFFFFFFFFFFFELL)
      {
        v20 = (void *)MEMORY[0x230FBD990]();
        id v21 = a1;
        v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = HMFGetLogIdentifier();
          v24 = [v8 transport];
          [v8 identifier];
          v138 = v20;
          v26 = v25 = a5;
          *(_DWORD *)buf = 138543874;
          v148 = v23;
          __int16 v149 = 2112;
          v150 = v24;
          __int16 v151 = 2114;
          v152 = v26;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Invalid transport: %@ for message: %{public}@", buf, 0x20u);

          a5 = v25;
          v20 = v138;

          BOOL v12 = (unint64_t)(v11 - 1) < 0xFFFFFFFFFFFFFFFELL;
        }

        v13 = [MEMORY[0x263F087E8] hmErrorWithCode:-1 description:0 reason:@"Invalid transport" suggestion:0];
        a1 = v141;
      }
      else
      {
        v13 = 0;
      }
      if (([v10 transportRestriction] & v11) == 0)
      {
        v134 = v13;
        v27 = (void *)MEMORY[0x230FBD990]();
        id v28 = a1;
        v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v30 = v139 = v27;
          v31 = [v8 transport];
          [v8 identifier];
          v33 = v32 = a5;
          *(_DWORD *)buf = 138543874;
          v148 = v30;
          __int16 v149 = 2112;
          v150 = v31;
          __int16 v151 = 2114;
          v152 = v33;
          _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Invalid transport: %@ for message: %{public}@", buf, 0x20u);

          a5 = v32;
          v27 = v139;
        }

        v13 = v134;
        if (!v134)
        {
          v13 = [MEMORY[0x263F087E8] hmErrorWithCode:17 description:0 reason:@"Invalid transport" suggestion:0];
        }
        BOOL v12 = 0;
        a1 = v141;
      }
    }
    v137 = objc_msgSend(v9, "hmf_objectPassingTest:", &__block_literal_global_102631);
    if (v11 == 4) {
      +[HMDAppleAccountManager sharedManager];
    }
    else {
    v34 = [v8 remoteSourceDevice];
    }
    v140 = [v34 account];

    if ([v10 requiresSecureMessage])
    {
      if (([v8 isSecureRemote] & 1) == 0)
      {
        v44 = (void *)MEMORY[0x230FBD990]();
        id v45 = a1;
        v46 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = HMFGetLogIdentifier();
          v48 = [v8 identifier];
          *(_DWORD *)buf = 138543618;
          v148 = v47;
          __int16 v149 = 2114;
          v150 = v48;
          _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_ERROR, "%{public}@Message %{public}@ is required to be secure", buf, 0x16u);
        }
        if (v13) {
          goto LABEL_39;
        }
        v41 = (void *)MEMORY[0x263F087E8];
        v42 = @"Message is required to be secure.";
        uint64_t v43 = 17;
        goto LABEL_38;
      }
      if (([v10 allowsAnonymousMessage] & 1) == 0)
      {
        char v35 = [v140 isCurrentAccount];
        if (v11 != 4 && (v35 & 1) == 0 && !v137)
        {
          v36 = (void *)MEMORY[0x230FBD990]();
          id v37 = a1;
          v38 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v39 = HMFGetLogIdentifier();
            v40 = [v8 identifier];
            *(_DWORD *)buf = 138543618;
            v148 = v39;
            __int16 v149 = 2114;
            v150 = v40;
            _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Unable to authenticate message %{public}@, not our account and no user message policy", buf, 0x16u);
          }
          if (v13) {
            goto LABEL_39;
          }
          v41 = (void *)MEMORY[0x263F087E8];
          v42 = @"Unable to authenticate message.";
          uint64_t v43 = 55;
LABEL_38:
          v13 = [v41 hmErrorWithCode:v43 description:0 reason:v42 suggestion:0];
LABEL_39:
          BOOL v12 = 0;
          a1 = v141;
        }
      }
    }
    if (![v10 requiresAccountMessage]) {
      goto LABEL_53;
    }
    if (v140)
    {
      if ([v140 isCurrentAccount]) {
        goto LABEL_53;
      }
      v49 = (void *)MEMORY[0x230FBD990]();
      id v50 = a1;
      v51 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v52 = HMFGetLogIdentifier();
        v53 = [v8 identifier];
        [v140 shortDescription];
        v135 = v13;
        v55 = v54 = a5;
        *(_DWORD *)buf = 138543874;
        v148 = v52;
        __int16 v149 = 2114;
        v150 = v53;
        __int16 v151 = 2112;
        v152 = v55;
        _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@Message %{public}@ is required to be from the current account: %@", buf, 0x20u);

        a5 = v54;
        v13 = v135;
      }
      if (v13)
      {
LABEL_52:
        BOOL v12 = 0;
        a1 = v141;
LABEL_53:
        if (![v10 roles])
        {
LABEL_116:
          if (a5)
          {
            if (v12) {
              v125 = 0;
            }
            else {
              v125 = v13;
            }
            *a5 = v125;
          }
          if (v12) {
            int64_t v14 = 1;
          }
          else {
            int64_t v14 = -1;
          }

LABEL_125:
          goto LABEL_126;
        }
        v64 = [v8 remoteSourceDevice];
        uint64_t v136 = (uint64_t)v13;
        BOOL v133 = v12;
        if (([v10 roles] & 1) == 0)
        {
          uint64_t v132 = 0;
          goto LABEL_67;
        }
        if (v64)
        {
          v65 = a5;
          v66 = +[HMDCompanionManager sharedManager];
          v67 = [v66 companion];
          int v68 = [v64 isRelatedToDevice:v67];

          if (!v68)
          {
            uint64_t v132 = 0;
            a5 = v65;
            a1 = v141;
            BOOL v12 = v133;
            goto LABEL_67;
          }
          v69 = (void *)MEMORY[0x230FBD990]();
          id v70 = v141;
          v71 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
          {
            v72 = HMFGetLogIdentifier();
            v73 = [v8 identifier];
            *(_DWORD *)buf = 138543618;
            v148 = v72;
            __int16 v149 = 2114;
            v150 = v73;
            uint64_t v132 = 1;
            _os_log_impl(&dword_22F52A000, v71, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ is from companion", buf, 0x16u);
          }
          else
          {
            uint64_t v132 = 1;
          }
          a5 = v65;
          a1 = v141;
          BOOL v12 = v133;
        }
        else
        {
          v69 = (void *)MEMORY[0x230FBD990]();
          id v74 = a1;
          v71 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
          {
            v75 = HMFGetLogIdentifier();
            v76 = [v8 identifier];
            *(_DWORD *)buf = 138543618;
            v148 = v75;
            __int16 v149 = 2114;
            v150 = v76;
            _os_log_impl(&dword_22F52A000, v71, OS_LOG_TYPE_DEBUG, "%{public}@Unable to determine the sender of message %{public}@", buf, 0x16u);

            BOOL v12 = v133;
          }
          uint64_t v132 = 0;
        }

        v13 = (void *)v136;
LABEL_67:
        if (([v10 roles] & 2) != 0)
        {
          if (v64)
          {
            long long v144 = 0u;
            long long v145 = 0u;
            long long v142 = 0u;
            long long v143 = 0u;
            v77 = +[HMDWatchManager sharedManager];
            v78 = [v77 watches];

            uint64_t v79 = [v78 countByEnumeratingWithState:&v142 objects:v146 count:16];
            if (v79)
            {
              uint64_t v80 = v79;
              v127 = a5;
              uint64_t v81 = *(void *)v143;
              while (2)
              {
                for (uint64_t i = 0; i != v80; ++i)
                {
                  if (*(void *)v143 != v81) {
                    objc_enumerationMutation(v78);
                  }
                  if ([v64 isRelatedToDevice:*(void *)(*((void *)&v142 + 1) + 8 * i)])
                  {
                    v83 = (void *)MEMORY[0x230FBD990]();
                    id v84 = a1;
                    v85 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
                    {
                      v86 = HMFGetLogIdentifier();
                      v87 = [v8 identifier];
                      *(_DWORD *)buf = 138543618;
                      v148 = v86;
                      __int16 v149 = 2114;
                      v150 = v87;
                      _os_log_impl(&dword_22F52A000, v85, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ is from watch", buf, 0x16u);
                    }
                    a5 = v127;
                    ++v132;
                    a1 = v141;
                    goto LABEL_81;
                  }
                }
                uint64_t v80 = [v78 countByEnumeratingWithState:&v142 objects:v146 count:16];
                if (v80) {
                  continue;
                }
                break;
              }
              a5 = v127;
            }
LABEL_81:

            v13 = (void *)v136;
            BOOL v12 = v133;
          }
          else
          {
            v88 = (void *)MEMORY[0x230FBD990]();
            id v89 = a1;
            v90 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
            {
              v91 = HMFGetLogIdentifier();
              [v8 identifier];
              v93 = v92 = a5;
              *(_DWORD *)buf = 138543618;
              v148 = v91;
              __int16 v149 = 2114;
              v150 = v93;
              _os_log_impl(&dword_22F52A000, v90, OS_LOG_TYPE_DEBUG, "%{public}@Unable to determine the sender of message %{public}@", buf, 0x16u);

              a5 = v92;
              v13 = (void *)v136;

              BOOL v12 = v133;
            }

            a1 = v141;
          }
        }
        if (([v10 roles] & 4) != 0)
        {
          v94 = [v137 home];
          v95 = v94;
          if (v94)
          {
            if ([v94 isCurrentDeviceAvailableResident])
            {
              v128 = a5;
              v96 = (void *)MEMORY[0x230FBD990]();
              id v97 = a1;
              v98 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
              {
                v99 = HMFGetLogIdentifier();
                v100 = [v8 identifier];
                *(_DWORD *)buf = 138543618;
                v148 = v99;
                __int16 v149 = 2114;
                v150 = v100;
                _os_log_impl(&dword_22F52A000, v98, OS_LOG_TYPE_DEBUG, "%{public}@Message %{public}@ is targeting resident", buf, 0x16u);

                BOOL v12 = v133;
              }

              a5 = v128;
              v13 = (void *)v136;
LABEL_115:

              goto LABEL_116;
            }
          }
          else
          {
            v101 = (void *)MEMORY[0x230FBD990]();
            id v102 = a1;
            v103 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v103, OS_LOG_TYPE_DEBUG))
            {
              v104 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v148 = v104;
              _os_log_impl(&dword_22F52A000, v103, OS_LOG_TYPE_DEBUG, "%{public}@Unable to determine the home of the handler", buf, 0xCu);

              BOOL v12 = v133;
            }

            a1 = v141;
          }

          v13 = (void *)v136;
        }
        if (([v10 roles] & 8) != 0)
        {
          v105 = [v137 home];
          v106 = v105;
          if (v105)
          {
            int v107 = [v105 isCurrentDevicePrimaryResident];
            v108 = (void *)MEMORY[0x230FBD990]();
            id v109 = a1;
            v110 = HMFGetOSLogHandle();
            v111 = v110;
            if (v107)
            {
              if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
              {
                v112 = HMFGetLogIdentifier();
                [v8 identifier];
                v113 = v129 = v108;
                *(_DWORD *)buf = 138543618;
                v148 = v112;
                __int16 v149 = 2114;
                v150 = v113;
                _os_log_impl(&dword_22F52A000, v111, OS_LOG_TYPE_DEBUG, "%{public}@Message %{public}@ is targeting the primary resident", buf, 0x16u);

                v108 = v129;
              }

              v13 = (void *)v136;
              BOOL v12 = v133;
              goto LABEL_115;
            }
            if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
            {
              v118 = HMFGetLogIdentifier();
              [v8 identifier];
              v119 = v130 = v108;
              *(_DWORD *)buf = 138543618;
              v148 = v118;
              __int16 v149 = 2114;
              v150 = v119;
              _os_log_impl(&dword_22F52A000, v111, OS_LOG_TYPE_ERROR, "%{public}@Message %{public}@ can only be handled by the primary resident", buf, 0x16u);

              v108 = v130;
            }

            BOOL v12 = v133;
            if (!v136)
            {
              uint64_t v136 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:3202];
            }
          }
          else
          {
            v114 = (void *)MEMORY[0x230FBD990]();
            id v115 = a1;
            v116 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
            {
              v117 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v148 = v117;
              _os_log_impl(&dword_22F52A000, v116, OS_LOG_TYPE_DEBUG, "%{public}@Unable to determine the home of the handler", buf, 0xCu);

              BOOL v12 = v133;
            }
          }

          v13 = (void *)v136;
          a1 = v141;
        }
        if (!v132)
        {
          v131 = a5;
          v120 = (void *)MEMORY[0x230FBD990]();
          id v121 = a1;
          v122 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
          {
            v123 = HMFGetLogIdentifier();
            v124 = [v8 identifier];
            *(_DWORD *)buf = 138543618;
            v148 = v123;
            __int16 v149 = 2114;
            v150 = v124;
            _os_log_impl(&dword_22F52A000, v122, OS_LOG_TYPE_ERROR, "%{public}@Failed to satisfy the role(s) for message %{public}@", buf, 0x16u);
          }
          if (!v13)
          {
            v13 = [MEMORY[0x263F087E8] hmErrorWithCode:10 description:0 reason:@"Failed to satisfy the role(s)" suggestion:0];
          }
          BOOL v12 = 0;
          a5 = v131;
        }
        goto LABEL_115;
      }
      v56 = (void *)MEMORY[0x263F087E8];
      v57 = @"Message is required to be from the current account";
      uint64_t v58 = 17;
    }
    else
    {
      v59 = (void *)MEMORY[0x230FBD990]();
      id v60 = a1;
      v61 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        v62 = HMFGetLogIdentifier();
        v63 = [v8 identifier];
        *(_DWORD *)buf = 138543618;
        v148 = v62;
        __int16 v149 = 2114;
        v150 = v63;
        _os_log_impl(&dword_22F52A000, v61, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine the account of the message %{public}@", buf, 0x16u);
      }
      if (v13) {
        goto LABEL_52;
      }
      v56 = (void *)MEMORY[0x263F087E8];
      v57 = @"Unable to determine the account of the message";
      uint64_t v58 = 2;
    }
    v13 = [v56 hmErrorWithCode:v58 description:0 reason:v57 suggestion:0];
    goto LABEL_52;
  }
  int64_t v14 = 0;
LABEL_126:

  return v14;
}

uint64_t __59__HMDRemoteMessageFilter_filterMessage_withPolicies_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end