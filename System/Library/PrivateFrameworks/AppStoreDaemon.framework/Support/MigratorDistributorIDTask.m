@interface MigratorDistributorIDTask
- (NSString)migratorType;
- (_TtC9appstored25MigratorDistributorIDTask)init;
- (_TtC9appstored25MigratorDistributorIDTask)initWithConfiguration:(id)a3;
- (_TtC9appstored25MigratorDistributorIDTask)initWithoutKeepAlive;
- (id)copyConfiguration;
- (void)main;
@end

@implementation MigratorDistributorIDTask

- (id)copyConfiguration
{
  v2 = objc_allocWithZone((Class)MigratorConfiguration);
  return sub_1002ECEFC(v2, @"DistributorID");
}

- (NSString)migratorType
{
  return (NSString *)@"DistributorID";
}

- (_TtC9appstored25MigratorDistributorIDTask)initWithConfiguration:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(MigratorTask *)&v5 initWithConfiguration:a3];
}

- (_TtC9appstored25MigratorDistributorIDTask)init
{
  return (_TtC9appstored25MigratorDistributorIDTask *)sub_10008FBA0(self, (uint64_t)a2, (SEL *)&selRef_init);
}

- (_TtC9appstored25MigratorDistributorIDTask)initWithoutKeepAlive
{
  return (_TtC9appstored25MigratorDistributorIDTask *)sub_10008FBA0(self, (uint64_t)a2, (SEL *)&selRef_initWithoutKeepAlive);
}

- (void)main
{
  uint64_t v52 = type metadata accessor for Logger();
  uint64_t v0 = *(void *)(v52 - 8);
  __chkstk_darwin(v52);
  v2 = (char *)&v47 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10001644C((uint64_t *)&unk_1005A5670);
  __chkstk_darwin(v3 - 8);
  objc_super v5 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v56 = (char *)&v47 - v11;
  id v12 = [self enumeratorWithOptions:0];
  aBlock[4] = sub_10008F884;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_10008FAE4;
  aBlock[3] = &unk_100514D08;
  v13 = _Block_copy(aBlock);
  [v12 setFilter:v13];
  _Block_release(v13);
  v14 = &selRef_itemResponse;
  id v15 = [v12 nextObject];
  if (v15)
  {
    id v17 = v15;
    v57 = (void (**)(char *, char *, uint64_t))(v7 + 32);
    v58 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
    v54 = (void (**)(char *, uint64_t))(v7 + 8);
    v55 = (unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
    v50 = (void (**)(char *, uint64_t))(v0 + 8);
    v18 = &selRef_actionWithLabel_url_;
    *(void *)&long long v16 = 136446466;
    long long v49 = v16;
    v48 = (char *)&type metadata for Any + 8;
    v51 = v9;
    id v53 = v12;
    v47 = v2;
    while (1)
    {
      id v19 = objc_msgSend(v17, v18[207], v47, v48);
      if (!v19)
      {
        __break(1u);
LABEL_21:
        __break(1u);
      }
      v20 = v19;
      uint64_t v59 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v22 = v21;

      id v23 = [v17 bundleContainerURL];
      if (!v23) {
        break;
      }
      v24 = v23;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      v25 = *v57;
      (*v57)(v5, v9, v6);
      (*v58)(v5, 0, 1, v6);
      if ((*v55)(v5, 1, v6) == 1) {
        goto LABEL_4;
      }
      v25(v56, v5, v6);
      URL._bridgeToObjectiveC()(v26);
      v28 = v27;
      v29 = self;
      aBlock[0] = 0;
      id v30 = [v29 metadataForBundleContainerURL:v28 error:aBlock];

      if (!v30)
      {
        id v39 = aBlock[0];
        _convertNSErrorToError(_:)();

        swift_willThrow();
LABEL_15:
        (*v54)(v56, v6);
        static Logger.migrate.getter();
        swift_errorRetain();
        swift_bridgeObjectRetain();
        swift_errorRetain();
        v41 = Logger.logObject.getter();
        v42 = v2;
        os_log_type_t v43 = static os_log_type_t.fault.getter();
        if (os_log_type_enabled(v41, v43))
        {
          uint64_t v44 = swift_slowAlloc();
          v45 = (void *)swift_slowAlloc();
          aBlock[0] = (id)swift_slowAlloc();
          *(_DWORD *)uint64_t v44 = v49;
          swift_bridgeObjectRetain();
          *(void *)(v44 + 4) = sub_1000F7290(v59, v22, (uint64_t *)aBlock);
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v44 + 12) = 2114;
          swift_errorRetain();
          uint64_t v46 = _swift_stdlib_bridgeErrorToNSError();
          *(void *)(v44 + 14) = v46;
          void *v45 = v46;
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v41, v43, "Unable to update store metadata with distributorID for %{public}s: %{public}@", (uint8_t *)v44, 0x16u);
          sub_10001644C((uint64_t *)&unk_1005A3AA0);
          swift_arrayDestroy();
          id v12 = v53;
          swift_slowDealloc();
          swift_arrayDestroy();
          v18 = &selRef_actionWithLabel_url_;
          swift_slowDealloc();
          swift_slowDealloc();

          swift_errorRelease();
          v2 = v47;
          (*v50)(v47, v52);
        }
        else
        {

          swift_errorRelease();
          swift_bridgeObjectRelease_n();
          swift_errorRelease();
          swift_errorRelease();

          (*v50)(v42, v52);
          v2 = v42;
        }
        v9 = v51;
        v14 = &selRef_itemResponse;
        goto LABEL_5;
      }
      id v31 = aBlock[0];
      sub_1004016D4(v30, (int)[v17 isBeta]);
      id v32 = objc_allocWithZone((Class)IXApplicationIdentity);
      swift_bridgeObjectRetain();
      NSString v33 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      id v34 = [v32 initWithBundleIdentifier:v33];

      if (!v34) {
        goto LABEL_21;
      }
      v35 = self;
      aBlock[0] = 0;
      unsigned __int8 v36 = [v35 updateiTunesMetadata:v30 forAppWithIdentity:v34 error:aBlock];

      if ((v36 & 1) == 0)
      {
        id v40 = aBlock[0];
        _convertNSErrorToError(_:)();

        swift_willThrow();
        id v12 = v53;
        v18 = &selRef_actionWithLabel_url_;
        goto LABEL_15;
      }
      v37 = *v54;
      id v38 = aBlock[0];
      v37(v56, v6);
      swift_bridgeObjectRelease();

      id v12 = v53;
      v14 = &selRef_itemResponse;
      v18 = &selRef_actionWithLabel_url_;
LABEL_5:
      id v17 = [v12 v14[103]];
      if (!v17) {
        goto LABEL_19;
      }
    }
    (*v58)(v5, 1, 1, v6);
LABEL_4:

    swift_bridgeObjectRelease();
    sub_1000903C4((uint64_t)v5);
    goto LABEL_5;
  }
LABEL_19:
}

@end