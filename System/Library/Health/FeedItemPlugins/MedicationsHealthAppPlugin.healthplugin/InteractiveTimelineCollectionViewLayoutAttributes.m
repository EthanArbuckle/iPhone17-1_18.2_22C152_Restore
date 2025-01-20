@interface InteractiveTimelineCollectionViewLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (_TtC26MedicationsHealthAppPlugin49InteractiveTimelineCollectionViewLayoutAttributes)init;
- (id)copyWithZone:(void *)a3;
@end

@implementation InteractiveTimelineCollectionViewLayoutAttributes

- (id)copyWithZone:(void *)a3
{
  v4 = self;
  sub_241145758((uint64_t)a3, v7);

  sub_24101A6BC(v7, v7[3]);
  v5 = (void *)sub_241161880();
  sub_24101F178((uint64_t)v7);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2411614D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  unsigned __int8 v6 = sub_2411458A8((uint64_t)v8);

  sub_24104D52C((uint64_t)v8);
  return v6 & 1;
}

- (_TtC26MedicationsHealthAppPlugin49InteractiveTimelineCollectionViewLayoutAttributes)init
{
  v3 = (char *)self
     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin49InteractiveTimelineCollectionViewLayoutAttributes_configuration;
  uint64_t v4 = *MEMORY[0x263F83588];
  id v5 = objc_allocWithZone(MEMORY[0x263F82770]);
  unsigned __int8 v6 = self;
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
  v9.super_class = (Class)type metadata accessor for InteractiveTimelineCollectionViewLayoutAttributes();
  return [(UICollectionViewLayoutAttributes *)&v9 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super._size.height
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin49InteractiveTimelineCollectionViewLayoutAttributes_configuration));
}

@end