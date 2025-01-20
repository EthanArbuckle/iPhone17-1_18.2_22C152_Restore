@interface CPLCloudKitStreamingKey
- ($2E74481F85386E1F5426A8C22E405656)timeRange;
- (BOOL)isEqual:(id)a3;
- (BOOL)useEncryptedStream;
- (CKRecordID)recordID;
- (CPLCloudKitStreamingKey)initWithRecordID:(id)a3 resourceKey:(id)a4 fingerPrint:(id)a5 filename:(id)a6 groupName:(id)a7 timeRange:(id *)a8 useEncryptedStream:(BOOL)a9;
- (NSString)filename;
- (NSString)fingerPrint;
- (NSString)groupName;
- (NSString)resourceKey;
- (unint64_t)hash;
- (void)setUseEncryptedStream:(BOOL)a3;
@end

@implementation CPLCloudKitStreamingKey

- (CPLCloudKitStreamingKey)initWithRecordID:(id)a3 resourceKey:(id)a4 fingerPrint:(id)a5 filename:(id)a6 groupName:(id)a7 timeRange:(id *)a8 useEncryptedStream:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v34.receiver = self;
  v34.super_class = (Class)CPLCloudKitStreamingKey;
  v20 = [(CPLCloudKitStreamingKey *)&v34 init];
  if (v20)
  {
    id v21 = [v15 copy];
    v22 = (void *)*((void *)v20 + 2);
    *((void *)v20 + 2) = v21;

    id v23 = [v16 copy];
    v24 = (void *)*((void *)v20 + 3);
    *((void *)v20 + 3) = v23;

    id v25 = [v18 copy];
    v26 = (void *)*((void *)v20 + 5);
    *((void *)v20 + 5) = v25;

    id v27 = [v17 copy];
    v28 = (void *)*((void *)v20 + 4);
    *((void *)v20 + 4) = v27;

    id v29 = [v19 copy];
    v30 = (void *)*((void *)v20 + 6);
    *((void *)v20 + 6) = v29;

    long long v31 = *(_OWORD *)&a8->var0.var0;
    long long v32 = *(_OWORD *)&a8->var0.var3;
    *(_OWORD *)(v20 + 88) = *(_OWORD *)&a8->var1.var1;
    *(_OWORD *)(v20 + 72) = v32;
    *(_OWORD *)(v20 + 56) = v31;
    v20[8] = a9;
  }

  return (CPLCloudKitStreamingKey *)v20;
}

- (unint64_t)hash
{
  return [(NSString *)self->_fingerPrint hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CPLCloudKitStreamingKey *)a3;
  if (v4 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ![(CKRecordID *)self->_recordID isEqual:v4->_recordID]
      || ![(NSString *)self->_resourceKey isEqual:v4->_resourceKey]
      || ![(NSString *)self->_fingerPrint isEqual:v4->_fingerPrint]
      || ![(NSString *)self->_filename isEqual:v4->_filename])
    {
      goto LABEL_15;
    }
    unint64_t v5 = self->_groupName;
    v6 = (void *)v5;
    groupName = v4->_groupName;
    if (v5 && groupName)
    {
      unsigned __int8 v8 = objc_msgSend((id)v5, "isEqual:");

      if ((v8 & 1) == 0) {
        goto LABEL_15;
      }
    }
    else
    {
      unint64_t v10 = v5 | (unint64_t)groupName;

      if (v10) {
        goto LABEL_15;
      }
    }
    long long v11 = *(_OWORD *)&self->_timeRange.start.epoch;
    *(_OWORD *)&range1.start.value = *(_OWORD *)&self->_timeRange.start.value;
    *(_OWORD *)&range1.start.epoch = v11;
    *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
    long long v12 = *(_OWORD *)&v4->_timeRange.start.epoch;
    *(_OWORD *)&v14.start.value = *(_OWORD *)&v4->_timeRange.start.value;
    *(_OWORD *)&v14.start.epoch = v12;
    *(_OWORD *)&v14.duration.timescale = *(_OWORD *)&v4->_timeRange.duration.timescale;
    if (CMTimeRangeEqual(&range1, &v14))
    {
      BOOL v9 = self->_useEncryptedStream == v4->_useEncryptedStream;
      goto LABEL_16;
    }
LABEL_15:
    BOOL v9 = 0;
    goto LABEL_16;
  }
  BOOL v9 = 1;
LABEL_16:

  return v9;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (NSString)resourceKey
{
  return self->_resourceKey;
}

- (NSString)fingerPrint
{
  return self->_fingerPrint;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSString)groupName
{
  return self->_groupName;
}

- ($2E74481F85386E1F5426A8C22E405656)timeRange
{
  long long v3 = *(_OWORD *)&self[1].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var3;
  return self;
}

- (BOOL)useEncryptedStream
{
  return self->_useEncryptedStream;
}

- (void)setUseEncryptedStream:(BOOL)a3
{
  self->_useEncryptedStream = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_fingerPrint, 0);
  objc_storeStrong((id *)&self->_resourceKey, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end