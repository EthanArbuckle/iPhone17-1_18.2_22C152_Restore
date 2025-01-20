@interface CBAdvertiser
- (BOOL)enableEPAForLEAdvertisement;
- (BOOL)needsIdentify;
- (BOOL)updateWithCBAdvertiser:(id)a3;
- (CBAdvertiser)init;
- (CBAdvertiser)initWithXPCObject:(id)a3 error:(id *)a4;
- (CBDevice)mockDevice;
- (CBDevice)remoteDevice;
- (NSArray)useCaseClientIDs;
- (NSData)advertisingAddressDataConnectable;
- (NSData)advertisingAddressDataNonConnectable;
- (NSData)advertisingAddressDataNonConnectableSecondary;
- (NSData)airdropTempAuthTagData;
- (NSData)airplaySourceAuthTagData;
- (NSData)airplaySourceUWBConfigData;
- (NSData)fidoPayloadData;
- (NSData)nearbyActionAuthTagData;
- (NSData)nearbyActionExtraData;
- (NSData)nearbyActionNoWakeAuthTagData;
- (NSData)nearbyActionNoWakeConfigData;
- (NSData)nearbyActionTargetData;
- (NSData)nearbyActionV2TargetData;
- (NSData)nearbyInfoV2AuthIntegrityTagData;
- (NSData)nearbyInfoV2AuthTagData;
- (NSData)nearbyInfoV2RapportIRKData;
- (NSData)nearbyInfoV2TempAuthTagData;
- (NSData)safetyAlertsAlertData;
- (NSData)safetyAlertsAlertID;
- (NSData)safetyAlertsSignature;
- (NSData)watchSetupData;
- (NSString)label;
- (NSString)mockID;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)xpcListenerEndpoint;
- (char)dsActionMeasuredPower;
- (double)nearbyInfoStatusProgress;
- (id)_ensureXPCStarted;
- (id)advertisingAddressChangedHandler;
- (id)bluetoothStateChangedHandler;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)errorHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (int)advertiseRate;
- (int64_t)bluetoothState;
- (unsigned)airdropConfigData;
- (unsigned)airdropFlags;
- (unsigned)airdropHash1;
- (unsigned)airdropHash2;
- (unsigned)airdropHash3;
- (unsigned)airdropHash4;
- (unsigned)airdropModel;
- (unsigned)airdropVersion;
- (unsigned)airplaySourceFlags;
- (unsigned)airplayTargetConfigSeed;
- (unsigned)airplayTargetFlags;
- (unsigned)airplayTargetIPv4;
- (unsigned)airplayTargetPort;
- (unsigned)clientID;
- (unsigned)dsActionFlags;
- (unsigned)dsActionTieBreaker;
- (unsigned)dsInfoVehicleConfidence;
- (unsigned)dsInfoVehicleState;
- (unsigned)heySiriConfidence;
- (unsigned)heySiriDeviceClass;
- (unsigned)heySiriPerceptualHash;
- (unsigned)heySiriProductType;
- (unsigned)heySiriRandom;
- (unsigned)heySiriSNR;
- (unsigned)internalFlags;
- (unsigned)nearbyActionColorCode;
- (unsigned)nearbyActionFlags;
- (unsigned)nearbyActionNWPrecisionFindingStatus;
- (unsigned)nearbyActionNoWakeType;
- (unsigned)nearbyActionType;
- (unsigned)nearbyActionV2Flags;
- (unsigned)nearbyActionV2Type;
- (unsigned)nearbyInfoFlags;
- (unsigned)nearbyInfoStatusTime;
- (unsigned)nearbyInfoStatusType;
- (unsigned)nearbyInfoV2DecryptedFlags;
- (unsigned)nearbyInfoV2Flags;
- (unsigned)nearbyInfoV2InvitationCounter;
- (unsigned)nearbyInfoV2InvitationRouteType;
- (unsigned)nearbyInfoV2InvitationTypes;
- (unsigned)safetyAlertsAlertIndex;
- (unsigned)safetyAlertsVersion;
- (unsigned)useCase;
- (void)_activate;
- (void)_activateDirectStart;
- (void)_activateXPCCompleted:(id)a3;
- (void)_activateXPCStart:(BOOL)a3;
- (void)_interrupted;
- (void)_invalidateDirect;
- (void)_invalidated;
- (void)_update;
- (void)_updateIfNeededWithBlock:(id)a3;
- (void)_xpcReceivedAdvertisingAddressChanged:(id)a3;
- (void)_xpcReceivedMessage:(id)a3;
- (void)_xpcReceivedPowerStateChanged:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)encodeWithXPCObject:(id)a3;
- (void)invalidate;
- (void)setAdvertiseRate:(int)a3;
- (void)setAdvertisingAddressChangedHandler:(id)a3;
- (void)setAdvertisingAddressDataConnectable:(id)a3;
- (void)setAdvertisingAddressDataNonConnectable:(id)a3;
- (void)setAdvertisingAddressDataNonConnectableSecondary:(id)a3;
- (void)setAirdropConfigData:(unsigned __int8)a3;
- (void)setAirdropFlags:(unsigned __int8)a3;
- (void)setAirdropHash1:(unsigned __int16)a3;
- (void)setAirdropHash2:(unsigned __int16)a3;
- (void)setAirdropHash3:(unsigned __int16)a3;
- (void)setAirdropHash4:(unsigned __int16)a3;
- (void)setAirdropModel:(unsigned __int8)a3;
- (void)setAirdropTempAuthTagData:(id)a3;
- (void)setAirdropVersion:(unsigned __int8)a3;
- (void)setAirdrophash1:(unsigned __int16)a3;
- (void)setAirdrophash2:(unsigned __int16)a3;
- (void)setAirdrophash3:(unsigned __int16)a3;
- (void)setAirdrophash4:(unsigned __int16)a3;
- (void)setAirplaySourceAuthTagData:(id)a3;
- (void)setAirplaySourceFlags:(unsigned __int8)a3;
- (void)setAirplaySourceUWBConfigData:(id)a3;
- (void)setAirplayTargetConfigSeed:(unsigned __int8)a3;
- (void)setAirplayTargetFlags:(unsigned __int8)a3;
- (void)setAirplayTargetIPv4:(unsigned int)a3;
- (void)setAirplayTargetPort:(unsigned __int16)a3;
- (void)setBluetoothStateChangedHandler:(id)a3;
- (void)setClientID:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDsActionFlags:(unsigned __int8)a3;
- (void)setDsActionMeasuredPower:(char)a3;
- (void)setDsActionTieBreaker:(unsigned __int8)a3;
- (void)setDsInfoVehicleConfidence:(unsigned __int8)a3;
- (void)setDsInfoVehicleState:(unsigned __int8)a3;
- (void)setEnableEPAForLEAdvertisement:(BOOL)a3;
- (void)setEpaTxPower:(BOOL)a3;
- (void)setErrorHandler:(id)a3;
- (void)setFidoPayloadData:(id)a3;
- (void)setHeySiriConfidence:(unsigned __int8)a3;
- (void)setHeySiriDeviceClass:(unsigned __int16)a3;
- (void)setHeySiriPerceptualHash:(unsigned __int16)a3;
- (void)setHeySiriProductType:(unsigned __int8)a3;
- (void)setHeySiriRandom:(unsigned __int8)a3;
- (void)setHeySiriSNR:(unsigned __int8)a3;
- (void)setInternalFlags:(unsigned int)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMockDevice:(id)a3;
- (void)setMockID:(id)a3;
- (void)setModel:(unsigned __int8)a3;
- (void)setNearbyActionAuthTagData:(id)a3;
- (void)setNearbyActionColorCode:(unsigned __int8)a3;
- (void)setNearbyActionExtraData:(id)a3;
- (void)setNearbyActionFlags:(unsigned int)a3;
- (void)setNearbyActionNWPrecisionFindingStatus:(unsigned __int8)a3;
- (void)setNearbyActionNoWakeAuthTagData:(id)a3;
- (void)setNearbyActionNoWakeConfigData:(id)a3;
- (void)setNearbyActionNoWakeType:(unsigned __int8)a3;
- (void)setNearbyActionTargetData:(id)a3;
- (void)setNearbyActionType:(unsigned __int8)a3;
- (void)setNearbyActionV2Flags:(unsigned int)a3;
- (void)setNearbyActionV2TargetData:(id)a3;
- (void)setNearbyActionV2Type:(unsigned __int8)a3;
- (void)setNearbyInfoFlags:(unsigned int)a3;
- (void)setNearbyInfoStatusProgress:(double)a3;
- (void)setNearbyInfoStatusTime:(unsigned __int8)a3;
- (void)setNearbyInfoStatusType:(unsigned __int8)a3;
- (void)setNearbyInfoV2AuthIntegrityTagData:(id)a3;
- (void)setNearbyInfoV2AuthTagData:(id)a3;
- (void)setNearbyInfoV2DecryptedFlags:(unsigned __int8)a3;
- (void)setNearbyInfoV2Flags:(unsigned __int8)a3;
- (void)setNearbyInfoV2InvitationCounter:(unsigned __int8)a3;
- (void)setNearbyInfoV2InvitationRouteType:(unsigned __int8)a3;
- (void)setNearbyInfoV2InvitationTypes:(unsigned __int8)a3;
- (void)setNearbyInfoV2RapportIRKData:(id)a3;
- (void)setNearbyInfoV2TempAuthTagData:(id)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setSafetyAlertsAlertData:(id)a3;
- (void)setSafetyAlertsAlertID:(id)a3;
- (void)setSafetyAlertsAlertIndex:(unsigned __int8)a3;
- (void)setSafetyAlertsSignature:(id)a3;
- (void)setSafetyAlertsVersion:(unsigned __int8)a3;
- (void)setUseCase:(unsigned int)a3;
- (void)setUseCaseClientIDs:(id)a3;
- (void)setWatchSetupData:(id)a3;
- (void)setXpcListenerEndpoint:(id)a3;
- (void)setnearbyInfoV2InvitationRouteType:(unsigned __int8)a3;
- (void)xpcReceivedMessage:(id)a3;
@end

@implementation CBAdvertiser

- (unsigned)nearbyInfoV2Flags
{
  return self->_nearbyInfoV2Flags;
}

- (unsigned)nearbyInfoV2DecryptedFlags
{
  return self->_nearbyInfoV2DecryptedFlags;
}

- (unsigned)airplaySourceFlags
{
  return self->_airplaySourceFlags;
}

- (BOOL)needsIdentify
{
  return (self->_nearbyInfoV2Flags & 4) != 0 || (self->_nearbyInfoV2DecryptedFlags & 7) != 0;
}

