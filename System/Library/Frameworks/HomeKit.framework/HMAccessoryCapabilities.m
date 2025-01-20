@interface HMAccessoryCapabilities
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalEqual:(id)a3;
- (BOOL)supportsAnnounce;
- (BOOL)supportsAssistantAccessControl;
- (BOOL)supportsAudioAnalysis;
- (BOOL)supportsAudioReturnChannel;
- (BOOL)supportsCaptiveNetworks;
- (BOOL)supportsCloudDataSync;
- (BOOL)supportsCompanionInitiatedObliterate;
- (BOOL)supportsCompanionInitiatedRestart;
- (BOOL)supportsCoordinationDoorbellChime;
- (BOOL)supportsCoordinationFreeDoorbellChime;
- (BOOL)supportsDeviceSetup;
- (BOOL)supportsDoorbellChime;
- (BOOL)supportsDropIn;
- (BOOL)supportsHomeHub;
- (BOOL)supportsHomeInvitation;
- (BOOL)supportsHomeLevelLocationServiceSetting;
- (BOOL)supportsInstallManagedConfigurationProfile;
- (BOOL)supportsJustSiri;
- (BOOL)supportsKeyTransferClient;
- (BOOL)supportsKeyTransferServer;
- (BOOL)supportsKeychainSync;
- (BOOL)supportsLoreto;
- (BOOL)supportsManagedConfigurationProfile;
- (BOOL)supportsMediaActions;
- (BOOL)supportsMessagedHomePodSettings;
- (BOOL)supportsMultiUser;
- (BOOL)supportsMusicAlarm;
- (BOOL)supportsPreferredMediaUser;
- (BOOL)supportsRMVonAppleTV;
- (BOOL)supportsSoftwareUpdateV2;
- (BOOL)supportsStandaloneMode;
- (BOOL)supportsTVOSUpdateManualUpdateAvailableNotification;
- (BOOL)supportsTargetControl;
- (BOOL)supportsThirdPartyMusic;
- (BOOL)supportsThreadBorderRouter;
- (BOOL)supportsUserMediaSettings;
- (BOOL)supportsWholeHouseAudio;
- (HMAccessoryCapabilities)initWithProtoCapabilities:(id)a3;
- (HMAccessoryCapabilities)initWithProtoData:(id)a3;
- (HMAccessoryCapabilities)initWithTagUUID:(id)a3 capabilities:(_HMAccessoryCapabilitiesStruct)a4;
- (NSString)tag;
- (_HMAccessoryCapabilitiesStruct)capabilities;
- (id)pbCapabilities;
- (unint64_t)hash;
@end

@implementation HMAccessoryCapabilities

- (void).cxx_destruct
{
}

- (_HMAccessoryCapabilitiesStruct)capabilities
{
  return self->_capabilities;
}

- (NSString)tag
{
  return self->_tag;
}

