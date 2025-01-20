@interface MKPlaceCardActionItem
+ (MKPlaceCardActionItem)actionItemWithType:(unint64_t)a3;
+ (MKPlaceCardActionItem)actionItemWithType:(unint64_t)a3 actionDataProvider:(id)a4 enabled:(BOOL)a5;
+ (id)actionTypesToMenuElements:(id)a3 menuElementCreationBlock:(id)a4;
+ (id)buildActionMenuForItems:(id)a3 buildingOptions:(id)a4 menuElementCreationBlock:(id)a5;
- (BOOL)enabled;
- (BOOL)isDestructiveForDisplayStyle:(unint64_t)a3;
- (BOOL)selected;
- (MKPlaceCardActionItem)initWithType:(unint64_t)a3 appearanceProvider:(id)a4 enabled:(BOOL)a5;
- (MKPlaceCardActionItem)initWithType:(unint64_t)a3 displayString:(id)a4 glyph:(id)a5 enabled:(BOOL)a6;
- (MKPlaceCardActionItem)selectedItem;
- (NSString)displayString;
- (NSString)glyph;
- (UIColor)backgroundColor;
- (UIColor)glyphColor;
- (id)description;
- (id)menuElementWithActionHandler:(id)a3;
- (id)resolvedActionItem;
- (id)symbolForDisplayStyle:(unint64_t)a3;
- (id)titleForDisplayStyle:(unint64_t)a3;
- (unint64_t)type;
- (void)setBackgroundColor:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGlyphColor:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedItem:(id)a3;
@end

@implementation MKPlaceCardActionItem

+ (MKPlaceCardActionItem)actionItemWithType:(unint64_t)a3 actionDataProvider:(id)a4 enabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  v8 = [[MKPlaceActionItemAppearanceProvider alloc] initWithActionType:a3 dataProvider:v7];

  v9 = [[MKPlaceCardActionItem alloc] initWithType:a3 appearanceProvider:v8 enabled:v5];

  return v9;
}

+ (MKPlaceCardActionItem)actionItemWithType:(unint64_t)a3
{
  v3 = [[MKPlaceCardActionItem alloc] initWithType:a3 displayString:0 glyph:0 enabled:1];

  return v3;
}

- (MKPlaceCardActionItem)initWithType:(unint64_t)a3 appearanceProvider:(id)a4 enabled:(BOOL)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MKPlaceCardActionItem;
  v10 = [(MKPlaceCardActionItem *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    objc_storeStrong((id *)&v10->_appearanceProvider, a4);
    v11->_enabled = a5;
  }

  return v11;
}

- (MKPlaceCardActionItem)initWithType:(unint64_t)a3 displayString:(id)a4 glyph:(id)a5 enabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = [[MKPlaceActionItemCustomAppearanceProvider alloc] initWithActionType:a3 overrideTitle:v11 symbolName:v10];

  objc_super v13 = [[MKPlaceCardActionItem alloc] initWithType:a3 appearanceProvider:v12 enabled:v6];
  return v13;
}

- (id)symbolForDisplayStyle:(unint64_t)a3
{
  return [(MKPlaceActionItemAppearanceProvider *)self->_appearanceProvider bestSymbolNameForDisplayStyle:a3];
}

- (id)titleForDisplayStyle:(unint64_t)a3
{
  return [(MKPlaceActionItemAppearanceProvider *)self->_appearanceProvider bestTitleForDisplayStyle:a3];
}

- (BOOL)isDestructiveForDisplayStyle:(unint64_t)a3
{
  return [(MKPlaceActionItemAppearanceProvider *)self->_appearanceProvider isDestructiveForDisplayStyle:a3];
}

- (NSString)displayString
{
  return (NSString *)[(MKPlaceCardActionItem *)self titleForDisplayStyle:1];
}

- (NSString)glyph
{
  v2 = [(MKPlaceCardActionItem *)self symbolForDisplayStyle:MapKitIdiomIsMacCatalyst()];

  return (NSString *)v2;
}

- (id)description
{
  v3 = NSString;
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MKPlaceCardActionItem type](self, "type"));
  BOOL v5 = [(MKPlaceCardActionItem *)self displayString];
  BOOL v6 = objc_msgSend(NSNumber, "numberWithBool:", -[MKPlaceCardActionItem enabled](self, "enabled"));
  id v7 = [v3 stringWithFormat:@"type: %@, displayString: %@, enabled: %@", v4, v5, v6];

  return v7;
}

