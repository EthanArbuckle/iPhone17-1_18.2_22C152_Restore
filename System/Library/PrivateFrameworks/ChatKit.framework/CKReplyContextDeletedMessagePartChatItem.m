@interface CKReplyContextDeletedMessagePartChatItem
- (BOOL)isFromMe;
- (BOOL)itemIsReplyContextPreview;
- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKBalloonDescriptor_t)balloonDescriptor;
- (char)balloonOrientation;
- (char)color;
- (char)transcriptOrientation;
- (id)contact;
- (id)loadTranscriptText;
@end

@implementation CKReplyContextDeletedMessagePartChatItem

- (char)balloonOrientation
{
  return [(CKReplyContextDeletedMessagePartChatItem *)self isFromMe];
}

- (char)transcriptOrientation
{
  if ([(CKReplyContextDeletedMessagePartChatItem *)self isFromMe]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (id)loadTranscriptText
{
  v2 = objc_opt_new();

  return v2;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  if (a4)
  {
    a3 = (CGSize)*MEMORY[0x1E4F437F8];
    *(CGSize *)&a3.height = *(CGSize *)(MEMORY[0x1E4F437F8] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E4F437F8];
    *(CGSize *)&a4->bottom = *(CGSize *)&a3.height;
  }
  v4 = +[CKUIBehavior sharedBehaviors];
  [v4 deletedReplyBalloonMaskSizeWithTailShape:1];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)contact
{
  if (contact_onceToken != -1) {
    dispatch_once(&contact_onceToken, &__block_literal_global_162);
  }
  v2 = (void *)contact_blankContact;

  return v2;
}

void __51__CKReplyContextDeletedMessagePartChatItem_contact__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1B8F8]);
  v1 = (void *)contact_blankContact;
  contact_blankContact = (uint64_t)v0;
}

- (BOOL)isFromMe
{
  v2 = [(CKReplyContextDeletedMessagePartChatItem *)self imReplyContextDeletedMessageChatItem];
  char v3 = [v2 deletedMessageIsFromMe];

  return v3;
}

- (char)color
{
  return 9;
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v5.receiver = self;
  v5.super_class = (Class)CKReplyContextDeletedMessagePartChatItem;
  CGSize result = (CKBalloonDescriptor_t *)[(CKBalloonDescriptor_t *)&v5 balloonDescriptor];
  retstr->var0 = 5;
  retstr->var10 = 1;
  return result;
}

- (BOOL)itemIsReplyContextPreview
{
  return 1;
}

@end