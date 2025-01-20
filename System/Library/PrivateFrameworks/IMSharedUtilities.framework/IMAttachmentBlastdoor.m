@interface IMAttachmentBlastdoor
+ (BOOL)supportsFeature:(id)a3;
+ (id)blastdoorInterfaceForSenderContext:(id)a3;
+ (id)generateImagePreviewForFileURL:(id)a3 senderContext:(id)a4 maxPixelDimension:(float)a5 scale:(float)a6 error:(id *)a7;
+ (id)logger;
+ (void)defuseBalloonPluginPayloadData:(id)a3 senderContext:(id)a4 withBundleIdentifier:(id)a5 completionBlock:(id)a6;
+ (void)generateAnimatedImagePreview:(id)a3 senderContext:(id)a4 destinationFileURL:(id)a5 maxPixelDimension:(double)a6 scale:(double)a7 maxFrameCount:(int64_t)a8 isSticker:(BOOL)a9 withCompletionBlock:(id)a10;
+ (void)generateAnimatedImagePreview:(id)a3 senderContext:(id)a4 maxPixelDimension:(double)a5 index:(int64_t)a6 maxCount:(int64_t)a7 withCompletionBlock:(id)a8;
+ (void)generateAudioPreview:(id)a3 senderContext:(id)a4 withCompletionBlock:(id)a5;
+ (void)generateEmojiImagePreview:(id)a3 senderContext:(id)a4 frameIndex:(int64_t)a5 maxPixelDimension:(double)a6 withCompletionBlock:(id)a7;
+ (void)generateMoviePreview:(id)a3 senderContext:(id)a4 maxPxWidth:(double)a5 minThumbnailPxSize:(CGSize)a6 scale:(double)a7 withCompletionBlock:(id)a8;
+ (void)generateNickname:(id)a3 senderContext:(id)a4 forRecordID:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8 withKey:(id)a9 processImageFields:(BOOL)a10 completionBlock:(id)a11;
+ (void)generatePassPreview:(id)a3 senderContext:(id)a4 withCompletionBlock:(id)a5;
+ (void)generatePreview:(id)a3 senderContext:(id)a4 maxPxWidth:(double)a5 scale:(double)a6 withCompletionBlock:(id)a7;
+ (void)generateWorkoutPreview:(id)a3 senderContext:(id)a4 maxPxWidth:(double)a5 scale:(double)a6 withCompletionBlock:(id)a7;
+ (void)getMetadataForAnimatedImage:(id)a3 senderContext:(id)a4 maxCount:(int64_t)a5 withCompletionBlock:(id)a6;
+ (void)getMetadataForEmojiImageWithFileURL:(id)a3 senderContext:(id)a4 maxStrikeCount:(int64_t)a5 withCompletionBlock:(id)a6;
+ (void)sendBalloonPluginPayloadData:(id)a3 senderContext:(id)a4 withBundleIdentifier:(id)a5 completionBlock:(id)a6;
+ (void)sendData:(id)a3 senderContext:(id)a4 forPreviewType:(unsigned __int8)a5 withCompletionBlock:(id)a6;
@end

@implementation IMAttachmentBlastdoor

+ (id)logger
{
  if (qword_1EB4A6300 != -1) {
    dispatch_once(&qword_1EB4A6300, &unk_1EF2BF280);
  }
  return (id)qword_1EB4A62F0;
}

