@interface MFEmailSnippetCollectionViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)search:(id)a3 didFindResults:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (MFEmailSnippetCollectionViewController)initWithAceObject:(id)a3;
- (NSMutableArray)emailURLs;
- (NSMutableDictionary)emails;
- (double)desiredHeightForWidth:(double)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)headerPunchOut;
- (id)sashItem;
- (id)speakableNamespaceProviderForAceObject:(id)a3;
- (id)viewControllerForSnippet:(id)a3 error:(id *)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_prepareSiriSnippetContents;
- (void)_prepareSiriSnippetViewController;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)composeView:(id)a3 wantsOpenURL:(id)a4;
- (void)loadView;
- (void)search:(id)a3 didFinishWithError:(id)a4;
- (void)setEmailURLs:(id)a3;
- (void)setEmails:(id)a3;
- (void)wasAddedToTranscript;
@end

@implementation MFEmailSnippetCollectionViewController

- (MFEmailSnippetCollectionViewController)initWithAceObject:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MFEmailSnippetCollectionViewController;
  v5 = [(MFEmailSnippetCollectionViewController *)&v12 init];
  v6 = v5;
  if (v5)
  {
    [(MFEmailSnippetCollectionViewController *)v5 setSnippet:v4];
    [(MFEmailSnippetCollectionViewController *)v6 setLoading:1];
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    emailURLs = v6->_emailURLs;
    v6->_emailURLs = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    emails = v6->_emails;
    v6->_emails = v9;

    [(MFEmailSnippetCollectionViewController *)v6 _prepareSiriSnippetViewController];
  }

  return v6;
}

