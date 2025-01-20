@interface CUIKAttendeeDescriptionGenerator
+ (id)displayNameForIdentity:(id)a3;
+ (id)displayNameForIdentity:(id)a3 outFirstName:(id *)a4 outLastName:(id *)a5;
+ (id)displayNameForParticipant:(id)a3 event:(id)a4 options:(unint64_t)a5;
+ (id)sharedGenerator;
@end

@implementation CUIKAttendeeDescriptionGenerator

+ (id)sharedGenerator
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CUIKAttendeeDescriptionGenerator_sharedGenerator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedGenerator_onceToken_1 != -1) {
    dispatch_once(&sharedGenerator_onceToken_1, block);
  }
  v2 = (void *)sharedGenerator___sharedInstance_1;

  return v2;
}

void __51__CUIKAttendeeDescriptionGenerator_sharedGenerator__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedGenerator___sharedInstance_1;
  sharedGenerator___sharedInstance_1 = (uint64_t)v1;
}

+ (id)displayNameForParticipant:(id)a3 event:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [a1 displayNameForIdentity:v8];
  if (v5)
  {
    v11 = [v9 organizer];
    int v12 = [v8 isEqualToParticipant:v11];

    if (v12)
    {
      if ([v9 couldBeJunk])
      {
        v13 = [v8 emailAddress];

        if (v13)
        {
          uint64_t v14 = [v8 emailAddress];
        }
        else
        {
          v19 = [v8 phoneNumber];

          if (v19)
          {
            v20 = +[CUIKPhoneNumberDescriptionGenerator sharedGenerator];
            v21 = [v8 phoneNumber];
            uint64_t v14 = [v20 formattedStringForPhoneNumber:v21];
          }
          else
          {
            v20 = [v8 URL];
            uint64_t v14 = [v20 resourceSpecifier];
          }
          v10 = v20;
        }

        v10 = (void *)v14;
      }
      v15 = NSString;
      v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v17 = v16;
      v18 = @"%@ (organizer)";
    }
    else
    {
      if ([v8 participantRole] != 2) {
        goto LABEL_15;
      }
      v15 = NSString;
      v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v17 = v16;
      v18 = @"%@ (optional)";
    }
    v22 = [v16 localizedStringForKey:v18 value:&stru_1F187C430 table:0];
    uint64_t v23 = objc_msgSend(v15, "localizedStringWithFormat:", v22, v10);

    v10 = (void *)v23;
  }
LABEL_15:

  return v10;
}

+ (id)displayNameForIdentity:(id)a3
{
  return (id)[a1 displayNameForIdentity:a3 outFirstName:0 outLastName:0];
}

+ (id)displayNameForIdentity:(id)a3 outFirstName:(id *)a4 outLastName:(id *)a5
{
  id v7 = a3;
  id v8 = [v7 name];
  id v9 = [v7 emailAddress];
  int v10 = [v9 isEqualToString:@"unknownorganizer@calendar.google.com"];

  if (v10)
  {
    v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v12 = [v11 localizedStringForKey:@"Google Calendar" value:&stru_1F187C430 table:0];

    goto LABEL_31;
  }
  uint64_t v13 = [v8 length];
  if (!a5 && !a4 && v13)
  {
    id v12 = v8;
    goto LABEL_31;
  }
  uint64_t v14 = [v7 phoneNumber];

  if (v14)
  {
    v15 = [v7 phoneNumber];
    v16 = [v7 phoneNumber];
    char v17 = objc_msgSend(v16, "cal_isPhoneNumber");
  }
  else
  {
    v15 = [v7 emailAddress];
    v16 = [v7 emailAddress];
    if (v16) {
      char v17 = CFStringFind(v15, @"@", 0).location != -1;
    }
    else {
      char v17 = 0;
    }
  }

  if ([(__CFString *)v15 length])
  {
    if (v17)
    {
      v18 = [v7 phoneNumber];
      int v19 = objc_msgSend(v18, "cal_isPhoneNumber");

      v20 = [MEMORY[0x1E4F576B0] defaultProvider];
      if (v19)
      {
        v21 = [v7 phoneNumber];
        [v20 unifiedContactWithPhoneNumber:v21];
      }
      else
      {
        v21 = [v7 emailAddress];
        [v20 unifiedContactWithEmailAddress:v21];
      v22 = };

      if (a4)
      {
        *a4 = [v22 givenName];
      }
      if (a5)
      {
        *a5 = [v22 familyName];
      }
      id v23 = [v22 CalDisplayName];

      if (v23) {
        goto LABEL_24;
      }
    }
    else
    {

      v15 = 0;
    }
  }
  id v23 = v8;
LABEL_24:
  v24 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v25 = [v23 stringByTrimmingCharactersInSet:v24];

  if (![v25 length] && -[__CFString length](v15, "length"))
  {
    if ([(__CFString *)v15 cal_isPhoneNumber])
    {
      v26 = +[CUIKPhoneNumberDescriptionGenerator sharedGenerator];
      v27 = [v26 formattedStringForPhoneNumber:v15];

      v25 = v26;
    }
    else
    {
      v27 = v15;
    }

    v25 = v27;
  }
  id v12 = v25;

LABEL_31:

  return v12;
}

@end