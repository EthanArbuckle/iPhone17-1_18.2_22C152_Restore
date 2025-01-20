@interface ARPHomeControlCorrelationsArchive
+ (BOOL)supportsSecureCoding;
- (ARPHomeControlCorrelationsArchive)initWithCoder:(id)a3;
- (ARPHomeControlCorrelationsArchive)initWithMicrolocationsCorrelationsDictionary:(id)a3 nextActionCorrelationsDictionary:(id)a4 archiveDate:(id)a5;
- (NSDate)archiveDate;
- (NSDictionary)microlocationCorrelationsDictionary;
- (NSDictionary)nextActionCorrelationsDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ARPHomeControlCorrelationsArchive

- (ARPHomeControlCorrelationsArchive)initWithMicrolocationsCorrelationsDictionary:(id)a3 nextActionCorrelationsDictionary:(id)a4 archiveDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ARPHomeControlCorrelationsArchive;
  v12 = [(ARPHomeControlCorrelationsArchive *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_microlocationCorrelationsDictionary, a3);
    objc_storeStrong((id *)&v13->_nextActionCorrelationsDictionary, a4);
    objc_storeStrong((id *)&v13->_archiveDate, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(ARPHomeControlCorrelationsArchive *)self microlocationCorrelationsDictionary];
  v6 = [(ARPHomeControlCorrelationsArchive *)self nextActionCorrelationsDictionary];
  v7 = [(ARPHomeControlCorrelationsArchive *)self archiveDate];
  v8 = (void *)[v4 initWithMicrolocationsCorrelationsDictionary:v5 nextActionCorrelationsDictionary:v6 archiveDate:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ARPHomeControlCorrelationsArchive *)self microlocationCorrelationsDictionary];
  v6 = NSStringFromSelector(sel_microlocationCorrelationsDictionary);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(ARPHomeControlCorrelationsArchive *)self nextActionCorrelationsDictionary];
  v8 = NSStringFromSelector(sel_nextActionCorrelationsDictionary);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(ARPHomeControlCorrelationsArchive *)self archiveDate];
  id v9 = NSStringFromSelector(sel_archiveDate);
  [v4 encodeObject:v10 forKey:v9];
}

- (ARPHomeControlCorrelationsArchive)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  id v10 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  id v11 = NSStringFromSelector(sel_microlocationCorrelationsDictionary);
  v12 = [v5 decodeObjectOfClasses:v10 forKey:v11];

  v13 = NSStringFromSelector(sel_nextActionCorrelationsDictionary);
  v14 = [v5 decodeObjectOfClasses:v10 forKey:v13];

  objc_super v15 = NSStringFromSelector(sel_archiveDate);
  v16 = [v5 decodeObjectOfClasses:v10 forKey:v15];

  v17 = [(ARPHomeControlCorrelationsArchive *)self initWithMicrolocationsCorrelationsDictionary:v12 nextActionCorrelationsDictionary:v14 archiveDate:v16];
  return v17;
}

- (NSDate)archiveDate
{
  return self->_archiveDate;
}

- (NSDictionary)microlocationCorrelationsDictionary
{
  return self->_microlocationCorrelationsDictionary;
}

- (NSDictionary)nextActionCorrelationsDictionary
{
  return self->_nextActionCorrelationsDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextActionCorrelationsDictionary, 0);
  objc_storeStrong((id *)&self->_microlocationCorrelationsDictionary, 0);
  objc_storeStrong((id *)&self->_archiveDate, 0);
}

@end