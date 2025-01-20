@interface HMDMPCSessionData
- (BOOL)playbackArchiveTargetsSystemMediaApplication;
- (HMDMPCSessionData)initWithDictionaryRepresentation:(id)a3 profileSource:(id)a4;
- (HMDMPCSessionData)initWithMediaAction:(id)a3 source:(id)a4 clientName:(id)a5;
- (HMDMPCSessionData)initWithMediaProfiles:(id)a3 playbackState:(id)a4 playbackVolume:(id)a5 playbackArchive:(id)a6 source:(id)a7 clientName:(id)a8;
- (MPPlaybackArchive)playbackArchive;
- (NSNumber)playbackStateNumber;
- (NSNumber)playbackVolumeNumber;
- (NSNumber)source;
- (NSSet)mediaProfiles;
- (NSString)clientName;
- (id)dictionaryRepresentation:(BOOL)a3;
@end

@implementation HMDMPCSessionData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_playbackArchive, 0);
  objc_storeStrong((id *)&self->_playbackVolumeNumber, 0);
  objc_storeStrong((id *)&self->_playbackStateNumber, 0);
  objc_storeStrong((id *)&self->_mediaProfiles, 0);
}

- (NSString)clientName
{
  return self->_clientName;
}

- (NSNumber)source
{
  return self->_source;
}

- (MPPlaybackArchive)playbackArchive
{
  return self->_playbackArchive;
}

- (NSNumber)playbackVolumeNumber
{
  return self->_playbackVolumeNumber;
}

- (NSNumber)playbackStateNumber
{
  return self->_playbackStateNumber;
}

- (NSSet)mediaProfiles
{
  return self->_mediaProfiles;
}

- (BOOL)playbackArchiveTargetsSystemMediaApplication
{
  v2 = [(HMDMPCSessionData *)self playbackArchive];
  v3 = [v2 bundleIdentifier];

  if (v3) {
    char v4 = [v3 hasPrefix:@"com.apple.Music"];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (id)dictionaryRepresentation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = [(HMDMPCSessionData *)self mediaProfiles];
  v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_129022);
  v8 = [v7 allObjects];

  [v5 setObject:v8 forKeyedSubscript:@"HMDMAR.mediaProfiles"];
  v9 = [(HMDMPCSessionData *)self playbackStateNumber];
  [v5 setObject:v9 forKeyedSubscript:@"HMDMAR.state"];

  v10 = [(HMDMPCSessionData *)self playbackVolumeNumber];
  [v5 setObject:v10 forKeyedSubscript:@"HMDMAR.volume"];

  v11 = [(HMDMPCSessionData *)self source];
  [v5 setObject:v11 forKeyedSubscript:@"HMDMAR.actionSource"];

  v12 = [(HMDMPCSessionData *)self clientName];
  [v5 setObject:v12 forKeyedSubscript:@"HMDMAR.actionClientName"];

  v13 = [(HMDMPCSessionData *)self playbackArchive];

  if (v13)
  {
    v14 = (void *)MEMORY[0x1D9452090]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = HMFGetLogIdentifier();
      v18 = [(HMDMPCSessionData *)v15 playbackArchive];
      *(_DWORD *)buf = 138543618;
      v52 = v17;
      __int16 v53 = 2112;
      id v54 = v18;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Encoding playbackArchive: %@", buf, 0x16u);
    }
    v19 = (void *)MEMORY[0x1D9452090]();
    v20 = v15;
    v21 = HMFGetOSLogHandle();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v22)
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v52 = v23;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Encoding playbackArchive in entirety", buf, 0xCu);
      }
      v24 = (void *)MEMORY[0x1E4F28DB0];
      v25 = [(HMDMPCSessionData *)v20 playbackArchive];
      id v50 = 0;
      v26 = [v24 archivedDataWithRootObject:v25 requiringSecureCoding:1 error:&v50];
      id v27 = v50;

      if (v26)
      {
        [v5 setObject:v26 forKeyedSubscript:@"HMDMAR.archive"];
      }
      else
      {
        v44 = (void *)MEMORY[0x1D9452090]();
        v45 = v20;
        v46 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v52 = v47;
          __int16 v53 = 2112;
          id v54 = v27;
          _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_ERROR, "%{public}@Couldn't encode playbackArchive: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      if (v22)
      {
        v28 = HMFGetLogIdentifier();
        v29 = [(HMDMPCSessionData *)v20 playbackArchive];
        *(_DWORD *)buf = 138543618;
        v52 = v28;
        __int16 v53 = 2112;
        id v54 = v29;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Encoding playbackArchive session identifier: %@", buf, 0x16u);
      }
      v30 = [(HMDMPCSessionData *)v20 playbackArchive];
      v31 = [v30 playbackSessionIdentifier];
      [v5 setObject:v31 forKeyedSubscript:@"HMDMAR.pbsid"];

      v32 = [(HMDMPCSessionData *)v20 playbackArchive];
      unint64_t v33 = [v32 supportedOptions];

      uint64_t v34 = 0;
      uint64_t v35 = 1;
      do
      {
        v36 = [(HMDMPCSessionData *)v20 playbackArchive];
        uint64_t v37 = [v36 BOOLValueForOption:v35 - 1];

        v34 |= v37 << (v35 - 1);
      }
      while (v33 >> v35++);
      v39 = (void *)MEMORY[0x1D9452090]();
      v40 = v20;
      v41 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v42 = HMFGetLogIdentifier();
        v43 = [NSNumber numberWithUnsignedInteger:v34];
        *(_DWORD *)buf = 138543618;
        v52 = v42;
        __int16 v53 = 2112;
        id v54 = v43;
        _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@Encoding playbackArchive options: %@", buf, 0x16u);
      }
      id v27 = [NSNumber numberWithUnsignedInteger:v34];
      [v5 setObject:v27 forKeyedSubscript:@"HMDMAR.pbao"];
    }
  }
  v48 = (void *)[v5 copy];

  return v48;
}

