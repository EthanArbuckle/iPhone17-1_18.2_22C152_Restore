@interface MKPointOfInterestFilter
+ (BOOL)supportsSecureCoding;
+ (MKPointOfInterestFilter)filterExcludingAllCategories;
+ (MKPointOfInterestFilter)filterIncludingAllCategories;
- (BOOL)_excludesAllCategories;
- (BOOL)_includesAllCategories;
- (BOOL)_isAllCategories;
- (BOOL)_isInclusive;
- (BOOL)excludesCategory:(MKPointOfInterestCategory)category;
- (BOOL)includesCategory:(MKPointOfInterestCategory)category;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPointOfInterestFilter:(id)a3;
- (MKPointOfInterestFilter)init;
- (MKPointOfInterestFilter)initExcludingCategories:(NSArray *)categories;
- (MKPointOfInterestFilter)initIncludingCategories:(NSArray *)categories;
- (MKPointOfInterestFilter)initWithCoder:(id)a3;
- (id)_geoPOICategoryFilter;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initIncludingCategories:(id)a3 excludingCategories:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MKPointOfInterestFilter

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (MKPointOfInterestFilter)filterIncludingAllCategories
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initExcludingCategories:MEMORY[0x1E4F1CBF0]];

  return (MKPointOfInterestFilter *)v2;
}

+ (MKPointOfInterestFilter)filterExcludingAllCategories
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initIncludingCategories:MEMORY[0x1E4F1CBF0]];

  return (MKPointOfInterestFilter *)v2;
}

- (MKPointOfInterestFilter)init
{
  return [(MKPointOfInterestFilter *)self initExcludingCategories:MEMORY[0x1E4F1CBF0]];
}

