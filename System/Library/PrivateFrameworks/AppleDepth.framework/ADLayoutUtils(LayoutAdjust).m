@interface ADLayoutUtils(LayoutAdjust)
+ (uint64_t)adjustLayout:()LayoutAdjust sourceOrientation:toRotationPreference:;
@end

@implementation ADLayoutUtils(LayoutAdjust)

+ (uint64_t)adjustLayout:()LayoutAdjust sourceOrientation:toRotationPreference:
{
  if (a3 == 254)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      return 254;
    }
    *(_WORD *)buf = 0;
    v6 = &_os_log_internal;
    v7 = "Cannot adjust unknown layout";
    v8 = buf;
LABEL_15:
    _os_log_error_impl(&dword_215F16000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
    return 254;
  }
  if (a5 || a4 != 8 && a4 != 6) {
    return a3;
  }
  if (a3 == 255)
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      return 254;
    }
    __int16 v10 = 0;
    v6 = &_os_log_internal;
    v7 = "Cannot rotate default layout";
    v8 = (uint8_t *)&v10;
    goto LABEL_15;
  }
  v9 = (void *)MEMORY[0x263F26CA8];
  return objc_msgSend(v9, "transposeLayout:");
}

@end