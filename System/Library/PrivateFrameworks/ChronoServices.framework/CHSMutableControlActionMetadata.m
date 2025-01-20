@interface CHSMutableControlActionMetadata
- (id)copyWithZone:(_NSZone *)a3;
- (void)setIntentType:(id)a3;
- (void)setIsCameraCapture:(BOOL)a3;
- (void)setIsLauncher:(BOOL)a3;
@end

@implementation CHSMutableControlActionMetadata

- (void)setIntentType:(id)a3
{
  id v6 = a3;
  v4 = (NSString *)[v6 copy];
  intentType = self->super._intentType;
  self->super._intentType = v4;
}

- (void)setIsLauncher:(BOOL)a3
{
  self->super._isLauncher = a3;
}

- (void)setIsCameraCapture:(BOOL)a3
{
  self->super._isCameraCapture = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CHSControlActionMetadata alloc];
  return [(CHSControlActionMetadata *)v4 _initWithMetadata:self];
}

@end