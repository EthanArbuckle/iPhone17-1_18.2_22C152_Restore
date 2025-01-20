@interface SecureAssetsPreinstalledBundle
- (SecureAssetsPreinstalledBundle)init;
- (id)assetVersion:(id)a3;
- (id)init:(id)a3;
- (id)resourcePathURL:(id)a3;
@end

@implementation SecureAssetsPreinstalledBundle

- (id)init:(id)a3
{
  id v4 = a3;
  return SecureAssetsPreinstalledBundle.init(_:)(a3);
}

- (id)resourcePathURL:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2697EDC40);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24C78B800();
  uint64_t v9 = v8;
  v10 = self;
  SecureAssetsPreinstalledBundle.resourcePathURLForLocale(locale:)(v7, v9, (uint64_t)v6);

  swift_bridgeObjectRelease();
  uint64_t v11 = sub_24C78B6A0();
  uint64_t v12 = *(void *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) != 1)
  {
    v13 = (void *)sub_24C78B640();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v11);
  }
  return v13;
}

- (id)assetVersion:(id)a3
{
  uint64_t v4 = sub_24C78B800();
  v6 = v5;
  uint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  object = SecureAssetsPreinstalledBundle.assetVersionForLocale(locale:)(v8).value._object;

  swift_bridgeObjectRelease();
  if (object)
  {
    v10 = (void *)sub_24C78B7F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (SecureAssetsPreinstalledBundle)init
{
  result = (SecureAssetsPreinstalledBundle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end