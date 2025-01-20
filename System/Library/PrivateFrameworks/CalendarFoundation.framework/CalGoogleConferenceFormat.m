@interface CalGoogleConferenceFormat
+ (id)_delimiterRegex;
+ (id)calConferenceSerializationHandle;
- (BOOL)supportsSerializingConferenceWithSource:(unint64_t)a3;
- (id)deserializeConferences:(id)a3;
- (id)serializeConference:(id)a3 serializationBlockTitle:(id)a4;
@end

@implementation CalGoogleConferenceFormat

- (id)deserializeConferences:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v33 = [MEMORY[0x1E4F1CA48] array];
  if ([v4 length])
  {
    v32 = self;
    v5 = [(id)objc_opt_class() _delimiterRegex];
    v6 = objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v38;
      do
      {
        uint64_t v10 = 0;
        uint64_t v34 = v8;
        do
        {
          if (*(void *)v38 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v37 + 1) + 8 * v10);
          if (objc_msgSend(v11, "numberOfRanges", v32) == 2)
          {
            uint64_t v12 = [v11 rangeAtIndex:1];
            v14 = objc_msgSend(v4, "substringWithRange:", v12, v13);
            v15 = +[CalConferenceURLDetector googleMeetURLsAndPhoneNumbersFromSource:v14];
            v16 = [v15 CalMap:&__block_literal_global_14];
            if ([v16 count])
            {
              uint64_t v17 = v9;
              id v18 = v4;
              v19 = [v15 lastObject];
              uint64_t v20 = [v19 range];
              uint64_t v22 = v21;

              v23 = [v14 substringFromIndex:v20 + v22];
              v24 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
              v25 = [v23 stringByTrimmingCharactersInSet:v24];

              if (![v25 length])
              {

                v25 = 0;
              }
              v26 = [[CalVirtualConference alloc] initWithTitle:0 joinMethods:v16 conferenceDetails:v25 source:1 isWritable:0];
              v27 = [CalConferenceDeserializationResult alloc];
              uint64_t v28 = [v11 range];
              v30 = -[CalConferenceDeserializationResult initWithConference:range:blockTitle:](v27, "initWithConference:range:blockTitle:", v26, v28, v29, &stru_1EE0C39E0);
              [v33 addObject:v30];

              id v4 = v18;
              uint64_t v9 = v17;
              uint64_t v8 = v34;
            }
            else
            {
              v25 = [(id)objc_opt_class() calConferenceSerializationHandle];
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_190D88000, v25, OS_LOG_TYPE_DEFAULT, "Found Google delimiters but can't add a conference because there are no valid URLs inside", buf, 2u);
              }
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v8);
    }
  }

  return v33;
}

CalVirtualConferenceJoinMethod *__52__CalGoogleConferenceFormat_deserializeConferences___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 resultType] == 2048)
  {
    v3 = [v2 phoneNumber];

    id v4 = [v3 phoneURL];
    id v2 = v3;
  }
  else
  {
    id v4 = [v2 URL];
  }

  v5 = [[CalVirtualConferenceJoinMethod alloc] initWithTitle:0 URL:v4 isBroadcast:0];

  return v5;
}

- (id)serializeConference:(id)a3 serializationBlockTitle:(id)a4
{
  return 0;
}

- (BOOL)supportsSerializingConferenceWithSource:(unint64_t)a3
{
  return 0;
}

+ (id)_delimiterRegex
{
  if (_delimiterRegex_onceToken != -1) {
    dispatch_once(&_delimiterRegex_onceToken, &__block_literal_global_9_0);
  }
  id v2 = (void *)_delimiterRegex_delimiterRegex;

  return v2;
}

void __44__CalGoogleConferenceFormat__delimiterRegex__block_invoke()
{
  id v2 = [NSString stringWithFormat:@"%@(.*?)%@\n?", @"-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-", @"-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-"];
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v2 options:8 error:0];
  v1 = (void *)_delimiterRegex_delimiterRegex;
  _delimiterRegex_delimiterRegex = v0;
}

+ (id)calConferenceSerializationHandle
{
  if (calConferenceSerializationHandle_onceToken_0 != -1) {
    dispatch_once(&calConferenceSerializationHandle_onceToken_0, &__block_literal_global_19_0);
  }
  id v2 = (void *)calConferenceSerializationHandle_logHandle_0;

  return v2;
}

uint64_t __61__CalGoogleConferenceFormat_calConferenceSerializationHandle__block_invoke()
{
  calConferenceSerializationHandle_logHandle_0 = (uint64_t)os_log_create("com.apple.calendar.calendarFoundation", "googleConferenceSerialization");

  return MEMORY[0x1F41817F8]();
}

@end