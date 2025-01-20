@interface HKMCSampleInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isDeleted;
- (BOOL)isEqual:(id)a3;
- (HKMCSampleInfo)initWithAnchor:(int64_t)a3 UUID:(id)a4 deleted:(BOOL)a5;
- (HKMCSampleInfo)initWithCoder:(id)a3;
- (NSUUID)UUID;
- (id)description;
- (int64_t)anchor;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMCSampleInfo

- (HKMCSampleInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
  if (v5)
  {
    self = -[HKMCSampleInfo initWithAnchor:UUID:deleted:](self, "initWithAnchor:UUID:deleted:", [v4 decodeInt64ForKey:@"Anchor"], v5, objc_msgSend(v4, "decodeBoolForKey:", @"Deleted"));
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (HKMCSampleInfo)initWithAnchor:(int64_t)a3 UUID:(id)a4 deleted:(BOOL)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKMCSampleInfo;
  v9 = [(HKMCSampleInfo *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_anchor = a3;
    uint64_t v11 = [v8 copy];
    UUID = v10->_UUID;
    v10->_UUID = (NSUUID *)v11;

    v10->_deleted = a5;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [NSNumber numberWithLongLong:self->_anchor];
  v5 = (void *)v4;
  if (self->_deleted) {
    v6 = @" (deleted)";
  }
  else {
    v6 = &stru_26D7C7A88;
  }
  v7 = [v3 stringWithFormat:@"<%@ %@ %@>", v4, self->_UUID, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t anchor = self->_anchor;
  id v5 = a3;
  [v5 encodeInt64:anchor forKey:@"Anchor"];
  [v5 encodeObject:self->_UUID forKey:@"UUID"];
  [v5 encodeBool:self->_deleted forKey:@"Deleted"];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMCSampleInfo *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      BOOL v8 = self->_anchor == v5->_anchor
        && ((UUID = self->_UUID, v7 = v5->_UUID, UUID == v7) || v7 && -[NSUUID isEqual:](UUID, "isEqual:"))
        && self->_deleted == v5->_deleted;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  int64_t anchor = self->_anchor;
  return [(NSUUID *)self->_UUID hash] ^ anchor ^ self->_deleted;
}

- (int64_t)anchor
{
  return self->_anchor;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (void).cxx_destruct
{
}

@end