+ (BOOL)supportsFeature:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (qword_1E94FF328 != -1) {
    dispatch_once(&qword_1E94FF328, &unk_1EF2C0720);
  }
  if (objc_opt_respondsToSelector())
  {
    int v4 = [(id)qword_1E94FF330 supportsFeature:a3];
    v5 = +[IMAttachmentBlastdoor logger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = @"NO";
      if (v4) {
        v6 = @"YES";
      }
      int v9 = 138412546;
      id v10 = a3;
      __int16 v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_DEFAULT, "Installed BlastDoor supports feature %@ (%@)", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    v7 = +[IMAttachmentBlastdoor logger];
    LOBYTE(v4) = 0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = a3;
      _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_DEFAULT, "Outdated BlastDoor: Cannot check feature (%@) support", (uint8_t *)&v9, 0xCu);
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

+ (id)blastdoorInterfaceForSenderContext:(id)a3
{
  if ([+[IMFeatureFlags sharedFeatureFlags] isUnknownSenderBlastDoorEnabled])
  {
    if (qword_1EB4A5E40 != -1) {
      dispatch_once(&qword_1EB4A5E40, &unk_1EF2C09E0);
    }
    if (qword_1EB4A5E58 != -1) {
      dispatch_once(&qword_1EB4A5E58, &unk_1EF2C0A20);
    }
    int v4 = [a3 isTrustedSender];
    v5 = &qword_1EB4A5E48;
    if (!v4) {
      v5 = &qword_1EB4A5E50;
    }
    return (id)*v5;
  }
  else
  {
    if (qword_1E94FF4B8 != -1) {
      dispatch_once(&qword_1E94FF4B8, &unk_1EF2C0B00);
    }
    return (id)qword_1E94FF4C0;
  }
}

+ (void)generatePreview:(id)a3 senderContext:(id)a4 maxPxWidth:(double)a5 scale:(double)a6 withCompletionBlock:(id)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3 && a7)
  {
    uint64_t v13 = +[IMAttachmentBlastdoor logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = a3;
      _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_DEFAULT, "Sending request to generate preview to BlastDoor for %@", buf, 0xCu);
    }
    v14 = (void *)[a1 blastdoorInterfaceForSenderContext:a4];
    *(float *)&double v15 = a5;
    *(float *)&double v16 = a6;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1A07C722C;
    v21[3] = &unk_1E5A10CD8;
    v21[4] = a7;
    [v14 generatePreviewforAttachmentWithfileURL:a3 maxPixelDimension:v21 scale:v15 resultHandler:v16];
  }
  else
  {
    v17 = +[IMAttachmentBlastdoor logger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = a7;
      __int16 v24 = 2112;
      id v25 = a3;
      _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_DEFAULT, "Invalid image preview input. Completion? %@, sourceURL? %@", buf, 0x16u);
    }
    if (a7)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      if (a3) {
        v19 = (__CFString *)[a3 absoluteString];
      }
      else {
        v19 = @"NO";
      }
      uint64_t v20 = objc_msgSend(v18, "initWithObjectsAndKeys:", v19, @"sourceURL", 0);
      (*((void (**)(id, void, uint64_t))a7 + 2))(a7, 0, [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMCoreAttachmentBlastdoorErrorDomain" code:13301 userInfo:v20]);
    }
  }
}

+ (void)generateWorkoutPreview:(id)a3 senderContext:(id)a4 maxPxWidth:(double)a5 scale:(double)a6 withCompletionBlock:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a3 && a7)
  {
    uint64_t v13 = +[IMAttachmentBlastdoor logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = a3;
      _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_DEFAULT, "Sending request to generate workout preview to BlastDoor for %@", buf, 0xCu);
    }
    v14 = (void *)[a1 blastdoorInterfaceForSenderContext:a4];
    *(float *)&double v15 = a5;
    *(float *)&double v16 = a6;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1A07C760C;
    v21[3] = &unk_1E5A10CD8;
    v21[4] = a7;
    [v14 generateWorkoutPreviewForAttachmentWithFileURL:a3 maxPixelDimension:v21 scale:v15 resultHandler:v16];
  }
  else
  {
    v17 = +[IMAttachmentBlastdoor logger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v23 = a7;
      __int16 v24 = 2112;
      id v25 = a3;
      __int16 v26 = 2048;
      double v27 = a5;
      __int16 v28 = 2048;
      double v29 = a6;
      _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_DEFAULT, "Invalid workout preview input. Completion? %@, sourceURL? %@, maxPxWidth: %f, scale: %f", buf, 0x2Au);
    }
    if (a7)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      if (a3) {
        v19 = (__CFString *)[a3 absoluteString];
      }
      else {
        v19 = @"NO";
      }
      uint64_t v20 = objc_msgSend(v18, "initWithObjectsAndKeys:", v19, @"sourceURL", 0);
      (*((void (**)(id, void, uint64_t))a7 + 2))(a7, 0, [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMCoreAttachmentBlastdoorErrorDomain" code:13301 userInfo:v20]);
    }
  }
}

