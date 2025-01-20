@interface CalAppleConferenceFormat
+ (BOOL)_line:(id)a3 matchesRegex:(id)a4 outFoundRange:(_NSRange *)a5;
+ (id)_buildDeserializationResultFromState:(id)a3;
+ (id)_conferenceTitleRegex;
+ (id)_detailsDelimiterRegex;
+ (id)_joinMethodTitleAndFeaturesRegex;
+ (id)_startDelimiterRegex;
+ (id)calBundle;
+ (id)calConferenceSerializationHandle;
+ (void)_parseBlockTitle:(id)a3 state:(id)a4;
+ (void)_parseConferenceTitle:(id)a3 state:(id)a4;
+ (void)_parseJoinMethodTitleAndFeatures:(id)a3 state:(id)a4;
+ (void)_parseURL:(id)a3 state:(id)a4;
- (BOOL)supportsSerializingConferenceWithSource:(unint64_t)a3;
- (id)deserializeConferences:(id)a3;
- (id)serializeConference:(id)a3 serializationBlockTitle:(id)a4;
@end

@implementation CalAppleConferenceFormat

+ (id)calBundle
{
  return (id)[MEMORY[0x1E4F28B50] bundleForClass:a1];
}

+ (id)calConferenceSerializationHandle
{
  if (calConferenceSerializationHandle_onceToken != -1) {
    dispatch_once(&calConferenceSerializationHandle_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)calConferenceSerializationHandle_logHandle;

  return v2;
}

uint64_t __60__CalAppleConferenceFormat_calConferenceSerializationHandle__block_invoke()
{
  calConferenceSerializationHandle_logHandle = (uint64_t)os_log_create("com.apple.calendar.calendarFoundation", "appleConferenceSerialization");

  return MEMORY[0x1F41817F8]();
}

- (id)serializeConference:(id)a3 serializationBlockTitle:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 joinMethods];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F1CA48] array];
    id v47 = v6;
    v46 = [NSString stringWithFormat:@"%@%@%@", @"----( ", v6, @")----"];
    -[NSObject addObject:](v9, "addObject:");
    v10 = [v5 title];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      v12 = NSString;
      v13 = [v5 title];
      v14 = [v12 stringWithFormat:@"%@%@%@", @"[", v13, @"]"];
      [v9 addObject:v14];

      [v9 addObject:&stru_1EE0C39E0];
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v15 = [v5 joinMethods];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v48 objects:v53 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v49;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v49 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v48 + 1) + 8 * v19);
          v21 = [v20 title];
          uint64_t v22 = [v21 length];

          int v23 = [v20 isBroadcast];
          if (v22) {
            BOOL v24 = v23 == 0;
          }
          else {
            BOOL v24 = 1;
          }
          if (!v24)
          {
            v26 = NSString;
            v27 = [v20 title];
            [v26 stringWithFormat:@"%@%@%@ %@%@%@", @"[", v27, @"]", @"(", @"Broadcast", @")"];
            goto LABEL_16;
          }
          if (v22)
          {
            v25 = NSString;
            v27 = [v20 title];
            [v25 stringWithFormat:@"%@%@%@", @"[", v27, @"]", v43, v44, v45];
            v28 = LABEL_16:;
            [v9 addObject:v28];

LABEL_17:
            goto LABEL_18;
          }
          if (v23)
          {
            v27 = [NSString stringWithFormat:@"%@%@%@", @"(", @"Broadcast", @")"];
            [v9 addObject:v27];
            goto LABEL_17;
          }
LABEL_18:
          v29 = [v20 URL];
          v30 = [v29 absoluteString];
          [v9 addObject:v30];

          v31 = [v5 joinMethods];
          v32 = [v31 lastObject];
          char v33 = [v20 isEqual:v32];

          if ((v33 & 1) == 0) {
            [v9 addObject:&stru_1EE0C39E0];
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v34 = [v15 countByEnumeratingWithState:&v48 objects:v53 count:16];
        uint64_t v17 = v34;
      }
      while (v34);
    }

    v35 = [v5 conferenceDetails];
    uint64_t v36 = [v35 length];

    if (v36)
    {
      [v9 addObject:&stru_1EE0C39E0];
      v37 = [(id)objc_opt_class() calBundle];
      v38 = [v37 localizedStringForKey:@"Details" value:&stru_1EE0C39E0 table:0];

      v39 = [NSString stringWithFormat:@"%@%@%@", @"---( ", v38, @")---"];
      [v9 addObject:v39];
      [v9 addObject:&stru_1EE0C39E0];
      v40 = [v5 conferenceDetails];
      [v9 addObject:v40];
    }
    [v9 addObject:@"---===---"];
    v41 = [v9 componentsJoinedByString:@"\n"];

    id v6 = v47;
  }
  else
  {
    v9 = [(id)objc_opt_class() calConferenceSerializationHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190D88000, v9, OS_LOG_TYPE_DEFAULT, "Conference has no joinMethods but at least 1 is required for serializing", buf, 2u);
    }
    v41 = 0;
  }

  return v41;
}

