@interface AVPlayerItem
@end

@implementation AVPlayerItem

void __75__AVPlayerItem_AVKitAdditionsPrivate__avkit_airMessageSendExternalMetadata__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v5 = _avairlog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    v7 = "-[AVPlayerItem(AVKitAdditionsPrivate) avkit_airMessageSendExternalMetadata]_block_invoke";
    __int16 v8 = 2048;
    uint64_t v9 = a3;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s Result of sending external metadata: %ld [%{public}@]", (uint8_t *)&v6, 0x20u);
  }
}

@end