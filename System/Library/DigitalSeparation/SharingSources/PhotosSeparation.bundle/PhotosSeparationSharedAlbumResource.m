@interface PhotosSeparationSharedAlbumResource
+ (id)fetchSharedAlbumResourcesInLibrary:(id)a3 error:(id *)a4;
- (BOOL)isOwnedByCurrentUser;
- (PhotosSeparationSharedAlbumResource)initWithSharedAlbum:(id)a3;
- (id)displayDetail;
- (id)displayName;
- (id)uuid;
- (int64_t)visibility;
- (void)_callCompletion:(id)a3 withErrorCode:(unint64_t)a4 description:(id)a5 underlyingError:(id)a6;
- (void)stopSharingToParticipant:(id)a3 withCompletion:(id)a4;
- (void)stopSharingWithCompletion:(id)a3;
- (void)updateVisibility:(int64_t)a3 completion:(id)a4;
@end

@implementation PhotosSeparationSharedAlbumResource

- (void).cxx_destruct
{
}

- (void)_callCompletion:(id)a3 withErrorCode:(unint64_t)a4 description:(id)a5 underlyingError:(id)a6
{
  v9 = (void (**)(id, void *))a3;
  id v10 = a5;
  id v11 = a6;
  v12 = v11;
  if (v9)
  {
    if (v11)
    {
      v15[0] = NSLocalizedDescriptionKey;
      v15[1] = NSUnderlyingErrorKey;
      v16[0] = v10;
      v16[1] = v11;
      v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
      v14 = +[NSError errorWithDomain:@"com.apple.photos.PhotosSeparation" code:a4 userInfo:v13];
    }
    else
    {
      v14 = 0;
    }
    v9[2](v9, v14);
  }
}

- (void)updateVisibility:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  self->_visibilityIsStale = 1;
  if ([(PhotosSeparationSharedAlbumResource *)self isOwnedByCurrentUser])
  {
    v7 = [(PHCloudSharedAlbum *)self->_sharedAlbum photoLibrary];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_4AB4;
    v10[3] = &unk_83D0;
    v10[4] = self;
    v10[5] = a3;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_4B24;
    v8[3] = &unk_8378;
    v8[4] = self;
    id v9 = v6;
    [v7 performChanges:v10 completionHandler:v8];
  }
  else
  {
    [(PhotosSeparationSharedAlbumResource *)self _callCompletion:v6 withErrorCode:128 description:@"Failed to stop sharing public album link" underlyingError:0];
  }
}

- (void)stopSharingToParticipant:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(PhotosSeparationSharedAlbumResource *)self isOwnedByCurrentUser];
  id v9 = [(PHCloudSharedAlbum *)self->_sharedAlbum photoLibrary];
  if (v8)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_4D24;
    v18[3] = &unk_83A0;
    v18[4] = self;
    id v19 = v6;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    void v16[2] = sub_4E04;
    v16[3] = &unk_8378;
    v16[4] = self;
    id v17 = v7;
    id v10 = v7;
    [v9 performChanges:v18 completionHandler:v16];

    id v11 = v19;
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    void v15[2] = sub_4E20;
    v15[3] = &unk_8348;
    v15[4] = self;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_4E5C;
    v13[3] = &unk_8378;
    v13[4] = self;
    id v14 = v7;
    id v12 = v7;
    [v9 performChanges:v15 completionHandler:v13];

    id v11 = v14;
  }
}

- (void)stopSharingWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(PhotosSeparationSharedAlbumResource *)self isOwnedByCurrentUser];
  id v6 = [(PHCloudSharedAlbum *)self->_sharedAlbum photoLibrary];
  if (v5)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_5024;
    v21[3] = &unk_8348;
    v21[4] = self;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_508C;
    v19[3] = &unk_8378;
    id v7 = &v20;
    v19[4] = self;
    id v20 = v4;
    id v8 = v4;
    id v9 = v21;
    id v10 = (void ***)v19;
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_50A8;
    v18[3] = &unk_8348;
    v18[4] = self;
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    id v14 = sub_50E4;
    v15 = &unk_8378;
    id v7 = &v17;
    v16 = self;
    id v17 = v4;
    id v11 = v4;
    id v9 = v18;
    id v10 = &v12;
  }
  objc_msgSend(v6, "performChanges:completionHandler:", v9, v10, v12, v13, v14, v15, v16);
}

- (int64_t)visibility
{
  if (self->_visibilityIsStale)
  {
    v3 = [(PHCloudSharedAlbum *)self->_sharedAlbum localIdentifier];
    id v11 = v3;
    id v4 = +[NSArray arrayWithObjects:&v11 count:1];
    unsigned int v5 = [(PHCloudSharedAlbum *)self->_sharedAlbum photoLibrary];
    id v6 = [v5 librarySpecificFetchOptions];
    id v7 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:v4 options:v6];

    id v8 = [v7 firstObject];
    sharedAlbum = self->_sharedAlbum;
    self->_sharedAlbum = v8;

    self->_visibilityIsStale = 0;
  }
  if ([(PHCloudSharedAlbum *)self->_sharedAlbum publicURLEnabled]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)displayDetail
{
  return @"Shared Album";
}

- (id)displayName
{
  return [(PHCloudSharedAlbum *)self->_sharedAlbum localizedTitle];
}

- (BOOL)isOwnedByCurrentUser
{
  return [(PHCloudSharedAlbum *)self->_sharedAlbum isOwned];
}

- (id)uuid
{
  return [(PHCloudSharedAlbum *)self->_sharedAlbum uuid];
}

- (PhotosSeparationSharedAlbumResource)initWithSharedAlbum:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id obj = a3;
    id v7 = [v5 invitationRecords];
    id v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
    id v9 = [PhotosSeparationParticipant alloc];
    id v10 = [v6 cloudOwnerEmail];
    id v11 = [v6 cloudOwnerPhone];
    id v12 = [(PhotosSeparationParticipant *)v9 initWithRole:1 permission:2 emailAddress:v10 phoneNumber:v11];

    v24 = v12;
    [v8 addObject:v12];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v7;
    id v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = -[PhotosSeparationSharedAlbumParticipant initWithInvitationRecord:isOwner:readwrite:]([PhotosSeparationSharedAlbumParticipant alloc], "initWithInvitationRecord:isOwner:readwrite:", *(void *)(*((void *)&v26 + 1) + 8 * i), 0, [v6 isCloudMultipleContributorsEnabled]);
          if (v18) {
            [v8 addObject:v18];
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v15);
    }

    v25.receiver = self;
    v25.super_class = (Class)PhotosSeparationSharedAlbumResource;
    id v19 = [(PhotosSeparationSharedResource *)&v25 initWithParticipants:v8];
    id v20 = v19;
    if (v19) {
      objc_storeStrong((id *)&v19->_sharedAlbum, obj);
    }
    self = v20;

    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)fetchSharedAlbumResourcesInLibrary:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  if ([v4 isSharedAlbumsEnabled])
  {
    id v6 = [v4 librarySpecificFetchOptions];
    id v7 = +[PHAssetCollection fetchAssetCollectionsWithType:1 subtype:101 options:v6];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v14 = [PhotosSeparationSharedAlbumResource alloc];
          id v15 = -[PhotosSeparationSharedAlbumResource initWithSharedAlbum:](v14, "initWithSharedAlbum:", v13, (void)v17);
          [v5 addObject:v15];
        }
        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }

  return v5;
}

@end