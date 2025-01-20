@interface EDMessageActionProvider
- (EDMessageActionProvider)initWithID:(id)a3 name:(id)a4;
- (NSString)ID;
- (NSString)name;
@end

@implementation EDMessageActionProvider

- (EDMessageActionProvider)initWithID:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EDMessageActionProvider;
  v9 = [(EDMessageActionProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ID, a3);
    objc_storeStrong((id *)&v10->_name, a4);
  }

  return v10;
}

- (NSString)ID
{
  return self->_ID;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_ID, 0);
}

@end