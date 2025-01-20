@interface AVTSerializedAvatarRecord
+ (BOOL)supportsSecureCoding;
- (AVTAvatarRecord)avatarRecord;
- (AVTSerializedAvatarRecord)initWithAvatarRecord:(id)a3;
- (AVTSerializedAvatarRecord)initWithCoder:(id)a3;
- (BOOL)isPuppet;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIsPuppet:(BOOL)a3;
@end

@implementation AVTSerializedAvatarRecord

- (AVTSerializedAvatarRecord)initWithAvatarRecord:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTSerializedAvatarRecord;
  v6 = [(AVTSerializedAvatarRecord *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_avatarRecord, a3);
    if (([v5 conformsToProtocol:&unk_26DA9C858] & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object protocol for %@", v5 format];
    }
    -[AVTSerializedAvatarRecord setIsPuppet:](v7, "setIsPuppet:", [v5 isPuppet]);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AVTSerializedAvatarRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeBoolForKey:@"isPuppet"];
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"avatarRecord"];

  v6 = [(AVTSerializedAvatarRecord *)self initWithAvatarRecord:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[AVTSerializedAvatarRecord isPuppet](self, "isPuppet"), @"isPuppet");
  [v4 encodeObject:self->_avatarRecord forKey:@"avatarRecord"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [AVTSerializedAvatarRecord alloc];
  id v5 = [(AVTSerializedAvatarRecord *)self avatarRecord];
  v6 = [(AVTSerializedAvatarRecord *)v4 initWithAvatarRecord:v5];

  return v6;
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (BOOL)isPuppet
{
  return self->_isPuppet;
}

- (void)setIsPuppet:(BOOL)a3
{
  self->_isPuppet = a3;
}

- (void).cxx_destruct
{
}

@end