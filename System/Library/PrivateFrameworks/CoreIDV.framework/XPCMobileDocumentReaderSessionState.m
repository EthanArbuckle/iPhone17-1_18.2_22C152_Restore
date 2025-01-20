@interface XPCMobileDocumentReaderSessionState
+ (BOOL)supportsSecureCoding;
- (_TtC7CoreIDV35XPCMobileDocumentReaderSessionState)init;
- (_TtC7CoreIDV35XPCMobileDocumentReaderSessionState)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCMobileDocumentReaderSessionState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC7CoreIDV35XPCMobileDocumentReaderSessionState)initWithCoder:(id)a3
{
  return (_TtC7CoreIDV35XPCMobileDocumentReaderSessionState *)sub_21489C08C((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(void *))sub_21489E1C0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s7CoreIDV35XPCMobileDocumentReaderSessionStateC6encode4withySo7NSCoderC_tF_0(v4);
}

- (_TtC7CoreIDV35XPCMobileDocumentReaderSessionState)init
{
  result = (_TtC7CoreIDV35XPCMobileDocumentReaderSessionState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end