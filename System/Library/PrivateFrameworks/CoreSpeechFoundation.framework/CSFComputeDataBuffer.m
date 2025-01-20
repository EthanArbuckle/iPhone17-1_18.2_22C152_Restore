@interface CSFComputeDataBuffer
- (CSFComputeDataBuffer)initWithInputArray:(id)a3 name:(id)a4 properties:(id)a5 errOut:(id *)a6;
- (CSFComputeDataBuffer)initWithProperties:(id)a3 name:(id)a4 errOut:(id *)a5;
- (CSFTensorProperties)tensorProperties;
- (NSData)data;
- (NSString)tensorName;
- (id)_allocateDataWithTensorProperties:(id)a3 error:(id *)a4;
- (id)convertDataToArray;
- (id)description;
- (unint64_t)_getTensorSizeWithProperties:(id)a3;
- (unint64_t)elementSize;
- (void)getWritableDataPtr;
- (void)setTensorName:(id)a3;
@end

@implementation CSFComputeDataBuffer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_tensorName, 0);
  objc_storeStrong((id *)&self->_tensorProperties, 0);
}

- (unint64_t)elementSize
{
  return self->_elementSize;
}

- (NSData)data
{
  return self->_data;
}

- (void)setTensorName:(id)a3
{
}

- (NSString)tensorName
{
  return self->_tensorName;
}

- (CSFTensorProperties)tensorProperties
{
  return self->_tensorProperties;
}

- (id)_allocateDataWithTensorProperties:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [(CSFComputeDataBuffer *)self _getTensorSizeWithProperties:v6];
  self->_elementSize = v7;
  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:self->_elementSize];
  }
  else
  {
    if (a4)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v15 = *MEMORY[0x1E4F28568];
      v10 = NSString;
      v11 = [(CSFTensorProperties *)self->_tensorProperties description];
      v12 = [v10 stringWithFormat:@"cannot get element size with property: %@", v11];
      v16[0] = v12;
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      *a4 = (id)[v9 initWithDomain:@"com.apple.corespeech" code:2458 userInfo:v13];
    }
    v8 = 0;
  }

  return v8;
}

- (unint64_t)_getTensorSizeWithProperties:(id)a3
{
  id v3 = a3;
  v4 = [v3 shape];
  v5 = v4;
  unint64_t v6 = 0;
  if (v3)
  {
    if (v4)
    {
      unint64_t v6 = 0;
      if ([v4 count])
      {
        uint64_t v7 = 1;
        while (v6 < [v5 count])
        {
          v8 = [v5 objectAtIndexedSubscript:v6];
          v7 *= (int)[v8 intValue];

          ++v6;
        }
        if ([v3 dataType] && objc_msgSend(v3, "dataType") != 1) {
          uint64_t v9 = 0;
        }
        else {
          uint64_t v9 = 4;
        }
        unint64_t v6 = v9 * v7;
      }
    }
  }

  return v6;
}

- (id)description
{
  v2 = NSString;
  tensorName = self->_tensorName;
  v4 = [(CSFTensorProperties *)self->_tensorProperties description];
  v5 = [v2 stringWithFormat:@"<Name:%@ Properties: %@>", tensorName, v4];

  return v5;
}

- (id)convertDataToArray
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  p_tensorProperties = &self->_tensorProperties;
  v4 = [(CSFTensorProperties *)self->_tensorProperties shape];
  uint64_t v5 = [(CSFTensorProperties *)*p_tensorProperties dataType];
  if ((unint64_t)[v4 count] > 2 || !objc_msgSend(v4, "count"))
  {
    v16 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v40 = "-[CSFComputeDataBuffer convertDataToArray]";
      v19 = "%s rank > 2 or == 0 is not supported";
      goto LABEL_38;
    }