- (CBAdvertiser)init
{
  v5.receiver = self;
  v5.super_class = (Class)CBAdvertiser;
  v2 = [(CBAdvertiser *)&v5 init];
  if (v2)
  {
    v2->_clientID = CBXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v2->_ucat = (LogCategory *)&gLogCategory_CBAdvertiser;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = self->_mockID;
  v4 = v3;
  if (v3) {
    CBMockRemoveAdvertiser(v3, self);
  }
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CBAdvertiser;
  [(CBAdvertiser *)&v6 dealloc];
}

- (CBAdvertiser)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CBAdvertiser *)self init];

  if (!v7)
  {
    if (!a4) {
      goto LABEL_166;
    }
LABEL_162:
    NSErrorF();
    v54 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_158;
  }
  if (MEMORY[0x1AD1120E0](v6) != MEMORY[0x1E4F14590])
  {
    if (!a4) {
      goto LABEL_166;
    }
    goto LABEL_162;
  }
  int v8 = CUXPCDecodeSInt64RangedEx();
  if (v8 == 6)
  {
    v7->_advertiseRate = 0;
  }
  else if (v8 == 5)
  {
    goto LABEL_166;
  }
  int v9 = CUXPCDecodeUInt64RangedEx();
  if (v9 == 6)
  {
    v7->_clientID = 0;
  }
  else if (v9 == 5)
  {
    goto LABEL_166;
  }
  int v10 = CUXPCDecodeUInt64RangedEx();
  if (v10 == 6)
  {
    v7->_internalFlags = 0;
  }
  else if (v10 == 5)
  {
    goto LABEL_166;
  }
  objc_opt_class();
  if (!CUXPCDecodeObject()) {
    goto LABEL_166;
  }
  int v11 = CUXPCDecodeUInt64RangedEx();
  if (v11 == 6)
  {
    v7->_useCase = 0;
  }
  else if (v11 == 5)
  {
    goto LABEL_166;
  }
  if (!CUXPCDecodeNSArrayOfNSString()) {
    goto LABEL_166;
  }
  int v12 = CUXPCDecodeUInt64RangedEx();
  if (v12 == 6)
  {
    v7->_airdropFlags = 0;
  }
  else if (v12 == 5)
  {
    goto LABEL_166;
  }
  if (!CUXPCDecodeNSData()) {
    goto LABEL_166;
  }
  int v13 = CUXPCDecodeUInt64RangedEx();
  if (v13 == 6)
  {
    v7->_airdropModel = 0;
  }
  else if (v13 == 5)
  {
    goto LABEL_166;
  }
  int v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v7->_airdropVersion = 0;
  }
  else if (v14 == 5)
  {
    goto LABEL_166;
  }
  int v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v7->_airdropHash1 = 0;
  }
  else if (v15 == 5)
  {
    goto LABEL_166;
  }
  int v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v7->_airdropHash2 = 0;
  }
  else if (v16 == 5)
  {
    goto LABEL_166;
  }
  int v17 = CUXPCDecodeUInt64RangedEx();
  if (v17 == 6)
  {
    v7->_airdropHash3 = 0;
  }
  else if (v17 == 5)
  {
    goto LABEL_166;
  }
  int v18 = CUXPCDecodeUInt64RangedEx();
  if (v18 == 6)
  {
    v7->_airdropHash4 = 0;
  }
  else if (v18 == 5)
  {
    goto LABEL_166;
  }
  int v19 = CUXPCDecodeUInt64RangedEx();
  if (v19 == 6)
  {
    v7->_airdropConfigData = 0;
  }
  else if (v19 == 5)
  {
    goto LABEL_166;
  }
  if (!CUXPCDecodeNSData()) {
    goto LABEL_166;
  }
  int v20 = CUXPCDecodeUInt64RangedEx();
  if (v20 == 6)
  {
    v7->_airplaySourceFlags = 0;
  }
  else if (v20 == 5)
  {
    goto LABEL_166;
  }
  if (!CUXPCDecodeNSData()) {
    goto LABEL_166;
  }
  int v21 = CUXPCDecodeUInt64RangedEx();
  if (v21 == 6)
  {
    v7->_airplayTargetConfigSeed = 0;
  }
  else if (v21 == 5)
  {
    goto LABEL_166;
  }
  int v22 = CUXPCDecodeUInt64RangedEx();
  if (v22 == 6)
  {
    v7->_airplayTargetFlags = 0;
  }
  else if (v22 == 5)
  {
    goto LABEL_166;
  }
  int v23 = CUXPCDecodeUInt64RangedEx();
  if (v23 == 6)
  {
    v7->_airplayTargetIPv4 = 0;
  }
  else if (v23 == 5)
  {
    goto LABEL_166;
  }
  int v24 = CUXPCDecodeUInt64RangedEx();
  if (v24 == 6)
  {
    v7->_airplayTargetPort = 0;
  }
  else if (v24 == 5)
  {
    goto LABEL_166;
  }
  int v25 = CUXPCDecodeUInt64RangedEx();
  if (v25 == 6)
  {
    v7->_dsActionFlags = 0;
  }
  else if (v25 == 5)
  {
    goto LABEL_166;
  }
  int v26 = CUXPCDecodeSInt64RangedEx();
  if (v26 == 6)
  {
    v7->_dsActionMeasuredPower = 0;
  }
  else if (v26 == 5)
  {
    goto LABEL_166;
  }
  int v27 = CUXPCDecodeUInt64RangedEx();
  if (v27 == 6)
  {
    v7->_dsActionTieBreaker = 0;
  }
  else if (v27 == 5)
  {
    goto LABEL_166;
  }
  int v28 = CUXPCDecodeUInt64RangedEx();
  if (v28 == 6)
  {
    v7->_dsInfoVehicleConfidence = 0;
  }
  else if (v28 == 5)
  {
    goto LABEL_166;
  }
  int v29 = CUXPCDecodeUInt64RangedEx();
  if (v29 == 6)
  {
    v7->_dsInfoVehicleState = 0;
  }
  else if (v29 == 5)
  {
    goto LABEL_166;
  }
  if (!CUXPCDecodeBool() || !CUXPCDecodeNSData()) {
    goto LABEL_166;
  }
  int v30 = CUXPCDecodeUInt64RangedEx();
  if (v30 == 6)
  {
    v7->_heySiriConfidence = 0;
  }
  else if (v30 == 5)
  {
    goto LABEL_166;
  }
  int v31 = CUXPCDecodeUInt64RangedEx();
  if (v31 == 6)
  {
    v7->_heySiriDeviceClass = 0;
  }
  else if (v31 == 5)
  {
    goto LABEL_166;
  }
  int v32 = CUXPCDecodeUInt64RangedEx();
  if (v32 == 6)
  {
    v7->_heySiriPerceptualHash = 0;
  }
  else if (v32 == 5)
  {
    goto LABEL_166;
  }
  int v33 = CUXPCDecodeUInt64RangedEx();
  if (v33 == 6)
  {
    v7->_heySiriProductType = 0;
  }
  else if (v33 == 5)
  {
    goto LABEL_166;
  }
  int v34 = CUXPCDecodeUInt64RangedEx();
  if (v34 == 6)
  {
    v7->_heySiriRandom = 0;
  }
  else if (v34 == 5)
  {
    goto LABEL_166;
  }
  int v35 = CUXPCDecodeUInt64RangedEx();
  if (v35 == 6)
  {
    v7->_heySiriSNR = 0;
  }
  else if (v35 == 5)
  {
    goto LABEL_166;
  }
  if (!CUXPCDecodeNSDataOfLength()) {
    goto LABEL_166;
  }
  int v36 = CUXPCDecodeUInt64RangedEx();
  if (v36 == 6)
  {
    v7->_nearbyActionColorCode = 0;
  }
  else if (v36 == 5)
  {
    goto LABEL_166;
  }
  if (!CUXPCDecodeNSData()) {
    goto LABEL_166;
  }
  int v37 = CUXPCDecodeUInt64RangedEx();
  if (v37 == 6)
  {
    v7->_nearbyActionFlags = 0;
  }
  else if (v37 == 5)
  {
    goto LABEL_166;
  }
  int v38 = CUXPCDecodeUInt64RangedEx();
  if (v38 == 6)
  {
    v7->_nearbyActionType = 0;
  }
  else if (v38 == 5)
  {
    goto LABEL_166;
  }
  if (!CUXPCDecodeNSDataOfLength()) {
    goto LABEL_166;
  }
  int v39 = CUXPCDecodeUInt64RangedEx();
  if (v39 == 6)
  {
    v7->_nearbyActionV2Flags = 0;
  }
  else if (v39 == 5)
  {
    goto LABEL_166;
  }
  if (!CUXPCDecodeNSDataOfLength()) {
    goto LABEL_166;
  }
  int v40 = CUXPCDecodeUInt64RangedEx();
  if (v40 == 6)
  {
    v7->_nearbyActionV2Type = 0;
  }
  else if (v40 == 5)
  {
    goto LABEL_166;
  }
  int v41 = CUXPCDecodeUInt64RangedEx();
  if (v41 == 6)
  {
    v7->_nearbyInfoFlags = 0;
  }
  else if (v41 == 5)
  {
    goto LABEL_166;
  }
  if (!CUXPCDecodeDouble()) {
    goto LABEL_166;
  }
  int v42 = CUXPCDecodeUInt64RangedEx();
  if (v42 == 6)
  {
    v7->_nearbyInfoStatusTime = 0;
  }
  else if (v42 == 5)
  {
    goto LABEL_166;
  }
  int v43 = CUXPCDecodeUInt64RangedEx();
  if (v43 == 6)
  {
    v7->_nearbyInfoStatusType = 0;
  }
  else if (v43 == 5)
  {
    goto LABEL_166;
  }
  int v44 = CUXPCDecodeUInt64RangedEx();
  if (v44 == 6)
  {
    v7->_nearbyInfoV2DecryptedFlags = 0;
  }
  else if (v44 == 5)
  {
    goto LABEL_166;
  }
  int v45 = CUXPCDecodeUInt64RangedEx();
  if (v45 == 6)
  {
    v7->_nearbyInfoV2Flags = 0;
  }
  else if (v45 == 5)
  {
    goto LABEL_166;
  }
  if (!CUXPCDecodeNSData() || !CUXPCDecodeNSData()) {
    goto LABEL_166;
  }
  int v46 = CUXPCDecodeUInt64RangedEx();
  if (v46 == 6)
  {
    v7->_nearbyInfoV2InvitationCounter = 0;
  }
  else if (v46 == 5)
  {
    goto LABEL_166;
  }
  int v47 = CUXPCDecodeUInt64RangedEx();
  if (v47 == 6)
  {
    v7->_nearbyInfoV2InvitationTypes = 0;
  }
  else if (v47 == 5)
  {
    goto LABEL_166;
  }
  int v48 = CUXPCDecodeUInt64RangedEx();
  if (v48 == 6)
  {
    v7->_nearbyInfoV2InvitationRouteType = 0;
  }
  else if (v48 == 5)
  {
    goto LABEL_166;
  }
  if (!CUXPCDecodeNSData()) {
    goto LABEL_166;
  }
  v49 = v7->_safetyAlertsAlertData;
  v50 = v49;
  if (v49 && [(NSData *)v49 length] >= 0x1D)
  {
    if (a4)
    {
      NSErrorF();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_166;
  }

  if (!CUXPCDecodeNSDataOfLength() || !CUXPCDecodeNSDataOfLength())
  {
LABEL_166:
    v54 = 0;
    goto LABEL_158;
  }
  int v51 = CUXPCDecodeUInt64RangedEx();
  if (v51 == 6)
  {
    v7->_safetyAlertsVersion = 0;
  }
  else if (v51 == 5)
  {
    goto LABEL_166;
  }
  if (!CUXPCDecodeNSData()) {
    goto LABEL_166;
  }
  int v52 = CUXPCDecodeUInt64RangedEx();
  if (v52 == 6)
  {
    v7->_nearbyActionNoWakeType = 0;
  }
  else if (v52 == 5)
  {
    goto LABEL_166;
  }
  int v53 = CUXPCDecodeUInt64RangedEx();
  if (v53 != 6)
  {
    if (v53 != 5) {
      goto LABEL_155;
    }
    goto LABEL_166;
  }
  v7->_nearbyActionNWPrecisionFindingStatus = 0;
LABEL_155:
  if (!CUXPCDecodeNSDataOfLength() || !CUXPCDecodeNSDataOfLength()) {
    goto LABEL_166;
  }
  v54 = v7;
LABEL_158:

  return v54;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  int64_t advertiseRate = self->_advertiseRate;
  xpc_object_t xdict = v4;
  if (advertiseRate) {
    xpc_dictionary_set_int64(v4, "advR", advertiseRate);
  }
  uint64_t clientID = self->_clientID;
  if (clientID) {
    xpc_dictionary_set_uint64(xdict, "cid", clientID);
  }
  uint64_t internalFlags = self->_internalFlags;
  if (internalFlags) {
    xpc_dictionary_set_uint64(xdict, "intF", internalFlags);
  }
  CUXPCEncodeObject();
  uint64_t useCase = self->_useCase;
  if (useCase) {
    xpc_dictionary_set_uint64(xdict, "ucas", useCase);
  }
  CUXPCEncodeNSArrayOfNSString();
  if (self->_airdropFlags) {
    xpc_dictionary_set_uint64(xdict, "adFl", self->_airdropFlags);
  }
  airdropTempAuthTagData = self->_airdropTempAuthTagData;
  if (airdropTempAuthTagData)
  {
    int v10 = airdropTempAuthTagData;
    id v11 = xdict;
    uint64_t v12 = [(NSData *)v10 bytes];
    if (v12) {
      int v13 = (const char *)v12;
    }
    else {
      int v13 = "";
    }
    size_t v14 = [(NSData *)v10 length];

    xpc_dictionary_set_data(v11, "adTa", v13, v14);
  }
  if (self->_airdropModel) {
    xpc_dictionary_set_uint64(xdict, "adMl", self->_airdropModel);
  }
  if (self->_airdropVersion) {
    xpc_dictionary_set_uint64(xdict, "adVs", self->_airdropVersion);
  }
  if (self->_airdropHash1) {
    xpc_dictionary_set_uint64(xdict, "adH1", self->_airdropHash1);
  }
  if (self->_airdropHash2) {
    xpc_dictionary_set_uint64(xdict, "adH2", self->_airdropHash2);
  }
  if (self->_airdropHash3) {
    xpc_dictionary_set_uint64(xdict, "adH3", self->_airdropHash3);
  }
  if (self->_airdropHash4) {
    xpc_dictionary_set_uint64(xdict, "adH4", self->_airdropHash4);
  }
  if (self->_airdropConfigData) {
    xpc_dictionary_set_uint64(xdict, "adCd", self->_airdropConfigData);
  }
  airplaySourceAuthTagData = self->_airplaySourceAuthTagData;
  if (airplaySourceAuthTagData)
  {
    int v16 = airplaySourceAuthTagData;
    id v17 = xdict;
    uint64_t v18 = [(NSData *)v16 bytes];
    if (v18) {
      int v19 = (const char *)v18;
    }
    else {
      int v19 = "";
    }
    size_t v20 = [(NSData *)v16 length];

    xpc_dictionary_set_data(v17, "apAT", v19, v20);
  }
  if (self->_airplaySourceFlags) {
    xpc_dictionary_set_uint64(xdict, "apSF", self->_airplaySourceFlags);
  }
  airplaySourceUWBConfigData = self->_airplaySourceUWBConfigData;
  if (airplaySourceUWBConfigData)
  {
    int v22 = airplaySourceUWBConfigData;
    id v23 = xdict;
    uint64_t v24 = [(NSData *)v22 bytes];
    if (v24) {
      int v25 = (const char *)v24;
    }
    else {
      int v25 = "";
    }
    size_t v26 = [(NSData *)v22 length];

    xpc_dictionary_set_data(v23, "apUW", v25, v26);
  }
  if (self->_airplayTargetConfigSeed) {
    xpc_dictionary_set_uint64(xdict, "apTC", self->_airplayTargetConfigSeed);
  }
  if (self->_airplayTargetFlags) {
    xpc_dictionary_set_uint64(xdict, "apTF", self->_airplayTargetFlags);
  }
  airplayTargetIPid v4 = self->_airplayTargetIPv4;
  if (airplayTargetIPv4) {
    xpc_dictionary_set_uint64(xdict, "apTI", airplayTargetIPv4);
  }
  if (self->_airplayTargetPort) {
    xpc_dictionary_set_uint64(xdict, "apTP", self->_airplayTargetPort);
  }
  if (self->_dsActionFlags) {
    xpc_dictionary_set_uint64(xdict, "dsAF", self->_dsActionFlags);
  }
  if (self->_dsActionMeasuredPower) {
    xpc_dictionary_set_int64(xdict, "dsAP", self->_dsActionMeasuredPower);
  }
  if (self->_dsActionTieBreaker) {
    xpc_dictionary_set_uint64(xdict, "dsAT", self->_dsActionTieBreaker);
  }
  if (self->_dsInfoVehicleConfidence) {
    xpc_dictionary_set_uint64(xdict, "dsVC", self->_dsInfoVehicleConfidence);
  }
  if (self->_dsInfoVehicleState) {
    xpc_dictionary_set_uint64(xdict, "dsVS", self->_dsInfoVehicleState);
  }
  if (self->_enableEPAForLEAdvertisement) {
    xpc_dictionary_set_BOOL(xdict, "naEE", 1);
  }
  fidoPayloadData = self->_fidoPayloadData;
  if (fidoPayloadData)
  {
    int v29 = fidoPayloadData;
    id v30 = xdict;
    uint64_t v31 = [(NSData *)v29 bytes];
    if (v31) {
      int v32 = (const char *)v31;
    }
    else {
      int v32 = "";
    }
    size_t v33 = [(NSData *)v29 length];

    xpc_dictionary_set_data(v30, "fdPD", v32, v33);
  }
  if (self->_heySiriConfidence) {
    xpc_dictionary_set_uint64(xdict, "hsCf", self->_heySiriConfidence);
  }
  if (self->_heySiriDeviceClass) {
    xpc_dictionary_set_uint64(xdict, "hsDC", self->_heySiriDeviceClass);
  }
  if (self->_heySiriPerceptualHash) {
    xpc_dictionary_set_uint64(xdict, "hsPH", self->_heySiriPerceptualHash);
  }
  if (self->_heySiriProductType) {
    xpc_dictionary_set_uint64(xdict, "hsPT", self->_heySiriProductType);
  }
  if (self->_heySiriRandom) {
    xpc_dictionary_set_uint64(xdict, "hsRn", self->_heySiriRandom);
  }
  if (self->_heySiriSNR) {
    xpc_dictionary_set_uint64(xdict, "hsSN", self->_heySiriSNR);
  }
  nearbyActionAuthTagData = self->_nearbyActionAuthTagData;
  if (nearbyActionAuthTagData)
  {
    int v35 = nearbyActionAuthTagData;
    id v36 = xdict;
    uint64_t v37 = [(NSData *)v35 bytes];
    if (v37) {
      int v38 = (const char *)v37;
    }
    else {
      int v38 = "";
    }
    size_t v39 = [(NSData *)v35 length];

    xpc_dictionary_set_data(v36, "nbAT", v38, v39);
  }
  if (self->_nearbyActionColorCode) {
    xpc_dictionary_set_uint64(xdict, "naCC", self->_nearbyActionColorCode);
  }
  nearbyActionExtraData = self->_nearbyActionExtraData;
  if (nearbyActionExtraData)
  {
    int v41 = nearbyActionExtraData;
    id v42 = xdict;
    uint64_t v43 = [(NSData *)v41 bytes];
    if (v43) {
      int v44 = (const char *)v43;
    }
    else {
      int v44 = "";
    }
    size_t v45 = [(NSData *)v41 length];

    xpc_dictionary_set_data(v42, "naED", v44, v45);
  }
  uint64_t nearbyActionFlags = self->_nearbyActionFlags;
  if (nearbyActionFlags) {
    xpc_dictionary_set_uint64(xdict, "nbAF", nearbyActionFlags);
  }
  nearbyActionTargetData = self->_nearbyActionTargetData;
  if (nearbyActionTargetData)
  {
    int v48 = nearbyActionTargetData;
    id v49 = xdict;
    uint64_t v50 = [(NSData *)v48 bytes];
    if (v50) {
      int v51 = (const char *)v50;
    }
    else {
      int v51 = "";
    }
    size_t v52 = [(NSData *)v48 length];

    xpc_dictionary_set_data(v49, "nbTg", v51, v52);
  }
  if (self->_nearbyActionType) {
    xpc_dictionary_set_uint64(xdict, "nbAc", self->_nearbyActionType);
  }
  uint64_t nearbyActionV2Flags = self->_nearbyActionV2Flags;
  if (nearbyActionV2Flags) {
    xpc_dictionary_set_uint64(xdict, "n2AF", nearbyActionV2Flags);
  }
  nearbyActionV2TargetData = self->_nearbyActionV2TargetData;
  if (nearbyActionV2TargetData)
  {
    v55 = nearbyActionV2TargetData;
    id v56 = xdict;
    uint64_t v57 = [(NSData *)v55 bytes];
    if (v57) {
      v58 = (const char *)v57;
    }
    else {
      v58 = "";
    }
    size_t v59 = [(NSData *)v55 length];

    xpc_dictionary_set_data(v56, "n2Tg", v58, v59);
  }
  if (self->_nearbyActionV2Type) {
    xpc_dictionary_set_uint64(xdict, "n2Ac", self->_nearbyActionV2Type);
  }
  uint64_t nearbyInfoFlags = self->_nearbyInfoFlags;
  if (nearbyInfoFlags) {
    xpc_dictionary_set_uint64(xdict, "nbIF", nearbyInfoFlags);
  }
  double nearbyInfoStatusProgress = self->_nearbyInfoStatusProgress;
  if (nearbyInfoStatusProgress != 0.0) {
    xpc_dictionary_set_double(xdict, "nsPr", nearbyInfoStatusProgress);
  }
  if (self->_nearbyInfoStatusTime) {
    xpc_dictionary_set_uint64(xdict, "nsTi", self->_nearbyInfoStatusTime);
  }
  if (self->_nearbyInfoStatusType) {
    xpc_dictionary_set_uint64(xdict, "nsTy", self->_nearbyInfoStatusType);
  }
  if (self->_nearbyInfoV2DecryptedFlags) {
    xpc_dictionary_set_uint64(xdict, "nb2Fe", self->_nearbyInfoV2DecryptedFlags);
  }
  if (self->_nearbyInfoV2Flags) {
    xpc_dictionary_set_uint64(xdict, "nb2F", self->_nearbyInfoV2Flags);
  }
  nearbyInfoV2AuthTagData = self->_nearbyInfoV2AuthTagData;
  if (nearbyInfoV2AuthTagData)
  {
    v63 = nearbyInfoV2AuthTagData;
    id v64 = xdict;
    uint64_t v65 = [(NSData *)v63 bytes];
    if (v65) {
      v66 = (const char *)v65;
    }
    else {
      v66 = "";
    }
    size_t v67 = [(NSData *)v63 length];

    xpc_dictionary_set_data(v64, "nb2A", v66, v67);
  }
  nearbyInfoV2AuthIntegrityTagData = self->_nearbyInfoV2AuthIntegrityTagData;
  if (nearbyInfoV2AuthIntegrityTagData)
  {
    v69 = nearbyInfoV2AuthIntegrityTagData;
    id v70 = xdict;
    uint64_t v71 = [(NSData *)v69 bytes];
    if (v71) {
      v72 = (const char *)v71;
    }
    else {
      v72 = "";
    }
    size_t v73 = [(NSData *)v69 length];

    xpc_dictionary_set_data(v70, "nb2Ai", v72, v73);
  }
  if (self->_nearbyInfoV2InvitationCounter) {
    xpc_dictionary_set_uint64(xdict, "nb2Ic", self->_nearbyInfoV2InvitationCounter);
  }
  if (self->_nearbyInfoV2InvitationTypes) {
    xpc_dictionary_set_uint64(xdict, "nb2It", self->_nearbyInfoV2InvitationTypes);
  }
  if (self->_nearbyInfoV2InvitationRouteType) {
    xpc_dictionary_set_uint64(xdict, "nb2Ir", self->_nearbyInfoV2InvitationRouteType);
  }
  safetyAlertsAlertData = self->_safetyAlertsAlertData;
  if (safetyAlertsAlertData)
  {
    v75 = safetyAlertsAlertData;
    id v76 = xdict;
    uint64_t v77 = [(NSData *)v75 bytes];
    if (v77) {
      v78 = (const char *)v77;
    }
    else {
      v78 = "";
    }
    size_t v79 = [(NSData *)v75 length];

    xpc_dictionary_set_data(v76, "saAd", v78, v79);
  }
  safetyAlertsAlertID = self->_safetyAlertsAlertID;
  if (safetyAlertsAlertID)
  {
    v81 = safetyAlertsAlertID;
    id v82 = xdict;
    uint64_t v83 = [(NSData *)v81 bytes];
    if (v83) {
      v84 = (const char *)v83;
    }
    else {
      v84 = "";
    }
    size_t v85 = [(NSData *)v81 length];

    xpc_dictionary_set_data(v82, "saAi", v84, v85);
  }
  safetyAlertsSignature = self->_safetyAlertsSignature;
  if (safetyAlertsSignature)
  {
    v87 = safetyAlertsSignature;
    id v88 = xdict;
    uint64_t v89 = [(NSData *)v87 bytes];
    if (v89) {
      v90 = (const char *)v89;
    }
    else {
      v90 = "";
    }
    size_t v91 = [(NSData *)v87 length];

    xpc_dictionary_set_data(v88, "saSg", v90, v91);
  }
  if (self->_safetyAlertsVersion) {
    xpc_dictionary_set_uint64(xdict, "saVs", self->_safetyAlertsVersion);
  }
  watchSetupData = self->_watchSetupData;
  if (watchSetupData)
  {
    v93 = watchSetupData;
    id v94 = xdict;
    uint64_t v95 = [(NSData *)v93 bytes];
    if (v95) {
      v96 = (const char *)v95;
    }
    else {
      v96 = "";
    }
    size_t v97 = [(NSData *)v93 length];

    xpc_dictionary_set_data(v94, "wsDa", v96, v97);
  }
  if (self->_nearbyActionNoWakeType) {
    xpc_dictionary_set_uint64(xdict, "nawT", self->_nearbyActionNoWakeType);
  }
  if (self->_nearbyActionNWPrecisionFindingStatus) {
    xpc_dictionary_set_uint64(xdict, "nawS", self->_nearbyActionNWPrecisionFindingStatus);
  }
  nearbyActionNoWakeAuthTagData = self->_nearbyActionNoWakeAuthTagData;
  if (nearbyActionNoWakeAuthTagData)
  {
    v99 = nearbyActionNoWakeAuthTagData;
    id v100 = xdict;
    uint64_t v101 = [(NSData *)v99 bytes];
    if (v101) {
      v102 = (const char *)v101;
    }
    else {
      v102 = "";
    }
    size_t v103 = [(NSData *)v99 length];

    xpc_dictionary_set_data(v100, "nawA", v102, v103);
  }
  nearbyActionNoWakeConfigData = self->_nearbyActionNoWakeConfigData;
  if (nearbyActionNoWakeConfigData)
  {
    v105 = nearbyActionNoWakeConfigData;
    id v106 = xdict;
    uint64_t v107 = [(NSData *)v105 bytes];
    if (v107) {
      v108 = (const char *)v107;
    }
    else {
      v108 = "";
    }
    size_t v109 = [(NSData *)v105 length];

    xpc_dictionary_set_data(v106, "nawC", v108, v109);
  }
}

