@interface FBSSceneTransitionContext(UIKitShimming)
- (id)_uiApplicationSceneTransitionContextShim;
- (uint64_t)_uikitShimming_isUISubclass;
@end

@implementation FBSSceneTransitionContext(UIKitShimming)

- (id)_uiApplicationSceneTransitionContextShim
{
  if (objc_msgSend(a1, "_uikitShimming_isUISubclass")) { {
    id v2 = a1;
  }
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (uint64_t)_uikitShimming_isUISubclass
{
  if ((objc_opt_respondsToSelector() & 1) == 0) { {
    return 0;
  }
  }

  return [a1 isUISubclass];
}

@end