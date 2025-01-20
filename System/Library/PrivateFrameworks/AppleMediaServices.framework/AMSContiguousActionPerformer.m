@interface AMSContiguousActionPerformer
- (AMSContiguousActionPerformer)init;
- (AMSContiguousActionPerformer)initWithQueue:(id)a3;
- (unint64_t)performInitialContiguousActionWithBlock:(id)a3;
- (void)async:(id)a3;
- (void)continueContiguousActionWithIdentifier:(unint64_t)a3 withBlock:(id)a4;
- (void)dealloc;
- (void)finishContiguousActionWithIdentifier:(unint64_t)a3;
- (void)sync:(id)a3;
@end

@implementation AMSContiguousActionPerformer

- (void).cxx_destruct
{
  swift_release();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMSContiguousActionPerformer_suspendableQueue);
}

- (void)dealloc
{
  v2 = self;
  ContiguousActionPerformer.__deallocating_deinit();
}

- (void)continueContiguousActionWithIdentifier:(unint64_t)a3 withBlock:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = self;
  ContiguousActionPerformer.continueContiguousAction(withIdentifier:work:)(a3, (uint64_t)sub_18D6D82E8, v7);

  swift_release();
}

- (unint64_t)performInitialContiguousActionWithBlock:(id)a3
{
  v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  v5 = self;
  unint64_t v6 = ContiguousActionPerformer.performInitialContiguousAction(_:)();

  swift_release();
  return v6;
}

- (void)finishContiguousActionWithIdentifier:(unint64_t)a3
{
  v4 = self;
  ContiguousActionPerformer.finishContiguousAction(identifier:)(a3);
}

- (void)async:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  unint64_t v6 = self;
  ContiguousActionPerformer.async(_:)((uint64_t)sub_18D6DA260, v5);

  swift_release();
}

- (AMSContiguousActionPerformer)initWithQueue:(id)a3
{
  return (AMSContiguousActionPerformer *)ContiguousActionPerformer.init(queue:)(a3);
}

- (void)sync:(id)a3
{
  v4 = _Block_copy(a3);
  v6[2] = v4;
  uint64_t v5 = self;
  ContiguousActionPerformer.sync(_:)((uint64_t)sub_18D6DA260, (uint64_t)v6);
  _Block_release(v4);
}

- (AMSContiguousActionPerformer)init
{
}

@end