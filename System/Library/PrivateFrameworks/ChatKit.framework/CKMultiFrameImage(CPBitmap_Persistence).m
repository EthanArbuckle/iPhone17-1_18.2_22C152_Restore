@interface CKMultiFrameImage(CPBitmap_Persistence)
@end

@implementation CKMultiFrameImage(CPBitmap_Persistence)

+ (void)multiFrameImageWithContentsOfCPBitmapURL:()CPBitmap_Persistence error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Failed to create CPBitmap from file path, error: %@", v2, v3, v4, v5, v6);
}

+ (void)multiFrameImageWithContentsOfCPBitmapURL:()CPBitmap_Persistence error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "CPBitmap file contained zero images, bailing.", v2, v3, v4, v5, v6);
}

+ (void)multiFrameImageWithContentsOfCPBitmapURL:()CPBitmap_Persistence error:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Per frame scale count does not match frame count", v2, v3, v4, v5, v6);
}

+ (void)firstFrameImageWithContentsOfCPBitmapURL:()CPBitmap_Persistence error:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "CPBitmap image metadata includes per frame scale information that does not match count of image, ignoring.", v2, v3, v4, v5, v6);
}

+ (void)writeCPBitmapImagesWithCount:()CPBitmap_Persistence imageProvider:frameDurations:frameScales:toFileURL:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Cannot write cpbitmap to empty file path", v2, v3, v4, v5, v6);
}

+ (void)writeCPBitmapImagesWithCount:()CPBitmap_Persistence imageProvider:frameDurations:frameScales:toFileURL:error:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)writeCPBitmapImagesWithCount:()CPBitmap_Persistence imageProvider:frameDurations:frameScales:toFileURL:error:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)writeCPBitmapImagesWithCount:()CPBitmap_Persistence imageProvider:frameDurations:frameScales:toFileURL:error:.cold.4(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Image provider unexpectedly returned nil, stopping serialization.", buf, 2u);
}

+ (void)writeCPBitmapImagesWithCount:()CPBitmap_Persistence imageProvider:frameDurations:frameScales:toFileURL:error:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Cannot write cpbitmap, frame scales do not match frame count.", v2, v3, v4, v5, v6);
}

+ (void)writeCPBitmapImagesWithCount:()CPBitmap_Persistence imageProvider:frameDurations:frameScales:toFileURL:error:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Cannot write cpbitmap, frame durations do not match frame count.", v2, v3, v4, v5, v6);
}

- (void)writeAsCPBitmapToURL:()CPBitmap_Persistence error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Writing image to CPBitmap file url failed with error: %@", v2, v3, v4, v5, v6);
}

@end