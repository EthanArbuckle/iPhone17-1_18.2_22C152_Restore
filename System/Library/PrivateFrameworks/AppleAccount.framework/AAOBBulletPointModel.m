@interface AAOBBulletPointModel
- (AAOBBulletPointModel)initWithSymbolNamed:(id)a3 title:(id)a4 description:(id)a5;
- (NSString)description;
- (NSString)symbolName;
- (NSString)title;
- (void)setDescription:(id)a3;
- (void)setSymbolName:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AAOBBulletPointModel

- (AAOBBulletPointModel)initWithSymbolNamed:(id)a3 title:(id)a4 description:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AAOBBulletPointModel;
  v12 = [(AAOBBulletPointModel *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_symbolName, a3);
    objc_storeStrong((id *)&v13->_title, a4);
    objc_storeStrong((id *)&v13->_description, a5);
  }

  return v13;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)description
{
  return self->_description;
}

- (void)setDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end