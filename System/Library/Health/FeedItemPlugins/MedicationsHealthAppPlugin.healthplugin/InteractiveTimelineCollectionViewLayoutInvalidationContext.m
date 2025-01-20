@interface InteractiveTimelineCollectionViewLayoutInvalidationContext
- (NSString)description;
- (_TtC26MedicationsHealthAppPlugin58InteractiveTimelineCollectionViewLayoutInvalidationContext)init;
@end

@implementation InteractiveTimelineCollectionViewLayoutInvalidationContext

- (NSString)description
{
  v2 = self;
  sub_24106E6DC();

  v3 = (void *)sub_2411606F0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC26MedicationsHealthAppPlugin58InteractiveTimelineCollectionViewLayoutInvalidationContext)init
{
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC26MedicationsHealthAppPlugin58InteractiveTimelineCollectionViewLayoutInvalidationContext_invalidateItemHeight) = 0;
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC26MedicationsHealthAppPlugin58InteractiveTimelineCollectionViewLayoutInvalidationContext_invalidateSizeClass) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin58InteractiveTimelineCollectionViewLayoutInvalidationContext_updatedHorizontalWidth) = (Class)0x4075E00000000000;
  v3 = (char *)self
     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin58InteractiveTimelineCollectionViewLayoutInvalidationContext_nextConfig;
  uint64_t v4 = *MEMORY[0x263F83588];
  id v5 = objc_allocWithZone(MEMORY[0x263F82770]);
  v6 = self;
  id v7 = objc_msgSend(v5, sel_initForTextStyle_, v4);
  *(_OWORD *)v3 = xmmword_24116BAA0;
  *((_OWORD *)v3 + 1) = xmmword_24116BA90;
  *((int64x2_t *)v3 + 2) = vdupq_n_s64(0x4041000000000000uLL);
  *((void *)v3 + 6) = 0;
  *((void *)v3 + 7) = v7;
  *((_OWORD *)v3 + 4) = xmmword_24116BA80;
  *((void *)v3 + 10) = 0;
  *((void *)v3 + 11) = 27;

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for InteractiveTimelineCollectionViewLayoutInvalidationContext();
  return [(InteractiveTimelineCollectionViewLayoutInvalidationContext *)&v9 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super._reorderingTarget.x
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin58InteractiveTimelineCollectionViewLayoutInvalidationContext_nextConfig));
}

@end