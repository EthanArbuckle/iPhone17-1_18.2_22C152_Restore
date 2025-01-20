@interface SCNCameraController(SPI)
@end

@implementation SCNCameraController(SPI)

- (void)_orthographicViewSpaceTranslationForZoomAtScreenPoint:()SPI scaleDelta:viewport:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Point of view has custom projection.", v1, 2u);
}

@end