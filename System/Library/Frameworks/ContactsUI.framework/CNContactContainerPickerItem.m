@interface CNContactContainerPickerItem
- (NSString)identifier;
- (NSString)name;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
@end

@implementation CNContactContainerPickerItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
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