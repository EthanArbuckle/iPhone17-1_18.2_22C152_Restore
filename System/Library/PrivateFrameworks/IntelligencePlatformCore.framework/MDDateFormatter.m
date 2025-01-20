@interface MDDateFormatter
- (MDDateFormatter)init;
- (id)iso8601StringPlusPrecisionForDate:(id)a3 isAllDay:(BOOL)a4;
@end

@implementation MDDateFormatter

- (void).cxx_destruct
{
}

- (id)iso8601StringPlusPrecisionForDate:(id)a3 isAllDay:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = NSString;
  uint64_t v6 = objc_msgSend_stringFromDate_(self->_formatter, a2, (uint64_t)a3, a4);
  v9 = (void *)v6;
  if (v4) {
    objc_msgSend_stringWithFormat_(v5, v7, @"%@_%@", v8, v6, @"DAY");
  }
  else {
  v10 = objc_msgSend_stringWithFormat_(v5, v7, @"%@_%@", v8, v6, @"SECOND");
  }

  return v10;
}

- (MDDateFormatter)init
{
  v6.receiver = self;
  v6.super_class = (Class)MDDateFormatter;
  v2 = [(MDDateFormatter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    formatter = v2->_formatter;
    v2->_formatter = (NSISO8601DateFormatter *)v3;
  }
  return v2;
}

@end