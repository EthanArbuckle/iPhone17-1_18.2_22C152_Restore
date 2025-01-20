@interface GAXPathMapping
+ (BOOL)supportsSecureCoding;
- (BOOL)containsPath:(id)a3;
- (GAXPathMapping)init;
- (GAXPathMapping)initWithCoder:(id)a3;
- (NSMutableDictionary)identifiersToPaths;
- (NSMutableDictionary)mapping;
- (__CFDictionary)pathsToIdentifiers;
- (id)description;
- (id)parentOfPath:(id)a3;
- (id)pathMappingByTransformingPointsInPathsUsingBlock:(id)a3;
- (unint64_t)count;
- (void)_configureWithIdentifiersToPaths:(id)a3 mapping:(id)a4 identifiersToRectangleFlags:(id)a5;
- (void)_enumerateUnorderedPathsAndParentsUsingBlock:(id)a3;
- (void)addPath:(id)a3 withParentPath:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumeratePathsAndParentsUsingBlock:(id)a3;
- (void)removePath:(id)a3;
- (void)replaceParentOfPath:(id)a3 withPath:(id)a4;
- (void)setIdentifiersToPaths:(id)a3;
- (void)setMapping:(id)a3;
- (void)setPathsToIdentifiers:(__CFDictionary *)a3;
@end

@implementation GAXPathMapping

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GAXPathMapping)init
{
  v8.receiver = self;
  v8.super_class = (Class)GAXPathMapping;
  v2 = [(GAXPathMapping *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(GAXPathMapping *)v2 _configureWithIdentifiersToPaths:0 mapping:0 identifiersToRectangleFlags:0];
    if (![(GAXPathMapping *)v3 pathsToIdentifiers]
      || ([(GAXPathMapping *)v3 identifiersToPaths], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0)
      || (v5 = (void *)v4,
          [(GAXPathMapping *)v3 mapping],
          v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          v5,
          !v6))
    {

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  [(GAXPathMapping *)self setPathsToIdentifiers:0];
  v3.receiver = self;
  v3.super_class = (Class)GAXPathMapping;
  [(GAXPathMapping *)&v3 dealloc];
}

- (unint64_t)count
{
  v2 = [(GAXPathMapping *)self mapping];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (void)setPathsToIdentifiers:(__CFDictionary *)a3
{
  pathsToIdentifiers = self->_pathsToIdentifiers;
  if (pathsToIdentifiers != a3)
  {
    if (pathsToIdentifiers)
    {
      CFRelease(pathsToIdentifiers);
      self->_pathsToIdentifiers = 0;
    }
    if (a3) {
      v6 = (__CFDictionary *)CFRetain(a3);
    }
    else {
      v6 = 0;
    }
    self->_pathsToIdentifiers = v6;
  }
}

- (GAXPathMapping)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GAXPathMapping;
  v5 = [(GAXPathMapping *)&v16 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    objc_super v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"identifiersToPaths"];
    v10 = [v4 decodePropertyListForKey:@"mapping"];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    v14 = [v4 decodeObjectOfClasses:v13 forKey:@"identifiersToRectangleFlags"];
    [(GAXPathMapping *)v5 _configureWithIdentifiersToPaths:v9 mapping:v10 identifiersToRectangleFlags:v14];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(GAXPathMapping *)self identifiersToPaths];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10484;
  v8[3] = &unk_5CF58;
  id v9 = (id)objc_opt_new();
  id v6 = v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  [v4 encodeObject:v5 forKey:@"identifiersToPaths"];
  uint64_t v7 = [(GAXPathMapping *)self mapping];
  [v4 encodeObject:v7 forKey:@"mapping"];

  [v4 encodeObject:v6 forKey:@"identifiersToRectangleFlags"];
}

- (void)addPath:(id)a3 withParentPath:(id)a4
{
  id key = a3;
  id v6 = a4;
  CFUUIDRef v7 = CFUUIDCreate(kCFAllocatorDefault);
  if (v7)
  {
    CFUUIDRef v8 = v7;
    CFStringRef v9 = CFUUIDCreateString(kCFAllocatorDefault, v7);
    if (v9)
    {
      CFStringRef v10 = v9;
      uint64_t v11 = [(GAXPathMapping *)self pathsToIdentifiers];
      CFDictionarySetValue(v11, key, v10);
      uint64_t v12 = [(GAXPathMapping *)self identifiersToPaths];
      [v12 setObject:key forKey:v10];

      if (!v6 || (CFDictionaryGetValue(v11, v6), (v13 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v13 = +[NSNumber numberWithBool:0];
      }
      v14 = [(GAXPathMapping *)self mapping];
      [v14 setObject:v13 forKey:v10];

      CFRelease(v10);
    }
    CFRelease(v8);
  }
}

- (void)replaceParentOfPath:(id)a3 withPath:(id)a4
{
  id key = a4;
  id v6 = a3;
  CFUUIDRef v7 = [(GAXPathMapping *)self pathsToIdentifiers];
  CFUUIDRef v8 = CFDictionaryGetValue(v7, v6);

  if (v8)
  {
    if (!key || (CFDictionaryGetValue(v7, key), (CFStringRef v9 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      CFStringRef v9 = +[NSNumber numberWithBool:0];
    }
    CFStringRef v10 = [(GAXPathMapping *)self mapping];
    [v10 setObject:v9 forKey:v8];
  }
}

- (void)removePath:(id)a3
{
  id v4 = a3;
  theDict = [(GAXPathMapping *)self pathsToIdentifiers];
  v15 = CFDictionaryGetValue(theDict, v4);
  if (v15)
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = sub_109B0;
    v27 = sub_109C0;
    id v28 = 0;
    v5 = [(GAXPathMapping *)self mapping];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_109C8;
    v20[3] = &unk_5CF80;
    id v13 = v15;
    id v21 = v13;
    v22 = &v23;
    [v5 enumerateKeysAndObjectsUsingBlock:v20];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = (id)v24[5];
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v17;
      do
      {
        CFStringRef v9 = 0;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v9);
          uint64_t v11 = +[NSNumber numberWithBool:0];
          [v5 setObject:v11 forKey:v10];

          CFStringRef v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v16 objects:v29 count:16];
      }
      while (v7);
    }

    uint64_t v12 = [(GAXPathMapping *)self identifiersToPaths];
    [v12 removeObjectForKey:v13];

    _Block_object_dispose(&v23, 8);
  }
  CFDictionaryRemoveValue(theDict, v4);
}

- (void)enumeratePathsAndParentsUsingBlock:(id)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10BA8;
  v7[3] = &unk_5CFA8;
  id v4 = a3;
  id v8 = v4;
  CFStringRef v9 = &v10;
  [(GAXPathMapping *)self _enumerateUnorderedPathsAndParentsUsingBlock:v7];
  if (!*((unsigned char *)v11 + 24))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10C0C;
    v5[3] = &unk_5CFD0;
    id v6 = v4;
    [(GAXPathMapping *)self _enumerateUnorderedPathsAndParentsUsingBlock:v5];
  }
  _Block_object_dispose(&v10, 8);
}

