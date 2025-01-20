@interface EKReminderFetchRequestToken
- (EKReminderFetchRequestToken)initWithReminderStore:(id)a3;
- (EKReminderStore)reminderStore;
- (void)cancel;
@end

@implementation EKReminderFetchRequestToken

- (EKReminderFetchRequestToken)initWithReminderStore:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EKReminderFetchRequestToken;
  v5 = [(EKReminderFetchRequestToken *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_reminderStore, v4);
  }

  return v6;
}

- (void)cancel
{
  id v4 = [(EKReminderFetchRequestToken *)self reminderStore];
  id v3 = (id)[v4 completionBlockForFetchRequestToken:self remove:1];
}

- (EKReminderStore)reminderStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reminderStore);

  return (EKReminderStore *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end