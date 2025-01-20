@interface AKAnnotationThemePink
- (BOOL)isUnderline;
- (id)highlightColor;
- (id)noteBorderColor;
- (id)noteFillColor;
- (id)noteMarkerBorderColor;
- (id)noteMarkerFillColor;
- (id)noteTextColor;
- (id)notesSidebarBarColor;
- (int)annotationStyle;
@end

@implementation AKAnnotationThemePink

- (id)noteFillColor
{
  switch([(AKAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_237624234;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_2689249E8 != -1) {
        dispatch_once(&qword_2689249E8, block);
      }
      v3 = &qword_2689249F0;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_23762429C;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_2689249F8 != -1) {
        dispatch_once(&qword_2689249F8, v10);
      }
      v3 = &qword_268924A00;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237624304;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924A08 != -1) {
        dispatch_once(&qword_268924A08, v8);
      }
      v3 = &qword_268924A10;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_23762436C;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924A18 != -1) {
        dispatch_once(&qword_268924A18, v6);
      }
      v3 = &qword_268924A20;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_2376241CC;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_2689249D8 != -1) {
        dispatch_once(&qword_2689249D8, v14);
      }
      v3 = &qword_2689249E0;
LABEL_18:
      id v4 = (id)*v3;
      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

- (id)noteBorderColor
{
  switch([(AKAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_237624740;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924A38 != -1) {
        dispatch_once(&qword_268924A38, block);
      }
      v3 = &qword_268924A40;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_2376247A8;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924A48 != -1) {
        dispatch_once(&qword_268924A48, v10);
      }
      v3 = &qword_268924A50;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237624810;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924A58 != -1) {
        dispatch_once(&qword_268924A58, v8);
      }
      v3 = &qword_268924A60;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_237624878;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924A68 != -1) {
        dispatch_once(&qword_268924A68, v6);
      }
      v3 = &qword_268924A70;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_2376246D8;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924A28 != -1) {
        dispatch_once(&qword_268924A28, v14);
      }
      v3 = &qword_268924A30;
LABEL_18:
      id v4 = (id)*v3;
      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

- (id)noteTextColor
{
  switch([(AKAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_237624C4C;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924A88 != -1) {
        dispatch_once(&qword_268924A88, block);
      }
      v3 = &qword_268924A90;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_237624CB4;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924A98 != -1) {
        dispatch_once(&qword_268924A98, v10);
      }
      v3 = &qword_268924AA0;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237624D1C;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924AA8 != -1) {
        dispatch_once(&qword_268924AA8, v8);
      }
      v3 = &qword_268924AB0;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_237624D84;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924AB8 != -1) {
        dispatch_once(&qword_268924AB8, v6);
      }
      v3 = &qword_268924AC0;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237624BE4;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924A78 != -1) {
        dispatch_once(&qword_268924A78, v14);
      }
      v3 = &qword_268924A80;
LABEL_18:
      id v4 = (id)*v3;
      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

- (id)highlightColor
{
  switch([(AKAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_237625158;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924AD8 != -1) {
        dispatch_once(&qword_268924AD8, block);
      }
      v3 = &qword_268924AE0;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_2376251C0;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924AE8 != -1) {
        dispatch_once(&qword_268924AE8, v10);
      }
      v3 = &qword_268924AF0;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237625228;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924AF8 != -1) {
        dispatch_once(&qword_268924AF8, v8);
      }
      v3 = &qword_268924B00;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_237625290;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924B08 != -1) {
        dispatch_once(&qword_268924B08, v6);
      }
      v3 = &qword_268924B10;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_2376250F0;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924AC8 != -1) {
        dispatch_once(&qword_268924AC8, v14);
      }
      v3 = &qword_268924AD0;
LABEL_18:
      id v4 = (id)*v3;
      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

- (id)noteMarkerFillColor
{
  switch([(AKAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_237625664;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924B28 != -1) {
        dispatch_once(&qword_268924B28, block);
      }
      v3 = &qword_268924B30;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_2376256CC;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924B38 != -1) {
        dispatch_once(&qword_268924B38, v10);
      }
      v3 = &qword_268924B40;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237625734;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924B48 != -1) {
        dispatch_once(&qword_268924B48, v8);
      }
      v3 = &qword_268924B50;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_23762579C;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924B58 != -1) {
        dispatch_once(&qword_268924B58, v6);
      }
      v3 = &qword_268924B60;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_2376255FC;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924B18 != -1) {
        dispatch_once(&qword_268924B18, v14);
      }
      v3 = &qword_268924B20;
LABEL_18:
      id v4 = (id)*v3;
      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

- (id)noteMarkerBorderColor
{
  switch([(AKAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_237625B70;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924B78 != -1) {
        dispatch_once(&qword_268924B78, block);
      }
      v3 = &qword_268924B80;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_237625BD8;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924B88 != -1) {
        dispatch_once(&qword_268924B88, v10);
      }
      v3 = &qword_268924B90;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237625C40;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924B98 != -1) {
        dispatch_once(&qword_268924B98, v8);
      }
      v3 = &qword_268924BA0;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_237625CA8;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924BA8 != -1) {
        dispatch_once(&qword_268924BA8, v6);
      }
      v3 = &qword_268924BB0;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237625B08;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924B68 != -1) {
        dispatch_once(&qword_268924B68, v14);
      }
      v3 = &qword_268924B70;
LABEL_18:
      id v4 = (id)*v3;
      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

- (id)notesSidebarBarColor
{
  switch([(AKAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_23762607C;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924BC8 != -1) {
        dispatch_once(&qword_268924BC8, block);
      }
      v3 = &qword_268924BD0;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_2376260E4;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924BD8 != -1) {
        dispatch_once(&qword_268924BD8, v10);
      }
      v3 = &qword_268924BE0;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_23762614C;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924BE8 != -1) {
        dispatch_once(&qword_268924BE8, v8);
      }
      v3 = &qword_268924BF0;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_2376261B4;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924BF8 != -1) {
        dispatch_once(&qword_268924BF8, v6);
      }
      v3 = &qword_268924C00;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237626014;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924BB8 != -1) {
        dispatch_once(&qword_268924BB8, v14);
      }
      v3 = &qword_268924BC0;
LABEL_18:
      id v4 = (id)*v3;
      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

- (BOOL)isUnderline
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2376262AC;
  block[3] = &unk_264CDAE40;
  block[4] = self;
  if (qword_268924C08 != -1) {
    dispatch_once(&qword_268924C08, block);
  }
  return byte_268924C10;
}

- (int)annotationStyle
{
  return 4;
}

@end