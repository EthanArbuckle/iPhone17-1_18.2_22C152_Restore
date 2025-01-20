@interface HMResidentDevice
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)isCurrentDevice;
- (BOOL)isEnabled;
- (BOOL)mergeFromNewObject:(id)a3;
- (BOOL)supportsResidentSelection;
- (HMDevice)device;
- (HMHome)home;
- (HMResidentDevice)init;
- (HMResidentDevice)initWithCoder:(id)a3;
- (HMResidentDeviceDelegate)delegate;
- (NSArray)attributeDescriptions;
- (NSData)deviceIRKData;
- (NSString)IDSDestination;
- (NSString)description;
- (NSString)name;
- (NSString)residentName;
- (NSString)shortDescription;
- (NSUUID)IDSIdentifier;
- (NSUUID)uniqueIdentifier;
- (NSUUID)uuid;
- (_HMContext)context;
- (id)logIdentifier;
- (unint64_t)capabilities;
- (unint64_t)status;
- (void)__configureWithContext:(id)a3 home:(id)a4;
- (void)_unconfigure;
- (void)handleRuntimeStateUpdate:(id)a3;
- (void)setCapabilities:(unint64_t)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceIRKData:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setIDSDestination:(id)a3;
- (void)setIDSIdentifier:(id)a3;
- (void)setResidentName:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setSupportsResidentSelection:(BOOL)a3;
- (void)updatedEnabled:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation HMResidentDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deviceIRKData, 0);
  objc_storeStrong((id *)&self->_residentName, 0);
  objc_storeStrong((id *)&self->_IDSDestination, 0);
  objc_storeStrong((id *)&self->_IDSIdentifier, 0);
  objc_destroyWeak((id *)&self->_home);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setContext:(id)a3
{
}

- (_HMContext)context
{
  return self->_context;
}

- (void)setSupportsResidentSelection:(BOOL)a3
{
  self->_supportsResidentSelection = a3;
}

- (BOOL)supportsResidentSelection
{
  return self->_supportsResidentSelection;
}

- (HMDevice)device
{
  return (HMDevice *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDelegate:(id)a3
{
}

- (HMResidentDeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMResidentDeviceDelegate *)WeakRetained;
}

- (id)logIdentifier
{
  v2 = [(HMResidentDevice *)self uniqueIdentifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (NSArray)attributeDescriptions
{
  v27[7] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v26 = [(HMResidentDevice *)self device];
  v25 = (void *)[v3 initWithName:@"Device" value:v26];
  v27[0] = v25;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v24 = [(HMResidentDevice *)self uniqueIdentifier];
  v23 = (void *)[v4 initWithName:@"Identifier" value:v24];
  v27[1] = v23;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v22 = [(HMResidentDevice *)self uuid];
  v21 = [MEMORY[0x1E4F65538] defaultFormatter];
  v6 = (void *)[v5 initWithName:@"UUID" value:v22 options:0 formatter:v21];
  v27[2] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMResidentDevice *)self isEnabled];
  v8 = HMFBooleanToString();
  v9 = (void *)[v7 initWithName:@"Enabled" value:v8];
  v27[3] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = HMResidentDeviceStatusDescription([(HMResidentDevice *)self status]);
  v12 = (void *)[v10 initWithName:@"Status" value:v11];
  v27[4] = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  v14 = HMResidentDeviceCapabilitiesDescription([(HMResidentDevice *)self capabilities]);
  v15 = (void *)[v13 initWithName:@"Capabilities" value:v14];
  v27[5] = v15;
  id v16 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMResidentDevice *)self supportsResidentSelection];
  v17 = HMFBooleanToString();
  v18 = (void *)[v16 initWithName:@"Supports Resident Selection" value:v17];
  v27[6] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:7];

  return (NSArray *)v19;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = [(HMResidentDevice *)self uniqueIdentifier];
  id v3 = [v2 UUIDString];

  return (NSString *)v3;
}

