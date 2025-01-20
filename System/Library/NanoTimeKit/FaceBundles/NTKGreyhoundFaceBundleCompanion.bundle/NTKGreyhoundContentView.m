@interface NTKGreyhoundContentView
- (NTKCaliforniaColorPalette)colorPalette;
- (NTKGreyhoundContentView)initWithFrame:(CGRect)a3 device:(id)a4 style:(unint64_t)a5 density:(unint64_t)a6 typeface:(unint64_t)a7 colorPalette:(id)a8;
- (id)_createLabelForHour:(unint64_t)a3;
- (id)_font;
- (unint64_t)density;
- (unint64_t)style;
- (unint64_t)typeface;
- (void)_createHourLabels;
- (void)setColorPalette:(id)a3;
- (void)setDensity:(unint64_t)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTypeface:(unint64_t)a3;
@end

@implementation NTKGreyhoundContentView

- (NTKGreyhoundContentView)initWithFrame:(CGRect)a3 device:(id)a4 style:(unint64_t)a5 density:(unint64_t)a6 typeface:(unint64_t)a7 colorPalette:(id)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v18 = a4;
  id v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)NTKGreyhoundContentView;
  v20 = -[NTKGreyhoundContentView initWithFrame:](&v25, "initWithFrame:", x, y, width, height);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_device, a4);
    v21->_style = a5;
    v21->_typeface = a7;
    v21->_densitdouble y = a6;
    objc_storeStrong((id *)&v21->_colorPalette, a8);
    uint64_t v22 = +[NSMutableArray array];
    hourLabels = v21->_hourLabels;
    v21->_hourLabels = (NSMutableArray *)v22;

    [(NTKGreyhoundContentView *)v21 _createHourLabels];
  }

  return v21;
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(NTKGreyhoundContentView *)self _createHourLabels];
  }
}

- (void)setDensity:(unint64_t)a3
{
  if (self->_density != a3)
  {
    self->_densitdouble y = a3;
    [(NTKGreyhoundContentView *)self _createHourLabels];
  }
}

- (void)setTypeface:(unint64_t)a3
{
  if (self->_typeface != a3)
  {
    self->_typeface = a3;
    [(NTKGreyhoundContentView *)self _createHourLabels];
  }
}

- (void)setColorPalette:(id)a3
{
  objc_storeStrong((id *)&self->_colorPalette, a3);
  id v5 = a3;
  v6 = [v5 digit];
  hourLabels = self->_hourLabels;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_9804;
  v9[3] = &unk_145A8;
  id v10 = v6;
  id v8 = v6;
  [(NSMutableArray *)hourLabels enumerateObjectsUsingBlock:v9];
}

- (void)_createHourLabels
{
  font = self->_font;
  self->_font = 0;

  [(NSMutableArray *)self->_hourLabels enumerateObjectsUsingBlock:&stru_145E8];
  [(NSMutableArray *)self->_hourLabels removeAllObjects];
  if (self->_density) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 3;
  }
  for (unint64_t i = v4; i < 0xD; i += v4)
  {
    v6 = [(NTKGreyhoundContentView *)self _createLabelForHour:i];
    v7 = +[NSString stringWithFormat:@"%lu", i];
    [v6 setAccessibilityLabel:v7];

    [(NSMutableArray *)self->_hourLabels addObject:v6];
  }
  hourLabels = self->_hourLabels;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_9AAC;
  v9[3] = &unk_145A8;
  void v9[4] = self;
  [(NSMutableArray *)hourLabels enumerateObjectsUsingBlock:v9];
}

