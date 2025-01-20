@interface HMDAccessorySettingGroup
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)supportedGroupsClasses;
+ (id)supportedSettingsClasses;
- (BOOL)compareSettingsTree:(id)a3;
- (BOOL)dataSourceShouldEncodeSetting:(id)a3 withCoder:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrivateToDevice;
- (BOOL)shouldEncodeForCoder:(id)a3;
- (HMDAccessorySettingGroup)groupWithIdentifier:(id)a3;
- (HMDAccessorySettingGroup)init;
- (HMDAccessorySettingGroup)initWithCoder:(id)a3;
- (HMDAccessorySettingGroup)initWithModel:(id)a3;
- (HMDAccessorySettingGroup)initWithName:(id)a3 identifier:(id)a4 parentIdentifier:(id)a5;
- (HMDAccessorySettingGroup)mediaSystemSettingGroup;
- (HMDAccessorySettingGroupDataSource)dataSource;
- (NSArray)groups;
- (NSArray)settings;
- (NSString)description;
- (NSString)keyPath;
- (NSString)name;
- (NSUUID)identifier;
- (NSUUID)parentIdentifier;
- (id)_initWithCoder:(id)a3;
- (id)_settingWithKeys:(id)a3;
- (id)copyIdentical;
- (id)copyReplica;
- (id)fullDescription;
- (id)logIdentifier;
- (id)settingWithIdentifier:(id)a3;
- (id)settingWithKeyPath:(id)a3;
- (id)settingWithName:(id)a3;
- (id)subGroupWithName:(id)a3;
- (unint64_t)hash;
- (void)_encodeWithCoder:(id)a3;
- (void)_reevaluateParentGroup:(id)a3;
- (void)_setParentGroup:(id)a3;
- (void)addGroup:(id)a3;
- (void)addSetting:(id)a3;
- (void)description:(id)a3 indent:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)intersectSettingGroup:(id)a3 groupMetadata:(id)a4 shouldAddMissingItems:(BOOL)a5;
- (void)removeGroup:(id)a3;
- (void)removeSetting:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setMediaSystemSettingGroup:(id)a3;
- (void)setParentIdentifier:(id)a3;
@end

@implementation HMDAccessorySettingGroup

- (void)description:(id)a3 indent:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDAccessorySettingGroup *)self name];
  v9 = [(HMDAccessorySettingGroup *)self identifier];
  v10 = [(HMDAccessorySettingGroup *)self groups];
  uint64_t v11 = [v10 count];
  v12 = [(HMDAccessorySettingGroup *)self settings];
  uint64_t v13 = [v12 count];
  v14 = [(HMDAccessorySettingGroup *)self mediaSystemSettingGroup];
  [v6 appendFormat:@"\n %@ name = %@, identifier = %@, group = %tu, settings = %tu, media-system-settings-group = %@\n", v7, v8, v9, v11, v13, v14];

  v15 = [v7 indentationByLevels:1];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v16 = [(HMDAccessorySettingGroup *)self groups];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * v20++) description:v6 indent:v15];
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v18);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v21 = [(HMDAccessorySettingGroup *)self settings];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * v25++) description:v6 indent:v15];
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v23);
  }
}

- (id)fullDescription
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"\n"];
  v4 = [MEMORY[0x263F42640] indentation];
  [(HMDAccessorySettingGroup *)self description:v3 indent:v4];
  v5 = (void *)[v3 copy];

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(HMDAccessorySettingGroup *)self keyPath];
  v5 = [(HMDAccessorySettingGroup *)self identifier];
  id v6 = [(HMDAccessorySettingGroup *)self mediaSystemSettingGroup];
  id v7 = [v6 identifier];
  v8 = [v3 stringWithFormat:@"[HMD-Accessory-Settings-Group: %@/%@ (%@)]", v4, v5, v7];

  return (NSString *)v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_destroyWeak((id *)&self->_mediaSystemSettingGroup);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDataSource:(id)a3
{
}

- (HMDAccessorySettingGroupDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDAccessorySettingGroupDataSource *)WeakRetained;
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setParentIdentifier:(id)a3
{
}

- (NSUUID)parentIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMediaSystemSettingGroup:(id)a3
{
}

- (HMDAccessorySettingGroup)mediaSystemSettingGroup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaSystemSettingGroup);
  return (HMDAccessorySettingGroup *)WeakRetained;
}

