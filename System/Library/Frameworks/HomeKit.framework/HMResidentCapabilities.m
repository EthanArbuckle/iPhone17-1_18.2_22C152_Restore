@interface HMResidentCapabilities
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalEqual:(id)a3;
- (BOOL)isResidentCapable;
- (BOOL)supportsAccessCodes;
- (BOOL)supportsAnnounce;
- (BOOL)supportsCHIP;
- (BOOL)supportsCameraActivityZones;
- (BOOL)supportsCameraPackageDetection;
- (BOOL)supportsCameraRecording;
- (BOOL)supportsCameraRecordingReachabilityNotifications;
- (BOOL)supportsCameraSignificantEventNotifications;
- (BOOL)supportsCustomMediaApplicationDestination;
- (BOOL)supportsDistributedExecutionOnAppleMediaAccessories;
- (BOOL)supportsDistributedExecutionOnPrimary;
- (BOOL)supportsEventLog;
- (BOOL)supportsFaceClassification;
- (BOOL)supportsFirmwareUpdate;
- (BOOL)supportsHomeHub;
- (BOOL)supportsLockNotificationContext;
- (BOOL)supportsMatterOwnerCertFetch;
- (BOOL)supportsMatterSharedAdminPairing;
- (BOOL)supportsMatterTTU;
- (BOOL)supportsMediaActions;
- (BOOL)supportsNativeMatter;
- (BOOL)supportsNaturalLighting;
- (BOOL)supportsResidentActionSetStateEvaluation;
- (BOOL)supportsResidentFirmwareUpdate;
- (BOOL)supportsResidentFirstAccessoryCommunication;
- (BOOL)supportsResidentSelection;
- (BOOL)supportsRestrictedGuest;
- (BOOL)supportsRouterManagement;
- (BOOL)supportsShortcutActions;
- (BOOL)supportsSiriEndpointSetup;
- (BOOL)supportsThreadBorderRouter;
- (BOOL)supportsThreadNetworkCredentialSharing;
- (BOOL)supportsUWB;
- (BOOL)supportsUWBUnlock;
- (BOOL)supportsUnifiedMediaNotifications;
- (BOOL)supportsWakeOnLAN;
- (BOOL)supportsWalletKey;
- (HMResidentCapabilities)initWithProtoCapabilities:(id)a3;
- (HMResidentCapabilities)initWithProtoData:(id)a3;
- (HMResidentCapabilities)initWithTagUUID:(id)a3 capabilities:(_HMResidentCapabilitiesStruct)a4;
- (NSString)tag;
- (_HMResidentCapabilitiesStruct)capabilities;
- (id)pbCapabilities;
- (unint64_t)hash;
@end

@implementation HMResidentCapabilities

- (void).cxx_destruct
{
}

- (_HMResidentCapabilitiesStruct)capabilities
{
  return self->_capabilities;
}

- (NSString)tag
{
  return self->_tag;
}

