@interface SGExtractionDocument
+ (_NSRange)firstRangeInIndexSet:(id)a3;
+ (_NSRange)textRangeForIndexRange:(_NSRange)a3 inTaggedCharacterRanges:(id)a4;
+ (id)allDayDateComponentsFromDate:(id)a3;
+ (id)candidatesForLabelTokenIndexes:(id)a3 inPlainText:(id)a4 forTaggedCharacterRanges:(id)a5;
+ (id)candidatesForLabelsWithPlainTextIndexSets:(id)a3 inPlainText:(id)a4;
+ (id)candidatesForPlainTextIndexSet:(id)a3 inPlainText:(id)a4;
+ (id)dateComponentsFromDataDetectorMatch:(id)a3 inferDates:(BOOL)a4 approximateTime:(BOOL)a5 partialDate:(BOOL)a6 useEndForDurations:(BOOL)a7;
+ (id)dateComponentsFromDate:(id)a3;
+ (id)indexSetForOutputNameLabelForModelOutput:(id)a3;
+ (id)keyForOutputName:(id)a3 label:(id)a4;
+ (id)labelTokenIndexesForOutputName:(id)a3 label:(id)a4 modelOutput:(id)a5;
+ (id)labelTokenIndexesForOutputName:(id)a3 label:(id)a4 modelOutput:(id)a5 maxMergeDistance:(unint64_t)a6;
+ (id)mergeComponent:(unint64_t)a3 usingBaseDateComponents:(id)a4 withDateComponents:(id)a5;
+ (id)mergeDetectedDateComponents:(id)a3;
- (NSArray)enrichedTaggedCharacterRanges;
- (NSDictionary)indexSetForOutputNameLabel;
- (NSDictionary)modelOutput;
- (SGExtractionDocument)initWithEnrichedTaggedCharacterRanges:(id)a3 modelOutput:(id)a4;
- (_NSRange)textRangeForTokenRange:(_NSRange)a3;
- (id)candidatesForLabelTokenIndexes:(id)a3 inPlainText:(id)a4;
- (id)dataDetectorMatchesForTokenIndexes:(id)a3 dataDetectorMatches:(id)a4 allowDatesInPast:(BOOL)a5 allowTimeOffset:(BOOL)a6;
- (id)detectedDateComponentsForTokenIndexes:(id)a3 dataDetectorMatches:(id)a4 allowDatesInPast:(BOOL)a5 inferDates:(BOOL)a6 approximateTime:(BOOL)a7 partialDate:(BOOL)a8 allowTimeOffset:(BOOL)a9 useEndForDurations:(BOOL)a10;
- (id)detectedDateComponentsForTokenIndexes:(id)a3 dataDetectorMatches:(id)a4 allowDatesInPast:(BOOL)a5 inferDates:(BOOL)a6 approximateTime:(BOOL)a7 partialDate:(BOOL)a8 useEndForDurations:(BOOL)a9;
- (id)labelTokenIndexesForOutputName:(id)a3 label:(id)a4;
- (void)setEnrichedTaggedCharacterRanges:(id)a3;
- (void)setIndexSetForOutputNameLabel:(id)a3;
- (void)setModelOutput:(id)a3;
@end

@implementation SGExtractionDocument

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexSetForOutputNameLabel, 0);
  objc_storeStrong((id *)&self->_modelOutput, 0);
  objc_storeStrong((id *)&self->_enrichedTaggedCharacterRanges, 0);
}

- (void)setIndexSetForOutputNameLabel:(id)a3
{
}

- (NSDictionary)indexSetForOutputNameLabel
{
  return self->_indexSetForOutputNameLabel;
}

- (void)setModelOutput:(id)a3
{
}

- (NSDictionary)modelOutput
{
  return self->_modelOutput;
}

- (void)setEnrichedTaggedCharacterRanges:(id)a3
{
}

- (NSArray)enrichedTaggedCharacterRanges
{
  return self->_enrichedTaggedCharacterRanges;
}

