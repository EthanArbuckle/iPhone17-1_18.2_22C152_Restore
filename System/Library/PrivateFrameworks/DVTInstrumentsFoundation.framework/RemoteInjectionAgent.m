@interface RemoteInjectionAgent
- (RemoteInjectionAgent)initWithTask:(unsigned int)a3;
- (id)injectLibrary:(id)a3 withFunctionPayload:(id)a4 sandboxExtensions:(id)a5 callingFunction:(id)a6 arguments:(id)a7;
- (void)dealloc;
@end

@implementation RemoteInjectionAgent

- (RemoteInjectionAgent)initWithTask:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RemoteInjectionAgent;
  result = [(RemoteInjectionAgent *)&v5 init];
  if (result) {
    result->_targetTask = a3;
  }
  return result;
}

- (void)dealloc
{
  mach_port_name_t targetTask = self->_targetTask;
  if (targetTask + 1 >= 2)
  {
    mach_port_deallocate(mach_task_self_, targetTask);
    self->_mach_port_name_t targetTask = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)RemoteInjectionAgent;
  [(RemoteInjectionAgent *)&v4 dealloc];
}

- (id)injectLibrary:(id)a3 withFunctionPayload:(id)a4 sandboxExtensions:(id)a5 callingFunction:(id)a6 arguments:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (self->_targetTask + 1 <= 1)
  {
    v31 = __stderrp;
    v32 = getprogname();
    id v33 = +[NSString stringWithFormat:@"Failed to get task for pid."];
    fprintf(v31, "%s (%d-bit): %s\n", v32, 64, (const char *)[v33 UTF8String]);

    exit(4);
  }
  id v17 = v16;
  id v36 = v13;
  id v35 = [v36 bytes];
  v18 = objc_opt_new();
  v19 = v18;
  if (v14) {
    [v18 addObjectsFromArray:v14];
  }
  v38 = v14;
  if (v17) {
    [v19 addObjectsFromArray:v17];
  }
  v37 = v17;
  id v20 = [v19 count];
  int v21 = (int)v20;
  v22 = (const char **)malloc_type_malloc(8 * (void)v20, 0x10040436913F5uLL);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100004870;
  v41[3] = &unk_100008320;
  v41[4] = v22;
  [v19 enumerateObjectsUsingBlock:v41];
  v23 = objc_opt_new();
  vm_map_t targetTask = self->_targetTask;
  id v34 = v12;
  v25 = (const char *)[v34 UTF8String];
  id v26 = v15;
  v27 = (const char *)[v26 UTF8String];
  unsigned int v28 = [v38 count];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000048A8;
  v39[3] = &unk_100008348;
  id v29 = v23;
  id v40 = v29;
  LOBYTE(v27) = sub_100005038(targetTask, (uint64_t)v35, v25, v27, v21, v22, v28, v39);
  free(v22);
  if ((v27 & 1) == 0) {
    [v29 invokeCompletionWithReturnValue:&__kCFBooleanFalse error:0];
  }

  return v29;
}

@end