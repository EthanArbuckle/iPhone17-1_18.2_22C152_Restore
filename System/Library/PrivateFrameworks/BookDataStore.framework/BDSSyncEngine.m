@interface BDSSyncEngine
+ (_TtC13BookDataStore13BDSSyncEngine)shared;
- (BOOL)establishedSalt;
- (_TtC13BookDataStore13BDSSyncEngine)init;
- (id)diagnosticSyncEngineInfo;
- (id)enabledCloudKitZones;
- (id)recordNameFromRecordType:(id)a3 identifier:(id)a4;
- (void)addSaltChangeObserver:(id)a3;
- (void)reestablishSalt;
- (void)reestablishSaltIfNeeded;
- (void)resetChangeToken:(id)a3;
- (void)resetCloudKitZone:(id)a3;
- (void)saltManager:(id)a3 updatedSaltWithVersion:(id)a4;
- (void)setCloudKitZone:(id)a3 enabled:(BOOL)a4;
- (void)setDatabase:(id)a3 config:(id)a4;
@end

@implementation BDSSyncEngine

+ (_TtC13BookDataStore13BDSSyncEngine)shared
{
  if (qword_26AD748D8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26AD748D0;
  return (_TtC13BookDataStore13BDSSyncEngine *)v2;
}

- (void)setDatabase:(id)a3 config:(id)a4
{
  id _ = a3;
  v6 = (BCCloudKitConfiguration *)a4;
  v7 = self;
  BDSSyncEngine.setDatabase(_:config:)((CKDatabase)_, v6);
}

- (void)addSaltChangeObserver:(id)a3
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  v5 = self;
  sub_2361B0894((uint64_t)a3, (uint64_t)v5);

  swift_unknownObjectRelease();
}

- (void)reestablishSalt
{
  v2 = self;
  BDSSyncEngine.reestablishSalt()();
}

- (void)reestablishSaltIfNeeded
{
  v2 = self;
  BDSSyncEngine.reestablishSaltIfNeeded()();
}

- (void)setCloudKitZone:(id)a3 enabled:(BOOL)a4
{
  id _ = a3;
  v6 = self;
  BDSSyncEngine.setCloudKitZone(_:enabled:)((CKRecordZoneID)_, a4);
}

- (id)enabledCloudKitZones
{
  uint64_t v3 = OBJC_IVAR____TtC13BookDataStore13BDSSyncEngine_zoneLock;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13BookDataStore13BDSSyncEngine_zoneLock);
  v5 = self;
  objc_msgSend(v4, sel_lock);
  swift_beginAccess();
  v6 = *(Class *)((char *)&self->super.isa + v3);
  swift_bridgeObjectRetain();
  objc_msgSend(v6, sel_unlock);

  sub_23612EDA4(0, (unint64_t *)&unk_268854910);
  sub_2361B7818();
  v7 = (void *)sub_2361FEB18();
  swift_bridgeObjectRelease();
  return v7;
}

- (void)resetCloudKitZone:(id)a3
{
  id v5 = a3;
  v4 = self;
  BDSSyncEngine.resetCloudKitZone(_:)((CKRecordZone)v5);
}

- (void)resetChangeToken:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_2361A7D98(v4);
}

- (void)saltManager:(id)a3 updatedSaltWithVersion:(id)a4
{
  uint64_t v6 = sub_2361FE8D8();
  unint64_t v8 = v7;
  id v10 = a3;
  v9 = self;
  sub_2361B81F4(v6, v8);
  swift_bridgeObjectRelease();
}

- (BOOL)establishedSalt
{
  v2 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC13BookDataStore13BDSSyncEngine_saltManager);
  swift_beginAccess();
  uint64_t v3 = *v2;
  if (*v2) {
    LOBYTE(v3) = objc_msgSend(v3, sel_establishedSalt);
  }
  return (char)v3;
}

- (id)recordNameFromRecordType:(id)a3 identifier:(id)a4
{
  uint64_t v5 = sub_2361FE8D8();
  unint64_t v7 = v6;
  uint64_t v8 = sub_2361FE8D8();
  id v10 = v9;
  v11 = self;
  v12._countAndFlagsBits = v5;
  v12._object = v7;
  v13._countAndFlagsBits = v8;
  v13._object = v10;
  object = BDSSyncEngine.recordName(fromRecordType:identifier:)(v12, v13).value._object;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (object)
  {
    v15 = (void *)sub_2361FE8C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (_TtC13BookDataStore13BDSSyncEngine)init
{
  return (_TtC13BookDataStore13BDSSyncEngine *)BDSSyncEngine.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13BookDataStore13BDSSyncEngine_persistFetchCoordinatorGroup));
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC13BookDataStore13BDSSyncEngine_logger;
  uint64_t v4 = sub_2361FDB58();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)diagnosticSyncEngineInfo
{
  uint64_t v3 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC13BookDataStore13BDSSyncEngine_saltManager);
  swift_beginAccess();
  id v4 = *v3;
  uint64_t v5 = self;
  if (v4) {
    id v4 = objc_msgSend(v4, sel_establishedSalt);
  }
  id v6 = objc_msgSend(objc_allocWithZone((Class)BDSCloudSyncDiagnosticSyncEngineInfo), sel_initWithEstablishedSalt_, v4);

  return v6;
}

@end