@interface CKTranscriptPluginPresentationConfiguration
- (BOOL)shouldDisableSnapshotView;
- (CKTranscriptPluginPresentationConfiguration)initWithSourceView:(id)a3 permittedArrowDirections:(unint64_t)a4 shouldDisableSnapshotView:(BOOL)a5;
- (UIView)sourceView;
- (unint64_t)permittedArrowDirections;
@end

@implementation CKTranscriptPluginPresentationConfiguration

- (CKTranscriptPluginPresentationConfiguration)initWithSourceView:(id)a3 permittedArrowDirections:(unint64_t)a4 shouldDisableSnapshotView:(BOOL)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKTranscriptPluginPresentationConfiguration;
  v9 = [(CKTranscriptPluginPresentationConfiguration *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_sourceView, v8);
    v10->_permittedArrowDirections = a4;
    v10->_shouldDisableSnapshotView = a5;
  }

  return v10;
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);

  return (UIView *)WeakRetained;
}

- (unint64_t)permittedArrowDirections
{
  return self->_permittedArrowDirections;
}

- (BOOL)shouldDisableSnapshotView
{
  return self->_shouldDisableSnapshotView;
}

- (void).cxx_destruct
{
}

@end