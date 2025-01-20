@interface CAPackage
+ (id)packageWithContentsOfURL:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)packageWithData:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)isGeometryFlipped;
- (CALayer)rootLayer;
- (Class)CAMLParser:(id)a3 didFailToFindClassWithName:(id)a4;
- (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5;
- (id)CAMLParser:(id)a3 resourceForURL:(id)a4;
- (id)_initWithContentsOfURL:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6;
- (id)_initWithData:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6;
- (id)publishedObjectNames;
- (id)publishedObjectWithName:(id)a3;
- (id)substitutedClasses;
- (id)unarchiver:(id)a3 didDecodeObject:(id)a4;
- (void)CAMLParser:(id)a3 didLoadResource:(id)a4 fromURL:(id)a5;
- (void)_addClassSubstitutions:(id)a3;
- (void)_readFromArchiveData:(id)a3 options:(id)a4 error:(id *)a5;
- (void)_readFromCAMLData:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6;
- (void)_readFromCAMLURL:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6;
- (void)dealloc;
- (void)foreachLayer:(id)a3;
@end

@implementation CAPackage

- (id)unarchiver:(id)a3 didDecodeObject:(id)a4
{
  return a4;
}

+ (id)packageWithContentsOfURL:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6
{
  if (!a3) {
    return 0;
  }
  v6 = (void *)[objc_alloc((Class)a1) _initWithContentsOfURL:a3 type:a4 options:a5 error:a6];

  return v6;
}

- (id)_initWithContentsOfURL:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6
{
  v18[2] = *MEMORY[0x1E4F143B8];
  if ([a4 isEqualToString:@"com.apple.coreanimation-archive"])
  {
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:a3 options:0 error:a6];
    uint64_t v12 = [NSString stringWithFormat:@"Unable to load CAPackage from URL: %@", a3];
    if (a6)
    {
      id v13 = *a6;
      if (*a6)
      {
        uint64_t v14 = *MEMORY[0x1E4F28A50];
        v17[0] = *MEMORY[0x1E4F28568];
        v17[1] = v14;
        v18[0] = v12;
        v18[1] = v13;
        *a6 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CoreAnimationErrorDomain", 2, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
      }
    }
    if (v11)
    {
      self = [(CAPackage *)self _initWithData:v11 type:a4 options:a5 error:a6];

      return self;
    }
LABEL_14:

    return 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)CAPackage;
  self = [(CAPackage *)&v16 init];
  if (!self) {
    return self;
  }
  self->_data = (_CAPackageData *)malloc_type_calloc(1uLL, 0x30uLL, 0x1080040EEFF6A89uLL);
  if (([a4 isEqualToString:@"com.apple.coreanimation-bundle"] & 1) != 0
    || [a4 isEqualToString:@"com.apple.coreanimation-xml"])
  {
    [(CAPackage *)self _readFromCAMLURL:a3 type:a4 options:a5 error:a6];
  }
  if (!self->_data->var0) {
    goto LABEL_14;
  }
  if (objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"prepareContents"), "BOOLValue"))recursively_prepare_contents((CALayer *)self->_data->var0); {
  return self;
  }
}

- (Class)CAMLParser:(id)a3 didFailToFindClassWithName:(id)a4
{
  id v5 = [(CAPackage *)self substitutedClasses];

  return (Class)[v5 objectForKey:a4];
}

+ (id)packageWithData:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6
{
  if (!a3) {
    return 0;
  }
  v6 = (void *)[objc_alloc((Class)a1) _initWithData:a3 type:a4 options:a5 error:a6];

  return v6;
}

- (id)_initWithData:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)CAPackage;
  id v10 = [(CAPackage *)&v12 init];
  if (v10)
  {
    *((void *)v10 + 1) = malloc_type_calloc(1uLL, 0x30uLL, 0x1080040EEFF6A89uLL);
    if ([a4 isEqualToString:@"com.apple.coreanimation-archive"])
    {
      [v10 _readFromArchiveData:a3 options:a5 error:a6];
    }
    else if (([a4 isEqualToString:@"com.apple.coreanimation-bundle"] & 1) != 0 {
           || [a4 isEqualToString:@"com.apple.coreanimation-xml"])
    }
    {
      [v10 _readFromCAMLData:a3 type:a4 options:a5 error:a6];
    }
    if (**((void **)v10 + 1))
    {
      if (objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", @"prepareContents"), "BOOLValue"))recursively_prepare_contents(**((CALayer ***)v10 + 1)); {
    }
      }
    else
    {

      return 0;
    }
  }
  return v10;
}

