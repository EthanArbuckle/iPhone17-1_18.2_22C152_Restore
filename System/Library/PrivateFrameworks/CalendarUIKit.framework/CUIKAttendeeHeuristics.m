@interface CUIKAttendeeHeuristics
+ (id)_participantRoleSortPriority;
+ (id)_participantStatusSortPriority;
+ (id)sortedHumanAttendeesForEvent:(id)a3 includeResources:(BOOL)a4;
+ (id)sortedHumanAttendeesToDisplayForEvent:(id)a3 options:(unint64_t)a4;
@end

@implementation CUIKAttendeeHeuristics

+ (id)sortedHumanAttendeesToDisplayForEvent:(id)a3 options:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[CUIKAttendeeHeuristics sortedHumanAttendeesForEvent:v5 includeResources:(a4 >> 1) & 1];
  v7 = [v5 organizer];
  v8 = (void *)[v6 mutableCopy];
  v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  }
  v11 = v10;

  if ((a4 & 1) == 0)
  {
    v12 = [v5 selfAttendee];
    if (v12)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v13 = v6;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v21;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v21 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            if (objc_msgSend(v18, "isEqualToParticipant:", v12, (void)v20))
            {
              [v11 removeObject:v18];
              goto LABEL_16;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }
LABEL_16:
    }
  }
  if (v7 && ([v7 isCurrentUser] & 1) == 0) {
    [v11 insertObject:v7 atIndex:0];
  }

  return v11;
}

+ (id)sortedHumanAttendeesForEvent:(id)a3 includeResources:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 attendees];
  v31 = v5;
  v7 = [v5 organizer];
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
  v32 = v9;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8 * v13);
        uint64_t v15 = [v14 participantType];
        int v16 = [v14 isEqualToParticipant:v7];
        int v17 = v15 != 3 || v4;
        if (v16) {
          BOOL v18 = 1;
        }
        else {
          BOOL v18 = v15 == 2;
        }
        if (!v18 && v17 != 0)
        {
          long long v20 = [v14 name];
          if ([v20 length]) {
            goto LABEL_19;
          }
          long long v21 = [v14 emailAddress];
          if ([v21 length])
          {

LABEL_19:
LABEL_20:
            [v8 addObject:v14];
            goto LABEL_21;
          }
          [v14 phoneNumber];
          long long v22 = v7;
          v24 = long long v23 = v8;
          uint64_t v33 = [v24 length];

          v8 = v23;
          v7 = v22;
          id v9 = v32;

          if (v33) {
            goto LABEL_20;
          }
        }
LABEL_21:
        ++v13;
      }
      while (v11 != v13);
      uint64_t v25 = [v9 countByEnumeratingWithState:&v34 objects:v40 count:16];
      uint64_t v11 = v25;
    }
    while (v25);
  }

  v26 = (void *)MEMORY[0x1E4F1CA60];
  v38 = @"DisplayNameCache";
  v27 = [MEMORY[0x1E4F1CA60] dictionary];
  v39 = v27;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  v29 = [v26 dictionaryWithDictionary:v28];

  if (v31) {
    [v29 setObject:v31 forKeyedSubscript:@"Event"];
  }
  if (v7) {
    [v29 setObject:v7 forKeyedSubscript:@"Organizer"];
  }
  [v8 sortUsingFunction:CUIKParticipantDisplaySort context:v29];

  return v8;
}

+ (id)_participantStatusSortPriority
{
  if (_participantStatusSortPriority_onceToken != -1) {
    dispatch_once(&_participantStatusSortPriority_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)_participantStatusSortPriority__sParticipantStatusSortPriority;

  return v2;
}

void __56__CUIKAttendeeHeuristics__participantStatusSortPriority__block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F1891F88;
  v2[1] = &unk_1F1891FB8;
  v3[0] = &unk_1F1891FA0;
  v3[1] = &unk_1F1891FD0;
  v2[2] = &unk_1F1891FE8;
  v2[3] = &unk_1F1892018;
  v3[2] = &unk_1F1892000;
  v3[3] = &unk_1F1892030;
  v2[4] = &unk_1F1892048;
  v2[5] = &unk_1F1892060;
  v3[4] = &unk_1F1892030;
  v3[5] = &unk_1F1892078;
  v2[6] = &unk_1F1892090;
  v2[7] = &unk_1F18920C0;
  v3[6] = &unk_1F18920A8;
  v3[7] = &unk_1F18920D8;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)_participantStatusSortPriority__sParticipantStatusSortPriority;
  _participantStatusSortPriority__sParticipantStatusSortPriority = v0;
}

+ (id)_participantRoleSortPriority
{
  if (_participantRoleSortPriority_onceToken != -1) {
    dispatch_once(&_participantRoleSortPriority_onceToken, &__block_literal_global_51);
  }
  v2 = (void *)_participantRoleSortPriority__sParticipantRoleSortPriority;

  return v2;
}

void __54__CUIKAttendeeHeuristics__participantRoleSortPriority__block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F1891FE8;
  v2[1] = &unk_1F1892018;
  v3[0] = &unk_1F1891FA0;
  v3[1] = &unk_1F1891FD0;
  v2[2] = &unk_1F1892048;
  v2[3] = &unk_1F1891F88;
  v3[2] = &unk_1F1891FD0;
  v3[3] = &unk_1F1892000;
  v2[4] = &unk_1F1891FB8;
  v3[4] = &unk_1F1892030;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  v1 = (void *)_participantRoleSortPriority__sParticipantRoleSortPriority;
  _participantRoleSortPriority__sParticipantRoleSortPriority = v0;
}

@end