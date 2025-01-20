@interface AKAnnotationThemeBlue
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

@implementation AKAnnotationThemeBlue

- (id)noteFillColor
{
  switch([(AKAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_23761D520;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924328 != -1) {
        dispatch_once(&qword_268924328, block);
      }
      v3 = &qword_268924330;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_23761D588;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924338 != -1) {
        dispatch_once(&qword_268924338, v10);
      }
      v3 = &qword_268924340;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_23761D5F0;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924348 != -1) {
        dispatch_once(&qword_268924348, v8);
      }
      v3 = &qword_268924350;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_23761D658;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924358 != -1) {
        dispatch_once(&qword_268924358, v6);
      }
      v3 = &qword_268924360;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_23761D4B8;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924318 != -1) {
        dispatch_once(&qword_268924318, v14);
      }
      v3 = &qword_268924320;
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
      block[2] = sub_23761DA2C;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924378 != -1) {
        dispatch_once(&qword_268924378, block);
      }
      v3 = &qword_268924380;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_23761DA94;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924388 != -1) {
        dispatch_once(&qword_268924388, v10);
      }
      v3 = &qword_268924390;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_23761DAFC;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924398 != -1) {
        dispatch_once(&qword_268924398, v8);
      }
      v3 = &qword_2689243A0;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_23761DB64;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_2689243A8 != -1) {
        dispatch_once(&qword_2689243A8, v6);
      }
      v3 = &qword_2689243B0;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_23761D9C4;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924368 != -1) {
        dispatch_once(&qword_268924368, v14);
      }
      v3 = &qword_268924370;
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
      block[2] = sub_23761DF38;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_2689243C8 != -1) {
        dispatch_once(&qword_2689243C8, block);
      }
      v3 = &qword_2689243D0;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_23761DFA0;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_2689243D8 != -1) {
        dispatch_once(&qword_2689243D8, v10);
      }
      v3 = &qword_2689243E0;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_23761E008;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_2689243E8 != -1) {
        dispatch_once(&qword_2689243E8, v8);
      }
      v3 = &qword_2689243F0;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_23761E070;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_2689243F8 != -1) {
        dispatch_once(&qword_2689243F8, v6);
      }
      v3 = &qword_268924400;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_23761DED0;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_2689243B8 != -1) {
        dispatch_once(&qword_2689243B8, v14);
      }
      v3 = &qword_2689243C0;
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
      block[2] = sub_23761E444;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924418 != -1) {
        dispatch_once(&qword_268924418, block);
      }
      v3 = &qword_268924420;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_23761E4AC;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924428 != -1) {
        dispatch_once(&qword_268924428, v10);
      }
      v3 = &qword_268924430;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_23761E514;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924438 != -1) {
        dispatch_once(&qword_268924438, v8);
      }
      v3 = &qword_268924440;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_23761E57C;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924448 != -1) {
        dispatch_once(&qword_268924448, v6);
      }
      v3 = &qword_268924450;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_23761E3DC;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924408 != -1) {
        dispatch_once(&qword_268924408, v14);
      }
      v3 = &qword_268924410;
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
      block[2] = sub_23761E950;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924468 != -1) {
        dispatch_once(&qword_268924468, block);
      }
      v3 = &qword_268924470;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_23761E9B8;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924478 != -1) {
        dispatch_once(&qword_268924478, v10);
      }
      v3 = &qword_268924480;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_23761EA20;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924488 != -1) {
        dispatch_once(&qword_268924488, v8);
      }
      v3 = &qword_268924490;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_23761EA88;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924498 != -1) {
        dispatch_once(&qword_268924498, v6);
      }
      v3 = &qword_2689244A0;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_23761E8E8;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_268924458 != -1) {
        dispatch_once(&qword_268924458, v14);
      }
      v3 = &qword_268924460;
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
      block[2] = sub_23761EE5C;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_2689244B8 != -1) {
        dispatch_once(&qword_2689244B8, block);
      }
      v3 = &qword_2689244C0;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_23761EEC4;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_2689244C8 != -1) {
        dispatch_once(&qword_2689244C8, v10);
      }
      v3 = &qword_2689244D0;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_23761EF2C;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_2689244D8 != -1) {
        dispatch_once(&qword_2689244D8, v8);
      }
      v3 = &qword_2689244E0;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_23761EF94;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_2689244E8 != -1) {
        dispatch_once(&qword_2689244E8, v6);
      }
      v3 = &qword_2689244F0;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_23761EDF4;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_2689244A8 != -1) {
        dispatch_once(&qword_2689244A8, v14);
      }
      v3 = &qword_2689244B0;
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
      block[2] = sub_23761F368;
      block[3] = &unk_264CDAE18;
      block[4] = self;
      int v13 = 0;
      if (qword_268924508 != -1) {
        dispatch_once(&qword_268924508, block);
      }
      v3 = &qword_268924510;
      goto LABEL_18;
    case 1:
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = sub_23761F3D0;
      v10[3] = &unk_264CDAE18;
      v10[4] = self;
      int v11 = 1;
      if (qword_268924518 != -1) {
        dispatch_once(&qword_268924518, v10);
      }
      v3 = &qword_268924520;
      goto LABEL_18;
    case 2:
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = sub_23761F438;
      v8[3] = &unk_264CDAE18;
      v8[4] = self;
      int v9 = 2;
      if (qword_268924528 != -1) {
        dispatch_once(&qword_268924528, v8);
      }
      v3 = &qword_268924530;
      goto LABEL_18;
    case 3:
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = sub_23761F4A0;
      v6[3] = &unk_264CDAE18;
      v6[4] = self;
      int v7 = 3;
      if (qword_268924538 != -1) {
        dispatch_once(&qword_268924538, v6);
      }
      v3 = &qword_268924540;
      goto LABEL_18;
    case 4:
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_23761F300;
      v14[3] = &unk_264CDAE18;
      v14[4] = self;
      int v15 = 4;
      if (qword_2689244F8 != -1) {
        dispatch_once(&qword_2689244F8, v14);
      }
      v3 = &qword_268924500;
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
  block[2] = sub_23761F598;
  block[3] = &unk_264CDAE40;
  block[4] = self;
  if (qword_268924548 != -1) {
    dispatch_once(&qword_268924548, block);
  }
  return byte_268924550;
}

- (int)annotationStyle
{
  return 2;
}

@end