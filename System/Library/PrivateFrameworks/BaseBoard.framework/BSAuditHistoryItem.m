@interface BSAuditHistoryItem
+ (BOOL)supportsSecureCoding;
+ (id)itemWithString:(id)a3;
+ (id)itemWithWithFormat:(id)a3;
- (BSAuditHistoryItem)initWithCoder:(id)a3;
- (BSAuditHistoryItem)initWithXPCDictionary:(id)a3;
- (NSDate)date;
- (NSString)description;
- (NSString)value;
- (void)_initWithString:(void *)a1;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setDate:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation BSAuditHistoryItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

+ (id)itemWithString:(id)a3
{
  id v4 = a3;
  v5 = -[BSAuditHistoryItem _initWithString:](objc_alloc((Class)a1), v4);

  return v5;
}

- (void)_initWithString:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)BSAuditHistoryItem;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
      v5 = (void *)a1[1];
      a1[1] = v4;

      uint64_t v6 = [v3 copy];
      v7 = (void *)a1[2];
      a1[2] = v6;
    }
  }

  return a1;
}

+ (id)itemWithWithFormat:(id)a3
{
  id v4 = a3;
  v5 = (void *)[[NSString alloc] initWithFormat:v4 arguments:&v9];
  uint64_t v6 = -[BSAuditHistoryItem _initWithString:](objc_alloc((Class)a1), v5);

  return v6;
}

- (NSString)description
{
  if (self)
  {
    if (qword_1EB21B090 != -1) {
      dispatch_once(&qword_1EB21B090, &__block_literal_global_4);
    }
    id v3 = (id)_MergedGlobals_7;
  }
  else
  {
    id v3 = 0;
  }
  id v4 = [v3 stringFromDate:self->_date];

  v5 = [NSString stringWithFormat:@"TIME: %@; DESCRIPTION: %@", v4, self->_description];

  return (NSString *)v5;
}

uint64_t __36__BSAuditHistoryItem__timeFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_7;
  _MergedGlobals_7 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_7;
  return [v2 setDateFormat:@"HH:mm:ss.SSS"];
}

- (BSAuditHistoryItem)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BSAuditHistoryItem;
  v5 = [(BSAuditHistoryItem *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", BSDeserializeDoubleFromXPCDictionaryWithKey(v4, "date"));
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    v8 = BSCreateDeserializedStringFromXPCDictionaryWithKey(v4, "desc");
    description = v5->_description;
    v5->_description = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v5 = a3;
  [(NSDate *)self->_date timeIntervalSinceReferenceDate];
  BSSerializeDoubleToXPCDictionaryWithKey(v5, "date", v4);
  BSSerializeStringToXPCDictionaryWithKey(self->_description, v5, "desc");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BSAuditHistoryItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BSAuditHistoryItem;
  id v5 = [(BSAuditHistoryItem *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"desc"];
    description = v5->_description;
    v5->_description = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_date forKey:@"date"];
  [v4 encodeObject:self->_description forKey:@"desc"];
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)value
{
  return self->_description;
}

- (void)setValue:(id)a3
{
}

@end