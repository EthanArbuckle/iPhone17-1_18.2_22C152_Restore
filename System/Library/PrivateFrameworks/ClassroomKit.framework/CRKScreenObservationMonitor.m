@interface CRKScreenObservationMonitor
+ (BOOL)automaticallyNotifiesObserversOfObservingInstructorsByCourse;
+ (id)keyPathsForValuesAffectingHasObservingInstructors;
- (BOOL)hasObservingInstructors;
- (BOOL)isConnecting;
- (CRKCancelable)enrollmentStatusDidChangeSubscription;
- (CRKDarwinNotificationPublisher)darwinNotificationPublisher;
- (CRKFeatureDataStoreProtocol)featureDataStore;
- (CRKFetchObservingInstructorsByCourseOperation)fetchObservingInstructorsByCourseOperation;
- (CRKObservation)observersDidChangeObservation;
- (CRKScreenObservationMonitor)init;
- (CRKScreenObservationMonitor)initWithStudentConnectionPrimitives:(id)a3 darwinNotificationPublisher:(id)a4 featureDataStore:(id)a5;
- (CRKScreenObservationMonitorDelegate)delegate;
- (CRKStudentConnection)studentConnection;
- (CRKStudentConnectionPrimitives)studentConnectionPrimitives;
- (NSDictionary)observingInstructorsByCourse;
- (id)instructorIdentifiersByCourseIdentifier;
- (void)beginObservingEnrollmentStatus;
- (void)connectToStudentdIfNeeded;
- (void)dealloc;
- (void)didEstablishStudentConnection:(id)a3;
- (void)didLoseStudentConnection;
- (void)disconnectFromStudentdIfNeeded;
- (void)enrollmentStatusDidChange;
- (void)fetchObservingInstructorsByCourse;
- (void)fetchObservingInstructorsByCourseOperationDidFinish:(id)a3;
- (void)setConnecting:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEnrollmentStatusDidChangeSubscription:(id)a3;
- (void)setFetchObservingInstructorsByCourseOperation:(id)a3;
- (void)setObserversDidChangeObservation:(id)a3;
- (void)setObservingInstructorsByCourse:(id)a3;
- (void)setStudentConnection:(id)a3;
@end

@implementation CRKScreenObservationMonitor

- (void)dealloc
{
  v3 = [(CRKScreenObservationMonitor *)self studentConnection];
  [v3 invalidate];

  v4 = [(CRKScreenObservationMonitor *)self observersDidChangeObservation];
  [v4 invalidate];

  v5 = [(CRKScreenObservationMonitor *)self enrollmentStatusDidChangeSubscription];
  [v5 cancel];

  v6.receiver = self;
  v6.super_class = (Class)CRKScreenObservationMonitor;
  [(CRKScreenObservationMonitor *)&v6 dealloc];
}

- (CRKScreenObservationMonitor)initWithStudentConnectionPrimitives:(id)a3 darwinNotificationPublisher:(id)a4 featureDataStore:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CRKScreenObservationMonitor;
  v12 = [(CRKScreenObservationMonitor *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_studentConnectionPrimitives, a3);
    objc_storeStrong((id *)&v13->_darwinNotificationPublisher, a4);
    objc_storeStrong((id *)&v13->_featureDataStore, a5);
    [(CRKScreenObservationMonitor *)v13 beginObservingEnrollmentStatus];
    [(CRKScreenObservationMonitor *)v13 connectToStudentdIfNeeded];
  }

  return v13;
}

- (CRKScreenObservationMonitor)init
{
  v3 = objc_opt_new();
  v4 = [v3 makePrimitives];
  v5 = objc_opt_new();
  objc_super v6 = [v5 makeFeatureDataStore];

  v7 = objc_opt_new();
  v8 = [(CRKScreenObservationMonitor *)self initWithStudentConnectionPrimitives:v4 darwinNotificationPublisher:v7 featureDataStore:v6];

  return v8;
}

- (BOOL)hasObservingInstructors
{
  v2 = [(CRKScreenObservationMonitor *)self observingInstructorsByCourse];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

+ (id)keyPathsForValuesAffectingHasObservingInstructors
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"observingInstructorsByCourse"];
}

+ (BOOL)automaticallyNotifiesObserversOfObservingInstructorsByCourse
{
  return 0;
}

- (void)setObservingInstructorsByCourse:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  observingInstructorsByCourse = self->_observingInstructorsByCourse;
  if (v4 | (unint64_t)observingInstructorsByCourse)
  {
    id v9 = (void *)v4;
    if (([(NSDictionary *)observingInstructorsByCourse isEqual:v4] & 1) == 0)
    {
      [(CRKScreenObservationMonitor *)self willChangeValueForKey:@"observingInstructorsByCourse"];
      objc_super v6 = (NSDictionary *)[v9 copy];
      v7 = self->_observingInstructorsByCourse;
      self->_observingInstructorsByCourse = v6;

      [(CRKScreenObservationMonitor *)self didChangeValueForKey:@"observingInstructorsByCourse"];
      v8 = [(CRKScreenObservationMonitor *)self delegate];
      [v8 screenObservationMonitor:self observationStatusDidChange:self->_observingInstructorsByCourse];
    }
  }

  MEMORY[0x270F9A758]();
}