- (id)description
{
  return [(CBAdvertiser *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t clientID = self->_clientID;
  NSAppendPrintF_safe();
  id v4 = 0;
  objc_super v5 = v4;
  if (self->_direct)
  {
    v121 = v4;
    NSAppendPrintF_safe();
    id v6 = v121;

    objc_super v5 = v6;
  }
  int advertiseRate = self->_advertiseRate;
  if (advertiseRate)
  {
    int v8 = advertiseRate - 10;
    int v9 = "2 seconds";
    switch(v8)
    {
      case 0:
        break;
      case 5:
        int v9 = "1022.5 ms";
        break;
      case 10:
        int v9 = "350 ms";
        break;
      case 30:
        int v9 = "181.25 ms";
        break;
      case 32:
        int v9 = "120 ms";
        break;
      case 35:
        int v9 = "60 ms";
        break;
      case 40:
        int v9 = "30 ms";
        break;
      case 50:
        int v9 = "20 ms";
        break;
      default:
        int v9 = "270 ms";
        break;
    }
    uint64_t clientID = (uint64_t)v9;
    NSAppendPrintF_safe();
    id v10 = v5;

    objc_super v5 = v10;
  }
  id v11 = self->_advertisingAddressDataConnectable;
  if (v11)
  {
    uint64_t clientID = CUPrintNSDataAddress();
    NSAppendPrintF_safe();
    id v12 = v5;

    objc_super v5 = v12;
  }

  int v13 = self->_advertisingAddressDataNonConnectable;
  if (v13)
  {
    uint64_t clientID = CUPrintNSDataAddress();
    NSAppendPrintF_safe();
    id v14 = v5;

    objc_super v5 = v14;
  }

  int v15 = self->_advertisingAddressDataNonConnectableSecondary;
  if (v15)
  {
    uint64_t clientID = CUPrintNSDataAddress();
    NSAppendPrintF_safe();
    id v16 = v5;

    objc_super v5 = v16;
  }

  id v17 = self->_remoteDevice;
  uint64_t v18 = v17;
  if (v17)
  {
    uint64_t clientID = (uint64_t)v17;
    NSAppendPrintF_safe();
    id v19 = v5;

    objc_super v5 = v19;
  }

  unsigned int useCase = self->_useCase;
  if (useCase)
  {
    uint64_t clientID = (uint64_t)CBUseCaseToString(useCase);
    NSAppendPrintF_safe();
    id v21 = v5;

    objc_super v5 = v21;
  }
  int v22 = self->_useCaseClientIDs;
  if (v22)
  {
    uint64_t clientID = CUPrintNSObjectOneLine();
    NSAppendPrintF_safe();
    id v23 = v5;

    objc_super v5 = v23;
  }

  if (self->_airdropFlags)
  {
    uint64_t clientID = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v24 = v5;

    objc_super v5 = v24;
  }
  int v25 = self->_airdropTempAuthTagData;
  if (v25)
  {
    uint64_t clientID = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    id v26 = v5;

    objc_super v5 = v26;
  }

  if (self->_airdropModel)
  {
    uint64_t clientID = self->_airdropModel;
    NSAppendPrintF_safe();
    id v27 = v5;

    objc_super v5 = v27;
  }
  if (self->_airdropVersion)
  {
    uint64_t clientID = self->_airdropVersion;
    NSAppendPrintF_safe();
    id v28 = v5;

    objc_super v5 = v28;
  }
  if (self->_airdropHash1)
  {
    uint64_t clientID = self->_airdropHash1;
    NSAppendPrintF_safe();
    id v29 = v5;

    objc_super v5 = v29;
  }
  if (self->_airdropHash2)
  {
    uint64_t clientID = self->_airdropHash2;
    NSAppendPrintF_safe();
    id v30 = v5;

    objc_super v5 = v30;
  }
  if (self->_airdropHash3)
  {
    uint64_t clientID = self->_airdropHash3;
    NSAppendPrintF_safe();
    id v31 = v5;

    objc_super v5 = v31;
  }
  if (self->_airdropHash4)
  {
    uint64_t clientID = self->_airdropHash4;
    NSAppendPrintF_safe();
    id v32 = v5;

    objc_super v5 = v32;
  }
  if (self->_airdropConfigData)
  {
    uint64_t clientID = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v33 = v5;

    objc_super v5 = v33;
  }
  int v34 = self->_airplaySourceAuthTagData;
  if (v34)
  {
    uint64_t clientID = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    id v35 = v5;

    objc_super v5 = v35;
  }

  if (self->_airplaySourceFlags)
  {
    uint64_t clientID = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v36 = v5;

    objc_super v5 = v36;
  }
  uint64_t v37 = self->_airplaySourceUWBConfigData;
  if (v37)
  {
    uint64_t clientID = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    id v38 = v5;

    objc_super v5 = v38;
  }

  if (self->_airplayTargetConfigSeed)
  {
    uint64_t clientID = self->_airplayTargetConfigSeed;
    NSAppendPrintF_safe();
    id v39 = v5;

    objc_super v5 = v39;
  }
  if (self->_airplayTargetFlags)
  {
    uint64_t clientID = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v40 = v5;

    objc_super v5 = v40;
  }
  if (self->_airplayTargetIPv4)
  {
    uint64_t clientID = CUPrintAddress();
    NSAppendPrintF_safe();
    id v41 = v5;

    objc_super v5 = v41;
  }
  if (self->_airplayTargetPort)
  {
    uint64_t clientID = self->_airplayTargetPort;
    NSAppendPrintF_safe();
    id v42 = v5;

    objc_super v5 = v42;
  }
  if (self->_dsActionFlags)
  {
    uint64_t clientID = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v43 = v5;

    objc_super v5 = v43;
  }
  if (self->_dsActionMeasuredPower)
  {
    uint64_t clientID = self->_dsActionMeasuredPower;
    NSAppendPrintF_safe();
    id v44 = v5;

    objc_super v5 = v44;
  }
  if (self->_dsActionTieBreaker)
  {
    uint64_t clientID = self->_dsActionTieBreaker;
    NSAppendPrintF_safe();
    id v45 = v5;

    objc_super v5 = v45;
  }
  if (self->_dsInfoVehicleConfidence)
  {
    [(CBAdvertiser *)self dsInfoVehicleConfidence];
    NSAppendPrintF_safe();
    id v46 = v5;

    objc_super v5 = v46;
  }
  if (self->_dsInfoVehicleState)
  {
    [(CBAdvertiser *)self dsInfoVehicleState];
    NSAppendPrintF_safe();
    id v47 = v5;

    objc_super v5 = v47;
  }
  if (self->_enableEPAForLEAdvertisement)
  {
    NSAppendPrintF_safe();
    id v48 = v5;

    objc_super v5 = v48;
  }
  id v49 = self->_fidoPayloadData;
  if (v49)
  {
    uint64_t v101 = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    id v50 = v5;

    objc_super v5 = v50;
  }

  if (self->_heySiriConfidence)
  {
    NSAppendPrintF_safe();
    id v51 = v5;

    objc_super v5 = v51;
  }
  if (self->_heySiriDeviceClass)
  {
    NSAppendPrintF_safe();
    id v52 = v5;

    objc_super v5 = v52;
  }
  if (self->_heySiriPerceptualHash)
  {
    NSAppendPrintF_safe();
    id v53 = v5;

    objc_super v5 = v53;
  }
  if (self->_heySiriProductType)
  {
    NSAppendPrintF_safe();
    id v54 = v5;

    objc_super v5 = v54;
  }
  if (self->_heySiriRandom)
  {
    NSAppendPrintF_safe();
    id v55 = v5;

    objc_super v5 = v55;
  }
  if (self->_heySiriSNR)
  {
    NSAppendPrintF_safe();
    id v56 = v5;

    objc_super v5 = v56;
  }
  uint64_t v57 = self->_nearbyActionAuthTagData;
  if (v57)
  {
    v102 = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    id v58 = v5;

    objc_super v5 = v58;
  }

  if (self->_nearbyActionColorCode)
  {
    NSAppendPrintF_safe();
    id v59 = v5;

    objc_super v5 = v59;
  }
  v60 = self->_nearbyActionExtraData;
  if (v60)
  {
    size_t v103 = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    id v61 = v5;

    objc_super v5 = v61;
  }

  if (self->_nearbyActionFlags)
  {
    v104 = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v62 = v5;

    objc_super v5 = v62;
  }
  if (self->_nearbyActionType)
  {
    NSAppendPrintF_safe();
    id v63 = v5;

    objc_super v5 = v63;
  }
  id v64 = self->_nearbyActionTargetData;
  if (v64)
  {
    v105 = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    id v65 = v5;

    objc_super v5 = v65;
  }

  if (self->_nearbyActionV2Flags)
  {
    id v106 = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v66 = v5;

    objc_super v5 = v66;
  }
  size_t v67 = self->_nearbyActionV2TargetData;
  if (v67)
  {
    uint64_t v107 = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    id v68 = v5;

    objc_super v5 = v68;
  }

  if (self->_nearbyActionV2Type)
  {
    NSAppendPrintF_safe();
    id v69 = v5;

    objc_super v5 = v69;
  }
  if (self->_nearbyInfoFlags)
  {
    v108 = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v70 = v5;

    objc_super v5 = v70;
  }
  if (self->_nearbyInfoStatusProgress != 0.0)
  {
    NSAppendPrintF_safe();
    id v71 = v5;

    objc_super v5 = v71;
  }
  if (self->_nearbyInfoStatusTime)
  {
    NSAppendPrintF_safe();
    id v72 = v5;

    objc_super v5 = v72;
  }
  if (self->_nearbyInfoStatusType)
  {
    NSAppendPrintF_safe();
    id v73 = v5;

    objc_super v5 = v73;
  }
  if (self->_nearbyInfoV2Flags)
  {
    size_t v109 = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v74 = v5;

    objc_super v5 = v74;
  }
  if (self->_nearbyInfoV2DecryptedFlags)
  {
    v110 = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v75 = v5;

    objc_super v5 = v75;
  }
  id v76 = self->_nearbyInfoV2AuthTagData;
  if (v76)
  {
    v111 = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    id v77 = v5;

    objc_super v5 = v77;
  }

  v78 = self->_nearbyInfoV2AuthIntegrityTagData;
  if (v78)
  {
    v112 = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    id v79 = v5;

    objc_super v5 = v79;
  }

  if (self->_nearbyInfoV2InvitationCounter)
  {
    NSAppendPrintF_safe();
    id v80 = v5;

    objc_super v5 = v80;
  }
  if (self->_nearbyInfoV2InvitationTypes)
  {
    v113 = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v81 = v5;

    objc_super v5 = v81;
  }
  if (self->_nearbyInfoV2InvitationRouteType)
  {
    NSAppendPrintF_safe();
    id v82 = v5;

    objc_super v5 = v82;
  }
  if (self->_nearbyActionNoWakeType)
  {
    NSAppendPrintF_safe();
    id v83 = v5;

    objc_super v5 = v83;
  }
  v84 = self->_safetyAlertsAlertData;
  if (v84)
  {
    v114 = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    id v85 = v5;

    objc_super v5 = v85;
  }

  v86 = self->_safetyAlertsAlertID;
  if (v86)
  {
    v115 = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    id v87 = v5;

    objc_super v5 = v87;
  }

  id v88 = self->_safetyAlertsSignature;
  if (v88)
  {
    v116 = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    id v89 = v5;

    objc_super v5 = v89;
  }

  if (self->_safetyAlertsVersion)
  {
    NSAppendPrintF_safe();
    id v90 = v5;

    objc_super v5 = v90;
  }
  size_t v91 = self->_watchSetupData;
  if (v91)
  {
    v117 = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    id v92 = v5;

    objc_super v5 = v92;
  }

  if (self->_nearbyActionNWPrecisionFindingStatus)
  {
    v118 = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v93 = v5;

    objc_super v5 = v93;
  }
  id v94 = self->_nearbyActionNoWakeAuthTagData;
  if (v94)
  {
    v119 = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    id v95 = v5;

    objc_super v5 = v95;
  }

  v96 = self->_nearbyActionNoWakeConfigData;
  if (v96)
  {
    v120 = CUPrintNSDataHex();
    NSAppendPrintF_safe();
    id v97 = v5;

    objc_super v5 = v97;
  }

  id v98 = v5;
  return v98;
}

- (void)setAirdropVersion:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__CBAdvertiser_setAirdropVersion___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __34__CBAdvertiser_setAirdropVersion___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 50);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 50) = v1;
  }
  return v1 != v3;
}

- (void)setAirdropFlags:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__CBAdvertiser_setAirdropFlags___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __32__CBAdvertiser_setAirdropFlags___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 48);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 48) = v1;
  }
  return v1 != v3;
}

- (void)setAirdropTempAuthTagData:(id)a3
{
  unsigned __int8 v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__CBAdvertiser_setAirdropTempAuthTagData___block_invoke;
  v6[3] = &unk_1E5E31518;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v6];
}

BOOL __42__CBAdvertiser_setAirdropTempAuthTagData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 264);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }
  else
  {
    id v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      char v7 = [v3 isEqual:v4];

      if (v7) {
        return 0;
      }
    }
    else
    {
    }
    int v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 264);
    *(void *)(v10 + 264) = v11;
  }

  return v5;
}

- (void)setModel:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __25__CBAdvertiser_setModel___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __25__CBAdvertiser_setModel___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 49);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 49) = v1;
  }
  return v1 != v3;
}

- (void)setAirdrophash1:(unsigned __int16)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__CBAdvertiser_setAirdrophash1___block_invoke;
  v3[3] = &unk_1E5E31540;
  unsigned __int16 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __32__CBAdvertiser_setAirdrophash1___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int16 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int16 *)(v2 + 80);
  if (v1 != v3) {
    *(_WORD *)(v2 + 80) = v1;
  }
  return v1 != v3;
}

- (void)setAirdrophash2:(unsigned __int16)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__CBAdvertiser_setAirdrophash2___block_invoke;
  v3[3] = &unk_1E5E31540;
  unsigned __int16 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __32__CBAdvertiser_setAirdrophash2___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int16 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int16 *)(v2 + 82);
  if (v1 != v3) {
    *(_WORD *)(v2 + 82) = v1;
  }
  return v1 != v3;
}

- (void)setAirdrophash3:(unsigned __int16)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__CBAdvertiser_setAirdrophash3___block_invoke;
  v3[3] = &unk_1E5E31540;
  unsigned __int16 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __32__CBAdvertiser_setAirdrophash3___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int16 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int16 *)(v2 + 84);
  if (v1 != v3) {
    *(_WORD *)(v2 + 84) = v1;
  }
  return v1 != v3;
}

- (void)setAirdrophash4:(unsigned __int16)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__CBAdvertiser_setAirdrophash4___block_invoke;
  v3[3] = &unk_1E5E31540;
  unsigned __int16 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __32__CBAdvertiser_setAirdrophash4___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int16 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int16 *)(v2 + 86);
  if (v1 != v3) {
    *(_WORD *)(v2 + 86) = v1;
  }
  return v1 != v3;
}

- (void)setAirdropConfigData:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__CBAdvertiser_setAirdropConfigData___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __37__CBAdvertiser_setAirdropConfigData___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 51);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 51) = v1;
  }
  return v1 != v3;
}

- (void)setAirplaySourceFlags:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__CBAdvertiser_setAirplaySourceFlags___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __38__CBAdvertiser_setAirplaySourceFlags___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 52);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 52) = v1;
  }
  return v1 != v3;
}

