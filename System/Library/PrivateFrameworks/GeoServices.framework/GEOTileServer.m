@interface GEOTileServer
+ (id)identifier;
+ (id)possibleBackgroundTaskIdentifiers;
+ (unint64_t)launchMode;
- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6;
- (GEOTileServer)initWithDaemon:(id)a3;
- (NSString)description;
- (void)_canShrinkBySize:(id)a3 fromPeer:(id)a4 synchronous:(BOOL)a5;
- (void)_didDeleteExternalTileData:(id)a3;
- (void)_receivedTile:(void *)a3 error:(void *)a4 info:(void *)a5 forKey:(const void *)a6 forPeer:(void *)a7;
- (void)_shrinkDB:(id)a3 fromPeer:(id)a4 synchronous:(BOOL)a5;
- (void)beginPreload:(id)a3 fromPeer:(id)a4;
- (void)canShrinkBySize:(id)a3 fromPeer:(id)a4;
- (void)canShrinkBySizeSync:(id)a3 fromPeer:(id)a4;
- (void)cancel:(id)a3 fromPeer:(id)a4;
- (void)corrupt:(id)a3 fromPeer:(id)a4;
- (void)dealloc;
- (void)endPreload:(id)a3 fromPeer:(id)a4;
- (void)enumerateTiles:(id)a3 fromPeer:(id)a4;
- (void)loadTiles:(id)a3 fromPeer:(id)a4;
- (void)peerDidConnect:(id)a3;
- (void)peerDidDisconnect:(id)a3;
- (void)reprioritizeKey:(id)a3 fromPeer:(id)a4;
- (void)runBackgroundTask:(id)a3;
- (void)shrinkDB:(id)a3 fromPeer:(id)a4;
- (void)shrinkDBSync:(id)a3 fromPeer:(id)a4;
- (void)tileLoader:(id)a3 submittedTilesToNetwork:(id)a4 forClient:(id)a5;
@end

@implementation GEOTileServer

- (void)peerDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = [(GEOTileServer *)self daemon];
  v6 = [v5 serverQueue];
  dispatch_assert_queue_V2(v6);

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  pendingPeerToClientIdentifiers = self->_pendingPeerToClientIdentifiers;
  v8 = [v4 peerID];
  v9 = [(NSMutableDictionary *)pendingPeerToClientIdentifiers objectForKeyedSubscript:v8];

  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v13);
        v15 = +[GEOTileLoader modernLoader];
        [v15 cancelAllForClient:v14];

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  v16 = self->_pendingPeerToClientIdentifiers;
  v17 = [v4 peerID];
  [(NSMutableDictionary *)v16 removeObjectForKey:v17];

  if ([v4 preloading])
  {
    v18 = +[GEOTileLoader modernLoader];
    v19 = [v4 peerID];
    [v18 endPreloadSessionForClient:v19];

    [v4 setPreloading:0];
  }
  v20 = +[GEOTileLoader modernLoader];
  v21 = [v4 peerID];
  [v20 closeForClient:v21];

  v22.receiver = self;
  v22.super_class = (Class)GEOTileServer;
  [(GEOTileServer *)&v22 peerDidDisconnect:v4];
}

+ (id)identifier
{
  return @"tiles";
}

+ (unint64_t)launchMode
{
  return 1;
}

+ (id)possibleBackgroundTaskIdentifiers
{
  return &off_100077AE0;
}

