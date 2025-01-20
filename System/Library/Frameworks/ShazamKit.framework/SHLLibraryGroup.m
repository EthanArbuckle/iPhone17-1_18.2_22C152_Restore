@interface SHLLibraryGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualGroup:(id)a3;
- (BOOL)validIdentifier:(id)a3;
- (NSMutableArray)tracksToSave;
- (NSString)identifier;
- (SHLLibraryGroup)initWithCoder:(id)a3;
- (SHLLibraryGroup)initWithIdentifier:(id)a3;
- (SHLLibraryGroup)initWithIdentifier:(id)a3 metadata:(id)a4;
- (SHLLibraryGroup)initWithLibraryGroup:(id)a3;
- (SHLLibraryItemMetadata)metadata;
- (id)_initWithIdentifier:(id)a3 metadata:(id)a4 tracksToSave:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)commonInitWithIdentifier:(id)a3 metadata:(id)a4 tracksToSave:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setTracksToSave:(id)a3;
@end

@implementation SHLLibraryGroup

- (SHLLibraryGroup)initWithIdentifier:(id)a3
{
  return (SHLLibraryGroup *)[(SHLLibraryGroup *)self _initWithIdentifier:a3 metadata:0 tracksToSave:&__NSArray0__struct];
}

- (SHLLibraryGroup)initWithIdentifier:(id)a3 metadata:(id)a4
{
  return (SHLLibraryGroup *)[(SHLLibraryGroup *)self _initWithIdentifier:a3 metadata:a4 tracksToSave:&__NSArray0__struct];
}

- (id)_initWithIdentifier:(id)a3 metadata:(id)a4 tracksToSave:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SHLLibraryGroup;
  v11 = [(SHLLibraryGroup *)&v14 init];
  v12 = v11;
  if (v11) {
    [(SHLLibraryGroup *)v11 commonInitWithIdentifier:v8 metadata:v9 tracksToSave:v10];
  }

  return v12;
}

- (void)commonInitWithIdentifier:(id)a3 metadata:(id)a4 tracksToSave:(id)a5
{
  id v8 = (NSString *)a3;
  id v9 = (SHLLibraryItemMetadata *)a4;
  id v18 = a5;
  if (![(SHLLibraryGroup *)self validIdentifier:v8])
  {
    v16 = +[NSString stringWithFormat:@"%@ is not a valid identifier.", v8];
    id v17 = +[NSException shl_exceptionWithName:NSInvalidArgumentException reason:v16];

    objc_exception_throw(v17);
  }
  identifier = self->_identifier;
  self->_identifier = v8;
  v11 = v8;

  metadata = self->_metadata;
  self->_metadata = v9;
  v13 = v9;

  objc_super v14 = (NSMutableArray *)[v18 mutableCopy];
  tracksToSave = self->_tracksToSave;
  self->_tracksToSave = v14;
}

- (SHLLibraryGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLLibraryGroupIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLLibraryGroupMetadata"];
  if (v6) {
    v7 = [[SHLLibraryItemMetadata alloc] initWithEncodedSystemData:v6];
  }
  else {
    v7 = 0;
  }
  uint64_t v8 = objc_opt_class();
  id v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"SHLLibraryGroupTracksToSave"];
  v11 = [(SHLLibraryGroup *)self _initWithIdentifier:v5 metadata:v7 tracksToSave:v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"SHLLibraryGroupIdentifier"];
  v6 = [(SHLLibraryItemMetadata *)self->_metadata encodedSystemData];
  [v5 encodeObject:v6 forKey:@"SHLLibraryGroupMetadata"];

  id v7 = [(NSMutableArray *)self->_tracksToSave copy];
  [v5 encodeObject:v7 forKey:@"SHLLibraryGroupTracksToSave"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHLLibraryGroup)initWithLibraryGroup:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SHLLibraryGroup;
  id v5 = [(SHLLibraryGroup *)&v16 init];
  if (v5)
  {
    v6 = [v4 identifier];
    id v7 = (NSString *)[v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = v7;

    id v9 = [v4 metadata];
    id v10 = (SHLLibraryItemMetadata *)[v9 copy];
    metadata = v5->_metadata;
    v5->_metadata = v10;

    v12 = [v4 tracksToSave];
    v13 = (NSMutableArray *)[v12 copy];
    tracksToSave = v5->_tracksToSave;
    v5->_tracksToSave = v13;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[SHLLibraryGroup allocWithZone:a3];

  return [(SHLLibraryGroup *)v4 initWithLibraryGroup:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[SHLMutableLibraryGroup allocWithZone:a3];

  return [(SHLLibraryGroup *)v4 initWithLibraryGroup:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SHLLibraryGroup *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(SHLLibraryGroup *)self isEqualGroup:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualGroup:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SHLLibraryGroup *)self identifier];
  v6 = [v4 identifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(SHLLibraryGroup *)self identifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)validIdentifier:(id)a3
{
  return [a3 length] != 0;
}

- (SHLLibraryItemMetadata)metadata
{
  return self->_metadata;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSMutableArray)tracksToSave
{
  return self->_tracksToSave;
}

- (void)setTracksToSave:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracksToSave, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end