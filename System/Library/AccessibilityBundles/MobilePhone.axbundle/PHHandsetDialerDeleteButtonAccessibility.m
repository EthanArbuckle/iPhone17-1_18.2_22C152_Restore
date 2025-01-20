@interface PHHandsetDialerDeleteButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_axDeleteButtonWasHidden;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_axSetDeleteButtonWasHidden:(BOOL)a3;
- (void)setAlpha:(double)a3;
@end

@implementation PHHandsetDialerDeleteButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHHandsetDialerDeleteButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axDeleteButtonWasHidden
{
  return MEMORY[0x270F0A438](self, &__PHHandsetDialerDeleteButton___axDeleteButtonWasHidden);
}

- (void)_axSetDeleteButtonWasHidden:(BOOL)a3
{
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"delete.title");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PHHandsetDialerDeleteButtonAccessibility;
  return *MEMORY[0x263F81378] | [(PHHandsetDialerDeleteButtonAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F1CF08];
}

- (void)setAlpha:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PHHandsetDialerDeleteButtonAccessibility;
  -[PHHandsetDialerDeleteButtonAccessibility setAlpha:](&v9, sel_setAlpha_);
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[PHHandsetDialerDeleteButtonAccessibility _axDeleteButtonWasHidden](self, "_axDeleteButtonWasHidden"));
  int v6 = [v5 BOOLValue];

  v7 = [NSNumber numberWithDouble:a3];
  uint64_t v8 = [v7 BOOLValue];

  if (v6 != v8)
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    [(PHHandsetDialerDeleteButtonAccessibility *)self _axSetDeleteButtonWasHidden:v8];
  }
}

@end