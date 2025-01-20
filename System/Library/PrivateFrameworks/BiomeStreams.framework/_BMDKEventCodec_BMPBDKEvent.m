@interface _BMDKEventCodec_BMPBDKEvent
- (id)decodeWithProto:(id)a3;
- (id)decodeWithProtoData:(id)a3;
- (id)encodeAsProto:(id)a3;
@end

@implementation _BMDKEventCodec_BMPBDKEvent

- (id)encodeAsProto:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = (void *)MEMORY[0x1E4F28DB0];
  v6 = [v3 dkEvent];

  id v18 = 0;
  v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v18];
  id v8 = v18;

  if (v8)
  {
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_BMDKEventCodec_BMPBDKEvent encodeAsProto:]((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
    }

    id v16 = 0;
  }
  else
  {
    [v4 setDkEvent:v7];
    id v16 = v4;
  }

  return v16;
}

- (id)decodeWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v21 = 0;
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[_BMDKEventCodec_BMPBDKEvent decodeWithProto:].cold.4(v5);
    }
    v21 = 0;
    goto LABEL_25;
  }
  v5 = v4;
  if (([v5 hasDkEvent] & 1) == 0)
  {
    uint64_t v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[_BMDKEventCodec_BMPBDKEvent decodeWithProto:](v13);
    }
    v21 = 0;
    goto LABEL_24;
  }
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2050000000;
  v7 = (void *)get_DKEventClass_softClass_3;
  uint64_t v37 = get_DKEventClass_softClass_3;
  if (!get_DKEventClass_softClass_3)
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __get_DKEventClass_block_invoke_3;
    v33[3] = &unk_1E55D6DA8;
    v33[4] = &v34;
    __get_DKEventClass_block_invoke_3((uint64_t)v33);
    v7 = (void *)v35[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v34, 8);
  v9 = [v6 setWithObject:objc_opt_class()];
  id v10 = objc_alloc(MEMORY[0x1E4F28DC0]);
  uint64_t v11 = [v5 dkEvent];
  id v32 = 0;
  uint64_t v12 = (void *)[v10 initForReadingFromData:v11 error:&v32];
  uint64_t v13 = v32;

  if (v13)
  {
    uint64_t v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_BMDKEventCodec_BMPBDKEvent decodeWithProto:]((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  else
  {
    [v12 setRequiresSecureCoding:1];
    [v12 setDecodingFailurePolicy:1];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v12, "setDk_shouldSkipDecodingMetadata:", -[BMDKEventCodec decodeMetadata](self, "decodeMetadata") ^ 1);
    }
    uint64_t v22 = *MEMORY[0x1E4F284E8];
    id v31 = 0;
    uint64_t v14 = [v12 decodeTopLevelObjectOfClasses:v9 forKey:v22 error:&v31];
    uint64_t v13 = v31;
    if (!v13)
    {
      v21 = [[BMDKEvent alloc] initWithDKEvent:v14];
      goto LABEL_23;
    }
    v23 = __biome_log_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[_BMDKEventCodec_BMPBDKEvent decodeWithProto:]((uint64_t)v13, v23, v24, v25, v26, v27, v28, v29);
    }
  }
  v21 = 0;
LABEL_23:

LABEL_24:
LABEL_25:

LABEL_26:

  return v21;
}

- (id)decodeWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[BMPBDKEvent alloc] initWithData:v4];

    v6 = [(_BMDKEventCodec_BMPBDKEvent *)self decodeWithProto:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeAsProto:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)decodeWithProto:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)decodeWithProto:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)decodeWithProto:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMDKEvent: tried to initialize with a proto missing required data.", v1, 2u);
}

- (void)decodeWithProto:(os_log_t)log .cold.4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "BMDKEvent: tried to initialize with a non-BMDKEvent proto", v1, 2u);
}

@end