@interface ASCPublicKeyCredentialAssertionExtensionInputs
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAtLeastOneExtension;
- (_TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs)init;
- (_TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs)initWithCoder:(id)a3;
- (id)cborForHybrid;
- (id)cborForWebKit;
- (int64_t)caBLEAuthenticatorMinimumRequirement;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCPublicKeyCredentialAssertionExtensionInputs

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_219374AA4(v4);
}

- (_TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs)initWithCoder:(id)a3
{
  return (_TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs *)ASCPublicKeyCredentialAssertionExtensionInputs.init(coder:)(a3);
}

- (_TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs)init
{
  *(_OWORD *)((char *)&self->super.isa
            + OBJC_IVAR____TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs_largeBlob) = xmmword_2193E7E50;
  v2 = (char *)self + OBJC_IVAR____TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs_prf;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((void *)v2 + 4) = 1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ASCPublicKeyCredentialAssertionExtensionInputs();
  return [(ASCPublicKeyCredentialAssertionExtensionInputs *)&v4 init];
}

- (BOOL)hasAtLeastOneExtension
{
  v3 = (char *)self
     + OBJC_IVAR____TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs_largeBlob;
  swift_beginAccess();
  if (*((void *)v3 + 1) >> 60 != 11) {
    return 1;
  }
  objc_super v4 = (char *)self + OBJC_IVAR____TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs_prf;
  swift_beginAccess();
  return *((void *)v4 + 4) != 1;
}

- (int64_t)caBLEAuthenticatorMinimumRequirement
{
  v3 = (char *)self
     + OBJC_IVAR____TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs_largeBlob;
  swift_beginAccess();
  int64_t v4 = *((void *)v3 + 1) >> 60 != 11;
  v5 = (char *)self + OBJC_IVAR____TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs_prf;
  swift_beginAccess();
  if (*((void *)v5 + 4) == 1) {
    return v4;
  }
  else {
    return 2;
  }
}

- (id)cborForWebKit
{
  return sub_219376170(self, (uint64_t)a2, sub_21937564C);
}

- (id)cborForHybrid
{
  return sub_219376170(self, (uint64_t)a2, sub_219375A60);
}

- (void).cxx_destruct
{
}

@end