@interface QLBarButtonItem
- (BOOL)_qlIsEqual:(id)a3;
- (unint64_t)QLType;
- (void)setQLType:(unint64_t)a3;
@end

@implementation QLBarButtonItem

- (BOOL)_qlIsEqual:(id)a3
{
  v4 = (QLBarButtonItem *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(QLBarButtonItem *)self QLType];
      if (v6 != [(QLBarButtonItem *)v5 QLType]) {
        goto LABEL_12;
      }
      if ([(QLBarButtonItem *)self QLType] == 3)
      {
        uint64_t v7 = [(QLBarButtonItem *)self action];
        if (v7 != [(QLBarButtonItem *)v5 action]) {
          goto LABEL_12;
        }
      }
      v8 = [(QLBarButtonItem *)self target];
      v9 = [(QLBarButtonItem *)v5 target];

      if (v8 == v9
        && (uint64_t v10 = [(QLBarButtonItem *)self systemItem],
            v10 == [(QLBarButtonItem *)v5 systemItem]))
      {
        v11 = [(QLBarButtonItem *)self title];
        uint64_t v12 = [(QLBarButtonItem *)v5 title];
        if (v11 == (void *)v12)
        {
          char v16 = 1;
          v13 = v11;
        }
        else
        {
          v13 = (void *)v12;
          v14 = [(QLBarButtonItem *)self title];
          v15 = [(QLBarButtonItem *)v5 title];
          char v16 = [v14 isEqualToString:v15];
        }
      }
      else
      {
LABEL_12:
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)QLType
{
  return self->_QLType;
}

- (void)setQLType:(unint64_t)a3
{
  self->_QLType = a3;
}

@end