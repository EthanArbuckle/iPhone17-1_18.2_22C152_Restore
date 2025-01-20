@interface PreviewLayer
- (uint64_t)sendAccessibilityNotifications;
- (void)cleanup;
@end

@implementation PreviewLayer

- (void)cleanup
{
  swift_retain();
  sub_1003021CC();

  swift_release();
}

- (uint64_t)sendAccessibilityNotifications
{
  uint64_t v22 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v25 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  v1 = (char *)&v21 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for DispatchQoS();
  uint64_t v23 = *(void *)(v2 - 8);
  uint64_t v24 = v2;
  __chkstk_darwin(v2);
  v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchTime();
  uint64_t v21 = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - v10;
  uint64_t v12 = type metadata accessor for AccessibilityNotification.ScreenChanged();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long aBlock = 0u;
  long long v28 = 0u;
  AccessibilityNotification.ScreenChanged.init(_:)();
  _AccessibilityNotifications.post()();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  sub_10000F734(0, (unint64_t *)&qword_10051A950);
  v16 = (void *)static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  + infix(_:_:)();
  v17 = *(void (**)(char *, uint64_t))(v6 + 8);
  v17(v8, v5);
  v29 = sub_100302588;
  uint64_t v30 = 0;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v28 = sub_1002EDB98;
  *((void *)&v28 + 1) = &unk_1004F3FB8;
  v18 = _Block_copy(&aBlock);
  static DispatchQoS.unspecified.getter();
  v26 = _swiftEmptyArrayStorage;
  sub_100308538((unint64_t *)&qword_10051FB30, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000F214(&qword_10051A960);
  sub_10010DE10((unint64_t *)&qword_10051FB40, &qword_10051A960);
  uint64_t v19 = v22;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v1, v19);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v4, v24);
  return ((uint64_t (*)(char *, uint64_t))v17)(v11, v21);
}

@end