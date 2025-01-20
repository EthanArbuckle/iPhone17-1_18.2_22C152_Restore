@interface VAModelManagerMonitor
- (VAModelManagerMonitor)init;
- (void)register_for_inference_monitor_eventsWithHash:(unint64_t)a3 eventCallback:(id)a4 completionHandler:;
- (void)unregister_from_inference_monitorWithObserver:(unint64_t)a3 completionHandler:(id)a4;
@end

@implementation VAModelManagerMonitor

- (void)register_for_inference_monitor_eventsWithHash:(unint64_t)a3 eventCallback:(id)a4 completionHandler:
{
  v5 = v4;
  uint64_t v9 = sub_5B5B4(&qword_648828);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  v13 = _Block_copy(v5);
  v14 = (void *)swift_allocObject();
  v14[2] = a3;
  v14[3] = v12;
  v14[4] = v13;
  v14[5] = self;
  uint64_t v15 = sub_48EF00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v11, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_648940;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_648948;
  v17[5] = v16;
  swift_retain();
  sub_5A95C((uint64_t)v11, (uint64_t)&unk_648950, (uint64_t)v17);
  swift_release();
}

- (void)unregister_from_inference_monitorWithObserver:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_5B5B4(&qword_648828);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_48EF00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_648920;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_648928;
  v14[5] = v13;
  swift_retain();
  sub_5A95C((uint64_t)v9, (uint64_t)&unk_648930, (uint64_t)v14);
  swift_release();
}

- (VAModelManagerMonitor)init
{
  return (VAModelManagerMonitor *)sub_594D0();
}

@end