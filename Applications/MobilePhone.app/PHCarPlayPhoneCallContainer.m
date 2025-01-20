@interface PHCarPlayPhoneCallContainer
- (BOOL)isMerging;
- (BOOL)shouldMerge;
- (BOOL)shouldReloadCellsWithNumberOfCells:(unint64_t)a3;
- (MPCarPlayPhoneCallContainerDataSource)dataSource;
- (MPCarPlayPhoneCallContainerDelegate)delegate;
- (NSMutableArray)visibleCells;
- (PHCarPlayPhoneCallContainer)initWithFrame:(CGRect)a3;
- (id)_reloadQueue;
- (id)constraintToFillContainerWithLeftOfCell:(id)a3;
- (id)constraintToFillContainerWithRightOfCell:(id)a3;
- (void)addConstraintsForNewCell:(id)a3;
- (void)addRelationForLeftOfCell:(id)a3;
- (void)addRelationForRightOfCell:(id)a3;
- (void)addRelationForWidthOfCell:(id)a3;
- (void)animateLayoutOfViewWithCompletionBlock:(id)a3;
- (void)createVisibleCells:(unint64_t)a3;
- (void)dealloc;
- (void)mergeAllCellConstraints;
- (void)mergeVisibleCells;
- (void)phoneCallViewCellTapped:(id)a3;
- (void)reloadData;
- (void)reloadDataAnimated:(BOOL)a3;
- (void)removeAllConstraintsForCell:(id)a3;
- (void)removeVisibleCells:(unint64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMerging:(BOOL)a3;
- (void)setNeedsMerge;
- (void)setShouldMerge:(BOOL)a3;
- (void)setVisibleCells:(id)a3;
- (void)updateAllCellConstraints;
- (void)updateCell:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5;
- (void)updateLayoutAnimated:(BOOL)a3;
- (void)updateNumberOfCellsWithNewValue:(unint64_t)a3 animated:(BOOL)a4;
@end

@implementation PHCarPlayPhoneCallContainer

- (id)_reloadQueue
{
  if (_reloadQueue_onceToken != -1) {
    dispatch_once(&_reloadQueue_onceToken, &__block_literal_global_31);
  }
  v2 = (void *)_reloadQueue___MPCarPlayPhoneCallContainer_ReloadQueue;

  return v2;
}

void __43__PHCarPlayPhoneCallContainer__reloadQueue__block_invoke(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("MPCarPlayPhoneCallContainer", 0);
  uint64_t v2 = _reloadQueue___MPCarPlayPhoneCallContainer_ReloadQueue;
  _reloadQueue___MPCarPlayPhoneCallContainer_ReloadQueue = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

- (PHCarPlayPhoneCallContainer)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PHCarPlayPhoneCallContainer;
  v3 = -[PHCarPlayPhoneCallContainer initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PHCarPlayPhoneCallContainer *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v5 = +[NSMutableArray array];
    visibleCells = v4->_visibleCells;
    v4->_visibleCells = (NSMutableArray *)v5;

    v4->_shouldMerge = 0;
  }
  return v4;
}

- (void)dealloc
{
  self->_dataSource = 0;
  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)PHCarPlayPhoneCallContainer;
  [(PHCarPlayPhoneCallContainer *)&v2 dealloc];
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = (MPCarPlayPhoneCallContainerDataSource *)a3;
  [(PHCarPlayPhoneCallContainer *)self reloadData];
}

- (void)reloadData
{
}

- (BOOL)shouldReloadCellsWithNumberOfCells:(unint64_t)a3
{
  return a3 != 0;
}

