@interface _ANEChainingRequest
+ (BOOL)supportsSecureCoding;
+ (id)chainingRequestWithInputs:(id)a3 outputSets:(id)a4 lbInputSymbolId:(id)a5 lbOutputSymbolId:(id)a6 procedureIndex:(id)a7 signalEvents:(id)a8 transactionHandle:(id)a9 fwEnqueueDelay:(id)a10 memoryPoolId:(id)a11;
- (BOOL)validate;
- (NSArray)inputBuffer;
- (NSArray)loopbackInputSymbolIndex;
- (NSArray)loopbackOutputSymbolIndex;
- (NSArray)outputSets;
- (NSArray)signalEvents;
- (NSNumber)fwEnqueueDelay;
- (NSNumber)memoryPoolId;
- (NSNumber)procedureIndex;
- (NSNumber)transactionHandle;
- (_ANEChainingRequest)initWithCoder:(id)a3;
- (_ANEChainingRequest)initWithInputs:(id)a3 outputs:(id)a4 lbInputSymbolId:(id)a5 lbOutputSymbolId:(id)a6 procedureIndex:(id)a7 signalEvents:(id)a8 transactionHandle:(id)a9 fwEnqueueDelay:(id)a10 memoryPoolId:(id)a11;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)validate;
@end

@implementation _ANEChainingRequest

- (_ANEChainingRequest)initWithInputs:(id)a3 outputs:(id)a4 lbInputSymbolId:(id)a5 lbOutputSymbolId:(id)a6 procedureIndex:(id)a7 signalEvents:(id)a8 transactionHandle:(id)a9 fwEnqueueDelay:(id)a10 memoryPoolId:(id)a11
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v22 = a10;
  id v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)_ANEChainingRequest;
  v19 = [(_ANEChainingRequest *)&v30 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_inputBuffer, a3);
    objc_storeStrong((id *)&v20->_outputSets, a4);
    objc_storeStrong((id *)&v20->_loopbackInputSymbolIndex, a5);
    objc_storeStrong((id *)&v20->_loopbackOutputSymbolIndex, a6);
    objc_storeStrong((id *)&v20->_procedureIndex, a7);
    objc_storeStrong((id *)&v20->_signalEvents, a8);
    objc_storeStrong((id *)&v20->_transactionHandle, a9);
    objc_storeStrong((id *)&v20->_fwEnqueueDelay, a10);
    objc_storeStrong((id *)&v20->_memoryPoolId, a11);
  }

  return v20;
}

+ (id)chainingRequestWithInputs:(id)a3 outputSets:(id)a4 lbInputSymbolId:(id)a5 lbOutputSymbolId:(id)a6 procedureIndex:(id)a7 signalEvents:(id)a8 transactionHandle:(id)a9 fwEnqueueDelay:(id)a10 memoryPoolId:(id)a11
{
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  id v26 = a3;
  id v27 = (void *)[objc_alloc((Class)a1) initWithInputs:v26 outputs:v25 lbInputSymbolId:v24 lbOutputSymbolId:v23 procedureIndex:v22 signalEvents:v21 transactionHandle:v20 fwEnqueueDelay:v19 memoryPoolId:v18];

  return v27;
}

