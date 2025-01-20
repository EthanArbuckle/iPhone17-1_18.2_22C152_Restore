@interface DBGDataCoordinatorTargetHub
- (NSMutableDictionary)pendingChildNodes;
- (id)_createNodeWithDict:(id)a3;
- (id)_decompressedDataForRequestResponseData:(id)a3;
- (id)compatibility_modernizedPropertyDescription:(id)a3 targetVersion:(float)a4;
- (void)_addNodeToMatchingRootLevelGroup:(id)a3;
- (void)_processFetchResults:(id)a3 forRequest:(id)a4;
- (void)_processRequestLogs:(id)a3 forRequest:(id)a4;
- (void)_updateComputedPropertiesOfNode:(id)a3;
- (void)_updateGroup:(id)a3 withDict:(id)a4;
- (void)_updateNode:(id)a3 withDict:(id)a4;
- (void)_updatePropertiesWithDicts:(id)a3 onNode:(id)a4;
- (void)_updateProperty:(id)a3 withDict:(id)a4;
- (void)_updateSnapshotWithResponse:(id)a3 forRequest:(id)a4;
- (void)_updateSubHierarchyOfProperty:(id)a3;
- (void)_updateSubpropertiesWithDicts:(id)a3 onProperty:(id)a4;
- (void)_writeRequestResponseToDiskIfNecessary:(id)a3 request:(id)a4 compressedSize:(unint64_t)a5;
- (void)didReceiveData:(id)a3 forRequest:(id)a4;
- (void)processDebugHierarchyObjectDict:(id)a3 inGroup:(id)a4 isDirectChildGroup:(BOOL)a5;
- (void)processGroupDict:(id)a3 isDirectChildGroup:(BOOL)a4 parentNode:(id)a5;
- (void)setPendingChildNodes:(id)a3;
@end

@implementation DBGDataCoordinatorTargetHub

- (void)didReceiveData:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DBGDataCoordinatorTargetHub;
  [(DBGDataCoordinator *)&v12 didReceiveData:v6 forRequest:v7];
  if (v6)
  {
    v8 = [(DBGDataCoordinatorTargetHub *)self _decompressedDataForRequestResponseData:v6];
    if (v8)
    {
      id v11 = 0;
      v9 = +[NSDictionary dictionaryWithJSONData:v8 error:&v11];
      id v10 = v11;
      -[DBGDataCoordinatorTargetHub _writeRequestResponseToDiskIfNecessary:request:compressedSize:](self, "_writeRequestResponseToDiskIfNecessary:request:compressedSize:", v9, v7, [v6 length]);
      if (v10)
      {
LABEL_7:

        goto LABEL_8;
      }
    }
    else
    {
      v9 = 0;
    }
    [(DBGDataCoordinatorTargetHub *)self _processFetchResults:v9 forRequest:v7];
    id v10 = 0;
    goto LABEL_7;
  }
LABEL_8:
}

- (id)_decompressedDataForRequestResponseData:(id)a3
{
  id v4 = a3;
  v5 = [(DBGDataCoordinator *)self dataSourceConnection];
  [v5 debugHierarchyVersion];
  float v7 = v6;

  if (v7 <= 2.1) {
    objc_msgSend(v4, "dbg_gzipInflateRaw");
  }
  else {
  v8 = objc_msgSend(v4, "dbg_gzipInflateIfCompressed");
  }

  return v8;
}

