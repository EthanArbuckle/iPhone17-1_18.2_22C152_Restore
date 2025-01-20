@interface AVAnnotationPathRepresentation
- (AVAnnotationPathRepresentation)initWithPaths:(id)a3;
- (BOOL)dashed;
- (BOOL)hasShadow;
- (BOOL)isEqual:(id)a3;
- (CGColor)strokeColor;
- (NSArray)paths;
- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4;
- (id)_propertyListAndBinaryData:(id *)a3;
- (id)description;
- (int64_t)strokeWidth;
- (unint64_t)hash;
- (void)dealloc;
- (void)setDashed:(BOOL)a3;
- (void)setHasShadow:(BOOL)a3;
- (void)setPaths:(id)a3;
- (void)setStrokeColor:(CGColor *)a3;
- (void)setStrokeWidth:(int64_t)a3;
@end

@implementation AVAnnotationPathRepresentation

- (AVAnnotationPathRepresentation)initWithPaths:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)AVAnnotationPathRepresentation;
  v4 = [(AVAnnotationRepresentation *)&v27 _initWithRepresentationType:@"AVAnnotationRepresentationTypePath"];
  v5 = v4;
  if (v4)
  {
    v18 = v4;
    v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v7 = [a3 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(a3);
          }
          v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v28 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v20;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v20 != v15) {
                  objc_enumerationMutation(v11);
                }
                objc_msgSend(v12, "addObject:", (id)objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * j), "copy"));
              }
              uint64_t v14 = [v11 countByEnumeratingWithState:&v19 objects:v28 count:16];
            }
            while (v14);
          }
          [v6 addObject:v12];
        }
        uint64_t v8 = [a3 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v8);
    }
    v5 = v18;
    v18->_paths = (NSArray *)[v6 copy];
    v18->_strokeColor = (CGColor *)FigCreateCGColorSRGBFromArray();
    v18->_strokeWidth = 1;
    v18->_dashed = 0;
    v18->_hasShadow = 0;
  }
  return v5;
}

