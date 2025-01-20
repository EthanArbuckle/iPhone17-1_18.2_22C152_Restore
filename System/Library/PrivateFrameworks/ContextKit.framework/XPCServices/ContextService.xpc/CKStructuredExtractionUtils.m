@interface CKStructuredExtractionUtils
+ (BOOL)_attemptMergeAddressResults:(id)a3 prevResult:(id)a4 prevResultMatch:(id)a5;
+ (BOOL)_processDateMatch:(id)a3 matchString:(id)a4 contextResult:(id)a5 withConfig:(id)a6 extractionType:(unsigned __int8)a7;
+ (id)_descriptionForDateComponents:(id)a3 hadDate:(BOOL)a4 hasTime:(BOOL)a5;
+ (id)_resultForMatch:(id)a3 matchString:(id)a4 withConfig:(id)a5 extractionType:(unsigned __int8)a6;
+ (id)ddResultsForUIElements:(id)a3 usingDataDetector:(id)a4 withConfig:(id)a5;
+ (id)debugStringForStructuredResult:(id)a3;
+ (id)liveTextResultsFromUIElements:(id)a3;
+ (id)normalizeString:(id)a3;
+ (id)personResultsFromUIElements:(id)a3;
+ (unsigned)_guessStructuredExtractionType:(id)a3;
@end

@implementation CKStructuredExtractionUtils

+ (id)ddResultsForUIElements:(id)a3 usingDataDetector:(id)a4 withConfig:(id)a5
{
  id v8 = a3;
  id v39 = a4;
  id v9 = a5;
  unsigned int v47 = [a1 _guessStructuredExtractionType:v8];
  id v41 = objc_alloc_init((Class)NSMutableArray);
  id v43 = objc_alloc_init((Class)NSMutableSet);
  if ([v8 count])
  {
    v10 = 0;
    v11 = 0;
    unint64_t v12 = 0;
    v38 = v8;
    id v42 = v9;
    id v45 = a1;
    while (1)
    {
      v13 = [v8 objectAtIndexedSubscript:v12];
      v14 = [v13 text];
      v15 = +[CKStructuredExtractionUtils normalizeString:v14];

      v48 = v15;
      v16 = objc_msgSend(v39, "matchesInString:options:range:", v15, 0, 0, objc_msgSend(v15, "length"));
      unint64_t v17 = v12;
      if (![v16 count])
      {

        v11 = 0;
        v10 = 0;
      }
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id obj = v16;
      id v50 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
      if (v50) {
        break;
      }
LABEL_37:

      unint64_t v12 = v17 + 1;
      id v8 = v38;
      if (v12 >= (unint64_t)[v38 count]) {
        goto LABEL_40;
      }
    }
    uint64_t v49 = *(void *)v56;
    unint64_t v44 = v12;
LABEL_7:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v56 != v49) {
        objc_enumerationMutation(obj);
      }
      v19 = *(void **)(*((void *)&v55 + 1) + 8 * v18);
      if ([v19 resultType] == (id)8 && v17 > (unint64_t)objc_msgSend(v9, "maxUIContentCount")) {
        goto LABEL_35;
      }
      id v20 = [v19 range];
      v22 = objc_msgSend(v48, "substringWithRange:", v20, v21);
      v23 = [a1 _resultForMatch:v19 matchString:v22 withConfig:v9 extractionType:v47];
      v24 = v23;
      if (v23) {
        break;
      }
LABEL_34:

LABEL_35:
      if (v50 == (id)++v18)
      {
        id v50 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
        if (!v50) {
          goto LABEL_37;
        }
        goto LABEL_7;
      }
    }
    [v23 setSourceUIElement:v13];
    [v13 frameInWindow];
    objc_msgSend(v24, "setFrameInWindow:");
    [v13 absoluteOriginOnScreen];
    objc_msgSend(v24, "setAbsoluteOriginOnScreen:");
    objc_msgSend(v24, "setOnScreen:", objc_msgSend(v13, "isOnScreen"));
    v25 = [v13 sceneIdentifier];
    id v26 = [v25 copy];
    [v24 setSceneIdentifier:v26];

    v27 = [a1 debugStringForStructuredResult:v24];
    [v24 setDebug:v27];

    if (v10
      && v11
      && [v19 resultType] == (id)16
      && [v11 resultType] == (id)16
      && [v45 _attemptMergeAddressResults:v24 prevResult:v10 prevResultMatch:v11])
    {
      id v28 = v19;

      v29 = [v10 title];
      [v43 addObject:v29];

      v30 = [v10 category];
      if (v30) {
        [v43 addObject:v30];
      }
      id v9 = v42;
      unint64_t v17 = v44;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_1002B4834(&buf, v54);
      }
      a1 = v45;
      goto LABEL_33;
    }
    id v31 = v24;

    id v32 = v19;
    v30 = [v31 category];
    v33 = [v31 title];
    if ([v43 containsObject:v33])
    {

      goto LABEL_27;
    }
    if (v30)
    {
      unsigned __int8 v34 = [v43 containsObject:v30];

      if (v34)
      {
LABEL_27:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_1002B4878(&v51, v52);
        }
LABEL_32:
        v10 = v31;
        id v9 = v42;
        unint64_t v17 = v44;
        a1 = v45;
LABEL_33:

        v11 = v19;
        goto LABEL_34;
      }
    }
    else
    {
    }
    [v41 addObject:v31];
    v35 = [v31 title];
    [v43 addObject:v35];

    if (v30) {
      [v43 addObject:v30];
    }
    goto LABEL_32;
  }
  v11 = 0;
  v10 = 0;
