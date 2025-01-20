@interface CacheDeleteEnumerateRemovedFiles
@end

@implementation CacheDeleteEnumerateRemovedFiles

void ___CacheDeleteEnumerateRemovedFiles_block_invoke_85(uint64_t a1)
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  q = dispatch_queue_create("com.apple.CacheDeleteFSEvents", v2);

  v3 = objc_opt_new();
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  uint64_t v95 = a1;
  FSEventStreamEventId sinceWhen = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v104 objects:v125 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v105;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v105 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v104 + 1) + 8 * i);
        bzero(v117, 0x400uLL);
        id v9 = v8;
        if (!realpath_DARWIN_EXTSN((const char *)[v9 UTF8String], v117))
        {
          v10 = CDGetLogHandle((uint64_t)"client");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = [v9 UTF8String];
            *(_DWORD *)buf = 136446210;
            uint64_t v109 = v17;
            _os_log_error_impl(&dword_1A63D1000, v10, OS_LOG_TYPE_ERROR, "_CacheDeleteEnumerateRemovedFiles: Unable to realpath \"%{public}s\"", buf, 0xCu);
          }
        }
        v11 = normalizePath(v9, 1);
        v12 = v11;
        if (v11)
        {
          v13 = mapVolume(v11, 0);

          v14 = [v3 objectForKeyedSubscript:v13];
          if (!v14)
          {
            v14 = objc_opt_new();
            [v3 setObject:v14 forKeyedSubscript:v13];
          }
          v15 = mapVolume(v9, 0);
          [v14 addObject:v15];

          v16 = CDGetLogHandle((uint64_t)"client");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            uint64_t v109 = (uint64_t)v9;
            __int16 v110 = 2114;
            FSEventStreamEventId v111 = (FSEventStreamEventId)v13;
            _os_log_impl(&dword_1A63D1000, v16, OS_LOG_TYPE_DEFAULT, "_CacheDeleteEnumerateRemovedFiles: validated \"%{public}@\" on \"%{public}@\"", buf, 0x16u);
          }
        }
        else
        {
          v13 = CDGetLogHandle((uint64_t)"client");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v109 = (uint64_t)v9;
            _os_log_error_impl(&dword_1A63D1000, v13, OS_LOG_TYPE_ERROR, "_CacheDeleteEnumerateRemovedFiles: unable to associate directory: \"%{public}@\" with a volume", buf, 0xCu);
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v104 objects:v125 count:16];
    }
    while (v5);
  }

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  obuint64_t j = v3;
  uint64_t v91 = [obj countByEnumeratingWithState:&v100 objects:v116 count:16];
  if (v91)
  {
    uint64_t v90 = *(void *)v101;
    do
    {
      for (uint64_t j = 0; j != v91; ++j)
      {
        if (*(void *)v101 != v90) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v100 + 1) + 8 * j);
        v20 = [obj objectForKeyedSubscript:v19];
        v21 = [[CDRemoveEventsConsumer alloc] initWithConsumer:*(void *)(v95 + 32) identifier:*(void *)(v95 + 56)];
        *(void *)v117 = 0;
        v118 = v117;
        uint64_t v119 = 0x4810000000;
        uint64_t v121 = 0;
        long long v123 = 0u;
        uint64_t v124 = 0;
        v120 = &unk_1A6411456;
        v122 = v21;
        FSEventStreamEventId v22 = sinceWhen;
        if (sinceWhen)
        {
LABEL_26:
          FSEventStreamEventId sinceWhen = v22;
          if (v22 == -1)
          {
            v23 = objc_msgSend(NSString, "stringWithFormat:", @"_CacheDeleteEnumerateRemovedFiles: Invalid _since parameter: %llu (0x%032llx)", -1, -1);
            CDSimulateCrash(195890385, v23);

            FSEventStreamEventId sinceWhen = FSEventsGetCurrentEventId();
            v24 = CDGetLogHandle((uint64_t)"client");
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v109 = -1;
              __int16 v110 = 2048;
              FSEventStreamEventId v111 = sinceWhen;
              _os_log_error_impl(&dword_1A63D1000, v24, OS_LOG_TYPE_ERROR, "_CacheDeleteEnumerateRemovedFiles: reset _since from %llu to current event id: %llu", buf, 0x16u);
            }
          }
          v25 = v118;
          CFArrayRef v26 = [v20 allObjects];
          v27 = FSEventStreamCreate(0, (FSEventStreamCallback)fsEventStreamCallback, (FSEventStreamContext *)(v25 + 32), v26, sinceWhen, 0.0, 0x53u);

          if (v27)
          {
            if (q)
            {
              v28 = CDGetLogHandle((uint64_t)"client");
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A63D1000, v28, OS_LOG_TYPE_DEFAULT, "_CacheDeleteEnumerateRemovedFiles: dispatching queue..", buf, 2u);
              }
            }
            FSEventStreamSetDispatchQueue(v27, q);
            [(CDRemoveEventsConsumer *)v21 setSince:sinceWhen];
            v29 = CDGetLogHandle((uint64_t)"client");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v30 = [v20 allObjects];
              *(_DWORD *)buf = 138413058;
              uint64_t v109 = (uint64_t)v21;
              __int16 v110 = 2048;
              FSEventStreamEventId v111 = (FSEventStreamEventId)q;
              __int16 v112 = 2048;
              FSEventStreamEventId v113 = sinceWhen;
              __int16 v114 = 2112;
              v115 = v30;
              _os_log_impl(&dword_1A63D1000, v29, OS_LOG_TYPE_DEFAULT, "_CacheDeleteEnumerateRemovedFiles: CDConsumer %@ consuming stream (queue: %p) from ID: %llu for dirs: %@", buf, 0x2Au);
            }
            [(CDRemoveEventsConsumer *)v21 consumeStream:v27 forVolume:v19];
          }
          else
          {
            v46 = CDGetLogHandle((uint64_t)"client");
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              v53 = __error();
              v54 = strerror(*v53);
              *(_DWORD *)buf = 138543618;
              uint64_t v109 = (uint64_t)v19;
              __int16 v110 = 2080;
              FSEventStreamEventId v111 = (FSEventStreamEventId)v54;
              _os_log_error_impl(&dword_1A63D1000, v46, OS_LOG_TYPE_ERROR, "_CacheDeleteEnumerateRemovedFiles: Unable to create FSEventsStream for volume \"%{public}@\": %s", buf, 0x16u);
            }
          }
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = ___CacheDeleteEnumerateRemovedFiles_block_invoke_98;
          block[3] = &unk_1E5C519C8;
          block[4] = v117;
          block[5] = v21;
          dispatch_sync(q, block);
          p_super = CDGetLogHandle((uint64_t)"client");
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v109 = (uint64_t)v19;
            _os_log_impl(&dword_1A63D1000, p_super, OS_LOG_TYPE_DEFAULT, "_CacheDeleteEnumerateRemovedFiles: Finished streaming events for %@", buf, 0xCu);
          }
          char v48 = 0;
          goto LABEL_103;
        }
        id v88 = *(id *)(v95 + 56);
        id sinceWhena = v19;
        v31 = +[CacheDeleteVolume volumeWithPath:](CacheDeleteVolume, "volumeWithPath:");
        if (v31)
        {
          v32 = domain(v88);
          v33 = objc_alloc_init(MEMORY[0x1E4F1CB18]);
          os_log_t log = v33;
          if (v33)
          {
            osos_log_t log = [v33 objectForKey:v32];
            if (oslog)
            {
              v34 = [v31 uuid];
              v35 = [v34 UUIDString];
              v83 = [oslog objectForKeyedSubscript:v35];

              if (v83)
              {
                v36 = [v83 objectAtIndexedSubscript:0];
                v37 = [v31 FSEventsUUID];
                v38 = [v37 UUIDString];
                char v39 = [v36 isEqualToString:v38];

                if (v39)
                {
                  v40 = [v83 objectAtIndexedSubscript:0];
                  if (v40)
                  {
                    v41 = [v83 objectAtIndexedSubscript:1];
                    v92 = malloc_type_calloc(0x28uLL, 1uLL, 0xDCFE2FEAuLL);
                    v92[4] = [v41 unsignedLongLongValue];
                    v42 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v40];
                    [v42 getUUIDBytes:v92 + 2];

                    v43 = [v31 uuid];
                    [v43 getUUIDBytes:v92];

                    v44 = CDGetLogHandle((uint64_t)"client");
                    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                    {
                      v45 = CDPurgeMarkerDescription((uint64_t)v92);
                      *(_DWORD *)buf = 138543618;
                      uint64_t v109 = (uint64_t)v32;
                      __int16 v110 = 2114;
                      FSEventStreamEventId v111 = (FSEventStreamEventId)v45;
                      _os_log_impl(&dword_1A63D1000, v44, OS_LOG_TYPE_DEFAULT, "copyPurgeMarker(%{public}@): returning %{public}@", buf, 0x16u);
                    }
                    goto LABEL_71;
                  }
                  v52 = CDGetLogHandle((uint64_t)"client");
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    uint64_t v109 = (uint64_t)v83;
                    _os_log_error_impl(&dword_1A63D1000, v52, OS_LOG_TYPE_ERROR, "copyPurgeMarker: Unable to get FSEventsUUISStr from: %{public}@", buf, 0xCu);
                  }
                }
                else
                {
                  v52 = CDGetLogHandle((uint64_t)"client");
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                  {
                    v93 = [v31 FSEventsUUID];
                    v79 = [v93 UUIDString];
                    v80 = [v83 objectAtIndexedSubscript:0];
                    v81 = [v31 mountPoint];
                    *(_DWORD *)buf = 138543874;
                    uint64_t v109 = (uint64_t)v79;
                    __int16 v110 = 2114;
                    FSEventStreamEventId v111 = (FSEventStreamEventId)v80;
                    __int16 v112 = 2114;
                    FSEventStreamEventId v113 = (FSEventStreamEventId)v81;
                    _os_log_error_impl(&dword_1A63D1000, v52, OS_LOG_TYPE_ERROR, "copyPurgeMarker: Current FSEventsUUID (%{public}@) does not match saved UUID (%{public}@) for volume %{public}@", buf, 0x20u);
                  }
                }
              }
              else
              {
                v51 = CDGetLogHandle((uint64_t)"client");
                if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                {
                  v76 = [v31 mountPoint];
                  v77 = [v31 uuid];
                  v78 = [v77 UUIDString];
                  *(_DWORD *)buf = 138543618;
                  uint64_t v109 = (uint64_t)v76;
                  __int16 v110 = 2114;
                  FSEventStreamEventId v111 = (FSEventStreamEventId)v78;
                  _os_log_error_impl(&dword_1A63D1000, v51, OS_LOG_TYPE_ERROR, "copyPurgeMarker: Unable to get volume defaults for %{public}@ : %{public}@", buf, 0x16u);
                }
              }
LABEL_70:
              v92 = 0;
LABEL_71:

              goto LABEL_72;
            }
            CDGetLogHandle((uint64_t)"client");
            osos_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR)) {
              goto LABEL_70;
            }
            *(_DWORD *)buf = 138543362;
            uint64_t v109 = (uint64_t)v32;
            v49 = oslog;
            v50 = "copyPurgeMarker: Unable to get cacheDeleteAppDefaults for key: %{public}@";
          }
          else
          {
            CDGetLogHandle((uint64_t)"client");
            osos_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR)) {
              goto LABEL_70;
            }
            *(_DWORD *)buf = 138543362;
            uint64_t v109 = (uint64_t)v32;
            v49 = oslog;
            v50 = "copyPurgeMarker(%{public}@): Unable to create NSUserDefaults";
          }
          _os_log_error_impl(&dword_1A63D1000, v49, OS_LOG_TYPE_ERROR, v50, buf, 0xCu);
          goto LABEL_70;
        }
        v32 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v109 = (uint64_t)sinceWhena;
          _os_log_error_impl(&dword_1A63D1000, v32, OS_LOG_TYPE_ERROR, "copyPurgeMarker: Unable to make CacheDeleteVolume from %{public}@", buf, 0xCu);
        }
        v92 = 0;