- (void)handleRuntimeStateUpdate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMResidentDevice *)self context];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__HMResidentDevice_handleRuntimeStateUpdate___block_invoke;
    v12[3] = &unk_1E5945628;
    id v13 = v4;
    v14 = self;
    dispatch_async(v7, v12);
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v16 = v11;
      __int16 v17 = 2080;
      v18 = "-[HMResidentDevice handleRuntimeStateUpdate:]";
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);
    }
  }
}

void __45__HMResidentDevice_handleRuntimeStateUpdate___block_invoke(uint64_t a1)
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "hmf_BOOLForKey:", @"enabled");
  if (v2 != [*(id *)(a1 + 40) isEnabled])
  {
    id v3 = (void *)MEMORY[0x19F3A64A0]();
    id v4 = *(id *)(a1 + 40);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = HMFGetLogIdentifier();
      [*(id *)(a1 + 40) isEnabled];
      id v7 = HMFBooleanToString();
      v8 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      v88 = v6;
      __int16 v89 = 2112;
      v90 = v7;
      __int16 v91 = 2112;
      v92 = v8;
      _os_log_impl(&dword_19D1A8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@<Runtime> Updating enabled from %@ to %@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) setEnabled:v2];
    v9 = [*(id *)(a1 + 40) delegate];
    if (objc_opt_respondsToSelector())
    {
      id v10 = (void *)MEMORY[0x19F3A64A0]();
      id v11 = *(id *)(a1 + 40);
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = HMFGetLogIdentifier();
        [*(id *)(a1 + 40) isEnabled];
        v14 = HMFBooleanToString();
        *(_DWORD *)buf = 138543618;
        v88 = v13;
        __int16 v89 = 2112;
        v90 = v14;
        _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@<Runtime> Notifying client of updated enabled value: %@", buf, 0x16u);
      }
      v15 = [*(id *)(a1 + 40) context];
      id v16 = [v15 delegateCaller];
      v83[0] = MEMORY[0x1E4F143A8];
      v83[1] = 3221225472;
      v83[2] = __45__HMResidentDevice_handleRuntimeStateUpdate___block_invoke_181;
      v83[3] = &unk_1E5944D60;
      id v17 = v9;
      uint64_t v18 = *(void *)(a1 + 40);
      id v84 = v17;
      uint64_t v85 = v18;
      char v86 = v2;
      [v16 invokeBlock:v83];
    }
  }
  uint64_t v19 = objc_msgSend(*(id *)(a1 + 32), "hmf_numberForKey:", @"status");
  unint64_t v20 = [v19 unsignedIntegerValue];

  if ([*(id *)(a1 + 40) status] != v20)
  {
    v21 = (void *)MEMORY[0x19F3A64A0]();
    id v22 = *(id *)(a1 + 40);
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = HMFGetLogIdentifier();
      v25 = HMResidentDeviceStatusDescription([*(id *)(a1 + 40) status]);
      v26 = HMResidentDeviceStatusDescription(v20);
      *(_DWORD *)buf = 138543874;
      v88 = v24;
      __int16 v89 = 2112;
      v90 = v25;
      __int16 v91 = 2112;
      v92 = v26;
      _os_log_impl(&dword_19D1A8000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@<Runtime> Updating status from %@ to %@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) setStatus:v20];
    v27 = [*(id *)(a1 + 40) delegate];
    if (objc_opt_respondsToSelector())
    {
      v28 = (void *)MEMORY[0x19F3A64A0]();
      id v29 = *(id *)(a1 + 40);
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = HMFGetLogIdentifier();
        v32 = HMResidentDeviceStatusDescription([*(id *)(a1 + 40) status]);
        *(_DWORD *)buf = 138543618;
        v88 = v31;
        __int16 v89 = 2112;
        v90 = v32;
        _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_INFO, "%{public}@<Runtime> Notifying client of updated status: %@", buf, 0x16u);
      }
      v33 = [*(id *)(a1 + 40) context];
      v34 = [v33 delegateCaller];
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __45__HMResidentDevice_handleRuntimeStateUpdate___block_invoke_182;
      v79[3] = &unk_1E5945160;
      id v35 = v27;
      uint64_t v36 = *(void *)(a1 + 40);
      id v80 = v35;
      uint64_t v81 = v36;
      unint64_t v82 = v20;
      [v34 invokeBlock:v79];
    }
  }
  v37 = objc_msgSend(*(id *)(a1 + 32), "hmf_numberForKey:", @"capabilities");
  unint64_t v38 = [v37 unsignedIntegerValue];

  if ([*(id *)(a1 + 40) capabilities] != v38)
  {
    v39 = (void *)MEMORY[0x19F3A64A0]();
    id v40 = *(id *)(a1 + 40);
    v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = HMFGetLogIdentifier();
      v43 = HMResidentDeviceCapabilitiesDescription([*(id *)(a1 + 40) capabilities]);
      v44 = HMResidentDeviceCapabilitiesDescription(v38);
      *(_DWORD *)buf = 138543874;
      v88 = v42;
      __int16 v89 = 2112;
      v90 = v43;
      __int16 v91 = 2112;
      v92 = v44;
      _os_log_impl(&dword_19D1A8000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@<Runtime> Updating capabilities from %@ to %@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) setCapabilities:v38];
    v45 = [*(id *)(a1 + 40) delegate];
    if (objc_opt_respondsToSelector())
    {
      v46 = (void *)MEMORY[0x19F3A64A0]();
      id v47 = *(id *)(a1 + 40);
      v48 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        v49 = HMFGetLogIdentifier();
        v50 = HMResidentDeviceCapabilitiesDescription([*(id *)(a1 + 40) capabilities]);
        *(_DWORD *)buf = 138543618;
        v88 = v49;
        __int16 v89 = 2112;
        v90 = v50;
        _os_log_impl(&dword_19D1A8000, v48, OS_LOG_TYPE_INFO, "%{public}@<Runtime> Notifying client of updated capabilities: %@", buf, 0x16u);
      }
      v51 = [*(id *)(a1 + 40) context];
      v52 = [v51 delegateCaller];
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __45__HMResidentDevice_handleRuntimeStateUpdate___block_invoke_183;
      v75[3] = &unk_1E5945160;
      id v53 = v45;
      uint64_t v54 = *(void *)(a1 + 40);
      id v76 = v53;
      uint64_t v77 = v54;
      unint64_t v78 = v38;
      [v52 invokeBlock:v75];
    }
  }
  uint64_t v55 = objc_msgSend(*(id *)(a1 + 32), "hmf_BOOLForKey:", @"supportsResidentSelection");
  if (v55 != [*(id *)(a1 + 40) supportsResidentSelection])
  {
    v56 = (void *)MEMORY[0x19F3A64A0]();
    id v57 = *(id *)(a1 + 40);
    v58 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = HMFGetLogIdentifier();
      [*(id *)(a1 + 40) supportsResidentSelection];
      v60 = HMFBooleanToString();
      v61 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      v88 = v59;
      __int16 v89 = 2112;
      v90 = v60;
      __int16 v91 = 2112;
      v92 = v61;
      _os_log_impl(&dword_19D1A8000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@<Runtime> Updating supportsResidentSelection from %@ to %@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) setSupportsResidentSelection:v55];
    v62 = [*(id *)(a1 + 40) delegate];
    if (objc_opt_respondsToSelector())
    {
      v63 = (void *)MEMORY[0x19F3A64A0]();
      id v64 = *(id *)(a1 + 40);
      v65 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        v66 = HMFGetLogIdentifier();
        [*(id *)(a1 + 40) supportsResidentSelection];
        v67 = HMFBooleanToString();
        *(_DWORD *)buf = 138543618;
        v88 = v66;
        __int16 v89 = 2112;
        v90 = v67;
        _os_log_impl(&dword_19D1A8000, v65, OS_LOG_TYPE_INFO, "%{public}@<Runtime> Notifying client of updated supportsResidentSelection value: %@", buf, 0x16u);
      }
      v68 = [*(id *)(a1 + 40) context];
      v69 = [v68 delegateCaller];
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __45__HMResidentDevice_handleRuntimeStateUpdate___block_invoke_184;
      v72[3] = &unk_1E5945628;
      id v70 = v62;
      uint64_t v71 = *(void *)(a1 + 40);
      id v73 = v70;
      uint64_t v74 = v71;
      [v69 invokeBlock:v72];
    }
  }
}

