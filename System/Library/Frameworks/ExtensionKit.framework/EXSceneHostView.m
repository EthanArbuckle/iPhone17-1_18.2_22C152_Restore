@interface EXSceneHostView
@end

@implementation EXSceneHostView

void __34___EXSceneHostView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 bounds];
  objc_msgSend(v3, "setFrame:");
}

@end