LABEL_13:
    id v17 = 0;
    goto LABEL_14;
  }
  if (!self->_data)
  {
    v16 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v40 = "-[CSFComputeDataBuffer convertDataToArray]";
      v19 = "%s data is empty, Cannot convert ComputeData buffer to NSArray";
LABEL_38:
      _os_log_error_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  unint64_t v6 = 0x1E4F1C000uLL;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v8 = [(NSData *)self->_data bytes];
  uint64_t v9 = [(NSData *)self->_data bytes];
  if ([v4 count] == 1)
  {
    for (unint64_t i = 0; ; ++i)
    {
      v11 = [v4 firstObject];
      unint64_t v12 = [v11 unsignedLongValue];

      if (i >= v12) {
        break;
      }
      unint64_t elementSize = self->_elementSize;
      if (i >= elementSize)
      {
        v34 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v40 = "-[CSFComputeDataBuffer convertDataToArray]";
          __int16 v41 = 2048;
          unint64_t v42 = i;
          __int16 v43 = 2048;
          unint64_t v44 = elementSize;
          _os_log_error_impl(&dword_1BA1A5000, v34, OS_LOG_TYPE_ERROR, "%s index: %lu out of bound: %lu", buf, 0x20u);
        }
        goto LABEL_35;
      }
      if (v5)
      {
        LODWORD(v13) = v8[i];
        [NSNumber numberWithFloat:v13];
      }
      else
      {
        [NSNumber numberWithInt:v9[i]];
      uint64_t v15 = };
      [v7 addObject:v15];
    }
  }
  else
  {
    v36 = v9;
    v37 = v7;
    uint64_t v20 = 0;
    unint64_t v38 = 0;
    v35 = v8;
LABEL_20:
    v21 = [v4 firstObject];
    unint64_t v22 = [v21 unsignedLongValue];

    if (v38 < v22)
    {
      id v23 = objc_alloc_init(*(Class *)(v6 + 2632));
      unint64_t v24 = 0;
      v25 = (char *)&v8[v20];
      while (1)
      {
        v26 = [v4 objectAtIndexedSubscript:1];
        unint64_t v27 = [v26 unsignedLongValue];
        unint64_t v28 = v20 + v24;

        if (v24 >= v27)
        {
          v32 = (void *)[v23 copy];
          id v7 = v37;
          [v37 addObject:v32];
          v8 = v35;
          unint64_t v6 = 0x1E4F1C000;

          ++v38;
          uint64_t v20 = v28;
          goto LABEL_20;
        }
        unint64_t v30 = self->_elementSize;
        if (v28 >= v30) {
          break;
        }
        if (v5)
        {
          LODWORD(v29) = *(_DWORD *)&v25[4 * v24];
          [NSNumber numberWithFloat:v29];
        }
        else
        {
          [NSNumber numberWithInt:v36[v20 + v24]];
        v31 = };
        [v23 addObject:v31];

        ++v24;
      }
      v33 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v40 = "-[CSFComputeDataBuffer convertDataToArray]";
        __int16 v41 = 2048;
        unint64_t v42 = v20 + v24;
        __int16 v43 = 2048;
        unint64_t v44 = v30;
        _os_log_error_impl(&dword_1BA1A5000, v33, OS_LOG_TYPE_ERROR, "%s index: %lu out of bound: %lu", buf, 0x20u);
      }

      id v7 = v37;
LABEL_35:
      id v17 = 0;
      goto LABEL_36;
    }
  }
  id v17 = v7;
LABEL_36:

LABEL_14:
  return v17;
}

- (void)getWritableDataPtr
{
  return (void *)[(NSData *)self->_data bytes];
}

