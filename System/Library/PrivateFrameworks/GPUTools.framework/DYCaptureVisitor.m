@interface DYCaptureVisitor
- (BOOL)visitUnusedResoures;
- (DYCaptureVisitor)init;
- (NSError)visitCaptureArchiveError;
- (void)abort;
- (void)setVisitCaptureArchiveError:(id)a3;
- (void)setVisitUnusedResoures:(BOOL)a3;
@end

@implementation DYCaptureVisitor

- (DYCaptureVisitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)DYCaptureVisitor;
  result = [(DYCaptureVisitor *)&v3 init];
  if (result) {
    result->_visitUnusedResoures = 0;
  }
  return result;
}

- (void)abort
{
  self->_abort = 1;
}

- (NSError)visitCaptureArchiveError
{
  return self->_visitCaptureArchiveError;
}

- (void)setVisitCaptureArchiveError:(id)a3
{
}

- (BOOL)visitUnusedResoures
{
  return self->_visitUnusedResoures;
}

- (void)setVisitUnusedResoures:(BOOL)a3
{
  self->_visitUnusedResoures = a3;
}

@end