uint64_t __45__HMResidentDevice_handleRuntimeStateUpdate___block_invoke_181(uint64_t a1)
{
  return [*(id *)(a1 + 32) residentDevice:*(void *)(a1 + 40) didUpdateEnabled:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __45__HMResidentDevice_handleRuntimeStateUpdate___block_invoke_182(uint64_t a1)
{
  return [*(id *)(a1 + 32) residentDevice:*(void *)(a1 + 40) didUpdateStatus:*(void *)(a1 + 48)];
}

uint64_t __45__HMResidentDevice_handleRuntimeStateUpdate___block_invoke_183(uint64_t a1)
{
  return [*(id *)(a1 + 32) residentDevice:*(void *)(a1 + 40) didUpdateCapabilities:*(void *)(a1 + 48)];
}

uint64_t __45__HMResidentDevice_handleRuntimeStateUpdate___block_invoke_184(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateSupportedCapabilitiesForResidentDevice:*(void *)(a1 + 40)];
}

- (BOOL)mergeFromNewObject:(id)a3
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [v6 name];
    v8 = [(HMResidentDevice *)self name];
    char v9 = [v8 isEqualToString:v7];
    char v10 = v9 ^ 1;

    if ((v9 & 1) == 0)
    {
      id v11 = (void *)MEMORY[0x19F3A64A0]();
      v12 = self;
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = HMFGetLogIdentifier();
        v15 = [(HMResidentDevice *)v12 name];
        *(_DWORD *)buf = 138543874;
        v98 = v14;
        __int16 v99 = 2112;
        v100 = v15;
        __int16 v101 = 2112;
        v102 = v7;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@<Merge> Updating name from %@ to %@", buf, 0x20u);
      }
      id v16 = [(HMResidentDevice *)v12 delegate];
      if (objc_opt_respondsToSelector())
      {
        id v17 = [(HMResidentDevice *)v12 context];
        uint64_t v18 = [v17 queue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __39__HMResidentDevice_mergeFromNewObject___block_invoke;
        block[3] = &unk_1E5945650;
        block[4] = v12;
        id v95 = v16;
        id v96 = v7;
        dispatch_async(v18, block);
      }
    }

    uint64_t v19 = [v6 residentName];
    unint64_t v20 = [(HMResidentDevice *)self residentName];
    char v21 = HMFEqualObjects();

    if ((v21 & 1) == 0)
    {
      id v22 = (void *)MEMORY[0x19F3A64A0]();
      v23 = self;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = HMFGetLogIdentifier();
        v26 = [(HMResidentDevice *)v23 residentName];
        *(_DWORD *)buf = 138543874;
        v98 = v25;
        __int16 v99 = 2112;
        v100 = v26;
        __int16 v101 = 2112;
        v102 = v19;
        _os_log_impl(&dword_19D1A8000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@<Merge> Updating resident name from %@ to %@", buf, 0x20u);
      }
      [(HMResidentDevice *)v23 setResidentName:v19];
      char v10 = 1;
    }

    uint64_t v27 = [v6 isEnabled];
    if (v27 != [(HMResidentDevice *)self isEnabled])
    {
      v28 = (void *)MEMORY[0x19F3A64A0]();
      id v29 = self;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = HMFGetLogIdentifier();
        [(HMResidentDevice *)v29 isEnabled];
        v32 = HMFBooleanToString();
        v33 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        v98 = v31;
        __int16 v99 = 2112;
        v100 = v32;
        __int16 v101 = 2112;
        v102 = v33;
        _os_log_impl(&dword_19D1A8000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@<Merge> Updating enabled from %@ to %@", buf, 0x20u);
      }
      [(HMResidentDevice *)v29 setEnabled:v27];
      v34 = [(HMResidentDevice *)v29 delegate];
      if (objc_opt_respondsToSelector())
      {
        id v35 = [(HMResidentDevice *)v29 context];
        uint64_t v36 = [v35 queue];
        v91[0] = MEMORY[0x1E4F143A8];
        v91[1] = 3221225472;
        v91[2] = __39__HMResidentDevice_mergeFromNewObject___block_invoke_167;
        v91[3] = &unk_1E5944D60;
        v91[4] = v29;
        id v92 = v34;
        char v93 = v27;
        dispatch_async(v36, v91);
      }
      char v10 = 1;
    }
    unint64_t v37 = [v6 status];
    if ([(HMResidentDevice *)self status] != v37)
    {
      unint64_t v38 = (void *)MEMORY[0x19F3A64A0]();
      v39 = self;
      id v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = HMFGetLogIdentifier();
        v42 = HMResidentDeviceStatusDescription([(HMResidentDevice *)v39 status]);
        v43 = HMResidentDeviceStatusDescription(v37);
        *(_DWORD *)buf = 138543874;
        v98 = v41;
        __int16 v99 = 2112;
        v100 = v42;
        __int16 v101 = 2112;
        v102 = v43;
        _os_log_impl(&dword_19D1A8000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@<Merge> Updating status from %@ to %@", buf, 0x20u);
      }
      [(HMResidentDevice *)v39 setStatus:v37];
      v44 = [(HMResidentDevice *)v39 delegate];
      if (objc_opt_respondsToSelector())
      {
        v45 = [(HMResidentDevice *)v39 context];
        v46 = [v45 queue];
        v88[0] = MEMORY[0x1E4F143A8];
        v88[1] = 3221225472;
        v88[2] = __39__HMResidentDevice_mergeFromNewObject___block_invoke_171;
        v88[3] = &unk_1E5945160;
        v88[4] = v39;
        id v89 = v44;
        unint64_t v90 = v37;
        dispatch_async(v46, v88);
      }
      char v10 = 1;
    }
    unint64_t v47 = [v6 capabilities];
    if ([(HMResidentDevice *)self capabilities] != v47)
    {
      v48 = (void *)MEMORY[0x19F3A64A0]();
      v49 = self;
      v50 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = HMFGetLogIdentifier();
        v52 = HMResidentDeviceCapabilitiesDescription([(HMResidentDevice *)v49 capabilities]);
        id v53 = HMResidentDeviceCapabilitiesDescription(v47);
        *(_DWORD *)buf = 138543874;
        v98 = v51;
        __int16 v99 = 2112;
        v100 = v52;
        __int16 v101 = 2112;
        v102 = v53;
        _os_log_impl(&dword_19D1A8000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@<Merge> Updating capabilities from %@ to %@", buf, 0x20u);
      }
      [(HMResidentDevice *)v49 setCapabilities:v47];
      uint64_t v54 = [(HMResidentDevice *)v49 delegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v55 = [(HMResidentDevice *)v49 context];
        v56 = [v55 queue];
        v85[0] = MEMORY[0x1E4F143A8];
        v85[1] = 3221225472;
        v85[2] = __39__HMResidentDevice_mergeFromNewObject___block_invoke_175;
        v85[3] = &unk_1E5945160;
        v85[4] = v49;
        id v86 = v54;
        unint64_t v87 = v47;
        dispatch_async(v56, v85);
      }
      char v10 = 1;
    }
    uint64_t v57 = [v6 supportsResidentSelection];
    if (v57 != [(HMResidentDevice *)self supportsResidentSelection])
    {
      v58 = (void *)MEMORY[0x19F3A64A0]();
      v59 = self;
      v60 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = HMFGetLogIdentifier();
        [(HMResidentDevice *)v59 supportsResidentSelection];
        v62 = HMFBooleanToString();
        v63 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        v98 = v61;
        __int16 v99 = 2112;
        v100 = v62;
        __int16 v101 = 2112;
        v102 = v63;
        _os_log_impl(&dword_19D1A8000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@<Merge> Updating supportsResidentSelection from %@ to %@", buf, 0x20u);
      }
      [(HMResidentDevice *)v59 setSupportsResidentSelection:v57];
      id v64 = [(HMResidentDevice *)v59 delegate];
      if (objc_opt_respondsToSelector())
      {
        v65 = [(HMResidentDevice *)v59 context];
        v66 = [v65 queue];
        uint64_t v79 = MEMORY[0x1E4F143A8];
        uint64_t v80 = 3221225472;
        uint64_t v81 = __39__HMResidentDevice_mergeFromNewObject___block_invoke_179;
        unint64_t v82 = &unk_1E5945628;
        v83 = v59;
        id v84 = v64;
        dispatch_async(v66, &v79);
      }
      char v10 = 1;
    }
    v67 = objc_msgSend(v6, "IDSIdentifier", v79, v80, v81, v82, v83);
    v68 = [(HMResidentDevice *)self IDSIdentifier];
    char v69 = HMFEqualObjects();

    if ((v69 & 1) == 0)
    {
      [(HMResidentDevice *)self setIDSIdentifier:v67];
      char v10 = 1;
    }

    id v70 = [v6 IDSDestination];
    uint64_t v71 = [(HMResidentDevice *)self IDSDestination];
    char v72 = HMFEqualObjects();

    if ((v72 & 1) == 0)
    {
      [(HMResidentDevice *)self setIDSDestination:v70];
      char v10 = 1;
    }

    id v73 = [v6 deviceIRKData];
    uint64_t v74 = [(HMResidentDevice *)self deviceIRKData];
    char v75 = HMFEqualObjects();

    if ((v75 & 1) == 0)
    {
      [(HMResidentDevice *)self setDeviceIRKData:v73];
      char v10 = 1;
    }

    id v76 = [(HMResidentDevice *)self device];
    uint64_t v77 = [v6 device];
    [v76 mergeFromNewObject:v77];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

void __39__HMResidentDevice_mergeFromNewObject___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__HMResidentDevice_mergeFromNewObject___block_invoke_2;
  v5[3] = &unk_1E5945650;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 invokeBlock:v5];
}

