@interface SGStructuredEventDocument
+ (BOOL)caseInsensitiveContainsString:(id)a3 inCandidates:(id)a4;
+ (id)candidatesForLabelIndexSets:(id)a3 inPlainText:(id)a4 forTaggedCharacterRanges:(id)a5;
+ (id)cleanCandidates:(id)a3 outputName:(id)a4 label:(id)a5;
+ (id)modelOutputSummary:(id)a3;
+ (id)simpleCandidateResolutionFromCandidates:(id)a3;
+ (id)stripRepeatedContent:(id)a3 repeatedLength:(unint64_t)a4;
- (BOOL)detectedEventPolarity;
- (NSArray)dataDetectorMatches;
- (NSString)plainText;
- (SGStructuredEventDocument)initWithPlainText:(id)a3 category:(unsigned __int8)a4 dataDetectorMatches:(id)a5 enrichedTaggedCharacterRanges:(id)a6 modelOutput:(id)a7 fromSuggestTool:(BOOL)a8;
- (id)_simpleCandidateForOutputName:(id)a3 label:(id)a4 withError:(id *)a5;
- (id)detectedAddressForLabel:(id)a3 withError:(id *)a4;
- (id)detectedEndAddressWithError:(id *)a3;
- (id)detectedEndDateComponents;
- (id)detectedEndPlaceWithError:(id *)a3;
- (id)detectedEventName;
- (id)detectedPostalAddressExtractionForTokenIndexes:(id)a3 dataDetectorMatches:(id)a4 label:(id)a5;
- (id)detectedReservationIdWithError:(id *)a3;
- (id)detectedStartAddressWithError:(id *)a3;
- (id)detectedStartDateComponents;
- (id)detectedStartPlaceWithError:(id *)a3;
- (id)filterCandidateDateComponents:(id)a3;
- (id)labelTokenIndexesForOutputName:(id)a3 label:(id)a4;
- (id)mergePostalAddressComponents:(id)a3;
- (id)modelOutputSummary;
- (id)predictedStringsFromModelOutput;
- (id)resolveCandidates:(id)a3 forCategory:(unsigned __int8)a4 label:(id)a5 rawIndexSet:(id)a6 taggedCharacterRanges:(id)a7;
- (id)titleMapping;
- (unsigned)category;
@end

@implementation SGStructuredEventDocument

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDetectorMatches, 0);
  objc_storeStrong((id *)&self->_plainText, 0);
}

- (NSArray)dataDetectorMatches
{
  return self->_dataDetectorMatches;
}

- (unsigned)category
{
  return self->_category;
}

- (NSString)plainText
{
  return self->_plainText;
}

