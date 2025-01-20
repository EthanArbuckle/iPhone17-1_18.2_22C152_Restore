@interface AMSPromiseSerialQueue
- (AMSPromiseSerialQueue)init;
- (id)runBinaryPromiseBlock:(id)a3;
- (id)runPromiseBlock:(id)a3;
- (void)dealloc;
@end

@implementation AMSPromiseSerialQueue

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR___AMSPromiseSerialQueue_actionContinuation;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB38A290);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (void)dealloc
{
  v2 = self;
  PromiseSerialQueue.__deallocating_deinit();
}

- (id)runBinaryPromiseBlock:(id)a3
{
  return sub_18D69D770(self, (int)a2, a3, (uint64_t)&unk_1EDC8C368, (uint64_t)sub_18D6A75A4, (uint64_t (*)(uint64_t, uint64_t))sub_18D69D810);
}

- (AMSPromiseSerialQueue)init
{
  return (AMSPromiseSerialQueue *)PromiseSerialQueue.init()();
}

- (id)runPromiseBlock:(id)a3
{
  return sub_18D69D770(self, (int)a2, a3, (uint64_t)&unk_1EDC8C340, (uint64_t)sub_18D7E0DEC, (uint64_t (*)(uint64_t, uint64_t))sub_18D7E07D0);
}

@end