- (void)_processFetchResults:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = DebugHierarchySnapshotModelOSLog();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, v7);
  id v10 = v8;
  id v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    objc_super v12 = [v7 name];
    int v53 = 136446466;
    v54 = "All";
    __int16 v55 = 2114;
    v56 = v12;
    _os_signpost_emit_with_name_impl(&dword_0, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Process Fetch Results", "Process: %{public}s (%{public}@)", (uint8_t *)&v53, 0x16u);
  }
  v13 = [v6 objectForKeyedSubscript:DebugHierarchyRequestKey];
  if (v13)
  {
    v14 = +[DebugHierarchyRequest requestWithDictionary:v13];
    if ([v6 count] == (char *)&dword_0 + 1) {
      [v7 setStatus:-2];
    }
  }
  else
  {
    v14 = 0;
  }
  v15 = DebugHierarchySnapshotModelOSLog();
  v16 = [v14 logs];
  os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v15, v16);

  v18 = v15;
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    v20 = [v7 name];
    int v53 = 136446466;
    v54 = "Logs";
    __int16 v55 = 2114;
    v56 = v20;
    _os_signpost_emit_with_name_impl(&dword_0, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "Process Fetch Results", "Process: %{public}s (%{public}@)", (uint8_t *)&v53, 0x16u);
  }
  v21 = [v14 logs];
  [(DBGDataCoordinatorTargetHub *)self _processRequestLogs:v21 forRequest:v7];

  v22 = DebugHierarchySnapshotModelOSLog();
  v23 = [v14 logs];
  os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v22, v23);

  v25 = v22;
  v26 = v25;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    LOWORD(v53) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v26, OS_SIGNPOST_INTERVAL_END, v24, "Process Fetch Results", "Completed", (uint8_t *)&v53, 2u);
  }

  v27 = [v6 objectForKeyedSubscript:DebugHierarchyRequestRuntimeInformationKey];
  v28 = DebugHierarchySnapshotModelOSLog();
  os_signpost_id_t v29 = os_signpost_id_make_with_pointer(v28, v27);
  v30 = v28;
  v31 = v30;
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    v32 = [v7 name];
    int v53 = 136446466;
    v54 = "Runtime Info";
    __int16 v55 = 2114;
    v56 = v32;
    _os_signpost_emit_with_name_impl(&dword_0, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "Process Fetch Results", "Process: %{public}s (%{public}@)", (uint8_t *)&v53, 0x16u);
  }
  if ([v27 count])
  {
    v33 = +[DebugHierarchyRuntimeInfo runtimeInfoWithSerializedRepresentation:v27];
    v34 = [(DBGDataCoordinator *)self snapshotManager];
    v35 = [v34 runtimeInfo];
    [v35 mergeWith:v33];
  }
  v36 = DebugHierarchySnapshotModelOSLog();
  os_signpost_id_t v37 = os_signpost_id_make_with_pointer(v36, v27);
  v38 = v36;
  v39 = v38;
  if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
  {
    LOWORD(v53) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v39, OS_SIGNPOST_INTERVAL_END, v37, "Process Fetch Results", "Completed", (uint8_t *)&v53, 2u);
  }

  v40 = DebugHierarchySnapshotModelOSLog();
  os_signpost_id_t v41 = os_signpost_id_make_with_pointer(v40, v6);
  v42 = v40;
  v43 = v42;
  if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
  {
    v44 = [v7 name];
    int v53 = 136446466;
    v54 = "Snapshot Model";
    __int16 v55 = 2114;
    v56 = v44;
    _os_signpost_emit_with_name_impl(&dword_0, v43, OS_SIGNPOST_INTERVAL_BEGIN, v41, "Process Fetch Results", "Process: %{public}s (%{public}@)", (uint8_t *)&v53, 0x16u);
  }
  [(DBGDataCoordinatorTargetHub *)self _updateSnapshotWithResponse:v6 forRequest:v7];
  v45 = DebugHierarchySnapshotModelOSLog();
  os_signpost_id_t v46 = os_signpost_id_make_with_pointer(v45, v6);
  v47 = v45;
  v48 = v47;
  if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
  {
    LOWORD(v53) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v48, OS_SIGNPOST_INTERVAL_END, v46, "Process Fetch Results", "Completed", (uint8_t *)&v53, 2u);
  }

  v49 = DebugHierarchySnapshotModelOSLog();
  os_signpost_id_t v50 = os_signpost_id_make_with_pointer(v49, v7);
  v51 = v49;
  v52 = v51;
  if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
  {
    LOWORD(v53) = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v52, OS_SIGNPOST_INTERVAL_END, v50, "Process Fetch Results", "Completed", (uint8_t *)&v53, 2u);
  }
}

- (void)_processRequestLogs:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    v8 = [v7 logs];
    id v9 = [v8 count];

    if (v9)
    {
      id v10 = [v7 logs];
      id v11 = [v10 arrayByAddingObjectsFromArray:v6];
      [v7 setLogs:v11];
    }
    else
    {
      [v7 setLogs:v6];
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = v6;
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v18 = [(DBGDataCoordinator *)self snapshotManager];
          [v18 logMessage:v17];
        }
        id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }
  }
}

