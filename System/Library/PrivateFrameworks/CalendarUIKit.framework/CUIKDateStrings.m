@interface CUIKDateStrings
+ (BOOL)supportsOverlayCalendarWithIdentifier:(id)a3;
+ (id)_cachedDateFormatterForDomain:(id)a3 calendar:(id)a4 formatterKey:(id)a5 creationBlock:(id)a6;
+ (id)_languageIDfromLocalID:(id)a3;
+ (id)_newDateFormatterForDateStyle:(unint64_t)a3 timeStyle:(unint64_t)a4 calendar:(id)a5;
+ (id)_newDateFormatterForFormat:(id)a3 calendar:(id)a4;
+ (id)_newDateFormatterForTemplate:(id)a3 calendar:(id)a4;
+ (id)_significantLocaleComponents:(id)a3;
+ (id)_zodiacSymbolForDate:(id)a3 inCalendar:(id)a4;
+ (id)cachedDateFormatterForDateStyle:(unint64_t)a3 timeStyle:(unint64_t)a4 calendar:(id)a5;
+ (id)cachedDateFormatterForFormat:(id)a3 calendar:(id)a4;
+ (id)cachedDateFormatterForTemplate:(id)a3 calendar:(id)a4;
+ (id)longStringForDate:(id)a3 inCalendar:(id)a4;
+ (id)mediumStringForDate:(id)a3 inCalendar:(id)a4;
+ (id)monthDayStringForDate:(id)a3 inCalendar:(id)a4;
+ (id)monthStringForDate:(id)a3 inCalendar:(id)a4;
+ (id)overlayCalendarPickerDisplayNameForCalendarWithIdentifier:(id)a3;
+ (id)overlayDayNumberStringForDate:(id)a3 inCalendar:(id)a4;
+ (id)overlayFirstDayOfLunarMonthLocalizedStringInCalendar:(id)a3;
+ (id)overlayLocalizedStringForKey:(id)a3 calendar:(id)a4;
+ (id)overlayMediumStringForDate:(id)a3 inCalendar:(id)a4;
+ (id)overlayShortStringForDate:(id)a3 inCalendar:(id)a4;
+ (id)overlayYearStringForDate:(id)a3 inCalendar:(id)a4;
+ (id)stylizedTimelineHourStringForHourDate:(id)a3 baseFontSize:(double)a4;
+ (id)yearMonthDayStringForDate:(id)a3 inCalendar:(id)a4;
+ (id)yearMonthStringForDate:(id)a3 inCalendar:(id)a4;
+ (id)yearStringForDate:(id)a3 inCalendar:(id)a4;
+ (unint64_t)overlayCalendarTypeForCalendarIdentifier:(id)a3;
@end

@implementation CUIKDateStrings

void __70__CUIKDateStrings_stylizedTimelineHourStringForHourDate_baseFontSize___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v14 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F1C378]];
  v7 = [*(id *)(a1 + 32) string];
  v8 = objc_msgSend(v7, "substringWithRange:", a3, a4);

  if ([v14 hasPrefix:@"a"])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v8);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
    goto LABEL_7;
  }
  v9 = [v14 lowercaseString];
  if ([v9 hasPrefix:@"h"])
  {

LABEL_6:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v8);
    goto LABEL_7;
  }
  v10 = [v14 lowercaseString];
  int v11 = [v10 hasPrefix:@"k"];

  if (v11) {
    goto LABEL_6;
  }
  v12 = [v8 stringByTrimmingWhitespaceAndRemovingNewlines];
  char v13 = [v12 isEqual:&stru_1F187C430];

  if ((v13 & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v8];
  }
LABEL_7:
}

