@interface CSFFeatureManager
+ (BOOL)isCloudSubscriber;
+ (BOOL)shouldShowRSVPDataDetectors;
+ (id)addFeatureChangeObserverWithChange:(id)a3;
+ (id)addTicketChangeObserverWithFeatureName:(id)a3 change:(id)a4;
+ (id)cachedFeatureObjectWithId:(id)a3;
+ (id)registerForFeatureChangeNotificationsUsingBlock:(id)a3;
+ (id)urlForRSVPDataDetectorsWithContext:(id)a3;
+ (uint64_t)removeFeatureChangeObserverWithToken:(void *)a3;
+ (unint64_t)_statusFromSwiftTicketStatus:(id)a3;
+ (void)clearCFUWithCompletionHandler:(id)a3;
+ (void)clearCacheAndNotify;
+ (void)clearFeatureCacheAndNotify;
+ (void)clearTicketCacheAndNotify;
+ (void)deviceHasAnyTicketWithCompletionHandler:(id)a3;
+ (void)forcePostCFUWithCompletionHandler:(id)a3;
+ (void)getFeatureEligibilityForFeatureWithId:(id)a3 bundleId:(id)a4 completion:(id)a5;
+ (void)getTicketForFeature:(NSString *)a3 completionHandler:(id)a4;
+ (void)getTicketForFeature:(id)a3 withCompletionHandler:(id)a4;
+ (void)getTicketStatusForFeature:(NSString *)a3 completionHandler:(id)a4;
+ (void)getTicketStatusForFeature:(id)a3 withCompletionHandler:(id)a4;
+ (void)getTicketStatusFromCacheForFeature:(NSString *)a3 completionHandler:(id)a4;
+ (void)gmOptInToggleWithCompletionHandler:(id)a3;
+ (void)postCFUIfEligible;
+ (void)postCFUIfEligibleWithCompletionHandler:(id)a3;
+ (void)processPushNotificationDictionary:(id)a3;
+ (void)processPushNotificationWithDictionary:(id)a3;
+ (void)refreshGeoclassificationCache;
+ (void)requestFeatureWithId:(id)a3 completion:(id)a4;
+ (void)requestGeoClassificationForFeatureID:(id)a3 bundleID:(id)a4 altDSID:(id)a5 ignoreCache:(BOOL)a6 completion:(id)a7;
+ (void)requestGeoClassificationForFeatureID:(id)a3 bundleID:(id)a4 ignoreCache:(BOOL)a5 completion:(id)a6;
+ (void)revalidateCFU;
+ (void)revalidateCFUWithCompletionHandler:(id)a3;
+ (void)unregisterForFeatureChangeNotificationsUsingObserver:(id)a3;
@end

@implementation CSFFeatureManager

+ (id)addFeatureChangeObserverWithChange:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  if (qword_1EB5EA8E0 != -1) {
    swift_once();
  }
  id v5 = NotificationObservation.addObserver(change:)((uint64_t)sub_1A8D1DFA8, v4);
  swift_release();
  return v5;
}

+ (void)requestFeatureWithId:(id)a3 completion:(id)a4
{
  uint64_t v4 = _Block_copy(a4);
  uint64_t v5 = sub_1A8D59BF0();
  unint64_t v7 = v6;
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v4);
  sub_1A8C88E70(v5, v7, ObjCClassMetadata, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
  swift_bridgeObjectRelease();
}

+ (void)getFeatureEligibilityForFeatureWithId:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  uint64_t v5 = _Block_copy(a5);
  uint64_t v6 = sub_1A8D59BF0();
  unint64_t v8 = v7;
  uint64_t v9 = sub_1A8D59BF0();
  unint64_t v11 = v10;
  _Block_copy(v5);
  sub_1A8C85930(v6, v8, v9, v11, v5);
  _Block_release(v5);
  _Block_release(v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (id)registerForFeatureChangeNotificationsUsingBlock:(id)a3
{
  return +[CSFFeatureManager addFeatureChangeObserverWithChange:a3];
}

+ (void)unregisterForFeatureChangeNotificationsUsingObserver:(id)a3
{
}

+ (void)processPushNotificationDictionary:(id)a3
{
}

+ (void)clearCacheAndNotify
{
}

+ (void)refreshGeoclassificationCache
{
}

+ (void)getTicketForFeature:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__CSFFeatureManager_getTicketForFeature_withCompletionHandler___block_invoke;
  v8[3] = &unk_1E5D5E7A0;
  id v9 = v6;
  id v10 = a1;
  id v7 = v6;
  [a1 getTicketForFeature:a3 completionHandler:v8];
}

