@interface DCSinglePixelLineView
- (BOOL)hasSetUpSizeConstraint;
- (id)addSizeConstraint;
- (id)findSizeLayoutConstraintIfExists;
- (void)setHasSetUpSizeConstraint:(BOOL)a3;
- (void)setUpHeightConstraintIfNecessary;
- (void)updateConstraints;
@end

@implementation DCSinglePixelLineView

- (void)updateConstraints
{
  [(DCSinglePixelLineView *)self setUpHeightConstraintIfNecessary];
  v3.receiver = self;
  v3.super_class = (Class)DCSinglePixelLineView;
  [(DCSinglePixelLineView *)&v3 updateConstraints];
}

- (void)setUpHeightConstraintIfNecessary
{
  if (![(DCSinglePixelLineView *)self hasSetUpSizeConstraint])
  {
    objc_super v3 = [MEMORY[0x263F1C550] tableSeparatorColor];
    [(DCSinglePixelLineView *)self setBackgroundColor:v3];

    v4 = [MEMORY[0x263F1C920] mainScreen];
    [v4 scale];
    double v6 = 1.0 / v5;

    v7 = [(DCSinglePixelLineView *)self findSizeLayoutConstraintIfExists];
    if (!v7)
    {
      v7 = [(DCSinglePixelLineView *)self addSizeConstraint];
    }
    id v8 = v7;
    [v7 setConstant:v6];
    [(DCSinglePixelLineView *)self setHasSetUpSizeConstraint:1];
  }
}

- (id)findSizeLayoutConstraintIfExists
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(DCSinglePixelLineView *)self sizeLayoutAttribute];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = [(DCSinglePixelLineView *)self constraints];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v5)
  {
    v7 = 0;
    goto LABEL_16;
  }
  uint64_t v6 = v5;
  v7 = 0;
  uint64_t v8 = *(void *)v17;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v4);
      }
      v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
      if ([v10 firstAttribute] == v3)
      {
        v11 = [v10 firstItem];
        if (v11 != self) {
          goto LABEL_8;
        }
        v12 = [v10 secondItem];

        if (!v12)
        {
          v13 = v10;
          v11 = v7;
          v7 = v13;
LABEL_8:
        }
      }
      ++v9;
    }
    while (v6 != v9);
    uint64_t v14 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    uint64_t v6 = v14;
  }
  while (v14);
LABEL_16:

  return v7;
}

- (id)addSizeConstraint
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(DCSinglePixelLineView *)self sizeLayoutAttribute];
  v4 = (void *)MEMORY[0x263F08938];
  uint64_t v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 scale];
  v7 = [v4 constraintWithItem:self attribute:v3 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:1.0 / v6];

  uint64_t v8 = (void *)MEMORY[0x263F08938];
  v11[0] = v7;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  [v8 activateConstraints:v9];

  return v7;
}

- (BOOL)hasSetUpSizeConstraint
{
  return self->_hasSetUpSizeConstraint;
}

- (void)setHasSetUpSizeConstraint:(BOOL)a3
{
  self->_hasSetUpSizeConstraint = a3;
}

@end