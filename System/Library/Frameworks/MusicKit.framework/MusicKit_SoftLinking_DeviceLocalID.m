@interface MusicKit_SoftLinking_DeviceLocalID
- (MusicKit_SoftLinking_DeviceLocalID)initWithValue:(int64_t)a3 databaseID:(id)a4;
- (NSString)databaseID;
- (id)description;
- (int64_t)value;
@end

@implementation MusicKit_SoftLinking_DeviceLocalID

- (int64_t)value
{
  return self->_value;
}

- (NSString)databaseID
{
  return self->_databaseID;
}

- (void).cxx_destruct
{
}

- (MusicKit_SoftLinking_DeviceLocalID)initWithValue:(int64_t)a3 databaseID:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MusicKit_SoftLinking_DeviceLocalID;
  v7 = [(MusicKit_SoftLinking_DeviceLocalID *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_value = a3;
    uint64_t v9 = [v6 copy];
    databaseID = v8->_databaseID;
    v8->_databaseID = (NSString *)v9;
  }
  return v8;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  objc_msgSend(v6, "appendFormat:", @"; value = \"%lld\"", self->_value);
  [v6 appendFormat:@"; databaseID = \"%@\"", self->_databaseID];
  [v6 appendString:@">"];

  return v6;
}

@end