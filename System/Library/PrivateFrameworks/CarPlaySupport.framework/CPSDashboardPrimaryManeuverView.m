@interface CPSDashboardPrimaryManeuverView
+ (id)instructionsForManeuver:(id)a3;
+ (id)junctionImageForManeuver:(id)a3;
+ (id)symbolImageForManeuver:(id)a3;
- (BOOL)centersManeuverInView;
- (BOOL)fitJunctionViewToHeight;
- (BOOL)hasJunctionImageBackground;
- (double)symbolImageHeight;
- (id)junctionBackgroundColor;
@end

@implementation CPSDashboardPrimaryManeuverView

+ (id)instructionsForManeuver:(id)a3
{
  id v12 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)[location[0] dashboardAttributedInstructionVariants];
  BOOL v8 = [v7 count] == 0;

  if (v8)
  {
    id v5 = (id)[location[0] dashboardInstructionVariants];
    BOOL v6 = [v5 count] == 0;

    if (v6)
    {
      v9.receiver = v12;
      v9.super_class = (Class)&OBJC_METACLASS___CPSDashboardPrimaryManeuverView;
      id v13 = objc_msgSendSuper2(&v9, sel_instructionsForManeuver_, location[0]);
    }
    else
    {
      id v13 = (id)[location[0] dashboardInstructionVariants];
    }
    int v10 = 1;
  }
  else
  {
    id v13 = (id)[location[0] attributedInstructionVariants];
    int v10 = 1;
  }
  objc_storeStrong(location, 0);
  v3 = v13;

  return v3;
}

+ (id)symbolImageForManeuver:(id)a3
{
  id v9 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = (id)[location[0] dashboardSymbolImage];

  if (v5)
  {
    id v10 = (id)[location[0] dashboardSymbolImage];
  }
  else
  {
    v6.receiver = v9;
    v6.super_class = (Class)&OBJC_METACLASS___CPSDashboardPrimaryManeuverView;
    id v10 = objc_msgSendSuper2(&v6, sel_symbolImageForManeuver_, location[0]);
  }
  int v7 = 1;
  objc_storeStrong(location, 0);
  v3 = v10;

  return v3;
}

+ (id)junctionImageForManeuver:(id)a3
{
  id v9 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = (id)[location[0] dashboardJunctionImage];

  if (v5)
  {
    id v10 = (id)[location[0] dashboardJunctionImage];
  }
  else
  {
    v6.receiver = v9;
    v6.super_class = (Class)&OBJC_METACLASS___CPSDashboardPrimaryManeuverView;
    id v10 = objc_msgSendSuper2(&v6, sel_junctionImageForManeuver_, location[0]);
  }
  int v7 = 1;
  objc_storeStrong(location, 0);
  v3 = v10;

  return v3;
}

- (BOOL)centersManeuverInView
{
  return 1;
}

- (double)symbolImageHeight
{
  return 40.0;
}

- (BOOL)hasJunctionImageBackground
{
  return 1;
}

- (id)junctionBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x263F1C550], "_carSystemQuaternaryColor", a2, self);
}

- (BOOL)fitJunctionViewToHeight
{
  return 1;
}

@end