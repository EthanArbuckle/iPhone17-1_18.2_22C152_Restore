@interface PKTextInputDebugLogEntry
+ (id)_minimalReferenceString:(id)a3 rangeOfInterest:(_NSRange)a4 tokenSearchDistance:(int64_t)a5 localeIdentifier:(id)a6;
+ (id)_mutableDictionaryRepresentationForResultQueryItem:(id)a3 detailLevel:(int64_t)a4;
+ (id)_referenceSubstringForTargetContentInfo:(id)a3 resultAffectedRange:(_NSRange)a4 targetContentLevel:(int64_t)a5 localeIdentifier:(id)a6;
+ (id)loggedDateFormatter;
+ (id)mediumDescriptionForResultQueryItem:(id)a3;
- (BOOL)inputContainsInProgressStroke;
- (CHTextInputTargetContentInfo)inputTargetContentInfo;
- (CHTokenizedTextResult)tokenizedTextResult;
- (NSArray)inputTargets;
- (NSArray)recognitionLocaleIdentifiers;
- (NSDate)entryDate;
- (NSString)inputTargetElementType;
- (NSString)resultCommitReason;
- (NSString)resultCommittedText;
- (NSString)resultTopTranscription;
- (NSString)resultTypeDescription;
- (PKDrawing)inputDrawing;
- (_NSRange)resultAffectedRange;
- (double)resultRecognitionDuration;
- (id)description;
- (id)dictionaryRepresentationWithDetailLevel:(int64_t)a3 targetContentLevel:(int64_t)a4;
- (id)dictionaryRepresentationWithTargetContentLevel:(int64_t)a3;
- (id)mediumDescription;
- (id)minimalDescription;
- (id)referenceSubstringWithTargetContentLevel:(int64_t)a3;
- (int64_t)resultCommittedTokenColumnCount;
- (int64_t)resultType;
- (void)setEntryDate:(id)a3;
- (void)setInputContainsInProgressStroke:(BOOL)a3;
- (void)setInputDrawing:(id)a3;
- (void)setInputTargetContentInfo:(id)a3;
- (void)setInputTargetElementType:(id)a3;
- (void)setInputTargets:(id)a3;
- (void)setRecognitionLocaleIdentifiers:(id)a3;
- (void)setResultAffectedRange:(_NSRange)a3;
- (void)setResultCommitReason:(id)a3;
- (void)setResultCommittedText:(id)a3;
- (void)setResultCommittedTokenColumnCount:(int64_t)a3;
- (void)setResultRecognitionDuration:(double)a3;
- (void)setResultTopTranscription:(id)a3;
- (void)setResultTypeDescription:(id)a3;
- (void)setTokenizedTextResult:(id)a3;
@end

@implementation PKTextInputDebugLogEntry

