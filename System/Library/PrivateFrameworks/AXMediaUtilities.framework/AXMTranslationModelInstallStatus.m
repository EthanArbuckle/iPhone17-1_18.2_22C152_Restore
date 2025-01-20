@interface AXMTranslationModelInstallStatus
- (NSString)localeIdentifier;
- (int64_t)progress;
- (unint64_t)state;
- (void)setLocaleIdentifier:(id)a3;
- (void)setProgress:(int64_t)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation AXMTranslationModelInstallStatus

- (int64_t)progress
{
  return self->_progress;
}

- (void)setProgress:(int64_t)a3
{
  self->_progress = a3;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
}

@end