@interface NTKParmesanAsset
+ (id)decodeFromDictionary:(id)a3;
+ (id)decodeFromDictionary:(id)a3 inResourceDirectory:(id)a4;
- (BOOL)isEqual:(id)a3;
- (CGSize)presentationSize;
- (NSDate)modificationDate;
- (NSDictionary)layouts;
- (NSString)accessibilityDescription;
- (NSString)description;
- (NSString)localIdentifier;
- (NSURL)resourceDirectory;
- (NTKParmesanAsset)init;
- (NTKParmesanAsset)initWithLocalIdentifier:(id)a3 modificationDate:(id)a4 presentationSize:(CGSize)a5 videoInfo:(id)a6 resourceDirectory:(id)a7 preferredTimeLayout:(id)a8 layouts:(id)a9 accessibilityDescription:(id)a10;
- (NTKParmesanAssetLayout)preferredLayout;
- (NTKParmesanAssetVideoInfo)videoInfo;
- (NTKParmesanTimeLayout)preferredTimeLayout;
- (id)asDictionary;
- (id)copyWithZone:(void *)a3;
- (id)imageURLForTimeLayout:(id)a3;
- (id)layoutFor:(id)a3;
- (id)layoutForScale:(int64_t)a3;
- (id)maskImageURLForTimeLayout:(id)a3;
- (id)preferredLayoutImageURL;
- (id)uniqueSnapshotIdentifierForTimeOption:(id)a3;
- (int64_t)photoVersion;
- (void)setAccessibilityDescription:(id)a3;
- (void)setLayouts:(id)a3;
- (void)setLocalIdentifier:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setPhotoVersion:(int64_t)a3;
- (void)setPreferredTimeLayout:(id)a3;
- (void)setPresentationSize:(CGSize)a3;
- (void)setResourceDirectory:(id)a3;
- (void)setVideoInfo:(id)a3;
@end

@implementation NTKParmesanAsset

- (NSString)localIdentifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setLocalIdentifier:(id)a3
{
  uint64_t v4 = sub_246C2CC48();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___NTKParmesanAsset_localIdentifier);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (NSDate)modificationDate
{
  return (NSDate *)sub_246C11ACC((uint64_t)self, (uint64_t)a2, &qword_2691D7030, &OBJC_IVAR___NTKParmesanAsset_modificationDate, MEMORY[0x263F07490], MEMORY[0x263F073A8]);
}

- (void)setModificationDate:(id)a3
{
}

- (NTKParmesanTimeLayout)preferredTimeLayout
{
  return (NTKParmesanTimeLayout *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR___NTKParmesanAsset_preferredTimeLayout));
}

- (void)setPreferredTimeLayout:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAsset_preferredTimeLayout);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAsset_preferredTimeLayout) = (Class)a3;
  id v3 = a3;
}

- (NSDictionary)layouts
{
  swift_beginAccess();
  type metadata accessor for ParmesanTimeLayout();
  type metadata accessor for ParmesanAssetLayout();
  sub_246C18434((unint64_t *)&unk_2691D86E8, (void (*)(uint64_t))type metadata accessor for ParmesanTimeLayout);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_246C2CBA8();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

- (void)setLayouts:(id)a3
{
  type metadata accessor for ParmesanTimeLayout();
  type metadata accessor for ParmesanAssetLayout();
  sub_246C18434((unint64_t *)&unk_2691D86E8, (void (*)(uint64_t))type metadata accessor for ParmesanTimeLayout);
  uint64_t v4 = sub_246C2CBB8();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___NTKParmesanAsset_layouts);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSString)accessibilityDescription
{
  if (*(void *)&self->localIdentifier[OBJC_IVAR___NTKParmesanAsset_accessibilityDescription])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_246C2CC08();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setAccessibilityDescription:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_246C2CC48();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v6 = (uint64_t *)((char *)self + OBJC_IVAR___NTKParmesanAsset_accessibilityDescription);
  *uint64_t v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (NTKParmesanAssetVideoInfo)videoInfo
{
  return (NTKParmesanAssetVideoInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                              + OBJC_IVAR___NTKParmesanAsset_videoInfo));
}

- (void)setVideoInfo:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAsset_videoInfo);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAsset_videoInfo) = (Class)a3;
  id v3 = a3;
}

- (NSURL)resourceDirectory
{
  return (NSURL *)sub_246C11ACC((uint64_t)self, (uint64_t)a2, &qword_2691D7038, &OBJC_IVAR___NTKParmesanAsset_resourceDirectory, MEMORY[0x263F06EA8], MEMORY[0x263F06E88]);
}

- (void)setResourceDirectory:(id)a3
{
}

- (CGSize)presentationSize
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAsset_presentationSize);
  double v3 = *(double *)&self->localIdentifier[OBJC_IVAR___NTKParmesanAsset_presentationSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setPresentationSize:(CGSize)a3
{
  *(CGSize *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAsset_presentationSize) = a3;
}

- (int64_t)photoVersion
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAsset_photoVersion);
}

- (void)setPhotoVersion:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAsset_photoVersion) = (Class)a3;
}

