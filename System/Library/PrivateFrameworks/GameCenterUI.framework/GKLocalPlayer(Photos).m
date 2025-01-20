@interface GKLocalPlayer(Photos)
- (uint64_t)deletePhoto;
- (void)deleteMonogramsWithHandler:()Photos;
- (void)deletePhotoWithCompletionHandler:()Photos;
- (void)setPhoto:()Photos avatarType:withCompletionHandler:;
- (void)setPhotoFromCNContactImage:()Photos pendingContact:withCompletionHandler:;
@end

@implementation GKLocalPlayer(Photos)

- (uint64_t)deletePhoto
{
  return [a1 deletePhotoWithCompletionHandler:&__block_literal_global_2];
}

- (void)deletePhotoWithCompletionHandler:()Photos
{
  id v4 = a3;
  v5 = [a1 internal];
  [v5 setPhotos:0];

  [a1 clearInMemoryCachedAvatars];
  id v7 = [a1 daemonProxy];
  v6 = [v7 profileServicePrivate];
  [v6 deletePhotoWithHandler:v4];
}

- (void)setPhoto:()Photos avatarType:withCompletionHandler:
{
  id v8 = a3;
  id v9 = a5;
  v10 = dispatch_get_global_queue(2, 0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__GKLocalPlayer_Photos__setPhoto_avatarType_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E5F63910;
  id v14 = v8;
  uint64_t v15 = a1;
  id v16 = v9;
  uint64_t v17 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)setPhotoFromCNContactImage:()Photos pendingContact:withCompletionHandler:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4F636D8];
  id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLocalPlayer+Photos.m", 112, "-[GKLocalPlayer(Photos) setPhotoFromCNContactImage:pendingContact:withCompletionHandler:]");
  v13 = [v11 dispatchGroupWithName:v12];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __89__GKLocalPlayer_Photos__setPhotoFromCNContactImage_pendingContact_withCompletionHandler___block_invoke;
  v20[3] = &unk_1E5F63960;
  id v14 = v9;
  id v21 = v14;
  id v15 = v8;
  id v22 = v15;
  uint64_t v23 = a1;
  id v16 = v13;
  id v24 = v16;
  [v16 perform:v20];
  if (v10)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __89__GKLocalPlayer_Photos__setPhotoFromCNContactImage_pendingContact_withCompletionHandler___block_invoke_4;
    v17[3] = &unk_1E5F63988;
    id v19 = v10;
    id v18 = v16;
    [v18 notifyOnMainQueueWithBlock:v17];
  }
}

- (void)deleteMonogramsWithHandler:()Photos
{
  id v4 = a3;
  v5 = [a1 internal];
  v6 = [v5 playerID];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F636D8];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKLocalPlayer+Photos.m", 168, "-[GKLocalPlayer(Photos) deleteMonogramsWithHandler:]");
    id v9 = [v7 dispatchGroupWithName:v8];

    id v10 = [a1 internal];
    id v11 = [v10 playerID];
    id v12 = GKAvatarSubdirectoryNameForPlayerID();

    for (uint64_t i = 0; i != 4; ++i)
    {
      uint64_t v14 = [(id)objc_opt_class() sizeForPhotoSize:qword_1AF7CAC00[i]];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke;
      v19[3] = &unk_1E5F639D8;
      uint64_t v21 = v14;
      id v15 = v12;
      id v20 = v15;
      [v9 perform:v19];
    }
    if ([a1 avatarType] == 1)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke_3;
      v18[3] = &unk_1E5F63650;
      v18[4] = a1;
      [v9 perform:v18];
    }
    if (v4)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __52__GKLocalPlayer_Photos__deleteMonogramsWithHandler___block_invoke_19;
      v16[3] = &unk_1E5F639B0;
      id v17 = v4;
      [v9 notifyOnMainQueueWithBlock:v16];
    }
  }
}

@end