+ (void)sendData:(id)a3 senderContext:(id)a4 forPreviewType:(unsigned __int8)a5 withCompletionBlock:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3 && a6)
  {
    uint64_t v8 = a5;
    __int16 v11 = +[IMAttachmentBlastdoor logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v21 = v8;
      _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_DEFAULT, "Piping data through BlastDoor for preview type: %u", buf, 8u);
    }
    v12 = (void *)[a1 blastdoorInterfaceForSenderContext:a4];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1A07C78D0;
    v18[3] = &unk_1E5A10D00;
    char v19 = v8;
    v18[4] = a6;
    [v12 defuseData:a3 forPreviewType:v8 resultHandler:v18];
  }
  else if (a6)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    if (a3) {
      v14 = (__CFString *)[a3 description];
    }
    else {
      v14 = @"NO";
    }
    uint64_t v15 = objc_msgSend(v13, "initWithObjectsAndKeys:", v14, @"data", 0);
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMCoreAttachmentBlastdoorErrorDomain" code:13301 userInfo:v15];
    v17 = (void (*)(id, void, uint64_t))*((void *)a6 + 2);
    v17(a6, 0, v16);
  }
}

+ (void)generateMoviePreview:(id)a3 senderContext:(id)a4 maxPxWidth:(double)a5 minThumbnailPxSize:(CGSize)a6 scale:(double)a7 withCompletionBlock:(id)a8
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a3 && a8)
  {
    double height = a6.height;
    double width = a6.width;
    uint64_t v16 = +[IMAttachmentBlastdoor logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = a3;
      _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_DEFAULT, "Sending request to generate movie preview to BlastDoor for %@", buf, 0xCu);
    }
    v17 = (void *)[a1 blastdoorInterfaceForSenderContext:a4];
    *(float *)&double v18 = a5;
    *(float *)&double v19 = a7;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1A07C7CCC;
    v24[3] = &unk_1E5A10CD8;
    v24[4] = a8;
    objc_msgSend(v17, "generateMoviePreviewForAttachmentWithFileURL:maxPixelDimension:minThumbnailPxSize:scale:resultHandler:", a3, v24, v18, width, height, v19);
  }
  else
  {
    uint64_t v20 = +[IMAttachmentBlastdoor logger];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v26 = a8;
      __int16 v27 = 2112;
      id v28 = a3;
      __int16 v29 = 2048;
      double v30 = a5;
      __int16 v31 = 2048;
      double v32 = a7;
      _os_log_impl(&dword_1A0772000, v20, OS_LOG_TYPE_DEFAULT, "Invalid movie preview input. Completion? %@, sourceURL? %@, maxPxWidth: %f, scale: %f", buf, 0x2Au);
    }
    if (a8)
    {
      id v21 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      if (a3) {
        uint64_t v22 = (__CFString *)[a3 absoluteString];
      }
      else {
        uint64_t v22 = @"NO";
      }
      uint64_t v23 = objc_msgSend(v21, "initWithObjectsAndKeys:", v22, @"sourceURL", 0);
      (*((void (**)(id, void, uint64_t))a8 + 2))(a8, 0, [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMCoreAttachmentBlastdoorErrorDomain" code:13301 userInfo:v23]);
    }
  }
}

