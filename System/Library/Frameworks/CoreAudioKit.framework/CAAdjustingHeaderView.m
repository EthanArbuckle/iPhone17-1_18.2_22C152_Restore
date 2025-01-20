@interface CAAdjustingHeaderView
- (_TtC12CoreAudioKit21CAAdjustingHeaderView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit21CAAdjustingHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation CAAdjustingHeaderView

- (_TtC12CoreAudioKit21CAAdjustingHeaderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CAAdjustingHeaderView();
  return -[CAAUEQHeaderView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12CoreAudioKit21CAAdjustingHeaderView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAAdjustingHeaderView();
  return [(CAAUEQHeaderView *)&v5 initWithCoder:a3];
}

@end