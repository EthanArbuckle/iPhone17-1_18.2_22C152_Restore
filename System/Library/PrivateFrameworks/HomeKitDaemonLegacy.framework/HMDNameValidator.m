@interface HMDNameValidator
- (HMDNameValidator)initWithUUID:(id)a3;
- (NSMutableDictionary)namespaceList;
- (NSPredicate)nonZeroLengthPredicate;
- (NSUUID)homeManagerUUID;
- (id)_addName:(id)a3 namespace:(id)a4;
- (id)_addNamespace:(id)a3;
- (id)_checkForConflict:(id)a3 namespace:(id)a4;
- (id)_removeName:(id)a3 namespace:(id)a4;
- (id)_removeNamespace:(id)a3;
- (id)_replaceName:(id)a3 withNewName:(id)a4 inNamespaces:(id)a5;
- (id)_validateName:(id)a3;
- (id)addActionSetName:(id)a3 namespace:(id)a4;
- (id)addName:(id)a3 namespace:(id)a4;
- (id)addName:(id)a3 namespace:(id)a4 voiceShortcutCheck:(BOOL)a5;
- (id)addNamespace:(id)a3;
- (id)checkForConflict:(id)a3 namespace:(id)a4;
- (id)despaceName:(id)a3;
- (id)removeName:(id)a3 namespace:(id)a4;
- (id)removeNamespace:(id)a3;
- (id)replaceActionSetName:(id)a3 withNewName:(id)a4 inNamespaces:(id)a5;
- (id)replaceName:(id)a3 withNewName:(id)a4 inNamespaces:(id)a5;
- (id)replaceName:(id)a3 withNewName:(id)a4 inNamespaces:(id)a5 voiceShortcutCheck:(BOOL)a6;
- (id)trimNotAllowedCharactersFromName:(id)a3 error:(id *)a4;
- (id)validateName:(id)a3;
- (void)setHomeManagerUUID:(id)a3;
- (void)setNamespaceList:(id)a3;
- (void)setNonZeroLengthPredicate:(id)a3;
@end

@implementation HMDNameValidator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonZeroLengthPredicate, 0);
  objc_storeStrong((id *)&self->_homeManagerUUID, 0);
  objc_storeStrong((id *)&self->_namespaceList, 0);
}

- (void)setNonZeroLengthPredicate:(id)a3
{
}

- (NSPredicate)nonZeroLengthPredicate
{
  return self->_nonZeroLengthPredicate;
}

- (void)setHomeManagerUUID:(id)a3
{
}

- (NSUUID)homeManagerUUID
{
  return self->_homeManagerUUID;
}

- (void)setNamespaceList:(id)a3
{
}

- (NSMutableDictionary)namespaceList
{
  return self->_namespaceList;
}

- (id)replaceName:(id)a3 withNewName:(id)a4 inNamespaces:(id)a5 voiceShortcutCheck:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (![v12 count])
  {
    v15 = (void *)MEMORY[0x1D9452090]();
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v25 = v17;
      __int16 v26 = 2112;
      id v27 = v10;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Empty set of namespace UUIDs in operation to replace %@ with %@", buf, 0x20u);
    }
    uint64_t v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    goto LABEL_11;
  }
  if (!v10 || !v11)
  {
    uint64_t v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
LABEL_11:
    v14 = (void *)v18;
    goto LABEL_14;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v6 && !isNameValidWithVoiceShortcut(v11))
  {
    v19 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2300];
    uint64_t v22 = *MEMORY[0x1E4F28A50];
    v23 = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:95 userInfo:v20];
  }
  else
  {
    v14 = [(HMDNameValidator *)self _replaceName:v10 withNewName:v11 inNamespaces:v12];
  }
  os_unfair_lock_unlock(p_lock);
LABEL_14:

  return v14;
}

- (id)replaceActionSetName:(id)a3 withNewName:(id)a4 inNamespaces:(id)a5
{
  return [(HMDNameValidator *)self replaceName:a3 withNewName:a4 inNamespaces:a5 voiceShortcutCheck:1];
}

