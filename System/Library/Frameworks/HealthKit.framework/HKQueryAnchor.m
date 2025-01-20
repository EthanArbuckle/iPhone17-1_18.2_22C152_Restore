@interface HKQueryAnchor
+ (BOOL)supportsSecureCoding;
+ (id)_anchorWithRowid:(int64_t)a3;
+ (id)latestAnchor;
- (BOOL)isEqual:(id)a3;
- (HKQueryAnchor)initWithCoder:(id)a3;
- (NSString)_clientToken;
- (id)description;
- (int64_t)_rowid;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)_setClientToken:(id)a3;
- (void)_setRowid:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKQueryAnchor

+ (id)_anchorWithRowid:(int64_t)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[2] = a3;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t rowid = self->_rowid;
  id v5 = a3;
  [v5 encodeInt64:rowid forKey:@"rowid"];
  [v5 encodeObject:self->_clientToken forKey:@"clientToken"];
}

- (int64_t)_rowid
{
  return self->_rowid;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKQueryAnchor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (HKQueryAnchor *)objc_alloc_init((Class)objc_opt_class());

  if (v5)
  {
    v5->_int64_t rowid = [v4 decodeInt64ForKey:@"rowid"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientToken"];
    clientToken = v5->_clientToken;
    v5->_clientToken = (NSString *)v6;
  }
  return v5;
}

+ (id)latestAnchor
{
  return (id)[a1 _anchorWithRowid:0x7FFFFFFFFFFFFFFFLL];
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithLongLong:self->_rowid];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_clientToken hash] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKQueryAnchor *)a3;
  NSUInteger v5 = v4;
  if (v4 == self) {
    goto LABEL_9;
  }
  if (!v4) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_rowid != v5->_rowid) {
    goto LABEL_8;
  }
  clientToken = self->_clientToken;
  v7 = v5->_clientToken;
  if (clientToken == v7)
  {
LABEL_9:
    char v8 = 1;
    goto LABEL_10;
  }
  if (!v7)
  {
LABEL_8:
    char v8 = 0;
    goto LABEL_10;
  }
  char v8 = -[NSString isEqualToString:](clientToken, "isEqualToString:");
LABEL_10:

  return v8;
}

- (int64_t)compare:(id)a3
{
  int64_t rowid = self->_rowid;
  int64_t v4 = *((void *)a3 + 2);
  BOOL v5 = rowid < v4;
  int64_t v6 = rowid > v4;
  if (v5) {
    return -1;
  }
  else {
    return v6;
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = " ";
  clientToken = self->_clientToken;
  if (!clientToken) {
    BOOL v5 = "";
  }
  v7 = &stru_1EEC60288;
  if (clientToken) {
    v7 = (__CFString *)self->_clientToken;
  }
  return (id)[v3 stringWithFormat:@"<%@: %lld%s%@>", v4, self->_rowid, v5, v7];
}

- (void)_setRowid:(int64_t)a3
{
  self->_int64_t rowid = a3;
}

- (NSString)_clientToken
{
  return self->_clientToken;
}

- (void)_setClientToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end