@interface CreateActionButton
@end

@implementation CreateActionButton

void ___CreateActionButton_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 traitCollection];
  uint64_t v4 = qword_18F81D950[[v3 userInterfaceStyle] == 2];

  v5 = (void *)MEMORY[0x1E4F42FF0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___CreateActionButton_block_invoke_2;
  v7[3] = &unk_1E5622950;
  id v8 = v2;
  uint64_t v9 = v4;
  id v6 = v2;
  [v5 animateWithDuration:327684 delay:v7 options:0 animations:0.2 completion:0.0];
}

uint64_t ___CreateActionButton_block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isHighlighted];
  double v3 = 1.0;
  if (v2) {
    double v3 = *(double *)(a1 + 40);
  }
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 setAlpha:v3];
}

@end