- (BOOL)validate
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v4 = [(_ANEChainingRequest *)self inputBuffer];
  unint64_t v5 = [v4 count];

  v6 = [(_ANEChainingRequest *)self outputSets];
  unint64_t v7 = [v6 count];

  if (v5 && v7)
  {
    if (v5 > 0xFF)
    {
      v8 = +[_ANELog common];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[_ANEChainingRequest validate]();
      }
      goto LABEL_15;
    }
    aSelector = a2;
    unsigned int v46 = v7;
    uint64_t v9 = 0;
    do
    {
      v10 = [(_ANEChainingRequest *)self inputBuffer];
      v11 = [v10 objectAtIndexedSubscript:v9];
      v12 = [v11 symbolIndex];
      unint64_t v13 = [v12 unsignedIntegerValue];

      if (v13 >= 0xFF)
      {
        v8 = +[_ANELog common];
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        v33 = NSStringFromSelector(aSelector);
        v34 = [(_ANEChainingRequest *)self inputBuffer];
        v35 = [v34 objectAtIndexedSubscript:v9];
        *(_DWORD *)buf = 138413314;
        v48 = v33;
        __int16 v49 = 1024;
        *(_DWORD *)v50 = v9;
        *(_WORD *)&v50[4] = 2112;
        *(void *)&v50[6] = v35;
        *(_WORD *)&v50[14] = 2048;
        *(void *)&v50[16] = v13;
        *(_WORD *)&v50[24] = 1024;
        *(_DWORD *)&v50[26] = 254;
        _os_log_error_impl(&dword_1DB8AB000, v8, OS_LOG_TYPE_ERROR, "%@: inputBuffer[%u]=%@ symbolIndex=%lu exceeds kANERequestMaxSymbolIndex=%d", buf, 0x2Cu);
LABEL_34:

LABEL_35:
        goto LABEL_15;
      }
      ++v9;
    }
    while (v9 < v5);
    if (v7 > 0xC)
    {
      v8 = +[_ANELog common];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[_ANEChainingRequest validate]();
      }
      goto LABEL_15;
    }
    uint64_t v15 = 0;
    while (2)
    {
      v16 = [(_ANEChainingRequest *)self outputSets];
      v17 = [v16 objectAtIndexedSubscript:v15];
      id v18 = [v17 outputBuffer];
      unint64_t v19 = [v18 count];

      if (v19)
      {
        if (v19 > 0x100)
        {
          v8 = +[_ANELog common];
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            -[_ANEChainingRequest validate].cold.5();
          }
        }
        else
        {
          uint64_t v20 = 0;
          do
          {
            id v21 = [(_ANEChainingRequest *)self outputSets];
            id v22 = [v21 objectAtIndexedSubscript:v15];

            if (!v22)
            {
              v8 = +[_ANELog common];
              if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
                [(_ANEChainingRequest *)aSelector validate];
              }
              goto LABEL_15;
            }
            id v23 = [(_ANEChainingRequest *)self outputSets];
            id v24 = [v23 objectAtIndexedSubscript:v15];
            id v25 = [v24 outputBuffer];
            id v26 = [v25 objectAtIndexedSubscript:v20];
            id v27 = [v26 symbolIndex];
            unint64_t v28 = [v27 unsignedIntegerValue];

            if (v28 >= 0xFF)
            {
              v8 = +[_ANELog common];
              if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
                goto LABEL_15;
              }
              v33 = NSStringFromSelector(aSelector);
              v34 = [(_ANEChainingRequest *)self outputSets];
              v35 = [v34 objectAtIndexedSubscript:v15];
              v36 = [v35 outputBuffer];
              v37 = [v36 objectAtIndexedSubscript:v20];
              *(_DWORD *)buf = 138413314;
              v48 = v33;
              __int16 v49 = 1024;
              *(_DWORD *)v50 = v15;
              *(_WORD *)&v50[4] = 2112;
              *(void *)&v50[6] = v37;
              *(_WORD *)&v50[14] = 2048;
              *(void *)&v50[16] = v28;
              *(_WORD *)&v50[24] = 1024;
              *(_DWORD *)&v50[26] = 254;
              _os_log_error_impl(&dword_1DB8AB000, v8, OS_LOG_TYPE_ERROR, "%@: outputIndexArray[%u]=%@ symbolIndex=%lu exceeds kANERequestMaxSymbolIndex=%d", buf, 0x2Cu);

              goto LABEL_34;
            }
            ++v20;
          }
          while (v20 < v19);
          uint64_t v15 = (v15 + 1);
          if (v15 < v46) {
            continue;
          }
          id v29 = [(_ANEChainingRequest *)self loopbackInputSymbolIndex];
          unint64_t v30 = [v29 count];

          v31 = [(_ANEChainingRequest *)self loopbackOutputSymbolIndex];
          uint64_t v32 = [v31 count];

          if (v30 != v32)
          {
            v8 = +[_ANELog framework];
            if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
              break;
            }
            v33 = [(_ANEChainingRequest *)self loopbackInputSymbolIndex];
            v34 = [(_ANEChainingRequest *)self loopbackInputSymbolIndex];
            *(_DWORD *)buf = 138413058;
            v48 = v33;
            __int16 v49 = 2112;
            *(void *)v50 = v34;
            *(_WORD *)&v50[8] = 2048;
            *(void *)&v50[10] = v30;
            *(_WORD *)&v50[18] = 2048;
            *(void *)&v50[20] = v32;
            v38 = "loopbackInputSymbolIndexCount and loopbackOutputSymbolIndexCount size mismatch. loopbackInputSymbolInd"
                  "ex = %@ : loopbackOutputSymbolIndex = %@ loopbackInputSymbolIndex.count = %lu : loopbackOutputSymbolIndex.count = %lu";
            v39 = v8;
            uint32_t v40 = 42;
            goto LABEL_42;
          }
          if (v30 >= 0x101)
          {
            v8 = +[_ANELog common];
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
              -[_ANEChainingRequest validate].cold.7();
            }
            break;
          }
          v41 = [(_ANEChainingRequest *)self procedureIndex];
          unint64_t v42 = [v41 unsignedIntegerValue];

          if (v42 >= 0x81)
          {
            v8 = +[_ANELog common];
            if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
              break;
            }
            v33 = NSStringFromSelector(aSelector);
            v34 = [(_ANEChainingRequest *)self procedureIndex];
            *(_DWORD *)buf = 138413058;
            v48 = v33;
            __int16 v49 = 2112;
            *(void *)v50 = v34;
            *(_WORD *)&v50[8] = 2048;
            *(void *)&v50[10] = v42;
            *(_WORD *)&v50[18] = 1024;
            *(_DWORD *)&v50[20] = 128;
            v38 = "%@: self.procedureIndex=%@ length=%lu exceeds kANEMaxProcedures=%d";
            v39 = v8;
            uint32_t v40 = 38;
