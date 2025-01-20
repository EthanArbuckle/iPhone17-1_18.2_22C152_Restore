@interface CNXPCDataMapperProgressiveHandler
- (CNXPCDataMapperProgressiveHandler)initWithProgressBlock:(id)a3 completionBlock:(id)a4;
- (void)completedWithError:(id)a3;
- (void)receiveProgressiveContacts:(id)a3 matchInfos:(id)a4;
@end

@implementation CNXPCDataMapperProgressiveHandler

- (CNXPCDataMapperProgressiveHandler)initWithProgressBlock:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNXPCDataMapperProgressiveHandler;
  v8 = [(CNXPCDataMapperProgressiveHandler *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id progressBlock = v8->_progressBlock;
    v8->_id progressBlock = (id)v9;

    uint64_t v11 = [v7 copy];
    id completionBlock = v8->_completionBlock;
    v8->_id completionBlock = (id)v11;

    v13 = v8;
  }

  return v8;
}

- (void)completedWithError:(id)a3
{
}

- (void)receiveProgressiveContacts:(id)a3 matchInfos:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong(&self->_progressBlock, 0);
}

@end