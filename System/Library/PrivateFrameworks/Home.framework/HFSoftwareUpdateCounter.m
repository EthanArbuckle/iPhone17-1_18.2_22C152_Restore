@interface HFSoftwareUpdateCounter
+ (id)progressForAccessoriesDownloadingSoftwareUpdate:(id)a3;
- (HFSoftwareUpdateCounter)init;
- (HFSoftwareUpdateCounter)initWithAccessories:(id)a3;
- (NSSet)accessoriesDownloadingSoftwareUpdates;
- (NSSet)accessoriesWithRequestedSoftwareUpdates;
- (id)description;
- (unint64_t)allUpdates;
- (unint64_t)firmwareUpdatesReadyToInstall;
- (unint64_t)softwareUpdatesDownloading;
- (unint64_t)softwareUpdatesInProgress;
- (unint64_t)softwareUpdatesInstalled;
- (unint64_t)softwareUpdatesInstalling;
- (unint64_t)softwareUpdatesReadyToInstall;
- (unint64_t)softwareUpdatesRequested;
- (unint64_t)updatesReadyToInstall;
- (void)setAccessoriesDownloadingSoftwareUpdates:(id)a3;
- (void)setAccessoriesWithRequestedSoftwareUpdates:(id)a3;
- (void)setAllUpdates:(unint64_t)a3;
- (void)setFirmwareUpdatesReadyToInstall:(unint64_t)a3;
- (void)setSoftwareUpdatesDownloading:(unint64_t)a3;
- (void)setSoftwareUpdatesInProgress:(unint64_t)a3;
- (void)setSoftwareUpdatesInstalled:(unint64_t)a3;
- (void)setSoftwareUpdatesInstalling:(unint64_t)a3;
- (void)setSoftwareUpdatesReadyToInstall:(unint64_t)a3;
- (void)setSoftwareUpdatesRequested:(unint64_t)a3;
- (void)setUpdatesReadyToInstall:(unint64_t)a3;
@end

@implementation HFSoftwareUpdateCounter

void __47__HFSoftwareUpdateCounter_initWithAccessories___block_invoke(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 isFirmwareUpdateAvailable])
  {
    v4 = NSString;
    v5 = [v3 storeID];
    v6 = [v3 bundleID];
    v7 = [v4 stringWithFormat:@"%@-%@", v5, v6];

    v8 = (void *)a1[4];
LABEL_17:
    [v8 addObject:v7];

    goto LABEL_18;
  }
  if (objc_msgSend(v3, "hf_isReadyToInstallSoftwareUpdate"))
  {
    if (objc_msgSend(v3, "hf_hasNewValidSoftwareUpdate"))
    {
      v9 = (void *)a1[5];
LABEL_16:
      v7 = objc_msgSend(v3, "hf_softwareUpdateHash");
      v8 = v9;
      goto LABEL_17;
    }
    v15 = HFLogForCategory(0x40uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v3;
      _os_log_error_impl(&dword_20B986000, v15, OS_LOG_TYPE_ERROR, "Software update is ready to install but accessory not controllable: %@", buf, 0xCu);
    }
  }
  else
  {
    if (objc_msgSend(v3, "hf_isSoftwareUpdateInProgress"))
    {
      v10 = (void *)a1[6];
      v11 = objc_msgSend(v3, "hf_softwareUpdateHash");
      [v10 addObject:v11];

      if (objc_msgSend(v3, "hf_isDownloadingSoftwareUpdate"))
      {
        v12 = (void *)a1[7];
        v13 = objc_msgSend(v3, "hf_softwareUpdateHash");
        [v12 addObject:v13];

        v14 = (void *)a1[8];
      }
      else
      {
        if (objc_msgSend(v3, "hf_isInstallingSoftwareUpdate"))
        {
          v9 = (void *)a1[9];
          goto LABEL_16;
        }
        if (!objc_msgSend(v3, "hf_hasRequestedSoftwareUpdate")) {
          goto LABEL_18;
        }
        v16 = (void *)a1[10];
        v17 = objc_msgSend(v3, "hf_softwareUpdateHash");
        [v16 addObject:v17];

        v14 = (void *)a1[11];
      }
      [v14 addObject:v3];
      goto LABEL_18;
    }
    if (objc_msgSend(v3, "hf_isSoftwareUpdateInstalled"))
    {
      v9 = (void *)a1[12];
      goto LABEL_16;
    }
  }
LABEL_18:
}

