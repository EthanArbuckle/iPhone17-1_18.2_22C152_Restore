@interface HUMatterAccessoryRemovalHelper
- (BOOL)shouldUseEcosystemRemovalConfirmation;
- (BOOL)updateShouldUseEcosystemRemovalConfirmation;
- (HFServiceLikeItem)item;
- (HUMatterAccessoryRemovalHelper)initWithItem:(id)a3 connectedEcosystems:(id)a4;
- (NSArray)connectedEcosystems;
- (NSArray)thirdPartyEcosystems;
- (NSString)removalActionConfirmationButtonTitle;
- (NSString)removalActionConfirmationTitle;
- (NSString)removalActionTitle;
- (NSString)resetAllActionConfirmationButtonTitle;
- (NSString)resetAllActionConfirmationTitle;
- (NSString)resetAllActionTitle;
- (NSString)title;
- (void)matterAccessoryGenerateRemovalConfirmationForAccessoryName:(id)a3;
- (void)setConnectedEcosystems:(id)a3;
- (void)setItem:(id)a3;
- (void)setRemovalActionConfirmationButtonTitle:(id)a3;
- (void)setRemovalActionConfirmationTitle:(id)a3;
- (void)setRemovalActionTitle:(id)a3;
- (void)setResetAllActionConfirmationButtonTitle:(id)a3;
- (void)setResetAllActionConfirmationTitle:(id)a3;
- (void)setResetAllActionTitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation HUMatterAccessoryRemovalHelper

- (HUMatterAccessoryRemovalHelper)initWithItem:(id)a3 connectedEcosystems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUMatterAccessoryRemovalHelper;
  v8 = [(HUMatterAccessoryRemovalHelper *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_item, v6);
    v10 = objc_msgSend(MEMORY[0x1E4F2E6A8], "hf_ecosystemComparator");
    uint64_t v11 = [v7 sortedArrayUsingComparator:v10];
    connectedEcosystems = v9->_connectedEcosystems;
    v9->_connectedEcosystems = (NSArray *)v11;

    uint64_t v13 = objc_msgSend(v7, "na_filter:", &__block_literal_global_0);
    thirdPartyEcosystems = v9->_thirdPartyEcosystems;
    v9->_thirdPartyEcosystems = (NSArray *)v13;

    v9->_shouldUseEcosystemRemovalConfirmation = [(HUMatterAccessoryRemovalHelper *)v9 updateShouldUseEcosystemRemovalConfirmation];
  }

  return v9;
}

uint64_t __67__HUMatterAccessoryRemovalHelper_initWithItem_connectedEcosystems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 vendor];
  if ([v3 isAppleVendor])
  {
    uint64_t v4 = 0;
  }
  else
  {
    v5 = [v2 vendor];
    uint64_t v4 = [v5 isSystemCommissionerVendor] ^ 1;
  }
  return v4;
}

- (BOOL)updateShouldUseEcosystemRemovalConfirmation
{
  v3 = [(HUMatterAccessoryRemovalHelper *)self item];
  if ([v3 conformsToProtocol:&unk_1F1A3D6E8]) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  char v6 = [v5 isItemGroup];
  if (v6) {
    return 0;
  }
  objc_opt_class();
  id v7 = [(HUMatterAccessoryRemovalHelper *)self item];
  v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;

  if (v8) {
    return 0;
  }
  objc_opt_class();
  v9 = [(HUMatterAccessoryRemovalHelper *)self item];
  v10 = (objc_opt_isKindOfClass() & 1) != 0 ? v9 : 0;
  id v11 = v10;

  v12 = [v11 accessories];

  LOBYTE(v11) = objc_msgSend(v12, "na_any:", &__block_literal_global_59);
  if (v11) {
    return 0;
  }
  uint64_t v13 = [(HUMatterAccessoryRemovalHelper *)self item];
  v14 = [v13 accessories];
  uint64_t v15 = [v14 count];

  if (v15 != 1) {
    return 0;
  }
  objc_super v16 = [(HUMatterAccessoryRemovalHelper *)self item];
  v17 = [v16 accessories];
  v18 = [v17 anyObject];

  if ([v18 supportsCHIP])
  {
    v19 = [(HUMatterAccessoryRemovalHelper *)self thirdPartyEcosystems];
    BOOL v20 = [v19 count] != 0;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

uint64_t __77__HUMatterAccessoryRemovalHelper_updateShouldUseEcosystemRemovalConfirmation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 category];
  v3 = [v2 categoryType];
  uint64_t v4 = [v3 isEqualToString:*MEMORY[0x1E4F2C1D0]];

  return v4;
}

