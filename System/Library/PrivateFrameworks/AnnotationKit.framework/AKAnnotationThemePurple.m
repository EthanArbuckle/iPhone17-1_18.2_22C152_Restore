@interface AKAnnotationThemePurple
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

@implementation AKAnnotationThemePurple

- (id)noteFillColor
{
  switch([(AKAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_237621DD8;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_2689247A8 != -1) {
        dispatch_once(&qword_2689247A8, block);
      }
      v3 = &qword_2689247B0;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_237621E40;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_2689247B8 != -1) {
        dispatch_once(&qword_2689247B8, v10);
      }
      v3 = &qword_2689247C0;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237621EA8;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_2689247C8 != -1) {
        dispatch_once(&qword_2689247C8, v8);
      }
      v3 = &qword_2689247D0;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_237621F10;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_2689247D8 != -1) {
        dispatch_once(&qword_2689247D8, v6);
      }
      v3 = &qword_2689247E0;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237621D70;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924798 != -1) {
        dispatch_once(&qword_268924798, v14);
      }
      v3 = &qword_2689247A0;
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
      block[2] = sub_2376222E4;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_2689247F8 != -1) {
        dispatch_once(&qword_2689247F8, block);
      }
      v3 = &qword_268924800;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_23762234C;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924808 != -1) {
        dispatch_once(&qword_268924808, v10);
      }
      v3 = &qword_268924810;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_2376223B4;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924818 != -1) {
        dispatch_once(&qword_268924818, v8);
      }
      v3 = &qword_268924820;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_23762241C;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924828 != -1) {
        dispatch_once(&qword_268924828, v6);
      }
      v3 = &qword_268924830;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_23762227C;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_2689247E8 != -1) {
        dispatch_once(&qword_2689247E8, v14);
      }
      v3 = &qword_2689247F0;
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
      block[2] = sub_2376227F0;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924848 != -1) {
        dispatch_once(&qword_268924848, block);
      }
      v3 = &qword_268924850;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_237622858;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924858 != -1) {
        dispatch_once(&qword_268924858, v10);
      }
      v3 = &qword_268924860;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_2376228C0;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924868 != -1) {
        dispatch_once(&qword_268924868, v8);
      }
      v3 = &qword_268924870;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_237622928;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924878 != -1) {
        dispatch_once(&qword_268924878, v6);
      }
      v3 = &qword_268924880;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237622788;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924838 != -1) {
        dispatch_once(&qword_268924838, v14);
      }
      v3 = &qword_268924840;
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
      block[2] = sub_237622CFC;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924898 != -1) {
        dispatch_once(&qword_268924898, block);
      }
      v3 = &qword_2689248A0;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_237622D64;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_2689248A8 != -1) {
        dispatch_once(&qword_2689248A8, v10);
      }
      v3 = &qword_2689248B0;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237622DCC;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_2689248B8 != -1) {
        dispatch_once(&qword_2689248B8, v8);
      }
      v3 = &qword_2689248C0;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_237622E34;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_2689248C8 != -1) {
        dispatch_once(&qword_2689248C8, v6);
      }
      v3 = &qword_2689248D0;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237622C94;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924888 != -1) {
        dispatch_once(&qword_268924888, v14);
      }
      v3 = &qword_268924890;
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
      block[2] = sub_237623208;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_2689248E8 != -1) {
        dispatch_once(&qword_2689248E8, block);
      }
      v3 = &qword_2689248F0;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_237623270;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_2689248F8 != -1) {
        dispatch_once(&qword_2689248F8, v10);
      }
      v3 = &qword_268924900;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_2376232D8;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924908 != -1) {
        dispatch_once(&qword_268924908, v8);
      }
      v3 = &qword_268924910;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_237623340;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924918 != -1) {
        dispatch_once(&qword_268924918, v6);
      }
      v3 = &qword_268924920;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_2376231A0;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_2689248D8 != -1) {
        dispatch_once(&qword_2689248D8, v14);
      }
      v3 = &qword_2689248E0;
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
      block[2] = sub_237623714;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924938 != -1) {
        dispatch_once(&qword_268924938, block);
      }
      v3 = &qword_268924940;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_23762377C;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924948 != -1) {
        dispatch_once(&qword_268924948, v10);
      }
      v3 = &qword_268924950;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_2376237E4;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924958 != -1) {
        dispatch_once(&qword_268924958, v8);
      }
      v3 = &qword_268924960;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_23762384C;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924968 != -1) {
        dispatch_once(&qword_268924968, v6);
      }
      v3 = &qword_268924970;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_2376236AC;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924928 != -1) {
        dispatch_once(&qword_268924928, v14);
      }
      v3 = &qword_268924930;
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
      block[2] = sub_237623C20;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924988 != -1) {
        dispatch_once(&qword_268924988, block);
      }
      v3 = &qword_268924990;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_237623C88;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924998 != -1) {
        dispatch_once(&qword_268924998, v10);
      }
      v3 = &qword_2689249A0;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237623CF0;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_2689249A8 != -1) {
        dispatch_once(&qword_2689249A8, v8);
      }
      v3 = &qword_2689249B0;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_237623D58;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_2689249B8 != -1) {
        dispatch_once(&qword_2689249B8, v6);
      }
      v3 = &qword_2689249C0;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237623BB8;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924978 != -1) {
        dispatch_once(&qword_268924978, v14);
      }
      v3 = &qword_268924980;
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
  block[2] = sub_237623E50;
  block[3] = &unk_264CDAE40;
  block[4] = self;
  if (qword_2689249C8 != -1) {
    dispatch_once(&qword_2689249C8, block);
  }
  return byte_2689249D0;
}

- (int)annotationStyle
{
  return 5;
}

@end