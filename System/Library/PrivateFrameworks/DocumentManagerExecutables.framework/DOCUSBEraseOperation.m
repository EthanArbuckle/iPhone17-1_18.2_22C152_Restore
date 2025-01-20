@interface DOCUSBEraseOperation
- (NSString)description;
- (_TtC26DocumentManagerExecutables20DOCUSBEraseOperation)init;
- (int64_t)operationState;
- (void)setOperationState:(int64_t)a3;
@end

@implementation DOCUSBEraseOperation

- (int64_t)operationState
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC26DocumentManagerExecutables20DOCUSBEraseOperation_operationState);
  swift_beginAccess();
  return *v2;
}

- (void)setOperationState:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC26DocumentManagerExecutables20DOCUSBEraseOperation_operationState);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (NSString)description
{
  v2 = self;
  sub_22BE36304();

  v3 = (void *)sub_22BE92C98();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC26DocumentManagerExecutables20DOCUSBEraseOperation)init
{
  result = (_TtC26DocumentManagerExecutables20DOCUSBEraseOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables20DOCUSBEraseOperation_source));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables20DOCUSBEraseOperation_newFileSystem));
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC26DocumentManagerExecutables20DOCUSBEraseOperation_completionHandler);

  sub_22BDE0E58(v3);
}

@end