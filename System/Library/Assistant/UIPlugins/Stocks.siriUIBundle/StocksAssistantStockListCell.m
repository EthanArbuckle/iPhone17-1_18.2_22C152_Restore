@interface StocksAssistantStockListCell
- (StocksAssistantStockListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)setRequestType:(unint64_t)a3;
- (void)setStock:(id)a3;
@end

@implementation StocksAssistantStockListCell

- (StocksAssistantStockListCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v29.receiver = self;
  v29.super_class = (Class)StocksAssistantStockListCell;
  v4 = [(StocksAssistantStockCell *)&v29 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v9 = (UILabel *)objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    companyNameLabel = v4->_companyNameLabel;
    v4->_companyNameLabel = v9;

    v11 = +[UIFont systemFontOfSize:14.0];
    [(UILabel *)v4->_companyNameLabel setFont:v11];

    [(UILabel *)v4->_companyNameLabel setLineBreakMode:4];
    [(UILabel *)v4->_companyNameLabel setTextAlignment:0];
    v12 = +[UIColor whiteColor];
    [(UILabel *)v4->_companyNameLabel setTextColor:v12];

    v13 = +[UIColor clearColor];
    [(UILabel *)v4->_companyNameLabel setBackgroundColor:v13];

    [(StocksAssistantStockListCell *)v4 addSubview:v4->_companyNameLabel];
    v14 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    tickerLabel = v4->_tickerLabel;
    v4->_tickerLabel = v14;

    v16 = +[UIFont boldSystemFontOfSize:18.0];
    [(UILabel *)v4->_tickerLabel setFont:v16];

    [(UILabel *)v4->_tickerLabel setAdjustsFontSizeToFitWidth:1];
    v17 = [(UILabel *)v4->_tickerLabel font];
    [v17 pointSize];
    [(UILabel *)v4->_tickerLabel setMinimumScaleFactor:14.0 / v18];

    [(UILabel *)v4->_tickerLabel setLineBreakMode:5];
    [(UILabel *)v4->_tickerLabel setTextAlignment:0];
    v19 = +[UIColor whiteColor];
    [(UILabel *)v4->_tickerLabel setTextColor:v19];

    v20 = +[UIColor clearColor];
    [(UILabel *)v4->_tickerLabel setBackgroundColor:v20];

    [(StocksAssistantStockListCell *)v4 addSubview:v4->_tickerLabel];
    v21 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    priceLabel = v4->_priceLabel;
    v4->_priceLabel = v21;

    v23 = +[UIFont systemFontOfSize:14.0];
    [(UILabel *)v4->_priceLabel setFont:v23];

    [(UILabel *)v4->_priceLabel setAdjustsFontSizeToFitWidth:1];
    v24 = [(UILabel *)v4->_priceLabel font];
    [v24 pointSize];
    [(UILabel *)v4->_priceLabel setMinimumScaleFactor:14.0 / v25];

    [(UILabel *)v4->_priceLabel setLineBreakMode:5];
    [(UILabel *)v4->_priceLabel setTextAlignment:2];
    v26 = +[UIColor whiteColor];
    [(UILabel *)v4->_priceLabel setTextColor:v26];

    v27 = +[UIColor clearColor];
    [(UILabel *)v4->_priceLabel setBackgroundColor:v27];

    [(StocksAssistantStockListCell *)v4 addSubview:v4->_priceLabel];
  }
  return v4;
}

- (void)setStock:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)StocksAssistantStockListCell;
  [(StocksAssistantStockCell *)&v14 setStock:a3];
  v4 = [(StocksAssistantStockCell *)self stock];
  id v5 = [v4 companyName];
  [(UILabel *)self->_companyNameLabel setText:v5];

  [(UILabel *)self->_companyNameLabel sizeToFit];
  v6 = [(StocksAssistantStockCell *)self stock];
  v7 = [v6 listName];
  v8 = [v7 uppercaseString];
  [(UILabel *)self->_tickerLabel setText:v8];

  [(UILabel *)self->_tickerLabel sizeToFit];
  v9 = [(StocksAssistantStockCell *)self stock];
  v10 = [v9 price];
  if ([v10 length])
  {
    v11 = [(StocksAssistantStockCell *)self stock];
    v12 = [v11 formattedPrice];
    p_priceLabel = &self->_priceLabel;
    [(UILabel *)*p_priceLabel setText:v12];
  }
  else
  {
    v11 = +[Stock BlankValueString];
    p_priceLabel = &self->_priceLabel;
    [(UILabel *)*p_priceLabel setText:v11];
  }

  [(UILabel *)*p_priceLabel sizeToFit];
}