- (id)_createLabelForHour:(unint64_t)a3
{
  v3 = (void *)__chkstk_darwin(self, a2, a3);
  unint64_t v57 = v4;
  id v5 = v3;
  v61 = [v3 _font];
  switch(*((void *)v5 + 4))
  {
    case 0:
      if (v57 == 4) {
        goto LABEL_36;
      }
      goto LABEL_48;
    case 1:
      uint64_t v6 = *((void *)v5 + 6);
      if (v6)
      {
        if (v6 == 2 && v57 <= 0xC && ((1 << v57) & 0x1402) != 0) {
          goto LABEL_36;
        }
      }
      else if (v57 == 3 && !*((void *)v5 + 5))
      {
        goto LABEL_36;
      }
      goto LABEL_48;
    case 2:
      if (*((void *)v5 + 6) == 2 && v57 == 12 && !*((void *)v5 + 5)) {
        goto LABEL_36;
      }
      goto LABEL_48;
    case 3:
      uint64_t v9 = *((void *)v5 + 6);
      if (v9)
      {
        if (v9 == 1)
        {
          if (v57 == 12) {
            goto LABEL_36;
          }
        }
        else if (v9 == 2)
        {
          if (*((void *)v5 + 5))
          {
            if (v57 != 10) {
              goto LABEL_48;
            }
LABEL_36:
            uint64_t v12 = [v61 CLKFontWithStylisticSet:1];
            goto LABEL_47;
          }
          if (v57 == 12 || v57 == 10 || v57 == 9) {
            goto LABEL_36;
          }
        }
      }
      else if (!*((void *)v5 + 5))
      {
        goto LABEL_36;
      }
LABEL_48:
      id v15 = objc_alloc_init((Class)UILabel);
      [v15 setTextAlignment:1];
      v16 = [*((id *)v5 + 7) digit];
      [v15 setTextColor:v16];

      [v15 setFont:v61];
      v60 = +[NTKGreyhoundTextUtilities textForHour:v57 density:*((void *)v5 + 5) style:*((void *)v5 + 4) typeface:*((void *)v5 + 6)];
      if (*((void *)v5 + 5) || *((void *)v5 + 6) != 1 || *((void *)v5 + 4)) {
        goto LABEL_51;
      }
      if (v57 != 3)
      {
        if (v57 == 12)
        {
          sub_9B8C(*((void **)v5 + 1), v64);
          v29 = (void *)v64[540];
          v58 = +[NSNumber numberWithUnsignedInteger:*((void *)v5 + 4)];
          v30 = [v29 objectForKeyedSubscript:v58];
          v31 = +[NSNumber numberWithUnsignedInteger:*((void *)v5 + 6)];
          v32 = [v30 objectForKeyedSubscript:v31];
          v33 = +[NSNumber numberWithUnsignedInteger:*((void *)v5 + 5)];
          v34 = [v32 objectForKeyedSubscript:v33];
          v35 = +[NSNumber numberWithUnsignedInteger:12];
          v36 = [v34 objectForKeyedSubscript:v35];

          id v37 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v60];
          v38 = [v36 objectAtIndexedSubscript:0];
          objc_msgSend(v37, "addAttribute:value:range:", NSKernAttributeName, v38, 0, 1);

          v39 = [v36 objectAtIndexedSubscript:1];
          objc_msgSend(v37, "addAttribute:value:range:", NSKernAttributeName, v39, 1, 1);

          [v15 setAttributedText:v37];
LABEL_55:
          [v15 sizeToFit];
          [v15 frame];
          objc_msgSend(v15, "setFrame:");
          goto LABEL_56;
        }
LABEL_51:
        sub_9B8C(*((void **)v5 + 1), v62);
        v17 = (void *)v62[540];
        id v18 = +[NSNumber numberWithUnsignedInteger:*((void *)v5 + 4)];
        id v19 = [v17 objectForKeyedSubscript:v18];
        v20 = +[NSNumber numberWithUnsignedInteger:*((void *)v5 + 6)];
        v21 = [v19 objectForKeyedSubscript:v20];
        uint64_t v22 = +[NSNumber numberWithUnsignedInteger:*((void *)v5 + 5)];
        v23 = [v21 objectForKeyedSubscript:v22];
        v24 = +[NSNumber numberWithUnsignedInteger:v57];
        objc_super v25 = [v23 objectForKeyedSubscript:v24];

        if (v25)
        {
          NSAttributedStringKey v65 = NSKernAttributeName;
          v66 = v25;
          v26 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
          id v27 = [objc_alloc((Class)NSAttributedString) initWithString:v60 attributes:v26];
          [v15 setAttributedText:v27];
        }
        else
        {
          [v15 setText:v60];
        }

        goto LABEL_55;
      }
      sub_9B8C(*((void **)v5 + 1), v63);
      v40 = (void *)v63[540];
      v59 = +[NSNumber numberWithUnsignedInteger:*((void *)v5 + 4)];
      v56 = [v40 objectForKeyedSubscript:v59];
      v55 = +[NSNumber numberWithUnsignedInteger:*((void *)v5 + 6)];
      v41 = [v56 objectForKeyedSubscript:v55];
      v42 = +[NSNumber numberWithUnsignedInteger:*((void *)v5 + 5)];
      v43 = [v41 objectForKeyedSubscript:v42];
      v44 = +[NSNumber numberWithUnsignedInteger:3];
      v45 = [v43 objectForKeyedSubscript:v44];

      for (int i = 1; i != 4; ++i)
      {
        id v47 = objc_alloc_init((Class)UILabel);
        [v47 setTextAlignment:1];
        v48 = [*((id *)v5 + 7) digit];
        [v47 setTextColor:v48];

        [v47 setFont:v61];
        [v47 setText:v60];
        [v47 sizeToFit];
        [v15 center];
        double v50 = v49;
        double v52 = v51;
        if (i == 3)
        {
          [v45 floatValue];
          double v50 = v50 + v54;
        }
        else if (i == 1)
        {
          [v45 floatValue];
          double v50 = v50 - v53;
        }
        objc_msgSend(v47, "setCenter:", v50, v52);
        [v15 addSubview:v47];
      }
LABEL_56:

      return v15;
    case 4:
      uint64_t v10 = *((void *)v5 + 5);
      if (v10 == 1)
      {
        uint64_t v12 = [v61 CLKFontWithRareLigaturesAndStylisticSet:*((void *)v5 + 6) == 2];
      }
      else
      {
        if (v10) {
          goto LABEL_48;
        }
        uint64_t v11 = *((void *)v5 + 6);
        if (v11 == 2)
        {
          if (v57 == 12) {
            uint64_t v13 = 2;
          }
          else {
            uint64_t v13 = 1;
          }
          uint64_t v12 = [v61 CLKFontWithRareLigaturesAndStylisticSet:v13];
        }
        else if (v11 == 1)
        {
          uint64_t v12 = [v61 CLKFontWithRareLigaturesAndStylisticSet:1];
        }
        else
        {
          if (v11) {
            goto LABEL_48;
          }
          uint64_t v12 = [v61 CLKFontWithRareLigaturesAndStylisticSet:2];
        }
      }
LABEL_47:
      v14 = (void *)v12;

      v61 = v14;
      goto LABEL_48;
    default:
      goto LABEL_48;
  }
}

- (id)_font
{
  font = self->_font;
  if (!font)
  {
    unint64_t v4 = +[NTKGreyhoundTextUtilities fontForDevice:self->_device style:self->_style density:self->_density typeface:self->_typeface];
    id v5 = self->_font;
    self->_font = v4;

    font = self->_font;
  }

  return font;
}

- (unint64_t)style
{
  return self->_style;
}

- (unint64_t)density
{
  return self->_density;
}

- (unint64_t)typeface
{
  return self->_typeface;
}

- (NTKCaliforniaColorPalette)colorPalette
{
  return self->_colorPalette;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_storeStrong((id *)&self->_hourLabels, 0);
  objc_storeStrong((id *)&self->_font, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end