- (void)reloadDataAnimated:(BOOL)a3
{
  uint64_t v5 = [(PHCarPlayPhoneCallContainer *)self _reloadQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __50__PHCarPlayPhoneCallContainer_reloadDataAnimated___block_invoke;
  v6[3] = &unk_10027C838;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

void __50__PHCarPlayPhoneCallContainer_reloadDataAnimated___block_invoke(uint64_t a1)
{
  v1[0] = _NSConcreteStackBlock;
  v1[1] = 3221225472;
  v1[2] = __50__PHCarPlayPhoneCallContainer_reloadDataAnimated___block_invoke_2;
  v1[3] = &unk_10027C838;
  v1[4] = *(void *)(a1 + 32);
  char v2 = *(unsigned char *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v1);
}

void __50__PHCarPlayPhoneCallContainer_reloadDataAnimated___block_invoke_2(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) dataSource];
  id v3 = [v2 numberOfViewCellsForPhoneCallContainer:*(void *)(a1 + 32)];

  if ([*(id *)(a1 + 32) shouldReloadCellsWithNumberOfCells:v3])
  {
    v4 = [*(id *)(a1 + 32) visibleCells];
    id v5 = [v4 count];

    if (v3 != v5) {
      [*(id *)(a1 + 32) updateNumberOfCellsWithNewValue:v3 animated:*(unsigned __int8 *)(a1 + 40)];
    }
    v6 = *(unsigned char **)(a1 + 32);
    if (!v6[8])
    {
      BOOL v7 = [v6 visibleCells];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = __50__PHCarPlayPhoneCallContainer_reloadDataAnimated___block_invoke_3;
      v8[3] = &unk_10027E568;
      v8[4] = *(void *)(a1 + 32);
      char v9 = *(unsigned char *)(a1 + 40);
      [v7 enumerateObjectsUsingBlock:v8];
    }
  }
}

id __50__PHCarPlayPhoneCallContainer_reloadDataAnimated___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) updateCell:a2 atIndex:a3 animated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)updateCell:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __59__PHCarPlayPhoneCallContainer_updateCell_atIndex_animated___block_invoke;
  v9[3] = &unk_10027E590;
  id v10 = a3;
  unint64_t v11 = a4;
  v9[4] = self;
  BOOL v12 = a5;
  id v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

void __59__PHCarPlayPhoneCallContainer_updateCell_atIndex_animated___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) dataSource];
  id v3 = [v2 phoneCallContainer:*(void *)(a1 + 32) titleForViewCellAtIndex:*(void *)(a1 + 48)];

  v4 = [*(id *)(a1 + 32) dataSource];
  id v5 = [v4 phoneCallContainer:*(void *)(a1 + 32) subtitleForViewCellAtIndex:*(void *)(a1 + 48)];

  v6 = [*(id *)(a1 + 32) dataSource];
  BOOL v7 = [v6 phoneCallContainer:*(void *)(a1 + 32) subtitleColorForViewCellAtIndex:*(void *)(a1 + 48)];

  id v8 = [*(id *)(a1 + 32) dataSource];
  char v9 = [v8 phoneCallContainer:*(void *)(a1 + 32) localizedSenderIdentityForViewCellAtIndex:*(void *)(a1 + 48)];

  id v10 = [*(id *)(a1 + 32) visibleCells];
  if ([v10 count] == (id)1)
  {
    unint64_t v11 = [*(id *)(a1 + 32) dataSource];
    BOOL v12 = [v11 phoneCallContainer:*(void *)(a1 + 32) avatarViewControllerForViewCellAtIndex:*(void *)(a1 + 48)];
  }
  else
  {
    BOOL v12 = 0;
  }

  v13 = [*(id *)(a1 + 32) dataSource];
  id v14 = [v13 phoneCallContainer:*(void *)(a1 + 32) cellIsDimmedAtIndex:*(void *)(a1 + 48)];

  if (v3 || v5 || v9)
  {
    [*(id *)(a1 + 40) setDimmed:v14 animated:1];
    [*(id *)(a1 + 40) setTitle:v3 subtitle:v5 subtitleColor:v7 localizedSenderIdentityTitle:v9 animated:*(unsigned __int8 *)(a1 + 56)];
  }
  v15 = [*(id *)(a1 + 40) avatarViewController];
  v16 = [v15 contacts];
  v17 = [v12 contacts];
  unsigned __int8 v18 = [v16 isEqualToArray:v17];

  if ((v18 & 1) == 0)
  {
    v19 = PHDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [v12 contacts];
      int v21 = 138412290;
      v22 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Updating CarPlay InCallService AvatarViewController with contacts: %@", (uint8_t *)&v21, 0xCu);
    }
    [*(id *)(a1 + 40) setAvatarViewController:v12];
  }
}

- (void)setNeedsMerge
{
  self->_shouldMerge = 1;
}

