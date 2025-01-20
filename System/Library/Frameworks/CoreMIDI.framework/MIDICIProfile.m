@interface MIDICIProfile
+ (BOOL)supportsSecureCoding;
+ (id)description;
- (BOOL)isEqual:(id)a3;
- (MIDICIProfile)initWithCoder:(id)a3;
- (MIDICIProfile)initWithData:(NSData *)data;
- (MIDICIProfile)initWithData:(NSData *)data name:(NSString *)inName;
- (NSData)profileID;
- (NSString)name;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MIDICIProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileID, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSData)profileID
{
  return self->_profileID;
}

- (NSString)name
{
  return self->_name;
}

- (MIDICIProfile)initWithData:(NSData *)data name:(NSString *)inName
{
  v6 = data;
  v7 = inName;
  v14.receiver = self;
  v14.super_class = (Class)MIDICIProfile;
  v8 = [(MIDICIProfile *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithData:v6];
    profileID = v8->_profileID;
    v8->_profileID = (NSData *)v9;

    uint64_t v11 = [NSString stringWithString:v7];
    name = v8->_name;
    v8->_name = (NSString *)v11;
  }
  return v8;
}

- (MIDICIProfile)initWithData:(NSData *)data
{
  v4 = data;
  CIProfileBytesToName((uint64_t)__p, (unsigned char *)[(NSData *)v4 bytes], [(NSData *)v4 length]);
  if (v10 >= 0) {
    v5 = __p;
  }
  else {
    v5 = (void **)__p[0];
  }
  v6 = [NSString stringWithUTF8String:v5];
  v7 = [(MIDICIProfile *)self initWithData:v4 name:v6];

  if (v10 < 0) {
    operator delete(__p[0]);
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_profileID forKey:@"profileID"];
  [v4 encodeObject:self->_name forKey:@"name"];
}

- (MIDICIProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MIDICIProfile;
  v5 = [(MIDICIProfile *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"profileID"];
    profileID = v5->_profileID;
    v5->_profileID = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  return [(NSData *)self->_profileID isEqualToData:*((void *)a3 + 2)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)description
{
  return @"MIDI-CI Profile";
}

@end