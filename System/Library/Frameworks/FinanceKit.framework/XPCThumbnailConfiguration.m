@interface XPCThumbnailConfiguration
+ (BOOL)supportsSecureCoding;
- (XPCThumbnailConfiguration)init;
- (XPCThumbnailConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCThumbnailConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCThumbnailConfiguration)initWithCoder:(id)a3
{
  swift_getObjectType();
  v4 = (XPCThumbnailConfiguration *)sub_24337EE80(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s10FinanceKit22ThumbnailConfigurationV3XPCC6encode4withySo7NSCoderC_tF_0(v4);
}

- (XPCThumbnailConfiguration)init
{
  result = (XPCThumbnailConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end