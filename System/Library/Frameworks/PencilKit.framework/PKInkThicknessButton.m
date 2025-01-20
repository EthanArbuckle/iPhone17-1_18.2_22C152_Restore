@interface PKInkThicknessButton
@end

@implementation PKInkThicknessButton

void __46___PKInkThicknessButton_setSelected_animated___block_invoke(uint64_t a1)
{
  v2 = -[_PKInkThicknessButton backgroundColorForIsSelected:highlighted:](*(void **)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
  [*(id *)(a1 + 32) setBackgroundColor:v2];

  uint64_t v3 = -[_PKInkThicknessButton imageTintColorForIsSelected:highlighted:](*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    v5 = *(void **)(v4 + 760);
  }
  else {
    v5 = 0;
  }
  id v6 = (id)v3;
  [v5 setTintColor:v3];
}

void __52___PKInkThicknessButton__animateToHighlightedState___block_invoke(uint64_t a1)
{
  v2 = -[_PKInkThicknessButton backgroundColorForIsSelected:highlighted:](*(void **)(a1 + 32), [*(id *)(a1 + 32) isSelected], *(unsigned __int8 *)(a1 + 40));
  [*(id *)(a1 + 32) setBackgroundColor:v2];

  uint64_t v3 = -[_PKInkThicknessButton imageTintColorForIsSelected:highlighted:](*(void *)(a1 + 32), [*(id *)(a1 + 32) isSelected], *(unsigned __int8 *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    v5 = *(void **)(v4 + 760);
  }
  else {
    v5 = 0;
  }
  id v6 = (id)v3;
  [v5 setTintColor:v3];
}

@end