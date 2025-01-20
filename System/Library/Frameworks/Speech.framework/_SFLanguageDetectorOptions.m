@interface _SFLanguageDetectorOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)languageConstraints;
- (_SFLanguageDetectorOptions)initWithCoder:(id)a3;
- (_SFLanguageDetectorOptions)initWithLanguageConstraints:(id)a3 alternativesCount:(int64_t)a4;
- (int64_t)alternativesCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SFLanguageDetectorOptions

- (void).cxx_destruct
{
}

- (int64_t)alternativesCount
{
  return self->_alternativesCount;
}

- (NSArray)languageConstraints
{
  return self->_languageConstraints;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_SFLanguageDetectorOptions *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else if ([(_SFLanguageDetectorOptions *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    languageConstraints = self->_languageConstraints;
    if ((unint64_t)languageConstraints | (unint64_t)v5->_languageConstraints) {
      char v7 = -[NSArray isEqualToArray:](languageConstraints, "isEqualToArray:");
    }
    else {
      char v7 = 1;
    }
    if (self->_alternativesCount == v5->_alternativesCount) {
      BOOL v8 = v7;
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (_SFLanguageDetectorOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFLanguageDetectorOptions;
  v5 = [(_SFLanguageDetectorOptions *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_languageConstraints"];
    languageConstraints = v5->_languageConstraints;
    v5->_languageConstraints = (NSArray *)v6;

    v5->_alternativesCount = [v4 decodeIntegerForKey:@"_alternativesCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  languageConstraints = self->_languageConstraints;
  id v5 = a3;
  [v5 encodeObject:languageConstraints forKey:@"_languageConstraints"];
  [v5 encodeInteger:self->_alternativesCount forKey:@"_alternativesCount"];
}

- (_SFLanguageDetectorOptions)initWithLanguageConstraints:(id)a3 alternativesCount:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFLanguageDetectorOptions;
  char v7 = [(_SFLanguageDetectorOptions *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    languageConstraints = v7->_languageConstraints;
    v7->_languageConstraints = (NSArray *)v8;

    v7->_alternativesCount = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end