@interface ASCPublicKeyCredentialRegistrationExtensionOutputs
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs)init;
- (_TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCPublicKeyCredentialRegistrationExtensionOutputs

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21937BF08(v4);
}

- (_TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs)initWithCoder:(id)a3
{
  return (_TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs *)ASCPublicKeyCredentialRegistrationExtensionOutputs.init(coder:)(a3);
}

- (NSString)description
{
  v2 = self;
  sub_21937C3F8();

  v3 = (void *)sub_2193E2830();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs)init
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs_largeBlob) = 2;
  v3 = (char *)self
     + OBJC_IVAR____TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs_prf;
  uint64_t v4 = type metadata accessor for ASCPublicKeyCredentialRegistrationExtensionOutputs.PRF(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ASCPublicKeyCredentialRegistrationExtensionOutputs(0);
  return [(ASCPublicKeyCredentialRegistrationExtensionOutputs *)&v6 init];
}

- (void).cxx_destruct
{
}

@end