+ (void)defuseBalloonPluginPayloadData:(id)a3 senderContext:(id)a4 withBundleIdentifier:(id)a5 completionBlock:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a6)
  {
    if (a3)
    {
      uint64_t v22 = 0;
      uint64_t v8 = objc_msgSend((id)objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", a4), "defuseBalloonPluginPayload:withIdentifier:error:", a3, a5, &v22);
      int v9 = +[IMAttachmentBlastdoor logger];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v24 = (uint64_t)v8;
        __int16 v25 = 2112;
        id v26 = a5;
        _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_DEFAULT, "Blastdoor response %p received (identifier: %@)", buf, 0x16u);
      }
      if (v8)
      {
        switch(objc_msgSend((id)objc_msgSend(v8, "payload"), "type"))
        {
          case 0:
            uint64_t v10 = objc_msgSend((id)objc_msgSend(v8, "payload"), "messagesAppBalloon");
            goto LABEL_23;
          case 1:
            uint64_t v10 = objc_msgSend((id)objc_msgSend(v8, "payload"), "handwriting");
            goto LABEL_23;
          case 2:
            uint64_t v10 = objc_msgSend((id)objc_msgSend(v8, "payload"), "linkPresentation");
            goto LABEL_23;
          case 3:
            id v21 = +[IMAttachmentBlastdoor logger];
            if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_21;
            }
            *(_WORD *)buf = 0;
            double v18 = "[WARN] Should not have received BlastDoorBalloonPluginPayloadCombinedPluginAttachmentInfo back as payload type.";
            double v19 = v21;
            uint32_t v20 = 2;
            goto LABEL_20;
          case 4:
            uint64_t v10 = objc_msgSend((id)objc_msgSend(v8, "payload"), "digitalTouchBalloon");
LABEL_23:
            uint64_t v14 = v10;
            goto LABEL_24;
          default:
            uint64_t v16 = +[IMAttachmentBlastdoor logger];
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_21;
            }
            uint64_t v17 = objc_msgSend((id)objc_msgSend(v8, "payload"), "type");
            *(_DWORD *)buf = 134217984;
            uint64_t v24 = v17;
            double v18 = "[WARN] Unable to handle unknown payload type (type: %tu).";
            double v19 = v16;
            uint32_t v20 = 12;
LABEL_20:
            _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
LABEL_21:
            uint64_t v14 = 0;
LABEL_24:
            uint64_t v15 = [v8 attachments];
            break;
        }
      }
      else
      {
        id v13 = +[IMAttachmentBlastdoor logger];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_1A09EF75C(&v22, v13);
        }
        uint64_t v14 = 0;
        uint64_t v15 = 0;
      }
      (*((void (**)(id, uint64_t, uint64_t, uint64_t))a6 + 2))(a6, v14, v15, v22);
    }
    else
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMCoreAttachmentBlastdoorErrorDomain" code:13400 userInfo:0];
      v12 = (void (*)(id, void, void, uint64_t))*((void *)a6 + 2);
      v12(a6, 0, 0, v11);
    }
  }
}

+ (void)sendBalloonPluginPayloadData:(id)a3 senderContext:(id)a4 withBundleIdentifier:(id)a5 completionBlock:(id)a6
{
  if (a6)
  {
    if (a3)
    {
      uint64_t v10 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v12 = sub_1A07C80DC;
      id v13 = &unk_1E5A10D28;
      id v14 = a5;
      id v15 = a6;
      uint64_t v7 = objc_msgSend((id)objc_msgSend(a1, "blastdoorInterfaceForSenderContext:", a4), "defuseBalloonPluginPayload:withIdentifier:error:", a3, a5, &v10);
      v12((uint64_t)v11, (void *)v7, v10);
    }
    else
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMCoreAttachmentBlastdoorErrorDomain" code:13400 userInfo:0];
      int v9 = (void (*)(id, void, void, uint64_t))*((void *)a6 + 2);
      v9(a6, 0, 0, v8);
    }
  }
}

