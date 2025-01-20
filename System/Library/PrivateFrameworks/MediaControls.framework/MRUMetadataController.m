@interface MRUMetadataController
- (BOOL)appSupportsHaptics;
- (MRUArtwork)artwork;
- (MRUMetadataController)initWithDataSource:(id)a3;
- (MRUMetadataDataSource)dataSource;
- (MRUNowPlayingInfo)nowPlayingInfo;
- (MRUTimeControls)timeControls;
- (MRUTransportControls)transportControls;
- (NSHashTable)observers;
- (NSString)bundleID;
- (NSString)description;
- (void)addObserver:(id)a3;
- (void)metadataDataSource:(id)a3 didChangeArtwork:(id)a4;
- (void)metadataDataSource:(id)a3 didChangeBundleID:(id)a4;
- (void)metadataDataSource:(id)a3 didChangeNowPlayingInfo:(id)a4;
- (void)metadataDataSource:(id)a3 didChangeTimeControls:(id)a4;
- (void)metadataDataSource:(id)a3 didChangeTransportControls:(id)a4;
- (void)removeObserver:(id)a3;
- (void)representsLongFormVideoContentWithCompletion:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation MRUMetadataController

- (MRUMetadataController)initWithDataSource:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MRUMetadataController;
  v6 = [(MRUMetadataController *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    objc_storeStrong((id *)&v6->_dataSource, a3);
    [(MRUMetadataDataSource *)v6->_dataSource setDelegate:v6];
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%@ %@", objc_opt_class(), self->_dataSource];
}

- (BOOL)appSupportsHaptics
{
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  v4 = [(MRUMetadataDataSource *)self->_dataSource bundleID];
  uint64_t v7 = 0;
  id v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v7];

  LOBYTE(v4) = AXApplicationSupportsHapticMusic();
  return (char)v4;
}

- (void)setDataSource:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = (MRUMetadataDataSource *)a3;
  dataSource = self->_dataSource;
  if (dataSource != v5)
  {
    [(MRUMetadataDataSource *)dataSource setDelegate:0];
    objc_storeStrong((id *)&self->_dataSource, a3);
    [(MRUMetadataDataSource *)self->_dataSource setDelegate:self];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = (id)[(NSHashTable *)self->_observers copy];
    uint64_t v16 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v16)
    {
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
          if (objc_opt_respondsToSelector())
          {
            v9 = [(MRUMetadataDataSource *)v5 bundleID];
            [v8 metadataController:self didChangeBundleID:v9];
          }
          if (objc_opt_respondsToSelector())
          {
            objc_super v10 = [(MRUMetadataDataSource *)v5 artwork];
            [v8 metadataController:self didChangeArtwork:v10];
          }
          if (objc_opt_respondsToSelector())
          {
            v11 = [(MRUMetadataDataSource *)v5 nowPlayingInfo];
            [v8 metadataController:self didChangeNowPlayingInfo:v11];
          }
          if (objc_opt_respondsToSelector())
          {
            v12 = [(MRUMetadataDataSource *)v5 timeControls];
            [v8 metadataController:self didChangeTimeControls:v12];
          }
          if (objc_opt_respondsToSelector())
          {
            v13 = [(MRUMetadataDataSource *)v5 transportControls];
            [v8 metadataController:self didChangeTransportControls:v13];
          }
          ++v7;
        }
        while (v16 != v7);
        uint64_t v16 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v16);
    }
  }
}

- (NSString)bundleID
{
  v2 = [(MRUMetadataDataSource *)self->_dataSource bundleID];
  id v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (MRUArtwork)artwork
{
  return (MRUArtwork *)[(MRUMetadataDataSource *)self->_dataSource artwork];
}

- (MRUNowPlayingInfo)nowPlayingInfo
{
  return (MRUNowPlayingInfo *)[(MRUMetadataDataSource *)self->_dataSource nowPlayingInfo];
}

- (MRUTimeControls)timeControls
{
  return (MRUTimeControls *)[(MRUMetadataDataSource *)self->_dataSource timeControls];
}

- (MRUTransportControls)transportControls
{
  return (MRUTransportControls *)[(MRUMetadataDataSource *)self->_dataSource transportControls];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)representsLongFormVideoContentWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(2, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__MRUMetadataController_representsLongFormVideoContentWithCompletion___block_invoke;
  v7[3] = &unk_1E5F0E428;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __70__MRUMetadataController_representsLongFormVideoContentWithCompletion___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F31850];
  id v3 = [*(id *)(a1 + 32) bundleID];
  LOBYTE(v2) = [v2 bundleIdRepresentsLongFormVideoContent:v3];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__MRUMetadataController_representsLongFormVideoContentWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5F0E830;
  id v5 = *(id *)(a1 + 40);
  char v6 = (char)v2;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __70__MRUMetadataController_representsLongFormVideoContentWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)metadataDataSource:(id)a3 didChangeBundleID:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v6 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 metadataController:self didChangeBundleID:v5];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)metadataDataSource:(id)a3 didChangeArtwork:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v6 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 metadataController:self didChangeArtwork:v5];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)metadataDataSource:(id)a3 didChangeNowPlayingInfo:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v6 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 metadataController:self didChangeNowPlayingInfo:v5];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)metadataDataSource:(id)a3 didChangeTimeControls:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v6 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 metadataController:self didChangeTimeControls:v5];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)metadataDataSource:(id)a3 didChangeTransportControls:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v6 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 metadataController:self didChangeTransportControls:v5];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (MRUMetadataDataSource)dataSource
{
  return self->_dataSource;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end