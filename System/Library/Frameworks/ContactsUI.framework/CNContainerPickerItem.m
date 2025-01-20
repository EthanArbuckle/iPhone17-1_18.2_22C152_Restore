@interface CNContainerPickerItem
- (NSString)identifier;
- (NSString)name;
- (int64_t)type;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CNContainerPickerItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

@end