@interface _KSControlFileController
- (BOOL)checkIfExists;
- (_KSControlFileController)initWithName:(id)a3 inDirectory:(id)a4;
- (id)contents;
- (id)description;
- (void)reset;
- (void)setContents:(id)a3;
@end

@implementation _KSControlFileController

- (_KSControlFileController)initWithName:(id)a3 inDirectory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_KSControlFileController;
  v8 = [(_KSControlFileController *)&v15 init];
  if (v8)
  {
    v9 = NSURL;
    v10 = [v6 stringByAppendingString:@".ctrl"];
    v11 = [v7 stringByAppendingPathComponent:v10];
    uint64_t v12 = [v9 fileURLWithPath:v11];
    url = v8->_url;
    v8->_url = (NSURL *)v12;
  }
  return v8;
}

- (BOOL)checkIfExists
{
  if (![(NSURL *)self->_url checkResourceIsReachableAndReturnError:0]) {
    return 0;
  }
  url = self->_url;
  id v8 = 0;
  BOOL v4 = [(NSURL *)url getResourceValue:&v8 forKey:*MEMORY[0x263EFF6B0] error:0];
  id v5 = v8;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ([v5 BOOLValue] & 1) != 0)
  {
    BOOL v6 = 1;
  }
  else
  {
    [(_KSControlFileController *)self reset];
    BOOL v6 = 0;
  }

  return v6;
}

- (void)reset
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_22B2BC000, v0, v1, "%s  Failed to delete %@", v2, v3, v4, v5, 2u);
}

- (id)contents
{
  return (id)[MEMORY[0x263EFF8F8] dataWithContentsOfURL:self->_url];
}

- (void)setContents:(id)a3
{
  id v4 = a3;
  int v5 = open([(NSURL *)self->_url fileSystemRepresentation], 1573, 384);
  if (v5 < 0)
  {
    v11 = KSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_KSControlFileController setContents:]();
    }
  }
  else
  {
    int v6 = v5;
    if (v4)
    {
      id v7 = v4;
      write(v6, (const void *)[v7 bytes], objc_msgSend(v7, "length"));
    }
    close(v6);
    url = self->_url;
    uint64_t v9 = *MEMORY[0x263EFF6B0];
    id v13 = 0;
    BOOL v10 = [(NSURL *)url setResourceValue:MEMORY[0x263EFFA88] forKey:v9 error:&v13];
    v11 = v13;
    if (!v10)
    {
      uint64_t v12 = KSCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[_KSControlFileController setContents:]();
      }

      [(_KSControlFileController *)self reset];
    }
  }
}

- (id)description
{
  if (![(NSURL *)self->_url checkResourceIsReachableAndReturnError:0])
  {
    id v8 = @"Absent";
    goto LABEL_12;
  }
  url = self->_url;
  id v15 = 0;
  uint64_t v4 = *MEMORY[0x263EFF6B0];
  id v14 = 0;
  BOOL v5 = [(NSURL *)url getResourceValue:&v15 forKey:v4 error:&v14];
  id v6 = v15;
  id v7 = v14;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v6 BOOLValue]) {
        id v8 = @"Present";
      }
      else {
        id v8 = @"Error: wrong tag value";
      }
      goto LABEL_11;
    }
    [NSString stringWithFormat:@"Error: bad tag '%@'", v6];
  }
  else
  {
    [NSString stringWithFormat:@"Error: not tagged (%@)", v7];
  }
  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_11:

LABEL_12:
  uint64_t v9 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)_KSControlFileController;
  BOOL v10 = [(_KSControlFileController *)&v13 description];
  v11 = [v9 stringWithFormat:@"<%@; %@: %@>", v10, self->_url, v8];

  return v11;
}

- (void).cxx_destruct
{
}

- (void)setContents:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_22B2BC000, v0, v1, "%s  Failed to create %@", v2, v3, v4, v5, 2u);
}

- (void)setContents:.cold.2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_22B2BC000, v2, OS_LOG_TYPE_ERROR, "%s  Failed to mark %@ as non-backup: %@", (uint8_t *)v3, 0x20u);
}

@end