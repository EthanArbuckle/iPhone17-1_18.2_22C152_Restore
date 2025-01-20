@interface CKTextStorage
- (id)defaultAttributes;
- (void)processEditing;
@end

@implementation CKTextStorage

- (void)processEditing
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CKTextStorage *)self editedRange];
  uint64_t v5 = v4;
  -[CKTextStorage invalidateAttributesInRange:](self, "invalidateAttributesInRange:", v3, v4);
  uint64_t v6 = [(CKTextStorage *)self editedMask];
  uint64_t v7 = [(CKTextStorage *)self changeInLength];
  v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v9 = [v8 isTextKit2Enabled];

  if (v9)
  {
    id v15 = [(CKTextStorage *)self textStorageObserver];
    objc_msgSend(v15, "processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:", self, v6, v3, v5, v7, v3, v5);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v10 = [(CKTextStorage *)self layoutManagers];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:", self, v6, v3, v5, v7, v3, v5);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (id)defaultAttributes
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = +[CKUIBehavior sharedBehaviors];
  v8[0] = *MEMORY[0x1E4FB06F8];
  uint64_t v3 = [v2 balloonTextFont];
  v9[0] = v3;
  v8[1] = *MEMORY[0x1E4FB0700];
  uint64_t v4 = [v2 theme];
  uint64_t v5 = [v4 entryFieldTextColor];
  v9[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

@end