- (BOOL)handleIncomingMessage:(id)a3 withObject:(id)a4 fromPeer:(id)a5 signpostId:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_100008D68(v10);
  BOOL v14 = 0;
  if (v13 <= 782)
  {
    if (v13 <= 417)
    {
      if (v13 == 120)
      {
        [(GEOTileServer *)self cancel:v11 fromPeer:v12];
        if (a6 != -1)
        {
          long long v26 = GEOGetGEODaemonLog();
          v16 = v26;
          if (!a6 || !os_signpost_enabled(v26)) {
            goto LABEL_65;
          }
          goto LABEL_64;
        }
      }
      else
      {
        if (v13 != 224) {
          goto LABEL_67;
        }
        [(GEOTileServer *)self loadTiles:v11 fromPeer:v12];
        if (a6 != -1)
        {
          v19 = GEOGetGEODaemonLog();
          v16 = v19;
          if (!a6 || !os_signpost_enabled(v19)) {
            goto LABEL_65;
          }
          goto LABEL_64;
        }
      }
    }
    else
    {
      if (v13 == 418)
      {
        if (!sub_100019858(v12, v11, @"tiles", v10, &off_100077B58, 2)) {
          goto LABEL_66;
        }
        [(GEOTileServer *)self beginPreload:v11 fromPeer:v12];
        if (a6 == -1) {
          goto LABEL_66;
        }
        objc_super v22 = GEOGetGEODaemonLog();
        v16 = v22;
        if (!a6 || !os_signpost_enabled(v22)) {
          goto LABEL_65;
        }
        goto LABEL_64;
      }
      if (v13 != 421)
      {
        if (v13 == 655)
        {
          if (!sub_100019858(v12, v11, @"tiles", v10, &off_100077B28, 2)) {
            goto LABEL_66;
          }
          [(GEOTileServer *)self shrinkDB:v11 fromPeer:v12];
          if (a6 == -1) {
            goto LABEL_66;
          }
          v17 = GEOGetGEODaemonLog();
          v16 = v17;
          if (!a6 || !os_signpost_enabled(v17)) {
            goto LABEL_65;
          }
          goto LABEL_64;
        }
        goto LABEL_67;
      }
      [(GEOTileServer *)self endPreload:v11 fromPeer:v12];
      if (a6 != -1)
      {
        long long v23 = GEOGetGEODaemonLog();
        v16 = v23;
        if (!a6 || !os_signpost_enabled(v23)) {
          goto LABEL_65;
        }
        goto LABEL_64;
      }
    }
    goto LABEL_66;
  }
  if (v13 > 1067)
  {
    if (v13 == 1068)
    {
      if (!sub_100019858(v12, v11, @"tiles", v10, &off_100077B40, 2)) {
        goto LABEL_66;
      }
      [(GEOTileServer *)self shrinkDBSync:v11 fromPeer:v12];
      if (a6 == -1) {
        goto LABEL_66;
      }
      long long v24 = GEOGetGEODaemonLog();
      v16 = v24;
      if (!a6 || !os_signpost_enabled(v24)) {
        goto LABEL_65;
      }
      goto LABEL_64;
    }
    if (v13 != 1320)
    {
      if (v13 == 1374)
      {
        if (!sub_100019858(v12, v11, @"tiles", v10, &off_100077B10, 2)) {
          goto LABEL_66;
        }
        [(GEOTileServer *)self canShrinkBySizeSync:v11 fromPeer:v12];
        if (a6 == -1) {
          goto LABEL_66;
        }
        v18 = GEOGetGEODaemonLog();
        v16 = v18;
        if (!a6 || !os_signpost_enabled(v18)) {
          goto LABEL_65;
        }
        goto LABEL_64;
      }
      goto LABEL_67;
    }
    [(GEOTileServer *)self reprioritizeKey:v11 fromPeer:v12];
    if (a6 != -1)
    {
      long long v25 = GEOGetGEODaemonLog();
      v16 = v25;
      if (!a6 || !os_signpost_enabled(v25)) {
        goto LABEL_65;
      }
      goto LABEL_64;
    }
LABEL_66:
    BOOL v14 = 1;
    goto LABEL_67;
  }
  switch(v13)
  {
    case 783:
      [(GEOTileServer *)self corrupt:v11 fromPeer:v12];
      if (a6 != -1)
      {
        v20 = GEOGetGEODaemonLog();
        v16 = v20;
        if (!a6 || !os_signpost_enabled(v20)) {
          goto LABEL_65;
        }
        goto LABEL_64;
      }
      goto LABEL_66;
    case 961:
      if (!sub_100019858(v12, v11, @"tiles", v10, &off_100077AF8, 2)) {
        goto LABEL_66;
      }
      [(GEOTileServer *)self canShrinkBySize:v11 fromPeer:v12];
      if (a6 == -1) {
        goto LABEL_66;
      }
      v21 = GEOGetGEODaemonLog();
      v16 = v21;
      if (!a6 || !os_signpost_enabled(v21)) {
        goto LABEL_65;
      }
      goto LABEL_64;
    case 966:
      if (!sub_100019858(v12, v11, @"tiles", v10, &off_100077B70, 2)) {
        goto LABEL_66;
      }
      [(GEOTileServer *)self enumerateTiles:v11 fromPeer:v12];
      if (a6 == -1) {
        goto LABEL_66;
      }
      v15 = GEOGetGEODaemonLog();
      v16 = v15;
      if (!a6 || !os_signpost_enabled(v15)) {
        goto LABEL_65;
      }
LABEL_64:
      v27 = [v12 bundleIdentifier];
      v28 = [(id)objc_opt_class() identifier];
      int v30 = 138412802;
      v31 = v27;
      __int16 v32 = 2112;
      v33 = v28;
      __int16 v34 = 2112;
      id v35 = v10;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, a6, "HandleRequest", "type=raw_message,peer=%@,message=%@.%@", (uint8_t *)&v30, 0x20u);

LABEL_65:
      goto LABEL_66;
  }
LABEL_67:

  return v14;
}

- (GEOTileServer)initWithDaemon:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)GEOTileServer;
  v3 = [(GEOTileServer *)&v13 initWithDaemon:a3];
  id v4 = v3;
  if (v3)
  {
    v5 = [(GEOTileServer *)v3 daemon];
    v6 = [v5 serverQueue];
    uint64_t v7 = geo_dispatch_queue_create_with_target();
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v7;

    v9 = +[GEOTileLoader modernLoader];
    [v9 setInternalDelegate:v4];

    id v10 = +[GEOTileLoader modernLoader];
    [v10 setInternalDelegateQ:v4->_queue];

    id v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v4 selector:"_didDeleteExternalTileData:" name:GEOTileLoaderDidDeleteExternalTileDataNotification object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GEOTileServer;
  [(GEOTileServer *)&v4 dealloc];
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTileServer;
  v2 = [(GEOTileServer *)&v7 description];
  v3 = +[GEOTileLoader modernLoader];
  objc_super v4 = [v3 description];
  v5 = +[NSString stringWithFormat:@"%@ %@", v2, v4];

  return (NSString *)v5;
}

- (void)_didDeleteExternalTileData:(id)a3
{
}

