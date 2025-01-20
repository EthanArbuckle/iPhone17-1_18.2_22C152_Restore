@interface FPKnownFolderPathMatchingLocation
+ (BOOL)supportsSecureCoding;
- (FPKnownFolderPathMatchingLocation)initWithCoder:(id)a3;
- (FPKnownFolderPathMatchingLocation)initWithParentItemIdentifier:(id)a3 filename:(id)a4;
- (NSString)filename;
- (NSString)parentItemIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FPKnownFolderPathMatchingLocation

- (FPKnownFolderPathMatchingLocation)initWithParentItemIdentifier:(id)a3 filename:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FPKnownFolderPathMatchingLocation;
  v8 = [(FPKnownFolderPathMatchingLocation *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    parentItemIdentifier = v8->_parentItemIdentifier;
    v8->_parentItemIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    filename = v8->_filename;
    v8->_filename = (NSString *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FPKnownFolderPathMatchingLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPKnownFolderPathMatchingLocation;
  v5 = [(FPKnownFolderPathMatchingLocation *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_parentItemIdentifier"];
    parentItemIdentifier = v5->_parentItemIdentifier;
    v5->_parentItemIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_filename"];
    filename = v5->_filename;
    v5->_filename = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  parentItemIdentifier = self->_parentItemIdentifier;
  id v5 = a3;
  [v5 encodeObject:parentItemIdentifier forKey:@"_parentItemIdentifier"];
  [v5 encodeObject:self->_filename forKey:@"_filename"];
}

- (id)description
{
  v2 = NSString;
  parentItemIdentifier = self->_parentItemIdentifier;
  id v4 = [(NSString *)self->_filename fp_obfuscatedPath];
  id v5 = [v2 stringWithFormat:@"<p:%@ n:\"%@\">", parentItemIdentifier, v4];

  return v5;
}

- (NSString)parentItemIdentifier
{
  return self->_parentItemIdentifier;
}

- (NSString)filename
{
  return self->_filename;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);

  objc_storeStrong((id *)&self->_parentItemIdentifier, 0);
}

@end