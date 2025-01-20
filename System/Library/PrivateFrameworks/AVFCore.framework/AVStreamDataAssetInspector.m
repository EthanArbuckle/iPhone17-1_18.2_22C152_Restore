@interface AVStreamDataAssetInspector
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- (AVStreamDataAssetInspector)initWithTrackIDs:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)providesPreciseDurationAndTiming;
- (id)trackIDs;
- (int64_t)trackCount;
- (void)dealloc;
@end

@implementation AVStreamDataAssetInspector

- (AVStreamDataAssetInspector)initWithTrackIDs:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVStreamDataAssetInspector;
  v4 = [(AVStreamDataAssetInspector *)&v6 init];
  if (v4) {
    v4->_trackIDs = (NSArray *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVStreamDataAssetInspector;
  [(AVStreamDataAssetInspector *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  return 1;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F0];
  return self;
}

- (BOOL)providesPreciseDurationAndTiming
{
  return 0;
}

- (int64_t)trackCount
{
  return [(NSArray *)self->_trackIDs count];
}

- (id)trackIDs
{
  return self->_trackIDs;
}

@end