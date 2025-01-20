@interface GKAutomatchPlayerInternal
+ (BOOL)supportsSecureCoding;
- (BOOL)isAutomatchPlayer;
- (NSString)automatchPositionDisplayString;
- (id)alias;
- (id)playerID;
- (int64_t)automatchPosition;
- (void)setAutomatchPosition:(int64_t)a3;
@end

@implementation GKAutomatchPlayerInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)playerID
{
  return @"AutoMatchID";
}

- (id)alias
{
  return +[GCFLocalizedStrings AUTOMATCH_PLAYER];
}

- (BOOL)isAutomatchPlayer
{
  return 1;
}

- (NSString)automatchPositionDisplayString
{
  v2 = (void *)MEMORY[0x1E4F28EE0];
  v3 = [NSNumber numberWithInteger:self->_automatchPosition];
  v4 = [v2 localizedStringFromNumber:v3 numberStyle:1];

  return (NSString *)v4;
}

- (int64_t)automatchPosition
{
  return self->_automatchPosition;
}

- (void)setAutomatchPosition:(int64_t)a3
{
  self->_automatchPosition = a3;
}

@end