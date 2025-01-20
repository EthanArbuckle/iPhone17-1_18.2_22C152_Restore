@interface GESSAlgReport
- (BOOL)success;
- (GESSAlgReport)init;
- (void)setSuccess:(BOOL)a3;
@end

@implementation GESSAlgReport

- (GESSAlgReport)init
{
  v5.receiver = self;
  v5.super_class = (Class)GESSAlgReport;
  v2 = [(GESSAlgReport *)&v5 init];
  v3 = v2;
  if (v2) {
    [(GESSAlgReport *)v2 setSuccess:0];
  }
  return v3;
}

- (BOOL)success
{
  return self->success;
}

- (void)setSuccess:(BOOL)a3
{
  self->success = a3;
}

@end