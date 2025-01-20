@interface HKMaximumSizeView
- (CGSize)maximumSize;
- (HKMaximumSizeView)initWithView:(id)a3 maximumSize:(CGSize)a4;
- (NSArray)hardHorizontalConstraints;
- (NSArray)hardVerticalConstraints;
- (NSArray)softHorizontalConstraints;
- (NSArray)softVerticalConstraints;
- (NSLayoutConstraint)maximumHeightConstraint;
- (NSLayoutConstraint)maximumWidthConstraint;
- (void)_buildConstraintsForView:(id)a3;
- (void)_setConstraints:(id)a3 active:(BOOL)a4;
- (void)setHardHorizontalConstraints:(id)a3;
- (void)setHardVerticalConstraints:(id)a3;
- (void)setMaximumHeightConstraint:(id)a3;
- (void)setMaximumSize:(CGSize)a3;
- (void)setMaximumWidthConstraint:(id)a3;
- (void)setSoftHorizontalConstraints:(id)a3;
- (void)setSoftVerticalConstraints:(id)a3;
@end

@implementation HKMaximumSizeView

- (HKMaximumSizeView)initWithView:(id)a3 maximumSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKMaximumSizeView;
  v8 = -[HKMaximumSizeView initWithFrame:](&v11, sel_initWithFrame_, 0.0, 0.0, 1.0, 1.0);
  v9 = v8;
  if (v8)
  {
    [(HKMaximumSizeView *)v8 addSubview:v7];
    [(HKMaximumSizeView *)v9 _buildConstraintsForView:v7];
    -[HKMaximumSizeView setMaximumSize:](v9, "setMaximumSize:", width, height);
  }

  return v9;
}

- (void)_buildConstraintsForView:(id)a3
{
  v52[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [v4 widthAnchor];
  v6 = [v5 constraintLessThanOrEqualToConstant:10.0];
  maximumWidthConstraint = self->_maximumWidthConstraint;
  self->_maximumWidthConstraint = v6;

  v8 = [v4 heightAnchor];
  v9 = [v8 constraintLessThanOrEqualToConstant:10.0];
  maximumHeightConstraint = self->_maximumHeightConstraint;
  self->_maximumHeightConstraint = v9;

  objc_super v11 = [v4 leadingAnchor];
  v12 = [(HKMaximumSizeView *)self leadingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v52[0] = v13;
  v14 = [v4 trailingAnchor];
  v15 = [(HKMaximumSizeView *)self trailingAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v52[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  hardHorizontalConstraints = self->_hardHorizontalConstraints;
  self->_hardHorizontalConstraints = v17;

  v19 = [v4 topAnchor];
  v20 = [(HKMaximumSizeView *)self topAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v51[0] = v21;
  v22 = [v4 bottomAnchor];
  v23 = [(HKMaximumSizeView *)self bottomAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v51[1] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
  hardVerticalConstraints = self->_hardVerticalConstraints;
  self->_hardVerticalConstraints = v25;

  v48 = [v4 leadingAnchor];
  v27 = [(HKMaximumSizeView *)self leadingAnchor];
  v28 = [v48 constraintGreaterThanOrEqualToAnchor:v27];
  v50[0] = v28;
  v29 = [v4 trailingAnchor];
  v30 = [(HKMaximumSizeView *)self trailingAnchor];
  v31 = [v29 constraintLessThanOrEqualToAnchor:v30];
  v50[1] = v31;
  v32 = [v4 centerXAnchor];
  v33 = [(HKMaximumSizeView *)self centerXAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  v50[2] = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:3];
  softHorizontalConstraints = self->_softHorizontalConstraints;
  self->_softHorizontalConstraints = v35;

  v37 = [v4 topAnchor];
  v38 = [(HKMaximumSizeView *)self topAnchor];
  v39 = [v37 constraintGreaterThanOrEqualToAnchor:v38];
  v49[0] = v39;
  v40 = [v4 bottomAnchor];
  v41 = [(HKMaximumSizeView *)self bottomAnchor];
  v42 = [v40 constraintLessThanOrEqualToAnchor:v41];
  v49[1] = v42;
  v43 = [v4 centerYAnchor];

  v44 = [(HKMaximumSizeView *)self centerYAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  v49[2] = v45;
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
  softVerticalConstraints = self->_softVerticalConstraints;
  self->_softVerticalConstraints = v46;
}

- (void)setMaximumSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(HKMaximumSizeView *)self maximumWidthConstraint];
  id v7 = v6;
  if (width <= 0.0)
  {
    [v6 setActive:0];

    v10 = [(HKMaximumSizeView *)self softHorizontalConstraints];
    [(HKMaximumSizeView *)self _setConstraints:v10 active:0];

    [(HKMaximumSizeView *)self hardHorizontalConstraints];
  }
  else
  {
    [v6 setConstant:width];

    v8 = [(HKMaximumSizeView *)self maximumWidthConstraint];
    [v8 setActive:1];

    v9 = [(HKMaximumSizeView *)self hardHorizontalConstraints];
    [(HKMaximumSizeView *)self _setConstraints:v9 active:0];

    [(HKMaximumSizeView *)self softHorizontalConstraints];
  objc_super v11 = };
  [(HKMaximumSizeView *)self _setConstraints:v11 active:1];

  v12 = [(HKMaximumSizeView *)self maximumHeightConstraint];
  v13 = v12;
  if (height <= 0.0)
  {
    [v12 setActive:0];

    v16 = [(HKMaximumSizeView *)self softVerticalConstraints];
    [(HKMaximumSizeView *)self _setConstraints:v16 active:0];

    [(HKMaximumSizeView *)self hardVerticalConstraints];
  }
  else
  {
    [v12 setConstant:height];

    v14 = [(HKMaximumSizeView *)self maximumHeightConstraint];
    [v14 setActive:1];

    v15 = [(HKMaximumSizeView *)self hardVerticalConstraints];
    [(HKMaximumSizeView *)self _setConstraints:v15 active:0];

    [(HKMaximumSizeView *)self softVerticalConstraints];
  v17 = };
  [(HKMaximumSizeView *)self _setConstraints:v17 active:1];

  [(HKMaximumSizeView *)self setNeedsLayout];
}

- (void)_setConstraints:(id)a3 active:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setActive:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (CGSize)maximumSize
{
  double width = self->_maximumSize.width;
  double height = self->_maximumSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSLayoutConstraint)maximumWidthConstraint
{
  return self->_maximumWidthConstraint;
}

- (void)setMaximumWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)maximumHeightConstraint
{
  return self->_maximumHeightConstraint;
}

- (void)setMaximumHeightConstraint:(id)a3
{
}

- (NSArray)hardHorizontalConstraints
{
  return self->_hardHorizontalConstraints;
}

- (void)setHardHorizontalConstraints:(id)a3
{
}

- (NSArray)hardVerticalConstraints
{
  return self->_hardVerticalConstraints;
}

- (void)setHardVerticalConstraints:(id)a3
{
}

- (NSArray)softHorizontalConstraints
{
  return self->_softHorizontalConstraints;
}

- (void)setSoftHorizontalConstraints:(id)a3
{
}

- (NSArray)softVerticalConstraints
{
  return self->_softVerticalConstraints;
}

- (void)setSoftVerticalConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softVerticalConstraints, 0);
  objc_storeStrong((id *)&self->_softHorizontalConstraints, 0);
  objc_storeStrong((id *)&self->_hardVerticalConstraints, 0);
  objc_storeStrong((id *)&self->_hardHorizontalConstraints, 0);
  objc_storeStrong((id *)&self->_maximumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_maximumWidthConstraint, 0);
}

@end