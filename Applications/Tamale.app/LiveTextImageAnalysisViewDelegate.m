@interface LiveTextImageAnalysisViewDelegate
- (CGRect)contentsRectForImageAnalysisInteraction:(id)a3;
- (_TtC6Tamale33LiveTextImageAnalysisViewDelegate)init;
- (id)contentImageForImageAnalysisInteraction:(id)a3;
- (id)contentViewForImageAnalysisInteraction:(id)a3;
- (void)quickActionProcessingCompleteForImageAnalysisInteraction:(id)a3;
@end

@implementation LiveTextImageAnalysisViewDelegate

- (CGRect)contentsRectForImageAnalysisInteraction:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC6Tamale33LiveTextImageAnalysisViewDelegate_frame;
  swift_beginAccess();
  sub_10000FB74((uint64_t)v5, (uint64_t)v16, &qword_100518A80);
  memset(v19, 0, sizeof(v19));
  char v20 = 1;
  id v6 = a3;
  v7 = self;
  sub_10030B414(v6, (uint64_t)v16, (uint64_t)v19, (uint64_t)v18);
  double v8 = *(double *)v18;
  double v9 = *(double *)&v18[1];
  double v10 = *(double *)&v18[2];
  double v11 = *(double *)&v18[3];
  sub_10000FBD8((uint64_t)v16, &qword_100518A80);

  sub_10000FC34((uint64_t)v18, (uint64_t)v16, (uint64_t *)&unk_100518AE0);
  double v12 = 0.0;
  if (v17) {
    double v13 = 1.0;
  }
  else {
    double v13 = v10;
  }
  if (v17) {
    double v14 = 1.0;
  }
  else {
    double v14 = v11;
  }
  if (v17) {
    double v15 = 0.0;
  }
  else {
    double v15 = v8;
  }
  if ((v17 & 1) == 0) {
    double v12 = v9;
  }
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v15;
  return result;
}

- (void)quickActionProcessingCompleteForImageAnalysisInteraction:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_10000AE84(v5);
}

- (id)contentViewForImageAnalysisInteraction:(id)a3
{
  return 0;
}

- (id)contentImageForImageAnalysisInteraction:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC6Tamale33LiveTextImageAnalysisViewDelegate_contentImage));
}

- (_TtC6Tamale33LiveTextImageAnalysisViewDelegate)init
{
  v3 = (char *)self + OBJC_IVAR____TtC6Tamale33LiveTextImageAnalysisViewDelegate_frame;
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6Tamale33LiveTextImageAnalysisViewDelegate_contentImage) = 0;
  swift_weakInit();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LiveTextImageAnalysisViewDelegate();
  return [(LiveTextImageAnalysisViewDelegate *)&v5 init];
}

- (void).cxx_destruct
{
  sub_10000FBD8((uint64_t)self + OBJC_IVAR____TtC6Tamale33LiveTextImageAnalysisViewDelegate_frame, &qword_100518A80);

  swift_weakDestroy();
}

@end