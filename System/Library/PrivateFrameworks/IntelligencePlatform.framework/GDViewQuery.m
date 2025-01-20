@interface GDViewQuery
+ (BOOL)supportsSecureCoding;
- (BOOL)includeDependencies;
- (GDViewQuery)initWithAll;
- (GDViewQuery)initWithCoder:(id)a3;
- (GDViewQuery)initWithNames:(id)a3 includeDependencies:(BOOL)a4;
- (GDViewQuery)initWithSchedule:(id)a3 includeDependencies:(BOOL)a4;
- (NSArray)names;
- (NSString)schedule;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDViewQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedule, 0);

  objc_storeStrong((id *)&self->_names, 0);
}

- (BOOL)includeDependencies
{
  return self->_includeDependencies;
}

- (NSString)schedule
{
  return self->_schedule;
}

- (NSArray)names
{
  return self->_names;
}

- (GDViewQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)GDViewQuery;
  v5 = [(GDViewQuery *)&v40 init];
  if (v5)
  {
    v6 = v5;
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v13 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v12, v9, 0);
    v14 = NSStringFromSelector(sel_names);
    v17 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v15, (uint64_t)v13, (uint64_t)v14, v16);

    uint64_t v18 = objc_opt_class();
    v19 = NSStringFromSelector(sel_schedule);
    v22 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v18, (uint64_t)v19, v21);

    v23 = NSStringFromSelector(sel_includeDependencies);
    uint64_t v27 = objc_msgSend_decodeBoolForKey_(v4, v24, (uint64_t)v23, v25, v26);

    v32 = objc_msgSend_error(v4, v28, v29, v30, v31);

    if (v32)
    {
      v37 = 0;
    }
    else
    {
      if (v17)
      {
        v38 = objc_msgSend_initWithNames_includeDependencies_(v6, v33, (uint64_t)v17, v27, v36);
      }
      else if (v22)
      {
        v38 = objc_msgSend_initWithSchedule_includeDependencies_(v6, v33, (uint64_t)v22, v27, v36);
      }
      else
      {
        v38 = objc_msgSend_initWithAll(v6, v33, v34, v35, v36);
      }
      v6 = v38;
      v37 = v6;
    }
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (void)encodeWithCoder:(id)a3
{
  names = self->_names;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_names);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)names, (uint64_t)v6, v8);

  schedule = self->_schedule;
  v10 = NSStringFromSelector(sel_schedule);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)schedule, (uint64_t)v10, v12);

  BOOL includeDependencies = self->_includeDependencies;
  NSStringFromSelector(sel_includeDependencies);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v5, v14, includeDependencies, (uint64_t)v16, v15);
}

- (GDViewQuery)initWithAll
{
  v3.receiver = self;
  v3.super_class = (Class)GDViewQuery;
  return [(GDViewQuery *)&v3 init];
}

- (GDViewQuery)initWithSchedule:(id)a3 includeDependencies:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GDViewQuery;
  uint64_t v8 = [(GDViewQuery *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_schedule, a3);
    v9->_BOOL includeDependencies = a4;
  }

  return v9;
}

- (GDViewQuery)initWithNames:(id)a3 includeDependencies:(BOOL)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GDViewQuery;
  objc_super v11 = [(GDViewQuery *)&v15 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
    names = v11->_names;
    v11->_names = (NSArray *)v12;

    v11->_BOOL includeDependencies = a4;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end