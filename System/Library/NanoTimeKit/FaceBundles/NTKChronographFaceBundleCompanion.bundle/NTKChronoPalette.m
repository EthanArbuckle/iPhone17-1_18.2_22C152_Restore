@interface NTKChronoPalette
+ (id)interpolationFromPalette:(id)a3 toPalette:(id)a4 fraction:(double)a5;
+ (id)paletteForDevice:(id)a3 withFaceColorPalette:(id)a4;
- (BOOL)showsShadows;
- (CLKDevice)device;
- (UIColor)alternativeTickColor;
- (UIColor)backgroundColor;
- (UIColor)chronoHandColor;
- (UIColor)dateComplicationColor;
- (UIColor)foregroundColor;
- (UIColor)glyphBackgroundColor;
- (UIColor)glyphColor;
- (UIColor)inlayColor;
- (UIColor)labelColor;
- (UIColor)swatchColor;
- (UIColor)tickColor;
- (double)largeTickValue;
- (double)smallTickValue;
- (id)_initForDevice:(id)a3 withFaceColorPalette:(id)a4;
- (id)initForDevice:(id)a3;
@end

@implementation NTKChronoPalette

+ (id)paletteForDevice:(id)a3 withFaceColorPalette:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)objc_opt_class()) _initForDevice:v6 withFaceColorPalette:v5];

  return v7;
}

+ (id)interpolationFromPalette:(id)a3 toPalette:(id)a4 fraction:(double)a5
{
  id v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init((Class)a1);
  v10[1] = v9[1];
  v11 = [v8 backgroundColor];
  v12 = [v9 backgroundColor];
  uint64_t v13 = NTKInterpolateBetweenColors();
  v14 = (void *)v10[4];
  v10[4] = v13;

  v15 = [v8 foregroundColor];
  v16 = [v9 foregroundColor];
  uint64_t v17 = NTKInterpolateBetweenColors();
  v18 = (void *)v10[5];
  v10[5] = v17;

  v19 = [v8 tickColor];
  v20 = [v9 tickColor];
  uint64_t v21 = NTKInterpolateBetweenColors();
  v22 = (void *)v10[6];
  v10[6] = v21;

  v23 = [v8 alternativeTickColor];
  v24 = [v9 alternativeTickColor];
  uint64_t v25 = NTKInterpolateBetweenColors();
  v26 = (void *)v10[7];
  v10[7] = v25;

  v27 = [v8 labelColor];
  v28 = [v9 labelColor];
  uint64_t v29 = NTKInterpolateBetweenColors();
  v30 = (void *)v10[8];
  v10[8] = v29;

  v31 = [v8 chronoHandColor];
  v32 = [v9 chronoHandColor];
  uint64_t v33 = NTKInterpolateBetweenColors();
  v34 = (void *)v10[9];
  v10[9] = v33;

  v35 = [v8 inlayColor];
  v36 = [v9 inlayColor];
  uint64_t v37 = NTKInterpolateBetweenColors();
  v38 = (void *)v10[11];
  v10[11] = v37;

  v39 = [v8 dateComplicationColor];
  v40 = [v9 dateComplicationColor];
  uint64_t v41 = NTKInterpolateBetweenColors();
  v42 = (void *)v10[10];
  v10[10] = v41;

  v43 = [v8 glyphColor];
  v44 = [v9 glyphColor];
  uint64_t v45 = NTKInterpolateBetweenColors();
  v46 = (void *)v10[12];
  v10[12] = v45;

  v47 = [v8 glyphBackgroundColor];
  v48 = [v9 glyphBackgroundColor];
  uint64_t v49 = NTKInterpolateBetweenColors();
  v50 = (void *)v10[13];
  v10[13] = v49;

  [v8 largeTickValue];
  [v9 largeTickValue];
  CLKInterpolateBetweenFloatsClipped();
  v10[16] = v51;
  [v8 smallTickValue];
  [v9 smallTickValue];
  CLKInterpolateBetweenFloatsClipped();
  v10[15] = v52;
  if (a5 >= 0.5) {
    v53 = v9;
  }
  else {
    v53 = v8;
  }
  *((unsigned char *)v10 + 16) = [v53 showsShadows];

  return v10;
}

