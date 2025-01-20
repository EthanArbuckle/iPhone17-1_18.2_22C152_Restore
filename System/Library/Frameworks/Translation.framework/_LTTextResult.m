@interface _LTTextResult
- (BOOL)isEqual:(id)a3;
- (NSLocale)sourceLocale;
- (NSLocale)targetLocale;
- (NSString)clientIdentifier;
- (NSString)sourceText;
- (NSString)targetText;
- (_LTLocalePair)localePair;
- (_LTTextResult)initWithLocalePair:(id)a3 sourceText:(id)a4 targetText:(id)a5 clientIdentifier:(id)a6;
- (id)debugDescription;
- (unint64_t)hash;
@end

@implementation _LTTextResult

- (_LTTextResult)initWithLocalePair:(id)a3 sourceText:(id)a4 targetText:(id)a5 clientIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)_LTTextResult;
  v15 = [(_LTTextResult *)&v25 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_localePair, a3);
    uint64_t v17 = [v12 copy];
    sourceText = v16->_sourceText;
    v16->_sourceText = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    targetText = v16->_targetText;
    v16->_targetText = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    clientIdentifier = v16->_clientIdentifier;
    v16->_clientIdentifier = (NSString *)v21;

    v23 = v16;
  }

  return v16;
}

- (NSLocale)sourceLocale
{
  return [(_LTLocalePair *)self->_localePair sourceLocale];
}

- (NSLocale)targetLocale
{
  return [(_LTLocalePair *)self->_localePair targetLocale];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(_LTTextResult *)self clientIdentifier];
    v7 = [v5 clientIdentifier];
    if ([v6 isEqualToString:v7])
    {
      BOOL v8 = 1;
    }
    else
    {
      v10 = [(_LTTextResult *)self clientIdentifier];
      if (v10)
      {
        BOOL v8 = 0;
      }
      else
      {
        id v11 = [(_LTTextResult *)self clientIdentifier];
        BOOL v8 = v11 == 0;
      }
    }

    id v12 = [(_LTTextResult *)self localePair];
    id v13 = [v5 localePair];
    if ([v12 isEqual:v13])
    {
      id v14 = [(_LTTextResult *)self sourceText];
      v15 = [v5 sourceText];
      if ([v14 isEqualToString:v15])
      {
        v16 = [(_LTTextResult *)self targetText];
        uint64_t v17 = [v5 targetText];
        BOOL v9 = [v16 isEqualToString:v17] & v8;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(_LTTextResult *)self localePair];
  uint64_t v4 = [v3 hash];
  id v5 = [(_LTTextResult *)self sourceText];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(_LTTextResult *)self targetText];
  uint64_t v8 = [v7 hash];
  BOOL v9 = [(_LTTextResult *)self clientIdentifier];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(_LTTextResult *)self sourceText];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p source: %@>", v4, self, v5];

  return v6;
}

- (_LTLocalePair)localePair
{
  return self->_localePair;
}

- (NSString)sourceText
{
  return self->_sourceText;
}

- (NSString)targetText
{
  return self->_targetText;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_targetText, 0);
  objc_storeStrong((id *)&self->_sourceText, 0);

  objc_storeStrong((id *)&self->_localePair, 0);
}

@end