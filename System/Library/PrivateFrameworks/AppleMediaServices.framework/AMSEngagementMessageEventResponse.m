@interface AMSEngagementMessageEventResponse
- (AMSEngagementMessageEventResponse)initWithEnqueueResult:(id)a3;
- (NSArray)messageActions;
- (void)_processActions:(id)a3;
@end

@implementation AMSEngagementMessageEventResponse

- (void).cxx_destruct
{
}

- (AMSEngagementMessageEventResponse)initWithEnqueueResult:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSEngagementMessageEventResponse;
  v5 = [(AMSEngagementMessageEventResponse *)&v10 init];
  if (v5)
  {
    v6 = [v4 data];
    [(AMSEngagementEnqueueResult *)v5 setData:v6];

    v7 = [v4 actions];
    [(AMSEngagementEnqueueResult *)v5 setActions:v7];

    v8 = [v4 actions];
    [(AMSEngagementMessageEventResponse *)v5 _processActions:v8];
  }
  return v5;
}

- (void)_processActions:(id)a3
{
  v15 = self;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v16 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_super v10 = objc_msgSend(v9, "objectForKeyedSubscript:", @"actionClass", v15);
        int v11 = [v10 isEqualToString:@"MessageAction"];

        if (v11)
        {
          v12 = [[AMSEngagementMessageEventServiceResponse alloc] initWithJSObject:v9];
          if (v12) {
            [v16 addObject:v12];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  if ([v16 count])
  {
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithArray:v16];
    messageActions = v15->_messageActions;
    v15->_messageActions = (NSArray *)v13;
  }
}

- (NSArray)messageActions
{
  return self->_messageActions;
}

@end