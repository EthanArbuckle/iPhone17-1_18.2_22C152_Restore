@interface SHMediaLibraryGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualGroup:(id)a3;
- (BOOL)validIdentifier:(id)a3;
- (NSArray)tracksToSave;
- (NSMutableArray)mutableTracksToSave;
- (NSString)identifier;
- (SHMediaLibraryGroup)initWithCoder:(id)a3;
- (SHMediaLibraryGroup)initWithIdentifier:(id)a3;
- (SHMediaLibraryGroup)initWithIdentifier:(id)a3 metadata:(id)a4;
- (SHMediaLibraryGroup)initWithManagedGroup:(id)a3;
- (SHMediaLibraryItemMetadata)metadata;
- (id)_initWithIdentifier:(id)a3 metadata:(id)a4 tracksToSave:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)addTracks:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeTracks:(id)a3;
- (void)setMutableTracksToSave:(id)a3;
@end

@implementation SHMediaLibraryGroup

- (SHMediaLibraryGroup)initWithIdentifier:(id)a3
{
  return (SHMediaLibraryGroup *)[(SHMediaLibraryGroup *)self _initWithIdentifier:a3 metadata:0 tracksToSave:MEMORY[0x263EFFA68]];
}

- (SHMediaLibraryGroup)initWithIdentifier:(id)a3 metadata:(id)a4
{
  return (SHMediaLibraryGroup *)[(SHMediaLibraryGroup *)self _initWithIdentifier:a3 metadata:a4 tracksToSave:MEMORY[0x263EFFA68]];
}

- (SHMediaLibraryGroup)initWithManagedGroup:(id)a3
{
  id v4 = a3;
  v5 = [v4 metadata];
  v6 = [v5 data];

  if (v6)
  {
    v7 = [SHMediaLibraryItemMetadata alloc];
    v8 = [v4 metadata];
    v9 = [v8 data];
    v10 = [(SHMediaLibraryItemMetadata *)v7 initWithEncodedSystemData:v9];
  }
  else
  {
    v10 = 0;
  }
  v11 = [v4 syncID];
  v12 = [(SHMediaLibraryGroup *)self _initWithIdentifier:v11 metadata:v10 tracksToSave:MEMORY[0x263EFFA68]];

  return v12;
}

- (id)_initWithIdentifier:(id)a3 metadata:(id)a4 tracksToSave:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SHMediaLibraryGroup;
  v11 = [(SHMediaLibraryGroup *)&v22 init];
  v12 = v11;
  if (v11)
  {
    if (![(SHMediaLibraryGroup *)v11 validIdentifier:v8])
    {
      v18 = (void *)MEMORY[0x263EFF940];
      uint64_t v19 = *MEMORY[0x263EFF4A0];
      v20 = [NSString stringWithFormat:@"%@ is not a valid identifier.", v8];
      id v21 = [v18 exceptionWithName:v19 reason:v20 userInfo:0];

      objc_exception_throw(v21);
    }
    uint64_t v13 = [v8 precomposedStringWithCanonicalMapping];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    objc_storeStrong((id *)&v12->_metadata, a4);
    uint64_t v15 = [v10 mutableCopy];
    mutableTracksToSave = v12->_mutableTracksToSave;
    v12->_mutableTracksToSave = (NSMutableArray *)v15;
  }
  return v12;
}

- (NSArray)tracksToSave
{
  v2 = [(SHMediaLibraryGroup *)self mutableTracksToSave];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)addTracks:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v10 = [v9 associatedGroupIdentifier];

        if (v10)
        {
          v14 = (void *)MEMORY[0x263EFF940];
          uint64_t v15 = *MEMORY[0x263EFF4A0];
          v16 = NSString;
          v17 = [v9 identifier];
          v18 = [v9 associatedGroupIdentifier];
          uint64_t v19 = [v16 stringWithFormat:@"Track with identifier %@ is already associated to a group (%@), try removing it first.", v17, v18, (void)v21];
          id v20 = [v14 exceptionWithName:v15 reason:v19 userInfo:0];

          objc_exception_throw(v20);
        }
        v11 = [(SHMediaLibraryGroup *)self identifier];
        [v9 setAssociatedGroupIdentifier:v11];

        v12 = [(SHMediaLibraryGroup *)self mutableTracksToSave];
        uint64_t v13 = (void *)[v9 copy];
        [v12 addObject:v13];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }
}

- (void)removeTracks:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v10 = [v9 associatedGroupIdentifier];

        if (!v10)
        {
          uint64_t v13 = (void *)MEMORY[0x263EFF940];
          uint64_t v14 = *MEMORY[0x263EFF4A0];
          uint64_t v15 = NSString;
          v16 = [v9 identifier];
          v17 = [v15 stringWithFormat:@"Track with identifier %@ cannot be removed, try adding it first.", v16];
          id v18 = [v13 exceptionWithName:v14 reason:v17 userInfo:0];

          objc_exception_throw(v18);
        }
        [v9 setAssociatedGroupIdentifier:0];
        v11 = [(SHMediaLibraryGroup *)self mutableTracksToSave];
        v12 = (void *)[v9 copy];
        [v11 addObject:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
}

- (SHMediaLibraryGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SHMediaLibraryGroup;
  uint64_t v5 = [(SHMediaLibraryGroup *)&v19 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x22A61F6E0]();
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLibraryGroupIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLibraryGroupMetadata"];
    if (v9)
    {
      id v10 = [[SHMediaLibraryItemMetadata alloc] initWithEncodedSystemData:v9];
      metadata = v5->_metadata;
      v5->_metadata = v10;
    }
    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"SHMediaLibraryGroupTracksToSave"];
    uint64_t v16 = [v15 mutableCopy];
    mutableTracksToSave = v5->_mutableTracksToSave;
    v5->_mutableTracksToSave = (NSMutableArray *)v16;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = (void *)MEMORY[0x22A61F6E0]();
  [v7 encodeObject:self->_identifier forKey:@"SHLibraryGroupIdentifier"];
  uint64_t v5 = [(SHMediaLibraryItemMetadata *)self->_metadata encodedSystemData];
  [v7 encodeObject:v5 forKey:@"SHLibraryGroupMetadata"];

  uint64_t v6 = [(SHMediaLibraryGroup *)self tracksToSave];
  [v7 encodeObject:v6 forKey:@"SHMediaLibraryGroupTracksToSave"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = +[SHMediaLibraryGroup allocWithZone:](SHMediaLibraryGroup, "allocWithZone:");
  uint64_t v6 = [(SHMediaLibraryGroup *)self identifier];
  id v7 = (void *)[v6 copyWithZone:a3];
  id v8 = [(SHMediaLibraryGroup *)self metadata];
  id v9 = (void *)[v8 copyWithZone:a3];
  id v10 = [(SHMediaLibraryGroup *)self tracksToSave];
  v11 = (void *)[v10 copyWithZone:a3];
  id v12 = [(SHMediaLibraryGroup *)v5 _initWithIdentifier:v7 metadata:v9 tracksToSave:v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SHMediaLibraryGroup *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(SHMediaLibraryGroup *)self isEqualGroup:v4];
  }

  return v5;
}

- (BOOL)isEqualGroup:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SHMediaLibraryGroup *)self identifier];
  uint64_t v6 = [v4 identifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(SHMediaLibraryGroup *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)validIdentifier:(id)a3
{
  return [a3 length] != 0;
}

- (SHMediaLibraryItemMetadata)metadata
{
  return self->_metadata;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSMutableArray)mutableTracksToSave
{
  return self->_mutableTracksToSave;
}

- (void)setMutableTracksToSave:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableTracksToSave, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end