- (BOOL)compareSettingsTree:(id)a3
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDAccessorySettingGroup *)self name];
  id v6 = [v4 name];
  char v7 = HMFEqualObjects();

  if ((v7 & 1) == 0)
  {
    v53 = (void *)MEMORY[0x230FBD990]();
    v54 = self;
    v55 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_INFO)) {
      goto LABEL_28;
    }
    v56 = HMFGetLogIdentifier();
    v57 = [v4 name];
    *(_DWORD *)buf = 138543618;
    v77 = v56;
    __int16 v78 = 2112;
    v79 = v57;
    v58 = "%{public}@Name is not matching: %@";
    goto LABEL_27;
  }
  unint64_t v8 = 0x263EFF000uLL;
  v9 = (void *)MEMORY[0x263EFFA08];
  v10 = [(HMDAccessorySettingGroup *)self groups];
  uint64_t v11 = [v9 setWithArray:v10];
  v12 = (void *)MEMORY[0x263EFFA08];
  uint64_t v13 = [v4 groups];
  v14 = [v12 setWithArray:v13];
  char v15 = HMFEqualObjects();

  if ((v15 & 1) == 0)
  {
    v53 = (void *)MEMORY[0x230FBD990]();
    v54 = self;
    v55 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_INFO)) {
      goto LABEL_28;
    }
    v56 = HMFGetLogIdentifier();
    v57 = [v4 name];
    *(_DWORD *)buf = 138543618;
    v77 = v56;
    __int16 v78 = 2112;
    v79 = v57;
    v58 = "%{public}@Sub-groups are not matching: %@";
    goto LABEL_27;
  }
  v16 = (void *)MEMORY[0x263EFFA08];
  uint64_t v17 = [(HMDAccessorySettingGroup *)self settings];
  uint64_t v18 = [v16 setWithArray:v17];
  uint64_t v19 = (void *)MEMORY[0x263EFFA08];
  uint64_t v20 = [v4 settings];
  v21 = [v19 setWithArray:v20];
  char v22 = HMFEqualObjects();

  if ((v22 & 1) == 0)
  {
    v53 = (void *)MEMORY[0x230FBD990]();
    v54 = self;
    v55 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_INFO)) {
      goto LABEL_28;
    }
    v56 = HMFGetLogIdentifier();
    v57 = [v4 name];
    *(_DWORD *)buf = 138543618;
    v77 = v56;
    __int16 v78 = 2112;
    v79 = v57;
    v58 = "%{public}@Sub-settings are not matching: %@";
LABEL_27:
    _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_INFO, v58, buf, 0x16u);

LABEL_28:
LABEL_29:
    BOOL v52 = 0;
    goto LABEL_30;
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v23 = [(HMDAccessorySettingGroup *)self settings];
  uint64_t v24 = (void *)[v23 copy];

  obuint64_t j = v24;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v70 objects:v75 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v71;
    while (2)
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v71 != v27) {
          objc_enumerationMutation(obj);
        }
        long long v29 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        long long v30 = (void *)MEMORY[0x263F08A98];
        long long v31 = [v29 name];
        long long v32 = [v30 predicateWithFormat:@"name == %@", v31];

        long long v33 = (void *)MEMORY[0x263EFFA08];
        v34 = [v4 settings];
        v35 = [v33 setWithArray:v34];

        uint64_t v36 = [v35 filteredSetUsingPredicate:v32];
        v37 = [v36 anyObject];
        if (([v29 compareConstraints:v37] & 1) == 0)
        {
          v60 = (void *)MEMORY[0x230FBD990]();
          v61 = self;
          v62 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            v63 = HMFGetLogIdentifier();
            v64 = [v29 name];
            *(_DWORD *)buf = 138543618;
            v77 = v63;
            __int16 v78 = 2112;
            v79 = v64;
            _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_INFO, "%{public}@Constraints on settings are not matching: %@", buf, 0x16u);
          }

          goto LABEL_29;
        }

        unint64_t v8 = 0x263EFF000uLL;
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v70 objects:v75 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v38 = [(HMDAccessorySettingGroup *)self groups];
  uint64_t v39 = [v38 countByEnumeratingWithState:&v66 objects:v74 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v67;
    while (2)
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v67 != v41) {
          objc_enumerationMutation(v38);
        }
        v43 = *(void **)(*((void *)&v66 + 1) + 8 * j);
        v44 = (void *)MEMORY[0x263F08A98];
        v45 = [v43 name];
        v46 = [v44 predicateWithFormat:@"name == %@", v45];

        v47 = *(void **)(v8 + 2568);
        v48 = [v4 groups];
        v49 = [v47 setWithArray:v48];
        v50 = [v49 filteredSetUsingPredicate:v46];

        v51 = [v50 anyObject];
        LODWORD(v43) = [v43 compareSettingsTree:v51];

        if (!v43)
        {
          BOOL v52 = 0;
          goto LABEL_35;
        }
        unint64_t v8 = 0x263EFF000;
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v66 objects:v74 count:16];
      if (v40) {
        continue;
      }
      break;
    }
  }
  BOOL v52 = 1;
LABEL_35:

LABEL_30:
  return v52;
}