- (BOOL)detectedEventPolarity
{
  v3 = [(SGExtractionDocument *)self modelOutput];
  v4 = +[SGExtractionDocument labelTokenIndexesForOutputName:@"polarity" label:@"POLARITY__EVENT_YES" modelOutput:v3];

  v5 = [(SGExtractionDocument *)self modelOutput];
  v6 = [v5 objectForKeyedSubscript:@"polarity"];
  if (v6)
  {
    if ([v4 containsIndex:0])
    {
      v7 = [(SGExtractionDocument *)self modelOutput];
      v8 = [v7 objectForKey:@"polarity"];
      v9 = [v8 firstObject];
      char v10 = [v9 isEqualToString:@"POLARITY__EVENT_YES"];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (id)labelTokenIndexesForOutputName:(id)a3 label:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[SGStructuredEventExtractionModel sharedInstance];
  uint64_t v9 = [v8 maxMergeDistanceForSection:v7 label:v6];

  char v10 = objc_opt_class();
  v11 = [(SGExtractionDocument *)self modelOutput];
  v12 = [v10 labelTokenIndexesForOutputName:v7 label:v6 modelOutput:v11 maxMergeDistance:v9];

  return v12;
}

- (id)resolveCandidates:(id)a3 forCategory:(unsigned __int8)a4 label:(id)a5 rawIndexSet:(id)a6 taggedCharacterRanges:(id)a7
{
  uint64_t v9 = a4;
  BOOL fromSuggestTool = self->_fromSuggestTool;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  v16 = objc_opt_new();
  v17 = +[SGStructuredEventClassification describeCategory:v9];
  if (fromSuggestTool) {
    [v16 resolveCandidatesWithoutXPC:v15 forCategory:v17 label:v14 rawIndexSet:v13 taggedCharacterRanges:v12];
  }
  else {
  v18 = [v16 resolveCandidates:v15 forCategory:v17 label:v14 rawIndexSet:v13 taggedCharacterRanges:v12];
  }

  return v18;
}

- (id)predictedStringsFromModelOutput
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(SGExtractionDocument *)self modelOutput];
  uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v27 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v29 != v27) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (([v7 isEqualToString:@"polarity"] & 1) == 0)
        {
          v8 = [(SGExtractionDocument *)self modelOutput];
          uint64_t v9 = [v8 objectForKeyedSubscript:v7];
          uint64_t v10 = [v9 count];

          if (v10)
          {
            unint64_t v11 = 0;
            do
            {
              id v12 = [(SGExtractionDocument *)self modelOutput];
              id v13 = [v12 objectForKeyedSubscript:v7];
              id v14 = [v13 objectAtIndexedSubscript:v11];

              if (([v14 isEqualToString:@"NONE"] & 1) == 0)
              {
                id v15 = [v3 objectForKeyedSubscript:v14];

                if (!v15)
                {
                  v16 = objc_opt_new();
                  [v3 setObject:v16 forKeyedSubscript:v14];
                }
                v17 = [v3 objectForKeyedSubscript:v14];
                [v17 addIndex:v11];
              }
              ++v11;
              v18 = [(SGExtractionDocument *)self modelOutput];
              v19 = [v18 objectForKeyedSubscript:v7];
              unint64_t v20 = [v19 count];
            }
            while (v20 > v11);
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v5);
  }

  v21 = objc_opt_class();
  v22 = [(SGStructuredEventDocument *)self plainText];
  v23 = [(SGExtractionDocument *)self enrichedTaggedCharacterRanges];
  v24 = [v21 candidatesForLabelIndexSets:v3 inPlainText:v22 forTaggedCharacterRanges:v23];

  return v24;
}

- (id)modelOutputSummary
{
  v3 = objc_opt_class();
  uint64_t v4 = [(SGExtractionDocument *)self modelOutput];
  uint64_t v5 = [v3 modelOutputSummary:v4];

  return v5;
}

- (id)titleMapping
{
  if (self->_category - 4 > 4) {
    return 0;
  }
  else {
    return off_1E65B5768[(self->_category - 4)];
  }
}

- (id)detectedPostalAddressExtractionForTokenIndexes:(id)a3 dataDetectorMatches:(id)a4 label:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(SGExtractionDocument *)self modelOutput];

  if (!v11)
  {
    v16 = 0;
    v17 = 0;
    goto LABEL_16;
  }
  id v12 = objc_opt_new();
  id v13 = objc_opt_new();
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __102__SGStructuredEventDocument_detectedPostalAddressExtractionForTokenIndexes_dataDetectorMatches_label___block_invoke;
  uint64_t v27 = &unk_1E65B5728;
  long long v28 = self;
  id v29 = v9;
  id v14 = v13;
  id v30 = v14;
  id v15 = v12;
  id v31 = v15;
  [v8 enumerateRangesUsingBlock:&v24];
  if (objc_msgSend(v14, "count", v24, v25, v26, v27, v28) == 1)
  {
    v16 = [v14 anyObject];
    if (v16) {
      goto LABEL_14;
    }
  }
  else if ((unint64_t)[v14 count] >= 2)
  {
    v18 = [v14 allObjects];
    v16 = [(SGStructuredEventDocument *)self mergePostalAddressComponents:v18];

    if (v16) {
      goto LABEL_14;
    }
  }
  if ([v15 count] != 1)
  {
    if ((unint64_t)[v15 count] >= 2)
    {
      v19 = [v15 allObjects];
      uint64_t category = self->_category;
      v21 = [(SGExtractionDocument *)self enrichedTaggedCharacterRanges];
      v17 = [(SGStructuredEventDocument *)self resolveCandidates:v19 forCategory:category label:v10 rawIndexSet:v8 taggedCharacterRanges:v21];

      goto LABEL_12;
    }
    v16 = 0;
LABEL_14:
    v17 = 0;
    goto LABEL_15;
  }
  v17 = [v15 anyObject];
