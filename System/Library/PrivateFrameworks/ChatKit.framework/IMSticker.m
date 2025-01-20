@interface IMSticker
@end

@implementation IMSticker

void __82__IMSticker_CKUtils__stickerViewForStickerChatItem_snapshotEffectView_completion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [CKBalloonImageView alloc];
  v4 = -[CKBalloonImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v7)
  {
    [(CKBalloonImageView *)v4 setImage:v7];
  }
  else
  {
    v6 = [*(id *)(a1 + 32) image];
    [(CKBalloonImageView *)v5 setImage:v6];
  }
  [(CKBalloonImageView *)v5 setContentMode:1];
  [(CKBalloonImageView *)v5 sizeToFit];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __77__IMSticker_CKUtils__stickerEffectViewSnapshotForStickerChatItem_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5) {
    v6 = 0;
  }
  else {
    v6 = a2;
  }
  id v7 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__IMSticker_CKUtils__stickerEffectViewSnapshotForStickerChatItem_completion___block_invoke_2;
  v11[3] = &unk_1E5623828;
  id v8 = *(id *)(a1 + 32);
  id v12 = v7;
  id v13 = v8;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v11);
  if (v5)
  {
    v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __77__IMSticker_CKUtils__stickerEffectViewSnapshotForStickerChatItem_completion___block_invoke_cold_1(v5, v10);
    }
  }
}

uint64_t __77__IMSticker_CKUtils__stickerEffectViewSnapshotForStickerChatItem_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __77__IMSticker_CKUtils__stickerEffectViewSnapshotForStickerChatItem_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 localizedDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Could not snapshot effectView, ecountered error: %@", (uint8_t *)&v4, 0xCu);
}

@end