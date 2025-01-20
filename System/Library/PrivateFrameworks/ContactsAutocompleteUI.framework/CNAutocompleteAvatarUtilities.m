@interface CNAutocompleteAvatarUtilities
+ (id)os_log;
+ (id)roadsideImage;
@end

@implementation CNAutocompleteAvatarUtilities

+ (id)os_log
{
  if (os_log_cn_once_token_1_2 != -1) {
    dispatch_once(&os_log_cn_once_token_1_2, &__block_literal_global_17);
  }
  v2 = (void *)os_log_cn_once_object_1_2;

  return v2;
}

uint64_t __39__CNAutocompleteAvatarUtilities_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.autocomplete.ui", "avatar");
  uint64_t v1 = os_log_cn_once_object_1_2;
  os_log_cn_once_object_1_2 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)roadsideImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CNAutocompleteAvatarUtilities_roadsideImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (roadsideImage_cn_once_token_3 != -1) {
    dispatch_once(&roadsideImage_cn_once_token_3, block);
  }
  v2 = (void *)roadsideImage_cn_once_object_3;

  return v2;
}

void __46__CNAutocompleteAvatarUtilities_roadsideImage__block_invoke()
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  os_log_t v0 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __46__CNAutocompleteAvatarUtilities_roadsideImage__block_invoke_cold_1(v0);
  }

  v23.width = 100.0;
  v23.height = 100.0;
  UIGraphicsBeginImageContextWithOptions(v23, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  *(_OWORD *)components = xmmword_1B5B40E60;
  long long v21 = unk_1B5B40E70;
  v3 = CGColorCreate(DeviceRGB, components);
  *(_OWORD *)v18 = xmmword_1B5B40E80;
  long long v19 = unk_1B5B40E90;
  v4 = CGColorCreate(DeviceRGB, v18);
  v17[0] = v3;
  v17[1] = v4;
  *(_OWORD *)locations = xmmword_1B5B40E50;
  v5 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)[MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2], locations);
  v26.origin.x = 0.0;
  v26.origin.y = 0.0;
  v26.size.width = 100.0;
  v26.size.height = 100.0;
  CGFloat MinY = CGRectGetMinY(v26);
  v27.origin.x = 0.0;
  v27.origin.y = 0.0;
  v27.size.width = 100.0;
  v27.size.height = 100.0;
  v25.y = CGRectGetMaxY(v27);
  v24.x = 0.0;
  v25.x = 0.0;
  v24.y = MinY;
  CGContextDrawLinearGradient(CurrentContext, v5, v24, v25, 0);
  CGGradientRelease(v5);
  CGColorRelease(v3);
  CGColorRelease(v4);
  CGColorSpaceRelease(DeviceRGB);
  v7 = (void *)MEMORY[0x1E4F42A98];
  v8 = [MEMORY[0x1E4F428B8] whiteColor];
  v9 = objc_msgSend(MEMORY[0x1E4F428B8], "whiteColor", v8);
  *(void *)&v15[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v11 = [v7 configurationWithPaletteColors:v10];

  v12 = [MEMORY[0x1E4F42A80] systemImageNamed:@"car.front.waves.down.fill" withConfiguration:v11];
  v28.origin.x = 0.0;
  v28.origin.y = 0.0;
  v28.size.width = 100.0;
  v28.size.height = 100.0;
  CGRect v29 = CGRectInset(v28, 20.0, 20.0);
  objc_msgSend(v12, "drawInRect:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
  uint64_t v13 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  v14 = (void *)roadsideImage_cn_once_object_3;
  roadsideImage_cn_once_object_3 = v13;
}

void __46__CNAutocompleteAvatarUtilities_roadsideImage__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1B5AF5000, log, OS_LOG_TYPE_DEBUG, "Generating roadside image", v1, 2u);
}

@end