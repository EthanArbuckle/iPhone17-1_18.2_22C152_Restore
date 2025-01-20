@interface AAUIWalrusRecoveryContactRemovedScreenModel
- (AAUIWalrusRecoveryContactRemovedScreenModel)initWithHasRecoveryContact:(BOOL)a3 hasRecoveryKey:(BOOL)a4;
- (UIImage)image;
- (UIView)contentView;
- (UIView)secondaryView;
- (int64_t)contentViewLayout;
- (void)setContentView:(id)a3;
- (void)setContentViewLayout:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setSecondaryView:(id)a3;
@end

@implementation AAUIWalrusRecoveryContactRemovedScreenModel

- (AAUIWalrusRecoveryContactRemovedScreenModel)initWithHasRecoveryContact:(BOOL)a3 hasRecoveryKey:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)AAUIWalrusRecoveryContactRemovedScreenModel;
  result = [(AAWalrusRecoveryContactRemovedScreenModel *)&v5 initWithHasRecoveryContact:a3 hasRecoveryKey:a4];
  if (result) {
    result->_contentViewLayout = 2;
  }
  return result;
}

- (int64_t)contentViewLayout
{
  return self->_contentViewLayout;
}

- (void)setContentViewLayout:(int64_t)a3
{
  self->_contentViewLayout = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (void)setSecondaryView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end