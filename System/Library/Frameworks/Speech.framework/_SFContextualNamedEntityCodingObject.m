@interface _SFContextualNamedEntityCodingObject
+ (BOOL)supportsSecureCoding;
- (NSNumber)category;
- (NSNumber)score;
- (NSString)content;
- (NSString)language;
- (_SFContextualNamedEntityCodingObject)initWithCoder:(id)a3;
- (_SFContextualNamedEntityCodingObject)initWithContent:(id)a3 sourceFramework:(int64_t)a4 score:(id)a5 category:(id)a6 language:(id)a7;
- (int64_t)sourceFramework;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SFContextualNamedEntityCodingObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_score, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

- (NSString)language
{
  return self->_language;
}

- (NSNumber)category
{
  return self->_category;
}

- (NSNumber)score
{
  return self->_score;
}

- (int64_t)sourceFramework
{
  return self->_sourceFramework;
}

- (NSString)content
{
  return self->_content;
}

- (_SFContextualNamedEntityCodingObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SFContextualNamedEntityCodingObject;
  v5 = [(_SFContextualNamedEntityCodingObject *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_content"];
    content = v5->_content;
    v5->_content = (NSString *)v6;

    v5->_sourceFramework = [v4 decodeIntegerForKey:@"_sourceFramework"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_score"];
    score = v5->_score;
    v5->_score = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_category"];
    category = v5->_category;
    v5->_category = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_language"];
    language = v5->_language;
    v5->_language = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  content = self->_content;
  id v5 = a3;
  [v5 encodeObject:content forKey:@"_content"];
  [v5 encodeInteger:self->_sourceFramework forKey:@"_sourceFramework"];
  [v5 encodeObject:self->_score forKey:@"_score"];
  [v5 encodeObject:self->_category forKey:@"_category"];
  [v5 encodeObject:self->_language forKey:@"_language"];
}

- (_SFContextualNamedEntityCodingObject)initWithContent:(id)a3 sourceFramework:(int64_t)a4 score:(id)a5 category:(id)a6 language:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)_SFContextualNamedEntityCodingObject;
  v16 = [(_SFContextualNamedEntityCodingObject *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    content = v16->_content;
    v16->_content = (NSString *)v17;

    v16->_sourceFramework = a4;
    uint64_t v19 = [v13 copy];
    score = v16->_score;
    v16->_score = (NSNumber *)v19;

    uint64_t v21 = [v14 copy];
    category = v16->_category;
    v16->_category = (NSNumber *)v21;

    uint64_t v23 = [v15 copy];
    language = v16->_language;
    v16->_language = (NSString *)v23;
  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end