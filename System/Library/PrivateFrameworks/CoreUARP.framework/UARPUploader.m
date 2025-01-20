@interface UARPUploader
- (BOOL)accessoryReachable:(id)a3 error:(id *)a4;
- (BOOL)accessoryUnreachable:(id)a3 error:(id *)a4;
- (BOOL)addAccessory:(id)a3 error:(id *)a4;
- (BOOL)applyStagedAssetsForAccessory:(id)a3 error:(id *)a4;
- (BOOL)cancelAssetStagingForAccessory:(id)a3 asset:(id)a4;
- (BOOL)genericNotification:(id)a3 notificationName:(id)a4 error:(id *)a5;
- (BOOL)offerAssetToAccessory:(id)a3 asset:(id)a4 error:(id *)a5;
- (BOOL)pauseAssetTransfersForAccessory:(id)a3;
- (BOOL)recvDataFromAccessory:(id)a3 data:(id)a4 error:(id *)a5;
- (BOOL)removeAccessory:(id)a3 error:(id *)a4;
- (BOOL)rescindStagedAssetsForAccessory:(id)a3 error:(id *)a4;
- (BOOL)resumeAssetTransfersForAccessory:(id)a3;
- (BOOL)setController:(id)a3;
- (BOOL)startTapToRadar:(id)a3;
- (BOOL)supplementalAssetUpdated:(id)a3 assetName:(id)a4 error:(id *)a5;
- (UARPController)controller;
- (UARPUploader)init;
- (id)pendingTssRequests;
- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)firmwareStagingDataBlockTransferred:(id)a3 assetID:(id)a4 offset:(unsigned int)a5 blockSize:(unsigned int)a6;
- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6 filterProgress:(BOOL)a7;
- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)stopTapToRadar;
- (void)tssResponse:(id)a3;
@end

@implementation UARPUploader

- (UARPUploader)init
{
  v6.receiver = self;
  v6.super_class = (Class)UARPUploader;
  v2 = [(UARPUploader *)&v6 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.accessoryupdater.uarp", "uploader");
    xpcLog = v2->_xpcLog;
    v2->_xpcLog = (OS_os_log *)v3;
  }
  return v2;
}

- (BOOL)setController:(id)a3
{
  id v4 = a3;
  p_controller = &self->_controller;
  id WeakRetained = objc_loadWeakRetained((id *)p_controller);

  if (!WeakRetained) {
    objc_storeWeak((id *)p_controller, v4);
  }

  return WeakRetained == 0;
}

- (BOOL)addAccessory:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)accessoryReachable:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)removeAccessory:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)accessoryUnreachable:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)recvDataFromAccessory:(id)a3 data:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)offerAssetToAccessory:(id)a3 asset:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)applyStagedAssetsForAccessory:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)rescindStagedAssetsForAccessory:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)pauseAssetTransfersForAccessory:(id)a3
{
  return 0;
}

- (BOOL)resumeAssetTransfersForAccessory:(id)a3
{
  return 0;
}

- (BOOL)cancelAssetStagingForAccessory:(id)a3 asset:(id)a4
{
  return 0;
}

- (BOOL)supplementalAssetUpdated:(id)a3 assetName:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)genericNotification:(id)a3 notificationName:(id)a4 error:(id *)a5
{
  return 0;
}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    v11 = xpcLog;
    int v13 = 136315650;
    v14 = UARPFirmwareStagingCompletionStatusToString(a5);
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_21E079000, v11, OS_LOG_TYPE_INFO, "Firmware Staging Complete Status = %s for Asset = %@ Accessory = %@", (uint8_t *)&v13, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  [WeakRetained firmwareStagingComplete:v8 assetID:v9 withStatus:a5];
}

- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  p_controller = &self->_controller;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_controller);
  [WeakRetained stagedFirmwareApplicationComplete:v6 withStatus:a4];
}

- (void)stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4
{
  p_controller = &self->_controller;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_controller);
  [WeakRetained stagedFirmwareRescindComplete:v5 withStatus:6];
}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6 filterProgress:(BOOL)a7
{
  BOOL v7 = a7;
  p_controller = &self->_controller;
  id v12 = a4;
  id v13 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_controller);
  [WeakRetained firmwareStagingProgress:v13 assetID:v12 bytesSent:a5 bytesTotal:a6 filterProgress:v7];
}

- (void)firmwareStagingDataBlockTransferred:(id)a3 assetID:(id)a4 offset:(unsigned int)a5 blockSize:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  p_controller = &self->_controller;
  id v10 = a4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_controller);
  [WeakRetained firmwareStagingDataBlockTransferred:v11 assetID:v10 offset:v7 blockSize:v6];
}

- (BOOL)startTapToRadar:(id)a3
{
  return 0;
}

- (void)stopTapToRadar
{
}

- (id)pendingTssRequests
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)tssResponse:(id)a3
{
}

- (UARPController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (UARPController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_xpcLog, 0);
}

@end