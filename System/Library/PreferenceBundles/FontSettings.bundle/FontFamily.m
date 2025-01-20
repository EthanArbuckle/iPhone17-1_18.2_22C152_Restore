@interface FontFamily
- (BOOL)isDeletable;
- (BOOL)isDownloadable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProcessing;
- (BOOL)matches:(id)a3;
- (NSArray)fonts;
- (NSArray)postScriptFontNames;
- (NSString)copyrightString;
- (NSString)description;
- (NSString)familyName;
- (NSString)localizedFamilyName;
- (NSString)providerIdentifier;
- (NSString)providerLocalizedName;
- (NSString)versionString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)init:(id)a3 withPostScriptNames:(id)a4 forInstallKind:(int64_t)a5;
- (id)localizedName:(id)a3;
- (id)synthesizeFonts;
- (int64_t)compareLocalizedFamilyName:(id)a3;
- (int64_t)installKind;
- (unint64_t)fileSize;
- (unint64_t)hash;
- (void)setIsProcessing:(BOOL)a3;
- (void)setProviderIdentifier:(id)a3;
- (void)setProviderLocalizedName:(id)a3;
@end

@implementation FontFamily

- (id)init:(id)a3 withPostScriptNames:(id)a4 forInstallKind:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FontFamily;
  v11 = [(FontFamily *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_familyName, a3);
    v12->_installKind = a5;
    objc_storeStrong((id *)&v12->_postScriptFontNames, a4);
    fonts = v12->_fonts;
    v12->_fonts = 0;
  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  v5 = [(FontFamily *)self familyName];
  v6 = [(FontFamily *)self postScriptFontNames];
  id v7 = objc_msgSend(v4, "init:withPostScriptNames:forInstallKind:", v5, v6, -[FontFamily installKind](self, "installKind"));

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FontFamily *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(FontFamily *)self familyName];
      id v7 = [(FontFamily *)v5 familyName];
      if ([v6 isEqualToString:v7])
      {
        id v8 = [(FontFamily *)self installKind];
        char v9 = v8 == (id)[(FontFamily *)v5 installKind];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(FontFamily *)self familyName];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = [(FontFamily *)self installKind] ^ v4;

  return v5;
}

- (int64_t)compareLocalizedFamilyName:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(FontFamily *)self localizedFamilyName];
  v6 = [v4 localizedFamilyName];

  id v7 = [v5 localizedStandardCompare:v6];
  return (int64_t)v7;
}

- (NSArray)fonts
{
  fonts = self->_fonts;
  if (!fonts)
  {
    id v4 = [(FontFamily *)self synthesizeFonts];
    unint64_t v5 = self->_fonts;
    self->_fonts = v4;

    fonts = self->_fonts;
  }

  return fonts;
}

- (id)synthesizeFonts
{
  if (self->_installKind == 1)
  {
    v2 = 0;
  }
  else
  {
    v2 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self->_postScriptFontNames count]];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = self->_postScriptFontNames;
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          id v10 = +[UIFont fontWithName:v9 size:12.0];
          if (v10) {
            [v2 addObject:v10];
          }
          else {
            NSLog(@"FontSettings: couldn't create a font \"%@\"", v9);
          }
        }
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }

  return v2;
}

- (NSString)description
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(FontFamily *)self postScriptFontNames];
  id v4 = [v3 sortedArrayUsingSelector:"compare:"];

  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        if (v7)
        {
          id v10 = +[NSString stringWithFormat:@", %@", *(void *)(*((void *)&v14 + 1) + 8 * i)];
          [v7 appendString:v10];
        }
        else
        {
          uint64_t v7 = +[NSMutableString stringWithString:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  v11 = +[NSString stringWithFormat:@"family:\"%@\" (%@)", self->_familyName, v7];
  if (self->_providerLocalizedName)
  {
    uint64_t v12 = +[NSString stringWithFormat:@"%@ provider:%@ (%@)", v11, self->_providerLocalizedName, self->_providerIdentifier];

    v11 = (void *)v12;
  }

  return (NSString *)v11;
}

- (unint64_t)fileSize
{
  return 0;
}

- (id)localizedName:(id)a3
{
  id v4 = (__CFString *)a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(FontFamily *)self fonts];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        CFStringRef v10 = CTFontCopyLocalizedName(*(CTFontRef *)(*((void *)&v13 + 1) + 8 * i), v4, 0);
        if (v10)
        {
          v11 = (__CFString *)v10;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (NSString)localizedFamilyName
{
  localizedFamilyName = self->_localizedFamilyName;
  if (!localizedFamilyName)
  {
    id v4 = [(FontFamily *)self localizedName:kCTFontFamilyNameKey];
    id v5 = self->_localizedFamilyName;
    self->_localizedFamilyName = v4;

    localizedFamilyName = self->_localizedFamilyName;
  }

  return localizedFamilyName;
}

- (NSString)copyrightString
{
  return (NSString *)[(FontFamily *)self localizedName:kCTFontCopyrightNameKey];
}

- (NSString)versionString
{
  return (NSString *)[(FontFamily *)self localizedName:kCTFontVersionNameKey];
}

- (void)setProviderLocalizedName:(id)a3
{
}

- (void)setProviderIdentifier:(id)a3
{
}

- (BOOL)isDeletable
{
  return 0;
}

- (BOOL)isDownloadable
{
  return 0;
}

- (BOOL)matches:(id)a3
{
  id v4 = a3;
  if ([v4 stringMatchesPattern:self->_familyName])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    id v6 = [(FontFamily *)self localizedFamilyName];
    if ([v4 stringMatchesPattern:v6]) {
      unsigned __int8 v5 = 1;
    }
    else {
      unsigned __int8 v5 = [v4 stringMatchesPattern:self->_providerLocalizedName];
    }
  }
  return v5;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSArray)postScriptFontNames
{
  return self->_postScriptFontNames;
}

- (NSString)providerLocalizedName
{
  return self->_providerLocalizedName;
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (int64_t)installKind
{
  return self->_installKind;
}

- (BOOL)isProcessing
{
  return self->_isProcessing;
}

- (void)setIsProcessing:(BOOL)a3
{
  self->_isProcessing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_providerLocalizedName, 0);
  objc_storeStrong((id *)&self->_postScriptFontNames, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_localizedFamilyName, 0);

  objc_storeStrong((id *)&self->_fonts, 0);
}

@end