- (void)_readFromArchiveData:(id)a3 options:(id)a4 error:(id *)a5
{
  v7 = (void *)MEMORY[0x185324A30](self, a2, a3, a4);
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:a3 error:0];
  v9 = v8;
  if (v8)
  {
    self->_data->var4 = 0;
    [v8 _allowDecodingCyclesInSecureMode];
    [v9 setDelegate:self];
    [(CAPackage *)self _addClassSubstitutions:v9];
    id v10 = objc_msgSend(v9, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E4F28B90], "CA_supportedClasses"), @"root");
    [v9 finishDecoding];

    uint64_t v11 = [v10 objectForKey:@"rootLayer"];
    if (!self->_data->var4)
    {
      objc_super v12 = (void *)v11;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self->_data->var0 = v12;
        self->_data->var3 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", @"geometryFlipped"), "BOOLValue");
        self->_data->var1 = (id)[v10 objectForKey:@"publishedObjects"];
      }
    }
  }
}

- (void)_addClassSubstitutions:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = [(CAPackage *)self substitutedClasses];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(a3, "setClass:forClassName:", objc_msgSend(v4, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * v8)), *(void *)(*((void *)&v10 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
}

- (id)substitutedClasses
{
  {
    -[CAPackage substitutedClasses]::dict = class_substitutions();
  }
  return (id)-[CAPackage substitutedClasses]::dict;
}

- (CALayer)rootLayer
{
  data = (CALayer **)self->_data;
  if (data) {
    return *data;
  }
  else {
    return 0;
  }
}

- (id)publishedObjectWithName:(id)a3
{
  data = self->_data;
  if (data) {
    return (id)[data->var1 objectForKey:a3];
  }
  else {
    return 0;
  }
}

- (void)_readFromCAMLURL:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x185324A30](self, a2, a3, a4, a5);
  if ([a4 isEqualToString:@"com.apple.coreanimation-xml"])
  {
    id v9 = +[CAMLParser parser];
    [v9 setDelegate:self];
    objc_msgSend(v9, "setBaseURL:", objc_msgSend(a3, "URLByDeletingLastPathComponent"));
    [v9 parseContentsOfURL:a3];
    long long v10 = (void *)[v9 error];
    if (a6 && v10 && !*a6) {
      *a6 = v10;
    }
    long long v11 = (void *)[v9 result];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_data->var0 = v11;
    }
    else
    {
      uint64_t v19 = [NSString stringWithFormat:@"Unable to parse CAPackage: %@", @"Expected CALayer at root"];
      if (a6 && !*a6)
      {
        uint64_t v62 = *MEMORY[0x1E4F28568];
        uint64_t v64 = v19;
        *a6 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CoreAnimationErrorDomain", 3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v64, &v62, 1));
      }
    }
  }
  else if ([a4 isEqualToString:@"com.apple.coreanimation-bundle"])
  {
    long long v12 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", objc_msgSend(a3, "path"), 1);
    self->_data->var2 = (id)objc_msgSend((id)objc_msgSend(v12, "path"), "stringByAppendingPathComponent:", @"assets");
    uint64_t v13 = [MEMORY[0x1E4F1CB10] URLWithString:@"index.xml" relativeToURL:v12];
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v13 options:0 error:a6];
    if (v14)
    {
      v15 = (void *)[MEMORY[0x1E4F28F98] propertyListWithData:v14 options:0 format:0 error:a6];
      uint64_t v16 = [NSString stringWithFormat:@"Unable to parse CAPackage from URL: %@", v13];
      if (a6)
      {
        id v17 = *a6;
        if (*a6)
        {
          uint64_t v18 = *MEMORY[0x1E4F28A50];
          uint64_t v62 = *MEMORY[0x1E4F28568];
          uint64_t v63 = v18;
          uint64_t v64 = v16;
          id v65 = v17;
          *a6 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CoreAnimationErrorDomain", 3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v64, &v62, 2));
        }
      }
    }
    else
    {
      uint64_t v20 = [NSString stringWithFormat:@"Unable to load CAPackage from URL: %@", v13];
      if (a6)
      {
        id v21 = *a6;
        if (*a6)
        {
          uint64_t v22 = *MEMORY[0x1E4F28A50];
          uint64_t v62 = *MEMORY[0x1E4F28568];
          uint64_t v63 = v22;
          uint64_t v64 = v20;
          id v65 = v21;
          *a6 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CoreAnimationErrorDomain", 2, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v64, &v62, 2));
        }
      }
      v15 = 0;
    }
    self->_data->id var5 = (id)[MEMORY[0x1E4F1CA48] array];
    self->_data->var6 = (id)[MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v23 = [v15 objectForKey:@"stylesDocument"];
    if (v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F1CB10] URLWithString:v23 relativeToURL:v12];
      id v25 = +[CAMLParser parser];
      [self->_data->var5 addObject:v25];
      [v25 setDelegate:self];
      [v25 setBaseURL:v12];
      [v25 parseContentsOfURL:v24];
      v26 = (void *)[v25 error];
      if (a6)
      {
        if (v26 && !*a6) {
          *a6 = v26;
        }
      }
    }
    uint64_t v27 = [v15 objectForKey:@"rootDocument"];
    if (v27)
    {
      uint64_t v28 = [MEMORY[0x1E4F1CB10] URLWithString:v27 relativeToURL:v12];
      id v29 = +[CAMLParser parser];
      [self->_data->var5 addObject:v29];
      [v29 setDelegate:self];
      [v29 setBaseURL:v12];
      [v29 parseContentsOfURL:v28];
      v30 = (void *)[v29 error];
      if (a6 && v30 && !*a6) {
        *a6 = v30;
      }
      v31 = (void *)[v29 result];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self->_data->var0 = v31;
      }
      else
      {
        uint64_t v32 = [NSString stringWithFormat:@"Unable to parse CAPackage: %@", @"Expected CALayer at root."];
        if (a6 && !*a6)
        {
          uint64_t v62 = *MEMORY[0x1E4F28568];
          uint64_t v64 = v32;
          *a6 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CoreAnimationErrorDomain", 3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v64, &v62, 1));
        }
      }
    }
    v33 = (void *)[v15 objectForKey:@"publishedObjectNames"];
    if (v33)
    {
      v34 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      v48 = v15;
      v49 = a6;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      uint64_t v35 = [v33 countByEnumeratingWithState:&v58 objects:v57 count:16];
      if (v35)
      {
        uint64_t v36 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v35; ++i)
          {
            if (*(void *)v59 != v36) {
              objc_enumerationMutation(v33);
            }
            uint64_t v38 = *(void *)(*((void *)&v58 + 1) + 8 * i);
            long long v55 = 0u;
            long long v56 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            id var5 = self->_data->var5;
            uint64_t v40 = [var5 countByEnumeratingWithState:&v53 objects:v52 count:16];
            if (v40)
            {
              uint64_t v41 = *(void *)v54;
              while (2)
              {
                for (uint64_t j = 0; j != v40; ++j)
                {
                  if (*(void *)v54 != v41) {
                    objc_enumerationMutation(var5);
                  }
                  uint64_t v43 = [*(id *)(*((void *)&v53 + 1) + 8 * j) objectById:v38];
                  if (v43)
                  {
                    [v34 setObject:v43 forKey:v38];
                    goto LABEL_52;
                  }
                }
                uint64_t v40 = [var5 countByEnumeratingWithState:&v53 objects:v52 count:16];
                if (v40) {
                  continue;
                }
                break;
              }
            }
LABEL_52:
            ;
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v58 objects:v57 count:16];
        }
        while (v35);
      }
      v15 = v48;
      a6 = v49;
      self->_data->var1 = (id)[v34 copy];
    }
    char v44 = objc_msgSend((id)objc_msgSend(v15, "objectForKey:", @"geometryFlipped"), "BOOLValue");
    data = self->_data;
    data->var3 = v44;
    data->id var5 = 0;
    data->var6 = 0;
  }
  if (a6)
  {
    if (*a6) {
      id v46 = *a6;
    }
    if (*a6) {
      id v47 = *a6;
    }
  }
  else
  {
  }
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  data = self->_data;
  if (data)
  {
    +[CATransaction begin];
    +[CATransaction activateBackground:pthread_main_np() == 0];

    +[CATransaction commit];
    free(data);
  }
  v4.receiver = self;
  v4.super_class = (Class)CAPackage;
  [(CAPackage *)&v4 dealloc];
}