- (id)deserializeConferences:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v4 length])
  {
    id v6 = objc_alloc_init(StateData);
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v20[3] = 0;
    uint64_t v7 = [v4 length];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51__CalAppleConferenceFormat_deserializeConferences___block_invoke;
    v14[3] = &unk_1E56CDC18;
    uint64_t v8 = v6;
    v15 = v8;
    uint64_t v16 = self;
    uint64_t v19 = v20;
    id v17 = v4;
    id v9 = v5;
    id v18 = v9;
    objc_msgSend(v17, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 0, v14);
    if ([(StateData *)v8 state] == 8)
    {
      v10 = [(id)objc_opt_class() _buildDeserializationResultFromState:v8];
      [v9 addObject:v10];
    }
    uint64_t v11 = v18;
    id v12 = v9;

    _Block_object_dispose(v20, 8);
  }

  return v5;
}

void __51__CalAppleConferenceFormat_deserializeConferences___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v10 = a2;
  switch([*(id *)(a1 + 32) state])
  {
    case 0:
      *(void *)buf = 0;
      uint64_t v45 = 0;
      uint64_t v11 = objc_opt_class();
      id v12 = [(id)objc_opt_class() _startDelimiterRegex];
      LODWORD(v11) = [v11 _line:v10 matchesRegex:v12 outFoundRange:buf];

      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 32), "setStartRange:", *(void *)buf + a3, v45);
        [*(id *)(a1 + 32) setState:1];
        [(id)objc_opt_class() _parseBlockTitle:v10 state:*(void *)(a1 + 32)];
      }
      goto LABEL_47;
    case 1:
      [*(id *)(a1 + 32) setConferenceTitle:0];
      int v18 = [v10 hasPrefix:@"["];
      int v19 = objc_msgSend(v10, "hasPrefix:", @"(");
      if ((v18 & 1) == 0 && !v19) {
        goto LABEL_8;
      }
      unint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) + 1;
      v35 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v36 = *(void **)(a1 + 48);
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __51__CalAppleConferenceFormat_deserializeConferences___block_invoke_2;
      v42[3] = &unk_1E56CDBF0;
      v32 = v35;
      uint64_t v43 = v32;
      [v36 enumerateLinesUsingBlock:v42];
      if (v34 <= [(CalVirtualConferenceJoinMethod *)v32 count] - 1)
      {
        if (v18
          && ([(CalVirtualConferenceJoinMethod *)v32 objectAtIndexedSubscript:v34],
              v40 = objc_claimAutoreleasedReturnValue(),
              int v41 = [v40 isEqualToString:&stru_1EE0C39E0],
              v40,
              v41))
        {
          [(id)objc_opt_class() _parseConferenceTitle:v10 state:*(void *)(a1 + 32)];
        }
        else
        {
          [(id)objc_opt_class() _parseJoinMethodTitleAndFeatures:v10 state:*(void *)(a1 + 32)];
        }
      }
      else
      {
        v37 = [(id)objc_opt_class() calConferenceSerializationHandle];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190D88000, v37, OS_LOG_TYPE_DEFAULT, "Input does not have enough lines to be a valid section", buf, 2u);
        }

        [*(id *)(a1 + 32) resetToNewSection];
      }

      goto LABEL_46;
    case 2:
      if ([v10 isEqualToString:&stru_1EE0C39E0])
      {
        v20 = *(void **)(a1 + 32);
        uint64_t v21 = 5;
        goto LABEL_18;
      }
      v38 = [(id)objc_opt_class() calConferenceSerializationHandle];
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      *(_WORD *)buf = 0;
      v39 = "Conference title was not followed by an empty line";
      goto LABEL_42;
    case 3:
      goto LABEL_8;
    case 4:
      if ([v10 isEqualToString:@"---===---"])
      {
        v13 = [CalVirtualConferenceJoinMethod alloc];
        v14 = [*(id *)(a1 + 32) joinMethodTitle];
        v15 = [*(id *)(a1 + 32) joinMethodURL];
        uint64_t v16 = -[CalVirtualConferenceJoinMethod initWithTitle:URL:isBroadcast:](v13, "initWithTitle:URL:isBroadcast:", v14, v15, [*(id *)(a1 + 32) joinMethodIsBroadcast]);

        id v17 = [*(id *)(a1 + 32) joinMethods];
        [v17 addObject:v16];

        objc_msgSend(*(id *)(a1 + 32), "setEndRange:", a5, a6);
        [*(id *)(a1 + 32) setState:8];
        goto LABEL_34;
      }
      if ([v10 isEqualToString:&stru_1EE0C39E0])
      {
        v29 = [CalVirtualConferenceJoinMethod alloc];
        v30 = [*(id *)(a1 + 32) joinMethodTitle];
        v31 = [*(id *)(a1 + 32) joinMethodURL];
        v32 = -[CalVirtualConferenceJoinMethod initWithTitle:URL:isBroadcast:](v29, "initWithTitle:URL:isBroadcast:", v30, v31, [*(id *)(a1 + 32) joinMethodIsBroadcast]);

        char v33 = [*(id *)(a1 + 32) joinMethods];
        [v33 addObject:v32];

        [*(id *)(a1 + 32) setState:5];
LABEL_46:

        goto LABEL_47;
      }
      v38 = [(id)objc_opt_class() calConferenceSerializationHandle];
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      *(_WORD *)buf = 0;
      v39 = "URL was not followed by the end delimiter or an empty string";
      goto LABEL_42;
    case 5:
      [*(id *)(a1 + 32) setJoinMethodTitle:0];
      [*(id *)(a1 + 32) setJoinMethodIsBroadcast:0];
      uint64_t v22 = objc_opt_class();
      int v23 = [(id)objc_opt_class() _detailsDelimiterRegex];
      LODWORD(v22) = [v22 _line:v10 matchesRegex:v23 outFoundRange:0];

      if (v22)
      {
        v20 = *(void **)(a1 + 32);
        uint64_t v21 = 6;
        goto LABEL_18;
      }
      if (([v10 hasPrefix:@"["] & 1) != 0 {
        || [v10 hasPrefix:@"("]
      }
      {
        [(id)objc_opt_class() _parseJoinMethodTitleAndFeatures:v10 state:*(void *)(a1 + 32)];
      }
      else
      {
LABEL_8:
        [(id)objc_opt_class() _parseURL:v10 state:*(void *)(a1 + 32)];
      }
      goto LABEL_47;
    case 6:
      if ([v10 isEqualToString:&stru_1EE0C39E0])
      {
        v20 = *(void **)(a1 + 32);
        uint64_t v21 = 7;
        goto LABEL_18;
      }
      v38 = [(id)objc_opt_class() calConferenceSerializationHandle];
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      *(_WORD *)buf = 0;
      v39 = "ConferenceDetails delimiter was not followed by an empty string";
      goto LABEL_42;
    case 7:
      int v24 = [v10 isEqualToString:@"---===---"];
      v25 = [*(id *)(a1 + 32) conferenceDetails];
      uint64_t v16 = v25;
      if (v24)
      {
        uint64_t v26 = [(CalVirtualConferenceJoinMethod *)v25 count];

        if (v26)
        {
          objc_msgSend(*(id *)(a1 + 32), "setEndRange:", a5, a6);
          v20 = *(void **)(a1 + 32);
          uint64_t v21 = 8;
LABEL_18:
          [v20 setState:v21];
        }
        else
        {
          v38 = [(id)objc_opt_class() calConferenceSerializationHandle];
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v39 = "No conferenceDetails lines were found when end delimiter was hit, despite conferenceDetails delimiter being present";
LABEL_42:
            _os_log_impl(&dword_190D88000, v38, OS_LOG_TYPE_DEFAULT, v39, buf, 2u);
          }
LABEL_43:

          [*(id *)(a1 + 32) resetToNewSection];
        }
      }
      else
      {
        [(CalVirtualConferenceJoinMethod *)v25 addObject:v10];
LABEL_34:
      }
