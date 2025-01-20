@interface NSAttributedString(ImageExtraction)
- (void)containedImageFiles;
@end

@implementation NSAttributedString(ImageExtraction)

- (void)containedImageFiles
{
  v2 = objc_opt_new();
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  v3 = (id *)getNSAttachmentAttributeNameSymbolLoc_ptr_18986;
  uint64_t v17 = getNSAttachmentAttributeNameSymbolLoc_ptr_18986;
  if (!getNSAttachmentAttributeNameSymbolLoc_ptr_18986)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __getNSAttachmentAttributeNameSymbolLoc_block_invoke_18987;
    v13[3] = &unk_26428AC60;
    v13[4] = &v14;
    __getNSAttachmentAttributeNameSymbolLoc_block_invoke_18987(v13);
    v3 = (id *)v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (v3)
  {
    id v4 = *v3;
    uint64_t v5 = [a1 length];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __58__NSAttributedString_ImageExtraction__containedImageFiles__block_invoke;
    v11[3] = &unk_2642892A0;
    v11[4] = a1;
    id v6 = v2;
    id v12 = v6;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v4, 0, v5, 0, v11);

    v7 = v12;
    id v8 = v6;
  }
  else
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    v10 = [NSString stringWithUTF8String:"NSAttributedStringKey getNSAttachmentAttributeName(void)"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"WFWebArchive+ImageExtraction.m", 16, @"%s", dlerror());

    __break(1u);
  }
}

@end