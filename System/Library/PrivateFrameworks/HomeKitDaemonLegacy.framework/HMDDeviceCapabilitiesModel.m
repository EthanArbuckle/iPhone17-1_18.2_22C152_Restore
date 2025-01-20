@interface HMDDeviceCapabilitiesModel
+ (id)properties;
+ (id)schemaHashRoot;
- (NSNumber)supportsAudioAnalysis;
- (NSNumber)supportsDropIn;
- (void)setSupportsAudioAnalysis:(id)a3;
- (void)setSupportsDropIn:(id)a3;
@end

@implementation HMDDeviceCapabilitiesModel

+ (id)properties
{
  if (properties_onceToken_150066 != -1) {
    dispatch_once(&properties_onceToken_150066, &__block_literal_global_752);
  }
  v2 = (void *)properties__properties_150067;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportsDropIn, 0);
  objc_storeStrong((id *)&self->_supportsAudioAnalysis, 0);
}

- (void)setSupportsDropIn:(id)a3
{
}

- (NSNumber)supportsDropIn
{
  return self->_supportsDropIn;
}

- (void)setSupportsAudioAnalysis:(id)a3
{
}

- (NSNumber)supportsAudioAnalysis
{
  return self->_supportsAudioAnalysis;
}

void __40__HMDDeviceCapabilitiesModel_properties__block_invoke()
{
  v62[59] = *MEMORY[0x1E4F143B8];
  v61[0] = @"supportsKeychainSync";
  v60 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[0] = v60;
  v61[1] = @"supportsDeviceSetup";
  v59 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[1] = v59;
  v61[2] = @"supportsKeyTransferClient";
  v58 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[2] = v58;
  v61[3] = @"supportsKeyTransferServer";
  v57 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[3] = v57;
  v61[4] = @"supportsStandaloneMode";
  v56 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[4] = v56;
  v61[5] = @"supportsCloudDataSync";
  v55 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[5] = v55;
  v61[6] = @"supportsWholeHouseAudio";
  v54 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[6] = v54;
  v61[7] = @"supportsAssistantAccessControl";
  v53 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[7] = v53;
  v61[8] = @"residentCapable";
  v52 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[8] = v52;
  v61[9] = @"remoteGatewayCapable";
  v51 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[9] = v51;
  v61[10] = @"supportsHomeInvitation";
  v50 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[10] = v50;
  v61[11] = @"supportsTargetControl";
  v49 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[11] = v49;
  v61[12] = @"supportsMultiUser";
  v48 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[12] = v48;
  v61[13] = @"supportsHomeLevelLocationServiceSetting";
  v47 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[13] = v47;
  v61[14] = @"supportsCompanionInitiatedRestart";
  v46 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[14] = v46;
  v61[15] = @"supportsCompanionInitiatedObliterate";
  v45 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[15] = v45;
  v61[16] = @"supportsCameraRecording";
  v44 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[16] = v44;
  v61[17] = @"supportsRouterManagement";
  v43 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[17] = v43;
  v61[18] = @"supportsShortcutActions";
  v42 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[18] = v42;
  v61[19] = @"supportsMediaActions";
  v41 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[19] = v41;
  v61[20] = @"supportsFirmwareUpdate";
  v40 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[20] = v40;
  v61[21] = @"supportsResidentFirmwareUpdate";
  v39 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[21] = v39;
  v61[22] = @"supportsCameraActivityZones";
  v38 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[22] = v38;
  v61[23] = @"supportsMusicAlarm";
  v37 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[23] = v37;
  v61[24] = @"supportsFaceClassification";
  v36 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[24] = v36;
  v61[25] = @"supportsNaturalLighting";
  v35 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[25] = v35;
  v61[26] = @"supportsIDSActivityMonitorPresence";
  v34 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[26] = v34;
  v61[27] = @"supportsCameraRecordingReachabilityNotifications";
  v33 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[27] = v33;
  v61[28] = @"supportsAnnounce";
  v32 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[28] = v32;
  v61[29] = @"supportsThirdPartyMusic";
  v31 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[29] = v31;
  v61[30] = @"supportsPreferredMediaUser";
  v30 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[30] = v30;
  v61[31] = @"supportsThreadBorderRouter";
  v29 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[31] = v29;
  v61[32] = @"supportsSiriEndpointSetup";
  v28 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[32] = v28;
  v61[33] = @"supportsHomeHub";
  v27 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[33] = v27;
  v61[34] = @"supportsWakeOnLAN";
  v26 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[34] = v26;
  v61[35] = @"supportsLockNotificationContext";
  v25 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[35] = v25;
  v61[36] = @"supportsCoordinationDoorbellChime";
  v24 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[36] = v24;
  v61[37] = @"supportsCoordinationFreeDoorbellChime";
  v23 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[37] = v23;
  v61[38] = @"supportsTVOSUpdateManualUpdateAvailableNotification";
  v22 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[38] = v22;
  v61[39] = @"supportsAudioReturnChannel";
  v21 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[39] = v21;
  v61[40] = @"supportsWalletKey";
  v20 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[40] = v20;
  v61[41] = @"supportsCameraPackageDetection";
  v19 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[41] = v19;
  v61[42] = @"supportsAccessCodes";
  v18 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[42] = v18;
  v61[43] = @"supportsCHIP";
  v17 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[43] = v17;
  v61[44] = @"supportsDoorbellChime";
  v16 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[44] = v16;
  v61[45] = @"supportsUserMediaSettings";
  v15 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[45] = v15;
  v61[46] = @"supportsUnifiedMediaNotifications";
  v14 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[46] = v14;
  v61[47] = @"supportsManagedConfigurationProfile";
  v13 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[47] = v13;
  v61[48] = @"supportsCaptiveNetworks";
  v12 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[48] = v12;
  v61[49] = @"supportsModernTransport";
  v11 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[49] = v11;
  v61[50] = @"supportsResidentFirstAccessoryCommunication";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[50] = v0;
  v61[51] = @"supportsMessagedHomePodSettings";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[51] = v1;
  v61[52] = @"supportsCustomMediaApplicationDestination";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[52] = v2;
  v61[53] = @"supportsThreadNetworkCredentialSharing";
  v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[53] = v3;
  v61[54] = @"supportsMatterSharedAdminPairing";
  v4 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[54] = v4;
  v61[55] = @"supportsRMVonAppleTV";
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[55] = v5;
  v61[56] = @"supportsJustSiri";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[56] = v6;
  v61[57] = @"supportsThreadService";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[57] = v7;
  v61[58] = @"supportsMatterOwnerCertFetch";
  v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v62[58] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:59];
  v10 = (void *)properties__properties_150067;
  properties__properties_150067 = v9;
}

+ (id)schemaHashRoot
{
  v2 = (void *)[@"D1529AFE-D6F2-4562-AFD9-33A176868B4E" copy];
  return v2;
}

@end