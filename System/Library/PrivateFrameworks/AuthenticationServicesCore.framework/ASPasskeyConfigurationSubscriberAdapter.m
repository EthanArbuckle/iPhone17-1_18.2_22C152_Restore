@interface ASPasskeyConfigurationSubscriberAdapter
- (BOOL)applyConfiguration:(id)a3 scope:(int64_t)a4 returningReasons:(id *)a5 error:(id *)a6;
- (BOOL)removeDeclarationKey:(id)a3 scope:(int64_t)a4 error:(id *)a5;
- (_TtC26AuthenticationServicesCore39ASPasskeyConfigurationSubscriberAdapter)init;
- (id)allDeclarationKeys;
- (id)configurationClasses;
- (id)declarationKeyForConfiguration:(id)a3;
@end

@implementation ASPasskeyConfigurationSubscriberAdapter

- (_TtC26AuthenticationServicesCore39ASPasskeyConfigurationSubscriberAdapter)init
{
  return (_TtC26AuthenticationServicesCore39ASPasskeyConfigurationSubscriberAdapter *)sub_2193B6F5C();
}

- (id)configurationClasses
{
  v2 = self;
  v3 = (NSString *)sub_2193E2830();
  Class v4 = NSClassFromString(v3);

  if (v4)
  {
    uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
    __swift_instantiateConcreteTypeFromMangledName(&qword_26AC27798);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_2193E7190;
    *(void *)(v6 + 32) = ObjCClassMetadata;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_26AC27790);
  v7 = (void *)sub_2193E2A00();
  swift_bridgeObjectRelease();

  return v7;
}

- (id)allDeclarationKeys
{
  v2 = self;
  sub_2193B72F8();

  sub_2193607AC(0, (unint64_t *)&unk_26AC27780);
  sub_2193B6E88();
  v3 = (void *)sub_2193E2A90();
  swift_bridgeObjectRelease();

  return v3;
}

- (BOOL)applyConfiguration:(id)a3 scope:(int64_t)a4 returningReasons:(id *)a5 error:(id *)a6
{
  id v8 = a3;
  v9 = self;
  sub_2193B82D4(v8, a4);

  return 1;
}

- (BOOL)removeDeclarationKey:(id)a3 scope:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = self;
  sub_2193B7784(v7, a4);

  return 1;
}

- (id)declarationKeyForConfiguration:(id)a3
{
  v5 = self;
  id v6 = a3;
  id v7 = self;
  id v8 = (void *)sub_2193E2830();
  id v9 = objc_msgSend(v5, sel_newDeclarationKeyWithSubscriberIdentifier_reference_, v8, v6);

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26AuthenticationServicesCore39ASPasskeyConfigurationSubscriberAdapter_currentConfiguration));
}

@end