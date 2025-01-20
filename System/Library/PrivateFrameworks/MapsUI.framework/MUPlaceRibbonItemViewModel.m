@interface MUPlaceRibbonItemViewModel
+ (id)amenityItemViewForMapItem:(id)a3 amenityItemConfiguration:(id)a4;
+ (id)costItemViewForMapItem:(id)a3;
+ (id)distanceFromCurrentLocationItemViewModelForDistanceString:(id)a3;
+ (id)distanceFromCurrentLocationItemViewModelForMapItem:(id)a3 currentLocationCoordinate:(CLLocationCoordinate2D)a4;
+ (id)factoidItemForFactoid:(id)a3;
+ (id)guidesItemViewModelForMapItem:(id)a3;
+ (id)hoursItemViewModelForMapItem:(id)a3;
+ (id)ratingSubmissionStatusViewModelForRatingState:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTappable;
- (MUPlaceRibbonItemViewModelUpdateDelegate)updateDelegate;
- (NSString)preferredAccessibilityValue;
- (NSString)typeStringForAX;
- (id)titleStringProvider;
- (id)valueStringProvider;
- (int64_t)type;
- (void)setPreferredAccessibilityValue:(id)a3;
- (void)setTappable:(BOOL)a3;
- (void)setTitleStringProvider:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setTypeStringForAX:(id)a3;
- (void)setUpdateDelegate:(id)a3;
- (void)setValueStringProvider:(id)a3;
@end

@implementation MUPlaceRibbonItemViewModel

+ (id)guidesItemViewModelForMapItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 _placeCollections];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = _MULocalizedStringFromThisBundle(@"Guides [Placecard]");
    v7 = NSString;
    v8 = [v3 _placeCollections];
    v9 = objc_msgSend(v7, "stringWithFormat:", @"%lu", objc_msgSend(v8, "count"));

    v10 = objc_alloc_init(MUPlaceRibbonItemViewModel);
    [(MUPlaceRibbonItemViewModel *)v10 setTypeStringForAX:@"Guides"];
    id v11 = v6;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = ___defaultTitleAttributedStringForString_block_invoke;
    aBlock[3] = &unk_1E57505C8;
    id v18 = v11;
    v12 = _Block_copy(aBlock);

    [(MUPlaceRibbonItemViewModel *)v10 setTitleStringProvider:v12];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__MUPlaceRibbonItemViewModel_guidesItemViewModelForMapItem___block_invoke;
    v15[3] = &unk_1E57505C8;
    id v16 = v9;
    id v13 = v9;
    [(MUPlaceRibbonItemViewModel *)v10 setValueStringProvider:v15];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __60__MUPlaceRibbonItemViewModel_guidesItemViewModelForMapItem___block_invoke(uint64_t a1)
{
  v35[2] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4FB1818];
  v2 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v3 = *MEMORY[0x1E4FB2908];
  v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  uint64_t v5 = [v2 configurationWithFont:v4 scale:1];
  v6 = [v1 systemImageNamed:@"map.fill" withConfiguration:v5];

  v7 = [v6 imageWithRenderingMode:2];

  v8 = [MEMORY[0x1E4FB1618] systemGrayColor];
  id v9 = +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:v8];
  v10 = (objc_class *)MEMORY[0x1E4FB0870];
  id v33 = v7;
  id v11 = objc_alloc_init(v10);
  v12 = [v33 imageWithRenderingMode:2];

  [v11 setImage:v12];
  id v13 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v11];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v13];
  v34[0] = *MEMORY[0x1E4FB0700];
  uint64_t v15 = v34[0];
  v35[0] = v9;
  id v16 = (void *)MEMORY[0x1E4F1C9E8];
  id v17 = v9;
  id v18 = [v16 dictionaryWithObjects:v35 forKeys:v34 count:1];

  objc_msgSend(v14, "addAttributes:range:", v18, 0, objc_msgSend(v14, "length"));
  v19 = (void *)[v14 copy];

  id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v21 = *(void *)(a1 + 32);
  v22 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v3];
  v23 = [MEMORY[0x1E4FB1618] labelColor];
  v24 = +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:v23];
  v34[0] = *MEMORY[0x1E4FB06F8];
  v34[1] = v15;
  v35[0] = v22;
  v35[1] = v24;
  v25 = (void *)MEMORY[0x1E4F1C9E8];
  id v26 = v22;
  v27 = [v25 dictionaryWithObjects:v35 forKeys:v34 count:2];

  v28 = (void *)[v20 initWithString:v21 attributes:v27];
  v29 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v19];
  [v29 appendAttributedString:v28];
  v30 = (void *)[v29 copy];

  return v30;
}

+ (id)hoursItemViewModelForMapItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 _businessHours];

  if (v4)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F310E0]) initWithMapItem:v3 localizedHoursStringOptions:1];
    v6 = [MEMORY[0x1E4FB1618] systemGreenColor];
    [v5 updateHoursLabelColorWithDefaultLabelColor:v6];

    v7 = [v5 ribbonSummaryForOpeningState];
    v8 = _MULocalizedStringFromThisBundle(@"Hours [Placecard]");
    v4 = objc_alloc_init(MUPlaceRibbonItemViewModel);
    [(MUPlaceRibbonItemViewModel *)v4 setType:2];
    [(MUPlaceRibbonItemViewModel *)v4 setTappable:1];
    [(MUPlaceRibbonItemViewModel *)v4 setTypeStringForAX:@"Hours"];
    id v9 = v8;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = ___defaultTitleAttributedStringForString_block_invoke;
    aBlock[3] = &unk_1E57505C8;
    id v18 = v9;
    v10 = _Block_copy(aBlock);

    [(MUPlaceRibbonItemViewModel *)v4 setTitleStringProvider:v10];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__MUPlaceRibbonItemViewModel_hoursItemViewModelForMapItem___block_invoke;
    v14[3] = &unk_1E57505F0;
    id v15 = v7;
    id v16 = v5;
    id v11 = v5;
    id v12 = v7;
    [(MUPlaceRibbonItemViewModel *)v4 setValueStringProvider:v14];
  }
  return v4;
}

id __59__MUPlaceRibbonItemViewModel_hoursItemViewModelForMapItem___block_invoke(uint64_t a1)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  uint64_t v5 = [*(id *)(a1 + 40) hoursStateLabelColor];
  v6 = +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:v5];
  uint64_t v7 = *MEMORY[0x1E4FB0700];
  v13[0] = *MEMORY[0x1E4FB06F8];
  v13[1] = v7;
  v14[0] = v4;
  v14[1] = v6;
  v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = v4;
  v10 = [v8 dictionaryWithObjects:v14 forKeys:v13 count:2];

  id v11 = (void *)[v2 initWithString:v3 attributes:v10];
  return v11;
}

