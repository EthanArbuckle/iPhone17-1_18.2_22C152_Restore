@interface GPPromptElement
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersonHandle;
- (BOOL)isSuggestableText;
- (BOOL)isTitle;
- (BOOL)needsConceptsExtraction;
- (BOOL)needsSuggestableConceptsExtraction;
- (GPPromptElement)initWithCoder:(id)a3;
- (GPPromptElement)initWithText:(id)a3;
- (GPPromptElement)initWithText:(id)a3 isPersonHandle:(BOOL)a4 isTitle:(BOOL)a5 isSuggestableText:(BOOL)a6 needsConceptsExtraction:(BOOL)a7 needsSuggestableConceptsExtraction:(BOOL)a8;
- (GPPromptElement)initWithText:(id)a3 isTitle:(BOOL)a4 isSuggestableText:(BOOL)a5 needsConceptsExtraction:(BOOL)a6 needsSuggestableConceptsExtraction:(BOOL)a7;
- (GPPromptElement)initWithText:(id)a3 title:(id)a4 isPersonHandle:(BOOL)a5 isSuggestableText:(BOOL)a6 needsConceptsExtraction:(BOOL)a7 needsSuggestableConceptsExtraction:(BOOL)a8;
- (NSString)text;
- (NSString)title;
- (void)encodeWithCoder:(id)a3;
- (void)setIsPersonHandle:(BOOL)a3;
- (void)setIsSuggestableText:(BOOL)a3;
- (void)setIsTitle:(BOOL)a3;
- (void)setNeedsConceptsExtraction:(BOOL)a3;
- (void)setNeedsSuggestableConceptsExtraction:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation GPPromptElement

- (GPPromptElement)initWithText:(id)a3 title:(id)a4 isPersonHandle:(BOOL)a5 isSuggestableText:(BOOL)a6 needsConceptsExtraction:(BOOL)a7 needsSuggestableConceptsExtraction:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GPPromptElement;
  v16 = [(GPPromptElement *)&v19 init];
  v17 = v16;
  if (v16)
  {
    [(GPPromptElement *)v16 setText:v14];
    [(GPPromptElement *)v17 setTitle:v15];
    [(GPPromptElement *)v17 setIsPersonHandle:v11];
    v17->_isTitle = v14 == v15;
    [(GPPromptElement *)v17 setIsSuggestableText:v10];
    [(GPPromptElement *)v17 setNeedsConceptsExtraction:v9];
    [(GPPromptElement *)v17 setNeedsSuggestableConceptsExtraction:v8];
  }

  return v17;
}

- (void)setIsTitle:(BOOL)a3
{
  self->_isTitle = a3;
  if (a3) {
    objc_storeStrong((id *)&self->_title, self->_text);
  }
}

- (void)setTitle:(id)a3
{
  if (a3) {
    self->_isTitle = 1;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GPPromptElement)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  uint64_t v7 = [v4 decodeBoolForKey:@"isPersonHandle"];
  uint64_t v8 = [v4 decodeBoolForKey:@"isSuggestableText"];
  uint64_t v9 = [v4 decodeBoolForKey:@"needsConceptsExtraction"];
  uint64_t v10 = [v4 decodeBoolForKey:@"needsSuggestableConceptsExtraction"];

  BOOL v11 = [(GPPromptElement *)self initWithText:v5 title:v6 isPersonHandle:v7 isSuggestableText:v8 needsConceptsExtraction:v9 needsSuggestableConceptsExtraction:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(GPPromptElement *)self text];
  [v6 encodeObject:v4 forKey:@"text"];

  v5 = [(GPPromptElement *)self title];
  [v6 encodeObject:v5 forKey:@"title"];

  objc_msgSend(v6, "encodeBool:forKey:", -[GPPromptElement isPersonHandle](self, "isPersonHandle"), @"isPersonHandle");
  objc_msgSend(v6, "encodeBool:forKey:", -[GPPromptElement isSuggestableText](self, "isSuggestableText"), @"isSuggestableText");
  objc_msgSend(v6, "encodeBool:forKey:", -[GPPromptElement needsConceptsExtraction](self, "needsConceptsExtraction"), @"needsConceptsExtraction");
  objc_msgSend(v6, "encodeBool:forKey:", -[GPPromptElement needsSuggestableConceptsExtraction](self, "needsSuggestableConceptsExtraction"), @"needsSuggestableConceptsExtraction");
}

- (GPPromptElement)initWithText:(id)a3 isPersonHandle:(BOOL)a4 isTitle:(BOOL)a5 isSuggestableText:(BOOL)a6 needsConceptsExtraction:(BOOL)a7 needsSuggestableConceptsExtraction:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a4;
  if (a5) {
    id v13 = a3;
  }
  else {
    id v13 = 0;
  }
  id v14 = a3;
  id v15 = [(GPPromptElement *)self initWithText:v14 title:v13 isPersonHandle:v11 isSuggestableText:v10 needsConceptsExtraction:v9 needsSuggestableConceptsExtraction:v8];

  return v15;
}

- (GPPromptElement)initWithText:(id)a3 isTitle:(BOOL)a4 isSuggestableText:(BOOL)a5 needsConceptsExtraction:(BOOL)a6 needsSuggestableConceptsExtraction:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  if (a4) {
    id v11 = a3;
  }
  else {
    id v11 = 0;
  }
  id v12 = a3;
  id v13 = [(GPPromptElement *)self initWithText:v12 title:v11 isPersonHandle:0 isSuggestableText:v9 needsConceptsExtraction:v8 needsSuggestableConceptsExtraction:v7];

  return v13;
}

- (GPPromptElement)initWithText:(id)a3
{
  return [(GPPromptElement *)self initWithText:a3 title:0 isPersonHandle:0 isSuggestableText:0 needsConceptsExtraction:0 needsSuggestableConceptsExtraction:0];
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isPersonHandle
{
  return self->_isPersonHandle;
}

- (void)setIsPersonHandle:(BOOL)a3
{
  self->_isPersonHandle = a3;
}

- (BOOL)isSuggestableText
{
  return self->_isSuggestableText;
}

- (void)setIsSuggestableText:(BOOL)a3
{
  self->_isSuggestableText = a3;
}

- (BOOL)needsConceptsExtraction
{
  return self->_needsConceptsExtraction;
}

- (void)setNeedsConceptsExtraction:(BOOL)a3
{
  self->_needsConceptsExtraction = a3;
}

- (BOOL)needsSuggestableConceptsExtraction
{
  return self->_needsSuggestableConceptsExtraction;
}

- (void)setNeedsSuggestableConceptsExtraction:(BOOL)a3
{
  self->_needsSuggestableConceptsExtraction = a3;
}

- (BOOL)isTitle
{
  return self->_isTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end