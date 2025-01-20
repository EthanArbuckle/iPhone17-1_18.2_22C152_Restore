@interface XPCMobileDocumentReaderRequest
+ (BOOL)supportsSecureCoding;
- (_TtC7CoreIDV30XPCMobileDocumentReaderRequest)init;
- (_TtC7CoreIDV30XPCMobileDocumentReaderRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCMobileDocumentReaderRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC7CoreIDV30XPCMobileDocumentReaderRequest)initWithCoder:(id)a3
{
  return (_TtC7CoreIDV30XPCMobileDocumentReaderRequest *)sub_21489C08C((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(void *))sub_21489EBC0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s7CoreIDV30XPCMobileDocumentReaderRequestC6encode4withySo7NSCoderC_tF_0(v4);
}

- (_TtC7CoreIDV30XPCMobileDocumentReaderRequest)init
{
  result = (_TtC7CoreIDV30XPCMobileDocumentReaderRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end