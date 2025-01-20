@interface HFSymptomResultContextProvider
- (BOOL)shouldDisplayManualFixOptionForSymptom:(id)a3;
- (HFSymptomResultContextProvider)init;
- (HFSymptomResultContextProvider)initWithAccessory:(id)a3 mediaSystem:(id)a4;
- (HMAccessory)accessory;
- (HMMediaSystem)mediaSystem;
- (NSString)accessoryCategory;
- (NSString)accessoryName;
- (NSString)accessoryNetworkSSID;
- (NSString)currentAppleMusicAccountName;
- (NSString)currentDeviceNetworkSSID;
- (NSString)currentUserID;
- (NSString)detailedErrorDescriptionForiCloudSymptom;
- (NSString)homeKitObjectName;
- (NSUUID)accessoryUUID;
- (int64_t)fixStateForSymptom:(id)a3;
@end

@implementation HFSymptomResultContextProvider

- (HFSymptomResultContextProvider)initWithAccessory:(id)a3 mediaSystem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFSymptomResultContextProvider;
  v9 = [(HFSymptomResultContextProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessory, a3);
    objc_storeStrong((id *)&v10->_mediaSystem, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSystem, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

- (HFSymptomResultContextProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithAccessory_mediaSystem_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFErrorResultComponent.m", 579, @"%s is unavailable; use %@ instead",
    "-[HFSymptomResultContextProvider init]",
    v5);

  return 0;
}

- (NSUUID)accessoryUUID
{
  v2 = [(HFSymptomResultContextProvider *)self accessory];
  v3 = [v2 uniqueIdentifier];

  return (NSUUID *)v3;
}

- (NSString)accessoryName
{
  v2 = [(HFSymptomResultContextProvider *)self accessory];
  v3 = [v2 name];

  return (NSString *)v3;
}

- (NSString)accessoryCategory
{
  v2 = [(HFSymptomResultContextProvider *)self accessory];
  v3 = [v2 category];
  v4 = [v3 localizedDescription];

  return (NSString *)v4;
}

- (NSString)homeKitObjectName
{
  v3 = [(HFSymptomResultContextProvider *)self mediaSystem];
  v4 = [v3 name];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(HFSymptomResultContextProvider *)self accessory];
    id v6 = [v7 name];
  }
  return (NSString *)v6;
}

- (NSString)currentDeviceNetworkSSID
{
  return (NSString *)+[HFUtilities networkSSID];
}

- (NSString)accessoryNetworkSSID
{
  v2 = [(HFSymptomResultContextProvider *)self accessory];
  v3 = [v2 wifiNetworkInfo];
  v4 = [v3 SSID];

  return (NSString *)v4;
}

- (NSString)currentUserID
{
  v2 = [(HFSymptomResultContextProvider *)self accessory];
  v3 = [v2 home];
  v4 = [v3 currentUser];
  v5 = [v4 userID];

  return (NSString *)v5;
}

- (NSString)currentAppleMusicAccountName
{
  v2 = [(HFSymptomResultContextProvider *)self accessory];
  v3 = [v2 mediaProfile];
  v4 = objc_msgSend(v3, "hf_appleMusicCurrentLoggedInAccount");

  v5 = [v4 username];

  return (NSString *)v5;
}

- (BOOL)shouldDisplayManualFixOptionForSymptom:(id)a3
{
  id v4 = a3;
  v5 = [(HFSymptomResultContextProvider *)self accessory];
  uint64_t v6 = [v4 type];

  LOBYTE(v4) = objc_msgSend(v5, "hf_shouldDisplayManualFixOptionForSymptom:", v6);
  return (char)v4;
}

- (NSString)detailedErrorDescriptionForiCloudSymptom
{
  v3 = [(HFSymptomResultContextProvider *)self accessory];
  int v4 = objc_msgSend(v3, "hf_isHomePod");

  if (v4)
  {
    v5 = @"HFSymptomLongDescriptionNeediCloudCredential_HomePod";
  }
  else
  {
    uint64_t v6 = [(HFSymptomResultContextProvider *)self accessory];
    int v7 = objc_msgSend(v6, "hf_isAppleTV");

    if (v7) {
      v5 = @"HFSymptomLongDescriptionNeediCloudCredential_AppleTV";
    }
    else {
      v5 = @"HFSymptomLongDescriptionNeediCloudCredential_Accessory";
    }
  }
  id v8 = _HFLocalizedStringWithDefaultValue(v5, v5, 1);
  return (NSString *)v8;
}

- (int64_t)fixStateForSymptom:(id)a3
{
  id v4 = a3;
  v5 = +[HFSymptomFixManager sharedManager];
  uint64_t v6 = [(HFSymptomResultContextProvider *)self accessory];
  int64_t v7 = [v5 fixStateForSymptom:v4 accessory:v6];

  return v7;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HMMediaSystem)mediaSystem
{
  return self->_mediaSystem;
}

@end