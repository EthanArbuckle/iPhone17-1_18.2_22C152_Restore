@interface CNWallpaperConfigurationGenerator
+ (_TtC10ContactsUI33CNWallpaperConfigurationGenerator)shared;
- (BOOL)isCleanStatePosterData:(id)a3 contact:(id)a4;
- (_TtC10ContactsUI33CNWallpaperConfigurationGenerator)init;
- (id)cleanStatePosterArchiveDataFor:(id)a3;
@end

@implementation CNWallpaperConfigurationGenerator

+ (_TtC10ContactsUI33CNWallpaperConfigurationGenerator)shared
{
  if (qword_1E913A618 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E913A610;

  return (_TtC10ContactsUI33CNWallpaperConfigurationGenerator *)v2;
}

- (id)cleanStatePosterArchiveDataFor:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_18B7205D4((uint64_t)v4);
  unint64_t v8 = v7;

  v9 = (void *)sub_18B983BB8();
  sub_18B64B8F0(v6, v8);

  return v9;
}

- (BOOL)isCleanStatePosterData:(id)a3 contact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  uint64_t v9 = sub_18B983BD8();
  unint64_t v11 = v10;

  char v12 = sub_18B72076C(v9, v11, (uint64_t)v7);
  sub_18B64B8F0(v9, v11);

  return v12 & 1;
}

- (_TtC10ContactsUI33CNWallpaperConfigurationGenerator)init
{
  uint64_t v3 = OBJC_IVAR____TtC10ContactsUI33CNWallpaperConfigurationGenerator_cleanStatePosterBackgroundColor;
  id v4 = self;
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_systemDarkGrayColor);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for CNWallpaperConfigurationGenerator();
  return [(CNWallpaperConfigurationGenerator *)&v7 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI33CNWallpaperConfigurationGenerator_cleanStatePosterBackgroundColor));
}

@end