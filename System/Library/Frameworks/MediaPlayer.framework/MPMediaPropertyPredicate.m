@interface MPMediaPropertyPredicate
+ (BOOL)supportsSecureCoding;
+ (MPMediaPropertyPredicate)predicateWithValue:(id)value forProperty:(NSString *)property;
+ (MPMediaPropertyPredicate)predicateWithValue:(id)value forProperty:(NSString *)property comparisonType:(MPMediaPredicateComparison)comparisonType;
- (BOOL)isEqual:(id)a3;
- (MPMediaPredicateComparison)comparisonType;
- (MPMediaPropertyPredicate)initWithCoder:(id)a3;
- (MPMediaPropertyPredicate)initWithProtobufferDecodableObject:(id)a3 library:(id)a4;
- (NSString)description;
- (NSString)property;
- (id)ML3PredicateForContainer;
- (id)ML3PredicateForTrack;
- (id)_ML3PredicateForML3EntityProperty:(id)a3;
- (id)descriptionOfValue:(id)a3 forProperty:(id)a4;
- (id)protobufferEncodableObjectFromLibrary:(id)a3;
- (id)value;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setComparisonType:(int64_t)a3;
- (void)setProperty:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation MPMediaPropertyPredicate

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_7;
  }
  v5 = v4;
  if (![(NSString *)self->_property isEqualToString:v5[1]]
    || self->_comparisonType != v5[3]
    || ([self->_value isEqual:v5[2]] & 1) == 0)
  {

LABEL_7:
    v8.receiver = self;
    v8.super_class = (Class)MPMediaPropertyPredicate;
    BOOL v6 = [(MPMediaPropertyPredicate *)&v8 isEqual:v4];
    goto LABEL_8;
  }

  BOOL v6 = 1;
LABEL_8:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_property hash];
  return [self->_value hash] ^ v3 ^ self->_comparisonType;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_property, 0);
}

+ (MPMediaPropertyPredicate)predicateWithValue:(id)value forProperty:(NSString *)property comparisonType:(MPMediaPredicateComparison)comparisonType
{
  id v7 = value;
  objc_super v8 = property;
  if (+[MPMediaItem canFilterByProperty:v8]
    || +[MPMediaPlaylist canFilterByProperty:v8])
  {
    v9 = objc_alloc_init(MPMediaPropertyPredicate);
    [(MPMediaPropertyPredicate *)v9 setProperty:v8];
    [(MPMediaPropertyPredicate *)v9 setValue:v7];
    [(MPMediaPropertyPredicate *)v9 setComparisonType:comparisonType];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"MPMediaPropertyPredicate cannot filter using the %@ property.", v8 format];
    v9 = 0;
  }

  return v9;
}

- (void)setValue:(id)a3
{
  id v4 = (void *)[a3 copy];
  id value = self->_value;
  self->_id value = v4;
}

- (void)setProperty:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  property = self->_property;
  self->_property = v4;
}

- (void)setComparisonType:(int64_t)a3
{
  self->_comparisonType = a3;
}

- (id)ML3PredicateForContainer
{
  NSUInteger v3 = (void *)MEMORY[0x1E4F79AB8];
  id v4 = [(MPMediaPropertyPredicate *)self property];
  v5 = [v3 propertyForMPMediaEntityProperty:v4];

  BOOL v6 = [(MPMediaPropertyPredicate *)self _ML3PredicateForML3EntityProperty:v5];

  return v6;
}

- (id)ML3PredicateForTrack
{
  NSUInteger v3 = (void *)MEMORY[0x1E4F79B50];
  id v4 = [(MPMediaPropertyPredicate *)self property];
  v5 = [v3 propertyForMPMediaEntityProperty:v4];

  BOOL v6 = [(MPMediaPropertyPredicate *)self _ML3PredicateForML3EntityProperty:v5];

  return v6;
}

- (NSString)property
{
  return self->_property;
}

