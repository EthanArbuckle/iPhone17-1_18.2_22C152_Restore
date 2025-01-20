@interface AMUIInfographListLayoutProvider
- (AMUIInfographListLayoutProvider)init;
- (AMUIInfographListLayoutProvider)initWithScreenType:(unint64_t)a3;
- (id)layoutForIconLocation:(id)a3;
- (unint64_t)screenType;
- (void)configureRootFolderConfiguration:(id)a3 screenType:(unint64_t)a4;
@end

@implementation AMUIInfographListLayoutProvider

- (AMUIInfographListLayoutProvider)init
{
  uint64_t v3 = SBHScreenTypeForCurrentDevice();

  return [(AMUIInfographListLayoutProvider *)self initWithScreenType:v3];
}

- (AMUIInfographListLayoutProvider)initWithScreenType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMUIInfographListLayoutProvider;
  result = [(AMUIInfographListLayoutProvider *)&v5 init];
  if (result) {
    result->_screenType = a3;
  }
  return result;
}

- (id)layoutForIconLocation:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F79248]);
  [(AMUIInfographListLayoutProvider *)self configureRootFolderConfiguration:v4 screenType:self->_screenType];
  objc_super v5 = [[AMUIInfographIconListLayout alloc] initWithRootFolderVisualConfiguration:v4 screenType:self->_screenType];

  return v5;
}

- (void)configureRootFolderConfiguration:(id)a3 screenType:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 0uLL:
    case 1uLL:
      double v8 = 2.0;
      double v9 = 3.0;
      goto LABEL_13;
    case 2uLL:
      double v8 = 5.0;
      double v9 = 6.0;
LABEL_13:
      objc_msgSend(v6, "setEditModeButtonLayoutOffset:", v8, v9);
      double v15 = 50.0;
      double v16 = 24.0;
      break;
    case 3uLL:
    case 6uLL:
    case 8uLL:
      goto LABEL_11;
    case 4uLL:
      double v10 = 10.0;
      double v18 = 10.0;
      goto LABEL_29;
    case 5uLL:
    case 7uLL:
      double v10 = 28.0;
      goto LABEL_28;
    case 9uLL:
      objc_msgSend(v6, "setEditModeButtonLayoutOffset:", 14.0, 19.0);
      uint64_t v19 = 0x404D000000000000;
      goto LABEL_30;
    case 0xAuLL:
      objc_msgSend(v6, "setEditModeButtonLayoutOffset:", 10.0, 10.0);
      uint64_t v19 = 0x404A000000000000;
      goto LABEL_30;
    case 0xBuLL:
      double v10 = 20.0;
      goto LABEL_24;
    case 0xCuLL:
      double v10 = 13.0;
      goto LABEL_28;
    case 0xDuLL:
      double v11 = 30.0;
      double v12 = 20.0;
      goto LABEL_20;
    case 0xEuLL:
      double v20 = 22.0;
      double v21 = 20.0;
      goto LABEL_26;
    case 0xFuLL:
      objc_msgSend(v6, "setEditModeButtonLayoutOffset:", 25.0, 19.0);
      uint64_t v19 = 0x4050000000000000;
      goto LABEL_30;
    case 0x10uLL:
      double v10 = 16.0;
LABEL_24:
      double v18 = 18.0;
      goto LABEL_29;
    case 0x11uLL:
      double v20 = 30.0;
      double v21 = 18.0;
LABEL_26:
      objc_msgSend(v6, "setEditModeButtonLayoutOffset:", v20, v21);
      double v15 = 66.0;
      goto LABEL_31;
    case 0x12uLL:
      double v10 = 18.0;
      goto LABEL_28;
    case 0x13uLL:
      double v13 = 42.0;
      double v14 = 23.0;
      goto LABEL_34;
    case 0x14uLL:
      double v13 = 28.0;
      double v14 = 20.0;
      goto LABEL_34;
    case 0x15uLL:
    case 0x19uLL:
      double v11 = 37.0;
      double v12 = 16.0;
      goto LABEL_20;
    case 0x16uLL:
    case 0x1AuLL:
      double v11 = 25.0;
      double v12 = 10.0;
LABEL_20:
      objc_msgSend(v6, "setEditModeButtonLayoutOffset:", v11, v12);
      double v15 = 66.0;
      goto LABEL_35;
    case 0x17uLL:
    case 0x1BuLL:
      double v13 = 50.0;
      double v14 = 16.0;
LABEL_34:
      objc_msgSend(v6, "setEditModeButtonLayoutOffset:", v13, v14);
      double v15 = 68.0;
LABEL_35:
      double v16 = 28.0;
      break;
    case 0x18uLL:
    case 0x1CuLL:
      objc_msgSend(v6, "setEditModeButtonLayoutOffset:", 40.0, 12.0);
      double v15 = 68.0;
      double v16 = 27.0;
      break;
    default:
      v17 = AMUILogInfograph();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[AMUIInfographListLayoutProvider configureRootFolderConfiguration:screenType:]((uint64_t)self, v17);
      }

LABEL_11:
      double v10 = 16.0;
LABEL_28:
      double v18 = 16.0;
LABEL_29:
      objc_msgSend(v7, "setEditModeButtonLayoutOffset:", v10, v18);
      uint64_t v19 = 0x404E000000000000;
LABEL_30:
      double v15 = *(double *)&v19;
LABEL_31:
      double v16 = 26.0;
      break;
  }
  objc_msgSend(v7, "setEditModeButtonSize:", v15, v16);
  objc_msgSend(v7, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
}

- (unint64_t)screenType
{
  return self->_screenType;
}

- (void)configureRootFolderConfiguration:(uint64_t)a1 screenType:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = SBHStringForScreenType();
  int v4 = 138543362;
  objc_super v5 = v3;
  _os_log_error_impl(&dword_247837000, a2, OS_LOG_TYPE_ERROR, "Requesting root folder visual configuration for unexpected screen type: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end