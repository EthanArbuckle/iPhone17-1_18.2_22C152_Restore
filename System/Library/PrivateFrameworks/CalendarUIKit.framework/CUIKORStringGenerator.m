@interface CUIKORStringGenerator
+ (double)_defaultMinimumLineHeightForState:(id)a3;
+ (double)_minimumPrimaryFontLineHeightUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4;
+ (double)_naturalHeightForPrimaryTextUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4;
+ (double)_widthForWidestPossibleIconIncludingTrailingPadding:(id)a3 locationImageName:(id)a4;
+ (double)attributedStringMinimumLineHeightUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4;
+ (double)minNaturalTextHeightForEvent:(id)a3 usingSmallText:(BOOL)a4 sizeClass:(int64_t)a5;
+ (double)minimumNaturalHeightForPrimaryTextUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4;
+ (double)naturalHeightForPrimaryTextUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4;
+ (id)_attributedLocationWithState:(id)a3 locationImageName:(id)a4;
+ (id)_attributedStringWithSystemImageName:(id)a3 symbolAttributes:(id)a4 widthForSymbol:(double)a5 baseString:(id)a6;
+ (id)_attributedTimeWithState:(id)a3 options:(unint64_t)a4 locationImageName:(id)a5;
+ (id)_attributedTitleWithState:(id)a3;
+ (id)_defaultAttributesForState:(id)a3;
+ (void)_indentWrappingLinesAndLinesOtherThanTheFirstWithBaseParagraphStyle:(id)a3 string:(id)a4 indentAmount:(double)a5;
- (id)generateContentStringsWithState:(id)a3 options:(unint64_t)a4;
- (id)generateTrailingStringWithState:(id)a3;
- (id)generateTravelTimeStringWithState:(id)a3;
@end

@implementation CUIKORStringGenerator

