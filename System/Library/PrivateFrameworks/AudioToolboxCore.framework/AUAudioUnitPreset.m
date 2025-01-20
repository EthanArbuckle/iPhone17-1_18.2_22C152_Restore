@interface AUAudioUnitPreset
+ (BOOL)supportsSecureCoding;
- (AUAudioUnitPreset)initWithCoder:(id)a3;
- (NSInteger)number;
- (NSString)name;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(NSString *)name;
- (void)setNumber:(NSInteger)number;
@end

@implementation AUAudioUnitPreset

- (void).cxx_destruct
{
}

- (void)setName:(NSString *)name
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setNumber:(NSInteger)number
{
  self->_number = number;
}

- (NSInteger)number
{
  return self->_number;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AUAudioUnitPreset;
  [(AUAudioUnitPreset *)&v2 dealloc];
}

- (AUAudioUnitPreset)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AUAudioUnitPreset;
  v5 = [(AUAudioUnitPreset *)&v9 init];
  if (v5)
  {
    v5->_number = [v4 decodeIntegerForKey:@"num"];
    v6 = self;
    v7 = [v4 decodeObjectOfClass:v6 forKey:@"name"];
    objc_storeStrong((id *)&v5->_name, v7);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_number forKey:@"num"];
  [v4 encodeObject:self->_name forKey:@"name"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end