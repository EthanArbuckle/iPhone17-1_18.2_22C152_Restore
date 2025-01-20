@interface _ANERequest
+ (id)requestWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 perfStats:(id)a7 procedureIndex:(id)a8;
+ (id)requestWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 procedureIndex:(id)a7;
+ (id)requestWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 weightsBuffer:(id)a7 perfStats:(id)a8 procedureIndex:(id)a9;
+ (id)requestWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 weightsBuffer:(id)a7 perfStats:(id)a8 procedureIndex:(id)a9 sharedEvents:(id)a10;
+ (id)requestWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 weightsBuffer:(id)a7 perfStats:(id)a8 procedureIndex:(id)a9 sharedEvents:(id)a10 transactionHandle:(id)a11;
+ (id)requestWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 weightsBuffer:(id)a7 procedureIndex:(id)a8;
- (BOOL)validate;
- (NSArray)inputArray;
- (NSArray)inputIndexArray;
- (NSArray)outputArray;
- (NSArray)outputIndexArray;
- (NSArray)perfStatsArray;
- (NSNumber)procedureIndex;
- (NSNumber)transactionHandle;
- (_ANEIOSurfaceObject)weightsBuffer;
- (_ANEPerformanceStats)perfStats;
- (_ANERequest)initWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 weightsBuffer:(id)a7 perfStats:(id)a8 procedureIndex:(id)a9 sharedEvents:(id)a10 transactionHandle:(id)a11;
- (_ANERequest)initWithVirtualModel:(void *)a3;
- (_ANESharedEvents)sharedEvents;
- (id)completionHandler;
- (id)description;
- (unint64_t)ioSurfacesCount;
- (void)setCompletionHandler:(id)a3;
- (void)setPerfStats:(id)a3;
- (void)setSharedEvents:(id)a3;
- (void)setTransactionHandle:(id)a3;
- (void)validate;
@end

@implementation _ANERequest

- (_ANERequest)initWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 weightsBuffer:(id)a7 perfStats:(id)a8 procedureIndex:(id)a9 sharedEvents:(id)a10 transactionHandle:(id)a11
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
  v30.super_class = (Class)_ANERequest;
  v19 = [(_ANERequest *)&v30 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_inputArray, a3);
    objc_storeStrong((id *)&v20->_inputIndexArray, a4);
    objc_storeStrong((id *)&v20->_outputArray, a5);
    objc_storeStrong((id *)&v20->_outputIndexArray, a6);
    objc_storeStrong((id *)&v20->_weightsBuffer, a7);
    objc_storeStrong((id *)&v20->_perfStatsArray, a8);
    objc_storeStrong((id *)&v20->_procedureIndex, a9);
    objc_storeStrong((id *)&v20->_sharedEvents, a10);
    objc_storeStrong((id *)&v20->_transactionHandle, a11);
  }

  return v20;
}

- (_ANERequest)initWithVirtualModel:(void *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_ANERequest;
  return [(_ANERequest *)&v4 init];
}

+ (id)requestWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 weightsBuffer:(id)a7 procedureIndex:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = (void *)[objc_alloc((Class)a1) initWithInputs:v19 inputIndices:v18 outputs:v17 outputIndices:v16 weightsBuffer:v15 perfStats:0 procedureIndex:v14 sharedEvents:0 transactionHandle:0];

  return v20;
}

+ (id)requestWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 procedureIndex:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = (void *)[objc_alloc((Class)a1) initWithInputs:v16 inputIndices:v15 outputs:v14 outputIndices:v13 weightsBuffer:0 perfStats:0 procedureIndex:v12 sharedEvents:0 transactionHandle:0];

  return v17;
}

+ (id)requestWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 perfStats:(id)a7 procedureIndex:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = (void *)[objc_alloc((Class)a1) initWithInputs:v19 inputIndices:v18 outputs:v17 outputIndices:v16 weightsBuffer:0 perfStats:v15 procedureIndex:v14 sharedEvents:0 transactionHandle:0];

  return v20;
}

