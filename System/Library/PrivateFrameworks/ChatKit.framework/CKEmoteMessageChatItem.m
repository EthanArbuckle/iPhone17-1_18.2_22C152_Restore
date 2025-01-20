@interface CKEmoteMessageChatItem
- (id)loadTranscriptText;
@end

@implementation CKEmoteMessageChatItem

- (id)loadTranscriptText
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [(CKChatItem *)self IMChatItem];
  v4 = [v3 text];
  v5 = [v4 string];

  v6 = [(CKChatItem *)self IMChatItem];
  v7 = [v6 message];
  v8 = [v7 sender];

  v9 = +[CKUIBehavior sharedBehaviors];
  v10 = [v9 transcriptRegularFontAttributes];

  v11 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v5 attributes:v10];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v12 = IMEmotePrefixes();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(v5, "rangeOfString:options:", *(void *)(*((void *)&v26 + 1) + 8 * i), 8, (void)v26);
        if (v18)
        {
          uint64_t v19 = v17;
          uint64_t v20 = v18;
          uint64_t v21 = *MEMORY[0x1E4FB06F8];
          v22 = +[CKUIBehavior sharedBehaviors];
          v23 = [v22 transcriptBoldFont];
          objc_msgSend(v11, "addAttribute:value:range:", v21, v23, v19, v20);

          v24 = [v8 name];
          objc_msgSend(v11, "replaceCharactersInRange:withString:", v19, v20, v24);

          goto LABEL_11;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v11;
}

@end