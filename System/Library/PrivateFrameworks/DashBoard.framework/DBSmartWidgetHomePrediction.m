@interface DBSmartWidgetHomePrediction
+ (UIImage)closedGarageDoor;
+ (UIImage)openGarageDoor;
+ (double)maxValue;
+ (double)minValue;
+ (id)_imageNamed:(id)a3 onBackgroundColor:(id)a4;
+ (int64_t)baseScore;
+ (void)resetImages;
- (BOOL)showImageBorder;
- (BOOL)updateWithPrediction:(id)a3;
- (DBGarageDoor)garageDoor;
- (DBSmartWidgetHomePrediction)initWithGarageDoor:(id)a3;
- (double)value;
- (id)actionBlock;
- (id)compositingFilter;
- (id)debugScoreText;
- (id)image;
- (id)subtitle;
- (id)title;
- (id)uniqueIdentifier;
- (int64_t)_iconType;
- (int64_t)tieBreakScore;
- (void)garageDoor:(id)a3 didUpdateDoorState:(int64_t)a4;
- (void)garageDoor:(id)a3 didUpdateObstructionDetected:(BOOL)a4;
- (void)garageDoor:(id)a3 didUpdateTargetDoorState:(int64_t)a4;
- (void)serviceDidUpdate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DBSmartWidgetHomePrediction

- (DBSmartWidgetHomePrediction)initWithGarageDoor:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DBSmartWidgetHomePrediction;
  v6 = [(DBSmartWidgetPrediction *)&v8 init];
  if (v6)
  {
    [(id)objc_opt_class() resetImages];
    objc_storeStrong((id *)&v6->_garageDoor, a3);
    [(DBGarageDoor *)v6->_garageDoor addObserver:v6];
  }

  return v6;
}

+ (UIImage)openGarageDoor
{
  v3 = (void *)_openGarageDoor;
  if (!_openGarageDoor)
  {
    v4 = [MEMORY[0x263F825C8] systemWhiteColor];
    uint64_t v5 = [a1 _imageNamed:@"garageDoor-open" onBackgroundColor:v4];
    v6 = (void *)_openGarageDoor;
    _openGarageDoor = v5;

    v3 = (void *)_openGarageDoor;
  }
  return (UIImage *)v3;
}

+ (UIImage)closedGarageDoor
{
  v3 = (void *)_closedGarageDoor;
  if (!_closedGarageDoor)
  {
    v4 = [MEMORY[0x263F825C8] _carSystemQuaternaryColor];
    uint64_t v5 = [a1 _imageNamed:@"garageDoor-closed" onBackgroundColor:v4];
    v6 = (void *)_closedGarageDoor;
    _closedGarageDoor = v5;

    v3 = (void *)_closedGarageDoor;
  }
  return (UIImage *)v3;
}

+ (void)resetImages
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22D6F0000, log, OS_LOG_TYPE_DEBUG, "resetting Images", v1, 2u);
}

+ (id)_imageNamed:(id)a3 onBackgroundColor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[DBSmartWidgetHomePrediction _imageNamed:onBackgroundColor:]();
  }

  objc_super v8 = (void *)MEMORY[0x263F827E8];
  v9 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
  v10 = [v8 imageNamed:v5 inBundle:v9];

  v11 = [MEMORY[0x263F82DA0] _currentTraitCollection];
  v12 = [MEMORY[0x263F82B60] _carScreen];
  v13 = [v12 traitCollection];
  [MEMORY[0x263F82DA0] _setCurrentTraitCollection:v13];

  v14 = [MEMORY[0x263F82B60] _carScreen];
  [v14 scale];
  CGFloat v16 = v15;
  v26.width = 40.0;
  v26.height = 40.0;
  UIGraphicsBeginImageContextWithOptions(v26, 0, v16);

  v17 = [v6 undynamicColor];

  [v17 set];
  v27.origin.x = 0.0;
  v27.origin.y = 0.0;
  v27.size.width = 40.0;
  v27.size.height = 40.0;
  UIRectFill(v27);
  v28.origin.x = 0.0;
  v28.origin.y = 0.0;
  v28.size.width = 40.0;
  v28.size.height = 40.0;
  double MidX = CGRectGetMidX(v28);
  [v10 size];
  double v20 = MidX - v19 * 0.5;
  v29.origin.x = 0.0;
  v29.origin.y = 0.0;
  v29.size.width = 40.0;
  v29.size.height = 40.0;
  double MidY = CGRectGetMidY(v29);
  [v10 size];
  objc_msgSend(v10, "drawAtPoint:", v20, MidY - v22 * 0.5);
  v23 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  [MEMORY[0x263F82DA0] _setCurrentTraitCollection:v11];

  return v23;
}

