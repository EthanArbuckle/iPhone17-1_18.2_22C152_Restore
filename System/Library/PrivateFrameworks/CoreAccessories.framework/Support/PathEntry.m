@interface PathEntry
+ (id)bundlePathsWithinEntries:(id)a3;
+ (id)bundlePathsWithinEntries:(id)a3 withExtension:(id)a4;
+ (id)bundlePathsWithinEntries:(id)a3 withExtension:(id)a4 andNames:(id)a5;
+ (id)entryWithPath:(id)a3;
+ (id)entryWithPath:(id)a3 recursive:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPathEntry:(id)a3;
- (BOOL)recursive;
- (NSString)path;
- (PathEntry)initWithPath:(id)a3;
- (PathEntry)initWithPath:(id)a3 recursive:(BOOL)a4;
- (id)description;
- (void)setPath:(id)a3;
- (void)setRecursive:(BOOL)a3;
@end

@implementation PathEntry

- (PathEntry)initWithPath:(id)a3
{
  return [(PathEntry *)self initWithPath:a3 recursive:0];
}

- (PathEntry)initWithPath:(id)a3 recursive:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PathEntry;
  v8 = [(PathEntry *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_path, a3);
    v9->_recursive = a4;
  }

  return v9;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(PathEntry *)self path];
  unsigned int v6 = [(PathEntry *)self recursive];
  CFStringRef v7 = @"NO";
  if (v6) {
    CFStringRef v7 = @"YES";
  }
  v8 = +[NSString stringWithFormat:@"%@ <path: %@, recursive: %@>", v4, v5, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PathEntry *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = [(PathEntry *)self isEqualToPathEntry:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToPathEntry:(id)a3
{
  v4 = (PathEntry *)a3;
  if (self == v4) {
    goto LABEL_4;
  }
  v5 = [(PathEntry *)self path];
  BOOL v6 = [(PathEntry *)v4 path];
  if (![v5 isEqualToString:v6])
  {

    goto LABEL_6;
  }
  unsigned int v7 = [(PathEntry *)self recursive];
  unsigned int v8 = [(PathEntry *)v4 recursive];

  if (v7 != v8)
  {
LABEL_6:
    BOOL v9 = 0;
    goto LABEL_7;
  }
LABEL_4:
  BOOL v9 = 1;
LABEL_7:

  return v9;
}

+ (id)entryWithPath:(id)a3
{
  id v3 = a3;
  v4 = [[PathEntry alloc] initWithPath:v3];

  return v4;
}

+ (id)entryWithPath:(id)a3 recursive:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = [[PathEntry alloc] initWithPath:v5 recursive:v4];

  return v6;
}

+ (id)bundlePathsWithinEntries:(id)a3
{
  return [a1 bundlePathsWithinEntries:a3 withExtension:0 andNames:0];
}

+ (id)bundlePathsWithinEntries:(id)a3 withExtension:(id)a4
{
  return [a1 bundlePathsWithinEntries:a3 withExtension:a4 andNames:0];
}

+ (id)bundlePathsWithinEntries:(id)a3 withExtension:(id)a4 andNames:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[NSMutableArray array];
  if (v7 && [v7 count])
  {
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v62 = v7;
    id obj = v7;
    id v67 = [obj countByEnumeratingWithState:&v83 objects:v90 count:16];
    if (!v67) {
      goto LABEL_71;
    }
    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    int v12 = !v11;
    int v69 = v12;
    id v65 = v9;
    uint64_t v66 = *(void *)v84;
    id v70 = v8;
    v64 = v10;
    while (1)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v84 != v66) {
          objc_enumerationMutation(obj);
        }
        uint64_t v68 = v13;
        v14 = *(void **)(*((void *)&v83 + 1) + 8 * v13);
        unsigned int v15 = [v14 recursive];
        v16 = +[NSFileManager defaultManager];
        v17 = [v14 path];
        if (!v15)
        {
          v18 = [v16 contentsOfDirectoryAtPath:v17 error:0];

          if (v69)
          {
            if ([v8 length])
            {
              v33 = +[NSMutableArray array];
              long long v79 = 0u;
              long long v80 = 0u;
              long long v81 = 0u;
              long long v82 = 0u;
              id v34 = v9;
              id v35 = [v34 countByEnumeratingWithState:&v79 objects:v89 count:16];
              if (v35)
              {
                id v36 = v35;
                uint64_t v37 = *(void *)v80;
                do
                {
                  for (i = 0; i != v36; i = (char *)i + 1)
                  {
                    if (*(void *)v80 != v37) {
                      objc_enumerationMutation(v34);
                    }
                    v39 = +[NSString stringWithFormat:@"%@.%@", *(void *)(*((void *)&v79 + 1) + 8 * i), v8];
                    v40 = +[NSPredicate predicateWithFormat:@"SELF MATCHES %@", v39];
                    v41 = [v18 filteredArrayUsingPredicate:v40];
                    [v33 addObjectsFromArray:v41];

                    id v8 = v70;
                  }
                  id v36 = [v34 countByEnumeratingWithState:&v79 objects:v89 count:16];
                }
                while (v36);
                goto LABEL_53;
              }
              goto LABEL_54;
            }
          }
          else if (!v9)
          {
            if (v8 && [v8 length])
            {
              id v34 = +[NSString stringWithFormat:@".%@", v8];
              v58 = +[NSPredicate predicateWithFormat:@"SELF ENDSWITH %@", v34];
              v33 = [v18 filteredArrayUsingPredicate:v58];
            }
            else
            {
              id v34 = +[NSPredicate predicateWithFormat:@"pathExtension.length > 0"];
              v33 = [v18 filteredArrayUsingPredicate:v34];
            }
            goto LABEL_54;
          }
          v33 = +[NSMutableArray array];
          long long v75 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          long long v78 = 0u;
          id v34 = v9;
          id v42 = [v34 countByEnumeratingWithState:&v75 objects:v88 count:16];
          if (v42)
          {
            id v43 = v42;
            uint64_t v44 = *(void *)v76;
            do
            {
              for (j = 0; j != v43; j = (char *)j + 1)
              {
                if (*(void *)v76 != v44) {
                  objc_enumerationMutation(v34);
                }
                v46 = +[NSString stringWithFormat:@"%@.", *(void *)(*((void *)&v75 + 1) + 8 * (void)j)];
                v47 = +[NSPredicate predicateWithFormat:@"SELF BEGINSWITH %@", v46];
                v48 = [v18 filteredArrayUsingPredicate:v47];
                [v33 addObjectsFromArray:v48];
              }
              id v43 = [v34 countByEnumeratingWithState:&v75 objects:v88 count:16];
            }
            while (v43);
            id v8 = v70;
LABEL_53:
            v10 = v64;
            id v9 = v65;
          }
LABEL_54:

          if ([v33 count])
          {
            id v49 = objc_alloc_init((Class)NSMutableArray);
            long long v71 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            id v50 = v33;
            id v51 = [v50 countByEnumeratingWithState:&v71 objects:v87 count:16];
            if (v51)
            {
              id v52 = v51;
              uint64_t v53 = *(void *)v72;
              do
              {
                for (k = 0; k != v52; k = (char *)k + 1)
                {
                  if (*(void *)v72 != v53) {
                    objc_enumerationMutation(v50);
                  }
                  uint64_t v55 = *(void *)(*((void *)&v71 + 1) + 8 * (void)k);
                  v56 = [v14 path];
                  v57 = [v56 stringByAppendingPathComponent:v55];
                  [v49 addObject:v57];
                }
                id v52 = [v50 countByEnumeratingWithState:&v71 objects:v87 count:16];
              }
              while (v52);
            }

            v10 = v64;
            [v64 addObjectsFromArray:v49];

            id v8 = v70;
            id v9 = v65;
          }

          goto LABEL_64;
        }
        v18 = [v16 enumeratorAtPath:v17];

        uint64_t v19 = [v18 nextObject];
        if (v19)
        {
          v20 = (void *)v19;
          while (!v69)
          {
            if (v9) {
              goto LABEL_23;
            }
            if (v8 && [v8 length])
            {
              v28 = [v20 pathExtension];
              unsigned __int8 v29 = [v28 isEqualToString:v8];

              if ((v29 & 1) == 0) {
                goto LABEL_32;
              }
              goto LABEL_30;
            }
            v30 = [v20 pathExtension];
            id v31 = [v30 length];

            if (v31) {
              goto LABEL_30;
            }
LABEL_32:
            uint64_t v32 = [v18 nextObject];

            v20 = (void *)v32;
            if (!v32) {
              goto LABEL_64;
            }
          }
          if ([v8 length])
          {
            v21 = [v20 lastPathComponent];
            v22 = [v21 stringByDeletingPathExtension];
            if ([v9 containsObject:v22])
            {
              v23 = [v20 pathExtension];
              unsigned __int8 v24 = [v23 isEqualToString:v8];

              if ((v24 & 1) == 0) {
                goto LABEL_32;
              }
LABEL_30:
              v21 = [v14 path];
              v22 = [v21 stringByAppendingPathComponent:v20];
              [v10 addObject:v22];
            }

            goto LABEL_32;
          }
LABEL_23:
          v25 = [v20 lastPathComponent];
          v26 = [v25 stringByDeletingPathExtension];
          unsigned __int8 v27 = [v9 containsObject:v26];

          if ((v27 & 1) == 0) {
            goto LABEL_32;
          }
          goto LABEL_30;
        }
LABEL_64:

        uint64_t v13 = v68 + 1;
      }
      while ((id)(v68 + 1) != v67);
      id v59 = [obj countByEnumeratingWithState:&v83 objects:v90 count:16];
      id v67 = v59;
      if (!v59)
      {
LABEL_71:

        id v7 = v62;
        break;
      }
    }
  }
  v60 = +[NSArray arrayWithArray:v10];

  return v60;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (BOOL)recursive
{
  return self->_recursive;
}

- (void)setRecursive:(BOOL)a3
{
  self->_recursive = a3;
}

- (void).cxx_destruct
{
}

@end