+ (void)generateAudioPreview:(id)a3 senderContext:(id)a4 withCompletionBlock:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3 && a5)
  {
    uint64_t v7 = (void *)[a1 blastdoorInterfaceForSenderContext:a4];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1A07C85A4;
    v12[3] = &unk_1E5A10D50;
    v12[4] = a3;
    v12[5] = a5;
    [v7 generatePreviewforAudioMessageWithfileURL:a3 resultHandler:v12];
  }
  else
  {
    uint64_t v8 = +[IMAttachmentBlastdoor logger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = a5;
      __int16 v15 = 2112;
      id v16 = a3;
      _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_DEFAULT, "Invalid audio preview input. Completion? %@, sourceURL? %@", buf, 0x16u);
    }
    if (a5)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      if (a3) {
        uint64_t v10 = (__CFString *)[a3 absoluteString];
      }
      else {
        uint64_t v10 = @"NO";
      }
      uint64_t v11 = objc_msgSend(v9, "initWithObjectsAndKeys:", v10, @"sourceURL", 0);
      (*((void (**)(id, void, uint64_t))a5 + 2))(a5, 0, [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMCoreAttachmentBlastdoorErrorDomain" code:13301 userInfo:v11]);
    }
  }
}

+ (void)generateNickname:(id)a3 senderContext:(id)a4 forRecordID:(id)a5 wallpaperDataTag:(id)a6 wallpaperLowResDataTag:(id)a7 wallpaperMetadataTag:(id)a8 withKey:(id)a9 processImageFields:(BOOL)a10 completionBlock:(id)a11
{
  v28[6] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6C360], "sharedInstance"), "isInternalInstall")
    && IMGetCachedDomainBoolForKeyWithDefaultValue())
  {
    v27[0] = @"nicknameData";
    v27[1] = @"recordID";
    v28[0] = a3;
    v28[1] = a5;
    v27[2] = @"wallpaperDataTag";
    v27[3] = @"wallpaperLowResDataTag";
    v28[2] = a6;
    v28[3] = a7;
    v27[4] = @"wallpaperMetadataTag";
    v27[5] = @"key";
    v28[4] = a8;
    v28[5] = a9;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:6];
    +[IMInternalPayloadUtilities writeMessagePayloadToDisk:fileName:](IMInternalPayloadUtilities, "writeMessagePayloadToDisk:fileName:", v18, [NSString stringWithFormat:@"%@.nicknamedata", objc_msgSend(NSString, "stringGUID")]);
  }
  [a1 blastdoorInterfaceForSenderContext:a4];
  char v19 = objc_opt_respondsToSelector();
  uint32_t v20 = (void *)[a1 blastdoorInterfaceForSenderContext:a4];
  if (v19)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1A07C899C;
    v26[3] = &unk_1E5A10CD8;
    v26[4] = a11;
    LOBYTE(v23) = a10;
    [v20 defuseNicknameDictionary:a3 withKey:a9 recordTag:a5 wallpaperDataTag:a6 wallpaperLowResDataTag:a7 wallpaperMetadataTag:a8 processImageFields:v23 resultHandler:v26];
  }
  else
  {
    char v21 = objc_opt_respondsToSelector();
    uint64_t v22 = (void *)[a1 blastdoorInterfaceForSenderContext:a4];
    if (v21)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = sub_1A07C89AC;
      v25[3] = &unk_1E5A10CD8;
      v25[4] = a11;
      [v22 defuseNicknameDictionary:a3 withKey:a9 recordTag:a5 wallpaperDataTag:a6 wallpaperLowResDataTag:a7 wallpaperMetadataTag:a8 resultHandler:v25];
    }
    else
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = sub_1A07C89BC;
      v24[3] = &unk_1E5A10CD8;
      v24[4] = a11;
      [v22 defuseNicknameDictionary:a3 withKey:a9 recordTag:a5 resultHandler:v24];
    }
  }
}

+ (void)generatePassPreview:(id)a3 senderContext:(id)a4 withCompletionBlock:(id)a5
{
  if (a3 && a5)
  {
    uint64_t v7 = (void *)[a1 blastdoorInterfaceForSenderContext:a4];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1A07C8B90;
    v14[3] = &unk_1E5A10CD8;
    v14[4] = a5;
    [v7 generatePreviewforAttachmentWithfileURL:a3 maxPixelDimension:v14 scale:0.0 resultHandler:0.0];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v9 = @"NO";
    if (a5) {
      uint64_t v10 = @"YES";
    }
    else {
      uint64_t v10 = @"NO";
    }
    if (a3) {
      id v9 = (__CFString *)[a3 absoluteString];
    }
    uint64_t v11 = objc_msgSend(v8, "initWithObjectsAndKeys:", v10, @"completion", v9, @"sourceURL", 0);
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMCoreAttachmentBlastdoorErrorDomain" code:13301 userInfo:v11];
    id v13 = (void (*)(id, void, uint64_t))*((void *)a5 + 2);
    v13(a5, 0, v12);
  }
}

