@interface HUPresenceUserOptionItem
- (HFUserItem)userItem;
- (HULocationDeviceManager)locationDeviceManager;
- (HUPresenceCurrentUserLocationDevice)selectedLocationDevice;
- (HUPresenceUserOptionItem)initWithUserItem:(id)a3 selectedLocationDevice:(id)a4 locationDeviceManager:(id)a5;
- (id)_subclass_updateWithOptions:(id)a3;
- (void)setSelectedLocationDevice:(id)a3;
@end

@implementation HUPresenceUserOptionItem

- (HUPresenceUserOptionItem)initWithUserItem:(id)a3 selectedLocationDevice:(id)a4 locationDeviceManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HUPresenceUserOptionItem;
  v12 = [(HUPresenceUserOptionItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userItem, a3);
    objc_storeStrong((id *)&v13->_selectedLocationDevice, a4);
    objc_storeStrong((id *)&v13->_locationDeviceManager, a5);
  }

  return v13;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(HUPresenceUserOptionItem *)self userItem];
  v6 = [v5 updateWithOptions:v4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__HUPresenceUserOptionItem__subclass_updateWithOptions___block_invoke;
  v10[3] = &unk_1E638CEC0;
  id v11 = v4;
  v12 = self;
  id v7 = v4;
  v8 = [v6 flatMap:v10];

  return v8;
}

id __56__HUPresenceUserOptionItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F68C78]];
  if ([v4 type]
    || ([*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F68720]],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 BOOLValue],
        v5,
        v6))
  {
    id v7 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__HUPresenceUserOptionItem__subclass_updateWithOptions___block_invoke_2;
    v17[3] = &unk_1E6385000;
    v17[4] = *(void *)(a1 + 40);
    id v9 = __56__HUPresenceUserOptionItem__subclass_updateWithOptions___block_invoke_2((uint64_t)v17);
    id v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v4;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_INFO, "fetching activeLocationDevice for current user: %@", buf, 0xCu);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__HUPresenceUserOptionItem__subclass_updateWithOptions___block_invoke_4;
    v15[3] = &unk_1E6387F70;
    id v11 = v3;
    id v16 = v11;
    v12 = [v9 flatMap:v15];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__HUPresenceUserOptionItem__subclass_updateWithOptions___block_invoke_10;
    v13[3] = &unk_1E6387340;
    id v14 = v11;
    id v7 = [v12 recover:v13];
  }

  return v7;
}

id __56__HUPresenceUserOptionItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) selectedLocationDevice];
  uint64_t v3 = [v2 type];

  switch(v3)
  {
    case 2:
      int v6 = (void *)MEMORY[0x1E4F7A0D8];
      id v7 = [HULocationDevice alloc];
      id v4 = [*(id *)(a1 + 32) selectedLocationDevice];
      v8 = [v4 customDevice];
      id v9 = [(HULocationDevice *)v7 initWithHMDevice:v8];
      id v10 = [v6 futureWithResult:v9];

      goto LABEL_9;
    case 1:
      id v4 = [*(id *)(a1 + 32) locationDeviceManager];
      uint64_t v5 = [v4 thisDeviceFuture];
      goto LABEL_7;
    case 0:
      id v4 = [*(id *)(a1 + 32) locationDeviceManager];
      uint64_t v5 = [v4 activeLocationDeviceFuture];
LABEL_7:
      id v10 = (void *)v5;
      goto LABEL_9;
  }
  id v11 = NSNumber;
  id v4 = [*(id *)(a1 + 32) selectedLocationDevice];
  v12 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v4, "type"));
  NSLog(&cfstr_UnknownDeviceT.isa, v12);

  id v10 = 0;
LABEL_9:

  return v10;
}

id __56__HUPresenceUserOptionItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_INFO, "activeLocationDevice for current user: %@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v5 = [*(id *)(a1 + 32) results];
  int v6 = (void *)[v5 mutableCopy];

  if ([v3 isCurrentDevice]) {
    HULocalizedModelString(@"HULocationDeviceCurrentDevice");
  }
  else {
  id v7 = [v3 name];
  }
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  v8 = (void *)MEMORY[0x1E4F7A0D8];
  id v9 = [MEMORY[0x1E4F69228] outcomeWithResults:v6];
  id v10 = [v8 futureWithResult:v9];

  return v10;
}

id __56__HUPresenceUserOptionItem__subclass_updateWithOptions___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "failed to get activeLocationDevice for current user; error: %@",
      (uint8_t *)&v7,
      0xCu);
  }

  uint64_t v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];

  return v5;
}

- (HFUserItem)userItem
{
  return self->_userItem;
}

- (HULocationDeviceManager)locationDeviceManager
{
  return self->_locationDeviceManager;
}

- (HUPresenceCurrentUserLocationDevice)selectedLocationDevice
{
  return self->_selectedLocationDevice;
}

- (void)setSelectedLocationDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedLocationDevice, 0);
  objc_storeStrong((id *)&self->_locationDeviceManager, 0);

  objc_storeStrong((id *)&self->_userItem, 0);
}

@end