- (void)_updateSnapshotWithResponse:(id)a3 forRequest:(id)a4
{
  id v5 = a3;
  id v6 = +[NSMutableDictionary dictionary];
  [(DBGDataCoordinatorTargetHub *)self setPendingChildNodes:v6];

  v38 = [v5 objectForKeyedSubscript:DebugHierarchyRequestTopLevelGroupsKey];
  id v7 = [v38 allValues];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v52;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v52 != v10) {
          objc_enumerationMutation(v7);
        }
        [(DBGDataCoordinatorTargetHub *)self processGroupDict:*(void *)(*((void *)&v51 + 1) + 8 * i) isDirectChildGroup:1 parentNode:0];
      }
      id v9 = [v7 countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v9);
  }
  -[DBGDataCoordinatorTargetHub setPendingChildNodes:](self, "setPendingChildNodes:", 0, v7);
  v39 = v5;
  [v5 objectForKeyedSubscript:DebugHierarchyRequestTopLevelPropertyDescriptionsKey];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v40 = long long v50 = 0u;
  id obj = [v40 keyEnumerator];
  id v12 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v48;
    do
    {
      uint64_t v15 = 0;
      id v41 = v13;
      do
      {
        if (*(void *)v48 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v15);
        id v17 = [v16 rangeOfString:@"."];
        if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v18 = [v16 substringToIndex:v17];
          long long v19 = self;
          long long v20 = [(DBGDataCoordinator *)self snapshotManager];
          long long v21 = [v20 snapshot];
          long long v22 = [v21 identifierToNodeMap];
          v23 = [v22 objectForKey:v18];

          if (v23)
          {
            os_signpost_id_t v24 = [v40 objectForKeyedSubscript:v16];
            v25 = [v24 objectForKeyedSubscript:@"fetchStatus"];
            v26 = v25;
            if (!v25 || ((unint64_t)[v25 unsignedIntegerValue] & 0xFFFFFFFFFFFFFFF7) != 0)
            {
              v27 = [v24 objectForKeyedSubscript:@"propertyName"];
              v28 = [v23 propertyWithName:v27];
              [(DBGDataCoordinatorTargetHub *)v19 _updateProperty:v28 withDict:v24];
            }
          }

          id v13 = v41;
          self = v19;
        }
        uint64_t v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v13);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  os_signpost_id_t v29 = [(DBGDataCoordinator *)self snapshotTransformers];
  id v30 = [v29 countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v44;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v44 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
        v35 = [(DBGDataCoordinator *)self snapshotManager];
        v36 = [v35 snapshot];
        [v34 snapshotDidUpdate:v36];
      }
      id v31 = [v29 countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v31);
  }
}

- (void)processGroupDict:(id)a3 isDirectChildGroup:(BOOL)a4 parentNode:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(DBGDataCoordinator *)self snapshotManager];
  id v11 = [v10 snapshot];

  id v12 = [v8 objectForKeyedSubscript:@"groupingID"];
  id v13 = [v8 objectForKeyedSubscript:@"debugHierarchyObjects"];
  if (v9)
  {
    uint64_t v14 = [v9 groupWithID:v12];
    if (v14) {
      goto LABEL_9;
    }
    if (v6)
    {
      uint64_t v14 = +[DBGSnapshotGroup strongObjectsGroupWithIdentifier:v12];
      [v9 setChildGroup:v14];
    }
    else
    {
      uint64_t v14 = +[DBGSnapshotGroup weakObjectsGroupWithIdentifier:v12];
      [v9 addAdditonalGroup:v14];
    }
  }
  else
  {
    uint64_t v14 = [v11 rootLevelSnapshotGroupWithIdentifier:v12];
    if (!v14)
    {
      uint64_t v14 = +[DBGSnapshotGroup strongObjectsGroupWithIdentifier:v12];
      [v11 addRootLevelGroup:v14];
    }
  }
  [(DBGDataCoordinatorTargetHub *)self _updateGroup:v14 withDict:v8];
