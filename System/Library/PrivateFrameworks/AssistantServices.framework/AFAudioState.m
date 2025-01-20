@interface AFAudioState
+ (BOOL)supportsSecureCoding;
- (AFAudioState)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)audioSessionID;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioSessionID:(unsigned int)a3;
@end

@implementation AFAudioState

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)encodeWithCoder:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t audioSessionID = self->_audioSessionID;
  id v5 = a3;
  id v6 = [v3 numberWithUnsignedInt:audioSessionID];
  [v5 encodeObject:v6 forKey:@"_audioSessionID"];
}

- (AFAudioState)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AFAudioState;
  id v5 = [(AFAudioState *)&v8 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_audioSessionID"];
    v5->_uint64_t audioSessionID = [v6 unsignedIntValue];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[AFAudioState allocWithZone:a3] init];
  *((_DWORD *)result + 2) = self->_audioSessionID;
  return result;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)AFAudioState;
  id v4 = [(AFAudioState *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ {uint64_t audioSessionID = %u}", v4, self->_audioSessionID];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end