void __63__CSFFeatureManager_getTicketForFeature_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (v13)
    {
      id v7 = *(void **)(a1 + 40);
      unint64_t v8 = [v13 status];
      uint64_t v9 = [v7 _statusFromSwiftTicketStatus:v8];

      id v10 = [CSFTicketObject alloc];
      unint64_t v11 = [v13 ticket];
      v12 = [(CSFTicketObject *)v10 initWithTicket:v11 withStatus:v9];

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

+ (void)getTicketStatusForFeature:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__CSFFeatureManager_getTicketStatusForFeature_withCompletionHandler___block_invoke;
  v8[3] = &unk_1E5D5E7C8;
  id v9 = v6;
  id v10 = a1;
  id v7 = v6;
  [a1 getTicketStatusForFeature:a3 completionHandler:v8];
}

void __69__CSFFeatureManager_getTicketStatusForFeature_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (v7) {
      (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [*(id *)(a1 + 40) _statusFromSwiftTicketStatus:v7], 0);
    }
    id v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

+ (unint64_t)_statusFromSwiftTicketStatus:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rawValue];
  id v5 = +[TicketStatus notYetQueued];
  id v6 = [v5 rawValue];
  char v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    unint64_t v8 = 0;
  }
  else
  {
    id v9 = [v3 rawValue];
    id v10 = +[TicketStatus enqueued];
    unint64_t v11 = [v10 rawValue];
    char v12 = [v9 isEqualToString:v11];

    if (v12)
    {
      unint64_t v8 = 1;
    }
    else
    {
      id v13 = [v3 rawValue];
      v14 = +[TicketStatus active];
      v15 = [v14 rawValue];
      int v16 = [v13 isEqualToString:v15];

      if (v16) {
        unint64_t v8 = 2;
      }
      else {
        unint64_t v8 = 3;
      }
    }
  }

  return v8;
}

+ (void)postCFUIfEligible
{
}

void __38__CSFFeatureManager_postCFUIfEligible__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _CSFGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1A8C7F000, v3, OS_LOG_TYPE_DEFAULT, "Finished attempting to post CFU with error: %@", (uint8_t *)&v4, 0xCu);
  }
}

+ (void)revalidateCFU
{
}

void __34__CSFFeatureManager_revalidateCFU__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _CSFGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1A8C7F000, v3, OS_LOG_TYPE_DEFAULT, "Finished revalidating CFU with error: %@", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)cachedFeatureObjectWithId:(id)a3
{
  uint64_t v3 = sub_1A8D59BF0();
  id v5 = sub_1A8D18DB0(v3, v4);
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = CloudFeature.cloudFeatureObject.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    id v7 = 0;
  }
  return v7;
}

