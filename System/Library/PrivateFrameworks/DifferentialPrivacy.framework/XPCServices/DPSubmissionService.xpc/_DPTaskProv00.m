@interface _DPTaskProv00
- (_DPTaskProv00)initWithDonation:(id)a3 leaderURL:(id)a4 helperURL:(id)a5 error:(id *)a6;
- (id)encodedQueryConfig;
- (id)encodedTaskConfigWithError:(id *)a3;
- (id)encodedVDAFConfig;
@end

@implementation _DPTaskProv00

- (_DPTaskProv00)initWithDonation:(id)a3 leaderURL:(id)a4 helperURL:(id)a5 error:(id *)a6
{
  v12.receiver = self;
  v12.super_class = (Class)_DPTaskProv00;
  v7 = -[_DPTaskProv initWithDonation:leaderURL:helperURL:error:](&v12, "initWithDonation:leaderURL:helperURL:error:", a3, a4, a5);
  v8 = v7;
  if (v7 && [(_DPTaskProv *)v7 vdafType] != -65536)
  {
    v10 = +[_DPDediscoError errorWithCode:700 description:@"TaskProv00 cannot handle any VDAF other than Prio2."];
    [v10 logAndStoreInError:a6];

    v9 = 0;
  }
  else
  {
    v9 = v8;
  }

  return v9;
}

- (id)encodedTaskConfigWithError:(id *)a3
{
  v5 = [(_DPTaskProv *)self encodedTaskConfig];

  if (v5)
  {
    v6 = [(_DPTaskProv *)self encodedTaskConfig];
  }
  else
  {
    id v7 = objc_alloc_init((Class)_DPBigEndianDataEncoder);
    v8 = [(_DPTaskProv *)self taskInfo];
    id v9 = [v8 length];

    if ((unint64_t)v9 < 0x100)
    {
      v11 = [(_DPTaskProv *)self taskInfo];
      objc_msgSend(v7, "writeUChar:", objc_msgSend(v11, "length"));

      objc_super v12 = [(_DPTaskProv *)self taskInfo];
      [v7 appendData:v12];

      id v13 = objc_alloc_init((Class)_DPBigEndianDataEncoder);
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v14 = [(_DPTaskProv *)self leaderURL];
      v34[0] = v14;
      v15 = [(_DPTaskProv *)self helperURL];
      v34[1] = v15;
      v16 = +[NSArray arrayWithObjects:v34 count:2];

      id v17 = [v16 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v31;
        while (2)
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v31 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if ((unint64_t)[v21 length] >> 16)
            {
              v10 = +[_DPDediscoError errorWithCode:800 description:@"URL length exceeds 64KB."];
              [v10 logAndStoreInError:a3];

              goto LABEL_16;
            }
            objc_msgSend(v13, "writeUInt16:", (unsigned __int16)objc_msgSend(v21, "length"));
            [v13 appendData:v21];
          }
          id v18 = [v16 countByEnumeratingWithState:&v30 objects:v35 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      v22 = [v13 buffer];
      id v23 = [v22 length];

      if ((unint64_t)v23 < 0x10000)
      {
        v25 = [v13 buffer];
        objc_msgSend(v7, "writeUInt16:", (unsigned __int16)objc_msgSend(v25, "length"));

        v26 = [v13 buffer];
        [v7 appendData:v26];

        v27 = [(_DPTaskProv00 *)self encodedQueryConfig];
        [v7 appendData:v27];

        objc_msgSend(v7, "writeUInt64:", -[_DPTaskProv taskExpiration](self, "taskExpiration"));
        v28 = [(_DPTaskProv00 *)self encodedVDAFConfig];
        [v7 appendData:v28];

        v29 = [v7 buffer];
        [(_DPTaskProv *)self setEncodedTaskConfig:v29];

        v6 = [(_DPTaskProv *)self encodedTaskConfig];
        v10 = 0;
      }
      else
      {
        v10 = +[_DPDediscoError errorWithCode:800 description:@"Aggregator endpoints length exceeds 64KB."];
        [v10 logAndStoreInError:a3];
LABEL_16:
        v6 = 0;
      }
    }
    else
    {
      v10 = +[_DPDediscoError errorWithCode:800 description:@"Task info length exceeds 256B."];
      [v10 logAndStoreInError:a3];
      v6 = 0;
    }
  }
  return v6;
}

- (id)encodedVDAFConfig
{
  id v3 = [objc_alloc((Class)_DPBigEndianDataEncoder) initWithCapacity:14];
  [v3 writeUChar:2];
  v4 = [(_DPTaskProv *)self donation];
  v5 = [v4 metadata];
  v6 = [v5 objectForKeyedSubscript:kDPMetadataDediscoTaskConfig];
  id v7 = [v6 objectForKeyedSubscript:kDPMetadataDediscoTaskConfigDPConfig];
  v8 = [v7 objectForKeyedSubscript:kDPMetadataDediscoTaskConfigDPConfigLocalEpsilon];
  [v8 floatValue];
  int v10 = v9;

  [v3 writeUChar:2];
  LODWORD(v11) = v10;
  [v3 writeFloat32:v11];
  objc_msgSend(v3, "writeUInt32:", -[_DPTaskProv vdafType](self, "vdafType"));
  objc_super v12 = [(_DPTaskProv *)self donation];
  objc_msgSend(v3, "writeUInt32:", objc_msgSend(v12, "dimension"));

  id v13 = [v3 buffer];

  return v13;
}

- (id)encodedQueryConfig
{
  id v3 = [objc_alloc((Class)_DPBigEndianDataEncoder) initWithCapacity:19];
  [v3 writeUChar:2];
  [v3 writeUInt64:14400];
  [v3 writeUInt16:(unsigned __int16)kDPTaskProvMaxBatchQueryCount];
  objc_msgSend(v3, "writeUInt32:", -[_DPTaskProv minBatchSize](self, "minBatchSize"));
  objc_msgSend(v3, "writeUInt32:", -[_DPTaskProv maxBatchSize](self, "maxBatchSize"));
  v4 = [v3 buffer];

  return v4;
}

@end