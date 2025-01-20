@interface MFDatePickerItemIdentifier
- (BOOL)isEqual:(id)a3;
- (MFDatePickerItemIdentifier)initWithIdentifier:(id)a3 type:(unint64_t)a4;
- (NSUUID)identifier;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation MFDatePickerItemIdentifier

- (MFDatePickerItemIdentifier)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFDatePickerItemIdentifier;
  v8 = [(MFDatePickerItemIdentifier *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_type = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MFDatePickerItemIdentifier *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(MFDatePickerItemIdentifier *)self identifier];
      id v7 = [(MFDatePickerItemIdentifier *)v5 identifier];
      if (v6 == v7)
      {
        unint64_t v9 = [(MFDatePickerItemIdentifier *)self type];
        BOOL v8 = v9 == [(MFDatePickerItemIdentifier *)v5 type];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [(MFDatePickerItemIdentifier *)self identifier];
  uint64_t v4 = [v3 hash];

  return 33 * v4 + [(MFDatePickerItemIdentifier *)self type] + 1089;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end