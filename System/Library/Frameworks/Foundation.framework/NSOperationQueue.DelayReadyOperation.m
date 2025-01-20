@interface NSOperationQueue.DelayReadyOperation
- (BOOL)isReady;
- (_TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation)init;
- (void)cancel;
- (void)main;
@end

@implementation NSOperationQueue.DelayReadyOperation

- (void)main
{
  v2 = self;
  NSOperationQueue.DelayReadyOperation.main()();
}

- (void)cancel
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation_action);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation_action);
  void *v4 = 0;
  v4[1] = 0;
  v6 = self;
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed URL, @guaranteed Error) -> (@unowned Bool))?(v5);
  v7 = *(Class *)((char *)&v6->super.super.isa
                + OBJC_IVAR____TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation_queue);
  *(Class *)((char *)&v6->super.super.isa
           + OBJC_IVAR____TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation_queue) = 0;

  *(Class *)((char *)&v6->super.super.isa
           + OBJC_IVAR____TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation_context) = 0;
  swift_release();
  v8.receiver = v6;
  v8.super_class = ObjectType;
  [(NSOperation *)&v8 cancel];
}

- (BOOL)isReady
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = v5.receiver;
  if ([(NSOperation *)&v5 isReady]) {
    char v3 = v2[OBJC_IVAR____TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation_readyFromAfter];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (_TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation)init
{
  result = (_TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed (@in_guaranteed URL, @guaranteed Error) -> (@unowned Bool))?(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation_action));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCE10FoundationCSo16NSOperationQueueP33_0ECEE0A75E2DD5EDFED9A6FEB26D5D3219DelayReadyOperation_queue));

  swift_release();
}

@end