@interface CUIKUserActivityRemindersListSharedInvitation
- (BOOL)_isMatchForSource:(id)a3 andTitle:(id)a4;
- (CUIKUserActivityRemindersListSharedInvitation)initWithDictionary:(id)a3;
- (CUIKUserActivityRemindersListSharedInvitation)initWithSource:(id)a3 title:(id)a4;
- (NSString)title;
- (id)dictionary;
@end

@implementation CUIKUserActivityRemindersListSharedInvitation

- (CUIKUserActivityRemindersListSharedInvitation)initWithSource:(id)a3 title:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CUIKUserActivityRemindersListSharedInvitation;
  v8 = [(CUIKUserActivityWithSource *)&v15 initWithSource:a3 type:4];
  v9 = v8;
  if (v8)
  {
    p_title = &v8->_title;
    objc_storeStrong((id *)&v8->_title, a4);
    if (!*p_title)
    {
      v13 = 0;
      goto LABEL_6;
    }
    -[CUIKUserActivity setActivityTitle:](v9, "setActivityTitle:");
    v11 = CUIKBundle();
    v12 = [v11 localizedStringForKey:@"Shared Reminders List Invitation" value:&stru_1F187C430 table:0];
    [(CUIKUserActivity *)v9 setActivitySubtitle:v12];
  }
  v13 = v9;
LABEL_6:

  return v13;
}

- (CUIKUserActivityRemindersListSharedInvitation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CUIKUserActivityRemindersListSharedInvitation;
  v5 = [(CUIKUserActivityWithSource *)&v11 initWithDictionary:v4];
  if (v5
    && (char v10 = 0,
        [(id)objc_opt_class() _stringFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.title" error:&v10], uint64_t v6 = objc_claimAutoreleasedReturnValue(), title = v5->_title, v5->_title = (NSString *)v6, title, v10))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (id)dictionary
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v9.receiver = self;
  v9.super_class = (Class)CUIKUserActivityRemindersListSharedInvitation;
  id v4 = [(CUIKUserActivityWithSource *)&v9 dictionary];
  v5 = (void *)[v3 initWithDictionary:v4];

  title = self->_title;
  char v10 = @"com.apple.calendarUIKit.userActivity.title";
  v11[0] = title;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [v5 addEntriesFromDictionary:v7];

  return v5;
}

- (BOOL)_isMatchForSource:(id)a3 andTitle:(id)a4
{
  id v6 = a4;
  if ([(CUIKUserActivityWithSource *)self isMatchForSource:a3]) {
    char v7 = [v6 isEqualToString:self->_title];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
}

@end