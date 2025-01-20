@interface LegacySMSRelayMessageToSuper_FILE_Frame
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation LegacySMSRelayMessageToSuper_FILE_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v25 = (id)IMCopyNormalizedAttributes();
  id v9 = [v25 _stringForKey:@"name"];
  v10 = v25;
  if (v9)
  {
    id v24 = a4;
    id v11 = [v25 _stringForKey:@"width"];
    id v12 = [v25 _stringForKey:@"height"];
    id v13 = [v25 _stringForKey:@"datasize"];
    id v14 = [v25 _stringForKey:@"x-apple-anim-emoji"];
    id v15 = [v25 _stringForKey:@"emoji-image-id"];
    id v22 = [v25 _stringForKey:@"emoji-image-description"];
    id v16 = [v25 mutableCopy];
    objc_msgSend(v16, "removeObjectsForKeys:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"width", @"height", @"inline-file", @"datasize", 0));
    id v23 = [v11 integerValue];
    id v17 = [v12 integerValue];
    id v18 = [v14 integerValue];
    id v19 = [v15 length];
    id v20 = -[IMDFileTransferCenter guidForNewIncomingTransferWithFilename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:](+[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance"), "guidForNewIncomingTransferWithFilename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:", [v9 lastPathComponent], 0, objc_msgSend(v13, "longLongValue"), 0, 0, 0);
    if (v20)
    {
      id v21 = [+[IMDFileTransferCenter sharedInstance] transferForGUID:v20];
      if (!v19)
      {
LABEL_5:
        [v21 setUserInfo:v16];
        [v24 appendInlineImageWithGUID:v20 filename:v9 width:v23 height:v17 isAnimoji:v18 isAdaptiveImageGlyph:v19 != 0];

        v10 = v25;
        goto LABEL_6;
      }
    }
    else
    {
      id v21 = 0;
      if (!v19) {
        goto LABEL_5;
      }
    }
    [v21 setAdaptiveImageGlyphContentIdentifier:v15];
    [v21 setAdaptiveImageGlyphContentDescription:v22];
    goto LABEL_5;
  }
LABEL_6:
}

@end