+ (void)generateAnimatedImagePreview:(id)a3 senderContext:(id)a4 destinationFileURL:(id)a5 maxPixelDimension:(double)a6 scale:(double)a7 maxFrameCount:(int64_t)a8 isSticker:(BOOL)a9 withCompletionBlock:(id)a10
{
  BOOL v11 = a9;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([+[IMFeatureFlags sharedFeatureFlags] isSessionAnimatedImageUnpackerEnabled])
  {
    if (a3 && a10)
    {
      char v19 = +[IMAttachmentBlastdoor logger];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = a3;
        _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_DEFAULT, "Sending request to generate animated image preview to BlastDoor for %@", buf, 0xCu);
      }
      uint32_t v20 = (void *)[a1 blastdoorInterfaceForSenderContext:a4];
      *(float *)&double v21 = a6;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = sub_1A07C906C;
      v33[3] = &unk_1E5A10D78;
      *(float *)&unsigned int v22 = a7;
      v33[4] = a4;
      v33[5] = a10;
      [v20 generatePreviewForMultiFrameImageWithFileURL:a3 destinationFileURL:a5 maxPixelDimension:a8 scale:v11 maxFrameCount:v33 isSticker:v21 resultHandler:COERCE_DOUBLE((unint64_t)v22)];
    }
    else
    {
      id v26 = +[IMAttachmentBlastdoor logger];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v35 = a10;
        __int16 v36 = 2112;
        id v37 = a3;
        _os_log_impl(&dword_1A0772000, v26, OS_LOG_TYPE_DEFAULT, "Invalid animated image preview input. Completion? %@, sourceURL? %@", buf, 0x16u);
      }
      if (a10)
      {
        id v27 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        if (a3) {
          id v28 = (__CFString *)[a3 absoluteString];
        }
        else {
          id v28 = @"NO";
        }
        uint64_t v31 = objc_msgSend(v27, "initWithObjectsAndKeys:", v28, @"sourceURL", 0);
        uint64_t v32 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMCoreAttachmentBlastdoorErrorDomain" code:13301 userInfo:v31];
        (*((void (**)(id, void, uint64_t, double, double))a10 + 2))(a10, 0, v32, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      }
    }
  }
  else
  {
    uint64_t v23 = +[IMAttachmentBlastdoor logger];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = a3;
      _os_log_impl(&dword_1A0772000, v23, OS_LOG_TYPE_DEFAULT, "Calling wrong animated image preview - isSessionAnimatedImageUnpackerEnabled is not true, sourceURL? %@", buf, 0xCu);
    }
    if (a10)
    {
      id v24 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      if (a3) {
        __int16 v25 = (__CFString *)[a3 absoluteString];
      }
      else {
        __int16 v25 = @"NO";
      }
      __int16 v29 = objc_msgSend(v24, "initWithObjectsAndKeys:", v25, @"sourceURL", 0);
      uint64_t v30 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMCoreAttachmentBlastdoorErrorDomain" code:13301 userInfo:v29];
      (*((void (**)(id, void, uint64_t, double, double))a10 + 2))(a10, 0, v30, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    }
  }
}

