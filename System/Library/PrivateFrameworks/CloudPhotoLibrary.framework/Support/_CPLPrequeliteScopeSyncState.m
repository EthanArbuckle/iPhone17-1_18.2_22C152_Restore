@interface _CPLPrequeliteScopeSyncState
- (CPLPrequeliteVariable)busyStateVar;
- (CPLPrequeliteVariable)classForInitialQueryVar;
- (CPLPrequeliteVariable)downloadTransportGroupVar;
- (CPLPrequeliteVariable)droppedSomeRecordsVar;
- (CPLPrequeliteVariable)featureVersionVar;
- (CPLPrequeliteVariable)hasFetchedInitialSyncAnchorVar;
- (CPLPrequeliteVariable)initialSyncAnchorVar;
- (CPLPrequeliteVariable)lastClearedPushVar;
- (CPLPrequeliteVariable)rewindSyncAnchorsVar;
- (CPLPrequeliteVariable)stagedSyncAnchorVar;
- (CPLPrequeliteVariable)syncAnchorVar;
- (CPLPrequeliteVariable)transientSyncAnchorVar;
- (CPLPrequeliteVariable)uploadTransportGroupVar;
- (_CPLPrequeliteScopeSyncState)init;
@end

@implementation _CPLPrequeliteScopeSyncState

- (_CPLPrequeliteScopeSyncState)init
{
  v2 = +[CPLPrequeliteType integerType];
  v3 = +[CPLPrequeliteVariable variableWithName:@"featureVersion" defaultValue:&off_100292070 type:v2];

  v4 = +[CPLPrequeliteType integerType];
  id obj = +[CPLPrequeliteVariable variableWithName:@"droppedSomeRecords" defaultValue:&off_100291F80 type:v4];

  v5 = +[CPLPrequeliteType dataType];
  id v30 = +[CPLPrequeliteVariable variableWithName:@"transientSyncAnchor" defaultValue:0 type:v5];

  v6 = +[CPLPrequeliteType dataType];
  v7 = +[CPLPrequeliteVariable variableWithName:@"syncAnchor" defaultValue:0 type:v6];

  v8 = +[CPLPrequeliteType dataType];
  id v29 = +[CPLPrequeliteVariable variableWithName:@"stagedSyncAnchor" defaultValue:0 type:v8];

  v9 = +[CPLPrequeliteType integerType];
  v10 = +[CPLPrequeliteVariable variableWithName:@"hasFetchedInitialSyncAnchor" defaultValue:&off_100291F80 type:v9];

  v11 = +[CPLPrequeliteType dataType];
  v27 = +[CPLPrequeliteVariable variableWithName:@"initialSyncAnchor" defaultValue:0 type:v11];

  v12 = +[CPLPrequeliteType stringType];
  v26 = +[CPLPrequeliteVariable variableWithName:@"classForInitialQuery" defaultValue:0 type:v12];

  v13 = +[CPLPrequeliteType dataType];
  v14 = +[CPLPrequeliteVariable variableWithName:@"uploadTransportGroup" defaultValue:0 type:v13];

  v15 = +[CPLPrequeliteType dataType];
  v16 = +[CPLPrequeliteVariable variableWithName:@"downloadTransportGroup" defaultValue:0 type:v15];

  v17 = +[CPLPrequeliteType dateType];
  v18 = +[CPLPrequeliteVariable variableWithName:@"lastClearedPush" defaultValue:0 type:v17];

  v19 = +[CPLPrequeliteType dataType];
  v20 = +[CPLPrequeliteVariable variableWithName:@"rewindSyncAnchors" defaultValue:0 type:v19];

  v21 = +[CPLPrequeliteType integerType];
  v22 = +[CPLPrequeliteVariable variableWithName:@"busyState" defaultValue:&off_100291F80 type:v21];

  [v20 setShouldNotCacheValue:1];
  v33[0] = v3;
  v33[1] = obj;
  v33[2] = v30;
  v33[3] = v7;
  v33[4] = v29;
  v33[5] = v10;
  v33[6] = v27;
  v33[7] = v26;
  v33[8] = v14;
  v33[9] = v16;
  v33[10] = v18;
  v33[11] = v20;
  v33[12] = v22;
  v23 = +[NSArray arrayWithObjects:v33 count:13];
  v32.receiver = self;
  v32.super_class = (Class)_CPLPrequeliteScopeSyncState;
  v24 = [(CPLPrequeliteVariableGroup *)&v32 initWithVariables:v23];

  if (v24)
  {
    objc_storeStrong((id *)&v24->_featureVersionVar, v3);
    objc_storeStrong((id *)&v24->_droppedSomeRecordsVar, obj);
    objc_storeStrong((id *)&v24->_transientSyncAnchorVar, v30);
    objc_storeStrong((id *)&v24->_syncAnchorVar, v7);
    objc_storeStrong((id *)&v24->_stagedSyncAnchorVar, v29);
    objc_storeStrong((id *)&v24->_hasFetchedInitialSyncAnchorVar, v10);
    objc_storeStrong((id *)&v24->_initialSyncAnchorVar, v27);
    objc_storeStrong((id *)&v24->_classForInitialQueryVar, v26);
    objc_storeStrong((id *)&v24->_uploadTransportGroupVar, v14);
    objc_storeStrong((id *)&v24->_downloadTransportGroupVar, v16);
    objc_storeStrong((id *)&v24->_lastClearedPushVar, v18);
    objc_storeStrong((id *)&v24->_rewindSyncAnchorsVar, v20);
    objc_storeStrong((id *)&v24->_busyStateVar, v22);
  }

  return v24;
}

