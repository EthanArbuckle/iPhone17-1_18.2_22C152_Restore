@interface HFUnreachableStatusItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFUnreachableStatusItem

uint64_t __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 accessory];

  if (v4 && (objc_msgSend(v3, "hf_isLegacyService") & 1) == 0)
  {
    v7 = [v3 accessory];
    int v8 = [v7 isReachable];

    if (v8)
    {
      v9 = [*(id *)(a1 + 32) home];
      v10 = objc_msgSend(v9, "hf_characteristicValueManager");
      v11 = [v3 accessory];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_2;
      v14[3] = &unk_264098330;
      id v12 = v3;
      uint64_t v13 = *(void *)(a1 + 32);
      id v15 = v12;
      uint64_t v16 = v13;
      uint64_t v5 = [v10 hasCachedReadErrorForAccessory:v11 passingTest:v14];
    }
    else
    {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

BOOL __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) != 0
    || (objc_msgSend(v3, "hf_standardServices"),
        v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        v5)
    || (objc_msgSend(v3, "hf_isBridge") & 1) != 0)
  {
    BOOL v6 = 0;
  }
  else
  {
    int v8 = objc_msgSend(v3, "hf_linkedResidentDevice");
    BOOL v6 = v8 == 0;
  }
  return v6;
}

uint64_t __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (void *)MEMORY[0x263EFFA08];
  v4 = [a2 services];
  uint64_t v5 = [v3 setWithArray:v4];
  uint64_t v6 = [v2 intersectsSet:v5];

  return v6;
}

id __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_50(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [a2 characteristics];
  v4 = [v2 setWithArray:v3];

  return v4;
}

uint64_t __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 isReachable] ^ 1;
}

uint64_t __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_7(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!objc_msgSend(v3, "hf_isHomePod")) {
    goto LABEL_8;
  }
  v4 = (void *)a1[4];
  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = [v3 services];
  v7 = [v5 setWithArray:v6];
  LODWORD(v4) = [v4 intersectsSet:v7];

  if (v4)
  {
    int v8 = (void *)a1[5];
    if (v8)
    {
      v9 = objc_msgSend(v8, "loggerActivity", 0, 0);
      os_activity_scope_enter(v9, &v20);

      v10 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = a1[6];
        *(_DWORD *)buf = 138412546;
        uint64_t v22 = v11;
        __int16 v23 = 2112;
        id v24 = v3;
        _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "%@: Service(s) unreachable for homepod accessory: %@ - excluding homepod from unreachableServiceBasedAccessories", buf, 0x16u);
      }

      os_activity_scope_leave(&v20);
    }
    else
    {
      v18 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = a1[6];
        *(_DWORD *)buf = 138412546;
        uint64_t v22 = v19;
        __int16 v23 = 2112;
        id v24 = v3;
        _os_log_impl(&dword_20B986000, v18, OS_LOG_TYPE_DEFAULT, "%@: Service(s) unreachable for homepod accessory: %@ - excluding homepod from unreachableServiceBasedAccessories", buf, 0x16u);
      }
    }
    uint64_t v12 = 0;
  }
  else
  {
LABEL_8:
    uint64_t v13 = (void *)a1[4];
    v14 = (void *)MEMORY[0x263EFFA08];
    id v15 = [v3 services];
    uint64_t v16 = [v14 setWithArray:v15];
    uint64_t v12 = [v13 intersectsSet:v16];
  }
  return v12;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v33[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = (void *)MEMORY[0x263F58190];
    v32 = @"hidden";
    v33[0] = MEMORY[0x263EFFA88];
    id v8 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
    v9 = +[HFItemUpdateOutcome outcomeWithResults:v8];
    v10 = [v7 futureWithResult:v9];
  }
  else
  {
    uint64_t v11 = [(HFStatusItem *)self home];
    int v12 = objc_msgSend(v11, "hf_shouldBlockCurrentRestrictedGuestFromHome");

    if (v12)
    {
      uint64_t v13 = (void *)MEMORY[0x263F58190];
      v30 = @"hidden";
      uint64_t v31 = MEMORY[0x263EFFA88];
      id v8 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      v14 = +[HFItemUpdateOutcome outcomeWithResults:v8];
      v10 = [v13 futureWithResult:v14];
    }
    else
    {
      id v15 = [(HFStatusItem *)self filteredServices];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke;
      v29[3] = &unk_26408E0E8;
      v29[4] = self;
      uint64_t v16 = objc_msgSend(v15, "na_filter:", v29);
      objc_initWeak(&location, self);
      v17 = (void *)MEMORY[0x263F58190];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_3;
      v23[3] = &unk_264096990;
      objc_copyWeak(&v27, &location);
      id v24 = v4;
      id v8 = v15;
      id v25 = v8;
      id v18 = v16;
      id v26 = v18;
      uint64_t v19 = [MEMORY[0x263F581B8] globalAsyncScheduler];
      os_activity_scope_state_s v20 = [v17 futureWithBlock:v23 scheduler:v19];
      v21 = [MEMORY[0x263F581B8] mainThreadScheduler];
      v10 = [v20 reschedule:v21];

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
  }

  return v10;
}

