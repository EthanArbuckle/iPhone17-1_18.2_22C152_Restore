@interface MusicKit_SPI_SKCloudServiceSetupViewController
- (MusicKit_SPI_SKCloudServiceSetupViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MusicKit_SPI_SKCloudServiceSetupViewControllerDelegate)musicKit_delegate;
- (id)_musicKit_underlyingActionForAction:(id)a3;
- (id)_musicKit_underlyingMessageIdentifierForMessageIdentifier:(id)a3;
- (id)_musicKit_underlyingOptionsForOptions:(id)a3;
- (void)cloudServiceSetupViewControllerDidDismiss:(id)a3;
- (void)musicKit_loadWithOptions:(id)a3 completionHandler:(id)a4;
- (void)musicKit_setDelegate:(id)a3;
@end

@implementation MusicKit_SPI_SKCloudServiceSetupViewController

- (MusicKit_SPI_SKCloudServiceSetupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MusicKit_SPI_SKCloudServiceSetupViewController;
  v4 = [(SKCloudServiceSetupViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(SKCloudServiceSetupViewController *)v4 setDelegate:v4];
  }
  return v5;
}

- (void)musicKit_loadWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(MusicKit_SPI_SKCloudServiceSetupViewController *)self _musicKit_underlyingOptionsForOptions:a3];
  [(SKCloudServiceSetupViewController *)self loadWithOptions:v7 completionHandler:v6];
}

- (id)_musicKit_underlyingOptionsForOptions:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __88__MusicKit_SPI_SKCloudServiceSetupViewController__musicKit_underlyingOptionsForOptions___block_invoke;
  v13 = &unk_264C49410;
  v14 = self;
  id v15 = v6;
  id v7 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:&v10];

  v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

- (id)_musicKit_underlyingActionForAction:(id)a3
{
  if ([a3 isEqualToString:@"musicKit_subscribe"]) {
    id v3 = (id)*MEMORY[0x263F17FF0];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)_musicKit_underlyingMessageIdentifierForMessageIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"musicKit_join"])
  {
    v4 = (id *)MEMORY[0x263F18008];
LABEL_9:
    id v5 = *v4;
    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"musicKit_connect"])
  {
    v4 = (id *)MEMORY[0x263F18000];
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"musicKit_addMusic"])
  {
    v4 = (id *)MEMORY[0x263F17FF8];
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"musicKit_playMusic"])
  {
    v4 = (id *)MEMORY[0x263F18010];
    goto LABEL_9;
  }
  id v5 = 0;
LABEL_10:

  return v5;
}

- (void)cloudServiceSetupViewControllerDidDismiss:(id)a3
{
  if (self == a3)
  {
    id v5 = [(MusicKit_SPI_SKCloudServiceSetupViewController *)self musicKit_delegate];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v5, "musicKit_cloudServiceSetupViewControllerDidDismiss:", self);
    }
  }
}

- (MusicKit_SPI_SKCloudServiceSetupViewControllerDelegate)musicKit_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_musicKit_delegate);

  return (MusicKit_SPI_SKCloudServiceSetupViewControllerDelegate *)WeakRetained;
}

- (void)musicKit_setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end