@interface UARPUploaderAsset
- (BOOL)internalSolicit;
- (BOOL)invalidHwRevision;
- (UARPAsset)asset;
- (UARPAssetVersion)assetVersion;
- (UARPDynamicAssetPersonalization)pendingTssRequest;
- (UARPSuperBinaryAsset)uarpSuperBinary;
- (UARPUploaderAsset)initWithUARPAsset:(id)a3 remoteEndpoint:(id)a4 callbacks:(uarpPlatformAssetCallbacks *)a5 internalSolicit:(BOOL)a6;
- (UARPUploaderEndpoint)remoteEndpoint;
- (id)description;
- (uarpPlatformAsset)uarpAsset;
- (uarpPlatformAssetCallbacks)uarpCallbacks;
- (unint64_t)assetLength;
- (unint64_t)formatVersion;
- (unint64_t)minimumHostBatteryLevel;
- (unint64_t)numPayloads;
- (unint64_t)selectedPayload;
- (unint64_t)triggerHostBatteryLevel;
- (void)processHostTLVs;
- (void)setAssetLength:(unint64_t)a3;
- (void)setAssetVersion:(id)a3;
- (void)setFormatVersion:(unint64_t)a3;
- (void)setNumPayloads:(unint64_t)a3;
- (void)setPendingTssRequest:(id)a3;
- (void)setSelectedPayload:(unint64_t)a3;
- (void)setUarpPlatformAsset:(uarpPlatformAsset *)a3;
- (void)setUarpSuperBinary:(id)a3;
@end

@implementation UARPUploaderAsset

- (UARPUploaderAsset)initWithUARPAsset:(id)a3 remoteEndpoint:(id)a4 callbacks:(uarpPlatformAssetCallbacks *)a5 internalSolicit:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v28.receiver = self;
  v28.super_class = (Class)UARPUploaderAsset;
  v13 = [(UARPUploaderAsset *)&v28 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_asset, a3);
    objc_storeWeak((id *)&v14->_remoteEndpoint, v12);
    long long v15 = *(_OWORD *)&a5->fAssetMetaDataComplete;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetReady = *(_OWORD *)&a5->fAssetReady;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetMetaDataComplete = v15;
    long long v16 = *(_OWORD *)&a5->fPayloadReady;
    long long v17 = *(_OWORD *)&a5->fPayloadMetaDataComplete;
    long long v18 = *(_OWORD *)&a5->fPayloadDataComplete2;
    *(_OWORD *)&v14->_uarpCallbacks.fPayloadData = *(_OWORD *)&a5->fPayloadData;
    *(_OWORD *)&v14->_uarpCallbacks.fPayloadDataComplete2 = v18;
    *(_OWORD *)&v14->_uarpCallbacks.fPayloadReady = v16;
    *(_OWORD *)&v14->_uarpCallbacks.fPayloadMetaDataComplete = v17;
    long long v19 = *(_OWORD *)&a5->fAssetSetBytesAtOffset2;
    long long v20 = *(_OWORD *)&a5->fAssetRescindedAck;
    long long v21 = *(_OWORD *)&a5->fAssetProcessingNotification2;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetOrphaned = *(_OWORD *)&a5->fAssetOrphaned;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetProcessingNotification2 = v21;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetSetBytesAtOffset2 = v19;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetRescindedAck = v20;
    long long v22 = *(_OWORD *)&a5->fAssetPreProcessingNotification;
    long long v23 = *(_OWORD *)&a5->fAssetAllHeadersAndMetaDataComplete;
    long long v24 = *(_OWORD *)&a5->fAssetReleased;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetGetBytesAtOffset = *(_OWORD *)&a5->fAssetGetBytesAtOffset;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetReleased = v24;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetPreProcessingNotification = v22;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetAllHeadersAndMetaDataComplete = v23;
    v14->_internalSolicit = a6;
    os_log_t v25 = os_log_create("com.apple.accessoryupdater.uarp", "uploader");
    log = v14->_log;
    v14->_log = (OS_os_log *)v25;
  }
  return v14;
}

- (void)setUarpPlatformAsset:(uarpPlatformAsset *)a3
{
  self->_uarpAsset = a3;
}

- (uarpPlatformAssetCallbacks)uarpCallbacks
{
  return &self->_uarpCallbacks;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(UARPAsset *)self->_asset id];
  v7 = [v6 tag];
  v8 = [v3 stringWithFormat:@"<%@: %@>", v5, v7];

  return v8;
}

