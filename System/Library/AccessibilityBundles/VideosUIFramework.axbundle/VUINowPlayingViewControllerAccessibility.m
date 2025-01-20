@interface VUINowPlayingViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)showSkipAndPromoView:(BOOL)a3 animated:(BOOL)a4 skipInfo:(id)a5;
@end

@implementation VUINowPlayingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUINowPlayingViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUINowPlayingViewController", @"promoMetadataView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUINowPlayingViewController", @"mediaController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIMediaController", @"avPlayerViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlayerViewController", @"nowPlayingPlaybackControlsViewController", "@", 0);
  [v3 validateProtocol:@"AVPlaybackControlsProtocol" hasRequiredInstanceMethod:@"contextualBarViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVUnifiedPlayerActionBarViewController", @"_actionButtonForIdentifier:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUINowPlayingViewController", @"showSkipAndPromoView:animated:skipInfo:", "v", "B", "B", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v13.receiver = self;
  v13.super_class = (Class)VUINowPlayingViewControllerAccessibility;
  [(VUINowPlayingViewControllerAccessibility *)&v13 _accessibilityLoadAccessibilityInformation];
  id v3 = [(VUINowPlayingViewControllerAccessibility *)self safeValueForKey:@"promoMetadataView"];
  v4 = [v3 safeValueForKey:@"_axMetadataLabel"];
  v5 = [v3 safeValueForKey:@"_axCanonicalId"];
  v6 = [NSString stringWithFormat:@"UpNext%@", v5];
  v7 = [(VUINowPlayingViewControllerAccessibility *)self safeValueForKey:@"mediaController"];
  v8 = [v7 safeValueForKey:@"avPlayerViewController"];
  v9 = [v8 safeValueForKey:@"nowPlayingPlaybackControlsViewController"];
  v10 = [v9 safeValueForKey:@"contextualBarViewController"];
  v11 = [v10 _actionButtonForIdentifier:v6];
  v12 = v11;
  if (v11) {
    [v11 setAccessibilityValue:v4];
  }
}

- (void)showSkipAndPromoView:(BOOL)a3 animated:(BOOL)a4 skipInfo:(id)a5
{
  BOOL v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VUINowPlayingViewControllerAccessibility;
  [(VUINowPlayingViewControllerAccessibility *)&v7 showSkipAndPromoView:a3 animated:a4 skipInfo:a5];
  if (v5) {
    [(VUINowPlayingViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
  }
}

@end