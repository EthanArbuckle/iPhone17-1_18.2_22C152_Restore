@interface FBWorkspaceConnectionsState
+ (id)deserializeLength:(unint64_t *)a3 fromReader:(id)a4;
+ (unint64_t)minimumSerializedDataLength;
- (BOOL)isEqual:(id)a3;
- (FBWorkspaceConnectionsState)init;
- (NSSet)processIdentifiers;
- (id)_initWithIndexSet:(id)a3;
- (id)copy;
- (id)description;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)serializeToWriter:(id)a3;
- (unint64_t)hash;
- (unint64_t)serializedDataLength;
@end

@implementation FBWorkspaceConnectionsState

- (BOOL)isEqual:(id)a3
{
  v4 = (FBWorkspaceConnectionsState *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class() || (uint64_t v6 = objc_opt_class(), v6 == objc_opt_class())) { {
      char v7 = [(NSMutableIndexSet *)self->_pidSet isEqualToIndexSet:v4->_pidSet];
    }
    }
    else {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)serializedDataLength
{
  return 4 * [(NSMutableIndexSet *)self->_pidSet count] + 4;
}

- (int64_t)serializeToWriter:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v4 = (uint64_t (**)(id, _DWORD *, uint64_t))a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if ((unint64_t)[(NSMutableIndexSet *)self->_pidSet count] >> 31)
  {
    v8 = FBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceConnectionsState serializeToWriter:](v8);
    }
    }

    int64_t v9 = -1;
    v20[3] = -1;
  }
  else
  {
    int v18 = [(NSMutableIndexSet *)self->_pidSet count];
    uint64_t v5 = v4[2](v4, &v18, 4);
    if (v5 < 0)
    {
      v10 = __error();
      strerror_r(*v10, __strerrbuf, 0x100uLL);
      v11 = FBLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v13 = v18;
        int v14 = *__error();
        *(_DWORD *)buf = 67109634;
        int v24 = v13;
        __int16 v25 = 1024;
        int v26 = v14;
        __int16 v27 = 2080;
        v28 = __strerrbuf;
        _os_log_error_impl(&dword_1A62FC000, v11, OS_LOG_TYPE_ERROR, "failed to write count (%i) : errno=%i (%s)", buf, 0x18u);
      }

      char v7 = v20;
      v20[3] = -1;
    }
    else
    {
      v20[3] += v5;
      pidSet = self->_pidSet;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __49__FBWorkspaceConnectionsState_serializeToWriter___block_invoke;
      v15[3] = &unk_1E5C4AC70;
      v16 = v4;
      v17 = &v19;
      [(NSMutableIndexSet *)pidSet enumerateIndexesUsingBlock:v15];

      char v7 = v20;
    }
    int64_t v9 = v7[3];
  }
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __49__FBWorkspaceConnectionsState_serializeToWriter___block_invoke(uint64_t a1, int a2, unsigned char *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v8 = a2;
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v5 < 0)
  {
    uint64_t v6 = __error();
    strerror_r(*v6, __strerrbuf, 0x100uLL);
    char v7 = FBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) { {
      __49__FBWorkspaceConnectionsState_serializeToWriter___block_invoke_cold_1();
    }
    }

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -1;
    *a3 = 1;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v5;
  }
}

- (void).cxx_destruct
{
}

- (id)copy
{
  v3.receiver = self;
  v3.super_class = (Class)FBWorkspaceConnectionsState;
  return [(FBWorkspaceConnectionsState *)&v3 copy];
}

- (id)_initWithIndexSet:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBWorkspaceConnectionsState;
  uint64_t v5 = [(FBWorkspaceConnectionsState *)&v9 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [v4 mutableCopy];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F28E60] indexSet];
    }
    pidSet = v5->_pidSet;
    v5->_pidSet = (NSMutableIndexSet *)v6;
  }
  return v5;
}

- (FBWorkspaceConnectionsState)init
{
  return (FBWorkspaceConnectionsState *)[(FBWorkspaceConnectionsState *)self _initWithIndexSet:0];
}

- (NSSet)processIdentifiers
{
  if ([(NSMutableIndexSet *)self->_pidSet count])
  {
    objc_super v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[NSMutableIndexSet count](self->_pidSet, "count"));
    pidSet = self->_pidSet;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__FBWorkspaceConnectionsState_processIdentifiers__block_invoke;
    v7[3] = &unk_1E5C4AC48;
    id v5 = v3;
    id v8 = v5;
    [(NSMutableIndexSet *)pidSet enumerateIndexesUsingBlock:v7];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CAD0] set];
  }

  return (NSSet *)v5;
}

void __49__FBWorkspaceConnectionsState_processIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithInt:a2];
  [v2 addObject:v3];
}

- (id)mutableCopy
{
  v3.receiver = self;
  v3.super_class = (Class)FBWorkspaceConnectionsState;
  return [(FBWorkspaceConnectionsState *)&v3 mutableCopy];
}