LABEL_40:
  id v36 = v41;

  return v36;
}

+ (id)_resultForMatch:(id)a3 matchString:(id)a4 withConfig:(id)a5 extractionType:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 structuredExtractionMinPrefix];
  v14 = [[LuceneContextResult alloc] initWithText:v11];
  uint64_t v15 = (uint64_t)[v10 resultType];
  v16 = 0;
  if (v15 > 31)
  {
    if (v15 == 2048)
    {
      v25 = [v10 phoneNumber];
      if (v25)
      {
        [(LuceneContextResult *)v14 setTitle:v25];
      }
      else
      {
        id v26 = [(LuceneContextResult *)v14 title];
        [(LuceneContextResult *)v14 setTitle:v26];
      }
      v27 = [v10 phoneNumber];
      id v28 = +[NSString stringWithFormat:@"PhoneNum: %@", v27];
      [(LuceneContextResult *)v14 setCategory:v28];

      v24 = &CKContextTagTypePhoneNumber;
    }
    else
    {
      if (v15 != 32) {
        goto LABEL_18;
      }
      v23 = [v10 URL];
      [(LuceneContextResult *)v14 setUrl:v23];

      v24 = &CKContextTagTypeURL;
    }
    v29 = +[NSSet setWithObject:*v24];
    [(LuceneContextResult *)v14 setTags:v29];

LABEL_16:
    [(LuceneContextResult *)v14 setMinPrefix:v13];
    goto LABEL_17;
  }
  if (v15 != 8)
  {
    if (v15 != 16) {
      goto LABEL_18;
    }
    unint64_t v17 = [v10 components];
    [(LuceneContextResult *)v14 setExtractedAddressComponents:v17];

    uint64_t v18 = [v10 components];
    v19 = +[NSString stringWithFormat:@"Address: %@", v18];
    [(LuceneContextResult *)v14 setCategory:v19];

    id v20 = +[NSSet setWithObject:CKContextTagTypeAddress];
    [(LuceneContextResult *)v14 setTags:v20];

    [(LuceneContextResult *)v14 setMinPrefix:v13];
    uint64_t v21 = [(LuceneContextResult *)v14 extractedAddressComponents];
    v22 = [v21 objectForKeyedSubscript:NSTextCheckingStreetKey];

    if (v22) {
      goto LABEL_17;
    }
    id v13 = [v12 structuredExtractionDemotedResultMinPrefix];
    goto LABEL_16;
  }
  if (([a1 _processDateMatch:v10 matchString:v11 contextResult:v14 withConfig:v12 extractionType:v6] & 1) == 0)
  {
    v16 = 0;
    goto LABEL_18;
  }
LABEL_17:
  v16 = v14;
LABEL_18:

  return v16;
}

