@interface MUPlacePhotoObfuscationView
- (MUPlacePhotoObfuscationView)initWithCoder:(id)a3;
- (MUPlacePhotoObfuscationView)initWithFrame:(CGRect)a3;
- (NSAttributedString)attributedText;
- (void)setAttributedText:(id)a3;
@end

@implementation MUPlacePhotoObfuscationView

- (NSAttributedString)attributedText
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUPlacePhotoObfuscationView_attributedText);
  swift_beginAccess();
  return (NSAttributedString *)*v2;
}

- (void)setAttributedText:(id)a3
{
  v5 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUPlacePhotoObfuscationView_attributedText);
  swift_beginAccess();
  id v6 = *v5;
  id *v5 = a3;
  id v7 = a3;
  v8 = self;

  objc_msgSend(*(id *)((char *)&v8->super.super.super.isa + OBJC_IVAR___MUPlacePhotoObfuscationView_label), sel_setAttributedText_, *v5);
}

- (MUPlacePhotoObfuscationView)initWithFrame:(CGRect)a3
{
  PlacePhotoObfuscationView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (MUPlacePhotoObfuscationView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUPlacePhotoObfuscationView_attributedText) = 0;
  id v4 = a3;

  result = (MUPlacePhotoObfuscationView *)sub_1933417B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MUPlacePhotoObfuscationView_label);
}

@end