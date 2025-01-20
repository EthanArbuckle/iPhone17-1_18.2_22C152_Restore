@interface BPSDrivableSink(BMBookmark)
- (void)newBookmark;
@end

@implementation BPSDrivableSink(BMBookmark)

- (void)newBookmark
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = [a1 status];
  v4 = [v3 subscription];
  int v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1AD01F000, a2, OS_LOG_TYPE_ERROR, "Subscription %@ could not create bookmark", (uint8_t *)&v5, 0xCu);
}

@end