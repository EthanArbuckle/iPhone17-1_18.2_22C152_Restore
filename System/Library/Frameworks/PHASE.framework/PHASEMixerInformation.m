@interface PHASEMixerInformation
- (NSString)identifier;
- (NSString)uid;
- (int64_t)mixerType;
- (void)setIdentifier:(id)a3;
- (void)setMixerType:(int64_t)a3;
- (void)setUid:(id)a3;
@end

@implementation PHASEMixerInformation

- (NSString)uid
{
  return self->_identifier;
}

- (void)setUid:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)mixerType
{
  return self->_mixerType;
}

- (void)setMixerType:(int64_t)a3
{
  self->_mixerType = a3;
}

- (void).cxx_destruct
{
}

@end