@interface MPVocalsControlCommand
- (BOOL)isContinuous;
- (BOOL)vocalsControlActive;
- (float)maxVocalsLevel;
- (float)minVocalsLevel;
- (float)vocalsLevel;
- (id)_mediaRemoteCommandInfoOptions;
- (void)setContinuous:(BOOL)a3;
- (void)setMaxVocalsLevel:(float)a3;
- (void)setMinVocalsLevel:(float)a3;
- (void)setVocalsControlActive:(BOOL)a3;
- (void)setVocalsLevel:(float)a3;
@end

@implementation MPVocalsControlCommand

- (id)_mediaRemoteCommandInfoOptions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [NSNumber numberWithBool:self->_vocalsControlActive];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F77360]];

  *(float *)&double v5 = self->_vocalsLevel;
  v6 = [NSNumber numberWithFloat:v5];
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F77370]];

  *(float *)&double v7 = self->_minVocalsLevel;
  v8 = [NSNumber numberWithFloat:v7];
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F77380]];

  *(float *)&double v9 = self->_maxVocalsLevel;
  v10 = [NSNumber numberWithFloat:v9];
  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F77378]];

  v11 = [NSNumber numberWithBool:self->_continuous];
  [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F77368]];

  v12 = (void *)[v3 copy];

  return v12;
}

- (void)setVocalsLevel:(float)a3
{
  if (self->_vocalsLevel != a3)
  {
    self->_vocalsLevel = a3;
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void)setVocalsControlActive:(BOOL)a3
{
  if (self->_vocalsControlActive != a3)
  {
    self->_vocalsControlActive = a3;
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void)setMinVocalsLevel:(float)a3
{
  if (self->_minVocalsLevel != a3)
  {
    self->_minVocalsLevel = a3;
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void)setMaxVocalsLevel:(float)a3
{
  if (self->_maxVocalsLevel != a3)
  {
    self->_maxVocalsLevel = a3;
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void)setContinuous:(BOOL)a3
{
  if (self->_continuous != a3)
  {
    self->_continuous = a3;
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (BOOL)isContinuous
{
  return self->_continuous;
}

- (float)maxVocalsLevel
{
  return self->_maxVocalsLevel;
}

- (float)minVocalsLevel
{
  return self->_minVocalsLevel;
}

- (float)vocalsLevel
{
  return self->_vocalsLevel;
}

- (BOOL)vocalsControlActive
{
  return self->_vocalsControlActive;
}

@end