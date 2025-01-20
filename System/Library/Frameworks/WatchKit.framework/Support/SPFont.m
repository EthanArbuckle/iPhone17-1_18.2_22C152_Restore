@interface SPFont
+ (BOOL)supportsSecureCoding;
- (SPFont)initWithCoder:(id)a3;
- (SPFont)initWithFont:(id)a3;
- (UIFont)font;
- (id)unarchiver:(id)a3 didDecodeObject:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setFont:(id)a3;
@end

@implementation SPFont

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPFont)initWithFont:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SPFont;
  id v3 = a3;
  v4 = [(SPFont *)&v6 init];
  -[SPFont setFont:](v4, "setFont:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  font = self->_font;
  id v4 = a3;
  id v6 = [(UIFont *)font fontDescriptor];
  v5 = [v6 fontAttributes];
  [v4 encodeObject:v5 forKey:@"SPFontAttributes"];
}

- (id)unarchiver:(id)a3 didDecodeObject:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (v5 = (objc_class *)objc_opt_class(),
        NSStringFromClass(v5),
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 isEqualToString:@"SPFont"],
        v6,
        v7))
  {
    id v8 = [a4 font];
  }
  else
  {
    id v8 = a4;
  }
  v9 = v8;

  return v9;
}

- (SPFont)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SPFont;
  v5 = [(SPFont *)&v14 init];
  id v6 = [v4 decodeObjectForKey:@"SPFontAttributes"];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  unsigned int v7 = (void *)qword_100052600;
  uint64_t v23 = qword_100052600;
  if (!qword_100052600)
  {
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_1000259A0;
    v18 = &unk_100045AD8;
    v19 = &v20;
    sub_1000259A0((uint64_t)&v15);
    unsigned int v7 = (void *)v21[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v20, 8);
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  v9 = (void *)qword_100052608;
  uint64_t v23 = qword_100052608;
  if (!qword_100052608)
  {
    v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    v17 = sub_1000259F8;
    v18 = &unk_100045AD8;
    v19 = &v20;
    sub_1000259F8((uint64_t)&v15);
    v9 = (void *)v21[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v20, 8);
  v11 = [v10 fontDescriptorWithFontAttributes:v6];
  v12 = [v8 fontWithDescriptor:v11 size:0.0];
  [(SPFont *)v5 setFont:v12];

  return v5;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (void).cxx_destruct
{
}

@end