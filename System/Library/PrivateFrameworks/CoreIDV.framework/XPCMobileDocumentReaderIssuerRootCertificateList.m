@interface XPCMobileDocumentReaderIssuerRootCertificateList
+ (BOOL)supportsSecureCoding;
- (_TtC7CoreIDV48XPCMobileDocumentReaderIssuerRootCertificateList)init;
- (_TtC7CoreIDV48XPCMobileDocumentReaderIssuerRootCertificateList)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCMobileDocumentReaderIssuerRootCertificateList

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC7CoreIDV48XPCMobileDocumentReaderIssuerRootCertificateList)initWithCoder:(id)a3
{
  return (_TtC7CoreIDV48XPCMobileDocumentReaderIssuerRootCertificateList *)sub_21489D070((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_2148A07CC, (uint64_t)&type metadata for MobileDocumentReaderIssuerRootCertificateList, (uint64_t (*)(uint64_t))type metadata accessor for XPCMobileDocumentReaderIssuerRootCertificateList, &OBJC_IVAR____TtC7CoreIDV48XPCMobileDocumentReaderIssuerRootCertificateList_value);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21489B4C4(v4, (uint64_t)&OBJC_IVAR____TtC7CoreIDV48XPCMobileDocumentReaderIssuerRootCertificateList_value, (void (*)(void))sub_2148A0824);
}

- (_TtC7CoreIDV48XPCMobileDocumentReaderIssuerRootCertificateList)init
{
  result = (_TtC7CoreIDV48XPCMobileDocumentReaderIssuerRootCertificateList *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end