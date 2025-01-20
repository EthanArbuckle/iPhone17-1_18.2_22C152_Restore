@interface FKACommandListItem
+ (id)itemWithName:(id)a3 keyDescription:(id)a4;
- (FKACommandListItem)initWithName:(id)a3 keyDescription:(id)a4;
- (NSString)keyDescription;
- (NSString)name;
@end

@implementation FKACommandListItem

+ (id)itemWithName:(id)a3 keyDescription:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithName:v7 keyDescription:v6];

  return v8;
}

- (FKACommandListItem)initWithName:(id)a3 keyDescription:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FKACommandListItem;
  v9 = [(FKACommandListItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_keyDescription, a4);
  }

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)keyDescription
{
  return self->_keyDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyDescription, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end