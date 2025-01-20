@interface MPModelStoreBrowseSectionBuilder
+ (id)allSupportedInternalOnlyProperties;
+ (id)allSupportedPropertiesIncludingInternalOnlyProperties:(BOOL)a3;
- (MPModelStoreBrowseSectionBuilder)initWithRequestedPropertySet:(id)a3;
- (MPPropertySet)requestedPropertySet;
- (MPPropertySet)requestedPropertySetExcludingInternalOnlyProperties;
- (id)modelObjectWithTitle:(id)a3 loadAdditionalContentURL:(id)a4 uniformContentItemType:(int64_t)a5 isMemberOfChartSet:(BOOL)a6 isBrick:(BOOL)a7 displaysAsGridCellInCarPlay:(BOOL)a8 previouslyRetrievedNestedResponse:(id)a9 onlyContainsEditorialElements:(BOOL)a10 featuredContentKind:(int64_t)a11;
- (id)modelObjectWithTitle:(id)a3 loadAdditionalContentURL:(id)a4 uniformContentItemType:(int64_t)a5 isMemberOfChartSet:(BOOL)a6 isBrick:(BOOL)a7 displaysAsGridCellInCarPlay:(BOOL)a8 previouslyRetrievedNestedResponse:(id)a9 onlyContainsEditorialElements:(BOOL)a10 featuredContentKind:(int64_t)a11 modelObject:(id)a12;
- (id)modelObjectWithTitle:(id)a3 loadAdditionalContentURL:(id)a4 uniformContentItemType:(int64_t)a5 isMemberOfChartSet:(BOOL)a6 isBrick:(BOOL)a7 previouslyRetrievedNestedResponse:(id)a8;
@end

@implementation MPModelStoreBrowseSectionBuilder

- (void).cxx_destruct
{
}

- (MPPropertySet)requestedPropertySet
{
  return self->_requestedPropertySet;
}