- (void)updateNumberOfCellsWithNewValue:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = [(PHCarPlayPhoneCallContainer *)self visibleCells];
  id v8 = [v7 count];

  if ((unint64_t)v8 < a3)
  {
    char v9 = [(PHCarPlayPhoneCallContainer *)self visibleCells];
    unint64_t v10 = a3 - (void)[v9 count];

    [(PHCarPlayPhoneCallContainer *)self createVisibleCells:v10];
LABEL_8:
    [(PHCarPlayPhoneCallContainer *)self updateLayoutAnimated:v4];
    return;
  }
  if (!self->_shouldMerge)
  {
    unint64_t v11 = [(PHCarPlayPhoneCallContainer *)self visibleCells];
    BOOL v12 = (char *)[v11 count] - a3;

    [(PHCarPlayPhoneCallContainer *)self removeVisibleCells:v12];
    goto LABEL_8;
  }

  [(PHCarPlayPhoneCallContainer *)self mergeVisibleCells];
}

- (void)updateLayoutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(PHCarPlayPhoneCallContainer *)self layoutIfNeeded];
  [(PHCarPlayPhoneCallContainer *)self updateAllCellConstraints];
  [(PHCarPlayPhoneCallContainer *)self setNeedsUpdateConstraints];
  if (v3)
  {
    [(PHCarPlayPhoneCallContainer *)self animateLayoutOfViewWithCompletionBlock:0];
  }
}

- (void)animateLayoutOfViewWithCompletionBlock:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __70__PHCarPlayPhoneCallContainer_animateLayoutOfViewWithCompletionBlock___block_invoke;
  v3[3] = &unk_10027C670;
  v3[4] = self;
  +[UIView animateWithDuration:133 delay:v3 options:a3 animations:0.550000012 completion:0.0];
}

id __70__PHCarPlayPhoneCallContainer_animateLayoutOfViewWithCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  char v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void)phoneCallViewCellTapped:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [(PHCarPlayPhoneCallContainer *)self delegate];
  if (v4)
  {
    id v5 = (void *)v4;
    v6 = [(PHCarPlayPhoneCallContainer *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(PHCarPlayPhoneCallContainer *)self delegate];
      char v9 = [(PHCarPlayPhoneCallContainer *)self visibleCells];
      [v8 phoneCallContainer:self phoneCallViewTappedAtIndex:[v9 indexOfObject:v10]];
    }
  }
}

- (void)mergeVisibleCells
{
  if (![(PHCarPlayPhoneCallContainer *)self isMerging])
  {
    self->_merging = 1;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v3 = [(PHCarPlayPhoneCallContainer *)self visibleCells];
    id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        char v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          [(PHCarPlayPhoneCallContainer *)self updateCell:*(void *)(*((void *)&v10 + 1) + 8 * (void)v7) atIndex:0 animated:1];
          char v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }

    [(PHCarPlayPhoneCallContainer *)self layoutIfNeeded];
    [(PHCarPlayPhoneCallContainer *)self mergeAllCellConstraints];
    [(PHCarPlayPhoneCallContainer *)self setNeedsUpdateConstraints];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __48__PHCarPlayPhoneCallContainer_mergeVisibleCells__block_invoke;
    v9[3] = &unk_10027D268;
    v9[4] = self;
    id v8 = objc_retainBlock(v9);
    [(PHCarPlayPhoneCallContainer *)self animateLayoutOfViewWithCompletionBlock:v8];
  }
}

void __48__PHCarPlayPhoneCallContainer_mergeVisibleCells__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
  char v2 = [*(id *)(a1 + 32) visibleCells];
  BOOL v3 = (char *)[v2 count] - 1;

  id v4 = [*(id *)(a1 + 32) visibleCells];
  [v4 subarrayWithRange:1, v3];
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [v6 makeObjectsPerformSelector:"removeFromSuperview"];
  id v5 = [*(id *)(a1 + 32) visibleCells];
  [v5 removeObjectsInArray:v6];
}

