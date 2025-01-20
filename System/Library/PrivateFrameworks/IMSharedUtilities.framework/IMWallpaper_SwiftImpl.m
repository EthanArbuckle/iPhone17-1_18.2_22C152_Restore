@interface IMWallpaper_SwiftImpl
+ (BOOL)supportsSecureCoding;
- (BOOL)contentIsSensitive;
- (BOOL)isEqual:(id)a3;
- (BOOL)lowResWallpaperExists;
- (BOOL)wallpaperExists;
- (IMWallpaperMetadata)metadata;
- (IMWallpaper_SwiftImpl)init;
- (IMWallpaper_SwiftImpl)initWithCoder:(id)a3;
- (IMWallpaper_SwiftImpl)initWithDictionaryRepresentation:(id)a3;
- (IMWallpaper_SwiftImpl)initWithFileName:(id)a3 filePath:(id)a4 data:(id)a5 lowResFileName:(id)a6 lowResFilePath:(id)a7 lowResData:(id)a8 metadata:(id)a9 contentIsSensitive:(BOOL)a10 error:(id *)a11;
- (IMWallpaper_SwiftImpl)initWithFileName:(id)a3 filePath:(id)a4 lowResFileName:(id)a5 lowResFilePath:(id)a6 metadata:(id)a7 contentIsSensitive:(BOOL)a8;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)publicDictionaryRepresentation;
- (NSString)fileName;
- (NSString)filePath;
- (NSString)lowResFileName;
- (NSString)lowResFilePath;
- (id)fetchLowResWallpaperDataAndReturnError:(id *)a3;
- (id)fetchWallpaperDataAndReturnError:(id *)a3;
- (int64_t)dataVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMWallpaper_SwiftImpl

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)fileName
{
  return (NSString *)sub_1A08A2C50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMWallpaper_SwiftImpl_fileName);
}

- (NSString)filePath
{
  return (NSString *)sub_1A08A2C50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMWallpaper_SwiftImpl_filePath);
}

- (NSString)lowResFileName
{
  return (NSString *)sub_1A08A2C50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMWallpaper_SwiftImpl_lowResFileName);
}

- (NSString)lowResFilePath
{
  return (NSString *)sub_1A08A2C50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMWallpaper_SwiftImpl_lowResFilePath);
}

- (int64_t)dataVersion
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMWallpaper_SwiftImpl_dataVersion);
}

- (IMWallpaperMetadata)metadata
{
  return (IMWallpaperMetadata *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR___IMWallpaper_SwiftImpl_metadata));
}

- (BOOL)contentIsSensitive
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___IMWallpaper_SwiftImpl_contentIsSensitive);
}

- (IMWallpaper_SwiftImpl)initWithFileName:(id)a3 filePath:(id)a4 lowResFileName:(id)a5 lowResFilePath:(id)a6 metadata:(id)a7 contentIsSensitive:(BOOL)a8
{
  uint64_t v12 = (uint64_t)a4;
  if (a3)
  {
    uint64_t v13 = sub_1A09F3E18();
    uint64_t v15 = v14;
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v15 = 0;
    if (a4)
    {
LABEL_3:
      uint64_t v12 = sub_1A09F3E18();
      uint64_t v17 = v16;
      if (a5) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v19 = 0;
      if (a6) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v21 = 0;
      return (IMWallpaper_SwiftImpl *)Wallpaper.init(fileName:filePath:lowResFileName:lowResFilePath:metadata:contentIsSensitive:)(v13, v15, v12, v17, (uint64_t)a5, v19, (uint64_t)a6, v21, (uint64_t)a7, a8);
    }
  }
  uint64_t v17 = 0;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_4:
  a5 = (id)sub_1A09F3E18();
  uint64_t v19 = v18;
  if (!a6) {
    goto LABEL_9;
  }
LABEL_5:
  a6 = (id)sub_1A09F3E18();
  uint64_t v21 = v20;
  return (IMWallpaper_SwiftImpl *)Wallpaper.init(fileName:filePath:lowResFileName:lowResFilePath:metadata:contentIsSensitive:)(v13, v15, v12, v17, (uint64_t)a5, v19, (uint64_t)a6, v21, (uint64_t)a7, a8);
}

