@interface SSSScreenshotManager
+ (id)sharedScreenshotManager;
+ (void)_createTemporarySavingQueue;
- (BOOL)_areAnyScreenshotsActive;
- (BOOL)_screenshotIsBeingRemoved:(id)a3;
- (BOOL)_screenshotIsBeingSaved:(id)a3;
- (BOOL)_screenshotIsGoingAway:(id)a3;
- (BOOL)processEnvironmentElementMetadataUpdate:(id)a3;
- (BOOL)shouldCaptureDocumentForMetadataUpdate:(id)a3;
- (NSArray)environmentDescriptionIdentifiersBeingRemoved;
- (NSArray)environmentDescriptionIdentifiersBeingSaved;
- (NSArray)environmentDescriptionIdentifiersBeingTracked;
- (NSArray)environmentDescriptionIdentifiersInActiveDragSession;
- (NSArray)environmentDescriptionIdentifiersUIIsInterestedIn;
- (SSSScreenshotManager)init;
- (id)_screenshotWithEnvironmentDescriptionIdentifier:(id)a3;
- (id)_screenshotWithEnvironmentElementWithIdentifier:(id)a3;
- (id)createScreenshotWithEnvironmentDescription:(id)a3;
- (id)description;
- (id)environmentDescriptionIdentifiersGoingAway;
- (void)_reevaluateTrackingForScreenshotWithEnvironmentDescriptionIdentifier:(id)a3;
- (void)_trackingChanged;
- (void)addImageIdentifierUpdateObserver:(id)a3;
- (void)performIfNoScreenshotsAreActive:(id)a3;
- (void)processEnvironmentElementDocumentUpdate:(id)a3;
- (void)processImageIdentifierUpdate:(id)a3;
- (void)removeImageIdentifierUpdateObserver:(id)a3;
- (void)removeScreenshot:(id)a3 deleteOptions:(unint64_t)a4;
- (void)removeTemporaryScreenshotLocation:(id)a3 deleteOptions:(unint64_t)a4;
- (void)saveEditsToScreenshotIfNecessary:(id)a3 inTransition:(BOOL)a4;
- (void)saveScreenshotsToTemporaryLocation:(id)a3 completion:(id)a4;
- (void)screenshotEnteredDragSession:(id)a3;
- (void)screenshotLeftDragSession:(id)a3;
- (void)userInterfaceBecameInterestedInScreenshot:(id)a3;
- (void)userInterfaceStoppedBeingInterestedInScreenshot:(id)a3;
- (void)userInterfaceWillStopBeingInterestedInScreenshot:(id)a3;
@end

@implementation SSSScreenshotManager

- (id)createScreenshotWithEnvironmentDescription:(id)a3
{
  id v4 = a3;
  v5 = [[SSSScreenshot alloc] initWithEnvironmentDescription:v4];

  [(NSMutableArray *)self->_screenshots addObject:v5];

  return v5;
}

- (id)_screenshotWithEnvironmentDescriptionIdentifier:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_screenshots;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 environmentDescription:v14];
        v11 = [v10 identifier];
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_screenshotWithEnvironmentElementWithIdentifier:(id)a3
{
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v5 = self->_screenshots;
  id v20 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v20)
  {
    uint64_t v6 = *(void *)v27;
    v21 = v5;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v5);
        }
        v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v9 = [v8 environmentDescription];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        v10 = [v9 elements];
        id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v23;
          while (2)
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)j) identifier];
              unsigned __int8 v16 = [v15 isEqualToString:v4];

              if (v16)
              {
                id v17 = v8;

                v5 = v21;
                goto LABEL_19;
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        v5 = v21;
        uint64_t v6 = v19;
      }
      id v17 = 0;
      id v20 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v20);
  }
  else
  {
    id v17 = 0;
  }
LABEL_19:

  return v17;
}

