@interface UNNotificationAttachment(UNNotificationAttachmentBackwardCompatible)
+ (void)blt_swizzleEncodeWithCoder;
- (id)_blt_encodedShouldAddNotificationAttachmentOptions;
- (uint64_t)blt_postEncodeNotificationAttachmentOptions;
- (void)_blt_setEncodedShouldAddNotificationAttachmentOptions:()UNNotificationAttachmentBackwardCompatible;
- (void)blt_encodeWithCoder:()UNNotificationAttachmentBackwardCompatible;
- (void)blt_preEncodeShouldAddNotificationAttachmentOptions;
@end

@implementation UNNotificationAttachment(UNNotificationAttachmentBackwardCompatible)

+ (void)blt_swizzleEncodeWithCoder
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98__UNNotificationAttachment_UNNotificationAttachmentBackwardCompatible__blt_swizzleEncodeWithCoder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (blt_swizzleEncodeWithCoder_onceToken != -1) {
    dispatch_once(&blt_swizzleEncodeWithCoder_onceToken, block);
  }
}

- (void)blt_encodeWithCoder:()UNNotificationAttachmentBackwardCompatible
{
  id v4 = a3;
  objc_msgSend(a1, "blt_encodeWithCoder:", v4);
  v5 = objc_msgSend(a1, "_blt_encodedShouldAddNotificationAttachmentOptions");
  if (v5)
  {
    if ([a1 family] == 2)
    {
      v6 = blt_ids_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222F4C000, v6, OS_LOG_TYPE_DEFAULT, "Encoding UNImageNotificationAttachmentOptions", buf, 2u);
      }

      v7 = objc_alloc_init(UNImageNotificationAttachmentOptions);
      [(UNImageNotificationAttachmentOptions *)v7 setHiddenFromDefaultExpandedView:0];
      v8 = [a1 options];
      uint64_t v9 = [v8 displayLocation];

      if (v9 == 1) {
        [(UNImageNotificationAttachmentOptions *)v7 setHiddenFromDefaultExpandedView:1];
      }
    }
    else
    {
      if ([a1 family] == 3)
      {
        v10 = blt_ids_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_222F4C000, v10, OS_LOG_TYPE_DEFAULT, "Encoding UNMovieNotificationAttachmentOptions", v14, 2u);
        }

        v11 = UNMovieNotificationAttachmentOptions;
      }
      else
      {
        if ([a1 family] != 1)
        {
LABEL_17:
          objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(a1, "family"), @"family");
          goto LABEL_18;
        }
        v12 = blt_ids_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_222F4C000, v12, OS_LOG_TYPE_DEFAULT, "Encoding UNSoundNotificationAttachmentOptions", v13, 2u);
        }

        v11 = UNAudioNotificationAttachmentOptions;
      }
      v7 = (UNImageNotificationAttachmentOptions *)objc_alloc_init(v11);
    }
    [v4 encodeObject:v7 forKey:@"options"];

    goto LABEL_17;
  }
LABEL_18:
}

- (void)blt_preEncodeShouldAddNotificationAttachmentOptions
{
  objc_msgSend(MEMORY[0x263F1DF20], "blt_swizzleEncodeWithCoder");
  id v2 = [NSNumber numberWithBool:1];
  objc_msgSend(a1, "_blt_setEncodedShouldAddNotificationAttachmentOptions:", v2);
}

- (uint64_t)blt_postEncodeNotificationAttachmentOptions
{
  return objc_msgSend(a1, "_blt_setEncodedShouldAddNotificationAttachmentOptions:", 0);
}

- (void)_blt_setEncodedShouldAddNotificationAttachmentOptions:()UNNotificationAttachmentBackwardCompatible
{
}

- (id)_blt_encodedShouldAddNotificationAttachmentOptions
{
  v1 = objc_getAssociatedObject(a1, sel__blt_encodedShouldAddNotificationAttachmentOptions);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }
  id v3 = v2;

  return v3;
}

@end