+ (id)costItemViewForMapItem:(id)a3
{
  id v3 = a3;
  if ([v3 _hasPriceRange]
    && ([v3 _geoMapItem],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 _maxScoreForPriceRange],
        v4,
        v5))
  {
    v6 = objc_alloc_init(MUPlaceRibbonItemViewModel);
    [(MUPlaceRibbonItemViewModel *)v6 setTypeStringForAX:@"Cost"];
    _MULocalizedStringFromThisBundle(@"Cost [Placecard]");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = ___defaultTitleAttributedStringForString_block_invoke;
    aBlock[3] = &unk_1E57505C8;
    id v19 = v7;
    v8 = _Block_copy(aBlock);

    [(MUPlaceRibbonItemViewModel *)v6 setTitleStringProvider:v8];
    id v9 = [MEMORY[0x1E4F1CA20] currentLocale];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__MUPlaceRibbonItemViewModel_costItemViewForMapItem___block_invoke;
    v15[3] = &unk_1E57505F0;
    id v10 = v3;
    id v16 = v10;
    id v11 = v9;
    id v17 = v11;
    [(MUPlaceRibbonItemViewModel *)v6 setValueStringProvider:v15];
    id v12 = [v10 _geoMapItem];
    id v13 = +[MUPlaceRibbonHelper costStringForValue:locale:](MUPlaceRibbonHelper, "costStringForValue:locale:", [v12 _priceRange], v11);
    [(MUPlaceRibbonItemViewModel *)v6 setPreferredAccessibilityValue:v13];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __53__MUPlaceRibbonItemViewModel_costItemViewForMapItem___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v2 = [*(id *)(a1 + 32) _geoMapItem];
  uint64_t v3 = [v2 _priceRange];
  uint64_t v43 = *MEMORY[0x1E4FB2908];
  v4 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:");
  int v5 = [MEMORY[0x1E4FB1618] labelColor];
  v6 = +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:v5];
  id v7 = *(void **)(a1 + 40);
  id v8 = v4;
  id v9 = v6;
  id v10 = v7;
  id v11 = +[MUPlaceRibbonHelper costStringForValue:v3 locale:v10];
  if ([v11 length])
  {
    id v42 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v12 = *MEMORY[0x1E4FB0700];
    uint64_t v45 = *MEMORY[0x1E4FB06F8];
    uint64_t v46 = v12;
    id v47 = v8;
    id v48 = v9;
    id v13 = (void *)MEMORY[0x1E4F1C9E8];
    v14 = v2;
    id v15 = v8;
    id v16 = v9;
    id v17 = [v13 dictionaryWithObjects:&v47 forKeys:&v45 count:2];

    id v2 = v14;
    id v18 = (void *)[v42 initWithString:v11 attributes:v17];
  }
  else
  {
    id v18 = 0;
  }

  id v19 = v44;
  if ([v18 length]) {
    [v44 addObject:v18];
  }
  id v20 = objc_msgSend(*(id *)(a1 + 32), "_geoMapItem", v42);
  int v21 = [v20 _maxScoreForPriceRange];
  v22 = [*(id *)(a1 + 32) _geoMapItem];
  int v23 = [v22 _priceRange];

  uint64_t v24 = (v21 - v23);
  if (v24)
  {
    v25 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v43];
    id v26 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
    v27 = *(void **)(a1 + 40);
    id v28 = v25;
    id v29 = v26;
    id v30 = v27;
    v31 = +[MUPlaceRibbonHelper costStringForValue:v24 locale:v30];
    if ([v31 length])
    {
      id v32 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v33 = *MEMORY[0x1E4FB0700];
      uint64_t v45 = *MEMORY[0x1E4FB06F8];
      uint64_t v46 = v33;
      id v47 = v28;
      id v48 = v29;
      v34 = (void *)MEMORY[0x1E4F1C9E8];
      id v35 = v28;
      id v36 = v29;
      v37 = [v34 dictionaryWithObjects:&v47 forKeys:&v45 count:2];

      id v19 = v44;
      v38 = (void *)[v32 initWithString:v31 attributes:v37];
    }
    else
    {
      v38 = 0;
    }

    [v19 addObject:v38];
  }
  v39 = (void *)[v19 copy];
  v40 = +[MapsUILayout buildAttributedDisplayStringForComponents:v39 reverseIfRTLLayout:1];

  return v40;
}

+ (id)amenityItemViewForMapItem:(id)a3 amenityItemConfiguration:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 _amenities];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    id v9 = [v6 indexesWithinAmenityComponent];

    id v45 = v6;
    if (v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v11 = [v6 indexesWithinAmenityComponent];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v55 objects:v62 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v56 != v14) {
              objc_enumerationMutation(v11);
            }
            unint64_t v16 = [*(id *)(*((void *)&v55 + 1) + 8 * i) unsignedIntegerValue];
            id v17 = [v5 _amenities];
            unint64_t v18 = [v17 count];

            if (v16 < v18)
            {
              id v19 = [v5 _amenities];
              id v20 = [v19 objectAtIndex:v16];

              [v10 addObject:v20];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v55 objects:v62 count:16];
        }
        while (v13);
      }

      int v21 = (void *)[v10 copy];
    }
    else
    {
      int v21 = [v5 _amenities];
    }
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = v21;
    uint64_t v24 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v48 = *(void *)v52;
      uint64_t v46 = *MEMORY[0x1E4FB2908];
