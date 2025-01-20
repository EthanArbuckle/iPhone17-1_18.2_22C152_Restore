@interface VOTNameSearcherAppSource
- (VOTNameSearcherAppSource)initWithLaunchContext:(int)a3;
- (double)selectSpeechDelay;
- (id)messageForMatchingItemsCount:(int64_t)a3;
- (id)messageForNoMatchingItems;
- (id)messageForSelectingItem:(id)a3;
- (int)launchContext;
- (void)retrieveAllEntries:(id)a3;
- (void)setLaunchContext:(int)a3;
@end

@implementation VOTNameSearcherAppSource

- (VOTNameSearcherAppSource)initWithLaunchContext:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)VOTNameSearcherAppSource;
  v4 = [(VOTNameSearcherAppSource *)&v8 init];
  v5 = v4;
  if (v4)
  {
    [(VOTNameSearcherAppSource *)v4 setLaunchContext:v3];
    v6 = v5;
  }

  return v5;
}

- (void)retrieveAllEntries:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  if (![(VOTNameSearcherAppSource *)self launchContext])
  {
    v6 = +[VOTElement springBoardApplication];
    v7 = [v6 launchableApps];
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_10003D930;
    v18 = &unk_1001B3F50;
    objc_super v8 = &v19;
    id v19 = v5;
    v9 = &v15;
    goto LABEL_5;
  }
  if ([(VOTNameSearcherAppSource *)self launchContext] == 1)
  {
    v6 = +[VOTElement springBoardApplication];
    v7 = [v6 appSwitcherApps];
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_10003D9BC;
    v13 = &unk_1001B3F50;
    objc_super v8 = &v14;
    id v14 = v5;
    v9 = &v10;
LABEL_5:
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19);
  }
  [v5 sortUsingComparator:&stru_1001B3F90];
  [v4 didRetrieveAllEntries:v5];
}

- (id)messageForMatchingItemsCount:(int64_t)a3
{
  id v4 = sub_100051804(off_1001EA9E8, @"handwrite.num.matching.apps.count", 0);
  v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, a3);

  return v5;
}

- (id)messageForNoMatchingItems
{
  return sub_100051804(off_1001EA9E8, @"handwrite.no.apps", 0);
}

- (id)messageForSelectingItem:(id)a3
{
  uint64_t v3 = off_1001EA9E8;
  id v4 = a3;
  v5 = sub_100051804(v3, @"handwrite.launch.app", 0);
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v4);

  return v6;
}

- (double)selectSpeechDelay
{
  return 0.5;
}

- (int)launchContext
{
  return self->_launchContext;
}

- (void)setLaunchContext:(int)a3
{
  self->_launchContext = a3;
}

@end