@interface AKAnnotationThemeUnderline
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

@implementation AKAnnotationThemeUnderline

- (id)noteFillColor
{
  switch([(AKAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_237626690;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924C28 != -1) {
        dispatch_once(&qword_268924C28, block);
      }
      v3 = &qword_268924C30;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_2376266F8;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924C38 != -1) {
        dispatch_once(&qword_268924C38, v10);
      }
      v3 = &qword_268924C40;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237626760;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924C48 != -1) {
        dispatch_once(&qword_268924C48, v8);
      }
      v3 = &qword_268924C50;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_2376267C8;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924C58 != -1) {
        dispatch_once(&qword_268924C58, v6);
      }
      v3 = &qword_268924C60;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237626628;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924C18 != -1) {
        dispatch_once(&qword_268924C18, v14);
      }
      v3 = &qword_268924C20;
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
      block[2] = sub_237626B9C;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924C78 != -1) {
        dispatch_once(&qword_268924C78, block);
      }
      v3 = &qword_268924C80;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_237626C04;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924C88 != -1) {
        dispatch_once(&qword_268924C88, v10);
      }
      v3 = &qword_268924C90;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237626C6C;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924C98 != -1) {
        dispatch_once(&qword_268924C98, v8);
      }
      v3 = &qword_268924CA0;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_237626CD4;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924CA8 != -1) {
        dispatch_once(&qword_268924CA8, v6);
      }
      v3 = &qword_268924CB0;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237626B34;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924C68 != -1) {
        dispatch_once(&qword_268924C68, v14);
      }
      v3 = &qword_268924C70;
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
      block[2] = sub_2376270A8;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924CC8 != -1) {
        dispatch_once(&qword_268924CC8, block);
      }
      v3 = &qword_268924CD0;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_237627110;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924CD8 != -1) {
        dispatch_once(&qword_268924CD8, v10);
      }
      v3 = &qword_268924CE0;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237627178;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924CE8 != -1) {
        dispatch_once(&qword_268924CE8, v8);
      }
      v3 = &qword_268924CF0;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_2376271E0;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924CF8 != -1) {
        dispatch_once(&qword_268924CF8, v6);
      }
      v3 = &qword_268924D00;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237627040;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924CB8 != -1) {
        dispatch_once(&qword_268924CB8, v14);
      }
      v3 = &qword_268924CC0;
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
      block[2] = sub_2376275B4;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924D18 != -1) {
        dispatch_once(&qword_268924D18, block);
      }
      v3 = &qword_268924D20;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_23762761C;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924D28 != -1) {
        dispatch_once(&qword_268924D28, v10);
      }
      v3 = &qword_268924D30;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237627684;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924D38 != -1) {
        dispatch_once(&qword_268924D38, v8);
      }
      v3 = &qword_268924D40;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_2376276EC;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924D48 != -1) {
        dispatch_once(&qword_268924D48, v6);
      }
      v3 = &qword_268924D50;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_23762754C;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924D08 != -1) {
        dispatch_once(&qword_268924D08, v14);
      }
      v3 = &qword_268924D10;
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
      block[2] = sub_237627AC0;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924D68 != -1) {
        dispatch_once(&qword_268924D68, block);
      }
      v3 = &qword_268924D70;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_237627B28;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924D78 != -1) {
        dispatch_once(&qword_268924D78, v10);
      }
      v3 = &qword_268924D80;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237627B90;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924D88 != -1) {
        dispatch_once(&qword_268924D88, v8);
      }
      v3 = &qword_268924D90;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_237627BF8;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924D98 != -1) {
        dispatch_once(&qword_268924D98, v6);
      }
      v3 = &qword_268924DA0;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237627A58;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924D58 != -1) {
        dispatch_once(&qword_268924D58, v14);
      }
      v3 = &qword_268924D60;
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
      block[2] = sub_237627FCC;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924DB8 != -1) {
        dispatch_once(&qword_268924DB8, block);
      }
      v3 = &qword_268924DC0;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_237628034;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924DC8 != -1) {
        dispatch_once(&qword_268924DC8, v10);
      }
      v3 = &qword_268924DD0;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_23762809C;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924DD8 != -1) {
        dispatch_once(&qword_268924DD8, v8);
      }
      v3 = &qword_268924DE0;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_237628104;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924DE8 != -1) {
        dispatch_once(&qword_268924DE8, v6);
      }
      v3 = &qword_268924DF0;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237627F64;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924DA8 != -1) {
        dispatch_once(&qword_268924DA8, v14);
      }
      v3 = &qword_268924DB0;
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
      block[2] = sub_2376284D8;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924E08 != -1) {
        dispatch_once(&qword_268924E08, block);
      }
      v3 = &qword_268924E10;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_237628540;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924E18 != -1) {
        dispatch_once(&qword_268924E18, v10);
      }
      v3 = &qword_268924E20;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_2376285A8;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924E28 != -1) {
        dispatch_once(&qword_268924E28, v8);
      }
      v3 = &qword_268924E30;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_237628610;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924E38 != -1) {
        dispatch_once(&qword_268924E38, v6);
      }
      v3 = &qword_268924E40;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237628470;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924DF8 != -1) {
        dispatch_once(&qword_268924DF8, v14);
      }
      v3 = &qword_268924E00;
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
  block[2] = sub_237628708;
  block[3] = &unk_264CDAE40;
  block[4] = self;
  if (qword_268924E48 != -1) {
    dispatch_once(&qword_268924E48, block);
  }
  return byte_268924E50;
}

- (int)annotationStyle
{
  return 0;
}

@end