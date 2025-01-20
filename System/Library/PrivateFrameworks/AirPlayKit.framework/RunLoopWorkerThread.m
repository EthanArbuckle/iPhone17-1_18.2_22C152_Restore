@interface RunLoopWorkerThread
- (_TtC10AirPlayKit19RunLoopWorkerThread)init;
- (void)dealloc;
- (void)main;
@end

@implementation RunLoopWorkerThread

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = qword_2689BD438;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_2390D8808();
  __swift_project_value_buffer(v6, (uint64_t)qword_2689C6788);
  sub_2390449CC(0xD00000000000005BLL, 0x80000002390E00A0, 0x74696E696564, 0xE600000000000000);
  [(RunLoopWorkerThread *)v5 cancel];
  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(RunLoopWorkerThread *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)main
{
  v3 = self;
  v2 = (void *)MEMORY[0x23EC9BA10]();
  sub_2390ACDFC(v3, (char *)v3);
}

- (_TtC10AirPlayKit19RunLoopWorkerThread)init
{
  return (_TtC10AirPlayKit19RunLoopWorkerThread *)sub_2390AD974();
}

@end