LABEL_72:

        if (v92)
        {
          id v55 = sinceWhena;
          v56 = +[CacheDeleteVolume volumeWithPath:v55];
          v57 = v56;
          if (!v56)
          {
            v57 = CDGetLogHandle((uint64_t)"client");
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v109 = (uint64_t)v55;
              _os_log_error_impl(&dword_1A63D1000, v57, OS_LOG_TYPE_ERROR, "verifyDirAndMarkerUUIDs: Unable to validate dir: %{public}@", buf, 0xCu);
            }
            goto LABEL_97;
          }
          v58 = [v56 uuid];
          if (!v58)
          {
            v66 = CDGetLogHandle((uint64_t)"client");
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              v74 = [v57 mountPoint];
              *(_DWORD *)buf = 138543362;
              uint64_t v109 = (uint64_t)v74;
              _os_log_error_impl(&dword_1A63D1000, v66, OS_LOG_TYPE_ERROR, "verifyDirAndMarkerUUIDs: Unable to get volume UUID from %{public}@", buf, 0xCu);
            }
            goto LABEL_97;
          }
          v89 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v92];
          v59 = [v89 UUIDString];
          v60 = [v58 UUIDString];
          char v61 = [v59 isEqualToString:v60];

          if ((v61 & 1) == 0)
          {
            v67 = CDGetLogHandle((uint64_t)"client");
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              v75 = [v57 mountPoint];
              *(_DWORD *)buf = 138543362;
              uint64_t v109 = (uint64_t)v75;
              _os_log_error_impl(&dword_1A63D1000, v67, OS_LOG_TYPE_ERROR, "verifyDirAndMarkerUUIDs: Marker volume UUID does not match cdVolume: %{public}@", buf, 0xCu);
            }
            goto LABEL_97;
          }
          os_log_t osloga = [v57 FSEventsUUID];
          if (!osloga)
          {
            loga = CDGetLogHandle((uint64_t)"client");
            if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
            {
              v68 = [v57 mountPoint];
              *(_DWORD *)buf = 138543362;
              uint64_t v109 = (uint64_t)v68;
              _os_log_error_impl(&dword_1A63D1000, loga, OS_LOG_TYPE_ERROR, "verifyDirAndMarkerUUIDs: Unable to get FSEventsUUID string from %{public}@", buf, 0xCu);
            }
            goto LABEL_96;
          }
          v62 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v92 + 2];
          loga = v62;
          if (!v62)
          {
            v69 = CDGetLogHandle((uint64_t)"client");
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              v70 = CDPurgeMarkerDescription((uint64_t)v92);
              *(_DWORD *)buf = 138543362;
              uint64_t v109 = (uint64_t)v70;
              _os_log_error_impl(&dword_1A63D1000, v69, OS_LOG_TYPE_ERROR, "verifyDirAndMarkerUUIDs: Unable to get UUID from %{public}@", buf, 0xCu);
            }
