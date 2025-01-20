@interface CANodeButton
- (BOOL)hasLabel;
- (CANodeButton)init;
- (NSURL)url;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setHasLabel:(BOOL)a3;
- (void)setUrl:(id)a3;
@end

@implementation CANodeButton

- (CANodeButton)init
{
  v3.receiver = self;
  v3.super_class = (Class)CANodeButton;
  return [(CANodeButton *)&v3 init];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CANodeButton;
  [(CANodeButton *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v23[1] = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)CANodeButton;
  [(CANodeButton *)&v21 layoutSubviews];
  if ([(CANodeButton *)self hasLabel])
  {
    objc_super v3 = objc_msgSend((id)-[CANodeButton titleLabel](self, "titleLabel"), "text");
    uint64_t v22 = *MEMORY[0x263F814F0];
    v23[0] = objc_msgSend((id)-[CANodeButton titleLabel](self, "titleLabel"), "font");
    objc_msgSend(v3, "sizeWithAttributes:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, &v22, 1));
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x263F001B0];
    double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  if (v7 == 0.0) {
    double v8 = 0.0;
  }
  else {
    double v8 = v7 + 4.0;
  }
  [(CANodeButton *)self frame];
  double v10 = v9;
  [(CANodeButton *)self frame];
  if (v10 >= v11 - v8) {
    double v10 = v11 - v8;
  }
  [(CANodeButton *)self frame];
  float v13 = (v12 - v10) * 0.5;
  double v14 = floorf(v13);
  [(CANodeButton *)self frame];
  float v16 = (v15 - v8 - v10) * 0.5;
  objc_msgSend((id)-[CANodeButton imageView](self, "imageView"), "setFrame:", v14, floorf(v16), v10, v10);
  [(CANodeButton *)self frame];
  float v18 = (v17 - v5) * 0.5;
  double v19 = floorf(v18);
  [(CANodeButton *)self frame];
  objc_msgSend((id)-[CANodeButton titleLabel](self, "titleLabel"), "setFrame:", v19, v20 - v7, v5, v7);
}

- (BOOL)hasLabel
{
  return self->hasLabel;
}

- (void)setHasLabel:(BOOL)a3
{
  self->hasLabel = a3;
  double v5 = (void *)[(CANodeButton *)self titleLabel];
  if (a3)
  {
    [(CANodeButton *)self addSubview:v5];
  }
  else
  {
    objc_msgSend(v5, "removeFromSuperview", v5);
  }
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 752, 1);
}

- (void)setUrl:(id)a3
{
}

@end