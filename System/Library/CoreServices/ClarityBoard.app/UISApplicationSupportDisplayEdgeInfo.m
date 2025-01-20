@interface UISApplicationSupportDisplayEdgeInfo
+ (id)_clb_displayEdgeInfoForScreenType:(unint64_t)a3;
+ (id)clb_displayEdgeInfoForScreenType:(unint64_t)a3;
+ (id)clb_thisDeviceDisplayEdgeInfo;
- (UIEdgeInsets)clb_displayBasedSafeAreaInsets;
- (void)clb_applyDisplayEdgeInfoToSceneSettings:(id)a3;
@end

@implementation UISApplicationSupportDisplayEdgeInfo

+ (id)clb_displayEdgeInfoForScreenType:(unint64_t)a3
{
  v5 = objc_msgSend(a1, "_clb_displayEdgeInfoForScreenType:");
  if (sub_1000254A0(a3))
  {
    char v6 = sub_100025470(a3);
    if (a3 - 29 >= 0xFFFFFFFFFFFFFFF8 && (v6 & 1) == 0)
    {
      uint64_t v7 = sub_100013FEC();
      if (v7 != a3)
      {
        uint64_t v8 = v7;
        uint64_t v26 = 0;
        memset(v25, 0, sizeof(v25));
        sub_1000254CC(a3, (uint64_t)v25);
        uint64_t v24 = 0;
        memset(v23, 0, sizeof(v23));
        sub_1000254CC(v8, (uint64_t)v23);
        double v9 = *(double *)v25 / *(double *)v23;
        v10 = objc_msgSend(a1, "_clb_displayEdgeInfoForScreenType:", v8);
        v11 = [v10 safeAreaInsetsPortrait];
        [v11 topInset];
        double v13 = round(v9 * v12);

        v14 = [v5 safeAreaInsetsPortrait];
        id v15 = objc_alloc((Class)UISApplicationSupportDisplayEdgeInsetsWrapper);
        [v14 leftInset];
        double v17 = v16;
        [v14 bottomInset];
        double v19 = v18;
        [v14 rightInset];
        id v21 = [v15 initWithTop:v13 left:v17 bottom:v19 right:v20];
        [v5 setSafeAreaInsetsPortrait:v21];
      }
    }
  }

  return v5;
}