void __39__HMResidentDevice_mergeFromNewObject___block_invoke_167(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__HMResidentDevice_mergeFromNewObject___block_invoke_2_168;
  v5[3] = &unk_1E5944D60;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  char v7 = *(unsigned char *)(a1 + 48);
  [v3 invokeBlock:v5];
}

void __39__HMResidentDevice_mergeFromNewObject___block_invoke_171(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__HMResidentDevice_mergeFromNewObject___block_invoke_2_172;
  v7[3] = &unk_1E5945160;
  id v4 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  [v3 invokeBlock:v7];
}

void __39__HMResidentDevice_mergeFromNewObject___block_invoke_175(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__HMResidentDevice_mergeFromNewObject___block_invoke_2_176;
  v7[3] = &unk_1E5945160;
  id v4 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  [v3 invokeBlock:v7];
}

void __39__HMResidentDevice_mergeFromNewObject___block_invoke_179(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 delegateCaller];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__HMResidentDevice_mergeFromNewObject___block_invoke_2_180;
  v5[3] = &unk_1E5945628;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 invokeBlock:v5];
}

uint64_t __39__HMResidentDevice_mergeFromNewObject___block_invoke_2_180(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    [*(id *)(a1 + 32) supportsResidentSelection];
    id v6 = HMFBooleanToString();
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@<Merge> Notifying client of updated supportsResidentSelection value: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) didUpdateSupportedCapabilitiesForResidentDevice:*(void *)(a1 + 32)];
}

