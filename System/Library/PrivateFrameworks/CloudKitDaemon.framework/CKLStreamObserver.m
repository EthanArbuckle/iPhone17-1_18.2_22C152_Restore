@interface CKLStreamObserver
- (BOOL)colorOutput;
- (BOOL)onlyTestLogs;
- (BOOL)simulatorOnly;
- (CKLEventFilter)filter;
- (CKLStreamObserver)initWithLogTypes:(unint64_t)a3;
- (NSDateFormatter)formatter;
- (NSMutableDictionary)processNamesByPath;
- (NSString)processName;
- (id)_processNameForPath:(id)a3;
- (void)_handleEvent:(id)a3;
- (void)eventMatched:(id)a3;
- (void)setColorOutput:(BOOL)a3;
- (void)setFilter:(id)a3;
- (void)setOnlyTestLogs:(BOOL)a3;
- (void)setProcessName:(id)a3;
- (void)setProcessNamesByPath:(id)a3;
- (void)setSimulatorOnly:(BOOL)a3;
@end

@implementation CKLStreamObserver

- (CKLStreamObserver)initWithLogTypes:(unint64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CKLStreamObserver;
  v4 = [(CKLStreamObserver *)&v15 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    formatter = v4->_formatter;
    v4->_formatter = (NSDateFormatter *)v5;

    objc_msgSend_setDateFormat_(v4->_formatter, v7, @"yyyy-MM-dd HH:mm:ss.SSSSSSZZZ");
    uint64_t v8 = objc_opt_new();
    processNamesByPath = v4->_processNamesByPath;
    v4->_processNamesByPath = (NSMutableDictionary *)v8;

    v4->_colorOutput = 1;
    v10 = [CKLEventFilter alloc];
    uint64_t v12 = objc_msgSend_initWithLogTypes_(v10, v11, a3);
    filter = v4->_filter;
    v4->_filter = (CKLEventFilter *)v12;
  }
  return v4;
}

- (void)setSimulatorOnly:(BOOL)a3
{
}

- (BOOL)simulatorOnly
{
  return objc_msgSend_simulatorMessagesOnly(self->_filter, a2, v2);
}

- (void)setOnlyTestLogs:(BOOL)a3
{
}

- (BOOL)onlyTestLogs
{
  return objc_msgSend_onlyTestLogs(self->_filter, a2, v2);
}

- (void)setProcessName:(id)a3
{
}

- (NSString)processName
{
  return (NSString *)objc_msgSend_processName(self->_filter, a2, v2);
}

- (id)_processNameForPath:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = objc_msgSend_processNamesByPath(self, v4, v5);
    v9 = objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)v6);

    if (!v9)
    {
      v9 = objc_msgSend_lastPathComponent(v6, v10, v11);
      v14 = objc_msgSend_processNamesByPath(self, v12, v13);
      objc_msgSend_setObject_forKeyedSubscript_(v14, v15, (uint64_t)v9, v6);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_handleEvent:(id)a3
{
  id v11 = a3;
  id v6 = objc_msgSend_filter(self, v4, v5);
  int v8 = objc_msgSend_matchesEvent_(v6, v7, (uint64_t)v11);

  if (v8)
  {
    v9 = (void *)MEMORY[0x1C8789E70]();
    objc_msgSend_eventMatched_(self, v10, (uint64_t)v11);
  }
}

- (void)eventMatched:(id)a3
{
  objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, (uint64_t)a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v5, (uint64_t)a2, self, @"CKLStreamObserver.m", 106, @"This must be called on a subclass");
}

- (BOOL)colorOutput
{
  return self->_colorOutput;
}

- (void)setColorOutput:(BOOL)a3
{
  self->_colorOutput = a3;
}

- (CKLEventFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (NSDateFormatter)formatter
{
  return self->_formatter;
}

- (NSMutableDictionary)processNamesByPath
{
  return self->_processNamesByPath;
}

- (void)setProcessNamesByPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processNamesByPath, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

@end