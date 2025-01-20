int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  id v4;
  id v5;

  qword_10004EC58 = 0;
  qword_10004EC60 = 0;
  sub_100004FE0();
  v4 = [self currentRunLoop];
  [v4 run];

  v5 = objc_msgSend(objc_msgSend(self, "defaultProvider"), "agentLogger");
  swift_unknownObjectRelease();
  [v5 agentWillStop];
  swift_unknownObjectRelease();
  return 0;
}

uint64_t sub_100004FE0()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v74 = *(void *)(v0 - 8);
  uint64_t v75 = v0;
  __chkstk_darwin(v0, v1);
  v72 = (char *)&v67 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = type metadata accessor for DispatchQoS();
  uint64_t v71 = *(void *)(v73 - 8);
  __chkstk_darwin(v73, v3);
  v70 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v69 = [self defaultProvider];
  objc_msgSend(objc_msgSend(v69, "agentLogger"), "agentWillStart");
  swift_unknownObjectRelease();
  v5 = (objc_class *)type metadata accessor for ProductionEnvironment();
  long long aBlock = 0u;
  long long v79 = 0u;
  v80 = 0;
  id v6 = [objc_allocWithZone(v5) init];
  id v7 = [objc_allocWithZone((Class)type metadata accessor for ProductionInfoProvider()) init];
  v8 = (char *)sub_10000644C((uint64_t)v6, (uint64_t)&aBlock, (uint64_t)v7);
  v9 = *(void **)&v8[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock];
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  v80 = (_UNKNOWN **)sub_100006B38;
  uint64_t v81 = v10;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v79 = sub_100026380;
  *((void *)&v79 + 1) = &unk_1000450F0;
  v11 = _Block_copy(&aBlock);
  v12 = v8;
  swift_release();
  [v9 performSynchronousWriterBlock:v11];
  _Block_release(v11);
  sub_100027B18();
  id v13 = objc_allocWithZone((Class)NSXPCListener);
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = [v13 initWithMachServiceName:v14];

  v16 = (void *)qword_10004EC58;
  qword_10004EC58 = (uint64_t)v15;

  id v17 = objc_allocWithZone(v5);
  v18 = v12;
  id v19 = [v17 init];
  *((void *)&v79 + 1) = v5;
  v80 = &off_100045C28;
  *(void *)&long long aBlock = v19;
  v20 = objc_allocWithZone((Class)type metadata accessor for DonationAgentEntitlementDecorator());
  uint64_t v21 = sub_100006B58((uint64_t)&aBlock, *((uint64_t *)&v79 + 1));
  __chkstk_darwin(v21, v21);
  v23 = (uint64_t *)((char *)&v67 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v24 + 16))(v23);
  uint64_t v25 = *v23;
  id v26 = v19;
  id v27 = sub_100006628(v25, v18, (uint64_t)sub_10000F2FC, 0, v20);

  sub_100006BA8((uint64_t)&aBlock);
  v28 = (objc_class *)type metadata accessor for DonationListenerDelegate();
  v29 = (char *)objc_allocWithZone(v28);
  *(void *)&v29[OBJC_IVAR____TtC21contactsdonationagent24DonationListenerDelegate_agent] = v27;
  v77.receiver = v29;
  v77.super_class = v28;
  id v30 = objc_msgSendSuper2(&v77, "init");
  v31 = (void *)qword_10004EC60;
  qword_10004EC60 = (uint64_t)v30;

  uint64_t result = qword_10004EC58;
  if (qword_10004EC58)
  {
    if (!qword_10004EC60)
    {
      __break(1u);
      return result;
    }
    objc_msgSend((id)qword_10004EC58, "setDelegate:");
    if (qword_10004EC58) {
      [(id)qword_10004EC58 resume];
    }
  }
  v33 = self;
  id v34 = [v33 globalAsyncScheduler];
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = v18;
  v80 = (_UNKNOWN **)sub_100006BF8;
  uint64_t v81 = v35;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v79 = sub_100026380;
  *((void *)&v79 + 1) = &unk_100045140;
  v36 = _Block_copy(&aBlock);
  v37 = v18;
  swift_release();
  id v38 = [v34 afterDelay:v36 performBlock:2.0];
  _Block_release(v36);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (MGGetSInt32Answer() == 1)
  {
    id v39 = objc_allocWithZone((Class)CNDSIMCardMonitor);
    v40 = v37;
    id v41 = [v39 init];
    v42 = (objc_class *)type metadata accessor for SIMCardMonitor();
    v43 = (char *)objc_allocWithZone(v42);
    *(void *)&v43[OBJC_IVAR____TtC21contactsdonationagent14SIMCardMonitor_token] = 0;
    *(void *)&v43[OBJC_IVAR____TtC21contactsdonationagent14SIMCardMonitor_agent] = v40;
    *(void *)&v43[OBJC_IVAR____TtC21contactsdonationagent14SIMCardMonitor_phoneNumberMonitor] = v41;
    v76.receiver = v43;
    v76.super_class = v42;
    id v44 = objc_msgSendSuper2(&v76, "init");
    id v45 = [v33 globalAsyncScheduler];
    uint64_t v46 = swift_allocObject();
    *(void *)(v46 + 16) = v44;
    v80 = (_UNKNOWN **)sub_100006C34;
    uint64_t v81 = v46;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v79 = sub_100026380;
    *((void *)&v79 + 1) = &unk_100045280;
    v47 = _Block_copy(&aBlock);
    id v48 = v44;
    swift_release();
    id v49 = [v45 afterDelay:v47 performBlock:5.0];
    _Block_release(v47);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  id v50 = objc_allocWithZone((Class)type metadata accessor for AnalysisService());
  v67 = v37;
  id v51 = [v50 init];
  uint64_t v52 = swift_allocObject();
  *(void *)(v52 + 16) = v51;
  v80 = (_UNKNOWN **)sub_100006C1C;
  uint64_t v81 = v52;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v79 = sub_100005D04;
  *((void *)&v79 + 1) = &unk_100045190;
  v53 = _Block_copy(&aBlock);
  id v68 = v51;
  swift_release();
  uint64_t v54 = String.utf8CString.getter();
  xpc_activity_register((const char *)(v54 + 32), XPC_ACTIVITY_CHECK_IN, v53);
  swift_release();
  _Block_release(v53);
  id v55 = [objc_allocWithZone((Class)type metadata accessor for ManagedDuplicateService()) init];
  uint64_t v56 = swift_allocObject();
  *(void *)(v56 + 16) = v55;
  v80 = (_UNKNOWN **)sub_100006C24;
  uint64_t v81 = v56;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v79 = sub_100005D04;
  *((void *)&v79 + 1) = &unk_1000451E0;
  v57 = _Block_copy(&aBlock);
  id v58 = v55;
  swift_release();
  uint64_t v59 = String.utf8CString.getter();
  xpc_activity_register((const char *)(v59 + 32), XPC_ACTIVITY_CHECK_IN, v57);
  swift_release();
  _Block_release(v57);
  sub_100006C44(0, &qword_10004D4C0);
  sub_100006C44(0, &qword_10004D4C8);
  v60 = (void *)static OS_dispatch_queue.main.getter();
  static OS_dispatch_source.makeSignalSource(signal:queue:)();

  swift_getObjectType();
  uint64_t v61 = swift_allocObject();
  v62 = v67;
  *(void *)(v61 + 16) = v67;
  v80 = (_UNKNOWN **)sub_100006C2C;
  uint64_t v81 = v61;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v79 = sub_100026380;
  *((void *)&v79 + 1) = &unk_100045230;
  v63 = _Block_copy(&aBlock);
  v64 = v62;
  v65 = v70;
  static DispatchQoS.unspecified.getter();
  v66 = v72;
  sub_100005BB0();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)();
  _Block_release(v63);
  (*(void (**)(char *, uint64_t))(v74 + 8))(v66, v75);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v65, v73);
  swift_release();
  OS_dispatch_source.resume()();
  swift_unknownObjectRelease();

  return swift_unknownObjectRelease();
}

uint64_t sub_100005A10(char *a1)
{
  uint64_t v2 = *(void **)&a1[OBJC_IVAR____TtC21contactsdonationagent14SIMCardMonitor_phoneNumberMonitor];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = a1;
  v8[4] = sub_100006C3C;
  v8[5] = v3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_100005D64;
  v8[3] = &unk_1000452D0;
  uint64_t v4 = _Block_copy(v8);
  v5 = a1;
  swift_release();
  id v6 = [v2 addInfoChangeHandler:v4];
  _Block_release(v4);
  *(void *)&v5[OBJC_IVAR____TtC21contactsdonationagent14SIMCardMonitor_token] = v6;
  return swift_unknownObjectRelease();
}

void sub_100005B18()
{
  sub_100006ABC((uint64_t *)&unk_10004D4F0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100038E00;
  *(void *)(v0 + 56) = &type metadata for String;
  strcpy((char *)(v0 + 32), "Hup hup hup!!");
  *(_WORD *)(v0 + 46) = -4864;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  sub_10002B768();
}

uint64_t sub_100005BB0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

id sub_100005CC0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DonationListenerDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100005D04(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_100005D64(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_100006C44(0, (unint64_t *)&qword_10004D4D0);
  uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v1(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t variable initialization expression of CNMetricsAnalyzerEngine.logger()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for DonationListenerDelegate()
{
  return self;
}

void type metadata accessor for CNDonationPostalAddressStyle()
{
  if (!qword_10004D438)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10004D438);
    }
  }
}

void *sub_100005EA0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100005EB0(void *a1@<X8>)
{
  *a1 = *v1;
}

id sub_100005EBC(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v8 = type metadata accessor for ProductionEnvironment();
  uint64_t v50 = v8;
  id v51 = &off_100045C28;
  v49[0] = a1;
  v48[3] = type metadata accessor for ProductionInfoProvider();
  v48[4] = &off_100045C08;
  v48[0] = a3;
  uint64_t v9 = OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_donations;
  uint64_t v10 = a4;
  *(void *)&a4[v9] = sub_100026C3C((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v11 = OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_contact;
  *(void *)&v10[v11] = [objc_allocWithZone((Class)CNContact) init];
  v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_suppressingNotificationsDuringStartup] = 0;
  uint64_t v12 = OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_accountLogger;
  id v13 = objc_msgSend(objc_msgSend(self, "defaultProvider"), "accountLogger");
  swift_unknownObjectRelease();
  *(void *)&v10[v12] = v13;
  *(void *)&v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_accountDonationReceiver] = 0;
  NSString v14 = (BOOL (**)(void *))&v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_notYetExpired];
  *NSString v14 = sub_1000277EC;
  v14[1] = 0;
  id v15 = (BOOL (**)(void *))&v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_readyForRenewal];
  *id v15 = sub_100027914;
  v15[1] = 0;
  v16 = (uint64_t (**)(uint64_t, void *))&v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_indexDonationByIdentifierReduction];
  void *v16 = sub_100027A48;
  v16[1] = 0;
  v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_featureState] = 0;
  uint64_t v17 = OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_internalBundleIdentifiers;
  sub_100006ABC(&qword_10004E980);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100038E10;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v19;
  *(void *)(inited + 48) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 56) = v20;
  uint64_t v21 = sub_10001C570(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  *(void *)&v10[v17] = v21;
  *(void *)&v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_bundleIDVersions] = 0;
  sub_100006D7C(v49, v8);
  *(void *)&v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_donationPreferences] = sub_100019C34();
  sub_100006D7C(v49, v50);
  id v22 = sub_100019C34();
  sub_100006D7C(v49, v50);
  id v23 = sub_100019CAC();
  sub_100006D7C(v49, v50);
  id v24 = sub_100019AFC();
  id v25 = objc_allocWithZone((Class)type metadata accessor for DonationPreferencesMonitor());
  id v26 = sub_100013BD4((uint64_t)v22, (uint64_t)v23, (uint64_t)v24);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  *(void *)&v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_preferencesMonitor] = v26;
  sub_100006D7C(v49, v50);
  *(void *)&v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_dataProxy] = sub_100019C20();
  sub_100006DC0(a2, (uint64_t)&v43);
  sub_100006EA0((uint64_t)v49, (uint64_t)v42);
  if (v44)
  {
    sub_100006E88(&v43, (uint64_t)&v45);
  }
  else
  {
    sub_100006D7C(v42, v42[3]);
    id v27 = sub_100019C20();
    v28 = (objc_class *)type metadata accessor for DonationPersistence();
    v29 = (char *)objc_allocWithZone(v28);
    *(void *)&v29[OBJC_IVAR____TtC21contactsdonationagent19DonationPersistence_dataProxy] = v27;
    v41.receiver = v29;
    v41.super_class = v28;
    id v30 = objc_msgSendSuper2(&v41, "init");
    uint64_t v46 = v28;
    v47 = &off_100045908;
    *(void *)&long long v45 = v30;
    sub_100006E28((uint64_t)&v43);
  }
  sub_100006BA8((uint64_t)v42);
  sub_100006E88(&v45, (uint64_t)&v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_persistence]);
  sub_100006D7C(v49, v50);
  *(void *)&v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_feedbackStore] = sub_100019D28();
  sub_100006EA0((uint64_t)v48, (uint64_t)&v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_curatedInfoProvider]);
  sub_100006D7C(v49, v50);
  id v31 = sub_100019AFC();
  NSString v32 = String._bridgeToObjectiveC()();
  id v33 = [v31 newReaderWriterSchedulerWithName:v32];

  swift_unknownObjectRelease();
  *(void *)&v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock] = v33;
  sub_100006D7C(v49, v50);
  id v34 = sub_100019AFC();
  NSString v35 = String._bridgeToObjectiveC()();
  id v36 = [v34 newSerialSchedulerWithName:v35];

  swift_unknownObjectRelease();
  *(void *)&v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_diskScheduler] = v36;
  sub_100006D7C(v49, v50);
  id v37 = [sub_100019AFC() backgroundScheduler];
  swift_unknownObjectRelease();
  *(void *)&v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_replyScheduler] = v37;
  sub_100006D7C(v49, v50);
  *(void *)&v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger] = sub_100019B7C();
  sub_100006EA0((uint64_t)v49, (uint64_t)&v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_environment]);
  sub_100006D7C(v49, v50);
  *(void *)&v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_distributedNotificationCenter] = sub_100019CAC();

  v40.receiver = v10;
  v40.super_class = (Class)type metadata accessor for DonationAgent();
  id v38 = objc_msgSendSuper2(&v40, "init");
  sub_100006BA8((uint64_t)v48);
  sub_100006E28(a2);
  sub_100006BA8((uint64_t)v49);
  return v38;
}

id sub_10000644C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = type metadata accessor for ProductionEnvironment();
  id v22 = &off_100045C28;
  v20[0] = a1;
  uint64_t v18 = type metadata accessor for ProductionInfoProvider();
  uint64_t v19 = &off_100045C08;
  v17[0] = a3;
  id v6 = (char *)objc_allocWithZone((Class)type metadata accessor for DonationAgent());
  uint64_t v7 = sub_100006B58((uint64_t)v20, v21);
  __chkstk_darwin(v7, v7);
  uint64_t v9 = (void *)((char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v10 + 16))(v9);
  uint64_t v11 = sub_100006B58((uint64_t)v17, v18);
  __chkstk_darwin(v11, v11);
  id v13 = (void *)((char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v14 + 16))(v13);
  id v15 = sub_100005EBC(*v9, a2, *v13, v6);
  sub_100006BA8((uint64_t)v17);
  sub_100006BA8((uint64_t)v20);
  return v15;
}

id sub_100006628(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v10 = type metadata accessor for ProductionEnvironment();
  void v17[3] = v10;
  v17[4] = &off_100045C28;
  v17[0] = a1;
  a5[OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator____lazy_storage___connectionHasEntitlement] = 2;
  *(void *)&a5[OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator____lazy_storage___entitlementError] = 0;
  *(void *)&a5[OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator_agent] = a2;
  sub_100006D7C(v17, v10);
  uint64_t v11 = a5;
  id v12 = a2;
  *(void *)&v11[OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator_logger] = sub_100019B7C();
  id v13 = &v11[OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator_connectionProvider];
  *(void *)id v13 = a3;
  *((void *)v13 + 1) = a4;
  swift_retain();

  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for DonationAgentEntitlementDecorator();
  id v14 = objc_msgSendSuper2(&v16, "init");
  sub_100006BA8((uint64_t)v17);
  return v14;
}

void sub_100006724(void *a1)
{
  id v2 = [a1 classesForSelector:"donateMeCardValues:completionHandler:" argumentIndex:0 ofReply:0];
  if (v2)
  {
    uint64_t v3 = v2;
    sub_100006C44(0, (unint64_t *)&qword_10004D4A0);
    id v4 = v3;
    sub_100006ABC(&qword_10004D4A8);
    id v5 = [v4 setByAddingObject:_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()];

    swift_unknownObjectRelease();
    static Set._unconditionallyBridgeFromObjectiveC(_:)();

    Class isa = Set._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [a1 setClasses:isa forSelector:"donateMeCardValues:completionHandler:" argumentIndex:0 ofReply:0];

    id v7 = [a1 classesForSelector:"changeFromAccount:toAccount:completionHandler:" argumentIndex:0 ofReply:0];
    if (v7)
    {
      uint64_t v8 = v7;

      sub_100006C44(0, &qword_10004D4B0);
      id v9 = v8;
      sub_100006ABC(&qword_10004D4B8);
      id v10 = [v9 setByAddingObject:_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()];

      swift_unknownObjectRelease();
      static Set._unconditionallyBridgeFromObjectiveC(_:)();

      Class v11 = Set._bridgeToObjectiveC()().super.isa;
      [a1 setClasses:v11 forSelector:"changeFromAccount:toAccount:completionHandler:" argumentIndex:0 ofReply:0];

      Class v12 = Set._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [a1 setClasses:v12 forSelector:"changeFromAccount:toAccount:completionHandler:" argumentIndex:1 ofReply:0];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1000069A8(void *a1)
{
  id v3 = objc_msgSend(objc_msgSend(self, "defaultProvider"), "agentLogger");
  swift_unknownObjectRelease();
  objc_msgSend(v3, "acceptingConnectionFromProcess:", objc_msgSend(a1, "processIdentifier"));
  swift_unknownObjectRelease();
  id v4 = [self interfaceWithProtocol:&OBJC_PROTOCOL___DonationAgentProtocol];
  sub_100006724(v4);
  [a1 setExportedInterface:v4];

  [a1 setExportedObject:*(void *)(v1 + OBJC_IVAR____TtC21contactsdonationagent24DonationListenerDelegate_agent)];
  [a1 resume];
  return 1;
}

uint64_t sub_100006ABC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006B00()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100006B38()
{
  sub_1000275C0(*(char **)(v0 + 16));
}

uint64_t sub_100006B40(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006B50()
{
  return swift_release();
}

uint64_t sub_100006B58(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_100006BA8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void sub_100006BF8()
{
}

uint64_t sub_100006C1C(_xpc_activity_s *a1)
{
  return sub_100025E04(a1, *(void *)(v1 + 16));
}

uint64_t sub_100006C24(_xpc_activity_s *a1)
{
  return sub_10000D724(a1, *(void *)(v1 + 16));
}

void sub_100006C2C()
{
}

uint64_t sub_100006C34()
{
  return sub_100005A10(*(char **)(v0 + 16));
}

void sub_100006C3C(unint64_t a1)
{
  sub_100013CC8(a1, *(char **)(v1 + 16));
}

uint64_t sub_100006C44(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_100006C80()
{
  unint64_t result = qword_10004D4D8;
  if (!qword_10004D4D8)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004D4D8);
  }
  return result;
}

unint64_t sub_100006CD8()
{
  unint64_t result = qword_10004D4E8;
  if (!qword_10004D4E8)
  {
    sub_100006D34(&qword_10004D4E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004D4E8);
  }
  return result;
}

uint64_t sub_100006D34(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void *sub_100006D7C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100006DC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006ABC((uint64_t *)&unk_10004D500);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006E28(uint64_t a1)
{
  uint64_t v2 = sub_100006ABC((uint64_t *)&unk_10004D500);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006E88(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100006EA0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_100006F50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)&v4[OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_donations] = _swiftEmptyArrayStorage;
  *(void *)&v4[OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_identifiersToRemove] = _swiftEmptyArrayStorage;
  *(void *)&v4[OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_activeRatherThanEnabledDataClasses] = &off_100044F98;
  *(void *)&v4[OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_dataClassBlacklist] = &off_100044FC8;
  *(void *)&v4[OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_oldAccount] = a1;
  *(void *)&v4[OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_newAccount] = a2;
  *(void *)&v4[OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_store] = a3;
  *(void *)&v4[OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_logger] = a4;
  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for AccountChangeAnalyzer();
  return objc_msgSendSuper2(&v6, "init");
}

void sub_100006FFC()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_oldAccount);
  if (v1)
  {
    uint64_t v2 = v0;
    id v3 = v1;
    id v4 = [v3 identifier];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v8 = v7;

      v9._countAndFlagsBits = v6;
      v9._object = v8;
      String.append(_:)(v9);
      id v10 = (char **)(v2 + OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_identifiersToRemove);
      swift_beginAccess();
      Class v11 = *v10;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *id v10 = v11;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        Class v11 = sub_10002E008(0, *((void *)v11 + 2) + 1, 1, v11);
        *id v10 = v11;
      }
      unint64_t v14 = *((void *)v11 + 2);
      unint64_t v13 = *((void *)v11 + 3);
      if (v14 >= v13 >> 1)
      {
        Class v11 = sub_10002E008((char *)(v13 > 1), v14 + 1, 1, v11);
        *id v10 = v11;
      }
      *((void *)v11 + 2) = v14 + 1;
      id v15 = &v11[16 * v14];
      *((void *)v15 + 4) = 0x3A656D616ELL;
      *((void *)v15 + 5) = 0xE500000000000000;
      swift_endAccess();
      v16._countAndFlagsBits = v6;
      v16._object = v8;
      String.append(_:)(v16);
      swift_bridgeObjectRelease();
      swift_beginAccess();
      uint64_t v17 = *v10;
      char v18 = swift_isUniquelyReferenced_nonNull_native();
      *id v10 = v17;
      if ((v18 & 1) == 0)
      {
        uint64_t v17 = sub_10002E008(0, *((void *)v17 + 2) + 1, 1, v17);
        *id v10 = v17;
      }
      unint64_t v20 = *((void *)v17 + 2);
      unint64_t v19 = *((void *)v17 + 3);
      if (v20 >= v19 >> 1)
      {
        uint64_t v17 = sub_10002E008((char *)(v19 > 1), v20 + 1, 1, v17);
        *id v10 = v17;
      }
      *((void *)v17 + 2) = v20 + 1;
      uint64_t v21 = &v17[16 * v20];
      *((void *)v21 + 4) = 0x3A6C69616D65;
      *((void *)v21 + 5) = 0xE600000000000000;
      swift_endAccess();
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_10000721C(void *a1)
{
  id v3 = [a1 accountType];
  if (v3)
  {
    id v4 = v3;
    id v5 = [v3 identifier];

    if (v5)
    {
      uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v8 = v7;

      if (sub_10000E248(v6, v8, *(void **)(v1 + OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_dataClassBlacklist)))
      {
LABEL_11:
        swift_bridgeObjectRelease();
        return 0;
      }
      char v9 = sub_10000E248(v6, v8, *(void **)(v1+ OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_activeRatherThanEnabledDataClasses));
      swift_bridgeObjectRelease();
      if (v9) {
        return (uint64_t)[a1 isActive];
      }
    }
  }
  uint64_t result = (uint64_t)[a1 enabledDataclasses];
  if (!result)
  {
    __break(1u);
    return result;
  }
  Class v11 = (void *)result;
  id v12 = [(id)result count];

  if ((uint64_t)v12 > 0) {
    return 1;
  }
  id v13 = [a1 accountStore];

  if (!v13)
  {
    sub_100006ABC((uint64_t *)&unk_10004D4F0);
    uint64_t v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_100038E00;
    _StringGuts.grow(_:)(48);
    swift_bridgeObjectRelease();
    id v15 = [a1 description];
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    char v18 = v17;

    v19._countAndFlagsBits = v16;
    v19._object = v18;
    String.append(_:)(v19);
    swift_bridgeObjectRelease();
    *(void *)(v14 + 56) = &type metadata for String;
    *(void *)(v14 + 32) = 0xD00000000000002ELL;
    *(void *)(v14 + 40) = 0x800000010003A210;
    print(_:separator:terminator:)();
    goto LABEL_11;
  }
  return 0;
}

void sub_100007444()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v5 = __chkstk_darwin(v2, v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v8);
  id v10 = (char *)&v19 - v9;
  Class v11 = *(void **)(v0 + OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_newAccount);
  if (v11)
  {
    id v20 = v11;
    if (sub_10000721C(v20))
    {
      Date.init()();
      Date.init(timeIntervalSinceNow:)();
      id v12 = (objc_class *)type metadata accessor for AccountPropertyParser();
      id v13 = (char *)objc_allocWithZone(v12);
      uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
      v14(&v13[OBJC_IVAR____TtC21contactsdonationagent21AccountPropertyParser_donationDate], v10, v2);
      v14(&v13[OBJC_IVAR____TtC21contactsdonationagent21AccountPropertyParser_expirationDate], v7, v2);
      v21.receiver = v13;
      v21.super_class = v12;
      id v15 = objc_msgSendSuper2(&v21, "init");
      uint64_t v16 = *(void (**)(char *, uint64_t))(v3 + 8);
      v16(v7, v2);
      v16(v10, v2);
      sub_100023568(v20);
      *(void *)(v1 + OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_donations) = v17;

      swift_bridgeObjectRelease();
    }
    else
    {
      char v18 = v20;
    }
  }
}

void sub_10000766C()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_donations;
  unint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_donations);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v17) {
      return;
    }
  }
  else if (!*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    return;
  }
  unint64_t v4 = *(void *)(v1 + v2);
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
    if (v5) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
    {
LABEL_5:
      sub_10002E584(0, v5 & ~(v5 >> 63), 0);
      if (v5 < 0)
      {
        __break(1u);
        return;
      }
      uint64_t v21 = v1;
      uint64_t v6 = 0;
      do
      {
        if ((v4 & 0xC000000000000001) != 0) {
          id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v7 = *(id *)(v4 + 8 * v6 + 32);
        }
        uint64_t v8 = v7;
        id v9 = [v7 origin];
        id v10 = [v9 donationIdentifier];

        uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v13 = v12;

        unint64_t v15 = _swiftEmptyArrayStorage[2];
        unint64_t v14 = _swiftEmptyArrayStorage[3];
        if (v15 >= v14 >> 1) {
          sub_10002E584(v14 > 1, v15 + 1, 1);
        }
        ++v6;
        _swiftEmptyArrayStorage[2] = v15 + 1;
        uint64_t v16 = &_swiftEmptyArrayStorage[2 * v15];
        v16[4] = v11;
        v16[5] = v13;
      }
      while (v5 != v6);
      swift_bridgeObjectRelease();
      uint64_t v1 = v21;
      goto LABEL_18;
    }
  }
  swift_bridgeObjectRelease();
LABEL_18:
  char v18 = (uint64_t *)(v1 + OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_identifiersToRemove);
  swift_beginAccess();
  uint64_t v19 = swift_bridgeObjectRetain();
  uint64_t v20 = sub_100007CF0(v19, _swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t *v18 = v20;
  swift_bridgeObjectRelease();
}

void sub_1000078B8()
{
  unint64_t v1 = *(void *)&v0[OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_donations];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v7 < 1) {
      return;
    }
  }
  else if (*(uint64_t *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10) < 1)
  {
    return;
  }
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_store];
  if (v2)
  {
    sub_100007C58();
    swift_bridgeObjectRetain();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v0;
    v8[4] = sub_100007CD0;
    v8[5] = v4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 1107296256;
    v8[2] = sub_100026B58;
    v8[3] = &unk_100045320;
    uint64_t v5 = _Block_copy(v8);
    uint64_t v6 = v0;
    swift_release();
    [v2 donateMeCardValues:isa completionHandler:v5];
    _Block_release(v5);
  }
}

void sub_100007A30(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v2 = *(void **)(a2 + OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_logger);
    if (v2)
    {
      id v3 = (id)_convertErrorToNSError(_:)();
      [v2 donationFailedWithError:v3];
    }
  }
}

void sub_100007AA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    id v3 = *(void **)(a3 + OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_logger);
    if (v3)
    {
      id v4 = (id)_convertErrorToNSError(_:)();
      [v3 removalFailedWithError:v4];
    }
  }
}

id sub_100007B54()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountChangeAnalyzer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AccountChangeAnalyzer()
{
  return self;
}

unint64_t sub_100007C58()
{
  unint64_t result = qword_10004D4A0;
  if (!qword_10004D4A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10004D4A0);
  }
  return result;
}

uint64_t sub_100007C98()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100007CD0(uint64_t a1)
{
  sub_100007A30(a1, *(void *)(v1 + 16));
}

uint64_t sub_100007CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100007CE8()
{
  return swift_release();
}

uint64_t sub_100007CF0(uint64_t result, void *a2)
{
  unint64_t v2 = *(void *)(result + 16);
  if (!v2) {
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  unint64_t v4 = 0;
  uint64_t v22 = result + 32;
  uint64_t v20 = a2 + 7;
  uint64_t v21 = _swiftEmptyArrayStorage;
  do
  {
    if (v4 <= v2) {
      unint64_t v5 = v2;
    }
    else {
      unint64_t v5 = v4;
    }
    unint64_t v23 = v5;
    while (1)
    {
      if (v4 == v23) {
        goto LABEL_33;
      }
      uint64_t v6 = (uint64_t *)(v22 + 16 * v4);
      uint64_t v7 = *v6;
      uint64_t v8 = v6[1];
      ++v4;
      uint64_t v9 = a2[2];
      if (!v9) {
        goto LABEL_24;
      }
      unint64_t result = a2[4];
      if (result != v7 || a2[5] != v8)
      {
        unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
        if ((result & 1) == 0) {
          break;
        }
      }
LABEL_7:
      if (v4 == v2) {
        return (uint64_t)v21;
      }
    }
    if (v9 != 1)
    {
      uint64_t v11 = v20;
      uint64_t v12 = 1;
      while (1)
      {
        uint64_t v13 = v12 + 1;
        if (__OFADD__(v12, 1)) {
          break;
        }
        unint64_t result = *(v11 - 1);
        if (result == v7 && *v11 == v8) {
          goto LABEL_7;
        }
        unint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
        if (result) {
          goto LABEL_7;
        }
        v11 += 2;
        ++v12;
        if (v13 == v9) {
          goto LABEL_24;
        }
      }
      __break(1u);
LABEL_33:
      __break(1u);
      return result;
    }
LABEL_24:
    swift_bridgeObjectRetain();
    unint64_t result = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v15 = v21;
    if ((result & 1) == 0)
    {
      unint64_t result = sub_10002E584(0, v21[2] + 1, 1);
      unint64_t v15 = v21;
    }
    uint64_t v16 = v15;
    unint64_t v18 = v15[2];
    unint64_t v17 = v15[3];
    if (v18 >= v17 >> 1)
    {
      unint64_t result = sub_10002E584(v17 > 1, v18 + 1, 1);
      uint64_t v16 = v21;
    }
    v16[2] = v18 + 1;
    uint64_t v21 = v16;
    uint64_t v19 = &v16[2 * v18];
    v19[4] = v7;
    v19[5] = v8;
  }
  while (v4 != v2);
  return (uint64_t)v21;
}

uint64_t sub_100007EB8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = __chkstk_darwin(v4, v6);
  v175 = (char *)&v173 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7, v9);
  v209 = (char *)&v173 - v11;
  __chkstk_darwin(v10, v12);
  v177 = (char *)&v173 - v13;
  uint64_t v14 = sub_100006ABC((uint64_t *)&unk_10004DF40);
  uint64_t v16 = __chkstk_darwin(v14 - 8, v15);
  v176 = (char *)&v173 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16, v18);
  v208 = (char *)&v173 - v20;
  __chkstk_darwin(v19, v21);
  v207 = (char *)&v173 - v22;
  uint64_t v191 = type metadata accessor for DateComponents();
  v193 = *(void (***)(char *, char *, uint64_t))(v191 - 8);
  __chkstk_darwin(v191, v23);
  v214 = (char *)&v173 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_100006ABC(&qword_10004D770);
  uint64_t v27 = __chkstk_darwin(v25 - 8, v26);
  v200 = (char *)&v173 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __chkstk_darwin(v27, v29);
  v194 = (char *)&v173 - v31;
  uint64_t v33 = __chkstk_darwin(v30, v32);
  uint64_t v195 = (uint64_t)&v173 - v34;
  __chkstk_darwin(v33, v35);
  v190 = (char *)&v173 - v36;
  uint64_t v182 = type metadata accessor for CharacterSet();
  uint64_t v37 = *(void *)(v182 - 8);
  __chkstk_darwin(v182, v38);
  objc_super v40 = (char *)&v173 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  Logger.init(subsystem:category:)();
  objc_super v41 = (int *)type metadata accessor for ContactDetails();
  uint64_t v181 = v41[5];
  *(unsigned char *)(a2 + v181) = 0;
  uint64_t v183 = v41[6];
  *(unsigned char *)(a2 + v183) = 0;
  uint64_t v184 = v41[7];
  *(unsigned char *)(a2 + v184) = 0;
  uint64_t v185 = v41[8];
  *(unsigned char *)(a2 + v185) = 0;
  uint64_t v186 = v41[9];
  *(unsigned char *)(a2 + v186) = 0;
  uint64_t v187 = v41[10];
  *(unsigned char *)(a2 + v187) = 0;
  uint64_t v188 = v41[11];
  *(unsigned char *)(a2 + v188) = 0;
  id v215 = (id)v41[12];
  *((unsigned char *)v215 + a2) = 0;
  uint64_t v189 = v41[13];
  *(unsigned char *)(a2 + v189) = 0;
  uint64_t v192 = v41[14];
  *(unsigned char *)(a2 + v192) = 0;
  uint64_t v196 = v41[15];
  *(unsigned char *)(a2 + v196) = 0;
  uint64_t v197 = v41[16];
  *(unsigned char *)(a2 + v197) = 0;
  uint64_t v198 = v41[17];
  *(unsigned char *)(a2 + v198) = 0;
  uint64_t v199 = v41[18];
  *(unsigned char *)(a2 + v199) = 0;
  uint64_t v201 = v41[19];
  *(void *)(a2 + v201) = 0;
  uint64_t v202 = v41[20];
  *(void *)(a2 + v202) = 0;
  uint64_t v203 = v41[21];
  *(void *)(a2 + v203) = 0;
  uint64_t v204 = v41[22];
  *(void *)(a2 + v204) = 0;
  uint64_t v205 = v41[23];
  *(void *)(a2 + v205) = 0;
  uint64_t v42 = v41[24];
  uint64_t v210 = v5;
  long long v43 = *(void (**)(void))(v5 + 56);
  uint64_t v206 = a2 + v42;
  v43();
  uint64_t v174 = a2 + v41[25];
  uint64_t v211 = v4;
  uint64_t v212 = v5 + 56;
  v213 = v43;
  v43();
  id v44 = [a1 givenName];
  uint64_t v45 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v47 = v46;

  uint64_t v216 = v45;
  uint64_t v217 = v47;
  static CharacterSet.whitespacesAndNewlines.getter();
  unint64_t v48 = sub_100009920();
  uint64_t v49 = StringProtocol.trimmingCharacters(in:)();
  unint64_t v51 = v50;
  v179 = *(void (**)(char *, uint64_t))(v37 + 8);
  uint64_t v52 = v182;
  v179(v40, v182);
  uint64_t v178 = v37 + 8;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v53 = HIBYTE(v51) & 0xF;
  if ((v51 & 0x2000000000000000) == 0) {
    uint64_t v53 = v49 & 0xFFFFFFFFFFFFLL;
  }
  *(unsigned char *)(a2 + v181) = v53 != 0;
  id v54 = [a1 middleName];
  uint64_t v55 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v57 = v56;

  uint64_t v216 = v55;
  uint64_t v217 = v57;
  static CharacterSet.whitespacesAndNewlines.getter();
  uint64_t v58 = StringProtocol.trimmingCharacters(in:)();
  unint64_t v60 = v59;
  uint64_t v61 = v179;
  v179(v40, v52);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v62 = HIBYTE(v60) & 0xF;
  if ((v60 & 0x2000000000000000) == 0) {
    uint64_t v62 = v58 & 0xFFFFFFFFFFFFLL;
  }
  *(unsigned char *)(a2 + v183) = v62 != 0;
  id v63 = [a1 familyName];
  uint64_t v64 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v66 = v65;

  uint64_t v216 = v64;
  uint64_t v217 = v66;
  static CharacterSet.whitespacesAndNewlines.getter();
  unint64_t v180 = v48;
  uint64_t v67 = StringProtocol.trimmingCharacters(in:)();
  unint64_t v69 = v68;
  v61(v40, v52);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v70 = HIBYTE(v69) & 0xF;
  if ((v69 & 0x2000000000000000) == 0) {
    uint64_t v70 = v67 & 0xFFFFFFFFFFFFLL;
  }
  *(unsigned char *)(a2 + v184) = v70 != 0;
  id v71 = [a1 nickname];
  uint64_t v72 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v74 = v73;

  uint64_t v216 = v72;
  uint64_t v217 = v74;
  static CharacterSet.whitespacesAndNewlines.getter();
  uint64_t v75 = StringProtocol.trimmingCharacters(in:)();
  unint64_t v77 = v76;
  v78 = v61;
  v61(v40, v52);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v79 = HIBYTE(v77) & 0xF;
  if ((v77 & 0x2000000000000000) == 0) {
    uint64_t v79 = v75 & 0xFFFFFFFFFFFFLL;
  }
  *(unsigned char *)(a2 + v185) = v79 != 0;
  id v80 = [a1 organizationName];
  uint64_t v81 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v83 = v82;

  uint64_t v216 = v81;
  uint64_t v217 = v83;
  static CharacterSet.whitespacesAndNewlines.getter();
  uint64_t v84 = StringProtocol.trimmingCharacters(in:)();
  unint64_t v86 = v85;
  v61(v40, v52);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v87 = HIBYTE(v86) & 0xF;
  if ((v86 & 0x2000000000000000) == 0) {
    uint64_t v87 = v84 & 0xFFFFFFFFFFFFLL;
  }
  *(unsigned char *)(a2 + v186) = v87 != 0;
  id v88 = [a1 phoneticGivenName];
  uint64_t v89 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v91 = v90;

  uint64_t v216 = v89;
  uint64_t v217 = v91;
  static CharacterSet.whitespacesAndNewlines.getter();
  uint64_t v92 = StringProtocol.trimmingCharacters(in:)();
  unint64_t v94 = v93;
  v61(v40, v52);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v95 = HIBYTE(v94) & 0xF;
  if ((v94 & 0x2000000000000000) == 0) {
    uint64_t v95 = v92 & 0xFFFFFFFFFFFFLL;
  }
  *(unsigned char *)(a2 + v187) = v95 != 0;
  id v96 = [a1 phoneticMiddleName];
  uint64_t v97 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v99 = v98;

  uint64_t v216 = v97;
  uint64_t v217 = v99;
  static CharacterSet.whitespacesAndNewlines.getter();
  uint64_t v100 = StringProtocol.trimmingCharacters(in:)();
  unint64_t v102 = v101;
  v61(v40, v52);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v103 = HIBYTE(v102) & 0xF;
  if ((v102 & 0x2000000000000000) == 0) {
    uint64_t v103 = v100 & 0xFFFFFFFFFFFFLL;
  }
  *(unsigned char *)(a2 + v188) = v103 != 0;
  id v104 = [a1 phoneticFamilyName];
  uint64_t v105 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v107 = v106;

  uint64_t v216 = v105;
  uint64_t v217 = v107;
  static CharacterSet.whitespacesAndNewlines.getter();
  uint64_t v108 = StringProtocol.trimmingCharacters(in:)();
  unint64_t v110 = v109;
  v78(v40, v52);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v111 = HIBYTE(v110) & 0xF;
  if ((v110 & 0x2000000000000000) == 0) {
    uint64_t v111 = v108 & 0xFFFFFFFFFFFFLL;
  }
  *((unsigned char *)v215 + a2) = v111 != 0;
  id v215 = a1;
  id v112 = [a1 birthday];
  if (v112)
  {
    v113 = v214;
    static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();

    v114 = v193;
    uint64_t v115 = (uint64_t)v190;
    id v112 = (id)v191;
    v193[4](v190, v113, v191);
    v116 = v114[7];
    ((void (*)(uint64_t, void, uint64_t, id))v116)(v115, 0, 1, v112);
    id v117 = v112;
    LOBYTE(v112) = ((unsigned int (*)(uint64_t, uint64_t, id))v114[6])(v115, 1, v112) != 1;
  }
  else
  {
    v114 = v193;
    v116 = v193[7];
    uint64_t v115 = (uint64_t)v190;
    id v117 = (id)v191;
    v116(v190, (char *)1, 1);
  }
  sub_100009A44(v115, &qword_10004D770);
  *(unsigned char *)(a2 + v189) = (_BYTE)v112;
  id v118 = [v215 birthday];
  uint64_t v119 = (uint64_t)v194;
  if (v118)
  {
    v120 = v118;
    static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v121 = 0;
  }
  else
  {
    uint64_t v121 = 1;
  }
  v193 = (void (**)(char *, char *, uint64_t))v116;
  ((void (*)(uint64_t, uint64_t, uint64_t, id))v116)(v119, v121, 1, v117);
  uint64_t v122 = v195;
  sub_100009974(v119, v195);
  v123 = v114[6];
  if (((unsigned int (*)(uint64_t, uint64_t, id))v123)(v122, 1, v117) == 1)
  {
    v124 = v114;
    sub_100009A44(v122, &qword_10004D770);
    BOOL v125 = 0;
  }
  else
  {
    uint64_t v126 = v122;
    DateComponents.year.getter();
    BOOL v125 = (v127 & 1) == 0;
    v124 = v114;
    ((void (*)(uint64_t, id))v114[1])(v126, v117);
  }
  *(unsigned char *)(a2 + v192) = v125;
  v128 = (char *)[v215 nonGregorianBirthday];
  v129 = v214;
  if (v128)
  {
    static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();

    v128 = v200;
    v124[4](v200, v129, (uint64_t)v117);
    ((void (*)(char *, void, uint64_t, id))v193)(v128, 0, 1, v117);
    uint64_t v130 = (uint64_t)v128;
    LOBYTE(v128) = ((unsigned int (*)(char *, uint64_t, id))v123)(v128, 1, v117) != 1;
  }
  else
  {
    uint64_t v130 = (uint64_t)v200;
    ((void (*)(char *, uint64_t, uint64_t, id))v193)(v200, 1, 1, v117);
  }
  uint64_t v132 = v210;
  uint64_t v131 = v211;
  sub_100009A44(v130, &qword_10004D770);
  *(unsigned char *)(a2 + v196) = (_BYTE)v128;
  id v133 = v215;
  unsigned __int8 v134 = [v215 imageDataAvailable];
  *(unsigned char *)(a2 + v197) = v134;
  [v133 cropRect];
  v219.origin.x = 0.0;
  v219.origin.y = 0.0;
  v219.size.width = 0.0;
  v219.size.height = 0.0;
  *(unsigned char *)(a2 + v198) = !CGRectEqualToRect(v218, v219);
  id v135 = [v133 memojiMetadata];
  uint64_t v136 = (uint64_t)v207;
  if (v135)
  {
    uint64_t v137 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v139 = v138;

    sub_100009AA0(v137, v139);
  }
  *(unsigned char *)(a2 + v199) = v135 != 0;
  id v140 = [v215 phoneNumbers];
  sub_100006ABC(qword_10004D780);
  unint64_t v141 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v141 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v142 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v142 = *(void *)((v141 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  *(void *)(a2 + v201) = v142;
  id v143 = [v215 emailAddresses];
  unint64_t v144 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v144 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v145 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v145 = *(void *)((v144 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  *(void *)(a2 + v202) = v145;
  id v146 = [v215 postalAddresses];
  unint64_t v147 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v147 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v148 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v148 = *(void *)((v147 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  *(void *)(a2 + v203) = v148;
  id v149 = [v215 socialProfiles];
  unint64_t v150 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v150 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v151 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v151 = *(void *)((v150 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  *(void *)(a2 + v204) = v151;
  id v152 = [v215 contactRelations];
  unint64_t v153 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v153 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v154 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v154 = *(void *)((v153 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v155 = v213;
  swift_bridgeObjectRelease();
  *(void *)(a2 + v205) = v154;
  id v156 = [v215 creationDate];
  if (v156)
  {
    v157 = v156;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v158 = 0;
  }
  else
  {
    uint64_t v158 = 1;
  }
  v159 = v209;
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v155)(v136, v158, 1, v131);
  sub_1000099DC(v136, v206);
  id v160 = [v215 creationDate];
  if (!v160)
  {
    uint64_t v163 = (uint64_t)v208;
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v155)(v208, 1, 1, v131);
    goto LABEL_51;
  }
  v161 = v160;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  v162 = *(void (**)(char *, char *, uint64_t))(v132 + 32);
  uint64_t v163 = (uint64_t)v208;
  v162(v208, v159, v131);
  ((void (*)(uint64_t, void, uint64_t, uint64_t))v155)(v163, 0, 1, v131);
  v164 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v132 + 48);
  if (v164(v163, 1, v131) == 1)
  {
LABEL_51:

    return sub_100009A44(v163, (uint64_t *)&unk_10004DF40);
  }
  v162(v177, (char *)v163, v131);
  id v165 = [v215 modificationDate];
  if (!v165)
  {
    uint64_t v163 = (uint64_t)v176;
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v213)(v176, 1, 1, v131);
    goto LABEL_53;
  }
  v166 = v165;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v163 = (uint64_t)v176;
  v162(v176, v159, v131);
  ((void (*)(uint64_t, void, uint64_t, uint64_t))v213)(v163, 0, 1, v131);
  if (v164(v163, 1, v131) == 1)
  {
LABEL_53:

    (*(void (**)(char *, uint64_t))(v132 + 8))(v177, v131);
    return sub_100009A44(v163, (uint64_t *)&unk_10004DF40);
  }
  v167 = v175;
  v162(v175, (char *)v163, v131);
  v168 = v177;
  static Date.+ infix(_:_:)();
  char v169 = static Date.> infix(_:_:)();

  v170 = *(void (**)(char *, uint64_t))(v132 + 8);
  v170(v159, v131);
  v170(v168, v131);
  if ((v169 & 1) == 0) {
    return ((uint64_t (*)(char *, uint64_t))v170)(v167, v131);
  }
  uint64_t v171 = v174;
  sub_100009A44(v174, (uint64_t *)&unk_10004DF40);
  v162((char *)v171, v167, v131);
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v213)(v171, 0, 1, v131);
}

uint64_t sub_100009250()
{
  sub_100006ABC((uint64_t *)&unk_10004E1B0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100038F00;
  *(void *)(v0 + 32) = swift_getKeyPath();
  *(void *)(v0 + 40) = swift_getKeyPath();
  *(void *)(v0 + 48) = swift_getKeyPath();
  *(void *)(v0 + 56) = swift_getKeyPath();
  uint64_t result = specialized Array._endMutation()();
  qword_10004EC68 = v0;
  return result;
}

uint64_t sub_1000092F4()
{
  sub_100006ABC((uint64_t *)&unk_10004E1B0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100038F10;
  *(void *)(v0 + 32) = swift_getKeyPath();
  *(void *)(v0 + 40) = swift_getKeyPath();
  *(void *)(v0 + 48) = swift_getKeyPath();
  uint64_t result = specialized Array._endMutation()();
  qword_10004EC70 = v0;
  return result;
}

uint64_t sub_100009388()
{
  sub_100006ABC(&qword_10004D768);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100038F20;
  uint64_t v1 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v3 = v2;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v5 = swift_getKeyPath();
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v3;
  *(void *)(v0 + 48) = KeyPath;
  *(void *)(v0 + 56) = v5;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = swift_getKeyPath();
  uint64_t v10 = swift_getKeyPath();
  *(void *)(v0 + 64) = v6;
  *(void *)(v0 + 72) = v8;
  *(void *)(v0 + 80) = v9;
  *(void *)(v0 + 88) = v10;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  uint64_t v14 = swift_getKeyPath();
  uint64_t v15 = swift_getKeyPath();
  *(void *)(v0 + 96) = v11;
  *(void *)(v0 + 104) = v13;
  *(void *)(v0 + 112) = v14;
  *(void *)(v0 + 120) = v15;
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  uint64_t v19 = swift_getKeyPath();
  uint64_t v20 = swift_getKeyPath();
  *(void *)(v0 + 128) = v16;
  *(void *)(v0 + 136) = v18;
  *(void *)(v0 + 144) = v19;
  *(void *)(v0 + 152) = v20;
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v23 = v22;
  uint64_t v24 = swift_getKeyPath();
  uint64_t v25 = swift_getKeyPath();
  *(void *)(v0 + 160) = v21;
  *(void *)(v0 + 168) = v23;
  *(void *)(v0 + 176) = v24;
  *(void *)(v0 + 184) = v25;
  uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v28 = v27;
  uint64_t v29 = swift_getKeyPath();
  uint64_t v30 = swift_getKeyPath();
  *(void *)(v0 + 192) = v26;
  *(void *)(v0 + 200) = v28;
  *(void *)(v0 + 208) = v29;
  *(void *)(v0 + 216) = v30;
  uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v33 = v32;
  uint64_t v34 = swift_getKeyPath();
  uint64_t v35 = swift_getKeyPath();
  *(void *)(v0 + 224) = v31;
  *(void *)(v0 + 232) = v33;
  *(void *)(v0 + 240) = v34;
  *(void *)(v0 + 248) = v35;
  uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v38 = v37;
  uint64_t v39 = swift_getKeyPath();
  uint64_t v40 = swift_getKeyPath();
  *(void *)(v0 + 256) = v36;
  *(void *)(v0 + 264) = v38;
  *(void *)(v0 + 272) = v39;
  *(void *)(v0 + 280) = v40;
  uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v43 = v42;
  uint64_t v44 = swift_getKeyPath();
  uint64_t v45 = swift_getKeyPath();
  *(void *)(v0 + 288) = v41;
  *(void *)(v0 + 296) = v43;
  *(void *)(v0 + 304) = v44;
  *(void *)(v0 + 312) = v45;
  uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v48 = v47;
  uint64_t v49 = swift_getKeyPath();
  uint64_t v50 = swift_getKeyPath();
  *(void *)(v0 + 320) = v46;
  *(void *)(v0 + 328) = v48;
  *(void *)(v0 + 336) = v49;
  *(void *)(v0 + 344) = v50;
  uint64_t v51 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v53 = v52;
  uint64_t v54 = swift_getKeyPath();
  uint64_t v55 = swift_getKeyPath();
  *(void *)(v0 + 352) = v51;
  *(void *)(v0 + 360) = v53;
  *(void *)(v0 + 368) = v54;
  *(void *)(v0 + 376) = v55;
  uint64_t v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v58 = v57;
  uint64_t v59 = swift_getKeyPath();
  uint64_t v60 = swift_getKeyPath();
  *(void *)(v0 + 384) = v56;
  *(void *)(v0 + 392) = v58;
  *(void *)(v0 + 400) = v59;
  *(void *)(v0 + 408) = v60;
  uint64_t v61 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v63 = v62;
  uint64_t v64 = swift_getKeyPath();
  uint64_t result = swift_getKeyPath();
  *(void *)(v0 + 416) = v61;
  *(void *)(v0 + 424) = v63;
  *(void *)(v0 + 432) = v64;
  *(void *)(v0 + 440) = result;
  qword_10004EC78 = v0;
  return result;
}

uint64_t sub_1000096E8()
{
  sub_100006ABC(&qword_10004D758);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100038F30;
  uint64_t v1 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v3 = v2;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v5 = swift_getKeyPath();
  *(void *)(v0 + 32) = v1;
  *(void *)(v0 + 40) = v3;
  *(void *)(v0 + 48) = KeyPath;
  *(void *)(v0 + 56) = v5;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = swift_getKeyPath();
  uint64_t v10 = swift_getKeyPath();
  *(void *)(v0 + 64) = v6;
  *(void *)(v0 + 72) = v8;
  *(void *)(v0 + 80) = v9;
  *(void *)(v0 + 88) = v10;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  uint64_t v14 = swift_getKeyPath();
  uint64_t v15 = swift_getKeyPath();
  *(void *)(v0 + 96) = v11;
  *(void *)(v0 + 104) = v13;
  *(void *)(v0 + 112) = v14;
  *(void *)(v0 + 120) = v15;
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  uint64_t v19 = swift_getKeyPath();
  uint64_t v20 = swift_getKeyPath();
  *(void *)(v0 + 128) = v16;
  *(void *)(v0 + 136) = v18;
  *(void *)(v0 + 144) = v19;
  *(void *)(v0 + 152) = v20;
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v23 = v22;
  uint64_t v24 = swift_getKeyPath();
  uint64_t result = swift_getKeyPath();
  *(void *)(v0 + 160) = v21;
  *(void *)(v0 + 168) = v23;
  *(void *)(v0 + 176) = v24;
  *(void *)(v0 + 184) = result;
  qword_10004EC80 = v0;
  return result;
}

uint64_t sub_100009868()
{
  sub_100006ABC(&qword_10004D760);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100038E00;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t result = swift_getKeyPath();
  *(void *)(v0 + 32) = KeyPath;
  *(void *)(v0 + 40) = result;
  qword_10004EC88 = v0;
  return result;
}

uint64_t type metadata accessor for ContactDetails()
{
  uint64_t result = qword_10004D8E0;
  if (!qword_10004D8E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_100009920()
{
  unint64_t result = qword_10004D778;
  if (!qword_10004D778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004D778);
  }
  return result;
}

uint64_t sub_100009974(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006ABC(&qword_10004D770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000099DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006ABC((uint64_t *)&unk_10004DF40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009A44(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006ABC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100009AA0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_100009AF8()
{
  uint64_t result = sub_100009B18();
  qword_10004EC90 = result;
  return result;
}

uint64_t sub_100009B18()
{
  sub_100006ABC((uint64_t *)&unk_10004E1B0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100038F40;
  uint64_t v1 = (void *)CNContactCreationDateKey;
  uint64_t v2 = (void *)CNContactModificationDateKey;
  *(void *)(v0 + 32) = CNContactCreationDateKey;
  *(void *)(v0 + 40) = v2;
  uint64_t v13 = v0;
  specialized Array._endMutation()();
  uint64_t v3 = qword_10004D198;
  id v4 = v1;
  id v5 = v2;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_10004EC80;
  uint64_t v7 = *(void *)(qword_10004EC80 + 16);
  if (v7)
  {
    swift_bridgeObjectRetain();
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v8 = v6 + 56;
    do
    {
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      String._bridgeToObjectiveC()();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v8 += 32;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
  }
  sub_100015F00((unint64_t)_swiftEmptyArrayStorage);
  if (qword_10004D190 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_10004EC78;
  uint64_t v10 = *(void *)(qword_10004EC78 + 16);
  if (v10)
  {
    swift_bridgeObjectRetain();
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v11 = v9 + 56;
    do
    {
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      String._bridgeToObjectiveC()();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      v11 += 32;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
  }
  sub_100015F00((unint64_t)_swiftEmptyArrayStorage);
  return v13;
}

BOOL sub_100009DCC(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

uint64_t sub_100009E08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

uint64_t sub_100009E14()
{
  swift_release();

  return swift_release();
}

void *sub_100009E50(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_100009E88(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 sub_100009EE8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *sub_100009EF4(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_100009F34(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_100009F7C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for ComputedRouting()
{
  return sub_10000B74C();
}

__n128 initializeWithCopy for MultiValueDistribution(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for MultiValueDistribution(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MultiValueDistribution(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

ValueMetadata *type metadata accessor for MultiValueDistribution()
{
  return &type metadata for MultiValueDistribution;
}

uint64_t sub_10000A03C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t _s21contactsdonationagent22MultiValueDistributionVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_10000A078()
{
  swift_bridgeObjectRelease();
  swift_release();

  return swift_release();
}

void *sub_10000A0BC(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_10000A10C(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_10000A18C(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t sub_10000A1E4(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_10000A22C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for DetailsRouting()
{
  return sub_10000B74C();
}

void *sub_10000A284(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v24 = *a2;
    *a1 = *a2;
    a1 = (void *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for Logger();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    *((unsigned char *)a1 + v8) = *((unsigned char *)a2 + v8);
    uint64_t v9 = a3[8];
    *((unsigned char *)a1 + a3[7]) = *((unsigned char *)a2 + a3[7]);
    *((unsigned char *)a1 + v9) = *((unsigned char *)a2 + v9);
    uint64_t v10 = a3[10];
    *((unsigned char *)a1 + a3[9]) = *((unsigned char *)a2 + a3[9]);
    *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
    uint64_t v11 = a3[12];
    *((unsigned char *)a1 + a3[11]) = *((unsigned char *)a2 + a3[11]);
    *((unsigned char *)a1 + v11) = *((unsigned char *)a2 + v11);
    uint64_t v12 = a3[14];
    *((unsigned char *)a1 + a3[13]) = *((unsigned char *)a2 + a3[13]);
    *((unsigned char *)a1 + v12) = *((unsigned char *)a2 + v12);
    uint64_t v13 = a3[16];
    *((unsigned char *)a1 + a3[15]) = *((unsigned char *)a2 + a3[15]);
    *((unsigned char *)a1 + v13) = *((unsigned char *)a2 + v13);
    uint64_t v14 = a3[18];
    *((unsigned char *)a1 + a3[17]) = *((unsigned char *)a2 + a3[17]);
    *((unsigned char *)a1 + v14) = *((unsigned char *)a2 + v14);
    uint64_t v15 = a3[20];
    *(void *)((char *)a1 + a3[19]) = *(void *)((char *)a2 + a3[19]);
    *(void *)((char *)a1 + v15) = *(void *)((char *)a2 + v15);
    uint64_t v16 = a3[22];
    *(void *)((char *)a1 + a3[21]) = *(void *)((char *)a2 + a3[21]);
    *(void *)((char *)a1 + v16) = *(void *)((char *)a2 + v16);
    uint64_t v17 = a3[24];
    *(void *)((char *)a1 + a3[23]) = *(void *)((char *)a2 + a3[23]);
    uint64_t v18 = (char *)a1 + v17;
    uint64_t v19 = (char *)a2 + v17;
    uint64_t v20 = type metadata accessor for Date();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
    if (v22(v19, 1, v20))
    {
      uint64_t v23 = sub_100006ABC((uint64_t *)&unk_10004DF40);
      memcpy(v18, v19, *(void *)(*(void *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
    uint64_t v25 = a3[25];
    uint64_t v26 = (char *)a1 + v25;
    uint64_t v27 = (char *)a2 + v25;
    if (v22(v27, 1, v20))
    {
      uint64_t v28 = sub_100006ABC((uint64_t *)&unk_10004DF40);
      memcpy(v26, v27, *(void *)(*(void *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v26, v27, v20);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v26, 0, 1, v20);
    }
  }
  return a1;
}

uint64_t sub_10000A58C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 96);
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v11 = *(void *)(v6 - 8);
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (!v7(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v5, v6);
  }
  uint64_t v8 = a1 + *(int *)(a2 + 100);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(v8, 1, v6);
  if (!result)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
    return v10(v8, v6);
  }
  return result;
}

uint64_t sub_10000A6E4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(unsigned char *)(a1 + v10) = *(unsigned char *)(a2 + v10);
  uint64_t v11 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v12 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(unsigned char *)(a1 + v12) = *(unsigned char *)(a2 + v12);
  uint64_t v13 = a3[18];
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  *(unsigned char *)(a1 + v13) = *(unsigned char *)(a2 + v13);
  uint64_t v14 = a3[20];
  *(void *)(a1 + a3[19]) = *(void *)(a2 + a3[19]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  uint64_t v15 = a3[22];
  *(void *)(a1 + a3[21]) = *(void *)(a2 + a3[21]);
  *(void *)(a1 + v15) = *(void *)(a2 + v15);
  uint64_t v16 = a3[24];
  *(void *)(a1 + a3[23]) = *(void *)(a2 + a3[23]);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (const void *)(a2 + v16);
  uint64_t v19 = type metadata accessor for Date();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v20 + 48);
  if (v21(v18, 1, v19))
  {
    uint64_t v22 = sub_100006ABC((uint64_t *)&unk_10004DF40);
    memcpy(v17, v18, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v20 + 16))(v17, v18, v19);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  uint64_t v23 = a3[25];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (const void *)(a2 + v23);
  if (v21(v25, 1, v19))
  {
    uint64_t v26 = sub_100006ABC((uint64_t *)&unk_10004DF40);
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v20 + 16))(v24, v25, v19);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v24, 0, 1, v19);
  }
  return a1;
}

uint64_t sub_10000A99C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + a3[8]) = *(unsigned char *)(a2 + a3[8]);
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(unsigned char *)(a1 + a3[10]) = *(unsigned char *)(a2 + a3[10]);
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(unsigned char *)(a1 + a3[12]) = *(unsigned char *)(a2 + a3[12]);
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + a3[14]) = *(unsigned char *)(a2 + a3[14]);
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(unsigned char *)(a1 + a3[16]) = *(unsigned char *)(a2 + a3[16]);
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  *(unsigned char *)(a1 + a3[18]) = *(unsigned char *)(a2 + a3[18]);
  *(void *)(a1 + a3[19]) = *(void *)(a2 + a3[19]);
  *(void *)(a1 + a3[20]) = *(void *)(a2 + a3[20]);
  *(void *)(a1 + a3[21]) = *(void *)(a2 + a3[21]);
  *(void *)(a1 + a3[22]) = *(void *)(a2 + a3[22]);
  *(void *)(a1 + a3[23]) = *(void *)(a2 + a3[23]);
  uint64_t v7 = a3[24];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    uint64_t v15 = sub_100006ABC((uint64_t *)&unk_10004DF40);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
LABEL_7:
  uint64_t v16 = a3[25];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  int v19 = v12((void *)(a1 + v16), 1, v10);
  int v20 = v12(v18, 1, v10);
  if (!v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v17, v18, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v17, v10);
    goto LABEL_12;
  }
  if (v20)
  {
LABEL_12:
    uint64_t v21 = sub_100006ABC((uint64_t *)&unk_10004DF40);
    memcpy(v17, v18, *(void *)(*(void *)(v21 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v17, v18, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v17, 0, 1, v10);
  return a1;
}

uint64_t sub_10000AD38(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(unsigned char *)(a1 + v10) = *(unsigned char *)(a2 + v10);
  uint64_t v11 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v12 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(unsigned char *)(a1 + v12) = *(unsigned char *)(a2 + v12);
  uint64_t v13 = a3[18];
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  *(unsigned char *)(a1 + v13) = *(unsigned char *)(a2 + v13);
  uint64_t v14 = a3[20];
  *(void *)(a1 + a3[19]) = *(void *)(a2 + a3[19]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  uint64_t v15 = a3[22];
  *(void *)(a1 + a3[21]) = *(void *)(a2 + a3[21]);
  *(void *)(a1 + v15) = *(void *)(a2 + v15);
  uint64_t v16 = a3[24];
  *(void *)(a1 + a3[23]) = *(void *)(a2 + a3[23]);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (const void *)(a2 + v16);
  uint64_t v19 = type metadata accessor for Date();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v20 + 48);
  if (v21(v18, 1, v19))
  {
    uint64_t v22 = sub_100006ABC((uint64_t *)&unk_10004DF40);
    memcpy(v17, v18, *(void *)(*(void *)(v22 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v20 + 32))(v17, v18, v19);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  uint64_t v23 = a3[25];
  uint64_t v24 = (void *)(a1 + v23);
  uint64_t v25 = (const void *)(a2 + v23);
  if (v21(v25, 1, v19))
  {
    uint64_t v26 = sub_100006ABC((uint64_t *)&unk_10004DF40);
    memcpy(v24, v25, *(void *)(*(void *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v20 + 32))(v24, v25, v19);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v24, 0, 1, v19);
  }
  return a1;
}

uint64_t sub_10000AFF0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(unsigned char *)(a1 + v7) = *(unsigned char *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(unsigned char *)(a1 + a3[9]) = *(unsigned char *)(a2 + a3[9]);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(unsigned char *)(a1 + a3[11]) = *(unsigned char *)(a2 + a3[11]);
  *(unsigned char *)(a1 + v10) = *(unsigned char *)(a2 + v10);
  uint64_t v11 = a3[14];
  *(unsigned char *)(a1 + a3[13]) = *(unsigned char *)(a2 + a3[13]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v12 = a3[16];
  *(unsigned char *)(a1 + a3[15]) = *(unsigned char *)(a2 + a3[15]);
  *(unsigned char *)(a1 + v12) = *(unsigned char *)(a2 + v12);
  uint64_t v13 = a3[18];
  *(unsigned char *)(a1 + a3[17]) = *(unsigned char *)(a2 + a3[17]);
  *(unsigned char *)(a1 + v13) = *(unsigned char *)(a2 + v13);
  uint64_t v14 = a3[20];
  *(void *)(a1 + a3[19]) = *(void *)(a2 + a3[19]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  uint64_t v15 = a3[22];
  *(void *)(a1 + a3[21]) = *(void *)(a2 + a3[21]);
  *(void *)(a1 + v15) = *(void *)(a2 + v15);
  uint64_t v16 = a3[24];
  *(void *)(a1 + a3[23]) = *(void *)(a2 + a3[23]);
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  uint64_t v19 = type metadata accessor for Date();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  int v22 = v21(v17, 1, v19);
  int v23 = v21(v18, 1, v19);
  if (v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 32))(v17, v18, v19);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v23)
  {
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
LABEL_6:
    uint64_t v24 = sub_100006ABC((uint64_t *)&unk_10004DF40);
    memcpy(v17, v18, *(void *)(*(void *)(v24 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 40))(v17, v18, v19);
LABEL_7:
  uint64_t v25 = a3[25];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (void *)(a2 + v25);
  int v28 = v21((void *)(a1 + v25), 1, v19);
  int v29 = v21(v27, 1, v19);
  if (!v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 40))(v26, v27, v19);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v20 + 8))(v26, v19);
    goto LABEL_12;
  }
  if (v29)
  {
LABEL_12:
    uint64_t v30 = sub_100006ABC((uint64_t *)&unk_10004DF40);
    memcpy(v26, v27, *(void *)(*(void *)(v30 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 32))(v26, v27, v19);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v20 + 56))(v26, 0, 1, v19);
  return a1;
}

uint64_t sub_10000B364(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000B378);
}

uint64_t sub_10000B378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 254)
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 2) {
      return ((v10 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v11 = sub_100006ABC((uint64_t *)&unk_10004DF40);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 96);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_10000B4B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000B4C8);
}

uint64_t sub_10000B4C8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 254)
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  }
  else
  {
    uint64_t v11 = sub_100006ABC((uint64_t *)&unk_10004DF40);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 96);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

void sub_10000B5F4()
{
  type metadata accessor for Logger();
  if (v0 <= 0x3F)
  {
    sub_10000B6F4();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10000B6F4()
{
  if (!qword_10004D8F0)
  {
    type metadata accessor for Date();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10004D8F0);
    }
  }
}

uint64_t sub_10000B74C()
{
  return swift_getGenericMetadata();
}

id sub_10000B7F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MaintenanceAgent();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MaintenanceAgent()
{
  return self;
}

uint64_t CNDonationValue.value()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100006ABC(&qword_10004D9A0);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (objc_class *)_s11ValueCasterCMa(0);
  uint64_t v8 = (char *)objc_allocWithZone(v7);
  uint64_t v9 = &v8[OBJC_IVAR____TtCE21contactsdonationagentCSo15CNDonationValueP33_0B54ECC677397DAC3B941865EB3B64B811ValueCaster_value];
  uint64_t v10 = type metadata accessor for CNDonationValue.Value(0);
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  v17.receiver = v8;
  v17.super_class = v7;
  id v12 = v1;
  id v13 = objc_msgSendSuper2(&v17, "init");
  [v12 acceptDonationValueVisitor:v13];

  uint64_t v14 = (uint64_t)v13
      + OBJC_IVAR____TtCE21contactsdonationagentCSo15CNDonationValueP33_0B54ECC677397DAC3B941865EB3B64B811ValueCaster_value;
  swift_beginAccess();
  sub_10000C794(v14, (uint64_t)v6);

  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10);
  if (result != 1) {
    return sub_10000C7FC((uint64_t)v6, a1);
  }
  __break(1u);
  return result;
}

id sub_10000C1E8()
{
  v2.receiver = v0;
  v2.super_class = (Class)_s11ValueCasterCMa(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t _sSo15CNDonationValueC21contactsdonationagentE0B0O2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)type metadata accessor for PersonNameComponents();
  uint64_t v60 = *(v4 - 1);
  id v61 = v4;
  uint64_t v6 = __chkstk_darwin(v4, v5);
  uint64_t v59 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v58 - v9;
  uint64_t v11 = type metadata accessor for CNDonationValue.Value(0);
  uint64_t v13 = __chkstk_darwin(v11, v12);
  uint64_t v15 = (void **)((char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = __chkstk_darwin(v13, v16);
  uint64_t v19 = (void **)((char *)&v58 - v18);
  uint64_t v21 = __chkstk_darwin(v17, v20);
  int v23 = (void **)((char *)&v58 - v22);
  __chkstk_darwin(v21, v24);
  uint64_t v26 = (char *)&v58 - v25;
  uint64_t v27 = sub_100006ABC(&qword_10004DAF8);
  uint64_t v29 = __chkstk_darwin(v27 - 8, v28);
  uint64_t v31 = (char *)&v58 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = (void **)&v31[*(int *)(v29 + 56)];
  sub_10000D2D8(a1, (uint64_t)v31);
  sub_10000D2D8(a2, (uint64_t)v32);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_10000D2D8((uint64_t)v31, (uint64_t)v23);
      uint64_t v34 = *v23;
      uint64_t v33 = v23[1];
      uint64_t v36 = v23[2];
      uint64_t v35 = v23[3];
      if (swift_getEnumCaseMultiPayload() != 1) {
        goto LABEL_20;
      }
      goto LABEL_5;
    case 2u:
      sub_10000D2D8((uint64_t)v31, (uint64_t)v19);
      uint64_t v34 = *v19;
      uint64_t v33 = v19[1];
      uint64_t v36 = v19[2];
      uint64_t v35 = v19[3];
      if (swift_getEnumCaseMultiPayload() != 2)
      {
LABEL_20:
        swift_bridgeObjectRelease();
        goto LABEL_28;
      }
LABEL_5:
      uint64_t v38 = v32[2];
      uint64_t v37 = v32[3];
      if (v34 == *v32 && v33 == v32[1])
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v40 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v40 & 1) == 0)
        {
          char v41 = 0;
          goto LABEL_31;
        }
      }
      if (v36 == v38 && v35 == v37) {
        char v41 = 1;
      }
      else {
        char v41 = _stringCompareWithSmolCheck(_:_:expecting:)();
      }
LABEL_31:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_35;
    case 3u:
      sub_10000D2D8((uint64_t)v31, (uint64_t)v15);
      uint64_t v42 = *v15;
      uint64_t v44 = v15[2];
      uint64_t v43 = v15[3];
      if (swift_getEnumCaseMultiPayload() == 3)
      {
        uint64_t v45 = v15[1];
        uint64_t v46 = *v32;
        uint64_t v47 = v32[1];
        uint64_t v49 = v32[2];
        uint64_t v48 = v32[3];
        sub_10000D33C();
        id v61 = v46;
        char v41 = 0;
        if ((static NSObject.== infix(_:_:)() & 1) != 0 && v45 == v47)
        {
          if (v44 == v49 && v43 == v48) {
            char v41 = 1;
          }
          else {
            char v41 = _stringCompareWithSmolCheck(_:_:expecting:)();
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        goto LABEL_35;
      }

LABEL_28:
      swift_bridgeObjectRelease();
      goto LABEL_29;
    case 4u:
      goto LABEL_29;
    default:
      sub_10000D2D8((uint64_t)v31, (uint64_t)v26);
      if (swift_getEnumCaseMultiPayload())
      {
        (*(void (**)(char *, id))(v60 + 8))(v26, v61);
LABEL_29:
        sub_100009A44((uint64_t)v31, &qword_10004DAF8);
        char v41 = 0;
      }
      else
      {
        uint64_t v53 = v60;
        id v52 = v61;
        uint64_t v54 = *(void (**)(char *, char *, id))(v60 + 32);
        v54(v10, v26, v61);
        uint64_t v55 = v59;
        v54(v59, (char *)v32, v52);
        char v41 = static PersonNameComponents.== infix(_:_:)();
        uint64_t v56 = *(void (**)(char *, id))(v53 + 8);
        v56(v55, v52);
        v56(v10, v52);
LABEL_35:
        sub_10000CEA4((uint64_t)v31);
      }
      return v41 & 1;
  }
}

uint64_t _s11ValueCasterCMa(uint64_t a1)
{
  return sub_10000C75C(a1, (uint64_t *)&unk_10004DAE0);
}

uint64_t type metadata accessor for CNDonationValue.Value(uint64_t a1)
{
  return sub_10000C75C(a1, qword_10004DA20);
}

uint64_t sub_10000C75C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000C794(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006ABC(&qword_10004D9A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C7FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CNDonationValue.Value(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *_s5ValueOwCP(uint64_t *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v7 = (char *)*a2;
    *a1 = *a2;
    a1 = (uint64_t *)&v7[(v5 + 16) & ~(unint64_t)v5];
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
      case 2u:
        uint64_t v8 = a2[1];
        *a1 = *a2;
        a1[1] = v8;
        uint64_t v9 = a2[2];
        uint64_t v10 = a2[3];
        a1[2] = v9;
        a1[3] = v10;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 3u:
        uint64_t v11 = (void *)*a2;
        *a1 = *a2;
        *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
        a1[3] = a2[3];
        id v12 = v11;
        swift_bridgeObjectRetain();
        break;
      case 4u:
        uint64_t v14 = *a2;
        unint64_t v13 = a2[1];
        sub_10000CA24(v14, v13);
        *a1 = v14;
        a1[1] = v13;
        break;
      default:
        uint64_t v6 = type metadata accessor for PersonNameComponents();
        (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10000CA24(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t _s5ValueOwxx(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      uint64_t v3 = type metadata accessor for PersonNameComponents();
      uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      uint64_t result = v4(a1, v3);
      break;
    case 1:
    case 2:
      swift_bridgeObjectRelease();
      goto LABEL_7;
    case 3:

LABEL_7:
      uint64_t result = swift_bridgeObjectRelease();
      break;
    case 4:
      id v5 = *(id *)a1;
      unint64_t v6 = *(void *)(a1 + 8);
      uint64_t result = sub_100009AA0((uint64_t)v5, v6);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t *_s5ValueOwcp(uint64_t *a1, void *a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 2u:
      uint64_t v5 = a2[1];
      *a1 = *a2;
      a1[1] = v5;
      uint64_t v6 = a2[2];
      uint64_t v7 = a2[3];
      a1[2] = v6;
      a1[3] = v7;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      break;
    case 3u:
      uint64_t v8 = (void *)*a2;
      *a1 = *a2;
      *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
      a1[3] = a2[3];
      id v9 = v8;
      swift_bridgeObjectRetain();
      break;
    case 4u:
      uint64_t v11 = *a2;
      unint64_t v10 = a2[1];
      sub_10000CA24(v11, v10);
      *a1 = v11;
      a1[1] = v10;
      break;
    default:
      uint64_t v4 = type metadata accessor for PersonNameComponents();
      (*(void (**)(uint64_t *, void *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t *_s5ValueOwca(uint64_t *a1, uint64_t *a2)
{
  if (a1 != a2)
  {
    sub_10000CEA4((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
      case 2u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        break;
      case 3u:
        uint64_t v5 = (void *)*a2;
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        id v6 = v5;
        swift_bridgeObjectRetain();
        break;
      case 4u:
        uint64_t v8 = *a2;
        unint64_t v7 = a2[1];
        sub_10000CA24(v8, v7);
        *a1 = v8;
        a1[1] = v7;
        break;
      default:
        uint64_t v4 = type metadata accessor for PersonNameComponents();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10000CEA4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CNDonationValue.Value(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *_s5ValueOwtk(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = type metadata accessor for PersonNameComponents();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *_s5ValueOwta(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10000CEA4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = type metadata accessor for PersonNameComponents();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t _s5ValueOwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t _s5ValueOwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_10000D0D0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_10000D0E0()
{
  uint64_t result = type metadata accessor for PersonNameComponents();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_10000D180()
{
  return _s11ValueCasterCMa(0);
}

void sub_10000D188()
{
  sub_10000D218();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10000D218()
{
  if (!qword_10004DAF0)
  {
    type metadata accessor for CNDonationValue.Value(255);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10004DAF0);
    }
  }
}

uint64_t sub_10000D270(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006ABC(&qword_10004D9A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D2D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CNDonationValue.Value(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000D33C()
{
  unint64_t result = qword_10004DB00;
  if (!qword_10004DB00)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10004DB00);
  }
  return result;
}

id sub_10000D37C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100006ABC((uint64_t *)&unk_10004DF40);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC21contactsdonationagent23ManagedDuplicateService_lock);
  [v7 lock];
  uint64_t v8 = *(void **)(v1 + OBJC_IVAR____TtC21contactsdonationagent23ManagedDuplicateService_defaults);
  NSString v9 = String._bridgeToObjectiveC()();
  id v10 = [v8 objectForKey:v9];

  if (v10)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }
  sub_10000DD8C((uint64_t)&v16, (uint64_t)v18);
  if (!v19)
  {
    sub_100009A44((uint64_t)v18, (uint64_t *)&unk_10004DB60);
    uint64_t v14 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v6, 1, 1, v14);
    goto LABEL_8;
  }
  uint64_t v11 = type metadata accessor for Date();
  int v12 = swift_dynamicCast();
  uint64_t v13 = *(void *)(v11 - 8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v6, v12 ^ 1u, 1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v6, 1, v11) == 1)
  {
LABEL_8:
    sub_100009A44((uint64_t)v6, (uint64_t *)&unk_10004DF40);
    static Date.distantPast.getter();
    return objc_msgSend(v7, "unlock", v16, v17);
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(a1, v6, v11);
  return objc_msgSend(v7, "unlock", v16, v17);
}

id sub_10000D5DC()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC21contactsdonationagent23ManagedDuplicateService_activityIdentifier];
  *(void *)uint64_t v1 = 0xD00000000000002DLL;
  *((void *)v1 + 1) = 0x800000010003A420;
  uint64_t v2 = OBJC_IVAR____TtC21contactsdonationagent23ManagedDuplicateService_logger;
  uint64_t v3 = self;
  uint64_t v4 = v0;
  id v5 = objc_msgSend(objc_msgSend(v3, "defaultProvider"), "duplicatesLogger");
  swift_unknownObjectRelease();
  *(void *)&v0[v2] = v5;
  uint64_t v6 = OBJC_IVAR____TtC21contactsdonationagent23ManagedDuplicateService_defaults;
  *(void *)&v4[v6] = [self standardUserDefaults];
  uint64_t v7 = OBJC_IVAR____TtC21contactsdonationagent23ManagedDuplicateService_lock;
  *(void *)&v4[v7] = [objc_allocWithZone((Class)CNUnfairLock) init];

  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for ManagedDuplicateService();
  return objc_msgSendSuper2(&v9, "init");
}

uint64_t sub_10000D724(_xpc_activity_s *a1, uint64_t a2)
{
  uint64_t v4 = self;
  NSString v5 = String._bridgeToObjectiveC()();
  id v6 = objc_msgSend(v4, "os_transactionInhibitorWithLabel:", v5);

  [v6 start];
  xpc_activity_state_t state = xpc_activity_get_state(a1);
  if (state == 2)
  {
    sub_10000D830();
  }
  else if (!state)
  {
    xpc_object_t v8 = xpc_activity_copy_criteria(a1);
    objc_super v9 = *(void **)(a2 + OBJC_IVAR____TtC21contactsdonationagent23ManagedDuplicateService_logger);
    if (v8)
    {
      [v9 managedDuplicateServiceCriteria:v8];
      swift_unknownObjectRelease();
    }
    else
    {
      [v9 managedDuplicateServiceCheckingIn];
    }
  }
  [v6 stop];

  return swift_unknownObjectRelease();
}

uint64_t sub_10000D830()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v5 = __chkstk_darwin(v2, v4);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v5, v8);
  uint64_t v11 = (char *)&v26 - v10;
  __chkstk_darwin(v9, v12);
  uint64_t v14 = (char *)&v26 - v13;
  Date.init()();
  sub_10000D37C((uint64_t)v7);
  static Date.+ infix(_:_:)();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v15(v7, v2);
  char v16 = static Date.> infix(_:_:)();
  v15(v11, v2);
  v15(v14, v2);
  if (v16)
  {
    Date.init()();
    long long v17 = *(void **)(v1 + OBJC_IVAR____TtC21contactsdonationagent23ManagedDuplicateService_lock);
    [v17 lock];
    uint64_t v18 = *(void **)(v1 + OBJC_IVAR____TtC21contactsdonationagent23ManagedDuplicateService_defaults);
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    NSString v20 = String._bridgeToObjectiveC()();
    [v18 setObject:isa forKey:v20];

    [v17 unlock];
    v15(v14, v2);
    uint64_t v21 = *(void **)(v1 + OBJC_IVAR____TtC21contactsdonationagent23ManagedDuplicateService_logger);
    [v21 willRefreshDuplicates];
    id v22 = [objc_allocWithZone((Class)CNContactStore) init];
    type metadata accessor for DuplicateContactsManager();
    static DuplicateContactsManager.performRefreshManagedDuplicates(with:)();

    [v21 didRefreshDuplicates];
    sub_10000DB70();
    return 1;
  }
  else
  {
    int v23 = *(void **)(v1 + OBJC_IVAR____TtC21contactsdonationagent23ManagedDuplicateService_logger);
    sub_10000D37C((uint64_t)v14);
    Class v24 = Date._bridgeToObjectiveC()().super.isa;
    v15(v14, v2);
    [v23 didSkipRefreshDuplicates:v24];

    return 0;
  }
}

uint64_t sub_10000DB70()
{
  uint64_t v1 = type metadata accessor for Date();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date.distantPast.getter();
  uint64_t v6 = *(void **)(v0 + OBJC_IVAR____TtC21contactsdonationagent23ManagedDuplicateService_lock);
  [v6 lock];
  uint64_t v7 = *(void **)(v0 + OBJC_IVAR____TtC21contactsdonationagent23ManagedDuplicateService_defaults);
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  NSString v9 = String._bridgeToObjectiveC()();
  [v7 setObject:isa forKey:v9];

  [v6 unlock];
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
}

id sub_10000DCC4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ManagedDuplicateService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ManagedDuplicateService()
{
  return self;
}

uint64_t sub_10000DD8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006ABC((uint64_t *)&unk_10004DB60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000DDF4(unint64_t a1)
{
  objc_super v2 = (void *)sub_1000270EC((uint64_t)_swiftEmptyArrayStorage);
  if (a1 >> 62)
  {
LABEL_42:
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    if (v3) {
      goto LABEL_3;
    }
LABEL_43:
    swift_bridgeObjectRelease();
    return (uint64_t)v2;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v3) {
    goto LABEL_43;
  }
LABEL_3:
  unint64_t v43 = a1 & 0xC000000000000001;
  uint64_t v4 = 4;
  uint64_t v41 = v3;
  unint64_t v42 = a1;
  while (1)
  {
    if (v43) {
      id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v6 = *(id *)(a1 + 8 * v4);
    }
    uint64_t v7 = v6;
    if (__OFADD__(v4 - 4, 1))
    {
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    uint64_t v44 = v4 - 3;
    id v8 = [v6 origin];
    id v9 = [v8 bundleIdentifier];

    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;

    if (v2[2])
    {
      unint64_t v13 = sub_10002E8BC(v10, v12);
      if (v14)
      {
        unint64_t v45 = *(void *)(v2[7] + 8 * v13);
        id v15 = v7;
        swift_bridgeObjectRetain();
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
        a1 = v45;
        swift_bridgeObjectRetain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v18 = sub_10002E8BC(v10, v12);
        uint64_t v19 = v2[2];
        BOOL v20 = (v17 & 1) == 0;
        uint64_t v21 = v19 + v20;
        if (__OFADD__(v19, v20)) {
          goto LABEL_40;
        }
        char v22 = v17;
        if (v2[3] >= v21)
        {
          if (isUniquelyReferenced_nonNull_native)
          {
            if ((v17 & 1) == 0) {
              goto LABEL_31;
            }
          }
          else
          {
            sub_10002FC68();
            if ((v22 & 1) == 0) {
              goto LABEL_31;
            }
          }
        }
        else
        {
          sub_10002F140(v21, isUniquelyReferenced_nonNull_native);
          unint64_t v23 = sub_10002E8BC(v10, v12);
          if ((v22 & 1) != (v24 & 1)) {
            goto LABEL_44;
          }
          unint64_t v18 = v23;
          if ((v22 & 1) == 0)
          {
LABEL_31:
            v2[(v18 >> 6) + 8] |= 1 << v18;
            uint64_t v38 = (uint64_t *)(v2[6] + 16 * v18);
            *uint64_t v38 = v10;
            v38[1] = v12;
            *(void *)(v2[7] + 8 * v18) = v45;
            uint64_t v39 = v2[2];
            BOOL v36 = __OFADD__(v39, 1);
            uint64_t v37 = v39 + 1;
            if (v36) {
              goto LABEL_41;
            }
            goto LABEL_32;
          }
        }
        goto LABEL_4;
      }
    }
    sub_100006ABC((uint64_t *)&unk_10004E1B0);
    uint64_t v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_1000395C0;
    *(void *)(v25 + 32) = v7;
    uint64_t v46 = v25;
    specialized Array._endMutation()();
    a1 = v46;
    id v15 = v7;
    swift_bridgeObjectRetain();
    char v26 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v18 = sub_10002E8BC(v10, v12);
    uint64_t v28 = v2[2];
    BOOL v29 = (v27 & 1) == 0;
    uint64_t v30 = v28 + v29;
    if (__OFADD__(v28, v29)) {
      goto LABEL_38;
    }
    char v31 = v27;
    if (v2[3] < v30) {
      break;
    }
    if (v26)
    {
      if ((v27 & 1) == 0) {
        goto LABEL_26;
      }
    }
    else
    {
      sub_10002FC68();
      if ((v31 & 1) == 0)
      {
LABEL_26:
        v2[(v18 >> 6) + 8] |= 1 << v18;
        uint64_t v34 = (uint64_t *)(v2[6] + 16 * v18);
        *uint64_t v34 = v10;
        v34[1] = v12;
        *(void *)(v2[7] + 8 * v18) = v46;
        uint64_t v35 = v2[2];
        BOOL v36 = __OFADD__(v35, 1);
        uint64_t v37 = v35 + 1;
        if (v36) {
          goto LABEL_39;
        }
LABEL_32:
        v2[2] = v37;
        swift_bridgeObjectRetain();
        goto LABEL_5;
      }
    }
LABEL_4:
    uint64_t v5 = v2[7];
    swift_bridgeObjectRelease();
    *(void *)(v5 + 8 * v18) = a1;
LABEL_5:

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    a1 = v42;
    ++v4;
    if (v44 == v41) {
      goto LABEL_43;
    }
  }
  sub_10002F140(v30, v26);
  unint64_t v32 = sub_10002E8BC(v10, v12);
  if ((v31 & 1) == (v33 & 1))
  {
    unint64_t v18 = v32;
    if ((v31 & 1) == 0) {
      goto LABEL_26;
    }
    goto LABEL_4;
  }
LABEL_44:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_10000E248(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  id v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10000E310()
{
  sub_100006ABC(&qword_10004DB98);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1000395D0;
  *(void *)(v0 + 32) = sub_10000E558;
  *(void *)(v0 + 40) = 0;
  *(void *)(v0 + 48) = sub_10000E570;
  *(void *)(v0 + 56) = 0;
  if (qword_10004D1C0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10004ECA8;
  uint64_t v1 = unk_10004ECB0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  *(void *)(v0 + 64) = sub_10000EE94;
  *(void *)(v0 + 72) = v3;
  uint64_t v4 = qword_10004D1C8;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_10004ECB8;
  uint64_t v5 = unk_10004ECC0;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = v5;
  *(void *)(v0 + 80) = sub_10000EE94;
  *(void *)(v0 + 88) = v7;
  uint64_t v8 = qword_10004D1D0;
  swift_retain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_10004ECC8;
  uint64_t v9 = unk_10004ECD0;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = v9;
  *(void *)(v0 + 96) = sub_10000EE94;
  *(void *)(v0 + 104) = v11;
  uint64_t v12 = qword_10004D1D8;
  swift_retain();
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_10004ECD8;
  uint64_t v13 = unk_10004ECE0;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v13;
  *(void *)(v0 + 112) = sub_10000EE94;
  *(void *)(v0 + 120) = v15;
  qword_10004EC98 = v0;

  return swift_retain();
}

uint64_t sub_10000E558@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10000E588(a1, (uint64_t (*)(void))sub_10000E5D0, a2);
}

uint64_t sub_10000E570@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10000E588(a1, (uint64_t (*)(void))sub_10000E788, a2);
}

uint64_t sub_10000E588@<X0>(void *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = a2(*a1);
  *a3 = result;
  a3[1] = v5;
  a3[2] = v6;
  a3[3] = v7;
  return result;
}

void sub_10000E5BC()
{
  qword_10004ECA0 = (uint64_t)&off_100045038;
}

uint64_t sub_10000E5D0(void *a1)
{
  id v2 = [a1 accountType];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = [v2 identifier];

    if (v4)
    {
      uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v7 = v6;

      if (qword_10004D1B8 != -1) {
        swift_once();
      }
      char v8 = sub_10000E248(v5, v7, (void *)qword_10004ECA0);
      swift_bridgeObjectRelease();
      if (v8) {
        return 0;
      }
    }
  }
  id v9 = [a1 username];
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  id v11 = [objc_allocWithZone((Class)CNEmailAddressScanner) init];
  NSString v12 = String._bridgeToObjectiveC()();
  id v13 = [v11 firstEmailAddressInString:v12];

  if (!v13)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  return v14;
}

uint64_t sub_10000E788(void *a1)
{
  strcpy((char *)&v8, "primaryEmail");
  BYTE13(v8) = 0;
  HIWORD(v8) = -5120;
  id v2 = [a1 objectForKeyedSubscript:_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()];
  swift_unknownObjectRelease();
  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  sub_10000DD8C((uint64_t)&v8, (uint64_t)v10);
  if (v11)
  {
    if (swift_dynamicCast())
    {
      uint64_t v3 = v7;
      *(void *)&long long v8 = 0x6449656C707061;
      *((void *)&v8 + 1) = 0xE700000000000000;
      id v4 = [a1 objectForKeyedSubscript:_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()];
      swift_unknownObjectRelease();
      if (v4)
      {
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
      }
      else
      {
        long long v8 = 0u;
        long long v9 = 0u;
      }
      sub_10000DD8C((uint64_t)&v8, (uint64_t)v10);
      if (v11)
      {
        if (swift_dynamicCast())
        {
LABEL_15:
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      else
      {
        sub_10000EF14((uint64_t)v10);
      }
      v5._object = (void *)0x800000010003A500;
      v5._countAndFlagsBits = 0xD000000000000011;
      if (!String.hasSuffix(_:)(v5))
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        return v3;
      }
      goto LABEL_15;
    }
  }
  else
  {
    sub_10000EF14((uint64_t)v10);
  }
  return 0;
}

void *sub_10000E9A4()
{
  uint64_t v0 = type metadata accessor for AccountPropertyEmailParser();
  uint64_t result = (void *)swift_allocObject();
  result[2] = v0;
  result[3] = 0xD000000000000014;
  result[4] = 0x800000010003A4E0;
  qword_10004ECA8 = (uint64_t)sub_10000EF74;
  unk_10004ECB0 = result;
  return result;
}

void *sub_10000EA18()
{
  uint64_t v0 = type metadata accessor for AccountPropertyEmailParser();
  uint64_t result = (void *)swift_allocObject();
  result[2] = v0;
  result[3] = 0x656D614E72657375;
  result[4] = 0xE800000000000000;
  qword_10004ECB8 = (uint64_t)sub_10000EF74;
  unk_10004ECC0 = result;
  return result;
}

void *sub_10000EA88()
{
  uint64_t v0 = type metadata accessor for AccountPropertyEmailParser();
  uint64_t result = (void *)swift_allocObject();
  result[2] = v0;
  result[3] = 0xD000000000000011;
  result[4] = 0x800000010003A4C0;
  qword_10004ECC8 = (uint64_t)sub_10000EF74;
  unk_10004ECD0 = result;
  return result;
}

void *sub_10000EAFC()
{
  uint64_t v0 = type metadata accessor for AccountPropertyEmailParser();
  uint64_t result = (void *)swift_allocObject();
  result[2] = v0;
  result[3] = 0xD000000000000015;
  result[4] = 0x800000010003A4A0;
  qword_10004ECD8 = (uint64_t)sub_10000EF08;
  unk_10004ECE0 = result;
  return result;
}

uint64_t sub_10000EB70(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = [a1 accountType];
  if (v7)
  {
    long long v8 = v7;
    id v9 = [v7 identifier];

    if (v9)
    {
      uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v12 = v11;

      if (qword_10004D1B8 != -1) {
        swift_once();
      }
      char v13 = sub_10000E248(v10, v12, (void *)qword_10004ECA0);
      swift_bridgeObjectRelease();
      if (v13) {
        return 0;
      }
    }
  }
  *(void *)&v20[0] = a3;
  *((void *)&v20[0] + 1) = a4;
  swift_bridgeObjectRetain();
  id v14 = [a1 objectForKeyedSubscript:_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()];
  swift_unknownObjectRelease();
  if (v14)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v20, 0, sizeof(v20));
  }
  sub_10000DD8C((uint64_t)v20, (uint64_t)v21);
  if (!v22)
  {
    sub_10000EF14((uint64_t)v21);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  id v15 = [objc_allocWithZone((Class)CNEmailAddressScanner) init];
  NSString v16 = String._bridgeToObjectiveC()();
  id v17 = [v15 firstEmailAddressInString:v16];

  if (!v17)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  return v18;
}

id sub_10000EE00()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountPropertyEmailParser();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AccountPropertyEmailParser()
{
  return self;
}

uint64_t sub_10000EE5C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000EE98@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v2 + 16))(*a1);
  *a2 = result;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  return result;
}

uint64_t sub_10000EED0()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000EF08(void *a1)
{
  return sub_10000EB70(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_10000EF14(uint64_t a1)
{
  uint64_t v2 = sub_100006ABC((uint64_t *)&unk_10004DB60);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000EF90()
{
  uint64_t v1 = OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator____lazy_storage___connectionHasEntitlement;
  int v2 = *(unsigned __int8 *)(v0
                          + OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator____lazy_storage___connectionHasEntitlement);
  if (v2 == 2)
  {
    char v3 = sub_10000EFDC(v0);
    *(unsigned char *)(v0 + v1) = v3 & 1;
  }
  else
  {
    char v3 = v2 & 1;
  }
  return v3 & 1;
}

uint64_t sub_10000EFDC(uint64_t a1)
{
  int v2 = (void *)(*(uint64_t (**)(void))(a1
                                    + OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator_connectionProvider))();
  if (!v2) {
    return 0;
  }
  char v3 = v2;
  if ((sub_10000F0BC(0xD00000000000001ALL, 0x800000010003A620, v2) & 1) != 0
    || (sub_10000F0BC(0xD000000000000026, 0x800000010003A640, v3) & 1) != 0)
  {
    uint64_t v4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator_logger), "denyingRequestFromProcess:", objc_msgSend(v3, "processIdentifier"));
    uint64_t v4 = 0;
  }

  return v4;
}

id sub_10000F0BC(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = [a3 valueForEntitlement:v4];

  if (v5)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_10000DD8C((uint64_t)v9, (uint64_t)v10);
  if (!v11)
  {
    sub_10000EF14((uint64_t)v10);
    return 0;
  }
  sub_100006C44(0, (unint64_t *)&qword_10004DCB8);
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  id v6 = [v8 BOOLValue];

  return v6;
}

id sub_10000F1B4()
{
  uint64_t v1 = OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator____lazy_storage___entitlementError;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator____lazy_storage___entitlementError))
  {
    id v2 = *(id *)(v0
               + OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator____lazy_storage___entitlementError);
  }
  else
  {
    id v2 = sub_10000F218();
    *(void *)(v0 + v1) = v2;
    swift_errorRetain();
    swift_errorRelease();
  }
  swift_errorRetain();
  return v2;
}

id sub_10000F218()
{
  unint64_t v0 = sub_100026E78((uint64_t)&off_100045068);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100010DCC(v0);
  swift_bridgeObjectRelease();
  id v1 = objc_allocWithZone((Class)NSError);
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v4 = [v1 initWithDomain:v2 code:4097 userInfo:isa];

  return v4;
}

id sub_10000F2FC()
{
  id v0 = [self currentConnection];

  return v0;
}

void sub_10000F51C(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_10000F5C0(uint64_t a1, void *a2)
{
  char v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_10000F640(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  id v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_100006C44(0, (unint64_t *)&qword_10004D4A0);
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000F7D4(void *a1, int a2, int a3, void *aBlock, void (*a5)(uint64_t, uint64_t, id, void *))
{
  id v7 = _Block_copy(aBlock);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  _Block_copy(v7);
  id v11 = a1;
  a5(v8, v10, v11, v7);
  _Block_release(v7);
  _Block_release(v7);

  return swift_bridgeObjectRelease();
}

void sub_10000F890(void *a1, int a2, void *aBlock, void (*a4)(void))
{
  id v6 = _Block_copy(aBlock);
  _Block_copy(v6);
  id v7 = a1;
  a4();
  _Block_release(v6);
  _Block_release(v6);
}

id sub_10000F93C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DonationAgentEntitlementDecorator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DonationAgentEntitlementDecorator()
{
  return self;
}

void sub_10000FA04(uint64_t a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  _Block_copy(a3);
  if (sub_10000EF90())
  {
    id v6 = *(void **)(a2 + OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator_agent);
    sub_100006C44(0, (unint64_t *)&qword_10004D4A0);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    v10[4] = sub_1000107F8;
    v10[5] = v5;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 1107296256;
    v10[2] = sub_100026B58;
    v10[3] = &unk_100045868;
    uint64_t v8 = _Block_copy(v10);
    swift_retain();
    swift_release();
    [v6 donateMeCardValues:isa completionHandler:v8];
    _Block_release(v8);
    swift_release();
  }
  else
  {
    sub_10000F1B4();
    uint64_t v9 = (void *)_convertErrorToNSError(_:)();
    ((void (**)(void, void *))a3)[2](a3, v9);

    swift_errorRelease();
    swift_release();
  }
}

void sub_10000FBA4(uint64_t a1, uint64_t a2, void (**a3)(void, void, void))
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a3;
  _Block_copy(a3);
  if (sub_10000EF90())
  {
    id v6 = *(void **)(a2 + OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator_agent);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    v10[4] = sub_1000107F0;
    v10[5] = v5;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 1107296256;
    v10[2] = sub_100026BC4;
    v10[3] = &unk_100045818;
    uint64_t v8 = _Block_copy(v10);
    swift_retain();
    swift_release();
    [v6 removeDonatedMeCardValuesForIdentifiers:isa completionHandler:v8];
    _Block_release(v8);
    swift_release();
  }
  else
  {
    sub_10000F1B4();
    uint64_t v9 = (void *)_convertErrorToNSError(_:)();
    ((void (**)(void, void, void *))a3)[2](a3, 0, v9);

    swift_errorRelease();
    swift_release();
  }
}

uint64_t sub_10000FD34(uint64_t a1, void (**a2)(void, void, void))
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  _Block_copy(a2);
  if (sub_10000EF90())
  {
    uint64_t v5 = *(void **)(a1 + OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator_agent);
    v9[4] = sub_1000107E8;
    v9[5] = v4;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 1107296256;
    _OWORD v9[2] = sub_10000F51C;
    v9[3] = &unk_1000457C8;
    id v6 = _Block_copy(v9);
    swift_retain();
    swift_release();
    [v5 fetchDonatedMeCard:v6];
    _Block_release(v6);
    return swift_release();
  }
  else
  {
    sub_10000F1B4();
    uint64_t v8 = (void *)_convertErrorToNSError(_:)();
    ((void (**)(void, void, void *))a2)[2](a2, 0, v8);

    swift_errorRelease();
    return swift_release();
  }
}

void sub_10000FE98(uint64_t a1, void (**a2)(void, void))
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  _Block_copy(a2);
  if (sub_10000EF90())
  {
    uint64_t v5 = *(void **)(a1 + OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator_agent);
    aBlock[4] = sub_1000107E0;
    aBlock[5] = v4;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000F5C0;
    aBlock[3] = &unk_100045778;
    id v6 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    [v5 synchronousDonatedMeCard:v6];
    _Block_release(v6);
    swift_release();
  }
  else
  {
    sub_10000F1B4();
    id v7 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
    id v8 = [self eitherWithRight:v7];

    ((void (**)(void, id))a2)[2](a2, v8);
    swift_release();
  }
}

uint64_t sub_100010028(uint64_t a1, void (**a2)(void, void, void))
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  _Block_copy(a2);
  if (sub_10000EF90())
  {
    uint64_t v5 = *(void **)(a1 + OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator_agent);
    v9[4] = sub_1000107D8;
    v9[5] = v4;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 1107296256;
    _OWORD v9[2] = sub_10000F640;
    v9[3] = &unk_100045728;
    id v6 = _Block_copy(v9);
    swift_retain();
    swift_release();
    [v5 meCardDonations:v6];
    _Block_release(v6);
    return swift_release();
  }
  else
  {
    sub_10000F1B4();
    id v8 = (void *)_convertErrorToNSError(_:)();
    ((void (**)(void, void, void *))a2)[2](a2, 0, v8);

    swift_errorRelease();
    return swift_release();
  }
}

uint64_t sub_10001018C(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(void, void))
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a4;
  _Block_copy(a4);
  if (sub_10000EF90())
  {
    uint64_t v9 = *(void **)(a3 + OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator_agent);
    v13[4] = sub_1000107F8;
    v13[5] = v8;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 1107296256;
    v13[2] = sub_100026B58;
    v13[3] = &unk_1000456D8;
    uint64_t v10 = _Block_copy(v13);
    swift_retain();
    swift_release();
    [v9 changeFromAccount:a1 toAccount:a2 completionHandler:v10];
    _Block_release(v10);
    return swift_release();
  }
  else
  {
    sub_10000F1B4();
    uint64_t v12 = (void *)_convertErrorToNSError(_:)();
    ((void (**)(void, void *))a4)[2](a4, v12);

    swift_errorRelease();
    return swift_release();
  }
}

void sub_100010308(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(void, void))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a4;
  _Block_copy(a4);
  if (sub_10000EF90())
  {
    id v7 = *(void **)(a3 + OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator_agent);
    NSString v8 = String._bridgeToObjectiveC()();
    v11[4] = sub_1000107F8;
    v11[5] = v6;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 1107296256;
    v11[2] = sub_100026B58;
    v11[3] = &unk_100045688;
    uint64_t v9 = _Block_copy(v11);
    swift_retain();
    swift_release();
    [v7 rejectValueWithDonationIdentifier:v8 completionHandler:v9];
    _Block_release(v9);
    swift_release();
  }
  else
  {
    sub_10000F1B4();
    uint64_t v10 = (void *)_convertErrorToNSError(_:)();
    ((void (**)(void, void *))a4)[2](a4, v10);

    swift_errorRelease();
    swift_release();
  }
}

void sub_100010494(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(void, void))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a4;
  _Block_copy(a4);
  if (sub_10000EF90())
  {
    id v7 = *(void **)(a3 + OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator_agent);
    NSString v8 = String._bridgeToObjectiveC()();
    v11[4] = sub_1000107F8;
    v11[5] = v6;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 1107296256;
    v11[2] = sub_100026B58;
    v11[3] = &unk_100045638;
    uint64_t v9 = _Block_copy(v11);
    swift_retain();
    swift_release();
    [v7 rejectValuesWithClusterIdentifier:v8 completionHandler:v9];
    _Block_release(v9);
    swift_release();
  }
  else
  {
    sub_10000F1B4();
    uint64_t v10 = (void *)_convertErrorToNSError(_:)();
    ((void (**)(void, void *))a4)[2](a4, v10);

    swift_errorRelease();
    swift_release();
  }
}

uint64_t sub_100010620(uint64_t a1, void (**a2)(void, void))
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  _Block_copy(a2);
  if (sub_10000EF90())
  {
    uint64_t v5 = *(void **)(a1 + OBJC_IVAR____TtC21contactsdonationagent33DonationAgentEntitlementDecorator_agent);
    v9[4] = sub_1000107B8;
    v9[5] = v4;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 1107296256;
    _OWORD v9[2] = sub_100026B58;
    v9[3] = &unk_1000455E8;
    uint64_t v6 = _Block_copy(v9);
    swift_retain();
    swift_release();
    [v5 removeAllRejectionsWithCompletionHandler:v6];
    _Block_release(v6);
    return swift_release();
  }
  else
  {
    sub_10000F1B4();
    NSString v8 = (void *)_convertErrorToNSError(_:)();
    ((void (**)(void, void *))a2)[2](a2, v8);

    swift_errorRelease();
    return swift_release();
  }
}

uint64_t sub_100010780()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000107B8(uint64_t a1)
{
  sub_100027210(a1, *(void *)(v1 + 16));
}

uint64_t sub_1000107C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000107D0()
{
  return swift_release();
}

void sub_1000107D8(objc_class *a1, uint64_t a2)
{
  sub_10002736C(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1000107E0(uint64_t a1)
{
  return sub_100027354(a1, *(void *)(v1 + 16));
}

void sub_1000107E8(uint64_t a1, uint64_t a2)
{
  sub_1000272E4(a1, a2, *(void *)(v2 + 16));
}

void sub_1000107F0(char a1, uint64_t a2)
{
  sub_100027274(a1, a2, *(void *)(v2 + 16));
}

id sub_10001088C()
{
  return sub_100010C0C(type metadata accessor for ExtensionDonationSolicitor);
}

uint64_t type metadata accessor for ExtensionDonationSolicitor()
{
  return self;
}

id sub_1000108D8(uint64_t a1)
{
  return [*(id *)(*v1 + OBJC_IVAR____TtC21contactsdonationagent26ExtensionDonationSolicitor_donor) redonateAllValuesWithReason:a1];
}

id sub_100010928()
{
  return sub_100010C0C(type metadata accessor for AccountsDonationSolicitor);
}

uint64_t type metadata accessor for AccountsDonationSolicitor()
{
  return self;
}

void sub_100010974()
{
}

uint64_t sub_1000109A4()
{
  sub_100006ABC((uint64_t *)&unk_10004D4F0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100038E00;
  swift_bridgeObjectRetain();
  sub_100006ABC(&qword_10004DD50);
  v1._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  *(void *)(v0 + 56) = &type metadata for String;
  *(void *)(v0 + 32) = 0x6F666E69204D4953;
  *(void *)(v0 + 40) = 0xEA0000000000203ALL;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100038E00;
  swift_errorRetain();
  sub_100006ABC(&qword_10004DD58);
  v3._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  *(void *)(v2 + 56) = &type metadata for String;
  *(void *)(v2 + 32) = 0x203A726F727245;
  *(void *)(v2 + 40) = 0xE700000000000000;
  print(_:separator:terminator:)();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100010B30(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_100010D8C();
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

id sub_100010BF4()
{
  return sub_100010C0C(type metadata accessor for SIMCardDonationSolicitor);
}

id sub_100010C0C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for SIMCardDonationSolicitor()
{
  return self;
}

uint64_t sub_100010C78()
{
  uint64_t result = sub_100010D48();
  if (result)
  {
    Swift::String v1 = self;
    v4[4] = sub_1000109A4;
    v4[5] = 0;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 1107296256;
    v4[2] = sub_100010B30;
    v4[3] = &unk_1000458C0;
    uint64_t v2 = _Block_copy(v4);
    id v3 = [v1 infoWithCompletion:v2];
    _Block_release(v2);
    return swift_unknownObjectRelease();
  }
  return result;
}

BOOL sub_100010D48()
{
  return MGGetSInt32Answer() == 1;
}

uint64_t sub_100010D74(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100010D84()
{
  return swift_release();
}

unint64_t sub_100010D8C()
{
  unint64_t result = qword_10004D4D0;
  if (!qword_10004D4D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10004D4D0);
  }
  return result;
}

unint64_t sub_100010DCC(uint64_t a1)
{
  uint64_t v1 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_100006ABC(&qword_10004DD98);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v32 = v1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(v1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(v1 + 64);
  int64_t v31 = (unint64_t)(63 - v3) >> 6;
  id v6 = &v37;
  id v7 = &v39;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  uint64_t v10 = (char *)&type metadata for Any + 8;
  id v11 = &type metadata for String;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v20 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v20 >= v31) {
    goto LABEL_32;
  }
  unint64_t v21 = *(void *)(v32 + 8 * v20);
  int64_t v22 = i + 1;
  if (!v21)
  {
    int64_t v22 = i + 2;
    if (i + 2 >= v31) {
      goto LABEL_32;
    }
    unint64_t v21 = *(void *)(v32 + 8 * v22);
    if (!v21)
    {
      int64_t v22 = i + 3;
      if (i + 3 >= v31) {
        goto LABEL_32;
      }
      unint64_t v21 = *(void *)(v32 + 8 * v22);
      if (!v21)
      {
        int64_t v22 = i + 4;
        if (i + 4 >= v31) {
          goto LABEL_32;
        }
        unint64_t v21 = *(void *)(v32 + 8 * v22);
        if (!v21)
        {
          int64_t v23 = i + 5;
          if (i + 5 < v31)
          {
            unint64_t v21 = *(void *)(v32 + 8 * v23);
            if (v21)
            {
              int64_t v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v22 = v23 + 1;
              if (__OFADD__(v23, 1)) {
                goto LABEL_36;
              }
              if (v22 >= v31) {
                break;
              }
              unint64_t v21 = *(void *)(v32 + 8 * v22);
              ++v23;
              if (v21) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_1000131FC();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  uint64_t v34 = (v21 - 1) & v21;
  unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; unint64_t v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    char v24 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v19);
    uint64_t v35 = *v24;
    uint64_t v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1000131EC(v6, v7);
    sub_1000131EC(v7, v40);
    sub_1000131EC(v40, &v38);
    unint64_t result = sub_10002E8BC(v35, v36);
    unint64_t v25 = result;
    if (v26)
    {
      int64_t v33 = i;
      uint64_t v12 = v7;
      char v13 = v6;
      uint64_t v14 = v1;
      id v15 = v11;
      NSString v16 = v10;
      id v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *id v17 = v35;
      v17[1] = v36;
      uint64_t v10 = v16;
      id v11 = v15;
      uint64_t v1 = v14;
      id v6 = v13;
      id v7 = v12;
      int64_t i = v33;
      uint64_t v18 = (_OWORD *)(v2[7] + 32 * v25);
      sub_100006BA8((uint64_t)v18);
      unint64_t result = (unint64_t)sub_1000131EC(&v38, v18);
      unint64_t v5 = v34;
      if (!v34) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v27 = (uint64_t *)(v2[6] + 16 * result);
    *char v27 = v35;
    v27[1] = v36;
    unint64_t result = (unint64_t)sub_1000131EC(&v38, (_OWORD *)(v2[7] + 32 * result));
    uint64_t v28 = v2[2];
    BOOL v29 = __OFADD__(v28, 1);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_34;
    }
    v2[2] = v30;
    unint64_t v5 = v34;
    if (!v34) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_100011138(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100006ABC((uint64_t *)&unk_10004DDD0);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  id v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    id v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_1000134E0(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1000131EC(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_1000131EC(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_1000131EC(v36, v37);
    sub_1000131EC(v37, &v33);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_1000131EC(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_1000131FC();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

unint64_t sub_100011500(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = a1;
  if (*(void *)(a1 + 16))
  {
    sub_100006ABC(&qword_10004DD98);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v33 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(v2 + 64);
  int64_t v32 = (unint64_t)(63 - v4) >> 6;
  id v7 = &v38;
  int64_t v8 = &v40;
  unint64_t result = swift_bridgeObjectRetain();
  int64_t i = 0;
  unint64_t v11 = (char *)&type metadata for Any + 8;
  if (v6) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v21 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v21 >= v32) {
    goto LABEL_32;
  }
  unint64_t v22 = *(void *)(v33 + 8 * v21);
  int64_t v23 = i + 1;
  if (!v22)
  {
    int64_t v23 = i + 2;
    if (i + 2 >= v32) {
      goto LABEL_32;
    }
    unint64_t v22 = *(void *)(v33 + 8 * v23);
    if (!v22)
    {
      int64_t v23 = i + 3;
      if (i + 3 >= v32) {
        goto LABEL_32;
      }
      unint64_t v22 = *(void *)(v33 + 8 * v23);
      if (!v22)
      {
        int64_t v23 = i + 4;
        if (i + 4 >= v32) {
          goto LABEL_32;
        }
        unint64_t v22 = *(void *)(v33 + 8 * v23);
        if (!v22)
        {
          int64_t v24 = i + 5;
          if (i + 5 < v32)
          {
            unint64_t v22 = *(void *)(v33 + 8 * v24);
            if (v22)
            {
              int64_t v23 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v23 = v24 + 1;
              if (__OFADD__(v24, 1)) {
                goto LABEL_36;
              }
              if (v23 >= v32) {
                break;
              }
              unint64_t v22 = *(void *)(v33 + 8 * v23);
              ++v24;
              if (v22) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_1000131FC();
          return (unint64_t)v3;
        }
      }
    }
  }
LABEL_26:
  unint64_t v6 = (v22 - 1) & v22;
  unint64_t v20 = __clz(__rbit64(v22)) + (v23 << 6);
  for (i = v23; ; unint64_t v20 = v19 | (i << 6))
  {
    BOOL v25 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v20);
    uint64_t v36 = *v25;
    uint64_t v37 = v25[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100006ABC(a2);
    swift_dynamicCast();
    sub_1000131EC(v7, v8);
    sub_1000131EC(v8, v41);
    sub_1000131EC(v41, &v39);
    unint64_t result = sub_10002E8BC(v36, v37);
    unint64_t v26 = result;
    if (v27)
    {
      unint64_t v34 = v6;
      unint64_t v12 = v8;
      int64_t v13 = v7;
      uint64_t v14 = v2;
      int64_t v15 = i;
      int64_t v16 = v11;
      id v17 = (uint64_t *)(v3[6] + 16 * result);
      swift_bridgeObjectRelease();
      *id v17 = v36;
      v17[1] = v37;
      unint64_t v11 = v16;
      int64_t i = v15;
      uint64_t v2 = v14;
      id v7 = v13;
      int64_t v8 = v12;
      unint64_t v6 = v34;
      uint64_t v18 = (_OWORD *)(v3[7] + 32 * v26);
      sub_100006BA8((uint64_t)v18);
      unint64_t result = (unint64_t)sub_1000131EC(&v39, v18);
      if (!v34) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v3[2] >= v3[3]) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v28 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v28 = v36;
    v28[1] = v37;
    unint64_t result = (unint64_t)sub_1000131EC(&v39, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v29 = v3[2];
    BOOL v30 = __OFADD__(v29, 1);
    uint64_t v31 = v29 + 1;
    if (v30) {
      goto LABEL_34;
    }
    v3[2] = v31;
    if (!v6) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v19 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

id sub_100011858(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = *(void **)(v3 + OBJC_IVAR____TtC21contactsdonationagent19DonationPersistence_dataProxy);
  URL._bridgeToObjectiveC()((NSURL *)OBJC_IVAR____TtC21contactsdonationagent19DonationPersistence_dataProxy);
  int64_t v8 = v7;
  id v9 = [v6 dataWithContentsOfURL:v7];

  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  unint64_t v20 = sub_1000134C4;
  uint64_t v21 = v10;
  int64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 1107296256;
  uint64_t v18 = sub_100011DE4;
  unint64_t v19 = &unk_1000459B0;
  unint64_t v11 = _Block_copy(&v16);
  swift_retain();
  swift_release();
  id v12 = [v9 flatMap:v11];
  _Block_release(v11);

  unint64_t v20 = sub_100011DEC;
  uint64_t v21 = 0;
  int64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 1107296256;
  uint64_t v18 = sub_100011E68;
  unint64_t v19 = &unk_1000459D8;
  int64_t v13 = _Block_copy(&v16);
  swift_release();
  id v14 = [v12 recover:v13];
  _Block_release(v13);

  return v14;
}

id sub_100011A20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = *(void **)(v3 + OBJC_IVAR____TtC21contactsdonationagent19DonationPersistence_dataProxy);
  URL._bridgeToObjectiveC()((NSURL *)OBJC_IVAR____TtC21contactsdonationagent19DonationPersistence_dataProxy);
  int64_t v8 = v7;
  id v9 = [v6 dataWithContentsOfURL:v7];

  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a2;
  *(void *)(v10 + 24) = a3;
  unint64_t v20 = (id (*)(uint64_t))sub_1000135C8;
  uint64_t v21 = v10;
  int64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 1107296256;
  uint64_t v18 = sub_100011DE4;
  unint64_t v19 = &unk_100045A28;
  unint64_t v11 = _Block_copy(&v16);
  swift_retain();
  swift_release();
  id v12 = [v9 flatMap:v11];
  _Block_release(v11);

  unint64_t v20 = sub_100011DF8;
  uint64_t v21 = 0;
  int64_t v16 = _NSConcreteStackBlock;
  uint64_t v17 = 1107296256;
  uint64_t v18 = sub_100011E68;
  unint64_t v19 = &unk_100045A50;
  int64_t v13 = _Block_copy(&v16);
  swift_release();
  id v14 = [v12 recover:v13];
  _Block_release(v13);

  return v14;
}

id sub_100011BE8(uint64_t a1, uint64_t (*a2)())
{
  v11[0] = 0;
  if (![self objectWithData:a1 error:v11])
  {
    id v5 = v11[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
    unint64_t v6 = (void *)_convertErrorToNSError(_:)();
    id v4 = [self futureWithError:v6];
    swift_errorRelease();

    return v4;
  }
  id v3 = v11[0];
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_100006ABC(&qword_10004DDB8);
  if (swift_dynamicCast())
  {
    id v4 = (id)a2();
    swift_bridgeObjectRelease();
    return v4;
  }
  id result = +[NSError errorWithDomain:CNDonationErrorDomain code:502 userInfo:0];
  if (result)
  {
    int64_t v8 = result;
    id v9 = (void *)_convertErrorToNSError(_:)();
    id v10 = [self futureWithError:v9];

    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_100011DE4(uint64_t a1, void *a2)
{
  return sub_100012ABC(a1, a2);
}

id sub_100011DEC(uint64_t a1)
{
  return sub_100011E04(a1, (Class *)NSDictionary_ptr);
}

id sub_100011DF8(uint64_t a1)
{
  return sub_100011E04(a1, (Class *)NSArray_ptr);
}

id sub_100011E04(uint64_t a1, Class *a2)
{
  id v2 = [objc_allocWithZone(*a2) init];
  id v3 = [self futureWithResult:v2];

  return v3;
}

id sub_100011E68(uint64_t a1, void *a2)
{
  return sub_100012ABC(a1, a2);
}

uint64_t sub_100011E70()
{
  return sub_100012148(0x6E6F6974616E6F64, 0xEF7473696C702E73, (uint64_t)sub_100011EBC, (uint64_t (*)(char *, uint64_t, void))sub_100011A20);
}

id sub_100011EBC(uint64_t a1)
{
  unint64_t v15 = (unint64_t)&_swiftEmptyArrayStorage;
  if (*(void *)(a1 + 16))
  {
    unint64_t v2 = sub_10002E8BC(0x6E6F6974616E6F64, 0xE900000000000073);
    if (v3)
    {
      sub_1000134E0(*(void *)(a1 + 56) + 32 * v2, (uint64_t)v14);
      sub_100006ABC(&qword_10004DDC8);
      if (swift_dynamicCast())
      {
        uint64_t v4 = *(void *)(v13 + 16);
        if (v4)
        {
          swift_bridgeObjectRetain();
          for (uint64_t i = 0; i != v4; ++i)
          {
            uint64_t v6 = swift_bridgeObjectRetain();
            sub_100011138(v6);
            id v7 = objc_allocWithZone((Class)CNDonationValue);
            Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease();
            id v9 = [v7 initWithPropertyListRepresentation:isa];

            if (v9)
            {
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
              }
              specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
              specialized Array._endMutation()();
            }
            swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease_n();
        }
        else
        {
          swift_bridgeObjectRelease();
        }
      }
    }
  }
  sub_100006C44(0, (unint64_t *)&qword_10004D4A0);
  swift_bridgeObjectRetain();
  Class v10 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v11 = [self futureWithResult:v10];

  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_100012104()
{
  return sub_100012148(0xD000000000000015, 0x800000010003A8E0, (uint64_t)sub_100012330, (uint64_t (*)(char *, uint64_t, void))sub_100011858);
}

uint64_t sub_100012148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(char *, uint64_t, void))
{
  uint64_t v20 = a3;
  uint64_t v21 = a4;
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = __chkstk_darwin(v4, v6);
  id v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7, v10);
  id v12 = (char *)&v20 - v11;
  id v13 = objc_allocWithZone((Class)NSString);
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = [v13 initWithString:v14];

  id v16 = [v15 stringByExpandingTildeInPath];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  URL.init(fileURLWithPath:isDirectory:)();
  swift_bridgeObjectRelease();
  URL.appendingPathComponent(_:isDirectory:)();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v5 + 8);
  v17(v9, v4);
  uint64_t v18 = v21(v12, v20, 0);
  v17(v12, v4);
  return v18;
}

uint64_t sub_100012330(uint64_t a1)
{
  unint64_t v2 = (void *)sub_100026D58((uint64_t)_swiftEmptyArrayStorage);
  if (!*(void *)(a1 + 16)
    || (unint64_t v3 = sub_10002E8BC(0x736E6F6973726576, 0xE800000000000000), (v4 & 1) == 0)
    || (sub_1000134E0(*(void *)(a1 + 56) + 32 * v3, (uint64_t)&v45),
        sub_100006ABC(&qword_10004DDB8),
        (swift_dynamicCast() & 1) == 0))
  {
LABEL_44:
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v35 = [self futureWithResult:isa];

    return (uint64_t)v35;
  }
  int64_t v5 = 0;
  uint64_t v6 = v43;
  uint64_t v40 = v43 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(v43 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(v43 + 64);
  int64_t v41 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v37 = v43 + 104;
  while (1)
  {
    if (v9)
    {
      unint64_t v10 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v11 = v10 | (v5 << 6);
      goto LABEL_9;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      break;
    }
    if (v15 >= v41)
    {
      int64_t v17 = v5;
LABEL_15:
      unint64_t v9 = 0;
      memset(v44, 0, sizeof(v44));
      int64_t v5 = v17;
      long long v43 = 0u;
      goto LABEL_16;
    }
    unint64_t v16 = *(void *)(v40 + 8 * v15);
    if (!v16)
    {
      int64_t v17 = v5 + 1;
      if (v5 + 2 >= v41) {
        goto LABEL_15;
      }
      unint64_t v16 = *(void *)(v40 + 8 * (v5 + 2));
      if (v16)
      {
        int64_t v15 = v5 + 2;
      }
      else
      {
        int64_t v17 = v5 + 2;
        if (v5 + 3 >= v41) {
          goto LABEL_15;
        }
        unint64_t v16 = *(void *)(v40 + 8 * (v5 + 3));
        if (v16)
        {
          int64_t v15 = v5 + 3;
        }
        else
        {
          int64_t v15 = v5 + 4;
          int64_t v17 = v5 + 3;
          if (v5 + 4 >= v41) {
            goto LABEL_15;
          }
          unint64_t v16 = *(void *)(v40 + 8 * v15);
          if (!v16)
          {
            while (v41 - 5 != v5)
            {
              unint64_t v16 = *(void *)(v37 + 8 * v5++);
              if (v16)
              {
                int64_t v15 = v5 + 4;
                goto LABEL_13;
              }
            }
            int64_t v17 = v41 - 1;
            goto LABEL_15;
          }
        }
      }
    }
LABEL_13:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v11 = __clz(__rbit64(v16)) + (v15 << 6);
    int64_t v5 = v15;
LABEL_9:
    uint64_t v12 = *(void *)(v6 + 56);
    id v13 = (void *)(*(void *)(v6 + 48) + 16 * v11);
    uint64_t v14 = v13[1];
    *(void *)&long long v43 = *v13;
    *((void *)&v43 + 1) = v14;
    sub_1000134E0(v12 + 32 * v11, (uint64_t)v44);
    swift_bridgeObjectRetain();
LABEL_16:
    sub_10001353C((uint64_t)&v43, (uint64_t)&v45);
    uint64_t v18 = v46;
    if (!v46)
    {
      swift_release();
      goto LABEL_44;
    }
    uint64_t v19 = v45;
    sub_1000131EC(&v47, &v43);
    if (swift_dynamicCast())
    {
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(void *)&long long v43 = v2;
      unint64_t v20 = sub_10002E8BC(v19, v18);
      uint64_t v22 = v2[2];
      BOOL v23 = (v21 & 1) == 0;
      BOOL v24 = __OFADD__(v22, v23);
      uint64_t v25 = v22 + v23;
      if (v24) {
        goto LABEL_46;
      }
      if (v2[3] >= v25)
      {
        if (isUniquelyReferenced_nonNull_native)
        {
          unint64_t v2 = (void *)v43;
          if (v21) {
            goto LABEL_29;
          }
        }
        else
        {
          unint64_t v39 = v20;
          char v29 = v21;
          sub_10002F904();
          char v30 = v29;
          unint64_t v20 = v39;
          unint64_t v2 = (void *)v43;
          if (v30) {
            goto LABEL_29;
          }
        }
      }
      else
      {
        char v26 = v21;
        sub_10002EB24(v25, isUniquelyReferenced_nonNull_native);
        unint64_t v20 = sub_10002E8BC(v19, v18);
        if ((v26 & 1) != (v27 & 1)) {
          goto LABEL_48;
        }
        char v28 = v26;
        unint64_t v2 = (void *)v43;
        if (v28)
        {
LABEL_29:
          *(void *)(v2[7] + 8 * v20) = v42;
          goto LABEL_42;
        }
      }
      v2[(v20 >> 6) + 8] |= 1 << v20;
      uint64_t v31 = (uint64_t *)(v2[6] + 16 * v20);
      uint64_t *v31 = v19;
      v31[1] = v18;
      *(void *)(v2[7] + 8 * v20) = v42;
      uint64_t v32 = v2[2];
      BOOL v24 = __OFADD__(v32, 1);
      uint64_t v33 = v32 + 1;
      if (v24) {
        goto LABEL_47;
      }
      v2[2] = v33;
      swift_bridgeObjectRetain();
LABEL_42:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

id sub_10001277C()
{
  uint64_t v1 = v0;
  unint64_t v2 = self;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v24[0] = 0;
  id v4 = [v2 dataWithObject:isa error:v24];

  id v5 = v24[0];
  if (v4)
  {
    uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v8 = v7;

    unint64_t v9 = *(void **)&v0[OBJC_IVAR____TtC21contactsdonationagent19DonationPersistence_dataProxy];
    Class v10 = Data._bridgeToObjectiveC()().super.isa;
    URL._bridgeToObjectiveC()(v11);
    id v13 = v12;
    id v14 = [v9 writeData:v10 toURL:v12 options:1];

    int64_t v15 = (void *)swift_allocObject();
    v15[2] = v1;
    v24[4] = sub_10001323C;
    v24[5] = v15;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = (id)1107296256;
    v24[2] = sub_100011DE4;
    v24[3] = &unk_100045960;
    unint64_t v16 = _Block_copy(v24);
    id v17 = v1;
    swift_release();
    id v18 = [v14 flatMap:v16];
    sub_100009AA0(v6, v8);

    _Block_release(v16);
    return v18;
  }
  else
  {
    unint64_t v20 = v5;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
    id result = +[NSError errorWithDomain:CNDonationErrorDomain code:501 userInfo:0];
    if (result)
    {
      char v21 = result;
      uint64_t v22 = (void *)_convertErrorToNSError(_:)();
      id v23 = [self futureWithError:v22];

      return v23;
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

id sub_100012A44()
{
  sub_10001325C();
  sub_100006C44(0, (unint64_t *)&qword_10004DCB8);
  Class isa = NSNumber.init(BOOLeanLiteral:)(1).super.super.isa;
  id v1 = [self futureWithResult:isa];

  return v1;
}

id sub_100012ABC(uint64_t a1, void *a2)
{
  unint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  id v5 = (void *)v3();
  swift_release();

  return v5;
}

uint64_t sub_100012B30(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = __chkstk_darwin(v4, v6);
  uint64_t v36 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7, v9);
  unint64_t v11 = (char *)&v32 - v10;
  sub_100006ABC(&qword_10004DDA8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100038E00;
  *(void *)(inited + 32) = 0x6E6F6974616E6F64;
  *(void *)(inited + 40) = 0xE900000000000073;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v14 = _swiftEmptyArrayStorage;
  uint64_t v37 = v11;
  if (!v13)
  {
LABEL_13:
    *(void *)(inited + 48) = v14;
    unint64_t v23 = sub_100026F9C(inited);
    id v24 = objc_allocWithZone((Class)NSString);
    NSString v25 = String._bridgeToObjectiveC()();
    id v26 = [v24 initWithString:v25];

    id v27 = [v26 stringByExpandingTildeInPath];
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    char v28 = v36;
    URL.init(fileURLWithPath:isDirectory:)();
    swift_bridgeObjectRelease();
    char v29 = v37;
    URL.appendingPathComponent(_:isDirectory:)();
    char v30 = *(void (**)(char *, uint64_t))(v5 + 8);
    v30(v28, v4);
    sub_100011500(v23, &qword_10004DDB0);
    swift_bridgeObjectRelease();
    id v31 = sub_10001277C();
    swift_bridgeObjectRelease();
    v30(v29, v4);
    return (uint64_t)v31;
  }
  uint64_t v35 = inited;
  uint64_t v38 = _swiftEmptyArrayStorage;
  uint64_t result = sub_10002E5A4(0, v13 & ~(v13 >> 63), 0);
  if ((v13 & 0x8000000000000000) == 0)
  {
    uint64_t v32 = v5;
    uint64_t v33 = v2;
    uint64_t v34 = v4;
    uint64_t v16 = 0;
    id v14 = v38;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v17 = *(id *)(a1 + 8 * v16 + 32);
      }
      id v18 = v17;
      id v19 = objc_msgSend(v17, "propertyListRepresentation", v32, v33, v34);
      uint64_t v20 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v38 = v14;
      unint64_t v22 = v14[2];
      unint64_t v21 = v14[3];
      if (v22 >= v21 >> 1)
      {
        sub_10002E5A4(v21 > 1, v22 + 1, 1);
        id v14 = v38;
      }
      ++v16;
      v14[2] = v22 + 1;
      v14[v22 + 4] = v20;
    }
    while (v13 != v16);
    uint64_t v4 = v34;
    uint64_t v5 = v32;
    uint64_t inited = v35;
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

id sub_100012EF0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v5 = __chkstk_darwin(v2, v4);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v8);
  uint64_t v10 = (char *)&v20 - v9;
  sub_100006ABC(&qword_10004DD90);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100038E00;
  *(void *)(inited + 32) = 0x736E6F6973726576;
  *(void *)(inited + 40) = 0xE800000000000000;
  *(void *)(inited + 48) = a1;
  swift_bridgeObjectRetain();
  unint64_t v12 = sub_100026E6C(inited);
  id v13 = objc_allocWithZone((Class)NSString);
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = [v13 initWithString:v14];

  id v16 = [v15 stringByExpandingTildeInPath];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  URL.init(fileURLWithPath:isDirectory:)();
  swift_bridgeObjectRelease();
  URL.appendingPathComponent(_:isDirectory:)();
  id v17 = *(void (**)(char *, uint64_t))(v3 + 8);
  v17(v7, v2);
  sub_100011500(v12, &qword_10004DDA0);
  swift_bridgeObjectRelease();
  id v18 = sub_10001277C();
  swift_bridgeObjectRelease();
  v17(v10, v2);
  return v18;
}

id sub_100013184()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DonationPersistence();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DonationPersistence()
{
  return self;
}

_OWORD *sub_1000131EC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000131FC()
{
  return swift_release();
}

uint64_t sub_100013204()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_10001323C()
{
  return sub_100012A44();
}

uint64_t sub_100013244(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100013254()
{
  return swift_release();
}

uint64_t sub_10001325C()
{
  uint64_t v0 = type metadata accessor for URL();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = type metadata accessor for URLResourceValues();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = &v15[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  URLResourceValues.init()();
  URLResourceValues.isExcludedFromBackup.setter();
  id v10 = objc_allocWithZone((Class)NSString);
  NSString v11 = String._bridgeToObjectiveC()();
  id v12 = [v10 initWithString:v11];

  id v13 = [v12 stringByExpandingTildeInPath];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  URL.init(fileURLWithPath:isDirectory:)();
  swift_bridgeObjectRelease();
  URL.setResourceValues(_:)();
  (*(void (**)(unsigned char *, uint64_t))(v1 + 8))(v4, v0);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t sub_10001348C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

id sub_1000134C4(uint64_t a1)
{
  return sub_100011BE8(a1, *(uint64_t (**)())(v1 + 16));
}

uint64_t sub_1000134E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10001353C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006ABC(&qword_10004DDC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000135CC()
{
  uint64_t v1 = OBJC_IVAR____TtC21contactsdonationagent26DonationPreferencesMonitor_notificationToken;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC21contactsdonationagent26DonationPreferencesMonitor_notificationToken];
  if (v2) {
    [v2 cancel];
  }
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC21contactsdonationagent26DonationPreferencesMonitor_observable];
  uint64_t v4 = self;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v0;
  id v11[4] = sub_100013B20;
  v11[5] = v5;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_100027418;
  v11[3] = &unk_100045AA0;
  uint64_t v6 = _Block_copy(v11);
  uint64_t v7 = v0;
  swift_release();
  id v8 = [v4 observerWithResultBlock:v6];
  _Block_release(v6);
  id v9 = [v3 subscribe:v8];
  swift_unknownObjectRelease();
  *(void *)&v0[v1] = v9;
  return swift_unknownObjectRelease();
}

void *sub_100013720(uint64_t a1, char *a2)
{
  sub_1000134E0(a1, (uint64_t)aBlock);
  sub_100013B40();
  swift_dynamicCast();
  id v3 = v15;
  unsigned int v4 = [v15 BOOLValue];

  uint64_t v5 = *(void (**)(void))&a2[OBJC_IVAR____TtC21contactsdonationagent26DonationPreferencesMonitor_onSuppress];
  if (v5)
  {
    swift_retain();
    v5(v4 ^ 1);
    sub_100013B80((uint64_t)v5);
  }
  uint64_t v6 = OBJC_IVAR____TtC21contactsdonationagent26DonationPreferencesMonitor_delayToken;
  uint64_t result = *(void **)&a2[OBJC_IVAR____TtC21contactsdonationagent26DonationPreferencesMonitor_delayToken];
  if (!v4)
  {
    if (result) {
      [result cancel];
    }
    id v8 = [*(id *)&a2[OBJC_IVAR____TtC21contactsdonationagent26DonationPreferencesMonitor_schedulerProvider] backgroundScheduler];
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = a2;
    *(unsigned char *)(v9 + 24) = 0;
    aBlock[4] = sub_100013BC8;
    aBlock[5] = v9;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100026380;
    aBlock[3] = &unk_100045AF0;
    id v10 = _Block_copy(aBlock);
    NSString v11 = a2;
    swift_release();
    id v12 = [v8 afterDelay:v10 performBlock:30.0];
    swift_unknownObjectRelease();
    _Block_release(v10);
    *(void *)&a2[v6] = v12;
    return (void *)swift_unknownObjectRelease();
  }
  if (result)
  {
    [result cancel];
    *(void *)&a2[v6] = 0;
    return (void *)swift_unknownObjectRelease();
  }
  id v13 = *(void (**)(uint64_t))&a2[OBJC_IVAR____TtC21contactsdonationagent26DonationPreferencesMonitor_onEnable];
  if (v13)
  {
    swift_retain();
    v13(1);
    return (void *)sub_100013B80((uint64_t)v13);
  }
  return result;
}

uint64_t sub_10001394C(uint64_t result, char a2)
{
  uint64_t v2 = *(void (**)(void))(result
                                     + OBJC_IVAR____TtC21contactsdonationagent26DonationPreferencesMonitor_onEnable);
  if (v2)
  {
    swift_retain();
    v2(a2 & 1);
    return sub_100013B80((uint64_t)v2);
  }
  return result;
}

id sub_1000139FC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DonationPreferencesMonitor();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DonationPreferencesMonitor()
{
  return self;
}

uint64_t sub_100013AE8()
{
  return _swift_deallocObject(v0, 24, 7);
}

void *sub_100013B20(uint64_t a1)
{
  return sub_100013720(a1, *(char **)(v1 + 16));
}

uint64_t sub_100013B28(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100013B38()
{
  return swift_release();
}

unint64_t sub_100013B40()
{
  unint64_t result = qword_10004DCB8;
  if (!qword_10004DCB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10004DCB8);
  }
  return result;
}

uint64_t sub_100013B80(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100013B90()
{
  return _swift_deallocObject(v0, 25, 7);
}

uint64_t sub_100013BC8()
{
  return sub_10001394C(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

id sub_100013BD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = &v3[OBJC_IVAR____TtC21contactsdonationagent26DonationPreferencesMonitor_onSuppress];
  *(void *)uint64_t v7 = 0;
  *((void *)v7 + 1) = 0;
  id v8 = &v3[OBJC_IVAR____TtC21contactsdonationagent26DonationPreferencesMonitor_onEnable];
  *(void *)id v8 = 0;
  *((void *)v8 + 1) = 0;
  *(void *)&v3[OBJC_IVAR____TtC21contactsdonationagent26DonationPreferencesMonitor_notificationToken] = 0;
  *(void *)&v3[OBJC_IVAR____TtC21contactsdonationagent26DonationPreferencesMonitor_delayToken] = 0;
  swift_getObjectType();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  id v10 = v3;
  id v11 = [ObjCClassFromMetadata observableWithPreferences:a1 notificationCenter:a2 schedulerProvider:a3];
  *(void *)&v10[OBJC_IVAR____TtC21contactsdonationagent26DonationPreferencesMonitor_observable] = v11;
  *(void *)&v10[OBJC_IVAR____TtC21contactsdonationagent26DonationPreferencesMonitor_schedulerProvider] = a3;
  swift_unknownObjectRetain();

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for DonationPreferencesMonitor();
  return objc_msgSendSuper2(&v13, "init");
}

void sub_100013CC8(unint64_t a1, char *a2)
{
  if (sub_100019820(a1, (uint64_t)_swiftEmptyArrayStorage))
  {
    id v3 = *(void **)&a2[OBJC_IVAR____TtC21contactsdonationagent14SIMCardMonitor_agent];
    unsigned int v4 = (void *)CNDonationSIMCardBundleIdentifier;
    aBlock[4] = sub_100013EB8;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100026BC4;
    aBlock[3] = &unk_100045B18;
    uint64_t v5 = _Block_copy(aBlock);
    id v6 = v4;
    [v3 removeDonatedMeCardValuesWithBundleIdentifier:v6 completionHandler:v5];
    _Block_release(v5);

    return;
  }
  if (a1 >> 62)
  {
    objc_super v13 = a2;
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    if (!v7) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v8 = a2;
    swift_bridgeObjectRetain();
    if (!v7) {
      goto LABEL_12;
    }
  }
  if (v7 < 1)
  {
    __break(1u);
    return;
  }
  uint64_t v9 = 0;
  id v10 = *(void **)&a2[OBJC_IVAR____TtC21contactsdonationagent14SIMCardMonitor_agent];
  do
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v11 = *(id *)(a1 + 8 * v9 + 32);
    }
    id v12 = v11;
    ++v9;
    sub_100014328(v11, v10);
  }
  while (v7 != v9);
LABEL_12:
  swift_bridgeObjectRelease();
}

void sub_100013EB8(char a1, uint64_t a2)
{
  if ((a1 & 1) == 0)
  {
    sub_100006ABC((uint64_t *)&unk_10004D4F0);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_100038E00;
    _StringGuts.grow(_:)(43);
    v4._object = (void *)0x800000010003AAF0;
    v4._countAndFlagsBits = 0xD000000000000029;
    String.append(_:)(v4);
    if (a2)
    {
      sub_100006ABC(&qword_10004E9A0);
      _print_unlocked<A, B>(_:_:)();
      *(void *)(v3 + 56) = &type metadata for String;
      *(void *)(v3 + 32) = 0;
      *(void *)(v3 + 40) = 0xE000000000000000;
      print(_:separator:terminator:)();
      swift_bridgeObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_100013FBC(uint64_t result)
{
  if (result)
  {
    sub_100006ABC((uint64_t *)&unk_10004D4F0);
    uint64_t v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_100038E00;
    _StringGuts.grow(_:)(38);
    v2._object = (void *)0x800000010003AB40;
    v2._countAndFlagsBits = 0xD000000000000024;
    String.append(_:)(v2);
    sub_100006ABC(&qword_10004E9A0);
    _print_unlocked<A, B>(_:_:)();
    *(void *)(v1 + 56) = &type metadata for String;
    *(void *)(v1 + 32) = 0;
    *(void *)(v1 + 40) = 0xE000000000000000;
    print(_:separator:terminator:)();
    return swift_bridgeObjectRelease();
  }
  return result;
}

id sub_1000140EC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SIMCardMonitor();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SIMCardMonitor()
{
  return self;
}

id sub_1000141A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = v6;
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v12 = type metadata accessor for Date();
  uint64_t v13 = *(void *)(v12 - 8);
  NSString v14 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  Class isa = 0;
  if (v14(a5, 1, v12) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a5, v12);
  }
  if (v14(a6, 1, v12) == 1)
  {
    Class v16 = 0;
  }
  else
  {
    Class v16 = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a6, v12);
  }
  id v17 = [v7 initWithBundleIdentifier:v10 donationIdentifier:v11 donationDate:isa expirationDate:v16];

  return v17;
}

void sub_100014328(void *a1, void *a2)
{
  uint64_t v4 = sub_100006ABC((uint64_t *)&unk_10004DF40);
  uint64_t v6 = __chkstk_darwin(v4 - 8, v5);
  id v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v9);
  NSString v11 = (char *)&v43 - v10;
  id v12 = [a1 value];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  id v13 = objc_allocWithZone((Class)CNPhoneNumber);
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v15 = [v13 initWithStringValue:v14];

  if (v15)
  {
    id v16 = [a1 identifier];
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v19 = v18;

    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v22 = v21;
    swift_bridgeObjectRetain();
    Date.init()();
    uint64_t v23 = type metadata accessor for Date();
    id v24 = *(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56);
    id v44 = a2;
    v24(v11, 0, 1, v23);
    static Date.distantFuture.getter();
    v24(v8, 0, 1, v23);
    id v25 = objc_allocWithZone((Class)CNDonationOrigin);
    id v26 = sub_1000141A0(v20, v22, v17, v19, (uint64_t)v11, (uint64_t)v8);
    swift_bridgeObjectRelease();
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v27 = v15;
    id v28 = v26;
    NSString v29 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v30 = [self donationValueWithPhoneNumber:v27 label:v29 origin:v28];

    sub_100006ABC((uint64_t *)&unk_10004E1B0);
    uint64_t v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_1000395C0;
    *(void *)(v31 + 32) = v30;
    long long aBlock = (void **)v31;
    specialized Array._endMutation()();
    sub_100007C58();
    id v32 = v30;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v49 = sub_100013FBC;
    uint64_t v50 = 0;
    long long aBlock = _NSConcreteStackBlock;
    unint64_t v46 = 1107296256;
    long long v47 = sub_100026B58;
    uint64_t v48 = &unk_100045B40;
    uint64_t v34 = _Block_copy(&aBlock);
    [v44 donateMeCardValues:isa completionHandler:v34];
    _Block_release(v34);
  }
  else
  {
    sub_100006ABC((uint64_t *)&unk_10004D4F0);
    uint64_t v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_100038E00;
    long long aBlock = 0;
    unint64_t v46 = 0xE000000000000000;
    _StringGuts.grow(_:)(33);
    swift_bridgeObjectRelease();
    long long aBlock = (void **)0xD00000000000001FLL;
    unint64_t v46 = 0x800000010003AB20;
    id v36 = [a1 value];
    uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v39 = v38;

    v40._countAndFlagsBits = v37;
    v40._object = v39;
    String.append(_:)(v40);
    swift_bridgeObjectRelease();
    int64_t v41 = aBlock;
    unint64_t v42 = v46;
    *(void *)(v35 + 56) = &type metadata for String;
    *(void *)(v35 + 32) = v41;
    *(void *)(v35 + 40) = v42;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000147C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000147D0()
{
  return swift_release();
}

id sub_1000147E0()
{
  [*(id *)&v0[OBJC_IVAR____TtC21contactsdonationagent18MaintenanceService_logger] maintenanceServiceWillStop];
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MaintenanceService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_100014988()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MaintenanceService.ListenerDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_1000149CC()
{
  uint64_t v1 = OBJC_IVAR____TtC21contactsdonationagent18MaintenanceService_listener;
  id v2 = objc_allocWithZone((Class)NSXPCListener);
  uint64_t v3 = v0;
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = [v2 initWithMachServiceName:v4];

  *(void *)&v0[v1] = v5;
  *(void *)&v3[OBJC_IVAR____TtC21contactsdonationagent18MaintenanceService_listenerDelegate] = 0;
  uint64_t v6 = OBJC_IVAR____TtC21contactsdonationagent18MaintenanceService_agent;
  *(void *)&v3[v6] = [objc_allocWithZone((Class)type metadata accessor for MaintenanceAgent()) init];
  uint64_t v7 = OBJC_IVAR____TtC21contactsdonationagent18MaintenanceService_logger;
  id v8 = objc_msgSend(objc_msgSend(self, "defaultProvider"), "agentLogger");
  swift_unknownObjectRelease();
  *(void *)&v3[v7] = v8;

  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for MaintenanceService();
  return objc_msgSendSuper2(&v10, "init");
}

uint64_t type metadata accessor for MaintenanceService()
{
  return self;
}

uint64_t type metadata accessor for MaintenanceService.ListenerDelegate()
{
  return self;
}

uint64_t sub_100014B64(void *a1)
{
  id v3 = objc_msgSend(objc_msgSend(self, "defaultProvider"), "agentLogger");
  swift_unknownObjectRelease();
  objc_msgSend(v3, "acceptingConnectionFromProcess:", objc_msgSend(a1, "processIdentifier"));
  swift_unknownObjectRelease();
  id v4 = [self interfaceWithProtocol:&OBJC_PROTOCOL___DonationMaintenanceProtocol];
  [a1 setExportedInterface:v4];

  [a1 setExportedObject:*(void *)(v1 + OBJC_IVAR____TtCC21contactsdonationagent18MaintenanceService16ListenerDelegate_agent)];
  [a1 resume];
  return 1;
}

uint64_t sub_100014C74()
{
  uint64_t v1 = sub_100006ABC((uint64_t *)&unk_10004E060);
  __chkstk_darwin(v1 - 8, v2);
  id v4 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for CollectedSuppressionResult(0);
  uint64_t v6 = v5 - 8;
  uint64_t v39 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v39 + 64);
  uint64_t v9 = __chkstk_darwin(v5, v8);
  uint64_t v11 = __chkstk_darwin(v9, v10);
  id v13 = (char *)&v38 - v12;
  uint64_t v15 = __chkstk_darwin(v11, v14);
  uint64_t v17 = (char *)&v38 - v16;
  __chkstk_darwin(v15, v18);
  uint64_t v20 = (char *)&v38 - v19;
  uint64_t v41 = v0;
  sub_100016818(v0 + OBJC_IVAR____TtC21contactsdonationagent16ContactRebuilder_curatedName, (uint64_t)v4);
  *(void *)&v17[*(int *)(v6 + 28)] = &_swiftEmptySetSingleton;
  *(void *)&v17[*(int *)(v6 + 32)] = &_swiftEmptySetSingleton;
  uint64_t v21 = type metadata accessor for PersonNameComponents();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v4, 1, v21) == 1) {
    sub_100016880((uint64_t)v4);
  }
  else {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v17, v4, v21);
  }
  uint64_t v42 = (uint64_t)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NameSuppressionStatus(0);
  swift_storeEnumTagMultiPayload();
  sub_1000168E0((uint64_t)v17, (uint64_t)v20);
  uint64_t v40 = OBJC_IVAR____TtC21contactsdonationagent16ContactRebuilder_filteredDonations;
  unint64_t v23 = *(void *)(v41 + OBJC_IVAR____TtC21contactsdonationagent16ContactRebuilder_filteredDonations);
  if (v23 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v24 = result;
    if (!result) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v24) {
      goto LABEL_13;
    }
  }
  if (v24 < 1)
  {
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v24; ++i)
  {
    if ((v23 & 0xC000000000000001) != 0) {
      id v27 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v27 = *(id *)(v23 + 8 * i + 32);
    }
    id v28 = v27;
    sub_100034D7C(v27);
  }
LABEL_13:
  swift_bridgeObjectRelease();
  unint64_t v29 = *(void *)(v41 + v40);
  sub_100016944((uint64_t)v20, (uint64_t)v13);
  uint64_t v30 = v42;
  sub_100016944((uint64_t)v13, v42);
  unint64_t v31 = (*(unsigned __int8 *)(v39 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  uint64_t v32 = swift_allocObject();
  sub_1000168E0((uint64_t)v13, v32 + v31);
  uint64_t v43 = &_swiftEmptyArrayStorage;
  if (v29 >> 62) {
    goto LABEL_28;
  }
  uint64_t v33 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v33)
  {
    while (1)
    {
      uint64_t v39 = v32;
      unint64_t v34 = 0;
      while ((v29 & 0xC000000000000001) != 0)
      {
        id v35 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_21:
        id v36 = v35;
        uint64_t v32 = v34 + 1;
        if (__OFADD__(v34, 1)) {
          goto LABEL_27;
        }
        if (sub_10003553C(v35))
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          uint64_t v30 = v42;
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
        else
        {
        }
        ++v34;
        if (v32 == v33)
        {
          uint64_t v37 = v43;
          goto LABEL_30;
        }
      }
      if (v34 < *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      swift_bridgeObjectRetain();
      uint64_t v33 = _CocoaArrayWrapper.endIndex.getter();
      if (!v33) {
        goto LABEL_29;
      }
    }
    id v35 = *(id *)(v29 + 8 * v34 + 32);
    goto LABEL_21;
  }
LABEL_29:
  uint64_t v37 = &_swiftEmptyArrayStorage;
LABEL_30:
  swift_release();
  swift_bridgeObjectRelease();
  sub_100016AC4(v30);
  *(void *)(v41 + v40) = v37;
  swift_bridgeObjectRelease();
  return sub_100016AC4((uint64_t)v20);
}

char *sub_1000150F8()
{
  uint64_t v1 = v0;
  id v2 = objc_allocWithZone((Class)type metadata accessor for ContactRebuilder.EmailAddressCollector());
  uint64_t v3 = swift_bridgeObjectRetain();
  id v4 = (char *)sub_1000154F0(v3);
  uint64_t v5 = OBJC_IVAR____TtC21contactsdonationagent16ContactRebuilder_filteredDonations;
  unint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC21contactsdonationagent16ContactRebuilder_filteredDonations);
  if (!(v6 >> 62))
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    uint64_t result = v4;
    if (v7) {
      goto LABEL_3;
    }
LABEL_10:

    swift_bridgeObjectRelease_n();
    id v13 = &v4[OBJC_IVAR____TtCC21contactsdonationagent16ContactRebuilderP33_2C692544C68117D64033B26435CA0EDA21EmailAddressCollector_donations];
    swift_beginAccess();
    *(void *)(v1 + v5) = *(void *)v13;
    swift_bridgeObjectRetain();

    return (char *)swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain_n();
  uint64_t v12 = v4;
  uint64_t result = (char *)_CocoaArrayWrapper.endIndex.getter();
  uint64_t v7 = (uint64_t)result;
  if (!result) {
    goto LABEL_10;
  }
LABEL_3:
  if (v7 >= 1)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if ((v6 & 0xC000000000000001) != 0) {
        id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v10 = *(id *)(v6 + 8 * i + 32);
      }
      uint64_t v11 = v10;
      [v10 acceptDonationValueVisitor:v4];
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100015280()
{
  uint64_t v1 = (char *)[objc_allocWithZone((Class)type metadata accessor for ContactBuilder()) init];
  unint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC21contactsdonationagent16ContactRebuilder_filteredDonations);
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v3 = result;
    if (!result) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v3) {
      goto LABEL_13;
    }
  }
  if (v3 < 1)
  {
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v5 = 0;
  unint64_t v6 = &v1[OBJC_IVAR____TtC21contactsdonationagent14ContactBuilder_donations];
  do
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v7 = *(id *)(v2 + 8 * v5 + 32);
    }
    uint64_t v8 = v7;
    swift_beginAccess();
    id v9 = v8;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((*(void *)v6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*(void *)v6 & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    ++v5;
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    swift_endAccess();
  }
  while (v3 != v5);
LABEL_13:
  swift_bridgeObjectRelease();
  id v10 = (char *)[objc_allocWithZone((Class)type metadata accessor for ContactBuilder.DonationVisitor()) init];
  uint64_t v11 = &v1[OBJC_IVAR____TtC21contactsdonationagent14ContactBuilder_donations];
  swift_beginAccess();
  unint64_t v12 = *(void *)v11;
  if (!(v12 >> 62))
  {
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_15;
    }
LABEL_22:
    swift_bridgeObjectRelease();
    id v17 = *(id *)&v10[OBJC_IVAR____TtCC21contactsdonationagent14ContactBuilderP33_1769836B200A88CF9192BAA6148092D915DonationVisitor_contact];

    return (uint64_t)v17;
  }
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v13 = result;
  if (!result) {
    goto LABEL_22;
  }
LABEL_15:
  if (v13 >= 1)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if ((v12 & 0xC000000000000001) != 0) {
        id v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v15 = *(id *)(v12 + 8 * i + 32);
      }
      uint64_t v16 = v15;
      [v15 acceptDonationValueVisitor:v10];
    }
    goto LABEL_22;
  }
LABEL_24:
  __break(1u);
  return result;
}

id sub_1000154F0(uint64_t a1)
{
  unint64_t v2 = v1;
  *(void *)&v1[OBJC_IVAR____TtCC21contactsdonationagent16ContactRebuilderP33_2C692544C68117D64033B26435CA0EDA21EmailAddressCollector_donations] = _swiftEmptyArrayStorage;
  uint64_t v18 = _swiftEmptyArrayStorage;
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    uint64_t v5 = CNEmailAddressExpandAliasedDomains;
    unint64_t v6 = v1;
    uint64_t v7 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      NSString v8 = String._bridgeToObjectiveC()();
      id v9 = (id)(*(uint64_t (**)(uint64_t, NSString))(v5 + 16))(v5, v8);

      uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
      swift_bridgeObjectRelease();

      uint64_t v11 = (char *)sub_1000160CC(v10);
      v7 += 16;
      --v4;
    }
    while (v4);
    uint64_t v13 = v18;
  }
  else
  {
    uint64_t v11 = v1;
    uint64_t v13 = _swiftEmptyArrayStorage;
  }
  __chkstk_darwin(v11, v12);
  uint64_t v14 = sub_100016568((uint64_t)v13, sub_100016220);
  swift_bridgeObjectRelease();
  uint64_t v15 = sub_10001C570((uint64_t)v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)&v2[OBJC_IVAR____TtCC21contactsdonationagent16ContactRebuilderP33_2C692544C68117D64033B26435CA0EDA21EmailAddressCollector_blacklistedEmailAddresses] = v15;

  v17.receiver = v2;
  v17.super_class = (Class)type metadata accessor for ContactRebuilder.EmailAddressCollector();
  return objc_msgSendSuper2(&v17, "init");
}

uint64_t sub_1000156B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = (id)(*(uint64_t (**)(uint64_t, NSString))(a3 + 16))(a3, v4);

  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return v6;
}

id sub_100015C48()
{
  return sub_100015CF4((uint64_t (*)(void))type metadata accessor for ContactRebuilder.EmailAddressCollector);
}

id sub_100015CDC()
{
  return sub_100015CF4((uint64_t (*)(void))type metadata accessor for ContactRebuilder);
}

id sub_100015CF4(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t sub_100015D90()
{
  return type metadata accessor for ContactRebuilder();
}

uint64_t type metadata accessor for ContactRebuilder()
{
  uint64_t result = qword_10004E010;
  if (!qword_10004E010) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100015DE4()
{
  sub_100015E84();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100015E84()
{
  if (!qword_10004E020)
  {
    type metadata accessor for PersonNameComponents();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10004E020);
    }
  }
}

uint64_t type metadata accessor for ContactRebuilder.EmailAddressCollector()
{
  return self;
}

uint64_t sub_100015F00(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_100016360(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return specialized Array._endMutation()();
}

uint64_t sub_1000160CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_10002E008(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v9 = (unint64_t)&v3[16 * v8 + 32];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = *((void *)v3 + 2);
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    *((void *)v3 + 2) = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100016220(uint64_t a1, uint64_t a2)
{
  return sub_1000156B8(a1, a2, *(void *)(v2 + 16));
}

void (*sub_100016228(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1000162D8(v6, a2, a3);
  return sub_100016290;
}

void sub_100016290(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_1000162D8(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_unknownObjectRetain();
LABEL_5:
    *uint64_t v3 = v4;
    return sub_100016358;
  }
  __break(1u);
  return result;
}

uint64_t sub_100016358()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_100016360(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100016B20();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100006ABC(&qword_10004E070);
          BOOL v12 = sub_100016228(v16, i, a3);
          uint64_t v14 = *v13;
          swift_unknownObjectRetain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_100006ABC(&qword_10004E6A0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_100016568(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  int64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_10002E584(0, v2, 0);
    int64_t v5 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v6 = *(v5 - 1);
      uint64_t v7 = *v5;
      swift_bridgeObjectRetain();
      uint64_t v8 = a2(v6, v7);
      uint64_t v10 = v9;
      swift_bridgeObjectRelease();
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      unint64_t v11 = _swiftEmptyArrayStorage[3];
      if (v12 >= v11 >> 1) {
        sub_10002E584(v11 > 1, v12 + 1, 1);
      }
      v5 += 2;
      _swiftEmptyArrayStorage[2] = v12 + 1;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage[2 * v12];
      *((void *)v13 + 4) = v8;
      *((void *)v13 + 5) = v10;
      --v2;
    }
    while (v2);
  }
  return _swiftEmptyArrayStorage;
}

void *sub_100016670(unint64_t a1, uint64_t (*a2)(id), void *a3)
{
  unint64_t v6 = a1;
  if (a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      unint64_t v8 = 0;
      uint64_t v16 = v6 & 0xFFFFFFFFFFFFFF8;
      unint64_t v17 = v6 & 0xC000000000000001;
      unint64_t v15 = v6;
      while (v17)
      {
        id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_9:
        uint64_t v10 = v9;
        unint64_t v11 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_17;
        }
        unint64_t v12 = a3;
        char v13 = a2(v9);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return v12;
        }
        if (v13)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          unint64_t v6 = v15;
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
        else
        {
        }
        ++v8;
        if (v11 == v7)
        {
          unint64_t v12 = &_swiftEmptyArrayStorage;
          goto LABEL_20;
        }
      }
      if (v8 < *(void *)(v16 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
      if (!v7) {
        goto LABEL_19;
      }
    }
    id v9 = *(id *)(v6 + 8 * v8 + 32);
    goto LABEL_9;
  }
LABEL_19:
  unint64_t v12 = &_swiftEmptyArrayStorage;
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_100016818(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006ABC((uint64_t *)&unk_10004E060);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100016880(uint64_t a1)
{
  uint64_t v2 = sub_100006ABC((uint64_t *)&unk_10004E060);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000168E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CollectedSuppressionResult(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100016944(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CollectedSuppressionResult(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000169A8()
{
  uint64_t v1 = *(void *)(type metadata accessor for CollectedSuppressionResult(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  type metadata accessor for NameSuppressionStatus(0);
  if (swift_getEnumCaseMultiPayload() <= 1)
  {
    uint64_t v5 = type metadata accessor for PersonNameComponents();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100016AC4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CollectedSuppressionResult(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100016B20()
{
  unint64_t result = qword_10004E078;
  if (!qword_10004E078)
  {
    sub_100006D34(&qword_10004E070);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004E078);
  }
  return result;
}

id CNMetricsAnalyzerEngine.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id CNMetricsAnalyzerEngine.init()()
{
  id v1 = v0;
  Logger.init(subsystem:category:)();
  id v2 = [objc_allocWithZone((Class)CNContactStore) init];
  *(void *)&v1[OBJC_IVAR____TtC21contactsdonationagent23CNMetricsAnalyzerEngine_contactStore] = v2;

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for CNMetricsAnalyzerEngine();
  return objc_msgSendSuper2(&v4, "init");
}

uint64_t type metadata accessor for CNMetricsAnalyzerEngine()
{
  uint64_t result = qword_10004E0A8;
  if (!qword_10004E0A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

NSMutableDictionary __swiftcall CNMetricsAnalyzerEngine.contactsAnalysis()()
{
  id v0 = sub_100017494();
  sub_100017D68();
  id v2 = v1;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = sub_100018FC0;
  *(void *)(v4 + 24) = v3;
  v8[4] = sub_100018FD8;
  v8[5] = v4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_100016F94;
  v8[3] = &unk_100045BE0;
  uint64_t v5 = _Block_copy(v8);
  id v6 = v2;
  swift_retain();
  swift_release();
  [v0 enumerateKeysAndObjectsUsingBlock:v5];

  _Block_release(v5);
  LOBYTE(v0) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result.super.super.Class isa = (Class)swift_release();
  if ((v0 & 1) == 0) {
    return (NSMutableDictionary)v6;
  }
  __break(1u);
  return result;
}

void sub_100016ED8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  sub_100006D7C(a2, a2[3]);
  uint64_t v6 = _bridgeAnythingToObjectiveC<A>(_:)();
  sub_1000134E0(a1, (uint64_t)v8);
  swift_dynamicCast();
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [a4 setValue:v6 forKey:v7];
  swift_unknownObjectRelease();
}

uint64_t sub_100016F94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSString v7 = *(void (**)(void *, void *, uint64_t))(a1 + 32);
  v10[3] = swift_getObjectType();
  v10[0] = a2;
  v9[3] = swift_getObjectType();
  v9[0] = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v7(v10, v9, a4);
  sub_100006BA8((uint64_t)v9);
  return sub_100006BA8((uint64_t)v10);
}

NSMutableDictionary __swiftcall CNMetricsAnalyzerEngine.postersAnalysis()()
{
  id v1 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  id v2 = *(void **)(v0 + OBJC_IVAR____TtC21contactsdonationagent23CNMetricsAnalyzerEngine_contactStore);
  type metadata accessor for PosterDetailsDataProvider();
  uint64_t v3 = swift_allocObject();
  id v4 = v2;
  Logger.init(subsystem:category:)();
  *(void *)(v3 + OBJC_IVAR____TtC21contactsdonationagent25PosterDetailsDataProvider____lazy_storage___meCard) = 1;
  uint64_t v5 = v3 + OBJC_IVAR____TtC21contactsdonationagent25PosterDetailsDataProvider____lazy_storage___numberOfContacts;
  *(void *)uint64_t v5 = 0;
  *(unsigned char *)(v5 + 8) = 1;
  *(void *)(v3
            + OBJC_IVAR____TtC21contactsdonationagent25PosterDetailsDataProvider____lazy_storage___contactsWithWallpaper) = 0;
  *(void *)(v3 + OBJC_IVAR____TtC21contactsdonationagent25PosterDetailsDataProvider_store) = v4;
  uint64_t v6 = swift_retain();
  NSString v7 = (char *)sub_1000191BC(v6);
  sub_1000219D4();
  Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setValue:isa forKey:v9];

  if ((unint64_t)sub_100021A90() >> 62) {
    _CocoaArrayWrapper.endIndex.getter();
  }
  swift_bridgeObjectRelease();
  Class v10 = Int._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setValue:v10 forKey:v11];

  if ((unint64_t)sub_100021A90() >> 62) {
    _CocoaArrayWrapper.endIndex.getter();
  }
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)&v7[OBJC_IVAR____TtC21contactsdonationagent13PosterDetails_dataProvider + 24];
  uint64_t v13 = *(void *)&v7[OBJC_IVAR____TtC21contactsdonationagent13PosterDetails_dataProvider + 32];
  sub_100006D7C(&v7[OBJC_IVAR____TtC21contactsdonationagent13PosterDetails_dataProvider], v12);
  (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v12, v13);
  Class v14 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setValue:v14 forKey:v15];

  sub_100020F20();
  Class v16 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setValue:v16 forKey:v17];

  sub_10002115C();
  Class v18 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setValue:v18 forKey:v19];

  sub_100021398();
  Class v20 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setValue:v20 forKey:v21];

  sub_1000215D4();
  Class v22 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setValue:v22 forKey:v23];

  sub_1000217D4();
  Class v24 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v25 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setValue:v24 forKey:v25];
  swift_release();

  return (NSMutableDictionary)v1;
}

id sub_100017494()
{
  uint64_t v0 = type metadata accessor for ContactDetails();
  uint64_t v2 = __chkstk_darwin(v0, v1);
  id v4 = (char *)&v66 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v2, v5);
  unint64_t v8 = (char *)&v66 - v7;
  uint64_t v10 = __chkstk_darwin(v6, v9);
  uint64_t v12 = (char *)&v66 - v11;
  uint64_t v14 = __chkstk_darwin(v10, v13);
  Class v16 = (char *)&v66 - v15;
  uint64_t v18 = __chkstk_darwin(v14, v17);
  Class v20 = (char *)&v66 - v19;
  uint64_t v22 = __chkstk_darwin(v18, v21);
  Class v24 = (char *)&v66 - v23;
  __chkstk_darwin(v22, v25);
  id v27 = (char *)&v66 - v26;
  id v28 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  if (qword_10004D1A8 != -1)
  {
    swift_once();
    id v29 = sub_1000193BC();
    if (v29) {
      goto LABEL_3;
    }
LABEL_5:
    Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v64 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v28 setValue:isa forKey:v64];

    return v28;
  }
  id v29 = sub_1000193BC();
  if (!v29) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v67 = v16;
  unint64_t v68 = v12;
  unint64_t v69 = v8;
  uint64_t v70 = v4;
  id v71 = v29;
  sub_100007EB8(v71, (uint64_t)v27);
  uint64_t v73 = *(int *)(v0 + 80);
  uint64_t v72 = *(void *)&v27[v73];
  Class v30 = Bool._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v31 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v28 setValue:v30 forKey:v31];

  Class v32 = Bool._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v33 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v28 setValue:v32 forKey:v33];

  Class v34 = Bool._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v35 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v28 setValue:v34 forKey:v35];

  Class v36 = Bool._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v37 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v28 setValue:v36 forKey:v37];

  Class v38 = Bool._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v39 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v28 setValue:v38 forKey:v39];

  Class v40 = Bool._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v41 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v28 setValue:v40 forKey:v41];

  Class v42 = Bool._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v43 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v28 setValue:v42 forKey:v43];

  sub_1000196F4((uint64_t)v27, (uint64_t)v24);
  sub_10001935C((uint64_t)v24, (uint64_t (*)(void))type metadata accessor for ContactDetails);
  Class v44 = Bool._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v45 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v28 setValue:v44 forKey:v45];

  sub_1000196F4((uint64_t)v27, (uint64_t)v20);
  sub_10001935C((uint64_t)v20, (uint64_t (*)(void))type metadata accessor for ContactDetails);
  uint64_t v46 = (uint64_t)v67;
  sub_1000196F4((uint64_t)v27, (uint64_t)v67);
  uint64_t v47 = (uint64_t)v68;
  sub_10001935C(v46, (uint64_t (*)(void))type metadata accessor for ContactDetails);
  Class v48 = Bool._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v49 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v28 setValue:v48 forKey:v49];

  sub_1000196F4((uint64_t)v27, v47);
  sub_10001935C(v47, (uint64_t (*)(void))type metadata accessor for ContactDetails);
  uint64_t v50 = (uint64_t)v69;
  sub_1000196F4((uint64_t)v27, (uint64_t)v69);
  uint64_t v51 = (uint64_t)v70;
  id v52 = v71;
  sub_10001935C(v50, (uint64_t (*)(void))type metadata accessor for ContactDetails);
  sub_1000196F4((uint64_t)v27, v51);
  sub_10001935C(v51, (uint64_t (*)(void))type metadata accessor for ContactDetails);
  Class v53 = Bool._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v54 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v28 setValue:v53 forKey:v54];

  Class v55 = Bool._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v56 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v28 setValue:v55 forKey:v56];

  Class v57 = Int._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v58 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v28 setValue:v57 forKey:v58];

  Class v59 = Bool._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v60 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v28 setValue:v59 forKey:v60];

  Class v61 = Bool._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v62 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v28 setValue:v61 forKey:v62];

  sub_10001935C((uint64_t)v27, (uint64_t (*)(void))type metadata accessor for ContactDetails);
  return v28;
}

void sub_100017D68()
{
  uint64_t v0 = type metadata accessor for ContactDetails();
  __chkstk_darwin(v0 - 8, v1);
  uint64_t v3 = (char *)&v115 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for AllContactsInBatches(0);
  uint64_t v5 = (int *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  unint64_t v8 = (char *)&v115 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for AddressBookDetails(0);
  uint64_t v10 = (int *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)&v115 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v128 = [objc_allocWithZone((Class)NSMutableDictionary) init];
  Logger.init(subsystem:category:)();
  uint64_t v125 = v10[7];
  *(void *)&v13[v125] = 0;
  *(void *)&v13[v10[8]] = 0;
  uint64_t v117 = v10[9];
  *(void *)&v13[v117] = 0;
  uint64_t v120 = v10[10];
  *(void *)&v13[v120] = 0;
  *(void *)&v13[v10[11]] = 0;
  *(void *)&v13[v10[12]] = 0;
  *(void *)&v13[v10[13]] = 0;
  *(void *)&v13[v10[14]] = 0;
  uint64_t v116 = v10[15];
  *(void *)&v13[v116] = 0;
  *(void *)&v13[v10[16]] = 0;
  *(void *)&v13[v10[17]] = 0;
  *(void *)&v13[v10[18]] = 0;
  uint64_t v126 = v10[19];
  *(void *)&v13[v126] = 0;
  uint64_t v122 = v10[20];
  *(void *)&v13[v122] = 0;
  uint64_t v115 = v10[21];
  *(void *)&v13[v115] = 0;
  uint64_t v118 = v10[22];
  *(void *)&v13[v118] = 0;
  uint64_t v119 = v10[23];
  *(void *)&v13[v119] = 0;
  uint64_t v121 = v10[24];
  *(void *)&v13[v121] = 0;
  uint64_t v14 = &v13[v10[25]];
  *(_OWORD *)uint64_t v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  id v135 = v14;
  uint64_t v15 = &v13[v10[26]];
  *(_OWORD *)uint64_t v15 = 0u;
  *((_OWORD *)v15 + 1) = 0u;
  v129 = v15;
  Class v16 = &v13[v10[27]];
  *(_OWORD *)Class v16 = 0u;
  *((_OWORD *)v16 + 1) = 0u;
  char v127 = v16;
  uint64_t v17 = &v13[v10[28]];
  *(_OWORD *)uint64_t v17 = 0u;
  *((_OWORD *)v17 + 1) = 0u;
  v124 = v17;
  uint64_t v18 = &v13[v10[29]];
  *(_OWORD *)uint64_t v18 = 0u;
  *((_OWORD *)v18 + 1) = 0u;
  v123 = v18;
  uint64_t v19 = &v13[v10[30]];
  uint64_t v20 = type metadata accessor for Date();
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56);
  uint64_t v22 = v19;
  uint64_t v23 = (uint64_t)v13;
  v21(v22, 1, 1, v20);
  v21(&v13[v10[31]], 1, 1, v20);
  uint64_t v24 = (uint64_t)v8;
  id v25 = *(id *)(v134 + OBJC_IVAR____TtC21contactsdonationagent23CNMetricsAnalyzerEngine_contactStore);
  Logger.init(subsystem:category:)();
  uint64_t v26 = v24 + v5[7];
  *(_OWORD *)uint64_t v26 = 0u;
  *(_OWORD *)(v26 + 16) = 0u;
  *(void *)(v24 + v5[8]) = v25;
  uint64_t v133 = v5[9];
  uint64_t v134 = 0;
  *(void *)(v24 + v133) = 50;
  uint64_t v131 = v24;
  uint64_t v132 = v13;
  for (i = v26; ; uint64_t v26 = i)
  {
    id v27 = *(char **)v26;
    if (*(void *)v26)
    {
      uint64_t v28 = *(void *)(v26 + 8);
      uint64_t v29 = *(void *)(v26 + 16);
      unint64_t v30 = *(void *)(v26 + 24);
    }
    else
    {
      id v27 = sub_10001D9FC();
      uint64_t v29 = 0;
      uint64_t v28 = (uint64_t)(v27 + 32);
      unint64_t v30 = (2 * *((void *)v27 + 2)) | 1;
      *(void *)uint64_t v26 = v27;
      *(void *)(v26 + 8) = v27 + 32;
      *(void *)(v26 + 16) = 0;
      *(void *)(v26 + 24) = v30;
    }
    int64_t v31 = v30 >> 1;
    if (v29 == v30 >> 1) {
      break;
    }
    if (v29 >= (uint64_t)(v30 >> 1))
    {
      __break(1u);
LABEL_57:
      __break(1u);
LABEL_58:
      __break(1u);
LABEL_59:
      __break(1u);
LABEL_60:
      __break(1u);
LABEL_61:
      __break(1u);
LABEL_62:
      __break(1u);
LABEL_63:
      __break(1u);
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      return;
    }
    int64_t v32 = *(void *)(v24 + v133);
    if (v32 < 0) {
      goto LABEL_57;
    }
    int64_t v33 = v31 - v29;
    if (__OFSUB__(v31, v29)) {
      goto LABEL_58;
    }
    if (!v32 || v33 < 0 || (int64_t v34 = v30 >> 1, v33 >= v32))
    {
      int64_t v34 = v29 + v32;
      if (__OFADD__(v29, v32)) {
        goto LABEL_64;
      }
    }
    if (v34 < v29) {
      goto LABEL_59;
    }
    if (v31 < v34) {
      goto LABEL_60;
    }
    if (v34 < 0) {
      goto LABEL_61;
    }
    if (!v32 || v33 < 0 || v33 >= v32)
    {
      BOOL v35 = __OFADD__(v29, v32);
      int64_t v36 = v29 + v32;
      if (v35) {
        goto LABEL_65;
      }
      if (v31 < v36) {
        goto LABEL_62;
      }
      int64_t v31 = v36;
    }
    if (v31 < v29) {
      goto LABEL_63;
    }
    *(void *)uint64_t v26 = v27;
    *(void *)(v26 + 8) = v28;
    *(void *)(v26 + 16) = v31;
    *(void *)(v26 + 24) = v30;
    uint64_t v37 = qword_10004D1A8;
    swift_unknownObjectRetain_n();
    if (v37 != -1) {
      swift_once();
    }
    unint64_t v38 = v30 & 1 | (2 * v34);
    id v39 = objc_allocWithZone((Class)CNContactFetchRequest);
    swift_bridgeObjectRetain();
    sub_100006ABC(&qword_10004E6A0);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v41 = [v39 initWithKeysToFetch:isa];

    if ((v30 & 1) == 0)
    {
      swift_unknownObjectRetain();
LABEL_29:
      sub_10002E23C((uint64_t)v27, v28, v29, v38);
      goto LABEL_36;
    }
    type metadata accessor for __ContiguousArrayStorageBase();
    swift_unknownObjectRetain_n();
    Class v42 = (void *)swift_dynamicCastClass();
    if (!v42)
    {
      swift_unknownObjectRelease();
      Class v42 = _swiftEmptyArrayStorage;
    }
    uint64_t v43 = v42[2];
    swift_release();
    if (__OFSUB__(v34, v29)) {
      goto LABEL_67;
    }
    if (v43 != v34 - v29)
    {
      swift_unknownObjectRelease();
      goto LABEL_29;
    }
    if (!swift_dynamicCastClass()) {
      swift_unknownObjectRelease();
    }
LABEL_36:
    swift_unknownObjectRelease();
    Class v44 = self;
    Class v45 = Array._bridgeToObjectiveC()().super.isa;
    swift_release();
    id v46 = [v44 predicateForContactsWithIdentifiers:v45];

    [v41 setPredicate:v46];
    unint64_t v136 = 0;
    uint64_t v24 = v131;
    uint64_t v48 = v28;
    uint64_t v49 = v134;
    sub_10001DF30((uint64_t *)&v136, v131, (uint64_t)v41, (uint64_t)v27, v48, v29, v38);
    uint64_t v134 = v49;

    swift_unknownObjectRelease_n();
    unint64_t v50 = v136;
    uint64_t v23 = (uint64_t)v132;
    if (!v136) {
      break;
    }
    if (v136 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v51 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v51) {
        goto LABEL_2;
      }
    }
    else
    {
      uint64_t v51 = *(void *)((v136 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v51) {
        goto LABEL_2;
      }
    }
    if (v51 < 1) {
      goto LABEL_66;
    }
    uint64_t v52 = 0;
    do
    {
      if ((v50 & 0xC000000000000001) != 0) {
        id v53 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v53 = *(id *)(v50 + 8 * v52 + 32);
      }
      ++v52;
      id v54 = v53;
      sub_100007EB8(v54, (uint64_t)v3);
      sub_10001CE34((uint64_t)v3);

      sub_10001935C((uint64_t)v3, (uint64_t (*)(void))type metadata accessor for ContactDetails);
    }
    while (v51 != v52);
LABEL_2:
    swift_bridgeObjectRelease();
  }
  sub_10001935C(v24, type metadata accessor for AllContactsInBatches);
  Class v55 = Int._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v56 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v57 = v128;
  [v128 setValue:v55 forKey:v56];

  Class v58 = Bool._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v59 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v58 forKey:v59];

  Class v60 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v61 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v60 forKey:v61];

  Class v62 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v63 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v62 forKey:v63];

  Class v64 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v65 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v64 forKey:v65];

  Class v66 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v67 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v66 forKey:v67];

  Class v68 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v69 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v68 forKey:v69];

  Class v70 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v71 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v70 forKey:v71];

  uint64_t v72 = *(void *)(v23 + v126);
  Class v73 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v74 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v73 forKey:v74];

  if (v72 >= 1 && __OFSUB__(v72, *(void *)(v23 + v122))) {
    goto LABEL_68;
  }
  Class v75 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v76 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v75 forKey:v76];

  Class v77 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v78 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v77 forKey:v78];

  Class v79 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v80 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v79 forKey:v80];

  Class v81 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v82 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v81 forKey:v82];

  Class v83 = Int._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v84 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v83 forKey:v84];

  Class v85 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v86 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v85 forKey:v86];

  Class v87 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v88 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v87 forKey:v88];

  Class v89 = Int._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v90 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v89 forKey:v90];

  Class v91 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v92 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v91 forKey:v92];

  Class v93 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v94 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v93 forKey:v94];

  Class v95 = Int._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v96 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v95 forKey:v96];

  Class v97 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v98 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v97 forKey:v98];

  Class v99 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v100 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v99 forKey:v100];

  Class v101 = Int._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v102 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v101 forKey:v102];

  Class v103 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v104 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v103 forKey:v104];

  Class v105 = Double._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v106 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v105 forKey:v106];

  Class v107 = Int._bridgeToObjectiveC()().super.super.isa;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v108 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v107 forKey:v108];

  sub_10001CAA4();
  if (v109) {
    v110.super.super.Class isa = 0;
  }
  else {
    v110.super.super.Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v111 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v110.super.super.isa forKey:v111];
  swift_unknownObjectRelease();

  sub_10001CC6C();
  if (v112) {
    v113.super.super.Class isa = 0;
  }
  else {
    v113.super.super.Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v114 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v57 setValue:v113.super.super.isa forKey:v114];
  swift_unknownObjectRelease();

  sub_10001935C(v23, type metadata accessor for AddressBookDetails);
}

uint64_t sub_100018F88()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100018FC0(uint64_t a1, void *a2, uint64_t a3)
{
  sub_100016ED8(a1, a2, a3, *(void **)(v3 + 16));
}

uint64_t sub_100018FC8()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100018FD8()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100019000(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100019010()
{
  return swift_release();
}

id CNMetricsAnalyzerEngine.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CNMetricsAnalyzerEngine();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000190D0(uint64_t result, uint64_t a2, uint64_t a3, int64_t a4, unint64_t a5)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  int64_t v5 = a5 >> 1;
  uint64_t v6 = (a5 >> 1) - a4;
  if (__OFSUB__(a5 >> 1, a4))
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (!result || v6 < 0 || (int64_t v7 = a5 >> 1, v6 >= result))
  {
    int64_t v7 = a4 + result;
    if (__OFADD__(a4, result)) {
      goto LABEL_18;
    }
  }
  if (v7 < a4) {
    goto LABEL_14;
  }
  if (v5 < a4)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v5 >= v7)
  {
    if ((v7 & 0x8000000000000000) == 0) {
      return a2;
    }
    goto LABEL_17;
  }
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_10001914C(uint64_t result, uint64_t a2, uint64_t a3, int64_t a4, unint64_t a5)
{
  if (result < 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  int64_t v5 = a5 >> 1;
  uint64_t v6 = (a5 >> 1) - a4;
  if (__OFSUB__(a5 >> 1, a4))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (result)
  {
    if ((v6 & 0x8000000000000000) == 0)
    {
      int64_t v7 = a5 >> 1;
      if (v6 < result)
      {
LABEL_8:
        if (v7 >= a4)
        {
          if (v5 >= a4) {
            return a2;
          }
          goto LABEL_15;
        }
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
    }
  }
  int64_t v7 = a4 + result;
  if (!__OFADD__(a4, result))
  {
    if (v5 >= v7) {
      goto LABEL_8;
    }
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
LABEL_16:
  __break(1u);
  return result;
}

id sub_1000191BC(uint64_t a1)
{
  v7[3] = type metadata accessor for PosterDetailsDataProvider();
  v7[4] = &off_100045D10;
  v7[0] = a1;
  objc_super v2 = (objc_class *)type metadata accessor for PosterDetails();
  uint64_t v3 = objc_allocWithZone(v2);
  Logger.init(subsystem:category:)();
  v3[OBJC_IVAR____TtC21contactsdonationagent13PosterDetails____lazy_storage___meCardPosterType] = 5;
  *(void *)&v3[OBJC_IVAR____TtC21contactsdonationagent13PosterDetails____lazy_storage___collectedMetadata] = 0;
  sub_100006EA0((uint64_t)v7, (uint64_t)&v3[OBJC_IVAR____TtC21contactsdonationagent13PosterDetails_dataProvider]);

  v6.receiver = v3;
  v6.super_class = v2;
  id v4 = objc_msgSendSuper2(&v6, "init");
  sub_100006BA8((uint64_t)v7);
  return v4;
}

uint64_t sub_1000192B8()
{
  return type metadata accessor for CNMetricsAnalyzerEngine();
}

uint64_t sub_1000192C0()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10001935C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_1000193BC()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  int64_t v5 = (char *)v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v6 = *(void **)(v0 + OBJC_IVAR____TtC21contactsdonationagent23CNMetricsAnalyzerEngine_contactStore);
  if (qword_10004D1A8 != -1) {
    swift_once();
  }
  sub_100006ABC(&qword_10004E6A0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v18 = 0;
  id v8 = [v6 _crossPlatformUnifiedMeContactWithKeysToFetch:isa error:&v18];

  id v9 = v18;
  if (!v8)
  {
    uint64_t v10 = v9;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v0 + OBJC_IVAR____TtC21contactsdonationagent23CNMetricsAnalyzerEngine_logger, v1);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      id v18 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315138;
      v17[1] = v13 + 4;
      swift_getErrorValue();
      uint64_t v14 = Error.localizedDescription.getter();
      v17[2] = sub_1000253D0(v14, v15, (uint64_t *)&v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Could not fetch Me Card %s", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    return 0;
  }
  return v8;
}

uint64_t sub_1000196F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ContactDetails();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100019758(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    id v9 = a1 + 7;
    for (uint64_t i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

id sub_100019820(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  unint64_t v4 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    unint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    unint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if ((unint64_t)a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v5 == v29) {
      goto LABEL_5;
    }
LABEL_49:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  if (v5 != *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_49;
  }
LABEL_5:
  if (!v5) {
    goto LABEL_38;
  }
  uint64_t v6 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0) {
    uint64_t v6 = v3;
  }
  if (!v4) {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  }
  uint64_t v7 = a2 & 0xFFFFFFFFFFFFFF8;
  uint64_t v8 = (a2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (a2 < 0) {
    uint64_t v9 = a2;
  }
  else {
    uint64_t v9 = a2 & 0xFFFFFFFFFFFFFF8;
  }
  if ((unint64_t)a2 >> 62) {
    uint64_t v8 = v9;
  }
  if (v6 == v8)
  {
LABEL_38:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0) {
    goto LABEL_55;
  }
  unint64_t v30 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0) {
    goto LABEL_56;
  }
  for (id result = *(id *)(v3 + 32); ; id result = (id)specialized _ArrayBuffer._getElementSlowPath(_:)())
  {
    BOOL v11 = result;
    if ((a2 & 0xC000000000000001) == 0) {
      break;
    }
    id v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_22:
    uint64_t v13 = v12;
    sub_100010D8C();
    char v14 = static NSObject.== infix(_:_:)();

    if ((v14 & 1) == 0) {
      goto LABEL_49;
    }
    unint64_t v15 = v5 - 1;
    if (v5 == 1) {
      return (id)(v5 & 1);
    }
    if (((a2 | v3) & 0xC000000000000001) != 0)
    {
      uint64_t v16 = 0;
      unint64_t v17 = v5 - 2;
      while (v15 != v16)
      {
        unint64_t v5 = v16 + 1;
        if (v30) {
          id v18 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v18 = *(id *)(v3 + 40 + 8 * v16);
        }
        uint64_t v19 = v18;
        if ((a2 & 0xC000000000000001) != 0)
        {
          id v20 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          if (v5 >= *(void *)(v7 + 16)) {
            goto LABEL_54;
          }
          id v20 = *(id *)(a2 + 40 + 8 * v16);
        }
        uint64_t v21 = v20;
        unint64_t v5 = static NSObject.== infix(_:_:)();

        if ((v5 & 1) != 0 && v17 != v16++) {
          continue;
        }
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      unint64_t v23 = *(void *)(v7 + 16);
      if (v23 <= 1) {
        unint64_t v23 = 1;
      }
      unint64_t v24 = v23 - 1;
      id v25 = (void **)(v3 + 40);
      uint64_t v7 = a2 + 40;
      while (v15)
      {
        if (!v24) {
          goto LABEL_53;
        }
        id v27 = *v25++;
        uint64_t v26 = v27;
        uint64_t v28 = *(void **)v7;
        v7 += 8;
        a2 = v26;
        uint64_t v3 = v28;
        unint64_t v5 = static NSObject.== infix(_:_:)();

        if (v5)
        {
          --v24;
          if (--v15) {
            continue;
          }
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    ;
  }
  if (*(void *)(v7 + 16))
  {
    id v12 = *(id *)(a2 + 32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

id sub_100019AFC()
{
  uint64_t v1 = OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___schedulerProvider;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___schedulerProvider))
  {
    id v2 = *(id *)(v0 + OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___schedulerProvider);
  }
  else
  {
    id v2 = [self defaultProvider];
    *(void *)(v0 + v1) = v2;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v2;
}

id sub_100019B7C()
{
  uint64_t v1 = OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___logger;
  if (*(void *)(v0 + OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___logger))
  {
    id v2 = *(id *)(v0 + OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___logger);
  }
  else
  {
    id v2 = objc_msgSend(objc_msgSend(self, "defaultProvider"), "agentLogger");
    swift_unknownObjectRelease();
    *(void *)(v0 + v1) = v2;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v2;
}

id sub_100019C20()
{
  return sub_100019EB8(&OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___dataProxy, (Class *)CNData_ptr);
}

id sub_100019C34()
{
  uint64_t v1 = OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___donationPreferences;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___donationPreferences))
  {
    id v2 = *(id *)(v0
               + OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___donationPreferences);
  }
  else
  {
    id v3 = [objc_allocWithZone((Class)CNDDonationPreferences) init];
    *(void *)(v0 + v1) = v3;
    id v2 = v3;
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v2;
}

id sub_100019CAC()
{
  uint64_t v1 = OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___distributedNotificationCenter;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___distributedNotificationCenter);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___distributedNotificationCenter);
  }
  else
  {
    id v4 = [self defaultCenter];
    unint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_100019D28()
{
  return sub_100019EB8(&OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___feedbackStore, (Class *)CDFDonationFeedbackStore_ptr);
}

id sub_100019D3C()
{
  *(void *)&v0[OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___schedulerProvider] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___logger] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___dataProxy] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___donationPreferences] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___distributedNotificationCenter] = 0;
  *(void *)&v0[OBJC_IVAR____TtC21contactsdonationagent21ProductionEnvironment____lazy_storage___feedbackStore] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ProductionEnvironment();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_100019DDC(uint64_t a1)
{
  return sub_10001AC70(a1, type metadata accessor for ProductionEnvironment);
}

uint64_t type metadata accessor for ProductionEnvironment()
{
  return self;
}

id sub_100019EA4()
{
  return sub_100019EB8(&OBJC_IVAR____TtC21contactsdonationagent22ProductionInfoProvider____lazy_storage___contactStore, (Class *)CNContactStore_ptr);
}

id sub_100019EB8(uint64_t *a1, Class *a2)
{
  uint64_t v3 = *a1;
  id v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }
  else
  {
    id v6 = [objc_allocWithZone(*a2) init];
    uint64_t v7 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v6;
    id v5 = v6;

    id v4 = 0;
  }
  id v8 = v4;
  return v5;
}

void sub_100019F24()
{
  id v5 = sub_100019FF8();
  unsigned __int8 v1 = sub_10001A190((uint64_t)v5);
  char v2 = sub_10001A788(v5);
  if (v1 & 1) != 0 || (v2)
  {
    uint64_t v3 = *(void (**)(uint64_t))(v0
                                        + OBJC_IVAR____TtC21contactsdonationagent22ProductionInfoProvider_changeHandler);
    if (v3)
    {
      uint64_t v4 = swift_retain();
      v3(v4);
      sub_100013B80((uint64_t)v3);
    }
  }
}

id sub_100019FF8()
{
  if (qword_10004D220 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_10004ED60;
  swift_bridgeObjectRetain();
  uint64_t v0 = CNContactEmailAddressesKey;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  id v1 = sub_100019EA4();
  sub_100006ABC(&qword_10004E6A0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v7 = 0;
  id v3 = [v1 _crossPlatformUnifiedMeContactWithKeysToFetch:isa error:&v7];

  id v4 = v7;
  if (!v3)
  {
    id v5 = v4;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
    return 0;
  }
  return v3;
}

id sub_10001A190(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PersonNameComponents();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v49 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100006ABC((uint64_t *)&unk_10004E190);
  __chkstk_darwin(v6, v7);
  uint64_t v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100006ABC((uint64_t *)&unk_10004E060);
  uint64_t v12 = __chkstk_darwin(v10 - 8, v11);
  uint64_t v51 = (uint64_t)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12, v14);
  uint64_t v50 = (uint64_t)&v49 - v16;
  uint64_t v18 = __chkstk_darwin(v15, v17);
  id v20 = (char *)&v49 - v19;
  uint64_t v22 = __chkstk_darwin(v18, v21);
  unint64_t v24 = (char *)&v49 - v23;
  __chkstk_darwin(v22, v25);
  id v27 = (char *)&v49 - v26;
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
  v28((char *)&v49 - v26, 1, 1, v2);
  if (!a1)
  {
LABEL_4:
    sub_10001C60C((uint64_t)v27, (uint64_t)v20, (uint64_t *)&unk_10004E060);
    int64_t v31 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48);
    int v52 = v31(v20, 1, v2);
    sub_100009A44((uint64_t)v20, (uint64_t *)&unk_10004E060);
    uint64_t v32 = v53 + OBJC_IVAR____TtC21contactsdonationagent22ProductionInfoProvider_curatedName;
    swift_beginAccess();
    uint64_t v33 = (uint64_t)&v9[*(int *)(v6 + 48)];
    sub_10001C60C((uint64_t)v27, (uint64_t)v9, (uint64_t *)&unk_10004E060);
    sub_10001C60C(v32, v33, (uint64_t *)&unk_10004E060);
    if (v31(v9, 1, v2) == 1)
    {
      int v34 = v31((char *)v33, 1, v2);
      if (v34 == 1) {
        BOOL v35 = (uint64_t *)&unk_10004E060;
      }
      else {
        BOOL v35 = (uint64_t *)&unk_10004E190;
      }
      if (v34 == 1) {
        char v36 = -1;
      }
      else {
        char v36 = 0;
      }
    }
    else
    {
      uint64_t v37 = v50;
      sub_10001C60C((uint64_t)v9, v50, (uint64_t *)&unk_10004E060);
      if (v31((char *)v33, 1, v2) == 1)
      {
        (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v37, v2);
        char v36 = 0;
        BOOL v35 = (uint64_t *)&unk_10004E190;
      }
      else
      {
        unint64_t v38 = v49;
        (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v49, v33, v2);
        sub_10001C6D8();
        char v36 = dispatch thunk of static Equatable.== infix(_:_:)();
        id v39 = *(void (**)(char *, uint64_t))(v3 + 8);
        v39(v38, v2);
        v39((char *)v37, v2);
        BOOL v35 = (uint64_t *)&unk_10004E060;
      }
    }
    sub_100009A44((uint64_t)v9, v35);
    uint64_t v40 = v53 + OBJC_IVAR____TtC21contactsdonationagent22ProductionInfoProvider_environment;
    swift_beginAccess();
    sub_10001C60C(v40, (uint64_t)v54, (uint64_t *)&unk_10004E170);
    uint64_t v41 = v55;
    if (v55)
    {
      BOOL v42 = v52 != 1;
      uint64_t v43 = sub_100006D7C(v54, v55);
      uint64_t v44 = *(void *)(v41 - 8);
      __chkstk_darwin(v43, v43);
      id v46 = (char *)&v49 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v44 + 16))(v46);
      sub_100009A44((uint64_t)v54, (uint64_t *)&unk_10004E170);
      id v47 = sub_100019B7C();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v46, v41);
      [v47 contactsChangedNotificationFoundName:v42 nameChanged:(v36 ^ 1) & 1];
      swift_unknownObjectRelease();
      if (v36)
      {
LABEL_17:
        sub_100009A44((uint64_t)v27, (uint64_t *)&unk_10004E060);
        return (id)((v36 ^ 1) & 1);
      }
    }
    else
    {
      sub_100009A44((uint64_t)v54, (uint64_t *)&unk_10004E170);
      if (v36) {
        goto LABEL_17;
      }
    }
    uint64_t v48 = v51;
    sub_10001C60C((uint64_t)v27, v51, (uint64_t *)&unk_10004E060);
    swift_beginAccess();
    sub_10001C670(v48, v32);
    swift_endAccess();
    goto LABEL_17;
  }
  id result = [self componentsForContact:a1];
  if (result)
  {
    unint64_t v30 = result;
    static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)();

    sub_100009A44((uint64_t)v27, (uint64_t *)&unk_10004E060);
    v28(v24, 0, 1, v2);
    sub_10001C730((uint64_t)v24, (uint64_t)v27);
    goto LABEL_4;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001A788(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = _swiftEmptyArrayStorage;
  if (!a1)
  {
LABEL_16:
    uint64_t v25 = OBJC_IVAR____TtC21contactsdonationagent22ProductionInfoProvider_curatedEmailAddresses;
    unsigned __int8 v26 = sub_100019758(v3, *(void **)(v2 + OBJC_IVAR____TtC21contactsdonationagent22ProductionInfoProvider_curatedEmailAddresses));
    uint64_t v27 = v2 + OBJC_IVAR____TtC21contactsdonationagent22ProductionInfoProvider_environment;
    swift_beginAccess();
    sub_10001C60C(v27, (uint64_t)v38, (uint64_t *)&unk_10004E170);
    uint64_t v28 = v39;
    if (v39)
    {
      uint64_t v29 = sub_100006D7C(v38, v39);
      uint64_t v30 = *(void *)(v28 - 8);
      __chkstk_darwin(v29, v29);
      uint64_t v32 = (char *)&v35 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v30 + 16))(v32);
      sub_100009A44((uint64_t)v38, (uint64_t *)&unk_10004E170);
      id v33 = sub_100019B7C();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v32, v28);
      [v33 contactsChangedNotificationEmailAddressesChanged:(v26 ^ 1) & 1];
      swift_unknownObjectRelease();
      if (v26)
      {
LABEL_19:
        swift_bridgeObjectRelease();
        return (v26 ^ 1) & 1;
      }
    }
    else
    {
      sub_100009A44((uint64_t)v38, (uint64_t *)&unk_10004E170);
      if (v26) {
        goto LABEL_19;
      }
    }
    *(void *)(v2 + v25) = v3;
    goto LABEL_19;
  }
  id v4 = a1;
  id v5 = [v4 emailAddresses];
  sub_100006ABC(qword_10004D780);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v6 >> 62))
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v7) {
      goto LABEL_4;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    uint64_t v9 = _swiftEmptyArrayStorage;
LABEL_15:
    uint64_t v23 = sub_10001C570((uint64_t)v9);
    swift_bridgeObjectRelease();
    unint64_t v24 = sub_10002E3B0(v23);
    swift_bridgeObjectRelease();
    v38[0] = (uint64_t)v24;
    swift_retain();
    sub_10001B8CC(v38);
    swift_release();

    uint64_t v3 = (void *)v38[0];
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v7) {
    goto LABEL_14;
  }
LABEL_4:
  v38[0] = (uint64_t)_swiftEmptyArrayStorage;
  sub_10002E584(0, v7 & ~(v7 >> 63), 0);
  if ((v7 & 0x8000000000000000) == 0)
  {
    id v35 = v4;
    uint64_t v36 = v2;
    uint64_t v8 = 0;
    uint64_t v9 = (void *)v38[0];
    unint64_t v37 = v6 & 0xC000000000000001;
    uint64_t v10 = CNEmailAddressNormalize;
    unint64_t v11 = v6;
    uint64_t v12 = v7;
    do
    {
      if (v37) {
        id v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v13 = *(id *)(v6 + 8 * v8 + 32);
      }
      uint64_t v14 = v13;
      id v15 = objc_msgSend(v13, "value", v35, v36);
      id v16 = (id)(*(uint64_t (**)(uint64_t, id))(v10 + 16))(v10, v15);

      uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v19 = v18;

      v38[0] = (uint64_t)v9;
      unint64_t v21 = v9[2];
      unint64_t v20 = v9[3];
      if (v21 >= v20 >> 1)
      {
        sub_10002E584(v20 > 1, v21 + 1, 1);
        uint64_t v9 = (void *)v38[0];
      }
      ++v8;
      _OWORD v9[2] = v21 + 1;
      uint64_t v22 = &v9[2 * v21];
      v22[4] = v17;
      v22[5] = v19;
      unint64_t v6 = v11;
    }
    while (v12 != v8);
    swift_bridgeObjectRelease();
    id v4 = v35;
    uint64_t v2 = v36;
    goto LABEL_15;
  }
  __break(1u);
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

id sub_10001AC54()
{
  return sub_10001AC70(0, type metadata accessor for ProductionInfoProvider);
}

id sub_10001AC70(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t sub_10001AD2C()
{
  return type metadata accessor for ProductionInfoProvider();
}

uint64_t type metadata accessor for ProductionInfoProvider()
{
  uint64_t result = qword_10004E158;
  if (!qword_10004E158) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10001AD80()
{
  sub_100015E84();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_10001AE3C(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_10001B2CC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_10001AFEC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006ABC(&qword_10004E188);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_10001B2CC(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_10001AFEC();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_10001B468();
      goto LABEL_22;
    }
    sub_10001B61C();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  uint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_10001B468()
{
  uint64_t v1 = v0;
  sub_100006ABC(&qword_10004E188);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10001B61C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006ABC(&qword_10004E188);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

Swift::Int sub_10001B8CC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001C55C(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_10001B938(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_10001B938(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_10001C024(0, v3, 1, a1);
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_160;
  }
  Swift::Int v105 = result;
  NSString v102 = a1;
  if (v3 < 2)
  {
    unint64_t v8 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      int64_t v11 = (char *)_swiftEmptyArrayStorage;
LABEL_118:
      NSString v94 = v11;
      NSString v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          Class v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_10001C0F4((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            Class v97 = sub_10001C548((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          NSString v100 = &v97[16 * v96 + 32];
          *(void *)NSString v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          NSString v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      v104[2] = 0;
      return swift_bridgeObjectRelease();
    }
    NSString v104 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v7 + 16) = v6;
    NSString v104 = (void *)v7;
    __dst = (char *)(v7 + 32);
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  int64_t v11 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v106 = v3;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    unint64_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    unint64_t v17 = (void *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      unint64_t v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ _stringCompareWithSmolCheck(_:_:expecting:)()))
      {
        goto LABEL_36;
      }
      v21 += 2;
      Swift::Int v22 = v20 + 1;
      Swift::Int v9 = v20;
      Swift::Int v20 = v22;
    }
    while (v22 < v3);
    Swift::Int v20 = v22;
LABEL_36:
    Swift::Int v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        Swift::Int v27 = v20;
        Swift::Int v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      Swift::Int v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      int64_t v11 = sub_10001C390(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      int64_t v11 = sub_10001C390((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    BOOL v42 = v11 + 32;
    uint64_t v43 = &v11[16 * v41 + 32];
    *(void *)uint64_t v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      Swift::Int v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          id v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            Class v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }
          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }
        if (v48) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        Class v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        Class v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v67) {
          goto LABEL_139;
        }
        Class v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        Class v85 = v11;
        NSString v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        NSString v88 = v42;
        unint64_t v89 = v44;
        NSString v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_10001C0F4((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)NSString v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        int64_t v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        BOOL v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        Swift::Int v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    Swift::Int v3 = v106;
    if (v9 >= v106)
    {
      unint64_t v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    Swift::Int v32 = v3;
  }
  else {
    Swift::Int v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      id v33 = (void *)(v10 + 16 * v9);
      do
      {
        int v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        Swift::Int v37 = v13;
        unint64_t v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)unint64_t v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      Swift::Int v9 = v32;
    }
    goto LABEL_67;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10001C024(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    Swift::Int v9 = (uint64_t *)(v7 + 16 * v4);
    Swift::Int result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      Swift::Int result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_10001C0F4(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  Swift::Int v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      unint64_t v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      Swift::Int v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        int64_t v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          Swift::Int v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)int64_t v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)int64_t v18 = *(_OWORD *)v19;
            }
            Swift::Int v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    unint64_t v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }
        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      Swift::Int v27 = v7;
    }
LABEL_50:
    sub_10001C48C((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_10001C390(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100006ABC(&qword_10004E180);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_10001C48C(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_10001C548(uint64_t a1)
{
  return sub_10001C390(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10001C55C(uint64_t a1)
{
  return sub_10002E5C4(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10001C570(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_10001AE3C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_10001C60C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006ABC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001C670(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006ABC((uint64_t *)&unk_10004E060);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_10001C6D8()
{
  unint64_t result = qword_10004E1A0;
  if (!qword_10004E1A0)
  {
    type metadata accessor for PersonNameComponents();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004E1A0);
  }
  return result;
}

uint64_t sub_10001C730(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006ABC((uint64_t *)&unk_10004E060);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001C798()
{
  uint64_t v3 = type metadata accessor for AllContactsInBatches(0);
  uint64_t v4 = v0 + *(int *)(v3 + 20);
  uint64_t v5 = *(char **)v4;
  if (*(void *)v4)
  {
    uint64_t v7 = *(void *)(v4 + 8);
    int64_t v6 = *(void *)(v4 + 16);
    unint64_t v8 = *(void *)(v4 + 24);
  }
  else
  {
    uint64_t v5 = sub_10001D9FC();
    int64_t v6 = 0;
    uint64_t v9 = *((void *)v5 + 2);
    uint64_t v7 = (uint64_t)(v5 + 32);
    *(void *)uint64_t v4 = v5;
    *(void *)(v4 + 8) = v5 + 32;
    unint64_t v8 = (2 * v9) | 1;
    *(void *)(v4 + 16) = 0;
    *(void *)(v4 + 24) = v8;
  }
  if (v6 == v8 >> 1) {
    return 0;
  }
  if (v6 < (uint64_t)(v8 >> 1))
  {
    uint64_t v11 = *(void *)(v0 + *(int *)(v3 + 28));
    uint64_t v1 = sub_1000190D0(v11, (uint64_t)v5, v7, v6, v8);
    uint64_t v3 = v12;
    uint64_t v29 = v13;
    unint64_t v2 = v14;
    *(void *)uint64_t v4 = sub_10001914C(v11, (uint64_t)v5, v7, v6, v8);
    *(void *)(v4 + 8) = v15;
    *(void *)(v4 + 16) = v16;
    *(void *)(v4 + 24) = v17;
    uint64_t v18 = qword_10004D1A8;
    swift_unknownObjectRetain_n();
    if (v18 == -1) {
      goto LABEL_9;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_9:
  id v19 = objc_allocWithZone((Class)CNContactFetchRequest);
  swift_bridgeObjectRetain();
  sub_100006ABC(&qword_10004E6A0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v21 = [v19 initWithKeysToFetch:isa];

  if (v2)
  {
    type metadata accessor for __ContiguousArrayStorageBase();
    swift_unknownObjectRetain_n();
    BOOL v23 = (void *)swift_dynamicCastClass();
    if (!v23)
    {
      swift_unknownObjectRelease();
      BOOL v23 = _swiftEmptyArrayStorage;
    }
    uint64_t v24 = v23[2];
    swift_release();
    if (__OFSUB__(v2 >> 1, v29))
    {
      __break(1u);
    }
    else if (v24 == (v2 >> 1) - v29)
    {
      uint64_t v22 = v29;
      if (!swift_dynamicCastClass()) {
        swift_unknownObjectRelease();
      }
      goto LABEL_18;
    }
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRetain();
  }
  uint64_t v22 = v29;
  sub_10002E23C(v1, v3, v29, v2);
LABEL_18:
  swift_unknownObjectRelease();
  uint64_t v25 = self;
  Class v26 = Array._bridgeToObjectiveC()().super.isa;
  swift_release();
  id v27 = [v25 predicateForContactsWithIdentifiers:v26];

  [v21 setPredicate:v27];
  uint64_t v30 = 0;
  sub_10001DF30(&v30, v0, (uint64_t)v21, v1, v3, v22, v2);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v30;
}

uint64_t sub_10001CAA4()
{
  uint64_t v1 = sub_100006ABC((uint64_t *)&unk_10004DF40);
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v0 + *(int *)(type metadata accessor for AddressBookDetails(0) + 112);
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(v5, 1, v6);
  uint64_t result = 0;
  if (v9 != 1)
  {
    sub_10001E864(v5, (uint64_t)v4);
    uint64_t result = v8((uint64_t)v4, 1, v6);
    if (result == 1)
    {
LABEL_13:
      __break(1u);
      return result;
    }
    Date.timeIntervalSinceNow.getter();
    double v12 = v11;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v4, v6);
    if ((~*(void *)&v12 & 0x7FF0000000000000) != 0)
    {
      if (v12 > -9.22337204e18)
      {
        if (v12 < 9.22337204e18)
        {
          if (!__OFSUB__(0, (uint64_t)v12)) {
            return -(uint64_t)v12 / 86400;
          }
          goto LABEL_12;
        }
LABEL_11:
        __break(1u);
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_10001CC6C()
{
  uint64_t v1 = sub_100006ABC((uint64_t *)&unk_10004DF40);
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = v0 + *(int *)(type metadata accessor for AddressBookDetails(0) + 116);
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  unint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(v5, 1, v6);
  uint64_t result = 0;
  if (v9 != 1)
  {
    sub_10001E864(v5, (uint64_t)v4);
    uint64_t result = v8((uint64_t)v4, 1, v6);
    if (result == 1)
    {
LABEL_13:
      __break(1u);
      return result;
    }
    Date.timeIntervalSinceNow.getter();
    double v12 = v11;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v4, v6);
    if ((~*(void *)&v12 & 0x7FF0000000000000) != 0)
    {
      if (v12 > -9.22337204e18)
      {
        if (v12 < 9.22337204e18)
        {
          if (!__OFSUB__(0, (uint64_t)v12)) {
            return -(uint64_t)v12 / 86400;
          }
          goto LABEL_12;
        }
LABEL_11:
        __break(1u);
LABEL_12:
        __break(1u);
        goto LABEL_13;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_10001CE34(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Date();
  uint64_t v111 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3, v4);
  NSString v108 = (char *)&v100 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v7);
  Swift::Int v105 = (char *)&v100 - v8;
  uint64_t i = (int *)type metadata accessor for ContactDetails();
  uint64_t v11 = __chkstk_darwin(i, v10);
  uint64_t v13 = (char *)&v100 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11, v14);
  uint64_t v16 = (uint64_t)&v100 - v15;
  uint64_t v17 = sub_100006ABC((uint64_t *)&unk_10004DF40);
  uint64_t v19 = __chkstk_darwin(v17 - 8, v18);
  id v21 = (char *)&v100 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v19, v22);
  uint64_t v25 = (char *)&v100 - v24;
  uint64_t v27 = __chkstk_darwin(v23, v26);
  uint64_t v29 = (char *)&v100 - v28;
  uint64_t v31 = __chkstk_darwin(v27, v30);
  uint64_t v106 = (uint64_t)&v100 - v32;
  uint64_t v34 = __chkstk_darwin(v31, v33);
  uint64_t v109 = (uint64_t)&v100 - v35;
  __chkstk_darwin(v34, v36);
  unint64_t v38 = (char *)&v100 - v37;
  uint64_t v39 = type metadata accessor for AddressBookDetails(0);
  char v112 = (int *)v39;
  uint64_t v41 = *(int *)(v39 + 20);
  uint64_t v42 = *(void *)(v1 + v41);
  BOOL v43 = __OFADD__(v42, 1);
  uint64_t v44 = v42 + 1;
  if (v43) {
    goto LABEL_66;
  }
  Swift::Int v107 = v29;
  uint64_t v103 = v21;
  NSString v104 = v25;
  NSNumber v110 = v13;
  *(void *)(v1 + v41) = v44;
  if (qword_10004D180 != -1) {
LABEL_67:
  }
    uint64_t v39 = swift_once();
  unint64_t v45 = qword_10004EC68;
  __chkstk_darwin(v39, v40);
  *(&v100 - 2) = a1;
  swift_bridgeObjectRetain();
  char v46 = sub_10001D8B0((uint64_t (*)(uint64_t *))sub_10001E80C, (uint64_t)(&v100 - 4), v45);
  uint64_t result = swift_bridgeObjectRelease();
  if ((v46 & 1) == 0)
  {
    uint64_t v49 = v112[6];
    uint64_t v50 = *(void *)(v1 + v49);
    BOOL v43 = __OFADD__(v50, 1);
    uint64_t v51 = v50 + 1;
    if (v43)
    {
      __break(1u);
LABEL_69:
      __break(1u);
      goto LABEL_70;
    }
    *(void *)(v1 + v49) = v51;
    if (*(unsigned char *)(a1 + i[9]) == 1)
    {
      uint64_t v52 = v112[7];
      uint64_t v53 = *(void *)(v1 + v52);
      BOOL v43 = __OFADD__(v53, 1);
      uint64_t v54 = v53 + 1;
      if (v43)
      {
LABEL_70:
        __break(1u);
        goto LABEL_71;
      }
      *(void *)(v1 + v52) = v54;
    }
  }
  if (qword_10004D188 != -1) {
    uint64_t result = swift_once();
  }
  unint64_t v55 = qword_10004EC70;
  __chkstk_darwin(result, v48);
  *(&v100 - 2) = a1;
  swift_bridgeObjectRetain();
  char v56 = sub_10001D8B0((uint64_t (*)(uint64_t *))sub_10001E80C, (uint64_t)(&v100 - 4), v55);
  uint64_t result = swift_bridgeObjectRelease();
  if (v56)
  {
    uint64_t v57 = v112[8];
    uint64_t v58 = *(void *)(v1 + v57);
    BOOL v43 = __OFADD__(v58, 1);
    uint64_t v59 = v58 + 1;
    if (!v43)
    {
      *(void *)(v1 + v57) = v59;
      goto LABEL_13;
    }
    goto LABEL_69;
  }
LABEL_13:
  uint64_t v60 = a1 + i[24];
  sub_10001E864(v60, (uint64_t)v38);
  uint64_t v61 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v111 + 48);
  int v62 = v61(v38, 1, v3);
  sub_10001E8CC((uint64_t)v38);
  sub_100020CA0(a1, v16, (uint64_t (*)(void))type metadata accessor for ContactDetails);
  if (v62 == 1)
  {
    sub_100020C40(v16, (uint64_t (*)(void))type metadata accessor for ContactDetails);
    uint64_t v63 = (uint64_t)v110;
LABEL_20:
    sub_10001E92C(v60, v1 + v112[28]);
    goto LABEL_21;
  }
  uint64_t v102 = v60;
  uint64_t v64 = v109;
  sub_10001E864(v16 + i[24], v109);
  uint64_t result = v61((char *)v64, 1, v3);
  if (result == 1)
  {
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  uint64_t v65 = v106;
  sub_10001E864(v1 + v112[28], v106);
  int v66 = v61((char *)v65, 1, v3);
  uint64_t v100 = v16;
  unint64_t v101 = i;
  char v67 = v105;
  if (v66 == 1)
  {
    static Date.distantFuture.getter();
    sub_10001E8CC(v65);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v111 + 32))(v105, v65, v3);
  }
  uint64_t v68 = v109;
  char v69 = static Date.< infix(_:_:)();
  uint64_t v70 = *(void (**)(char *, uint64_t))(v111 + 8);
  v70(v67, v3);
  sub_100020C40(v100, (uint64_t (*)(void))type metadata accessor for ContactDetails);
  v70((char *)v68, v3);
  uint64_t v63 = (uint64_t)v110;
  uint64_t i = v101;
  uint64_t v60 = v102;
  if (v69) {
    goto LABEL_20;
  }
LABEL_21:
  uint64_t v71 = a1 + i[25];
  uint64_t v72 = (uint64_t)v107;
  sub_10001E864(v71, (uint64_t)v107);
  int v73 = v61((char *)v72, 1, v3);
  sub_10001E8CC(v72);
  sub_100020CA0(a1, v63, (uint64_t (*)(void))type metadata accessor for ContactDetails);
  if (v73 != 1)
  {
    uint64_t v74 = v63 + i[25];
    uint64_t v75 = (uint64_t)v104;
    sub_10001E864(v74, (uint64_t)v104);
    uint64_t result = v61((char *)v75, 1, v3);
    if (result != 1)
    {
      uint64_t v76 = v1 + v112[29];
      uint64_t v77 = (uint64_t)v103;
      sub_10001E864(v76, (uint64_t)v103);
      if (v61((char *)v77, 1, v3) == 1)
      {
        static Date.distantPast.getter();
        sub_10001E8CC(v77);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v111 + 32))(v108, v77, v3);
      }
      uint64_t v78 = v108;
      char v79 = static Date.> infix(_:_:)();
      uint64_t v80 = v75;
      uint64_t v81 = *(void (**)(char *, uint64_t))(v111 + 8);
      v81(v78, v3);
      sub_100020C40((uint64_t)v110, (uint64_t (*)(void))type metadata accessor for ContactDetails);
      uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v81)(v80, v3);
      if (v79) {
        uint64_t result = sub_10001E92C(v71, v76);
      }
      goto LABEL_29;
    }
LABEL_72:
    __break(1u);
    return result;
  }
  uint64_t result = sub_100020C40(v63, (uint64_t (*)(void))type metadata accessor for ContactDetails);
LABEL_29:
  if (qword_10004D190 != -1) {
    uint64_t result = swift_once();
  }
  uint64_t v82 = qword_10004EC78;
  uint64_t v83 = *(void *)(qword_10004EC78 + 16);
  if (!v83) {
    goto LABEL_39;
  }
  swift_bridgeObjectRetain();
  uint64_t v84 = v82 + 56;
  while (1)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_getAtKeyPath();
    if (v113[0] == 1) {
      break;
    }
LABEL_33:
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    v84 += 32;
    if (!--v83) {
      goto LABEL_38;
    }
  }
  Class v85 = (void (*)(unsigned __int8 *, void))swift_modifyAtWritableKeyPath();
  if (!__OFADD__(*v86, 1))
  {
    ++*v86;
    v85(v113, 0);
    goto LABEL_33;
  }
  __break(1u);
LABEL_38:
  uint64_t result = swift_bridgeObjectRelease();
LABEL_39:
  if (qword_10004D1A0 != -1) {
    uint64_t result = swift_once();
  }
  uint64_t v87 = qword_10004EC88;
  uint64_t v88 = *(void *)(qword_10004EC88 + 16);
  if (!v88) {
    goto LABEL_49;
  }
  swift_bridgeObjectRetain();
  uint64_t v89 = v87 + 40;
  while (2)
  {
    swift_retain();
    swift_retain();
    swift_getAtKeyPath();
    if (v113[0] != 1)
    {
LABEL_43:
      swift_release();
      swift_release();
      v89 += 16;
      if (!--v88) {
        goto LABEL_48;
      }
      continue;
    }
    break;
  }
  NSString v90 = (void (*)(unsigned __int8 *, void))swift_modifyAtWritableKeyPath();
  if (!__OFADD__(*v91, 1))
  {
    ++*v91;
    v90(v113, 0);
    goto LABEL_43;
  }
  __break(1u);
LABEL_48:
  uint64_t result = swift_bridgeObjectRelease();
LABEL_49:
  if (qword_10004D198 != -1) {
    uint64_t result = swift_once();
  }
  uint64_t v92 = qword_10004EC80;
  uint64_t v93 = *(void *)(qword_10004EC80 + 16);
  if (v93)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = (int *)(v92 + 56); ; i += 8)
    {
      uint64_t v3 = *((void *)i - 2);
      unint64_t v38 = (char *)*((void *)i - 1);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_getAtKeyPath();
      uint64_t v16 = *(void *)v113;
      Class v97 = (void (*)(unsigned __int8 *, void))swift_modifyAtWritableKeyPath();
      if (__OFADD__(*v98, v16)) {
        break;
      }
      *v98 += v16;
      if (v98[1] < v16) {
        v98[1] = v16;
      }
      if (v16 < 1)
      {
        uint64_t v95 = v98[3];
        NSString v94 = v98 + 3;
        uint64_t v96 = v95 + 1;
        if (__OFADD__(v95, 1)) {
          goto LABEL_65;
        }
      }
      else
      {
        uint64_t v99 = v98[2];
        NSString v94 = v98 + 2;
        uint64_t v96 = v99 + 1;
        if (__OFADD__(v99, 1))
        {
          __break(1u);
          return swift_bridgeObjectRelease();
        }
      }
      *NSString v94 = v96;
      v97(v113, 0);
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      if (!--v93) {
        return swift_bridgeObjectRelease();
      }
    }
    __break(1u);
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  return result;
}

uint64_t sub_10001D8B0(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62)
  {
LABEL_17:
    swift_bridgeObjectRetain();
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
    {
LABEL_3:
      uint64_t v6 = 4;
      do
      {
        uint64_t v7 = v6 - 4;
        if ((a3 & 0xC000000000000001) != 0)
        {
          uint64_t v8 = specialized _ArrayBuffer._getElementSlowPath(_:)();
          uint64_t v9 = v6 - 3;
          if (__OFADD__(v7, 1)) {
            goto LABEL_16;
          }
        }
        else
        {
          uint64_t v8 = *(void *)(a3 + 8 * v6);
          swift_retain();
          uint64_t v9 = v6 - 3;
          if (__OFADD__(v7, 1))
          {
LABEL_16:
            __break(1u);
            goto LABEL_17;
          }
        }
        uint64_t v15 = v8;
        char v10 = a1(&v15);
        if (v3)
        {
          swift_bridgeObjectRelease();
          swift_release();
          return v12 & 1;
        }
        char v11 = v10;
        swift_release();
        if (v11)
        {
          swift_bridgeObjectRelease();
          char v12 = 1;
          return v12 & 1;
        }
        ++v6;
      }
      while (v9 != v5);
    }
  }
  swift_bridgeObjectRelease();
  char v12 = 0;
  return v12 & 1;
}

char *sub_10001D9FC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void **)(v0 + *(int *)(type metadata accessor for AllContactsInBatches(0) + 24));
  sub_100006ABC((uint64_t *)&unk_10004E1B0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1000395C0;
  *(void *)(v8 + 32) = CNContactIdentifierKey;
  unint64_t v37 = v8;
  specialized Array._endMutation()();
  id v9 = objc_allocWithZone((Class)CNContactFetchRequest);
  char v10 = CNContactIdentifierKey;
  sub_100006ABC(&qword_10004E6A0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v12 = [v9 initWithKeysToFetch:isa];

  unint64_t v37 = 0;
  id v13 = [v7 executeFetchRequest:v12 error:&v37];

  if (!v13)
  {
    id v29 = (id)v37;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v1, v2);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 136315138;
      v36[1] = v32 + 4;
      swift_getErrorValue();
      uint64_t v33 = Error.localizedDescription.getter();
      unint64_t v37 = sub_1000253D0(v33, v34, &v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "failed to fetch contact identifiers: %s", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    swift_errorRelease();
    return (char *)_swiftEmptyArrayStorage;
  }
  id v14 = (id)v37;
  id v15 = [v13 value];

  uint64_t v38 = (uint64_t)v15;
  sub_100006ABC((uint64_t *)&unk_10004E1C0);
  swift_dynamicCast();
  unint64_t v16 = v37;
  if (v37 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = _CocoaArrayWrapper.endIndex.getter();
    if (v17) {
      goto LABEL_4;
    }
    goto LABEL_20;
  }
  uint64_t v17 = *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v17)
  {
LABEL_20:
    swift_bridgeObjectRelease_n();
    return (char *)_swiftEmptyArrayStorage;
  }
LABEL_4:
  if (v17 < 1) {
    __break(1u);
  }
  uint64_t v18 = 0;
  uint64_t v19 = (char *)_swiftEmptyArrayStorage;
  do
  {
    if ((v16 & 0xC000000000000001) != 0) {
      id v20 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v20 = *(id *)(v16 + 8 * v18 + 32);
    }
    id v21 = v20;
    id v22 = [v20 identifier];
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v25 = v24;

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v19 = sub_10002E008(0, *((void *)v19 + 2) + 1, 1, v19);
    }
    unint64_t v27 = *((void *)v19 + 2);
    unint64_t v26 = *((void *)v19 + 3);
    if (v27 >= v26 >> 1) {
      uint64_t v19 = sub_10002E008((char *)(v26 > 1), v27 + 1, 1, v19);
    }
    ++v18;
    *((void *)v19 + 2) = v27 + 1;
    uint64_t v28 = &v19[16 * v27];
    *((void *)v28 + 4) = v23;
    *((void *)v28 + 5) = v25;
  }
  while (v17 != v18);
  swift_bridgeObjectRelease_n();
  return v19;
}

uint64_t type metadata accessor for AllContactsInBatches(uint64_t a1)
{
  return sub_10000C75C(a1, qword_10004E320);
}

uint64_t sub_10001DF30(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v37 = a4;
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v36 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v13);
  id v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v16 = *(void **)(a2 + *(int *)(type metadata accessor for AllContactsInBatches(0) + 24));
  id v39 = 0;
  id v17 = [v16 executeFetchRequest:a3 error:&v39];
  if (v17)
  {
    uint64_t v18 = v17;
    id v19 = v39;
    id v20 = [v18 value];

    id v39 = v20;
    sub_100006ABC((uint64_t *)&unk_10004E1C0);
    int v21 = swift_dynamicCast();
    uint64_t v22 = v38;
    if (!v21) {
      uint64_t v22 = 0;
    }
    *a1 = v22;
    return swift_bridgeObjectRelease();
  }
  else
  {
    id v24 = v39;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v15, a2, v12);
    swift_errorRetain();
    swift_errorRetain();
    swift_unknownObjectRetain();
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v32 = v15;
      uint64_t v33 = v12;
      os_log_t v34 = v25;
      uint64_t v35 = 0;
      uint64_t v27 = swift_slowAlloc();
      os_log_type_t v31 = (void *)swift_slowAlloc();
      id v39 = v31;
      *(_DWORD *)uint64_t v27 = 134218242;
      if (__OFSUB__(a7 >> 1, a6)) {
        __break(1u);
      }
      uint64_t v38 = (a7 >> 1) - a6;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_unknownObjectRelease();
      *(_WORD *)(v27 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v28 = Error.localizedDescription.getter();
      uint64_t v38 = sub_1000253D0(v28, v29, (uint64_t *)&v39);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      os_log_t v30 = v34;
      _os_log_impl((void *)&_mh_execute_header, v34, v26, "failed to fetch batch of %ld: %s", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v32, v33);
    }
    else
    {
      swift_errorRelease();
      swift_unknownObjectRelease();
      swift_errorRelease();
      swift_errorRelease();

      return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v15, v12);
    }
  }
}

uint64_t sub_10001E30C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000206CC(v1, a1);
}

uint64_t sub_10001E318()
{
  return 0;
}

uint64_t sub_10001E320()
{
  return 2;
}

uint64_t sub_10001E328()
{
  uint64_t v1 = sub_100020730(v0);
  sub_100020C40(v0, type metadata accessor for AllContactsInBatches);
  return v1;
}

uint64_t sub_10001E374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v43 = type metadata accessor for AllContactsInBatches(0);
  __chkstk_darwin(v43, v8);
  char v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_1000206CC(v4, (uint64_t)v10);
  uint64_t v42 = a2;
  if (!a2)
  {
    a3 = 0;
    goto LABEL_46;
  }
  if (!a3)
  {
LABEL_46:
    sub_1000206CC((uint64_t)v10, a1);
    return a3;
  }
  if (a3 < 0) {
    goto LABEL_57;
  }
  uint64_t v39 = a1;
  uint64_t v40 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = (uint64_t *)&v10[*(int *)(v43 + 20)];
  uint64_t v41 = v10;
  while (1)
  {
    uint64_t v45 = v13;
    uint64_t v15 = *v14;
    if (*v14)
    {
      uint64_t v16 = v14[1];
      uint64_t v17 = v14[2];
      unint64_t v18 = v14[3];
    }
    else
    {
      uint64_t result = (uint64_t)sub_10001D9FC();
      uint64_t v15 = result;
      uint64_t v17 = 0;
      uint64_t v16 = result + 32;
      unint64_t v18 = (2 * *(void *)(result + 16)) | 1;
      *uint64_t v14 = result;
      v14[1] = result + 32;
      v14[2] = 0;
      v14[3] = v18;
    }
    int64_t v19 = v18 >> 1;
    if (v17 == v18 >> 1)
    {
      a3 = v12;
LABEL_45:
      a1 = v39;
      goto LABEL_46;
    }
    if (v17 >= (uint64_t)(v18 >> 1)) {
      break;
    }
    int64_t v20 = *(void *)&v10[*(int *)(v43 + 28)];
    if (v20 < 0) {
      goto LABEL_47;
    }
    int64_t v21 = v19 - v17;
    if (__OFSUB__(v19, v17)) {
      goto LABEL_48;
    }
    if (!v20 || v21 < 0 || (int64_t v22 = v18 >> 1, v21 >= v20))
    {
      int64_t v22 = v17 + v20;
      if (__OFADD__(v17, v20)) {
        goto LABEL_54;
      }
    }
    if (v22 < v17) {
      goto LABEL_49;
    }
    if (v19 < v22) {
      goto LABEL_50;
    }
    if (v22 < 0) {
      goto LABEL_51;
    }
    if (!v20 || v21 < 0 || v21 >= v20)
    {
      BOOL v23 = __OFADD__(v17, v20);
      int64_t v24 = v17 + v20;
      if (v23) {
        goto LABEL_55;
      }
      if (v19 < v24) {
        goto LABEL_52;
      }
      int64_t v19 = v24;
    }
    if (v19 < v17) {
      goto LABEL_53;
    }
    uint64_t v44 = v12;
    *uint64_t v14 = v15;
    v14[1] = v16;
    v14[2] = v19;
    v14[3] = v18;
    uint64_t v25 = qword_10004D1A8;
    swift_unknownObjectRetain_n();
    if (v25 != -1) {
      swift_once();
    }
    unint64_t v26 = v18 & 1 | (2 * v22);
    id v27 = objc_allocWithZone((Class)CNContactFetchRequest);
    swift_bridgeObjectRetain();
    sub_100006ABC(&qword_10004E6A0);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v29 = [v27 initWithKeysToFetch:isa];

    if ((v18 & 1) == 0)
    {
      swift_unknownObjectRetain();
LABEL_31:
      sub_10002E23C(v15, v16, v17, v26);
      goto LABEL_38;
    }
    type metadata accessor for __ContiguousArrayStorageBase();
    swift_unknownObjectRetain_n();
    os_log_t v30 = (void *)swift_dynamicCastClass();
    if (!v30)
    {
      swift_unknownObjectRelease();
      os_log_t v30 = _swiftEmptyArrayStorage;
    }
    uint64_t v31 = v30[2];
    uint64_t result = swift_release();
    if (__OFSUB__(v22, v17)) {
      goto LABEL_56;
    }
    if (v31 != v22 - v17)
    {
      swift_unknownObjectRelease();
      goto LABEL_31;
    }
    if (!swift_dynamicCastClass()) {
      swift_unknownObjectRelease();
    }
LABEL_38:
    swift_unknownObjectRelease();
    uint64_t v32 = self;
    Class v33 = Array._bridgeToObjectiveC()().super.isa;
    swift_release();
    id v34 = [v32 predicateForContactsWithIdentifiers:v33];

    [v29 setPredicate:v34];
    uint64_t v46 = 0;
    char v10 = v41;
    uint64_t v36 = v16;
    uint64_t v13 = v45;
    sub_10001DF30(&v46, (uint64_t)v41, (uint64_t)v29, v15, v36, v17, v26);

    uint64_t result = swift_unknownObjectRelease_n();
    if (!v46)
    {
      a3 = v44;
      goto LABEL_45;
    }
    uint64_t v37 = v44;
    *(void *)(v42 + 8 * v44) = v46;
    uint64_t v12 = v37 + 1;
    a3 = v40;
    if (v40 == v37 + 1) {
      goto LABEL_45;
    }
  }
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
  return result;
}

uint64_t sub_10001E7A0()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t sub_10001E7C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001C798();
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for AddressBookDetails(uint64_t a1)
{
  return sub_10000C75C(a1, qword_10004E228);
}

uint64_t sub_10001E80C()
{
  return sub_10001E828() & 1;
}

uint64_t sub_10001E828()
{
  swift_getAtKeyPath();
  return v1;
}

uint64_t sub_10001E864(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006ABC((uint64_t *)&unk_10004DF40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001E8CC(uint64_t a1)
{
  uint64_t v2 = sub_100006ABC((uint64_t *)&unk_10004DF40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001E92C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006ABC((uint64_t *)&unk_10004DF40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t *sub_10001E994(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v44 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v44 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for Logger();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    uint64_t v9 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    uint64_t v10 = a3[10];
    *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    *(uint64_t *)((char *)a1 + v10) = *(uint64_t *)((char *)a2 + v10);
    uint64_t v11 = a3[12];
    *(uint64_t *)((char *)a1 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
    *(uint64_t *)((char *)a1 + v11) = *(uint64_t *)((char *)a2 + v11);
    uint64_t v12 = a3[14];
    *(uint64_t *)((char *)a1 + a3[13]) = *(uint64_t *)((char *)a2 + a3[13]);
    *(uint64_t *)((char *)a1 + v12) = *(uint64_t *)((char *)a2 + v12);
    uint64_t v13 = a3[16];
    *(uint64_t *)((char *)a1 + a3[15]) = *(uint64_t *)((char *)a2 + a3[15]);
    *(uint64_t *)((char *)a1 + v13) = *(uint64_t *)((char *)a2 + v13);
    uint64_t v14 = a3[18];
    *(uint64_t *)((char *)a1 + a3[17]) = *(uint64_t *)((char *)a2 + a3[17]);
    *(uint64_t *)((char *)a1 + v14) = *(uint64_t *)((char *)a2 + v14);
    uint64_t v15 = a3[20];
    *(uint64_t *)((char *)a1 + a3[19]) = *(uint64_t *)((char *)a2 + a3[19]);
    *(uint64_t *)((char *)a1 + v15) = *(uint64_t *)((char *)a2 + v15);
    uint64_t v16 = a3[22];
    *(uint64_t *)((char *)a1 + a3[21]) = *(uint64_t *)((char *)a2 + a3[21]);
    *(uint64_t *)((char *)a1 + v16) = *(uint64_t *)((char *)a2 + v16);
    uint64_t v17 = a3[23];
    uint64_t v18 = a3[24];
    int64_t v19 = (_OWORD *)((char *)a1 + v17);
    int64_t v20 = (_OWORD *)((char *)a2 + v17);
    long long v21 = v20[1];
    *int64_t v19 = *v20;
    v19[1] = v21;
    int64_t v22 = (_OWORD *)((char *)a1 + v18);
    BOOL v23 = (_OWORD *)((char *)a2 + v18);
    long long v24 = v23[1];
    *int64_t v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = a3[25];
    uint64_t v26 = a3[26];
    id v27 = (_OWORD *)((char *)a1 + v25);
    uint64_t v28 = (_OWORD *)((char *)a2 + v25);
    long long v29 = v28[1];
    *id v27 = *v28;
    v27[1] = v29;
    os_log_t v30 = (_OWORD *)((char *)a1 + v26);
    uint64_t v31 = (_OWORD *)((char *)a2 + v26);
    long long v32 = v31[1];
    *os_log_t v30 = *v31;
    v30[1] = v32;
    uint64_t v33 = a3[27];
    uint64_t v34 = a3[28];
    long long v35 = *(_OWORD *)((char *)a2 + v33);
    long long v36 = *(_OWORD *)((char *)a2 + v33 + 16);
    uint64_t v37 = (_OWORD *)((char *)a1 + v33);
    _OWORD *v37 = v35;
    v37[1] = v36;
    uint64_t v38 = (char *)a1 + v34;
    uint64_t v39 = (char *)a2 + v34;
    uint64_t v40 = type metadata accessor for Date();
    uint64_t v41 = *(void *)(v40 - 8);
    uint64_t v42 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48);
    if (v42(v39, 1, v40))
    {
      uint64_t v43 = sub_100006ABC((uint64_t *)&unk_10004DF40);
      memcpy(v38, v39, *(void *)(*(void *)(v43 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v38, v39, v40);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
    }
    uint64_t v45 = a3[29];
    uint64_t v46 = (char *)a1 + v45;
    uint64_t v47 = (char *)a2 + v45;
    if (v42(v47, 1, v40))
    {
      uint64_t v48 = sub_100006ABC((uint64_t *)&unk_10004DF40);
      memcpy(v46, v47, *(void *)(*(void *)(v48 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v46, v47, v40);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v41 + 56))(v46, 0, 1, v40);
    }
  }
  return a1;
}

uint64_t sub_10001ECEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 112);
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v11 = *(void *)(v6 - 8);
  uint64_t v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (!v7(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v5, v6);
  }
  uint64_t v8 = a1 + *(int *)(a2 + 116);
  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(v8, 1, v6);
  if (!result)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
    return v10(v8, v6);
  }
  return result;
}

uint64_t sub_10001EE44(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  uint64_t v11 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v13 = a3[18];
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  uint64_t v14 = a3[20];
  *(void *)(a1 + a3[19]) = *(void *)(a2 + a3[19]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  uint64_t v15 = a3[22];
  *(void *)(a1 + a3[21]) = *(void *)(a2 + a3[21]);
  *(void *)(a1 + v15) = *(void *)(a2 + v15);
  uint64_t v16 = a3[23];
  uint64_t v17 = a3[24];
  uint64_t v18 = (_OWORD *)(a1 + v16);
  int64_t v19 = (_OWORD *)(a2 + v16);
  long long v20 = v19[1];
  _OWORD *v18 = *v19;
  v18[1] = v20;
  long long v21 = (_OWORD *)(a1 + v17);
  int64_t v22 = (_OWORD *)(a2 + v17);
  long long v23 = v22[1];
  *long long v21 = *v22;
  v21[1] = v23;
  uint64_t v24 = a3[25];
  uint64_t v25 = a3[26];
  uint64_t v26 = (_OWORD *)(a1 + v24);
  id v27 = (_OWORD *)(a2 + v24);
  long long v28 = v27[1];
  *uint64_t v26 = *v27;
  v26[1] = v28;
  long long v29 = (_OWORD *)(a1 + v25);
  os_log_t v30 = (_OWORD *)(a2 + v25);
  long long v31 = v30[1];
  _OWORD *v29 = *v30;
  v29[1] = v31;
  uint64_t v32 = a3[27];
  uint64_t v33 = a3[28];
  long long v34 = *(_OWORD *)(a2 + v32);
  long long v35 = *(_OWORD *)(a2 + v32 + 16);
  long long v36 = (_OWORD *)(a1 + v32);
  _OWORD *v36 = v34;
  v36[1] = v35;
  uint64_t v37 = (void *)(a1 + v33);
  uint64_t v38 = (const void *)(a2 + v33);
  uint64_t v39 = type metadata accessor for Date();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v40 + 48);
  if (v41(v38, 1, v39))
  {
    uint64_t v42 = sub_100006ABC((uint64_t *)&unk_10004DF40);
    memcpy(v37, v38, *(void *)(*(void *)(v42 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v40 + 16))(v37, v38, v39);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
  }
  uint64_t v43 = a3[29];
  uint64_t v44 = (void *)(a1 + v43);
  uint64_t v45 = (const void *)(a2 + v43);
  if (v41(v45, 1, v39))
  {
    uint64_t v46 = sub_100006ABC((uint64_t *)&unk_10004DF40);
    memcpy(v44, v45, *(void *)(*(void *)(v46 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v40 + 16))(v44, v45, v39);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v44, 0, 1, v39);
  }
  return a1;
}

uint64_t sub_10001F14C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + a3[6]) = *(void *)(a2 + a3[6]);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + a3[8]) = *(void *)(a2 + a3[8]);
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + a3[10]) = *(void *)(a2 + a3[10]);
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + a3[12]) = *(void *)(a2 + a3[12]);
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + a3[14]) = *(void *)(a2 + a3[14]);
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  *(void *)(a1 + a3[16]) = *(void *)(a2 + a3[16]);
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  *(void *)(a1 + a3[18]) = *(void *)(a2 + a3[18]);
  *(void *)(a1 + a3[19]) = *(void *)(a2 + a3[19]);
  *(void *)(a1 + a3[20]) = *(void *)(a2 + a3[20]);
  *(void *)(a1 + a3[21]) = *(void *)(a2 + a3[21]);
  *(void *)(a1 + a3[22]) = *(void *)(a2 + a3[22]);
  uint64_t v7 = a3[23];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  uint64_t v10 = a3[24];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  void *v11 = *v12;
  v11[1] = v12[1];
  v11[2] = v12[2];
  v11[3] = v12[3];
  uint64_t v13 = a3[25];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  v14[2] = v15[2];
  v14[3] = v15[3];
  uint64_t v16 = a3[26];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (void *)(a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  v17[2] = v18[2];
  void v17[3] = v18[3];
  uint64_t v19 = a3[27];
  long long v20 = (void *)(a1 + v19);
  long long v21 = (void *)(a2 + v19);
  void *v20 = *v21;
  v20[1] = v21[1];
  _OWORD v20[2] = v21[2];
  void v20[3] = v21[3];
  uint64_t v22 = a3[28];
  long long v23 = (void *)(a1 + v22);
  uint64_t v24 = (void *)(a2 + v22);
  uint64_t v25 = type metadata accessor for Date();
  uint64_t v26 = *(void *)(v25 - 8);
  id v27 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v26 + 48);
  int v28 = v27(v23, 1, v25);
  int v29 = v27(v24, 1, v25);
  if (v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, void *, uint64_t))(v26 + 16))(v23, v24, v25);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v29)
  {
    (*(void (**)(void *, uint64_t))(v26 + 8))(v23, v25);
LABEL_6:
    uint64_t v30 = sub_100006ABC((uint64_t *)&unk_10004DF40);
    memcpy(v23, v24, *(void *)(*(void *)(v30 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v26 + 24))(v23, v24, v25);
LABEL_7:
  uint64_t v31 = a3[29];
  uint64_t v32 = (void *)(a1 + v31);
  uint64_t v33 = (void *)(a2 + v31);
  int v34 = v27((void *)(a1 + v31), 1, v25);
  int v35 = v27(v33, 1, v25);
  if (!v34)
  {
    if (!v35)
    {
      (*(void (**)(void *, void *, uint64_t))(v26 + 24))(v32, v33, v25);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v26 + 8))(v32, v25);
    goto LABEL_12;
  }
  if (v35)
  {
LABEL_12:
    uint64_t v36 = sub_100006ABC((uint64_t *)&unk_10004DF40);
    memcpy(v32, v33, *(void *)(*(void *)(v36 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v26 + 16))(v32, v33, v25);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56))(v32, 0, 1, v25);
  return a1;
}

uint64_t sub_10001F5B8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  uint64_t v11 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v13 = a3[18];
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  uint64_t v14 = a3[20];
  *(void *)(a1 + a3[19]) = *(void *)(a2 + a3[19]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  uint64_t v15 = a3[22];
  *(void *)(a1 + a3[21]) = *(void *)(a2 + a3[21]);
  *(void *)(a1 + v15) = *(void *)(a2 + v15);
  uint64_t v16 = a3[23];
  uint64_t v17 = a3[24];
  uint64_t v18 = (_OWORD *)(a1 + v16);
  uint64_t v19 = (_OWORD *)(a2 + v16);
  long long v20 = v19[1];
  _OWORD *v18 = *v19;
  v18[1] = v20;
  long long v21 = (_OWORD *)(a1 + v17);
  uint64_t v22 = (_OWORD *)(a2 + v17);
  long long v23 = v22[1];
  *long long v21 = *v22;
  v21[1] = v23;
  uint64_t v24 = a3[25];
  uint64_t v25 = a3[26];
  uint64_t v26 = (_OWORD *)(a1 + v24);
  id v27 = (_OWORD *)(a2 + v24);
  long long v28 = v27[1];
  *uint64_t v26 = *v27;
  v26[1] = v28;
  int v29 = (_OWORD *)(a1 + v25);
  uint64_t v30 = (_OWORD *)(a2 + v25);
  long long v31 = v30[1];
  _OWORD *v29 = *v30;
  v29[1] = v31;
  uint64_t v32 = a3[27];
  uint64_t v33 = a3[28];
  long long v34 = *(_OWORD *)(a2 + v32);
  long long v35 = *(_OWORD *)(a2 + v32 + 16);
  uint64_t v36 = (_OWORD *)(a1 + v32);
  _OWORD *v36 = v34;
  v36[1] = v35;
  uint64_t v37 = (void *)(a1 + v33);
  uint64_t v38 = (const void *)(a2 + v33);
  uint64_t v39 = type metadata accessor for Date();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v40 + 48);
  if (v41(v38, 1, v39))
  {
    uint64_t v42 = sub_100006ABC((uint64_t *)&unk_10004DF40);
    memcpy(v37, v38, *(void *)(*(void *)(v42 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v40 + 32))(v37, v38, v39);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
  }
  uint64_t v43 = a3[29];
  uint64_t v44 = (void *)(a1 + v43);
  uint64_t v45 = (const void *)(a2 + v43);
  if (v41(v45, 1, v39))
  {
    uint64_t v46 = sub_100006ABC((uint64_t *)&unk_10004DF40);
    memcpy(v44, v45, *(void *)(*(void *)(v46 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v40 + 32))(v44, v45, v39);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v44, 0, 1, v39);
  }
  return a1;
}

uint64_t sub_10001F8C0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);
  uint64_t v11 = a3[14];
  *(void *)(a1 + a3[13]) = *(void *)(a2 + a3[13]);
  *(void *)(a1 + v11) = *(void *)(a2 + v11);
  uint64_t v12 = a3[16];
  *(void *)(a1 + a3[15]) = *(void *)(a2 + a3[15]);
  *(void *)(a1 + v12) = *(void *)(a2 + v12);
  uint64_t v13 = a3[18];
  *(void *)(a1 + a3[17]) = *(void *)(a2 + a3[17]);
  *(void *)(a1 + v13) = *(void *)(a2 + v13);
  uint64_t v14 = a3[20];
  *(void *)(a1 + a3[19]) = *(void *)(a2 + a3[19]);
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  uint64_t v15 = a3[22];
  *(void *)(a1 + a3[21]) = *(void *)(a2 + a3[21]);
  *(void *)(a1 + v15) = *(void *)(a2 + v15);
  uint64_t v16 = a3[23];
  uint64_t v17 = a3[24];
  uint64_t v18 = (_OWORD *)(a1 + v16);
  uint64_t v19 = (_OWORD *)(a2 + v16);
  long long v20 = v19[1];
  _OWORD *v18 = *v19;
  v18[1] = v20;
  long long v21 = (_OWORD *)(a1 + v17);
  uint64_t v22 = (_OWORD *)(a2 + v17);
  long long v23 = v22[1];
  *long long v21 = *v22;
  v21[1] = v23;
  uint64_t v24 = a3[25];
  uint64_t v25 = a3[26];
  uint64_t v26 = (_OWORD *)(a1 + v24);
  id v27 = (_OWORD *)(a2 + v24);
  long long v28 = v27[1];
  *uint64_t v26 = *v27;
  v26[1] = v28;
  int v29 = (_OWORD *)(a1 + v25);
  uint64_t v30 = (_OWORD *)(a2 + v25);
  long long v31 = v30[1];
  _OWORD *v29 = *v30;
  v29[1] = v31;
  uint64_t v32 = a3[27];
  uint64_t v33 = a3[28];
  long long v34 = *(_OWORD *)(a2 + v32);
  long long v35 = *(_OWORD *)(a2 + v32 + 16);
  uint64_t v36 = (_OWORD *)(a1 + v32);
  _OWORD *v36 = v34;
  v36[1] = v35;
  uint64_t v37 = (void *)(a1 + v33);
  uint64_t v38 = (void *)(a2 + v33);
  uint64_t v39 = type metadata accessor for Date();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v40 + 48);
  int v42 = v41(v37, 1, v39);
  int v43 = v41(v38, 1, v39);
  if (v42)
  {
    if (!v43)
    {
      (*(void (**)(void *, void *, uint64_t))(v40 + 32))(v37, v38, v39);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v37, 0, 1, v39);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v43)
  {
    (*(void (**)(void *, uint64_t))(v40 + 8))(v37, v39);
LABEL_6:
    uint64_t v44 = sub_100006ABC((uint64_t *)&unk_10004DF40);
    memcpy(v37, v38, *(void *)(*(void *)(v44 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v40 + 40))(v37, v38, v39);
LABEL_7:
  uint64_t v45 = a3[29];
  uint64_t v46 = (void *)(a1 + v45);
  uint64_t v47 = (void *)(a2 + v45);
  int v48 = v41((void *)(a1 + v45), 1, v39);
  int v49 = v41(v47, 1, v39);
  if (!v48)
  {
    if (!v49)
    {
      (*(void (**)(void *, void *, uint64_t))(v40 + 40))(v46, v47, v39);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v40 + 8))(v46, v39);
    goto LABEL_12;
  }
  if (v49)
  {
LABEL_12:
    uint64_t v50 = sub_100006ABC((uint64_t *)&unk_10004DF40);
    memcpy(v46, v47, *(void *)(*(void *)(v50 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v40 + 32))(v46, v47, v39);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v40 + 56))(v46, 0, 1, v39);
  return a1;
}

uint64_t sub_10001FC84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001FC98);
}

uint64_t sub_10001FC98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_100006ABC((uint64_t *)&unk_10004DF40);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 112);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_10001FD94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001FDA8);
}

uint64_t sub_10001FDA8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_100006ABC((uint64_t *)&unk_10004DF40);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 112);
    return v13(v15, a2, a2, v14);
  }
}

void sub_10001FEB0()
{
  type metadata accessor for Logger();
  if (v0 <= 0x3F)
  {
    sub_10000B6F4();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *sub_10001FFB8(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for Logger();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (char *)a1 + v8;
    uint64_t v11 = (char *)a2 + v8;
    *((void *)v10 + 3) = *((void *)v11 + 3);
    long long v12 = *(_OWORD *)(v11 + 8);
    *(void *)uint64_t v10 = *(void *)v11;
    *(_OWORD *)(v10 + 8) = v12;
    uint64_t v13 = *(void **)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + v9) = (uint64_t)v13;
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    swift_unknownObjectRetain();
    id v14 = v13;
  }
  return a1;
}

void sub_1000200B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_unknownObjectRelease();
  int v5 = *(void **)(a1 + *(int *)(a2 + 24));
}

uint64_t sub_100020138(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(void *)(v9 + 24) = *(void *)(v10 + 24);
  long long v11 = *(_OWORD *)(v10 + 8);
  *(void *)uint64_t v9 = *(void *)v10;
  *(_OWORD *)(v9 + 8) = v11;
  long long v12 = *(void **)(a2 + v8);
  *(void *)(a1 + v8) = v12;
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_unknownObjectRetain();
  id v13 = v12;
  return a1;
}

uint64_t sub_1000201E8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  uint64_t v10 = a3[6];
  long long v11 = *(void **)(a2 + v10);
  long long v12 = *(void **)(a1 + v10);
  *(void *)(a1 + v10) = v11;
  id v13 = v11;

  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_1000202C0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (_OWORD *)(a1 + v7);
  uint64_t v10 = (_OWORD *)(a2 + v7);
  long long v11 = v10[1];
  _OWORD *v9 = *v10;
  v9[1] = v11;
  *(void *)(a1 + v8) = *(void *)(a2 + v8);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_100020358(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_unknownObjectRelease();
  *(void *)(v8 + 8) = *(void *)(v9 + 8);
  *(_OWORD *)(v8 + 16) = *(_OWORD *)(v9 + 16);
  uint64_t v10 = a3[6];
  long long v11 = *(void **)(a1 + v10);
  *(void *)(a1 + v10) = *(void *)(a2 + v10);

  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_10002041C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100020430);
}

uint64_t sub_100020430(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1000204F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100020504);
}

uint64_t sub_100020504(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_1000205C0()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_100020674()
{
  unint64_t result = qword_10004E360;
  if (!qword_10004E360)
  {
    type metadata accessor for AllContactsInBatches(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004E360);
  }
  return result;
}

uint64_t sub_1000206CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AllContactsInBatches(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100020730(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AllContactsInBatches(0);
  __chkstk_darwin(v2, v3);
  int v5 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_100020CA0(a1, (uint64_t)v5, type metadata accessor for AllContactsInBatches);
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v52 = v2;
  uint64_t v9 = *(int *)(v2 + 20);
  uint64_t v57 = v5;
  unint64_t v10 = (uint64_t *)&v5[v9];
  long long v11 = _swiftEmptyArrayStorage;
  uint64_t v53 = &_swiftEmptyArrayStorage[4];
  uint64_t v12 = *(void *)&v5[v9];
  if (!v12) {
    goto LABEL_3;
  }
LABEL_2:
  uint64_t v13 = v10[1];
  uint64_t v14 = v10[2];
  for (unint64_t i = v10[3]; ; v10[3] = i)
  {
    int64_t v16 = i >> 1;
    if (v14 == i >> 1)
    {
LABEL_54:
      uint64_t result = sub_100020C40((uint64_t)v57, type metadata accessor for AllContactsInBatches);
      unint64_t v49 = v11[3];
      if (v49 >= 2)
      {
        unint64_t v50 = v49 >> 1;
        BOOL v20 = __OFSUB__(v50, v7);
        uint64_t v51 = v50 - v7;
        if (v20) {
          goto LABEL_70;
        }
        v11[2] = v51;
      }
      return (uint64_t)v11;
    }
    if (v14 >= (uint64_t)(i >> 1)) {
      break;
    }
    int64_t v17 = *(void *)&v57[*(int *)(v52 + 28)];
    if (v17 < 0) {
      goto LABEL_58;
    }
    int64_t v18 = v16 - v14;
    if (__OFSUB__(v16, v14)) {
      goto LABEL_59;
    }
    char v56 = v11;
    if (!v17 || v18 < 0 || (int64_t v19 = i >> 1, v18 >= v17))
    {
      int64_t v19 = v14 + v17;
      if (__OFADD__(v14, v17)) {
        goto LABEL_66;
      }
    }
    if (v19 < v14) {
      goto LABEL_60;
    }
    if (v16 < v19) {
      goto LABEL_61;
    }
    if (v19 < 0) {
      goto LABEL_62;
    }
    if (!v17 || v18 < 0 || v18 >= v17)
    {
      BOOL v20 = __OFADD__(v14, v17);
      int64_t v21 = v14 + v17;
      if (v20) {
        goto LABEL_67;
      }
      if (v16 < v21) {
        goto LABEL_63;
      }
      int64_t v16 = v21;
    }
    if (v16 < v14) {
      goto LABEL_64;
    }
    uint64_t v54 = v8;
    uint64_t v55 = v7;
    *unint64_t v10 = v12;
    v10[1] = v13;
    uint64_t v22 = v13;
    v10[2] = v16;
    v10[3] = i;
    uint64_t v23 = qword_10004D1A8;
    swift_unknownObjectRetain_n();
    if (v23 != -1) {
      swift_once();
    }
    unint64_t v24 = i & 1 | (2 * v19);
    id v25 = objc_allocWithZone((Class)CNContactFetchRequest);
    swift_bridgeObjectRetain();
    sub_100006ABC(&qword_10004E6A0);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v27 = [v25 initWithKeysToFetch:isa];

    if ((i & 1) == 0)
    {
      swift_unknownObjectRetain();
LABEL_27:
      long long v11 = v56;
      sub_10002E23C(v12, v22, v14, v24);
      goto LABEL_34;
    }
    type metadata accessor for __ContiguousArrayStorageBase();
    swift_unknownObjectRetain_n();
    long long v28 = (void *)swift_dynamicCastClass();
    if (!v28)
    {
      swift_unknownObjectRelease();
      long long v28 = _swiftEmptyArrayStorage;
    }
    uint64_t v29 = v28[2];
    uint64_t result = swift_release();
    if (__OFSUB__(v19, v14)) {
      goto LABEL_68;
    }
    if (v29 != v19 - v14)
    {
      swift_unknownObjectRelease();
      goto LABEL_27;
    }
    uint64_t v30 = swift_dynamicCastClass();
    long long v11 = v56;
    if (!v30) {
      swift_unknownObjectRelease();
    }
LABEL_34:
    swift_unknownObjectRelease();
    long long v31 = self;
    Class v32 = Array._bridgeToObjectiveC()().super.isa;
    swift_release();
    id v33 = [v31 predicateForContactsWithIdentifiers:v32];

    [v27 setPredicate:v33];
    uint64_t v58 = 0;
    uint64_t v35 = v22;
    uint64_t v8 = v54;
    sub_10001DF30(&v58, (uint64_t)v57, (uint64_t)v27, v12, v35, v14, v24);

    uint64_t result = swift_unknownObjectRelease_n();
    uint64_t v36 = v58;
    uint64_t v7 = v55;
    if (!v58) {
      goto LABEL_54;
    }
    if (v55)
    {
      uint64_t v37 = v53;
      uint64_t v7 = v55 - 1;
      if (__OFSUB__(v55, 1)) {
        goto LABEL_65;
      }
    }
    else
    {
      unint64_t v38 = v11[3];
      if ((uint64_t)((v38 >> 1) + 0x4000000000000000) < 0) {
        goto LABEL_69;
      }
      int64_t v39 = v38 & 0xFFFFFFFFFFFFFFFELL;
      if (v39 <= 1) {
        uint64_t v40 = 1;
      }
      else {
        uint64_t v40 = v39;
      }
      sub_100006ABC(&qword_10004E368);
      uint64_t v41 = (void *)swift_allocObject();
      int64_t v42 = j__malloc_size(v41);
      uint64_t v43 = v42 - 32;
      if (v42 < 32) {
        uint64_t v43 = v42 - 25;
      }
      uint64_t v44 = v43 >> 3;
      _OWORD v41[2] = v40;
      v41[3] = 2 * (v43 >> 3);
      unint64_t v45 = (unint64_t)(v41 + 4);
      uint64_t v46 = v11[3] >> 1;
      if (v11[2])
      {
        uint64_t v47 = v11 + 4;
        if (v41 != v11 || v45 >= (unint64_t)v47 + 8 * v46) {
          memmove(v41 + 4, v47, 8 * v46);
        }
        v11[2] = 0;
      }
      uint64_t v37 = (uint64_t *)(v45 + 8 * v46);
      uint64_t v48 = (v44 & 0x7FFFFFFFFFFFFFFFLL) - v46;
      uint64_t result = swift_release();
      long long v11 = v41;
      BOOL v20 = __OFSUB__(v48, 1);
      uint64_t v7 = v48 - 1;
      if (v20) {
        goto LABEL_65;
      }
    }
    uint64_t *v37 = v36;
    uint64_t v53 = v37 + 1;
    uint64_t v12 = *v10;
    if (*v10) {
      goto LABEL_2;
    }
LABEL_3:
    uint64_t result = (uint64_t)sub_10001D9FC();
    uint64_t v12 = result;
    uint64_t v14 = 0;
    uint64_t v13 = result + 32;
    unint64_t i = (2 * *(void *)(result + 16)) | 1;
    *unint64_t v10 = result;
    v10[1] = result + 32;
    v10[2] = 0;
  }
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
LABEL_61:
  __break(1u);
LABEL_62:
  __break(1u);
LABEL_63:
  __break(1u);
LABEL_64:
  __break(1u);
LABEL_65:
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
  return result;
}

uint64_t sub_100020C40(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100020CA0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

BOOL sub_100020D08(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100020D1C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100020D64()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100020D90()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t sub_100020DD4@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_1000222A4(*a1);
  *a2 = result;
  return result;
}

void sub_100020E00(void *a1@<X8>)
{
  *a1 = *v1;
}

id sub_100020E0C()
{
  sub_100006ABC((uint64_t *)&unk_10004E1B0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1000395C0;
  uint64_t v2 = (void *)CNContactWallpaperMetadataKey;
  uint64_t v3 = v0;
  *(void *)(v0 + 32) = CNContactWallpaperMetadataKey;
  specialized Array._endMutation()();
  qword_10004ED08 = v3;

  return v2;
}

id sub_100020E8C()
{
  sub_100006ABC((uint64_t *)&unk_10004E1B0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100038F40;
  Swift::UInt v1 = (void *)CNContactWallpaperMetadataKey;
  uint64_t v2 = CNContactSharedPhotoDisplayPreferenceKey;
  id v5 = (id)CNContactSharedPhotoDisplayPreferenceKey;
  uint64_t v6 = v0;
  *(void *)(v0 + 32) = CNContactWallpaperMetadataKey;
  *(void *)(v0 + 40) = v2;
  specialized Array._endMutation()();
  qword_10004ED10 = v6;
  id v3 = v1;

  return v5;
}

unint64_t sub_100020F20()
{
  unint64_t result = (unint64_t)sub_100021A90();
  unint64_t v2 = result;
  if (result >> 62)
  {
    unint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v3 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  uint64_t v3 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3) {
    goto LABEL_18;
  }
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v12 = v0;
  for (uint64_t i = 0; i != v3; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v5 = *(id *)(v2 + 8 * i + 32);
    }
    uint64_t v6 = v5;
    id v7 = objc_msgSend(v5, "extensionBundleID", v12);
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;

    if (v8 == 0xD000000000000028 && v10 == 0x800000010003B210)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {

        continue;
      }
    }
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized ContiguousArray._endMutation()();
  }
  swift_bridgeObjectRelease();
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
  {
LABEL_23:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_release();
    goto LABEL_20;
  }
LABEL_19:
  if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0) {
    goto LABEL_23;
  }
LABEL_20:
  swift_release();
  if ((unint64_t)sub_100021A90() >> 62) {
    _CocoaArrayWrapper.endIndex.getter();
  }
  return swift_bridgeObjectRelease();
}

unint64_t sub_10002115C()
{
  unint64_t result = (unint64_t)sub_100021A90();
  unint64_t v2 = result;
  if (result >> 62)
  {
    unint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v3 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  uint64_t v3 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3) {
    goto LABEL_18;
  }
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v12 = v0;
  for (uint64_t i = 0; i != v3; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v5 = *(id *)(v2 + 8 * i + 32);
    }
    uint64_t v6 = v5;
    id v7 = objc_msgSend(v5, "extensionBundleID", v12);
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;

    if (v8 == 0xD00000000000002ELL && v10 == 0x800000010003B1E0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {

        continue;
      }
    }
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized ContiguousArray._endMutation()();
  }
  swift_bridgeObjectRelease();
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
  {
LABEL_23:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_release();
    goto LABEL_20;
  }
LABEL_19:
  if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0) {
    goto LABEL_23;
  }
LABEL_20:
  swift_release();
  if ((unint64_t)sub_100021A90() >> 62) {
    _CocoaArrayWrapper.endIndex.getter();
  }
  return swift_bridgeObjectRelease();
}

unint64_t sub_100021398()
{
  unint64_t result = (unint64_t)sub_100021A90();
  unint64_t v2 = result;
  if (result >> 62)
  {
    unint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v3 = result;
    if (result) {
      goto LABEL_3;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  uint64_t v3 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v3) {
    goto LABEL_18;
  }
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v12 = v0;
  for (uint64_t i = 0; i != v3; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v5 = *(id *)(v2 + 8 * i + 32);
    }
    uint64_t v6 = v5;
    id v7 = objc_msgSend(v5, "extensionBundleID", v12);
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;

    if (v8 == 0xD00000000000002CLL && v10 == 0x800000010003B1B0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {

        continue;
      }
    }
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized ContiguousArray._endMutation()();
  }
  swift_bridgeObjectRelease();
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
  {
LABEL_23:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_release();
    goto LABEL_20;
  }
LABEL_19:
  if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0) {
    goto LABEL_23;
  }
LABEL_20:
  swift_release();
  if ((unint64_t)sub_100021A90() >> 62) {
    _CocoaArrayWrapper.endIndex.getter();
  }
  return swift_bridgeObjectRelease();
}

unint64_t sub_1000215D4()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21contactsdonationagent13PosterDetails_dataProvider + 24);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC21contactsdonationagent13PosterDetails_dataProvider + 32);
  sub_100006D7C((void *)(v0 + OBJC_IVAR____TtC21contactsdonationagent13PosterDetails_dataProvider), v1);
  unint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 24))(v1, v2);
  unint64_t v4 = result;
  if (result >> 62)
  {
    unint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v5 = result;
    if (result)
    {
LABEL_3:
      if (v5 < 1)
      {
        __break(1u);
        return result;
      }
      for (uint64_t i = 0; i != v5; ++i)
      {
        if ((v4 & 0xC000000000000001) != 0) {
          id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v7 = *(id *)(v4 + 8 * i + 32);
        }
        uint64_t v8 = v7;
        if ([v7 sharedPhotoDisplayPreference] == (id)2)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
        else
        {
        }
      }
      swift_bridgeObjectRelease();
      if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
        goto LABEL_20;
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_release();
    goto LABEL_17;
  }
LABEL_16:
  if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0) {
    goto LABEL_20;
  }
LABEL_17:
  swift_release();
  if ((unint64_t)sub_100021A90() >> 62) {
    _CocoaArrayWrapper.endIndex.getter();
  }
  return swift_bridgeObjectRelease();
}

unint64_t sub_1000217D4()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21contactsdonationagent13PosterDetails_dataProvider + 24);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC21contactsdonationagent13PosterDetails_dataProvider + 32);
  sub_100006D7C((void *)(v0 + OBJC_IVAR____TtC21contactsdonationagent13PosterDetails_dataProvider), v1);
  unint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 24))(v1, v2);
  unint64_t v4 = result;
  if (result >> 62)
  {
    unint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v5 = result;
    if (result)
    {
LABEL_3:
      if (v5 < 1)
      {
        __break(1u);
        return result;
      }
      for (uint64_t i = 0; i != v5; ++i)
      {
        if ((v4 & 0xC000000000000001) != 0) {
          id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v7 = *(id *)(v4 + 8 * i + 32);
        }
        uint64_t v8 = v7;
        if ([v7 sharedPhotoDisplayPreference] == (id)1)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
        else
        {
        }
      }
      swift_bridgeObjectRelease();
      if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
        goto LABEL_20;
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5) {
      goto LABEL_3;
    }
  }
  swift_bridgeObjectRelease();
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_release();
    goto LABEL_17;
  }
LABEL_16:
  if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0) {
    goto LABEL_20;
  }
LABEL_17:
  swift_release();
  if ((unint64_t)sub_100021A90() >> 62) {
    _CocoaArrayWrapper.endIndex.getter();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000219D4()
{
  uint64_t v1 = OBJC_IVAR____TtC21contactsdonationagent13PosterDetails____lazy_storage___meCardPosterType;
  uint64_t v2 = *(unsigned __int8 *)(v0
                          + OBJC_IVAR____TtC21contactsdonationagent13PosterDetails____lazy_storage___meCardPosterType);
  if (v2 == 5)
  {
    uint64_t v3 = v0;
    uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC21contactsdonationagent13PosterDetails_dataProvider + 24);
    uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC21contactsdonationagent13PosterDetails_dataProvider + 32);
    sub_100006D7C((void *)(v0 + OBJC_IVAR____TtC21contactsdonationagent13PosterDetails_dataProvider), v4);
    uint64_t v6 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
    if (v6)
    {
      id v7 = v6;
      id v8 = [v6 wallpaperMetadata];
      uint64_t v2 = sub_1000220A0((uint64_t)v8);
    }
    else
    {
      uint64_t v2 = 0;
    }
    *(unsigned char *)(v3 + v1) = v2;
  }
  return v2;
}

void *sub_100021A90()
{
  uint64_t v1 = OBJC_IVAR____TtC21contactsdonationagent13PosterDetails____lazy_storage___collectedMetadata;
  if (*(void *)(v0 + OBJC_IVAR____TtC21contactsdonationagent13PosterDetails____lazy_storage___collectedMetadata))
  {
    uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC21contactsdonationagent13PosterDetails____lazy_storage___collectedMetadata);
  }
  else
  {
    uint64_t v2 = sub_100021AF8(v0);
    *(void *)(v0 + v1) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

void *sub_100021AF8(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + OBJC_IVAR____TtC21contactsdonationagent13PosterDetails_dataProvider);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_100006D7C(v1, v2);
  unint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3);
  unint64_t v5 = v4;
  if (!(v4 >> 62))
  {
    uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    unint64_t result = (void *)swift_bridgeObjectRetain();
    if (v6) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  unint64_t result = (void *)_CocoaArrayWrapper.endIndex.getter();
  uint64_t v6 = (uint64_t)result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_3:
  if (v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if ((v5 & 0xC000000000000001) != 0) {
        id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v9 = *(id *)(v5 + 8 * i + 32);
      }
      uint64_t v10 = v9;
      id v11 = [v9 wallpaperMetadata];

      if (v11)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
    }
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

id sub_100021CD0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PosterDetails();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100021D98()
{
  return type metadata accessor for PosterDetails();
}

uint64_t type metadata accessor for PosterDetails()
{
  uint64_t result = qword_10004E3A8;
  if (!qword_10004E3A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100021DEC()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for DonationAgent.FeatureState(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PosterDetails.PosterType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PosterDetails.PosterType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *uint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100022000);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_100022028(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100022030(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PosterDetails.PosterType()
{
  return &type metadata for PosterDetails.PosterType;
}

unint64_t sub_10002204C()
{
  unint64_t result = qword_10004E3B8;
  if (!qword_10004E3B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004E3B8);
  }
  return result;
}

uint64_t sub_1000220A0(uint64_t result)
{
  if (result)
  {
    id v1 = (id)result;
    id v2 = [v1 extensionBundleID];
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v5 = v4;

    if (v3 == 0xD00000000000002ELL && v5 == 0x800000010003B1E0)
    {

      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v6)
      {

        return 1;
      }
      else
      {
        id v7 = [v1 extensionBundleID];
        uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v10 = v9;

        if (v8 == 0xD000000000000028 && v10 == 0x800000010003B210)
        {

          swift_bridgeObjectRelease();
          return 2;
        }
        else
        {
          char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if (v11)
          {

            return 2;
          }
          else
          {
            id v12 = [v1 extensionBundleID];
            uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v15 = v14;

            if (v13 == 0xD00000000000002CLL && v15 == 0x800000010003B1B0)
            {
              swift_bridgeObjectRelease();

              return 3;
            }
            else
            {
              char v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();

              if (v16) {
                return 3;
              }
              else {
                return 4;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

unint64_t sub_1000222A4(unint64_t result)
{
  if (result >= 5) {
    return 5;
  }
  return result;
}

void sub_100022440(void *a1)
{
  Swift::String v3 = String.lowercased()();
  uint64_t v4 = (char **)(v1
               + OBJC_IVAR____TtCC21contactsdonationagent14ContactBuilderP33_1769836B200A88CF9192BAA6148092D915DonationVisitor_visitedValues);
  swift_beginAccess();
  if (sub_10000E248(v3._countAndFlagsBits, (uint64_t)v3._object, *v4))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_beginAccess();
    uint64_t v5 = *v4;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v4 = v5;
    id v22 = a1;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v5 = sub_10002E008(0, *((void *)v5 + 2) + 1, 1, v5);
      *uint64_t v4 = v5;
    }
    unint64_t v8 = *((void *)v5 + 2);
    unint64_t v7 = *((void *)v5 + 3);
    if (v8 >= v7 >> 1)
    {
      uint64_t v5 = sub_10002E008((char *)(v7 > 1), v8 + 1, 1, v5);
      *uint64_t v4 = v5;
    }
    *((void *)v5 + 2) = v8 + 1;
    *(Swift::String *)&v5[16 * v8 + 32] = v3;
    swift_endAccess();
    NSString v9 = String._bridgeToObjectiveC()();
    id v10 = objc_allocWithZone((Class)CNLabeledValue);
    swift_bridgeObjectRetain();
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v12 = [v10 initWithLabel:v11 value:v9];

    sub_100006ABC(&qword_10004E428);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100038E00;
    AnyHashable.init<A>(_:)();
    id v14 = [v22 origin];
    id v15 = [objc_allocWithZone((Class)CNValueOrigin) initWithDonationOrigin:v14];

    *(void *)(inited + 96) = sub_100022F58();
    *(void *)(inited + 72) = v15;
    sub_100026FA8(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v12 setStoreInfo:isa];

    int64_t v17 = *(void **)(v1
                   + OBJC_IVAR____TtCC21contactsdonationagent14ContactBuilderP33_1769836B200A88CF9192BAA6148092D915DonationVisitor_contact);
    id v18 = [v17 emailAddresses];
    sub_100006ABC(qword_10004D780);
    uint64_t v19 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    id v20 = v12;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    Class v21 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v17 setEmailAddresses:v21];
  }
}

void sub_100022874(void *a1, id a2)
{
  id v5 = [a2 stringValue];
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;

  NSString v9 = (char **)(v2
               + OBJC_IVAR____TtCC21contactsdonationagent14ContactBuilderP33_1769836B200A88CF9192BAA6148092D915DonationVisitor_visitedValues);
  swift_beginAccess();
  if (sub_10000E248(v6, v8, *v9))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_beginAccess();
    id v10 = *v9;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    _OWORD *v9 = v10;
    id v28 = a1;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      id v10 = sub_10002E008(0, *((void *)v10 + 2) + 1, 1, v10);
      _OWORD *v9 = v10;
    }
    unint64_t v13 = *((void *)v10 + 2);
    unint64_t v12 = *((void *)v10 + 3);
    if (v13 >= v12 >> 1)
    {
      id v10 = sub_10002E008((char *)(v12 > 1), v13 + 1, 1, v10);
      _OWORD *v9 = v10;
    }
    *((void *)v10 + 2) = v13 + 1;
    id v14 = &v10[16 * v13];
    *((void *)v14 + 4) = v6;
    *((void *)v14 + 5) = v8;
    swift_endAccess();
    id v15 = objc_allocWithZone((Class)CNLabeledValue);
    id v16 = a2;
    swift_bridgeObjectRetain();
    NSString v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v18 = [v15 initWithLabel:v17 value:v16];

    sub_100006ABC(&qword_10004E428);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100038E00;
    AnyHashable.init<A>(_:)();
    id v20 = [v28 origin];
    id v21 = [objc_allocWithZone((Class)CNValueOrigin) initWithDonationOrigin:v20];

    *(void *)(inited + 96) = sub_100022F58();
    *(void *)(inited + 72) = v21;
    sub_100026FA8(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v18 setStoreInfo:isa];

    uint64_t v23 = *(void **)(v2
                   + OBJC_IVAR____TtCC21contactsdonationagent14ContactBuilderP33_1769836B200A88CF9192BAA6148092D915DonationVisitor_contact);
    id v24 = [v23 phoneNumbers];
    sub_100006ABC(qword_10004D780);
    uint64_t v25 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    id v26 = v18;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    Class v27 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v23 setPhoneNumbers:v27];
  }
}

id sub_100022DF4()
{
  return sub_100022EC8(0, type metadata accessor for ContactBuilder.DonationVisitor);
}

id sub_100022EB0(uint64_t a1)
{
  return sub_100022EC8(a1, type metadata accessor for ContactBuilder);
}

id sub_100022EC8(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for ContactBuilder()
{
  return self;
}

uint64_t type metadata accessor for ContactBuilder.DonationVisitor()
{
  return self;
}

unint64_t sub_100022F58()
{
  unint64_t result = qword_10004E430;
  if (!qword_10004E430)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10004E430);
  }
  return result;
}

void sub_100022F98()
{
  PersonNameComponents.namePrefix.getter();
  if (v1)
  {
    uint64_t v2 = *(void **)(v0
                  + OBJC_IVAR____TtCC21contactsdonationagent14ContactBuilderP33_1769836B200A88CF9192BAA6148092D915DonationVisitor_contact);
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v2 setNamePrefix:v3];
  }
  PersonNameComponents.givenName.getter();
  if (v4)
  {
    id v5 = *(void **)(v0
                  + OBJC_IVAR____TtCC21contactsdonationagent14ContactBuilderP33_1769836B200A88CF9192BAA6148092D915DonationVisitor_contact);
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v5 setGivenName:v6];
  }
  PersonNameComponents.middleName.getter();
  if (v7)
  {
    uint64_t v8 = *(void **)(v0
                  + OBJC_IVAR____TtCC21contactsdonationagent14ContactBuilderP33_1769836B200A88CF9192BAA6148092D915DonationVisitor_contact);
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v8 setMiddleName:v9];
  }
  PersonNameComponents.familyName.getter();
  if (v10)
  {
    NSString v11 = *(void **)(v0
                   + OBJC_IVAR____TtCC21contactsdonationagent14ContactBuilderP33_1769836B200A88CF9192BAA6148092D915DonationVisitor_contact);
    NSString v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v11 setFamilyName:v12];
  }
  PersonNameComponents.nameSuffix.getter();
  if (v13)
  {
    id v14 = *(void **)(v0
                   + OBJC_IVAR____TtCC21contactsdonationagent14ContactBuilderP33_1769836B200A88CF9192BAA6148092D915DonationVisitor_contact);
    NSString v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v14 setNameSuffix:v15];
  }
  PersonNameComponents.nickname.getter();
  if (v16)
  {
    NSString v17 = *(void **)(v0
                   + OBJC_IVAR____TtCC21contactsdonationagent14ContactBuilderP33_1769836B200A88CF9192BAA6148092D915DonationVisitor_contact);
    id v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v17 setNickname:v18];
  }
}

void sub_100023168(void *a1, void *a2)
{
  id v5 = [self singleLineStringFromPostalAddress:a2 addCountryName:0];
  if (v5)
  {
    NSString v6 = v5;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    Swift::String v7 = String.lowercased()();
    swift_bridgeObjectRelease();
    uint64_t v8 = (char **)(v2
                 + OBJC_IVAR____TtCC21contactsdonationagent14ContactBuilderP33_1769836B200A88CF9192BAA6148092D915DonationVisitor_visitedValues);
    swift_beginAccess();
    if (sub_10000E248(v7._countAndFlagsBits, (uint64_t)v7._object, *v8))
    {
      swift_bridgeObjectRelease();
      return;
    }
    uint64_t v27 = v2;
    swift_beginAccess();
    NSString v9 = *v8;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    void *v8 = v9;
    NSString v11 = a1;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      NSString v9 = sub_10002E008(0, *((void *)v9 + 2) + 1, 1, v9);
      void *v8 = v9;
    }
    unint64_t v13 = *((void *)v9 + 2);
    unint64_t v12 = *((void *)v9 + 3);
    if (v13 >= v12 >> 1)
    {
      NSString v9 = sub_10002E008((char *)(v12 > 1), v13 + 1, 1, v9);
      void *v8 = v9;
    }
    *((void *)v9 + 2) = v13 + 1;
    *(Swift::String *)&v9[16 * v13 + 32] = v7;
    swift_endAccess();
    a1 = v11;
    uint64_t v2 = v27;
  }
  id v14 = objc_allocWithZone((Class)CNLabeledValue);
  id v15 = a2;
  swift_bridgeObjectRetain();
  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v17 = [v14 initWithLabel:v16 value:v15];

  sub_100006ABC(&qword_10004E428);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100038E00;
  AnyHashable.init<A>(_:)();
  id v19 = [a1 origin];
  id v20 = [objc_allocWithZone((Class)CNValueOrigin) initWithDonationOrigin:v19];

  *(void *)(inited + 96) = sub_100022F58();
  *(void *)(inited + 72) = v20;
  sub_100026FA8(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v17 setStoreInfo:isa];

  id v22 = *(void **)(v2
                 + OBJC_IVAR____TtCC21contactsdonationagent14ContactBuilderP33_1769836B200A88CF9192BAA6148092D915DonationVisitor_contact);
  id v23 = [v22 postalAddresses];
  sub_100006ABC(qword_10004D780);
  uint64_t v24 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v25 = v17;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  Class v26 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v22 setPostalAddresses:v26];
}

uint64_t sub_100023538()
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  qword_10004ED28 = result;
  qword_10004ED30 = v1;
  return result;
}

void sub_100023568(void *a1)
{
  void (*v71)(uint64_t *__return_ptr, id *);
  uint64_t v72;
  void (*v73)(uint64_t *);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t, uint64_t);
  char *v78;
  uint64_t v79;
  void (*v80)(uint64_t *__return_ptr, id *);
  Swift::String v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(char *, uint64_t, uint64_t);
  uint64_t v89;
  void (*v90)(uint64_t, void, uint64_t, uint64_t);
  uint64_t v91;
  uint64_t v92;
  id v93;
  NSString v94;
  NSString v95;
  id v96;
  id v97;
  uint64_t v98;
  char *v99;
  char *v100;
  char *v101;
  char *v102;
  void *v103;
  char *v104;
  uint64_t v105;
  char *v106;
  char *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  char *v113;
  void *v114;
  uint64_t v115;
  unint64_t v116;

  uint64_t v3 = sub_100006ABC((uint64_t *)&unk_10004DF40);
  uint64_t v5 = __chkstk_darwin(v3 - 8, v4);
  Swift::String v7 = (char *)&v98 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v8);
  uint64_t v106 = (char *)&v98 - v9;
  uint64_t v10 = sub_100006ABC((uint64_t *)&unk_10004E060);
  uint64_t v12 = __chkstk_darwin(v10 - 8, v11);
  unint64_t v101 = (char *)&v98 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12, v14);
  uint64_t v100 = (char *)&v98 - v16;
  uint64_t v18 = __chkstk_darwin(v15, v17);
  id v20 = (char *)&v98 - v19;
  __chkstk_darwin(v18, v21);
  id v23 = (char *)&v98 - v22;
  uint64_t v24 = type metadata accessor for PersonNameComponents();
  NSNumber v110 = *(void *)(v24 - 8);
  uint64_t v26 = __chkstk_darwin(v24, v25);
  id v28 = (char *)&v98 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26, v29);
  Swift::Int v107 = (char *)&v98 - v30;
  uint64_t v116 = (unint64_t)_swiftEmptyArrayStorage;
  id v31 = [a1 identifier];
  if (!v31)
  {
    __break(1u);
    goto LABEL_43;
  }
  Class v32 = v31;
  uint64_t v99 = v28;
  uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v35 = v34;

  if (qword_10004D1F8 != -1) {
    swift_once();
  }
  uint64_t v36 = qword_10004ED58;
  unint64_t v37 = *(void *)(qword_10004ED58 + 16);
  NSString v104 = v7;
  NSString v108 = a1;
  uint64_t v109 = v33;
  if (v37)
  {
    uint64_t v102 = v23;
    uint64_t v103 = v35;
    uint64_t v38 = v24;
    int64_t v39 = (uint64_t (**)(char *, uint64_t, uint64_t))(v110 + 48);
    id v1 = a1;
    swift_bridgeObjectRetain();
    unint64_t v40 = 0;
    uint64_t v41 = v36 + 40;
    uint64_t v98 = (unint64_t)v39 & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
    while (1)
    {
      int64_t v42 = *(void (**)(uint64_t *))(v41 - 8);
      char v112 = (uint64_t)v1;
      swift_bridgeObjectRetain();
      swift_retain();
      v42(&v112);
      swift_bridgeObjectRelease();
      swift_release();
      uint64_t v43 = *v39;
      int v44 = (*v39)(v20, 1, v38);
      sub_100016880((uint64_t)v20);
      if (v44 != 1) {
        break;
      }
      ++v40;
      v41 += 16;
      if (v37 == v40) {
        goto LABEL_11;
      }
    }
    if (v37 == v40)
    {
LABEL_11:

      a1 = v108;
      uint64_t v33 = v109;
      uint64_t v24 = v38;
      id v23 = v102;
      uint64_t v35 = v103;
      goto LABEL_12;
    }
    if (v40 >= v37)
    {
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    int v73 = *(void (**)(uint64_t *))(v41 - 8);
    char v112 = (uint64_t)v1;
    swift_retain();
    uint64_t v74 = (uint64_t)v100;
    v73(&v112);
    swift_release();

    uint64_t v75 = (uint64_t)v101;
    sub_100016818(v74, (uint64_t)v101);
    if (v43((char *)v75, 1, v38) != 1)
    {
      uint64_t v76 = v110;
      uint64_t v77 = *(void (**)(char *, uint64_t, uint64_t))(v110 + 32);
      uint64_t v78 = v99;
      v77(v99, v75, v38);
      sub_100016880(v74);
      char v79 = (uint64_t)v102;
      v77(v102, (uint64_t)v78, v38);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v76 + 56))(v79, 0, 1, v38);

      swift_bridgeObjectRelease();
      uint64_t v35 = v103;
      a1 = v108;
      uint64_t v33 = v109;
      uint64_t v24 = v38;
      id v23 = (char *)v79;
      goto LABEL_13;
    }
LABEL_43:

    __break(1u);
    goto LABEL_44;
  }
  id v45 = a1;
  swift_bridgeObjectRetain();
LABEL_12:
  uint64_t v46 = v110;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v110 + 56))(v23, 1, 1, v24);

  swift_bridgeObjectRelease();
  uint64_t v43 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v46 + 48);
LABEL_13:
  if (v43(v23, 1, v24) == 1)
  {
    sub_100016880((uint64_t)v23);
  }
  else
  {
    uint64_t v47 = *(void (**)(char *, char *, uint64_t))(v110 + 32);
    uint64_t v103 = (void *)v24;
    v47(v107, v23, v24);
    char v112 = 0x3A656D616ELL;
    NSNumber v113 = (char *)0xE500000000000000;
    v48._countAndFlagsBits = v33;
    v48._object = v35;
    String.append(_:)(v48);
    unint64_t v101 = (char *)v112;
    uint64_t v102 = v113;
    if (qword_10004D1F0 != -1) {
      swift_once();
    }
    uint64_t v49 = qword_10004ED28;
    uint64_t v50 = qword_10004ED30;
    uint64_t v51 = v105;
    uint64_t v52 = v105 + OBJC_IVAR____TtC21contactsdonationagent21AccountPropertyParser_donationDate;
    uint64_t v53 = type metadata accessor for Date();
    uint64_t v54 = *(void *)(v53 - 8);
    uint64_t v55 = *(void (**)(char *, uint64_t, uint64_t))(v54 + 16);
    uint64_t v56 = (uint64_t)v106;
    v55(v106, v52, v53);
    uint64_t v57 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v54 + 56);
    v57(v56, 0, 1, v53);
    uint64_t v58 = v51 + OBJC_IVAR____TtC21contactsdonationagent21AccountPropertyParser_expirationDate;
    uint64_t v59 = (uint64_t)v104;
    v55(v104, v58, v53);
    v57(v59, 0, 1, v53);
    id v60 = objc_allocWithZone((Class)CNDonationOrigin);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v33 = v109;
    id v61 = sub_10002427C(v49, v50, (uint64_t)v101, (uint64_t)v102, v109, (uint64_t)v35, v56, v59);
    int v62 = v107;
    Class isa = PersonNameComponents._bridgeToObjectiveC()().super.isa;
    id v64 = [self donationValueWithNameComponents:isa origin:v61];

    id v65 = v64;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((v116 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v116 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();

    (*(void (**)(char *, void *))(v110 + 8))(v62, v103);
    a1 = v108;
  }
  if (qword_10004D1B0 != -1) {
    swift_once();
  }
  uint64_t v66 = qword_10004EC98;
  unint64_t v67 = *(void *)(qword_10004EC98 + 16);
  if (!v67)
  {
    swift_bridgeObjectRelease();
    return;
  }
  id v68 = a1;
  swift_bridgeObjectRetain();
  unint64_t v69 = 0;
  uint64_t v70 = v66 + 40;
  while (1)
  {
    uint64_t v71 = *(void (**)(uint64_t *__return_ptr, id *))(v70 - 8);
    uint64_t v111 = v68;
    swift_bridgeObjectRetain();
    swift_retain();
    v71(&v112, &v111);
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v72 = (uint64_t)v113;
    sub_100024238(v112, (uint64_t)v113);
    if (v72) {
      break;
    }
    ++v69;
    v70 += 16;
    if (v67 == v69) {
      goto LABEL_29;
    }
  }
  if (v67 == v69)
  {
LABEL_29:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
  if (v69 >= v67) {
    goto LABEL_40;
  }
  uint64_t v80 = *(void (**)(uint64_t *__return_ptr, id *))(v70 - 8);
  uint64_t v111 = v68;
  swift_retain();
  v80(&v112, &v111);
  swift_release();

  if (!v113)
  {
LABEL_44:
    __break(1u);
    return;
  }
  Swift::Int v107 = (char *)v112;
  NSString v108 = v114;
  NSNumber v110 = v115;

  swift_bridgeObjectRelease();
  char v112 = 0x3A6C69616D65;
  NSNumber v113 = (char *)0xE600000000000000;
  v81._countAndFlagsBits = v33;
  v81._object = v35;
  String.append(_:)(v81);
  unint64_t v101 = v113;
  uint64_t v102 = (char *)v112;
  uint64_t v103 = v35;
  if (qword_10004D1F0 != -1) {
LABEL_41:
  }
    swift_once();
  uint64_t v82 = qword_10004ED28;
  uint64_t v83 = qword_10004ED30;
  uint64_t v84 = v105;
  Class v85 = v105 + OBJC_IVAR____TtC21contactsdonationagent21AccountPropertyParser_donationDate;
  NSString v86 = type metadata accessor for Date();
  uint64_t v87 = *(void *)(v86 - 8);
  uint64_t v88 = *(void (**)(char *, uint64_t, uint64_t))(v87 + 16);
  uint64_t v89 = (uint64_t)v106;
  v88(v106, v85, v86);
  NSString v90 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v87 + 56);
  v90(v89, 0, 1, v86);
  uint64_t v91 = v84 + OBJC_IVAR____TtC21contactsdonationagent21AccountPropertyParser_expirationDate;
  uint64_t v92 = (uint64_t)v104;
  v88(v104, v91, v86);
  v90(v92, 0, 1, v86);
  objc_allocWithZone((Class)CNDonationOrigin);
  swift_bridgeObjectRetain();
  uint64_t v93 = sub_10002427C(v82, v83, (uint64_t)v102, (uint64_t)v101, v109, (uint64_t)v103, v89, v92);
  NSString v94 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v95 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v96 = [self donationValueWithEmailAddress:v94 label:v95 origin:v93];

  Class v97 = v96;
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)((v116 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v116 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
}

id sub_100024070()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountPropertyParser();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100024154()
{
  return type metadata accessor for AccountPropertyParser();
}

uint64_t type metadata accessor for AccountPropertyParser()
{
  uint64_t result = qword_10004E460;
  if (!qword_10004E460) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000241A8()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100024238(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

id sub_10002427C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v13 = type metadata accessor for Date();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48);
  Class isa = 0;
  if (v15(a7, 1, v13) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a7, v13);
  }
  if (v15(a8, 1, v13) == 1)
  {
    Class v17 = 0;
  }
  else
  {
    Class v17 = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a8, v13);
  }
  id v18 = [v20 initWithBundleIdentifier:v10 donationIdentifier:v11 clusterIdentifier:v12 donationDate:isa expirationDate:v17];

  return v18;
}

id sub_100024434()
{
  uint64_t v1 = OBJC_IVAR____TtC21contactsdonationagent25PosterDetailsDataProvider____lazy_storage___meCard;
  objc_super v2 = *(void **)(v0 + OBJC_IVAR____TtC21contactsdonationagent25PosterDetailsDataProvider____lazy_storage___meCard);
  id v3 = v2;
  if (v2 == (void *)1)
  {
    id v3 = sub_1000244A4(v0);
    uint64_t v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    id v5 = v3;
    sub_100025A68(v4);
  }
  sub_100025A78(v2);
  return v3;
}

id sub_1000244A4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::String v7 = *(void **)(a1 + OBJC_IVAR____TtC21contactsdonationagent25PosterDetailsDataProvider_store);
  if (qword_10004D1E0 != -1) {
    swift_once();
  }
  sub_100006ABC(&qword_10004E6A0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v19 = 0;
  id v9 = [v7 _crossPlatformUnifiedMeContactWithKeysToFetch:isa error:&v19];

  id v10 = v19;
  if (!v9)
  {
    NSString v11 = v10;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, a1 + OBJC_IVAR____TtC21contactsdonationagent25PosterDetailsDataProvider_logger, v2);
    swift_errorRetain();
    swift_errorRetain();
    NSString v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      id v19 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315138;
      v18[1] = v14 + 4;
      swift_getErrorValue();
      uint64_t v15 = Error.localizedDescription.getter();
      v18[2] = sub_1000253D0(v15, v16, (uint64_t *)&v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Could not fetch Me Card %s", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return 0;
  }
  return v9;
}

id sub_1000247E0()
{
  uint64_t v1 = (unsigned char *)(v0
               + OBJC_IVAR____TtC21contactsdonationagent25PosterDetailsDataProvider____lazy_storage___numberOfContacts);
  if (*(unsigned char *)(v0
                + OBJC_IVAR____TtC21contactsdonationagent25PosterDetailsDataProvider____lazy_storage___numberOfContacts
                + 8) != 1)
    return *(id *)v1;
  id result = sub_10002482C(v0);
  *(void *)uint64_t v1 = result;
  v1[8] = 0;
  return result;
}

id sub_10002482C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::String v7 = *(void **)(a1 + OBJC_IVAR____TtC21contactsdonationagent25PosterDetailsDataProvider_store);
  id v20 = 0;
  id v8 = [v7 unifiedContactCountWithError:&v20];
  if (v8)
  {
    id v9 = v8;
    id v10 = v20;
    id v11 = [v9 integerValue];
  }
  else
  {
    id v12 = v20;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, a1 + OBJC_IVAR____TtC21contactsdonationagent25PosterDetailsDataProvider_logger, v2);
    swift_errorRetain();
    swift_errorRetain();
    os_log_type_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      id v20 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315138;
      v19[1] = v15 + 4;
      swift_getErrorValue();
      uint64_t v16 = Error.localizedDescription.getter();
      v19[2] = sub_1000253D0(v16, v17, (uint64_t *)&v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Could not count contacts. %s", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return 0;
  }
  return v11;
}

void *sub_100024B2C()
{
  uint64_t v1 = OBJC_IVAR____TtC21contactsdonationagent25PosterDetailsDataProvider____lazy_storage___contactsWithWallpaper;
  if (*(void *)(v0
                 + OBJC_IVAR____TtC21contactsdonationagent25PosterDetailsDataProvider____lazy_storage___contactsWithWallpaper))
  {
    uint64_t v2 = *(void **)(v0
                    + OBJC_IVAR____TtC21contactsdonationagent25PosterDetailsDataProvider____lazy_storage___contactsWithWallpaper);
  }
  else
  {
    uint64_t v2 = sub_100024B94(v0);
    *(void *)(v0 + v1) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

void *sub_100024B94(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::String v7 = *(void **)(a1 + OBJC_IVAR____TtC21contactsdonationagent25PosterDetailsDataProvider_store);
  id v8 = [self predicateForContactsWithWallpaperMetadata];
  if (qword_10004D1E8 != -1) {
    swift_once();
  }
  sub_100006ABC(&qword_10004E6A0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v22 = 0;
  id v10 = [v7 unifiedContactsMatchingPredicate:v8 keysToFetch:isa error:&v22];

  id v11 = v22;
  if (v10)
  {
    sub_100025A28();
    uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    id v13 = v11;
  }
  else
  {
    id v14 = v22;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, a1 + OBJC_IVAR____TtC21contactsdonationagent25PosterDetailsDataProvider_logger, v2);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      unint64_t v17 = (uint8_t *)swift_slowAlloc();
      id v22 = (id)swift_slowAlloc();
      *(_DWORD *)unint64_t v17 = 136315138;
      v21[1] = v17 + 4;
      swift_getErrorValue();
      uint64_t v18 = Error.localizedDescription.getter();
      v21[2] = sub_1000253D0(v18, v19, (uint64_t *)&v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Could not fetch contacts. %s", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    swift_errorRelease();
    return _swiftEmptyArrayStorage;
  }
  return (void *)v12;
}

uint64_t sub_100024F1C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC21contactsdonationagent25PosterDetailsDataProvider_logger;
  uint64_t v2 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  sub_100025A68(*(id *)(v0 + OBJC_IVAR____TtC21contactsdonationagent25PosterDetailsDataProvider____lazy_storage___meCard));
  swift_bridgeObjectRelease();
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_100024FEC()
{
  return type metadata accessor for PosterDetailsDataProvider();
}

uint64_t type metadata accessor for PosterDetailsDataProvider()
{
  uint64_t result = qword_10004E4B0;
  if (!qword_10004E4B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100025040()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_1000250FC()
{
  return sub_100024434();
}

id sub_100025120()
{
  return sub_1000247E0();
}

void *sub_100025144()
{
  return sub_100024B2C();
}

void *sub_100025168()
{
  unint64_t v1 = *(void *)(v0 + 24);
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = (void *)swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  uint64_t result = (void *)_CocoaArrayWrapper.endIndex.getter();
  uint64_t v2 = (uint64_t)result;
  if (!result) {
    goto LABEL_14;
  }
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      if ((v1 & 0xC000000000000001) != 0) {
        id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v5 = *(id *)(v1 + 8 * i + 32);
      }
      uint64_t v6 = v5;
      id v7 = [v5 wallpaperMetadata];

      if (v7)
      {
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
      }
      else
      {
      }
    }
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_1000252B8()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for PosterDetailsDataProviderTestDouble()
{
  return self;
}

void *sub_10002531C()
{
  unint64_t v1 = *(void **)(*(void *)v0 + 16);
  id v2 = v1;
  return v1;
}

uint64_t sub_100025348()
{
  unint64_t v1 = *(void *)(*(void *)v0 + 24);
  if (!(v1 >> 62)) {
    return *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  return v3;
}

void *sub_1000253AC()
{
  return sub_100025168();
}

uint64_t sub_1000253D0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000254A4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000134E0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1000134E0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006BA8((uint64_t)v12);
  return v7;
}

uint64_t sub_1000254A4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100025660(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_100025660(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000256F8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000258D8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000258D8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000256F8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_100025870(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return _swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100025870(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  sub_100006ABC((uint64_t *)&unk_10004E6B0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000258D8(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100006ABC((uint64_t *)&unk_10004E6B0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_100025A28()
{
  unint64_t result = qword_10004E6A8;
  if (!qword_10004E6A8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10004E6A8);
  }
  return result;
}

void sub_100025A68(id a1)
{
  if (a1 != (id)1) {
}
  }

id sub_100025A78(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

uint64_t sub_100025A88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100006ABC((uint64_t *)&unk_10004DF40);
  __chkstk_darwin(v3 - 8, v4);
  unint64_t v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC21contactsdonationagent15AnalysisService_defaults);
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [v7 objectForKey:v8];

  if (v9)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
  }
  sub_10000DD8C((uint64_t)v15, (uint64_t)v16);
  if (v17)
  {
    uint64_t v10 = type metadata accessor for Date();
    int v11 = swift_dynamicCast();
    uint64_t v12 = *(void *)(v10 - 8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v6, v11 ^ 1u, 1, v10);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v10) != 1) {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(a1, v6, v10);
    }
  }
  else
  {
    sub_100009A44((uint64_t)v16, (uint64_t *)&unk_10004DB60);
    uint64_t v14 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v6, 1, 1, v14);
  }
  sub_100009A44((uint64_t)v6, (uint64_t *)&unk_10004DF40);
  return static Date.distantPast.getter();
}

id sub_100025CBC()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC21contactsdonationagent15AnalysisService_activityIdentifier];
  *(void *)uint64_t v1 = 0xD00000000000001CLL;
  *((void *)v1 + 1) = 0x800000010003B730;
  uint64_t v2 = OBJC_IVAR____TtC21contactsdonationagent15AnalysisService_logger;
  uint64_t v3 = self;
  uint64_t v4 = v0;
  id v5 = objc_msgSend(objc_msgSend(v3, "defaultProvider"), "analyticsLogger");
  swift_unknownObjectRelease();
  *(void *)&v0[v2] = v5;
  uint64_t v6 = OBJC_IVAR____TtC21contactsdonationagent15AnalysisService_defaults;
  *(void *)&v4[v6] = [self standardUserDefaults];
  *(void *)&v4[OBJC_IVAR____TtC21contactsdonationagent15AnalysisService_analyzer] = [objc_allocWithZone((Class)type metadata accessor for CNMetricsAnalyzerEngine()) init];

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for AnalysisService();
  return objc_msgSendSuper2(&v8, "init");
}

uint64_t sub_100025E04(_xpc_activity_s *a1, uint64_t a2)
{
  uint64_t v4 = self;
  NSString v5 = String._bridgeToObjectiveC()();
  id v6 = objc_msgSend(v4, "os_transactionInhibitorWithLabel:", v5);

  [v6 start];
  xpc_activity_state_t state = xpc_activity_get_state(a1);
  if (state == 2)
  {
    sub_100025F10();
  }
  else if (!state)
  {
    xpc_object_t v8 = xpc_activity_copy_criteria(a1);
    id v9 = *(void **)(a2 + OBJC_IVAR____TtC21contactsdonationagent15AnalysisService_logger);
    if (v8)
    {
      [v9 analysisServiceCriteria:v8];
      swift_unknownObjectRelease();
    }
    else
    {
      [v9 analysisServiceCheckingIn];
    }
  }
  [v6 stop];

  return swift_unknownObjectRelease();
}

uint64_t sub_100025F10()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v5 = __chkstk_darwin(v2, v4);
  int64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v5, v8);
  int v11 = (char *)&v24 - v10;
  __chkstk_darwin(v9, v12);
  uint64_t v14 = (char *)&v24 - v13;
  Date.init()();
  sub_100025A88((uint64_t)v7);
  static Date.+ infix(_:_:)();
  uint64_t v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v15(v7, v2);
  char v16 = static Date.> infix(_:_:)();
  v15(v11, v2);
  v15(v14, v2);
  if (v16)
  {
    Date.init()();
    uint64_t v17 = *(void **)(v0 + OBJC_IVAR____TtC21contactsdonationagent15AnalysisService_defaults);
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    NSString v19 = String._bridgeToObjectiveC()();
    [v17 setObject:isa forKey:v19];

    v15(v14, v2);
    id v20 = *(void **)(v1 + OBJC_IVAR____TtC21contactsdonationagent15AnalysisService_logger);
    [v20 willReportAnalytics];
    sub_100026188();
    [v20 didReportAnalytics];
  }
  else
  {
    uint64_t v21 = *(void **)(v0 + OBJC_IVAR____TtC21contactsdonationagent15AnalysisService_logger);
    sub_100025A88((uint64_t)v14);
    Class v22 = Date._bridgeToObjectiveC()().super.isa;
    v15(v14, v2);
    [v21 didSkipDuplicateAnalysis:v22];
  }
  return v16 & 1;
}

BOOL sub_100026188()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC21contactsdonationagent15AnalysisService_analyzer);
  if (v1)
  {
    id v2 = v1;
    Class isa = CNMetricsAnalyzerEngine.contactsAnalysis()().super.super.isa;
    uint64_t v4 = self;
    uint64_t v5 = isa;
    NSString v6 = String._bridgeToObjectiveC()();
    [v4 sendDictionary:v5 forEvent:v6 andLog:1];

    int64_t v7 = CNMetricsAnalyzerEngine.postersAnalysis()().super.super.isa;
    NSString v8 = String._bridgeToObjectiveC()();
    [v4 sendDictionary:v7 forEvent:v8 andLog:1];
  }
  else
  {
    [*(id *)(v0 + OBJC_IVAR____TtC21contactsdonationagent15AnalysisService_logger) noAnalyzerAvailable];
  }
  return v1 != 0;
}

id sub_1000262B8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AnalysisService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AnalysisService()
{
  return self;
}

uint64_t sub_100026380(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void *sub_1000263C4(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_10002E584(0, v1, 0);
  unint64_t result = (void *)sub_100030904(a1);
  uint64_t v5 = (uint64_t)result;
  uint64_t v6 = 0;
  uint64_t v7 = a1 + 64;
  int64_t v21 = v1;
  int v22 = v4;
  uint64_t v23 = a1 + 64;
  while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(unsigned char *)(a1 + 32))
  {
    unint64_t v10 = (unint64_t)v5 >> 6;
    if ((*(void *)(v7 + 8 * ((unint64_t)v5 >> 6)) & (1 << v5)) == 0) {
      goto LABEL_23;
    }
    if (*(_DWORD *)(a1 + 36) != v4) {
      goto LABEL_24;
    }
    int v11 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v5);
    uint64_t v12 = v11[1];
    uint64_t v24 = *v11;
    unint64_t v14 = _swiftEmptyArrayStorage[2];
    unint64_t v13 = _swiftEmptyArrayStorage[3];
    unint64_t result = (void *)swift_bridgeObjectRetain();
    if (v14 >= v13 >> 1) {
      unint64_t result = (void *)sub_10002E584(v13 > 1, v14 + 1, 1);
    }
    _swiftEmptyArrayStorage[2] = v14 + 1;
    uint64_t v15 = &_swiftEmptyArrayStorage[2 * v14];
    v15[4] = v24;
    v15[5] = v12;
    int64_t v8 = 1 << *(unsigned char *)(a1 + 32);
    if (v5 >= v8) {
      goto LABEL_25;
    }
    uint64_t v7 = a1 + 64;
    uint64_t v16 = *(void *)(v23 + 8 * v10);
    if ((v16 & (1 << v5)) == 0) {
      goto LABEL_26;
    }
    int v4 = v22;
    if (*(_DWORD *)(a1 + 36) != v22) {
      goto LABEL_27;
    }
    unint64_t v17 = v16 & (-2 << (v5 & 0x3F));
    if (v17)
    {
      int64_t v8 = __clz(__rbit64(v17)) | v5 & 0xFFFFFFFFFFFFFFC0;
      int64_t v9 = v21;
    }
    else
    {
      unint64_t v18 = v10 + 1;
      unint64_t v19 = (unint64_t)(v8 + 63) >> 6;
      int64_t v9 = v21;
      if (v10 + 1 < v19)
      {
        unint64_t v20 = *(void *)(v23 + 8 * v18);
        if (v20)
        {
LABEL_20:
          int64_t v8 = __clz(__rbit64(v20)) + (v18 << 6);
        }
        else
        {
          while (v19 - 2 != v10)
          {
            unint64_t v20 = *(void *)(a1 + 80 + 8 * v10++);
            if (v20)
            {
              unint64_t v18 = v10 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v6;
    uint64_t v5 = v8;
    if (v6 == v9) {
      return _swiftEmptyArrayStorage;
    }
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

void *sub_1000265D0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t result = _swiftEmptyArrayStorage;
  if (v2)
  {
    specialized ContiguousArray.reserveCapacity(_:)();
    unint64_t result = (void *)sub_100030904(a1);
    uint64_t v4 = (uint64_t)result;
    int v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = a1 + 64;
    uint64_t v17 = v2;
    while ((v4 & 0x8000000000000000) == 0 && v4 < 1 << *(unsigned char *)(a1 + 32))
    {
      unint64_t v10 = (unint64_t)v4 >> 6;
      if ((*(void *)(v8 + 8 * ((unint64_t)v4 >> 6)) & (1 << v4)) == 0) {
        goto LABEL_22;
      }
      if (*(_DWORD *)(a1 + 36) != v6) {
        goto LABEL_23;
      }
      uint64_t v18 = v7;
      id v11 = *(id *)(*(void *)(a1 + 56) + 8 * v4);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      unint64_t result = (void *)specialized ContiguousArray._endMutation()();
      int64_t v9 = 1 << *(unsigned char *)(a1 + 32);
      if (v4 >= v9) {
        goto LABEL_24;
      }
      uint64_t v12 = *(void *)(v8 + 8 * v10);
      if ((v12 & (1 << v4)) == 0) {
        goto LABEL_25;
      }
      if (*(_DWORD *)(a1 + 36) != v6) {
        goto LABEL_26;
      }
      unint64_t v13 = v12 & (-2 << (v4 & 0x3F));
      if (v13)
      {
        int64_t v9 = __clz(__rbit64(v13)) | v4 & 0xFFFFFFFFFFFFFFC0;
      }
      else
      {
        unint64_t v14 = v10 + 1;
        unint64_t v15 = (unint64_t)(v9 + 63) >> 6;
        if (v10 + 1 < v15)
        {
          unint64_t v16 = *(void *)(v8 + 8 * v14);
          if (v16)
          {
LABEL_18:
            int64_t v9 = __clz(__rbit64(v16)) + (v14 << 6);
          }
          else
          {
            while (v15 - 2 != v10)
            {
              unint64_t v16 = *(void *)(a1 + 80 + 8 * v10++);
              if (v16)
              {
                unint64_t v14 = v10 + 1;
                goto LABEL_18;
              }
            }
          }
        }
      }
      uint64_t v7 = v18 + 1;
      uint64_t v4 = v9;
      if (v18 + 1 == v17) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
  }
  return result;
}

void *sub_1000267B0(uint64_t a1, char *a2)
{
  *(void *)(swift_allocObject() + 16) = a2;
  uint64_t v18 = &_swiftEmptyArrayStorage;
  uint64_t v14 = a1;
  if ((unint64_t)a1 >> 62) {
    goto LABEL_18;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  int v5 = a2;
  if (v4)
  {
    while (1)
    {
      unint64_t v6 = 0;
      uint64_t v16 = OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger;
      uint64_t v17 = OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_feedbackStore;
      uint64_t v7 = v14;
      uint64_t v15 = CNDonationStoreMeCardIdentifier;
      while ((v14 & 0xC000000000000001) != 0)
      {
        id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_10:
        int64_t v9 = v8;
        unint64_t v10 = v6 + 1;
        if (__OFADD__(v6, 1)) {
          goto LABEL_17;
        }
        a1 = *(void *)&a2[v17];
        if ([(id)a1 canHashDonation:v8])
        {
          if (([(id)a1 donatedValueHasBeenConfirmedOrRejected:v9 contactIdentifier:v15] & 1) == 0)
          {
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
            uint64_t v7 = v14;
            specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
            a1 = (uint64_t)&v18;
            specialized ContiguousArray._endMutation()();
            goto LABEL_6;
          }
        }
        else
        {
          [*(id *)&a2[v16] foundUnhashableValue:v9];
        }

LABEL_6:
        ++v6;
        if (v10 == v4)
        {
          id v11 = v18;
          goto LABEL_22;
        }
      }
      if (v6 < *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      if (a1 >= 0) {
        a1 &= 0xFFFFFFFFFFFFFF8uLL;
      }
      uint64_t v12 = a2;
      uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
      if (!v4) {
        goto LABEL_21;
      }
    }
    id v8 = *(id *)(v7 + 8 * v6 + 32);
    goto LABEL_10;
  }
LABEL_21:
  id v11 = &_swiftEmptyArrayStorage;
LABEL_22:

  swift_release();
  swift_bridgeObjectRelease();
  return v11;
}

void *sub_1000269AC(uint64_t (*a1)(id *), void *a2, unint64_t a3)
{
  unint64_t v4 = a3;
  unint64_t v19 = _swiftEmptyArrayStorage;
  if (a3 >> 62) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      unint64_t v8 = 0;
      uint64_t v16 = v4 & 0xFFFFFFFFFFFFFF8;
      unint64_t v17 = v4 & 0xC000000000000001;
      unint64_t v15 = v4;
      while (v17)
      {
        id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_9:
        unint64_t v10 = v9;
        unint64_t v11 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_17;
        }
        id v18 = v9;
        uint64_t v12 = a2;
        char v13 = a1(&v18);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return v12;
        }
        if (v13)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          unint64_t v4 = v15;
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
        else
        {
        }
        ++v8;
        if (v11 == v7)
        {
          uint64_t v12 = v19;
          goto LABEL_20;
        }
      }
      if (v8 < *(void *)(v16 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
      if (!v7) {
        goto LABEL_19;
      }
    }
    id v9 = *(id *)(v4 + 8 * v8 + 32);
    goto LABEL_9;
  }
LABEL_19:
  uint64_t v12 = _swiftEmptyArrayStorage;
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

void sub_100026B58(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_100026BC4(uint64_t a1, uint64_t a2, void *a3)
{
  int v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

unint64_t sub_100026C3C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006ABC(&qword_10004E988);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  id v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_10002E8BC(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    unint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100026D58(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006ABC((uint64_t *)&unk_10004E990);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  id v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_10002E8BC(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100026E6C(uint64_t a1)
{
  return sub_1000270F8(a1, &qword_10004E9D8);
}

unint64_t sub_100026E78(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006ABC(&qword_10004E9F8);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  id v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_10002E8BC(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    BOOL v12 = (void *)(v2[7] + 16 * result);
    void *v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_100026F9C(uint64_t a1)
{
  return sub_1000270F8(a1, &qword_10004E9E0);
}

unint64_t sub_100026FA8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006ABC((uint64_t *)&unk_10004DDD0);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10001C60C(v6, (uint64_t)v15, &qword_10004E9D0);
    unint64_t result = sub_10002E934((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_1000131EC(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1000270EC(uint64_t a1)
{
  return sub_1000270F8(a1, &qword_10004E9A8);
}

unint64_t sub_1000270F8(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006ABC(a2);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v6 = *(v5 - 2);
    uint64_t v7 = *(v5 - 1);
    uint64_t v8 = *v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_10002E8BC(v6, v7);
    if (v10) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v6;
    v11[1] = v7;
    *(void *)(v3[7] + 8 * result) = v8;
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v5 += 3;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void sub_100027210(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

void sub_100027274(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

void sub_1000272E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t sub_100027354(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

void sub_10002736C(objc_class *a1, uint64_t a2, uint64_t a3)
{
  Class isa = a1;
  if (a1)
  {
    sub_100006C44(0, (unint64_t *)&qword_10004D4A0);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
  }
  if (a2) {
    uint64_t v6 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, isa);
}

uint64_t sub_100027418(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  v5[3] = swift_getObjectType();
  v5[0] = a2;
  swift_retain();
  swift_unknownObjectRetain();
  v3(v5);
  swift_release();
  return sub_100006BA8((uint64_t)v5);
}

uint64_t sub_100027488(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    Hasher.init(_seed:)();
    String.hash(into:)();
    Swift::Int v6 = Hasher._finalize()();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      long long v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          uint64_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

void sub_1000275C0(char *a1)
{
  uint64_t v2 = *(void **)&a1[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger];
  [v2 beginRestorePersistedState];
  sub_100006D7C(&a1[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_persistence], *(void *)&a1[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_persistence + 24]);
  uint64_t v3 = (void *)sub_100011E70();
  v18[0] = 0;
  id v4 = [v3 result:v18];

  id v5 = v18[0];
  if (v4)
  {
    v18[0] = 0;
    sub_100006C44(0, (unint64_t *)&qword_10004D4A0);
    id v6 = v5;
    static Array._conditionallyBridgeFromObjectiveC(_:result:)();

    uint64_t v7 = (uint64_t)v18[0];
    if (v18[0])
    {
      unint64_t v8 = a1;
      uint64_t v9 = sub_1000267B0(v7, v8);
      uint64_t v10 = *(uint64_t (**)(id))&v8[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_notYetExpired];
      long long v11 = *(void **)&v8[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_notYetExpired + 8];
      unint64_t v12 = swift_bridgeObjectRetain();
      BOOL v13 = sub_100016670(v12, v10, v11);
      unint64_t v14 = sub_100026C3C((uint64_t)_swiftEmptyArrayStorage);
      uint64_t v15 = sub_100030C4C(v14, (unint64_t)v13, *(uint64_t (**)(uint64_t, id))&v8[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_indexDonationByIdentifierReduction]);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v16 = (uint64_t *)&v8[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_donations];
      swift_beginAccess();
      uint64_t *v16 = v15;
      swift_bridgeObjectRelease();
      sub_100016670((unint64_t)v9, *(uint64_t (**)(id))&v8[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_readyForRenewal], *(void **)&v8[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_readyForRenewal + 8]);
      sub_10002A764();
      swift_bridgeObjectRelease();
      sub_1000298BC();
      [v2 endRestorePersistedState];
    }
  }
  else
  {
    id v17 = v18[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
  }
}

BOOL sub_1000277EC(void *a1)
{
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  id v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [a1 origin];
  id v7 = [v6 expirationDate];

  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  Date.timeIntervalSinceNow.getter();
  double v9 = v8;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v9 > 0.0;
}

BOOL sub_100027914(void *a1)
{
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  id v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [a1 origin];
  id v7 = [v6 expirationDate];

  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  Date.timeIntervalSinceNow.getter();
  double v9 = v8;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v9 < 604800.0;
}

uint64_t sub_100027A48(uint64_t a1, void *a2)
{
  swift_bridgeObjectRetain();
  id v4 = [a2 origin];
  id v5 = [v4 donationIdentifier];

  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;

  id v9 = a2;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_10002F794((uint64_t)v9, v6, v8, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100027B18()
{
  int64_t v1 = v0;
  v0[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_suppressingNotificationsDuringStartup] = 1;
  uint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_preferencesMonitor];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v1;
  id v4 = (uint64_t (**)(char))(v2
                                     + OBJC_IVAR____TtC21contactsdonationagent26DonationPreferencesMonitor_onSuppress);
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR____TtC21contactsdonationagent26DonationPreferencesMonitor_onSuppress);
  *id v4 = sub_100033480;
  v4[1] = (uint64_t (*)(char))v3;
  id v6 = v1;
  sub_100013B80(v5);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = (uint64_t (**)(char))(v2 + OBJC_IVAR____TtC21contactsdonationagent26DonationPreferencesMonitor_onEnable);
  uint64_t v9 = *(void *)(v2 + OBJC_IVAR____TtC21contactsdonationagent26DonationPreferencesMonitor_onEnable);
  char *v8 = sub_100033488;
  v8[1] = (uint64_t (*)(char))v7;
  uint64_t v10 = (char *)v6;
  sub_100013B80(v9);
  sub_1000135CC();
  uint64_t v11 = sub_100006D7C(&v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_curatedInfoProvider], *(void *)&v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_curatedInfoProvider + 24]);
  unint64_t v12 = &v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_environment];
  BOOL v13 = (void (*)(uint64_t))swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v14 = *v11;
  uint64_t v15 = (void *)*sub_100006D7C(v12, *((void *)v12 + 3));
  swift_retain();
  sub_10003077C(v15, (void (*)(uint64_t))sub_1000334C8, v13, v14);
  swift_release_n();
  uint64_t v16 = *(void **)&v10[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock];
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v10;
  v22[4] = sub_1000334D0;
  v22[5] = v17;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 1107296256;
  v22[2] = sub_100027E90;
  v22[3] = &unk_100046840;
  id v18 = _Block_copy(v22);
  unint64_t v19 = v10;
  swift_release();
  id v20 = [v16 performWriterBlock:v18];
  _Block_release(v18);
  return swift_unknownObjectRelease();
}

uint64_t sub_100027D6C()
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    int64_t v1 = (void *)result;
    uint64_t v2 = *(void **)(result + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock);
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    aBlock[4] = sub_10003354C;
    aBlock[5] = v3;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100027E90;
    aBlock[3] = &unk_100046890;
    id v4 = _Block_copy(aBlock);
    id v5 = v1;
    swift_release();
    id v6 = [v2 performWriterBlock:v4];
    _Block_release(v4);

    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_100027E90(uint64_t a1, void *a2)
{
}

uint64_t sub_100027E98(char a1, char *a2)
{
  id v4 = *(void **)&a2[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock];
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  *(unsigned char *)(v5 + 24) = a1;
  void v10[4] = sub_1000335F4;
  v10[5] = v5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100027E90;
  v10[3] = &unk_1000469D0;
  id v6 = _Block_copy(v10);
  uint64_t v7 = a2;
  swift_release();
  id v8 = [v4 performWriterBlock:v6];
  _Block_release(v6);
  return swift_unknownObjectRelease();
}

id sub_100027F98(uint64_t a1, uint64_t a2, char a3)
{
  id result = sub_100029AA0((a3 & 1) == 0);
  if ((*(unsigned char *)(a2 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_suppressingNotificationsDuringStartup) & 1) == 0)
  {
    uint64_t v5 = *(void **)(a2 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_distributedNotificationCenter);
    uint64_t v6 = CNDonationStoreMeCardValuesDidChangeNotification;
    return [v5 postNotificationName:v6 object:0];
  }
  return result;
}

uint64_t sub_100028014(char a1, char *a2)
{
  id v4 = *(void **)&a2[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock];
  uint64_t v5 = swift_allocObject();
  *(unsigned char *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = a2;
  void v10[4] = sub_10003358C;
  v10[5] = v5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100027E90;
  v10[3] = &unk_1000468E0;
  uint64_t v6 = _Block_copy(v10);
  uint64_t v7 = a2;
  swift_release();
  id v8 = [v4 performWriterBlock:v6];
  _Block_release(v6);
  return swift_unknownObjectRelease();
}

id sub_100028114(uint64_t a1, char a2, char *a3)
{
  if (a2) {
    return sub_100029C94();
  }
  uint64_t v5 = *(void **)&a3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock];
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  void v10[4] = sub_100033598;
  v10[5] = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100027E90;
  v10[3] = &unk_100046930;
  uint64_t v7 = _Block_copy(v10);
  id v8 = a3;
  swift_release();
  id v9 = [v5 performWriterBlock:v7];
  _Block_release(v7);
  return (id)swift_unknownObjectRelease();
}

uint64_t sub_100028218(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v11 = type metadata accessor for Date();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  uint64_t v15 = &v22[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a1)
  {
    swift_errorRetain();
    a2(a1);
    swift_errorRelease();
  }
  else
  {
    a2(0);
    sub_10002A764();
  }
  uint64_t v16 = *(void **)(a4 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger);
  [v16 agentDidHandleRequest:a6];
  uint64_t v17 = Date.init()();
  __chkstk_darwin(v17, v18);
  *(void *)&v22[-16] = v15;
  swift_bridgeObjectRetain();
  unint64_t v19 = (unint64_t)sub_1000269AC((uint64_t (*)(id *))sub_100033928, &v22[-32], a5);
  if (v19 >> 62)
  {
    if (!_CocoaArrayWrapper.endIndex.getter()) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_6:
    sub_100006C44(0, (unint64_t *)&qword_10004D4A0);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    [v16 preExpiredDonations:isa];

    sub_10002A764();
  }
LABEL_7:
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v12 + 8))(v15, v11);
}

BOOL sub_100028444(id *a1)
{
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [*a1 origin];
  id v8 = [v7 expirationDate];

  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = Date.compare(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return v9 == -1;
}

id sub_1000286B8(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1)
  {
    swift_errorRetain();
    a2(0, a1);
    swift_errorRelease();
  }
  else
  {
    a2(1, 0);
  }
  uint64_t v9 = *(void **)(a4 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger);

  return [v9 agentDidHandleRequest:a5];
}

unint64_t sub_1000287E8(unint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = result;
  if (!a3)
  {
    if (result >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
      id result = sub_100033268(v10, a2, 0);
      if (v16 <= 0) {
        return result;
      }
    }
    else if (*(uint64_t *)((result & 0xFFFFFFFFFFFFFF8) + 0x10) <= 0)
    {
      return result;
    }
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    if (!*(void *)(result + 16)) {
      return result;
    }
    goto LABEL_11;
  }
  if (result || a2 != 0xE000000000000000)
  {
    id result = _stringCompareWithSmolCheck(_:_:expecting:)();
    if ((result & 1) == 0)
    {
LABEL_11:
      sub_100028A70(v10, a2, a3);
      sub_1000298BC();
      uint64_t v11 = *(void **)&v5[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock];
      uint64_t v12 = (void *)swift_allocObject();
      v12[2] = v5;
      uint64_t v12[3] = a4;
      v12[4] = a5;
      v17[4] = sub_100033390;
      void v17[5] = v12;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 1107296256;
      v17[2] = sub_100027E90;
      void v17[3] = &unk_100046688;
      uint64_t v13 = _Block_copy(v17);
      uint64_t v14 = v5;
      swift_retain();
      swift_release();
      id v15 = [v11 performReaderBlock:v13];
      _Block_release(v13);
      id result = swift_unknownObjectRelease();
      if ((v14[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_suppressingNotificationsDuringStartup] & 1) == 0) {
        return (unint64_t)[*(id *)&v14[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_distributedNotificationCenter] postNotificationName:CNDonationStoreMeCardValuesDidChangeNotification object:0];
      }
    }
  }
  return result;
}

void sub_1000289FC(uint64_t a1, uint64_t a2)
{
  sub_1000298BC();
  if ((*(unsigned char *)(a2 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_suppressingNotificationsDuringStartup) & 1) == 0)
  {
    uint64_t v3 = *(void **)(a2 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_distributedNotificationCenter);
    uint64_t v4 = CNDonationStoreMeCardValuesDidChangeNotification;
    [v3 postNotificationName:v4 object:0];
  }
}

uint64_t sub_100028A70(uint64_t result, uint64_t a2, char a3)
{
  uint64_t v5 = result;
  if (!a3)
  {
    uint64_t v16 = v3;
    sub_100033358(v5, a2, 0);
    unint64_t v17 = (unint64_t)sub_1000267B0(v5, v16);
    unint64_t v18 = v17;
    if (v17 >> 62)
    {
LABEL_44:
      swift_bridgeObjectRetain();
      uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v19) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v19 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v19)
      {
LABEL_12:
        id v20 = (char **)&v16[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_donations];
        unint64_t v56 = v18;
        unint64_t v57 = v18 & 0xC000000000000001;
        for (uint64_t i = 4; ; ++i)
        {
          if (v57) {
            uint64_t v23 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else {
            uint64_t v23 = (char *)*(id *)(v18 + 8 * i);
          }
          uint64_t v16 = v23;
          if (__OFADD__(i - 4, 1))
          {
            __break(1u);
LABEL_42:
            __break(1u);
LABEL_43:
            __break(1u);
            goto LABEL_44;
          }
          uint64_t v58 = i - 3;
          id v24 = [v23 origin];
          id v25 = [v24 donationIdentifier];

          uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v28 = v27;

          swift_beginAccess();
          unint64_t v18 = v16;
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          id v60 = *v20;
          uint64_t v16 = v60;
          void *v20 = (char *)0x8000000000000000;
          unint64_t v31 = sub_10002E8BC(v26, v28);
          uint64_t v32 = *((void *)v16 + 2);
          BOOL v33 = (v30 & 1) == 0;
          uint64_t v34 = v32 + v33;
          if (__OFADD__(v32, v33)) {
            goto LABEL_42;
          }
          char v35 = v30;
          if (*((void *)v16 + 3) >= v34)
          {
            if (isUniquelyReferenced_nonNull_native)
            {
              uint64_t v38 = v60;
              if (v30) {
                goto LABEL_13;
              }
            }
            else
            {
              uint64_t v16 = (char *)&v60;
              sub_10002FAB4();
              uint64_t v38 = v60;
              if (v35) {
                goto LABEL_13;
              }
            }
          }
          else
          {
            sub_10002EE30(v34, isUniquelyReferenced_nonNull_native);
            uint64_t v16 = v60;
            unint64_t v36 = sub_10002E8BC(v26, v28);
            if ((v35 & 1) != (v37 & 1))
            {
              id result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
              __break(1u);
              return result;
            }
            unint64_t v31 = v36;
            uint64_t v38 = v60;
            if (v35)
            {
LABEL_13:
              uint64_t v22 = *((void *)v38 + 7);

              *(void *)(v22 + 8 * v31) = v18;
              goto LABEL_14;
            }
          }
          *(void *)&v38[8 * (v31 >> 6) + 64] |= 1 << v31;
          int64_t v39 = (uint64_t *)(*((void *)v38 + 6) + 16 * v31);
          *int64_t v39 = v26;
          v39[1] = v28;
          *(void *)(*((void *)v38 + 7) + 8 * v31) = v18;
          uint64_t v40 = *((void *)v38 + 2);
          BOOL v41 = __OFADD__(v40, 1);
          uint64_t v42 = v40 + 1;
          if (v41) {
            goto LABEL_43;
          }
          *((void *)v38 + 2) = v42;
          swift_bridgeObjectRetain();
LABEL_14:
          void *v20 = v38;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_endAccess();

          unint64_t v18 = v56;
          if (v58 == v19) {
            return swift_bridgeObjectRelease();
          }
        }
      }
    }
    return swift_bridgeObjectRelease();
  }
  if (a3 == 1)
  {
    uint64_t v6 = *(void *)(result + 16);
    if (v6)
    {
      id v7 = (uint64_t *)&v3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_donations];
      swift_bridgeObjectRetain();
      id v8 = (uint64_t *)(v5 + 40);
      do
      {
        uint64_t v10 = *(v8 - 1);
        uint64_t v11 = *v8;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v12 = sub_10002E8BC(v10, v11);
        LOBYTE(v10) = v13;
        swift_bridgeObjectRelease();
        if (v10)
        {
          int v14 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v15 = *v7;
          id v60 = (char *)*v7;
          *id v7 = 0x8000000000000000;
          if (!v14)
          {
            sub_10002FAB4();
            uint64_t v15 = (uint64_t)v60;
          }
          swift_bridgeObjectRelease();
          uint64_t v9 = *(void **)(*(void *)(v15 + 56) + 8 * v12);
          sub_10002F458(v12, v15);
          *id v7 = v15;

          swift_bridgeObjectRelease();
        }
        v8 += 2;
        swift_endAccess();
        swift_bridgeObjectRelease();
        --v6;
      }
      while (v6);
      return sub_100033268(v5, a2, 1u);
    }
  }
  else
  {
    uint64_t v43 = (uint64_t *)&v3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_donations];
    swift_beginAccess();
    sub_100033358(v5, a2, 2u);
    uint64_t v44 = swift_bridgeObjectRetain();
    uint64_t v45 = sub_100031958(v44, v5, a2);
    sub_100033268(v5, a2, 2u);
    swift_bridgeObjectRelease();
    uint64_t v46 = sub_1000263C4(v45);
    swift_release();
    uint64_t v47 = v46[2];
    if (v47)
    {
      swift_bridgeObjectRetain();
      Swift::String v48 = v46 + 5;
      do
      {
        uint64_t v50 = *(v48 - 1);
        uint64_t v51 = *v48;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v52 = sub_10002E8BC(v50, v51);
        LOBYTE(v50) = v53;
        swift_bridgeObjectRelease();
        uint64_t v49 = 0;
        if (v50)
        {
          int v54 = swift_isUniquelyReferenced_nonNull_native();
          uint64_t v55 = *v43;
          uint64_t v59 = *v43;
          uint64_t *v43 = 0x8000000000000000;
          if (!v54)
          {
            sub_10002FAB4();
            uint64_t v55 = v59;
          }
          swift_bridgeObjectRelease();
          uint64_t v49 = *(void **)(*(void *)(v55 + 56) + 8 * v52);
          sub_10002F458(v52, v55);
          uint64_t *v43 = v55;
          swift_bridgeObjectRelease();
        }
        v48 += 2;
        swift_endAccess();
        swift_bridgeObjectRelease();

        --v47;
      }
      while (v47);
      return swift_bridgeObjectRelease_n();
    }
    else
    {
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_10002901C(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  id v7 = &a2[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_donations];
  swift_beginAccess();
  uint64_t v8 = *(void *)v7;
  uint64_t v9 = *(void **)&a2[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_diskScheduler];
  uint64_t v10 = (void *)swift_allocObject();
  v10[2] = a2;
  v10[3] = v8;
  void v10[4] = a3;
  v10[5] = a4;
  aBlock[4] = sub_1000333E8;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100026380;
  aBlock[3] = &unk_1000466D8;
  uint64_t v11 = _Block_copy(aBlock);
  swift_bridgeObjectRetain_n();
  unint64_t v12 = a2;
  swift_retain();
  swift_release();
  [v9 performBlock:v11];
  _Block_release(v11);
  return swift_bridgeObjectRelease();
}

void sub_100029154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_100006D7C((void *)(a1 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_persistence), *(void *)(a1 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_persistence + 24));
  uint64_t v7 = swift_bridgeObjectRetain();
  uint64_t v8 = sub_10002E498(v7);
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_100012B30((unint64_t)v8);
  swift_release();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  *(void *)(v10 + 24) = a4;
  uint64_t v19 = sub_10003342C;
  uint64_t v20 = v10;
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 1107296256;
  unint64_t v17 = sub_100027E90;
  unint64_t v18 = &unk_100046728;
  uint64_t v11 = _Block_copy(&v15);
  swift_retain();
  swift_release();
  uint64_t v12 = *(void *)(a1 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_replyScheduler);
  [v9 addSuccessBlock:v11 scheduler:v12];
  _Block_release(v11);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(void *)(v13 + 24) = a4;
  uint64_t v19 = sub_100033458;
  uint64_t v20 = v13;
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 1107296256;
  unint64_t v17 = sub_100029350;
  unint64_t v18 = &unk_100046778;
  int v14 = _Block_copy(&v15);
  swift_retain();
  swift_release();
  [v9 addFailureBlock:v14 scheduler:v12];
  _Block_release(v14);
}

void sub_100029350(uint64_t a1, void *a2)
{
}

void sub_100029358(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_1000293C4(void *a1, void (*a2)(void))
{
  if ([a1 isLeft]) {
    id v4 = [a1 left];
  }
  else {
    id v4 = [a1 right];
  }
  a2();
}

void sub_1000295DC(void (*a1)(id))
{
  id v2 = +[NSError errorWithDomain:CNDonationErrorDomain code:1 userInfo:0];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = [self eitherWithRight:v2];

    a1(v4);
  }
  else
  {
    __break(1u);
  }
}

void sub_100029698(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a2 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_contact);
  swift_beginAccess();
  id v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v3;
  id v5 = v3;
}

id sub_1000296F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_beginAccess();
  uint64_t v9 = swift_bridgeObjectRetain();
  uint64_t v10 = sub_10002E498(v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void **)(a2 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_replyScheduler);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  uint64_t v12[3] = a4;
  v12[4] = v10;
  aBlock[4] = sub_1000336FC;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100026380;
  aBlock[3] = &unk_100046AE8;
  uint64_t v13 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v11 performBlock:v13];
  _Block_release(v13);
  return [*(id *)(a2 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger) agentDidHandleRequest:a5];
}

void sub_1000298BC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100006ABC((uint64_t *)&unk_10004E060);
  __chkstk_darwin(v2 - 8, v3);
  id v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v6 = swift_bridgeObjectRetain();
  uint64_t v7 = sub_10002E498(v6);
  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)(v0 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_curatedInfoProvider);
  uint64_t v9 = *sub_100006D7C((void *)(v0 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_curatedInfoProvider), *(void *)(v0 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_curatedInfoProvider + 24))+ OBJC_IVAR____TtC21contactsdonationagent22ProductionInfoProvider_curatedName;
  swift_beginAccess();
  sub_10001C60C(v9, (uint64_t)v5, (uint64_t *)&unk_10004E060);
  uint64_t v10 = *(void *)(*sub_100006D7C(v8, v8[3])
                  + OBJC_IVAR____TtC21contactsdonationagent22ProductionInfoProvider_curatedEmailAddresses);
  uint64_t v11 = (objc_class *)type metadata accessor for ContactRebuilder();
  uint64_t v12 = (char *)objc_allocWithZone(v11);
  *(void *)&v12[OBJC_IVAR____TtC21contactsdonationagent16ContactRebuilder_filteredDonations] = v7;
  swift_bridgeObjectRetain();
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  sub_10001C60C((uint64_t)v5, (uint64_t)&v13[OBJC_IVAR____TtC21contactsdonationagent16ContactRebuilder_curatedName], (uint64_t *)&unk_10004E060);
  *(void *)&v13[OBJC_IVAR____TtC21contactsdonationagent16ContactRebuilder_curatedEmailAddresses] = v10;

  v17.receiver = v13;
  v17.super_class = v11;
  id v14 = objc_msgSendSuper2(&v17, "init");
  sub_100009A44((uint64_t)v5, (uint64_t *)&unk_10004E060);
  sub_100014C74();
  sub_1000150F8();
  uint64_t v15 = sub_100015280();
  uint64_t v16 = *(void **)(v1 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_contact);
  *(void *)(v1 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_contact) = v15;
}

id sub_100029AA0(char a1)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger);
  if ((a1 & 1) == 0)
  {
    id result = [v3 featureWillDisable];
    uint64_t v5 = OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_featureState;
    char v6 = 1;
LABEL_8:
    *(unsigned char *)(v1 + v5) = v6;
    return result;
  }
  id result = [v3 featureWillEnable];
  uint64_t v5 = OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_featureState;
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_featureState) != 1)
  {
    char v6 = 3;
    goto LABEL_8;
  }
  *(unsigned char *)(v1 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_featureState) = 2;

  return sub_100029C94();
}

id sub_100029B2C(uint64_t a1, char *a2)
{
  unint64_t v3 = sub_100026C3C((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v4 = (unint64_t *)&a2[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_donations];
  swift_beginAccess();
  *uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  sub_1000298BC();
  uint64_t v5 = *(void **)&a2[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock];
  char v6 = (void *)swift_allocObject();
  v6[2] = a2;
  v6[3] = nullsub_1;
  v6[4] = 0;
  aBlock[4] = sub_100033A04;
  aBlock[5] = v6;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100027E90;
  aBlock[3] = &unk_100046980;
  uint64_t v7 = _Block_copy(aBlock);
  uint64_t v8 = a2;
  swift_release();
  id v9 = [v5 performReaderBlock:v7];
  _Block_release(v7);
  swift_unknownObjectRelease();
  return [*(id *)&v8[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger] featureDidDisable];
}

id sub_100029C94()
{
  uint64_t v1 = v0;
  if (v0[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_featureState] == 2)
  {
    v0[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_featureState] = 3;
    uint64_t v2 = swift_allocObject();
    *(void *)(v2 + 16) = _swiftEmptyArrayStorage;
    unint64_t v3 = (void **)(v2 + 16);
    [*(id *)&v1[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger] willDiscoverExtensions];
    id v4 = [self currentExtensionsObservable];
    uint64_t v5 = self;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v1;
    *(void *)(v6 + 24) = v2;
    uint64_t v44 = (_UNKNOWN **)sub_10003332C;
    uint64_t v45 = v6;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v42 = sub_100027418;
    uint64_t v43 = (objc_class *)&unk_100046570;
    uint64_t v7 = _Block_copy(&aBlock);
    uint64_t v8 = v1;
    swift_retain();
    swift_release();
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    uint64_t v44 = (_UNKNOWN **)sub_100033334;
    uint64_t v45 = v9;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v42 = sub_100026380;
    uint64_t v43 = (objc_class *)&unk_1000465C0;
    uint64_t v10 = _Block_copy(&aBlock);
    uint64_t v11 = v8;
    swift_release();
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    uint64_t v44 = (_UNKNOWN **)sub_100033350;
    uint64_t v45 = v12;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v42 = sub_100029350;
    uint64_t v43 = (objc_class *)&unk_100046610;
    uint64_t v13 = _Block_copy(&aBlock);
    id v14 = v11;
    swift_release();
    id v15 = [v5 observerWithResultBlock:v7 completionBlock:v10 failureBlock:v13];
    _Block_release(v13);
    _Block_release(v10);
    _Block_release(v7);
    id v16 = [v4 subscribe:v15];
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    objc_super v17 = (objc_class *)type metadata accessor for AccountsDonationSolicitor();
    unint64_t v18 = (char *)objc_allocWithZone(v17);
    *(void *)&v18[OBJC_IVAR____TtC21contactsdonationagent25AccountsDonationSolicitor_agent] = v14;
    v40.receiver = v18;
    v40.super_class = v17;
    uint64_t v19 = v14;
    id v20 = objc_msgSendSuper2(&v40, "init");
    swift_beginAccess();
    int64_t v21 = *v3;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *unint64_t v3 = v21;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      int64_t v21 = sub_10002E118(0, v21[2] + 1, 1, v21);
      *unint64_t v3 = v21;
    }
    unint64_t v24 = v21[2];
    unint64_t v23 = v21[3];
    if (v24 >= v23 >> 1)
    {
      int64_t v21 = sub_10002E118((void *)(v23 > 1), v24 + 1, 1, v21);
      *unint64_t v3 = v21;
    }
    uint64_t v43 = v17;
    uint64_t v44 = &off_1000458A0;
    *(void *)&long long aBlock = v20;
    v21[2] = v24 + 1;
    sub_100006E88(&aBlock, (uint64_t)&v21[5 * v24 + 4]);
    swift_endAccess();
    id v25 = (objc_class *)type metadata accessor for SIMCardDonationSolicitor();
    uint64_t v26 = (char *)objc_allocWithZone(v25);
    *(void *)&v26[OBJC_IVAR____TtC21contactsdonationagent24SIMCardDonationSolicitor_agent] = v19;
    v39.receiver = v26;
    v39.super_class = v25;
    uint64_t v27 = v19;
    id v28 = objc_msgSendSuper2(&v39, "init");
    swift_beginAccess();
    uint64_t v29 = *v3;
    char v30 = swift_isUniquelyReferenced_nonNull_native();
    *unint64_t v3 = v29;
    if ((v30 & 1) == 0)
    {
      uint64_t v29 = sub_10002E118(0, v29[2] + 1, 1, v29);
      *unint64_t v3 = v29;
    }
    unint64_t v32 = v29[2];
    unint64_t v31 = v29[3];
    if (v32 >= v31 >> 1)
    {
      uint64_t v29 = sub_10002E118((void *)(v31 > 1), v32 + 1, 1, v29);
      *unint64_t v3 = v29;
    }
    uint64_t v43 = v25;
    uint64_t v44 = &off_100045890;
    *(void *)&long long aBlock = v28;
    v29[2] = v32 + 1;
    sub_100006E88(&aBlock, (uint64_t)&v29[5 * v32 + 4]);
    BOOL v33 = *v3;
    swift_endAccess();
    uint64_t v34 = v33[2];
    if (v34)
    {
      uint64_t v35 = (uint64_t)(v33 + 4);
      swift_bridgeObjectRetain();
      do
      {
        sub_100006EA0(v35, (uint64_t)&aBlock);
        unint64_t v36 = v43;
        char v37 = v44;
        sub_100006D7C(&aBlock, (uint64_t)v43);
        ((void (*)(uint64_t, objc_class *, _UNKNOWN **))v37[1])(1, v36, v37);
        sub_100006BA8((uint64_t)&aBlock);
        v35 += 40;
        --v34;
      }
      while (v34);
      swift_release();

      swift_bridgeObjectRelease();
    }
    else
    {
      swift_release();
    }
  }
  return [*(id *)&v1[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger] featureDidEnable];
}

void sub_10002A20C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_1000134E0((uint64_t)a1, (uint64_t)&v17);
  sub_100006C44(0, (unint64_t *)&unk_10004E9C0);
  if (swift_dynamicCast())
  {
    uint64_t v6 = (void **)(a3 + 16);
    uint64_t v7 = v20;
    uint64_t v8 = (objc_class *)type metadata accessor for ExtensionDonationSolicitor();
    uint64_t v9 = (char *)objc_allocWithZone(v8);
    *(void *)&v9[OBJC_IVAR____TtC21contactsdonationagent26ExtensionDonationSolicitor_donor] = v7;
    v21.receiver = v9;
    v21.super_class = v8;
    id v10 = v7;
    id v11 = objc_msgSendSuper2(&v21, "init");
    swift_beginAccess();
    uint64_t v12 = *v6;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *uint64_t v6 = v12;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v12 = sub_10002E118(0, v12[2] + 1, 1, v12);
      *uint64_t v6 = v12;
    }
    unint64_t v15 = v12[2];
    unint64_t v14 = v12[3];
    if (v15 >= v14 >> 1)
    {
      uint64_t v12 = sub_10002E118((void *)(v14 > 1), v15 + 1, 1, v12);
      *uint64_t v6 = v12;
    }
    unint64_t v18 = v8;
    uint64_t v19 = &off_1000458B0;
    *(void *)&long long v17 = v11;
    v12[2] = v15 + 1;
    sub_100006E88(&v17, (uint64_t)&v12[5 * v15 + 4]);
    swift_endAccess();
  }
  else
  {
    id v16 = *(void **)(a2 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger);
    sub_100006D7C(a1, a1[3]);
    [v16 didDiscoverUnexpectedExtensionType:_bridgeAnythingToObjectiveC<A>(_:)()];
    swift_unknownObjectRelease();
  }
}

void sub_10002A3E0(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_featureState) = 2;
  uint64_t v2 = *(void **)(a2 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger);
  id v3 = (id)_convertErrorToNSError(_:)();
  [v2 didFailToDiscoverExtensions:v3];
}

void sub_10002A450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4 = (uint64_t *)(a2 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_donations);
  swift_beginAccess();
  uint64_t v5 = *v4;
  uint64_t v33 = *v4 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(*v4 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(*v4 + 64);
  int64_t v34 = (unint64_t)(v6 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v9 = 0;
  if (v8) {
    goto LABEL_6;
  }
LABEL_7:
  int64_t v12 = v9 + 1;
  if (!__OFADD__(v9, 1))
  {
    if (v12 < v34)
    {
      unint64_t v13 = *(void *)(v33 + 8 * v12);
      ++v9;
      if (v13) {
        goto LABEL_20;
      }
      int64_t v9 = v12 + 1;
      if (v12 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v13 = *(void *)(v33 + 8 * v9);
      if (v13) {
        goto LABEL_20;
      }
      int64_t v9 = v12 + 2;
      if (v12 + 2 >= v34) {
        goto LABEL_33;
      }
      unint64_t v13 = *(void *)(v33 + 8 * v9);
      if (v13)
      {
LABEL_20:
        unint64_t v8 = (v13 - 1) & v13;
        for (unint64_t i = __clz(__rbit64(v13)) + (v9 << 6); ; unint64_t i = v10 | (v9 << 6))
        {
          unint64_t v15 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
          uint64_t v16 = *v15;
          uint64_t v17 = v15[1];
          unint64_t v18 = *(void **)(*(void *)(v5 + 56) + 8 * i);
          swift_bridgeObjectRetain();
          id v19 = v18;
          id v20 = [v19 origin];
          id v21 = [v20 bundleIdentifier];

          uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v24 = v23;

          if (v22 == a3 && v24 == a4)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            char v26 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            if ((v26 & 1) == 0)
            {
              swift_bridgeObjectRelease();

              if (!v8) {
                goto LABEL_7;
              }
              goto LABEL_6;
            }
          }
          swift_beginAccess();
          swift_bridgeObjectRetain();
          unint64_t v27 = sub_10002E8BC(v16, v17);
          char v29 = v28;
          swift_bridgeObjectRelease();
          if (v29)
          {
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            uint64_t v31 = *v4;
            uint64_t v37 = *v4;
            *id v4 = 0x8000000000000000;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_10002FAB4();
              uint64_t v31 = v37;
            }
            swift_bridgeObjectRelease();
            unint64_t v32 = *(void **)(*(void *)(v31 + 56) + 8 * v27);
            sub_10002F458(v27, v31);
            *id v4 = v31;

            swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();
          swift_endAccess();

          if (!v8) {
            goto LABEL_7;
          }
LABEL_6:
          unint64_t v10 = __clz(__rbit64(v8));
          v8 &= v8 - 1;
        }
      }
      int64_t v14 = v12 + 3;
      if (v14 < v34)
      {
        unint64_t v13 = *(void *)(v33 + 8 * v14);
        if (v13)
        {
          int64_t v9 = v14;
          goto LABEL_20;
        }
        while (1)
        {
          int64_t v9 = v14 + 1;
          if (__OFADD__(v14, 1)) {
            goto LABEL_35;
          }
          if (v9 >= v34) {
            break;
          }
          unint64_t v13 = *(void *)(v33 + 8 * v9);
          ++v14;
          if (v13) {
            goto LABEL_20;
          }
        }
      }
    }
LABEL_33:
    swift_release();
    return;
  }
  __break(1u);
LABEL_35:
  __break(1u);
}

uint64_t sub_10002A764()
{
  id v1 = v0;
  unint64_t v2 = swift_bridgeObjectRetain();
  unint64_t v3 = (unint64_t)sub_100030A80(v2, (uint64_t)v1);
  swift_bridgeObjectRelease();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 >= 1) {
      goto LABEL_3;
    }
  }
  else if (*(uint64_t *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 1)
  {
LABEL_3:
    id v4 = objc_msgSend(objc_msgSend(self, "defaultProvider"), "backgroundScheduler");
    swift_unknownObjectRelease();
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v1;
    aBlock[4] = sub_100033190;
    aBlock[5] = v5;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100026380;
    aBlock[3] = &unk_100046368;
    uint64_t v6 = _Block_copy(aBlock);
    id v7 = v1;
    swift_release();
    id v8 = [v4 afterDelay:v6 performBlock:2.0];
    _Block_release(v6);
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

void sub_10002A93C(unint64_t a1, char *a2)
{
  id v30 = [objc_allocWithZone((Class)CNDDonorLoader) init];
  uint64_t v4 = sub_10000DDF4(a1);
  int64_t v5 = 0;
  uint64_t v26 = v4 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(v4 + 64);
  uint64_t v28 = OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger;
  uint64_t v29 = v4;
  int64_t v27 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v9 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v10 = v9 | (v5 << 6);
      goto LABEL_5;
    }
    int64_t v23 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v23 >= v27) {
      goto LABEL_21;
    }
    unint64_t v24 = *(void *)(v26 + 8 * v23);
    ++v5;
    if (!v24)
    {
      int64_t v5 = v23 + 1;
      if (v23 + 1 >= v27) {
        goto LABEL_21;
      }
      unint64_t v24 = *(void *)(v26 + 8 * v5);
      if (!v24)
      {
        int64_t v5 = v23 + 2;
        if (v23 + 2 >= v27) {
          goto LABEL_21;
        }
        unint64_t v24 = *(void *)(v26 + 8 * v5);
        if (!v24) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v24 - 1) & v24;
    unint64_t v10 = __clz(__rbit64(v24)) + (v5 << 6);
LABEL_5:
    uint64_t v11 = *(void *)(*(void *)(v29 + 56) + 8 * v10);
    int64_t v12 = *(void **)&a2[v28];
    sub_100006C44(0, (unint64_t *)&qword_10004D4A0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    NSString v14 = String._bridgeToObjectiveC()();
    [v12 willRenewValues:isa withDonor:v14];

    NSString v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v16 = [v30 donorWithIdentifier:v15];

    uint64_t v17 = swift_allocObject();
    *(void *)(v17 + 16) = a2;
    *(void *)(v17 + 24) = v11;
    uint64_t v35 = sub_1000331B0;
    uint64_t v36 = v17;
    long long aBlock = _NSConcreteStackBlock;
    uint64_t v32 = 1107296256;
    uint64_t v33 = sub_100005D04;
    int64_t v34 = &unk_1000463B8;
    unint64_t v18 = _Block_copy(&aBlock);
    id v19 = a2;
    swift_release();
    [v16 addSuccessBlock:v18];
    _Block_release(v18);
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + 16) = v19;
    uint64_t v35 = sub_1000331B8;
    uint64_t v36 = v20;
    long long aBlock = _NSConcreteStackBlock;
    uint64_t v32 = 1107296256;
    uint64_t v33 = sub_100029350;
    int64_t v34 = &unk_100046408;
    id v21 = _Block_copy(&aBlock);
    uint64_t v22 = v19;
    swift_release();
    [v16 addFailureBlock:v21];
    _Block_release(v21);
  }
  int64_t v25 = v23 + 3;
  if (v25 >= v27)
  {
LABEL_21:

    swift_release();
    return;
  }
  unint64_t v24 = *(void *)(v26 + 8 * v25);
  if (v24)
  {
    int64_t v5 = v25;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v5 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v5 >= v27) {
      goto LABEL_21;
    }
    unint64_t v24 = *(void *)(v26 + 8 * v5);
    ++v25;
    if (v24) {
      goto LABEL_20;
    }
  }
LABEL_23:
  __break(1u);
}

id sub_10002ACF8(uint64_t a1, char *a2, unint64_t a3)
{
  swift_unknownObjectRetain();
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    if (a3 >> 62)
    {
      swift_bridgeObjectRetain();
      id result = (id)_CocoaArrayWrapper.endIndex.getter();
      uint64_t v8 = (uint64_t)result;
      if (result)
      {
LABEL_4:
        if (v8 < 1)
        {
          __break(1u);
        }
        else
        {
          uint64_t v10 = 0;
          do
          {
            if ((a3 & 0xC000000000000001) != 0) {
              id v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else {
              id v11 = *(id *)(a3 + 8 * v10 + 32);
            }
            int64_t v12 = v11;
            ++v10;
            uint64_t v13 = swift_allocObject();
            *(void *)(v13 + 16) = a2;
            *(void *)(v13 + 24) = v12;
            aBlock[4] = sub_10003325C;
            aBlock[5] = v13;
            aBlock[0] = _NSConcreteStackBlock;
            aBlock[1] = 1107296256;
            aBlock[2] = sub_10002B45C;
            aBlock[3] = &unk_100046458;
            NSString v14 = _Block_copy(aBlock);
            NSString v15 = a2;
            id v16 = v12;
            swift_release();
            [v7 renewExpirationDateForDonatedValue:v16 acknowledgementHandler:v14];
            _Block_release(v14);
          }
          while (v8 != v10);
          swift_unknownObjectRelease();
          return (id)swift_bridgeObjectRelease();
        }
        return result;
      }
    }
    else
    {
      uint64_t v8 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id result = (id)swift_bridgeObjectRetain();
      if (v8) {
        goto LABEL_4;
      }
    }
    swift_unknownObjectRelease();
    return (id)swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();
    uint64_t v17 = *(void **)&a2[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger];
    return [v17 couldNotRenewBecauseNotADonorExtension:a1];
  }
}

void sub_10002AF60(uint64_t a1, uint64_t a2, char *a3, void *a4)
{
  uint64_t v8 = sub_100006ABC((uint64_t *)&unk_10004DF40);
  __chkstk_darwin(v8 - 8, v9);
  id v11 = (char *)&aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Date();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  id v16 = (char *)&aBlock - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C60C(a1, (uint64_t)v11, (uint64_t *)&unk_10004DF40);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_100009A44((uint64_t)v11, (uint64_t *)&unk_10004DF40);
    if (a2)
    {
      uint64_t v17 = *(void **)&a3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger];
      swift_errorRetain();
      unint64_t v18 = (void *)_convertErrorToNSError(_:)();
      [v17 couldNotRenewBecauseDonorError:v18];

      swift_errorRelease();
    }
    else
    {
      id v39 = +[NSError errorWithDomain:CNDonationErrorDomain code:2 userInfo:0];
      if (v39)
      {
        objc_super v40 = v39;
        BOOL v41 = *(void **)&a3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger];
        uint64_t v42 = (void *)_convertErrorToNSError(_:)();
        [v41 couldNotRenewBecauseDonorError:v42];
      }
      else
      {
        __break(1u);
      }
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v16, v11, v12);
    id v19 = *(void **)&a3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger];
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    [v19 didRenewValue:a4 untilDate:isa];

    Date.timeIntervalSinceNow.getter();
    if (v21 <= 0.0)
    {
      sub_100006ABC(&qword_10004E980);
      uint64_t v29 = swift_allocObject();
      *(_OWORD *)(v29 + 16) = xmmword_100038E00;
      id v30 = [a4 origin];
      id v31 = [v30 donationIdentifier];

      uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v34 = v33;

      *(void *)(v29 + 32) = v32;
      *(void *)(v29 + 40) = v34;
      uint64_t v26 = *(void **)&a3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock];
      uint64_t v35 = swift_allocObject();
      *(void *)(v35 + 16) = a3;
      *(void *)(v35 + 24) = v29;
      *(void *)(v35 + 32) = 0;
      *(unsigned char *)(v35 + 40) = 1;
      *(void *)(v35 + 48) = nullsub_1;
      *(void *)(v35 + 56) = 0;
      uint64_t v47 = sub_100033284;
      uint64_t v48 = v35;
      long long aBlock = _NSConcreteStackBlock;
      uint64_t v44 = 1107296256;
      uint64_t v28 = &unk_1000464A8;
    }
    else
    {
      sub_100006ABC((uint64_t *)&unk_10004E1B0);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_1000395C0;
      Class v23 = Date._bridgeToObjectiveC()().super.isa;
      id v24 = [a4 copyWithNewExpirationDate:v23];

      *(void *)(v22 + 32) = v24;
      long long aBlock = (void **)v22;
      specialized Array._endMutation()();
      int64_t v25 = aBlock;
      uint64_t v26 = *(void **)&a3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock];
      uint64_t v27 = swift_allocObject();
      *(void *)(v27 + 16) = a3;
      *(void *)(v27 + 24) = v25;
      *(void *)(v27 + 32) = 0;
      *(unsigned char *)(v27 + 40) = 0;
      *(void *)(v27 + 48) = nullsub_1;
      *(void *)(v27 + 56) = 0;
      uint64_t v47 = sub_100033284;
      uint64_t v48 = v27;
      long long aBlock = _NSConcreteStackBlock;
      uint64_t v44 = 1107296256;
      uint64_t v28 = &unk_1000464F8;
    }
    uint64_t v45 = sub_100027E90;
    uint64_t v46 = v28;
    uint64_t v36 = _Block_copy(&aBlock);
    uint64_t v37 = a3;
    swift_bridgeObjectRetain();
    swift_release();
    id v38 = objc_msgSend(v26, "performWriterBlock:", v36, aBlock, v44);
    _Block_release(v36);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  }
}

uint64_t sub_10002B45C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_100006ABC((uint64_t *)&unk_10004DF40);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void (**)(char *, void *))(a1 + 32);
  if (a2)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = type metadata accessor for Date();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  }
  swift_retain();
  id v13 = a3;
  v10(v9, a3);
  swift_release();

  return sub_100009A44((uint64_t)v9, (uint64_t *)&unk_10004DF40);
}

uint64_t (*sub_10002B5A4())()
{
  return j__swift_endAccess;
}

uint64_t sub_10002B604()
{
  uint64_t v1 = v0;
  [*(id *)(v0 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger) willLoadExtensionVersions];
  sub_100006D7C((void *)(v0 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_persistence), *(void *)(v0 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_persistence + 24));
  unint64_t v2 = (void *)sub_100012104();
  v10[0] = 0;
  id v3 = [v2 result:v10];

  id v4 = v10[0];
  if (v3)
  {
    v10[0] = 0;
    id v5 = v4;
    static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
    unint64_t v6 = (unint64_t)v10[0];
    if (!v10[0]) {
      unint64_t v6 = sub_100026D58((uint64_t)_swiftEmptyArrayStorage);
    }
    uint64_t v7 = (unint64_t *)(v1 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_bundleIDVersions);
    swift_beginAccess();
    *uint64_t v7 = v6;

    return swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = v10[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
    return swift_errorRelease();
  }
}

void sub_10002B768()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_featureState) != 1)
  {
    uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_bundleIDVersions);
    swift_beginAccess();
    uint64_t v2 = *v1;
    if (!*v1)
    {
      sub_10002B604();
      uint64_t v2 = *v1;
      if (!*v1) {
        goto LABEL_12;
      }
    }
    uint64_t v3 = qword_10004D1F0;
    swift_bridgeObjectRetain();
    if (v3 == -1)
    {
      if (*(void *)(v2 + 16))
      {
LABEL_6:
        uint64_t v4 = qword_10004ED30;
        uint64_t v5 = qword_10004ED28;
        swift_bridgeObjectRetain();
        unint64_t v6 = sub_10002E8BC(v5, v4);
        if (v7)
        {
          uint64_t v8 = *(void *)(*(void *)(v2 + 56) + 8 * v6);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v8 >= 3) {
            goto LABEL_13;
          }
          goto LABEL_12;
        }
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_once();
      if (*(void *)(v2 + 16)) {
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
LABEL_12:
    sub_10002BED8();
LABEL_13:
    sub_100006ABC((uint64_t *)&unk_10004D4F0);
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_100038E00;
    *(void *)(v9 + 56) = &type metadata for String;
    *(void *)(v9 + 32) = 0xD00000000000001ALL;
    *(void *)(v9 + 40) = 0x800000010003B960;
    print(_:separator:terminator:)();
    swift_bridgeObjectRelease();
    id v10 = [self currentExtensionsObservable];
    uint64_t v11 = self;
    int64_t v25 = sub_10002BBB4;
    uint64_t v26 = 0;
    long long aBlock = _NSConcreteStackBlock;
    uint64_t v22 = 1107296256;
    Class v23 = sub_100027418;
    id v24 = &unk_100046278;
    uint64_t v12 = _Block_copy(&aBlock);
    int64_t v25 = sub_10002BCA4;
    uint64_t v26 = 0;
    long long aBlock = _NSConcreteStackBlock;
    uint64_t v22 = 1107296256;
    Class v23 = sub_100026380;
    id v24 = &unk_1000462A0;
    id v13 = _Block_copy(&aBlock);
    int64_t v25 = sub_10002BD38;
    uint64_t v26 = 0;
    long long aBlock = _NSConcreteStackBlock;
    uint64_t v22 = 1107296256;
    Class v23 = sub_100029350;
    id v24 = &unk_1000462C8;
    uint64_t v14 = _Block_copy(&aBlock);
    id v15 = [v11 observerWithResultBlock:v12 completionBlock:v13 failureBlock:v14];
    _Block_release(v14);
    _Block_release(v13);
    _Block_release(v12);
    id v16 = [v10 subscribe:v15];
    swift_unknownObjectRelease();
    id v17 = [self mainThreadScheduler];
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = v16;
    int64_t v25 = sub_100033170;
    uint64_t v26 = v18;
    long long aBlock = _NSConcreteStackBlock;
    uint64_t v22 = 1107296256;
    Class v23 = sub_100026380;
    id v24 = &unk_100046318;
    id v19 = _Block_copy(&aBlock);
    swift_unknownObjectRetain();
    swift_release();
    id v20 = [v17 afterDelay:v19 performBlock:10000.0];
    _Block_release(v19);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

uint64_t sub_10002BBB4()
{
  sub_100006ABC((uint64_t *)&unk_10004D4F0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100038E00;
  _StringGuts.grow(_:)(25);
  v1._object = (void *)0x800000010003B9E0;
  v1._countAndFlagsBits = 0xD000000000000017;
  String.append(_:)(v1);
  _print_unlocked<A, B>(_:_:)();
  *(void *)(v0 + 56) = &type metadata for String;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0xE000000000000000;
  print(_:separator:terminator:)();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10002BCA4()
{
  sub_100006ABC((uint64_t *)&unk_10004D4F0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100038E00;
  *(void *)(v0 + 56) = &type metadata for String;
  *(void *)(v0 + 32) = 0xD000000000000013;
  *(void *)(v0 + 40) = 0x800000010003B9C0;
  print(_:separator:terminator:)();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10002BD38()
{
  sub_100006ABC((uint64_t *)&unk_10004D4F0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100038E00;
  _StringGuts.grow(_:)(20);
  v1._object = (void *)0x800000010003B9A0;
  v1._countAndFlagsBits = 0xD000000000000012;
  String.append(_:)(v1);
  sub_100006ABC(&qword_10004E9A0);
  _print_unlocked<A, B>(_:_:)();
  *(void *)(v0 + 56) = &type metadata for String;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0xE000000000000000;
  print(_:separator:terminator:)();
  return swift_bridgeObjectRelease();
}

id sub_10002BE30(void *a1)
{
  sub_100006ABC((uint64_t *)&unk_10004D4F0);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100038E00;
  *(void *)(v2 + 56) = &type metadata for String;
  *(void *)(v2 + 32) = 0xD000000000000010;
  *(void *)(v2 + 40) = 0x800000010003B980;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();

  return [a1 cancel];
}

void sub_10002BED8()
{
  if (qword_10004D1F0 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_10004ED28;
  uint64_t v2 = qword_10004ED30;
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock];
  uint64_t v4 = (void *)swift_allocObject();
  v4[2] = v0;
  v4[3] = v1;
  v4[4] = v2;
  aBlock[4] = sub_10003312C;
  aBlock[5] = v4;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100027E90;
  aBlock[3] = &unk_100046250;
  uint64_t v5 = _Block_copy(aBlock);
  unint64_t v6 = v0;
  swift_bridgeObjectRetain();
  swift_release();
  id v7 = [v3 performWriterBlock:v5];
  _Block_release(v5);
  swift_unknownObjectRelease();
  id v8 = [self defaultStore];
  if (!v8) {
    goto LABEL_21;
  }
  uint64_t v9 = v8;
  id v10 = [v8 accounts];
  if (!v10)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v11 = v10;
  aBlock[0] = 0;
  sub_100006C44(0, &qword_10004D4B0);
  static Array._forceBridgeFromObjectiveC(_:result:)();
  unint64_t v12 = aBlock[0];
  if (!aBlock[0])
  {
LABEL_23:
    __break(1u);
    return;
  }

  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v13) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v13) {
      goto LABEL_15;
    }
  }
  if (v13 < 1)
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  for (uint64_t i = 0; i != v13; ++i)
  {
    if ((v12 & 0xC000000000000001) != 0) {
      id v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v15 = *(id *)(v12 + 8 * i + 32);
    }
    id v16 = v15;
    sub_10002C260(0, v15);
  }
LABEL_15:
  swift_bridgeObjectRelease();
  uint64_t v18 = sub_10002B5A4();
  if (*v17)
  {
    id v19 = v17;
    uint64_t v20 = qword_10004ED28;
    uint64_t v21 = qword_10004ED30;
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v26 = *v19;
    *id v19 = 0x8000000000000000;
    sub_10002F630(3, v20, v21, isUniquelyReferenced_nonNull_native);
    *id v19 = v26;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  ((void (*)(void *, void))v18)(aBlock, 0);
  [*(id *)&v6[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger] willSaveExtensionVersions];
  Class v23 = &v6[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_bundleIDVersions];
  swift_beginAccess();
  if (*(void *)v23)
  {
    sub_100006D7C(&v6[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_persistence], *(void *)&v6[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_persistence + 24]);
    uint64_t v24 = swift_bridgeObjectRetain();
    id v25 = sub_100012EF0(v24);

    swift_bridgeObjectRelease();
    uint64_t v9 = v25;
  }
}

void sub_10002C260(void *a1, void *a2)
{
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_accountDonationReceiver);
  if (!v5)
  {
    uint64_t v5 = v26;
    swift_unknownObjectRetain();
  }
  objc_allocWithZone((Class)type metadata accessor for AccountChangeAnalyzer());
  id v6 = a1;
  swift_unknownObjectRetain();
  id v7 = a2;
  id v8 = (char *)sub_100006F50((uint64_t)a1, (uint64_t)a2, v5, 0);
  sub_100006FFC();
  sub_100007444();
  sub_10000766C();
  unint64_t v9 = *(void *)&v8[OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_donations];
  id v10 = &v8[OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_identifiersToRemove];
  swift_beginAccess();
  uint64_t v11 = *(void *)v10;
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v12 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    if (!v12) {
      goto LABEL_12;
    }
  }
  if (v12 < 1)
  {
    __break(1u);
    return;
  }
  uint64_t v13 = 0;
  uint64_t v14 = *(void **)(v26 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_accountLogger);
  do
  {
    if ((v9 & 0xC000000000000001) != 0) {
      id v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v15 = *(id *)(v9 + 8 * v13 + 32);
    }
    id v16 = v15;
    ++v13;
    [v14 donating:v15];
  }
  while (v12 != v13);
LABEL_12:
  swift_bridgeObjectRelease_n();
  uint64_t v17 = *(void *)(v11 + 16);
  if (v17)
  {
    uint64_t v18 = *(void **)(v26 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_accountLogger);
    uint64_t v19 = v11 + 40;
    do
    {
      swift_bridgeObjectRetain();
      NSString v20 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v18 removing:v20];

      v19 += 16;
      --v17;
    }
    while (v17);
  }
  swift_bridgeObjectRelease();
  sub_1000078B8();
  if (*(void *)(*(void *)v10 + 16))
  {
    uint64_t v21 = *(void **)&v8[OBJC_IVAR____TtC21contactsdonationagent21AccountChangeAnalyzer_store];
    if (v21)
    {
      swift_bridgeObjectRetain();
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      uint64_t v23 = swift_allocObject();
      *(void *)(v23 + 16) = v8;
      aBlock[4] = sub_100033108;
      aBlock[5] = v23;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_100026BC4;
      aBlock[3] = &unk_100046200;
      uint64_t v24 = _Block_copy(aBlock);
      id v25 = v8;
      swift_release();
      [v21 removeDonatedMeCardValuesForIdentifiers:isa completionHandler:v24];
      _Block_release(v24);

      id v8 = (char *)isa;
    }
  }
}

uint64_t sub_10002C638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v9 = *(void **)&v4[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger];
  NSString v10 = String._bridgeToObjectiveC()();
  [v9 willRejectDonationIdentifier:v10];

  uint64_t v11 = *(void **)&v4[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock];
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = v4;
  uint64_t v12[3] = a1;
  v12[4] = a2;
  v12[5] = a3;
  v12[6] = a4;
  v17[4] = sub_100032D64;
  void v17[5] = v12;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_100027E90;
  void v17[3] = &unk_100046048;
  uint64_t v13 = _Block_copy(v17);
  uint64_t v14 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  id v15 = [v11 performWriterBlock:v13];
  _Block_release(v13);
  return swift_unknownObjectRelease();
}

void sub_10002C790(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v66 = a5;
  uint64_t v67 = a4;
  uint64_t v9 = sub_100006ABC(&qword_10004D9A0);
  __chkstk_darwin(v9 - 8, v10);
  uint64_t v12 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for CNDonationValue.Value(0);
  uint64_t v65 = *(void *)(v13 - 8);
  uint64_t v14 = *(void *)(v65 + 64);
  uint64_t v16 = __chkstk_darwin(v13, v15);
  __chkstk_darwin(v16, v17);
  uint64_t v19 = (char *)&v60 - v18;
  NSString v20 = &a2[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_donations];
  swift_beginAccess();
  uint64_t v21 = *(void *)v20;
  if (!*(void *)(*(void *)v20 + 16)) {
    goto LABEL_7;
  }
  uint64_t v63 = (uint64_t)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v67;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v64 = a3;
  unint64_t v23 = sub_10002E8BC(a3, v22);
  if ((v24 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a3 = v64;
LABEL_7:
    uint64_t v48 = *(void **)&a2[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger];
    uint64_t v49 = v67;
    NSString v50 = String._bridgeToObjectiveC()();
    [v48 couldNotRejectUnknownDonationIdentifier:v50];

    uint64_t v51 = *(void **)&a2[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_replyScheduler];
    unint64_t v52 = (void *)swift_allocObject();
    v52[2] = a2;
    v52[3] = a3;
    uint64_t v53 = v66;
    v52[4] = v49;
    v52[5] = v53;
    v52[6] = a6;
    int v73 = sub_100032D98;
    uint64_t v74 = v52;
    long long aBlock = _NSConcreteStackBlock;
    uint64_t v70 = 1107296256;
    uint64_t v71 = sub_100026380;
    uint64_t v72 = &unk_100046098;
    int v54 = _Block_copy(&aBlock);
    swift_bridgeObjectRetain();
    uint64_t v55 = a2;
    swift_retain();
    swift_release();
    [v51 performBlock:v54];
    _Block_release(v54);
    return;
  }
  int v62 = v19;
  uint64_t v61 = a6;
  id v25 = *(id *)(*(void *)(v21 + 56) + 8 * v23);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v26 = (objc_class *)_s11ValueCasterCMa(0);
  id v27 = objc_allocWithZone(v26);
  uint64_t v28 = v65;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v65 + 56))((uint64_t)v27+ OBJC_IVAR____TtCE21contactsdonationagentCSo15CNDonationValueP33_0B54ECC677397DAC3B941865EB3B64B811ValueCaster_value, 1, 1, v13);
  v68.receiver = v27;
  v68.super_class = v26;
  id v29 = v25;
  id v30 = objc_msgSendSuper2(&v68, "init");
  [v29 acceptDonationValueVisitor:v30];
  id v60 = v29;

  uint64_t v31 = (uint64_t)v30
      + OBJC_IVAR____TtCE21contactsdonationagentCSo15CNDonationValueP33_0B54ECC677397DAC3B941865EB3B64B811ValueCaster_value;
  swift_beginAccess();
  sub_10001C60C(v31, (uint64_t)v12, &qword_10004D9A0);

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v12, 1, v13) == 1)
  {
    __break(1u);
  }
  else
  {
    uint64_t v32 = (uint64_t)v62;
    sub_10000C7FC((uint64_t)v12, (uint64_t)v62);
    uint64_t v33 = v63;
    sub_10000D2D8(v32, v63);
    unint64_t v34 = (*(unsigned __int8 *)(v28 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
    uint64_t v35 = swift_allocObject();
    sub_10000C7FC(v33, v35 + v34);
    uint64_t v36 = (void *)swift_allocObject();
    uint64_t v37 = v64;
    void v36[2] = a2;
    v36[3] = v37;
    uint64_t v38 = v66;
    v36[4] = v67;
    v36[5] = v38;
    uint64_t v39 = v61;
    v36[6] = v61;
    swift_bridgeObjectRetain_n();
    objc_super v40 = a2;
    swift_retain_n();
    BOOL v41 = v40;
    uint64_t v42 = swift_bridgeObjectRetain();
    uint64_t v43 = sub_100032914(v42, sub_100032F54, v35);
    swift_bridgeObjectRelease();
    if (*(void *)(v43 + 16))
    {
      uint64_t v44 = sub_1000263C4(v43);
      uint64_t v45 = sub_1000265D0(v43);
      swift_release();
      uint64_t v46 = (void *)swift_allocObject();
      v46[2] = v41;
      v46[3] = v45;
      v46[4] = sub_100033028;
      v46[5] = v36;
      uint64_t v47 = v41;
      swift_retain();
      sub_1000287E8((unint64_t)v44, 0, 1, (uint64_t)sub_100033A08, (uint64_t)v46);

      swift_release();
      swift_release();
      swift_bridgeObjectRelease();

      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_release();
      unint64_t v56 = *(void **)&v41[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_replyScheduler];
      unint64_t v57 = (void *)swift_allocObject();
      v57[2] = 1;
      v57[3] = v41;
      v57[4] = v37;
      v57[5] = v67;
      v57[6] = v38;
      v57[7] = v39;
      int v73 = sub_100033054;
      uint64_t v74 = v57;
      long long aBlock = _NSConcreteStackBlock;
      uint64_t v70 = 1107296256;
      uint64_t v71 = sub_100026380;
      uint64_t v72 = &unk_100046138;
      uint64_t v58 = _Block_copy(&aBlock);
      swift_bridgeObjectRetain();
      uint64_t v59 = v41;
      swift_retain();
      swift_release();
      [v56 performBlock:v58];
      _Block_release(v58);

      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
    }
    swift_release();
    sub_10000CEA4((uint64_t)v62);
  }
}

uint64_t sub_10002CE3C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6 = sub_100006ABC(&qword_10004D9A0);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for CNDonationValue.Value(0);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = (objc_class *)_s11ValueCasterCMa(0);
  id v16 = objc_allocWithZone(v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))((uint64_t)v16+ OBJC_IVAR____TtCE21contactsdonationagentCSo15CNDonationValueP33_0B54ECC677397DAC3B941865EB3B64B811ValueCaster_value, 1, 1, v10);
  v23.receiver = v16;
  v23.super_class = v15;
  id v17 = a3;
  id v18 = objc_msgSendSuper2(&v23, "init");
  [v17 acceptDonationValueVisitor:v18];

  uint64_t v19 = (uint64_t)v18
      + OBJC_IVAR____TtCE21contactsdonationagentCSo15CNDonationValueP33_0B54ECC677397DAC3B941865EB3B64B811ValueCaster_value;
  swift_beginAccess();
  sub_10001C60C(v19, (uint64_t)v9, &qword_10004D9A0);

  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_10000C7FC((uint64_t)v9, (uint64_t)v14);
    char v21 = _sSo15CNDonationValueC21contactsdonationagentE0B0O2eeoiySbAE_AEtFZ_0((uint64_t)v14, a4);
    sub_10000CEA4((uint64_t)v14);
    return v21 & 1;
  }
  return result;
}

void sub_10002D07C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *(void **)&v4[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger];
  NSString v10 = String._bridgeToObjectiveC()();
  [v9 willRejectClusterIdentifier:v10];

  if (!a1 && a2 == 0xE000000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    uint64_t v11 = *(void **)&v4[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_replyScheduler];
    uint64_t v12 = (void *)swift_allocObject();
    v12[2] = v4;
    uint64_t v12[3] = a1;
    v12[4] = a2;
    v12[5] = a3;
    v12[6] = a4;
    char v24 = sub_10002DF90;
    id v25 = v12;
    NSString v20 = _NSConcreteStackBlock;
    uint64_t v21 = 1107296256;
    uint64_t v22 = sub_100026380;
    objc_super v23 = &unk_100045E68;
    uint64_t v13 = _Block_copy(&v20);
    uint64_t v14 = v4;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    [v11 performBlock:v13];
    _Block_release(v13);
  }
  else
  {
    uint64_t v15 = *(void **)&v4[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock];
    id v16 = (void *)swift_allocObject();
    v16[2] = v4;
    v16[3] = a1;
    v16[4] = a2;
    v16[5] = a3;
    v16[6] = a4;
    char v24 = sub_10002DF5C;
    id v25 = v16;
    NSString v20 = _NSConcreteStackBlock;
    uint64_t v21 = 1107296256;
    uint64_t v22 = sub_100027E90;
    objc_super v23 = &unk_100045E18;
    id v17 = _Block_copy(&v20);
    id v18 = v4;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    id v19 = [v15 performWriterBlock:v17];
    _Block_release(v17);
    swift_unknownObjectRelease();
  }
}

uint64_t sub_10002D2D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v5 = *(void **)(a1 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger);
  NSString v6 = String._bridgeToObjectiveC()();
  [v5 couldNotRejectUnknownClusterIdentifier:v6];

  NSString v7 = String._bridgeToObjectiveC()();
  [v5 didRejectClusterIdentifier:v7];

  return a4(0);
}

uint64_t sub_10002D374(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a2;
  v11[3] = a3;
  id v11[4] = a4;
  v11[5] = a5;
  void v11[6] = a6;
  swift_beginAccess();
  swift_bridgeObjectRetain_n();
  id v12 = a2;
  swift_retain_n();
  uint64_t v13 = (char *)v12;
  uint64_t v14 = swift_bridgeObjectRetain();
  uint64_t v15 = sub_100032A8C(v14, a3, a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(v15 + 16))
  {
    id v16 = sub_1000263C4(v15);
    id v17 = sub_1000265D0(v15);
    swift_release();
    id v18 = (void *)swift_allocObject();
    v18[2] = v13;
    id v18[3] = v17;
    v18[4] = sub_10002DFA4;
    v18[5] = v11;
    id v19 = v13;
    swift_retain();
    sub_1000287E8((unint64_t)v16, 0, 1, (uint64_t)sub_100032C94, (uint64_t)v18);

    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
    NSString v20 = *(void **)&v13[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_replyScheduler];
    uint64_t v21 = (void *)swift_allocObject();
    v21[2] = 1;
    void v21[3] = v13;
    v21[4] = a3;
    v21[5] = a4;
    v21[6] = a5;
    v21[7] = a6;
    aBlock[4] = sub_100032C74;
    aBlock[5] = v21;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100026380;
    aBlock[3] = &unk_100045EE0;
    uint64_t v22 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    objc_super v23 = v13;
    swift_retain();
    swift_release();
    [v20 performBlock:v22];
    _Block_release(v22);
  }
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease_n();
}

void sub_10002D618(unint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v16 = *(void **)&a2[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_replyScheduler];
  id v17 = (void *)swift_allocObject();
  v17[2] = a1;
  void v17[3] = a2;
  v17[4] = a3;
  void v17[5] = a4;
  void v17[6] = a5;
  v17[7] = a6;
  v20[4] = a8;
  v20[5] = v17;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 1107296256;
  _OWORD v20[2] = sub_100026380;
  void v20[3] = a9;
  id v18 = _Block_copy(v20);
  sub_100032D50(a1);
  id v19 = a2;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  [v16 performBlock:v18];
  _Block_release(v18);
}

unint64_t sub_10002D734(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(unint64_t), uint64_t a6, SEL *a7, SEL *a8, SEL *a9)
{
  if (!a1)
  {
    id v12 = *(void **)(a2 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger);
    goto LABEL_5;
  }
  if (a1 == 1)
  {
    id v12 = *(void **)(a2 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger);
    NSString v13 = String._bridgeToObjectiveC()();
    objc_msgSend(v12, *a9, v13);

LABEL_5:
    NSString v14 = String._bridgeToObjectiveC()();
    objc_msgSend(v12, *a8, v14);

    return a5(0);
  }
  id v17 = *(void **)(a2 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger);
  swift_errorRetain();
  NSString v18 = String._bridgeToObjectiveC()();
  id v19 = (void *)_convertErrorToNSError(_:)();
  objc_msgSend(v17, *a7, v18, v19);

  swift_errorRetain();
  a5(a1);
  sub_100032CC8(a1);

  return sub_100032CC8(a1);
}

uint64_t sub_10002D8CC(void *a1, int a2, int a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  NSString v10 = _Block_copy(aBlock);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v10;
  id v15 = a1;
  a7(v11, v13, a6, v14);

  swift_bridgeObjectRelease();

  return swift_release();
}

void sub_10002D98C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSString v7 = *(void **)(a2 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_feedbackStore);
  sub_100006C44(0, (unint64_t *)&qword_10004D4A0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  uint64_t v9 = (void *)CNDonationStoreMeCardIdentifier;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a4;
  *(void *)(v10 + 24) = a5;
  v13[4] = sub_100032CA0;
  v13[5] = v10;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_100026B58;
  v13[3] = &unk_100045F58;
  uint64_t v11 = _Block_copy(v13);
  id v12 = v9;
  swift_retain();
  swift_release();
  [v7 rejectDonatedValues:isa contactIdentifier:v12 completionHandler:v11];
  _Block_release(v11);
}

id sub_10002DB8C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DonationAgent();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DonationAgent()
{
  return self;
}

uint64_t getEnumTagSinglePayload for DonationAgent.FeatureState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DonationAgent.FeatureState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10002DEC8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DonationAgent.FeatureState()
{
  return &type metadata for DonationAgent.FeatureState;
}

unint64_t sub_10002DF04()
{
  unint64_t result = qword_10004E970;
  if (!qword_10004E970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10004E970);
  }
  return result;
}

uint64_t sub_10002DF5C(uint64_t a1)
{
  return sub_100032D7C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_10002D374);
}

uint64_t sub_10002DF74(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002DF84()
{
  return swift_release();
}

uint64_t sub_10002DF90()
{
  return sub_10002D2D0(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(uint64_t (**)(void))(v0 + 40));
}

void sub_10002DFA4(unint64_t a1)
{
}

void sub_10002DFCC(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_10002D618(a1, *(char **)(v4 + 16), *(void *)(v4 + 24), *(void *)(v4 + 32), *(void *)(v4 + 40), *(void *)(v4 + 48), a2, a3, a4);
}

char *sub_10002E008(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100006ABC(&qword_10004E980);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10003098C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_10002E118(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100006ABC(&qword_10004E9B0);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      id v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4]) {
          memmove(v12, a4 + 4, 40 * v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_100030DA8(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_10002E23C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return _swiftEmptyArrayStorage;
    }
    uint64_t v8 = 2 * v5;
    if (v5 <= 0)
    {
      uint64_t v9 = _swiftEmptyArrayStorage;
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0) {
          goto LABEL_19;
        }
        unint64_t v12 = a2 + 16 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8) {
          goto LABEL_19;
        }
        swift_arrayInitWithCopy();
        return v9;
      }
    }
    else
    {
      sub_100006ABC(&qword_10004E980);
      uint64_t v9 = (void *)swift_allocObject();
      int64_t v10 = j__malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 17;
      }
      _OWORD v9[2] = v5;
      v9[3] = 2 * (v11 >> 4);
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  unint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_10002E3B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_100006ABC(&qword_10004E980);
  int v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 17;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  uint64_t v6 = sub_10002FE20((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1000131FC();
  if (v6 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

void *sub_10002E498(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_100006ABC((uint64_t *)&unk_10004E1B0);
  int v3 = (void *)swift_allocObject();
  int64_t v4 = j__malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 25;
  }
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  uint64_t v6 = sub_100030020(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1000131FC();
  if (v6 != (void *)v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

uint64_t sub_10002E584(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002E5C4(a1, a2, a3, *v3);
  *int v3 = (char *)result;
  return result;
}

uint64_t sub_10002E5A4(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002E730(a1, a2, a3, (void *)*v3);
  *int v3 = result;
  return result;
}

uint64_t sub_10002E5C4(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100006ABC(&qword_10004E980);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    int64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10002E730(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100006ABC(&qword_10004E9E8);
    int64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    id v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    int64_t v10 = _swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    sub_100006ABC(&qword_10004E9F0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_10002E8BC(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10002E978(a1, a2, v4);
}

unint64_t sub_10002E934(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10002EA5C(a1, v4);
}

unint64_t sub_10002E978(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    int64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10002EA5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100033948(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_1000339A4((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10002EB24(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100006ABC((uint64_t *)&unk_10004E990);
  char v37 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  unint64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    id v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    NSString v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10002EE30(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100006ABC(&qword_10004E988);
  char v38 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    id v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    NSString v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_10002F140(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100006ABC(&qword_10004E9A8);
  char v36 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    id v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    NSString v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_10002F458(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v9 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            _OWORD *v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_10002F630(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10002E8BC(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_10002F904();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(void *)(v18[7] + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_10002EB24(result, a4 & 1);
  uint64_t result = sub_10002E8BC(a2, a3);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  uint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v20 = a2;
  v20[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v23;

  return swift_bridgeObjectRetain();
}

void sub_10002F794(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10002E8BC(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_10002FAB4();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_10002EE30(v15, a4 & 1);
  unint64_t v20 = sub_10002E8BC(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  BOOL v22 = (uint64_t *)(v18[6] + 16 * v12);
  *BOOL v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

void *sub_10002F904()
{
  uint64_t v1 = v0;
  sub_100006ABC((uint64_t *)&unk_10004E990);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    BOOL v22 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  unint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_10002FAB4()
{
  uint64_t v1 = v0;
  sub_100006ABC(&qword_10004E988);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10002FC68()
{
  uint64_t v1 = v0;
  sub_100006ABC(&qword_10004E9A8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10002FE20(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    void *v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    void v5[4] = v9;
    return v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    void *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    id result = swift_bridgeObjectRetain();
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

void *sub_100030020(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1 << *(unsigned char *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1 << -(char)v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0;
    uint64_t v10 = 0;
LABEL_38:
    void *v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
    v5[3] = v12;
    void v5[4] = v9;
    return (void *)v10;
  }
  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v11 = a2;
  int64_t v12 = 0;
  uint64_t v13 = 0;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = *(void **)(*(void *)(a4 + 56) + 8 * v16);
    void *v11 = v20;
    if (v13 == v10)
    {
      id v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    id result = v20;
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }
  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_10003021C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a4;
  *(void *)(v8 + 24) = a5;
  uint64_t v33 = a3 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(a3 + 64);
  int64_t v34 = (unint64_t)(v9 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  uint64_t v13 = 0;
  int64_t v14 = 0;
  uint64_t v35 = a5;
  while (2)
  {
    uint64_t v32 = v13;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v14 << 6);
      }
      else
      {
        int64_t v17 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
          __break(1u);
LABEL_31:
          __break(1u);
          goto LABEL_32;
        }
        if (v17 >= v34) {
          goto LABEL_29;
        }
        unint64_t v18 = *(void *)(v33 + 8 * v17);
        ++v14;
        if (!v18)
        {
          int64_t v14 = v17 + 1;
          if (v17 + 1 >= v34) {
            goto LABEL_29;
          }
          unint64_t v18 = *(void *)(v33 + 8 * v14);
          if (!v18)
          {
            int64_t v14 = v17 + 2;
            if (v17 + 2 >= v34) {
              goto LABEL_29;
            }
            unint64_t v18 = *(void *)(v33 + 8 * v14);
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v34)
              {
LABEL_29:
                uint64_t v29 = sub_1000304E0(a1, a2, v32, a3);
                swift_bridgeObjectRelease();
                swift_release();
                return v29;
              }
              unint64_t v18 = *(void *)(v33 + 8 * v19);
              if (!v18)
              {
                while (1)
                {
                  int64_t v14 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    goto LABEL_31;
                  }
                  if (v14 >= v34) {
                    goto LABEL_29;
                  }
                  unint64_t v18 = *(void *)(v33 + 8 * v14);
                  ++v19;
                  if (v18) {
                    goto LABEL_22;
                  }
                }
              }
              int64_t v14 = v19;
            }
          }
        }
LABEL_22:
        unint64_t v11 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v14 << 6);
      }
      uint64_t v20 = *(void **)(*(void *)(a3 + 56) + 8 * v16);
      swift_bridgeObjectRetain();
      id v21 = v20;
      id v22 = [v21 origin];
      id v23 = [v22 clusterIdentifier];

      uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v26 = v25;

      if (v24 == a4 && v26 == v35) {
        break;
      }
      char v28 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();

      uint64_t result = swift_bridgeObjectRelease();
      if (v28) {
        goto LABEL_5;
      }
    }
    swift_bridgeObjectRelease();

    uint64_t result = swift_bridgeObjectRelease();
LABEL_5:
    *(unint64_t *)((char *)a1 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    uint64_t v13 = v32 + 1;
    if (!__OFADD__(v32, 1)) {
      continue;
    }
    break;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_1000304E0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return (uint64_t)&_swiftEmptyDictionarySingleton;
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  sub_100006ABC(&qword_10004E988);
  uint64_t result = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v9 = result;
  uint64_t v33 = a1;
  uint64_t v34 = a2;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
    }
    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1)) {
        goto LABEL_40;
      }
      if (v15 >= v34) {
        return v9;
      }
      unint64_t v16 = v33[v15];
      ++v11;
      if (!v16)
      {
        uint64_t v11 = v15 + 1;
        if (v15 + 1 >= v34) {
          return v9;
        }
        unint64_t v16 = v33[v11];
        if (!v16)
        {
          uint64_t v11 = v15 + 2;
          if (v15 + 2 >= v34) {
            return v9;
          }
          unint64_t v16 = v33[v11];
          if (!v16)
          {
            uint64_t v17 = v15 + 3;
            if (v17 >= v34) {
              return v9;
            }
            unint64_t v16 = v33[v17];
            if (!v16)
            {
              while (1)
              {
                uint64_t v11 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_41;
                }
                if (v11 >= v34) {
                  return v9;
                }
                unint64_t v16 = v33[v11];
                ++v17;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }
            uint64_t v11 = v17;
          }
        }
      }
LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    unint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v14);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    id v21 = *(void **)(*(void *)(v4 + 56) + 8 * v14);
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    id v22 = v21;
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v23 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v26 = __clz(__rbit64((-1 << v24) & ~*(void *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        BOOL v29 = v25 == v28;
        if (v25 == v28) {
          unint64_t v25 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v12 + 8 * v25);
      }
      while (v30 == -1);
      unint64_t v26 = __clz(__rbit64(~v30)) + (v25 << 6);
    }
    *(void *)(v12 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
    uint64_t v31 = (void *)(*(void *)(v9 + 48) + 16 * v26);
    void *v31 = v20;
    v31[1] = v19;
    *(void *)(*(void *)(v9 + 56) + 8 * v26) = v22;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1)) {
      break;
    }
    if (!v5) {
      return v9;
    }
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_10003077C(void *a1, void (*a2)(uint64_t), void (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v22 = type metadata accessor for ProductionEnvironment();
  uint64_t v23 = &off_100045C28;
  v21[0] = a1;
  sub_100006EA0((uint64_t)v21, (uint64_t)v20);
  uint64_t v8 = a4 + OBJC_IVAR____TtC21contactsdonationagent22ProductionInfoProvider_environment;
  swift_beginAccess();
  id v9 = a1;
  sub_1000334E4((uint64_t)v20, v8);
  swift_endAccess();
  unint64_t v10 = (void (**)(uint64_t))(a4
                                      + OBJC_IVAR____TtC21contactsdonationagent22ProductionInfoProvider_changeHandler);
  uint64_t v11 = *(void *)(a4 + OBJC_IVAR____TtC21contactsdonationagent22ProductionInfoProvider_changeHandler);
  *unint64_t v10 = a2;
  v10[1] = a3;
  swift_retain();
  sub_100013B80(v11);
  NSString v12 = String._bridgeToObjectiveC()();
  sub_100006D7C(v21, v22);
  id v13 = sub_100019CAC();
  [v13 addObserver:a4 selector:"meCardChanged" name:v12 object:0];
  id v14 = sub_100019FF8();
  unsigned __int8 v15 = sub_10001A190((uint64_t)v14);
  char v16 = sub_10001A788(v14);
  if (v15 & 1) != 0 || (v16)
  {
    uint64_t v17 = *v10;
    if (*v10)
    {
      uint64_t v18 = swift_retain();
      v17(v18);
      sub_100013B80((uint64_t)v17);
    }
  }

  return sub_100006BA8((uint64_t)v21);
}

uint64_t sub_100030904(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  id v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_10003098C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_100030A80(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      unint64_t v4 = 0;
      uint64_t v16 = OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_internalBundleIdentifiers;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_9:
        unint64_t v6 = v5;
        unint64_t v7 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          goto LABEL_15;
        }
        uint64_t v8 = v3;
        uint64_t v9 = *(void *)(a2 + v16);
        id v10 = [v5 origin];
        id v11 = [v10 bundleIdentifier];

        uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v14 = v13;

        LOBYTE(v9) = sub_100027488(v12, v14, v9);
        swift_bridgeObjectRelease();
        if (v9)
        {
        }
        else
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
        uint64_t v3 = v8;
        ++v4;
        if (v7 == v8) {
          return _swiftEmptyArrayStorage;
        }
      }
      if (v4 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
      if (!v3) {
        return _swiftEmptyArrayStorage;
      }
    }
    id v5 = *(id *)(a1 + 8 * v4 + 32);
    goto LABEL_9;
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100030C4C(uint64_t a1, unint64_t a2, uint64_t (*a3)(uint64_t, id))
{
  uint64_t v4 = a2;
  if (a2 >> 62) {
    goto LABEL_14;
  }
  uint64_t v6 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = _CocoaArrayWrapper.endIndex.getter())
  {
    unint64_t v14 = v4 & 0xC000000000000001;
    uint64_t v7 = 4;
    uint64_t v8 = v4;
    while (1)
    {
      id v9 = v14 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v4 + 8 * v7);
      id v10 = v9;
      uint64_t v4 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      uint64_t v11 = a3(a1, v9);
      swift_bridgeObjectRelease();
      if (v3)
      {
        swift_bridgeObjectRelease();

        return a1;
      }

      ++v7;
      a1 = v11;
      BOOL v12 = v4 == v6;
      uint64_t v4 = v8;
      if (v12)
      {
        swift_bridgeObjectRelease();
        return v11;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100030DA8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_100006ABC(&qword_10004E9B8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_100030EB8(uint64_t a1, char *a2, void (**a3)(void))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  uint64_t v7 = *(void **)&a2[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger];
  _Block_copy(a3);
  [v7 agentWillHandleRequest:"donateMeCardValues:completionHandler:"];
  if (a2[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_featureState] == 1)
  {
    [v7 featureNotEnabled:"donateMeCardValues:completionHandler:"];
    id v8 = +[NSError errorWithDomain:CNDonationErrorDomain code:1 userInfo:0];
    if (v8) {
      uint64_t v9 = _convertErrorToNSError(_:)();
    }
    else {
      uint64_t v9 = 0;
    }
    id v18 = (id)v9;
    a3[2](a3);
    swift_release();
  }
  else
  {
    sub_100006C44(0, (unint64_t *)&qword_10004D4A0);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    [v7 acceptingDonations:isa];

    uint64_t v11 = (void *)swift_allocObject();
    v11[2] = sub_1000107F8;
    v11[3] = v6;
    id v11[4] = a2;
    v11[5] = a1;
    void v11[6] = "donateMeCardValues:completionHandler:";
    BOOL v12 = *(void **)&a2[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock];
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = a2;
    *(void *)(v13 + 24) = a1;
    *(void *)(v13 + 32) = 0;
    *(unsigned char *)(v13 + 40) = 0;
    *(void *)(v13 + 48) = sub_10003388C;
    *(void *)(v13 + 56) = v11;
    aBlock[4] = sub_100033284;
    aBlock[5] = v13;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100027E90;
    aBlock[3] = &unk_100046EF8;
    unint64_t v14 = _Block_copy(aBlock);
    unsigned __int8 v15 = a2;
    swift_bridgeObjectRetain_n();
    uint64_t v16 = v15;
    swift_retain();
    swift_retain();
    swift_release();
    id v17 = [v12 performWriterBlock:v14];
    _Block_release(v14);
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
}

void sub_10003119C(uint64_t a1, char *a2, void (**a3)(void, void))
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  uint64_t v7 = *(void **)&a2[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger];
  _Block_copy(a3);
  [v7 agentWillHandleRequest:"removeDonatedMeCardValuesForIdentifiers:completionHandler:"];
  if (a2[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_featureState] == 1)
  {
    [v7 featureNotEnabled:"removeDonatedMeCardValuesForIdentifiers:completionHandler:"];
    id v8 = +[NSError errorWithDomain:CNDonationErrorDomain code:1 userInfo:0];
    if (v8) {
      uint64_t v9 = _convertErrorToNSError(_:)();
    }
    else {
      uint64_t v9 = 0;
    }
    id v16 = (id)v9;
    a3[2](a3, 0);
    swift_release();
  }
  else
  {
    id v10 = (void *)swift_allocObject();
    v10[2] = sub_1000339F8;
    id v10[3] = v6;
    void v10[4] = a2;
    v10[5] = "removeDonatedMeCardValuesForIdentifiers:completionHandler:";
    uint64_t v11 = *(void **)&a2[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock];
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = a2;
    *(void *)(v12 + 24) = a1;
    *(void *)(v12 + 32) = 0;
    *(unsigned char *)(v12 + 40) = 1;
    *(void *)(v12 + 48) = sub_100033820;
    *(void *)(v12 + 56) = v10;
    aBlock[4] = sub_100033284;
    aBlock[5] = v12;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100027E90;
    aBlock[3] = &unk_100046E58;
    uint64_t v13 = _Block_copy(aBlock);
    unint64_t v14 = a2;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    id v15 = [v11 performWriterBlock:v13];
    _Block_release(v13);
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
}

void sub_10003143C(uint64_t a1, uint64_t a2, char *a3, void (**a4)(void, void))
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a4;
  uint64_t v9 = *(void **)&a3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger];
  _Block_copy(a4);
  [v9 agentWillHandleRequest:"removeDonatedMeCardValuesForIdentifiers:completionHandler:"];
  if (a3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_featureState] == 1)
  {
    [v9 featureNotEnabled:"removeDonatedMeCardValuesForIdentifiers:completionHandler:"];
    id v10 = +[NSError errorWithDomain:CNDonationErrorDomain code:1 userInfo:0];
    if (v10) {
      uint64_t v11 = _convertErrorToNSError(_:)();
    }
    else {
      uint64_t v11 = 0;
    }
    id v18 = (id)v11;
    a4[2](a4, 0);
    swift_release();
  }
  else
  {
    uint64_t v12 = (void *)swift_allocObject();
    v12[2] = sub_1000107F0;
    uint64_t v12[3] = v8;
    v12[4] = a3;
    v12[5] = "removeDonatedMeCardValuesForIdentifiers:completionHandler:";
    uint64_t v13 = *(void **)&a3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock];
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = a3;
    *(void *)(v14 + 24) = a1;
    *(void *)(v14 + 32) = a2;
    *(unsigned char *)(v14 + 40) = 2;
    *(void *)(v14 + 48) = sub_100033A0C;
    *(void *)(v14 + 56) = v12;
    aBlock[4] = sub_100033284;
    aBlock[5] = v14;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100027E90;
    aBlock[3] = &unk_100046DB8;
    id v15 = _Block_copy(aBlock);
    id v16 = a3;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    id v17 = [v13 performWriterBlock:v15];
    _Block_release(v15);
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
}

uint64_t sub_1000316E0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v26 = (unint64_t *)result;
  uint64_t v27 = 0;
  int64_t v6 = 0;
  uint64_t v28 = a3 + 64;
  uint64_t v7 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v8 = -1;
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  unint64_t v9 = v8 & *(void *)(a3 + 64);
  int64_t v29 = (unint64_t)(v7 + 63) >> 6;
  while (v9)
  {
    unint64_t v11 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    unint64_t v12 = v11 | (v6 << 6);
LABEL_22:
    id v16 = *(void **)(*(void *)(a3 + 56) + 8 * v12);
    swift_bridgeObjectRetain();
    id v17 = v16;
    id v18 = [v17 origin];
    id v19 = [v18 bundleIdentifier];

    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v22 = v21;

    if (v20 == a4 && v22 == a5)
    {
      swift_bridgeObjectRelease();

      uint64_t result = swift_bridgeObjectRelease();
LABEL_5:
      *(unint64_t *)((char *)v26 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      if (__OFADD__(v27++, 1)) {
        goto LABEL_31;
      }
    }
    else
    {
      char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();

      uint64_t result = swift_bridgeObjectRelease();
      if (v24) {
        goto LABEL_5;
      }
    }
  }
  int64_t v13 = v6 + 1;
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v13 >= v29) {
    return sub_1000304E0(v26, a2, v27, a3);
  }
  unint64_t v14 = *(void *)(v28 + 8 * v13);
  ++v6;
  if (v14) {
    goto LABEL_21;
  }
  int64_t v6 = v13 + 1;
  if (v13 + 1 >= v29) {
    return sub_1000304E0(v26, a2, v27, a3);
  }
  unint64_t v14 = *(void *)(v28 + 8 * v6);
  if (v14) {
    goto LABEL_21;
  }
  int64_t v6 = v13 + 2;
  if (v13 + 2 >= v29) {
    return sub_1000304E0(v26, a2, v27, a3);
  }
  unint64_t v14 = *(void *)(v28 + 8 * v6);
  if (v14)
  {
LABEL_21:
    unint64_t v9 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v6 << 6);
    goto LABEL_22;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v29) {
    return sub_1000304E0(v26, a2, v27, a3);
  }
  unint64_t v14 = *(void *)(v28 + 8 * v15);
  if (v14)
  {
    int64_t v6 = v15;
    goto LABEL_21;
  }
  while (1)
  {
    int64_t v6 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v6 >= v29) {
      return sub_1000304E0(v26, a2, v27, a3);
    }
    unint64_t v14 = *(void *)(v28 + 8 * v6);
    ++v15;
    if (v14) {
      goto LABEL_21;
    }
  }
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_100031958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v7 = *(unsigned char *)(a1 + 32);
  unsigned int v8 = v7 & 0x3F;
  unint64_t v9 = (unint64_t)((1 << v7) + 63) >> 6;
  size_t v10 = 8 * v9;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v8 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe, v12);
    bzero((char *)&v16 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v10);
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_1000316E0((uint64_t)&v16 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v9, a1, a2, a3);
    swift_bridgeObjectRelease();
    if (v3) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    unint64_t v14 = (void *)swift_slowAlloc();
    bzero(v14, v10);
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_1000316E0((uint64_t)v14, v9, a1, a2, a3);
    swift_bridgeObjectRelease();
    swift_slowDealloc();
    swift_bridgeObjectRelease_n();
  }
  return v13;
}

uint64_t sub_100031B20(uint64_t a1, void *a2, unsigned char *a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a4;
  *(void *)(v10 + 24) = a5;
  unint64_t v11 = *(void **)&a3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger];
  swift_retain();
  [v11 agentWillHandleRequest:a1];
  uint64_t v12 = OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_featureState;
  if (a3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_featureState])
  {
    if (a3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_featureState] >= 2u) {
      goto LABEL_3;
    }
LABEL_6:
    [v11 featureNotEnabled:a1];
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = sub_10003376C;
    *(void *)(v24 + 24) = v10;
    uint64_t v34 = sub_1000339FC;
    uint64_t v35 = v24;
    long long aBlock = _NSConcreteStackBlock;
    uint64_t v31 = 1107296256;
    uint64_t v32 = sub_100026380;
    uint64_t v33 = &unk_100046CA0;
    unint64_t v25 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    [a2 performBlock:v25];
    _Block_release(v25);
LABEL_10:
    [v11 agentDidHandleRequest:a1];
    return swift_release();
  }
  uint64_t v22 = *(void **)&a3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock];
  uint64_t v34 = nullsub_1;
  uint64_t v35 = 0;
  long long aBlock = _NSConcreteStackBlock;
  uint64_t v31 = 1107296256;
  uint64_t v32 = sub_100026380;
  uint64_t v33 = &unk_100046D18;
  uint64_t v23 = _Block_copy(&aBlock);
  [v22 performSynchronousReaderBlock:v23];
  _Block_release(v23);
  if (a3[v12] < 2u) {
    goto LABEL_6;
  }
LABEL_3:
  int64_t v29 = a4;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = 0;
  unint64_t v14 = *(void **)&a3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock];
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  *(void *)(v15 + 24) = a3;
  uint64_t v34 = sub_100033A00;
  uint64_t v35 = v15;
  long long aBlock = _NSConcreteStackBlock;
  uint64_t v31 = 1107296256;
  uint64_t v32 = sub_100026380;
  uint64_t v33 = &unk_100046CF0;
  uint64_t v16 = _Block_copy(&aBlock);
  swift_retain();
  id v17 = a3;
  swift_release();
  [v14 performSynchronousReaderBlock:v16];
  _Block_release(v16);
  swift_beginAccess();
  id v18 = *(void **)(v13 + 16);
  if (v18)
  {
    id v19 = self;
    id v20 = v18;
    id v21 = [v19 eitherWithLeft:v20];
    sub_1000293C4(v21, v29);
    swift_release();

LABEL_9:
    goto LABEL_10;
  }
  id v26 = +[NSError errorWithDomain:CNDonationErrorDomain code:5 userInfo:0];
  if (v26)
  {
    uint64_t v27 = v26;
    id v21 = [self eitherWithRight:v26];

    sub_1000293C4(v21, v29);
    swift_release();
    goto LABEL_9;
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

void sub_100031F3C(uint64_t a1, void *a2, unsigned char *a3, void (**a4)(void, void))
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a4;
  unint64_t v9 = *(void **)&a3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger];
  _Block_copy(a4);
  [v9 agentWillHandleRequest:a1];
  uint64_t v10 = OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_featureState;
  if (a3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_featureState])
  {
    if (a3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_featureState] >= 2u) {
      goto LABEL_3;
    }
LABEL_6:
    [v9 featureNotEnabled:a1];
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = sub_100033730;
    *(void *)(v22 + 24) = v8;
    uint64_t v30 = sub_100033744;
    uint64_t v31 = v22;
    id v26 = _NSConcreteStackBlock;
    uint64_t v27 = 1107296256;
    uint64_t v28 = sub_100026380;
    int64_t v29 = &unk_100046B60;
    uint64_t v23 = _Block_copy(&v26);
    swift_retain();
    swift_release();
    [a2 performBlock:v23];
    _Block_release(v23);
LABEL_10:
    [v9 agentDidHandleRequest:a1];
    swift_release();
    return;
  }
  id v20 = *(void **)&a3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock];
  uint64_t v30 = (void (*)())nullsub_1;
  uint64_t v31 = 0;
  id v26 = _NSConcreteStackBlock;
  uint64_t v27 = 1107296256;
  uint64_t v28 = sub_100026380;
  int64_t v29 = &unk_100046C00;
  id v21 = _Block_copy(&v26);
  [v20 performSynchronousReaderBlock:v21];
  _Block_release(v21);
  if (a3[v10] < 2u) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = 0;
  uint64_t v12 = *(void **)&a3[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock];
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  *(void *)(v13 + 24) = a3;
  uint64_t v30 = sub_100033764;
  uint64_t v31 = v13;
  id v26 = _NSConcreteStackBlock;
  uint64_t v27 = 1107296256;
  uint64_t v28 = sub_100026380;
  int64_t v29 = &unk_100046BD8;
  unint64_t v14 = _Block_copy(&v26);
  swift_retain();
  uint64_t v15 = a3;
  swift_release();
  [v12 performSynchronousReaderBlock:v14];
  _Block_release(v14);
  swift_beginAccess();
  uint64_t v16 = *(void **)(v11 + 16);
  if (v16)
  {
    id v17 = self;
    id v18 = v16;
    id v19 = [v17 eitherWithLeft:v18];
    ((void (**)(void, id))a4)[2](a4, v19);
    swift_release();

LABEL_9:
    goto LABEL_10;
  }
  id v24 = +[NSError errorWithDomain:CNDonationErrorDomain code:5 userInfo:0];
  if (v24)
  {
    unint64_t v25 = v24;
    id v19 = [self eitherWithRight:v24];

    ((void (**)(void, id))a4)[2](a4, v19);
    swift_release();
    goto LABEL_9;
  }
  _Block_release(a4);
  __break(1u);
}

void sub_100032358(char *a1, void (**a2)(void, void))
{
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a2;
  unint64_t v5 = *(void **)&a1[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger];
  _Block_copy(a2);
  [v5 agentWillHandleRequest:"meCardDonations:"];
  if (a1[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_featureState] < 2u)
  {
    [v5 featureNotEnabled:"meCardDonations:"];
    id v11 = +[NSError errorWithDomain:CNDonationErrorDomain code:1 userInfo:0];
    if (v11) {
      uint64_t v12 = _convertErrorToNSError(_:)();
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = (id)v12;
    a2[2](a2, 0);
    swift_release();
  }
  else
  {
    int64_t v6 = *(void **)&a1[OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_lock];
    char v7 = (void *)swift_allocObject();
    v7[2] = a1;
    v7[3] = sub_1000107D8;
    v7[4] = v4;
    void v7[5] = "meCardDonations:";
    aBlock[4] = sub_1000336B0;
    aBlock[5] = v7;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100027E90;
    aBlock[3] = &unk_100046A98;
    uint64_t v8 = _Block_copy(aBlock);
    unint64_t v9 = a1;
    swift_retain();
    swift_release();
    id v10 = [v6 performReaderBlock:v8];
    _Block_release(v8);
    swift_release();
    swift_unknownObjectRelease();
  }
}

void sub_100032590(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    if (a1) {
      uint64_t v8 = "accountChanged:";
    }
    else {
      uint64_t v8 = "accountAdded:";
    }
    objc_msgSend(*(id *)(a3 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_accountLogger), v8, a2);
  }
  else if (a1)
  {
    [*(id *)(a3 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_accountLogger) accountRemoved:a1];
  }
  if (*(unsigned char *)(a3 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_featureState) == 1)
  {
    [*(id *)(a3 + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger) featureNotEnabled:"changeFromAccount:toAccount:completionHandler:"];
    id v9 = +[NSError errorWithDomain:CNDonationErrorDomain code:1 userInfo:0];
    if (v9) {
      uint64_t v10 = _convertErrorToNSError(_:)();
    }
    else {
      uint64_t v10 = 0;
    }
    id v12 = (id)v10;
    (*(void (**)(uint64_t))(a4 + 16))(a4);
  }
  else
  {
    sub_10002C260(a1, a2);
    id v11 = *(void (**)(uint64_t, void))(a4 + 16);
    v11(a4, 0);
  }
}

void sub_100032708(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, id))
{
  uint64_t v5 = v4;
  int64_t v7 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = a3 + 64;
  uint64_t v8 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 64);
  int64_t v26 = (unint64_t)(v8 + 63) >> 6;
  while (v10)
  {
    unint64_t v11 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    unint64_t v12 = v11 | (v7 << 6);
LABEL_17:
    uint64_t v16 = (uint64_t *)(*(void *)(a3 + 48) + 16 * v12);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    id v19 = *(void **)(*(void *)(a3 + 56) + 8 * v12);
    swift_bridgeObjectRetain();
    id v20 = v19;
    char v21 = a4(v17, v18, v20);
    swift_bridgeObjectRelease();

    if (v5) {
      return;
    }
    if (v21)
    {
      *(unint64_t *)((char *)a1 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = __OFADD__(v24++, 1);
      if (v13) {
        goto LABEL_30;
      }
    }
  }
  BOOL v13 = __OFADD__(v7++, 1);
  if (v13)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v7 >= v26) {
    goto LABEL_26;
  }
  unint64_t v14 = *(void *)(v25 + 8 * v7);
  if (v14)
  {
LABEL_16:
    unint64_t v10 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v7 << 6);
    goto LABEL_17;
  }
  int64_t v15 = v7 + 1;
  if (v7 + 1 >= v26) {
    goto LABEL_26;
  }
  unint64_t v14 = *(void *)(v25 + 8 * v15);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v7 + 2;
  if (v7 + 2 >= v26) {
    goto LABEL_26;
  }
  unint64_t v14 = *(void *)(v25 + 8 * v15);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v7 + 3;
  if (v7 + 3 >= v26)
  {
LABEL_26:
    sub_1000304E0(a1, a2, v24, a3);
    return;
  }
  unint64_t v14 = *(void *)(v25 + 8 * v15);
  if (v14)
  {
LABEL_15:
    int64_t v7 = v15;
    goto LABEL_16;
  }
  while (1)
  {
    int64_t v7 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v7 >= v26) {
      goto LABEL_26;
    }
    unint64_t v14 = *(void *)(v25 + 8 * v7);
    ++v15;
    if (v14) {
      goto LABEL_16;
    }
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
}

uint64_t sub_100032914(uint64_t isStackAllocationSafe, uint64_t (*a2)(uint64_t, uint64_t, id), uint64_t a3)
{
  uint64_t v6 = isStackAllocationSafe;
  char v7 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v8 = (unint64_t)((1 << v7) + 63) >> 6;
  size_t v9 = 8 * v8;
  if ((v7 & 0x3Fu) <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe, a2);
    bzero((char *)&v14 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    sub_100032708((unint64_t *)((char *)&v14 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0)), v8, v6, a2);
    if (v3) {
      swift_willThrow();
    }
    else {
      return v10;
    }
  }
  else
  {
    unint64_t v11 = (void *)swift_slowAlloc();
    bzero(v11, v9);
    sub_100032708((unint64_t *)v11, v8, v6, a2);
    a3 = v12;
    swift_slowDealloc();
  }
  return a3;
}

uint64_t sub_100032A8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  char v8 = *(unsigned char *)(a1 + 32);
  unsigned int v9 = v8 & 0x3F;
  unint64_t v10 = (unint64_t)((1 << v8) + 63) >> 6;
  size_t v11 = 8 * v10;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v9 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe, v13);
    bzero((char *)&v17 - ((v11 + 15) & 0x3FFFFFFFFFFFFFF0), v11);
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_10003021C((unint64_t *)((char *)&v17 - ((v11 + 15) & 0x3FFFFFFFFFFFFFF0)), v10, a1, a2, a3);
    if (v3) {
      swift_willThrow();
    }
    else {
      a2 = v14;
    }
    swift_release();
  }
  else
  {
    int64_t v15 = (void *)swift_slowAlloc();
    bzero(v15, v11);
    swift_bridgeObjectRetain();
    a2 = sub_10003021C((unint64_t *)v15, v10, a1, a2, a3);
    swift_slowDealloc();
    swift_release();
  }
  swift_bridgeObjectRelease();
  return a2;
}

unint64_t sub_100032C74()
{
  return sub_100032D14((SEL *)&selRef_couldNotRejectClusterIdentifier_error_, (SEL *)&selRef_didRejectClusterIdentifier_, (SEL *)&selRef_couldNotRejectUnknownClusterIdentifier_);
}

void sub_100032C94(uint64_t a1)
{
  sub_10002D98C(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_100032CA0()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_100032CC8(unint64_t result)
{
  if (result >= 2) {
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_100032CD8()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

unint64_t sub_100032D14(SEL *a1, SEL *a2, SEL *a3)
{
  return sub_10002D734(*(void *)(v3 + 16), *(void *)(v3 + 24), *(void *)(v3 + 32), *(void *)(v3 + 40), *(uint64_t (**)(unint64_t))(v3 + 48), *(void *)(v3 + 56), a1, a2, a3);
}

unint64_t sub_100032D50(unint64_t result)
{
  if (result >= 2) {
    return swift_errorRetain();
  }
  return result;
}

uint64_t sub_100032D64(uint64_t a1)
{
  return sub_100032D7C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_10002C790);
}

uint64_t sub_100032D7C(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t sub_100032D98()
{
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 40);
  uint64_t v2 = *(void **)(*(void *)(v0 + 16) + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger);
  NSString v3 = String._bridgeToObjectiveC()();
  [v2 didRejectDonationIdentifier:v3];

  return v1(0);
}

uint64_t sub_100032E00()
{
  uint64_t v1 = *(void *)(type metadata accessor for CNDonationValue.Value(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = v0 + v3;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      uint64_t v6 = type metadata accessor for PersonNameComponents();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
      break;
    case 1u:
    case 2u:
      swift_bridgeObjectRelease();
      goto LABEL_5;
    case 3u:

LABEL_5:
      swift_bridgeObjectRelease();
      break;
    case 4u:
      sub_100009AA0(*(void *)v5, *(void *)(v5 + 8));
      break;
    default:
      break;
  }

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100032F54(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *(void *)(type metadata accessor for CNDonationValue.Value(0) - 8);
  uint64_t v8 = v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return sub_10002CE3C(a1, a2, a3, v8);
}

uint64_t sub_100032FE0()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_100033028(unint64_t a1)
{
}

unint64_t sub_100033054()
{
  return sub_100032D14((SEL *)&selRef_couldNotRejectDonationIdentifier_error_, (SEL *)&selRef_didRejectDonationIdentifier_, (SEL *)&selRef_couldNotRejectUnknownDonationIdentifier_);
}

uint64_t sub_100033078()
{
  if (*(void *)(v0 + 16) >= 2uLL) {
    swift_errorRelease();
  }

  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_1000330D0()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100033108(uint64_t a1, uint64_t a2)
{
  sub_100007AA8(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_100033110()
{
  return sub_100033654((void (*)(void))&_swift_bridgeObjectRelease, 40);
}

void sub_10003312C(uint64_t a1)
{
  sub_10002A450(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100033138()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

id sub_100033170()
{
  return sub_10002BE30(*(void **)(v0 + 16));
}

uint64_t sub_100033178()
{
  return sub_10003378C((void (*)(void))&_swift_bridgeObjectRelease);
}

void sub_100033190()
{
  sub_10002A93C(*(void *)(v0 + 16), *(char **)(v0 + 24));
}

uint64_t sub_100033198()
{
  return sub_1000332DC((void (*)(void))&_swift_bridgeObjectRelease);
}

id sub_1000331B0(uint64_t a1)
{
  return sub_10002ACF8(a1, *(char **)(v1 + 16), *(void *)(v1 + 24));
}

void sub_1000331B8()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 16) + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger);
  id v2 = (id)_convertErrorToNSError(_:)();
  [v1 couldNotRenewBecauseLoadingError:v2];
}

uint64_t sub_10003321C()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10003325C(uint64_t a1, uint64_t a2)
{
  sub_10002AF60(a1, a2, *(char **)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_100033268(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10003328C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000332C4()
{
  return sub_1000332DC((void (*)(void))&_swift_release);
}

uint64_t sub_1000332DC(void (*a1)(void))
{
  a1(*(void *)(v1 + 24));

  return _swift_deallocObject(v1, 32, 7);
}

void sub_10003332C(void *a1)
{
  sub_10002A20C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

id sub_100033334()
{
  return [*(id *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_logger) didDiscoverExtensions];
}

void sub_100033350(uint64_t a1)
{
  sub_10002A3E0(a1, *(void *)(v1 + 16));
}

uint64_t sub_100033358(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_100033374()
{
  return sub_100033654((void (*)(void))&_swift_release, 40);
}

uint64_t sub_100033390(uint64_t a1)
{
  return sub_10002901C(a1, *(char **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1000333A0()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_1000333E8()
{
  sub_100029154(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_1000333F4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003342C()
{
  return (*(uint64_t (**)(void))(v0 + 16))(0);
}

uint64_t sub_100033458()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100033480(char a1)
{
  return sub_100027E98(a1, *(char **)(v1 + 16));
}

uint64_t sub_100033488(char a1)
{
  return sub_100028014(a1, *(char **)(v1 + 16));
}

uint64_t sub_100033490()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000334C8()
{
  return sub_100027D6C();
}

void sub_1000334D0()
{
  *(unsigned char *)(*(void *)(v0 + 16)
           + OBJC_IVAR____TtC21contactsdonationagent13DonationAgent_suppressingNotificationsDuringStartup) = 0;
}

uint64_t sub_1000334E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006ABC((uint64_t *)&unk_10004E170);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_10003354C(uint64_t a1)
{
  sub_1000289FC(a1, *(void *)(v1 + 16));
}

uint64_t sub_100033554()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_10003358C(uint64_t a1)
{
  return sub_100028114(a1, *(unsigned char *)(v1 + 16), *(char **)(v1 + 24));
}

id sub_100033598(uint64_t a1)
{
  return sub_100029B2C(a1, *(char **)(v1 + 16));
}

uint64_t sub_1000335A0()
{
  return sub_100033654((void (*)(void))&_swift_release, 40);
}

uint64_t sub_1000335BC()
{
  return _swift_deallocObject(v0, 25, 7);
}

id sub_1000335F4(uint64_t a1)
{
  return sub_100027F98(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24));
}

uint64_t sub_100033600()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100033638()
{
  return sub_100033654((void (*)(void))&_swift_release, 48);
}

uint64_t sub_100033654(void (*a1)(void), uint64_t a2)
{
  a1(*(void *)(v2 + 32));

  return _swift_deallocObject(v2, a2, 7);
}

id sub_1000336B0(uint64_t a1)
{
  return sub_1000296F8(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_1000336BC()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000336FC()
{
  return (*(uint64_t (**)(void, void))(v0 + 16))(*(void *)(v0 + 32), 0);
}

uint64_t sub_100033730()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_100033744()
{
  sub_1000295DC(*(void (**)(id))(v0 + 16));
}

uint64_t sub_10003374C()
{
  return sub_10003378C((void (*)(void))&_swift_release);
}

void sub_100033764()
{
  sub_100029698(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_10003376C(void *a1)
{
  sub_1000293C4(a1, *(void (**)(void))(v1 + 16));
}

uint64_t sub_100033774()
{
  return sub_10003378C((void (*)(void))&_swift_release);
}

uint64_t sub_10003378C(void (*a1)(void))
{
  a1(*(void *)(v1 + 16));

  return _swift_deallocObject(v1, 32, 7);
}

uint64_t sub_1000337E0()
{
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

id sub_100033820(uint64_t a1)
{
  return sub_1000286B8(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_100033844()
{
  swift_release();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10003388C(uint64_t a1)
{
  return sub_100032D7C(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_100028218);
}

uint64_t sub_1000338A8()
{
  sub_100033268(*(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40));
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

unint64_t sub_1000338F4()
{
  return sub_1000287E8(*(void *)(v0 + 24), *(void *)(v0 + 32), *(unsigned char *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56));
}

BOOL sub_100033928(id *a1)
{
  return sub_100028444(a1);
}

uint64_t sub_100033948(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1000339A4(uint64_t a1)
{
  return a1;
}

uint64_t sub_100033BD0()
{
  sub_100006ABC(&qword_10004EA68);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100038F30;
  *(void *)(v0 + 32) = sub_100033E04;
  *(void *)(v0 + 40) = 0;
  if (qword_10004D200 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10004EA00;
  uint64_t v1 = *(void *)algn_10004EA08;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v1;
  *(void *)(v0 + 48) = sub_100034C98;
  *(void *)(v0 + 56) = v3;
  uint64_t v4 = qword_10004D208;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_10004EA10;
  uint64_t v5 = *(void *)algn_10004EA18;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = v5;
  *(void *)(v0 + 64) = sub_100034D64;
  *(void *)(v0 + 72) = v7;
  uint64_t v8 = qword_10004D210;
  swift_retain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_10004EA20;
  uint64_t v9 = *(void *)algn_10004EA28;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = v9;
  *(void *)(v0 + 80) = sub_100034D64;
  *(void *)(v0 + 88) = v11;
  uint64_t v12 = qword_10004D218;
  swift_retain();
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_10004EA30;
  uint64_t v13 = *(void *)algn_10004EA38;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v13;
  *(void *)(v0 + 96) = sub_100034D64;
  *(void *)(v0 + 104) = v15;
  qword_10004ED58 = v0;

  return swift_retain();
}

uint64_t sub_100033E04@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100033E0C(*a1, a2);
}

uint64_t sub_100033E0C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for PersonNameComponents();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  PersonNameComponents.init()();
  uint64_t v20 = 0x6D614E7473726966;
  unint64_t v21 = 0xE900000000000065;
  id v9 = [a1 objectForKeyedSubscript:_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()];
  swift_unknownObjectRelease();
  if (v9)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  sub_10000DD8C((uint64_t)&v18, (uint64_t)&v20);
  if (v22) {
    swift_dynamicCast();
  }
  else {
    sub_100009A44((uint64_t)&v20, (uint64_t *)&unk_10004DB60);
  }
  PersonNameComponents.givenName.setter();
  uint64_t v20 = 0x656D614E7473616CLL;
  unint64_t v21 = 0xE800000000000000;
  id v10 = [a1 objectForKeyedSubscript:_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()];
  swift_unknownObjectRelease();
  if (v10)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }
  sub_10000DD8C((uint64_t)&v18, (uint64_t)&v20);
  if (v22) {
    swift_dynamicCast();
  }
  else {
    sub_100009A44((uint64_t)&v20, (uint64_t *)&unk_10004DB60);
  }
  PersonNameComponents.familyName.setter();
  PersonNameComponents.givenName.getter();
  uint64_t v12 = v11;
  swift_bridgeObjectRelease();
  if (v12 || (PersonNameComponents.familyName.getter(), uint64_t v14 = v13, swift_bridgeObjectRelease(), v14))
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v8, v4);
    uint64_t v15 = 0;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    uint64_t v15 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, v15, 1, v4);
}

void *sub_100034114()
{
  uint64_t v0 = type metadata accessor for AccountPropertyNameParser();
  uint64_t result = (void *)swift_allocObject();
  result[2] = v0;
  result[3] = 0xD000000000000012;
  result[4] = 0x800000010003BB70;
  qword_10004EA00 = (uint64_t)sub_100034D78;
  *(void *)algn_10004EA08 = result;
  return result;
}

uint64_t sub_100034188()
{
  uint64_t v0 = type metadata accessor for AccountPropertyNameParser();
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = v0;
  strcpy((char *)(result + 24), "FullUserName");
  *(unsigned char *)(result + 37) = 0;
  *(_WORD *)(result + 38) = -5120;
  qword_10004EA10 = (uint64_t)sub_100034D58;
  *(void *)algn_10004EA18 = result;
  return result;
}

uint64_t sub_100034200@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  v11[0] = a2;
  v11[1] = a3;
  swift_bridgeObjectRetain();
  id v6 = [a1 objectForKeyedSubscript:_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()];
  swift_unknownObjectRelease();
  if (v6)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
  }
  sub_10000DD8C((uint64_t)v10, (uint64_t)v11);
  if (v11[3])
  {
    if (swift_dynamicCast()) {
      uint64_t v7 = v9;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    sub_100009A44((uint64_t)v11, (uint64_t *)&unk_10004DB60);
    uint64_t v7 = 0;
  }
  sub_10003431C(v7, a4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10003431C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for PersonNameComponents();
  __chkstk_darwin(v4, v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v19 = v6;
    uint64_t v9 = self;
    NSString v10 = String._bridgeToObjectiveC()();
    id v11 = [v9 componentsFromString:v10];

    static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)();
    PersonNameComponents.givenName.getter();
    uint64_t v13 = v12;
    swift_bridgeObjectRelease();
    if (v13 || (PersonNameComponents.familyName.getter(), uint64_t v15 = v14, swift_bridgeObjectRelease(), v15))
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(a2, v8, v4);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(a2, 0, 1, v4);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v4);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(a2, 1, 1, v4);
    }
  }
  else
  {
    uint64_t v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
    return v17(a2, 1, 1, v4);
  }
}

void *sub_100034510()
{
  uint64_t v0 = type metadata accessor for AccountPropertyNameParser();
  uint64_t result = (void *)swift_allocObject();
  result[2] = 0xD000000000000014;
  result[3] = 0x800000010003BB50;
  result[4] = v0;
  result[5] = 0xD000000000000012;
  result[6] = 0x800000010003BB70;
  qword_10004EA20 = (uint64_t)sub_100034CC8;
  *(void *)algn_10004EA28 = result;
  return result;
}

void *sub_10003459C()
{
  uint64_t v0 = type metadata accessor for AccountPropertyNameParser();
  uint64_t result = (void *)swift_allocObject();
  result[2] = 0xD000000000000010;
  result[3] = 0x800000010003BB30;
  result[4] = v0;
  result[5] = 0x656D614E6C6C7546;
  result[6] = 0xE800000000000000;
  qword_10004EA30 = (uint64_t)sub_100034CC8;
  *(void *)algn_10004EA38 = result;
  return result;
}

uint64_t sub_100034628@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, char *a6@<X8>)
{
  uint64_t v54 = a4;
  uint64_t v11 = type metadata accessor for PersonNameComponents();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  uint64_t v53 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100006ABC((uint64_t *)&unk_10004E060);
  __chkstk_darwin(v15 - 8, v16);
  uint64_t v18 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v58[0] = a2;
  *((void *)&v58[0] + 1) = a3;
  swift_bridgeObjectRetain();
  id v19 = [a1 objectForKeyedSubscript:_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()];
  swift_unknownObjectRelease();
  if (v19)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v58, 0, sizeof(v58));
  }
  sub_10000DD8C((uint64_t)v58, (uint64_t)&v59);
  if (!*((void *)&v60 + 1))
  {
    sub_100009A44((uint64_t)&v59, (uint64_t *)&unk_10004DB60);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(a6, 1, 1, v11);
  }
  sub_100006ABC(&qword_10004EA70);
  uint64_t v55 = (char *)&type metadata for Any + 8;
  uint64_t result = swift_dynamicCast();
  if ((result & 1) == 0) {
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(a6, 1, 1, v11);
  }
  int64_t v21 = 0;
  uint64_t v22 = v57;
  uint64_t v23 = 1 << *(unsigned char *)(v57 + 32);
  uint64_t v24 = -1;
  if (v23 < 64) {
    uint64_t v24 = ~(-1 << v23);
  }
  unint64_t v25 = v24 & *(void *)(v57 + 64);
  int64_t v56 = (unint64_t)(v23 + 63) >> 6;
  uint64_t v49 = a6;
  NSString v50 = (void (**)(char *, char *, uint64_t))(v12 + 32);
  int64_t v26 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  uint64_t v48 = (void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v51 = (uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  uint64_t v52 = v57 + 64;
  uint64_t v27 = v57 + 64;
  uint64_t v28 = v54;
  while (1)
  {
    if (v25)
    {
      unint64_t v29 = __clz(__rbit64(v25));
      v25 &= v25 - 1;
      unint64_t v30 = v29 | (v21 << 6);
      goto LABEL_29;
    }
    int64_t v31 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
      __break(1u);
      goto LABEL_46;
    }
    if (v31 >= v56) {
      goto LABEL_43;
    }
    unint64_t v32 = *(void *)(v27 + 8 * v31);
    ++v21;
    if (!v32)
    {
      int64_t v21 = v31 + 1;
      if (v31 + 1 >= v56) {
        goto LABEL_43;
      }
      unint64_t v32 = *(void *)(v27 + 8 * v21);
      if (!v32)
      {
        int64_t v21 = v31 + 2;
        if (v31 + 2 >= v56) {
          goto LABEL_43;
        }
        unint64_t v32 = *(void *)(v27 + 8 * v21);
        if (!v32) {
          break;
        }
      }
    }
LABEL_28:
    unint64_t v25 = (v32 - 1) & v32;
    unint64_t v30 = __clz(__rbit64(v32)) + (v21 << 6);
LABEL_29:
    uint64_t v34 = *(void *)(*(void *)(v22 + 56) + 8 * v30);
    if (!*(void *)(v34 + 16))
    {
      long long v59 = 0u;
      long long v60 = 0u;
LABEL_10:
      sub_100009A44((uint64_t)&v59, (uint64_t *)&unk_10004DB60);
LABEL_11:
      (*v26)(v18, 1, 1, v11);
      goto LABEL_12;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v35 = sub_10002E8BC(v28, a5);
    if (v36)
    {
      sub_1000134E0(*(void *)(v34 + 56) + 32 * v35, (uint64_t)&v59);
    }
    else
    {
      long long v59 = 0u;
      long long v60 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!*((void *)&v60 + 1)) {
      goto LABEL_10;
    }
    if ((swift_dynamicCast() & 1) == 0) {
      goto LABEL_11;
    }
    uint64_t v37 = self;
    NSString v38 = String._bridgeToObjectiveC()();
    id v39 = [v37 componentsFromString:v38];

    objc_super v40 = v53;
    static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)();

    PersonNameComponents.givenName.getter();
    uint64_t v42 = v41;
    swift_bridgeObjectRelease();
    if (v42 || (PersonNameComponents.familyName.getter(), uint64_t v44 = v43, swift_bridgeObjectRelease(), v44))
    {
      (*v50)(v18, v40, v11);
      uint64_t v45 = *v26;
      (*v26)(v18, 0, 1, v11);
    }
    else
    {
      (*v48)(v40, v11);
      uint64_t v45 = *v26;
      (*v26)(v18, 1, 1, v11);
    }
    swift_bridgeObjectRelease();
    int v46 = (*v51)(v18, 1, v11);
    uint64_t v28 = v54;
    uint64_t v27 = v52;
    if (v46 != 1)
    {
      swift_release();
      uint64_t v47 = v49;
      (*v50)(v49, v18, v11);
      return ((uint64_t (*)(char *, void, uint64_t, uint64_t))v45)(v47, 0, 1, v11);
    }
LABEL_12:
    uint64_t result = sub_100009A44((uint64_t)v18, (uint64_t *)&unk_10004E060);
  }
  int64_t v33 = v31 + 3;
  if (v33 >= v56)
  {
LABEL_43:
    swift_release();
    return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))*v26)(v49, 1, 1, v11);
  }
  unint64_t v32 = *(void *)(v27 + 8 * v33);
  if (v32)
  {
    int64_t v21 = v33;
    goto LABEL_28;
  }
  while (1)
  {
    int64_t v21 = v33 + 1;
    if (__OFADD__(v33, 1)) {
      break;
    }
    if (v21 >= v56) {
      goto LABEL_43;
    }
    unint64_t v32 = *(void *)(v27 + 8 * v21);
    ++v33;
    if (v32) {
      goto LABEL_28;
    }
  }
LABEL_46:
  __break(1u);
  return result;
}

id sub_100034C04()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AccountPropertyNameParser();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AccountPropertyNameParser()
{
  return self;
}

uint64_t sub_100034C60()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100034C98(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t sub_100034CD0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100034D10@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  return sub_100034628(a1, v2[2], v2[3], v2[5], v2[6], a2);
}

uint64_t sub_100034D20()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100034D58@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100034200(a1, *(void *)(v2 + 24), *(void *)(v2 + 32), a2);
}

uint64_t sub_100034D7C(void *a1)
{
  uint64_t v63 = type metadata accessor for NameSuppressionStatus(0);
  __chkstk_darwin(v63, v2);
  uint64_t v65 = (uint64_t)&v60 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006ABC(&qword_10004D9A0);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for CNDonationValue.Value(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = __chkstk_darwin(v8, v10);
  uint64_t v13 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11, v14);
  uint64_t v16 = (char *)&v60 - v15;
  uint64_t v17 = sub_100006ABC((uint64_t *)&unk_10004E060);
  __chkstk_darwin(v17 - 8, v18);
  uint64_t v20 = (char *)&v60 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = type metadata accessor for PersonNameComponents();
  uint64_t v68 = *(void *)(v66 - 8);
  uint64_t v22 = __chkstk_darwin(v66, v21);
  int v62 = (char *)&v60 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v22, v24);
  uint64_t v61 = (char *)&v60 - v26;
  __chkstk_darwin(v25, v27);
  uint64_t v67 = (char *)&v60 - v28;
  unint64_t v29 = (objc_class *)_s11ValueCasterCMa(0);
  id v30 = objc_allocWithZone(v29);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))((uint64_t)v30+ OBJC_IVAR____TtCE21contactsdonationagentCSo15CNDonationValueP33_0B54ECC677397DAC3B941865EB3B64B811ValueCaster_value, 1, 1, v8);
  v70.receiver = v30;
  v70.super_class = v29;
  id v31 = a1;
  id v32 = objc_msgSendSuper2(&v70, "init");
  [v31 acceptDonationValueVisitor:v32];

  uint64_t v33 = (uint64_t)v32
      + OBJC_IVAR____TtCE21contactsdonationagentCSo15CNDonationValueP33_0B54ECC677397DAC3B941865EB3B64B811ValueCaster_value;
  swift_beginAccess();
  sub_10000C794(v33, (uint64_t)v7);

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    __break(1u);
    JUMPOUT(0x10003552CLL);
  }
  sub_10000C7FC((uint64_t)v7, (uint64_t)v16);
  sub_10000C7FC((uint64_t)v16, (uint64_t)v13);
  if (swift_getEnumCaseMultiPayload())
  {
    uint64_t v34 = v68;
    uint64_t v35 = v66;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v68 + 56))(v20, 1, 1, v66);
    sub_100035BF0((uint64_t)v13, type metadata accessor for CNDonationValue.Value);
  }
  else
  {
    uint64_t v34 = v68;
    uint64_t v35 = v66;
    (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v20, v13, v66);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v34 + 56))(v20, 0, 1, v35);
  }
  int v36 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 48))(v20, 1, v35);
  uint64_t v37 = (uint64_t)v67;
  if (v36 == 1) {
    return sub_100009A44((uint64_t)v20, (uint64_t *)&unk_10004E060);
  }
  id v39 = *(void (**)(char *, char *, uint64_t))(v34 + 32);
  v39(v67, v20, v35);
  uint64_t v41 = v64;
  uint64_t v40 = v65;
  sub_1000378C8(v64, v65, type metadata accessor for NameSuppressionStatus);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v44 = (uint64_t)v61;
      (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v61, v40, v35);
      char v45 = sub_100036024(v44, v37);
      int v46 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
      v46(v44, v35);
      v46(v37, v35);
      if ((v45 & 1) == 0)
      {
        sub_100035BF0(v41, type metadata accessor for NameSuppressionStatus);
        swift_storeEnumTagMultiPayload();
      }
      uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v46)(v40, v35);
      break;
    case 2u:
      sub_100035BF0(v41, type metadata accessor for NameSuppressionStatus);
      v39((char *)v41, (char *)v37, v35);
      uint64_t result = swift_storeEnumTagMultiPayload();
      break;
    case 3u:
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 8))(v37, v35);
      break;
    default:
      uint64_t v42 = (uint64_t)v62;
      (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v62, v40, v35);
      if (sub_100036024(v42, v37))
      {
        uint64_t v43 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
        v43(v42, v35);
        v43(v37, v35);
        uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v43)(v40, v35);
      }
      else
      {
        id v47 = [v31 origin];
        id v48 = [v47 clusterIdentifier];

        uint64_t v49 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        Swift::Int v51 = v50;

        if (!v49 && v51 == 0xE000000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          id v52 = [v31 origin];
          id v53 = [v52 bundleIdentifier];

          uint64_t v54 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          Swift::Int v56 = v55;

          type metadata accessor for CollectedSuppressionResult(0);
          Swift::Int v57 = v54;
          Swift::Int v58 = v56;
        }
        else
        {
          type metadata accessor for CollectedSuppressionResult(0);
          Swift::Int v57 = v49;
          Swift::Int v58 = v51;
        }
        sub_10001AE3C(&v69, v57, v58);
        swift_bridgeObjectRelease();
        long long v59 = *(void (**)(char *, uint64_t))(v68 + 8);
        v59(v62, v35);
        v59((char *)v37, v35);
        uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v59)(v40, v35);
      }
      break;
  }
  return result;
}

BOOL sub_10003553C(void *a1)
{
  uint64_t v3 = sub_100006ABC(&qword_10004D9A0);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v53 = (uint64_t)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v54 = type metadata accessor for CNDonationValue.Value(0);
  uint64_t v52 = *(void *)(v54 - 8);
  uint64_t v7 = __chkstk_darwin(v54, v6);
  uint64_t v50 = (uint64_t)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7, v9);
  uint64_t v49 = (uint64_t)&v48 - v10;
  uint64_t v11 = sub_100006ABC((uint64_t *)&unk_10004E060);
  __chkstk_darwin(v11 - 8, v12);
  Swift::Int v51 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for NameSuppressionStatus(0);
  __chkstk_darwin(v14, v15);
  uint64_t v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for CollectedSuppressionResult(0);
  uint64_t v19 = *(void *)(v1 + *(int *)(v18 + 20));
  id v20 = [a1 origin];
  id v21 = [v20 bundleIdentifier];

  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v24 = v23;

  LOBYTE(v19) = sub_100027488(v22, v24, v19);
  swift_bridgeObjectRelease();
  if (v19) {
    return 0;
  }
  id v26 = [a1 origin];
  id v27 = [v26 clusterIdentifier];

  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v30 = v29;

  if (!v28 && v30 == 0xE000000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v46 = sub_100027488(v28, v30, *(void *)(v1 + *(int *)(v18 + 24)));
    swift_bridgeObjectRelease();
    if (v46) {
      return 0;
    }
  }
  sub_1000378C8(v1, (uint64_t)v17, type metadata accessor for NameSuppressionStatus);
  BOOL v25 = 1;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_100035BF0((uint64_t)v17, type metadata accessor for NameSuppressionStatus);
      break;
    case 2u:
      return v25;
    case 3u:
      goto LABEL_9;
    default:
      sub_100035BF0((uint64_t)v17, type metadata accessor for NameSuppressionStatus);
LABEL_9:
      id v31 = (objc_class *)_s11ValueCasterCMa(0);
      id v32 = objc_allocWithZone(v31);
      uint64_t v33 = v52;
      uint64_t v34 = v54;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v52 + 56))((uint64_t)v32+ OBJC_IVAR____TtCE21contactsdonationagentCSo15CNDonationValueP33_0B54ECC677397DAC3B941865EB3B64B811ValueCaster_value, 1, 1, v54);
      v55.receiver = v32;
      v55.super_class = v31;
      id v35 = a1;
      int v36 = (char *)objc_msgSendSuper2(&v55, "init");
      [v35 acceptDonationValueVisitor:v36];

      uint64_t v37 = &v36[OBJC_IVAR____TtCE21contactsdonationagentCSo15CNDonationValueP33_0B54ECC677397DAC3B941865EB3B64B811ValueCaster_value];
      swift_beginAccess();
      uint64_t v38 = (uint64_t)v37;
      uint64_t v39 = v53;
      sub_10000C794(v38, v53);

      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v39, 1, v34) == 1)
      {
        __break(1u);
        JUMPOUT(0x100035AD4);
      }
      uint64_t v40 = v49;
      sub_10000C7FC(v39, v49);
      uint64_t v41 = v50;
      sub_10000C7FC(v40, v50);
      LODWORD(v40) = swift_getEnumCaseMultiPayload();
      uint64_t v42 = type metadata accessor for PersonNameComponents();
      uint64_t v43 = *(void *)(v42 - 8);
      uint64_t v44 = v43;
      uint64_t v45 = (uint64_t)v51;
      if (v40)
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v43 + 56))(v51, 1, 1, v42);
        sub_100035BF0(v41, type metadata accessor for CNDonationValue.Value);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v43 + 32))(v51, v41, v42);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v44 + 56))(v45, 0, 1, v42);
      }
      BOOL v25 = (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v44 + 48))(v45, 1, v42) == 1;
      sub_100009A44(v45, (uint64_t *)&unk_10004E060);
      break;
  }
  return v25;
}

NSString *sub_100035AE8()
{
  sub_100006ABC((uint64_t *)&unk_10004E1B0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100038F40;
  uint64_t v3 = v0;
  *(void *)(v0 + 32) = CNContactGivenNameKey;
  *(void *)(v0 + 40) = CNContactFamilyNameKey;
  specialized Array._endMutation()();
  qword_10004ED60 = v3;
  uint64_t v1 = CNContactGivenNameKey;

  return CNContactFamilyNameKey;
}

uint64_t sub_100035B7C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for SuppressionNameEquivalence()
{
  return self;
}

uint64_t type metadata accessor for NameSuppressionStatus(uint64_t a1)
{
  return sub_10000C75C(a1, qword_10004EB80);
}

uint64_t type metadata accessor for CollectedSuppressionResult(uint64_t a1)
{
  return sub_10000C75C(a1, qword_10004EC10);
}

uint64_t sub_100035BF0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100035C50(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v3 = 0;
  uint64_t v29 = result + 56;
  uint64_t v4 = 1 << *(unsigned char *)(result + 32);
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v30 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      int64_t v31 = v3;
      unint64_t v9 = v8 | (v3 << 6);
      goto LABEL_26;
    }
    int64_t v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v10 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v10);
    int64_t v12 = v3 + 1;
    if (!v11)
    {
      int64_t v12 = v3 + 2;
      if (v3 + 2 >= v30) {
        return 1;
      }
      unint64_t v11 = *(void *)(v29 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v3 + 3;
        if (v3 + 3 >= v30) {
          return 1;
        }
        unint64_t v11 = *(void *)(v29 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v3 + 4;
          if (v3 + 4 >= v30) {
            return 1;
          }
          unint64_t v11 = *(void *)(v29 + 8 * v12);
          if (!v11) {
            break;
          }
        }
      }
    }
LABEL_25:
    unint64_t v6 = (v11 - 1) & v11;
    int64_t v31 = v12;
    unint64_t v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_26:
    uint64_t v14 = result;
    uint64_t v15 = (uint64_t *)(*(void *)(result + 48) + 16 * v9);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    Swift::Int v18 = Hasher._finalize()();
    uint64_t v19 = -1 << *(unsigned char *)(a2 + 32);
    unint64_t v20 = v18 & ~v19;
    if (((*(void *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v20) & 1) == 0) {
      goto LABEL_41;
    }
    uint64_t v21 = *(void *)(a2 + 48);
    uint64_t v22 = (void *)(v21 + 16 * v20);
    BOOL v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v24 = ~v19;
      for (unint64_t i = v20 + 1; ; unint64_t i = v26 + 1)
      {
        uint64_t v26 = i & v24;
        if (((*(void *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0) {
          break;
        }
        id v27 = (void *)(v21 + 16 * v26);
        BOOL v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
          goto LABEL_7;
        }
      }
LABEL_41:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    uint64_t result = v14;
    int64_t v3 = v31;
  }
  uint64_t v13 = v3 + 5;
  if (v3 + 5 >= v30) {
    return 1;
  }
  unint64_t v11 = *(void *)(v29 + 8 * v13);
  if (v11)
  {
    int64_t v12 = v3 + 5;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v12 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v12 >= v30) {
      return 1;
    }
    unint64_t v11 = *(void *)(v29 + 8 * v12);
    ++v13;
    if (v11) {
      goto LABEL_25;
    }
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_100035EF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __chkstk_darwin(a1, a2);
  unint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v6, v9);
  int64_t v12 = (char *)&v17 - v11;
  char v14 = sub_1000374B8(v10, v13);
  sub_1000378C8(a1, (uint64_t)v12, type metadata accessor for CollectedSuppressionResult);
  sub_1000378C8(a2, (uint64_t)v8, type metadata accessor for CollectedSuppressionResult);
  if (v14) {
    char v15 = sub_100035C50(*(void *)&v12[*(int *)(a3 + 20)], *(void *)&v8[*(int *)(a3 + 20)]);
  }
  else {
    char v15 = 0;
  }
  sub_100035BF0((uint64_t)v12, type metadata accessor for CollectedSuppressionResult);
  sub_100035BF0((uint64_t)v8, type metadata accessor for CollectedSuppressionResult);
  return v15 & 1;
}

uint64_t sub_100036024(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PersonNameComponents();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = __chkstk_darwin(v4, v6);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7, v10);
  int64_t v12 = (char *)&v38 - v11;
  uint64_t countAndFlagsBits = PersonNameComponents.givenName.getter();
  if (v14)
  {
    Swift::String v15 = String.lowercased()();
    uint64_t countAndFlagsBits = v15._countAndFlagsBits;
    object = v15._object;
    swift_bridgeObjectRelease();
    PersonNameComponents.givenName.getter();
    if (!v17)
    {
      if (!v15._object) {
        goto LABEL_14;
      }
      goto LABEL_28;
    }
    uint64_t v39 = v12;
  }
  else
  {
    PersonNameComponents.givenName.getter();
    if (!v18)
    {
LABEL_14:
      unint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
      v20(v12, a1, v4);
      v20(v9, a2, v4);
      goto LABEL_15;
    }
    uint64_t v39 = v12;
    object = 0;
  }
  Swift::String v19 = String.lowercased()();
  swift_bridgeObjectRelease();
  if (!object)
  {
    int64_t v12 = v39;
    if (!v19._object) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
  if (!v19._object)
  {
    int64_t v12 = v39;
LABEL_28:
    swift_bridgeObjectRelease();
    int64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v30(v12, a1, v4);
    v30(v9, a2, v4);
    goto LABEL_29;
  }
  if (countAndFlagsBits == v19._countAndFlagsBits && object == v19._object)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    int64_t v12 = v39;
    goto LABEL_14;
  }
  char v33 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  int64_t v12 = v39;
  v34(v39, a1, v4);
  v34(v9, a2, v4);
  if ((v33 & 1) == 0)
  {
LABEL_29:
    int64_t v31 = *(void (**)(char *, uint64_t))(v5 + 8);
    v31(v9, v4);
    v31(v12, v4);
LABEL_36:
    char v29 = 0;
    return v29 & 1;
  }
LABEL_15:
  uint64_t v21 = PersonNameComponents.familyName.getter();
  if (v22)
  {
    Swift::String v23 = String.lowercased()();
    uint64_t v21 = v23._countAndFlagsBits;
    uint64_t v24 = v23._object;
    swift_bridgeObjectRelease();
    PersonNameComponents.familyName.getter();
    if (!v25)
    {
      if (!v23._object) {
        goto LABEL_34;
      }
      goto LABEL_30;
    }
  }
  else
  {
    PersonNameComponents.familyName.getter();
    uint64_t v24 = 0;
    if (!v26)
    {
LABEL_34:
      id v35 = *(void (**)(char *, uint64_t))(v5 + 8);
      v35(v9, v4);
      v35(v12, v4);
      if (!v24)
      {
        char v29 = 1;
        return v29 & 1;
      }
      swift_bridgeObjectRelease();
      goto LABEL_36;
    }
  }
  Swift::String v27 = String.lowercased()();
  swift_bridgeObjectRelease();
  if (!v24)
  {
    uint64_t v24 = v27._object;
    goto LABEL_34;
  }
  if (!v27._object)
  {
LABEL_30:
    id v32 = *(void (**)(char *, uint64_t))(v5 + 8);
    swift_bridgeObjectRetain();
    v32(v9, v4);
    v32(v12, v4);
    swift_bridgeObjectRelease_n();
    goto LABEL_36;
  }
  if (v21 == v27._countAndFlagsBits && v24 == v27._object) {
    char v29 = 1;
  }
  else {
    char v29 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  uint64_t v37 = *(void (**)(char *, uint64_t))(v5 + 8);
  v37(v9, v4);
  v37(v12, v4);
  swift_bridgeObjectRelease();
  return v29 & 1;
}

uint64_t *sub_10003644C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      uint64_t v7 = type metadata accessor for PersonNameComponents();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_10003659C(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result <= 1)
  {
    uint64_t v3 = type metadata accessor for PersonNameComponents();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *sub_100036618(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = type metadata accessor for PersonNameComponents();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_100036724(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100035BF0((uint64_t)a1, type metadata accessor for NameSuppressionStatus);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = type metadata accessor for PersonNameComponents();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void *sub_100036854(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    uint64_t v6 = type metadata accessor for PersonNameComponents();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_100036960(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100035BF0((uint64_t)a1, type metadata accessor for NameSuppressionStatus);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
    else
    {
      uint64_t v6 = type metadata accessor for PersonNameComponents();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_100036A90()
{
  uint64_t result = type metadata accessor for PersonNameComponents();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_100036B18(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for NameSuppressionStatus(0);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
    }
    else
    {
      uint64_t v8 = type metadata accessor for PersonNameComponents();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
    uint64_t v10 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(uint64_t *)((char *)a1 + v10) = *(uint64_t *)((char *)a2 + v10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100036CA0(uint64_t a1)
{
  type metadata accessor for NameSuppressionStatus(0);
  if (swift_getEnumCaseMultiPayload() <= 1)
  {
    uint64_t v2 = type metadata accessor for PersonNameComponents();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  }
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

char *sub_100036D3C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for NameSuppressionStatus(0);
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    uint64_t v7 = type metadata accessor for PersonNameComponents();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v8 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_100036E74(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100035BF0((uint64_t)a1, type metadata accessor for NameSuppressionStatus);
    uint64_t v6 = type metadata accessor for NameSuppressionStatus(0);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    else
    {
      uint64_t v7 = type metadata accessor for PersonNameComponents();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_100036FE8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for NameSuppressionStatus(0);
  if (swift_getEnumCaseMultiPayload() > 1)
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  else
  {
    uint64_t v7 = type metadata accessor for PersonNameComponents();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v8 = *(int *)(a3 + 24);
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  return a1;
}

char *sub_100037114(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100035BF0((uint64_t)a1, type metadata accessor for NameSuppressionStatus);
    uint64_t v6 = type metadata accessor for NameSuppressionStatus(0);
    if (swift_getEnumCaseMultiPayload() > 1)
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
    else
    {
      uint64_t v7 = type metadata accessor for PersonNameComponents();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_bridgeObjectRelease();
  *(void *)&a1[*(int *)(a3 + 24)] = *(void *)&a2[*(int *)(a3 + 24)];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100037278(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10003728C);
}

uint64_t sub_10003728C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for NameSuppressionStatus(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10003734C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100037360);
}

uint64_t sub_100037360(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for NameSuppressionStatus(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_10003741C()
{
  uint64_t result = type metadata accessor for NameSuppressionStatus(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000374B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PersonNameComponents();
  uint64_t v36 = *(void *)(v4 - 8);
  uint64_t v37 = v4;
  uint64_t v6 = __chkstk_darwin(v4, v5);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6, v9);
  uint64_t v11 = (char *)&v36 - v10;
  uint64_t v12 = type metadata accessor for NameSuppressionStatus(0);
  uint64_t v14 = __chkstk_darwin(v12, v13);
  uint64_t v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v17);
  Swift::String v19 = (char *)&v36 - v18;
  uint64_t v20 = sub_100006ABC(&qword_10004EC50);
  uint64_t v22 = __chkstk_darwin(v20 - 8, v21);
  uint64_t v24 = (char *)&v36 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = (uint64_t)&v24[*(int *)(v22 + 56)];
  sub_1000378C8(a1, (uint64_t)v24, type metadata accessor for NameSuppressionStatus);
  sub_1000378C8(a2, v25, type metadata accessor for NameSuppressionStatus);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_1000378C8((uint64_t)v24, (uint64_t)v16, type metadata accessor for NameSuppressionStatus);
      if (swift_getEnumCaseMultiPayload() != 1) {
        goto LABEL_6;
      }
      uint64_t v27 = v36;
      uint64_t v26 = v37;
      BOOL v28 = *(void (**)(char *, char *, uint64_t))(v36 + 32);
      v28(v11, v16, v37);
      v28(v8, (char *)v25, v26);
      char v29 = sub_100036024((uint64_t)v11, (uint64_t)v8);
      int64_t v30 = *(void (**)(char *, uint64_t))(v27 + 8);
      v30(v8, v26);
      v30(v11, v26);
      goto LABEL_12;
    case 2u:
      if (swift_getEnumCaseMultiPayload() == 2) {
        goto LABEL_8;
      }
      goto LABEL_10;
    case 3u:
      if (swift_getEnumCaseMultiPayload() != 3) {
        goto LABEL_10;
      }
LABEL_8:
      sub_100035BF0((uint64_t)v24, type metadata accessor for NameSuppressionStatus);
      char v29 = 1;
      break;
    default:
      sub_1000378C8((uint64_t)v24, (uint64_t)v19, type metadata accessor for NameSuppressionStatus);
      if (swift_getEnumCaseMultiPayload())
      {
        uint64_t v16 = v19;
LABEL_6:
        (*(void (**)(char *, uint64_t))(v36 + 8))(v16, v37);
LABEL_10:
        sub_100009A44((uint64_t)v24, &qword_10004EC50);
        char v29 = 0;
      }
      else
      {
        uint64_t v32 = v36;
        uint64_t v31 = v37;
        char v33 = *(void (**)(char *, char *, uint64_t))(v36 + 32);
        v33(v11, v19, v37);
        v33(v8, (char *)v25, v31);
        char v29 = sub_100036024((uint64_t)v11, (uint64_t)v8);
        uint64_t v34 = *(void (**)(char *, uint64_t))(v32 + 8);
        v34(v8, v31);
        v34(v11, v31);
LABEL_12:
        sub_100035BF0((uint64_t)v24, type metadata accessor for NameSuppressionStatus);
      }
      break;
  }
  return v29 & 1;
}

uint64_t sub_1000378C8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t static DateComponents._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t DateComponents.year.getter()
{
  return DateComponents.year.getter();
}

uint64_t type metadata accessor for DateComponents()
{
  return type metadata accessor for DateComponents();
}

uint64_t URLResourceValues.isExcludedFromBackup.setter()
{
  return URLResourceValues.isExcludedFromBackup.setter();
}

uint64_t URLResourceValues.init()()
{
  return URLResourceValues.init()();
}

uint64_t type metadata accessor for URLResourceValues()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t PersonNameComponents.givenName.getter()
{
  return PersonNameComponents.givenName.getter();
}

uint64_t PersonNameComponents.givenName.setter()
{
  return PersonNameComponents.givenName.setter();
}

uint64_t PersonNameComponents.familyName.getter()
{
  return PersonNameComponents.familyName.getter();
}

uint64_t PersonNameComponents.familyName.setter()
{
  return PersonNameComponents.familyName.setter();
}

uint64_t PersonNameComponents.middleName.getter()
{
  return PersonNameComponents.middleName.getter();
}

uint64_t PersonNameComponents.namePrefix.getter()
{
  return PersonNameComponents.namePrefix.getter();
}

uint64_t PersonNameComponents.nameSuffix.getter()
{
  return PersonNameComponents.nameSuffix.getter();
}

NSPersonNameComponents __swiftcall PersonNameComponents._bridgeToObjectiveC()()
{
  uint64_t v0 = (objc_class *)PersonNameComponents._bridgeToObjectiveC()();
  result._private = v1;
  result.super.Class isa = v0;
  return result;
}

uint64_t static PersonNameComponents.== infix(_:_:)()
{
  return static PersonNameComponents.== infix(_:_:)();
}

uint64_t static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static PersonNameComponents._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t PersonNameComponents.nickname.getter()
{
  return PersonNameComponents.nickname.getter();
}

uint64_t PersonNameComponents.init()()
{
  return PersonNameComponents.init()();
}

uint64_t type metadata accessor for PersonNameComponents()
{
  return type metadata accessor for PersonNameComponents();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.init(fileURLWithPath:isDirectory:)()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

uint64_t URL.setResourceValues(_:)()
{
  return URL.setResourceValues(_:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return URL.appendingPathComponent(_:isDirectory:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static Date.distantPast.getter()
{
  return static Date.distantPast.getter();
}

uint64_t static Date.distantFuture.getter()
{
  return static Date.distantFuture.getter();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.> infix(_:_:)()
{
  return static Date.> infix(_:_:)();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t static Date.+ infix(_:_:)()
{
  return static Date.+ infix(_:_:)();
}

uint64_t Date.init(timeIntervalSinceNow:)()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Date.compare(_:)()
{
  return Date.compare(_:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t static DuplicateContactsManager.performRefreshManagedDuplicates(with:)()
{
  return static DuplicateContactsManager.performRefreshManagedDuplicates(with:)();
}

uint64_t type metadata accessor for DuplicateContactsManager()
{
  return type metadata accessor for DuplicateContactsManager();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = String.lowercased()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

Swift::Bool __swiftcall String.hasSuffix(_:)(Swift::String a1)
{
  return String.hasSuffix(_:)(a1._countAndFlagsBits, a1._object);
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._forceBridgeFromObjectiveC(_:result:)()
{
  return static Array._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static Array._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Array._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)Bool._bridgeToObjectiveC()();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)Double._bridgeToObjectiveC()();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t static OS_dispatch_source.makeSignalSource(signal:queue:)()
{
  return static OS_dispatch_source.makeSignalSource(signal:queue:)();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

Swift::Void __swiftcall OS_dispatch_source.resume()()
{
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

{
}

{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_modifyAtWritableKeyPath()
{
  return _swift_modifyAtWritableKeyPath();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}