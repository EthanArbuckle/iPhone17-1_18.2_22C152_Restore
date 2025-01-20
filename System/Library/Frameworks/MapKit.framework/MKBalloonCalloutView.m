@interface MKBalloonCalloutView
@end

@implementation MKBalloonCalloutView

uint64_t __48___MKBalloonCalloutView_setShowsArrow_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _configureForArrowStateWithDuration:*(double *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "_mapkit_setNeedsLayout");
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_mapkit_layoutIfNeeded");
}

uint64_t __51___MKBalloonCalloutView_updateWithNewCalloutOffset__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _idealFrame];
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "setFrame:");
}

unsigned char *__54___MKBalloonCalloutView_showAnimated_completionBlock___block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[602]) {
    return (unsigned char *)[result _showAnimated:*(unsigned __int8 *)(a1 + 48) completionBlock:*(void *)(a1 + 40)];
  }
  return result;
}

uint64_t __55___MKBalloonCalloutView__showAnimated_completionBlock___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MKBalloonCalloutDidShowNotification" object:*(void *)(a1 + 32)];

  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

uint64_t __55___MKBalloonCalloutView__showAnimated_completionBlock___block_invoke_158(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MKBalloonCalloutDidShowNotification" object:*(void *)(a1 + 32)];

  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

uint64_t __57___MKBalloonCalloutView_dismissAnimated_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57___MKBalloonCalloutView_dismissAnimated_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end