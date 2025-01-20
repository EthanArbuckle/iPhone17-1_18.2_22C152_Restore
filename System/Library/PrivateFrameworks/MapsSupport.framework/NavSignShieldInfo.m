@interface NavSignShieldInfo
+ (id)shieldWithID:(int)a3 stringID:(id)a4 text:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)shieldStringID;
- (NSString)shieldText;
- (NavSignShieldInfo)initWithShieldID:(int)a3 shieldStringID:(id)a4 shieldText:(id)a5;
- (id)_car_shieldImageWithSize:(int64_t)a3 scale:(double)a4 displayedInDashboard:(BOOL)a5 nightMode:(BOOL)a6;
- (id)description;
- (id)shieldImageWithSize:(int64_t)a3 scale:(double)a4 idiom:(int64_t)a5;
- (int)shieldID;
- (unint64_t)hash;
@end

@implementation NavSignShieldInfo

- (NavSignShieldInfo)initWithShieldID:(int)a3 shieldStringID:(id)a4 shieldText:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3 || v8)
  {
    v18.receiver = self;
    v18.super_class = (Class)NavSignShieldInfo;
    v11 = [(NavSignShieldInfo *)&v18 init];
    v12 = v11;
    if (v11)
    {
      v11->_shieldID = a3;
      v13 = (NSString *)[v8 copy];
      shieldStringID = v12->_shieldStringID;
      v12->_shieldStringID = v13;

      v15 = (NSString *)[v9 copy];
      shieldText = v12->_shieldText;
      v12->_shieldText = v15;
    }
    self = v12;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unsigned int v6 = [v5 shieldID];
      if (v6 == [(NavSignShieldInfo *)self shieldID])
      {
        v7 = [(NavSignShieldInfo *)self shieldStringID];
        id v8 = [v7 length];
        id v9 = [v5 shieldStringID];
        v10 = v9;
        if (v8)
        {
          v11 = [(NavSignShieldInfo *)self shieldStringID];
          unsigned int v12 = [v10 isEqualToString:v11];

          if (v12)
          {
LABEL_6:
            v13 = [(NavSignShieldInfo *)self shieldText];
            id v14 = [v13 length];
            v15 = [v5 shieldText];
            v16 = v15;
            if (v14)
            {
              v17 = [(NavSignShieldInfo *)self shieldText];
              unsigned __int8 v18 = [v16 isEqualToString:v17];
            }
            else
            {
              unsigned __int8 v18 = [v15 length] == 0;
            }

            goto LABEL_13;
          }
        }
        else
        {
          id v19 = [v9 length];

          if (!v19) {
            goto LABEL_6;
          }
        }
      }
      unsigned __int8 v18 = 0;
LABEL_13:

      goto LABEL_14;
    }
  }
  unsigned __int8 v18 = 0;
LABEL_14:

  return v18;
}

- (id)description
{
  uint64_t v3 = [(NavSignShieldInfo *)self shieldID];
  id v4 = [(NavSignShieldInfo *)self shieldStringID];
  id v5 = [(NavSignShieldInfo *)self shieldText];
  unsigned int v6 = +[NSString stringWithFormat:@"shieldID: [%d] strID: [%@] text: [%@]", v3, v4, v5];

  return v6;
}

- (unint64_t)hash
{
  int v3 = [(NavSignShieldInfo *)self shieldID];
  unsigned int v4 = [(NavSignShieldInfo *)self shieldID];
  if (v3 >= 0) {
    int v5 = v4;
  }
  else {
    int v5 = -v4;
  }
  uint64_t v6 = v5;
  v7 = [(NavSignShieldInfo *)self shieldStringID];
  unint64_t v8 = (unint64_t)[v7 hash];
  id v9 = [(NavSignShieldInfo *)self shieldText];
  unint64_t v10 = v8 ^ (unint64_t)[v9 hash] ^ v6;

  return v10;
}

- (id)_car_shieldImageWithSize:(int64_t)a3 scale:(double)a4 displayedInDashboard:(BOOL)a5 nightMode:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  if ([(NavSignShieldInfo *)self shieldID])
  {
    id v11 = objc_alloc_init((Class)VKIconModifiers);
    unsigned int v12 = [(NavSignShieldInfo *)self shieldText];
    [v11 setText:v12];

    [v11 setNavMode:1];
    if (v6)
    {
      v13 = +[VKIconManager sharedManager];
      objc_msgSend(v11, "setVariant:", objc_msgSend(v13, "darkVariant"));
    }
    unsigned int v14 = [(NavSignShieldInfo *)self shieldID];
    if (v7) {
      int v15 = 6;
    }
    else {
      int v15 = 7;
    }
    unsigned int v16 = v15 | 0x4BAF0;
    if (v14 == 310000) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = v14;
    }
    unsigned __int8 v18 = +[VKIconManager sharedManager];
    id v19 = [(NavSignShieldInfo *)self shieldText];
    *(float *)&double v20 = a4;
    v21 = [v18 imageForDataID:v17 text:v19 contentScale:a3 sizeGroup:v11 modifiers:v20];
  }
  else
  {
    v21 = [(NavSignShieldInfo *)self shieldImageWithSize:a3 scale:1 idiom:a4];
  }

  return v21;
}

- (id)shieldImageWithSize:(int64_t)a3 scale:(double)a4 idiom:(int64_t)a5
{
  if ([(NavSignShieldInfo *)self shieldID]
    || ([(NavSignShieldInfo *)self shieldStringID],
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    id v9 = objc_alloc_init((Class)VKIconModifiers);
    unint64_t v10 = [(NavSignShieldInfo *)self shieldText];
    [v9 setText:v10];

    unsigned int v11 = [(NavSignShieldInfo *)self shieldID];
    unsigned int v12 = +[VKIconManager sharedManager];
    if (v11)
    {
      uint64_t v13 = [(NavSignShieldInfo *)self shieldID];
      unsigned int v14 = [(NavSignShieldInfo *)self shieldText];
      *(float *)&double v15 = a4;
      [v12 imageForDataID:v13 text:v14 contentScale:a3 sizeGroup:v9 modifiers:v15];
    }
    else
    {
      unsigned int v14 = [(NavSignShieldInfo *)self shieldStringID];
      *(float *)&double v16 = a4;
      [v12 imageForName:v14 contentScale:a3 sizeGroup:v9 modifiers:v16];
    uint64_t v17 = };
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

+ (id)shieldWithID:(int)a3 stringID:(id)a4 text:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [objc_alloc((Class)a1) initWithShieldID:v6 shieldStringID:v9 shieldText:v8];

  return v10;
}

- (int)shieldID
{
  return self->_shieldID;
}

- (NSString)shieldStringID
{
  return self->_shieldStringID;
}

- (NSString)shieldText
{
  return self->_shieldText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shieldText, 0);

  objc_storeStrong((id *)&self->_shieldStringID, 0);
}

@end