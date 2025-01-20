@interface ICThumbnailKey
+ (NSString)recentObjectId;
- (BOOL)isEqual:(id)a3;
- (ICThumbnailKey)init;
- (ICThumbnailKey)initWithAccountId:(id)a3 objectId:(id)a4;
- (ICThumbnailKey)initWithAccountId:(id)a3 objectId:(id)a4 thumbnailId:(id)a5;
- (ICThumbnailKey)initWithType:(int64_t)a3 accountId:(id)a4 objectId:(id)a5 preferredSize:(CGSize)a6 scale:(double)a7 appearance:(unint64_t)a8;
- (ICThumbnailKey)initWithType:(int64_t)a3 accountId:(id)a4 objectId:(id)a5 preferredSize:(CGSize)a6 scale:(double)a7 appearance:(unint64_t)a8 isRTL:(BOOL)a9 contentSizeCategory:(id)a10 hasBoldText:(BOOL)a11 hasButtonShapes:(BOOL)a12 hasDarkerSystemColors:(BOOL)a13 hasBorder:(BOOL)a14;
- (ICThumbnailKey)initWithType:(int64_t)a3 accountId:(id)a4 objectId:(id)a5 preferredSize:(CGSize)a6 traitCollection:(id)a7;
- (NSString)accountId;
- (NSString)description;
- (NSString)objectId;
- (NSString)thumbnailId;
- (NSURL)containerUrl;
- (NSURL)descriptionUrl;
- (NSURL)imageUrl;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
@end

@implementation ICThumbnailKey

+ (NSString)recentObjectId
{
  v2 = (void *)sub_2405CE208();
  return (NSString *)v2;
}

