@interface HDMedicationsDiagnosticOperation
- (HDMedicationsDiagnosticOperation)initWithAttachmentDirectoryURL:(id)a3;
- (id)reportFilename;
- (void)run;
@end

@implementation HDMedicationsDiagnosticOperation

- (HDMedicationsDiagnosticOperation)initWithAttachmentDirectoryURL:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HDMedicationsDiagnosticOperation;
  v3 = [(HDMedicationsDiagnosticOperation *)&v11 initWithAttachmentDirectoryURL:a3];
  if (v3)
  {
    v4 = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
    healthStore = v3->_healthStore;
    v3->_healthStore = v4;

    uint64_t v6 = HKCreateConcurrentDispatchQueue();
    concurrentQueue = v3->_concurrentQueue;
    v3->_concurrentQueue = (OS_dispatch_queue *)v6;

    dispatch_group_t v8 = dispatch_group_create();
    dispatchGroup = v3->_dispatchGroup;
    v3->_dispatchGroup = (OS_dispatch_group *)v8;
  }
  return v3;
}

- (id)reportFilename
{
  return @"Medications.txt";
}

- (void)run
{
  [(HDMedicationsDiagnosticOperation *)self log:@"Fetching medications diagnostic information...\n"];
  if (self)
  {
    sub_119C((uint64_t)self);
    sub_1334((uint64_t)self);
  }
  dispatchGroup = self->_dispatchGroup;
  dispatch_time_t v4 = dispatch_time(0, 30000000000);
  if (dispatch_group_wait(dispatchGroup, v4))
  {
    sub_10D4(self, @"Timed out attempting to get medication information");
  }
  else
  {
    sub_113C(self);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedules, 0);
  objc_storeStrong((id *)&self->_medications, 0);
  objc_storeStrong((id *)&self->_lists, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);

  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end