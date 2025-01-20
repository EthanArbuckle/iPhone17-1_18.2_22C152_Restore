@interface SiriPronunciationDataViewController
- (BOOL)_itemAtIndexIsPlaying:(int64_t)a3;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)removedAfterDialogProgresses;
- (CGSize)_cellSizeForWidth:(double)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (Class)footerViewClass;
- (SiriPronunciationDataViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)desiredHeightForFooterView;
- (double)desiredHeightForWidth:(double)a3;
- (id)_cancelCommands;
- (id)_pronunciationItems;
- (id)_selectNoneCommands;
- (id)_selectionStatsForSelectedIndex:(int64_t)a3;
- (id)_selectionStatsForType:(int64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)sashItem;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_cancelButtonTapped:(id)a3;
- (void)_configureCell:(id)a3 forPronunciationIndex:(int64_t)a4;
- (void)_incrementPlayCountForItemAtIndex:(int64_t)a3;
- (void)_resetPlayCounts;
- (void)_setItemAtIndex:(int64_t)a3 isPlaying:(BOOL)a4;
- (void)_tellSiriAgainTapped:(id)a3;
- (void)configureReusableFooterView:(id)a3;
- (void)loadView;
- (void)setSnippet:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SiriPronunciationDataViewController

- (SiriPronunciationDataViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SiriPronunciationDataViewController;
  v4 = [(SiriPronunciationDataViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [v5 siriUILocalizedStringForKey:@"PRONOUNCE_TITLE" table:0];
    [(SiriPronunciationDataViewController *)v4 setTitle:v6];

    -[SiriPronunciationDataViewController setDefaultViewInsets:](v4, "setDefaultViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    [(SiriPronunciationDataViewController *)v4 setWantsConfirmationInsets:0];
  }
  return v4;
}

- (void)setSnippet:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SiriPronunciationDataViewController;
  [(SiriPronunciationDataViewController *)&v9 setSnippet:a3];
  v4 = [(SiriPronunciationDataViewController *)self snippet];
  v5 = [v4 orthography];

  if (v5)
  {
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 siriUILocalizedStringForKey:@"PRONOUNCE_SUBTITLE_QUOTED_ORTHOGRAPHY_FORMAT" table:0];

    objc_super v8 = +[NSString stringWithValidatedFormat:v7, @"“%@”", 0, v5 validFormatSpecifiers error];
    [(SiriPronunciationDataViewController *)self setSubtitle:v8];
  }
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)SiriPronunciationDataViewController;
  [(SiriPronunciationDataViewController *)&v6 loadView];
  v3 = [(SiriPronunciationDataViewController *)self collectionView];
  uint64_t v4 = objc_opt_class();
  v5 = +[SiriPronunciationItemCell reuseIdentifier];
  [v3 registerClass:v4 forCellWithReuseIdentifier:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SiriPronunciationDataViewController;
  [(SiriPronunciationDataViewController *)&v4 viewWillAppear:a3];
  [(SiriPronunciationDataViewController *)self _resetPlayCounts];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SiriPronunciationDataViewController;
  [(SiriPronunciationDataViewController *)&v7 viewWillDisappear:a3];
  if ([(NSMutableDictionary *)self->_playCounts count])
  {
    objc_super v4 = [(SiriPronunciationDataViewController *)self delegate];
    v5 = [(SiriPronunciationDataViewController *)self _selectionStatsForType:1];
    objc_super v8 = v5;
    objc_super v6 = +[NSArray arrayWithObjects:&v8 count:1];
    [v4 siriViewController:self performAceCommands:v6];

    [(SiriPronunciationDataViewController *)self _resetPlayCounts];
  }
}

- (id)_selectNoneCommands
{
  v2 = [(SiriPronunciationDataViewController *)self snippet];
  v3 = [v2 selectNoneCommands];

  return v3;
}

- (id)_cancelCommands
{
  v2 = [(SiriPronunciationDataViewController *)self snippet];
  v3 = [v2 cancelCommands];

  return v3;
}

- (id)_pronunciationItems
{
  v2 = [(SiriPronunciationDataViewController *)self snippet];
  v3 = [v2 pronunciations];

  return v3;
}

- (CGSize)_cellSizeForWidth:(double)a3
{
  +[SiriPronunciationItemCell defaultCellHeight];
  double v5 = v4;
  double v6 = a3;
  result.height = v5;
  result.width = v6;
  return result;
}

