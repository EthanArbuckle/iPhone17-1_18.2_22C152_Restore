@interface GEOResultRefinementMultiSelect
- (BOOL)showEqualWidthButtonsOnFilterView;
- (GEOResultRefinementMultiSelect)initWithDisplayName:(id)a3 multiSelect:(id)a4 maximumNumberOfSelectElements:(unsigned int)a5 clauseType:(int64_t)a6 showEqualWidthButtonsOnFilterView:(BOOL)a7 displayNameForMultiSelected:(id)a8 multiSelectIdentifier:(id)a9;
- (GEOResultRefinementMultiSelect)initWithResultRefinementMultiSelect:(id)a3;
- (NSArray)multiSelect;
- (NSString)displayName;
- (NSString)displayNameForMultiSelected;
- (NSString)multiSelectIdentifier;
- (id)convertToGEOPDResultRefinementMultiSelect;
- (int64_t)clauseType;
- (unsigned)maximumNumberOfSelectElements;
- (void)setClauseType:(int64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setMaximumNumberOfSelectElements:(unsigned int)a3;
- (void)setMultiSelect:(id)a3;
@end

@implementation GEOResultRefinementMultiSelect

- (GEOResultRefinementMultiSelect)initWithDisplayName:(id)a3 multiSelect:(id)a4 maximumNumberOfSelectElements:(unsigned int)a5 clauseType:(int64_t)a6 showEqualWidthButtonsOnFilterView:(BOOL)a7 displayNameForMultiSelected:(id)a8 multiSelectIdentifier:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  id v18 = a9;
  uint64_t v19 = [v16 count];
  v20 = 0;
  if (a5 && v19)
  {
    v31.receiver = self;
    v31.super_class = (Class)GEOResultRefinementMultiSelect;
    v21 = [(GEOResultRefinementMultiSelect *)&v31 init];
    if (v21)
    {
      uint64_t v22 = [v15 copy];
      displayName = v21->_displayName;
      v21->_displayName = (NSString *)v22;

      uint64_t v24 = [v16 copy];
      multiSelect = v21->_multiSelect;
      v21->_multiSelect = (NSArray *)v24;

      v21->_maximumNumberOfSelectElements = a5;
      v21->_clauseType = a6;
      v21->_showEqualWidthButtonsOnFilterView = a7;
      uint64_t v26 = [v17 copy];
      displayNameForMultiSelected = v21->_displayNameForMultiSelected;
      v21->_displayNameForMultiSelected = (NSString *)v26;

      uint64_t v28 = [v18 copy];
      multiSelectIdentifier = v21->_multiSelectIdentifier;
      v21->_multiSelectIdentifier = (NSString *)v28;
    }
    self = v21;
    v20 = self;
  }

  return v20;
}

- (GEOResultRefinementMultiSelect)initWithResultRefinementMultiSelect:(id)a3
{
  v4 = (id *)a3;
  v5 = -[GEOPDResultRefinementMultiSelect multiSelects](v4);
  v6 = objc_msgSend(v5, "_geo_compactMap:", &__block_literal_global_200);

  int v7 = -[GEOPDResultRefinementMultiSelect clauseType]((uint64_t)v4);
  v8 = -[GEOPDResultRefinementMultiSelect displayName](v4);
  if (v4)
  {
    uint64_t v9 = *((unsigned int *)v4 + 18);
    BOOL v10 = *((unsigned char *)v4 + 76) != 0;
  }
  else
  {
    uint64_t v9 = 0;
    BOOL v10 = 0;
  }
  v11 = -[GEOPDResultRefinementMultiSelect displayNameForMultiSelected](v4);
  v12 = -[GEOPDResultRefinementMultiSelect multiSelectIdentifier](v4);

  v13 = [(GEOResultRefinementMultiSelect *)self initWithDisplayName:v8 multiSelect:v6 maximumNumberOfSelectElements:v9 clauseType:v7 == 1 showEqualWidthButtonsOnFilterView:v10 displayNameForMultiSelected:v11 multiSelectIdentifier:v12];
  return v13;
}

GEOResultRefinementMultiSelectElement *__70__GEOResultRefinementMultiSelect_initWithResultRefinementMultiSelect___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[GEOResultRefinementMultiSelectElement alloc] initWithResultRefinementMultiSelectElement:v2];

  return v3;
}

- (id)convertToGEOPDResultRefinementMultiSelect
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(GEOPDResultRefinementMultiSelect);
  v4 = [(GEOResultRefinementMultiSelect *)self displayName];
  -[GEOPDResultRefinementMultiSelect setDisplayName:]((uint64_t)v3, v4);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(GEOResultRefinementMultiSelect *)self multiSelect];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) convertToGEOPDResultRefinementMultiSelectElement];
        -[GEOPDResultRefinementMultiSelect addMultiSelect:]((uint64_t)v3, v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  unsigned int v11 = [(GEOResultRefinementMultiSelect *)self maximumNumberOfSelectElements];
  if (v3)
  {
    *(_WORD *)&v3->_flags |= 0x100u;
    *(_WORD *)&v3->_flags |= 2u;
    v3->_maxNumSelectElements = v11;
    BOOL v12 = [(GEOResultRefinementMultiSelect *)self clauseType] == 1;
    *(_WORD *)&v3->_flags |= 0x100u;
    *(_WORD *)&v3->_flags |= 1u;
    v3->_clauseType = v12;
    BOOL v13 = [(GEOResultRefinementMultiSelect *)self showEqualWidthButtonsOnFilterView];
    *(_WORD *)&v3->_flags |= 0x100u;
    *(_WORD *)&v3->_flags |= 4u;
    v3->_showEqualWidthButtonsOnFilterView = v13;
  }
  else
  {
    [(GEOResultRefinementMultiSelect *)self clauseType];
    [(GEOResultRefinementMultiSelect *)self showEqualWidthButtonsOnFilterView];
  }
  v14 = [(GEOResultRefinementMultiSelect *)self displayNameForMultiSelected];
  -[GEOPDResultRefinementMultiSelect setDisplayNameForMultiSelected:]((uint64_t)v3, v14);

  id v15 = [(GEOResultRefinementMultiSelect *)self multiSelectIdentifier];
  -[GEOPDResultRefinementMultiSelect setMultiSelectIdentifier:]((uint64_t)v3, v15);

  return v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSArray)multiSelect
{
  return self->_multiSelect;
}

- (void)setMultiSelect:(id)a3
{
}

- (unsigned)maximumNumberOfSelectElements
{
  return self->_maximumNumberOfSelectElements;
}

- (void)setMaximumNumberOfSelectElements:(unsigned int)a3
{
  self->_maximumNumberOfSelectElements = a3;
}

- (BOOL)showEqualWidthButtonsOnFilterView
{
  return self->_showEqualWidthButtonsOnFilterView;
}

- (int64_t)clauseType
{
  return self->_clauseType;
}

- (void)setClauseType:(int64_t)a3
{
  self->_clauseType = a3;
}

- (NSString)displayNameForMultiSelected
{
  return self->_displayNameForMultiSelected;
}

- (NSString)multiSelectIdentifier
{
  return self->_multiSelectIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiSelectIdentifier, 0);
  objc_storeStrong((id *)&self->_displayNameForMultiSelected, 0);
  objc_storeStrong((id *)&self->_multiSelect, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end