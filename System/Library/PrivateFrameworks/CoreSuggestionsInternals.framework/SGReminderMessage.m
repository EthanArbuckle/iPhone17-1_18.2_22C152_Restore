@interface SGReminderMessage
+ (BOOL)enrichedTaggedCharacterRangesContainsProfanity:(id)a3;
+ (BOOL)excludedContent:(id)a3;
+ (BOOL)isConfirmationOptionalForContent:(id)a3;
+ (BOOL)shouldAddTitlePrefixForContent:(id)a3;
+ (BOOL)tokensMatchedInContent:(id)a3 content:(id)a4;
+ (BOOL)validActionVerbIndexRange:(_NSRange)a3 enrichedTaggedCharacterRanges:(id)a4;
+ (BOOL)validModelOutput:(id)a3 error:(id *)a4;
+ (BOOL)validObjectCoreIndexRange:(_NSRange)a3 enrichedTaggedCharacterRanges:(id)a4;
+ (id)confirmationOptionalTokens;
+ (id)detectedTitleInModelOutput:(id)a3 enrichedTaggedCharacterRanges:(id)a4 textContent:(id)a5 language:(id)a6;
+ (id)excludeList;
+ (id)frenchPrependForEnrichedTaggedCharacterRanges:(id)a3 actionVerbIndexRange:(_NSRange)a4;
+ (id)posTaggerNouns;
+ (id)regexFromJoinedArray:(id)a3 wordBoundary:(id)a4;
+ (id)searchTokensForReminderTitle:(id)a3;
+ (id)titlePrefixTokens;
+ (id)titlePrependForActionVerbIndexRange:(_NSRange)a3 enrichedTaggedCharacterRanges:(id)a4 language:(id)a5 content:(id)a6;
+ (id)triggerOptionalTokens;
- (BOOL)hasTrigger;
- (BOOL)isConfirmation;
- (BOOL)isProposal;
- (BOOL)isRejection;
- (BOOL)isTriggerOptional;
- (NSArray)plainTextDetectedData;
- (SGDuplicateKey)extractedReminderDuplicateKey;
- (SGMessage)message;
- (SGPipelineEntity)entity;
- (SGReminderMessage)initWithMessage:(id)a3 entity:(id)a4 enrichedTaggedCharacterRanges:(id)a5 modelOutput:(id)a6;
- (SGReminderMessage)initWithMessage:(id)a3 plainTextDetectedData:(id)a4 enrichedTaggedCharacterRanges:(id)a5 modelOutput:(id)a6;
- (id)_labelTokenIndexesForOutputName:(id)a3 label:(id)a4;
- (id)detectedDueDateComponents;
- (id)detectedTitleForLanguage:(id)a3;
- (id)dueDateDataDetectorMatches;
- (id)dueLocation;
- (void)setEntity:(id)a3;
- (void)setExtractedReminderDuplicateKey:(id)a3;
- (void)setMessage:(id)a3;
- (void)setPlainTextDetectedData:(id)a3;
@end

@implementation SGReminderMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractedReminderDuplicateKey, 0);
  objc_storeStrong((id *)&self->_plainTextDetectedData, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

- (void)setExtractedReminderDuplicateKey:(id)a3
{
}

- (SGDuplicateKey)extractedReminderDuplicateKey
{
  return self->_extractedReminderDuplicateKey;
}

- (void)setPlainTextDetectedData:(id)a3
{
}

- (NSArray)plainTextDetectedData
{
  return self->_plainTextDetectedData;
}

- (void)setEntity:(id)a3
{
}

- (SGPipelineEntity)entity
{
  return self->_entity;
}

- (void)setMessage:(id)a3
{
}

- (SGMessage)message
{
  return self->_message;
}

- (id)_labelTokenIndexesForOutputName:(id)a3 label:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_class();
  v9 = [(SGExtractionDocument *)self modelOutput];
  v10 = [v8 labelTokenIndexesForOutputName:v7 label:v6 modelOutput:v9];

  return v10;
}