uint64_t __39__HMResidentDevice_mergeFromNewObject___block_invoke_2_176(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = HMResidentDeviceCapabilitiesDescription([*(id *)(a1 + 32) capabilities]);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@<Merge> Notifying client of updated capabilities: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) residentDevice:*(void *)(a1 + 32) didUpdateCapabilities:*(void *)(a1 + 48)];
}

uint64_t __39__HMResidentDevice_mergeFromNewObject___block_invoke_2_172(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = HMResidentDeviceStatusDescription([*(id *)(a1 + 32) status]);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@<Merge> Notifying client of updated status: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) residentDevice:*(void *)(a1 + 32) didUpdateStatus:*(void *)(a1 + 48)];
}

uint64_t __39__HMResidentDevice_mergeFromNewObject___block_invoke_2_168(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    [*(id *)(a1 + 32) isEnabled];
    id v6 = HMFBooleanToString();
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@<Merge> Notifying client of updated enabled value: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) residentDevice:*(void *)(a1 + 32) didUpdateEnabled:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __39__HMResidentDevice_mergeFromNewObject___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A64A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) name];
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_19D1A8000, v4, OS_LOG_TYPE_INFO, "%{public}@<Merge> Notifying client of updated name: %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 40) residentDevice:*(void *)(a1 + 32) didUpdateName:*(void *)(a1 + 48)];
}

