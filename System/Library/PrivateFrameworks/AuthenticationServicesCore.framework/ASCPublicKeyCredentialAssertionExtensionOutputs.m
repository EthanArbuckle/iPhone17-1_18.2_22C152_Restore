@interface ASCPublicKeyCredentialAssertionExtensionOutputs
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs)init;
- (_TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCPublicKeyCredentialAssertionExtensionOutputs

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2193D902C(v4);
}

- (_TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs)initWithCoder:(id)a3
{
  return (_TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs *)ASCPublicKeyCredentialAssertionExtensionOutputs.init(coder:)(a3);
}

- (_TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs)init
{
  v3 = (char *)self
     + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_largeBlob;
  *(void *)v3 = 0;
  *((void *)v3 + 1) = 0;
  v3[16] = -1;
  id v4 = (char *)self + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_prf;
  uint64_t v5 = type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs(0);
  return [(ASCPublicKeyCredentialAssertionExtensionOutputs *)&v7 init];
}

- (NSString)description
{
  v2 = self;
  sub_2193D9668();

  v3 = (void *)sub_2193E2830();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
}

@end