- (void)intersectSettingGroup:(id)a3 groupMetadata:(id)a4 shouldAddMissingItems:(BOOL)a5
{
  BOOL v138 = a5;
  uint64_t v180 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x230FBD990]();
  v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  v129 = v8;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    uint64_t v13 = [(HMDAccessorySettingGroup *)v10 name];
    *(_DWORD *)buf = 138543874;
    v175 = v12;
    __int16 v176 = 2112;
    v177 = v13;
    __int16 v178 = 1024;
    BOOL v179 = v138;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Group name is %@, intersecting. addMissing: %d", buf, 0x1Cu);

    id v8 = v129;
  }

  if ([(HMDAccessorySettingGroup *)v10 isPrivateToDevice])
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    char v15 = v10;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      uint64_t v18 = [(HMDAccessorySettingGroup *)v15 name];
      *(_DWORD *)buf = 138543618;
      v175 = v17;
      __int16 v176 = 2112;
      v177 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Skipping private group %@", buf, 0x16u);

LABEL_90:
      id v8 = v129;
      goto LABEL_91;
    }
    goto LABEL_91;
  }
  if (!v8)
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    char v15 = v10;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v175 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Received metadata is nil, not intersecting", buf, 0xCu);
      goto LABEL_90;
    }
LABEL_91:

    uint64_t v125 = [MEMORY[0x263EFF9C0] set];
    groups = v15->_groups;
    v15->_groups = (NSMutableSet *)v125;

    uint64_t v127 = [MEMORY[0x263EFF9C0] set];
    settings = v15->_settings;
    v15->_settings = (NSMutableSet *)v127;
    goto LABEL_92;
  }
  uint64_t v19 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v20 = [(HMDAccessorySettingGroup *)v10 groups];
  v21 = objc_msgSend(v20, "hmf_objectsPassingTest:", &__block_literal_global_38_211251);
  char v22 = [v19 setWithArray:v21];

  uint64_t v23 = (void *)MEMORY[0x263EFFA08];
  uint64_t v24 = [v7 groups];
  uint64_t v25 = objc_msgSend(v24, "hmf_objectsPassingTest:", &__block_literal_global_40_211252);
  uint64_t v26 = [v23 setWithArray:v25];

  v134 = (void *)v26;
  [(NSMutableSet *)v22 intersectSet:v26];
  p_groups = (id *)&v10->_groups;
  v135 = v22;
  objc_storeStrong((id *)&v10->_groups, v22);
  uint64_t v27 = (void *)MEMORY[0x263EFF9A0];
  long long v28 = [v8 groups];
  long long v29 = objc_msgSend(v27, "dictionaryWithCapacity:", objc_msgSend(v28, "count"));

  long long v165 = 0u;
  long long v166 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  long long v30 = [v8 groups];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v163 objects:v173 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v164;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v164 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v163 + 1) + 8 * i);
        uint64_t v36 = [v35 name];
        [v29 setObject:v35 forKey:v36];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v163 objects:v173 count:16];
    }
    while (v32);
  }

  long long v161 = 0u;
  long long v162 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  v37 = [(HMDAccessorySettingGroup *)v10 groups];
  v38 = (void *)[v37 copy];

  uint64_t v39 = [v38 countByEnumeratingWithState:&v159 objects:v172 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v160;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v160 != v41) {
          objc_enumerationMutation(v38);
        }
        v43 = *(void **)(*((void *)&v159 + 1) + 8 * j);
        v44 = [v43 name];
        v45 = [v29 objectForKey:v44];

        if (!v45) {
          [*p_groups removeObject:v43];
        }
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v159 objects:v172 count:16];
    }
    while (v40);
  }
  v131 = v10;
  v128 = v7;

  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  v46 = [v129 groups];
  uint64_t v47 = [v46 countByEnumeratingWithState:&v155 objects:v171 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v156;
    do
    {
      uint64_t v50 = 0;
      do
      {
        if (*(void *)v156 != v49) {
          objc_enumerationMutation(v46);
        }
        v51 = *(void **)(*((void *)&v155 + 1) + 8 * v50);
        BOOL v52 = (void *)MEMORY[0x263F08A98];
        v53 = [v51 name];
        v54 = [v52 predicateWithFormat:@"name == %@", v53];

        v55 = [(NSMutableSet *)v135 filteredSetUsingPredicate:v54];
        v56 = [v55 anyObject];

        v57 = [v134 filteredSetUsingPredicate:v54];
        v58 = [v57 anyObject];

        if (v56)
        {
          [v56 intersectSettingGroup:v58 groupMetadata:v51 shouldAddMissingItems:v138];
        }
        else if (v58 && v138 && ([v58 isPrivateToDevice] & 1) == 0)
        {
          [(HMDAccessorySettingGroup *)v131 addGroup:v58];
        }

        ++v50;
      }
      while (v48 != v50);
      uint64_t v59 = [v46 countByEnumeratingWithState:&v155 objects:v171 count:16];
      uint64_t v48 = v59;
    }
    while (v59);
  }

  v60 = (void *)MEMORY[0x263EFF9A0];
  v61 = [v129 settings];
  v62 = objc_msgSend(v60, "dictionaryWithCapacity:", objc_msgSend(v61, "count"));

  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  v63 = [v129 settings];
  uint64_t v64 = [v63 countByEnumeratingWithState:&v151 objects:v170 count:16];
  v65 = v131;
  if (v64)
  {
    uint64_t v66 = v64;
    uint64_t v67 = *(void *)v152;
    do
    {
      for (uint64_t k = 0; k != v66; ++k)
      {
        if (*(void *)v152 != v67) {
          objc_enumerationMutation(v63);
        }
        long long v69 = *(void **)(*((void *)&v151 + 1) + 8 * k);
        long long v70 = [v69 name];
        [v62 setObject:v69 forKey:v70];
      }
      uint64_t v66 = [v63 countByEnumeratingWithState:&v151 objects:v170 count:16];
    }
    while (v66);
  }

  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  long long v71 = [(HMDAccessorySettingGroup *)v131 settings];
  long long v72 = (void *)[v71 copy];

  uint64_t v73 = [v72 countByEnumeratingWithState:&v147 objects:v169 count:16];
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = *(void *)v148;
    do
    {
      uint64_t v76 = 0;
      uint64_t v136 = v74;
      do
      {
        if (*(void *)v148 != v75) {
          objc_enumerationMutation(v72);
        }
        v77 = *(void **)(*((void *)&v147 + 1) + 8 * v76);
        __int16 v78 = [v77 name];
        v79 = [v62 objectForKey:v78];

        if (!v79)
        {
          uint64_t v80 = (void *)MEMORY[0x230FBD990]();
          v81 = v65;
          v82 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v83 = v62;
            uint64_t v84 = v75;
            v86 = v85 = v72;
            *(_DWORD *)buf = 138543618;
            v175 = v86;
            __int16 v176 = 2112;
            v177 = v77;
            _os_log_impl(&dword_22F52A000, v82, OS_LOG_TYPE_INFO, "%{public}@Setting %@ does not have metadata, cannot merge", buf, 0x16u);

            long long v72 = v85;
            uint64_t v75 = v84;
            v62 = v83;
            uint64_t v74 = v136;
          }

          [v81[2] removeObject:v77];
          v65 = v131;
        }

        ++v76;
      }
      while (v74 != v76);
      uint64_t v74 = [v72 countByEnumeratingWithState:&v147 objects:v169 count:16];
    }
    while (v74);
  }

  v87 = (void *)MEMORY[0x263EFF9C0];
  v88 = [(HMDAccessorySettingGroup *)v65 settings];
  v133 = [v87 setWithArray:v88];

  v89 = (void *)MEMORY[0x263EFFA08];
  v90 = [v128 settings];
  v132 = [v89 setWithArray:v90];

  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  v91 = [v129 settings];
  uint64_t v137 = [v91 countByEnumeratingWithState:&v143 objects:v168 count:16];
  if (v137)
  {
    uint64_t v92 = *(void *)v144;
    do
    {
      for (uint64_t m = 0; m != v137; ++m)
      {
        if (*(void *)v144 != v92) {
          objc_enumerationMutation(v91);
        }
        v94 = *(void **)(*((void *)&v143 + 1) + 8 * m);
        v95 = (void *)MEMORY[0x263F08A98];
        v96 = [v94 name];
        v97 = [v95 predicateWithFormat:@"name == %@", v96];

        v98 = [v133 filteredSetUsingPredicate:v97];
        v99 = [v98 anyObject];

        v100 = [v132 filteredSetUsingPredicate:v97];
        v101 = [v100 anyObject];

        if (v99) {
          BOOL v102 = v101 == 0;
        }
        else {
          BOOL v102 = 1;
        }
        if (v102)
        {
          if (v101 && v138) {
            [(HMDAccessorySettingGroup *)v65 addSetting:v101];
          }
        }
        else
        {
          v103 = [v94 mergeStrategy];
          BOOL v104 = +[HMDAccessorySettingMergeHandler mergeFirst:v99 second:v101 mergeStrategy:v103 shouldAddMissing:v138];

          if (!v104)
          {
            v105 = (void *)MEMORY[0x230FBD990]();
            v106 = v65;
            v107 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              uint64_t v108 = v92;
              v110 = v109 = v91;
              *(_DWORD *)buf = 138543618;
              v175 = v110;
              __int16 v176 = 2112;
              v177 = v99;
              _os_log_impl(&dword_22F52A000, v107, OS_LOG_TYPE_INFO, "%{public}@Failed to merge setting %@, cannot merge", buf, 0x16u);

              v91 = v109;
              uint64_t v92 = v108;
            }

            [v106[2] removeObject:v99];
            v65 = v131;
          }
        }
      }
      uint64_t v137 = [v91 countByEnumeratingWithState:&v143 objects:v168 count:16];
    }
    while (v137);
  }

  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  v111 = [(HMDAccessorySettingGroup *)v65 groups];
  uint64_t v112 = [v111 countByEnumeratingWithState:&v139 objects:v167 count:16];
  if (v112)
  {
    uint64_t v113 = v112;
    uint64_t v114 = *(void *)v140;
    do
    {
      for (uint64_t n = 0; n != v113; ++n)
      {
        if (*(void *)v140 != v114) {
          objc_enumerationMutation(v111);
        }
        v116 = *(void **)(*((void *)&v139 + 1) + 8 * n);
        v117 = [v116 groups];
        if ([v117 count])
        {
        }
        else
        {
          v118 = [v116 settings];
          uint64_t v119 = [v118 count];

          if (!v119)
          {
            v120 = (void *)MEMORY[0x230FBD990]();
            v121 = v65;
            v122 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
            {
              v123 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v175 = v123;
              __int16 v176 = 2112;
              v177 = v116;
              _os_log_impl(&dword_22F52A000, v122, OS_LOG_TYPE_INFO, "%{public}@No subgroup or settings, removing group %@", buf, 0x16u);
            }
            [*p_groups removeObject:v116];
            v65 = v131;
          }
        }
      }
      uint64_t v113 = [v111 countByEnumeratingWithState:&v139 objects:v167 count:16];
    }
    while (v113);
  }

  id v7 = v128;
  id v8 = v129;
  settings = v135;
