@interface BSBuildVersion
+ (id)fromString:(id)a3;
- (BOOL)isAfter:(id)a3;
- (BOOL)isAfter:(id)a3 withPrecision:(int64_t)a4;
- (BOOL)isBefore:(id)a3;
- (BOOL)isBefore:(id)a3 withPrecision:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSameAs:(id)a3;
- (BOOL)isSameAs:(id)a3 withPrecision:(int64_t)a4;
- (BSBuildVersion)init;
- (BSBuildVersion)initWithString:(id)a3;
- (NSString)majorBuildLetterString;
- (NSString)minorBuildLetterString;
- (NSString)stringRepresentation;
- (id)description;
- (int64_t)_compareAgainstBuildVersion:(id)a3 withPrecision:(int64_t)a4;
- (int64_t)majorBuildNumber;
- (int64_t)minorBuildNumber;
- (unint64_t)hash;
@end

@implementation BSBuildVersion

+ (id)fromString:(id)a3
{
  id v3 = a3;
  v4 = [[BSBuildVersion alloc] initWithString:v3];

  return v4;
}

- (BSBuildVersion)init
{
  v4 = (void *)_CFCopySystemVersionDictionary();
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"BSBuildVersion.m" lineNumber:24 description:@"System version dictionary not found."];
  }
  v5 = [v4 objectForKey:*MEMORY[0x1E4F1CD10]];
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"BSBuildVersion.m" lineNumber:26 description:@"System version string not found."];
  }
  v6 = [(BSBuildVersion *)self initWithString:v5];

  return v6;
}

- (BSBuildVersion)initWithString:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)BSBuildVersion;
  v5 = [(BSBuildVersion *)&v37 init];
  if (!v5) {
    goto LABEL_17;
  }
  if ([v4 length] >= 1)
  {
    v6 = [MEMORY[0x1E4F28B88] letterCharacterSet];
    uint64_t v7 = [v4 rangeOfCharacterFromSet:v6];
    uint64_t v9 = v8;

    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v9 == 1)
    {
      uint64_t v10 = [v4 copy];
      stringRepresentation = v5->_stringRepresentation;
      v5->_stringRepresentation = (NSString *)v10;

      v12 = [v4 substringToIndex:v7];
      v5->_majorBuildNumber = [v12 integerValue];

      v13 = objc_msgSend(v4, "substringWithRange:", v7, 1);
      uint64_t v14 = [v13 copy];
      majorBuildLetterString = v5->_majorBuildLetterString;
      v5->_majorBuildLetterString = (NSString *)v14;

      uint64_t v16 = v7 + 1;
      v17 = [v4 substringFromIndex:v7 + 1];
      v18 = [MEMORY[0x1E4F28B88] letterCharacterSet];
      uint64_t v19 = [v17 rangeOfCharacterFromSet:v18];
      uint64_t v21 = v20;

      if (v19 == 0x7FFFFFFFFFFFFFFFLL || v21 != 1)
      {
        if (v19 == 0x7FFFFFFFFFFFFFFFLL)
        {
          minorBuildLetterString = v5->_minorBuildLetterString;
          v5->_minorBuildLetterString = 0;

          v25 = [v4 substringFromIndex:v16];
          uint64_t v26 = [v25 integerValue];
          goto LABEL_14;
        }
      }
      else if (v19 == [v17 length] - 1)
      {
        v22 = objc_msgSend(v17, "substringWithRange:", v19, 1);
        uint64_t v23 = [v22 copy];
        v24 = v5->_minorBuildLetterString;
        v5->_minorBuildLetterString = (NSString *)v23;

        v25 = [v17 substringToIndex:v19];
        uint64_t v26 = [v25 integerValue];
LABEL_14:
        v5->_minorBuildNumber = v26;

        goto LABEL_16;
      }

      v5 = 0;
      goto LABEL_16;
    }
    v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "integerValue"));
    v28 = [v27 stringValue];
    int v29 = [v4 isEqual:v28];

    if (v29)
    {
      uint64_t v30 = [v4 copy];
      v31 = v5->_stringRepresentation;
      v5->_stringRepresentation = (NSString *)v30;

      uint64_t v32 = [v4 integerValue];
      v33 = v5->_majorBuildLetterString;
      v5->_majorBuildNumber = v32;
      v5->_majorBuildLetterString = 0;

      v17 = v5->_minorBuildLetterString;
      v5->_minorBuildNumber = 0;
      v5->_minorBuildLetterString = 0;
LABEL_16:

LABEL_17:
      v5 = v5;
      v34 = v5;
      goto LABEL_18;
    }
  }
  v34 = 0;
