@interface EMMessageReadLaterAction
+ (BOOL)supportsSecureCoding;
- (EMMessageReadLaterAction)initWithCoder:(id)a3;
- (EMMessageReadLaterAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 readLaterDate:(id)a6;
- (NSDate)readLaterDate;
- (int64_t)signpostType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EMMessageReadLaterAction

- (EMMessageReadLaterAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 readLaterDate:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)EMMessageReadLaterAction;
  v12 = [(EMMessageChangeAction *)&v15 initWithMessageListItems:a3 origin:a4 actor:a5];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_readLaterDate, a6);
  }

  return v13;
}

- (int64_t)signpostType
{
  return 10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageReadLaterAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMMessageReadLaterAction;
  v5 = [(EMMessageChangeAction *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_readLaterDate"];
    readLaterDate = v5->_readLaterDate;
    v5->_readLaterDate = (NSDate *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EMMessageReadLaterAction;
  [(EMMessageChangeAction *)&v6 encodeWithCoder:v4];
  v5 = [(EMMessageReadLaterAction *)self readLaterDate];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_readLaterDate"];
}

- (NSDate)readLaterDate
{
  return self->_readLaterDate;
}

- (void).cxx_destruct
{
}

@end