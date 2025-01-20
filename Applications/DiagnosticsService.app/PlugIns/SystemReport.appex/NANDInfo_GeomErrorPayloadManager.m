@interface NANDInfo_GeomErrorPayloadManager
- (BOOL)hasNewErrors;
- (BOOL)invalid_error_payload;
- (BOOL)iteratePerPageDictsForMaxPagesWithStatus:(unsigned int)a3 iteratorCallBack:(id)a4;
- (NANDInfo_GeomErrorPayloadManager)initWithPayloadBuf:(char *)a3 bufSize:(unint64_t)a4 prevNumErrors:(unsigned int)a5;
- (NSMutableArray)error_pages_array;
- (NSMutableArray)error_payload_array;
- (NSMutableDictionary)other_stats_dict;
- (id)dictionaryRepresentation;
- (unsigned)num_errors_in_payload_cur;
- (unsigned)num_errors_in_payload_prev;
- (void)parseErrorPayloadBuf:(char *)a3 bufSize:(unint64_t)a4;
- (void)populateOtherStats:(id)a3;
- (void)setError_pages_array:(id)a3;
- (void)setError_payload_array:(id)a3;
- (void)setInvalid_error_payload:(BOOL)a3;
- (void)setNum_errors_in_payload_cur:(unsigned int)a3;
- (void)setNum_errors_in_payload_prev:(unsigned int)a3;
- (void)setOther_stats_dict:(id)a3;
@end

@implementation NANDInfo_GeomErrorPayloadManager

- (NANDInfo_GeomErrorPayloadManager)initWithPayloadBuf:(char *)a3 bufSize:(unint64_t)a4 prevNumErrors:(unsigned int)a5
{
  v22.receiver = self;
  v22.super_class = (Class)NANDInfo_GeomErrorPayloadManager;
  v8 = [(NANDInfo_GeomErrorPayloadManager *)&v22 init];
  v9 = v8;
  v10 = 0;
  if (a4 >= 4 && v8)
  {
    v8->_invalid_error_payload = 0;
    v8->_num_errors_in_payload_prev = a5;
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    error_payload_array = v9->_error_payload_array;
    v9->_error_payload_array = v11;

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    error_pages_array = v9->_error_pages_array;
    v9->_error_pages_array = v13;

    other_stats_dict = v9->_other_stats_dict;
    v9->_other_stats_dict = 0;

    int v16 = *(_DWORD *)a3;
    if (*(_DWORD *)a3)
    {
      unsigned int v17 = 0;
      v18 = a3 + 4;
      unsigned int v19 = 4;
      do
      {
        uint64_t v20 = *((unsigned __int16 *)v18 + 1) + 4;
        v19 += v20;
        if (a4 < v19) {
          break;
        }
        v17 += *((unsigned __int16 *)v18 + 11) + ((v18[12] >> 1) & 1);
        v18 += v20;
        --v16;
      }
      while (v16);
    }
    else
    {
      unsigned int v17 = 0;
    }
    v9->_num_errors_in_payload_cur = v17;
    syslog(5, "total %u geom error entries. Previous %u", [(NANDInfo_GeomErrorPayloadManager *)v9 num_errors_in_payload_cur], [(NANDInfo_GeomErrorPayloadManager *)v9 num_errors_in_payload_prev]);
    v10 = v9;
  }

  return v10;
}