- (id)detectedDateComponentsForTokenIndexes:(id)a3 dataDetectorMatches:(id)a4 allowDatesInPast:(BOOL)a5 inferDates:(BOOL)a6 approximateTime:(BOOL)a7 partialDate:(BOOL)a8 useEndForDurations:(BOOL)a9
{
  BYTE1(v10) = a9;
  LOBYTE(v10) = 0;
  return -[SGExtractionDocument detectedDateComponentsForTokenIndexes:dataDetectorMatches:allowDatesInPast:inferDates:approximateTime:partialDate:allowTimeOffset:useEndForDurations:](self, "detectedDateComponentsForTokenIndexes:dataDetectorMatches:allowDatesInPast:inferDates:approximateTime:partialDate:allowTimeOffset:useEndForDurations:", a3, a4, a5, a6, a7, a8, v10);
}

- (_NSRange)textRangeForTokenRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5 = [(SGExtractionDocument *)self enrichedTaggedCharacterRanges];
  if (v5)
  {
    uint64_t v6 = objc_msgSend((id)objc_opt_class(), "textRangeForIndexRange:inTaggedCharacterRanges:", location, length, v5);
    NSUInteger v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    NSUInteger v8 = 0;
  }

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (id)dataDetectorMatchesForTokenIndexes:(id)a3 dataDetectorMatches:(id)a4 allowDatesInPast:(BOOL)a5 allowTimeOffset:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = objc_opt_new();
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__41037;
  v28 = __Block_byref_object_dispose__41038;
  id v29 = (id)MEMORY[0x1E4F1CC28];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __112__SGExtractionDocument_dataDetectorMatchesForTokenIndexes_dataDetectorMatches_allowDatesInPast_allowTimeOffset___block_invoke;
  v18[3] = &unk_1E65C0230;
  v18[4] = self;
  id v13 = v11;
  id v19 = v13;
  BOOL v22 = a6;
  BOOL v23 = a5;
  id v14 = v12;
  id v20 = v14;
  v21 = &v24;
  [v10 enumerateRangesUsingBlock:v18];
  id v15 = objc_alloc(MEMORY[0x1E4F93BB8]);
  v16 = (void *)[v15 initWithFirst:v14 second:v25[5]];

  _Block_object_dispose(&v24, 8);
  return v16;
}

void __112__SGExtractionDocument_dataDetectorMatchesForTokenIndexes_dataDetectorMatches_allowDatesInPast_allowTimeOffset___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "textRangeForTokenRange:", a2, a3);
  NSUInteger v24 = v5;
  NSUInteger v25 = v4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = *(id *)(v3 + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1CB79B230]();
        if ([v11 matchType] == 3
          || *(unsigned char *)(v3 + 64) && [v11 matchType] == 8)
        {
          id v13 = [v11 detectedDate];
          if (v13
            && (v33.NSUInteger location = [v11 range],
                v33.NSUInteger length = v14,
                v32.NSUInteger length = v24,
                v32.NSUInteger location = v25,
                NSIntersectionRange(v32, v33).length))
          {
            uint64_t v15 = v9;
            uint64_t v16 = v3;
            id v17 = v6;
            v18 = [v11 detectedDate];
            id v19 = [MEMORY[0x1E4F1C9C8] date];
            [v18 timeIntervalSinceDate:v19];
            if (v20 > 0.0)
            {

              id v6 = v17;
              uint64_t v3 = v16;
              uint64_t v9 = v15;
              goto LABEL_15;
            }
            int v23 = *(unsigned __int8 *)(v16 + 65);

            id v6 = v17;
            uint64_t v3 = v16;
            uint64_t v9 = v15;
            if (v23) {
LABEL_15:
            }
              [*(id *)(v3 + 48) addObject:v11];
          }
          else
          {
          }
          if (([v11 inferredDate] & 1) == 0)
          {
            uint64_t v21 = *(void *)(*(void *)(v3 + 56) + 8);
            BOOL v22 = *(void **)(v21 + 40);
            *(void *)(v21 + 40) = MEMORY[0x1E4F1CC38];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }
}