- (void)processImageIdentifierUpdate:(id)a3
{
  id v4 = a3;
  v5 = [v4 environmentDescriptionIdentifier];
  uint64_t v6 = [(SSSScreenshotManager *)self _screenshotWithEnvironmentDescriptionIdentifier:v5];

  if (v6)
  {
    if ([v4 success])
    {
      uint64_t v7 = [v4 imageIdentifier];
      v8 = [v6 imageProvider];
      [v8 processImageIdentifier:v7];
    }
    else
    {
      uint64_t v7 = os_log_create("com.apple.screenshotservices", "XPC");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10005ED2C(v4);
      }
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v9 = self->_imageIdentifierUpdateObservers;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) screenshotReceivedImageIdentifierUpdate:v6 (void)v14];
          uint64_t v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
  else
  {
    v9 = os_log_create("com.apple.screenshotservices", "XPC");
    if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_ERROR)) {
      sub_10005ECA8(v4);
    }
  }
}

- (BOOL)shouldCaptureDocumentForMetadataUpdate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[NSMutableArray array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v6 = self->_screenshots;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          if (!-[SSSScreenshotManager _screenshotIsGoingAway:](self, "_screenshotIsGoingAway:", v11, (void)v21)) {
            [v5 addObject:v11];
          }
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }

    uint64_t v12 = [v4 environmentElementIdentifier];
    uint64_t v13 = [(SSSScreenshotManager *)self _screenshotWithEnvironmentElementWithIdentifier:v12];

    unsigned __int8 v14 = [(SSSScreenshotManager *)self _screenshotIsBeingRemoved:v13];
    id v15 = [v5 indexOfObject:v13];
    long long v16 = [v4 metadata];
    if (v16)
    {
      long long v17 = [v4 metadata];
      unsigned __int8 v18 = [v17 canGenerateDocument];
    }
    else
    {
      unsigned __int8 v18 = 0;
    }

    BOOL v19 = (v15 == 0) & ~v14 & v18;
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)processEnvironmentElementMetadataUpdate:(id)a3
{
  id v4 = a3;
  v5 = [v4 environmentElementIdentifier];
  uint64_t v6 = [(SSSScreenshotManager *)self _screenshotWithEnvironmentElementWithIdentifier:v5];

  if (v6)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = [v6 environmentDescription];
    id v8 = [v7 elements];

    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v9)
    {
      id v20 = self;
      uint64_t v10 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v13 = [v12 identifier];
          unsigned __int8 v14 = [v4 environmentElementIdentifier];
          unsigned __int8 v15 = [v13 isEqualToString:v14];

          if (v15)
          {
            long long v16 = [v4 metadata];
            [v12 setMetadata:v16];

            id v9 = (id)[(SSSScreenshotManager *)v20 shouldCaptureDocumentForMetadataUpdate:v4];
            [v6 setIsPDFRequested:v9];
            CFStringRef v25 = @"screenshot";
            long long v26 = v6;
            long long v17 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
            unsigned __int8 v18 = +[NSNotificationCenter defaultCenter];
            [v18 postNotificationName:@"SSSScreenshotManagerDidProcessMetadataUpdate" object:v20 userInfo:v17];

            goto LABEL_15;
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    long long v17 = os_log_create("com.apple.screenshotservices", "XPC");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10005EDB0(v4);
    }
    LOBYTE(v9) = 0;
    id v8 = v17;
LABEL_15:
  }
  return (char)v9;
}

- (void)processEnvironmentElementDocumentUpdate:(id)a3
{
  id v4 = a3;
  v5 = [v4 environmentElementIdentifier];
  uint64_t v6 = [(SSSScreenshotManager *)self _screenshotWithEnvironmentElementWithIdentifier:v5];

  if (v6)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = [v6 environmentDescription];
    id v8 = [v7 elements];

    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      id v20 = self;
      uint64_t v11 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          unsigned __int8 v14 = [v13 identifier];
          unsigned __int8 v15 = [v4 environmentElementIdentifier];
          unsigned int v16 = [v14 isEqualToString:v15];

          if (v16)
          {
            long long v17 = [v4 document];
            [v13 setDocument:v17];

            [v6 _harvestPDFIfNecessary];
            CFStringRef v25 = @"screenshot";
            long long v26 = v6;
            unsigned __int8 v18 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
            BOOL v19 = +[NSNotificationCenter defaultCenter];
            [v19 postNotificationName:@"SSSScreenshotManagerDidProcessDocumentUpdate" object:v20 userInfo:v18];

            goto LABEL_15;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    unsigned __int8 v18 = os_log_create("com.apple.screenshotservices", "XPC");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10005EE34(v4);
    }
    id v8 = v18;
LABEL_15:
  }
}

