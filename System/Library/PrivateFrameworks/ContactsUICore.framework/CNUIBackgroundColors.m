@interface CNUIBackgroundColors
- (CNUIBackgroundColors)init;
- (CNUIBackgroundColors)initWithData:(id)a3;
- (NSArray)contactImage;
- (NSArray)contactPoster;
- (NSData)data;
- (void)data;
- (void)setContactImage:(id)a3;
- (void)setContactPoster:(id)a3;
@end

@implementation CNUIBackgroundColors

- (CNUIBackgroundColors)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNUIBackgroundColors;
  v2 = [(CNUIBackgroundColors *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = MEMORY[0x263EFFA68];
    [(CNUIBackgroundColors *)v2 setContactImage:MEMORY[0x263EFFA68]];
    [(CNUIBackgroundColors *)v3 setContactPoster:v4];
    v5 = v3;
  }

  return v3;
}

- (CNUIBackgroundColors)initWithData:(id)a3
{
  id v4 = a3;
  v5 = [(CNUIBackgroundColors *)self init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      objc_super v7 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
      if (v7)
      {
        v8 = (*(void (**)(void))(*MEMORY[0x263F33510] + 16))();
        v9 = v8;
        if (v8)
        {
          v10 = [v8 objectForKeyedSubscript:@"contactImage"];
          uint64_t v11 = +[CNUIColorSerialization colorsFromDictionaries:v10];
          v12 = (void *)v11;
          uint64_t v13 = MEMORY[0x263EFFA68];
          if (v11) {
            uint64_t v14 = v11;
          }
          else {
            uint64_t v14 = MEMORY[0x263EFFA68];
          }
          [(CNUIBackgroundColors *)v6 setContactImage:v14];

          v15 = [v9 objectForKeyedSubscript:@"contactPoster"];
          uint64_t v16 = +[CNUIColorSerialization colorsFromDictionaries:v15];
          v17 = (void *)v16;
          if (v16) {
            uint64_t v18 = v16;
          }
          else {
            uint64_t v18 = v13;
          }
          [(CNUIBackgroundColors *)v6 setContactPoster:v18];
        }
        else
        {
          v22 = +[CNUICoreLogProvider color_os_log];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[CNUIBackgroundColors initWithData:]();
          }
        }
        v23 = v6;
      }
      else
      {
        v20 = +[CNUICoreLogProvider color_os_log];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[CNUIBackgroundColors initWithData:]();
        }

        v21 = v6;
      }
    }
    else
    {
      v19 = v5;
    }
  }

  return v6;
}

- (NSData)data
{
  uint64_t v3 = *MEMORY[0x263F334B0];
  id v4 = [(CNUIBackgroundColors *)self contactImage];
  int v5 = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  v6 = [(CNUIBackgroundColors *)self contactPoster];
  char v7 = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v6);

  if (v5 && (v7 & 1) != 0)
  {
    v8 = 0;
    goto LABEL_17;
  }
  v9 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  if ((v5 & 1) == 0)
  {
    v10 = [(CNUIBackgroundColors *)self contactImage];
    uint64_t v11 = +[CNUIColorSerialization dictionariesForColors:v10];

    [v9 setObject:v11 forKeyedSubscript:@"contactImage"];
  }
  if ((v7 & 1) == 0)
  {
    v12 = [(CNUIBackgroundColors *)self contactPoster];
    uint64_t v13 = +[CNUIColorSerialization dictionariesForColors:v12];

    [v9 setObject:v13 forKeyedSubscript:@"contactPoster"];
  }
  uint64_t v14 = (*(void (**)(void))(*MEMORY[0x263F334F0] + 16))();
  v15 = v14;
  if (!v14)
  {
    uint64_t v16 = +[CNUICoreLogProvider color_os_log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CNUIBackgroundColors data]();
    }
    v8 = 0;
    goto LABEL_15;
  }
  v8 = [v14 dataUsingEncoding:4];
  if (!v8)
  {
    uint64_t v16 = +[CNUICoreLogProvider color_os_log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CNUIBackgroundColors data]();
    }
LABEL_15:
  }
LABEL_17:
  return (NSData *)v8;
}

- (NSArray)contactImage
{
  return self->_contactImage;
}

- (void)setContactImage:(id)a3
{
}

- (NSArray)contactPoster
{
  return self->_contactPoster;
}

- (void)setContactPoster:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactPoster, 0);
  objc_storeStrong((id *)&self->_contactImage, 0);
}

- (void)initWithData:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20B704000, v0, v1, "[CNUIBackgroundColors initWithData:] Failed to decode NSData to string", v2, v3, v4, v5, v6);
}

- (void)initWithData:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20B704000, v0, v1, "[CNUIBackgroundColors initWithData:] Failed to decode JSON string to dictionary", v2, v3, v4, v5, v6);
}

- (void)data
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_20B704000, v0, v1, "[CNUIBackgroundColors data] Failed to convert string to NSData", v2, v3, v4, v5, v6);
}

@end