void __70__CUIKDateStrings_stylizedTimelineHourStringForHourDate_baseFontSize___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v18 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F1C378]];
  v7 = [*(id *)(a1 + 32) string];
  v8 = objc_msgSend(v7, "substringWithRange:", a3, a4);

  if ([v18 hasPrefix:@"a"])
  {
    uint64_t v9 = *(void *)(a1 + 48);
LABEL_7:
    uint64_t v13 = *(void *)(v9 + 8);
    *(void *)(v13 + 32) = a3;
    *(void *)(v13 + 40) = a4;
    goto LABEL_8;
  }
  v10 = [v18 lowercaseString];
  if ([v10 hasPrefix:@"h"])
  {

LABEL_6:
    uint64_t v9 = *(void *)(a1 + 56);
    goto LABEL_7;
  }
  int v11 = [v18 lowercaseString];
  int v12 = [v11 hasPrefix:@"k"];

  if (v12) {
    goto LABEL_6;
  }
  id v14 = [v8 stringByTrimmingWhitespaceAndRemovingNewlines];
  char v15 = [v14 isEqual:&stru_1F187C430];

  if ((v15 & 1) == 0)
  {
    v16 = *(void **)(a1 + 40);
    v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3, a4);
    [v16 addObject:v17];
  }
LABEL_8:
}