- (id)replaceName:(id)a3 withNewName:(id)a4 inNamespaces:(id)a5
{
  return [(HMDNameValidator *)self replaceName:a3 withNewName:a4 inNamespaces:a5 voiceShortcutCheck:0];
}

- (id)removeName:(id)a3 namespace:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock_with_options();
      v9 = [(HMDNameValidator *)self _removeName:v6 namespace:v7];
      os_unfair_lock_unlock(p_lock);
      goto LABEL_9;
    }
    uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = HMFGetLogIdentifier();
      int v15 = 138543618;
      v16 = v12;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Namespace UUID is nil in operation to remove %@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
  }
  v9 = (void *)v13;
LABEL_9:

  return v9;
}

- (id)addName:(id)a3 namespace:(id)a4 voiceShortcutCheck:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Namespace UUID is nil in operation to add %@", buf, 0x16u);
    }
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    goto LABEL_10;
  }
  if (!v8)
  {
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
LABEL_10:
    id v11 = (void *)v15;
    goto LABEL_13;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v5 && !isNameValidWithVoiceShortcut(v8))
  {
    v16 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2300];
    uint64_t v19 = *MEMORY[0x1E4F28A50];
    v20 = v16;
    __int16 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v11 = [MEMORY[0x1E4F28C58] hmErrorWithCode:95 userInfo:v17];
  }
  else
  {
    id v11 = [(HMDNameValidator *)self _addName:v8 namespace:v9];
  }
  os_unfair_lock_unlock(p_lock);
LABEL_13:

  return v11;
}

- (id)addActionSetName:(id)a3 namespace:(id)a4
{
  return [(HMDNameValidator *)self addName:a3 namespace:a4 voiceShortcutCheck:1];
}

- (id)addName:(id)a3 namespace:(id)a4
{
  return [(HMDNameValidator *)self addName:a3 namespace:a4 voiceShortcutCheck:0];
}

- (id)checkForConflict:(id)a3 namespace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v9 = [(HMDNameValidator *)self _checkForConflict:v6 namespace:v7];
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (id)validateName:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMDNameValidator *)self _validateName:v4];
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)removeNamespace:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    id v6 = [(HMDNameValidator *)self _removeNamespace:v4];
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Namespace UUID is nil in operation to remove namespace", (uint8_t *)&v11, 0xCu);
    }
    id v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
  }

  return v6;
}

- (id)addNamespace:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    id v6 = [(HMDNameValidator *)self _addNamespace:v4];
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Namespace UUID is nil in operation to add namespace", (uint8_t *)&v11, 0xCu);
    }
    id v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
  }

  return v6;
}

