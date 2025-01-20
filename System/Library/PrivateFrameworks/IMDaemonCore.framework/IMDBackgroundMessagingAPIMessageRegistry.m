@interface IMDBackgroundMessagingAPIMessageRegistry
+ (id)keyFromBundleID:(id)a3 recipientHandle:(id)a4;
+ (id)sharedRegistry;
- (IMDBackgroundMessagingAPIMessageRegistry)init;
- (id)dateLastMessageSentFromAppWithBundleID:(id)a3 recipientHandle:(id)a4;
- (void)recordMessageSentFromAppWithBundleID:(id)a3 toRecipientHandle:(id)a4;
@end

@implementation IMDBackgroundMessagingAPIMessageRegistry

+ (id)sharedRegistry
{
  if (qword_1EA8CA468 != -1) {
    dispatch_once(&qword_1EA8CA468, &unk_1F3390D80);
  }
  v2 = (void *)qword_1EA8CA470;

  return v2;
}

- (IMDBackgroundMessagingAPIMessageRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMDBackgroundMessagingAPIMessageRegistry;
  v2 = [(IMDBackgroundMessagingAPIMessageRegistry *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    registry = v2->_registry;
    v2->_registry = v3;
  }
  return v2;
}

- (void)recordMessageSentFromAppWithBundleID:(id)a3 toRecipientHandle:(id)a4
{
  id v7 = +[IMDBackgroundMessagingAPIMessageRegistry keyFromBundleID:a3 recipientHandle:a4];
  registry = self->_registry;
  objc_super v6 = [MEMORY[0x1E4F1C9C8] now];
  [(NSMutableDictionary *)registry setObject:v6 forKey:v7];
}

- (id)dateLastMessageSentFromAppWithBundleID:(id)a3 recipientHandle:(id)a4
{
  v5 = +[IMDBackgroundMessagingAPIMessageRegistry keyFromBundleID:a3 recipientHandle:a4];
  objc_super v6 = [(NSMutableDictionary *)self->_registry objectForKey:v5];

  return v6;
}

+ (id)keyFromBundleID:(id)a3 recipientHandle:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@_%@", a3, a4];
}

- (void).cxx_destruct
{
}

@end