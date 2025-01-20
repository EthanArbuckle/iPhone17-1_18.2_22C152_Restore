@interface AVPlayerSetRateOptions
- (AVPlayerSetRateOptions)init;
- (BOOL)isEqual:(id)a3;
- (BOOL)overrideAutowaitRestriction;
- (BOOL)preferCoordinatedPlaybackBehavior;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setOverrideAutowaitRestriction:(BOOL)a3;
- (void)setPreferCoordinatedPlaybackBehavior:(BOOL)a3;
@end

@implementation AVPlayerSetRateOptions

- (AVPlayerSetRateOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerSetRateOptions;
  result = [(AVPlayerSetRateOptions *)&v3 init];
  *(_WORD *)&result->_preferCoordinatedPlaybackBehavior = 0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[AVPlayerSetRateOptions allocWithZone:a3] init];
  [(AVPlayerSetRateOptions *)v4 setPreferCoordinatedPlaybackBehavior:[(AVPlayerSetRateOptions *)self preferCoordinatedPlaybackBehavior]];
  [(AVPlayerSetRateOptions *)v4 setOverrideAutowaitRestriction:[(AVPlayerSetRateOptions *)self overrideAutowaitRestriction]];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int v5 = [(AVPlayerSetRateOptions *)self preferCoordinatedPlaybackBehavior];
  if (v5 != [a3 preferCoordinatedPlaybackBehavior]) {
    return 0;
  }
  BOOL v7 = [(AVPlayerSetRateOptions *)self overrideAutowaitRestriction];
  return v7 ^ [a3 overrideAutowaitRestriction] ^ 1;
}

- (BOOL)preferCoordinatedPlaybackBehavior
{
  return self->_preferCoordinatedPlaybackBehavior;
}

- (void)setPreferCoordinatedPlaybackBehavior:(BOOL)a3
{
  self->_preferCoordinatedPlaybackBehavior = a3;
}

- (BOOL)overrideAutowaitRestriction
{
  return self->_overrideAutowaitRestriction;
}

- (void)setOverrideAutowaitRestriction:(BOOL)a3
{
  self->_overrideAutowaitRestriction = a3;
}

@end