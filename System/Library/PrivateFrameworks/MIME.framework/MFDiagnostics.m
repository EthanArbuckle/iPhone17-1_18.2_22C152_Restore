@interface MFDiagnostics
+ (id)sharedController;
- (MFDiagnostics)init;
- (id)copyDiagnosticInformation;
- (void)addDiagnosticsGenerator:(id)a3;
- (void)removeDiagnosticsGenerator:(id)a3;
@end

@implementation MFDiagnostics

- (void)addDiagnosticsGenerator:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_diagnosticLock lock];
  [(MFWeakSet *)self->_diagnosticsGenerators addObject:v4];
  [(NSLock *)self->_diagnosticLock unlock];
}

+ (id)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedController_controller;
  return v2;
}

uint64_t __33__MFDiagnostics_sharedController__block_invoke()
{
  sharedController_controller = objc_alloc_init(MFDiagnostics);
  return MEMORY[0x1F41817F8]();
}

- (MFDiagnostics)init
{
  v7.receiver = self;
  v7.super_class = (Class)MFDiagnostics;
  v2 = [(MFDiagnostics *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(MFWeakSet);
    diagnosticsGenerators = v2->_diagnosticsGenerators;
    v2->_diagnosticsGenerators = v3;

    v5 = v2;
  }

  return v2;
}

- (void)removeDiagnosticsGenerator:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_diagnosticLock lock];
  [(MFWeakSet *)self->_diagnosticsGenerators removeObject:v4];
  [(NSLock *)self->_diagnosticLock unlock];
}

- (id)copyDiagnosticInformation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [(NSLock *)self->_diagnosticLock lock];
  id v4 = [(MFWeakSet *)self->_diagnosticsGenerators allObjects];
  [(NSLock *)self->_diagnosticLock unlock];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_4, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = (void *)[*(id *)(*((void *)&v11 + 1) + 8 * v8) copyDiagnosticInformation];
        [v3 appendString:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticLock, 0);
  objc_storeStrong((id *)&self->_diagnosticsGenerators, 0);
}

@end