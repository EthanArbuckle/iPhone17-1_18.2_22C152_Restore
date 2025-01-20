@interface HMDDatabaseCKOperationCompletionEvent
- (HMDDatabaseCKOperationCompletionEvent)initWithContainerIdentifier:(id)a3;
- (NSString)containerIdentifier;
@end

@implementation HMDDatabaseCKOperationCompletionEvent

- (void).cxx_destruct
{
}

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (HMDDatabaseCKOperationCompletionEvent)initWithContainerIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDDatabaseCKOperationCompletionEvent;
  v6 = [(HMMLogEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_containerIdentifier, a3);
  }

  return v7;
}

@end