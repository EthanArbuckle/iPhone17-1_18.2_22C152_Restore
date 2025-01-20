@interface ACUIAppDescription
- (NSString)bundleID;
- (NSString)name;
- (NSString)persistentID;
- (NSString)publisher;
- (UIImage)icon;
- (void)setBundleID:(id)a3;
- (void)setIcon:(id)a3;
- (void)setName:(id)a3;
- (void)setPersistentID:(id)a3;
- (void)setPublisher:(id)a3;
@end

@implementation ACUIAppDescription

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)persistentID
{
  return self->_persistentID;
}

- (void)setPersistentID:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end