- (id)modelObjectWithTitle:(id)a3 loadAdditionalContentURL:(id)a4 uniformContentItemType:(int64_t)a5 isMemberOfChartSet:(BOOL)a6 isBrick:(BOOL)a7 displaysAsGridCellInCarPlay:(BOOL)a8 previouslyRetrievedNestedResponse:(id)a9 onlyContainsEditorialElements:(BOOL)a10 featuredContentKind:(int64_t)a11 modelObject:(id)a12
{
  BOOL v12 = a6;
  BOOL v16 = a10;
  id v17 = a3;
  id v18 = a4;
  id v19 = a9;
  id v20 = a12;
  if ((*(_WORD *)&self->_requestedBrowseSectionProperties & 1) == 0)
  {
    v21 = [(MPModelStoreBrowseSectionBuilder *)self requestedPropertySet];
    v22 = [v21 properties];
    if ([v22 containsObject:@"MPModelStoreBrowseSectionPropertyTitle"]) {
      __int16 v23 = 2;
    }
    else {
      __int16 v23 = 0;
    }
    *(_WORD *)&self->_requestedBrowseSectionProperties = *(_WORD *)&self->_requestedBrowseSectionProperties & 0xFFFD | v23;
    if ([v22 containsObject:@"MPModelStoreBrowseSectionPropertyType"]) {
      __int16 v24 = 4;
    }
    else {
      __int16 v24 = 0;
    }
    *(_WORD *)&self->_requestedBrowseSectionProperties = *(_WORD *)&self->_requestedBrowseSectionProperties & 0xFFFB | v24;
    if ([v22 containsObject:@"MPModelStoreBrowseSectionPropertyLoadAdditionalContentURL"])__int16 v25 = 8; {
    else
    }
      __int16 v25 = 0;
    *(_WORD *)&self->_requestedBrowseSectionProperties = *(_WORD *)&self->_requestedBrowseSectionProperties & 0xFFF7 | v25;
    if ([v22 containsObject:@"MPModelStoreBrowseSectionPropertyPreviouslyRetrievedNestedResponse"])__int16 v26 = 16; {
    else
    }
      __int16 v26 = 0;
    *(_WORD *)&self->_requestedBrowseSectionProperties = *(_WORD *)&self->_requestedBrowseSectionProperties & 0xFFEF | v26;
    if ([v22 containsObject:@"MPModelStoreBrowseSectionPropertyUniformContentItemType"])__int16 v27 = 32; {
    else
    }
      __int16 v27 = 0;
    *(_WORD *)&self->_requestedBrowseSectionProperties = *(_WORD *)&self->_requestedBrowseSectionProperties & 0xFFDF | v27;
    if ([v22 containsObject:@"MPModelStoreBrowseSectionPropertyMemberOfChartSet"]) {
      __int16 v28 = 64;
    }
    else {
      __int16 v28 = 0;
    }
    *(_WORD *)&self->_requestedBrowseSectionProperties = *(_WORD *)&self->_requestedBrowseSectionProperties & 0xFFBF | v28;
    if ([v22 containsObject:@"MPModelStoreBrowseSectionPropertyBrick"]) {
      __int16 v29 = 256;
    }
    else {
      __int16 v29 = 0;
    }
    *(_WORD *)&self->_requestedBrowseSectionProperties = *(_WORD *)&self->_requestedBrowseSectionProperties & 0xFEFF | v29;
    if ([v22 containsObject:@"MPModelStoreBrowseSectionPropertyDisplaysAsGridCellInCarPlay"])__int16 v30 = 129; {
    else
    }
      __int16 v30 = 1;
    *(_WORD *)&self->_requestedBrowseSectionProperties = v30 | *(_WORD *)&self->_requestedBrowseSectionProperties & 0xFF7E;

    BOOL v16 = a10;
  }
  if (a11 > 390)
  {
    switch(a11)
    {
      case 391:
        uint64_t v31 = 11;
        goto LABEL_58;
      case 488:
        uint64_t v31 = 13;
        goto LABEL_58;
      case 489:
        uint64_t v31 = 14;
        goto LABEL_58;
    }
  }
  else
  {
    switch(a11)
    {
      case 332:
        uint64_t v31 = 9;
        goto LABEL_58;
      case 383:
        uint64_t v31 = 12;
        goto LABEL_58;
      case 388:
        uint64_t v31 = 10;
        goto LABEL_58;
    }
  }
  uint64_t v32 = 0;
  if (v12)
  {
    if (a5 > 9)
    {
      if (a5 == 10)
      {
        uint64_t v32 = 1;
      }
      else
      {
LABEL_48:
        if (a5 == 16) {
          uint64_t v32 = 11;
        }
      }
    }
    else if (a5 == 1)
    {
      uint64_t v32 = 2;
    }
    else if (a5 == 6)
    {
      uint64_t v32 = 3;
    }
  }
  else
  {
    switch(a5)
    {
      case 3:
        uint64_t v32 = 4;
        break;
      case 4:
        uint64_t v32 = 5;
        break;
      case 5:
        uint64_t v32 = 6;
        break;
      case 6:
        break;
      case 7:
        uint64_t v32 = 7;
        break;
      default:
        goto LABEL_48;
    }
  }
  if (v16) {
    uint64_t v31 = 8;
  }
  else {
    uint64_t v31 = v32;
  }
LABEL_58:
  v33 = [MPModelStoreBrowseSection alloc];
  v34 = +[MPIdentifierSet emptyIdentifierSet];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __256__MPModelStoreBrowseSectionBuilder_modelObjectWithTitle_loadAdditionalContentURL_uniformContentItemType_isMemberOfChartSet_isBrick_displaysAsGridCellInCarPlay_previouslyRetrievedNestedResponse_onlyContainsEditorialElements_featuredContentKind_modelObject___block_invoke;
  v43[3] = &unk_1E57EE6B8;
  v43[4] = self;
  id v44 = v17;
  BOOL v50 = a8;
  id v45 = v20;
  id v46 = v18;
  uint64_t v48 = v31;
  int64_t v49 = a5;
  BOOL v51 = v12;
  BOOL v52 = a7;
  id v47 = v19;
  id v35 = v19;
  id v36 = v18;
  id v37 = v20;
  id v38 = v17;
  v39 = [(MPModelObject *)v33 initWithIdentifiers:v34 block:v43];

  return v39;
}

