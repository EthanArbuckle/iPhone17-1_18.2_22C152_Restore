@interface _DPReportFileManager
+ (id)submittedReports;
+ (id)submittedReportsInDirectory:(id)a3;
- (NSString)reportsDirectoryPath;
- (_DPDaemonConnection)connection;
- (_DPReportFileManager)init;
- (_DPReportFileManager)initWithDirectoryPath:(id)a3;
- (id)reportsNotYetSubmitted;
- (void)dealloc;
- (void)retireReports:(id)a3;
- (void)setReportsDirectoryPath:(id)a3;
@end

@implementation _DPReportFileManager

- (_DPReportFileManager)initWithDirectoryPath:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_DPReportFileManager;
  v6 = [(_DPReportFileManager *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_reportsDirectoryPath, a3);
    connection = v7->_connection;
    v7->_connection = 0;
  }
  return v7;
}

- (_DPReportFileManager)init
{
  v3 = +[_DPStrings transparencyLogDirectoryPath];
  v4 = [(_DPReportFileManager *)self initWithDirectoryPath:v3];

  return v4;
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection)
  {
    self->_connection = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_DPReportFileManager;
  [(_DPReportFileManager *)&v4 dealloc];
}

+ (id)submittedReports
{
  v3 = +[_DPStrings transparencyLogDirectoryPath];
  objc_super v4 = [a1 submittedReportsInDirectory:v3];

  return v4;
}

+ (id)submittedReportsInDirectory:(id)a3
{
  id v3 = a3;
  objc_super v4 = (void *)MEMORY[0x1E019F810]();
  id v5 = +[_DPReportFilesMaintainer reportsInDirectory:v3];
  v6 = +[_DPReportFilesMaintainer retiredReportsPath:v3];
  v7 = +[_DPReportFilesMaintainer reportsInDirectory:v6];
  v8 = [MEMORY[0x1E4F1CA48] arrayWithArray:v5];
  [v8 addObjectsFromArray:v7];
  v9 = (void *)[v8 copy];

  return v9;
}

- (id)reportsNotYetSubmitted
{
  connection = self->_connection;
  if (!connection)
  {
    id v5 = self;
    objc_sync_enter(v5);
    if (!self->_connection)
    {
      v6 = +[_DPDaemonConnection daemonConnection];
      v7 = self->_connection;
      self->_connection = v6;
    }
    objc_sync_exit(v5);

    connection = self->_connection;
  }
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46___DPReportFileManager_reportsNotYetSubmitted__block_invoke;
  v10[3] = &unk_1E6C43F68;
  v10[5] = &v11;
  v10[6] = a2;
  v10[4] = self;
  [(_DPDaemonConnection *)connection reportsNotYetSubmittedWithReply:v10];
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)retireReports:(id)a3
{
  id v5 = a3;
  connection = self->_connection;
  if (!connection)
  {
    v7 = self;
    objc_sync_enter(v7);
    if (!self->_connection)
    {
      id v8 = +[_DPDaemonConnection daemonConnection];
      v9 = self->_connection;
      self->_connection = v8;
    }
    objc_sync_exit(v7);

    connection = self->_connection;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38___DPReportFileManager_retireReports___block_invoke;
  v11[3] = &unk_1E6C43F90;
  id v12 = v5;
  SEL v13 = a2;
  v11[4] = self;
  id v10 = v5;
  [(_DPDaemonConnection *)connection retireReports:v10 withReply:v11];
}

- (NSString)reportsDirectoryPath
{
  return self->_reportsDirectoryPath;
}

- (void)setReportsDirectoryPath:(id)a3
{
}

- (_DPDaemonConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_reportsDirectoryPath, 0);
}

@end