- (void)parseErrorPayloadBuf:(char *)a3 bufSize:(unint64_t)a4
{
  if (!a3 || a4 <= 3)
  {
    syslog(3, "Error: invalid geom error payload buffer");
    [(NANDInfo_GeomErrorPayloadManager *)self setInvalid_error_payload:1];
    return;
  }
  int v7 = *(_DWORD *)a3;
  syslog(5, "total %u geom error entries", *(_DWORD *)a3);
  int v51 = v7;
  if (!v7) {
    return;
  }
  v8 = 0;
  v9 = 0;
  v52 = &a3[a4];
  uint64_t v10 = 0;
  v11 = a3 + 4;
  v50 = self;
  while (v52 >= v11 || v52 >= &v11[*((unsigned __int16 *)v11 + 1) + 4])
  {
    syslog(5, "Geom error idx %d", v10);
    if (*(_WORD *)v11)
    {
      syslog(3, "Error: entry %u mismatch in expected block tlv type");
      goto LABEL_34;
    }
    if (*((_WORD *)v11 + 2) != 1)
    {
      syslog(3, "Error: entry %u mismatch in expected err header tlv type");
      goto LABEL_34;
    }
    v12 = &v11[*((unsigned __int16 *)v11 + 3) + 8];
    if (*(_WORD *)v12 != 2)
    {
      syslog(3, "Error: entry %u mismatch in expected payload header tlv type");
      goto LABEL_34;
    }
    uint64_t v13 = *(unsigned __int16 *)(v11 + 15);
    v14 = v12 + 4;
    unint64_t v15 = (unint64_t)&v11[*((unsigned __int16 *)v11 + 1) + 4];
    if (v15 < (unint64_t)&v12[((unint64_t)(v13 + 3) >> 2) + 4])
    {
      syslog(3, "Error: entry %u end of geom error page status exceeds entry end");
      goto LABEL_34;
    }
    if (v15 > (unint64_t)v52)
    {
      syslog(3, "Error: entry %u end of geom error entry exceeds buffer end");
      goto LABEL_34;
    }
    uint64_t v53 = (uint64_t)&v11[*((unsigned __int16 *)v11 + 1) + 4];
    id v16 = objc_alloc_init((Class)NSMutableDictionary);

    unsigned int v17 = +[NSNumber numberWithUnsignedInt:v10];
    [v16 setObject:v17 forKeyedSubscript:@"ESR_header_i"];

    v18 = +[NSNumber numberWithUnsignedInt:*((_DWORD *)v11 + 2) & 0xF];
    [v16 setObject:v18 forKeyedSubscript:@"msp"];

    unsigned int v19 = +[NSNumber numberWithUnsignedInt:(*((_DWORD *)v11 + 2) >> 4) & 1];
    [v16 setObject:v19 forKeyedSubscript:@"channel"];

    uint64_t v20 = +[NSNumber numberWithUnsignedInt:(*((_DWORD *)v11 + 2) >> 5) & 0xF];
    [v16 setObject:v20 forKeyedSubscript:@"die"];

    v21 = +[NSNumber numberWithUnsignedInt:(*((_DWORD *)v11 + 2) >> 9) & 7];
    [v16 setObject:v21 forKeyedSubscript:@"plane"];

    objc_super v22 = +[NSNumber numberWithUnsignedInt:(*((_DWORD *)v11 + 2) >> 12) & 0x7FFF];
    [v16 setObject:v22 forKeyedSubscript:@"bork"];

    v23 = +[NSNumber numberWithUnsignedInt:*((_DWORD *)v11 + 2) >> 27];
    [v16 setObject:v23 forKeyedSubscript:@"reason"];

    v24 = +[NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(v11 + 13)];
    [v16 setObject:v24 forKeyedSubscript:@"failPage"];

    v25 = +[NSNumber numberWithUnsignedInt:v13];
    [v16 setObject:v25 forKeyedSubscript:@"numOfPages"];

    v26 = +[NSNumber numberWithUnsignedChar:v11[17]];
    [v16 setObject:v26 forKeyedSubscript:@"mode"];

    v27 = +[NSNumber numberWithUnsignedChar:(v11[12] >> 1) & 1];
    [v16 setObject:v27 forKeyedSubscript:@"reliability"];

    unsigned int v28 = v11[12] >> 2;
    if (v28 >= 4)
    {
      v29 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v11 + 25)];
      [v16 setObject:v29 forKeyedSubscript:@"cycles"];

      v30 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v11 + 29)];
      [v16 setObject:v30 forKeyedSubscript:@"age"];

      v31 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(v11 + 33)];
      [v16 setObject:v31 forKeyedSubscript:@"timeStamp"];

      v32 = +[NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(v11 + 69)];
      [v16 setObject:v32 forKeyedSubscript:@"readDisturbCounter"];

      v33 = +[NSNumber numberWithUnsignedChar:v11[71]];
      [v16 setObject:v33 forKeyedSubscript:@"flow"];

      v34 = +[NSNumber numberWithUnsignedChar:v11[72]];
      [v16 setObject:v34 forKeyedSubscript:@"minTemp"];

      v35 = +[NSNumber numberWithUnsignedChar:v11[73]];
      [v16 setObject:v35 forKeyedSubscript:@"maxTemp"];

      v36 = +[NSNumber numberWithUnsignedChar:v11[24] & 1];
      [v16 setObject:v36 forKeyedSubscript:@"openBlock"];