+ (id)stylizedTimelineHourStringForHourDate:(id)a3 baseFontSize:(double)a4
{
  v129[2] = *MEMORY[0x1E4F143B8];
  id v69 = a3;
  v68 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"GMT"];
  if ([MEMORY[0x1E4F576C8] uses24HourTime])
  {
    v5 = [v69 localizedStringWithFormat:*MEMORY[0x1E4F57568] timeZone:v68];
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v5];
    uint64_t v7 = [v5 length];
    v128[0] = *MEMORY[0x1E4FB06F8];
    v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:floor(a4)];
    v129[0] = v8;
    v128[1] = *MEMORY[0x1E4FB0700];
    uint64_t v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v129[1] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v129 forKeys:v128 count:2];

    objc_msgSend(v6, "setAttributes:range:", v10, 0, v7);
  }
  else
  {
    v5 = [MEMORY[0x1E4F576C8] timelineHourDateFormatter];
    int v11 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [v5 setTimeZone:v11];

    int v12 = [v5 _attributedStringWithFieldsFromDate:v69];
    uint64_t v13 = (void *)[v12 mutableCopy];

    uint64_t v105 = 0;
    v106 = &v105;
    uint64_t v107 = 0x3032000000;
    v108 = __Block_byref_object_copy__13;
    v109 = __Block_byref_object_dispose__13;
    id v110 = 0;
    v103[0] = 0;
    v103[1] = v103;
    v103[2] = 0x3032000000;
    v103[3] = __Block_byref_object_copy__13;
    v103[4] = __Block_byref_object_dispose__13;
    id v104 = 0;
    id v14 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v99 = 0;
    v100 = &v99;
    uint64_t v101 = 0x2020000000;
    uint64_t v102 = -1;
    uint64_t v15 = [v13 length];
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __70__CUIKDateStrings_stylizedTimelineHourStringForHourDate_baseFontSize___block_invoke;
    v93[3] = &unk_1E636B0C8;
    id v16 = v13;
    id v94 = v16;
    v96 = &v105;
    v97 = &v99;
    v98 = v103;
    id v67 = v14;
    id v95 = v67;
    objc_msgSend(v16, "enumerateAttributesInRange:options:usingBlock:", 0, v15, 0, v93);
    if (([(id)v106[5] isEqual:@"AM"] & 1) != 0
      || [(id)v106[5] isEqual:@"PM"])
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4FB0870]);
      objc_msgSend(v17, "setBounds:", 0.0, 0.0, 2.0, 0.0);
      id v18 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v17];
      [v16 insertAttributedString:v18 atIndex:v100[3]];
    }
    uint64_t v88 = 0;
    v89 = &v88;
    uint64_t v90 = 0x3010000000;
    v91 = &unk_1BE0B4516;
    long long v92 = xmmword_1BE0794D0;
    uint64_t v83 = 0;
    v84 = &v83;
    uint64_t v85 = 0x3010000000;
    v86 = &unk_1BE0B4516;
    long long v87 = xmmword_1BE0794D0;
    v19 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v20 = [v16 length];
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __70__CUIKDateStrings_stylizedTimelineHourStringForHourDate_baseFontSize___block_invoke_2;
    v78[3] = &unk_1E636B0F0;
    id v21 = v16;
    id v79 = v21;
    v81 = &v83;
    v82 = &v88;
    id v22 = v19;
    id v80 = v22;
    objc_msgSend(v21, "enumerateAttributesInRange:options:usingBlock:", 0, v20, 0, v78);
    v65 = v22;
    if (v89[4] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v23 = [MEMORY[0x1E4FB08E0] systemFontOfSize:floor(a4) weight:*MEMORY[0x1E4FB09D0]];
      uint64_t v24 = *MEMORY[0x1E4FB06F8];
      v66 = (void *)v23;
      v112[0] = v23;
      uint64_t v25 = *MEMORY[0x1E4FB0700];
      v111[0] = v24;
      v111[1] = v25;
      v26 = objc_msgSend(MEMORY[0x1E4FB1618], "cuik_timelineHourColor");
      v112[1] = v26;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:v111 count:2];

      objc_msgSend(v21, "setAttributes:range:", v27, 0, objc_msgSend(v21, "length"));
    }
    else
    {
      uint64_t v28 = objc_msgSend(MEMORY[0x1E4FB1618], "cuik_timelineHourColor");
      uint64_t v59 = *MEMORY[0x1E4FB0700];
      uint64_t v126 = *MEMORY[0x1E4FB0700];
      uint64_t v127 = v28;
      v66 = (void *)v28;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v127 forKeys:&v126 count:1];
      uint64_t v29 = v89[4];
      if (v29 != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(v21, "addAttributes:range:", v27, v29, v89[5]);
      }
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v30 = v22;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v74 objects:v125 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v75;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v75 != v32) {
              objc_enumerationMutation(v30);
            }
            uint64_t v34 = [*(id *)(*((void *)&v74 + 1) + 8 * i) rangeValue];
            objc_msgSend(v21, "addAttributes:range:", v27, v34, v35);
          }
          uint64_t v31 = [v30 countByEnumeratingWithState:&v74 objects:v125 count:16];
        }
        while (v31);
      }

      uint64_t v36 = [MEMORY[0x1E4FB08E0] systemFontOfSize:floor(a4 * 1.36363636)];
      uint64_t v37 = objc_msgSend(MEMORY[0x1E4FB08E0], "cuik_createFontFromFont:withFontGrade:", v36, 2);
      uint64_t v38 = *MEMORY[0x1E4FB06F8];
      uint64_t v123 = *MEMORY[0x1E4FB06F8];
      v58 = (void *)v37;
      uint64_t v124 = v37;
      v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v124 forKeys:&v123 count:1];
      uint64_t v39 = v89[4];
      if (v39 != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(v21, "addAttributes:range:", v61, v39, v89[5]);
      }
      v64 = objc_msgSend(MEMORY[0x1E4FB08E0], "cuik_preferredTightLeadingFontForTextStyle:", *MEMORY[0x1E4FB28E0]);
      uint64_t v40 = *MEMORY[0x1E4FB0960];
      v121[0] = *MEMORY[0x1E4FB0968];
      v121[1] = v40;
      v122[0] = &unk_1F18920F0;
      v122[1] = &unk_1F1892108;
      v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v122 forKeys:v121 count:2];
      v41 = [v64 fontDescriptor];
      uint64_t v119 = *MEMORY[0x1E4FB0910];
      v118 = v63;
      v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v118 count:1];
      v120 = v42;
      v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v120 forKeys:&v119 count:1];
      v62 = [v41 fontDescriptorByAddingAttributes:v43];

      v44 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v62 size:floor(a4)];
      uint64_t v116 = v59;
      v45 = objc_msgSend(MEMORY[0x1E4FB1618], "cuik_timelineDesignatorColor");
      v117 = v45;
      v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];

      uint64_t v46 = v84[4];
      if (v46 != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(v21, "addAttributes:range:", v60, v46, v84[5]);
      }
      uint64_t v114 = v38;
      v115 = v44;
      v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
      uint64_t v48 = v84[4];
      if (v48 != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(v21, "addAttributes:range:", v47, v48, v84[5]);
      }
      v49 = (void *)v36;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v50 = v30;
      uint64_t v51 = [v50 countByEnumeratingWithState:&v70 objects:v113 count:16];
      if (v51)
      {
        uint64_t v52 = *(void *)v71;
        do
        {
          for (uint64_t j = 0; j != v51; ++j)
          {
            if (*(void *)v71 != v52) {
              objc_enumerationMutation(v50);
            }
            uint64_t v54 = [*(id *)(*((void *)&v70 + 1) + 8 * j) rangeValue];
            objc_msgSend(v21, "addAttributes:range:", v47, v54, v55);
          }
          uint64_t v51 = [v50 countByEnumeratingWithState:&v70 objects:v113 count:16];
        }
        while (v51);
      }
    }
    v56 = v80;
    id v6 = v21;

    _Block_object_dispose(&v83, 8);
    _Block_object_dispose(&v88, 8);

    _Block_object_dispose(&v99, 8);
    _Block_object_dispose(v103, 8);

    _Block_object_dispose(&v105, 8);
  }

  return v6;
}