- (id)uniqueIdentifier
{
  v2 = [(DBSmartWidgetHomePrediction *)self garageDoor];
  v3 = [v2 uniqueIdentifier];

  return v3;
}

- (id)title
{
  v2 = [(DBSmartWidgetHomePrediction *)self garageDoor];
  v3 = [v2 name];

  return v3;
}

- (id)subtitle
{
  v3 = [(DBSmartWidgetHomePrediction *)self garageDoor];
  v4 = [v3 home];
  char v5 = [v4 inAllowedPeriod];

  if ((v5 & 1) == 0)
  {
    v7 = [MEMORY[0x263F086E0] bundleForClass:NSClassFromString(&cfstr_Dashboard_4.isa)];
    uint64_t v17 = [v7 localizedStringForKey:@"SMARTWIDGET_GARGAGEDOOR_OUTSIDE_SCHEDULE" value:&stru_26E13A820 table:@"CarPlayApp"];
    goto LABEL_8;
  }
  id v6 = [(DBSmartWidgetHomePrediction *)self garageDoor];
  v7 = NSStringFromDoorState([v6 doorState]);

  objc_super v8 = [MEMORY[0x263F30E28] smartWidgetRelaxHomeInRangeCheck];
  int v9 = [v8 valueBool];

  if (v9)
  {
    v10 = [(DBSmartWidgetHomePrediction *)self garageDoor];
    v11 = [v10 home];
    char v12 = [v11 inHomeRange];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = [NSString stringWithFormat:@"(!H) %@", v7];

      v7 = (void *)v13;
    }
    v14 = [(DBSmartWidgetHomePrediction *)self garageDoor];
    double v15 = [v14 home];
    char v16 = [v15 inLocationRange];

    if ((v16 & 1) == 0)
    {
      uint64_t v17 = [NSString stringWithFormat:@"(!L) %@", v7];
LABEL_8:
      v18 = (void *)v17;

      v7 = v18;
    }
  }
  return v7;
}

- (id)actionBlock
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__DBSmartWidgetHomePrediction_actionBlock__block_invoke;
  aBlock[3] = &unk_2649B3E90;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  return v2;
}

void __42__DBSmartWidgetHomePrediction_actionBlock__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  v2 = [*(id *)(a1 + 32) garageDoor];
  uint64_t v3 = [v2 targetDoorState];

  v4 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __42__DBSmartWidgetHomePrediction_actionBlock__block_invoke_cold_1((uint64_t)v1, v3);
  }

  if (v3 == 1)
  {
    char v5 = [*v1 garageDoor];
    id v6 = v5;
    uint64_t v7 = 0;
  }
  else
  {
    if (v3) {
      return;
    }
    char v5 = [*v1 garageDoor];
    id v6 = v5;
    uint64_t v7 = 1;
  }
  [v5 setTargetDoorState:v7];
}

- (int64_t)_iconType
{
  v2 = [(DBSmartWidgetHomePrediction *)self garageDoor];
  uint64_t v3 = [v2 doorState];

  char v4 = v3 + 3;
  return (unint64_t)(v3 + 3) <= 7 && (((1 << v4) & 0x87) != 0 || ((1 << v4) & 0x30) != 0) || v3 == 100;
}

- (id)image
{
  v2 = [(DBSmartWidgetHomePrediction *)self _iconType];
  if (v2 == (void *)1)
  {
    v2 = [(id)objc_opt_class() closedGarageDoor];
  }
  else if (!v2)
  {
    v2 = [(id)objc_opt_class() openGarageDoor];
  }
  return v2;
}

- (id)compositingFilter
{
  if ([(DBSmartWidgetHomePrediction *)self _iconType] == 1)
  {
    v2 = [MEMORY[0x263F82B60] _carScreen];
    uint64_t v3 = [v2 traitCollection];
    unint64_t v4 = [v3 userInterfaceStyle];

    if (v4 <= 2)
    {
      char v5 = [MEMORY[0x263F157C8] filterWithType:**((void **)&unk_2649B4660 + v4)];
    }
  }
  else
  {
    char v5 = 0;
  }
  return v5;
}

- (BOOL)showImageBorder
{
  return [(DBSmartWidgetHomePrediction *)self _iconType] == 0;
}

+ (int64_t)baseScore
{
  return 20;
}