LABEL_92:
}

uint64_t __86__HMDAccessorySettingGroup_intersectSettingGroup_groupMetadata_shouldAddMissingItems___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isPrivateToDevice] ^ 1;
}

uint64_t __86__HMDAccessorySettingGroup_intersectSettingGroup_groupMetadata_shouldAddMissingItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPrivateToDevice] ^ 1;
}

- (BOOL)dataSourceShouldEncodeSetting:(id)a3 withCoder:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDAccessorySettingGroup *)self dataSource];
  v9 = v8;
  if (v8)
  {
    char v10 = [v8 shouldEncodeSetting:v6 withCoder:v7 forAccessorySettingGroup:self];
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = HMFGetLogIdentifier();
      char v15 = [v6 keyPath];
      v16 = HMFBooleanToString();
      int v20 = 138544130;
      v21 = v14;
      __int16 v22 = 2112;
      uint64_t v23 = v9;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      __int16 v26 = 2112;
      uint64_t v27 = v16;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@dataSource: %@, shouldEncodeSetting = %@, %@", (uint8_t *)&v20, 0x2Au);
    }
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    uint64_t v17 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v20 = 138543362;
      v21 = v18;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode settings due to no data source", (uint8_t *)&v20, 0xCu);
    }
    char v10 = 0;
  }

  return v10;
}