LABEL_95:

LABEL_96:
LABEL_97:

            v71 = CDGetLogHandle((uint64_t)"client");
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            {
              v73 = CDPurgeMarkerDescription((uint64_t)v92);
              *(_DWORD *)buf = 138543618;
              uint64_t v109 = (uint64_t)v55;
              __int16 v110 = 2114;
              FSEventStreamEventId v111 = (FSEventStreamEventId)v73;
              _os_log_error_impl(&dword_1A63D1000, v71, OS_LOG_TYPE_ERROR, "_CacheDeleteEnumerateRemovedFiles: Unable to verify directory and marker, starting from zero. Directory: %{public}@, marker: %{public}@", buf, 0x16u);
            }
            free(v92);
            goto LABEL_100;
          }
          v63 = [v62 UUIDString];
          v64 = [osloga UUIDString];
          char v65 = [v63 isEqualToString:v64];

          if ((v65 & 1) == 0)
          {
            v69 = CDGetLogHandle((uint64_t)"client");
            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
            {
              v82 = [v57 mountPoint];
              *(_DWORD *)buf = 138543362;
              uint64_t v109 = (uint64_t)v82;
              _os_log_error_impl(&dword_1A63D1000, v69, OS_LOG_TYPE_ERROR, "verifyDirAndMarkerUUIDs: Marker FSEventsUUID does not match cdVolume: %{public}@", buf, 0xCu);
            }
            goto LABEL_95;
          }

          FSEventStreamEventId v22 = v92[4];
          free(v92);
          if (v22) {
            goto LABEL_26;
          }
        }
