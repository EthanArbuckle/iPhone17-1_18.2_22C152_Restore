@interface HMDPrimaryElectionMeshInformation
+ (id)meshInformationFromMessagePayload:(id)a3 home:(id)a4;
+ (id)meshInformationWithMeshController:(id)a3 home:(id)a4;
- (HMDPrimaryElectionMeshInformation)initWithResponder:(id)a3 leader:(id)a4 primary:(id)a5 reachableIPAccessories:(unint64_t)a6 residentsInMesh:(unint64_t)a7;
- (HMDResidentDevice)leader;
- (HMDResidentDevice)primary;
- (HMDResidentDevice)responder;
- (id)description;
- (id)toMessagePayload;
- (unint64_t)reachableIPAccessories;
- (unint64_t)residentsInMesh;
@end

@implementation HMDPrimaryElectionMeshInformation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primary, 0);
  objc_storeStrong((id *)&self->_leader, 0);
  objc_storeStrong((id *)&self->_responder, 0);
}

- (unint64_t)residentsInMesh
{
  return self->_residentsInMesh;
}

- (unint64_t)reachableIPAccessories
{
  return self->_reachableIPAccessories;
}

- (HMDResidentDevice)primary
{
  return self->_primary;
}

- (HMDResidentDevice)leader
{
  return self->_leader;
}

- (HMDResidentDevice)responder
{
  return self->_responder;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(HMDPrimaryElectionMeshInformation *)self responder];
  v7 = [v6 shortDescription];
  v8 = [(HMDPrimaryElectionMeshInformation *)self leader];
  v9 = [v8 shortDescription];
  v10 = [(HMDPrimaryElectionMeshInformation *)self primary];
  v11 = [v10 shortDescription];
  v12 = [v3 stringWithFormat:@"<%@ responder: %@, leader: %@, primary: %@, IP accessories: %d residents: %d>", v5, v7, v9, v11, -[HMDPrimaryElectionMeshInformation reachableIPAccessories](self, "reachableIPAccessories"), -[HMDPrimaryElectionMeshInformation residentsInMesh](self, "residentsInMesh")];

  return v12;
}

- (id)toMessagePayload
{
  v21[3] = *MEMORY[0x263EF8340];
  v20[0] = @"r";
  v3 = [(HMDPrimaryElectionMeshInformation *)self responder];
  v4 = [v3 identifier];
  v5 = [v4 UUIDString];
  v21[0] = v5;
  v20[1] = @"rip";
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDPrimaryElectionMeshInformation reachableIPAccessories](self, "reachableIPAccessories"));
  v21[1] = v6;
  v20[2] = @"res";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDPrimaryElectionMeshInformation residentsInMesh](self, "residentsInMesh"));
  v21[2] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
  v9 = (void *)[v8 mutableCopy];

  v10 = [(HMDPrimaryElectionMeshInformation *)self leader];

  if (v10)
  {
    v11 = [(HMDPrimaryElectionMeshInformation *)self leader];
    v12 = [v11 identifier];
    v13 = [v12 UUIDString];
    [v9 setObject:v13 forKeyedSubscript:@"l"];
  }
  v14 = [(HMDPrimaryElectionMeshInformation *)self primary];

  if (v14)
  {
    v15 = [(HMDPrimaryElectionMeshInformation *)self primary];
    v16 = [v15 identifier];
    v17 = [v16 UUIDString];
    [v9 setObject:v17 forKeyedSubscript:@"p"];
  }
  v18 = (void *)[v9 copy];

  return v18;
}

- (HMDPrimaryElectionMeshInformation)initWithResponder:(id)a3 leader:(id)a4 primary:(id)a5 reachableIPAccessories:(unint64_t)a6 residentsInMesh:(unint64_t)a7
{
  v12 = (HMDResidentDevice *)a3;
  v13 = (HMDResidentDevice *)a4;
  v14 = (HMDResidentDevice *)a5;
  v22.receiver = self;
  v22.super_class = (Class)HMDPrimaryElectionMeshInformation;
  v15 = [(HMDPrimaryElectionMeshInformation *)&v22 init];
  responder = v15->_responder;
  v15->_responder = v12;
  v17 = v12;

  leader = v15->_leader;
  v15->_leader = v13;
  v19 = v13;

  primary = v15->_primary;
  v15->_primary = v14;

  v15->_reachableIPAccessories = a6;
  v15->_residentsInMesh = a7;
  return v15;
}