- (void)setAirplaySourceUWBConfigData:(id)a3
{
  unsigned __int8 v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__CBAdvertiser_setAirplaySourceUWBConfigData___block_invoke;
  v6[3] = &unk_1E5E31518;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v6];
}

BOOL __46__CBAdvertiser_setAirplaySourceUWBConfigData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 272);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }
  else
  {
    id v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      char v7 = [v3 isEqual:v4];

      if (v7) {
        return 0;
      }
    }
    else
    {
    }
    int v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 272);
    *(void *)(v10 + 272) = v11;
  }

  return v5;
}

- (void)setAirplayTargetConfigSeed:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__CBAdvertiser_setAirplayTargetConfigSeed___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __43__CBAdvertiser_setAirplayTargetConfigSeed___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 53);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 53) = v1;
  }
  return v1 != v3;
}

- (void)setAirplayTargetFlags:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__CBAdvertiser_setAirplayTargetFlags___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __38__CBAdvertiser_setAirplayTargetFlags___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 54);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 54) = v1;
  }
  return v1 != v3;
}

- (void)setAirplayTargetIPv4:(unsigned int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__CBAdvertiser_setAirplayTargetIPv4___block_invoke;
  v3[3] = &unk_1E5E31568;
  unsigned int v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __37__CBAdvertiser_setAirplayTargetIPv4___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 104);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 104) = v1;
  }
  return v1 != v3;
}

- (void)setAirplayTargetPort:(unsigned __int16)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__CBAdvertiser_setAirplayTargetPort___block_invoke;
  v3[3] = &unk_1E5E31540;
  unsigned __int16 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __37__CBAdvertiser_setAirplayTargetPort___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int16 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int16 *)(v2 + 88);
  if (v1 != v3) {
    *(_WORD *)(v2 + 88) = v1;
  }
  return v1 != v3;
}

- (void)setDsActionFlags:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__CBAdvertiser_setDsActionFlags___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __33__CBAdvertiser_setDsActionFlags___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 55);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 55) = v1;
  }
  return v1 != v3;
}

- (void)setDsActionMeasuredPower:(char)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__CBAdvertiser_setDsActionMeasuredPower___block_invoke;
  v3[3] = &unk_1E5E314F0;
  char v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __41__CBAdvertiser_setDsActionMeasuredPower___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 56);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 56) = v1;
  }
  return v1 != v3;
}

- (void)setDsActionTieBreaker:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__CBAdvertiser_setDsActionTieBreaker___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __38__CBAdvertiser_setDsActionTieBreaker___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 57);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 57) = v1;
  }
  return v1 != v3;
}

- (void)setDsInfoVehicleConfidence:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__CBAdvertiser_setDsInfoVehicleConfidence___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __43__CBAdvertiser_setDsInfoVehicleConfidence___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 58);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 58) = v1;
  }
  return v1 != v3;
}

- (void)setDsInfoVehicleState:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__CBAdvertiser_setDsInfoVehicleState___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __38__CBAdvertiser_setDsInfoVehicleState___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 59);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 59) = v1;
  }
  return v1 != v3;
}

- (void)setFidoPayloadData:(id)a3
{
  unsigned __int8 v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__CBAdvertiser_setFidoPayloadData___block_invoke;
  v6[3] = &unk_1E5E31518;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v6];
}

BOOL __35__CBAdvertiser_setFidoPayloadData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 280);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }
  else
  {
    id v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      char v7 = [v3 isEqual:v4];

      if (v7) {
        return 0;
      }
    }
    else
    {
    }
    int v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 280);
    *(void *)(v10 + 280) = v11;
  }

  return v5;
}

- (void)setHeySiriConfidence:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__CBAdvertiser_setHeySiriConfidence___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __37__CBAdvertiser_setHeySiriConfidence___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 61);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 61) = v1;
  }
  return v1 != v3;
}

- (void)setHeySiriDeviceClass:(unsigned __int16)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__CBAdvertiser_setHeySiriDeviceClass___block_invoke;
  v3[3] = &unk_1E5E31540;
  unsigned __int16 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __38__CBAdvertiser_setHeySiriDeviceClass___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int16 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int16 *)(v2 + 90);
  if (v1 != v3) {
    *(_WORD *)(v2 + 90) = v1;
  }
  return v1 != v3;
}

- (void)setHeySiriPerceptualHash:(unsigned __int16)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__CBAdvertiser_setHeySiriPerceptualHash___block_invoke;
  v3[3] = &unk_1E5E31540;
  unsigned __int16 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __41__CBAdvertiser_setHeySiriPerceptualHash___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int16 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int16 *)(v2 + 92);
  if (v1 != v3) {
    *(_WORD *)(v2 + 92) = v1;
  }
  return v1 != v3;
}

- (void)setHeySiriProductType:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__CBAdvertiser_setHeySiriProductType___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __38__CBAdvertiser_setHeySiriProductType___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 62);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 62) = v1;
  }
  return v1 != v3;
}

- (void)setHeySiriRandom:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__CBAdvertiser_setHeySiriRandom___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __33__CBAdvertiser_setHeySiriRandom___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 63);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 63) = v1;
  }
  return v1 != v3;
}

- (void)setHeySiriSNR:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__CBAdvertiser_setHeySiriSNR___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __30__CBAdvertiser_setHeySiriSNR___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 64);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 64) = v1;
  }
  return v1 != v3;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)setNearbyActionColorCode:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__CBAdvertiser_setNearbyActionColorCode___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __41__CBAdvertiser_setNearbyActionColorCode___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 65);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 65) = v1;
  }
  return v1 != v3;
}

- (void)setNearbyActionExtraData:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__CBAdvertiser_setNearbyActionExtraData___block_invoke;
  v6[3] = &unk_1E5E31518;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v6];
}

BOOL __41__CBAdvertiser_setNearbyActionExtraData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 296);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }
  else
  {
    id v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      char v7 = [v3 isEqual:v4];

      if (v7) {
        return 0;
      }
    }
    else
    {
    }
    int v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 296);
    *(void *)(v10 + 296) = v11;
  }

  return v5;
}

- (void)setNearbyInfoFlags:(unsigned int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__CBAdvertiser_setNearbyInfoFlags___block_invoke;
  v3[3] = &unk_1E5E31568;
  unsigned int v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __35__CBAdvertiser_setNearbyInfoFlags___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 116);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 116) = v1;
  }
  return v1 != v3;
}

- (void)setNearbyInfoStatusProgress:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__CBAdvertiser_setNearbyInfoStatusProgress___block_invoke;
  v3[3] = &unk_1E5E31590;
  *(double *)&void v3[5] = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __44__CBAdvertiser_setNearbyInfoStatusProgress___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(double *)(v2 + 320);
  if (v1 != v3) {
    *(double *)(v2 + 320) = v1;
  }
  return v1 != v3;
}

- (void)setNearbyInfoStatusTime:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__CBAdvertiser_setNearbyInfoStatusTime___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __40__CBAdvertiser_setNearbyInfoStatusTime___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 68);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 68) = v1;
  }
  return v1 != v3;
}

- (void)setNearbyInfoStatusType:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__CBAdvertiser_setNearbyInfoStatusType___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __40__CBAdvertiser_setNearbyInfoStatusType___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 69);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 69) = v1;
  }
  return v1 != v3;
}

- (void)setNearbyInfoV2DecryptedFlags:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__CBAdvertiser_setNearbyInfoV2DecryptedFlags___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __46__CBAdvertiser_setNearbyInfoV2DecryptedFlags___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 71);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 71) = v1;
  }
  return v1 != v3;
}

- (void)setNearbyInfoV2Flags:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__CBAdvertiser_setNearbyInfoV2Flags___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __37__CBAdvertiser_setNearbyInfoV2Flags___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 70);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 70) = v1;
  }
  return v1 != v3;
}

- (void)setNearbyInfoV2InvitationCounter:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__CBAdvertiser_setNearbyInfoV2InvitationCounter___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __49__CBAdvertiser_setNearbyInfoV2InvitationCounter___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 72);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 72) = v1;
  }
  return v1 != v3;
}

- (void)setNearbyInfoV2InvitationTypes:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__CBAdvertiser_setNearbyInfoV2InvitationTypes___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __47__CBAdvertiser_setNearbyInfoV2InvitationTypes___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 73);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 73) = v1;
  }
  return v1 != v3;
}

- (void)setnearbyInfoV2InvitationRouteType:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__CBAdvertiser_setnearbyInfoV2InvitationRouteType___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __51__CBAdvertiser_setnearbyInfoV2InvitationRouteType___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 74);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 74) = v1;
  }
  return v1 != v3;
}

- (void)setNearbyActionTargetData:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__CBAdvertiser_setNearbyActionTargetData___block_invoke;
  v6[3] = &unk_1E5E31518;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v6];
}

BOOL __42__CBAdvertiser_setNearbyActionTargetData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 304);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }
  else
  {
    id v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      char v7 = [v3 isEqual:v4];

      if (v7) {
        return 0;
      }
    }
    else
    {
    }
    int v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 304);
    *(void *)(v10 + 304) = v11;
  }

  return v5;
}

- (void)setNearbyActionNoWakeType:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__CBAdvertiser_setNearbyActionNoWakeType___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __42__CBAdvertiser_setNearbyActionNoWakeType___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 75);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 75) = v1;
  }
  return v1 != v3;
}

- (void)setSafetyAlertsAlertData:(id)a3
{
  unsigned __int8 v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__CBAdvertiser_setSafetyAlertsAlertData___block_invoke;
  v6[3] = &unk_1E5E31518;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v6];
}

BOOL __41__CBAdvertiser_setSafetyAlertsAlertData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 352);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }
  else
  {
    id v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      char v7 = [v3 isEqual:v4];

      if (v7) {
        return 0;
      }
    }
    else
    {
    }
    int v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 352);
    *(void *)(v10 + 352) = v11;
  }

  return v5;
}

- (void)setSafetyAlertsAlertID:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[v4 copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__CBAdvertiser_setSafetyAlertsAlertID___block_invoke;
  v8[3] = &unk_1E5E315B8;
  id v9 = v5;
  uint64_t v10 = self;
  id v11 = v4;
  id v6 = v4;
  id v7 = v5;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v8];
}

BOOL __39__CBAdvertiser_setSafetyAlertsAlertID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 360);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }
  else
  {
    id v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      char v7 = [v3 isEqual:v4];

      if (v7) {
        return 0;
      }
    }
    else
    {
    }
    uint64_t v10 = a1 + 40;
    uint64_t v9 = *(void *)(a1 + 40);
    id v11 = *(id *)(v10 + 8);
    id v3 = *(id *)(v9 + 360);
    *(void *)(v9 + 360) = v11;
  }

  return v5;
}

- (void)setSafetyAlertsSignature:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__CBAdvertiser_setSafetyAlertsSignature___block_invoke;
  v6[3] = &unk_1E5E31518;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v6];
}

BOOL __41__CBAdvertiser_setSafetyAlertsSignature___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 368);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }
  else
  {
    id v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      char v7 = [v3 isEqual:v4];

      if (v7) {
        return 0;
      }
    }
    else
    {
    }
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 368);
    *(void *)(v10 + 368) = v11;
  }

  return v5;
}

- (void)setSafetyAlertsVersion:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__CBAdvertiser_setSafetyAlertsVersion___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __39__CBAdvertiser_setSafetyAlertsVersion___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 78);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 78) = v1;
  }
  return v1 != v3;
}

- (void)setUseCase:(unsigned int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__CBAdvertiser_setUseCase___block_invoke;
  v3[3] = &unk_1E5E31568;
  unsigned int v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __27__CBAdvertiser_setUseCase___block_invoke(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 96);
  if (v1 != v3) {
    *(_DWORD *)(v2 + 96) = v1;
  }
  return v1 != v3;
}

- (void)setUseCaseClientIDs:(id)a3
{
  unsigned int v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__CBAdvertiser_setUseCaseClientIDs___block_invoke;
  v6[3] = &unk_1E5E31518;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v6];
}

BOOL __36__CBAdvertiser_setUseCaseClientIDs___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 240);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }
  else
  {
    id v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      char v7 = [v3 isEqual:v4];

      if (v7) {
        return 0;
      }
    }
    else
    {
    }
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 240);
    *(void *)(v10 + 240) = v11;
  }

  return v5;
}

- (void)setWatchSetupData:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__CBAdvertiser_setWatchSetupData___block_invoke;
  v6[3] = &unk_1E5E31518;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v6];
}

BOOL __34__CBAdvertiser_setWatchSetupData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 376);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }
  else
  {
    id v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      char v7 = [v3 isEqual:v4];

      if (v7) {
        return 0;
      }
    }
    else
    {
    }
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 376);
    *(void *)(v10 + 376) = v11;
  }

  return v5;
}

- (void)setNearbyActionNWPrecisionFindingStatus:(unsigned __int8)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__CBAdvertiser_setNearbyActionNWPrecisionFindingStatus___block_invoke;
  v3[3] = &unk_1E5E314F0;
  unsigned __int8 v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __56__CBAdvertiser_setNearbyActionNWPrecisionFindingStatus___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 76);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 76) = v1;
  }
  return v1 != v3;
}

- (void)setNearbyActionNoWakeAuthTagData:(id)a3
{
  unsigned __int8 v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__CBAdvertiser_setNearbyActionNoWakeAuthTagData___block_invoke;
  v6[3] = &unk_1E5E31518;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v6];
}

BOOL __49__CBAdvertiser_setNearbyActionNoWakeAuthTagData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 336);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }
  else
  {
    id v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      char v7 = [v3 isEqual:v4];

      if (v7) {
        return 0;
      }
    }
    else
    {
    }
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 336);
    *(void *)(v10 + 336) = v11;
  }

  return v5;
}

- (void)setNearbyActionNoWakeConfigData:(id)a3
{
  id v4 = (void *)[a3 copy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__CBAdvertiser_setNearbyActionNoWakeConfigData___block_invoke;
  v6[3] = &unk_1E5E31518;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v6];
}

BOOL __48__CBAdvertiser_setNearbyActionNoWakeConfigData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 344);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  BOOL v5 = v3 != v4;
  if (v3 == v4)
  {
  }
  else
  {
    id v6 = v4;
    if ((v3 == 0) != (v4 != 0))
    {
      char v7 = [v3 isEqual:v4];

      if (v7) {
        return 0;
      }
    }
    else
    {
    }
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = v9;
    id v3 = *(id *)(v10 + 344);
    *(void *)(v10 + 344) = v11;
  }

  return v5;
}

- (void)setEpaTxPower:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__CBAdvertiser_setEpaTxPower___block_invoke;
  v3[3] = &unk_1E5E314F0;
  BOOL v4 = a3;
  v3[4] = self;
  [(CBAdvertiser *)self _updateIfNeededWithBlock:v3];
}

BOOL __30__CBAdvertiser_setEpaTxPower___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 60);
  if (v1 != v3) {
    *(unsigned char *)(v2 + 60) = v1;
  }
  return v1 != v3;
}

