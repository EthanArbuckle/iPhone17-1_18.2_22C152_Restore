@interface ENNotebook
- (BOOL)allowsWriting;
- (BOOL)isBusinessNotebook;
- (BOOL)isDefaultNotebook;
- (BOOL)isDefaultNotebookOverride;
- (BOOL)isEqual:(id)a3;
- (BOOL)isJoinedPublic;
- (BOOL)isLinked;
- (BOOL)isOwnPublic;
- (BOOL)isOwnShared;
- (BOOL)isOwnedByUser;
- (BOOL)isPublic;
- (BOOL)isShared;
- (EDAMLinkedNotebook)linkedNotebook;
- (EDAMNotebook)notebook;
- (EDAMSharedNotebook)sharedNotebook;
- (ENNotebook)initWithCoder:(id)a3;
- (ENNotebook)initWithNotebook:(id)a3;
- (ENNotebook)initWithNotebook:(id)a3 linkedNotebook:(id)a4 sharedNotebook:(id)a5;
- (ENNotebook)initWithPublicNotebook:(id)a3 forLinkedNotebook:(id)a4;
- (ENNotebook)initWithSharedNotebook:(id)a3 forLinkedNotebook:(id)a4;
- (ENNotebook)initWithSharedNotebook:(id)a3 forLinkedNotebook:(id)a4 withBusinessNotebook:(id)a5;
- (NSString)name;
- (NSString)ownerDisplayName;
- (id)description;
- (id)guid;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIsDefaultNotebookOverride:(BOOL)a3;
- (void)setIsShared:(BOOL)a3;
- (void)setLinkedNotebook:(id)a3;
- (void)setNotebook:(id)a3;
- (void)setSharedNotebook:(id)a3;
@end

@implementation ENNotebook

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedNotebook, 0);
  objc_storeStrong((id *)&self->_linkedNotebook, 0);
  objc_storeStrong((id *)&self->_notebook, 0);
}

- (void)setIsDefaultNotebookOverride:(BOOL)a3
{
  self->_isDefaultNotebookOverride = a3;
}

- (BOOL)isDefaultNotebookOverride
{
  return self->_isDefaultNotebookOverride;
}

- (void)setSharedNotebook:(id)a3
{
}

- (EDAMSharedNotebook)sharedNotebook
{
  return self->_sharedNotebook;
}

- (void)setLinkedNotebook:(id)a3
{
}

- (EDAMLinkedNotebook)linkedNotebook
{
  return self->_linkedNotebook;
}

- (void)setNotebook:(id)a3
{
}

- (EDAMNotebook)notebook
{
  return self->_notebook;
}

- (void)setIsShared:(BOOL)a3
{
  self->_isShared = a3;
}

