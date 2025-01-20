@interface HMDRemoteMessageFilter
+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5;
@end

@implementation HMDRemoteMessageFilter

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8 && [v8 isRemote])
  {
    v10 = [a1 requiredPolicyOfClass:objc_opt_class() fromPolicies:v9 error:0];
    if (!v10)
    {
      v15 = (void *)MEMORY[0x1D9452090]();
      id v16 = a1;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        v19 = [v8 identifier];
        *(_DWORD *)buf = 138543618;
        v129 = v18;
        __int16 v130 = 2114;
        v131 = v19;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Missing remote policy for message %{public}@", buf, 0x16u);
      }
      int64_t v14 = -1;
      goto LABEL_112;
    }
    uint64_t v11 = [v8 remoteRestriction];
    v115 = a5;
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
        v20 = (void *)MEMORY[0x1D9452090]();
        id v21 = a1;
        v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = v120 = v20;
          v24 = [v8 transport];
          v25 = [v8 identifier];
          *(_DWORD *)buf = 138543874;
          v129 = v23;
          __int16 v130 = 2112;
          v131 = v24;
          __int16 v132 = 2114;
          v133 = v25;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Invalid transport: %@ for message: %{public}@", buf, 0x20u);

          a5 = v115;
          BOOL v12 = (unint64_t)(v11 - 1) < 0xFFFFFFFFFFFFFFFELL;

          v20 = v120;
        }

        v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1 description:0 reason:@"Invalid transport" suggestion:0];
      }
      else
      {
        v13 = 0;
      }
      if (([v10 transportRestriction] & v11) == 0)
      {
        v116 = v13;
        v26 = (void *)MEMORY[0x1D9452090]();
        id v27 = a1;
        v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = v121 = v26;
          v30 = [v8 transport];
          v31 = [v8 identifier];
          *(_DWORD *)buf = 138543874;
          v129 = v29;
          __int16 v130 = 2112;
          v131 = v30;
          __int16 v132 = 2114;
          v133 = v31;
          _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Invalid transport: %@ for message: %{public}@", buf, 0x20u);

          a5 = v115;
          v26 = v121;
        }

        v13 = v116;
        if (!v116)
        {
          v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:17 description:0 reason:@"Invalid transport" suggestion:0];
        }
        BOOL v12 = 0;
      }
    }
    v119 = objc_msgSend(v9, "hmf_objectPassingTest:", &__block_literal_global_68800);
    if (v11 == 4) {
      +[HMDAppleAccountManager sharedManager];
    }
    else {
    v32 = [v8 remoteSourceDevice];
    }
    v33 = [v32 account];

    v122 = v33;
    if ([v10 requiresSecureMessage])
    {
      if (([v8 isSecureRemote] & 1) == 0)
      {
        v43 = (void *)MEMORY[0x1D9452090]();
        id v44 = a1;
        v45 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v46 = HMFGetLogIdentifier();
          v47 = [v8 identifier];
          *(_DWORD *)buf = 138543618;
          v129 = v46;
          __int16 v130 = 2114;
          v131 = v47;
          _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_ERROR, "%{public}@Message %{public}@ is required to be secure", buf, 0x16u);

          a5 = v115;
        }

        if (v13) {
          goto LABEL_39;
        }
        v40 = (void *)MEMORY[0x1E4F28C58];
        v41 = @"Message is required to be secure.";
        uint64_t v42 = 17;
        goto LABEL_38;
      }
      if (([v10 allowsAnonymousMessage] & 1) == 0)
      {
        char v34 = [v33 isCurrentAccount];
        if (v11 != 4 && (v34 & 1) == 0 && !v119)
        {
          v35 = (void *)MEMORY[0x1D9452090]();
          id v36 = a1;
          v37 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v38 = HMFGetLogIdentifier();
            v39 = [v8 identifier];
            *(_DWORD *)buf = 138543618;
            v129 = v38;
            __int16 v130 = 2114;
            v131 = v39;
            _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@Unable to authenticate message %{public}@, not our account and no user message policy", buf, 0x16u);

            a5 = v115;
          }

          if (v13) {
            goto LABEL_39;
          }
          v40 = (void *)MEMORY[0x1E4F28C58];
          v41 = @"Unable to authenticate message.";
          uint64_t v42 = 55;
LABEL_38:
          v13 = [v40 hmErrorWithCode:v42 description:0 reason:v41 suggestion:0];
LABEL_39:
          BOOL v12 = 0;
          v33 = v122;
        }
      }
    }
    if ([v10 requiresAccountMessage])
    {
      if (v33)
      {
        if (([v33 isCurrentAccount] & 1) == 0)
        {
          v117 = v13;
          v48 = (void *)MEMORY[0x1D9452090]();
          id v49 = a1;
          v50 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            v51 = HMFGetLogIdentifier();
            v52 = [v8 identifier];
            v53 = [v33 shortDescription];
            *(_DWORD *)buf = 138543874;
            v129 = v51;
            __int16 v130 = 2114;
            v131 = v52;
            __int16 v132 = 2112;
            v133 = v53;
            _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_ERROR, "%{public}@Message %{public}@ is required to be from the current account: %@", buf, 0x20u);

            a5 = v115;
            v33 = v122;
          }
          v13 = v117;
          if (!v117)
          {
            v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:17 description:0 reason:@"Message is required to be from the current account" suggestion:0];
          }
          BOOL v12 = 0;
        }
      }
      else
      {
        v54 = (void *)MEMORY[0x1D9452090]();
        id v55 = a1;
        v56 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          v57 = HMFGetLogIdentifier();
          v58 = [v8 identifier];
          *(_DWORD *)buf = 138543618;
          v129 = v57;
          __int16 v130 = 2114;
          v131 = v58;
          _os_log_impl(&dword_1D49D5000, v56, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine the account of the message %{public}@", buf, 0x16u);

          a5 = v115;
        }

        if (!v13)
        {
          v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:0 reason:@"Unable to determine the account of the message" suggestion:0];
        }
        BOOL v12 = 0;
        v33 = v122;
      }
    }
    if (![v10 roles]) {
      goto LABEL_103;
    }
    v59 = [v8 remoteSourceDevice];
    v118 = v13;
    if (([v10 roles] & 1) == 0)
    {
      uint64_t v60 = 0;
      goto LABEL_66;
    }
    if (v59)
    {
      BOOL v110 = v12;
      v61 = +[HMDCompanionManager sharedManager];
      v62 = [v61 companion];
      int v63 = [v59 isRelatedToDevice:v62];

      if (!v63)
      {
        uint64_t v60 = 0;
        a5 = v115;
        BOOL v12 = v110;
LABEL_66:
        if (([v10 roles] & 2) != 0)
        {
          contexta = (void *)v60;
          if (v59)
          {
            BOOL v111 = v12;
            long long v125 = 0u;
            long long v126 = 0u;
            long long v123 = 0u;
            long long v124 = 0u;
            v72 = +[HMDWatchManager sharedManager];
            v73 = [v72 watches];

            uint64_t v74 = [v73 countByEnumeratingWithState:&v123 objects:v127 count:16];
            if (v74)
            {
              uint64_t v75 = v74;
              uint64_t v76 = *(void *)v124;
              while (2)
              {
                for (uint64_t i = 0; i != v75; ++i)
                {
                  if (*(void *)v124 != v76) {
                    objc_enumerationMutation(v73);
                  }
                  if ([v59 isRelatedToDevice:*(void *)(*((void *)&v123 + 1) + 8 * i)])
                  {
                    v78 = (void *)MEMORY[0x1D9452090]();
                    id v79 = a1;
                    v80 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      v81 = v105 = v78;
                      v82 = [v8 identifier];
                      *(_DWORD *)buf = 138543618;
                      v129 = v81;
                      __int16 v130 = 2114;
                      v131 = v82;
                      _os_log_impl(&dword_1D49D5000, v80, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ is from watch", buf, 0x16u);

                      v78 = v105;
                    }

                    uint64_t v60 = (uint64_t)contexta + 1;
                    a5 = v115;
                    v33 = v122;
                    goto LABEL_81;
                  }
                }
                uint64_t v75 = [v73 countByEnumeratingWithState:&v123 objects:v127 count:16];
                if (v75) {
                  continue;
                }
                break;
              }
              a5 = v115;
            }
            uint64_t v60 = (uint64_t)contexta;
LABEL_81:

            v13 = v118;
            BOOL v12 = v111;
          }
          else
          {
            v83 = (void *)MEMORY[0x1D9452090]();
            id v84 = a1;
            v85 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v86 = BOOL v112 = v12;
              v87 = [v8 identifier];
              *(_DWORD *)buf = 138543618;
              v129 = v86;
              __int16 v130 = 2114;
              v131 = v87;
              _os_log_impl(&dword_1D49D5000, v85, OS_LOG_TYPE_DEBUG, "%{public}@Unable to determine the sender of message %{public}@", buf, 0x16u);

              a5 = v115;
              BOOL v12 = v112;
            }

            v13 = v118;
            v33 = v122;
            uint64_t v60 = (uint64_t)contexta;
          }
        }
        if (([v10 roles] & 4) != 0)
        {
          v88 = [v119 home];
          v89 = v88;
          if (v88)
          {
            if ([v88 isCurrentDeviceAvailableResident])
            {
              v90 = (void *)MEMORY[0x1D9452090]();
              id v91 = a1;
              v92 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v93 = BOOL v113 = v12;
                v94 = [v8 identifier];
                *(_DWORD *)buf = 138543618;
                v129 = v93;
                __int16 v130 = 2114;
                v131 = v94;
                _os_log_impl(&dword_1D49D5000, v92, OS_LOG_TYPE_DEBUG, "%{public}@Message %{public}@ is targeting resident", buf, 0x16u);

                a5 = v115;
                BOOL v12 = v113;
              }

              v13 = v118;
              goto LABEL_101;
            }
          }
          else
          {
            contextb = (void *)v60;
            v106 = (void *)MEMORY[0x1D9452090]();
            id v95 = a1;
            v96 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v97 = BOOL v114 = v12;
              *(_DWORD *)buf = 138543362;
              v129 = v97;
              _os_log_impl(&dword_1D49D5000, v96, OS_LOG_TYPE_DEBUG, "%{public}@Unable to determine the home of the handler", buf, 0xCu);

              BOOL v12 = v114;
            }

            v33 = v122;
            uint64_t v60 = (uint64_t)contextb;
          }

          v13 = v118;
        }
        if (v60)
        {
LABEL_102:

LABEL_103:
          if (a5)
          {
            if (v12) {
              v103 = 0;
            }
            else {
              v103 = v13;
            }
            *a5 = v103;
          }
          if (v12) {
            int64_t v14 = 1;
          }
          else {
            int64_t v14 = -1;
          }

LABEL_112:
          goto LABEL_113;
        }
        v98 = (void *)MEMORY[0x1D9452090]();
        id v99 = a1;
        v100 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        {
          v101 = HMFGetLogIdentifier();
          v102 = [v8 identifier];
          *(_DWORD *)buf = 138543618;
          v129 = v101;
          __int16 v130 = 2114;
          v131 = v102;
          _os_log_impl(&dword_1D49D5000, v100, OS_LOG_TYPE_ERROR, "%{public}@Failed to satisfy the role(s) for message %{public}@", buf, 0x16u);

          a5 = v115;
        }

        if (!v13)
        {
          v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:10 description:0 reason:@"Failed to satisfy the role(s)" suggestion:0];
        }
        BOOL v12 = 0;