LABEL_15:
      v37 = +[NSNumber numberWithUnsignedShort:*((unsigned __int16 *)v11 + 10)];
      [v16 setObject:v37 forKeyedSubscript:@"numScannedPages"];

      v38 = +[NSNumber numberWithUnsignedShort:*((unsigned __int16 *)v11 + 11)];
      [v16 setObject:v38 forKeyedSubscript:@"numFailures"];

      goto LABEL_16;
    }
    if (v28 == 3) {
      goto LABEL_15;
    }
LABEL_16:
    int v54 = v10;
    id v39 = objc_alloc_init((Class)NSMutableArray);

    if (v13)
    {
      char v40 = 0;
      uint64_t v41 = 0;
      do
      {
        uint64_t v42 = (*((unsigned __int8 *)v14 + ((unint64_t)v41 >> 2)) >> (v40 & 6)) & 3;
        if (v41 == *(unsigned __int16 *)(v11 + 13))
        {
          v43 = +[NSNumber numberWithUnsignedInt:(*((unsigned __int8 *)v14 + ((unint64_t)v41 >> 2)) >> (v40 & 6)) & 3];
          [v16 setObject:v43 forKeyedSubscript:@"failPageStatus"];
        }
        if (v42)
        {
          v55[0] = @"ESR_page_i";
          v44 = +[NSNumber numberWithUnsignedInt:v41];
          v55[1] = @"ESR_page_i_status";
          v56[0] = v44;
          v45 = +[NSNumber numberWithUnsignedInt:v42];
          v56[1] = v45;
          v46 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
          [v39 addObject:v46];
        }
        uint64_t v41 = (v41 + 1);
        v40 += 2;
      }
      while (v13 != v41);
    }
    v47 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v39 count]);
    [v16 setObject:v47 forKeyedSubscript:@"ESR_numFailedPages"];

    self = v50;
    v48 = [(NANDInfo_GeomErrorPayloadManager *)v50 error_payload_array];
    [v48 addObject:v16];

    v49 = [(NANDInfo_GeomErrorPayloadManager *)v50 error_pages_array];
    [v49 addObject:v39];

    v11 = (char *)v53;
    uint64_t v10 = (v54 + 1);
    v8 = v16;
    v9 = v39;
    if (v10 == v51)
    {

      return;
    }
  }
  syslog(3, "Error: entry %u end of geom error header exceeds buffer end");
LABEL_34:
  [(NANDInfo_GeomErrorPayloadManager *)self setInvalid_error_payload:1];
}

