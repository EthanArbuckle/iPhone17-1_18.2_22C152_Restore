@interface CNiOSABDependentPropertiesUpdateContext
+ (BOOL)shouldSetWatchChanges;
+ (id)os_log;
- (BOOL)flushPendingImageChangesToPerson:(void *)a3 logger:(id)a4 error:(id *)a5;
- (BOOL)hasPendingCropRect;
- (BOOL)hasPendingImageData;
- (BOOL)hasPendingSyncImageData;
- (BOOL)hasPendingThumbnailImageData;
- (BOOL)isUnifiedContact;
- (BOOL)logIfConditionFailed:(BOOL)a3 message:(id)a4 error:(__CFError *)a5;
- (BOOL)setWatchChangesforThumbnailImageDataToPerson:(void *)a3 error:(id *)a4;
- (CGRect)pendingCropRect;
- (NSData)pendingFullscreenImageData;
- (NSData)pendingImageData;
- (NSData)pendingSyncImageData;
- (NSData)pendingThumbnailImageData;
- (void)resetAllData;
- (void)setHasPendingCropRect:(BOOL)a3;
- (void)setHasPendingImageData:(BOOL)a3;
- (void)setHasPendingSyncImageData:(BOOL)a3;
- (void)setHasPendingThumbnailImageData:(BOOL)a3;
- (void)setIsUnifiedContact:(BOOL)a3;
- (void)setPendingCropRect:(CGRect)a3;
- (void)setPendingFullscreenImageData:(id)a3;
- (void)setPendingImageData:(id)a3;
- (void)setPendingSyncImageData:(id)a3;
- (void)setPendingThumbnailImageData:(id)a3;
@end

@implementation CNiOSABDependentPropertiesUpdateContext

+ (id)os_log
{
  if (os_log_cn_once_token_0_15 != -1) {
    dispatch_once(&os_log_cn_once_token_0_15, &__block_literal_global_95);
  }
  v2 = (void *)os_log_cn_once_object_0_15;

  return v2;
}

uint64_t __49__CNiOSABDependentPropertiesUpdateContext_os_log__block_invoke()
{
  os_log_cn_once_object_0_15 = (uint64_t)os_log_create("com.apple.contacts", "CNiOSABDependentPropertiesUpdateContext");

  return MEMORY[0x1F41817F8]();
}

- (void)setPendingImageData:(id)a3
{
  if (self->_pendingImageData != a3)
  {
    v4 = (NSData *)[a3 copy];
    pendingImageData = self->_pendingImageData;
    self->_pendingImageData = v4;
  }

  [(CNiOSABDependentPropertiesUpdateContext *)self setHasPendingImageData:1];
}

- (void)setPendingCropRect:(CGRect)a3
{
  self->_pendingCropRect = a3;
  BOOL v4 = !CGRectEqualToRect(a3, *MEMORY[0x1E4F1DB28]);

  [(CNiOSABDependentPropertiesUpdateContext *)self setHasPendingCropRect:v4];
}

- (void)setPendingThumbnailImageData:(id)a3
{
  if (self->_pendingThumbnailImageData != a3)
  {
    BOOL v4 = (NSData *)[a3 copy];
    pendingThumbnailImageData = self->_pendingThumbnailImageData;
    self->_pendingThumbnailImageData = v4;
  }

  [(CNiOSABDependentPropertiesUpdateContext *)self setHasPendingThumbnailImageData:1];
}

- (void)setPendingSyncImageData:(id)a3
{
  if (self->_pendingSyncImageData != a3)
  {
    BOOL v4 = (NSData *)[a3 copy];
    pendingSyncImageData = self->_pendingSyncImageData;
    self->_pendingSyncImageData = v4;
  }

  [(CNiOSABDependentPropertiesUpdateContext *)self setHasPendingSyncImageData:1];
}

- (void)resetAllData
{
  pendingImageData = self->_pendingImageData;
  self->_pendingImageData = 0;

  pendingThumbnailImageData = self->_pendingThumbnailImageData;
  self->_pendingThumbnailImageData = 0;

  pendingFullscreenImageData = self->_pendingFullscreenImageData;
  self->_pendingFullscreenImageData = 0;

  pendingSyncImageData = self->_pendingSyncImageData;
  self->_pendingSyncImageData = 0;

  CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_pendingCropRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_pendingCropRect.size = v7;
  [(CNiOSABDependentPropertiesUpdateContext *)self setHasPendingCropRect:0];
  [(CNiOSABDependentPropertiesUpdateContext *)self setHasPendingImageData:0];
  [(CNiOSABDependentPropertiesUpdateContext *)self setHasPendingThumbnailImageData:0];

  [(CNiOSABDependentPropertiesUpdateContext *)self setHasPendingSyncImageData:0];
}

