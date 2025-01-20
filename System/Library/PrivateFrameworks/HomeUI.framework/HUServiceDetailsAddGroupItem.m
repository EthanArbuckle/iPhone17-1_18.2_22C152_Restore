@interface HUServiceDetailsAddGroupItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUServiceDetailsAddGroupItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v98[1] = *MEMORY[0x1E4F143B8];
  v4 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsGroupAddButton", @"HUServiceDetailsGroupAddButton", 1);
  v5 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsGroupFooter", @"HUServiceDetailsGroupFooter", 1);
  v6 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsGroupTitle", @"HUServiceDetailsGroupTitle", 1);
  v7 = [(HUServiceDetailsAbstractItem *)self home];
  v8 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  v9 = [v8 latestResults];
  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68BE8]];
  v11 = objc_msgSend(v7, "hf_roomWithIdentifier:", v10);

  v12 = [(HUServiceDetailsAbstractItem *)self home];
  LODWORD(v8) = objc_msgSend(v12, "hf_currentUserIsAdministrator");

  if (v8 && v11)
  {
    v79 = v5;
    v13 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_opt_class();
    v14 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
    id v16 = v15;

    objc_opt_class();
    v17 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
    if (objc_opt_isKindOfClass()) {
      v18 = v17;
    }
    else {
      v18 = 0;
    }
    id v19 = v18;

    objc_opt_class();
    v20 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
    if (objc_opt_isKindOfClass()) {
      v21 = v20;
    }
    else {
      v21 = 0;
    }
    id v22 = v21;

    v80 = v4;
    v77 = v22;
    v78 = v19;
    if (v22)
    {
      v23 = [v22 accessory];
      v24 = objc_msgSend(v23, "hf_visibleServices");
      int v25 = objc_msgSend(v24, "na_any:", &__block_literal_global_132);

      int v26 = v25 & ~objc_msgSend(v23, "hf_canShowAsIndividualServices");
    }
    else if (v16 && ![(HUServiceDetailsAbstractItem *)self isAccessory])
    {
      v59 = [v16 service];
      v60 = [MEMORY[0x1E4F1CAD0] setWithObject:v59];
      [v13 setObject:v60 forKeyedSubscript:*MEMORY[0x1E4F68908]];

      v61 = (void *)MEMORY[0x1E4F1CAD0];
      v62 = objc_msgSend(v59, "hf_effectiveServiceType");
      v63 = [v61 setWithObject:v62];
      [v13 setObject:v63 forKeyedSubscript:*MEMORY[0x1E4F68910]];

      int v64 = objc_msgSend(v59, "hf_supportsGroups");
      v65 = [(HUServiceDetailsAbstractItem *)self home];
      v66 = objc_msgSend(v65, "hf_serviceGroupsForService:", v59);
      if ([v66 count]) {
        int v67 = 0;
      }
      else {
        int v67 = v64;
      }

      v68 = [(HUServiceDetailsAbstractItem *)self home];
      v69 = objc_msgSend(v68, "hf_allServices");
      v83[0] = MEMORY[0x1E4F143A8];
      v83[1] = 3221225472;
      v83[2] = __60__HUServiceDetailsAddGroupItem__subclass_updateWithOptions___block_invoke_2;
      v83[3] = &unk_1E6387048;
      id v84 = v59;
      id v70 = v59;
      int v26 = v67 & objc_msgSend(v69, "na_any:", v83);
    }
    else
    {
      int v26 = 0;
      if ((_os_feature_enabled_impl() & 1) == 0 && v19)
      {
        v40 = [v19 mediaProfileContainer];
        if (([MEMORY[0x1E4F692A8] isHomePod:v40] & 1) != 0
          || [MEMORY[0x1E4F692A8] isHomePodMediaSystem:v40])
        {
          if (objc_msgSend(v40, "hf_supportsStereoPairing"))
          {
            v41 = [v19 accessories];
            v42 = (void *)[v41 mutableCopy];

            v43 = [(HUServiceDetailsAbstractItem *)self home];
            objc_msgSend(v42, "na_safeAddObject:", v43);

            [v13 setObject:v42 forKeyedSubscript:*MEMORY[0x1E4F68908]];
            v44 = [(HUServiceDetailsAbstractItem *)self home];
            v45 = objc_msgSend(v44, "hf_accessoriesMatchingCategoryType:", *MEMORY[0x1E4F2C1D0]);
            v81[0] = MEMORY[0x1E4F143A8];
            v81[1] = 3221225472;
            v81[2] = __60__HUServiceDetailsAddGroupItem__subclass_updateWithOptions___block_invoke_3;
            v81[3] = &unk_1E63869C8;
            v75 = v40;
            id v46 = v40;
            id v82 = v46;
            v47 = objc_msgSend(v45, "na_filter:", v81);

            v76 = v47;
            unint64_t v48 = [v47 count];
            v49 = [v46 settings];
            int v50 = [v49 isControllable];
            v74 = v42;
            if (v50) {
              int v50 = objc_msgSend(v46, "hf_isReachable");
            }
            v51 = v80;
            if (v48 > 1) {
              int v26 = v50;
            }
            else {
              int v26 = 0;
            }

            v52 = HFLogForCategory();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              v53 = @"NOT ";
              if (v26) {
                v53 = &stru_1F18F92B8;
              }
              v73 = v53;
              uint64_t v72 = [v76 count];
              v54 = [v46 settings];
              int v55 = [v54 isControllable];
              int v56 = objc_msgSend(v46, "hf_isReachable");
              *(_DWORD *)buf = 138413570;
              id v86 = v46;
              __int16 v87 = 2112;
              v88 = v73;
              __int16 v89 = 2048;
              uint64_t v90 = v72;
              __int16 v91 = 2112;
              v92 = v76;
              __int16 v93 = 1024;
              int v94 = v55;
              __int16 v95 = 1024;
              int v96 = v56;
              _os_log_impl(&dword_1BE345000, v52, OS_LOG_TYPE_DEFAULT, "%@ does %@support showing 'Create Stereo Pair' button --> %lu unpairedHomePodsInHome: %@, isControllable: %{BOOL}d, hf_isReachable: %{BOOL}d", buf, 0x36u);

              v51 = v80;
            }

            uint64_t v57 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsMediaSystemAddButton", @"HUServiceDetailsMediaSystemAddButton", 1);

            uint64_t v58 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsMediaSystemFooter", @"HUServiceDetailsMediaSystemFooter", 1);

            v6 = 0;
            v80 = (void *)v57;
            v40 = v75;
          }
          else
          {
            int v26 = 0;
            uint64_t v58 = (uint64_t)v79;
          }
          v71 = HFLogForCategory();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v86 = v40;
            _os_log_impl(&dword_1BE345000, v71, OS_LOG_TYPE_DEFAULT, "%@ does NOT support showing 'Create Stereo Pair' button --> hf_supportsStereoPairing: NO", buf, 0xCu);
          }
          v79 = (void *)v58;
        }
        else
        {
          int v26 = 0;
        }
      }
    }
    v27 = [v16 service];
    v28 = [v27 accessory];
    int v29 = objc_msgSend(v28, "hf_isMultiServiceAccessory");

    v30 = [v16 service];
    v31 = [v30 accessory];
    int v32 = objc_msgSend(v31, "hf_showAsIndividualServices");

    if (v26 && ((v29 ^ 1 | v32) & 1) != 0)
    {
      [v13 setObject:v80 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];
      v5 = v79;
      [v13 setObject:v79 forKeyedSubscript:@"HUServiceDetailsAddGroupSectionFooterResultKey"];
      v33 = [NSString stringWithFormat:@"AccessoryDetails.%@", v6];
      [v13 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F68928]];

      objc_msgSend(v13, "na_safeSetObject:forKey:", v6, @"HUServiceDetailsAddGroupSectionHeaderResultKey");
    }
    else
    {
      [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
      v5 = v79;
    }
    v37 = (void *)MEMORY[0x1E4F7A0D8];
    v38 = [MEMORY[0x1E4F69228] outcomeWithResults:v13];
    v36 = [v37 futureWithResult:v38];

    v4 = v80;
  }
  else
  {
    v34 = (void *)MEMORY[0x1E4F7A0D8];
    v35 = (void *)MEMORY[0x1E4F69228];
    uint64_t v97 = *MEMORY[0x1E4F68B10];
    v98[0] = MEMORY[0x1E4F1CC38];
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:&v97 count:1];
    id v16 = [v35 outcomeWithResults:v13];
    v36 = [v34 futureWithResult:v16];
  }

  return v36;
}

uint64_t __60__HUServiceDetailsAddGroupItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_supportsGroups");
}

uint64_t __60__HUServiceDetailsAddGroupItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_canGroupWithService:", *(void *)(a1 + 32));
}

BOOL __60__HUServiceDetailsAddGroupItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 mediaProfile];
  int v5 = objc_msgSend(v4, "hf_supportsStereoPairing");

  if (v5
    && (uint64_t v6 = [v3 supportedStereoPairVersions],
        objc_msgSend(*(id *)(a1 + 32), "hf_backingAccessory"),
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 supportedStereoPairVersions] & v6,
        v7,
        v8))
  {
    v9 = [v3 home];
    v10 = objc_msgSend(v9, "hf_mediaSystemForAccessory:", v3);
    BOOL v11 = v10 == 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

@end