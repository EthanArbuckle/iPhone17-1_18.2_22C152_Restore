@interface SHUpdatedTrackLocalTrackPair
- (SHMediaLibraryTrack)updatedTrack;
- (SHTrackMO)localTrack;
- (SHUpdatedTrackLocalTrackPair)initWithUpdatedTrack:(id)a3 localTrack:(id)a4;
@end

@implementation SHUpdatedTrackLocalTrackPair

- (SHUpdatedTrackLocalTrackPair)initWithUpdatedTrack:(id)a3 localTrack:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHUpdatedTrackLocalTrackPair;
  v9 = [(SHUpdatedTrackLocalTrackPair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_updatedTrack, a3);
    objc_storeStrong((id *)&v10->_localTrack, a4);
  }

  return v10;
}

- (SHMediaLibraryTrack)updatedTrack
{
  return self->_updatedTrack;
}

- (SHTrackMO)localTrack
{
  return self->_localTrack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localTrack, 0);

  objc_storeStrong((id *)&self->_updatedTrack, 0);
}

@end