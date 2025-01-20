@interface CKAudioAttachmentItem
+ (id)UTITypes;
- (id)cachedPreview;
- (id)previewItemTitle;
@end

@implementation CKAudioAttachmentItem

+ (id)UTITypes
{
  v2 = [MEMORY[0x1E4F166C8] audiovisualTypes];
  v3 = [v2 indexesOfObjectsPassingTest:&__block_literal_global_132];
  v4 = [v2 objectsAtIndexes:v3];

  return v4;
}

BOOL __33__CKAudioAttachmentItem_UTITypes__block_invoke(int a1, CFStringRef inUTI)
{
  return UTTypeConformsTo(inUTI, (CFStringRef)*MEMORY[0x1E4F22538]) != 0;
}

- (id)cachedPreview
{
  return 0;
}

- (id)previewItemTitle
{
  v2 = [(CKAttachmentItem *)self fileURL];
  v3 = [v2 lastPathComponent];

  if (([v3 isEqualToString:@"Audio Message.caf"] & 1) != 0
    || [v3 isEqualToString:@"Audio Message.amr"])
  {
    v4 = CKFrameworkBundle();
    v5 = [v4 localizedStringForKey:@"PREVIEW_TITLE_AUDIO_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end