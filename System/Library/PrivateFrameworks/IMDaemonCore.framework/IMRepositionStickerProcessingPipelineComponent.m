@interface IMRepositionStickerProcessingPipelineComponent
- (BlastDoorStickerAttachmentInfo)stickerAttachmentInfo;
- (IMDiMessagePipelineResources)pipelineResources;
- (IMRepositionStickerProcessingPipelineComponent)initWithPipelineResources:(id)a3;
- (NSString)stickerEditedMessageGuid;
- (id)runIndividuallyWithInput:(id)a3;
- (void)setStickerAttachmentInfo:(id)a3;
- (void)setStickerEditedMessageGuid:(id)a3;
@end

@implementation IMRepositionStickerProcessingPipelineComponent

- (IMRepositionStickerProcessingPipelineComponent)initWithPipelineResources:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMRepositionStickerProcessingPipelineComponent;
  v6 = [(IMRepositionStickerProcessingPipelineComponent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pipelineResources, a3);
  }

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 GUID];

  int v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = [v4 GUID];
        int v40 = 138412290;
        v41 = v8;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "<IMRepositionStickerProcessingPipelineComponent> Started processing reposition sticker command for message GUID: %@", (uint8_t *)&v40, 0xCu);
      }
    }
    objc_super v9 = [v4 stickerAttachmentInfo];
    v10 = [MEMORY[0x1E4F1CA60] dictionary];
    v11 = NSNumber;
    [v9 stickerOffset];
    v12 = objc_msgSend(v11, "numberWithDouble:");
    [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F6E3D0]];

    v13 = NSNumber;
    [v9 stickerOffset];
    v15 = [v13 numberWithDouble:v14];
    [v10 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F6E3D8]];

    v16 = NSNumber;
    [v9 stickerScale];
    v17 = objc_msgSend(v16, "numberWithDouble:");
    [v10 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F6E380]];

    v18 = NSNumber;
    [v9 stickerRotation];
    v19 = objc_msgSend(v18, "numberWithDouble:");
    [v10 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F6E378]];

    v20 = NSNumber;
    [v9 parentPreviewWidth];
    v21 = objc_msgSend(v20, "numberWithDouble:");
    [v10 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F6E370]];

    v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "stickerPositionVersion"));
    [v10 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F6E3C0]];

    v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "positionIntent"));
    [v10 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F6E368]];

    v24 = [(IMRepositionStickerProcessingPipelineComponent *)self pipelineResources];
    v25 = [v24 messageStore];
    v26 = [v4 stickerEditedMessageGuid];
    v27 = [v25 messageWithGUID:v26];

    if (v27)
    {
      v28 = [v27 fileTransferGUIDs];
      v29 = [v28 firstObject];

      if (v29)
      {
        v30 = [(IMRepositionStickerProcessingPipelineComponent *)self pipelineResources];
        v31 = [v30 messageStore];
        v32 = [v27 fileTransferGUIDs];
        v33 = [v32 firstObject];
        id v34 = (id)[v31 storeRepositionedStickerWithMetadata:v10 fileTransferGUID:v33 repositioningFromLocalChange:0];
      }
      else if (IMOSLoggingEnabled())
      {
        v38 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          LOWORD(v40) = 0;
          _os_log_impl(&dword_1D967A000, v38, OS_LOG_TYPE_INFO, "Ignoring reposition sticker chat command, no file transfer found locally", (uint8_t *)&v40, 2u);
        }
      }
      v36 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v37 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          LOWORD(v40) = 0;
          _os_log_impl(&dword_1D967A000, v37, OS_LOG_TYPE_INFO, "Ignoring reposition sticker chat command, no valid message for GUID", (uint8_t *)&v40, 2u);
        }
      }
      v36 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
    }
  }
  else
  {
    if (v6)
    {
      v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        LOWORD(v40) = 0;
        _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "Ignoring reposition sticker chat command, no message guid received", (uint8_t *)&v40, 2u);
      }
    }
    v36 = (void *)[objc_alloc(MEMORY[0x1E4F6BE98]) initWithValue:v4];
  }

  return v36;
}

- (IMDiMessagePipelineResources)pipelineResources
{
  return self->_pipelineResources;
}

- (BlastDoorStickerAttachmentInfo)stickerAttachmentInfo
{
  return self->_stickerAttachmentInfo;
}

- (void)setStickerAttachmentInfo:(id)a3
{
}

- (NSString)stickerEditedMessageGuid
{
  return self->_stickerEditedMessageGuid;
}

- (void)setStickerEditedMessageGuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerEditedMessageGuid, 0);
  objc_storeStrong((id *)&self->_stickerAttachmentInfo, 0);

  objc_storeStrong((id *)&self->_pipelineResources, 0);
}

@end