LABEL_12:
  v16 = 0;
LABEL_15:

LABEL_16:
  v22 = [[SGPostalAddressExtraction alloc] initWithPlainText:v17 components:v16];

  return v22;
}

void __102__SGStructuredEventDocument_detectedPostalAddressExtractionForTokenIndexes_dataDetectorMatches_label___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = objc_msgSend(*(id *)(a1 + 32), "textRangeForTokenRange:", a2, a3);
  NSUInteger v6 = v5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v24 = a1;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
        id v13 = (void *)MEMORY[0x1CB79B230]();
        if ([v12 matchType] == 1)
        {
          uint64_t v14 = [v12 postalAddressComponents];
          if (v14)
          {
            id v15 = (void *)v14;
            v32.location = [v12 range];
            v32.NSUInteger length = v16;
            v31.location = v4;
            v31.NSUInteger length = v6;
            NSUInteger length = NSIntersectionRange(v31, v32).length;

            if (length)
            {
              v18 = *(void **)(v24 + 48);
              v19 = [v12 postalAddressComponents];
              [v18 addObject:v19];
            }
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  unint64_t v20 = *(void **)(v24 + 56);
  v21 = [*(id *)(v24 + 32) plainText];
  v22 = objc_msgSend(v21, "substringWithRange:", v4, v6);
  v23 = _PASCollapseWhitespaceAndStrip();
  [v20 addObject:v23];
}

- (id)mergePostalAddressComponents:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    NSUInteger v6 = 0;
    id v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    id obj = v3;
    uint64_t v36 = *(void *)v38;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v38 != v36) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "street", obj);

        if (v13)
        {
          if (v6)
          {
            uint64_t v14 = [v12 street];
            uint64_t v15 = [v6 caseInsensitiveCompare:v14];

            if (v15)
            {
LABEL_29:
              id v3 = obj;

              uint64_t v33 = 0;
              goto LABEL_32;
            }
          }
          uint64_t v16 = [v12 street];

          NSUInteger v6 = (void *)v16;
        }
        v17 = [v12 city];

        if (v17)
        {
          if (v7)
          {
            v18 = [v12 city];
            uint64_t v19 = [v7 caseInsensitiveCompare:v18];

            if (v19) {
              goto LABEL_29;
            }
          }
          uint64_t v20 = [v12 city];

          id v7 = (void *)v20;
        }
        v21 = [v12 postalCode];

        if (v21)
        {
          if (v8)
          {
            v22 = [v12 postalCode];
            uint64_t v23 = [v8 caseInsensitiveCompare:v22];

            if (v23) {
              goto LABEL_29;
            }
          }
          uint64_t v24 = [v12 postalCode];

          uint64_t v8 = (void *)v24;
        }
        long long v25 = [v12 state];

        if (v25)
        {
          if (v9)
          {
            long long v26 = [v12 state];
            uint64_t v27 = [v9 caseInsensitiveCompare:v26];

            if (v27) {
              goto LABEL_29;
            }
          }
          uint64_t v28 = [v12 state];

          uint64_t v9 = (void *)v28;
        }
        id v29 = [v12 country];

        if (v29)
        {
          if (v10)
          {
            uint64_t v30 = [v12 country];
            uint64_t v31 = [v10 caseInsensitiveCompare:v30];

            if (v31) {
              goto LABEL_29;
            }
          }
          uint64_t v32 = [v12 country];

          uint64_t v10 = (void *)v32;
        }
      }
      id v3 = obj;
      uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    NSUInteger v6 = 0;
    id v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }

  uint64_t v33 = [MEMORY[0x1E4F5DAE8] components:v6 city:v7 state:v9 postalCode:v8 country:v10];
