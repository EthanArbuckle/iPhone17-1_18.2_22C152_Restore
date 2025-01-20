@interface AnnotationImagesView.AnnotationImageView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCC18ASMessagesProvider20AnnotationImagesViewP33_7E26EFE86DF813551E1A112C8B4B7F0F19AnnotationImageView)initWithCoder:(id)a3;
- (_TtCC18ASMessagesProvider20AnnotationImagesViewP33_7E26EFE86DF813551E1A112C8B4B7F0F19AnnotationImageView)initWithFrame:(CGRect)a3;
- (_TtCC18ASMessagesProvider20AnnotationImagesViewP33_7E26EFE86DF813551E1A112C8B4B7F0F19AnnotationImageView)initWithImage:(id)a3;
- (_TtCC18ASMessagesProvider20AnnotationImagesViewP33_7E26EFE86DF813551E1A112C8B4B7F0F19AnnotationImageView)initWithImage:(id)a3 highlightedImage:(id)a4;
@end

@implementation AnnotationImagesView.AnnotationImageView

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(AnnotationImagesView.AnnotationImageView *)self frame];
  double v4 = v3;
  double v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (_TtCC18ASMessagesProvider20AnnotationImagesViewP33_7E26EFE86DF813551E1A112C8B4B7F0F19AnnotationImageView)initWithImage:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(AnnotationImagesView.AnnotationImageView *)&v5 initWithImage:a3];
}

- (_TtCC18ASMessagesProvider20AnnotationImagesViewP33_7E26EFE86DF813551E1A112C8B4B7F0F19AnnotationImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(AnnotationImagesView.AnnotationImageView *)&v7 initWithImage:a3 highlightedImage:a4];
}

- (_TtCC18ASMessagesProvider20AnnotationImagesViewP33_7E26EFE86DF813551E1A112C8B4B7F0F19AnnotationImageView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[AnnotationImagesView.AnnotationImageView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC18ASMessagesProvider20AnnotationImagesViewP33_7E26EFE86DF813551E1A112C8B4B7F0F19AnnotationImageView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(AnnotationImagesView.AnnotationImageView *)&v5 initWithCoder:a3];
}

@end