+ (id)longStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 cachedDateFormatterForDateStyle:3 timeStyle:0 calendar:a4];
  v8 = [v7 stringFromDate:v6];

  return v8;
}

+ (id)cachedDateFormatterForDateStyle:(unint64_t)a3 timeStyle:(unint64_t)a4 calendar:(id)a5
{
  id v8 = a5;
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lu:%lu", a3, a4);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__CUIKDateStrings_cachedDateFormatterForDateStyle_timeStyle_calendar___block_invoke;
  v13[3] = &unk_1E636B0A0;
  unint64_t v16 = a3;
  unint64_t v17 = a4;
  id v14 = v8;
  id v15 = a1;
  id v10 = v8;
  int v11 = [a1 _cachedDateFormatterForDomain:@"com.apple.calendarUIKit.dateStrings.formattersByStyles" calendar:v10 formatterKey:v9 creationBlock:v13];

  return v11;
}

+ (id)_cachedDateFormatterForDomain:(id)a3 calendar:(id)a4 formatterKey:(id)a5 creationBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = (void (**)(void))a6;
  uint64_t v13 = [MEMORY[0x1E4F29060] currentThread];
  id v14 = [v13 threadDictionary];

  id v15 = [v14 objectForKeyedSubscript:v9];
  if (!v15)
  {
    id v15 = objc_opt_new();
    [v14 setObject:v15 forKeyedSubscript:v9];
  }
  unint64_t v16 = [v10 timeZone];
  unint64_t v17 = [v15 objectForKey:v16];

  if (!v17)
  {
    unint64_t v17 = objc_opt_new();
    id v18 = [v10 timeZone];
    [v15 setObject:v17 forKey:v18];
  }
  v19 = [v17 objectForKey:v10];
  if (!v19)
  {
    v19 = objc_opt_new();
    [v17 setObject:v19 forKey:v10];
  }
  uint64_t v20 = [v19 objectForKey:v11];
  if (!v20)
  {
    uint64_t v20 = v12[2](v12);
    [v19 setObject:v20 forKey:v11];
  }

  return v20;
}

id __70__CUIKDateStrings_cachedDateFormatterForDateStyle_timeStyle_calendar___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 40) _newDateFormatterForDateStyle:*(void *)(a1 + 48) timeStyle:*(void *)(a1 + 56) calendar:*(void *)(a1 + 32)];

  return v1;
}