- (void)_encodeWithCoder:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(HMDAccessorySettingGroup *)self shouldEncodeForCoder:v4])
  {
    v5 = [(HMDAccessorySettingGroup *)self groups];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __45__HMDAccessorySettingGroup__encodeWithCoder___block_invoke;
    v28[3] = &unk_264A272B8;
    id v6 = v4;
    id v29 = v6;
    id v7 = objc_msgSend(v5, "hmf_objectsPassingTest:", v28);

    id v8 = [(HMDAccessorySettingGroup *)self settings];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __45__HMDAccessorySettingGroup__encodeWithCoder___block_invoke_2;
    v26[3] = &unk_264A272E0;
    v26[4] = self;
    id v9 = v6;
    id v27 = v9;
    char v10 = objc_msgSend(v8, "na_filter:", v26);

    uint64_t v11 = (void *)MEMORY[0x263EFFA08];
    v12 = [(HMDAccessorySettingGroup *)self settings];
    uint64_t v13 = [v11 setWithArray:v12];

    v14 = [MEMORY[0x263EFFA08] setWithArray:v10];
    char v15 = (void *)MEMORY[0x230FBD990]();
    v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      uint64_t v18 = v25 = v7;
      uint64_t v19 = [(HMDAccessorySettingGroup *)v16 dataSource];
      objc_msgSend(v13, "na_setByRemovingObjectsFromSet:", v14);
      __int16 v24 = v14;
      v21 = int v20 = v13;
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v18;
      __int16 v32 = 2112;
      uint64_t v33 = v19;
      __int16 v34 = 2112;
      v35 = v21;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@dataSource = %@, subtracted values = %@", buf, 0x20u);

      uint64_t v13 = v20;
      v14 = v24;

      id v7 = v25;
    }

    __int16 v22 = [(HMDAccessorySettingGroup *)v16 identifier];
    [v9 encodeObject:v22 forKey:*MEMORY[0x263F0B540]];

    uint64_t v23 = [(HMDAccessorySettingGroup *)v16 name];
    [v9 encodeObject:v23 forKey:*MEMORY[0x263F0B548]];

    [v9 encodeObject:v10 forKey:*MEMORY[0x263F0B550]];
    [v9 encodeObject:v7 forKey:*MEMORY[0x263F0B538]];
  }
}

uint64_t __45__HMDAccessorySettingGroup__encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 shouldEncodeForCoder:*(void *)(a1 + 32)];
}

uint64_t __45__HMDAccessorySettingGroup__encodeWithCoder___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) dataSourceShouldEncodeSetting:a2 withCoder:*(void *)(a1 + 40)];
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x230FBD990]();
  [(HMDAccessorySettingGroup *)self _encodeWithCoder:v5];
}