LABEL_9:
  long long v21 = v9;
  uint64_t v15 = v11;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v16 = v13;
  id v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        [(DBGDataCoordinatorTargetHub *)self processDebugHierarchyObjectDict:*(void *)(*((void *)&v22 + 1) + 8 * i) inGroup:v14 isDirectChildGroup:v6];
      }
      id v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v18);
  }
}

- (void)processDebugHierarchyObjectDict:(id)a3 inGroup:(id)a4 isDirectChildGroup:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(DBGDataCoordinator *)self snapshotManager];
  id v11 = [v10 snapshot];

  id v12 = [v8 objectForKeyedSubscript:@"objectID"];
  id v13 = [(DBGDataCoordinatorTargetHub *)self pendingChildNodes];
  uint64_t v14 = [v13 objectForKeyedSubscript:v12];

  uint64_t v15 = (void *)v14;
  long long v25 = v11;
  if (v14
    || ([v11 identifierToNodeMap],
        id v16 = objc_claimAutoreleasedReturnValue(),
        [v16 objectForKey:v12],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        v16,
        v15))
  {
    [(DBGDataCoordinatorTargetHub *)self _updateNode:v15 withDict:v8];
    [v9 addObject:v15];
    if (v14 && v5)
    {
      id v17 = [(DBGDataCoordinatorTargetHub *)self pendingChildNodes];
      [v17 removeObjectForKey:v12];
    }
  }
  else
  {
    uint64_t v15 = [(DBGDataCoordinatorTargetHub *)self _createNodeWithDict:v8];
    if (v9)
    {
      if (!v5)
      {
        long long v24 = [(DBGDataCoordinatorTargetHub *)self pendingChildNodes];
        [v24 setObject:v15 forKeyedSubscript:v12];
      }
      [v9 addObject:v15];
    }
    else
    {
      [(DBGDataCoordinatorTargetHub *)self _addNodeToMatchingRootLevelGroup:v15];
    }
  }
  id v18 = [v8 objectForKeyedSubscript:@"childGroup"];
  if (v18) {
    [(DBGDataCoordinatorTargetHub *)self processGroupDict:v18 isDirectChildGroup:1 parentNode:v15];
  }
  uint64_t v19 = [v8 objectForKeyedSubscript:@"additionalGroups"];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v20 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      long long v23 = 0;
      do
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        [(DBGDataCoordinatorTargetHub *)self processGroupDict:*(void *)(*((void *)&v26 + 1) + 8 * (void)v23) isDirectChildGroup:0 parentNode:v15];
        long long v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      id v21 = [v19 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v21);
  }
}

- (void)_addNodeToMatchingRootLevelGroup:(id)a3
{
  id v4 = [a3 childGroup];
  id v8 = [v4 groupingIdentifier];

  BOOL v5 = [(DBGDataCoordinator *)self snapshotManager];
  BOOL v6 = [v5 snapshot];
  id v7 = [v6 rootLevelSnapshotGroupWithIdentifier:v8];

  if (!v7)
  {
    id v7 = +[DBGSnapshotGroup strongObjectsGroupWithIdentifier:v8];
  }
}

- (id)_createNodeWithDict:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 objectForKeyedSubscript:@"objectID"];
  BOOL v6 = +[DBGSnapshotNode nodeWithIdentifier:v5];
  id v7 = [(DBGDataCoordinator *)self snapshotManager];
  id v8 = [v7 snapshot];
  [v6 setSnapshot:v8];

  [(DBGDataCoordinatorTargetHub *)self _updateNode:v6 withDict:v4];

  return v6;
}

- (void)_updateGroup:(id)a3 withDict:(id)a4
{
  id v6 = a3;
  BOOL v5 = [a4 objectForKeyedSubscript:@"defaultDisplayName"];
  if (v5) {
    [v6 setDefaultDisplayName:v5];
  }
}