LABEL_101:
        v33 = v122;
        goto LABEL_102;
      }
      context = (void *)MEMORY[0x1D9452090]();
      id v64 = a1;
      v65 = HMFGetOSLogHandle();
      uint64_t v60 = 1;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        v66 = HMFGetLogIdentifier();
        v67 = [v8 identifier];
        *(_DWORD *)buf = 138543618;
        v129 = v66;
        __int16 v130 = 2114;
        v131 = v67;
        uint64_t v60 = 1;
        _os_log_impl(&dword_1D49D5000, v65, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ is from companion", buf, 0x16u);
      }
      a5 = v115;
      v33 = v122;
      BOOL v12 = v110;
    }
    else
    {
      context = (void *)MEMORY[0x1D9452090]();
      id v68 = a1;
      v65 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v70 = BOOL v69 = v12;
        v71 = [v8 identifier];
        *(_DWORD *)buf = 138543618;
        v129 = v70;
        __int16 v130 = 2114;
        v131 = v71;
        _os_log_impl(&dword_1D49D5000, v65, OS_LOG_TYPE_DEBUG, "%{public}@Unable to determine the sender of message %{public}@", buf, 0x16u);

        a5 = v115;
        BOOL v12 = v69;
      }
      uint64_t v60 = 0;
      v33 = v122;
    }

    v13 = v118;
    goto LABEL_66;
  }
  int64_t v14 = 0;
LABEL_113:

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