@interface ASCSignpostSpan
+ (BOOL)supportsSecureCoding;
- (ASCSignpostSpan)init;
- (ASCSignpostSpan)initWithCoder:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDateInterval)dateRange;
- (NSMutableSet)mutableSupplementaryTags;
- (NSSet)supplementaryTags;
- (id)description;
- (unint64_t)primaryTag;
- (void)addSupplementaryTag:(unint64_t)a3;
- (void)beginEmitting;
- (void)encodeWithCoder:(id)a3;
- (void)endEmitting;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation ASCSignpostSpan

- (ASCSignpostSpan)init
{
  sub_10000F3C4();
  v7.receiver = self;
  v7.super_class = (Class)ASCSignpostSpan;
  v3 = [(ASCSignpostSpan *)&v7 init];
  if (v3)
  {
    v3->_primaryTag = ASCSignpostTagUnique();
    v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mutableSupplementaryTags = v3->_mutableSupplementaryTags;
    v3->_mutableSupplementaryTags = v4;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCSignpostSpan)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSSet);
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"supplementaryTags"];
  if (v8)
  {
    v18.receiver = self;
    v18.super_class = (Class)ASCSignpostSpan;
    v9 = [(ASCSignpostSpan *)&v18 init];
    if (v9)
    {
      v9->_primaryTag = (unint64_t)[v4 decodeInt64ForKey:@"primaryTag"];
      v10 = (NSMutableSet *)[v8 mutableCopy];
      mutableSupplementaryTags = v9->_mutableSupplementaryTags;
      v9->_mutableSupplementaryTags = v10;

      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
      startDate = v9->_startDate;
      v9->_startDate = (NSDate *)v12;

      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
      endDate = v9->_endDate;
      v9->_endDate = (NSDate *)v14;
    }
    self = v9;
    v16 = self;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10013F170();
    }
    v16 = 0;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[ASCSignpostSpan primaryTag](self, "primaryTag"), @"primaryTag");
  id v5 = [(ASCSignpostSpan *)self supplementaryTags];
  [v4 encodeObject:v5 forKey:@"supplementaryTags"];

  uint64_t v6 = [(ASCSignpostSpan *)self startDate];
  [v4 encodeObject:v6 forKey:@"startDate"];

  id v7 = [(ASCSignpostSpan *)self endDate];
  [v4 encodeObject:v7 forKey:@"endDate"];
}

- (NSSet)supplementaryTags
{
  v2 = [(ASCSignpostSpan *)self mutableSupplementaryTags];
  id v3 = [v2 copy];

  return (NSSet *)v3;
}

- (NSDateInterval)dateRange
{
  uint64_t v3 = [(ASCSignpostSpan *)self startDate];
  if (!v3) {
    goto LABEL_5;
  }
  id v4 = (void *)v3;
  uint64_t v5 = [(ASCSignpostSpan *)self endDate];
  if (!v5)
  {
    id v12 = 0;
    goto LABEL_7;
  }
  uint64_t v6 = (void *)v5;
  id v7 = [(ASCSignpostSpan *)self endDate];
  v8 = [(ASCSignpostSpan *)self startDate];
  id v9 = [v7 compare:v8];

  if (v9 == (id)-1)
  {
LABEL_5:
    id v12 = 0;
    goto LABEL_8;
  }
  id v10 = objc_alloc((Class)NSDateInterval);
  id v4 = [(ASCSignpostSpan *)self startDate];
  v11 = [(ASCSignpostSpan *)self endDate];
  id v12 = [v10 initWithStartDate:v4 endDate:v11];

LABEL_7:
LABEL_8:

  return (NSDateInterval *)v12;
}

- (void)addSupplementaryTag:(unint64_t)a3
{
  id v5 = [(ASCSignpostSpan *)self mutableSupplementaryTags];
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [v5 addObject:v4];
}

- (void)beginEmitting
{
  uint64_t v3 = [(ASCSignpostSpan *)self startDate];

  if (v3) {
    objc_exception_throw([objc_alloc((Class)NSException) initWithName:NSInternalInconsistencyException reason:@"Signpost span has already begun" userInfo:0]);
  }
  id v4 = +[NSDate dateWithTimeIntervalSinceNow:-1.0];
  [(ASCSignpostSpan *)self setStartDate:v4];
}

- (void)endEmitting
{
  uint64_t v3 = [(ASCSignpostSpan *)self startDate];

  if (!v3)
  {
    id v5 = objc_alloc((Class)NSException);
    NSExceptionName v6 = NSInternalInconsistencyException;
    CFStringRef v7 = @"Cannot end signpost span which has not begun";
    goto LABEL_8;
  }
  id v4 = [(ASCSignpostSpan *)self endDate];

  if (v4)
  {
    id v5 = objc_alloc((Class)NSException);
    NSExceptionName v6 = NSInternalInconsistencyException;
    CFStringRef v7 = @"Signpost span has already ended";
LABEL_8:
    objc_exception_throw([v5 initWithName:v6 reason:v7 userInfo:0]);
  }
  id v8 = +[NSDate dateWithTimeIntervalSinceNow:1.0];
  [(ASCSignpostSpan *)self setEndDate:v8];
}

- (id)description
{
  uint64_t v3 = [[ASCDescriber alloc] initWithObject:self];
  [(ASCDescriber *)v3 addUInt64:[(ASCSignpostSpan *)self primaryTag] withName:@"primaryTag"];
  id v4 = [(ASCSignpostSpan *)self mutableSupplementaryTags];
  [(ASCDescriber *)v3 addObject:v4 withName:@"supplementaryTags"];

  id v5 = [(ASCSignpostSpan *)self startDate];
  [(ASCDescriber *)v3 addObject:v5 withName:@"startDate"];

  NSExceptionName v6 = [(ASCSignpostSpan *)self endDate];
  [(ASCDescriber *)v3 addObject:v6 withName:@"endDate"];

  CFStringRef v7 = [(ASCDescriber *)v3 finalizeDescription];

  return v7;
}

- (unint64_t)primaryTag
{
  return self->_primaryTag;
}

- (NSMutableSet)mutableSupplementaryTags
{
  return self->_mutableSupplementaryTags;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_mutableSupplementaryTags, 0);
}

@end