+ (id)_attributedTimeWithState:(id)a3 options:(unint64_t)a4 locationImageName:(id)a5
{
  id v7 = a3;
  id v101 = a5;
  if (_bitmaskContainsOption() & 1) != 0 || ([v7 hidesTime])
  {
    v8 = 0;
    goto LABEL_19;
  }
  uint64_t v97 = [v7 secondaryTextFont];
  v9 = CUIKCalendar();
  v10 = [v7 occurrence];
  v11 = [v10 startDate];
  v12 = [v7 occurrence];
  v13 = [v12 endDate];
  char v14 = objc_msgSend(v9, "cal_isMultidayEventForUIWithStartDate:endDate:", v11, v13);

  v15 = [v7 occurrence];
  v16 = [v15 effectiveTimeZone];
  v17 = [v7 occurrence];
  v18 = [v17 startDate];
  BOOL v19 = CUIKShouldShowTimezoneClarification(v16, v18);

  v98 = v9;
  BOOL v95 = v19;
  if (v14)
  {
    int v99 = 0;
    v20 = (void *)v97;
  }
  else
  {
    v21 = [v7 occurrence];
    v22 = [v21 endTimeZone];
    v23 = [v7 occurrence];
    v24 = [v23 endDate];
    if (CUIKShouldShowTimezoneClarification(v22, v24))
    {
      v25 = [v7 occurrence];
      v26 = [v25 effectiveTimeZone];
      [v7 occurrence];
      v27 = id v93 = a1;
      v28 = [v27 endTimeZone];
      int v29 = CalEqualObjects() & v19 ^ 1;

      int v30 = v29;
      a1 = v93;
      BOOL v19 = v95;

      v9 = v98;
    }
    else
    {
      int v30 = 0;
    }
    v20 = (void *)v97;

    int v99 = v30;
    if (!v19 || (v30 & 1) != 0)
    {
      v31 = [v7 occurrence];
      v32 = [v31 startDate];
      v33 = [v7 occurrence];
      v35 = [v33 endDate];
      v36 = +[CUIKTimeIntervalTextProvider timeIntervalAttributedTextWithStartDate:v32 endDate:v35 calendar:v9 font:v97];
      v34 = (void *)[v36 mutableCopy];

      goto LABEL_13;
    }
  }
  v31 = [v7 occurrence];
  v32 = [v31 startDate];
  v33 = +[CUIKTimeTextProvider timeAttributedTextWithDate:v32 calendar:v9 font:v20 options:0];
  v34 = (void *)[v33 mutableCopy];
LABEL_13:

  v37 = [a1 _defaultAttributesForState:v7];
  v38 = [v7 timeTextColor];
  uint64_t v39 = *MEMORY[0x1E4FB0700];
  [v37 setObject:v38 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

  objc_msgSend(v34, "addAttributes:range:", v37, 0, objc_msgSend(v34, "length"));
  v40 = (void *)[v37 mutableCopy];
  v41 = [v7 timeTextColor];
  v42 = objc_msgSend(v41, "cuik_colorWithAlphaScaled:", CUIKOccurrenceLeadingIconAlphaScale(objc_msgSend(v7, "userInterfaceStyle")));
  [v40 setObject:v42 forKeyedSubscript:v39];

  uint64_t v43 = *MEMORY[0x1E4FB06F8];
  [v40 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  [a1 _widthForWidestPossibleIconIncludingTrailingPadding:v20 locationImageName:v101];
  double v45 = v44;
  v8 = objc_msgSend(a1, "_attributedStringWithSystemImageName:symbolAttributes:widthForSymbol:baseString:", @"clock.time.1009", v40, v34);
  if ((v95 | v99) == 1)
  {
    v90 = v40;
    v91 = v34;
    id v94 = a1;
    v46 = [v7 occurrence];
    v47 = [v46 effectiveTimeZone];

    v96 = (void *)[v98 copy];
    [v96 setTimeZone:v47];
    id v48 = objc_alloc(MEMORY[0x1E4F28B18]);
    v49 = [v7 occurrence];
    v50 = [v49 startDate];
    v89 = v47;
    v51 = [v47 abbreviationForDate:v50];
    v92 = (void *)[v48 initWithString:v51];

    v52 = (void *)[v37 mutableCopy];
    [v52 setObject:v20 forKeyedSubscript:v43];
    [v7 occurrence];
    if (v99) {
      v53 = {;
    }
      uint64_t v54 = [v53 endTimeZone];

      v87 = (void *)v54;
      v88 = (void *)[v98 copy];
      v55 = (void *)v54;
      [v88 setTimeZone:v54];
      id v56 = objc_alloc(MEMORY[0x1E4F28B18]);
      v57 = [v7 occurrence];
      v58 = [v57 endDate];
      v59 = [v55 abbreviationForDate:v58];
      v60 = (void *)[v56 initWithString:v59];

      v100 = v52;
      v61 = [v7 occurrence];
      v62 = [v61 startDate];
      v63 = +[CUIKTimeTextProvider timeAttributedTextWithDate:v62 calendar:v96 font:v20 options:0];

      v64 = [v7 occurrence];
      v65 = [v64 endDate];
      v86 = +[CUIKTimeTextProvider timeAttributedTextWithDate:v65 calendar:v88 font:v20 options:0];

      v66 = (void *)MEMORY[0x1E4F28B18];
      id v67 = objc_alloc(MEMORY[0x1E4F28B18]);
      v68 = CUIKBundle();
      v69 = [v68 localizedStringForKey:@"time range with multiple time zones" value:@"(%@ %@ - %@ %@)" table:0];
      v70 = (void *)[v67 initWithString:v69 attributes:v100];
      v71 = objc_msgSend(v66, "localizedAttributedStringWithFormat:", v70, v63, v92, v86, v60);

      v72 = v88;
      v73 = v87;

      v52 = v100;
    }
    else {
      v74 = {;
    }
      v75 = [v74 startDate];
      v73 = +[CUIKTimeTextProvider timeAttributedTextWithDate:v75 calendar:v96 font:v20 options:0];

      v76 = (void *)MEMORY[0x1E4F28B18];
      id v77 = objc_alloc(MEMORY[0x1E4F28B18]);
      v72 = CUIKBundle();
      v60 = [v72 localizedStringForKey:@"time range then time zone" value:@"(%@ %@)" table:0];
      v63 = objc_msgSend(v77, "initWithString:attributes:");
      v71 = objc_msgSend(v76, "localizedAttributedStringWithFormat:", v63, v73, v92);
    }

    v78 = (void *)MEMORY[0x1E4F28E48];
    id v79 = objc_alloc(MEMORY[0x1E4F28B18]);
    v80 = CUIKBundle();
    v81 = [v80 localizedStringForKey:@"time zone clarifier format %@ %@" value:@"%@ %@" table:0];
    v82 = (void *)[v79 initWithString:v81 attributes:v52];
    uint64_t v83 = objc_msgSend(v78, "localizedAttributedStringWithFormat:", v82, v8, v71);

    v8 = (void *)v83;
    a1 = v94;
    v20 = (void *)v97;
    v40 = v90;
    v34 = v91;
  }
  v84 = [v37 objectForKeyedSubscript:*MEMORY[0x1E4FB0738]];
  [a1 _indentWrappingLinesAndLinesOtherThanTheFirstWithBaseParagraphStyle:v84 string:v8 indentAmount:v45];

LABEL_19:

  return v8;
}

+ (id)_defaultAttributesForState:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 title];
  v6 = (void *)v5;
  id v7 = &stru_1F187C430;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  v8 = v7;

  v9 = [(__CFString *)v8 componentsSeparatedByString:@" "];

  LODWORD(v8) = (unint64_t)[v9 count] < 2;
  id v10 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v10 setParagraphSpacing:3.0];
  LODWORD(v11) = 1045220557;
  [v10 setHyphenationFactor:v11];
  [a1 _defaultMinimumLineHeightForState:v4];
  objc_msgSend(v10, "setMinimumLineHeight:");
  [v10 setLineBreakMode:4 * v8];
  uint64_t v12 = *MEMORY[0x1E4FB0710];
  v17[0] = *MEMORY[0x1E4FB0738];
  v17[1] = v12;
  v18[0] = v10;
  v18[1] = &unk_1F1892240;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  char v14 = (void *)[v13 mutableCopy];

  if (([v4 isCancelled] & 1) != 0 || objc_msgSend(v4, "isDeclined"))
  {
    [v14 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4FB0768]];
    v15 = [v4 strikethroughColor];
    [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4FB0760]];
  }

  return v14;
}

