@interface EKEvent(AttendeeUtils)
- (id)sortedEKParticipantsDisplayStringsIgnoringNonHumans:()AttendeeUtils;
- (uint64_t)hasHumanInviteesToDisplay;
- (uint64_t)sortEKParticipantsIgnoringNonHumans:()AttendeeUtils;
@end

@implementation EKEvent(AttendeeUtils)

- (uint64_t)sortEKParticipantsIgnoringNonHumans:()AttendeeUtils
{
  return [MEMORY[0x1E4F57B30] sortEKParticipantsIgnoringNonHumans:a3 event:a1];
}

- (id)sortedEKParticipantsDisplayStringsIgnoringNonHumans:()AttendeeUtils
{
  v47[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F57B30] sortedEKParticipantsForSortingIgnoringNonHumans:a3 event:a1];
  v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
  uint64_t v46 = *MEMORY[0x1E4FB06F8];
  v47[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v7 = v3;
  uint64_t v37 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v37)
  {
    v8 = (os_log_t *)&kEKUILogHandle;
    uint64_t v36 = *(void *)v40;
    v33 = v4;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v40 != v36) {
          objc_enumerationMutation(v7);
        }
        v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v11 = [v10 participant];
        v12 = [v10 displayName];

        if (v12)
        {
          id v13 = objc_alloc(MEMORY[0x1E4F28E48]);
          v14 = [v10 displayName];
          v15 = (void *)[v13 initWithString:v14 attributes:v5];

          v16 = (void *)MEMORY[0x1E4F57BA8];
          v17 = [v11 comment];
          v18 = [v16 stringWithAutoCommentRemoved:v17];

          v38 = v18;
          if ([v18 length])
          {
            v19 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
            [v15 appendAttributedString:v19];

            v20 = [MEMORY[0x1E4F57C18] sharedInstance];
            v21 = [v20 commentIconStringForFont:v4];
            [v15 appendAttributedString:v21];
          }
          v22 = objc_alloc_init(EKParticipantForDisplay);
          [(EKParticipantForDisplay *)v22 setOptionalParticipant:0];
          if (v15)
          {
            if ([v11 participantRole] == 2)
            {
              v34 = NSString;
              v23 = EventKitUIBundle();
              [v23 localizedStringForKey:@"optional" value:&stru_1F0CC2140 table:0];
              v24 = v8;
              id v25 = v7;
              v26 = v5;
              v28 = id v27 = v6;
              v35 = [v34 stringWithFormat:@" (%@)", v28];

              id v6 = v27;
              v5 = v26;
              id v7 = v25;
              v8 = v24;

              v29 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v35 attributes:v5];
              [v15 appendAttributedString:v29];
              [(EKParticipantForDisplay *)v22 setOptionalParticipant:1];

              v4 = v33;
            }
            [(EKParticipantForDisplay *)v22 setDisplayString:v15];
            [v6 addObject:v22];
          }
          else
          {
            v31 = *v8;
            if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v44 = v11;
              _os_log_impl(&dword_1B3F4C000, v31, OS_LOG_TYPE_ERROR, "Unable to get display name for participant %@", buf, 0xCu);
            }
          }
        }
        else
        {
          v30 = *v8;
          if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v11;
            _os_log_impl(&dword_1B3F4C000, v30, OS_LOG_TYPE_ERROR, "Unable to get display name for participant %@", buf, 0xCu);
          }
        }
      }
      uint64_t v37 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v37);
  }

  return v6;
}

- (uint64_t)hasHumanInviteesToDisplay
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (![a1 hasAttendees]) {
    return 0;
  }
  [a1 attendees];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v7 = [v6 participantType];
        v8 = [v6 name];
        if ([v8 length])
        {
          BOOL v9 = 0;
        }
        else
        {
          v10 = [v6 URL];
          v11 = [v10 resourceSpecifier];
          BOOL v9 = [v11 length] == 0;
        }
        v12 = [a1 organizer];
        char v13 = [v6 isEqualToParticipant:v12];

        if ((v13 & 1) == 0 && (v7 & 0xFFFFFFFFFFFFFFFELL) != 2 && !v9)
        {
          uint64_t v15 = 1;
          goto LABEL_20;
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 0;
LABEL_20:

  return v15;
}

@end