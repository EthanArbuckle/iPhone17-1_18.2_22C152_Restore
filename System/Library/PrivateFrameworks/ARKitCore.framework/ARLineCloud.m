@interface ARLineCloud
- (ARLineCloud)initWithLineCloudData:(id)a3;
- (NSArray)lines;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation ARLineCloud

- (ARLineCloud)initWithLineCloudData:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ARLineCloud;
  v5 = [(ARLineCloud *)&v21 init];
  if (v5)
  {
    id v6 = v4;
    uint64_t v7 = [v6 bytes];
    unint64_t v8 = [v6 length];
    v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v8 / 0x48];
    if (v8 >= 0x48)
    {
      if (v8 / 0x48 <= 1) {
        unint64_t v10 = 1;
      }
      else {
        unint64_t v10 = v8 / 0x48;
      }
      uint64_t v11 = v7 + 32;
      do
      {
        double v12 = *(double *)v11;
        double v13 = *(double *)(v11 + 8);
        uint64_t v14 = *(void *)(v11 + 32);
        float64x2_t v20 = *(float64x2_t *)(v11 - 32);
        v15 = objc_opt_new();
        [v15 setIdentifier:v14];
        [v15 setStartPoint:COERCE_DOUBLE(vcvt_f32_f64(v20))];
        *(float *)&double v16 = v12;
        float v17 = v13;
        *((float *)&v16 + 1) = v17;
        [v15 setEndPoint:v16];
        [(NSArray *)v9 addObject:v15];

        v11 += 72;
        --v10;
      }
      while (v10);
    }
    lines = v5->_lines;
    v5->_lines = v9;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSArray *)self->_lines copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (NSArray)lines
{
  return self->_lines;
}

- (void).cxx_destruct
{
}

@end