@interface MRUSubtitleValue
- (BOOL)isEqualToSubtitleValue:(id)a3;
- (MRUSubtitleValue)initWithText:(id)a3 icon:(id)a4 accessory:(int64_t)a5;
- (NSString)text;
- (UIImage)icon;
- (id)description;
- (int64_t)accessory;
@end

@implementation MRUSubtitleValue

- (MRUSubtitleValue)initWithText:(id)a3 icon:(id)a4 accessory:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRUSubtitleValue;
  v10 = [(MRUSubtitleValue *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    text = v10->_text;
    v10->_text = (NSString *)v11;

    objc_storeStrong((id *)&v10->_icon, a4);
    v10->_accessory = a5;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MRUSubtitleValue *)self text];
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRUSubtitleValue accessory](self, "accessory"));
  v7 = [v3 stringWithFormat:@"<%@: %p text=%@ accessory=%@ >", v4, self, v5, v6];

  return v7;
}

- (BOOL)isEqualToSubtitleValue:(id)a3
{
  id v4 = a3;
  v5 = [(MRUSubtitleValue *)self text];
  v6 = [v4 text];
  if ([v5 isEqual:v6])
  {
    v7 = [(MRUSubtitleValue *)self icon];
    id v8 = [v4 icon];
    if (v7 == v8)
    {
      int64_t v10 = [(MRUSubtitleValue *)self accessory];
      BOOL v9 = v10 == [v4 accessory];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSString)text
{
  return self->_text;
}

- (UIImage)icon
{
  return self->_icon;
}

- (int64_t)accessory
{
  return self->_accessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end