- (id)description
{
  v3 = [(PKTextInputDebugLogEntry *)self inputDrawing];
  v4 = [v3 strokes];
  uint64_t v5 = [v4 count];

  if (v5 == 1)
  {
    v6 = @"1 stroke";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld strokes", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v7 = [(PKTextInputDebugLogEntry *)self resultTopTranscription];
  v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = &stru_1F1FB2C00;
  }
  v10 = v9;

  uint64_t v11 = [(PKTextInputDebugLogEntry *)self resultCommittedText];
  v12 = (void *)v11;
  if (v11) {
    v13 = (__CFString *)v11;
  }
  else {
    v13 = &stru_1F1FB2C00;
  }
  v14 = v13;

  if ([(PKTextInputDebugLogEntry *)self resultAffectedRange] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = @"N/A";
  }
  else
  {
    v25.location = [(PKTextInputDebugLogEntry *)self resultAffectedRange];
    NSStringFromRange(v25);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v23.receiver = self;
  v23.super_class = (Class)PKTextInputDebugLogEntry;
  v16 = [(PKTextInputDebugLogEntry *)&v23 description];
  v17 = [(PKTextInputDebugLogEntry *)self inputTargetContentInfo];
  v18 = [v17 textInputTarget];
  v19 = [v18 inputTargetIdentifier];
  v20 = [(PKTextInputDebugLogEntry *)self resultTypeDescription];
  v21 = [v16 stringByAppendingFormat:@" drawing: %@, targetID: %@, resultType: %@, affectedRange: %@, transcription: \"%@\", committedText: \"%@\"", v6, v19, v20, v15, v10, v14];

  return v21;
}

- (id)minimalDescription
{
  v3 = [(PKTextInputDebugLogEntry *)self inputDrawing];
  v4 = [v3 strokes];
  uint64_t v5 = [v4 count];

  if (v5 == 1)
  {
    v6 = @"1 stroke";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld strokes", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if ([(PKTextInputDebugLogEntry *)self resultAffectedRange] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = @"(No range)";
  }
  else
  {
    v16.location = [(PKTextInputDebugLogEntry *)self resultAffectedRange];
    NSStringFromRange(v16);
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if ([(PKTextInputDebugLogEntry *)self resultType] == 1)
  {
    uint64_t v8 = [(PKTextInputDebugLogEntry *)self resultTopTranscription];
    v9 = (void *)v8;
    v10 = &stru_1F1FB2C00;
    if (v8) {
      v10 = (__CFString *)v8;
    }
    uint64_t v11 = v10;

    v12 = [NSString stringWithFormat:@"Text: \"%@\"", v11];
  }
  else
  {
    v12 = [(PKTextInputDebugLogEntry *)self resultTypeDescription];
  }
  v13 = [NSString stringWithFormat:@"%@, %@, %@", v6, v7, v12];

  return v13;
}

- (int64_t)resultType
{
  id v2 = [(PKTextInputDebugLogEntry *)self resultTypeDescription];
  if ([v2 isEqualToString:@"None"])
  {
    int64_t v3 = 0;
  }
  else if ([v2 isEqualToString:@"Text"])
  {
    int64_t v3 = 1;
  }
  else if ([v2 isEqualToString:@"Dot"])
  {
    int64_t v3 = 2;
  }
  else if ([v2 isEqualToString:@"Line"])
  {
    int64_t v3 = 3;
  }
  else if ([v2 isEqualToString:@"Encircle"])
  {
    int64_t v3 = 4;
  }
  else if ([v2 isEqualToString:@"Polygon"])
  {
    int64_t v3 = 5;
  }
  else if ([v2 isEqualToString:@"Scribble"])
  {
    int64_t v3 = 6;
  }
  else if ([v2 isEqualToString:@"SplitJoin"])
  {
    int64_t v3 = 7;
  }
  else if ([v2 isEqualToString:@"InsertionCaret"])
  {
    int64_t v3 = 8;
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

- (id)mediumDescription
{
  id v2 = [(PKTextInputDebugLogEntry *)self dictionaryRepresentationWithDetailLevel:0 targetContentLevel:2];
  int64_t v3 = [v2 description];

  return v3;
}

+ (id)mediumDescriptionForResultQueryItem:(id)a3
{
  int64_t v3 = +[PKTextInputDebugLogEntry _mutableDictionaryRepresentationForResultQueryItem:a3 detailLevel:0];
  v4 = [v3 description];

  return v4;
}

- (id)referenceSubstringWithTargetContentLevel:(int64_t)a3
{
  uint64_t v5 = [(PKTextInputDebugLogEntry *)self inputTargetContentInfo];
  uint64_t v6 = [(PKTextInputDebugLogEntry *)self resultAffectedRange];
  uint64_t v8 = v7;
  v9 = objc_opt_class();
  v10 = [(PKTextInputDebugLogEntry *)self recognitionLocaleIdentifiers];
  uint64_t v11 = [v10 firstObject];
  v12 = objc_msgSend(v9, "_referenceSubstringForTargetContentInfo:resultAffectedRange:targetContentLevel:localeIdentifier:", v5, v6, v8, a3, v11);

  return v12;
}

+ (id)_referenceSubstringForTargetContentInfo:(id)a3 resultAffectedRange:(_NSRange)a4 targetContentLevel:(int64_t)a5 localeIdentifier:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  id v12 = a6;
  v13 = [v11 referenceSubstring];
  v14 = v13;
  switch(a5)
  {
    case 2:
      v20 = v13;
LABEL_12:
      v22 = v20;
      goto LABEL_14;
    case 1:
      uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      if (location == 0x7FFFFFFFFFFFFFFFLL
        || [v11 referenceSubstringRange] == 0x7FFFFFFFFFFFFFFFLL
        || location < [v11 referenceSubstringRange])
      {
        NSUInteger length = 0;
      }
      else
      {
        uint64_t v24 = [v11 referenceSubstringRange];
        if (location + length <= v24 + v25)
        {
          uint64_t v21 = location - [v11 referenceSubstringRange];
        }
        else
        {
          NSUInteger length = 0;
          uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      id v15 = a1;
      NSRange v16 = v14;
      uint64_t v17 = v21;
      NSUInteger v18 = length;
      uint64_t v19 = 10;
      goto LABEL_11;
    case 0:
      id v15 = a1;
      NSRange v16 = v14;
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      NSUInteger v18 = 0;
      uint64_t v19 = 0;
LABEL_11:
      objc_msgSend(v15, "_minimalReferenceString:rangeOfInterest:tokenSearchDistance:localeIdentifier:", v16, v17, v18, v19, v12);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
  }
  v22 = &stru_1F1FB2C00;
LABEL_14:

  return v22;
}

- (id)dictionaryRepresentationWithTargetContentLevel:(int64_t)a3
{
  return [(PKTextInputDebugLogEntry *)self dictionaryRepresentationWithDetailLevel:1 targetContentLevel:a3];
}

- (id)dictionaryRepresentationWithDetailLevel:(int64_t)a3 targetContentLevel:(int64_t)a4
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)_mutableDictionaryRepresentationForResultQueryItem:(id)a3 detailLevel:(int64_t)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v7 = [v5 correctionResult];
  uint64_t v8 = [v7 textResult];
  v9 = [v5 itemIdentifier];
  [v6 setObject:v9 forKeyedSubscript:@"itemIdentifier"];

  v10 = [v5 itemStableIdentifier];
  [v6 setObject:v10 forKeyedSubscript:@"itemStableIdentifier"];

  if (v7)
  {
    id v11 = [v7 inputTarget];
    id v12 = [v11 inputTargetIdentifier];
    [v6 setObject:v12 forKeyedSubscript:@"inputTargetIdentifier"];

    v83.NSUInteger location = [v7 affectedRange];
    v13 = NSStringFromRange(v83);
    [v6 setObject:v13 forKeyedSubscript:@"affectedRange"];

    unint64_t v14 = [v7 resultType];
    id v15 = &stru_1F1FB2C00;
    if (v14 <= 8) {
      id v15 = off_1E64CB930[v14];
    }
    [v6 setObject:v15 forKeyedSubscript:@"resultType"];
    NSRange v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "isCharacterLevel"));
    [v6 setObject:v16 forKeyedSubscript:@"isCharacterLevel"];

    uint64_t v17 = [v8 recognizerDebugDescription];
    [v6 setObject:v17 forKeyedSubscript:@"recognizerInfo"];

    NSUInteger v18 = [v7 error];

    if (v18)
    {
      uint64_t v19 = [v7 error];
      v20 = [v19 localizedDescription];
      [v6 setObject:v20 forKeyedSubscript:@"error"];
    }
    if (v8)
    {
      int64_t v61 = a4;
      v62 = v7;
      id v63 = v5;
      uint64_t v21 = [v8 topTranscription];
      v22 = (void *)v21;
      if (v21) {
        objc_super v23 = (__CFString *)v21;
      }
      else {
        objc_super v23 = &stru_1F1FB2C00;
      }
      v64 = v6;
      [v6 setObject:v23 forKeyedSubscript:@"topTranscription"];

      v66 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "tokenColumnCount"));
      uint64_t v24 = [v8 transcriptionPaths];
      v65 = [v24 firstObject];

      if ([v8 tokenColumnCount] >= 1)
      {
        uint64_t v25 = 0;
        unint64_t v26 = 0x1E4F28000uLL;
        do
        {
          v27 = v8;
          [v8 tokenRowsAtColumnIndex:v25];
          v68 = uint64_t v67 = v25;
          v28 = objc_msgSend(v68, "objectAtIndexedSubscript:", objc_msgSend(v65, "indexAtPosition:", v25));
          v29 = [*(id *)(v26 + 3704) string];
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          id v30 = v28;
          uint64_t v31 = [v30 countByEnumeratingWithState:&v72 objects:v80 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = 0;
            uint64_t v34 = *(void *)v73;
            do
            {
              for (uint64_t i = 0; i != v32; ++i)
              {
                if (*(void *)v73 != v34) {
                  objc_enumerationMutation(v30);
                }
                v36 = *(void **)(*((void *)&v72 + 1) + 8 * i);
                if (v33 + i < 1)
                {
                  v37 = &stru_1F1FB2C00;
                }
                else
                {
                  v37 = [v27 precedingSeparatorForToken:*(void *)(*((void *)&v72 + 1) + 8 * i)];
                }
                uint64_t v38 = [v36 string];
                v39 = (void *)v38;
                if (v38) {
                  v40 = (__CFString *)v38;
                }
                else {
                  v40 = &stru_1F1FB2C00;
                }
                v41 = v40;

                [v29 appendFormat:@"%@%@", v37, v41];
              }
              v33 += v32;
              uint64_t v32 = [v30 countByEnumeratingWithState:&v72 objects:v80 count:16];
            }
            while (v32);
          }

          uint64_t v42 = [v68 count];
          uint64_t v43 = [v30 firstObject];
          if (v43)
          {
            uint64_t v8 = v27;
            v44 = v27;
            v45 = (void *)v43;
            v46 = [v44 precedingSeparatorForToken:v43];
            uint64_t v47 = v67;
            unint64_t v48 = 0x1E4F28000;
          }
          else
          {
            v46 = 0;
            uint64_t v8 = v27;
            uint64_t v47 = v67;
            unint64_t v48 = 0x1E4F28000uLL;
            v45 = 0;
          }
          uint64_t v49 = v42 - 1;
          v50 = &stru_1F1FB2C00;
          if (v46) {
            v50 = v46;
          }
          v51 = v50;

          v52 = objc_msgSend(v8, "strokeIndexesForColumnsInRange:", v47, 1);
          v53 = [*(id *)(v48 + 3704) string];
          v70[0] = MEMORY[0x1E4F143A8];
          v70[1] = 3221225472;
          v70[2] = __91__PKTextInputDebugLogEntry__mutableDictionaryRepresentationForResultQueryItem_detailLevel___block_invoke;
          v70[3] = &unk_1E64CB910;
          id v71 = v53;
          id v54 = v53;
          [v52 enumerateRangesUsingBlock:v70];
          v79[0] = v29;
          v78[0] = @"topTranscription";
          v78[1] = @"candidatesCount";
          v55 = [NSNumber numberWithInteger:v49];
          v79[1] = v55;
          v79[2] = v51;
          v78[2] = @"precedingSeparator";
          v78[3] = @"strokeIndexes";
          v79[3] = v54;
          v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:4];
          [v66 addObject:v56];

          unint64_t v26 = 0x1E4F28000;
          uint64_t v25 = v47 + 1;
        }
        while (v25 < [v8 tokenColumnCount]);
      }
      uint64_t v6 = v64;
      [v64 setObject:v66 forKeyedSubscript:@"tokenColumns"];
      uint64_t v7 = v62;
      id v5 = v63;
      if (v61 == 1)
      {
        id v69 = 0;
        v57 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v69];
        id v58 = v69;
        if (v57)
        {
          [v64 setObject:v57 forKeyedSubscript:@"tokenizedTextResultData"];
        }
        else
        {
          v59 = os_log_create("com.apple.pencilkit", "PencilTextInput");
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v77 = v58;
            _os_log_error_impl(&dword_1C44F8000, v59, OS_LOG_TYPE_ERROR, "Error archiving CHTokenizedTextResult: %@", buf, 0xCu);
          }
        }
      }
    }
  }

  return v6;
}

