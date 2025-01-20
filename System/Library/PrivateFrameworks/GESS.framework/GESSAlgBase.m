@interface GESSAlgBase
- (BOOL)run;
- (BOOL)setErrorCallback:(id)a3;
- (BOOL)setProgressCallback:(id)a3;
- (GESSAlgBase)init;
- (id)returnReport;
- (int)algStatus;
- (void)setAlgStatus:(int)a3;
@end

@implementation GESSAlgBase

- (GESSAlgBase)init
{
  v5.receiver = self;
  v5.super_class = (Class)GESSAlgBase;
  v2 = [(GESSAlgBase *)&v5 init];
  v3 = v2;
  if (v2) {
    [(GESSAlgBase *)v2 setAlgStatus:0];
  }
  return v3;
}

- (BOOL)setProgressCallback:(id)a3
{
  v4 = (void *)MEMORY[0x25335EF80](a3, a2);
  id progress_callback = self->_progress_callback;
  self->_id progress_callback = v4;

  return 1;
}

- (BOOL)setErrorCallback:(id)a3
{
  v4 = (void *)MEMORY[0x25335EF80](a3, a2);
  id error_callback = self->_error_callback;
  self->_id error_callback = v4;

  return 1;
}

- (id)returnReport
{
  v3 = objc_alloc_init(GESSAlgReport);
  if ([(GESSAlgBase *)self algStatus] == 3) {
    [(GESSAlgReport *)v3 setSuccess:1];
  }

  return v3;
}

- (BOOL)run
{
  return 1;
}

- (int)algStatus
{
  return self->algStatus;
}

- (void)setAlgStatus:(int)a3
{
  self->algStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_error_callback, 0);

  objc_storeStrong(&self->_progress_callback, 0);
}

@end