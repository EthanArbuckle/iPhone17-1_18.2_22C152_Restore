@interface AKAnnotationThemeYellow
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

@implementation AKAnnotationThemeYellow

- (id)noteFillColor
{
  switch([(AKAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_23761F97C;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924568 != -1) {
        dispatch_once(&qword_268924568, block);
      }
      v3 = &qword_268924570;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_23761F9E4;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924578 != -1) {
        dispatch_once(&qword_268924578, v10);
      }
      v3 = &qword_268924580;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_23761FA4C;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924588 != -1) {
        dispatch_once(&qword_268924588, v8);
      }
      v3 = &qword_268924590;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_23761FAB4;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924598 != -1) {
        dispatch_once(&qword_268924598, v6);
      }
      v3 = &qword_2689245A0;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_23761F914;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924558 != -1) {
        dispatch_once(&qword_268924558, v14);
      }
      v3 = &qword_268924560;
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
      block[2] = sub_23761FE88;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_2689245B8 != -1) {
        dispatch_once(&qword_2689245B8, block);
      }
      v3 = &qword_2689245C0;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_23761FEF0;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_2689245C8 != -1) {
        dispatch_once(&qword_2689245C8, v10);
      }
      v3 = &qword_2689245D0;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_23761FF58;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_2689245D8 != -1) {
        dispatch_once(&qword_2689245D8, v8);
      }
      v3 = &qword_2689245E0;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_23761FFC0;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_2689245E8 != -1) {
        dispatch_once(&qword_2689245E8, v6);
      }
      v3 = &qword_2689245F0;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_23761FE20;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_2689245A8 != -1) {
        dispatch_once(&qword_2689245A8, v14);
      }
      v3 = &qword_2689245B0;
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
      block[2] = sub_237620394;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924608 != -1) {
        dispatch_once(&qword_268924608, block);
      }
      v3 = &qword_268924610;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_2376203FC;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924618 != -1) {
        dispatch_once(&qword_268924618, v10);
      }
      v3 = &qword_268924620;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237620464;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924628 != -1) {
        dispatch_once(&qword_268924628, v8);
      }
      v3 = &qword_268924630;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_2376204CC;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924638 != -1) {
        dispatch_once(&qword_268924638, v6);
      }
      v3 = &qword_268924640;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_23762032C;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_2689245F8 != -1) {
        dispatch_once(&qword_2689245F8, v14);
      }
      v3 = &qword_268924600;
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
      block[2] = sub_2376208A0;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924658 != -1) {
        dispatch_once(&qword_268924658, block);
      }
      v3 = &qword_268924660;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_237620908;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924668 != -1) {
        dispatch_once(&qword_268924668, v10);
      }
      v3 = &qword_268924670;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237620970;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924678 != -1) {
        dispatch_once(&qword_268924678, v8);
      }
      v3 = &qword_268924680;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_2376209D8;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924688 != -1) {
        dispatch_once(&qword_268924688, v6);
      }
      v3 = &qword_268924690;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237620838;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924648 != -1) {
        dispatch_once(&qword_268924648, v14);
      }
      v3 = &qword_268924650;
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
      block[2] = sub_237620DAC;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_2689246A8 != -1) {
        dispatch_once(&qword_2689246A8, block);
      }
      v3 = &qword_2689246B0;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_237620E14;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_2689246B8 != -1) {
        dispatch_once(&qword_2689246B8, v10);
      }
      v3 = &qword_2689246C0;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237620E7C;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_2689246C8 != -1) {
        dispatch_once(&qword_2689246C8, v8);
      }
      v3 = &qword_2689246D0;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_237620EE4;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_2689246D8 != -1) {
        dispatch_once(&qword_2689246D8, v6);
      }
      v3 = &qword_2689246E0;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237620D44;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924698 != -1) {
        dispatch_once(&qword_268924698, v14);
      }
      v3 = &qword_2689246A0;
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
      block[2] = sub_2376212B8;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_2689246F8 != -1) {
        dispatch_once(&qword_2689246F8, block);
      }
      v3 = &qword_268924700;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_237621320;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924708 != -1) {
        dispatch_once(&qword_268924708, v10);
      }
      v3 = &qword_268924710;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237621388;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924718 != -1) {
        dispatch_once(&qword_268924718, v8);
      }
      v3 = &qword_268924720;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_2376213F0;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924728 != -1) {
        dispatch_once(&qword_268924728, v6);
      }
      v3 = &qword_268924730;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_237621250;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_2689246E8 != -1) {
        dispatch_once(&qword_2689246E8, v14);
      }
      v3 = &qword_2689246F0;
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
      block[2] = sub_2376217C4;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924748 != -1) {
        dispatch_once(&qword_268924748, block);
      }
      v3 = &qword_268924750;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_23762182C;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924758 != -1) {
        dispatch_once(&qword_268924758, v10);
      }
      v3 = &qword_268924760;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_237621894;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924768 != -1) {
        dispatch_once(&qword_268924768, v8);
      }
      v3 = &qword_268924770;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_2376218FC;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924778 != -1) {
        dispatch_once(&qword_268924778, v6);
      }
      v3 = &qword_268924780;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_23762175C;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924738 != -1) {
        dispatch_once(&qword_268924738, v14);
      }
      v3 = &qword_268924740;
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
  block[2] = sub_2376219F4;
  block[3] = &unk_264CDAE40;
  block[4] = self;
  if (qword_268924788 != -1) {
    dispatch_once(&qword_268924788, block);
  }
  return byte_268924790;
}

- (int)annotationStyle
{
  return 3;
}

@end