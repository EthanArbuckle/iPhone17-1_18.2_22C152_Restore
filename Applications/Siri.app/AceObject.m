@interface AceObject
- (BOOL)_afui_updateMapsAnalytics;
- (id)_afui_mapsRelatedChild;
- (id)_afui_mapsRelatedChildren;
@end

@implementation AceObject

- (id)_afui_mapsRelatedChild
{
  return 0;
}

- (id)_afui_mapsRelatedChildren
{
  return 0;
}

- (BOOL)_afui_updateMapsAnalytics
{
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v3 = [(AceObject *)self extSessionGuid];
    uint64_t v4 = [(AceObject *)self extSessionGuidCreatedTimestamp];
    v5 = (void *)v4;
    if (v3 && v4)
    {
      v6 = +[GEOUserSession sharedInstance];
      id v7 = objc_alloc_init((Class)GEOUserSessionEntity);
      [v7 updateSessionIDFromUUIDString:v3];
      [v5 timeIntervalSinceReferenceDate];
      [v7 setSessionCreationTime:];
      v8 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        v10 = objc_opt_class();
        id v11 = v10;
        v12 = [(AceObject *)self aceId];
        *(_DWORD *)buf = 136315906;
        v26 = "-[AceObject(MapsSession) _afui_updateMapsAnalytics]";
        __int16 v27 = 2112;
        id v28 = v7;
        __int16 v29 = 2112;
        v30 = v10;
        __int16 v31 = 2112;
        v32 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Setting maps user session to %@ from <%@ %@>", buf, 0x2Au);
      }
      LOBYTE(v13) = 1;
      [v6 setSharedMapsUserSessionEntity:v7 shareSessionIDWithMaps:1];

LABEL_23:
      return (char)v13;
    }
    v14 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000BA83C((uint64_t)self, v14);
    }
  }
  v15 = [(AceObject *)self _afui_mapsRelatedChild];
  unsigned __int8 v16 = [v15 _afui_updateMapsAnalytics];

  if ((v16 & 1) == 0)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v3 = [(AceObject *)self _afui_mapsRelatedChildren];
    id v13 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v17 = *(void *)v21;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v3);
          }
          if (objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "_afui_updateMapsAnalytics"))
          {
            LOBYTE(v13) = 1;
            goto LABEL_23;
          }
        }
        id v13 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    goto LABEL_23;
  }
  LOBYTE(v13) = 1;
  return (char)v13;
}

@end