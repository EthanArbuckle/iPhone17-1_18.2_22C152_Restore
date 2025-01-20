@interface NC
@end

@implementation NC

id __88__NC_PLPlatterHeaderContentViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained titleLabel];
  v3 = [v2 text];

  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    accessibilityLocalizedString(@"notification.manage.button.title");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

@end