LABEL_47:
      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);

      return;
    case 8:
      v27 = *(void **)(a1 + 56);
      v28 = [(id)objc_opt_class() _buildDeserializationResultFromState:*(void *)(a1 + 32)];
      [v27 addObject:v28];

      goto LABEL_47;
    default:
      goto LABEL_47;
  }
}

uint64_t __51__CalAppleConferenceFormat_deserializeConferences___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (BOOL)supportsSerializingConferenceWithSource:(unint64_t)a3
{
  return a3 == 0;
}

+ (void)_parseURL:(id)a3 state:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CB10] URLWithString:a3 encodingInvalidCharacters:0];
  [v6 setJoinMethodURL:v7];

  uint64_t v8 = [v6 joinMethodURL];

  if (v8)
  {
    [v6 setState:4];
  }
  else
  {
    id v9 = [a1 calConferenceSerializationHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_190D88000, v9, OS_LOG_TYPE_DEFAULT, "Url was invalid when parsed from string", v10, 2u);
    }

    [v6 resetToNewSection];
  }
}

+ (void)_parseBlockTitle:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 _startDelimiterRegex];
  id v9 = objc_msgSend(v8, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));

  if ([v9 count] == 1
    && ([v9 firstObject],
        id v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 numberOfRanges],
        v10,
        v11 == 2))
  {
    id v12 = [v9 firstObject];
    uint64_t v13 = [v12 rangeWithName:@"blockTitle"];
    v15 = objc_msgSend(v6, "substringWithRange:", v13, v14);
    [v7 setBlockTitle:v15];
  }
  else
  {
    uint64_t v16 = [a1 calConferenceSerializationHandle];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[CalAppleConferenceFormat _parseBlockTitle:state:](v16);
    }

    [v7 setBlockTitle:&stru_1EE0C39E0];
  }
}