- (void)loadTiles:(id)a3 fromPeer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(GEOTileServer *)self daemon];
  id v10 = [v9 serverQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = xpc_dictionary_get_value(v7, "list");
  id v12 = +[GEOTileKeyList listFromXPCData:v11];

  BOOL v13 = xpc_dictionary_get_BOOL(v7, "disk");
  LODWORD(v11) = xpc_dictionary_get_BOOL(v7, "net");
  BOOL v14 = xpc_dictionary_get_BOOL(v7, "wifi");
  BOOL v209 = xpc_dictionary_get_BOOL(v7, "preload");
  BOOL v15 = xpc_dictionary_get_BOOL(v7, "proactively_load_on_failure");
  objc_opt_class();
  v16 = GEODecodeXPCValue();
  uint64_t v17 = sub_10003B4D4(v7);
  uint64_t v18 = v13;
  BOOL v19 = v11 == 0;
  v20 = (void *)v17;
  if (!v19) {
    uint64_t v18 = v13 | 2;
  }
  if (v14) {
    v18 |= 8uLL;
  }
  if (v15) {
    uint64_t v21 = v18 | 0x100;
  }
  else {
    uint64_t v21 = v18;
  }
  objc_super v22 = +[GEOTileLoader modernLoaderForResourceManifestConfiguration:v16 locale:v17];
  xpc_object_t reply = xpc_dictionary_create_reply(v7);
  long long v24 = reply;
  if (reply)
  {
    uint64_t v199 = v21;
    xpc_dictionary_set_string(reply, "event", "tiles.finished");
    xpc_dictionary_get_remote_connection(v7);
    long long v25 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (![v12 count])
    {
      xpc_connection_send_message(v25, v24);
      id v35 = v25;
LABEL_49:

      goto LABEL_50;
    }
    connection = v25;
    v204 = v20;
    v207 = v22;
    xpc_object_t message = v24;
    v205 = v16;
    v206 = v12;
    if (v209 && ([v8 hasEntitlement:@"com.apple.geoservices.preload"] & 1) == 0)
    {
      xpc_object_t xdicta = v7;
      v47 = NSStringFromSelector(a2);
      v48 = [v8 bundleIdentifier];
      v49 = +[NSString stringWithFormat:@"%@ is not allowed for %@ because of missing entitlement", v47, v48];

      NSLog(@"%@", v49);
      v50 = +[NSError GEOErrorWithCode:-5 reason:v49];
      long long v268 = 0u;
      long long v269 = 0u;
      long long v270 = 0u;
      long long v271 = 0u;
      id v51 = v12;
      id v52 = [v51 countByEnumeratingWithState:&v268 objects:v294 count:16];
      if (v52)
      {
        id v53 = v52;
        uint64_t v54 = *(void *)v269;
        do
        {
          for (i = 0; i != v53; i = (char *)i + 1)
          {
            if (*(void *)v269 != v54) {
              objc_enumerationMutation(v51);
            }
            uint64_t v56 = *(void *)(*((void *)&v268 + 1) + 8 * i);
            v57 = [v8 peerID];
            [(GEOTileServer *)self _receivedTile:0 error:v50 info:0 forKey:v56 forPeer:v57];
          }
          id v53 = [v51 countByEnumeratingWithState:&v268 objects:v294 count:16];
        }
        while (v53);
      }

      id v35 = connection;
      xpc_connection_send_message(connection, message);

      long long v24 = message;
      id v7 = xdicta;
      v16 = v205;
      id v12 = v206;
      v20 = v204;
      objc_super v22 = v207;
      goto LABEL_49;
    }
    long long v26 = xpc_dictionary_get_value(v7, "priorities");
    v196 = v26;
    if (xpc_get_type(v26) != (xpc_type_t)&_xpc_type_data)
    {
      v27 = +[NSError GEOErrorWithCode:-10 reason:@"Bad XPC request encoding (type)"];
      long long v264 = 0u;
      long long v265 = 0u;
      long long v266 = 0u;
      long long v267 = 0u;
      id v28 = v12;
      id v29 = [v28 countByEnumeratingWithState:&v264 objects:v293 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v265;
        do
        {
          for (j = 0; j != v30; j = (char *)j + 1)
          {
            if (*(void *)v265 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void *)(*((void *)&v264 + 1) + 8 * (void)j);
            __int16 v34 = [v8 peerID];
            [(GEOTileServer *)self _receivedTile:0 error:v27 info:0 forKey:v33 forPeer:v34];
          }
          id v30 = [v28 countByEnumeratingWithState:&v264 objects:v293 count:16];
        }
        while (v30);
      }
LABEL_47:

      id v35 = connection;
      long long v24 = message;
      xpc_connection_send_message(connection, message);
      v20 = v204;
      objc_super v22 = v207;
      v64 = v196;
LABEL_48:

      v16 = v205;
      id v12 = v206;
      goto LABEL_49;
    }
    v36 = v26;
    size_t v37 = xpc_data_get_length(v26);
    if (v37 != 4 * (void)[v12 count])
    {
      v27 = +[NSError GEOErrorWithCode:-10 reason:@"Bad XPC request encoding (length)"];
      long long v260 = 0u;
      long long v261 = 0u;
      long long v262 = 0u;
      long long v263 = 0u;
      id v28 = v12;
      id v58 = [v28 countByEnumeratingWithState:&v260 objects:v292 count:16];
      if (v58)
      {
        id v59 = v58;
        uint64_t v60 = *(void *)v261;
        do
        {
          for (k = 0; k != v59; k = (char *)k + 1)
          {
            if (*(void *)v261 != v60) {
              objc_enumerationMutation(v28);
            }
            uint64_t v62 = *(void *)(*((void *)&v260 + 1) + 8 * (void)k);
            v63 = [v8 peerID];
            [(GEOTileServer *)self _receivedTile:0 error:v27 info:0 forKey:v62 forPeer:v63];
          }
          id v59 = [v28 countByEnumeratingWithState:&v260 objects:v292 count:16];
        }
        while (v59);
      }
      goto LABEL_47;
    }
    bytes_ptr = (char *)xpc_data_get_bytes_ptr(v36);
    v27 = xpc_dictionary_get_value(v7, "has_additional_infos");
    xpc_object_t xdict = v7;
    if (xpc_get_type(v27) != (xpc_type_t)&_xpc_type_data)
    {
      v39 = +[NSError GEOErrorWithCode:-10 reason:@"Bad XPC request encoding (type)"];
      long long v256 = 0u;
      long long v257 = 0u;
      long long v258 = 0u;
      long long v259 = 0u;
      id v40 = v12;
      id v41 = [v40 countByEnumeratingWithState:&v256 objects:v291 count:16];
      if (v41)
      {
        id v42 = v41;
        uint64_t v43 = *(void *)v257;
        do
        {
          for (m = 0; m != v42; m = (char *)m + 1)
          {
            if (*(void *)v257 != v43) {
              objc_enumerationMutation(v40);
            }
            uint64_t v45 = *(void *)(*((void *)&v256 + 1) + 8 * (void)m);
            v46 = [v8 peerID];
            [(GEOTileServer *)self _receivedTile:0 error:v39 info:0 forKey:v45 forPeer:v46];
          }
          id v42 = [v40 countByEnumeratingWithState:&v256 objects:v291 count:16];
        }
        while (v42);
      }
LABEL_68:

      id v35 = connection;
      long long v24 = message;
      xpc_connection_send_message(connection, message);
      v20 = v204;
      objc_super v22 = v207;
      v64 = v196;
LABEL_69:

      id v7 = xdict;
      goto LABEL_48;
    }
    v177 = bytes_ptr;
    id v65 = (id)xpc_data_get_length(v27);
    if (v65 != [v12 count])
    {
      v39 = +[NSError GEOErrorWithCode:-10 reason:@"Bad XPC request encoding (length)"];
      long long v252 = 0u;
      long long v253 = 0u;
      long long v254 = 0u;
      long long v255 = 0u;
      id v40 = v12;
      id v76 = [v40 countByEnumeratingWithState:&v252 objects:v290 count:16];
      if (v76)
      {
        id v77 = v76;
        uint64_t v78 = *(void *)v253;
        do
        {
          for (n = 0; n != v77; n = (char *)n + 1)
          {
            if (*(void *)v253 != v78) {
              objc_enumerationMutation(v40);
            }
            uint64_t v80 = *(void *)(*((void *)&v252 + 1) + 8 * (void)n);
            v81 = [v8 peerID];
            [(GEOTileServer *)self _receivedTile:0 error:v39 info:0 forKey:v80 forPeer:v81];
          }
          id v77 = [v40 countByEnumeratingWithState:&v252 objects:v290 count:16];
        }
        while (v77);
      }
      goto LABEL_68;
    }
    v66 = (char *)xpc_data_get_bytes_ptr(v27);
    v67 = xpc_dictionary_get_value(v7, "additional_infos");
    v176 = v67;
    if (xpc_get_type(v67) != (xpc_type_t)&_xpc_type_data)
    {
      v68 = +[NSError GEOErrorWithCode:-10 reason:@"Bad XPC request encoding (type)"];
      long long v248 = 0u;
      long long v249 = 0u;
      long long v250 = 0u;
      long long v251 = 0u;
      id v69 = v12;
      id v70 = [v69 countByEnumeratingWithState:&v248 objects:v289 count:16];
      if (v70)
      {
        id v71 = v70;
        uint64_t v72 = *(void *)v249;
        do
        {
          for (ii = 0; ii != v71; ii = (char *)ii + 1)
          {
            if (*(void *)v249 != v72) {
              objc_enumerationMutation(v69);
            }
            uint64_t v74 = *(void *)(*((void *)&v248 + 1) + 8 * (void)ii);
            v75 = [v8 peerID];
            [(GEOTileServer *)self _receivedTile:0 error:v68 info:0 forKey:v74 forPeer:v75];
          }
          id v71 = [v69 countByEnumeratingWithState:&v248 objects:v289 count:16];
        }
        while (v71);
      }
LABEL_88:

      id v35 = connection;
      long long v24 = message;
      xpc_connection_send_message(connection, message);
      v20 = v204;
      objc_super v22 = v207;
      v64 = v196;
LABEL_89:

      v39 = v176;
      goto LABEL_69;
    }
    v174 = v66;
    size_t v82 = xpc_data_get_length(v67);
    if (v82 != 16 * (void)[v12 count])
    {
      v68 = +[NSError GEOErrorWithCode:-10 reason:@"Bad XPC request encoding (length)"];
      long long v244 = 0u;
      long long v245 = 0u;
      long long v246 = 0u;
      long long v247 = 0u;
      id v69 = v12;
      id v92 = [v69 countByEnumeratingWithState:&v244 objects:v288 count:16];
      if (v92)
      {
        id v93 = v92;
        uint64_t v94 = *(void *)v245;
        do
        {
          for (jj = 0; jj != v93; jj = (char *)jj + 1)
          {
            if (*(void *)v245 != v94) {
              objc_enumerationMutation(v69);
            }
            uint64_t v96 = *(void *)(*((void *)&v244 + 1) + 8 * (void)jj);
            v97 = [v8 peerID];
            [(GEOTileServer *)self _receivedTile:0 error:v68 info:0 forKey:v96 forPeer:v97];
          }
          id v93 = [v69 countByEnumeratingWithState:&v244 objects:v288 count:16];
        }
        while (v93);
      }
      goto LABEL_88;
    }
    v173 = (char *)xpc_data_get_bytes_ptr(v67);
    v83 = xpc_dictionary_get_value(xdict, "signposts");
    v84 = v83;
    if (v83)
    {
      if (xpc_get_type(v83) != (xpc_type_t)&_xpc_type_data)
      {
        v68 = v84;
        xpc_object_t xdata = +[NSError GEOErrorWithCode:-10 reason:@"Bad XPC request encoding (type)"];
        long long v240 = 0u;
        long long v241 = 0u;
        long long v242 = 0u;
        long long v243 = 0u;
        id v85 = v12;
        id v86 = [v85 countByEnumeratingWithState:&v240 objects:v287 count:16];
        if (v86)
        {
          id v87 = v86;
          uint64_t v88 = *(void *)v241;
          do
          {
            for (kk = 0; kk != v87; kk = (char *)kk + 1)
            {
              if (*(void *)v241 != v88) {
                objc_enumerationMutation(v85);
              }
              uint64_t v90 = *(void *)(*((void *)&v240 + 1) + 8 * (void)kk);
              v91 = [v8 peerID];
              [(GEOTileServer *)self _receivedTile:0 error:xdata info:0 forKey:v90 forPeer:v91];
            }
            id v87 = [v85 countByEnumeratingWithState:&v240 objects:v287 count:16];
          }
          while (v87);
        }
LABEL_111:

        id v35 = connection;
        long long v24 = message;
        xpc_connection_send_message(connection, message);
        v20 = v204;
        objc_super v22 = v207;
        v64 = v196;
LABEL_175:

        goto LABEL_89;
      }
      v98 = v84;
      size_t v99 = xpc_data_get_length(v84);
      if (v99 != 8 * (void)[v12 count])
      {
        v68 = v98;
        xpc_object_t xdata = +[NSError GEOErrorWithCode:-10 reason:@"Bad XPC request encoding (length)"];
        long long v236 = 0u;
        long long v237 = 0u;
        long long v238 = 0u;
        long long v239 = 0u;
        id v85 = v12;
        id v109 = [v85 countByEnumeratingWithState:&v236 objects:v286 count:16];
        if (v109)
        {
          id v110 = v109;
          uint64_t v111 = *(void *)v237;
          do
          {
            for (mm = 0; mm != v110; mm = (char *)mm + 1)
            {
              if (*(void *)v237 != v111) {
                objc_enumerationMutation(v85);
              }
              uint64_t v113 = *(void *)(*((void *)&v236 + 1) + 8 * (void)mm);
              v114 = [v8 peerID];
              [(GEOTileServer *)self _receivedTile:0 error:xdata info:0 forKey:v113 forPeer:v114];
            }
            id v110 = [v85 countByEnumeratingWithState:&v236 objects:v286 count:16];
          }
          while (v110);
        }
        goto LABEL_111;
      }
      v195 = (char *)xpc_data_get_bytes_ptr(v98);
      v84 = v98;
    }
    else
    {
      v195 = 0;
    }
    v100 = xpc_dictionary_get_value(xdict, "ctime");
    xpc_object_t xdata = v100;
    v172 = v84;
    if (v100)
    {
      if (xpc_get_type(v100) != (xpc_type_t)&_xpc_type_data)
      {
        v202 = +[NSError GEOErrorWithCode:-10 reason:@"Bad XPC request encoding (type)"];
        long long v232 = 0u;
        long long v233 = 0u;
        long long v234 = 0u;
        long long v235 = 0u;
        id v101 = v12;
        id v102 = [v101 countByEnumeratingWithState:&v232 objects:v285 count:16];
        if (v102)
        {
          id v103 = v102;
          uint64_t v104 = *(void *)v233;
          do
          {
            for (nn = 0; nn != v103; nn = (char *)nn + 1)
            {
              if (*(void *)v233 != v104) {
                objc_enumerationMutation(v101);
              }
              uint64_t v106 = *(void *)(*((void *)&v232 + 1) + 8 * (void)nn);
              v107 = [v8 peerID];
              [(GEOTileServer *)self _receivedTile:0 error:v202 info:0 forKey:v106 forPeer:v107];
            }
            id v103 = [v101 countByEnumeratingWithState:&v232 objects:v285 count:16];
          }
          while (v103);
        }
LABEL_151:

        id v35 = connection;
        long long v24 = message;
        xpc_connection_send_message(connection, message);
LABEL_174:

        v20 = v204;
        objc_super v22 = v207;
        v64 = v196;
        v68 = v172;
        goto LABEL_175;
      }
      size_t v115 = xpc_data_get_length(xdata);
      if (v115 != 8 * (void)[v12 count])
      {
        v202 = +[NSError GEOErrorWithCode:-10 reason:@"Bad XPC request encoding (length)"];
        long long v228 = 0u;
        long long v229 = 0u;
        long long v230 = 0u;
        long long v231 = 0u;
        id v101 = v12;
        id v140 = [v101 countByEnumeratingWithState:&v228 objects:v284 count:16];
        if (v140)
        {
          id v141 = v140;
          uint64_t v142 = *(void *)v229;
          do
          {
            for (i1 = 0; i1 != v141; i1 = (char *)i1 + 1)
            {
              if (*(void *)v229 != v142) {
                objc_enumerationMutation(v101);
              }
              uint64_t v144 = *(void *)(*((void *)&v228 + 1) + 8 * (void)i1);
              v145 = [v8 peerID];
              [(GEOTileServer *)self _receivedTile:0 error:v202 info:0 forKey:v144 forPeer:v145];
            }
            id v141 = [v101 countByEnumeratingWithState:&v228 objects:v284 count:16];
          }
          while (v141);
        }
        goto LABEL_151;
      }
      v108 = v12;
      v194 = (char *)xpc_data_get_bytes_ptr(xdata);
    }
    else
    {
      v108 = v12;
      v194 = 0;
    }
    uint64_t int64 = xpc_dictionary_get_uint64(xdict, "reason");
    int64_t int64 = xpc_dictionary_get_int64(xdict, "batch");
    v187 = [v8 peerID];
    v117 = [v8 auditToken];
    length[0] = 0;
    data = xpc_dictionary_get_data(xdict, "__audit_token", length);
    int64_t v191 = int64;
    if (data)
    {
      v119 = data;
      v120 = v108;
      if ([v8 hasEntitlement:GEOAuditTokenOverrideEntitlement])
      {
        v121 = +[NSData dataWithBytes:v119 length:length[0]];
        v122 = +[NSSet setWithObject:objc_opt_class()];
        v123 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v122 fromData:v121 error:0];

        if (v117)
        {
          id v124 = v123;

          v117 = v124;
        }
      }
    }
    else
    {
      v120 = v108;
    }
    long long v224 = 0u;
    long long v225 = 0u;
    long long v226 = 0u;
    long long v227 = 0u;
    id obj = v120;
    id v125 = [obj countByEnumeratingWithState:&v224 objects:v283 count:16];
    v202 = v117;
    if (v125)
    {
      id v126 = v125;
      id v127 = 0;
      uint64_t v128 = *(void *)v225;
      do
      {
        for (i2 = 0; i2 != v126; i2 = (char *)i2 + 1)
        {
          if (*(void *)v225 != v128) {
            objc_enumerationMutation(obj);
          }
          uint64_t v130 = *(void *)(*((void *)&v224 + 1) + 8 * (void)i2);
          if ((sub_10002AED0(v8, v117) & 1) == 0)
          {
            v131 = GEOGetTileLoadingLog();
            if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
            {
              v132 = GEOStringFromTileKey();
              LODWORD(length[0]) = 138543619;
              *(size_t *)((char *)length + 4) = (size_t)v8;
              WORD2(length[1]) = 2113;
              *(size_t *)((char *)&length[1] + 6) = (size_t)v132;
              _os_log_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_ERROR, "%{public}@ is not allowed to load tile %{private}@", (uint8_t *)length, 0x16u);
            }
            v133 = +[NSError GEOErrorWithCode:-5 reason:@"Peer is not allowed to load this tile type"];
            v134 = [v8 peerID];
            [(GEOTileServer *)self _receivedTile:0 error:v133 info:0 forKey:v130 forPeer:v134];

            if (!v127) {
              id v127 = objc_alloc_init((Class)GEOTileKeyList);
            }
            [v127 addKey:v130];
            v117 = v202;
          }
        }
        id v126 = [obj countByEnumeratingWithState:&v224 objects:v283 count:16];
      }
      while (v126);

      if (!v127)
      {
        v170 = 0;
        goto LABEL_153;
      }
      long long v222 = 0u;
      long long v223 = 0u;
      long long v220 = 0u;
      long long v221 = 0u;
      id v135 = v127;
      id v136 = [v135 countByEnumeratingWithState:&v220 objects:v281 count:16];
      if (v136)
      {
        id v137 = v136;
        uint64_t v138 = *(void *)v221;
        do
        {
          for (i3 = 0; i3 != v137; i3 = (char *)i3 + 1)
          {
            if (*(void *)v221 != v138) {
              objc_enumerationMutation(v135);
            }
            [obj removeKey:*(void *)(*((void *)&v220 + 1) + 8 * (void)i3)];
          }
          id v137 = [v135 countByEnumeratingWithState:&v220 objects:v281 count:16];
        }
        while (v137);
      }
      v170 = v135;
    }
    else
    {
      v170 = 0;
      id v135 = obj;
    }