- (HFSoftwareUpdateCounter)initWithAccessories:(id)a3
{
  id v24 = a3;
  v35.receiver = self;
  v35.super_class = (Class)HFSoftwareUpdateCounter;
  v4 = [(HFSoftwareUpdateCounter *)&v35 init];
  if (v4)
  {
    v5 = [MEMORY[0x263EFF9C0] set];
    v6 = [MEMORY[0x263EFF9C0] set];
    v7 = [MEMORY[0x263EFF9C0] set];
    v8 = [MEMORY[0x263EFF9C0] set];
    v9 = [MEMORY[0x263EFF9C0] set];
    v10 = [MEMORY[0x263EFF9C0] set];
    v11 = [MEMORY[0x263EFF9C0] set];
    v12 = [MEMORY[0x263EFF9C0] set];
    v13 = [MEMORY[0x263EFF9C0] set];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __47__HFSoftwareUpdateCounter_initWithAccessories___block_invoke;
    v25[3] = &unk_264093B18;
    id v26 = v11;
    id v27 = v5;
    id v28 = v7;
    id v29 = v8;
    id v30 = v13;
    id v31 = v9;
    id v32 = v6;
    id v33 = v12;
    id v34 = v10;
    id v14 = v10;
    id v23 = v12;
    id v15 = v6;
    id v16 = v9;
    id v17 = v13;
    id v18 = v8;
    id v19 = v7;
    id v20 = v5;
    id v21 = v11;
    objc_msgSend(v24, "na_each:", v25);
    -[HFSoftwareUpdateCounter setSoftwareUpdatesRequested:](v4, "setSoftwareUpdatesRequested:", [v15 count]);
    -[HFSoftwareUpdateCounter setSoftwareUpdatesReadyToInstall:](v4, "setSoftwareUpdatesReadyToInstall:", [v20 count]);
    -[HFSoftwareUpdateCounter setSoftwareUpdatesInProgress:](v4, "setSoftwareUpdatesInProgress:", [v19 count]);
    -[HFSoftwareUpdateCounter setSoftwareUpdatesDownloading:](v4, "setSoftwareUpdatesDownloading:", [v18 count]);
    -[HFSoftwareUpdateCounter setSoftwareUpdatesInstalling:](v4, "setSoftwareUpdatesInstalling:", [v16 count]);
    -[HFSoftwareUpdateCounter setSoftwareUpdatesInstalled:](v4, "setSoftwareUpdatesInstalled:", [v14 count]);
    -[HFSoftwareUpdateCounter setFirmwareUpdatesReadyToInstall:](v4, "setFirmwareUpdatesReadyToInstall:", [v21 count]);
    [(HFSoftwareUpdateCounter *)v4 setUpdatesReadyToInstall:[(HFSoftwareUpdateCounter *)v4 firmwareUpdatesReadyToInstall]+ [(HFSoftwareUpdateCounter *)v4 softwareUpdatesReadyToInstall]];
    [(HFSoftwareUpdateCounter *)v4 setAllUpdates:[(HFSoftwareUpdateCounter *)v4 softwareUpdatesInProgress]+ [(HFSoftwareUpdateCounter *)v4 updatesReadyToInstall]+ [(HFSoftwareUpdateCounter *)v4 softwareUpdatesInstalled]];
    [(HFSoftwareUpdateCounter *)v4 setAccessoriesWithRequestedSoftwareUpdates:v23];
    [(HFSoftwareUpdateCounter *)v4 setAccessoriesDownloadingSoftwareUpdates:v17];
  }
  return v4;
}

- (unint64_t)updatesReadyToInstall
{
  return self->_updatesReadyToInstall;
}

- (unint64_t)softwareUpdatesInProgress
{
  return self->_softwareUpdatesInProgress;
}

- (unint64_t)softwareUpdatesReadyToInstall
{
  return self->_softwareUpdatesReadyToInstall;
}

- (unint64_t)softwareUpdatesInstalled
{
  return self->_softwareUpdatesInstalled;
}

- (void)setUpdatesReadyToInstall:(unint64_t)a3
{
  self->_updatesReadyToInstall = a3;
}

- (void)setSoftwareUpdatesRequested:(unint64_t)a3
{
  self->_softwareUpdatesRequested = a3;
}

- (void)setSoftwareUpdatesReadyToInstall:(unint64_t)a3
{
  self->_softwareUpdatesReadyToInstall = a3;
}

- (void)setSoftwareUpdatesInstalling:(unint64_t)a3
{
  self->_softwareUpdatesInstalling = a3;
}

- (void)setSoftwareUpdatesInstalled:(unint64_t)a3
{
  self->_softwareUpdatesInstalled = a3;
}

- (void)setSoftwareUpdatesInProgress:(unint64_t)a3
{
  self->_softwareUpdatesInProgress = a3;
}