- (BOOL)updateWithCBAdvertiser:(id)a3
{
  id v4 = a3;
  int v5 = [v4 advertiseRate];
  int advertiseRate = self->_advertiseRate;
  BOOL v7 = v5 != advertiseRate;
  if (v5 == advertiseRate)
  {
    id v10 = 0;
    unsigned int v11 = [v4 useCase];
    unsigned int useCase = self->_useCase;
    if (v11 != useCase)
    {
LABEL_27:
      v343 = CBUseCaseToString(useCase);
      v398 = CBUseCaseToString(v11);
      CUAppendF();
      id v14 = v10;

      self->_unsigned int useCase = v11;
      BOOL v7 = 1;
      id v10 = v14;
    }
  }
  else
  {
    int v8 = v5;
    uint64_t v9 = "Default";
    switch(advertiseRate)
    {
      case 0:
        break;
      case 10:
        uint64_t v9 = "Periodic";
        break;
      case 15:
        uint64_t v9 = "PeriodicHigh";
        break;
      case 20:
        uint64_t v9 = "Background";
        break;
      case 30:
        uint64_t v9 = "Low";
        break;
      case 40:
        uint64_t v9 = "Medium";
        break;
      case 42:
        uint64_t v9 = "MediumMid";
        break;
      case 45:
        uint64_t v9 = "MediumHigh";
        break;
      case 50:
        uint64_t v9 = "High";
        break;
      case 60:
        uint64_t v9 = "Max";
        break;
      default:
        uint64_t v9 = "?";
        break;
    }
    int v13 = "Default";
    switch(v5)
    {
      case 0:
        break;
      case 10:
        int v13 = "Periodic";
        break;
      case 15:
        int v13 = "PeriodicHigh";
        break;
      case 20:
        int v13 = "Background";
        break;
      case 30:
        int v13 = "Low";
        break;
      case 40:
        int v13 = "Medium";
        break;
      case 42:
        int v13 = "MediumMid";
        break;
      case 45:
        int v13 = "MediumHigh";
        break;
      case 50:
        int v13 = "High";
        break;
      case 60:
        int v13 = "Max";
        break;
      default:
        int v13 = "?";
        break;
    }
    v344 = v9;
    v399 = v13;
    CUAppendF();
    id v10 = 0;
    self->_int advertiseRate = v8;
    unsigned int v11 = objc_msgSend(v4, "useCase", v344, v399);
    unsigned int useCase = self->_useCase;
    if (v11 != useCase) {
      goto LABEL_27;
    }
  }
  int v15 = objc_msgSend(v4, "useCaseClientIDs", v343, v398);
  useCaseClientIDs = self->_useCaseClientIDs;
  id v17 = v15;
  uint64_t v18 = useCaseClientIDs;
  if (v17 == v18)
  {

    id v55 = v17;
  }
  else
  {
    id v19 = v18;
    if ((v17 == 0) != (v18 != 0))
    {
      char v20 = [(NSArray *)v17 isEqual:v18];

      if (v20)
      {
        unsigned int v21 = [v4 enableEPAForLEAdvertisement];
        BOOL enableEPAForLEAdvertisement = self->_enableEPAForLEAdvertisement;
        if (enableEPAForLEAdvertisement == v21) {
          goto LABEL_32;
        }
        goto LABEL_55;
      }
    }
    else
    {
    }
    id v58 = CUPrintNSObjectOneLine();
    CUPrintNSObjectOneLine();
    v400 = v345 = v58;
    CUAppendF();
    id v59 = v10;

    v60 = v17;
    id v55 = self->_useCaseClientIDs;
    self->_useCaseClientIDs = v60;
    BOOL v7 = 1;
    id v10 = v59;
  }

  unsigned int v21 = [v4 enableEPAForLEAdvertisement];
  BOOL enableEPAForLEAdvertisement = self->_enableEPAForLEAdvertisement;
  if (enableEPAForLEAdvertisement == v21)
  {
LABEL_32:
    unsigned int v23 = objc_msgSend(v4, "airdropFlags", v345, v400);
    uint64_t airdropFlags = self->_airdropFlags;
    if (v23 == airdropFlags) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_55:
  BOOL v61 = v21;
  BOOL v350 = enableEPAForLEAdvertisement;
  uint64_t v405 = v21;
  CUAppendF();
  id v62 = v10;

  self->_BOOL enableEPAForLEAdvertisement = v61;
  BOOL v7 = 1;
  id v10 = v62;
  unsigned int v23 = objc_msgSend(v4, "airdropFlags", v350, v405);
  uint64_t airdropFlags = self->_airdropFlags;
  if (v23 != airdropFlags)
  {
LABEL_33:
    unsigned __int8 v25 = v23;
    uint64_t v346 = airdropFlags;
    uint64_t v401 = v23;
    CUAppendF();
    id v26 = v10;

    self->_uint64_t airdropFlags = v25;
    BOOL v7 = 1;
    id v10 = v26;
  }
LABEL_34:
  id v27 = objc_msgSend(v4, "airdropTempAuthTagData", v346, v401);
  airdropTempAuthTagData = self->_airdropTempAuthTagData;
  id v29 = v27;
  id v30 = airdropTempAuthTagData;
  if (v29 == v30)
  {

    id v56 = v29;
  }
  else
  {
    id v31 = v30;
    if ((v29 == 0) != (v30 != 0))
    {
      char v32 = [(NSData *)v29 isEqual:v30];

      if (v32)
      {
        unsigned int v33 = [v4 airdropModel];
        uint64_t airdropModel = self->_airdropModel;
        if (v33 == airdropModel) {
          goto LABEL_38;
        }
        goto LABEL_60;
      }
    }
    else
    {
    }
    BOOL v7 = 1;
    id v63 = CUPrintNSDataHex();
    CUPrintNSDataHex();
    v402 = v347 = v63;
    CUAppendF();
    id v64 = v10;

    id v65 = v29;
    id v56 = self->_airdropTempAuthTagData;
    self->_airdropTempAuthTagData = v65;
    id v10 = v64;
  }

  unsigned int v33 = [v4 airdropModel];
  uint64_t airdropModel = self->_airdropModel;
  if (v33 == airdropModel)
  {
LABEL_38:
    unsigned int v35 = objc_msgSend(v4, "airdropVersion", v347, v402);
    uint64_t airdropVersion = self->_airdropVersion;
    if (v35 == airdropVersion) {
      goto LABEL_39;
    }
    goto LABEL_61;
  }
LABEL_60:
  unsigned __int8 v66 = v33;
  uint64_t v351 = airdropModel;
  uint64_t v406 = v33;
  CUAppendF();
  id v67 = v10;

  self->_uint64_t airdropModel = v66;
  BOOL v7 = 1;
  id v10 = v67;
  unsigned int v35 = objc_msgSend(v4, "airdropVersion", v351, v406);
  uint64_t airdropVersion = self->_airdropVersion;
  if (v35 == airdropVersion)
  {
LABEL_39:
    unsigned int v37 = [v4 airdropHash1];
    uint64_t airdropHash1 = self->_airdropHash1;
    if (v37 == airdropHash1) {
      goto LABEL_40;
    }
    goto LABEL_62;
  }
LABEL_61:
  unsigned __int8 v68 = v35;
  uint64_t v352 = airdropVersion;
  uint64_t v407 = v35;
  CUAppendF();
  id v69 = v10;

  self->_uint64_t airdropVersion = v68;
  BOOL v7 = 1;
  id v10 = v69;
  unsigned int v37 = objc_msgSend(v4, "airdropHash1", v352, v407);
  uint64_t airdropHash1 = self->_airdropHash1;
  if (v37 == airdropHash1)
  {
LABEL_40:
    unsigned int v39 = [v4 airdropHash2];
    uint64_t airdropHash2 = self->_airdropHash2;
    if (v39 == airdropHash2) {
      goto LABEL_41;
    }
    goto LABEL_63;
  }
LABEL_62:
  unsigned __int16 v70 = v37;
  uint64_t v353 = airdropHash1;
  uint64_t v408 = v37;
  CUAppendF();
  id v71 = v10;

  self->_uint64_t airdropHash1 = v70;
  BOOL v7 = 1;
  id v10 = v71;
  unsigned int v39 = objc_msgSend(v4, "airdropHash2", v353, v408);
  uint64_t airdropHash2 = self->_airdropHash2;
  if (v39 == airdropHash2)
  {
LABEL_41:
    unsigned int v41 = [v4 airdropHash3];
    uint64_t airdropHash3 = self->_airdropHash3;
    if (v41 == airdropHash3) {
      goto LABEL_42;
    }
    goto LABEL_64;
  }
LABEL_63:
  unsigned __int16 v72 = v39;
  uint64_t v354 = airdropHash2;
  uint64_t v409 = v39;
  CUAppendF();
  id v73 = v10;

  self->_uint64_t airdropHash2 = v72;
  BOOL v7 = 1;
  id v10 = v73;
  unsigned int v41 = objc_msgSend(v4, "airdropHash3", v354, v409);
  uint64_t airdropHash3 = self->_airdropHash3;
  if (v41 == airdropHash3)
  {
LABEL_42:
    unsigned int v43 = [v4 airdropHash4];
    uint64_t airdropHash4 = self->_airdropHash4;
    if (v43 == airdropHash4) {
      goto LABEL_43;
    }
    goto LABEL_65;
  }
LABEL_64:
  unsigned __int16 v74 = v41;
  uint64_t v355 = airdropHash3;
  uint64_t v410 = v41;
  CUAppendF();
  id v75 = v10;

  self->_uint64_t airdropHash3 = v74;
  BOOL v7 = 1;
  id v10 = v75;
  unsigned int v43 = objc_msgSend(v4, "airdropHash4", v355, v410);
  uint64_t airdropHash4 = self->_airdropHash4;
  if (v43 == airdropHash4)
  {
LABEL_43:
    unsigned int v45 = [v4 airdropConfigData];
    uint64_t airdropConfigData = self->_airdropConfigData;
    if (v45 == airdropConfigData) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_65:
  unsigned __int16 v76 = v43;
  uint64_t v356 = airdropHash4;
  uint64_t v411 = v43;
  CUAppendF();
  id v77 = v10;

  self->_uint64_t airdropHash4 = v76;
  BOOL v7 = 1;
  id v10 = v77;
  unsigned int v45 = objc_msgSend(v4, "airdropConfigData", v356, v411);
  uint64_t airdropConfigData = self->_airdropConfigData;
  if (v45 != airdropConfigData)
  {
LABEL_44:
    unsigned __int8 v47 = v45;
    uint64_t v348 = airdropConfigData;
    uint64_t v403 = v45;
    CUAppendF();
    id v48 = v10;

    self->_uint64_t airdropConfigData = v47;
    BOOL v7 = 1;
    id v10 = v48;
  }
LABEL_45:
  id v49 = objc_msgSend(v4, "airplaySourceAuthTagData", v348, v403);
  airplaySourceAuthTagData = self->_airplaySourceAuthTagData;
  id v51 = v49;
  id v52 = airplaySourceAuthTagData;
  if (v51 == v52)
  {

    uint64_t v57 = v51;
LABEL_69:

    goto LABEL_70;
  }
  id v53 = v52;
  if ((v51 == 0) == (v52 != 0))
  {

    goto LABEL_68;
  }
  char v54 = [(NSData *)v51 isEqual:v52];

  if ((v54 & 1) == 0)
  {
LABEL_68:
    BOOL v7 = 1;
    v78 = CUPrintNSDataHex();
    CUPrintNSDataHex();
    v404 = v349 = v78;
    CUAppendF();
    id v79 = v10;

    id v80 = v51;
    uint64_t v57 = self->_airplaySourceAuthTagData;
    self->_airplaySourceAuthTagData = v80;
    id v10 = v79;
    goto LABEL_69;
  }
LABEL_70:
  int v81 = objc_msgSend(v4, "airplaySourceFlags", v349, v404);
  v469 = v29;
  v470 = v17;
  if (v81 != self->_airplaySourceFlags)
  {
    id v82 = CUPrintFlags32();
    CUPrintFlags32();
    v412 = v357 = v82;
    CUAppendF();
    id v83 = v10;

    self->_airplaySourceFlags = v81;
    BOOL v7 = 1;
    id v10 = v83;
  }
  v84 = objc_msgSend(v4, "airplaySourceUWBConfigData", v357, v412);
  airplaySourceUWBConfigData = self->_airplaySourceUWBConfigData;
  v86 = v84;
  id v87 = airplaySourceUWBConfigData;
  if (v86 == v87)
  {

    v163 = v86;
  }
  else
  {
    id v88 = v87;
    if ((v86 == 0) != (v87 != 0))
    {
      char v89 = [(NSData *)v86 isEqual:v87];

      if (v89)
      {
        unsigned int v90 = [v4 airplayTargetConfigSeed];
        airplayTargetConfigSeed = (void *)self->_airplayTargetConfigSeed;
        if (v90 == airplayTargetConfigSeed) {
          goto LABEL_77;
        }
        goto LABEL_76;
      }
    }
    else
    {
    }
    BOOL v7 = 1;
    v167 = CUPrintNSDataHex();
    CUPrintNSDataHex();
    uint64_t v413 = v358 = v167;
    CUAppendF();
    id v168 = v10;

    v169 = v86;
    v163 = self->_airplaySourceUWBConfigData;
    self->_airplaySourceUWBConfigData = v169;
    id v10 = v168;
  }

  unsigned int v90 = [v4 airplayTargetConfigSeed];
  airplayTargetConfigSeed = (void *)self->_airplayTargetConfigSeed;
  if (v90 != airplayTargetConfigSeed)
  {
LABEL_76:
    unsigned __int8 v92 = v90;
    v358 = airplayTargetConfigSeed;
    uint64_t v413 = v90;
    CUAppendF();
    id v93 = v10;

    self->_airplayTargetConfigSeed = v92;
    BOOL v7 = 1;
    id v10 = v93;
  }
LABEL_77:
  int v94 = objc_msgSend(v4, "airplayTargetFlags", v358, v413);
  v467 = v86;
  if (v94 != self->_airplayTargetFlags)
  {
    id v95 = CUPrintFlags32();
    CUPrintFlags32();
    v414 = v359 = v95;
    CUAppendF();
    id v96 = v10;

    self->_airplayTargetFlags = v94;
    BOOL v7 = 1;
    id v10 = v96;
  }
  unsigned int v471 = objc_msgSend(v4, "airplayTargetIPv4", v359, v414);
  if (v471 == self->_airplayTargetIPv4)
  {
    unsigned int v97 = [v4 airplayTargetPort];
    uint64_t airplayTargetPort = self->_airplayTargetPort;
    if (v97 == airplayTargetPort) {
      goto LABEL_81;
    }
  }
  else
  {
    BOOL v7 = 1;
    v148 = CUPrintAddress();
    v420 = CUPrintAddress();
    CUAppendF();
    id v149 = v10;

    self->_airplayTargetIPid v4 = v471;
    id v10 = v149;
    unsigned int v97 = objc_msgSend(v4, "airplayTargetPort", v148, v420);
    uint64_t airplayTargetPort = self->_airplayTargetPort;
    if (v97 == airplayTargetPort)
    {
LABEL_81:
      int v99 = [v4 dsActionFlags];
      if (v99 == self->_dsActionFlags) {
        goto LABEL_82;
      }
      goto LABEL_109;
    }
  }
  unsigned __int16 v150 = v97;
  uint64_t v365 = airplayTargetPort;
  uint64_t v421 = v97;
  CUAppendF();
  id v151 = v10;

  self->_uint64_t airplayTargetPort = v150;
  BOOL v7 = 1;
  id v10 = v151;
  int v99 = objc_msgSend(v4, "dsActionFlags", v365, v421);
  if (v99 == self->_dsActionFlags)
  {
LABEL_82:
    int v100 = [v4 dsActionMeasuredPower];
    uint64_t dsActionMeasuredPower = self->_dsActionMeasuredPower;
    if (v100 == self->_dsActionMeasuredPower) {
      goto LABEL_83;
    }
    goto LABEL_110;
  }
LABEL_109:
  v152 = CUPrintFlags32();
  v422 = CUPrintFlags32();
  CUAppendF();
  id v153 = v10;

  self->_dsActionFlags = v99;
  BOOL v7 = 1;
  id v10 = v153;
  int v100 = objc_msgSend(v4, "dsActionMeasuredPower", v152, v422);
  uint64_t dsActionMeasuredPower = self->_dsActionMeasuredPower;
  if (v100 == self->_dsActionMeasuredPower)
  {
LABEL_83:
    unsigned int v102 = [v4 dsActionTieBreaker];
    uint64_t dsActionTieBreaker = self->_dsActionTieBreaker;
    if (v102 == dsActionTieBreaker) {
      goto LABEL_84;
    }
    goto LABEL_111;
  }
LABEL_110:
  char v154 = v100;
  uint64_t v366 = dsActionMeasuredPower;
  uint64_t v423 = v100;
  CUAppendF();
  id v155 = v10;

  self->_uint64_t dsActionMeasuredPower = v154;
  BOOL v7 = 1;
  id v10 = v155;
  unsigned int v102 = objc_msgSend(v4, "dsActionTieBreaker", v366, v423);
  uint64_t dsActionTieBreaker = self->_dsActionTieBreaker;
  if (v102 == dsActionTieBreaker)
  {
LABEL_84:
    unsigned int v104 = [v4 dsInfoVehicleConfidence];
    uint64_t dsInfoVehicleConfidence = self->_dsInfoVehicleConfidence;
    if (v104 == dsInfoVehicleConfidence) {
      goto LABEL_85;
    }
    goto LABEL_112;
  }
LABEL_111:
  unsigned __int8 v156 = v102;
  uint64_t v367 = dsActionTieBreaker;
  uint64_t v424 = v102;
  CUAppendF();
  id v157 = v10;

  self->_uint64_t dsActionTieBreaker = v156;
  BOOL v7 = 1;
  id v10 = v157;
  unsigned int v104 = objc_msgSend(v4, "dsInfoVehicleConfidence", v367, v424);
  uint64_t dsInfoVehicleConfidence = self->_dsInfoVehicleConfidence;
  if (v104 == dsInfoVehicleConfidence)
  {
LABEL_85:
    unsigned int v106 = [v4 dsInfoVehicleState];
    LODWORD(v107) = self->_dsInfoVehicleState;
    if (v106 == v107) {
      goto LABEL_86;
    }
    goto LABEL_113;
  }
LABEL_112:
  unsigned __int8 v158 = v104;
  uint64_t v368 = dsInfoVehicleConfidence;
  uint64_t v425 = v104;
  CUAppendF();
  id v159 = v10;

  self->_uint64_t dsInfoVehicleConfidence = v158;
  BOOL v7 = 1;
  id v10 = v159;
  unsigned int v106 = objc_msgSend(v4, "dsInfoVehicleState", v368, v425);
  LODWORD(v107) = self->_dsInfoVehicleState;
  if (v106 == v107)
  {
LABEL_86:
    unsigned int v108 = [v4 enableEPAForLEAdvertisement];
    BOOL v109 = self->_enableEPAForLEAdvertisement;
    if (v109 == v108) {
      goto LABEL_88;
    }
    goto LABEL_87;
  }
LABEL_113:
  unsigned __int8 v160 = v106;
  uint64_t v107 = (char)v107;
  if ((char)v107 > 2)
  {
    v161 = "?";
    if (v106 > 2) {
      goto LABEL_115;
    }
  }
  else
  {
    v161 = off_1E5E31D78[v107];
    if (v106 > 2)
    {
LABEL_115:
      v162 = "?";
      goto LABEL_251;
    }
  }
  v162 = off_1E5E31D78[(char)v106];
LABEL_251:
  v391 = v161;
  v449 = v162;
  CUAppendF();
  id v325 = v10;

  self->_dsInfoVehicleState = v160;
  BOOL v7 = 1;
  id v10 = v325;
  unsigned int v108 = objc_msgSend(v4, "enableEPAForLEAdvertisement", v391, v449);
  BOOL v109 = self->_enableEPAForLEAdvertisement;
  if (v109 != v108)
  {
LABEL_87:
    BOOL v110 = v108;
    BOOL v360 = v109;
    uint64_t v415 = v108;
    CUAppendF();
    id v111 = v10;

    self->_BOOL enableEPAForLEAdvertisement = v110;
    BOOL v7 = 1;
    id v10 = v111;
  }
LABEL_88:
  v112 = objc_msgSend(v4, "fidoPayloadData", v360, v415);
  fidoPayloadData = self->_fidoPayloadData;
  v114 = v112;
  v115 = fidoPayloadData;
  if (v114 == v115)
  {

    v164 = v114;
  }
  else
  {
    v116 = v115;
    if ((v114 == 0) != (v115 != 0))
    {
      char v117 = [(NSData *)v114 isEqual:v115];

      if (v117)
      {
        unsigned int v118 = [v4 heySiriConfidence];
        uint64_t heySiriConfidence = self->_heySiriConfidence;
        if (v118 == heySiriConfidence) {
          goto LABEL_92;
        }
        goto LABEL_127;
      }
    }
    else
    {
    }
    BOOL v7 = 1;
    v170 = CUPrintNSDataHex();
    CUPrintNSDataHex();
    v416 = v361 = v170;
    CUAppendF();
    id v171 = v10;

    v172 = v114;
    v164 = self->_fidoPayloadData;
    self->_fidoPayloadData = v172;
    id v10 = v171;
  }

  unsigned int v118 = [v4 heySiriConfidence];
  uint64_t heySiriConfidence = self->_heySiriConfidence;
  if (v118 == heySiriConfidence)
  {
LABEL_92:
    unsigned int v120 = objc_msgSend(v4, "heySiriDeviceClass", v361, v416);
    LODWORD(v121) = self->_heySiriDeviceClass;
    if (v120 == v121) {
      goto LABEL_93;
    }
    goto LABEL_128;
  }
LABEL_127:
  unsigned __int8 v173 = v118;
  uint64_t v369 = heySiriConfidence;
  uint64_t v426 = v118;
  CUAppendF();
  id v174 = v10;

  self->_uint64_t heySiriConfidence = v173;
  BOOL v7 = 1;
  id v10 = v174;
  unsigned int v120 = objc_msgSend(v4, "heySiriDeviceClass", v369, v426);
  LODWORD(v121) = self->_heySiriDeviceClass;
  if (v120 == v121)
  {
LABEL_93:
    unsigned int v122 = [v4 heySiriPerceptualHash];
    uint64_t heySiriPerceptualHash = self->_heySiriPerceptualHash;
    if (v122 == heySiriPerceptualHash) {
      goto LABEL_94;
    }
    goto LABEL_256;
  }
LABEL_128:
  unsigned __int16 v175 = v120;
  uint64_t v121 = (__int16)v121;
  if ((__int16)v121 > 0xA)
  {
    v176 = "?";
    if (v120 > 0xA) {
      goto LABEL_130;
    }
  }
  else
  {
    v176 = off_1E5E31D90[v121];
    if (v120 > 0xA)
    {
LABEL_130:
      v177 = "?";
      goto LABEL_255;
    }
  }
  v177 = off_1E5E31D90[(__int16)v120];
LABEL_255:
  v392 = v176;
  v450 = v177;
  CUAppendF();
  id v326 = v10;

  self->_heySiriDeviceClass = v175;
  BOOL v7 = 1;
  id v10 = v326;
  unsigned int v122 = objc_msgSend(v4, "heySiriPerceptualHash", v392, v450);
  uint64_t heySiriPerceptualHash = self->_heySiriPerceptualHash;
  if (v122 == heySiriPerceptualHash)
  {
LABEL_94:
    unsigned int v124 = [v4 heySiriProductType];
    LODWORD(v125) = self->_heySiriProductType;
    if (v124 == v125) {
      goto LABEL_95;
    }
    goto LABEL_257;
  }
LABEL_256:
  unsigned __int16 v327 = v122;
  uint64_t v393 = heySiriPerceptualHash;
  uint64_t v451 = v122;
  CUAppendF();
  id v328 = v10;

  self->_uint64_t heySiriPerceptualHash = v327;
  BOOL v7 = 1;
  id v10 = v328;
  unsigned int v124 = objc_msgSend(v4, "heySiriProductType", v393, v451);
  LODWORD(v125) = self->_heySiriProductType;
  if (v124 == v125)
  {
LABEL_95:
    unsigned int v126 = [v4 heySiriRandom];
    uint64_t heySiriRandom = self->_heySiriRandom;
    if (v126 == heySiriRandom) {
      goto LABEL_96;
    }
    goto LABEL_269;
  }
LABEL_257:
  unsigned __int8 v329 = v124;
  uint64_t v125 = (char)v125;
  if ((char)v125 > 4)
  {
    v330 = "?";
    if (v124 > 4) {
      goto LABEL_259;
    }
  }
  else
  {
    v330 = off_1E5E31DE8[v125];
    if (v124 > 4)
    {
LABEL_259:
      v331 = "?";
      goto LABEL_268;
    }
  }
  v331 = off_1E5E31DE8[(char)v124];
LABEL_268:
  v395 = v330;
  v453 = v331;
  CUAppendF();
  id v336 = v10;

  self->_heySiriProductType = v329;
  BOOL v7 = 1;
  id v10 = v336;
  unsigned int v126 = objc_msgSend(v4, "heySiriRandom", v395, v453);
  uint64_t heySiriRandom = self->_heySiriRandom;
  if (v126 == heySiriRandom)
  {
LABEL_96:
    unsigned int v128 = [v4 heySiriSNR];
    uint64_t heySiriSNR = self->_heySiriSNR;
    if (v128 == heySiriSNR) {
      goto LABEL_98;
    }
    goto LABEL_97;
  }
LABEL_269:
  unsigned __int8 v337 = v126;
  uint64_t v396 = heySiriRandom;
  uint64_t v454 = v126;
  CUAppendF();
  id v338 = v10;

  self->_uint64_t heySiriRandom = v337;
  BOOL v7 = 1;
  id v10 = v338;
  unsigned int v128 = objc_msgSend(v4, "heySiriSNR", v396, v454);
  uint64_t heySiriSNR = self->_heySiriSNR;
  if (v128 != heySiriSNR)
  {
LABEL_97:
    unsigned __int8 v130 = v128;
    uint64_t v362 = heySiriSNR;
    uint64_t v417 = v128;
    CUAppendF();
    id v131 = v10;

    self->_uint64_t heySiriSNR = v130;
    BOOL v7 = 1;
    id v10 = v131;
  }
LABEL_98:
  v132 = objc_msgSend(v4, "nearbyActionAuthTagData", v362, v417);
  nearbyActionAuthTagData = self->_nearbyActionAuthTagData;
  v134 = v132;
  v135 = nearbyActionAuthTagData;
  if (v134 == v135)
  {

    v165 = v134;
  }
  else
  {
    v136 = v135;
    if ((v134 == 0) != (v135 != 0))
    {
      char v137 = [(NSData *)v134 isEqual:v135];

      if (v137)
      {
        unsigned int v138 = [v4 nearbyActionColorCode];
        nearbyActionColorCode = (void *)self->_nearbyActionColorCode;
        if (v138 == nearbyActionColorCode) {
          goto LABEL_103;
        }
        goto LABEL_102;
      }
    }
    else
    {
    }
    BOOL v7 = 1;
    v178 = CUPrintNSDataHex();
    CUPrintNSDataHex();
    uint64_t v418 = v363 = v178;
    CUAppendF();
    id v179 = v10;

    v180 = v134;
    v165 = self->_nearbyActionAuthTagData;
    self->_nearbyActionAuthTagData = v180;
    id v10 = v179;
  }

  unsigned int v138 = [v4 nearbyActionColorCode];
  nearbyActionColorCode = (void *)self->_nearbyActionColorCode;
  if (v138 != nearbyActionColorCode)
  {
LABEL_102:
    unsigned __int8 v140 = v138;
    v363 = nearbyActionColorCode;
    uint64_t v418 = v138;
    CUAppendF();
    id v141 = v10;

    self->_nearbyActionColorCode = v140;
    BOOL v7 = 1;
    id v10 = v141;
  }
LABEL_103:
  v142 = objc_msgSend(v4, "nearbyActionExtraData", v363, v418);
  nearbyActionExtraData = self->_nearbyActionExtraData;
  v144 = v142;
  v145 = nearbyActionExtraData;
  if (v144 == v145)
  {

    v166 = v144;
LABEL_137:

    goto LABEL_138;
  }
  v146 = v145;
  if ((v144 == 0) == (v145 != 0))
  {

    goto LABEL_136;
  }
  char v147 = [(NSData *)v144 isEqual:v145];

  if ((v147 & 1) == 0)
  {
LABEL_136:
    v181 = CUPrintNSDataHex();
    CUPrintNSDataHex();
    v419 = v364 = v181;
    CUAppendF();
    v182 = v114;
    v183 = v51;
    id v184 = v10;

    v185 = v144;
    v166 = self->_nearbyActionExtraData;
    self->_nearbyActionExtraData = v185;
    id v10 = v184;
    id v51 = v183;
    v114 = v182;
    BOOL v7 = 1;
    goto LABEL_137;
  }
LABEL_138:
  unsigned int v186 = objc_msgSend(v4, "nearbyActionFlags", v364, v419);
  v465 = v134;
  v466 = v114;
  v464 = v144;
  if (v186 != self->_nearbyActionFlags)
  {
    v187 = CUPrintFlags32();
    CUPrintFlags32();
    v427 = v370 = v187;
    CUAppendF();
    id v188 = v10;

    self->_uint64_t nearbyActionFlags = v186;
    BOOL v7 = 1;
    id v10 = v188;
  }
  unsigned int v189 = objc_msgSend(v4, "nearbyActionType", v370, v427);
  unsigned int nearbyActionType = self->_nearbyActionType;
  if (v189 != nearbyActionType)
  {
    v371 = CBNearbyActionTypeToString(nearbyActionType);
    v428 = CBNearbyActionTypeToString(v189);
    CUAppendF();
    id v191 = v10;

    self->_unsigned int nearbyActionType = v189;
    BOOL v7 = 1;
    id v10 = v191;
  }
  v192 = objc_msgSend(v4, "nearbyActionTargetData", v371, v428);
  nearbyActionTargetData = self->_nearbyActionTargetData;
  v194 = v192;
  v195 = nearbyActionTargetData;
  if (v194 == v195)
  {

    v198 = v194;
LABEL_149:

    goto LABEL_150;
  }
  v196 = v195;
  if ((v194 == 0) == (v195 != 0))
  {

    goto LABEL_148;
  }
  char v197 = [(NSData *)v194 isEqual:v195];

  if ((v197 & 1) == 0)
  {
LABEL_148:
    BOOL v7 = 1;
    v199 = CUPrintNSDataHex();
    CUPrintNSDataHex();
    v429 = v372 = v199;
    CUAppendF();
    id v200 = v10;

    v201 = v194;
    v198 = self->_nearbyActionTargetData;
    self->_nearbyActionTargetData = v201;
    id v10 = v200;
    goto LABEL_149;
  }
LABEL_150:
  unsigned int v202 = objc_msgSend(v4, "nearbyActionV2Flags", v372, v429);
  v463 = v194;
  if (v202 != self->_nearbyActionV2Flags)
  {
    v203 = CUPrintFlags32();
    CUPrintFlags32();
    v430 = v373 = v203;
    CUAppendF();
    id v204 = v10;

    self->_uint64_t nearbyActionV2Flags = v202;
    BOOL v7 = 1;
    id v10 = v204;
  }
  v205 = objc_msgSend(v4, "nearbyActionV2TargetData", v373, v430);
  nearbyActionV2TargetData = self->_nearbyActionV2TargetData;
  v207 = v205;
  v208 = nearbyActionV2TargetData;
  if (v207 == v208)
  {

    v238 = v207;
  }
  else
  {
    v209 = v208;
    if ((v207 == 0) != (v208 != 0))
    {
      char v210 = [(NSData *)v207 isEqual:v208];

      if (v210)
      {
        unsigned int v211 = [v4 nearbyActionV2Type];
        unsigned int nearbyActionV2Type = self->_nearbyActionV2Type;
        if (v211 == nearbyActionV2Type) {
          goto LABEL_157;
        }
        goto LABEL_156;
      }
    }
    else
    {
    }
    BOOL v7 = 1;
    CUPrintNSDataHex();
    v240 = (char *)objc_claimAutoreleasedReturnValue();
    CUPrintNSDataHex();
    v431 = v374 = v240;
    CUAppendF();
    id v241 = v10;

    v242 = v207;
    v238 = self->_nearbyActionV2TargetData;
    self->_nearbyActionV2TargetData = v242;
    id v10 = v241;
  }

  unsigned int v211 = [v4 nearbyActionV2Type];
  unsigned int nearbyActionV2Type = self->_nearbyActionV2Type;
  if (v211 != nearbyActionV2Type)
  {
LABEL_156:
    v374 = CBNearbyActionTypeToString(nearbyActionV2Type);
    v431 = (void *)CBNearbyActionTypeToString(v211);
    CUAppendF();
    id v213 = v10;

    self->_unsigned int nearbyActionV2Type = v211;
    BOOL v7 = 1;
    id v10 = v213;
  }
LABEL_157:
  unsigned int v214 = objc_msgSend(v4, "nearbyInfoFlags", v374, v431);
  v462 = v207;
  if (v214 != self->_nearbyInfoFlags)
  {
    v215 = CUPrintFlags32();
    CUPrintFlags32();
    v432 = v375 = v215;
    CUAppendF();
    id v216 = v10;

    self->_uint64_t nearbyInfoFlags = v214;
    BOOL v7 = 1;
    id v10 = v216;
  }
  objc_msgSend(v4, "nearbyInfoStatusProgress", v375, v432);
  double v218 = v217;
  double nearbyInfoStatusProgress = self->_nearbyInfoStatusProgress;
  if (v218 != nearbyInfoStatusProgress)
  {
    double v376 = nearbyInfoStatusProgress * 100.0;
    double v433 = v218 * 100.0;
    CUAppendF();
    id v220 = v10;

    self->_double nearbyInfoStatusProgress = v218;
    BOOL v7 = 1;
    id v10 = v220;
  }
  unsigned int v221 = objc_msgSend(v4, "nearbyInfoStatusTime", *(void *)&v376, *(void *)&v433);
  LODWORD(v222) = self->_nearbyInfoStatusTime;
  if (v221 == v222)
  {
    unsigned int v223 = [v4 nearbyInfoStatusType];
    LODWORD(v224) = self->_nearbyInfoStatusType;
    if (v223 == v224) {
      goto LABEL_163;
    }
    goto LABEL_263;
  }
  unsigned __int8 v235 = v221;
  uint64_t v222 = (char)v222;
  if ((char)v222 > 0xE)
  {
    v236 = "?";
    if (v221 > 0xE) {
      goto LABEL_172;
    }
  }
  else
  {
    v236 = off_1E5E31E10[v222];
    if (v221 > 0xE)
    {
LABEL_172:
      v237 = "?";
      goto LABEL_262;
    }
  }
  v237 = off_1E5E31E10[(char)v221];
LABEL_262:
  v394 = v236;
  v452 = v237;
  CUAppendF();
  id v332 = v10;

  self->_nearbyInfoStatusTime = v235;
  BOOL v7 = 1;
  id v10 = v332;
  unsigned int v223 = objc_msgSend(v4, "nearbyInfoStatusType", v394, v452);
  LODWORD(v224) = self->_nearbyInfoStatusType;
  if (v223 == v224)
  {
LABEL_163:
    int v225 = [v4 nearbyInfoV2DecryptedFlags];
    if (v225 == self->_nearbyInfoV2DecryptedFlags) {
      goto LABEL_164;
    }
    goto LABEL_274;
  }
LABEL_263:
  unsigned __int8 v333 = v223;
  uint64_t v224 = (char)v224;
  if ((char)v224 > 0xD)
  {
    v334 = "?";
    if (v223 > 0xD) {
      goto LABEL_265;
    }
  }
  else
  {
    v334 = off_1E5E31E88[v224];
    if (v223 > 0xD)
    {
LABEL_265:
      v335 = "?";
      goto LABEL_273;
    }
  }
  v335 = off_1E5E31E88[(char)v223];
LABEL_273:
  v397 = v334;
  v455 = v335;
  CUAppendF();
  id v339 = v10;

  self->_nearbyInfoStatusType = v333;
  BOOL v7 = 1;
  id v10 = v339;
  int v225 = objc_msgSend(v4, "nearbyInfoV2DecryptedFlags", v397, v455);
  if (v225 == self->_nearbyInfoV2DecryptedFlags)
  {
LABEL_164:
    int v226 = [v4 nearbyInfoV2Flags];
    if (v226 == self->_nearbyInfoV2Flags) {
      goto LABEL_166;
    }
    goto LABEL_165;
  }
LABEL_274:
  v340 = CUPrintFlags32();
  v456 = CUPrintFlags32();
  CUAppendF();
  id v341 = v10;

  self->_nearbyInfoV2DecryptedFlags = v225;
  BOOL v7 = 1;
  id v10 = v341;
  int v226 = objc_msgSend(v4, "nearbyInfoV2Flags", v340, v456);
  if (v226 != self->_nearbyInfoV2Flags)
  {
LABEL_165:
    v227 = CUPrintFlags32();
    CUPrintFlags32();
    v434 = v377 = v227;
    CUAppendF();
    id v228 = v10;

    self->_nearbyInfoV2Flags = v226;
    BOOL v7 = 1;
    id v10 = v228;
  }
LABEL_166:
  v229 = objc_msgSend(v4, "nearbyInfoV2AuthIntegrityTagData", v377, v434);
  nearbyInfoV2AuthIntegrityTagData = self->_nearbyInfoV2AuthIntegrityTagData;
  v231 = v229;
  v232 = nearbyInfoV2AuthIntegrityTagData;
  if (v231 == v232)
  {

    v239 = v231;
LABEL_181:

    goto LABEL_182;
  }
  v233 = v232;
  if ((v231 == 0) == (v232 != 0))
  {

    goto LABEL_180;
  }
  char v234 = [(NSData *)v231 isEqual:v232];

  if ((v234 & 1) == 0)
  {
LABEL_180:
    BOOL v7 = 1;
    v243 = CUPrintNSDataHex();
    CUPrintNSDataHex();
    v435 = v378 = v243;
    CUAppendF();
    id v244 = v10;

    v245 = v231;
    v239 = self->_nearbyInfoV2AuthIntegrityTagData;
    self->_nearbyInfoV2AuthIntegrityTagData = v245;
    id v10 = v244;
    goto LABEL_181;
  }
LABEL_182:
  v246 = objc_msgSend(v4, "nearbyInfoV2AuthTagData", v378, v435);
  nearbyInfoV2AuthTagData = self->_nearbyInfoV2AuthTagData;
  v248 = v246;
  v249 = nearbyInfoV2AuthTagData;
  if (v248 == v249)
  {

    v274 = v248;
  }
  else
  {
    v250 = v249;
    if ((v248 == 0) != (v249 != 0))
    {
      char v251 = [(NSData *)v248 isEqual:v249];

      if (v251)
      {
        unsigned int v252 = [v4 nearbyInfoV2InvitationCounter];
        uint64_t nearbyInfoV2InvitationCounter = self->_nearbyInfoV2InvitationCounter;
        if (v252 == nearbyInfoV2InvitationCounter) {
          goto LABEL_186;
        }
        goto LABEL_211;
      }
    }
    else
    {
    }
    BOOL v7 = 1;
    v276 = CUPrintNSDataHex();
    CUPrintNSDataHex();
    v436 = v379 = v276;
    CUAppendF();
    id v277 = v10;

    v278 = v248;
    v274 = self->_nearbyInfoV2AuthTagData;
    self->_nearbyInfoV2AuthTagData = v278;
    id v10 = v277;
  }

  unsigned int v252 = [v4 nearbyInfoV2InvitationCounter];
  uint64_t nearbyInfoV2InvitationCounter = self->_nearbyInfoV2InvitationCounter;
  if (v252 == nearbyInfoV2InvitationCounter)
  {
LABEL_186:
    unsigned int v254 = objc_msgSend(v4, "nearbyInfoV2InvitationTypes", v379, v436);
    uint64_t nearbyInfoV2InvitationTypes = self->_nearbyInfoV2InvitationTypes;
    if (v254 == nearbyInfoV2InvitationTypes) {
      goto LABEL_187;
    }
    goto LABEL_212;
  }
LABEL_211:
  unsigned __int8 v279 = v252;
  uint64_t v383 = nearbyInfoV2InvitationCounter;
  uint64_t v440 = v252;
  CUAppendF();
  id v280 = v10;

  self->_uint64_t nearbyInfoV2InvitationCounter = v279;
  BOOL v7 = 1;
  id v10 = v280;
  unsigned int v254 = objc_msgSend(v4, "nearbyInfoV2InvitationTypes", v383, v440);
  uint64_t nearbyInfoV2InvitationTypes = self->_nearbyInfoV2InvitationTypes;
  if (v254 == nearbyInfoV2InvitationTypes)
  {
LABEL_187:
    unsigned int v256 = [v4 nearbyInfoV2InvitationRouteType];
    uint64_t nearbyInfoV2InvitationRouteType = self->_nearbyInfoV2InvitationRouteType;
    if (v256 == nearbyInfoV2InvitationRouteType) {
      goto LABEL_188;
    }
LABEL_213:
    unsigned __int8 v283 = v256;
    uint64_t v385 = nearbyInfoV2InvitationRouteType;
    uint64_t v442 = v256;
    CUAppendF();
    id v284 = v10;

    self->_uint64_t nearbyInfoV2InvitationRouteType = v283;
    BOOL v7 = 1;
    id v10 = v284;
    int v258 = objc_msgSend(v4, "nearbyActionNoWakeType", v385, v442);
    int nearbyActionNoWakeType = self->_nearbyActionNoWakeType;
    if (v258 == nearbyActionNoWakeType) {
      goto LABEL_200;
    }
    goto LABEL_189;
  }
LABEL_212:
  unsigned __int8 v281 = v254;
  uint64_t v384 = nearbyInfoV2InvitationTypes;
  uint64_t v441 = v254;
  CUAppendF();
  id v282 = v10;

  self->_uint64_t nearbyInfoV2InvitationTypes = v281;
  BOOL v7 = 1;
  id v10 = v282;
  unsigned int v256 = objc_msgSend(v4, "nearbyInfoV2InvitationRouteType", v384, v441);
  uint64_t nearbyInfoV2InvitationRouteType = self->_nearbyInfoV2InvitationRouteType;
  if (v256 != nearbyInfoV2InvitationRouteType) {
    goto LABEL_213;
  }
LABEL_188:
  int v258 = [v4 nearbyActionNoWakeType];
  int nearbyActionNoWakeType = self->_nearbyActionNoWakeType;
  if (v258 == nearbyActionNoWakeType) {
    goto LABEL_200;
  }
LABEL_189:
  unsigned __int8 v260 = v258;
  v261 = "?";
  if (nearbyActionNoWakeType == 1) {
    v262 = "PrecisionFinding";
  }
  else {
    v262 = "?";
  }
  if (nearbyActionNoWakeType) {
    v263 = v262;
  }
  else {
    v263 = "Unspecified";
  }
  if (v258 == 1) {
    v261 = "PrecisionFinding";
  }
  if (!v258) {
    v261 = "Unspecified";
  }
  v380 = v263;
  v437 = v261;
  CUAppendF();
  id v264 = v10;

  self->_int nearbyActionNoWakeType = v260;
  BOOL v7 = 1;
  id v10 = v264;
LABEL_200:
  int v265 = objc_msgSend(v4, "nearbyActionNWPrecisionFindingStatus", v380, v437);
  v460 = v248;
  v461 = v231;
  if (v265 != self->_nearbyActionNWPrecisionFindingStatus)
  {
    v266 = CUPrintFlags32();
    CUPrintFlags32();
    v438 = v381 = v266;
    CUAppendF();
    id v267 = v10;

    self->_nearbyActionNWPrecisionFindingStatus = v265;
    BOOL v7 = 1;
    id v10 = v267;
  }
  v268 = objc_msgSend(v4, "nearbyActionNoWakeAuthTagData", v381, v438);
  nearbyActionNoWakeAuthTagData = self->_nearbyActionNoWakeAuthTagData;
  v270 = v268;
  v271 = nearbyActionNoWakeAuthTagData;
  if (v270 == v271)
  {

    v275 = v270;
LABEL_217:

    goto LABEL_218;
  }
  v272 = v271;
  if ((v270 == 0) == (v271 != 0))
  {

    goto LABEL_216;
  }
  char v273 = [(NSData *)v270 isEqual:v271];

  if ((v273 & 1) == 0)
  {
LABEL_216:
    BOOL v7 = 1;
    v285 = CUPrintNSDataHex();
    CUPrintNSDataHex();
    v439 = v382 = v285;
    CUAppendF();
    id v286 = v10;

    v287 = v270;
    v275 = self->_nearbyActionNoWakeAuthTagData;
    self->_nearbyActionNoWakeAuthTagData = v287;
    id v10 = v286;
    goto LABEL_217;
  }
LABEL_218:
  v288 = objc_msgSend(v4, "nearbyActionNoWakeConfigData", v382, v439);
  nearbyActionNoWakeConfigData = self->_nearbyActionNoWakeConfigData;
  v290 = v288;
  v291 = nearbyActionNoWakeConfigData;
  if (v290 == v291)
  {

    v294 = v290;
LABEL_225:

    goto LABEL_226;
  }
  v292 = v291;
  if ((v290 == 0) == (v291 != 0))
  {

    goto LABEL_224;
  }
  char v293 = [(NSData *)v290 isEqual:v291];

  if ((v293 & 1) == 0)
  {
LABEL_224:
    BOOL v7 = 1;
    v295 = CUPrintNSDataHex();
    CUPrintNSDataHex();
    v443 = v386 = v295;
    CUAppendF();
    id v296 = v10;

    v297 = v290;
    v294 = self->_nearbyActionNoWakeConfigData;
    self->_nearbyActionNoWakeConfigData = v297;
    id v10 = v296;
    goto LABEL_225;
  }
LABEL_226:
  v458 = v290;
  v468 = v51;
  objc_msgSend(v4, "safetyAlertsAlertData", v386, v443);
  v298 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (v298 == self->_safetyAlertsAlertData)
  {
    char v299 = v7;
  }
  else
  {
    char v299 = 1;
    v300 = CUPrintNSDataHex();
    CUPrintNSDataHex();
    v444 = v387 = v300;
    CUAppendF();
    id v301 = v10;

    objc_storeStrong((id *)&self->_safetyAlertsAlertData, v298);
    id v10 = v301;
  }
  v459 = v270;
  objc_msgSend(v4, "safetyAlertsAlertID", v387, v444);
  v302 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (v302 != self->_safetyAlertsAlertID)
  {
    char v299 = 1;
    v303 = CUPrintNSDataHex();
    CUPrintNSDataHex();
    v445 = v388 = v303;
    CUAppendF();
    id v304 = v10;

    objc_storeStrong((id *)&self->_safetyAlertsAlertID, v302);
    id v10 = v304;
  }
  v457 = v298;
  objc_msgSend(v4, "safetyAlertsSignature", v388, v445);
  v305 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (v305 != self->_safetyAlertsSignature)
  {
    char v299 = 1;
    v306 = CUPrintNSDataHex();
    CUPrintNSDataHex();
    v446 = v389 = v306;
    CUAppendF();
    id v307 = v4;
    id v308 = v10;

    objc_storeStrong((id *)&self->_safetyAlertsSignature, v305);
    id v10 = v308;
    id v4 = v307;
  }
  unsigned int v309 = objc_msgSend(v4, "safetyAlertsVersion", v389, v446);
  if (v309 != self->_safetyAlertsVersion)
  {
    unsigned __int8 v310 = v309;
    uint64_t safetyAlertsVersion = self->_safetyAlertsVersion;
    uint64_t v447 = v309;
    CUAppendF();
    id v311 = v10;

    self->_uint64_t safetyAlertsVersion = v310;
    char v299 = 1;
    id v10 = v311;
  }
  v312 = objc_msgSend(v4, "watchSetupData", safetyAlertsVersion, v447);
  watchSetupData = self->_watchSetupData;
  v314 = v312;
  v315 = watchSetupData;
  if (v314 == v315)
  {

    v321 = v314;
    goto LABEL_245;
  }
  v316 = v315;
  if ((v314 == 0) == (v315 != 0))
  {

    goto LABEL_244;
  }
  char v317 = [(NSData *)v314 isEqual:v315];

  if ((v317 & 1) == 0)
  {
LABEL_244:
    char v299 = 1;
    v322 = CUPrintNSDataHex();
    v448 = CUPrintNSDataHex();
    CUAppendF();
    id v323 = v10;

    v324 = v314;
    v321 = self->_watchSetupData;
    self->_watchSetupData = v324;
    id v10 = v323;
LABEL_245:

    BOOL v318 = v299;
    v319 = v459;
    int var0 = self->_ucat->var0;
    if (v10) {
      goto LABEL_239;
    }
LABEL_246:
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize())) {
      goto LABEL_248;
    }
    goto LABEL_279;
  }
  BOOL v318 = v299;
  v319 = v459;
  int var0 = self->_ucat->var0;
  if (!v10) {
    goto LABEL_246;
  }
LABEL_239:
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
LABEL_248:
  }
    LogPrintF_safe();