void __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_3(id *a1, void *a2)
{
  v154[1] = *MEMORY[0x263EF8340];
  id v3 = a1 + 7;
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  if (!WeakRetained)
  {
    v153 = @"hidden";
    v154[0] = MEMORY[0x263EFFA88];
    v9 = [NSDictionary dictionaryWithObjects:v154 forKeys:&v153 count:1];
    v10 = +[HFItemUpdateOutcome outcomeWithResults:v9];
    [v4 finishWithResult:v10];
    goto LABEL_51;
  }
  int v6 = [a1[4] objectForKeyedSubscript:HFItemUpdateOptionLogger];
  v7 = [WeakRetained room];
  id v8 = (void *)MEMORY[0x263EFFA08];
  v124 = v4;
  if (v7) {
    [WeakRetained room];
  }
  else {
  uint64_t v11 = [WeakRetained home];
  }
  int v12 = [v11 accessories];
  uint64_t v13 = [v8 setWithArray:v12];

  v143[0] = MEMORY[0x263EF8330];
  v143[1] = 3221225472;
  v143[2] = __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_4;
  v143[3] = &unk_26408D968;
  id v144 = a1[5];
  v14 = objc_msgSend(v13, "na_filter:", v143);
  v141[0] = MEMORY[0x263EF8330];
  v141[1] = 3221225472;
  v141[2] = __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_5;
  v141[3] = &unk_26408D968;
  id v15 = v14;
  id v142 = v15;
  objc_msgSend(v13, "na_filter:", v141);
  uint64_t v16 = v130 = a1;
  v17 = (void *)MEMORY[0x263EFFA08];
  id v18 = [WeakRetained home];
  uint64_t v19 = [v18 residentDevices];
  os_activity_scope_state_s v20 = [v17 setWithArray:v19];
  v140[0] = MEMORY[0x263EF8330];
  v140[1] = 3221225472;
  v140[2] = __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_6;
  v140[3] = &unk_264091FE8;
  v140[4] = WeakRetained;
  v21 = objc_msgSend(v20, "na_filter:", v140);

  uint64_t v22 = v15;
  v136[0] = MEMORY[0x263EF8330];
  v136[1] = 3221225472;
  v136[2] = __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_7;
  v136[3] = &unk_264098358;
  id v137 = v130[6];
  id v23 = v6;
  id v138 = v23;
  id v139 = WeakRetained;
  v132 = objc_msgSend(v22, "na_filter:", v136);
  v131 = objc_msgSend(v16, "na_filter:", &__block_literal_global_162);
  v135[0] = MEMORY[0x263EF8330];
  v135[1] = 3221225472;
  v135[2] = __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_2_11;
  v135[3] = &unk_264091FE8;
  v135[4] = WeakRetained;
  v133 = objc_msgSend(v21, "na_filter:", v135);
  v126 = v13;
  v128 = v23;
  v129 = WeakRetained;
  if (v23)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    id v24 = [v23 loggerActivity];
    os_activity_scope_enter(v24, &state);

    id v25 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = [v132 count];
      uint64_t v27 = [v22 count];
      *(_DWORD *)buf = 138413058;
      id v146 = WeakRetained;
      __int16 v147 = 2048;
      uint64_t v148 = v26;
      __int16 v149 = 2048;
      uint64_t v150 = v27;
      __int16 v151 = 2112;
      v152 = v132;
      _os_log_impl(&dword_20B986000, v25, OS_LOG_TYPE_DEFAULT, "%@: %lu of %lu service based accessories unreachable: %@", buf, 0x2Au);
    }

    os_activity_scope_leave(&state);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v28 = [v23 loggerActivity];
    os_activity_scope_enter(v28, &state);

    v29 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = [v131 count];
      uint64_t v31 = [v16 count];
      *(_DWORD *)buf = 138413058;
      id v146 = WeakRetained;
      __int16 v147 = 2048;
      uint64_t v148 = v30;
      __int16 v149 = 2048;
      uint64_t v150 = v31;
      __int16 v151 = 2112;
      v152 = v131;
      _os_log_impl(&dword_20B986000, v29, OS_LOG_TYPE_DEFAULT, "%@: %lu of %lu non-service based accessories unreachable: %@", buf, 0x2Au);
    }
    v32 = v16;

    os_activity_scope_leave(&state);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v33 = [v23 loggerActivity];
    os_activity_scope_enter(v33, &state);

    v34 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = [v133 count];
      uint64_t v36 = [v21 count];
      *(_DWORD *)buf = 138413058;
      id v146 = v129;
      __int16 v147 = 2048;
      uint64_t v148 = v35;
      __int16 v149 = 2048;
      uint64_t v150 = v36;
      __int16 v151 = 2112;
      v152 = v133;
      _os_log_impl(&dword_20B986000, v34, OS_LOG_TYPE_DEFAULT, "%@: %lu of %lu resident devices unreachable: %@", buf, 0x2Au);
    }
    v37 = v21;

    os_activity_scope_leave(&state);
  }
  else
  {
    v105 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v106 = [v132 count];
      uint64_t v107 = [v22 count];
      *(_DWORD *)buf = 138413058;
      id v146 = WeakRetained;
      __int16 v147 = 2048;
      uint64_t v148 = v106;
      __int16 v149 = 2048;
      uint64_t v150 = v107;
      __int16 v151 = 2112;
      v152 = v132;
      _os_log_impl(&dword_20B986000, v105, OS_LOG_TYPE_DEFAULT, "%@: %lu of %lu service based accessories unreachable: %@", buf, 0x2Au);
    }

    v108 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v109 = [v131 count];
      uint64_t v110 = [v16 count];
      *(_DWORD *)buf = 138413058;
      id v146 = WeakRetained;
      __int16 v147 = 2048;
      uint64_t v148 = v109;
      __int16 v149 = 2048;
      uint64_t v150 = v110;
      __int16 v151 = 2112;
      v152 = v131;
      _os_log_impl(&dword_20B986000, v108, OS_LOG_TYPE_DEFAULT, "%@: %lu of %lu non-service based accessories unreachable: %@", buf, 0x2Au);
    }
    v32 = v16;

    v111 = HFLogForCategory(0x2AuLL);
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v112 = [v133 count];
      uint64_t v113 = [v21 count];
      *(_DWORD *)buf = 138413058;
      id v146 = v129;
      __int16 v147 = 2048;
      uint64_t v148 = v112;
      __int16 v149 = 2048;
      uint64_t v150 = v113;
      __int16 v151 = 2112;
      v152 = v133;
      _os_log_impl(&dword_20B986000, v111, OS_LOG_TYPE_DEFAULT, "%@: %lu of %lu resident devices unreachable: %@", buf, 0x2Au);
    }
    v37 = v21;
  }
  v38 = [v132 setByAddingObjectsFromSet:v131];
  v39 = [MEMORY[0x263EFFA08] setWithSet:v38];
  v40 = objc_msgSend(v133, "na_map:", &__block_literal_global_16_7);
  v41 = [v39 setByAddingObjectsFromSet:v40];

  uint64_t v42 = [v132 count];
  v125 = v22;
  uint64_t v43 = [v22 count];
  uint64_t v44 = [v131 count];
  uint64_t v45 = [v32 count];
  v127 = v38;
  if ([v38 count]) {
    BOOL v46 = v42 == v43;
  }
  else {
    BOOL v46 = 0;
  }
  char v48 = !v46 || v44 != v45;
  uint64_t v49 = [v133 count];
  v50 = v37;
  uint64_t v51 = [v37 count];
  if (+[HFUtilities shouldShowReachabilityErrors])
  {
    if ([v41 count] == 1)
    {
      v52 = [v41 anyObject];
      v53 = [v129 displayNameForHomeKitObject:v52];

      v60 = HFLocalizedStringWithFormat(@"HFStatusTitleUnreachable_One", @"%@", v54, v55, v56, v57, v58, v59, (uint64_t)v53);
      v61 = v32;
      if (v128)
      {
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        v62 = [v128 loggerActivity];
        os_activity_scope_enter(v62, &state);

        v63 = HFLogForCategory(0x2AuLL);
        id WeakRetained = v129;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          v64 = [v41 anyObject];
          *(_DWORD *)buf = 138412546;
          id v146 = v129;
          __int16 v147 = 2112;
          uint64_t v148 = (uint64_t)v64;
          _os_log_impl(&dword_20B986000, v63, OS_LOG_TYPE_DEFAULT, "%@: Showing unreachable status for single HomeKit object: %@", buf, 0x16u);
        }
        os_activity_scope_leave(&state);
      }
      else
      {
        v114 = HFLogForCategory(0x2AuLL);
        id WeakRetained = v129;
        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
        {
          v115 = [v41 anyObject];
          *(_DWORD *)buf = 138412546;
          id v146 = v129;
          __int16 v147 = 2112;
          uint64_t v148 = (uint64_t)v115;
          _os_log_impl(&dword_20B986000, v114, OS_LOG_TYPE_DEFAULT, "%@: Showing unreachable status for single HomeKit object: %@", buf, 0x16u);
        }
      }

      goto LABEL_47;
    }
    if (v49 == v51) {
      char v65 = v48;
    }
    else {
      char v65 = 1;
    }
    v61 = v32;
    if (v65)
    {
      id WeakRetained = v129;
      if ((unint64_t)[v133 count] < 2 || objc_msgSend(v38, "count"))
      {
        if ((unint64_t)[v41 count] < 2)
        {
          v60 = 0;
          goto LABEL_47;
        }
        uint64_t v66 = [v41 count];
        v60 = HFLocalizedStringWithFormat(@"HFStatusTitleUnreachable_MultipleAccessories", @"%lu", v67, v68, v69, v70, v71, v72, v66);
        if (v128)
        {
          state.opaque[0] = 0;
          state.opaque[1] = 0;
          v73 = [v128 loggerActivity];
          os_activity_scope_enter(v73, &state);

          v74 = HFLogForCategory(0x2AuLL);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v75 = [v41 count];
            *(_DWORD *)buf = 138412802;
            id v146 = v129;
            __int16 v147 = 2048;
            uint64_t v148 = v75;
            __int16 v149 = 2112;
            uint64_t v150 = (uint64_t)v41;
            v76 = "%@: Showing unreachable status for %lu HomeKit objects: %@";
LABEL_44:
            _os_log_impl(&dword_20B986000, v74, OS_LOG_TYPE_DEFAULT, v76, buf, 0x20u);
            goto LABEL_45;
          }
          goto LABEL_45;
        }
        v116 = v129;
        v117 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v120 = [v41 count];
          *(_DWORD *)buf = 138412802;
          id v146 = v129;
          __int16 v147 = 2048;
          uint64_t v148 = v120;
          __int16 v149 = 2112;
          uint64_t v150 = (uint64_t)v41;
          v119 = "%@: Showing unreachable status for %lu HomeKit objects: %@";
          goto LABEL_74;
        }
      }
      else
      {
        if (v49 != v51
          || ([v129 room], v93 = objc_claimAutoreleasedReturnValue(), v93, v93))
        {
          uint64_t v94 = [v133 count];
          v60 = HFLocalizedStringWithFormat(@"HFStatusTitleUnreachable_MultipleResidentDevices", @"%lu", v95, v96, v97, v98, v99, v100, v94);
          if (!v128)
          {
            v121 = HFLogForCategory(0x2AuLL);
            if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v122 = [v133 count];
              *(_DWORD *)buf = 138412802;
              id v146 = v129;
              __int16 v147 = 2048;
              uint64_t v148 = v122;
              __int16 v149 = 2112;
              uint64_t v150 = (uint64_t)v133;
              _os_log_impl(&dword_20B986000, v121, OS_LOG_TYPE_DEFAULT, "%@: Showing unreachable status for %lu resident devices: %@", buf, 0x20u);
            }

            goto LABEL_47;
          }
          state.opaque[0] = 0;
          state.opaque[1] = 0;
          v101 = [v128 loggerActivity];
          os_activity_scope_enter(v101, &state);

          v74 = HFLogForCategory(0x2AuLL);
          if (!os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_45;
          }
          uint64_t v102 = [v133 count];
          *(_DWORD *)buf = 138412802;
          id v146 = v129;
          __int16 v147 = 2048;
          uint64_t v148 = v102;
          __int16 v149 = 2112;
          uint64_t v150 = (uint64_t)v133;
          v76 = "%@: Showing unreachable status for %lu resident devices: %@";
          goto LABEL_44;
        }
        v60 = _HFLocalizedStringWithDefaultValue(@"HFStatusTitleUnreachable_AllResidentDevices", @"HFStatusTitleUnreachable_AllResidentDevices", 1);
        if (v128)
        {
          state.opaque[0] = 0;
          state.opaque[1] = 0;
          v103 = [v128 loggerActivity];
          os_activity_scope_enter(v103, &state);

          v74 = HFLogForCategory(0x2AuLL);
          if (!os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_45;
          }
          uint64_t v104 = [v41 count];
          *(_DWORD *)buf = 138412802;
          id v146 = v129;
          __int16 v147 = 2048;
          uint64_t v148 = v104;
          __int16 v149 = 2112;
          uint64_t v150 = (uint64_t)v41;
          v76 = "%@: Showing unreachable status for all resident devices (%lu): %@";
          goto LABEL_44;
        }
        v116 = v129;
        v117 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v123 = [v41 count];
          *(_DWORD *)buf = 138412802;
          id v146 = v129;
          __int16 v147 = 2048;
          uint64_t v148 = v123;
          __int16 v149 = 2112;
          uint64_t v150 = (uint64_t)v41;
          v119 = "%@: Showing unreachable status for all resident devices (%lu): %@";
          goto LABEL_74;
        }
      }
    }
    else
    {
      v60 = _HFLocalizedStringWithDefaultValue(@"HFStatusTitleUnreachable_AllAccessories", @"HFStatusTitleUnreachable_AllAccessories", 1);
      id WeakRetained = v129;
      if (v128)
      {
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        v77 = [v128 loggerActivity];
        os_activity_scope_enter(v77, &state);

        v74 = HFLogForCategory(0x2AuLL);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v78 = [v41 count];
          *(_DWORD *)buf = 138412802;
          id v146 = v129;
          __int16 v147 = 2048;
          uint64_t v148 = v78;
          __int16 v149 = 2112;
          uint64_t v150 = (uint64_t)v41;
          v76 = "%@: Showing unreachable status for all HomeKit objects (%lu): %@";
          goto LABEL_44;
        }
LABEL_45:

        os_activity_scope_leave(&state);
        goto LABEL_47;
      }
      v116 = v129;
      v117 = HFLogForCategory(0x2AuLL);
      if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v118 = [v41 count];
        *(_DWORD *)buf = 138412802;
        id v146 = v129;
        __int16 v147 = 2048;
        uint64_t v148 = v118;
        __int16 v149 = 2112;
        uint64_t v150 = (uint64_t)v41;
        v119 = "%@: Showing unreachable status for all HomeKit objects (%lu): %@";