- (id)parentOfPath:(id)a3
{
  id v4 = a3;
  v5 = CFDictionaryGetValue([(GAXPathMapping *)self pathsToIdentifiers], v4);

  if (v5)
  {
    id v6 = [(GAXPathMapping *)self mapping];
    id v7 = [v6 objectForKey:v5];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      CFStringRef v9 = [(GAXPathMapping *)self identifiersToPaths];
      uint64_t v10 = [v9 objectForKey:v8];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)containsPath:(id)a3
{
  id v4 = a3;
  Value = CFDictionaryGetValue([(GAXPathMapping *)self pathsToIdentifiers], v4);

  return Value != 0;
}

- (id)pathMappingByTransformingPointsInPathsUsingBlock:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = objc_opt_new();
  id v7 = objc_opt_new();
  id v8 = [(GAXPathMapping *)self identifiersToPaths];
  char v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_10E9C;
  long long v16 = &unk_5D020;
  id v9 = v4;
  id v17 = v7;
  id v18 = v9;
  id v10 = v7;
  [v8 enumerateKeysAndObjectsUsingBlock:&v13];

  uint64_t v11 = [(GAXPathMapping *)self mapping];
  [v5 _configureWithIdentifiersToPaths:v10 mapping:v11 identifiersToRectangleFlags:0];

  return v5;
}

- (void)_configureWithIdentifiersToPaths:(id)a3 mapping:(id)a4 identifiersToRectangleFlags:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  if (v11) {
    id v13 = (id)objc_opt_new();
  }
  else {
    id v13 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v8];
  }
  uint64_t v14 = v13;
  [(GAXPathMapping *)self setIdentifiersToPaths:v13];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    CFMutableDictionaryRef v16 = Mutable;
    long long v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    id v21 = sub_1112C;
    v22 = &unk_5D048;
    CFMutableDictionaryRef v24 = Mutable;
    id v23 = v10;
    [v14 enumerateKeysAndObjectsUsingBlock:&v19];

    -[GAXPathMapping setPathsToIdentifiers:](self, "setPathsToIdentifiers:", v16, v19, v20, v21, v22);
    CFRelease(v16);
  }
  else
  {
    [(GAXPathMapping *)self setPathsToIdentifiers:0];
  }
  if (v12) {
    id v17 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v9];
  }
  else {
    id v17 = (id)objc_opt_new();
  }
  id v18 = v17;
  [(GAXPathMapping *)self setMapping:v17];
}

- (void)_enumerateUnorderedPathsAndParentsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [(GAXPathMapping *)self identifiersToPaths];
  id v7 = [(GAXPathMapping *)self mapping];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_112C8;
  v10[3] = &unk_5D070;
  id v12 = v4;
  uint64_t v13 = v5;
  id v11 = v6;
  id v8 = v4;
  id v9 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v10];
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)GAXPathMapping;
  id v3 = [(GAXPathMapping *)&v9 description];
  id v4 = [v3 mutableCopy];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1147C;
  v7[3] = &unk_5D098;
  id v5 = v4;
  id v8 = v5;
  [(GAXPathMapping *)self _enumerateUnorderedPathsAndParentsUsingBlock:v7];

  return v5;
}

- (__CFDictionary)pathsToIdentifiers
{
  return self->_pathsToIdentifiers;
}

- (NSMutableDictionary)identifiersToPaths
{
  return self->_identifiersToPaths;
}

- (void)setIdentifiersToPaths:(id)a3
{
}

- (NSMutableDictionary)mapping
{
  return self->_mapping;
}

- (void)setMapping:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapping, 0);

  objc_storeStrong((id *)&self->_identifiersToPaths, 0);
}

@end