- (void)_updateNode:(id)a3 withDict:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if ((_DBGDictionaryDescribesDebugHierarchyObjectReference(v6) & 1) == 0)
  {
    id v7 = [v6 objectForKeyedSubscript:@"visibility"];
    id v8 = [v7 integerValue];

    [v14 setVisibility:v8];
    id v9 = [v6 objectForKeyedSubscript:@"className"];
    if (v9)
    {
      uint64_t v10 = [(DBGDataCoordinator *)self snapshotManager];
      id v11 = [v10 runtimeInfo];
      id v12 = [v11 typeWithName:v9];
      [v14 setRuntimeType:v12];
    }
    id v13 = [v6 objectForKeyedSubscript:@"properties"];
    if ([v13 count]) {
      [(DBGDataCoordinatorTargetHub *)self _updatePropertiesWithDicts:v13 onNode:v14];
    }
  }
}

- (void)_updatePropertiesWithDicts:(id)a3 onNode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(id *)(*((void *)&v15 + 1) + 8 * (void)v11);
        if ([v12 count])
        {
          id v13 = [v12 objectForKeyedSubscript:@"propertyName"];
          if (v13)
          {
            id v14 = [v7 propertyWithName:v13];
            if (!v14)
            {
              id v14 = +[DBGSnapshotProperty propertyWithName:v13];
              [v7 addProperty:v14];
            }
            [(DBGDataCoordinatorTargetHub *)self _updateProperty:v14 withDict:v12];
          }
        }

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  [(DBGDataCoordinatorTargetHub *)self _updateComputedPropertiesOfNode:v7];
}

- (void)_updateProperty:(id)a3 withDict:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(DBGDataCoordinator *)self dataSourceConnection];
  [v7 debugHierarchyVersion];
  id v8 = -[DBGDataCoordinatorTargetHub compatibility_modernizedPropertyDescription:targetVersion:](self, "compatibility_modernizedPropertyDescription:targetVersion:", v6);

  [v12 updateWithJSONPropertyDescription:v8];
  id v9 = [v8 objectForKeyedSubscript:@"subproperties"];
  [(DBGDataCoordinatorTargetHub *)self _updateSubpropertiesWithDicts:v9 onProperty:v12];
  uint64_t v10 = [v12 name];
  unsigned int v11 = [v10 isEqualToString:@"dbgSubviewHierarchy"];

  if (v11) {
    [(DBGDataCoordinatorTargetHub *)self _updateSubHierarchyOfProperty:v12];
  }
}