- (IMWallpaper_SwiftImpl)initWithFileName:(id)a3 filePath:(id)a4 data:(id)a5 lowResFileName:(id)a6 lowResFilePath:(id)a7 lowResData:(id)a8 metadata:(id)a9 contentIsSensitive:(BOOL)a10 error:(id *)a11
{
  if (a3)
  {
    uint64_t v16 = sub_1A09F3E18();
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
  }
  uint64_t v41 = v17;
  uint64_t v42 = v16;
  if (a4)
  {
    uint64_t v18 = sub_1A09F3E18();
    uint64_t v39 = v19;
    v40 = (id *)v18;
  }
  else
  {
    uint64_t v39 = 0;
    v40 = 0;
  }
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  if (a5)
  {
    id v24 = a5;
    uint64_t v38 = sub_1A09F33E8();
    unint64_t v26 = v25;

    if (v20) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v38 = 0;
    unint64_t v26 = 0xF000000000000000;
    if (v20)
    {
LABEL_9:
      uint64_t v27 = sub_1A09F3E18();
      uint64_t v29 = v28;

      if (v21) {
        goto LABEL_10;
      }
LABEL_14:
      uint64_t v30 = 0;
      uint64_t v32 = 0;
      char v33 = a10;
      if (v22) {
        goto LABEL_11;
      }
LABEL_15:
      uint64_t v34 = 0;
      unint64_t v36 = 0xF000000000000000;
      return (IMWallpaper_SwiftImpl *)Wallpaper.init(fileName:filePath:data:lowResFileName:lowResFilePath:lowResData:metadata:contentIsSensitive:)(v42, v41, v40, v39, v38, v26, v27, v29, v30, v32, v34, v36, a9, v33);
    }
  }
  uint64_t v27 = 0;
  uint64_t v29 = 0;
  if (!v21) {
    goto LABEL_14;
  }
LABEL_10:
  uint64_t v30 = sub_1A09F3E18();
  uint64_t v32 = v31;

  char v33 = a10;
  if (!v22) {
    goto LABEL_15;
  }
LABEL_11:
  uint64_t v34 = sub_1A09F33E8();
  unint64_t v36 = v35;

  return (IMWallpaper_SwiftImpl *)Wallpaper.init(fileName:filePath:data:lowResFileName:lowResFilePath:lowResData:metadata:contentIsSensitive:)(v42, v41, v40, v39, v38, v26, v27, v29, v30, v32, v34, v36, a9, v33);
}

- (IMWallpaper_SwiftImpl)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMWallpaper_SwiftImpl *)Wallpaper.init(dictionaryRepresentation:)(v3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A09B4064(v4);
}

- (IMWallpaper_SwiftImpl)initWithCoder:(id)a3
{
  return (IMWallpaper_SwiftImpl *)Wallpaper.init(coder:)(a3);
}

- (BOOL)wallpaperExists
{
  v2 = self;
  char v3 = sub_1A09B489C();

  return v3 & 1;
}

- (BOOL)lowResWallpaperExists
{
  v2 = self;
  char v3 = sub_1A09B48DC();

  return v3 & 1;
}

- (id)fetchWallpaperDataAndReturnError:(id *)a3
{
  return sub_1A09B4B60((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___IMWallpaper_SwiftImpl_filePath);
}

- (id)fetchLowResWallpaperDataAndReturnError:(id *)a3
{
  return sub_1A09B4B60((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___IMWallpaper_SwiftImpl_lowResFilePath);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1A09F4588();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1A09B4D50((uint64_t)v8);

  sub_1A0783C7C((uint64_t)v8);
  return v6 & 1;
}

- (NSDictionary)publicDictionaryRepresentation
{
  return (NSDictionary *)sub_1A09B52CC(self, (uint64_t)a2, (void (*)(void))sub_1A09B5034);
}

- (NSDictionary)dictionaryRepresentation
{
  return (NSDictionary *)sub_1A09B52CC(self, (uint64_t)a2, (void (*)(void))sub_1A09B5348);
}

- (IMWallpaper_SwiftImpl)init
{
  result = (IMWallpaper_SwiftImpl *)_swift_stdlib_reportUnimplementedInitializer();
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
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  char v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMWallpaper_SwiftImpl_metadata);
}

@end