@interface AVTAvatarAttributeEditorOverridingLayout
- (AVTAvatarAttributeEditorLayout)backingLayout;
- (AVTAvatarAttributeEditorOverridingLayout)initWithLayout:(id)a3;
- (BOOL)RTL;
- (BOOL)showSideGroupPicker;
- (CGRect)attributesContentViewFrame;
- (CGRect)avatarContainerFrame;
- (CGRect)groupDialContainerFrame;
- (CGRect)headerMaskingViewFrame;
- (CGRect)sideGroupContainerFrame;
- (CGRect)userInfoFrame;
- (CGRect)verticalRuleFrame;
- (CGSize)containerSize;
- (NSString)contentSizeCategory;
- (UIEdgeInsets)attributesContentViewInsets;
- (UIEdgeInsets)attributesContentViewScrollIndicatorInsets;
- (UIEdgeInsets)edgeInsets;
- (double)avatarContainerAlpha;
- (double)headerMaskingViewAlpha;
- (double)maxGroupLabelWidth;
- (double)screenScale;
- (double)userInfoViewHeight;
- (double)verticalRuleAlpha;
- (unint64_t)supportedLayoutOrientation;
- (void)setAttributesContentViewFrame:(CGRect)a3;
- (void)setAvatarContainerAlpha:(double)a3;
- (void)setAvatarContainerFrame:(CGRect)a3;
@end

@implementation AVTAvatarAttributeEditorOverridingLayout

- (AVTAvatarAttributeEditorOverridingLayout)initWithLayout:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AVTAvatarAttributeEditorOverridingLayout;
  v6 = [(AVTAvatarAttributeEditorOverridingLayout *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backingLayout, a3);
    [v5 avatarContainerFrame];
    v7->_avatarContainerFrame.origin.x = v8;
    v7->_avatarContainerFrame.origin.y = v9;
    v7->_avatarContainerFrame.size.width = v10;
    v7->_avatarContainerFrame.size.height = v11;
    [v5 attributesContentViewFrame];
    v7->_attributesContentViewFrame.origin.x = v12;
    v7->_attributesContentViewFrame.origin.y = v13;
    v7->_attributesContentViewFrame.size.width = v14;
    v7->_attributesContentViewFrame.size.height = v15;
    [v5 avatarContainerAlpha];
    v7->_avatarContainerAlpha = v16;
  }

  return v7;
}

- (NSString)contentSizeCategory
{
  v2 = [(AVTAvatarAttributeEditorOverridingLayout *)self backingLayout];
  v3 = [v2 contentSizeCategory];

  return (NSString *)v3;
}

- (CGSize)containerSize
{
  v2 = [(AVTAvatarAttributeEditorOverridingLayout *)self backingLayout];
  [v2 containerSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIEdgeInsets)edgeInsets
{
  v2 = [(AVTAvatarAttributeEditorOverridingLayout *)self backingLayout];
  [v2 edgeInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (double)userInfoViewHeight
{
  v2 = [(AVTAvatarAttributeEditorOverridingLayout *)self backingLayout];
  [v2 userInfoViewHeight];
  double v4 = v3;

  return v4;
}

- (double)screenScale
{
  v2 = [(AVTAvatarAttributeEditorOverridingLayout *)self backingLayout];
  [v2 screenScale];
  double v4 = v3;

  return v4;
}

- (CGRect)groupDialContainerFrame
{
  v2 = [(AVTAvatarAttributeEditorOverridingLayout *)self backingLayout];
  [v2 groupDialContainerFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)sideGroupContainerFrame
{
  v2 = [(AVTAvatarAttributeEditorOverridingLayout *)self backingLayout];
  [v2 sideGroupContainerFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)showSideGroupPicker
{
  v2 = [(AVTAvatarAttributeEditorOverridingLayout *)self backingLayout];
  char v3 = [v2 showSideGroupPicker];

  return v3;
}

- (CGRect)userInfoFrame
{
  v2 = [(AVTAvatarAttributeEditorOverridingLayout *)self backingLayout];
  [v2 userInfoFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)headerMaskingViewAlpha
{
  v2 = [(AVTAvatarAttributeEditorOverridingLayout *)self backingLayout];
  [v2 headerMaskingViewAlpha];
  double v4 = v3;

  return v4;
}

- (CGRect)headerMaskingViewFrame
{
  v2 = [(AVTAvatarAttributeEditorOverridingLayout *)self backingLayout];
  [v2 headerMaskingViewFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)verticalRuleAlpha
{
  v2 = [(AVTAvatarAttributeEditorOverridingLayout *)self backingLayout];
  [v2 verticalRuleAlpha];
  double v4 = v3;

  return v4;
}

- (CGRect)verticalRuleFrame
{
  v2 = [(AVTAvatarAttributeEditorOverridingLayout *)self backingLayout];
  [v2 verticalRuleFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (UIEdgeInsets)attributesContentViewInsets
{
  v2 = [(AVTAvatarAttributeEditorOverridingLayout *)self backingLayout];
  [v2 attributesContentViewInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (UIEdgeInsets)attributesContentViewScrollIndicatorInsets
{
  v2 = [(AVTAvatarAttributeEditorOverridingLayout *)self backingLayout];
  [v2 attributesContentViewScrollIndicatorInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (unint64_t)supportedLayoutOrientation
{
  v2 = [(AVTAvatarAttributeEditorOverridingLayout *)self backingLayout];
  unint64_t v3 = [v2 supportedLayoutOrientation];

  return v3;
}

- (double)maxGroupLabelWidth
{
  v2 = [(AVTAvatarAttributeEditorOverridingLayout *)self backingLayout];
  [v2 maxGroupLabelWidth];
  double v4 = v3;

  return v4;
}

- (BOOL)RTL
{
  v2 = [(AVTAvatarAttributeEditorOverridingLayout *)self backingLayout];
  char v3 = [v2 RTL];

  return v3;
}

- (CGRect)avatarContainerFrame
{
  double x = self->_avatarContainerFrame.origin.x;
  double y = self->_avatarContainerFrame.origin.y;
  double width = self->_avatarContainerFrame.size.width;
  double height = self->_avatarContainerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAvatarContainerFrame:(CGRect)a3
{
  self->_avatarContainerFrame = a3;
}

- (double)avatarContainerAlpha
{
  return self->_avatarContainerAlpha;
}

- (void)setAvatarContainerAlpha:(double)a3
{
  self->_avatarContainerAlpha = a3;
}

- (CGRect)attributesContentViewFrame
{
  double x = self->_attributesContentViewFrame.origin.x;
  double y = self->_attributesContentViewFrame.origin.y;
  double width = self->_attributesContentViewFrame.size.width;
  double height = self->_attributesContentViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAttributesContentViewFrame:(CGRect)a3
{
  self->_attributesContentViewFrame = a3;
}

- (AVTAvatarAttributeEditorLayout)backingLayout
{
  return self->_backingLayout;
}

- (void).cxx_destruct
{
}

@end