- (void)populateOtherStats:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    [(NANDInfo_GeomErrorPayloadManager *)self setOther_stats_dict:v5];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [&off_1000B6E50 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      id v8 = 0;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        v11 = v8;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(&off_1000B6E50);
          }
          id v8 = *(id *)(*((void *)&v15 + 1) + 8 * (void)v10);

          v12 = [v4 objectForKeyedSubscript:v8];

          if (v12)
          {
            uint64_t v13 = [v4 objectForKeyedSubscript:v8];
            v14 = [(NANDInfo_GeomErrorPayloadManager *)self other_stats_dict];
            [v14 setObject:v13 forKeyedSubscript:v8];
          }
          uint64_t v10 = (char *)v10 + 1;
          v11 = v8;
        }
        while (v7 != v10);
        id v7 = [&off_1000B6E50 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)iteratePerPageDictsForMaxPagesWithStatus:(unsigned int)a3 iteratorCallBack:(id)a4
{
  id v5 = (uint64_t (**)(id, id))a4;
  if ([(NANDInfo_GeomErrorPayloadManager *)self invalid_error_payload]) {
    goto LABEL_30;
  }
  uint64_t v6 = [(NANDInfo_GeomErrorPayloadManager *)self error_payload_array];
  if (!v6) {
    goto LABEL_30;
  }
  id v7 = (void *)v6;
  uint64_t v8 = [(NANDInfo_GeomErrorPayloadManager *)self error_pages_array];
  if (!v8)
  {

    goto LABEL_30;
  }
  uint64_t v9 = (void *)v8;
  uint64_t v10 = [(NANDInfo_GeomErrorPayloadManager *)self other_stats_dict];

  if (!v10)
  {
LABEL_30:
    syslog(3, "ERROR: Missing valid input data");
    BOOL v41 = 0;
    goto LABEL_31;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v11 = [(NANDInfo_GeomErrorPayloadManager *)self error_payload_array];
  id v47 = [v11 countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v47)
  {
    unsigned int v52 = 0;
    v12 = 0;
    uint64_t v13 = 0;
    id v14 = 0;
    id v15 = 0;
    uint64_t v48 = *(void *)v60;
    v44 = v11;
    v46 = self;
    while (2)
    {
      uint64_t v16 = 0;
      long long v17 = v13;
      long long v18 = v14;
      do
      {
        if (*(void *)v60 != v48)
        {
          uint64_t v19 = v16;
          objc_enumerationMutation(v11);
          uint64_t v16 = v19;
        }
        uint64_t v49 = v16;
        id v20 = *(id *)(*((void *)&v59 + 1) + 8 * v16);

        v21 = [(NANDInfo_GeomErrorPayloadManager *)self error_pages_array];
        id v22 = [v21 count];

        if ((unint64_t)v22 <= v52)
        {
          syslog(3, "ERROR: error pages array smaller than payload array!");
          BOOL v41 = 0;
          id v14 = v18;
          uint64_t v13 = v17;
          goto LABEL_36;
        }
        int v51 = v20;
        id v14 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v20 copyItems:1];

        [(NANDInfo_GeomErrorPayloadManager *)self error_pages_array];
        v24 = v23 = self;
        uint64_t v13 = [v24 objectAtIndexedSubscript:v52];

        v25 = [(NANDInfo_GeomErrorPayloadManager *)v23 other_stats_dict];
        [v14 addEntriesFromDictionary:v25];

        if ([v13 count])
        {
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          id obj = v13;
          id v26 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
          if (v26)
          {
            id v27 = v26;
            int v28 = 0;
            uint64_t v29 = *(void *)v56;
            v45 = v13;
            while (2)
            {
              v30 = 0;
              int v31 = v28 + 1;
              int v43 = v28 + v27;
              v32 = v15;
              do
              {
                if (*(void *)v56 != v29) {
                  objc_enumerationMutation(obj);
                }
                id v15 = *(id *)(*((void *)&v55 + 1) + 8 * (void)v30);

                if (v31 + (int)v30 > a3)
                {
                  v11 = v44;
                  uint64_t v13 = v45;
                  goto LABEL_25;
                }
                v33 = [v15 objectForKeyedSubscript:@"ESR_page_i"];
                [v14 setObject:v33 forKeyedSubscript:@"ESR_page_i"];

                v34 = [v15 objectForKeyedSubscript:@"ESR_page_i_status"];
                [v14 setObject:v34 forKeyedSubscript:@"ESR_page_i_status"];

                id v36 = [objc_alloc((Class)NSDictionary) initWithDictionary:v14 copyItems:1];
                int v37 = v5[2](v5, v36);

                if (!v37)
                {
                  syslog(3, "ERROR: failed to run the callBack when iterating error payload pages!");

                  v11 = v44;
                  uint64_t v13 = v45;
                  goto LABEL_33;
                }
                v30 = (char *)v30 + 1;
                v32 = v15;
              }
              while (v27 != v30);
              id v27 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
              v11 = v44;
              uint64_t v13 = v45;
              int v28 = v43;
              if (v27) {
                continue;
              }
              break;
            }
          }

          id v15 = 0;
LABEL_25:
        }
        else
        {
          [v14 setObject:&off_1000B7060 forKeyedSubscript:@"ESR_page_i"];
          [v14 setObject:&off_1000B7060 forKeyedSubscript:@"ESR_page_i_status"];
          id v38 = [objc_alloc((Class)NSDictionary) initWithDictionary:v14 copyItems:1];
          char v39 = v5[2](v5, v38);

          if ((v39 & 1) == 0)
          {
            syslog(3, "ERROR: failed to run the callBack on error entry without error pages!");
LABEL_33:
            BOOL v41 = 0;
            id v20 = v51;
            goto LABEL_36;
          }
        }
        self = v46;
        ++v52;
        uint64_t v16 = v49 + 1;
        v12 = v51;
        long long v17 = v13;
        char v40 = v13;
        long long v18 = v14;
      }
      while ((id)(v49 + 1) != v47);
      v12 = v51;
      uint64_t v13 = v40;
      id v47 = [v11 countByEnumeratingWithState:&v59 objects:v64 count:16];
      if (v47) {
        continue;
      }
      break;
    }

    id v20 = 0;
  }
  else
  {
    id v20 = 0;
    uint64_t v13 = 0;
    id v14 = 0;
    id v15 = 0;
  }
  BOOL v41 = 1;
LABEL_36:

LABEL_31:
  return v41;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  if ([(NANDInfo_GeomErrorPayloadManager *)self invalid_error_payload])
  {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"invalidErrorPayload"];
  }
  else
  {
    id v4 = [(NANDInfo_GeomErrorPayloadManager *)self error_payload_array];
    id v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 count]);
    [v3 setObject:v5 forKeyedSubscript:@"error_count"];

    uint64_t v6 = [(NANDInfo_GeomErrorPayloadManager *)self error_payload_array];
    id v7 = [v6 count];

    if (v7)
    {
      uint64_t v8 = [(NANDInfo_GeomErrorPayloadManager *)self other_stats_dict];

      if (v8)
      {
        uint64_t v9 = [(NANDInfo_GeomErrorPayloadManager *)self other_stats_dict];
        [v3 setObject:v9 forKeyedSubscript:@"other_stats"];
      }
      id v10 = objc_alloc_init((Class)NSMutableArray);
      [v3 setObject:v10 forKeyedSubscript:@"error_payload"];

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id obj = [(NANDInfo_GeomErrorPayloadManager *)self error_payload_array];
      id v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v11)
      {
        id v12 = v11;
        v25 = self;
        id v13 = 0;
        int v14 = 0;
        id v15 = 0;
        uint64_t v16 = *(void *)v27;
        do
        {
          long long v17 = 0;
          long long v18 = v13;
          uint64_t v19 = v15;
          do
          {
            if (*(void *)v27 != v16) {
              objc_enumerationMutation(obj);
            }
            id v15 = *(id *)(*((void *)&v26 + 1) + 8 * (void)v17);

            id v13 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v15 copyItems:1];
            id v20 = [(NANDInfo_GeomErrorPayloadManager *)v25 error_pages_array];
            v21 = [v20 objectAtIndexedSubscript:(v14 + v17)];
            [v13 setObject:v21 forKeyedSubscript:@"page_statuses"];

            id v22 = [v3 objectForKeyedSubscript:@"error_payload"];
            [v22 addObject:v13];

            long long v17 = (char *)v17 + 1;
            long long v18 = v13;
            uint64_t v19 = v15;
          }
          while (v12 != v17);
          id v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
          v14 += (int)v17;
        }
        while (v12);
      }
    }
  }

  return v3;
}

