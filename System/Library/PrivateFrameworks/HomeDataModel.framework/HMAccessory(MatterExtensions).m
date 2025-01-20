@interface HMAccessory(MatterExtensions)
- (id)hdm_matterDevice;
@end

@implementation HMAccessory(MatterExtensions)

- (id)hdm_matterDevice
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = objc_getAssociatedObject(a1, a2);
  if (!v4)
  {
    v5 = [a1 home];
    v6 = objc_msgSend(v5, "hdm_sharedMatterController");

    v4 = objc_msgSend(a1, "hdm_createDeviceWithController:", v6);
    if (!v4)
    {
      v7 = matterLogCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v9 = [a1 matterNodeID];
        v10 = [a1 home];
        int v11 = 138413058;
        v12 = v9;
        __int16 v13 = 2112;
        v14 = a1;
        __int16 v15 = 2112;
        v16 = v6;
        __int16 v17 = 2112;
        v18 = v10;
        _os_log_error_impl(&dword_2519F3000, v7, OS_LOG_TYPE_ERROR, "hdm_matterDevice: Failed to create matter device for nodeID: (%@) accessory (%@) controller: (%@) in home: (%@)", (uint8_t *)&v11, 0x2Au);
      }
    }
    objc_setAssociatedObject(a1, a2, v4, (void *)1);
  }
  return v4;
}

@end