LABEL_153:
    id v146 = v8;
    v147 = [v146 peerID];
    v186 = +[NSString stringWithFormat:@"%@-%lli", v147, v191];

    pendingPeerToClientIdentifiers = self->_pendingPeerToClientIdentifiers;
    if (!pendingPeerToClientIdentifiers)
    {
      v149 = +[NSMutableDictionary dictionary];
      v150 = self->_pendingPeerToClientIdentifiers;
      self->_pendingPeerToClientIdentifiers = v149;

      pendingPeerToClientIdentifiers = self->_pendingPeerToClientIdentifiers;
    }
    v151 = [(NSMutableDictionary *)pendingPeerToClientIdentifiers objectForKeyedSubscript:v187];
    v152 = message;
    if (!v151)
    {
      v151 = +[NSMutableArray array];
      [(NSMutableDictionary *)self->_pendingPeerToClientIdentifiers setObject:v151 forKeyedSubscript:v187];
    }
    v171 = v151;
    [v151 addObject:v186];
    group = dispatch_group_create();
    GEOMachAbsoluteTimeGetCurrent();
    uint64_t v154 = v153;
    v184 = [v146 offlineCohortId];
    long long v216 = 0u;
    long long v217 = 0u;
    long long v218 = 0u;
    long long v219 = 0u;
    id v178 = obj;
    id v193 = [v178 countByEnumeratingWithState:&v216 objects:v280 count:16];
    if (v193)
    {
      int v155 = 0;
      uint64_t v181 = *(void *)v217;
      uint64_t v182 = v199 | 0x20;
      do
      {
        v156 = 0;
        int v175 = v155;
        v157 = &v173[16 * v155];
        v190 = &v177[4 * v155];
        v192 = &v174[v155];
        v179 = &v194[8 * v155];
        v180 = &v195[8 * v155];
        do
        {
          if (*(void *)v217 != v181) {
            objc_enumerationMutation(v178);
          }
          v158 = *(_OWORD **)(*((void *)&v216 + 1) + 8 * (void)v156);
          length[1] = 0;
          length[0] = 0;
          *(_OWORD *)length = *v158;
          int v159 = *((unsigned __int8 *)v156 + (void)v192);
          long long v215 = *(_OWORD *)v157;
          unsigned int v200 = *(_DWORD *)&v190[4 * (void)v156];
          if (v195) {
            id obja = *(id *)&v180[8 * (void)v156];
          }
          else {
            id obja = 0;
          }
          if (v194) {
            double v160 = *(double *)&v179[8 * (void)v156];
          }
          else {
            double v160 = 0.0;
          }
          dispatch_group_enter(group);
          if (v159) {
            v161 = &v215;
          }
          else {
            v161 = 0;
          }
          qos_class_t v162 = qos_class_self();
          queue = self->_queue;
          v272[0] = _NSConcreteStackBlock;
          v272[1] = 3221225472;
          v272[2] = sub_10003CE24;
          v272[3] = &unk_100072E80;
          long long v278 = *(_OWORD *)length;
          BOOL v279 = v209;
          id v164 = v184;
          uint64_t v277 = v154;
          id v273 = v164;
          v274 = self;
          id v275 = v187;
          v276 = group;
          HIDWORD(v169) = v162;
          LOBYTE(v169) = uint64;
          [v207 loadKey:length additionalInfo:v161 priority:v200 forClient:v186 auditToken:v202 options:v182 reason:v160 qos:v169 signpostID:obja createTime:queue callbackQ:0 beginNetwork:v272 callback:v170];

          v156 = (char *)v156 + 1;
          v157 += 16;
          v152 = message;
        }
        while (v193 != v156);
        id v165 = [v178 countByEnumeratingWithState:&v216 objects:v280 count:16];
        int v155 = v175 + v156;
        id v193 = v165;
      }
      while (v165);
    }

    v166 = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003CFCC;
    block[3] = &unk_1000727A8;
    block[4] = self;
    id v211 = v187;
    id v212 = v186;
    id v35 = connection;
    v213 = connection;
    id v214 = v152;
    id v167 = v186;
    id v168 = v187;
    dispatch_group_notify(group, v166, block);

    long long v24 = message;
    goto LABEL_174;
  }
