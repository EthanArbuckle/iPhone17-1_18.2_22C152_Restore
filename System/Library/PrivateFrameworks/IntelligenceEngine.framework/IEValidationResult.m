@interface IEValidationResult
- (BOOL)isEqual:(id)a3;
- (NSString)code;
- (NSString)filename;
- (NSString)text;
- (NSString)type;
- (int)lineNumber;
- (unint64_t)hash;
- (void)setCode:(id)a3;
- (void)setFilename:(id)a3;
- (void)setLineNumber:(int)a3;
- (void)setText:(id)a3;
- (void)setType:(id)a3;
@end

@implementation IEValidationResult

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      v7 = [(IEValidationResult *)self type];
      v8 = [v6 type];
      if (v7 != v8)
      {
        BOOL v9 = 0;
LABEL_23:

        goto LABEL_24;
      }
      v23 = [(IEValidationResult *)self text];
      v10 = [v6 text];
      if (v23 != v10)
      {
        v21 = [(IEValidationResult *)self text];
        v19 = [v6 text];
        if (!objc_msgSend(v21, "isEqualToString:"))
        {
          BOOL v9 = 0;
          goto LABEL_21;
        }
      }
      uint64_t v22 = [(IEValidationResult *)self filename];
      v11 = [v6 filename];
      if ((void *)v22 != v11)
      {
        v20 = [(IEValidationResult *)self filename];
        v17 = [v6 filename];
        if (!objc_msgSend(v20, "isEqualToString:"))
        {
          BOOL v9 = 0;
          v12 = (void *)v22;
LABEL_19:

LABEL_20:
          if (v23 == v10)
          {
LABEL_22:

            goto LABEL_23;
          }
LABEL_21:

          goto LABEL_22;
        }
      }
      v13 = [(IEValidationResult *)self code];
      v14 = [v6 code];
      if (v13 == v14
        || ([(IEValidationResult *)self code],
            v18 = objc_claimAutoreleasedReturnValue(),
            [v6 code],
            v3 = objc_claimAutoreleasedReturnValue(),
            [v18 isEqualToString:v3]))
      {
        int v15 = [(IEValidationResult *)self lineNumber];
        BOOL v9 = v15 == [v6 lineNumber];
        if (v13 == v14)
        {

LABEL_18:
          v12 = (void *)v22;
          if ((void *)v22 == v11) {
            goto LABEL_20;
          }
          goto LABEL_19;
        }
      }
      else
      {
        BOOL v9 = 0;
      }

      goto LABEL_18;
    }
  }
  BOOL v9 = 0;
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  v3 = [(IEValidationResult *)self type];
  uint64_t v4 = [v3 hash];

  id v5 = [(IEValidationResult *)self text];
  uint64_t v6 = [v5 hash];

  v7 = [(IEValidationResult *)self filename];
  uint64_t v8 = [v7 hash];

  BOOL v9 = [(IEValidationResult *)self code];
  uint64_t v10 = [v9 hash];
  uint64_t v11 = v8 - (v6 - v4 + 32 * v4) + 32 * (v6 - v4 + 32 * v4);
  uint64_t v12 = 31 * (v10 - v11 + 32 * v11);

  return v12 + [(IEValidationResult *)self lineNumber] + 28629151;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (int)lineNumber
{
  return self->_lineNumber;
}

- (void)setLineNumber:(int)a3
{
  self->_lineNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_code, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end