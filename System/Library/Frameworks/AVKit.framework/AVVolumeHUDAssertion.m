@interface AVVolumeHUDAssertion
- (AVVolumeHUDAssertion)initWithSceneIdentifier:(id)a3 clientIdentifier:(id)a4;
- (AVVolumeHUDAssertionDelegate)delegate;
- (BOOL)isEqual:(id)a3;
- (BOOL)prefersSystemVolumeHUDHidden;
- (NSString)clientIdentifier;
- (NSString)sceneIdentifier;
- (NSString)volumeAudioCategory;
- (UIWindowScene)windowSceneForVolumeDisplay;
- (id)_systemController;
- (unint64_t)hash;
- (void)setDelegate:(id)a3;
- (void)setPrefersSystemVolumeHUDHidden:(BOOL)a3;
@end

@implementation AVVolumeHUDAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setPrefersSystemVolumeHUDHidden:(BOOL)a3
{
  self->_prefersSystemVolumeHUDHidden = a3;
}

- (BOOL)prefersSystemVolumeHUDHidden
{
  return self->_prefersSystemVolumeHUDHidden;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setDelegate:(id)a3
{
}

- (AVVolumeHUDAssertionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVVolumeHUDAssertionDelegate *)WeakRetained;
}

- (id)_systemController
{
  v2 = [(AVVolumeHUDAssertion *)self delegate];
  v3 = [v2 currentSystemController];

  return v3;
}

- (NSString)volumeAudioCategory
{
  v2 = [(AVVolumeHUDAssertion *)self _systemController];
  v3 = [v2 volumeCategoryForAudioCategory:@"MediaPlayback"];

  return (NSString *)v3;
}

- (UIWindowScene)windowSceneForVolumeDisplay
{
  v2 = (void *)*MEMORY[0x1E4FB2608];
  v3 = [(AVVolumeHUDAssertion *)self sceneIdentifier];
  v4 = objc_msgSend(v2, "avkit_windowSceneWithSessionIdentifier:", v3);

  return (UIWindowScene *)v4;
}

- (unint64_t)hash
{
  v3 = [(AVVolumeHUDAssertion *)self sceneIdentifier];
  uint64_t v4 = [(AVVolumeHUDAssertion *)self clientIdentifier];
  v5 = (void *)v4;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = &stru_1F09185C8;
  }
  v7 = [v3 stringByAppendingString:v6];
  uint64_t v8 = [v7 hash];
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[AVVolumeHUDAssertion prefersSystemVolumeHUDHidden](self, "prefersSystemVolumeHUDHidden"));
  unint64_t v10 = [v9 hash] ^ v8;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 clientIdentifier];
    v6 = [(AVVolumeHUDAssertion *)self clientIdentifier];
    if ([v5 isEqualToString:v6])
    {
      v7 = [v4 sceneIdentifier];
      uint64_t v8 = [(AVVolumeHUDAssertion *)self sceneIdentifier];
      if ([v7 isEqualToString:v8])
      {
        int v9 = [v4 prefersSystemVolumeHUDHidden];
        int v10 = v9 ^ [(AVVolumeHUDAssertion *)self prefersSystemVolumeHUDHidden] ^ 1;
      }
      else
      {
        LOBYTE(v10) = 0;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (AVVolumeHUDAssertion)initWithSceneIdentifier:(id)a3 clientIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVVolumeHUDAssertion;
  int v9 = [(AVVolumeHUDAssertion *)&v12 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sceneIdentifier, a3);
    objc_storeStrong((id *)&v10->_clientIdentifier, a4);
    v10->_prefersSystemVolumeHUDHidden = 0;
  }

  return v10;
}

@end