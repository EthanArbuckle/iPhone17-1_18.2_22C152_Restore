@interface PKHandwritingFeedbackActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)title;
- (PKHandwritingFeedbackActivity)initWithBlock:(id)a3;
- (UIImage)image;
- (id)activityType;
- (id)block;
- (void)performActivity;
- (void)setBlock:(id)a3;
- (void)setImage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKHandwritingFeedbackActivity

- (PKHandwritingFeedbackActivity)initWithBlock:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKHandwritingFeedbackActivity;
  id v3 = a3;
  v4 = [(UIActivity *)&v9 init];
  v5 = _PencilKitBundle();
  v6 = objc_msgSend(v5, "localizedStringForKey:value:table:", @"Handwriting Feedback", @"Handwriting Feedback", @"Localizable", v9.receiver, v9.super_class);
  [(PKHandwritingFeedbackActivity *)v4 setTitle:v6];

  [(PKHandwritingFeedbackActivity *)v4 setBlock:v3];
  v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.bubble"];
  [(PKHandwritingFeedbackActivity *)v4 setImage:v7];

  return v4;
}

- (id)activityType
{
  return @"com.apple.pencilkit.handwritingfeedback";
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  v2 = [(PKHandwritingFeedbackActivity *)self block];
  v2[2]();
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong(&self->_block, 0);
}

@end