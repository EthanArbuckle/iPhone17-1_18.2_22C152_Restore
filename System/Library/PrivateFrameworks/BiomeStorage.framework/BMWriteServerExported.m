@interface BMWriteServerExported
- (BMWriteServerExported)initWithProcess:(id)a3 accessControlPolicy:(id)a4;
- (id)checkEntitlementsAndReturnWriterForStreamIdentifier:(id)a3 user:(unsigned int)a4 error:(id *)a5;
- (void)writeData:(id)a3 version:(unsigned int)a4 timestamp:(double)a5 toStream:(id)a6 asUser:(unsigned int)a7 reply:(id)a8;
@end

@implementation BMWriteServerExported

- (BMWriteServerExported)initWithProcess:(id)a3 accessControlPolicy:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMWriteServerExported;
  v9 = [(BMWriteServerExported *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_process, a3);
    objc_storeStrong((id *)&v10->_policy, a4);
    uint64_t v11 = objc_opt_new();
    writerCache = v10->_writerCache;
    v10->_writerCache = (NSMutableDictionary *)v11;
  }
  return v10;
}

- (id)checkEntitlementsAndReturnWriterForStreamIdentifier:(id)a3 user:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  v34[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (v9)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"BMWriteServer.m", 48, @"Invalid parameter not satisfying: %@", @"streamIdentifier" object file lineNumber description];

    if (a5) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"BMWriteServer.m", 49, @"Invalid parameter not satisfying: %@", @"outError" object file lineNumber description];

LABEL_3:
  v10 = (void *)MEMORY[0x1E4F93BB8];
  uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v6];
  v12 = [v10 tupleWithFirst:v9 second:v11];

  v13 = [(NSMutableDictionary *)self->_writerCache objectForKeyedSubscript:v12];
  if (v13) {
    goto LABEL_13;
  }
  if ([(BMAccessControlPolicy *)self->_policy allowsAccessToWriteServiceForStream:v9 ofUser:v6])
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    objc_super v14 = (void (*)(void))getBiomeLibraryNodeSymbolLoc_ptr;
    v32 = getBiomeLibraryNodeSymbolLoc_ptr;
    if (!getBiomeLibraryNodeSymbolLoc_ptr)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __getBiomeLibraryNodeSymbolLoc_block_invoke;
      v28[3] = &unk_1E5E78708;
      v28[4] = &v29;
      __getBiomeLibraryNodeSymbolLoc_block_invoke((uint64_t)v28);
      objc_super v14 = (void (*)(void))v30[3];
    }
    _Block_object_dispose(&v29, 8);
    if (!v14) {
      -[BMWriteServerExported checkEntitlementsAndReturnWriterForStreamIdentifier:user:error:]();
    }
    v15 = v14();
    v16 = [v15 streamWithIdentifier:v9 error:a5];

    if (!v16)
    {
      v13 = 0;
      goto LABEL_12;
    }
    id v17 = (id)[v16 valueForKeyPath:@"configuration.eventClass"];
    v18 = [v16 valueForKeyPath:@"configuration.storeConfig"];
    v19 = [[BMStreamDatastoreWriter alloc] initWithStream:v9 config:v18 eventDataClass:v17];
    [(NSMutableDictionary *)self->_writerCache setObject:v19 forKeyedSubscript:v12];
    v20 = v19;

    v13 = v20;
  }
  else
  {
    v21 = NSString;
    v22 = [(BMAccessControlPolicy *)self->_policy descriptionOfProcessAndUseCase];
    v23 = BMAccessModePrintableDescription();
    v16 = [v21 stringWithFormat:@"%@ is not entitled for '%@' access to '%@'", v22, v23, v9];

    v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    v34[0] = v16;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    [v24 errorWithDomain:*MEMORY[0x1E4F4FAD8] code:5 userInfo:v20];
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_12:
LABEL_13:

  return v13;
}

- (void)writeData:(id)a3 version:(unsigned int)a4 timestamp:(double)a5 toStream:(id)a6 asUser:(unsigned int)a7 reply:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v12 = *(void *)&a4;
  v29[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a6;
  v16 = (void (**)(id, void *))a8;
  id v17 = (void *)MEMORY[0x1AD11E210]();
  id v27 = 0;
  v18 = [(BMWriteServerExported *)self checkEntitlementsAndReturnWriterForStreamIdentifier:v15 user:v9 error:&v27];
  id v19 = v27;
  v20 = v19;
  if (v18)
  {
    if ([v18 _writeEventData:v14 dataVersion:v12 timestamp:0 outBookmark:a5])
    {
      v21 = __biome_log_for_category();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_1AD076000, v21, OS_LOG_TYPE_INFO, "BMWriteServer write succeeded", v26, 2u);
      }
      uint64_t v22 = 0;
    }
    else
    {
      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F4FAD8];
      uint64_t v28 = *MEMORY[0x1E4F28568];
      v29[0] = @"Write failed";
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      uint64_t v22 = [v24 errorWithDomain:v25 code:0 userInfo:v21];

      v20 = (void *)v22;
    }
    v23 = v20;

    v20 = (void *)v22;
  }
  else
  {
    v23 = v19;
  }
  v16[2](v16, v20);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_writerCache, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

- (void)checkEntitlementsAndReturnWriterForStreamIdentifier:user:error:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"id<_BMLibraryBaseProtocol> _BiomeLibraryNode(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMWriteServer.m", 23, @"%s", dlerror());

  __break(1u);
}

@end