void __91__PKTextInputDebugLogEntry__mutableDictionaryRepresentationForResultQueryItem_detailLevel___block_invoke(uint64_t a1, NSUInteger a2, NSUInteger a3)
{
  if ([*(id *)(a1 + 32) length]) {
    [*(id *)(a1 + 32) appendString:@", "];
  }
  uint64_t v6 = *(void **)(a1 + 32);
  v9.NSUInteger location = a2;
  v9.NSUInteger length = a3;
  NSStringFromRange(v9);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 appendFormat:@"%@", v7];
}

+ (id)loggedDateFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  int64_t v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  v4 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v2 setTimeZone:v4];

  [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS Z"];

  return v2;
}

+ (id)_minimalReferenceString:(id)a3 rangeOfInterest:(_NSRange)a4 tokenSearchDistance:(int64_t)a5 localeIdentifier:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v10 = (__CFString *)a3;
  id v11 = a6;
  if (location == 0x7FFFFFFFFFFFFFFFLL || ![(__CFString *)v10 length])
  {
    objc_msgSend(&stru_1F1FB2C00, "stringByPaddingToLength:withString:startingAtIndex:", -[__CFString length](v10, "length"), @"_", 0);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (![v11 length]
      || ([MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v11],
          (CFLocaleRef v12 = (const __CFLocale *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      CFLocaleRef v12 = [MEMORY[0x1E4F1CA20] currentLocale];
    }
    uint64_t v13 = location - a5;
    CFIndex v14 = (location - a5) & ~((uint64_t)(location - a5) >> 63);
    unint64_t v15 = location + length + a5;
    uint64_t v16 = [(__CFString *)v10 length];
    if (v15 >= v16 - 1) {
      CFIndex v17 = v16 - 1;
    }
    else {
      CFIndex v17 = v15;
    }
    unint64_t v18 = [(__CFString *)v10 length];
    if (v17 + 10 >= v18) {
      unint64_t v19 = v18;
    }
    else {
      unint64_t v19 = v17 + 10;
    }
    uint64_t v20 = 10;
    if (v13 > 10) {
      uint64_t v20 = v13;
    }
    v36.NSUInteger location = v20 - 10;
    v36.NSUInteger length = v19 - (v20 - 10);
    uint64_t v21 = CFStringTokenizerCreate(0, v10, v36, 4uLL, v12);
    if (CFStringTokenizerGoToTokenAtIndex(v21, v14))
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v21);
      if (CurrentTokenRange.location != 0x7FFFFFFFFFFFFFFFLL)
      {
        v34.NSUInteger location = location;
        v34.NSUInteger length = length;
        NSRange v23 = NSUnionRange(v34, (NSRange)CurrentTokenRange);
        NSUInteger location = v23.location;
        NSUInteger length = v23.length;
      }
    }
    if (CFStringTokenizerGoToTokenAtIndex(v21, v17))
    {
      CFRange v24 = CFStringTokenizerGetCurrentTokenRange(v21);
      if (v24.location != 0x7FFFFFFFFFFFFFFFLL)
      {
        v35.NSUInteger location = location;
        v35.NSUInteger length = length;
        NSRange v25 = NSUnionRange(v35, (NSRange)v24);
        NSUInteger location = v25.location;
        NSUInteger length = v25.length;
      }
    }
    if (v21) {
      CFRelease(v21);
    }
    uint64_t v26 = [(__CFString *)v10 length];
    if (location == 0x7FFFFFFFFFFFFFFFLL || length + location > [(__CFString *)v10 length])
    {
      v27 = &stru_1F1FB2C00;
    }
    else
    {
      -[__CFString substringWithRange:](v10, "substringWithRange:", location, length);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = location;
    }
    v29 = [&stru_1F1FB2C00 stringByPaddingToLength:v26 withString:@"_" startingAtIndex:0];
    id v30 = [v29 stringByAppendingString:v27];

    uint64_t v31 = objc_msgSend(v30, "stringByPaddingToLength:withString:startingAtIndex:", -[__CFString length](v10, "length"), @"_", 0);

    id v28 = v31;
  }

  return v28;
}

