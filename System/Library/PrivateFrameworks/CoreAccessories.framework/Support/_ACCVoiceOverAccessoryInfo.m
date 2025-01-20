@interface _ACCVoiceOverAccessoryInfo
- (NSString)accessoryUID;
- (_ACCVoiceOverAccessoryInfo)initWithUID:(id)a3;
- (id)description;
- (void)dealloc;
- (void)setAccessoryUID:(id)a3;
@end

@implementation _ACCVoiceOverAccessoryInfo

- (_ACCVoiceOverAccessoryInfo)initWithUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ACCVoiceOverAccessoryInfo;
  v6 = [(_ACCVoiceOverAccessoryInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accessoryUID, a3);
  }

  return v7;
}

- (void)dealloc
{
  accessoryUID = self->_accessoryUID;
  self->_accessoryUID = 0;

  v4.receiver = self;
  v4.super_class = (Class)_ACCVoiceOverAccessoryInfo;
  [(_ACCVoiceOverAccessoryInfo *)&v4 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<_ACCVoiceOverAccessoryInfo>[%@]", self->_accessoryUID];
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (void)setAccessoryUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end