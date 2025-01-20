@interface SLGoogleWebAuthController
- (SLGoogleWebAuthController)initWithAccount:(id)a3 accountStore:(id)a4 presentationBlock:(id)a5;
- (SLGoogleWebAuthController)initWithAccountDescription:(id)a3 presentationBlock:(id)a4;
- (SLGoogleWebAuthController)initWithNibName:(id)a3 bundle:(id)a4;
- (SLGoogleWebAuthController)initWithYouTubeUsername:(id)a3 accountDescription:(id)a4 presentationBlock:(id)a5;
- (id)completion;
- (void)setCompletion:(id)a3;
@end

@implementation SLGoogleWebAuthController

- (SLGoogleWebAuthController)initWithAccountDescription:(id)a3 presentationBlock:(id)a4
{
  return 0;
}

- (SLGoogleWebAuthController)initWithAccount:(id)a3 accountStore:(id)a4 presentationBlock:(id)a5
{
  return 0;
}

- (SLGoogleWebAuthController)initWithYouTubeUsername:(id)a3 accountDescription:(id)a4 presentationBlock:(id)a5
{
  return 0;
}

- (SLGoogleWebAuthController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end