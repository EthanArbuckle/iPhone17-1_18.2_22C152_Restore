@interface GDInternalViewUpdateNotificationSubscription
- (BMBiomeScheduler)scheduler;
- (BPSSink)sink;
- (OS_dispatch_queue)targetQueue;
- (id)initForViewName:(id)a3 systemwideUniqueSubscriptionIdentifier:(id)a4 useCase:(id)a5 targetQueue:(id)a6 onReceiveUpdateNotificationBlock:(id)a7;
- (void)cancelSubscription;
@end

@implementation GDInternalViewUpdateNotificationSubscription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);

  objc_storeStrong((id *)&self->_targetQueue, 0);
}

- (BPSSink)sink
{
  return self->_sink;
}

- (BMBiomeScheduler)scheduler
{
  return self->_scheduler;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (void)cancelSubscription
{
  objc_msgSend_sink(self, a2, v2, v3, v4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancel(v9, v5, v6, v7, v8);
}

- (id)initForViewName:(id)a3 systemwideUniqueSubscriptionIdentifier:(id)a4 useCase:(id)a5 targetQueue:(id)a6 onReceiveUpdateNotificationBlock:(id)a7
{
  id v57 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v60.receiver = self;
  v60.super_class = (Class)GDInternalViewUpdateNotificationSubscription;
  v16 = [(GDInternalViewUpdateNotificationSubscription *)&v60 init];
  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F502E8]);
    v20 = (BMBiomeScheduler *)objc_msgSend_initWithIdentifier_targetQueue_(v17, v18, (uint64_t)v12, (uint64_t)v14, v19);
    v21 = BiomeLibrary();
    objc_msgSend_IntelligencePlatform(v21, v22, v23, v24, v25);
    v26 = id v56 = v12;
    objc_msgSend_Views(v26, v27, v28, v29, v30);
    v31 = id v55 = v14;
    v36 = objc_msgSend_Updated(v31, v32, v33, v34, v35);

    v40 = objc_msgSend_DSLPublisherWithUseCase_(v36, v37, (uint64_t)v13, v38, v39);
    v43 = objc_msgSend_filterWithKeyPath_value_(v40, v41, @"eventBody.viewName", (uint64_t)v57, v42);
    v47 = objc_msgSend_subscribeOn_(v43, v44, (uint64_t)v20, v45, v46);
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = sub_1B2E52CB0;
    v58[3] = &unk_1E60137C0;
    id v59 = v15;
    uint64_t v50 = objc_msgSend_sinkWithCompletion_receiveInput_(v47, v48, (uint64_t)&unk_1F0AC22C8, (uint64_t)v58, v49);

    objc_storeStrong((id *)&v16->_targetQueue, a6);
    scheduler = v16->_scheduler;
    v16->_scheduler = v20;
    v52 = v20;

    id v14 = v55;
    sink = v16->_sink;
    v16->_sink = (BPSSink *)v50;

    id v12 = v56;
  }

  return v16;
}

@end