+ (id)_newDateFormatterForDateStyle:(unint64_t)a3 timeStyle:(unint64_t)a4 calendar:(id)a5
{
  id v7 = a5;
  id v8 = objc_opt_new();
  id v9 = [v7 locale];
  [v8 setLocale:v9];

  [v8 setCalendar:v7];
  [v8 setDateStyle:a3];
  [v8 setTimeStyle:a4];
  id v10 = [v7 timeZone];

  [v8 setTimeZone:v10];
  return v8;
}

+ (id)_newDateFormatterForFormat:(id)a3 calendar:(id)a4
{
  id v6 = a3;
  id v7 = (void *)[a1 _newDateFormatterForDateStyle:4 timeStyle:4 calendar:a4];
  [v7 setDateFormat:v6];

  return v7;
}

+ (id)_newDateFormatterForTemplate:(id)a3 calendar:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28C10];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 locale];
  id v10 = [v6 dateFormatFromTemplate:v8 options:0 locale:v9];

  id v11 = (void *)[a1 _newDateFormatterForFormat:v10 calendar:v7];
  return v11;
}

+ (id)cachedDateFormatterForFormat:(id)a3 calendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__CUIKDateStrings_cachedDateFormatterForFormat_calendar___block_invoke;
  v12[3] = &unk_1E636B078;
  id v14 = v7;
  id v15 = a1;
  id v13 = v6;
  id v8 = v7;
  id v9 = v6;
  id v10 = [a1 _cachedDateFormatterForDomain:@"com.apple.calendarUIKit.dateStrings.formattersByFormat" calendar:v8 formatterKey:v9 creationBlock:v12];

  return v10;
}

id __57__CUIKDateStrings_cachedDateFormatterForFormat_calendar___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 48) _newDateFormatterForFormat:*(void *)(a1 + 32) calendar:*(void *)(a1 + 40)];

  return v1;
}

+ (id)cachedDateFormatterForTemplate:(id)a3 calendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__CUIKDateStrings_cachedDateFormatterForTemplate_calendar___block_invoke;
  v12[3] = &unk_1E636B078;
  id v14 = v7;
  id v15 = a1;
  id v13 = v6;
  id v8 = v7;
  id v9 = v6;
  id v10 = [a1 _cachedDateFormatterForDomain:@"com.apple.calendarUIKit.dateStrings.formattersByTemplate" calendar:v8 formatterKey:v9 creationBlock:v12];

  return v10;
}

id __59__CUIKDateStrings_cachedDateFormatterForTemplate_calendar___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 48) _newDateFormatterForTemplate:*(void *)(a1 + 32) calendar:*(void *)(a1 + 40)];

  return v1;
}

+ (id)yearStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6 = a3;
  id v7 = [a1 cachedDateFormatterForTemplate:@"y" calendar:a4];
  id v8 = [v7 stringFromDate:v6];

  return v8;
}

+ (id)yearMonthStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6 = a3;
  id v7 = [a1 cachedDateFormatterForTemplate:@"yMMMM" calendar:a4];
  id v8 = [v7 stringFromDate:v6];

  return v8;
}

+ (id)yearMonthDayStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6 = a3;
  id v7 = [a1 cachedDateFormatterForTemplate:@"UMMMd" calendar:a4];
  id v8 = [v7 stringFromDate:v6];

  return v8;
}

+ (id)monthStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6 = a3;
  id v7 = [a1 cachedDateFormatterForTemplate:@"MMM" calendar:a4];
  id v8 = [v7 stringFromDate:v6];

  return v8;
}

+ (id)monthDayStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6 = a3;
  id v7 = [a1 cachedDateFormatterForTemplate:@"MMMd" calendar:a4];
  id v8 = [v7 stringFromDate:v6];

  return v8;
}

