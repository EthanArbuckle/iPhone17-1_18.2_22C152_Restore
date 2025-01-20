@interface _DPPrivateAccessTokenChallenge
- (NSData)redemptionContext;
- (NSString)issuer;
- (NSString)origin;
- (_DPPrivateAccessTokenChallenge)initWithIssuer:(id)a3 origin:(id)a4 redemptionContext:(id)a5;
- (id)synthesizeWithTokenType:(unsigned __int16)a3;
@end

@implementation _DPPrivateAccessTokenChallenge

- (_DPPrivateAccessTokenChallenge)initWithIssuer:(id)a3 origin:(id)a4 redemptionContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_DPPrivateAccessTokenChallenge;
  v11 = [(_DPPrivateAccessTokenChallenge *)&v17 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    issuer = v11->_issuer;
    v11->_issuer = v12;

    v14 = (NSString *)[v9 copy];
    origin = v11->_origin;
    v11->_origin = v14;

    objc_storeStrong((id *)&v11->_redemptionContext, a5);
  }

  return v11;
}

- (id)synthesizeWithTokenType:(unsigned __int16)a3
{
  if ((a3 & 0xFFFE) == 2)
  {
    uint64_t v3 = a3;
    v5 = objc_alloc_init((Class)_DPBigEndianDataEncoder);
    [v5 writeUInt16:v3];
    v6 = [(_DPPrivateAccessTokenChallenge *)self issuer];
    v7 = [v6 dataUsingEncoding:4];

    if (![v7 length] || (unint64_t)objc_msgSend(v7, "length") >= 0x10000)
    {
      id v8 = +[_DPLog service];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100058B6C(v8, v9, v10, v11, v12, v13, v14, v15);
      }
      goto LABEL_20;
    }
    -[NSObject writeUInt16:](v5, "writeUInt16:", (unsigned __int16)[v7 length]);
    [v5 appendData:v7];
    objc_super v17 = [(_DPPrivateAccessTokenChallenge *)self redemptionContext];

    if (v17)
    {
      v18 = [(_DPPrivateAccessTokenChallenge *)self redemptionContext];
      id v19 = [v18 length];

      if (v19 != (id)32)
      {
        v30 = [(_DPPrivateAccessTokenChallenge *)self redemptionContext];
        id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Redemption context length, %lu, must be equal to 32.", [v30 length]);

        v22 = +[_DPLog service];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_100058718((uint64_t)v8, v22, v31, v32, v33, v34, v35, v36);
        }
LABEL_19:

LABEL_20:
        v16 = 0;
        goto LABEL_21;
      }
      [v5 writeUChar:32];
      v20 = [(_DPPrivateAccessTokenChallenge *)self redemptionContext];
      [v5 appendData:v20];
    }
    else
    {
      [v5 writeUChar:0];
    }
    v21 = [(_DPPrivateAccessTokenChallenge *)self origin];
    id v8 = [v21 dataUsingEncoding:4];

    if ((unint64_t)[v8 length] < 0x10000)
    {
      [v5 writeUInt16:(unsigned __int16)[v8 length]];
      [v5 appendData:v8];
      v16 = [v5 buffer];
LABEL_21:

      goto LABEL_22;
    }
    v22 = +[_DPLog service];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100058BE4(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_19;
  }
  v5 = +[_DPLog service];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100058C5C(v5);
  }
  v16 = 0;
LABEL_22:

  return v16;
}

- (NSString)issuer
{
  return self->_issuer;
}

- (NSString)origin
{
  return self->_origin;
}

- (NSData)redemptionContext
{
  return self->_redemptionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redemptionContext, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
}

@end