- (id)_replaceName:(id)a3 withNewName:(id)a4 inNamespaces:(id)a5
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v61 = v7;
  if ([v7 isEqual:v8])
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v82 = v12;
      __int16 v83 = 2112;
      id v84 = v7;
      __int16 v85 = 2112;
      id v86 = v9;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting to replace %@ with same entry in namespaces %@ - skipping...", buf, 0x20u);
    }
    uint64_t v13 = 0;
  }
  else
  {
    id v58 = v8;
    v59 = [MEMORY[0x1E4F1CA48] array];
    [MEMORY[0x1E4F1CA48] array];
    v57 = id v56 = v9;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v74 objects:v89 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v75 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          v20 = [(HMDNameValidator *)self _removeName:v7 namespace:v19];
          if (v20)
          {
            v21 = (void *)MEMORY[0x1D9452090]();
            uint64_t v22 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v23 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138544130;
              v82 = v23;
              __int16 v83 = 2112;
              id v84 = v7;
              __int16 v85 = 2112;
              id v86 = v19;
              __int16 v87 = 2112;
              v88 = v20;
              _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to remove existing name %@ from namespace %@ error %@", buf, 0x2Au);
            }
          }
          else
          {
            [v59 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v74 objects:v89 count:16];
      }
      while (v16);
    }

    id v8 = v58;
    if (v58)
    {
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v24 = v14;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v70 objects:v80 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v71;
        __int16 v28 = v57;
        while (2)
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v71 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v30 = *(void **)(*((void *)&v70 + 1) + 8 * j);
            uint64_t v31 = [(HMDNameValidator *)self _addName:v58 namespace:v30];
            if (v31)
            {
              v55 = (void *)v31;
              v32 = (void *)MEMORY[0x1D9452090]();
              v33 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                v34 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138544130;
                v82 = v34;
                __int16 v83 = 2112;
                id v84 = v58;
                __int16 v85 = 2112;
                id v86 = v30;
                __int16 v87 = 2112;
                v88 = v55;
                _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to add new name %@ from namespace %@  error %@", buf, 0x2Au);
              }

              long long v68 = 0u;
              long long v69 = 0u;
              long long v66 = 0u;
              long long v67 = 0u;
              id v35 = v57;
              uint64_t v36 = [v35 countByEnumeratingWithState:&v66 objects:v79 count:16];
              if (v36)
              {
                uint64_t v37 = v36;
                uint64_t v38 = *(void *)v67;
                do
                {
                  for (uint64_t k = 0; k != v37; ++k)
                  {
                    if (*(void *)v67 != v38) {
                      objc_enumerationMutation(v35);
                    }
                    v40 = *(void **)(*((void *)&v66 + 1) + 8 * k);
                    v41 = [(HMDNameValidator *)self _removeName:v8 namespace:v40];
                    if (v41)
                    {
                      v42 = (void *)MEMORY[0x1D9452090]();
                      v43 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                      {
                        v44 = HMFGetLogIdentifier();
                        *(_DWORD *)buf = 138544130;
                        v82 = v44;
                        __int16 v83 = 2112;
                        id v84 = v58;
                        __int16 v85 = 2112;
                        id v86 = v40;
                        __int16 v87 = 2112;
                        v88 = v41;
                        _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove new name %@ to namespace %@ error %@", buf, 0x2Au);

                        id v8 = v58;
                      }
                    }
                  }
                  uint64_t v37 = [v35 countByEnumeratingWithState:&v66 objects:v79 count:16];
                }
                while (v37);
              }

              long long v64 = 0u;
              long long v65 = 0u;
              long long v62 = 0u;
              long long v63 = 0u;
              id v24 = v59;
              uint64_t v45 = [v24 countByEnumeratingWithState:&v62 objects:v78 count:16];
              if (v45)
              {
                uint64_t v46 = v45;
                uint64_t v47 = *(void *)v63;
                do
                {
                  for (uint64_t m = 0; m != v46; ++m)
                  {
                    if (*(void *)v63 != v47) {
                      objc_enumerationMutation(v24);
                    }
                    v49 = *(void **)(*((void *)&v62 + 1) + 8 * m);
                    v50 = [(HMDNameValidator *)self _addName:v61 namespace:v49];
                    if (v50)
                    {
                      v51 = (void *)MEMORY[0x1D9452090]();
                      v52 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                      {
                        v53 = HMFGetLogIdentifier();
                        *(_DWORD *)buf = 138544130;
                        v82 = v53;
                        __int16 v83 = 2112;
                        id v84 = v61;
                        __int16 v85 = 2112;
                        id v86 = v49;
                        __int16 v87 = 2112;
                        v88 = v50;
                        _os_log_impl(&dword_1D49D5000, v52, OS_LOG_TYPE_ERROR, "%{public}@Failed to add existing name %@ to namespace %@ error %@", buf, 0x2Au);
                      }
                    }
                  }
                  uint64_t v46 = [v24 countByEnumeratingWithState:&v62 objects:v78 count:16];
                }
                while (v46);
                id v8 = v58;
              }
              __int16 v28 = v57;
              uint64_t v13 = v55;
              goto LABEL_55;
            }
            [v57 addObject:v30];
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v70 objects:v80 count:16];
          if (v26) {
            continue;
          }
          break;
        }
        uint64_t v13 = 0;
      }
      else
      {
        uint64_t v13 = 0;
        __int16 v28 = v57;
      }
