@interface CKMultiFrameImage(ASTC_Persistence)
@end

@implementation CKMultiFrameImage(ASTC_Persistence)

+ (void)multiFrameImageWithContentsOfASTCURL:()ASTC_Persistence error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Attempting to create multi frame image with a nil ASTC URL", v2, v3, v4, v5, v6);
}

+ (void)multiFrameImageWithContentsOfASTCURL:()ASTC_Persistence error:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_18EF18000, v0, v1, "Error reading data for multi frame image from URL (%@) %@");
}

+ (void)multiFrameImageWithContentsOfASTCURL:()ASTC_Persistence error:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_18EF18000, v0, v1, "Error creating multi frame image with URL (%@) %@");
}

+ (void)multiFrameImageWithASTCData:()ASTC_Persistence error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Attempting to create animated image with a nil ASTC Data", v2, v3, v4, v5, v6);
}

+ (void)multiFrameImageWithASTCData:()ASTC_Persistence error:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Magic bit is outside the bounds of the file, bailing on atsc image loading.", v2, v3, v4, v5, v6);
}

+ (void)multiFrameImageWithASTCData:()ASTC_Persistence error:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "File has too many frames, bailing on atsc image loading.", v2, v3, v4, v5, v6);
}

+ (void)multiFrameImageWithASTCData:()ASTC_Persistence error:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Metadata dictionary indicated size is larger than remaining file size, bailing on atsc image loading.", v2, v3, v4, v5, v6);
}

+ (void)multiFrameImageWithASTCData:()ASTC_Persistence error:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Metadata dictionary data not found, bailing on atsc image loading.", v2, v3, v4, v5, v6);
}

+ (void)multiFrameImageWithASTCData:()ASTC_Persistence error:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Image size for frame %ld is larger than remaining file size, bailing on multi frame image loading.", v2, v3, v4, v5, v6);
}

+ (void)multiFrameImageWithASTCData:()ASTC_Persistence error:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Image data for frame %ld is larger than remaining file size, bailing on multi frame image loading.", v2, v3, v4, v5, v6);
}

+ (void)multiFrameImageWithASTCData:()ASTC_Persistence error:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Failed to get NSData subdata for image frame %ld, bailing on multi frame image loading.", v2, v3, v4, v5, v6);
}

+ (void)multiFrameImageWithASTCData:()ASTC_Persistence error:.cold.9()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Failed to create CGImageSourc from image date for frame %ld, bailing on multi frame image loading.", v2, v3, v4, v5, v6);
}

+ (void)multiFrameImageWithASTCData:()ASTC_Persistence error:.cold.10()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Failed to create CGImage from image source for frame %ld, bailing on multi frame image loading.", v2, v3, v4, v5, v6);
}

+ (void)multiFrameImageWithASTCData:()ASTC_Persistence error:.cold.11()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Failed to create UIImage for frame %ld, bailing on multi frame image loading.", v2, v3, v4, v5, v6);
}

+ (void)multiFrameImageWithASTCData:()ASTC_Persistence error:.cold.12(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Image did not include a scale in metadata, using display scale", buf, 2u);
}

+ (void)multiFrameImageWithASTCData:()ASTC_Persistence error:.cold.13()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Metadata dictionary has neither a global image scale nor per frame image scales, bailing on atsc image loading.", v2, v3, v4, v5, v6);
}

+ (void)multiFrameImageWithASTCData:()ASTC_Persistence error:.cold.14()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Metadata dictionary is of an unexpected format, bailing on atsc image loading.", v2, v3, v4, v5, v6);
}

+ (void)multiFrameImageWithASTCData:()ASTC_Persistence error:.cold.15()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Magic bit does not match expected atsc magic bit, bailing on atsc image loading.", v2, v3, v4, v5, v6);
}

+ (void)ASTCDataForImagesWithCount:()ASTC_Persistence imageProvider:durations:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Failed to create astc NSData for multi frame image. Error: %@", v2, v3, v4, v5, v6);
}

+ (void)writeASTCImagesWithCount:()ASTC_Persistence imageProvider:durations:toFileURL:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Failed to write astc data to file for multi frame image. Error: %@", v2, v3, v4, v5, v6);
}

+ (void)_writeASTCImagesWithCount:()ASTC_Persistence imageProvider:durations:toOutputStream:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Failure to create NSStream", v2, v3, v4, v5, v6);
}

+ (void)_writeASTCImagesWithCount:()ASTC_Persistence imageProvider:durations:toOutputStream:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Failed to write CKMultiFrameImage format magic bytes to stream with error: %@", v2, v3, v4, v5, v6);
}

+ (void)_writeASTCImagesWithCount:()ASTC_Persistence imageProvider:durations:toOutputStream:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Failed to write frame count to stream with error: %@", v2, v3, v4, v5, v6);
}

+ (void)_writeASTCImagesWithCount:()ASTC_Persistence imageProvider:durations:toOutputStream:error:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Failed to write plist data length to stream with error: %@", v2, v3, v4, v5, v6);
}

+ (void)_writeASTCImagesWithCount:()ASTC_Persistence imageProvider:durations:toOutputStream:error:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Metadata dictionary writing to atsc output stream failed. Error: %@", v2, v3, v4, v5, v6);
}

+ (void)_writeASTCImagesWithCount:()ASTC_Persistence imageProvider:durations:toOutputStream:error:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Image from provider block is nil, breaking.", v2, v3, v4, v5, v6);
}

+ (void)_writeASTCImagesWithCount:()ASTC_Persistence imageProvider:durations:toOutputStream:error:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Failed to write image data length to stream with error: %@", v2, v3, v4, v5, v6);
}

+ (void)_writeASTCImagesWithCount:()ASTC_Persistence imageProvider:durations:toOutputStream:error:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Image destination failed to finalize.", v2, v3, v4, v5, v6);
}

+ (void)_writeASTCImagesWithCount:()ASTC_Persistence imageProvider:durations:toOutputStream:error:.cold.9()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Duration count does not match image count", v2, v3, v4, v5, v6);
}

@end