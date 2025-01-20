@interface NTKExtragalacticGlyphDescription
- (NSString)name;
- (NTKExtragalacticGlyphDescription)initWithName:(id)a3 color:(unint64_t)a4 style:(unint64_t)a5;
- (unint64_t)color;
- (unint64_t)style;
- (void)setColor:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation NTKExtragalacticGlyphDescription

- (NTKExtragalacticGlyphDescription)initWithName:(id)a3 color:(unint64_t)a4 style:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKExtragalacticGlyphDescription;
  v10 = [(NTKExtragalacticGlyphDescription *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    v11->_color = a4;
    v11->_style = a5;
  }

  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)color
{
  return self->_color;
}

- (void)setColor:(unint64_t)a3
{
  self->_color = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
}

@end