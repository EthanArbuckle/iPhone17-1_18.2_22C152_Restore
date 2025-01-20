@interface CNMemojiBackgroundColor
+ (id)log;
- (CNMemojiBackgroundColor)initWithColorDescription:(id)a3;
- (CNMemojiBackgroundColor)initWithColorDescription:(id)a3 alpha:(double)a4;
- (CNMemojiBackgroundColor)initWithDefaultColorWithAlpha:(double)a3;
- (CNMemojiBackgroundColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (double)alpha;
- (double)blue;
- (double)green;
- (double)red;
- (void)setAlpha:(double)a3;
- (void)setBlue:(double)a3;
- (void)setGreen:(double)a3;
- (void)setRed:(double)a3;
@end

@implementation CNMemojiBackgroundColor

+ (id)log
{
  if (log_cn_once_token_0_12 != -1) {
    dispatch_once(&log_cn_once_token_0_12, &__block_literal_global_120);
  }
  v2 = (void *)log_cn_once_object_0_12;

  return v2;
}

uint64_t __30__CNMemojiBackgroundColor_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.ui", "CNMemojiBackgroundColor");
  uint64_t v1 = log_cn_once_object_0_12;
  log_cn_once_object_0_12 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (CNMemojiBackgroundColor)initWithColorDescription:(id)a3 alpha:(double)a4
{
  id v6 = a3;
  if (v6)
  {
    if (initWithColorDescription_alpha__cn_once_token_2 != -1) {
      dispatch_once(&initWithColorDescription_alpha__cn_once_token_2, &__block_literal_global_4_11);
    }
    id v7 = (id)initWithColorDescription_alpha__cn_once_object_2;
    v8 = [v6 componentsSeparatedByString:@":"];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __58__CNMemojiBackgroundColor_initWithColorDescription_alpha___block_invoke_2;
    v23[3] = &unk_1E56B8BC8;
    id v9 = v7;
    id v24 = v9;
    v10 = objc_msgSend(v8, "_cn_compactMap:", v23);

    if ([v10 count] == 3)
    {
      v11 = [v10 objectAtIndexedSubscript:0];
      [v11 doubleValue];
      double v13 = v12;
      v14 = [v10 objectAtIndexedSubscript:1];
      [v14 doubleValue];
      double v16 = v15;
      v17 = [v10 objectAtIndexedSubscript:2];
      [v17 doubleValue];
      v19 = [(CNMemojiBackgroundColor *)self initWithRed:v13 green:v16 blue:v18 alpha:a4];
    }
    else
    {
      v21 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[CNMemojiBackgroundColor initWithColorDescription:alpha:]((uint64_t)v6, v21);
      }

      v19 = [(CNMemojiBackgroundColor *)self initWithDefaultColorWithAlpha:a4];
    }
  }
  else
  {
    v20 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[CNMemojiBackgroundColor initWithColorDescription:alpha:](v20);
    }

    v19 = [(CNMemojiBackgroundColor *)self initWithDefaultColorWithAlpha:a4];
  }

  return v19;
}

void __58__CNMemojiBackgroundColor_initWithColorDescription_alpha___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  uint64_t v1 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v0 setLocale:v1];

  [v0 setNumberStyle:1];
  v2 = (void *)initWithColorDescription_alpha__cn_once_object_2;
  initWithColorDescription_alpha__cn_once_object_2 = (uint64_t)v0;
}

uint64_t __58__CNMemojiBackgroundColor_initWithColorDescription_alpha___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) numberFromString:a2];
}

- (CNMemojiBackgroundColor)initWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  v14.receiver = self;
  v14.super_class = (Class)CNMemojiBackgroundColor;
  v10 = [(CNMemojiBackgroundColor *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_red = a3;
    v10->_green = a4;
    v10->_blue = a5;
    v10->_alpha = a6;
    double v12 = v10;
  }

  return v11;
}

- (CNMemojiBackgroundColor)initWithDefaultColorWithAlpha:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNMemojiBackgroundColor;
  v4 = [(CNMemojiBackgroundColor *)&v8 init];
  v5 = (CNMemojiBackgroundColor *)v4;
  if (v4)
  {
    *(int64x2_t *)(v4 + 8) = vdupq_n_s64(0x4061C00000000000uLL);
    *((void *)v4 + 3) = 0x4062600000000000;
    *((double *)v4 + 4) = a3;
    id v6 = v4;
  }

  return v5;
}

- (CNMemojiBackgroundColor)initWithColorDescription:(id)a3
{
  return [(CNMemojiBackgroundColor *)self initWithColorDescription:a3 alpha:0.4];
}

- (double)red
{
  return self->_red;
}

- (void)setRed:(double)a3
{
  self->_red = a3;
}

- (double)green
{
  return self->_green;
}

- (void)setGreen:(double)a3
{
  self->_green = a3;
}

- (double)blue
{
  return self->_blue;
}

- (void)setBlue:(double)a3
{
  self->_blue = a3;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (void)initWithColorDescription:(os_log_t)log alpha:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1909E3000, log, OS_LOG_TYPE_ERROR, "Color description is nil", v1, 2u);
}

- (void)initWithColorDescription:(uint64_t)a1 alpha:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Color description format should be r:g:b, got description: %@", (uint8_t *)&v2, 0xCu);
}

@end