id __46__HMDMPCSessionData_dictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 uniqueIdentifier];
  BOOL v3 = [v2 UUIDString];

  return v3;
}

- (HMDMPCSessionData)initWithMediaAction:(id)a3 source:(id)a4 clientName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if ([v8 state])
  {
    v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "state"));
  }
  else
  {
    v11 = 0;
  }
  v12 = [v8 mediaProfiles];
  v13 = [v8 volume];
  v14 = [v8 playbackArchive];
  v15 = [(HMDMPCSessionData *)self initWithMediaProfiles:v12 playbackState:v11 playbackVolume:v13 playbackArchive:v14 source:v10 clientName:v9];

  return v15;
}

- (HMDMPCSessionData)initWithDictionaryRepresentation:(id)a3 profileSource:(id)a4
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v66 = v5;
  v7 = objc_msgSend(v5, "hmf_arrayForKey:", @"HMDMAR.mediaProfiles");
  id v8 = v6;
  id v9 = v7;
  v70 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v9, "count"));
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v73 objects:v81 count:16];
  id v68 = v8;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v74 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v73 + 1) + 8 * i);
        v15 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v14];
        v16 = [v8 mediaProfileWithUUID:v15];
        if (v16)
        {
          [v70 addObject:v16];
        }
        else
        {
          v17 = (void *)MEMORY[0x1D9452090]();
          v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v78 = v19;
            __int16 v79 = 2112;
            uint64_t v80 = v14;
            _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not map profile UUID (%@) to MediaProfile", buf, 0x16u);

            id v8 = v68;
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v73 objects:v81 count:16];
    }
    while (v11);
  }

  v67 = (void *)[v70 copy];
  v64 = objc_msgSend(v66, "hmf_numberForKey:", @"HMDMAR.state");
  v63 = objc_msgSend(v66, "hmf_numberForKey:", @"HMDMAR.volume");
  v20 = objc_msgSend(v66, "hmf_dataForKey:", @"HMDMAR.archive");
  uint64_t v21 = objc_msgSend(v66, "hmf_stringForKey:", @"HMDMAR.pbsid");
  uint64_t v22 = objc_msgSend(v66, "hmf_numberForKey:", @"HMDMAR.actionSource");
  v23 = (void *)v22;
  v24 = &unk_1F2DC8D88;
  if (v22) {
    v24 = (void *)v22;
  }
  id v62 = v24;

  uint64_t v25 = objc_msgSend(v66, "hmf_stringForKey:", @"HMDMAR.actionClientName");
  v26 = (void *)v25;
  id v27 = @"Unknown";
  if (v25) {
    id v27 = (__CFString *)v25;
  }
  v28 = v27;

  v71 = (void *)v21;
  if (v20)
  {
    v29 = (void *)MEMORY[0x1D9452090]();
    v30 = self;
    v31 = self;
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      unint64_t v33 = HMFGetLogIdentifier();
      *(_DWORD *)v81 = 138543618;
      v82 = v33;
      __int16 v83 = 2112;
      uint64_t v84 = (uint64_t)v20;
      _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_INFO, "%{public}@Decoding playbackArchive in entirety: %@", v81, 0x16u);

      id v8 = v68;
    }

    id v72 = 0;
    uint64_t v34 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v20 error:&v72];
    id v35 = v72;
    if (!v34)
    {
      v36 = (void *)MEMORY[0x1D9452090]();
      uint64_t v37 = v31;
      v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = HMFGetLogIdentifier();
        *(_DWORD *)v81 = 138543618;
        v82 = v39;
        __int16 v83 = 2112;
        uint64_t v84 = (uint64_t)v35;
        _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode playbackArchive: %@", v81, 0x16u);
      }
      id v8 = v68;
    }
  }
  else
  {
    v40 = (void *)MEMORY[0x1D9452090]();
    v30 = self;
    v41 = self;
    v42 = HMFGetOSLogHandle();
    BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_INFO);
    if (v21)
    {
      if (v43)
      {
        v44 = HMFGetLogIdentifier();
        *(_DWORD *)v81 = 138543618;
        v82 = v44;
        __int16 v83 = 2112;
        uint64_t v84 = v21;
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Decoding playbackArchive session identifier: %@", v81, 0x16u);
      }
      v61 = [v8 home];
      uint64_t v34 = [v61 playbackArchiveWithSessionIdentifier:v21];
      if (v34)
      {
        v45 = objc_msgSend(v66, "hmf_numberForKey:", @"HMDMAR.pbao");
        unint64_t v46 = [v45 unsignedIntegerValue];

        uint64_t v47 = 1;
        do
          uint64_t v48 = objc_msgSend(v34, "setBOOLValue:forOption:", (v46 >> (v47 - 1)) & 1);
        while (v46 >> v47++);
        context = (void *)MEMORY[0x1D9452090](v48);
        id v50 = v41;
        v51 = HMFGetOSLogHandle();
        v52 = v61;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          __int16 v53 = HMFGetLogIdentifier();
          id v54 = [NSNumber numberWithUnsignedInteger:v46];
          *(_DWORD *)v81 = 138543874;
          v82 = v53;
          __int16 v83 = 2112;
          uint64_t v84 = (uint64_t)v34;
          __int16 v85 = 2112;
          v86 = v54;
          _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_INFO, "%{public}@Decoding playbackArchive: %@ options: %@", v81, 0x20u);
        }
        id v8 = v68;
      }
      else
      {
        context = (void *)MEMORY[0x1D9452090]();
        v56 = v41;
        v51 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          v57 = HMFGetLogIdentifier();
          *(_DWORD *)v81 = 138543618;
          v82 = v57;
          __int16 v83 = 2112;
          v52 = v61;
          uint64_t v84 = (uint64_t)v61;
          _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode playbackArchive session identifier. home %@", v81, 0x16u);
        }
        else
        {
          v52 = v61;
        }
      }
    }
    else
    {
      if (v43)
      {
        uint64_t v55 = HMFGetLogIdentifier();
        *(_DWORD *)v81 = 138543362;
        v82 = v55;
        _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@Key to playbackArchive not found", v81, 0xCu);
      }
      uint64_t v34 = 0;
    }
  }
  v58 = [(HMDMPCSessionData *)v30 initWithMediaProfiles:v67 playbackState:v64 playbackVolume:v63 playbackArchive:v34 source:v62 clientName:v28];

  return v58;
}