+ (double)_defaultMinimumLineHeightForState:(id)a3
{
  int v3 = [a3 usesSmallText];
  double result = 9.0;
  if (v3) {
    return 8.0;
  }
  return result;
}

+ (void)_indentWrappingLinesAndLinesOtherThanTheFirstWithBaseParagraphStyle:(id)a3 string:(id)a4 indentAmount:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)[v7 mutableCopy];
  [v9 setHeadIndent:a5];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 1;
  id v10 = [v8 string];
  double v11 = [v8 string];
  uint64_t v12 = [v11 length];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __113__CUIKORStringGenerator__indentWrappingLinesAndLinesOtherThanTheFirstWithBaseParagraphStyle_string_indentAmount___block_invoke;
  v15[3] = &unk_1E636AC90;
  v18 = v20;
  id v13 = v9;
  id v16 = v13;
  double v19 = a5;
  id v14 = v8;
  id v17 = v14;
  objc_msgSend(v10, "enumerateSubstringsInRange:options:usingBlock:", 0, v12, 0, v15);

  _Block_object_dispose(v20, 8);
}

+ (id)_attributedTitleWithState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 title];
  v6 = (void *)v5;
  id v7 = &stru_1F187C430;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  id v8 = v7;

  v9 = [a1 _defaultAttributesForState:v4];
  id v10 = [v4 primaryTextFont];
  uint64_t v11 = *MEMORY[0x1E4FB06F8];
  [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  uint64_t v12 = [v4 titleTextColor];
  [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

  id v13 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  if ([v4 needsReply] && (objc_msgSend(v4, "isCancelled") & 1) == 0)
  {
    id v14 = (void *)MEMORY[0x1E4FB0870];
    v15 = [v9 objectForKeyedSubscript:v11];
    id v16 = +[CUIKORImageUtils scaledCalendarInvitationDotForFont:v15];
    id v17 = objc_msgSend(v14, "cuik_textAttachmentWithImage:", v16);

    v18 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v17];
    [v13 appendAttributedString:v18];
  }
  double v19 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8];

  [v13 appendAttributedString:v19];
  objc_msgSend(v13, "addAttributes:range:", v9, 0, objc_msgSend(v13, "length"));

  return v13;
}

