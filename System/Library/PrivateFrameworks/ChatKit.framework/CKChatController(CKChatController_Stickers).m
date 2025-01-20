@interface CKChatController(CKChatController_Stickers)
@end

@implementation CKChatController(CKChatController_Stickers)

- (void)_prepareForDropAnimationWithItem:()CKChatController_Stickers preview:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "_prepareForDropAnimationWithItem failed without a preview container for dragPreview: %@", v2, v3, v4, v5, v6);
}

- (void)_sendStickerForDragItem:()CKChatController_Stickers previewSize:dropLocation:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Missing sticker image in emoji sticker image drag", v2, v3, v4, v5, v6);
}

- (void)sendSticker:()CKChatController_Stickers withMediaObject:composition:parentMessagePartChatItem:messageSummaryInfo:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Unable to send nil sticker", v2, v3, v4, v5, v6);
}

- (void)sendSticker:()CKChatController_Stickers withMediaObject:composition:parentMessagePartChatItem:messageSummaryInfo:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Unable to send nil media object", v2, v3, v4, v5, v6);
}

- (void)sendSticker:()CKChatController_Stickers withMediaObject:composition:parentMessagePartChatItem:messageSummaryInfo:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Unable to send nil composition", v2, v3, v4, v5, v6);
}

- (void)repositionSticker:()CKChatController_Stickers stickerChatItem:parentMessagePartChatItem:stickerPositioningInfo:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Unable to reposition - missing reposition info", v2, v3, v4, v5, v6);
}

- (void)repositionSticker:()CKChatController_Stickers stickerChatItem:parentMessagePartChatItem:stickerPositioningInfo:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Unable to reposition - nil sticker positioning info", v2, v3, v4, v5, v6);
}

- (void)repositionSticker:()CKChatController_Stickers stickerChatItem:parentMessagePartChatItem:stickerPositioningInfo:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Unable to reposition - nil sticker chat item", v2, v3, v4, v5, v6);
}

- (void)repositionSticker:()CKChatController_Stickers stickerChatItem:parentMessagePartChatItem:stickerPositioningInfo:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Unable to reposition - nil sticker", v2, v3, v4, v5, v6);
}

- (void)repositionSticker:()CKChatController_Stickers stickerChatItem:parentMessagePartChatItem:stickerPositioningInfo:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Unable to reposition - Sticker repositioning feature flag is turned off", v2, v3, v4, v5, v6);
}

@end