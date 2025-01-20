@interface UISDisplaySingleRectShape
+ (id)clb_displayShapeForScreenType:(unint64_t)a3;
+ (id)clb_thisDeviceDisplayShape;
@end

@implementation UISDisplaySingleRectShape

+ (id)clb_thisDeviceDisplayShape
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EE10;
  block[3] = &unk_10015C5A8;
  block[4] = a1;
  if (qword_1001810C8 != -1) {
    dispatch_once(&qword_1001810C8, block);
  }
  v2 = (void *)qword_1001810D0;

  return v2;
}

+ (id)clb_displayShapeForScreenType:(unint64_t)a3
{
  double v4 = sub_10001EE60(a3);
  if (a3 <= 0x10 && ((1 << a3) & 0x18600) != 0) {
    double v4 = v4 * 1.04166667;
  }
  CGFloat v5 = 0.0;
  CGFloat v6 = 90.0;
  CGFloat v7 = 627.0;
  CGFloat v8 = 249.0;
  switch(a3)
  {
    case 3uLL:
    case 4uLL:
      goto LABEL_17;
    case 5uLL:
    case 6uLL:
      CGFloat v7 = 628.0;
      CGFloat v8 = 307.0;
      goto LABEL_17;
    case 7uLL:
    case 8uLL:
      CGFloat v6 = 64.0;
      CGFloat v7 = 454.0;
      CGFloat v8 = 187.0;
      goto LABEL_17;
    case 9uLL:
    case 0xAuLL:
      CGFloat v6 = 103.0;
      CGFloat v7 = 678.0;
      CGFloat v8 = 223.5;
      goto LABEL_17;
    case 0xBuLL:
    case 0xCuLL:
      CGFloat v6 = 96.0;
      CGFloat v7 = 630.0;
      CGFloat v8 = 270.0;
      goto LABEL_17;
    case 0xDuLL:
    case 0xEuLL:
      CGFloat v6 = 96.0;
      CGFloat v7 = 628.0;
      CGFloat v8 = 328.0;
      goto LABEL_17;
    case 0xFuLL:
    case 0x10uLL:
      CGFloat v6 = 112.0;
      CGFloat v7 = 522.0;
      CGFloat v8 = 301.5;
      goto LABEL_17;
    case 0x11uLL:
    case 0x12uLL:
      CGFloat v6 = 101.0;
      CGFloat v7 = 484.0;
      CGFloat v8 = 343.0;
      goto LABEL_17;
    case 0x13uLL:
    case 0x14uLL:
      CGFloat v6 = 101.0;
      CGFloat v7 = 484.0;
      CGFloat v8 = 400.0;
      goto LABEL_17;
    case 0x15uLL:
    case 0x16uLL:
      CGFloat v6 = 110.0;
      CGFloat v7 = 375.0;
      CGFloat v5 = 34.0;
      CGFloat v8 = 402.0;
      goto LABEL_17;
    case 0x17uLL:
    case 0x18uLL:
      CGFloat v6 = 110.0;
      CGFloat v7 = 376.0;
      CGFloat v5 = 34.0;
      CGFloat v8 = 457.0;
      goto LABEL_17;
    case 0x19uLL:
    case 0x1AuLL:
      CGFloat v6 = 110.0;
      CGFloat v7 = 376.0;
      CGFloat v5 = 42.0;
      CGFloat v8 = 415.0;
      goto LABEL_17;
    case 0x1BuLL:
    case 0x1CuLL:
      CGFloat v6 = 110.0;
      CGFloat v7 = 376.0;
      CGFloat v5 = 42.0;
      CGFloat v8 = 472.0;
LABEL_17:
      v16.origin.x = v8;
      v16.origin.y = v5;
      v16.size.width = v7;
      v16.size.height = v6;
      CGFloat v9 = CGRectGetMinX(v16) / v4;
      v17.origin.x = v8;
      v17.origin.y = v5;
      v17.size.width = v7;
      v17.size.height = v6;
      CGFloat v10 = CGRectGetMinY(v17) / v4;
      v18.origin.x = v8;
      v18.origin.y = v5;
      v18.size.width = v7;
      v18.size.height = v6;
      CGFloat v11 = CGRectGetWidth(v18) / v4;
      v19.origin.x = v8;
      v19.origin.y = v5;
      v19.size.width = v7;
      v19.size.height = v6;
      id v12 = objc_msgSend(objc_alloc((Class)UISDisplaySingleRectShape), "initWithRect:", v9, v10, v11, CGRectGetHeight(v19) / v4);
      break;
    default:
      if (sub_1000254A0(a3) && (sub_100025470(a3) & 1) == 0)
      {
        v14 = +[CLFLog commonLog];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1001004F0(a3, v14);
        }
      }
      id v12 = 0;
      break;
  }

  return v12;
}

@end