- (id)generateContentStringsWithState:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 locationImageName];
  id v8 = [(id)objc_opt_class() _attributedTitleWithState:v6];
  v9 = (void *)[v8 mutableCopy];
  [v6 textSpace];
  double v11 = v10;
  char v12 = [v6 isAllDay];
  id v13 = [v6 primaryTextFont];
  double v15 = [(UIFont *)v13 cuik_lineHeight];

  id v16 = [v6 secondaryTextFont];
  double v18 = [(UIFont *)v16 cuik_lineHeight];

  double v19 = objc_alloc_init(CUIKORContentStrings);
  [(CUIKORContentStrings *)v19 setTitleString:v8];
  v20 = [(CUIKORStringGenerator *)self generateTrailingStringWithState:v6];
  [(CUIKORContentStrings *)v19 setTrailingString:v20];

  if ((v12 & 1) == 0)
  {
    if (v11 >= v15 + v18)
    {
      v23 = [(id)objc_opt_class() _attributedTimeWithState:v6 options:a4 locationImageName:v7];
      int v30 = [(id)objc_opt_class() _attributedLocationWithState:v6 locationImageName:v7];
      [(CUIKORContentStrings *)v19 setTimeString:v23];
      [(CUIKORContentStrings *)v19 setLocationString:v30];
      uint64_t v35 = [v30 length];
      uint64_t v36 = [v23 length];
      if (v35)
      {
        v37 = objc_msgSend(v30, "attributesAtIndex:effectiveRange:", objc_msgSend(v30, "length") - 1, 0);
        v38 = v7;
        uint64_t v39 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n" attributes:v37];
        [v9 appendAttributedString:v39];

        id v7 = v38;
        [v9 appendAttributedString:v30];
      }
      if (!v36) {
        goto LABEL_10;
      }
      v31 = objc_msgSend(v23, "attributesAtIndex:effectiveRange:", objc_msgSend(v23, "length") - 1, 0);
      v40 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n" attributes:v31];
      [v9 appendAttributedString:v40];

      [v9 appendAttributedString:v23];
    }
    else
    {
      char v21 = [v6 location];
      uint64_t v22 = [v21 length];

      if (!v22) {
        goto LABEL_11;
      }
      v23 = [(id)objc_opt_class() _defaultAttributesForState:v6];
      v24 = [v6 secondaryTextFont];
      uint64_t v25 = *MEMORY[0x1E4FB06F8];
      [v23 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

      v26 = [v6 locationTextColor];
      v27 = objc_msgSend(v26, "cuik_colorWithAlphaScaled:", CUIKOccurrenceLeadingIconAlphaScale(objc_msgSend(v6, "userInterfaceStyle")));
      [v23 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

      v28 = (void *)MEMORY[0x1E4FB1830];
      int v29 = [v23 objectForKeyedSubscript:v25];
      int v30 = objc_msgSend(v28, "cuik_configurationWithFont:scale:", v29, 1);

      v31 = objc_msgSend(MEMORY[0x1E4FB1818], "cuik_privateSystemImageNamed:withConfiguration:", v7, v30);
      v32 = objc_msgSend(MEMORY[0x1E4FB0870], "cuik_textAttachmentWithImage:", v31);
      [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v32 attributes:v23];
      v33 = v42 = v7;
      v34 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" " attributes:v23];
      [v9 appendAttributedString:v34];

      [v9 appendAttributedString:v33];
      id v7 = v42;
    }
LABEL_10:
  }
LABEL_11:
  [(CUIKORContentStrings *)v19 setCombinedString:v9];

  return v19;
}

