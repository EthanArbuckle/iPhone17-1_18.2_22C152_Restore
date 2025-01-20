@interface CEMDeviceInformationCommand_StatusQueryResponses
+ (NSSet)allowedStatusKeys;
+ (id)buildRequiredOnly;
+ (id)buildWithUDID:(id)a3 withOrganizationInfo:(id)a4 withMDMOptions:(id)a5 withLastCloudBackupDate:(id)a6 withAwaitingConfiguration:(id)a7 withITunesStoreAccountIsActive:(id)a8 withITunesStoreAccountHash:(id)a9 withDeviceName:(id)a10 withOSVersion:(id)a11 withBuildVersion:(id)a12 withModelName:(id)a13 withModel:(id)a14 withProductName:(id)a15 withMarketingName:(id)a16 withSerialNumber:(id)a17 withDeviceCapacity:(id)a18 withAvailableDeviceCapacity:(id)a19 withIMEI:(id)a20 withMEID:(id)a21 withModemFirmwareVersion:(id)a22 withCellularTechnology:(id)a23 withBatteryLevel:(id)a24 withIsSupervised:(id)a25 withIsMultiUser:(id)a26 withIsDeviceLocatorServiceEnabled:(id)a27 withIsActivationLockEnabled:(id)a28 withIsDoNotDisturbInEffect:(id)a29 withDeviceID:(id)a30 withEASDeviceIdentifier:(id)a31 withIsCloudBackupEnabled:(id)a32 withActiveManagedUsers:(id)a33 withOSUpdateSettings:(id)a34 withAutoSetupAdminAccounts:(id)a35 withSystemIntegrityProtectionEnabled:(id)a36 withIsMDMLostModeEnabled:(id)a37 withMaximumResidentUsers:(id)a38 withPushToken:(id)a39 withDiagnosticSubmissionEnabled:(id)a40 withAppAnalyticsEnabled:(id)a41 withICCID:(id)a42 withBluetoothMAC:(id)a43 withWiFiMAC:(id)a44 withEthernetMACs:(id)a45 withCurrentCarrierNetwork:(id)a46 withSIMCarrierNetwork:(id)a47 withSubscriberCarrierNetwork:(id)a48 withCarrierSettingsVersion:(id)a49 withPhoneNumber:(id)a50 withDataRoamingEnabled:(id)a51 withVoiceRoamingEnabled:(id)a52 withPersonalHotspotEnabled:(id)a53 withIsNetworkTethered:(id)a54 withIsRoaming:(id)a55 withSIMMCC:(id)a56 withSIMMNC:(id)a57 withSubscriberMCC:(id)a58 withSubscriberMNC:(id)a59 withCurrentMCC:(id)a60 withCurrentMNC:(id)a61;
- (BOOL)loadPayload:(id)a3 error:(id *)a4;
- (CEMDeviceInformationCommand_StatusQueryResponsesOSUpdateSettings)statusOSUpdateSettings;
- (CEMDeviceInformationCommand_StatusQueryResponsesOrganizationInfo)statusOrganizationInfo;
- (NSArray)statusActiveManagedUsers;
- (NSArray)statusAutoSetupAdminAccounts;
- (NSArray)statusEthernetMACs;
- (NSDate)statusLastCloudBackupDate;
- (NSNumber)statusAppAnalyticsEnabled;
- (NSNumber)statusAvailableDeviceCapacity;
- (NSNumber)statusAwaitingConfiguration;
- (NSNumber)statusBatteryLevel;
- (NSNumber)statusCellularTechnology;
- (NSNumber)statusDataRoamingEnabled;
- (NSNumber)statusDeviceCapacity;
- (NSNumber)statusDiagnosticSubmissionEnabled;
- (NSNumber)statusITunesStoreAccountIsActive;
- (NSNumber)statusIsActivationLockEnabled;
- (NSNumber)statusIsCloudBackupEnabled;
- (NSNumber)statusIsDeviceLocatorServiceEnabled;
- (NSNumber)statusIsDoNotDisturbInEffect;
- (NSNumber)statusIsMDMLostModeEnabled;
- (NSNumber)statusIsMultiUser;
- (NSNumber)statusIsNetworkTethered;
- (NSNumber)statusIsRoaming;
- (NSNumber)statusIsSupervised;
- (NSNumber)statusMaximumResidentUsers;
- (NSNumber)statusPersonalHotspotEnabled;
- (NSNumber)statusSystemIntegrityProtectionEnabled;
- (NSNumber)statusVoiceRoamingEnabled;
- (NSString)statusBluetoothMAC;
- (NSString)statusBuildVersion;
- (NSString)statusCarrierSettingsVersion;
- (NSString)statusCurrentCarrierNetwork;
- (NSString)statusCurrentMCC;
- (NSString)statusCurrentMNC;
- (NSString)statusDeviceID;
- (NSString)statusDeviceName;
- (NSString)statusEASDeviceIdentifier;
- (NSString)statusICCID;
- (NSString)statusIMEI;
- (NSString)statusITunesStoreAccountHash;
- (NSString)statusMDMOptions;
- (NSString)statusMEID;
- (NSString)statusMarketingName;
- (NSString)statusModel;
- (NSString)statusModelName;
- (NSString)statusModemFirmwareVersion;
- (NSString)statusOSVersion;
- (NSString)statusPhoneNumber;
- (NSString)statusProductName;
- (NSString)statusPushToken;
- (NSString)statusSIMCarrierNetwork;
- (NSString)statusSIMMCC;
- (NSString)statusSIMMNC;
- (NSString)statusSerialNumber;
- (NSString)statusSubscriberCarrierNetwork;
- (NSString)statusSubscriberMCC;
- (NSString)statusSubscriberMNC;
- (NSString)statusUDID;
- (NSString)statusWiFiMAC;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializePayload;
- (void)setStatusActiveManagedUsers:(id)a3;
- (void)setStatusAppAnalyticsEnabled:(id)a3;
- (void)setStatusAutoSetupAdminAccounts:(id)a3;
- (void)setStatusAvailableDeviceCapacity:(id)a3;
- (void)setStatusAwaitingConfiguration:(id)a3;
- (void)setStatusBatteryLevel:(id)a3;
- (void)setStatusBluetoothMAC:(id)a3;
- (void)setStatusBuildVersion:(id)a3;
- (void)setStatusCarrierSettingsVersion:(id)a3;
- (void)setStatusCellularTechnology:(id)a3;
- (void)setStatusCurrentCarrierNetwork:(id)a3;
- (void)setStatusCurrentMCC:(id)a3;
- (void)setStatusCurrentMNC:(id)a3;
- (void)setStatusDataRoamingEnabled:(id)a3;
- (void)setStatusDeviceCapacity:(id)a3;
- (void)setStatusDeviceID:(id)a3;
- (void)setStatusDeviceName:(id)a3;
- (void)setStatusDiagnosticSubmissionEnabled:(id)a3;
- (void)setStatusEASDeviceIdentifier:(id)a3;
- (void)setStatusEthernetMACs:(id)a3;
- (void)setStatusICCID:(id)a3;
- (void)setStatusIMEI:(id)a3;
- (void)setStatusITunesStoreAccountHash:(id)a3;
- (void)setStatusITunesStoreAccountIsActive:(id)a3;
- (void)setStatusIsActivationLockEnabled:(id)a3;
- (void)setStatusIsCloudBackupEnabled:(id)a3;
- (void)setStatusIsDeviceLocatorServiceEnabled:(id)a3;
- (void)setStatusIsDoNotDisturbInEffect:(id)a3;
- (void)setStatusIsMDMLostModeEnabled:(id)a3;
- (void)setStatusIsMultiUser:(id)a3;
- (void)setStatusIsNetworkTethered:(id)a3;
- (void)setStatusIsRoaming:(id)a3;
- (void)setStatusIsSupervised:(id)a3;
- (void)setStatusLastCloudBackupDate:(id)a3;
- (void)setStatusMDMOptions:(id)a3;
- (void)setStatusMEID:(id)a3;
- (void)setStatusMarketingName:(id)a3;
- (void)setStatusMaximumResidentUsers:(id)a3;
- (void)setStatusModel:(id)a3;
- (void)setStatusModelName:(id)a3;
- (void)setStatusModemFirmwareVersion:(id)a3;
- (void)setStatusOSUpdateSettings:(id)a3;
- (void)setStatusOSVersion:(id)a3;
- (void)setStatusOrganizationInfo:(id)a3;
- (void)setStatusPersonalHotspotEnabled:(id)a3;
- (void)setStatusPhoneNumber:(id)a3;
- (void)setStatusProductName:(id)a3;
- (void)setStatusPushToken:(id)a3;
- (void)setStatusSIMCarrierNetwork:(id)a3;
- (void)setStatusSIMMCC:(id)a3;
- (void)setStatusSIMMNC:(id)a3;
- (void)setStatusSerialNumber:(id)a3;
- (void)setStatusSubscriberCarrierNetwork:(id)a3;
- (void)setStatusSubscriberMCC:(id)a3;
- (void)setStatusSubscriberMNC:(id)a3;
- (void)setStatusSystemIntegrityProtectionEnabled:(id)a3;
- (void)setStatusUDID:(id)a3;
- (void)setStatusVoiceRoamingEnabled:(id)a3;
- (void)setStatusWiFiMAC:(id)a3;
@end