+ (void)getMetadataForAnimatedImage:(id)a3 senderContext:(id)a4 maxCount:(int64_t)a5 withCompletionBlock:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([+[IMFeatureFlags sharedFeatureFlags] isSessionAnimatedImageUnpackerEnabled])
  {
    BOOL v11 = +[IMAttachmentBlastdoor logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = a3;
      _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_DEFAULT, "Calling wrong animated image preview getMetadataForAnimatedImage - isSessionAnimatedImageUnpackerEnabled is true, sourceURL? %@", buf, 0xCu);
    }
    if (a6)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      if (a3) {
        id v13 = (__CFString *)[a3 absoluteString];
      }
      else {
        id v13 = @"NO";
      }
      char v19 = objc_msgSend(v12, "initWithObjectsAndKeys:", v13, @"sourceURL", 0);
      (*((void (**)(id, void, uint64_t))a6 + 2))(a6, 0, [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMCoreAttachmentBlastdoorErrorDomain" code:13301 userInfo:v19]);
    }
  }
  else if (a3 && a6)
  {
    id v14 = +[IMAttachmentBlastdoor logger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = a3;
      _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_DEFAULT, "Sending request to get metadata for animated image to BlastDoor for %@", buf, 0xCu);
    }
    __int16 v15 = (void *)[a1 blastdoorInterfaceForSenderContext:a4];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1A07C9640;
    v21[3] = &unk_1E5A10CD8;
    v21[4] = a6;
    [v15 getMetadataforAnimatedImageWithfileURL:a3 maxCount:a5 resultHandler:v21];
  }
  else
  {
    id v16 = +[IMAttachmentBlastdoor logger];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = a6;
      __int16 v24 = 2112;
      id v25 = a3;
      _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_DEFAULT, "Invalid input for getting animated image metadata. Completion? %@, sourceURL? %@", buf, 0x16u);
    }
    if (a6)
    {
      id v17 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      if (a3) {
        uint64_t v18 = (__CFString *)[a3 absoluteString];
      }
      else {
        uint64_t v18 = @"NO";
      }
      uint64_t v20 = objc_msgSend(v17, "initWithObjectsAndKeys:", v18, @"sourceURL", 0);
      (*((void (**)(id, void, uint64_t))a6 + 2))(a6, 0, [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMCoreAttachmentBlastdoorErrorDomain" code:13301 userInfo:v20]);
    }
  }
}

+ (void)generateAnimatedImagePreview:(id)a3 senderContext:(id)a4 maxPixelDimension:(double)a5 index:(int64_t)a6 maxCount:(int64_t)a7 withCompletionBlock:(id)a8
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([+[IMFeatureFlags sharedFeatureFlags] isSessionAnimatedImageUnpackerEnabled])
  {
    __int16 v15 = +[IMAttachmentBlastdoor logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = a3;
      _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_DEFAULT, "Calling wrong animated image preview - isSessionAnimatedImageUnpackerEnabled is true, sourceURL? %@", buf, 0xCu);
    }
    if (a8)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      if (!a3)
      {
        double v21 = @"NO";
        goto LABEL_19;
      }
LABEL_16:
      double v21 = (__CFString *)[a3 absoluteString];
LABEL_19:
      unsigned int v22 = objc_msgSend(v16, "initWithObjectsAndKeys:", v21, @"sourceURL", 0);
      (*((void (**)(id, void, uint64_t))a8 + 2))(a8, 0, [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMCoreAttachmentBlastdoorErrorDomain" code:13301 userInfo:v22]);
    }
  }
  else if (a3 && a8)
  {
    id v17 = +[IMAttachmentBlastdoor logger];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = a3;
      _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_DEFAULT, "Sending request to generate animated image preview to BlastDoor for %@", buf, 0xCu);
    }
    uint64_t v18 = (void *)[a1 blastdoorInterfaceForSenderContext:a4];
    *(float *)&double v19 = a5;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1A07C9AF0;
    v23[3] = &unk_1E5A10CD8;
    v23[4] = a8;
    [v18 generatePreviewforAnimatedImageWithfileURL:a3 maxPixelDimension:a6 index:a7 maxCount:v23 resultHandler:v19];
  }
  else
  {
    uint64_t v20 = +[IMAttachmentBlastdoor logger];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = a8;
      __int16 v26 = 2112;
      id v27 = a3;
      _os_log_impl(&dword_1A0772000, v20, OS_LOG_TYPE_DEFAULT, "Invalid animated image preview input. Completion? %@, sourceURL? %@", buf, 0x16u);
    }
    if (a8)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      if (!a3)
      {
        double v21 = @"NO";
        goto LABEL_19;
      }
      goto LABEL_16;
    }
  }
}

