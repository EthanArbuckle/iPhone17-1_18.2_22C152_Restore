@interface AVAnnotationTextRepresentation
- (AVAnnotationTextRepresentation)initWithText:(id)a3 font:(id)a4;
- (BOOL)hasShadow;
- (BOOL)hasUnderline;
- (BOOL)isEqual:(id)a3;
- (CGColor)backgroundColor;
- (CGColor)foregroundColor;
- (NSString)font;
- (NSString)link;
- (NSString)text;
- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4;
- (id)_propertyListAndBinaryData:(id *)a3;
- (id)description;
- (int64_t)writingMode;
- (unint64_t)hash;
- (void)dealloc;
- (void)setBackgroundColor:(CGColor *)a3;
- (void)setFont:(id)a3;
- (void)setForegroundColor:(CGColor *)a3;
- (void)setHasShadow:(BOOL)a3;
- (void)setHasUnderline:(BOOL)a3;
- (void)setLink:(id)a3;
- (void)setText:(id)a3;
- (void)setWritingMode:(int64_t)a3;
@end

@implementation AVAnnotationTextRepresentation

- (AVAnnotationTextRepresentation)initWithText:(id)a3 font:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVAnnotationTextRepresentation;
  v6 = [(AVAnnotationRepresentation *)&v8 _initWithRepresentationType:@"AVAnnotationRepresentationTypeText"];
  if (v6)
  {
    v6->_text = (NSString *)[a3 copy];
    v6->_font = (NSString *)[a4 copy];
    v6->_backgroundColor = (CGColor *)FigCreateCGColorSRGBFromArray();
    v6->_foregroundColor = (CGColor *)FigCreateCGColorSRGBFromArray();
    v6->_link = 0;
    v6->_hasShadow = 0;
    v6->_hasUnderline = 0;
    v6->_writingMode = 0;
  }
  return v6;
}

- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)AVAnnotationTextRepresentation;
  v5 = [(AVAnnotationRepresentation *)&v32 _initWithPropertyList:a3 binaryData:a4];
  if (!v5) {
    goto LABEL_31;
  }
  v6 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyText"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_31;
  }
  v5[4] = [v6 copy];
  v7 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyFont"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_31;
  }
  v5[5] = [v7 copy];
  objc_super v8 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyBackgroundColor"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v8 count] != 4) {
    goto LABEL_31;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
LABEL_8:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v29 != v11) {
        objc_enumerationMutation(v8);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_31;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v10) {
          goto LABEL_8;
        }
        break;
      }
    }
  }
  v5[6] = FigCreateCGColorSRGBFromArray();
  v13 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyForegroundColor"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v13 count] != 4) {
    goto LABEL_31;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v25;
LABEL_18:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v25 != v16) {
        objc_enumerationMutation(v13);
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_31;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v33 count:16];
        if (v15) {
          goto LABEL_18;
        }
        break;
      }
    }
  }
  v5[7] = FigCreateCGColorSRGBFromArray();
  uint64_t v18 = [a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyLink"];
  if (v18)
  {
    v19 = (void *)v18;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = [v19 copy];
      goto LABEL_27;
    }
LABEL_31:

    return 0;
  }
LABEL_27:
  v5[8] = v18;
  v20 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyHasShadow"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_31;
  }
  *((unsigned char *)v5 + 72) = [v20 BOOLValue];
  v21 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyHasUnderline"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_31;
  }
  *((unsigned char *)v5 + 73) = [v21 BOOLValue];
  v22 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyWritingMode"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_31;
  }
  v5[10] = [v22 integerValue];
  return v5;
}

- (void)dealloc
{
  CGColorRelease(self->_backgroundColor);
  CGColorRelease(self->_foregroundColor);

  v3.receiver = self;
  v3.super_class = (Class)AVAnnotationTextRepresentation;
  [(AVAnnotationRepresentation *)&v3 dealloc];
}

- (CGColor)backgroundColor
{
  v2 = self->_backgroundColor;
  return v2;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  v4 = CGColorRetain(a3);
  CGColorRelease(self->_backgroundColor);
  self->_backgroundColor = v4;
}

- (CGColor)foregroundColor
{
  v2 = self->_foregroundColor;
  return v2;
}

- (void)setForegroundColor:(CGColor *)a3
{
  v4 = CGColorRetain(a3);
  CGColorRelease(self->_foregroundColor);
  self->_foregroundColor = v4;
}