+ (BOOL)_processDateMatch:(id)a3 matchString:(id)a4 contextResult:(id)a5 withConfig:(id)a6 extractionType:(unsigned __int8)a7
{
  int v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = [v12 date];
  if (v16
    && [v12 underlyingResult]
    && (+[NSCharacterSet decimalDigitCharacterSet],
        unint64_t v17 = objc_claimAutoreleasedReturnValue(),
        id v18 = [v13 rangeOfCharacterFromSet:v17],
        v17,
        v18 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    [v12 underlyingResult];
    uint64_t v21 = DDResultGetType();
    [v21 rangeOfString:@"Date"];
    uint64_t v23 = v22;
    [v21 rangeOfString:@"Time"];
    unsigned int v25 = v24 != 0;
    [v21 rangeOfString:@"Duration"];
    int v55 = v7;
    if (v26) {
      unsigned int v25 = [v12 timeIsSignificant];
    }
    if (v23) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = v25;
    }
    if (v19)
    {
      uint8_t v51 = v15;
      uint64_t v27 = 224;
      if (!v25) {
        uint64_t v27 = 0;
      }
      if (v23) {
        uint64_t v28 = v27 | 0x1C;
      }
      else {
        uint64_t v28 = v27;
      }
      v54 = +[NSCalendar currentCalendar];
      [v12 timeZone];
      uint64_t v49 = v23;
      v30 = v29 = v21;
      [v54 setTimeZone:v30];

      uint64_t v31 = [v54 components:v28 fromDate:v16];
      id v50 = a1;
      id v32 = a1;
      uint64_t v33 = v25;
      v52 = (void *)v31;
      unsigned __int8 v34 = objc_msgSend(v32, "_descriptionForDateComponents:hadDate:hasTime:");
      v53 = v29;
      long long v56 = +[NSMutableString stringWithFormat:@"%@: %@", v29, v34];

      [v12 duration];
      v35 = 0;
      if (v36 > 0.0)
      {
        [v12 duration];
        v37 = +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", v16);
        uint64_t v38 = [v54 components:v28 fromDate:v37];

        v35 = (void *)v38;
        id v39 = [v50 _descriptionForDateComponents:v38 hadDate:v49 != 0 hasTime:v33];
        [v56 appendFormat:@" to %@", v39];
      }
      v40 = [v12 timeZone];

      id v15 = v51;
      id v41 = v35;
      if (v40)
      {
        id v42 = [v12 timeZone];
        [v52 setTimeZone:v42];

        id v43 = [v12 timeZone];
        [v35 setTimeZone:v43];

        unint64_t v44 = [v12 timeZone];
        id v45 = +[NSString stringWithFormat:@", %@", v44];
        [v14 setCategory:v45];

        v35 = v41;
      }
      [v14 setExtractedStartDateComponents:v52];
      [v14 setExtractedEndDateComponents:v35];
      [v14 setCategory:v56];
      uint64_t v21 = v53;
      v46 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", CKContextTagTypeDateTime, v53, 0);
      [v14 setTags:v46];

      if (v55 == 1 || ([v53 rangeOfString:@"Duration"], v47)) {
        id v48 = [v51 structuredExtractionMinPrefix];
      }
      else {
        id v48 = [v51 structuredExtractionDemotedResultMinPrefix];
      }
      [v14 setMinPrefix:v48];
    }
  }
  else
  {
    LOBYTE(v19) = 0;
  }

  return v19;
}

+ (id)_descriptionForDateComponents:(id)a3 hadDate:(BOOL)a4 hasTime:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableString);
  if (v6) {
    objc_msgSend(v8, "appendFormat:", @"%ld-%ld-%ld ", objc_msgSend(v7, "year"), objc_msgSend(v7, "month"), objc_msgSend(v7, "day"));
  }
  if (v5) {
    objc_msgSend(v8, "appendFormat:", @"%ld:%02ld:%02ld", objc_msgSend(v7, "hour"), objc_msgSend(v7, "minute"), objc_msgSend(v7, "second"));
  }

  return v8;
}

