@interface FKACommandListItemView
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation FKACommandListItemView

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(FKACommandListItemView *)self arrangedSubviews];
  id v4 = [v3 count];

  if (v4 != (id)2)
  {
    v5 = FKALogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1000148A8(v5);
    }
  }
  v6 = [(FKACommandListItemView *)self arrangedSubviews];
  v7 = [v6 firstObject];
  v8 = [v7 accessibilityLabel];

  return v8;
}

- (id)accessibilityValue
{
  v3 = [(FKACommandListItemView *)self arrangedSubviews];
  id v4 = [v3 count];

  if (v4 != (id)2)
  {
    v5 = FKALogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_1000148A8(v5);
    }
  }
  v6 = [(FKACommandListItemView *)self arrangedSubviews];
  v7 = [v6 lastObject];
  v8 = [v7 accessibilityLabel];

  return v8;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

@end