- (BOOL)isEqual:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AVAnnotationTextRepresentation;
  BOOL v5 = -[AVAnnotationRepresentation isEqual:](&v11, sel_isEqual_);
  if (a3 != self)
  {
    if (!a3) {
      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_17;
    }
    if (v5) {
      BOOL v5 = -[NSString isEqualToString:](-[AVAnnotationTextRepresentation text](self, "text"), "isEqualToString:", [a3 text])&& -[NSString isEqualToString:](-[AVAnnotationTextRepresentation font](self, "font"), "isEqualToString:", objc_msgSend(a3, "font"))&& CGColorEqualToColor(-[AVAnnotationTextRepresentation backgroundColor](self, "backgroundColor"), (CGColorRef)objc_msgSend(a3, "backgroundColor"))&& CGColorEqualToColor(-[AVAnnotationTextRepresentation foregroundColor](self, "foregroundColor"), (CGColorRef)objc_msgSend(a3, "foregroundColor"));
    }
    v6 = [(AVAnnotationTextRepresentation *)self link];
    if (v6 == (NSString *)[a3 link])
    {
      if (v5) {
        goto LABEL_15;
      }
    }
    else if (v5)
    {
      if (!-[NSString isEqualToString:](-[AVAnnotationTextRepresentation link](self, "link"), "isEqualToString:", [a3 link]))
      {
LABEL_17:
        LOBYTE(v5) = 0;
        return v5;
      }
LABEL_15:
      int v7 = [(AVAnnotationTextRepresentation *)self hasShadow];
      if (v7 == [a3 hasShadow])
      {
        int v8 = [(AVAnnotationTextRepresentation *)self hasUnderline];
        if (v8 == [a3 hasUnderline])
        {
          int64_t v10 = [(AVAnnotationTextRepresentation *)self writingMode];
          LOBYTE(v5) = v10 == [a3 writingMode];
          return v5;
        }
      }
      goto LABEL_17;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)AVAnnotationTextRepresentation;
  unint64_t v3 = [(AVAnnotationRepresentation *)&v12 hash];
  NSUInteger v4 = [(NSString *)[(AVAnnotationTextRepresentation *)self text] hash];
  NSUInteger v5 = v4 ^ [(NSString *)[(AVAnnotationTextRepresentation *)self font] hash];
  [(AVAnnotationTextRepresentation *)self backgroundColor];
  uint64_t v6 = v5 ^ [(id)FigCopyCGColorSRGBAsArray() hash];
  [(AVAnnotationTextRepresentation *)self foregroundColor];
  uint64_t v7 = v6 ^ [(id)FigCopyCGColorSRGBAsArray() hash] ^ v3;
  NSUInteger v8 = v7 ^ [(NSString *)[(AVAnnotationTextRepresentation *)self link] hash];
  uint64_t v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AVAnnotationTextRepresentation hasShadow](self, "hasShadow")), "hash");
  uint64_t v10 = v8 ^ v9 ^ objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AVAnnotationTextRepresentation hasUnderline](self, "hasUnderline")), "hash");
  return v10 ^ objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AVAnnotationTextRepresentation writingMode](self, "writingMode")), "hash");
}

- (id)_propertyListAndBinaryData:(id *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVAnnotationTextRepresentation;
  id v5 = -[AVAnnotationRepresentation _propertyListAndBinaryData:](&v8, sel__propertyListAndBinaryData_);
  objc_msgSend(v5, "setObject:forKey:", -[AVAnnotationTextRepresentation text](self, "text"), @"AVAnnotationRepresentationArchiveKeyText");
  objc_msgSend(v5, "setObject:forKey:", -[AVAnnotationTextRepresentation font](self, "font"), @"AVAnnotationRepresentationArchiveKeyFont");
  [(AVAnnotationTextRepresentation *)self backgroundColor];
  [v5 setObject:(id)FigCopyCGColorSRGBAsArray() forKey:@"AVAnnotationRepresentationArchiveKeyBackgroundColor"];
  [(AVAnnotationTextRepresentation *)self foregroundColor];
  [v5 setObject:(id)FigCopyCGColorSRGBAsArray() forKey:@"AVAnnotationRepresentationArchiveKeyForegroundColor"];
  uint64_t v6 = [(AVAnnotationTextRepresentation *)self link];
  if (v6) {
    [v5 setObject:v6 forKey:@"AVAnnotationRepresentationArchiveKeyLink"];
  }
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AVAnnotationTextRepresentation hasShadow](self, "hasShadow")), @"AVAnnotationRepresentationArchiveKeyHasShadow");
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AVAnnotationTextRepresentation hasUnderline](self, "hasUnderline")), @"AVAnnotationRepresentationArchiveKeyHasUnderline");
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AVAnnotationTextRepresentation writingMode](self, "writingMode")), @"AVAnnotationRepresentationArchiveKeyWritingMode");
  if (a3) {
    *a3 = (id)[MEMORY[0x1E4F1C9B8] data];
  }
  return v5;
}

- (id)description
{
  unint64_t v3 = NSString;
  NSUInteger v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, text = %@>", NSStringFromClass(v4), self, -[AVAnnotationTextRepresentation text](self, "text")];
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (NSString)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
}

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (void)setHasShadow:(BOOL)a3
{
  self->_hasShadow = a3;
}

- (BOOL)hasUnderline
{
  return self->_hasUnderline;
}

- (void)setHasUnderline:(BOOL)a3
{
  self->_hasUnderline = a3;
}

- (int64_t)writingMode
{
  return self->_writingMode;
}

- (void)setWritingMode:(int64_t)a3
{
  self->_writingMode = a3;
}

@end