- (id)publishedObjectNames
{
  data = self->_data;
  if (data && (id var1 = data->var1) != 0) {
    return (id)[var1 allKeys];
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (BOOL)isGeometryFlipped
{
  data = self->_data;
  return data && !data->var3;
}

- (void)CAMLParser:(id)a3 didLoadResource:(id)a4 fromURL:(id)a5
{
  data = self->_data;
  if (data) {
    [data->var6 setObject:a4 forKey:a5];
  }
}

- (id)CAMLParser:(id)a3 resourceForURL:(id)a4
{
  data = self->_data;
  if (data) {
    return (id)[data->var6 objectForKey:a4];
  }
  else {
    return 0;
  }
}

- (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5
{
  id v6 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v8 = objc_msgSend(a5, "count", a3, a4);
  if (v8 < 2)
  {
LABEL_14:
    Class v13 = 0;
    self->_data->var4 = 1;
  }
  else
  {
    uint64_t v9 = v8;
    uint64_t v10 = 1;
    unint64_t v11 = 0x1E4FBA000uLL;
    while (1)
    {
      Class v12 = NSClassFromString((NSString *)[a5 objectAtIndex:v10]);
      if (v12)
      {
        Class v13 = v12;
        if (v12 != (Class)objc_opt_class())
        {
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          uint64_t v14 = (void *)[v6 allowedClasses];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v24 count:16];
          if (v15) {
            break;
          }
        }
      }
LABEL_13:
      if (++v10 == v9) {
        goto LABEL_14;
      }
    }
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    uint64_t v23 = v9;
LABEL_7:
    id v18 = v6;
    uint64_t v19 = self;
    unint64_t v20 = v11;
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v26 != v17) {
        objc_enumerationMutation(v14);
      }
      if ([(objc_class *)v13 isSubclassOfClass:*(void *)(*((void *)&v25 + 1) + 8 * v21)]) {
        break;
      }
      if (v16 == ++v21)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v24 count:16];
        unint64_t v11 = v20;
        self = v19;
        id v6 = v18;
        uint64_t v9 = v23;
        if (v16) {
          goto LABEL_7;
        }
        goto LABEL_13;
      }
    }
  }
  return v13;
}

- (void)foreachLayer:(id)a3
{
  objc_super v4 = [(CAPackage *)self rootLayer];

  foreachLayer(v4, (uint64_t)a3);
}

- (void)_readFromCAMLData:(id)a3 type:(id)a4 options:(id)a5 error:(id *)a6
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (void *)MEMORY[0x185324A30](self, a2, a3, a4, a5);
  if ([a4 isEqualToString:@"com.apple.coreanimation-xml"])
  {
    id v11 = +[CAMLParser parser];
    [v11 setDelegate:self];
    [v11 parseData:a3];
    Class v12 = (void *)[v11 error];
    if (a6 && v12 && !*a6) {
      *a6 = v12;
    }
    Class v13 = (void *)[v11 result];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_data->var0 = v13;
    }
    else
    {
      uint64_t v14 = [NSString stringWithFormat:@"Unable to parse CAPackage: %@", @"Expected CALayer at root"];
      if (a6 && !*a6)
      {
        uint64_t v15 = *MEMORY[0x1E4F28568];
        v16[0] = v14;
        *a6 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CoreAnimationErrorDomain", 3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1));
      }
    }
  }
}

@end