+ (id)requestWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 weightsBuffer:(id)a7 perfStats:(id)a8 procedureIndex:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = (void *)[objc_alloc((Class)a1) initWithInputs:v22 inputIndices:v21 outputs:v20 outputIndices:v19 weightsBuffer:v18 perfStats:v17 procedureIndex:v16 sharedEvents:0 transactionHandle:0];

  return v23;
}

+ (id)requestWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 weightsBuffer:(id)a7 perfStats:(id)a8 procedureIndex:(id)a9 sharedEvents:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v25 = (void *)[objc_alloc((Class)a1) initWithInputs:v24 inputIndices:v23 outputs:v22 outputIndices:v21 weightsBuffer:v20 perfStats:v19 procedureIndex:v18 sharedEvents:v17 transactionHandle:0];

  return v25;
}

+ (id)requestWithInputs:(id)a3 inputIndices:(id)a4 outputs:(id)a5 outputIndices:(id)a6 weightsBuffer:(id)a7 perfStats:(id)a8 procedureIndex:(id)a9 sharedEvents:(id)a10 transactionHandle:(id)a11
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
  id v27 = (void *)[objc_alloc((Class)a1) initWithInputs:v26 inputIndices:v25 outputs:v24 outputIndices:v23 weightsBuffer:v22 perfStats:v21 procedureIndex:v20 sharedEvents:v19 transactionHandle:v18];

  return v27;
}

