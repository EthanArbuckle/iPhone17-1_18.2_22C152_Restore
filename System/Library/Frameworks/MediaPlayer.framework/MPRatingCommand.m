@interface MPRatingCommand
- (float)maximumRating;
- (float)minimumRating;
- (id)_mediaRemoteCommandInfoOptions;
- (id)newCommandEventWithRating:(float)a3;
- (void)setMaximumRating:(float)maximumRating;
- (void)setMinimumRating:(float)minimumRating;
@end

@implementation MPRatingCommand

- (id)_mediaRemoteCommandInfoOptions
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = *MEMORY[0x1E4F77278];
  *(float *)&double v2 = self->_minimumRating;
  v4 = [NSNumber numberWithFloat:v2];
  v10[0] = v4;
  v9[1] = *MEMORY[0x1E4F77270];
  *(float *)&double v5 = self->_maximumRating;
  v6 = [NSNumber numberWithFloat:v5];
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (float)maximumRating
{
  return self->_maximumRating;
}

- (float)minimumRating
{
  return self->_minimumRating;
}

- (id)newCommandEventWithRating:(float)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(MPRemoteCommand *)self mediaRemoteCommandType];
  uint64_t v11 = *MEMORY[0x1E4F77760];
  *(float *)&double v6 = a3;
  v7 = [NSNumber numberWithFloat:v6];
  v12[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v9 = [(MPRemoteCommand *)self newCommandEventWithCommandType:v5 options:v8];

  return v9;
}

- (void)setMaximumRating:(float)maximumRating
{
  if (vabds_f32(self->_maximumRating, maximumRating) > 0.00000011921)
  {
    self->_maximumRating = maximumRating;
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void)setMinimumRating:(float)minimumRating
{
  if (vabds_f32(self->_minimumRating, minimumRating) > 0.00000011921)
  {
    self->_minimumRating = minimumRating;
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

@end