@interface DOCArchiveOperation
- (NSString)actionNameForUndoing;
- (_TtC33com_apple_DocumentManager_Service19DOCArchiveOperation)initWithItems:(id)a3 destinationFolder:(id)a4;
- (id)operationForRedoing;
- (id)operationForUndoing;
- (void)registerUndo;
@end

@implementation DOCArchiveOperation

- (NSString)actionNameForUndoing
{
  v2 = self;
  sub_10005F640();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_1004CD2B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  return (NSString *)v5;
}

- (id)operationForRedoing
{
  v2 = self;
  uint64_t v3 = sub_10005F934();

  return v3;
}

- (id)operationForUndoing
{
  v2 = self;
  uint64_t v3 = (void *)sub_10005FAB4();

  return v3;
}

- (void)registerUndo
{
}

- (_TtC33com_apple_DocumentManager_Service19DOCArchiveOperation)initWithItems:(id)a3 destinationFolder:(id)a4
{
  id v4 = a4;
  result = (_TtC33com_apple_DocumentManager_Service19DOCArchiveOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_10003B0A8(*(void *)&self->FPArchiveOperation_opaque[OBJC_IVAR____TtC33com_apple_DocumentManager_Service19DOCArchiveOperation_progressHandler]);
  uint64_t v3 = *(void **)&self->FPArchiveOperation_opaque[OBJC_IVAR____TtC33com_apple_DocumentManager_Service19DOCArchiveOperation_progressObservation];
}

@end