- (HMAccessoryCapabilities)initWithProtoCapabilities:(id)a3
{
  id v4 = a3;
  v5 = [v4 tag];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F29128]);
    v7 = [v4 tag];
    v96 = (void *)[v6 initWithUUIDString:v7];

    uint64_t v8 = [v4 supportsKeychainSync];
    int v9 = [v4 supportsDeviceSetup];
    uint64_t v10 = 2;
    if (!v9) {
      uint64_t v10 = 0;
    }
    uint64_t v11 = v10 | v8;
    if ([v4 supportsKeyTransferClient]) {
      uint64_t v12 = 4;
    }
    else {
      uint64_t v12 = 0;
    }
    int v13 = [v4 supportsKeyTransferServer];
    uint64_t v14 = 8;
    if (!v13) {
      uint64_t v14 = 0;
    }
    uint64_t v95 = v11 | v12 | v14;
    if ([v4 supportsStandaloneMode]) {
      uint64_t v15 = 16;
    }
    else {
      uint64_t v15 = 0;
    }
    if ([v4 supportsCloudDataSync]) {
      uint64_t v16 = 32;
    }
    else {
      uint64_t v16 = 0;
    }
    if ([v4 supportsWholeHouseAudio]) {
      uint64_t v17 = 64;
    }
    else {
      uint64_t v17 = 0;
    }
    uint64_t v93 = v15 | v16;
    uint64_t v94 = v17;
    int v18 = [v4 supportsAssistantAccessControl];
    uint64_t v19 = 128;
    if (!v18) {
      uint64_t v19 = 0;
    }
    uint64_t v92 = v19;
    int v20 = [v4 supportsHomeInvitation];
    uint64_t v21 = 256;
    if (!v20) {
      uint64_t v21 = 0;
    }
    uint64_t v91 = v21;
    int v22 = [v4 supportsTargetControl];
    uint64_t v23 = 512;
    if (!v22) {
      uint64_t v23 = 0;
    }
    uint64_t v90 = v23;
    int v24 = [v4 supportsMultiUser];
    uint64_t v25 = 1024;
    if (!v24) {
      uint64_t v25 = 0;
    }
    uint64_t v89 = v25;
    int v26 = [v4 supportsHomeLevelLocationServiceSetting];
    uint64_t v27 = 2048;
    if (!v26) {
      uint64_t v27 = 0;
    }
    uint64_t v88 = v27;
    int v28 = [v4 supportsCompanionInitiatedRestart];
    uint64_t v29 = 4096;
    if (!v28) {
      uint64_t v29 = 0;
    }
    uint64_t v87 = v29;
    int v30 = [v4 supportsMusicAlarm];
    uint64_t v31 = 0x2000;
    if (!v30) {
      uint64_t v31 = 0;
    }
    uint64_t v86 = v31;
    int v32 = [v4 supportsAnnounce];
    uint64_t v33 = 0x4000;
    if (!v32) {
      uint64_t v33 = 0;
    }
    uint64_t v85 = v33;
    int v34 = [v4 supportsf9cc0d9d6aa54e7];
    uint64_t v35 = 0x8000;
    if (!v34) {
      uint64_t v35 = 0;
    }
    uint64_t v84 = v35;
    int v36 = [v4 supportsThirdPartyMusic];
    uint64_t v37 = 0x10000;
    if (!v36) {
      uint64_t v37 = 0;
    }
    uint64_t v83 = v37;
    int v38 = [v4 supportsPreferredMediaUser];
    uint64_t v39 = 0x20000;
    if (!v38) {
      uint64_t v39 = 0;
    }
    uint64_t v82 = v39;
    int v40 = [v4 supportsThreadBorderRouter];
    uint64_t v41 = 0x40000;
    if (!v40) {
      uint64_t v41 = 0;
    }
    uint64_t v81 = v41;
    int v42 = [v4 supportsDoorbellChime];
    uint64_t v43 = 0x80000;
    if (!v42) {
      uint64_t v43 = 0;
    }
    uint64_t v80 = v43;
    int v44 = [v4 supportsUserMediaSettings];
    uint64_t v45 = 0x100000;
    if (!v44) {
      uint64_t v45 = 0;
    }
    uint64_t v79 = v45;
    int v46 = [v4 supportsCoordinationDoorbellChime];
    uint64_t v47 = 0x200000;
    if (!v46) {
      uint64_t v47 = 0;
    }
    uint64_t v78 = v47;
    int v48 = [v4 supportsHomeHub];
    uint64_t v49 = 0x400000;
    if (!v48) {
      uint64_t v49 = 0;
    }
    uint64_t v77 = v49;
    int v50 = [v4 supportsAudioReturnChannel];
    uint64_t v51 = 0x800000;
    if (!v50) {
      uint64_t v51 = 0;
    }
    uint64_t v76 = v51;
    int v52 = [v4 supportsManagedConfigurationProfile];
    uint64_t v53 = 0x1000000;
    if (!v52) {
      uint64_t v53 = 0;
    }
    uint64_t v75 = v53;
    int v54 = [v4 supportsCaptiveNetworks];
    uint64_t v55 = 0x2000000;
    if (!v54) {
      uint64_t v55 = 0;
    }
    uint64_t v74 = v55;
    int v56 = [v4 supportsMessagedHomePodSettings];
    uint64_t v57 = 0x4000000;
    if (!v56) {
      uint64_t v57 = 0;
    }
    uint64_t v73 = v57;
    int v58 = [v4 supportsMediaActions];
    uint64_t v59 = 0x8000000;
    if (!v58) {
      uint64_t v59 = 0;
    }
    if (objc_msgSend(v4, "supports90bb069d6bx54e7", v59)) {
      uint64_t v60 = 0x10000000;
    }
    else {
      uint64_t v60 = 0;
    }
    if ([v4 supports89024c1cadcb8b00]) {
      uint64_t v61 = 0x20000000;
    }
    else {
      uint64_t v61 = 0;
    }
    if ([v4 supports2c25465bb0b47366]) {
      uint64_t v62 = 0x40000000;
    }
    else {
      uint64_t v62 = 0;
    }
    if ([v4 supportsInstallManagedConfigurationProfile]) {
      uint64_t v63 = 0x80000000;
    }
    else {
      uint64_t v63 = 0;
    }
    if ([v4 supportsCoordinationFreeDoorbellChime]) {
      uint64_t v64 = 0x100000000;
    }
    else {
      uint64_t v64 = 0;
    }
    v65 = self;
    if ([v4 supportsCompanionInitiatedObliterate]) {
      uint64_t v66 = 0x200000000;
    }
    else {
      uint64_t v66 = 0;
    }
    if ([v4 supports45c051b0b1f0]) {
      uint64_t v67 = 0x400000000;
    }
    else {
      uint64_t v67 = 0;
    }
    if ([v4 supportsTVOSUpdateManualUpdateAvailableNotification]) {
      uint64_t v68 = 0x800000000;
    }
    else {
      uint64_t v68 = 0;
    }
    int v69 = [v4 supportsSoftwareUpdateV2];
    uint64_t v70 = 0x1000000000;
    if (!v69) {
      uint64_t v70 = 0;
    }
    self = [(HMAccessoryCapabilities *)v65 initWithTagUUID:v96 capabilities:v95 | v93 | v94 | v92 | v91 | v90 | v89 | v88 | v87 | v86 | v85 | v84 | v83 | v82 | v81 | v80 | v79 | v78 | v77 | v76 | v75 | v74 | v73 | v72 | v60 | v61 | v62 | v63 | v64 | v66 | v67 | v68 | v70];

    v5 = self;
  }

  return v5;
}

