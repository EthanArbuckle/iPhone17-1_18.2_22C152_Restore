@interface CUIKInviteeDescriptionGenerator
+ (id)inviteeStringForAttendees:(id)a3;
+ (id)inviteeStringForEvent:(id)a3;
@end

@implementation CUIKInviteeDescriptionGenerator

+ (id)inviteeStringForEvent:(id)a3
{
  v4 = [a3 attendees];
  v5 = [a1 inviteeStringForAttendees:v4];

  return v5;
}

+ (id)inviteeStringForAttendees:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v27 + 1) + 8 * v9);
        if (([v10 isCurrentUser] & 1) == 0)
        {
          v11 = [v10 name];

          if (v11)
          {
            uint64_t v12 = [v10 name];
            goto LABEL_11;
          }
          v13 = [v10 emailAddress];

          if (v13)
          {
            uint64_t v12 = [v10 emailAddress];
LABEL_11:
            v14 = (__CFString *)v12;
          }
          else
          {
            v15 = [v10 phoneNumber];

            if (v15)
            {
              v16 = +[CUIKPhoneNumberDescriptionGenerator sharedGenerator];
              v17 = [v10 phoneNumber];
              v14 = [v16 formattedStringForPhoneNumber:v17];
            }
            else
            {
              v14 = &stru_1F187C430;
            }
          }
          [v4 addObject:v14];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v18 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
      uint64_t v7 = v18;
    }
    while (v18);
  }

  if ([v4 count])
  {
    uint64_t v19 = [v4 count];
    v20 = NSString;
    v21 = CUIKBundle();
    v22 = v21;
    if (v19 == 1)
    {
      v23 = [v21 localizedStringForKey:@"Invitees: %@" value:&stru_1F187C430 table:0];
      v24 = [v4 firstObject];
      v25 = objc_msgSend(v20, "localizedStringWithFormat:", v23, v24);
    }
    else
    {
      v23 = [v21 localizedStringForKey:@"%lu Invitees" value:&stru_1F187C430 table:0];
      v25 = objc_msgSend(v20, "localizedStringWithFormat:", v23, objc_msgSend(v4, "count"));
    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

@end