LABEL_50:
}

- (void)cancel:(id)a3 fromPeer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  *(void *)length = 0;
  data = (long long *)xpc_dictionary_get_data(v5, "key", (size_t *)length);
  if (*(void *)length == 16)
  {
    char v15 = 1;
    long long v14 = xmmword_100059DB8;
    long long v14 = *data;
    int64_t int64 = xpc_dictionary_get_int64(v5, "batch");
    id v9 = v6;
    id v10 = [v9 peerID];
    id v11 = +[NSString stringWithFormat:@"%@-%lli", v10, int64];

    id v12 = sub_10003D1BC(v9, v5);
    [v12 cancelKey:&v14 forClient:v11];
  }
  else
  {
    long long v14 = 0uLL;
    char v15 = 0;
    id v11 = GEOGetTileLoadingLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)length = 138412290;
      *(void *)&length[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Received wrong length for tileKey from peer %@", length, 0xCu);
    }
  }
}

- (void)reprioritizeKey:(id)a3 fromPeer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  *(void *)length = 0;
  data = (long long *)xpc_dictionary_get_data(v5, "key", (size_t *)length);
  if (*(void *)length != 16)
  {
    long long v15 = 0uLL;
    char v16 = 0;
    id v12 = GEOGetTileLoadingLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)length = 138412290;
      *(void *)&length[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Received wrong length for tileKey from peer %@", length, 0xCu);
    }
    goto LABEL_6;
  }
  char v16 = 1;
  long long v15 = xmmword_100059DB8;
  long long v15 = *data;
  uint64_t int64 = xpc_dictionary_get_uint64(v5, "priority");
  if (uint64)
  {
    int64_t int64 = xpc_dictionary_get_int64(v5, "batch");
    id v10 = v6;
    id v11 = [v10 peerID];
    id v12 = +[NSString stringWithFormat:@"%@-%lli", v11, int64];

    BOOL v13 = sub_10003D1BC(v10, v5);
    [v13 reprioritizeKey:&v15 forClient:v12 newPriority:uint64];

LABEL_6:
  }
}

