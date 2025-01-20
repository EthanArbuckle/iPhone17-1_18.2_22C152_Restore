@interface CXCallDirectoryStoreExtension
+ (BOOL)supportsSecureCoding;
- (CXCallDirectoryStoreExtension)initWithCoder:(id)a3;
- (NSDate)stateLastModified;
- (NSString)identifier;
- (id)description;
- (int64_t)primaryKey;
- (int64_t)priority;
- (int64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPrimaryKey:(int64_t)a3;
- (void)setPriority:(int64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setStateLastModified:(id)a3;
@end

@implementation CXCallDirectoryStoreExtension

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CXCallDirectoryStoreExtension *)self identifier];
  int64_t v6 = [(CXCallDirectoryStoreExtension *)self primaryKey];
  int64_t v7 = [(CXCallDirectoryStoreExtension *)self priority];
  int64_t v8 = [(CXCallDirectoryStoreExtension *)self state];
  v9 = [(CXCallDirectoryStoreExtension *)self stateLastModified];
  v10 = [v3 stringWithFormat:@"<%@ %p: identifier=%@ primaryKey=%lld priority=%lld state=%ld stateLastModified=%@>", v4, self, v5, v6, v7, v8, v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCallDirectoryStoreExtension)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallDirectoryStoreExtension *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    int64_t v7 = NSStringFromSelector(sel_identifier);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    v10 = NSStringFromSelector(sel_primaryKey);
    v5->_primaryKey = [v4 decodeInt64ForKey:v10];

    v11 = NSStringFromSelector(sel_priority);
    v5->_priority = [v4 decodeInt64ForKey:v11];

    v12 = NSStringFromSelector(sel_state);
    v5->_state = [v4 decodeIntegerForKey:v12];

    uint64_t v13 = objc_opt_class();
    v14 = NSStringFromSelector(sel_stateLastModified);
    uint64_t v15 = [v4 decodeObjectOfClass:v13 forKey:v14];
    stateLastModified = v5->_stateLastModified;
    v5->_stateLastModified = (NSDate *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallDirectoryStoreExtension *)self identifier];
  uint64_t v6 = NSStringFromSelector(sel_identifier);
  [v4 encodeObject:v5 forKey:v6];

  int64_t v7 = [(CXCallDirectoryStoreExtension *)self primaryKey];
  uint64_t v8 = NSStringFromSelector(sel_primaryKey);
  [v4 encodeInt64:v7 forKey:v8];

  int64_t v9 = [(CXCallDirectoryStoreExtension *)self priority];
  v10 = NSStringFromSelector(sel_priority);
  [v4 encodeInt64:v9 forKey:v10];

  int64_t v11 = [(CXCallDirectoryStoreExtension *)self state];
  v12 = NSStringFromSelector(sel_state);
  [v4 encodeInteger:v11 forKey:v12];

  id v14 = [(CXCallDirectoryStoreExtension *)self stateLastModified];
  uint64_t v13 = NSStringFromSelector(sel_stateLastModified);
  [v4 encodeObject:v14 forKey:v13];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)primaryKey
{
  return self->_primaryKey;
}

- (void)setPrimaryKey:(int64_t)a3
{
  self->_primaryKey = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSDate)stateLastModified
{
  return self->_stateLastModified;
}

- (void)setStateLastModified:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLastModified, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end