+ (id)mediumStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6 = a3;
  id v7 = [a1 cachedDateFormatterForDateStyle:2 timeStyle:0 calendar:a4];
  id v8 = [v7 stringFromDate:v6];

  return v8;
}

+ (unint64_t)overlayCalendarTypeForCalendarIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F1C2F0]])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1C320]])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1C340]])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F1C350]])
  {
    unint64_t v4 = 4;
  }
  else
  {
    v5 = +[CUIKLogSubsystem dateStrings];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[CUIKDateStrings overlayCalendarTypeForCalendarIdentifier:]((uint64_t)v3, v5);
    }

    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)_significantLocaleComponents:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:a3];
  unint64_t v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = *MEMORY[0x1E4F1C470];
  v19[0] = *MEMORY[0x1E4F1C438];
  v19[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1C498];
  v19[2] = *MEMORY[0x1E4F1C400];
  v19[3] = v6;
  id v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 4, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v13 = [v3 objectForKey:v12];
        if (v13) {
          [v4 setObject:v13 forKey:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v9);
  }

  return v4;
}

+ (id)_languageIDfromLocalID:(id)a3
{
  id v3 = [a1 _significantLocaleComponents:a3];
  unint64_t v4 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v3];
  uint64_t v5 = [v3 objectForKey:*MEMORY[0x1E4F1C438]];
  int v6 = [v5 isEqualToString:@"zh"];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA20] addLikelySubtagsForLocaleIdentifier:v4];

    unint64_t v4 = (void *)v7;
  }
  uint64_t v8 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v4];

  return v8;
}

+ (id)overlayLocalizedStringForKey:(id)a3 calendar:(id)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [a4 locale];
  uint64_t v8 = [v7 localeIdentifier];

  uint64_t v9 = [a1 _languageIDfromLocalID:v8];
  uint64_t v10 = CUIKBundle();
  id v11 = [v10 preferredLocalizations];
  uint64_t v12 = [v11 firstObject];

  id v13 = CUIKBundle();
  id v14 = [v13 localizations];

  long long v15 = (void *)MEMORY[0x1E4F28B50];
  v22[0] = v9;
  v22[1] = v12;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  long long v17 = [v15 preferredLocalizationsFromArray:v14 forPreferences:v16];

  long long v18 = CUIKBundle();
  v19 = [v17 firstObject];
  uint64_t v20 = [v18 localizedStringForKey:v6 value:0 table:0 localization:v19];

  return v20;
}

+ (BOOL)supportsOverlayCalendarWithIdentifier:(id)a3
{
  return [a1 overlayCalendarTypeForCalendarIdentifier:a3] != 0;
}

+ (id)overlayFirstDayOfLunarMonthLocalizedStringInCalendar:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 calendarIdentifier];
  unint64_t v6 = [a1 overlayCalendarTypeForCalendarIdentifier:v5] - 1;
  if (v6 <= 3)
  {
    uint64_t v7 = [a1 overlayLocalizedStringForKey:off_1E636B110[v6] calendar:v4];
    if (v7) {
      goto LABEL_16;
    }
    uint64_t v8 = +[CUIKLogSubsystem dateStrings];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CUIKDateStrings overlayFirstDayOfLunarMonthLocalizedStringInCalendar:]((uint64_t)v5, v4);
    }

    switch(v6)
    {
      case 0uLL:
        uint64_t v9 = CUIKBundle();
        uint64_t v10 = v9;
        id v11 = @"First Day of Chinese Month";
        goto LABEL_8;
      case 1uLL:
        uint64_t v9 = CUIKBundle();
        uint64_t v10 = v9;
        id v11 = @"First Day of Hebrew Month";
LABEL_8:
        uint64_t v12 = &stru_1F187C430;
        goto LABEL_11;
      case 2uLL:
        uint64_t v9 = CUIKBundle();
        uint64_t v10 = v9;
        id v11 = @"First Day of Hijri-IslamicCivil Month";
        uint64_t v12 = @"First Day of Hijri Month";
        goto LABEL_11;
      case 3uLL:
        uint64_t v9 = CUIKBundle();
        uint64_t v10 = v9;
        id v11 = @"First Day of Hijri-IslamicUmmAlQura Month";
        uint64_t v12 = @"First Day of Hijri Month (Umm al-Qura)";
LABEL_11:
        uint64_t v7 = [v9 localizedStringForKey:v11 value:v12 table:0];

        if (!v7) {
          goto LABEL_12;
        }
        goto LABEL_16;
      default:
LABEL_12:
        id v13 = +[CUIKLogSubsystem dateStrings];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          +[CUIKDateStrings overlayFirstDayOfLunarMonthLocalizedStringInCalendar:]();
        }

        break;
    }
  }
  uint64_t v7 = @"First day of lunar month";
