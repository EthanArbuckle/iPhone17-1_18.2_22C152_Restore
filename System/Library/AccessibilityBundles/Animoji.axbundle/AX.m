@interface AX
@end

@implementation AX

void __71__AX_AvatarCarousel_initWithMessagesController_accessibilityContainer___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _axContainerAvatarController];
  id v3 = [v2 indexPathForItemClosestToCenter];

  objc_msgSend(*(id *)(a1 + 32), "_setAXCurrentIndex:", objc_msgSend(v3, "row"));
}

void __50__AX_AvatarCarousel__accessibilityScrollCarousel___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 < 1)
  {
    if (!v2)
    {
      [*(id *)(a1 + 32) scrollToViewAtIndex:0 animated:1];
      [*(id *)(a1 + 40) _setAXCurrentIndex:*(void *)(a1 + 56)];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) loadRecords];
    unint64_t v4 = *(void *)(a1 + 56);
    id v7 = v3;
    if (v4 <= [v3 count])
    {
      v5 = *(void **)(a1 + 32);
      v6 = [v7 objectAtIndex:*(void *)(a1 + 56) - 1];
      [v5 displayAvatarForRecord:v6 animated:0];

      [*(id *)(a1 + 40) _setAXCurrentIndex:*(void *)(a1 + 56)];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
}

@end