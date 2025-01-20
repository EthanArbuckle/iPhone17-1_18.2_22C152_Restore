@interface HDSharedSummaryQueryServer
+ (Class)queryClass;
- (HDSharedSummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (void)_queue_start;
@end

@implementation HDSharedSummaryQueryServer

- (HDSharedSummaryQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HDSharedSummaryQueryServer;
  v11 = [(HDQueryServer *)&v25 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    v12 = [v10 transaction];
    uint64_t v13 = [v12 copy];
    transaction = v11->_transaction;
    v11->_transaction = (HKSharedSummaryTransaction *)v13;

    v15 = [v10 package];
    uint64_t v16 = [v15 copy];
    package = v11->_package;
    v11->_package = (NSString *)v16;

    v18 = [v10 includedIdentifiers];
    uint64_t v19 = [v18 copy];
    includedIdentifiers = v11->_includedIdentifiers;
    v11->_includedIdentifiers = (NSSet *)v19;

    v21 = [v10 includedObjectTypes];
    uint64_t v22 = [v21 copy];
    includedObjectTypes = v11->_includedObjectTypes;
    v11->_includedObjectTypes = (NSSet *)v22;
  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  v20.receiver = self;
  v20.super_class = (Class)HDSharedSummaryQueryServer;
  [(HDQueryServer *)&v20 _queue_start];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(HDQueryServer *)self profile];
  v5 = [v4 sharedSummaryManager];
  transaction = self->_transaction;
  package = self->_package;
  includedIdentifiers = self->_includedIdentifiers;
  includedObjectTypes = self->_includedObjectTypes;
  id v19 = 0;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __42__HDSharedSummaryQueryServer__queue_start__block_invoke;
  v17 = &unk_1E6308930;
  id v10 = v3;
  id v18 = v10;
  LODWORD(package) = [v5 enumerateSummariesInTransaction:transaction package:package names:includedIdentifiers includedObjectTypes:includedObjectTypes error:&v19 handler:&v14];
  id v11 = v19;

  v12 = [(HDQueryServer *)self clientProxy];
  uint64_t v13 = [(HDQueryServer *)self queryUUID];
  if (package) {
    objc_msgSend(v12, "client_deliverSummaries:query:", v10, v13);
  }
  else {
    objc_msgSend(v12, "client_deliverError:forQuery:", v11, v13);
  }

  -[HDQueryServer setDataCount:](self, "setDataCount:", [v10 count]);
}

uint64_t __42__HDSharedSummaryQueryServer__queue_start__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includedObjectTypes, 0);
  objc_storeStrong((id *)&self->_includedIdentifiers, 0);
  objc_storeStrong((id *)&self->_package, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end