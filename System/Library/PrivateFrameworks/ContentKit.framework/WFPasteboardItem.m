@interface WFPasteboardItem
- (NSArray)fileURLItems;
- (NSArray)fileURLs;
- (NSDictionary)itemsByType;
- (WFPasteboardItem)initWithItemsByType:(id)a3 fileURLs:(id)a4;
@end

@implementation WFPasteboardItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURLs, 0);
  objc_storeStrong((id *)&self->_itemsByType, 0);
}

- (NSArray)fileURLs
{
  return self->_fileURLs;
}

- (NSDictionary)itemsByType
{
  return self->_itemsByType;
}

- (NSArray)fileURLItems
{
  v2 = [(WFPasteboardItem *)self fileURLs];
  v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_7934);

  return (NSArray *)v3;
}

id __32__WFPasteboardItem_fileURLItems__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = [v2 wfFileType];
  v4 = +[WFFileRepresentation fileWithURL:v2 options:8 ofType:v3];

  if (v4
    && ([v4 fileURL],
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_msgSend(v5, "wf_fileIsReadable"),
        v5,
        (v6 & 1) != 0))
  {
    v7 = +[WFContentLocation contentLocationForFile:v4];
    v8 = +[WFContentItem itemWithFile:v4 origin:v7 disclosureLevel:1];
  }
  else
  {
    v9 = getWFContentGraphLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      v12 = "-[WFPasteboardItem fileURLItems]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v2;
      _os_log_impl(&dword_216505000, v9, OS_LOG_TYPE_ERROR, "%s Couldn't read file URL %@ during a pasteboard read", (uint8_t *)&v11, 0x16u);
    }

    v8 = 0;
  }

  return v8;
}

- (WFPasteboardItem)initWithItemsByType:(id)a3 fileURLs:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFContentCollection+WFPasteboard.m", 47, @"Invalid parameter not satisfying: %@", @"itemsByType" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)WFPasteboardItem;
  v10 = [(WFPasteboardItem *)&v15 init];
  int v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_itemsByType, a3);
    objc_storeStrong((id *)&v11->_fileURLs, a4);
    v12 = v11;
  }

  return v11;
}

@end