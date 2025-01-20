@interface AAUIOBInheritanceInviteMessageViewModel
- (AAUIOBInheritanceInviteMessageViewModel)initWithBeneficiaryName:(id)a3;
- (AAUIOBInheritanceInviteMessageViewModel)initWithType:(unint64_t)a3 recipientHandle:(id)a4;
- (UIImage)image;
- (UIView)contentView;
- (UIView)secondaryView;
- (int64_t)contentViewLayout;
- (void)setContentView:(id)a3;
- (void)setContentViewLayout:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setSecondaryView:(id)a3;
@end

@implementation AAUIOBInheritanceInviteMessageViewModel

- (AAUIOBInheritanceInviteMessageViewModel)initWithBeneficiaryName:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AAUIOBInheritanceInviteMessageViewModel;
  v3 = [(AAOBInheritanceInviteMessageModel *)&v10 initWithBeneficiaryName:a3];
  v4 = v3;
  if (v3)
  {
    v3->_contentViewLayout = 2;
    v5 = [AAUIMessageBubbleView alloc];
    v6 = [(AAOBInheritanceInviteMessageModel *)v4 bubbleText];
    uint64_t v7 = [(AAUIMessageBubbleView *)v5 initWithText:v6];
    contentView = v4->_contentView;
    v4->_contentView = (UIView *)v7;
  }
  return v4;
}

- (AAUIOBInheritanceInviteMessageViewModel)initWithType:(unint64_t)a3 recipientHandle:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)AAUIOBInheritanceInviteMessageViewModel;
  v4 = [(AAOBInheritanceInviteMessageModel *)&v11 initWithType:a3 recipientHandle:a4];
  v5 = v4;
  if (v4)
  {
    v4->_contentViewLayout = 2;
    v6 = [AAUIMessageBubbleView alloc];
    uint64_t v7 = [(AAOBInheritanceInviteMessageModel *)v5 bubbleText];
    uint64_t v8 = [(AAUIMessageBubbleView *)v6 initWithText:v7];
    contentView = v5->_contentView;
    v5->_contentView = (UIView *)v8;
  }
  return v5;
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

- (int64_t)contentViewLayout
{
  return self->_contentViewLayout;
}

- (void)setContentViewLayout:(int64_t)a3
{
  self->_contentViewLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end