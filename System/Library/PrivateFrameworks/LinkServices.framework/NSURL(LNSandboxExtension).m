@interface NSURL(LNSandboxExtension)
- (id)ln_sandboxExtendedURLWithAuditToken:()LNSandboxExtension;
@end

@implementation NSURL(LNSandboxExtension)

- (id)ln_sandboxExtendedURLWithAuditToken:()LNSandboxExtension
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 path];
  [v5 fileSystemRepresentation];
  long long v6 = a3[1];
  *(_OWORD *)v14 = *a3;
  *(_OWORD *)&v14[16] = v6;
  v7 = (const char *)sandbox_extension_issue_file_to_process();

  if (v7)
  {
    id v8 = (id)objc_msgSend(a1, "copy", *(_OWORD *)v14, *(_OWORD *)&v14[16]);
    v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v7 length:strlen(v7) + 1];
    MEMORY[0x1A625C770](v8, v9);
  }
  else
  {
    v10 = getLNLogCategoryGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = __error();
      v12 = strerror(*v11);
      *(_DWORD *)v14 = 138412546;
      *(void *)&v14[4] = a1;
      *(_WORD *)&v14[12] = 2080;
      *(void *)&v14[14] = v12;
      _os_log_impl(&dword_1A4419000, v10, OS_LOG_TYPE_ERROR, "Could not create sandbox read extension for file URL %@, error: %s", v14, 0x16u);
    }

    id v8 = a1;
  }
  return v8;
}

@end