- (BOOL)logIfConditionFailed:(BOOL)a3 message:(id)a4 error:(__CFError *)a5
{
  id v7 = a4;
  if (!a3)
  {
    v8 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CNiOSABDependentPropertiesUpdateContext logIfConditionFailed:message:error:]((uint64_t)v7, (uint64_t)a5, v8);
    }
  }
  return 1;
}

- (BOOL)flushPendingImageChangesToPerson:(void *)a3 logger:(id)a4 error:(id *)a5
{
  id v8 = a4;
  BOOL v9 = [(CNiOSABDependentPropertiesUpdateContext *)self hasPendingImageData];
  BOOL v10 = [(CNiOSABDependentPropertiesUpdateContext *)self hasPendingCropRect];
  if (v9)
  {
    if (v10)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __89__CNiOSABDependentPropertiesUpdateContext_flushPendingImageChangesToPerson_logger_error___block_invoke_2;
      v28[3] = &unk_1E56B7D08;
      v28[4] = self;
      id v29 = v8;
      v30 = a3;
      char v11 = CNBridgeBoolResultAndErrorFromBlock(a5, (uint64_t)v28);
      v12 = v29;
    }
    else
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __89__CNiOSABDependentPropertiesUpdateContext_flushPendingImageChangesToPerson_logger_error___block_invoke;
      v31[3] = &unk_1E56B7D08;
      id v32 = v8;
      v33 = self;
      v34 = a3;
      char v11 = CNBridgeBoolResultAndErrorFromBlock(a5, (uint64_t)v31);
      v12 = v32;
    }
    goto LABEL_13;
  }
  if (v10)
  {
    [(CNiOSABDependentPropertiesUpdateContext *)self pendingCropRect];
    if (CGRectEqualToRect(v35, *MEMORY[0x1E4F1DB28]))
    {
LABEL_6:
      char v11 = 1;
      goto LABEL_14;
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __89__CNiOSABDependentPropertiesUpdateContext_flushPendingImageChangesToPerson_logger_error___block_invoke_3;
    v24[3] = &unk_1E56B7D08;
    v27 = a3;
    id v25 = v8;
    v26 = self;
    char v11 = CNBridgeBoolResultAndErrorFromBlock(a5, (uint64_t)v24);
    v12 = v25;
LABEL_13:

    goto LABEL_14;
  }
  v13 = [(CNiOSABDependentPropertiesUpdateContext *)self pendingFullscreenImageData];

  if (!v13)
  {
    if ([(CNiOSABDependentPropertiesUpdateContext *)self hasPendingThumbnailImageData])
    {
      v16 = [(CNiOSABDependentPropertiesUpdateContext *)self pendingThumbnailImageData];
      [v8 setContactImageDataZeroCropRect:v16 format:"watch changes"];

      char v11 = [(CNiOSABDependentPropertiesUpdateContext *)self setWatchChangesforThumbnailImageDataToPerson:a3 error:a5];
      goto LABEL_14;
    }
    if (![(CNiOSABDependentPropertiesUpdateContext *)self hasPendingSyncImageData]) {
      goto LABEL_6;
    }
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __89__CNiOSABDependentPropertiesUpdateContext_flushPendingImageChangesToPerson_logger_error___block_invoke_29;
    v20 = &unk_1E56B7D08;
    id v21 = v8;
    v22 = self;
    v23 = a3;
    char v11 = CNBridgeBoolResultAndErrorFromBlock(a5, (uint64_t)&v17);
    v12 = v21;
    goto LABEL_13;
  }
  v14 = os_log_create("com.apple.contacts", "data-access-error");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[CNiOSABDependentPropertiesUpdateContext flushPendingImageChangesToPerson:logger:error:](v14);
  }

  CNSetError(a5, 1015, 0);
  [(CNiOSABDependentPropertiesUpdateContext *)self logIfConditionFailed:0 message:@"not permitted to set fullscreen image data" error:0];
  char v11 = 0;
LABEL_14:
  [(CNiOSABDependentPropertiesUpdateContext *)self resetAllData];

  return v11;
}

BOOL __89__CNiOSABDependentPropertiesUpdateContext_flushPendingImageChangesToPerson_logger_error___block_invoke(uint64_t a1, CFErrorRef *a2)
{
  BOOL v4 = *(void **)(a1 + 32);
  v5 = [*(id *)(a1 + 40) pendingImageData];
  [v4 setContactImageData:v5];

  v6 = *(const void **)(a1 + 48);
  CFDataRef v7 = [*(id *)(a1 + 40) pendingImageData];
  BOOL v8 = ABPersonSetImageData(v6, v7, a2);

  [*(id *)(a1 + 40) logIfConditionFailed:v8 message:@"failed to set image data" error:a2];
  return v8;
}

