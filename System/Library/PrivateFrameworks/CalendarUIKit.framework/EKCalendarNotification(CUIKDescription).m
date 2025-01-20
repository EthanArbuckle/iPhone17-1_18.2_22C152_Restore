@interface EKCalendarNotification(CUIKDescription)
- (id)_identityStringForIdentity:()CUIKDescription withOptions:;
- (id)timeSensitiveDescriptionString;
- (uint64_t)_identityStringWithOptions:()CUIKDescription;
- (uint64_t)allDescriptionStringsWithOptions:()CUIKDescription;
- (uint64_t)descriptionStrings:()CUIKDescription;
- (uint64_t)senderStringWithOptions:()CUIKDescription;
- (uint64_t)supportsDisplay;
@end

@implementation EKCalendarNotification(CUIKDescription)

- (uint64_t)supportsDisplay
{
  return 0;
}

- (uint64_t)senderStringWithOptions:()CUIKDescription
{
  return 0;
}

- (uint64_t)allDescriptionStringsWithOptions:()CUIKDescription
{
  return MEMORY[0x1E4F1CBF0];
}

- (uint64_t)descriptionStrings:()CUIKDescription
{
  return MEMORY[0x1E4F1CC08];
}

- (uint64_t)_identityStringWithOptions:()CUIKDescription
{
  return [a1 _identityStringForIdentity:a1 withOptions:a3];
}

- (id)_identityStringForIdentity:()CUIKDescription withOptions:
{
  id v6 = a3;
  if ((a4 & 2) != 0)
  {
    id v20 = 0;
    v7 = +[CUIKAttendeeDescriptionGenerator displayNameForIdentity:v6 outFirstName:&v20 outLastName:0];
    id v8 = v20;
  }
  else
  {
    v7 = +[CUIKAttendeeDescriptionGenerator displayNameForIdentity:v6 outFirstName:0 outLastName:0];
    id v8 = 0;
  }
  if ([a1 couldBeJunk])
  {
    v9 = [a1 emailAddress];

    if (v9)
    {
      id v10 = [a1 emailAddress];
LABEL_23:
      id v14 = v10;
      goto LABEL_24;
    }
  }
  if ([a1 couldBeJunk]
    && ([a1 phoneNumber], v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    v12 = +[CUIKPhoneNumberDescriptionGenerator sharedGenerator];
    v13 = [a1 phoneNumber];
    id v14 = [v12 formattedStringForPhoneNumber:v13];
  }
  else
  {
    if ((a4 & 2) == 0)
    {
      if (v7) {
        goto LABEL_25;
      }
      v15 = CUIKBundle();
      v7 = v15;
      if (a4) {
        v16 = @"Somebody";
      }
      else {
        v16 = @"somebody";
      }
      id v10 = [v15 localizedStringForKey:v16 value:&stru_1F187C430 table:0];
      goto LABEL_23;
    }
    if (v8)
    {
      id v10 = v8;
      goto LABEL_23;
    }
    uint64_t v17 = [a1 firstName];
    v12 = (void *)v17;
    if (v17) {
      v18 = (void *)v17;
    }
    else {
      v18 = v7;
    }
    id v14 = v18;
  }
  v7 = v12;
LABEL_24:

  v7 = v14;
LABEL_25:

  return v7;
}

- (id)timeSensitiveDescriptionString
{
  if (objc_msgSend(a1, "cuik_isTimeSensitive"))
  {
    v1 = +[CUIKNotificationDescriptionGenerator timeSensitiveString];
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

@end