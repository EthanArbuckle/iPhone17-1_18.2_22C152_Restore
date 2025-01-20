@interface HealthDigitalSeparationSource
- (HKSummarySharingEntryStore)sharingEntryStore;
- (HealthDigitalSeparationSource)init;
- (NSString)name;
- (id)_outgoingSharingEntriesFromEntries:(id)a3;
- (void)_stopSharingToEntries:(id)a3 completion:(id)a4;
- (void)fetchSharedResourcesWithCompletion:(id)a3;
- (void)setSharingEntryStore:(id)a3;
- (void)stopAllSharingWithCompletion:(id)a3;
- (void)stopSharing:(id)a3 withCompletion:(id)a4;
- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4;
@end

@implementation HealthDigitalSeparationSource

- (HealthDigitalSeparationSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)HealthDigitalSeparationSource;
  v2 = [(HealthDigitalSeparationSource *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)HKHealthStore);
    v4 = (HKSummarySharingEntryStore *)[objc_alloc((Class)HKSummarySharingEntryStore) initWithHealthStore:v3];
    sharingEntryStore = v2->_sharingEntryStore;
    v2->_sharingEntryStore = v4;
  }
  return v2;
}

- (NSString)name
{
  return (NSString *)DSSourceNameHealthSharing;
}

- (void)fetchSharedResourcesWithCompletion:(id)a3
{
  id v4 = a3;
  sharingEntryStore = self->_sharingEntryStore;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_20D8;
  v7[3] = &unk_41A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HKSummarySharingEntryStore *)sharingEntryStore fetchSharingEntriesWithCompletion:v7];
}

- (void)stopSharing:(id)a3 withCompletion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void *))a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = [v9 digitalEntries];
    id v8 = objc_msgSend(v7, "hk_map:", &stru_41E0);

    [(HealthDigitalSeparationSource *)self _stopSharingToEntries:v8 completion:v6];
  }
  else
  {
    id v8 = +[NSError hk_error:2000 format:@"Unable to cast SharedResource."];
    v6[2](v6, v8);
  }
}

- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v6 sharingEntry];
    v11 = v8;
    id v9 = +[NSArray arrayWithObjects:&v11 count:1];
    [(HealthDigitalSeparationSource *)self _stopSharingToEntries:v9 completion:v7];
  }
  else
  {
    v10 = +[NSError hk_error:2000 format:@"Unable to cast DSParticipation."];
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }
}

- (void)stopAllSharingWithCompletion:(id)a3
{
  sharingEntryStore = self->_sharingEntryStore;
  id v5 = a3;
  id v6 = [(HKSummarySharingEntryStore *)sharingEntryStore sharingEntries];
  id v7 = [(HealthDigitalSeparationSource *)self _outgoingSharingEntriesFromEntries:v6];

  [(HealthDigitalSeparationSource *)self _stopSharingToEntries:v7 completion:v5];
}

- (void)_stopSharingToEntries:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v16 = a4;
  id v7 = dispatch_group_create();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_2844;
  v28[4] = sub_2854;
  id v29 = 0;
  dispatch_group_enter(v7);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v10);
        dispatch_group_enter(v7);
        sharingEntryStore = self->_sharingEntryStore;
        v13 = [v11 UUID];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_285C;
        v21[3] = &unk_4208;
        v23 = v28;
        v22 = v7;
        [(HKSummarySharingEntryStore *)sharingEntryStore revokeInvitationWithUUID:v13 completion:v21];

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v8);
  }

  dispatch_group_leave(v7);
  v14 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_28D4;
  block[3] = &unk_4230;
  id v19 = v16;
  v20 = v28;
  id v15 = v16;
  dispatch_group_notify(v7, v14, block);

  _Block_object_dispose(v28, 8);
}

- (id)_outgoingSharingEntriesFromEntries:(id)a3
{
  return objc_msgSend(a3, "hk_map:", &stru_4250);
}

- (HKSummarySharingEntryStore)sharingEntryStore
{
  return self->_sharingEntryStore;
}

- (void)setSharingEntryStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end