- (void)_updateSubpropertiesWithDicts:(id)a3 onProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v13 = [v12 objectForKeyedSubscript:@"propertyName"];
        id v14 = [v7 subpropertyWithName:v13];
        if (!v14)
        {
          id v14 = +[DBGSnapshotProperty propertyWithName:v13];
          [v7 addSubproperty:v14];
        }
        [(DBGDataCoordinatorTargetHub *)self _updateProperty:v14 withDict:v12];
      }
      id v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)_updateSubHierarchyOfProperty:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 dataValue];
  if ([v5 length])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [(DBGDataCoordinator *)self snapshotTransformers];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned int v11 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v10);
          id v12 = [(DBGDataCoordinator *)self snapshotManager];
          id v13 = [v12 snapshot];
          [v11 updateSnapshot:v13 withSubHierarchyProperty:v4];

          uint64_t v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (void)_updateComputedPropertiesOfNode:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v5 = [(DBGDataCoordinator *)self snapshotTransformers];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) updateComputedPropertiesOfNode:v4];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_writeRequestResponseToDiskIfNecessary:(id)a3 request:(id)a4 compressedSize:(unint64_t)a5
{
  id v34 = a3;
  id v7 = a4;
  uint64_t v8 = +[NSUserDefaults standardUserDefaults];
  uint64_t v9 = [v8 valueForKey:@"DBGViewDebuggerWriteFetchedHierarchyToFile"];

  if ([v9 length])
  {
    long long v10 = [v9 stringByExpandingTildeInPath];

    uint64_t v11 = DebugHierarchyRequestMetaDataKey;
    long long v12 = [v34 objectForKeyedSubscript:DebugHierarchyRequestMetaDataKey];
    id v13 = [v12 mutableCopy];

    if (v13)
    {
      uint64_t v14 = DebugHierarchyRequestMetaDataRequestPerformanceKey;
      long long v15 = [v13 objectForKeyedSubscript:DebugHierarchyRequestMetaDataRequestPerformanceKey];
      id v16 = [v15 mutableCopy];

      if (v16)
      {
        long long v17 = [v7 executionEndDate];
        long long v18 = [v7 executionStartDate];
        [v17 timeIntervalSinceDate:v18];
        uint64_t v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v16 setObject:v19 forKeyedSubscript:@"totalRequestExecutionDuration"];

        id v20 = objc_alloc_init((Class)NSByteCountFormatter);
        id v21 = [v20 stringFromByteCount:a5];
        [v16 setObject:v21 forKeyedSubscript:@"compressedSize"];

        [v13 setObject:v16 forKeyedSubscript:v14];
        id v22 = [v34 mutableCopy];
        [v22 setObject:v13 forKeyedSubscript:v11];
      }
      else
      {
        id v22 = 0;
      }
    }
    else
    {
      id v22 = 0;
    }
    long long v23 = v34;
    if (v22) {
      long long v23 = v22;
    }
    long long v24 = [v23 generateJSONDataWithError:0];
    long long v25 = [v10 pathExtension];
    id v26 = [v25 length];

    if (!v26)
    {
      long long v27 = (void *)_writeRequestResponseToDiskIfNecessary_request_compressedSize__dateFormatter;
      if (!_writeRequestResponseToDiskIfNecessary_request_compressedSize__dateFormatter)
      {
        id v28 = objc_alloc_init((Class)NSDateFormatter);
        long long v29 = (void *)_writeRequestResponseToDiskIfNecessary_request_compressedSize__dateFormatter;
        _writeRequestResponseToDiskIfNecessary_request_compressedSize__dateFormatter = (uint64_t)v28;

        [(id)_writeRequestResponseToDiskIfNecessary_request_compressedSize__dateFormatter setDateFormat:@"HH-mm-ss.SSSS"];
        id v30 = +[NSTimeZone localTimeZone];
        [(id)_writeRequestResponseToDiskIfNecessary_request_compressedSize__dateFormatter setTimeZone:v30];

        long long v27 = (void *)_writeRequestResponseToDiskIfNecessary_request_compressedSize__dateFormatter;
      }
      id v31 = +[NSDate date];
      uint64_t v32 = [v27 stringFromDate:v31];
      uint64_t v33 = +[NSString stringWithFormat:@"%@-%@.json", v10, v32];

      long long v10 = (void *)v33;
    }
    [v24 writeToFile:v10 atomically:1];

    uint64_t v9 = v10;
  }
}

- (id)compatibility_modernizedPropertyDescription:(id)a3 targetVersion:(float)a4
{
  id v5 = a3;
  id v6 = v5;
  BOOL v7 = a4 < 2.0 && a4 == 1.0;
  id v8 = v5;
  if (!v7) {
    goto LABEL_20;
  }
  id v9 = [v5 mutableCopy];
  long long v10 = [v9 objectForKeyedSubscript:@"propertyValueStatus"];
  uint64_t v11 = v10;
  if (!v10)
  {
    uint64_t v14 = [v6 objectForKeyedSubscript:@"propertyValue"];

    if (v14) {
      uint64_t v13 = 4;
    }
    else {
      uint64_t v13 = 1;
    }
    goto LABEL_17;
  }
  long long v12 = (char *)[v10 unsignedIntegerValue];
  if (v12)
  {
    if (v12 == (unsigned char *)&dword_0 + 3)
    {
      uint64_t v13 = 8;
      goto LABEL_17;
    }
    if (v12 != (unsigned char *)&dword_0 + 1)
    {
      uint64_t v13 = 0;
      goto LABEL_17;
    }
    [v9 removeObjectForKey:@"propertyValue"];
  }
  uint64_t v13 = 4;
LABEL_17:
  long long v15 = +[NSNumber numberWithLong:v13];
  [v9 setObject:v15 forKeyedSubscript:@"fetchStatus"];

  id v16 = [v6 objectForKeyedSubscript:@"propertyVisibility"];
  long long v17 = v16;
  if (v16) {
    [v16 integerValue];
  }
  id v8 = [v9 copy];

LABEL_20:

  return v8;
}

- (NSMutableDictionary)pendingChildNodes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPendingChildNodes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end