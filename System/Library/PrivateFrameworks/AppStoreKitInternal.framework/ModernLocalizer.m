@interface ModernLocalizer
- (NSString)identifier;
- (_TtC19AppStoreKitInternal15ModernLocalizer)init;
- (id)decimal:(id)a3 :(int64_t)a4;
- (id)fileSize:(id)a3;
- (id)formatDate:(id)a3 :(id)a4;
- (id)formatDateInSentence:(id)a3 :(id)a4 :(id)a5;
- (id)formatDateWithContext:(id)a3 :(id)a4 :(id)a5;
- (id)formatDuration:(int64_t)a3 :(id)a4;
- (id)formattedCount:(id)a3;
- (id)formattedCountForPreferredLocale:(id)a3 :(id)a4;
- (id)relativeDate:(id)a3;
- (id)string:(id)a3;
- (id)string:(id)a3 with:(id)a4;
- (id)stringForPreferredLocale:(id)a3 :(id)a4;
- (id)stringWithCount:(id)a3 :(int64_t)a4;
- (id)stringWithCounts:(id)a3 :(id)a4;
- (id)timeAgo:(id)a3;
- (id)timeAgoWithContext:(id)a3 :(id)a4;
@end

@implementation ModernLocalizer

- (id)decimal:(id)a3 :(int64_t)a4
{
  uint64_t v6 = sub_1E1D5A5F8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    __swift_project_boxed_opaque_existential_1Tm((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer), *(void *)&self->localizer[OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer + 16]);
    (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E4F71310], v6);
    v10 = self;
    id v11 = a3;
    sub_1E1D5BB68();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

    v12 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)formattedCount:(id)a3
{
  v3 = a3;
  if (a3)
  {
    v4 = self;
    id v5 = v3;
    objc_msgSend(v5, sel_integerValue);
    __swift_project_boxed_opaque_existential_1Tm((Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer), *(void *)&v4->localizer[OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer + 16]);
    sub_1E1D5BB38();

    v3 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  return v3;
}

- (NSString)identifier
{
  v2 = self;
  sub_1E1D57238();

  v3 = (void *)sub_1E1D5BE18();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)string:(id)a3
{
  uint64_t v4 = sub_1E1D5AF68();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E1D5BE58();
  __swift_project_boxed_opaque_existential_1Tm((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer), *(void *)&self->localizer[OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer + 16]);
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E4F71528], v4);
  uint64_t v8 = self;
  sub_1E1D5BB48();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  swift_bridgeObjectRelease();
  v9 = (void *)sub_1E1D5BE18();
  swift_bridgeObjectRelease();
  return v9;
}

- (id)stringWithCount:(id)a3 :(int64_t)a4
{
  uint64_t v6 = sub_1E1D5BE58();
  uint64_t v8 = v7;
  v9 = self;
  sub_1E163C7F0(v6, v8, a4);

  swift_bridgeObjectRelease();
  v10 = (void *)sub_1E1D5BE18();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)formatDateInSentence:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF36F90);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1E1D5BE58();
  uint64_t v12 = v11;
  uint64_t v13 = sub_1E1D5BE58();
  uint64_t v15 = v14;
  if (a5)
  {
    sub_1E1D57178();
    uint64_t v16 = sub_1E1D571A8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v9, 0, 1, v16);
  }
  else
  {
    uint64_t v17 = sub_1E1D571A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v9, 1, 1, v17);
  }
  v18 = self;
  sub_1E163CCCC(v10, v12, v13, v15, (uint64_t)v9);
  uint64_t v20 = v19;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E15B07DC((uint64_t)v9, &qword_1EBF36F90);
  if (v20)
  {
    v21 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = 0;
  }
  return v21;
}

- (id)formatDate:(id)a3 :(id)a4
{
  uint64_t v6 = sub_1E1D571A8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF36F90);
  MEMORY[0x1F4188790](v10 - 8);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  uint64_t v15 = (char *)&v20 - v14;
  sub_1E1D5BE58();
  if (a4)
  {
    sub_1E1D57178();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v15, 0, 1, v6);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v15, 1, 1, v6);
  }
  sub_1E163D784((uint64_t)v15, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) == 1)
  {
    uint64_t v16 = self;
    sub_1E15B07DC((uint64_t)v12, &qword_1EBF36F90);

    swift_bridgeObjectRelease();
    sub_1E15B07DC((uint64_t)v15, &qword_1EBF36F90);
    uint64_t v17 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v12, v6);
    __swift_project_boxed_opaque_existential_1Tm((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer), *(void *)&self->localizer[OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer + 16]);
    v18 = self;
    sub_1E1D5BBA8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

    swift_bridgeObjectRelease();
    sub_1E15B07DC((uint64_t)v15, &qword_1EBF36F90);
    uint64_t v17 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  return v17;
}

- (id)string:(id)a3 with:(id)a4
{
  uint64_t v6 = sub_1E1D5AF68();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[1] = sub_1E1D5BE58();
  if (a4) {
    sub_1E1D5BCB8();
  }
  __swift_project_boxed_opaque_existential_1Tm((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer), *(void *)&self->localizer[OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer + 16]);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E4F71528], v6);
  uint64_t v10 = self;
  sub_1E1D5BB48();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v11 = (void *)sub_1E1D5BE18();
  swift_bridgeObjectRelease();
  return v11;
}