+ (id)_attributedStringWithSystemImageName:(id)a3 symbolAttributes:(id)a4 widthForSymbol:(double)a5 baseString:(id)a6
{
  v9 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v10 = *MEMORY[0x1E4FB06F8];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v12 objectForKeyedSubscript:v10];
  int v30 = objc_msgSend(v9, "cuik_configurationWithFont:scale:", v14, 1);

  double v15 = objc_msgSend(MEMORY[0x1E4FB1818], "cuik_privateSystemImageNamed:withConfiguration:", v13, v30);

  id v16 = objc_msgSend(MEMORY[0x1E4FB0870], "cuik_textAttachmentWithImage:", v15);
  [v15 size];
  double v18 = v17;
  double v19 = [v12 objectForKeyedSubscript:v10];
  [v19 capHeight];
  *(float *)&double v20 = v20 - v18;
  double v21 = (float)(roundf(*(float *)&v20) * 0.5);
  [v15 size];
  objc_msgSend(v16, "setBounds:", 0.0, v21, v22, v18);
  v23 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v16];
  id v24 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  [v15 size];
  objc_msgSend(v24, "setBounds:", 0.0, 0.0, a5 - v25, 0.0);
  v26 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v24];
  v27 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"⁠"];
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v23];
  [v28 appendAttributedString:v27];
  [v28 appendAttributedString:v26];
  [v28 appendAttributedString:v27];
  objc_msgSend(v28, "addAttributes:range:", v12, 0, objc_msgSend(v28, "length"));

  [v28 appendAttributedString:v11];

  return v28;
}

+ (double)_widthForWidestPossibleIconIncludingTrailingPadding:(id)a3 locationImageName:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4FB1830];
  id v6 = a4;
  id v7 = objc_msgSend(v5, "cuik_configurationWithFont:scale:", a3, 1);
  id v8 = objc_msgSend(MEMORY[0x1E4FB1818], "cuik_privateSystemImageNamed:withConfiguration:", v6, v7);

  [v8 size];
  double v10 = v9;
  +[CUIKORImageUtils iconToTextPadding];
  double v12 = v10 + v11;

  return v12;
}

- (id)generateTrailingStringWithState:(id)a3
{
  id v3 = a3;
  id v4 = [v3 moreText];
  if (v4)
  {
    uint64_t v5 = +[CUIKInterface shared];
    BOOL v6 = [v5 layoutDirectionOrOverride] == 0;

    id v7 = +[CUIKORStringGenerator _defaultAttributesForState:v3];
    id v8 = [v3 primaryTextFont];
    [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

    double v9 = [v3 moreTextColor];
    [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

    double v10 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
    double v11 = (void *)[v10 mutableCopy];

    [v11 setAlignment:2 * v6];
    [v7 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4FB0738]];
    double v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4 attributes:v7];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

void __113__CUIKORStringGenerator__indentWrappingLinesAndLinesOtherThanTheFirstWithBaseParagraphStyle_string_indentAmount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double v7 = 0.0;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    double v7 = *(double *)(a1 + 56);
  }
  [*(id *)(a1 + 32) setFirstLineHeadIndent:v7];
  uint64_t v8 = *MEMORY[0x1E4FB0738];
  double v9 = *(void **)(a1 + 40);
  double v10 = (void *)[*(id *)(a1 + 32) copy];
  objc_msgSend(v9, "addAttribute:value:range:", v8, v10, a3, a4);

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
}

+ (id)_attributedLocationWithState:(id)a3 locationImageName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 location];
  if (v8)
  {
    double v9 = [v6 location];
    double v10 = (void *)[v9 mutableCopy];
  }
  else
  {
    double v10 = 0;
  }

  if ([v10 length])
  {
    double v11 = [a1 _defaultAttributesForState:v6];
    double v12 = [v6 secondaryTextFont];
    uint64_t v13 = *MEMORY[0x1E4FB06F8];
    [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

    id v14 = [v6 locationTextColor];
    uint64_t v15 = *MEMORY[0x1E4FB0700];
    [v11 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

    objc_msgSend(v10, "addAttributes:range:", v11, 0, objc_msgSend(v10, "length"));
    id v16 = (void *)[v11 mutableCopy];
    double v17 = [v6 locationTextColor];
    double v18 = objc_msgSend(v17, "cuik_colorWithAlphaScaled:", CUIKOccurrenceLeadingIconAlphaScale(objc_msgSend(v6, "userInterfaceStyle")));
    [v16 setObject:v18 forKeyedSubscript:v15];

    double v19 = [v16 objectForKeyedSubscript:v13];
    [a1 _widthForWidestPossibleIconIncludingTrailingPadding:v19 locationImageName:v7];
    double v21 = v20;

    double v22 = [a1 _attributedStringWithSystemImageName:v7 symbolAttributes:v16 widthForSymbol:v10 baseString:v21];
    v23 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4FB0738]];
    [a1 _indentWrappingLinesAndLinesOtherThanTheFirstWithBaseParagraphStyle:v23 string:v22 indentAmount:v21];
  }
  else
  {
    double v22 = 0;
  }

  return v22;
}