LABEL_17:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v52 != v48) {
          objc_enumerationMutation(obj);
        }
        v27 = *(void **)(*((void *)&v51 + 1) + 8 * v26);
        id v28 = [v27 resolvedRibbonSymbolName];
        if ([v28 length])
        {
          id v29 = v23;
          id v30 = (void *)MEMORY[0x1E4FB1818];
          v31 = (void *)MEMORY[0x1E4FB1830];
          id v32 = (void *)MEMORY[0x1E4FB08E0];
          id v33 = v28;
          v34 = [v32 preferredFontForTextStyle:v46];
          id v35 = [v31 configurationWithFont:v34 scale:1];
          id v36 = objc_msgSend(v30, "_mapsui_resolvedSymbolImageNamed:withConfiguration:", v33, v35);

          v37 = [v36 imageWithRenderingMode:2];

          id v23 = v29;
          if (v37) {
            [v29 addObject:v27];
          }
        }
        uint64_t v38 = [v23 count];

        if (v38 == 5) {
          break;
        }
        if (v25 == ++v26)
        {
          uint64_t v25 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
          if (v25) {
            goto LABEL_17;
          }
          break;
        }
      }
    }

    if ([v23 count])
    {
      v22 = objc_alloc_init(MUPlaceRibbonItemViewModel);
      [(MUPlaceRibbonItemViewModel *)v22 setTypeStringForAX:@"GoodToKnow"];
      _MULocalizedStringFromThisBundle(@"Good to Know [Placecard]");
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = ___defaultTitleAttributedStringForString_block_invoke;
      aBlock[3] = &unk_1E57505C8;
      id v60 = v39;
      v40 = _Block_copy(aBlock);

      [(MUPlaceRibbonItemViewModel *)v22 setTitleStringProvider:v40];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __81__MUPlaceRibbonItemViewModel_amenityItemViewForMapItem_amenityItemConfiguration___block_invoke;
      v49[3] = &unk_1E57505C8;
      id v41 = v23;
      id v50 = v41;
      [(MUPlaceRibbonItemViewModel *)v22 setValueStringProvider:v49];
      id v42 = MUMap(v41, &__block_literal_global_34);
      uint64_t v43 = [v42 componentsJoinedByString:@" "];
      [(MUPlaceRibbonItemViewModel *)v22 setPreferredAccessibilityValue:v43];
    }
    else
    {
      v22 = 0;
    }
    id v6 = v45;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

id __81__MUPlaceRibbonItemViewModel_amenityItemViewForMapItem_amenityItemConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v26;
    uint64_t v5 = *MEMORY[0x1E4FB2908];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v26 != v4) {
          objc_enumerationMutation(obj);
        }
        id v7 = [*(id *)(*((void *)&v25 + 1) + 8 * v6) resolvedRibbonSymbolName];
        if ([v7 length])
        {
          id v8 = objc_alloc_init(MEMORY[0x1E4FB0870]);
          id v9 = (void *)MEMORY[0x1E4FB1818];
          id v10 = (void *)MEMORY[0x1E4FB1830];
          id v11 = (void *)MEMORY[0x1E4FB08E0];
          id v12 = v7;
          uint64_t v13 = [v11 preferredFontForTextStyle:v5];
          uint64_t v14 = [v10 configurationWithFont:v13 scale:1];
          id v15 = objc_msgSend(v9, "_mapsui_resolvedSymbolImageNamed:withConfiguration:", v12, v14);

          unint64_t v16 = [v15 imageWithRenderingMode:2];

          [v8 setImage:v16];
          id v17 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v8];
          [v23 addObject:v17];
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1931EA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: glyph.length > 0", buf, 2u);
        }

        ++v6;
      }
      while (v3 != v6);
      uint64_t v18 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      uint64_t v3 = v18;
    }
    while (v18);
  }

  id v19 = (void *)[v23 copy];
  id v20 = +[MapsUILayout buildAttributedDisplayStringForComponents:v19 reverseIfRTLLayout:1];

  return v20;
}

uint64_t __81__MUPlaceRibbonItemViewModel_amenityItemViewForMapItem_amenityItemConfiguration___block_invoke_70(uint64_t a1, void *a2)
{
  return [a2 amenityTitle];
}

