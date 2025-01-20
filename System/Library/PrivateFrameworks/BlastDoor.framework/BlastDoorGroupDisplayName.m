@interface BlastDoorGroupDisplayName
- (BlastDoorGroupDisplayName)init;
- (NSString)description;
- (NSString)displayName;
@end

@implementation BlastDoorGroupDisplayName

- (NSString)description
{
  return (NSString *)sub_1B1784BD4();
}

- (NSString)displayName
{
  return (NSString *)sub_1B1798A20((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorGroupDisplayName_groupDisplayName);
}

- (BlastDoorGroupDisplayName)init
{
  result = (BlastDoorGroupDisplayName *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end