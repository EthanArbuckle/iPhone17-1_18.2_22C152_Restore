@interface IDSKeyTransparencyVerificationState
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToKeyTransparencyVerificationState:(id)a3;
- (IDSKeyTransparencyVerificationState)initWithTransparencyStatus:(id)a3 transparencyBlob:(id)a4;
- (NSData)transparencyBlob;
- (NSNumber)transparencyStatus;
- (id)description;
- (unint64_t)hash;
@end

@implementation IDSKeyTransparencyVerificationState

- (IDSKeyTransparencyVerificationState)initWithTransparencyStatus:(id)a3 transparencyBlob:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IDSKeyTransparencyVerificationState;
  v9 = [(IDSKeyTransparencyVerificationState *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transparencyStatus, a3);
    v11 = (NSData *)[v8 copy];
    transparencyBlob = v10->_transparencyBlob;
    v10->_transparencyBlob = v11;
  }
  return v10;
}

- (BOOL)isEqualToKeyTransparencyVerificationState:(id)a3
{
  v6 = (IDSKeyTransparencyVerificationState *)a3;
  id v7 = v6;
  if (self == v6)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    if (v6)
    {
      id v8 = [(IDSKeyTransparencyVerificationState *)self transparencyStatus];
      v9 = [(IDSKeyTransparencyVerificationState *)v7 transparencyStatus];
      if (v8 == v9
        || ([(IDSKeyTransparencyVerificationState *)self transparencyStatus],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(IDSKeyTransparencyVerificationState *)v7 transparencyStatus],
            v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        v11 = [(IDSKeyTransparencyVerificationState *)self transparencyBlob];
        v12 = [(IDSKeyTransparencyVerificationState *)v7 transparencyBlob];
        if (v11 == v12)
        {
          unsigned __int8 v10 = 1;
        }
        else
        {
          v13 = [(IDSKeyTransparencyVerificationState *)self transparencyBlob];
          objc_super v14 = [(IDSKeyTransparencyVerificationState *)v7 transparencyBlob];
          unsigned __int8 v10 = [v13 isEqual:v14];
        }
        if (v8 == v9) {
          goto LABEL_13;
        }
      }
      else
      {
        unsigned __int8 v10 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    unsigned __int8 v10 = 0;
  }
LABEL_14:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(IDSKeyTransparencyVerificationState *)self isEqualToKeyTransparencyVerificationState:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v3 = [(IDSKeyTransparencyVerificationState *)self transparencyStatus];
  unint64_t v4 = (unint64_t)[v3 hash];
  BOOL v5 = [(IDSKeyTransparencyVerificationState *)self transparencyBlob];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = [(IDSKeyTransparencyVerificationState *)self transparencyStatus];
  BOOL v5 = [(IDSKeyTransparencyVerificationState *)self transparencyBlob];
  unint64_t v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p transparencyStatus: %@, transparencyBlob.length: %lu>", v3, self, v4, [v5 length]);

  return v6;
}

- (NSNumber)transparencyStatus
{
  return self->_transparencyStatus;
}

- (NSData)transparencyBlob
{
  return self->_transparencyBlob;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparencyBlob, 0);

  objc_storeStrong((id *)&self->_transparencyStatus, 0);
}

@end