- (BOOL)hasTrigger
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(SGExtractionDocument *)self modelOutput];
  v3 = [v2 objectForKeyedSubscript:@"trigger"];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (![*(id *)(*((void *)&v10 + 1) + 8 * i) isEqualToString:@"NONE"])
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (id)dueLocation
{
  v3 = [(SGExtractionDocument *)self modelOutput];

  if (!v3)
  {
    v21 = 0;
    goto LABEL_29;
  }
  uint64_t v4 = [(SGExtractionDocument *)self modelOutput];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"trigger"];

  uint64_t v6 = objc_opt_new();
  if (![v5 count])
  {
    unsigned __int8 v8 = 0;
    unsigned __int8 v9 = 0;
    goto LABEL_23;
  }
  unint64_t v7 = 0;
  unsigned __int8 v8 = 0;
  unsigned __int8 v9 = 0;
  do
  {
    long long v10 = [v5 objectAtIndexedSubscript:v7];
    if ([v10 hasPrefix:@"DUE_LOCATION_TRIGGER__"])
    {
      if ([v10 containsString:@"ARRIVE"])
      {
        unsigned __int8 v8 = 1;
      }
      else if ([v10 containsString:@"LEAVE"])
      {
        unsigned __int8 v8 = 2;
      }
      if ([v10 hasSuffix:@"MY_HOME"])
      {
        unsigned __int8 v9 = 1;
      }
      else if ([v10 hasSuffix:@"MY_SCHOOL"])
      {
        unsigned __int8 v9 = 3;
      }
      else if ([v10 hasSuffix:@"MY_WORK"])
      {
        unsigned __int8 v9 = 2;
      }
      else if ([v10 hasSuffix:@"OTHER"])
      {
        [v6 addIndex:v7];
        unsigned __int8 v9 = 4;
      }
    }

    ++v7;
  }
  while ([v5 count] > v7);
  if (v9 != 4)
  {
LABEL_23:
    uint64_t v20 = 0;
    v22 = 0;
    v21 = 0;
    if (!(v9 | v8)) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  long long v11 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v12 = [(id)objc_opt_class() firstRangeInIndexSet:v6];
  uint64_t v14 = v13;
  uint64_t v15 = [(SGExtractionDocument *)self enrichedTaggedCharacterRanges];
  if (v15)
  {
    uint64_t v16 = objc_msgSend((id)objc_opt_class(), "textRangeForIndexRange:inTaggedCharacterRanges:", v12, v14, v15);
    uint64_t v18 = v17;
    v19 = [(SGMessage *)self->_message textContent];
    uint64_t v20 = objc_msgSend(v19, "substringWithRange:", v16, v18);
  }
  else
  {
    uint64_t v20 = 0;
  }

  unsigned __int8 v9 = 4;
LABEL_27:
  v21 = [[SGReminderDueLocation alloc] initWithLocationType:v9 trigger:v8 name:v20];
  v22 = (void *)v20;
LABEL_28:

LABEL_29:
  return v21;
}

- (id)detectedDueDateComponents
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [(SGReminderMessage *)self dueDateDataDetectorMatches];
  v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = objc_msgSend(v2, "first", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v10 = objc_opt_class();
        long long v11 = [v2 second];
        uint64_t v12 = objc_msgSend(v10, "dateComponentsFromDataDetectorMatch:inferDates:approximateTime:partialDate:useEndForDurations:", v9, objc_msgSend(v11, "BOOLValue") ^ 1, 1, 1, 0);

        if (v12) {
          [v3 addObject:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)dueDateDataDetectorMatches
{
  v3 = [(SGExtractionDocument *)self modelOutput];

  if (v3)
  {
    uint64_t v4 = [(SGReminderMessage *)self _labelTokenIndexesForOutputName:@"trigger" label:@"DUE_TIME_TRIGGER__DATETIME"];
    uint64_t v5 = [(SGExtractionDocument *)self dataDetectorMatchesForTokenIndexes:v4 dataDetectorMatches:self->_plainTextDetectedData allowDatesInPast:1 allowTimeOffset:1];
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F93BB8]);
    uint64_t v5 = (void *)[v6 initWithFirst:MEMORY[0x1E4F1CBF0] second:0];
  }
  return v5;
}

- (id)detectedTitleForLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [(SGExtractionDocument *)self modelOutput];
  uint64_t v7 = [(SGExtractionDocument *)self enrichedTaggedCharacterRanges];
  unsigned __int8 v8 = [(SGMessage *)self->_message textContent];
  uint64_t v9 = [v5 detectedTitleInModelOutput:v6 enrichedTaggedCharacterRanges:v7 textContent:v8 language:v4];

  if (v9 && ([(id)objc_opt_class() excludedContent:v9] & 1) != 0) {
    id v10 = 0;
  }
  else {
    id v10 = v9;
  }

  return v10;
}

- (BOOL)isTriggerOptional
{
  if ([(SGMessage *)self->_message isSent] || [(SGReminderMessage *)self hasTrigger]) {
    return 0;
  }
  id v4 = objc_opt_class();
  uint64_t v5 = [(id)objc_opt_class() triggerOptionalTokens];
  id v6 = [(SGReminderMessage *)self message];
  uint64_t v7 = [v6 textContent];
  LOBYTE(v4) = [v4 tokensMatchedInContent:v5 content:v7];

  return (char)v4;
}