- (void)matterAccessoryGenerateRemovalConfirmationForAccessoryName:(id)a3
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v87 = a3;
  [(HUMatterAccessoryRemovalHelper *)self setTitle:0];
  uint64_t v4 = [(HUMatterAccessoryRemovalHelper *)self item];
  id v5 = [v4 home];
  char v6 = [v5 name];
  uint64_t v13 = HULocalizedStringWithFormat(@"HUEcosystemAccessoryRemovalActionForAppleHome", @"%@", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  [(HUMatterAccessoryRemovalHelper *)self setRemovalActionTitle:v13];

  BOOL v20 = HULocalizedStringWithFormat(@"HUServiceDetailsRemoveDeviceAlertTitle", @"%@", v14, v15, v16, v17, v18, v19, (uint64_t)v87);
  [(HUMatterAccessoryRemovalHelper *)self setRemovalActionConfirmationTitle:v20];

  v21 = _HULocalizedStringWithDefaultValue(@"HURemoveTitle", @"HURemoveTitle", 1);
  [(HUMatterAccessoryRemovalHelper *)self setRemovalActionConfirmationButtonTitle:v21];

  objc_opt_class();
  v22 = [(HUMatterAccessoryRemovalHelper *)self item];
  if (objc_opt_isKindOfClass()) {
    v23 = v22;
  }
  else {
    v23 = 0;
  }
  id v24 = v23;

  v25 = [v24 profile];
  int v26 = objc_msgSend(v25, "hf_supportsRecordingEvents");

  if (v26)
  {
    v33 = HULocalizedStringWithFormat(@"HUServiceDetailsRemoveCameraWithClipsAlertTitle", @"%@", v27, v28, v29, v30, v31, v32, (uint64_t)v87);
    [(HUMatterAccessoryRemovalHelper *)self setTitle:v33];

    v34 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsRemoveDeviceAlertRemoveCameraButton", @"HUServiceDetailsRemoveDeviceAlertRemoveCameraButton", 1);
    [(HUMatterAccessoryRemovalHelper *)self setRemovalActionTitle:v34];
  }
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x3032000000;
  v94 = __Block_byref_object_copy_;
  v95 = __Block_byref_object_dispose_;
  id v96 = 0;
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v36 = [(HUMatterAccessoryRemovalHelper *)self connectedEcosystems];
  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __93__HUMatterAccessoryRemovalHelper_matterAccessoryGenerateRemovalConfirmationForAccessoryName___block_invoke;
  v88[3] = &unk_1E6384E70;
  v90 = &v91;
  id v37 = v35;
  id v89 = v37;
  objc_msgSend(v36, "na_each:", v88);

  [v37 sortUsingSelector:sel_localizedStandardCompare_];
  v38 = HFLogForCategory();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v98 = v37;
    _os_log_impl(&dword_1BE345000, v38, OS_LOG_TYPE_DEFAULT, "vendorNames, %@", buf, 0xCu);
  }

  v39 = HFLogForCategory();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = (void *)v92[5];
    *(_DWORD *)buf = 138412290;
    id v98 = v40;
    _os_log_impl(&dword_1BE345000, v39, OS_LOG_TYPE_DEFAULT, "systemCommissionerVendor, %@", buf, 0xCu);
  }

  v41 = [MEMORY[0x1E4F28E78] stringWithString:&stru_1F18F92B8];
  if ([v37 count] == 1)
  {
    v42 = [v37 firstObject];
    v49 = HULocalizedStringWithFormat(@"HUEcosystemAccessoryRemovalActionConfirmationTitleForOneEcosystem", @"%@", v43, v44, v45, v46, v47, v48, (uint64_t)v42);
    [v41 appendString:v49];
  }
  else if ([v37 count] == 2)
  {
    v42 = [v37 firstObject];
    v49 = [v37 lastObject];
    v56 = HULocalizedStringWithFormat(@"HUEcosystemAccessoryRemovalActionConfirmationTitleForTwoEcosystems", @"%@%@", v50, v51, v52, v53, v54, v55, (uint64_t)v42);
    [v41 appendString:v56];
  }
  else
  {
    if ((unint64_t)[v37 count] < 3) {
      goto LABEL_20;
    }
    v57 = [v37 firstObject];
    v64 = HULocalizedStringWithFormat(@"HUEcosystemAccessoryRemovalActionConfirmationTitleForMultipleEcosystems_FirstEcosystem", @"%@", v58, v59, v60, v61, v62, v63, (uint64_t)v57);
    [v41 appendString:v64];

    uint64_t v65 = [v37 count];
    if (v65 - 1 >= 2)
    {
      uint64_t v66 = 2;
      do
      {
        v67 = [v37 objectAtIndexedSubscript:v66 - 1];
        v74 = HULocalizedStringWithFormat(@"HUEcosystemAccessoryRemovalActionConfirmationTitleForMultipleEcosystems_OtherEcosystems", @"%@", v68, v69, v70, v71, v72, v73, (uint64_t)v67);
        [v41 appendString:v74];

        ++v66;
      }
      while (v65 != v66);
    }
    v42 = [v37 lastObject];
    v49 = HULocalizedStringWithFormat(@"HUEcosystemAccessoryRemovalActionConfirmationTitleForMultipleEcosystems_LastEcosystem", @"%@", v75, v76, v77, v78, v79, v80, (uint64_t)v42);
    [v41 appendString:v49];
  }

