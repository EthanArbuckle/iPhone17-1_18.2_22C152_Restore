@interface DOMDocument(DDExtension)
- (void)dd_resetResults;
@end

@implementation DOMDocument(DDExtension)

- (void)dd_resetResults
{
  v2 = [a1 webFrame];
  v3 = [v2 selectedDOMRange];

  v4 = [v3 startContainer];
  uint64_t v5 = [v3 startOffset];
  v6 = [v3 endContainer];
  uint64_t v7 = [v3 endOffset];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  v8 = [a1 getElementsByTagName:@"A"];
  v9 = _DDArrayWithList(v8);

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __43__DOMDocument_DDExtension__dd_resetResults__block_invoke;
  v16[3] = &unk_1E5A85940;
  id v10 = v4;
  id v17 = v10;
  id v11 = v6;
  id v18 = v11;
  v19 = &v20;
  _DDRemoveResultLinksFromArrayOfAnchors(v9, v16);
  if (*((unsigned char *)v21 + 24))
  {
    if (v3)
    {
      v12 = [a1 webFrame];
      v13 = [v12 selectedDOMRange];

      if (!v13)
      {
        v14 = [a1 createRange];
        [v14 setStart:v10 offset:v5];
        [v14 setEnd:v11 offset:v7];
        v15 = [a1 webFrame];
        [v15 setSelectedDOMRange:v14 affinity:0 closeTyping:0];
      }
    }
  }

  _Block_object_dispose(&v20, 8);
}

@end