@interface ANAnalyticsDailyAnnouncements
- (ANAnalyticsDailyAnnouncements)init;
- (ANAnalyticsDailyAnnouncements)initWithDictionary:(id)a3;
- (ANAnalyticsDailyAnnouncements)initWithLastAccess:(double)a3;
- (BOOL)shouldReport;
- (NSMutableDictionary)homes;
- (double)lastAccess;
- (id)dictionary;
- (unint64_t)announcementsCount;
- (unint64_t)homesCount;
- (void)incrementCountInHome:(id)a3 group:(id)a4;
- (void)merge:(id)a3;
- (void)setHomes:(id)a3;
- (void)setLastAccess:(double)a3;
@end

@implementation ANAnalyticsDailyAnnouncements

- (ANAnalyticsDailyAnnouncements)init
{
  return [(ANAnalyticsDailyAnnouncements *)self initWithLastAccess:0.0];
}

- (ANAnalyticsDailyAnnouncements)initWithLastAccess:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ANAnalyticsDailyAnnouncements;
  v4 = [(ANAnalyticsDailyAnnouncements *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_lastAccess = a3;
    uint64_t v6 = objc_opt_new();
    homes = v5->_homes;
    v5->_homes = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (ANAnalyticsDailyAnnouncements)initWithDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ANAnalyticsDailyAnnouncements *)self init];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "isEqualToString:", @"lastAccess", (void)v16))
        {
          v12 = [v6 objectForKey:v11];
          [v12 doubleValue];
          v5->_lastAccess = v13;
        }
        else
        {
          homes = v5->_homes;
          v12 = [v6 objectForKey:v11];
          [(NSMutableDictionary *)homes setObject:v12 forKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)dictionary
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = NSNumber;
  [(ANAnalyticsDailyAnnouncements *)self lastAccess];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  [v3 setObject:v5 forKeyedSubscript:@"lastAccess"];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(ANAnalyticsDailyAnnouncements *)self homes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = [(ANAnalyticsDailyAnnouncements *)self homes];
        double v13 = [v12 objectForKey:v11];
        [v3 setObject:v13 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v3;
}

- (void)merge:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v35 = a3;
  id obj = [v35 homes];
  uint64_t v4 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v42;
    uint64_t v30 = *(void *)v42;
    do
    {
      uint64_t v7 = 0;
      uint64_t v31 = v5;
      do
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v41 + 1) + 8 * v7);
        uint64_t v9 = [(ANAnalyticsDailyAnnouncements *)self homes];
        v10 = [v9 objectForKeyedSubscript:v8];

        if (v10)
        {
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          uint64_t v11 = [v35 homes];
          v12 = [v11 objectForKeyedSubscript:v8];

          uint64_t v36 = [v12 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v36)
          {
            uint64_t v33 = v7;
            uint64_t v34 = *(void *)v38;
            do
            {
              for (uint64_t i = 0; i != v36; ++i)
              {
                if (*(void *)v38 != v34) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v14 = *(void *)(*((void *)&v37 + 1) + 8 * i);
                long long v15 = self;
                long long v16 = [(ANAnalyticsDailyAnnouncements *)self homes];
                long long v17 = [v16 objectForKeyedSubscript:v8];
                long long v18 = (void *)[v17 mutableCopy];

                long long v19 = [v18 objectForKeyedSubscript:v14];
                uint64_t v20 = [v35 homes];
                uint64_t v21 = [v20 objectForKeyedSubscript:v8];
                v22 = [v21 objectForKeyedSubscript:v14];

                if (v19)
                {
                  unint64_t v23 = [v19 unsignedIntegerValue];
                  unint64_t v24 = [v22 unsignedIntegerValue];
                  if (v23 <= v24) {
                    unint64_t v25 = v24;
                  }
                  else {
                    unint64_t v25 = v23;
                  }
                  v26 = [NSNumber numberWithUnsignedInteger:v25];
                  [v18 setObject:v26 forKey:v14];
                }
                else
                {
                  [v18 setObject:v22 forKey:v14];
                }
                v27 = [(ANAnalyticsDailyAnnouncements *)v15 homes];
                [v27 setObject:v18 forKeyedSubscript:v8];

                self = v15;
              }
              uint64_t v36 = [v12 countByEnumeratingWithState:&v37 objects:v45 count:16];
            }
            while (v36);
            uint64_t v6 = v30;
            uint64_t v5 = v31;
            uint64_t v7 = v33;
          }
        }
        else
        {
          v12 = [v35 homes];
          v28 = [v12 objectForKeyedSubscript:v8];
          v29 = [(ANAnalyticsDailyAnnouncements *)self homes];
          [v29 setObject:v28 forKeyedSubscript:v8];
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v5);
  }
}

