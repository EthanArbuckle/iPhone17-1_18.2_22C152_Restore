@interface SHUIService
+ (id)machServiceName;
- (NSString)bundleIdentifier;
- (SHMediaItemPresenter)mediaItemPresenter;
- (SHMediaLibraryPresenter)mediaLibraryPresenter;
- (SHServiceDelegate)serviceDelegate;
- (id)initBundleIdentifier:(id)a3;
- (id)santizeMediaItem:(id)a3;
- (void)presentMediaItem:(id)a3 completionHandler:(id)a4;
- (void)presentMediaItem:(id)a3 presentationSettings:(id)a4 completionHandler:(id)a5;
- (void)presentMediaLibraryWithCompletionHandler:(id)a3;
- (void)setServiceDelegate:(id)a3;
@end

@implementation SHUIService

- (id)initBundleIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHUIService;
  v6 = [(SHUIService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
  }

  return v7;
}

- (void)presentMediaItem:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(SHUIService *)self mediaItemPresenter];
  v8 = [(SHUIService *)self santizeMediaItem:v7];

  [v9 presentMediaItem:v8 completionHandler:v6];
}

- (id)santizeMediaItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 genres];
  id v5 = [v4 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v3 properties];
    id v8 = [v7 mutableCopy];

    [v8 setObject:0 forKeyedSubscript:SHMediaItemGenres];
    id v9 = [v8 copy];
    id v10 = +[SHMediaItem mediaItemWithProperties:v9];
  }
  else
  {
    id v10 = v3;
  }

  return v10;
}

- (void)presentMediaItem:(id)a3 presentationSettings:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SHUIService *)self mediaItemPresenter];
  [v11 presentMediaItem:v10 presentationSettings:v9 completionHandler:v8];
}

- (void)presentMediaLibraryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SHUIService *)self mediaLibraryPresenter];
  [v5 presentMediaLibraryWithCompletionHandler:v4];
}

- (SHMediaItemPresenter)mediaItemPresenter
{
  mediaItemPresenter = self->_mediaItemPresenter;
  if (!mediaItemPresenter)
  {
    id v4 = [SHMediaItemPresenter alloc];
    id v5 = [(SHUIService *)self bundleIdentifier];
    id v6 = [(SHMediaItemPresenter *)v4 initBundleIdentifier:v5];
    id v7 = self->_mediaItemPresenter;
    self->_mediaItemPresenter = v6;

    mediaItemPresenter = self->_mediaItemPresenter;
  }

  return mediaItemPresenter;
}

- (SHMediaLibraryPresenter)mediaLibraryPresenter
{
  mediaLibraryPresenter = self->_mediaLibraryPresenter;
  if (!mediaLibraryPresenter)
  {
    id v4 = [SHMediaLibraryPresenter alloc];
    id v5 = [(SHUIService *)self bundleIdentifier];
    id v6 = [(SHMediaLibraryPresenter *)v4 initWithBundleIdentifier:v5];
    id v7 = self->_mediaLibraryPresenter;
    self->_mediaLibraryPresenter = v6;

    mediaLibraryPresenter = self->_mediaLibraryPresenter;
  }

  return mediaLibraryPresenter;
}

+ (id)machServiceName
{
  return SHShazamKitUIServiceName;
}

- (SHServiceDelegate)serviceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceDelegate);

  return (SHServiceDelegate *)WeakRetained;
}

- (void)setServiceDelegate:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_serviceDelegate);
  objc_storeStrong((id *)&self->_mediaLibraryPresenter, 0);

  objc_storeStrong((id *)&self->_mediaItemPresenter, 0);
}

@end