+ (id)factoidItemForFactoid:(id)a3
{
  uint64_t v3 = +[MUFactoidViewModel viewModelForFactoid:a3];
  uint64_t v4 = [v3 titleString];
  uint64_t v5 = [v3 valueString];
  if ([v4 length] && objc_msgSend(v5, "length"))
  {
    uint64_t v6 = objc_alloc_init(MUPlaceRibbonItemViewModel);
    [(MUPlaceRibbonItemViewModel *)v6 setTypeStringForAX:@"Factoid"];
    id v7 = v4;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = ___defaultTitleAttributedStringForString_block_invoke;
    aBlock[3] = &unk_1E57505C8;
    id v14 = v7;
    id v8 = _Block_copy(aBlock);

    [(MUPlaceRibbonItemViewModel *)v6 setTitleStringProvider:v8];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__MUPlaceRibbonItemViewModel_factoidItemForFactoid___block_invoke;
    v10[3] = &unk_1E57505F0;
    id v11 = v3;
    id v12 = v5;
    [(MUPlaceRibbonItemViewModel *)v6 setValueStringProvider:v10];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

id __52__MUPlaceRibbonItemViewModel_factoidItemForFactoid___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = [*(id *)(a1 + 32) symbolName];
  uint64_t v4 = [v3 length];

  uint64_t v5 = (void *)MEMORY[0x1E4FB2908];
  if (v4)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
    id v8 = [v6 buildSymbolWithFont:v7];
    id v9 = [v8 imageWithRenderingMode:2];

    if (v9)
    {
      id v10 = [*(id *)(a1 + 32) symbolColor];
      if (v10)
      {
        id v11 = [*(id *)(a1 + 32) symbolColor];
      }
      else
      {
        id v12 = [MEMORY[0x1E4FB1618] systemGrayColor];
        id v11 = +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:v12];
      }
      id v13 = v11;
      id v14 = (objc_class *)MEMORY[0x1E4FB0870];
      id v15 = v9;
      id v16 = objc_alloc_init(v14);
      id v17 = [v15 imageWithRenderingMode:2];

      [v16 setImage:v17];
      uint64_t v18 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v16];
      id v19 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v18];
      uint64_t v46 = *MEMORY[0x1E4FB0700];
      id v48 = v13;
      id v20 = (void *)MEMORY[0x1E4F1C9E8];
      id v21 = v13;
      v22 = [v20 dictionaryWithObjects:&v48 forKeys:&v46 count:1];

      objc_msgSend(v19, "addAttributes:range:", v22, 0, objc_msgSend(v19, "length"));
      id v23 = (void *)[v19 copy];

      [v2 addObject:v23];
      uint64_t v5 = (void *)MEMORY[0x1E4FB2908];
    }
  }
  if ([v2 count] && objc_msgSend(*(id *)(a1 + 40), "length"))
  {
    id v24 = objc_alloc(MEMORY[0x1E4F28B18]);
    long long v25 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*v5];
    long long v26 = [MEMORY[0x1E4FB1618] labelColor];
    long long v27 = +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:v26];
    uint64_t v28 = *MEMORY[0x1E4FB0700];
    uint64_t v46 = *MEMORY[0x1E4FB06F8];
    uint64_t v47 = v28;
    id v48 = v25;
    uint64_t v49 = v27;
    id v29 = (void *)MEMORY[0x1E4F1C9E8];
    id v30 = v25;
    v31 = [v29 dictionaryWithObjects:&v48 forKeys:&v46 count:2];

    id v32 = (void *)[v24 initWithString:@" " attributes:v31];
    uint64_t v5 = (void *)MEMORY[0x1E4FB2908];

    [v2 addObject:v32];
  }
  id v33 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v34 = *(void *)(a1 + 40);
  id v35 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*v5];
  id v36 = [MEMORY[0x1E4FB1618] labelColor];
  v37 = +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:v36];
  uint64_t v38 = *MEMORY[0x1E4FB0700];
  uint64_t v46 = *MEMORY[0x1E4FB06F8];
  uint64_t v47 = v38;
  id v48 = v35;
  uint64_t v49 = v37;
  id v39 = (void *)MEMORY[0x1E4F1C9E8];
  id v40 = v35;
  id v41 = [v39 dictionaryWithObjects:&v48 forKeys:&v46 count:2];

  id v42 = (void *)[v33 initWithString:v34 attributes:v41];
  [v2 addObject:v42];
  uint64_t v43 = (void *)[v2 copy];
  id v44 = +[MapsUILayout buildAttributedDisplayStringForComponents:reverseIfRTLLayout:](MapsUILayout, "buildAttributedDisplayStringForComponents:reverseIfRTLLayout:", v43, [*(id *)(a1 + 32) shouldReverseForRTLLayout]);

  return v44;
}