- (id)instructorIdentifiersByCourseIdentifier
{
  BOOL v3 = [(CRKScreenObservationMonitor *)self observingInstructorsByCourse];
  unint64_t v4 = [v3 allKeys];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__CRKScreenObservationMonitor_instructorIdentifiersByCourseIdentifier__block_invoke_2;
  v7[3] = &unk_2646F4480;
  v7[4] = self;
  v5 = objc_msgSend(v4, "crk_dictionaryUsingKeyGenerator:valueGenerator:", &__block_literal_global_68, v7);

  return v5;
}

id __70__CRKScreenObservationMonitor_instructorIdentifiersByCourseIdentifier__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 courseIdentifier];
  BOOL v3 = [v2 stringValue];

  return v3;
}

id __70__CRKScreenObservationMonitor_instructorIdentifiersByCourseIdentifier__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  unint64_t v4 = [v2 observingInstructorsByCourse];
  v5 = [v4 objectForKeyedSubscript:v3];

  objc_super v6 = objc_msgSend(v5, "crk_mapUsingBlock:", &__block_literal_global_9_0);

  return v6;
}

uint64_t __70__CRKScreenObservationMonitor_instructorIdentifiersByCourseIdentifier__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 userIdentifier];
}

- (void)enrollmentStatusDidChange
{
  id v3 = [(CRKScreenObservationMonitor *)self featureDataStore];
  int v4 = [v3 isClassroomStudentRoleEnabled];

  if (v4)
  {
    [(CRKScreenObservationMonitor *)self connectToStudentdIfNeeded];
  }
  else
  {
    [(CRKScreenObservationMonitor *)self disconnectFromStudentdIfNeeded];
  }
}

- (void)beginObservingEnrollmentStatus
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224C00000, log, OS_LOG_TYPE_ERROR, "Unable to register for enrollment status changes", v1, 2u);
}

void __61__CRKScreenObservationMonitor_beginObservingEnrollmentStatus__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained enrollmentStatusDidChange];
}

- (void)connectToStudentdIfNeeded
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    id v7 = [(CRKScreenObservationMonitor *)self featureDataStore];
    if (([v7 isClassroomStudentRoleEnabled] & 1) == 0)
    {
LABEL_5:

      return;
    }
    int v4 = [(CRKScreenObservationMonitor *)self studentConnection];
    if (v4)
    {

      goto LABEL_5;
    }
    BOOL v5 = [(CRKScreenObservationMonitor *)self isConnecting];

    if (!v5)
    {
      [(CRKScreenObservationMonitor *)self setConnecting:1];
      objc_initWeak(&location, self);
      objc_super v6 = [(CRKScreenObservationMonitor *)self studentConnectionPrimitives];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __56__CRKScreenObservationMonitor_connectToStudentdIfNeeded__block_invoke;
      v10[3] = &unk_2646F4D58;
      objc_copyWeak(&v11, &location);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __56__CRKScreenObservationMonitor_connectToStudentdIfNeeded__block_invoke_2;
      v8[3] = &unk_2646F3D40;
      objc_copyWeak(&v9, &location);
      [v6 connectWithCompletion:v10 invalidationHandler:v8];

      objc_destroyWeak(&v9);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(CRKScreenObservationMonitor *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:0];
  }
}

void __56__CRKScreenObservationMonitor_connectToStudentdIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didEstablishStudentConnection:v3];
}

void __56__CRKScreenObservationMonitor_connectToStudentdIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didLoseStudentConnection];
}

- (void)disconnectFromStudentdIfNeeded
{
  id v3 = [(CRKScreenObservationMonitor *)self studentConnection];

  if (v3)
  {
    int v4 = [(CRKScreenObservationMonitor *)self observersDidChangeObservation];
    [v4 invalidate];

    [(CRKScreenObservationMonitor *)self setObserversDidChangeObservation:0];
    BOOL v5 = [(CRKScreenObservationMonitor *)self studentConnection];
    [v5 invalidate];

    [(CRKScreenObservationMonitor *)self setStudentConnection:0];
    uint64_t v6 = MEMORY[0x263EFFA78];
    [(CRKScreenObservationMonitor *)self setObservingInstructorsByCourse:v6];
  }
}