- (id)_ML3PredicateForML3EntityProperty:(id)a3
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v12 = 0;
    goto LABEL_38;
  }
  MPMediaPredicateComparison v5 = [(MPMediaPropertyPredicate *)self comparisonType];
  BOOL v6 = [(MPMediaPropertyPredicate *)self value];
  if (![v4 isEqualToString:*MEMORY[0x1E4F791B0]])
  {
LABEL_8:
    if ([v4 isEqualToString:*MEMORY[0x1E4F797A8]])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", MLMediaTypeForMPMediaType(objc_msgSend(v6, "unsignedIntegerValue")));
        uint64_t v16 = [MEMORY[0x1E4F79AA0] predicateWithProperty:v4 value:v7 comparison:10];
LABEL_11:
        v12 = (void *)v16;
        goto LABEL_12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
        uint64_t v26 = MEMORY[0x1E4F143A8];
        uint64_t v27 = 3221225472;
        v28 = __76__MPMediaPropertyPredicate_ML3Additions___ML3PredicateForML3EntityProperty___block_invoke_2;
        v29 = &unk_1E57F2020;
        id v18 = v17;
        id v30 = v18;
        [v6 enumerateObjectsUsingBlock:&v26];
        id v19 = v18;

        BOOL v6 = v19;
LABEL_17:
        uint64_t v22 = objc_msgSend(MEMORY[0x1E4F79AD0], "predicateWithProperty:values:", v4, v6, v26, v27, v28, v29);
LABEL_36:
        v12 = (void *)v22;
        goto LABEL_37;
      }
    }
    switch(v5)
    {
      case 'd':
        uint64_t v20 = 0;
        uint64_t v21 = 2;
        goto LABEL_35;
      case 'e':
        uint64_t v20 = 0;
        uint64_t v21 = 3;
        goto LABEL_35;
      case 'f':
        uint64_t v20 = 0;
        uint64_t v21 = 4;
        goto LABEL_35;
      case 'g':
        uint64_t v20 = 0;
        uint64_t v21 = 5;
        goto LABEL_35;
      case 'h':
        uint64_t v20 = 0;
        uint64_t v21 = 6;
        goto LABEL_35;
      case 'i':
        uint64_t v20 = 1;
        uint64_t v21 = 8;
        goto LABEL_35;
      case 'j':
        uint64_t v20 = 1;
        uint64_t v21 = 9;
        goto LABEL_35;
      case 'k':
        uint64_t v20 = 0;
        uint64_t v21 = 10;
        goto LABEL_35;
      case 'l':
        goto LABEL_17;
      case 'm':
        if (v6 && [v6 BOOLValue])
        {
          uint64_t v22 = [MEMORY[0x1E4F79B20] predicateWithProperty:v4];
          goto LABEL_36;
        }
        v25 = (void *)MEMORY[0x1E4F79B08];
        id v7 = [MEMORY[0x1E4F79B20] predicateWithProperty:v4];
        uint64_t v16 = [v25 predicateWithPredicate:v7];
        break;
      default:
        if (v5)
        {
          if (v5 == MPMediaPredicateComparisonContains)
          {
            uint64_t v20 = 1;
            uint64_t v21 = 7;
          }
          else
          {
            v23 = os_log_create("com.apple.amp.mediaplayer", "Library");
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134217984;
              MPMediaPredicateComparison v34 = v5;
              _os_log_impl(&dword_1952E8000, v23, OS_LOG_TYPE_ERROR, "Unknown comparison type %ld.", buf, 0xCu);
            }

            uint64_t v21 = 0;
            uint64_t v20 = 0;
          }
        }
        else
        {
          uint64_t v20 = 0;
          uint64_t v21 = 1;
        }
LABEL_35:
        uint64_t v22 = [MEMORY[0x1E4F79AA0] predicateWithProperty:v4 value:v6 comparison:v21 caseInsensitive:v20];
        goto LABEL_36;
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __76__MPMediaPropertyPredicate_ML3Additions___ML3PredicateForML3EntityProperty___block_invoke;
      v31[3] = &unk_1E57F2020;
      id v14 = v13;
      id v32 = v14;
      [v6 enumerateObjectsUsingBlock:v31];
      id v15 = v14;

      MPMediaPredicateComparison v5 = 108;
      BOOL v6 = v15;
    }
    goto LABEL_8;
  }
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", MLMediaTypeForMPMediaType(objc_msgSend(v6, "unsignedIntegerValue")));
  objc_super v8 = [MEMORY[0x1E4F79AA0] predicateWithProperty:v4 value:v7 comparison:10];
  v9 = [MEMORY[0x1E4F79AA0] predicateWithProperty:v4 equalToInt64:0];
  v10 = (void *)MEMORY[0x1E4F79A68];
  v35[0] = v8;
  v35[1] = v9;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  v12 = [v10 predicateMatchingPredicates:v11];