- (void)canShrinkBySize:(id)a3 fromPeer:(id)a4
{
}

- (void)canShrinkBySizeSync:(id)a3 fromPeer:(id)a4
{
}

- (void)_canShrinkBySize:(id)a3 fromPeer:(id)a4 synchronous:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(GEOTileServer *)self daemon];
  id v11 = [v10 serverQueue];
  dispatch_assert_queue_V2(v11);

  xpc_object_t reply = xpc_dictionary_create_reply(v8);
  if (reply)
  {
    BOOL v13 = xpc_dictionary_get_remote_connection(v8);
    uint64_t v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    BOOL v19 = sub_10003D6A4;
    v20 = &unk_100072EA8;
    id v21 = reply;
    id v14 = v13;
    id v22 = v14;
    long long v15 = objc_retainBlock(&v17);
    sub_10003D1BC(v9, v8);
    if (v5) {
      char v16 = {;
    }
      ((void (*)(void ***, id))v15[2])(v15, objc_msgSend(v16, "calculateFreeableSizeSync", v17, v18, v19, v20, v21));
    }
    else {
      char v16 = {;
    }
      objc_msgSend(v16, "calculateFreeableSizeWithCallbackQ:finished:", self->_queue, v15, v17, v18, v19, v20, v21);
    }
  }
}