LABEL_279:

  return v318;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = self;
  objc_sync_enter(v5);
  if (!v5->_activateCalled)
  {
    v5->_activateCalled = 1;
    uint64_t v6 = MEMORY[0x1AD111AA0](v4);
    id activateCompletion = v5->_activateCompletion;
    v5->_id activateCompletion = (id)v6;

    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__CBAdvertiser_activateWithCompletion___block_invoke;
    block[3] = &unk_1E5E31248;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);
}

uint64_t __39__CBAdvertiser_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  int v3 = self->_mockID;
  id v14 = v3;
  if (v3)
  {
    CBMockAddOrUpdateAdvertiser(v3, self);
    id v4 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v4) {
      v4[2](v4, 0);
    }
LABEL_26:

    goto LABEL_27;
  }
  if (self->_bluetoothStateChangedHandler) {
    self->_internalFlags |= 1u;
  }
  if (self->_xpcListenerEndpoint) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = gCBDaemonServer == 0;
  }
  BOOL v7 = !v6;
  self->_direct = v7;
  if (self->_invalidateCalled)
  {
    NSErrorF();
    id v4 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      int v13 = CUPrintNSError();
      LogPrintF_safe();
    }
    uint64_t v9 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_activateCompletion);
    id v10 = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v9)
    {
      v9[2](v9, v4);
    }
    else
    {
      uint64_t v11 = MEMORY[0x1AD111AA0](self->_errorHandler);
      id v12 = (void *)v11;
      if (v11) {
        (*(void (**)(uint64_t, void))(v11 + 16))(v11, v4);
      }
    }
    goto LABEL_26;
  }
  if (v7) {
    [(CBAdvertiser *)self _activateDirectStart];
  }
  else {
    [(CBAdvertiser *)self _activateXPCStart:0];
  }
