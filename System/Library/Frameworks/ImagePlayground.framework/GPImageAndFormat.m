@interface GPImageAndFormat
+ (BOOL)supportsSecureCoding;
- (GPImageAndFormat)init;
- (GPImageAndFormat)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GPImageAndFormat

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ImageAndFormat.encode(with:)((NSCoder)v4);
}

- (GPImageAndFormat)initWithCoder:(id)a3
{
  return (GPImageAndFormat *)ImageAndFormat.init(coder:)(a3);
}

- (GPImageAndFormat)init
{
  result = (GPImageAndFormat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___GPImageAndFormat_data);
  unint64_t v4 = *(void *)&self->format[OBJC_IVAR___GPImageAndFormat_data];

  sub_243ECBC38(v3, v4);
}

@end