+ (void)_parseConferenceTitle:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 _conferenceTitleRegex];
  id v9 = objc_msgSend(v8, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));

  if ([v9 count] == 1
    && ([v9 firstObject],
        id v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 numberOfRanges],
        v10,
        v11 == 2))
  {
    id v12 = [v9 firstObject];
    uint64_t v13 = [v12 rangeWithName:@"title"];
    v15 = objc_msgSend(v6, "substringWithRange:", v13, v14);
    [v7 setConferenceTitle:v15];

    [v7 setState:2];
  }
  else
  {
    uint64_t v16 = [a1 calConferenceSerializationHandle];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_190D88000, v16, OS_LOG_TYPE_DEFAULT, "Conference title didn't match title regex", v17, 2u);
    }

    [v7 resetToNewSection];
  }
}

+ (void)_parseJoinMethodTitleAndFeatures:(id)a3 state:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 _joinMethodTitleAndFeaturesRegex];
  id v9 = objc_msgSend(v8, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));

  if ([v9 count] == 1
    && ([v9 firstObject],
        id v10 = objc_claimAutoreleasedReturnValue(),
        unint64_t v11 = [v10 numberOfRanges],
        v10,
        v11 > 1))
  {
    uint64_t v13 = [v9 firstObject];
    uint64_t v14 = [v13 rangeWithName:@"title"];
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v16 = objc_msgSend(v6, "substringWithRange:", v14, v15);
      [v7 setJoinMethodTitle:v16];
    }
    uint64_t v17 = [v13 rangeWithName:@"features"];
    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int v19 = objc_msgSend(v6, "substringWithRange:", v17, v18);
      [v19 componentsSeparatedByString:@","];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        v30 = v19;
        id v31 = v7;
        uint64_t v23 = *(void *)v33;
        while (2)
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v33 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            uint64_t v26 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
            v27 = [v25 stringByTrimmingCharactersInSet:v26];

            uint64_t v28 = [v27 caseInsensitiveCompare:@"Broadcast"];
            if (!v28)
            {
              uint64_t v29 = 1;
              goto LABEL_19;
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v37 count:16];
          if (v22) {
            continue;
          }
          break;
        }
        uint64_t v29 = 0;
LABEL_19:
        id v7 = v31;
        int v19 = v30;
      }
      else
      {
        uint64_t v29 = 0;
      }

      [v7 setJoinMethodIsBroadcast:v29];
    }
    [v7 setState:3];
  }
  else
  {
    id v12 = [a1 calConferenceSerializationHandle];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190D88000, v12, OS_LOG_TYPE_DEFAULT, "Join method title/features didn't match regex", buf, 2u);
    }

    [v7 resetToNewSection];
  }
}

