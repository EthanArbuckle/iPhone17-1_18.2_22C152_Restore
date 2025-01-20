@interface _OSLogCollectionReference
+ (_OSLogCollectionReference)referenceWithURL:(id)a3 error:(id *)a4;
+ (id)localDBRefWithError:(id *)a3;
- (_OSLogCollectionReference)initWithDiagnosticsDirectory:(id)a3 timesyncDirectory:(id)a4 UUIDTextDirectory:(id)a5;
- (_OSLogDirectoryReference)UUIDTextReference;
- (_OSLogDirectoryReference)diagnosticsDirectoryReference;
- (_OSLogDirectoryReference)timesyncReference;
- (void)close;
@end

@implementation _OSLogCollectionReference

- (_OSLogDirectoryReference)diagnosticsDirectoryReference
{
  return self->_diagnosticsDirectoryReference;
}

- (void)close
{
  [(_OSLogDirectoryReference *)self->_diagnosticsDirectoryReference close];
  [(_OSLogDirectoryReference *)self->_timesyncReference close];
  UUIDTextReference = self->_UUIDTextReference;
  [(_OSLogDirectoryReference *)UUIDTextReference close];
}

- (_OSLogDirectoryReference)timesyncReference
{
  return self->_timesyncReference;
}

- (_OSLogDirectoryReference)UUIDTextReference
{
  return self->_UUIDTextReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUIDTextReference, 0);
  objc_storeStrong((id *)&self->_timesyncReference, 0);
  objc_storeStrong((id *)&self->_diagnosticsDirectoryReference, 0);
}

+ (id)localDBRefWithError:(id *)a3
{
  v31[3] = *MEMORY[0x1E4F143B8];
  OSLogLogdAdminConnection();
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "operation", 6uLL);
    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
    if (MEMORY[0x1A622E220]() == MEMORY[0x1E4F145A8])
    {
      if (a3)
      {
        id v10 = v7;
        string = xpc_dictionary_get_string(v10, (const char *)*MEMORY[0x1E4F14530]);
        if (string) {
          v12 = string;
        }
        else {
          v12 = "unknown error";
        }
        v30[0] = @"_OSLogErrorInternalCode";
        v13 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:15];
        v31[0] = v13;
        v30[1] = @"_OSLogErrorXPCErrorDescription";
        v14 = [NSString stringWithUTF8String:v12];
        v30[2] = *MEMORY[0x1E4F28568];
        v31[1] = v14;
        v31[2] = @"Connection to logd failed";
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];

        uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"OSLogErrorDomain" code:10 userInfo:v15];

        v8 = (void *)v16;
        goto LABEL_12;
      }
LABEL_19:
      v9 = 0;
      goto LABEL_27;
    }
    if (xpc_dictionary_get_uint64(v7, "errorcode") == 1)
    {
      if (a3)
      {
        v8 = _OSLogError(14);
LABEL_12:
        v9 = 0;
        *a3 = v8;
LABEL_27:

        goto LABEL_28;
      }
      goto LABEL_19;
    }
    uint64_t v17 = xpc_dictionary_dup_fd(v7, "persistdir_fd");
    v18 = xpc_dictionary_get_string(v7, "persistdir_sbext");
    if (v17 == -1) {
      goto LABEL_19;
    }
    v19 = [[_OSLogDirectoryReference alloc] initWithDescriptor:v17 sandboxExtensionToken:v18];
    if (close(v17) == -1)
    {
      int v29 = *__error();
      id result = (id)*__error();
      if (v29 == 9)
      {
        qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1E953C318 = (uint64_t)result;
        __break(1u);
        goto LABEL_34;
      }
      _os_assumes_log();
    }
    uint64_t v20 = xpc_dictionary_dup_fd(v7, "timesyncdir_fd");
    v21 = xpc_dictionary_get_string(v7, "timesyncdir_sbext");
    if (v20 == -1)
    {
      v22 = 0;
      goto LABEL_21;
    }
    v22 = [[_OSLogDirectoryReference alloc] initWithDescriptor:v20 sandboxExtensionToken:v21];
    if (close(v20) != -1)
    {
LABEL_21:
      uint64_t v25 = xpc_dictionary_dup_fd(v7, "uuidtextdir_fd");
      v26 = xpc_dictionary_get_string(v7, "uuidtextdir_sbext");
      if (v25 == -1)
      {
        v27 = 0;
        goto LABEL_26;
      }
      v27 = [[_OSLogDirectoryReference alloc] initWithDescriptor:v25 sandboxExtensionToken:v26];
      if (close(v25) != -1)
      {
LABEL_26:
        v9 = (void *)[objc_alloc((Class)a1) initWithDiagnosticsDirectory:v19 timesyncDirectory:v22 UUIDTextDirectory:v27];

        goto LABEL_27;
      }
      int v28 = *__error();
      id result = (id)*__error();
      if (v28 != 9)
      {
        _os_assumes_log();
        goto LABEL_26;
      }
LABEL_35:
      qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_1E953C318 = (uint64_t)result;
      __break(1u);
      return result;
    }
    int v23 = *__error();
    id result = (id)*__error();
    if (v23 != 9)
    {
      _os_assumes_log();
      goto LABEL_21;
    }
