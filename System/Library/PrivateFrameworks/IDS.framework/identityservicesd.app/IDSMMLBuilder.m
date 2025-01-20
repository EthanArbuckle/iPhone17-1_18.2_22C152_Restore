@interface IDSMMLBuilder
+ (id)mmlsFromAggregates:(id)a3 service:(id)a4 sendMode:(id)a5 guid:(id)a6;
@end

@implementation IDSMMLBuilder

+ (id)mmlsFromAggregates:(id)a3 service:(id)a4 sendMode:(id)a5 guid:(id)a6
{
  id v9 = a3;
  id v29 = a4;
  id v28 = a5;
  id v10 = a6;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  v12 = [v9 firstObject];
  id v13 = [v12 maxSize];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v9;
  id v14 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v31;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        if ([v11 count]
          && ([v11 lastObject],
              v20 = objc_claimAutoreleasedReturnValue(),
              unsigned int v21 = [v20 hasSpaceForAggregateMessage:v19],
              v20,
              v21))
        {
          v22 = [v11 lastObject];
          [(IDSMMLMessage *)v22 addAggregateMessage:v19];
        }
        else
        {
          ++v16;
          v22 = [[IDSMMLMessage alloc] initWithSendMode:v28 topic:v29 maxSize:v13];
          [(IDSMMLMessage *)v22 addAggregateMessage:v19];
          v23 = +[NSNumber numberWithInteger:v16];
          [(IDSMMLMessage *)v22 setChunkNumber:v23];

          [(IDSMMLMessage *)v22 setIdentifier:v10];
          [v11 addObject:v22];
        }
      }
      id v15 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v15);
  }

  v24 = +[IDSFoundationLog delivery];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = [v11 count];
    *(_DWORD *)buf = 138413058;
    id v35 = v10;
    __int16 v36 = 2048;
    id v37 = v25;
    __int16 v38 = 2112;
    id v39 = v29;
    __int16 v40 = 2112;
    id v41 = v28;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Finished creating MMLs { mmlGUID : %@ count : %ld service : %@ sendMode : %@ }", buf, 0x2Au);
  }

  return v11;
}

@end