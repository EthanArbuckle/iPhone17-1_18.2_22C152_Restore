@interface CHSReplicatedDescriptorsBox
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (CHSReplicatedDescriptorsBox)init;
- (CHSReplicatedDescriptorsBox)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSReplicatedDescriptorsBox

+ (BOOL)supportsSecureCoding
{
  return byte_1EA8EE6D0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EA8EE6D0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  sub_1DA9E142C(0, &qword_1EBE4C6B0);
  id v5 = a3;
  v6 = self;
  v7 = (void *)sub_1DAD27B28();
  swift_bridgeObjectRetain();
  id v8 = (id)sub_1DAD278E8();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);
}

- (CHSReplicatedDescriptorsBox)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (CHSReplicatedDescriptorsBox *)sub_1DAA90F88();

  return v4;
}

- (CHSReplicatedDescriptorsBox)init
{
  result = (CHSReplicatedDescriptorsBox *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end