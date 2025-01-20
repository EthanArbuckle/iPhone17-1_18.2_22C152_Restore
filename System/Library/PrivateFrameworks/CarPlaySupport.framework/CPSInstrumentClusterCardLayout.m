@interface CPSInstrumentClusterCardLayout
+ (id)layoutWithLayoutType:(unint64_t)a3;
- (BOOL)showETAWithTurnCard;
- (CGRect)safeArea;
- (CGRect)viewArea;
- (CPSInstrumentClusterCardLayout)initWithCarScreenInfo:(id)a3 isRightHandDrive:(BOOL)a4;
- (CPSInstrumentClusterCardLayout)initWithLayout:(unint64_t)a3;
- (char)initWithSafeAreaFrame:(char)a3 viewAreaFrame:(CGFloat)a4 displayFrame:(CGFloat)a5 physicalPixelWidth:(CGFloat)a6 isRightHandDrive:(CGFloat)a7;
- (unint64_t)layoutForCard;
- (void)setLayoutForCard:(unint64_t)a3;
- (void)setSafeArea:(CGRect)a3;
- (void)setShowETAWithTurnCard:(BOOL)a3;
- (void)setViewArea:(CGRect)a3;
@end

@implementation CPSInstrumentClusterCardLayout

+ (id)layoutWithLayoutType:(unint64_t)a3
{
  v3 = [[CPSInstrumentClusterCardLayout alloc] initWithLayout:a3];

  return v3;
}

- (CPSInstrumentClusterCardLayout)initWithLayout:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  SEL v9 = a2;
  unint64_t v8 = a3;
  v10 = 0;
  v7.receiver = self;
  v7.super_class = (Class)CPSInstrumentClusterCardLayout;
  v5 = [(CPSInstrumentClusterCardLayout *)&v7 init];
  v10 = v5;
  objc_storeStrong((id *)&v10, v5);
  if (v5)
  {
    v10->_layoutForCard = v8;
    os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v11, v10->_layoutForCard);
      _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_INFO, "Layout Calculation: Explicity using layout %lu", v11, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v4 = v10;
  objc_storeStrong((id *)&v10, 0);
  return v4;
}

- (char)initWithSafeAreaFrame:(char)a3 viewAreaFrame:(CGFloat)a4 displayFrame:(CGFloat)a5 physicalPixelWidth:(CGFloat)a6 isRightHandDrive:(CGFloat)a7
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  v61.origin.x = a4;
  v61.origin.y = a5;
  v61.size.width = a6;
  v61.size.height = a7;
  v60.origin.x = a8;
  v60.origin.y = a9;
  v60.size.width = a10;
  v60.size.height = a11;
  v59.origin.x = a12;
  v59.origin.y = a13;
  v59.size.width = a14;
  v59.size.height = a15;
  uint64_t v57 = a2;
  double v56 = a16;
  char v55 = a3 & 1;
  v58 = 0;
  v54.receiver = a1;
  v54.super_class = (Class)CPSInstrumentClusterCardLayout;
  v36 = (char *)objc_msgSendSuper2(&v54, sel_init);
  v58 = v36;
  objc_storeStrong((id *)&v58, v36);
  if (v36)
  {
    os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
    os_log_type_t type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      log = oslog;
      os_log_type_t v31 = type;
      v35 = NSStringFromCGRect(v61);
      v27 = v35;
      v51 = v27;
      v34 = NSStringFromCGRect(v60);
      v28 = v34;
      v50 = v28;
      v33 = NSStringFromCGRect(v59);
      v29 = v33;
      v49 = v29;
      id v32 = (id)[NSNumber numberWithDouble:v56];
      __os_log_helper_16_2_4_8_64_8_64_8_64_8_64((uint64_t)v64, (uint64_t)v27, (uint64_t)v28, (uint64_t)v29, (uint64_t)v32);
      _os_log_impl(&dword_22B689000, log, v31, "Layout Calculation: pixelSafeArea: %@, pixelViewArea: %@, pixelDisplayFrame: %@, pixelPhysicalWidth: %@", v64, 0x2Au);

      objc_storeStrong((id *)&v49, 0);
      objc_storeStrong((id *)&v50, 0);
      objc_storeStrong((id *)&v51, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v58[8] = 1;
    *(CGRect *)(v58 + 24) = v61;
    *(CGRect *)(v58 + 56) = v60;
    double v48 = 0.153 / v56;
    if (v61.size.width < 660.0 * (0.153 / v56))
    {
      if (0.3 * v61.size.height <= 115.0 * v48)
      {
        *((void *)v58 + 2) = 0;
        os_log_t v40 = (os_log_t)CarPlaySupportGeneralLogging();
        os_log_type_t v39 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          v23 = v40;
          os_log_type_t v24 = v39;
          __os_log_helper_16_0_0(v38);
          _os_log_error_impl(&dword_22B689000, v23, v24, "Layout Calculation: Using undefined layout", v38, 2u);
        }
        objc_storeStrong((id *)&v40, 0);
      }
      else
      {
        *((void *)v58 + 2) = 1;
        os_log_t v43 = (os_log_t)CarPlaySupportGeneralLogging();
        os_log_type_t v42 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          v25 = v43;
          os_log_type_t v26 = v42;
          __os_log_helper_16_0_0(v41);
          _os_log_impl(&dword_22B689000, v25, v26, "Layout Calculation: Using center layout", v41, 2u);
        }
        objc_storeStrong((id *)&v43, 0);
      }
    }
    else
    {
      double MidX = CGRectGetMidX(v61);
      double v46 = CGRectGetMidX(v59);
      if (MidX >= v46)
      {
        if (MidX <= v46)
        {
          if (v55) {
            *((void *)v58 + 2) = 3;
          }
          else {
            *((void *)v58 + 2) = 2;
          }
        }
        else
        {
          *((void *)v58 + 2) = 3;
        }
      }
      else
      {
        *((void *)v58 + 2) = 2;
      }
      os_log_t v45 = (os_log_t)CarPlaySupportGeneralLogging();
      os_log_type_t v44 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_0_6_8_0_8_0_8_0_8_0_4_0_8_0((uint64_t)v63, *(uint64_t *)&v61.size.width, COERCE__INT64(660.0 * v48), *(uint64_t *)&MidX, *(uint64_t *)&v46, v55 & 1, *((void *)v58 + 2));
        _os_log_impl(&dword_22B689000, v45, v44, "Layout Calculation: Safe area width %f is greater than %f. Safe area mid: %f, Display mid: %f. is RHD: %d. using layout %lu", v63, 0x3Au);
      }
      objc_storeStrong((id *)&v45, 0);
    }
    if (v61.size.height <= 202.0)
    {
      os_log_t v37 = (os_log_t)CarPlaySupportGeneralLogging();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_0_2_8_0_8_0((uint64_t)v62, *(uint64_t *)&v61.size.height, 0x4069400000000000);
        _os_log_impl(&dword_22B689000, v37, OS_LOG_TYPE_INFO, "Layout Calculation: Safe area height %f is less/equal to %f. Not showing ETA with turn card", v62, 0x16u);
      }
      objc_storeStrong((id *)&v37, 0);
      v58[8] = 0;
    }
  }
  v22 = v58;
  objc_storeStrong((id *)&v58, 0);
  return v22;
}

