@interface CNContactProviderSupportHost
- (_TtC8Contacts28CNContactProviderSupportHost)init;
- (id)extensionCount;
- (id)extensionItems;
- (id)isExtensionEnabledWith:(id)a3;
- (id)providerContainerFor:(id)a3;
- (void)addDomain:(CNContactProviderSupportDomain *)a3 bundleIdentifier:(NSString *)a4 completionHandler:(id)a5;
- (void)disableDomainFor:(NSString *)a3 bundleIdentifier:(NSString *)a4 completionHandler:(id)a5;
- (void)enableDomainFor:(NSString *)a3 bundleIdentifier:(NSString *)a4 showPrompt:(BOOL)a5 shouldSynchronize:(BOOL)a6 completionHandler:(id)a7;
- (void)invalidateExtensionFor:(NSString *)a3 bundleIdentifier:(NSString *)a4 completionHandler:(id)a5;
- (void)registeredDomainsFor:(NSString *)a3 completionHandler:(id)a4;
- (void)removeDomainFor:(NSString *)a3 bundleIdentifier:(NSString *)a4 completionHandler:(id)a5;
- (void)resetEnumerationFor:(NSString *)a3 bundleIdentifier:(NSString *)a4 completionHandler:(id)a5;
- (void)synchronizeUsing:(CNContactProviderSupportSession *)a3 bundleIdentifier:(NSString *)a4 completionHandler:(id)a5;
@end

@implementation CNContactProviderSupportHost

- (id)providerContainerFor:(id)a3
{
  uint64_t v4 = sub_190B77168();
  unint64_t v6 = v5;
  v7 = self;
  v8 = (void *)sub_190B30A18(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (void)synchronizeUsing:(CNContactProviderSupportSession *)a3 bundleIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A3E40);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_190B77448();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E92A5CE8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1E92A5CF0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_190B673B8((uint64_t)v11, (uint64_t)&unk_1E92A5CF8, (uint64_t)v16);
  swift_release();
}

- (void)invalidateExtensionFor:(NSString *)a3 bundleIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A3E40);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_190B77448();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E92A5CC8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1E92A5CD0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_190B673B8((uint64_t)v11, (uint64_t)&unk_1E92A5CD8, (uint64_t)v16);
  swift_release();
}

- (void)resetEnumerationFor:(NSString *)a3 bundleIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A3E40);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_190B77448();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E92A5CA8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1E92A5CB0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_190B673B8((uint64_t)v11, (uint64_t)&unk_1E92A5CB8, (uint64_t)v16);
  swift_release();
}

- (id)isExtensionEnabledWith:(id)a3
{
  uint64_t v4 = sub_190B77168();
  unint64_t v6 = v5;
  v7 = self;
  v8 = (void *)sub_190B36268(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (void)addDomain:(CNContactProviderSupportDomain *)a3 bundleIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A3E40);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_190B77448();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E92A5C88;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1E92A5C90;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_190B673B8((uint64_t)v11, (uint64_t)&unk_1E92A5C98, (uint64_t)v16);
  swift_release();
}

- (void)removeDomainFor:(NSString *)a3 bundleIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A3E40);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_190B77448();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E92A5C68;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1E92A5C70;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_190B673B8((uint64_t)v11, (uint64_t)&unk_1E92A5C78, (uint64_t)v16);
  swift_release();
}

- (void)registeredDomainsFor:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A3E40);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_190B77448();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E92A5C48;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E92A5C50;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_190B673B8((uint64_t)v9, (uint64_t)&unk_1E92A5C58, (uint64_t)v14);
  swift_release();
}

- (void)enableDomainFor:(NSString *)a3 bundleIdentifier:(NSString *)a4 showPrompt:(BOOL)a5 shouldSynchronize:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A3E40);
  MEMORY[0x1F4188790](v13 - 8);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  *(unsigned char *)(v17 + 32) = a5;
  *(unsigned char *)(v17 + 33) = a6;
  *(void *)(v17 + 40) = v16;
  *(void *)(v17 + 48) = self;
  uint64_t v18 = sub_190B77448();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1E92A5C28;
  v19[5] = v17;
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_1E92A5C30;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = self;
  sub_190B673B8((uint64_t)v15, (uint64_t)&unk_1E92A5C38, (uint64_t)v20);
  swift_release();
}

- (void)disableDomainFor:(NSString *)a3 bundleIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E92A3E40);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_190B77448();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1E92A5C18;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1E92A6170;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  v19 = self;
  sub_190B673B8((uint64_t)v11, (uint64_t)&unk_1E92A6180, (uint64_t)v16);
  swift_release();
}

- (id)extensionCount
{
  v2 = self;
  sub_190B3C098((uint64_t)v2);
  if (v3 >> 62) {
    sub_190B778A8();
  }
  swift_bridgeObjectRelease();
  sub_190B23474(0, &qword_1E92A3E48);
  uint64_t v4 = (void *)sub_190B775E8();

  return v4;
}

- (id)extensionItems
{
  v2 = self;
  sub_190B3C098((uint64_t)v2);

  sub_190B23474(0, (unint64_t *)&qword_1E92A5C08);
  unint64_t v3 = (void *)sub_190B772B8();
  swift_bridgeObjectRelease();

  return v3;
}

- (_TtC8Contacts28CNContactProviderSupportHost)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Contacts28CNContactProviderSupportHost____lazy_storage___contactStore) = 0;
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC8Contacts28CNContactProviderSupportHost_ContactProviderErrorDomain);
  void *v2 = 0xD000000000000024;
  v2[1] = 0x8000000190B9FDC0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CNContactProviderSupportHost();
  return [(CNContactProviderSupportHost *)&v4 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Contacts28CNContactProviderSupportHost____lazy_storage___contactStore));

  swift_bridgeObjectRelease();
}

@end