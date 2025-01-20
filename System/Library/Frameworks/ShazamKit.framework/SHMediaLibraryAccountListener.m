@interface SHMediaLibraryAccountListener
- (SHMediaLibraryAccountListener)init;
- (SHMediaLibraryInfoFetcher)libraryInfoFetcher;
- (id)notificationObserver;
- (void)dealloc;
- (void)listenForChanges;
- (void)setLibraryInfoFetcher:(id)a3;
- (void)setNotificationObserver:(id)a3;
- (void)stopListeningForChanges;
@end

@implementation SHMediaLibraryAccountListener

- (void)dealloc
{
  if (self->_notificationObserver)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_notificationObserver];
  }
  v4.receiver = self;
  v4.super_class = (Class)SHMediaLibraryAccountListener;
  [(SHMediaLibraryAccountListener *)&v4 dealloc];
}

- (SHMediaLibraryAccountListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)SHMediaLibraryAccountListener;
  v2 = [(SHMediaLibraryAccountListener *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SHMediaLibraryInfoFetcher);
    libraryInfoFetcher = v2->_libraryInfoFetcher;
    v2->_libraryInfoFetcher = v3;
  }
  return v2;
}

- (void)listenForChanges
{
  v3 = [(SHMediaLibraryAccountListener *)self notificationObserver];

  if (v3) {
    [(SHMediaLibraryAccountListener *)self stopListeningForChanges];
  }
  objc_initWeak(&location, self);
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  v5 = +[NSOperationQueue mainQueue];
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_10002DFD8;
  v10 = &unk_100075320;
  objc_copyWeak(&v11, &location);
  objc_super v6 = [v4 addObserverForName:CKAccountChangedNotification object:0 queue:v5 usingBlock:&v7];
  -[SHMediaLibraryAccountListener setNotificationObserver:](self, "setNotificationObserver:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)stopListeningForChanges
{
  id v4 = +[NSNotificationCenter defaultCenter];
  v3 = [(SHMediaLibraryAccountListener *)self notificationObserver];
  [v4 removeObserver:v3];
}

- (id)notificationObserver
{
  return self->_notificationObserver;
}

- (void)setNotificationObserver:(id)a3
{
}

- (SHMediaLibraryInfoFetcher)libraryInfoFetcher
{
  return self->_libraryInfoFetcher;
}

- (void)setLibraryInfoFetcher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryInfoFetcher, 0);

  objc_storeStrong(&self->_notificationObserver, 0);
}

@end