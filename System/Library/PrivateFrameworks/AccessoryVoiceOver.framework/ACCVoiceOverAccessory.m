@interface ACCVoiceOverAccessory
- (ACCVoiceOverAccessory)initWithAccessoryUID:(id)a3;
- (BOOL)desiredVoiceOverState;
- (NSString)accessoryUID;
- (void)setAccessoryUID:(id)a3;
- (void)setDesiredVoiceOverState:(BOOL)a3;
@end

@implementation ACCVoiceOverAccessory

- (ACCVoiceOverAccessory)initWithAccessoryUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ACCVoiceOverAccessory;
  v6 = [(ACCVoiceOverAccessory *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessoryUID, a3);
    v7->_desiredVoiceOverState = 0;
  }

  return v7;
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (void)setAccessoryUID:(id)a3
{
}

- (BOOL)desiredVoiceOverState
{
  return self->_desiredVoiceOverState;
}

- (void)setDesiredVoiceOverState:(BOOL)a3
{
  self->_desiredVoiceOverState = a3;
}

- (void).cxx_destruct
{
}

@end