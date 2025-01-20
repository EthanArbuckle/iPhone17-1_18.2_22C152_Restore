@interface FMRule
+ (id)imageWithColor:(id)a3 leading:(BOOL)a4;
- (BOOL)leading;
- (FMRule)initWithFrame:(CGRect)a3;
- (UIColor)color;
- (UIImageView)imageView;
- (void)awakeFromNib;
- (void)commonSetup;
- (void)prepareForInterfaceBuilder;
- (void)setColor:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLeading:(BOOL)a3;
@end

@implementation FMRule

+ (id)imageWithColor:(id)a3 leading:(BOOL)a4
{
  return 0;
}

- (FMRule)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FMRule;
  v3 = -[FMRule initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(FMRule *)v3 commonSetup];
  }
  return v4;
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)FMRule;
  [(FMRule *)&v3 awakeFromNib];
  [(FMRule *)self commonSetup];
}

- (void)prepareForInterfaceBuilder
{
  v3.receiver = self;
  v3.super_class = (Class)FMRule;
  [(FMRule *)&v3 prepareForInterfaceBuilder];
  [(FMRule *)self commonSetup];
}

- (void)commonSetup
{
  id v3 = objc_alloc(MEMORY[0x263F1C6D0]);
  [(FMRule *)self bounds];
  v4 = objc_msgSend(v3, "initWithFrame:");
  [(FMRule *)self setImageView:v4];

  v5 = [(FMRule *)self imageView];
  [(FMRule *)self addSubview:v5];

  objc_super v6 = objc_opt_class();
  v7 = [(FMRule *)self color];
  objc_msgSend(v6, "imageWithColor:leading:", v7, -[FMRule leading](self, "leading"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = [(FMRule *)self imageView];
  [v8 setImage:v9];
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
  v4 = objc_opt_class();
  v5 = [(FMRule *)self color];
  objc_msgSend(v4, "imageWithColor:leading:", v5, -[FMRule leading](self, "leading"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_super v6 = [(FMRule *)self imageView];
  [v6 setImage:v7];
}

- (void)setLeading:(BOOL)a3
{
  self->_leading = a3;
  v4 = objc_opt_class();
  v5 = [(FMRule *)self color];
  objc_msgSend(v4, "imageWithColor:leading:", v5, -[FMRule leading](self, "leading"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_super v6 = [(FMRule *)self imageView];
  [v6 setImage:v7];
}

- (BOOL)leading
{
  return self->_leading;
}

- (UIColor)color
{
  return self->_color;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end