@interface MFComposePhotoPickerItem
+ (NSString)contentIdentifierPrefix;
+ (id)assetIdentifierFromContentIdentifier:(id)a3;
+ (id)bestTypeToLoadFrom:(id)a3;
- (BOOL)isVideo;
- (MFComposePhotoPickerItem)init;
- (MFComposePhotoPickerItem)initWithAssetIdentifier:(id)a3 assetURL:(id)a4 assetData:(id)a5 contentType:(id)a6;
- (NSData)assetData;
- (NSString)assetIdentifier;
- (NSString)contentIdentifier;
- (NSURL)assetURL;
- (UTType)contentType;
@end

@implementation MFComposePhotoPickerItem

- (NSString)assetIdentifier
{
  v2 = self;
  PhotoPickerItem.assetIdentifier.getter();

  id v5 = (id)sub_1AFA53FB8();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (NSURL)assetURL
{
  v13 = self;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF5DF0);
  unint64_t v12 = (*(void *)(*(void *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v3, v4, v5, v6);
  v14 = (char *)&v10 - v12;
  v7 = self;
  PhotoPickerItem.assetURL.getter(v14);

  uint64_t v15 = sub_1AFA53C58();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = v15 - 8;
  if ((*(unsigned int (**)(char *, uint64_t))(v16 + 48))(v14, 1) == 1)
  {
    v11 = 0;
  }
  else
  {
    uint64_t v10 = sub_1AFA53C38();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v14, v15);
    v11 = (void *)v10;
  }
  v8 = v11;

  return (NSURL *)v8;
}

- (NSData)assetData
{
  v2 = self;
  uint64_t v8 = PhotoPickerItem.assetData.getter();
  unint64_t v9 = v3;

  if ((v9 & 0xF000000000000000) == 0xF000000000000000)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v5 = sub_1AFA53C68();
    sub_1AFA4AF04(v8, v9);
    id v6 = (id)v5;
  }

  return (NSData *)v6;
}

- (UTType)contentType
{
  v11 = self;
  uint64_t v14 = sub_1AFA53D48();
  uint64_t v12 = *(void *)(v14 - 8);
  uint64_t v13 = v14 - 8;
  unint64_t v10 = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v14, v3, v4, v5);
  uint64_t v15 = (uint64_t)&v9 - v10;
  id v6 = self;
  PhotoPickerItem.contentType.getter(v15);

  uint64_t v16 = sub_1AFA53CF8();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v14);
  v7 = (void *)v16;

  return (UTType *)v7;
}

- (NSString)contentIdentifier
{
  v2 = self;
  PhotoPickerItem.contentIdentifier.getter();

  id v5 = (id)sub_1AFA53FB8();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (BOOL)isVideo
{
  v2 = self;
  sub_1AFA4B2F4();

  return sub_1AFA53C88() & 1;
}

+ (NSString)contentIdentifierPrefix
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  static PhotoPickerItem.contentIdentifierPrefix.getter();
  id v3 = (id)sub_1AFA53FB8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (MFComposePhotoPickerItem)initWithAssetIdentifier:(id)a3 assetURL:(id)a4 assetData:(id)a5 contentType:(id)a6
{
  v34 = self;
  id v47 = a3;
  id v46 = a6;
  id v48 = a4;
  id v45 = a5;
  uint64_t v35 = 0;
  unint64_t v36 = (*(void *)(*(void *)(sub_1AFA53D48() - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](0, v6, v7, v8);
  uint64_t v37 = (uint64_t)&v23 - v36;
  uint64_t v38 = sub_1AFA53C58();
  uint64_t v39 = *(void *)(v38 - 8);
  uint64_t v40 = v38 - 8;
  unint64_t v41 = (*(void *)(v39 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1F4188790](v38, v9, v10, v11);
  v42 = (char *)&v23 - v41;
  unint64_t v43 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF5DF0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v15 = (void *)MEMORY[0x1F4188790](v47, v12, v13, v14);
  v44 = (char *)&v23 - v43;
  id v16 = v15;
  id v17 = v48;
  id v18 = v45;
  id v19 = v46;
  uint64_t v49 = sub_1AFA53FC8();
  uint64_t v50 = v20;
  if (v48)
  {
    id v33 = v48;
    id v32 = v48;
    sub_1AFA53C48();
    (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v44, v42, v38);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v39 + 56))(v44, 0, 1, v38);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v39 + 56))(v44, 1, 1, v38);
  }
  if (v45)
  {
    id v31 = v45;
    id v26 = v45;
    uint64_t v27 = sub_1AFA53C78();
    unint64_t v28 = v21;

    uint64_t v29 = v27;
    unint64_t v30 = v28;
  }
  else
  {
    uint64_t v29 = 0;
    unint64_t v30 = 0xF000000000000000;
  }
  unint64_t v24 = v30;
  uint64_t v23 = v29;
  sub_1AFA53D08();
  v25 = (MFComposePhotoPickerItem *)PhotoPickerItem.init(assetIdentifier:assetURL:assetData:contentType:)(v49, v50, v44, v23, v24, v37);

  return v25;
}

+ (id)bestTypeToLoadFrom:(id)a3
{
  id v12 = a1;
  id v14 = a3;
  swift_getObjCClassMetadata();
  unint64_t v11 = (*(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9AF5DF8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v15 = (uint64_t)&v9 - v11;
  id v6 = (id)MEMORY[0x1F4188790](v14, v3, v4, v5);
  uint64_t v16 = sub_1AFA53D48();
  uint64_t v13 = sub_1AFA54078();
  swift_getObjCClassMetadata();
  sub_1AFA4C13C(v13, v15);
  swift_bridgeObjectRelease();

  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = v16 - 8;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v17 + 48))(v15, 1) == 1)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v9 = sub_1AFA53CF8();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
    uint64_t v10 = (void *)v9;
  }
  uint64_t v7 = v10;

  return v7;
}

+ (id)assetIdentifierFromContentIdentifier:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  sub_1AFA53FC8();
  swift_getObjCClassMetadata();
  sub_1AFA4D208();
  uint64_t v9 = v4;
  swift_bridgeObjectRelease();

  if (v9)
  {
    uint64_t v6 = sub_1AFA53FB8();
    swift_bridgeObjectRelease();
    id v7 = (id)v6;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (MFComposePhotoPickerItem)init
{
  return (MFComposePhotoPickerItem *)PhotoPickerItem.init()();
}

- (void).cxx_destruct
{
  sub_1AFA4BC78();
  sub_1AFA4BD68((uint64_t)self + OBJC_IVAR___MFComposePhotoPickerItem_assetURL);
  sub_1AFA4D738((uint64_t)self + OBJC_IVAR___MFComposePhotoPickerItem_assetData);
  uint64_t v3 = OBJC_IVAR___MFComposePhotoPickerItem_contentType;
  uint64_t v2 = sub_1AFA53D48();
  (*(void (**)(char *))(*(void *)(v2 - 8) + 8))((char *)self + v3);
  sub_1AFA4BC78();
}

@end