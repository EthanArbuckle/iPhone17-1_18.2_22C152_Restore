@interface CRKPrimitiveBackedCertificateConduit
+ (id)fetchOperationTimerIdentifier;
- (CATOperationQueue)operationQueue;
- (CRKIDSAddressTranslator)addressTranslator;
- (CRKIDSPrimitives)IDSPrimitives;
- (CRKPrimitiveBackedCertificateConduit)initWithIDSPrimitives:(id)a3 addressTranslator:(id)a4 operationQueue:(id)a5;
- (CRKPrimitiveBackedCertificateConduit)initWithIDSPrimitives:(id)a3 addressTranslator:(id)a4 timerPrimitives:(id)a5 operationQueue:(id)a6;
- (CRKTimerPrimitives)timerPrimitives;
- (id)operationToFetchCertificateForDestinationAppleID:(id)a3 sourceAppleID:(id)a4 destinationDeviceIdentifier:(id)a5 controlGroupIdentifier:(id)a6 sourceRole:(int64_t)a7 destinationRole:(int64_t)a8 requesterCertificate:(id)a9 timeout:(double)a10;
@end

@implementation CRKPrimitiveBackedCertificateConduit

- (CRKPrimitiveBackedCertificateConduit)initWithIDSPrimitives:(id)a3 addressTranslator:(id)a4 operationQueue:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_new();
  v12 = [v11 makePrimitives];
  v13 = [(CRKPrimitiveBackedCertificateConduit *)self initWithIDSPrimitives:v10 addressTranslator:v9 timerPrimitives:v12 operationQueue:v8];

  return v13;
}

- (CRKPrimitiveBackedCertificateConduit)initWithIDSPrimitives:(id)a3 addressTranslator:(id)a4 timerPrimitives:(id)a5 operationQueue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CRKPrimitiveBackedCertificateConduit;
  v15 = [(CRKPrimitiveBackedCertificateConduit *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_IDSPrimitives, a3);
    objc_storeStrong((id *)&v16->_addressTranslator, a4);
    objc_storeStrong((id *)&v16->_timerPrimitives, a5);
    objc_storeStrong((id *)&v16->_operationQueue, a6);
  }

  return v16;
}

- (id)operationToFetchCertificateForDestinationAppleID:(id)a3 sourceAppleID:(id)a4 destinationDeviceIdentifier:(id)a5 controlGroupIdentifier:(id)a6 sourceRole:(int64_t)a7 destinationRole:(int64_t)a8 requesterCertificate:(id)a9 timeout:(double)a10
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v37 = a6;
  v38 = v19;
  id v20 = a9;
  v21 = v18;
  v22 = v17;
  int64_t v23 = a7;
  if (_CRKLogASM_onceToken_26 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_26, &__block_literal_global_91);
  }
  v24 = (void *)_CRKLogASM_logObj_26;
  if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj_26, OS_LOG_TYPE_DEFAULT))
  {
    v25 = v24;
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    *(_DWORD *)buf = 138412290;
    v40 = v27;
    _os_log_impl(&dword_224C00000, v25, OS_LOG_TYPE_DEFAULT, "%@: Received request to build cert-fetching operation", buf, 0xCu);
  }
  v28 = [CRKFetchASMCertificatesOperation alloc];
  v29 = [(CRKPrimitiveBackedCertificateConduit *)self IDSPrimitives];
  v30 = [(CRKPrimitiveBackedCertificateConduit *)self addressTranslator];
  v31 = [(CRKFetchASMCertificatesOperation *)v28 initWithIDSPrimitives:v29 addressTranslator:v30 controlGroupIdentifier:v37 destinationAppleID:v22 sourceAppleID:v21 destinationDeviceIdentifier:v38 sourceRole:v23 destinationRole:a8 requesterCertificate:v20];

  v32 = [(CRKPrimitiveBackedCertificateConduit *)self timerPrimitives];
  v33 = [(CRKPrimitiveBackedCertificateConduit *)self operationQueue];
  v34 = [(id)objc_opt_class() fetchOperationTimerIdentifier];
  v35 = [(CATOperation *)v31 crk_timingOutOperationWithTimerPrimitives:v32 operationQueue:v33 timerIdentifier:v34 timeout:a10];

  return v35;
}

+ (id)fetchOperationTimerIdentifier
{
  v2 = NSString;
  v3 = NSStringFromClass((Class)a1);
  v4 = [v2 stringWithFormat:@"%@-certificateFetchTimer", v3];

  return v4;
}

- (CRKIDSPrimitives)IDSPrimitives
{
  return self->_IDSPrimitives;
}

- (CRKIDSAddressTranslator)addressTranslator
{
  return self->_addressTranslator;
}

- (CRKTimerPrimitives)timerPrimitives
{
  return self->_timerPrimitives;
}

- (CATOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_timerPrimitives, 0);
  objc_storeStrong((id *)&self->_addressTranslator, 0);

  objc_storeStrong((id *)&self->_IDSPrimitives, 0);
}

@end