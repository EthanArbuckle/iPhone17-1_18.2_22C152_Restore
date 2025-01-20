@interface URLSession
+ (URLSession)sharedSession;
- (URLSession)initWithConfiguration:(id)a3;
- (id)delegate;
@end

@implementation URLSession

- (URLSession)initWithConfiguration:(id)a3
{
  id v4 = a3;
  +[AMSEphemeralDefaults setHARLoggingItemLimit:200];
  v7.receiver = self;
  v7.super_class = (Class)URLSession;
  v5 = [(URLSession *)&v7 initWithConfiguration:v4];

  return v5;
}

+ (URLSession)sharedSession
{
  if (qword_100042B30 != -1) {
    dispatch_once(&qword_100042B30, &stru_100038CD0);
  }
  v2 = (void *)qword_100042B38;
  return (URLSession *)v2;
}

- (id)delegate
{
  return +[URLSessionHandler sharedHandler];
}

@end