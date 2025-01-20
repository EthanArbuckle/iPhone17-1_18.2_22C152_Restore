@interface CKVideoTrimController
- (CKMediaObject)originalMediaObject;
- (CKMediaObject)trimmedMediaObject;
- (CKTrimControllerDelegate)delegate;
- (CKUIVideoEditorController)editVideoVC;
- (CKVideoTrimController)initWithMediaObject:(id)a3 maxTrimDuration:(double)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setEditVideoVC:(id)a3;
- (void)setOriginalMediaObject:(id)a3;
- (void)setTrimmedMediaObject:(id)a3;
- (void)videoEditorController:(id)a3 didFailWithError:(id)a4;
- (void)videoEditorController:(id)a3 didSaveEditedVideoToPath:(id)a4;
- (void)videoEditorController:(id)a3 didTrimVideoWithOptions:(id)a4;
- (void)videoEditorControllerDidCancel:(id)a3;
@end

@implementation CKVideoTrimController

- (CKVideoTrimController)initWithMediaObject:(id)a3 maxTrimDuration:(double)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CKVideoTrimController;
  v7 = [(CKVideoTrimController *)&v19 init];
  v8 = v7;
  if (v7)
  {
    [(CKVideoTrimController *)v7 setOriginalMediaObject:v6];
    v9 = objc_alloc_init(CKUIVideoEditorController);
    editVideoVC = v8->_editVideoVC;
    v8->_editVideoVC = v9;

    [(CKUIVideoEditorController *)v8->_editVideoVC setDelegate:v8];
    [(UIVideoEditorController *)v8->_editVideoVC setVideoQuality:0];
    [(UIVideoEditorController *)v8->_editVideoVC setVideoMaximumDuration:a4];
    v11 = v8->_editVideoVC;
    v12 = [NSNumber numberWithBool:1];
    [(UIVideoEditorController *)v11 _setValue:v12 forProperty:*MEMORY[0x1E4F44098]];

    v13 = [v6 transcoderUserInfo];
    v14 = [v13 objectForKey:*MEMORY[0x1E4F6D370]];

    if (v14)
    {
      v15 = v8->_editVideoVC;
      v16 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
      [(UIVideoEditorController *)v15 _setVideoURL:v16];
    }
    else
    {
      v16 = [v6 fileURL];
      v17 = [v16 path];
      [(UIVideoEditorController *)v8->_editVideoVC setVideoPath:v17];
    }
  }

  return v8;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)CKVideoTrimController;
  [(CKVideoTrimController *)&v3 dealloc];
}

- (void)videoEditorController:(id)a3 didTrimVideoWithOptions:(id)a4
{
  id v16 = a4;
  v5 = [(CKVideoTrimController *)self originalMediaObject];
  id v6 = [v5 transcoderUserInfo];
  id v7 = (id)[v6 mutableCopy];

  if (!v7) {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v8 = CKTranscoderUserInfoForVideoTrimOptions(v16);
  [v7 addEntriesFromDictionary:v8];

  v9 = +[CKMediaObjectManager sharedInstance];
  v10 = [(CKVideoTrimController *)self originalMediaObject];
  v11 = [v10 fileURL];
  v12 = [v9 mediaObjectWithFileURL:v11 filename:0 transcoderUserInfo:v7];
  [(CKVideoTrimController *)self setTrimmedMediaObject:v12];

  v13 = [(CKVideoTrimController *)self delegate];
  v14 = [(CKVideoTrimController *)self originalMediaObject];
  v15 = [(CKVideoTrimController *)self trimmedMediaObject];
  [v13 trimController:self didFinishTrimmingMediaObject:v14 withReplacementMediaObject:v15];
}

- (void)videoEditorController:(id)a3 didSaveEditedVideoToPath:(id)a4
{
  v5 = NSString;
  id v6 = a4;
  id v7 = [v5 stringGUID];
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  v9 = [NSString stringWithFormat:@"trimmed-%@.mov", v7];
  v10 = objc_msgSend(v8, "im_randomTemporaryFileURLWithFileName:", v9);
  v11 = [v10 path];

  v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v23 = 0;
  LODWORD(v9) = [v12 moveItemAtPath:v6 toPath:v11 error:&v23];

  id v13 = v23;
  if (v9)
  {
    v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11 isDirectory:0];
    v15 = +[CKMediaObjectManager sharedInstance];
    id v16 = [(CKVideoTrimController *)self originalMediaObject];
    v17 = [v16 transcoderUserInfo];
    v18 = [v15 mediaObjectWithFileURL:v14 filename:0 transcoderUserInfo:v17];
    [(CKVideoTrimController *)self setTrimmedMediaObject:v18];
  }
  else
  {
    id v22 = v13;
    _IMWarn();
  }
  objc_super v19 = [(CKVideoTrimController *)self delegate];
  v20 = [(CKVideoTrimController *)self originalMediaObject];
  v21 = [(CKVideoTrimController *)self trimmedMediaObject];
  [v19 trimController:self didFinishTrimmingMediaObject:v20 withReplacementMediaObject:v21];
}

- (void)videoEditorControllerDidCancel:(id)a3
{
  id v4 = [(CKVideoTrimController *)self delegate];
  [v4 trimControllerDidCancel:self];
}

- (void)videoEditorController:(id)a3 didFailWithError:(id)a4
{
  id v5 = [(CKVideoTrimController *)self delegate];
  [v5 trimControllerDidCancel:self];
}

- (CKMediaObject)originalMediaObject
{
  return self->_originalMediaObject;
}

- (void)setOriginalMediaObject:(id)a3
{
}

- (CKMediaObject)trimmedMediaObject
{
  return self->_trimmedMediaObject;
}

- (void)setTrimmedMediaObject:(id)a3
{
}

- (CKTrimControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKTrimControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKUIVideoEditorController)editVideoVC
{
  return self->_editVideoVC;
}

- (void)setEditVideoVC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editVideoVC, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trimmedMediaObject, 0);

  objc_storeStrong((id *)&self->_originalMediaObject, 0);
}

@end