- (id)detectedDateComponentsForTokenIndexes:(id)a3 dataDetectorMatches:(id)a4 allowDatesInPast:(BOOL)a5 inferDates:(BOOL)a6 approximateTime:(BOOL)a7 partialDate:(BOOL)a8 allowTimeOffset:(BOOL)a9 useEndForDurations:(BOOL)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  BOOL v12 = a6;
  BOOL v13 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  v18 = [(SGExtractionDocument *)self modelOutput];

  if (v18)
  {
    id v30 = v17;
    id v31 = v16;
    id v19 = [(SGExtractionDocument *)self dataDetectorMatchesForTokenIndexes:v16 dataDetectorMatches:v17 allowDatesInPast:v13 allowTimeOffset:a9];
    NSRange v32 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v29 = v19;
    double v20 = [v19 first];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v34 != v23) {
            objc_enumerationMutation(v20);
          }
          NSUInteger v25 = [(id)objc_opt_class() dateComponentsFromDataDetectorMatch:*(void *)(*((void *)&v33 + 1) + 8 * i) inferDates:v12 approximateTime:v11 partialDate:v10 useEndForDurations:a10];
          if (v25) {
            [v32 addObject:v25];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v22);
    }

    long long v26 = (void *)MEMORY[0x1CB79B230]();
    long long v27 = [v32 allObjects];

    id v17 = v30;
    id v16 = v31;
  }
  else
  {
    long long v27 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v27;
}

- (id)candidatesForLabelTokenIndexes:(id)a3 inPlainText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SGExtractionDocument *)self enrichedTaggedCharacterRanges];
  if ([v8 count])
  {
    uint64_t v9 = [(id)objc_opt_class() candidatesForLabelTokenIndexes:v6 inPlainText:v7 forTaggedCharacterRanges:v8];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (id)labelTokenIndexesForOutputName:(id)a3 label:(id)a4
{
  indexSetForOutputNameLabel = self->_indexSetForOutputNameLabel;
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(id)objc_opt_class() keyForOutputName:v7 label:v6];

  uint64_t v9 = [(NSDictionary *)indexSetForOutputNameLabel objectForKeyedSubscript:v8];

  return v9;
}

- (SGExtractionDocument)initWithEnrichedTaggedCharacterRanges:(id)a3 modelOutput:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SGExtractionDocument;
  uint64_t v9 = [(SGExtractionDocument *)&v14 init];
  BOOL v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_enrichedTaggedCharacterRanges, a3);
    objc_storeStrong((id *)&v10->_modelOutput, a4);
    uint64_t v11 = [(id)objc_opt_class() indexSetForOutputNameLabelForModelOutput:v10->_modelOutput];
    indexSetForOutputNameLabel = v10->_indexSetForOutputNameLabel;
    v10->_indexSetForOutputNameLabel = (NSDictionary *)v11;
  }
  return v10;
}

