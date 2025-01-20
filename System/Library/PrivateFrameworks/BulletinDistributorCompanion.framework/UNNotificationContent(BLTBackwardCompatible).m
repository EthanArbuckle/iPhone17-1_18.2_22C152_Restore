@interface UNNotificationContent(BLTBackwardCompatible)
+ (void)blt_swizzleEncodeWithCoder;
- (id)_blt_encodedShouldAddToNotificationsList;
- (uint64_t)blt_postEncode;
- (void)_blt_setEncodedShouldAddToNotificationsList:()BLTBackwardCompatible;
- (void)blt_encodeWithCoder:()BLTBackwardCompatible;
- (void)blt_preEncodeShouldAddToNotificationsList:()BLTBackwardCompatible;
@end

@implementation UNNotificationContent(BLTBackwardCompatible)

+ (void)blt_swizzleEncodeWithCoder
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__UNNotificationContent_BLTBackwardCompatible__blt_swizzleEncodeWithCoder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (blt_swizzleEncodeWithCoder_onceToken_41 != -1) {
    dispatch_once(&blt_swizzleEncodeWithCoder_onceToken_41, block);
  }
}

- (void)blt_encodeWithCoder:()BLTBackwardCompatible
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend(a1, "blt_encodeWithCoder:", v4);
  v5 = objc_msgSend(a1, "_blt_encodedShouldAddToNotificationsList");
  if (v5)
  {
    v6 = blt_ids_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = [v5 BOOLValue];
      _os_log_impl(&dword_222F4C000, v6, OS_LOG_TYPE_DEFAULT, "Encoding content shouldAddToNotificationsList: %{BOOL}u", (uint8_t *)v7, 8u);
    }

    objc_msgSend(v4, "encodeBool:forKey:", objc_msgSend(v5, "BOOLValue"), @"shouldAddToNotificationsList");
  }
}

- (void)blt_preEncodeShouldAddToNotificationsList:()BLTBackwardCompatible
{
  objc_msgSend(MEMORY[0x263F1DF38], "blt_swizzleEncodeWithCoder");
  id v5 = [NSNumber numberWithBool:a3];
  objc_msgSend(a1, "_blt_setEncodedShouldAddToNotificationsList:", v5);
}

- (uint64_t)blt_postEncode
{
  return objc_msgSend(a1, "_blt_setEncodedShouldAddToNotificationsList:", 0);
}

- (void)_blt_setEncodedShouldAddToNotificationsList:()BLTBackwardCompatible
{
}

- (id)_blt_encodedShouldAddToNotificationsList
{
  v1 = objc_getAssociatedObject(a1, sel__blt_encodedShouldAddToNotificationsList);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

@end