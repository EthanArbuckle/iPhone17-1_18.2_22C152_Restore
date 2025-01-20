@interface ASFAsn1Token
+ (ASFAsn1OSToken)readTokenFromBuffer:(int)a3 opaque:(void *)a4 length:;
+ (id)readTokenFromBuffer:(void *)a3 length:;
- (id)description;
@end

@implementation ASFAsn1Token

+ (ASFAsn1OSToken)readTokenFromBuffer:(int)a3 opaque:(void *)a4 length:
{
  id v5 = a2;
  self;
  unsigned __int8 v47 = 0;
  uint64_t v46 = 0;
  id v6 = v5;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  v48.receiver = (id)MEMORY[0x263EF8330];
  v48.super_class = (Class)3221225472;
  v49 = __readIdentifier_block_invoke;
  v50 = &unk_26431C8E8;
  v51 = &v54;
  v52 = &v47;
  v53 = &v46;
  [v6 enumerateByteRangesUsingBlock:&v48];
  unint64_t v7 = v55[3];
  _Block_object_dispose(&v54, 8);

  uint64_t v8 = v46;
  uint64_t v9 = [v6 length];
  v10 = objc_msgSend(v6, "subdataWithRange:", v8, v9 - v46);

  id v11 = v10;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  v48.receiver = (id)MEMORY[0x263EF8330];
  v48.super_class = (Class)3221225472;
  v49 = __readLength_block_invoke;
  v50 = &unk_26431C910;
  v51 = &v54;
  v52 = &v46;
  [v11 enumerateByteRangesUsingBlock:&v48];
  unint64_t v12 = v55[3];
  _Block_object_dispose(&v54, 8);

  uint64_t v13 = [v11 length];
  uint64_t v14 = v46;
  if (v12 >= v13 - v46) {
    unint64_t v15 = v13 - v46;
  }
  else {
    unint64_t v15 = v12;
  }
  v16 = objc_msgSend(v11, "subdataWithRange:", v46, v15);

  if (a4) {
    *a4 = v14 + v8 + v15;
  }
  if (v47) {
    goto LABEL_7;
  }
  if (v7 == 2)
  {
    v24 = [ASFAsn1IntegerToken alloc];
    int v30 = v47;
    id v26 = v16;
    if (v24)
    {
      v48.receiver = v24;
      v48.super_class = (Class)ASFAsn1IntegerToken;
      v31 = (ASFAsn1IntegerToken *)objc_msgSendSuper2(&v48, sel_init);
      v24 = v31;
      if (!v30)
      {
        if (v31)
        {
          v31->super.mClass = 0;
          v31->super.mIdentifier = 2;
          unint64_t v36 = [v26 length];
          if (v36 >= 8) {
            uint64_t v37 = 8;
          }
          else {
            uint64_t v37 = v36;
          }
          uint64_t v38 = objc_msgSend(v26, "subdataWithRange:", 0, v37);
          mData = v24->super.mData;
          v24->super.mData = (NSData *)v38;

          v24->mValue = 0;
          -[NSData getBytes:length:](v24->super.mData, "getBytes:length:");
          v24->mValue = bswap64(v24->mValue) >> (-8 * v37);
        }
        goto LABEL_29;
      }
    }
LABEL_20:
    v21 = 0;
LABEL_30:

    goto LABEL_38;
  }
  if (v7 != 4)
  {
    if (v7 != 17)
    {
LABEL_7:
      v17 = [ASFAsn1Token alloc];
      unsigned __int8 v18 = v47;
      id v19 = v16;
      if (v17)
      {
        v48.receiver = v17;
        v48.super_class = (Class)ASFAsn1Token;
        v20 = (ASFAsn1OSToken *)objc_msgSendSuper2(&v48, sel_init);
        v21 = v20;
        if (v20)
        {
          v20->super.mClass = v18;
          v20->super.mIdentifier = v7;
          uint64_t v22 = [v19 copy];
          v23 = v21->super.mData;
          v21->super.mData = (NSData *)v22;
        }
      }
      else
      {
        v21 = 0;
      }

      goto LABEL_38;
    }
    v24 = [ASFAsn1SetToken alloc];
    int v25 = v47;
    id v26 = v16;
    if (v24)
    {
      v48.receiver = v24;
      v48.super_class = (Class)ASFAsn1SetToken;
      v27 = (ASFAsn1IntegerToken *)objc_msgSendSuper2(&v48, sel_init);
      v24 = v27;
      if (!v25)
      {
        if (v27)
        {
          v27->super.mClass = 0;
          v27->super.mIdentifier = 17;
          uint64_t v28 = [v26 copy];
          v29 = v24->super.mData;
          v24->super.mData = (NSData *)v28;

          objc_storeStrong((id *)&v24->mValue, v24->super.mData);
        }
LABEL_29:
        v24 = v24;
        v21 = (ASFAsn1OSToken *)v24;
        goto LABEL_30;
      }
    }
    goto LABEL_20;
  }
  v21 = [ASFAsn1OSToken alloc];
  int v32 = v47;
  id v33 = v16;
  if (v21)
  {
    v48.receiver = v21;
    v48.super_class = (Class)ASFAsn1OSToken;
    v34 = (ASFAsn1OSToken *)objc_msgSendSuper2(&v48, sel_init);
    v35 = v34;
    if (v32)
    {
      v21 = 0;
    }
    else
    {
      if (v34)
      {
        v34->super.mClass = 0;
        v34->super.mIdentifier = 4;
        uint64_t v40 = [v33 copy];
        v41 = v35->super.mData;
        v35->super.mData = (NSData *)v40;

        if (a3)
        {
          mValue = v35->mValue;
          v35->mValue = 0;
        }
        else
        {
          uint64_t v43 = +[ASFAsn1Token readTokenFromBuffer:length:](ASFAsn1Token, v35->super.mData, 0);
          mValue = v35->mValue;
          v35->mValue = (ASFAsn1Token *)v43;
        }
      }
      v35 = v35;
      v21 = v35;
    }
  }
  else
  {
    v35 = 0;
  }

LABEL_38:
  return v21;
}

+ (id)readTokenFromBuffer:(void *)a3 length:
{
  id v4 = a2;
  self;
  id v5 = +[ASFAsn1Token readTokenFromBuffer:opaque:length:]((uint64_t)ASFAsn1Token, v4, 0, a3);

  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Token of class:%d ID:%ld length:%ld data:%@", self->mClass, self->mIdentifier, -[NSData length](self->mData, "length"), self->mData];
}

- (void).cxx_destruct
{
}

@end