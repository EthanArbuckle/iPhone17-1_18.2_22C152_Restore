@interface GKInternalRepresentation
+ (BOOL)supportsSecureCoding;
+ (id)codedPropertyKeys;
+ (id)internalRepresentation;
+ (id)secureCodedJsonTypes;
+ (id)secureCodedPropertyKeys;
- (GKInternalRepresentation)initWithCoder:(id)a3;
- (id)_gkDescriptionWithChildren:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionSubstitutionMap;
- (id)serverRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)mergePropertiesFrom:(id)a3;
@end

@implementation GKInternalRepresentation

+ (id)internalRepresentation
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (id)secureCodedJsonTypes
{
  if (secureCodedJsonTypes_onceToken != -1) {
    dispatch_once(&secureCodedJsonTypes_onceToken, &__block_literal_global_7);
  }
  id v2 = (void *)secureCodedJsonTypes_result;

  return v2;
}

void __48__GKInternalRepresentation_secureCodedJsonTypes__block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:5];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7);
  v3 = (void *)secureCodedJsonTypes_result;
  secureCodedJsonTypes_result = v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKInternalRepresentation)initWithCoder:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GKInternalRepresentation;
  v14 = [(GKInternalRepresentation *)&v20 init];
  if (v14)
  {
    uint64_t v5 = [(id)objc_opt_class() secureCodedPropertyKeys];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = [v5 allKeys];
    uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (!v6) {
      goto LABEL_16;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v11 = objc_msgSend(v5, "objectForKey:", v10, v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v4 decodeObjectOfClasses:v11 forKey:v10];
        }
        else {
        v12 = [v4 decodeObjectOfClass:v11 forKey:v10];
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v12) {
            goto LABEL_14;
          }
          [(GKInternalRepresentation *)v14 setValue:v12 forKey:v10];
        }

LABEL_14:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (!v7)
      {
LABEL_16:

        break;
      }
    }
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "codedPropertyKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v11 = [(GKInternalRepresentation *)self valueForKey:v10];
        if (v11) {
          [v4 encodeObject:v11 forKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = objc_msgSend((id)objc_opt_class(), "codedPropertyKeys", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (!v6) {
      goto LABEL_13;
    }
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v11 = [(GKInternalRepresentation *)self valueForKey:v10];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v11) {
            continue;
          }
          [v4 setValue:v11 forKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (!v7)
      {
LABEL_13:

        return v4;
      }
    }
  }
  return v4;
}

+ (id)codedPropertyKeys
{
  uint64_t v2 = [a1 secureCodedPropertyKeys];
  v3 = [v2 allKeys];

  return v3;
}