LABEL_42:
            _os_log_error_impl(&dword_1DB8AB000, v39, OS_LOG_TYPE_ERROR, v38, buf, v40);
            goto LABEL_35;
          }
          v43 = [(_ANEChainingRequest *)self signalEvents];
          unint64_t v44 = [v43 count];

          if (v44 < 0x101) {
            return 1;
          }
          v8 = +[_ANELog common];
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            -[_ANEChainingRequest validate].cold.8();
          }
        }
      }
      else
      {
        v8 = +[_ANELog framework];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[_ANEChainingRequest validate].cold.4(v8);
        }
      }
      break;
    }
  }
  else
  {
    v8 = +[_ANELog framework];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(_ANEChainingRequest *)v5 validate];
    }
  }
LABEL_15:

  return 0;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  v6 = [(_ANEChainingRequest *)self inputBuffer];
  unint64_t v7 = [(_ANEChainingRequest *)self outputSets];
  v8 = [(_ANEChainingRequest *)self transactionHandle];
  uint64_t v9 = [(_ANEChainingRequest *)self procedureIndex];
  objc_msgSend(v3, "stringWithFormat:", @"%@: { inputBuffer=%@ ; outputSets=%@ ; transactionHandle=%@ ; procedureIndex=%@ }",
    v5,
    v6,
    v7,
    v8,
  v10 = v9);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(_ANEChainingRequest *)self inputBuffer];
  [v4 encodeObject:v5 forKey:@"inputs"];

  v6 = [(_ANEChainingRequest *)self outputSets];
  [v4 encodeObject:v6 forKey:@"outputs"];

  unint64_t v7 = [(_ANEChainingRequest *)self loopbackInputSymbolIndex];
  [v4 encodeObject:v7 forKey:@"loopbackInputs"];

  v8 = [(_ANEChainingRequest *)self loopbackOutputSymbolIndex];
  [v4 encodeObject:v8 forKey:@"loopbackOutputs"];

  uint64_t v9 = [(_ANEChainingRequest *)self procedureIndex];
  [v4 encodeObject:v9 forKey:@"procedureIndex"];

  v10 = [(_ANEChainingRequest *)self signalEvents];
  [v4 encodeObject:v10 forKey:@"signalEvents"];

  v11 = [(_ANEChainingRequest *)self transactionHandle];
  [v4 encodeObject:v11 forKey:@"transactionHandle"];

  v12 = [(_ANEChainingRequest *)self fwEnqueueDelay];
  [v4 encodeObject:v12 forKey:@"fwEnqueueDelay"];

  id v13 = [(_ANEChainingRequest *)self memoryPoolId];
  [v4 encodeObject:v13 forKey:@"memoryPoolId"];
}