- (BOOL)_itemAtIndexIsPlaying:(int64_t)a3
{
  return [(NSMutableIndexSet *)self->_playingIndexes containsIndex:a3];
}

- (void)_setItemAtIndex:(int64_t)a3 isPlaying:(BOOL)a4
{
  playingIndexes = self->_playingIndexes;
  if (a4)
  {
    if (!playingIndexes)
    {
      objc_super v7 = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
      objc_super v8 = self->_playingIndexes;
      self->_playingIndexes = v7;

      playingIndexes = self->_playingIndexes;
    }
    [(NSMutableIndexSet *)playingIndexes addIndex:a3];
    [(SiriPronunciationDataViewController *)self _incrementPlayCountForItemAtIndex:a3];
  }
  else
  {
    [(NSMutableIndexSet *)playingIndexes removeIndex:a3];
  }
}

- (BOOL)removedAfterDialogProgresses
{
  return 1;
}

- (id)sashItem
{
  id v2 = [objc_alloc((Class)SiriUISashItem) initWithApplicationBundleIdentifier:@"com.apple.MobileAddressBook"];

  return v2;
}

- (void)_incrementPlayCountForItemAtIndex:(int64_t)a3
{
  playCounts = self->_playCounts;
  double v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:");
  objc_super v7 = [(NSMutableDictionary *)playCounts objectForKey:v6];
  objc_super v8 = (char *)[v7 integerValue];

  objc_super v9 = self->_playCounts;
  id v11 = +[NSNumber numberWithInteger:v8 + 1];
  v10 = +[NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)v9 setObject:v11 forKey:v10];
}

- (void)_resetPlayCounts
{
  self->_playCounts = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);

  _objc_release_x1();
}

- (id)_selectionStatsForType:(int64_t)a3
{
  id v5 = objc_alloc_init((Class)SASTTSSelectionStatistics);
  double v6 = [(SiriPronunciationDataViewController *)self snippet];
  objc_super v7 = [v6 interactionId];
  [v5 setInteractionId:v7];

  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = objc_alloc_init((Class)NSMutableArray);
  playCounts = self->_playCounts;
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_3F8C;
  v18 = &unk_184C8;
  id v11 = v8;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  [(NSMutableDictionary *)playCounts enumerateKeysAndObjectsUsingBlock:&v15];
  objc_msgSend(v5, "setListenedItems:", v11, v15, v16, v17, v18);
  [v5 setTimesListened:v12];
  if ((unint64_t)a3 > 2) {
    id v13 = 0;
  }
  else {
    id v13 = *(id *)*(&off_18560 + a3);
  }
  [v5 setCompletionType:v13];

  return v5;
}

- (id)_selectionStatsForSelectedIndex:(int64_t)a3
{
  double v4 = [(SiriPronunciationDataViewController *)self _selectionStatsForType:0];
  [v4 setSelectedItemIndex:a3];

  return v4;
}

- (void)_configureCell:(id)a3 forPronunciationIndex:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = [(SiriPronunciationDataViewController *)self _pronunciationItems];
  objc_msgSend(v6, "setShowingPlaying:", -[SiriPronunciationDataViewController _itemAtIndexIsPlaying:](self, "_itemAtIndexIsPlaying:", a4));
  objc_initWeak(location, self);
  objc_initWeak(&from, v6);
  id v8 = [v7 objectAtIndex:a4];
  id v9 = [v8 tts];
  v10 = [v8 title];
  [v6 setPlayTitle:v10];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_4310;
  v18[3] = &unk_18518;
  objc_copyWeak(&v20, &from);
  objc_copyWeak(v21, location);
  v21[1] = (id)a4;
  id v11 = v9;
  id v19 = v11;
  [v6 setPlayHandler:v18];
  id v12 = +[NSBundle bundleForClass:objc_opt_class()];
  id v13 = [v12 siriUILocalizedStringForKey:@"SELECT_BUTTON_TITLE" table:0];
  [v6 setConfirmTitle:v13];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_45E8;
  v15[3] = &unk_18540;
  objc_copyWeak(v17, location);
  v15[4] = self;
  v17[1] = (id)a4;
  id v14 = v8;
  id v16 = v14;
  [v6 setConfirmHandler:v15];
  objc_msgSend(v6, "setKeylineType:", (char *)objc_msgSend(v7, "count") - 1 != (unsigned char *)a4);

  objc_destroyWeak(v17);
  objc_destroyWeak(v21);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&from);
  objc_destroyWeak(location);
}

