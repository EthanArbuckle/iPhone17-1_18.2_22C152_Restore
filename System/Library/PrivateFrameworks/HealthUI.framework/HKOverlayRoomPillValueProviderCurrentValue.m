@interface HKOverlayRoomPillValueProviderCurrentValue
- (HKOverlayRoomPillValueProviderCurrentValue)initWithSelectedRangeFormatter:(id)a3 interfaceLayout:(int64_t)a4;
- (HKSelectedRangeFormatter)selectedRangeFormatter;
- (id)_contextStatisticsTypeString:(id)a3;
- (id)valueFromChartPoints:(id)a3 unit:(id)a4 displayType:(id)a5 timeScope:(int64_t)a6 unitPreferenceController:(id)a7;
- (int64_t)interfaceLayout;
@end

@implementation HKOverlayRoomPillValueProviderCurrentValue

- (HKOverlayRoomPillValueProviderCurrentValue)initWithSelectedRangeFormatter:(id)a3 interfaceLayout:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKOverlayRoomPillValueProviderCurrentValue;
  v8 = [(HKOverlayRoomPillValueProviderCurrentValue *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_selectedRangeFormatter, a3);
    v9->_interfaceLayout = a4;
  }

  return v9;
}

- (id)_contextStatisticsTypeString:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = (void *)[v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    v5 = 0;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unint64_t v9 = [v8 statisticsType];
        if (v9 <= 0x18 && ((1 << v9) & 0x1007108) != 0)
        {
          id v11 = v8;

          v5 = v11;
        }
      }
      v4 = (void *)[v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
    if (v5)
    {
      v12 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartOverlaySectionItemValueAndUnitFont");
      v13 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopLabelColor");
      v14 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopLabelColor");
      v4 = +[HKSelectedRangeLabel attributedStringForSelectedRangeData:v5 font:v12 foregroundColor:v13 prefixColor:v14 prefersImageAffixes:0 embedded:1];
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (id)valueFromChartPoints:(id)a3 unit:(id)a4 displayType:(id)a5 timeScope:(int64_t)a6 unitPreferenceController:(id)a7
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  if ([v11 count])
  {
    v14 = [(HKOverlayRoomPillValueProviderCurrentValue *)self selectedRangeFormatter];
    v15 = v14;
    id v43 = v13;
    id v44 = v12;
    if (v14) {
      long long v16 = v14;
    }
    else {
      long long v16 = [[HKSelectedRangeFormatter alloc] initWithUnitPreferenceController:v13];
    }
    v45 = v16;

    v23 = [MEMORY[0x1E4F1CA48] array];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v24 = v11;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v51 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [*(id *)(*((void *)&v50 + 1) + 8 * i) userInfo];
          if ([v29 conformsToProtocol:&unk_1F3C3E850]) {
            [v23 addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v26);
    }

    v30 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartOverlaySectionItemValueAndUnitFont");
    v31 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartOverlaySectionItemValueAndUnitFont");
    uint64_t v21 = v44;
    v32 = [(HKSelectedRangeFormatter *)v45 selectedRangeDataWithChartData:v23 majorFont:v30 minorFont:v31 displayType:v44 timeScope:a6 context:1];

    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v34 = [(HKOverlayRoomPillValueProviderCurrentValue *)self _contextStatisticsTypeString:v32];
    if (v34) {
      [v33 addObject:v34];
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v35 = v32;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v47 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = [*(id *)(*((void *)&v46 + 1) + 8 * j) attributedString];
          [v33 addObject:v40];
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v37);
    }

    v41 = HKUIJoinAttributedStringsForLocaleWithSeparator(v33, @" ");
    v22 = [[HKOverlayPillValue alloc] initWithAttributedValue:v41];

    id v13 = v43;
  }
  else
  {
    long long v17 = [HKOverlayPillValue alloc];
    long long v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    long long v19 = [v18 localizedStringForKey:@"NO_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v20 = v17;
    uint64_t v21 = v12;
    v22 = [(HKOverlayPillValue *)v20 initWithValueString:v19 unitString:&stru_1F3B9CF20];
  }
  return v22;
}

- (HKSelectedRangeFormatter)selectedRangeFormatter
{
  return self->_selectedRangeFormatter;
}

- (int64_t)interfaceLayout
{
  return self->_interfaceLayout;
}

- (void).cxx_destruct
{
}

@end