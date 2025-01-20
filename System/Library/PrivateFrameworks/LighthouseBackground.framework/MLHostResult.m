@interface MLHostResult
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC20LighthouseBackground12MLHostResult)init;
- (_TtC20LighthouseBackground12MLHostResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLHostResult

- (_TtC20LighthouseBackground12MLHostResult)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20LighthouseBackground12MLHostResult_status) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20LighthouseBackground12MLHostResult_policy) = (Class)1;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20LighthouseBackground12MLHostResult_error);
  void *v4 = 0;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(MLHostResult *)&v6 init];
}

- (NSString)description
{
  return (NSString *)sub_254512874(self, (uint64_t)a2, (void (*)(void))MLHostResult.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return byte_269DF4AD1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_269DF4AD1 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  MLHostResult.encode(with:)((NSCoder)v4);
}

- (_TtC20LighthouseBackground12MLHostResult)initWithCoder:(id)a3
{
  return (_TtC20LighthouseBackground12MLHostResult *)MLHostResult.init(coder:)(a3);
}

- (void).cxx_destruct
{
}

@end