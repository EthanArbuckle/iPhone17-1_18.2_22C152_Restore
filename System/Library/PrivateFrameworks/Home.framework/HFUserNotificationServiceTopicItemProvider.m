@interface HFUserNotificationServiceTopicItemProvider
- (HFUserNotificationServiceTopicItemProvider)initWithHome:(id)a3;
- (HMHome)home;
- (NSSet)topicItems;
- (id)filter;
- (id)invalidationReasons;
- (id)items;
- (id)reloadItems;
- (void)setFilter:(id)a3;
- (void)setTopicItems:(id)a3;
@end

@implementation HFUserNotificationServiceTopicItemProvider

- (HFUserNotificationServiceTopicItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFUserNotificationServiceTopicItemProvider;
  v6 = [(HFItemProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_home, a3);
  }

  return v7;
}

- (id)reloadItems
{
  v3 = [(HFUserNotificationServiceTopicItemProvider *)self home];
  v4 = objc_msgSend(v3, "hf_userNotificationServiceTopics");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __57__HFUserNotificationServiceTopicItemProvider_reloadItems__block_invoke_2;
  v11[3] = &unk_26408E920;
  id v12 = &__block_literal_global_20;
  id v5 = [(HFUserNotificationServiceTopicItemProvider *)self filter];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__HFUserNotificationServiceTopicItemProvider_reloadItems__block_invoke_3;
  v10[3] = &unk_26408E948;
  v10[4] = self;
  v6 = [(HFItemProvider *)self reloadItemsWithObjects:v4 keyAdaptor:&__block_literal_global_20 itemAdaptor:v11 filter:v5 itemMap:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__HFUserNotificationServiceTopicItemProvider_reloadItems__block_invoke_4;
  v9[3] = &unk_26408E970;
  v9[4] = self;
  v7 = [v6 addSuccessBlock:v9];

  return v7;
}

uint64_t __57__HFUserNotificationServiceTopicItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

id __57__HFUserNotificationServiceTopicItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [a2 topic];
  v4 = (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  return v4;
}

HFUserNotificationServiceTopicItem *__57__HFUserNotificationServiceTopicItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [HFUserNotificationServiceTopicItem alloc];
  id v5 = [*(id *)(a1 + 32) home];
  v6 = [(HFUserNotificationServiceTopicItem *)v4 initWithHome:v5 topic:v3];

  return v6;
}

void __57__HFUserNotificationServiceTopicItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 allItems];
  [*(id *)(a1 + 32) setTopicItems:v3];
}

- (id)items
{
  uint64_t v2 = [(HFUserNotificationServiceTopicItemProvider *)self topicItems];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263EFFA08] set];
  }
  id v5 = v4;

  return v5;
}

- (id)invalidationReasons
{
  v6.receiver = self;
  v6.super_class = (Class)HFUserNotificationServiceTopicItemProvider;
  uint64_t v2 = [(HFItemProvider *)&v6 invalidationReasons];
  if (_MergedGlobals_2 != -1) {
    dispatch_once(&_MergedGlobals_2, &__block_literal_global_12);
  }
  id v3 = (id)qword_26AB2E9F8;
  id v4 = [v2 setByAddingObjectsFromSet:v3];

  return v4;
}

void __65__HFUserNotificationServiceTopicItemProvider_invalidationReasons__block_invoke_2()
{
  v4[1] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = @"service";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)qword_26AB2E9F8;
  qword_26AB2E9F8 = v2;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (NSSet)topicItems
{
  return self->_topicItems;
}

- (void)setTopicItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end