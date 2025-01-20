@interface PassWrapper
- (PKPass)pass;
- (PassWrapper)initWithUniquePassID:(id)a3;
- (id)croppedImageToAlignmentRectInsets:(id)a3;
- (id)getPassImageWithSize:(CGSize)a3;
- (id)getPassName;
- (void)getPassName;
- (void)setPass:(id)a3;
@end

@implementation PassWrapper

- (PassWrapper)initWithUniquePassID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PassWrapper;
  v5 = [(PassWrapper *)&v10 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F5BF80] sharedInstance];
    uint64_t v7 = [v6 passWithUniqueID:v4];
    pass = v5->_pass;
    v5->_pass = (PKPass *)v7;
  }
  return v5;
}

- (id)croppedImageToAlignmentRectInsets:(id)a3
{
  id v3 = a3;
  [v3 size];
  double v5 = v4;
  double v7 = v6;
  [v3 alignmentRectInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", v5 - v10 - v14, v7 - v8 - v12);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __49__PassWrapper_croppedImageToAlignmentRectInsets___block_invoke;
  v20[3] = &unk_264510628;
  id v21 = v3;
  double v22 = v9;
  double v23 = v11;
  double v24 = v13;
  double v25 = v15;
  id v17 = v3;
  v18 = [v16 imageWithActions:v20];

  return v18;
}

uint64_t __49__PassWrapper_croppedImageToAlignmentRectInsets___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", -*(double *)(a1 + 48), -*(double *)(a1 + 40));
}

- (id)getPassImageWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = DVUI_LOG_CLIENT();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PassWrapper getPassImageWithSize:].cold.4();
  }

  if (self->_pass)
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2050000000;
    double v7 = (void *)getPKPassViewClass_softClass;
    uint64_t v19 = getPKPassViewClass_softClass;
    if (!getPKPassViewClass_softClass)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __getPKPassViewClass_block_invoke;
      v15[3] = &unk_2645105B0;
      v15[4] = &v16;
      __getPKPassViewClass_block_invoke((uint64_t)v15);
      double v7 = (void *)v17[3];
    }
    double v8 = v7;
    _Block_object_dispose(&v16, 8);
    if (v8)
    {
      double v9 = [[v8 alloc] initWithPass:self->_pass content:5];
      double v10 = DVUI_LOG_CLIENT();
      double v11 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[PassWrapper getPassImageWithSize:]();
        }

        double v12 = -[NSObject snapshotOfFrontFaceWithRequestedSize:](v9, "snapshotOfFrontFaceWithRequestedSize:", width, height);
        double v13 = [(PassWrapper *)self croppedImageToAlignmentRectInsets:v12];
      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[PassWrapper getPassImageWithSize:]();
        }
        double v13 = 0;
        double v9 = v11;
      }
    }
    else
    {
      double v9 = DVUI_LOG_CLIENT();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[PassWrapper getPassImageWithSize:]();
      }
      double v13 = 0;
    }
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

- (id)getPassName
{
  id v3 = DVUI_LOG_CLIENT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PassWrapper getPassName]();
  }

  pass = self->_pass;
  double v5 = DVUI_LOG_CLIENT();
  double v6 = v5;
  if (pass)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PassWrapper getPassName]();
    }

    double v7 = [(PKPass *)self->_pass localizedDescription];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[PassWrapper getPassName]();
    }

    double v7 = 0;
  }

  return v7;
}

- (PKPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)getPassImageWithSize:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21F464000, v0, v1, "Error while retrieving getPKPassViewClass, returning nil.", v2, v3, v4, v5, v6);
}

- (void)getPassImageWithSize:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21F464000, v0, v1, "Error in creating PKPassView.", v2, v3, v4, v5, v6);
}

- (void)getPassImageWithSize:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21F464000, v0, v1, "PassImage was created successfully.", v2, v3, v4, v5, v6);
}

- (void)getPassImageWithSize:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21F464000, v0, v1, "Starting get pass image with size.", v2, v3, v4, v5, v6);
}

- (void)getPassName
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21F464000, v0, v1, "Starting get pass name.", v2, v3, v4, v5, v6);
}

@end