- (double)desiredHeightForWidth:(double)a3
{
  id v5 = [(SiriPronunciationDataViewController *)self _pronunciationItems];
  double v6 = (double)(unint64_t)[v5 count];
  [(SiriPronunciationDataViewController *)self _cellSizeForWidth:a3];
  double v8 = v7 * v6;

  return v8;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  double v4 = [(SiriPronunciationDataViewController *)self _pronunciationItems];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if (((unint64_t)[v7 section] & 0x8000000000000000) != 0
    || (id v9 = [v7 section],
        [(SiriPronunciationDataViewController *)self _pronunciationItems],
        v10 = objc_claimAutoreleasedReturnValue(),
        id v11 = [v10 count],
        v10,
        v9 >= v11))
  {
    id v12 = +[NSAssertionHandler currentHandler];
    id v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, self, @"SiriPronunciationDataViewController.m", 231, @"%@ asked to provide a cell for an invalid section %zd", v14, objc_msgSend(v7, "section") object file lineNumber description];
  }
  id v15 = [v7 item];
  id v16 = +[SiriPronunciationItemCell reuseIdentifier];
  v17 = [v8 dequeueReusableCellWithReuseIdentifier:v16 forIndexPath:v7];

  [(SiriPronunciationDataViewController *)self _configureCell:v17 forPronunciationIndex:v15];

  return v17;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v6 = [(SiriPronunciationDataViewController *)self delegate];
  [v6 siriViewControllerExpectedWidth:self];
  -[SiriPronunciationDataViewController _cellSizeForWidth:](self, "_cellSizeForWidth:");
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (Class)footerViewClass
{
  id v2 = [(SiriPronunciationDataViewController *)self _selectNoneCommands];
  id v3 = [v2 count];
  if (v3) {
    id v3 = (id)objc_opt_class();
  }
  double v4 = (objc_class *)v3;

  return v4;
}

- (void)configureReusableFooterView:(id)a3
{
  id v4 = a3;
  [v4 prepareForReuse];
  id v10 = [v4 rightButton];
  id v5 = [(SiriPronunciationDataViewController *)self snippet];
  double v6 = [v5 selectNoneText];
  [v10 setTitle:v6 forState:0];

  [v10 addTarget:self action:"_tellSiriAgainTapped:" forControlEvents:64];
  double v7 = [v4 leftButton];

  double v8 = +[NSBundle bundleForClass:objc_opt_class()];
  double v9 = [v8 siriUILocalizedStringForKey:@"CANCEL" table:0];
  [v7 setTitle:v9 forState:0];

  [v7 addTarget:self action:"_cancelButtonTapped:" forControlEvents:64];
}

- (double)desiredHeightForFooterView
{
  +[SiriUITwoButtonFooterView defaultHeight];
  return result;
}

- (void)_tellSiriAgainTapped:(id)a3
{
  id v4 = [(SiriPronunciationDataViewController *)self delegate];
  id v5 = [(SiriPronunciationDataViewController *)self _selectionStatsForType:2];
  double v9 = v5;
  double v6 = +[NSArray arrayWithObjects:&v9 count:1];
  [v4 siriViewController:self performAceCommands:v6];

  double v7 = [(SiriPronunciationDataViewController *)self delegate];
  double v8 = [(SiriPronunciationDataViewController *)self _selectNoneCommands];
  [v7 siriViewController:self performAceCommands:v8];

  [(SiriPronunciationDataViewController *)self _resetPlayCounts];
}

- (void)_cancelButtonTapped:(id)a3
{
  id v4 = [(SiriPronunciationDataViewController *)self delegate];
  id v5 = [(SiriPronunciationDataViewController *)self _selectionStatsForType:1];
  double v9 = v5;
  double v6 = +[NSArray arrayWithObjects:&v9 count:1];
  [v4 siriViewController:self performAceCommands:v6];

  double v7 = [(SiriPronunciationDataViewController *)self delegate];
  double v8 = [(SiriPronunciationDataViewController *)self _cancelCommands];
  [v7 siriViewController:self performAceCommands:v8];

  [(SiriPronunciationDataViewController *)self _resetPlayCounts];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playCounts, 0);
  objc_storeStrong((id *)&self->_playingIndexes, 0);

  objc_storeStrong((id *)&self->_numberFormatter, 0);
}

@end