@interface BlastDoorGroupID
- (BlastDoorGroupID)init;
- (NSString)description;
- (NSString)id;
@end

@implementation BlastDoorGroupID

- (NSString)description
{
  return (NSString *)sub_1B1784BD4();
}

- (NSString)id
{
  return (NSString *)sub_1B1798A20((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorGroupID_groupID);
}

- (BlastDoorGroupID)init
{
  result = (BlastDoorGroupID *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end