LABEL_27:
}

- (void)_activateDirectStart
{
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t clientID = self->_clientID;
    LogPrintF_safe();
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__CBAdvertiser__activateDirectStart__block_invoke;
  v5[3] = &unk_1E5E315E0;
  v5[4] = self;
  objc_msgSend((id)gCBDaemonServer, "activateCBAdvertiser:completion:", self, v5, clientID);
}

void __36__CBAdvertiser__activateDirectStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(NSObject **)(v4 + 184);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__CBAdvertiser__activateDirectStart__block_invoke_2;
  v7[3] = &unk_1E5E31068;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __36__CBAdvertiser__activateDirectStart__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = MEMORY[0x1AD111AA0](*(void *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  int v4 = **(_DWORD **)(*(void *)(a1 + 32) + 32);
  if (*(void *)(a1 + 40))
  {
    if (v4 <= 90 && (v4 != -1 || _LogCategory_Initialize()))
    {
      id v8 = CUPrintNSError();
      LogPrintF_safe();
    }
    if (v9)
    {
      (*(void (**)(uint64_t, void))(v9 + 16))(v9, *(void *)(a1 + 40));
    }
    else
    {
      uint64_t v5 = MEMORY[0x1AD111AA0](*(void *)(*(void *)(a1 + 32) + 192));
      id v6 = (void *)v5;
      if (v5) {
        (*(void (**)(uint64_t, void))(v5 + 16))(v5, *(void *)(a1 + 40));
      }
    }
    goto LABEL_17;
  }
  if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  BOOL v7 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
LABEL_17:
    BOOL v7 = (void *)v9;
  }
}

- (void)_activateXPCStart:(BOOL)a3
{
  int var0 = self->_ucat->var0;
  if (a3)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
LABEL_7:
    }
      LogPrintF_safe();
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  [(CBAdvertiser *)self encodeWithXPCObject:v5];
  xpc_dictionary_set_string(v5, "mTyp", "AdvA");
  id v6 = [(CBAdvertiser *)self _ensureXPCStarted];
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __34__CBAdvertiser__activateXPCStart___block_invoke;
  handler[3] = &unk_1E5E31608;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v6, v5, dispatchQueue, handler);
}

uint64_t __34__CBAdvertiser__activateXPCStart___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _activateXPCCompleted:a2];
}

- (void)_activateXPCCompleted:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__CBAdvertiser__activateXPCCompleted___block_invoke;
  v11[3] = &unk_1E5E31388;
  v11[4] = self;
  v11[5] = &v12;
  xpc_object_t v5 = (void (**)(void))MEMORY[0x1AD111AA0](v11);
  uint64_t v6 = CUXPCDecodeNSErrorIfNeeded();
  BOOL v7 = (void *)v13[5];
  v13[5] = v6;

  if (!v13[5])
  {
    CUXPCDecodeNSData();
    CUXPCDecodeNSData();
    CUXPCDecodeNSData();
    self->_bluetoothState = xpc_dictionary_get_int64(v4, "pwrS");
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    uint64_t v9 = (void (**)(void, void))MEMORY[0x1AD111AA0](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v9) {
      v9[2](v9, 0);
    }
  }
  v5[2](v5);

  _Block_object_dispose(&v12, 8);
}

void __38__CBAdvertiser__activateXPCCompleted___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = **(_DWORD **)(v2 + 32);
    if (v3 <= 90)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v2 = *(void *)(a1 + 32), v4))
      {
        uint64_t v9 = CUPrintNSError();
        LogPrintF_safe();

        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
    id v10 = (void (**)(id, void))MEMORY[0x1AD111AA0](*(void *)(v2 + 16));
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = 0;

    if (v10)
    {
      v10[2](v10, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    }
    else
    {
      uint64_t v7 = MEMORY[0x1AD111AA0](*(void *)(*(void *)(a1 + 32) + 192));
      id v8 = (void *)v7;
      if (v7) {
        (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
      }
    }
  }
}

- (id)_ensureXPCStarted
{
  p_xpcCnx = &self->_xpcCnx;
  int v4 = self->_xpcCnx;
  if (!v4)
  {
    uint64_t v5 = self->_xpcListenerEndpoint;
    uint64_t v6 = v5;
    if (v5)
    {
      mach_service = xpc_connection_create_from_endpoint(v5);
      xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)self->_dispatchQueue);
    }
    else
    {
      mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", (dispatch_queue_t)self->_dispatchQueue, 0);
    }
    objc_storeStrong((id *)p_xpcCnx, mach_service);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __33__CBAdvertiser__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E5E31630;
    v9[4] = self;
    int v4 = mach_service;
    id v10 = v4;
    xpc_connection_set_event_handler(v4, v9);
    xpc_connection_activate(v4);
  }

  return v4;
}

void *__33__CBAdvertiser__ensureXPCStarted__block_invoke(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a1 + 32);
  if (result[5] == *(void *)(a1 + 40)) {
    return (void *)[result xpcReceivedMessage:a2];
  }
  return result;
}