- (HMAccessoryCapabilities)initWithProtoData:(id)a3
{
  id v4 = a3;
  v5 = [[HMProtoAccessoryCapabilities alloc] initWithData:v4];

  if (v5)
  {
    self = [(HMAccessoryCapabilities *)self initWithProtoCapabilities:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)pbCapabilities
{
  v3 = objc_alloc_init(HMProtoAccessoryCapabilities);
  id v4 = [(HMAccessoryCapabilities *)self tag];
  [(HMProtoAccessoryCapabilities *)v3 setTag:v4];

  [(HMProtoAccessoryCapabilities *)v3 setSupportsKeychainSync:[(HMAccessoryCapabilities *)self supportsKeychainSync]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsDeviceSetup:[(HMAccessoryCapabilities *)self supportsDeviceSetup]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsKeyTransferClient:[(HMAccessoryCapabilities *)self supportsKeyTransferClient]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsKeyTransferServer:[(HMAccessoryCapabilities *)self supportsKeyTransferServer]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsStandaloneMode:[(HMAccessoryCapabilities *)self supportsStandaloneMode]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsCloudDataSync:[(HMAccessoryCapabilities *)self supportsCloudDataSync]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsWholeHouseAudio:[(HMAccessoryCapabilities *)self supportsWholeHouseAudio]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsAssistantAccessControl:[(HMAccessoryCapabilities *)self supportsAssistantAccessControl]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsHomeInvitation:[(HMAccessoryCapabilities *)self supportsHomeInvitation]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsTargetControl:[(HMAccessoryCapabilities *)self supportsTargetControl]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsMultiUser:[(HMAccessoryCapabilities *)self supportsMultiUser]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsHomeLevelLocationServiceSetting:[(HMAccessoryCapabilities *)self supportsHomeLevelLocationServiceSetting]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsCompanionInitiatedRestart:[(HMAccessoryCapabilities *)self supportsCompanionInitiatedRestart]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsMusicAlarm:[(HMAccessoryCapabilities *)self supportsMusicAlarm]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsAnnounce:[(HMAccessoryCapabilities *)self supportsAnnounce]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsf9cc0d9d6aa54e7:[(HMAccessoryCapabilities *)self supportsAudioAnalysis]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsThirdPartyMusic:[(HMAccessoryCapabilities *)self supportsThirdPartyMusic]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsPreferredMediaUser:[(HMAccessoryCapabilities *)self supportsPreferredMediaUser]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsThreadBorderRouter:[(HMAccessoryCapabilities *)self supportsThreadBorderRouter]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsDoorbellChime:[(HMAccessoryCapabilities *)self supportsDoorbellChime]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsUserMediaSettings:[(HMAccessoryCapabilities *)self supportsUserMediaSettings]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsCoordinationDoorbellChime:[(HMAccessoryCapabilities *)self supportsCoordinationDoorbellChime]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsHomeHub:[(HMAccessoryCapabilities *)self supportsHomeHub]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsAudioReturnChannel:[(HMAccessoryCapabilities *)self supportsAudioReturnChannel]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsManagedConfigurationProfile:[(HMAccessoryCapabilities *)self supportsManagedConfigurationProfile]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsCaptiveNetworks:[(HMAccessoryCapabilities *)self supportsCaptiveNetworks]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsMessagedHomePodSettings:[(HMAccessoryCapabilities *)self supportsMessagedHomePodSettings]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsMediaActions:[(HMAccessoryCapabilities *)self supportsMediaActions]];
  [(HMProtoAccessoryCapabilities *)v3 setSupports90bb069d6bx54e7:[(HMAccessoryCapabilities *)self supportsDropIn]];
  [(HMProtoAccessoryCapabilities *)v3 setSupports89024c1cadcb8b00:[(HMAccessoryCapabilities *)self supportsRMVonAppleTV]];
  [(HMProtoAccessoryCapabilities *)v3 setSupports2c25465bb0b47366:[(HMAccessoryCapabilities *)self supportsJustSiri]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsInstallManagedConfigurationProfile:[(HMAccessoryCapabilities *)self supportsInstallManagedConfigurationProfile]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsCoordinationFreeDoorbellChime:[(HMAccessoryCapabilities *)self supportsCoordinationFreeDoorbellChime]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsCompanionInitiatedObliterate:[(HMAccessoryCapabilities *)self supportsCompanionInitiatedObliterate]];
  [(HMProtoAccessoryCapabilities *)v3 setSupports45c051b0b1f0:[(HMAccessoryCapabilities *)self supportsLoreto]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsTVOSUpdateManualUpdateAvailableNotification:[(HMAccessoryCapabilities *)self supportsTVOSUpdateManualUpdateAvailableNotification]];
  [(HMProtoAccessoryCapabilities *)v3 setSupportsSoftwareUpdateV2:[(HMAccessoryCapabilities *)self supportsSoftwareUpdateV2]];

  return v3;
}

- (BOOL)supportsSoftwareUpdateV2
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 36) & 1;
}

