@interface CaseReportOutlet
- (BOOL)publishReportForCase:(id)a3 options:(id)a4;
- (CaseReportOutlet)init;
@end

@implementation CaseReportOutlet

- (CaseReportOutlet)init
{
  v3.receiver = self;
  v3.super_class = (Class)CaseReportOutlet;
  return [(CaseReportOutlet *)&v3 init];
}

- (BOOL)publishReportForCase:(id)a3 options:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"DiagnosticReportOutlets.m", 102, @"Subclasses must provide an impl for %s", "-[CaseReportOutlet publishReportForCase:options:]");

  return 0;
}

@end