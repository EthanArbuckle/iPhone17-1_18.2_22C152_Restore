@interface MLModelExecutionSchedule
- (MLModelExecutionSchedule)init;
- (NSDictionary)modelExecutionSchedule;
- (NSDictionary)modelExecutionScheduleByModelStructurePath;
- (void)setModelExecutionSchedule:(id)a3;
- (void)setModelExecutionScheduleByModelStructurePath:(id)a3;
@end

@implementation MLModelExecutionSchedule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelExecutionScheduleByModelStructurePath, 0);

  objc_storeStrong((id *)&self->_modelExecutionSchedule, 0);
}

- (void)setModelExecutionScheduleByModelStructurePath:(id)a3
{
}

- (NSDictionary)modelExecutionScheduleByModelStructurePath
{
  return self->_modelExecutionScheduleByModelStructurePath;
}

- (void)setModelExecutionSchedule:(id)a3
{
}

- (NSDictionary)modelExecutionSchedule
{
  return self->_modelExecutionSchedule;
}

- (MLModelExecutionSchedule)init
{
  v6.receiver = self;
  v6.super_class = (Class)MLModelExecutionSchedule;
  v2 = [(MLModelExecutionSchedule *)&v6 init];
  v3 = v2;
  if (v2)
  {
    modelExecutionSchedule = v2->_modelExecutionSchedule;
    v2->_modelExecutionSchedule = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  return v3;
}

@end