- (void)addImageIdentifierUpdateObserver:(id)a3
{
  id v4 = a3;
  [(NSMutableArray *)self->_imageIdentifierUpdateObservers addObject:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_screenshots;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v11 = [v10 identifier];

        if (v11) {
          [v4 screenshotReceivedImageIdentifierUpdate:v10];
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)removeImageIdentifierUpdateObserver:(id)a3
{
}

- (void)saveEditsToScreenshotIfNecessary:(id)a3 inTransition:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 hasUnsavedImageEdits])
  {
    id v7 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v6 environmentDescription];
      id v9 = [v8 loggableDescription];
      *(_DWORD *)buf = 138412290;
      v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Saving edits to screenshot image with environment description %@", buf, 0xCu);
    }
    id v10 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v6 loggableDescription];
      *(_DWORD *)buf = 138412290;
      v32 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Screenshot edits saved: %@", buf, 0xCu);
    }
    environmentDescriptionIdentifiersBeingSaved = self->_environmentDescriptionIdentifiersBeingSaved;
    long long v13 = [v6 environmentDescription];
    long long v14 = [v13 identifier];
    [(NSMutableArray *)environmentDescriptionIdentifiersBeingSaved addObject:v14];

    [(SSSScreenshotManager *)self _trackingChanged];
    long long v15 = +[SSScreenshotAssetManager sharedAssetManager];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100012568;
    v28[3] = &unk_100099C98;
    id v29 = v6;
    v30 = self;
    [v15 recordEditsToPersistable:v29 inTransition:v4 withCompletionBlock:v28];
  }
  unsigned int v16 = [v6 pdfData];
  if (!v16 || ![v6 canAutosaveToFiles]) {
    goto LABEL_13;
  }
  unsigned __int8 v17 = [v6 isSavingForMode:1];

  if ((v17 & 1) == 0)
  {
    unsigned __int8 v18 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      BOOL v19 = [v6 environmentDescription];
      id v20 = [v19 loggableDescription];
      *(_DWORD *)buf = 138412290;
      v32 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Saving edits to screenshot pdf with environment description %@", buf, 0xCu);
    }
    long long v21 = self->_environmentDescriptionIdentifiersBeingSaved;
    long long v22 = [v6 environmentDescription];
    long long v23 = [v22 identifier];
    [(NSMutableArray *)v21 addObject:v23];

    [(SSSScreenshotManager *)self _trackingChanged];
    long long v24 = +[SSScreenshotAssetManager sharedAssetManager];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100012844;
    v25[3] = &unk_100099C98;
    id v26 = v6;
    long long v27 = self;
    [v24 recordEditsToPersistableForPDF:v26 withCompletionBlock:v25];

    unsigned int v16 = v26;
LABEL_13:
  }
}

- (BOOL)_screenshotIsBeingSaved:(id)a3
{
  environmentDescriptionIdentifiersBeingSaved = self->_environmentDescriptionIdentifiersBeingSaved;
  BOOL v4 = [a3 environmentDescription];
  v5 = [v4 identifier];
  LOBYTE(environmentDescriptionIdentifiersBeingSaved) = [(NSMutableArray *)environmentDescriptionIdentifiersBeingSaved containsObject:v5];

  return (char)environmentDescriptionIdentifiersBeingSaved;
}

+ (void)_createTemporarySavingQueue
{
  if (qword_1000B5748 != -1) {
    dispatch_once(&qword_1000B5748, &stru_100099CB8);
  }
}

- (void)saveScreenshotsToTemporaryLocation:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [(id)objc_opt_class() _createTemporarySavingQueue];
  id v7 = qword_1000B5740;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100012CC0;
  v10[3] = &unk_100099A60;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

