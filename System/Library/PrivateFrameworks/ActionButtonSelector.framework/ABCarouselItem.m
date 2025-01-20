@interface ABCarouselItem
- (BOOL)isEqual:(id)a3;
- (id)initWithImage:(char)a3 canBeHighlighted:(void *)a4 identifier:;
@end

@implementation ABCarouselItem

- (id)initWithImage:(char)a3 canBeHighlighted:(void *)a4 identifier:
{
  id v8 = a2;
  id v9 = a4;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)ABCarouselItem;
    v10 = (id *)objc_msgSendSuper2(&v14, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 3, a2);
      *((unsigned char *)a1 + 8) = a3;
      uint64_t v11 = [v9 copy];
      id v12 = a1[2];
      a1[2] = (id)v11;
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    v6 = v5;
    if (self)
    {
      if (v5)
      {
        if (self->_canBeHighlighted != (*((unsigned char *)v5 + 8) != 0))
        {
LABEL_5:
          char v7 = 0;
LABEL_10:

          goto LABEL_11;
        }
        id v8 = self->_identifier;
        goto LABEL_8;
      }
      if (self->_canBeHighlighted) {
        goto LABEL_5;
      }
      id v8 = self->_identifier;
    }
    else
    {
      if (v5)
      {
        if (*((unsigned char *)v5 + 8)) {
          goto LABEL_5;
        }
        id v8 = 0;
LABEL_8:
        id v9 = (void *)v6[2];
LABEL_9:
        char v7 = ABEqualObjects(v8, v9);

        goto LABEL_10;
      }
      id v8 = 0;
    }
    id v9 = 0;
    goto LABEL_9;
  }
  char v7 = 0;
LABEL_11:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end