LABEL_32:

  return v33;
}

- (id)_simpleCandidateForOutputName:(id)a3 label:(id)a4 withError:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(SGExtractionDocument *)self modelOutput];
  if (!v10
    || (uint64_t v11 = (void *)v10,
        [(SGExtractionDocument *)self enrichedTaggedCharacterRanges],
        id v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12))
  {
    id v13 = sgEventsLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v9;
      _os_log_error_impl(&dword_1CA650000, v13, OS_LOG_TYPE_ERROR, "SGStructuredEventDocument: Unable to detect %@, missing modelOutput or enrichedTaggedCharacterRanges", buf, 0xCu);
    }
    goto LABEL_8;
  }
  id v13 = [(SGStructuredEventDocument *)self labelTokenIndexesForOutputName:v8 label:v9];
  if (![v13 count])
  {
LABEL_8:
    v17 = 0;
    goto LABEL_16;
  }
  uint64_t v14 = [(SGExtractionDocument *)self candidatesForLabelTokenIndexes:v13 inPlainText:self->_plainText];
  uint64_t v15 = [(id)objc_opt_class() cleanCandidates:v14 outputName:v8 label:v9];
  uint64_t v16 = [(id)objc_opt_class() simpleCandidateResolutionFromCandidates:v15];
  v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    if ((unint64_t)[v15 count] < 2)
    {
      id v18 = 0;
    }
    else
    {
      uint64_t category = self->_category;
      uint64_t v20 = [(SGExtractionDocument *)self enrichedTaggedCharacterRanges];
      id v18 = [(SGStructuredEventDocument *)self resolveCandidates:v15 forCategory:category label:v9 rawIndexSet:v13 taggedCharacterRanges:v20];
    }
    if (a5 && !v18)
    {
      id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v22 = (void *)[[NSString alloc] initWithFormat:@"SGStructuredEventDocument: %@, unable to resolve candidates", v9];
      long long v26 = v22;
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      *a5 = (id)[v21 initWithDomain:@"SGExtractionDocumentErrorDomain" code:1 userInfo:v23];

      id v18 = 0;
    }
  }

LABEL_16:
  return v17;
}

- (id)detectedEndPlaceWithError:(id *)a3
{
  return [(SGStructuredEventDocument *)self _simpleCandidateForOutputName:@"location" label:@"EVENT_LOCATION__END_PLACE" withError:a3];
}

- (id)detectedStartPlaceWithError:(id *)a3
{
  return [(SGStructuredEventDocument *)self _simpleCandidateForOutputName:@"location" label:@"EVENT_LOCATION__START_PLACE" withError:a3];
}

- (id)detectedAddressForLabel:(id)a3 withError:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(SGExtractionDocument *)self modelOutput];
  if (!v7
    || (id v8 = (void *)v7,
        [(SGExtractionDocument *)self enrichedTaggedCharacterRanges],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        !v9))
  {
    uint64_t v10 = sgEventsLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_error_impl(&dword_1CA650000, v10, OS_LOG_TYPE_ERROR, "SGStructuredEventDocument: Unable to detect startAddress, missing modelOutput or enrichedTaggedCharacterRanges", v16, 2u);
    }
    goto LABEL_9;
  }
  uint64_t v10 = [(SGStructuredEventDocument *)self labelTokenIndexesForOutputName:@"location" label:v6];
  if (![v10 count])
  {
LABEL_9:
    uint64_t v11 = 0;
    goto LABEL_10;
  }
  uint64_t v11 = [(SGStructuredEventDocument *)self detectedPostalAddressExtractionForTokenIndexes:v10 dataDetectorMatches:self->_dataDetectorMatches label:v6];
  char v12 = [v11 hasExtraction];
  if (a4 && (v12 & 1) == 0)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"SGStructuredEventDocument: address, unable to resolve candidates";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    *a4 = (id)[v13 initWithDomain:@"SGExtractionDocumentErrorDomain" code:1 userInfo:v14];
  }
