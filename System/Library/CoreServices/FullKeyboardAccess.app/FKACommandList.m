@interface FKACommandList
+ (id)listWithTitle:(id)a3 items:(id)a4 footerText:(id)a5;
- (FKACommandList)initWithTitle:(id)a3 items:(id)a4 footerText:(id)a5;
- (NSArray)items;
- (NSString)footerText;
- (NSString)title;
@end

@implementation FKACommandList

+ (id)listWithTitle:(id)a3 items:(id)a4 footerText:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithTitle:v10 items:v9 footerText:v8];

  return v11;
}

- (FKACommandList)initWithTitle:(id)a3 items:(id)a4 footerText:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FKACommandList;
  id v11 = [(FKACommandList *)&v17 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    title = v11->_title;
    v11->_title = v12;

    objc_storeStrong((id *)&v11->_items, a4);
    v14 = (NSString *)[v10 copy];
    footerText = v11->_footerText;
    v11->_footerText = v14;
  }
  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)items
{
  return self->_items;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end