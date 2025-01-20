@interface PersistenceEventSecureCoding
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC9BlastDoor28PersistenceEventSecureCoding)init;
- (_TtC9BlastDoor28PersistenceEventSecureCoding)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PersistenceEventSecureCoding

+ (BOOL)supportsSecureCoding
{
  return byte_1E9B82B43;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E9B82B43 = a3;
}

- (_TtC9BlastDoor28PersistenceEventSecureCoding)initWithCoder:(id)a3
{
  return (_TtC9BlastDoor28PersistenceEventSecureCoding *)sub_1B191321C(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B1913578(v4);
}

- (_TtC9BlastDoor28PersistenceEventSecureCoding)init
{
  result = (_TtC9BlastDoor28PersistenceEventSecureCoding *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end