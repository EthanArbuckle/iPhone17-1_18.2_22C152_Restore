@interface SADomainObjectCommit
- (BOOL)supportsADSADOCommand;
- (id)_ad_replyCommandValue;
- (id)domainFromSADObject;
- (id)expectedResponseClassName;
- (void)_ad_getMessagesRequestValueWithCompletionHandler:(id)a3;
@end

@implementation SADomainObjectCommit

- (id)_ad_replyCommandValue
{
  id v3 = objc_alloc_init((Class)SADomainObjectCommitCompleted);
  v4 = [(SADomainObjectCommit *)self identifier];
  v5 = [v4 identifier];
  [v3 setIdentifier:v5];

  return v3;
}

- (void)_ad_getMessagesRequestValueWithCompletionHandler:(id)a3
{
  v9 = (void (**)(id, id))a3;
  v4 = [(SADomainObjectCommit *)self identifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [(SADomainObjectCommit *)self identifier];
    v7 = objc_msgSend(v6, "af_messageValue");

    if (v7) {
      id v8 = [objc_alloc((Class)STSendDraftMessageRequest) _initWithMessage:v7];
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
    v7 = 0;
  }
  if (v9) {
    v9[2](v9, v8);
  }
}

- (BOOL)supportsADSADOCommand
{
  return 1;
}

- (id)expectedResponseClassName
{
  return SADomainObjectCommitCompletedClassIdentifier;
}

- (id)domainFromSADObject
{
  v2 = [(SADomainObjectCommit *)self identifier];
  id v3 = [v2 groupIdentifier];

  return v3;
}

@end