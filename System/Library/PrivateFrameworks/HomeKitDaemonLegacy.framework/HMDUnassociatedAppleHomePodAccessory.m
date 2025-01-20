@interface HMDUnassociatedAppleHomePodAccessory
- (HMDUnassociatedAppleHomePodAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 productColor:(int64_t)a6 idsIdentifierString:(id)a7 requiredPairingCapabilities:(unint64_t)a8 minimumPairingSoftware:(id)a9 rawAccessoryCapabilities:(id)a10 rawResidentCapabilities:(id)a11 messageDispatcher:(id)a12;
- (id)modelForChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5;
@end

@implementation HMDUnassociatedAppleHomePodAccessory

- (HMDUnassociatedAppleHomePodAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 productColor:(int64_t)a6 idsIdentifierString:(id)a7 requiredPairingCapabilities:(unint64_t)a8 minimumPairingSoftware:(id)a9 rawAccessoryCapabilities:(id)a10 rawResidentCapabilities:(id)a11 messageDispatcher:(id)a12
{
  v13.receiver = self;
  v13.super_class = (Class)HMDUnassociatedAppleHomePodAccessory;
  return [(HMDUnassociatedAppleMediaAccessory *)&v13 initWithIdentifier:a3 name:a4 category:a5 requiredPairingCapabilities:a8 minimumPairingSoftware:a9 productColor:a6 idsIdentifierString:a7 rawAccessoryCapabilities:a10 rawResidentCapabilities:a11 messageDispatcher:a12];
}

- (id)modelForChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = [(HMDUnassociatedAppleMediaAccessory *)self variant];
  switch(v10)
  {
    case 4uLL:
      v16 = off_1E6A03410;
      goto LABEL_12;
    case 1uLL:
      v11 = (void *)MEMORY[0x1D9452090]();
      v17 = self;
      objc_super v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v14 = HMFGetLogIdentifier();
        *(_DWORD *)v20 = 138543362;
        *(void *)&v20[4] = v14;
        v15 = "%{public}@Unexpectedly creating an original HomePod model from a original HomePod";
        goto LABEL_9;
      }
LABEL_10:

      break;
    case 0uLL:
      v11 = (void *)MEMORY[0x1D9452090]();
      v12 = self;
      objc_super v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v14 = HMFGetLogIdentifier();
        *(_DWORD *)v20 = 138543362;
        *(void *)&v20[4] = v14;
        v15 = "%{public}@Unexpectedly creating a model of an unknown HomePod";
LABEL_9:
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_FAULT, v15, v20, 0xCu);

        goto LABEL_10;
      }
      goto LABEL_10;
  }
  v16 = off_1E6A03400;
LABEL_12:
  v18 = -[__objc2_class homePodAccessoryModelWithChangeType:uuid:parentUUID:](*v16, "homePodAccessoryModelWithChangeType:uuid:parentUUID:", a3, v8, v9, *(_OWORD *)v20);

  return v18;
}

@end