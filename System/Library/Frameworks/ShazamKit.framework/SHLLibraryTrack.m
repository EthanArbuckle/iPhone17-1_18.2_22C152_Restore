@interface SHLLibraryTrack
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualTrack:(id)a3;
- (BOOL)validProviderIdentifier;
- (BOOL)validProviderName;
- (CLLocation)location;
- (NSDate)date;
- (NSMutableSet)labelSet;
- (NSSet)labels;
- (NSString)associatedGroupIdentifier;
- (NSString)identifier;
- (NSString)providerIdentifier;
- (NSString)providerName;
- (NSString)recognitionIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (SHLLibraryItemMetadata)metadata;
- (SHLLibraryTrack)initWithCoder:(id)a3;
- (SHLLibraryTrack)initWithIdentifier:(id)a3;
- (SHLLibraryTrack)initWithIdentifier:(id)a3 metadata:(id)a4;
- (SHLLibraryTrack)initWithLibraryTrack:(id)a3;
- (SHLLibraryTrack)initWithRecognitionIdentifier:(id)a3 shazamKey:(id)a4;
- (SHLLibraryTrack)initWithRecognitionIdentifier:(id)a3 shazamKey:(id)a4 metadata:(id)a5;
- (SHLLibraryTrackCompoundIdentifier)compoundIdentifier;
- (SHLShazamKey)shazamKey;
- (id)_initWithIdentifier:(id)a3 metadata:(id)a4 labels:(id)a5;
- (id)_initWithRecognitionIdentifier:(id)a3 shazamKey:(id)a4 metadata:(id)a5 labels:(id)a6;
- (id)bundleIdentifier;
- (id)bundleName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)platformLabel;
- (unint64_t)hash;
- (void)addLabel:(id)a3;
- (void)addPlatformLabel;
- (void)commonInitWithIdentifier:(id)a3 metadata:(id)a4 labels:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)removeLabel:(id)a3;
- (void)setAssociatedGroupIdentifier:(id)a3;
- (void)setDate:(id)a3;
- (void)setLabelSet:(id)a3;
- (void)setLocation:(id)a3;
- (void)setProviderIdentifier:(id)a3;
- (void)setProviderName:(id)a3;
- (void)setRecognitionIdentifier:(id)a3;
- (void)setShazamKey:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SHLLibraryTrack

- (SHLLibraryTrack)initWithIdentifier:(id)a3
{
  return (SHLLibraryTrack *)[(SHLLibraryTrack *)self _initWithIdentifier:a3 metadata:0 labels:&__NSArray0__struct];
}

- (SHLLibraryTrack)initWithIdentifier:(id)a3 metadata:(id)a4
{
  return (SHLLibraryTrack *)[(SHLLibraryTrack *)self _initWithIdentifier:a3 metadata:a4 labels:&__NSArray0__struct];
}

- (id)_initWithIdentifier:(id)a3 metadata:(id)a4 labels:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SHLLibraryTrack;
  v11 = [(SHLLibraryTrack *)&v14 init];
  v12 = v11;
  if (v11) {
    [(SHLLibraryTrack *)v11 commonInitWithIdentifier:v8 metadata:v9 labels:v10];
  }

  return v12;
}

- (void)commonInitWithIdentifier:(id)a3 metadata:(id)a4 labels:(id)a5
{
  id v8 = (NSString *)a3;
  id v9 = (SHLLibraryItemMetadata *)a4;
  id v25 = a5;
  if (![(SHLLibraryTrack *)self validProviderIdentifier])
  {
    NSExceptionName v22 = NSInvalidArgumentException;
    CFStringRef v23 = @"You must have a valid CFBundleIdentifier key set in the bundle’s information property list.";
    goto LABEL_8;
  }
  if (![(SHLLibraryTrack *)self validProviderName])
  {
    NSExceptionName v22 = NSInvalidArgumentException;
    CFStringRef v23 = @"You must have a valid CFBundleName key set in the bundle’s information property list.";
LABEL_8:
    id v24 = +[NSException shl_exceptionWithName:v22 reason:v23];
    objc_exception_throw(v24);
  }
  identifier = self->_identifier;
  self->_identifier = v8;
  v11 = v8;

  metadata = self->_metadata;
  self->_metadata = v9;
  v13 = v9;

  objc_super v14 = [(SHLLibraryTrack *)self bundleIdentifier];
  providerIdentifier = self->_providerIdentifier;
  self->_providerIdentifier = v14;

  v16 = [(SHLLibraryTrack *)self bundleName];
  providerName = self->_providerName;
  self->_providerName = v16;

  v18 = +[NSDate date];
  date = self->_date;
  self->_date = v18;

  v20 = +[NSMutableSet setWithArray:v25];
  labelSet = self->_labelSet;
  self->_labelSet = v20;

  [(SHLLibraryTrack *)self addPlatformLabel];
}

