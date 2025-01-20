@interface EDAMSharedNotebookRecipientSettings
+ (id)structFields;
+ (id)structName;
- (NSNumber)reminderNotifyEmail;
- (NSNumber)reminderNotifyInApp;
- (void)setReminderNotifyEmail:(id)a3;
- (void)setReminderNotifyInApp:(id)a3;
@end

@implementation EDAMSharedNotebookRecipientSettings

+ (id)structFields
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_2105;
  if (!structFields_structFields_2105)
  {
    v3 = +[FATField fieldWithIndex:1 type:2 optional:1 name:@"reminderNotifyEmail"];
    v8[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:2 optional:1 name:@"reminderNotifyInApp"];
    v8[1] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
    v6 = (void *)structFields_structFields_2105;
    structFields_structFields_2105 = v5;

    v2 = (void *)structFields_structFields_2105;
  }
  return v2;
}

+ (id)structName
{
  return @"SharedNotebookRecipientSettings";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminderNotifyInApp, 0);
  objc_storeStrong((id *)&self->_reminderNotifyEmail, 0);
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