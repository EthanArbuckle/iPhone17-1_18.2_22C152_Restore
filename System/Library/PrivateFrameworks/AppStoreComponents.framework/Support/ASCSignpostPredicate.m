@interface ASCSignpostPredicate
+ (BOOL)supportsSecureCoding;
- (ASCSignpostPredicate)init;
- (ASCSignpostPredicate)initWithCoder:(id)a3;
- (ASCSignpostPredicate)initWithSpans:(id)a3;
- (ASCSignpostPredicate)initWithTags:(id)a3 dateRanges:(id)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSArray)dateRanges;
- (NSSet)tags;
- (id)description;
- (id)predicateByAddingDateRange:(id)a3;
- (id)predicateByAddingTag:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCSignpostPredicate

- (ASCSignpostPredicate)initWithTags:(id)a3 dateRanges:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_10000F3C4();
  v14.receiver = self;
  v14.super_class = (Class)ASCSignpostPredicate;
  v8 = [(ASCSignpostPredicate *)&v14 init];
  if (v8)
  {
    v9 = (NSSet *)[v6 copy];
    tags = v8->_tags;
    v8->_tags = v9;

    v11 = (NSArray *)[v7 copy];
    dateRanges = v8->_dateRanges;
    v8->_dateRanges = v11;
  }
  return v8;
}

- (ASCSignpostPredicate)initWithSpans:(id)a3
{
  v17 = self;
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "dateRange", v17);
        if (v12)
        {
          v13 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v11 primaryTag]);
          [v4 addObject:v13];

          objc_super v14 = [v11 supplementaryTags];
          [v4 unionSet:v14];

          [v5 addObject:v12];
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10013F094(buf, (uint64_t)v11, &v23);
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }

  v15 = [(ASCSignpostPredicate *)v17 initWithTags:v4 dateRanges:v5];
  return v15;
}

- (ASCSignpostPredicate)init
{
  id v3 = +[NSSet set];
  id v4 = [(ASCSignpostPredicate *)self initWithTags:v3 dateRanges:&__NSArray0__struct];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCSignpostPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSSet);
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"tags"];
  if (v8)
  {
    id v9 = objc_alloc((Class)NSSet);
    uint64_t v10 = objc_opt_class();
    id v11 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"dateRanges"];
    if (v12)
    {
      self = [(ASCSignpostPredicate *)self initWithTags:v8 dateRanges:v12];
      v13 = self;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10013F128();
      }
      v13 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10013F0E0();
    }
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCSignpostPredicate *)self tags];
  [v4 encodeObject:v5 forKey:@"tags"];

  id v6 = [(ASCSignpostPredicate *)self dateRanges];
  [v4 encodeObject:v6 forKey:@"dateRanges"];
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(ASCHasher);
  id v4 = [(ASCSignpostPredicate *)self tags];
  [(ASCHasher *)v3 combineObject:v4];

  id v5 = [(ASCSignpostPredicate *)self dateRanges];
  [(ASCHasher *)v3 combineObject:v5];

  unint64_t v6 = [(ASCHasher *)v3 finalizeHash];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      unint64_t v6 = v5;
    }
    else {
      unint64_t v6 = 0;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [(ASCSignpostPredicate *)self tags];
    uint64_t v9 = [v7 tags];
    uint64_t v10 = (void *)v9;
    if (v8 && v9)
    {
      if ([v8 isEqual:v9]) {
        goto LABEL_10;
      }
    }
    else if (v8 == (void *)v9)
    {
LABEL_10:
      id v11 = [(ASCSignpostPredicate *)self dateRanges];
      uint64_t v12 = [v7 dateRanges];
      v13 = (void *)v12;
      if (v11 && v12) {
        unsigned __int8 v14 = [v11 isEqual:v12];
      }
      else {
        unsigned __int8 v14 = v11 == (void *)v12;
      }

      goto LABEL_18;
    }
    unsigned __int8 v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  unsigned __int8 v14 = 0;
LABEL_19:

  return v14;
}

- (id)description
{
  id v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCSignpostPredicate *)self tags];
  [(ASCDescriber *)v3 addObject:v4 withName:@"tags"];

  id v5 = [(ASCSignpostPredicate *)self dateRanges];
  [(ASCDescriber *)v3 addObject:v5 withName:@"dateRanges"];

  unint64_t v6 = [(ASCDescriber *)v3 finalizeDescription];

  return v6;
}

- (BOOL)isEmpty
{
  id v3 = [(ASCSignpostPredicate *)self tags];
  if ([v3 count])
  {
    id v4 = [(ASCSignpostPredicate *)self dateRanges];
    BOOL v5 = [v4 count] == 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)predicateByAddingTag:(unint64_t)a3
{
  BOOL v5 = [(ASCSignpostPredicate *)self tags];
  unint64_t v6 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v7 = [v5 setByAddingObject:v6];

  id v8 = objc_alloc((Class)objc_opt_class());
  uint64_t v9 = [(ASCSignpostPredicate *)self dateRanges];
  id v10 = [v8 initWithTags:v7 dateRanges:v9];

  return v10;
}

- (id)predicateByAddingDateRange:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ASCSignpostPredicate *)self dateRanges];
  unint64_t v6 = [v5 arrayByAddingObject:v4];

  id v7 = objc_alloc((Class)objc_opt_class());
  id v8 = [(ASCSignpostPredicate *)self tags];
  id v9 = [v7 initWithTags:v8 dateRanges:v6];

  return v9;
}

- (NSSet)tags
{
  return self->_tags;
}

- (NSArray)dateRanges
{
  return self->_dateRanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRanges, 0);

  objc_storeStrong((id *)&self->_tags, 0);
}

@end