- (BOOL)supportsTVOSUpdateManualUpdateAvailableNotification
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 35) & 1;
}

- (BOOL)supportsLoreto
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 34) & 1;
}

- (BOOL)supportsCompanionInitiatedObliterate
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 33) & 1;
}

- (BOOL)supportsCoordinationFreeDoorbellChime
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 32) & 1;
}

- (BOOL)supportsInstallManagedConfigurationProfile
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 31) & 1;
}

- (BOOL)supportsJustSiri
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 30) & 1;
}

- (BOOL)supportsRMVonAppleTV
{
  if (([(HMAccessoryCapabilities *)self capabilities] & 0x20000000) == 0) {
    return 0;
  }

  return _os_feature_enabled_impl();
}

- (BOOL)supportsDropIn
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 28) & 1;
}

- (BOOL)supportsMediaActions
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 27) & 1;
}

- (BOOL)supportsMessagedHomePodSettings
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 26) & 1;
}

- (BOOL)supportsCaptiveNetworks
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 25) & 1;
}

- (BOOL)supportsManagedConfigurationProfile
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 24) & 1;
}

- (BOOL)supportsAudioReturnChannel
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 23) & 1;
}

- (BOOL)supportsHomeHub
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 22) & 1;
}

- (BOOL)supportsCoordinationDoorbellChime
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 21) & 1;
}

- (BOOL)supportsUserMediaSettings
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 20) & 1;
}

- (BOOL)supportsDoorbellChime
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 19) & 1;
}

- (BOOL)supportsThreadBorderRouter
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 18) & 1;
}

- (BOOL)supportsPreferredMediaUser
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 17) & 1;
}

- (BOOL)supportsThirdPartyMusic
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 16) & 1;
}

- (BOOL)supportsAudioAnalysis
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 15) & 1;
}

- (BOOL)supportsAnnounce
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 14) & 1;
}

- (BOOL)supportsMusicAlarm
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 13) & 1;
}

- (BOOL)supportsCompanionInitiatedRestart
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 12) & 1;
}

- (BOOL)supportsHomeLevelLocationServiceSetting
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 11) & 1;
}

- (BOOL)supportsMultiUser
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 10) & 1;
}

- (BOOL)supportsTargetControl
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 9) & 1;
}

- (BOOL)supportsHomeInvitation
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 8) & 1;
}