- (void)removeScreenshot:(id)a3 deleteOptions:(unint64_t)a4
{
  id v6 = a3;
  if (([(NSMutableArray *)self->_screenshots containsObject:v6] & 1) == 0)
  {
    id v7 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10005EEB8(v6);
    }
  }
  id v8 = [v6 environmentDescription];
  id v9 = [v8 identifier];

  [(NSMutableArray *)self->_environmentDescriptionIdentifiersBeingRemoved addObject:v9];
  [(SSSScreenshotManager *)self _trackingChanged];
  id v10 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [v6 environmentDescription];
    id v12 = [v11 loggableDescription];
    *(_DWORD *)buf = 138412290;
    long long v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Removing screenshot with environment description %@", buf, 0xCu);
  }
  [v6 setIsDeleted:1];
  long long v13 = [v6 imageProvider];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100013268;
  v16[3] = &unk_100099D58;
  id v17 = v6;
  unsigned __int8 v18 = self;
  id v19 = v9;
  unint64_t v20 = a4;
  id v14 = v9;
  id v15 = v6;
  [v13 scheduleDeletionBlock:v16];
}

- (void)removeTemporaryScreenshotLocation:(id)a3 deleteOptions:(unint64_t)a4
{
  id v6 = a3;
  if (([(NSMutableArray *)self->_screenshots containsObject:v6] & 1) == 0)
  {
    id v7 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10005EEB8(v6);
    }
  }
  id v8 = [v6 imageProvider];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001354C;
  v10[3] = &unk_100099AE0;
  id v11 = v6;
  unint64_t v12 = a4;
  id v9 = v6;
  [v8 scheduleDeletionBlock:v10];
}

- (BOOL)_screenshotIsGoingAway:(id)a3
{
  environmentDescriptionIdentifiersGoingAway = self->_environmentDescriptionIdentifiersGoingAway;
  BOOL v4 = [a3 environmentDescription];
  id v5 = [v4 identifier];
  LOBYTE(environmentDescriptionIdentifiersGoingAway) = [(NSMutableArray *)environmentDescriptionIdentifiersGoingAway containsObject:v5];

  return (char)environmentDescriptionIdentifiersGoingAway;
}

- (BOOL)_screenshotIsBeingRemoved:(id)a3
{
  environmentDescriptionIdentifiersBeingRemoved = self->_environmentDescriptionIdentifiersBeingRemoved;
  BOOL v4 = [a3 environmentDescription];
  id v5 = [v4 identifier];
  LOBYTE(environmentDescriptionIdentifiersBeingRemoved) = [(NSMutableArray *)environmentDescriptionIdentifiersBeingRemoved containsObject:v5];

  return (char)environmentDescriptionIdentifiersBeingRemoved;
}

- (BOOL)_areAnyScreenshotsActive
{
  v3 = (char *)[(NSMutableArray *)self->_screenshots count];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v4 = self->_screenshots;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v3 -= -[SSSScreenshotManager _screenshotIsBeingRemoved:](self, "_screenshotIsBeingRemoved:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v8), (void)v10);
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return (uint64_t)v3 > 0;
}

- (void)userInterfaceBecameInterestedInScreenshot:(id)a3
{
  BOOL v4 = [a3 environmentDescription];
  id v5 = [v4 identifier];

  [(NSMutableArray *)self->_environmentDescriptionIdentifiersUIIsInterestedIn addObject:v5];
  [(SSSScreenshotManager *)self _trackingChanged];
}

- (void)userInterfaceWillStopBeingInterestedInScreenshot:(id)a3
{
  BOOL v4 = [a3 environmentDescription];
  id v5 = [v4 identifier];

  [(NSMutableArray *)self->_environmentDescriptionIdentifiersGoingAway addObject:v5];
}

- (void)userInterfaceStoppedBeingInterestedInScreenshot:(id)a3
{
  BOOL v4 = [a3 environmentDescription];
  id v5 = [v4 identifier];

  [(NSMutableArray *)self->_environmentDescriptionIdentifiersUIIsInterestedIn removeObject:v5];
  [(SSSScreenshotManager *)self _reevaluateTrackingForScreenshotWithEnvironmentDescriptionIdentifier:v5];
}

- (void)screenshotEnteredDragSession:(id)a3
{
  BOOL v4 = [a3 environmentDescription];
  id v5 = [v4 identifier];

  [(NSMutableArray *)self->_environmentDescriptionIdentifiersInActiveDragSession addObject:v5];
  [(SSSScreenshotManager *)self _trackingChanged];
}

- (void)screenshotLeftDragSession:(id)a3
{
  BOOL v4 = [a3 environmentDescription];
  id v5 = [v4 identifier];

  [(NSMutableArray *)self->_environmentDescriptionIdentifiersInActiveDragSession removeObject:v5];
  [(SSSScreenshotManager *)self _reevaluateTrackingForScreenshotWithEnvironmentDescriptionIdentifier:v5];
}

- (void)performIfNoScreenshotsAreActive:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  if (![(SSSScreenshotManager *)self _areAnyScreenshotsActive]) {
    v4[2]();
  }
}

