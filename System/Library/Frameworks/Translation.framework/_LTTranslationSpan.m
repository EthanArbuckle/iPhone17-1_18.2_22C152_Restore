@interface _LTTranslationSpan
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldTranslate;
- (NSData)metaInfoData;
- (NSString)identifier;
- (_LTTranslationSpan)initWithCoder:(id)a3;
- (_LTTranslationSpan)initWithIdentifier:(id)a3 range:(_NSRange)a4;
- (_LTTranslationSpan)initWithIdentifier:(id)a3 range:(_NSRange)a4 shouldTranslate:(BOOL)a5 metaInfoData:(id)a6;
- (_NSRange)range;
- (void)encodeWithCoder:(id)a3;
- (void)setMetaInfoData:(id)a3;
- (void)setShouldTranslate:(BOOL)a3;
@end

@implementation _LTTranslationSpan

- (_LTTranslationSpan)initWithIdentifier:(id)a3 range:(_NSRange)a4
{
  return -[_LTTranslationSpan initWithIdentifier:range:shouldTranslate:metaInfoData:](self, "initWithIdentifier:range:shouldTranslate:metaInfoData:", a3, a4.location, a4.length, 1, 0);
}

- (_LTTranslationSpan)initWithIdentifier:(id)a3 range:(_NSRange)a4 shouldTranslate:(BOOL)a5 metaInfoData:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v12 = a3;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_LTTranslationSpan;
  v14 = [(_LTTranslationSpan *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    v15->_range.NSUInteger location = location;
    v15->_range.NSUInteger length = length;
    v15->_shouldTranslate = a5;
    objc_storeStrong((id *)&v15->_metaInfoData, a6);
    v16 = v15;
  }

  return v15;
}

- (_LTTranslationSpan)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LTTranslationSpan;
  v5 = [(_LTTranslationSpan *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"range"];
    v9 = v8;
    if (v8)
    {
      v5->_range.NSUInteger location = [v8 rangeValue];
      v5->_range.NSUInteger length = v10;
    }
    v5->_shouldTranslate = [v4 decodeBoolForKey:@"shouldTranslate"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metaInfoData"];
    metaInfoData = v5->_metaInfoData;
    v5->_metaInfoData = (NSData *)v11;

    id v13 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", self->_range.location, self->_range.length);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"range"];
  [v5 encodeBool:self->_shouldTranslate forKey:@"shouldTranslate"];
  [v5 encodeObject:self->_metaInfoData forKey:@"metaInfoData"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_LTTranslationSpan *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(_LTTranslationSpan *)v5 identifier];
      v7 = [(_LTTranslationSpan *)self identifier];
      if ([v6 isEqual:v7])
      {
        uint64_t v8 = [(_LTTranslationSpan *)self range];
        uint64_t v10 = v9;
        BOOL v13 = v8 == [(_LTTranslationSpan *)v5 range] && v10 == v11;
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)shouldTranslate
{
  return self->_shouldTranslate;
}

- (void)setShouldTranslate:(BOOL)a3
{
  self->_shouldTranslate = a3;
}

- (NSData)metaInfoData
{
  return self->_metaInfoData;
}

- (void)setMetaInfoData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaInfoData, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end