+ (id)secureCodedPropertyKeys
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)descriptionSubstitutionMap
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _gkTabStringForTabLevel(a3);
  uint64_t v6 = [MEMORY[0x1E4F28E78] string];
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  v69 = (void *)v5;
  [v6 appendFormat:@"%@<%@ %p> {\n", v5, v8, self];

  v66 = [(GKInternalRepresentation *)self descriptionSubstitutionMap];
  v61 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [(id)objc_opt_class() codedPropertyKeys];
  uint64_t v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_11];

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v78 objects:v84 count:16];
  id v63 = v11;
  if (v12)
  {
    uint64_t v13 = v12;
    int64_t v62 = a3 + 1;
    int64_t v68 = a3 + 2;
    uint64_t v14 = *(void *)v79;
    uint64_t v64 = *(void *)v79;
    v65 = self;
    do
    {
      uint64_t v15 = 0;
      uint64_t v60 = v13;
      do
      {
        if (*(void *)v79 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v78 + 1) + 8 * v15);
        uint64_t v17 = [(GKInternalRepresentation *)self valueForKey:v16];
        if (v17)
        {
          uint64_t v18 = (void *)v17;
          long long v19 = [v66 objectForKeyedSubscript:v16];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v20 = v19;
            [v20 count];
            if ([v20 count] == 1)
            {
              v21 = [v20 objectAtIndexedSubscript:0];
              uint64_t v22 = [v18 valueForKeyPath:v21];

              uint64_t v18 = v22;
              v23 = [v22 _gkDescriptionWithChildren:v62];
              v24 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
              v25 = [v23 stringByTrimmingCharactersInSet:v24];

              v26 = [v20 objectAtIndexedSubscript:0];
              [v6 appendFormat:@"%@    %@.%@ : %@", v69, v16, v26, v25];

              uint64_t v13 = v60;
              v27 = v20;
              uint64_t v14 = v64;
              self = v65;
            }
            else
            {
              v58 = v19;
              uint64_t v59 = v15;
              v33 = v18;
              [v6 appendFormat:@"    %@%@ : <%@:%p> {\n", v69, v16, objc_opt_class(), v18];
              long long v76 = 0u;
              long long v77 = 0u;
              long long v74 = 0u;
              long long v75 = 0u;
              id obj = v20;
              uint64_t v34 = [obj countByEnumeratingWithState:&v74 objects:v83 count:16];
              if (v34)
              {
                uint64_t v35 = v34;
                uint64_t v36 = *(void *)v75;
                do
                {
                  for (uint64_t i = 0; i != v35; ++i)
                  {
                    v38 = v6;
                    if (*(void *)v75 != v36) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v39 = *(void *)(*((void *)&v74 + 1) + 8 * i);
                    v40 = [v33 valueForKeyPath:v39];
                    v41 = [v40 _gkDescriptionWithChildren:v68];
                    v42 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
                    v43 = [v41 stringByTrimmingCharactersInSet:v42];

                    uint64_t v6 = v38;
                    [v38 appendFormat:@"%@        %@ : %@", v69, v39, v43];
                  }
                  uint64_t v35 = [obj countByEnumeratingWithState:&v74 objects:v83 count:16];
                }
                while (v35);
              }
              v27 = obj;

              [v6 appendFormat:@"    %@}\n", v69];
              id v11 = v63;
              uint64_t v14 = v64;
              self = v65;
              uint64_t v15 = v59;
              uint64_t v13 = v60;
              long long v19 = v58;
              uint64_t v18 = v33;
            }
          }
          else
          {
            uint64_t v28 = v15;
            if (v19)
            {
              v29 = [v18 valueForKeyPath:v19];

              v30 = [v29 _gkDescriptionWithChildren:v62];
              v31 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
              uint64_t v32 = [v30 stringByTrimmingCharactersInSet:v31];

              uint64_t v56 = v16;
              v27 = (void *)v32;
              [v6 appendFormat:@"%@    %@.%@ : %@", v69, v56, v19, v32];
              uint64_t v18 = v29;
            }
            else
            {
              v44 = [v18 _gkDescriptionWithChildren:v62];
              v45 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
              uint64_t v46 = [v44 stringByTrimmingCharactersInSet:v45];

              uint64_t v57 = v16;
              v27 = (void *)v46;
              [v6 appendFormat:@"%@    %@ : %@", v69, v57, v46];
            }
            uint64_t v15 = v28;
            id v11 = v63;
            uint64_t v14 = v64;
            self = v65;
          }
        }
        else
        {
          [v61 addObject:v16];
        }
        ++v15;
      }
      while (v15 != v13);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v78 objects:v84 count:16];
    }
    while (v13);
  }

  v47 = v61;
  if ([v61 count])
  {
    [v6 appendFormat:@"%@    ", v69];
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v48 = v61;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v70 objects:v82 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = 0;
      uint64_t v52 = *(void *)v71;
      do
      {
        for (uint64_t j = 0; j != v50; ++j)
        {
          if (*(void *)v71 != v52) {
            objc_enumerationMutation(v48);
          }
          if (v51 + j <= 0) {
            v54 = @"%@";
          }
          else {
            v54 = @", %@";
          }
          objc_msgSend(v6, "appendFormat:", v54, *(void *)(*((void *)&v70 + 1) + 8 * j));
        }
        v51 += v50;
        uint64_t v50 = [v48 countByEnumeratingWithState:&v70 objects:v82 count:16];
      }
      while (v50);
    }

    [v6 appendString:@" : (null)\n"];
    v47 = v61;
    id v11 = v63;
  }
  [v6 appendFormat:@"%@}\n", v69];

  return v6;
}

uint64_t __55__GKInternalRepresentation__gkDescriptionWithChildren___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)description
{
  return [(GKInternalRepresentation *)self _gkDescriptionWithChildren:0];
}

- (id)serverRepresentation
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (void)mergePropertiesFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v5 = NSString;
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v5 stringWithFormat:@"%@ is not a %@", v6, objc_opt_class()];
    uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKInternalRepresentation.m"];
    id v9 = [v8 lastPathComponent];
    uint64_t v10 = [v5 stringWithFormat:@"%@ ([self isKindOfClass:[other class]])\n[%s (%s:%d)]", v7, "-[GKInternalRepresentation mergePropertiesFrom:]", objc_msgSend(v9, "UTF8String"), 191];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v10 format];
  }
  id v11 = [(id)objc_opt_class() codedPropertyKeys];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v17 = [v4 valueForKey:v16];
        if (v17) {
          [(GKInternalRepresentation *)self setValue:v17 forKey:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

@end