@interface IMRKResponse
+ (Class)__class;
+ (id)alloc;
- (NSDictionary)attributes;
- (NSString)category;
- (NSString)string;
@end

@implementation IMRKResponse

+ (Class)__class
{
  if (qword_1E92DB8A8 != -1) {
    dispatch_once(&qword_1E92DB8A8, &unk_1EE230818);
  }
  v2 = (void *)qword_1E92DB8A0;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end