- (BOOL)supportsAssistantAccessControl
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 7) & 1;
}

- (BOOL)supportsWholeHouseAudio
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 6) & 1;
}

- (BOOL)supportsCloudDataSync
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 5) & 1;
}

- (BOOL)supportsStandaloneMode
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 4) & 1;
}

- (BOOL)supportsKeyTransferServer
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 3) & 1;
}

- (BOOL)supportsKeyTransferClient
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 2) & 1;
}

- (BOOL)supportsDeviceSetup
{
  return ((unint64_t)[(HMAccessoryCapabilities *)self capabilities] >> 1) & 1;
}

- (BOOL)supportsKeychainSync
{
  return [(HMAccessoryCapabilities *)self capabilities] & 1;
}

- (BOOL)isLocalEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (!v6) {
    goto LABEL_42;
  }
  int v7 = [(HMAccessoryCapabilities *)self supportsKeychainSync];
  if (v7 != [v6 supportsKeychainSync]) {
    goto LABEL_42;
  }
  int v8 = [(HMAccessoryCapabilities *)self supportsDeviceSetup];
  if (v8 != [v6 supportsDeviceSetup]) {
    goto LABEL_42;
  }
  int v9 = [(HMAccessoryCapabilities *)self supportsKeyTransferClient];
  if (v9 != [v6 supportsKeyTransferClient]) {
    goto LABEL_42;
  }
  int v10 = [(HMAccessoryCapabilities *)self supportsKeyTransferServer];
  if (v10 != [v6 supportsKeyTransferServer]) {
    goto LABEL_42;
  }
  int v11 = [(HMAccessoryCapabilities *)self supportsStandaloneMode];
  if (v11 != [v6 supportsStandaloneMode]) {
    goto LABEL_42;
  }
  int v12 = [(HMAccessoryCapabilities *)self supportsCloudDataSync];
  if (v12 != [v6 supportsCloudDataSync]) {
    goto LABEL_42;
  }
  int v13 = [(HMAccessoryCapabilities *)self supportsWholeHouseAudio];
  if (v13 != [v6 supportsWholeHouseAudio]) {
    goto LABEL_42;
  }
  int v14 = [(HMAccessoryCapabilities *)self supportsAssistantAccessControl];
  if (v14 != [v6 supportsAssistantAccessControl]) {
    goto LABEL_42;
  }
  int v15 = [(HMAccessoryCapabilities *)self supportsHomeInvitation];
  if (v15 != [v6 supportsHomeInvitation]) {
    goto LABEL_42;
  }
  int v16 = [(HMAccessoryCapabilities *)self supportsTargetControl];
  if (v16 != [v6 supportsTargetControl]) {
    goto LABEL_42;
  }
  int v17 = [(HMAccessoryCapabilities *)self supportsMultiUser];
  if (v17 != [v6 supportsMultiUser]) {
    goto LABEL_42;
  }
  int v18 = [(HMAccessoryCapabilities *)self supportsHomeLevelLocationServiceSetting];
  if (v18 != [v6 supportsHomeLevelLocationServiceSetting]) {
    goto LABEL_42;
  }
  int v19 = [(HMAccessoryCapabilities *)self supportsCompanionInitiatedRestart];
  if (v19 != [v6 supportsCompanionInitiatedRestart]) {
    goto LABEL_42;
  }
  int v20 = [(HMAccessoryCapabilities *)self supportsMusicAlarm];
  if (v20 != [v6 supportsMusicAlarm]) {
    goto LABEL_42;
  }
  int v21 = [(HMAccessoryCapabilities *)self supportsAnnounce];
  if (v21 != [v6 supportsAnnounce]) {
    goto LABEL_42;
  }
  int v22 = [(HMAccessoryCapabilities *)self supportsAudioAnalysis];
  if (v22 != [v6 supportsAudioAnalysis]) {
    goto LABEL_42;
  }
  int v23 = [(HMAccessoryCapabilities *)self supportsThirdPartyMusic];
  if (v23 != [v6 supportsThirdPartyMusic]) {
    goto LABEL_42;
  }
  int v24 = [(HMAccessoryCapabilities *)self supportsPreferredMediaUser];
  if (v24 != [v6 supportsPreferredMediaUser]) {
    goto LABEL_42;
  }
  int v25 = [(HMAccessoryCapabilities *)self supportsThreadBorderRouter];
  if (v25 != [v6 supportsThreadBorderRouter]) {
    goto LABEL_42;
  }
  int v26 = [(HMAccessoryCapabilities *)self supportsDoorbellChime];
  if (v26 != [v6 supportsDoorbellChime]) {
    goto LABEL_42;
  }
  int v27 = [(HMAccessoryCapabilities *)self supportsUserMediaSettings];
  if (v27 != [v6 supportsUserMediaSettings]) {
    goto LABEL_42;
  }
  int v28 = [(HMAccessoryCapabilities *)self supportsCoordinationDoorbellChime];
  if (v28 != [v6 supportsCoordinationDoorbellChime]) {
    goto LABEL_42;
  }
  int v29 = [(HMAccessoryCapabilities *)self supportsHomeHub];
  if (v29 != [v6 supportsHomeHub]) {
    goto LABEL_42;
  }
  int v30 = [(HMAccessoryCapabilities *)self supportsAudioReturnChannel];
  if (v30 != [v6 supportsAudioReturnChannel]) {
    goto LABEL_42;
  }
  int v31 = [(HMAccessoryCapabilities *)self supportsManagedConfigurationProfile];
  if (v31 != [v6 supportsManagedConfigurationProfile]) {
    goto LABEL_42;
  }
  int v32 = [(HMAccessoryCapabilities *)self supportsCaptiveNetworks];
  if (v32 != [v6 supportsCaptiveNetworks]) {
    goto LABEL_42;
  }
  int v33 = [(HMAccessoryCapabilities *)self supportsMessagedHomePodSettings];
  if (v33 != [v6 supportsMessagedHomePodSettings]) {
    goto LABEL_42;
  }
  int v34 = [(HMAccessoryCapabilities *)self supportsMediaActions];
  if (v34 != [v6 supportsMediaActions]) {
    goto LABEL_42;
  }
  int v35 = [(HMAccessoryCapabilities *)self supportsDropIn];
  if (v35 != [v6 supportsDropIn]) {
    goto LABEL_42;
  }
  int v36 = [(HMAccessoryCapabilities *)self supportsRMVonAppleTV];
  if (v36 != [v6 supportsRMVonAppleTV] && (_os_feature_enabled_impl() & 1) != 0) {
    goto LABEL_42;
  }
  int v37 = [(HMAccessoryCapabilities *)self supportsJustSiri];
  if (v37 == [v6 supportsJustSiri]
    && (int v38 = -[HMAccessoryCapabilities supportsInstallManagedConfigurationProfile](self, "supportsInstallManagedConfigurationProfile"), v38 == [v6 supportsInstallManagedConfigurationProfile])&& (v39 = -[HMAccessoryCapabilities supportsCoordinationFreeDoorbellChime](self, "supportsCoordinationFreeDoorbellChime"), v39 == objc_msgSend(v6, "supportsCoordinationFreeDoorbellChime"))&& (v40 = -[HMAccessoryCapabilities supportsCompanionInitiatedObliterate](self, "supportsCompanionInitiatedObliterate"), v40 == objc_msgSend(v6, "supportsCompanionInitiatedObliterate"))&& (v41 = -[HMAccessoryCapabilities supportsLoreto](self, "supportsLoreto"), v41 == objc_msgSend(v6, "supportsLoreto"))&& (v42 = -[HMAccessoryCapabilities supportsTVOSUpdateManualUpdateAvailableNotification](self, "supportsTVOSUpdateManualUpdateAvailableNotification"), v42 == objc_msgSend(v6, "supportsTVOSUpdateManualUpdateAvailableNotification")))
  {
    BOOL v45 = [(HMAccessoryCapabilities *)self supportsSoftwareUpdateV2];
    int v43 = v45 ^ [v6 supportsSoftwareUpdateV2] ^ 1;
  }
  else
  {
LABEL_42:
    LOBYTE(v43) = 0;
  }

  return v43;
}

- (unint64_t)hash
{
  v2 = [(HMAccessoryCapabilities *)self tag];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMAccessoryCapabilities *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      int v7 = [(HMAccessoryCapabilities *)self tag];
      int v8 = [(HMAccessoryCapabilities *)v6 tag];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (HMAccessoryCapabilities)initWithTagUUID:(id)a3 capabilities:(_HMAccessoryCapabilitiesStruct)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMAccessoryCapabilities;
  int v7 = [(HMAccessoryCapabilities *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 UUIDString];
    tag = v7->_tag;
    v7->_tag = (NSString *)v8;

    v7->_capabilities = a4;
  }

  return v7;
}

@end