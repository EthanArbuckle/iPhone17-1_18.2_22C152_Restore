@interface BKUITypeSafeCopier
+ (id)copy:(id)a3;
- (BKUITypeSafeCopier)init;
@end

@implementation BKUITypeSafeCopier

- (BKUITypeSafeCopier)init
{
  return 0;
}

+ (id)copy:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:0 error:&v12];
  id v4 = v12;
  if (!v4)
  {
    id v11 = 0;
    v6 = [objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v11];
    id v5 = v11;
    if (!v5)
    {
      [v6 setRequiresSecureCoding:0];
      v9 = [v6 decodeObjectForKey:*MEMORY[0x1E4F284E8]];
      goto LABEL_9;
    }
    v7 = _BKUILoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v5 description];
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1E4B6C000, v7, OS_LOG_TYPE_DEFAULT, "[BKUITypeSafeDeepCopier copy], unarchive failed %@", buf, 0xCu);
    }
    goto LABEL_7;
  }
  id v5 = v4;
  v6 = _BKUILoggingFacility();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 description];
    *(_DWORD *)buf = 138412290;
    v14 = v7;
    _os_log_impl(&dword_1E4B6C000, v6, OS_LOG_TYPE_DEFAULT, "[BKUITypeSafeDeepCopier copy], archive failed %@", buf, 0xCu);
LABEL_7:
  }
  v9 = 0;
LABEL_9:

  return v9;
}

@end