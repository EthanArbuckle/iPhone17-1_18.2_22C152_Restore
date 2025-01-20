@interface EKCalendarInviteReplyNotification(CUIKDescription)
- (BOOL)supportsDisplay;
- (id)_actionWithOptions:()CUIKDescription;
- (id)allDescriptionStringsWithOptions:()CUIKDescription;
- (id)descriptionStrings:()CUIKDescription;
- (id)titleStringWithOptions:()CUIKDescription;
@end

@implementation EKCalendarInviteReplyNotification(CUIKDescription)

- (BOOL)supportsDisplay
{
  return [a1 type] == 9 || objc_msgSend(a1, "type") == 10;
}

- (id)titleStringWithOptions:()CUIKDescription
{
  v6.receiver = a1;
  v6.super_class = (Class)&off_1F18C1E58;
  v1 = objc_msgSendSuper2(&v6, sel_titleStringWithOptions_);
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    v4 = CUIKBundle();
    id v3 = [v4 localizedStringForKey:@"Shared Calendar" value:&stru_1F187C430 table:0];
  }

  return v3;
}

- (id)_actionWithOptions:()CUIKDescription
{
  if (([a1 allowedEntityTypes] & 2) != 0)
  {
    char v6 = [a1 allowedEntityTypes];
    BOOL v5 = (v6 & 1) == 0;
    if ([a1 type] != 10) {
      goto LABEL_7;
    }
    if ((v6 & 1) == 0)
    {
      v7 = CUIKBundle();
      v8 = v7;
      v9 = @"This reminders list is no longer shared.";
LABEL_13:
      v14 = [v7 localizedStringForKey:v9 value:&stru_1F187C430 table:0];
      goto LABEL_22;
    }
LABEL_12:
    v7 = CUIKBundle();
    v8 = v7;
    v9 = @"This calendar is no longer shared.";
    goto LABEL_13;
  }
  if ([a1 type] == 10) {
    goto LABEL_12;
  }
  BOOL v5 = 0;
LABEL_7:
  if ([a1 type] != 9)
  {
    v14 = 0;
    goto LABEL_23;
  }
  v8 = [a1 _identityStringWithOptions:a3];
  if ([a1 status] == 2)
  {
    v10 = NSString;
    v11 = CUIKBundle();
    v12 = v11;
    if (v5) {
      v13 = @"%@ declined your shared reminders list.";
    }
    else {
      v13 = @"%@ declined your shared calendar.";
    }
  }
  else
  {
    uint64_t v15 = [a1 status];
    v10 = NSString;
    v11 = CUIKBundle();
    v12 = v11;
    if (v15 == 1)
    {
      v16 = @"%@ joined your shared calendar.";
      v17 = @"%@ joined your shared reminders list.";
    }
    else
    {
      v16 = @"%@ is pending on this shared calendar invitation.";
      v17 = @"%@ is pending on this shared reminders list invitation.";
    }
    if (v5) {
      v13 = v17;
    }
    else {
      v13 = v16;
    }
  }
  v18 = [v11 localizedStringForKey:v13 value:&stru_1F187C430 table:0];
  v14 = objc_msgSend(v10, "localizedStringWithFormat:", v18, v8);

LABEL_22:
LABEL_23:

  return v14;
}

- (id)allDescriptionStringsWithOptions:()CUIKDescription
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_msgSend(a1, "_actionWithOptions:");
  v2 = (void *)v1;
  if (v1)
  {
    v5[0] = v1;
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (id)descriptionStrings:()CUIKDescription
{
  BOOL v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  char v6 = [a1 _actionWithOptions:a3];
  [v5 setObject:v6 forKeyedSubscript:@"Action"];

  v7 = [a1 timeSensitiveDescriptionString];
  [v5 setObject:v7 forKeyedSubscript:@"TimeSensitive"];

  v8 = (void *)[v5 copy];

  return v8;
}

@end