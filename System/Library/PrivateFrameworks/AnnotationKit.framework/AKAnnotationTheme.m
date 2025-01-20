@interface AKAnnotationTheme
+ (id)blueTheme:(int)a3;
+ (id)colorForAnnotationStyle:(int)a3 propertyName:(id)a4 pageTheme:(int)a5;
+ (id)colorForThemeItem:(id)a3 pageTheme:(int)a4;
+ (id)greenTheme:(int)a3;
+ (id)highlightTextColor:(int)a3;
+ (id)pinkTheme:(int)a3;
+ (id)purpleTheme:(int)a3;
+ (id)theme:(int)a3;
+ (id)themeDescriptions;
+ (id)themeForAnnotationStyle:(int)a3 pageTheme:(int)a4;
+ (id)themeForAnnotationStyle:(int)a3 pageTheme:(int)a4 isUnderline:(BOOL)a5;
+ (id)themeItemForAnnotationStyle:(int)a3 propertyName:(id)a4;
+ (id)underlineTheme:(int)a3;
+ (id)yellowTheme:(int)a3;
- (BOOL)isUnderline;
- (CGSize)noteShadowOffset;
- (UIColor)highlightColor;
- (UIColor)noteBorderColor;
- (UIColor)noteFillColor;
- (UIColor)noteMarkerBorderColor;
- (UIColor)noteMarkerFillColor;
- (UIColor)noteMarkerStrikethroughColor;
- (UIColor)noteShadowColor;
- (UIColor)noteTextColor;
- (UIColor)notesSidebarBarColor;
- (UIColor)notesSidebarTextColor;
- (UIFont)noteTextFont;
- (UIFont)noteTextFontInTable;
- (double)noteShadowOpacity;
- (double)noteShadowRadius;
- (int)annotationStyle;
- (int)pageTheme;
- (void)setPageTheme:(int)a3;
@end

@implementation AKAnnotationTheme

+ (id)themeDescriptions
{
  if (qword_2689240C8 != -1) {
    dispatch_once(&qword_2689240C8, &unk_26EA57518);
  }
  v2 = (void *)qword_2689240D0;

  return v2;
}

+ (id)themeItemForAnnotationStyle:(int)a3 propertyName:(id)a4
{
  id v6 = a4;
  v7 = 0;
  if (v6 && a3 <= 6)
  {
    v8 = off_264CDAEA0[a3];
    v9 = [a1 themeDescriptions];
    v10 = [v9 objectForKey:@"themes"];

    v11 = [v10 objectForKey:v8];
    v7 = [v11 objectForKey:v6];
  }

  return v7;
}

