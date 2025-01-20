@interface ObjCRenameSequence
- (BOOL)isEmpty;
- (NSString)description;
- (ObjCRenameSequence)init;
- (void)addAddedByReplica:(id)a3 range:(_NSRange)a4;
- (void)addAddedByVersion:(id)a3;
- (void)addWithReplica:(id)a3 range:(_NSRange)a4;
@end

@implementation ObjCRenameSequence

- (BOOL)isEmpty
{
  v3 = (char *)self + OBJC_IVAR___ObjCRenameSequence_renameSequence;
  swift_beginAccess();
  if (*(void *)(*(void *)v3 + 16)) {
    return 0;
  }
  v5 = (char *)self + OBJC_IVAR___ObjCRenameSequence_renameAddedBySequence;
  swift_beginAccess();
  return *(void *)(*(void *)v5 + 16) == 0;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (ObjCRenameSequence)init
{
  v2 = (objc_class *)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCRenameSequence_renameSequence) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCRenameSequence_renameAddedBySequence) = v2;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ObjCRenameSequence();
  return [(ObjCRenameSequence *)&v4 init];
}

- (void)addAddedByVersion:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C3FA7E84((uint64_t)v4);
}

- (void)addWithReplica:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v8 = self;
  sub_1C447D014((uint64_t)v7, location, length);
}

- (void)addAddedByReplica:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v8 = self;
  sub_1C447D098((uint64_t)v7, location, length);
}

- (NSString)description
{
  v2 = self;
  sub_1C447D4BC();

  v3 = (void *)sub_1C4497188();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end