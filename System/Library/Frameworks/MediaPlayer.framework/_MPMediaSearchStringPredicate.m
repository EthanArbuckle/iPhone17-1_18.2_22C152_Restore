@interface _MPMediaSearchStringPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateWithSearchString:(id)a3 forProperties:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSSet)properties;
- (NSString)description;
- (NSString)searchString;
- (_MPMediaSearchStringPredicate)initWithCoder:(id)a3;
- (_MPMediaSearchStringPredicate)initWithProtobufferDecodableObject:(id)a3 library:(id)a4;
- (id)ML3PredicateForContainer;
- (id)ML3PredicateForTrack;
- (id)_ML3PredicateForEntityClass:(Class)a3;
- (id)protobufferEncodableObjectFromLibrary:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setProperties:(id)a3;
- (void)setSearchString:(id)a3;
@end

@implementation _MPMediaSearchStringPredicate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);

  objc_storeStrong((id *)&self->_searchString, 0);
}

- (void)setProperties:(id)a3
{
}

- (NSSet)properties
{
  return self->_properties;
}

- (void)setSearchString:(id)a3
{
}

- (NSString)searchString
{
  return self->_searchString;
}

- (id)protobufferEncodableObjectFromLibrary:(id)a3
{
  v4 = objc_alloc_init(MPPSearchStringPredicate);
  [(MPPSearchStringPredicate *)v4 setSearchString:self->_searchString];
  v5 = [(NSSet *)self->_properties allObjects];
  v6 = (void *)[v5 mutableCopy];
  [(MPPSearchStringPredicate *)v4 setProperties:v6];

  v7 = objc_alloc_init(MPPMediaPredicate);
  [(MPPMediaPredicate *)v7 setType:5];
  [(MPPMediaPredicate *)v7 setSearchStringPredicate:v4];

  return v7;
}

- (_MPMediaSearchStringPredicate)initWithProtobufferDecodableObject:(id)a3 library:(id)a4
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"MPMediaQuery.m", 1945, @"Cannot decode object of type %@", objc_opt_class() object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)_MPMediaSearchStringPredicate;
  v7 = [(_MPMediaSearchStringPredicate *)&v19 init];
  if (v7)
  {
    v8 = [v6 searchStringPredicate];
    v9 = [v8 searchString];
    uint64_t v10 = [v9 copy];
    searchString = v7->_searchString;
    v7->_searchString = (NSString *)v10;

    v12 = [v8 properties];

    if (v12)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      v14 = [v8 properties];
      uint64_t v15 = [v13 initWithArray:v14];
      properties = v7->_properties;
      v7->_properties = (NSSet *)v15;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_searchString hash];
  return [(NSSet *)self->_properties hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && [v4[1] isEqual:self->_searchString])
  {
    char v5 = [v4[2] isEqual:self->_properties];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@ %p> %@ matches '%@'", objc_opt_class(), self, self->_properties, self->_searchString];
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  char v4 = [v6 allowsKeyedCoding];
  searchString = self->_searchString;
  if (v4)
  {
    [v6 encodeObject:searchString forKey:@"MPSearchString"];
    [v6 encodeObject:self->_properties forKey:@"MPProperties"];
  }
  else
  {
    [v6 encodeObject:searchString];
    [v6 encodeObject:self->_properties];
  }
}

- (_MPMediaSearchStringPredicate)initWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_MPMediaSearchStringPredicate;
  char v5 = [(_MPMediaSearchStringPredicate *)&v22 init];
  if (v5)
  {
    if ([v4 allowsKeyedCoding])
    {
      id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPSearchString"];
      [(_MPMediaSearchStringPredicate *)v5 setSearchString:v6];

      v7 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v8 = objc_opt_class();
      v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
      id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"MPProperties"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_15:

        goto LABEL_16;
      }
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v10 = v10;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v19;
        int v14 = 1;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            objc_opt_class();
            v14 &= objc_opt_isKindOfClass();
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v12);

        if ((v14 & 1) == 0) {
          goto LABEL_15;
        }
      }
      else
      {
      }
    }
    else
    {
      v16 = [v4 decodeObject];
      [(_MPMediaSearchStringPredicate *)v5 setSearchString:v16];

      id v10 = [v4 decodeObject];
    }
    [(_MPMediaSearchStringPredicate *)v5 setProperties:v10];
    goto LABEL_15;
  }
LABEL_16:

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)predicateWithSearchString:(id)a3 forProperties:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"MPMediaQuery.m" lineNumber:1883 description:&stru_1EE680640];
  }
  if (![v8 count])
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"MPMediaQuery.m" lineNumber:1884 description:&stru_1EE680640];
  }
  v9 = objc_alloc_init(_MPMediaSearchStringPredicate);
  [(_MPMediaSearchStringPredicate *)v9 setSearchString:v7];
  [(_MPMediaSearchStringPredicate *)v9 setProperties:v8];

  return v9;
}

- (id)ML3PredicateForContainer
{
  uint64_t v3 = objc_opt_class();

  return [(_MPMediaSearchStringPredicate *)self _ML3PredicateForEntityClass:v3];
}

- (id)ML3PredicateForTrack
{
  uint64_t v3 = objc_opt_class();

  return [(_MPMediaSearchStringPredicate *)self _ML3PredicateForEntityClass:v3];
}

- (id)_ML3PredicateForEntityClass:(Class)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  char v5 = [(_MPMediaSearchStringPredicate *)self properties];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [(objc_class *)a3 spotlightPropertyForMPMediaEntityProperty:*(void *)(*((void *)&v32 + 1) + 8 * i)];
        if (!v12)
        {
          v27 = self;
          [v6 removeAllObjects];

          long long v30 = 0u;
          long long v31 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v17 = v7;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v38 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v29;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v29 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8 * j);
                v23 = [(objc_class *)a3 propertyForMPMediaEntityProperty:v22];
                if (v23)
                {
                  [v6 addObject:v23];
                }
                else
                {
                  uint64_t v24 = os_log_create("com.apple.amp.mediaplayer", "Library");
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v37 = v22;
                    _os_log_impl(&dword_1952E8000, v24, OS_LOG_TYPE_ERROR, "Cannot filter search string by %@", buf, 0xCu);
                  }
                }
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v38 count:16];
            }
            while (v19);
          }

          v25 = (void *)MEMORY[0x1E4F79B30];
          uint64_t v15 = [(_MPMediaSearchStringPredicate *)v27 searchString];
          v16 = [v25 predicateWithConcatenatedProperties:v6 searchString:v15];
          goto LABEL_23;
        }
        uint64_t v13 = (void *)v12;
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v39 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  int v14 = (void *)MEMORY[0x1E4F79B38];
  uint64_t v15 = [(_MPMediaSearchStringPredicate *)self searchString];
  v16 = [v14 predicateWithProperties:v6 searchString:v15];
LABEL_23:

  return v16;
}

@end