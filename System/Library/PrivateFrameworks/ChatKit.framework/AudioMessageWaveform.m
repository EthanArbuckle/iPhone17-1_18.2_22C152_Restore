@interface AudioMessageWaveform
- (BOOL)isOpaque;
- (_TtC7ChatKit20AudioMessageWaveform)initWithCoder:(id)a3;
- (_TtC7ChatKit20AudioMessageWaveform)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation AudioMessageWaveform

- (BOOL)isOpaque
{
  return 0;
}

- (_TtC7ChatKit20AudioMessageWaveform)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit20AudioMessageWaveform *)sub_18F5046E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7ChatKit20AudioMessageWaveform)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18F505024();
}

- (void)drawRect:(CGRect)a3
{
  id v3 = self;
  sub_18F505124();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit20AudioMessageWaveform_audioMediaObject));

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit20AudioMessageWaveform_cachedColor);
}

@end