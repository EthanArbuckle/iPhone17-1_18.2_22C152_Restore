@interface _HDQueryDatabaseAccessBlock
- (id)description;
@end

@implementation _HDQueryDatabaseAccessBlock

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queryServer);
  v7 = [WeakRetained queryUUID];
  v8 = HKStringFromQoS();
  processBundleIdentifier = self->_processBundleIdentifier;
  v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_creationTime];
  v11 = HKDiagnosticStringFromDate();
  v12 = [v3 stringWithFormat:@"<%@ query:%@ QoS:%@ process:%@ timestamp:%@>", v5, v7, v8, processBundleIdentifier, v11, 0];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_queryServer);

  objc_storeStrong(&self->_block, 0);
}

@end