@interface GEOComposedRouteLaneInfo
+ (id)_debug_laneWithDirections:(id)a3 good:(BOOL)a4 preferred:(BOOL)a5;
+ (id)_debug_straightLane;
@end

@implementation GEOComposedRouteLaneInfo

+ (id)_debug_laneWithDirections:(id)a3 good:(BOOL)a4 preferred:(BOOL)a5
{
  id v7 = a3;
  id v8 = objc_alloc_init((Class)GEOComposedRouteLaneInfo);
  if (v8)
  {
    v9 = +[NSMutableArray array];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v19 = v7;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v16 = objc_alloc_init((Class)GEOLaneArrowhead);
          objc_msgSend(v16, "setCategory:", objc_msgSend(v15, "integerValue"));
          id v17 = [objc_alloc((Class)GEOComposedRouteLaneDirectionInfo) initWithLaneArrowHead:v16];
          [v9 addObject:v17];
        }
        id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    [v8 setDirections:v9];
    *((unsigned char *)v8 + OBJC_IVAR___GEOComposedRouteLaneInfo__good) = a4;
    *((unsigned char *)v8 + OBJC_IVAR___GEOComposedRouteLaneInfo__preferred) = a5;

    id v7 = v19;
  }

  return v8;
}

+ (id)_debug_straightLane
{
  return objc_msgSend(a1, "_debug_laneWithDirections:good:preferred:", &off_100088590, 0, 0);
}

@end