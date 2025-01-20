@interface CEImageIcon
+ (BOOL)supportsSecureCoding;
- (CEImageIcon)initWithCoder:(id)a3;
- (CEImageIcon)initWithDictionary:(id)a3;
- (NSURL)URL1x;
- (NSURL)URL2x;
- (NSURL)URL3x;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setURL1x:(id)a3;
- (void)setURL2x:(id)a3;
- (void)setURL3x:(id)a3;
@end

@implementation CEImageIcon

- (CEImageIcon)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CEImageIcon;
  v5 = [(CEIcon *)&v17 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"iconUrls"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [v6 objectForKeyedSubscript:@"1x"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = [NSURL URLWithString:v7];
        URL1x = v5->_URL1x;
        v5->_URL1x = (NSURL *)v8;
      }
      v10 = [v6 objectForKeyedSubscript:@"2x"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [NSURL URLWithString:v10];
        URL2x = v5->_URL2x;
        v5->_URL2x = (NSURL *)v11;
      }
      v13 = [v6 objectForKeyedSubscript:@"3x"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = [NSURL URLWithString:v13];
        URL3x = v5->_URL3x;
        v5->_URL3x = (NSURL *)v14;
      }
    }
    else
    {
      v7 = _CELogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[CEImageIcon initWithDictionary:]();
      }
    }
  }
  return v5;
}

- (CEImageIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CEImageIcon;
  v5 = [(CEIcon *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url1x"];
    URL1x = v5->_URL1x;
    v5->_URL1x = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url2x"];
    URL2x = v5->_URL2x;
    v5->_URL2x = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url3x"];
    URL3x = v5->_URL3x;
    v5->_URL3x = (NSURL *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CEImageIcon;
  id v4 = [(CEIcon *)&v6 copyWithZone:a3];
  [v4 setURL1x:self->_URL1x];
  [v4 setURL2x:self->_URL2x];
  [v4 setURL3x:self->_URL3x];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CEImageIcon;
  id v4 = a3;
  [(CEIcon *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_URL1x, @"url1x", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_URL2x forKey:@"url2x"];
  [v4 encodeObject:self->_URL3x forKey:@"url3x"];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CEImageIcon;
  v3 = [(CEIcon *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" url1x: %@ url2x: %@ url3x: %@", self->_URL1x, self->_URL2x, self->_URL3x];

  return v4;
}

- (NSURL)URL1x
{
  return self->_URL1x;
}

- (void)setURL1x:(id)a3
{
}

- (NSURL)URL2x
{
  return self->_URL2x;
}

- (void)setURL2x:(id)a3
{
}

- (NSURL)URL3x
{
  return self->_URL3x;
}

- (void)setURL3x:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL3x, 0);
  objc_storeStrong((id *)&self->_URL2x, 0);
  objc_storeStrong((id *)&self->_URL1x, 0);
}

- (void)initWithDictionary:.cold.1()
{
  v0 = objc_opt_class();
  id v1 = OUTLINED_FUNCTION_1(v0);
  OUTLINED_FUNCTION_0(&dword_24A2CB000, v2, v3, "%@ Unable to parse urls from dictionary", v4, v5, v6, v7, v8);
}

@end