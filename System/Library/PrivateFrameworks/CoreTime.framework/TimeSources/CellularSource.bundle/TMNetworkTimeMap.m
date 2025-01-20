@interface TMNetworkTimeMap
- (BOOL)timeZone:(id)a3 matchesMcc:(int)a4;
- (BOOL)timeZone:(id)a3 matchesOffset:(int)a4 dst:(BOOL)a5 date:(id)a6;
- (BOOL)timeZone:(id)a3 matchesOffset:(int)a4 dst:(BOOL)a5 mcc:(int)a6 time:(double)a7;
- (NSDictionary)networkMap;
- (TMNetworkTimeMap)initWithDictionary:(id)a3;
- (TMNetworkTimeMap)initWithUrl:(id)a3;
- (id)etcGmtZoneForOffset:(int)a3 dst:(BOOL)a4 mcc:(int)a5 time:(double)a6;
- (id)timeZonesWithMcc:(int)a3;
- (id)timeZonesWithOffset:(int)a3 dst:(BOOL)a4 mcc:(int)a5 time:(double)a6;
- (void)dealloc;
- (void)setNetworkMap:(id)a3;
@end

@implementation TMNetworkTimeMap

- (TMNetworkTimeMap)initWithUrl:(id)a3
{
  if (a3) {
    a3 = +[NSDictionary dictionaryWithContentsOfURL:](NSDictionary, "dictionaryWithContentsOfURL:");
  }

  return [(TMNetworkTimeMap *)self initWithDictionary:a3];
}

- (TMNetworkTimeMap)initWithDictionary:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TMNetworkTimeMap;
  v4 = [(TMNetworkTimeMap *)&v7 init];
  v5 = v4;
  if (v4) {
    [(TMNetworkTimeMap *)v4 setNetworkMap:a3];
  }
  return v5;
}

- (void)dealloc
{
  [(TMNetworkTimeMap *)self setNetworkMap:0];
  v3.receiver = self;
  v3.super_class = (Class)TMNetworkTimeMap;
  [(TMNetworkTimeMap *)&v3 dealloc];
}

- (BOOL)timeZone:(id)a3 matchesOffset:(int)a4 dst:(BOOL)a5 mcc:(int)a6 time:(double)a7
{
  uint64_t v7 = *(void *)&a6;
  BOOL v8 = a5;
  uint64_t v9 = *(void *)&a4;
  v12 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a7];
  unsigned int v13 = objc_msgSend(-[TMNetworkTimeMap timeZonesWithMcc:](self, "timeZonesWithMcc:", v7), "containsObject:", a3);
  if (v13)
  {
    LOBYTE(v13) = [(TMNetworkTimeMap *)self timeZone:a3 matchesOffset:v9 dst:v8 date:v12];
  }
  return v13;
}

- (BOOL)timeZone:(id)a3 matchesMcc:(int)a4
{
  if (!a4) {
    return 1;
  }
  id v5 = [(TMNetworkTimeMap *)self timeZonesWithMcc:*(void *)&a4];
  if (![v5 count]) {
    return 1;
  }

  return [v5 containsObject:a3];
}

- (id)timeZonesWithOffset:(int)a3 dst:(BOOL)a4 mcc:(int)a5 time:(double)a6
{
  uint64_t v6 = *(void *)&a5;
  BOOL v7 = a4;
  uint64_t v8 = *(void *)&a3;
  v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a6];
  id v11 = [(TMNetworkTimeMap *)self timeZonesWithMcc:v6];
  id v12 = [v11 mutableCopy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        if (!-[TMNetworkTimeMap timeZone:matchesOffset:dst:date:](self, "timeZone:matchesOffset:dst:date:", v17, v8, v7, v10))[v12 removeObject:v17]; {
      }
        }
      id v14 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }
  if ([v12 count]) {
    return v12;
  }

  return 0;
}

- (id)etcGmtZoneForOffset:(int)a3 dst:(BOOL)a4 mcc:(int)a5 time:(double)a6
{
  BOOL v8 = a4;
  uint64_t v9 = *(void *)&a3;
  id v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  id v12 = [(NSDictionary *)[(TMNetworkTimeMap *)self networkMap] objectForKey:&stru_8608];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = [v12 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v21;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v21 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void **)(*((void *)&v20 + 1) + 8 * v16);
      if ([(TMNetworkTimeMap *)self timeZone:v17 matchesOffset:v9 dst:0 date:v11])
      {
        break;
      }
      if (v14 == (id)++v16)
      {
        id v14 = [v12 countByEnumeratingWithState:&v20 objects:v32 count:16];
        if (v14) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v18 = BBTIME_FACILITY;
    if (os_log_type_enabled((os_log_t)BBTIME_FACILITY, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109888;
      int v25 = v9;
      __int16 v26 = 1024;
      BOOL v27 = v8;
      __int16 v28 = 1024;
      int v29 = a5;
      __int16 v30 = 2048;
      double v31 = a6;
      _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "Failed to map to Etc/GMT+? value with offset %d dst %d mcc %d %.2f", buf, 0x1Eu);
    }
    return 0;
  }
  return v17;
}

- (id)timeZonesWithMcc:(int)a3
{
  id v3 = [(NSDictionary *)[(TMNetworkTimeMap *)self networkMap] objectForKey:[+[NSNumber numberWithInt:*(void *)&a3] stringValue]];

  return +[NSOrderedSet orderedSetWithArray:v3];
}

- (BOOL)timeZone:(id)a3 matchesOffset:(int)a4 dst:(BOOL)a5 date:(id)a6
{
  BOOL v7 = a5;
  uint64_t v9 = +[NSTimeZone timeZoneWithName:a3];
  BOOL result = 0;
  if (v9)
  {
    v10 = v9;
    if ((id)[(NSTimeZone *)v9 secondsFromGMTForDate:a6] == (id)(60 * a4)
      && [(NSTimeZone *)v10 isDaylightSavingTimeForDate:a6] == v7)
    {
      return 1;
    }
  }
  return result;
}

- (NSDictionary)networkMap
{
  return self->networkMap;
}

- (void)setNetworkMap:(id)a3
{
}

@end