- (NTKParmesanAsset)initWithLocalIdentifier:(id)a3 modificationDate:(id)a4 presentationSize:(CGSize)a5 videoInfo:(id)a6 resourceDirectory:(id)a7 preferredTimeLayout:(id)a8 layouts:(id)a9 accessibilityDescription:(id)a10
{
  double height = a5.height;
  double width = a5.width;
  v37[1] = self;
  uint64_t v16 = sub_246B80250(&qword_2691D7038);
  MEMORY[0x270FA5388](v16 - 8);
  v18 = (char *)v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_246B80250(&qword_2691D7030);
  MEMORY[0x270FA5388](v19 - 8);
  v21 = (char *)v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_246C2CC48();
  uint64_t v24 = v23;
  if (a4)
  {
    sub_246C2BC08();
    uint64_t v25 = sub_246C2BC18();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v21, 0, 1, v25);
  }
  else
  {
    uint64_t v26 = sub_246C2BC18();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v21, 1, 1, v26);
  }
  id v27 = a10;
  if (a7)
  {
    sub_246C2BB28();
    uint64_t v28 = sub_246C2BB98();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v18, 0, 1, v28);
  }
  else
  {
    uint64_t v29 = sub_246C2BB98();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v18, 1, 1, v29);
  }
  type metadata accessor for ParmesanTimeLayout();
  type metadata accessor for ParmesanAssetLayout();
  sub_246C18434((unint64_t *)&unk_2691D86E8, (void (*)(uint64_t))type metadata accessor for ParmesanTimeLayout);
  unint64_t v30 = sub_246C2CBB8();
  if (a10)
  {
    uint64_t v31 = sub_246C2CC48();
    id v27 = v32;
  }
  else
  {
    uint64_t v31 = 0;
  }
  id v33 = a8;
  id v34 = a6;
  v35 = (NTKParmesanAsset *)sub_246C17998(v22, v24, (uint64_t)v21, v34, (uint64_t)v18, v33, v30, v31, width, height, (uint64_t)v27);

  return v35;
}

- (NTKParmesanAsset)init
{
  CGSize result = (NTKParmesanAsset *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_246B8EA34((uint64_t)self + OBJC_IVAR___NTKParmesanAsset_resourceDirectory, &qword_2691D7038);
}

- (id)uniqueSnapshotIdentifierForTimeOption:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_246C133D8();

  uint64_t v6 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_246C2D1F8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    uint64_t v5 = self;
  }
  sub_246BB75D0((uint64_t)v11, (uint64_t)v9, &qword_2691D69A0);
  if (!v10)
  {
    sub_246B8EA34((uint64_t)v9, &qword_2691D69A0);
    goto LABEL_8;
  }
  type metadata accessor for ParmesanAsset();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    char v6 = 0;
    goto LABEL_9;
  }
  char v6 = sub_246C17DD4((uint64_t)self, (uint64_t)v8);

LABEL_9:
  sub_246B8EA34((uint64_t)v11, &qword_2691D69A0);
  return v6 & 1;
}

- (id)copyWithZone:(void *)a3
{
  double v3 = self;
  sub_246C13B74(v6);

  sub_246B8F7E8(v6, v6[3]);
  id v4 = (void *)sub_246C2D558();
  sub_246B8EB94((uint64_t)v6);
  return v4;
}

- (NSString)description
{
  double v2 = self;
  sub_246C13E88();

  double v3 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (id)asDictionary
{
  double v2 = self;
  uint64_t v3 = sub_246C14038();

  if (v3)
  {
    id v4 = (void *)sub_246C2CBA8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)decodeFromDictionary:(id)a3
{
  sub_246C2CBB8();
  id v4 = (void *)sub_246C2CBA8();
  id v5 = objc_msgSend(a1, sel_decodeFromDictionary_inResourceDirectory_, v4, 0);
  swift_bridgeObjectRelease();

  return v5;
}

+ (id)decodeFromDictionary:(id)a3 inResourceDirectory:(id)a4
{
  uint64_t v5 = sub_246C2CBB8();
  if (a4)
  {
    uint64_t v6 = sub_246C2CC48();
    a4 = v7;
  }
  else
  {
    uint64_t v6 = 0;
  }
  swift_getObjCClassMetadata();
  id v8 = sub_246C14360(v5, v6, (uint64_t)a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v8;
}

- (NTKParmesanAssetLayout)preferredLayout
{
  id v2 = [(NTKParmesanAsset *)self layoutFor:*(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAsset_preferredTimeLayout)];

  return (NTKParmesanAssetLayout *)v2;
}

- (id)preferredLayoutImageURL
{
  uint64_t v3 = sub_246B80250(&qword_2691D7038);
  uint64_t v4 = MEMORY[0x270FA5388](v3 - 8);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v17 - v7;
  uint64_t v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanAsset_preferredTimeLayout);
  uint64_t v10 = self;
  id v11 = [(NTKParmesanAsset *)v10 imageURLForTimeLayout:v9];
  if (v11)
  {
    v12 = v11;
    sub_246C2BB28();

    uint64_t v13 = sub_246C2BB98();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 0, 1, v13);
  }
  else
  {
    uint64_t v13 = sub_246C2BB98();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v6, 1, 1, v13);
  }
  sub_246BEBAFC((uint64_t)v6, (uint64_t)v8);

  sub_246C2BB98();
  uint64_t v14 = *(void *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13) != 1)
  {
    v15 = (void *)sub_246C2BAC8();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v13);
  }

  return v15;
}

- (id)layoutFor:(id)a3
{
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR___NTKParmesanAsset_layouts);
  swift_beginAccess();
  uint64_t v6 = *v5;
  id v7 = a3;
  id v8 = self;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_246C10B78(v7, v6);

  swift_bridgeObjectRelease();

  return v9;
}

- (id)layoutForScale:(int64_t)a3
{
  uint64_t v4 = self;
  id v5 = sub_246C14A4C(a3);

  return v5;
}

- (id)imageURLForTimeLayout:(id)a3
{
  return sub_246C15EFC(self, (uint64_t)a2, a3, (void (*)(void *))sub_246C14C0C);
}

- (id)maskImageURLForTimeLayout:(id)a3
{
  return sub_246C15EFC(self, (uint64_t)a2, a3, (void (*)(void *))sub_246C15428);
}

@end