void __256__MPModelStoreBrowseSectionBuilder_modelObjectWithTitle_loadAdditionalContentURL_uniformContentItemType_isMemberOfChartSet_isBrick_displaysAsGridCellInCarPlay_previouslyRetrievedNestedResponse_onlyContainsEditorialElements_featuredContentKind_modelObject___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  __int16 v3 = *(_WORD *)(*(void *)(a1 + 32) + 8);
  if ((v3 & 2) != 0)
  {
    [v5 setTitle:*(void *)(a1 + 40)];
    __int16 v3 = *(_WORD *)(*(void *)(a1 + 32) + 8);
  }
  if ((v3 & 0x80) != 0) {
    [v5 setDisplaysAsGridCellInCarPlay:*(unsigned __int8 *)(a1 + 88)];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setRadioStation:*(void *)(a1 + 48)];
  }
  __int16 v4 = *(_WORD *)(*(void *)(a1 + 32) + 8);
  if ((v4 & 4) != 0)
  {
    [v5 setSectionType:*(void *)(a1 + 72)];
    __int16 v4 = *(_WORD *)(*(void *)(a1 + 32) + 8);
    if ((v4 & 8) == 0)
    {
LABEL_9:
      if ((v4 & 0x20) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((v4 & 8) == 0)
  {
    goto LABEL_9;
  }
  [v5 setLoadAdditionalContentURL:*(void *)(a1 + 56)];
  __int16 v4 = *(_WORD *)(*(void *)(a1 + 32) + 8);
  if ((v4 & 0x20) == 0)
  {
LABEL_10:
    if ((v4 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v5 setUniformContentItemType:*(void *)(a1 + 80)];
  __int16 v4 = *(_WORD *)(*(void *)(a1 + 32) + 8);
  if ((v4 & 0x40) == 0)
  {
LABEL_11:
    if ((v4 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v5 setMemberOfChartSet:*(unsigned __int8 *)(a1 + 89)];
  __int16 v4 = *(_WORD *)(*(void *)(a1 + 32) + 8);
  if ((v4 & 0x100) == 0)
  {
LABEL_12:
    if ((v4 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_21:
  [v5 setBrick:*(unsigned __int8 *)(a1 + 90)];
  if ((*(_WORD *)(*(void *)(a1 + 32) + 8) & 0x10) != 0) {
LABEL_13:
  }
    [v5 setPreviouslyRetrievedNestedResponse:*(void *)(a1 + 64)];
LABEL_14:
}

- (id)modelObjectWithTitle:(id)a3 loadAdditionalContentURL:(id)a4 uniformContentItemType:(int64_t)a5 isMemberOfChartSet:(BOOL)a6 isBrick:(BOOL)a7 displaysAsGridCellInCarPlay:(BOOL)a8 previouslyRetrievedNestedResponse:(id)a9 onlyContainsEditorialElements:(BOOL)a10 featuredContentKind:(int64_t)a11
{
  LOBYTE(v12) = 0;
  return [(MPModelStoreBrowseSectionBuilder *)self modelObjectWithTitle:a3 loadAdditionalContentURL:a4 uniformContentItemType:a5 isMemberOfChartSet:a6 isBrick:a7 displaysAsGridCellInCarPlay:0 previouslyRetrievedNestedResponse:a9 onlyContainsEditorialElements:v12 featuredContentKind:a11 modelObject:0];
}

- (id)modelObjectWithTitle:(id)a3 loadAdditionalContentURL:(id)a4 uniformContentItemType:(int64_t)a5 isMemberOfChartSet:(BOOL)a6 isBrick:(BOOL)a7 previouslyRetrievedNestedResponse:(id)a8
{
  LOBYTE(v9) = 0;
  return [(MPModelStoreBrowseSectionBuilder *)self modelObjectWithTitle:a3 loadAdditionalContentURL:a4 uniformContentItemType:a5 isMemberOfChartSet:a6 isBrick:a7 displaysAsGridCellInCarPlay:0 previouslyRetrievedNestedResponse:a8 onlyContainsEditorialElements:v9 featuredContentKind:0 modelObject:0];
}

- (MPPropertySet)requestedPropertySetExcludingInternalOnlyProperties
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [(MPModelStoreBrowseSectionBuilder *)self requestedPropertySet];
  __int16 v3 = [v2 properties];
  __int16 v4 = (void *)[v3 mutableCopy];

  id v5 = [(id)objc_opt_class() allSupportedInternalOnlyProperties];
  v6 = [v5 properties];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v4, "removeObject:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  uint64_t v12 = [MPPropertySet alloc];
  v13 = [v4 allObjects];
  v14 = [v2 relationships];
  v15 = [(MPPropertySet *)v12 initWithProperties:v13 relationships:v14];

  return v15;
}

- (MPModelStoreBrowseSectionBuilder)initWithRequestedPropertySet:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPModelStoreBrowseSectionBuilder;
  id v5 = [(MPModelStoreBrowseSectionBuilder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    requestedPropertySet = v5->_requestedPropertySet;
    v5->_requestedPropertySet = (MPPropertySet *)v6;
  }
  return v5;
}

+ (id)allSupportedInternalOnlyProperties
{
  v5[6] = *MEMORY[0x1E4F143B8];
  v5[0] = @"MPModelStoreBrowseSectionPropertyLoadAdditionalContentURL";
  v5[1] = @"MPModelStoreBrowseSectionPropertyUniformContentItemType";
  v5[2] = @"MPModelStoreBrowseSectionPropertyMemberOfChartSet";
  v5[3] = @"MPModelStoreBrowseSectionPropertyBrick";
  v5[4] = @"MPModelStoreBrowseSectionPropertyPreviouslyRetrievedNestedResponse";
  v5[5] = @"MPModelStoreBrowseSectionPropertyDisplaysAsGridCellInCarPlay";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:6];
  __int16 v3 = +[MPPropertySet propertySetWithProperties:v2];

  return v3;
}

+ (id)allSupportedPropertiesIncludingInternalOnlyProperties:(BOOL)a3
{
  BOOL v3 = a3;
  v10[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"MPModelStoreBrowseSectionPropertyTitle";
  v10[1] = @"MPModelStoreBrowseSectionPropertyType";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v6 = +[MPPropertySet propertySetWithProperties:v5];

  if (v3)
  {
    id v7 = [a1 allSupportedInternalOnlyProperties];
    uint64_t v8 = [v6 propertySetByCombiningWithPropertySet:v7];

    uint64_t v6 = (void *)v8;
  }

  return v6;
}

@end