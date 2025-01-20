@interface SGDOMParserResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDOMParserResult:(id)a3;
- (NSArray)taggedCharacterRanges;
- (NSString)plainText;
- (SGDOMParserResult)initWithCoder:(id)a3;
- (SGDOMParserResult)initWithPlainText:(id)a3 taggedCharacterRanges:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)insertSubject:(id)a3;
@end

@implementation SGDOMParserResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taggedCharacterRanges, 0);
  objc_storeStrong((id *)&self->_plainText, 0);
}

- (NSArray)taggedCharacterRanges
{
  return self->_taggedCharacterRanges;
}

- (NSString)plainText
{
  return self->_plainText;
}

- (BOOL)isEqualToDOMParserResult:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  plainText = self->_plainText;
  v7 = (NSString *)*((id *)v4 + 1);
  if (plainText == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = plainText;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_10;
    }
  }
  v12 = self->_taggedCharacterRanges;
  v13 = v12;
  if (v12 == (NSArray *)v5[2]) {
    char v11 = 1;
  }
  else {
    char v11 = -[NSArray isEqual:](v12, "isEqual:");
  }

LABEL_10:
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SGDOMParserResult *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGDOMParserResult *)self isEqualToDOMParserResult:v5];

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_plainText hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  plainText = self->_plainText;
  v7 = (void *)[(NSArray *)self->_taggedCharacterRanges copyWithZone:a3];
  v8 = (void *)[v5 initWithPlainText:plainText taggedCharacterRanges:v7];

  return v8;
}

- (SGDOMParserResult)initWithCoder:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SGDOMParserResult;
  BOOL v6 = [(SGDOMParserResult *)&v19 init];
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v8 = [v5 decodeObjectOfClasses:v7 forKey:@"plainText"];

    if (v8)
    {
      v9 = v8;
      plainText = v6->_plainText;
      v6->_plainText = v9;
    }
    else
    {
      plainText = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(plainText, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGDOMParserResult.m", 66, @"nonnull property %s *%s was null when decoded", "NSString", "plainText");
    }

    id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v11, "initWithObjects:", v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v5 decodeObjectOfClasses:v14 forKey:@"taggedCharacterRanges"];

    if (!v15)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, v6, @"SGDOMParserResult.m", 67, @"nonnull NSArray<%@*> *%@ was null when decoded", @"SGTaggedCharacterRange", @"taggedCharacterRanges" object file lineNumber description];
    }
    taggedCharacterRanges = v6->_taggedCharacterRanges;
    v6->_taggedCharacterRanges = (NSArray *)v15;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  plainText = self->_plainText;
  id v5 = a3;
  [v5 encodeObject:plainText forKey:@"plainText"];
  [v5 encodeObject:self->_taggedCharacterRanges forKey:@"taggedCharacterRanges"];
}

- (void)insertSubject:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = (void *)[[NSString alloc] initWithFormat:@"%@ . ", v4];
    uint64_t v29 = [v5 length];
    v25 = v5;
    BOOL v6 = [v5 stringByAppendingString:self->_plainText];
    plainText = self->_plainText;
    self->_plainText = v6;

    v8 = (NSArray *)objc_opt_new();
    id v27 = v4;
    v9 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:]([SGTaggedCharacterRange alloc], "initWithAnnotationType:tags:range:text:", 11, &unk_1F2536B48, 0, [v4 length], v4);
    v30 = v8;
    [(NSArray *)v8 addObject:v9];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v26 = self;
    obj = self->_taggedCharacterRanges;
    uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v32;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v31 + 1) + 8 * v13);
          uint64_t v15 = (void *)MEMORY[0x1CB79B230]();
          v16 = [SGTaggedCharacterRange alloc];
          uint64_t v17 = [v14 annotationType];
          v18 = [v14 tags];
          uint64_t v19 = [v14 range] + v29;
          [v14 range];
          uint64_t v21 = v20;
          v22 = [v14 text];
          v23 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v16, "initWithAnnotationType:tags:range:text:", v17, v18, v19, v21, v22);
          [(NSArray *)v30 addObject:v23];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v11);
    }

    taggedCharacterRanges = v26->_taggedCharacterRanges;
    v26->_taggedCharacterRanges = v30;

    id v4 = v27;
  }
}

- (SGDOMParserResult)initWithPlainText:(id)a3 taggedCharacterRanges:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGDOMParserResult;
  v9 = [(SGDOMParserResult *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_plainText, a3);
    objc_storeStrong((id *)&v10->_taggedCharacterRanges, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end