LABEL_34:
    qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_1E953C318 = (uint64_t)result;
    __break(1u);
    goto LABEL_35;
  }
  v9 = 0;
LABEL_28:

  return v9;
}

- (_OSLogCollectionReference)initWithDiagnosticsDirectory:(id)a3 timesyncDirectory:(id)a4 UUIDTextDirectory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_OSLogCollectionReference;
  v12 = [(_OSLogCollectionReference *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_diagnosticsDirectoryReference, a3);
    objc_storeStrong((id *)&v13->_timesyncReference, a4);
    objc_storeStrong((id *)&v13->_UUIDTextReference, a5);
  }

  return v13;
}

+ (_OSLogCollectionReference)referenceWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  xpc_object_t v7 = NSString;
  if (_os_trace_shared_paths_init_once != -1) {
    dispatch_once(&_os_trace_shared_paths_init_once, &__block_literal_global_55);
  }
  v8 = [v7 stringWithUTF8String:_os_trace_persist_path];
  id v9 = [v6 path];
  int v10 = [v9 hasPrefix:v8];

  if (!v10)
  {
    v12 = [v6 path];
    uint64_t v13 = [v12 rangeOfString:@".logarchive" options:4];
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a4)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:3 userInfo:0];
        id v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v11 = 0;
      }
      goto LABEL_20;
    }
    id v15 = [v12 substringToIndex:v13 + v14];
    uint64_t v16 = open((const char *)[v15 fileSystemRepresentation], 0);
    if (v16 == -1)
    {
      if (a4)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
        id v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v11 = 0;
      }
      goto LABEL_19;
    }
    uint64_t v17 = v16;
    v18 = [[_OSLogDirectoryReference alloc] initWithDescriptor:v16 sandboxExtensionToken:0];
    v19 = [[_OSLogDirectoryReference alloc] initWithDescriptor:v17 sandboxExtensionToken:0];
    if (close(v17) == -1)
    {
      int v26 = *__error();
      id result = (_OSLogCollectionReference *)*__error();
      if (v26 == 9)
      {
        qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1E953C318 = (uint64_t)result;
        __break(1u);
        goto LABEL_28;
      }
      _os_assumes_log();
    }
    id v20 = [v15 stringByAppendingPathComponent:@"timesync"];
    uint64_t v21 = open((const char *)[v20 fileSystemRepresentation], 0);
    if (v21 == -1)
    {
      int v23 = 0;
      goto LABEL_18;
    }
    int v22 = v21;
    int v23 = [[_OSLogDirectoryReference alloc] initWithDescriptor:v21 sandboxExtensionToken:0];
    if (close(v22) != -1)
    {
LABEL_18:
      id v11 = (void *)[objc_alloc((Class)a1) initWithDiagnosticsDirectory:v18 timesyncDirectory:v23 UUIDTextDirectory:v19];

LABEL_19:
LABEL_20:

      goto LABEL_21;
    }
    int v24 = *__error();
    id result = (_OSLogCollectionReference *)*__error();
    if (v24 != 9)
    {
      _os_assumes_log();
      goto LABEL_18;
    }
LABEL_28:
    qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_1E953C318 = (uint64_t)result;
    __break(1u);
    return result;
  }
  id v11 = [a1 localDBRefWithError:a4];
LABEL_21:

  return (_OSLogCollectionReference *)v11;
}

@end