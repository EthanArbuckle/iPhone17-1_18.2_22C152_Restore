@interface AVPictureInPicturePrerollAttributes
+ (id)prerollAttributesForAdContentWithRequiredLinearPlaybackEndTime:(id *)a3 preferredTintColor:(id)a4;
+ (id)prerollAttributesForSponsoredContentWithRequiredLinearPlaybackEndTime:(id *)a3 preferredTintColor:(id)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)requiredLinearPlaybackEndTime;
- (AVPictureInPicturePrerollAttributes)initWithPlaybackStatePrerollAttributes:(id)a3 requiredLinearPlaybackEndTime:(id *)a4;
- (PGPlaybackStatePrerollAttributes)pegasusAttributes;
- (UIColor)preferredTintColor;
@end

@implementation AVPictureInPicturePrerollAttributes

- (void).cxx_destruct
{
}

- (PGPlaybackStatePrerollAttributes)pegasusAttributes
{
  return self->_pegasusAttributes;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)requiredLinearPlaybackEndTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (UIColor)preferredTintColor
{
  v2 = [(AVPictureInPicturePrerollAttributes *)self pegasusAttributes];
  v3 = [v2 preferredTintColor];

  return (UIColor *)v3;
}

- (AVPictureInPicturePrerollAttributes)initWithPlaybackStatePrerollAttributes:(id)a3 requiredLinearPlaybackEndTime:(id *)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AVPictureInPicturePrerollAttributes;
  v8 = [(AVPictureInPicturePrerollAttributes *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pegasusAttributes, a3);
    long long v10 = *(_OWORD *)&a4->var0;
    v9->_requiredLinearPlaybackEndTime.epoch = a4->var3;
    *(_OWORD *)&v9->_requiredLinearPlaybackEndTime.value = v10;
  }

  return v9;
}

+ (id)prerollAttributesForSponsoredContentWithRequiredLinearPlaybackEndTime:(id *)a3 preferredTintColor:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)a1);
  CMTime v11 = *(CMTime *)a3;
  v8 = [MEMORY[0x1E4F88580] prerollAttributesForSponsoredContentWithRequiredLinearPlaybackEndTime:v6 preferredTintColor:CMTimeGetSeconds(&v11)];

  CMTime v11 = *(CMTime *)a3;
  v9 = (void *)[v7 initWithPlaybackStatePrerollAttributes:v8 requiredLinearPlaybackEndTime:&v11];

  return v9;
}

+ (id)prerollAttributesForAdContentWithRequiredLinearPlaybackEndTime:(id *)a3 preferredTintColor:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)a1);
  CMTime v11 = *(CMTime *)a3;
  v8 = [MEMORY[0x1E4F88580] prerollAttributesForAdContentWithRequiredLinearPlaybackEndTime:v6 preferredTintColor:CMTimeGetSeconds(&v11)];

  CMTime v11 = *(CMTime *)a3;
  v9 = (void *)[v7 initWithPlaybackStatePrerollAttributes:v8 requiredLinearPlaybackEndTime:&v11];

  return v9;
}

@end