- (void)processHostTLVs
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v3 = [UARPSuperBinaryAsset alloc];
  v4 = [(UARPUploaderAsset *)self asset];
  v5 = [v4 id];
  v6 = [v5 localURL];
  v7 = [(UARPSuperBinaryAsset *)v3 initWithURL:v6];

  id v49 = 0;
  LODWORD(v5) = [(UARPSuperBinaryAsset *)v7 expandHeadersAndTLVs:&v49];
  id v8 = v49;
  if (v5)
  {
    id v42 = v8;
    v9 = [(UARPSuperBinaryAsset *)v7 tlvs];
    v10 = +[UARPSuperBinaryAssetTLV findTLVWithType:3436347652 tlvs:v9];

    v41 = v10;
    v40 = [v10 valueAsNumber];
    if ([v40 BOOLValue])
    {
      id v11 = [(UARPUploaderAsset *)self asset];
      id v12 = [v11 id];
      [v12 setIsUrgentUpdate:1];
    }
    v13 = [(UARPSuperBinaryAsset *)v7 tlvs];
    v14 = +[UARPSuperBinaryAssetTLV findTLVWithType:3291140096 tlvs:v13];

    v39 = v14;
    long long v15 = [v14 valueAsNumber];
    long long v16 = v15;
    if (v15) {
      self->_minimumHostBatteryLevel = [v15 unsignedIntegerValue];
    }
    v38 = v16;
    long long v17 = [(UARPSuperBinaryAsset *)v7 tlvs];
    long long v18 = +[UARPSuperBinaryAssetTLV findTLVWithType:3291140105 tlvs:v17];

    v37 = v18;
    long long v19 = [v18 valueAsNumber];
    long long v20 = v19;
    if (v19) {
      self->_triggerHostBatteryLevel = [v19 unsignedIntegerValue];
    }
    v36 = v20;
    v43 = v7;
    long long v21 = [(UARPSuperBinaryAsset *)v7 tlvs];
    long long v22 = +[UARPSuperBinaryAssetTLV findTLVsWithType:3291140106 tlvs:v21];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v22;
    uint64_t v23 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v46;
      p_remoteEndpoint = &self->_remoteEndpoint;
      v35 = self;
      while (2)
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v46 != v25) {
            objc_enumerationMutation(obj);
          }
          objc_super v28 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          id WeakRetained = objc_loadWeakRetained((id *)p_remoteEndpoint);
          v30 = [WeakRetained accessory];
          v31 = [v30 getID];
          v32 = [v31 hwRevision];
          v33 = [v28 valueAsString];
          int v34 = [v32 isEqualToString:v33];

          if (v34)
          {
            v35->_invalidHwRevision = 1;
            goto LABEL_18;
          }
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    id v8 = v42;
    v7 = v43;
  }
}

- (unint64_t)numPayloads
{
  return self->_numPayloads;
}

- (void)setNumPayloads:(unint64_t)a3
{
  self->_numPayloads = a3;
}

- (unint64_t)selectedPayload
{
  return self->_selectedPayload;
}

- (void)setSelectedPayload:(unint64_t)a3
{
  self->_selectedPayload = a3;
}

- (unint64_t)formatVersion
{
  return self->_formatVersion;
}

- (void)setFormatVersion:(unint64_t)a3
{
  self->_formatVersion = a3;
}

- (unint64_t)assetLength
{
  return self->_assetLength;
}

- (void)setAssetLength:(unint64_t)a3
{
  self->_assetLength = a3;
}

- (UARPAssetVersion)assetVersion
{
  return (UARPAssetVersion *)objc_getProperty(self, a2, 280, 1);
}

- (void)setAssetVersion:(id)a3
{
}

- (UARPSuperBinaryAsset)uarpSuperBinary
{
  return (UARPSuperBinaryAsset *)objc_getProperty(self, a2, 288, 1);
}

- (void)setUarpSuperBinary:(id)a3
{
}

- (UARPAsset)asset
{
  return (UARPAsset *)objc_getProperty(self, a2, 296, 1);
}

- (uarpPlatformAsset)uarpAsset
{
  return self->_uarpAsset;
}

- (UARPUploaderEndpoint)remoteEndpoint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteEndpoint);
  return (UARPUploaderEndpoint *)WeakRetained;
}

- (BOOL)internalSolicit
{
  return self->_internalSolicit;
}

- (BOOL)invalidHwRevision
{
  return self->_invalidHwRevision;
}

- (unint64_t)minimumHostBatteryLevel
{
  return self->_minimumHostBatteryLevel;
}

- (unint64_t)triggerHostBatteryLevel
{
  return self->_triggerHostBatteryLevel;
}

- (UARPDynamicAssetPersonalization)pendingTssRequest
{
  return (UARPDynamicAssetPersonalization *)objc_getProperty(self, a2, 336, 1);
}

- (void)setPendingTssRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTssRequest, 0);
  objc_destroyWeak((id *)&self->_remoteEndpoint);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_uarpSuperBinary, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end