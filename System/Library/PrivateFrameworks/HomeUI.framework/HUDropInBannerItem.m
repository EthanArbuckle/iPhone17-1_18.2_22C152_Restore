@interface HUDropInBannerItem
- (DIDevice)device;
- (HMAudioAnalysisEventBulletin)eventBulletin;
- (HUDropInBannerItem)initWithHome:(id)a3;
- (HUDropInBannerItem)initWithHome:(id)a3 device:(id)a4 eventBulletin:(id)a5;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEventBulletin:(id)a3;
@end

@implementation HUDropInBannerItem

- (HUDropInBannerItem)initWithHome:(id)a3 device:(id)a4 eventBulletin:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HUDropInBannerItem.m", 24, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"HUDropInBannerItem.m", 25, @"Invalid parameter not satisfying: %@", @"device" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)HUDropInBannerItem;
  v12 = [(HUBannerItem *)&v17 initWithHome:v9];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_device, a4);
    objc_storeStrong((id *)&v13->_eventBulletin, a5);
  }

  return v13;
}

- (HUDropInBannerItem)initWithHome:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithHome_device_eventBulletin_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUDropInBannerItem.m", 37, @"%s is unavailable; use %@ instead",
    "-[HUDropInBannerItem initWithHome:]",
    v6);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(HUBannerItem *)self home];
  v6 = [(HUDropInBannerItem *)self device];
  v7 = [(HUDropInBannerItem *)self eventBulletin];
  v8 = (void *)[v4 initWithHome:v5 device:v6 eventBulletin:v7];

  [v8 copyLatestResultsFromItem:self];
  return v8;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    v7 = [(HUDropInBannerItem *)self device];
    *(_DWORD *)buf = 138412802;
    v81 = self;
    __int16 v82 = 2112;
    v83 = v6;
    __int16 v84 = 2112;
    *(void *)v85 = v7;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@ DropIn device: %@", buf, 0x20u);
  }
  v8 = [(HUDropInBannerItem *)self device];
  if ([v8 state] == 2)
  {
  }
  else
  {
    id v9 = [(HUDropInBannerItem *)self device];
    uint64_t v10 = [v9 state];

    if (v10 != 3)
    {
      v14 = 0;
      goto LABEL_10;
    }
  }
  id v11 = [(HUBannerItem *)self home];
  v12 = [(HUDropInBannerItem *)self device];
  v13 = [v12 homeKitIdentifier];
  v14 = objc_msgSend(v11, "hf_accessoryWithIdentifier:", v13);

  v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v81 = self;
    __int16 v82 = 2112;
    v83 = v16;
    __int16 v84 = 2112;
    *(void *)v85 = v14;
    _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "%@: %@ Found accessory %@", buf, 0x20u);
  }
