@interface AVTAvatarPhysicsState
- (AVTAvatarPhysicsState)initWithDictionaryRepresentation:(id)a3;
- (id)dictionaryRepresentation;
@end

@implementation AVTAvatarPhysicsState

- (AVTAvatarPhysicsState)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarPhysicsState;
  v5 = [(AVTAvatarPhysicsState *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = (NSDictionary *)v6;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void).cxx_destruct
{
}

@end