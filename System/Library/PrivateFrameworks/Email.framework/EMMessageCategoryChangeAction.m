@interface EMMessageCategoryChangeAction
+ (BOOL)isModelCategoryRestoration:(unint64_t)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)isModelCategoryRestoration;
- (ECEmailAddressConvertible)senderAddress;
- (EMMessageCategoryChangeAction)initWithCoder:(id)a3;
- (EMMessageCategoryChangeAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 categoryType:(unint64_t)a6 changeOptions:(unint64_t)a7;
- (EMMessageCategoryChangeAction)initWithSenderAddress:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 categoryType:(unint64_t)a6 changeOptions:(unint64_t)a7;
- (int64_t)signpostType;
- (unint64_t)categoryType;
- (unint64_t)changeOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setCategoryType:(unint64_t)a3;
- (void)setChangeOptions:(unint64_t)a3;
- (void)setSenderAddress:(id)a3;
@end

@implementation EMMessageCategoryChangeAction

+ (BOOL)isModelCategoryRestoration:(unint64_t)a3
{
  return (a3 >> 1) & 1;
}

- (EMMessageCategoryChangeAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 categoryType:(unint64_t)a6 changeOptions:(unint64_t)a7
{
  v10.receiver = self;
  v10.super_class = (Class)EMMessageCategoryChangeAction;
  result = [(EMMessageChangeAction *)&v10 initWithMessageListItems:a3 origin:a4 actor:a5];
  if (result)
  {
    result->_categoryType = a6;
    result->_changeOptions = a7;
  }
  return result;
}

- (EMMessageCategoryChangeAction)initWithSenderAddress:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 categoryType:(unint64_t)a6 changeOptions:(unint64_t)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)EMMessageCategoryChangeAction;
  v14 = [(EMMessageChangeAction *)&v17 initWithMessageListItems:0 origin:a4 actor:a5];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_senderAddress, a3);
    v15->_categoryType = a6;
    v15->_changeOptions = a7;
  }

  return v15;
}

- (BOOL)isModelCategoryRestoration
{
  unint64_t v2 = [(EMMessageCategoryChangeAction *)self changeOptions];
  return +[EMMessageCategoryChangeAction isModelCategoryRestoration:v2];
}

- (int64_t)signpostType
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageCategoryChangeAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMMessageCategoryChangeAction;
  v5 = [(EMMessageChangeAction *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_categoryType = [v4 decodeIntegerForKey:@"EFPropertyKey_categoryType"];
    v5->_changeOptions = [v4 decodeIntegerForKey:@"EFPropertyKey_changeOptions"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_senderAddress"];
    senderAddress = v5->_senderAddress;
    v5->_senderAddress = (ECEmailAddressConvertible *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EMMessageCategoryChangeAction;
  [(EMMessageChangeAction *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[EMMessageCategoryChangeAction categoryType](self, "categoryType"), @"EFPropertyKey_categoryType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[EMMessageCategoryChangeAction changeOptions](self, "changeOptions"), @"EFPropertyKey_changeOptions");
  v5 = [(EMMessageCategoryChangeAction *)self senderAddress];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_senderAddress"];
}

- (unint64_t)categoryType
{
  return self->_categoryType;
}

- (void)setCategoryType:(unint64_t)a3
{
  self->_categoryType = a3;
}

- (unint64_t)changeOptions
{
  return self->_changeOptions;
}

- (void)setChangeOptions:(unint64_t)a3
{
  self->_changeOptions = a3;
}

- (ECEmailAddressConvertible)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end