@interface HPSBetaEnrollmentIdentifyResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HPSBetaEnrollmentIdentifyResponse)init;
- (HPSBetaEnrollmentIdentifyResponse)initWithCoder:(id)a3;
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

@implementation HPSBetaEnrollmentIdentifyResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)groupID
{
  return (NSString *)sub_23D173244((uint64_t)self, (uint64_t)a2, (void (*)(void))BetaEnrollment.IdentifyResponse.groupID.getter);
}

- (void)setGroupID:(id)a3
{
}

- (NSString)groupName
{
  return (NSString *)sub_23D173244((uint64_t)self, (uint64_t)a2, (void (*)(void))BetaEnrollment.IdentifyResponse.groupName.getter);
}

- (void)setGroupName:(id)a3
{
}

- (NSString)model
{
  return (NSString *)sub_23D173244((uint64_t)self, (uint64_t)a2, (void (*)(void))BetaEnrollment.IdentifyResponse.model.getter);
}

- (void)setModel:(id)a3
{
}

- (NSString)name
{
  return (NSString *)sub_23D173244((uint64_t)self, (uint64_t)a2, (void (*)(void))BetaEnrollment.IdentifyResponse.name.getter);
}

- (void)setName:(id)a3
{
}

- (NSString)pairID
{
  return (NSString *)sub_23D173244((uint64_t)self, (uint64_t)a2, (void (*)(void))BetaEnrollment.IdentifyResponse.pairID.getter);
}

- (void)setPairID:(id)a3
{
}

- (NSString)pairName
{
  return (NSString *)sub_23D173244((uint64_t)self, (uint64_t)a2, (void (*)(void))BetaEnrollment.IdentifyResponse.pairName.getter);
}

- (void)setPairName:(id)a3
{
}

- (NSString)roomID
{
  return (NSString *)sub_23D173244((uint64_t)self, (uint64_t)a2, (void (*)(void))BetaEnrollment.IdentifyResponse.roomID.getter);
}

- (void)setRoomID:(id)a3
{
}

- (NSString)roomName
{
  return (NSString *)sub_23D173244((uint64_t)self, (uint64_t)a2, (void (*)(void))BetaEnrollment.IdentifyResponse.roomName.getter);
}

- (void)setRoomName:(id)a3
{
}

- (HPSBetaEnrollmentIdentifyResponse)initWithCoder:(id)a3
{
  return (HPSBetaEnrollmentIdentifyResponse *)sub_23D173C18(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  BetaEnrollment.IdentifyResponse.encode(with:)((NSCoder)v4);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_23D2458B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = BetaEnrollment.IdentifyResponse.isEqual(_:)((uint64_t)v8);

  sub_23D16FA88((uint64_t)v8);
  return v6;
}

- (HPSBetaEnrollmentIdentifyResponse)init
{
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