- (void)shrinkDB:(id)a3 fromPeer:(id)a4
{
}

- (void)shrinkDBSync:(id)a3 fromPeer:(id)a4
{
}

- (void)_shrinkDB:(id)a3 fromPeer:(id)a4 synchronous:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(GEOTileServer *)self daemon];
  id v11 = [v10 serverQueue];
  dispatch_assert_queue_V2(v11);

  xpc_object_t reply = xpc_dictionary_create_reply(v8);
  BOOL v13 = reply;
  if (reply)
  {
    BOOL v32 = v5;
    __int16 v34 = reply;
    uint64_t v33 = xpc_dictionary_get_remote_connection(v8);
    id v35 = v8;
    id v30 = self;
    uint64_t int64 = xpc_dictionary_get_uint64(v8, "sz");
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v14 = [(GEOTileServer *)self daemon];
    long long v15 = [v14 peers];

    id v16 = [v15 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = 0;
      v36 = 0;
      uint64_t v19 = *(void *)v41;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v41 != v19) {
            objc_enumerationMutation(v15);
          }
          id v21 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          id v22 = [v9 bundleIdentifier];
          long long v23 = [v21 bundleIdentifier];
          if ([v22 isEqual:v23])
          {
          }
          else
          {
            unsigned __int8 v24 = [v21 isLocationd];

            if ((v24 & 1) == 0)
            {
              long long v25 = v36;
              if (!v36)
              {
                long long v25 = +[NSMutableString string];
              }
              long long v26 = [v21 bundleIdentifier];
              v36 = v25;
              [v25 appendFormat:@"%@, ", v26];

              ++v18;
            }
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v17);
    }
    else
    {
      uint64_t v18 = 0;
      v36 = 0;
    }

    objc_msgSend(v36, "deleteCharactersInRange:", (char *)objc_msgSend(v36, "length") - 2, 2);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10003DAB4;
    v37[3] = &unk_100072EA8;
    BOOL v13 = v34;
    id v38 = v34;
    id v27 = v33;
    id v39 = v27;
    id v28 = objc_retainBlock(v37);
    if (v18
      && ([v9 hasEntitlement:@"com.apple.geoservices.shrinkdb.force"] & 1) == 0)
    {
      NSLog(@"Refusing to shrink tile db because there are clients: %@", v36);
      ((void (*)(void *, void))v28[2])(v28, 0);
      id v8 = v35;
    }
    else
    {
      id v8 = v35;
      id v29 = sub_10003D1BC(v9, v35);
      if (v32) {
        ((void (*)(void *, id))v28[2])(v28, [v29 shrinkDiskCacheToSizeSync:uint64]);
      }
      else {
        [v29 shrinkDiskCacheToSize:uint64 callbackQ:v30->_queue finished:v28];
      }
    }
  }
}

- (void)corrupt:(id)a3 fromPeer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  size_t length = 0;
  data = xpc_dictionary_get_data(v5, "key", &length);
  if (length == 16)
  {
    char v11 = 1;
    *(_OWORD *)buf = xmmword_100059DB8;
    *(_OWORD *)buf = *data;
    id v8 = sub_10003D1BC(v6, v5);
    [v8 reportCorruptTile:buf];
  }
  else
  {
    id v8 = GEOGetTileLoadingLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "Peer %@ provided incorrect tile key data for corrupt data", buf, 0xCu);
    }
  }
}

- (void)beginPreload:(id)a3 fromPeer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GEOTileServer *)self daemon];
  id v9 = [v8 serverQueue];
  dispatch_assert_queue_V2(v9);

  uint64_t int64 = xpc_dictionary_get_uint64(v7, "sz");
  [v6 setPreloading:1];
  sub_10003D1BC(v6, v7);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  char v11 = [v6 peerID];

  [v12 beginPreloadSessionOfSize:uint64 forClient:v11];
}