+ (void)requestGeoClassificationForFeatureID:(id)a3 bundleID:(id)a4 altDSID:(id)a5 ignoreCache:(BOOL)a6 completion:(id)a7
{
  unint64_t v8 = _Block_copy(a7);
  uint64_t v9 = sub_1A8D59BF0();
  unint64_t v11 = v10;
  uint64_t v12 = sub_1A8D59BF0();
  unint64_t v14 = v13;
  uint64_t v15 = sub_1A8D59BF0();
  uint64_t v17 = v16;
  _Block_copy(v8);
  sub_1A8D19C28(v9, v11, v12, v14, v15, v17, a6, v8);
  _Block_release(v8);
  _Block_release(v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)requestGeoClassificationForFeatureID:(id)a3 bundleID:(id)a4 ignoreCache:(BOOL)a5 completion:(id)a6
{
  id v7 = _Block_copy(a6);
  uint64_t v8 = sub_1A8D59BF0();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1A8D59BF0();
  uint64_t v13 = v12;
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  _Block_copy(v7);
  sub_1A8D19ED4(v8, v10, v11, v13, a5, ObjCClassMetadata, (void (**)(void, void, void, void))v7);
  _Block_release(v7);
  _Block_release(v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (id)addTicketChangeObserverWithFeatureName:(id)a3 change:(id)a4
{
  unint64_t v4 = _Block_copy(a4);
  uint64_t v5 = sub_1A8D59BF0();
  uint64_t v7 = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v4;
  if (qword_1EB5EA8E0 != -1) {
    swift_once();
  }
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = ObjCClassMetadata;
  v10[3] = v5;
  v10[4] = v7;
  v10[5] = sub_1A8CCF00C;
  v10[6] = v8;
  swift_bridgeObjectRetain();
  swift_retain();
  id v11 = NotificationObservation.addTicketObserver(change:)((uint64_t)sub_1A8D1A234, (uint64_t)v10);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v11;
}

+ (uint64_t)removeFeatureChangeObserverWithToken:(void *)a3
{
  uint64_t v4 = qword_1EB5EA8E0;
  swift_unknownObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  _s25CloudSubscriptionFeatures23NotificationObservationC14removeObserver5tokenySo8NSObject_p_tF_0(a3);
  return swift_unknownObjectRelease();
}

+ (void)processPushNotificationWithDictionary:(id)a3
{
  if (a3) {
    sub_1A8D59B30();
  }
  objc_msgSend(a1, sel_clearFeatureCacheAndNotify);
  swift_bridgeObjectRelease();
}

+ (void)clearFeatureCacheAndNotify
{
}

+ (void)clearTicketCacheAndNotify
{
}

+ (BOOL)isCloudSubscriber
{
  return _sSo17CSFFeatureManagerC25CloudSubscriptionFeaturesE02isC10SubscriberSbyFZ_0();
}

+ (id)urlForRSVPDataDetectorsWithContext:(id)a3
{
  uint64_t v3 = sub_1A8D595A0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1A8D59B30();
  _sSo17CSFFeatureManagerC25CloudSubscriptionFeaturesE23urlForRSVPDataDetectors7context10Foundation3URLVSDySSypG_tFZ_0(v8, (unint64_t)v7);
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_1A8D59570();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return v9;
}

+ (BOOL)shouldShowRSVPDataDetectors
{
  return _sSo17CSFFeatureManagerC25CloudSubscriptionFeaturesE27shouldShowRSVPDataDetectorsSbyFZ_0() & 1;
}

+ (void)getTicketStatusForFeature:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v7 - 8, v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = a1;
  uint64_t v13 = sub_1A8D59E10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  unint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E979F570;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E979F578;
  v15[5] = v14;
  uint64_t v16 = a3;
  sub_1A8D18C04((uint64_t)v10, (uint64_t)&unk_1E979F580, (uint64_t)v15);
  swift_release();
}

+ (void)getTicketStatusFromCacheForFeature:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v7 - 8, v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = a1;
  uint64_t v13 = sub_1A8D59E10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  unint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E979F550;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E979F558;
  v15[5] = v14;
  uint64_t v16 = a3;
  sub_1A8D18C04((uint64_t)v10, (uint64_t)&unk_1E979F560, (uint64_t)v15);
  swift_release();
}

+ (void)getTicketForFeature:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v7 - 8, v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = a1;
  uint64_t v13 = sub_1A8D59E10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  unint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E979F530;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E979F538;
  v15[5] = v14;
  uint64_t v16 = a3;
  sub_1A8D18C04((uint64_t)v10, (uint64_t)&unk_1E979F540, (uint64_t)v15);
  swift_release();
}

+ (void)deviceHasAnyTicketWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = a1;
  uint64_t v11 = sub_1A8D59E10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E979F510;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E979F518;
  v13[5] = v12;
  sub_1A8D18C04((uint64_t)v8, (uint64_t)&unk_1E979F520, (uint64_t)v13);
  swift_release();
}

+ (void)clearCFUWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = a1;
  uint64_t v11 = sub_1A8D59E10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E979F4F0;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E979F4F8;
  v13[5] = v12;
  sub_1A8D18C04((uint64_t)v8, (uint64_t)&unk_1E979F500, (uint64_t)v13);
  swift_release();
}

+ (void)postCFUIfEligibleWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = a1;
  uint64_t v11 = sub_1A8D59E10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E979F4D0;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E979F4D8;
  v13[5] = v12;
  sub_1A8D18C04((uint64_t)v8, (uint64_t)&unk_1E979F4E0, (uint64_t)v13);
  swift_release();
}

+ (void)revalidateCFUWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = a1;
  uint64_t v11 = sub_1A8D59E10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E979F4B0;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E979F4B8;
  v13[5] = v12;
  sub_1A8D18C04((uint64_t)v8, (uint64_t)&unk_1E979F4C0, (uint64_t)v13);
  swift_release();
}

+ (void)gmOptInToggleWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = a1;
  uint64_t v11 = sub_1A8D59E10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E979F490;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E979F498;
  v13[5] = v12;
  sub_1A8D18C04((uint64_t)v8, (uint64_t)&unk_1E979F4A0, (uint64_t)v13);
  swift_release();
}

+ (void)forcePostCFUWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB5EAEA0);
  MEMORY[0x1F4188790](v5 - 8, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = a1;
  uint64_t v11 = sub_1A8D59E10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E979F460;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E979ED78;
  v13[5] = v12;
  sub_1A8D18C04((uint64_t)v8, (uint64_t)&unk_1E979ED80, (uint64_t)v13);
  swift_release();
}

@end