- (void)createVisibleCells:(unint64_t)a3
{
  if (a3)
  {
    unint64_t v3 = a3;
    do
    {
      id v5 = [PHCarPlayPhoneCallViewCell alloc];
      [(PHCarPlayPhoneCallContainer *)self bounds];
      id v6 = -[PHCarPlayPhoneCallViewCell initWithFrame:](v5, "initWithFrame:");
      [(PHCarPlayPhoneCallViewCell *)v6 addTarget:self action:"phoneCallViewCellTapped:" forControlEvents:64];
      [(PHCarPlayPhoneCallContainer *)self addSubview:v6];
      char v7 = [(PHCarPlayPhoneCallContainer *)self visibleCells];
      [v7 addObject:v6];

      [(PHCarPlayPhoneCallContainer *)self addConstraintsForNewCell:v6];
      --v3;
    }
    while (v3);
  }
}

- (void)removeVisibleCells:(unint64_t)a3
{
  id v5 = [(PHCarPlayPhoneCallContainer *)self visibleCells];
  id v6 = (char *)[v5 count] - a3;

  char v7 = [(PHCarPlayPhoneCallContainer *)self visibleCells];
  id v8 = [v7 subarrayWithRange:v6, a3];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __50__PHCarPlayPhoneCallContainer_removeVisibleCells___block_invoke;
  v9[3] = &unk_10027E5B8;
  v9[4] = self;
  [v8 enumerateObjectsUsingBlock:v9];
}

void __50__PHCarPlayPhoneCallContainer_removeVisibleCells___block_invoke(uint64_t a1, void *a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __50__PHCarPlayPhoneCallContainer_removeVisibleCells___block_invoke_2;
  block[3] = &unk_10027C670;
  id v6 = a2;
  id v3 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  id v4 = [*(id *)(a1 + 32) visibleCells];
  [v4 removeObject:v3];
}

id __50__PHCarPlayPhoneCallContainer_removeVisibleCells___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)removeAllConstraintsForCell:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(PHCarPlayPhoneCallContainer *)self constraints];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 firstItem];
        if ((id)v12 == v4)
        {
        }
        else
        {
          long long v13 = (void *)v12;
          id v14 = [v11 secondItem];

          if (v14 != v4) {
            continue;
          }
        }
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [(PHCarPlayPhoneCallContainer *)self removeConstraints:v5];
}

- (void)addConstraintsForNewCell:(id)a3
{
  id v4 = a3;
  id v5 = [v4 centerYAnchor];
  id v6 = [(PHCarPlayPhoneCallContainer *)self centerYAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];

  LODWORD(v8) = 1144750080;
  [v7 setPriority:v8];
  uint64_t v9 = [v4 topAnchor];
  long long v10 = [(PHCarPlayPhoneCallContainer *)self topAnchor];
  long long v11 = [v9 constraintGreaterThanOrEqualToAnchor:v10];

  LODWORD(v12) = 1148846080;
  [v11 setPriority:v12];
  long long v13 = [(PHCarPlayPhoneCallContainer *)self constraintToFillContainerWithLeftOfCell:v4];
  [v4 setContainerSpecificLeftConstraint:v13];

  id v14 = [(PHCarPlayPhoneCallContainer *)self constraintToFillContainerWithRightOfCell:v4];
  [v4 setContainerSpecificRightConstraint:v14];

  v18[0] = v7;
  v18[1] = v11;
  long long v15 = [v4 containerSpecificLeftConstraint];
  v18[2] = v15;
  long long v16 = [v4 containerSpecificRightConstraint];
  v18[3] = v16;
  long long v17 = +[NSArray arrayWithObjects:v18 count:4];
  [(PHCarPlayPhoneCallContainer *)self addConstraints:v17];

  [(PHCarPlayPhoneCallContainer *)self addRelationForWidthOfCell:v4];
}

