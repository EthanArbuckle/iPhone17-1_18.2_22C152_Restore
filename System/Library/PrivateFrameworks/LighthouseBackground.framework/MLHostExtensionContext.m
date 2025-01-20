@interface MLHostExtensionContext
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC20LighthouseBackground22MLHostExtensionContext)init;
- (_TtC20LighthouseBackground22MLHostExtensionContext)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLHostExtensionContext

- (NSString)description
{
  return (NSString *)sub_254512874(self, (uint64_t)a2, (void (*)(void))MLHostExtensionContext.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return byte_269DF4AD0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_269DF4AD0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  MLHostExtensionContext.encode(with:)((NSCoder)v4);
}

- (_TtC20LighthouseBackground22MLHostExtensionContext)initWithCoder:(id)a3
{
  return (_TtC20LighthouseBackground22MLHostExtensionContext *)MLHostExtensionContext.init(coder:)(a3);
}

- (_TtC20LighthouseBackground22MLHostExtensionContext)init
{
  result = (_TtC20LighthouseBackground22MLHostExtensionContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end