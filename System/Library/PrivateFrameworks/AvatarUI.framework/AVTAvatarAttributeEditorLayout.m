@interface AVTAvatarAttributeEditorLayout
- (AVTAvatarAttributeEditorLayout)initWithContainerSize:(CGSize)a3 insets:(UIEdgeInsets)a4 userInfoViewHeight:(double)a5 screenScale:(double)a6 RTL:(BOOL)a7 showSideGroupPicker:(BOOL)a8;
- (AVTAvatarAttributeEditorLayout)initWithContainerSize:(CGSize)a3 insets:(UIEdgeInsets)a4 userInfoViewHeight:(double)a5 screenScale:(double)a6 RTL:(BOOL)a7 showSideGroupPicker:(BOOL)a8 maxGroupLabelWidth:(double)a9;
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
- (id)backgroundColor;
- (unint64_t)supportedLayoutOrientation;
- (void)raiseExceptionForPropertyString:(id)a3;
@end

@implementation AVTAvatarAttributeEditorLayout

- (AVTAvatarAttributeEditorLayout)initWithContainerSize:(CGSize)a3 insets:(UIEdgeInsets)a4 userInfoViewHeight:(double)a5 screenScale:(double)a6 RTL:(BOOL)a7 showSideGroupPicker:(BOOL)a8
{
  return -[AVTAvatarAttributeEditorLayout initWithContainerSize:insets:userInfoViewHeight:screenScale:RTL:showSideGroupPicker:maxGroupLabelWidth:](self, "initWithContainerSize:insets:userInfoViewHeight:screenScale:RTL:showSideGroupPicker:maxGroupLabelWidth:", a7, a8, a3.width, a3.height, a4.top, a4.left, a4.bottom, a4.right, a5, a6, 0);
}

- (AVTAvatarAttributeEditorLayout)initWithContainerSize:(CGSize)a3 insets:(UIEdgeInsets)a4 userInfoViewHeight:(double)a5 screenScale:(double)a6 RTL:(BOOL)a7 showSideGroupPicker:(BOOL)a8 maxGroupLabelWidth:(double)a9
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v26.receiver = self;
  v26.super_class = (Class)AVTAvatarAttributeEditorLayout;
  v19 = [(AVTAvatarAttributeEditorLayout *)&v26 init];
  v20 = v19;
  if (v19)
  {
    v19->_containerSize.CGFloat width = width;
    v19->_containerSize.CGFloat height = height;
    v19->_edgeInsets.CGFloat top = top;
    v19->_edgeInsets.CGFloat left = left;
    v19->_edgeInsets.CGFloat bottom = bottom;
    v19->_edgeInsets.CGFloat right = right;
    v19->_userInfoViewHeight = a5;
    v19->_screenScale = a6;
    v21 = [MEMORY[0x263F1C408] sharedApplication];
    v22 = [v21 preferredContentSizeCategory];
    uint64_t v23 = [v22 copy];
    contentSizeCategory = v20->_contentSizeCategory;
    v20->_contentSizeCategory = (NSString *)v23;

    v20->_RTL = a7;
    v20->_showSideGroupPicker = a8;
    v20->_maxGroupLabelWidth = a9;
  }
  return v20;
}

- (CGRect)avatarContainerFrame
{
  [(AVTAvatarAttributeEditorLayout *)self raiseExceptionForPropertyString:@"avatarContainerFrame"];
  double v2 = *MEMORY[0x263F001A0];
  double v3 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A0] + 24);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)avatarContainerAlpha
{
  return 1.0;
}

- (CGRect)attributesContentViewFrame
{
  [(AVTAvatarAttributeEditorLayout *)self raiseExceptionForPropertyString:@"attributesContentViewFrame"];
  double v2 = *MEMORY[0x263F001A0];
  double v3 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A0] + 24);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)userInfoFrame
{
  [(AVTAvatarAttributeEditorLayout *)self raiseExceptionForPropertyString:@"userInfoFrame"];
  double v2 = *MEMORY[0x263F001A0];
  double v3 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A0] + 24);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)headerMaskingViewAlpha
{
  return 1.0;
}

- (CGRect)headerMaskingViewFrame
{
  [(AVTAvatarAttributeEditorLayout *)self raiseExceptionForPropertyString:@"headerMaskingViewFrame"];
  double v2 = *MEMORY[0x263F001A0];
  double v3 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A0] + 24);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)verticalRuleAlpha
{
  return 1.0;
}

- (CGRect)verticalRuleFrame
{
  [(AVTAvatarAttributeEditorLayout *)self raiseExceptionForPropertyString:@"verticalRuleFrame"];
  double v2 = *MEMORY[0x263F001A0];
  double v3 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A0] + 24);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIEdgeInsets)attributesContentViewInsets
{
  [(AVTAvatarAttributeEditorLayout *)self raiseExceptionForPropertyString:@"attributesContentViewInsets"];
  double v2 = *MEMORY[0x263F1D1C0];
  double v3 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  result.CGFloat right = v5;
  result.CGFloat bottom = v4;
  result.CGFloat left = v3;
  result.CGFloat top = v2;
  return result;
}

- (UIEdgeInsets)attributesContentViewScrollIndicatorInsets
{
  [(AVTAvatarAttributeEditorLayout *)self raiseExceptionForPropertyString:@"attributesContentViewScrollIndicatorInsets"];
  double v2 = *MEMORY[0x263F1D1C0];
  double v3 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  result.CGFloat right = v5;
  result.CGFloat bottom = v4;
  result.CGFloat left = v3;
  result.CGFloat top = v2;
  return result;
}

- (id)backgroundColor
{
  return 0;
}

- (unint64_t)supportedLayoutOrientation
{
  return 0;
}

- (CGRect)groupDialContainerFrame
{
  [(AVTAvatarAttributeEditorLayout *)self raiseExceptionForPropertyString:@"groupDialContainerFrame"];
  double v2 = *MEMORY[0x263F001A0];
  double v3 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A0] + 24);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)sideGroupContainerFrame
{
  [(AVTAvatarAttributeEditorLayout *)self raiseExceptionForPropertyString:@"sideGroupContainerFrame"];
  double v2 = *MEMORY[0x263F001A0];
  double v3 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A0] + 24);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)raiseExceptionForPropertyString:(id)a3
{
  id v4 = [NSString stringWithFormat:@"<AVTAvatarAttributeEditorLayout:%p> Property getter for \"%@\" called on abstract superclass", self, a3];
  double v3 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:v4 userInfo:0];
  [v3 raise];
}

- (CGSize)containerSize
{
  double width = self->_containerSize.width;
  double height = self->_containerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)userInfoViewHeight
{
  return self->_userInfoViewHeight;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (BOOL)showSideGroupPicker
{
  return self->_showSideGroupPicker;
}

- (BOOL)RTL
{
  return self->_RTL;
}

- (double)maxGroupLabelWidth
{
  return self->_maxGroupLabelWidth;
}

- (void).cxx_destruct
{
}

@end