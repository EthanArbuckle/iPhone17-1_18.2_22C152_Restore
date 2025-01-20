@interface MIDICIDeviceInfo
+ (BOOL)supportsSecureCoding;
+ (id)description;
- (BOOL)isEqual:(id)a3;
- (MIDICIDeviceIdentification)asDeviceIDStruct;
- (MIDICIDeviceInfo)initWithCoder:(id)a3;
- (MIDICIDeviceInfo)initWithDestination:(MIDIEntityRef)midiDestination manufacturer:(NSData *)manufacturer family:(NSData *)family model:(NSData *)modelNumber revision:(NSData *)revisionLevel;
- (MIDICIDeviceInfo)initWithDestination:(unsigned int)a3 deviceID:(MIDICIDeviceIdentification *)a4;
- (MIDIEndpointRef)midiDestination;
- (NSData)family;
- (NSData)manufacturerID;
- (NSData)modelNumber;
- (NSData)revisionLevel;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MIDICIDeviceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_family, 0);

  objc_storeStrong((id *)&self->_manufacturerID, 0);
}

- (MIDIEndpointRef)midiDestination
{
  return self->_midiDestination;
}

- (NSData)revisionLevel
{
  return self->_revision;
}

- (NSData)modelNumber
{
  return self->_model;
}

- (NSData)family
{
  return self->_family;
}

- (NSData)manufacturerID
{
  return self->_manufacturerID;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 midiDestination] == self->_midiDestination)
  {
    v5 = [v4 manufacturerID];
    if ([v5 isEqualToData:self->_manufacturerID])
    {
      v6 = [v4 family];
      if ([v6 isEqualToData:self->_family])
      {
        v7 = [v4 modelNumber];
        if ([v7 isEqualToData:self->_model])
        {
          v8 = [v4 revisionLevel];
          char v9 = [v8 isEqualToData:self->_revision];
        }
        else
        {
          char v9 = 0;
        }
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_manufacturerID forKey:@"manufacturerID"];
  [v4 encodeObject:self->_family forKey:@"family"];
  [v4 encodeObject:self->_model forKey:@"model"];
  [v4 encodeObject:self->_revision forKey:@"revision"];
  [v4 encodeInt32:self->_midiDestination forKey:@"midiDestination"];
}

- (MIDICIDeviceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MIDICIDeviceInfo;
  v5 = [(MIDICIDeviceInfo *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manufacturerID"];
    manufacturerID = v5->_manufacturerID;
    v5->_manufacturerID = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"family"];
    family = v5->_family;
    v5->_family = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"model"];
    model = v5->_model;
    v5->_model = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"revision"];
    revision = v5->_revision;
    v5->_revision = (NSData *)v12;

    v5->_midiDestination = [v4 decodeInt32ForKey:@"midiDestination"];
  }

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<MIDICIDeviceID(%p) manufacturer: %@, family: %@, model: %@, revision: %@>", self, self->_manufacturerID, self->_family, self->_model, self->_revision];
}

- (MIDICIDeviceIdentification)asDeviceIDStruct
{
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  manufacturerID = self->_manufacturerID;
  if (manufacturerID && [(NSData *)manufacturerID length] == 3) {
    memcpy(&v9, [(NSData *)self->_manufacturerID bytes], [(NSData *)self->_manufacturerID length]);
  }
  family = self->_family;
  if (family && [(NSData *)family length] == 2) {
    memcpy((char *)&v9 + 3, [(NSData *)self->_family bytes], [(NSData *)self->_family length]);
  }
  model = self->_model;
  if (model && [(NSData *)model length] == 2) {
    memcpy((char *)&v9 + 5, [(NSData *)self->_model bytes], [(NSData *)self->_model length]);
  }
  revision = self->_revision;
  if (revision && [(NSData *)revision length] == 4) {
    memcpy((char *)&v9 + 7, [(NSData *)self->_revision bytes], [(NSData *)self->_revision length]);
  }
  uint64_t v7 = v9;
  uint64_t v8 = v10;
  *(_DWORD *)&result.revisionLevel[1] = v8;
  *(_DWORD *)&result.reserved[1] = HIDWORD(v8);
  *(_WORD *)result.manufacturer = v7;
  result.manufacturer[2] = BYTE2(v7);
  *(_WORD *)result.family = *(_WORD *)((char *)&v7 + 3);
  *(_WORD *)result.modelNumber = *(_WORD *)((char *)&v7 + 5);
  result.revisionLevel[0] = HIBYTE(v7);
  return result;
}

- (MIDICIDeviceInfo)initWithDestination:(unsigned int)a3 deviceID:(MIDICIDeviceIdentification *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a4 length:3];
  uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a4->family length:2];
  uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a4->modelNumber length:2];
  uint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a4->revisionLevel length:4];
  v11 = [(MIDICIDeviceInfo *)self initWithDestination:v5 manufacturer:v7 family:v8 model:v9 revision:v10];

  return v11;
}

- (MIDICIDeviceInfo)initWithDestination:(MIDIEntityRef)midiDestination manufacturer:(NSData *)manufacturer family:(NSData *)family model:(NSData *)modelNumber revision:(NSData *)revisionLevel
{
  v13 = manufacturer;
  v14 = family;
  objc_super v15 = modelNumber;
  v16 = revisionLevel;
  if (!midiDestination
    || [(NSData *)v13 length] != 3
    || [(NSData *)v14 length] != 2
    || [(NSData *)v15 length] != 2
    || [(NSData *)v16 length] != 4)
  {
    goto LABEL_9;
  }
  v21.receiver = self;
  v21.super_class = (Class)MIDICIDeviceInfo;
  v17 = [(MIDICIDeviceInfo *)&v21 init];
  if (!v17)
  {
    self = 0;
LABEL_9:
    v19 = 0;
    goto LABEL_10;
  }
  v17->_midiDestination = midiDestination;
  p_isa = (id *)&v17->super.isa;
  objc_storeStrong((id *)&v17->_manufacturerID, manufacturer);
  objc_storeStrong(p_isa + 2, family);
  objc_storeStrong(p_isa + 3, modelNumber);
  objc_storeStrong(p_isa + 4, revisionLevel);
  self = p_isa;
  v19 = self;
LABEL_10:

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)description
{
  return @"MIDI-CI Device Info";
}

@end