- (int64_t)tieBreakScore
{
  v2 = [(DBSmartWidgetHomePrediction *)self garageDoor];
  int64_t v3 = [v2 lastWritten];

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DBSmartWidgetHomePrediction;
  [(DBSmartWidgetPrediction *)&v4 traitCollectionDidChange:a3];
  [(id)objc_opt_class() resetImages];
  [(DBSmartWidgetPrediction *)self predictionDidUpdate];
}

- (BOOL)updateWithPrediction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  v10.receiver = self;
  v10.super_class = (Class)DBSmartWidgetHomePrediction;
  [(DBSmartWidgetPrediction *)&v10 updateWithPrediction:v6];
  uint64_t v7 = [v5 predictedObject];
  garageDoor = self->_garageDoor;
  self->_garageDoor = v7;

  [(DBSmartWidgetPrediction *)self predictionDidUpdate];
  return 1;
}

- (id)debugScoreText
{
  int64_t v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)DBSmartWidgetHomePrediction;
  id v4 = [(DBSmartWidgetPrediction *)&v12 debugScoreText];
  id v5 = [(DBSmartWidgetHomePrediction *)self garageDoor];
  id v6 = [v5 home];
  uint64_t v7 = [v6 stateDescription];
  objc_super v8 = [(DBSmartWidgetHomePrediction *)self garageDoor];
  int v9 = [v8 stateDescription];
  objc_super v10 = [v3 stringWithFormat:@"%@\n%@\n%@", v4, v7, v9];

  return v10;
}

- (double)value
{
  v2 = [(DBSmartWidgetHomePrediction *)self garageDoor];
  [v2 distance];
  double v4 = v3;

  return v4;
}

+ (double)maxValue
{
  return 0.0;
}

+ (double)minValue
{
  +[DBHome maxDistance];
  return result;
}

- (void)serviceDidUpdate:(id)a3
{
  double v4 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetHomePrediction serviceDidUpdate:]((uint64_t)self, v4);
  }

  [(DBSmartWidgetPrediction *)self predictionDidUpdate];
}

- (void)garageDoor:(id)a3 didUpdateDoorState:(int64_t)a4
{
  id v6 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetHomePrediction garageDoor:didUpdateDoorState:]((uint64_t)self, a4);
  }

  [(DBSmartWidgetPrediction *)self predictionDidUpdate];
}

- (void)garageDoor:(id)a3 didUpdateTargetDoorState:(int64_t)a4
{
  id v6 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetHomePrediction garageDoor:didUpdateTargetDoorState:]((uint64_t)self, a4);
  }

  [(DBSmartWidgetPrediction *)self predictionDidUpdate];
}

- (void)garageDoor:(id)a3 didUpdateObstructionDetected:(BOOL)a4
{
  id v6 = DBLogForCategory(7uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[DBSmartWidgetHomePrediction garageDoor:didUpdateObstructionDetected:]((uint64_t)self, a4, v6);
  }

  [(DBSmartWidgetPrediction *)self predictionDidUpdate];
}

- (DBGarageDoor)garageDoor
{
  return self->_garageDoor;
}

- (void).cxx_destruct
{
}

+ (void)_imageNamed:onBackgroundColor:.cold.1()
{
  v0 = [MEMORY[0x263F82B60] _carScreen];
  v1 = [v0 traitCollection];
  [v1 userInterfaceStyle];
  v2 = CPUIDescriptionForUserInterfaceStyle();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22D6F0000, v3, v4, "generating imageNamed=%{public}@ style=%{public}@", v5, v6, v7, v8, v9);
}

void __42__DBSmartWidgetHomePrediction_actionBlock__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = NSStringFromDoorState(a2);
  OUTLINED_FUNCTION_0_3(&dword_22D6F0000, v2, v3, "%{public}@ currentTargetDoorState=%{public}@", v4, v5, v6, v7, 2u);
}

- (void)serviceDidUpdate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_DEBUG, "%{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)garageDoor:(uint64_t)a1 didUpdateDoorState:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  int v2 = NSStringFromDoorState(a2);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22D6F0000, v3, v4, "%{public}@ doorState=%{public}@", v5, v6, v7, v8, v9);
}

- (void)garageDoor:(uint64_t)a1 didUpdateTargetDoorState:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  int v2 = NSStringFromDoorState(a2);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_22D6F0000, v3, v4, "%{public}@ targetDoorState=%{public}@", v5, v6, v7, v8, v9);
}

- (void)garageDoor:(os_log_t)log didUpdateObstructionDetected:.cold.1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = @"YES";
  if ((a2 & 1) == 0) {
    uint64_t v3 = @"NO";
  }
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_22D6F0000, log, OS_LOG_TYPE_DEBUG, "%{public}@ obstructionDetected=%@", (uint8_t *)&v4, 0x16u);
}

@end