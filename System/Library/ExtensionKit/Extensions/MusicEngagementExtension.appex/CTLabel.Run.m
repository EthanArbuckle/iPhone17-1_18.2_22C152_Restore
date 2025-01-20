@interface CTLabel.Run
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCO14MusicUtilities7CTLabel3Run)initWithCoder:(id)a3;
- (_TtCO14MusicUtilities7CTLabel3Run)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation CTLabel.Run

- (_TtCO14MusicUtilities7CTLabel3Run)initWithCoder:(id)a3
{
  result = (_TtCO14MusicUtilities7CTLabel3Run *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCO14MusicUtilities7CTLabel3Run_size);
  double v4 = *(double *)&self->ctRun[OBJC_IVAR____TtCO14MusicUtilities7CTLabel3Run_size];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double v3 = self;
  specialized CTLabel.Run.draw(_:)();
}

- (_TtCO14MusicUtilities7CTLabel3Run)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
}

@end