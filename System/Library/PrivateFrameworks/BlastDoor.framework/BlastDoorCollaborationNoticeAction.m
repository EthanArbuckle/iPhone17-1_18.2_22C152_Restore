@interface BlastDoorCollaborationNoticeAction
- (BlastDoorCollaborationNoticeAction)init;
- (NSArray)guidStrings;
- (NSString)description;
- (int64_t)type;
@end

@implementation BlastDoorCollaborationNoticeAction

- (NSString)description
{
  return (NSString *)sub_1B1796E64();
}

- (int64_t)type
{
  return *((unsigned __int8 *)&self->super.isa + OBJC_IVAR___BlastDoorCollaborationNoticeAction_collaborationNoticeAction)
       - 1;
}

- (NSArray)guidStrings
{
  return (NSArray *)sub_1B1794734();
}

- (BlastDoorCollaborationNoticeAction)init
{
  result = (BlastDoorCollaborationNoticeAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end