- (void)_reevaluateTrackingForScreenshotWithEnvironmentDescriptionIdentifier:(id)a3
{
  id v4 = a3;
  if (([(NSMutableArray *)self->_environmentDescriptionIdentifiersUIIsInterestedIn containsObject:v4] & 1) == 0&& ([(NSMutableArray *)self->_environmentDescriptionIdentifiersInActiveDragSession containsObject:v4] & 1) == 0&& ([(NSMutableArray *)self->_environmentDescriptionIdentifiersBeingSaved containsObject:v4] & 1) == 0&& ([(NSMutableArray *)self->_environmentDescriptionIdentifiersBeingRemoved containsObject:v4] & 1) == 0)
  {
    id v5 = [(SSSScreenshotManager *)self _screenshotWithEnvironmentDescriptionIdentifier:v4];
    id v6 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [v5 loggableDescription];
      int v11 = 138412290;
      long long v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Stopping tracking screenshot with environment description %@", (uint8_t *)&v11, 0xCu);
    }
    id v8 = [v5 identifier];
    [(NSMutableArray *)self->_environmentDescriptionIdentifiersGoingAway removeObject:v8];
    [(NSMutableArray *)self->_environmentDescriptionIdentifiersBeingRemoved removeObject:v8];
    [(NSMutableArray *)self->_environmentDescriptionIdentifiersBeingSaved removeObject:v8];
    [(NSMutableArray *)self->_screenshots removeObject:v5];
    if (![(NSMutableArray *)self->_screenshots count])
    {
      id v9 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No longer tracking any screenshots - posting notification", (uint8_t *)&v11, 2u);
      }

      long long v10 = +[NSNotificationCenter defaultCenter];
      [v10 postNotificationName:@"SSSScreenshotManagerStoppedTrackingScreenshots" object:self];
    }
  }
  [(SSSScreenshotManager *)self _trackingChanged];
}

- (void)_trackingChanged
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"SSSScreenshotManagerTrackingChanged" object:self];
}

- (SSSScreenshotManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)SSSScreenshotManager;
  v2 = [(SSSScreenshotManager *)&v18 init];
  uint64_t v3 = +[NSMutableArray array];
  screenshots = v2->_screenshots;
  v2->_screenshots = (NSMutableArray *)v3;

  uint64_t v5 = +[NSMutableArray array];
  environmentDescriptionIdentifiersUIIsInterestedIn = v2->_environmentDescriptionIdentifiersUIIsInterestedIn;
  v2->_environmentDescriptionIdentifiersUIIsInterestedIn = (NSMutableArray *)v5;

  uint64_t v7 = +[NSMutableArray array];
  environmentDescriptionIdentifiersGoingAway = v2->_environmentDescriptionIdentifiersGoingAway;
  v2->_environmentDescriptionIdentifiersGoingAway = (NSMutableArray *)v7;

  uint64_t v9 = +[NSMutableArray array];
  environmentDescriptionIdentifiersInActiveDragSession = v2->_environmentDescriptionIdentifiersInActiveDragSession;
  v2->_environmentDescriptionIdentifiersInActiveDragSession = (NSMutableArray *)v9;

  uint64_t v11 = +[NSMutableArray array];
  environmentDescriptionIdentifiersBeingRemoved = v2->_environmentDescriptionIdentifiersBeingRemoved;
  v2->_environmentDescriptionIdentifiersBeingRemoved = (NSMutableArray *)v11;

  uint64_t v13 = +[NSMutableArray array];
  environmentDescriptionIdentifiersBeingSaved = v2->_environmentDescriptionIdentifiersBeingSaved;
  v2->_environmentDescriptionIdentifiersBeingSaved = (NSMutableArray *)v13;

  uint64_t v15 = +[NSMutableArray array];
  imageIdentifierUpdateObservers = v2->_imageIdentifierUpdateObservers;
  v2->_imageIdentifierUpdateObservers = (NSMutableArray *)v15;

  return v2;
}