- (id)fileSize:(id)a3
{
  v3 = a3;
  if (a3)
  {
    uint64_t v4 = self;
    id v5 = v3;
    objc_msgSend(v5, sel_doubleValue);
    __swift_project_boxed_opaque_existential_1Tm((Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer), *(void *)&v4->localizer[OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer + 16]);
    sub_1E1D5BB78();

    v3 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  return v3;
}

- (id)formatDateWithContext:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF36F90);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1E1D5BE58();
  uint64_t v12 = v11;
  if (a4)
  {
    sub_1E1D57178();
    uint64_t v13 = sub_1E1D571A8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 0, 1, v13);
  }
  else
  {
    uint64_t v14 = sub_1E1D571A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 1, 1, v14);
  }
  uint64_t v15 = sub_1E1D5BE58();
  uint64_t v16 = self;
  sub_1E1A4BD9C(v10, v12, (uint64_t)v9, v15);
  uint64_t v18 = v17;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E15B07DC((uint64_t)v9, &qword_1EBF36F90);
  if (v18)
  {
    uint64_t v19 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v19 = 0;
  }
  return v19;
}

- (id)relativeDate:(id)a3
{
  uint64_t v5 = sub_1E1D571A8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF36F90);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v18 - v13;
  if (a3)
  {
    sub_1E1D57178();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v14, 0, 1, v5);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))((char *)&v18 - v13, 1, 1, v5);
  }
  sub_1E163D784((uint64_t)v14, (uint64_t)v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5) == 1)
  {
    sub_1E15B07DC((uint64_t)v11, &qword_1EBF36F90);
    sub_1E15B07DC((uint64_t)v14, &qword_1EBF36F90);
    uint64_t v15 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v5);
    __swift_project_boxed_opaque_existential_1Tm((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer), *(void *)&self->localizer[OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer + 16]);
    uint64_t v16 = self;
    sub_1E1D5BB98();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

    sub_1E15B07DC((uint64_t)v14, &qword_1EBF36F90);
    uint64_t v15 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  return v15;
}

- (id)stringWithCounts:(id)a3 :(id)a4
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF36F98);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1E1D5BE58();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1E1D5C248();
  uint64_t v12 = self;
  sub_1E1711704(v8, v10);
  Locale.normalizedLocale.getter((uint64_t)v7);
  uint64_t v13 = sub_1E1D572C8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 0, 1, v13);
  sub_1E17DDF5C(v11);
  sub_1E1D5BE88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E15B07DC((uint64_t)v7, &qword_1EBF36F98);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)sub_1E1D5BE18();
  swift_bridgeObjectRelease();
  return v14;
}

- (id)stringForPreferredLocale:(id)a3 :(id)a4
{
  uint64_t v6 = sub_1E1D5BE58();
  uint64_t v8 = v7;
  if (a4)
  {
    uint64_t v9 = sub_1E1D5BE58();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v11 = self;
  sub_1E17119F0(v6, v8, v9, (uint64_t)a4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_1E1D5BE18();
  swift_bridgeObjectRelease();
  return v12;
}

- (id)formattedCountForPreferredLocale:(id)a3 :(id)a4
{
  sub_1E1D5BE58();
  uint64_t v6 = self;
  id v7 = a3;
  sub_1E1712920(a3);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    uint64_t v10 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (id)timeAgo:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF36F90);
  MEMORY[0x1F4188790](v5 - 8);
  id v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1E1D57178();
    uint64_t v8 = sub_1E1D571A8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_1E1D571A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  uint64_t v10 = self;
  sub_1E1A4C880((uint64_t)v7);
  uint64_t v12 = v11;

  sub_1E15B07DC((uint64_t)v7, &qword_1EBF36F90);
  if (v12)
  {
    uint64_t v13 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = 0;
  }
  return v13;
}

- (id)timeAgoWithContext:(id)a3 :(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF36F90);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1E1D57178();
    uint64_t v9 = sub_1E1D571A8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_1E1D571A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  uint64_t v11 = sub_1E1D5BE58();
  uint64_t v12 = self;
  sub_1E1A4CAA8((uint64_t)v8, v11);
  uint64_t v14 = v13;

  swift_bridgeObjectRelease();
  sub_1E15B07DC((uint64_t)v8, &qword_1EBF36F90);
  if (v14)
  {
    uint64_t v15 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = 0;
  }
  return v15;
}

- (id)formatDuration:(int64_t)a3 :(id)a4
{
  sub_1E1D5BE58();
  uint64_t v6 = self;
  sub_1E1A4D2A4(a3);
  uint64_t v8 = v7;

  swift_bridgeObjectRelease();
  if (v8)
  {
    uint64_t v9 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (_TtC19AppStoreKitInternal15ModernLocalizer)init
{
  result = (_TtC19AppStoreKitInternal15ModernLocalizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_localizer);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal15ModernLocalizer_legacyLocalizer);
}

@end