- (BOOL)isProposal
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (![(SGMessage *)self->_message isSent])
  {
    v3 = [(SGExtractionDocument *)self modelOutput];

    if (v3)
    {
      id v4 = [(SGExtractionDocument *)self modelOutput];
      uint64_t v5 = [v4 objectForKeyedSubscript:@"polarity"];
      unint64_t v6 = [v5 count];

      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v7 = [(SGExtractionDocument *)self modelOutput];
      unsigned __int8 v8 = [v7 objectForKeyedSubscript:@"polarity"];

      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        double v12 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            if ([@"POLARITY__REMINDER_STATEMENT" isEqualToString:v14])
            {
              double v12 = v12 + 1.0;
            }
            else if ([@"POLARITY__REJECTION" isEqualToString:v14])
            {
              goto LABEL_16;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);

        if (v12 > 0.0 && v12 / (double)v6 > 0.1) {
          return 1;
        }
      }
      else
      {
LABEL_16:
      }
    }
  }
  return 0;
}

- (BOOL)isRejection
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SGMessage *)self->_message isSent];
  if (v3)
  {
    id v4 = [(SGExtractionDocument *)self modelOutput];

    if (v4)
    {
      uint64_t v5 = [(SGExtractionDocument *)self modelOutput];
      unint64_t v6 = [v5 objectForKeyedSubscript:@"polarity"];
      uint64_t v7 = [v6 count];

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      unsigned __int8 v8 = [(SGExtractionDocument *)self modelOutput];
      uint64_t v9 = [v8 objectForKeyedSubscript:@"polarity"];

      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        double v13 = 0.0;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            if (([@"POLARITY__REJECTION" isEqualToString:v15] & 1) != 0
              || [@"POLARITY__DONE" isEqualToString:v15])
            {
              double v13 = v13 + 1.0;
            }
            else if ([@"POLARITY__COMMITMENT" isEqualToString:v15])
            {
              char v16 = 0;
              goto LABEL_18;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v11) {
            continue;
          }
          break;
        }
        char v16 = 1;
      }
      else
      {
        char v16 = 1;
        double v13 = 0.0;
      }
LABEL_18:

      if (v7) {
        char v17 = v16;
      }
      else {
        char v17 = 0;
      }
      if (v13 > 0.0) {
        LOBYTE(v3) = v17;
      }
      else {
        LOBYTE(v3) = 0;
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)isConfirmation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (![(SGMessage *)self->_message isSent]) {
    return 0;
  }
  BOOL v3 = [(SGExtractionDocument *)self modelOutput];

  if (!v3) {
    return 0;
  }
  id v4 = [(SGExtractionDocument *)self modelOutput];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"polarity"];
  uint64_t v23 = [v5 count];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unint64_t v6 = [(SGExtractionDocument *)self modelOutput];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"polarity"];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if ([@"POLARITY__COMMITMENT" isEqualToString:v13])
        {
          double v11 = v11 + 1.0;
        }
        else if (([@"POLARITY__REJECTION" isEqualToString:v13] & 1) != 0 {
               || ([@"POLARITY__DONE" isEqualToString:v13] & 1) != 0)
        }
        {
          goto LABEL_20;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);

    if (v11 > 0.0 && v23 != 0) {
      return 1;
    }
  }
  else
  {
LABEL_20:
  }
  char v16 = +[SGReminderExtractionModel sharedInstance];
  char v17 = [v16 reminderOverrides];

  if (!v17) {
    goto LABEL_24;
  }
  long long v18 = [(SGMessage *)self->_message textContent];
  CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  uint64_t v19 = _PASRemoveCharacterSet();
  long long v20 = [(id)v19 localizedLowercaseString];

  long long v21 = [v17 objectForKeyedSubscript:@"confirmation"];
  LOBYTE(v19) = [v21 containsObject:v20];

  if (v19) {
    BOOL v15 = 1;
  }
  else {
LABEL_24:
  }
    BOOL v15 = 0;

  return v15;
}

- (SGReminderMessage)initWithMessage:(id)a3 plainTextDetectedData:(id)a4 enrichedTaggedCharacterRanges:(id)a5 modelOutput:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SGReminderMessage;
  uint64_t v13 = [(SGExtractionDocument *)&v16 initWithEnrichedTaggedCharacterRanges:a5 modelOutput:a6];
  uint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_message, a3);
    objc_storeStrong((id *)&v14->_plainTextDetectedData, a4);
  }

  return v14;
}

