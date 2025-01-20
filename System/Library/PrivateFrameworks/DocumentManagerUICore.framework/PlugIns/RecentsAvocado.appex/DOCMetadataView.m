@interface DOCMetadataView
+ (Class)layerClass;
- (BOOL)showsItemLocation;
- (BOOL)showsSeparators;
- (NSArray)nodes;
- (_TtC14RecentsAvocado15DOCMetadataView)init;
- (_TtC14RecentsAvocado15DOCMetadataView)initWithFrame:(CGRect)a3;
- (double)columnWidth;
- (int64_t)levelOfDetail;
- (void)didMoveToWindow;
- (void)setColumnWidth:(double)a3;
- (void)setLevelOfDetail:(int64_t)a3;
- (void)setNodes:(id)a3;
- (void)setShowsItemLocation:(BOOL)a3;
- (void)setShowsSeparators:(BOOL)a3;
@end

@implementation DOCMetadataView

- (NSArray)nodes
{
  swift_bridgeObjectRetain();
  sub_100031648(&qword_1006274C0);
  v2.super.isa = sub_1004CDE10().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (void)setNodes:(id)a3
{
  sub_100031648(&qword_1006274C0);
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC14RecentsAvocado15DOCMetadataView_nodes) = (Class)sub_1004CDE30();
  v4 = self;
  swift_bridgeObjectRelease();
  sub_10029C968();
}

- (BOOL)showsItemLocation
{
  return *((unsigned char *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC14RecentsAvocado15DOCMetadataView_showsItemLocation);
}

- (void)setShowsItemLocation:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC14RecentsAvocado15DOCMetadataView_showsItemLocation);
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC14RecentsAvocado15DOCMetadataView_showsItemLocation) = a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_10029C968();
  }
}

- (BOOL)showsSeparators
{
  return *((unsigned char *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC14RecentsAvocado15DOCMetadataView_showsSeparators);
}

- (void)setShowsSeparators:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_10029AE60(v3);
}

- (double)columnWidth
{
  return *(double *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC14RecentsAvocado15DOCMetadataView_columnWidth);
}

- (void)setColumnWidth:(double)a3
{
  v4 = self;
  sub_10029AFE4(a3);
}

+ (Class)layerClass
{
  sub_1000333C8(0, (unint64_t *)&unk_100631760);
  return (Class)swift_getObjCClassFromMetadata();
}

- (int64_t)levelOfDetail
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC14RecentsAvocado15DOCMetadataView_levelOfDetail);
}

- (void)setLevelOfDetail:(int64_t)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC14RecentsAvocado15DOCMetadataView_levelOfDetail);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC14RecentsAvocado15DOCMetadataView_levelOfDetail) = (Class)a3;
  v4 = self;
  sub_10029B2B4(v3);
}

- (_TtC14RecentsAvocado15DOCMetadataView)init
{
  if (qword_100626900 != -1) {
    swift_once();
  }
  id v2 = objc_allocWithZone((Class)type metadata accessor for DOCMetadataView());
  uint64_t v3 = swift_bridgeObjectRetain();
  v4 = sub_10029B4EC(v3, 0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC14RecentsAvocado15DOCMetadataView *)v4;
}

- (void)didMoveToWindow
{
  id v2 = self;
  sub_10029B790();
}

- (_TtC14RecentsAvocado15DOCMetadataView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1000391D4((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado15DOCMetadataView_metadataViewDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC14RecentsAvocado15DOCMetadataView_configuration);
}

@end