- (void)didEstablishStudentConnection:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    id v9 = NSStringFromSelector(a2);
    [v8 handleFailureInMethod:a2, self, @"CRKScreenObservationMonitor.m", 185, @"%@ must be called from the main thread", v9 object file lineNumber description];
  }
  objc_initWeak(&location, self);
  [(CRKScreenObservationMonitor *)self setStudentConnection:v5];
  [(CRKScreenObservationMonitor *)self setConnecting:0];
  uint64_t v6 = [(CRKScreenObservationMonitor *)self observersDidChangeObservation];
  [v6 invalidate];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__CRKScreenObservationMonitor_didEstablishStudentConnection___block_invoke;
  v10[3] = &unk_2646F4D80;
  objc_copyWeak(&v11, &location);
  id v7 = [v5 observeNotificationWithName:@"CRKActiveInstructorsDidChange" handler:v10];
  [(CRKScreenObservationMonitor *)self setObserversDidChangeObservation:v7];

  [(CRKScreenObservationMonitor *)self fetchObservingInstructorsByCourse];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __61__CRKScreenObservationMonitor_didEstablishStudentConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained fetchObservingInstructorsByCourse];
}

- (void)didLoseStudentConnection
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    id v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"CRKScreenObservationMonitor.m", 198, @"%@ must be called from the main thread", v7 object file lineNumber description];
  }
  int v4 = [(CRKScreenObservationMonitor *)self observersDidChangeObservation];
  [v4 invalidate];

  [(CRKScreenObservationMonitor *)self setObserversDidChangeObservation:0];
  id v5 = [(CRKScreenObservationMonitor *)self studentConnection];
  [v5 invalidate];

  [(CRKScreenObservationMonitor *)self setStudentConnection:0];

  [(CRKScreenObservationMonitor *)self connectToStudentdIfNeeded];
}

- (void)fetchObservingInstructorsByCourse
{
  id v3 = [(CRKScreenObservationMonitor *)self fetchObservingInstructorsByCourseOperation];
  [v3 cancel];

  int v4 = [CRKFetchObservingInstructorsByCourseOperation alloc];
  id v5 = [(CRKScreenObservationMonitor *)self studentConnection];
  uint64_t v6 = [(CRKFetchObservingInstructorsByCourseOperation *)v4 initWithRequestPerformer:v5];
  [(CRKScreenObservationMonitor *)self setFetchObservingInstructorsByCourseOperation:v6];

  id v7 = [(CRKScreenObservationMonitor *)self fetchObservingInstructorsByCourseOperation];
  [v7 addTarget:self selector:sel_fetchObservingInstructorsByCourseOperationDidFinish_ forOperationEvents:6];

  objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = [(CRKScreenObservationMonitor *)self fetchObservingInstructorsByCourseOperation];
  [v9 addOperation:v8];
}

- (void)fetchObservingInstructorsByCourseOperationDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKScreenObservationMonitor *)self fetchObservingInstructorsByCourseOperation];

  if (v5 == v4)
  {
    uint64_t v6 = [v4 error];

    if (v6)
    {
      id v7 = _CRKLogGeneral_7();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CRKScreenObservationMonitor fetchObservingInstructorsByCourseOperationDidFinish:](v4, v7);
      }
    }
    else
    {
      v8 = [v4 resultObject];
      [(CRKScreenObservationMonitor *)self setObservingInstructorsByCourse:v8];
    }
  }
}

- (CRKScreenObservationMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRKScreenObservationMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)observingInstructorsByCourse
{
  return self->_observingInstructorsByCourse;
}

- (CRKStudentConnectionPrimitives)studentConnectionPrimitives
{
  return self->_studentConnectionPrimitives;
}

- (CRKDarwinNotificationPublisher)darwinNotificationPublisher
{
  return self->_darwinNotificationPublisher;
}

- (CRKFeatureDataStoreProtocol)featureDataStore
{
  return self->_featureDataStore;
}

- (CRKStudentConnection)studentConnection
{
  return self->_studentConnection;
}

- (void)setStudentConnection:(id)a3
{
}

- (CRKObservation)observersDidChangeObservation
{
  return self->_observersDidChangeObservation;
}

- (void)setObserversDidChangeObservation:(id)a3
{
}

- (CRKCancelable)enrollmentStatusDidChangeSubscription
{
  return self->_enrollmentStatusDidChangeSubscription;
}

- (void)setEnrollmentStatusDidChangeSubscription:(id)a3
{
}

- (CRKFetchObservingInstructorsByCourseOperation)fetchObservingInstructorsByCourseOperation
{
  return self->_fetchObservingInstructorsByCourseOperation;
}

- (void)setFetchObservingInstructorsByCourseOperation:(id)a3
{
}

- (BOOL)isConnecting
{
  return self->_connecting;
}

- (void)setConnecting:(BOOL)a3
{
  self->_connecting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchObservingInstructorsByCourseOperation, 0);
  objc_storeStrong((id *)&self->_enrollmentStatusDidChangeSubscription, 0);
  objc_storeStrong((id *)&self->_observersDidChangeObservation, 0);
  objc_storeStrong((id *)&self->_studentConnection, 0);
  objc_storeStrong((id *)&self->_featureDataStore, 0);
  objc_storeStrong((id *)&self->_darwinNotificationPublisher, 0);
  objc_storeStrong((id *)&self->_studentConnectionPrimitives, 0);
  objc_storeStrong((id *)&self->_observingInstructorsByCourse, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)fetchObservingInstructorsByCourseOperationDidFinish:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 error];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "Error fetching observing instructors: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end