- (void)mergeAllCellConstraints
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(PHCarPlayPhoneCallContainer *)self visibleCells];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        [(PHCarPlayPhoneCallContainer *)self removeAllConstraintsForCell:v8];
        [(PHCarPlayPhoneCallContainer *)self addConstraintsForNewCell:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)updateAllCellConstraints
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [(PHCarPlayPhoneCallContainer *)self visibleCells];
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v9 = [v8 containerSpecificRightConstraint];

        if (v9)
        {
          long long v10 = [v8 containerSpecificRightConstraint];
          [(PHCarPlayPhoneCallContainer *)self removeConstraint:v10];
        }
        long long v11 = [v8 containerSpecificLeftConstraint];

        if (v11)
        {
          long long v12 = [v8 containerSpecificLeftConstraint];
          [(PHCarPlayPhoneCallContainer *)self removeConstraint:v12];
        }
        [(PHCarPlayPhoneCallContainer *)self addRelationForLeftOfCell:v8];
        [(PHCarPlayPhoneCallContainer *)self addRelationForRightOfCell:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)addRelationForWidthOfCell:(id)a3
{
  id v9 = a3;
  id v4 = [(PHCarPlayPhoneCallContainer *)self visibleCells];
  if ((unint64_t)[v4 count] >= 2)
  {
    id v5 = [(PHCarPlayPhoneCallContainer *)self visibleCells];
    id v6 = [v5 indexOfObject:v9];

    if (!v6) {
      goto LABEL_5;
    }
    id v4 = [(PHCarPlayPhoneCallContainer *)self visibleCells];
    id v7 = [v4 firstObject];
    uint64_t v8 = +[NSLayoutConstraint constraintWithItem:v9 attribute:7 relatedBy:0 toItem:v7 attribute:7 multiplier:1.0 constant:0.0];
    [(PHCarPlayPhoneCallContainer *)self addConstraint:v8];
  }
LABEL_5:
}

- (void)addRelationForRightOfCell:(id)a3
{
  id v11 = a3;
  id v4 = [(PHCarPlayPhoneCallContainer *)self visibleCells];
  id v5 = (char *)[v4 count] - 1;

  id v6 = [(PHCarPlayPhoneCallContainer *)self visibleCells];
  id v7 = (char *)[v6 indexOfObject:v11];

  if (v7 == v5)
  {
    uint64_t v8 = [(PHCarPlayPhoneCallContainer *)self constraintToFillContainerWithRightOfCell:v11];
  }
  else
  {
    id v9 = [(PHCarPlayPhoneCallContainer *)self visibleCells];
    long long v10 = [v9 objectAtIndexedSubscript:v7 + 1];
    uint64_t v8 = +[NSLayoutConstraint constraintWithItem:v11 attribute:2 relatedBy:0 toItem:v10 attribute:1 multiplier:1.0 constant:-12.0];
  }
  [v11 setContainerSpecificRightConstraint:v8];
  [(PHCarPlayPhoneCallContainer *)self addConstraint:v8];
}

- (id)constraintToFillContainerWithRightOfCell:(id)a3
{
  return +[NSLayoutConstraint constraintWithItem:a3 attribute:2 relatedBy:0 toItem:self attribute:2 multiplier:1.0 constant:0.0];
}

- (void)addRelationForLeftOfCell:(id)a3
{
  id v9 = a3;
  id v4 = [(PHCarPlayPhoneCallContainer *)self visibleCells];
  id v5 = (char *)[v4 indexOfObject:v9];

  if (v5)
  {
    id v6 = [(PHCarPlayPhoneCallContainer *)self visibleCells];
    id v7 = [v6 objectAtIndexedSubscript:v5 - 1];
    uint64_t v8 = +[NSLayoutConstraint constraintWithItem:v9 attribute:1 relatedBy:0 toItem:v7 attribute:2 multiplier:1.0 constant:12.0];
  }
  else
  {
    uint64_t v8 = [(PHCarPlayPhoneCallContainer *)self constraintToFillContainerWithLeftOfCell:v9];
  }
  [v9 setContainerSpecificLeftConstraint:v8];
  [(PHCarPlayPhoneCallContainer *)self addConstraint:v8];
}

- (id)constraintToFillContainerWithLeftOfCell:(id)a3
{
  return +[NSLayoutConstraint constraintWithItem:a3 attribute:1 relatedBy:0 toItem:self attribute:1 multiplier:1.0 constant:0.0];
}

- (MPCarPlayPhoneCallContainerDataSource)dataSource
{
  return self->_dataSource;
}

- (MPCarPlayPhoneCallContainerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MPCarPlayPhoneCallContainerDelegate *)a3;
}

- (NSMutableArray)visibleCells
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVisibleCells:(id)a3
{
}

- (BOOL)shouldMerge
{
  return self->_shouldMerge;
}

- (void)setShouldMerge:(BOOL)a3
{
  self->_shouldMerge = a3;
}

- (BOOL)isMerging
{
  return self->_merging;
}

- (void)setMerging:(BOOL)a3
{
  self->_merging = a3;
}

- (void).cxx_destruct
{
}

@end