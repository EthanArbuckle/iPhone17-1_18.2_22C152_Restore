@interface HFHomePodAlarmItemManager
- (HFHomePodAlarmItemManager)initWithDelegate:(id)a3 mediaProfileContainer:(id)a4;
- (HFHomePodAlarmItemModule)alarmItemModule;
- (HFMediaProfileContainer)mediaProfileContainer;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (void)_registerForExternalUpdates;
- (void)_unregisterForExternalUpdates;
@end

@implementation HFHomePodAlarmItemManager

- (HFHomePodAlarmItemManager)initWithDelegate:(id)a3 mediaProfileContainer:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HFHomePodAlarmItemManager;
  v8 = [(HFItemManager *)&v13 initWithDelegate:a3 sourceItem:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mediaProfileContainer, a4);
    v10 = [[HFHomePodAlarmItemModule alloc] initWithItemUpdater:v9 mediaProfileContainer:v7];
    alarmItemModule = v9->_alarmItemModule;
    v9->_alarmItemModule = v10;
  }
  return v9;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v3 = [(HFHomePodAlarmItemManager *)self alarmItemModule];
  v4 = [v3 itemProviders];
  v5 = [v4 allObjects];

  return v5;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [(HFHomePodAlarmItemManager *)self alarmItemModule];
    v6 = [v5 buildSectionsWithDisplayedItems:v4];
  }
  else
  {
    v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

- (void)_registerForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HFHomePodAlarmItemManager;
  [(HFItemManager *)&v4 _registerForExternalUpdates];
  v3 = [(HFHomePodAlarmItemManager *)self alarmItemModule];
  [v3 registerForExternalUpdates];
}

- (void)_unregisterForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HFHomePodAlarmItemManager;
  [(HFItemManager *)&v4 _unregisterForExternalUpdates];
  v3 = [(HFHomePodAlarmItemManager *)self alarmItemModule];
  [v3 unregisterForExternalUpdates];
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (HFHomePodAlarmItemModule)alarmItemModule
{
  return self->_alarmItemModule;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmItemModule, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end