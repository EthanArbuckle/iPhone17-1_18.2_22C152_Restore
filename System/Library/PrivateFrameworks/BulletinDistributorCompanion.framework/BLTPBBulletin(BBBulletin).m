@interface BLTPBBulletin(BBBulletin)
@end

@implementation BLTPBBulletin(BBBulletin)

+ (void)bulletinWithBBBulletin:()BBBulletin sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "When trying to add shouldAddToNotificationsList to user notification, found requestNotification but no content: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)bulletinWithBBBulletin:()BBBulletin sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  v1 = [v0 eventBehavior];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_222F4C000, v2, v3, "Error encoding event behavior %@: %@", v4, v5, v6, v7, v8);
}

+ (void)bulletinWithBBBulletin:()BBBulletin sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:.cold.3()
{
  OUTLINED_FUNCTION_2_1();
  v1 = [v0 attributedMessage];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_222F4C000, v2, v3, "Error encoding attributed message %@: %@", v4, v5, v6, v7, v8);
}

+ (void)bulletinWithBBBulletin:()BBBulletin sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:.cold.4()
{
  OUTLINED_FUNCTION_2_1();
  v1 = [v0 threadSummary];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_222F4C000, v2, v3, "Error encoding thread summary %@: %@", v4, v5, v6, v7, v8);
}

+ (void)bulletinWithBBBulletin:()BBBulletin sockPuppetAppBundleID:observer:feed:teamID:universalSectionID:shouldUseExpirationDate:replyToken:gizmoLegacyPublisherBulletinID:gizmoLegacyCategoryID:gizmoSectionID:gizmoSectionSubtype:useUserInfoForContext:removeSubtitleForOlderWatches:.cold.5()
{
  OUTLINED_FUNCTION_2_1();
  v1 = [v0 summary];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_222F4C000, v2, v3, "Error encoding summary %@: %@", v4, v5, v6, v7, v8);
}

+ (void)_attachmentFromBBAttachmentMetadata:()BBBulletin bulletin:observer:fileOption:attachOption:completion:.cold.1()
{
  __assert_rtn("+[BLTPBBulletin(BBBulletin) _attachmentFromBBAttachmentMetadata:bulletin:observer:fileOption:attachOption:completion:]", "BLTPBBulletin+BBBulletin.m", 596, "completion != nil");
}

+ (void)_attachmentFromBBAttachmentMetadata:()BBBulletin bulletin:observer:fileOption:attachOption:completion:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  v1 = [v0 publisherBulletinID];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_0(&dword_222F4C000, v2, v3, "%@ Image attachment processing failed for: %@", v4, v5, v6, v7, v8);
}

+ (void)_attachmentFromBBAttachmentMetadata:()BBBulletin bulletin:observer:fileOption:attachOption:completion:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "Unable to create temporary attachment file for bulletin %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_handleThumbnailResponse:()BBBulletin attachmentMetadata:transcodedAttachmentSaveURL:wantsData:imageContentType:.cold.1(uint64_t a1, void *a2)
{
  uint8_t v8 = [a2 URL];
  OUTLINED_FUNCTION_3_0(&dword_222F4C000, v2, v3, "_handleThumbnailResponse: QLThumbnailGenerator could not generate thumbnail for attachement error:%@ url:%@", v4, v5, v6, v7, 2u);
}

@end