+ (id)mergeComponent:(unint64_t)a3 usingBaseDateComponents:(id)a4 withDateComponents:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = v8;
  if (a3 == 0x200000)
  {
    BOOL v10 = [v8 timeZone];

    if (!v10)
    {
LABEL_11:
      id v20 = v7;
      goto LABEL_12;
    }
    uint64_t v11 = [v7 timeZone];
    if (!v11)
    {
LABEL_6:
      v18 = [v9 timeZone];
      [v7 setTimeZone:v18];

      goto LABEL_11;
    }
    BOOL v12 = (void *)v11;
    uint64_t v13 = [v7 timeZone];
    if (v13)
    {
      objc_super v14 = (void *)v13;
      uint64_t v15 = [v9 timeZone];
      id v16 = [v7 timeZone];
      int v17 = [v15 isEqualToTimeZone:v16];

      if (v17) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  else
  {
    if ([v8 valueForComponent:a3] == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_11;
    }
    if ([v7 valueForComponent:a3] == 0x7FFFFFFFFFFFFFFFLL
      || (uint64_t v19 = [v9 valueForComponent:a3], v19 == objc_msgSend(v7, "valueForComponent:", a3)))
    {
      objc_msgSend(v7, "setValue:forComponent:", objc_msgSend(v9, "valueForComponent:", a3), a3);
      goto LABEL_11;
    }
  }
  id v20 = 0;
LABEL_12:

  return v20;
}

+ (id)mergeDetectedDateComponents:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = objc_opt_new();
  id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  [v5 setCalendar:v6];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v4;
  uint64_t v20 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v8 = *(void *)v26;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v7);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v11 = objc_msgSend(&unk_1F2537508, "countByEnumeratingWithState:objects:count:", &v21, v29, 16, v19);
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          while (2)
          {
            uint64_t v14 = 0;
            id v15 = v5;
            do
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(&unk_1F2537508);
              }
              uint64_t v16 = objc_msgSend(a1, "mergeComponent:usingBaseDateComponents:withDateComponents:", objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v14), "integerValue"), v15, v10);
              if (!v16)
              {

                int v17 = 0;
                goto LABEL_18;
              }
              NSUInteger v5 = (void *)v16;

              ++v14;
              id v15 = v5;
            }
            while (v12 != v14);
            uint64_t v12 = [&unk_1F2537508 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
        uint64_t v8 = v19;
      }
      uint64_t v20 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }

  id v15 = v5;
  int v17 = v15;
LABEL_18:

  return v17;
}

+ (id)dateComponentsFromDate:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  NSUInteger v5 = [v3 currentCalendar];
  id v6 = [v5 components:1048700 fromDate:v4];

  return v6;
}

+ (id)allDayDateComponentsFromDate:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  NSUInteger v5 = [v3 currentCalendar];
  id v6 = [v5 components:1048604 fromDate:v4];

  return v6;
}

+ (id)dateComponentsFromDataDetectorMatch:(id)a3 inferDates:(BOOL)a4 approximateTime:(BOOL)a5 partialDate:(BOOL)a6 useEndForDurations:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  uint64_t v12 = v11;
  if (v7
    && ([v11 detectedEndDate], uint64_t v13 = objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    uint64_t v14 = [v12 detectedEndDate];
    uint64_t v15 = [v12 detectedEndTimeZone];
  }
  else
  {
    uint64_t v14 = [v12 detectedDate];
    uint64_t v15 = [v12 detectedTimeZone];
  }
  uint64_t v16 = (void *)v15;
  if ([v12 allDay])
  {
    uint64_t v17 = [(id)objc_opt_class() allDayDateComponentsFromDate:v14];
    goto LABEL_11;
  }
  if (!v16)
  {
    uint64_t v17 = [(id)objc_opt_class() dateComponentsFromDate:v14];
LABEL_11:
    uint64_t v19 = (void *)v17;
    if (a4) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  v18 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v19 = [v18 componentsInTimeZone:v16 fromDate:v14];

  if (a4) {
    goto LABEL_14;
  }
LABEL_12:
  if ([v12 inferredDate])
  {
    uint64_t v20 = objc_opt_new();
    long long v21 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    [v20 setCalendar:v21];

    long long v22 = [v19 timeZone];
    [v20 setTimeZone:v22];

    objc_msgSend(v20, "setHour:", objc_msgSend(v19, "hour"));
    objc_msgSend(v20, "setMinute:", objc_msgSend(v19, "minute"));

    uint64_t v19 = v20;
  }
LABEL_14:
  if (!a5 && [v12 approximateTime])
  {
    [v19 setHour:0x7FFFFFFFFFFFFFFFLL];
    [v19 setMinute:0x7FFFFFFFFFFFFFFFLL];
  }
  if (!a6 && [v12 partialDate])
  {
    [v19 setDay:0x7FFFFFFFFFFFFFFFLL];
    [v19 setMonth:0x7FFFFFFFFFFFFFFFLL];
    [v19 setYear:0x7FFFFFFFFFFFFFFFLL];
  }
  if ([v19 year] == 0x7FFFFFFFFFFFFFFFLL
    && [v19 month] == 0x7FFFFFFFFFFFFFFFLL
    && [v19 day] == 0x7FFFFFFFFFFFFFFFLL
    && [v19 hour] == 0x7FFFFFFFFFFFFFFFLL
    && [v19 minute] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v23 = 0;
  }
  else
  {
    id v23 = v19;
  }

  return v23;
}

+ (id)candidatesForPlainTextIndexSet:(id)a3 inPlainText:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = objc_opt_new();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__SGExtractionDocument_candidatesForPlainTextIndexSet_inPlainText___block_invoke;
  v13[3] = &unk_1E65C0208;
  id v14 = v5;
  id v8 = v7;
  id v15 = v8;
  id v9 = v5;
  [v6 enumerateRangesUsingBlock:v13];

  uint64_t v10 = v15;
  id v11 = v8;

  return v11;
}

