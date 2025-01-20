@interface ACUITextWithLinkButtonFooterView
- (ACUITextWithLinkButtonFooterView)initWithSpecifier:(id)a3;
- (ACUITextWithLinkButtonFooterView)initWithText:(id)a3 linkButton:(id)a4;
- (ACUITextWithLinkButtonFooterView)initWithText:(id)a3 linkButtons:(id)a4;
- (double)_heightForEmptyLineConstrainedToWidth:(double)a3;
- (double)_heightForFooterTextConstrainedToWidth:(double)a3;
- (double)_heightForLinkButton:(id)a3 constrainedToWidth:(double)a4;
- (double)preferredHeightForWidth:(double)a3;
- (void)layoutSubviews;
@end

@implementation ACUITextWithLinkButtonFooterView

- (ACUITextWithLinkButtonFooterView)initWithSpecifier:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)[location[0] propertyForKey:@"ACUIFooterText"];
  id v6 = (id)[location[0] propertyForKey:@"ACUILinkButtonArray"];
  v3 = v9;
  v9 = 0;
  v9 = [(ACUITextWithLinkButtonFooterView *)v3 initWithText:v7 linkButtons:v6];
  v5 = v9;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (ACUITextWithLinkButtonFooterView)initWithText:(id)a3 linkButton:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v7 = v12;
  id v6 = location[0];
  v13[0] = v10;
  id v8 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v12 = 0;
  v12 = -[ACUITextWithLinkButtonFooterView initWithText:linkButtons:](v7, "initWithText:linkButtons:", v6);
  v9 = v12;

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v9;
}

- (ACUITextWithLinkButtonFooterView)initWithText:(id)a3 linkButtons:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v29 = 0;
  objc_storeStrong(&v29, a4);
  v4 = v31;
  v31 = 0;
  v28.receiver = v4;
  v28.super_class = (Class)ACUITextWithLinkButtonFooterView;
  v25 = [(ACUITextWithLinkButtonFooterView *)&v28 init];
  v31 = v25;
  objc_storeStrong((id *)&v31, v25);
  if (v25)
  {
    uint64_t v5 = [location[0] copy];
    footerText = v31->_footerText;
    v31->_footerText = (NSString *)v5;

    id v7 = objc_alloc(MEMORY[0x1E4F42B38]);
    uint64_t v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    textLabel = v31->_textLabel;
    v31->_textLabel = (UILabel *)v8;

    [(UILabel *)v31->_textLabel setText:v31->_footerText];
    v16 = v31->_textLabel;
    id v17 = (id)[MEMORY[0x1E4F428B8] clearColor];
    -[UILabel setBackgroundColor:](v16, "setBackgroundColor:");

    [(UILabel *)v31->_textLabel setNumberOfLines:0];
    v18 = v31->_textLabel;
    id v19 = (id)[MEMORY[0x1E4F428B8] grayColor];
    -[UILabel setTextColor:](v18, "setTextColor:");

    v20 = v31->_textLabel;
    id v21 = (id)[MEMORY[0x1E4F42A30] systemFontOfSize:14.0];
    -[UILabel setFont:](v20, "setFont:");

    [(UILabel *)v31->_textLabel setTextAlignment:4];
    [(ACUITextWithLinkButtonFooterView *)v31 addSubview:v31->_textLabel];
    objc_storeStrong((id *)&v31->_linkButtons, v29);
    memset(__b, 0, sizeof(__b));
    v22 = v31->_linkButtons;
    uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:__b objects:v32 count:16];
    if (v23)
    {
      uint64_t v13 = *(void *)__b[2];
      uint64_t v14 = 0;
      unint64_t v15 = v23;
      while (1)
      {
        uint64_t v12 = v14;
        if (*(void *)__b[2] != v13) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(__b[1] + 8 * v14);
        [(ACUITextWithLinkButtonFooterView *)v31 addSubview:v27];
        ++v14;
        if (v12 + 1 >= v15)
        {
          uint64_t v14 = 0;
          unint64_t v15 = [(NSArray *)v22 countByEnumeratingWithState:__b objects:v32 count:16];
          if (!v15) {
            break;
          }
        }
      }
    }
  }
  v11 = v31;
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v31, 0);
  return v11;
}