- (_ANEChainingRequest)initWithCoder:(id)a3
{
  v19[6] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v19[2] = objc_opt_class();
  v19[3] = objc_opt_class();
  v19[4] = objc_opt_class();
  v19[5] = objc_opt_class();
  unint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:6];
  v6 = [v3 setWithArray:v5];

  v16 = [v4 decodeObjectOfClasses:v6 forKey:@"inputs"];
  unint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"outputs"];
  v8 = [v4 decodeObjectOfClasses:v6 forKey:@"loopbackInputs"];
  uint64_t v9 = [v4 decodeObjectOfClasses:v6 forKey:@"loopbackOutputs"];
  v10 = [v4 decodeObjectOfClasses:v6 forKey:@"signalEvents"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"procedureIndex"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionHandle"];
  id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fwEnqueueDelay"];
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"memoryPoolId"];

  id v18 = [(_ANEChainingRequest *)self initWithInputs:v16 outputs:v7 lbInputSymbolId:v8 lbOutputSymbolId:v9 procedureIndex:v11 signalEvents:v10 transactionHandle:v12 fwEnqueueDelay:v13 memoryPoolId:v14];
  return v18;
}

- (NSArray)inputBuffer
{
  return self->_inputBuffer;
}

- (NSArray)outputSets
{
  return self->_outputSets;
}

- (NSArray)loopbackInputSymbolIndex
{
  return self->_loopbackInputSymbolIndex;
}

- (NSArray)loopbackOutputSymbolIndex
{
  return self->_loopbackOutputSymbolIndex;
}

- (NSArray)signalEvents
{
  return self->_signalEvents;
}

- (NSNumber)transactionHandle
{
  return self->_transactionHandle;
}

- (NSNumber)procedureIndex
{
  return self->_procedureIndex;
}

- (NSNumber)fwEnqueueDelay
{
  return self->_fwEnqueueDelay;
}

- (NSNumber)memoryPoolId
{
  return self->_memoryPoolId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryPoolId, 0);
  objc_storeStrong((id *)&self->_fwEnqueueDelay, 0);
  objc_storeStrong((id *)&self->_procedureIndex, 0);
  objc_storeStrong((id *)&self->_transactionHandle, 0);
  objc_storeStrong((id *)&self->_signalEvents, 0);
  objc_storeStrong((id *)&self->_loopbackOutputSymbolIndex, 0);
  objc_storeStrong((id *)&self->_loopbackInputSymbolIndex, 0);
  objc_storeStrong((id *)&self->_outputSets, 0);
  objc_storeStrong((id *)&self->_inputBuffer, 0);
}

- (void)validate
{
  OUTLINED_FUNCTION_2();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_1DB8AB000, v2, v3, "%@: SignalEvents[%lu] count exceeds kANEMaxEvents=%d", v4, v5, v6, v7, v8);
}

@end