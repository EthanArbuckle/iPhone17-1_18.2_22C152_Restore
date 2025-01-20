@interface HAPInterfaceConfig
+ (NSString)activeWifiOrEthernetInterfaceName;
+ (id)interfaceNamesWithFamily:(unsigned int)a3 flags:(unsigned int)a4 eflags:(unint64_t)a5 netTransportType:(unsigned int)a6;
@end

@implementation HAPInterfaceConfig

+ (NSString)activeWifiOrEthernetInterfaceName
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = +[HAPInterfaceConfig interfaceNamesWithFamily:30 flags:34915 eflags:2112 netTransportType:3];
  v4 = [v3 anyObject];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x1D944E080]();
    id v8 = a1;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to find active Wifi or Ethernet interface", (uint8_t *)&v12, 0xCu);
    }
  }

  return (NSString *)v5;
}

+ (id)interfaceNamesWithFamily:(unsigned int)a3 flags:(unsigned int)a4 eflags:(unint64_t)a5 netTransportType:(unsigned int)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  unsigned int UsableInterfaceList = CreateUsableInterfaceList();
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (UsableInterfaceList)
  {
    int v12 = (void *)MEMORY[0x1D944E080]();
    id v13 = a1;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v23 = v15;
      __int16 v24 = 1024;
      unsigned int v25 = UsableInterfaceList;
      _os_log_impl(&dword_1D4758000, v14, OS_LOG_TYPE_ERROR, "%{public}@Error getting interface list %d", buf, 0x12u);
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1D944E080]();
    id v17 = a1;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      v23 = v19;
      __int16 v24 = 1024;
      unsigned int v25 = a4;
      __int16 v26 = 2048;
      unint64_t v27 = a5;
      __int16 v28 = 1024;
      unsigned int v29 = a6;
      _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_INFO, "%{public}@Matching interfaces with flags 0x%x eflags 0x%llx netTransportType 0x%x", buf, 0x22u);
    }
    ReleaseUsableInterfaceList();
  }

  return v11;
}

@end