uint64_t __67__SGExtractionDocument_candidatesForPlainTextIndexSet_inPlainText___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  if (v4) {
    [*(id *)(a1 + 40) addObject:v4];
  }
  return MEMORY[0x1F41817F8]();
}

+ (id)candidatesForLabelsWithPlainTextIndexSets:(id)a3 inPlainText:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v15 = objc_msgSend(v9, "objectForKeyedSubscript:", v14, (void)v18);
        uint64_t v16 = [a1 candidatesForPlainTextIndexSet:v15 inPlainText:v7];
        [v8 setObject:v16 forKeyedSubscript:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v8;
}

+ (id)candidatesForLabelTokenIndexes:(id)a3 inPlainText:(id)a4 forTaggedCharacterRanges:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_new();
  if (v10)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __92__SGExtractionDocument_candidatesForLabelTokenIndexes_inPlainText_forTaggedCharacterRanges___block_invoke;
    v16[3] = &unk_1E65C01E0;
    id v20 = a1;
    id v17 = v10;
    id v18 = v9;
    id v12 = v11;
    id v19 = v12;
    [v8 enumerateRangesUsingBlock:v16];
    uint64_t v13 = v19;
    id v14 = v12;
  }
  return v11;
}

void __92__SGExtractionDocument_candidatesForLabelTokenIndexes_inPlainText_forTaggedCharacterRanges___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 56), "textRangeForIndexRange:inTaggedCharacterRanges:", a2, a3, *(void *)(a1 + 32));
  id v6 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v4, v5);
  if (v6)
  {
    id v7 = *(void **)(a1 + 48);
    id v9 = v6;
    id v8 = _PASCollapseWhitespaceAndStrip();
    [v7 addObject:v8];

    id v6 = v9;
  }
}

+ (_NSRange)textRangeForIndexRange:(_NSRange)a3 inTaggedCharacterRanges:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  unint64_t v7 = location + length;
  if (v7 <= [v6 count])
  {
    uint64_t v11 = [v6 objectAtIndexedSubscript:location];
    id v12 = [v6 objectAtIndexedSubscript:v7 - 1];
    NSUInteger v13 = [v11 range];
    NSUInteger v15 = v14;
    v23.NSUInteger location = [v12 range];
    v23.NSUInteger length = v16;
    v21.NSUInteger location = v13;
    v21.NSUInteger length = v15;
    NSRange v17 = NSUnionRange(v21, v23);
    NSUInteger v9 = v17.location;
    NSUInteger v10 = v17.length;
  }
  else
  {
    id v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v20 = 0;
      _os_log_error_impl(&dword_1CA650000, v8, OS_LOG_TYPE_ERROR, "SGExtractionDocument: Invalid range", v20, 2u);
    }

    NSUInteger v9 = 0;
    NSUInteger v10 = 0;
  }

  NSUInteger v18 = v9;
  NSUInteger v19 = v10;
  result.NSUInteger length = v19;
  result.NSUInteger location = v18;
  return result;
}