BOOL __89__CNiOSABDependentPropertiesUpdateContext_flushPendingImageChangesToPerson_logger_error___block_invoke_2(uint64_t a1, CFErrorRef *a2)
{
  BOOL v4 = [*(id *)(a1 + 32) pendingImageData];

  v5 = *(void **)(a1 + 40);
  if (v4)
  {
    v6 = [*(id *)(a1 + 32) pendingImageData];
    [*(id *)(a1 + 32) pendingCropRect];
    objc_msgSend(v5, "setContactImageData:format:cropRect:", v6, "original");

    CFDataRef v7 = [*(id *)(a1 + 32) pendingImageData];
    [*(id *)(a1 + 32) pendingCropRect];
    CGRectGetMinX(v27);
    [*(id *)(a1 + 32) pendingCropRect];
    CGRectGetMinY(v28);
    [*(id *)(a1 + 32) pendingCropRect];
    CGRectGetWidth(v29);
    [*(id *)(a1 + 32) pendingCropRect];
    CGRectGetHeight(v30);
    uint64_t v8 = ABPersonSetImageDataWithCropRect();

    [*(id *)(a1 + 32) logIfConditionFailed:v8 message:@"failed to set image data with crop rect" error:a2];
    if (!v8) {
      return 0;
    }
    BOOL v9 = [*(id *)(a1 + 32) pendingThumbnailImageData];

    if (!v9) {
      goto LABEL_5;
    }
    BOOL v10 = *(void **)(a1 + 40);
    char v11 = [*(id *)(a1 + 32) pendingThumbnailImageData];
    [v10 setContactImageDataZeroCropRect:v11 format:"thumbnail"];

    v12 = [*(id *)(a1 + 32) pendingThumbnailImageData];
    uint64_t v13 = ABPersonSetImageDataAndCropRect();

    [*(id *)(a1 + 32) logIfConditionFailed:v13 message:@"failed to set thumbnail image data" error:a2];
    uint64_t v14 = 0;
    if (v13)
    {
LABEL_5:
      v15 = [*(id *)(a1 + 32) pendingFullscreenImageData];

      if (!v15) {
        goto LABEL_7;
      }
      v16 = *(void **)(a1 + 40);
      uint64_t v17 = [*(id *)(a1 + 32) pendingFullscreenImageData];
      [v16 setContactImageDataZeroCropRect:v17 format:"fullscreen"];

      uint64_t v18 = [*(id *)(a1 + 32) pendingFullscreenImageData];
      uint64_t v19 = ABPersonSetImageDataAndCropRect();

      [*(id *)(a1 + 32) logIfConditionFailed:v19 message:@"failed to set fullscreen image data" error:a2];
      uint64_t v14 = 0;
      if (v19)
      {
LABEL_7:
        v20 = [*(id *)(a1 + 32) pendingSyncImageData];

        if (v20)
        {
          id v21 = *(void **)(a1 + 40);
          v22 = [*(id *)(a1 + 32) pendingSyncImageData];
          [v21 setContactImageDataZeroCropRect:v22 format:"sync"];

          v23 = [*(id *)(a1 + 32) pendingSyncImageData];
          uint64_t v14 = ABPersonSetImageDataAndCropRect();

          [*(id *)(a1 + 32) logIfConditionFailed:v14 message:@"failed to set sync image data" error:a2];
        }
        else
        {
          return 1;
        }
      }
    }
    return v14;
  }
  else
  {
    [*(id *)(a1 + 40) removeContactImageData];
    v24 = *(const void **)(a1 + 48);
    return ABPersonRemoveImageData(v24, a2);
  }
}

uint64_t __89__CNiOSABDependentPropertiesUpdateContext_flushPendingImageChangesToPerson_logger_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  CFDataRef v4 = ABPersonCopyImageDataWithFormat(*(ABRecordRef *)(a1 + 48), kABPersonImageFormatOriginalSize);
  v5 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) pendingCropRect];
  objc_msgSend(v5, "setContactImageData:format:cropRect:", v4, "original");
  [*(id *)(a1 + 40) pendingCropRect];
  CGRectGetMinX(v8);
  [*(id *)(a1 + 40) pendingCropRect];
  CGRectGetMinY(v9);
  [*(id *)(a1 + 40) pendingCropRect];
  CGRectGetWidth(v10);
  [*(id *)(a1 + 40) pendingCropRect];
  CGRectGetHeight(v11);
  uint64_t v6 = ABPersonSetImageDataWithCropRect();
  [*(id *)(a1 + 40) logIfConditionFailed:v6 message:@"failed to set original image data with crop rect" error:a2];

  return v6;
}