- (SGReminderMessage)initWithMessage:(id)a3 entity:(id)a4 enrichedTaggedCharacterRanges:(id)a5 modelOutput:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SGReminderMessage;
  uint64_t v13 = [(SGExtractionDocument *)&v18 initWithEnrichedTaggedCharacterRanges:a5 modelOutput:a6];
  uint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_message, a3);
    objc_storeStrong((id *)&v14->_entity, a4);
    uint64_t v15 = [v11 plainTextDetectedData];
    plainTextDetectedData = v14->_plainTextDetectedData;
    v14->_plainTextDetectedData = (NSArray *)v15;
  }
  return v14;
}

+ (id)searchTokensForReminderTitle:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[SGPOSTagger sharedInstance];
  long long v25 = v4;
  unint64_t v6 = [v5 tokenizeTextContent:v4 languageHint:0];

  v30 = objc_opt_new();
  uint64_t v7 = [a1 posTaggerNouns];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v36;
    uint64_t v26 = *(void *)v36;
    do
    {
      uint64_t v11 = 0;
      uint64_t v27 = v9;
      do
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v35 + 1) + 8 * v11);
        if ([v12 annotationType] == 2)
        {
          uint64_t v29 = v11;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          uint64_t v13 = [v12 tags];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v32;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v32 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * i);
                id v19 = [NSString alloc];
                long long v20 = [v12 annotationTypeUniqueIdentifier];
                long long v21 = (void *)[v19 initWithFormat:@"%@_%@", v20, v18];
                LODWORD(v18) = [v7 containsObject:v21];

                if (v18)
                {
                  long long v22 = [v12 text];
                  [v30 addObject:v22];
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }
            while (v15);
          }

          uint64_t v10 = v26;
          uint64_t v9 = v27;
          uint64_t v11 = v29;
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v9);
  }

  uint64_t v23 = [v30 allObjects];

  return v23;
}