LABEL_74:
        _os_log_impl(&dword_20B986000, v117, OS_LOG_TYPE_DEFAULT, v119, buf, 0x20u);
      }
    }

    id WeakRetained = v116;
    goto LABEL_47;
  }
  v60 = 0;
  v61 = v32;
  id WeakRetained = v129;
LABEL_47:
  v79 = [MEMORY[0x263EFF9A0] dictionary];
  v80 = v79;
  if (v60)
  {
    v81 = [MEMORY[0x263F1C6C8] configurationWithPointSize:24.0];
    v82 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"exclamationmark.circle.fill" configuration:v81];
    [v80 setObject:v82 forKeyedSubscript:@"icon"];

    v83 = _HFLocalizedStringWithDefaultValue(@"HFStatusTitleUnreachable_One", @"HFStatusTitleUnreachable_One", 1);
    [WeakRetained shortTitleForFormat:v83];
    v85 = v84 = v61;
    [v80 setObject:v85 forKeyedSubscript:@"shortTitle"];

    v61 = v84;
    [v80 setObject:&unk_26C0F72D8 forKeyedSubscript:@"statusItemCategory"];
    [v80 setObject:v41 forKeyedSubscript:@"representedHomeKitObjects"];
    [v80 setObject:v60 forKeyedSubscript:@"title"];
    v86 = _HFLocalizedStringWithDefaultValue(@"HFStatusSortKeyAccessoryUnreachable", @"HFStatusSortKeyAccessoryUnreachable", 1);
    [v80 setObject:v86 forKeyedSubscript:@"sortKey"];

    [v80 setObject:&unk_26C0F72F0 forKeyedSubscript:@"priority"];
  }
  else
  {
    [v79 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
  }
  v87 = objc_msgSend(v130[5], "na_map:", &__block_literal_global_53_4);
  v88 = objc_msgSend(v87, "na_setByFlattening");

  v89 = [v88 setByAddingObjectsFromSet:v130[5]];
  v90 = [v89 setByAddingObjectsFromSet:v61];
  [v80 setObject:v90 forKeyedSubscript:@"dependentHomeKitObjects"];

  v91 = objc_msgSend(MEMORY[0x263F0E708], "hf_standardServiceTypes");
  [v80 setObject:v91 forKeyedSubscript:@"dependentServiceTypes"];

  v92 = +[HFItemUpdateOutcome outcomeWithResults:v80];
  [v124 finishWithResult:v92];

  id v4 = v144;
  v10 = v126;
  v9 = v128;
LABEL_51:
}

