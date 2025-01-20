@interface _HMDocument
- (BOOL)isEqual:(id)a3;
- (NSAttributedString)attributedString;
- (NSString)stringValue;
- (_HMDocument)initWithData:(id)a3 error:(id *)a4;
- (_HMDocument)initWithString:(id)a3;
- (_HMDocument)initWithURL:(id)a3 error:(id *)a4;
- (_HMDocument)initWithURL:(id)a3 fileManager:(id)a4 error:(id *)a5;
- (unint64_t)hash;
@end

@implementation _HMDocument

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);

  objc_storeStrong((id *)&self->_stringValue, 0);
}

- (NSAttributedString)attributedString
{
  return (NSAttributedString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_HMDocument *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    if (v6)
    {
      v7 = [(_HMDocument *)self stringValue];
      v8 = [(_HMDocument *)v6 stringValue];
      char v9 = [v7 isEqualToString:v8];
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
  v2 = [(_HMDocument *)self stringValue];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (_HMDocument)initWithURL:(id)a3 fileManager:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    goto LABEL_9;
  }
  char v16 = 0;
  v10 = [v8 path];
  char v11 = [v9 fileExistsAtPath:v10 isDirectory:&v16];

  if ((v11 & 1) == 0)
  {
    if (a5)
    {
      v12 = @" file does not exist.";
      goto LABEL_8;
    }
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  if (v16)
  {
    if (a5)
    {
      v12 = @"Invalid file type (directory).";
LABEL_8:
      *a5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Invalid parameter." reason:v12 suggestion:0];
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v15 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v8];
  if (v15)
  {
    self = [(_HMDocument *)self initWithData:v15 error:a5];
    v13 = self;
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] hmErrorWithCode:2 description:@"Not found." reason:@"The  data could not be read from the file." suggestion:0];
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

LABEL_10:
  return v13;
}

- (_HMDocument)initWithURL:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x1E4F28CB8];
  id v7 = a3;
  id v8 = [v6 defaultManager];
  id v9 = [(_HMDocument *)self initWithURL:v7 fileManager:v8 error:a4];

  return v9;
}

- (_HMDocument)initWithData:(id)a3 error:(id *)a4
{
  if (a3)
  {
    v6 = (objc_class *)NSString;
    id v7 = a3;
    id v8 = (void *)[[v6 alloc] initWithData:v7 encoding:4];

    if (v8)
    {
      self = [(_HMDocument *)self initWithString:v8];
      id v9 = self;
    }
    else if (a4)
    {
      [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:@"Invalid parameter." reason:@" data is not UTF8 encoded" suggestion:0];
      id v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (_HMDocument)initWithString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)_HMDocument;
    v5 = [(_HMDocument *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      stringValue = v5->_stringValue;
      v5->_stringValue = (NSString *)v6;
    }
    self = v5;
    id v8 = self;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

@end