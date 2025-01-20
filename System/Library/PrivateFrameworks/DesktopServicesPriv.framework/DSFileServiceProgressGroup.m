@interface DSFileServiceProgressGroup
- (BOOL)hasOutstandingChildren;
- (DSFileServiceProgressGroup)initWithUUID:(id)a3 operationKind:(id)a4 groupCount:(int64_t)a5 publishingURL:(id)a6 firstChildName:(id)a7 dateStarted:(id)a8 utType:(id)a9;
- (NSDate)dateStarted;
- (NSMutableDictionary)childProgresses;
- (NSProgress)progress;
- (NSString)firstChildName;
- (NSURL)publishingURL;
- (NSUUID)uuid;
- (id)_timeRemainingEstimateWithTimeElapsed:(double)a3 fractionDone:(double)a4;
- (void)addChildProgress:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)publish;
- (void)removeChildProgress:(id)a3;
- (void)setChildProgresses:(id)a3;
- (void)setProgress:(id)a3;
- (void)setPublishingURL:(id)a3;
- (void)setUuid:(id)a3;
- (void)unpublish;
- (void)updateProgressLocalizedStrings;
@end

@implementation DSFileServiceProgressGroup

- (DSFileServiceProgressGroup)initWithUUID:(id)a3 operationKind:(id)a4 groupCount:(int64_t)a5 publishingURL:(id)a6 firstChildName:(id)a7 dateStarted:(id)a8 utType:(id)a9
{
  id v25 = a3;
  id v26 = a4;
  id v16 = a6;
  id v24 = a7;
  id v27 = a8;
  id v28 = a9;
  v36.receiver = self;
  v36.super_class = (Class)DSFileServiceProgressGroup;
  v17 = [(DSFileServiceProgressGroup *)&v36 init];
  if (v17)
  {
    v37[0] = NSProgressFileOperationKindKey;
    v37[1] = NSProgressFileURLKey;
    v38[0] = v26;
    v38[1] = v16;
    v37[2] = NSProgressUseItemDescriptionKey;
    v37[3] = @"DSFileOperationUUID";
    v38[2] = &__kCFBooleanTrue;
    v38[3] = v25;
    v37[4] = @"DSFileOperationDateStarted";
    v37[5] = @"DSFileOperationIconUTTypeIdentifier";
    v38[4] = v27;
    v38[5] = v28;
    v18 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:6];
    id v23 = [v18 mutableCopy];

    if (a5 <= 1 && [v24 length]) {
      [v23 setObject:v24 forKeyedSubscript:NSProgressFileDisplayNameKey];
    }
    id v19 = [objc_alloc((Class)NSProgress) initWithParent:0 userInfo:v23];
    [v19 setFileURL:v16];
    [v19 setKind:NSProgressKindFile];
    [v19 setTotalUnitCount:-1];
    [v19 setCompletedUnitCount:0];
    [v19 setFileTotalCount:&off_100062920];
    [v19 setFileCompletedCount:&off_100062920];
    objc_initWeak(&location, v17);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10004DA60;
    v33[3] = &unk_100062008;
    objc_copyWeak(&v34, &location);
    [v19 setCancellationHandler:v33];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10004DBBC;
    v31[3] = &unk_100062008;
    objc_copyWeak(&v32, &location);
    [v19 setResumingHandler:v31];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10004DD18;
    v29[3] = &unk_100062008;
    objc_copyWeak(&v30, &location);
    [v19 setPausingHandler:v29];
    objc_storeStrong((id *)&v17->_uuid, a3);
    objc_storeStrong((id *)&v17->_progress, v19);
    objc_storeStrong((id *)&v17->_dateStarted, a8);
    objc_storeStrong((id *)&v17->_firstChildName, a7);
    objc_storeStrong((id *)&v17->_publishingURL, a6);
    v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    childProgresses = v17->_childProgresses;
    v17->_childProgresses = v20;

    [(DSFileServiceProgressGroup *)v17 updateProgressLocalizedStrings];
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  return v17;
}

- (void)updateProgressLocalizedStrings
{
  [(NSProgress *)self->_progress setLocalizedDescription:0];
  id v3 = [(NSProgress *)self->_progress localizedDescription];
  -[NSProgress setLocalizedDescription:](self->_progress, "setLocalizedDescription:");
}

- (void)dealloc
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(DSFileServiceProgressGroup *)self childProgresses];
  v4 = [v3 allValues];

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v9 = NSStringFromSelector("completedUnitCount");
        [v8 removeObserver:self forKeyPath:v9 context:off_1000659F8];
      }
      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)DSFileServiceProgressGroup;
  [(DSFileServiceProgressGroup *)&v10 dealloc];
}

