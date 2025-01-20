@interface DOCTag
+ (BOOL)areTags:(id)a3 equalByNameAndColorTo:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)tagsLoadedFromUserDefaults;
+ (id)untitledTagForRendering:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTag:(id)a3;
- (DOCTag)initWithCoder:(id)a3;
- (DOCTag)initWithDisplayName:(id)a3 labelIndex:(int64_t)a4 type:(int64_t)a5;
- (DOCTag)initWithDisplayName:(id)a3 labelIndex:(int64_t)a4 type:(int64_t)a5 itemCount:(int64_t)a6 sidebarVisible:(id)a7 sidebarPinned:(id)a8;
- (DOCTag)initWithICloudTagAttributes:(id)a3;
- (NSNumber)sidebarPinned;
- (NSNumber)sidebarVisible;
- (NSString)displayName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)iCloudTagAttributes;
- (int64_t)itemCount;
- (int64_t)labelIndex;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)mergeWithTag:(id)a3 options:(int64_t)a4;
@end

@implementation DOCTag

- (int64_t)type
{
  return self->_type;
}

- (DOCTag)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"labelIndex"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"type"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"itemCount"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sidebarVisible"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sidebarPinned"];

  v11 = [(DOCTag *)self initWithDisplayName:v5 labelIndex:v6 type:v7 itemCount:v8 sidebarVisible:v9 sidebarPinned:v10];
  return v11;
}

- (DOCTag)initWithDisplayName:(id)a3 labelIndex:(int64_t)a4 type:(int64_t)a5 itemCount:(int64_t)a6 sidebarVisible:(id)a7 sidebarPinned:(id)a8
{
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)DOCTag;
  v17 = [(DOCTag *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_displayName, a3);
    v18->_labelIndex = a4;
    v18->_type = a5;
    objc_storeStrong((id *)&v18->_sidebarVisible, a7);
    objc_storeStrong((id *)&v18->_sidebarPinned, a8);
  }

  return v18;
}

- (DOCTag)initWithDisplayName:(id)a3 labelIndex:(int64_t)a4 type:(int64_t)a5
{
  return [(DOCTag *)self initWithDisplayName:a3 labelIndex:a4 type:a5 itemCount:-1 sidebarVisible:0 sidebarPinned:0];
}

- (int64_t)labelIndex
{
  return self->_labelIndex;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DOCTag *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(DOCTag *)self isEqualToTag:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = [(DOCTag *)self displayName];
  v3 = [v2 precomposedStringWithCanonicalMapping];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isEqualToTag:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(DOCTag *)self displayName];
    if (v5)
    {
    }
    else
    {
      uint64_t v7 = [v4 displayName];

      if (!v7)
      {
        BOOL v6 = 1;
        goto LABEL_7;
      }
    }
    uint64_t v8 = [(DOCTag *)self displayName];
    v9 = [v4 displayName];
    BOOL v6 = [v8 compare:v9 options:129] == 0;
  }
  else
  {
    BOOL v6 = 0;
  }
LABEL_7:

  return v6;
}

- (NSString)displayName
{
  return self->_displayName;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidebarPinned, 0);
  objc_storeStrong((id *)&self->_sidebarVisible, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

+ (id)tagsLoadedFromUserDefaults
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.DocumentManagerCore"];
  uint64_t v3 = [v2 pathForResource:@"UIDocumentPickerDefaultTags" ofType:@"plist"];

  v21 = (void *)v3;
  objc_super v20 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3];
  id v4 = objc_msgSend(MEMORY[0x263F08AC0], "propertyListWithData:options:format:error:");
  BOOL v5 = [v4 objectForKey:@"_LOCALIZABLE_"];
  BOOL v6 = [v5 objectForKey:@"FinderTagDict"];
  uint64_t v7 = [v6 objectForKey:@"FinderTags"];

  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9B0]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v14 = [v13 objectForKey:@"n"];
        id v15 = [v13 objectForKey:@"l"];
        id v16 = v15;
        if (v15) {
          uint64_t v17 = [v15 integerValue];
        }
        else {
          uint64_t v17 = 0;
        }
        v18 = [[DOCTag alloc] initWithDisplayName:v14 labelIndex:v17 type:1];
        [v8 addObject:v18];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  return v8;
}

+ (BOOL)areTags:(id)a3 equalByNameAndColorTo:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (!(v5 | v6)) {
    goto LABEL_2;
  }
  if (![(id)v5 isEqualToOrderedSet:v6])
  {
LABEL_12:
    LOBYTE(v7) = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(id)v5 count];
  if (v8)
  {
    uint64_t v9 = 0;
    uint64_t v10 = v8 - 1;
    while (1)
    {
      uint64_t v11 = [(id)v5 objectAtIndexedSubscript:v9];
      v12 = [(id)v6 objectAtIndexedSubscript:v9];
      uint64_t v13 = [v11 labelIndex];
      if (v13 != [v12 labelIndex]) {
        break;
      }
      id v14 = [v11 displayName];
      id v15 = [v12 displayName];
      int v7 = [v14 isEqualToString:v15];

      if (v7)
      {
        if (v10 != v9++) {
          continue;
        }
      }
      goto LABEL_13;
    }

    goto LABEL_12;
  }
