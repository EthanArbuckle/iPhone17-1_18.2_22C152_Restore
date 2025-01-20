@interface HFOrderedHomeKitItemData
+ (id)dataWithUniqueIdentifier:(id)a3 title:(id)a4 dateAdded:(id)a5;
- (NSDate)dateAdded;
- (NSString)actionSetType;
- (NSString)title;
- (NSUUID)uniqueIdentifier;
- (void)setActionSetType:(id)a3;
- (void)setDateAdded:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation HFOrderedHomeKitItemData

+ (id)dataWithUniqueIdentifier:(id)a3 title:(id)a4 dateAdded:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)a1);
  [v11 setUniqueIdentifier:v10];

  [v11 setTitle:v9];
  [v11 setDateAdded:v8];

  return v11;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setDateAdded:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionSetType, 0);
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)actionSetType
{
  return self->_actionSetType;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (void)setActionSetType:(id)a3
{
}

@end