@interface _LTLocalePair
+ (BOOL)supportsSecureCoding;
+ (_LTLocalePair)pairWithIdentifiers:(id)a3;
- (BOOL)isBidirectionalEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPassthrough;
- (BOOL)isVariantPair;
- (NSLocale)sourceLocale;
- (NSLocale)targetLocale;
- (_LTLocalePair)initWithCoder:(id)a3;
- (_LTLocalePair)initWithSourceLocale:(id)a3 targetLocale:(id)a4;
- (id)canonicalIdentifier;
- (id)canonicalLocalePair;
- (id)combinedLocaleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)identifier;
- (id)oppositeToLocale:(id)a3;
- (id)reversedPair;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _LTLocalePair

- (_LTLocalePair)initWithSourceLocale:(id)a3 targetLocale:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_LTLocalePair;
  v9 = [(_LTLocalePair *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceLocale, a3);
    objc_storeStrong((id *)&v10->_targetLocale, a4);
    v11 = v10;
  }

  return v10;
}

- (_LTLocalePair)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_LTLocalePair;
  v5 = [(_LTLocalePair *)&v16 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFF960];
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceLocaleIdentifier"];
    uint64_t v8 = [v6 localeWithLocaleIdentifier:v7];
    sourceLocale = v5->_sourceLocale;
    v5->_sourceLocale = (NSLocale *)v8;

    v10 = (void *)MEMORY[0x263EFF960];
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetLocaleIdentifier"];
    uint64_t v12 = [v10 localeWithLocaleIdentifier:v11];
    targetLocale = v5->_targetLocale;
    v5->_targetLocale = (NSLocale *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sourceLocale = self->_sourceLocale;
  id v5 = a3;
  v6 = [(NSLocale *)sourceLocale localeIdentifier];
  [v5 encodeObject:v6 forKey:@"sourceLocaleIdentifier"];

  id v7 = [(NSLocale *)self->_targetLocale localeIdentifier];
  [v5 encodeObject:v7 forKey:@"targetLocaleIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (_LTLocalePair)pairWithIdentifiers:(id)a3
{
  id v4 = [a3 componentsSeparatedByString:@"-"];
  if ([v4 count] == 2)
  {
    id v5 = (void *)MEMORY[0x263EFF960];
    v6 = [v4 objectAtIndexedSubscript:0];
    id v7 = [v5 localeWithLocaleIdentifier:v6];

    uint64_t v8 = (void *)MEMORY[0x263EFF960];
    v9 = [v4 objectAtIndexedSubscript:1];
    v10 = [v8 localeWithLocaleIdentifier:v9];

    v11 = 0;
    if (v7 && v10) {
      v11 = (void *)[objc_alloc((Class)a1) initWithSourceLocale:v7 targetLocale:v10];
    }
  }
  else
  {
    v11 = 0;
  }

  return (_LTLocalePair *)v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_LTLocalePair alloc];
  sourceLocale = self->_sourceLocale;
  targetLocale = self->_targetLocale;

  return [(_LTLocalePair *)v4 initWithSourceLocale:sourceLocale targetLocale:targetLocale];
}

- (id)combinedLocaleIdentifier
{
  v3 = NSString;
  id v4 = [(_LTLocalePair *)self sourceLocale];
  id v5 = [v4 _ltLocaleIdentifier];
  v6 = [(_LTLocalePair *)self targetLocale];
  id v7 = [v6 _ltLocaleIdentifier];
  uint64_t v8 = [v3 stringWithFormat:@"%@-%@", v5, v7];

  return v8;
}

- (id)reversedPair
{
  v3 = [_LTLocalePair alloc];
  id v4 = [(_LTLocalePair *)self targetLocale];
  id v5 = [(_LTLocalePair *)self sourceLocale];
  v6 = [(_LTLocalePair *)v3 initWithSourceLocale:v4 targetLocale:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_LTLocalePair *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(_LTLocalePair *)self sourceLocale];
      id v7 = [(_LTLocalePair *)v5 sourceLocale];
      if ([v6 _ltEqual:v7])
      {
        uint64_t v8 = [(_LTLocalePair *)self targetLocale];
        v9 = [(_LTLocalePair *)v5 targetLocale];
        char v10 = [v8 _ltEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (BOOL)isBidirectionalEqual:(id)a3
{
  id v4 = a3;
  if ([(_LTLocalePair *)self isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    v6 = [(_LTLocalePair *)self reversedPair];
    char v5 = [v6 isEqual:v4];
  }
  return v5;
}

- (unint64_t)hash
{
  v2 = [(_LTLocalePair *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)oppositeToLocale:(id)a3
{
  id v4 = a3;
  char v5 = [v4 _ltLocaleIdentifier];
  v6 = [(_LTLocalePair *)self sourceLocale];
  id v7 = [v6 _ltLocaleIdentifier];
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = [(_LTLocalePair *)self targetLocale];
LABEL_5:
    v14 = (void *)v9;
    goto LABEL_7;
  }
  char v10 = [v4 _ltLocaleIdentifier];
  v11 = [(_LTLocalePair *)self targetLocale];
  uint64_t v12 = [v11 _ltLocaleIdentifier];
  int v13 = [v10 isEqualToString:v12];

  if (v13)
  {
    uint64_t v9 = [(_LTLocalePair *)self sourceLocale];
    goto LABEL_5;
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (id)identifier
{
  unint64_t v3 = NSString;
  id v4 = [(_LTLocalePair *)self sourceLocale];
  char v5 = [v4 localeIdentifier];
  v6 = [(_LTLocalePair *)self targetLocale];
  id v7 = [v6 localeIdentifier];
  int v8 = [v3 stringWithFormat:@"%@-%@", v5, v7];

  return v8;
}

- (id)canonicalIdentifier
{
  v14[2] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(_LTLocalePair *)self sourceLocale];
  id v4 = [v3 localeIdentifier];
  v14[0] = v4;
  char v5 = [(_LTLocalePair *)self targetLocale];
  v6 = [v5 localeIdentifier];
  v14[1] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];

  int v8 = [v7 sortedArrayUsingSelector:sel_compare_];
  uint64_t v9 = NSString;
  char v10 = [v8 objectAtIndexedSubscript:0];
  v11 = [v8 objectAtIndexedSubscript:1];
  uint64_t v12 = [v9 stringWithFormat:@"%@-%@", v10, v11];

  return v12;
}

- (id)canonicalLocalePair
{
  v2 = [(_LTLocalePair *)self canonicalIdentifier];
  unint64_t v3 = +[_LTLocalePair pairWithIdentifiers:v2];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  v6 = [(_LTLocalePair *)self sourceLocale];
  id v7 = [v6 localeIdentifier];
  int v8 = [(_LTLocalePair *)self targetLocale];
  uint64_t v9 = [v8 localeIdentifier];
  char v10 = [v3 stringWithFormat:@"<%@: source:%@ target:%@>", v5, v7, v9];

  return v10;
}

- (BOOL)isPassthrough
{
  unint64_t v3 = [(_LTLocalePair *)self sourceLocale];
  id v4 = [(_LTLocalePair *)self targetLocale];
  char v5 = [v3 _ltEqual:v4];

  return v5;
}

- (BOOL)isVariantPair
{
  if ([(_LTLocalePair *)self isPassthrough]) {
    return 0;
  }
  id v4 = [(_LTLocalePair *)self sourceLocale];
  char v5 = [v4 languageCode];
  v6 = [(_LTLocalePair *)self targetLocale];
  id v7 = [v6 languageCode];
  char v8 = [v5 isEqualToString:v7];

  return v8;
}

- (NSLocale)sourceLocale
{
  return self->_sourceLocale;
}

- (NSLocale)targetLocale
{
  return self->_targetLocale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLocale, 0);

  objc_storeStrong((id *)&self->_sourceLocale, 0);
}

@end