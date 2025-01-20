@interface NTKParmesanGalleryPlaceholderDataSource
+ (NSArray)placeholderNames;
+ (NSString)heroPlaceholderName;
+ (NSString)placeholderCustomDataKey;
+ (NSString)randomPlaceholderName;
+ (id)configurationForName:(id)a3;
- (NTKParmesanGalleryPlaceholderDataSource)init;
@end

@implementation NTKParmesanGalleryPlaceholderDataSource

- (NTKParmesanGalleryPlaceholderDataSource)init
{
  *(void *)&self->delegate[OBJC_IVAR___NTKParmesanGalleryPlaceholderDataSource_delegate] = 0;
  swift_unknownObjectWeakInit();
  v3 = (char *)self + OBJC_IVAR___NTKParmesanGalleryPlaceholderDataSource_contentOption;
  *(void *)v3 = 0;
  v3[8] = 1;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanGalleryPlaceholderDataSource_forcedPlaceholderName);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKParmesanGalleryPlaceholderDataSource____lazy_storage___faceBundle) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ParmesanGalleryPlaceholderDataSource();
  return [(NTKParmesanGalleryPlaceholderDataSource *)&v6 init];
}

- (void).cxx_destruct
{
  sub_246B98F78((uint64_t)self + OBJC_IVAR___NTKParmesanGalleryPlaceholderDataSource_delegate);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___NTKParmesanGalleryPlaceholderDataSource____lazy_storage___faceBundle);
}

+ (NSString)placeholderCustomDataKey
{
  v2 = (void *)sub_246C2CC08();

  return (NSString *)v2;
}

+ (NSString)heroPlaceholderName
{
  v2 = (void *)sub_246C2CC08();

  return (NSString *)v2;
}

+ (NSString)randomPlaceholderName
{
  sub_246BF58F0();
  v2 = (void *)sub_246C2CC08();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

+ (NSArray)placeholderNames
{
  sub_246BF59B8();
  v2 = (void *)sub_246C2CD28();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

+ (id)configurationForName:(id)a3
{
  sub_246C2CC48();
  swift_bridgeObjectRetain();
  char v3 = sub_246BBD030();
  if (v3 == 6) {
    char v4 = 0;
  }
  else {
    char v4 = v3;
  }
  v5 = (objc_class *)type metadata accessor for ParmesanGalleryPlaceholderConfiguration();
  objc_super v6 = objc_allocWithZone(v5);
  v6[OBJC_IVAR___NTKParmesanGalleryPlaceholderConfiguration_placeholderStyle] = v4;
  v9.receiver = v6;
  v9.super_class = v5;
  id v7 = objc_msgSendSuper2(&v9, sel_init);
  swift_bridgeObjectRelease();

  return v7;
}

@end