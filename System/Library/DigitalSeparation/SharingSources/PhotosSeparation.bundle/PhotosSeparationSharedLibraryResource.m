@interface PhotosSeparationSharedLibraryResource
+ (id)fetchSharedLibraryResourcesInLibrary:(id)a3 error:(id *)a4;
- (BOOL)isOwnedByCurrentUser;
- (PhotosSeparationSharedLibraryResource)initWithLibraryScope:(id)a3;
- (id)displayDetail;
- (id)displayName;
- (id)uuid;
- (int64_t)visibility;
- (void)stopSharingToParticipant:(id)a3 withCompletion:(id)a4;
- (void)stopSharingWithCompletion:(id)a3;
@end

@implementation PhotosSeparationSharedLibraryResource

- (void).cxx_destruct
{
}

- (void)stopSharingToParticipant:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_397C;
  v20[3] = &unk_82F8;
  id v7 = a4;
  id v21 = v7;
  v8 = objc_retainBlock(v20);
  unsigned int v9 = [(PhotosSeparationSharedLibraryResource *)self isOwnedByCurrentUser];
  libraryScope = self->_libraryScope;
  if (v9)
  {
    v11 = [v6 representedObject];
    v22 = v11;
    v12 = +[NSArray arrayWithObjects:&v22 count:1];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_3A84;
    v18[3] = &unk_8320;
    v13 = (id *)&v19;
    v19 = v8;
    v14 = v8;
    [(PHLibraryScope *)libraryScope removeParticipants:v12 exitSource:2 completion:v18];
  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_3A98;
    v16[3] = &unk_8320;
    v13 = (id *)&v17;
    v17 = v8;
    v15 = v8;
    [(PHLibraryScope *)libraryScope startExitFromLibraryScopeWithRetentionPolicy:2 exitSource:2 completion:v16];
  }
}

- (void)stopSharingWithCompletion:(id)a3
{
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_3D78;
  v27[3] = &unk_82F8;
  id v4 = a3;
  id v28 = v4;
  v5 = objc_retainBlock(v27);
  if ([(PhotosSeparationSharedLibraryResource *)self isOwnedByCurrentUser])
  {
    id v6 = objc_alloc((Class)NSMutableArray);
    id v7 = [(PhotosSeparationSharedResource *)self participants];
    v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    unsigned int v9 = [(PhotosSeparationSharedResource *)self participants];
    id v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (([v14 isCurrentUser] & 1) == 0)
          {
            v15 = [v14 representedObject];
            [v8 addObject:v15];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v11);
    }

    libraryScope = self->_libraryScope;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_3E80;
    v21[3] = &unk_8320;
    id v22 = v5;
    v17 = v5;
    [(PHLibraryScope *)libraryScope removeParticipants:v8 exitSource:2 completion:v21];
  }
  else
  {
    v18 = self->_libraryScope;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_3E94;
    v19[3] = &unk_8320;
    v20 = v5;
    v8 = v5;
    [(PHLibraryScope *)v18 startExitFromLibraryScopeWithRetentionPolicy:2 exitSource:2 completion:v19];
    v17 = v20;
  }
}

- (int64_t)visibility
{
  return 1;
}

- (id)displayDetail
{
  return @"Shared Library";
}

- (id)displayName
{
  return [(PHLibraryScope *)self->_libraryScope title];
}

- (BOOL)isOwnedByCurrentUser
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(PhotosSeparationSharedResource *)self participants];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if [v6 isCurrentUser] && (objc_msgSend(v6, "isOwner"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (id)uuid
{
  return [(PHLibraryScope *)self->_libraryScope uuid];
}

- (PhotosSeparationSharedLibraryResource)initWithLibraryScope:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 photoLibrary];
    long long v8 = [v7 librarySpecificFetchOptions];
    long long v9 = +[PHShareParticipant fetchParticipantsInShare:v6 options:v8];

    long long v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [[PhotosSeparationSharedLibraryParticipant alloc] initWithShareParticipant:*(void *)(*((void *)&v22 + 1) + 8 * i)];
          if (v16) {
            [v10 addObject:v16];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    v21.receiver = self;
    v21.super_class = (Class)PhotosSeparationSharedLibraryResource;
    v17 = [(PhotosSeparationSharedResource *)&v21 initWithParticipants:v10];
    v18 = v17;
    if (v17) {
      objc_storeStrong((id *)&v17->_libraryScope, a3);
    }
    self = v18;

    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)fetchSharedLibraryResourcesInLibrary:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  id v6 = [v4 librarySpecificFetchOptions];

  id v7 = +[PHLibraryScope fetchActiveLibraryScopeWithOptions:v6];
  long long v8 = [v7 firstObject];

  if (v8)
  {
    long long v9 = [[PhotosSeparationSharedLibraryResource alloc] initWithLibraryScope:v8];
    if (v9) {
      [v5 addObject:v9];
    }
  }

  return v5;
}

@end