- (void)setRequestType:(unint64_t)a3
{
  v49.receiver = self;
  v49.super_class = (Class)StocksAssistantStockListCell;
  -[StocksAssistantStockCell setRequestType:](&v49, "setRequestType:");
  if (a3 <= 9)
  {
    [(UILabel *)self->_changeLabel removeFromSuperview];
    changeLabel = self->_changeLabel;
    self->_changeLabel = 0;

    if (!self->_attributeTitle)
    {
      v6 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      attributeTitle = self->_attributeTitle;
      self->_attributeTitle = v6;

      v8 = +[UIFont boldSystemFontOfSize:18.0];
      [(UILabel *)self->_attributeTitle setFont:v8];

      [(UILabel *)self->_attributeTitle setLineBreakMode:4];
      [(UILabel *)self->_attributeTitle setTextAlignment:1];
      v9 = +[UIColor clearColor];
      [(UILabel *)self->_attributeTitle setBackgroundColor:v9];

      v10 = +[UIColor whiteColor];
      [(UILabel *)self->_attributeTitle setTextColor:v10];

      [(StocksAssistantStockListCell *)self addSubview:self->_attributeTitle];
    }
    if (!self->_attributeValue)
    {
      v11 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      attributeValue = self->_attributeValue;
      self->_attributeValue = v11;

      v13 = +[UIFont boldSystemFontOfSize:18.0];
      [(UILabel *)self->_attributeValue setFont:v13];

      [(UILabel *)self->_attributeValue setLineBreakMode:4];
      [(UILabel *)self->_attributeValue setTextAlignment:1];
      objc_super v14 = +[UIColor clearColor];
      [(UILabel *)self->_attributeValue setBackgroundColor:v14];

      v15 = +[UIColor whiteColor];
      [(UILabel *)self->_attributeValue setTextColor:v15];

      [(StocksAssistantStockListCell *)self addSubview:self->_attributeValue];
    }
    if (a3 == 5)
    {
      v16 = +[StocksBundles getBundle:1];
      [v16 siriUILocalizedStringForKey:@"LongMarketCap" table:@"Localizable"];
    }
    else
    {
      v16 = +[StocksAssistantStockCell infoAttributes];
      [v16 objectAtIndex:a3];
    v44 = };
    [(UILabel *)self->_attributeTitle setText:v44];

    [(UILabel *)self->_attributeTitle sizeToFit];
    v45 = [(StocksAssistantStockCell *)self valueForAttribute:a3];
    [(UILabel *)self->_attributeValue setText:v45];

    v46 = self->_attributeValue;
LABEL_21:
    [(UILabel *)v46 sizeToFit];
    return;
  }
  [(UILabel *)self->_attributeTitle removeFromSuperview];
  v17 = self->_attributeTitle;
  self->_attributeTitle = 0;

  [(UILabel *)self->_attributeValue removeFromSuperview];
  double v18 = self->_attributeValue;
  self->_attributeValue = 0;

  v19 = [(StocksAssistantStockCell *)self stock];
  v20 = [v19 price];
  [v20 floatValue];
  float v22 = v21;

  v23 = self->_changeLabel;
  if (v22 > 0.0)
  {
    if (!v23)
    {
      v24 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      double v25 = self->_changeLabel;
      self->_changeLabel = v24;

      v26 = +[StocksStyle sharedStyle];
      v27 = [v26 lightFontOfSize:18.0];
      [(UILabel *)self->_changeLabel setFont:v27];

      [(UILabel *)self->_changeLabel setLineBreakMode:4];
      [(UILabel *)self->_changeLabel setTextAlignment:2];
      v28 = +[UIColor clearColor];
      [(UILabel *)self->_changeLabel setBackgroundColor:v28];

      objc_super v29 = +[UIColor whiteColor];
      [(UILabel *)self->_changeLabel setTextColor:v29];

      [(StocksAssistantStockListCell *)self addSubview:self->_changeLabel];
    }
    v30 = [(StocksAssistantStockCell *)self stock];
    v31 = [v30 change];
    id v32 = [v31 length];

    if (v32)
    {
      v33 = [(StocksAssistantStockCell *)self stock];
      unsigned int v34 = [v33 changeIsNegative];
      v35 = @"+";
      if (v34) {
        v35 = @"-";
      }
      v36 = v35;

      v37 = +[StocksBundles getBundle:1];
      v38 = [v37 siriUILocalizedStringForKey:@"CHANGE" table:@"Localizable"];
      v39 = [(StocksAssistantStockCell *)self stock];
      v40 = [v39 formattedChangePercent:0];
      v41 = [(StocksAssistantStockCell *)self stock];
      v42 = [v41 formattedChangePercent:1];
      v43 = -[__CFString stringByAppendingFormat:](v36, "stringByAppendingFormat:", v38, v40, v42);

      [(UILabel *)self->_changeLabel setText:v43];
    }
    else
    {
      v48 = +[UIColor whiteColor];
      [(UILabel *)self->_changeLabel setTextColor:v48];

      v37 = +[Stock BlankValueString];
      [(UILabel *)self->_changeLabel setText:v37];
    }

    v46 = self->_changeLabel;
    goto LABEL_21;
  }
  if (v23)
  {
    [(UILabel *)v23 removeFromSuperview];
    v47 = self->_changeLabel;
    self->_changeLabel = 0;
  }
}

