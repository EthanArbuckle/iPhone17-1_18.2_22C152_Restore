@interface HMDHomeSaveRequest
- (BOOL)incrementGeneration;
- (BOOL)objectChange;
- (HMDHome)home;
- (HMDHomeSaveRequest)initWithHome:(id)a3 reason:(id)a4 information:(id)a5 postSyncNotification:(BOOL)a6 objectChange:(BOOL)a7;
- (HMDHomeSaveRequest)initWithReason:(id)a3 information:(id)a4 postSyncNotification:(BOOL)a5;
- (HMDHomeSaveRequest)initWithReason:(id)a3 information:(id)a4 saveOptions:(unint64_t)a5;
- (NSDictionary)information;
- (NSString)reason;
- (id)_initWithHome:(id)a3 reason:(id)a4 information:(id)a5 postSyncNotification:(BOOL)a6 objectChange:(BOOL)a7 saveOptions:(unint64_t)a8;
- (unint64_t)saveOptions;
- (void)_updateSaveOptions:(BOOL)a3 reason:(id)a4;
@end

@implementation HMDHomeSaveRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_information, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

- (BOOL)incrementGeneration
{
  return self->_incrementGeneration;
}

- (BOOL)objectChange
{
  return self->_objectChange;
}

- (unint64_t)saveOptions
{
  return self->_saveOptions;
}

- (NSDictionary)information
{
  return self->_information;
}

- (NSString)reason
{
  return self->_reason;
}

- (HMDHome)home
{
  return self->_home;
}

- (void)_updateSaveOptions:(BOOL)a3 reason:(id)a4
{
  if (a3) {
    self->_saveOptions |= 2uLL;
  }
  if (!+[HMDHomeManager doesSaveReasonAffectOnlyLocalData:a4])self->_saveOptions |= 1uLL; {
}
  }

- (HMDHomeSaveRequest)initWithReason:(id)a3 information:(id)a4 saveOptions:(unint64_t)a5
{
  return (HMDHomeSaveRequest *)[(HMDHomeSaveRequest *)self _initWithHome:0 reason:a3 information:a4 postSyncNotification:0 objectChange:0 saveOptions:a5];
}

- (HMDHomeSaveRequest)initWithReason:(id)a3 information:(id)a4 postSyncNotification:(BOOL)a5
{
  return [(HMDHomeSaveRequest *)self initWithHome:0 reason:a3 information:a4 postSyncNotification:a5 objectChange:0];
}

- (HMDHomeSaveRequest)initWithHome:(id)a3 reason:(id)a4 information:(id)a5 postSyncNotification:(BOOL)a6 objectChange:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a4;
  v13 = [(HMDHomeSaveRequest *)self _initWithHome:a3 reason:v12 information:a5 postSyncNotification:v8 objectChange:v7 saveOptions:0];
  v14 = v13;
  if (v13) {
    [(HMDHomeSaveRequest *)v13 _updateSaveOptions:v8 reason:v12];
  }

  return v14;
}

- (id)_initWithHome:(id)a3 reason:(id)a4 information:(id)a5 postSyncNotification:(BOOL)a6 objectChange:(BOOL)a7 saveOptions:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HMDHomeSaveRequest;
  v17 = [(HMDHomeSaveRequest *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_home, a3);
    objc_storeStrong((id *)&v18->_reason, a4);
    objc_storeStrong((id *)&v18->_information, a5);
    v18->_objectChange = a7;
    v18->_incrementGeneration = +[HMDHomeManager shouldIncrementGenerationCounterForReason:v15];
    v18->_saveOptions = a8;
  }

  return v18;
}

@end