+ (id)_buildDeserializationResultFromState:(id)a3
{
  id v3 = a3;
  id v4 = [v3 conferenceDetails];
  id v5 = [v4 componentsJoinedByString:@"\n"];

  id v6 = [v3 conferenceDetails];
  [v6 removeAllObjects];

  if ([v5 isEqualToString:&stru_1EE0C39E0])
  {

    id v5 = 0;
  }
  id v7 = [CalVirtualConference alloc];
  uint64_t v8 = [v3 conferenceTitle];
  id v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = [v3 joinMethods];
  unint64_t v11 = [v9 arrayWithArray:v10];
  id v12 = [(CalVirtualConference *)v7 initWithTitle:v8 joinMethods:v11 conferenceDetails:v5 source:0 isWritable:1];

  uint64_t v13 = [v3 joinMethods];
  [v13 removeAllObjects];

  NSUInteger v14 = [v3 startRange];
  NSUInteger v16 = v15;
  v25.location = [v3 endRange];
  v25.length = v17;
  v24.location = v14;
  v24.length = v16;
  NSRange v18 = NSUnionRange(v24, v25);
  int v19 = [CalConferenceDeserializationResult alloc];
  id v20 = [v3 blockTitle];
  uint64_t v21 = -[CalConferenceDeserializationResult initWithConference:range:blockTitle:](v19, "initWithConference:range:blockTitle:", v12, v18.location, v18.length, v20);

  [v3 setState:0];

  return v21;
}

+ (BOOL)_line:(id)a3 matchesRegex:(id)a4 outFoundRange:(_NSRange *)a5
{
  id v7 = a4;
  id v8 = a3;
  NSUInteger v9 = objc_msgSend(v7, "rangeOfFirstMatchInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
  NSUInteger v11 = v10;

  if (a5)
  {
    a5->location = v9;
    a5->length = v11;
  }
  return v9 != 0x7FFFFFFFFFFFFFFFLL || v11 != 0;
}

+ (id)_joinMethodTitleAndFeaturesRegex
{
  if (_joinMethodTitleAndFeaturesRegex_onceToken != -1) {
    dispatch_once(&_joinMethodTitleAndFeaturesRegex_onceToken, &__block_literal_global_147);
  }
  v2 = (void *)_joinMethodTitleAndFeaturesRegex_regex;

  return v2;
}

uint64_t __60__CalAppleConferenceFormat__joinMethodTitleAndFeaturesRegex__block_invoke()
{
  _joinMethodTitleAndFeaturesRegex_regex = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^(?:\\[(?<title>.*)\\])? ?(?:\\((?<features>.+)\\))?$" options:16 error:0];

  return MEMORY[0x1F41817F8]();
}

+ (id)_conferenceTitleRegex
{
  if (_conferenceTitleRegex_onceToken != -1) {
    dispatch_once(&_conferenceTitleRegex_onceToken, &__block_literal_global_153);
  }
  v2 = (void *)_conferenceTitleRegex_regex;

  return v2;
}

uint64_t __49__CalAppleConferenceFormat__conferenceTitleRegex__block_invoke()
{
  _conferenceTitleRegex_regex = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^\\[(?<title>.*)\\].*$" options:16 error:0];

  return MEMORY[0x1F41817F8]();
}

+ (id)_startDelimiterRegex
{
  if (_startDelimiterRegex_onceToken != -1) {
    dispatch_once(&_startDelimiterRegex_onceToken, &__block_literal_global_158);
  }
  v2 = (void *)_startDelimiterRegex_regex;

  return v2;
}

void __48__CalAppleConferenceFormat__startDelimiterRegex__block_invoke()
{
  v0 = NSString;
  v1 = objc_msgSend(MEMORY[0x1E4F28FD8], "escapedPatternForString:", @"----( ");
  v2 = [MEMORY[0x1E4F28FD8] escapedPatternForString:@"----"]);
  id v5 = [v0 stringWithFormat:@"%@(?<blockTitle>.*)%@$", v1, v2];

  uint64_t v3 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v5 options:16 error:0];
  id v4 = (void *)_startDelimiterRegex_regex;
  _startDelimiterRegex_regex = v3;
}

+ (id)_detailsDelimiterRegex
{
  if (_detailsDelimiterRegex_onceToken != -1) {
    dispatch_once(&_detailsDelimiterRegex_onceToken, &__block_literal_global_163);
  }
  v2 = (void *)_detailsDelimiterRegex_regex;

  return v2;
}

void __50__CalAppleConferenceFormat__detailsDelimiterRegex__block_invoke()
{
  v0 = NSString;
  v1 = objc_msgSend(MEMORY[0x1E4F28FD8], "escapedPatternForString:", @"---( ");
  v2 = [MEMORY[0x1E4F28FD8] escapedPatternForString:@"---"]);
  id v5 = [v0 stringWithFormat:@"^%@.*%@$", v1, v2];

  uint64_t v3 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v5 options:16 error:0];
  id v4 = (void *)_detailsDelimiterRegex_regex;
  _detailsDelimiterRegex_regex = v3;
}

+ (void)_parseBlockTitle:(os_log_t)log state:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_190D88000, log, OS_LOG_TYPE_ERROR, "Block title match not found despite regex matching line", v1, 2u);
}

@end