+ (_NSRange)firstRangeInIndexSet:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  NSUInteger v10 = &v9;
  uint64_t v11 = 0x3010000000;
  id v12 = "";
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__SGExtractionDocument_firstRangeInIndexSet___block_invoke;
  v8[3] = &unk_1E65C01B8;
  v8[4] = &v9;
  [v3 enumerateRangesUsingBlock:v8];
  NSUInteger v4 = v10[4];
  NSUInteger v5 = v10[5];
  _Block_object_dispose(&v9, 8);

  NSUInteger v6 = v4;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

uint64_t __45__SGExtractionDocument_firstRangeInIndexSet___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  *(void *)(v4 + 32) = a2;
  *(void *)(v4 + 40) = a3;
  *a4 = 1;
  return result;
}

+ (id)labelTokenIndexesForOutputName:(id)a3 label:(id)a4 modelOutput:(id)a5
{
  return (id)[a1 labelTokenIndexesForOutputName:a3 label:a4 modelOutput:a5 maxMergeDistance:0];
}

+ (id)labelTokenIndexesForOutputName:(id)a3 label:(id)a4 modelOutput:(id)a5 maxMergeDistance:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_opt_new();
  if (v11)
  {
    uint64_t v13 = [v11 objectForKeyedSubscript:v9];
    if ([v13 count])
    {
      unint64_t v14 = 0;
      unint64_t v15 = a6 + 1;
      do
      {
        NSUInteger v16 = [v13 objectAtIndexedSubscript:v14];
        if ([v16 isEqualToString:v10])
        {
          if (a6
            && [v12 lastIndex] != 0x7FFFFFFFFFFFFFFFLL
            && v14 - [v12 lastIndex] >= 2
            && v14 - [v12 lastIndex] <= v15)
          {
            id v17 = v9;
            unint64_t v18 = v15;
            uint64_t v19 = [v12 lastIndex];
            uint64_t v20 = [v12 lastIndex];
            uint64_t v21 = v19;
            unint64_t v15 = v18;
            id v9 = v17;
            objc_msgSend(v12, "addIndexesInRange:", v21, v14 - v20);
          }
          [v12 addIndex:v14];
        }

        ++v14;
      }
      while ([v13 count] > v14);
    }
  }
  else
  {
    long long v22 = sgLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v24 = 0;
      _os_log_error_impl(&dword_1CA650000, v22, OS_LOG_TYPE_ERROR, "SGExtractionDocument: No model output", v24, 2u);
    }
  }
  return v12;
}

+ (id)indexSetForOutputNameLabelForModelOutput:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [v4 allKeys];
  uint64_t v22 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        id v8 = [v4 objectForKeyedSubscript:v7];
        uint64_t v9 = [v8 count];

        if (v9)
        {
          unint64_t v10 = 0;
          do
          {
            id v11 = [v4 objectForKeyedSubscript:v7];
            id v12 = [v11 objectAtIndexedSubscript:v10];

            if (([@"NONE" isEqualToString:v12] & 1) == 0)
            {
              uint64_t v13 = [a1 keyForOutputName:v7 label:v12];
              unint64_t v14 = [v5 objectForKeyedSubscript:v13];

              if (!v14)
              {
                unint64_t v15 = objc_opt_new();
                [v5 setObject:v15 forKeyedSubscript:v13];
              }
              NSUInteger v16 = [v5 objectForKeyedSubscript:v13];
              [v16 addIndex:v10];
            }
            ++v10;
            id v17 = [v4 objectForKeyedSubscript:v7];
            unint64_t v18 = [v17 count];
          }
          while (v18 > v10);
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v22);
  }

  return v5;
}

+ (id)keyForOutputName:(id)a3 label:(id)a4
{
  NSUInteger v5 = (objc_class *)NSString;
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[[v5 alloc] initWithFormat:@"%@_%@", v7, v6];

  return v8;
}

@end