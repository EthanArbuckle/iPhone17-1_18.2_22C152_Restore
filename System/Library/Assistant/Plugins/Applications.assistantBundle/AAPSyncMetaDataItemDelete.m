@interface AAPSyncMetaDataItemDelete
+ (BOOL)supportsSecureCoding;
- (AAPSyncAnchor)anchor;
- (AAPSyncMetaDataItemDelete)init;
- (AAPSyncMetaDataItemDelete)initWithAppId:(id)a3 anchor:(id)a4;
- (AAPSyncMetaDataItemDelete)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMetaDataItemDelete;
- (NSString)appId;
- (NSString)description;
- (id)scrapeAppInfo;
- (unint64_t)hash;
- (void)_validate;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AAPSyncMetaDataItemDelete

- (AAPSyncMetaDataItemDelete)initWithAppId:(id)a3 anchor:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AAPSyncMetaDataItemDelete;
  v6 = [(AAPSyncMetaDataItemDelete *)&v8 init];
  if (v6)
  {
    v6->_appId = (NSString *)[a3 copy];
    v6->_anchor = (AAPSyncAnchor *)[a4 copy];
    [(AAPSyncMetaDataItemDelete *)v6 _validate];
  }
  return v6;
}

- (AAPSyncMetaDataItemDelete)init
{
  return [(AAPSyncMetaDataItemDelete *)self initWithAppId:0 anchor:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AAPSyncMetaDataItemDelete;
  [(AAPSyncMetaDataItemDelete *)&v3 dealloc];
}

- (void)_validate
{
  if (!self->_appId) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"AAPSyncMetaDataItemDelete.m" lineNumber:53 description:@"appId cannot be nil"];
  }
  if (!self->_anchor) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"AAPSyncMetaDataItemDelete.m" lineNumber:54 description:@"anchor cannot be nil"];
  }
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"AAPSyncMetaDataItemDelete.m", 59, @"appId must be a %@", v4 object file lineNumber description];
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"AAPSyncMetaDataItemDelete.m", 60, @"anchor must be a %@", v5 object file lineNumber description];
  }
}

- (id)scrapeAppInfo
{
  id v3 = objc_alloc_init((Class)SAAppInfo);
  [v3 setIdentifier:AAPSyncInfoIdentifierForAppId((uint64_t)self->_appId)];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAPSyncMetaDataItemDelete)initWithCoder:(id)a3
{
  id v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"appId"];
  id v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"anchor"];

  return [(AAPSyncMetaDataItemDelete *)self initWithAppId:v5 anchor:v6];
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_appId forKey:@"appId"];
  anchor = self->_anchor;

  [a3 encodeObject:anchor forKey:@"anchor"];
}

- (BOOL)isMetaDataItemDelete
{
  return 1;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_appId hash];
  return [(AAPSyncAnchor *)self->_anchor hash] + 37 * v3 + 17797;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v3 = self;
  if (self == a3)
  {
    LOBYTE(self) = self != 0;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      LODWORD(self) = -[NSString isEqualToString:](v3->_appId, "isEqualToString:", [a3 appId]);
      if (self)
      {
        anchor = v3->_anchor;
        id v7 = [a3 anchor];
        LOBYTE(self) = [(AAPSyncAnchor *)anchor isEqualToAnchor:v7];
      }
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }
  return (char)self;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@:%p appId='%@' anchor=%@>", objc_opt_class(), self, self->_appId, self->_anchor];
}

- (NSString)appId
{
  return self->_appId;
}

- (AAPSyncAnchor)anchor
{
  return self->_anchor;
}

@end