- (void)layoutSubviews
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v36 = self;
  SEL v35 = a2;
  v34.receiver = self;
  v34.super_class = (Class)ACUITextWithLinkButtonFooterView;
  [(ACUITextWithLinkButtonFooterView *)&v34 layoutSubviews];
  double v33 = 0.0;
  [(ACUITextWithLinkButtonFooterView *)v36 frame];
  uint64_t v29 = v2;
  uint64_t v30 = v3;
  double v31 = v4;
  uint64_t v32 = v5;
  double v33 = v4 - 28.0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v27 = *MEMORY[0x1E4F1DB28];
  long long v28 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  *(void *)&long long v27 = 14.0;
  *((void *)&v27 + 1) = 10.0;
  *(double *)&long long v28 = v4 - 28.0;
  [(ACUITextWithLinkButtonFooterView *)v36 _heightForFooterTextConstrainedToWidth:v4 - 28.0];
  *((double *)&v28 + 1) = v6;
  -[UILabel setFrame:](v36->_textLabel, "setFrame:", v27, *(double *)&v28, v6);
  double v26 = 0.0;
  double v25 = 0.0;
  memset(__b, 0, sizeof(__b));
  obj = v36->_linkButtons;
  uint64_t v18 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v37 count:16];
  if (v18)
  {
    uint64_t v14 = *(void *)__b[2];
    uint64_t v15 = 0;
    unint64_t v16 = v18;
    while (1)
    {
      uint64_t v13 = v15;
      if (*(void *)__b[2] != v14) {
        objc_enumerationMutation(obj);
      }
      id v24 = *(id *)(__b[1] + 8 * v15);
      [v24 frame];
      double v21 = v7;
      if ([MEMORY[0x1E4F42678] defaultWritingDirectionForLanguage:0] == 1)
      {
        [(ACUITextWithLinkButtonFooterView *)v36 frame];
        double v19 = v8 - v21 - 14.0;
      }
      else
      {
        double v19 = 14.0;
      }
      -[ACUITextWithLinkButtonFooterView _heightForEmptyLineConstrainedToWidth:](v36, "_heightForEmptyLineConstrainedToWidth:", v33, *((double *)&v28 + 1) + 10.0 + v26, v25 + 1.0);
      double v20 = v11 + v12 * v9;
      [(ACUITextWithLinkButtonFooterView *)v36 _heightForLinkButton:v24 constrainedToWidth:v33];
      double v22 = v10;
      objc_msgSend(v24, "setFrame:", v19, v20, v21, v10);
      double v26 = v26 + v22;
      double v25 = v25 + 1.0;
      ++v15;
      if (v13 + 1 >= v16)
      {
        uint64_t v15 = 0;
        unint64_t v16 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v37 count:16];
        if (!v16) {
          break;
        }
      }
    }
  }
}

- (double)preferredHeightForWidth:(double)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v22 = self;
  SEL v21 = a2;
  double v20 = a3;
  double v19 = a3 - 28.0;
  double v18 = 0.0;
  memset(__b, 0, sizeof(__b));
  obj = v22->_linkButtons;
  uint64_t v15 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v23 count:16];
  if (v15)
  {
    uint64_t v11 = *(void *)__b[2];
    uint64_t v12 = 0;
    unint64_t v13 = v15;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)__b[2] != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void *)(__b[1] + 8 * v12);
      [(ACUITextWithLinkButtonFooterView *)v22 _heightForLinkButton:v17 constrainedToWidth:v19];
      double v18 = v18 + v3;
      ++v12;
      if (v10 + 1 >= v13)
      {
        uint64_t v12 = 0;
        unint64_t v13 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v23 count:16];
        if (!v13) {
          break;
        }
      }
    }
  }

  [(ACUITextWithLinkButtonFooterView *)v22 _heightForFooterTextConstrainedToWidth:v19];
  double v8 = v4 + 10.0;
  [(ACUITextWithLinkButtonFooterView *)v22 _heightForEmptyLineConstrainedToWidth:v19];
  double v9 = v5;
  unint64_t v6 = [(NSArray *)v22->_linkButtons count];
  return v8 + v9 * (double)v6 + v18 + 10.0;
}

- (double)_heightForFooterTextConstrainedToWidth:(double)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  footerText = self->_footerText;
  CGSizeMake();
  double v10 = v3;
  double v11 = v4;
  uint64_t v13 = *MEMORY[0x1E4F42508];
  id v9 = (id)[MEMORY[0x1E4F42A30] systemFontOfSize:14.0];
  v14[0] = v9;
  id v8 = (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v14, &v13);
  -[NSString boundingRectWithSize:options:attributes:context:](footerText, "boundingRectWithSize:options:attributes:context:", 1, v10, v11);
  double v12 = v5;

  return ceil(v12);
}

- (double)_heightForLinkButton:(id)a3 constrainedToWidth:(double)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = (id)objc_msgSend(location[0], "acui_titleString");
  CGSizeMake();
  double v11 = v4;
  double v12 = v5;
  uint64_t v15 = *MEMORY[0x1E4F42508];
  id v9 = (id)[MEMORY[0x1E4F42A30] systemFontOfSize:14.0];
  v16[0] = v9;
  id v8 = (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v16, &v15);
  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v11, v12);
  double v13 = v6;

  objc_storeStrong(location, 0);
  return ceil(v13);
}

- (double)_heightForEmptyLineConstrainedToWidth:(double)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  CGSizeMake();
  double v9 = v3;
  double v10 = v4;
  uint64_t v12 = *MEMORY[0x1E4F42508];
  id v8 = (id)[MEMORY[0x1E4F42A30] systemFontOfSize:8.0];
  v13[0] = v8;
  id v7 = (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, &v12);
  objc_msgSend(@"A", "boundingRectWithSize:options:attributes:context:", 1, v9, v10);
  double v11 = v5;

  return ceil(v11);
}

- (void).cxx_destruct
{
}

@end