- (BOOL)shouldEncodeForCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (objc_msgSend(v4, "hmd_isForNonAdminSharedUser"))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = [(HMDAccessorySettingGroup *)self settings];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([(HMDAccessorySettingGroup *)self dataSourceShouldEncodeSetting:*(void *)(*((void *)&v18 + 1) + 8 * v9) withCoder:v4])
        {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = [(HMDAccessorySettingGroup *)self groups];
      uint64_t v10 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
      if (!v10)
      {
LABEL_21:

        goto LABEL_22;
      }
      uint64_t v11 = *(void *)v15;
LABEL_12:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v14 + 1) + 8 * v12) shouldEncodeForCoder:v4]) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
          if (v10) {
            goto LABEL_12;
          }
          goto LABEL_21;
        }
      }
    }
    LOBYTE(v10) = 1;
    goto LABEL_21;
  }
  LOBYTE(v10) = 1;
LABEL_22:

  return v10;
}

- (id)_initWithCoder:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0B548]];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0B540]];
  uint64_t v7 = [MEMORY[0x263F08C38] UUID];
  uint64_t v8 = [(HMDAccessorySettingGroup *)self initWithName:v5 identifier:v6 parentIdentifier:v7];

  if (v8)
  {
    uint64_t v9 = +[HMDAccessorySettingGroup supportedSettingsClasses];
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:*MEMORY[0x263F0B550]];

    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __43__HMDAccessorySettingGroup__initWithCoder___block_invoke;
    v46[3] = &unk_264A27290;
    uint64_t v11 = v8;
    uint64_t v47 = v11;
    v35 = v10;
    uint64_t v12 = objc_msgSend(v10, "na_filter:", v46);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = [MEMORY[0x263EFF9C0] setWithArray:v12];
      id v15 = v11[2];
      v11[2] = (id)v14;

      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v16 = v11[2];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v49 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v43;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v43 != v19) {
              objc_enumerationMutation(v16);
            }
            [*(id *)(*((void *)&v42 + 1) + 8 * v20++) setGroup:v11];
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v42 objects:v49 count:16];
        }
        while (v18);
      }

      uint64_t v12 = v13;
    }
    long long v21 = +[HMDAccessorySettingGroup supportedGroupsClasses];
    __int16 v22 = [v4 decodeObjectOfClasses:v21 forKey:*MEMORY[0x263F0B538]];

    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __43__HMDAccessorySettingGroup__initWithCoder___block_invoke_35;
    v40[3] = &unk_264A27290;
    uint64_t v23 = v11;
    uint64_t v41 = v23;
    uint64_t v24 = objc_msgSend(v22, "na_filter:", v40);
    if (v24)
    {
      uint64_t v33 = v12;
      __int16 v34 = v5;
      uint64_t v25 = [MEMORY[0x263EFF9C0] setWithArray:v24];
      id v26 = v23[3];
      v23[3] = (id)v25;

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v27 = v23[3];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v36 objects:v48 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v37;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v37 != v30) {
              objc_enumerationMutation(v27);
            }
            [*(id *)(*((void *)&v36 + 1) + 8 * v31++) _setParentGroup:v23];
          }
          while (v29 != v31);
          uint64_t v29 = [v27 countByEnumeratingWithState:&v36 objects:v48 count:16];
        }
        while (v29);
      }

      uint64_t v12 = v33;
      id v5 = v34;
    }
  }
  return v8;
}

BOOL __43__HMDAccessorySettingGroup__initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (!v5)
  {
    uint64_t v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type found while decoding accessory setting", (uint8_t *)&v11, 0xCu);
    }
  }

  return v5 != 0;
}

BOOL __43__HMDAccessorySettingGroup__initWithCoder___block_invoke_35(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (!v5)
  {
    uint64_t v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type found while decoding accessory group", (uint8_t *)&v11, 0xCu);
    }
  }

  return v5 != 0;
}

- (HMDAccessorySettingGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = (HMDAccessorySettingGroup *)[(HMDAccessorySettingGroup *)self _initWithCoder:v4];

  return v6;
}

- (id)logIdentifier
{
  id v3 = NSString;
  id v4 = [(HMDAccessorySettingGroup *)self identifier];
  id v5 = [v4 UUIDString];
  uint64_t v6 = [(HMDAccessorySettingGroup *)self name];
  id v7 = [v3 stringWithFormat:@"%@/%@", v5, v6];

  return v7;
}

- (void)removeGroup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    if ([(NSMutableSet *)self->_groups containsObject:v5]) {
      [(NSMutableSet *)self->_groups removeObject:v5];
    }
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v5;
  }
}

- (void)addGroup:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    if (([(NSMutableSet *)self->_groups containsObject:v5] & 1) == 0)
    {
      [(NSMutableSet *)self->_groups addObject:v5];
      [v5 _setParentGroup:self];
    }
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v5;
  }
}

