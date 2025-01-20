@interface XPCWrapper
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC20FaceTimeMessageStore10XPCWrapper)init;
- (_TtC20FaceTimeMessageStore10XPCWrapper)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCWrapper

+ (BOOL)supportsSecureCoding
{
  return sub_24DE74378() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24DE743C8(v4);
}

- (_TtC20FaceTimeMessageStore10XPCWrapper)initWithCoder:(id)a3
{
  return (_TtC20FaceTimeMessageStore10XPCWrapper *)sub_24DE744DC(a3);
}

- (_TtC20FaceTimeMessageStore10XPCWrapper)init
{
}

- (void).cxx_destruct
{
}

@end