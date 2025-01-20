@interface CLMiLoConnection
- (CLMiLoConnection)init;
- (CLMiLoConnection)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (CLMiLoConnectionDelegate)delegate;
- (CLMiLoConnectionInternal)_internal;
- (id)createCustomLocationOfInterestAtCurrentLocation;
- (id)labelEventWithRequestIdentifier:(id)a3 withPlaceIdentifier:(id)a4;
- (id)labelEventsWithStartDate:(id)a3 endDate:(id)a4 placeIdentifier:(id)a5;
- (id)labelObservationWithRequestIdentifier:(id)a3 withPlaceIdentifier:(id)a4;
- (id)labelObservationsWithStartDate:(id)a3 endDate:(id)a4 placeIdentifier:(id)a5;
- (id)purgeAllMiLoData;
- (id)removeCustomLocationOfInterestWithIdentifier:(id)a3;
- (id)removeLabels:(id)a3;
- (id)requestExportDatabase;
- (id)requestMiLoPrediction;
- (id)requestModelLearning;
- (id)requestObservation:(id)a3;
- (id)startUpdatingMicroLocationWithConfiguration:(id)a3;
- (id)stopUpdatingMicroLocation;
- (void)connectServiceWithIdentifier:(id)a3;
- (void)createServiceWithServiceType:(unint64_t)a3 locationTypes:(id)a4;
- (void)dealloc;
- (void)deleteServiceWithIdentifier:(id)a3;
- (void)disconnectServiceWithIdentifier:(id)a3;
- (void)queryMiLoConnectionStatus;
- (void)queryMyServices;
- (void)setDelegate:(id)a3;
@end

@implementation CLMiLoConnection

- (id)requestModelLearning
{
  v3 = (void *)[MEMORY[0x1E4F29128] UUID];
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190838E78;
  v7[3] = &unk_1E5696EE8;
  v7[4] = internal;
  v7[5] = v3;
  dispatch_async(internalQueue, v7);
  return v3;
}

- (void)disconnectServiceWithIdentifier:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLMiLoConnection.mm", 1392, @"Invalid parameter not satisfying: %@", @"serviceIdentifier");
  }
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1908386BC;
  block[3] = &unk_1E5696EE8;
  block[4] = internal;
  block[5] = a3;
  dispatch_async(internalQueue, block);
}

- (void)connectServiceWithIdentifier:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLMiLoConnection.mm", 1383, @"Invalid parameter not satisfying: %@", @"serviceIdentifier");
  }
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1908386B0;
  block[3] = &unk_1E5696EE8;
  block[4] = internal;
  block[5] = a3;
  dispatch_async(internalQueue, block);
}

- (CLMiLoConnection)init
{
  return (CLMiLoConnection *)MEMORY[0x1F4181798](self, sel_initWithDelegate_delegateQueue_);
}

- (CLMiLoConnection)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CLMiLoConnection;
  v6 = [(CLMiLoConnection *)&v11 init];
  if (v6)
  {
    v7 = [[CLMiLoConnectionInternal alloc] initWithInfo:v6 delegate:a3 delegateQueue:a4];
    v6->_internal = v7;
    internalQueue = v7->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_190838290;
    block[3] = &unk_1E5696BF0;
    block[4] = v6;
    dispatch_sync(internalQueue, block);
  }
  return v6;
}

- (void)dealloc
{
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19083838C;
  block[3] = &unk_1E5696BF0;
  block[4] = internal;
  dispatch_sync(internalQueue, block);

  v5.receiver = self;
  v5.super_class = (Class)CLMiLoConnection;
  [(CLMiLoConnection *)&v5 dealloc];
}

- (void)setDelegate:(id)a3
{
  self->_internal->_delegate = (CLMiLoConnectionDelegate *)a3;
}

- (CLMiLoConnectionDelegate)delegate
{
  return self->_internal->_delegate;
}

- (void)createServiceWithServiceType:(unint64_t)a3 locationTypes:(id)a4
{
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLMiLoConnection.mm", 1348, @"Invalid parameter not satisfying: %@", @"locationTypes");
  }
  if (a3 - 5 <= 0xFFFFFFFFFFFFFFFBLL) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLMiLoConnection.mm", 1349, @"Invalid parameter not satisfying: %@", @"serviceType > CLMiLoServiceTypeNone && serviceType < CLMiLoServiceTypeMax");
  }
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1908384CC;
  block[3] = &unk_1E5698638;
  void block[5] = a4;
  void block[6] = a3;
  block[4] = internal;
  dispatch_async(internalQueue, block);
}

- (void)deleteServiceWithIdentifier:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLMiLoConnection.mm", 1358, @"Invalid parameter not satisfying: %@", @"serviceIdentifier");
  }
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1908385AC;
  block[3] = &unk_1E5696EE8;
  block[4] = internal;
  void block[5] = a3;
  dispatch_async(internalQueue, block);
}

- (void)queryMyServices
{
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19083862C;
  block[3] = &unk_1E5696BF0;
  block[4] = internal;
  dispatch_async(internalQueue, block);
}

- (void)queryMiLoConnectionStatus
{
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1908386A8;
  block[3] = &unk_1E5696BF0;
  block[4] = internal;
  dispatch_async(internalQueue, block);
}

