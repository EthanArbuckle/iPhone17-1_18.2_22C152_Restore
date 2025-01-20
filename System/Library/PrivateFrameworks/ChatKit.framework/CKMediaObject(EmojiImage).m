@interface CKMediaObject(EmojiImage)
- (void)cachedBlastdooredAdaptiveImageGlyph;
- (void)generateAndCacheBlastdooredAdaptiveImageGlyph;
@end

@implementation CKMediaObject(EmojiImage)

- (void)cachedBlastdooredAdaptiveImageGlyph
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Emoji image is not previewable, bailing on generation.", v2, v3, v4, v5, v6);
}

- (void)generateAndCacheBlastdooredAdaptiveImageGlyph
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11(&dword_18EF18000, v0, v1, "Generating emoji image for cache key: %@", v2, v3, v4, v5, v6);
}

- (void)saveAdaptiveImageGlyphToFileCache:()EmojiImage .cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18EF18000, v0, OS_LOG_TYPE_DEBUG, "Not saving generated adaptive image glyph to file cache due to process limitations.", v1, 2u);
}

@end