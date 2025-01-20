@interface HFFirmwareUpdateStatusItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFFirmwareUpdateStatusItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v49[1] = *MEMORY[0x263EF8340];
  v4 = [a3 objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
  int v5 = [v4 BOOLValue];

  if (!v5)
  {
    v10 = [(HFStatusItem *)self room];
    if (v10) {
      [(HFStatusItem *)self room];
    }
    else {
    v11 = [(HFStatusItem *)self home];
    }
    v12 = [v11 accessories];

    v13 = [[HFSoftwareUpdateCounter alloc] initWithAccessories:v12];
    if ([(HFSoftwareUpdateCounter *)v13 softwareUpdatesInProgress])
    {
      if ([(HFSoftwareUpdateCounter *)v13 softwareUpdatesInstalling])
      {
        uint64_t v45 = [(HFSoftwareUpdateCounter *)v13 softwareUpdatesInstalling];
        HFLocalizedStringWithFormat(@"HFStatusTitleFirmwareUpdateInstalling", @"%lu", v14, v15, v16, v17, v18, v19, v45);
        v32 = LABEL_13:;
LABEL_15:
        v33 = objc_alloc_init(HFMutableItemUpdateOutcome);
        v34 = (void *)MEMORY[0x263EFFA08];
        uint64_t v35 = objc_opt_class();
        uint64_t v36 = objc_opt_class();
        uint64_t v37 = objc_opt_class();
        v38 = objc_msgSend(v34, "setWithObjects:", v35, v36, v37, objc_opt_class(), 0);
        [(HFMutableItemUpdateOutcome *)v33 setObject:v38 forKeyedSubscript:@"dependentHomeKitClasses"];

        [(HFMutableItemUpdateOutcome *)v33 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hasSoftwareUpdateV2Dependency"];
        if (v32)
        {
          v39 = [MEMORY[0x263EFFA08] setWithArray:v12];
          v40 = objc_msgSend(v39, "na_filter:", &__block_literal_global_70);

          v41 = [MEMORY[0x263F1C6C8] configurationWithPointSize:24.0];
          v42 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"square.and.arrow.down.fill" configuration:v41];
          [(HFMutableItemUpdateOutcome *)v33 setObject:v42 forKeyedSubscript:@"icon"];

          [(HFMutableItemUpdateOutcome *)v33 setObject:&unk_26C0F6768 forKeyedSubscript:@"statusItemCategory"];
          [(HFMutableItemUpdateOutcome *)v33 setObject:v40 forKeyedSubscript:@"representedHomeKitObjects"];
          [(HFMutableItemUpdateOutcome *)v33 setObject:v32 forKeyedSubscript:@"title"];
          v43 = _HFLocalizedStringWithDefaultValue(@"HFStatusSortKeyFirmwareUpdate", @"HFStatusSortKeyFirmwareUpdate", 1);
          [(HFMutableItemUpdateOutcome *)v33 setObject:v43 forKeyedSubscript:@"sortKey"];

          [(HFMutableItemUpdateOutcome *)v33 setObject:&unk_26C0F6780 forKeyedSubscript:@"priority"];
          [(HFMutableItemUpdateOutcome *)v33 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"shouldHideForNonAdminUsers"];
        }
        else
        {
          [(HFMutableItemUpdateOutcome *)v33 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
        }
        v9 = [MEMORY[0x263F58190] futureWithResult:v33];

        goto LABEL_19;
      }
      if ([(HFSoftwareUpdateCounter *)v13 softwareUpdatesDownloading])
      {
        uint64_t v47 = [(HFSoftwareUpdateCounter *)v13 softwareUpdatesDownloading];
        HFLocalizedStringWithFormat(@"HFStatusTitleFirmwareUpdateDownloading", @"%lu", v26, v27, v28, v29, v30, v31, v47);
        goto LABEL_13;
      }
    }
    else if ([(HFSoftwareUpdateCounter *)v13 updatesReadyToInstall])
    {
      uint64_t v46 = [(HFSoftwareUpdateCounter *)v13 updatesReadyToInstall];
      HFLocalizedStringWithFormat(@"HFStatusTitleFirmwareUpdateAvailable", @"%lu", v20, v21, v22, v23, v24, v25, v46);
      goto LABEL_13;
    }
    v32 = 0;
    goto LABEL_15;
  }
  v6 = (void *)MEMORY[0x263F58190];
  v48 = @"hidden";
  v49[0] = MEMORY[0x263EFFA88];
  v7 = [NSDictionary dictionaryWithObjects:v49 forKeys:&v48 count:1];
  v8 = +[HFItemUpdateOutcome outcomeWithResults:v7];
  v9 = [v6 futureWithResult:v8];

LABEL_19:
  return v9;
}

uint64_t __58__HFFirmwareUpdateStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_hasNewValidSoftwareOrFirmwareUpdate");
}

@end