+ (id)distanceFromCurrentLocationItemViewModelForMapItem:(id)a3 currentLocationCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  id v7 = a3;
  uint64_t v8 = [v7 _detourInfo];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [v7 _detourInfo];
    [v10 distanceToPlace];
    double v12 = v11;

    if (v12 > 0.0)
    {
      id v13 = [v7 _detourInfo];
      [v13 distanceToPlace];
      double v15 = v14;
      goto LABEL_13;
    }
  }
  [v7 _coordinate];
  uint64_t v18 = 0;
  if (v17 >= -180.0 && v17 <= 180.0 && v16 >= -90.0 && v16 <= 90.0)
  {
    uint64_t v18 = 0;
    if (longitude >= -180.0 && longitude <= 180.0 && latitude >= -90.0 && latitude <= 90.0)
    {
      id v19 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      [v7 _coordinate];
      double v21 = v20;
      [v7 _coordinate];
      id v13 = objc_msgSend(v19, "initWithLatitude:longitude:", v21);
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:latitude longitude:longitude];
      [v13 distanceFromLocation:v22];
      double v15 = v23;

LABEL_13:
      if (v15 == 0.0)
      {
        uint64_t v18 = 0;
      }
      else
      {
        id v24 = objc_msgSend(NSString, "_mapkit_localizedDistanceStringWithMeters:abbreviated:", v15, 1);
        uint64_t v18 = [a1 distanceFromCurrentLocationItemViewModelForDistanceString:v24];
      }
    }
  }

  return v18;
}

+ (id)distanceFromCurrentLocationItemViewModelForDistanceString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(MUPlaceRibbonItemViewModel);
  [(MUPlaceRibbonItemViewModel *)v4 setTypeStringForAX:@"Distance"];
  uint64_t v5 = _MULocalizedStringFromThisBundle(@"Distance");
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = ___defaultTitleAttributedStringForString_block_invoke;
  aBlock[3] = &unk_1E57505C8;
  id v13 = v5;
  id v6 = v5;
  id v7 = _Block_copy(aBlock);

  [(MUPlaceRibbonItemViewModel *)v4 setTitleStringProvider:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__MUPlaceRibbonItemViewModel_distanceFromCurrentLocationItemViewModelForDistanceString___block_invoke;
  v10[3] = &unk_1E57505C8;
  id v11 = v3;
  id v8 = v3;
  [(MUPlaceRibbonItemViewModel *)v4 setValueStringProvider:v10];

  return v4;
}

id __88__MUPlaceRibbonItemViewModel_distanceFromCurrentLocationItemViewModelForDistanceString___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4FB1818];
  id v2 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v42 = *MEMORY[0x1E4FB2908];
  id v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:");
  uint64_t v4 = [v2 configurationWithFont:v3 scale:1];
  uint64_t v5 = [v1 systemImageNamed:@"point.fill.topleft.down.curvedto.point.fill.bottomright.up" withConfiguration:v4];

  id v6 = [v5 imageWithRenderingMode:2];

  id v7 = [MEMORY[0x1E4FB1618] systemGrayColor];
  id v8 = +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:v7];
  id v9 = (objc_class *)MEMORY[0x1E4FB0870];
  id v10 = v6;
  id v11 = objc_alloc_init(v9);
  double v12 = [v10 imageWithRenderingMode:2];

  [v11 setImage:v12];
  id v13 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v11];
  double v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v13];
  uint64_t v45 = *MEMORY[0x1E4FB0700];
  uint64_t v15 = v45;
  id v47 = v8;
  double v16 = (void *)MEMORY[0x1E4F1C9E8];
  id v17 = v8;
  uint64_t v18 = [v16 dictionaryWithObjects:&v47 forKeys:&v45 count:1];

  objc_msgSend(v14, "addAttributes:range:", v18, 0, objc_msgSend(v14, "length"));
  uint64_t v43 = (void *)[v14 copy];

  id v19 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v20 = *(void *)(a1 + 32);
  double v21 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v42];
  v22 = [MEMORY[0x1E4FB1618] labelColor];
  double v23 = +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:v22];
  uint64_t v45 = *MEMORY[0x1E4FB06F8];
  uint64_t v24 = v45;
  uint64_t v46 = v15;
  uint64_t v25 = v15;
  id v47 = v21;
  id v48 = v23;
  long long v26 = (void *)MEMORY[0x1E4F1C9E8];
  id v27 = v21;
  uint64_t v28 = [v26 dictionaryWithObjects:&v47 forKeys:&v45 count:2];

  id v29 = (void *)[v19 initWithString:v20 attributes:v28];
  id v30 = objc_alloc(MEMORY[0x1E4F28B18]);
  v31 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v42];
  id v32 = [MEMORY[0x1E4FB1618] labelColor];
  id v33 = +[MUInfoCardStyle resolvedPrimaryColorForProposedColor:v32];
  uint64_t v45 = v24;
  uint64_t v46 = v25;
  id v47 = v31;
  id v48 = v33;
  uint64_t v34 = (void *)MEMORY[0x1E4F1C9E8];
  id v35 = v31;
  id v36 = [v34 dictionaryWithObjects:&v47 forKeys:&v45 count:2];

  v37 = (void *)[v30 initWithString:@" " attributes:v36];
  v44[0] = v43;
  v44[1] = v37;
  v44[2] = v29;
  uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
  id v39 = +[MapsUILayout buildAttributedDisplayStringForComponents:v38 reverseIfRTLLayout:0];

  return v39;
}