- (CPLPrequeliteVariable)featureVersionVar
{
  return self->_featureVersionVar;
}

- (CPLPrequeliteVariable)droppedSomeRecordsVar
{
  return self->_droppedSomeRecordsVar;
}

- (CPLPrequeliteVariable)transientSyncAnchorVar
{
  return self->_transientSyncAnchorVar;
}

- (CPLPrequeliteVariable)syncAnchorVar
{
  return self->_syncAnchorVar;
}

- (CPLPrequeliteVariable)stagedSyncAnchorVar
{
  return self->_stagedSyncAnchorVar;
}

- (CPLPrequeliteVariable)hasFetchedInitialSyncAnchorVar
{
  return self->_hasFetchedInitialSyncAnchorVar;
}

- (CPLPrequeliteVariable)initialSyncAnchorVar
{
  return self->_initialSyncAnchorVar;
}

- (CPLPrequeliteVariable)classForInitialQueryVar
{
  return self->_classForInitialQueryVar;
}

- (CPLPrequeliteVariable)uploadTransportGroupVar
{
  return self->_uploadTransportGroupVar;
}

- (CPLPrequeliteVariable)downloadTransportGroupVar
{
  return self->_downloadTransportGroupVar;
}

- (CPLPrequeliteVariable)rewindSyncAnchorsVar
{
  return self->_rewindSyncAnchorsVar;
}

- (CPLPrequeliteVariable)busyStateVar
{
  return self->_busyStateVar;
}

- (CPLPrequeliteVariable)lastClearedPushVar
{
  return self->_lastClearedPushVar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastClearedPushVar, 0);
  objc_storeStrong((id *)&self->_busyStateVar, 0);
  objc_storeStrong((id *)&self->_rewindSyncAnchorsVar, 0);
  objc_storeStrong((id *)&self->_downloadTransportGroupVar, 0);
  objc_storeStrong((id *)&self->_uploadTransportGroupVar, 0);
  objc_storeStrong((id *)&self->_classForInitialQueryVar, 0);
  objc_storeStrong((id *)&self->_initialSyncAnchorVar, 0);
  objc_storeStrong((id *)&self->_hasFetchedInitialSyncAnchorVar, 0);
  objc_storeStrong((id *)&self->_stagedSyncAnchorVar, 0);
  objc_storeStrong((id *)&self->_syncAnchorVar, 0);
  objc_storeStrong((id *)&self->_transientSyncAnchorVar, 0);
  objc_storeStrong((id *)&self->_droppedSomeRecordsVar, 0);
  objc_storeStrong((id *)&self->_featureVersionVar, 0);
}

@end