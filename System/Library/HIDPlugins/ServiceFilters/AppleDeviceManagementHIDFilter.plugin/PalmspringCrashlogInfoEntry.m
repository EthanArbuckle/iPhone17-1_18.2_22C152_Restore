@interface PalmspringCrashlogInfoEntry
- (NSString)name;
- (PalmspringCrashlogInfoEntry)initWithUniqueID:(unsigned __int8)a3 type:(unsigned __int8)a4 headerAndRawBlobSize:(unsigned int)a5 name:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)headerAndRawBlobSize;
- (unsigned)type;
- (unsigned)uniqueID;
@end

@implementation PalmspringCrashlogInfoEntry

- (PalmspringCrashlogInfoEntry)initWithUniqueID:(unsigned __int8)a3 type:(unsigned __int8)a4 headerAndRawBlobSize:(unsigned int)a5 name:(id)a6
{
  id v10 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PalmspringCrashlogInfoEntry;
  v11 = [(PalmspringCrashlogInfoEntry *)&v17 init];
  v12 = v11;
  if (v11)
  {
    v11->_uniqueID = a3;
    v11->_type = a4;
    v11->_headerAndRawBlobSize = a5;
    v13 = (NSString *)[v10 copy];
    name = v12->_name;
    v12->_name = v13;

    v15 = v12;
  }

  return v12;
}

- (id)description
{
  return +[NSString stringWithFormat:@"(Palmspring Crashlog Info Entry: [ID: %d, type: %d, header+raw blob size: %d, name: %@])", self->_uniqueID, self->_type, self->_headerAndRawBlobSize, self->_name];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[PalmspringCrashlogInfoEntry allocWithZone:a3];
  uint64_t uniqueID = self->_uniqueID;
  uint64_t type = self->_type;
  uint64_t headerAndRawBlobSize = self->_headerAndRawBlobSize;
  name = self->_name;

  return [(PalmspringCrashlogInfoEntry *)v4 initWithUniqueID:uniqueID type:type headerAndRawBlobSize:headerAndRawBlobSize name:name];
}

- (unsigned)uniqueID
{
  return self->_uniqueID;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)headerAndRawBlobSize
{
  return self->_headerAndRawBlobSize;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
}

@end