- (NSDate)entryDate
{
  return self->_entryDate;
}

- (void)setEntryDate:(id)a3
{
}

- (NSArray)recognitionLocaleIdentifiers
{
  return self->_recognitionLocaleIdentifiers;
}

- (void)setRecognitionLocaleIdentifiers:(id)a3
{
}

- (PKDrawing)inputDrawing
{
  return self->_inputDrawing;
}

- (void)setInputDrawing:(id)a3
{
}

- (BOOL)inputContainsInProgressStroke
{
  return self->_inputContainsInProgressStroke;
}

- (void)setInputContainsInProgressStroke:(BOOL)a3
{
  self->_inputContainsInProgressStroke = a3;
}

- (NSArray)inputTargets
{
  return self->_inputTargets;
}

- (void)setInputTargets:(id)a3
{
}

- (CHTextInputTargetContentInfo)inputTargetContentInfo
{
  return self->_inputTargetContentInfo;
}

- (void)setInputTargetContentInfo:(id)a3
{
}

- (NSString)inputTargetElementType
{
  return self->_inputTargetElementType;
}

- (void)setInputTargetElementType:(id)a3
{
}

- (CHTokenizedTextResult)tokenizedTextResult
{
  return self->_tokenizedTextResult;
}

- (void)setTokenizedTextResult:(id)a3
{
}

