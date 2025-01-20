@interface NSAttributedString(TextAttachmentExtraction)
- (id)wf_contentAsStringsAndAttachments;
@end

@implementation NSAttributedString(TextAttachmentExtraction)

- (id)wf_contentAsStringsAndAttachments
{
  v2 = objc_opt_new();
  uint64_t v3 = [a1 length];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__NSAttributedString_TextAttachmentExtraction__wf_contentAsStringsAndAttachments__block_invoke;
  v8[3] = &unk_264288450;
  v8[4] = a1;
  id v4 = v2;
  id v9 = v4;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v3, 0, v8);
  v5 = v9;
  id v6 = v4;

  return v6;
}

@end