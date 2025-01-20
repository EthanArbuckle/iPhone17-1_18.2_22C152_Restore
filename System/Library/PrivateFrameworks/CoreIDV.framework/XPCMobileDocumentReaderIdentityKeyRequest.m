@interface XPCMobileDocumentReaderIdentityKeyRequest
+ (BOOL)supportsSecureCoding;
- (_TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest)init;
- (_TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCMobileDocumentReaderIdentityKeyRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest)initWithCoder:(id)a3
{
  return (_TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest *)sub_21489C08C((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(void *))sub_21489F4C0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequestC6encode4withySo7NSCoderC_tF_0(v4);
}

- (_TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest)init
{
  result = (_TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end