+ (BOOL)_attemptMergeAddressResults:(id)a3 prevResult:(id)a4 prevResultMatch:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  id v50 = [v6 extractedAddressComponents];
  id v8 = [v7 extractedAddressComponents];
  id v9 = [v8 mutableCopy];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v48 = v7;
  uint64_t v49 = v6;
  if (qword_100563080 != -1) {
    dispatch_once(&qword_100563080, &stru_10048BC98);
  }
  id v10 = (id)qword_100563078;
  id v11 = [v10 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v11)
  {
    id v12 = v11;
    char v13 = 0;
    uint64_t v14 = *(void *)v52;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v52 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        unint64_t v17 = [v9 objectForKeyedSubscript:v16];
        id v18 = [v50 objectForKeyedSubscript:v16];
        BOOL v19 = v18;
        if (v17 && (v18 != 0) | v13 & 1)
        {

          BOOL v46 = 0;
          uint64_t v22 = v48;
          uint64_t v24 = v49;
          goto LABEL_23;
        }
        BOOL v20 = v18 != 0;
        if (v17) {
          BOOL v21 = 1;
        }
        else {
          BOOL v21 = v18 == 0;
        }
        if (!v21) {
          [v9 setObject:v18 forKeyedSubscript:v16];
        }
        v13 |= v20;
      }
      id v12 = [v10 countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  uint64_t v22 = v48;
  uint64_t v23 = [v48 title];
  uint64_t v24 = v49;
  unsigned int v25 = [v49 title];
  uint64_t v26 = [v23 stringByAppendingFormat:@", %@", v25];
  [v48 setTitle:v26];

  [v48 setExtractedAddressComponents:v9];
  uint64_t v27 = +[NSString stringWithFormat:@"Address: %@", v9];
  [v48 setCategory:v27];

  [v48 frameInWindow];
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  [v49 frameInWindow];
  v58.origin.x = v36;
  v58.origin.y = v37;
  v58.size.width = v38;
  v58.size.height = v39;
  v56.origin.x = v29;
  v56.origin.y = v31;
  v56.size.width = v33;
  v56.size.height = v35;
  CGRect v57 = CGRectUnion(v56, v58);
  objc_msgSend(v48, "setFrameInWindow:", v57.origin.x, v57.origin.y, v57.size.width, v57.size.height);
  [v48 absoluteOriginOnScreen];
  double v41 = v40;
  [v49 absoluteOriginOnScreen];
  if (v41 >= v42) {
    double v41 = v42;
  }
  [v48 absoluteOriginOnScreen];
  double v44 = v43;
  [v49 absoluteOriginOnScreen];
  if (v44 < v45) {
    double v45 = v44;
  }
  objc_msgSend(v48, "setAbsoluteOriginOnScreen:", v41, v45);
  BOOL v46 = 1;
LABEL_23:

  return v46;
}

+ (unsigned)_guessStructuredExtractionType:(id)a3
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a3;
  id v3 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v3)
  {
    id v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v9 = [v8 text];
        id v10 = [v9 rangeOfString:@"event" options:129];

        if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          char v5 = 1;
          goto LABEL_22;
        }
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v11 = [v8 superviewClassNames];
        id v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v19;
          while (2)
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              if ([*(id *)(*((void *)&v18 + 1) + 8 * (void)j) rangeOfString:@"event" options:129] != (id)0x7FFFFFFFFFFFFFFFLL)
              {
                char v5 = 1;
                goto LABEL_17;
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
LABEL_17:
      }
      id v4 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v5 = 0;
  }
LABEL_22:

  return v5 & 1;
}

