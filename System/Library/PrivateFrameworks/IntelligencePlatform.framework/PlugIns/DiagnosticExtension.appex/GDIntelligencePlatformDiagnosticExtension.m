@interface GDIntelligencePlatformDiagnosticExtension
- (GDIntelligencePlatformDiagnosticExtension)init;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation GDIntelligencePlatformDiagnosticExtension

- (void).cxx_destruct
{
}

- (GDIntelligencePlatformDiagnosticExtension)init
{
  v6.receiver = self;
  v6.super_class = (Class)GDIntelligencePlatformDiagnosticExtension;
  v2 = [(GDIntelligencePlatformDiagnosticExtension *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    swiftDiagnosticExtension = v2->_swiftDiagnosticExtension;
    v2->_swiftDiagnosticExtension = (GDIPDiagnosticExtension *)v3;
  }
  return v2;
}

- (id)attachmentsForParameters:(id)a3
{
  return [(GDIPDiagnosticExtension *)self->_swiftDiagnosticExtension attachmentsForParameters:a3];
}

- (id)attachmentList
{
  return [(GDIPDiagnosticExtension *)self->_swiftDiagnosticExtension attachmentList];
}

@end