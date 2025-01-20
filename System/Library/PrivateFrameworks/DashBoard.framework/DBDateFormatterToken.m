@interface DBDateFormatterToken
+ (id)tokenWithDateStyle:(unint64_t)a3 timeStyle:(unint64_t)a4;
+ (id)tokenWithFormatString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)formatString;
- (id)description;
- (unint64_t)dateStyle;
- (unint64_t)hash;
- (unint64_t)timeStyle;
- (void)setDateStyle:(unint64_t)a3;
- (void)setFormatString:(id)a3;
- (void)setTimeStyle:(unint64_t)a3;
@end

@implementation DBDateFormatterToken

+ (id)tokenWithFormatString:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setFormatString:v3];

  return v4;
}

+ (id)tokenWithDateStyle:(unint64_t)a3 timeStyle:(unint64_t)a4
{
  v6 = objc_opt_new();
  [v6 setDateStyle:a3];
  [v6 setTimeStyle:a4];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v5 = v4;
    if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    unint64_t v8 = [(DBDateFormatterToken *)self dateStyle];
    if (v8 == [v6 dateStyle]
      && (unint64_t v9 = -[DBDateFormatterToken timeStyle](self, "timeStyle"), v9 == [v6 timeStyle]))
    {
      v10 = [(DBDateFormatterToken *)self formatString];
      v11 = [v6 formatString];
      char v7 = [v10 isEqualToString:v11];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(DBDateFormatterToken *)self formatString];
  id v6 = [v3 stringWithFormat:@"<%@: %p formatString=%@ dateStyle=%lu timeStyle=%lu>", v4, self, v5, -[DBDateFormatterToken dateStyle](self, "dateStyle"), -[DBDateFormatterToken timeStyle](self, "timeStyle")];

  return v6;
}

- (unint64_t)hash
{
  v2 = [(DBDateFormatterToken *)self description];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)formatString
{
  return self->_formatString;
}

- (void)setFormatString:(id)a3
{
}

- (unint64_t)dateStyle
{
  return self->_dateStyle;
}

- (void)setDateStyle:(unint64_t)a3
{
  self->_dateStyle = a3;
}

- (unint64_t)timeStyle
{
  return self->_timeStyle;
}

- (void)setTimeStyle:(unint64_t)a3
{
  self->_timeStyle = a3;
}

- (void).cxx_destruct
{
}

@end