LABEL_16:

  return v7;
}

+ (id)overlayCalendarPickerDisplayNameForCalendarWithIdentifier:(id)a3
{
  id v4 = a3;
  switch([a1 overlayCalendarTypeForCalendarIdentifier:v4])
  {
    case 0:
      id v5 = v4;
      break;
    case 1:
      unint64_t v6 = CUIKBundle();
      uint64_t v7 = v6;
      uint64_t v8 = @"Chinese";
      goto LABEL_6;
    case 2:
      unint64_t v6 = CUIKBundle();
      uint64_t v7 = v6;
      uint64_t v8 = @"Hebrew";
LABEL_6:
      uint64_t v9 = &stru_1F187C430;
      goto LABEL_9;
    case 3:
      unint64_t v6 = CUIKBundle();
      uint64_t v7 = v6;
      uint64_t v8 = @"Hijri-IslamicCivil";
      uint64_t v9 = @"Hijri";
      goto LABEL_9;
    case 4:
      unint64_t v6 = CUIKBundle();
      uint64_t v7 = v6;
      uint64_t v8 = @"Hijri-IslamicUmmAlQura";
      uint64_t v9 = @"Hijri (Umm al-Qura)";
LABEL_9:
      id v5 = [v6 localizedStringForKey:v8 value:v9 table:0];

      break;
    default:
      id v5 = 0;
      break;
  }

  return v5;
}

+ (id)overlayDayNumberStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (overlayDayNumberStringForDate_inCalendar__onceToken != -1) {
    dispatch_once(&overlayDayNumberStringForDate_inCalendar__onceToken, &__block_literal_global_30);
  }
  if ((id)overlayDayNumberStringForDate_inCalendar__s_previousCalendar != v7 && (objc_msgSend(v7, "isEqual:") & 1) == 0)
  {
    [(id)overlayDayNumberStringForDate_inCalendar__s_cachedStrings removeAllObjects];
    objc_storeStrong((id *)&overlayDayNumberStringForDate_inCalendar__s_previousCalendar, a4);
  }
  uint64_t v8 = [v7 component:16 fromDate:v6];
  uint64_t v9 = [NSNumber numberWithInteger:v8];
  uint64_t v10 = [(id)overlayDayNumberStringForDate_inCalendar__s_cachedStrings objectForKey:v9];
  if (!v10)
  {
    id v11 = [a1 cachedDateFormatterForFormat:@"d" calendar:v7];
    uint64_t v10 = [v11 stringFromDate:v6];

    [(id)overlayDayNumberStringForDate_inCalendar__s_cachedStrings setObject:v10 forKey:v9];
  }

  return v10;
}

void __60__CUIKDateStrings_overlayDayNumberStringForDate_inCalendar___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)overlayDayNumberStringForDate_inCalendar__s_cachedStrings;
  overlayDayNumberStringForDate_inCalendar__s_cachedStrings = v0;
}