- (id)requestMiLoPrediction
{
  v3 = (void *)[MEMORY[0x1E4F29128] UUID];
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19083875C;
  v7[3] = &unk_1E5696EE8;
  v7[4] = internal;
  v7[5] = v3;
  dispatch_async(internalQueue, v7);
  return v3;
}

- (id)requestObservation:(id)a3
{
  objc_super v5 = (void *)[MEMORY[0x1E4F29128] UUID];
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19083880C;
  block[3] = &unk_1E5696FA8;
  block[4] = internal;
  void block[5] = v5;
  void block[6] = a3;
  dispatch_async(internalQueue, block);
  return v5;
}

- (id)labelObservationWithRequestIdentifier:(id)a3 withPlaceIdentifier:(id)a4
{
  if (!a3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLMiLoConnection.mm", 1422, @"Invalid parameter not satisfying: %@", @"observationIdentifier");
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLMiLoConnection.mm", 1423, @"Invalid parameter not satisfying: %@", @"placeLabel");
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  v8 = (void *)[MEMORY[0x1E4F29128] UUID];
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190838948;
  block[3] = &unk_1E5698660;
  block[4] = internal;
  void block[5] = v8;
  void block[6] = a4;
  void block[7] = a3;
  dispatch_async(internalQueue, block);
  return v8;
}

- (id)labelEventWithRequestIdentifier:(id)a3 withPlaceIdentifier:(id)a4
{
  return (id)MEMORY[0x1F4181798](self, sel_labelObservationWithRequestIdentifier_withPlaceIdentifier_);
}

- (id)labelObservationsWithStartDate:(id)a3 endDate:(id)a4 placeIdentifier:(id)a5
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLMiLoConnection.mm", 1443, @"Invalid parameter not satisfying: %@", @"endDate");
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLMiLoConnection.mm", 1444, @"Invalid parameter not satisfying: %@", @"placeLabel");
    goto LABEL_4;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLMiLoConnection.mm", 1442, @"Invalid parameter not satisfying: %@", @"startDate");
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  v10 = (void *)[MEMORY[0x1E4F29128] UUID];
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190838AD8;
  block[3] = &unk_1E5698688;
  block[4] = internal;
  void block[5] = a3;
  void block[6] = a4;
  void block[7] = a5;
  void block[8] = v10;
  dispatch_async(internalQueue, block);
  return v10;
}

- (id)labelEventsWithStartDate:(id)a3 endDate:(id)a4 placeIdentifier:(id)a5
{
  return (id)MEMORY[0x1F4181798](self, sel_labelObservationsWithStartDate_endDate_placeIdentifier_);
}

- (id)removeLabels:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLMiLoConnection.mm", 1461, @"Invalid parameter not satisfying: %@", @"labels");
  }
  objc_super v5 = (void *)[MEMORY[0x1E4F29128] UUID];
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190838BD8;
  block[3] = &unk_1E5696FA8;
  block[4] = internal;
  void block[5] = a3;
  void block[6] = v5;
  dispatch_async(internalQueue, block);
  return v5;
}

- (id)removeCustomLocationOfInterestWithIdentifier:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLMiLoConnection.mm", 1472, @"Invalid parameter not satisfying: %@", @"identifier");
  }
  objc_super v5 = (void *)[MEMORY[0x1E4F29128] UUID];
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190838CD0;
  block[3] = &unk_1E5696FA8;
  block[4] = internal;
  void block[5] = a3;
  void block[6] = v5;
  dispatch_async(internalQueue, block);
  return v5;
}

- (id)startUpdatingMicroLocationWithConfiguration:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLMiLoConnection.mm", 1483, @"Invalid parameter not satisfying: %@", @"configuration");
  }
  objc_super v5 = (void *)[MEMORY[0x1E4F29128] UUID];
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190838DC8;
  block[3] = &unk_1E5696FA8;
  block[4] = internal;
  void block[5] = a3;
  void block[6] = v5;
  dispatch_async(internalQueue, block);
  return v5;
}

- (id)stopUpdatingMicroLocation
{
  v3 = (void *)[MEMORY[0x1E4F29128] UUID];
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190838E6C;
  v7[3] = &unk_1E5696EE8;
  v7[4] = internal;
  v7[5] = v3;
  dispatch_async(internalQueue, v7);
  return v3;
}

- (id)purgeAllMiLoData
{
  v3 = (void *)[MEMORY[0x1E4F29128] UUID];
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190838F18;
  v7[3] = &unk_1E5696EE8;
  v7[4] = internal;
  v7[5] = v3;
  dispatch_async(internalQueue, v7);
  return v3;
}

- (id)requestExportDatabase
{
  v3 = (void *)[MEMORY[0x1E4F29128] UUID];
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190838FB8;
  v7[3] = &unk_1E5696EE8;
  v7[4] = internal;
  v7[5] = v3;
  dispatch_async(internalQueue, v7);
  return v3;
}

- (id)createCustomLocationOfInterestAtCurrentLocation
{
  v3 = (void *)[MEMORY[0x1E4F29128] UUID];
  internal = self->_internal;
  internalQueue = internal->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_190839058;
  v7[3] = &unk_1E5696EE8;
  v7[4] = internal;
  v7[5] = v3;
  dispatch_async(internalQueue, v7);
  return v3;
}

- (CLMiLoConnectionInternal)_internal
{
  return self->_internal;
}

@end