@interface GEOComposedStringArgument_Substitution
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GEOComposedStringArgument_Substitution)initWithCoder:(id)a3;
- (id)_initWithGeoFormatArgument:(id)a3;
- (id)_stringReplacementWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)waypointIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setSubstitutionForWaypointCategory:(int)a3;
- (void)setSubstitutionForWaypointCategory:(int)a3 handler:(id)a4;
@end

@implementation GEOComposedStringArgument_Substitution

- (void)setSubstitutionForWaypointCategory:(int)a3 handler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v14 = (void (**)(id, void *, void *))a4;
  substitutionCandidates = self->_substitutionCandidates;
  v7 = [NSNumber numberWithInt:v4];
  v8 = [(NSMapTable *)substitutionCandidates objectForKey:v7];

  if (v8)
  {
    if (v14)
    {
      v9 = (void *)[(GEOComposedStringSubstitutionCandidate_NoSubstitution *)v8 copy];

      v10 = [v9 composedString];
      v11 = [v10 defaultOptions];

      v12 = [v11 arguments];
      v14[2](v14, v9, v12);
      v8 = (GEOComposedStringSubstitutionCandidate_NoSubstitution *)objc_claimAutoreleasedReturnValue();

      if (v8) {
        objc_storeStrong((id *)&v8->super._optionsToUse, v11);
      }
      else {
        v8 = [[GEOComposedStringSubstitutionCandidate_NoSubstitution alloc] initWithCategory:v4];
      }
    }
  }
  else
  {
    v8 = [[GEOComposedStringSubstitutionCandidate_NoSubstitution alloc] initWithCategory:v4];
  }
  substituteToUse = self->_substituteToUse;
  self->_substituteToUse = &v8->super;
}

- (void)setSubstitutionForWaypointCategory:(int)a3
{
}

- (id)_initWithGeoFormatArgument:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)GEOComposedStringArgument_Substitution;
  v5 = [(GEOComposedStringArgument *)&v37 _initWithGeoFormatArgument:v4];
  if (v5)
  {
    v6 = [v4 genericCombinations];
    v7 = v6;
    if (v6
      && ([v6 substitutes],
          v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v8 count],
          v8,
          v9))
    {
      if ([v4 hasWaypointIndex]) {
        uint64_t v10 = (int)[v4 waypointIndex];
      }
      else {
        uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v5[4] = v10;
      uint64_t v12 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      v13 = (void *)v5[5];
      v5[5] = v12;

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v31 = v7;
      id obj = [v7 substitutes];
      uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v34;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v34 != v16) {
              objc_enumerationMutation(obj);
            }
            v18 = *(void **)(*((void *)&v33 + 1) + 8 * v17);
            v19 = [GEOComposedStringSubstitutionCandidate alloc];
            id v20 = v18;
            v21 = v20;
            if (v19)
            {
              v22 = [v20 substitute];

              if (v22)
              {
                v38.receiver = v19;
                v38.super_class = (Class)GEOComposedStringSubstitutionCandidate;
                v23 = [(GEOComposedStringArgument_Substitution *)&v38 init];
                if (!v23) {
                  goto LABEL_18;
                }
                LODWORD(v23->super._token) = [v21 waypointCategory];
                v24 = [GEOComposedString alloc];
                v19 = [v21 substitute];
                uint64_t v25 = [(GEOComposedString *)v24 initWithGeoFormattedString:v19];
                v26 = *(void **)&v23->super._type;
                *(void *)&v23->super._type = v25;
              }
              else
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
                {
                  LOWORD(v38.receiver) = 0;
                  _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: geoSubstituteData.substitute != ((void *)0)", (uint8_t *)&v38, 2u);
                }
                v23 = 0;
              }
            }
            else
            {
              v23 = 0;
            }
