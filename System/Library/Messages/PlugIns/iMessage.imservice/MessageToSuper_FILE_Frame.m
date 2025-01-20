@interface MessageToSuper_FILE_Frame
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation MessageToSuper_FILE_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  v8 = (void *)IMCopyNormalizedAttributes();
  id v61 = [v8 _stringForKey:@"name"];
  if (v61)
  {
    id v9 = [v8 _stringForKey:@"width"];
    id v10 = [v8 _stringForKey:@"height"];
    id v11 = [v8 _stringForKey:@"datasize"];
    id v12 = [v8 _stringForKey:@"x-apple-anim-emoji"];
    id v58 = [v8 _stringForKey:@"emoji-image-id"];
    id v46 = [v8 _stringForKey:@"emoji-image-description"];
    id v13 = objc_msgSend(objc_msgSend(v8, "_stringForKey:", @"iris"), "length");
    id v62 = [v8 mutableCopy];
    objc_msgSend(v62, "removeObjectsForKeys:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"width", @"height", @"inline-file", @"datasize", 0));
    id v45 = [v9 integerValue];
    id v44 = [v10 integerValue];
    id v43 = [v12 integerValue];
    id v57 = v13;
    if (!v13)
    {
      id v20 = -[IMDFileTransferCenter guidForNewIncomingTransferWithFilename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:](+[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance"), "guidForNewIncomingTransferWithFilename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:", [v61 lastPathComponent], 0, objc_msgSend(v11, "longLongValue"), 0, 0, 0);
      if (v20)
      {
        id v36 = v20;
        id v59 = [+[IMDFileTransferCenter sharedInstance] transferForGUID:v20];
      }
      else
      {
        id v36 = 0;
        id v59 = 0;
      }
LABEL_18:
      v56 = (const void *)IMStickerUserInfoStickerGUIDKey;
      id v23 = objc_msgSend(v8, "_stringForKey:");
      v55 = (const void *)IMStickerUserInfoStickerPackGUIDKey;
      id v24 = objc_msgSend(v8, "_stringForKey:");
      v54 = (const void *)IMStickerUserInfoStickerHashKey;
      id v25 = objc_msgSend(v8, "_stringForKey:");
      v53 = (const void *)IMStickerUserInfoLayoutIntentKey;
      id v26 = objc_msgSend(v8, "_stringForKey:");
      v52 = (const void *)IMStickerUserInfoAssociatedLayoutIntentKey;
      id v27 = objc_msgSend(v8, "_stringForKey:");
      key = (void *)IMStickerUserInfoParentPreviewWidthKey;
      id v28 = objc_msgSend(v8, "_stringForKey:");
      v50 = (void *)IMStickerUserInfoXScalarKey;
      id value = objc_msgSend(v8, "_stringForKey:");
      v49 = (void *)IMStickerUserInfoYScalarKey;
      id v41 = objc_msgSend(v8, "_stringForKey:");
      v48 = (void *)IMStickerUserInfoScaleKey;
      id v40 = objc_msgSend(v8, "_stringForKey:");
      v47 = (void *)IMStickerUserInfoRotationKey;
      id v39 = objc_msgSend(v8, "_stringForKey:");
      v29 = (const void *)IMStickerUserInfoStickerRecipeKey;
      id v38 = [v8 _stringForKey:IMStickerUserInfoStickerRecipeKey];
      v30 = (const void *)IMStickerUserInfoStickerBundleIDKey;
      id v37 = [v8 _stringForKey:IMStickerUserInfoStickerBundleIDKey];
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      v32 = Mutable;
      if (Mutable)
      {
        if (v23) {
          CFDictionarySetValue(Mutable, v56, v23);
        }
        if (v24) {
          CFDictionarySetValue(v32, v55, v24);
        }
        if (v25) {
          CFDictionarySetValue(v32, v54, v25);
        }
        if (v26) {
          CFDictionarySetValue(v32, v53, v26);
        }
        if (v27) {
          CFDictionarySetValue(v32, v52, v27);
        }
        if (v28) {
          CFDictionarySetValue(v32, key, v28);
        }
        if (value) {
          CFDictionarySetValue(v32, v50, value);
        }
        if (v41) {
          CFDictionarySetValue(v32, v49, v41);
        }
        if (v40) {
          CFDictionarySetValue(v32, v48, v40);
        }
        if (v39) {
          CFDictionarySetValue(v32, v47, v39);
        }
        if (v38) {
          CFDictionarySetValue(v32, v29, v38);
        }
        if (v37) {
          CFDictionarySetValue(v32, v30, v37);
        }
        [v59 setStickerUserInfo:v32];
      }
      else if (IMOSLoggingEnabled())
      {
        v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "MessageToSuperParser could not init stickerInfoDictionary", buf, 2u);
        }
      }

      objc_msgSend(v62, "removeObjectsForKeys:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v55, v56, v54, v53, v52, key, v50, v49, v48, v47, v29, v30, 0));
      [v59 setUserInfo:v62];
      id v34 = [v58 length];
      if (v34)
      {
        [v59 setAdaptiveImageGlyphContentIdentifier:v58];
        [v59 setAdaptiveImageGlyphContentDescription:v46];
      }
      if (!v57) {
        [a4 appendInlineImageWithGUID:v36 filename:v61 width:v45 height:v44 isAnimoji:v43 isAdaptiveImageGlyph:v34 != 0];
      }
      goto LABEL_51;
    }
    id v14 = objc_msgSend(objc_msgSend(a4, "fileTransferGUIDs"), "lastObject");
    id v15 = [+[IMDFileTransferCenter sharedInstance] transferForGUID:v14];
    if (v15)
    {
      [v15 setIsAuxImage:1];
      id v16 = +[IMFileTransfer AuxGUIDFromFileTransferGUID:v14];
      LOWORD(v35) = 0;
      -[IMDFileTransferCenter makeNewIncomingTransferWithGUID:filename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:](+[IMDFileTransferCenter sharedInstance](IMDFileTransferCenter, "sharedInstance"), "makeNewIncomingTransferWithGUID:filename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:", v16, [v61 lastPathComponent], 0, objc_msgSend(v11, "longLongValue"), 0, 0, v35);
      id v17 = [+[IMDFileTransferCenter sharedInstance] transferForGUID:v16];
      if (v17)
      {
        id v18 = v17;
        [v17 setIsAuxVideo:1];
        id v36 = v16;
        id v59 = v18;
        if (IMOSLoggingEnabled())
        {
          v19 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v64 = v18;
            __int16 v65 = 2112;
            v66 = v8;
            _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Successfully created AuxVideo transfer %@ \n\n with attributes %@", buf, 0x16u);
          }
        }
        goto LABEL_18;
      }
      if (!IMOSLoggingEnabled()
        || (v21 = OSLogHandleForIMFoundationCategory(), !os_log_type_enabled(v21, OS_LOG_TYPE_INFO)))
      {
LABEL_51:

        goto LABEL_52;
      }
      *(_DWORD *)buf = 138412290;
      id v64 = v16;
      v22 = "Was not able to create Aux video transfer for guid %@";
    }
    else
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_51;
      }
      v21 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
        goto LABEL_51;
      }
      *(_DWORD *)buf = 138412290;
      id v64 = v14;
      v22 = "Could not find Aux image transfer with guid %@ while parsing message";
    }
    _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, v22, buf, 0xCu);
    goto LABEL_51;
  }
LABEL_52:
}

@end