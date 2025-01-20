@interface XPCMobileDocumentReaderDeviceEngagementType
+ (BOOL)supportsSecureCoding;
- (_TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType)init;
- (_TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCMobileDocumentReaderDeviceEngagementType

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType)initWithCoder:(id)a3
{
  return (_TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType *)sub_21489C58C((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(void *))sub_21489EF08);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s7CoreIDV43XPCMobileDocumentReaderDeviceEngagementTypeC6encode4withySo7NSCoderC_tF_0(v4);
}

- (_TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType)init
{
  result = (_TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end