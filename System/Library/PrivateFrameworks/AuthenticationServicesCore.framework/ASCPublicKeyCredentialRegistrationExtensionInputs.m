@interface ASCPublicKeyCredentialRegistrationExtensionInputs
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAtLeastOneExtension;
- (_TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs)init;
- (_TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs)initWithCoder:(id)a3;
- (id)cborForHybrid;
- (id)cborForWebKit;
- (id)copyWithZone:(void *)a3;
- (int64_t)caBLEAuthenticatorMinimumRequirement;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCPublicKeyCredentialRegistrationExtensionInputs

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_219348914(v4);
}

- (_TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs)initWithCoder:(id)a3
{
  return (_TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs *)ASCPublicKeyCredentialRegistrationExtensionInputs.init(coder:)(a3);
}

- (_TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs)init
{
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs_largeBlob) = 2;
  v2 = (char *)self
     + OBJC_IVAR____TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs_prf;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((void *)v2 + 4) = 0;
  *((void *)v2 + 5) = 1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ASCPublicKeyCredentialRegistrationExtensionInputs();
  return [(ASCPublicKeyCredentialRegistrationExtensionInputs *)&v4 init];
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  sub_2193492D0(v6);

  __swift_project_boxed_opaque_existential_1Tm(v6, v6[3]);
  objc_super v4 = (void *)sub_2193E3120();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
  return v4;
}

- (BOOL)hasAtLeastOneExtension
{
  v3 = (char *)self
     + OBJC_IVAR____TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs_largeBlob;
  swift_beginAccess();
  if (*v3 != 2) {
    return 1;
  }
  objc_super v4 = (char *)self
     + OBJC_IVAR____TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs_prf;
  swift_beginAccess();
  return *((void *)v4 + 5) != 1;
}

- (int64_t)caBLEAuthenticatorMinimumRequirement
{
  v3 = (unsigned __int8 *)self
     + OBJC_IVAR____TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs_largeBlob;
  swift_beginAccess();
  int64_t v4 = *v3 != 2;
  v5 = (char *)self
     + OBJC_IVAR____TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs_prf;
  swift_beginAccess();
  if (*((void *)v5 + 5) == 1) {
    return v4;
  }
  else {
    return 2;
  }
}

- (id)cborForWebKit
{
  return sub_21934A0E4(self, (uint64_t)a2, sub_2193496D8);
}

- (id)cborForHybrid
{
  return sub_21934A0E4(self, (uint64_t)a2, (uint64_t (*)(void))sub_219349AEC);
}

- (void).cxx_destruct
{
}

@end