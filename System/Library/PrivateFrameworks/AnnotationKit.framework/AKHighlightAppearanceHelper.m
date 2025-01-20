@interface AKHighlightAppearanceHelper
+ (BOOL)highlightColor:(id)a3 isEquivalentToHighlightColor:(id)a4;
+ (id)borderColorForNoteOfHighlightAttributeTag:(int64_t)a3;
+ (id)colorForHighlightAttributeWithTag:(int64_t)a3;
+ (id)colorForNoteOfHighlightAttributeTag:(int64_t)a3;
+ (int)annotationStyleForHighlightAttributeWithTag:(int64_t)a3;
+ (int64_t)attributeTagForHighlightOfColor:(id)a3;
+ (int64_t)attributeTagForNoteOfColor:(id)a3;
@end

@implementation AKHighlightAppearanceHelper

+ (int)annotationStyleForHighlightAttributeWithTag:(int64_t)a3
{
  if ((unint64_t)(a3 - 765200) > 6) {
    return 0;
  }
  else {
    return dword_2376F4558[a3 - 765200];
  }
}

+ (id)colorForHighlightAttributeWithTag:(int64_t)a3
{
  switch(a3)
  {
    case 765200:
      v3 = +[AKAnnotationTheme yellowTheme:0];
      goto LABEL_9;
    case 765201:
      v3 = +[AKAnnotationTheme greenTheme:0];
      goto LABEL_9;
    case 765202:
      v3 = +[AKAnnotationTheme blueTheme:0];
      goto LABEL_9;
    case 765203:
      v3 = +[AKAnnotationTheme pinkTheme:0];
      goto LABEL_9;
    case 765204:
      v3 = +[AKAnnotationTheme purpleTheme:0];
      goto LABEL_9;
    case 765205:
    case 765206:
      v3 = +[AKAnnotationTheme underlineTheme:0];
LABEL_9:
      v5 = v3;
      v4 = [v3 highlightColor];

      break;
    default:
      v4 = 0;
      break;
  }

  return v4;
}

+ (int64_t)attributeTagForHighlightOfColor:(id)a3
{
  v13[12] = *MEMORY[0x263EF8340];
  int64_t v4 = 763000;
  id v5 = a3;
  uint64_t v6 = 0;
  v13[1] = 0;
  v13[3] = 0;
  v13[5] = 0;
  v13[7] = 0;
  v13[9] = 0;
  v13[0] = 765200;
  v13[2] = 765201;
  v13[4] = 765202;
  v13[6] = 765203;
  v13[8] = 765204;
  v13[10] = 765206;
  v13[11] = 0;
  do
  {
    v7 = [a1 colorForHighlightAttributeWithTag:v13[v6]];
    [v5 akDistanceFromColor:v7];
    v13[v6 + 1] = v8;

    v6 += 2;
  }
  while (v6 != 12);
  uint64_t v9 = 0;
  v10 = 0;
  double v11 = 1.79769313e308;
  do
  {
    if (*(double *)&v13[v9 + 1] < v11)
    {
      double v11 = *(double *)&v13[v9 + 1];
      v10 = &v13[v9];
    }
    v9 += 2;
  }
  while (v9 != 12);
  if (*((double *)v10 + 1) < 28.0) {
    int64_t v4 = *v10;
  }

  return v4;
}

+ (id)colorForNoteOfHighlightAttributeTag:(int64_t)a3
{
  switch(a3)
  {
    case 765200:
      v3 = +[AKAnnotationTheme yellowTheme:0];
      goto LABEL_9;
    case 765201:
      v3 = +[AKAnnotationTheme greenTheme:0];
      goto LABEL_9;
    case 765202:
      v3 = +[AKAnnotationTheme blueTheme:0];
      goto LABEL_9;
    case 765203:
      v3 = +[AKAnnotationTheme pinkTheme:0];
      goto LABEL_9;
    case 765204:
      v3 = +[AKAnnotationTheme purpleTheme:0];
      goto LABEL_9;
    case 765205:
    case 765206:
      v3 = +[AKAnnotationTheme underlineTheme:0];
LABEL_9:
      id v5 = v3;
      int64_t v4 = [v3 noteFillColor];

      break;
    default:
      int64_t v4 = 0;
      break;
  }

  return v4;
}

+ (int64_t)attributeTagForNoteOfColor:(id)a3
{
  v13[12] = *MEMORY[0x263EF8340];
  int64_t v4 = 763000;
  id v5 = a3;
  uint64_t v6 = 0;
  v13[1] = 0;
  v13[3] = 0;
  v13[5] = 0;
  v13[7] = 0;
  v13[9] = 0;
  v13[0] = 765200;
  v13[2] = 765201;
  v13[4] = 765202;
  v13[6] = 765203;
  v13[8] = 765204;
  v13[10] = 765206;
  v13[11] = 0;
  do
  {
    v7 = [a1 colorForNoteOfHighlightAttributeTag:v13[v6]];
    [v5 akDistanceFromColor:v7];
    v13[v6 + 1] = v8;

    v6 += 2;
  }
  while (v6 != 12);
  uint64_t v9 = 0;
  v10 = 0;
  double v11 = 1.79769313e308;
  do
  {
    if (*(double *)&v13[v9 + 1] < v11)
    {
      double v11 = *(double *)&v13[v9 + 1];
      v10 = &v13[v9];
    }
    v9 += 2;
  }
  while (v9 != 12);
  if (*((double *)v10 + 1) < 28.0) {
    int64_t v4 = *v10;
  }

  return v4;
}

+ (id)borderColorForNoteOfHighlightAttributeTag:(int64_t)a3
{
  switch(a3)
  {
    case 765200:
      v3 = +[AKAnnotationTheme yellowTheme:0];
      goto LABEL_9;
    case 765201:
      v3 = +[AKAnnotationTheme greenTheme:0];
      goto LABEL_9;
    case 765202:
      v3 = +[AKAnnotationTheme blueTheme:0];
      goto LABEL_9;
    case 765203:
      v3 = +[AKAnnotationTheme pinkTheme:0];
      goto LABEL_9;
    case 765204:
      v3 = +[AKAnnotationTheme purpleTheme:0];
      goto LABEL_9;
    case 765205:
    case 765206:
      v3 = +[AKAnnotationTheme underlineTheme:0];
LABEL_9:
      id v5 = v3;
      int64_t v4 = [v3 noteBorderColor];

      break;
    default:
      int64_t v4 = 0;
      break;
  }

  return v4;
}

+ (BOOL)highlightColor:(id)a3 isEquivalentToHighlightColor:(id)a4
{
  return MEMORY[0x270F9A6D0](a3, sel_akHasHueEqualToColor_withTolerance_);
}

@end