+ (BOOL)excludedContent:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = [a1 excludeList];
    unint64_t v6 = [a1 regexFromJoinedArray:v5 wordBoundary:0];

    if (!v6
      || (BOOL v8 = 1,
          objc_msgSend(v6, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length")) == 0x7FFFFFFFFFFFFFFFLL)
      && !v7)
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

+ (id)regexFromJoinedArray:(id)a3 wordBoundary:(id)a4
{
  id v5 = a3;
  unint64_t v6 = (__CFString *)a4;
  uint64_t v7 = v6;
  if (v6) {
    BOOL v8 = v6;
  }
  else {
    BOOL v8 = &stru_1F24EEF20;
  }
  uint64_t v9 = v8;
  if ([v5 count])
  {
    context = (void *)MEMORY[0x1CB79B230]();
    uint64_t v10 = objc_opt_new();
    objc_msgSend(v10, "appendString:", @"(?:");
    if ([v5 count])
    {
      unint64_t v11 = 0;
      do
      {
        id v12 = (void *)MEMORY[0x1CB79B230]();
        uint64_t v13 = [v5 objectAtIndexedSubscript:v11];
        uint64_t v14 = (void *)v13;
        if (v11) {
          uint64_t v15 = @"|";
        }
        else {
          uint64_t v15 = &stru_1F24EEF20;
        }
        [v10 appendFormat:@"%@%@%@%@", v15, v9, v13, v9];

        ++v11;
      }
      while ([v5 count] > v11);
    }
    [v10 appendString:@""]);
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v10 options:1 error:0];
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (id)titlePrefixTokens
{
  v2 = +[SGReminderExtractionModel sharedInstance];
  BOOL v3 = [v2 reminderOverrides];

  if (v3)
  {
    id v4 = [v3 objectForKeyedSubscript:@"titlePrefix"];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

+ (id)excludeList
{
  v2 = +[SGReminderExtractionModel sharedInstance];
  BOOL v3 = [v2 reminderOverrides];

  if (v3)
  {
    id v4 = [v3 objectForKeyedSubscript:@"excludeList"];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

+ (id)confirmationOptionalTokens
{
  v2 = +[SGReminderExtractionModel sharedInstance];
  BOOL v3 = [v2 reminderOverrides];

  if (v3)
  {
    id v4 = [v3 objectForKeyedSubscript:@"confirmationOptional"];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

+ (id)triggerOptionalTokens
{
  v2 = +[SGReminderExtractionModel sharedInstance];
  BOOL v3 = [v2 reminderOverrides];

  if (v3)
  {
    id v4 = [v3 objectForKeyedSubscript:@"triggerOptional"];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

+ (BOOL)enrichedTaggedCharacterRangesContainsProfanity:(id)a3
{
  BOOL v3 = sgMapAndFilter();
  id v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v5 = [v4 localeIdentifier];
  BOOL v6 = +[SGLexicon profanityInTokens:v3 forLocaleIdentifier:v5];

  return v6;
}

id __68__SGReminderMessage_enrichedTaggedCharacterRangesContainsProfanity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v3 = objc_msgSend(v2, "tags", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    BOOL v6 = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 hasPrefix:@"L_"])
        {
          uint64_t v10 = (void *)MEMORY[0x1CB79B230]();
          uint64_t v11 = [v9 substringFromIndex:2];

          BOOL v6 = (void *)v11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)validModelOutput:(id)a3 error:(id *)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = a3;
  uint64_t v40 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
  uint64_t v4 = 0;
  char v5 = 0;
  uint64_t v6 = 0;
  if (v40)
  {
    char v47 = 0;
    int v7 = 0;
    uint64_t v39 = *(void *)v57;
    char v8 = 1;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v57 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v56 + 1) + 8 * v9);
        uint64_t v11 = [v10 modelOutput];

        if (!v11)
        {
          uint64_t v26 = obj;
          goto LABEL_45;
        }
        uint64_t v44 = v9;
        v45 = v10;
        if (v4)
        {
          uint64_t v4 = 1;
        }
        else
        {
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v12 = [v10 modelOutput];
          long long v13 = [v12 objectForKeyedSubscript:@"polarity"];

          uint64_t v14 = [v13 countByEnumeratingWithState:&v52 objects:v63 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v53;
            while (2)
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v53 != v16) {
                  objc_enumerationMutation(v13);
                }
                if (![*(id *)(*((void *)&v52 + 1) + 8 * i) isEqualToString:@"NONE"])
                {
                  uint64_t v4 = 1;
                  goto LABEL_19;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v52 objects:v63 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }
          uint64_t v4 = 0;
LABEL_19:

          uint64_t v10 = v45;
        }
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        uint64_t v18 = [v10 modelOutput];
        id v19 = [v18 objectForKeyedSubscript:@"title"];

        uint64_t v20 = [v19 countByEnumeratingWithState:&v48 objects:v62 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          unsigned int v41 = v4;
          char v42 = v6;
          char v43 = v8;
          int v22 = 0;
          uint64_t v23 = *(void *)v49;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v49 != v23) {
                objc_enumerationMutation(v19);
              }
              long long v25 = *(void **)(*((void *)&v48 + 1) + 8 * j);
              if ([v25 isEqualToString:@"NONE"])
              {
                char v5 = 1;
              }
              else if ([v25 isEqualToString:@"EXTRACTION__REMINDER_TITLE_ACTION_VERB"])
              {
                ++v22;
                char v47 = 1;
              }
              else
              {
                v7 |= [v25 isEqualToString:@"EXTRACTION__REMINDER_TITLE_ACTION_OBJECT_CORE"];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v48 objects:v62 count:16];
          }
          while (v21);

          LOBYTE(v6) = v42;
          char v8 = (v22 < 2) & v43;
          uint64_t v4 = v41;
        }
        else
        {
        }
        if (v6) {
          uint64_t v6 = 1;
        }
        else {
          uint64_t v6 = [v45 hasTrigger];
        }
        uint64_t v9 = v44 + 1;
      }
      while (v44 + 1 != v40);
      uint64_t v40 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
      if (v40) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v47 = 0;
    LOBYTE(v7) = 0;
    char v8 = 1;
  }

  uint64_t v27 = v4;
  char v28 = v4 & v5 & v47 & v6 & v8 & v7;
  if (a4 && (v28 & 1) == 0)
  {
    v46 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F5DC80];
    v60[0] = @"hasPolarity:";
    uint64_t v26 = [NSNumber numberWithBool:v27];
    v61[0] = v26;
    v60[1] = @"hasTitle";
    v30 = [NSNumber numberWithBool:v5 & 1];
    v61[1] = v30;
    v60[2] = @"hasTrigger";
    long long v31 = [NSNumber numberWithBool:v6];
    v61[2] = v31;
    v60[3] = @"hasCorrectNumberOfActionVerbs";
    long long v32 = [NSNumber numberWithBool:v8 & 1];
    v61[3] = v32;
    v60[4] = @"hasActionVerb";
    long long v33 = [NSNumber numberWithBool:v47 & 1];
    v61[4] = v33;
    v60[5] = @"hasObjectCore";
    long long v34 = [NSNumber numberWithBool:v7 & 1];
    v61[5] = v34;
    long long v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:6];
    *a4 = [v46 errorWithDomain:v29 code:9 userInfo:v35];

LABEL_45:
    char v28 = 0;
  }

  return v28;
}

+ (id)posTaggerNouns
{
  id v2 = (void *)MEMORY[0x1CB79B230](a1, a2);
  BOOL v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"I_NN", @"I_NNP", @"I_Noun", @"I_NNS", @"I_NNPS", 0);
  return v3;
}

