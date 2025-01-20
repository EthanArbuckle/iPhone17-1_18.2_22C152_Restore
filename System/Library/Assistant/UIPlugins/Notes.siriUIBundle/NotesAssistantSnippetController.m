@interface NotesAssistantSnippetController
- (BOOL)_canShowWhileLocked;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (Class)headerViewClass;
- (NotesAssistantSnippetController)initWithAceObject:(id)a3 error:(id *)a4;
- (double)desiredHeightForWidth:(double)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)sashItem;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadView;
@end

@implementation NotesAssistantSnippetController

- (NotesAssistantSnippetController)initWithAceObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  [v7 setMinimumLineSpacing:0.0];
  [v7 setMinimumInteritemSpacing:0.0];
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  objc_msgSend(v7, "setSectionInset:", UIEdgeInsetsZero.top, left, bottom, right);
  v41.receiver = self;
  v41.super_class = (Class)NotesAssistantSnippetController;
  v11 = [(NotesAssistantSnippetController *)&v41 initWithCollectionViewLayout:v7];
  v12 = v11;
  if (v11)
  {
    v34 = a4;
    -[NotesAssistantSnippetController setDefaultViewInsets:](v11, "setDefaultViewInsets:", UIEdgeInsetsZero.top, left, bottom, right);
    v13 = (NoteContext *)[objc_alloc((Class)NoteContext) initForMainContext];
    htmlContext = v12->_htmlContext;
    v12->_htmlContext = v13;

    v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    notes = v12->_notes;
    v12->_notes = v15;

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v35 = v6;
    id obj = [v6 notes];
    id v17 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v38;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v38 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          v22 = +[ICNoteContext sharedContext];
          v23 = [v22 managedObjectContext];
          v24 = [(NoteContext *)v12->_htmlContext managedObjectContext];
          v25 = +[NotesAssistantUtilities searchIndexableNoteForObject:v21 modernNoteContext:v23 htmlNoteContext:v24];

          if (v25) {
            [(NSMutableArray *)v12->_notes addObject:v25];
          }
        }
        id v18 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v18);
    }

    if ([(NSMutableArray *)v12->_notes count])
    {
      if ([(NSMutableArray *)v12->_notes count] == (char *)&dword_0 + 1)
      {
        v26 = [(NSMutableArray *)v12->_notes objectAtIndexedSubscript:0];
        v27 = +[ICNoteListSortUtilities dateForCurrentSortTypeForNote:v26 folderNoteSortType:0];
        v28 = objc_msgSend(v27, "ic_briefFormattedDate");
        [(NotesAssistantSnippetController *)v12 setSubtitle:v28];

        v29 = -[NotesAssistantSingleNoteViewCell initWithFrame:]([NotesAssistantSingleNoteViewCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        viewCell = v12->_viewCell;
        v12->_viewCell = (SiriUIContentCollectionViewCell *)v29;
      }
      else
      {
        v31 = -[NotesAssistantNotesListViewCellWithImage initWithFrame:]([NotesAssistantNotesListViewCellWithImage alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        v32 = v12->_viewCell;
        v12->_viewCell = (SiriUIContentCollectionViewCell *)v31;
      }
    }
    else
    {

      if (v34)
      {
        +[NSError errorWithDomain:SiriUISnippetPluginErrorDomain code:101 userInfo:0];
        v12 = 0;
        id *v34 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
    }
    id v6 = v35;
  }

  return v12;
}

- (void)loadView
{
  v9.receiver = self;
  v9.super_class = (Class)NotesAssistantSnippetController;
  [(NotesAssistantSnippetController *)&v9 loadView];
  v3 = [(NotesAssistantSnippetController *)self collectionView];
  v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setScrollEnabled:0];
  uint64_t v5 = objc_opt_class();
  id v6 = +[NotesAssistantSingleNoteViewCell reuseIdentifier];
  [v3 registerClass:v5 forCellWithReuseIdentifier:v6];

  uint64_t v7 = objc_opt_class();
  v8 = +[NotesAssistantNotesListViewCellWithImage reuseIdentifier];
  [v3 registerClass:v7 forCellWithReuseIdentifier:v8];
}

- (double)desiredHeightForWidth:(double)a3
{
  [(NotesAssistantSnippetController *)self loadViewIfNeeded];
  v4 = [(NotesAssistantSnippetController *)self collectionView];
  uint64_t v5 = [v4 collectionViewLayout];
  [v5 collectionViewContentSize];
  double v7 = v6;

  return v7;
}

- (Class)headerViewClass
{
  return 0;
}

- (id)sashItem
{
  id v2 = objc_alloc((Class)SiriUISashItem);
  v3 = ICNotesAppBundleIdentifier();
  id v4 = [v2 initWithApplicationBundleIdentifier:v3];

  return v4;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  double v7 = [(NotesAssistantSnippetController *)self delegate];
  [v7 siriViewControllerExpectedWidth:self];
  double width = v8;

  id v10 = [v6 row];
  if (v10 >= [(NSMutableArray *)self->_notes count])
  {
    double width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }
  else
  {
    v11 = ICProtocolCast();
    v12 = -[NSMutableArray objectAtIndexedSubscript:](self->_notes, "objectAtIndexedSubscript:", [v6 row]);
    [v11 setNote:v12];

    if ([(NSMutableArray *)self->_notes count] == (char *)&dword_0 + 1)
    {
      -[SiriUIContentCollectionViewCell sizeThatFits:](self->_viewCell, "sizeThatFits:", width, 1.79769313e308);
      double width = v13;
      CGFloat height = v14;
    }
    else
    {
      CGFloat height = 64.0;
    }
  }
  double v16 = width;
  double v17 = height;
  result.CGFloat height = v17;
  result.double width = v16;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (int64_t)[(NSMutableArray *)self->_notes count];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[NSMutableArray objectAtIndexedSubscript:](self->_notes, "objectAtIndexedSubscript:", [v5 row]);
  double v7 = (char *)[(NSMutableArray *)self->_notes count];
  double v8 = [(NotesAssistantSnippetController *)self collectionView];
  objc_super v9 = &off_18328;
  if (v7 != (unsigned char *)&dword_0 + 1) {
    objc_super v9 = off_18320;
  }
  id v10 = [(__objc2_class *)*v9 reuseIdentifier];
  v11 = [v8 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v5];

  [v11 setNote:v6];
  objc_msgSend(v11, "setKeylineType:", 4 * (objc_msgSend(v5, "row") != (char *)-[NSMutableArray count](self->_notes, "count") - 1));

  return v11;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v16 = a4;
  id v5 = [v16 row];
  BOOL v6 = v5 >= [(NSMutableArray *)self->_notes count];
  double v7 = v16;
  if (!v6)
  {
    double v8 = -[NSMutableArray objectAtIndexedSubscript:](self->_notes, "objectAtIndexedSubscript:", [v16 row]);
    objc_super v9 = ICProtocolCast();

    if (!v9)
    {
LABEL_10:

      double v7 = v16;
      goto LABEL_11;
    }
    objc_opt_class();
    id v10 = ICDynamicCast();
    objc_opt_class();
    uint64_t v11 = ICDynamicCast();
    v12 = (void *)v11;
    if (v10)
    {
      uint64_t v13 = +[ICAppURLUtilities appURLForNote:v10];
    }
    else
    {
      if (!v11)
      {
LABEL_9:

        goto LABEL_10;
      }
      uint64_t v13 = NotesAppURLForNote();
    }
    double v14 = (void *)v13;
    if (v13)
    {
      v15 = [(NotesAssistantSnippetController *)self delegate];
      [v15 siriViewController:self openURL:v14 completion:0];
    }
    goto LABEL_9;
  }
LABEL_11:
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewCell, 0);
  objc_storeStrong((id *)&self->_notes, 0);

  objc_storeStrong((id *)&self->_htmlContext, 0);
}

@end