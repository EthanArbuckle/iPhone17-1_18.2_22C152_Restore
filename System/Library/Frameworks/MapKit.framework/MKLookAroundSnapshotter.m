@interface MKLookAroundSnapshotter
- (BOOL)isLoading;
- (MKLookAroundSnapshotter)initWithScene:(MKLookAroundScene *)scene options:(MKLookAroundSnapshotOptions *)options;
- (void)cancel;
- (void)getSnapshotWithCompletionHandler:(void *)completionHandler;
@end

@implementation MKLookAroundSnapshotter

- (MKLookAroundSnapshotter)initWithScene:(MKLookAroundScene *)scene options:(MKLookAroundSnapshotOptions *)options
{
  v6 = scene;
  v7 = options;
  v14.receiver = self;
  v14.super_class = (Class)MKLookAroundSnapshotter;
  v8 = [(MKLookAroundSnapshotter *)&v14 init];
  if (v8)
  {
    v9 = [(MKLookAroundSnapshotOptions *)v7 _options];
    v10 = +[MKMapCamera _cameraLookingAtScene:v6];
    [v9 setCamera:v10];

    v11 = [[MKMapSnapshotter alloc] initWithOptions:v9];
    snapshotter = v8->_snapshotter;
    v8->_snapshotter = v11;
  }
  return v8;
}

- (void)getSnapshotWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  snapshotter = self->_snapshotter;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__MKLookAroundSnapshotter_getSnapshotWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E54BBF38;
  id v8 = v4;
  id v6 = v4;
  [(MKMapSnapshotter *)snapshotter startWithCompletionHandler:v7];
}

void __60__MKLookAroundSnapshotter_getSnapshotWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v12)
  {
    v7 = [[MKLookAroundSnapshot alloc] initWithSnapshot:v12];
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = [[MKLookAroundSnapshot alloc] initWithSnapshot:v12];
    (*(void (**)(uint64_t, MKLookAroundSnapshot *, void))(v8 + 16))(v8, v9, 0);

LABEL_3:
    goto LABEL_6;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (!v5)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    v7 = (MKLookAroundSnapshot *)[v11 initWithDomain:MKErrorDomain code:1 userInfo:0];
    (*(void (**)(uint64_t, void, MKLookAroundSnapshot *))(v10 + 16))(v10, 0, v7);
    goto LABEL_3;
  }
  (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v5);
LABEL_6:
}

- (void)cancel
{
}

- (BOOL)isLoading
{
  return [(MKMapSnapshotter *)self->_snapshotter isLoading];
}

- (void).cxx_destruct
{
}

@end