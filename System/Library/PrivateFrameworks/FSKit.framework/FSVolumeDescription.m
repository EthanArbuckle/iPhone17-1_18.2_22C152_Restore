@interface FSVolumeDescription
+ (BOOL)supportsSecureCoding;
+ (id)volumeDescriptionWithID:(id)a3 name:(id)a4 state:(int64_t)a5;
- (FSFileName)volumeName;
- (FSVolumeDescription)initWithCoder:(id)a3;
- (FSVolumeDescription)initWithID:(id)a3 name:(id)a4 state:(int64_t)a5;
- (FSVolumeIdentifier)volumeID;
- (id)description;
- (int64_t)volumeState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FSVolumeDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  volumeID = self->_volumeID;
  id v5 = a3;
  [v5 encodeObject:volumeID forKey:@"FSVolumeDescription.volumeID"];
  [v5 encodeObject:self->_volumeName forKey:@"FSVolumeDescription.volumeName"];
  [v5 encodeInteger:self->_volumeState forKey:@"FSVolumeDescription.volumeState"];
}

- (FSVolumeDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FSVolumeDescription;
  id v5 = [(FSVolumeDescription *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSVolumeDescription.volumeID"];
    volumeID = v5->_volumeID;
    v5->_volumeID = (FSVolumeIdentifier *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FSVolumeDescription.volumeName"];
    volumeName = v5->_volumeName;
    v5->_volumeName = (FSFileName *)v8;

    v5->_volumeState = (int)[v4 decodeIntegerForKey:@"FSVolumeDescription.volumeState"];
  }

  return v5;
}

- (FSVolumeDescription)initWithID:(id)a3 name:(id)a4 state:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FSVolumeDescription;
  v10 = [(FSVolumeDescription *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    volumeID = v10->_volumeID;
    v10->_volumeID = (FSVolumeIdentifier *)v11;

    if (v9
      && ([v9 string],
          v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [v13 isEqualToString:&stru_26FFF08C0],
          v13,
          !v14))
    {
      v15 = (FSFileName *)[v9 copy];
    }
    else
    {
      v15 = [[FSFileName alloc] initWithString:&stru_26FFF08C0];
    }
    volumeName = v10->_volumeName;
    v10->_volumeName = v15;

    v10->_volumeState = a5;
  }

  return v10;
}

+ (id)volumeDescriptionWithID:(id)a3 name:(id)a4 state:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithID:v9 name:v8 state:a5];

  return v10;
}

- (id)description
{
  volumeID = self->_volumeID;
  if (volumeID)
  {
    id v4 = [NSString stringWithFormat:@" ID (%@)", volumeID];
  }
  else
  {
    id v4 = &stru_26FFF08C0;
  }
  if (self->_volumeName)
  {
    id v5 = [NSString stringWithFormat:@" name (%@)", self->_volumeName];
  }
  else
  {
    id v5 = &stru_26FFF08C0;
  }
  if (self->_volumeState)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" state (%ld)", self->_volumeState);
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = &stru_26FFF08C0;
  }
  v7 = [NSString stringWithFormat:@"FSVolumeDescription%@%@%@", v4, v5, v6];

  return v7;
}

- (FSVolumeIdentifier)volumeID
{
  return (FSVolumeIdentifier *)objc_getProperty(self, a2, 8, 1);
}

- (FSFileName)volumeName
{
  return (FSFileName *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)volumeState
{
  return self->_volumeState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeName, 0);
  objc_storeStrong((id *)&self->_volumeID, 0);
}

@end