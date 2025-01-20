@interface FlexSongAssetProvider_V1
- (FlexSongAssetProvider_V1)initWithFolderPath:(id)a3;
- (NSString)audioFileExtension;
- (NSString)rootFolderPath;
- (id)urlToAudioContainerForSegmentType:(unint64_t)a3;
- (id)urlToAudioForSegment:(id)a3;
- (id)urlToRoot;
- (void)setAudioFileExtension:(id)a3;
- (void)setRootFolderPath:(id)a3;
@end

@implementation FlexSongAssetProvider_V1

- (FlexSongAssetProvider_V1)initWithFolderPath:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FlexSongAssetProvider_V1;
  v6 = [(FlexSongAssetProvider_V1 *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rootFolderPath, a3);
    audioFileExtension = v7->_audioFileExtension;
    v7->_audioFileExtension = (NSString *)@"m4a";
  }
  return v7;
}

- (id)urlToRoot
{
  id v5 = NSURL;
  v6 = objc_msgSend_rootFolderPath(self, a2, v2, v3, v4);
  objc_super v10 = objc_msgSend_fileURLWithPath_(v5, v7, (uint64_t)v6, v8, v9);

  return v10;
}

- (id)urlToAudioContainerForSegmentType:(unint64_t)a3
{
  id v5 = NSURL;
  v6 = objc_msgSend_rootFolderPath(self, a2, a3, v3, v4);
  objc_super v10 = objc_msgSend_fileURLWithPath_(v5, v7, (uint64_t)v6, v8, v9);

  return v10;
}

- (id)urlToAudioForSegment:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v9 = objc_msgSend_rootFolderPath(self, v5, v6, v7, v8);
    v14 = objc_msgSend_name(v4, v10, v11, v12, v13);

    v18 = objc_msgSend_stringByAppendingPathComponent_(v9, v15, (uint64_t)v14, v16, v17);
    v23 = objc_msgSend_audioFileExtension(self, v19, v20, v21, v22);
    v27 = objc_msgSend_stringByAppendingPathExtension_(v18, v24, (uint64_t)v23, v25, v26);

    v31 = objc_msgSend_fileURLWithPath_(NSURL, v28, (uint64_t)v27, v29, v30);
  }
  else
  {
    v31 = 0;
  }
  return v31;
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