+ (id)generateImagePreviewForFileURL:(id)a3 senderContext:(id)a4 maxPixelDimension:(float)a5 scale:(float)a6 error:(id *)a7
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v13 = +[IMAttachmentBlastdoor logger];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = a3;
    _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_DEFAULT, "Sending request to generate synchronous image preview to BlastDoor for %@", (uint8_t *)&v18, 0xCu);
  }
  id v14 = (void *)[a1 blastdoorInterfaceForSenderContext:a4];
  *(float *)&double v15 = a5;
  *(float *)&double v16 = a6;
  return (id)[v14 generateImagePreviewForFileURL:a3 maxPixelDimension:a7 scale:v15 error:v16];
}

+ (void)getMetadataForEmojiImageWithFileURL:(id)a3 senderContext:(id)a4 maxStrikeCount:(int64_t)a5 withCompletionBlock:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3 && a6)
  {
    BOOL v11 = +[IMAttachmentBlastdoor logger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = a3;
      _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_DEFAULT, "Sending request to get metadata for emoji image to BlastDoor for %@", buf, 0xCu);
    }
    id v12 = (void *)[a1 blastdoorInterfaceForSenderContext:a4];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_1A07C9F84;
    v17[3] = &unk_1E5A10CD8;
    v17[4] = a6;
    [v12 getMetadataForEmojiImageWithFileURL:a3 maxStrikeCount:a5 resultHandler:v17];
  }
  else
  {
    id v13 = +[IMAttachmentBlastdoor logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = a6;
      __int16 v20 = 2112;
      id v21 = a3;
      _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_DEFAULT, "Invalid input for getting emoji image metadata. Completion? %@, sourceURL? %@", buf, 0x16u);
    }
    if (a6)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      if (a3) {
        double v15 = (__CFString *)[a3 absoluteString];
      }
      else {
        double v15 = @"NO";
      }
      uint64_t v16 = objc_msgSend(v14, "initWithObjectsAndKeys:", v15, @"sourceURL", 0);
      (*((void (**)(id, void, uint64_t))a6 + 2))(a6, 0, [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMCoreAttachmentBlastdoorErrorDomain" code:13301 userInfo:v16]);
    }
  }
}

+ (void)generateEmojiImagePreview:(id)a3 senderContext:(id)a4 frameIndex:(int64_t)a5 maxPixelDimension:(double)a6 withCompletionBlock:(id)a7
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3 && a7)
  {
    id v13 = +[IMAttachmentBlastdoor logger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = a3;
      _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_DEFAULT, "Sending request to generate emoji image to BlastDoor for %@", buf, 0xCu);
    }
    id v14 = (void *)[a1 blastdoorInterfaceForSenderContext:a4];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1A07CA338;
    v19[3] = &unk_1E5A10CD8;
    v19[4] = a7;
    [v14 generatePreviewForEmojiImageWithFileURL:a3 frameIndex:a5 maxPixelDimension:v19 resultHandler:a6];
  }
  else
  {
    double v15 = +[IMAttachmentBlastdoor logger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = a7;
      __int16 v22 = 2112;
      id v23 = a3;
      _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_DEFAULT, "Invalid emoji image preview input. Completion? %@, sourceURL? %@", buf, 0x16u);
    }
    if (a7)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      if (a3) {
        id v17 = (__CFString *)[a3 absoluteString];
      }
      else {
        id v17 = @"NO";
      }
      uint64_t v18 = objc_msgSend(v16, "initWithObjectsAndKeys:", v17, @"sourceURL", 0);
      (*((void (**)(id, void, uint64_t))a7 + 2))(a7, 0, [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"__kIMCoreAttachmentBlastdoorErrorDomain" code:13301 userInfo:v18]);
    }
  }
}

@end