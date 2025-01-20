@interface _CLUnSupportedService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)valid;
- (void)setValid:(BOOL)a3;
@end

@implementation _CLUnSupportedService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v5 = a4 + 1;
  if (v5 < [v6 count]) {
    objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", v6, v5);
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1E964BBE0 != -1) {
    dispatch_once(&qword_1E964BBE0, &unk_1EF7F51C0);
  }
  return 0;
}

+ (BOOL)isSupported
{
  return 0;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end