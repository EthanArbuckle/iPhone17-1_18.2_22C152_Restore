@interface MFPopupButtonItem
+ (id)itemWithTitle:(id)a3;
+ (id)itemWithTitle:(id)a3 popupTitle:(id)a4 subtitle:(id)a5 style:(int64_t)a6;
+ (id)itemWithTitle:(id)a3 style:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)popupTitle;
- (NSString)subtitle;
- (NSString)title;
- (id)copy;
- (int64_t)style;
- (void)setPopupTitle:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MFPopupButtonItem

+ (id)itemWithTitle:(id)a3
{
  v3 = [a1 itemWithTitle:a3 popupTitle:a3 subtitle:0 style:0];

  return v3;
}

+ (id)itemWithTitle:(id)a3 style:(int64_t)a4
{
  v4 = [a1 itemWithTitle:a3 popupTitle:a3 subtitle:0 style:a4];

  return v4;
}

+ (id)itemWithTitle:(id)a3 popupTitle:(id)a4 subtitle:(id)a5 style:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = objc_alloc_init(MFPopupButtonItem);
  v13 = (void *)[v9 copy];
  [(MFPopupButtonItem *)v12 setTitle:v13];

  v14 = (void *)[v10 copy];
  [(MFPopupButtonItem *)v12 setPopupTitle:v14];

  v15 = (void *)[v11 copy];
  [(MFPopupButtonItem *)v12 setSubtitle:v15];

  [(MFPopupButtonItem *)v12 setStyle:a6];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [(MFPopupButtonItem *)self title];
    v8 = [v6 title];
    if (![v7 isEqualToString:v8])
    {
      BOOL v13 = 0;
LABEL_14:

      goto LABEL_15;
    }
    id v9 = [(MFPopupButtonItem *)self popupTitle];
    id v10 = [v6 popupTitle];
    if (![v9 isEqualToString:v10])
    {
      BOOL v13 = 0;
LABEL_13:

      goto LABEL_14;
    }
    id v11 = [(MFPopupButtonItem *)self subtitle];
    v12 = [v6 subtitle];
    if (v11 == v12
      || ([(MFPopupButtonItem *)self subtitle],
          v16 = objc_claimAutoreleasedReturnValue(),
          [v6 subtitle],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v16 isEqualToString:v3]))
    {
      int64_t v14 = [(MFPopupButtonItem *)self style];
      BOOL v13 = v14 == [v6 style];
      if (v11 == v12)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      BOOL v13 = 0;
    }

    goto LABEL_12;
  }
  BOOL v13 = 0;
LABEL_15:

  return v13;
}

- (id)copy
{
  v3 = [(MFPopupButtonItem *)self title];
  v4 = [(MFPopupButtonItem *)self popupTitle];
  id v5 = [(MFPopupButtonItem *)self subtitle];
  id v6 = +[MFPopupButtonItem itemWithTitle:v3 popupTitle:v4 subtitle:v5 style:[(MFPopupButtonItem *)self style]];

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)popupTitle
{
  return self->_popupTitle;
}

- (void)setPopupTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_popupTitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end