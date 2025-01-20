@interface LSResourceProxy
+ (BOOL)supportsSecureCoding;
- (BOOL)boundIconIsBadge;
- (LSIconResourceLocator)iconResourceLocator;
- (LSResourceProxy)initWithCoder:(id)a3;
- (NSDictionary)iconsDictionary;
- (NSString)localizedName;
- (NSString)primaryIconName;
- (_LSBoundIconInfo)_boundIconInfo;
- (_LSLazyPropertyList)_iconsDictionary;
- (id)_initWithLocalizedName:(id)a3;
- (id)_privateDocumentFileNamesAsCacheKey;
- (id)iconDataForStyle:(id)a3 width:(int64_t)a4 height:(int64_t)a5 options:(unint64_t)a6;
- (id)iconDataForVariant:(int)a3;
- (id)iconDataForVariant:(int)a3 withOptions:(int)a4;
- (id)uniqueIdentifier;
- (unint64_t)propertyListCachingStrategy;
- (void)_setBoundIconInfo:(id)a3;
- (void)_setIconsDictionary:(id)a3;
- (void)_setLocalizedName:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)primaryIconName;
@end

@implementation LSResourceProxy

- (id)_initWithLocalizedName:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LSResourceProxy;
  v5 = [(_LSQueryResult *)&v11 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)v5[1];
    v5[1] = v6;

    if (IconServicesLibrary_frameworkLibrary_3
      || (IconServicesLibrary_frameworkLibrary_3 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2)) != 0)
    {
      v8 = objc_alloc_init(_LSBoundIconInfo);
      v9 = (void *)v5[2];
      v5[2] = v8;
    }
  }

  return v5;
}

- (_LSBoundIconInfo)_boundIconInfo
{
  return self->__boundIconInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__iconsDictionary, 0);
  objc_storeStrong((id *)&self->__boundIconInfo, 0);

  objc_storeStrong((id *)&self->_localizedName, 0);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)_setLocalizedName:(id)a3
{
}

- (BOOL)boundIconIsBadge
{
  if (IconServicesLibrary_frameworkLibrary_3
    || (v3 = dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2),
        (IconServicesLibrary_frameworkLibrary_3 = (uint64_t)v3) != 0))
  {
    id v4 = [(LSResourceProxy *)self _boundIconInfo];
    BOOL v5 = -[_LSBoundIconInfo isBadge]((BOOL)v4);

    LOBYTE(v3) = v5;
  }
  return (char)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSResourceProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LSResourceProxy;
  BOOL v5 = [(_LSQueryResult *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"localizedName");
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v6;

    if (IconServicesLibrary_frameworkLibrary_3
      || (IconServicesLibrary_frameworkLibrary_3 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2)) != 0)
    {
      uint64_t v8 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"boundIconInfo");
      uint64_t v9 = 16;
    }
    else
    {
      uint64_t v8 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"iconsDictionary");
      uint64_t v9 = 24;
    }
    v10 = *(Class *)((char *)&v5->super.super.isa + v9);
    *(Class *)((char *)&v5->super.super.isa + v9) = (Class)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_localizedName forKey:@"localizedName"];
  id v4 = @"boundIconInfo";
  BOOL v5 = &OBJC_IVAR___LSResourceProxy___boundIconInfo;
  if (!IconServicesLibrary_frameworkLibrary_3)
  {
    IconServicesLibrary_frameworkLibrary_3 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2);
    if (!IconServicesLibrary_frameworkLibrary_3)
    {
      BOOL v5 = &OBJC_IVAR___LSResourceProxy___iconsDictionary;
      id v4 = @"iconsDictionary";
    }
  }
  [v6 encodeObject:*(Class *)((char *)&self->super.super.isa + *v5) forKey:v4];
}

- (id)uniqueIdentifier
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"Unimplemented exception" reason:@"Subclasses must implement -uniqueIdentifier" userInfo:0];
  objc_exception_throw(v2);
}

- (LSIconResourceLocator)iconResourceLocator
{
  if (IconServicesLibrary_frameworkLibrary_3
    || (v3 = dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2),
        (IconServicesLibrary_frameworkLibrary_3 = (uint64_t)v3) != 0))
  {
    v3 = [(LSResourceProxy *)self _boundIconInfo];
  }

  return (LSIconResourceLocator *)v3;
}

