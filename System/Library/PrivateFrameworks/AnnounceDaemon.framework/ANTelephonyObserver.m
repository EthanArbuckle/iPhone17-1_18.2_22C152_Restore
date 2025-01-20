@interface ANTelephonyObserver
- (ANTelephonyObserver)init;
- (ANTelephonyObserver)initWithQueue:(id)a3;
- (ANTelephonyObserverDelegate)delegate;
- (BOOL)hasCalls;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation ANTelephonyObserver

- (BOOL)hasCalls
{
  v2 = self;
  unsigned __int8 v3 = sub_1DA6436D8();

  return v3 & 1;
}

- (ANTelephonyObserverDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___ANTelephonyObserver_delegate;
  swift_beginAccess();
  unsigned __int8 v3 = (void *)MEMORY[0x1E0172E50](v2);
  return (ANTelephonyObserverDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (ANTelephonyObserver)initWithQueue:(id)a3
{
  uint64_t v5 = sub_1DA64AC20();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  id v9 = a3;
  v10 = self;
  sub_1DA64AC10();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))((uint64_t)v10 + OBJC_IVAR___ANTelephonyObserver_logger, v8, v5);

  v11 = (objc_class *)type metadata accessor for TelephonyObserver();
  v14.receiver = v10;
  v14.super_class = v11;
  v12 = [(ANTelephonyObserver *)&v14 init];
  sub_1DA643BE0((uint64_t)a3);

  return v12;
}

- (void)dealloc
{
  unsigned __int8 v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  uint64_t v6 = *MEMORY[0x1E4F74B10];
  id v7 = objc_msgSend(self, sel_sharedAVSystemController);
  objc_msgSend(v5, sel_removeObserver_name_object_, v4, v6, v7);

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for TelephonyObserver();
  [(ANTelephonyObserver *)&v8 dealloc];
}

- (void).cxx_destruct
{
  unsigned __int8 v3 = (char *)self + OBJC_IVAR___ANTelephonyObserver_logger;
  uint64_t v4 = sub_1DA64AC20();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = (char *)self + OBJC_IVAR___ANTelephonyObserver_delegate;
  sub_1DA644CE0((uint64_t)v5);
}

- (ANTelephonyObserver)init
{
  result = (ANTelephonyObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end