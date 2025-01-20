@interface OBBoldSubtitleController
- (NSString)subtitleText;
- (OBBoldSubtitleController)initWithTitle:(id)a3 subtitle:(id)a4 detailText:(id)a5 icon:(id)a6;
- (id)_findLabelWithText:(id)a3 inView:(id)a4;
- (void)setSubtitleText:(id)a3;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation OBBoldSubtitleController

- (OBBoldSubtitleController)initWithTitle:(id)a3 subtitle:(id)a4 detailText:(id)a5 icon:(id)a6
{
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)OBBoldSubtitleController;
  v11 = [(OBBoldSubtitleController *)&v16 initWithTitle:a3 detailText:a5 icon:a6];
  v12 = v11;
  if (v11)
  {
    v13 = [(OBBoldSubtitleController *)v11 navigationItem];
    [v13 setHidesBackButton:1];

    [(OBBoldSubtitleController *)v12 setScrollingDisabled:0];
    if (v10)
    {
      [(OBBoldSubtitleController *)v12 setSubtitleText:v10];
      v14 = [(OBBoldSubtitleController *)v12 headerView];
      [v14 setSubtitleText:v10];
    }
  }

  return v12;
}

- (void)viewIsAppearing:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)OBBoldSubtitleController;
  [(OBBoldSubtitleController *)&v11 viewIsAppearing:a3];
  v4 = [(OBBoldSubtitleController *)self subtitleText];

  if (v4)
  {
    v5 = [(OBBoldSubtitleController *)self subtitleText];
    v6 = [(OBBoldSubtitleController *)self headerView];
    v7 = [(OBBoldSubtitleController *)self _findLabelWithText:v5 inView:v6];

    if (v7)
    {
      v8 = [v7 font];
      [v8 pointSize];
      v9 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
      [v7 setFont:v9];

      id v10 = +[UIColor labelColor];
      [v7 setTextColor:v10];
    }
  }
}

- (id)_findLabelWithText:(id)a3 inView:(id)a4
{
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [a4 subviews];
  id v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(obj);
        }
        objc_super v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          v13 = [v12 text];
          unsigned __int8 v14 = [v13 isEqualToString:v6];

          if (v14) {
            goto LABEL_14;
          }
        }
        uint64_t v15 = [(OBBoldSubtitleController *)self _findLabelWithText:v6 inView:v11];
        if (v15)
        {
          id v12 = (id)v15;
          goto LABEL_14;
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_14:

  return v12;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void)setSubtitleText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end