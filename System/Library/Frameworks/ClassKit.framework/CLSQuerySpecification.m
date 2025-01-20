@interface CLSQuerySpecification
+ (BOOL)supportsSecureCoding;
+ (CLSQuerySpecification)querySpecificationWithObjectName:(id)a3 predicate:(id)a4;
+ (CLSQuerySpecification)querySpecificationWithObjectType:(Class)a3 predicate:(id)a4;
- (CLSQuerySpecification)init;
- (CLSQuerySpecification)initWithCoder:(id)a3;
- (CLSQuerySpecification)initWithObjectName:(id)a3 predicate:(id)a4;
- (CLSQuerySpecification)initWithObjectType:(Class)a3 predicate:(id)a4;
- (NSArray)sortDescriptors;
- (NSPredicate)predicate;
- (NSString)entityName;
- (unint64_t)limit;
- (unint64_t)observerOptions;
- (unint64_t)offset;
- (void)encodeWithCoder:(id)a3;
- (void)setLimit:(unint64_t)a3;
- (void)setObserverOptions:(unint64_t)a3;
- (void)setOffset:(unint64_t)a3;
- (void)setPredicate:(id)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation CLSQuerySpecification

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (CLSQuerySpecification)querySpecificationWithObjectType:(Class)a3 predicate:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)a1);
  v9 = objc_msgSend_initWithObjectType_predicate_(v7, v8, (uint64_t)a3, v6);

  return (CLSQuerySpecification *)v9;
}

+ (CLSQuerySpecification)querySpecificationWithObjectName:(id)a3 predicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  v10 = objc_msgSend_initWithObjectName_predicate_(v8, v9, (uint64_t)v7, v6);

  return (CLSQuerySpecification *)v10;
}

- (void)encodeWithCoder:(id)a3
{
  entityName = self->_entityName;
  id v5 = a3;
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)entityName, @"entityName");
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)self->_predicate, @"predicate");
  objc_msgSend_encodeObject_forKey_(v5, v8, (uint64_t)self->_sortDescriptors, @"sortDescriptors");
  v10 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v9, self->_offset);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)v10, @"offset");

  v13 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v12, self->_limit);
  objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)v13, @"limit");

  objc_msgSend_numberWithUnsignedInteger_(NSNumber, v15, self->_observerOptions);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v16, (uint64_t)v17, @"observerOptions");
}

- (CLSQuerySpecification)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CLSQuerySpecification;
  id v5 = [(CLSQuerySpecification *)&v38 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v11 = objc_msgSend_setWithObjects_(v6, v10, v7, v8, v9, 0);
    uint64_t v12 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"entityName");
    entityName = v5->_entityName;
    v5->_entityName = (NSString *)v14;

    uint64_t v17 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v11, @"predicate");
    predicate = v5->_predicate;
    v5->_predicate = (NSPredicate *)v17;

    uint64_t v20 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v19, (uint64_t)v11, @"sortDescriptors");
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v20;

    uint64_t v22 = objc_opt_class();
    v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, @"offset");
    v5->_offset = objc_msgSend_unsignedIntegerValue(v24, v25, v26);

    uint64_t v27 = objc_opt_class();
    v29 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, @"limit");
    v5->_limit = objc_msgSend_unsignedIntegerValue(v29, v30, v31);

    uint64_t v32 = objc_opt_class();
    v34 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v33, v32, @"observerOptions");
    v5->_observerOptions = objc_msgSend_unsignedIntegerValue(v34, v35, v36);
  }
  return v5;
}

- (CLSQuerySpecification)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = NSString;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = NSStringFromSelector(a2);
  uint64_t v9 = objc_msgSend_stringWithFormat_(v5, v8, @"The method -[%@ %@] is not available.", v6, v7);
  objc_msgSend_exceptionWithName_reason_userInfo_(v3, v10, v4, v9, 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (CLSQuerySpecification)initWithObjectType:(Class)a3 predicate:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CLSQuerySpecification;
  uint64_t v8 = [(CLSQuerySpecification *)&v12 init];
  if (v8)
  {
    uint64_t v9 = NSStringFromClass(a3);
    entityName = v8->_entityName;
    v8->_entityName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_predicate, a4);
    v8->_limit = 0;
    v8->_offset = 0;
  }

  return v8;
}

- (CLSQuerySpecification)initWithObjectName:(id)a3 predicate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CLSQuerySpecification;
  uint64_t v9 = [(CLSQuerySpecification *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entityName, a3);
    objc_storeStrong((id *)&v10->_predicate, a4);
    v10->_limit = 0;
    v10->_offset = 0;
  }

  return v10;
}

- (void)setPredicate:(id)a3
{
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (NSString)entityName
{
  return self->_entityName;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (unint64_t)observerOptions
{
  return self->_observerOptions;
}

- (void)setObserverOptions:(unint64_t)a3
{
  self->_observerOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);

  objc_storeStrong((id *)&self->_entityName, 0);
}

@end