- (id)initForDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKChronoPalette;
  id v6 = [(NTKChronoPalette *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (id)_initForDevice:(id)a3 withFaceColorPalette:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NTKChronoPalette *)self initForDevice:v6];
  if (!v8) {
    goto LABEL_54;
  }
  objc_super v9 = [v7 configuration];
  v10 = [v9 colorOption];
  *((void *)v8 + 1) = +[NTKPaletteColorEditOption colorValueForColorName:v10];

  uint64_t v11 = *((void *)v8 + 1);
  v12 = +[UIColor colorWithWhite:0.541176471 alpha:1.0];
  id obj = +[UIColor colorWithWhite:0.149019608 alpha:1.0];
  switch(*((void *)v8 + 1))
  {
    case 1:
      double v14 = 0.0196078431;
      double v15 = 0.0823529412;
      double v16 = 0.141176471;
      goto LABEL_11;
    case 2:
      double v14 = 0.121568627;
      double v15 = 0.062745098;
      double v16 = 0.0;
      goto LABEL_11;
    case 3:
      double v14 = 0.0392156863;
      double v15 = 0.101960784;
      double v16 = 0.031372549;
      goto LABEL_11;
    case 4:
      double v14 = 0.0980392157;
      double v16 = 0.101960784;
      double v17 = 1.0;
      double v15 = 0.0980392157;
      goto LABEL_12;
    case 5:
      double v14 = 0.862745098;
      double v15 = 0.874509804;
      double v16 = 0.878431373;
      goto LABEL_11;
    case 6:
      double v14 = 0.960784314;
      double v15 = 0.945098039;
      double v16 = 0.82745098;
      goto LABEL_11;
    case 8:
      double v14 = 0.815686275;
      double v15 = 0.909803922;
      double v16 = 0.960784314;
LABEL_11:
      double v17 = 1.0;
LABEL_12:
      uint64_t v13 = +[UIColor colorWithRed:v14 green:v15 blue:v16 alpha:v17];
      break;
    default:
      uint64_t v13 = +[UIColor blackColor];
      break;
  }
  v18 = (void *)*((void *)v8 + 4);
  *((void *)v8 + 4) = v13;

  uint64_t v19 = +[UIColor systemOrangeColor];
  v20 = (void *)*((void *)v8 + 10);
  *((void *)v8 + 10) = v19;

  uint64_t v21 = +[UIColor systemOrangeColor];
  v23 = (id *)(v8 + 72);
  v22 = (void *)*((void *)v8 + 9);
  *((void *)v8 + 9) = v21;

  v24 = (void **)(v8 + 96);
  v86 = v12;
  objc_storeStrong((id *)v8 + 12, v12);
  v89 = (void **)(v8 + 104);
  objc_storeStrong((id *)v8 + 13, obj);
  *(_OWORD *)(v8 + 120) = xmmword_16C80;
  id v85 = v6;
  v84 = (char *)[v6 materialType];
  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x2020000000;
  uint64_t v102 = 0x3FF0000000000000;
  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472;
  v96[2] = sub_9FD4;
  v96[3] = &unk_1C788;
  v98 = &v99;
  uint64_t v25 = v8;
  v97 = v25;
  v88 = objc_retainBlock(v96);
  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472;
  v93[2] = sub_A13C;
  v93[3] = &unk_1C788;
  v95 = &v99;
  v26 = v25;
  v94 = v26;
  v87 = objc_retainBlock(v93);
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_A2A4;
  v91[3] = &unk_1C7B0;
  v27 = v26;
  v92 = v27;
  v28 = objc_retainBlock(v91);
  uint64_t v29 = v28;
  switch(v11)
  {
    case 0:
      v28 = v88;
      if (v84 != (unsigned char *)&dword_4 + 1)
      {
        v28 = v87;
        if (v84 != (unsigned char *)&dword_4 + 2) {
          v28 = v29;
        }
      }
      goto LABEL_23;
    case 1:
    case 2:
    case 3:
    case 4:
      uint64_t v38 = +[UIColor whiteColor];
      id v39 = v27[5];
      v27[5] = (id)v38;

      uint64_t v40 = +[UIColor whiteColor];
      id v41 = v27[6];
      v27[6] = (id)v40;

      id v42 = v27[5];
      v43 = v27 + 8;
      goto LABEL_17;
    case 5:
    case 6:
    case 8:
      uint64_t v44 = +[UIColor blackColor];
      id v45 = v27[5];
      v27[5] = (id)v44;

      uint64_t v46 = +[UIColor whiteColor];
      id v47 = v27[6];
      v27[6] = (id)v46;

      objc_storeStrong(v27 + 8, v27[5]);
      __asm { FMOV            V1.2D, #1.0 }
      *(float64x2_t *)(v8 + 120) = vsubq_f64(_Q1, *(float64x2_t *)(v8 + 120));
      uint64_t v53 = +[UIColor colorWithRed:0.815686275 green:0.450980392 blue:0.0 alpha:1.0];
      id v54 = *v23;
      id *v23 = (id)v53;

      id v42 = *v23;
      v43 = (id *)(v8 + 80);
LABEL_17:
      objc_storeStrong(v43, v42);
      *((unsigned char *)v27 + 16) = 1;
      goto LABEL_18;
    case 7:
      uint64_t v58 = +[UIColor whiteColor];
      id v59 = v27[5];
      v27[5] = (id)v58;

      uint64_t v60 = [v7 primaryColor];
      id v61 = v27[6];
      v27[6] = (id)v60;

      uint64_t v62 = +[UIColor whiteColor];
      id v63 = v27[7];
      v27[7] = (id)v62;

      objc_storeStrong(v27 + 8, v27[5]);
      *((unsigned char *)v27 + 16) = 1;
      objc_storeStrong((id *)v8 + 9, v27[6]);
      objc_storeStrong((id *)v8 + 10, *v23);
      v100[3] = 0x4010000000000000;
LABEL_25:
      uint64_t v64 = objc_msgSend(v7, "primaryColor", v84);
      double v65 = 0.0745098039;
      double v66 = 0.156862745;
      double v67 = 0.349019608;
LABEL_33:
      v68 = *v24;
      void *v24 = (void *)v64;

      uint64_t v57 = +[UIColor colorWithRed:v67 green:v66 blue:v65 alpha:1.0];
LABEL_34:
      v69 = *v89;
      *v89 = (void *)v57;

      goto LABEL_35;
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 19:
    case 20:
      uint64_t v30 = [v7 primaryColor];
      id v31 = v27[5];
      v27[5] = (id)v30;

      objc_storeStrong(v27 + 6, v27[5]);
      *((void *)v8 + 15) = 0x3FE0000000000000;
      uint64_t v32 = +[UIColor whiteColor];
      id v33 = v27[7];
      v27[7] = (id)v32;

      uint64_t v34 = +[UIColor whiteColor];
      id v35 = v27[8];
      v27[8] = (id)v34;

      *((unsigned char *)v27 + 16) = 1;
      uint64_t v36 = +[UIColor whiteColor];
      id v37 = *v23;
      id *v23 = (id)v36;

      objc_storeStrong((id *)v8 + 10, v27[5]);
      v100[3] = 0x4010000000000000;
      goto LABEL_18;
    case 18:
LABEL_23:
      ((void (*)(void))v28[2])();
      goto LABEL_35;
    default:
LABEL_18:
      switch(v11)
      {
        case 1:
          uint64_t v64 = +[UIColor colorWithRed:0.2 green:0.345098039 blue:0.478431373 alpha:1.0];
          double v67 = 0.0;
          double v65 = 0.239215686;
          double v66 = 0.125490196;
          goto LABEL_33;
        case 2:
          uint64_t v64 = +[UIColor colorWithRed:0.458823529 green:0.298039216 blue:0.129411765 alpha:1.0];
          double v65 = 0.0352941176;
          double v66 = 0.101960784;
          double v67 = 0.168627451;
          goto LABEL_33;
        case 3:
          uint64_t v64 = +[UIColor colorWithRed:0.219607843 green:0.380392157 blue:0.196078431 alpha:1.0];
          double v65 = 0.0431372549;
          double v66 = 0.141176471;
          double v67 = 0.0549019608;
          goto LABEL_33;
        case 4:
          uint64_t v64 = +[UIColor colorWithRed:0.42745098 green:0.42745098 blue:0.450980392 alpha:1.0];
          double v65 = 0.141176471;
          double v67 = 0.133333333;
          double v66 = 0.133333333;
          goto LABEL_33;
        case 5:
          uint64_t v64 = +[UIColor colorWithRed:0.537254902 green:0.549019608 blue:0.549019608 alpha:1.0];
          double v66 = 0.160784314;
          double v67 = 0.156862745;
          double v65 = 0.160784314;
          goto LABEL_33;
        case 6:
          uint64_t v64 = +[UIColor colorWithRed:0.650980392 green:0.611764706 blue:0.423529412 alpha:1.0];
          double v65 = 0.152941176;
          double v66 = 0.176470588;
          double v67 = 0.180392157;
          goto LABEL_33;
        case 7:
          goto LABEL_25;
        case 8:
          uint64_t v64 = +[UIColor colorWithRed:0.466666667 green:0.521568627 blue:0.552941176 alpha:1.0];
          double v65 = 0.180392157;
          double v66 = 0.168627451;
          double v67 = 0.152941176;
          goto LABEL_33;
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 19:
        case 20:
          uint64_t v55 = [v7 primaryColor];
          v56 = *v24;
          void *v24 = (void *)v55;

          uint64_t v57 = NTKColorByPremultiplyingAlpha();
          goto LABEL_34;
        default:
          break;
      }
LABEL_35:
      uint64_t v70 = NTKColorByBrightening();
      id v71 = v27[6];
      v27[6] = (id)v70;

      v72 = v27 + 7;
      if (!v27[7]) {
        objc_storeStrong(v27 + 7, v27[6]);
      }
      uint64_t v73 = NTKColorByBrightening();
      v74 = *v72;
      *v72 = (void *)v73;

      if ((unint64_t)(v11 - 9) < 9 || v11 == 20)
      {
        id v75 = +[UIColor blackColor];
      }
      else
      {
        if (v11 == 7)
        {
          uint64_t v79 = [v7 primaryColor];
          id v80 = v27[11];
          v27[11] = (id)v79;

          goto LABEL_51;
        }
        id v75 = *((id *)v8 + 4);
      }
      id v76 = v27[11];
      v27[11] = v75;

      if (v11 > 7)
      {
        if (v11 != 8)
        {
          if (v11 != 18) {
            goto LABEL_51;
          }
          v78 = *v89;
LABEL_52:
          v77 = v27 + 14;
          goto LABEL_53;
        }
LABEL_47:
        v78 = (void *)*((void *)v8 + 4);
        goto LABEL_52;
      }
      if ((unint64_t)(v11 - 5) < 2) {
        goto LABEL_47;
      }
      if (v11)
      {
LABEL_51:
        v78 = *v24;
        goto LABEL_52;
      }
      v77 = v27 + 14;
      if ((unint64_t)(v84 - 5) > 1) {
        v78 = *v89;
      }
      else {
        v78 = *v24;
      }
LABEL_53:
      id v6 = v85;
      id v81 = v78;
      v82 = *v77;
      *v77 = v81;

      _Block_object_dispose(&v99, 8);
LABEL_54:

      return v8;
  }
}