- (NSDictionary)iconsDictionary
{
  if (IconServicesLibrary_frameworkLibrary_3
    || (IconServicesLibrary_frameworkLibrary_3 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2)) != 0)
  {
    v3 = [(LSResourceProxy *)self _boundIconInfo];
    id v4 = -[_LSBoundIconInfo iconsDictionary]((uint64_t)v3);
    BOOL v5 = -[_LSLazyPropertyList propertyList](v4);
  }
  else
  {
    v3 = [(LSResourceProxy *)self _iconsDictionary];
    BOOL v5 = -[_LSLazyPropertyList propertyList](v3);
  }

  return (NSDictionary *)v5;
}

- (NSString)primaryIconName
{
  if (IconServicesLibrary_frameworkLibrary_3
    || (IconServicesLibrary_frameworkLibrary_3 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2)) != 0)
  {
    v3 = [(LSResourceProxy *)self _boundIconInfo];
    id v4 = -[_LSBoundIconInfo iconsDictionary]((uint64_t)v3);

    if (v4) {
      goto LABEL_4;
    }
  }
  else
  {
    id v4 = [(LSResourceProxy *)self _iconsDictionary];
    if (v4)
    {
LABEL_4:
      BOOL v5 = [v4 objectForKey:@"CFBundlePrimaryIcon" ofClass:0];
      if (_NSIsNSDictionary())
      {
        id v6 = [v5 objectForKey:@"CFBundleIconName"];
      }
      else
      {
        if (!_NSIsNSString()) {
          goto LABEL_13;
        }
        id v6 = v5;
      }
      v7 = v6;
      if (!v6 || (_NSIsNSString() & 1) != 0) {
        goto LABEL_14;
      }
      uint64_t v8 = _LSDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(LSResourceProxy *)(uint64_t)v7 primaryIconName];
      }

LABEL_13:
      v7 = 0;
LABEL_14:

      goto LABEL_17;
    }
  }
  v7 = 0;
LABEL_17:

  return (NSString *)v7;
}

- (id)iconDataForStyle:(id)a3 width:(int64_t)a4 height:(int64_t)a5 options:(unint64_t)a6
{
  return 0;
}

- (id)iconDataForVariant:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (IconServicesLibrary_frameworkLibrary_3
    || (BOOL v5 = dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2),
        (IconServicesLibrary_frameworkLibrary_3 = (uint64_t)v5) != 0))
  {
    BOOL v5 = [(LSResourceProxy *)self iconDataForVariant:v3 withOptions:0];
  }

  return v5;
}

- (id)_privateDocumentFileNamesAsCacheKey
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [(LSResourceProxy *)self _boundIconInfo];
  uint64_t v3 = -[_LSBoundIconInfo fileNames]((uint64_t)v2);

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA48];
    BOOL v5 = -[_LSBoundIconInfo fileNames]((uint64_t)v2);
    id v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v7 = -[_LSBoundIconInfo fileNames]((uint64_t)v2);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_super v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "stringByReplacingOccurrencesOfString:withString:", @"/", @":", (void)v15);
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    v13 = [v6 componentsJoinedByString:@"_"];
  }
  else
  {
    v13 = @"defaultIcon";
  }

  return v13;
}

- (id)iconDataForVariant:(int)a3 withOptions:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if (IconServicesLibrary_frameworkLibrary_3
    || (v7 = dlopen("/System/Library/PrivateFrameworks/IconServices.framework/IconServices", 2),
        (IconServicesLibrary_frameworkLibrary_3 = (uint64_t)v7) != 0))
  {
    v7 = ((void (*)(void *, uint64_t, uint64_t))softLink_ISIconDataForResourceProxy_1[0])(self, v5, v4);
  }

  return v7;
}

- (unint64_t)propertyListCachingStrategy
{
  return 0;
}

- (void)_setBoundIconInfo:(id)a3
{
}

- (_LSLazyPropertyList)_iconsDictionary
{
  return self->__iconsDictionary;
}

- (void)_setIconsDictionary:(id)a3
{
}

- (void)primaryIconName
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138543362;
  uint64_t v4 = objc_opt_class();
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "Expected icon name to be a string, but it was a %{public}@", (uint8_t *)&v3, 0xCu);
}

@end