LABEL_10:

  return v11;
}

- (id)detectedEndAddressWithError:(id *)a3
{
  return [(SGStructuredEventDocument *)self detectedAddressForLabel:@"EVENT_LOCATION__END_ADDRESS" withError:a3];
}

- (id)detectedStartAddressWithError:(id *)a3
{
  return [(SGStructuredEventDocument *)self detectedAddressForLabel:@"EVENT_LOCATION__START_ADDRESS" withError:a3];
}

- (id)filterCandidateDateComponents:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    uint64_t v4 = [v3 firstObject];
  }
  else
  {
    if ((unint64_t)[v3 count] < 2)
    {
      id v5 = 0;
      goto LABEL_11;
    }
    uint64_t v4 = [(id)objc_opt_class() mergeDetectedDateComponents:v3];
  }
  id v5 = v4;
  if (v4
    && ([v4 year] == 0x7FFFFFFFFFFFFFFFLL
     || [v5 month] == 0x7FFFFFFFFFFFFFFFLL
     || [v5 day] == 0x7FFFFFFFFFFFFFFFLL))
  {
    id v6 = 0;
    goto LABEL_12;
  }
LABEL_11:
  id v5 = v5;
  id v6 = v5;
LABEL_12:

  return v6;
}

- (id)detectedEndDateComponents
{
  uint64_t v3 = [(SGExtractionDocument *)self modelOutput];
  if (v3
    && (uint64_t v4 = (void *)v3,
        [(SGExtractionDocument *)self enrichedTaggedCharacterRanges],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = [(SGStructuredEventDocument *)self labelTokenIndexesForOutputName:@"time" label:@"EVENT_TIME__END_DATETIME"];
    LOBYTE(v11) = 1;
    uint64_t v7 = [(SGExtractionDocument *)self detectedDateComponentsForTokenIndexes:v6 dataDetectorMatches:self->_dataDetectorMatches allowDatesInPast:1 inferDates:0 approximateTime:0 partialDate:0 useEndForDurations:v11];
    id v8 = [(SGStructuredEventDocument *)self filterCandidateDateComponents:v7];
  }
  else
  {
    id v9 = sgEventsLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v9, OS_LOG_TYPE_ERROR, "SGStructuredEventDocument: Unable to detect endDateComponents, missing modelOutput or enrichedTaggedCharacterRanges", buf, 2u);
    }

    id v8 = 0;
  }
  return v8;
}

- (id)detectedStartDateComponents
{
  uint64_t v3 = [(SGExtractionDocument *)self modelOutput];
  if (v3
    && (uint64_t v4 = (void *)v3,
        [(SGExtractionDocument *)self enrichedTaggedCharacterRanges],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = [(SGStructuredEventDocument *)self labelTokenIndexesForOutputName:@"time" label:@"EVENT_TIME__START_DATETIME"];
    LOBYTE(v11) = 0;
    uint64_t v7 = [(SGExtractionDocument *)self detectedDateComponentsForTokenIndexes:v6 dataDetectorMatches:self->_dataDetectorMatches allowDatesInPast:1 inferDates:0 approximateTime:0 partialDate:0 useEndForDurations:v11];
    id v8 = [(SGStructuredEventDocument *)self filterCandidateDateComponents:v7];
  }
  else
  {
    id v9 = sgEventsLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v9, OS_LOG_TYPE_ERROR, "SGStructuredEventDocument: Unable to detect startDateComponents, missing modelOutput or enrichedTaggedCharacterRanges", buf, 2u);
    }

    id v8 = 0;
  }
  return v8;
}