uint64_t __89__CNiOSABDependentPropertiesUpdateContext_flushPendingImageChangesToPerson_logger_error___block_invoke_29(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) pendingSyncImageData];
  [v2 setContactImageDataZeroCropRect:v3 format:"sync"];

  CFDataRef v4 = [*(id *)(a1 + 40) pendingSyncImageData];
  uint64_t v5 = ABPersonSetImageDataAndCropRect();

  return v5;
}

+ (BOOL)shouldSetWatchChanges
{
  return 0;
}

- (BOOL)setWatchChangesforThumbnailImageDataToPerson:(void *)a3 error:(id *)a4
{
  if (!+[CNiOSABDependentPropertiesUpdateContext shouldSetWatchChanges])return 1; {
  v8[0] = MEMORY[0x1E4F143A8];
  }
  v8[1] = 3221225472;
  v8[2] = __94__CNiOSABDependentPropertiesUpdateContext_setWatchChangesforThumbnailImageDataToPerson_error___block_invoke;
  v8[3] = &unk_1E56B7D30;
  v8[4] = self;
  v8[5] = a3;
  return CNBridgeBoolResultAndErrorFromBlock(a4, (uint64_t)v8);
}

uint64_t __94__CNiOSABDependentPropertiesUpdateContext_setWatchChangesforThumbnailImageDataToPerson_error___block_invoke(uint64_t a1, CFErrorRef *a2)
{
  CFDataRef v4 = [*(id *)(a1 + 32) pendingThumbnailImageData];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) pendingThumbnailImageData];
    uint64_t v6 = ABPersonSetImageDataDerivedFromFormatAndReturnError();

    CFDataRef v7 = *(void **)(a1 + 32);
    CGRect v8 = @"failed to set thumbnail image data for watch";
  }
  else
  {
    uint64_t v6 = ABPersonSetImageData(*(ABRecordRef *)(a1 + 40), 0, a2);
    CFDataRef v7 = *(void **)(a1 + 32);
    CGRect v8 = @"failed to clear image data for watch";
  }
  [v7 logIfConditionFailed:v6 message:v8 error:a2];
  return v6;
}

- (BOOL)isUnifiedContact
{
  return self->_isUnifiedContact;
}

- (void)setIsUnifiedContact:(BOOL)a3
{
  self->_isUnifiedContact = a3;
}

- (NSData)pendingImageData
{
  return self->_pendingImageData;
}

- (CGRect)pendingCropRect
{
  double x = self->_pendingCropRect.origin.x;
  double y = self->_pendingCropRect.origin.y;
  double width = self->_pendingCropRect.size.width;
  double height = self->_pendingCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSData)pendingThumbnailImageData
{
  return self->_pendingThumbnailImageData;
}

- (NSData)pendingFullscreenImageData
{
  return self->_pendingFullscreenImageData;
}

- (void)setPendingFullscreenImageData:(id)a3
{
}

- (NSData)pendingSyncImageData
{
  return self->_pendingSyncImageData;
}

- (BOOL)hasPendingImageData
{
  return self->_hasPendingImageData;
}

- (void)setHasPendingImageData:(BOOL)a3
{
  self->_hasPendingImageData = a3;
}

- (BOOL)hasPendingCropRect
{
  return self->_hasPendingCropRect;
}

- (void)setHasPendingCropRect:(BOOL)a3
{
  self->_hasPendingCropRect = a3;
}

- (BOOL)hasPendingThumbnailImageData
{
  return self->_hasPendingThumbnailImageData;
}

- (void)setHasPendingThumbnailImageData:(BOOL)a3
{
  self->_hasPendingThumbnailImageData = a3;
}

- (BOOL)hasPendingSyncImageData
{
  return self->_hasPendingSyncImageData;
}

- (void)setHasPendingSyncImageData:(BOOL)a3
{
  self->_hasPendingSyncImageData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSyncImageData, 0);
  objc_storeStrong((id *)&self->_pendingFullscreenImageData, 0);
  objc_storeStrong((id *)&self->_pendingThumbnailImageData, 0);

  objc_storeStrong((id *)&self->_pendingImageData, 0);
}

- (void)logIfConditionFailed:(uint64_t)a1 message:(uint64_t)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = ABLogErrorPtr();
  _os_log_error_impl(&dword_1909E3000, a3, OS_LOG_TYPE_ERROR, "flushPendingImageChangesToPerson, %{public}@, error = %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)flushPendingImageChangesToPerson:(os_log_t)log logger:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Cannot set fullscreen image data only", v1, 2u);
}

@end