- (HMResidentCapabilities)initWithProtoCapabilities:(id)a3
{
  id v4 = a3;
  v5 = [v4 tag];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F29128]);
    v7 = [v4 tag];
    v96 = (void *)[v6 initWithUUIDString:v7];

    uint64_t v8 = [v4 supportsCameraRecording];
    int v9 = [v4 supportsRouterManagement];
    uint64_t v10 = 2;
    if (!v9) {
      uint64_t v10 = 0;
    }
    uint64_t v11 = v10 | v8;
    if ([v4 supportsShortcutActions]) {
      uint64_t v12 = 4;
    }
    else {
      uint64_t v12 = 0;
    }
    int v13 = [v4 supportsMediaActions];
    uint64_t v14 = 8;
    if (!v13) {
      uint64_t v14 = 0;
    }
    uint64_t v95 = v11 | v12 | v14;
    if ([v4 supportsCameraSignificantEventNotifications]) {
      uint64_t v15 = 16;
    }
    else {
      uint64_t v15 = 0;
    }
    if ([v4 supportsFirmwareUpdate]) {
      uint64_t v16 = 32;
    }
    else {
      uint64_t v16 = 0;
    }
    if ([v4 supportsResidentFirmwareUpdate]) {
      uint64_t v17 = 64;
    }
    else {
      uint64_t v17 = 0;
    }
    uint64_t v93 = v15 | v16;
    uint64_t v94 = v17;
    int v18 = [v4 supportsCameraActivityZones];
    uint64_t v19 = 128;
    if (!v18) {
      uint64_t v19 = 0;
    }
    uint64_t v92 = v19;
    int v20 = [v4 supportsFaceClassification];
    uint64_t v21 = 256;
    if (!v20) {
      uint64_t v21 = 0;
    }
    uint64_t v91 = v21;
    int v22 = [v4 supportsNaturalLighting];
    uint64_t v23 = 512;
    if (!v22) {
      uint64_t v23 = 0;
    }
    uint64_t v90 = v23;
    int v24 = [v4 supportsCameraRecordingReachabilityNotifications];
    uint64_t v25 = 1024;
    if (!v24) {
      uint64_t v25 = 0;
    }
    uint64_t v89 = v25;
    int v26 = [v4 supportsAnnounce];
    uint64_t v27 = 2048;
    if (!v26) {
      uint64_t v27 = 0;
    }
    uint64_t v88 = v27;
    int v28 = [v4 supportsWakeOnLAN];
    uint64_t v29 = 4096;
    if (!v28) {
      uint64_t v29 = 0;
    }
    uint64_t v87 = v29;
    int v30 = [v4 supportsLockNotificationContext];
    uint64_t v31 = 0x2000;
    if (!v30) {
      uint64_t v31 = 0;
    }
    uint64_t v86 = v31;
    int v32 = [v4 supportsWalletKey];
    uint64_t v33 = 0x4000;
    if (!v32) {
      uint64_t v33 = 0;
    }
    uint64_t v85 = v33;
    int v34 = [v4 supportsCameraPackageDetection];
    uint64_t v35 = 0x8000;
    if (!v34) {
      uint64_t v35 = 0;
    }
    uint64_t v84 = v35;
    int v36 = [v4 supportsAccessCodes];
    uint64_t v37 = 0x10000;
    if (!v36) {
      uint64_t v37 = 0;
    }
    uint64_t v83 = v37;
    int v38 = [v4 supportsCHIP];
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
    int v42 = [v4 supportsSiriEndpointSetup];
    uint64_t v43 = 0x80000;
    if (!v42) {
      uint64_t v43 = 0;
    }
    uint64_t v80 = v43;
    int v44 = [v4 supportsCustomMediaApplicationDestination];
    uint64_t v45 = 0x100000;
    if (!v44) {
      uint64_t v45 = 0;
    }
    uint64_t v79 = v45;
    int v46 = [v4 supportsUnifiedMediaNotifications];
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
    int v50 = [v4 supportsResidentFirstAccessoryCommunication];
    uint64_t v51 = 0x800000;
    if (!v50) {
      uint64_t v51 = 0;
    }
    uint64_t v76 = v51;
    int v52 = [v4 supportsThreadNetworkCredentialSharing];
    uint64_t v53 = 0x1000000;
    if (!v52) {
      uint64_t v53 = 0;
    }
    uint64_t v75 = v53;
    int v54 = [v4 supports5348b248a25f84b0c83e];
    uint64_t v55 = 0x2000000;
    if (!v54) {
      uint64_t v55 = 0;
    }
    uint64_t v74 = v55;
    int v56 = [v4 supportsEventLog];
    uint64_t v57 = 0x4000000;
    if (!v56) {
      uint64_t v57 = 0;
    }
    uint64_t v73 = v57;
    int v58 = [v4 supportsMatterTTU];
    uint64_t v59 = 0x8000000;
    if (!v58) {
      uint64_t v59 = 0;
    }
    if (objc_msgSend(v4, "supportsDistributedExecutionOnPrimary", v59)) {
      uint64_t v60 = 0x10000000;
    }
    else {
      uint64_t v60 = 0;
    }
    if ([v4 supportsResidentActionSetStateEvaluation]) {
      uint64_t v61 = 0x20000000;
    }
    else {
      uint64_t v61 = 0;
    }
    if ([v4 supports9907491178]) {
      uint64_t v62 = 0x40000000;
    }
    else {
      uint64_t v62 = 0;
    }
    if ([v4 supportsRestrictedGuest]) {
      uint64_t v63 = 0x80000000;
    }
    else {
      uint64_t v63 = 0;
    }
    if ([v4 supportsMatterOwnerCertFetch]) {
      uint64_t v64 = 0x100000000;
    }
    else {
      uint64_t v64 = 0;
    }
    v65 = self;
    if ([v4 supportsa15324f096ec183d]) {
      uint64_t v66 = 0x200000000;
    }
    else {
      uint64_t v66 = 0;
    }
    if ([v4 supports7cbb2355da029df2]) {
      uint64_t v67 = 0x400000000;
    }
    else {
      uint64_t v67 = 0;
    }
    if ([v4 supports946950341b318ffd]) {
      uint64_t v68 = 0x800000000;
    }
    else {
      uint64_t v68 = 0;
    }
    int v69 = [v4 supportsheephfaid6gg1p54];
    uint64_t v70 = 0x1000000000;
    if (!v69) {
      uint64_t v70 = 0;
    }
    self = [(HMResidentCapabilities *)v65 initWithTagUUID:v96 capabilities:v95 | v93 | v94 | v92 | v91 | v90 | v89 | v88 | v87 | v86 | v85 | v84 | v83 | v82 | v81 | v80 | v79 | v78 | v77 | v76 | v75 | v74 | v73 | v72 | v60 | v61 | v62 | v63 | v64 | v66 | v67 | v68 | v70];

    v5 = self;
  }

  return v5;
}

