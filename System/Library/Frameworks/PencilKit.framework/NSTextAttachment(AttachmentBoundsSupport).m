@interface NSTextAttachment(AttachmentBoundsSupport)
- (BOOL)pkAttachmentBoundsMightBeInvalid;
- (BOOL)pkInserting;
- (void)setPkAttachmentBoundsMightBeInvalid:()AttachmentBoundsSupport;
- (void)setPkInserting:()AttachmentBoundsSupport;
@end

@implementation NSTextAttachment(AttachmentBoundsSupport)

- (BOOL)pkAttachmentBoundsMightBeInvalid
{
  v1 = objc_getAssociatedObject(a1, &attachmentBoundsKey);
  BOOL v2 = v1 != 0;

  return v2;
}

- (void)setPkAttachmentBoundsMightBeInvalid:()AttachmentBoundsSupport
{
  if (a3) {
    v3 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    v3 = 0;
  }
  objc_setAssociatedObject(a1, &attachmentBoundsKey, v3, (void *)0x301);
}

- (void)setPkInserting:()AttachmentBoundsSupport
{
  if (a3) {
    v3 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    v3 = 0;
  }
  objc_setAssociatedObject(a1, &insertingKey, v3, (void *)0x301);
}

- (BOOL)pkInserting
{
  v1 = objc_getAssociatedObject(a1, &insertingKey);
  BOOL v2 = v1 != 0;

  return v2;
}

@end