@interface MPConcreteMediaItemArtwork
- (CGRect)bounds;
- (MPArtworkCatalog)artworkCatalog;
- (MPConcreteMediaItemArtwork)initWithArtworkCatalog:(id)a3;
- (MPConcreteMediaItemArtwork)initWithArtworkCatalog:(id)a3 allowsNetworking:(BOOL)a4;
@end

@implementation MPConcreteMediaItemArtwork

- (void).cxx_destruct
{
}

- (MPArtworkCatalog)artworkCatalog
{
  return self->_catalog;
}

- (CGRect)bounds
{
  p_bounds = &self->_bounds;
  if (CGRectEqualToRect(self->_bounds, *MEMORY[0x1E4F1DB28]))
  {
    [(MPArtworkCatalog *)self->_catalog setFittingSize:MPArtworkCatalogOriginalSize];
    catalog = self->_catalog;
    v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v5 scale];
    -[MPArtworkCatalog setDestinationScale:](catalog, "setDestinationScale:");

    v6 = [(MPArtworkCatalog *)self->_catalog bestImageFromDisk];
    v7 = v6;
    if (v6)
    {
      [v6 size];
      p_bounds->origin = (CGPoint)*MEMORY[0x1E4F1DAD8];
      p_bounds->size.double width = v8;
      p_bounds->size.double height = v9;
    }
  }
  double x = p_bounds->origin.x;
  double y = p_bounds->origin.y;
  double width = p_bounds->size.width;
  double height = p_bounds->size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (MPConcreteMediaItemArtwork)initWithArtworkCatalog:(id)a3
{
  return [(MPConcreteMediaItemArtwork *)self initWithArtworkCatalog:a3 allowsNetworking:0];
}

- (MPConcreteMediaItemArtwork)initWithArtworkCatalog:(id)a3 allowsNetworking:(BOOL)a4
{
  id v7 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__MPConcreteMediaItemArtwork_initWithArtworkCatalog_allowsNetworking___block_invoke;
  v13[3] = &unk_1E57F1420;
  id v8 = v7;
  id v14 = v8;
  BOOL v15 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPConcreteMediaItemArtwork;
  CGFloat v9 = -[MPMediaItemArtwork initWithBoundsSize:requestHandler:](&v12, sel_initWithBoundsSize_requestHandler_, v13, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  v10 = v9;
  if (v9) {
    objc_storeStrong((id *)&v9->_catalog, a3);
  }

  return v10;
}

id __70__MPConcreteMediaItemArtwork_initWithArtworkCatalog_allowsNetworking___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFittingSize:");
  v2 = *(void **)(a1 + 32);
  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 scale];
  objc_msgSend(v2, "setDestinationScale:");

  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__21447;
  v18 = __Block_byref_object_dispose__21448;
  id v19 = 0;
  v4 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40) && v4)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v6 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__MPConcreteMediaItemArtwork_initWithArtworkCatalog_allowsNetworking___block_invoke_2;
    v11[3] = &unk_1E57F13F8;
    v13 = &v14;
    id v7 = v5;
    objc_super v12 = v7;
    [v6 requestImageWithCompletion:v11];
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    uint64_t v8 = [v4 bestImageFromDisk];
    id v7 = v15[5];
    v15[5] = v8;
  }

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __70__MPConcreteMediaItemArtwork_initWithArtworkCatalog_allowsNetworking___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end