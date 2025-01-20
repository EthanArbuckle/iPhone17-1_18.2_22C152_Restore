@interface PlatformView
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBecomeFocused;
- (_TtC11CalculateUIP33_B02995F901750D8E8BCF7362F91ACDD912PlatformView)initWithCoder:(id)a3;
- (_TtC11CalculateUIP33_B02995F901750D8E8BCF7362F91ACDD912PlatformView)initWithFrame:(CGRect)a3;
@end

@implementation PlatformView

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (_TtC11CalculateUIP33_B02995F901750D8E8BCF7362F91ACDD912PlatformView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PlatformView();
  return -[PlatformView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (_TtC11CalculateUIP33_B02995F901750D8E8BCF7362F91ACDD912PlatformView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlatformView();
  return [(PlatformView *)&v5 initWithCoder:a3];
}

@end