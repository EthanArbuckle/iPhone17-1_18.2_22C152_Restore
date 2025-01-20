@interface NTKGladiusQuad
- (BOOL)prepareForTime:(double)a3;
- (_TtC29NTKGladiusFaceBundleCompanion14NTKGladiusQuad)init;
- (_TtC29NTKGladiusFaceBundleCompanion14NTKGladiusQuad)initWithDevice:(id)a3 stretchySecondHandData:(id)a4;
- (void)purge;
- (void)renderForDisplayWithEncoder:(id)a3;
- (void)setColor:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setShadowDensity:(double)a3;
- (void)setupForQuadView:(id)a3;
@end

@implementation NTKGladiusQuad

- (_TtC29NTKGladiusFaceBundleCompanion14NTKGladiusQuad)initWithDevice:(id)a3 stretchySecondHandData:(id)a4
{
  *(void *)&self->CLKUIQuad_opaque[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion14NTKGladiusQuad_renderer] = 0;
  v7 = &self->CLKUIQuad_opaque[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion14NTKGladiusQuad_dateOverride];
  uint64_t v8 = type metadata accessor for GladiusUtilities.DateOverride();
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  [v9 screenBounds];
  v12 = &v11->CLKUIQuad_opaque[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion14NTKGladiusQuad_screenSize];
  *(void *)v12 = v13;
  *((void *)v12 + 1) = v14;
  swift_unknownObjectUnownedInit();

  v17.receiver = v11;
  v17.super_class = (Class)type metadata accessor for NTKGladiusQuad();
  v15 = [(NTKGladiusQuad *)&v17 init];

  return v15;
}

- (void)setupForQuadView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_CC6C();
}

- (void)purge
{
  *(void *)&self->CLKUIQuad_opaque[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion14NTKGladiusQuad_renderer] = 0;
  swift_release();
}

- (void)setColor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_C620(v4);
}

- (void)setShadowDensity:(double)a3
{
  uint64_t v3 = *(void *)&self->CLKUIQuad_opaque[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion14NTKGladiusQuad_renderer];
  if (v3)
  {
    float v4 = a3;
    *(float *)(v3 + 128) = v4;
  }
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  uint64_t v7 = sub_BE38((uint64_t *)&unk_2A5A0);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  id v10 = &v23[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  v12 = &v23[-v11];
  uint64_t v13 = sub_BE38(&qword_2A3E8);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  v16 = &v23[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v14);
  v18 = &v23[-v17];
  if (a3)
  {
    sub_14E50();
    uint64_t v19 = sub_14E60();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 0, 1, v19);
  }
  else
  {
    uint64_t v20 = sub_14E60();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v18, 1, 1, v20);
  }
  v21 = &self->CLKUIQuad_opaque[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion14NTKGladiusQuad_dateOverride];
  swift_beginAccess();
  sub_D0FC((uint64_t)v21, (uint64_t)v10, (uint64_t *)&unk_2A5A0);
  sub_D0FC((uint64_t)v18, (uint64_t)v16, &qword_2A3E8);
  v22 = self;
  sub_D9F0((uint64_t)v10, (uint64_t)v16, (uint64_t)v12, a4);
  swift_beginAccess();
  sub_D094((uint64_t)v12, (uint64_t)v21);
  swift_endAccess();

  sub_D160((uint64_t)v18, &qword_2A3E8);
}

- (BOOL)prepareForTime:(double)a3
{
  uint64_t v3 = self;
  char v4 = sub_CEB0();

  return v4 & 1;
}

- (void)renderForDisplayWithEncoder:(id)a3
{
  if (*(void *)&self->CLKUIQuad_opaque[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion14NTKGladiusQuad_renderer])
  {
    swift_unknownObjectRetain();
    v5 = self;
    swift_retain();
    sub_14A6C(a3);
    swift_unknownObjectRelease();

    swift_release();
  }
}

- (_TtC29NTKGladiusFaceBundleCompanion14NTKGladiusQuad)init
{
  result = (_TtC29NTKGladiusFaceBundleCompanion14NTKGladiusQuad *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end