- (CSFComputeDataBuffer)initWithInputArray:(id)a3 name:(id)a4 properties:(id)a5 errOut:(id *)a6
{
  v67[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v54 = a4;
  id v53 = a5;
  v57.receiver = self;
  v57.super_class = (Class)CSFComputeDataBuffer;
  v11 = [(CSFComputeDataBuffer *)&v57 init];
  if (!v11) {
    goto LABEL_36;
  }
  if (!v10 || (uint64_t v12 = [v10 count], !v54) || !v12)
  {
    if (a6)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v66 = *MEMORY[0x1E4F28568];
      v19 = [NSString stringWithFormat:@"initialize with inputArray: %@", v10];
      v67[0] = v19;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:&v66 count:1];
      *a6 = (id)[v18 initWithDomain:@"com.apple.corespeech" code:2458 userInfo:v20];
    }
    goto LABEL_15;
  }
  uint64_t v13 = +[CSFModelComputeBackendUtils getRankOfTensor:v10];
  if (v13 < 1
    || ([v53 shape],
        v14 = objc_claimAutoreleasedReturnValue(),
        BOOL v15 = v13 == [v14 count],
        v14,
        !v15))
  {
    if (a6)
    {
      id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v64 = *MEMORY[0x1E4F28568];
      unint64_t v22 = [NSString stringWithFormat:@"initialize with inputArray: %@", v10];
      v65 = v22;
      id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
      *a6 = (id)[v21 initWithDomain:@"com.apple.corespeech" code:2458 userInfo:v23];
    }
    goto LABEL_15;
  }
  id v56 = 0;
  v51 = [(CSFComputeDataBuffer *)v11 _allocateDataWithTensorProperties:v53 error:&v56];
  id v16 = v56;
  if (!v16)
  {
    v50 = [v53 shape];
    uint64_t v25 = [v53 dataType];
    if ([v50 count] == 1)
    {
      uint64_t v26 = 0;
      for (unint64_t i = 0; i < [v10 count]; ++i)
      {
        if (v25 == 1)
        {
          int v55 = 0;
          unint64_t v30 = [v10 objectAtIndexedSubscript:i];
          [v30 floatValue];
          int v32 = v31;

          int v55 = v32;
          -[NSData replaceBytesInRange:withBytes:](v51, "replaceBytesInRange:withBytes:", v26, 4, &v55);
        }
        else
        {
          if (v25)
          {
            if (!a6) {
              goto LABEL_47;
            }
            id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v62 = *MEMORY[0x1E4F28568];
            v52 = [NSString stringWithFormat:@"Compute data type not supported"];
            v63 = v52;
            unint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
            id v45 = (id)[v48 initWithDomain:@"com.apple.corespeech" code:2458 userInfo:v44];
            goto LABEL_44;
          }
          int v55 = 0;
          unint64_t v28 = [v10 objectAtIndexedSubscript:i];
          int v29 = [v28 intValue];

          int v55 = v29;
          -[NSData replaceBytesInRange:withBytes:](v51, "replaceBytesInRange:withBytes:", v26, 4, &v55);
        }
        v26 += 4;
      }
    }
    else
    {
      if ([v50 count] != 2)
      {
        if (a6)
        {
          id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v58 = *MEMORY[0x1E4F28568];
          v52 = [NSString stringWithFormat:@"Rank > 0 not supported"];
          v59 = v52;
          unint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
          id v45 = (id)[v43 initWithDomain:@"com.apple.corespeech" code:2458 userInfo:v44];
LABEL_44:
          *a6 = v45;
LABEL_45:

LABEL_46:
        }
LABEL_47:

        goto LABEL_15;
      }
      uint64_t v33 = 0;
      unint64_t v49 = 0;
LABEL_26:
      if (v49 < [v10 count])
      {
        v52 = objc_msgSend(v10, "objectAtIndexedSubscript:");
        for (unint64_t j = 0; ; ++j)
        {
          if (j >= [v52 count])
          {

            ++v49;
            goto LABEL_26;
          }
          if (v25 == 1)
          {
            int v55 = 0;
            v37 = [v52 objectAtIndexedSubscript:j];
            [v37 floatValue];
            int v39 = v38;

            int v55 = v39;
            -[NSData replaceBytesInRange:withBytes:](v51, "replaceBytesInRange:withBytes:", v33, 4, &v55);
          }
          else
          {
            if (v25)
            {
              if (a6)
              {
                id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v60 = *MEMORY[0x1E4F28568];
                unint64_t v44 = [NSString stringWithFormat:@"Compute data type not supported"];
                v61 = v44;
                v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
                *a6 = (id)[v46 initWithDomain:@"com.apple.corespeech" code:2458 userInfo:v47];

                goto LABEL_45;
              }
              goto LABEL_46;
            }
            int v55 = 0;
            v35 = [v52 objectAtIndexedSubscript:j];
            int v36 = [v35 intValue];

            int v55 = v36;
            -[NSData replaceBytesInRange:withBytes:](v51, "replaceBytesInRange:withBytes:", v33, 4, &v55);
          }
          v33 += 4;
        }
      }
    }
    objc_storeStrong((id *)&v11->_tensorProperties, a5);
    data = v11->_data;
    v11->_data = v51;
    __int16 v41 = v51;

    objc_storeStrong((id *)&v11->_tensorName, a4);
LABEL_36:
    unint64_t v24 = v11;
    goto LABEL_37;
  }
  id v17 = v16;
  if (a6) {
    *a6 = v16;
  }

LABEL_15:
  unint64_t v24 = 0;
LABEL_37:

  return v24;
}

- (CSFComputeDataBuffer)initWithProperties:(id)a3 name:(id)a4 errOut:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CSFComputeDataBuffer;
  v11 = [(CSFComputeDataBuffer *)&v21 init];
  uint64_t v12 = v11;
  if (!v11) {
    goto LABEL_7;
  }
  id v20 = 0;
  uint64_t v13 = [(CSFComputeDataBuffer *)v11 _allocateDataWithTensorProperties:v9 error:&v20];
  id v14 = v20;
  if (!v14)
  {
    objc_storeStrong((id *)&v12->_tensorProperties, a3);
    data = v12->_data;
    v12->_data = v13;
    id v18 = v13;

    objc_storeStrong((id *)&v12->_tensorName, a4);
LABEL_7:
    id v16 = v12;
    goto LABEL_8;
  }
  BOOL v15 = v14;
  if (a5) {
    *a5 = v14;
  }

  id v16 = 0;
LABEL_8:

  return v16;
}

@end