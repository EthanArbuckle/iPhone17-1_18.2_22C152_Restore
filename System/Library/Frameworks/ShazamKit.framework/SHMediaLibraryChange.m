@interface SHMediaLibraryChange
+ (BOOL)supportsSecureCoding;
- (BOOL)isConflictingChange:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualChange:(id)a3;
- (NSIndexPath)indexPath;
- (SHMediaLibraryChange)initWithCoder:(id)a3;
- (SHMediaLibraryChange)initWithLibraryItem:(id)a3 changeType:(int64_t)a4;
- (SHMediaLibraryItem)libraryItem;
- (id)_initWithLibraryItem:(id)a3 changeType:(int64_t)a4 indexPath:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)changeType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SHMediaLibraryChange

- (SHMediaLibraryChange)initWithLibraryItem:(id)a3 changeType:(int64_t)a4
{
  return (SHMediaLibraryChange *)[(SHMediaLibraryChange *)self _initWithLibraryItem:a3 changeType:a4 indexPath:0];
}

- (id)_initWithLibraryItem:(id)a3 changeType:(int64_t)a4 indexPath:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SHMediaLibraryChange;
  v11 = [(SHMediaLibraryChange *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_libraryItem, a3);
    v12->_changeType = a4;
    objc_storeStrong((id *)&v12->_indexPath, a5);
  }

  return v12;
}

- (BOOL)isConflictingChange:(id)a3
{
  id v4 = a3;
  v5 = [(SHMediaLibraryChange *)self libraryItem];
  v6 = [v4 libraryItem];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    v8 = [(SHMediaLibraryChange *)self indexPath];

    if (v8)
    {
      id v9 = [(SHMediaLibraryChange *)self indexPath];
      id v10 = [v4 indexPath];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        BOOL v14 = 1;
        goto LABEL_11;
      }
    }
    int64_t v12 = [(SHMediaLibraryChange *)self changeType];
    if (v12 == 1)
    {
      uint64_t v13 = 3;
      goto LABEL_10;
    }
    if (v12 == 3)
    {
      uint64_t v13 = 1;
LABEL_10:
      BOOL v14 = [v4 changeType] == v13;
      goto LABEL_11;
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (SHMediaLibraryChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SHMediaLibraryChange;
  v5 = [(SHMediaLibraryChange *)&v15 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x22A61F6E0]();
    int v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    id v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"SHLibraryChangeCodingLibraryItem"];
    libraryItem = v5->_libraryItem;
    v5->_libraryItem = (SHMediaLibraryItem *)v10;

    v5->_changeType = [v4 decodeIntegerForKey:@"SHLibraryChangeCodingChangeType"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLibraryChangeCodingIndexPath"];
    indexPath = v5->_indexPath;
    v5->_indexPath = (NSIndexPath *)v12;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x22A61F6E0]();
  [v5 encodeObject:self->_libraryItem forKey:@"SHLibraryChangeCodingLibraryItem"];
  [v5 encodeInteger:self->_changeType forKey:@"SHLibraryChangeCodingChangeType"];
  [v5 encodeObject:self->_indexPath forKey:@"SHLibraryChangeCodingIndexPath"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[SHMediaLibraryChange allocWithZone:](SHMediaLibraryChange, "allocWithZone:");
  v6 = [(SHMediaLibraryChange *)self libraryItem];
  int v7 = (void *)[v6 copyWithZone:a3];
  int64_t v8 = [(SHMediaLibraryChange *)self changeType];
  id v9 = [(SHMediaLibraryChange *)self indexPath];
  uint64_t v10 = (void *)[v9 copyWithZone:a3];
  int v11 = [(SHMediaLibraryChange *)v5 initWithLibraryItem:v7 changeType:v8 indexPath:v10];

  return v11;
}

- (unint64_t)hash
{
  v3 = [(SHMediaLibraryChange *)self indexPath];

  id v4 = [(SHMediaLibraryChange *)self libraryItem];
  id v5 = [v4 identifier];
  uint64_t v6 = [v5 hash];
  unint64_t v7 = [(SHMediaLibraryChange *)self changeType] ^ v6;
  if (v3)
  {
    int64_t v8 = [(SHMediaLibraryChange *)self indexPath];
    v7 ^= [v8 hash];
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SHMediaLibraryChange *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(SHMediaLibraryChange *)self isEqualChange:v4];
  }

  return v5;
}

- (BOOL)isEqualChange:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SHMediaLibraryChange *)self indexPath];

  uint64_t v6 = [(SHMediaLibraryChange *)self libraryItem];
  unint64_t v7 = [v4 libraryItem];
  int v8 = [v6 isEqual:v7];
  if (!v5)
  {
    if (v8)
    {
      int64_t v13 = [(SHMediaLibraryChange *)self changeType];
      char v12 = v13 == [v4 changeType];
      goto LABEL_8;
    }
LABEL_7:
    char v12 = 0;
    goto LABEL_8;
  }
  if (!v8) {
    goto LABEL_7;
  }
  int64_t v9 = [(SHMediaLibraryChange *)self changeType];
  if (v9 != [v4 changeType]) {
    goto LABEL_7;
  }
  uint64_t v10 = [(SHMediaLibraryChange *)self indexPath];
  int v11 = [v4 indexPath];
  char v12 = [v10 isEqual:v11];

LABEL_8:
  return v12;
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(SHMediaLibraryChange *)self changeType];
  BOOL v5 = [(SHMediaLibraryChange *)self libraryItem];
  uint64_t v6 = [v5 identifier];
  unint64_t v7 = [(SHMediaLibraryChange *)self indexPath];
  int v8 = [v3 stringWithFormat:@"(%lu) %@ at index %@", v4, v6, v7];

  return v8;
}

- (SHMediaLibraryItem)libraryItem
{
  return self->_libraryItem;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);

  objc_storeStrong((id *)&self->_libraryItem, 0);
}

@end