LABEL_12:
LABEL_37:

LABEL_38:

  return v12;
}

- (id)value
{
  return self->_value;
}

- (MPMediaPredicateComparison)comparisonType
{
  return self->_comparisonType;
}

+ (MPMediaPropertyPredicate)predicateWithValue:(id)value forProperty:(NSString *)property
{
  return (MPMediaPropertyPredicate *)[a1 predicateWithValue:value forProperty:property comparisonType:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  NSUInteger v3 = [(MPMediaPropertyPredicate *)self descriptionOfValue:self->_value forProperty:self->_property];
  int64_t comparisonType = self->_comparisonType;
  switch(comparisonType)
  {
    case 'd':
      MPMediaPredicateComparison v5 = @"not equal to";
      break;
    case 'e':
      MPMediaPredicateComparison v5 = @"greater than";
      break;
    case 'f':
      MPMediaPredicateComparison v5 = @"greater than or equal";
      break;
    case 'g':
      MPMediaPredicateComparison v5 = @"less than";
      break;
    case 'h':
      MPMediaPredicateComparison v5 = @"less than or equal";
      break;
    case 'i':
      MPMediaPredicateComparison v5 = @"starts with";
      break;
    case 'j':
      MPMediaPredicateComparison v5 = @"ends with";
      break;
    case 'k':
      MPMediaPredicateComparison v5 = @"bit test";
      break;
    case 'l':
      MPMediaPredicateComparison v5 = @"in";
      break;
    case 'm':
      MPMediaPredicateComparison v5 = @"has";
      break;
    default:
      BOOL v6 = @"equal to";
      if (comparisonType) {
        BOOL v6 = 0;
      }
      if (comparisonType == 1) {
        MPMediaPredicateComparison v5 = @"contains";
      }
      else {
        MPMediaPredicateComparison v5 = v6;
      }
      break;
  }
  id v7 = [NSString stringWithFormat:@"<%@ %p> '%@' %@ %@", objc_opt_class(), self, self->_property, v5, v3];

  return (NSString *)v7;
}

- (id)descriptionOfValue:(id)a3 forProperty:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:@"mediaType"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v15 = NSString;
      uint64_t v16 = _NSStringFromMPMediaType([v5 integerValue], @" | ");
      id v14 = [v15 stringWithFormat:@"'%@' %@", v5, v16];

      goto LABEL_17;
    }
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"'%@'", v5];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = _NSStringFromMPMediaType([*(id *)(*((void *)&v18 + 1) + 8 * i) integerValue], @" | ");
          [v7 appendFormat:@" %@", v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }
  if ([v6 hasSuffix:@"PID"]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v5, "longLongValue"));
  }
  else
  {
    [NSString stringWithFormat:@"'%@'", v5];
  id v14 = };
LABEL_17:

  return v14;
}

- (MPMediaPropertyPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPMediaPropertyPredicate;
  id v5 = [(MPMediaPropertyPredicate *)&v15 init];
  if (v5)
  {
    if ([v4 allowsKeyedCoding])
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPProperty"];
      property = v5->_property;
      v5->_property = (NSString *)v6;

      uint64_t v8 = [v4 decodePropertyListForKey:@"MPValue"];
      id value = v5->_value;
      v5->_id value = (id)v8;

      v5->_int64_t comparisonType = [v4 decodeIntegerForKey:@"MPComparisonType"];
    }
    else
    {
      uint64_t v10 = [v4 decodeObject];
      uint64_t v11 = v5->_property;
      v5->_property = (NSString *)v10;

      uint64_t v12 = [v4 decodeObject];
      id v13 = v5->_value;
      v5->_id value = (id)v12;

      [v4 decodeValueOfObjCType:"q" at:&v5->_comparisonType size:8];
    }
  }

  return v5;
}