+ (id)ratingSubmissionStatusViewModelForRatingState:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
  {
    id v3 = &stru_1EE3BF360;
    uint64_t v4 = &stru_1EE3BF360;
  }
  else
  {
    id v3 = off_1E5750658[a3];
    uint64_t v4 = off_1E5750670[a3];
  }
  uint64_t v5 = objc_alloc_init(MUPlaceRibbonItemViewModel);
  [(MUPlaceRibbonItemViewModel *)v5 setTypeStringForAX:@"Rate"];
  [(MUPlaceRibbonItemViewModel *)v5 setTappable:1];
  id v6 = _MULocalizedStringFromThisBundle(@"Rate");
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = ___defaultTitleAttributedStringForString_block_invoke;
  aBlock[3] = &unk_1E57505C8;
  id v14 = v6;
  id v7 = v6;
  id v8 = _Block_copy(aBlock);

  [(MUPlaceRibbonItemViewModel *)v5 setTitleStringProvider:v8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__MUPlaceRibbonItemViewModel_ratingSubmissionStatusViewModelForRatingState___block_invoke;
  v10[3] = &unk_1E57505F0;
  id v11 = v4;
  double v12 = v3;
  [(MUPlaceRibbonItemViewModel *)v5 setValueStringProvider:v10];

  return v5;
}

