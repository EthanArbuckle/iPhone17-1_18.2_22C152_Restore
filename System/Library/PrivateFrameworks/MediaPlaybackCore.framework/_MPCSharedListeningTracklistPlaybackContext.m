@interface _MPCSharedListeningTracklistPlaybackContext
- (MSVSectionedCollection)tracklist;
- (NSIndexPath)startItemIndexPath;
- (id)getSharedListeningTracklistWithCompletion:(id)a3;
- (void)setStartItemIndexPath:(id)a3;
- (void)setTracklist:(id)a3;
@end

@implementation _MPCSharedListeningTracklistPlaybackContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startItemIndexPath, 0);

  objc_storeStrong((id *)&self->_tracklist, 0);
}

- (void)setStartItemIndexPath:(id)a3
{
}

- (NSIndexPath)startItemIndexPath
{
  return self->_startItemIndexPath;
}

- (void)setTracklist:(id)a3
{
}

- (MSVSectionedCollection)tracklist
{
  return self->_tracklist;
}

- (id)getSharedListeningTracklistWithCompletion:(id)a3
{
  v4 = (void *)MEMORY[0x263F08AB8];
  v5 = (void (**)(id, void *, void *, void))a3;
  v6 = [v4 progressWithTotalUnitCount:1];
  v7 = [(_MPCSharedListeningTracklistPlaybackContext *)self tracklist];
  v8 = [(_MPCSharedListeningTracklistPlaybackContext *)self startItemIndexPath];
  v5[2](v5, v7, v8, 0);

  [v6 setCompletedUnitCount:1];

  return v6;
}

@end