- (NSString)accountId
{
  return (NSString *)sub_2405C9640((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICThumbnailKey_accountId);
}

- (NSString)objectId
{
  return (NSString *)sub_2405C9640((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICThumbnailKey_objectId);
}

- (NSString)thumbnailId
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2405CE208();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (ICThumbnailKey)initWithAccountId:(id)a3 objectId:(id)a4 thumbnailId:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (!a3)
  {
    v10 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  a3 = (id)sub_2405CE218();
  v10 = v9;
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  a4 = (id)sub_2405CE218();
  v12 = v11;
LABEL_6:
  uint64_t v13 = sub_2405CE218();
  v14 = (id *)((char *)&self->super.isa + OBJC_IVAR___ICThumbnailKey_accountId);
  id *v14 = a3;
  v14[1] = v10;
  v15 = (id *)((char *)&self->super.isa + OBJC_IVAR___ICThumbnailKey_objectId);
  id *v15 = a4;
  v15[1] = v12;
  v16 = (uint64_t *)((char *)self + OBJC_IVAR___ICThumbnailKey_thumbnailId);
  uint64_t *v16 = v13;
  v16[1] = v17;
  v19.receiver = self;
  v19.super_class = ObjectType;
  return [(ICThumbnailKey *)&v19 init];
}

- (ICThumbnailKey)initWithAccountId:(id)a3 objectId:(id)a4
{
  if (!a3)
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    uint64_t v10 = 0;
    return (ICThumbnailKey *)ThumbnailKey.init(accountId:objectId:)(v5, v7, v8, v10);
  }
  uint64_t v5 = sub_2405CE218();
  uint64_t v7 = v6;
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = sub_2405CE218();
  uint64_t v10 = v9;
  return (ICThumbnailKey *)ThumbnailKey.init(accountId:objectId:)(v5, v7, v8, v10);
}

- (ICThumbnailKey)initWithType:(int64_t)a3 accountId:(id)a4 objectId:(id)a5 preferredSize:(CGSize)a6 scale:(double)a7 appearance:(unint64_t)a8 isRTL:(BOOL)a9 contentSizeCategory:(id)a10 hasBoldText:(BOOL)a11 hasButtonShapes:(BOOL)a12 hasDarkerSystemColors:(BOOL)a13 hasBorder:(BOOL)a14
{
  double height = a6.height;
  double width = a6.width;
  uint64_t v18 = (uint64_t)a5;
  if (a4)
  {
    v20 = (void *)sub_2405CE218();
    uint64_t v22 = v21;
    if (v18)
    {
LABEL_3:
      uint64_t v18 = sub_2405CE218();
      uint64_t v24 = v23;
      goto LABEL_6;
    }
  }
  else
  {
    v20 = 0;
    uint64_t v22 = 0;
    if (a5) {
      goto LABEL_3;
    }
  }
  uint64_t v24 = 0;
LABEL_6:
  if (a10)
  {
    uint64_t v25 = sub_2405CE218();
    uint64_t v27 = v26;
  }
  else
  {
    uint64_t v25 = 0;
    uint64_t v27 = 0;
  }
  return (ICThumbnailKey *)sub_2405CCDC8(a3, v20, v22, v18, v24, a8, v25, v27, width, height, a7, a11, a13, a14);
}

- (ICThumbnailKey)initWithType:(int64_t)a3 accountId:(id)a4 objectId:(id)a5 preferredSize:(CGSize)a6 scale:(double)a7 appearance:(unint64_t)a8
{
  double height = a6.height;
  double width = a6.width;
  if (!a4)
  {
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v17 = 0;
    uint64_t v19 = 0;
    return (ICThumbnailKey *)ThumbnailKey.init(type:accountId:objectId:preferredSize:scale:appearance:)(a3, width, height, a7, v14, v16, v17, v19, a8);
  }
  uint64_t v14 = sub_2405CE218();
  uint64_t v16 = v15;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v17 = sub_2405CE218();
  uint64_t v19 = v18;
  return (ICThumbnailKey *)ThumbnailKey.init(type:accountId:objectId:preferredSize:scale:appearance:)(a3, width, height, a7, v14, v16, v17, v19, a8);
}

- (ICThumbnailKey)initWithType:(int64_t)a3 accountId:(id)a4 objectId:(id)a5 preferredSize:(CGSize)a6 traitCollection:(id)a7
{
  double height = a6.height;
  double width = a6.width;
  uint64_t v10 = (uint64_t)a5;
  if (!a4)
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v16 = 0;
    return (ICThumbnailKey *)ThumbnailKey.init(type:accountId:objectId:preferredSize:traitCollection:)(a3, width, height, v12, v14, v10, v16, a7);
  }
  uint64_t v12 = sub_2405CE218();
  uint64_t v14 = v13;
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v10 = sub_2405CE218();
  uint64_t v16 = v15;
  return (ICThumbnailKey *)ThumbnailKey.init(type:accountId:objectId:preferredSize:traitCollection:)(a3, width, height, v12, v14, v10, v16, a7);
}

- (NSString)description
{
  v2 = self;
  ThumbnailKey.description.getter();

  v3 = (void *)sub_2405CE208();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2405CE258();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = ThumbnailKey.isEqual(_:)((uint64_t)v8);

  sub_2405CBE0C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = ThumbnailKey.hash.getter();

  return v3;
}

- (id)copyWithZone:(void *)a3
{
  int64_t v3 = self;
  ThumbnailKey.copy(with:)(v6);

  sub_2405CD514(v6, v6[3]);
  v4 = (void *)sub_2405CE2C8();
  sub_2405CD558((uint64_t)v6);
  return v4;
}

- (NSURL)containerUrl
{
  uint64_t v3 = sub_2405CE1C8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = self;
  sub_2405CAA98((uint64_t)v6);

  uint64_t v8 = (void *)sub_2405CE188();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSURL *)v8;
}

- (NSURL)descriptionUrl
{
  return (NSURL *)sub_2405CAEE8(self, (uint64_t)a2, MEMORY[0x263F8F388]);
}

- (NSURL)imageUrl
{
  return (NSURL *)sub_2405CAEE8(self, (uint64_t)a2, MEMORY[0x263F8F380]);
}

- (ICThumbnailKey)init
{
  result = (ICThumbnailKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end