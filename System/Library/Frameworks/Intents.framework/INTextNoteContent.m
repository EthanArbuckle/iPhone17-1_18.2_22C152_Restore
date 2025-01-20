@interface INTextNoteContent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INTextNoteContent)initWithCoder:(id)a3;
- (INTextNoteContent)initWithText:(NSString *)text;
- (NSString)text;
- (id)_dictionaryRepresentation;
- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INTextNoteContent

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  v4 = [(INTextNoteContent *)self text];
  v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v6 = [v4 stringByTrimmingCharactersInSet:v5];

  return v6;
}

- (void).cxx_destruct
{
}

- (NSString)text
{
  return self->_text;
}

- (id)_dictionaryRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"text";
  text = self->_text;
  v3 = text;
  if (!text)
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  if (!text) {

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (INTextNoteContent)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"text"];

  v9 = (INTextNoteContent *)[objc_alloc((Class)objc_opt_class()) initWithText:v8];
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    text = self->_text;
    BOOL v7 = text == (NSString *)v5[1] || -[NSString isEqual:](text, "isEqual:");
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_text hash];
}

- (INTextNoteContent)initWithText:(NSString *)text
{
  id v5 = text;
  v9.receiver = self;
  v9.super_class = (Class)INTextNoteContent;
  uint64_t v6 = [(INTextNoteContent *)&v9 init];
  BOOL v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_text, text);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end