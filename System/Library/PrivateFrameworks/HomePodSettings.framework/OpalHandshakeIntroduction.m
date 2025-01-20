@interface OpalHandshakeIntroduction
+ (BOOL)supportsSecureCoding;
- (_TtC15HomePodSettings25OpalHandshakeIntroduction)init;
- (_TtC15HomePodSettings25OpalHandshakeIntroduction)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation OpalHandshakeIntroduction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC15HomePodSettings25OpalHandshakeIntroduction)initWithCoder:(id)a3
{
  return (_TtC15HomePodSettings25OpalHandshakeIntroduction *)sub_23D1DABE4(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  OpalHandshakeIntroduction.encode(with:)((NSCoder)v4);
}

- (_TtC15HomePodSettings25OpalHandshakeIntroduction)init
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
  OUTLINED_FUNCTION_14_1();
  swift_bridgeObjectRelease();
}

@end