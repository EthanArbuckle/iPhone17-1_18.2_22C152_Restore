@interface SwiftUIEnvironmentWrapper
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (SwiftUIEnvironmentWrapper)init;
- (SwiftUIEnvironmentWrapper)initWithCoder:(id)a3;
@end

@implementation SwiftUIEnvironmentWrapper

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = EnvironmentWrapper.isEqual(_:)((uint64_t)v8);

  _sypSgWOhTm_13((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for Any?);
  return v6 & 1;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_release();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SwiftUIEnvironmentWrapper)initWithCoder:(id)a3
{
  return 0;
}

- (SwiftUIEnvironmentWrapper)init
{
  result = (SwiftUIEnvironmentWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end