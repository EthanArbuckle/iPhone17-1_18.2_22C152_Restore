@interface AVTDaemonImageOperationHandler
- (AVTDaemonImageOperationHandler)initWithLogger:(id)a3;
- (AVTUILogger)logger;
- (BOOL)deleteThumbnailsForAvatarRecordsWithIdentifiers:(id)a3 error:(id *)a4;
- (BOOL)generateThumbnailsForAvatarRecord:(id)a3 avatar:(id)a4 error:(id *)a5;
- (BOOL)generateThumbnailsForAvatarRecords:(id)a3 error:(id *)a4;
- (BOOL)generateThumbnailsForDuplicateAvatarRecord:(id)a3 originalRecord:(id)a4 error:(id *)a5;
- (BOOL)removeImagesAtLocation:(id)a3 forIdentifiers:(id)a4 error:(id *)a5;
- (void)clearContentAtLocation:(id)a3;
- (void)clearStickersForAvatarRecordIdentifier:(id)a3 withEnvironment:(id)a4;
- (void)deleteImagesForAvatarRecordIdentifier:(id)a3 error:(id *)a4;
- (void)setLogger:(id)a3;
- (void)updateThumbnailsForChangesWithTracker:(id)a3 recordProvider:(id)a4;
@end

@implementation AVTDaemonImageOperationHandler

- (AVTDaemonImageOperationHandler)initWithLogger:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTDaemonImageOperationHandler;
  v6 = [(AVTDaemonImageOperationHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_logger, a3);
  }

  return v7;
}

- (void)clearContentAtLocation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSFileManager);
  id v10 = 0;
  unsigned __int8 v6 = [v5 removeItemAtURL:v4 error:&v10];

  id v7 = v10;
  if ((v6 & 1) == 0)
  {
    v8 = [(AVTDaemonImageOperationHandler *)self logger];
    objc_super v9 = [v7 description];
    [v8 logFileSystemError:v9];
  }
}

- (BOOL)deleteThumbnailsForAvatarRecordsWithIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[AVTCoreEnvironment defaultEnvironment];
  v8 = [v7 imageStoreLocation];

  LOBYTE(a4) = [(AVTDaemonImageOperationHandler *)self removeImagesAtLocation:v8 forIdentifiers:v6 error:a4];
  return (char)a4;
}

- (void)clearStickersForAvatarRecordIdentifier:(id)a3 withEnvironment:(id)a4
{
  id v5 = a3;
  id v6 = +[AVTCoreEnvironment defaultEnvironment];
  id v7 = [v6 stickerImageStoreLocation];

  id v9 = v5;
  v8 = +[NSArray arrayWithObjects:&v9 count:1];

  [(AVTDaemonImageOperationHandler *)self removeImagesAtLocation:v7 forIdentifiers:v8 error:0];
}

- (void)deleteImagesForAvatarRecordIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[AVTCoreEnvironment defaultEnvironment];
  v8 = [v7 imageStoreLocation];

  id v10 = v6;
  id v9 = +[NSArray arrayWithObjects:&v10 count:1];

  [(AVTDaemonImageOperationHandler *)self removeImagesAtLocation:v8 forIdentifiers:v9 error:a4];
}

- (BOOL)removeImagesAtLocation:(id)a3 forIdentifiers:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init((Class)NSFileManager);
  v11 = [v8 path];
  unsigned int v12 = [v10 fileExistsAtPath:v11];

  if (v12)
  {
    v13 = [v10 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:&__NSArray0__struct options:0 error:a5];
    if (v13)
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v14 = v9;
      id v31 = [v14 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v31)
      {
        uint64_t v15 = *(void *)v42;
        id v35 = v9;
        id v36 = v8;
        uint64_t v29 = *(void *)v42;
        v30 = self;
        v33 = v14;
        v34 = v13;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v42 != v15) {
              objc_enumerationMutation(v14);
            }
            uint64_t v32 = v16;
            uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8 * v16);
            v18 = [(AVTDaemonImageOperationHandler *)self logger];
            [v18 logDeletingImagesWithIdentifierPrefix:v17];

            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v19 = v13;
            id v20 = [v19 countByEnumeratingWithState:&v37 objects:v45 count:16];
            if (v20)
            {
              id v21 = v20;
              uint64_t v22 = *(void *)v38;
              while (2)
              {
                for (i = 0; i != v21; i = (char *)i + 1)
                {
                  if (*(void *)v38 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  v24 = *(void **)(*((void *)&v37 + 1) + 8 * i);
                  v25 = [v24 lastPathComponent];
                  unsigned int v26 = [v25 hasPrefix:v17];

                  if (v26 && ![v10 removeItemAtURL:v24 error:a5])
                  {

                    BOOL v27 = 0;
                    id v9 = v35;
                    id v8 = v36;
                    id v14 = v33;
                    v13 = v34;
                    goto LABEL_24;
                  }
                }
                id v21 = [v19 countByEnumeratingWithState:&v37 objects:v45 count:16];
                if (v21) {
                  continue;
                }
                break;
              }
            }

            uint64_t v16 = v32 + 1;
            id v9 = v35;
            id v8 = v36;
            uint64_t v15 = v29;
            self = v30;
            id v14 = v33;
            v13 = v34;
          }
          while ((id)(v32 + 1) != v31);
          BOOL v27 = 1;
          id v31 = [v33 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v31);
      }
      else
      {
        BOOL v27 = 1;
      }
LABEL_24:
    }
    else
    {
      BOOL v27 = 0;
    }
  }
  else
  {
    BOOL v27 = 1;
  }

  return v27;
}

- (void)updateThumbnailsForChangesWithTracker:(id)a3 recordProvider:(id)a4
{
  id v5 = a3;
  id v6 = +[AVTCoreEnvironment defaultEnvironment];
  id v7 = [v6 imageStoreLocation];

  +[NSMutableArray array];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100002134;
  v19[3] = &unk_1000041A0;
  v19[4] = self;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v20;
  id v9 = objc_retainBlock(v19);
  id v10 = [(AVTDaemonImageOperationHandler *)self logger];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000238C;
  v14[3] = &unk_1000041C8;
  id v15 = v5;
  id v16 = v7;
  uint64_t v17 = self;
  id v18 = v9;
  v11 = v9;
  id v12 = v7;
  id v13 = v5;
  [v10 updatingThumbnailsForRemoteChanges:v14];
}

- (BOOL)generateThumbnailsForAvatarRecord:(id)a3 avatar:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)generateThumbnailsForAvatarRecords:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)generateThumbnailsForDuplicateAvatarRecord:(id)a3 originalRecord:(id)a4 error:(id *)a5
{
  return 1;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (void).cxx_destruct
{
}

@end