@interface VCMediaNegotiatorResultsCaptions
- (BOOL)remoteCanDisplayCaptions;
- (NSSet)localLanguages;
- (NSSet)remoteLanguages;
- (void)dealloc;
- (void)setLocalLanguages:(id)a3;
- (void)setRemoteCanDisplayCaptions:(BOOL)a3;
- (void)setRemoteLanguages:(id)a3;
@end

@implementation VCMediaNegotiatorResultsCaptions

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorResultsCaptions;
  [(VCMediaNegotiatorResultsCaptions *)&v3 dealloc];
}

- (NSSet)localLanguages
{
  return self->_localLanguages;
}

- (void)setLocalLanguages:(id)a3
{
}

- (NSSet)remoteLanguages
{
  return self->_remoteLanguages;
}

- (void)setRemoteLanguages:(id)a3
{
}

- (BOOL)remoteCanDisplayCaptions
{
  return self->_remoteCanDisplayCaptions;
}

- (void)setRemoteCanDisplayCaptions:(BOOL)a3
{
  self->_remoteCanDisplayCaptions = a3;
}

@end