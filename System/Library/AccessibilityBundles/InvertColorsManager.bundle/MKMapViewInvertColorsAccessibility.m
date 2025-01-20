@interface MKMapViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
- (void)_setPreferredConfiguration:(id)a3 onInit:(BOOL)a4;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MKMapViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKMapView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  [(MKMapViewInvertColorsAccessibility *)self safeValueForKey:@"preferredConfiguration"];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x5810000000;
  v15 = &unk_2DA61;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v19 = 0;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  long long v5 = *((_OWORD *)v13 + 2);
  long long v4 = *((_OWORD *)v13 + 3);
  uint64_t v23 = v13[10];
  long long v6 = *((_OWORD *)v13 + 4);
  long long v21 = v4;
  long long v22 = v6;
  long long v20 = v5;

  _Block_object_dispose(&v12, 8);
  unint64_t v7 = _MKMapTypeForCartographicConfiguration() - 1;
  v8 = [(MKMapViewInvertColorsAccessibility *)self traitCollection];
  v9 = (char *)[v8 userInterfaceStyle];

  BOOL v11 = v7 < 4 || v9 == (unsigned char *)&dword_0 + 2;
  if (v11 != [(MKMapViewInvertColorsAccessibility *)self accessibilityIgnoresInvertColors])[(MKMapViewInvertColorsAccessibility *)self setAccessibilityIgnoresInvertColors:v11]; {
}
  }

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MKMapViewInvertColorsAccessibility;
  [(MKMapViewInvertColorsAccessibility *)&v4 traitCollectionDidChange:a3];
  +[AXInvertColorsAppHelper toggleInvertColors:self];
}

- (void)_setPreferredConfiguration:(id)a3 onInit:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MKMapViewInvertColorsAccessibility;
  [(MKMapViewInvertColorsAccessibility *)&v5 _setPreferredConfiguration:a3 onInit:a4];
  [(MKMapViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MKMapViewInvertColorsAccessibility;
  [(MKMapViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(MKMapViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end