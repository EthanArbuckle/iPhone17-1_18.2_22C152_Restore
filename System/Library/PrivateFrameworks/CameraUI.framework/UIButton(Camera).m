@interface UIButton(Camera)
- (id)hudItemForAccessibilityHUDManager:()Camera;
- (void)selectedByAccessibilityHUDManager:()Camera;
@end

@implementation UIButton(Camera)

- (id)hudItemForAccessibilityHUDManager:()Camera
{
  v2 = objc_msgSend(a1, "titleForState:", objc_msgSend(a1, "state"));
  if ([a1 conformsToProtocol:&unk_26BE10ED0]) {
    [a1 imageForAccessibilityHUD];
  }
  else {
  v3 = objc_msgSend(a1, "imageForState:", objc_msgSend(a1, "state"));
  }
  id v4 = objc_alloc(MEMORY[0x263F823C0]);
  v5 = objc_msgSend(v4, "initWithTitle:image:imageInsets:scaleImage:", v2, v3, 1, *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));

  return v5;
}

- (void)selectedByAccessibilityHUDManager:()Camera
{
  [a1 cancelTouchTracking];
  [a1 sendActionsForControlEvents:64];
  [a1 setHighlighted:1];
  dispatch_time_t v2 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__UIButton_Camera__selectedByAccessibilityHUDManager___block_invoke;
  block[3] = &unk_263FA0208;
  block[4] = a1;
  dispatch_after(v2, MEMORY[0x263EF83A0], block);
}

@end