- (id)detectedReservationIdWithError:(id *)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(SGExtractionDocument *)self modelOutput];
  if (v5
    && (id v6 = (void *)v5,
        [(SGExtractionDocument *)self enrichedTaggedCharacterRanges],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    id v8 = [(SGStructuredEventDocument *)self labelTokenIndexesForOutputName:@"core" label:@"EVENT_CORE__RESERVATION_ID"];
    id v9 = [(SGExtractionDocument *)self candidatesForLabelTokenIndexes:v8 inPlainText:self->_plainText];
    if ([v9 count])
    {
      uint64_t v10 = [(id)objc_opt_class() simpleCandidateResolutionFromCandidates:v9];
      if (!v10)
      {
        if ((unint64_t)[v9 count] < 2)
        {
          uint64_t v10 = 0;
        }
        else
        {
          uint64_t category = self->_category;
          char v12 = [(SGExtractionDocument *)self enrichedTaggedCharacterRanges];
          uint64_t v10 = [(SGStructuredEventDocument *)self resolveCandidates:v9 forCategory:category label:@"EVENT_CORE__RESERVATION_ID" rawIndexSet:v8 taggedCharacterRanges:v12];
        }
        if (a3 && !v10)
        {
          id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v18 = *MEMORY[0x1E4F28568];
          v19[0] = @"SGStructuredEventDocument: reservationId, unable to resolve candidates";
          uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
          *a3 = (id)[v14 initWithDomain:@"SGExtractionDocumentErrorDomain" code:1 userInfo:v15];
        }
      }
      id v13 = v10;
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v8 = sgEventsLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_error_impl(&dword_1CA650000, v8, OS_LOG_TYPE_ERROR, "SGStructuredEventDocument: Unable to detect reservationId, missing modelOutput or enrichedTaggedCharacterRanges", v17, 2u);
    }
    id v13 = 0;
  }

  return v13;
}

- (id)detectedEventName
{
  uint64_t v3 = [(SGExtractionDocument *)self modelOutput];
  if (v3
    && (uint64_t v4 = (void *)v3,
        [(SGExtractionDocument *)self enrichedTaggedCharacterRanges],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4,
        v6))
  {
    uint64_t v7 = [(SGStructuredEventDocument *)self titleMapping];
    if (v7)
    {
      id v8 = v7;
      id v9 = [(SGStructuredEventDocument *)self labelTokenIndexesForOutputName:@"title" label:v7];
      uint64_t v10 = [(SGExtractionDocument *)self candidatesForLabelTokenIndexes:v9 inPlainText:self->_plainText];
      uint64_t v11 = [(id)objc_opt_class() cleanCandidates:v10 outputName:@"title" label:v8];
      char v12 = [(id)objc_opt_class() simpleCandidateResolutionFromCandidates:v11];
      id v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else if ((unint64_t)[v11 count] < 2)
      {
        id v14 = 0;
      }
      else
      {
        uint64_t category = self->_category;
        uint64_t v17 = [(SGExtractionDocument *)self enrichedTaggedCharacterRanges];
        id v14 = [(SGStructuredEventDocument *)self resolveCandidates:v11 forCategory:category label:v8 rawIndexSet:v9 taggedCharacterRanges:v17];
      }
      goto LABEL_16;
    }
    uint64_t v15 = sgEventsLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_error_impl(&dword_1CA650000, v15, OS_LOG_TYPE_ERROR, "SGStructuredEventDocument: No title mapping, unsupported category", v19, 2u);
    }

    id v8 = 0;
  }
  else
  {
    id v8 = sgEventsLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA650000, v8, OS_LOG_TYPE_ERROR, "SGStructuredEventDocument: Unable to detect title, missing modelOutput or enrichedTaggedCharacterRanges", buf, 2u);
    }
  }
  id v14 = 0;
LABEL_16:

  return v14;
}