+ (BOOL)validObjectCoreIndexRange:(_NSRange)a3 enrichedTaggedCharacterRanges:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  char v8 = [a1 posTaggerNouns];
  NSUInteger v9 = location + length;
  if (location >= location + length)
  {
    LOBYTE(v12) = 0;
  }
  else
  {
    do
    {
      uint64_t v10 = [v7 objectAtIndexedSubscript:location];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v11 = objc_msgSend(v10, "tags", 0);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v11);
            }
            if ([v8 containsObject:*(void *)(*((void *)&v16 + 1) + 8 * i)])
            {
              LOBYTE(v12) = 1;
              goto LABEL_12;
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_12:

      ++location;
    }
    while (location < v9 && (v12 & 1) == 0);
  }

  return v12;
}

+ (BOOL)validActionVerbIndexRange:(_NSRange)a3 enrichedTaggedCharacterRanges:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v24 = a4;
  uint64_t v6 = (void *)MEMORY[0x1CB79B230]();
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"I_VB", @"I_VBP", @"I_VBN", @"I_VBG", @"I_Verb", 0);
  NSUInteger v22 = location + length;
  if (location >= location + length)
  {
    uint64_t v23 = 0;
LABEL_22:
    BOOL v19 = HIDWORD(v23) == 1 && (int)v23 < 2;
  }
  else
  {
    uint64_t v23 = 0;
    while (1)
    {
      char v8 = [v24 objectAtIndexedSubscript:location];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      NSUInteger v9 = [v8 tags];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (!v10) {
        break;
      }
      uint64_t v11 = v10;
      NSUInteger v25 = location;
      uint64_t v26 = v8;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v9);
          }
          long long v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ([v17 isEqualToString:@"R_action"])
          {
            int v12 = 1;
          }
          else if ([v7 containsObject:v17])
          {
            int v13 = 1;
          }
          else
          {
            v14 |= [v17 isEqualToString:@"I_RP"];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v11);

      if (v12 & v13)
      {
        ++HIDWORD(v23);
        char v8 = v26;
      }
      else
      {
        char v8 = v26;
        if ((v14 & 1) == 0) {
          goto LABEL_29;
        }
        LODWORD(v23) = v23 + 1;
      }

      NSUInteger location = v25 + 1;
      if (v25 + 1 == v22) {
        goto LABEL_22;
      }
    }

LABEL_29:
    uint64_t v20 = sgRemindersLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v20, OS_LOG_TYPE_DEBUG, "SGReminderMessage: No whitelisted action verb or particle actionVerbTokenIndexes", buf, 2u);
    }

    BOOL v19 = 0;
  }

  return v19;
}

+ (id)frenchPrependForEnrichedTaggedCharacterRanges:(id)a3 actionVerbIndexRange:(_NSRange)a4
{
  NSUInteger location = a4.location;
  id v5 = a3;
  uint64_t v6 = v5;
  if (location >= 2)
  {
    id v7 = [v5 objectAtIndexedSubscript:location - 1];
    char v8 = [v7 tags];
    if (![v8 containsObject:@"I_PRP"])
    {
      long long v16 = 0;
LABEL_11:

      goto LABEL_14;
    }
    NSUInteger v9 = [v6 objectAtIndexedSubscript:location - 2];
    uint64_t v10 = [v9 tags];
    if ([v10 containsObject:@"I_PRP"]) {
      goto LABEL_6;
    }
    uint64_t v11 = [v6 objectAtIndexedSubscript:location - 2];
    int v12 = [v11 tags];
    if ([v12 containsObject:@"L_de"])
    {

LABEL_6:
LABEL_7:
      id v7 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"aeiouyhé"];
      char v8 = [v6 objectAtIndexedSubscript:location];
      int v13 = [v8 text];
      int v14 = objc_msgSend(v7, "characterIsMember:", objc_msgSend(v13, "characterAtIndex:", 0));
      uint64_t v15 = @"se ";
      if (v14) {
        uint64_t v15 = @"s'";
      }
      long long v16 = v15;

      goto LABEL_11;
    }
    long long v17 = [v6 objectAtIndexedSubscript:location - 2];
    long long v18 = [v17 text];
    char v20 = [v18 isEqualToString:@"à"];

    if (v20) {
      goto LABEL_7;
    }
  }
  long long v16 = 0;
