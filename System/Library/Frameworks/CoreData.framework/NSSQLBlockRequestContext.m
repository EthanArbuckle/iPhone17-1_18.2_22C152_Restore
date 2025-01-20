@interface NSSQLBlockRequestContext
- (BOOL)executeRequestCore:(id *)a3;
- (BOOL)isWritingRequest;
- (NSSQLBlockRequestContext)initWithBlock:(id)a3 context:(id)a4 sqlCore:(id)a5;
- (void)dealloc;
@end

@implementation NSSQLBlockRequestContext

- (BOOL)isWritingRequest
{
  return 1;
}

- (NSSQLBlockRequestContext)initWithBlock:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NSSQLBlockRequestContext;
  v6 = [(NSSQLStoreRequestContext *)&v8 initWithRequest:0 context:a4 sqlCore:a5];
  if (v6) {
    v6->_workBlock = (id)[a3 copy];
  }
  return v6;
}

- (void)dealloc
{
  self->_workBlock = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLBlockRequestContext;
  [(NSSQLStoreRequestContext *)&v3 dealloc];
}

- (BOOL)executeRequestCore:(id *)a3
{
  (*((void (**)(void))self->_workBlock + 2))();
  if (a3 && *a3) {
    objc_setProperty_nonatomic(self, v5, *a3, 40);
  }
  return !self->super._exception && self->super._error == 0;
}

@end