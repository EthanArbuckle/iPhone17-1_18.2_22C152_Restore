@interface CPSGridTemplateCollectionCell
+ (id)reuseIdentifier;
- (BOOL)canBecomeFocused;
- (CPSGridButton)button;
- (void)prepareForReuse;
- (void)setButton:(id)a3;
@end

@implementation CPSGridTemplateCollectionCell

+ (id)reuseIdentifier
{
  return NSStringFromClass((Class)a1);
}

- (void)prepareForReuse
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13 = self;
  SEL v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)CPSGridTemplateCollectionCell;
  [(CPSGridTemplateCollectionCell *)&v11 prepareForReuse];
  memset(__b, 0, sizeof(__b));
  id v6 = (id)[(CPSGridTemplateCollectionCell *)v13 contentView];
  id obj = (id)[v6 subviews];

  uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v14 count:16];
  if (v8)
  {
    uint64_t v3 = *(void *)__b[2];
    uint64_t v4 = 0;
    unint64_t v5 = v8;
    while (1)
    {
      uint64_t v2 = v4;
      if (*(void *)__b[2] != v3) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(id *)(__b[1] + 8 * v4);
      [v10 removeFromSuperview];
      ++v4;
      if (v2 + 1 >= v5)
      {
        uint64_t v4 = 0;
        unint64_t v5 = [obj countByEnumeratingWithState:__b objects:v14 count:16];
        if (!v5) {
          break;
        }
      }
    }
  }

  [(CPSGridTemplateCollectionCell *)v13 setButton:0];
}

- (void)setButton:(id)a3
{
  v24[4] = *MEMORY[0x263EF8340];
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v23->_button != location[0])
  {
    objc_storeStrong((id *)&v23->_button, location[0]);
    if (location[0])
    {
      id v3 = (id)[(CPSGridTemplateCollectionCell *)v23 contentView];
      [v3 addSubview:location[0]];

      uint64_t v4 = (void *)MEMORY[0x263F08938];
      id v21 = (id)[location[0] topAnchor];
      id v20 = (id)[(CPSGridTemplateCollectionCell *)v23 contentView];
      id v19 = (id)[v20 topAnchor];
      id v18 = (id)objc_msgSend(v21, "constraintEqualToAnchor:constant:", 0.0);
      v24[0] = v18;
      id v17 = (id)[location[0] leftAnchor];
      id v16 = (id)[(CPSGridTemplateCollectionCell *)v23 contentView];
      id v15 = (id)[v16 leftAnchor];
      id v14 = (id)objc_msgSend(v17, "constraintEqualToAnchor:constant:", 2.0);
      v24[1] = v14;
      id v13 = (id)[location[0] rightAnchor];
      id v12 = (id)[(CPSGridTemplateCollectionCell *)v23 contentView];
      id v11 = (id)[v12 rightAnchor];
      id v10 = (id)objc_msgSend(v13, "constraintEqualToAnchor:constant:", -2.0);
      v24[2] = v10;
      id v9 = (id)[location[0] bottomAnchor];
      id v8 = (id)[(CPSGridTemplateCollectionCell *)v23 contentView];
      id v7 = (id)[v8 bottomAnchor];
      id v6 = (id)objc_msgSend(v9, "constraintEqualToAnchor:constant:", -1.0);
      v24[3] = v6;
      id v5 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:4];
      objc_msgSend(v4, "activateConstraints:");
    }
  }
  objc_storeStrong(location, 0);
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (CPSGridButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
}

@end