- (id)protobufferEncodableObjectFromLibrary:(id)a3
{
  v44[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MPPPropertyPredicate);
  [(MPPPropertyPredicate *)v5 setProperty:self->_property];
  int64_t comparisonType = self->_comparisonType;
  switch(comparisonType)
  {
    case 'd':
      uint64_t v7 = 100;
      break;
    case 'e':
      uint64_t v7 = 101;
      break;
    case 'f':
      uint64_t v7 = 102;
      break;
    case 'g':
      uint64_t v7 = 103;
      break;
    case 'h':
      uint64_t v7 = 104;
      break;
    case 'i':
      uint64_t v7 = 105;
      break;
    case 'j':
      uint64_t v7 = 106;
      break;
    case 'k':
      uint64_t v7 = 107;
      break;
    default:
      if (comparisonType == 1) {
        unsigned int v8 = 2;
      }
      else {
        unsigned int v8 = 0;
      }
      if (comparisonType) {
        uint64_t v7 = v8;
      }
      else {
        uint64_t v7 = 1;
      }
      break;
  }
  [(MPPPropertyPredicate *)v5 setComparisonType:v7];
  int IsPersistentIDProperty = _MPMediaItemPropertyIsPersistentIDProperty(self->_property);
  id value = self->_value;
  if (IsPersistentIDProperty)
  {
    uint64_t v36 = [value longLongValue];
    id v37 = v4;
    if (v4)
    {
      id v11 = v4;
    }
    else
    {
      id v11 = +[MPMediaLibrary defaultMediaLibrary];
    }
    long long v19 = v11;
    long long v20 = (void *)MEMORY[0x1E4F1CAD0];
    long long v21 = self->_property;
    uint64_t v22 = objc_msgSend(v20, "setWithObjects:", @"albumPID", @"artistPID", @"albumArtistPID", @"genrePID", @"composerPID", @"podcastPID", @"playlistPersistentID", 0);
    int v23 = [v22 containsObject:v21];

    if (v23)
    {
      property = self->_property;
      v43[0] = @"persistentID";
      v43[1] = @"albumPID";
      v44[0] = &unk_1EE6ECEA8;
      v44[1] = &unk_1EE6ECEC0;
      v43[2] = @"artistPID";
      v43[3] = @"albumArtistPID";
      v44[2] = &unk_1EE6ECED8;
      v44[3] = &unk_1EE6ECEF0;
      v43[4] = @"genrePID";
      v43[5] = @"composerPID";
      v44[4] = &unk_1EE6ECF08;
      v44[5] = &unk_1EE6ECF20;
      v43[6] = @"podcastPID";
      v43[7] = @"playlistPersistentID";
      v44[6] = &unk_1EE6ECF38;
      v44[7] = &unk_1EE6ECF50;
      v25 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v26 = property;
      uint64_t v27 = [v25 dictionaryWithObjects:v44 forKeys:v43 count:8];
      v28 = [v27 objectForKey:v26];

      uint64_t v29 = [v28 integerValue];
      id v30 = [v19 multiverseIdentifierForCollectionWithPersistentID:v36 groupingType:v29];
    }
    else
    {
      id v30 = [v19 multiverseIdentifierForTrackWithPersistentID:v36];
    }
    id v12 = v30;
    id v4 = v37;
    if (v30)
    {
      v31 = [v30 data];
      id v32 = MPPCreatePredicateValueFromFoundationObject(v31);
      [(MPPPropertyPredicate *)v5 setValue:v32];
    }
  }
  else
  {
    id v12 = value;
    if ([(NSString *)self->_property isEqualToString:@"mediaType"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = self->_value;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = 0;
          uint64_t v17 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v39 != v17) {
                objc_enumerationMutation(v13);
              }
              v16 |= [*(id *)(*((void *)&v38 + 1) + 8 * i) longLongValue];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
          }
          while (v15);
        }
        else
        {
          uint64_t v16 = 0;
        }
        uint64_t v33 = [NSNumber numberWithLongLong:v16];

        [(MPPPropertyPredicate *)v5 setComparisonType:107];
        id v12 = (id)v33;
      }
    }
    long long v19 = MPPCreatePredicateValueFromFoundationObject(v12);
    [(MPPPropertyPredicate *)v5 setValue:v19];
  }

  MPMediaPredicateComparison v34 = objc_alloc_init(MPPMediaPredicate);
  [(MPPMediaPredicate *)v34 setType:1];
  [(MPPMediaPredicate *)v34 setPropertyPredicate:v5];

  return v34;
}

