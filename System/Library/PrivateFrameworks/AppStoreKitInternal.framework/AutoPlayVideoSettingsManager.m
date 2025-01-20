@interface AutoPlayVideoSettingsManager
- (BOOL)isAutoPlayAllowed;
- (BOOL)isVideoAudioEnabled;
- (_TtC19AppStoreKitInternal28AutoPlayVideoSettingsManager)init;
- (void)dealloc;
- (void)restoreFullScreenAudioSettings;
- (void)saveFullScreenAudioSettings;
- (void)updateAutoPlayVideoSettings;
@end

@implementation AutoPlayVideoSettingsManager

- (_TtC19AppStoreKitInternal28AutoPlayVideoSettingsManager)init
{
  return (_TtC19AppStoreKitInternal28AutoPlayVideoSettingsManager *)sub_1E165CED0();
}

- (void)updateAutoPlayVideoSettings
{
  v2 = self;
  sub_1E159A594();
}

- (void)dealloc
{
  v3 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal28AutoPlayVideoSettingsManager_networkObservation;
  swift_beginAccess();
  if (*((void *)v3 + 3))
  {
    sub_1E15A750C((uint64_t)v3, (uint64_t)v10);
    uint64_t v4 = v11;
    uint64_t v5 = v12;
    __swift_project_boxed_opaque_existential_1Tm(v10, v11);
    v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v7 = self;
    v6(v4, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  else
  {
    v8 = self;
  }
  v9 = (objc_class *)type metadata accessor for AutoPlayVideoSettingsManager();
  v13.receiver = self;
  v13.super_class = v9;
  [(AutoPlayVideoSettingsManager *)&v13 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal28AutoPlayVideoSettingsManager_autoPlayUserSetting));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal28AutoPlayVideoSettingsManager_networkInquiry);
  sub_1E15B07DC((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal28AutoPlayVideoSettingsManager_networkObservation, &qword_1EBF223E0);
}

- (BOOL)isAutoPlayAllowed
{
  v2 = self;
  char v3 = sub_1E159FCD8();

  return v3 & 1;
}

- (BOOL)isVideoAudioEnabled
{
  return 0;
}

- (void)restoreFullScreenAudioSettings
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF36F90);
  MEMORY[0x1F4188790](v0 - 8);
  v2 = (char *)&v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_1E1D571A8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v7);
  v9 = (char *)&v18 - v8;
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v18 - v11;
  id v13 = objc_msgSend(self, sel_standardUserDefaults);
  sub_1E16D452C((uint64_t)v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_1E15B07DC((uint64_t)v2, &qword_1EBF36F90);
    v14 = (void *)sub_1E1D5BE18();
    objc_msgSend(v13, sel_setBool_forKey_, 0, v14);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v12, v2, v3);
    sub_1E1D570E8();
    sub_1E1D57198();
    sub_1E163A7BC((unint64_t *)&qword_1EBF27020, MEMORY[0x1E4F27928]);
    char v15 = sub_1E1D5BDD8();
    v16 = *(void (**)(char *, uint64_t))(v4 + 8);
    v16(v6, v3);
    v17 = (void *)sub_1E1D5BE18();
    objc_msgSend(v13, sel_setBool_forKey_, (v15 & 1) == 0, v17);

    v16(v9, v3);
    v16(v12, v3);
  }
}

- (void)saveFullScreenAudioSettings
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF36F90);
  MEMORY[0x1F4188790](v0 - 8);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v3 = objc_msgSend(self, sel_standardUserDefaults);
  if (sub_1E16D48C4())
  {
    sub_1E1D57198();
    uint64_t v4 = sub_1E1D571A8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 0, 1, v4);
  }
  else
  {
    uint64_t v5 = sub_1E1D571A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v2, 1, 1, v5);
  }
  sub_1E16D46A8((uint64_t)v2);
}

@end