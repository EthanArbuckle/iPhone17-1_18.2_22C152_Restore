@interface IMDRelayMessageToSuper_FILE_Frame
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation IMDRelayMessageToSuper_FILE_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v29 = a4;
  v8 = (void *)IMCopyNormalizedAttributes();
  v9 = [v8 _stringForKey:@"name"];
  if (v9)
  {
    v10 = [v8 _stringForKey:@"width"];
    v11 = [v8 _stringForKey:@"height"];
    v12 = [v8 _stringForKey:@"datasize"];
    v13 = [v8 _stringForKey:@"x-apple-anim-emoji"];
    v26 = [v8 _stringForKey:@"emoji-image-id"];
    v25 = [v8 _stringForKey:@"emoji-image-description"];
    v14 = (void *)[v8 mutableCopy];
    v15 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"width", @"height", @"inline-file", @"datasize", 0);
    [v14 removeObjectsForKeys:v15];

    v28 = v10;
    uint64_t v24 = [v10 integerValue];
    v27 = v11;
    uint64_t v16 = [v11 integerValue];
    uint64_t v17 = [v13 integerValue];
    v18 = +[IMDFileTransferCenter sharedInstance];
    v19 = [v9 lastPathComponent];
    v20 = objc_msgSend(v18, "guidForNewIncomingTransferWithFilename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:", v19, 0, objc_msgSend(v12, "longLongValue"), 0, 0, 0);

    if (v20)
    {
      v21 = +[IMDFileTransferCenter sharedInstance];
      v22 = [v21 transferForGUID:v20];
    }
    else
    {
      v22 = 0;
    }
    uint64_t v23 = [v26 length];
    if (v23)
    {
      [v22 setAdaptiveImageGlyphContentIdentifier:v26];
      [v22 setAdaptiveImageGlyphContentDescription:v25];
    }
    [v22 setUserInfo:v14];
    [v29 appendInlineImageWithGUID:v20 filename:v9 width:v24 height:v16 isAnimoji:v17 isAdaptiveImageGlyph:v23 != 0];
  }
}

@end