LABEL_18:

            v27 = (void *)v5[5];
            v28 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v21, "waypointCategory"));
            [v27 setObject:v23 forKey:v28];

            ++v17;
          }
          while (v15 != v17);
          uint64_t v29 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
          uint64_t v15 = v29;
        }
        while (v29);
      }

      v11 = v5;
      v7 = v31;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_stringReplacementWithOptions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  substituteToUse = self->_substituteToUse;
  if (substituteToUse)
  {
    v5 = [(GEOComposedStringSubstitutionCandidate *)substituteToUse composedString];
    if (v5)
    {
      v6 = self->_substituteToUse;
      if (v6) {
        v6 = (GEOComposedStringSubstitutionCandidate *)v6->_optionsToUse;
      }
      v7 = v6;
      v8 = [v5 stringResultWithOptions:v7];
      if ([v8 success])
      {
        uint64_t v9 = [v8 string];
      }
      else
      {
        uint64_t v12 = GEOGetGEOComposedStringLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          uint64_t v13 = [(GEOComposedStringSubstitutionCandidate *)self->_substituteToUse waypointCategory];
          if (v13 >= 0xE)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v13);
            uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            uint64_t v14 = off_1E53E1A80[(int)v13];
          }
          *(_DWORD *)buf = 138412290;
          v18 = v14;
          _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_FAULT, "Error finding string replacement for category (%@)", buf, 0xCu);
        }
        uint64_t v9 = 0;
      }
    }
    else
    {
      v7 = GEOGetGEOComposedStringLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [(GEOComposedStringSubstitutionCandidate *)self->_substituteToUse waypointCategory];
        if (v10 >= 0xE)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = off_1E53E1A80[(int)v10];
        }
        uint64_t v15 = [(GEOComposedStringArgument *)self token];
        *(_DWORD *)buf = 138412546;
        v18 = v11;
        __int16 v19 = 2112;
        id v20 = v15;
        _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEFAULT, "Unable to resolve [Generic_Combinations] with category [%@] for token %@", buf, 0x16u);
      }
      uint64_t v9 = 0;
    }
  }
  else
  {
    v5 = GEOGetGEOComposedStringLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "No substitute was specified when evaluating string with substitution type. setCandidateForWaypointCategory:handler: needs to be called first.", buf, 2u);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GEOComposedStringArgument_Substitution;
  id v4 = [(GEOComposedStringArgument *)&v6 copyWithZone:a3];
  *((void *)v4 + 4) = self->_waypointIndex;
  objc_storeStrong((id *)v4 + 5, self->_substitutionCandidates);
  objc_storeStrong((id *)v4 + 6, self->_substituteToUse);
  return v4;
}

- (GEOComposedStringArgument_Substitution)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOComposedStringArgument_Substitution;
  v5 = [(GEOComposedStringArgument *)&v16 initWithCoder:v4];
  if (v5)
  {
    v5->_waypointIndex = [v4 decodeIntegerForKey:@"_waypointIndex"];
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"_substitutionCandidates"];
    substitutionCandidates = v5->_substitutionCandidates;
    v5->_substitutionCandidates = (NSMapTable *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_substituteToUse"];
    substituteToUse = v5->_substituteToUse;
    v5->_substituteToUse = (GEOComposedStringSubstitutionCandidate *)v12;

    uint64_t v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_Substitution;
  id v4 = a3;
  [(GEOComposedStringArgument *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_waypointIndex, @"_waypointIndex", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_substitutionCandidates forKey:@"_substitutionCandidates"];
  [v4 encodeObject:self->_substituteToUse forKey:@"_substituteToUse"];
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
    objc_super v5 = v4;
    v17.receiver = self;
    v17.super_class = (Class)GEOComposedStringArgument_Substitution;
    if ([(GEOComposedStringArgument *)&v17 isEqual:v5]
      && self->_waypointIndex == v5[4]
      && ((objc_super v6 = (void *)v5[5], v7 = self->_substitutionCandidates, v8 = v6, !(v7 | v8))
       || (uint64_t v9 = (void *)v8, v10 = [(id)v7 isEqual:v8], v9, (id)v7, v10)))
    {
      substituteToUse = self->_substituteToUse;
      uint64_t v12 = v5[6];
      id v13 = substituteToUse;
      uint64_t v14 = v13;
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

- (unint64_t)waypointIndex
{
  return self->_waypointIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substituteToUse, 0);

  objc_storeStrong((id *)&self->_substitutionCandidates, 0);
}

@end