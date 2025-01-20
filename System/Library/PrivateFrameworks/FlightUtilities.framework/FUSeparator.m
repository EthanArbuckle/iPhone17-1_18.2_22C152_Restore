@interface FUSeparator
- (FUSeparator)initWithCoder:(id)a3;
- (double)onePixelSize;
- (void)tlk_updateForAppearance:(id)a3;
- (void)updateConstraints;
- (void)updateProminenceForAppearance:(id)a3;
@end

@implementation FUSeparator

- (FUSeparator)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FUSeparator;
  v3 = [(FUSeparator *)&v6 initWithCoder:a3];
  if (v3)
  {
    v4 = [MEMORY[0x263F7E398] bestAppearanceForView:v3];
    [(FUSeparator *)v3 updateProminenceForAppearance:v4];
  }
  return v3;
}

- (void)updateProminenceForAppearance:(id)a3
{
  if ([a3 isVibrant]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 3;
  }

  [(TLKProminenceView *)self setProminence:v4];
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4 = a3;
  [(FUSeparator *)self updateProminenceForAppearance:v4];
  v5.receiver = self;
  v5.super_class = (Class)FUSeparator;
  [(TLKProminenceView *)&v5 tlk_updateForAppearance:v4];
}

- (double)onePixelSize
{
  v2 = [(FUSeparator *)self window];
  v3 = [v2 screen];

  if (v3)
  {
    [v3 scale];
    double v5 = v4;
  }
  else
  {
    objc_super v6 = [MEMORY[0x263F1C920] mainScreen];
    [v6 scale];
    double v5 = v7;
  }
  if (v5 <= 0.0) {
    double v8 = 1.0;
  }
  else {
    double v8 = 1.0 / v5;
  }

  return v8;
}

- (void)updateConstraints
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(FUSeparator *)self constraints];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 firstAttribute] == 8)
        {
          [(FUSeparator *)self onePixelSize];
          objc_msgSend(v8, "setConstant:");
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)FUSeparator;
  [(FUSeparator *)&v9 updateConstraints];
}

@end