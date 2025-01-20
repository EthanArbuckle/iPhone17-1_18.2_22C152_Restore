@interface _ACCAssistiveTouchAccessoryInfo
- (NSString)accessoryUID;
- (_ACCAssistiveTouchAccessoryInfo)initWithUID:(id)a3;
- (id)description;
- (void)dealloc;
@end

@implementation _ACCAssistiveTouchAccessoryInfo

- (_ACCAssistiveTouchAccessoryInfo)initWithUID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ACCAssistiveTouchAccessoryInfo;
  v5 = [(_ACCAssistiveTouchAccessoryInfo *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    accessoryUID = v5->_accessoryUID;
    v5->_accessoryUID = v6;
  }
  return v5;
}

- (void)dealloc
{
  accessoryUID = self->_accessoryUID;
  self->_accessoryUID = 0;

  v4.receiver = self;
  v4.super_class = (Class)_ACCAssistiveTouchAccessoryInfo;
  [(_ACCAssistiveTouchAccessoryInfo *)&v4 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<_ACCAssistiveTouchAccessoryInfo>[%@]", self->_accessoryUID];
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (void).cxx_destruct
{
}

@end