+ (id)colorForThemeItem:(id)a3 pageTheme:(int)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4 > 4)
  {
    v7 = 0;
  }
  else
  {
    v7 = [v5 objectForKey:off_264CDAED8[a4]];
  }
  if (a4 != 4 && !v7)
  {
    v7 = [v6 objectForKey:@"default"];
  }
  if (v7)
  {
    v8 = objc_msgSend(MEMORY[0x263F1C550], "im_colorWithSRGBDescription:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)colorForAnnotationStyle:(int)a3 propertyName:(id)a4 pageTheme:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  v7 = [a1 themeItemForAnnotationStyle:*(void *)&a3 propertyName:a4];
  if (!v7
    || ([a1 colorForThemeItem:v7 pageTheme:v5],
        (v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8 = [MEMORY[0x263F1C550] blackColor];
  }

  return v8;
}

- (UIColor)noteFillColor
{
  return (UIColor *)[MEMORY[0x263F1C550] blackColor];
}

- (UIColor)noteBorderColor
{
  return (UIColor *)[MEMORY[0x263F1C550] blackColor];
}

- (UIColor)noteTextColor
{
  return (UIColor *)[MEMORY[0x263F1C550] blackColor];
}

- (UIColor)highlightColor
{
  return (UIColor *)[MEMORY[0x263F1C550] blackColor];
}

- (UIColor)noteMarkerFillColor
{
  return (UIColor *)[MEMORY[0x263F1C550] blackColor];
}

- (UIColor)noteMarkerBorderColor
{
  return (UIColor *)[MEMORY[0x263F1C550] blackColor];
}

- (UIColor)notesSidebarBarColor
{
  return (UIColor *)[MEMORY[0x263F1C550] blackColor];
}

- (UIColor)noteMarkerStrikethroughColor
{
  if (qword_268924E58 != -1) {
    dispatch_once(&qword_268924E58, &unk_26EA57798);
  }
  v2 = (void *)qword_268924E60;

  return (UIColor *)v2;
}

- (UIColor)notesSidebarTextColor
{
  if (qword_268924E68 != -1) {
    dispatch_once(&qword_268924E68, &unk_26EA577B8);
  }
  v2 = (void *)qword_268924E70;

  return (UIColor *)v2;
}

+ (id)greenTheme:(int)a3
{
  uint64_t v18 = v3;
  uint64_t v19 = v4;
  switch(a3)
  {
    case 0:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237628CF4;
      v14[3] = &unk_264CDAE60;
      int v15 = 0;
      if (qword_268924E88 != -1) {
        dispatch_once(&qword_268924E88, v14);
      }
      uint64_t v5 = &qword_268924E90;
      goto LABEL_20;
    case 1:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_237628D48;
      block[3] = &unk_264CDAE60;
      int v13 = 1;
      if (qword_268924E98 != -1) {
        dispatch_once(&qword_268924E98, block);
      }
      uint64_t v5 = &qword_268924EA0;
      goto LABEL_20;
    case 2:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_237628D9C;
      v10[3] = &unk_264CDAE60;
      int v11 = 2;
      if (qword_268924EA8 != -1) {
        dispatch_once(&qword_268924EA8, v10);
      }
      uint64_t v5 = &qword_268924EB0;
      goto LABEL_20;
    case 3:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237628DF0;
      v8[3] = &unk_264CDAE60;
      int v9 = 3;
      if (qword_268924EB8 != -1) {
        dispatch_once(&qword_268924EB8, v8);
      }
      uint64_t v5 = &qword_268924EC0;
      goto LABEL_20;
    case 4:
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = sub_237628CA0;
      v16[3] = &unk_264CDAE60;
      int v17 = 4;
      if (qword_268924E78 != -1) {
        dispatch_once(&qword_268924E78, v16);
      }
      uint64_t v5 = &qword_268924E80;
LABEL_20:
      id v6 = (id)*v5;
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

+ (id)blueTheme:(int)a3
{
  uint64_t v18 = v3;
  uint64_t v19 = v4;
  switch(a3)
  {
    case 0:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237629184;
      v14[3] = &unk_264CDAE60;
      int v15 = 0;
      if (qword_268924ED8 != -1) {
        dispatch_once(&qword_268924ED8, v14);
      }
      uint64_t v5 = &qword_268924EE0;
      goto LABEL_20;
    case 1:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_2376291D8;
      block[3] = &unk_264CDAE60;
      int v13 = 1;
      if (qword_268924EE8 != -1) {
        dispatch_once(&qword_268924EE8, block);
      }
      uint64_t v5 = &qword_268924EF0;
      goto LABEL_20;
    case 2:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_23762922C;
      v10[3] = &unk_264CDAE60;
      int v11 = 2;
      if (qword_268924EF8 != -1) {
        dispatch_once(&qword_268924EF8, v10);
      }
      uint64_t v5 = &qword_268924F00;
      goto LABEL_20;
    case 3:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237629280;
      v8[3] = &unk_264CDAE60;
      int v9 = 3;
      if (qword_268924F08 != -1) {
        dispatch_once(&qword_268924F08, v8);
      }
      uint64_t v5 = &qword_268924F10;
      goto LABEL_20;
    case 4:
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = sub_237629130;
      v16[3] = &unk_264CDAE60;
      int v17 = 4;
      if (qword_268924EC8 != -1) {
        dispatch_once(&qword_268924EC8, v16);
      }
      uint64_t v5 = &qword_268924ED0;
LABEL_20:
      id v6 = (id)*v5;
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

+ (id)yellowTheme:(int)a3
{
  uint64_t v18 = v3;
  uint64_t v19 = v4;
  switch(a3)
  {
    case 0:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237629614;
      v14[3] = &unk_264CDAE60;
      int v15 = 0;
      if (qword_268924F28 != -1) {
        dispatch_once(&qword_268924F28, v14);
      }
      uint64_t v5 = &qword_268924F30;
      goto LABEL_20;
    case 1:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_237629668;
      block[3] = &unk_264CDAE60;
      int v13 = 1;
      if (qword_268924F38 != -1) {
        dispatch_once(&qword_268924F38, block);
      }
      uint64_t v5 = &qword_268924F40;
      goto LABEL_20;
    case 2:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_2376296BC;
      v10[3] = &unk_264CDAE60;
      int v11 = 2;
      if (qword_268924F48 != -1) {
        dispatch_once(&qword_268924F48, v10);
      }
      uint64_t v5 = &qword_268924F50;
      goto LABEL_20;
    case 3:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237629710;
      v8[3] = &unk_264CDAE60;
      int v9 = 3;
      if (qword_268924F58 != -1) {
        dispatch_once(&qword_268924F58, v8);
      }
      uint64_t v5 = &qword_268924F60;
      goto LABEL_20;
    case 4:
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = sub_2376295C0;
      v16[3] = &unk_264CDAE60;
      int v17 = 4;
      if (qword_268924F18 != -1) {
        dispatch_once(&qword_268924F18, v16);
      }
      uint64_t v5 = &qword_268924F20;
LABEL_20:
      id v6 = (id)*v5;
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

+ (id)pinkTheme:(int)a3
{
  uint64_t v18 = v3;
  uint64_t v19 = v4;
  switch(a3)
  {
    case 0:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237629AA4;
      v14[3] = &unk_264CDAE60;
      int v15 = 0;
      if (qword_268924F78 != -1) {
        dispatch_once(&qword_268924F78, v14);
      }
      uint64_t v5 = &qword_268924F80;
      goto LABEL_20;
    case 1:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_237629AF8;
      block[3] = &unk_264CDAE60;
      int v13 = 1;
      if (qword_268924F88 != -1) {
        dispatch_once(&qword_268924F88, block);
      }
      uint64_t v5 = &qword_268924F90;
      goto LABEL_20;
    case 2:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_237629B4C;
      v10[3] = &unk_264CDAE60;
      int v11 = 2;
      if (qword_268924F98 != -1) {
        dispatch_once(&qword_268924F98, v10);
      }
      uint64_t v5 = &qword_268924FA0;
      goto LABEL_20;
    case 3:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237629BA0;
      v8[3] = &unk_264CDAE60;
      int v9 = 3;
      if (qword_268924FA8 != -1) {
        dispatch_once(&qword_268924FA8, v8);
      }
      uint64_t v5 = &qword_268924FB0;
      goto LABEL_20;
    case 4:
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = sub_237629A50;
      v16[3] = &unk_264CDAE60;
      int v17 = 4;
      if (qword_268924F68 != -1) {
        dispatch_once(&qword_268924F68, v16);
      }
      uint64_t v5 = &qword_268924F70;
LABEL_20:
      id v6 = (id)*v5;
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

+ (id)purpleTheme:(int)a3
{
  uint64_t v18 = v3;
  uint64_t v19 = v4;
  switch(a3)
  {
    case 0:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237629F34;
      v14[3] = &unk_264CDAE60;
      int v15 = 0;
      if (qword_268924FC8 != -1) {
        dispatch_once(&qword_268924FC8, v14);
      }
      uint64_t v5 = &qword_268924FD0;
      goto LABEL_20;
    case 1:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_237629F88;
      block[3] = &unk_264CDAE60;
      int v13 = 1;
      if (qword_268924FD8 != -1) {
        dispatch_once(&qword_268924FD8, block);
      }
      uint64_t v5 = &qword_268924FE0;
      goto LABEL_20;
    case 2:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_237629FDC;
      v10[3] = &unk_264CDAE60;
      int v11 = 2;
      if (qword_268924FE8 != -1) {
        dispatch_once(&qword_268924FE8, v10);
      }
      uint64_t v5 = &qword_268924FF0;
      goto LABEL_20;
    case 3:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_23762A030;
      v8[3] = &unk_264CDAE60;
      int v9 = 3;
      if (qword_268924FF8 != -1) {
        dispatch_once(&qword_268924FF8, v8);
      }
      uint64_t v5 = &qword_268925000;
      goto LABEL_20;
    case 4:
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = sub_237629EE0;
      v16[3] = &unk_264CDAE60;
      int v17 = 4;
      if (qword_268924FB8 != -1) {
        dispatch_once(&qword_268924FB8, v16);
      }
      uint64_t v5 = &qword_268924FC0;
LABEL_20:
      id v6 = (id)*v5;
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

+ (id)underlineTheme:(int)a3
{
  uint64_t v18 = v3;
  uint64_t v19 = v4;
  switch(a3)
  {
    case 0:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_23762A3C4;
      v14[3] = &unk_264CDAE60;
      int v15 = 0;
      if (qword_268925018 != -1) {
        dispatch_once(&qword_268925018, v14);
      }
      uint64_t v5 = &qword_268925020;
      goto LABEL_20;
    case 1:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_23762A418;
      block[3] = &unk_264CDAE60;
      int v13 = 1;
      if (qword_268925028 != -1) {
        dispatch_once(&qword_268925028, block);
      }
      uint64_t v5 = &qword_268925030;
      goto LABEL_20;
    case 2:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_23762A46C;
      v10[3] = &unk_264CDAE60;
      int v11 = 2;
      if (qword_268925038 != -1) {
        dispatch_once(&qword_268925038, v10);
      }
      uint64_t v5 = &qword_268925040;
      goto LABEL_20;
    case 3:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_23762A4C0;
      v8[3] = &unk_264CDAE60;
      int v9 = 3;
      if (qword_268925048 != -1) {
        dispatch_once(&qword_268925048, v8);
      }
      uint64_t v5 = &qword_268925050;
      goto LABEL_20;
    case 4:
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = sub_23762A370;
      v16[3] = &unk_264CDAE60;
      int v17 = 4;
      if (qword_268925008 != -1) {
        dispatch_once(&qword_268925008, v16);
      }
      uint64_t v5 = &qword_268925010;
LABEL_20:
      id v6 = (id)*v5;
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

+ (id)theme:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = objc_alloc_init((Class)a1);
  [v4 setPageTheme:v3];

  return v4;
}

+ (id)themeForAnnotationStyle:(int)a3 pageTheme:(int)a4
{
  switch(a3)
  {
    case 1:
      id v6 = +[AKAnnotationTheme greenTheme:](AKAnnotationTheme, "greenTheme:", *(void *)&a4, v4);
      goto LABEL_10;
    case 2:
      id v6 = +[AKAnnotationTheme blueTheme:](AKAnnotationTheme, "blueTheme:", *(void *)&a4, v4);
      goto LABEL_10;
    case 3:
      id v6 = +[AKAnnotationTheme yellowTheme:](AKAnnotationTheme, "yellowTheme:", *(void *)&a4, v4);
      goto LABEL_10;
    case 4:
      id v6 = +[AKAnnotationTheme pinkTheme:](AKAnnotationTheme, "pinkTheme:", *(void *)&a4, v4);
      goto LABEL_10;
    case 5:
      id v6 = +[AKAnnotationTheme purpleTheme:](AKAnnotationTheme, "purpleTheme:", *(void *)&a4, v4);
LABEL_10:
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

+ (id)themeForAnnotationStyle:(int)a3 pageTheme:(int)a4 isUnderline:(BOOL)a5
{
  uint64_t v6 = *(void *)&a4;
  v7 = objc_msgSend(a1, "themeForAnnotationStyle:pageTheme:", *(void *)&a3);
  v8 = v7;
  if (v7 || !a5)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = +[AKAnnotationTheme underlineTheme:v6];
  }
  v10 = v9;

  return v10;
}

+ (id)highlightTextColor:(int)a3
{
  uint64_t v18 = v3;
  uint64_t v19 = v4;
  switch(a3)
  {
    case 0:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_23762AA7C;
      v14[3] = &unk_264CDAE80;
      void v14[4] = a1;
      int v15 = 0;
      if (qword_268925068 != -1) {
        dispatch_once(&qword_268925068, v14);
      }
      uint64_t v5 = &qword_268925070;
      goto LABEL_20;
    case 1:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_23762AB34;
      block[3] = &unk_264CDAE80;
      void block[4] = a1;
      int v13 = 1;
      if (qword_268925078 != -1) {
        dispatch_once(&qword_268925078, block);
      }
      uint64_t v5 = &qword_268925080;
      goto LABEL_20;
    case 2:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_23762ABEC;
      v10[3] = &unk_264CDAE80;
      void v10[4] = a1;
      int v11 = 2;
      if (qword_268925088 != -1) {
        dispatch_once(&qword_268925088, v10);
      }
      uint64_t v5 = &qword_268925090;
      goto LABEL_20;
    case 3:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_23762ACA4;
      v8[3] = &unk_264CDAE80;
      void v8[4] = a1;
      int v9 = 3;
      if (qword_268925098 != -1) {
        dispatch_once(&qword_268925098, v8);
      }
      uint64_t v5 = &qword_2689250A0;
      goto LABEL_20;
    case 4:
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = sub_23762A9C4;
      v16[3] = &unk_264CDAE80;
      void v16[4] = a1;
      int v17 = 4;
      if (qword_268925058 != -1) {
        dispatch_once(&qword_268925058, v16);
      }
      uint64_t v5 = &qword_268925060;
LABEL_20:
      id v6 = (id)*v5;
      break;
    default:
      id v6 = 0;
      break;
  }
  return v6;
}

- (double)noteShadowRadius
{
  if (qword_2689250A8 != -1) {
    dispatch_once(&qword_2689250A8, &unk_26EA577D8);
  }
  return *(double *)&qword_2689250B0;
}

- (double)noteShadowOpacity
{
  if (qword_2689250B8 != -1) {
    dispatch_once(&qword_2689250B8, &unk_26EA577F8);
  }
  return *(double *)&qword_2689250C0;
}

- (UIColor)noteShadowColor
{
  if (qword_2689250C8 != -1) {
    dispatch_once(&qword_2689250C8, &unk_26EA57818);
  }
  v2 = (void *)qword_2689250D0;

  return (UIColor *)v2;
}

- (CGSize)noteShadowOffset
{
  if (qword_2689250D8 != -1) {
    dispatch_once(&qword_2689250D8, &unk_26EA57838);
  }
  double v2 = *(double *)&qword_2689250E0;
  double v3 = *(double *)&qword_2689250E8;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIFont)noteTextFont
{
  if (qword_2689250F0 != -1) {
    dispatch_once(&qword_2689250F0, &unk_26EA57858);
  }
  double v2 = (void *)qword_2689250F8;

  return (UIFont *)v2;
}

- (UIFont)noteTextFontInTable
{
  if (qword_268925100 != -1) {
    dispatch_once(&qword_268925100, &unk_26EA57878);
  }
  double v2 = (void *)qword_268925108;

  return (UIFont *)v2;
}

- (BOOL)isUnderline
{
  return 0;
}

- (int)annotationStyle
{
  return 1;
}

- (int)pageTheme
{
  return self->_pageTheme;
}

- (void)setPageTheme:(int)a3
{
  self->_pageTheme = a3;
}

@end