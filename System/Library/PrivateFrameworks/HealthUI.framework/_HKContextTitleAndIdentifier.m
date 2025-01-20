@interface _HKContextTitleAndIdentifier
- (NSString)accessibilityIdentifier;
- (NSString)title;
- (_HKContextTitleAndIdentifier)initWithTitle:(id)a3 accessibilityIdentifier:(id)a4;
@end

@implementation _HKContextTitleAndIdentifier

- (_HKContextTitleAndIdentifier)initWithTitle:(id)a3 accessibilityIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HKContextTitleAndIdentifier;
  v9 = [(_HKContextTitleAndIdentifier *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_accessibilityIdentifier, a4);
  }

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end