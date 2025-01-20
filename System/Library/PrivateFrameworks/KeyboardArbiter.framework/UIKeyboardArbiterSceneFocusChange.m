@interface UIKeyboardArbiterSceneFocusChange
@end

@implementation UIKeyboardArbiterSceneFocusChange

id __64___UIKeyboardArbiterSceneFocusChange_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (*(unsigned char *)(v3 + 8))
  {
    return (id)[v2 appendString:@"nothing" withName:0];
  }
  else
  {
    id v5 = (id)[v2 appendInt:*(unsigned int *)(v3 + 12) withName:@"pid"];
    return (id)[*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 16) withName:@"sceneIdentity"];
  }
}

void __56___UIKeyboardArbiterSceneFocusChange_focusNothingChange__block_invoke()
{
  id v0 = [[_UIKeyboardArbiterSceneFocusChange alloc] _init];
  v1 = (void *)qword_26AC12AB0;
  qword_26AC12AB0 = (uint64_t)v0;

  *(unsigned char *)(qword_26AC12AB0 + 8) = 1;
}

@end