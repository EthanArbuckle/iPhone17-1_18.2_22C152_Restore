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
    v20 = sub_239773918(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_239776A80(v20);
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
  v3 = NSString;
  v4 = [(CRFDRRCHL *)self repairDateStr];
  v5 = [(CRFDRRCHL *)self repairDate];
  v6 = [(CRFDRRCHL *)self repairCenter];
  v7 = [(CRFDRRCHL *)self dataClasses];
  v8 = [v7 allObjects];
  v9 = [(CRFDRRCHL *)self properties];
  v10 = [v9 allObjects];
  v11 = [v3 stringWithFormat:@"[CRRepairHistory: timeStr:%@: repairDate:%@ repairCenter:%@: dataClasses:%@: properties:%@:]", v4, v5, v6, v8, v10];

  return v11;
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