- (void)_setParentGroup:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 identifier];
  parentIdentifier = self->_parentIdentifier;
  self->_parentIdentifier = v5;

  id v7 = [v4 keyPath];
  uint64_t v8 = [(HMDAccessorySettingGroup *)self name];
  uint64_t v9 = [v7 stringByAppendingFormat:@".%@", v8];
  keyPath = self->_keyPath;
  self->_keyPath = v9;

  int v11 = [(NSMutableSet *)self->_groups allObjects];
  uint64_t v12 = [(NSMutableSet *)self->_settings allObjects];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * v17++) _reevaluateParentGroup:self];
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v15);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v18 = v12;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * v22++) setGroup:self];
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v20);
  }
}

- (void)_reevaluateParentGroup:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(HMDAccessorySettingGroup *)self _setParentGroup:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (HMDAccessorySettingGroup)groupWithIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = self->_groups;
  id v7 = (id)[(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v11 = objc_msgSend(v10, "identifier", (void)v14);
        int v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return (HMDAccessorySettingGroup *)v7;
}

- (NSArray)groups
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableSet *)self->_groups allObjects];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)removeSetting:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    if ([(NSMutableSet *)self->_settings containsObject:v5]) {
      [(NSMutableSet *)self->_settings removeObject:v5];
    }
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v5;
  }
}

- (void)addSetting:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    if (([(NSMutableSet *)self->_settings containsObject:v5] & 1) == 0)
    {
      [(NSMutableSet *)self->_settings addObject:v5];
      [v5 setGroup:self];
    }
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v5;
  }
}

- (id)settingWithIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = self->_settings;
  id v7 = (id)[(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v11 = objc_msgSend(v10, "identifier", (void)v14);
        int v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (NSArray)settings
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableSet *)self->_settings allObjects];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (BOOL)isPrivateToDevice
{
  id v3 = [(HMDAccessorySettingGroup *)self name];
  if ([v3 isEqualToString:@"profiles"])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(HMDAccessorySettingGroup *)self name];
    char v4 = [v5 isEqualToString:@"analytics"];
  }
  return v4;
}

- (id)copyReplica
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = [HMDAccessorySettingGroup alloc];
  char v4 = [(HMDAccessorySettingGroup *)self name];
  id v5 = [MEMORY[0x263F08C38] UUID];
  uint64_t v6 = [MEMORY[0x263F08C38] UUID];
  id v7 = [(HMDAccessorySettingGroup *)v3 initWithName:v4 identifier:v5 parentIdentifier:v6];

  uint64_t v8 = [(HMDAccessorySettingGroup *)self dataSource];
  [(HMDAccessorySettingGroup *)v7 setDataSource:v8];

  uint64_t v9 = [MEMORY[0x263EFF980] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v10 = [(HMDAccessorySettingGroup *)self groups];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * v14) copyReplica];
        [v15 _setParentGroup:v7];
        [v9 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v12);
  }

  groups = v7->_groups;
  long long v17 = [MEMORY[0x263EFFA08] setWithArray:v9];
  [(NSMutableSet *)groups setSet:v17];

  id v18 = [MEMORY[0x263EFF980] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v19 = [(HMDAccessorySettingGroup *)self settings];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * v23) copyReplica];
        [v24 setGroup:v7];
        [v18 addObject:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v21);
  }

  settings = v7->_settings;
  long long v26 = [MEMORY[0x263EFFA08] setWithArray:v18];
  [(NSMutableSet *)settings setSet:v26];

  return v7;
}