LABEL_100:
        v72 = CDGetLogHandle((uint64_t)"client");
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A63D1000, v72, OS_LOG_TYPE_ERROR, "_CacheDeleteEnumerateRemovedFiles: Unable to get a purgeMarker, was CacheDeleteEnumerateRemovedFilesInDirectories() invoked before CacheDeleteInitPurgeMarker() ?", buf, 2u);
        }

        setPurgeMarker(*(void **)(v95 + 56), sinceWhena, 1, 0);
        (*(void (**)(void))(*(void *)(v95 + 32) + 16))();
        FSEventStreamEventId sinceWhen = 0;
        char v48 = 1;
        p_super = &v21->super;
LABEL_103:

        _Block_object_dispose(v117, 8);
        if (v48) {
          goto LABEL_106;
        }
      }
      uint64_t v91 = [obj countByEnumeratingWithState:&v100 objects:v116 count:16];
    }
    while (v91);
  }
LABEL_106:
}

double ___CacheDeleteEnumerateRemovedFiles_block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.CacheDeleteEnumerateRemovedFiles", v0);
  v2 = (void *)_MergedGlobals_6;
  _MergedGlobals_6 = (uint64_t)v1;

  mach_timebase_info info = 0;
  if (mach_timebase_info(&info))
  {
    uint64_t v5 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1A63D1000, v5, OS_LOG_TYPE_ERROR, "Failed to get timebase info\n", v7, 2u);
    }
  }
  else
  {
    LODWORD(v3) = info.numer;
    LODWORD(v4) = info.denom;
    double result = (double)v3 / (double)v4;
    gTimebaseConversion = *(void *)&result;
  }
  return result;
}

void ___CacheDeleteEnumerateRemovedFiles_block_invoke_98(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = 0;
}

@end