LABEL_2:
  LOBYTE(v7) = 1;
LABEL_13:

  return v7;
}

+ (id)untitledTagForRendering:(int64_t)a3
{
  uint64_t v3 = [[DOCTag alloc] initWithDisplayName:&stru_26C404058 labelIndex:a3 type:1];
  return v3;
}

- (DOCTag)initWithICloudTagAttributes:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [v5 objectForKeyedSubscript:@"n"];

  if (!v6)
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"DOCTag.m" lineNumber:29 description:@"iCloudTag dictionary missing required keys"];
  }
  int v7 = [v5 objectForKeyedSubscript:@"n"];
  uint64_t v8 = [v5 objectForKeyedSubscript:@"l"];
  uint64_t v9 = [v8 integerValue];
  uint64_t v10 = [v5 objectForKeyedSubscript:@"v"];
  uint64_t v11 = [v5 objectForKeyedSubscript:@"p"];

  v12 = [(DOCTag *)self initWithDisplayName:v7 labelIndex:v9 type:1 itemCount:-1 sidebarVisible:v10 sidebarPinned:v11];
  return v12;
}

- (id)description
{
  int64_t v3 = [(DOCTag *)self type];
  id v4 = @"unexpected tag type";
  if (!v3) {
    id v4 = @"discovered";
  }
  if (v3 == 1) {
    id v5 = @"user";
  }
  else {
    id v5 = v4;
  }
  unint64_t v6 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)DOCTag;
  int v7 = [(DOCTag *)&v11 description];
  uint64_t v8 = [(DOCTag *)self displayName];
  uint64_t v9 = [v6 stringWithFormat:@"%@: %@, labelIndex: %ld, type: %@", v7, v8, -[DOCTag labelIndex](self, "labelIndex"), v5];

  return v9;
}

- (id)iCloudTagAttributes
{
  int64_t v3 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:4];
  id v4 = v3;
  if (self->_displayName) {
    displayName = (__CFString *)self->_displayName;
  }
  else {
    displayName = &stru_26C404058;
  }
  [v3 setObject:displayName forKeyedSubscript:@"n"];
  unint64_t v6 = [NSNumber numberWithInteger:self->_labelIndex];
  [v4 setObject:v6 forKeyedSubscript:@"l"];

  [v4 setObject:self->_sidebarVisible forKeyedSubscript:@"v"];
  [v4 setObject:self->_sidebarPinned forKeyedSubscript:@"p"];
  return v4;
}

- (void)mergeWithTag:(id)a3 options:(int64_t)a4
{
  char v4 = a4;
  id v13 = a3;
  displayName = self->_displayName;
  int v7 = [v13 displayName];
  LODWORD(displayName) = [(NSString *)displayName isEqualToString:v7];

  uint64_t v8 = v13;
  if (displayName)
  {
    if ([v13 type] > self->_type) {
      self->_type = [v13 type];
    }
    if ((v4 & 2) != 0 || !self->_labelIndex) {
      self->_labelIndex = [v13 labelIndex];
    }
    uint64_t v8 = v13;
    if ((v4 & 4) != 0 || self->_itemCount == -1)
    {
      self->_itemCount = [v13 itemCount];
      uint64_t v8 = v13;
    }
    if (!self->_sidebarVisible)
    {
      uint64_t v9 = [v13 sidebarVisible];
      sidebarVisible = self->_sidebarVisible;
      self->_sidebarVisible = v9;

      uint64_t v8 = v13;
    }
    if (!self->_sidebarPinned)
    {
      objc_super v11 = [v13 sidebarPinned];
      sidebarPinned = self->_sidebarPinned;
      self->_sidebarPinned = v11;

      uint64_t v8 = v13;
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  displayName = self->_displayName;
  id v5 = a3;
  [v5 encodeObject:displayName forKey:@"displayName"];
  [v5 encodeInteger:self->_labelIndex forKey:@"labelIndex"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeInteger:self->_itemCount forKey:@"itemCount"];
  [v5 encodeObject:self->_sidebarVisible forKey:@"sidebarVisible"];
  [v5 encodeObject:self->_sidebarPinned forKey:@"sidebarPinned"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [DOCTag alloc];
  unint64_t v6 = (void *)[(NSString *)self->_displayName copyWithZone:a3];
  int64_t labelIndex = self->_labelIndex;
  int64_t type = self->_type;
  int64_t itemCount = self->_itemCount;
  uint64_t v10 = (void *)[(NSNumber *)self->_sidebarPinned copyWithZone:a3];
  objc_super v11 = (void *)[(NSNumber *)self->_sidebarVisible copyWithZone:a3];
  v12 = [(DOCTag *)v5 initWithDisplayName:v6 labelIndex:labelIndex type:type itemCount:itemCount sidebarVisible:v10 sidebarPinned:v11];

  return v12;
}

- (int64_t)itemCount
{
  return self->_itemCount;
}

- (NSNumber)sidebarVisible
{
  return self->_sidebarVisible;
}

- (NSNumber)sidebarPinned
{
  return self->_sidebarPinned;
}

@end