- (HMResidentCapabilities)initWithProtoData:(id)a3
{
  id v4 = a3;
  v5 = [[HMProtoResidentCapabilities alloc] initWithData:v4];

  if (v5)
  {
    self = [(HMResidentCapabilities *)self initWithProtoCapabilities:v5];
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
  v3 = objc_alloc_init(HMProtoResidentCapabilities);
  id v4 = [(HMResidentCapabilities *)self tag];
  [(HMProtoResidentCapabilities *)v3 setTag:v4];

  [(HMProtoResidentCapabilities *)v3 setSupportsCameraRecording:[(HMResidentCapabilities *)self supportsCameraRecording]];
  [(HMProtoResidentCapabilities *)v3 setSupportsRouterManagement:[(HMResidentCapabilities *)self supportsRouterManagement]];
  [(HMProtoResidentCapabilities *)v3 setSupportsShortcutActions:[(HMResidentCapabilities *)self supportsShortcutActions]];
  [(HMProtoResidentCapabilities *)v3 setSupportsMediaActions:[(HMResidentCapabilities *)self supportsMediaActions]];
  [(HMProtoResidentCapabilities *)v3 setSupportsCameraSignificantEventNotifications:[(HMResidentCapabilities *)self supportsCameraSignificantEventNotifications]];
  [(HMProtoResidentCapabilities *)v3 setSupportsFirmwareUpdate:[(HMResidentCapabilities *)self supportsFirmwareUpdate]];
  [(HMProtoResidentCapabilities *)v3 setSupportsResidentFirmwareUpdate:[(HMResidentCapabilities *)self supportsResidentFirmwareUpdate]];
  [(HMProtoResidentCapabilities *)v3 setSupportsCameraActivityZones:[(HMResidentCapabilities *)self supportsCameraActivityZones]];
  [(HMProtoResidentCapabilities *)v3 setSupportsFaceClassification:[(HMResidentCapabilities *)self supportsFaceClassification]];
  [(HMProtoResidentCapabilities *)v3 setSupportsNaturalLighting:[(HMResidentCapabilities *)self supportsNaturalLighting]];
  [(HMProtoResidentCapabilities *)v3 setSupportsCameraRecordingReachabilityNotifications:[(HMResidentCapabilities *)self supportsCameraRecordingReachabilityNotifications]];
  [(HMProtoResidentCapabilities *)v3 setSupportsAnnounce:[(HMResidentCapabilities *)self supportsAnnounce]];
  [(HMProtoResidentCapabilities *)v3 setSupportsWakeOnLAN:[(HMResidentCapabilities *)self supportsWakeOnLAN]];
  [(HMProtoResidentCapabilities *)v3 setSupportsLockNotificationContext:[(HMResidentCapabilities *)self supportsLockNotificationContext]];
  [(HMProtoResidentCapabilities *)v3 setSupportsWalletKey:[(HMResidentCapabilities *)self supportsWalletKey]];
  [(HMProtoResidentCapabilities *)v3 setSupportsCameraPackageDetection:[(HMResidentCapabilities *)self supportsCameraPackageDetection]];
  [(HMProtoResidentCapabilities *)v3 setSupportsAccessCodes:[(HMResidentCapabilities *)self supportsAccessCodes]];
  [(HMProtoResidentCapabilities *)v3 setSupportsCHIP:[(HMResidentCapabilities *)self supportsCHIP]];
  [(HMProtoResidentCapabilities *)v3 setSupportsThreadBorderRouter:[(HMResidentCapabilities *)self supportsThreadBorderRouter]];
  [(HMProtoResidentCapabilities *)v3 setSupportsSiriEndpointSetup:[(HMResidentCapabilities *)self supportsSiriEndpointSetup]];
  [(HMProtoResidentCapabilities *)v3 setSupportsCustomMediaApplicationDestination:[(HMResidentCapabilities *)self supportsCustomMediaApplicationDestination]];
  [(HMProtoResidentCapabilities *)v3 setSupportsUnifiedMediaNotifications:[(HMResidentCapabilities *)self supportsUnifiedMediaNotifications]];
  [(HMProtoResidentCapabilities *)v3 setSupportsHomeHub:[(HMResidentCapabilities *)self supportsHomeHub]];
  [(HMProtoResidentCapabilities *)v3 setSupportsResidentFirstAccessoryCommunication:[(HMResidentCapabilities *)self supportsResidentFirstAccessoryCommunication]];
  [(HMProtoResidentCapabilities *)v3 setSupportsThreadNetworkCredentialSharing:[(HMResidentCapabilities *)self supportsThreadNetworkCredentialSharing]];
  [(HMProtoResidentCapabilities *)v3 setSupports5348b248a25f84b0c83e:[(HMResidentCapabilities *)self supportsMatterSharedAdminPairing]];
  [(HMProtoResidentCapabilities *)v3 setSupportsEventLog:[(HMResidentCapabilities *)self supportsEventLog]];
  [(HMProtoResidentCapabilities *)v3 setSupportsMatterTTU:[(HMResidentCapabilities *)self supportsMatterTTU]];
  [(HMProtoResidentCapabilities *)v3 setSupportsDistributedExecutionOnPrimary:[(HMResidentCapabilities *)self supportsDistributedExecutionOnPrimary]];
  [(HMProtoResidentCapabilities *)v3 setSupportsResidentActionSetStateEvaluation:[(HMResidentCapabilities *)self supportsResidentActionSetStateEvaluation]];
  [(HMProtoResidentCapabilities *)v3 setSupports9907491178:[(HMResidentCapabilities *)self supportsUWB]];
  [(HMProtoResidentCapabilities *)v3 setSupportsRestrictedGuest:[(HMResidentCapabilities *)self supportsRestrictedGuest]];
  [(HMProtoResidentCapabilities *)v3 setSupportsMatterOwnerCertFetch:[(HMResidentCapabilities *)self supportsMatterOwnerCertFetch]];
  [(HMProtoResidentCapabilities *)v3 setSupportsa15324f096ec183d:[(HMResidentCapabilities *)self supportsDistributedExecutionOnAppleMediaAccessories]];
  [(HMProtoResidentCapabilities *)v3 setSupports7cbb2355da029df2:[(HMResidentCapabilities *)self supportsResidentSelection]];
  [(HMProtoResidentCapabilities *)v3 setSupports946950341b318ffd:[(HMResidentCapabilities *)self supportsNativeMatter]];
  [(HMProtoResidentCapabilities *)v3 setSupportsheephfaid6gg1p54:[(HMResidentCapabilities *)self supportsUWBUnlock]];

  return v3;
}

- (BOOL)supportsUWBUnlock
{
  if (([(HMResidentCapabilities *)self capabilities] & 0x1000000000) == 0) {
    return 0;
  }

  return _os_feature_enabled_impl();
}

- (BOOL)supportsNativeMatter
{
  if (([(HMResidentCapabilities *)self capabilities] & 0x800000000) == 0) {
    return 0;
  }
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  return HM_FEATURE_RVC_DEFAULTS_ENABLED() != 0;
}

- (BOOL)supportsResidentSelection
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 34) & 1;
}