- (HMResidentDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HMResidentDevice;
  id v5 = [(HMResidentDevice *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.device"];
    device = v5->_device;
    v5->_device = (HMDevice *)v8;

    v5->_enabled = [v4 decodeBoolForKey:@"HM.enabled"];
    v5->_status = [v4 decodeIntegerForKey:@"HM.status"];
    v5->_capabilities = [v4 decodeIntegerForKey:@"HM.capabilities"];
    __int16 v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
    objc_storeWeak((id *)&v5->_home, v10);

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.name"];
    residentName = v5->_residentName;
    v5->_residentName = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.accountIdentifier"];
    IDSIdentifier = v5->_IDSIdentifier;
    v5->_IDSIdentifier = (NSUUID *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.idsDestination"];
    IDSDestination = v5->_IDSDestination;
    v5->_IDSDestination = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMResidentDeviceDeviceIRKDataCodingKey"];
    deviceIRKData = v5->_deviceIRKData;
    v5->_deviceIRKData = (NSData *)v17;

    v5->_supportsResidentSelection = [v4 decodeBoolForKey:@"HMResidentDeviceSupportsResidentSelectionCodingKey"];
  }

  return v5;
}

- (void)updatedEnabled:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  char v7 = [(HMResidentDevice *)self context];
  if (!v6)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMResidentDevice updatedEnabled:completionHandler:]", @"completionHandler"];
    id v16 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v19;
      __int16 v27 = 2112;
      v28 = (const char *)v15;
      _os_log_impl(&dword_19D1A8000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v20 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v15 userInfo:0];
    objc_exception_throw(v20);
  }
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__HMResidentDevice_updatedEnabled_completionHandler___block_invoke;
    block[3] = &unk_1E5941750;
    block[4] = self;
    id v23 = v6;
    BOOL v24 = a3;
    id v22 = v8;
    dispatch_async(v9, block);
  }
  else
  {
    __int16 v10 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v13;
      __int16 v27 = 2080;
      v28 = "-[HMResidentDevice updatedEnabled:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    (*((void (**)(id, void *))v6 + 2))(v6, v14);
  }
}

