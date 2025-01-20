@interface HDSyncEntityIdentifier
+ (BOOL)supportsSecureCoding;
+ (HDSyncEntityIdentifier)identifierWithSchema:(id)a3 entity:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (HDSyncEntityIdentifier)initWithCodableEntityIdentifier:(id)a3;
- (HDSyncEntityIdentifier)initWithCoder:(id)a3;
- (HDSyncEntityIdentifier)initWithEntityIdentifier:(int64_t)a3 schemaIdentifier:(id)a4;
- (NSString)schemaIdentifier;
- (id)codableEntityIdentifier;
- (id)description;
- (int64_t)entityIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDSyncEntityIdentifier

+ (HDSyncEntityIdentifier)identifierWithSchema:(id)a3 entity:(int64_t)a4
{
  id v5 = a3;
  v6 = [[HDSyncEntityIdentifier alloc] initWithEntityIdentifier:a4 schemaIdentifier:v5];

  return v6;
}

- (HDSyncEntityIdentifier)initWithEntityIdentifier:(int64_t)a3 schemaIdentifier:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDSyncEntityIdentifier;
  v7 = [(HDSyncEntityIdentifier *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_entityIdentifier = a3;
    uint64_t v9 = [v6 copy];
    schemaIdentifier = v8->_schemaIdentifier;
    v8->_schemaIdentifier = (NSString *)v9;
  }
  return v8;
}

- (HDSyncEntityIdentifier)initWithCodableEntityIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 hasIdentifier])
  {
    id v5 = [v4 schema];
    self = -[HDSyncEntityIdentifier initWithEntityIdentifier:schemaIdentifier:](self, "initWithEntityIdentifier:schemaIdentifier:", [v4 identifier], v5);

    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)codableEntityIdentifier
{
  v3 = objc_alloc_init(HDCodableEntityIdentifier);
  [(HDCodableEntityIdentifier *)v3 setSchema:self->_schemaIdentifier];
  [(HDCodableEntityIdentifier *)v3 setIdentifier:self->_entityIdentifier];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_entityIdentifier != v4[1]) {
    goto LABEL_6;
  }
  schemaIdentifier = self->_schemaIdentifier;
  id v6 = (NSString *)v4[2];
  if (schemaIdentifier == v6)
  {
    char v7 = 1;
    goto LABEL_7;
  }
  if (v6) {
    char v7 = -[NSString isEqualToString:](schemaIdentifier, "isEqualToString:");
  }
  else {
LABEL_6:
  }
    char v7 = 0;
LABEL_7:

  return v7;
}

- (unint64_t)hash
{
  return self->_entityIdentifier + [(NSString *)self->_schemaIdentifier hash];
}

- (id)description
{
  schemaIdentifier = (__CFString *)self->_schemaIdentifier;
  if (schemaIdentifier) {
    goto LABEL_2;
  }
  id v6 = (objc_class *)HDBuiltinSyncEntityClassForType(self->_entityIdentifier);
  if (!v6)
  {
    schemaIdentifier = (__CFString *)self->_schemaIdentifier;
LABEL_2:
    if (!schemaIdentifier) {
      schemaIdentifier = @"HDSyncEntityType";
    }
    id v4 = [NSString stringWithFormat:@"%@(%ld)", schemaIdentifier, self->_entityIdentifier];
    goto LABEL_5;
  }
  id v4 = NSStringFromClass(v6);
  if ([v4 hasPrefix:@"HD"])
  {
    uint64_t v7 = [v4 substringFromIndex:objc_msgSend(@"HD", "length")];

    id v4 = (void *)v7;
  }
  if ([v4 hasSuffix:@"SyncEntity"])
  {
    uint64_t v8 = [v4 substringToIndex:objc_msgSend(v4, "length") - objc_msgSend(@"SyncEntity", "length")];

    id v4 = (void *)v8;
  }
LABEL_5:

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDSyncEntityIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"schema"];

  uint64_t v7 = [(HDSyncEntityIdentifier *)self initWithEntityIdentifier:v5 schemaIdentifier:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t entityIdentifier = self->_entityIdentifier;
  id v5 = a3;
  [v5 encodeInteger:entityIdentifier forKey:@"identifier"];
  [v5 encodeObject:self->_schemaIdentifier forKey:@"schema"];
}

- (int64_t)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSString)schemaIdentifier
{
  return self->_schemaIdentifier;
}

- (void).cxx_destruct
{
}

@end