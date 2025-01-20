@interface IMRichCardMedia
- (BOOL)isEqual:(id)a3;
- (IMRichCardMedia)init;
- (IMRichCardMedia)initWithDictionary:(id)a3;
- (IMRichCardMedia)initWithMediaUrl:(id)a3 mediaContentType:(id)a4 mediaFileSize:(id)a5 thumbnailUrl:(id)a6 thumbnailContentType:(id)a7 thumbnailFileSize:(id)a8 height:(int64_t)a9 contentDescription:(id)a10;
- (NSNumber)mediaFileSize;
- (NSNumber)thumbnailFileSize;
- (NSString)contentDescription;
- (NSString)mediaContentType;
- (NSString)mediaUrl;
- (NSString)thumbnailContentType;
- (NSString)thumbnailUrl;
- (id)dictionaryRepresentation;
- (int64_t)height;
@end

@implementation IMRichCardMedia

- (NSString)mediaUrl
{
  return (NSString *)sub_1A088C3D4();
}

- (NSString)mediaContentType
{
  return (NSString *)sub_1A088C3D4();
}

- (NSNumber)mediaFileSize
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___IMRichCardMedia_mediaFileSize));
}

- (NSString)thumbnailUrl
{
  return (NSString *)sub_1A08A2C50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMRichCardMedia_thumbnailUrl);
}

- (NSString)thumbnailContentType
{
  return (NSString *)sub_1A08A2C50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMRichCardMedia_thumbnailContentType);
}

- (NSNumber)thumbnailFileSize
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___IMRichCardMedia_thumbnailFileSize));
}

- (int64_t)height
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardMedia_height);
}

- (NSString)contentDescription
{
  return (NSString *)sub_1A08A2C50((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMRichCardMedia_contentDescription);
}

- (IMRichCardMedia)initWithMediaUrl:(id)a3 mediaContentType:(id)a4 mediaFileSize:(id)a5 thumbnailUrl:(id)a6 thumbnailContentType:(id)a7 thumbnailFileSize:(id)a8 height:(int64_t)a9 contentDescription:(id)a10
{
  uint64_t v14 = sub_1A09F3E18();
  uint64_t v36 = v15;
  uint64_t v37 = v14;
  uint64_t v16 = sub_1A09F3E18();
  uint64_t v18 = v17;
  if (a6)
  {
    uint64_t v19 = sub_1A09F3E18();
    uint64_t v21 = v20;
    id v22 = a10;
    if (a7) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v23 = 0;
    v25 = (objc_class *)a9;
    if (v22) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    goto LABEL_8;
  }
  uint64_t v19 = 0;
  uint64_t v21 = 0;
  id v22 = a10;
  if (!a7) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v23 = sub_1A09F3E18();
  a7 = v24;
  v25 = (objc_class *)a9;
  if (!v22) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v26 = sub_1A09F3E18();
LABEL_8:
  v28 = (uint64_t *)((char *)self + OBJC_IVAR___IMRichCardMedia_mediaUrl);
  uint64_t *v28 = v37;
  v28[1] = v36;
  v29 = (uint64_t *)((char *)self + OBJC_IVAR___IMRichCardMedia_mediaContentType);
  uint64_t *v29 = v16;
  v29[1] = v18;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardMedia_mediaFileSize) = (Class)a5;
  v30 = (uint64_t *)((char *)self + OBJC_IVAR___IMRichCardMedia_thumbnailUrl);
  uint64_t *v30 = v19;
  v30[1] = v21;
  v31 = (uint64_t *)((char *)self + OBJC_IVAR___IMRichCardMedia_thumbnailContentType);
  uint64_t *v31 = v23;
  v31[1] = (uint64_t)a7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardMedia_thumbnailFileSize) = (Class)a8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMRichCardMedia_height) = v25;
  v32 = (uint64_t *)((char *)self + OBJC_IVAR___IMRichCardMedia_contentDescription);
  uint64_t *v32 = v26;
  v32[1] = v27;
  v39.receiver = self;
  v39.super_class = (Class)IMRichCardMedia;
  id v33 = a5;
  id v34 = a8;
  return [(IMRichCardMedia *)&v39 init];
}

- (IMRichCardMedia)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMRichCardMedia *)IMRichCardMedia.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  sub_1A0999660();

  uint64_t v3 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A09F4588();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = IMRichCardMedia.isEqual(_:)((uint64_t)v8);

  sub_1A0783C7C((uint64_t)v8);
  return v6 & 1;
}

- (IMRichCardMedia)init
{
  result = (IMRichCardMedia *)_swift_stdlib_reportUnimplementedInitializer();
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