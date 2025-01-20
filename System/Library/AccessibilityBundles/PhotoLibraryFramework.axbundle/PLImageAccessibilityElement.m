@interface PLImageAccessibilityElement
- (CGRect)accessibilityFrame;
- (id)_accessibilityDefaultFocusGroupIdentifier;
- (id)_accessibilityElementStoredUserLabel;
- (id)_accessibilityPhotoDescription;
- (id)_axMainAssetURL;
- (id)accessibilityLabel;
- (id)albumView;
- (id)dataSource;
- (id)delegate;
- (int)index;
- (int64_t)_albumPhotoIndex;
- (unint64_t)accessibilityTraits;
- (void)setIndex:(int)a3;
@end

@implementation PLImageAccessibilityElement

- (id)delegate
{
  v3 = [(PLImageAccessibilityElement *)self accessibilityContainer];
  if (!v3) {
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_5;
  }
  NSClassFromString(&cfstr_Uitableviewcel_0.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 safeValueForKey:@"tableViewCell"];

    v3 = (void *)v4;
LABEL_5:
    id v5 = v3;
    v3 = v5;
    goto LABEL_6;
  }
  NSLog(&cfstr_AxWhatWasTheCo.isa, self, v3);
  id v5 = 0;
LABEL_6:

  return v5;
}

- (id)dataSource
{
  v2 = [(PLImageAccessibilityElement *)self delegate];
  v3 = [v2 _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Plalbumview.isa)];

  uint64_t v4 = [v3 safeValueForKey:@"dataSource"];

  return v4;
}

- (CGRect)accessibilityFrame
{
  v3 = [(PLImageAccessibilityElement *)self delegate];
  [v3 bounds];
  uint64_t v4 = [v3 safeValueForKey:@"cellPhotoSize"];
  [v4 sizeValue];

  [(PLImageAccessibilityElement *)self index];
  UIAccessibilityFrameForBounds();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (int64_t)_albumPhotoIndex
{
  v3 = [(PLImageAccessibilityElement *)self delegate];
  uint64_t v4 = [(PLImageAccessibilityElement *)self delegate];
  double v5 = [v4 _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Plalbumview.isa)];

  double v6 = [v3 _accessibilityAncestorIsKindOf:objc_opt_class()];
  double v7 = [v6 indexPathForCell:v3];
  uint64_t v8 = [v7 row];
  double v9 = [v5 safeValueForKey:@"currentPickerSession"];
  BOOL v10 = v9 != 0;

  uint64_t v11 = v8 - v10;
  double v12 = [v5 safeValueForKey:@"_columnsPerRow"];
  uint64_t v13 = [v12 integerValue];

  int64_t v14 = v13 * v11 + [(PLImageAccessibilityElement *)self index];
  return v14;
}

- (id)_axMainAssetURL
{
  int64_t v3 = [(PLImageAccessibilityElement *)self _albumPhotoIndex];
  uint64_t v4 = [(PLImageAccessibilityElement *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    double v5 = [(PLImageAccessibilityElement *)self albumView];
    double v6 = [v4 albumView:v5 accessibilityPhotoURL:v3];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)_accessibilityPhotoDescription
{
  int64_t v3 = [(PLImageAccessibilityElement *)self _albumPhotoIndex];
  uint64_t v4 = [(PLImageAccessibilityElement *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    double v5 = [(PLImageAccessibilityElement *)self albumView];
    double v6 = [v4 albumView:v5 accessibilityPhotoDescription:v3];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)_accessibilityElementStoredUserLabel
{
  v2 = [(PLImageAccessibilityElement *)self _axMainAssetURL];
  int64_t v3 = UIAccessibilityMetadataDescriptionForImage();

  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = &stru_26F41F300;
  }

  return v4;
}

- (id)albumView
{
  v2 = [(PLImageAccessibilityElement *)self delegate];
  int64_t v3 = [v2 _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Plalbumview.isa)];

  return v3;
}

- (id)accessibilityLabel
{
  int64_t v3 = [(PLImageAccessibilityElement *)self _albumPhotoIndex];
  uint64_t v4 = [(PLImageAccessibilityElement *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    double v5 = [(PLImageAccessibilityElement *)self albumView];
    double v6 = [v4 albumView:v5 accessibilityLabelForPhotoAtIndex:v3];
LABEL_5:

    goto LABEL_7;
  }
  if (v4)
  {
    double v5 = NSStringFromSelector(sel_albumView_accessibilityLabelForPhotoAtIndex_);
    _AXAssert();
    double v6 = 0;
    goto LABEL_5;
  }
  double v6 = 0;
LABEL_7:

  return v6;
}

- (unint64_t)accessibilityTraits
{
  int64_t v3 = [(PLImageAccessibilityElement *)self _albumPhotoIndex];
  uint64_t v4 = [(PLImageAccessibilityElement *)self dataSource];
  if (objc_opt_respondsToSelector())
  {
    double v5 = [(PLImageAccessibilityElement *)self albumView];
    unint64_t v6 = [v4 albumView:v5 accessibilityTraitsForPhotoAtIndex:v3];
  }
  else
  {
    if (v4)
    {
      uint64_t v8 = NSStringFromSelector(sel_albumView_accessibilityTraitsForPhotoAtIndex_);
      _AXAssert();
    }
    unint64_t v6 = *MEMORY[0x263F1CF18];
  }

  return v6;
}

- (id)_accessibilityDefaultFocusGroupIdentifier
{
  return 0;
}

- (int)index
{
  return self->_index;
}

- (void)setIndex:(int)a3
{
  self->_index = a3;
}

@end