- (id)_initWithPropertyList:(id)a3 binaryData:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)AVAnnotationPathRepresentation;
  long long v24 = [(AVAnnotationRepresentation *)&v37 _initWithPropertyList:a3 binaryData:a4];
  if (v24)
  {
    v4 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyPaths"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v40 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v34;
LABEL_5:
        uint64_t v8 = 0;
        while (1)
        {
          if (*(void *)v34 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v33 + 1) + 8 * v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v39 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v30;
LABEL_11:
            uint64_t v13 = 0;
            while (1)
            {
              if (*(void *)v30 != v12) {
                objc_enumerationMutation(v9);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_33;
              }
              if (v11 == ++v13)
              {
                uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v39 count:16];
                if (v11) {
                  goto LABEL_11;
                }
                break;
              }
            }
          }
          if (++v8 == v6)
          {
            uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v40 count:16];
            if (v6) {
              goto LABEL_5;
            }
            goto LABEL_19;
          }
        }
      }
      else
      {
LABEL_19:
        v24[4] = [v4 copy];
        uint64_t v14 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyStrokeColor"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v14 count] == 4)
        {
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v38 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v26;
LABEL_23:
            uint64_t v18 = 0;
            while (1)
            {
              if (*(void *)v26 != v17) {
                objc_enumerationMutation(v14);
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              if (v16 == ++v18)
              {
                uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v38 count:16];
                if (v16) {
                  goto LABEL_23;
                }
                goto LABEL_29;
              }
            }
          }
          else
          {
LABEL_29:
            v24[5] = FigCreateCGColorSRGBFromArray();
            long long v19 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyStrokeWidth"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v24[6] = [v19 integerValue];
              long long v20 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyDashed"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                *((unsigned char *)v24 + 56) = [v20 BOOLValue];
                long long v21 = (void *)[a3 objectForKey:@"AVAnnotationRepresentationArchiveKeyHasShadow"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  *((unsigned char *)v24 + 57) = [v21 BOOLValue];
                  return v24;
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_33:

  return 0;
}

- (void)dealloc
{
  CGColorRelease(self->_strokeColor);
  v3.receiver = self;
  v3.super_class = (Class)AVAnnotationPathRepresentation;
  [(AVAnnotationRepresentation *)&v3 dealloc];
}

- (CGColor)strokeColor
{
  v2 = self->_strokeColor;
  return v2;
}

- (void)setStrokeColor:(CGColor *)a3
{
  v4 = CGColorRetain(a3);
  CGColorRelease(self->_strokeColor);
  self->_strokeColor = v4;
}

- (BOOL)isEqual:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AVAnnotationPathRepresentation;
  BOOL v5 = -[AVAnnotationRepresentation isEqual:](&v10, sel_isEqual_);
  if (a3 != self)
  {
    if (a3
      && (objc_opt_class(), (objc_opt_isKindOfClass() & v5) == 1)
      && -[NSArray isEqualToArray:](-[AVAnnotationPathRepresentation paths](self, "paths"), "isEqualToArray:", [a3 paths])&& CGColorEqualToColor(-[AVAnnotationPathRepresentation strokeColor](self, "strokeColor"), (CGColorRef)objc_msgSend(a3, "strokeColor"))&& (v6 = -[AVAnnotationPathRepresentation strokeWidth](self, "strokeWidth"), v6 == objc_msgSend(a3, "strokeWidth"))&& (int v7 = -[AVAnnotationPathRepresentation dashed](self, "dashed"), v7 == objc_msgSend(a3, "dashed")))
    {
      BOOL v9 = [(AVAnnotationPathRepresentation *)self hasShadow];
      return v9 ^ [a3 hasShadow] ^ 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)AVAnnotationPathRepresentation;
  unint64_t v3 = [(AVAnnotationRepresentation *)&v9 hash];
  uint64_t v4 = [(NSArray *)[(AVAnnotationPathRepresentation *)self paths] hash];
  [(AVAnnotationPathRepresentation *)self strokeColor];
  uint64_t v5 = v4 ^ [(id)FigCopyCGColorSRGBAsArray() hash] ^ v3;
  uint64_t v6 = v5 ^ objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AVAnnotationPathRepresentation strokeWidth](self, "strokeWidth")), "hash");
  uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AVAnnotationPathRepresentation dashed](self, "dashed")), "hash");
  return v6 ^ v7 ^ objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AVAnnotationPathRepresentation hasShadow](self, "hasShadow")), "hash");
}

- (id)_propertyListAndBinaryData:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVAnnotationPathRepresentation;
  id v5 = -[AVAnnotationRepresentation _propertyListAndBinaryData:](&v7, sel__propertyListAndBinaryData_);
  objc_msgSend(v5, "setObject:forKey:", -[AVAnnotationPathRepresentation paths](self, "paths"), @"AVAnnotationRepresentationArchiveKeyPaths");
  [(AVAnnotationPathRepresentation *)self strokeColor];
  [v5 setObject:(id)FigCopyCGColorSRGBAsArray() forKey:@"AVAnnotationRepresentationArchiveKeyStrokeColor"];
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AVAnnotationPathRepresentation strokeWidth](self, "strokeWidth")), @"AVAnnotationRepresentationArchiveKeyStrokeWidth");
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AVAnnotationPathRepresentation dashed](self, "dashed")), @"AVAnnotationRepresentationArchiveKeyDashed");
  objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AVAnnotationPathRepresentation hasShadow](self, "hasShadow")), @"AVAnnotationRepresentationArchiveKeyHasShadow");
  if (a3) {
    *a3 = (id)[MEMORY[0x1E4F1C9B8] data];
  }
  return v5;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p>", NSStringFromClass(v4), self];
}

- (NSArray)paths
{
  return self->_paths;
}

- (void)setPaths:(id)a3
{
}

- (int64_t)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(int64_t)a3
{
  self->_strokeWidth = a3;
}

- (BOOL)dashed
{
  return self->_dashed;
}

- (void)setDashed:(BOOL)a3
{
  self->_dashed = a3;
}

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (void)setHasShadow:(BOOL)a3
{
  self->_hasShadow = a3;
}

@end