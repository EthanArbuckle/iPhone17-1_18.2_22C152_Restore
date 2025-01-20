@interface IFImage(ISImagePriv)
- (NSData)data;
- (void)data;
@end

@implementation IFImage(ISImagePriv)

- (NSData)data
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  data = self->_data;
  if (!data)
  {
    [(IFImage *)self size];
    double v5 = v4;
    double v7 = v6;
    [(IFImage *)self scale];
    v9 = +[IFGraphicsContext bitmapContextWithSize:scale:preset:](IFGraphicsContext, "bitmapContextWithSize:scale:preset:", 0, v5, v7, v8);
    uint64_t v10 = [(IFImage *)self CGImage];
    [(IFImage *)self size];
    double v12 = v11;
    [(IFImage *)self size];
    objc_msgSend(v9, "drawCGImage:inRect:", v10, 0.0, 0.0, v12, v13);
    v14 = [v9 data];
    if (!v14)
    {
      v15 = IFDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        [(IFImage(ISImagePriv) *)(uint64_t)self data];
      }
    }
    v16 = [(IFImage *)self CALayer];

    if (v16)
    {
      v17 = (void *)MEMORY[0x1E4F28DB0];
      v18 = [(IFImage *)self CALayer];
      id v36 = 0;
      v16 = [v17 archivedDataWithRootObject:v18 requiringSecureCoding:1 error:&v36];
      id v19 = v36;

      if (!v16)
      {
        v20 = IFDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          [(IFImage(ISImagePriv) *)(uint64_t)self data];
        }
      }
      int v21 = [v16 length];
    }
    else
    {
      int v21 = 0;
    }
    uint64_t v38 = 0;
    v37[0] = 6;
    v37[1] = [v14 length];
    v37[2] = v21;
    [(IFImage *)self scale];
    v37[3] = v22;
    [(IFImage *)self size];
    *(float *)&double v23 = v23;
    v37[8] = LODWORD(v23);
    [(IFImage *)self size];
    float v25 = v24;
    *(float *)&v37[9] = v25;
    [(IFImage *)self iconSize];
    *(float *)&double v26 = v26;
    v37[4] = LODWORD(v26);
    [(IFImage *)self iconSize];
    float v28 = v27;
    *(float *)&v37[5] = v28;
    [(IFImage *)self minimumSize];
    *(float *)&double v29 = v29;
    v37[6] = LODWORD(v29);
    [(IFImage *)self minimumSize];
    float v31 = v30;
    *(float *)&v37[7] = v31;
    v32 = objc_opt_new();
    [v32 appendBytes:v37 length:48];
    [v32 appendData:v14];
    [v32 appendData:v16];
    v33 = (NSData *)[v32 copy];
    v34 = self->_data;
    self->_data = v33;

    data = self->_data;
  }

  return data;
}

- (void)data
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DC6CA000, a2, OS_LOG_TYPE_ERROR, "Failed getting bitmap data for %@", (uint8_t *)&v2, 0xCu);
}

@end