- (BOOL)supportsDistributedExecutionOnAppleMediaAccessories
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 33) & 1;
}

- (BOOL)supportsMatterOwnerCertFetch
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 32) & 1;
}

- (BOOL)supportsRestrictedGuest
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 31) & 1;
}

- (BOOL)supportsUWB
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 30) & 1;
}

- (BOOL)supportsResidentActionSetStateEvaluation
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 29) & 1;
}

- (BOOL)supportsDistributedExecutionOnPrimary
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 28) & 1;
}

- (BOOL)supportsMatterTTU
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 27) & 1;
}

- (BOOL)supportsEventLog
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 26) & 1;
}

- (BOOL)supportsMatterSharedAdminPairing
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 25) & 1;
}

- (BOOL)supportsThreadNetworkCredentialSharing
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 24) & 1;
}

- (BOOL)supportsResidentFirstAccessoryCommunication
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 23) & 1;
}

- (BOOL)supportsHomeHub
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 22) & 1;
}

- (BOOL)supportsUnifiedMediaNotifications
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 21) & 1;
}

- (BOOL)supportsCustomMediaApplicationDestination
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 20) & 1;
}

- (BOOL)supportsSiriEndpointSetup
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 19) & 1;
}

- (BOOL)supportsThreadBorderRouter
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 18) & 1;
}

