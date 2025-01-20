@interface AVTAvatarRecordCacheableResourceChangeToken
- (AVTAvatarRecordCacheableResourceChangeToken)initWithEnvironment:(id)a3 recordIdentifier:(id)a4 changeHandler:(id)a5;
- (NSNotificationCenter)notificationCenter;
- (NSString)recordID;
- (id)changeHandler;
- (void)handleNotification:(id)a3;
- (void)startObservingChanges;
- (void)stopObservingChanges;
@end

@implementation AVTAvatarRecordCacheableResourceChangeToken

- (AVTAvatarRecordCacheableResourceChangeToken)initWithEnvironment:(id)a3 recordIdentifier:(id)a4 changeHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AVTAvatarRecordCacheableResourceChangeToken;
  v11 = [(AVTAvatarRecordCacheableResourceChangeToken *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    recordID = v11->_recordID;
    v11->_recordID = (NSString *)v12;

    uint64_t v14 = [v10 copy];
    id changeHandler = v11->_changeHandler;
    v11->_id changeHandler = (id)v14;

    uint64_t v16 = [v8 notificationCenter];
    notificationCenter = v11->_notificationCenter;
    v11->_notificationCenter = (NSNotificationCenter *)v16;
  }
  return v11;
}

- (void)handleNotification:(id)a3
{
  id v10 = a3;
  uint64_t v4 = objc_msgSend(v10, "_avtui_changedRecordIdentifiers");
  if (!v4) {
    goto LABEL_3;
  }
  v5 = (void *)v4;
  v6 = objc_msgSend(v10, "_avtui_changedRecordIdentifiers");
  v7 = [(AVTAvatarRecordCacheableResourceChangeToken *)self recordID];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
LABEL_3:
    id v9 = [(AVTAvatarRecordCacheableResourceChangeToken *)self changeHandler];
    v9[2]();
  }
}

- (void)startObservingChanges
{
  id v3 = [(AVTAvatarRecordCacheableResourceChangeToken *)self notificationCenter];
  [v3 addObserver:self selector:sel_handleNotification_ name:*MEMORY[0x263F29710] object:0];
}

- (void)stopObservingChanges
{
  id v3 = [(AVTAvatarRecordCacheableResourceChangeToken *)self notificationCenter];
  [v3 removeObserver:self];
}

- (NSString)recordID
{
  return self->_recordID;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end