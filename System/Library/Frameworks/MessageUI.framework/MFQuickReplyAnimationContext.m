@interface MFQuickReplyAnimationContext
+ (OS_os_log)log;
- (MFQuickReplyAnimationContext)initWithInsets:(UIEdgeInsets)a3 cornerRadius:(double)a4 compositionSnapshot:(id)a5 buttonsSnapshot:(id)a6 backgroundSnapshot:(id)a7;
- (UIEdgeInsets)insets;
- (UIView)backgroundSnapshot;
- (UIView)buttonsSnapshot;
- (UIView)compositionSnapshot;
- (double)cornerRadius;
- (id)completionBlock;
- (void)setBackgroundSnapshot:(id)a3;
- (void)setButtonsSnapshot:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setCompositionSnapshot:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setInsets:(UIEdgeInsets)a3;
@end

@implementation MFQuickReplyAnimationContext

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__MFQuickReplyAnimationContext_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_10 != -1) {
    dispatch_once(&log_onceToken_10, block);
  }
  v2 = (void *)log_log_10;

  return (OS_os_log *)v2;
}

void __35__MFQuickReplyAnimationContext_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_10;
  log_log_10 = (uint64_t)v1;
}

- (MFQuickReplyAnimationContext)initWithInsets:(UIEdgeInsets)a3 cornerRadius:(double)a4 compositionSnapshot:(id)a5 buttonsSnapshot:(id)a6 backgroundSnapshot:(id)a7
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v22.receiver = self;
  v22.super_class = (Class)MFQuickReplyAnimationContext;
  v19 = [(MFQuickReplyAnimationContext *)&v22 init];
  v20 = v19;
  if (v19)
  {
    v19->_insets.CGFloat top = top;
    v19->_insets.CGFloat left = left;
    v19->_insets.CGFloat bottom = bottom;
    v19->_insets.CGFloat right = right;
    v19->_cornerRadius = a4;
    objc_storeStrong((id *)&v19->_compositionSnapshot, a5);
    objc_storeStrong((id *)&v20->_buttonsSnapshot, a6);
    objc_storeStrong((id *)&v20->_backgroundSnapshot, a7);
  }

  return v20;
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (UIView)compositionSnapshot
{
  return self->_compositionSnapshot;
}

- (void)setCompositionSnapshot:(id)a3
{
}

- (UIView)buttonsSnapshot
{
  return self->_buttonsSnapshot;
}

- (void)setButtonsSnapshot:(id)a3
{
}

- (UIView)backgroundSnapshot
{
  return self->_backgroundSnapshot;
}

- (void)setBackgroundSnapshot:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_backgroundSnapshot, 0);
  objc_storeStrong((id *)&self->_buttonsSnapshot, 0);

  objc_storeStrong((id *)&self->_compositionSnapshot, 0);
}

@end