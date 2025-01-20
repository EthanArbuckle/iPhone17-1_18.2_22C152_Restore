@interface EDAMNotebookRecipientSettings
+ (id)structFields;
+ (id)structName;
- (NSNumber)inMyList;
- (NSNumber)reminderNotifyEmail;
- (NSNumber)reminderNotifyInApp;
- (NSString)stack;
- (void)setInMyList:(id)a3;
- (void)setReminderNotifyEmail:(id)a3;
- (void)setReminderNotifyInApp:(id)a3;
- (void)setStack:(id)a3;
@end

@implementation EDAMNotebookRecipientSettings

+ (id)structFields
{
  v10[4] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_2130;
  if (!structFields_structFields_2130)
  {
    v3 = +[FATField fieldWithIndex:1 type:2 optional:1 name:@"reminderNotifyEmail"];
    v10[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:2 optional:1 name:@"reminderNotifyInApp"];
    v10[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:2 optional:1 name:@"inMyList"];
    v10[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:11 optional:1 name:@"stack"];
    v10[3] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];
    v8 = (void *)structFields_structFields_2130;
    structFields_structFields_2130 = v7;

    v2 = (void *)structFields_structFields_2130;
  }
  return v2;
}

+ (id)structName
{
  return @"NotebookRecipientSettings";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_inMyList, 0);
  objc_storeStrong((id *)&self->_reminderNotifyInApp, 0);
  objc_storeStrong((id *)&self->_reminderNotifyEmail, 0);
}

- (void)setStack:(id)a3
{
}

- (NSString)stack
{
  return self->_stack;
}

- (void)setInMyList:(id)a3
{
}

- (NSNumber)inMyList
{
  return self->_inMyList;
}

- (void)setReminderNotifyInApp:(id)a3
{
}

- (NSNumber)reminderNotifyInApp
{
  return self->_reminderNotifyInApp;
}

- (void)setReminderNotifyEmail:(id)a3
{
}

- (NSNumber)reminderNotifyEmail
{
  return self->_reminderNotifyEmail;
}

@end