- (id)copyIdentical
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = [HMDAccessorySettingGroup alloc];
  char v4 = [(HMDAccessorySettingGroup *)self name];
  id v5 = [(HMDAccessorySettingGroup *)self identifier];
  uint64_t v6 = [(HMDAccessorySettingGroup *)self parentIdentifier];
  id v7 = [(HMDAccessorySettingGroup *)v3 initWithName:v4 identifier:v5 parentIdentifier:v6];

  uint64_t v8 = [(HMDAccessorySettingGroup *)self dataSource];
  [(HMDAccessorySettingGroup *)v7 setDataSource:v8];

  uint64_t v9 = [MEMORY[0x263EFF980] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v10 = [(HMDAccessorySettingGroup *)self groups];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * v14) copyIdentical];
        [v15 _setParentGroup:v7];
        [v9 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v12);
  }

  groups = v7->_groups;
  long long v17 = [MEMORY[0x263EFFA08] setWithArray:v9];
  [(NSMutableSet *)groups setSet:v17];

  id v18 = [MEMORY[0x263EFF980] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v19 = [(HMDAccessorySettingGroup *)self settings];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * v23) copyIdentical];
        [v24 setGroup:v7];
        [v18 addObject:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v21);
  }

  settings = v7->_settings;
  long long v26 = [MEMORY[0x263EFFA08] setWithArray:v18];
  [(NSMutableSet *)settings setSet:v26];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (HMDAccessorySettingGroup *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    uint64_t v6 = v5;
    if (v6)
    {
      id v7 = [(HMDAccessorySettingGroup *)self name];
      uint64_t v8 = [(HMDAccessorySettingGroup *)v6 name];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(HMDAccessorySettingGroup *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)_settingWithKeys:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((unint64_t)[v4 count] >= 2)
  {
    uint64_t v6 = [v4 firstObject];
    id v7 = [(HMDAccessorySettingGroup *)self name];
    char v8 = [v7 isEqualToString:v6];

    if (v8)
    {
      uint64_t v9 = [v4 count];
      uint64_t v10 = [v4 objectAtIndex:1];
      if (v9 == 2)
      {
        id v5 = [(HMDAccessorySettingGroup *)self settingWithName:v10];
      }
      else
      {
        long long v15 = [(HMDAccessorySettingGroup *)self subGroupWithName:v10];
        objc_msgSend(v4, "hmf_removeFirstObject");
        id v5 = [v15 _settingWithKeys:v4];
      }
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x230FBD990]();
      uint64_t v12 = self;
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = HMFGetLogIdentifier();
        int v17 = 138543874;
        id v18 = v14;
        __int16 v19 = 2112;
        uint64_t v20 = v6;
        __int16 v21 = 2112;
        uint64_t v22 = v12;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpected group name: %@ for group: %@", (uint8_t *)&v17, 0x20u);
      }
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)settingWithKeyPath:(id)a3
{
  id v4 = [a3 componentsSeparatedByString:@"."];
  id v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [(HMDAccessorySettingGroup *)self _settingWithKeys:v5];

  return v6;
}

- (id)settingWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessorySettingGroup *)self settings];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__HMDAccessorySettingGroup_settingWithName___block_invoke;
  v9[3] = &unk_264A29770;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __44__HMDAccessorySettingGroup_settingWithName___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)subGroupWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessorySettingGroup *)self groups];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__HMDAccessorySettingGroup_subGroupWithName___block_invoke;
  v9[3] = &unk_264A29798;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __45__HMDAccessorySettingGroup_subGroupWithName___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (HMDAccessorySettingGroup)initWithName:(id)a3 identifier:(id)a4 parentIdentifier:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  if (v11)
  {
    v23.receiver = self;
    v23.super_class = (Class)HMDAccessorySettingGroup;
    uint64_t v12 = [(HMDAccessorySettingGroup *)&v23 init];
    if (v12)
    {
      uint64_t v13 = objc_msgSend(v11, "hm_truncatedNameString");
      name = v12->_name;
      v12->_name = (NSString *)v13;

      uint64_t v15 = [v11 copy];
      keyPath = v12->_keyPath;
      v12->_keyPath = (NSString *)v15;

      v12->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v12->_identifier, a4);
      objc_storeStrong((id *)&v12->_parentIdentifier, a5);
      uint64_t v17 = [MEMORY[0x263EFF9C0] set];
      settings = v12->_settings;
      v12->_settings = (NSMutableSet *)v17;

      uint64_t v19 = [MEMORY[0x263EFF9C0] set];
      groups = v12->_groups;
      v12->_groups = (NSMutableSet *)v19;
    }
    self = v12;
    __int16 v21 = self;
  }
  else
  {
    __int16 v21 = 0;
  }

  return v21;
}

- (HMDAccessorySettingGroup)initWithModel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  id v6 = [v4 uuid];
  id v7 = [v4 parentUUID];

  char v8 = [(HMDAccessorySettingGroup *)self initWithName:v5 identifier:v6 parentIdentifier:v7];
  return v8;
}

- (HMDAccessorySettingGroup)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)supportedGroupsClasses
{
  if (supportedGroupsClasses_onceToken != -1) {
    dispatch_once(&supportedGroupsClasses_onceToken, &__block_literal_global_33_211303);
  }
  v2 = (void *)supportedGroupsClasses_supportedGroupsClasses;
  return v2;
}

void __50__HMDAccessorySettingGroup_supportedGroupsClasses__block_invoke()
{
  v4[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)supportedGroupsClasses_supportedGroupsClasses;
  supportedGroupsClasses_supportedGroupsClasses = v2;
}

+ (id)supportedSettingsClasses
{
  if (supportedSettingsClasses_onceToken != -1) {
    dispatch_once(&supportedSettingsClasses_onceToken, &__block_literal_global_29_211306);
  }
  uint64_t v2 = (void *)supportedSettingsClasses_supportedSettingsClasses;
  return v2;
}

void __52__HMDAccessorySettingGroup_supportedSettingsClasses__block_invoke()
{
  v4[2] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)supportedSettingsClasses_supportedSettingsClasses;
  supportedSettingsClasses_supportedSettingsClasses = v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11_211308 != -1) {
    dispatch_once(&logCategory__hmf_once_t11_211308, &__block_literal_global_211309);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v12_211310;
  return v2;
}

void __39__HMDAccessorySettingGroup_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v12_211310;
  logCategory__hmf_once_v12_211310 = v0;
}

@end