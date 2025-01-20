@interface GEOComposedStringSubstitutionCandidate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GEOComposedString)composedString;
- (GEOComposedStringSubstitutionCandidate)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)waypointCategory;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedStringSubstitutionCandidate

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[GEOComposedStringSubstitutionCandidate allocWithZone:a3] init];
  v4->_waypointCategory = self->_waypointCategory;
  objc_storeStrong((id *)&v4->_composedString, self->_composedString);
  uint64_t v5 = [(GEOComposedStringOptions *)self->_optionsToUse copy];
  optionsToUse = v4->_optionsToUse;
  v4->_optionsToUse = (GEOComposedStringOptions *)v5;

  return v4;
}

- (GEOComposedStringSubstitutionCandidate)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedStringSubstitutionCandidate;
  uint64_t v5 = [(GEOComposedStringSubstitutionCandidate *)&v10 init];
  if (v5)
  {
    v5->_waypointCategory = [v4 decodeIntegerForKey:@"_waypointCategory"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_composedString"];
    composedString = v5->_composedString;
    v5->_composedString = (GEOComposedString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t waypointCategory = self->_waypointCategory;
  id v5 = a3;
  [v5 encodeInteger:waypointCategory forKey:@"_waypointCategory"];
  [v5 encodeObject:self->_composedString forKey:@"_composedString"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    v17.receiver = self;
    v17.super_class = (Class)GEOComposedStringSubstitutionCandidate;
    if ([(GEOComposedStringSubstitutionCandidate *)&v17 isEqual:v5]
      && self->_waypointCategory == *((_DWORD *)v5 + 2)
      && ((uint64_t v6 = (void *)v5[2], v7 = self->_composedString, v8 = v6, !(v7 | v8))
       || (v9 = (void *)v8, BOOL v10 = [(id)v7 isEqual:v8], v9, (id)v7, v10)))
    {
      optionsToUse = self->_optionsToUse;
      uint64_t v12 = v5[3];
      id v13 = optionsToUse;
      v14 = v13;
      if ((unint64_t)v13 | v12) {
        char v15 = [v13 isEqual:v12];
      }
      else {
        char v15 = 1;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (int)waypointCategory
{
  return self->_waypointCategory;
}

- (GEOComposedString)composedString
{
  return self->_composedString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsToUse, 0);

  objc_storeStrong((id *)&self->_composedString, 0);
}

@end