- (BOOL)validate
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [(_ANERequest *)self inputArray];
  unint64_t v5 = [v4 count];

  v6 = [(_ANERequest *)self outputArray];
  unint64_t v7 = [v6 count];

  if (!v5 || !v7)
  {
    id v22 = +[_ANELog framework];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[_ANERequest validate]();
    }
    goto LABEL_36;
  }
  v8 = [(_ANERequest *)self inputIndexArray];
  uint64_t v9 = [v8 count];

  v10 = [(_ANERequest *)self outputIndexArray];
  uint64_t v11 = [v10 count];

  if (!v9 || !v11)
  {
    id v22 = +[_ANELog framework];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[_ANERequest validate]();
    }
    goto LABEL_36;
  }
  if (v5 > 0xFF || v7 >= 0x100)
  {
    id v22 = +[_ANELog common];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      v65 = v23;
      __int16 v66 = 2048;
      *(void *)v67 = v5;
      *(_WORD *)&v67[8] = 2048;
      *(void *)&v67[10] = v7;
      *(_WORD *)&v67[18] = 1024;
      *(_DWORD *)&v67[20] = 255;
      id v28 = "%@: Either inputArray[%lu] or outputArray[%lu] count is greater than kANEMaxBuffers=%d";
LABEL_24:
      _os_log_error_impl(&dword_1DB8AB000, v22, OS_LOG_TYPE_ERROR, v28, buf, 0x26u);
      goto LABEL_32;
    }
  }
  else if (v5 == v9)
  {
    if (v7 == v11)
    {
      uint64_t v12 = 0;
      while (1)
      {
        id v13 = [(_ANERequest *)self inputIndexArray];
        id v14 = [v13 objectAtIndexedSubscript:v12];
        unint64_t v15 = [v14 unsignedIntegerValue];

        if (v15 >= 0xFF) {
          break;
        }
        if (v5 <= ++v12)
        {
          uint64_t v16 = 0;
          do
          {
            id v17 = [(_ANERequest *)self outputIndexArray];
            id v18 = [v17 objectAtIndexedSubscript:v16];
            unint64_t v19 = [v18 unsignedIntegerValue];

            if (v19 >= 0xFF)
            {
              id v22 = +[_ANELog common];
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
                goto LABEL_36;
              }
              id v23 = NSStringFromSelector(a2);
              id v24 = [(_ANERequest *)self outputIndexArray];
              id v29 = [v24 objectAtIndexedSubscript:v16];
              *(_DWORD *)buf = 138413314;
              v65 = v23;
              __int16 v66 = 1024;
              *(_DWORD *)v67 = v16;
              *(_WORD *)&v67[4] = 2112;
              *(void *)&v67[6] = v29;
              *(_WORD *)&v67[14] = 2048;
              *(void *)&v67[16] = v19;
              *(_WORD *)&v67[24] = 1024;
              *(_DWORD *)&v67[26] = 254;
              objc_super v30 = "%@: outputIndexArray[%u]=%@ length=%lu exceeds kANERequestMaxSymbolIndex=%d";
              goto LABEL_65;
            }
            ++v16;
          }
          while (v7 > v16);
          id v20 = [(_ANERequest *)self procedureIndex];
          unint64_t v21 = [v20 unsignedIntegerValue];

          if (v21 >= 0x81)
          {
            id v22 = +[_ANELog common];
            if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              goto LABEL_36;
            }
            id v23 = NSStringFromSelector(a2);
            id v24 = [(_ANERequest *)self procedureIndex];
            *(_DWORD *)buf = 138413058;
            v65 = v23;
            __int16 v66 = 2112;
            *(void *)v67 = v24;
            *(_WORD *)&v67[8] = 2048;
            *(void *)&v67[10] = v21;
            *(_WORD *)&v67[18] = 1024;
            *(_DWORD *)&v67[20] = 128;
            id v25 = "%@: self.procedureIndex=%@ length=%lu exceeds kANEMaxProcedures=%d";
            id v26 = v22;
            uint32_t v27 = 38;
            goto LABEL_30;
          }
          v32 = [(_ANERequest *)self perfStatsArray];
          uint64_t v33 = [v32 count];

          if (v33)
          {
            id v22 = [MEMORY[0x1E4F1CC08] mutableCopy];
            for (uint64_t i = 0; i != v33; ++i)
            {
              v35 = [(_ANERequest *)self perfStatsArray];
              v36 = [v35 objectAtIndexedSubscript:i];
              unint64_t v37 = [v36 statType];

              if (v37 >= 3)
              {
                v56 = +[_ANELog common];
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                {
                  v58 = NSStringFromSelector(a2);
                  *(_DWORD *)buf = 138413314;
                  v65 = v58;
                  __int16 v66 = 2048;
                  *(void *)v67 = i;
                  *(_WORD *)&v67[8] = 2048;
                  *(void *)&v67[10] = v37;
                  *(_WORD *)&v67[18] = 2048;
                  *(void *)&v67[20] = 0;
                  *(_WORD *)&v67[28] = 2048;
                  uint64_t v68 = 2;
                  _os_log_error_impl(&dword_1DB8AB000, v56, OS_LOG_TYPE_ERROR, "%@: self.perfStatsArray[%lu].statType=%ld is invalid. Expected: (%ld - %ld)", buf, 0x34u);
                }
                goto LABEL_36;
              }
              v38 = [NSNumber numberWithInteger:v37];
              v39 = [v22 objectForKey:v38];

              v40 = [NSNumber numberWithInteger:v37];
              if (v39)
              {
                v41 = [v22 objectForKeyedSubscript:v40];
                uint64_t v42 = [v41 longValue];

                v40 = [NSNumber numberWithLong:v42 + 1];
                v43 = [NSNumber numberWithInteger:v37];
                [v22 setObject:v40 forKeyedSubscript:v43];
              }
              else
              {
                [v22 setObject:&unk_1F35EC128 forKey:v40];
              }
            }
            long long v61 = 0u;
            long long v62 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            id v22 = v22;
            uint64_t v44 = [v22 countByEnumeratingWithState:&v59 objects:v63 count:16];
            if (v44)
            {
              uint64_t v45 = v44;
              uint64_t v46 = *(void *)v60;
              while (2)
              {
                for (uint64_t j = 0; j != v45; ++j)
                {
                  if (*(void *)v60 != v46) {
                    objc_enumerationMutation(v22);
                  }
                  v48 = *(void **)(*((void *)&v59 + 1) + 8 * j);
                  v49 = -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v48, (void)v59);
                  if ([v49 longValue] >= 2)
                  {
                    v57 = +[_ANELog common];
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
                      [(_ANERequest *)a2 validate];
                    }

                    goto LABEL_36;
                  }
                }
                uint64_t v45 = [v22 countByEnumeratingWithState:&v59 objects:v63 count:16];
                if (v45) {
                  continue;
                }
                break;
              }
            }
          }
          v50 = [(_ANERequest *)self sharedEvents];
          v51 = [v50 signalEvents];
          unint64_t v52 = [v51 count];

          v53 = [(_ANERequest *)self sharedEvents];
          v54 = [v53 waitEvents];
          unint64_t v55 = [v54 count];

          if (v52 <= 0x40 && v55 < 0x41) {
            return 1;
          }
          id v22 = +[_ANELog common];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            id v23 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138413058;
            v65 = v23;
            __int16 v66 = 2048;
            *(void *)v67 = v52;
            *(_WORD *)&v67[8] = 2048;
            *(void *)&v67[10] = v55;
            *(_WORD *)&v67[18] = 1024;
            *(_DWORD *)&v67[20] = 64;
            id v28 = "%@: Either signalEvents[%lu] or waitEvents[%lu] count exceeds kANEMaxEvents=%d";
            goto LABEL_24;
          }
          goto LABEL_36;
        }
      }
      id v22 = +[_ANELog common];
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      id v23 = NSStringFromSelector(a2);
      id v24 = [(_ANERequest *)self inputIndexArray];
      id v29 = [v24 objectAtIndexedSubscript:v12];
      *(_DWORD *)buf = 138413314;
      v65 = v23;
      __int16 v66 = 1024;
      *(_DWORD *)v67 = v12;
      *(_WORD *)&v67[4] = 2112;
      *(void *)&v67[6] = v29;
      *(_WORD *)&v67[14] = 2048;
      *(void *)&v67[16] = v15;
      *(_WORD *)&v67[24] = 1024;
      *(_DWORD *)&v67[26] = 254;
      objc_super v30 = "%@: inputIndexArray[%u]=%@ length=%lu exceeds kANERequestMaxSymbolIndex=%d";