BOOL __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  int v6 = [a2 service];
  v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    v9 = [MEMORY[0x263EFFA08] set];
    v10 = [*(id *)(a1 + 40) home];
    uint64_t v11 = +[HFCharacteristicValueDisplayError errorWithUnderlyingError:v5 readTraits:v9 contextProvider:v10];

    if (v11)
    {
      int v12 = [HFSymptomResultContextProvider alloc];
      uint64_t v13 = [*(id *)(a1 + 32) accessory];
      v14 = [(HFSymptomResultContextProvider *)v12 initWithAccessory:v13 mediaSystem:0];

      id v15 = +[HFErrorResultComponent componentForDisplayError:v11 symptomContextProvider:v14];
      BOOL v8 = [v15 category] == 1;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEnabled])
  {
    id v4 = objc_msgSend(v3, "hf_linkedAccessory");
    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) room];
      if (v5)
      {
        int v6 = [*(id *)(a1 + 32) room];
        v7 = objc_msgSend(v3, "hf_linkedAccessory");
        BOOL v8 = [v7 room];
        uint64_t v9 = [v6 isEqual:v8];
      }
      else
      {
        uint64_t v9 = 1;
      }
    }
    else
    {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_2_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[HFHomeKitDispatcher sharedDispatcher];
  id v5 = [v4 homeManager];
  int v6 = [v5 hasOptedToHH2];

  if (v6)
  {
    v7 = objc_msgSend(v3, "hf_linkedAccessory");

    char v8 = [v7 isReachable];
    if (v8) {
      return 0;
    }
  }
  else
  {
    char v10 = objc_msgSend(v3, "hf_isReachable");

    if (v10) {
      return 0;
    }
  }
  uint64_t v11 = [*(id *)(a1 + 32) home];
  int v12 = objc_msgSend(v11, "hf_shouldHideResidentDeviceReachabilityIssues");

  return v12 ^ 1u;
}

id __55__HFUnreachableStatusItem__subclass_updateWithOptions___block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(v2, "hf_linkedAccessory");
  id v4 = v3;
  if (!v3) {
    id v3 = v2;
  }
  id v5 = v3;

  return v5;
}

@end