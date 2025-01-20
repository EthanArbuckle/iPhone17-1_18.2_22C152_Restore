@interface _CBApplicationSupportServiceDelegate
- (BOOL)service:(id)a3 overrideClientInitialization:(id)a4;
- (id)service:(id)a3 initializeClient:(id)a4;
@end

@implementation _CBApplicationSupportServiceDelegate

- (BOOL)service:(id)a3 overrideClientInitialization:(id)a4
{
  return 1;
}

- (id)service:(id)a3 initializeClient:(id)a4
{
  if (qword_10008FED8 != -1) {
    dispatch_once(&qword_10008FED8, &stru_10007A348);
  }
  v4 = (void *)qword_10008FED0;

  return v4;
}

- (void).cxx_destruct
{
}

@end