- (HMDMPCSessionData)initWithMediaProfiles:(id)a3 playbackState:(id)a4 playbackVolume:(id)a5 playbackArchive:(id)a6 source:(id)a7 clientName:(id)a8
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v36 = a7;
  id v35 = a8;
  if (![v15 count])
  {
    v19 = (void *)MEMORY[0x1D9452090]();
    v20 = self;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v39 = v22;
      v23 = "%{public}@No media profiles";
      goto LABEL_9;
    }
LABEL_10:

    v24 = 0;
    goto LABEL_16;
  }
  if (!v16 && !v17 && !v18)
  {
    v19 = (void *)MEMORY[0x1D9452090]();
    v20 = self;
    uint64_t v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v39 = v22;
      v23 = "%{public}@No action contained in HMDMPCSessionData";
LABEL_9:
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v37.receiver = self;
  v37.super_class = (Class)HMDMPCSessionData;
  uint64_t v25 = [(HMDMPCSessionData *)&v37 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_mediaProfiles, a3);
    objc_storeStrong((id *)&v26->_playbackStateNumber, a4);
    objc_storeStrong((id *)&v26->_playbackVolumeNumber, a5);
    uint64_t v27 = [v18 copyWithOptions:12];
    playbackArchive = v26->_playbackArchive;
    v26->_playbackArchive = (MPPlaybackArchive *)v27;

    objc_storeStrong((id *)&v26->_source, a7);
    objc_storeStrong((id *)&v26->_clientName, a8);
    v29 = (void *)MEMORY[0x1D9452090]();
    v30 = v26;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = HMFGetLogIdentifier();
      unint64_t v33 = v26->_playbackArchive;
      *(_DWORD *)buf = 138543618;
      v39 = v32;
      __int16 v40 = 2112;
      v41 = v33;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@HMDMPCSessionData initialized with playbackArchive: %@", buf, 0x16u);
    }
  }
  v20 = v26;
  v24 = v20;
LABEL_16:

  return v24;
}

@end