- (void)layoutSubviews
{
  v3 = +[UIDevice currentDevice];
  v4 = (char *)[v3 userInterfaceIdiom];

  id v5 = +[UIApplication sharedApplication];
  v6 = (char *)[v5 userInterfaceLayoutDirection];

  double v7 = 22.0;
  if (v4 == (unsigned char *)&dword_0 + 1) {
    double v7 = 28.0;
  }
  double rect_24 = v7;
  if (v4 == (unsigned char *)&dword_0 + 1) {
    double v8 = 48.0;
  }
  else {
    double v8 = 40.0;
  }
  v88.receiver = self;
  v88.super_class = (Class)StocksAssistantStockListCell;
  [(StocksAssistantStockListCell *)&v88 layoutSubviews];
  v9 = +[UIColor clearColor];
  [(StocksAssistantStockListCell *)self setBackgroundColor:v9];

  [(StocksAssistantStockListCell *)self bounds];
  CGFloat v11 = v10;
  CGFloat v86 = v12;
  double v87 = v13;
  CGFloat v85 = v14;
  [(UILabel *)self->_tickerLabel frame];
  double v18 = v17;
  double v20 = v19;
  double v21 = 0.0;
  double v22 = 0.0;
  if (v6 == (unsigned char *)&dword_0 + 1)
  {
    CGFloat v23 = v15;
    CGFloat v24 = v16;
    v89.origin.x = v11;
    v89.origin.double y = v86;
    v89.size.double width = v87;
    v89.size.double height = v85;
    double MaxX = CGRectGetMaxX(v89);
    v90.origin.x = v23;
    v90.origin.double y = v24;
    v90.size.double width = v18;
    v90.size.double height = v20;
    double v22 = MaxX - CGRectGetWidth(v90);
  }
  v26 = [(UILabel *)self->_tickerLabel font];
  [v26 ascender];
  RoundToPixel();
  double v28 = rect_24 - v27;

  -[UILabel setFrame:](self->_tickerLabel, "setFrame:", v22, v28, v18, v20);
  [(UILabel *)self->_priceLabel frame];
  double v30 = v29;
  double rect_16 = v31;
  if (v6 != (unsigned char *)&dword_0 + 1)
  {
    v91.origin.x = v11;
    v91.origin.double y = v86;
    v91.size.double width = v87;
    v91.size.double height = v85;
    double v21 = CGRectGetMaxX(v91) - v30;
  }
  CGFloat rect_8 = v11;
  id v32 = [(UILabel *)self->_priceLabel font];
  [v32 ascender];
  RoundToPixel();
  double v33 = v8;
  double v35 = v8 - v34;

  -[UILabel setFrame:](self->_priceLabel, "setFrame:", v21, v35, v30, rect_16);
  p_changeLabel = &self->_changeLabel;
  changeLabel = self->_changeLabel;
  if (changeLabel)
  {
    double v38 = v30;
    [(UILabel *)changeLabel frame];
    double v40 = v39;
    double v42 = v41;
    double v43 = 0.0;
    if (v6 != (unsigned char *)&dword_0 + 1)
    {
      v92.origin.x = rect_8;
      v92.origin.double y = v86;
      v92.size.double width = v87;
      v92.size.double height = v85;
      double v43 = CGRectGetMaxX(v92) - v40;
    }
    v44 = [(UILabel *)*p_changeLabel font];
    [v44 ascender];
    RoundToPixel();
    double v28 = rect_24 - v45;

LABEL_14:
    -[UILabel setFrame:](*p_changeLabel, "setFrame:", v43, v28, v40, v42);
    double v30 = v38;
    goto LABEL_15;
  }
  attributeTitle = self->_attributeTitle;
  if (attributeTitle)
  {
    p_changeLabel = &self->_attributeValue;
    if (self->_attributeValue)
    {
      double v38 = v30;
      [(UILabel *)attributeTitle frame];
      double v61 = v60;
      double rect_24a = v62;
      [(UILabel *)*p_changeLabel frame];
      double v42 = v64;
      if (v61 + v63 + 16.0 <= v87 - v18)
      {
        double v40 = v63;
        double v67 = v61;
      }
      else
      {
        double v65 = v87 - v18 + -16.0;
        float v66 = v65 * (v61 / (v61 + v63));
        double v67 = floorf(v66);
        double v40 = v65 - v67;
        if (v61 >= v67)
        {
          if (v40 > v63) {
            double v67 = v40 - v63 + v67;
          }
        }
        else
        {
          double v40 = v40 + v67 - v61;
        }
      }
      double recta = v67;
      if (v6 == (unsigned char *)&dword_0 + 1)
      {
        double v43 = 0.0;
        uint64_t v68 = 0;
        double v69 = v28;
        double v70 = v40;
        CGFloat v71 = CGRectGetMaxX(*(CGRect *)(&v64 - 3));
        double v72 = recta;
        double v73 = v71 + 8.0;
      }
      else
      {
        double v43 = v87 - v40;
        double v74 = v87 - v40;
        double v75 = v28;
        double v76 = v40;
        CGFloat MinX = CGRectGetMinX(*(CGRect *)(&v64 - 3));
        double v72 = recta;
        double v73 = MinX - (recta + 8.0);
      }
      -[UILabel setFrame:](self->_attributeTitle, "setFrame:", v73, v28, v72, rect_24a);
      goto LABEL_14;
    }
  }
LABEL_15:
  [(UILabel *)self->_companyNameLabel frame];
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;
  v52 = [(UILabel *)self->_companyNameLabel font];
  [v52 ascender];
  RoundToPixel();
  double v54 = v33 - v53;

  if (v6 == (unsigned char *)&dword_0 + 1)
  {
    CGFloat rect = v47;
    v93.origin.x = rect_8;
    v93.origin.double y = v86;
    v93.size.double width = v87;
    v93.size.double height = v85;
    double v78 = CGRectGetMaxX(v93);
    v94.origin.x = v21;
    v94.origin.double y = v35;
    v94.size.double width = v30;
    v94.size.double height = rect_16;
    double v55 = v78 - CGRectGetMaxX(v94) + -8.0;
    if (v49 >= v55) {
      double v56 = v55;
    }
    else {
      double v56 = v49;
    }
    v95.origin.x = rect_8;
    v95.origin.double y = v86;
    v95.size.double width = v87;
    v95.size.double height = v85;
    double v57 = CGRectGetMaxX(v95);
    v96.origin.x = rect;
    v96.origin.double y = v54;
    v96.size.double width = v56;
    v96.size.double height = v51;
    double v58 = v57 - CGRectGetWidth(v96);
  }
  else
  {
    if (v49 >= v21 - v47 + -8.0) {
      double v56 = v21 - v47 + -8.0;
    }
    else {
      double v56 = v49;
    }
    double v58 = 0.0;
  }
  -[UILabel setFrame:](self->_companyNameLabel, "setFrame:", v58, v54, v56, v51);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeValue, 0);
  objc_storeStrong((id *)&self->_attributeTitle, 0);
  objc_storeStrong((id *)&self->_changeLabel, 0);
  objc_storeStrong((id *)&self->_priceLabel, 0);
  objc_storeStrong((id *)&self->_tickerLabel, 0);

  objc_storeStrong((id *)&self->_companyNameLabel, 0);
}

@end