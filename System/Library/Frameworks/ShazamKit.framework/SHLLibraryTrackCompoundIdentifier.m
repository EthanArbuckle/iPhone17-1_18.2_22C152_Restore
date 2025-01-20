@interface SHLLibraryTrackCompoundIdentifier
+ (BOOL)isTrackIdentifier:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)compoundIdentifierFromTrackIdentifier:(id)a3;
+ (id)identifierWithRecognitionIdentifier:(id)a3 shazamKey:(id)a4;
+ (id)recognitionIdentifierFromTrackIdentifier:(id)a3;
+ (id)shazamKeyFromTrackIdentifier:(id)a3;
- (BOOL)hasValidRecognitionIdentifier;
- (BOOL)isEqual:(id)a3;
- (NSString)libraryItemIdentifier;
- (NSString)recognitionIdentifier;
- (SHLLibraryTrackCompoundIdentifier)initWithCoder:(id)a3;
- (SHLLibraryTrackCompoundIdentifier)initWithRecognitionIdentifier:(id)a3 shazamKey:(id)a4;
- (SHLShazamKey)shazamKey;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SHLLibraryTrackCompoundIdentifier

+ (id)identifierWithRecognitionIdentifier:(id)a3 shazamKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithRecognitionIdentifier:v7 shazamKey:v6];

  return v8;
}

- (SHLLibraryTrackCompoundIdentifier)initWithRecognitionIdentifier:(id)a3 shazamKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7 || !v8)
  {
    v13 = +[NSString stringWithFormat:@"%@ %@ is not a valid recognition identifier and key", v7, v8];
    id v14 = +[NSException shl_exceptionWithName:NSInvalidArgumentException reason:v13];

    objc_exception_throw(v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)SHLLibraryTrackCompoundIdentifier;
  v10 = [(SHLLibraryTrackCompoundIdentifier *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_recognitionIdentifier, a3);
    objc_storeStrong((id *)&v11->_shazamKey, a4);
  }

  return v11;
}

+ (id)compoundIdentifierFromTrackIdentifier:(id)a3
{
  id v4 = a3;
  if (+[SHLLibraryTrackCompoundIdentifier isTrackIdentifier:v4])
  {
    v5 = +[SHLLibraryTrackCompoundIdentifier recognitionIdentifierFromTrackIdentifier:v4];
    uint64_t v6 = +[SHLLibraryTrackCompoundIdentifier shazamKeyFromTrackIdentifier:v4];
    id v7 = (void *)v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      v9 = 0;
    }
    else
    {
      v9 = [a1 identifierWithRecognitionIdentifier:v5 shazamKey:v6];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)isTrackIdentifier:(id)a3
{
  return [a3 containsString:@"_[T]_"];
}

+ (id)shazamKeyFromTrackIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 rangeOfString:@"_[T]_" options:4];
  if (v4 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    uint64_t v6 = [v3 substringFromIndex:&v4[(void)objc_msgSend(@"_[T]_", "length")]];
    v5 = +[SHLShazamKey keyWithValue:v6];
  }

  return v5;
}

+ (id)recognitionIdentifierFromTrackIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rangeOfString:@"_[T]_" options:4];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v6 = [v3 substringToIndex:v4];
    if ((unint64_t)[v6 length] >= 2) {
      id v5 = v6;
    }
    else {
      id v5 = 0;
    }
  }

  return v5;
}

- (NSString)libraryItemIdentifier
{
  id v3 = [(SHLLibraryTrackCompoundIdentifier *)self recognitionIdentifier];
  id v4 = [v3 precomposedStringWithCanonicalMapping];
  id v5 = [(SHLLibraryTrackCompoundIdentifier *)self shazamKey];
  uint64_t v6 = [v5 validatedKey];
  id v7 = +[NSString stringWithFormat:@"%@%@%@", v4, @"_[T]_", v6];

  return (NSString *)v7;
}

- (BOOL)hasValidRecognitionIdentifier
{
  v2 = [(SHLLibraryTrackCompoundIdentifier *)self recognitionIdentifier];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  recognitionIdentifier = self->_recognitionIdentifier;
  id v5 = a3;
  [v5 encodeObject:recognitionIdentifier forKey:@"SHLLibraryTrackRecognitionIdentifierKey"];
  id v6 = [(SHLShazamKey *)self->_shazamKey validatedKey];
  [v5 encodeObject:v6 forKey:@"SHLLibraryTrackShazamKey"];
}

- (SHLLibraryTrackCompoundIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLLibraryTrackShazamKey"];
  id v6 = [[SHLShazamKey alloc] initWithKey:v5];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SHLLibraryTrackRecognitionIdentifierKey"];

  BOOL v8 = [(SHLLibraryTrackCompoundIdentifier *)self initWithRecognitionIdentifier:v7 shazamKey:v6];
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(SHLLibraryTrackCompoundIdentifier *)self recognitionIdentifier];
  id v5 = [v4 copy];

  id v6 = [(SHLLibraryTrackCompoundIdentifier *)self shazamKey];
  id v7 = [v6 validatedKey];
  BOOL v8 = +[SHLShazamKey keyWithValue:v7];

  v9 = +[SHLLibraryTrackCompoundIdentifier identifierWithRecognitionIdentifier:v5 shazamKey:v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(SHLLibraryTrackCompoundIdentifier *)self recognitionIdentifier];
    id v7 = [v5 recognitionIdentifier];
    if ([v6 isEqualToString:v7])
    {
      BOOL v8 = [(SHLLibraryTrackCompoundIdentifier *)self shazamKey];
      v9 = [v8 validatedKey];
      v10 = [v5 shazamKey];
      v11 = [v10 validatedKey];
      unsigned __int8 v12 = [v9 isEqualToString:v11];
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  BOOL v3 = [(SHLLibraryTrackCompoundIdentifier *)self recognitionIdentifier];
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = [(SHLLibraryTrackCompoundIdentifier *)self shazamKey];
  id v6 = [v5 validatedKey];
  unint64_t v7 = (unint64_t)[v6 hash] ^ v4;

  return v7;
}

- (NSString)recognitionIdentifier
{
  return self->_recognitionIdentifier;
}

- (SHLShazamKey)shazamKey
{
  return self->_shazamKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shazamKey, 0);

  objc_storeStrong((id *)&self->_recognitionIdentifier, 0);
}

@end