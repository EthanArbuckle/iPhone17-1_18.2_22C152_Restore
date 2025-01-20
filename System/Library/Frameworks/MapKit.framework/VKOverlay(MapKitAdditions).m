@interface VKOverlay(MapKitAdditions)
+ (id)overlayWithDrawable:()MapKitAdditions forOverlay:atLevel:;
@end

@implementation VKOverlay(MapKitAdditions)

+ (id)overlayWithDrawable:()MapKitAdditions forOverlay:atLevel:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4FB3A50]);
  [v9 setDelegate:v7];
  if (a5 <= 1) {
    [v9 setLevel:a5];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v8 canReplaceMapContent])
  {
    [v8 boundingMapRect];
    objc_msgSend(v9, "setReplaceMapContentInRect:");
  }
  objc_msgSend(v7, "set_renderer:", v9);

  return v9;
}

@end