@implementation CEMDeviceInformationCommand_StatusQueryResponses

+ (NSSet)allowedStatusKeys
{
  v6[59] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v6[0] = @"UDID";
  v6[1] = @"OrganizationInfo";
  v6[2] = @"MDMOptions";
  v6[3] = @"LastCloudBackupDate";
  v6[4] = @"AwaitingConfiguration";
  v6[5] = @"iTunesStoreAccountIsActive";
  v6[6] = @"iTunesStoreAccountHash";
  v6[7] = @"DeviceName";
  v6[8] = @"OSVersion";
  v6[9] = @"BuildVersion";
  v6[10] = @"ModelName";
  v6[11] = @"Model";
  v6[12] = @"ProductName";
  v6[13] = @"MarketingName";
  v6[14] = @"SerialNumber";
  v6[15] = @"DeviceCapacity";
  v6[16] = @"AvailableDeviceCapacity";
  v6[17] = @"IMEI";
  v6[18] = @"MEID";
  v6[19] = @"ModemFirmwareVersion";
  v6[20] = @"CellularTechnology";
  v6[21] = @"BatteryLevel";
  v6[22] = @"IsSupervised";
  v6[23] = @"IsMultiUser";
  v6[24] = @"IsDeviceLocatorServiceEnabled";
  v6[25] = @"IsActivationLockEnabled";
  v6[26] = @"IsDoNotDisturbInEffect";
  v6[27] = @"DeviceID";
  v6[28] = @"EASDeviceIdentifier";
  v6[29] = @"IsCloudBackupEnabled";
  v6[30] = @"ActiveManagedUsers";
  v6[31] = @"OSUpdateSettings";
  v6[32] = @"AutoSetupAdminAccounts";
  v6[33] = @"SystemIntegrityProtectionEnabled";
  v6[34] = @"IsMDMLostModeEnabled";
  v6[35] = @"MaximumResidentUsers";
  v6[36] = @"PushToken";
  v6[37] = @"DiagnosticSubmissionEnabled";
  v6[38] = @"AppAnalyticsEnabled";
  v6[39] = @"ICCID";
  v6[40] = @"BluetoothMAC";
  v6[41] = @"WiFiMAC";
  v6[42] = @"EthernetMACs";
  v6[43] = @"CurrentCarrierNetwork";
  v6[44] = @"SIMCarrierNetwork";
  v6[45] = @"SubscriberCarrierNetwork";
  v6[46] = @"CarrierSettingsVersion";
  v6[47] = @"PhoneNumber";
  v6[48] = @"DataRoamingEnabled";
  v6[49] = @"VoiceRoamingEnabled";
  v6[50] = @"PersonalHotspotEnabled";
  v6[51] = @"IsNetworkTethered";
  v6[52] = @"IsRoaming";
  v6[53] = @"SIMMCC";
  v6[54] = @"SIMMNC";
  v6[55] = @"SubscriberMCC";
  v6[56] = @"SubscriberMNC";
  v6[57] = @"CurrentMCC";
  v6[58] = @"CurrentMNC";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:59];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

+ (id)buildWithUDID:(id)a3 withOrganizationInfo:(id)a4 withMDMOptions:(id)a5 withLastCloudBackupDate:(id)a6 withAwaitingConfiguration:(id)a7 withITunesStoreAccountIsActive:(id)a8 withITunesStoreAccountHash:(id)a9 withDeviceName:(id)a10 withOSVersion:(id)a11 withBuildVersion:(id)a12 withModelName:(id)a13 withModel:(id)a14 withProductName:(id)a15 withMarketingName:(id)a16 withSerialNumber:(id)a17 withDeviceCapacity:(id)a18 withAvailableDeviceCapacity:(id)a19 withIMEI:(id)a20 withMEID:(id)a21 withModemFirmwareVersion:(id)a22 withCellularTechnology:(id)a23 withBatteryLevel:(id)a24 withIsSupervised:(id)a25 withIsMultiUser:(id)a26 withIsDeviceLocatorServiceEnabled:(id)a27 withIsActivationLockEnabled:(id)a28 withIsDoNotDisturbInEffect:(id)a29 withDeviceID:(id)a30 withEASDeviceIdentifier:(id)a31 withIsCloudBackupEnabled:(id)a32 withActiveManagedUsers:(id)a33 withOSUpdateSettings:(id)a34 withAutoSetupAdminAccounts:(id)a35 withSystemIntegrityProtectionEnabled:(id)a36 withIsMDMLostModeEnabled:(id)a37 withMaximumResidentUsers:(id)a38 withPushToken:(id)a39 withDiagnosticSubmissionEnabled:(id)a40 withAppAnalyticsEnabled:(id)a41 withICCID:(id)a42 withBluetoothMAC:(id)a43 withWiFiMAC:(id)a44 withEthernetMACs:(id)a45 withCurrentCarrierNetwork:(id)a46 withSIMCarrierNetwork:(id)a47 withSubscriberCarrierNetwork:(id)a48 withCarrierSettingsVersion:(id)a49 withPhoneNumber:(id)a50 withDataRoamingEnabled:(id)a51 withVoiceRoamingEnabled:(id)a52 withPersonalHotspotEnabled:(id)a53 withIsNetworkTethered:(id)a54 withIsRoaming:(id)a55 withSIMMCC:(id)a56 withSIMMNC:(id)a57 withSubscriberMCC:(id)a58 withSubscriberMNC:(id)a59 withCurrentMCC:(id)a60 withCurrentMNC:(id)a61
{
  id v127 = a61;
  id v126 = a60;
  id v125 = a59;
  id v124 = a58;
  id v123 = a57;
  id v122 = a56;
  id v121 = a55;
  id v120 = a54;
  id v119 = a53;
  id v118 = a52;
  id v117 = a51;
  id v116 = a50;
  id v115 = a49;
  id v114 = a48;
  id v113 = a47;
  id v112 = a46;
  id v111 = a45;
  id v110 = a44;
  id v109 = a43;
  id v108 = a42;
  id v107 = a41;
  id v106 = a40;
  id v105 = a39;
  id v104 = a38;
  id v103 = a37;
  id v102 = a36;
  id v101 = a35;
  id v100 = a34;
  id v99 = a33;
  id v98 = a32;
  id v97 = a31;
  id v96 = a30;
  id v95 = a29;
  id v94 = a28;
  id v91 = a27;
  id v87 = a26;
  id v85 = a25;
  id v84 = a24;
  id v81 = a23;
  id v77 = a22;
  id v74 = a21;
  id v72 = a20;
  id v73 = a19;
  id v75 = a18;
  id v76 = a17;
  id v78 = a16;
  id v79 = a15;
  id v80 = a14;
  id v82 = a13;
  id v83 = a12;
  id v61 = a11;
  id v62 = a10;
  id v63 = a9;
  id v64 = a8;
  id v65 = a7;
  id v66 = a6;
  id v67 = a5;
  id v68 = a4;
  id v69 = a3;
  v70 = objc_opt_new();
  [v70 setStatusUDID:v69];

  [v70 setStatusOrganizationInfo:v68];
  [v70 setStatusMDMOptions:v67];

  [v70 setStatusLastCloudBackupDate:v66];
  [v70 setStatusAwaitingConfiguration:v65];

  [v70 setStatusITunesStoreAccountIsActive:v64];
  [v70 setStatusITunesStoreAccountHash:v63];

  [v70 setStatusDeviceName:v62];
  [v70 setStatusOSVersion:v61];

  [v70 setStatusBuildVersion:v83];
  [v70 setStatusModelName:v82];

  [v70 setStatusModel:v80];
  [v70 setStatusProductName:v79];

  [v70 setStatusMarketingName:v78];
  [v70 setStatusSerialNumber:v76];

  [v70 setStatusDeviceCapacity:v75];
  [v70 setStatusAvailableDeviceCapacity:v73];

  [v70 setStatusIMEI:v72];
  [v70 setStatusMEID:v74];

  [v70 setStatusModemFirmwareVersion:v77];
  [v70 setStatusCellularTechnology:v81];

  [v70 setStatusBatteryLevel:v84];
  [v70 setStatusIsSupervised:v85];

  [v70 setStatusIsMultiUser:v87];
  [v70 setStatusIsDeviceLocatorServiceEnabled:v91];

  [v70 setStatusIsActivationLockEnabled:v94];
  [v70 setStatusIsDoNotDisturbInEffect:v95];

  [v70 setStatusDeviceID:v96];
  [v70 setStatusEASDeviceIdentifier:v97];

  [v70 setStatusIsCloudBackupEnabled:v98];
  [v70 setStatusActiveManagedUsers:v99];

  [v70 setStatusOSUpdateSettings:v100];
  [v70 setStatusAutoSetupAdminAccounts:v101];

  [v70 setStatusSystemIntegrityProtectionEnabled:v102];
  [v70 setStatusIsMDMLostModeEnabled:v103];

  [v70 setStatusMaximumResidentUsers:v104];
  [v70 setStatusPushToken:v105];

  [v70 setStatusDiagnosticSubmissionEnabled:v106];
  [v70 setStatusAppAnalyticsEnabled:v107];

  [v70 setStatusICCID:v108];
  [v70 setStatusBluetoothMAC:v109];

  [v70 setStatusWiFiMAC:v110];
  [v70 setStatusEthernetMACs:v111];

  [v70 setStatusCurrentCarrierNetwork:v112];
  [v70 setStatusSIMCarrierNetwork:v113];

  [v70 setStatusSubscriberCarrierNetwork:v114];
  [v70 setStatusCarrierSettingsVersion:v115];

  [v70 setStatusPhoneNumber:v116];
  [v70 setStatusDataRoamingEnabled:v117];

  [v70 setStatusVoiceRoamingEnabled:v118];
  [v70 setStatusPersonalHotspotEnabled:v119];

  [v70 setStatusIsNetworkTethered:v120];
  [v70 setStatusIsRoaming:v121];

  [v70 setStatusSIMMCC:v122];
  [v70 setStatusSIMMNC:v123];

  [v70 setStatusSubscriberMCC:v124];
  [v70 setStatusSubscriberMNC:v125];

  [v70 setStatusCurrentMCC:v126];
  [v70 setStatusCurrentMNC:v127];

  return v70;
}

