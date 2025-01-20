@interface MPTipsRecentsEventSignals
- (MPTipsRecentsEventSignals)init;
- (void)donateTipsEventSignalsForRecentCall:(CHRecentCall *)a3 completion:(id)a4;
@end

@implementation MPTipsRecentsEventSignals

- (MPTipsRecentsEventSignals)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for Defaults();
  uint64_t v3 = swift_allocObject();
  v4 = (char *)objc_allocWithZone(ObjectType);
  *(void *)&v4[OBJC_IVAR___MPTipsRecentsEventSignals_defaults] = v3;
  v7.receiver = v4;
  v7.super_class = ObjectType;
  v5 = [(MPTipsRecentsEventSignals *)&v7 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void)donateTipsEventSignalsForRecentCall:(CHRecentCall *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in TipsRecentsEventSignals.donateTipsEventSignals(for:);
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &_sIeghH_IeAgH_TRTATu;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v14);
  swift_release();
}

- (void).cxx_destruct
{
}

@end