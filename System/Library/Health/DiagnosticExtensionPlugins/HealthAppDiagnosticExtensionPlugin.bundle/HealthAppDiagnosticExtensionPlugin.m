uint64_t type metadata accessor for HealthAppDiagnosticExtensionPlugin()
{
  return self;
}

uint64_t sub_2F0C()
{
  uint64_t v24 = sub_3740();
  uint64_t v0 = *(void *)(v24 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v2 = (uint64_t *)((char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v23 = sub_3770();
  uint64_t v3 = *(void *)(v23 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v20 - v7;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  sub_3428();
  uint64_t v10 = swift_allocObject();
  *(_DWORD *)(v10 + 32) = 0;
  os_unfair_lock_t v22 = (os_unfair_lock_t)(v10 + 32);
  *(void *)(v10 + 16) = 0;
  v21 = (uint64_t *)(v10 + 16);
  *(void *)(v10 + 24) = 0xE000000000000000;
  id v11 = [objc_allocWithZone((Class)sub_3730()) init];
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  *(void *)(v12 + 24) = v9;
  swift_retain();
  v13 = v9;
  id v25 = v11;
  sub_3720();
  swift_release();
  sub_3760();
  void *v2 = 10;
  uint64_t v14 = v24;
  (*(void (**)(void *, void, uint64_t))(v0 + 104))(v2, enum case for DispatchTimeInterval.seconds(_:), v24);
  sub_3780();
  (*(void (**)(void *, uint64_t))(v0 + 8))(v2, v14);
  v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  uint64_t v16 = v23;
  v15(v6, v23);
  sub_37E0();
  v15(v8, v16);
  if (sub_3750())
  {
    NSString v17 = sub_3790();
  }
  else
  {
    v18 = v22;
    os_unfair_lock_lock(v22);
    sub_3364(v21, &v27);
    os_unfair_lock_unlock(v18);
    NSString v17 = sub_3790();
    swift_bridgeObjectRelease();
  }
  [v26 appendString:v17];

  return swift_release();
}

Swift::Int sub_325C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    __chkstk_darwin();
    dispatch_semaphore_t v9 = (void *)(v8 + 16);
    uint64_t v10 = (os_unfair_lock_s *)(v8 + 32);
    swift_errorRetain();
    os_unfair_lock_lock(v10);
    sub_3544(v9);
    os_unfair_lock_unlock(v10);
    sub_35FC(a1, a2, 1);
  }
  else
  {
    __chkstk_darwin();
    v6 = v5 + 4;
    uint64_t v7 = v5 + 8;
    os_unfair_lock_lock(v5 + 8);
    sub_34FC(v6);
    os_unfair_lock_unlock(v7);
  }
  return sub_37F0();
}

uint64_t sub_3364@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  *a2 = v3;
  a2[1] = v2;
  return swift_bridgeObjectRetain();
}

id sub_33CC()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for HealthAppDaemonOrchestrationDiagnosticOperation()
{
  return self;
}

void sub_3428()
{
  if (!qword_8338)
  {
    type metadata accessor for os_unfair_lock_s(255);
    unint64_t v0 = sub_3810();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_8338);
    }
  }
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

uint64_t sub_34B0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

Swift::Int sub_34F0(uint64_t a1, uint64_t a2, char a3)
{
  return sub_325C(a1, a2, a3 & 1);
}

uint64_t sub_34FC(void *a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v3 = *(void *)(v1 + 24);
  swift_bridgeObjectRelease();
  *a1 = v4;
  a1[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_3544(void *a1)
{
  swift_bridgeObjectRelease();
  sub_3800(40);
  swift_bridgeObjectRelease();
  swift_errorRetain();
  sub_360C();
  v3._countAndFlagsBits = sub_37A0();
  sub_37B0(v3);
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 0xD000000000000026;
  a1[1] = 0x8000000000003C00;
  return result;
}

uint64_t sub_35FC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return _swift_errorRelease();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_360C()
{
  unint64_t result = qword_8340;
  if (!qword_8340)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_8340);
  }
  return result;
}

void sub_3664(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unint64_t sub_36B0()
{
  unint64_t result = qword_8350;
  if (!qword_8350)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_8350);
  }
  return result;
}

void sub_36F0(NSURL *retstr@<X8>)
{
}

uint64_t sub_3700()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_3710()
{
  return type metadata accessor for URL();
}

uint64_t sub_3720()
{
  return dispatch thunk of HealthAppOrchestrationClient.fetchOrchestrationStatus(completion:)();
}

uint64_t sub_3730()
{
  return type metadata accessor for HealthAppOrchestrationClient();
}

uint64_t sub_3740()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_3750()
{
  return static DispatchTimeoutResult.== infix(_:_:)();
}

uint64_t sub_3760()
{
  return static DispatchTime.now()();
}

uint64_t sub_3770()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_3780()
{
  return + infix(_:_:)();
}

NSString sub_3790()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_37A0()
{
  return String.init<A>(describing:)();
}

void sub_37B0(Swift::String a1)
{
}

NSArray sub_37C0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_37D0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_37E0()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int sub_37F0()
{
  return OS_dispatch_semaphore.signal()();
}

void sub_3800(Swift::Int a1)
{
}

uint64_t sub_3810()
{
  return type metadata accessor for ManagedBuffer();
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return _swift_getExistentialTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}