- (unint64_t)announcementsCount
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(ANAnalyticsDailyAnnouncements *)self homes];
  uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  unint64_t v3 = 0;
  if (v19)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v4;
        uint64_t v5 = *(void *)(*((void *)&v25 + 1) + 8 * v4);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v6 = [(ANAnalyticsDailyAnnouncements *)self homes];
        uint64_t v7 = [v6 objectForKeyedSubscript:v5];

        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v22;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v22 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
              double v13 = [(ANAnalyticsDailyAnnouncements *)self homes];
              uint64_t v14 = [v13 objectForKeyedSubscript:v5];
              long long v15 = [v14 objectForKey:v12];

              v3 += [v15 unsignedIntegerValue];
              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v9);
        }

        uint64_t v4 = v20 + 1;
      }
      while (v20 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v19);
  }

  return v3;
}

- (unint64_t)homesCount
{
  v2 = [(ANAnalyticsDailyAnnouncements *)self homes];
  unint64_t v3 = [v2 count];

  return v3;
}

- (BOOL)shouldReport
{
  unint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
  [v3 timeIntervalSince1970];
  double v5 = v4 + -43200.0;

  [(ANAnalyticsDailyAnnouncements *)self lastAccess];
  return v6 < v5;
}

- (void)incrementCountInHome:(id)a3 group:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = ANLogHandleANAnalyticsDailyAnnouncements();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    long long v25 = &stru_1F34A0E10;
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "%@Incrementing announcement count. HomeID=%@, GroupID=%@", buf, 0x20u);
  }

  uint64_t v9 = [v6 UUIDString];
  uint64_t v10 = (void *)v9;
  if (v7 && v9)
  {
    uint64_t v11 = [(ANAnalyticsDailyAnnouncements *)self homes];
    uint64_t v12 = [v11 objectForKeyedSubscript:v10];

    double v13 = [(ANAnalyticsDailyAnnouncements *)self homes];
    uint64_t v14 = v13;
    if (v12)
    {
      long long v15 = [v13 objectForKeyedSubscript:v10];
      long long v16 = [v15 mutableCopy];

      long long v17 = [v16 objectForKeyedSubscript:v7];
      uint64_t v18 = v17;
      if (v17)
      {
        uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "unsignedIntegerValue") + 1);
        [v16 setObject:v19 forKey:v7];
      }
      else
      {
        [v16 setObject:&unk_1F34A9C30 forKey:v7];
      }
      long long v21 = [(ANAnalyticsDailyAnnouncements *)self homes];
      [v21 setObject:v16 forKeyedSubscript:v10];
    }
    else
    {
      id v22 = v7;
      long long v23 = &unk_1F34A9C30;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      [v14 setObject:v20 forKey:v10];

      long long v16 = v14;
    }
  }
  else
  {
    long long v16 = ANLogHandleANAnalyticsDailyAnnouncements();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v25 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v16, OS_LOG_TYPE_FAULT, "%@Failed to increment count due to nil identifiers", buf, 0xCu);
    }
  }
}

- (double)lastAccess
{
  return self->_lastAccess;
}

- (void)setLastAccess:(double)a3
{
  self->_lastAccess = a3;
}

- (NSMutableDictionary)homes
{
  return self->_homes;
}

- (void)setHomes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end