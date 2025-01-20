@interface MKMapSnapshotView
- (MKMapSnapshotView)initWithFrame:(CGRect)a3;
- (void)cancel;
- (void)takeSnapshotWithOptions:(id)a3 gridOptions:(id)a4 completionHandler:(id)a5;
@end

@implementation MKMapSnapshotView

- (MKMapSnapshotView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKMapSnapshotView;
  v3 = -[MKMapSnapshotView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MKMapSnapshotView *)v3 setUserInteractionEnabled:1];
    [(MKMapSnapshotView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKMapSnapshotView *)v4 setClipsToBounds:1];
    [(MKMapSnapshotView *)v4 setContentMode:4];
  }
  return v4;
}

- (void)takeSnapshotWithOptions:(id)a3 gridOptions:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(MKMapSnapshotter *)self->_gridSnapshotter cancel];
  gridSnapshotter = self->_gridSnapshotter;
  self->_gridSnapshotter = 0;

  [(MKMapSnapshotter *)self->_snapshotter cancel];
  snapshotter = self->_snapshotter;
  self->_snapshotter = 0;

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  char v30 = 0;
  if (v9)
  {
    v13 = [[MKMapSnapshotter alloc] initWithOptions:v9];
    v14 = self->_gridSnapshotter;
    self->_gridSnapshotter = v13;

    objc_initWeak(&location, self);
    v15 = self->_gridSnapshotter;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __75__MKMapSnapshotView_takeSnapshotWithOptions_gridOptions_completionHandler___block_invoke;
    v24[3] = &unk_1E54BF3C8;
    v26 = v29;
    objc_copyWeak(&v27, &location);
    id v25 = v10;
    [(MKMapSnapshotter *)v15 startWithCompletionHandler:v24];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  v16 = [[MKMapSnapshotter alloc] initWithOptions:v8];
  v17 = self->_snapshotter;
  self->_snapshotter = v16;

  objc_initWeak(&location, self);
  v18 = self->_snapshotter;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __75__MKMapSnapshotView_takeSnapshotWithOptions_gridOptions_completionHandler___block_invoke_2;
  v20[3] = &unk_1E54BF3C8;
  objc_copyWeak(&v23, &location);
  v22 = v29;
  id v19 = v10;
  id v21 = v19;
  [(MKMapSnapshotter *)v18 startWithCompletionHandler:v20];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(v29, 8);
}

void __75__MKMapSnapshotView_takeSnapshotWithOptions_gridOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (!v12 || v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      [WeakRetained setImage:0];
    }
    else
    {
      WeakRetained = [v12 image];
      id v7 = objc_loadWeakRetained((id *)(a1 + 48));
      [v7 setImage:WeakRetained];
    }
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v5);
    }
    id v9 = objc_loadWeakRetained((id *)(a1 + 48));
    id v10 = v9;
    if (v9)
    {
      v11 = (void *)*((void *)v9 + 64);
      *((void *)v9 + 64) = 0;
    }
  }
}

void __75__MKMapSnapshotView_takeSnapshotWithOptions_gridOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v12 || v5)
    {
      id v9 = objc_loadWeakRetained((id *)(a1 + 48));
      [v9 setImage:0];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      id v7 = [v12 image];
      id v8 = objc_loadWeakRetained((id *)(a1 + 48));
      [v8 setImage:v7];

      [WeakRetained[64] cancel];
    }
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v5);
    }
    id v11 = WeakRetained[63];
    WeakRetained[63] = 0;
  }
}

- (void)cancel
{
  gridSnapshotter = self->_gridSnapshotter;
  if (gridSnapshotter) {
    [(MKMapSnapshotter *)gridSnapshotter cancel];
  }
  snapshotter = self->_snapshotter;
  if (snapshotter)
  {
    [(MKMapSnapshotter *)snapshotter cancel];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridSnapshotter, 0);

  objc_storeStrong((id *)&self->_snapshotter, 0);
}

@end