+ (id)liveTextResultsFromUIElements:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    uint64_t v9 = CKContextTagTypeLiveText;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v11 isOnScreen])
        {
          id v12 = [v11 className];
          unsigned int v13 = [v12 containsString:@"VKCImageTextSelectionView"];

          if (v13)
          {
            uint64_t v14 = [LuceneContextResult alloc];
            id v15 = [v11 text];
            uint64_t v16 = [(LuceneContextResult *)v14 initWithText:v15];

            [v11 frameInWindow];
            -[LuceneContextResult setFrameInWindow:](v16, "setFrameInWindow:");
            [v11 absoluteOriginOnScreen];
            -[LuceneContextResult setAbsoluteOriginOnScreen:](v16, "setAbsoluteOriginOnScreen:");
            -[LuceneContextResult setOnScreen:](v16, "setOnScreen:", [v11 isOnScreen]);
            unint64_t v17 = +[NSSet setWithObject:v9];
            [(LuceneContextResult *)v16 setTags:v17];

            [(LuceneContextResult *)v16 setMinPrefix:1];
            [(LuceneContextResult *)v16 setSourceUIElement:v11];
            long long v18 = [a1 debugStringForStructuredResult:v16];
            [(LuceneContextResult *)v16 setDebug:v18];
            [v4 addObject:v16];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)personResultsFromUIElements:(id)a3
{
  id v3 = a3;
  id v29 = objc_alloc_init((Class)NSMutableArray);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v37;
    NLTagScheme v24 = NLTagSchemeNameType;
    uint64_t v25 = CKContextTagTypePersonReal;
    CFStringRef v7 = @"EKUIInviteesViewInviteesCell";
    do
    {
      uint64_t v8 = 0;
      id v26 = v5;
      do
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v8);
        id v10 = objc_msgSend(v9, "text", v24);
        id v11 = [v9 superviewClassNames];
        unsigned int v12 = [v11 containsObject:v7];

        if (v12)
        {
          unsigned int v13 = [[LuceneContextResult alloc] initWithText:v10];
          [v9 frameInWindow];
          -[LuceneContextResult setFrameInWindow:](v13, "setFrameInWindow:");
          [v9 absoluteOriginOnScreen];
          -[LuceneContextResult setAbsoluteOriginOnScreen:](v13, "setAbsoluteOriginOnScreen:");
          -[LuceneContextResult setOnScreen:](v13, "setOnScreen:", [v9 isOnScreen]);
          uint64_t v14 = +[NSSet setWithObject:v25];
          [(LuceneContextResult *)v13 setTags:v14];

          [(LuceneContextResult *)v13 setMinPrefix:1];
          [(LuceneContextResult *)v13 setSourceUIElement:v9];
          id v15 = [a1 debugStringForStructuredResult:v13];
          [(LuceneContextResult *)v13 setDebug:v15];
          [v29 addObject:v13];
        }
        else
        {
          id v16 = objc_alloc((Class)NLTagger);
          NLTagScheme v40 = NLTagSchemeNameType;
          +[NSArray arrayWithObjects:&v40 count:1];
          uint64_t v17 = v6;
          v19 = CFStringRef v18 = v7;
          unsigned int v13 = (LuceneContextResult *)[v16 initWithTagSchemes:v19];

          [(LuceneContextResult *)v13 setString:v10];
          long long v20 = [v29 valueForKey:@"title"];
          id v21 = [v10 length];
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_1002B43BC;
          v30[3] = &unk_10048BC78;
          id v31 = v10;
          double v32 = v9;
          id v35 = a1;
          id v33 = v29;
          id v34 = v20;
          id v15 = v20;
          id v22 = v21;
          CFStringRef v7 = v18;
          uint64_t v6 = v17;
          id v5 = v26;
          -[LuceneContextResult enumerateTagsInRange:unit:scheme:options:usingBlock:](v13, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v22, 0, NLTagSchemeNameType, 22, v30);
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v5);
  }

  return v29;
}

+ (id)debugStringForStructuredResult:(id)a3
{
  id v3 = a3;
  id v4 = [v3 minPrefix];
  [v3 frameInWindow];
  uint64_t v6 = v5;
  [v3 frameInWindow];
  uint64_t v8 = v7;
  [v3 absoluteOriginOnScreen];
  uint64_t v10 = v9;
  [v3 absoluteOriginOnScreen];
  uint64_t v12 = v11;
  [v3 frameInWindow];
  uint64_t v14 = v13;
  [v3 frameInWindow];
  uint64_t v16 = v15;
  if ([v3 isOnScreen]) {
    CFStringRef v17 = @"YES";
  }
  else {
    CFStringRef v17 = @"NO";
  }
  CFStringRef v18 = [v3 sceneIdentifier];

  long long v19 = +[NSString stringWithFormat:@"MinPrefix: %li, Origin:(%.f, %.f), AbsoluteOriginOnScreen:(%.f, %.f), Size:(%.f, %.f), On Screen:%@, SceneIdentifier: %@", v4, v6, v8, v10, v12, v14, v16, v17, v18];

  return v19;
}

+ (id)normalizeString:(id)a3
{
  id v3 = a3;
  id v4 = +[NSCharacterSet newlineCharacterSet];
  uint64_t v5 = +[NSRegularExpression regularExpressionWithPattern:@"\n+" options:0 error:0];
  uint64_t v6 = objc_msgSend(v5, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), @"\n");

  uint64_t v7 = [v6 stringByTrimmingCharactersInSet:v4];

  return v7;
}

@end