@interface MusicArtworkComponentImageViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
- (void)_accessibilityLoadInvertColors;
- (void)addSubview:(id)a3;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
@end

@implementation MusicArtworkComponentImageViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicArtworkComponentImageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)MusicArtworkComponentImageViewInvertColorsAccessibility;
  [(MusicArtworkComponentImageViewInvertColorsAccessibility *)&v3 didMoveToSuperview];
  [(MusicArtworkComponentImageViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)addSubview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MusicArtworkComponentImageViewInvertColorsAccessibility;
  [(MusicArtworkComponentImageViewInvertColorsAccessibility *)&v4 addSubview:a3];
  [(MusicArtworkComponentImageViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MusicArtworkComponentImageViewInvertColorsAccessibility;
  [(MusicArtworkComponentImageViewInvertColorsAccessibility *)&v3 layoutSubviews];
  [(MusicArtworkComponentImageViewInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (void)_accessibilityLoadInvertColors
{
  v2 = [(MusicArtworkComponentImageViewInvertColorsAccessibility *)self subviews];
  objc_super v3 = [v2 axFilterObjectsUsingBlock:&stru_44990];
  objc_super v4 = [v3 firstObject];

  v5 = [v4 subviews];
  id v6 = [v5 indexOfObjectPassingTest:&stru_449D0];

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [v4 layer];
    +[AXInvertColorsAppHelper toggleInvertColors:v7];

    v8 = +[AXSubsystemInvertColors sharedInstance];
    LOBYTE(v7) = [v8 ignoreLogging];

    if ((v7 & 1) == 0)
    {
      v9 = +[AXSubsystemInvertColors identifier];
      v10 = AXLoggerForFacility();

      os_log_type_t v11 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v10, v11))
      {
        v12 = AXColorizeFormatLog();
        v13 = _AXStringForArgs();
        if (os_log_type_enabled(v10, v11))
        {
          *(_DWORD *)buf = 138543362;
          v15 = v13;
          _os_log_impl(&dword_0, v10, v11, "%{public}@", buf, 0xCu);
        }
      }
    }
  }
}

@end