LABEL_65:
      _os_log_error_impl(&dword_1DB8AB000, v22, OS_LOG_TYPE_ERROR, v30, buf, 0x2Cu);

      goto LABEL_31;
    }
    id v22 = +[_ANELog framework];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = [(_ANERequest *)self outputArray];
      id v24 = [(_ANERequest *)self outputIndexArray];
      *(_DWORD *)buf = 138413058;
      v65 = v23;
      __int16 v66 = 2112;
      *(void *)v67 = v24;
      *(_WORD *)&v67[8] = 2048;
      *(void *)&v67[10] = v7;
      *(_WORD *)&v67[18] = 2048;
      *(void *)&v67[20] = v11;
      id v25 = "outputArray and outputIndexArray size mismatch. outputArray = %@ : outputIndexArray = %@ outputArray.count ="
            " %lu : outputIndexArray.count = %lu";
LABEL_29:
      id v26 = v22;
      uint32_t v27 = 42;
LABEL_30:
      _os_log_error_impl(&dword_1DB8AB000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
LABEL_31:

LABEL_32:
    }
  }
  else
  {
    id v22 = +[_ANELog framework];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = [(_ANERequest *)self inputArray];
      id v24 = [(_ANERequest *)self inputIndexArray];
      *(_DWORD *)buf = 138413058;
      v65 = v23;
      __int16 v66 = 2112;
      *(void *)v67 = v24;
      *(_WORD *)&v67[8] = 2048;
      *(void *)&v67[10] = v5;
      *(_WORD *)&v67[18] = 2048;
      *(void *)&v67[20] = v9;
      id v25 = "inputArray and inputIndexArray size mismatch. inputArray = %@ : inputIndexArray = %@ inputArray.count = %lu "
            ": inputIndexArray.count = %lu";
      goto LABEL_29;
    }
  }
