@interface EKCalendarSharedCalendarNotification(CUIKDescription)
- (BOOL)supportsDisplay;
- (id)_actionStringWithOptions:()CUIKDescription;
- (id)allDescriptionStringsWithOptions:()CUIKDescription;
- (id)descriptionStrings:()CUIKDescription;
- (id)titleStringWithOptions:()CUIKDescription;
@end

@implementation EKCalendarSharedCalendarNotification(CUIKDescription)

- (BOOL)supportsDisplay
{
  return [a1 type] == 8;
}

- (id)titleStringWithOptions:()CUIKDescription
{
  v3.receiver = a1;
  v3.super_class = (Class)&off_1F18C1208;
  v1 = objc_msgSendSuper2(&v3, sel_titleStringWithOptions_);

  return v1;
}

- (id)_actionStringWithOptions:()CUIKDescription
{
  char v5 = [a1 allowedEntityTypes];
  v6 = [a1 _identityStringWithOptions:a3];
  if ((v5 & 2) != 0)
  {
    v7 = NSString;
    v8 = CUIKBundle();
    v9 = v8;
    v10 = @"Invitation to share a reminders list with %@.";
  }
  else
  {
    v7 = NSString;
    v8 = CUIKBundle();
    v9 = v8;
    if ((a3 & 0x20) != 0) {
      v10 = @"%@ invited you to a shared calendar.";
    }
    else {
      v10 = @"Invitation to share a calendar with %@.";
    }
  }
  v11 = [v8 localizedStringForKey:v10 value:&stru_1F187C430 table:0];
  v12 = objc_msgSend(v7, "localizedStringWithFormat:", v11, v6);

  return v12;
}

- (id)allDescriptionStringsWithOptions:()CUIKDescription
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v1 = objc_msgSend(a1, "_actionStringWithOptions:");
  v4[0] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)descriptionStrings:()CUIKDescription
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ((a3 & 0x20) != 0)
  {
    v11 = @"Person";
    objc_super v3 = objc_msgSend(a1, "_actionStringWithOptions:");
    v12[0] = v3;
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    char v5 = (void **)v12;
    v6 = &v11;
  }
  else
  {
    v9 = @"Action";
    objc_super v3 = objc_msgSend(a1, "_actionStringWithOptions:");
    v10 = v3;
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    char v5 = &v10;
    v6 = &v9;
  }
  v7 = [v4 dictionaryWithObjects:v5 forKeys:v6 count:1];

  return v7;
}

@end