+ (id)overlayShortStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 component:16 fromDate:v7] == 1) {
    [a1 monthStringForDate:v7 inCalendar:v6];
  }
  else {
  uint64_t v8 = [a1 overlayDayNumberStringForDate:v7 inCalendar:v6];
  }

  return v8;
}

+ (id)overlayMediumStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 component:16 fromDate:v7] == 1) {
    [a1 monthDayStringForDate:v7 inCalendar:v6];
  }
  else {
  uint64_t v8 = [a1 overlayDayNumberStringForDate:v7 inCalendar:v6];
  }

  return v8;
}

+ (id)_zodiacSymbolForDate:(id)a3 inCalendar:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CUIKDateStrings__zodiacSymbolForDate_inCalendar___block_invoke;
  block[3] = &unk_1E6369C50;
  id v7 = v6;
  id v13 = v7;
  if (_zodiacSymbolForDate_inCalendar__onceToken != -1) {
    dispatch_once(&_zodiacSymbolForDate_inCalendar__onceToken, block);
  }
  if (_zodiacSymbolForDate_inCalendar__s_formatter)
  {
    [v7 component:4 fromDate:v5];
    int v11 = 0;
    uint64_t v8 = (void *)[[NSString alloc] initWithCharacters:v10 length:(int)udat_getSymbols()];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __51__CUIKDateStrings__zodiacSymbolForDate_inCalendar___block_invoke(uint64_t a1)
{
  int v3 = 0;
  v1 = [*(id *)(a1 + 32) locale];
  id v2 = [v1 localeIdentifier];
  [v2 UTF8String];
  _zodiacSymbolForDate_inCalendar__s_formatter = udat_open();
}

+ (id)overlayYearStringForDate:(id)a3 inCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 calendarIdentifier];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F1C2F0]];

  if (v9)
  {
    uint64_t v10 = [a1 cachedDateFormatterForFormat:@"U" calendar:v7];
    int v11 = [v10 stringFromDate:v6];

    uint64_t v12 = [a1 _zodiacSymbolForDate:v6 inCalendar:v7];
    if (v12) {
      id v13 = (__CFString *)v12;
    }
    else {
      id v13 = &stru_1F187C430;
    }
    id v14 = [NSString stringWithFormat:@"%@%@年", v11, v13];
  }
  else
  {
    id v14 = [a1 yearStringForDate:v6 inCalendar:v7];
  }

  return v14;
}

+ (void)overlayCalendarTypeForCalendarIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_ERROR, "Unexpected overlay calendar: '%@'", (uint8_t *)&v2, 0xCu);
}

+ (void)overlayFirstDayOfLunarMonthLocalizedStringInCalendar:.cold.1()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA20] currentLocale];
  v1 = [v0 localeIdentifier];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3(&dword_1BDF08000, v2, v3, "Fallback string missing for first-day-of-month string for calendar: '%@', locale: '%@'", v4, v5, v6, v7, v8);
}

+ (void)overlayFirstDayOfLunarMonthLocalizedStringInCalendar:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 locale];
  uint64_t v3 = [v2 localeIdentifier];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3(&dword_1BDF08000, v4, v5, "Localization missing for first-day-of-month string for calendar: '%@', locale: '%@'", v6, v7, v8, v9, v10);
}

+ (void)_zodiacSymbolForDate:(UErrorCode *)a1 inCalendar:.cold.1(UErrorCode *a1)
{
  u_errorName(*a1);
  OUTLINED_FUNCTION_2_0(&dword_1BDF08000, v1, v2, "Error getting zodiac symbol: %s", v3, v4, v5, v6, 2u);
}

void __51__CUIKDateStrings__zodiacSymbolForDate_inCalendar___block_invoke_cold_1(UErrorCode *a1)
{
  u_errorName(*a1);
  OUTLINED_FUNCTION_2_0(&dword_1BDF08000, v1, v2, "Error creating zodiac formatter: %s", v3, v4, v5, v6, 2u);
}

@end