LABEL_10:
  objc_super v17 = objc_opt_new();
  BOOL v18 = 1;
  v19 = _HULocalizedStringWithDefaultValue(@"HUDropInBanner_Title_String", @"HUDropInBanner_Title_String", 1);
  [v17 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v17 setObject:@"HUDropInBanner_Title_String" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
  if (v14)
  {
    v20 = HFLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = NSStringFromSelector(a2);
      v22 = [(HUDropInBannerItem *)self eventBulletin];
      *(_DWORD *)buf = 138412802;
      v81 = self;
      __int16 v82 = 2112;
      v83 = v21;
      __int16 v84 = 2112;
      *(void *)v85 = v22;
      _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "%@: %@ Last Known Event Bulletin: %@", buf, 0x20u);
    }
    [v17 setObject:@"Home.Banners.DropIn" forKeyedSubscript:*MEMORY[0x1E4F68928]];
    v23 = [(HUDropInBannerItem *)self eventBulletin];

    if (v23)
    {
      v24 = HFLogForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = NSStringFromSelector(a2);
        v26 = [(HUDropInBannerItem *)self eventBulletin];
        *(_DWORD *)buf = 138412802;
        v81 = self;
        __int16 v82 = 2112;
        v83 = v25;
        __int16 v84 = 2112;
        *(void *)v85 = v26;
        _os_log_impl(&dword_1BE345000, v24, OS_LOG_TYPE_DEFAULT, "%@: %@ Found last known event for accessory: %@", buf, 0x20u);
      }
      v27 = [MEMORY[0x1E4F1C9C8] now];
      v28 = [(HUDropInBannerItem *)self eventBulletin];
      v29 = [v28 startDate];

      v30 = [(HUDropInBannerItem *)self eventBulletin];
      v78 = [v30 dateOfOccurrence];

      v31 = objc_msgSend(v14, "hf_serviceNameComponents");
      uint64_t v32 = [v31 composedString];

      v33 = [(HUDropInBannerItem *)self eventBulletin];
      uint64_t v34 = [v33 state];

      v77 = (void *)v32;
      if (v34)
      {
        v35 = [(HUDropInBannerItem *)self eventBulletin];
        uint64_t v36 = [v35 state];

        if (v36 != 1)
        {
          BOOL v18 = 1;
LABEL_34:
          v62 = HFLogForCategory();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            v63 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138413570;
            v81 = self;
            __int16 v82 = 2112;
            v83 = v63;
            __int16 v84 = 1024;
            *(_DWORD *)v85 = v18;
            *(_WORD *)&v85[4] = 2112;
            *(void *)&v85[6] = v29;
            __int16 v86 = 2112;
            v87 = v78;
            __int16 v88 = 2112;
            v89 = v27;
            _os_log_impl(&dword_1BE345000, v62, OS_LOG_TYPE_DEFAULT, "%@: %@ Should hide banner?: %{BOOL}d Event start time: %@ end time: %@ vs Current time: %@", buf, 0x3Au);
          }
          v64 = (void *)MEMORY[0x1E4F42A98];
          v65 = [MEMORY[0x1E4F428B8] systemWhiteColor];
          v79[0] = v65;
          v66 = [MEMORY[0x1E4F428B8] systemRedColor];
          v79[1] = v66;
          v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:2];
          v68 = [v64 configurationWithPaletteColors:v67];

          v69 = (void *)[objc_alloc(MEMORY[0x1E4F691D0]) initWithSystemImageNamed:@"waveform.badge.magnifyingglass.circle.fill" configuration:v68];
          [v17 setObject:v69 forKeyedSubscript:*MEMORY[0x1E4F689E8]];

          goto LABEL_37;
        }
        v37 = [v78 dateByAddingTimeInterval:900.0];
        v76 = v27;
        [v27 timeIntervalSince1970];
        double v39 = v38;
        [v37 timeIntervalSince1970];
        BOOL v18 = v39 > v40;
        v41 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v29 dateStyle:0 timeStyle:1];
        id v42 = objc_alloc_init(MEMORY[0x1E4F28C00]);
        [v42 setUnitsStyle:3];
        [v42 setAllowedUnits:64];
        v75 = [v42 stringFromDate:v29 toDate:v78];
        [v78 timeIntervalSinceDate:v29];
        double v44 = v43;
        int v45 = objc_msgSend(v29, "hf_isSingularHour");
        if (v44 >= 60.0)
        {
          if (v45) {
            v60 = @"HUDropIn_Description_Alarm_Ended_SingularHour_FormatString";
          }
          else {
            v60 = @"HUDropIn_Description_Alarm_Ended_PluralHour_FormatString";
          }
          HULocalizedStringWithFormat(v60, @"%@%@%@", v46, v47, v48, v49, v50, v51, (uint64_t)v77);
        }
        else
        {
          if (v45) {
            v52 = @"HUDropIn_Description_Alarm_Ended_SingularHour_LessThanOneMin_FormatString";
          }
          else {
            v52 = @"HUDropIn_Description_Alarm_Ended_PluralHour_LessThanOneMin_FormatString";
          }
          HULocalizedStringWithFormat(v52, @"%@%@", v46, v47, v48, v49, v50, v51, (uint64_t)v77);
        v61 = };
        [v17 setObject:v61 forKeyedSubscript:*MEMORY[0x1E4F68980]];
      }
      else
      {
        v76 = v27;
        v37 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v29 dateStyle:0 timeStyle:1];
        if (objc_msgSend(v29, "hf_isSingularHour")) {
          v59 = @"HUDropIn_Description_Alarm_Started_SingularHour_FormatString";
        }
        else {
          v59 = @"HUDropIn_Description_Alarm_Started_PluralHour_FormatString";
        }
        v41 = HULocalizedStringWithFormat(v59, @"%@%@", v53, v54, v55, v56, v57, v58, v32);
        [v17 setObject:v41 forKeyedSubscript:*MEMORY[0x1E4F68980]];
        BOOL v18 = 0;
      }

      v27 = v76;
      goto LABEL_34;
    }
  }
LABEL_37:
  v70 = _HULocalizedStringWithDefaultValue(@"HUDropInBanner_ActionButton_Title_String", @"HUDropInBanner_ActionButton_Title_String", 1);
  [v17 setObject:v70 forKeyedSubscript:*MEMORY[0x1E4F68948]];

  [v17 setObject:&unk_1F19B4280 forKeyedSubscript:@"bannerItemCategory"];
  int v71 = [(HUBannerItem *)self forceShowBanner];
  v72 = [NSNumber numberWithBool:v18 & ~v71];
  [v17 setObject:v72 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  v73 = [MEMORY[0x1E4F7A0D8] futureWithResult:v17];

  return v73;
}

- (DIDevice)device
{
  return self->_device;
}

- (HMAudioAnalysisEventBulletin)eventBulletin
{
  return self->_eventBulletin;
}

- (void)setEventBulletin:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBulletin, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end