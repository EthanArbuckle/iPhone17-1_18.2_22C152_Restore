@interface LegacyLocalizer
- (NSString)identifier;
- (_TtC19AppStoreKitInternal15LegacyLocalizer)init;
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

@implementation LegacyLocalizer

- (NSString)identifier
{
  v2 = self;
  sub_1E1D57238();

  v3 = (void *)sub_1E1D5BE18();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)decimal:(id)a3 :(int64_t)a4
{
  v6 = self;
  id v7 = a3;
  sub_1E17114A8(a3, a4);
  uint64_t v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)string:(id)a3
{
  uint64_t v4 = sub_1E1D5BE58();
  uint64_t v6 = v5;
  id v7 = self;
  sub_1E1711704(v4, v6);

  swift_bridgeObjectRelease();
  uint64_t v8 = (void *)sub_1E1D5BE18();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)string:(id)a3 with:(id)a4
{
  uint64_t v6 = sub_1E1D5BE58();
  uint64_t v8 = v7;
  if (a4) {
    sub_1E1D5BCB8();
  }
  uint64_t v9 = self;
  sub_1E1711704(v6, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_1E1D5BE18();
  swift_bridgeObjectRelease();
  return v10;
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
  v11 = self;
  sub_1E17119F0(v6, v8, v9, (uint64_t)a4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_1E1D5BE18();
  swift_bridgeObjectRelease();
  return v12;
}

- (id)stringWithCount:(id)a3 :(int64_t)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF36F98);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1E1D5BE58();
  uint64_t v11 = v10;
  v12 = self;
  sub_1E1711704(v9, v11);
  Locale.normalizedLocale.getter((uint64_t)v8);
  uint64_t v13 = sub_1E1D572C8();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 0, 1, v13);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBF40D90);
  uint64_t v14 = swift_allocObject();
  uint64_t v15 = MEMORY[0x1E4FBB550];
  *(_OWORD *)(v14 + 16) = xmmword_1E1D666B0;
  uint64_t v16 = MEMORY[0x1E4FBB5C8];
  *(void *)(v14 + 56) = v15;
  *(void *)(v14 + 64) = v16;
  *(void *)(v14 + 32) = a4;
  sub_1E1D5BE88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E15B07DC((uint64_t)v8, &qword_1EBF36F98);

  swift_bridgeObjectRelease();
  v17 = (void *)sub_1E1D5BE18();
  swift_bridgeObjectRelease();
  return v17;
}

- (id)stringWithCounts:(id)a3 :(id)a4
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF36F98);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1E1D5BE58();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1E1D5C248();
  v12 = self;
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

- (id)fileSize:(id)a3
{
  uint64_t v4 = self;
  id v5 = a3;
  sub_1E17121E4(a3);
  uint64_t v7 = v6;

  if (v7)
  {
    uint64_t v8 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)formattedCount:(id)a3
{
  uint64_t v5 = sub_1E1D572C8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = self;
  id v10 = a3;
  Locale.normalizedLocale.getter((uint64_t)v8);
  sub_1E1D57238();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1E1712920(a3);
  uint64_t v12 = v11;

  swift_bridgeObjectRelease();
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
    id v10 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (id)timeAgo:(id)a3
{
  return sub_1E1714E24(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1E1712C30);
}

- (id)timeAgoWithContext:(id)a3 :(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF36F90);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  uint64_t v13 = v12;
  uint64_t v14 = self;
  sub_1E1712EAC((uint64_t)v8, v11, v13);
  uint64_t v16 = v15;

  swift_bridgeObjectRelease();
  sub_1E15B07DC((uint64_t)v8, &qword_1EBF36F90);
  if (v16)
  {
    v17 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (id)formatDateInSentence:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF36F90);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v18 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal15LegacyLocalizer_extendedLocale;
  uint64_t v19 = self;
  sub_1E17137A0(v10, v12, v13, v15, (uint64_t)v9, (uint64_t)v18);
  uint64_t v21 = v20;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E15B07DC((uint64_t)v9, &qword_1EBF36F90);
  if (v21)
  {
    v22 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = 0;
  }
  return v22;
}

- (id)formatDate:(id)a3 :(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF36F90);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1E1D5BE58();
  uint64_t v11 = v10;
  if (a4)
  {
    sub_1E1D57178();
    uint64_t v12 = sub_1E1D571A8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_1E1D571A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
  }
  uint64_t v14 = self;
  sub_1E1713E7C(v9, v11, (uint64_t)v8, 0xD000000000000013, 0x80000001E1DAB900);
  uint64_t v16 = v15;

  swift_bridgeObjectRelease();
  sub_1E15B07DC((uint64_t)v8, &qword_1EBF36F90);
  if (v16)
  {
    uint64_t v17 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v17 = 0;
  }
  return v17;
}

- (id)formatDateWithContext:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF36F90);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  uint64_t v17 = v16;
  v18 = self;
  sub_1E1713E7C(v10, v12, (uint64_t)v9, v15, v17);
  uint64_t v20 = v19;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E15B07DC((uint64_t)v9, &qword_1EBF36F90);
  if (v20)
  {
    uint64_t v21 = (void *)sub_1E1D5BE18();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v21 = 0;
  }
  return v21;
}

- (id)relativeDate:(id)a3
{
  return sub_1E1714E24(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1E17145B8);
}

- (id)formatDuration:(int64_t)a3 :(id)a4
{
  sub_1E1D5BE58();
  uint64_t v6 = self;
  sub_1E1714F90(a3);
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

- (_TtC19AppStoreKitInternal15LegacyLocalizer)init
{
  result = (_TtC19AppStoreKitInternal15LegacyLocalizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal15LegacyLocalizer_locale;
  uint64_t v4 = sub_1E1D572C8();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC19AppStoreKitInternal15LegacyLocalizer_extendedLocale, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19AppStoreKitInternal15LegacyLocalizer____lazy_storage___relativeDateFormatter);
}

@end