@interface UIView(ControlCenterUI)
- (uint64_t)ccui_setFramePreservingTransform:()ControlCenterUI;
@end

@implementation UIView(ControlCenterUI)

- (uint64_t)ccui_setFramePreservingTransform:()ControlCenterUI
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  [a1 transform];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v12 = *MEMORY[0x1E4F1DAB8];
  long long v13 = v10;
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [a1 setTransform:&v12];
  objc_msgSend(a1, "setFrame:", a2, a3, a4, a5);
  long long v12 = v15;
  long long v13 = v16;
  long long v14 = v17;
  return [a1 setTransform:&v12];
}

@end