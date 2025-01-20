@interface UserInstalledFontFamily
- (BOOL)isDeletable;
- (NSArray)fontFilePaths;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fontDescriptors;
- (id)init:(id)a3 withPostScriptNames:(id)a4 andFontFiles:(id)a5;
- (id)synthesizeFonts;
- (unint64_t)fileSize;
- (void)setFontFilePaths:(id)a3;
@end

@implementation UserInstalledFontFamily

- (id)init:(id)a3 withPostScriptNames:(id)a4 andFontFiles:(id)a5
{
  id v8 = a5;
  v9 = [(FontFamily *)self init:a3 withPostScriptNames:a4 forInstallKind:1];
  if (v9)
  {
    id v10 = [objc_alloc((Class)NSSet) initWithArray:v8];
    uint64_t v11 = [v10 allObjects];
    v12 = (void *)v9[9];
    v9[9] = v11;
  }
  return v9;
}

- (BOOL)isDeletable
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  v5 = [(FontFamily *)self familyName];
  v6 = [(FontFamily *)self postScriptFontNames];
  v7 = [(UserInstalledFontFamily *)self fontFilePaths];
  id v8 = [v4 init:v5 withPostScriptNames:v6 andFontFiles:v7];

  return v8;
}

- (id)fontDescriptors
{
  id v21 = (id)objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obj = self->_fontFilePaths;
  id v18 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v27;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(obj);
        }
        CFURLRef v4 = +[NSURL fileURLWithPath:*(void *)(*((void *)&v26 + 1) + 8 * i) isDirectory:0];
        CFArrayRef FontDescriptorsFromURL = CTFontManagerCreateFontDescriptorsFromURL(v4);
        if (FontDescriptorsFromURL)
        {
          CFURLRef v19 = v4;
          v20 = i;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          CFArrayRef v6 = FontDescriptorsFromURL;
          id v7 = [(__CFArray *)v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v7)
          {
            id v8 = v7;
            uint64_t v9 = *(void *)v23;
            do
            {
              for (j = 0; j != v8; j = (char *)j + 1)
              {
                if (*(void *)v23 != v9) {
                  objc_enumerationMutation(v6);
                }
                uint64_t v11 = *(const __CTFontDescriptor **)(*((void *)&v22 + 1) + 8 * (void)j);
                v12 = (void *)CTFontDescriptorCopyAttribute(v11, kCTFontFamilyNameAttribute);
                v13 = [(FontFamily *)self familyName];
                unsigned int v14 = [v12 isEqualToString:v13];

                if (v14) {
                  [v21 addObject:v11];
                }
              }
              id v8 = [(__CFArray *)v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v8);
          }

          CFRelease(v6);
          CFURLRef v4 = v19;
          i = v20;
        }
      }
      id v18 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v18);
  }

  return v21;
}

- (id)synthesizeFonts
{
  v2 = [(UserInstalledFontFamily *)self fontDescriptors];
  v3 = [v2 sortedArrayUsingComparator:&stru_1CCE8];

  CFURLRef v4 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", *(void *)(*((void *)&v12 + 1) + 8 * i), 12.0, (void)v12);
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (unint64_t)fileSize
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = self->_fontFilePaths;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = +[NSURL fileURLWithPath:*(void *)(*((void *)&v11 + 1) + 8 * i) isDirectory:0];
        id v10 = 0;
        if ([v8 getResourceValue:&v10 forKey:NSURLFileSizeKey error:0]) {
          v5 += (unint64_t)[v10 unsignedIntegerValue];
        }
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (NSArray)fontFilePaths
{
  return self->_fontFilePaths;
}

- (void)setFontFilePaths:(id)a3
{
}

- (void).cxx_destruct
{
}

@end