LABEL_20:
  if (v92[5])
  {
    v81 = _HULocalizedStringWithDefaultValue(@"HUEcosystemAccessoryRemovalActionConfirmationTitle_SystemCommissioner", @"HUEcosystemAccessoryRemovalActionConfirmationTitle_SystemCommissioner", 1);
    [v41 appendString:v81];
  }
  v82 = _HULocalizedStringWithDefaultValue(@"HUEcosystemAccessoryRemovalActionConfirmationTitle_Postfix", @"HUEcosystemAccessoryRemovalActionConfirmationTitle_Postfix", 1);
  [v41 appendString:v82];

  v83 = HFLogForCategory();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v98 = v41;
    _os_log_impl(&dword_1BE345000, v83, OS_LOG_TYPE_DEFAULT, "resetAllActionConfirmationTitle, %@", buf, 0xCu);
  }

  v84 = _HULocalizedStringWithDefaultValue(@"HUEcosystemAccessoryRemovalActionForMultipleEcosystems", @"HUEcosystemAccessoryRemovalActionForMultipleEcosystems", 1);
  [(HUMatterAccessoryRemovalHelper *)self setResetAllActionTitle:v84];

  v85 = (void *)[v41 copy];
  [(HUMatterAccessoryRemovalHelper *)self setResetAllActionConfirmationTitle:v85];

  v86 = _HULocalizedStringWithDefaultValue(@"HUEcosystemAccessoryRemovalActionForMultipleEcosystems", @"HUEcosystemAccessoryRemovalActionForMultipleEcosystems", 1);
  [(HUMatterAccessoryRemovalHelper *)self setResetAllActionConfirmationButtonTitle:v86];

  _Block_object_dispose(&v91, 8);
}

void __93__HUMatterAccessoryRemovalHelper_matterAccessoryGenerateRemovalConfirmationForAccessoryName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 vendor];
  int v5 = [v4 isSystemCommissionerVendor];

  if (v5)
  {
    uint64_t v6 = [v3 vendor];

    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    uint64_t v9 = *(void **)(a1 + 32);
    id v11 = [v3 vendor];

    uint64_t v10 = [v11 name];
    objc_msgSend(v9, "na_safeAddObject:", v10);

    uint64_t v8 = v11;
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)removalActionTitle
{
  return self->_removalActionTitle;
}

- (void)setRemovalActionTitle:(id)a3
{
}

- (NSString)resetAllActionTitle
{
  return self->_resetAllActionTitle;
}

- (void)setResetAllActionTitle:(id)a3
{
}

- (NSString)removalActionConfirmationTitle
{
  return self->_removalActionConfirmationTitle;
}

- (void)setRemovalActionConfirmationTitle:(id)a3
{
}

- (NSString)removalActionConfirmationButtonTitle
{
  return self->_removalActionConfirmationButtonTitle;
}

- (void)setRemovalActionConfirmationButtonTitle:(id)a3
{
}

- (NSString)resetAllActionConfirmationTitle
{
  return self->_resetAllActionConfirmationTitle;
}

- (void)setResetAllActionConfirmationTitle:(id)a3
{
}

- (NSString)resetAllActionConfirmationButtonTitle
{
  return self->_resetAllActionConfirmationButtonTitle;
}

- (void)setResetAllActionConfirmationButtonTitle:(id)a3
{
}

- (BOOL)shouldUseEcosystemRemovalConfirmation
{
  return self->_shouldUseEcosystemRemovalConfirmation;
}

- (HFServiceLikeItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);

  return (HFServiceLikeItem *)WeakRetained;
}

- (void)setItem:(id)a3
{
}

- (NSArray)connectedEcosystems
{
  return self->_connectedEcosystems;
}

- (void)setConnectedEcosystems:(id)a3
{
}

- (NSArray)thirdPartyEcosystems
{
  return self->_thirdPartyEcosystems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdPartyEcosystems, 0);
  objc_storeStrong((id *)&self->_connectedEcosystems, 0);
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_resetAllActionConfirmationButtonTitle, 0);
  objc_storeStrong((id *)&self->_resetAllActionConfirmationTitle, 0);
  objc_storeStrong((id *)&self->_removalActionConfirmationButtonTitle, 0);
  objc_storeStrong((id *)&self->_removalActionConfirmationTitle, 0);
  objc_storeStrong((id *)&self->_resetAllActionTitle, 0);
  objc_storeStrong((id *)&self->_removalActionTitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end