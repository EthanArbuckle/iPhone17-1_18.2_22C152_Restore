@interface FlexSongAssetProvider_V2
- (BOOL)assetsAreLocal;
- (FlexSongAssetProvider_V2)initWithFolderPath:(id)a3 audioFileExtension:(id)a4;
- (NSString)audioFileExtension;
- (NSString)rootFolderPath;
- (id)_folderNameForSegmentType:(unint64_t)a3;
- (id)urlToAudioContainerForSegmentType:(unint64_t)a3;
- (id)urlToAudioForSegment:(id)a3;
- (id)urlToRoot;
- (void)setAudioFileExtension:(id)a3;
- (void)setRootFolderPath:(id)a3;
@end

@implementation FlexSongAssetProvider_V2

- (FlexSongAssetProvider_V2)initWithFolderPath:(id)a3 audioFileExtension:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FlexSongAssetProvider_V2;
  v9 = [(FlexSongAssetProvider_V2 *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rootFolderPath, a3);
    objc_storeStrong((id *)&v10->_audioFileExtension, a4);
  }

  return v10;
}

- (BOOL)assetsAreLocal
{
  return 1;
}

- (id)urlToRoot
{
  v5 = NSURL;
  v6 = objc_msgSend_rootFolderPath(self, a2, v2, v3, v4);
  v10 = objc_msgSend_fileURLWithPath_(v5, v7, (uint64_t)v6, v8, v9);

  return v10;
}

- (id)_folderNameForSegmentType:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return @"?";
  }
  else {
    return off_2642B7068[a3 - 1];
  }
}

- (id)urlToAudioContainerForSegmentType:(unint64_t)a3
{
  v6 = objc_msgSend__folderNameForSegmentType_(self, a2, a3, v3, v4);
  v11 = objc_msgSend_rootFolderPath(self, v7, v8, v9, v10);
  v15 = objc_msgSend_stringByAppendingPathComponent_(v11, v12, (uint64_t)v6, v13, v14);

  v19 = objc_msgSend_fileURLWithPath_(NSURL, v16, (uint64_t)v15, v17, v18);

  return v19;
}

- (id)urlToAudioForSegment:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v9 = objc_msgSend_type(v4, v5, v6, v7, v8);
    uint64_t v13 = objc_msgSend__folderNameForSegmentType_(self, v10, v9, v11, v12);
    uint64_t v18 = objc_msgSend_rootFolderPath(self, v14, v15, v16, v17);
    v22 = objc_msgSend_stringByAppendingPathComponent_(v18, v19, (uint64_t)v13, v20, v21);

    v27 = objc_msgSend_name(v4, v23, v24, v25, v26);

    v31 = objc_msgSend_stringByAppendingPathComponent_(v22, v28, (uint64_t)v27, v29, v30);

    v36 = objc_msgSend_audioFileExtension(self, v32, v33, v34, v35);
    v40 = objc_msgSend_stringByAppendingPathExtension_(v31, v37, (uint64_t)v36, v38, v39);

    v44 = objc_msgSend_fileURLWithPath_(NSURL, v41, (uint64_t)v40, v42, v43);
  }
  else
  {
    v44 = 0;
  }
  return v44;
}

- (NSString)rootFolderPath
{
  return self->_rootFolderPath;
}

- (void)setRootFolderPath:(id)a3
{
}

- (NSString)audioFileExtension
{
  return self->_audioFileExtension;
}

- (void)setAudioFileExtension:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFileExtension, 0);
  objc_storeStrong((id *)&self->_rootFolderPath, 0);
}

@end