- (void)_interrupted
{
  if (!self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    uint64_t v4 = MEMORY[0x1AD111AA0](self->_interruptionHandler);
    uint64_t v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t))(v4 + 16))(v4);
    }

    self->_bluetoothState = 1;
    uint64_t v6 = MEMORY[0x1AD111AA0](self->_bluetoothStateChangedHandler);
    uint64_t v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
    }

    [(CBAdvertiser *)self _activateXPCStart:1];
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__CBAdvertiser_invalidate__block_invoke;
  block[3] = &unk_1E5E31248;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __26__CBAdvertiser_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 26))
  {
    *(unsigned char *)(v1 + 26) = 1;
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = **(_DWORD **)(v3 + 32);
    if (v4 <= 30)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v3 = *(void *)(a1 + 32), v5))
      {
        uint64_t v9 = v3;
        LogPrintF_safe();
        uint64_t v3 = *(void *)(a1 + 32);
      }
    }
    id v6 = *(id *)(v3 + 256);
    id v10 = v6;
    if (v6) {
      CBMockRemoveAdvertiser(v6, *(void **)(a1 + 32));
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v7 + 25))
    {
      [(id)v7 _invalidateDirect];
      uint64_t v7 = *(void *)(a1 + 32);
    }
    id v8 = *(_xpc_connection_s **)(v7 + 40);
    if (v8) {
      xpc_connection_cancel(v8);
    }
    objc_msgSend(*(id *)(a1 + 32), "_invalidated", v9);
  }
}

- (void)_invalidateDirect
{
}

void __33__CBAdvertiser__invalidateDirect__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 184);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__CBAdvertiser__invalidateDirect__block_invoke_2;
  block[3] = &unk_1E5E31248;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __33__CBAdvertiser__invalidateDirect__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 25) = 0;
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_direct && !self->_xpcCnx)
  {
    self->_invalidateCalled = 1;
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2](invalidationHandler, a2);
    }
    id advertisingAddressChangedHandler = self->_advertisingAddressChangedHandler;
    self->_id advertisingAddressChangedHandler = 0;

    id bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
    self->_id bluetoothStateChangedHandler = 0;

    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id v8 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
}

- (void)_updateIfNeededWithBlock:(id)a3
{
  int v4 = (uint64_t (**)(void))a3;
  int v5 = self;
  objc_sync_enter(v5);
  if ((v4[2](v4) & 1) != 0 && v5->_activateCalled && !v5->_changesPending)
  {
    v5->_changesPending = 1;
    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__CBAdvertiser__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_1E5E31248;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);
}

uint64_t __41__CBAdvertiser__updateIfNeededWithBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _update];
}

- (void)_update
{
  if (!self->_invalidateCalled)
  {
    uint64_t v2 = self;
    objc_sync_enter(v2);
    BOOL changesPending = v2->_changesPending;
    v2->_BOOL changesPending = 0;
    objc_sync_exit(v2);

    int var0 = v2->_ucat->var0;
    if (changesPending)
    {
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF_safe();
      }
      xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
      [(CBAdvertiser *)v2 encodeWithXPCObject:xdict];
      xpc_dictionary_set_string(xdict, "mTyp", "AdvU");
      int v5 = [(CBAdvertiser *)v2 _ensureXPCStarted];
      xpc_connection_send_message(v5, xdict);
    }
    else if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
}

- (void)xpcReceivedMessage:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v18 = v4;
  if (var0 <= 9)
  {
    if (var0 != -1 || (int v6 = _LogCategory_Initialize(), v4 = v18, v6))
    {
      id v16 = CUPrintXPC();
      LogPrintF_safe();

      id v4 = v18;
    }
  }
  if (MEMORY[0x1AD1120E0](v4) == MEMORY[0x1E4F14590])
  {
    [(CBAdvertiser *)self _xpcReceivedMessage:v18];
    goto LABEL_26;
  }
  if (v18 == (id)MEMORY[0x1E4F14520])
  {
    [(CBAdvertiser *)self _interrupted];
    goto LABEL_26;
  }
  if (v18 != (id)MEMORY[0x1E4F14528])
  {
    uint64_t v7 = CUXPCDecodeNSErrorIfNeeded();
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;

      int v10 = self->_ucat->var0;
      if (v10 > 90) {
        goto LABEL_21;
      }
    }
    else
    {
      NSErrorF();
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      int v10 = self->_ucat->var0;
      if (v10 > 90)
      {
LABEL_21:
        uint64_t v13 = MEMORY[0x1AD111AA0](self->_errorHandler);
        uint64_t v14 = (void *)v13;
        if (v13) {
          (*(void (**)(uint64_t, id))(v13 + 16))(v13, v9);
        }

        goto LABEL_26;
      }
    }
    if (v10 != -1 || _LogCategory_Initialize())
    {
      uint64_t v12 = CUPrintNSError();
      id v17 = CUPrintXPC();
      LogPrintF_safe();
    }
    goto LABEL_21;
  }
  if (!self->_invalidateCalled)
  {
    int v11 = self->_ucat->var0;
    if (v11 <= 90 && (v11 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
  }
  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0;

  [(CBAdvertiser *)self _invalidated];
LABEL_26:
}

- (void)_xpcReceivedMessage:(id)a3
{
  id v9 = a3;
  string = xpc_dictionary_get_string(v9, "mTyp");
  if (!string)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  int v5 = string;
  if (!strcmp(string, "AdAC"))
  {
    [(CBAdvertiser *)self _xpcReceivedAdvertisingAddressChanged:v9];
    id v8 = v9;
  }
  else
  {
    if (strcmp(v5, "PwrC"))
    {
      int v6 = self->_ucat->var0;
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize())) {
LABEL_9:
      }
        LogPrintF_safe();
LABEL_10:
      id v8 = v9;
      goto LABEL_12;
    }
    [(CBAdvertiser *)self _xpcReceivedPowerStateChanged:v9];
    id v8 = v9;
  }
LABEL_12:
}

- (void)_xpcReceivedAdvertisingAddressChanged:(id)a3
{
  id v4 = a3;
  CUXPCDecodeNSData();
  CUXPCDecodeNSData();
  CUXPCDecodeNSData();
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  uint64_t v6 = MEMORY[0x1AD111AA0](self->_advertisingAddressChangedHandler);
  uint64_t v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
}

- (void)_xpcReceivedPowerStateChanged:(id)a3
{
  xpc_object_t xdict = a3;
  if (MEMORY[0x1AD1120E0]() == MEMORY[0x1E4F14590])
  {
    self->_bluetoothState = xpc_dictionary_get_int64(xdict, "pwrS");
    uint64_t v4 = MEMORY[0x1AD111AA0](self->_bluetoothStateChangedHandler);
    int v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t))(v4 + 16))(v4);
    }

    goto LABEL_5;
  }
  int var0 = self->_ucat->var0;
  if (var0 > 90 || var0 == -1 && !_LogCategory_Initialize())
  {
LABEL_5:
    uint64_t v6 = xdict;
    goto LABEL_7;
  }
  LogPrintF_safe();
  uint64_t v6 = xdict;

LABEL_7:
}

- (id)advertisingAddressChangedHandler
{
  return self->_advertisingAddressChangedHandler;
}

- (void)setAdvertisingAddressChangedHandler:(id)a3
{
}

- (NSData)advertisingAddressDataConnectable
{
  return self->_advertisingAddressDataConnectable;
}

- (void)setAdvertisingAddressDataConnectable:(id)a3
{
}

- (NSData)advertisingAddressDataNonConnectable
{
  return self->_advertisingAddressDataNonConnectable;
}

- (void)setAdvertisingAddressDataNonConnectable:(id)a3
{
}

- (NSData)advertisingAddressDataNonConnectableSecondary
{
  return self->_advertisingAddressDataNonConnectableSecondary;
}

- (void)setAdvertisingAddressDataNonConnectableSecondary:(id)a3
{
}

- (NSData)airplaySourceAuthTagData
{
  return self->_airplaySourceAuthTagData;
}

- (void)setAirplaySourceAuthTagData:(id)a3
{
}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (NSData)nearbyInfoV2AuthTagData
{
  return self->_nearbyInfoV2AuthTagData;
}

- (void)setNearbyInfoV2AuthTagData:(id)a3
{
}

- (CBDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
}

- (unsigned)useCase
{
  return self->_useCase;
}

- (NSArray)useCaseClientIDs
{
  return self->_useCaseClientIDs;
}

- (int)advertiseRate
{
  return self->_advertiseRate;
}

- (void)setAdvertiseRate:(int)a3
{
  self->_int advertiseRate = a3;
}

- (CBDevice)mockDevice
{
  return self->_mockDevice;
}

- (void)setMockDevice:(id)a3
{
}

- (NSString)mockID
{
  return self->_mockID;
}

- (void)setMockID:(id)a3
{
}

- (unsigned)airdropFlags
{
  return self->_airdropFlags;
}

- (NSData)airdropTempAuthTagData
{
  return self->_airdropTempAuthTagData;
}

- (unsigned)airdropModel
{
  return self->_airdropModel;
}

- (void)setAirdropModel:(unsigned __int8)a3
{
  self->_uint64_t airdropModel = a3;
}

- (unsigned)airdropVersion
{
  return self->_airdropVersion;
}

- (unsigned)airdropHash1
{
  return self->_airdropHash1;
}

- (void)setAirdropHash1:(unsigned __int16)a3
{
  self->_uint64_t airdropHash1 = a3;
}

- (unsigned)airdropHash2
{
  return self->_airdropHash2;
}

- (void)setAirdropHash2:(unsigned __int16)a3
{
  self->_uint64_t airdropHash2 = a3;
}

- (unsigned)airdropHash3
{
  return self->_airdropHash3;
}

- (void)setAirdropHash3:(unsigned __int16)a3
{
  self->_uint64_t airdropHash3 = a3;
}

- (unsigned)airdropHash4
{
  return self->_airdropHash4;
}

- (void)setAirdropHash4:(unsigned __int16)a3
{
  self->_uint64_t airdropHash4 = a3;
}

- (unsigned)airdropConfigData
{
  return self->_airdropConfigData;
}

- (NSData)airplaySourceUWBConfigData
{
  return self->_airplaySourceUWBConfigData;
}

- (unsigned)airplayTargetConfigSeed
{
  return self->_airplayTargetConfigSeed;
}

- (unsigned)airplayTargetFlags
{
  return self->_airplayTargetFlags;
}

- (unsigned)airplayTargetIPv4
{
  return self->_airplayTargetIPv4;
}

- (unsigned)airplayTargetPort
{
  return self->_airplayTargetPort;
}

- (unsigned)dsActionFlags
{
  return self->_dsActionFlags;
}

- (char)dsActionMeasuredPower
{
  return self->_dsActionMeasuredPower;
}

- (unsigned)dsActionTieBreaker
{
  return self->_dsActionTieBreaker;
}

- (unsigned)dsInfoVehicleConfidence
{
  return self->_dsInfoVehicleConfidence;
}

- (unsigned)dsInfoVehicleState
{
  return self->_dsInfoVehicleState;
}

- (BOOL)enableEPAForLEAdvertisement
{
  return self->_enableEPAForLEAdvertisement;
}

- (void)setEnableEPAForLEAdvertisement:(BOOL)a3
{
  self->_BOOL enableEPAForLEAdvertisement = a3;
}

- (NSData)fidoPayloadData
{
  return self->_fidoPayloadData;
}

- (unsigned)heySiriConfidence
{
  return self->_heySiriConfidence;
}

- (unsigned)heySiriDeviceClass
{
  return self->_heySiriDeviceClass;
}

- (unsigned)heySiriPerceptualHash
{
  return self->_heySiriPerceptualHash;
}

- (unsigned)heySiriProductType
{
  return self->_heySiriProductType;
}

- (unsigned)heySiriRandom
{
  return self->_heySiriRandom;
}

- (unsigned)heySiriSNR
{
  return self->_heySiriSNR;
}

- (NSData)nearbyActionAuthTagData
{
  return self->_nearbyActionAuthTagData;
}

- (void)setNearbyActionAuthTagData:(id)a3
{
}

- (unsigned)nearbyActionColorCode
{
  return self->_nearbyActionColorCode;
}

- (NSData)nearbyActionExtraData
{
  return self->_nearbyActionExtraData;
}

- (unsigned)nearbyActionFlags
{
  return self->_nearbyActionFlags;
}

- (void)setNearbyActionFlags:(unsigned int)a3
{
  self->_uint64_t nearbyActionFlags = a3;
}

- (unsigned)nearbyActionType
{
  return self->_nearbyActionType;
}

- (void)setNearbyActionType:(unsigned __int8)a3
{
  self->_unsigned int nearbyActionType = a3;
}

- (NSData)nearbyActionTargetData
{
  return self->_nearbyActionTargetData;
}

- (unsigned)nearbyActionV2Flags
{
  return self->_nearbyActionV2Flags;
}

- (void)setNearbyActionV2Flags:(unsigned int)a3
{
  self->_uint64_t nearbyActionV2Flags = a3;
}

- (NSData)nearbyActionV2TargetData
{
  return self->_nearbyActionV2TargetData;
}

- (void)setNearbyActionV2TargetData:(id)a3
{
}

- (unsigned)nearbyActionV2Type
{
  return self->_nearbyActionV2Type;
}

- (void)setNearbyActionV2Type:(unsigned __int8)a3
{
  self->_unsigned int nearbyActionV2Type = a3;
}

- (unsigned)nearbyInfoFlags
{
  return self->_nearbyInfoFlags;
}

- (double)nearbyInfoStatusProgress
{
  return self->_nearbyInfoStatusProgress;
}

- (unsigned)nearbyInfoStatusTime
{
  return self->_nearbyInfoStatusTime;
}

- (unsigned)nearbyInfoStatusType
{
  return self->_nearbyInfoStatusType;
}

- (unsigned)nearbyInfoV2InvitationCounter
{
  return self->_nearbyInfoV2InvitationCounter;
}

- (unsigned)nearbyInfoV2InvitationTypes
{
  return self->_nearbyInfoV2InvitationTypes;
}

- (unsigned)nearbyInfoV2InvitationRouteType
{
  return self->_nearbyInfoV2InvitationRouteType;
}

- (void)setNearbyInfoV2InvitationRouteType:(unsigned __int8)a3
{
  self->_uint64_t nearbyInfoV2InvitationRouteType = a3;
}

- (NSData)nearbyInfoV2TempAuthTagData
{
  return self->_nearbyInfoV2TempAuthTagData;
}

- (void)setNearbyInfoV2TempAuthTagData:(id)a3
{
}

- (unsigned)nearbyActionNoWakeType
{
  return self->_nearbyActionNoWakeType;
}

- (unsigned)nearbyActionNWPrecisionFindingStatus
{
  return self->_nearbyActionNWPrecisionFindingStatus;
}

- (NSData)nearbyActionNoWakeAuthTagData
{
  return self->_nearbyActionNoWakeAuthTagData;
}

- (NSData)nearbyActionNoWakeConfigData
{
  return self->_nearbyActionNoWakeConfigData;
}

- (NSData)safetyAlertsAlertData
{
  return self->_safetyAlertsAlertData;
}

- (NSData)safetyAlertsAlertID
{
  return self->_safetyAlertsAlertID;
}

- (unsigned)safetyAlertsAlertIndex
{
  return self->_safetyAlertsAlertIndex;
}

- (void)setSafetyAlertsAlertIndex:(unsigned __int8)a3
{
  self->_safetyAlertsAlertIndex = a3;
}

- (NSData)safetyAlertsSignature
{
  return self->_safetyAlertsSignature;
}

- (unsigned)safetyAlertsVersion
{
  return self->_safetyAlertsVersion;
}

- (NSData)watchSetupData
{
  return self->_watchSetupData;
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_uint64_t clientID = a3;
}

- (unsigned)internalFlags
{
  return self->_internalFlags;
}

- (void)setInternalFlags:(unsigned int)a3
{
  self->_uint64_t internalFlags = a3;
}

- (NSData)nearbyInfoV2AuthIntegrityTagData
{
  return self->_nearbyInfoV2AuthIntegrityTagData;
}

- (void)setNearbyInfoV2AuthIntegrityTagData:(id)a3
{
}

- (NSData)nearbyInfoV2RapportIRKData
{
  return self->_nearbyInfoV2RapportIRKData;
}

- (void)setNearbyInfoV2RapportIRKData:(id)a3
{
}

- (OS_xpc_object)xpcListenerEndpoint
{
  return self->_xpcListenerEndpoint;
}

- (void)setXpcListenerEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_nearbyInfoV2RapportIRKData, 0);
  objc_storeStrong((id *)&self->_nearbyInfoV2AuthIntegrityTagData, 0);
  objc_storeStrong((id *)&self->_watchSetupData, 0);
  objc_storeStrong((id *)&self->_safetyAlertsSignature, 0);
  objc_storeStrong((id *)&self->_safetyAlertsAlertID, 0);
  objc_storeStrong((id *)&self->_safetyAlertsAlertData, 0);
  objc_storeStrong((id *)&self->_nearbyActionNoWakeConfigData, 0);
  objc_storeStrong((id *)&self->_nearbyActionNoWakeAuthTagData, 0);
  objc_storeStrong((id *)&self->_nearbyInfoV2TempAuthTagData, 0);
  objc_storeStrong((id *)&self->_nearbyActionV2TargetData, 0);
  objc_storeStrong((id *)&self->_nearbyActionTargetData, 0);
  objc_storeStrong((id *)&self->_nearbyActionExtraData, 0);
  objc_storeStrong((id *)&self->_nearbyActionAuthTagData, 0);
  objc_storeStrong((id *)&self->_fidoPayloadData, 0);
  objc_storeStrong((id *)&self->_airplaySourceUWBConfigData, 0);
  objc_storeStrong((id *)&self->_airdropTempAuthTagData, 0);
  objc_storeStrong((id *)&self->_mockID, 0);
  objc_storeStrong((id *)&self->_mockDevice, 0);
  objc_storeStrong((id *)&self->_useCaseClientIDs, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_nearbyInfoV2AuthTagData, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_airplaySourceAuthTagData, 0);
  objc_storeStrong((id *)&self->_advertisingAddressDataNonConnectableSecondary, 0);
  objc_storeStrong((id *)&self->_advertisingAddressDataNonConnectable, 0);
  objc_storeStrong((id *)&self->_advertisingAddressDataConnectable, 0);
  objc_storeStrong(&self->_advertisingAddressChangedHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);

  objc_storeStrong(&self->_activateCompletion, 0);
}

@end