@interface SSSBetaFeedbackActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)title;
- (SSSBetaFeedbackActivity)initWithBlock:(id)a3;
- (UIImage)image;
- (id)activityType;
- (id)block;
- (void)performActivity;
- (void)setBlock:(id)a3;
- (void)setImage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SSSBetaFeedbackActivity

- (SSSBetaFeedbackActivity)initWithBlock:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SSSBetaFeedbackActivity;
  id v3 = a3;
  v4 = [(SSSBetaFeedbackActivity *)&v11 init];
  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"SHARE_BETA_FEEDBACK_SHARESHEET" value:@"Share Beta Feedback" table:0];
  [(SSSBetaFeedbackActivity *)v4 setTitle:v6];

  [(SSSBetaFeedbackActivity *)v4 setBlock:v3];
  v7 = +[UIImage systemImageNamed:@"square.and.pencil"];
  v8 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleTitle2 scale:2];
  v9 = [v7 imageWithSymbolConfiguration:v8];
  [(SSSBetaFeedbackActivity *)v4 setImage:v9];

  return v4;
}

- (id)activityType
{
  return @"com.apple.screenshotservicesservice.betafeedback";
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  v2 = [(SSSBetaFeedbackActivity *)self block];
  v2[2]();
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

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end