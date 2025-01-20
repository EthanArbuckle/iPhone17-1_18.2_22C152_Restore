@interface MSReadLaterTriageAction
- (MSReadLaterTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 readLaterDate:(id)a7;
- (NSDate)readLaterDate;
- (id)_changeAction;
- (void)setReadLaterDate:(id)a3;
@end

@implementation MSReadLaterTriageAction

- (MSReadLaterTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 readLaterDate:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)MSReadLaterTriageAction;
  v14 = [(MSTriageAction *)&v17 initWithMessageListSelection:a3 origin:a4 actor:a5 delegate:a6];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_readLaterDate, a7);
  }

  return v15;
}

- (id)_changeAction
{
  id v3 = objc_alloc(MEMORY[0x1E4F603A8]);
  v4 = [(MSTriageAction *)self messageListItemSelection];
  v5 = [v4 messageListItems];
  int64_t v6 = [(MSTriageAction *)self origin];
  int64_t v7 = [(MSTriageAction *)self actor];
  v8 = [(MSReadLaterTriageAction *)self readLaterDate];
  v9 = (void *)[v3 initWithMessageListItems:v5 origin:v6 actor:v7 readLaterDate:v8];

  return v9;
}

- (NSDate)readLaterDate
{
  return self->_readLaterDate;
}

- (void)setReadLaterDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end