- (MKPointOfInterestFilter)initIncludingCategories:(NSArray *)categories
{
  v4 = categories;
  v9.receiver = self;
  v9.super_class = (Class)MKPointOfInterestFilter;
  v5 = [(MKPointOfInterestFilter *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    includedCategories = v5->_includedCategories;
    v5->_includedCategories = (NSSet *)v6;
  }
  return v5;
}

- (MKPointOfInterestFilter)initExcludingCategories:(NSArray *)categories
{
  v4 = categories;
  v9.receiver = self;
  v9.super_class = (Class)MKPointOfInterestFilter;
  v5 = [(MKPointOfInterestFilter *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    excludedCategories = v5->_excludedCategories;
    v5->_excludedCategories = (NSSet *)v6;
  }
  return v5;
}

- (id)initIncludingCategories:(id)a3 excludingCategories:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MKPointOfInterestFilter;
  v8 = [(MKPointOfInterestFilter *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    includedCategories = v8->_includedCategories;
    v8->_includedCategories = (NSSet *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    excludedCategories = v8->_excludedCategories;
    v8->_excludedCategories = (NSSet *)v11;
  }
  return v8;
}

- (MKPointOfInterestFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MKPointOfInterestFilter;
  v5 = [(MKPointOfInterestFilter *)&v14 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"MKPointOfInterestFilterInclusions"];
    includedCategories = v5->_includedCategories;
    v5->_includedCategories = (NSSet *)v9;

    uint64_t v11 = [v4 decodeObjectOfClasses:v8 forKey:@"MKPointOfInterestFilterExclusions"];
    excludedCategories = v5->_excludedCategories;
    v5->_excludedCategories = (NSSet *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  includedCategories = self->_includedCategories;
  id v7 = v4;
  if (includedCategories)
  {
    [v4 encodeObject:includedCategories forKey:@"MKPointOfInterestFilterInclusions"];
    id v4 = v7;
  }
  excludedCategories = self->_excludedCategories;
  if (excludedCategories)
  {
    [v7 encodeObject:excludedCategories forKey:@"MKPointOfInterestFilterExclusions"];
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 1, self->_includedCategories);
    objc_storeStrong(v5 + 2, self->_excludedCategories);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(MKPointOfInterestFilter *)self isEqualToPointOfInterestFilter:v4];

  return v5;
}

- (BOOL)isEqualToPointOfInterestFilter:(id)a3
{
  id v4 = a3;
  if (v4
    && ((includedCategories = self->_includedCategories, !((unint64_t)includedCategories | v4[1]))
     || -[NSSet isEqualToSet:](includedCategories, "isEqualToSet:")))
  {
    excludedCategories = self->_excludedCategories;
    if ((unint64_t)excludedCategories | v4[2]) {
      char v7 = -[NSSet isEqualToSet:](excludedCategories, "isEqualToSet:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)includesCategory:(MKPointOfInterestCategory)category
{
  id v4 = category;
  includedCategories = self->_includedCategories;
  if (includedCategories)
  {
    LOBYTE(v6) = [(NSSet *)includedCategories containsObject:v4];
  }
  else
  {
    excludedCategories = self->_excludedCategories;
    if (excludedCategories) {
      BOOL v6 = ![(NSSet *)excludedCategories containsObject:v4];
    }
    else {
      LOBYTE(v6) = 1;
    }
  }

  return v6;
}

- (BOOL)excludesCategory:(MKPointOfInterestCategory)category
{
  id v4 = category;
  excludedCategories = self->_excludedCategories;
  if (excludedCategories)
  {
    LOBYTE(v6) = [(NSSet *)excludedCategories containsObject:v4];
  }
  else
  {
    includedCategories = self->_includedCategories;
    if (includedCategories) {
      BOOL v6 = ![(NSSet *)includedCategories containsObject:v4];
    }
    else {
      LOBYTE(v6) = 0;
    }
  }

  return v6;
}

- (id)_geoPOICategoryFilter
{
  v3 = GEOPOICategoriesForPointOfInterestCategories(self->_includedCategories);
  id v4 = GEOPOICategoriesForPointOfInterestCategories(self->_excludedCategories);
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F647F0]) initWithCategoriesToInclude:v3 categoriesToExclude:v4];

  return v5;
}

- (BOOL)_includesAllCategories
{
  if (self->_includedCategories)
  {
    LOBYTE(excludedCategories) = 0;
  }
  else
  {
    excludedCategories = self->_excludedCategories;
    if (excludedCategories) {
      LOBYTE(excludedCategories) = [(NSSet *)excludedCategories count] == 0;
    }
  }
  return (char)excludedCategories;
}

- (BOOL)_excludesAllCategories
{
  if (self->_excludedCategories)
  {
    LOBYTE(includedCategories) = 0;
  }
  else
  {
    includedCategories = self->_includedCategories;
    if (includedCategories) {
      LOBYTE(includedCategories) = [(NSSet *)includedCategories count] == 0;
    }
  }
  return (char)includedCategories;
}

- (id)description
{
  if ([(MKPointOfInterestFilter *)self _includesAllCategories])
  {
    v3 = @"Include: All";
  }
  else if ([(MKPointOfInterestFilter *)self _excludesAllCategories])
  {
    v3 = @"Exclude: All";
  }
  else
  {
    if (self->_includedCategories) {
      [NSString stringWithFormat:@"Include: %@", self->_includedCategories];
    }
    else {
    v3 = [NSString stringWithFormat:@"Exclude: %@", self->_excludedCategories];
    }
  }
  id v4 = NSString;
  BOOL v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  char v7 = [v4 stringWithFormat:@"%@: %p %@", v6, self, v3];

  return v7;
}

- (BOOL)_isInclusive
{
  if ([(MKPointOfInterestFilter *)self _includesAllCategories]) {
    return 1;
  }
  if ([(MKPointOfInterestFilter *)self _excludesAllCategories]) {
    return 0;
  }
  return self->_includedCategories != 0;
}

- (BOOL)_isAllCategories
{
  if ([(MKPointOfInterestFilter *)self _includesAllCategories]) {
    return 1;
  }

  return [(MKPointOfInterestFilter *)self _excludesAllCategories];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedCategories, 0);

  objc_storeStrong((id *)&self->_includedCategories, 0);
}

@end