- (NSString)resultCommittedText
{
  return self->_resultCommittedText;
}

- (void)setResultCommittedText:(id)a3
{
}

- (NSString)resultTopTranscription
{
  return self->_resultTopTranscription;
}

- (void)setResultTopTranscription:(id)a3
{
}

- (int64_t)resultCommittedTokenColumnCount
{
  return self->_resultCommittedTokenColumnCount;
}

- (void)setResultCommittedTokenColumnCount:(int64_t)a3
{
  self->_resultCommittedTokenColumnCount = a3;
}

- (_NSRange)resultAffectedRange
{
  NSUInteger length = self->_resultAffectedRange.length;
  NSUInteger location = self->_resultAffectedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setResultAffectedRange:(_NSRange)a3
{
  self->_resultAffectedRange = a3;
}

- (NSString)resultTypeDescription
{
  return self->_resultTypeDescription;
}

- (void)setResultTypeDescription:(id)a3
{
}

- (NSString)resultCommitReason
{
  return self->_resultCommitReason;
}

- (void)setResultCommitReason:(id)a3
{
}

- (double)resultRecognitionDuration
{
  return self->_resultRecognitionDuration;
}

- (void)setResultRecognitionDuration:(double)a3
{
  self->_resultRecognitionDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultCommitReason, 0);
  objc_storeStrong((id *)&self->_resultTypeDescription, 0);
  objc_storeStrong((id *)&self->_resultTopTranscription, 0);
  objc_storeStrong((id *)&self->_resultCommittedText, 0);
  objc_storeStrong((id *)&self->_tokenizedTextResult, 0);
  objc_storeStrong((id *)&self->_inputTargetElementType, 0);
  objc_storeStrong((id *)&self->_inputTargetContentInfo, 0);
  objc_storeStrong((id *)&self->_inputTargets, 0);
  objc_storeStrong((id *)&self->_recognitionLocaleIdentifiers, 0);
  objc_storeStrong((id *)&self->_entryDate, 0);

  objc_storeStrong((id *)&self->_inputDrawing, 0);
}

@end