- (SGStructuredEventDocument)initWithPlainText:(id)a3 category:(unsigned __int8)a4 dataDetectorMatches:(id)a5 enrichedTaggedCharacterRanges:(id)a6 modelOutput:(id)a7 fromSuggestTool:(BOOL)a8
{
  id v15 = a3;
  id v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SGStructuredEventDocument;
  uint64_t v17 = [(SGExtractionDocument *)&v20 initWithEnrichedTaggedCharacterRanges:a6 modelOutput:a7];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_plainText, a3);
    v18->_uint64_t category = a4;
    objc_storeStrong((id *)&v18->_dataDetectorMatches, a5);
    v18->_BOOL fromSuggestTool = a8;
  }

  return v18;
}

+ (id)stripRepeatedContent:(id)a3 repeatedLength:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a4 && [v5 length] >= a4)
  {
    unint64_t v7 = vcvtpd_u64_f64((double)(unint64_t)[v6 length] * 0.5);
    uint64_t v8 = [v6 substringToIndex:v7];
    _PASTrimTrailingWhitespace();
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v10 = [v6 substringFromIndex:v7];
    LOBYTE(v8) = [v9 isEqualToString:v10];

    if (v8) {
      goto LABEL_6;
    }
  }
  id v9 = v6;
LABEL_6:

  return v9;
}

+ (id)cleanCandidates:(id)a3 outputName:(id)a4 label:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = +[SGStructuredEventExtractionModel sharedInstance];
  [v10 stripRepeatedContentForSectionLength:v8 label:v7];

  uint64_t v11 = sgMap();

  return v11;
}

uint64_t __62__SGStructuredEventDocument_cleanCandidates_outputName_label___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) stripRepeatedContent:a2 repeatedLength:*(void *)(a1 + 40)];
}

+ (BOOL)caseInsensitiveContainsString:(id)a3 inCandidates:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "caseInsensitiveCompare:", v5, (void)v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)simpleCandidateResolutionFromCandidates:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(a1, "caseInsensitiveContainsString:inCandidates:", v11, v5, (void)v14) & 1) == 0) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if ([v5 count] == 1)
  {
    long long v12 = [v5 firstObject];
  }
  else
  {
    long long v12 = 0;
  }

  return v12;
}

+ (id)candidatesForLabelIndexSets:(id)a3 inPlainText:(id)a4 forTaggedCharacterRanges:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v20 = (id)objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = [v11 objectForKeyedSubscript:v16];
        uint64_t v18 = [a1 candidatesForLabelTokenIndexes:v17 inPlainText:v9 forTaggedCharacterRanges:v10];

        if (v18) {
          [v20 setObject:v18 forKeyedSubscript:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  return v20;
}

+ (id)modelOutputSummary:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = v3;
  uint64_t v23 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    id v21 = v5;
    uint64_t v22 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v5);
        }
        uint64_t v7 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v8 = objc_msgSend(v5, "objectForKeyedSubscript:", v7, v21);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v24 = i;
          id v11 = 0;
          uint64_t v12 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              uint64_t v14 = v11;
              if (*(void *)v26 != v12) {
                objc_enumerationMutation(v8);
              }
              long long v15 = *(void **)(*((void *)&v25 + 1) + 8 * j);
              if ((!v14 || ([v14 isEqualToString:*(void *)(*((void *)&v25 + 1) + 8 * j)] & 1) == 0)
                && ([@"NONE" isEqualToString:v15] & 1) == 0)
              {
                uint64_t v16 = [v4 objectForKeyedSubscript:v15];

                if (v16)
                {
                  long long v17 = NSNumber;
                  uint64_t v18 = [v4 objectForKeyedSubscript:v15];
                  uint64_t v19 = objc_msgSend(v17, "numberWithUnsignedInt:", objc_msgSend(v18, "unsignedIntValue") + 1);
                  [v4 setObject:v19 forKeyedSubscript:v15];
                }
                else
                {
                  [v4 setObject:&unk_1F25356A0 forKeyedSubscript:v15];
                }
              }
              id v11 = v15;
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v10);

          id v5 = v21;
          uint64_t i = v24;
        }
      }
      uint64_t v23 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }

  return v4;
}

@end