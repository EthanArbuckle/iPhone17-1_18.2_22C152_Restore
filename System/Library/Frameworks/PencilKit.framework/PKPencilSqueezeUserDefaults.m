@interface PKPencilSqueezeUserDefaults
- (PKPencilSqueezeUserDefaults)init;
- (id)loadLastPaletteHoverLocation;
- (id)loadLastPaletteViewStartAngle;
- (void)saveLastPaletteHoverLocation:(CGFloat)a3;
- (void)saveLastPaletteViewStartAngle:(uint64_t)a1;
@end

@implementation PKPencilSqueezeUserDefaults

- (PKPencilSqueezeUserDefaults)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKPencilSqueezeUserDefaults;
  v2 = [(PKPencilSqueezeUserDefaults *)&v6 init];
  if (v2)
  {
    uint64_t v3 = PKUserDefaults();
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;
  }
  return v2;
}

- (void)saveLastPaletteViewStartAngle:(uint64_t)a1
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134283521;
      double v8 = a2;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Save last palette view start angle: %{private}f", (uint8_t *)&v7, 0xCu);
    }

    v5 = *(void **)(a1 + 8);
    objc_super v6 = [NSNumber numberWithDouble:a2];
    [v5 setObject:v6 forKey:@"PKPencilSqueezeLastPaletteViewStartAngle"];
  }
}

- (id)loadLastPaletteViewStartAngle
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = [*(id *)(a1 + 8) objectForKey:@"PKPencilSqueezeLastPaletteViewStartAngle"];
    v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138477827;
      v5 = v1;
      _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Load last palette view start angle: %{private}@", (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

- (void)saveLastPaletteHoverLocation:(CGFloat)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v6 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13.x = a2;
      v13.y = a3;
      int v7 = NSStringFromCGPoint(v13);
      int v10 = 138477827;
      v11 = v7;
      _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "Save last palette hover location: %{private}@", (uint8_t *)&v10, 0xCu);
    }
    double v8 = *(void **)(a1 + 8);
    v14.x = a2;
    v14.y = a3;
    uint64_t v9 = NSStringFromCGPoint(v14);
    [v8 setObject:v9 forKey:@"PKPencilSqueezeLastPaletteHoverLocation"];
  }
}

- (id)loadLastPaletteHoverLocation
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = [*(id *)(a1 + 8) objectForKey:@"PKPencilSqueezeLastPaletteHoverLocation"];
    v2 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138477827;
      int v7 = v1;
      _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Load last palette hover location: %{private}@", (uint8_t *)&v6, 0xCu);
    }

    if (v1)
    {
      CGPoint v3 = CGPointFromString(v1);
      int v4 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v3.x, v3.y);
    }
    else
    {
      int v4 = 0;
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end