void __53__HMResidentDevice_updatedEnabled_completionHandler___block_invoke(uint64_t a1)
{
  v24[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) home];
  if (v2)
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    if (v3 != [*(id *)(a1 + 32) isEnabled])
    {
      id v8 = objc_alloc(MEMORY[0x1E4F65488]);
      uint64_t v9 = [v2 uuid];
      __int16 v10 = (void *)[v8 initWithTarget:v9];

      uint64_t v11 = (void *)MEMORY[0x1E4F654B0];
      v23[0] = @"kIdentifierKey";
      uint64_t v12 = [*(id *)(a1 + 32) uuid];
      uint64_t v13 = [v12 UUIDString];
      v23[1] = @"kEnabledKey";
      v24[0] = v13;
      v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
      v24[1] = v14;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
      id v16 = [v11 messageWithName:@"kResidentDeviceUpdateEnabledRequestKey" destination:v10 payload:v15];

      objc_initWeak(&location, *(id *)(a1 + 32));
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __53__HMResidentDevice_updatedEnabled_completionHandler___block_invoke_2;
      v18[3] = &unk_1E59441D8;
      objc_copyWeak(&v21, &location);
      id v19 = *(id *)(a1 + 40);
      id v20 = *(id *)(a1 + 48);
      [v16 setResponseHandler:v18];
      uint64_t v17 = [*(id *)(a1 + 40) messageDispatcher];
      [v17 sendMessage:v16 completionHandler:0];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);

      goto LABEL_7;
    }
    id v4 = [*(id *)(a1 + 32) context];
    id v5 = [v4 delegateCaller];
    [v5 callCompletion:*(void *)(a1 + 48) error:0];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) context];
    id v5 = [v4 delegateCaller];
    uint64_t v6 = *(void *)(a1 + 48);
    char v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    [v5 callCompletion:v6 error:v7];
  }
