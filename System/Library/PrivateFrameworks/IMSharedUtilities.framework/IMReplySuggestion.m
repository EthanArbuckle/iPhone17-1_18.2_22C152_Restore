@interface IMReplySuggestion
- (IMReplySuggestion)initWithType:(int64_t)a3 text:(id)a4;
- (NSString)attribution;
- (NSString)stringRepresentation;
- (NSString)text;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)tintColor;
- (int64_t)type;
- (void)setAttribution:(id)a3;
- (void)setStringRepresentation:(id)a3;
- (void)setTintColor:(int64_t)a3;
@end

@implementation IMReplySuggestion

- (IMReplySuggestion)initWithType:(int64_t)a3 text:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IMReplySuggestion;
  v7 = [(IMReplySuggestion *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    uint64_t v9 = [v6 copy];
    text = v8->_text;
    v8->_text = (NSString *)v9;

    objc_storeStrong((id *)&v8->_stringRepresentation, v8->_text);
    v11 = v8;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[IMReplySuggestion alloc] initWithType:self->_type text:self->_text];
  v5 = (void *)[(NSString *)self->_attribution copy];
  [(IMReplySuggestion *)v4 setAttribution:v5];

  id v6 = (void *)[(NSString *)self->_stringRepresentation copy];
  [(IMReplySuggestion *)v4 setStringRepresentation:v6];

  [(IMReplySuggestion *)v4 setTintColor:self->_tintColor];
  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)stringRepresentation
{
  return self->_stringRepresentation;
}

- (void)setStringRepresentation:(id)a3
{
}

- (NSString)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(id)a3
{
}

- (int64_t)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(int64_t)a3
{
  self->_tintColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_stringRepresentation, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end