- (BOOL)hasNewErrors
{
  if ([(NANDInfo_GeomErrorPayloadManager *)self invalid_error_payload]) {
    return 0;
  }
  unsigned int v4 = [(NANDInfo_GeomErrorPayloadManager *)self num_errors_in_payload_cur];
  return v4 > [(NANDInfo_GeomErrorPayloadManager *)self num_errors_in_payload_prev];
}

- (NSMutableArray)error_payload_array
{
  return self->_error_payload_array;
}

- (void)setError_payload_array:(id)a3
{
}

- (NSMutableArray)error_pages_array
{
  return self->_error_pages_array;
}

- (void)setError_pages_array:(id)a3
{
}

- (NSMutableDictionary)other_stats_dict
{
  return self->_other_stats_dict;
}

- (void)setOther_stats_dict:(id)a3
{
}

- (unsigned)num_errors_in_payload_cur
{
  return self->_num_errors_in_payload_cur;
}

- (void)setNum_errors_in_payload_cur:(unsigned int)a3
{
  self->_num_errors_in_payload_cur = a3;
}

- (unsigned)num_errors_in_payload_prev
{
  return self->_num_errors_in_payload_prev;
}

- (void)setNum_errors_in_payload_prev:(unsigned int)a3
{
  self->_num_errors_in_payload_prev = a3;
}

- (BOOL)invalid_error_payload
{
  return self->_invalid_error_payload;
}

- (void)setInvalid_error_payload:(BOOL)a3
{
  self->_invalid_error_payload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_other_stats_dict, 0);
  objc_storeStrong((id *)&self->_error_pages_array, 0);

  objc_storeStrong((id *)&self->_error_payload_array, 0);
}

@end