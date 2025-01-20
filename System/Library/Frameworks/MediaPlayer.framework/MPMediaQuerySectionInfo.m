@interface MPMediaQuerySectionInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)hasUnknownSection;
- (MPMediaQuerySectionInfo)initWithCoder:(id)a3;
- (NSArray)sectionIndexTitles;
- (NSArray)sections;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (unint64_t)indexOfSectionForSectionIndexTitleAtIndex:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setHasUnknownSection:(BOOL)a3;
- (void)setSectionIndexTitles:(id)a3;
@end

@implementation MPMediaQuerySectionInfo

- (void)setSectionIndexTitles:(id)a3
{
  id v11 = a3;
  v4 = (NSArray *)[v11 copy];
  sectionIndexTitles = self->_sectionIndexTitles;
  self->_sectionIndexTitles = v4;

  v6 = [(NSArray *)self->_sections lastObject];
  uint64_t v7 = [v6 sectionIndexTitleIndex];
  if (v7 == [v11 count] - 1 && (objc_msgSend(v6, "range"), v8))
  {
    self->_hasUnknownSection = 1;
    v9 = (NSArray *)[v11 copy];
  }
  else
  {
    self->_hasUnknownSection = 0;
    objc_msgSend(v11, "subarrayWithRange:", 0, objc_msgSend(v11, "count") - 1);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  v10 = self->_sectionIndexTitles;
  self->_sectionIndexTitles = v9;
}

- (unint64_t)count
{
  v2 = [(NSArray *)self->_sections lastObject];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 range];
    unint64_t v6 = v4 + v5;
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (NSArray)sections
{
  return self->_sections;
}

- (NSArray)sectionIndexTitles
{
  return self->_sectionIndexTitles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIndexTitles, 0);

  objc_storeStrong((id *)&self->_sections, 0);
}

- (void)setHasUnknownSection:(BOOL)a3
{
  self->_hasUnknownSection = a3;
}

- (BOOL)hasUnknownSection
{
  return self->_hasUnknownSection;
}

- (unint64_t)indexOfSectionForSectionIndexTitleAtIndex:(unint64_t)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v5 = [(NSArray *)self->_sectionIndexTitles count] - 1;
  sections = self->_sections;
  if (v5 == a3)
  {
    unint64_t v7 = [(NSArray *)sections count] - 1;
    v11[3] = v7;
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__MPMediaQuerySectionInfo_indexOfSectionForSectionIndexTitleAtIndex___block_invoke;
    v9[3] = &unk_1E57F2228;
    v9[4] = &v10;
    v9[5] = a3;
    [(NSArray *)sections enumerateObjectsUsingBlock:v9];
    unint64_t v7 = v11[3];
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

unint64_t __69__MPMediaQuerySectionInfo_indexOfSectionForSectionIndexTitleAtIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t result = [a2 sectionIndexTitleIndex];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v8 = *(void *)(a1 + 40);
    if (result != v8)
    {
      if (result <= v8) {
        return result;
      }
      --a3;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(MPMediaQueryMutableSectionInfo);
  uint64_t v5 = [(NSArray *)self->_sections mutableCopy];
  sections = v4->super._sections;
  v4->super._sections = (NSArray *)v5;

  uint64_t v7 = [(NSArray *)self->_sectionIndexTitles copy];
  sectionIndexTitles = v4->super._sectionIndexTitles;
  v4->super._sectionIndexTitles = (NSArray *)v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    [v4 encodeObject:self->_sections forKey:@"MPSections"];
    [v4 encodeObject:self->_sectionIndexTitles forKey:@"MPSectionIndexTitles"];
  }
}

- (MPMediaQuerySectionInfo)initWithCoder:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    unint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"MPSections"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v26 = v8;
      sections = v8;
      uint64_t v10 = [(NSArray *)sections countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v33;
LABEL_5:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(sections);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          if (v11 == ++v13)
          {
            uint64_t v11 = [(NSArray *)sections countByEnumeratingWithState:&v32 objects:v37 count:16];
            if (v11) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
      }
      else
      {
LABEL_11:

        v14 = sections;
        sections = self->_sections;
        self->_sections = v14;
      }

      unint64_t v8 = v26;
    }
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v18 = [v4 decodeObjectOfClasses:v17 forKey:@"MPSectionIndexTitles"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_25;
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      v27 = v8;
      uint64_t v22 = *(void *)v29;
      int v23 = 1;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v19);
          }
          objc_opt_class();
          v23 &= objc_opt_isKindOfClass();
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v21);

      unint64_t v8 = v27;
      if ((v23 & 1) == 0) {
        goto LABEL_25;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_sectionIndexTitles, v18);
LABEL_25:
  }
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MPMediaQuerySectionInfo);
  uint64_t v5 = [(NSArray *)self->_sections copy];
  sections = v4->_sections;
  v4->_sections = (NSArray *)v5;

  uint64_t v7 = [(NSArray *)self->_sectionIndexTitles copy];
  sectionIndexTitles = v4->_sectionIndexTitles;
  v4->_sectionIndexTitles = (NSArray *)v7;

  return v4;
}

- (id)description
{
  return [(NSArray *)self->_sections description];
}

@end