id __76__MUPlaceRibbonItemViewModel_ratingSubmissionStatusViewModelForRatingState___block_invoke(uint64_t a1)
{
  v55[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4FB1818];
  id v3 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v4 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v5 = *MEMORY[0x1E4FB2908];
  id v6 = *(id *)(a1 + 32);
  id v7 = [v4 preferredFontForTextStyle:v5];
  id v8 = [v3 configurationWithFont:v7 scale:1];
  id v9 = [v2 systemImageNamed:v6 withConfiguration:v8];

  id v10 = [v9 imageWithRenderingMode:2];

  id v11 = [MEMORY[0x1E4FB1618] linkColor];
  double v12 = (objc_class *)MEMORY[0x1E4FB0870];
  id v13 = v10;
  id v14 = objc_alloc_init(v12);
  uint64_t v15 = [v13 imageWithRenderingMode:2];

  [v14 setImage:v15];
  double v16 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v14];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v16];
  v54[0] = *MEMORY[0x1E4FB0700];
  uint64_t v18 = v54[0];
  v55[0] = v11;
  id v19 = (void *)MEMORY[0x1E4F1C9E8];
  id v20 = v11;
  double v21 = [v19 dictionaryWithObjects:v55 forKeys:v54 count:1];

  objc_msgSend(v17, "addAttributes:range:", v21, 0, objc_msgSend(v17, "length"));
  long long v52 = (void *)[v17 copy];

  v22 = *(void **)(a1 + 40);
  double v23 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v24 = (void *)MEMORY[0x1E4FB1830];
  uint64_t v25 = (void *)MEMORY[0x1E4FB08E0];
  id v26 = v22;
  id v27 = [v25 preferredFontForTextStyle:v5];
  uint64_t v28 = [v24 configurationWithFont:v27 scale:1];
  id v29 = [v23 systemImageNamed:v26 withConfiguration:v28];

  id v30 = [v29 imageWithRenderingMode:2];

  id v31 = [MEMORY[0x1E4FB1618] linkColor];
  id v32 = (objc_class *)MEMORY[0x1E4FB0870];
  id v33 = v30;
  id v34 = objc_alloc_init(v32);
  id v35 = [v33 imageWithRenderingMode:2];

  [v34 setImage:v35];
  id v36 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v34];
  v37 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v36];
  v54[0] = v18;
  v55[0] = v31;
  uint64_t v38 = (void *)MEMORY[0x1E4F1C9E8];
  id v39 = v31;
  id v40 = [v38 dictionaryWithObjects:v55 forKeys:v54 count:1];

  objc_msgSend(v37, "addAttributes:range:", v40, 0, objc_msgSend(v37, "length"));
  id v41 = (void *)[v37 copy];

  v53[0] = v52;
  id v42 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v43 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v5];
  id v44 = [MEMORY[0x1E4FB1618] linkColor];
  v54[0] = *MEMORY[0x1E4FB06F8];
  v54[1] = v18;
  v55[0] = v43;
  v55[1] = v44;
  uint64_t v45 = (void *)MEMORY[0x1E4F1C9E8];
  id v46 = v43;
  id v47 = [v45 dictionaryWithObjects:v55 forKeys:v54 count:2];

  id v48 = (void *)[v42 initWithString:@" " attributes:v47];
  v53[1] = v48;
  v53[2] = v41;
  uint64_t v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:3];
  uint64_t v50 = +[MapsUILayout buildAttributedDisplayStringForComponents:v49 reverseIfRTLLayout:1];

  return v50;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MUPlaceRibbonItemViewModel *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    id v7 = [(MUPlaceRibbonItemViewModel *)self updateDelegate];
    id v8 = [(MUPlaceRibbonItemViewModel *)v6 updateDelegate];
    if (v7 == v8
      && (BOOL v9 = [(MUPlaceRibbonItemViewModel *)self isTappable],
          v9 == [(MUPlaceRibbonItemViewModel *)v6 isTappable]))
    {
      double v12 = [(MUPlaceRibbonItemViewModel *)self titleStringProvider];
      id v13 = v12[2]();
      id v14 = [(MUPlaceRibbonItemViewModel *)v6 titleStringProvider];
      uint64_t v15 = v14[2]();
      if (v13 == v15 || [v13 isEqual:v15])
      {
        id v27 = v15;
        id v26 = [(MUPlaceRibbonItemViewModel *)self valueStringProvider];
        uint64_t v16 = v26[2]();
        id v17 = [(MUPlaceRibbonItemViewModel *)v6 valueStringProvider];
        uint64_t v18 = v17[2]();
        id v19 = (void *)v16;
        id v20 = (void *)v18;
        uint64_t v25 = v19;
        if (v19 == (void *)v18 || [v19 isEqual:v18])
        {
          double v23 = v13;
          uint64_t v24 = v12;
          double v21 = [(MUPlaceRibbonItemViewModel *)self typeStringForAX];
          v22 = [(MUPlaceRibbonItemViewModel *)v6 typeStringForAX];
          if (v21 == v22) {
            char v10 = 1;
          }
          else {
            char v10 = [v21 isEqual:v22];
          }

          id v13 = v23;
          double v12 = v24;
        }
        else
        {
          char v10 = 0;
        }

        uint64_t v15 = v27;
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (MUPlaceRibbonItemViewModelUpdateDelegate)updateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelegate);
  return (MUPlaceRibbonItemViewModelUpdateDelegate *)WeakRetained;
}

- (void)setUpdateDelegate:(id)a3
{
}

- (BOOL)isTappable
{
  return self->_tappable;
}

- (void)setTappable:(BOOL)a3
{
  self->_tappable = a3;
}

- (id)titleStringProvider
{
  return self->_titleStringProvider;
}

- (void)setTitleStringProvider:(id)a3
{
}

- (id)valueStringProvider
{
  return self->_valueStringProvider;
}

- (void)setValueStringProvider:(id)a3
{
}

- (NSString)preferredAccessibilityValue
{
  return self->_preferredAccessibilityValue;
}

- (void)setPreferredAccessibilityValue:(id)a3
{
}

- (NSString)typeStringForAX
{
  return self->_typeStringForAX;
}

- (void)setTypeStringForAX:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeStringForAX, 0);
  objc_storeStrong((id *)&self->_preferredAccessibilityValue, 0);
  objc_storeStrong(&self->_valueStringProvider, 0);
  objc_storeStrong(&self->_titleStringProvider, 0);
  objc_destroyWeak((id *)&self->_updateDelegate);
}

@end