LABEL_18:

  return v34;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BSBuildVersion *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = v5;
      if (self->_majorBuildNumber == v5->_majorBuildNumber && self->_minorBuildNumber == v5->_minorBuildNumber)
      {
        majorBuildLetterString = self->_majorBuildLetterString;
        uint64_t v8 = v6->_majorBuildLetterString;
        if (majorBuildLetterString == v8) {
          goto LABEL_9;
        }
        char v9 = 0;
        if (!majorBuildLetterString || !v8)
        {
LABEL_16:

          goto LABEL_17;
        }
        if (-[NSString isEqualToString:](majorBuildLetterString, "isEqualToString:"))
        {
LABEL_9:
          minorBuildLetterString = self->_minorBuildLetterString;
          v11 = v6->_minorBuildLetterString;
          if (minorBuildLetterString == v11)
          {
            char v9 = 1;
          }
          else
          {
            char v9 = 0;
            if (minorBuildLetterString && v11) {
              char v9 = -[NSString isEqualToString:](minorBuildLetterString, "isEqualToString:");
            }
          }
          goto LABEL_16;
        }
      }
      char v9 = 0;
      goto LABEL_16;
    }
    char v9 = 0;
  }
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  id v3 = +[BSHashBuilder builder];
  id v4 = (id)[v3 appendObject:self->_stringRepresentation];
  id v5 = (id)[v3 appendInteger:self->_majorBuildNumber];
  id v6 = (id)[v3 appendObject:self->_majorBuildLetterString];
  id v7 = (id)[v3 appendInteger:self->_minorBuildNumber];
  id v8 = (id)[v3 appendObject:self->_minorBuildLetterString];
  unint64_t v9 = [v3 hash];

  return v9;
}

- (BOOL)isSameAs:(id)a3
{
  return [(BSBuildVersion *)self isSameAs:a3 withPrecision:0];
}

- (BOOL)isSameAs:(id)a3 withPrecision:(int64_t)a4
{
  return [(BSBuildVersion *)self _compareAgainstBuildVersion:a3 withPrecision:a4] == 0;
}

- (BOOL)isBefore:(id)a3
{
  return [(BSBuildVersion *)self isBefore:a3 withPrecision:0];
}

- (BOOL)isBefore:(id)a3 withPrecision:(int64_t)a4
{
  return [(BSBuildVersion *)self _compareAgainstBuildVersion:a3 withPrecision:a4] == -1;
}

- (BOOL)isAfter:(id)a3
{
  return [(BSBuildVersion *)self isAfter:a3 withPrecision:0];
}

- (BOOL)isAfter:(id)a3 withPrecision:(int64_t)a4
{
  return [(BSBuildVersion *)self _compareAgainstBuildVersion:a3 withPrecision:a4] == 1;
}

- (int64_t)_compareAgainstBuildVersion:(id)a3 withPrecision:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"BSBuildVersion.m", 127, @"Invalid parameter not satisfying: %@", @"otherBuildVersion" object file lineNumber description];
  }
  int64_t majorBuildNumber = self->_majorBuildNumber;
  uint64_t v9 = [v7 majorBuildNumber];
  if (majorBuildNumber < v9) {
    int64_t v10 = -1;
  }
  else {
    int64_t v10 = majorBuildNumber > v9;
  }
  if (!v10)
  {
    if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
LABEL_8:
      int64_t v10 = 0;
      goto LABEL_17;
    }
    majorBuildLetterString = self->_majorBuildLetterString;
    v12 = [v7 majorBuildLetterString];
    int64_t v10 = [(NSString *)majorBuildLetterString caseInsensitiveCompare:v12];

    if (!(v10 | a4))
    {
      int64_t minorBuildNumber = self->_minorBuildNumber;
      uint64_t v14 = [v7 minorBuildNumber];
      int64_t v10 = minorBuildNumber < v14 ? -1 : minorBuildNumber > v14;
      if (!v10)
      {
        if (self->_minorBuildLetterString
          || ([v7 minorBuildLetterString],
              v15 = objc_claimAutoreleasedReturnValue(),
              v15,
              v15))
        {
          uint64_t v16 = [(BSBuildVersion *)self minorBuildLetterString];
          v17 = [v7 minorBuildLetterString];
          int64_t v10 = [v16 caseInsensitiveCompare:v17];

          goto LABEL_17;
        }
        goto LABEL_8;
      }
    }
  }
LABEL_17:

  return v10;
}

- (id)description
{
  id v3 = +[BSDescriptionBuilder builderWithObject:self];
  [v3 appendString:self->_stringRepresentation withName:0];
  id v4 = (id)[v3 appendInteger:self->_majorBuildNumber withName:@"majorNumber"];
  [v3 appendString:self->_majorBuildLetterString withName:@"majorLetter"];
  id v5 = (id)[v3 appendInteger:self->_minorBuildNumber withName:@"minorNumber"];
  [v3 appendString:self->_minorBuildLetterString withName:@"minorLetter" skipIfEmpty:1];
  id v6 = [v3 build];

  return v6;
}

- (NSString)stringRepresentation
{
  return self->_stringRepresentation;
}

- (int64_t)majorBuildNumber
{
  return self->_majorBuildNumber;
}

- (NSString)majorBuildLetterString
{
  return self->_majorBuildLetterString;
}

- (int64_t)minorBuildNumber
{
  return self->_minorBuildNumber;
}

- (NSString)minorBuildLetterString
{
  return self->_minorBuildLetterString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minorBuildLetterString, 0);
  objc_storeStrong((id *)&self->_majorBuildLetterString, 0);
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
}

@end