@interface ASFAsn1ReceiptIAPToken
+ (id)readFromBuffer:(uint64_t)a1;
- (id)_initWithType:(void *)a3 typeVersion:(void *)a4 contentToken:;
- (id)description;
- (uint64_t)integerValue;
- (void)stringValue;
@end

@implementation ASFAsn1ReceiptIAPToken

- (id)_initWithType:(void *)a3 typeVersion:(void *)a4 contentToken:
{
  id v8 = a4;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)ASFAsn1ReceiptIAPToken;
    v9 = (id *)objc_msgSendSuper2(&v11, sel_init);
    a1 = v9;
    if (v9)
    {
      v9[1] = a2;
      v9[2] = a3;
      objc_storeStrong(v9 + 3, a4);
    }
  }

  return a1;
}

+ (id)readFromBuffer:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v16 = 0;
  +[ASFAsn1Token readTokenFromBuffer:length:]((uint64_t)ASFAsn1Token, v2, &v16);
  v3 = (void **)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = v16;
  uint64_t v5 = [v2 length];
  v6 = objc_msgSend(v2, "subdataWithRange:", v4, v5 - v16);

  v7 = +[ASFAsn1Token readTokenFromBuffer:length:]((uint64_t)ASFAsn1Token, v6, &v16);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    id v2 = v6;
    goto LABEL_13;
  }
  uint64_t v8 = v16;
  uint64_t v9 = [v6 length];
  objc_msgSend(v6, "subdataWithRange:", v8, v9 - v16);
  id v2 = (id)objc_claimAutoreleasedReturnValue();

  if (!v3 || (char *)v3[4] - 1701 > (char *)5)
  {
LABEL_11:
    v12 = 0;
    goto LABEL_13;
  }
  uint64_t v10 = +[ASFAsn1Token readTokenFromBuffer:length:]((uint64_t)ASFAsn1Token, v2, &v16);
  objc_super v11 = (void *)v10;
  if (v10 && *(void *)(v10 + 16) == 4 && !*(unsigned char *)(v10 + 8))
  {
    v14 = [ASFAsn1ReceiptIAPToken alloc];
    if (v7) {
      v15 = (void *)v7[4];
    }
    else {
      v15 = 0;
    }
    v12 = -[ASFAsn1ReceiptIAPToken _initWithType:typeVersion:contentToken:]((id *)&v14->super.isa, v3[4], v15, v11);
  }
  else
  {
    v12 = 0;
  }

LABEL_13:
  return v12;
}

- (id)description
{
  id v2 = NSString;
  unint64_t mType = self->mType;
  unint64_t mTypeVersion = self->mTypeVersion;
  mContentToken = self->mContentToken;
  if (mContentToken) {
    mContentToken = objc_getProperty(mContentToken, a2, 24, 1);
  }
  id v6 = mContentToken;
  v7 = [v2 stringWithFormat:@"Type:%ld Version:%ld Data:%@", mType, mTypeVersion, v6];

  return v7;
}

- (void)stringValue
{
  if (a1)
  {
    id v2 = a1;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[ASFAsn1OSToken stringValue](v2[3]);
      a1 = (void **)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)integerValue
{
  uint64_t v1 = a1;
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v3 = *(void **)(v1 + 24);
      if (v3)
      {
        uint64_t v4 = objc_getProperty(v3, v2, 32, 1);
        if (v4 && !*((unsigned char *)v4 + 8) && v4[2] == 2)
        {
          uint64_t v1 = v4[4];
LABEL_11:

          return v1;
        }
      }
      else
      {
        uint64_t v4 = 0;
      }
      uint64_t v1 = 0xFFFFLL;
      goto LABEL_11;
    }
    return 0xFFFFLL;
  }
  return v1;
}

- (void).cxx_destruct
{
}

@end