+ (id)buildRequiredOnly
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  v194[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263EFF9C0];
  v8 = [v6 allKeys];
  v9 = [v7 setWithArray:v8];

  v10 = +[CEMDeviceInformationCommand_StatusQueryResponses allowedStatusKeys];
  [v9 minusSet:v10];

  if ([v9 count])
  {
    if (!a4)
    {
      BOOL v14 = 0;
      goto LABEL_68;
    }
    v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v193 = *MEMORY[0x263F08320];
    id v12 = [NSString stringWithFormat:@"Unexpected payload keys: %@", v9];
    v194[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v194 forKeys:&v193 count:1];
    *a4 = [v11 errorWithDomain:@"error" code:1 userInfo:v13];

    BOOL v14 = 0;
  }
  else
  {
    id v192 = 0;
    v15 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"UDID" isRequired:0 defaultValue:0 error:&v192];
    id v12 = v192;
    statusUDID = self->_statusUDID;
    self->_statusUDID = v15;

    if (!v12)
    {
      id v191 = 0;
      v17 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"OrganizationInfo" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v191];
      id v12 = v191;
      statusOrganizationInfo = self->_statusOrganizationInfo;
      self->_statusOrganizationInfo = v17;

      if (!v12)
      {
        id v190 = 0;
        v19 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"MDMOptions" isRequired:0 defaultValue:0 error:&v190];
        id v12 = v190;
        statusMDMOptions = self->_statusMDMOptions;
        self->_statusMDMOptions = v19;

        if (!v12)
        {
          id v189 = 0;
          v21 = [(CEMPayloadBase *)self loadDateFromDictionary:v6 withKey:@"LastCloudBackupDate" isRequired:0 defaultValue:0 error:&v189];
          id v12 = v189;
          statusLastCloudBackupDate = self->_statusLastCloudBackupDate;
          self->_statusLastCloudBackupDate = v21;

          if (!v12)
          {
            id v188 = 0;
            v23 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AwaitingConfiguration" isRequired:0 defaultValue:0 error:&v188];
            id v12 = v188;
            statusAwaitingConfiguration = self->_statusAwaitingConfiguration;
            self->_statusAwaitingConfiguration = v23;

            if (!v12)
            {
              id v187 = 0;
              v25 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"iTunesStoreAccountIsActive" isRequired:0 defaultValue:0 error:&v187];
              id v12 = v187;
              statusITunesStoreAccountIsActive = self->_statusITunesStoreAccountIsActive;
              self->_statusITunesStoreAccountIsActive = v25;

              if (!v12)
              {
                id v186 = 0;
                v27 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"iTunesStoreAccountHash" isRequired:0 defaultValue:0 error:&v186];
                id v12 = v186;
                statusITunesStoreAccountHash = self->_statusITunesStoreAccountHash;
                self->_statusITunesStoreAccountHash = v27;

                if (!v12)
                {
                  id v185 = 0;
                  v29 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DeviceName" isRequired:0 defaultValue:0 error:&v185];
                  id v12 = v185;
                  statusDeviceName = self->_statusDeviceName;
                  self->_statusDeviceName = v29;

                  if (!v12)
                  {
                    id v184 = 0;
                    v31 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"OSVersion" isRequired:0 defaultValue:0 error:&v184];
                    id v12 = v184;
                    statusOSVersion = self->_statusOSVersion;
                    self->_statusOSVersion = v31;

                    if (!v12)
                    {
                      id v183 = 0;
                      v33 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"BuildVersion" isRequired:0 defaultValue:0 error:&v183];
                      id v12 = v183;
                      statusBuildVersion = self->_statusBuildVersion;
                      self->_statusBuildVersion = v33;

                      if (!v12)
                      {
                        id v182 = 0;
                        v35 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ModelName" isRequired:0 defaultValue:0 error:&v182];
                        id v12 = v182;
                        statusModelName = self->_statusModelName;
                        self->_statusModelName = v35;

                        if (!v12)
                        {
                          id v181 = 0;
                          v37 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"Model" isRequired:0 defaultValue:0 error:&v181];
                          id v12 = v181;
                          statusModel = self->_statusModel;
                          self->_statusModel = v37;

                          if (!v12)
                          {
                            id v180 = 0;
                            v39 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ProductName" isRequired:0 defaultValue:0 error:&v180];
                            id v12 = v180;
                            statusProductName = self->_statusProductName;
                            self->_statusProductName = v39;

                            if (!v12)
                            {
                              id v179 = 0;
                              v41 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"MarketingName" isRequired:0 defaultValue:0 error:&v179];
                              id v12 = v179;
                              statusMarketingName = self->_statusMarketingName;
                              self->_statusMarketingName = v41;

                              if (!v12)
                              {
                                id v178 = 0;
                                v43 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"SerialNumber" isRequired:0 defaultValue:0 error:&v178];
                                id v12 = v178;
                                statusSerialNumber = self->_statusSerialNumber;
                                self->_statusSerialNumber = v43;

                                if (!v12)
                                {
                                  id v177 = 0;
                                  v45 = [(CEMPayloadBase *)self loadFloatFromDictionary:v6 withKey:@"DeviceCapacity" isRequired:0 defaultValue:0 error:&v177];
                                  id v12 = v177;
                                  statusDeviceCapacity = self->_statusDeviceCapacity;
                                  self->_statusDeviceCapacity = v45;

                                  if (!v12)
                                  {
                                    id v176 = 0;
                                    v47 = [(CEMPayloadBase *)self loadFloatFromDictionary:v6 withKey:@"AvailableDeviceCapacity" isRequired:0 defaultValue:0 error:&v176];
                                    id v12 = v176;
                                    statusAvailableDeviceCapacity = self->_statusAvailableDeviceCapacity;
                                    self->_statusAvailableDeviceCapacity = v47;

                                    if (!v12)
                                    {
                                      id v175 = 0;
                                      v49 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"IMEI" isRequired:0 defaultValue:0 error:&v175];
                                      id v12 = v175;
                                      statusIMEI = self->_statusIMEI;
                                      self->_statusIMEI = v49;

                                      if (!v12)
                                      {
                                        id v174 = 0;
                                        v51 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"MEID" isRequired:0 defaultValue:0 error:&v174];
                                        id v12 = v174;
                                        statusMEID = self->_statusMEID;
                                        self->_statusMEID = v51;

                                        if (!v12)
                                        {
                                          id v173 = 0;
                                          v53 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ModemFirmwareVersion" isRequired:0 defaultValue:0 error:&v173];
                                          id v12 = v173;
                                          statusModemFirmwareVersion = self->_statusModemFirmwareVersion;
                                          self->_statusModemFirmwareVersion = v53;

                                          if (!v12)
                                          {
                                            id v172 = 0;
                                            v55 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"CellularTechnology" isRequired:0 defaultValue:0 error:&v172];
                                            id v12 = v172;
                                            statusCellularTechnology = self->_statusCellularTechnology;
                                            self->_statusCellularTechnology = v55;

                                            if (!v12)
                                            {
                                              id v171 = 0;
                                              v57 = [(CEMPayloadBase *)self loadFloatFromDictionary:v6 withKey:@"BatteryLevel" isRequired:0 defaultValue:0 error:&v171];
                                              id v12 = v171;
                                              statusBatteryLevel = self->_statusBatteryLevel;
                                              self->_statusBatteryLevel = v57;

                                              if (!v12)
                                              {
                                                id v170 = 0;
                                                v59 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"IsSupervised" isRequired:0 defaultValue:0 error:&v170];
                                                id v12 = v170;
                                                statusIsSupervised = self->_statusIsSupervised;
                                                self->_statusIsSupervised = v59;

                                                if (!v12)
                                                {
                                                  id v169 = 0;
                                                  id v61 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"IsMultiUser" isRequired:0 defaultValue:0 error:&v169];
                                                  id v12 = v169;
                                                  statusIsMultiUser = self->_statusIsMultiUser;
                                                  self->_statusIsMultiUser = v61;

                                                  if (!v12)
                                                  {
                                                    id v168 = 0;
                                                    id v63 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"IsDeviceLocatorServiceEnabled" isRequired:0 defaultValue:0 error:&v168];
                                                    id v12 = v168;
                                                    statusIsDeviceLocatorServiceEnabled = self->_statusIsDeviceLocatorServiceEnabled;
                                                    self->_statusIsDeviceLocatorServiceEnabled = v63;

                                                    if (!v12)
                                                    {
                                                      id v167 = 0;
                                                      id v65 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"IsActivationLockEnabled" isRequired:0 defaultValue:0 error:&v167];
                                                      id v12 = v167;
                                                      statusIsActivationLockEnabled = self->_statusIsActivationLockEnabled;
                                                      self->_statusIsActivationLockEnabled = v65;

                                                      if (!v12)
                                                      {
                                                        id v166 = 0;
                                                        id v67 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"IsDoNotDisturbInEffect" isRequired:0 defaultValue:0 error:&v166];
                                                        id v12 = v166;
                                                        statusIsDoNotDisturbInEffect = self->_statusIsDoNotDisturbInEffect;
                                                        self->_statusIsDoNotDisturbInEffect = v67;

                                                        if (!v12)
                                                        {
                                                          id v165 = 0;
                                                          id v69 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"DeviceID" isRequired:0 defaultValue:0 error:&v165];
                                                          id v12 = v165;
                                                          statusDeviceID = self->_statusDeviceID;
                                                          self->_statusDeviceID = v69;

                                                          if (!v12)
                                                          {
                                                            id v164 = 0;
                                                            v71 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"EASDeviceIdentifier" isRequired:0 defaultValue:0 error:&v164];
                                                            id v12 = v164;
                                                            statusEASDeviceIdentifier = self->_statusEASDeviceIdentifier;
                                                            self->_statusEASDeviceIdentifier = v71;

                                                            if (!v12)
                                                            {
                                                              id v163 = 0;
                                                              id v73 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"IsCloudBackupEnabled" isRequired:0 defaultValue:0 error:&v163];
                                                              id v12 = v163;
                                                              statusIsCloudBackupEnabled = self->_statusIsCloudBackupEnabled;
                                                              self->_statusIsCloudBackupEnabled = v73;

                                                              if (!v12)
                                                              {
                                                                id v162 = 0;
                                                                id v75 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"ActiveManagedUsers" validator:&__block_literal_global_310 isRequired:0 defaultValue:0 error:&v162];
                                                                id v12 = v162;
                                                                statusActiveManagedUsers = self->_statusActiveManagedUsers;
                                                                self->_statusActiveManagedUsers = v75;

                                                                if (!v12)
                                                                {
                                                                  id v161 = 0;
                                                                  id v77 = [(CEMPayloadBase *)self loadDictionaryFromDictionary:v6 withKey:@"OSUpdateSettings" classType:objc_opt_class() isRequired:0 defaultValue:0 error:&v161];
                                                                  id v12 = v161;
                                                                  statusOSUpdateSettings = self->_statusOSUpdateSettings;
                                                                  self->_statusOSUpdateSettings = v77;

                                                                  if (!v12)
                                                                  {
                                                                    id v160 = 0;
                                                                    id v79 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"AutoSetupAdminAccounts" classType:objc_opt_class() nested:0 isRequired:0 defaultValue:0 error:&v160];
                                                                    id v12 = v160;
                                                                    statusAutoSetupAdminAccounts = self->_statusAutoSetupAdminAccounts;
                                                                    self->_statusAutoSetupAdminAccounts = v79;

                                                                    if (!v12)
                                                                    {
                                                                      id v159 = 0;
                                                                      id v81 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"SystemIntegrityProtectionEnabled" isRequired:0 defaultValue:0 error:&v159];
                                                                      id v12 = v159;
                                                                      statusSystemIntegrityProtectionEnabled = self->_statusSystemIntegrityProtectionEnabled;
                                                                      self->_statusSystemIntegrityProtectionEnabled = v81;

                                                                      if (!v12)
                                                                      {
                                                                        id v158 = 0;
                                                                        id v83 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"IsMDMLostModeEnabled" isRequired:0 defaultValue:0 error:&v158];
                                                                        id v12 = v158;
                                                                        statusIsMDMLostModeEnabled = self->_statusIsMDMLostModeEnabled;
                                                                        self->_statusIsMDMLostModeEnabled = v83;

                                                                        if (!v12)
                                                                        {
                                                                          id v157 = 0;
                                                                          id v85 = [(CEMPayloadBase *)self loadIntegerFromDictionary:v6 withKey:@"MaximumResidentUsers" isRequired:0 defaultValue:0 error:&v157];
                                                                          id v12 = v157;
                                                                          statusMaximumResidentUsers = self->_statusMaximumResidentUsers;
                                                                          self->_statusMaximumResidentUsers = v85;

                                                                          if (!v12)
                                                                          {
                                                                            id v156 = 0;
                                                                            id v87 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"PushToken" isRequired:0 defaultValue:0 error:&v156];
                                                                            id v12 = v156;
                                                                            statusPushToken = self->_statusPushToken;
                                                                            self->_statusPushToken = v87;

                                                                            if (!v12)
                                                                            {
                                                                              id v155 = 0;
                                                                              v89 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DiagnosticSubmissionEnabled" isRequired:0 defaultValue:0 error:&v155];
                                                                              id v12 = v155;
                                                                              statusDiagnosticSubmissionEnabled = self->_statusDiagnosticSubmissionEnabled;
                                                                              self->_statusDiagnosticSubmissionEnabled = v89;

                                                                              if (!v12)
                                                                              {
                                                                                id v154 = 0;
                                                                                id v91 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"AppAnalyticsEnabled" isRequired:0 defaultValue:0 error:&v154];
                                                                                id v12 = v154;
                                                                                statusAppAnalyticsEnabled = self->_statusAppAnalyticsEnabled;
                                                                                self->_statusAppAnalyticsEnabled = v91;

                                                                                if (!v12)
                                                                                {
                                                                                  id v153 = 0;
                                                                                  v93 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"ICCID" isRequired:0 defaultValue:0 error:&v153];
                                                                                  id v12 = v153;
                                                                                  statusICCID = self->_statusICCID;
                                                                                  self->_statusICCID = v93;

                                                                                  if (!v12)
                                                                                  {
                                                                                    id v152 = 0;
                                                                                    id v95 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"BluetoothMAC" isRequired:0 defaultValue:0 error:&v152];
                                                                                    id v12 = v152;
                                                                                    statusBluetoothMAC = self->_statusBluetoothMAC;
                                                                                    self->_statusBluetoothMAC = v95;

                                                                                    if (!v12)
                                                                                    {
                                                                                      id v151 = 0;
                                                                                      id v97 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"WiFiMAC" isRequired:0 defaultValue:0 error:&v151];
                                                                                      id v12 = v151;
                                                                                      statusWiFiMAC = self->_statusWiFiMAC;
                                                                                      self->_statusWiFiMAC = v97;

                                                                                      if (!v12)
                                                                                      {
                                                                                        id v150 = 0;
                                                                                        id v99 = [(CEMPayloadBase *)self loadArrayFromDictionary:v6 withKey:@"EthernetMACs" validator:&__block_literal_global_314 isRequired:0 defaultValue:0 error:&v150];
                                                                                        id v12 = v150;
                                                                                        statusEthernetMACs = self->_statusEthernetMACs;
                                                                                        self->_statusEthernetMACs = v99;

                                                                                        if (!v12)
                                                                                        {
                                                                                          id v149 = 0;
                                                                                          id v101 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CurrentCarrierNetwork" isRequired:0 defaultValue:0 error:&v149];
                                                                                          id v12 = v149;
                                                                                          statusCurrentCarrierNetwork = self->_statusCurrentCarrierNetwork;
                                                                                          self->_statusCurrentCarrierNetwork = v101;

                                                                                          if (!v12)
                                                                                          {
                                                                                            id v148 = 0;
                                                                                            id v103 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"SIMCarrierNetwork" isRequired:0 defaultValue:0 error:&v148];
                                                                                            id v12 = v148;
                                                                                            statusSIMCarrierNetwork = self->_statusSIMCarrierNetwork;
                                                                                            self->_statusSIMCarrierNetwork = v103;

                                                                                            if (!v12)
                                                                                            {
                                                                                              id v147 = 0;
                                                                                              id v105 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"SubscriberCarrierNetwork" isRequired:0 defaultValue:0 error:&v147];
                                                                                              id v12 = v147;
                                                                                              statusSubscriberCarrierNetwork = self->_statusSubscriberCarrierNetwork;
                                                                                              self->_statusSubscriberCarrierNetwork = v105;

                                                                                              if (!v12)
                                                                                              {
                                                                                                id v146 = 0;
                                                                                                id v107 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CarrierSettingsVersion" isRequired:0 defaultValue:0 error:&v146];
                                                                                                id v12 = v146;
                                                                                                statusCarrierSettingsVersion = self->_statusCarrierSettingsVersion;
                                                                                                self->_statusCarrierSettingsVersion = v107;

                                                                                                if (!v12)
                                                                                                {
                                                                                                  id v145 = 0;
                                                                                                  id v109 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"PhoneNumber" isRequired:0 defaultValue:0 error:&v145];
                                                                                                  id v12 = v145;
                                                                                                  statusPhoneNumber = self->_statusPhoneNumber;
                                                                                                  self->_statusPhoneNumber = v109;

                                                                                                  if (!v12)
                                                                                                  {
                                                                                                    id v144 = 0;
                                                                                                    id v111 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"DataRoamingEnabled" isRequired:0 defaultValue:0 error:&v144];
                                                                                                    id v12 = v144;
                                                                                                    statusDataRoamingEnabled = self->_statusDataRoamingEnabled;
                                                                                                    self->_statusDataRoamingEnabled = v111;

                                                                                                    if (!v12)
                                                                                                    {
                                                                                                      id v143 = 0;
                                                                                                      id v113 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"VoiceRoamingEnabled" isRequired:0 defaultValue:0 error:&v143];
                                                                                                      id v12 = v143;
                                                                                                      statusVoiceRoamingEnabled = self->_statusVoiceRoamingEnabled;
                                                                                                      self->_statusVoiceRoamingEnabled = v113;

                                                                                                      if (!v12)
                                                                                                      {
                                                                                                        id v142 = 0;
                                                                                                        id v115 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"PersonalHotspotEnabled" isRequired:0 defaultValue:0 error:&v142];
                                                                                                        id v12 = v142;
                                                                                                        statusPersonalHotspotEnabled = self->_statusPersonalHotspotEnabled;
                                                                                                        self->_statusPersonalHotspotEnabled = v115;

                                                                                                        if (!v12)
                                                                                                        {
                                                                                                          id v141 = 0;
                                                                                                          id v117 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"IsNetworkTethered" isRequired:0 defaultValue:0 error:&v141];
                                                                                                          id v12 = v141;
                                                                                                          statusIsNetworkTethered = self->_statusIsNetworkTethered;
                                                                                                          self->_statusIsNetworkTethered = v117;

                                                                                                          if (!v12)
                                                                                                          {
                                                                                                            id v140 = 0;
                                                                                                            id v119 = [(CEMPayloadBase *)self loadBooleanFromDictionary:v6 withKey:@"IsRoaming" isRequired:0 defaultValue:0 error:&v140];
                                                                                                            id v12 = v140;
                                                                                                            statusIsRoaming = self->_statusIsRoaming;
                                                                                                            self->_statusIsRoaming = v119;

                                                                                                            if (!v12)
                                                                                                            {
                                                                                                              id v139 = 0;
                                                                                                              id v121 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"SIMMCC" isRequired:0 defaultValue:0 error:&v139];
                                                                                                              id v12 = v139;
                                                                                                              statusSIMMCC = self->_statusSIMMCC;
                                                                                                              self->_statusSIMMCC = v121;

                                                                                                              if (!v12)
                                                                                                              {
                                                                                                                id v138 = 0;
                                                                                                                id v123 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"SIMMNC" isRequired:0 defaultValue:0 error:&v138];
                                                                                                                id v12 = v138;
                                                                                                                statusSIMMNC = self->_statusSIMMNC;
                                                                                                                self->_statusSIMMNC = v123;

                                                                                                                if (!v12)
                                                                                                                {
                                                                                                                  id v137 = 0;
                                                                                                                  id v125 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"SubscriberMCC" isRequired:0 defaultValue:0 error:&v137];
                                                                                                                  id v12 = v137;
                                                                                                                  statusSubscriberMCC = self->_statusSubscriberMCC;
                                                                                                                  self->_statusSubscriberMCC = v125;

                                                                                                                  if (!v12)
                                                                                                                  {
                                                                                                                    id v136 = 0;
                                                                                                                    id v127 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"SubscriberMNC" isRequired:0 defaultValue:0 error:&v136];
                                                                                                                    id v12 = v136;
                                                                                                                    statusSubscriberMNC = self->_statusSubscriberMNC;
                                                                                                                    self->_statusSubscriberMNC = v127;

                                                                                                                    if (!v12)
                                                                                                                    {
                                                                                                                      id v135 = 0;
                                                                                                                      v129 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CurrentMCC" isRequired:0 defaultValue:0 error:&v135];
                                                                                                                      id v12 = v135;
                                                                                                                      statusCurrentMCC = self->_statusCurrentMCC;
                                                                                                                      self->_statusCurrentMCC = v129;

                                                                                                                      if (!v12)
                                                                                                                      {
                                                                                                                        id v134 = 0;
                                                                                                                        v131 = [(CEMPayloadBase *)self loadStringFromDictionary:v6 withKey:@"CurrentMNC" isRequired:0 defaultValue:0 error:&v134];
                                                                                                                        id v12 = v134;
                                                                                                                        statusCurrentMNC = self->_statusCurrentMNC;
                                                                                                                        self->_statusCurrentMNC = v131;
                                                                                                                      }
                                                                                                                    }
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    BOOL v14 = v12 == 0;
    if (a4 && v12)
    {
      id v12 = v12;
      BOOL v14 = 0;
      *a4 = v12;
    }
  }

LABEL_68:
  return v14;
}

- (id)serializePayload
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"UDID" withValue:self->_statusUDID isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v3 withKey:@"OrganizationInfo" withValue:self->_statusOrganizationInfo dictSerializer:&__block_literal_global_316 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"MDMOptions" withValue:self->_statusMDMOptions isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeDateIntoDictionary:v3 withKey:@"LastCloudBackupDate" withValue:self->_statusLastCloudBackupDate isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"AwaitingConfiguration" withValue:self->_statusAwaitingConfiguration isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"iTunesStoreAccountIsActive" withValue:self->_statusITunesStoreAccountIsActive isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"iTunesStoreAccountHash" withValue:self->_statusITunesStoreAccountHash isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"DeviceName" withValue:self->_statusDeviceName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"OSVersion" withValue:self->_statusOSVersion isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"BuildVersion" withValue:self->_statusBuildVersion isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"ModelName" withValue:self->_statusModelName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"Model" withValue:self->_statusModel isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"ProductName" withValue:self->_statusProductName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"MarketingName" withValue:self->_statusMarketingName isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"SerialNumber" withValue:self->_statusSerialNumber isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeFloatIntoDictionary:v3 withKey:@"DeviceCapacity" withValue:self->_statusDeviceCapacity isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeFloatIntoDictionary:v3 withKey:@"AvailableDeviceCapacity" withValue:self->_statusAvailableDeviceCapacity isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"IMEI" withValue:self->_statusIMEI isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"MEID" withValue:self->_statusMEID isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"ModemFirmwareVersion" withValue:self->_statusModemFirmwareVersion isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v3 withKey:@"CellularTechnology" withValue:self->_statusCellularTechnology isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeFloatIntoDictionary:v3 withKey:@"BatteryLevel" withValue:self->_statusBatteryLevel isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"IsSupervised" withValue:self->_statusIsSupervised isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"IsMultiUser" withValue:self->_statusIsMultiUser isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"IsDeviceLocatorServiceEnabled" withValue:self->_statusIsDeviceLocatorServiceEnabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"IsActivationLockEnabled" withValue:self->_statusIsActivationLockEnabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"IsDoNotDisturbInEffect" withValue:self->_statusIsDoNotDisturbInEffect isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"DeviceID" withValue:self->_statusDeviceID isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"EASDeviceIdentifier" withValue:self->_statusEASDeviceIdentifier isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"IsCloudBackupEnabled" withValue:self->_statusIsCloudBackupEnabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v3 withKey:@"ActiveManagedUsers" withValue:self->_statusActiveManagedUsers itemSerializer:&__block_literal_global_318 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeDictionaryIntoDictionary:v3 withKey:@"OSUpdateSettings" withValue:self->_statusOSUpdateSettings dictSerializer:&__block_literal_global_320 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v3 withKey:@"AutoSetupAdminAccounts" withValue:self->_statusAutoSetupAdminAccounts itemSerializer:&__block_literal_global_323 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"SystemIntegrityProtectionEnabled" withValue:self->_statusSystemIntegrityProtectionEnabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"IsMDMLostModeEnabled" withValue:self->_statusIsMDMLostModeEnabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeIntegerIntoDictionary:v3 withKey:@"MaximumResidentUsers" withValue:self->_statusMaximumResidentUsers isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"PushToken" withValue:self->_statusPushToken isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"DiagnosticSubmissionEnabled" withValue:self->_statusDiagnosticSubmissionEnabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"AppAnalyticsEnabled" withValue:self->_statusAppAnalyticsEnabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"ICCID" withValue:self->_statusICCID isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"BluetoothMAC" withValue:self->_statusBluetoothMAC isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"WiFiMAC" withValue:self->_statusWiFiMAC isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeArrayIntoDictionary:v3 withKey:@"EthernetMACs" withValue:self->_statusEthernetMACs itemSerializer:&__block_literal_global_325 isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"CurrentCarrierNetwork" withValue:self->_statusCurrentCarrierNetwork isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"SIMCarrierNetwork" withValue:self->_statusSIMCarrierNetwork isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"SubscriberCarrierNetwork" withValue:self->_statusSubscriberCarrierNetwork isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"CarrierSettingsVersion" withValue:self->_statusCarrierSettingsVersion isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"PhoneNumber" withValue:self->_statusPhoneNumber isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"DataRoamingEnabled" withValue:self->_statusDataRoamingEnabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"VoiceRoamingEnabled" withValue:self->_statusVoiceRoamingEnabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"PersonalHotspotEnabled" withValue:self->_statusPersonalHotspotEnabled isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"IsNetworkTethered" withValue:self->_statusIsNetworkTethered isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeBooleanIntoDictionary:v3 withKey:@"IsRoaming" withValue:self->_statusIsRoaming isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"SIMMCC" withValue:self->_statusSIMMCC isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"SIMMNC" withValue:self->_statusSIMMNC isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"SubscriberMCC" withValue:self->_statusSubscriberMCC isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"SubscriberMNC" withValue:self->_statusSubscriberMNC isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"CurrentMCC" withValue:self->_statusCurrentMCC isRequired:0 defaultValue:0];
  [(CEMPayloadBase *)self serializeStringIntoDictionary:v3 withKey:@"CurrentMNC" withValue:self->_statusCurrentMNC isRequired:0 defaultValue:0];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v124.receiver = self;
  v124.super_class = (Class)CEMDeviceInformationCommand_StatusQueryResponses;
  v4 = [(CEMPayloadBase *)&v124 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_statusUDID copy];
  id v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(CEMDeviceInformationCommand_StatusQueryResponsesOrganizationInfo *)self->_statusOrganizationInfo copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSString *)self->_statusMDMOptions copy];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [(NSDate *)self->_statusLastCloudBackupDate copy];
  id v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSNumber *)self->_statusAwaitingConfiguration copy];
  BOOL v14 = (void *)v4[6];
  v4[6] = v13;

  uint64_t v15 = [(NSNumber *)self->_statusITunesStoreAccountIsActive copy];
  v16 = (void *)v4[7];
  v4[7] = v15;

  uint64_t v17 = [(NSString *)self->_statusITunesStoreAccountHash copy];
  v18 = (void *)v4[8];
  v4[8] = v17;

  uint64_t v19 = [(NSString *)self->_statusDeviceName copy];
  v20 = (void *)v4[9];
  v4[9] = v19;

  uint64_t v21 = [(NSString *)self->_statusOSVersion copy];
  v22 = (void *)v4[10];
  v4[10] = v21;

  uint64_t v23 = [(NSString *)self->_statusBuildVersion copy];
  v24 = (void *)v4[11];
  v4[11] = v23;

  uint64_t v25 = [(NSString *)self->_statusModelName copy];
  v26 = (void *)v4[12];
  v4[12] = v25;

  uint64_t v27 = [(NSString *)self->_statusModel copy];
  v28 = (void *)v4[13];
  v4[13] = v27;

  uint64_t v29 = [(NSString *)self->_statusProductName copy];
  v30 = (void *)v4[14];
  v4[14] = v29;

  uint64_t v31 = [(NSString *)self->_statusMarketingName copy];
  v32 = (void *)v4[15];
  v4[15] = v31;

  uint64_t v33 = [(NSString *)self->_statusSerialNumber copy];
  v34 = (void *)v4[16];
  v4[16] = v33;

  uint64_t v35 = [(NSNumber *)self->_statusDeviceCapacity copy];
  v36 = (void *)v4[17];
  v4[17] = v35;

  uint64_t v37 = [(NSNumber *)self->_statusAvailableDeviceCapacity copy];
  v38 = (void *)v4[18];
  v4[18] = v37;

  uint64_t v39 = [(NSString *)self->_statusIMEI copy];
  v40 = (void *)v4[19];
  v4[19] = v39;

  uint64_t v41 = [(NSString *)self->_statusMEID copy];
  v42 = (void *)v4[20];
  v4[20] = v41;

  uint64_t v43 = [(NSString *)self->_statusModemFirmwareVersion copy];
  v44 = (void *)v4[21];
  v4[21] = v43;

  uint64_t v45 = [(NSNumber *)self->_statusCellularTechnology copy];
  v46 = (void *)v4[22];
  v4[22] = v45;

  uint64_t v47 = [(NSNumber *)self->_statusBatteryLevel copy];
  v48 = (void *)v4[23];
  v4[23] = v47;

  uint64_t v49 = [(NSNumber *)self->_statusIsSupervised copy];
  v50 = (void *)v4[24];
  v4[24] = v49;

  uint64_t v51 = [(NSNumber *)self->_statusIsMultiUser copy];
  v52 = (void *)v4[25];
  v4[25] = v51;

  uint64_t v53 = [(NSNumber *)self->_statusIsDeviceLocatorServiceEnabled copy];
  v54 = (void *)v4[26];
  v4[26] = v53;

  uint64_t v55 = [(NSNumber *)self->_statusIsActivationLockEnabled copy];
  v56 = (void *)v4[27];
  v4[27] = v55;

  uint64_t v57 = [(NSNumber *)self->_statusIsDoNotDisturbInEffect copy];
  v58 = (void *)v4[28];
  v4[28] = v57;

  uint64_t v59 = [(NSString *)self->_statusDeviceID copy];
  v60 = (void *)v4[29];
  v4[29] = v59;

  uint64_t v61 = [(NSString *)self->_statusEASDeviceIdentifier copy];
  id v62 = (void *)v4[30];
  v4[30] = v61;

  uint64_t v63 = [(NSNumber *)self->_statusIsCloudBackupEnabled copy];
  id v64 = (void *)v4[31];
  v4[31] = v63;

  uint64_t v65 = [(NSArray *)self->_statusActiveManagedUsers copy];
  id v66 = (void *)v4[32];
  v4[32] = v65;

  uint64_t v67 = [(CEMDeviceInformationCommand_StatusQueryResponsesOSUpdateSettings *)self->_statusOSUpdateSettings copy];
  id v68 = (void *)v4[33];
  v4[33] = v67;

  uint64_t v69 = [(NSArray *)self->_statusAutoSetupAdminAccounts copy];
  v70 = (void *)v4[34];
  v4[34] = v69;

  uint64_t v71 = [(NSNumber *)self->_statusSystemIntegrityProtectionEnabled copy];
  id v72 = (void *)v4[35];
  v4[35] = v71;

  uint64_t v73 = [(NSNumber *)self->_statusIsMDMLostModeEnabled copy];
  id v74 = (void *)v4[36];
  v4[36] = v73;

  uint64_t v75 = [(NSNumber *)self->_statusMaximumResidentUsers copy];
  id v76 = (void *)v4[37];
  v4[37] = v75;

  uint64_t v77 = [(NSString *)self->_statusPushToken copy];
  id v78 = (void *)v4[38];
  v4[38] = v77;

  uint64_t v79 = [(NSNumber *)self->_statusDiagnosticSubmissionEnabled copy];
  id v80 = (void *)v4[39];
  v4[39] = v79;

  uint64_t v81 = [(NSNumber *)self->_statusAppAnalyticsEnabled copy];
  id v82 = (void *)v4[40];
  v4[40] = v81;

  uint64_t v83 = [(NSString *)self->_statusICCID copy];
  id v84 = (void *)v4[41];
  v4[41] = v83;

  uint64_t v85 = [(NSString *)self->_statusBluetoothMAC copy];
  v86 = (void *)v4[42];
  v4[42] = v85;

  uint64_t v87 = [(NSString *)self->_statusWiFiMAC copy];
  v88 = (void *)v4[43];
  v4[43] = v87;

  uint64_t v89 = [(NSArray *)self->_statusEthernetMACs copy];
  v90 = (void *)v4[44];
  v4[44] = v89;

  uint64_t v91 = [(NSString *)self->_statusCurrentCarrierNetwork copy];
  v92 = (void *)v4[45];
  v4[45] = v91;

  uint64_t v93 = [(NSString *)self->_statusSIMCarrierNetwork copy];
  id v94 = (void *)v4[46];
  v4[46] = v93;

  uint64_t v95 = [(NSString *)self->_statusSubscriberCarrierNetwork copy];
  id v96 = (void *)v4[47];
  v4[47] = v95;

  uint64_t v97 = [(NSString *)self->_statusCarrierSettingsVersion copy];
  id v98 = (void *)v4[48];
  v4[48] = v97;

  uint64_t v99 = [(NSString *)self->_statusPhoneNumber copy];
  id v100 = (void *)v4[49];
  v4[49] = v99;

  uint64_t v101 = [(NSNumber *)self->_statusDataRoamingEnabled copy];
  id v102 = (void *)v4[50];
  v4[50] = v101;

  uint64_t v103 = [(NSNumber *)self->_statusVoiceRoamingEnabled copy];
  id v104 = (void *)v4[51];
  v4[51] = v103;

  uint64_t v105 = [(NSNumber *)self->_statusPersonalHotspotEnabled copy];
  id v106 = (void *)v4[52];
  v4[52] = v105;

  uint64_t v107 = [(NSNumber *)self->_statusIsNetworkTethered copy];
  id v108 = (void *)v4[53];
  v4[53] = v107;

  uint64_t v109 = [(NSNumber *)self->_statusIsRoaming copy];
  id v110 = (void *)v4[54];
  v4[54] = v109;

  uint64_t v111 = [(NSString *)self->_statusSIMMCC copy];
  id v112 = (void *)v4[55];
  v4[55] = v111;

  uint64_t v113 = [(NSString *)self->_statusSIMMNC copy];
  id v114 = (void *)v4[56];
  v4[56] = v113;

  uint64_t v115 = [(NSString *)self->_statusSubscriberMCC copy];
  id v116 = (void *)v4[57];
  v4[57] = v115;

  uint64_t v117 = [(NSString *)self->_statusSubscriberMNC copy];
  id v118 = (void *)v4[58];
  v4[58] = v117;

  uint64_t v119 = [(NSString *)self->_statusCurrentMCC copy];
  id v120 = (void *)v4[59];
  v4[59] = v119;

  uint64_t v121 = [(NSString *)self->_statusCurrentMNC copy];
  id v122 = (void *)v4[60];
  v4[60] = v121;

  return v4;
}

- (NSString)statusUDID
{
  return self->_statusUDID;
}

- (void)setStatusUDID:(id)a3
{
}

- (CEMDeviceInformationCommand_StatusQueryResponsesOrganizationInfo)statusOrganizationInfo
{
  return self->_statusOrganizationInfo;
}

- (void)setStatusOrganizationInfo:(id)a3
{
}

- (NSString)statusMDMOptions
{
  return self->_statusMDMOptions;
}

- (void)setStatusMDMOptions:(id)a3
{
}

- (NSDate)statusLastCloudBackupDate
{
  return self->_statusLastCloudBackupDate;
}

- (void)setStatusLastCloudBackupDate:(id)a3
{
}

- (NSNumber)statusAwaitingConfiguration
{
  return self->_statusAwaitingConfiguration;
}

- (void)setStatusAwaitingConfiguration:(id)a3
{
}

- (NSNumber)statusITunesStoreAccountIsActive
{
  return self->_statusITunesStoreAccountIsActive;
}

- (void)setStatusITunesStoreAccountIsActive:(id)a3
{
}

- (NSString)statusITunesStoreAccountHash
{
  return self->_statusITunesStoreAccountHash;
}

- (void)setStatusITunesStoreAccountHash:(id)a3
{
}

- (NSString)statusDeviceName
{
  return self->_statusDeviceName;
}

- (void)setStatusDeviceName:(id)a3
{
}

- (NSString)statusOSVersion
{
  return self->_statusOSVersion;
}

- (void)setStatusOSVersion:(id)a3
{
}

- (NSString)statusBuildVersion
{
  return self->_statusBuildVersion;
}

- (void)setStatusBuildVersion:(id)a3
{
}

- (NSString)statusModelName
{
  return self->_statusModelName;
}

- (void)setStatusModelName:(id)a3
{
}

- (NSString)statusModel
{
  return self->_statusModel;
}

- (void)setStatusModel:(id)a3
{
}

- (NSString)statusProductName
{
  return self->_statusProductName;
}

- (void)setStatusProductName:(id)a3
{
}

- (NSString)statusMarketingName
{
  return self->_statusMarketingName;
}

- (void)setStatusMarketingName:(id)a3
{
}

- (NSString)statusSerialNumber
{
  return self->_statusSerialNumber;
}

- (void)setStatusSerialNumber:(id)a3
{
}

- (NSNumber)statusDeviceCapacity
{
  return self->_statusDeviceCapacity;
}

- (void)setStatusDeviceCapacity:(id)a3
{
}

- (NSNumber)statusAvailableDeviceCapacity
{
  return self->_statusAvailableDeviceCapacity;
}

- (void)setStatusAvailableDeviceCapacity:(id)a3
{
}

- (NSString)statusIMEI
{
  return self->_statusIMEI;
}

- (void)setStatusIMEI:(id)a3
{
}

- (NSString)statusMEID
{
  return self->_statusMEID;
}

- (void)setStatusMEID:(id)a3
{
}

- (NSString)statusModemFirmwareVersion
{
  return self->_statusModemFirmwareVersion;
}

- (void)setStatusModemFirmwareVersion:(id)a3
{
}

- (NSNumber)statusCellularTechnology
{
  return self->_statusCellularTechnology;
}

- (void)setStatusCellularTechnology:(id)a3
{
}

- (NSNumber)statusBatteryLevel
{
  return self->_statusBatteryLevel;
}

- (void)setStatusBatteryLevel:(id)a3
{
}

- (NSNumber)statusIsSupervised
{
  return self->_statusIsSupervised;
}

- (void)setStatusIsSupervised:(id)a3
{
}

- (NSNumber)statusIsMultiUser
{
  return self->_statusIsMultiUser;
}

- (void)setStatusIsMultiUser:(id)a3
{
}

- (NSNumber)statusIsDeviceLocatorServiceEnabled
{
  return self->_statusIsDeviceLocatorServiceEnabled;
}

- (void)setStatusIsDeviceLocatorServiceEnabled:(id)a3
{
}

- (NSNumber)statusIsActivationLockEnabled
{
  return self->_statusIsActivationLockEnabled;
}

- (void)setStatusIsActivationLockEnabled:(id)a3
{
}

- (NSNumber)statusIsDoNotDisturbInEffect
{
  return self->_statusIsDoNotDisturbInEffect;
}

- (void)setStatusIsDoNotDisturbInEffect:(id)a3
{
}

- (NSString)statusDeviceID
{
  return self->_statusDeviceID;
}

- (void)setStatusDeviceID:(id)a3
{
}

- (NSString)statusEASDeviceIdentifier
{
  return self->_statusEASDeviceIdentifier;
}

- (void)setStatusEASDeviceIdentifier:(id)a3
{
}

- (NSNumber)statusIsCloudBackupEnabled
{
  return self->_statusIsCloudBackupEnabled;
}

- (void)setStatusIsCloudBackupEnabled:(id)a3
{
}

- (NSArray)statusActiveManagedUsers
{
  return self->_statusActiveManagedUsers;
}

- (void)setStatusActiveManagedUsers:(id)a3
{
}

- (CEMDeviceInformationCommand_StatusQueryResponsesOSUpdateSettings)statusOSUpdateSettings
{
  return self->_statusOSUpdateSettings;
}

- (void)setStatusOSUpdateSettings:(id)a3
{
}

- (NSArray)statusAutoSetupAdminAccounts
{
  return self->_statusAutoSetupAdminAccounts;
}

- (void)setStatusAutoSetupAdminAccounts:(id)a3
{
}

- (NSNumber)statusSystemIntegrityProtectionEnabled
{
  return self->_statusSystemIntegrityProtectionEnabled;
}

- (void)setStatusSystemIntegrityProtectionEnabled:(id)a3
{
}

- (NSNumber)statusIsMDMLostModeEnabled
{
  return self->_statusIsMDMLostModeEnabled;
}

- (void)setStatusIsMDMLostModeEnabled:(id)a3
{
}

- (NSNumber)statusMaximumResidentUsers
{
  return self->_statusMaximumResidentUsers;
}

- (void)setStatusMaximumResidentUsers:(id)a3
{
}

- (NSString)statusPushToken
{
  return self->_statusPushToken;
}

- (void)setStatusPushToken:(id)a3
{
}

- (NSNumber)statusDiagnosticSubmissionEnabled
{
  return self->_statusDiagnosticSubmissionEnabled;
}

- (void)setStatusDiagnosticSubmissionEnabled:(id)a3
{
}

- (NSNumber)statusAppAnalyticsEnabled
{
  return self->_statusAppAnalyticsEnabled;
}

- (void)setStatusAppAnalyticsEnabled:(id)a3
{
}

- (NSString)statusICCID
{
  return self->_statusICCID;
}

- (void)setStatusICCID:(id)a3
{
}

- (NSString)statusBluetoothMAC
{
  return self->_statusBluetoothMAC;
}

- (void)setStatusBluetoothMAC:(id)a3
{
}

- (NSString)statusWiFiMAC
{
  return self->_statusWiFiMAC;
}

- (void)setStatusWiFiMAC:(id)a3
{
}

- (NSArray)statusEthernetMACs
{
  return self->_statusEthernetMACs;
}

- (void)setStatusEthernetMACs:(id)a3
{
}

- (NSString)statusCurrentCarrierNetwork
{
  return self->_statusCurrentCarrierNetwork;
}

- (void)setStatusCurrentCarrierNetwork:(id)a3
{
}

- (NSString)statusSIMCarrierNetwork
{
  return self->_statusSIMCarrierNetwork;
}

- (void)setStatusSIMCarrierNetwork:(id)a3
{
}

- (NSString)statusSubscriberCarrierNetwork
{
  return self->_statusSubscriberCarrierNetwork;
}

- (void)setStatusSubscriberCarrierNetwork:(id)a3
{
}

- (NSString)statusCarrierSettingsVersion
{
  return self->_statusCarrierSettingsVersion;
}

- (void)setStatusCarrierSettingsVersion:(id)a3
{
}

- (NSString)statusPhoneNumber
{
  return self->_statusPhoneNumber;
}

- (void)setStatusPhoneNumber:(id)a3
{
}

- (NSNumber)statusDataRoamingEnabled
{
  return self->_statusDataRoamingEnabled;
}

- (void)setStatusDataRoamingEnabled:(id)a3
{
}

- (NSNumber)statusVoiceRoamingEnabled
{
  return self->_statusVoiceRoamingEnabled;
}

- (void)setStatusVoiceRoamingEnabled:(id)a3
{
}

- (NSNumber)statusPersonalHotspotEnabled
{
  return self->_statusPersonalHotspotEnabled;
}

- (void)setStatusPersonalHotspotEnabled:(id)a3
{
}

- (NSNumber)statusIsNetworkTethered
{
  return self->_statusIsNetworkTethered;
}

- (void)setStatusIsNetworkTethered:(id)a3
{
}

- (NSNumber)statusIsRoaming
{
  return self->_statusIsRoaming;
}

- (void)setStatusIsRoaming:(id)a3
{
}

- (NSString)statusSIMMCC
{
  return self->_statusSIMMCC;
}

- (void)setStatusSIMMCC:(id)a3
{
}

- (NSString)statusSIMMNC
{
  return self->_statusSIMMNC;
}

- (void)setStatusSIMMNC:(id)a3
{
}

- (NSString)statusSubscriberMCC
{
  return self->_statusSubscriberMCC;
}

- (void)setStatusSubscriberMCC:(id)a3
{
}

- (NSString)statusSubscriberMNC
{
  return self->_statusSubscriberMNC;
}

- (void)setStatusSubscriberMNC:(id)a3
{
}

- (NSString)statusCurrentMCC
{
  return self->_statusCurrentMCC;
}

- (void)setStatusCurrentMCC:(id)a3
{
}

- (NSString)statusCurrentMNC
{
  return self->_statusCurrentMNC;
}

- (void)setStatusCurrentMNC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusCurrentMNC, 0);
  objc_storeStrong((id *)&self->_statusCurrentMCC, 0);
  objc_storeStrong((id *)&self->_statusSubscriberMNC, 0);
  objc_storeStrong((id *)&self->_statusSubscriberMCC, 0);
  objc_storeStrong((id *)&self->_statusSIMMNC, 0);
  objc_storeStrong((id *)&self->_statusSIMMCC, 0);
  objc_storeStrong((id *)&self->_statusIsRoaming, 0);
  objc_storeStrong((id *)&self->_statusIsNetworkTethered, 0);
  objc_storeStrong((id *)&self->_statusPersonalHotspotEnabled, 0);
  objc_storeStrong((id *)&self->_statusVoiceRoamingEnabled, 0);
  objc_storeStrong((id *)&self->_statusDataRoamingEnabled, 0);
  objc_storeStrong((id *)&self->_statusPhoneNumber, 0);
  objc_storeStrong((id *)&self->_statusCarrierSettingsVersion, 0);
  objc_storeStrong((id *)&self->_statusSubscriberCarrierNetwork, 0);
  objc_storeStrong((id *)&self->_statusSIMCarrierNetwork, 0);
  objc_storeStrong((id *)&self->_statusCurrentCarrierNetwork, 0);
  objc_storeStrong((id *)&self->_statusEthernetMACs, 0);
  objc_storeStrong((id *)&self->_statusWiFiMAC, 0);
  objc_storeStrong((id *)&self->_statusBluetoothMAC, 0);
  objc_storeStrong((id *)&self->_statusICCID, 0);
  objc_storeStrong((id *)&self->_statusAppAnalyticsEnabled, 0);
  objc_storeStrong((id *)&self->_statusDiagnosticSubmissionEnabled, 0);
  objc_storeStrong((id *)&self->_statusPushToken, 0);
  objc_storeStrong((id *)&self->_statusMaximumResidentUsers, 0);
  objc_storeStrong((id *)&self->_statusIsMDMLostModeEnabled, 0);
  objc_storeStrong((id *)&self->_statusSystemIntegrityProtectionEnabled, 0);
  objc_storeStrong((id *)&self->_statusAutoSetupAdminAccounts, 0);
  objc_storeStrong((id *)&self->_statusOSUpdateSettings, 0);
  objc_storeStrong((id *)&self->_statusActiveManagedUsers, 0);
  objc_storeStrong((id *)&self->_statusIsCloudBackupEnabled, 0);
  objc_storeStrong((id *)&self->_statusEASDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_statusDeviceID, 0);
  objc_storeStrong((id *)&self->_statusIsDoNotDisturbInEffect, 0);
  objc_storeStrong((id *)&self->_statusIsActivationLockEnabled, 0);
  objc_storeStrong((id *)&self->_statusIsDeviceLocatorServiceEnabled, 0);
  objc_storeStrong((id *)&self->_statusIsMultiUser, 0);
  objc_storeStrong((id *)&self->_statusIsSupervised, 0);
  objc_storeStrong((id *)&self->_statusBatteryLevel, 0);
  objc_storeStrong((id *)&self->_statusCellularTechnology, 0);
  objc_storeStrong((id *)&self->_statusModemFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_statusMEID, 0);
  objc_storeStrong((id *)&self->_statusIMEI, 0);
  objc_storeStrong((id *)&self->_statusAvailableDeviceCapacity, 0);
  objc_storeStrong((id *)&self->_statusDeviceCapacity, 0);
  objc_storeStrong((id *)&self->_statusSerialNumber, 0);
  objc_storeStrong((id *)&self->_statusMarketingName, 0);
  objc_storeStrong((id *)&self->_statusProductName, 0);
  objc_storeStrong((id *)&self->_statusModel, 0);
  objc_storeStrong((id *)&self->_statusModelName, 0);
  objc_storeStrong((id *)&self->_statusBuildVersion, 0);
  objc_storeStrong((id *)&self->_statusOSVersion, 0);
  objc_storeStrong((id *)&self->_statusDeviceName, 0);
  objc_storeStrong((id *)&self->_statusITunesStoreAccountHash, 0);
  objc_storeStrong((id *)&self->_statusITunesStoreAccountIsActive, 0);
  objc_storeStrong((id *)&self->_statusAwaitingConfiguration, 0);
  objc_storeStrong((id *)&self->_statusLastCloudBackupDate, 0);
  objc_storeStrong((id *)&self->_statusMDMOptions, 0);
  objc_storeStrong((id *)&self->_statusOrganizationInfo, 0);

  objc_storeStrong((id *)&self->_statusUDID, 0);
}

@end