LABEL_7:
}

void __53__HMResidentDevice_updatedEnabled_completionHandler___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v8 = [a1[4] queue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__HMResidentDevice_updatedEnabled_completionHandler___block_invoke_3;
    v9[3] = &unk_1E5944360;
    id v10 = v5;
    id v11 = v6;
    id v12 = WeakRetained;
    id v13 = a1[5];
    dispatch_async(v8, v9);
  }
}

void __53__HMResidentDevice_updatedEnabled_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (!*(void *)(a1 + 32))
  {
    char v7 = 0;
    uint64_t v3 = objc_msgSend(*(id *)(a1 + 40), "hmf_BOOLForKey:isPresent:", @"kEnabledKey", &v7);
    if (v7)
    {
      [*(id *)(a1 + 48) setEnabled:v3];
    }
    else
    {
      uint64_t v4 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];

      id v2 = (id)v4;
    }
  }
  id v5 = [*(id *)(a1 + 48) context];
  id v6 = [v5 delegateCaller];
  [v6 callCompletion:*(void *)(a1 + 56) error:v2];
}

- (void)setResidentName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = (NSString *)[v6 copy];
  residentName = self->_residentName;
  self->_residentName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)residentName
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_residentName;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setCapabilities:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_capabilities = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)capabilities
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t capabilities = self->_capabilities;
  os_unfair_lock_unlock(p_lock);
  return capabilities;
}

- (void)setDeviceIRKData:(id)a3
{
  uint64_t v4 = (NSData *)a3;
  os_unfair_lock_lock_with_options();
  deviceIRKData = self->_deviceIRKData;
  self->_deviceIRKData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)deviceIRKData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_deviceIRKData;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setIDSDestination:(id)a3
{
  uint64_t v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  IDSDestination = self->_IDSDestination;
  self->_IDSDestination = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)IDSDestination
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_IDSDestination;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setIDSIdentifier:(id)a3
{
  uint64_t v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  IDSIdentifier = self->_IDSIdentifier;
  self->_IDSIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)IDSIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_IDSIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setHome:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_home, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMHome)home
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  os_unfair_lock_unlock(p_lock);

  return (HMHome *)WeakRetained;
}

- (void)setStatus:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_status = a3;

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)status
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t status = self->_status;
  os_unfair_lock_unlock(p_lock);
  return status;
}

- (void)setEnabled:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_enabled = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isEnabled
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_enabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isCurrentDevice
{
  id v2 = [(HMResidentDevice *)self device];
  char v3 = [v2 isCurrentDevice];

  return v3;
}

- (NSString)name
{
  char v3 = [(HMResidentDevice *)self residentName];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(HMResidentDevice *)self device];
    id v5 = [v6 name];
  }

  return (NSString *)v5;
}

- (NSUUID)uniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", self->_uuid);
    id v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  char v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)_unconfigure
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  context = self->_context;
  uint64_t v4 = (void *)MEMORY[0x19F3A64A0]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  char v7 = v6;
  if (context)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v8 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v8;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Unconfiguring residentDevice", (uint8_t *)&v11, 0xCu);
    }
    [(HMResidentDevice *)v5 setHome:0];
    [(HMResidentDevice *)v5 setContext:0];
    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 removeObserver:v5];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v10;
      _os_log_impl(&dword_19D1A8000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping unconfigure on already unconfigured object", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)__configureWithContext:(id)a3 home:(id)a4
{
  id v6 = a4;
  [(HMResidentDevice *)self setContext:a3];
  [(HMResidentDevice *)self setHome:v6];
}

- (HMResidentDevice)init
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t42 != -1) {
    dispatch_once(&logCategory__hmf_once_t42, &__block_literal_global_6811);
  }
  id v2 = (void *)logCategory__hmf_once_v43;

  return v2;
}

uint64_t __31__HMResidentDevice_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v43;
  logCategory__hmf_once_v43 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  id v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end