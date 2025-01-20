@interface DOCGoToNoResultsView
- (_TtC11SaveToFilesP33_761F1A5B3C97BD752A060DF95FF50AFF20DOCGoToNoResultsView)initWithCoder:(id)a3;
- (_TtC11SaveToFilesP33_761F1A5B3C97BD752A060DF95FF50AFF20DOCGoToNoResultsView)initWithFrame:(CGRect)a3;
- (_TtC11SaveToFilesP33_761F1A5B3C97BD752A060DF95FF50AFF20DOCGoToNoResultsView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5;
- (_TtC11SaveToFilesP33_761F1A5B3C97BD752A060DF95FF50AFF20DOCGoToNoResultsView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5 includeBackdrop:(BOOL)a6;
- (double)_labelAlpha;
@end

@implementation DOCGoToNoResultsView

- (double)_labelAlpha
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCGoToNoResultsView();
  [(DOCGoToNoResultsView *)&v4 _labelAlpha];
  return v2 * 0.5;
}

- (_TtC11SaveToFilesP33_761F1A5B3C97BD752A060DF95FF50AFF20DOCGoToNoResultsView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4)
  {
    sub_1004D1240();
    NSString v11 = sub_1004D1200();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v11 = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for DOCGoToNoResultsView();
  v12 = -[DOCGoToNoResultsView initWithFrame:title:style:](&v14, "initWithFrame:title:style:", v11, a5, x, y, width, height);

  if (v12) {
  return v12;
  }
}

- (_TtC11SaveToFilesP33_761F1A5B3C97BD752A060DF95FF50AFF20DOCGoToNoResultsView)initWithFrame:(CGRect)a3 title:(id)a4 style:(unint64_t)a5 includeBackdrop:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4)
  {
    sub_1004D1240();
    NSString v13 = sub_1004D1200();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v13 = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for DOCGoToNoResultsView();
  objc_super v14 = -[DOCGoToNoResultsView initWithFrame:title:style:includeBackdrop:](&v16, "initWithFrame:title:style:includeBackdrop:", v13, a5, v6, x, y, width, height);

  if (v14) {
  return v14;
  }
}

- (_TtC11SaveToFilesP33_761F1A5B3C97BD752A060DF95FF50AFF20DOCGoToNoResultsView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCGoToNoResultsView();
  return -[DOCGoToNoResultsView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC11SaveToFilesP33_761F1A5B3C97BD752A060DF95FF50AFF20DOCGoToNoResultsView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCGoToNoResultsView();
  return [(DOCGoToNoResultsView *)&v5 initWithCoder:a3];
}

@end