- (void)endPreload:(id)a3 fromPeer:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ([v5 preloading])
  {
    [v5 setPreloading:0];
    id v6 = sub_10003D1BC(v5, v8);
    id v7 = [v5 peerID];
    [v6 endPreloadSessionForClient:v7];
  }
}

- (void)peerDidConnect:(id)a3
{
  id v3 = a3;
  id v5 = +[GEOTileLoader modernLoader];
  objc_super v4 = [v3 peerID];

  [v5 openForClient:v4];
}

- (void)_receivedTile:(void *)a3 error:(void *)a4 info:(void *)a5 forKey:(const void *)a6 forPeer:(void *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  long long v15 = [a1 daemon];
  id v16 = [v15 serverQueue];
  dispatch_assert_queue_V2(v16);

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v17 = [a1 daemon];
  uint64_t v18 = [v17 peers];

  id v19 = [v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v19)
  {
    id v22 = 0;
LABEL_24:

    goto LABEL_25;
  }
  id v20 = v19;
  v36 = v13;
  size_t v37 = v12;
  id v21 = v11;
  id v22 = 0;
  uint64_t v23 = *(void *)v40;
  do
  {
    for (i = 0; i != v20; i = (char *)i + 1)
    {
      if (*(void *)v40 != v23) {
        objc_enumerationMutation(v18);
      }
      long long v25 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      long long v26 = [v25 peerID];
      unsigned int v27 = [v14 isEqualToString:v26];

      if (v27)
      {
        id v28 = v25;

        id v22 = v28;
      }
    }
    id v20 = [v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
  }
  while (v20);

  id v11 = v21;
  if (v22)
  {
    id v13 = v36;
    id v12 = v37;
    if (!v37
      || [v37 code] != (id)-2
      || ([v37 domain],
          id v29 = objc_claimAutoreleasedReturnValue(),
          GEOErrorDomain(),
          id v30 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v31 = [v29 isEqualToString:v30],
          v30,
          v29,
          (v31 & 1) == 0))
    {
      uint64_t v18 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_data(v18, "tileKey", a6, 0x10uLL);
      if (v11)
      {
        xpc_dictionary_set_string(v18, "event", "tiles.tile");
        xpc_object_t v32 = xpc_dictionary_create(0, 0, 0);
        [v11 encodeToXPCDictionary:v32];
        uint64_t v33 = "tileData";
      }
      else
      {
        xpc_dictionary_set_string(v18, "event", "tiles.err");
        xpc_object_t v32 = objc_msgSend(v37, "_geo_newXPCData");
        if (!v32)
        {
LABEL_21:

          if (v36)
          {
            id v34 = objc_msgSend(v36, "_geo_newXPCObject");
            xpc_dictionary_set_value(v18, "tileInfo", v34);
          }
          id v35 = [v22 connection];
          [v35 sendMessage:v18];

          goto LABEL_24;
        }
        uint64_t v33 = "err";
      }
      xpc_dictionary_set_value(v18, v33, v32);
      goto LABEL_21;
    }
  }
  else
  {
    id v13 = v36;
    id v12 = v37;
  }
LABEL_25:
}

- (void)tileLoader:(id)a3 submittedTilesToNetwork:(id)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(GEOTileServer *)self daemon];
  id v12 = [v11 serverQueue];
  dispatch_assert_queue_V2(v12);

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = [(GEOTileServer *)self daemon];
  id v14 = [v13 peers];

  id v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v15)
  {
    uint64_t v18 = v14;
    goto LABEL_13;
  }
  id v16 = v15;
  id v28 = v9;
  id v17 = v8;
  uint64_t v18 = 0;
  uint64_t v19 = *(void *)v30;
  do
  {
    for (i = 0; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v30 != v19) {
        objc_enumerationMutation(v14);
      }
      id v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      id v22 = [v21 peerID];
      unsigned int v23 = [v10 isEqualToString:v22];

      if (v23)
      {
        id v24 = v21;

        uint64_t v18 = v24;
      }
    }
    id v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
  }
  while (v16);

  id v8 = v17;
  id v9 = v28;
  if (v18)
  {
    xpc_object_t v25 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v25, "event", "tiles.net");
    id v26 = [v28 newXPCData];
    xpc_dictionary_set_value(v25, "list", v26);
    unsigned int v27 = [v18 connection];
    [v27 sendMessage:v25];

LABEL_13:
  }
}

- (void)enumerateTiles:(id)a3 fromPeer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t reply = xpc_dictionary_create_reply(v6);
  id v9 = reply;
  if (reply)
  {
    id v10 = xpc_dictionary_get_remote_connection(reply);
    if (v10)
    {
      BOOL v11 = xpc_dictionary_get_BOOL(v6, "include_data");
      id v12 = dispatch_group_create();
      id v13 = sub_10003D1BC(v7, v6);
      queue = self->_queue;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10003E540;
      v20[3] = &unk_100072ED0;
      BOOL v22 = v11;
      id v15 = v10;
      id v21 = v15;
      [v13 enumerateAllKeysIncludingData:v11 onQueue:queue group:v12 dataHandler:v20];

      id v16 = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003E6A0;
      block[3] = &unk_100071888;
      id v18 = v15;
      id v19 = v9;
      dispatch_group_notify(v12, v16, block);
    }
  }
}

- (void)runBackgroundTask:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  GEOBackgroundTaskReportReportTaskInitiated();

  id v6 = [v4 identifier];
  unsigned int v7 = [v6 isEqualToString:GEOProactiveTileDownloaderTaskIdentifier];

  if (v7)
  {
    id v8 = +[GEOTileLoader modernLoader];
    id v9 = [v8 proxy];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 runOpportunisticTileDownloader:v4];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      sub_10004D08C();
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOTileServer;
    [(GEOTileServer *)&v10 runBackgroundTask:v4];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_pendingPeerToClientIdentifiers, 0);
}

@end