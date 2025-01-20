@interface AVAssetReaderSampleReferenceOutput
+ (AVAssetReaderSampleReferenceOutput)assetReaderSampleReferenceOutputWithTrack:(AVAssetTrack *)track;
- (AVAssetReaderSampleReferenceOutput)init;
- (AVAssetReaderSampleReferenceOutput)initWithTrack:(AVAssetTrack *)track;
- (AVAssetTrack)track;
- (BOOL)_enableTrackExtractionReturningError:(id *)a3;
- (BOOL)_trimsSampleDurations;
- (id)_asset;
- (id)description;
- (id)mediaType;
- (void)dealloc;
@end

@implementation AVAssetReaderSampleReferenceOutput

+ (AVAssetReaderSampleReferenceOutput)assetReaderSampleReferenceOutputWithTrack:(AVAssetTrack *)track
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTrack:track];
  return (AVAssetReaderSampleReferenceOutput *)v3;
}

- (AVAssetReaderSampleReferenceOutput)init
{
  return [(AVAssetReaderSampleReferenceOutput *)self initWithTrack:0];
}

- (AVAssetReaderSampleReferenceOutput)initWithTrack:(AVAssetTrack *)track
{
  v16.receiver = self;
  v16.super_class = (Class)AVAssetReaderSampleReferenceOutput;
  v5 = [(AVAssetReaderOutput *)&v16 init];
  v6 = v5;
  if (!track)
  {
    v9 = v5;
    v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, @"invalid parameter not satisfying: %s", v10, v11, v12, v13, v14, (uint64_t)"track != nil"), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  if (v5)
  {
    v7 = objc_alloc_init(AVAssetReaderSampleReferenceOutputInternal);
    v6->_sampleReferenceOutputInternal = v7;
    if (v7)
    {
      CFRetain(v7);
      v6->_sampleReferenceOutputInternal->track = track;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  sampleReferenceOutputInternal = self->_sampleReferenceOutputInternal;
  if (sampleReferenceOutputInternal)
  {

    CFRelease(self->_sampleReferenceOutputInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAssetReaderSampleReferenceOutput;
  [(AVAssetReaderOutput *)&v4 dealloc];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, track = %@>", NSStringFromClass(v4), self, -[AVAssetReaderSampleReferenceOutput track](self, "track")];
}

- (AVAssetTrack)track
{
  return self->_sampleReferenceOutputInternal->track;
}

- (id)mediaType
{
  v2 = [(AVAssetReaderSampleReferenceOutput *)self track];
  return [(AVAssetTrack *)v2 mediaType];
}

- (id)_asset
{
  v2 = [(AVAssetReaderSampleReferenceOutput *)self track];
  return [(AVAssetTrack *)v2 asset];
}

- (BOOL)_trimsSampleDurations
{
  id v2 = [(AVAssetReaderSampleReferenceOutput *)self mediaType];
  return [v2 isEqual:@"soun"];
}

- (BOOL)_enableTrackExtractionReturningError:(id *)a3
{
  unsigned int v14 = -1;
  v5 = [(AVAssetReaderOutput *)self _figAssetReader];
  uint64_t v6 = [(AVAssetTrack *)[(AVAssetReaderSampleReferenceOutput *)self track] trackID];
  v7 = [(AVAssetReaderOutput *)self _figAssetReaderExtractionOptions];
  uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(uint64_t (**)(OpaqueFigAssetReader *, uint64_t, NSDictionary *, unsigned int *))(v9 + 32);
  if (!v10)
  {
    uint64_t v11 = 4294954514;
    if (a3) {
      goto LABEL_7;
    }
    return 0;
  }
  uint64_t v11 = v10(v5, v6, v7, &v14);
  if (v11)
  {
    if (a3)
    {
LABEL_7:
      id v12 = +[AVAssetReader _errorForOSStatus:v11];
      BOOL result = 0;
      *a3 = v12;
      return result;
    }
    return 0;
  }
  [(AVAssetReaderOutput *)self _setExtractionID:v14];
  return 1;
}

@end