- (void)setSoftwareUpdatesDownloading:(unint64_t)a3
{
  self->_softwareUpdatesDownloading = a3;
}

- (void)setFirmwareUpdatesReadyToInstall:(unint64_t)a3
{
  self->_firmwareUpdatesReadyToInstall = a3;
}

- (void)setAllUpdates:(unint64_t)a3
{
  self->_allUpdates = a3;
}

- (void)setAccessoriesWithRequestedSoftwareUpdates:(id)a3
{
}

- (void)setAccessoriesDownloadingSoftwareUpdates:(id)a3
{
}

- (unint64_t)firmwareUpdatesReadyToInstall
{
  return self->_firmwareUpdatesReadyToInstall;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoriesDownloadingSoftwareUpdates, 0);
  objc_storeStrong((id *)&self->_accessoriesWithRequestedSoftwareUpdates, 0);
}

+ (id)progressForAccessoriesDownloadingSoftwareUpdate:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v12 = 0;
    v13 = (float *)&v12;
    uint64_t v14 = 0x2020000000;
    int v15 = 0;
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2020000000;
    uint64_t v11 = 0;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __75__HFSoftwareUpdateCounter_progressForAccessoriesDownloadingSoftwareUpdate___block_invoke;
    v7[3] = &unk_264093AF0;
    v7[4] = &v12;
    v7[5] = &v8;
    objc_msgSend(v3, "na_each:", v7);
    unint64_t v4 = v9[3];
    if (v4)
    {
      v13[6] = v13[6] / (float)v4;
      v5 = objc_msgSend(NSNumber, "numberWithFloat:");
    }
    else
    {
      v5 = 0;
    }
    _Block_object_dispose(&v8, 8);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __75__HFSoftwareUpdateCounter_progressForAccessoriesDownloadingSoftwareUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "hf_softwareUpdatePortionComplete");
  if (v3)
  {
    id v5 = v3;
    [v3 floatValue];
    id v3 = v5;
    if (v4 < 0.99 && fabsf(v4 + -0.99) >= 0.00000011921)
    {
      *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4
                                                                 + *(float *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
  }
}

- (HFSoftwareUpdateCounter)init
{
  float v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithAccessories_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFSoftwareUpdateCounter.m", 121, @"%s is unavailable; use %@ instead",
    "-[HFSoftwareUpdateCounter init]",
    v5);

  return 0;
}

- (id)description
{
  id v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFSoftwareUpdateCounter softwareUpdatesRequested](self, "softwareUpdatesRequested"), @"softwareUpdatesRequested");
  id v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFSoftwareUpdateCounter softwareUpdatesReadyToInstall](self, "softwareUpdatesReadyToInstall"), @"softwareUpdatesReadyToInstall");
  id v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFSoftwareUpdateCounter softwareUpdatesInProgress](self, "softwareUpdatesInProgress"), @"softwareUpdatesInProgress");
  id v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFSoftwareUpdateCounter softwareUpdatesDownloading](self, "softwareUpdatesDownloading"), @"softwareUpdatesDownloading");
  id v8 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFSoftwareUpdateCounter softwareUpdatesInstalling](self, "softwareUpdatesInstalling"), @"softwareUpdatesInstalling");
  id v9 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFSoftwareUpdateCounter softwareUpdatesInstalled](self, "softwareUpdatesInstalled"), @"softwareUpdatesInstalled");
  id v10 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFSoftwareUpdateCounter firmwareUpdatesReadyToInstall](self, "firmwareUpdatesReadyToInstall"), @"firmwareUpdatesReadyToInstall");
  id v11 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFSoftwareUpdateCounter updatesReadyToInstall](self, "updatesReadyToInstall"), @"updatesReadyToInstall");
  id v12 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFSoftwareUpdateCounter allUpdates](self, "allUpdates"), @"allUpdates");
  v13 = [v3 build];

  return v13;
}

- (unint64_t)softwareUpdatesRequested
{
  return self->_softwareUpdatesRequested;
}

- (unint64_t)softwareUpdatesDownloading
{
  return self->_softwareUpdatesDownloading;
}

- (unint64_t)softwareUpdatesInstalling
{
  return self->_softwareUpdatesInstalling;
}

- (unint64_t)allUpdates
{
  return self->_allUpdates;
}

- (NSSet)accessoriesWithRequestedSoftwareUpdates
{
  return self->_accessoriesWithRequestedSoftwareUpdates;
}

- (NSSet)accessoriesDownloadingSoftwareUpdates
{
  return self->_accessoriesDownloadingSoftwareUpdates;
}

@end