+ (id)meshInformationFromMessagePayload:(id)a3 home:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 residentDeviceManager];
  v8 = [v7 residentDevices];
  v9 = objc_msgSend(v5, "hmf_UUIDForKey:", @"r");
  v10 = findResidentDevice(v8, v9);
  if (v10)
  {
    v11 = objc_msgSend(v5, "hmf_UUIDForKey:", @"l");
    v12 = v11;
    if (v11)
    {
      v11 = findResidentDevice(v8, v11);
      if (!v11)
      {
        v28 = (void *)MEMORY[0x230FBD990]();
        v29 = objc_opt_class();
        v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v47 = v28;
          v32 = v31 = v12;
          *(_DWORD *)buf = 138543618;
          v51 = v32;
          __int16 v52 = 2114;
          v53 = v31;
          _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to find leader identifier: %{public}@", buf, 0x16u);

          v12 = v31;
          v28 = v47;
        }

        v27 = 0;
        goto LABEL_25;
      }
    }
    v46 = v11;
    v13 = objc_msgSend(v5, "hmf_UUIDForKey:", @"p");
    v14 = v13;
    if (v13)
    {
      v13 = findResidentDevice(v8, v13);
      if (!v13)
      {
        v45 = v7;
        v35 = (void *)MEMORY[0x230FBD990]();
        v36 = objc_opt_class();
        v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v38 = v43 = v12;
          *(_DWORD *)buf = 138543618;
          v51 = v38;
          __int16 v52 = 2114;
          v53 = v14;
          _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Unable to find leader identifier: %{public}@", buf, 0x16u);

          v12 = v43;
        }

        v27 = 0;
        v7 = v45;
        goto LABEL_24;
      }
    }
    v41 = v13;
    v42 = v12;
    id v49 = 0;
    uint64_t v15 = objc_msgSend(v5, "hmf_integerForKey:error:", @"rip", &v49);
    id v16 = v49;
    if (v16)
    {
      v17 = v16;
      v44 = v7;
      v18 = (void *)MEMORY[0x230FBD990]();
      v19 = objc_opt_class();
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = id v40 = v6;
        *(_DWORD *)buf = 138543618;
        v51 = v21;
        __int16 v52 = 2112;
        v53 = v17;
        objc_super v22 = "%{public}@Unable to find reachable IP accessories: %@";
LABEL_18:
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, v22, buf, 0x16u);

        id v6 = v40;
      }
    }
    else
    {
      id v48 = 0;
      uint64_t v33 = objc_msgSend(v5, "hmf_integerForKey:error:", @"res", &v48);
      id v34 = v48;
      if (!v34)
      {
        v27 = [[HMDPrimaryElectionMeshInformation alloc] initWithResponder:v10 leader:v46 primary:v41 reachableIPAccessories:v15 residentsInMesh:v33];
        goto LABEL_20;
      }
      v17 = v34;
      v44 = v7;
      v18 = (void *)MEMORY[0x230FBD990]();
      v19 = objc_opt_class();
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = id v40 = v6;
        *(_DWORD *)buf = 138543618;
        v51 = v21;
        __int16 v52 = 2112;
        v53 = v17;
        objc_super v22 = "%{public}@Unable to find residents in mesh: %@";
        goto LABEL_18;
      }
    }

    v27 = 0;
    v7 = v44;
LABEL_20:

    v12 = v42;
LABEL_24:

LABEL_25:
    goto LABEL_26;
  }
  v23 = (void *)MEMORY[0x230FBD990]();
  v24 = objc_opt_class();
  v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v51 = v26;
    __int16 v52 = 2114;
    v53 = v9;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to find responder identifier: %{public}@", buf, 0x16u);
  }
  v27 = 0;
LABEL_26:

  return v27;
}

+ (id)meshInformationWithMeshController:(id)a3 home:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 residentDeviceManager];
  v8 = [v7 residentDevices];
  v9 = objc_msgSend(v8, "na_firstObjectPassingTest:", &__block_literal_global_162452);
  if (v9)
  {
    if ([v5 isLeader])
    {
      id v10 = v9;
    }
    else
    {
      id v16 = [v5 leaderNode];
      objc_msgSend(v8, "hmd_residentDeviceForMeshNode:", v16);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v25 = 0x2020000000;
    uint64_t v26 = 0;
    v17 = [v6 accessories];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __76__HMDPrimaryElectionMeshInformation_meshInformationWithMeshController_home___block_invoke_1;
    v23[3] = &unk_264A261E8;
    v23[4] = &buf;
    objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v23);

    v18 = [v5 meshNodes];
    uint64_t v19 = [v18 count];

    v20 = [HMDPrimaryElectionMeshInformation alloc];
    v21 = [v7 primaryResidentDevice];
    uint64_t v15 = [(HMDPrimaryElectionMeshInformation *)v20 initWithResponder:v9 leader:v10 primary:v21 reachableIPAccessories:*(void *)(*((void *)&buf + 1) + 24) residentsInMesh:v19 + 1];

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = objc_opt_class();
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to find responder, not creating mesh information", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

void __76__HMDPrimaryElectionMeshInformation_meshInformationWithMeshController_home___block_invoke_1(uint64_t a1, void *a2)
{
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v8;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 hostAccessory];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0
      && [v5 hasIPLink]
      && [v5 isReachable])
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
  }
}

uint64_t __76__HMDPrimaryElectionMeshInformation_meshInformationWithMeshController_home___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCurrentDevice];
}

@end