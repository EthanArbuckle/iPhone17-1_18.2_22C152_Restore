@interface UIBarButtonItem(SafariServicesExtras)
+ (double)_sf_longPressAllowableMovement;
+ (uint64_t)_sf_popoverCancelButtonItem;
+ (uint64_t)_sf_popoverDoneButtonItem;
- (uint64_t)_sf_longPressEnabled;
- (uint64_t)_sf_setTarget:()SafariServicesExtras longPressAction:;
- (void)_sf_setLongPressEnabled:()SafariServicesExtras;
- (void)_sf_setTarget:()SafariServicesExtras touchDownAction:longPressAction:;
- (void)_sf_test_simulateLongPressInvocation;
@end

@implementation UIBarButtonItem(SafariServicesExtras)

- (void)_sf_setTarget:()SafariServicesExtras touchDownAction:longPressAction:
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v6 = +[SFBarButtonItemLongPressGestureRecognizer gestureRecognizerTarget:a3 longPressAction:a5 touchDownAction:a4 attachedToBarButtonItem:a1];
  v8[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [a1 _setGestureRecognizers:v7];
}

+ (double)_sf_longPressAllowableMovement
{
  return 32.0;
}

- (uint64_t)_sf_setTarget:()SafariServicesExtras longPressAction:
{
  return objc_msgSend(a1, "_sf_setTarget:touchDownAction:longPressAction:", a3, 0, a4);
}

+ (uint64_t)_sf_popoverDoneButtonItem
{
  return 0;
}

+ (uint64_t)_sf_popoverCancelButtonItem
{
  return 1;
}

- (uint64_t)_sf_longPressEnabled
{
  v1 = [a1 _gestureRecognizers];
  v2 = [v1 firstObject];

  uint64_t v3 = [v2 isEnabled];
  return v3;
}

- (void)_sf_setLongPressEnabled:()SafariServicesExtras
{
  v4 = [a1 _gestureRecognizers];
  id v5 = [v4 firstObject];

  [v5 setEnabled:a3];
}

- (void)_sf_test_simulateLongPressInvocation
{
  v1 = [a1 _gestureRecognizers];
  id v3 = [v1 firstObject];

  v2 = v3;
  if (v3)
  {
    [v3 _invokeLongPressAction];
    v2 = v3;
  }
}

@end