LABEL_55:
    }
    else
    {
      uint64_t v13 = 0;
      __int16 v28 = v57;
    }

    id v9 = v56;
  }

  return v13;
}

- (id)_removeName:(id)a3 namespace:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDNameValidator *)self namespaceList];
  id v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    id v10 = [(HMDNameValidator *)self despaceName:v6];
    if ([v9 containsObject:v10])
    {
      [v9 removeObject:v10];
      int v11 = 0;
    }
    else
    {
      int v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:2 userInfo:0];
    }
  }
  else
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = HMFGetLogIdentifier();
      int v16 = 138543874;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to look up namespace %@ to remove name %@", (uint8_t *)&v16, 0x20u);
    }
    int v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:2 userInfo:0];
  }

  return v11;
}

- (id)_addName:(id)a3 namespace:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDNameValidator *)self _validateName:v6];
  if (!v8)
  {
    id v9 = [(HMDNameValidator *)self despaceName:v6];
    id v10 = [(HMDNameValidator *)self namespaceList];
    int v11 = [v10 objectForKeyedSubscript:v7];

    if (v11)
    {
      if (![v11 containsObject:v9])
      {
        [v11 addObject:v9];
        id v8 = 0;
        goto LABEL_10;
      }
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F2D140];
      uint64_t v14 = 31;
    }
    else
    {
      uint64_t v15 = (void *)MEMORY[0x1D9452090]();
      int v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = HMFGetLogIdentifier();
        int v19 = 138543874;
        __int16 v20 = v17;
        __int16 v21 = 2112;
        id v22 = v7;
        __int16 v23 = 2112;
        id v24 = v6;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to look up namespace %@ to remove name %@", (uint8_t *)&v19, 0x20u);
      }
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F2D140];
      uint64_t v14 = 2;
    }
    id v8 = [v12 errorWithDomain:v13 code:v14 userInfo:0];
LABEL_10:
  }
  return v8;
}

- (id)_checkForConflict:(id)a3 namespace:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDNameValidator *)self despaceName:v6];
  id v9 = [(HMDNameValidator *)self namespaceList];
  id v10 = [v9 objectForKeyedSubscript:v7];

  if (!v10)
  {
    id v12 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v17 = 138543618;
      __int16 v18 = v14;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to look up namespace %@", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v11 = 2;
    goto LABEL_7;
  }
  if ([v10 containsObject:v8])
  {
    uint64_t v11 = 31;
LABEL_7:
    uint64_t v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:v11];
    goto LABEL_9;
  }
  uint64_t v15 = 0;
LABEL_9:

  return v15;
}

- (id)trimNotAllowedCharactersFromName:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 length];
  id v7 = (void *)MEMORY[0x1D9452090]();
  if (v6)
  {
    id v8 = [MEMORY[0x1E4F28E58] alphanumericCharacterSet];
    id v9 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    [v8 formUnionWithCharacterSet:v9];

    [v8 addCharactersInString:@".’',-&#"];
    id v10 = [v8 invertedSet];
    uint64_t v11 = [v5 componentsSeparatedByCharactersInSet:v10];
    id v12 = [v11 componentsJoinedByString:&stru_1F2C9F1A8];
  }
  else
  {
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v16 = 138543618;
      int v17 = v14;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Name %@ is empty", (uint8_t *)&v16, 0x16u);
    }
    if (a4)
    {
      [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      id v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v12 = 0;
    }
  }

  return v12;
}