+ (double)minNaturalTextHeightForEvent:(id)a3 usingSmallText:(BOOL)a4 sizeClass:(int64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  [a1 minimumNaturalHeightForPrimaryTextUsingSmallText:v6 sizeClass:a5];
  double v10 = v9;
  double v11 = +[CUIKSemiConstantCache sharedInstance];
  double v12 = [v11 dayOccurrenceUncompressedSecondaryTextFont];
  double v14 = [(UIFont *)v12 cuik_lineHeight];

  double v15 = v10 + v14;
  id v16 = [v8 location];

  double v17 = -0.0;
  if (v16) {
    double v17 = v14;
  }
  return v15 + v17;
}

+ (double)_minimumPrimaryFontLineHeightUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4
{
  BOOL v9 = a3;
  CUIKMultiwindowAssert(a4 != 0, @"Unspecified size class", a3, a4, v4, v5, v6, v7, v15);
  double v10 = +[CUIKSemiConstantCache sharedInstance];
  double v11 = v10;
  if (v9)
  {
    if (a4 == 1) {
      [v10 dayOccurrenceMinimumCachedLineHeightSmallCompact];
    }
    else {
      [v10 dayOccurrenceMinimumCachedLineHeightSmallRegular];
    }
  }
  else if (a4 == 1)
  {
    [v10 dayOccurrenceMinimumCachedLineHeightCompact];
  }
  else
  {
    [v10 dayOccurrenceMinimumCachedLineHeightRegular];
  }
  double v13 = v12;

  return v13;
}

+ (double)attributedStringMinimumLineHeightUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4
{
  if (a3) {
    double v4 = 8.0;
  }
  else {
    double v4 = 9.0;
  }
  objc_msgSend(a1, "_minimumPrimaryFontLineHeightUsingSmallText:sizeClass:");
  double result = CUIKCeilToScreenScale(v5);
  if (v4 >= result) {
    return v4;
  }
  return result;
}

+ (double)minimumNaturalHeightForPrimaryTextUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4
{
  BOOL v5 = a3;
  objc_msgSend(a1, "_minimumPrimaryFontLineHeightUsingSmallText:sizeClass:");
  double v8 = v7;
  [a1 attributedStringMinimumLineHeightUsingSmallText:v5 sizeClass:a4];
  if (v8 >= result) {
    return v8;
  }
  return result;
}

+ (double)naturalHeightForPrimaryTextUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4
{
  [a1 _naturalHeightForPrimaryTextUsingSmallText:a3 sizeClass:a4];

  return CUIKCeilToScreenScale(v4);
}

+ (double)_naturalHeightForPrimaryTextUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4
{
  BOOL v9 = a3;
  CUIKMultiwindowAssert(a4 != 0, @"Unspecified size class", a3, a4, v4, v5, v6, v7, v15);
  double v10 = +[CUIKSemiConstantCache sharedInstance];
  double v11 = v10;
  if (v9)
  {
    if (a4 == 1) {
      [v10 dayReminderIntegrationCachedLineHeightSmallCompact];
    }
    else {
      [v10 dayReminderIntegrationCachedLineHeightSmallRegular];
    }
  }
  else if (a4 == 1)
  {
    [v10 dayReminderIntegrationCachedLineHeightCompact];
  }
  else
  {
    [v10 dayReminderIntegrationCachedLineHeightRegular];
  }
  double v13 = v12;

  return v13;
}

- (id)generateTravelTimeStringWithState:(id)a3
{
  id v3 = a3;
  [v3 travelTime];
  uint64_t v5 = CUIKDisplayStringTravelTimeAndDuration(v4);
  if ([v5 length])
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v5];
    uint64_t v7 = [(id)objc_opt_class() _defaultAttributesForState:v3];
    double v8 = +[CUIKORFontUtils defaultOccurrenceSecondaryTextFont];
    [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

    objc_msgSend(v6, "setAttributes:range:", v7, 0, objc_msgSend(v6, "length"));
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

@end