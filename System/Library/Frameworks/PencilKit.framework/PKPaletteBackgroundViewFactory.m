@interface PKPaletteBackgroundViewFactory
- (id)makeBackgroundViewWithName:(void *)a3 backgroundColor:;
@end

@implementation PKPaletteBackgroundViewFactory

- (id)makeBackgroundViewWithName:(void *)a3 backgroundColor:
{
  v26[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    v6 = (void *)MEMORY[0x1E4F743C8];
    id v7 = a2;
    v8 = [v6 materialViewWithRecipe:53];
    [v8 setGroupNameBase:v7];

    id v9 = v8;
    id v10 = v9;
    if (v5)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);

      [v10 setBackgroundColor:v5];
      [v10 addSubview:v9];
      [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
      v20 = (void *)MEMORY[0x1E4F28DC8];
      v25 = [v9 topAnchor];
      v24 = [v10 topAnchor];
      v23 = [v25 constraintEqualToAnchor:v24 constant:-4.0];
      v26[0] = v23;
      v22 = [v9 leadingAnchor];
      v21 = [v10 leadingAnchor];
      v19 = [v22 constraintEqualToAnchor:v21 constant:-4.0];
      v26[1] = v19;
      v11 = [v9 trailingAnchor];
      v12 = [v10 trailingAnchor];
      v13 = [v11 constraintEqualToAnchor:v12 constant:4.0];
      v26[2] = v13;
      v14 = [v9 bottomAnchor];
      v15 = [v10 bottomAnchor];
      v16 = [v14 constraintEqualToAnchor:v15 constant:4.0];
      v26[3] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
      [v20 activateConstraints:v17];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

@end