@interface MUContactsViewModelGenerator
+ (id)symbolImageForAddressItem;
- (MUContactsViewModelGenerator)initWithContact:(id)a3;
- (id)headerLabelFromAddress:(id)a3;
- (id)sectionViewsFromContentViews:(id)a3 headerLabels:(id)a4;
- (id)viewModelForAddress:(id)a3;
@end

@implementation MUContactsViewModelGenerator

- (MUContactsViewModelGenerator)initWithContact:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUContactsViewModelGenerator;
  v6 = [(MUContactsViewModelGenerator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contact, a3);
  }

  return v7;
}

- (id)viewModelForAddress:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(MULabeledValueActionViewModel);
  id v5 = [v3 identifier];
  v6 = objc_msgSend(MEMORY[0x1E4F1B8F8], "_mapkit_sharedLocationContactIdentifer");
  int v7 = [v5 isEqualToString:v6];

  if (v7) {
    v8 = @"Shared Location Address [Placecard]";
  }
  else {
    v8 = @"Address [Placecard]";
  }
  objc_super v9 = _MULocalizedStringFromThisBundle(v8);
  [(MULabeledValueActionViewModel *)v4 setTitleString:v9];

  v10 = (void *)MEMORY[0x1E4F1BA88];
  v11 = [v3 value];
  v12 = [v10 stringFromPostalAddress:v11 style:0];
  [(MULabeledValueActionViewModel *)v4 setValueString:v12];

  [(MULabeledValueActionViewModel *)v4 setAnalyticsTarget:1502];
  v13 = +[MUContactsViewModelGenerator symbolImageForAddressItem];
  [(MULabeledValueActionViewModel *)v4 setSymbolName:v13];

  return v4;
}

- (id)headerLabelFromAddress:(id)a3
{
  id v3 = a3;
  v4 = [v3 label];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F1B6F8]];

  if (v5)
  {
    v6 = @"Home [Placecard]";
  }
  else
  {
    int v7 = [v3 label];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F1B770]];

    if (v8)
    {
      v6 = @"Work [Placecard]";
    }
    else
    {
      objc_super v9 = [v3 label];
      int v10 = [v9 isEqualToString:*MEMORY[0x1E4F1B760]];

      if (v10)
      {
        v6 = @"School [Placecard]";
      }
      else
      {
        v11 = [v3 label];

        if (v11)
        {
          v12 = (void *)MEMORY[0x1E4F1BA20];
          v13 = [v3 label];
          v14 = [v12 localizedStringForLabel:v13];

          if (v14)
          {
            id v15 = v14;
          }
          else
          {
            _MULocalizedStringFromThisBundle(@"Other [Placecard]");
            id v15 = (id)objc_claimAutoreleasedReturnValue();
          }
          v16 = v15;

          goto LABEL_12;
        }
        v6 = @"Details [Placecard]";
      }
    }
  }
  v16 = _MULocalizedStringFromThisBundle(v6);
LABEL_12:

  return v16;
}

- (id)sectionViewsFromContentViews:(id)a3 headerLabels:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__MUContactsViewModelGenerator_sectionViewsFromContentViews_headerLabels___block_invoke;
  v9[3] = &unk_1E5750870;
  id v10 = v5;
  id v6 = v5;
  int v7 = MUMap(a3, v9);

  return v7;
}

id __74__MUContactsViewModelGenerator_sectionViewsFromContentViews_headerLabels___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 objectAtIndex:a3];
  int v7 = [[MUPlaceSectionHeaderViewModel alloc] initWithTitleString:v6 showSeeMore:0];
  int v8 = +[MUPlaceSectionView cardShadowSectionViewForContentView:v5 sectionHeaderViewModel:v7 sectionFooterViewModel:0 alwaysInsetContentView:0];
  objc_super v9 = [v5 accessibilityIdentifier];

  id v10 = [NSString stringWithFormat:@"%@Section", v6];
  v11 = [v9 stringByAppendingString:v10];

  [v8 setAccessibilityIdentifier:v11];
  v12 = [NSString stringWithFormat:@"%@PlaceDetailsSection", v6];
  [v8 setHeaderAXIdentifierWithBaseString:v12];

  return v8;
}

+ (id)symbolImageForAddressItem
{
  if (MapKitIdiomIsMacCatalyst()) {
    v2 = @"arrow.triangle.turn.up.right.circle";
  }
  else {
    v2 = @"arrow.triangle.turn.up.right.circle.fill";
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end