- (id)resolvedActionItem
{
  if ([(MKPlaceCardActionItem *)self selected]
    && ([(MKPlaceCardActionItem *)self selectedItem],
        v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    v4 = [(MKPlaceCardActionItem *)self selectedItem];
  }
  else
  {
    v4 = self;
  }

  return v4;
}

- (id)menuElementWithActionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MKPlaceCardActionItem *)self resolvedActionItem];
  BOOL v6 = (void *)MEMORY[0x1E4F42A80];
  id v7 = [v5 glyph];
  v8 = objc_msgSend(v6, "_mapkit_systemImageNamed:", v7);

  id v9 = (void *)MEMORY[0x1E4F426E8];
  id v10 = [(MKPlaceCardActionItem *)self resolvedActionItem];
  id v11 = [v10 displayString];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__MKPlaceCardActionItem_menuElementWithActionHandler___block_invoke;
  v15[3] = &unk_1E54BC7A0;
  id v16 = v4;
  id v12 = v4;
  objc_super v13 = [v9 actionWithTitle:v11 image:v8 identifier:0 handler:v15];

  return v13;
}

uint64_t __54__MKPlaceCardActionItem_menuElementWithActionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)buildActionMenuForItems:(id)a3 buildingOptions:(id)a4 menuElementCreationBlock:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F1CA48] array];
  id v12 = [v9 headerMenuElement];

  if (v12)
  {
    objc_super v13 = [v9 headerMenuElement];
    [v11 addObject:v13];
  }
  v14 = [MEMORY[0x1E4F1CA48] array];
  v38 = v8;
  v36 = v10;
  v15 = [a1 actionTypesToMenuElements:v8 menuElementCreationBlock:v10];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v37 = v9;
  id v16 = [v9 requestedActionTypes];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v48 count:16];
  unint64_t v18 = 0x1E4F42000uLL;
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v44 != v20) {
          objc_enumerationMutation(v16);
        }
        v22 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v23 = [v15 objectForKeyedSubscript:v22];
        if (v23)
        {
          [v15 removeObjectForKey:v22];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_12;
          }
          id v24 = v23;
          if (([v24 options] & 1) == 0)
          {

LABEL_12:
            [v14 addObject:v23];
            goto LABEL_17;
          }
          [v11 addObject:v24];
        }
        else if ([v22 isEqualToNumber:&unk_1ED97E940] && objc_msgSend(v14, "count"))
        {
          v25 = *(void **)(v18 + 2944);
          v26 = (void *)[v14 copy];
          v27 = [v25 menuWithTitle:&stru_1ED919588 image:0 identifier:0 options:1 children:v26];

          [v11 addObject:v27];
          uint64_t v28 = [MEMORY[0x1E4F1CA48] array];

          v14 = (void *)v28;
          unint64_t v18 = 0x1E4F42000;
        }
LABEL_17:
      }
      uint64_t v19 = [v16 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v19);
  }

  if ([v14 count]) {
    [v11 addObjectsFromArray:v14];
  }
  if ([v37 addMismatchedItems])
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v29 = [v15 allValues];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v40 != v32) {
            objc_enumerationMutation(v29);
          }
          [v11 addObject:*(void *)(*((void *)&v39 + 1) + 8 * j)];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v31);
    }
  }
  if ([v11 count])
  {
    v34 = [MEMORY[0x1E4F42B80] menuWithTitle:&stru_1ED919588 children:v11];
    [v34 setAccessibilityIdentifier:@"PlacecardEllipsisMenu"];
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

+ (id)actionTypesToMenuElements:(id)a3 menuElementCreationBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = (void (**)(id, void *))a4;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_super v13 = v6[2](v6, v12);
        v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "type"));
        [v7 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (UIColor)glyphColor
{
  return self->_glyphColor;
}

- (void)setGlyphColor:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (MKPlaceCardActionItem)selectedItem
{
  return self->_selectedItem;
}

- (void)setSelectedItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedItem, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_glyphColor, 0);

  objc_storeStrong((id *)&self->_appearanceProvider, 0);
}

@end