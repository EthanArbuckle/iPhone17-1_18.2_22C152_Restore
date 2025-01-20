@interface ParmesanPlaceholderComposition
- (BOOL)isEqual:(id)a3;
- (int64_t)hash;
@end

@implementation ParmesanPlaceholderComposition

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_246BD9164();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_246C2D1F8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v5 = self;
  }
  sub_246BB75D0((uint64_t)v11, (uint64_t)v9, &qword_2691D69A0);
  if (!v10)
  {
    sub_246B8EA34((uint64_t)v9, &qword_2691D69A0);
    goto LABEL_8;
  }
  type metadata accessor for ParmesanPlaceholderComposition();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    char v6 = 0;
    goto LABEL_9;
  }
  char v6 = sub_246BD9A5C((uint64_t)self, (uint64_t)v8);

LABEL_9:
  sub_246B8EA34((uint64_t)v11, &qword_2691D69A0);
  return v6 & 1;
}

- (void).cxx_destruct
{
  int64_t v3 = (char *)self + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion30ParmesanPlaceholderComposition_layoutImageURL;
  uint64_t v4 = sub_246C2BB98();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_246B8EA34((uint64_t)self + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion30ParmesanPlaceholderComposition_layoutMaskImageURL, &qword_2691D7038);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion30ParmesanPlaceholderComposition__layoutMask));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion30ParmesanPlaceholderComposition__layoutImage));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion30ParmesanPlaceholderComposition__cachedImageAnalysis));
  v5 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion30ParmesanPlaceholderComposition__layoutMaskImage);
}

@end