@interface CRFDRRCHL
- (CRFDRRCHL)init;
- (CRFDRRCHL)initWithrepairDateStr:(id)a3 repairDate:(id)a4 repairCenter:(id)a5 dataClasses:(id)a6 properties:(id)a7;
- (NSDate)repairDate;
- (NSSet)dataClasses;
- (NSSet)properties;
- (NSString)repairCenter;
- (NSString)repairDateStr;
- (id)description;
- (void)setDataClasses:(id)a3;
- (void)setProperties:(id)a3;
- (void)setRepairCenter:(id)a3;
- (void)setRepairDate:(id)a3;
- (void)setRepairDateStr:(id)a3;
@end

@implementation CRFDRRCHL

- (CRFDRRCHL)initWithrepairDateStr:(id)a3 repairDate:(id)a4 repairCenter:(id)a5 dataClasses:(id)a6 properties:(id)a7
{
  id v13 = a3;
  id v22 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    v23.receiver = self;
    v23.super_class = (Class)CRFDRRCHL;
    v17 = [(CRFDRRCHL *)&v23 init];
    p_isa = (id *)&v17->super.isa;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_repairDateStr, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
      objc_storeStrong(p_isa + 4, a6);
      objc_storeStrong(p_isa + 5, a7);
    }
    self = p_isa;
    v19 = self;
  }
  else
  {
    v20 = handleForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_21FC62B40(v20);
    }

    v19 = 0;
  }

  return v19;
}

- (CRFDRRCHL)init
{
  return 0;
}

- (id)description
{
  v5 = NSString;
  v6 = objc_msgSend_repairDateStr(self, a2, v2, v3);
  v10 = objc_msgSend_repairDate(self, v7, v8, v9);
  id v14 = objc_msgSend_repairCenter(self, v11, v12, v13);
  v18 = objc_msgSend_dataClasses(self, v15, v16, v17);
  id v22 = objc_msgSend_allObjects(v18, v19, v20, v21);
  v26 = objc_msgSend_properties(self, v23, v24, v25);
  v30 = objc_msgSend_allObjects(v26, v27, v28, v29);
  v33 = objc_msgSend_stringWithFormat_(v5, v31, @"[CRRepairHistory: timeStr:%@: repairDate:%@ repairCenter:%@: dataClasses:%@: properties:%@:]", v32, v6, v10, v14, v22, v30);

  return v33;
}

- (NSString)repairDateStr
{
  return self->_repairDateStr;
}

- (void)setRepairDateStr:(id)a3
{
}

- (NSDate)repairDate
{
  return self->_repairDate;
}

- (void)setRepairDate:(id)a3
{
}

- (NSString)repairCenter
{
  return self->_repairCenter;
}

- (void)setRepairCenter:(id)a3
{
}

- (NSSet)dataClasses
{
  return self->_dataClasses;
}

- (void)setDataClasses:(id)a3
{
}

- (NSSet)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_dataClasses, 0);
  objc_storeStrong((id *)&self->_repairCenter, 0);
  objc_storeStrong((id *)&self->_repairDate, 0);
  objc_storeStrong((id *)&self->_repairDateStr, 0);
}

@end