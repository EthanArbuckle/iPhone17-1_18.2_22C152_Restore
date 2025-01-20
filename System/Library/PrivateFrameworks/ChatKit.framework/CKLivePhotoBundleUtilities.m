@interface CKLivePhotoBundleUtilities
+ (BOOL)fileExistsAtPath:(id)a3;
+ (BOOL)isLivePhotoAtURL:(id)a3;
+ (BOOL)writeToBundle:(id)a3 atURL:(id)a4;
+ (id)attachmentPreviewFileURL:(id)a3 extension:(id)a4;
+ (id)calculateLivePhotoVideoPath:(id)a3;
+ (id)getLivePhotoBundleURL:(id)a3;
@end

@implementation CKLivePhotoBundleUtilities

+ (id)getLivePhotoBundleURL:(id)a3
{
  id v4 = a3;
  int v5 = [a1 isLivePhotoAtURL:v4];
  v6 = 0;
  if (v4 && v5)
  {
    v7 = [a1 calculateLivePhotoVideoPath:v4];
    v6 = [a1 attachmentPreviewFileURL:v4 extension:*MEMORY[0x1E4F8D2F8]];
    if (([a1 fileExistsAtPath:v6] & 1) == 0)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F8CE20]);
      v9 = [v4 path];
      uint64_t v10 = MEMORY[0x192FBA870]("kCMTimeInvalid", @"CoreMedia");
      uint64_t v11 = *(void *)(v10 + 16);
      long long v14 = *(_OWORD *)v10;
      uint64_t v15 = v11;
      v12 = (void *)[v8 initWithPathToVideo:v7 pathToImage:v9 imageDisplayTime:&v14 pairingIdentifier:0];

      [a1 writeToBundle:v12 atURL:v6];
    }
  }

  return v6;
}

+ (BOOL)isLivePhotoAtURL:(id)a3
{
  v3 = [a1 calculateLivePhotoVideoPath:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (id)calculateLivePhotoVideoPath:(id)a3
{
  v3 = [a3 path];
  BOOL v4 = [v3 stringByDeletingPathExtension];
  int v5 = [v4 stringByAppendingPathExtension:@"MOV"];

  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v7 = [v6 fileExistsAtPath:v5];

  if (v7) {
    goto LABEL_4;
  }
  id v8 = [v5 stringByDeletingPathExtension];
  v9 = [v8 stringByAppendingPathExtension:@"mov"];

  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  LODWORD(v8) = [v10 fileExistsAtPath:v9];

  if (v8)
  {
    int v5 = v9;
LABEL_4:
    id v11 = v5;
    v9 = v11;
    goto LABEL_6;
  }
  id v11 = 0;
LABEL_6:

  return v11;
}

+ (id)attachmentPreviewFileURL:(id)a3 extension:(id)a4
{
  return (id)IMAttachmentPreviewFileURL();
}

+ (BOOL)fileExistsAtPath:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  int v5 = [v3 defaultManager];
  v6 = [v4 path];

  LOBYTE(v4) = [v5 fileExistsAtPath:v6];
  return (char)v4;
}

+ (BOOL)writeToBundle:(id)a3 atURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && (id v11 = 0, [v5 writeToBundleAtURL:v6 error:&v11], (v7 = v11) != 0))
  {
    id v8 = v7;
    _IMWarn();

    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

@end