- (unint64_t)hash
{
  v2 = [(ENNotebook *)self guid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [(ENNotebook *)self guid];
    v6 = [v4 guid];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  unint64_t v3 = (void *)MEMORY[0x263F089D8];
  id v4 = [(ENNotebook *)self ownerDisplayName];
  v5 = [v3 stringWithFormat:@"\"%@\"", v4];

  if ([(ENNotebook *)self isOwnedByUser]) {
    [v5 appendString:@" (me)"];
  }
  v6 = NSString;
  uint64_t v7 = objc_opt_class();
  v8 = [(ENNotebook *)self name];
  v9 = @"NO";
  if ([(ENNotebook *)self isBusinessNotebook]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  if ([(ENNotebook *)self isShared]) {
    v9 = @"YES";
  }
  BOOL v11 = [(ENNotebook *)self allowsWriting];
  v12 = @"R/O";
  if (v11) {
    v12 = @"R/W";
  }
  objc_msgSend(v6, "stringWithFormat:", @"<%@: %p; name = \"%@\"; business = %@; shared = %@; owner = %@; access = %@>",
    v7,
    self,
    v8,
    v10,
    v9,
    v5,
  v13 = v12);

  return v13;
}

- (BOOL)allowsWriting
{
  unint64_t v3 = [(ENNotebook *)self linkedNotebook];

  if (!v3) {
    return 1;
  }
  if ([(ENNotebook *)self isJoinedPublic]) {
    return 0;
  }
  v5 = [(ENNotebook *)self sharedNotebook];
  v6 = [v5 privilege];
  int v7 = [v6 intValue];

  if (v7 == 3)
  {
    v8 = [(ENNotebook *)self notebook];
    v9 = [v8 businessNotebook];
    v10 = [v9 privilege];
    int v7 = [v10 intValue];
  }
  return v7 == 4 || (v7 & 0xFFFFFFFB) == 1;
}

- (BOOL)isDefaultNotebook
{
  if ([(ENNotebook *)self isDefaultNotebookOverride])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    uint64_t v3 = [(ENNotebook *)self notebook];
    if (v3)
    {
      id v4 = (void *)v3;
      BOOL v5 = [(ENNotebook *)self isJoinedPublic];

      if (v5)
      {
        LOBYTE(v3) = 0;
      }
      else
      {
        v6 = [(ENNotebook *)self notebook];
        int v7 = [v6 defaultNotebook];
        char v8 = [v7 BOOLValue];

        LOBYTE(v3) = v8;
      }
    }
  }
  return v3;
}

- (BOOL)isOwnedByUser
{
  uint64_t v3 = [(ENNotebook *)self linkedNotebook];

  if (!v3) {
    return 1;
  }
  if (![(ENNotebook *)self isBusinessNotebook]) {
    return 0;
  }
  id v4 = [(ENNotebook *)self notebook];
  BOOL v5 = [v4 contact];
  v6 = [v5 id];
  int v7 = [v6 intValue];
  char v8 = +[ENSession sharedSession];
  BOOL v9 = v7 == [v8 userID];

  return v9;
}

- (BOOL)isBusinessNotebook
{
  uint64_t v3 = [(ENNotebook *)self notebook];
  if (v3)
  {
    id v4 = [(ENNotebook *)self linkedNotebook];
    if (v4)
    {
      BOOL v5 = [(ENNotebook *)self linkedNotebook];
      v6 = [v5 sharedNotebookGlobalId];
      BOOL v7 = v6 != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isOwnPublic
{
  if ([(ENNotebook *)self isLinked]) {
    return 0;
  }
  id v4 = [(ENNotebook *)self notebook];
  BOOL v5 = [v4 publishing];
  v6 = [v5 uri];
  BOOL v3 = [v6 length] != 0;

  return v3;
}

- (BOOL)isJoinedPublic
{
  if (![(ENNotebook *)self isLinked]) {
    return 0;
  }
  BOOL v3 = [(ENNotebook *)self linkedNotebook];
  id v4 = [v3 sharedNotebookGlobalId];
  BOOL v5 = v4 == 0;

  return v5;
}

- (BOOL)isPublic
{
  if ([(ENNotebook *)self isOwnPublic]) {
    return 1;
  }
  return [(ENNotebook *)self isJoinedPublic];
}

- (BOOL)isLinked
{
  v2 = [(ENNotebook *)self linkedNotebook];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isOwnShared
{
  if ([(ENNotebook *)self isLinked]) {
    return 0;
  }
  id v4 = [(ENNotebook *)self notebook];
  BOOL v5 = [v4 sharedNotebookIds];
  BOOL v3 = [v5 count] != 0;

  return v3;
}

- (BOOL)isShared
{
  if ([(ENNotebook *)self isOwnShared]) {
    return 1;
  }
  return [(ENNotebook *)self isJoinedShared];
}

- (id)guid
{
  BOOL v3 = [(ENNotebook *)self notebook];

  if (v3)
  {
    id v4 = [(ENNotebook *)self notebook];
    uint64_t v5 = [v4 guid];
  }
  else
  {
    v6 = [(ENNotebook *)self sharedNotebook];

    if (!v6) {
      goto LABEL_6;
    }
    id v4 = [(ENNotebook *)self sharedNotebook];
    uint64_t v5 = [v4 notebookGuid];
  }
  v6 = (void *)v5;

LABEL_6:
  return v6;
}

- (NSString)ownerDisplayName
{
  if ([(ENNotebook *)self isBusinessNotebook])
  {
    BOOL v3 = [(ENNotebook *)self notebook];
    id v4 = [v3 contact];
    uint64_t v5 = [v4 name];

    if ([v5 length]) {
      goto LABEL_9;
    }
    v6 = +[ENSession sharedSession];
    uint64_t v7 = [v6 businessDisplayName];

    uint64_t v5 = (void *)v7;
  }
  else
  {
    char v8 = [(ENNotebook *)self linkedNotebook];

    if (v8)
    {
      v6 = [(ENNotebook *)self linkedNotebook];
      [v6 username];
    }
    else
    {
      v6 = +[ENSession sharedSession];
      [v6 userDisplayName];
    uint64_t v5 = };
  }

LABEL_9:
  return (NSString *)v5;
}

- (NSString)name
{
  BOOL v3 = [(ENNotebook *)self notebook];

  if (v3)
  {
    id v4 = [(ENNotebook *)self notebook];
    [v4 name];
  }
  else
  {
    id v4 = [(ENNotebook *)self linkedNotebook];
    [v4 shareName];
  uint64_t v5 = };

  return (NSString *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(ENNotebook *)self notebook];
  [v7 encodeObject:v4 forKey:@"notebook"];

  uint64_t v5 = [(ENNotebook *)self linkedNotebook];
  [v7 encodeObject:v5 forKey:@"linkedNotebook"];

  v6 = [(ENNotebook *)self sharedNotebook];
  [v7 encodeObject:v6 forKey:@"sharedNotebook"];

  objc_msgSend(v7, "encodeBool:forKey:", -[ENNotebook isShared](self, "isShared"), @"isShared");
  objc_msgSend(v7, "encodeBool:forKey:", -[ENNotebook isDefaultNotebookOverride](self, "isDefaultNotebookOverride"), @"isDefaultNotebookOverride");
}

- (ENNotebook)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ENNotebook;
  uint64_t v5 = [(ENNotebook *)&v12 init];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"notebook"];
    [(ENNotebook *)v5 setNotebook:v6];

    id v7 = [v4 decodeObjectForKey:@"linkedNotebook"];
    [(ENNotebook *)v5 setLinkedNotebook:v7];

    char v8 = [v4 decodeObjectForKey:@"sharedNotebook"];
    [(ENNotebook *)v5 setSharedNotebook:v8];

    -[ENNotebook setIsShared:](v5, "setIsShared:", [v4 decodeBoolForKey:@"isShared"]);
    -[ENNotebook setIsDefaultNotebookOverride:](v5, "setIsDefaultNotebookOverride:", [v4 decodeBoolForKey:@"isDefaultNotebookOverride"]);
    BOOL v9 = [(ENNotebook *)v5 notebook];
    if (v9
      || ([(ENNotebook *)v5 linkedNotebook], (BOOL v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      v10 = [(ENNotebook *)v5 sharedNotebook];

      if (!v10) {
        goto LABEL_6;
      }
    }
  }
  v10 = v5;
LABEL_6:

  return v10;
}

- (ENNotebook)initWithNotebook:(id)a3 linkedNotebook:(id)a4 sharedNotebook:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ENNotebook;
  BOOL v11 = [(ENNotebook *)&v14 init];
  objc_super v12 = v11;
  if (v11)
  {
    [(ENNotebook *)v11 setNotebook:v8];
    [(ENNotebook *)v12 setLinkedNotebook:v9];
    [(ENNotebook *)v12 setSharedNotebook:v10];
  }

  return v12;
}

- (ENNotebook)initWithSharedNotebook:(id)a3 forLinkedNotebook:(id)a4 withBusinessNotebook:(id)a5
{
  return [(ENNotebook *)self initWithNotebook:a5 linkedNotebook:a4 sharedNotebook:a3];
}

- (ENNotebook)initWithPublicNotebook:(id)a3 forLinkedNotebook:(id)a4
{
  return [(ENNotebook *)self initWithNotebook:a3 linkedNotebook:a4 sharedNotebook:0];
}

- (ENNotebook)initWithSharedNotebook:(id)a3 forLinkedNotebook:(id)a4
{
  return [(ENNotebook *)self initWithNotebook:0 linkedNotebook:a4 sharedNotebook:a3];
}

- (ENNotebook)initWithNotebook:(id)a3
{
  return [(ENNotebook *)self initWithNotebook:a3 linkedNotebook:0 sharedNotebook:0];
}

@end