- (void)addChildProgress:(id)a3
{
  id v4 = a3;
  if ((uint64_t)[v4 totalUnitCount] >= 1)
  {
    id v5 = [(DSFileServiceProgressGroup *)self progress];
    unint64_t v6 = (unint64_t)[v5 totalUnitCount];

    if ((v6 & 0x8000000000000000) != 0)
    {
      v7 = [(DSFileServiceProgressGroup *)self progress];
      [v7 setTotalUnitCount:0];
    }
  }
  v8 = [(DSFileServiceProgressGroup *)self progress];
  objc_msgSend(v8, "setTotalUnitCount:", (char *)objc_msgSend(v4, "totalUnitCount") + (void)objc_msgSend(v8, "totalUnitCount"));

  objc_initWeak(&location, self);
  v9 = [v4 cancellationHandler];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10004E3C0;
  v17[3] = &unk_100062030;
  v17[4] = v9;
  objc_copyWeak(&v18, &location);
  [v4 setCancellationHandler:v17];
  objc_super v10 = [v4 resumingHandler];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004E47C;
  v15[3] = &unk_100062030;
  v15[4] = v10;
  objc_copyWeak(&v16, &location);
  [v4 setResumingHandler:v15];
  long long v11 = [v4 pausingHandler];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004E538;
  v13[3] = &unk_100062030;
  v13[4] = v11;
  objc_copyWeak(&v14, &location);
  [v4 setPausingHandler:v13];
  long long v12 = NSStringFromSelector("completedUnitCount");
  [v4 addObserver:self forKeyPath:v12 options:3 context:off_1000659F8];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)removeChildProgress:(id)a3
{
  id v4 = [a3 userInfo];
  id v12 = [v4 objectForKeyedSubscript:@"DSFileOperationChildProgressUUID"];

  id v5 = [(DSFileServiceProgressGroup *)self childProgresses];
  unint64_t v6 = [v5 objectForKeyedSubscript:v12];

  if (v6)
  {
    v7 = [(DSFileServiceProgressGroup *)self childProgresses];
    [v7 setObject:0 forKeyedSubscript:v12];

    v8 = [(DSFileServiceProgressGroup *)self progress];
    v9 = [v8 fileCompletedCount];
    objc_super v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v9 integerValue] + 1);
    long long v11 = [(DSFileServiceProgressGroup *)self progress];
    [v11 setFileCompletedCount:v10];
  }
}

- (BOOL)hasOutstandingChildren
{
  v2 = [(DSFileServiceProgressGroup *)self childProgresses];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)_timeRemainingEstimateWithTimeElapsed:(double)a3 fractionDone:(double)a4
{
  if (a3 == 0.0
    || (double v6 = a4 / a3, v6 == 0.0)
    || (unint64_t)(COERCE__INT64(fabs((1.0 - a4) / v6)) - 0x10000000000000) >> 53 > 0x3FE)
  {
    v7 = 0;
  }
  else
  {
    v7 = +[NSNumber numberWithDouble:v4];
  }
  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_1000659F8 != a6) {
    goto LABEL_9;
  }
  long long v13 = NSStringFromSelector("completedUnitCount");
  if (![v10 isEqualToString:v13]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    goto LABEL_9;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_9:
    v25.receiver = self;
    v25.super_class = (Class)DSFileServiceProgressGroup;
    [(DSFileServiceProgressGroup *)&v25 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
    goto LABEL_10;
  }
  v15 = [v12 objectForKeyedSubscript:NSKeyValueChangeOldKey];
  id v16 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
  v17 = [(DSFileServiceProgressGroup *)self progress];
  objc_msgSend(v17, "setCompletedUnitCount:", (char *)objc_msgSend(v17, "completedUnitCount")+ (unsigned char *)objc_msgSend(v16, "integerValue")- (unsigned char *)objc_msgSend(v15, "integerValue"));

  id v18 = [(DSFileServiceProgressGroup *)self dateStarted];
  [v18 timeIntervalSinceNow];
  double v20 = v19;
  v21 = [(DSFileServiceProgressGroup *)self progress];
  [v21 fractionCompleted];
  id v23 = [(DSFileServiceProgressGroup *)self _timeRemainingEstimateWithTimeElapsed:-v20 fractionDone:v22];

  if (v23)
  {
    id v24 = [(DSFileServiceProgressGroup *)self progress];
    [v24 setEstimatedTimeRemaining:v23];
  }
LABEL_10:
}

- (void)publish
{
  id v2 = [(DSFileServiceProgressGroup *)self progress];
  [v2 publish];
}

- (void)unpublish
{
  id v2 = [(DSFileServiceProgressGroup *)self progress];
  [v2 unpublish];
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (NSURL)publishingURL
{
  return self->_publishingURL;
}

- (void)setPublishingURL:(id)a3
{
}

- (NSMutableDictionary)childProgresses
{
  return self->_childProgresses;
}

- (void)setChildProgresses:(id)a3
{
}

- (NSDate)dateStarted
{
  return self->_dateStarted;
}

- (NSString)firstChildName
{
  return self->_firstChildName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstChildName, 0);
  objc_storeStrong((id *)&self->_dateStarted, 0);
  objc_storeStrong((id *)&self->_childProgresses, 0);
  objc_storeStrong((id *)&self->_publishingURL, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end