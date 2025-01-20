@interface NSString
- (id)_ui_stringWithTemplateDictionary:(id)a3;
@end

@implementation NSString

- (id)_ui_stringWithTemplateDictionary:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100022704;
  v7[3] = &unk_10004D718;
  id v5 = [(NSString *)self mutableCopy];
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

@end