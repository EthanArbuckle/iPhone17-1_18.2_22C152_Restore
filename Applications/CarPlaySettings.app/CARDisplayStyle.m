@interface CARDisplayStyle
+ (id)displayStyle:(int64_t)a3 name:(id)a4 enabled:(BOOL)a5;
- (BOOL)enabled;
- (NSString)name;
- (id)description;
- (int64_t)style;
- (void)setEnabled:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation CARDisplayStyle

+ (id)displayStyle:(int64_t)a3 name:(id)a4 enabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  v8 = objc_opt_new();
  [v8 setStyle:a3];
  [v8 setName:v7];

  [v8 setEnabled:v5];

  return v8;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)CARDisplayStyle;
  v3 = [(CARDisplayStyle *)&v9 description];
  int64_t v4 = [(CARDisplayStyle *)self style];
  BOOL v5 = [(CARDisplayStyle *)self name];
  [(CARDisplayStyle *)self enabled];
  v6 = NSStringFromBOOL();
  id v7 = +[NSString stringWithFormat:@"%@ [style: %ld, name: %@, enabled: %@]", v3, v4, v5, v6];

  return v7;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
}

@end