- (BOOL)supportsCHIP
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 17) & 1;
}

- (BOOL)supportsAccessCodes
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 16) & 1;
}

- (BOOL)supportsCameraPackageDetection
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 15) & 1;
}

- (BOOL)supportsWalletKey
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 14) & 1;
}

- (BOOL)supportsLockNotificationContext
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 13) & 1;
}

- (BOOL)supportsWakeOnLAN
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 12) & 1;
}

- (BOOL)supportsAnnounce
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 11) & 1;
}

- (BOOL)supportsCameraRecordingReachabilityNotifications
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 10) & 1;
}

- (BOOL)supportsNaturalLighting
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 9) & 1;
}

- (BOOL)supportsFaceClassification
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 8) & 1;
}

- (BOOL)supportsCameraActivityZones
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 7) & 1;
}

- (BOOL)supportsResidentFirmwareUpdate
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 6) & 1;
}

- (BOOL)supportsFirmwareUpdate
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 5) & 1;
}

- (BOOL)supportsCameraSignificantEventNotifications
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 4) & 1;
}

- (BOOL)supportsMediaActions
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 3) & 1;
}

- (BOOL)supportsShortcutActions
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 2) & 1;
}

- (BOOL)supportsRouterManagement
{
  return ((unint64_t)[(HMResidentCapabilities *)self capabilities] >> 1) & 1;
}

- (BOOL)supportsCameraRecording
{
  return [(HMResidentCapabilities *)self capabilities] & 1;
}

