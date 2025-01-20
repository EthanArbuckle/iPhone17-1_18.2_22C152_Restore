@interface AccountActiveTime
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation AccountActiveTime

- (id)description
{
  if (self) {
    double start = self->_start;
  }
  else {
    double start = 0.0;
  }
  v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:start];
  if (self)
  {
    v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:self->_end];
    v6 = v5;
    if (self->_end != 0.0)
    {
      sub_1002826D4(v5);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  else
  {
    v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:0.0];
  }
  v7 = @"n/a";
LABEL_9:
  v9 = sub_1002826D4(v4);
  if (self) {
    id Property = objc_getProperty(self, v8, 8, 1);
  }
  else {
    id Property = 0;
  }
  v12 = sub_100222B34(Property);
  if (self) {
    id v13 = objc_getProperty(self, v11, 8, 1);
  }
  else {
    id v13 = 0;
  }
  v14 = sub_100222B6C(v13);
  v15 = +[NSString stringWithFormat:@"{ start: %@ end: %@ accountID: %@/%@ }", v9, v7, v12, v14];

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(AccountActiveTime);
  v6 = [(AccountEvent *)self->_event copyWithZone:a3];
  event = v5->_event;
  v5->_event = v6;

  v5->_double start = self->_start;
  v5->_end = self->_end;
  return v5;
}

- (void).cxx_destruct
{
}

@end