@interface HMHTMLDocument
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)validateAndReturnError:(id *)a3;
- (HMHTMLDocument)initWithCoder:(id)a3;
- (HMHTMLDocument)initWithData:(id)a3 error:(id *)a4;
- (HMHTMLDocument)initWithString:(id)a3;
- (HMHTMLDocument)initWithURL:(id)a3 error:(id *)a4;
- (NSAttributedString)attributedString;
- (NSString)stringValue;
- (_HMDocument)document;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMHTMLDocument

- (void).cxx_destruct
{
}

- (_HMDocument)document
{
  return (_HMDocument *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMHTMLDocument *)self stringValue];
  [v4 encodeObject:v5 forKey:@"HM.stringValue"];
}

- (HMHTMLDocument)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.stringValue"];

  v6 = [(HMHTMLDocument *)self initWithString:v5];
  return v6;
}

- (BOOL)validateAndReturnError:(id *)a3
{
  id v5 = [(HMHTMLDocument *)self stringValue];
  uint64_t v6 = [v5 rangeOfString:@"<!DOCTYPE" options:1];

  v7 = [(HMHTMLDocument *)self stringValue];
  v8 = v7;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v10 = 1;
    uint64_t v11 = [v7 rangeOfString:@"<!DOCTYPE html" options:1];

    if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
      return v10;
    }
    if (a3)
    {
      v12 = (void *)MEMORY[0x1E4F28C58];
      v13 = @"Invalid value type.";
      v14 = @"Invalid Doctype.";
      uint64_t v15 = 43;
LABEL_9:
      [v12 hmErrorWithCode:v15 description:v13 reason:v14 suggestion:0];
      BOOL v10 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v10;
    }
    return 0;
  }
  char v9 = [v7 containsString:@"<html>"];

  if ((v9 & 1) == 0)
  {
    if (a3)
    {
      v12 = (void *)MEMORY[0x1E4F28C58];
      v13 = @"Not found.";
      v14 = @"Failed to find valid html tag.";
      uint64_t v15 = 2;
      goto LABEL_9;
    }
    return 0;
  }
  return 1;
}

- (NSAttributedString)attributedString
{
  v28[2] = *MEMORY[0x1E4F143B8];
  if (UIKitLibraryCore_42511())
  {
    v3 = [(HMHTMLDocument *)self stringValue];
    uint64_t v4 = [v3 fastestEncoding];

    id v5 = [(HMHTMLDocument *)self stringValue];
    uint64_t v6 = [v5 dataUsingEncoding:v4];

    id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    v8 = (id *)getNSDocumentTypeDocumentAttributeSymbolLoc_ptr_42513;
    uint64_t v25 = getNSDocumentTypeDocumentAttributeSymbolLoc_ptr_42513;
    if (!getNSDocumentTypeDocumentAttributeSymbolLoc_ptr_42513)
    {
      char v9 = (void *)UIKitLibrary_42515();
      v23[3] = (uint64_t)dlsym(v9, "NSDocumentTypeDocumentAttribute");
      getNSDocumentTypeDocumentAttributeSymbolLoc_ptr_42513 = v23[3];
      v8 = (id *)v23[3];
    }
    _Block_object_dispose(&v22, 8);
    if (!v8) {
      goto LABEL_16;
    }
    id v10 = *v8;
    id v26 = v10;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v11 = (id *)getNSHTMLTextDocumentTypeSymbolLoc_ptr;
    uint64_t v25 = getNSHTMLTextDocumentTypeSymbolLoc_ptr;
    if (!getNSHTMLTextDocumentTypeSymbolLoc_ptr)
    {
      v12 = (void *)UIKitLibrary_42515();
      v23[3] = (uint64_t)dlsym(v12, "NSHTMLTextDocumentType");
      getNSHTMLTextDocumentTypeSymbolLoc_ptr = v23[3];
      uint64_t v11 = (id *)v23[3];
    }
    _Block_object_dispose(&v22, 8);
    if (!v11) {
      goto LABEL_16;
    }
    id v13 = *v11;
    v28[0] = v13;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    v14 = (id *)getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr_42519;
    uint64_t v25 = getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr_42519;
    if (!getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr_42519)
    {
      uint64_t v15 = (void *)UIKitLibrary_42515();
      v23[3] = (uint64_t)dlsym(v15, "NSCharacterEncodingDocumentAttribute");
      getNSCharacterEncodingDocumentAttributeSymbolLoc_ptr_42519 = v23[3];
      v14 = (id *)v23[3];
    }
    _Block_object_dispose(&v22, 8);
    if (!v14)
    {
LABEL_16:
      dlerror();
      abort_report_np();
      __break(1u);
    }
    id v27 = *v14;
    v16 = NSNumber;
    id v17 = v27;
    v18 = [v16 numberWithUnsignedInteger:v4];
    v28[1] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v26 count:2];
    v20 = (void *)[v7 initWithData:v6 options:v19 documentAttributes:0 error:0];
  }
  else
  {
    v20 = 0;
  }

  return (NSAttributedString *)v20;
}

- (NSString)stringValue
{
  v2 = [(HMHTMLDocument *)self document];
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMHTMLDocument *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    uint64_t v6 = v5;
    if (v6)
    {
      id v7 = [(HMHTMLDocument *)self document];
      v8 = [(HMHTMLDocument *)v6 document];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(HMHTMLDocument *)self stringValue];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (HMHTMLDocument)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMHTMLDocument;
  id v7 = [(HMHTMLDocument *)&v12 init];
  if (v7
    && (v8 = [[_HMDocument alloc] initWithURL:v6 error:a4],
        document = v7->_document,
        v7->_document = v8,
        document,
        !v7->_document))
  {
    id v10 = 0;
  }
  else
  {
    id v10 = v7;
  }

  return v10;
}

- (HMHTMLDocument)initWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMHTMLDocument;
  id v7 = [(HMHTMLDocument *)&v12 init];
  if (v7
    && (v8 = [[_HMDocument alloc] initWithData:v6 error:a4],
        document = v7->_document,
        v7->_document = v8,
        document,
        !v7->_document))
  {
    id v10 = 0;
  }
  else
  {
    id v10 = v7;
  }

  return v10;
}

- (HMHTMLDocument)initWithString:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMHTMLDocument;
  id v5 = [(HMHTMLDocument *)&v10 init];
  if (v5
    && (id v6 = [[_HMDocument alloc] initWithString:v4],
        document = v5->_document,
        v5->_document = v6,
        document,
        !v5->_document))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end