- (id)description
{
  uint64_t v3 = +[NSMutableString string];
  v16.receiver = self;
  v16.super_class = (Class)SSSScreenshotManager;
  id v4 = [(SSSScreenshotManager *)&v16 description];
  [v3 appendString:v4];

  uint64_t v5 = [(NSMutableArray *)self->_screenshots description];
  id v6 = +[NSString stringWithFormat:@" screenshots: %@", v5];
  [v3 appendString:v6];

  uint64_t v7 = [(NSMutableArray *)self->_environmentDescriptionIdentifiersUIIsInterestedIn description];
  id v8 = +[NSString stringWithFormat:@" environment description identiifers in UI: %@", v7];
  [v3 appendString:v8];

  uint64_t v9 = [(NSMutableArray *)self->_environmentDescriptionIdentifiersGoingAway description];
  long long v10 = +[NSString stringWithFormat:@" environment description identiifers going away: %@", v9];
  [v3 appendString:v10];

  uint64_t v11 = [(NSMutableArray *)self->_environmentDescriptionIdentifiersBeingSaved description];
  long long v12 = +[NSString stringWithFormat:@" environment description identiifers being saved: %@", v11];
  [v3 appendString:v12];

  uint64_t v13 = [(NSMutableArray *)self->_environmentDescriptionIdentifiersBeingRemoved description];
  id v14 = +[NSString stringWithFormat:@" environment description identiifers being removed: %@", v13];
  [v3 appendString:v14];

  return v3;
}

- (NSArray)environmentDescriptionIdentifiersBeingTracked
{
  uint64_t v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_screenshots;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) environmentDescription];
        long long v10 = [v9 identifier];
        [v3 addObject:v10];
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)environmentDescriptionIdentifiersUIIsInterestedIn
{
  return (NSArray *)self->_environmentDescriptionIdentifiersUIIsInterestedIn;
}

- (id)environmentDescriptionIdentifiersGoingAway
{
  return self->_environmentDescriptionIdentifiersGoingAway;
}

- (NSArray)environmentDescriptionIdentifiersInActiveDragSession
{
  return (NSArray *)self->_environmentDescriptionIdentifiersInActiveDragSession;
}

- (NSArray)environmentDescriptionIdentifiersBeingRemoved
{
  return (NSArray *)self->_environmentDescriptionIdentifiersBeingRemoved;
}

- (NSArray)environmentDescriptionIdentifiersBeingSaved
{
  return (NSArray *)self->_environmentDescriptionIdentifiersBeingSaved;
}

+ (id)sharedScreenshotManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014174;
  block[3] = &unk_100099960;
  block[4] = a1;
  if (qword_1000B5758 != -1) {
    dispatch_once(&qword_1000B5758, block);
  }
  v2 = (void *)qword_1000B5750;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageIdentifierUpdateObservers, 0);
  objc_storeStrong((id *)&self->_environmentDescriptionIdentifiersBeingSaved, 0);
  objc_storeStrong((id *)&self->_environmentDescriptionIdentifiersBeingRemoved, 0);
  objc_storeStrong((id *)&self->_environmentDescriptionIdentifiersInActiveDragSession, 0);
  objc_storeStrong((id *)&self->_environmentDescriptionIdentifiersGoingAway, 0);
  objc_storeStrong((id *)&self->_environmentDescriptionIdentifiersUIIsInterestedIn, 0);

  objc_storeStrong((id *)&self->_screenshots, 0);
}

@end