+ (unint64_t)minimumSerializedDataLength
{
  return 4;
}

+ (id)deserializeLength:(unint64_t *)a3 fromReader:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = (uint64_t (**)(id, int *, uint64_t))a4;
  uint64_t v6 = (id *)objc_opt_new();
  int v18 = 0;
  uint64_t v7 = v5[2](v5, &v18, 4);
  if (v7 < 0)
  {
    v12 = __error();
    strerror_r(*v12, __strerrbuf, 0x100uLL);
    int v13 = FBLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) { {
      +[FBWorkspaceConnectionsState deserializeLength:fromReader:].cold.4((uint64_t)__strerrbuf, v13);
    }
    }
  }
  else
  {
    unint64_t v8 = v7;
    if (v18 < 1)
    {
LABEL_8:
      if (a3) { {
        *a3 = v8;
      }
      }
      v11 = v6;
      goto LABEL_22;
    }
    int v9 = 0;
    while ((uint64_t)(v8 + 4) >= 0)
    {
      int v17 = -1;
      uint64_t v10 = v5[2](v5, &v17, 4);
      if (v10 < 0)
      {
        int v14 = __error();
        strerror_r(*v14, __strerrbuf, 0x100uLL);
        v15 = FBLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) { {
          +[FBWorkspaceConnectionsState deserializeLength:fromReader:]();
        }
        }
        goto LABEL_20;
      }
      if (v17 <= 0)
      {
        v15 = FBLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) { {
          +[FBWorkspaceConnectionsState deserializeLength:fromReader:](v9, &v17, v15);
        }
        }
LABEL_20:

        goto LABEL_21;
      }
      v8 += v10;
      objc_msgSend(v6[1], "addIndex:");
      if (++v9 >= v18) { {
        goto LABEL_8;
      }
      }
    }
    int v13 = FBLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceConnectionsState serializeToWriter:](v13);
    }
    }
  }

LABEL_21:
  v11 = 0;
LABEL_22:

  return v11;
}

- (unint64_t)hash
{
  return [(NSMutableIndexSet *)self->_pidSet hash];
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] string];
  pidSet = self->_pidSet;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __42__FBWorkspaceConnectionsState_description__block_invoke;
  v11 = &unk_1E5C4AC98;
  id v12 = v3;
  id v5 = v3;
  [(NSMutableIndexSet *)pidSet enumerateRangesUsingBlock:&v8];
  uint64_t v6 = [NSString stringWithFormat:@"<%@:%p pids=%@>", objc_opt_class(), self, v5, v8, v9, v10, v11];

  return v6;
}

void __42__FBWorkspaceConnectionsState_description__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if ([*(id *)(a1 + 32) length]) { {
    [*(id *)(a1 + 32) appendString:@","];
  }
  }
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v8 = [v7 stringValue];
  [v6 appendString:v8];

  if (a3 >= 2)
  {
    [*(id *)(a1 + 32) appendString:@"-"];
    uint64_t v9 = *(void **)(a1 + 32);
    id v11 = [NSNumber numberWithUnsignedInteger:a2 + a3];
    uint64_t v10 = [v11 stringValue];
    [v9 appendString:v10];
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [FBMutableWorkspaceConnectionsState alloc];
  pidSet = self->_pidSet;

  return [(FBWorkspaceConnectionsState *)v4 _initWithIndexSet:pidSet];
}

- (void)serializeToWriter:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A62FC000, log, OS_LOG_TYPE_ERROR, "data section is too large", v1, 2u);
}

void __49__FBWorkspaceConnectionsState_serializeToWriter___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_2(&dword_1A62FC000, v0, v1, "failed to write pid (%i) : errno=%i (%s)", v2, v3, v4, v5, v6);
}

+ (void)deserializeLength:(os_log_t)log fromReader:.cold.1(int a1, int *a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = *a2;
  v4[0] = 67109376;
  v4[1] = a1 + 1;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_error_impl(&dword_1A62FC000, log, OS_LOG_TYPE_ERROR, "pid %i is invalid (%i)", (uint8_t *)v4, 0xEu);
}

+ (void)deserializeLength:fromReader:.cold.2()
{
  OUTLINED_FUNCTION_2_2(&dword_1A62FC000, v0, v1, "failed to read pid %i : errno=%i (%s)", v2, v3, v4, v5, v6);
}

+ (void)deserializeLength:(uint64_t)a1 fromReader:(NSObject *)a2 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  v5[0] = 67109378;
  v5[1] = v4;
  __int16 v6 = 2080;
  uint64_t v7 = a1;
  _os_log_error_impl(&dword_1A62FC000, a2, OS_LOG_TYPE_ERROR, "failed to read count : errno=%i (%s)", (uint8_t *)v5, 0x12u);
}

@end