- (id)bundleIdentifier
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)bundleName
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 objectForInfoDictionaryKey:@"CFBundleName"];

  return v3;
}

- (NSSet)labels
{
  v2 = [(SHLLibraryTrack *)self labelSet];
  id v3 = [v2 copy];

  return (NSSet *)v3;
}

- (void)addLabel:(id)a3
{
  id v4 = a3;
  v5 = [(SHLLibraryTrack *)self labelSet];
  [v5 containsObject:v4];

  id v6 = [(SHLLibraryTrack *)self labelSet];
  [v6 addObject:v4];
}

- (void)removeLabel:(id)a3
{
  id v4 = a3;
  v5 = [(SHLLibraryTrack *)self labelSet];
  [v5 containsObject:v4];

  id v6 = [(SHLLibraryTrack *)self labelSet];
  [v6 removeObject:v4];
}

- (SHLLibraryTrack)initWithCoder:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)SHLLibraryTrack;
  v5 = [(SHLLibraryTrack *)&v42 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLLibraryTrackMetadata"];
    if (v6)
    {
      v7 = [[SHLLibraryItemMetadata alloc] initWithEncodedSystemData:v6];
      metadata = v5->_metadata;
      v5->_metadata = v7;
    }
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLLibraryTrackCompoundIdentifierKey"];
    compoundIdentifier = v5->_compoundIdentifier;
    v5->_compoundIdentifier = (SHLLibraryTrackCompoundIdentifier *)v9;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLLibraryTrackShazamKey"];
    if (v11)
    {
      v12 = [[SHLShazamKey alloc] initWithKey:v11];
    }
    else
    {
      v12 = [(SHLLibraryTrackCompoundIdentifier *)v5->_compoundIdentifier shazamKey];
    }
    shazamKey = v5->_shazamKey;
    v5->_shazamKey = v12;

    objc_super v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLLibraryTrackRecognitionIdentifier"];
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      v16 = [(SHLLibraryTrackCompoundIdentifier *)v5->_compoundIdentifier recognitionIdentifier];
    }
    recognitionIdentifier = v5->_recognitionIdentifier;
    v5->_recognitionIdentifier = v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLLibraryTrackIdentifier"];
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      v20 = [(SHLLibraryTrackCompoundIdentifier *)v5->_compoundIdentifier libraryItemIdentifier];
    }
    identifier = v5->_identifier;
    v5->_identifier = v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLLibraryTrackProviderIdentifier"];
    providerIdentifier = v5->_providerIdentifier;
    v5->_providerIdentifier = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLLibraryTrackProviderName"];
    providerName = v5->_providerName;
    v5->_providerName = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLLibraryTrackDate"];
    date = v5->_date;
    v5->_date = (NSDate *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLLibraryTrackTitle"];
    title = v5->_title;
    v5->_title = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLLibraryTrackSubtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLLibraryTrackLocation"];
    location = v5->_location;
    v5->_location = (CLLocation *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLLibraryTrackAssociatedGroupIdentifier"];
    associatedGroupIdentifier = v5->_associatedGroupIdentifier;
    v5->_associatedGroupIdentifier = (NSString *)v34;

    uint64_t v36 = objc_opt_class();
    v37 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v36, objc_opt_class(), 0);
    v38 = [v4 decodeObjectOfClasses:v37 forKey:@"SHLLibraryTrackLibrarySet"];
    v39 = (NSMutableSet *)[v38 mutableCopy];
    labelSet = v5->_labelSet;
    v5->_labelSet = v39;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v8 = a3;
  [v8 encodeObject:identifier forKey:@"SHLLibraryTrackIdentifier"];
  [v8 encodeObject:self->_recognitionIdentifier forKey:@"SHLLibraryTrackRecognitionIdentifier"];
  v5 = [(SHLShazamKey *)self->_shazamKey validatedKey];
  [v8 encodeObject:v5 forKey:@"SHLLibraryTrackShazamKey"];

  id v6 = [(SHLLibraryItemMetadata *)self->_metadata encodedSystemData];
  [v8 encodeObject:v6 forKey:@"SHLLibraryTrackMetadata"];

  [v8 encodeObject:self->_providerIdentifier forKey:@"SHLLibraryTrackProviderIdentifier"];
  [v8 encodeObject:self->_providerName forKey:@"SHLLibraryTrackProviderName"];
  [v8 encodeObject:self->_date forKey:@"SHLLibraryTrackDate"];
  [v8 encodeObject:self->_title forKey:@"SHLLibraryTrackTitle"];
  [v8 encodeObject:self->_subtitle forKey:@"SHLLibraryTrackSubtitle"];
  [v8 encodeObject:self->_location forKey:@"SHLLibraryTrackLocation"];
  [v8 encodeObject:self->_associatedGroupIdentifier forKey:@"SHLLibraryTrackAssociatedGroupIdentifier"];
  id v7 = [(NSMutableSet *)self->_labelSet copy];
  [v8 encodeObject:v7 forKey:@"SHLLibraryTrackLibrarySet"];

  [v8 encodeObject:self->_compoundIdentifier forKey:@"SHLLibraryTrackCompoundIdentifierKey"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHLLibraryTrack)initWithLibraryTrack:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)SHLLibraryTrack;
  v5 = [(SHLLibraryTrack *)&v46 init];
  if (v5)
  {
    id v6 = [v4 identifier];
    id v7 = (NSString *)[v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = v7;

    uint64_t v9 = [v4 recognitionIdentifier];
    id v10 = (NSString *)[v9 copy];
    recognitionIdentifier = v5->_recognitionIdentifier;
    v5->_recognitionIdentifier = v10;

    v12 = [v4 shazamKey];
    v13 = (SHLShazamKey *)[v12 copy];
    shazamKey = v5->_shazamKey;
    v5->_shazamKey = v13;

    v15 = [v4 metadata];
    v16 = (SHLLibraryItemMetadata *)[v15 copy];
    metadata = v5->_metadata;
    v5->_metadata = v16;

    v18 = [v4 providerIdentifier];
    v19 = (NSString *)[v18 copy];
    providerIdentifier = v5->_providerIdentifier;
    v5->_providerIdentifier = v19;

    v21 = [v4 providerName];
    uint64_t v22 = (NSString *)[v21 copy];
    providerName = v5->_providerName;
    v5->_providerName = v22;

    uint64_t v24 = [v4 date];
    id v25 = (NSDate *)[v24 copy];
    date = v5->_date;
    v5->_date = v25;

    v27 = [v4 title];
    uint64_t v28 = (NSString *)[v27 copy];
    title = v5->_title;
    v5->_title = v28;

    uint64_t v30 = [v4 subtitle];
    v31 = (NSString *)[v30 copy];
    subtitle = v5->_subtitle;
    v5->_subtitle = v31;

    v33 = [v4 location];
    uint64_t v34 = (CLLocation *)[v33 copy];
    location = v5->_location;
    v5->_location = v34;

    uint64_t v36 = [v4 associatedGroupIdentifier];
    v37 = (NSString *)[v36 copy];
    associatedGroupIdentifier = v5->_associatedGroupIdentifier;
    v5->_associatedGroupIdentifier = v37;

    v39 = [v4 labelSet];
    v40 = (NSMutableSet *)[v39 copy];
    labelSet = v5->_labelSet;
    v5->_labelSet = v40;

    objc_super v42 = [v4 compoundIdentifier];
    v43 = (SHLLibraryTrackCompoundIdentifier *)[v42 copy];
    compoundIdentifier = v5->_compoundIdentifier;
    v5->_compoundIdentifier = v43;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[SHLLibraryTrack allocWithZone:a3];

  return [(SHLLibraryTrack *)v4 initWithLibraryTrack:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[SHLMutableLibraryTrack allocWithZone:a3];

  return [(SHLLibraryTrack *)v4 initWithLibraryTrack:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SHLLibraryTrack *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      BOOL v5 = [(SHLLibraryTrack *)self isEqualTrack:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualTrack:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SHLLibraryTrack *)self identifier];
  id v6 = [v4 identifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(SHLLibraryTrack *)self identifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)validProviderIdentifier
{
  id v3 = [(SHLLibraryTrack *)self bundleIdentifier];
  if (v3)
  {
    id v4 = [(SHLLibraryTrack *)self bundleIdentifier];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)validProviderName
{
  id v3 = [(SHLLibraryTrack *)self bundleName];
  if (v3)
  {
    id v4 = [(SHLLibraryTrack *)self bundleName];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)platformLabel
{
  v2 = [SHLLibraryLabel alloc];
  id v3 = +[NSString stringWithFormat:@"%@_ios", @"platform"];
  id v4 = [(SHLLibraryLabel *)v2 initWithName:v3];

  return v4;
}

- (void)addPlatformLabel
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(SHLLibraryTrack *)self labels];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v9 != v6) {
        objc_enumerationMutation(v3);
      }
      if (![*(id *)(*((void *)&v8 + 1) + 8 * v7) type]) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    id v3 = [(SHLLibraryTrack *)self platformLabel];
    [(SHLLibraryTrack *)self addLabel:v3];
  }
}

- (SHLLibraryTrack)initWithRecognitionIdentifier:(id)a3 shazamKey:(id)a4
{
  return (SHLLibraryTrack *)[(SHLLibraryTrack *)self _initWithRecognitionIdentifier:a3 shazamKey:a4 metadata:0 labels:&__NSArray0__struct];
}

- (SHLLibraryTrack)initWithRecognitionIdentifier:(id)a3 shazamKey:(id)a4 metadata:(id)a5
{
  return (SHLLibraryTrack *)[(SHLLibraryTrack *)self _initWithRecognitionIdentifier:a3 shazamKey:a4 metadata:a5 labels:&__NSArray0__struct];
}

- (id)_initWithRecognitionIdentifier:(id)a3 shazamKey:(id)a4 metadata:(id)a5 labels:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v12)
  {
    id v21 = +[NSException shl_exceptionWithName:NSInvalidArgumentException reason:@"You must have a valid Shazam key to create a library item."];
    objc_exception_throw(v21);
  }
  v15 = v14;
  v24.receiver = self;
  v24.super_class = (Class)SHLLibraryTrack;
  v16 = [(SHLLibraryTrack *)&v24 init];
  if (v16)
  {
    v17 = [[SHLLibraryTrackCompoundIdentifier alloc] initWithRecognitionIdentifier:v11 shazamKey:v12];
    compoundIdentifier = v16->_compoundIdentifier;
    v16->_compoundIdentifier = v17;

    if (![(SHLLibraryTrackCompoundIdentifier *)v16->_compoundIdentifier hasValidRecognitionIdentifier])
    {
      uint64_t v22 = +[NSString stringWithFormat:@"%@ is not a valid recognition identifier.", v11];
      id v23 = +[NSException shl_exceptionWithName:NSInvalidArgumentException reason:v22];

      objc_exception_throw(v23);
    }
    objc_storeStrong((id *)&v16->_recognitionIdentifier, a3);
    objc_storeStrong((id *)&v16->_shazamKey, a4);
    v19 = [(SHLLibraryTrackCompoundIdentifier *)v16->_compoundIdentifier libraryItemIdentifier];
    [(SHLLibraryTrack *)v16 commonInitWithIdentifier:v19 metadata:v13 labels:v15];
  }
  return v16;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (SHLLibraryItemMetadata)metadata
{
  return self->_metadata;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)recognitionIdentifier
{
  return self->_recognitionIdentifier;
}

- (void)setRecognitionIdentifier:(id)a3
{
}

- (SHLShazamKey)shazamKey
{
  return self->_shazamKey;
}

- (void)setShazamKey:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSString)associatedGroupIdentifier
{
  return self->_associatedGroupIdentifier;
}

- (void)setAssociatedGroupIdentifier:(id)a3
{
}

- (SHLLibraryTrackCompoundIdentifier)compoundIdentifier
{
  return self->_compoundIdentifier;
}

- (NSMutableSet)labelSet
{
  return self->_labelSet;
}

- (void)setLabelSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelSet, 0);
  objc_storeStrong((id *)&self->_compoundIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_shazamKey, 0);
  objc_storeStrong((id *)&self->_recognitionIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end