- (CPSInstrumentClusterCardLayout)initWithCarScreenInfo:(id)a3 isRightHandDrive:(BOOL)a4
{
  v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = (id)[location[0] currentViewArea];
  [v21 safeFrame];
  double v33 = v4;
  double v34 = v5;
  double v35 = v6;
  double v36 = v7;

  id v22 = (id)[location[0] currentViewArea];
  [v22 visibleFrame];
  double v29 = v8;
  double v30 = v9;
  double v31 = v10;
  double v32 = v11;

  [location[0] pixelSize];
  [location[0] pixelSize];
  CGRectMake_7();
  uint64_t v25 = v12;
  uint64_t v26 = v13;
  uint64_t v27 = v14;
  uint64_t v28 = v15;
  [location[0] physicalSize];
  double v23 = v16;
  [location[0] pixelSize];
  v17 = v38;
  v38 = 0;
  v38 = -[CPSInstrumentClusterCardLayout initWithSafeAreaFrame:viewAreaFrame:displayFrame:physicalPixelWidth:isRightHandDrive:](v17, "initWithSafeAreaFrame:viewAreaFrame:displayFrame:physicalPixelWidth:isRightHandDrive:", a4, v33, v34, v35, v36, v29, v30, v31, v32, v25, v26, v27, v28, v23 / v18);
  os_log_type_t v24 = v38;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v38, 0);
  return v24;
}

- (unint64_t)layoutForCard
{
  return self->_layoutForCard;
}

- (void)setLayoutForCard:(unint64_t)a3
{
  self->_layoutForCard = a3;
}

- (BOOL)showETAWithTurnCard
{
  return self->_showETAWithTurnCard;
}

- (void)setShowETAWithTurnCard:(BOOL)a3
{
  self->_showETAWithTurnCard = a3;
}

- (CGRect)safeArea
{
  double y = self->_safeArea.origin.y;
  double x = self->_safeArea.origin.x;
  double height = self->_safeArea.size.height;
  double width = self->_safeArea.size.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSafeArea:(CGRect)a3
{
  self->_safeArea = a3;
}

- (CGRect)viewArea
{
  double y = self->_viewArea.origin.y;
  double x = self->_viewArea.origin.x;
  double height = self->_viewArea.size.height;
  double width = self->_viewArea.size.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setViewArea:(CGRect)a3
{
  self->_viewArea = a3;
}

@end