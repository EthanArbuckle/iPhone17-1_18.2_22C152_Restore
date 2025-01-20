@interface CKComposeAssetExplorerManagerSavedData
- (CKComposeAssetExplorerManagerSavedData)initWithFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5 fullyRealizedPreview:(id)a6 rawPreview:(id)a7 appendedVideoURL:(id)a8;
- (NSDictionary)transcoderUserInfo;
- (NSString)filename;
- (NSURL)appendedVideoURL;
- (NSURL)fileURL;
- (UIImage)fullyRealizedPreview;
- (UIImage)rawPreview;
@end

@implementation CKComposeAssetExplorerManagerSavedData

- (CKComposeAssetExplorerManagerSavedData)initWithFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5 fullyRealizedPreview:(id)a6 rawPreview:(id)a7 appendedVideoURL:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CKComposeAssetExplorerManagerSavedData;
  v18 = [(CKComposeAssetExplorerManagerSavedData *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_fileURL, a3);
    objc_storeStrong((id *)&v19->_filename, a4);
    objc_storeStrong((id *)&v19->_transcoderUserInfo, a5);
    objc_storeStrong((id *)&v19->_fullyRealizedPreview, a6);
    objc_storeStrong((id *)&v19->_rawPreview, a7);
    objc_storeStrong((id *)&v19->_appendedVideoURL, a8);
  }

  return v19;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSDictionary)transcoderUserInfo
{
  return self->_transcoderUserInfo;
}

- (UIImage)fullyRealizedPreview
{
  return self->_fullyRealizedPreview;
}

- (UIImage)rawPreview
{
  return self->_rawPreview;
}

- (NSURL)appendedVideoURL
{
  return self->_appendedVideoURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appendedVideoURL, 0);
  objc_storeStrong((id *)&self->_rawPreview, 0);
  objc_storeStrong((id *)&self->_fullyRealizedPreview, 0);
  objc_storeStrong((id *)&self->_transcoderUserInfo, 0);
  objc_storeStrong((id *)&self->_filename, 0);

  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end