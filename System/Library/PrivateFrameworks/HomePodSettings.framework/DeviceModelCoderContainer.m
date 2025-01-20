@interface DeviceModelCoderContainer
+ (BOOL)supportsSecureCoding;
- (DeviceModelCoderContainer)init;
- (DeviceModelCoderContainer)initWithCoder:(id)a3;
- (NSString)groupID;
- (NSString)groupName;
- (NSString)model;
- (NSString)name;
- (NSString)pairID;
- (NSString)pairName;
- (NSString)roomID;
- (NSString)roomName;
- (void)encodeWithCoder:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setPairID:(id)a3;
- (void)setPairName:(id)a3;
- (void)setRoomID:(id)a3;
- (void)setRoomName:(id)a3;
@end

@implementation DeviceModelCoderContainer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)groupID
{
  return (NSString *)sub_23D16E7B0((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_23D16E768);
}

- (void)setGroupID:(id)a3
{
}

- (NSString)groupName
{
  return (NSString *)sub_23D16E7B0((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_23D16E80C);
}

- (void)setGroupName:(id)a3
{
}

- (NSString)model
{
  return (NSString *)sub_23D16E7B0((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_23D16E8DC);
}

- (void)setModel:(id)a3
{
}

- (NSString)name
{
  return (NSString *)sub_23D16E7B0((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_23D16E924);
}

- (void)setName:(id)a3
{
}

- (NSString)pairID
{
  return (NSString *)sub_23D16E7B0((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_23D16E96C);
}

- (void)setPairID:(id)a3
{
}

- (NSString)pairName
{
  return (NSString *)sub_23D16E7B0((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_23D16E9B4);
}

- (void)setPairName:(id)a3
{
}

- (NSString)roomID
{
  return (NSString *)sub_23D16E7B0((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_23D16E9FC);
}

- (void)setRoomID:(id)a3
{
}

- (NSString)roomName
{
  return (NSString *)sub_23D16E7B0((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_23D16EA44);
}

- (void)setRoomName:(id)a3
{
}

- (DeviceModelCoderContainer)init
{
  return (DeviceModelCoderContainer *)sub_23D16EAC4();
}

- (DeviceModelCoderContainer)initWithCoder:(id)a3
{
  return (DeviceModelCoderContainer *)sub_23D16EB88(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23D16ED98(v4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_14_1();
  swift_bridgeObjectRelease();
}

@end