LABEL_14:

  return v16;
}

+ (id)titlePrependForActionVerbIndexRange:(_NSRange)a3 enrichedTaggedCharacterRanges:(id)a4 language:(id)a5 content:(id)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v12
    && [v12 isEqualToString:@"fr"]
    && [a1 shouldAddTitlePrefixForContent:v13])
  {
    int v14 = objc_msgSend(a1, "frenchPrependForEnrichedTaggedCharacterRanges:actionVerbIndexRange:", v11, location, length);
  }
  else
  {
    int v14 = 0;
  }

  return v14;
}

+ (id)detectedTitleInModelOutput:(id)a3 enrichedTaggedCharacterRanges:(id)a4 textContent:(id)a5 language:(id)a6
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = 0;
  if (v10 && v11)
  {
    if ([a1 enrichedTaggedCharacterRangesContainsProfanity:v11])
    {
      int v14 = 0;
      goto LABEL_48;
    }
    long long v57 = [a1 labelTokenIndexesForOutputName:@"title" label:@"EXTRACTION__REMINDER_TITLE_ACTION_VERB" modelOutput:v10];
    if (![v57 count])
    {
      int v14 = 0;
LABEL_47:

      goto LABEL_48;
    }
    long long v56 = [a1 labelTokenIndexesForOutputName:@"title" label:@"EXTRACTION__REMINDER_TITLE_ACTION_OBJECT_CORE" modelOutput:v10];
    if (![v56 count])
    {
      int v14 = 0;
LABEL_46:

      goto LABEL_47;
    }
    unint64_t v15 = [a1 firstRangeInIndexSet:v57];
    uint64_t v17 = v16;
    if (objc_msgSend(a1, "validActionVerbIndexRange:enrichedTaggedCharacterRanges:", v15, v16, v11))
    {
      unint64_t v18 = [a1 firstRangeInIndexSet:v56];
      uint64_t v55 = v19;
      if (objc_msgSend(a1, "validObjectCoreIndexRange:enrichedTaggedCharacterRanges:", v18, v19, v11))
      {
        context = (void *)MEMORY[0x1CB79B230]();
        unint64_t v54 = v18;
        if (v15 >= v18)
        {
          long long v32 = objc_opt_new();
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          uint64_t v33 = (void *)MEMORY[0x1CB79B230]();
          long long v34 = objc_msgSend(v11, "subarrayWithRange:", v15, v17);
          uint64_t v35 = [v34 countByEnumeratingWithState:&v70 objects:v75 count:16];
          if (v35)
          {
            uint64_t v36 = *(void *)v71;
            do
            {
              for (uint64_t i = 0; i != v35; ++i)
              {
                if (*(void *)v71 != v36) {
                  objc_enumerationMutation(v34);
                }
                long long v38 = [*(id *)(*((void *)&v70 + 1) + 8 * i) text];
                [v32 addObject:v38];
              }
              uint64_t v35 = [v34 countByEnumeratingWithState:&v70 objects:v75 count:16];
            }
            while (v35);
          }

          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          uint64_t v39 = (void *)MEMORY[0x1CB79B230]();
          uint64_t v40 = objc_msgSend(v11, "subarrayWithRange:", v54, v55);
          uint64_t v41 = [v40 countByEnumeratingWithState:&v66 objects:v74 count:16];
          if (v41)
          {
            uint64_t v42 = *(void *)v67;
            do
            {
              for (uint64_t j = 0; j != v41; ++j)
              {
                if (*(void *)v67 != v42) {
                  objc_enumerationMutation(v40);
                }
                uint64_t v44 = [*(id *)(*((void *)&v66 + 1) + 8 * j) text];
                [v32 addObject:v44];
              }
              uint64_t v41 = [v40 countByEnumeratingWithState:&v66 objects:v74 count:16];
            }
            while (v41);
          }

          long long v29 = objc_msgSend(v32, "_pas_componentsJoinedByString:", @" ");
        }
        else
        {
          char v20 = [v11 objectAtIndexedSubscript:v15];
          uint64_t v52 = [v20 range];

          uint64_t v21 = [v11 objectAtIndexedSubscript:v55 + v18 - 1];
          uint64_t v22 = [v21 range];
          [v21 range];
          uint64_t v24 = v23;
          NSUInteger v25 = objc_msgSend(a1, "titlePrependForActionVerbIndexRange:enrichedTaggedCharacterRanges:language:content:", v15, v17, v11, v13, v12);
          uint64_t v26 = v22 - v52 + v24;
          if (v25)
          {
            id v27 = [NSString alloc];
            long long v28 = objc_msgSend(v12, "substringWithRange:", v52, v26);
            long long v29 = (void *)[v27 initWithFormat:@"%@%@", v25, v28];
          }
          else
          {
            long long v29 = objc_msgSend(v12, "substringWithRange:", v52, v22 - v52 + v24);
          }
        }
        if (!v29)
        {
          long long v30 = 0;
          goto LABEL_40;
        }
        v45 = (void *)MEMORY[0x1CB79B230]();
        v46 = (void *)[v29 mutableCopy];
        uint64_t v47 = [v29 length];
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __99__SGReminderMessage_detectedTitleInModelOutput_enrichedTaggedCharacterRanges_textContent_language___block_invoke;
        v64[3] = &unk_1E65B9DB8;
        id v48 = v46;
        id v65 = v48;
        objc_msgSend(v48, "enumerateSubstringsInRange:options:usingBlock:", 0, v47, 1027, v64);
        long long v30 = v48;

        *(void *)buf = 0;
        v61 = buf;
        uint64_t v62 = 0x2020000000;
        int v63 = 0;
        uint64_t v49 = [v30 length];
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __99__SGReminderMessage_detectedTitleInModelOutput_enrichedTaggedCharacterRanges_textContent_language___block_invoke_2;
        v59[3] = &unk_1E65B9DE0;
        v59[4] = buf;
        -[NSObject enumerateSubstringsInRange:options:usingBlock:](v30, "enumerateSubstringsInRange:options:usingBlock:", 0, v49, 2, v59);
        if (*((int *)v61 + 6) < 81)
        {
          _Block_object_dispose(buf, 8);

LABEL_40:
          long long v30 = v30;
          int v14 = v30;
LABEL_45:

          goto LABEL_46;
        }
        long long v50 = sgRemindersLogHandle();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long v58 = 0;
          _os_log_error_impl(&dword_1CA650000, v50, OS_LOG_TYPE_ERROR, "SGReminderMessage: Title has too many characters", v58, 2u);
        }

        _Block_object_dispose(buf, 8);
LABEL_44:
        int v14 = 0;
        goto LABEL_45;
      }
      long long v30 = sgRemindersLogHandle();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_44;
      }
      *(_WORD *)buf = 0;
      long long v31 = "SGReminderMessage: No NN, NNP in objectCoreIndexRange";
    }
    else
    {
      long long v30 = sgRemindersLogHandle();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_44;
      }
      *(_WORD *)buf = 0;
      long long v31 = "SGReminderMessage: No VB in actionVerbIndexRange";
    }
    _os_log_debug_impl(&dword_1CA650000, v30, OS_LOG_TYPE_DEBUG, v31, buf, 2u);
    goto LABEL_44;
  }