- (BOOL)isResidentCapable
{
  return 1;
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
    goto LABEL_45;
  }
  int v7 = [(HMResidentCapabilities *)self supportsCameraRecording];
  if (v7 != [v6 supportsCameraRecording]) {
    goto LABEL_45;
  }
  int v8 = [(HMResidentCapabilities *)self supportsRouterManagement];
  if (v8 != [v6 supportsRouterManagement]) {
    goto LABEL_45;
  }
  int v9 = [(HMResidentCapabilities *)self supportsShortcutActions];
  if (v9 != [v6 supportsShortcutActions]) {
    goto LABEL_45;
  }
  int v10 = [(HMResidentCapabilities *)self supportsMediaActions];
  if (v10 != [v6 supportsMediaActions]) {
    goto LABEL_45;
  }
  int v11 = [(HMResidentCapabilities *)self supportsCameraSignificantEventNotifications];
  if (v11 != [v6 supportsCameraSignificantEventNotifications]) {
    goto LABEL_45;
  }
  int v12 = [(HMResidentCapabilities *)self supportsFirmwareUpdate];
  if (v12 != [v6 supportsFirmwareUpdate]) {
    goto LABEL_45;
  }
  int v13 = [(HMResidentCapabilities *)self supportsResidentFirmwareUpdate];
  if (v13 != [v6 supportsResidentFirmwareUpdate]) {
    goto LABEL_45;
  }
  int v14 = [(HMResidentCapabilities *)self supportsCameraActivityZones];
  if (v14 != [v6 supportsCameraActivityZones]) {
    goto LABEL_45;
  }
  int v15 = [(HMResidentCapabilities *)self supportsFaceClassification];
  if (v15 != [v6 supportsFaceClassification]) {
    goto LABEL_45;
  }
  int v16 = [(HMResidentCapabilities *)self supportsNaturalLighting];
  if (v16 != [v6 supportsNaturalLighting]) {
    goto LABEL_45;
  }
  int v17 = [(HMResidentCapabilities *)self supportsCameraRecordingReachabilityNotifications];
  if (v17 != [v6 supportsCameraRecordingReachabilityNotifications]) {
    goto LABEL_45;
  }
  int v18 = [(HMResidentCapabilities *)self supportsAnnounce];
  if (v18 != [v6 supportsAnnounce]) {
    goto LABEL_45;
  }
  int v19 = [(HMResidentCapabilities *)self supportsWakeOnLAN];
  if (v19 != [v6 supportsWakeOnLAN]) {
    goto LABEL_45;
  }
  int v20 = [(HMResidentCapabilities *)self supportsLockNotificationContext];
  if (v20 != [v6 supportsLockNotificationContext]) {
    goto LABEL_45;
  }
  int v21 = [(HMResidentCapabilities *)self supportsWalletKey];
  if (v21 != [v6 supportsWalletKey]) {
    goto LABEL_45;
  }
  int v22 = [(HMResidentCapabilities *)self supportsCameraPackageDetection];
  if (v22 != [v6 supportsCameraPackageDetection]) {
    goto LABEL_45;
  }
  int v23 = [(HMResidentCapabilities *)self supportsAccessCodes];
  if (v23 != [v6 supportsAccessCodes]) {
    goto LABEL_45;
  }
  int v24 = [(HMResidentCapabilities *)self supportsCHIP];
  if (v24 != [v6 supportsCHIP]) {
    goto LABEL_45;
  }
  int v25 = [(HMResidentCapabilities *)self supportsThreadBorderRouter];
  if (v25 != [v6 supportsThreadBorderRouter]) {
    goto LABEL_45;
  }
  int v26 = [(HMResidentCapabilities *)self supportsSiriEndpointSetup];
  if (v26 != [v6 supportsSiriEndpointSetup]) {
    goto LABEL_45;
  }
  int v27 = [(HMResidentCapabilities *)self supportsCustomMediaApplicationDestination];
  if (v27 != [v6 supportsCustomMediaApplicationDestination]) {
    goto LABEL_45;
  }
  int v28 = [(HMResidentCapabilities *)self supportsUnifiedMediaNotifications];
  if (v28 != [v6 supportsUnifiedMediaNotifications]) {
    goto LABEL_45;
  }
  int v29 = [(HMResidentCapabilities *)self supportsHomeHub];
  if (v29 != [v6 supportsHomeHub]) {
    goto LABEL_45;
  }
  int v30 = [(HMResidentCapabilities *)self supportsResidentFirstAccessoryCommunication];
  if (v30 != [v6 supportsResidentFirstAccessoryCommunication]) {
    goto LABEL_45;
  }
  int v31 = [(HMResidentCapabilities *)self supportsThreadNetworkCredentialSharing];
  if (v31 != [v6 supportsThreadNetworkCredentialSharing]) {
    goto LABEL_45;
  }
  int v32 = [(HMResidentCapabilities *)self supportsMatterSharedAdminPairing];
  if (v32 != [v6 supportsMatterSharedAdminPairing]) {
    goto LABEL_45;
  }
  int v33 = [(HMResidentCapabilities *)self supportsEventLog];
  if (v33 != [v6 supportsEventLog]) {
    goto LABEL_45;
  }
  int v34 = [(HMResidentCapabilities *)self supportsMatterTTU];
  if (v34 != [v6 supportsMatterTTU]) {
    goto LABEL_45;
  }
  int v35 = [(HMResidentCapabilities *)self supportsDistributedExecutionOnPrimary];
  if (v35 != [v6 supportsDistributedExecutionOnPrimary]) {
    goto LABEL_45;
  }
  int v36 = [(HMResidentCapabilities *)self supportsResidentActionSetStateEvaluation];
  if (v36 != [v6 supportsResidentActionSetStateEvaluation]) {
    goto LABEL_45;
  }
  int v37 = [(HMResidentCapabilities *)self supportsUWB];
  if (v37 != [v6 supportsUWB]) {
    goto LABEL_45;
  }
  int v38 = [(HMResidentCapabilities *)self supportsRestrictedGuest];
  if (v38 != [v6 supportsRestrictedGuest]) {
    goto LABEL_45;
  }
  int v39 = [(HMResidentCapabilities *)self supportsMatterOwnerCertFetch];
  if (v39 != [v6 supportsMatterOwnerCertFetch]) {
    goto LABEL_45;
  }
  int v40 = [(HMResidentCapabilities *)self supportsDistributedExecutionOnAppleMediaAccessories];
  if (v40 != [v6 supportsDistributedExecutionOnAppleMediaAccessories]) {
    goto LABEL_45;
  }
  int v41 = [(HMResidentCapabilities *)self supportsResidentSelection];
  if (v41 != [v6 supportsResidentSelection]) {
    goto LABEL_45;
  }
  int v42 = [(HMResidentCapabilities *)self supportsNativeMatter];
  if (v42 != [v6 supportsNativeMatter]
    && ((_os_feature_enabled_impl() & 1) != 0 || HM_FEATURE_RVC_DEFAULTS_ENABLED()))
  {
    goto LABEL_45;
  }
  int v43 = [(HMResidentCapabilities *)self supportsUWBUnlock];
  if (v43 == [v6 supportsUWBUnlock] || (_os_feature_enabled_impl() & 1) == 0) {
    BOOL v44 = 1;
  }
  else {
LABEL_45:
  }
    BOOL v44 = 0;

  return v44;
}

- (unint64_t)hash
{
  v2 = [(HMResidentCapabilities *)self tag];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMResidentCapabilities *)a3;
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
      int v7 = [(HMResidentCapabilities *)self tag];
      int v8 = [(HMResidentCapabilities *)v6 tag];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (HMResidentCapabilities)initWithTagUUID:(id)a3 capabilities:(_HMResidentCapabilitiesStruct)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMResidentCapabilities;
  int v7 = [(HMResidentCapabilities *)&v11 init];
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