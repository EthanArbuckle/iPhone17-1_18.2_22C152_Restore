@interface MinMaxIntFormatter
+ (id)formatterForMin:(int64_t)a3 max:(int64_t)a4;
- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5;
- (MinMaxIntFormatter)initWithMin:(int64_t)a3 max:(int64_t)a4;
- (int64_t)maximum;
- (int64_t)minimum;
- (void)setMaximum:(int64_t)a3;
- (void)setMinimum:(int64_t)a3;
@end

@implementation MinMaxIntFormatter

+ (id)formatterForMin:(int64_t)a3 max:(int64_t)a4
{
  v6 = [MinMaxIntFormatter alloc];
  v8 = objc_msgSend_initWithMin_max_(v6, v7, a3, a4);

  return v8;
}

- (MinMaxIntFormatter)initWithMin:(int64_t)a3 max:(int64_t)a4
{
  uint64_t v7 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x263F08708], a2, a3);
  v13.receiver = self;
  v13.super_class = (Class)MinMaxIntFormatter;
  v8 = [(APFormatter *)&v13 initWithCharacterSet:v7 withMaxLength:0];
  v10 = v8;
  if (v8)
  {
    objc_msgSend_setMinimum_(v8, v9, a3);
    objc_msgSend_setMaximum_(v10, v11, a4);
  }
  return v10;
}

- (void)setMinimum:(int64_t)a3
{
  self->_minimum = a3;
}

- (int64_t)minimum
{
  return self->_minimum;
}

- (void)setMaximum:(int64_t)a3
{
  self->_maximum = a3;
}

- (int64_t)maximum
{
  return self->_maximum;
}

- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5
{
  v29.receiver = self;
  v29.super_class = (Class)MinMaxIntFormatter;
  BOOL v9 = -[APFormatter isPartialStringValid:newEditingString:errorDescription:](&v29, sel_isPartialStringValid_newEditingString_errorDescription_);
  if (v9)
  {
    if (objc_msgSend_length(a3, v10, v11))
    {
      uint64_t v14 = objc_msgSend_integerValue(a3, v12, v13);
      if (v14 < objc_msgSend_minimum(self, v15, v16))
      {
        if (a4)
        {
          v19 = NSString;
          uint64_t v20 = objc_msgSend_minimum(self, v17, v18);
          *a4 = (id)objc_msgSend_stringWithFormat_(v19, v21, @"%ld", v20);
        }
        if (a5)
        {
          v22 = @"gErG";
LABEL_13:
          LOBYTE(v9) = 0;
          *a5 = v22;
          return v9;
        }
        goto LABEL_15;
      }
      if (v14 > objc_msgSend_maximum(self, v17, v18))
      {
        if (a4)
        {
          v25 = NSString;
          uint64_t v26 = objc_msgSend_maximum(self, v23, v24);
          *a4 = (id)objc_msgSend_stringWithFormat_(v25, v27, @"%ld", v26);
        }
        if (a5)
        {
          v22 = @"gErF";
          goto LABEL_13;
        }
LABEL_15:
        LOBYTE(v9) = 0;
        return v9;
      }
    }
    LOBYTE(v9) = 1;
  }
  return v9;
}

@end