- (CLKDevice)device
{
  return self->_device;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (UIColor)tickColor
{
  return self->_tickColor;
}

- (UIColor)alternativeTickColor
{
  return self->_alternativeTickColor;
}

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (UIColor)chronoHandColor
{
  return self->_chronoHandColor;
}

- (UIColor)dateComplicationColor
{
  return self->_dateComplicationColor;
}

- (UIColor)inlayColor
{
  return self->_inlayColor;
}

- (UIColor)glyphColor
{
  return self->_glyphColor;
}

- (UIColor)glyphBackgroundColor
{
  return self->_glyphBackgroundColor;
}

- (UIColor)swatchColor
{
  return self->_swatchColor;
}

- (double)smallTickValue
{
  return self->_smallTickValue;
}

- (double)largeTickValue
{
  return self->_largeTickValue;
}

- (BOOL)showsShadows
{
  return self->_showsShadows;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swatchColor, 0);
  objc_storeStrong((id *)&self->_glyphBackgroundColor, 0);
  objc_storeStrong((id *)&self->_glyphColor, 0);
  objc_storeStrong((id *)&self->_inlayColor, 0);
  objc_storeStrong((id *)&self->_dateComplicationColor, 0);
  objc_storeStrong((id *)&self->_chronoHandColor, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_alternativeTickColor, 0);
  objc_storeStrong((id *)&self->_tickColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end