+ (id)_clb_displayEdgeInfoForScreenType:(unint64_t)a3
{
  double v4 = 27.0;
  uint64_t v5 = 0x4049800000000000;
  uint64_t v6 = 0x4043000000000000;
  uint64_t v7 = 0x4044000000000000;
  double v8 = 48.0;
  switch(a3)
  {
    case 3uLL:
    case 5uLL:
    case 8uLL:
      uint64_t v9 = 0x4046000000000000;
      goto LABEL_5;
    case 4uLL:
LABEL_25:
      double v4 = 29.0;
      double v8 = *(double *)&v6;
      break;
    case 6uLL:
LABEL_26:
      double v4 = 30.67;
      double v8 = *(double *)&v7;
      break;
    case 7uLL:
      goto LABEL_13;
    case 9uLL:
    case 0xFuLL:
      uint64_t v9 = 0x4049000000000000;
LABEL_5:
      double v8 = *(double *)&v9;
      goto LABEL_10;
    case 0xAuLL:
    case 0x10uLL:
      double v8 = 43.0;
      goto LABEL_10;
    case 0xBuLL:
    case 0xDuLL:
    case 0x11uLL:
    case 0x13uLL:
      double v8 = 47.0;
      goto LABEL_10;
    case 0xCuLL:
    case 0x12uLL:
      double v8 = 39.0;
      goto LABEL_10;
    case 0xEuLL:
    case 0x14uLL:
      double v8 = 41.0;
      goto LABEL_10;
    case 0x15uLL:
    case 0x17uLL:
      double v8 = 59.0;
      goto LABEL_10;
    case 0x16uLL:
LABEL_27:
      double v4 = 27.67;
      break;
    case 0x18uLL:
LABEL_28:
      double v4 = 31.0;
      double v8 = *(double *)&v5;
      break;
    case 0x19uLL:
    case 0x1BuLL:
      double v8 = 59.0;
LABEL_13:
      double v4 = 34.0;
      break;
    case 0x1AuLL:
      break;
    case 0x1CuLL:
      double v4 = 29.0;
      double v8 = 51.0;
      break;
    default:
LABEL_10:
      uint64_t v6 = *(void *)&v8;
      uint64_t v7 = *(void *)&v8;
      uint64_t v5 = *(void *)&v8;
      double v4 = 0.0;
      switch(a3)
      {
        case 3uLL:
        case 5uLL:
        case 7uLL:
        case 9uLL:
        case 0xBuLL:
        case 0xDuLL:
        case 0xFuLL:
        case 0x11uLL:
        case 0x13uLL:
        case 0x15uLL:
        case 0x17uLL:
          goto LABEL_13;
        case 4uLL:
          goto LABEL_25;
        case 6uLL:
          goto LABEL_26;
        case 8uLL:
          double v4 = 31.0;
          break;
        case 0xAuLL:
        case 0x10uLL:
          double v4 = 29.0;
          break;
        case 0xCuLL:
        case 0x12uLL:
          double v4 = 28.0;
          break;
        case 0xEuLL:
        case 0x14uLL:
          double v4 = 29.67;
          break;
        case 0x16uLL:
          goto LABEL_27;
        case 0x18uLL:
          goto LABEL_28;
        case 0x19uLL:
        case 0x1AuLL:
        case 0x1BuLL:
        case 0x1CuLL:
        case 0x1DuLL:
        case 0x1EuLL:
        case 0x1FuLL:
        case 0x20uLL:
        case 0x21uLL:
          goto LABEL_14;
        case 0x22uLL:
        case 0x23uLL:
        case 0x24uLL:
        case 0x25uLL:
        case 0x26uLL:
        case 0x27uLL:
        case 0x28uLL:
        case 0x29uLL:
        case 0x2AuLL:
        case 0x2BuLL:
        case 0x2CuLL:
        case 0x2DuLL:
        case 0x2EuLL:
        case 0x2FuLL:
          double v4 = 20.0;
          break;
        default:
          double v4 = 0.0;
          break;
      }
      break;
  }
LABEL_14:
  id v10 = objc_alloc_init((Class)a1);
  if ((sub_100025470(a3) & 1) == 0 && (sub_1000254A0(a3) || sub_100025490(a3)))
  {
    if (sub_1000254A0(a3))
    {
      double v11 = 0.0;
      if (a3 <= 0x2F) {
        double v11 = dbl_10010F098[a3];
      }
      id v12 = [objc_alloc((Class)UISApplicationSupportDisplayEdgeInsetsWrapper) initWithTop:v11 left:0.0 bottom:0.0 right:0.0];
      [v10 setPeripheryInsets:v12];
    }
    [v10 setHomeAffordanceOverlayAllowance:&off_1001692A8];
    id v13 = [objc_alloc((Class)UISApplicationSupportDisplayEdgeInsetsWrapper) initWithTop:v8 left:0.0 bottom:v4 right:0.0];
    [v10 setSafeAreaInsetsPortrait:v13];
  }

  return v10;
}

+ (id)clb_thisDeviceDisplayEdgeInfo
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022B04;
  block[3] = &unk_10015C5A8;
  block[4] = a1;
  if (qword_100181148 != -1) {
    dispatch_once(&qword_100181148, block);
  }
  v2 = (void *)qword_100181150;

  return v2;
}

- (void)clb_applyDisplayEdgeInfoToSceneSettings:(id)a3
{
  id v4 = a3;
  [(UISApplicationSupportDisplayEdgeInfo *)self clb_displayBasedSafeAreaInsets];
  objc_msgSend(v4, "setSafeAreaInsetsPortrait:");
  uint64_t v5 = [(UISApplicationSupportDisplayEdgeInfo *)self peripheryInsets];
  UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper();
  objc_msgSend(v4, "setPeripheryInsets:");

  id v6 = [(UISApplicationSupportDisplayEdgeInfo *)self homeAffordanceOverlayAllowance];
  [v6 doubleValue];
  objc_msgSend(v4, "setHomeAffordanceOverlayAllowance:");
}

- (UIEdgeInsets)clb_displayBasedSafeAreaInsets
{
  v2 = [(UISApplicationSupportDisplayEdgeInfo *)self safeAreaInsetsPortrait];
  UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

@end