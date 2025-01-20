@interface MCMXPCMessageOpenPrimordialDataContainer
- (BOOL)useCodeSignDatabase;
- (MCMXPCMessageOpenPrimordialDataContainer)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
@end

@implementation MCMXPCMessageOpenPrimordialDataContainer

- (BOOL)useCodeSignDatabase
{
  return self->_useCodeSignDatabase;
}

- (MCMXPCMessageOpenPrimordialDataContainer)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMXPCMessageOpenPrimordialDataContainer;
  v9 = [(MCMXPCMessageBase *)&v11 initWithXPCObject:v8 context:a4 error:a5];
  if (v9) {
    v9->_useCodeSignDatabase = xpc_dictionary_get_BOOL(v8, "UseCodeSigningDatabase");
  }

  return v9;
}

@end