- (MPMediaPropertyPredicate)initWithProtobufferDecodableObject:(id)a3 library:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"MPMediaQuery.m", 1391, @"Cannot decode object of type %@", objc_opt_class() object file lineNumber description];
  }
  v30.receiver = self;
  v30.super_class = (Class)MPMediaPropertyPredicate;
  uint64_t v9 = [(MPMediaPropertyPredicate *)&v30 init];
  if (v9)
  {
    uint64_t v10 = [v7 propertyPredicate];
    id v11 = [v10 property];
    uint64_t v12 = [v11 copy];
    property = v9->_property;
    v9->_property = (NSString *)v12;

    int v14 = [v10 comparisonType];
    switch(v14)
    {
      case 'd':
        uint64_t v15 = 100;
        break;
      case 'e':
        uint64_t v15 = 101;
        break;
      case 'f':
        uint64_t v15 = 102;
        break;
      case 'g':
        uint64_t v15 = 103;
        break;
      case 'h':
        uint64_t v15 = 104;
        break;
      case 'i':
        uint64_t v15 = 105;
        break;
      case 'j':
        uint64_t v15 = 106;
        break;
      case 'k':
        uint64_t v15 = 107;
        break;
      default:
        uint64_t v15 = v14 == 2;
        break;
    }
    v9->_int64_t comparisonType = v15;
    if (_MPMediaItemPropertyIsPersistentIDProperty(v9->_property))
    {
      if (v8)
      {
        id v16 = v8;
      }
      else
      {
        id v16 = +[MPMediaLibrary defaultMediaLibrary];
      }
      uint64_t v17 = v16;
      long long v20 = [v10 value];
      long long v19 = MPPCreateFoundationObjectFromPredicateValue(v20);

      long long v21 = (void *)[objc_alloc(MEMORY[0x1E4F79A48]) initWithData:v19];
      uint64_t v22 = [v17 entityWithMultiverseIdentifier:v21];
      int v23 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl_Oversize");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v32 = v21;
        __int16 v33 = 2114;
        MPMediaPredicateComparison v34 = v17;
        __int16 v35 = 2114;
        uint64_t v36 = v22;
        _os_log_impl(&dword_1952E8000, v23, OS_LOG_TYPE_DEFAULT, "RPQ: -[MPMediaQuery initWithProtobufferDecodableObject:library:] resolving PID predicate multiverseID=%{public}@ library=%{public}@ entity=%{public}@", buf, 0x20u);
      }

      uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v22, "persistentID"));
      id value = v9->_value;
      v9->_id value = (id)v24;

      uint64_t v26 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl_Oversize");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = v9->_value;
        *(_DWORD *)buf = 138543362;
        id v32 = v27;
        _os_log_impl(&dword_1952E8000, v26, OS_LOG_TYPE_DEFAULT, "RPQ: -[MPMediaQuery initWithProtobufferDecodableObject:library:] resolving PID predicate value=%{public}@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v17 = [v10 value];
      uint64_t v18 = MPPCreateFoundationObjectFromPredicateValue(v17);
      long long v19 = v9->_value;
      v9->_id value = (id)v18;
    }
  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  property = self->_property;
  id v5 = a3;
  [v5 encodeObject:property forKey:@"MPProperty"];
  [v5 encodeObject:self->_value forKey:@"MPValue"];
  [v5 encodeInteger:self->_comparisonType forKey:@"MPComparisonType"];
}

void __76__MPMediaPropertyPredicate_ML3Additions___ML3PredicateForML3EntityProperty___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithUnsignedInt:", MLMediaTypeForMPMediaType(objc_msgSend(a2, "unsignedIntegerValue")));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void __76__MPMediaPropertyPredicate_ML3Additions___ML3PredicateForML3EntityProperty___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithUnsignedInt:", MLMediaTypeForMPMediaType(objc_msgSend(a2, "unsignedIntegerValue")));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

@end