@interface MPAVOutputDeviceDescription
- (BOOL)isEqual:(id)a3;
- (MPAVOutputDeviceDescription)initWithDeviceType:(int64_t)a3 deviceSubtype:(int64_t)a4 uid:(id)a5;
- (MPAVOutputDeviceDescription)initWithDeviceType:(int64_t)a3 deviceSubtype:(int64_t)a4 uid:(id)a5 modelID:(id)a6;
- (NSString)modelID;
- (NSString)uid;
- (id)description;
- (int64_t)routeSubtype;
- (int64_t)routeType;
- (unint64_t)hash;
@end

@implementation MPAVOutputDeviceDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelID, 0);

  objc_storeStrong((id *)&self->_uid, 0);
}

- (NSString)modelID
{
  return self->_modelID;
}

- (NSString)uid
{
  return self->_uid;
}

- (int64_t)routeSubtype
{
  return self->_routeSubtype;
}

- (int64_t)routeType
{
  return self->_routeType;
}

- (unint64_t)hash
{
  int64_t v3 = self->_routeSubtype ^ self->_routeType;
  NSUInteger v4 = v3 ^ [(NSString *)self->_uid hash];
  return v4 ^ [(NSString *)self->_modelID hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (MPAVOutputDeviceDescription *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(MPAVOutputDeviceDescription *)v4 uid];
      if ([v5 isEqualToString:self->_uid]
        && [(MPAVOutputDeviceDescription *)v4 routeSubtype] == self->_routeSubtype
        && [(MPAVOutputDeviceDescription *)v4 routeType] == self->_routeType)
      {
        v6 = [(MPAVOutputDeviceDescription *)v4 modelID];
        char v7 = [v6 isEqualToString:self->_modelID];
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MPAVOutputDeviceDescription *)self uid];
  unint64_t v6 = [(MPAVOutputDeviceDescription *)self routeType];
  if (v6 > 3) {
    char v7 = @"Undefined";
  }
  else {
    char v7 = off_1E57F2708[v6];
  }
  unint64_t v8 = [(MPAVOutputDeviceDescription *)self routeSubtype];
  if (v8 > 0x1B) {
    v9 = @"Undefined";
  }
  else {
    v9 = off_1E57F2628[v8];
  }
  v10 = v9;
  v11 = [v3 stringWithFormat:@"<%@: %p uid=%@ type=%@ subtype=%@ modelID=%@>", v4, self, v5, v7, v10, self->_modelID];

  return v11;
}

- (MPAVOutputDeviceDescription)initWithDeviceType:(int64_t)a3 deviceSubtype:(int64_t)a4 uid:(id)a5 modelID:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)MPAVOutputDeviceDescription;
  v13 = [(MPAVOutputDeviceDescription *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_routeType = a3;
    v13->_routeSubtype = a4;
    objc_storeStrong((id *)&v13->_uid, a5);
    objc_storeStrong((id *)&v14->_modelID, a6);
  }

  return v14;
}

- (MPAVOutputDeviceDescription)initWithDeviceType:(int64_t)a3 deviceSubtype:(int64_t)a4 uid:(id)a5
{
  return [(MPAVOutputDeviceDescription *)self initWithDeviceType:a3 deviceSubtype:a4 uid:a5 modelID:0];
}

@end