LABEL_48:

  return v14;
}

void __99__SGReminderMessage_detectedTitleInModelOutput_enrichedTaggedCharacterRanges_textContent_language___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v14 = a2;
  id v11 = *(void **)(a1 + 32);
  id v12 = (void *)MEMORY[0x1CB79B230]();
  id v13 = [v14 localizedCapitalizedString];
  objc_msgSend(v11, "replaceCharactersInRange:withString:", a3, a4, v13);

  *a7 = 1;
}

uint64_t __99__SGReminderMessage_detectedTitleInModelOutput_enrichedTaggedCharacterRanges_textContent_language___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if ((int)++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) >= 81) {
    *a7 = 1;
  }
  return result;
}

+ (BOOL)tokensMatchedInContent:(id)a3 content:(id)a4
{
  id v6 = a4;
  id v7 = [a1 regexFromJoinedArray:a3 wordBoundary:0];
  if (!v7
    || (BOOL v9 = 1,
        objc_msgSend(v7, "rangeOfFirstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) == 0x7FFFFFFFFFFFFFFFLL)
    && !v8)
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)shouldAddTitlePrefixForContent:(id)a3
{
  id v4 = a3;
  id v5 = [a1 titlePrefixTokens];
  LOBYTE(a1) = [a1 tokensMatchedInContent:v5 content:v4];

  return (char)a1;
}

+ (BOOL)isConfirmationOptionalForContent:(id)a3
{
  id v4 = a3;
  id v5 = [a1 confirmationOptionalTokens];
  LOBYTE(a1) = [a1 tokensMatchedInContent:v5 content:v4];

  return (char)a1;
}

@end