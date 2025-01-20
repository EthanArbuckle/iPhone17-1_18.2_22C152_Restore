@interface ASFAsn1ReceiptToken
+ (ASFAsn1ReceiptToken)readFromBuffer:(uint64_t)a1;
- (id)description;
- (uint64_t)contentIsAnInteger;
@end

@implementation ASFAsn1ReceiptToken

+ (ASFAsn1ReceiptToken)readFromBuffer:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v20 = 0;
  v3 = +[ASFAsn1Token readTokenFromBuffer:length:]((uint64_t)ASFAsn1Token, v2, &v20);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = v20;
  uint64_t v5 = [v2 length];
  v6 = objc_msgSend(v2, "subdataWithRange:", v4, v5 - v20);

  v7 = +[ASFAsn1Token readTokenFromBuffer:length:]((uint64_t)ASFAsn1Token, v6, &v20);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    id v2 = v6;
    goto LABEL_25;
  }
  uint64_t v8 = v20;
  uint64_t v9 = [v6 length];
  objc_msgSend(v6, "subdataWithRange:", v8, v9 - v20);
  id v2 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v10 = 0;
    unint64_t v11 = v3[4];
    if (v11 > 0x18) {
      goto LABEL_25;
    }
    if (((1 << v11) & 0x1E1FF1F) == 0)
    {
      if (((1 << v11) & 0x200E0) == 0) {
        goto LABEL_25;
      }
      uint64_t v14 = +[ASFAsn1Token readTokenFromBuffer:opaque:length:]((uint64_t)ASFAsn1Token, v2, 1, &v20);
      if (v14)
      {
        id v13 = (id)v14;
        v10 = [ASFAsn1ReceiptToken alloc];
        goto LABEL_17;
      }
LABEL_11:
      v10 = 0;
      goto LABEL_25;
    }
  }
  uint64_t v12 = +[ASFAsn1Token readTokenFromBuffer:length:]((uint64_t)ASFAsn1Token, v2, &v20);
  id v13 = (id)v12;
  if (v12 && *(void *)(v12 + 16) == 4 && !*(unsigned char *)(v12 + 8))
  {
    v10 = [ASFAsn1ReceiptToken alloc];
    if (!v3)
    {
      unint64_t v15 = 0;
      goto LABEL_18;
    }
LABEL_17:
    unint64_t v15 = v3[4];
LABEL_18:
    v16 = v13;
    if (v7) {
      unint64_t v17 = v7[4];
    }
    else {
      unint64_t v17 = 0;
    }
    id v13 = v13;
    if (v10)
    {
      v21.receiver = v10;
      v21.super_class = (Class)ASFAsn1ReceiptToken;
      v18 = (ASFAsn1ReceiptToken *)objc_msgSendSuper2(&v21, sel_init);
      v10 = v18;
      if (v18)
      {
        v18->mType = v15;
        v18->mTypeVersion = v17;
        objc_storeStrong((id *)&v18->mContentToken, v16);
      }
    }

    goto LABEL_24;
  }
  v10 = 0;
LABEL_24:

LABEL_25:
  return v10;
}

- (uint64_t)contentIsAnInteger
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
        if (v4 && !*((unsigned char *)v4 + 8))
        {
          uint64_t v1 = v4[2] == 2;
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v4 = 0;
      }
      uint64_t v1 = 0;
LABEL_9:

      return v1;
    }
    return 0;
  }
  return v1;
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

- (void).cxx_destruct
{
}

@end