- (void)_prepareSiriSnippetViewController
{
  v26 = [(MFEmailSnippetCollectionViewController *)self snippet];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [v26 emails];
  id v3 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v3)
  {
    uint64_t v27 = 0;
    uint64_t v4 = *(void *)v30;
LABEL_3:
    uint64_t v5 = 0;
    uint64_t v6 = v27 + 1;
    v27 += (uint64_t)v3;
    while (1)
    {
      if (*(void *)v30 != v4) {
        objc_enumerationMutation(obj);
      }
      if ((unint64_t)(v6 + v5) > 0x19) {
        break;
      }
      v7 = *(void **)(*((void *)&v29 + 1) + 8 * v5);
      emailURLs = self->_emailURLs;
      v9 = [v7 identifier];
      [(NSMutableArray *)emailURLs addObject:v9];

      v10 = [MFAssistantEmail alloc];
      v11 = [v7 dictionary];
      objc_super v12 = [(MFAssistantEmail *)v10 initWithDictionary:v11];

      emails = self->_emails;
      v14 = [v7 identifier];
      [(NSMutableDictionary *)emails setObject:v12 forKey:v14];

      if (v3 == (id)++v5)
      {
        id v3 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v3) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if ([(NSMutableArray *)self->_emailURLs count] == (char *)&def_4BE8 + 1
    && ([(NSMutableArray *)self->_emailURLs lastObject],
        v15 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v16 = [v15 isAMOSIdentifier],
        v15,
        (v16 & 1) != 0))
  {
    if ([(NSMutableArray *)self->_emailURLs count] != (char *)&def_4BE8 + 1
      || ([(NSMutableArray *)self->_emailURLs lastObject],
          v17 = objc_claimAutoreleasedReturnValue(),
          unsigned int v18 = [v17 isAMOSIdentifier],
          v17,
          !v18))
    {
      self->_snippetType = 0;
      viewCell = self->_viewCell;
      self->_viewCell = 0;

      viewCellReuseIdentifier = self->_viewCellReuseIdentifier;
      self->_viewCellReuseIdentifier = 0;
      goto LABEL_16;
    }
    self->_snippetType = 1;
    v19 = -[MFEmailSnippetComposeView initWithFrame:]([MFEmailSnippetComposeView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v20 = self->_viewCell;
    self->_viewCell = (SiriUIContentCollectionViewCell *)v19;

    v21 = +[MFEmailSnippetComposeView reuseIdentifier];
  }
  else
  {
    self->_snippetType = 2;
    v22 = -[MFEmailSnippetSearchResultCellView initWithFrame:]([MFEmailSnippetSearchResultCellView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v23 = self->_viewCell;
    self->_viewCell = (SiriUIContentCollectionViewCell *)v22;

    v21 = +[MFEmailSnippetSearchResultCellView reuseIdentifier];
  }
  viewCellReuseIdentifier = self->_viewCellReuseIdentifier;
  self->_viewCellReuseIdentifier = v21;
LABEL_16:

  -[MFEmailSnippetCollectionViewController setDefaultViewInsets:](self, "setDefaultViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
}

- (void)_prepareSiriSnippetContents
{
  if (!self->_isSnippetContentsPrepared)
  {
    if (self->_snippetType != 2) {
      goto LABEL_9;
    }
    id v3 = (EFPromise *)objc_alloc_init((Class)EFPromise);
    emailContentPromise = self->_emailContentPromise;
    self->_emailContentPromise = v3;

    uint64_t v5 = +[MFAssistant loadEmailContentForEmails:self->_emailURLs delegate:self];
    uint64_t v6 = [(EFPromise *)self->_emailContentPromise future];
    id v14 = 0;
    v7 = [v6 resultWithTimeout:&v14 error:5.0];
    id v8 = v14;

    if (!v7)
    {
      [v5 cancel];
      v9 = +[NSString stringWithFormat:@"ERROR: Content did not load in time.  Returning bogus view: %p", pthread_self()];
      v16[0] = @"MFLocalizedDescriptionKey";
      v16[1] = NSUnderlyingErrorKey;
      v17[0] = v9;
      v17[1] = v8;
      v10 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      uint64_t v11 = +[NSError errorWithDomain:SiriUISnippetPluginErrorDomain code:101 userInfo:v10];

      id v8 = (id)v11;
    }

    if (v8)
    {
      objc_super v12 = MFLogGeneral();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = objc_msgSend(v8, "ef_publicDescription");
        sub_DD7C(v13, buf, v12);
      }
    }
    else
    {
LABEL_9:
      self->_isSnippetContentsPrepared = 1;
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (double)desiredHeightForWidth:(double)a3
{
  if (([(MFEmailSnippetCollectionViewController *)self isViewLoaded] & 1) == 0) {
    [(MFEmailSnippetCollectionViewController *)self loadView];
  }
  uint64_t v4 = [(MFEmailSnippetCollectionViewController *)self collectionViewLayout];
  [v4 collectionViewContentSize];
  double v6 = v5;

  double result = v6 + 10.0;
  if (self->_snippetType != 2) {
    return v6;
  }
  return result;
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)MFEmailSnippetCollectionViewController;
  [(MFEmailSnippetCollectionViewController *)&v4 loadView];
  if (self->_viewCell)
  {
    id v3 = [(MFEmailSnippetCollectionViewController *)self collectionView];
    [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:self->_viewCellReuseIdentifier];
  }
  [(MFEmailSnippetCollectionViewController *)self _prepareSiriSnippetContents];
}

- (void)wasAddedToTranscript
{
  v4.receiver = self;
  v4.super_class = (Class)MFEmailSnippetCollectionViewController;
  [(MFEmailSnippetCollectionViewController *)&v4 wasAddedToTranscript];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6F90;
  block[3] = &unk_186D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)viewControllerForSnippet:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)objc_opt_class()) initWithAceObject:v5];
  id v7 = v6;
  if (a4 && !v6)
  {
    *a4 = +[NSError errorWithDomain:SiriUISnippetPluginErrorDomain code:101 userInfo:0];
    id v7 = [objc_alloc((Class)SiriUIErrorSnippetViewController) initWithError:*a4];
  }

  return v7;
}

- (id)speakableNamespaceProviderForAceObject:(id)a3
{
  id v3 = a3;
  objc_super v4 = [[MFEmailSnippetMailProvider alloc] initWithAceObject:v3];

  return v4;
}

- (id)sashItem
{
  id v2 = [objc_alloc((Class)SiriUISashItem) initWithApplicationBundleIdentifier:@"com.apple.mobilemail"];

  return v2;
}

- (id)headerPunchOut
{
  if (self->_snippetType == 1)
  {
    id v3 = objc_alloc_init((Class)SAUIAppPunchOut);
    objc_super v4 = [(SiriUIContentCollectionViewCell *)self->_viewCell draftURL];
    [v3 setPunchOutUri:v4];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(MFEmailSnippetCollectionViewController *)self collectionView];
  id v7 = [v6 dequeueReusableCellWithReuseIdentifier:self->_viewCellReuseIdentifier forIndexPath:v5];

  id v8 = [(NSMutableArray *)self->_emailURLs count];
  if (v8 > [v5 row])
  {
    emails = self->_emails;
    v10 = -[NSMutableArray objectAtIndex:](self->_emailURLs, "objectAtIndex:", [v5 row]);
    uint64_t v11 = [(NSMutableDictionary *)emails objectForKey:v10];

    objc_super v12 = MFLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_DDD4((uint64_t)v11, v12);
    }

    [v7 setEmail:v11];
    int64_t snippetType = self->_snippetType;
    if (snippetType == 1)
    {
      [v7 setComposeViewDelegate:self];
      BOOL v15 = 0;
    }
    else
    {
      if (snippetType != 2)
      {
LABEL_9:

        goto LABEL_10;
      }
      [v7 setHasChevron:0];
      id v14 = (char *)[v5 row];
      BOOL v15 = v14 != (char *)[(NSMutableArray *)self->_emailURLs count] - 1;
    }
    [v7 setKeylineType:v15];
    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (int64_t)[(NSMutableArray *)self->_emailURLs count];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [(NSMutableArray *)self->_emailURLs count];
  if (v7 <= [v6 row])
  {
    CGFloat width = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }
  else
  {
    viewCell = self->_viewCell;
    emails = self->_emails;
    v10 = -[NSMutableArray objectAtIndex:](self->_emailURLs, "objectAtIndex:", [v6 row]);
    uint64_t v11 = [(NSMutableDictionary *)emails objectForKey:v10];
    [(SiriUIContentCollectionViewCell *)viewCell setEmail:v11];

    objc_super v12 = self->_viewCell;
    v13 = [(MFEmailSnippetCollectionViewController *)self delegate];
    [v13 siriViewControllerExpectedWidth:self];
    -[SiriUIContentCollectionViewCell sizeThatFits:](v12, "sizeThatFits:");
    CGFloat width = v14;
    CGFloat height = v16;
  }
  double v18 = width;
  double v19 = height;
  result.CGFloat height = v19;
  result.CGFloat width = v18;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v10 = a4;
  id v5 = [(NSMutableArray *)self->_emailURLs count];
  if (v5 > [v10 item])
  {
    int64_t snippetType = self->_snippetType;
    if (snippetType == 1)
    {
      id v8 = [(MFEmailSnippetCollectionViewController *)self headerPunchOut];
      id v7 = [v8 punchOutUri];

      if (!v7) {
        goto LABEL_8;
      }
    }
    else
    {
      if (snippetType != 2) {
        goto LABEL_8;
      }
      id v7 = -[NSMutableArray objectAtIndex:](self->_emailURLs, "objectAtIndex:", [v10 row]);
      if (!v7) {
        goto LABEL_8;
      }
    }
    v9 = [(MFEmailSnippetCollectionViewController *)self delegate];
    [v9 siriViewController:self openURL:v7 completion:0];
  }
LABEL_8:
}

- (BOOL)search:(id)a3 didFindResults:(id)a4
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = a4;
  id v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    uint64_t v7 = MSResultsKeyMessageReference;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [v9 objectForKey:v7];
        uint64_t v11 = +[NSURL URLWithString:v10];

        objc_super v12 = [(NSMutableDictionary *)self->_emails objectForKey:v11];
        if (!v12)
        {
          objc_super v12 = objc_alloc_init(MFAssistantEmail);
          -[NSMutableDictionary setObject:forKey:](self->_emails, "setObject:forKey:");
        }
        +[MFAssistant permuteEmail:v12 withResults:v9];
      }
      id v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  return 1;
}

- (void)search:(id)a3 didFinishWithError:(id)a4
{
  id v6 = a4;
  id v5 = [(EFPromise *)self->_emailContentPromise errorOnlyCompletionHandlerAdapter];
  ((void (**)(void, id))v5)[2](v5, v6);
}

- (void)composeView:(id)a3 wantsOpenURL:(id)a4
{
  id v6 = a4;
  id v5 = [(MFEmailSnippetCollectionViewController *)self delegate];
  [v5 siriViewController:self openURL:v6 completion:0];
}

- (NSMutableArray)emailURLs
{
  return self->_emailURLs;
}

- (void)setEmailURLs:(id)a3
{
}

- (NSMutableDictionary)emails
{
  return self->_emails;
}

- (void)setEmails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emails, 0);
  objc_storeStrong((id *)&self->_emailURLs, 0);
  objc_storeStrong((id *)&self->_viewCellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->_viewCell, 0);

  objc_storeStrong((id *)&self->_emailContentPromise, 0);
}

@end