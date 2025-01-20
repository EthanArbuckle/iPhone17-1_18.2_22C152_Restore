@interface CKAudioMessageChatItem
- (BOOL)canForward;
- (BOOL)isAudioMessage;
- (BOOL)isExpanded;
- (BOOL)shouldCacheSize;
- (Class)balloonViewClass;
- (Class)cellClass;
- (NSString)audioTranscriptionText;
- (id)_audioTranscriptionTextFromTransfer;
- (unint64_t)balloonCorners;
- (void)setIsExpanded:(BOOL)a3;
@end

@implementation CKAudioMessageChatItem

- (Class)cellClass
{
  v2 = +[CKUIBehavior sharedBehaviors];
  v3 = [v2 audioBalloonCellClass];

  return (Class)v3;
}

- (BOOL)isAudioMessage
{
  return 1;
}

- (BOOL)canForward
{
  v2 = (void *)MEMORY[0x1E4F6BDC0];
  v3 = [(CKMessagePartChatItem *)self serviceName];
  v4 = [v2 serviceWithInternalName:v3];
  char v5 = [v4 supportsForwardingAudioMessages];

  return v5;
}

- (BOOL)shouldCacheSize
{
  return 0;
}

- (NSString)audioTranscriptionText
{
  v3 = [(CKMessagePartChatItem *)self message];
  v4 = v3;
  if (v3)
  {
    char v5 = [v3 _imMessageItem];
    v6 = [v5 body];
    v7 = v6;
    if (v6 && [v6 length])
    {
      v8 = [v7 attribute:*MEMORY[0x1E4F6CAD0] atIndex:0 effectiveRange:0];
      v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        id v10 = [(CKAudioMessageChatItem *)self _audioTranscriptionTextFromTransfer];
      }
      v11 = v10;
    }
    else
    {
      v11 = [(CKAudioMessageChatItem *)self _audioTranscriptionTextFromTransfer];
    }
  }
  else
  {
    v11 = [(CKAudioMessageChatItem *)self _audioTranscriptionTextFromTransfer];
  }

  return (NSString *)v11;
}

- (id)_audioTranscriptionTextFromTransfer
{
  v2 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 transfer];
    char v5 = v4;
    if (v4)
    {
      v6 = [v4 audioTranscriptionText];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (Class)balloonViewClass
{
  v3 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
  if ([v3 shouldSuppressPreview])
  {
  }
  else
  {
    v4 = [(CKAttachmentMessagePartChatItem *)self mediaObject];
    char v5 = [v4 transfer];
    char v6 = [v5 isFileDataReady];

    if (v6)
    {
      v7 = +[CKUIBehavior sharedBehaviors];
      v8 = [v7 audioBalloonViewClass];

      goto LABEL_6;
    }
  }
  v8 = objc_opt_class();
LABEL_6:

  return (Class)v8;
}

- (unint64_t)balloonCorners
{
  return -1;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

@end