LABEL_36:

  return 0;
}

- (unint64_t)ioSurfacesCount
{
  v3 = [(_ANERequest *)self inputIndexArray];
  uint64_t v4 = [v3 count];
  unint64_t v5 = [(_ANERequest *)self outputIndexArray];
  unint64_t v6 = [v5 count] + v4;
  unint64_t v7 = [(_ANERequest *)self weightsBuffer];
  if (v7) {
    unint64_t v8 = v6 + 1;
  }
  else {
    unint64_t v8 = v6;
  }

  return v8;
}

- (id)description
{
  uint64_t v16 = NSString;
  v3 = (objc_class *)objc_opt_class();
  unint64_t v15 = NSStringFromClass(v3);
  uint64_t v4 = [(_ANERequest *)self inputArray];
  unint64_t v5 = [(_ANERequest *)self inputIndexArray];
  unint64_t v6 = [(_ANERequest *)self outputArray];
  unint64_t v7 = [(_ANERequest *)self outputIndexArray];
  unint64_t v8 = [(_ANERequest *)self weightsBuffer];
  uint64_t v9 = [(_ANERequest *)self procedureIndex];
  v10 = [(_ANERequest *)self perfStatsArray];
  uint64_t v11 = [(_ANERequest *)self sharedEvents];
  uint64_t v12 = [(_ANERequest *)self transactionHandle];
  objc_msgSend(v16, "stringWithFormat:", @"%@: { inputArray=%@ ; inputIndexArray=%@ ; outputArray=%@ ; outputIndexArray=%@ ; weightsBuffer=%@ ; procedureIndex=%@ ; perfStatsArray=%@ ; sharedEvents=%@ ; transactionHandle=%@}",
    v15,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
  id v13 = v12);

  return v13;
}

- (NSArray)inputArray
{
  return self->_inputArray;
}

- (NSArray)inputIndexArray
{
  return self->_inputIndexArray;
}

- (NSArray)outputArray
{
  return self->_outputArray;
}

- (NSArray)outputIndexArray
{
  return self->_outputIndexArray;
}

- (_ANEIOSurfaceObject)weightsBuffer
{
  return self->_weightsBuffer;
}

- (_ANESharedEvents)sharedEvents
{
  return self->_sharedEvents;
}

- (void)setSharedEvents:(id)a3
{
}

- (NSNumber)transactionHandle
{
  return self->_transactionHandle;
}

- (void)setTransactionHandle:(id)a3
{
}

- (NSNumber)procedureIndex
{
  return self->_procedureIndex;
}

- (_ANEPerformanceStats)perfStats
{
  return self->_perfStats;
}

- (void)setPerfStats:(id)a3
{
}

- (NSArray)perfStatsArray
{
  return self->_perfStatsArray;
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_perfStatsArray, 0);
  objc_storeStrong((id *)&self->_perfStats, 0);
  objc_storeStrong((id *)&self->_procedureIndex, 0);
  objc_storeStrong((id *)&self->_transactionHandle, 0);
  objc_storeStrong((id *)&self->_sharedEvents, 0);
  objc_storeStrong((id *)&self->_weightsBuffer, 0);
  objc_storeStrong((id *)&self->_outputIndexArray, 0);
  objc_storeStrong((id *)&self->_outputArray, 0);
  objc_storeStrong((id *)&self->_inputIndexArray, 0);
  objc_storeStrong((id *)&self->_inputArray, 0);
}

- (void)validate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = NSStringFromSelector(a1);
  int v6 = 138412546;
  unint64_t v7 = v5;
  __int16 v8 = 2048;
  uint64_t v9 = [a2 longValue];
  _os_log_error_impl(&dword_1DB8AB000, a3, OS_LOG_TYPE_ERROR, "%@: Multiple _ANEPerformanceStatsIOSurface of type %ld, only pne _ANEPerformanceStatsIOSurface of each type expected", (uint8_t *)&v6, 0x16u);
}

@end