- (id)_validateName:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 length];
  id v5 = (void *)MEMORY[0x1D9452090]();
  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F28E58] alphanumericCharacterSet];
    if ([v3 rangeOfCharacterFromSet:v6 options:129])
    {
      id v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = HMFGetLogIdentifier();
        int v24 = 138543618;
        uint64_t v25 = v9;
        __int16 v26 = 2112;
        id v27 = v3;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Name %@ does not start with allowed characters", (uint8_t *)&v24, 0x16u);
      }
      uint64_t v10 = 36;
LABEL_15:

      id v19 = [MEMORY[0x1E4F28C58] hmErrorWithCode:v10];

      goto LABEL_21;
    }
    [v6 addCharactersInString:@"."];
    uint64_t v14 = [v3 rangeOfCharacterFromSet:v6 options:133];
    if (v14 != [v3 length] - 1)
    {
      id v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = HMFGetLogIdentifier();
        int v24 = 138543618;
        uint64_t v25 = v18;
        __int16 v26 = 2112;
        id v27 = v3;
        _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Name %@ does not end with allowed characters", (uint8_t *)&v24, 0x16u);
      }
      uint64_t v10 = 60;
      goto LABEL_15;
    }
    uint64_t v15 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    [v6 formUnionWithCharacterSet:v15];

    [v6 addCharactersInString:@"’',-&#"];
    int v16 = [v6 invertedSet];
    if ([v3 rangeOfCharacterFromSet:v16 options:133] == 0x7FFFFFFFFFFFFFFFLL)
    {
      int v17 = 0;
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x1D9452090]();
      uint64_t v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = HMFGetLogIdentifier();
        int v24 = 138543618;
        uint64_t v25 = v22;
        __int16 v26 = 2112;
        id v27 = v3;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Name %@ contains disallowed characters", (uint8_t *)&v24, 0x16u);
      }
      int v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:35];
    }

    id v13 = v17;
  }
  else
  {
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = HMFGetLogIdentifier();
      int v24 = 138543618;
      uint64_t v25 = v12;
      __int16 v26 = 2112;
      id v27 = v3;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Name %@ is empty", (uint8_t *)&v24, 0x16u);
    }
    id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
  }
  id v19 = v13;
LABEL_21:

  return v19;
}

- (id)despaceName:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28B88];
  id v5 = a3;
  uint64_t v6 = [v4 whitespaceCharacterSet];
  id v7 = (void *)MEMORY[0x1E4F1CA48];
  id v8 = [v5 componentsSeparatedByCharactersInSet:v6];

  id v9 = [v7 arrayWithArray:v8];

  uint64_t v10 = [(HMDNameValidator *)self nonZeroLengthPredicate];
  uint64_t v11 = [v9 filteredArrayUsingPredicate:v10];

  id v12 = [v11 componentsJoinedByString:&stru_1F2C9F1A8];
  id v13 = [v12 lowercaseString];

  return v13;
}

- (id)_removeNamespace:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNameValidator *)self namespaceList];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = [(HMDNameValidator *)self namespaceList];
    [v7 removeObjectForKey:v4];

    id v8 = 0;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:2 userInfo:0];
  }

  return v8;
}

- (id)_addNamespace:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNameValidator *)self namespaceList];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:1 userInfo:0];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA80] set];
    id v9 = [(HMDNameValidator *)self namespaceList];
    [v9 setObject:v8 forKey:v4];

    id v7 = 0;
  }

  return v7;
}

- (HMDNameValidator)initWithUUID:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDNameValidator;
  uint64_t v6 = [(HMDNameValidator *)&v13 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    namespaceList = v6->_namespaceList;
    v6->_namespaceList = (NSMutableDictionary *)v7;

    objc_storeStrong((id *)&v6->_homeManagerUUID, a3);
    uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"length != 0"];
    nonZeroLengthPredicate = v6->_nonZeroLengthPredicate;
    v6->_nonZeroLengthPredicate = (NSPredicate *)v9;

    id v11 = [(HMDNameValidator *)v6 _addNamespace:v6->_homeManagerUUID];
  }

  return v6;
}

@end